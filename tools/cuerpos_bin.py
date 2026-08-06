#!/usr/bin/env python3
"""Separa la cabecera BIN del cuerpo en cada bloque extraido de la cinta.

Un fichero BIN grabado en cinta MSX empieza por seis bytes que no son parte del
programa: direccion de carga, direccion final y direccion de arranque, las tres
en little-endian. Lo que hay que desensamblar (o detokenizar) es lo que viene
detras, y este script lo recorta y de paso comprueba que el tamano declarado
cuadra con lo que trae el bloque de verdad.

Que un bloque traiga bytes de mas no es un error: el ultimo de la cinta viene
con un byte de relleno. Se avisa, se cuenta, y se guarda aparte para que no
quede ni un byte de la cinta sin justificar.

Uso: cuerpos_bin.py <dir_extracted> <dir_work>
"""
import json
import os
import sys

# nombre del modulo -> fichero que dejo tsx_parse.py en extracted/
BLOQUES = {
    "topo": "07_topo.bin",
    "scr": "09_scr.bin",
    "CM2": "11_CM2.bin",
    "CM1": "13_CM1.bin",
}


def main():
    if len(sys.argv) != 3:
        sys.exit(__doc__)
    ext, work = sys.argv[1], sys.argv[2]
    os.makedirs(work, exist_ok=True)

    resumen = {}
    total_sobra = 0
    for nombre, fichero in BLOQUES.items():
        ruta = os.path.join(ext, fichero)
        if not os.path.exists(ruta):
            sys.exit(f"falta {ruta}: hay que pasar antes tools/tsx_parse.py")
        d = open(ruta, "rb").read()
        carga = d[0] | (d[1] << 8)
        final = d[2] | (d[3] << 8)
        arranque = d[4] | (d[5] << 8)
        tam = final - carga + 1
        if tam <= 0 or 6 + tam > len(d):
            sys.exit(
                f"{nombre}: la cabecera declara 0x{carga:04X}..0x{final:04X} "
                f"({tam} bytes) y el bloque solo trae {len(d) - 6}"
            )
        cuerpo = d[6:6 + tam]
        sobra = d[6 + tam:]
        total_sobra += len(sobra)

        open(os.path.join(work, f"{nombre}.raw"), "wb").write(cuerpo)
        if sobra:
            open(os.path.join(work, f"{nombre}.relleno"), "wb").write(sobra)

        resumen[nombre] = {
            "carga": carga, "final": final, "arranque": arranque,
            "tam": tam, "relleno": len(sobra),
        }
        aviso = f"  + {len(sobra)} byte(s) de relleno" if sobra else ""
        print(
            f"  {nombre:4s} carga=0x{carga:04X} fin=0x{final:04X} "
            f"arranque=0x{arranque:04X}  {tam:6d} bytes{aviso}"
        )

    json.dump(resumen, open(os.path.join(work, "bloques.json"), "w"), indent=2)
    if total_sobra:
        print(f"  ({total_sobra} byte(s) de relleno en total, guardados en {work}/*.relleno)")


if __name__ == "__main__":
    main()
