#!/usr/bin/env python3
"""Dibuja lo que hay en la VRAM tal y como lo veria el televisor.

A diferencia de render_maps.py, que trabaja sobre los datos del binario, esto
parte de un volcado de la memoria de video del emulador: es lo que de verdad se
esta viendo en pantalla en ese instante.

Detalle del SCREEN 2 que hay que respetar: la pantalla esta partida en tres
tercios de 8 filas, y cada tercio tiene su PROPIO juego de patrones y de colores.
Los patrones del tercio T estan en 0x0000 + T*2048 y sus colores en
0x2000 + T*2048.

Uso: render_vram.py <fichero.vram> <salida.png> [backdrop]
"""
import sys

sys.path.insert(0, __file__.rsplit("/", 1)[0])
from render_maps import PALETA, png  # noqa: E402


def render_vram(v, escala=2, backdrop=1, filas=24):
    w, h = 32 * 8 * escala, filas * 8 * escala
    fondo = PALETA[backdrop]
    img = [[fondo] * w for _ in range(h)]
    for fy in range(filas):
        tercio = fy // 8
        pat_base = tercio * 0x800
        col_base = 0x2000 + tercio * 0x800
        for fx in range(32):
            tile = v[0x1800 + fy * 32 + fx]
            for l in range(8):
                pat = v[pat_base + tile * 8 + l]
                col = v[col_base + tile * 8 + l]
                ci1, ci0 = (col >> 4) & 15, col & 15
                c1 = fondo if ci1 == 0 else PALETA[ci1]
                c0 = fondo if ci0 == 0 else PALETA[ci0]
                for b in range(8):
                    rgb = c1 if pat & (0x80 >> b) else c0
                    for sy in range(escala):
                        for sx in range(escala):
                            img[(fy * 8 + l) * escala + sy][(fx * 8 + b) * escala + sx] = rgb
    return w, h, img


if __name__ == "__main__":
    v = open(sys.argv[1], "rb").read()
    bd = int(sys.argv[3]) if len(sys.argv) > 3 else 1
    w, h, img = render_vram(v, backdrop=bd)
    png(sys.argv[2], w, h, img)
    print(f"{sys.argv[2]}  ({w}x{h})")
