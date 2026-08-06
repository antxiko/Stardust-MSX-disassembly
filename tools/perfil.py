#!/usr/bin/env python3
"""Radiografia un binario y dice donde CAMBIA la naturaleza de los datos.

Para que sirve: cuando un bloque tiene 23 KB seguidos sin codigo, probar
geometrias a ojo -patrones a varios anchos, sprites, desintercalados- es perder
el tiempo, porque lo que hay dentro no es una sola cosa. Lo que si funciona es
medir por trozos y ver donde saltan las medidas.

Tres medidas, que juntas distinguen bastante bien:

  - racha media de bits iguales. Un dibujo de trazos continuos la tiene LARGA
    (3 o mas); el azar da 2,00 exacto; un tramado en damero la tiene CORTA, asi
    que ojo: racha corta NO quiere decir "no es un dibujo".
  - entropia en bits por byte. El relleno se va a cero, los datos comprimidos o
    muy variados se acercan a 8.
  - cuantos valores distintos. Una tabla usa pocos; un grafico, muchos.

Y una comprobacion aparte para las tablas de color de SCREEN 2, que tienen una
firma inconfundible: el byte es tinta<<4|fondo, asi que en una zona de color de
un decorado el nibble bajo se repite muchisimo (suele ser el color de fondo).

Uso: perfil.py <binario> <org> [ventana]
"""
import math
import sys
from collections import Counter


def racha(b):
    bits = "".join(format(c, "08b") for c in b)
    tot, n = [], 1
    for i in range(1, len(bits)):
        if bits[i] == bits[i - 1]:
            n += 1
        else:
            tot.append(n)
            n = 1
    tot.append(n)
    return sum(tot) / len(tot)


def entropia(b):
    c = Counter(b)
    n = len(b)
    return -sum(v / n * math.log2(v / n) for v in c.values())


def pinta_color(b):
    """Cuanto se parece a una tabla de color de SCREEN 2: 0 a 1."""
    bajos = Counter(x & 15 for x in b)
    return bajos.most_common(1)[0][1] / len(b)


def clasifica(ra, en, di, col):
    if en < 1.0:
        return "relleno"
    if col > 0.85 and di < 40:
        return "COLOR (SCREEN 2)"
    if di < 40:
        return "tabla"
    if ra >= 3.0:
        return "grafico"
    if ra < 2.0 and di > 100:
        return "grafico tramado?"
    return "datos"


def main(argv):
    if len(argv) < 3:
        print(__doc__)
        return 2
    with open(argv[1], "rb") as f:
        b = f.read()
    org = int(argv[2], 0)
    v = int(argv[3]) if len(argv) > 3 else 256

    print("  %-17s %6s %8s %9s %6s  %s"
          % ("rango", "racha", "entropia", "distintos", "color", "que parece"))
    ant = None
    for off in range(0, len(b) - v + 1, v):
        t = b[off:off + v]
        ra, en, di, col = racha(t), entropia(t), len(set(t)), pinta_color(t)
        cl = clasifica(ra, en, di, col)
        marca = ""
        if ant is not None and cl != ant:
            marca = "   <-- FRONTERA"
        print("  0x%04X-0x%04X   %5.2f    %5.2f      %4d   %4.0f%%  %s%s"
              % (org + off, org + off + v - 1, ra, en, di, 100 * col, cl, marca))
        ant = cl
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
