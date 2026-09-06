"""Que ninguna cabecera de bloque salga repetida en el listado.

`mkasm.py` junta en UN marco todas las lineas `B` de una misma direccion, asi
que una cabecera de varias lineas es legitima y normal. Lo que no lo es: la
MISMA linea -misma direccion y mismo texto- dos veces. Eso solo pasa de una
manera, y es que el aplicador de comentarios se corre varias veces por proyecto
y hasta ahora no filtraba las B. En Mopi Ranger habia 1.731 lineas B para 142
cabeceras: la misma frase hasta veinte veces seguidas dentro del mismo marco, y
232 KB de listado que no decian nada.

No rompe nada -el listado ensambla igual y la densidad no cambia, porque las
cabeceras no cuentan como comentarios de linea-, y por eso no lo veia ningun
test. Solo se ve leyendo el .asm.

Las lineas decorativas quedan fuera de la cuenta: una cabecera enmarcada repite
la misma raya arriba y abajo a proposito.

Este fichero es el mismo en todos los repositorios de la serie: si se arregla
aqui, hay que llevarlo a los demas.
"""

import collections
import glob
import os
import re
import unittest

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

CABECERA = re.compile(r"^B\s+(0x[0-9a-fA-F]{4})\s+(.*)$")
DECORATIVA = re.compile(r"^[-=#*_~+.:\s]*$")


class TestCabecerasDeBloque(unittest.TestCase):

    def test_ninguna_linea_de_cabecera_esta_repetida(self):
        malas = []
        notas = sorted(glob.glob(os.path.join(RAIZ, "src", "*.notes")))
        self.assertTrue(notas, "no hay ningun .notes en src/")
        for ruta in notas:
            cuenta = collections.Counter()
            with open(ruta, encoding="utf-8") as f:
                for ln in f:
                    m = CABECERA.match(ln.rstrip())
                    if m and not DECORATIVA.match(m.group(2)):
                        cuenta[(m.group(1), m.group(2).rstrip())] += 1
            sobran = sum(v - 1 for v in cuenta.values() if v > 1)
            if sobran:
                malas.append("%s: %d lineas B de sobra en %d cabeceras"
                             % (os.path.basename(ruta), sobran,
                                sum(1 for v in cuenta.values() if v > 1)))
        self.assertEqual(malas, [], "; ".join(malas))


if __name__ == "__main__":
    unittest.main()
