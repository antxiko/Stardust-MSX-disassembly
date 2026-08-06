#!/usr/bin/env python3
"""Deja un replay de openMSX apuntando a la cinta de este proyecto.

Un replay guarda la ruta ABSOLUTA de la cinta con la que se grabo. El de Araubi
trae la suya, de una instalacion de Windows:

    D:/Juegos/RomVault/RomRoot/TOSEC/MSX MSX - Games/Stardust (1987)...cas.zip

que aqui no existe, asi que openMSX se niega a cargarlo. Esto reescribe esa
referencia en una COPIA -el fichero original no se toca- y deja el replay listo
para reproducirlo con `stardust.tsx`.

Ojo con lo que esto NO garantiza: la cinta con la que se grabo era otro volcado,
en otro formato. Que el replay cargue no quiere decir que siga sincronizado 38
minutos despues. Eso se comprueba mirando por donde va el PC al final, no
suponiendolo.

Uso: prepara_replay.py <replay.omr> <cinta.tsx> <salida.omr>
"""
import gzip
import os
import re
import sys

# La ruta va escapada como XML dentro del fichero, comillas incluidas.
CAMPO = re.compile(r"<(original|resolved)>([^<]*)</\1>")


def main(argv):
    if len(argv) < 4:
        print(__doc__)
        return 2
    origen, cinta, destino = argv[1], argv[2], argv[3]
    cinta = os.path.abspath(cinta)
    if not os.path.exists(cinta):
        print(f"  no encuentro la cinta: {cinta}")
        return 1

    with gzip.open(origen, "rb") as f:
        xml = f.read().decode("utf-8")

    rutas = {m.group(2) for m in CAMPO.finditer(xml)}
    if not rutas:
        print("  este replay no declara ninguna imagen de cinta")
        return 1

    n = 0
    for ruta in rutas:
        n += xml.count(f"<original>{ruta}</original>")
        n += xml.count(f"<resolved>{ruta}</resolved>")
        xml = xml.replace(f"<original>{ruta}</original>", f"<original>{cinta}</original>")
        xml = xml.replace(f"<resolved>{ruta}</resolved>", f"<resolved>{cinta}</resolved>")
        print(f"  {ruta[:70]}")

    with gzip.open(destino, "wb") as f:
        f.write(xml.encode("utf-8"))
    print(f"  -> {cinta}")
    print(f"  {n} referencias reescritas en {destino}")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
