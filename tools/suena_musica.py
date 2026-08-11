#!/usr/bin/env python3
"""Sintetiza la musica de Stardust a WAV, ejecutando su lenguaje.

No reproduce una grabacion: EJECUTA el guion igual que lo hace el juego. Sigue
las llamadas a frases con su pila, lleva la duracion, el volumen y la
transposicion, y saca el periodo de cada nota de la tabla de 96 entradas de
0xE6E3. Despues convierte cada periodo en la onda cuadrada que produciria el
PSG.

Por que esto es una VERIFICACION y no un adorno: para que suene algo con
sentido musical tienen que estar bien a la vez el numero de argumentos de los
quince comandos, la tabla de frases, la de notas y el reloj del chip. Si
cualquiera de esas cuatro cosas estuviera mal, saldria ruido.

Lo que se sabe del tiempo, leido del interprete (0xE203):
  - (ix+004h/005h) es lo que queda de la nota en curso: mientras no sea cero el
    interprete NO lee el guion. Es un contador de cuadros.
  - El comando 0x83 fija la duracion en (ix+006h/007h) como n * el tempo de
    0xEE18 (que el comando 0x86 pone a 1).
  - El interprete se llama desde la interrupcion, o sea 50 veces por segundo.
    Asi que `83 10` son 16 cuadros = 0,32 s.
  - Antes de indexar la tabla de notas hace `add a,(hl)` con un valor por canal
    (0xE231-0xE236): es una TRANSPOSICION, y es lo que escribe el comando 0x8E
    —de ahi que sus argumentos sean 0xF6, 0xFD o 0xFF, o sea negativos.

SUPOSICIONES, marcadas como tales porque el WAV no las demuestra:
  - que el tempo de partida es 1 (lo pone el comando 0x86, pero si una cancion
    no lo trae al principio se asume 1);
  - que la duracion se mide en cuadros de 50 Hz de forma exacta;
  - la envolvente: aqui la nota suena plana y se corta seca, mientras que el
    juego aplica el instrumento (0xE5E2). Los instrumentos NO se interpretan.
  Todo eso afecta al timbre y al ritmo fino, no a las alturas.

Uso:  suena_musica.py work/juego.raw 0xEB52 salida.wav [segundos]
"""
import struct
import sys

ORG = 0x47A0
NOTAS = 0xE6E3
FRASES = 0xE7C1
FIN = 0xED75
RELOJ = 3579545 / 2.0 / 16.0      # el divisor de tono del AY-3-8910
HZ = 22050                        # muestreo del WAV
CUADRO = 1 / 50.0                 # el interprete corre en la interrupcion

ARG = {0x80: 1, 0x81: 1, 0x82: 0, 0x83: 1, 0x84: 0, 0x85: 1, 0x86: 0, 0x87: 1,
       0x88: 1, 0x89: 1, 0x8A: 1, 0x8B: 0, 0x8C: 1, 0x8D: 0, 0x8E: 1}


def periodos(d):
    n = (0xE7A3 - NOTAS) // 2
    return [d[NOTAS - ORG + i * 2] | (d[NOTAS - ORG + i * 2 + 1] << 8)
            for i in range(n)]


def ejecuta(d, ini, maxcuadros):
    """Ejecuta el guion y devuelve [(periodo, volumen, cuadros)]."""
    tabla = periodos(d)
    pila, a = [], ini
    vol, dur, transp = 15, 8, 0
    salida, total, visitas = [], 0, 0
    while a < FIN and total < maxcuadros:
        visitas += 1
        if visitas > 100000:            # cinturon: guion que se muerde la cola
            break
        b = d[a - ORG]
        if b < 0x80:                    # una NOTA
            i = (b + transp) & 0xFF
            p = tabla[i] if i < len(tabla) else 0
            salida.append((p, vol, dur))
            total += dur
            a += 1
            continue
        n = ARG.get(b)
        if n is None:
            break
        arg = d[a - ORG + 1] if n else None
        a += 1 + n
        if b == 0x80:
            vol = arg & 0x0F
        elif b == 0x83:
            dur = max(1, arg)
        elif b == 0x8E:
            transp = arg - 256 if arg > 127 else arg
        elif b == 0x8C:                 # llama a la frase
            pila.append(a)
            a = (d[FRASES - ORG + arg * 2] |
                 (d[FRASES - ORG + arg * 2 + 1] << 8))
        elif b == 0x8D:                 # vuelve
            if not pila:
                break
            a = pila.pop()
        elif b == 0x82:                 # bucle: vuelve al principio
            a = ini
        elif b == 0x8B:                 # fin
            break
    return salida


def onda(eventos):
    """Cada periodo, a onda cuadrada; el volumen, lineal por no inventar."""
    m = bytearray()
    fase = 0.0
    for p, vol, cuadros in eventos:
        muestras = int(cuadros * CUADRO * HZ)
        if p <= 0:
            m.extend(b"\x80" * muestras)
            continue
        f = RELOJ / p
        paso = f / HZ
        amp = int(60 * vol / 15.0)
        for _ in range(muestras):
            fase = (fase + paso) % 1.0
            m.append(128 + (amp if fase < 0.5 else -amp))
    return bytes(m)


def escribe_wav(ruta, datos):
    with open(ruta, "wb") as f:
        f.write(b"RIFF" + struct.pack("<I", 36 + len(datos)) + b"WAVEfmt ")
        f.write(struct.pack("<IHHIIHH", 16, 1, 1, HZ, HZ, 1, 8))
        f.write(b"data" + struct.pack("<I", len(datos)) + datos)


def main(raw, direccion, salida, segundos="20"):
    d = open(raw, "rb").read()
    ini = int(direccion, 0)
    maxc = int(float(segundos) / CUADRO)
    ev = ejecuta(d, ini, maxc)
    datos = onda(ev)
    escribe_wav(salida, datos)
    dist = sorted({p for p, _, _ in ev if p})
    print("0x%04X: %d notas, %.1f s" % (ini, len(ev), len(datos) / float(HZ)))
    print("  periodos distintos: %d, de %d a %d (%.1f a %.1f Hz)" % (
        len(dist), dist[0], dist[-1], RELOJ / dist[-1], RELOJ / dist[0]))
    tabla = set(periodos(d))
    fuera = [p for p in dist if p not in tabla]
    print("  periodos que NO estan en la tabla de notas: %d %s" % (
        len(fuera), fuera[:8]))
    print("  -> %s" % salida)
    return 0


if __name__ == "__main__":
    sys.exit(main(*sys.argv[1:]))
