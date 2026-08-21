#!/usr/bin/env python3
"""Porta comentarios entre dos listados que comparten codigo.

POR QUE EXISTE
--------------
`juego` y `parte2` son dos bloques de cinta distintos, pero comparten unas
2.300 instrucciones repartidas en cuarenta tramos: el interprete de sonido
entero, los cuatro pintores, el rotulador, la pantalla de records, las tablas
de objetos... Es el mismo codigo ensamblado en otra direccion y trabajando
sobre otras variables. Comentar dos veces lo mismo es tirar el trabajo, y
copiar a mano es como se cuelan los errores.

QUE HACE
--------
  python tools/porta_notas.py mapa
      Lista los tramos comunes: cuantas instrucciones, donde caen en cada
      listado y cuantos comentarios tiene cada lado.

  python tools/porta_notas.py porta 0xC389 0xC5E2
      Para ese rango del listado DESTINO, saca las lineas `C 0x.... texto`
      listas para pegar en el .notes, tomadas del origen y con las citas de
      direcciones ya traducidas. Ademas enfrenta los comentarios que existen a
      los dos lados, que es donde salen las contradicciones.

COMO ALINEA, Y POR QUE NO SE FIA DE UN DELTA
--------------------------------------------
No hay un desplazamiento unico: en el motor de sonido el codigo va con delta
0x1CEC hasta op_fin y con 0x1CEB detras -parte2 gasta un byte mas ahi-, las
variables con 0x1D0D y las tablas con 0x1CE5. Asi que se comparan las dos
secuencias de instrucciones NORMALIZADAS -toda direccion, sea literal o
etiqueta, sustituida por un hueco, y la longitud de la instruccion pegada
detras- con difflib, y los tramos comunes salen solos, con sus insercciones y
sus huecos.

El mapa de direcciones sale de la propia alineacion: cada par de instrucciones
casadas da un par (origen -> destino), y cada operando-direccion de un par
casado da otro. Lo que el mapa no sabe traducir se marca con <<?>> en vez de
inventarselo.

LO QUE NO HACE, Y HAY QUE HACER A MANO
--------------------------------------
No comprueba que el comentario sea VERDAD en el destino. El codigo es el mismo,
pero los datos no: donde parte2 dice "45 dibujos de 32x32" aqui son 111, y
donde dice "la torre" aqui es la zona. Las cifras hay que remedirlas en el
listado de destino, siempre. Tampoco decide si un comentario portado sobra
porque el vecino ya lo dice: eso se mira leyendo.
"""
import difflib
import re
import sys
from collections import Counter

ASM = re.compile(r'^\t(?P<ins>\S.*?)\s*;(?P<addr>[0-9a-f]{4})(?:\s{2,};\s?(?P<com>.*))?$')
ETQ = re.compile(r'^(?P<nom>[A-Za-z_][A-Za-z0-9_]*):')
HEX4 = re.compile(r'\b0([0-9a-f]{4})h\b')
SIM = re.compile(r'\b([A-Za-z_][A-Za-z0-9_]*)\b')
CITA = re.compile(r'0x([0-9A-Fa-f]{4})')

REGS = {'a', 'b', 'c', 'd', 'e', 'h', 'l', 'af', 'bc', 'de', 'hl', 'ix', 'iy',
        'sp', 'i', 'r', 'nz', 'z', 'nc', 'po', 'pe', 'p', 'm'}

ORIGEN = 'src/stardust_parte2.asm'
DESTINO = 'src/stardust_juego.asm'


def lee(path):
    """addr -> (texto, comentario o None); y el mapa nombre -> addr."""
    ins, etq, orden = {}, {}, []
    with open(path, encoding='utf-8') as f:
        for line in f:
            line = line.rstrip('\n')
            m = ETQ.match(line)
            if m:
                orden.append(('E', m.group('nom')))
                continue
            m = ASM.match(line)
            if not m:
                continue
            t = m.group('ins').strip()
            a = int(m.group('addr'), 16)
            if t.split()[0] in ('defb', 'defw', 'defs'):
                orden.append(('D', a))
                continue
            ins[a] = (t, m.group('com'))
            orden.append(('I', a))
    pend = []
    for tipo, v in orden:
        if tipo == 'E':
            pend.append(v)
        else:
            for nom in pend:
                etq[nom] = v
            pend = []
    return ins, etq


def plantilla(t, etq):
    """El texto con las direcciones fuera, y la lista de las que salen."""
    dirs = []

    def porhex(m):
        dirs.append(int(m.group(1), 16))
        return '@'

    def porsim(m):
        nom = m.group(1)
        if nom.lower() in REGS:
            return nom
        if nom in etq:
            dirs.append(etq[nom])
            return '@'
        return nom
    return SIM.sub(porsim, HEX4.sub(porhex, t)), dirs


def flujo(ins, etq):
    ks = sorted(ins)
    out = []
    for i, a in enumerate(ks):
        t, com = ins[a]
        p, d = plantilla(t, etq)
        largo = (ks[i + 1] - a) if i + 1 < len(ks) else 1
        out.append(dict(addr=a, txt=t, com=com, plant='%s|%d' % (p, largo), dirs=d))
    return out


def alinea():
    A = flujo(*lee(ORIGEN))
    B = flujo(*lee(DESTINO))
    sm = difflib.SequenceMatcher(None, [x['plant'] for x in A],
                                 [x['plant'] for x in B], autojunk=False)
    return A, B, sm


def mapa_de_direcciones(A, B, sm):
    mapa = {}
    for i, j, n in sm.get_matching_blocks():
        for k in range(n):
            a, b = A[i + k], B[j + k]
            mapa.setdefault(a['addr'], Counter())[b['addr']] += 1
            for x, y in zip(a['dirs'], b['dirs']):
                mapa.setdefault(x, Counter())[y] += 1
    return mapa


def traduce(txt, mapa):
    def rep(m):
        v = int(m.group(1), 16)
        c = mapa.get(v)
        if not c:
            return '0x%04X<<?>>' % v
        (d, _), = c.most_common(1)
        if len(c) > 1:
            return '0x%04X<<%s?>>' % (d, '/'.join('%04X' % k for k in c))
        return '0x%04X' % d
    return CITA.sub(rep, txt)


def cmd_mapa(minimo):
    A, B, sm = alinea()
    print('%s: %d instrucciones' % (ORIGEN, len(A)))
    print('%s: %d instrucciones' % (DESTINO, len(B)))
    total = 0
    for i, j, n in sm.get_matching_blocks():
        if n < minimo:
            continue
        ca = sum(1 for k in range(n) if A[i + k]['com'])
        cb = sum(1 for k in range(n) if B[j + k]['com'])
        porta = sum(1 for k in range(n) if A[i + k]['com'] and not B[j + k]['com'])
        total += n
        print('  %4d instr | origen 0x%04X-0x%04X (%3d C) -> destino 0x%04X-0x%04X (%3d C) | portables %d'
              % (n, A[i]['addr'], A[i + n - 1]['addr'], ca,
                 B[j]['addr'], B[j + n - 1]['addr'], cb, porta))
    print('total en comun: %d instrucciones' % total)


def cmd_porta(d0, d1):
    A, B, sm = alinea()
    mapa = mapa_de_direcciones(A, B, sm)
    print('# porte %s -> %s, destino 0x%04X-0x%04X' % (ORIGEN, DESTINO, d0, d1))
    n = 0
    for i, j, ln in sm.get_matching_blocks():
        if ln < 6 or B[j]['addr'] > d1 or B[j + ln - 1]['addr'] < d0:
            continue
        print('\n# --- tramo: origen 0x%04X-0x%04X -> destino 0x%04X-0x%04X (%d instr)'
              % (A[i]['addr'], A[i + ln - 1]['addr'],
                 B[j]['addr'], B[j + ln - 1]['addr'], ln))
        for k in range(ln):
            a, b = A[i + k], B[j + k]
            if not (d0 <= b['addr'] <= d1):
                continue
            if a['com'] and not b['com']:
                print('C 0x%04X %s' % (b['addr'], traduce(a['com'], mapa)))
                print('#      %-30s <- origen 0x%04X %s' % (b['txt'], a['addr'], a['txt']))
                n += 1
            elif a['com'] and b['com']:
                t = traduce(a['com'], mapa)
                if t.strip() != b['com'].strip():
                    print('#  COTEJO 0x%04X %s' % (b['addr'], b['txt']))
                    print('#     origen : %s' % t)
                    print('#     destino: %s' % b['com'])
    print('\n# total portables: %d' % n)


def main():
    if len(sys.argv) < 2 or sys.argv[1] not in ('mapa', 'porta'):
        print(__doc__)
        return 2
    if sys.argv[1] == 'mapa':
        cmd_mapa(int(sys.argv[2]) if len(sys.argv) > 2 else 12)
    else:
        cmd_porta(int(sys.argv[2], 16), int(sys.argv[3], 16))
    return 0


if __name__ == '__main__':
    sys.exit(main())
