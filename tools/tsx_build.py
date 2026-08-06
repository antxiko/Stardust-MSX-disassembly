#!/usr/bin/env python3
"""Reconstruye un TSX a partir de un manifiesto y de los ficheros de datos.

Es la operacion inversa de tsx_parse.py. Sirve para dos cosas:

1. Como prueba de que entendemos el formato: si se reconstruye el TSX con los
   datos originales y sale un fichero identico byte a byte al de partida, es que
   el parser no se deja nada por el camino.
2. Para generar una cinta nueva a partir de los binarios que produce el build,
   y poder probar en el emulador una version modificada del juego.

El manifiesto lo genera tsx_parse.py con --manifest. Cada bloque guarda su
cabecera literal (los parametros de modulacion, pausas, etc. tal cual venian) y,
si tiene datos, el fichero donde estan.
"""
import json
import os
import struct
import sys


def build(manifest_path, outpath, datadir=None):
    man = json.load(open(manifest_path))
    base = datadir or os.path.dirname(manifest_path)
    out = bytearray(b"ZXTape!\x1a")
    out.append(man["version"][0])
    out.append(man["version"][1])

    for b in man["blocks"]:
        bid = b["id"]
        head = bytes.fromhex(b["head"])
        if b.get("data"):
            payload = open(os.path.join(base, b["data"]), "rb").read()
        else:
            payload = b""

        out.append(bid)
        if bid == 0x4B:
            # DWORD longitud (cabecera de 12 bytes + datos), luego todo seguido
            out += struct.pack("<I", len(head) + len(payload))
            out += head + payload
        elif bid == 0x10:
            # head = WORD pausa; luego WORD longitud y los datos
            out += head + struct.pack("<H", len(payload)) + payload
        else:
            # Bloques sin datos sustituibles: se vuelcan tal cual
            out += head + payload

    open(outpath, "wb").write(out)
    print(f"{outpath}: {len(out)} bytes, {len(man['blocks'])} bloques")


if __name__ == "__main__":
    build(sys.argv[1], sys.argv[2], sys.argv[3] if len(sys.argv) > 3 else None)
