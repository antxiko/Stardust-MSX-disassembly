#!/usr/bin/env python3
"""Saca una imagen plana de 48K de una instantanea .z80 del ZX Spectrum.

Hace falta para poder cotejar contra el original: el desensamblado que
publicaron los autores (github.com/TheJare/stardust-48k) trae el juego como
`s1.z80`, no como un volcado plano.

Del formato .z80 solo se implementa lo que hace falta para un 48K:

  - Cabecera de 30 bytes. Si la palabra de PC (bytes 6-7) es distinta de cero es
    version 1; si es cero, viene una cabecera extra cuyo tamano esta en los
    bytes 30-31, y detras van los datos por paginas.
  - Compresion: la version 1 comprime todo el bloque si el bit 5 del byte 12
    esta puesto; las versiones 2 y 3 lo dicen por pagina (longitud 0xFFFF =
    sin comprimir). El esquema es el mismo en las dos: `ED ED n v` significa n
    repeticiones de v, y en la version 1 la secuencia `00 ED ED 00` marca el
    final.
  - Paginas, y aqui esta el detalle que cuesta un rato: la numeracion depende de
    la maquina. En una instantanea de 48K la pagina 4 va a 0x8000, la 5 a 0xC000
    y la 8 a 0x4000. Pero si el byte de hardware dice 128K -que es el caso de
    esta, aunque el juego sea de 48K- las paginas son bancos mas tres, y el mapa
    de memoria es el del arranque del 128: el banco 5 en 0x4000, el 2 en 0x8000
    y en 0xC000 el que diga el puerto 0x7FFD, que se guarda en el byte 35.
    Leyendola con la tabla equivocada salen 48K de basura sin que nada avise.

Uso: lee_z80.py <fichero.z80> <salida.bin>
     La salida son 49152 bytes, que son 0x4000-0xFFFF.
"""
import struct
import sys

BASE = 0x4000
TAM = 0xC000                       # 48K de RAM
PAGINA_48 = {4: 0x8000, 5: 0xC000, 8: 0x4000}


def paginas_128(port7ffd):
    """En un 128K: pagina = banco + 3, y el mapa es el del arranque."""
    banco_alto = port7ffd & 7
    return {8: 0x4000, 5: 0x8000, banco_alto + 3: 0xC000}


def descomprime(datos, tope=None):
    out = bytearray()
    i = 0
    while i < len(datos):
        if datos[i] == 0xED and i + 1 < len(datos) and datos[i + 1] == 0xED:
            if i + 3 >= len(datos):
                break
            n, v = datos[i + 2], datos[i + 3]
            if n == 0:             # fin de bloque en la version 1
                break
            out.extend(bytes([v]) * n)
            i += 4
        else:
            out.append(datos[i])
            i += 1
        if tope and len(out) >= tope:
            break
    return bytes(out)


def main(argv):
    if len(argv) < 3:
        print(__doc__)
        return 2
    with open(argv[1], "rb") as f:
        d = f.read()

    pc = struct.unpack("<H", d[6:8])[0]
    ram = bytearray(TAM)

    if pc != 0:                                    # version 1
        comprimido = bool(d[12] & 0x20)
        cuerpo = d[30:]
        plano = descomprime(cuerpo, TAM) if comprimido else cuerpo
        ram[:len(plano)] = plano[:TAM]
        print(f"  .z80 version 1, {'comprimido' if comprimido else 'plano'}")
    else:                                          # version 2 o 3
        extra = struct.unpack("<H", d[30:32])[0]
        hw = d[34]
        port = d[35]
        i = 32 + extra
        ver = 2 if extra == 23 else 3
        de128 = (hw >= 4) if ver == 3 else (hw >= 3)
        mapa = paginas_128(port) if de128 else PAGINA_48
        print(f"  .z80 version {ver}, hardware={hw}, "
              f"{'128K' if de128 else '48K'}, puerto 0x7FFD=0x{port:02X}")
        while i + 3 <= len(d):
            largo = struct.unpack("<H", d[i:i + 2])[0]
            pag = d[i + 2]
            i += 3
            if largo == 0xFFFF:                    # sin comprimir
                trozo, largo = d[i:i + 0x4000], 0x4000
            else:
                trozo = descomprime(d[i:i + largo], 0x4000)
            i += largo
            destino = mapa.get(pag)
            if destino is None:
                print(f"    pagina {pag}: no esta mapeada, se ignora")
                continue
            o = destino - BASE
            ram[o:o + len(trozo)] = trozo[:0x4000]
            print(f"    pagina {pag} -> 0x{destino:04X}  ({len(trozo)} bytes)")

    with open(argv[2], "wb") as f:
        f.write(bytes(ram))
    print(f"  escritos {len(ram)} bytes en {argv[2]}  (0x4000-0xFFFF)")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
