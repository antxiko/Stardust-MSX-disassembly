#!/usr/bin/env python3
"""Dibuja los 29 mapas de pantalla del juego como imagenes PNG.

Sirve de comprobacion visual del formato: si la interpretacion "29 bloques de
512 bytes desde 0x9000, 32x16 tiles, un byte por casilla, fila a fila" es
correcta, tienen que salir pantallas de juego reconocibles. Si estuviera mal
(otro origen, otro tamano, o los tiles en columnas) saldria ruido.

Y de paso deja los mapas del juego en un formato que se puede mirar.

SCREEN 2 del MSX: cada tile son 8 filas de 8 pixeles. El patron dice que pixel
esta encendido y la tabla de color da, por cada fila del tile, dos colores en un
byte: el nibble alto para los bits a 1 y el bajo para los bits a 0.

No usa ninguna libreria: escribe el PNG a mano con zlib, que viene en Python.
"""
import struct
import sys
import zlib

# Paleta del TMS9918 (la del MSX1), en RGB
PALETA = [
    (0, 0, 0), (0, 0, 0), (62, 184, 73), (116, 208, 125),
    (89, 85, 224), (128, 118, 241), (185, 94, 81), (101, 219, 239),
    (219, 101, 89), (255, 137, 125), (204, 195, 94), (222, 208, 135),
    (58, 162, 65), (183, 102, 181), (204, 204, 204), (255, 255, 255),
]


def png(path, w, h, pixels):
    """Escribe un PNG RGB de 8 bits. pixels[y][x] = (r,g,b)."""
    raw = b"".join(b"\x00" + b"".join(bytes(px) for px in fila) for fila in pixels)
    def chunk(tipo, datos):
        c = struct.pack(">I", len(datos)) + tipo + datos
        return c + struct.pack(">I", zlib.crc32(tipo + datos) & 0xFFFFFFFF)
    with open(path, "wb") as f:
        f.write(b"\x89PNG\r\n\x1a\n")
        f.write(chunk(b"IHDR", struct.pack(">IIBBBBB", w, h, 8, 2, 0, 0, 0)))
        f.write(chunk(b"IDAT", zlib.compress(raw, 9)))
        f.write(chunk(b"IEND", b""))


def render(patrones, colores, mapa, cols=32, filas=16, escala=2, backdrop=1):
    """Dibuja un mapa. `backdrop` es el color de fondo del VDP.

    En el TMS9918 el color 0 no es negro: es TRANSPARENTE, y por debajo se ve el
    color de fondo de la pantalla (el registro 7 del VDP, que el juego fija con
    BDRCLR + CHGCLR). Tratarlo como negro dejaba el nivel 4 casi todo en negro
    cuando en realidad el agua es verde: 0x805E pone ese color a 1 (negro) en las
    pantallas normales y 0x8B5A lo cambia a 12 (verde) al entrar en el nivel 4.
    """
    w, h = cols * 8 * escala, filas * 8 * escala
    fondo = PALETA[backdrop]
    img = [[fondo] * w for _ in range(h)]
    for fy in range(filas):
        for fx in range(cols):
            tile = mapa[fy * cols + fx]
            for l in range(8):
                pat = patrones[tile * 8 + l]
                col = colores[tile * 8 + l]
                ci1, ci0 = (col >> 4) & 15, col & 15
                c1 = fondo if ci1 == 0 else PALETA[ci1]   # pixel encendido
                c0 = fondo if ci0 == 0 else PALETA[ci0]   # pixel apagado
                for b in range(8):
                    rgb = c1 if pat & (0x80 >> b) else c0
                    for sy in range(escala):
                        for sx in range(escala):
                            img[(fy * 8 + l) * escala + sy][(fx * 8 + b) * escala + sx] = rgb
    return w, h, img


def main(binpath, outdir, org=0x4000, base=0x9000, n=29):
    import os
    d = open(binpath, "rb").read()
    os.makedirs(outdir, exist_ok=True)
    patrones = d[0x4000 - org:0x4800 - org]
    colores = d[0x4800 - org:0x5000 - org]
    for i in range(n):
        a = base + i * 512
        mapa = d[a - org:a - org + 512]
        # Las pantallas 21..27 son el nivel 4, el acuatico: ahi el juego pone el
        # color de fondo a 12 (verde) en 0x8B5A. El resto lo deja en 1 (negro),
        # que es lo que hace 0x805E al empezar cada pantalla.
        backdrop = 12 if 21 <= i <= 27 else 1
        w, h, img = render(patrones, colores, mapa, backdrop=backdrop)
        # Las 28 primeras son las jugables; la 29 es la de victoria.
        if i < 28:
            nombre = f"nivel{i//7+1}_pantalla{i%7+1}_{i:02d}.png"
        else:
            nombre = f"final_{i:02d}.png"
        png(os.path.join(outdir, nombre), w, h, img)
        print(f"  {a:#06x} -> {nombre}")
    print(f"\n{n} mapas dibujados en {outdir}/")


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])
