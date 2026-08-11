#!/usr/bin/env python3
"""Lee la musica de Stardust en su propio lenguaje y la saca a notas.

El juego no guarda melodias como notas sueltas: trae un INTERPRETE con quince
comandos, y las canciones estan escritas en el. Un byte >= 0x80 es un comando y
uno por debajo es una nota, que indexa la tabla de periodos del PSG de 0xE6E3.

Los quince comandos, leidos de sus rutinas (la tabla de saltos esta en 0xE7A3):

    0x80 n  volumen                 0x88 n  ruido (and 0x1F)
    0x81 n  tono/ruido (and 9)      0x89 n  efecto
    0x82    bucle                   0x8A n  banderas
    0x83 n  duracion                0x8B    fin
    0x84    (sin argumento)         0x8C n  llama a la frase n
    0x85 n  tempo                   0x8D    vuelve
    0x86    tempo a 1               0x8E n  (un byte al estado del canal)
    0x87 n  instrumento

Las frases viven en su propia tabla, 0xE7C1, y acaban en 0x8D; las canciones
acaban en 0x8B. El interprete guarda la direccion de vuelta en una pila por
canal: es un CALL/RET de verdad, asi que una cancion puede llamar a una frase y
la frase acaba devolviendo el control.

CUIDADO CON 0x82: NO es un terminador. Su rutina recarga el puntero con el
principio y sigue interpretando, o sea que dentro de una cancion es un BUCLE
INTERNO —las dos canciones largas llevan uno—. Solo cuando detras de un 0x82 ya
no queda ningun 0x8B el sonido se queda dando vueltas para siempre. Tomarlo por
final parte las canciones largas en trozos: se probo, y las de 378 y 149 bytes
salian troceadas en cinco.

QUE COMPRUEBA ESTA HERRAMIENTA, y por eso vale de verificacion: si el numero de
argumentos de un solo comando estuviera mal, el recorrido se desincronizaria y
los bloques dejarian de acabar en su terminador. Que 19 bloques seguidos cierren
en 0x8B sin solaparse, y que el ultimo caiga justo en 0xED75 -donde empiezan las
variables-, es la prueba de que la tabla esta bien leida.

Uso:  lee_musica.py work/juego.raw [--frases]
"""
import sys

ORG = 0x47A0
NOTAS = 0xE6E3          # 96 periodos de 16 bits: ocho octavas
FRASES = 0xE7C1         # 20 punteros a frases
MUSICA = 0xE7E9         # donde empieza todo lo escrito en el lenguaje
FIN = 0xED75

# Cuantos bytes de argumento consume cada comando, leido de sus `inc bc`.
ARG = {0x80: 1, 0x81: 1, 0x82: 0, 0x83: 1, 0x84: 0, 0x85: 1, 0x86: 0, 0x87: 1,
       0x88: 1, 0x89: 1, 0x8A: 1, 0x8B: 0, 0x8C: 1, 0x8D: 0, 0x8E: 1}
NOMBRE = {0x80: "volumen", 0x81: "tono/ruido", 0x82: "BUCLE", 0x83: "duracion",
          0x84: "(sin arg)", 0x85: "tempo", 0x86: "tempo=1", 0x87: "instrumento",
          0x88: "ruido", 0x89: "efecto", 0x8A: "banderas", 0x8B: "FIN",
          0x8C: "llama frase", 0x8D: "VUELVE", 0x8E: "canal"}

CROMATICA = ["do", "do#", "re", "re#", "mi", "fa",
             "fa#", "sol", "sol#", "la", "la#", "si"]


def nombre_nota(n):
    """La tabla empieza en do1, asi que la nota n es la octava n//12 + 1."""
    if n >= 96:
        return "?%d" % n
    return "%s%d" % (CROMATICA[n % 12], n // 12 + 1)


def bloque(d, a):
    """Recorre un bloque y devuelve (lineas, direccion_siguiente, terminador)."""
    salida = []
    while a < FIN:
        b = d[a - ORG]
        if b < 0x80:
            salida.append(("nota", a, b, nombre_nota(b)))
            a += 1
            continue
        n = ARG.get(b)
        if n is None:
            salida.append(("?", a, b, "byte fuera del lenguaje"))
            return salida, a + 1, None
        arg = d[a - ORG + 1] if n else None
        salida.append(("cmd", a, b, NOMBRE[b] + ("" if arg is None else " %d" % arg)))
        a += 1 + n
        # OJO: 0x82 NO termina un bloque. Su rutina (0xE477) recarga BC con el
        # principio y SIGUE interpretando, asi que dentro de una cancion es un
        # bucle interno. Tomarlo por terminador parte las canciones largas en
        # trozos y da cifras infladas. Los unicos finales son 0x8B y 0x8D; si
        # el recorrido llega a un 0x82 y ya no encuentra ninguno de los dos,
        # ese bloque suena EN BUCLE y no acaba nunca.
        if b in (0x8B, 0x8D):
            return salida, a, b
    return salida, a, None


def main(ruta, *flags):
    d = open(ruta, "rb").read()
    ver_frases = "--frases" in flags

    print("La tabla de notas: %d entradas desde 0x%04X" % (
        (0xE7A3 - NOTAS) // 2, NOTAS))
    per = [d[NOTAS - ORG + i * 2] | (d[NOTAS - ORG + i * 2 + 1] << 8)
           for i in range((0xE7A3 - NOTAS) // 2)]
    # El AY-3-8910 del MSX recibe 3579545/2 Hz, y su divisor de tono es de 16:
    # frecuencia = reloj / (16 * periodo).
    reloj = 3579545 / 2.0 / 16.0
    print("  la primera: periodo %d = %.2f Hz (%s)" % (
        per[0], reloj / per[0], nombre_nota(0)))
    print("  la ultima:  periodo %d = %.2f Hz (%s)" % (
        per[-1], reloj / per[-1], nombre_nota(len(per) - 1)))
    octavas = sum(1 for i in range(len(per) - 12)
                  if abs(per[i] / per[i + 12] - 2.0) < 0.02)
    print("  pares separados una octava con razon 2.0: %d de %d" % (
        octavas, len(per) - 12))
    print()

    if ver_frases:
        print("LAS 20 FRASES (tabla de 0x%04X), que acaban en 0x8D:" % FRASES)
        for i in range(20):
            p = d[FRASES - ORG + i * 2] | (d[FRASES - ORG + i * 2 + 1] << 8)
            trozos, _, term = bloque(d, p)
            notas = [t[3] for t in trozos if t[0] == "nota"]
            print("  frase %2d en 0x%04X: %2d notas, acaba en 0x%02X  %s" % (
                i, p, len(notas), term or 0, " ".join(notas[:12])))
        print()

    print("LOS BLOQUES DE 0x%04X EN ADELANTE (canciones y efectos):" % 0xEA38)
    a, n = 0xEA38, 0
    while a < FIN:
        ini = a
        trozos, a, term = bloque(d, a)
        if term is None:
            # Sin 0x8B ni 0x8D hasta el final: lo que quede suena en bucle.
            notas = [t[3] for t in trozos if t[0] == "nota"]
            n += 1
            # Los ultimos 20 bytes son DOS sonidos en bucle, no uno: el
            # codigo carga 0xED61 y 0xED6B por separado (`ld de,`), y son la
            # misma secuencia con distinta nota.
            print("  %2d) 0x%04X-0x%04X %4d B  %3d notas  EN BUCLE (son DOS: "
                  "0xED61 y 0xED6B, cargados por separado)" % (
                      n, ini, FIN - 1, FIN - ini, len(notas)))
            break
        n += 1
        notas = [t[3] for t in trozos if t[0] == "nota"]
        clase = {0x8B: "acaba", 0x8D: "vuelve"}[term]
        print("  %2d) 0x%04X-0x%04X %4d B  %3d notas  %-9s %s" % (
            n, ini, a - 1, a - ini, len(notas), clase,
            " ".join(notas[:10]) + (" ..." if len(notas) > 10 else "")))
    print()
    print("  %d bloques, y el recorrido cierra en 0x%04X" % (n, a))
    print("  (si el numero de argumentos de un comando estuviera mal, el")
    print("   recorrido se desincronizaria y esto no cuadraria)")
    return 0


if __name__ == "__main__":
    sys.exit(main(*sys.argv[1:]))
