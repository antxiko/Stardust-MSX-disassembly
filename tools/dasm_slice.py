#!/usr/bin/env python3
"""Desensambla un binario por secciones, cada una en su direccion REAL de ejecucion.

Necesario porque los cargadores de Topo Soft se copian a si mismos a otras
direcciones antes de ejecutarse: desensamblar el fichero linealmente en su
direccion de carga produce operandos que no casan con ninguna etiqueta.

El layout se describe en un .toml-ligero (una seccion por linea):
    nombre  off_ini  off_fin  org  tipo  descripcion
donde los offsets son relativos al inicio del binario (ya sin cabecera BIN),
tipo es 'code' o 'data'.
"""
import subprocess
import sys
import os

Z80DASM = "z80dasm"


def load_layout(path):
    secs = []
    for ln in open(path, encoding="utf-8"):
        ln = ln.split("#")[0].strip()
        if not ln:
            continue
        parts = ln.split(None, 5)
        name, o0, o1, org, kind = parts[:5]
        desc = parts[5] if len(parts) > 5 else ""
        secs.append(dict(name=name, o0=int(o0, 0), o1=int(o1, 0),
                         org=int(org, 0), kind=kind, desc=desc))
    return secs


def hexdump(data, org):
    out = []
    for i in range(0, len(data), 16):
        row = data[i:i + 16]
        txt = "".join(chr(b) if 32 <= b < 127 else "." for b in row)
        out.append(f"\tdefb {','.join(f'0{b:02x}h' for b in row)}"
                   f"\t; {org+i:04x}  {txt}")
    return "\n".join(out)


def main(binpath, layoutpath, symfile, outpath):
    data = open(binpath, "rb").read()
    secs = load_layout(layoutpath)
    chunks = []
    for s in secs:
        blob = data[s["o0"]:s["o1"]]
        head = (f"\n; {'='*70}\n; SECCION {s['name']}  "
                f"fichero[{s['o0']:#06x}..{s['o1']:#06x})  {len(blob)} bytes\n"
                f"; se ejecuta en {s['org']:#06x}\n")
        if s["desc"]:
            head += f"; {s['desc']}\n"
        head += f"; {'='*70}\n"
        if s["kind"] == "data" or not blob:
            body = f"\torg {s['org']:#06x}\n" + hexdump(blob, s["org"])
        else:
            tmp = f"/tmp/_slice_{s['name']}.bin"
            open(tmp, "wb").write(blob)
            cmd = [Z80DASM, "-a", "-l", "-t", "-g", hex(s["org"]), tmp]
            if symfile and os.path.exists(symfile):
                cmd += ["-S", symfile, "-c"]
            r = subprocess.run(cmd, capture_output=True, text=True)
            if r.returncode != 0:
                print(f"!! z80dasm fallo en {s['name']}: {r.stderr}", file=sys.stderr)
                sys.exit(1)
            body = "\n".join(l for l in r.stdout.splitlines()
                             if not l.startswith("; z80dasm")
                             and not l.startswith("; command line"))
            os.unlink(tmp)
        chunks.append(head + body)

    with open(outpath, "w", encoding="utf-8") as f:
        f.write(f"; Desensamblado por secciones de {os.path.basename(binpath)}\n")
        f.write(f"; layout: {os.path.basename(layoutpath)}\n")
        f.write("".join(chunks) + "\n")
    print(f"{len(secs)} secciones -> {outpath}")


if __name__ == "__main__":
    main(*sys.argv[1:5])
