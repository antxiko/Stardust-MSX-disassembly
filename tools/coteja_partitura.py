#!/usr/bin/env python3
"""Confronta la partitura DEDUCIDA del listado con la MEDIDA en el chip.

Esta es la prueba dura del subsistema de sonido. Todo lo que sabemos de la
musica -que hay quince comandos, cuantos bytes de argumento consume cada uno,
que las frases son llamadas con pila, que la tabla de 0xE6E3 son 96 notas y que
antes de indexarla se suma una transposicion- es deduccion sobre bytes. Aqui se
ejecuta esa deduccion cuadro a cuadro y se compara, nota a nota, contra lo que
el emulador vio entrar en el PSG.

Por que cuadro a cuadro y no nota a nota: el interprete se llama desde la
interrupcion, 50 veces por segundo, y mientras el contador de la nota en curso
no llega a cero NO lee el guion. O sea que el tiempo lo lleva el cuadro, y
comparar por cuadros es lo unico que detecta un error de DURACION, que es
justo lo que una comparacion de "lista de notas" se traga.

Se comparan PERIODOS, no volumenes: el periodo sale de la tabla de notas y es
lo que la lectura predice: el volumen lo amasa el instrumento (0xE5E2), que no
esta interpretado, asi que compararlo solo daria ruido.

Uso:  coteja_partitura.py work/juego.raw dump/psg_musica_naves/pista.txt <t0>
          [--voces 0xEB52,0xEC4A,0xECCB]
"""
import sys

ORG = 0x47A0
NOTAS = 0xE6E3
FRASES = 0xE7C1
FIN = 0xED75
# EL RITMO DEL CUADRO, y no es 50,00 Hz. Medido con un breakpoint en 0x0038 -el
# vector de interrupcion de la ROM- salen 1003 pasadas en 20 s exactos, o sea
# 50,15 Hz. La diferencia parece ridicula y no lo es: sobre 600 cuadros son casi
# dos cuadros de deriva, y con la rejilla a 50,00 la comparacion se desliza y
# baja del 99,8 % al 98,2 % por un motivo que no tiene nada que ver con la
# lectura de la musica.
CUADRO = 1 / 50.15
INTERRUPCIONES = None

ARG = {0x80: 1, 0x81: 1, 0x82: 0, 0x83: 1, 0x84: 0, 0x85: 1, 0x86: 0, 0x87: 1,
       0x88: 1, 0x89: 1, 0x8A: 1, 0x8B: 0, 0x8C: 1, 0x8D: 0, 0x8E: 1}

CROM = ["do", "do#", "re", "re#", "mi", "fa",
        "fa#", "sol", "sol#", "la", "la#", "si"]


class Voz:
    """Un canal del interprete, con su puntero, su pila y su cuenta atras."""

    def __init__(self, d, ini):
        self.d = d
        self.ini = ini
        self.a = ini
        self.pila = []
        self.queda = 0          # (ix+4/5): lo que falta de la nota en curso
        self.dur = 8            # (ix+6/7): la duracion que fija el 0x83
        self.transp = 0         # lo que suma el 0x8E antes de indexar la tabla
        self.vol = 15           # el 0x80; a cero el canal no se oye
        self.periodo = 0
        self.viva = True

    def cuadro(self, tabla):
        """Avanza un cuadro y devuelve el periodo que suena al acabarlo."""
        if not self.viva:
            return 0
        if self.queda > 0:
            self.queda -= 1
            return self.periodo if self.vol else 0
        vueltas = 0
        while self.viva:
            vueltas += 1
            if vueltas > 10000:     # cinturon: guion que se muerde la cola
                self.viva = False
                break
            if not (ORG <= self.a < FIN):
                self.viva = False
                break
            b = self.d[self.a - ORG]
            if b < 0x80:                        # una NOTA
                i = (b + self.transp) & 0xFF
                self.periodo = tabla[i] if i < len(tabla) else 0
                self.queda = max(1, self.dur) - 1
                self.a += 1
                return self.periodo if self.vol else 0
            n = ARG.get(b)
            if n is None:
                self.viva = False
                break
            arg = self.d[self.a - ORG + 1] if n else None
            self.a += 1 + n
            if b == 0x80:
                # El volumen no se COMPARA, pero hace falta: a cero el canal
                # deja de oirse y hay que dar silencio, no la nota anterior.
                self.vol = arg & 0x0F
            elif b == 0x83:
                self.dur = max(1, arg)
            elif b == 0x8E:
                self.transp = arg - 256 if arg > 127 else arg
            elif b == 0x8C:                     # llama a la frase
                self.pila.append(self.a)
                self.a = (self.d[FRASES - ORG + arg * 2] |
                          (self.d[FRASES - ORG + arg * 2 + 1] << 8))
            elif b == 0x8D:                     # vuelve
                if not self.pila:
                    self.viva = False
                    break
                self.a = self.pila.pop()
            elif b == 0x82:                     # bucle: al principio del guion
                self.a = self.ini
            elif b == 0x8B:                     # fin: el canal se calla
                self.viva = False
                self.periodo = 0
        return (self.periodo if self.vol else 0) if self.viva else 0


def tabla_notas(d):
    return [d[NOTAS - ORG + i * 2] | (d[NOTAS - ORG + i * 2 + 1] << 8)
            for i in range(96)]


def rejilla_medida(ruta, t0, ncuadros):
    """Los instantes REALES de interrupcion, como frontera de cada cuadro.

    Hace falta porque el juego se pierde interrupciones cuando la pantalla se
    carga: en la pantalla de records la interrupcion va a 50,1 Hz y en partida
    a 28,3, y ni siquiera es estable dentro de un mismo tramo. Con una rejilla
    de ritmo fijo la comparacion se desliza y no mide nada.
    """
    t = [float(l) for l in open(ruta) if l.strip()]
    t = [x for x in t if x >= t0]
    return t[:ncuadros + 1]


def medido(pista, t0, ncuadros, bordes=None):
    """La medida, pasada a una rejilla de cuadros: canal -> [periodo por cuadro].

    OJO CON EL SILENCIO, que costo un resultado falso: el juego solo escribe los
    registros de tono cuando cambian, asi que un hueco significa "sigue sonando
    lo mismo"... pero solo si el canal esta sonando. Si el volumen es cero o el
    mezclador tiene el tono cortado, el periodo que quedo escrito no se oye. Sin
    enmascarar eso, un canal callado veinte segundos aparece como una nota
    tenida de mil cuadros y hunde la comparacion.
    """
    ev = {0: [], 1: [], 2: []}
    for linea in open(pista):
        c = linea.split()
        if len(c) < 6:
            continue
        t, canal, p, v, mez = (float(c[0]), int(c[1]), int(c[2]),
                               int(c[3]), int(c[4]))
        ev[canal].append((t, p, v, mez))
    rejilla = {}
    for canal in (0, 1, 2):
        fila = [0] * ncuadros
        estado = (0, 0, 0xFF)
        instantes = []
        for t, p, v, mez in ev[canal]:
            estado = (p if p > 0 else estado[0], v, mez)
            instantes.append((t, estado))
        def cuadro_de(t):
            if bordes is None:
                return int(round((t - t0) / CUADRO))
            # busqueda binaria sobre los instantes de interrupcion
            lo, hi = 0, len(bordes) - 1
            if t < bordes[0]:
                return -1
            while lo < hi:
                med = (lo + hi + 1) // 2
                if bordes[med] <= t:
                    lo = med
                else:
                    hi = med - 1
            return lo

        for t, (p, v, mez) in instantes:
            i = cuadro_de(t)
            if 0 <= i < ncuadros:
                suena = p > 0 and (v & 0x0F) > 0 and not ((mez >> canal) & 1)
                fila[i] = p if suena else 0
        # Ahora si: los huecos heredan, porque ya llevan el silencio marcado.
        ultimo = 0
        visto = [False] * ncuadros
        for t, _ in instantes:
            i = cuadro_de(t)
            if 0 <= i < ncuadros:
                visto[i] = True
        for i in range(ncuadros):
            if visto[i]:
                ultimo = fila[i]
            else:
                fila[i] = ultimo
        rejilla[canal] = fila
    return rejilla


def nombre(tabla, p):
    for i, q in enumerate(tabla):
        if q == p:
            return "%s%d" % (CROM[i % 12], i // 12 + 1)
    return "?" if p else "-"


def main(raw, pista, t0, cuadros=None, voces="0xEB52,0xEC4A,0xECCB"):
    d = open(raw, "rb").read()
    t0 = float(t0)
    tabla = tabla_notas(d)
    dirs = [int(x, 0) for x in voces.split(",")]

    # Cuantos cuadros dan los datos medidos.
    ultimo = max(float(l.split()[0]) for l in open(pista) if l.strip())
    ncuadros = int((ultimo - t0) / CUADRO)
    # El tramo se acota a mano cuando se sabe donde para la musica: en el juego
    # de naves la paran tres llamadas al limpiador de canal, y comparar contra
    # el silencio de despues no mide nada.
    if cuadros:
        ncuadros = min(ncuadros, int(cuadros))
    bordes = rejilla_medida(INTERRUPCIONES, t0, ncuadros) if INTERRUPCIONES else None
    if bordes:
        ncuadros = min(ncuadros, len(bordes) - 1)
        print("rejilla tomada de %d interrupciones medidas" % len(bordes))
    real = medido(pista, t0, ncuadros, bordes)

    # COMO SE PUNTUA, y por que no es "cuadros iguales entre todos".
    #
    # El chip mete un cuadro de SILENCIO entre nota y nota: la envolvente del
    # instrumento baja el volumen a cero al final de cada una. Ese hueco no es
    # un error de lectura -la altura es la misma-, asi que contarlo como fallo
    # castiga la partitura por algo que no dice. Y despues del ultimo compas el
    # canal se queda callado un buen rato, que tampoco es un fallo.
    #
    # Asi que se puntua sobre los cuadros en que EL CHIP SUENA: cuando suena,
    # ¿predice la lectura esa misma nota? Y aparte, como control que impide
    # inflar la nota callandose, se cuentan los cuadros en que la deduccion
    # toca algo y el chip esta mudo.
    def puntua(deducido, desfase, canal=None):
        bien = mal = sobra = 0
        canales = (canal,) if canal is not None else (0, 1, 2)
        for c in canales:
            for i in range(ncuadros):
                j = i - desfase
                if j < 0 or j >= len(deducido[c]):
                    continue
                if real[c][i]:
                    if real[c][i] == deducido[c][j]:
                        bien += 1
                    else:
                        mal += 1
                elif deducido[c][j]:
                    sobra += 1
        return bien, mal, sobra

    mejor = None
    for desfase in range(-4, 20):
        vs = [Voz(d, a) for a in dirs]
        deducido = {c: [] for c in (0, 1, 2)}
        for _ in range(ncuadros + 20):
            for c in (0, 1, 2):
                deducido[c].append(vs[c].cuadro(tabla))
        bien, mal, sobra = puntua(deducido, desfase)
        if bien + mal:
            tasa = 100.0 * bien / (bien + mal)
            if mejor is None or (tasa, bien) > (mejor[0], mejor[2]):
                mejor = (tasa, desfase, bien, mal, sobra, deducido)

    tasa, desfase, bien, mal, sobra, deducido = mejor
    print("%d cuadros medidos desde t=%.2f (%.1f s)" % (
        ncuadros, t0, ncuadros * CUADRO))
    print("mejor alineado: desfase de %d cuadros" % desfase)
    print("  con el chip sonando: %d aciertos, %d fallos  ->  %.1f %%" % (
        bien, mal, tasa))
    print("  la deduccion toca con el chip mudo: %d cuadros" % sobra)
    print()
    for c in (0, 1, 2):
        b, m, so = puntua(deducido, desfase, c)
        t = 100.0 * b / (b + m) if b + m else 0.0
        print("  canal %d: %6d bien, %6d mal -> %5.1f %%   (%d de mas)" % (
            c, b, m, t, so))
    # Y la cifra que de verdad significa algo cuando la pieza TERMINA: puntuar
    # solo mientras su guion sigue vivo. Un jingle de dos segundos seguido de
    # cincuenta de efectos sale del 5 % si se cuenta entero, y no porque este
    # mal leido: es que despues ya no suena el.
    print("Mientras el guion de cada voz sigue vivo:")
    vb = vm = 0
    for c in (0, 1, 2):
        vivo = max((i for i in range(min(ncuadros, len(deducido[c])))
                    if deducido[c][i]), default=-1) + 1
        if not vivo:
            print("  canal %d: su guion no llega a sonar" % c)
            continue
        b = f = 0
        for i in range(vivo):
            j = i - desfase
            if j < 0 or j >= len(deducido[c]) or not real[c][i]:
                continue
            if real[c][i] == deducido[c][j]:
                b += 1
            else:
                f += 1
        vb += b
        vm += f
        print("  canal %d: %4d cuadros de guion -> %4d bien, %4d mal  %5.1f %%" % (
            c, vivo, b, f, 100.0 * b / (b + f) if b + f else 0.0))
    if vb + vm:
        print("  TOTAL mientras suena: %d bien, %d mal -> %.1f %%" % (
            vb, vm, 100.0 * vb / (vb + vm)))
    print()
    print("Los primeros 24 cuadros de cada canal (medido / deducido):")
    for c in (0, 1, 2):
        m = " ".join(nombre(tabla, real[c][i]) for i in range(min(24, ncuadros)))
        p = " ".join(nombre(tabla, deducido[c][i - desfase] if i - desfase >= 0
                            else 0) for i in range(min(24, ncuadros)))
        print("  canal %d medido:   %s" % (c, m))
        print("  canal %d deducido: %s" % (c, p))
    return 0


if __name__ == "__main__":
    args = [a for a in sys.argv[1:] if not a.startswith("--")]
    kw = {}
    for a in sys.argv[1:]:
        if a.startswith("--voces="):
            kw["voces"] = a.split("=", 1)[1]
        elif a.startswith("--hz="):
            globals()["CUADRO"] = 1.0 / float(a.split("=", 1)[1])
        # La parte de a pie lleva el MISMO interprete reubicado, asi que sirve
        # el mismo cotejo cambiandole las cuatro direcciones. Ojo: sus datos de
        # sonido NO estan todos al mismo desplazamiento -las tablas a -0x1CE5 y
        # los guiones a -0x1D0D-, asi que hay que darlas, no calcularlas.
        elif a.startswith("--org="):
            globals()["ORG"] = int(a.split("=", 1)[1], 0)
        elif a.startswith("--notas="):
            globals()["NOTAS"] = int(a.split("=", 1)[1], 0)
        elif a.startswith("--frases="):
            globals()["FRASES"] = int(a.split("=", 1)[1], 0)
        elif a.startswith("--fin="):
            globals()["FIN"] = int(a.split("=", 1)[1], 0)
        elif a.startswith("--interrupciones="):
            globals()["INTERRUPCIONES"] = a.split("=", 1)[1]
    sys.exit(main(*args, **kw))
