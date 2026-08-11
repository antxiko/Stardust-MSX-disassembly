#!/usr/bin/env python3
"""Reapunta la cinta de un replay de openMSX grabado en otra maquina.

El problema: `Stardust.omr` es la partida completa de 38 minutos, y viene
grabada en Windows con openMSX 17.0-rc1. Dentro lleva escrita la ruta ABSOLUTA
del fichero de cinta que se uso:

    D:/Juegos/RomVault/RomRoot/TOSEC/MSX MSX - Games/Stardust (1987)...cas.zip

Al cargarlo aqui, openMSX no encuentra esa ruta y aborta con "Failed to insert
image", asi que el replay -que es la mejor fuente de medidas del proyecto- no se
puede usar. Esto lo arregla escribiendo la ruta de la cinta local en su lugar.

Un .omr es XML comprimido con gzip, y la referencia vive en el nodo `casImage`,
en `<original>` y `<resolved>`. No lleva checksum del fichero, asi que basta con
cambiar la ruta.

Y no importa que la cinta no sea exactamente la misma imagen: un replay de
openMSX guarda instantaneas periodicas del estado completo de la maquina, asi
que para saltar a un instante posterior a la carga no hace falta releer la
cinta. Lo que hace falta es que el fichero EXISTA para que la maquina se pueda
montar.

NO TOCA EL ORIGINAL: escribe una copia.

Uso:  arregla_replay.py <entrada.omr> <cinta> <salida.omr>
"""
import gzip
import os
import re
import sys


def main(entrada, cinta, salida):
    cinta = os.path.abspath(cinta)
    if not os.path.exists(cinta):
        print("no existe la cinta: %s" % cinta)
        return 2
    with gzip.open(entrada, "rb") as f:
        xml = f.read().decode("utf-8", "replace")

    rutas = set()
    for m in re.finditer(r"<casImage>\s*<original>([^<]*)</original>", xml):
        rutas.add(m.group(1))
    if not rutas:
        print("este replay no lleva ninguna cinta puesta; no hay nada que hacer")
        return 1

    total = 0
    for r in rutas:
        n = xml.count(r)
        total += n
        print("  %s\n    -> %s   (%d referencias)" % (r, cinta, n))
        xml = xml.replace(r, cinta)

    with gzip.open(salida, "wb") as f:
        f.write(xml.encode("utf-8"))
    print("%d referencias reescritas -> %s" % (total, salida))
    return 0


if __name__ == "__main__":
    sys.exit(main(*sys.argv[1:]))
