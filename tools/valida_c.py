#!/usr/bin/env python3
"""Comprueba los comentarios de linea de las notas antes de reensamblar.

Dos cosas: que cada C cae en el primer byte de una instruccion, y que no hay dos
C para la misma direccion (la segunda pisaria a la primera sin avisar).

El test lo caza igual, pero aqui se ve al momento y con la linea del fichero.

Uso: valida_c.py <asm> <notes> [--arregla]

Con --arregla quita los repetidos dejando el ULTIMO, y dice cual ha quitado.
"""
import re
import sys

buenas = set()
for ln in open(sys.argv[1], encoding="utf-8"):
    m = re.match(r"^\t.*;([0-9a-f]{4})", ln)
    if m:
        buenas.add(int(m.group(1), 16))
lineas = open(sys.argv[2], encoding="utf-8").readlines()
arregla = "--arregla" in sys.argv
malas, vistos, repes = [], {}, []
for i, ln in enumerate(lineas):
    m = re.match(r"^C 0x([0-9A-Fa-f]{4})\s", ln)
    if not m:
        continue
    d = int(m.group(1), 16)
    if d not in buenas:
        malas.append((i + 1, ln.rstrip()))
    if d in vistos:
        repes.append(vistos[d])
    vistos[d] = i
for i, ln in malas:
    print("  fuera de sitio, linea %d: %s" % (i, ln))
for i in repes:
    print("  repetido%s: %s" % (" (quitado)" if arregla else "", lineas[i].rstrip()))
if arregla and repes:
    for i in sorted(repes, reverse=True):
        del lineas[i]
    open(sys.argv[2], "w", encoding="utf-8").writelines(lineas)
    repes = []
print("  ---- %d fuera de sitio, %d repetidos" % (len(malas), len(repes)))
sys.exit(1 if malas or repes else 0)
