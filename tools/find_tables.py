#!/usr/bin/env python3
"""Busca tablas de punteros en las zonas que el trazador no alcanza.

El trazador sigue saltos y llamadas, pero no puede seguir un `jp (hl)` cuyo
destino sale de una tabla. Esas tablas son justo la via por la que un juego de
esta epoca llega a la mayor parte de su codigo, asi que encontrarlas es lo que
desbloquea la cobertura.

Criterio para considerar que un grupo de words es una tabla de punteros:
  - N words consecutivos que caen dentro del binario,
  - apuntando a sitios que decodifican como codigo Z80 plausible,
  - y que no estan ya cubiertos por el trazado.

Da falsos positivos por naturaleza (dos bytes cualesquiera pueden parecer una
direccion), por eso la salida se ordena por verosimilitud y hay que revisarla:
sirve para decidir DONDE mirar, no como verdad.
"""
import json
import sys

sys.path.insert(0, __file__.rsplit("/", 1)[0])
from z80trace import Tracer  # noqa: E402


def parece_codigo(tr, addr, n=8):
    """Decodifica n instrucciones desde addr; puntua como codigo plausible.

    No basta con que las instrucciones decodifiquen (casi cualquier byte lo
    hace): se premia lo que parece un principio de rutina de verdad y se penaliza
    lo que suele salir al desensamblar graficos.
    """
    if not tr.inside(addr):
        return -1
    pc, score, vistos = addr, 0, 0
    ARRANQUE = {0xF5, 0xC5, 0xD5, 0xE5, 0xDD, 0xFD, 0xF3, 0x3E, 0x21, 0x11, 0x01, 0xCD}
    if tr.byte(addr) in ARRANQUE:
        score += 3          # push/ld rr,nn/call/di al principio: tipico de rutina
    for _ in range(n):
        ln = tr.ilen(pc)
        if ln == 0 or not tr.inside(pc + ln - 1):
            break
        op = tr.byte(pc)
        vistos += 1
        if op in (0xC9, 0xC3, 0xCD):
            score += 2      # ret / jp / call
        elif op == 0x00:
            score -= 1      # muchos NOP seguidos suelen ser datos a cero
        elif op == 0xFF:
            score -= 1
        pc += ln
    return score if vistos >= 4 else -1


def main(binpath, org, tracepath, minlen=4):
    data = open(binpath, "rb").read()
    org = int(org, 0)
    tr = Tracer(data, org)
    tracejson = json.load(open(tracepath))

    # Bytes ya identificados como codigo: no hace falta redescubrirlos.
    cubierto = bytearray(len(data))
    for kind, a, b in tracejson["blocks"]:
        if kind == "c":
            for i in range(a - org, b - org):
                cubierto[i] = 1

    cands, i = [], 0
    while i < len(data) - 1:
        if cubierto[i]:
            i += 1
            continue
        run, j = [], i
        while j < len(data) - 1 and not cubierto[j]:
            w = data[j] | (data[j + 1] << 8)
            sc = parece_codigo(tr, w)
            if sc < 2 or cubierto[w - org] if tr.inside(w) else True:
                break
            run.append((org + j, w, sc))
            j += 2
        if len(run) >= minlen:
            cands.append(run)
            i = j
        else:
            i += 1

    cands.sort(key=lambda r: (len(r), sum(x[2] for x in r)), reverse=True)
    print(f"# {len(cands)} tablas candidatas en {binpath} "
          f"(minimo {minlen} punteros seguidos)")
    print("# REVISAR A MANO: dos bytes cualesquiera pueden parecer una direccion.")
    destinos = set()
    for run in cands[:25]:
        a0 = run[0][0]
        print(f"\ntabla en {a0:#06x}  ({len(run)} punteros)")
        for a, w, sc in run[:12]:
            print(f"    {a:#06x}: -> {w:#06x}  (verosimilitud {sc})")
            destinos.add(w)
        if len(run) > 12:
            print(f"    ... y {len(run)-12} mas")
    print(f"\n# {len(destinos)} destinos distintos. Para sembrarlos en el trazador:")
    for w in sorted(destinos):
        print(f"{w:#06x}")


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2], sys.argv[3],
         int(sys.argv[4]) if len(sys.argv) > 4 else 4)
