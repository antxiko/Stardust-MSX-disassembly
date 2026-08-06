#!/usr/bin/env python3
"""Presupuesto del binario: cuantos bytes estan EXPLICADOS y cuantos no.

El porcentaje de codigo trazado no mide lo que interesa. En este juego el 87%
del binario son datos (graficos y mapas de pantalla), asi que "12,9% de codigo"
suena a desensamblado incompleto cuando en realidad puede estar casi entero.

Lo que de verdad mide el avance es que no queden bytes sin explicar: cada byte
tiene que ser o codigo alcanzado por el trazador, o caer en un rango de datos
identificado en las notas.

Uso: coverage.py <trace.json> <notes> <tamano> <org>
"""
import json
import re
import sys


def main(tracepath, notespath, size, org):
    size, org = int(size), int(org, 0)
    tr = json.load(open(tracepath))

    estado = [0] * size          # 0 = sin explicar, 1 = codigo, 2 = datos
    for kind, a, b in tr["blocks"]:
        if kind == "c":
            for i in range(max(0, a - org), min(size, b - org)):
                estado[i] = 1

    rangos = []
    for ln in open(notespath, encoding="utf-8"):
        m = re.match(r"^D\s+(\S+)\s+(\S+)\s+(\S+)\s*(.*)$", ln.strip())
        if m:
            a, b = int(m.group(1), 0), int(m.group(2), 0)
            rangos.append((a, b, m.group(3), m.group(4)))
            for i in range(max(0, a - org), min(size, b - org)):
                if estado[i] == 0:
                    estado[i] = 2

    ncod = estado.count(1)
    ndat = estado.count(2)
    nsin = estado.count(0)
    print(f"PRESUPUESTO DEL BINARIO  ({size} bytes desde {org:#06x})")
    print(f"  codigo trazado          {ncod:6d}  {ncod*100/size:5.1f}%")
    print(f"  datos identificados     {ndat:6d}  {ndat*100/size:5.1f}%")
    print(f"  SIN EXPLICAR            {nsin:6d}  {nsin*100/size:5.1f}%")
    print(f"  --------------------------------------")
    print(f"  explicado               {ncod+ndat:6d}  {(ncod+ndat)*100/size:5.1f}%")

    if nsin:
        print(f"\nHuecos sin explicar (los mayores primero):")
        huecos, i = [], 0
        while i < size:
            if estado[i] == 0:
                j = i
                while j < size and estado[j] == 0:
                    j += 1
                huecos.append((j - i, org + i, org + j))
                i = j
            else:
                i += 1
        for n, a, b in sorted(huecos, reverse=True)[:15]:
            print(f"  {a:#06x}..{b:#06x}  {n:6d} bytes")
        if len(huecos) > 15:
            print(f"  ... y {len(huecos)-15} huecos mas")
    return 0


if __name__ == "__main__":
    sys.exit(main(*sys.argv[1:5]))
