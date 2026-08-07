#!/usr/bin/env python3
"""Dibuja la pantalla estatica que L_EF28 copia a la VRAM al arrancar naves.

La fuente son los 0x1200 bytes de 0x48A0 (0x900 de patrones y 0x900 de
colores), y el REPARTO no es lineal: se reproduce aqui exactamente el de
L_EF28 (0xEF28), leido del listado:

  fase A  2 filas de caracter por tercio: la fila 0 y la 7 de cada uno
          (filas de pantalla 0, 7, 8, 15, 16 y 23), 0x100 bytes cada una.
  fase B  24 tiras de 8 bytes (1 caracter) a saltos de 0x40: columnas
          0, 8, 16 y 24 de las filas 1-6 del tercio de arriba.
  fase C  24 tiras de 0x18 (3 caracteres) a saltos de 0x40 desde 0x1128:
          columnas 5-7, 13-15, 21-23 y 29-31 de las filas 17-22.

  Total: 6*32 + 24 + 24*3 = 288 caracteres = 0x900 bytes. La misma rutina se
  llama dos veces: primero con destino 0x0000 (patrones) y luego 0x2000
  (colores), con la fuente avanzando seguida. Lo que no pinta queda aqui en
  negro, que es lo que hay en una VRAM borrada.

Uso: render_marco.py <work/juego.raw> <directorio_salida>
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from render_maps import png                     # noqa: E402

ORG = 0x47A0
FUENTE = 0x48A0

# La paleta del TMS9918 (tonos habituales).
PALETA = [
    (0, 0, 0), (0, 0, 0), (33, 200, 66), (94, 220, 120),
    (84, 85, 237), (125, 118, 252), (212, 82, 77), (66, 235, 245),
    (252, 85, 84), (255, 121, 120), (212, 193, 84), (230, 206, 128),
    (33, 176, 59), (201, 91, 186), (204, 204, 204), (255, 255, 255),
]


def destinos():
    """Los offsets de VRAM que escribe L_EF28, en el ORDEN en que los escribe."""
    out = []
    # fase A: hl arranca en 0; tres tercios (+0x800) y vuelta a +0x700
    hl = 0
    for _c in range(2):
        for _b in range(3):
            out.append((hl, 0x100))
            hl = (hl + 0x800) & 0xFFFF
        hl = (hl + 0xEF00) & 0xFFFF
    # fase B: 24 tiras de 8 desde 0x0100, paso 0x40
    hl = 0x0100
    for _ in range(24):
        out.append((hl, 8))
        hl += 0x40
    # fase C: 24 tiras de 0x18 desde 0x1128, paso 0x40
    hl = 0x1128
    for _ in range(24):
        out.append((hl, 0x18))
        hl += 0x40
    return out


def main(argv):
    if len(argv) < 3:
        print(__doc__)
        return 2
    raw = open(argv[1], "rb").read()
    salida = argv[2]
    os.makedirs(salida, exist_ok=True)

    # Reconstruir las tablas de VRAM (0x1800 de patrones, 0x1800 de colores).
    pat = bytearray(0x1800)
    col = bytearray(0x1800)
    p = FUENTE - ORG
    for tabla in (pat, col):
        for hl, n in destinos():
            tabla[hl:hl + n] = raw[p:p + n]
            p += n

    # Y de ahi a pixeles, con las reglas de SCREEN 2 y LA TABLA DE NOMBRES QUE
    # EL JUEGO HEREDA de la pantalla de carga: la rutina 0x9BDB del bloque [09]
    # la rellena sumando ocho (nombre[i] = 8*(i%32) + i//32, por tercio), la
    # carga del bloque [10] machaca esa rutina en RAM pero la VRAM sobrevive, y
    # el juego no la reescribe (contrastado contra un volcado de VRAM real:
    # 768/768 nombres identicos). Con ese mapeo, el caracter n de cada tercio
    # se ve en la columna n/8, fila n%8: el reparto "raro" de L_EF28 es,
    # sencillamente, la forma del marco.
    px = [[(0, 0, 0)] * 256 for _ in range(192)]
    for fila_c in range(24):
        tercio, fila_t = divmod(fila_c, 8)
        for col_c in range(32):
            n = 8 * col_c + fila_t          # el nombre heredado del 9BDB
            base = tercio * 0x800 + n * 8
            for l in range(8):
                b = pat[base + l]
                c = col[base + l]
                tinta, fondo = PALETA[c >> 4], PALETA[c & 15]
                y = fila_c * 8 + l
                for bit in range(8):
                    px[y][col_c * 8 + bit] = tinta if b & (0x80 >> bit) else fondo
    ruta = os.path.join(salida, "marco.png")
    png(ruta, 256, 192, px)
    print(f"  256x192 desde 0x48A0, reparto de L_EF28 + nombres del 9BDB -> {ruta}")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
