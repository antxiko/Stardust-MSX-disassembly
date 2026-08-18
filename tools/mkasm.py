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
    F 0x47c3 w10        Anchura de fila del bloque de datos que empieza ahi:
    F 0x4787 2          un numero = bytes por linea, wN = N palabras (defw), y
    F 0x4000 2,w4,6     varios tramos separados por comas (el ultimo se repite)
                        -> el volcado sale en filas del tamano de su estructura
"""
import tempfile
import json
import os
import re
import subprocess
import sys
import textwrap

# El trozo que se le pasa a z80dasm va al directorio de trabajo del proyecto y
# NO al temporal del sistema: z80dasm crea SU temporal al lado del fichero de
# entrada, y bajo make el TEMP del entorno acaba siendo el de Windows, donde no
# se puede escribir -fallaba con "Cannot create temporary file" y el listado
# salia entero como datos, sin una sola instruccion-.
TMP = tempfile.gettempdir()

BIOS = {}


def load_bios(path):
    for ln in open(path, encoding="utf-8"):
        m = re.match(r"^(\w+):\s*equ\s+(0x[0-9a-fA-F]+)\s*(?:;\s*(.*))?$", ln.strip())
        if m:
            BIOS.setdefault(int(m.group(2), 16), (m.group(1), (m.group(3) or "").strip()))


def parse_fmt(spec):
    """Anchura de fila de un bloque de datos, tal como la declara la directiva F.

    "8" -> filas de ocho bytes; "w4" -> filas de cuatro palabras (defw);
    "2,w4,6" -> una fila de dos bytes, otra de cuatro palabras y el resto de
    seis en seis. El ultimo tramo se repite hasta acabar el bloque.
    """
    tramos = []
    for it in spec.lower().split(","):
        it = it.strip()
        pal = it.startswith("w")
        n = it[1:] if pal else it
        tramos.append((int(n) if n else 8, pal))
    return tramos or [(16, False)]


class Notes:
    def __init__(self):
        self.labels, self.line, self.blocks, self.data = {}, {}, {}, []
        self.fmt = {}

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
            elif k == "F":
                p = rest.split()
                n.fmt[int(p[0], 0)] = parse_fmt(p[1])
        return n


ADDR_RE = re.compile(r"\b0([0-9a-f]{4})h\b")
LBL_RE = re.compile(r"\b(?:sub_|l)([0-9a-f]{4})h\b")


_BANNERED = set()
# Etiquetas realmente definidas en el listado. Hace falta llevar la cuenta
# porque una etiqueta puede referenciarse desde el codigo y caer en una zona de
# datos (o al principio de una region, donde z80dasm no la emite): sin esto el
# listado no reensambla, que es justo el criterio que valida el desensamblado.
_EMITTED = set()
# Etiqueta DATA_ de cada bloque de datos declarado.
_DATANAMES = {}


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
    global TMP
    TMP = os.path.dirname(os.path.abspath(tracepath))
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
    # Etiqueta de cada bloque de datos: DATA_ y el nombre de su rango en las
    # notas, que es lo que dice PARA QUE sirve. El prefijo lo distingue de una
    # etiqueta de codigo, y con el nombre dentro los punteros que apuntan al
    # bloque se leen solos. Si el nombre no vale como etiqueta -o esta repetido,
    # o ya lo usa otra- se cae a la direccion.
    repes = {}
    for a_, _b, nm_, _d in notes.data:
        repes[nm_] = repes.get(nm_, 0) + 1
    usadas_et = set(names.values())
    for a_, _b, nm_, _d in notes.data:
        et = "DATA_" + nm_ if re.fullmatch(r"[A-Za-z_]\w*", nm_ or "") else ""
        if not et or repes[nm_] > 1 or et in usadas_et:
            et = f"DATA_{a_:04X}"
        if a_ not in names:
            _DATANAMES[a_] = et
            usadas_et.add(et)

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
    """Vuelca un tramo de datos PARTIDO por los rangos declarados en las notas.

    Antes se volcaba el tramo entero del trazador de 16 en 16 bytes con las
    cabeceras de todos sus rangos amontonadas delante: las filas cruzaban las
    fronteras entre una tabla y la siguiente y no habia manera de ver donde
    acababa cada una. Ahora cada rango sale como un bloque aparte, con su
    cabecera, su etiqueta y el volcado alineado a su primer byte.
    """
    out = []
    hit = sorted((s, e, nm, d) for s, (e, nm, d) in dataranges.items()
                 if s < b and e > a)
    # Trozos que cubren [a,b) exactamente una vez: cada rango recortado al
    # tramo, y los huecos entre rangos como "sin identificar" (que es lo que
    # son: no forman parte de la tabla de al lado).
    trozos, cur = [], a
    for s, e, nm, d in hit:
        s, e = max(s, a), min(e, b)
        if s > cur:
            trozos.append((cur, s, None, ""))
            cur = s
        if e > cur:
            trozos.append((cur, e, nm, d))
            cur = e
        else:
            print(f"  aviso: el rango de datos {nm} ({s:#06x}..{e:#06x}) no "
                  f"aporta bytes propios; repasa sus limites en el .notes")
    if cur < b:
        trozos.append((cur, b, None, ""))
    for s, e, nm, d in trozos:
        out += emit_data_range(data, org, s, e, nm, d, notes, names)
    return out


def emit_data_range(data, org, a, b, nm, desc, notes, names):
    """Un solo bloque de datos: cabecera, etiqueta y volcado con su anchura."""
    out = ["", "; " + "-" * 70]
    if nm:
        cab = f"; DATOS {nm}: {desc}" if desc else f"; DATOS {nm}"
        out += textwrap.wrap(cab, 78, subsequent_indent=";   ",
                             break_long_words=False, break_on_hyphens=False)
        out.append(f";   {a:#06x}..{b:#06x}  ({b - a} bytes)")
    else:
        out.append(f"; DATOS sin identificar  {a:#06x}..{b:#06x}  ({b - a} bytes)")
    out += banner(notes.blocks.get(a), a)
    # Etiqueta del bloque: la de las notas si hay una en su primer byte; si no,
    # la DATA_ que lleva el nombre de su uso.
    if a in names and a not in _EMITTED:
        cmt = notes.labels.get(a, (None, ""))[1]
        out.append(f"{names[a]}:" + (f"\t\t; {cmt}" if cmt else ""))
        _EMITTED.add(a)
    elif a not in _EMITTED and a not in names:
        out.append(_DATANAMES.setdefault(a, f"DATA_{a:04X}") + ":")
    tramos = notes.fmt.get(a) or [(16, False)]
    # Una etiqueta -o una cabecera B- puede caer dentro de una fila: hay que
    # partir la fila para que quede exactamente en su direccion.
    i, k = a, 0
    while i < b:
        ancho, palabras = tramos[min(k, len(tramos) - 1)]
        k += 1
        fin = min(i + ancho * (2 if palabras else 1), b)
        corte = next((x for x in range(i + 1, fin)
                      if (x in names and x not in _EMITTED)
                      or x in notes.blocks), None)
        if corte:
            fin = corte
        out += fila_datos(data, org, i, fin, palabras, names)
        i = fin
        if i < b:
            out += banner(notes.blocks.get(i), i)
            if i in names and i not in _EMITTED:
                cmt = notes.labels.get(i, (None, ""))[1]
                out.append(f"{names[i]}:" + (f"\t\t; {cmt}" if cmt else ""))
                _EMITTED.add(i)
    return out


def fila_datos(data, org, i, fin, palabras, names):
    """Una fila del volcado. En defw se anota a donde apunta, si se sabe."""
    row = data[i - org:fin - org]
    if palabras and len(row) >= 2:
        vals = [row[2 * k] | (row[2 * k + 1] << 8) for k in range(len(row) // 2)]
        cmt = f"; {i:04x}"
        dest = [names.get(v) or _DATANAMES.get(v) for v in vals]
        if len(vals) <= 4 and any(dest):
            cmt += "  -> " + " ".join(d or f"{v:#06x}"
                                     for v, d in zip(vals, dest))
        out = [f"\tdefw {','.join(f'0{v:04x}h' for v in vals)}\t{cmt}"]
        if len(row) % 2:                 # byte suelto al final del rango
            out.append(f"\tdefb 0{row[-1]:02x}h\t; {i + len(vals) * 2:04x}")
        return out
    txt = "".join(chr(c) if 32 <= c < 127 else "." for c in row)
    cmt = f"; {i:04x}" + (f"  {txt}" if len(row) >= 8 else "")
    return [f"\tdefb {','.join(f'0{c:02x}h' for c in row)}\t{cmt}"]


def emit_code(data, org, a, b, names, notes):
    tmp = f"{TMP}/_mkasm_chunk.bin"
    open(tmp, "wb").write(data[a - org:b - org])
    # TMP/TEMP saneados para z80dasm: bajo el make de msys llegan como "/tmp",
    # que el CRT nativo de Windows no sabe usar, y el tmpfile() interno de
    # z80dasm acaba intentando crear en la raiz del disco (Permission denied).
    dtmp = os.path.dirname(tmp) or "."
    r = subprocess.run(["z80dasm", "-a", "-l", "-g", hex(a), tmp],
                       capture_output=True, text=True,
                       env=dict(os.environ, TMP=dtmp, TEMP=dtmp))
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
