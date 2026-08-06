#!/usr/bin/env python3
"""Presupuesto de la cinta: ni un byte sin explicar.

Por que este control y no el porcentaje de codigo trazado: mas de la mitad de
esta cinta son datos, asi que un porcentaje de codigo bajo suena a trabajo a
medias cuando puede estar entero. Lo que mide el avance de verdad es que cada
byte sea una de estas cosas:

  - codigo que el trazador alcanza de verdad siguiendo el flujo
  - un byte dentro de un rango de datos IDENTIFICADO en el fichero de notas
  - parte del cargador BASIC, que es texto plano

OJO con la particularidad de este juego: los bloques SE SOLAPAN en memoria. El
del juego machaca al de la pantalla de carga, y la segunda parte cae dentro del
primero. Asi que la suma se hace sobre los BLOQUES DE LA CINTA, cada uno con su
org, y no sobre una imagen unica de 64K: en memoria esos bytes nunca conviven.

Y es un control DISTINTO del de reproducibilidad. Un byte puede reensamblar
perfecto y estar sin explicar; o peor, estar mal explicado: si unos graficos se
marcan como codigo, el binario reensamblado sigue saliendo identico -los bytes
no cambian, solo su lectura- y el listado miente igual.

Uso: presupuesto.py <directorio_work> <directorio_src>
"""
import json
import os
import sys

# nombre del modulo, org, fichero .raw, prefijo de sus ficheros de trazado/notas
MODULOS = [
    ("topo",   0x9470, "topo.raw",   "topo"),
    ("loader", 0xD2F0, "loader.raw", "loader"),
    ("pre",    0x9B8C, "pre.raw",    "pre"),
    ("juego",  0x47A0, "juego.raw",  "juego"),
    ("parte2", 0x61D0, "parte2.raw", "parte2"),
]

# Bloques pequenos que no llevan codigo y se explican de una linea.
SUELTOS = [
    ("descriptor", 8, "ld ix,0x61D0 / ld de,0x74A5: dice donde va la segunda parte"),
]

# El cargador de cinta, que es un fichero de texto y no lleva codigo.
CARGADOR = ("cargador BASIC", 256, "cinco lineas de texto y relleno hasta 256")


def rangos_de_notas(path):
    """Saca los rangos de datos declarados con la directiva D del fichero .notes."""
    out = []
    if not os.path.exists(path):
        return out
    for ln in open(path, encoding="utf-8"):
        ln = ln.strip()
        if not ln.startswith("D "):
            continue
        p = ln.split(None, 3)
        out.append((int(p[1], 0), int(p[2], 0)))
    return out


def revisa(work, src, nombre, org, raw, pref):
    size = len(open(os.path.join(work, raw), "rb").read())
    estado = bytearray(size)          # 0 sin explicar, 1 codigo, 2 datos con nombre

    tr = json.load(open(os.path.join(work, f"{pref}.trace.json")))
    for kind, a, b in tr["blocks"]:
        if kind == "c":
            for i in range(max(0, a - org), min(size, b - org)):
                estado[i] = 1

    for a, b in rangos_de_notas(os.path.join(src, f"{pref}.notes")):
        for i in range(max(0, a - org), min(size, b - org)):
            if estado[i] == 0:
                estado[i] = 2

    codigo = estado.count(1)
    datos = estado.count(2)
    huerfanos = estado.count(0)
    return size, codigo, datos, huerfanos, estado


def huecos(estado, org):
    """Agrupa los bytes sin explicar en rangos, para poder ir a mirarlos."""
    out, ini = [], None
    for i, v in enumerate(estado):
        if v == 0 and ini is None:
            ini = i
        elif v != 0 and ini is not None:
            out.append((org + ini, org + i))
            ini = None
    if ini is not None:
        out.append((org + ini, org + len(estado)))
    return out


def main():
    if len(sys.argv) != 3:
        sys.exit(__doc__)
    work, src = sys.argv[1], sys.argv[2]

    total = explicado = 0
    pendientes = []

    print(f"  {'modulo':16s} {'bytes':>7s} {'codigo':>7s} {'datos':>7s} {'sin explicar':>13s}")
    print("  " + "-" * 56)

    for nombre, org, raw, pref in MODULOS:
        size, cod, dat, huerf, estado = revisa(work, src, nombre, org, raw, pref)
        total += size
        explicado += cod + dat
        print(f"  {nombre:16s} {size:7d} {cod:7d} {dat:7d} {huerf:13d}")
        for a, b in huecos(estado, org):
            pendientes.append((nombre, a, b))

    print("  " + "-" * 56)
    for etiqueta, size, como in SUELTOS:
        total += size
        explicado += size
        print(f"  {etiqueta:16s} {size:7d}   {como}")
        total += 0   # ya sumado

    print("  " + "-" * 56)
    etiqueta, size, como = CARGADOR
    total += size
    explicado += size
    print(f"  {etiqueta:16s} {size:7d}   {como}")

    print("  " + "=" * 56)
    sin = total - explicado
    pct = 100.0 * explicado / total if total else 0
    print(f"  {'TOTAL':16s} {total:7d} bytes, {explicado} explicados ({pct:.2f}%), {sin} sin explicar")

    if pendientes:
        print()
        print("  Sin explicar:")
        for nombre, a, b in pendientes:
            print(f"    {nombre:6s} 0x{a:04X}..0x{b - 1:04X}  ({b - a} bytes)")
        print()
        print("  Cada uno de estos rangos tiene que acabar dentro de una directiva D")
        print("  del fichero de notas, con una explicacion de que es y de como se sabe.")
        sys.exit(1)

    print()
    print("  OK: ni un byte de la cinta sin asignar")


if __name__ == "__main__":
    main()
