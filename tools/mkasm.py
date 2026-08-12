#!/usr/bin/env python3
"""Genera el listado ensamblador comentado a partir de:
  - el binario
  - el mapa codigo/datos del trazador (.trace.json)
  - un fichero de anotaciones escrito a mano (.notes)

Por que no usar z80dasm con su fichero de simbolos (-S): z80dasm sustituye
CUALQUIER valor que coincida numericamente con un simbolo, incluidos los
inmediatos. Producia lineas como `ld bc,CHRGTR` donde el codigo real dice
`ld bc,0x0010` (una longitud, no una direccion). Aqui z80dasm se usa solo para
los mnemonicos y las etiquetas de BIOS se anaden como COMENTARIO, y unicamente
cuando la instruccion es un call/jp de verdad.

Formato del fichero .notes (todo opcional, una directiva por linea):
    L 0xD041 asigna_melodia    Pone la melodia DE en el canal A
        -> define etiqueta y su comentario
    C 0xDA31 Lee el gatillo (espacio o boton del joystick)
        -> comentario al final de esa linea
    B 0xDA00 =====  Menu principal  =====
        -> bloque de cabecera antes de esa direccion (se puede repetir)
    D 0x4000 0x4800 fuente  Tabla de patrones de la fuente (256 glifos x 8)
        -> marca un rango de datos con nombre y descripcion
"""
import json
import os
import re
import subprocess
import sys

BIOS = {}


def load_bios(path):
    for ln in open(path, encoding="utf-8"):
        m = re.match(r"^(\w+):\s*equ\s+(0x[0-9a-fA-F]+)\s*(?:;\s*(.*))?$", ln.strip())
        if m:
            BIOS.setdefault(int(m.group(2), 16), (m.group(1), (m.group(3) or "").strip()))


class Notes:
    def __init__(self):
        self.labels, self.line, self.blocks, self.data = {}, {}, {}, []

    @classmethod
    def load(cls, path):
        n = cls()
        if not path or not os.path.exists(path):
            return n
        for raw in open(path, encoding="utf-8"):
            ln = raw.rstrip("\n")
            if not ln.strip() or ln.lstrip().startswith("#"):
                continue
            k, rest = ln.split(None, 1)
            if k == "L":
                p = rest.split(None, 2)
                n.labels[int(p[0], 0)] = (p[1], p[2].strip() if len(p) > 2 else "")
            elif k == "C":
                p = rest.split(None, 1)
                n.line[int(p[0], 0)] = p[1].strip() if len(p) > 1 else ""
            elif k == "B":
                p = rest.split(None, 1)
                n.blocks.setdefault(int(p[0], 0), []).append(p[1] if len(p) > 1 else "")
            elif k == "D":
                p = rest.split(None, 3)
                n.data.append((int(p[0], 0), int(p[1], 0), p[2],
                               p[3].strip() if len(p) > 3 else ""))
        return n


ADDR_RE = re.compile(r"\b0([0-9a-f]{4})h\b")
LBL_RE = re.compile(r"\b(?:sub_|l)([0-9a-f]{4})h\b")


_BANNERED = set()
# Etiquetas realmente definidas en el listado. Hace falta llevar la cuenta
# porque una etiqueta puede referenciarse desde el codigo y caer en una zona de
# datos (o al principio de una region, donde z80dasm no la emite): sin esto el
# listado no reensambla, que es justo el criterio que valida el desensamblado.
_EMITTED = set()


def banner(lines, addr):
    """Un solo marco con todas las lineas B de una misma direccion.

    Se lleva registro de las direcciones ya emitidas porque una direccion suele
    ser a la vez etiqueta y primera instruccion, y sin esto la cabecera salia
    duplicada.
    """
    if not lines or addr in _BANNERED:
        return []
    _BANNERED.add(addr)
    out = ["", "; " + "-" * 70]
    out += [("; " + l).rstrip() for l in lines]
    out.append("; " + "-" * 70)
    return out


def main():
    binpath, org, tracepath, notespath, symspath, outpath, title = sys.argv[1:8]
    org = int(org, 0)
    data = open(binpath, "rb").read()
    tr = json.load(open(tracepath))
    notes = Notes.load(notespath)
    load_bios(symspath)

    # Etiqueta para cada destino de salto que el trazador encontro.
    auto = {a for a in tr["entries"]}
    names = {}
    for a in sorted(auto):
        names[a] = notes.labels[a][0] if a in notes.labels else f"L_{a:04X}"
    for a, (nm, _) in notes.labels.items():
        names[a] = nm

    dataranges = {a: (b, nm, desc) for a, b, nm, desc in notes.data}

    out = []
    out.append(f"; {'='*74}")
    out.append(f"; {title}")
    out.append(f"; {'='*74}")
    out.append("; Generado por tools/mkasm.py a partir del trazado de flujo real.")
    out.append("; Los comentarios provienen de tools/../src/*.notes y estan anclados a")
    out.append("; direccion, de modo que sobreviven a un retrazado.")
    out.append(f"; {'='*74}\n")
    out.append(f"\torg {org:#07x}\n")
    HDR = len(out)

    for kind, a, b in tr["blocks"]:
        if kind == "d":
            out += emit_data(data, org, a, b, dataranges, notes, names)
        else:
            out += emit_code(data, org, a, b, names, notes)

    # z80dasm inventa etiquetas (lXXXXh / sub_XXXXh) para los saltos que ve.
    # Si el destino cae fuera del trozo que le pasamos -o en una zona que el
    # trazador marco como datos- emite la referencia pero no la definicion. Se
    # resuelven aqui con un equ, y se avisa: cada una senala una direccion que
    # probablemente es codigo y el trazador no alcanzo.
    # OJO CON LLAMARLAS "DESTINOS DE SALTO": la mayoria no lo son. z80dasm
    # sustituye por una etiqueta CUALQUIER valor que coincida con una direccion,
    # incluidos los inmediatos -es el mismo problema del que se protege arriba
    # con los simbolos de BIOS, y aqui se colo con las etiquetas propias-. En
    # este juego las siete que salian eran, todas, valores:
    #
    #   ld ix,lcc32h   la direccion del `ld bc,` que se parchea para dar a cada
    #                  tabla de objetos su velocidad (y su gemela ladc4h)
    #   ld hl,lcb9dh   una direccion de RETORNO empujada a mano antes de un
    #                  `jp (hl)`, que es un call indirecto hecho a pelo
    #   ld hl,ld959h   un `ret` que se instala como comportamiento de un objeto,
    #                  o sea "este no hace nada"
    #   ld de,lef00h   ni siquiera es una direccion: es el numero 0xEF00 que se
    #                  suma con `add hl,de`, o sea restar 0x1100
    #
    # Por eso se separan: solo alarma lo que aparece como destino de un salto o
    # una llamada de verdad. Lo demas se declara igual -hace falta para que el
    # listado reensamble- pero sin decir que hay codigo por trazar, que era
    # mentira y llevaba en cada compilacion desde el principio.
    SALTO = re.compile(r"\b(?:jp|jr|call|djnz|rst)\b[^;]*?\b(?:sub_|l)"
                       r"([0-9a-f]{4})h\b")
    cuerpo = "\n".join(out)
    usadas = {int(m, 16) for m in re.findall(r"\b(?:sub_|l)([0-9a-f]{4})h\b", cuerpo)}
    definidas = {int(m, 16) for m in
                 re.findall(r"(?m)^(?:sub_|l)([0-9a-f]{4})h:", cuerpo)}
    saltadas = {int(m, 16) for m in SALTO.findall(cuerpo)}
    huerfanas = sorted(usadas - definidas)
    sin_trazar = [a for a in huerfanas if a in saltadas]
    valores = [a for a in huerfanas if a not in saltadas]
    if huerfanas:
        hf = ["", "; " + "-" * 70]
        if sin_trazar:
            hf += ["; Destinos de salto que z80dasm referencia y el trazador no",
                   "; marco como codigo. Cada uno es un sitio a revisar."]
        if valores:
            hf += ["; Direcciones que solo aparecen como VALOR -en un `ld`, no en",
                   "; un salto-: son punteros que el codigo se pasa o numeros que",
                   "; casualmente coinciden con una direccion. No hay nada que",
                   "; trazar en ellas; el equ existe para que el listado ensamble."]
        hf += ["; " + "-" * 70]
        hf += [f"l{a:04x}h:\tequ {a:#07x}" for a in huerfanas]
        out = out[:HDR] + hf + out[HDR:]
        if sin_trazar:
            print(f"  aviso: {len(sin_trazar)} destinos de salto sin trazar: "
                  + " ".join(f"{a:#06x}" for a in sin_trazar[:12]))
        if valores:
            print(f"  {len(valores)} direcciones usadas solo como valor: "
                  + " ".join(f"{a:#06x}" for a in valores[:12]))

    # Red de seguridad: cualquier etiqueta referenciada que no haya quedado
    # definida (p.ej. apunta fuera del binario) se declara con un equ, para que
    # el listado siga reensamblando.
    faltan = sorted(a for a in names if a not in _EMITTED)
    if faltan:
        eq = ["", "; " + "-" * 70,
              "; Etiquetas que no caen en ninguna posicion emitida del listado",
              "; (destinos fuera del binario o dentro de una instruccion).",
              "; " + "-" * 70]
        eq += [f"{names[a]}:\tequ {a:#07x}" for a in faltan]
        out = out[:HDR] + eq + out[HDR:]
    open(outpath, "w", encoding="utf-8").write("\n".join(out) + "\n")
    ncode = sum(b - a for k, a, b in tr["blocks"] if k == "c")
    print(f"{outpath}: {len(out)} lineas, {ncode} bytes de codigo, "
          f"{len(names)} etiquetas, {len(notes.line)} comentarios de linea")


def emit_data(data, org, a, b, dataranges, notes, names):
    out = ["", f"; {'-'*70}"]
    hit = [(s, e, nm, d) for s, (e, nm, d) in dataranges.items() if s < b and e > a]
    if hit:
        for s, e, nm, d in sorted(hit):
            out.append(f"; DATOS {nm}: {d}")
            out.append(f";   {s:#06x}..{e:#06x}  ({e-s} bytes)")
    else:
        out.append(f"; DATOS sin identificar  {a:#06x}..{b:#06x}  ({b-a} bytes)")
    out.append(f"; {'-'*70}")
    out += banner(notes.blocks.get(a), a)
    for i in range(a, b, 16):
        row = data[i - org:min(i + 16, b) - org]
        # Una etiqueta puede caer dentro de una fila del volcado; en ese caso hay
        # que partir la fila para que quede exactamente en su direccion.
        for off in range(len(row)):
            addr = i + off
            if addr in names and addr not in _EMITTED:
                if off:
                    head = row[:off]
                    out.append(f"\tdefb {','.join(f'0{c:02x}h' for c in head)}"
                               f"\t; {i:04x}")
                    row = row[off:]
                cmt = notes.labels.get(addr, (None, ""))[1]
                out.append(f"{names[addr]}:" + (f"\t\t; {cmt}" if cmt else ""))
                _EMITTED.add(addr)
                i = addr
                break
        txt = "".join(chr(c) if 32 <= c < 127 else "." for c in row)
        out.append(f"\tdefb {','.join(f'0{c:02x}h' for c in row)}\t; {i:04x}  {txt}")
    return out


def emit_code(data, org, a, b, names, notes):
    tmp = "/tmp/_mkasm_chunk.bin"
    open(tmp, "wb").write(data[a - org:b - org])
    r = subprocess.run(["z80dasm", "-a", "-l", "-g", hex(a), tmp],
                       capture_output=True, text=True)
    os.unlink(tmp)
    if r.returncode != 0:
        return [f"; !! z80dasm fallo en {a:#06x}: {r.stderr}"]

    out = ["", f"; {'='*70}", f"; CODIGO {a:#06x}..{b:#06x}  ({b-a} bytes)",
           f"; {'='*70}"]
    for ln in r.stdout.splitlines():
        if ln.startswith("; z80dasm") or ln.startswith("; command") or ln.startswith("\torg"):
            continue
        # Direccion de la instruccion, del comentario que pone z80dasm con -a
        m = re.search(r";([0-9a-f]{4})\b", ln)
        cur = int(m.group(1), 16) if m else None

        # Etiqueta propia en lugar de la sintetica de z80dasm
        m2 = re.match(r"^(sub_|l)([0-9a-f]{4})h:", ln)
        if m2:
            addr = int(m2.group(2), 16)
            nm = names.get(addr, f"L_{addr:04X}")
            out += banner(notes.blocks.get(addr), addr)
            cmt = notes.labels.get(addr, (None, ""))[1]
            out.append(f"{nm}:" + (f"\t\t; {cmt}" if cmt else ""))
            _EMITTED.add(addr)
            continue

        if cur is not None and cur in notes.blocks:
            out += banner(notes.blocks[cur], cur)

        # z80dasm solo pone etiqueta donde el salta; si la direccion tiene
        # nombre propio y aun no se ha definido, se emite aqui.
        if cur is not None and cur in names and cur not in _EMITTED:
            cmt = notes.labels.get(cur, (None, ""))[1]
            out.append(f"{names[cur]}:" + (f"\t\t; {cmt}" if cmt else ""))
            _EMITTED.add(cur)

        # Renombrar las etiquetas sinteticas de z80dasm por las nuestras
        def repl(mm):
            return names.get(int(mm.group(1), 16), mm.group(0))
        ln = LBL_RE.sub(repl, ln)

        # z80dasm solo inventa etiquetas para saltos DENTRO del trozo que le
        # damos; las llamadas a otras rutinas salen como literal (p.ej.
        # 'call 0d041h'). Aqui se sustituyen por su nombre, pero SOLO en
        # instrucciones de salto, nunca en un inmediato.
        def repl_abs(mm):
            tgt = int(mm.group(2), 16)
            return f"{mm.group(1)}{names[tgt]}" if tgt in names else mm.group(0)
        ln = re.sub(r"\b((?:call|jp|jr)\s+(?:\w{1,2},)?)0([0-9a-f]{4})h\b",
                    repl_abs, ln)

        # Anotar BIOS solo en call/jp reales (nunca en inmediatos)
        extra = []
        mb = re.search(r"\b(call|jp)\s+(?:\w+,)?0([0-9a-f]{4})h\b", ln)
        if mb:
            tgt = int(mb.group(2), 16)
            if tgt in BIOS:
                nm, desc = BIOS[tgt]
                extra.append(f"BIOS {nm}" + (f" - {desc}" if desc else ""))
        if cur is not None and cur in names and not m2:
            pass
        if cur is not None and cur in notes.line:
            extra.append(notes.line[cur])
        if extra:
            ln = ln.rstrip() + "   ; " + " | ".join(extra)
        out.append(ln)
    return out


if __name__ == "__main__":
    main()
