#!/usr/bin/env python3
"""Coteja el binario del MSX contra el de la version de ZX Spectrum.

De donde sale esto y por que hay que tener cuidado
--------------------------------------------------
Los autores originales de Stardust publicaron el desensamblado de la version de
Spectrum en https://github.com/TheJare/stardust-48k, con permiso de todos ellos.
Ahi las secciones de datos estan etiquetadas: el juego de caracteres, los datos
de cada nivel, los graficos de los centinelas, los sprites...

Pero eso es OTRO binario, y ellos mismos avisan en su README de que la version
de MSX **la hizo otra gente**: "we originally ported it to the Amstrad CPC,
while other people did the MSX, C-64 and eventual PC versions". Asi que sus
etiquetas NO se pueden dar por buenas aqui. Son una hipotesis, nada mas.

Lo que si se puede hacer, y es lo que hace esta herramienta, es COMPROBARLO: si
un tramo de datos se porto tal cual, aparecera identico byte a byte en los dos
binarios. Entonces la etiqueta viaja con los bytes y deja de ser una suposicion.
Y si no aparece, se dice que no aparece.

Uso: coteja_spectrum.py <spectrum48.bin> <s1.ctl> <work/juego.raw> <org>
"""
import re
import sys

MINIMO = 32          # por debajo de esto una coincidencia puede ser casual


def lee_ctl(ruta):
    """Saca del fichero de control las secciones con nombre: (dir, tipo, texto)."""
    sec = []
    for ln in open(ruta, encoding="utf-8", errors="replace"):
        m = re.match(r"^([btwcsBTWCS])\s+\$([0-9A-Fa-f]{4})\s*(.*)$", ln.rstrip())
        if m and m.group(3).strip():
            sec.append((int(m.group(2), 16), m.group(1).lower(), m.group(3).strip()))
    sec.sort()
    return sec


def main(argv):
    if len(argv) < 5:
        print(__doc__)
        return 2
    spec = open(argv[1], "rb").read()
    sec = lee_ctl(argv[2])
    msx = open(argv[3], "rb").read()
    org = int(argv[4], 0)
    fin = org + len(msx)

    print("  %d secciones con nombre en el fichero de control del Spectrum" % len(sec))
    print()
    print("  %-22s %6s  %s" % ("seccion del Spectrum", "bytes", "en el MSX"))
    print("  " + "-" * 74)

    iguales = 0
    encontradas = 0
    for i, (dir_s, tipo, texto) in enumerate(sec):
        fin_s = sec[i + 1][0] if i + 1 < len(sec) else dir_s + 256
        largo = min(fin_s - dir_s, 4096)
        if largo < MINIMO:
            continue
        patron = spec[dir_s:dir_s + largo]
        if len(set(patron)) < 3:            # relleno: coincidiria en cualquier sitio
            print("  0x%04X %-15.15s %6d  (relleno, no se busca)" % (dir_s, texto, largo))
            continue
        # buscar el principio del tramo en el binario del MSX
        aguja = patron[:MINIMO]
        pos = msx.find(aguja)
        if pos < 0:
            print("  0x%04X %-15.15s %6d  NO aparece" % (dir_s, texto, largo))
            continue
        # extender para ver cuanto coincide de verdad
        n = 0
        while n < largo and pos + n < len(msx) and msx[pos + n] == patron[n]:
            n += 1
        d = (org + pos) - dir_s
        print("  0x%04X %-15.15s %6d  0x%04X  %5d B iguales  (desplazada %+d)"
              % (dir_s, texto, largo, org + pos, n, d))
        iguales += n
        encontradas += 1

    print("  " + "-" * 74)
    print("  %d secciones localizadas, %d bytes verificados identicos" % (encontradas, iguales))
    print()
    print("  Recordatorio: los nombres son de la version de Spectrum. Aqui valen")
    print("  para las secciones que aparecen IDENTICAS, porque entonces la")
    print("  etiqueta viaja con los bytes. Para lo demas, no dicen nada.")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
