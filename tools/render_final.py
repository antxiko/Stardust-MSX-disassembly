#!/usr/bin/env python3
"""Dibuja la escena con que termina el juego, y de paso comprueba el reparto.

DE DONDE SALE LA GEOMETRIA, que es la parte que hay que justificar:

  - La imagen esta en 0x6285 y mide 720 bytes. Lo dice copia_al_buffer
    (0xC421): `ld hl,06285h / ld bc,002d0h / ld de,04b43h`, y copia en tiras de
    dieciocho `ldi` desenrollados saltando 6 entre tira y tira. 18 + 6 = 24, que
    es el ancho del buffer, asi que son 40 filas de 18 bytes: 144 x 40 pixeles,
    centradas en la banda C.

  - Delante, de 0x61D8 a 0x6284, esta el GUION de la animacion: parejas
    (columna, fila) con marcadores por encima de 0xC0 que cambian el fotograma
    y un 0xC0 que termina. Lo recorre el bucle de 0xBE47. Son 78 pasos.

  - Y detras, en 0x6555, arranca el pool de sprites, que ya estaba
    identificado. O sea que los tres tramos van pegados sin un byte de holgura:
    0x6285 + 0x2D0 = 0x6555 exacto.

POR QUE ESTE DIBUJO VALE DE COMPROBACION. Ese tramo estuvo clasificado como
"tabla de punteros a los graficos" y como tres "tablas" medidas por entropia.
Si el reparto estuviera mal, aqui saldria ruido; si esta bien, sale una imagen.
Y el recorrido del guion tiene que ser coherente por su lado: la fila baja
siempre y la columna arranca en el centro exacto de la pantalla.

Salidas:
  escena_final.png        la imagen de fondo tal como viaja en la cinta
  escena_final_guion.png  la imagen con el recorrido de los 78 pasos encima

Uso: render_final.py <work/parte2.raw> <docs/imagenes>
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from render_maps import png                     # noqa: E402

ORG = 0x61D0
GUION = 0x61D8
IMAGEN = 0x6285
BYTES = 0x2D0
ANCHO_B = 18                    # bytes por fila
FONDO = (0, 0, 0)
TINTA = (255, 255, 255)
RASTRO = (255, 80, 80)


def imagen(raw):
    px = []
    for fila in range(BYTES // ANCHO_B):
        linea = []
        for col in range(ANCHO_B):
            b = raw[IMAGEN - ORG + fila * ANCHO_B + col]
            linea.extend(TINTA if b & (0x80 >> i) else FONDO for i in range(8))
        px.append(linea)
    return px


def guion(raw):
    """Los pasos (fotograma, columna, fila) hasta el 0xC0 que termina."""
    pasos, i, frame = [], GUION, None
    while i < IMAGEN + BYTES:
        b = raw[i - ORG]
        if b == 0xC0:
            return pasos, i
        if b > 0xC0:
            frame = b - 0xBD
            i += 1
            b = raw[i - ORG]
        pasos.append((frame, b, raw[i + 1 - ORG]))
        i += 2
    raise SystemExit("el guion no termina en 0xC0: el reparto esta mal")


def main(raw_path, destino):
    raw = open(raw_path, "rb").read()
    px = imagen(raw)
    alto, ancho = len(px), len(px[0])
    png(os.path.join(destino, "escena_final.png"), ancho, alto, px)
    print("  %dx%d desde 0x%04X (%d B)  -> escena_final.png"
          % (ancho, alto, IMAGEN, BYTES))

    pasos, fin = guion(raw)
    filas = [p[2] for p in pasos]
    baja = all(filas[i] >= filas[i + 1] for i in range(len(filas) - 1))
    print("  guion 0x%04X-0x%04X: %d pasos, %d fotogramas, fila monotona: %s"
          % (GUION, fin, len(pasos), len({p[0] for p in pasos}), baja))
    print("     columna de %#04x a %#04x, fila de %#04x a %#04x"
          % (min(p[1] for p in pasos), max(p[1] for p in pasos),
             min(filas), max(filas)))

    # el recorrido encima, a escala: la imagen es 144x40 y el area de juego
    # 192x192, asi que el rastro se dibuja sobre un lienzo aparte del alto real
    lienzo = [[FONDO] * ancho for _ in range(0xC0)]
    for y, linea in enumerate(px):
        lienzo[y + 0xC0 - alto] = list(linea)
    for _, col, fila in pasos:
        x, y = col * ancho // 0xC0, fila
        if 0 <= y < len(lienzo) and 0 <= x < ancho:
            lienzo[y][x] = RASTRO
    png(os.path.join(destino, "escena_final_guion.png"), ancho, len(lienzo), lienzo)
    print("  %dx%d con el rastro de los %d pasos -> escena_final_guion.png"
          % (ancho, len(lienzo), len(pasos)))
    return 0


if __name__ == "__main__":
    sys.exit(main(*sys.argv[1:]))
