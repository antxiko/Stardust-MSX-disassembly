#!/usr/bin/env python3
"""Cruza los periodos que el juego escribe de verdad en el PSG con la tabla.

Toda la lectura de la musica es deduccion sobre el listado: que quince comandos
hay, cuantos argumentos consume cada uno, que la tabla de 0xE6E3 son 96 notas y
que antes de indexarla se suma una transposicion. Esto lo contrasta contra el
hardware emulado.

La prueba es sencilla y dura: si la tabla de notas es la que decimos, TODO
periodo de tono que el juego meta en el chip tiene que estar en ella. Un solo
periodo fuera y algo esta mal leido.

Ojo con un matiz que evita cantar victoria de mas: el juego tambien produce
efectos con barridos de frecuencia, que van escribiendo periodos intermedios
que NO salen de la tabla. Por eso el resultado se da en dos columnas -los que
estan y los que no- y los que no se listan enteros, para poder mirarlos.

Uso:  coteja_psg.py dump/psg/psg.log work/juego.raw
"""
import re
import sys

ORG = 0x47A0
NOTAS = 0xE6E3
FIN_NOTAS = 0xE7A3
RELOJ = 3579545 / 2.0 / 16.0

CROMATICA = ["do", "do#", "re", "re#", "mi", "fa",
             "fa#", "sol", "sol#", "la", "la#", "si"]


def main(log, raw):
    d = open(raw, "rb").read()
    n = (FIN_NOTAS - NOTAS) // 2
    tabla = {}
    for i in range(n):
        p = d[NOTAS - ORG + i * 2] | (d[NOTAS - ORG + i * 2 + 1] << 8)
        tabla.setdefault(p, i)

    texto = open(log, encoding="utf-8").read()
    m = re.search(r"periodos vistos \((\d+) distintos\): (.*)", texto)
    if not m:
        print("el log no trae la linea de periodos; ¿acabo la captura?")
        return 2
    vistos = {}
    for par in m.group(2).split():
        p, v = par.split(":")
        vistos[int(p)] = int(v)

    dentro = {p: v for p, v in vistos.items() if p in tabla}
    fuera = {p: v for p, v in vistos.items() if p not in tabla}
    ev_dentro = sum(dentro.values())
    ev_fuera = sum(fuera.values())

    print("La tabla de notas tiene %d entradas (%d periodos distintos)." % (
        n, len(tabla)))
    print("El juego escribio %d periodos distintos en el PSG." % len(vistos))
    print()
    print("  EN la tabla:    %3d distintos, %6d escrituras" % (
        len(dentro), ev_dentro))
    print("  FUERA:          %3d distintos, %6d escrituras" % (
        len(fuera), ev_fuera))
    if ev_dentro + ev_fuera:
        print("  -> %.1f %% de las escrituras de tono son notas de la tabla" % (
            100.0 * ev_dentro / (ev_dentro + ev_fuera)))
    print()

    if dentro:
        print("Las notas mas tocadas:")
        for p, v in sorted(dentro.items(), key=lambda x: -x[1])[:12]:
            i = tabla[p]
            print("   periodo %5d = %-6s (nota %2d)  %5d veces  %8.2f Hz" % (
                p, "%s%d" % (CROMATICA[i % 12], i // 12 + 1), i, v, RELOJ / p))
        print()
    if fuera:
        print("Los que NO estan en la tabla (para poder mirarlos):")
        for p, v in sorted(fuera.items(), key=lambda x: -x[1])[:20]:
            print("   periodo %5d  %5d veces  %8.2f Hz" % (p, v, RELOJ / p))
    return 0


if __name__ == "__main__":
    sys.exit(main(*sys.argv[1:]))
