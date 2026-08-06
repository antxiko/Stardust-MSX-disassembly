#!/usr/bin/env python3
"""Busca pistas para los rangos "datos sin clasificar" en la version de Spectrum.

QUE HACE, Y EN QUE SE DIFERENCIA DE coteja_spectrum.py
------------------------------------------------------
`coteja_spectrum.py` solo adopta un nombre cuando los bytes son IDENTICOS. Eso
es lo correcto para afirmar cosas, pero deja fuera todo lo que la conversion
reescribio: si los de MSX rehicieron una rutina, sus bytes no coinciden y el
cotejo calla, aunque la rutina siga estando en el mismo sitio y haciendo lo
mismo.

Esta herramienta hace lo otro: coge un rango que aqui no sabemos que es y mira
QUE HABIA EN LA VERSION DE SPECTRUM EN LA DIRECCION EQUIVALENTE. Si alli el
fichero de control de sus autores tiene una seccion con nombre, eso es una
PISTA, no una prueba.

COMO SE DECIDE LA DIRECCION EQUIVALENTE
---------------------------------------
No hay un unico desplazamiento: la conversion movio unas regiones y dejo otras
donde estaban. Asi que se usa el desplazamiento de los TRAMOS VERIFICADOS que
rodean al rango:

  - Se alinean los dos binarios igual que en coteja_spectrum.py.
  - Para el rango en cuestion se busca el tramo verificado anterior y el
    posterior.
  - Si los dos traen el MISMO desplazamiento, se toma ese: el rango esta metido
    dentro de una region que se movio en bloque, y se puede confiar.
  - Si traen desplazamientos DISTINTOS, el rango cae en una frontera y se dan
    los dos candidatos, diciendo que lo son.

Y de propina se mide el parecido byte a byte en el destino: no para afirmar
nada, sino para ordenar las pistas. Un 3 % es ruido; un 60 % con el codigo
reescrito alrededor dice que los datos si se trajeron y solo cambio el codigo.

LO QUE ESTA HERRAMIENTA NO HACE
-------------------------------
No escribe nada en los ficheros de notas. Lo que salga de aqui es material para
mirarlo a mano y decidir, que es justo la vuelta al error que costo dos
republicaciones: adoptar automaticamente nombres del otro binario.

Uso: coteja_equivalencias.py <spectrum48.bin> <bloque.raw> <org> <s1.ctl> <notas>
"""
import re
import sys

import coteja_spectrum as cs

# En el Spectrum, 0x4000-0x5AFF es la memoria de PANTALLA: 6144 bytes de pixeles
# y 768 de atributos. Lo que la conversion de MSX metio en esas direcciones no
# puede tener equivalente alli, porque alli el original tiene la imagen. Es una
# consecuencia directa de la diferencia entre las dos maquinas: el MSX tiene la
# VRAM detras del VDP y esas direcciones le quedaron libres.
PANTALLA_FIN = 0x5B00


def lee_sin_clasificar(ruta):
    """Los rangos declarados como 'datos sin clasificar' en un .notes."""
    out = []
    for ln in open(ruta, encoding="utf-8", errors="replace"):
        m = re.match(r"^D\s+0x([0-9A-Fa-f]{4})\s+0x([0-9A-Fa-f]{4})\s+(.*)$",
                     ln.strip())
        if m and "sin clasificar" in m.group(3):
            out.append((int(m.group(1), 16), int(m.group(2), 16),
                        m.group(3).strip()))
    return sorted(out)


def alinea(spec, msx, org):
    """Los tramos verificados byte a byte, con su desplazamiento."""
    cuenta = cs.desplazamientos(msx, org, cs.indexa(spec))
    buenos = [d for d, n in cuenta.most_common(12) if n >= 8]
    mejor = {}
    for d in buenos:
        for a, b in cs.rachas(spec, msx, org, d):
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
    return tramos


def candidatos(tramos, ini, fin):
    """Desplazamientos a probar para este rango, del mas fiable al menos.

    Devuelve tuplas (delta, motivo, distancia). La distancia es cuantos bytes
    hay entre el rango y el tramo verificado que respalda el desplazamiento:
    cero si lo solapa, y cuanto mas grande, mas floja es la pista.

    El orden importa porque es el de la fuerza de la evidencia:
      1. Un tramo verificado que SOLAPA el rango. Es lo mas fuerte que hay:
         parte de esos bytes ya se sabe que son identicos.
      2. El tramo anterior y el posterior, si coinciden en desplazamiento: el
         rango esta metido dentro de una region que se movio en bloque.
      3. Si no coinciden, los dos por separado, dichos como candidatos.
    """
    out = []

    def anota(d, motivo, dist):
        for k, (dd, _, _) in enumerate(out):
            if dd == d:
                if dist < out[k][2]:
                    out[k] = (d, motivo, dist)
                return
        out.append((d, motivo, dist))

    for a, b, d in tramos:
        if a < fin and b > ini:
            anota(d, f"tramo verificado que solapa ({min(b, fin) - max(a, ini)} B)", 0)
    antes = [t for t in tramos if t[1] <= ini]
    despues = [t for t in tramos if t[0] >= fin]
    a_t = antes[-1] if antes else None
    d_t = despues[0] if despues else None
    if a_t and d_t and a_t[2] == d_t[2]:
        anota(a_t[2], "region homogenea: mismo desplazamiento antes y despues",
              min(ini - a_t[1], d_t[0] - fin))
    else:
        if a_t:
            anota(a_t[2], "tramo anterior", ini - a_t[1])
        if d_t:
            anota(d_t[2], "tramo posterior", d_t[0] - fin)
    # El +0 se prueba siempre: es el desplazamiento dominante de la conversion
    # y sirve de referencia aunque no haya un tramo cerca que lo respalde.
    anota(0, "desplazamiento dominante del bloque", 1 << 20)
    out.sort(key=lambda t: t[2])
    return out


def secciones_en(ctl, ini_s, fin_s):
    """Secciones del control que solapan con [ini_s, fin_s)."""
    out = []
    for k, (dir_s, tipo, texto) in enumerate(ctl):
        sig = ctl[k + 1][0] if k + 1 < len(ctl) else 0x10000
        if dir_s < fin_s and sig > ini_s:
            out.append((dir_s, sig, tipo, texto))
    return out


def parecido(spec, msx, org, ini, fin, delta):
    """Porcentaje de bytes identicos en la direccion equivalente."""
    n = igual = 0
    for a in range(ini, fin):
        i = a - delta - cs.BASE_SPEC
        j = a - org
        if 0 <= i < len(spec) and 0 <= j < len(msx):
            n += 1
            igual += spec[i] == msx[j]
    return (100.0 * igual / n) if n else 0.0


def main(argv):
    if len(argv) < 6:
        print(__doc__)
        return 2
    spec = open(argv[1], "rb").read()
    msx = open(argv[2], "rb").read()
    org = int(argv[3], 0)
    ctl = cs.lee_ctl(argv[4])
    rangos = lee_sin_clasificar(argv[5])

    tramos = alinea(spec, msx, org)
    print(f"  {len(tramos)} tramos verificados en el bloque de 0x{org:04X}")
    print(f"  {len(rangos)} rangos 'datos sin clasificar', "
          f"{sum(b - a for a, b, _ in rangos)} bytes")
    print()

    for ini, fin, texto in rangos:
        n = fin - ini
        print(f"0x{ini:04X}-0x{fin - 1:04X}  {n:5d} B   {texto[:64]}")
        for delta, motivo, dist in candidatos(tramos, ini, fin):
            ini_s, fin_s = ini - delta, fin - delta
            cerca = "" if dist == 0 else (
                "  [pista floja: no hay nada verificado cerca]"
                if dist > 2048 else f"  [a {dist} B de lo verificado]")
            print(f"    desplazamiento {delta:+d}: {motivo}{cerca}")
            if fin_s <= PANTALLA_FIN and ini_s >= cs.BASE_SPEC:
                print(f"      -> Spectrum 0x{ini_s:04X}-0x{fin_s - 1:04X}: ahi el"
                      " Spectrum tiene su PANTALLA, no hay equivalente posible")
                continue
            if ini_s < cs.BASE_SPEC or fin_s > 0x10000:
                print(f"      -> Spectrum 0x{ini_s:04X}-0x{fin_s - 1:04X}:"
                      " se sale de la RAM del Spectrum, no vale")
                continue
            pct = parecido(spec, msx, org, ini, fin, delta)
            print(f"      -> Spectrum 0x{ini_s:04X}-0x{fin_s - 1:04X}"
                  f"   {pct:.0f} % de bytes iguales")
            secs = secciones_en(ctl, ini_s, fin_s)
            if not secs:
                print("         el control del Spectrum no dice nada de esa zona")
            for dir_s, sig, tipo, t in secs:
                solapa = min(sig, fin_s) - max(dir_s, ini_s)
                print(f"         0x{dir_s:04X}-0x{sig - 1:04X} [{tipo}] {t[:50]}"
                      f"   ({solapa} B)")
        print()
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
