#!/usr/bin/env python3
"""Cruza TODAS las zonas declaradas como datos contra lo que el trazador cree.

Por que hace falta, y por que no basta con check_trace.py: aquel vigila las
zonas del fichero .nocode, que son un punado. Pero las zonas de datos de verdad
estan declaradas con directivas `D` en los ficheros de notas, y son decenas. Si
una semilla mal puesta mete al trazador dentro de una de ellas, el listado
desensambla datos como si fueran instrucciones y la cobertura sube contando
mentiras.

No es hipotetico. El 2026-08-11, "renombrar unas etiquetas" destapo que una
semilla en 0xCC3E caia dentro de un guion de musica y hacia leer 1318 de los
1380 bytes de la banda sonora de la fase de a pie como codigo: el 95,5 % de la
zona. Fue la TERCERA vez que el proyecto publico una cobertura inflada por la
misma clase de error.

Lo que hace: para cada rango `D` de cada modulo, mira cuantos de sus bytes caen
en bloques que el trazado marca como codigo, y avisa. Un solapamiento pequeno
puede ser legitimo -una tabla que empieza justo donde acaba una rutina, un rango
declarado con holgura-, asi que se ordena por gravedad y se da el porcentaje,
que es lo que distingue un byte de borde de una zona entera mal leida.

Uso:  check_datos_como_codigo.py <dir_work> <dir_src> [--umbral N]
Codigo de salida 1 si alguna zona supera el umbral (por defecto, 16 bytes).
"""
import json
import os
import re
import sys

MODULOS = ("topo", "loader", "pre", "juego", "parte2")


def declaraciones(notas):
    """Los rangos `D 0xAAAA 0xBBBB descripcion` del fichero de notas."""
    if not os.path.exists(notas):
        return []
    fuera = []
    for linea in open(notas, encoding="utf-8"):
        m = re.match(r"D 0x([0-9A-Fa-f]{4}) 0x([0-9A-Fa-f]{4})\s*(.*)", linea)
        if m:
            fuera.append((int(m.group(1), 16), int(m.group(2), 16),
                          m.group(3).strip()))
    return fuera


def codigo(trace):
    with open(trace, encoding="utf-8") as f:
        d = json.load(f)
    return [(a, b) for t, a, b in d["blocks"] if t == "c"]


def main(work, src, *resto):
    umbral = 16
    for a in resto:
        if a.startswith("--umbral"):
            umbral = int(a.split("=")[1])

    sospechosas = []
    total_zonas = 0
    for m in MODULOS:
        trace = os.path.join(work, m + ".trace.json")
        notas = os.path.join(src, m + ".notes")
        if not os.path.exists(trace):
            continue
        bloques = codigo(trace)
        for ini, fin, desc in declaraciones(notas):
            total_zonas += 1
            solapa = sum(min(b, fin) - max(a, ini)
                         for a, b in bloques if min(b, fin) > max(a, ini))
            if solapa:
                sospechosas.append((solapa, 100.0 * solapa / max(1, fin - ini),
                                    m, ini, fin, desc))

    print("Cruzando %d zonas de datos declaradas contra el trazado." % total_zonas)
    if not sospechosas:
        print("  OK: ninguna zona declarada como datos aparece como codigo")
        return 0

    graves = [s for s in sospechosas if s[0] >= umbral]
    print("  %d zonas se solapan con codigo; %d por encima del umbral (%d B)" % (
        len(sospechosas), len(graves), umbral))
    print()
    for solapa, pct, m, ini, fin, desc in sorted(sospechosas, reverse=True)[:20]:
        marca = "GRAVE " if solapa >= umbral else "  roce"
        print("  %s %-7s 0x%04X-0x%04X  %5d B de %5d como codigo (%5.1f %%)  %s" % (
            marca, m, ini, fin - 1, solapa, fin - ini, pct, desc[:44]))
    if graves:
        print()
        print("  Una zona entera leida como codigo es cobertura FALSA: hay una")
        print("  semilla metida dentro. Un roce de pocos bytes suele ser un")
        print("  rango declarado con holgura, y se arregla ajustando el rango.")
    return 1 if graves else 0


if __name__ == "__main__":
    sys.exit(main(*sys.argv[1:]))
