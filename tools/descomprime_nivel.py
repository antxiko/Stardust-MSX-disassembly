#!/usr/bin/env python3
"""Descomprime los datos de nivel del juego de naves.

Cada zona ocupa unos 250 bytes en la cinta, y eso no da para un mapa: van
comprimidos. El esquema es un DICCIONARIO DE FRASES RECURSIVO, y esta escrito en
la rutina de 0xDA06 del propio juego, que es de donde sale esto:

    da06: ld a,(hl)              ; un token del flujo
          cp 0ffh / jr z,...     ; 0xFF: se acabo
          jp p,0da2ah            ; bit 7 a cero -> es un literal
          push hl
          ld hl,0de18h           ; el diccionario
          and 07fh               ; los 7 bits bajos son el indice
          ld b,a
    da19: ld e,(hl) / add hl,de / djnz   ; se salta B frases
    da1d: ld b,(hl) / dec b / inc hl     ; B = cuantos tokens trae la frase
    da20: push bc / call 0da06h / pop bc / djnz   ; y se expande CADA UNO
          pop hl / inc hl / ret
    da2a: ld (ix+000h),a / inc ix / inc hl / ret  ; el literal, al buffer

Lo que lo hace bonito: la expansion de una frase vuelve a llamar a la misma
rutina, asi que una frase puede contener otras frases. Es una gramatica, no un
simple copia-pega.

El diccionario esta en 0xDE18 y sus frases son de longitud variable: cada una
empieza por su propio tamano -contandose a si mismo-, que es como se salta de
una a la siguiente sin necesidad de una tabla de indices.

La tabla de zonas esta en 0xDE03: siete entradas de tres bytes con el puntero a
los datos y un byte de color. El juego la indexa con el numero de zona menos uno
(0xBEED: `ld a,(0e157h) / dec a / ... / add hl,hl / add hl,de / ld de,0de03h`).

Uso: descomprime_nivel.py <work/juego.raw> [zona]
"""
import sys

ORG = 0x47A0
TABLA = 0xDE03          # 7 entradas de (puntero, puntero, color)
DICC = 0xDE18           # el diccionario de frases
DESTINO = 0x5C50        # donde el juego deja el mapa ya expandido
LIMITE = 1 << 16        # tope de seguridad por si un flujo viene corrupto


class Nivel:
    def __init__(self, raw, org=ORG):
        self.d = raw
        self.org = org

    def b(self, a):
        return self.d[a - self.org]

    def w(self, a):
        return self.b(a) | (self.b(a + 1) << 8)

    def zona(self, n):
        """Devuelve (puntero a los datos, byte de color) de la zona n, 1..7."""
        a = TABLA + (n - 1) * 3
        return self.w(a), self.b(a + 2)

    def frase(self, indice):
        """Salta por el diccionario hasta la frase pedida y devuelve sus tokens."""
        a = DICC
        for _ in range(indice):
            a += self.b(a)
        n = self.b(a) - 1
        return [self.b(a + 1 + k) for k in range(n)]

    def expande(self, token, salida, hondo=0):
        if hondo > 64:
            raise RecursionError("el diccionario se referencia a si mismo")
        if token < 0x80:
            salida.append(token)
            return
        for t in self.frase(token & 0x7F):
            self.expande(t, salida, hondo + 1)

    def descomprime(self, n):
        """Expande la zona n. Devuelve (bytes, cuantos ocupaba comprimida)."""
        p, _color = self.zona(n)
        salida, a = [], p
        while True:
            t = self.b(a)
            a += 1
            if t == 0xFF:
                break
            self.expande(t, salida)
            if len(salida) > LIMITE:
                raise ValueError("no aparece el 0xFF de fin")
        return bytes(salida), a - p


def main(argv):
    if len(argv) < 2:
        print(__doc__)
        return 2
    with open(argv[1], "rb") as f:
        niv = Nivel(f.read())
    zonas = [int(argv[2])] if len(argv) > 2 else range(1, 8)
    print("  zona  puntero  color  comprimida  expandida  ratio")
    print("  " + "-" * 52)
    for n in zonas:
        p, color = niv.zona(n)
        datos, comp = niv.descomprime(n)
        print(f"   {n}    0x{p:04X}    0x{color:02X}   {comp:6d} B   {len(datos):6d} B"
              f"   {len(datos)/comp:5.1f}x")
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
