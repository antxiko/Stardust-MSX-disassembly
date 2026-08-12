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
import io
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

    def interiores(self):
        """Cuantos puntos de entrada NO son cabecera de rutina.

        Lo calcula la misma herramienta que el Makefile, para que la cifra
        publicada y la comprobacion no puedan desviarse la una de la otra.
        """
        sys.path.insert(0, TOOLS)
        import check_interiores
        salida = io.StringIO()
        antes = sys.stdout
        sys.stdout = salida
        try:
            check_interiores.main(os.path.join(SRC, "stardust_juego.asm"),
                                  os.path.join(SRC, "juego.entries"),
                                  os.path.join(SRC, "stardust_parte2.asm"),
                                  os.path.join(SRC, "parte2.entries"))
        finally:
            sys.stdout = antes
        return sum(1 for l in salida.getvalue().splitlines()
                   if l.strip().startswith("INTERIOR"))

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
        """Rutinas identificadas = las que EMPIEZAN una rutina.

        Esta cifra estuvo publicada como 1956, que era el numero de ETIQUETAS
        del trazador: todo destino de salto o llamada, incluidos los saltos
        internos de una misma rutina. En un tramo de 124 bytes hay cuatro. Una
        rutina identificada es otra cosa: la que aparece en un fichero .entries
        porque alguien ha averiguado que esta ahi y por que.

        Y despues se colo la MISMA confusion en pequeno. Un .entries recoge
        tambien puntos MEDIDOS en el emulador -donde estuvo el contador de
        programa, donde salto un watchpoint-, y esos caen en mitad de una
        rutina: un watchpoint sobre el puerto 0x98 reporta el PC del `out`,
        que esta dentro del bucle de dibujado. Son evidencia util, pero no son
        rutinas, y contarlas volvia a inflar la cifra (164 declarados contra
        109 rutinas de verdad).

        Asi que la cifra publicada cuenta solo los puntos de entrada que de
        verdad EMPIEZAN algo, que es lo que dice contar. Los distingue
        tools/check_interiores.py: si a un punto se puede caer desde la
        instruccion de arriba, no es una cabecera.
        """
        declaradas = 0
        for m in MODULOS:
            with open(os.path.join(SRC, m + ".entries"), encoding="utf-8") as f:
                for linea in f:
                    if re.match(r"0x[0-9A-Fa-f]{4}\s", linea.strip()):
                        declaradas += 1
        rutinas = declaradas - self.interiores()
        self.assertEqual(self.numero(self.cifra("es", "rutinas identificadas")),
                         rutinas)
        self.assertEqual(self.numero(self.cifra("en", "routines identified")),
                         rutinas)
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
        # Desde el 2026-08-07 la cuenta buena es CERO: no queda ni un rango
        # "datos sin clasificar". El guard original exigia rangos > 0 para
        # detectar una regex rota; ahora eso solo se exige si la cifra
        # publicada dice que queda algo.
        if portada().SIN_IDENTIFICAR > 0:
            self.assertGreater(rangos, 0,
                               "no se ha leido ni un rango sin clasificar")
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


sin_parte2 = unittest.skipUnless(hay(WORK, "parte2.raw"),
                                 "hace falta 'make extract' para esto")


def parte2(a, b=None):
    d = leer("parte2.raw")
    return d[a - 0x61D0:(b - 0x61D0) if b else None]


class TestElSubsistemaDeSonido(unittest.TestCase):
    """Lo que se midio en el chip, comprobado aqui contra el binario.

    La medida en el emulador no se puede repetir en estos tests -haria falta
    openMSX y un replay que no se distribuye-, pero casi todo lo que dijo la
    medida deja huella en los bytes, y eso si se comprueba: la rutina que habla
    con el PSG, cuantos registros vuelca, que guion va a que canal y que la
    parte de a pie lleva el mismo subsistema reubicado.
    """

    # Lo que se midio: un unico PC escribiendo en el puerto 0xA1 durante todo
    # el sonido. En el binario hay DOS `out (0a1h),a`, y no se contradicen: el
    # otro no es de sonido, es de la rutina que lee el JOYSTICK, que escribe el
    # registro 7 para poder seleccionar el registro 14 y leerlo por 0xA2.
    @sin_juego
    def test_los_dos_sitios_que_escriben_en_el_psg(self):
        d = leer("juego.raw")
        sitios = []
        i = d.find(b"\xd3\xa1")
        while i >= 0:
            sitios.append(0x47A0 + i)
            i = d.find(b"\xd3\xa1", i + 1)
        self.assertEqual(sitios, [0xC1D1, 0xE5D9])

    @sin_juego
    def test_el_otro_out_es_el_lector_de_joystick(self):
        """0xC1D1 escribe el registro 7 para luego LEER el 14 por 0xA2."""
        self.assertEqual(juego(0xC1CB, 0xC1D9),
                         b"\x3e\x07\xd3\xa0\x3e\xff\xd3\xa1"
                         b"\x3e\x0e\xd3\xa0\xdb\xa2")

    @sin_juego
    def test_el_volcado_manda_once_registros(self):
        """El `ld d,00bh` es lo que explica los once contadores iguales."""
        self.assertEqual(juego(0xE5D0, 0xE5D4), b"\x3e\x00\x16\x0b")

    @sin_juego
    @sin_parte2
    def test_la_parte_de_a_pie_lleva_la_misma_rutina_reubicada(self):
        self.assertEqual(juego(0xE5D0, 0xE5E2), parte2(0xC8E5, 0xC8F7))
        self.assertEqual(0xE5D9 - 0xC8EE, 0x1CEB,
                         "el desplazamiento del codigo de sonido no es 0x1CEB")

    # Medido: arranca_musica instala las tres voces de golpe, una sola vez.
    @sin_juego
    def test_arranca_musica_instala_las_tres_voces(self):
        d = juego(0xE16F, 0xE187)
        for canal, guion in enumerate((0xEB52, 0xEC4A, 0xECCB)):
            aguja = bytes((0x11, guion & 0xFF, guion >> 8))
            self.assertIn(aguja, d,
                          "arranca_musica no carga 0x%04X para el canal %d"
                          % (guion, canal))

    @sin_juego
    def test_la_tercera_voz_entra_callada(self):
        """0xECCB es un 0x8B suelto: el canal 2 se calla al primer cuadro."""
        self.assertEqual(juego(0xECCB, 0xECCC), b"\x8b")

    # Medido: el 100 % de los tonos de la musica limpia estan en la tabla.
    @sin_juego
    def test_la_tabla_de_notas_son_ocho_octavas_justas(self):
        d = juego(0xE6E3, 0xE7A3)
        p = [d[i * 2] | (d[i * 2 + 1] << 8) for i in range(96)]
        self.assertEqual(len(p), 96)
        # OJO CON EL CRITERIO: la cifra publicada, 76 de 84, sale con un margen
        # del 1 % —el mismo que usa tools/lee_musica.py—, no con la razon
        # exacta. Exactamente el doble solo lo son 43: el periodo es un entero
        # y arriba, donde vale dos cifras, el redondeo ya no da para mas.
        buenas = sum(1 for i in range(84)
                     if abs(p[i] / float(p[i + 12]) - 2.0) < 0.02)
        self.assertEqual(buenas, 76)
        exactas = sum(1 for i in range(84) if p[i] == 2 * p[i + 12])
        self.assertEqual(exactas, 43)
        # Y los que fallan son los agudos, no unos cualesquiera.
        fallan = [i for i in range(84)
                  if abs(p[i] / float(p[i + 12]) - 2.0) >= 0.02]
        self.assertEqual(len(fallan), 8)
        self.assertGreater(min(fallan), 55)

    @sin_juego
    @sin_parte2
    def test_las_dos_partes_comparten_la_tabla_de_notas(self):
        self.assertEqual(juego(0xE6E3, 0xE7A3), parte2(0xC9FE, 0xCABE))

    @sin_juego
    @sin_parte2
    def test_la_tabla_de_frases_se_reubico_entera(self):
        """Los 20 punteros son los del juego de naves menos 0x1CE5, todos."""
        n = juego(0xE7C1, 0xE7E9)
        a = parte2(0xE7C1 - 0x1CE5, 0xE7E9 - 0x1CE5)
        for i in range(20):
            self.assertEqual((n[i * 2] | (n[i * 2 + 1] << 8))
                             - (a[i * 2] | (a[i * 2 + 1] << 8)), 0x1CE5,
                             "la frase %d no se reubico 0x1CE5" % i)


class TestLaRutinaDeLaMulticarga(unittest.TestCase):
    """La carga de la segunda parte, que estuvo publicada como contradiccion.

    Lo que se midio -84441 muestras del PC, todas dentro de 0xF7F6-0xF89E, con
    IX recorriendo 0x61D0-0xD674- no se puede repetir aqui sin emulador. Pero la
    rutina esta en los bytes, y su parentesco con la LD-BYTES del Spectrum
    tambien, asi que eso si se comprueba.
    """

    @sin_juego
    def test_empuja_a_mano_su_direccion_de_vuelta(self):
        """El 0xF89F que aparecia en la pila lo pone este `push hl`."""
        self.assertEqual(juego(0xF7F6, 0xF7FA), b"\x21\x9f\xf8\xe5")

    @sin_juego
    def test_enciende_el_motor_y_elige_el_registro_del_bit_de_cinta(self):
        self.assertEqual(juego(0xF7FA, 0xF804),
                         b"\xf5\x3e\x08\xd3\xab\x3e\x0e\xd3\xa0\xf1")

    @sin_juego
    def test_es_la_ld_bytes_del_spectrum(self):
        """`inc d / ex af,af' / dec d / di` abre la LD-BYTES de la ROM del
        Spectrum, y 0x0415 es su constante de temporizacion."""
        self.assertEqual(juego(0xF804, 0xF808), b"\x14\x08\x15\xf3")
        self.assertEqual(juego(0xF811, 0xF814), b"\x21\x15\x04")

    @sin_juego
    def test_guarda_cada_byte_por_ix(self):
        """El watchpoint reportaba PC=0xF849 porque la instruccion empieza en
        0xF848: los puntos de observacion caen dentro de la instruccion."""
        self.assertEqual(juego(0xF848, 0xF84B), b"\xdd\x75\x00")

    @sin_juego
    def test_lee_el_bit_de_cinta_por_el_psg(self):
        self.assertEqual(juego(0xF887, 0xF88D), b"\xdb\xa2\x2f\xa9\xe6\x80")

    @sin_juego
    def test_parpadea_el_borde_por_el_vdp(self):
        """Donde el Spectrum escribia en su puerto 0xFE, este usa el VDP."""
        self.assertEqual(juego(0xF893, 0xF89D),
                         b"\xed\x5f\xe6\x0f\xd3\x99\x3e\x87\xd3\x99")

    @sin_juego
    def test_el_destino_llena_el_bloque_exacto(self):
        """IX fue de 0x61D0 a 0xD674, que es el ultimo byte de los 29861."""
        self.assertEqual(0x61D0 + 29861 - 1, 0xD674)


class TestElSonidoDeLaParteDeAPie(unittest.TestCase):
    """El subsistema portado, y los DOS desplazamientos que lo mueven.

    Lo importante que amarra esto: que las tablas viajan a -0x1CE5 y los
    guiones a -0x1D0D, con cuarenta bytes de diferencia. Confundir los dos
    manda a leer musica donde no la hay.
    """

    TABLAS = 0x1CE5
    GUIONES = 0x1D0D

    @sin_juego
    @sin_parte2
    def test_los_dos_desplazamientos_se_llevan_cuarenta_bytes(self):
        self.assertEqual(self.GUIONES - self.TABLAS, 0x28)

    @sin_juego
    @sin_parte2
    def test_el_volcado_al_psg_viaja_a_su_propio_desplazamiento(self):
        self.assertEqual(juego(0xE5D0, 0xE5E2), parte2(0xC8E5, 0xC8F7))

    @sin_juego
    @sin_parte2
    def test_arranca_musica_instala_las_tres_voces_reubicadas(self):
        """0xC483 es la homologa de 0xE16F, con sus voces a -0x1D0D."""
        d = parte2(0xC483, 0xC49B)
        for guion in (0xEB52, 0xEC4A, 0xECCB):
            v = guion - self.GUIONES
            self.assertIn(bytes((0x11, v & 0xFF, v >> 8)), d,
                          "0xC483 no carga 0x%04X" % v)

    @sin_juego
    @sin_parte2
    def test_la_tercera_voz_muda_se_porto_tal_cual(self):
        self.assertEqual(parte2(0xCFBE, 0xCFBF), b"\x8b")
        self.assertEqual(juego(0xECCB, 0xECCC), parte2(0xCFBE, 0xCFBF))

    @sin_parte2
    def test_hay_una_segunda_musica_con_tres_voces_de_verdad(self):
        """0xB3CB instala otras tres, y esas si traen contenido."""
        d = parte2(0xB3CB, 0xB3E3)
        for guion in (0xCDB1, 0xCDD0, 0xCDEC):
            self.assertIn(bytes((0x11, guion & 0xFF, guion >> 8)), d)
        for guion in (0xCDB1, 0xCDD0, 0xCDEC):
            self.assertNotEqual(parte2(guion, guion + 1), b"\x8b",
                                "0x%04X no deberia ser un terminador" % guion)

    @sin_parte2
    def test_los_tres_estados_de_canal_caben_donde_decimos(self):
        """0xD068 + 3*46 = 0xD0F2, y ahi siguen las variables globales."""
        self.assertEqual(0xD068 + 3 * 0x2E, 0xD0F2)


class TestElBloqueDeMusicaSinDueno(unittest.TestCase):
    """Los 149 bytes de 0xECCC: nadie los nombra.

    Se afirma con cuidado: lo que se comprueba es que no hay REFERENCIA
    LITERAL. Una direccion montada a mano se escaparia de esta busqueda, asi
    que el test no dice que el bloque sea inalcanzable.
    """

    @staticmethod
    def _apariciones(d, valor):
        aguja = bytes((valor & 0xFF, valor >> 8))
        return sum(1 for i in range(len(d) - 1) if d[i:i + 2] == aguja)

    @sin_juego
    @sin_parte2
    @sin_pre
    def test_nadie_nombra_0xeccc(self):
        for m in ("juego", "parte2", "pre"):
            self.assertEqual(self._apariciones(leer(m + ".raw"), 0xECCC), 0,
                             "0xECCC aparece en el bloque %s" % m)

    @sin_juego
    def test_el_control_de_esa_busqueda(self):
        """Si la busqueda valiera para todo, sus vecinos tampoco apareceran; y
        aparecen, asi que el cero de arriba significa algo."""
        d = leer("juego.raw")
        self.assertEqual(self._apariciones(d, 0xECCB), 1)   # arranca_musica
        self.assertGreaterEqual(self._apariciones(d, 0xED61), 1)
        self.assertGreaterEqual(self._apariciones(d, 0xED6B), 1)

    @sin_juego
    def test_ninguna_frase_apunta_tan_arriba(self):
        """La mas alta de las veinte es 0xEA38 clavada, muy por debajo del
        bloque; asi que no se llega ahi por una llamada a frase."""
        d = juego(0xE7C1, 0xE7E9)
        destinos = [d[i * 2] | (d[i * 2 + 1] << 8) for i in range(20)]
        self.assertEqual(max(destinos), 0xEA38)
        self.assertLess(max(destinos), 0xECCB)

    @sin_juego
    def test_los_754_bytes_de_0xab0e_no_son_una_partitura(self):
        """La afirmacion retirada, cerrada por segunda via: ahi hay valores por
        encima de 0x7F que no existen como comandos del lenguaje."""
        validos = set(range(0x80, 0x8F))
        def imposibles(a):
            return sum(1 for b in juego(a, a + 754) if b >= 0x80 and b not in validos)
        self.assertGreater(imposibles(0xAB0E), 250)
        self.assertLess(imposibles(0xE7E9), 20)


class TestElRitmoDeLaMusicaDeAPie(unittest.TestCase):
    """El interprete de la fase de a pie, y el jingle de partida."""

    @sin_juego
    @sin_parte2
    def test_el_interprete_es_el_de_naves_reubicado(self):
        """0xC517 y 0xE203 solo se diferencian en el operando reubicado."""
        n, a = juego(0xE203, 0xE21B), parte2(0xC517, 0xC52F)
        iguales = sum(1 for x, y in zip(n, a) if x == y)
        self.assertGreaterEqual(iguales, 18)
        self.assertEqual(juego(0xE207, 0xE20A), b"\x32\x19\xee")
        self.assertEqual(parte2(0xC51B, 0xC51E), b"\x32\x0c\xd1")

    @sin_parte2
    def test_las_tres_voces_del_jingle_terminan(self):
        """Acaban en 0x8B: por eso es un jingle y no una banda sonora. Se
        recorren con el mismo lector que el resto de la musica."""
        if TOOLS not in sys.path:
            sys.path.insert(0, TOOLS)
        import lee_musica
        viejo = (lee_musica.ORG, lee_musica.NOTAS, lee_musica.FRASES,
                 lee_musica.FIN)
        lee_musica.ORG, lee_musica.NOTAS = 0x61D0, 0xC9FE
        lee_musica.FRASES, lee_musica.FIN = 0xCADC, 0xD068
        try:
            d = leer("parte2.raw")
            for guion in (0xCDB1, 0xCDD0, 0xCDEC):
                _, _, term = lee_musica.bloque(d, guion)
                self.assertEqual(term, 0x8B,
                                 "0x%04X no acaba en 0x8B" % guion)
        finally:
            (lee_musica.ORG, lee_musica.NOTAS, lee_musica.FRASES,
             lee_musica.FIN) = viejo


class TestQueNingunDatoSeLeaComoCodigo(unittest.TestCase):
    """El cruce completo, colgado del test para que no se pueda olvidar.

    check_trace.py mira las zonas del .nocode, que son un punado. Esto mira las
    NOVENTA Y CUATRO zonas declaradas con directivas D. La diferencia no es
    academica: una semilla en 0xCC3E hacia leer 1318 de los 1380 bytes de la
    musica de la fase de a pie como codigo, y check_trace daba verde.
    """

    @sin_trazado
    def test_ninguna_zona_declarada_como_datos_sale_como_codigo(self):
        if TOOLS not in sys.path:
            sys.path.insert(0, TOOLS)
        import check_datos_como_codigo as chk
        salida = io.StringIO()
        antes = sys.stdout
        sys.stdout = salida
        try:
            rc = chk.main(WORK, SRC)
        finally:
            sys.stdout = antes
        self.assertEqual(rc, 0, salida.getvalue())
        self.assertIn("OK:", salida.getvalue())

    @sin_trazado
    def test_la_musica_de_a_pie_no_es_codigo(self):
        """La zona concreta que estuvo mal, vigilada por su nombre."""
        cod = [(a, b) for t, a, b in trazado("parte2")["blocks"] if t == "c"]
        dentro = sum(min(b, 0xD068) - max(a, 0xCB04)
                     for a, b in cod if min(b, 0xD068) > max(a, 0xCB04))
        self.assertEqual(dentro, 0)


class TestLaFirmaDelCorrimiento(unittest.TestCase):
    """Un RELLENO corto pegado justo delante de un punto de entrada.

    Es la firma de un punto de entrada declarado unos bytes mas alla del
    principio real de la rutina. Cuando pasa, los bytes de delante se quedan
    huerfanos y alguien los declara como "relleno o resto" para que cuadre el
    presupuesto, y ahi queda el rastro. Ha cazado dos errores reales:

      0xC865 -> 0xC864  (1 B)  el manejador del comando 0x8C del sonido; su
                               breakpoint no saltaba NUNCA porque los bp solo
                               disparan donde EMPIEZA la instruccion
      0xC193 -> 0xC190  (3 B)  un estado encadenado de entidad, que 0xD201
                               instala en (ix+003h/004h)

    Solo mira zonas cortas y descritas como relleno: una zona corta con
    explicacion de verdad -los cuatro colores de la fase, pegados al epilogo de
    la interrupcion- es legitima y no debe saltar.
    """

    @sin_juego
    def test_ningun_relleno_corto_pegado_a_un_punto_de_entrada(self):
        sospechosos = []
        for mod in MODULOS:
            fe = os.path.join(SRC, mod + ".entries")
            fn = os.path.join(SRC, mod + ".notes")
            if not (os.path.exists(fe) and os.path.exists(fn)):
                continue
            entradas = set()
            for linea in open(fe, encoding="utf-8"):
                m = re.match(r"\s*0x([0-9A-Fa-f]{4})\s", linea)
                if m:
                    entradas.add(int(m.group(1), 16))
            for linea in open(fn, encoding="utf-8"):
                m = re.match(r"D 0x([0-9A-Fa-f]{4}) 0x([0-9A-Fa-f]{4})\s*(.*)",
                             linea)
                if not m:
                    continue
                ini, fin, desc = (int(m.group(1), 16), int(m.group(2), 16),
                                  m.group(3).lower())
                if fin - ini > 4:
                    continue
                if "relleno" not in desc and "resto" not in desc:
                    continue
                if fin in entradas:
                    sospechosos.append("%s 0x%04X-0x%04X (%d B) pegado a 0x%04X"
                                       % (mod, ini, fin - 1, fin - ini, fin))
        self.assertEqual(sospechosos, [], "\n".join(sospechosos))


class TestElDetectorDeInteriores(unittest.TestCase):
    """El guardian que cuenta las rutinas, comprobado el mismo.

    check_interiores.py decide si un punto de entrada es una cabecera o cae
    dentro de otra rutina, y de esa decision sale la cifra de "rutinas
    identificadas" que se publica. O sea que si el detector se equivoca, la
    web miente sin que nadie se entere.

    Y se equivocaba. Miraba el PREFIJO del destino del salto -un digito
    hexadecimal, una L, un guion bajo, un parentesis-, asi que en cuanto una
    rutina recibia nombre y el listado pasaba a decir `jp pinta_marca_hud`, el
    salto dejaba de contar como corte de flujo y lo de debajo salia como
    etiqueta interior. Lo castigado era justo el trabajo de comentar: cada
    rutina nombrada podia restar una al recuento.

    Estos son los casos que lo cazan.
    """

    @staticmethod
    def corta(instruccion):
        sys.path.insert(0, TOOLS)
        import check_interiores
        return check_interiores.corta_el_flujo(instruccion)

    def test_un_salto_a_una_rutina_con_nombre_corta_el_flujo(self):
        """El fallo que hizo falta arreglar para poder seguir comentando."""
        for destino in ("pinta_marca_hud", "premia", "azar", "carga_cinta",
                        "suma_puntos", "0bd85h", "L_C47B", "lcb9dh", "(hl)"):
            self.assertTrue(self.corta("jp " + destino),
                            "jp %s deberia cortar el flujo" % destino)

    def test_un_salto_condicional_no_corta_el_flujo(self):
        """Y esto es lo que no puede romperse al arreglar lo anterior."""
        for cond in ("nz", "z", "nc", "c", "po", "pe", "p", "m"):
            self.assertFalse(self.corta("jp %s,0bd85h" % cond))
            self.assertFalse(self.corta("jr %s,L_C47B" % cond))

    def test_las_condiciones_no_se_confunden_con_los_nombres(self):
        """`jp p,` es condicional; `jp premia` no, y empieza igual."""
        self.assertFalse(self.corta("jp p,0c000h"))
        self.assertTrue(self.corta("jp premia"))
        self.assertFalse(self.corta("jp c,0c000h"))
        self.assertTrue(self.corta("jp creditos"))
        self.assertFalse(self.corta("jp m,0c000h"))
        self.assertTrue(self.corta("jp mueve_estrellas"))

    def test_un_ret_condicional_no_corta_el_flujo(self):
        """El otro agujero: `^ret` casaba tambien con `ret nz`."""
        self.assertTrue(self.corta("ret"))
        self.assertTrue(self.corta("reti"))
        self.assertTrue(self.corta("retn"))
        for cond in ("nz", "z", "nc", "c", "po", "pe", "p", "m"):
            self.assertFalse(self.corta("ret " + cond))

    def test_lo_que_no_corta_nunca(self):
        for instr in ("call 0bd85h", "djnz L_C47B", "ld a,001h", "nop",
                      "add hl,de", "push af"):
            self.assertFalse(self.corta(instr))


class TestLaCifraDeRutinasComentadas(unittest.TestCase):
    """«Lo que falta» publica cuantas rutinas llevan comentario. Que no envejezca.

    Es la misma precaucion que ya se tomo con las cifras de la portada, y por
    el mismo motivo: una cifra escrita a mano deja de ser cierta en cuanto
    alguien comenta una rutina mas, y nada avisa, porque el binario reensambla
    igual de bien.
    """

    @staticmethod
    def medido():
        sys.path.insert(0, TOOLS)
        import rutinas_comentadas
        total, comentadas = 0, 0
        for mod in ("juego", "parte2"):
            rut = rutinas_comentadas.rutinas(
                os.path.join(SRC, "stardust_%s.asm" % mod),
                os.path.join(SRC, "%s.entries" % mod))
            anot = rutinas_comentadas.anotadas(
                os.path.join(SRC, "%s.notes" % mod))
            total += len(rut)
            comentadas += sum(1 for d in rut if d in anot)
        return total, comentadas

    @staticmethod
    def cifras_de(pagina):
        """Las parejas (rutinas, comentadas) del recuadro de la pagina."""
        with open(os.path.join(DOCS, pagina), encoding="utf-8") as f:
            texto = f.read()
        return [(int(a), int(b)) for a, b in
                re.findall(r"(\d+)\s+(?:rutinas|routines),\s+(\d+)\s+"
                           r"(?:comentadas|commented)", texto)]

    def test_las_dos_paginas_dicen_lo_que_miden_las_herramientas(self):
        total, comentadas = self.medido()
        for pagina in ("es/LO-QUE-FALTA.md", "WHATS-MISSING.md"):
            filas = self.cifras_de(pagina)
            self.assertEqual(len(filas), 3,
                             "%s: se esperaban tres filas (naves, a pie, total)"
                             % pagina)
            naves, apie, tot = filas
            self.assertEqual(tot, (total, comentadas), pagina)
            self.assertEqual(naves[0] + apie[0], tot[0], pagina)
            self.assertEqual(naves[1] + apie[1], tot[1], pagina)

    def test_las_que_quedan_cuadran_con_el_total(self):
        """El '180 que quedan' del texto tiene que ser total - comentadas."""
        total, comentadas = self.medido()
        quedan = total - comentadas
        for pagina, patron in (("es/LO-QUE-FALTA.md", r"quedan (\d+) sin comentar"),
                               ("es/LO-QUE-FALTA.md", r"Comentar las (\d+) rutinas"),
                               ("WHATS-MISSING.md", r"\*\*(\d+) are left\*\*"),
                               ("WHATS-MISSING.md", r"Commenting the (\d+) routines")):
            with open(os.path.join(DOCS, pagina), encoding="utf-8") as f:
                m = re.search(patron, f.read())
            self.assertIsNotNone(m, "%s: no aparece '%s'" % (pagina, patron))
            self.assertEqual(int(m.group(1)), quedan, "%s / %s" % (pagina, patron))
