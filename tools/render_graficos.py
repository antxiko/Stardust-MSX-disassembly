#!/usr/bin/env python3
"""Dibuja los graficos del juego desde los bytes de la cinta.

De donde salen las geometrias, y por que hay que decirlo
--------------------------------------------------------
Adivinarlas cuesta caro: probando a ojo se sacan texturas convincentes que no
son nada. Aqui vienen de leer `tools/ExtractImages.cpp` del desensamblado de la
version de Spectrum que publicaron sus autores (github.com/TheJare/stardust-48k),
donde el formato esta escrito en codigo:

    dumpSprites("level_tiles.png", ..., 0x6DE0, 111, 32, 32, 4, ...)
                                          ^     ^   ^   ^   ^
                                       origen  n   ancho alto  bytes por linea

o sea 111 tiles de 32x32 pixeles con 4 bytes por linea, 128 bytes cada uno.

Pero eso es OTRO binario, y la version de MSX la hizo otra gente, asi que la
geometria es una HIPOTESIS hasta que se comprueba aqui. Se comprueba de dos
formas, y las dos salen bien:

  - la cuenta cierra: 0x6DE0 + 111*128 = 0xA560, que es justo donde el mismo
    fichero dice que empiezan los sprites;
  - y sobre todo, dibujado sale una tileria reconocible -paneles, engranajes,
    estructuras- en vez de ruido. Si la geometria estuviera mal, saldria ruido.

Uso: render_graficos.py <work/juego.raw> <directorio_salida>
"""
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from render_maps import png                     # noqa: E402

ORG = 0x47A0

# nombre, origen, cuantos, ancho px, alto px, bytes por linea, con mascara
GRAFICOS = [
    ("tiles",     0x6DE0, 111, 32, 32, 4, False),
    ("sprites",   0xA560,  83, 16, 16, 4, True),
    ("charset",   0x6000,  59,  8,  8, 1, False),
    ("centinelas", 0x69A8, 15, 24, 24, 3, False),
]


def dibuja(b, ini, n, w, h, stride, mascara, cols, esc):
    """Con mascara, cada linea trae primero los bits de mascara y luego el dibujo."""
    tam = stride * h
    filas = (n + cols - 1) // cols
    W, H = cols * w, filas * h
    px = [[(20, 20, 40)] * W for _ in range(H)]
    ancho_bytes = w // 8
    for t in range(n):
        tx, ty = (t % cols) * w, (t // cols) * h
        for l in range(h):
            for by in range(ancho_bytes):
                o = ini - ORG + t * tam + l * stride
                if mascara:
                    # En este binario el DIBUJO va primero y la mascara detras;
                    # al reves que en la version de Spectrum. Comprobado: con el
                    # otro orden salen casi todos los pixeles transparentes.
                    v = b[o + by]
                    m = b[o + ancho_bytes + by]
                else:
                    m, v = 0, b[o + by]
                for bit in range(8):
                    on = (v >> (7 - bit)) & 1
                    # La mascara marca con 1 los pixeles del PROPIO sprite, no
                    # el hueco: por eso se niega para saber que es transparente.
                    hueco = not ((m >> (7 - bit)) & 1)
                    if mascara and hueco:
                        c = (20, 20, 40)          # transparente
                    else:
                        c = (255, 255, 255) if on else (0, 0, 0)
                    px[ty + l][tx + by * 8 + bit] = c
    if esc > 1:
        px = [[px[y // esc][x // esc] for x in range(W * esc)] for y in range(H * esc)]
        W, H = W * esc, H * esc
    return px, W, H


def main(argv):
    if len(argv) < 3:
        print(__doc__)
        return 2
    b = open(argv[1], "rb").read()
    salida = argv[2]
    os.makedirs(salida, exist_ok=True)
    for nombre, ini, n, w, h, stride, msk in GRAFICOS:
        fin = ini + n * stride * h
        if fin - ORG > len(b):
            print("  %-11s 0x%04X-0x%04X se sale del bloque, no se dibuja" % (nombre, ini, fin))
            continue
        cols = 12 if w >= 24 else 16
        esc = 1 if w >= 24 else 3
        px, W, H = dibuja(b, ini, n, w, h, stride, msk, cols, esc)
        ruta = os.path.join(salida, nombre + ".png")
        png(ruta, W, H, px)
        print("  %-11s 0x%04X-0x%04X  %3d de %dx%d  ->  %s (%dx%d)"
              % (nombre, ini, fin - 1, n, w, h, ruta, W, H))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
