#!/usr/bin/env python3
"""Dibuja la pantalla que Stardust ensena mientras carga el juego.

No es una captura: se monta a partir de los bytes de la cinta siguiendo lo que
hace el propio bloque [09], que es quien la pinta. Su rutina de 0x9C10 lo dice
sin ambiguedad:

    ld hl,00000h / call 9bffh    -> direcciona la VRAM en 0x0000, los PATRONES
    ld hl,09c40h / ld bc,01800h  -> 6144 bytes desde 0x9C40
    ld hl,02000h / call 9bffh    -> direcciona 0x2000, los COLORES
    ld hl,0b440h / ld bc,01800h  -> 6144 bytes desde 0xB440

y las cuentas cierran solas: 0x9C40 + 6144 = 0xB440, y 0xB440 + 6144 = 0xCC40,
que es el final exacto del bloque. Ademas el registro 0 del VDP se programa a
0x02, o sea SCREEN 2.

OJO CON LA TABLA DE NOMBRES, que es lo que hace que esto no sea un volcado
directo. La rutina de 0x9BDB no la rellena en orden 0,1,2,3... sino asi:

    9be5: xor a          ; A = 0
    9be6: out (c),a      ; la escribe
    9be8: add a,008h     ; y suma OCHO
    9bea: jr nc,9be6     ; mientras no desborde
    9bec: inc a / cp 008h ; al desbordar arranca en 1, luego en 2...

o sea 0, 8, 16 ... 248, 1, 9, 17 ... 249, 2, 10 ... Son los mismos 256 valores
por tercio, pero INTERCALADOS. Dibujarlo suponiendo orden secuencial da ruido
convincente, que es la peor clase de error: parece que el reparto esta mal
cuando lo que esta mal es la lectura.

Por eso esto vale de comprobacion y no solo de ilustracion: si el reparto
estuviese mal -si lo que llamamos patrones fuesen en realidad los colores, por
ejemplo- de aqui saldria ruido en vez de un dibujo.

Uso: render_carga.py <work/pre.raw> <salida.png>
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from render_maps import PALETA, png            # noqa: E402

ORG = 0x9B8C
PATRONES = 0x9C40
COLORES = 0xB440


def main(argv):
    if len(argv) < 3:
        print(__doc__)
        return 2
    with open(argv[1], "rb") as f:
        b = f.read()
    pat = b[PATRONES - ORG:PATRONES - ORG + 6144]
    col = b[COLORES - ORG:COLORES - ORG + 6144]
    if len(pat) != 6144 or len(col) != 6144:
        print("  el bloque no trae las dos tablas enteras")
        return 1

    # La tabla de nombres, reproduciendo el bucle de 0x9BDB tal cual.
    nombres = []
    for _ in range(3):
        a = 0
        while True:
            nombres.append(a)
            a += 8
            if a > 255:
                a = (a & 0xFF) + 1
                if a == 8:
                    break
    if len(nombres) != 768:
        print("  la tabla de nombres no da 768 entradas sino %d" % len(nombres))
        return 1

    esc = 2
    px = [[(0, 0, 0)] * (256 * esc) for _ in range(192 * esc)]
    for celda in range(768):
        cx, cy = (celda % 32) * 8, (celda // 32) * 8
        tercio = celda // 256
        dibujo = tercio * 256 + nombres[celda]
        for lin in range(8):
            p = pat[dibujo * 8 + lin]
            c = col[dibujo * 8 + lin]
            tinta, fondo = PALETA[c >> 4], PALETA[c & 15]
            for bit in range(8):
                color = tinta if (p >> (7 - bit)) & 1 else fondo
                for dy in range(esc):
                    for dx in range(esc):
                        px[(cy + lin) * esc + dy][(cx + bit) * esc + dx] = color
    png(argv[2], 256 * esc, 192 * esc, px)
    print("  %s  (%dx%d, desde los %d bytes de patron y %d de color)"
          % (argv[2], 256 * esc, 192 * esc, len(pat), len(col)))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
