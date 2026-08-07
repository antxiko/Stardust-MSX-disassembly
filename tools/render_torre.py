#!/usr/bin/env python3
"""Dibuja la torre completa de la fase a pie, su estructura y su pozo de tiles.

De donde sale la geometria, que es la parte que hay que justificar:

  - El mapa esta en 0x840B: 78 filas de 6 celdas, 468 bytes. Lo dice el codigo:
    base_mapa (0xA9F5) hace `ld ix,0840bh` y devuelve IX = 0x840B + fila*6, con
    la fila leida de 0xAD2A. Es la UNICA referencia a ese rango en el listado.

  - Cada byte del mapa es DOS cosas a la vez. Para el dibujo, un indice de tile:
    el redibujado del fondo (0xA985-0xA9A0) calcula origen = 0x87F3 + valor*128.
    Para la fisica, un booleano: consulta_mapa (0xB18E) acaba en `and a` y sus
    seis llamadores solo miran el flag Z (celda 0 = vacio). No hay dos mapas,
    hay uno con dos lecturas.

  - Los tiles son de 32x32: 128 bytes = 4 bytes por fila x 32 filas. Cuadra por
    tres caminos que no dependen entre si: consulta_mapa divide la Y entre 32
    (rlca x4 / and 0Eh = 2*(Y>>5)); el scroll fino 0xAD2C recorre 16 pasos de
    2 px entre cambio y cambio de fila (medido en el emulador, ciclo 2..32); y
    el valor maximo del mapa es 44, con 0x87F3 + 44*128 + 127 = 0x9E72, que es
    EXACTAMENTE el ultimo byte que se vio leer al blitter. 45 tiles justos.

  - La torre entera: 6*32 = 192 px de ancho por 78*32 = 2496 px de alto.
    (Estuvo publicada como celdas de 32x16 y torre de 1248 px: el alto de celda
    se habia derivado en vez de medirse, y era la mitad.)

  - La celda 0 no la dibuja el blitter de solidos: el juego pinta el fondo en
    DOS pasadas parcheando el opcode de 0xA98E (0xC2 = solo vacias, 0xCA = solo
    solidas), y en las vacias pone el tile 0, que ademas ROTA una fila de pixel
    por cada 2 px de scroll (0xB140/0xB167): una trama de fondo con parallax a
    mitad de velocidad. Aqui el tile 0 se dibuja tal como viene en la cinta.

Salidas:
  torre_apie.png        la torre como la compone el juego (tile 0 en las vacias)
  torre_estructura.png  solo las celdas solidas: el mapa de colision a la vista
  tiles_apie.png        el pozo de 45 tiles, en rejilla de 9x5

Uso: render_torre.py <work/parte2.raw> <directorio_salida>
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from render_maps import png                     # noqa: E402

ORG = 0x61D0
MAPA = 0x840B           # 78 filas x 6 celdas, 468 bytes
TILES = 0x87F3          # 45 tiles de 32x32, 4 bytes por linea, 128 B cada uno
ANCHO = 6
ALTO = 78
NTILES = 45

TINTA = (102, 204, 220)  # el cian del TMS9918, que es como se ve la fase
FONDO = (0, 0, 0)


def tile(raw, n):
    """Las 32 filas de 32 pixeles del tile n, como lista de listas de 0/1."""
    base = TILES - ORG + n * 128
    filas = []
    for l in range(32):
        fila = []
        for by in range(4):
            b = raw[base + l * 4 + by]
            fila.extend(1 if b & (0x80 >> i) else 0 for i in range(8))
        filas.append(fila)
    return filas


def dibuja_torre(raw, con_fondo):
    mapa = raw[MAPA - ORG:MAPA - ORG + ANCHO * ALTO]
    px = [[FONDO] * (ANCHO * 32) for _ in range(ALTO * 32)]
    cache = {n: tile(raw, n) for n in set(mapa)}
    for fila in range(ALTO):
        for col in range(ANCHO):
            v = mapa[fila * ANCHO + col]
            if v == 0 and not con_fondo:
                continue
            t = cache[v]
            for l in range(32):
                for x in range(32):
                    if t[l][x]:
                        px[fila * 32 + l][col * 32 + x] = TINTA
    return px


def dibuja_pozo(raw):
    COLS, FILAS = 9, 5
    SEP = 4
    W = COLS * 32 + (COLS + 1) * SEP
    H = FILAS * 32 + (FILAS + 1) * SEP
    marco = (40, 30, 30)
    px = [[marco] * W for _ in range(H)]
    for n in range(NTILES):
        t = tile(raw, n)
        x0 = SEP + (n % COLS) * (32 + SEP)
        y0 = SEP + (n // COLS) * (32 + SEP)
        for l in range(32):
            for x in range(32):
                px[y0 + l][x0 + x] = TINTA if t[l][x] else FONDO
    return px, W, H


def main(argv):
    if len(argv) < 3:
        print(__doc__)
        return 2
    with open(argv[1], "rb") as f:
        raw = f.read()
    salida = argv[2]
    os.makedirs(salida, exist_ok=True)

    mapa = raw[MAPA - ORG:MAPA - ORG + ANCHO * ALTO]
    fuera = [v for v in mapa if v >= NTILES]
    if fuera:
        print(f"  el mapa usa indices fuera del pozo: {fuera}; no se dibuja")
        return 1

    for nombre, con_fondo in (("torre_apie.png", True),
                              ("torre_estructura.png", False)):
        px = dibuja_torre(raw, con_fondo)
        ruta = os.path.join(salida, nombre)
        png(ruta, ANCHO * 32, ALTO * 32, px)
        print(f"  {ANCHO*32}x{ALTO*32}  {sum(1 for v in mapa if v)} celdas "
              f"solidas de {len(mapa)}  -> {ruta}")

    px, W, H = dibuja_pozo(raw)
    ruta = os.path.join(salida, "tiles_apie.png")
    png(ruta, W, H, px)
    print(f"  {NTILES} tiles de 32x32  -> {ruta}")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
