#!/usr/bin/env python3
"""Alinea este binario contra el de la version de ZX Spectrum, y lo hace bien.

POR QUE SE REESCRIBIO ESTA HERRAMIENTA
--------------------------------------
La version anterior localizaba cada seccion del otro binario cogiendo sus
PRIMEROS 32 BYTES y buscandolos con un `find`: se quedaba con la primera
coincidencia, sin comprobar que fuera la unica ni que el desplazamiento
resultante encajara con el de las demas secciones.

Como las dos versiones comparten buena parte del dibujo, esas agujas caian
dentro de la tileria. De ahi salieron 41 puntos de entrada colocados en
direcciones que son graficos, la cobertura del bloque inflada del 25,9 % al
61,6 %, y 28 rangos de datos con nombres del Spectrum metidos en zonas de
sprites. Costo dos republicaciones enteras.

COMO FUNCIONA AHORA
-------------------
No se busca seccion por seccion: se ALINEAN los dos binarios primero, y solo
despues se miran los nombres.

  1. Se indexan todas las ventanas de VENTANA bytes del binario de Spectrum.
  2. Para cada posicion del binario de MSX se miran sus candidatos y se anota el
     desplazamiento (delta = direccion_msx - direccion_spectrum) de cada uno.
     Los desplazamientos reales de la conversion aparecen miles de veces; el
     ruido, una o dos.
  3. Con los desplazamientos dominantes se extraen las RACHAS maximas de bytes
     identicos, extendiendolas hasta que dejan de coincidir.
  4. Una racha solo cuenta si mide al menos MINIMO bytes y si no es repetitiva:
     el relleno y las tramas planas coinciden en cualquier sitio y no prueban
     nada.

Asi cada tramo que se da por comun trae su prueba: donde empieza en cada
binario, cuanto mide y con que desplazamiento. Y los nombres del fichero de
control solo se adoptan para secciones que caen ENTERAS dentro de una racha
verificada.

El binario de Spectrum sale de la instantanea s1.z80 que publicaron sus autores;
para convertirla a imagen plana esta tools/lee_z80.py.

Uso: coteja_spectrum.py <spectrum48.bin> <binario_msx> <org> [s1.ctl]
"""
import re
import sys
from collections import Counter, defaultdict

BASE_SPEC = 0x4000
VENTANA = 16          # tamano de la aguja para indexar
MINIMO = 24           # por debajo de esto una racha no prueba nada
VARIEDAD = 6          # valores distintos minimos: menos que eso es relleno
TOPE = 40             # candidatos por ventana, para no atascarse en lo repetitivo


def indexa(spec):
    idx = defaultdict(list)
    for i in range(len(spec) - VENTANA + 1):
        lista = idx[spec[i:i + VENTANA]]
        if len(lista) < TOPE:
            lista.append(i)
    return idx


def desplazamientos(msx, org, idx):
    """Cuenta cuantas ventanas apoyan cada desplazamiento."""
    cuenta = Counter()
    for j in range(len(msx) - VENTANA + 1):
        v = msx[j:j + VENTANA]
        if len(set(v)) < VARIEDAD:
            continue
        for i in idx.get(v, ()):
            cuenta[(org + j) - (BASE_SPEC + i)] += 1
    return cuenta


def rachas(spec, msx, org, delta):
    """Rachas maximas de bytes identicos con ese desplazamiento."""
    out, ini = [], None
    for j in range(len(msx)):
        i = org + j - delta - BASE_SPEC
        if 0 <= i < len(spec) and spec[i] == msx[j]:
            if ini is None:
                ini = j
        elif ini is not None:
            out.append((ini, j))
            ini = None
    if ini is not None:
        out.append((ini, len(msx)))
    return [(a, b) for a, b in out
            if b - a >= MINIMO and len(set(msx[a:b])) >= VARIEDAD]


def lee_ctl(ruta):
    sec = []
    for ln in open(ruta, encoding="utf-8", errors="replace"):
        m = re.match(r"^([btwcsBTWCS])\s+\$?([0-9A-Fa-f]{4})\s*(.*)$", ln.rstrip())
        if m and m.group(3).strip():
            sec.append((int(m.group(2), 16), m.group(1).lower(), m.group(3).strip()))
    sec.sort()
    return sec


def main(argv):
    if len(argv) < 4:
        print(__doc__)
        return 2
    spec = open(argv[1], "rb").read()
    msx = open(argv[2], "rb").read()
    org = int(argv[3], 0)
    ctl = lee_ctl(argv[4]) if len(argv) > 4 else []

    print(f"  Spectrum: {len(spec)} bytes desde 0x{BASE_SPEC:04X}")
    print(f"  MSX:      {len(msx)} bytes desde 0x{org:04X}")
    print()

    cuenta = desplazamientos(msx, org, indexa(spec))
    if not cuenta:
        print("  no hay ni una ventana en comun: estos binarios no se parecen")
        return 0

    buenos = [d for d, n in cuenta.most_common(12) if n >= 8]
    print("  desplazamientos dominantes (ventanas que los apoyan):")
    for d, n in cuenta.most_common(12):
        print(f"    {d:+7d}  {n:6d} ventanas" + ("   <-- se usa" if d in buenos else ""))
    print()

    # Para cada byte se queda la racha mas larga, mirando todos los deltas.
    mejor = {}
    for d in buenos:
        for a, b in rachas(spec, msx, org, d):
            for j in range(a, b):
                if j not in mejor or (b - a) > mejor[j][1]:
                    mejor[j] = (d, b - a)

    tramos, j = [], 0
    while j < len(msx):
        if j not in mejor:
            j += 1
            continue
        d = mejor[j][0]
        fin = j
        while fin < len(msx) and mejor.get(fin, (None,))[0] == d:
            fin += 1
        tramos.append((org + j, org + fin, d))
        j = fin

    total = sum(b - a for a, b, _ in tramos)
    print(f"  {len(tramos)} tramos identicos, {total} bytes"
          f"  ({100 * total / len(msx):.1f} % del bloque)")
    print()
    print(f"  {'en el MSX':>19}  {'bytes':>6}  en el Spectrum")
    print("  " + "-" * 52)
    for a, b, d in sorted(tramos, key=lambda t: -(t[1] - t[0]))[:20]:
        print(f"  0x{a:04X}-0x{b - 1:04X}  {b - a:6d}  0x{a - d:04X}"
              f"   (desplazado {d:+d})")
    if len(tramos) > 20:
        print(f"  ... y {len(tramos) - 20} tramos mas")

    if ctl:
        print()
        print("  NOMBRES adoptados: solo los de secciones que caen ENTERAS dentro")
        print("  de un tramo verificado byte a byte.")
        print()
        n = 0
        for k, (dir_s, tipo, texto) in enumerate(ctl):
            fin_s = ctl[k + 1][0] if k + 1 < len(ctl) else dir_s + 64
            for a, b, d in tramos:
                if a <= dir_s + d and fin_s + d <= b:
                    print(f"    0x{dir_s + d:04X}  {tipo}  {texto[:56]}")
                    n += 1
                    break
        print()
        print(f"  {n} de {len(ctl)} secciones del control quedan respaldadas por"
              f" bytes identicos")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
