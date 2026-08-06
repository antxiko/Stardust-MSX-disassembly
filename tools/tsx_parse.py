#!/usr/bin/env python3
"""Parser de TSX (TZX 1.21 + extension MSX 0x4B) -> inventario + extraccion de ficheros.

Offsets verificados contra makeTSX (nataliapc), TZX_Blocks.h:
  Block #4B  KCS/MSX : pause,pilot,pilotnum,bit0,bit1,bitcfg,bytecfg,data
  Block #10  Standard: pause, len, data
  Block #11  Turbo   : pilot,sync1,sync2,bit0,bit1,pilotnum,rbits,pause,len[3],data
  Block #12  PureTone / #13 PulseSeq / #14 PureData / #15 DirectRec / #20 Pause
  Block #30  Text / #32 Archive info / #35 Custom info

Cabecera de fichero en cinta MSX: 10 bytes iguales (D3=BASIC, D0=BIN, EA=ASCII)
seguidos de 6 bytes de nombre. Un fichero BIN lleva ademas, al principio del
bloque de datos, 3 words: direccion de carga, direccion final y direccion de
ejecucion.
"""
import json
import struct
import sys
import os

MSX_HDR = {0xD3: "BASIC", 0xD0: "BIN", 0xEA: "ASCII"}


def u16(b, o):
    return struct.unpack_from("<H", b, o)[0]


def u24(b, o):
    return b[o] | (b[o + 1] << 8) | (b[o + 2] << 16)


def u32(b, o):
    return struct.unpack_from("<I", b, o)[0]


class Blk:
    def __init__(self, idx, bid, off, payload, info, head=b""):
        self.idx, self.bid, self.off, self.payload, self.info = idx, bid, off, payload, info
        # 'head' son los bytes de parametros del bloque (modulacion, pausas...)
        # tal cual venian; guardarlos literalmente permite reconstruir el TSX
        # sin reinterpretarlos y sin perder nada.
        self.head = head


def parse(path):
    d = open(path, "rb").read()
    assert d[:8] == b"ZXTape!\x1a", "no es TZX/TSX"
    print(f"# TZX v{d[8]}.{d[9]}  fichero={os.path.basename(path)}  {len(d)} bytes\n")
    o, idx, blocks = 10, 0, []

    while o < len(d):
        start = o
        bid = d[o]
        o += 1
        payload, info, head = b"", "", b""

        if bid == 0x4B:  # KCS / MSX
            blen = u32(d, o)
            b = d[o + 4: o + 4 + blen]
            o += 4 + blen
            payload = b[12:]
            head = b[:12]
            bitcfg, bytecfg = b[10], b[11]
            info = (f"KCS  pause={u16(b,0)}ms pilot={u16(b,4)}x{u16(b,2)}T "
                    f"bit0={u16(b,6)}T bit1={u16(b,8)}T "
                    f"zpulses={bitcfg>>4} opulses={bitcfg&15} "
                    f"lead={bytecfg>>6}b/{(bytecfg>>5)&1} trail={(bytecfg>>3)&3}b/{(bytecfg>>2)&1} "
                    f"{'MSb' if bytecfg&1 else 'LSb'}")
        elif bid == 0x10:  # standard speed
            pause, n = u16(d, o), u16(d, o + 2)
            payload = d[o + 4: o + 4 + n]
            head = d[o:o + 2]
            o += 4 + n
            info = f"STANDARD pause={pause}ms"
        elif bid == 0x11:  # turbo
            pilot, s1, s2, b0, b1, pn, rb, pause = (
                u16(d, o), u16(d, o + 2), u16(d, o + 4), u16(d, o + 6),
                u16(d, o + 8), u16(d, o + 10), d[o + 12], u16(d, o + 13))
            n = u24(d, o + 15)
            payload = d[o + 18: o + 18 + n]
            o += 18 + n
            info = (f"TURBO pilot={pn}x{pilot}T sync={s1}/{s2}T "
                    f"bit0={b0}T bit1={b1}T rbits={rb} pause={pause}ms")
        elif bid == 0x12:  # pure tone
            info = f"PURETONE {u16(d,o+2)} pulsos x {u16(d,o)}T"
            o += 4
        elif bid == 0x13:  # pulse sequence
            n = d[o]
            info = f"PULSESEQ {n} pulsos"
            o += 1 + 2 * n
        elif bid == 0x14:  # pure data
            b0, b1, rb, pause = u16(d, o), u16(d, o + 2), d[o + 4], u16(d, o + 5)
            n = u24(d, o + 7)
            payload = d[o + 10: o + 10 + n]
            o += 10 + n
            info = f"PUREDATA bit0={b0}T bit1={b1}T rbits={rb} pause={pause}ms"
        elif bid == 0x15:  # direct recording
            n = u24(d, o + 5)
            info = f"DIRECTREC {u16(d,o)}T/sample pause={u16(d,o+2)}ms {n} bytes"
            o += 8 + n
        elif bid == 0x20:
            info = f"PAUSE {u16(d,o)}ms"
            o += 2
        elif bid == 0x21:
            n = d[o]
            info = f"GROUP START '{d[o+1:o+1+n].decode('latin-1')}'"
            o += 1 + n
        elif bid == 0x22:
            info = "GROUP END"
        elif bid == 0x30:
            n = d[o]
            info = f"TEXT '{d[o+1:o+1+n].decode('latin-1')}'"
            o += 1 + n
        elif bid == 0x32:
            n = u16(d, o)
            b = d[o + 2: o + 2 + n]
            o += 2 + n
            p, parts = 1, []
            for _ in range(b[0]):
                tl = b[p + 1]
                parts.append(f"{b[p]:#04x}={b[p+2:p+2+tl].decode('latin-1')}")
                p += 2 + tl
            info = "ARCHIVE " + " | ".join(parts)
        elif bid == 0x35:
            ident = d[o:o + 16].decode("latin-1").rstrip()
            n = u32(d, o + 16)
            info = f"META {ident} = {d[o+20:o+20+n].decode('latin-1')}"
            o += 20 + n
        elif bid == 0x5A:
            info = "GLUE"
            o += 9
        else:
            print(f"!! bloque desconocido {bid:#04x} en {start:#x} - paro")
            break

        if not head and not payload:
            # Bloques de metadatos: se guardan enteros, sin interpretar
            head = d[start + 1:o]
        blocks.append(Blk(idx, bid, start, payload, info, head))
        line = f"[{idx:02d}] @{start:#07x} id={bid:#04x} {info}"
        if payload:
            line += f"  [{len(payload)} bytes]"
        print(line)

        # Reconocer cabecera de fichero MSX
        if len(payload) >= 16 and payload[0] in MSX_HDR and payload[:10] == bytes([payload[0]]) * 10:
            print(f"       >>> CABECERA MSX {MSX_HDR[payload[0]]} nombre='{payload[10:16].decode('latin-1')}'")
        elif len(payload) >= 6:
            ld, end, exe = u16(payload, 0), u16(payload, 2), u16(payload, 4)
            if end >= ld and (end - ld + 1) == len(payload) - 6:
                print(f"       >>> DATOS BIN load={ld:#06x} end={end:#06x} exec={exe:#06x} "
                      f"({end-ld+1} bytes)")
        idx += 1
    return blocks


def extract(blocks, outdir):
    """Empareja cabecera + datos y escribe ficheros con nombre real."""
    os.makedirs(outdir, exist_ok=True)
    pending = None
    n = 0
    for b in blocks:
        p = b.payload
        if not p:
            continue
        if len(p) >= 16 and p[0] in MSX_HDR and p[:10] == bytes([p[0]]) * 10:
            pending = (MSX_HDR[p[0]], p[10:16].decode("latin-1").strip() or f"blk{b.idx}")
            continue
        if pending:
            kind, name = pending
            pending = None
            safe = "".join(c if c.isalnum() else "_" for c in name)
            fn = os.path.join(outdir, f"{b.idx:02d}_{safe}.{kind.lower()}")
            open(fn, "wb").write(p)
            print(f"  -> {fn}  ({len(p)} bytes, {kind})")
            n += 1
        else:
            fn = os.path.join(outdir, f"{b.idx:02d}_raw_{b.bid:02x}.bin")
            open(fn, "wb").write(p)
            print(f"  -> {fn}  ({len(p)} bytes, sin cabecera)")
            n += 1
    print(f"\n{n} ficheros en {outdir}/")


def write_manifest(path, blocks, data, outdir):
    """Manifiesto para poder reconstruir el TSX con tools/tsx_build.py."""
    man = {"version": [data[8], data[9]], "blocks": []}
    for b in blocks:
        e = {"id": b.bid, "head": b.head.hex(), "info": b.info}
        if b.payload:
            fn = f"block{b.idx:02d}.raw"
            open(os.path.join(outdir, fn), "wb").write(b.payload)
            e["data"] = fn
        man["blocks"].append(e)
    json.dump(man, open(path, "w"), indent=1)
    print(f"manifiesto -> {path}")


if __name__ == "__main__":
    bl = parse(sys.argv[1])
    outdir = sys.argv[2] if len(sys.argv) > 2 else "extracted"
    print("\n== EXTRACCION ==")
    extract(bl, outdir)
    os.makedirs(outdir, exist_ok=True)
    write_manifest(os.path.join(outdir, "manifest.json"), bl,
                   open(sys.argv[1], "rb").read(), outdir)
