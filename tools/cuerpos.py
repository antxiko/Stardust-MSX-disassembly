#!/usr/bin/env python3
"""Saca de la cinta el cuerpo de cada bloque, listo para desensamblar.

Stardust mezcla DOS formatos de bloque, y hay que quitarle a cada uno lo suyo:

  - Los dos primeros son bloques BIN del MSX: 6 bytes de cabecera con las tres
    direcciones (carga, fin, arranque) en little-endian. OJO: no llevan delante
    el 0xFE que uno espera; el fichero empieza directamente por la direccion de
    carga. Contar 7 en vez de 6 desplaza el desensamblado entero un byte y lo
    convierte en ruido convincente, que es peor que en ruido evidente.

  - Los otros cuatro son bloques del ZX SPECTRUM (TZX id 0x10): un byte de
    bandera, los datos, y un byte final que es el XOR de todo lo anterior. Aqui
    se comprueba ese XOR, que es la unica verificacion de integridad que trae
    la cinta.

Uso: cuerpos.py <extracted> <work>
"""
import json
import os
import sys

# Los cuatro bloques de datos, con la direccion donde los pone el cargador.
# Todas ellas estan leidas del propio codigo (ver .forja/mission.md), no supuestas.
BLOQUES_SPECTRUM = [
    ("09_raw_10.bin", "pre",    0x9B8C, "se carga, se EJECUTA, y luego lo machaca el juego"),
    ("10_raw_10.bin", "juego",  0x47A0, "el juego de naves, zonas 1 a 7"),
    ("11_raw_10.bin", "desc",   None,   "8 bytes que describen donde va el bloque siguiente"),
    ("12_raw_10.bin", "parte2", 0x61D0, "la segunda parte, la de a pie"),
]

BLOQUES_BIN = [
    ("06_TOPO.bin",   "topo",   "el logo de la casa"),
    ("08_LOADER.bin", "loader", "el cargador turbo"),
]


def cuerpo_bin(datos):
    """Los 6 bytes de cabecera fuera; devuelve (carga, fin, arranque, cuerpo)."""
    carga = datos[0] | (datos[1] << 8)
    fin = datos[2] | (datos[3] << 8)
    arranque = datos[4] | (datos[5] << 8)
    return carga, fin, arranque, datos[6:]


def cuerpo_spectrum(datos):
    """Quita bandera y checksum, y comprueba el XOR."""
    x = 0
    for c in datos[:-1]:
        x ^= c
    return datos[0], datos[1:-1], x == datos[-1]


def main(argv):
    if len(argv) < 3:
        print(__doc__)
        return 2
    ext, work = argv[1], argv[2]
    os.makedirs(work, exist_ok=True)
    manifiesto = {}

    print("  bloques BIN del MSX")
    for fichero, nombre, desc in BLOQUES_BIN:
        with open(os.path.join(ext, fichero), "rb") as f:
            carga, fin, arranque, cuerpo = cuerpo_bin(f.read())
        esperado = fin - carga + 1
        ok = esperado == len(cuerpo)
        print("    %-8s 0x%04X-0x%04X arranca 0x%04X  %5d B  %s  %s"
              % (nombre, carga, fin, arranque, len(cuerpo),
                 "OK" if ok else "!! la cabecera dice %d" % esperado, desc))
        if not ok:
            return 1
        with open(os.path.join(work, nombre + ".raw"), "wb") as f:
            f.write(cuerpo)
        manifiesto[nombre] = {"org": carga, "arranque": arranque,
                              "bytes": len(cuerpo), "desc": desc}

    print("  bloques del ZX Spectrum")
    for fichero, nombre, org, desc in BLOQUES_SPECTRUM:
        with open(os.path.join(ext, fichero), "rb") as f:
            bandera, cuerpo, xor_ok = cuerpo_spectrum(f.read())
        if not xor_ok:
            print("    %-8s !! el checksum XOR no cuadra" % nombre)
            return 1
        sitio = "0x%04X-0x%04X" % (org, org + len(cuerpo) - 1) if org else "(sin destino fijo)"
        print("    %-8s %-16s bandera 0x%02X  %5d B  XOR OK  %s"
              % (nombre, sitio, bandera, len(cuerpo), desc))
        with open(os.path.join(work, nombre + ".raw"), "wb") as f:
            f.write(cuerpo)
        manifiesto[nombre] = {"org": org, "bandera": bandera,
                              "bytes": len(cuerpo), "desc": desc}

    total = sum(m["bytes"] for m in manifiesto.values())
    print("  total de cuerpos: %d bytes" % total)
    with open(os.path.join(work, "bloques.json"), "w") as f:
        json.dump(manifiesto, f, indent=1)
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
