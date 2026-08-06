#!/usr/bin/env python3
"""Genera un fichero de simbolos para z80dasm con la BIOS y las variables de
sistema del MSX, a partir de los headers de MSXgl (fuente verificable:
MSX2 Technical Handbook / map.grauw.nl, citados en la cabecera de esos ficheros).

Uso: gen_msx_syms.py <dir MSXgl/engine/src> <salida.sym>
"""
import re
import sys
import os

SRC = ["bios_mainrom.h", "bios_var.h"]
# R_ = rutinas de la Main-ROM, M_ = variables de sistema en RAM
PAT = re.compile(r"^#define\s+[RM]_(\w+)\s+(0x[0-9A-Fa-f]{4})\s*(?://\s*(.*))?$")

# Puertos e I/O que no salen de los headers pero son estandar del MSX.
EXTRA = [
    ("VDP_DATA", 0x98, "VDP puerto de datos (lectura/escritura VRAM)"),
    ("VDP_CTRL", 0x99, "VDP puerto de control (registros / direccion VRAM)"),
    ("PSG_ADDR", 0xA0, "PSG AY-3-8910: selector de registro"),
    ("PSG_DATA", 0xA1, "PSG: escritura de dato"),
    ("PSG_READ", 0xA2, "PSG: lectura de dato (joystick, cinta)"),
    ("PPI_A_SLOT", 0xA8, "PPI 8255 puerto A: registro de seleccion de slots primarios"),
    ("PPI_B_KEY", 0xA9, "PPI puerto B: lectura de fila de teclado"),
    ("PPI_C", 0xAA, "PPI puerto C: fila de teclado, CAPS, motor cinta, click"),
    ("PPI_CTRL", 0xAB, "PPI registro de control"),
]


# Varios nombres comparten direccion (p.ej. MNROM y EXPTBL son ambos 0xFCC1,
# porque EXPTBL+0 es a la vez el slot ID de la Main-ROM). Nos quedamos con el
# nombre por el que se conoce habitualmente, y el alias va al comentario.
PREFER = {"EXPTBL", "SLTTBL", "RAMAD0", "CGTABL"}


def main(srcdir, out):
    byaddr = {}
    for fn in SRC:
        path = os.path.join(srcdir, fn)
        for ln in open(path, encoding="utf-8", errors="replace"):
            m = PAT.match(ln.strip())
            if not m:
                continue
            name, addr = m.group(1), int(m.group(2), 16)
            comment = re.sub(r"^\d+\s*", "", (m.group(3) or "").strip())
            prev = byaddr.get(addr)
            if prev is None:
                byaddr[addr] = [name, comment, []]
            elif name in PREFER:
                byaddr[addr][2].append(prev[0])
                byaddr[addr][0] = name
                if comment:
                    byaddr[addr][1] = comment
            else:
                byaddr[addr][2].append(name)

    lines = []
    for addr, (name, comment, aliases) in byaddr.items():
        if aliases:
            comment = (comment + "  " if comment else "") + "[alias: " + ", ".join(aliases) + "]"
        lines.append((addr, name, comment, ""))

    with open(out, "w", encoding="utf-8") as f:
        f.write("; Simbolos MSX para z80dasm\n")
        f.write(f"; Generado desde {srcdir} ({', '.join(SRC)})\n")
        f.write("; Fuente original citada por MSXgl: MSX2 Technical Handbook, map.grauw.nl\n\n")
        f.write("; --- BIOS Main-ROM y variables de sistema ---\n")
        for addr, name, comment, fn in sorted(lines):
            f.write(f"{name}:\tequ 0x{addr:04x}")
            if comment:
                f.write(f"\t; {comment}")
            f.write("\n")
        f.write("\n; --- Puertos de E/S ---\n")
        for name, port, comment in EXTRA:
            f.write(f"{name}:\tequ 0x{port:02x}\t; {comment}\n")
    print(f"{len(lines)} simbolos BIOS/vars + {len(EXTRA)} puertos -> {out}")


if __name__ == "__main__":
    main(sys.argv[1], sys.argv[2])
