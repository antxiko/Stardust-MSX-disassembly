#!/usr/bin/env python3
"""Convierte a WAV lo que el juego escribio DE VERDAD en el chip de sonido.

La diferencia con tools/suena_musica.py es de naturaleza, no de calidad:
aquella EJECUTA el guion tal como lo hemos leido del listado -o sea que suena
nuestra interpretacion, y si nos equivocamos suena el error-, y esta se limita a
reproducir la pista medida en el emulador con tools/omsx_psg_pista.tcl. Aqui no
hay deduccion: hay periodos, volumenes, mezclador y ruido, con su instante.

Para que sirve: da la referencia contra la que juzgar el sintetizador. Si este
WAV suena como el juego y el otro no, lo que falla es la lectura, no la medida.

Lo que si es una eleccion nuestra, y por eso se dice:
  - la tabla de amplitudes del AY-3-8910 (16 pasos logaritmicos), porque el
    registro de volumen trae un indice, no una amplitud;
  - el ruido se genera con el registro de desplazamiento de 17 bits del chip;
  - si un canal esta en modo ENVOLVENTE (bit 4 del registro de volumen) no se
    puede reproducir sin los registros 11-13, que la pista no trae: se avisa y
    se le pone volumen fijo.

Uso:  suena_pista.py dump/psg_hiscore/pista.txt salida.wav
"""
import struct
import sys

HZ = 44100
RELOJ = 3579545 / 2.0 / 16.0     # el divisor de tono del AY
RELOJ_RUIDO = 3579545 / 2.0 / 16.0

# Las 16 amplitudes del AY, normalizadas. No es una rampa lineal: cada paso son
# unos 3 dB, y por eso una envolvente suena a envolvente y no a escalon.
AMP = [0.0000, 0.0137, 0.0205, 0.0291, 0.0423, 0.0618, 0.0847, 0.1369,
       0.1691, 0.2647, 0.3527, 0.4499, 0.5704, 0.6873, 0.8482, 1.0000]


def lee(ruta):
    """Devuelve, por canal, la lista de instantaneas (t, periodo, vol, mez, ruido)."""
    por = {0: [], 1: [], 2: []}
    for linea in open(ruta):
        campos = linea.split()
        if len(campos) < 6:
            continue
        t, c, p, v, mez, rui = campos[:6]
        por[int(c)].append((float(t), int(p), int(v), int(mez), int(rui)))
    return por


def canal(instantes, t0, n, avisos):
    """Sintetiza un canal entero a partir de sus instantaneas."""
    m = [0.0] * n
    fase = 0.0
    lfsr = 1
    fase_r = 0.0
    for i, (t, p, v, mez, rui) in enumerate(instantes):
        fin = instantes[i + 1][0] if i + 1 < len(instantes) else None
        ini = int((t - t0) * HZ)
        tope = n if fin is None else min(n, int((fin - t0) * HZ))
        if tope <= ini:
            continue
        if v & 0x10:
            avisos.add("envolvente")
            a = AMP[10]
        else:
            a = AMP[v & 0x0F]
        # El mezclador va al reves de lo que uno diria: un CERO es "abierto".
        m_tono = a > 0 and p > 0 and not (mez & 0x01)
        m_ruido = a > 0 and not (mez & 0x08)
        paso = (RELOJ / p) / HZ if p > 0 else 0.0
        paso_r = (RELOJ_RUIDO / (rui if rui else 1)) / HZ
        for j in range(ini, tope):
            s = 0.0
            if m_tono:
                fase = (fase + paso) % 1.0
                s += a if fase < 0.5 else -a
            if m_ruido:
                fase_r += paso_r
                while fase_r >= 1.0:
                    fase_r -= 1.0
                    # el registro de desplazamiento de 17 bits del AY
                    lfsr = (lfsr >> 1) ^ (0x10000 if (lfsr & 1) else 0) \
                        ^ (0x10000 if (lfsr & 8) else 0)
                s += a if (lfsr & 1) else -a
            m[j] = s
    return m


def main(pista, salida):
    por = lee(pista)
    todos = [e for c in por.values() for e in c]
    if not todos:
        print("la pista esta vacia")
        return 2
    t0 = min(e[0] for e in todos)
    t1 = max(e[0] for e in todos)
    n = int((t1 - t0) * HZ)
    avisos = set()
    mezcla = [0.0] * n
    for c in (0, 1, 2):
        if not por[c]:
            continue
        # El mezclador de cada canal esta en su propio bit.
        instantes = [(t, p, v,
                      ((mez >> c) & 1) | (((mez >> (3 + c)) & 1) << 3), rui)
                     for t, p, v, mez, rui in por[c]]
        for j, s in enumerate(canal(instantes, t0, n, avisos)):
            mezcla[j] += s
    pico = max(abs(x) for x in mezcla) or 1.0
    datos = b"".join(struct.pack("<h", int(32000 * x / pico / 1.0))
                     for x in mezcla)
    with open(salida, "wb") as f:
        f.write(b"RIFF" + struct.pack("<I", 36 + len(datos)) + b"WAVEfmt ")
        f.write(struct.pack("<IHHIIHH", 16, 1, 1, HZ, HZ * 2, 2, 16))
        f.write(b"data" + struct.pack("<I", len(datos)) + datos)
    print("%.1f s desde t=%.2f" % (n / float(HZ), t0))
    for c in (0, 1, 2):
        notas = len([1 for e in por[c] if e[1] > 0])
        print("  canal %d: %d instantaneas (%d con tono)" % (c, len(por[c]), notas))
    if "envolvente" in avisos:
        print("  AVISO: algun canal usa la ENVOLVENTE del chip (bit 4 del")
        print("         volumen). La pista no trae los registros 11-13, asi")
        print("         que ahi el volumen es inventado.")
    print("  -> %s" % salida)
    return 0


if __name__ == "__main__":
    sys.exit(main(*sys.argv[1:]))
