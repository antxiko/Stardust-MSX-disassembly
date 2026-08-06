#!/usr/bin/env python3
"""Dibuja el mapa completo de cada una de las siete zonas de naves.

De donde sale la geometria, que es la parte que hay que justificar:

  - Los datos de cada zona ocupan ~250 bytes en la cinta y van COMPRIMIDOS. Al
    expandirlos con tools/descomprime_nivel.py las SIETE dan exactamente 450
    bytes. Que siete flujos independientes caigan en el mismo tamano no es
    casualidad: es la senal de que el descompresor lee bien.

  - 450 = 6 x 75. Que el ancho sea 6 no es una eleccion: el buffer de pantalla
    mide 24 caracteres de ancho, los tiles miden 32 pixeles -o sea 4
    caracteres-, y 24/4 = 6. El mapa es una tira de 6 tiles de ancho por 75 de
    alto, que es lo que cabe esperar de un matamarcianos de scroll vertical.

    ESTO ESTUVO PUBLICADO COMO 10 x 45, y estaba mal. El error venia de leer el
    `ld b,028h` del volcado como "40 columnas" cuando es el bucle INTERIOR, que
    recorre una columna de 40 bytes a saltos de 24 (ver src/juego.notes). Con el
    ancho bueno los mapas salen simetricos izquierda-derecha y con las
    estructuras enteras; con el de 10 salian cortadas y sin simetria. Es la
    comprobacion que dice el parrafo de abajo, y en su momento no se miro.

  - Cada byte es un indice de tile. Van de 0 a 110, y hay exactamente 111 tiles
    (0x6DE0 + 111*128 = 0xA560, donde empiezan los sprites). La zona 7 usa el
    110, el ultimo: otra comprobacion que sale sola.

El color de cada zona viene de la propia tabla de zonas de 0xDE03, que junto al
puntero guarda un byte de color de SCREEN 2 (tinta<<4 | fondo). Las siete ciclan
entre 0xA1, 0xF1 y 0x71.

Lo que este dibujo NO es: una captura. Se construye desde los bytes de la cinta,
asi que vale de comprobacion. Si la geometria estuviera mal saldria ruido, no
una estructura con suelo, paredes y pasillos.

Uso: render_niveles.py <work/juego.raw> <directorio_salida>
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from descomprime_nivel import Nivel             # noqa: E402
from render_maps import png                     # noqa: E402

ORG = 0x47A0
TILES = 0x6DE0          # 111 tiles de 32x32, 4 bytes por linea, 128 B cada uno
ANCHO = 6               # tiles de ancho: 24 caracteres del buffer / 4 por tile
ALTO = 75               # 450 bytes / 6

# La paleta del TMS9918, solo los tonos que hacen falta para estos colores.
PALETA = {
    0x0: (0, 0, 0), 0x1: (0, 0, 0), 0x7: (102, 204, 220),
    0xA: (204, 85, 85), 0xF: (255, 255, 255),
}


def color(byte):
    tinta = PALETA.get(byte >> 4, (255, 255, 255))
    fondo = PALETA.get(byte & 15, (0, 0, 0))
    return tinta, fondo


def dibuja(raw, mapa, tinta, fondo):
    W, H = ANCHO * 32, ALTO * 32
    px = [[fondo] * W for _ in range(H)]
    for fila in range(ALTO):
        for col in range(ANCHO):
            t = mapa[fila * ANCHO + col]
            base = TILES - ORG + t * 128
            for l in range(32):
                for by in range(4):
                    b = raw[base + l * 4 + by]
                    for bit in range(8):
                        if b & (0x80 >> bit):
                            px[fila * 32 + l][col * 32 + by * 8 + bit] = tinta
    return px


def main(argv):
    if len(argv) < 3:
        print(__doc__)
        return 2
    with open(argv[1], "rb") as f:
        raw = f.read()
    salida = argv[2]
    os.makedirs(salida, exist_ok=True)
    niv = Nivel(raw)
    for n in range(1, 8):
        mapa, comp = niv.descomprime(n)
        if len(mapa) != ANCHO * ALTO:
            print(f"  zona {n}: salen {len(mapa)} bytes y se esperaban "
                  f"{ANCHO*ALTO}; no se dibuja")
            return 1
        _p, c = niv.zona(n)
        tinta, fondo = color(c)
        px = dibuja(raw, mapa, tinta, fondo)
        ruta = os.path.join(salida, f"zona{n}.png")
        png(ruta, ANCHO * 32, ALTO * 32, px)
        print(f"  zona {n}: {comp} B comprimidos -> {len(mapa)} tiles"
              f"  ({ANCHO}x{ALTO})  color 0x{c:02X}  -> {ruta}")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
