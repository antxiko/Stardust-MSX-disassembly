#!/usr/bin/env python3
"""Clasifica los bytes que el presupuesto deja sin explicar, midiendo.

El presupuesto exige que cada byte sea codigo alcanzado o un rango de datos con
nombre. Poner esos nombres a mano en un bloque de 46 KB no es viable, y ponerlos
a ojo seria peor: acabarias escribiendo "graficos" encima de cualquier cosa.

Asi que aqui cada rango se clasifica con las mismas tres medidas del perfil, y
la etiqueta que sale DICE de que medida viene. Si alguien discute una, puede
repetirla:

  - racha media de bits iguales. Un dibujo de trazos continuos la tiene larga;
    el azar da 2,00; un tramado en damero la tiene CORTA, asi que racha corta no
    significa "no es un dibujo".
  - entropia en bits por byte. El relleno se va a cero.
  - cuantos valores distintos, y si el nibble bajo se repite (firma de las
    tablas de color de SCREEN 2, donde el byte es tinta<<4|fondo).

Lo que no se puede clasificar con confianza se etiqueta como tal, sin adornos.

Uso: clasifica_huecos.py <binario> <org> <ini> <fin>   (uno)
     clasifica_huecos.py <binario> <org> --lista       (lee rangos por la entrada)
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


def clasifica(b):
    """Devuelve (etiqueta, detalle medido)."""
    if len(b) < 8:
        return "relleno o resto", "%d bytes" % len(b)
    ra, en, di = racha(b), entropia(b), len(set(b))
    bajos = Counter(x & 15 for x in b).most_common(1)[0]
    col = bajos[1] / len(b)
    m = "racha %.2f, entropia %.2f, %d valores" % (ra, en, di)
    if en < 0.6:
        v = Counter(b).most_common(1)[0]
        return "relleno", "%d de %d bytes son 0x%02X" % (v[1], len(b), v[0])
    if col > 0.85 and di < 48:
        return "colores (SCREEN 2)", "%s, el nibble bajo es 0x%X en el %.0f%%" % (m, bajos[0], 100 * col)
    if di < 24:
        return "tabla", "%s: pocos valores para ser un dibujo" % m
    if ra >= 3.0:
        return "graficos", "%s: rachas mas largas que el azar" % m
    if ra < 2.0 and di > 80:
        return "graficos tramados", "%s: rachas cortas y muchos valores, firma del damero" % m
    return "datos sin clasificar", m


def main(argv):
    if len(argv) < 3:
        print(__doc__)
        return 2
    b = open(argv[1], "rb").read()
    org = int(argv[2], 0)
    rangos = []
    if len(argv) > 3 and argv[3] != "--lista":
        rangos = [(int(argv[3], 0), int(argv[4], 0))]
    else:
        for ln in sys.stdin:
            p = ln.replace("..", " ").replace("(", " ").split()
            try:
                rangos.append((int(p[1], 16), int(p[2], 16) + 1))
            except (ValueError, IndexError):
                continue
    for a, f in rangos:
        t = b[a - org:f - org]
        if not t:
            continue
        etq, det = clasifica(t)
        print("D 0x%04X 0x%04X %s (%d B; %s)" % (a, f, etq, len(t), det))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
