#!/usr/bin/env python3
"""Genera la portada de la web, en los dos idiomas.

El diseno es el compartido por la serie (tools/estilo_web.py) y la pagina sale
autocontenida, con las imagenes embebidas.

Una nota sobre las cifras: mientras el trabajo estuvo a medias, la portada
llevo un aviso antes de ellas. Al cerrarse los siete criterios el usuario lo
quito (2026-08-12): lo que significa cada cifra —y lo que no— se cuenta en la
pagina de Preguntas abiertas, no en un cartel.

Uso: make_web.py <work/juego.raw> <docs/imagenes> <salida.html> <idioma>
"""
import base64
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from estilo_web import ESTILO                      # noqa: E402

TOTAL = 93861
SIN_IDENTIFICAR = 0

TXT = {
    "es": dict(
        titulo="Stardust (1987) — desensamblado comentado",
        claim="Una cinta de cassette de 1987, desmontada bloque a bloque. Y por "
              "dentro es una conversión del ZX Spectrum que se trajo hasta el "
              "sistema de grabación, no solo los gráficos.",
        ficha=["Topo Soft · <b>1987</b>", "Conversión del <b>ZX Spectrum</b>",
               "Carga de cinta <b>multicarga</b>", "MSX1 · <b>64K</b>"],
        nav=[("#numbers", "Las cifras"), ("#findings", "Hallazgos"),
             ("#screens", "Los gráficos"), ("#method", "Cómo se hizo")],
        docnav=[("EMPEZAR.html", "Empezar"), ("EL-JUEGO.html", "El juego"),
                ("LA-CINTA.html", "La cinta"), ("EL-CODIGO.html", "El código"),
                ("HALLAZGOS.html", "Hallazgos"),
                ("PREGUNTAS-ABIERTAS.html", "Preguntas abiertas")],
        otro=("../", "In English"),
        h_num="El juego en cifras", h_find="Lo que apareció al desmontarlo",
        h_scr="Los gráficos", h_met="Cómo se hizo",
        cifras=[("100%", "del binario con dueño"), ("106", "rutinas identificadas"),
                ("7+1", "zonas de naves, y una a pie"), ("20.076", "bytes de código"),
                ("73.785", "bytes de datos"), ("0", "bytes sin identificar")],
        nota_scr="Nada de lo que ves aquí es una captura de pantalla: está "
                 "dibujado a partir de los propios datos del binario, con la "
                 "misma geometría que usa el juego. Y eso lo convierte en una "
                 "comprobación además de una ilustración, porque si el reparto "
                 "del bloque estuviera mal, lo que saldría es ruido, no una "
                 "tilería reconocible.",
        pie_gracias="Gracias a Araubi. Su grabación de una partida completa en "
                    "el emulador es lo que ha permitido trazar el código de las "
                    "pantallas a las que una partida automática no llega nunca, "
                    "y llegar hasta la segunda parte del juego. Buena parte de "
                    "lo que cuenta esta página sale de ahí.",
        pie_leg="Esto es trabajo de documentación y preservación sobre un juego "
                "de 1987: el código y los gráficos siguen siendo de sus autores "
                "y de Topo Soft, y la imagen de la cinta no se distribuye. Parte "
                "del análisis se apoya en el desensamblado de la versión de ZX "
                "Spectrum que publicaron sus autores originales; los detalles "
                "están en el aviso legal.",
    ),
    "en": dict(
        titulo="Stardust (1987) — a commented disassembly",
        claim="A 1987 cassette tape, taken apart block by block. Inside, it's a "
              "ZX Spectrum conversion that brought the tape system across with "
              "it, not just the graphics.",
        ficha=["Topo Soft · <b>1987</b>", "A <b>ZX Spectrum</b> conversion",
               "<b>Multiload</b> from tape", "MSX1 · <b>64K</b>"],
        nav=[("#numbers", "The numbers"), ("#findings", "What turned up"),
             ("#screens", "The graphics"), ("#method", "How it was done")],
        docnav=[("GETTING-STARTED.html", "Getting started"),
                ("THE-GAME.html", "The game"),
                ("THE-TAPE.html", "The tape"), ("THE-CODE.html", "The code"),
                ("FINDINGS.html", "Findings"),
                ("OPEN-QUESTIONS.html", "Open questions")],
        otro=("es/", "En castellano"),
        h_num="The game in numbers", h_find="What turned up when we took it apart",
        h_scr="The graphics", h_met="How it was done",
        cifras=[("100%", "of the binary owned"), ("106", "routines identified"),
                ("7+1", "ship zones, plus one on foot"), ("20,076", "bytes of code"),
                ("73,785", "bytes of data"), ("0", "bytes unidentified")],
        nota_scr="None of this is a screen capture: it's drawn straight from the "
                 "binary's own data, using the same geometry the game itself "
                 "uses. Which makes it a check as much as an illustration, "
                 "because if the block's layout were wrong, what would come out "
                 "is noise, not a recognisable tileset.",
        pie_gracias="Thanks to Araubi. Their recording of a complete playthrough "
                    "in the emulator is what made it possible to trace the code "
                    "behind the screens a scripted run never reaches, and to get "
                    "all the way to the second part of the game. A good deal of "
                    "what this page tells comes from it.",
        pie_leg="This is documentation and preservation work on a 1987 game: the "
                "code and artwork still belong to their authors and to Topo "
                "Soft, and the tape image isn't distributed. Part of the "
                "analysis leans on the ZX Spectrum disassembly published by its "
                "original authors; the details are in the legal notice.",
    ),
}

HALLAZGOS = {
    "es": [
        ("La cinta no es una cinta de MSX",
         "<p>Un juego de MSX se graba en bloques KCS, que es el formato del "
         "sistema. Stardust no: sus cuatro bloques de datos son bloques del "
         "ZX Spectrum, con su bandera, sus datos y un XOR de comprobación al "
         "final, y los cuatro lo traen correcto.</p>"
         "<p>Y el cargador tampoco es de aquí: es una reimplementación de "
         "LD-BYTES, la rutina de carga de la ROM del Spectrum, con su mismo "
         "interfaz de registros.</p>"),
        ("El cargador trae una puerta trasera para trainers",
         "<p>Antes de arrancar el juego, el cargador salva 94 bytes a memoria "
         "alta y les echa un vistazo: si empiezan por tres <code>0xC9</code>, "
         "los toma por una lista de parches y los aplica sobre el juego que "
         "acaba de cargar, dirección y valor, uno detrás de otro.</p>"
         "<p>Y la cuenta cuadra sola: tres bytes de firma, uno de contador y "
         "treinta parches de tres bytes, noventa y cuatro en total. Está "
         "pensado para treinta pokes exactos, que es justo lo que usaban los "
         "cargadores de las revistas de la época.</p>"),
        ("Dos juegos en una cinta",
         "<p>Al superar la última zona de naves, el juego vuelve al cassette a "
         "por una segunda parte en la que el protagonista sigue a pie. Y no "
         "usa la rutina del cargador para eso, aunque sigue viva en memoria: "
         "trae la suya, que enciende el motor de la cinta y lee el bit de "
         "datos por el chip de sonido.</p>"
         "<p>Los dos programas ni siquiera comparten motor. En la primera "
         "parte cada objeto lleva una estructura de 8 bytes con la rutina que "
         "lo gobierna apuntada dentro; en la segunda, los enemigos viven en "
         "tablas ligeras de 5 bytes que mueven bucles fijos —cuatro andantes "
         "como mucho, y los voladores aparte—. Sí hay objetos de 46 bytes en "
         "la segunda parte, pero no son enemigos: son los tres canales del "
         "intérprete de sonido.</p>"),
        ("Lo que el MSX obligó a cambiar",
         "<p>El Spectrum escribe directamente en su memoria de pantalla, que "
         "es RAM normal. En el MSX la memoria de vídeo está detrás del chip "
         "gráfico, así que hay que mandársela por un puerto, byte a byte.</p>"
         "<p>Por eso esta versión carga con un buffer de pantalla que el "
         "original no necesita: 3840 bytes en 0x4000-0x4EFF, de 24 de ancho "
         "por 160 de alto, que el volcado envía a la VRAM en tres bandas, "
         "columna a columna. Veinticuatro bytes son 192 píxeles, más estrecho "
         "que la pantalla, y por eso el marco de los lados no se mueve nunca: "
         "lo que sobra está a lo alto, que es justo por donde scrollea.</p>"
         "<p>Y esos ejes son fáciles de leer al revés. El <code>ld b,028h</code> "
         "del volcado parece decir «40 columnas», pero es el bucle interior, "
         "el que recoge 40 bytes de una misma columna a saltos de 24. Lo caza "
         "dibujarlo: partido de 24 en 24 sale la tabla de récords, legible; "
         "de 40 en 40, ruido.</p>"),
        ("Sprites dibujados a mano",
         "<p>El MSX tiene sprites por hardware, pero aquí no se usan: se "
         "dibujan por software, a la manera del Spectrum, desplazando el "
         "dibujo bit a bit y componiéndolo con AND y OR.</p>"
         "<p>Las dos partes del juego llevan la misma rutina para eso, "
         "copiada y reubicada de una a otra. El pintor de sprites mide 198 "
         "bytes, y si emparejas bien sus dos mitades las únicas diferencias "
         "son diez direcciones reubicadas y un solo byte suelto, el del "
         "recorte por abajo.</p>"),
        ("Ningún punto de entrada cae dentro de un gráfico",
         "<p>Sembrar el trazador con rutinas mal ancladas puede hinchar la "
         "cobertura de golpe sin que nadie lo note: el binario reensambla "
         "igual, porque son los mismos bytes y solo cambia cómo se leen; el "
         "presupuesto cierra igual; y una comprobación de trazado que solo "
         "mire un fichero de excepciones tampoco lo ve. Por eso hay una regla "
         "para exactamente esto, corriendo en el gate junto al resto: ningún "
         "punto de entrada puede caer dentro de un rango declarado como "
         "datos.</p>"
         "<p>Y luego está la otra prueba, jugar la partida de verdad. "
         "Reproduciendo una grabación completa de 38 minutos —cortesía de "
         "Araubi— y anotando por dónde pasa el procesador, resulta que de "
         "las 1489 direcciones que el juego llega a ejecutar, el trazador ya "
         "alcanza 1444 por su cuenta; las que faltan pasan a ser puntos de "
         "entrada, cada una con su cuenta de muestras al lado. La cobertura "
         "real del bloque de naves acaba en 23,0 %, y la de la segunda "
         "parte, en 28,6 %.</p>"),
    ],
    "en": [
        ("This isn't an MSX tape",
         "<p>MSX games are recorded in KCS blocks, the system's own format. Not "
         "Stardust: its four data blocks are ZX Spectrum blocks, with a flag "
         "byte, the data and an XOR check at the end, and all four carry it "
         "correctly.</p>"
         "<p>The loader isn't native either: it's a reimplementation of "
         "LD-BYTES, the Spectrum ROM's own load routine, with the same "
         "register interface.</p>"),
        ("The loader ships with a back door for trainers",
         "<p>Before starting the game, the loader saves 94 bytes to high "
         "memory and takes a look at them: if they begin with three "
         "<code>0xC9</code>, it treats them as a list of patches and applies "
         "them to the game it just loaded, address and value, one after "
         "another.</p>"
         "<p>And the arithmetic works out on its own: three bytes of "
         "signature, one counter byte, and thirty patches of three bytes "
         "each, ninety-four in total. It's sized for exactly thirty pokes, "
         "which happens to be exactly what the magazine loaders of the day "
         "were using.</p>"),
        ("Two games on one tape",
         "<p>Clearing the last ship zone sends the game back to the cassette "
         "for a second part where the character carries on on foot. And it "
         "doesn't reuse the loader's routine for that, even though it's "
         "still alive in memory: it brings its own, which starts the tape "
         "motor and reads the data bit off the sound chip.</p>"
         "<p>The two programs don't even share an engine. In the first part "
         "each object carries an 8-byte structure with a pointer to its "
         "governing routine; in the second, the enemies live in light 5-byte "
         "tables moved by fixed loops —four walkers at most, flyers kept "
         "apart. There are 46-byte objects in the second part too, but "
         "they're not enemies: they're the sound interpreter's three "
         "channels.</p>"),
        ("What the MSX forced them to change",
         "<p>The Spectrum writes straight into its screen memory, which is "
         "ordinary RAM. On the MSX, video memory sits behind the graphics "
         "chip, so it has to go out through a port, byte by byte.</p>"
         "<p>Which is why this version carries a screen buffer the original "
         "never needed: 3840 bytes at 0x4000-0x4EFF, 24 wide by 160 tall, "
         "sent to VRAM in three bands, column by column. Twenty-four bytes "
         "are 192 pixels, narrower than the screen, and that's why the frame "
         "down the sides never moves: the surplus is vertical, which is "
         "exactly where it scrolls.</p>"
         "<p>And those axes are easy to read backwards. The dump's "
         "<code>ld b,028h</code> looks like it's saying \"40 columns\", but "
         "it's the inner loop, the one collecting 40 bytes from a single "
         "column in steps of 24. Drawing it settles it: split 24 at a time "
         "and the high-score table comes out legible; 40 at a time, "
         "noise.</p>"),
        ("Sprites drawn by hand",
         "<p>The MSX has hardware sprites, but they're not used here: sprites "
         "get drawn in software, the Spectrum way, shifting the image bit by "
         "bit and compositing it with AND and OR.</p>"
         "<p>Both halves of the game carry the same routine for that, copied "
         "and relocated from one to the other. The sprite painter is 198 "
         "bytes long, and pair its two halves correctly and the only "
         "differences are ten relocated addresses and one loose byte, the "
         "bottom clip.</p>"),
        ("No entry point falls inside a picture",
         "<p>Seed the tracer with badly anchored routines and coverage can "
         "inflate in one go without anyone noticing: the binary still "
         "reassembles, because it's the same bytes and only the reading "
         "changes; the budget still closes; and a trace check that only "
         "looks at a file of exceptions won't catch it either. So there's a "
         "rule for exactly this, running in the gate alongside the rest: no "
         "entry point may fall inside a range declared as data.</p>"
         "<p>And then there's the other proof, actually playing the game. "
         "Replaying a complete 38-minute recording —courtesy of Araubi— and "
         "noting where the processor goes, it turns out that of the 1489 "
         "addresses the game actually executes, the tracer already reaches "
         "1444 on its own; the ones it misses become entry points, each with "
         "its sample count beside it. The ship block's real coverage lands "
         "at 23.0%, and the second part's at 28.6%.</p>"),
    ],
}

IMAGENES = [("tiles.png", "Los 111 tiles del decorado", "The 111 scenery tiles"),
            ("sprites.png", "Los 83 sprites", "The 83 sprites"),
            ("carga.png", "La pantalla de carga, firmada CANO",
             "The loading screen, signed CANO"),
            ("charset.png", "La tipografía: 59 caracteres", "The charset: 59 characters")]


def img64(ruta):
    with open(ruta, "rb") as f:
        return "data:image/png;base64," + base64.b64encode(f.read()).decode()


def logo_png(binpath, ruta):
    """El logo STARDUST de la cabecera, dibujado desde la cinta.

    Es el bitmap de 0x47A0, los primeros 256 bytes del bloque del juego:
    128x16 pixeles a 16 bytes por fila, el mismo rotulo que el modo atraccion
    anima en el area de juego. Blanco sobre negro, que es como se ve, y a
    escala 4 (512x64) para la cabecera.
    """
    from render_maps import png
    d = open(binpath, "rb").read()
    ESC = 4
    px = [[(0, 0, 0)] * 128 * ESC for _ in range(16 * ESC)]
    for y in range(16):
        for bx in range(16):
            b = d[y * 16 + bx]
            for bit in range(8):
                if b & (0x80 >> bit):
                    for sy in range(ESC):
                        for sx in range(ESC):
                            px[y * ESC + sy][(bx * 8 + bit) * ESC + sx] = (255, 255, 255)
    png(ruta, 128 * ESC, 16 * ESC, px)


def main(argv):
    if len(argv) < 5:
        print(__doc__)
        return 2
    imgdir, salida, idioma = argv[2], argv[3], argv[4]
    t = TXT[idioma]
    ruta_logo = os.path.join(imgdir, "logo.png")
    logo_png(argv[1], ruta_logo)

    nav = "".join(f'<a href="{h}">{x}</a>' for h, x in t["nav"])
    nav += "".join(f'<a href="{h}">{x}</a>' for h, x in t["docnav"])
    nav += f'<a href="{t["otro"][0]}" style="margin-left:auto;color:var(--oro)">{t["otro"][1]}</a>'

    cifras = "".join(f'<div class="cifra"><b>{v}</b><span>{e}</span></div>'
                     for v, e in t["cifras"])
    halls = "".join(f'<div class="hall"><h3>{tit}</h3>{cuerpo}</div>'
                    for tit, cuerpo in HALLAZGOS[idioma])
    imgs = ""
    for fich, es, en in IMAGENES:
        ruta = os.path.join(imgdir, fich)
        if not os.path.exists(ruta):
            continue
        pie = es if idioma == "es" else en
        imgs += (f'<figure><img src="{img64(ruta)}" alt="{pie}">'
                 f'<figcaption>{pie}</figcaption></figure>')

    html = f"""<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>{t['titulo']}</title>
<style>{ESTILO}</style>
<header class="top">
  <img src="{img64(ruta_logo)}" alt="Stardust (1987)">
  <p class="claim">{t['claim']}</p>
  <p class="ficha">{' · '.join(t['ficha'])}</p>
</header>
<nav>{nav}</nav>
<section id="numbers">
  <h2>{t['h_num']}</h2>
  <div class="cifras">{cifras}</div>
</section>
<section id="findings"><h2>{t['h_find']}</h2>{halls}</section>
<section id="screens">
  <h2>{t['h_scr']}</h2>
  <p class="n">{t['nota_scr']}</p>
  <div class="galeria">{imgs}</div>
</section>
<footer><p>{t['pie_gracias']}</p><p>{t['pie_leg']}</p></footer>
"""
    with open(salida, "w", encoding="utf-8") as f:
        f.write(html)
    print("  %s: %d KB (%s)" % (salida, len(html) // 1024, idioma))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
