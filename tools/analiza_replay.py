#!/usr/bin/env python3
"""Cruza los PC muestreados de una partida contra el trazado y el presupuesto.

Responde a tres preguntas, y las tres hacen falta antes de tocar nada:

  1. Que codigo se ejecuto y el trazador NO alcanza. Cada uno de esos tramos es
     un punto de entrada legitimo: no una corazonada, sino una direccion por la
     que el procesador paso de verdad.

  2. Que rangos declarados como DATOS se ejecutaron. Si sale alguno, o el rango
     esta mal o la partida hizo algo raro, y hay que mirarlo antes de seguir:
     es exactamente la contradiccion que contamino este proyecto.

  3. Cuanto de lo que hoy figura como "datos sin clasificar" resulta ser codigo.

Uso: analiza_replay.py <pcs.txt> <modulo> [modulo...]
     donde <modulo> es juego, parte2, pre, loader o topo
"""
import json
import os
import re
import sys

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ORG = {"topo": 0x9470, "loader": 0xD2F0, "pre": 0x9B8C,
       "juego": 0x47A0, "parte2": 0x61D0}
TAM = {"topo": 4254, "loader": 351, "pre": 12468,
       "juego": 46663, "parte2": 29861}


def lee_pcs(ruta):
    pcs = {}
    for ln in open(ruta, encoding="utf-8"):
        p = ln.split()
        if len(p) == 2:
            try:
                pcs[int(p[0], 16)] = int(p[1])
            except ValueError:
                pass
    return pcs


def zonas_datos(modulo):
    z = []
    for fn, rx in ((f"src/{modulo}.notes",
                    r"^D\s+0x([0-9A-Fa-f]+)\s+0x([0-9A-Fa-f]+)\s+(.*)$"),
                   (f"src/{modulo}.nocode",
                    r"^0x([0-9A-Fa-f]+)\s+0x([0-9A-Fa-f]+)\s+(.*)$")):
        p = os.path.join(RAIZ, fn)
        if not os.path.exists(p):
            continue
        for ln in open(p, encoding="utf-8"):
            if ln.lstrip().startswith("#"):
                continue
            m = re.match(rx, ln.strip())
            if m:
                z.append((int(m.group(1), 16), int(m.group(2), 16),
                          m.group(3).strip()))
    return z


def trazado(modulo):
    """Devuelve el conjunto de direcciones que el trazador marca como codigo."""
    p = os.path.join(RAIZ, "work", f"{modulo}.trace.json")
    d = json.load(open(p))
    cod = set()
    for tipo, ini, fin in d.get("blocks", []):
        if tipo == "c":                   # 'c' codigo, 'd' datos
            cod.update(range(ini, fin))
    return cod


def agrupa(dirs, hueco=8):
    """Agrupa direcciones sueltas en rangos, tolerando huecos pequenos."""
    out, ini, prev = [], None, None
    for a in sorted(dirs):
        if ini is None:
            ini = prev = a
        elif a - prev <= hueco:
            prev = a
        else:
            out.append((ini, prev))
            ini = prev = a
    if ini is not None:
        out.append((ini, prev))
    return out


def main(argv):
    if len(argv) < 3:
        print(__doc__)
        return 2
    pcs = lee_pcs(argv[1])
    print(f"  {len(pcs)} PC distintos, {sum(pcs.values())} muestras")
    salida = 0
    for modulo in argv[2:]:
        org, fin = ORG[modulo], ORG[modulo] + TAM[modulo]
        dentro = {a: n for a, n in pcs.items() if org <= a < fin}
        print()
        print(f"=== {modulo}  (0x{org:04X}-0x{fin - 1:04X}) ===")
        print(f"  {len(dentro)} PC distintos dentro del bloque")
        if not dentro:
            continue

        cod = trazado(modulo)
        nuevos = [a for a in dentro if a not in cod]
        print(f"  ejecutados que el trazador NO alcanza: {len(nuevos)}")
        for a, b in agrupa(nuevos):
            m = sum(v for k, v in dentro.items() if a <= k <= b)
            print(f"     0x{a:04X}-0x{b:04X}  {b - a + 1:5d} B  {m:8d} muestras")

        zonas = zonas_datos(modulo)
        choque = {}
        for a in dentro:
            for i, f, t in zonas:
                if i <= a < f:
                    choque.setdefault((i, f, t), []).append(a)
                    break
        if choque:
            salida = 1
            print()
            print(f"  AVISO: {len(choque)} rangos declarados como DATOS se han ejecutado.")
            print("  O el rango esta mal, o lo esta la lectura de la partida.")
            for (i, f, t), ds in sorted(choque.items()):
                print(f"     0x{i:04X}-0x{f:04X} {t[:40]:40s} {len(ds)} PC")
        else:
            print("  OK: ningun rango declarado como datos se ha ejecutado")
    return salida


if __name__ == "__main__":
    sys.exit(main(sys.argv))
