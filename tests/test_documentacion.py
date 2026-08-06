"""Comprueba que lo que dice la documentacion es lo que hace el juego.

Estos tests existen porque los datos publicados se desactualizan solos. Un
comentario que era cierto cuando se escribio sigue ahi cuando deja de serlo, y
la comprobacion de reproducibilidad no se entera de nada: los bytes no cambian,
solo lo que decimos de ellos.

Asi que aqui se cogen las afirmaciones CONCRETAS y se contrastan contra el
binario. Ninguno depende del binario de la version de Spectrum, que no se
distribuye con este repositorio: todo lo que se afirma tiene que poder
comprobarse con la cinta de MSX y nada mas.

Se saltan solos si no esta la cinta extraida, porque tampoco se distribuye.
"""
import json
import os
import re
import sys
import unittest

RAIZ = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
WORK = os.path.join(RAIZ, "work")
SRC = os.path.join(RAIZ, "src")
DOCS = os.path.join(RAIZ, "docs")
TOOLS = os.path.join(RAIZ, "tools")

# Los cinco bloques y lo que mide cada uno en la cinta.
MODULOS = {"topo": 4254, "loader": 351, "pre": 12468,
           "juego": 46663, "parte2": 29861}
DESCRIPTOR = 8          # el bloque [11]: ld ix,0x61D0 / ld de,0x74A5
BASIC = 256             # el cargador BASIC


def hay(*p):
    return os.path.exists(os.path.join(*p))


sin_juego = unittest.skipUnless(hay(WORK, "juego.raw"), "hace falta 'make extract' para esto")
sin_loader = unittest.skipUnless(hay(WORK, "loader.raw"), "hace falta 'make extract' para esto")
sin_pre = unittest.skipUnless(hay(WORK, "pre.raw"), "hace falta 'make extract' para esto")
sin_trazado = unittest.skipUnless(
    all(hay(WORK, m + ".trace.json") for m in MODULOS),
    "hace falta 'make trazado' para esto")


def leer(nombre):
    with open(os.path.join(WORK, nombre), "rb") as f:
        return f.read()


def trazado(modulo):
    with open(os.path.join(WORK, modulo + ".trace.json")) as f:
        return json.load(f)


def portada():
    """El modulo que genera la portada, para leerle las cifras que publica."""
    if TOOLS not in sys.path:
        sys.path.insert(0, TOOLS)
    import make_web
    return make_web


def juego(a, b=None):
    d = leer("juego.raw")
    return d[a - 0x47A0:(b - 0x47A0) if b else None]


class TestElCargadorTurbo(unittest.TestCase):
    """Publicamos que es una reimplementacion del cargador del ZX Spectrum."""

    @sin_loader
    def test_se_copia_a_la_pagina_1_y_salta_alli(self):
        d = leer("loader.raw")            # org 0xD2F0
        # d2f4: ld hl,0d33ah / ld de,04000h / ld bc,0012ch / ldir / jp 04000h
        self.assertEqual(d[0:2], b"\xF3\xCD")                 # di / call
        i = 0xD2F4 - 0xD2F0
        self.assertEqual(d[i], 0x21)                          # ld hl,nn
        self.assertEqual(d[i + 1] | (d[i + 2] << 8), 0xD33A)
        self.assertEqual(d[i + 3], 0x11)                      # ld de,nn
        self.assertEqual(d[i + 4] | (d[i + 5] << 8), 0x4000)
        self.assertEqual(d[i + 6], 0x01)                      # ld bc,nn
        self.assertEqual(d[i + 7] | (d[i + 8] << 8), 0x012C)  # 300 bytes

    @sin_loader
    def test_el_ldir_se_pasa_del_final_del_bloque(self):
        """Copia 300 bytes desde 0xD33A pero solo hay 277 hasta el final."""
        d = leer("loader.raw")
        disponibles = len(d) - (0xD33A - 0xD2F0)
        self.assertEqual(disponibles, 277)
        self.assertEqual(300 - disponibles, 23)


class TestElBuzonDePokes(unittest.TestCase):
    """La puerta trasera del cargador: 94 bytes con sitio para 30 parches."""

    def test_la_cuenta_de_los_94_bytes(self):
        # 3 de firma + 1 de contador + 30 parches de 3 bytes
        self.assertEqual(3 + 1 + 30 * 3, 94)

    @sin_loader
    def test_el_aplicador_esta_en_el_trozo_de_la_pagina_1(self):
        """En 0x4040: comprueba tres 0xC9 y luego aplica los parches."""
        d = leer("loader.raw")
        pag1 = d[0x4A:]                    # lo que se ejecuta en 0x4000
        i = 0x4040 - 0x4000
        self.assertEqual(pag1[i], 0x21)                          # ld hl,nn
        self.assertEqual(pag1[i + 1] | (pag1[i + 2] << 8), 0xFDE8)
        self.assertEqual(pag1[i + 3], 0x06)                      # ld b,n
        self.assertEqual(pag1[i + 4], 0x03)                      # tres
        self.assertEqual(pag1[i + 6], 0xFE)                      # cp n
        self.assertEqual(pag1[i + 7], 0xC9)                      # ...0xC9, un RET

    @sin_loader
    def test_el_cargador_salva_94_bytes_de_0xdac0_a_0xfde8(self):
        d = leer("loader.raw")
        pag1 = d[0x4A:]
        self.assertEqual(pag1[0], 0x21)                          # ld hl,nn
        self.assertEqual(pag1[1] | (pag1[2] << 8), 0xDAC0)
        self.assertEqual(pag1[3], 0x11)                          # ld de,nn
        self.assertEqual(pag1[4] | (pag1[5] << 8), 0xFDE8)
        self.assertEqual(pag1[6], 0x01)                          # ld bc,nn
        self.assertEqual(pag1[7] | (pag1[8] << 8), 94)

    @sin_juego
    def test_los_tres_pokes_de_la_revista_caen_donde_decimos(self):
        """Input MSX 19 parchea 0xC06E/6F y 0xF7B1. Sin parchear valen esto."""
        self.assertEqual(juego(0xC06E, 0xC070), b"\x38\x1F")     # jr c,+31
        self.assertEqual(juego(0xF7B0, 0xF7B2), b"\x3E\x01")     # ld a,1


class TestLaMulticarga(unittest.TestCase):
    """El juego trae su PROPIA rutina de carga, no usa la del cargador."""

    @sin_juego
    def test_enciende_el_motor_y_lee_el_bit_de_cinta(self):
        # f7f6: ld hl,0f89fh / push hl / push af
        # f7fb: ld a,008h / out (0abh),a   -> motor
        # f7ff: ld a,00eh / out (0a0h),a   -> registro 14 del PSG
        d = juego(0xF7F6, 0xF803)
        self.assertEqual(d[0], 0x21)                             # ld hl,nn
        self.assertEqual(d[1] | (d[2] << 8), 0xF89F)
        self.assertEqual(d[3], 0xE5)                             # push hl
        self.assertEqual(juego(0xF7FB, 0xF7FF), b"\x3E\x08\xD3\xAB")
        self.assertEqual(juego(0xF7FF, 0xF803), b"\x3E\x0E\xD3\xA0")

    @sin_juego
    def test_no_hay_ni_una_llamada_a_la_rutina_del_cargador(self):
        """0x405C sobrevive en la pagina 1, pero el juego no la llama."""
        d = leer("juego.raw")
        self.assertEqual(d.count(b"\xCD\x5C\x40"), 0)


class TestElMotorGrafico(unittest.TestCase):
    """El buffer de pantalla y como se vuelca."""

    @sin_juego
    def test_el_buffer_es_de_24_de_ancho_por_40_de_alto(self):
        """Los ejes, que estuvieron publicados al reves.

        El `ld b,028h` se conto como "40 columnas" y no lo es: es el bucle
        INTERIOR, que recorre el buffer a saltos de 24 (ld de,00018h) y por
        tanto recoge 40 bytes de UNA columna. El que cuenta columnas es el
        exterior, `ld c,018h`, que avanza el buffer de uno en uno 24 veces.
        De ahi salio ademas el ancho equivocado de los mapas de nivel.
        """
        # f3f2: ld de,04b40h / ld hl,01100h / ld b,028h
        d = juego(0xF3F2, 0xF3FA)
        self.assertEqual(d[0], 0x11)                             # ld de,nn
        self.assertEqual(d[1] | (d[2] << 8), 0x4B40)
        self.assertEqual(d[6], 0x06)                             # ld b,n
        self.assertEqual(d[7], 0x28)                             # 40 = el ALTO
        self.assertEqual(juego(0xF3FF, 0xF401), b"\x0E\x18")     # ld c,24 = el ANCHO
        # el paso del bucle interior es el ancho: por eso 24 es el eje rapido
        self.assertEqual(juego(0xF408, 0xF40B), b"\x11\x18\x00")  # ld de,00018h
        # y el buffer acaba justo donde dice la cuenta
        self.assertEqual(0x4B40 + 24 * 40, 0x4F00)

    @sin_juego
    def test_el_volcado_avanza_de_24_en_24(self):
        """Por eso el buffer esta organizado por columnas."""
        d = juego(0xF408, 0xF411)
        self.assertEqual(d[0], 0x11)                             # ld de,nn
        self.assertEqual(d[1] | (d[2] << 8), 0x0018)             # 24
        self.assertEqual(d[3], 0x7E)                             # ld a,(hl)
        self.assertEqual(d[4], 0xD3)                             # out (n),a
        self.assertEqual(d[5], 0x98)                             # el puerto del VDP
        self.assertEqual(d[6], 0x19)                             # add hl,de


class TestLosGraficos(unittest.TestCase):
    """Las geometrias publicadas tienen que cuadrar unas con otras."""

    def test_los_tiles_acaban_donde_empiezan_los_sprites(self):
        self.assertEqual(0x6DE0 + 111 * 128, 0xA560)

    def test_las_geometrias_dan_los_bytes_que_decimos(self):
        self.assertEqual(111 * 4 * 32, 14208)      # tiles 32x32, 4 bytes/linea
        self.assertEqual(83 * 4 * 16, 5312)        # sprites 16x16 con mascara
        self.assertEqual(59 * 1 * 8, 472)          # charset 8x8
        self.assertEqual(15 * 3 * 24, 1080)        # centinelas 24x24

    @sin_juego
    def test_las_cuatro_zonas_caben_en_el_bloque(self):
        d = leer("juego.raw")
        for ini, n, stride, alto in ((0x6DE0, 111, 4, 32), (0xA560, 83, 4, 16),
                                     (0x6000, 59, 1, 8), (0x69A8, 15, 3, 24)):
            self.assertLessEqual(ini - 0x47A0 + n * stride * alto, len(d))


class TestLaPantallaDeCarga(unittest.TestCase):
    """El bloque [09] es una pantalla de SCREEN 2 completa."""

    @sin_pre
    def test_vuelca_6144_de_patron_y_6144_de_color(self):
        d = leer("pre.raw")               # org 0x9B8C
        def en(a):
            return d[a - 0x9B8C:a - 0x9B8C + 8]
        # 9c16: ld hl,09c40h / ld bc,01800h
        self.assertEqual(en(0x9C16)[0], 0x21)
        self.assertEqual(en(0x9C16)[1] | (en(0x9C16)[2] << 8), 0x9C40)
        self.assertEqual(en(0x9C19)[0], 0x01)
        self.assertEqual(en(0x9C19)[1] | (en(0x9C19)[2] << 8), 0x1800)   # 6144
        # 9c25: ld hl,0b440h
        self.assertEqual(en(0x9C25)[1] | (en(0x9C25)[2] << 8), 0xB440)

    def test_las_dos_tablas_llenan_el_bloque_exacto(self):
        self.assertEqual(0x9C40 + 6144, 0xB440)
        self.assertEqual(0xB440 + 6144, 0xCC40)     # el final del bloque

    @sin_pre
    def test_el_vdp_se_programa_en_modo_screen_2(self):
        d = leer("pre.raw")
        regs = d[0x9BB6 - 0x9B8C:0x9BB6 - 0x9B8C + 8]
        # se escriben en los registros 7,6,5,4,3,2,1,0 en ese orden
        self.assertEqual(regs[7], 0x02)             # registro 0 = modo grafico 2

    @sin_pre
    def test_la_tabla_de_nombres_va_intercalada(self):
        """La rutina de 0x9BDB no la rellena en orden sino sumando ocho."""
        d = leer("pre.raw")
        i = 0x9BE8 - 0x9B8C
        self.assertEqual(d[i], 0xC6)                # add a,n
        self.assertEqual(d[i + 1], 0x08)            # ...ocho
        # y la secuencia que genera son 256 valores distintos por tercio
        seq, a = [], 0
        while True:
            seq.append(a)
            a += 8
            if a > 255:
                a = (a & 0xFF) + 1
                if a == 8:
                    break
        self.assertEqual(len(seq), 256)
        self.assertEqual(len(set(seq)), 256)
        self.assertEqual(seq[:4], [0, 8, 16, 24])


class TestLasCifrasQuePublicamos(unittest.TestCase):
    """Las cifras de la portada y de «Lo que falta», contra lo que miden las
    herramientas.

    Estos tests existen por un fallo real: la portada estuvo diciendo que la
    cobertura del bloque del juego era del 60,1 % cuando el trazado ya daba
    61,6 %. La cifra fue cierta y dejo de serlo al anadir puntos de entrada, y
    nada aviso, porque el binario reensamblaba igual de bien. Una cifra
    publicada a mano solo se mantiene honesta si algo la vuelve a medir.
    """

    @staticmethod
    def numero(texto):
        """'44.273' o '44,273' -> 44273."""
        return int(re.sub(r"[.,\s]", "", texto))

    def cifra(self, idioma, etiqueta):
        """Busca en la portada la cifra cuya etiqueta contiene <etiqueta>."""
        for valor, texto in portada().TXT[idioma]["cifras"]:
            if etiqueta in texto:
                return valor
        self.fail(f"no hay ninguna cifra con la etiqueta '{etiqueta}' en {idioma}")

    @sin_trazado
    def test_los_bytes_de_codigo_son_los_que_alcanza_el_trazador(self):
        codigo = sum(trazado(m)["report"]["code_bytes"] for m in MODULOS)
        self.assertEqual(self.numero(self.cifra("es", "bytes de código")), codigo)
        self.assertEqual(self.numero(self.cifra("en", "bytes of code")), codigo)

    @sin_trazado
    def test_los_bytes_de_datos_son_el_resto_de_la_cinta(self):
        codigo = sum(trazado(m)["report"]["code_bytes"] for m in MODULOS)
        datos = sum(MODULOS.values()) - codigo + DESCRIPTOR + BASIC
        self.assertEqual(self.numero(self.cifra("es", "bytes de datos")), datos)
        self.assertEqual(self.numero(self.cifra("en", "bytes of data")), datos)

    @sin_trazado
    def test_codigo_mas_datos_son_la_cinta_entera(self):
        """El 100 % de la portada tiene que cerrar con las otras dos cifras."""
        codigo = self.numero(self.cifra("es", "bytes de código"))
        datos = self.numero(self.cifra("es", "bytes de datos"))
        self.assertEqual(codigo + datos, portada().TOTAL)
        self.assertEqual(portada().TOTAL,
                         sum(MODULOS.values()) + DESCRIPTOR + BASIC)

    def test_las_rutinas_identificadas_son_las_declaradas_a_mano(self):
        """Rutinas identificadas = las que alguien ha nombrado, no las etiquetas.

        Esta cifra estuvo publicada como 1956, que era el numero de ETIQUETAS
        del trazador: todo destino de salto o llamada, incluidos los saltos
        internos de una misma rutina. En un tramo de 124 bytes hay cuatro. Una
        rutina identificada es otra cosa: la que aparece en un fichero .entries
        porque alguien ha averiguado que esta ahi y por que.
        """
        declaradas = 0
        for m in MODULOS:
            with open(os.path.join(SRC, m + ".entries"), encoding="utf-8") as f:
                for linea in f:
                    if re.match(r"0x[0-9A-Fa-f]{4}\s", linea.strip()):
                        declaradas += 1
        self.assertEqual(self.numero(self.cifra("es", "rutinas identificadas")),
                         declaradas)
        self.assertEqual(self.numero(self.cifra("en", "routines identified")),
                         declaradas)
        # Y tiene que ser MUY menor que el numero de etiquetas, o alguien ha
        # vuelto a confundir las dos cosas.
        if all(hay(WORK, m + ".trace.json") for m in MODULOS):
            etiquetas = sum(len(trazado(m)["entries"]) for m in MODULOS)
            self.assertLess(declaradas, etiquetas / 2)

    def test_los_bytes_sin_identificar_son_la_suma_de_sus_rangos(self):
        """La cifra publicada tiene que salir de sumar los rangos declarados."""
        total = 0
        rangos = 0
        for notas in ("juego.notes", "parte2.notes"):
            with open(os.path.join(SRC, notas), encoding="utf-8") as f:
                for linea in f:
                    m = re.match(r"D\s+0x([0-9A-Fa-f]+)\s+0x([0-9A-Fa-f]+)\s+"
                                 r"datos sin clasificar", linea)
                    if m:
                        total += int(m.group(2), 16) - int(m.group(1), 16)
                        rangos += 1
        self.assertGreater(rangos, 0, "no se ha leido ni un rango sin clasificar")
        self.assertEqual(total, portada().SIN_IDENTIFICAR)
        self.assertEqual(self.numero(self.cifra("es", "bytes sin identificar")),
                         total)
        self.assertEqual(self.numero(self.cifra("en", "bytes unidentified")),
                         total)

    @sin_trazado
    def test_la_cobertura_publicada_es_la_que_da_el_trazado(self):
        esperado = {"juego": trazado("juego")["report"]["coverage"],
                    "parte2": trazado("parte2")["report"]["coverage"]}
        # La pagina inglesa usa otros nombres de bloque y el punto decimal.
        for pagina, etiquetas, coma in (
                (os.path.join(DOCS, "WHATS-MISSING.md"),
                 {"ship game": "juego", "on-foot part": "parte2"}, "."),
                (os.path.join(DOCS, "es", "LO-QUE-FALTA.md"),
                 {"juego de naves": "juego", "parte de a pie": "parte2"}, ",")):
            with open(pagina, encoding="utf-8") as f:
                texto = f.read()
            for bloque, modulo in etiquetas.items():
                m = re.search(bloque + r"\s+([\d]+" + re.escape(coma) + r"[\d])\s*%",
                              texto)
                self.assertIsNotNone(
                    m, f"no aparece la cobertura de '{bloque}' en {pagina}")
                self.assertEqual(float(m.group(1).replace(",", ".")),
                                 round(esperado[modulo] * 100, 1),
                                 f"cobertura desactualizada en {pagina}")

    @sin_trazado
    def test_la_cobertura_del_hallazgo_de_la_portada_es_la_misma(self):
        """El hallazgo «una cobertura que era mentira» acaba dando la buena."""
        real = round(trazado("juego")["report"]["coverage"] * 100, 1)
        textos = {"es": f"{real:.1f}".replace(".", ",") + " %",
                  "en": f"{real:.1f}" + "%"}
        for idioma, aguja in textos.items():
            cuerpos = " ".join(c for _, c in portada().HALLAZGOS[idioma])
            self.assertIn(aguja, cuerpos,
                          f"la portada ({idioma}) no dice la cobertura real")

    @sin_trazado
    def test_los_saltos_indirectos_publicados_son_los_del_trazado(self):
        """Cuatro `jp (hl)` ciegos, y los cuatro con destino conocido.

        Fueron cinco. El quinto, en 0x984D, nunca se disparo -ni en 300 s de
        arnes, ni en el replay de 38 minutos, ni en una partida jugada hasta el
        final del juego- y resulto no ser un salto: es el byte 0xE9 de un dibujo
        tramado, al que el trazador llegaba desde un punto de entrada equivocado.
        Al declarar esos graficos como datos desaparecio solo.
        """
        ciegos = {m: len(trazado(m)["blind"]) for m in MODULOS}
        self.assertEqual(ciegos["juego"], 3)
        self.assertEqual(ciegos["parte2"], 1)
        total = sum(ciegos.values())
        self.assertEqual(total, 4)

        # Los resueltos son los despachadores cuyos destinos se anotaron
        # jugando; cada entrada dice de cual viene.
        despachadores = set()
        for entradas in ("juego.entries", "parte2.entries"):
            with open(os.path.join(SRC, entradas), encoding="utf-8") as f:
                for linea in f:
                    if linea.lstrip().startswith("#"):
                        continue
                    m = re.search(r"via jp \(hl\) de 0x([0-9A-Fa-f]{4})", linea)
                    if m:
                        despachadores.add(m.group(1).upper())
        self.assertEqual(despachadores, {"CB99", "D6B8", "C544"})

        palabras = {"es": {5: "cinco", 4: "cuatro", 3: "tres", 2: "dos", 1: "uno"},
                    "en": {5: "five", 4: "four", 3: "three", 2: "two", 1: "one"}}
        # Los resueltos son los tres despachadores mas el interprete de 0xE230.
        sin_resolver = total - len(despachadores) - 1
        self.assertEqual(sin_resolver, 0, "ha vuelto a aparecer un salto ciego"
                                          " sin destino conocido")
        for pagina, idioma in ((os.path.join(DOCS, "WHATS-MISSING.md"), "en"),
                               (os.path.join(DOCS, "es", "LO-QUE-FALTA.md"), "es")):
            with open(pagina, encoding="utf-8") as f:
                texto = f.read().lower()
            # el total y los del bloque del juego, dichos con todas las letras
            for n in (total, ciegos["juego"]):
                p = palabras[idioma][n]
                self.assertIn(p, texto, f"{pagina} no dice '{p}' ({n})")
            # y que la pagina diga que no queda ninguno pendiente
            cierre = "no queda ninguno" if idioma == "es" else "none is left"
            self.assertIn(cierre, texto,
                          f"{pagina} no dice que no quede ningun salto ciego")


class TestLaCoherenciaDelTrazado(unittest.TestCase):
    """La contradiccion que costo republicar el proyecto entero.

    41 de los 114 puntos de entrada del bloque del juego caian dentro de rangos
    que el propio proyecto declaraba como graficos. El trazador entraba a
    desensamblar dibujos y la cobertura pasaba de 24,6 % a 61,6 %, con todo lo
    demas en verde: el binario reensambla igual porque son los mismos bytes.
    """

    @staticmethod
    def zonas_de_datos(modulo):
        z = []
        rutas = [(os.path.join(SRC, modulo + ".notes"),
                  r"^D\s+0x([0-9A-Fa-f]+)\s+0x([0-9A-Fa-f]+)\s+(.*)$"),
                 (os.path.join(SRC, modulo + ".nocode"),
                  r"^0x([0-9A-Fa-f]+)\s+0x([0-9A-Fa-f]+)\s+(.*)$")]
        for ruta, patron in rutas:
            if not os.path.exists(ruta):
                continue
            with open(ruta, encoding="utf-8") as f:
                for linea in f:
                    if linea.lstrip().startswith("#"):
                        continue
                    m = re.match(patron, linea.strip())
                    if m:
                        z.append((int(m.group(1), 16), int(m.group(2), 16),
                                  m.group(3).strip()))
        return z

    @staticmethod
    def entradas(modulo):
        e = []
        with open(os.path.join(SRC, modulo + ".entries"), encoding="utf-8") as f:
            for linea in f:
                if linea.lstrip().startswith("#"):
                    continue
                m = re.match(r"0x([0-9A-Fa-f]{4})\s+(\S+)", linea.strip())
                if m:
                    e.append((int(m.group(1), 16), m.group(2)))
        return e

    def test_ningun_punto_de_entrada_cae_dentro_de_datos(self):
        for modulo in MODULOS:
            if not os.path.exists(os.path.join(SRC, modulo + ".entries")):
                continue
            zonas = self.zonas_de_datos(modulo)
            for a, nombre in self.entradas(modulo):
                for ini, fin, texto in zonas:
                    self.assertFalse(
                        ini <= a < fin,
                        f"{modulo}: la entrada 0x{a:04X} ({nombre}) cae dentro "
                        f"de 0x{ini:04X}-0x{fin:04X} «{texto[:40]}». O sobra la "
                        f"entrada, o sobra el rango: las dos no pueden ser.")

    def test_los_graficos_estan_declarados_como_no_codigo(self):
        """Faltaban en el .nocode, y esa ausencia es lo que dejo pasar el fallo."""
        with open(os.path.join(SRC, "juego.nocode"), encoding="utf-8") as f:
            texto = f.read()
        for ini, fin in ((0x6DE0, 0xA560), (0xA560, 0xBA20),
                         (0x6000, 0x61D8), (0x69A8, 0x6DE0)):
            self.assertIn(f"0x{ini:04X} 0x{fin:04X}", texto,
                          f"el rango 0x{ini:04X}-0x{fin:04X} no esta en el .nocode")


if __name__ == "__main__":
    unittest.main()
