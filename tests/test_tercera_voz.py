"""La tercera voz callada: comprueba cada cifra que la web publica de ella.

La web afirma que el canal 2 recibe la direccion de un 0x8B y entra mudo, que
detras hay un guion de 137 bytes que nadie nombra, que los tres duran 8704
cuadros clavados, que ese guion es percusion y que cae en la misma rejilla que
el bajo. Todo eso son numeros concretos sacados del binario, y todos se
desactualizan solos en cuanto alguien toque una nota del listado.

Aqui se contrastan uno a uno contra los bytes de la cinta. Nada de esto mira el
emulador: es analisis estatico, igual que la afirmacion que vigila.

Se saltan solos si no esta la cinta extraida, que no se distribuye.
"""
import os
import sys
import unittest

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(RAIZ, "work")
SRC = os.path.join(RAIZ, "src")
DOCS = os.path.join(RAIZ, "docs")
sys.path.insert(0, os.path.join(RAIZ, "tools"))


def hay(*p):
    return os.path.exists(os.path.join(*p))


sin_cinta = unittest.skipUnless(
    hay(WORK, "juego.raw") and hay(WORK, "parte2.raw"),
    "hace falta 'make extract' para esto")

# Lo que la web publica, en un solo sitio para que no se pueda cambiar a medias.
VOCES = (0xEB52, 0xEC4A, 0xECCB)        # lo que reparte arranca_musica (0xE16F)
PERCUSION = 0xECCC                      # el guion que nadie nombra
FIN_PERCUSION = 0xED54                  # su 0x82, o sea el ultimo byte suyo
CUADROS = 8704                          # lo que dura CADA una de las tres
COMPAS = 128                            # cada cuanto cambia de nota el bajo
GOLPES = [32, 80, 96]                   # dentro del compas
LARGO_VOZ = 137                         # 0xECCC-0xED54, ambos incluidos
EFECTO = 0xED55                         # los 12 bytes de detras, que SI se usan
LLAMADAS = {2: 44, 15: 12}              # las 56 llamadas de la tercera voz
RUIDOS = 156                            # comandos 0x88 que da la tercera voz
# La misma musica, portada al bloque de a pie con el subsistema entero
APIE_VOCES = (0xCE45, 0xCF3D, 0xCFBE)
APIE_PERCUSION = 0xCFBF


@sin_cinta
class TestLaZonaDeLaMusica(unittest.TestCase):
    """Las direcciones y los bytes, leidos a pelo del binario."""

    def setUp(self):
        self.d = open(os.path.join(WORK, "juego.raw"), "rb").read()
        self.org = 0x47A0

    def b(self, a):
        return self.d[a - self.org]

    def test_el_canal_2_recibe_la_direccion_de_un_fin(self):
        # 0x8B es el comando FIN del interprete: limpia los 46 bytes del canal.
        self.assertEqual(self.b(VOCES[2]), 0x8B)

    def test_la_percusion_empieza_justo_detras_y_esta_alineada(self):
        # Si el 0x8B hubiera SOBRESCRITO el primer byte del guion en vez de
        # estar insertado, este `8c 02` iria descolocado. Es la unica prueba que
        # tenemos de que el byte se metio en un hueco.
        self.assertEqual(self.b(PERCUSION), 0x8C)
        self.assertEqual(self.b(PERCUSION + 1), 0x02)

    def test_la_voz_huerfana_mide_137_bytes(self):
        self.assertEqual(FIN_PERCUSION - PERCUSION + 1, LARGO_VOZ)
        self.assertEqual(self.b(FIN_PERCUSION), 0x82)   # acaba en BUCLE

    def test_el_efecto_de_detras_si_lo_usa_alguien(self):
        # Los 12 bytes de 0xED55 se contaron durante un tiempo como parte de la
        # voz. No lo son: hay un `ld de,0ed55h` en 0xCEB6.
        asm = open(os.path.join(SRC, "stardust_juego.asm"), encoding="utf-8").read()
        self.assertIn("ld de,0ed55h", asm)
        self.assertEqual(self.b(EFECTO - 1), 0x82)      # y empieza tras el bucle

    def test_a_la_percusion_no_la_nombra_nadie(self):
        # Ni en este bloque ni en los otros dos de la cinta.
        pal = bytes([PERCUSION & 0xFF, PERCUSION >> 8])
        for nombre in ("juego", "parte2", "pre"):
            ruta = os.path.join(WORK, nombre + ".raw")
            if os.path.exists(ruta):
                self.assertEqual(open(ruta, "rb").read().count(pal), 0,
                                 "0x%04X aparece en %s" % (PERCUSION, nombre))

    def test_el_control_de_esa_busqueda(self):
        # Un "no aparece" no vale nada si la busqueda no encuentra lo que SI
        # esta: 0xECCB tiene que aparecer una vez, en el `ld de` de 0xE181.
        pal = bytes([VOCES[2] & 0xFF, VOCES[2] >> 8])
        self.assertEqual(self.d.count(pal), 1)
        self.assertEqual(self.b(0xE180), 0x11)          # ld de,nn
        self.assertEqual(self.b(0xE181) | (self.b(0xE182) << 8), VOCES[2])


@sin_cinta
class TestLoQueSuena(unittest.TestCase):
    """Las cifras que salen de ejecutar el interprete del juego."""

    @classmethod
    def setUpClass(cls):
        import suena_tres_voces as S
        cls.S = S
        cls.d = open(os.path.join(WORK, "juego.raw"), "rb").read()

    def cuadros(self, ini):
        """Duracion de un guion hasta su bucle, con las frases expandidas."""
        S = self.S
        a, pila, dur, total = ini, [], 8, 0
        for _ in range(200000):
            b = self.d[a - S.ORG]
            if b < 0x80:
                total += dur
                a += 1
                continue
            n = S.ARG[b]
            arg = self.d[a - S.ORG + 1] if n else 0
            sig = a + 1 + n
            if b == 0x83:
                dur = max(1, arg)
            elif b == 0x84:
                total += dur
            elif b == 0x88 and not arg & 0x80:
                total += dur
            elif b == 0x8C:
                pila.append(sig)
                a = (self.d[S.FRASES - S.ORG + arg * 2] |
                     (self.d[S.FRASES - S.ORG + arg * 2 + 1] << 8))
                continue
            elif b == 0x8D:
                a = pila.pop()
                continue
            elif b in (0x82, 0x8B):
                return total
            a = sig
        self.fail("el guion 0x%04X no termina" % ini)

    def test_las_tres_voces_duran_lo_mismo(self):
        # ESTA es la prueba de que el guion huerfano es la tercera voz y no un
        # bloque de datos suelto: dura el mismo compas que las otras dos.
        for v in (VOCES[0], VOCES[1], PERCUSION):
            self.assertEqual(self.cuadros(v), CUADROS,
                             "el guion 0x%04X no dura %d cuadros" % (v, CUADROS))

    def test_la_frase_2_abre_el_ruido_y_cierra_el_tono(self):
        # `81 08`: el comando hace `and 009h`, o sea bit 3 el ruido y bit 0 el
        # tono. Con 0x08 queda el ruido y se va el tono: percusion.
        S = self.S
        p = S.FRASES - S.ORG + 2 * 2
        frase2 = self.d[p] | (self.d[p + 1] << 8)
        self.assertEqual(self.d[frase2 - S.ORG], 0x81)
        self.assertEqual(self.d[frase2 - S.ORG + 1] & 0x09, 0x08)

    def test_la_tercera_voz_llama_44_veces_a_la_2_y_12_a_la_15(self):
        cuenta = {}
        a = PERCUSION
        while a <= FIN_PERCUSION:
            b = self.d[a - self.S.ORG]
            n = self.S.ARG[b] if b >= 0x80 else 0
            if b == 0x8C:
                arg = self.d[a - self.S.ORG + 1]
                cuenta[arg] = cuenta.get(arg, 0) + 1
            a += 1 + n if b >= 0x80 else 1
        self.assertEqual(cuenta, LLAMADAS)
        self.assertEqual(sum(cuenta.values()), 56)

    def test_solo_la_tercera_voz_toca_el_ruido(self):
        S = self.S
        m = S.Musica(self.d, [VOCES[0], VOCES[1], PERCUSION])
        cuadros = [m.tic() for _ in range(1500)]
        # Bits 3-5 del registro 7: un 0 quiere decir ruido ABIERTO.
        for c in (0, 1):
            self.assertEqual(
                sum(1 for _, _, r7, _ in cuadros if not (r7 >> (c + 3)) & 1), 0,
                "el canal %d no deberia tocar el ruido" % c)
        self.assertGreater(
            sum(1 for _, _, r7, _ in cuadros if not (r7 >> 5) & 1), 0)
        # Y no toca el tono: es percusion pura.
        self.assertEqual(
            sum(1 for _, _, r7, _ in cuadros if not (r7 >> 2) & 1), 0)

    def test_el_canal_2_entra_mudo_tal_como_esta(self):
        S = self.S
        m = S.Musica(self.d, list(VOCES))
        cuadros = [m.tic() for _ in range(1500)]
        self.assertEqual(max(v[2] for _, v, _, _ in cuadros), 0)
        self.assertEqual(
            sum(1 for _, _, r7, _ in cuadros if not (r7 >> 5) & 1), 0)

    def test_la_percusion_cae_en_la_rejilla_del_bajo(self):
        S = self.S
        m = S.Musica(self.d, [VOCES[0], VOCES[1], PERCUSION])
        golpes, cambios, prev, ult = [], [], False, None
        for k in range(2560):
            per, vol, r7, _ = m.tic()
            p = m.c[0].periodo
            if p != ult:
                if ult is not None:
                    cambios.append(k)
                ult = p
            suena = (not (r7 >> 5) & 1) and vol[2] > 0
            if suena and not prev:
                golpes.append(k)
            prev = suena
        # El bajo cambia de nota SOLO en multiplos del compas.
        self.assertTrue(cambios)
        self.assertEqual({x % COMPAS for x in cambios}, {0})
        # Y la percusion repite patron en ese mismo compas.
        self.assertEqual(sorted({x % COMPAS for x in golpes}), GOLPES)
        # 8704 / 128 son 68 compases justos, sin resto.
        self.assertEqual(CUADROS % COMPAS, 0)
        self.assertEqual(CUADROS // COMPAS, 68)


@sin_cinta
class TestElMismoFalloEnLaParteDeAPie(unittest.TestCase):
    """El subsistema se duplico entero, y el byte se fue con el."""

    def setUp(self):
        self.n = open(os.path.join(WORK, "juego.raw"), "rb").read()
        self.p = open(os.path.join(WORK, "parte2.raw"), "rb").read()
        self.no, self.po = 0x47A0, 0x61D0

    def test_su_canal_2_recibe_otro_fin(self):
        self.assertEqual(self.p[APIE_VOCES[2] - self.po], 0x8B)

    def test_su_percusion_son_los_mismos_137_bytes(self):
        a = self.n[PERCUSION - self.no:PERCUSION - self.no + LARGO_VOZ]
        b = self.p[APIE_PERCUSION - self.po:APIE_PERCUSION - self.po + LARGO_VOZ]
        self.assertEqual(a, b)

    def test_tampoco_la_nombra_nadie(self):
        pal = bytes([APIE_PERCUSION & 0xFF, APIE_PERCUSION >> 8])
        self.assertEqual(self.p.count(pal), 0)

    def test_los_instrumentos_que_difieren_no_los_usa_esta_musica(self):
        # Cuatro instrumentos se retocaron al portar, y por eso hay que decir
        # que las dos musicas suenan igual: ninguno de los cuatro se usa aqui.
        distintos = {i for i in range(16)
                     if self.n[0xE5E2 - self.no + i * 15:0xE5E2 - self.no + i * 15 + 15]
                     != self.p[0xC8F7 - self.po + i * 15:0xC8F7 - self.po + i * 15 + 15]}
        self.assertEqual(distintos, {3, 4, 5, 7})
        import suena_tres_voces as S
        usados = set()
        vistos = set()

        def rec(a):
            while a not in vistos:
                vistos.add(a)
                b = self.n[a - self.no]
                if b < 0x80:
                    a += 1
                    continue
                n = S.ARG[b]
                arg = self.n[a - self.no + 1] if n else 0
                if b == 0x87:
                    usados.add(arg)
                if b == 0x8C:
                    rec(self.n[0xE7C1 - self.no + arg * 2] |
                        (self.n[0xE7C1 - self.no + arg * 2 + 1] << 8))
                if b in (0x8B, 0x8D, 0x82):
                    return
                a += 1 + n

        for v in (VOCES[0], VOCES[1], PERCUSION):
            vistos.clear()
            rec(v)
        self.assertEqual(usados, {8, 9, 10, 11, 12, 15})
        self.assertFalse(usados & distintos)


class TestLaWebNoMiente(unittest.TestCase):
    """Las cifras publicadas, buscadas en las dos paginas."""

    def paginas(self):
        return [os.path.join(DOCS, "FINDINGS.md"),
                os.path.join(DOCS, "es", "HALLAZGOS.md")]

    def test_las_cifras_estan_en_las_dos_paginas(self):
        for ruta in self.paginas():
            t = open(ruta, encoding="utf-8").read()
            for cifra in ("8,704" if "FINDINGS" in ruta else "8.704",
                          "137", "0xECCC", "0xECCB", "0xCFBF", "128"):
                self.assertIn(cifra, t, "falta %r en %s" % (cifra, ruta))

    def test_ya_no_dice_las_cifras_viejas(self):
        # Las dos que estaban mal: el bloque de "149 bytes" y las "24" llamadas.
        for ruta in self.paginas():
            t = open(ruta, encoding="utf-8").read()
            self.assertNotIn("149-byte block", t)
            self.assertNotIn("bloque de 149 bytes", t)

    def test_los_audios_que_enlaza_existen(self):
        import re
        for ruta in self.paginas():
            t = open(ruta, encoding="utf-8").read()
            base = os.path.dirname(ruta)
            for src in re.findall(r'<audio[^>]*src="([^"]+)"', t):
                self.assertTrue(os.path.exists(os.path.join(base, src)),
                                "%s enlaza %s y no existe" % (ruta, src))


if __name__ == "__main__":
    unittest.main()
