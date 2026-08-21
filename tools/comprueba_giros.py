"""Comprueba sobre los bytes de verdad que las tres rutinas de giro del pool de
la segunda parte hacen lo que dicen las notas.

    python tools/comprueba_giros.py work/parte2.raw

Reproduce instruccion a instruccion predesplaza_sprite (0xB2D2), su simetrica
(0xB336) y voltea_sprite (0xB36E) sobre 36 entradas del pool, y compara el
resultado con el giro geometrico que toca. Lo que se buscaba al escribirlo:
si voltea_sprite da media vuelta -como figuraba- o solo un espejo vertical.
"""
import sys

ORG = 0x61D0
raw = open(sys.argv[1], "rb").read()


def leer(dir_, n):
    return list(raw[dir_ - ORG:dir_ - ORG + n])


def bits(entrada, plano):
    """entrada: 64 bytes. plano 0 = mascara (bytes 0,1), 1 = dibujo (bytes 2,3).
    Devuelve matriz 16x16 de 0/1, fila 0 arriba, columna 0 a la izquierda."""
    m = []
    for f in range(16):
        izq = entrada[f * 4 + plano * 2]
        der = entrada[f * 4 + plano * 2 + 1]
        fila = [(izq >> (7 - c)) & 1 for c in range(8)]
        fila += [(der >> (7 - c)) & 1 for c in range(8)]
        m.append(fila)
    return m


def predesplaza(src, hl, iy, slot):
    """Copia fiel de 0xB2D2: rlca del origen + rr en ocho destinos."""
    c = 2
    while c:
        b = 8
        while b:
            a = src[hl]
            for off in (0x01, 0x05, 0x09, 0x0D, 0x11, 0x15, 0x19, 0x1D):
                carry = (a >> 7) & 1
                a = ((a << 1) | carry) & 0xFF          # rlca
                d = iy + off
                slot[d] = ((carry << 7) | (slot[d] >> 1)) & 0xFF   # rr (iy+off)
            hl += 4
            b -= 1
        iy -= 1
        c -= 1


def gira_dcha(entrada):
    slot = [0] * 0x40           # el slot vive en 0x7D55; aqui, indices 0..0x3F
    # iy = 0x7D55, 0x7D75, 0x7D57 y 0x7D77 -> indices 0x00, 0x20, 0x02 y 0x22
    for i, iy in enumerate((0x00, 0x20, 0x02, 0x22)):
        predesplaza(entrada, i, iy, slot)
    return slot


def predesplaza_izq(src, hl, iy, slot):
    """Copia fiel de 0xB336: rrca del origen + rl en ocho destinos."""
    c = 2
    while c:
        b = 8
        while b:
            a = src[hl]
            for off in (0x00, 0x04, 0x08, 0x0C, 0x10, 0x14, 0x18, 0x1C):
                carry = a & 1
                a = ((a >> 1) | (carry << 7)) & 0xFF   # rrca
                d = iy + off
                slot[d] = ((slot[d] << 1) | carry) & 0xFF   # rl (iy+off)
            hl += 4
            b -= 1
        iy += 1
        c -= 1


def gira_izda(entrada):
    slot = [0] * 0x40
    # iy = 0x7D75, 0x7D55, 0x7D77 y 0x7D57
    for i, iy in enumerate((0x20, 0x00, 0x22, 0x02)):
        predesplaza_izq(entrada, i, iy, slot)
    return slot


def rota_ccw(m):
    return [[m[c][15 - f] for c in range(16)] for f in range(16)]


def voltea(entrada):
    """0xB36E: lee de corrido con la pila y escribe hacia atras desde el final."""
    slot = [0] * 0x40
    hl = 0x3F
    sp = 0
    for _ in range(16):
        e, d, c, b = entrada[sp], entrada[sp + 1], entrada[sp + 2], entrada[sp + 3]
        sp += 4
        for v in (b, c, d, e):
            slot[hl] = v
            hl -= 1
    return slot


def rota_cw(m):
    return [[m[15 - c][f] for c in range(16)] for f in range(16)]


def espejo_v(m):
    return [m[15 - f] for f in range(16)]


def media_vuelta(m):
    return [[m[15 - f][15 - c] for c in range(16)] for f in range(16)]


POOL = 0x6555
fallos_giro = fallos_espejo = fallos_180 = fallos_izda = 0
probadas = 0
for n in list(range(0, 24)) + list(range(0x50, 0x5C)):
    ent = leer(POOL + n * 64, 64)
    if not any(ent):
        continue
    probadas += 1
    g = gira_dcha(ent)
    gi = gira_izda(ent)
    v = voltea(ent)
    for plano in (0, 1):
        orig = bits(ent, plano)
        if bits(g, plano) != rota_cw(orig):
            fallos_giro += 1
        if bits(gi, plano) != rota_ccw(orig):
            fallos_izda += 1
        if bits(v, plano) != espejo_v(orig):
            fallos_espejo += 1
        if bits(v, plano) != media_vuelta(orig):
            fallos_180 += 1

print(f"entradas probadas: {probadas}  (dos planos cada una)")
print(f"gira_sprite_dcha != giro de un cuarto a la derecha : {fallos_giro} fallos")
print(f"gira_sprite_izda != giro de un cuarto a la izquierda: {fallos_izda} fallos")
print(f"voltea_sprite    != espejo vertical                : {fallos_espejo} fallos")
print(f"voltea_sprite    != media vuelta (180 grados)      : {fallos_180} fallos")
