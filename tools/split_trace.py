#!/usr/bin/env python3
"""Parte el trazado de la imagen de 64K en los trozos reales del juego.

Ale Hop! no se puede desensamblar de una pieza: se carga entero en 0x0000 y
luego SLOTS recoloca tres trozos a 0xB000, 0xBD00 y 0xD000. Las direcciones de
EJECUCION son las buenas para leer el codigo (los CALL y los JP apuntan ahi),
pero el orden de la CINTA es el que hay que reproducir para que el reensamblado
de el binario original.

La solucion es tratar cada trozo como un modulo con su propio `org`, y
concatenarlos en orden de carga. Este script saca, para cada trozo:
  - su binario recortado de la imagen de 64K
  - su .trace.json con solo los bloques que le caen dentro

Verificado: concatenar los cinco trozos en orden de carga da exactamente los
42645 bytes del bloque turbo 2, mismo sha256.

Uso: split_trace.py <imagen64k> <trace64k.json> <directorio_salida>
"""
import json
import sys

# nombre, org (= direccion de ejecucion), primer byte, ultimo byte, offset en la cinta
TROZOS = [
    ("datos",  0x0000, 0x0000, 0x8A40, 0x0000),
    ("sonido", 0xB000, 0xB000, 0xB898, 0x8A41),
    ("nucleo", 0xBD00, 0xBD00, 0xC53F, 0x92DA),
    ("extra",  0xD000, 0xD000, 0xDB79, 0x9B1A),
    ("cola",   0xA694, 0xA694, 0xA694, 0xA694),
]


def recorta(tr, lo, fin):
    """Bloques que caen en [lo,fin), recortados.

    OJO con el convenio: z80trace emite los bloques con el extremo derecho
    EXCLUSIVO, [ini,fin), y mkasm los consume igual. Tratarlos como cerrados
    hace que se pierda el ultimo byte de cada trozo y el reensamblado sale
    un byte corto.
    """
    bloques = []
    for k, a, b in tr["blocks"]:
        if b <= lo or a >= fin:
            continue
        bloques.append([k, max(a, lo), min(b, fin)])
    bloques.sort(key=lambda x: x[1])

    # El trozo tiene que quedar cubierto entero, sin huecos: lo que no cubra
    # ningun bloque son datos.
    completo, cursor = [], lo
    for k, a, b in bloques:
        if a > cursor:
            completo.append(["d", cursor, a])
        completo.append([k, a, b])
        cursor = b
    if cursor < fin:
        completo.append(["d", cursor, fin])
    return completo


def main():
    imgpath, trpath, outdir = sys.argv[1:4]
    img = open(imgpath, "rb").read()
    tr = json.load(open(trpath))

    total = 0
    for nombre, org, lo, hi, off in TROZOS:
        fin = hi + 1                      # los bloques van con extremo exclusivo
        n = fin - lo
        open(f"{outdir}/game_{nombre}.bin", "wb").write(img[lo:fin])
        bloques = recorta(tr, lo, fin)
        entradas = [a for a in tr["entries"] if lo <= a < fin]
        json.dump(dict(report=tr.get("report", {}), entries=sorted(entradas),
                       blind=[b for b in tr.get("blind", [])
                              if lo <= int(b[0], 16) < fin],
                       blocks=bloques),
                  open(f"{outdir}/game_{nombre}.trace.json", "w"), indent=1)
        ncode = sum(b - a for k, a, b in bloques if k == "c")
        print(f"  {nombre:8s} org {org:#06x}  {n:6d} B  "
              f"cinta[{off:#07x}]  codigo {ncode:5d} B ({100*ncode/n:5.1f}%)  "
              f"{len(entradas)} etiquetas")
        total += n
    print(f"  {'':8s} {'':11s} {total:6d} B en total "
          f"(el bloque turbo 2 son 42645)")


if __name__ == "__main__":
    main()
