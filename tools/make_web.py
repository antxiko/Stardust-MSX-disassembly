#!/usr/bin/env python3
"""Genera la portada de la web, en los dos idiomas.

El diseno es el compartido por la serie (tools/estilo_web.py) y la pagina sale
autocontenida, con las imagenes embebidas.

Una nota sobre las cifras: la portada lleva un aviso ANTES de ellas, y esta ahi
a proposito. Que el presupuesto cierre al 100% significa que cada byte tiene
dueno, no que se sepa para que sirve, y esa diferencia es facil de leer mal. Si
la portada dijera "100% explicado" a secas estaria vendiendo humo.

Uso: make_web.py <work/juego.raw> <docs/imagenes> <salida.html> <idioma>
"""
import base64
import os
import sys

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from estilo_web import ESTILO                      # noqa: E402

TOTAL = 93861
SIN_IDENTIFICAR = 6568

TXT = {
    "es": dict(
        titulo="Stardust (1987) — desensamblado comentado",
        claim="Una cinta de cassette de 1987, desmontada bloque a bloque. Por "
              "dentro resultó ser <b>una conversión del ZX Spectrum que se trajo "
              "hasta el sistema de grabación</b>.",
        aviso="<b>Esto no está terminado, y se sigue trabajando en ello.</b> Que "
              "el presupuesto cierre al 100 % quiere decir que cada byte de la "
              "cinta tiene dueño —o es código que el trazador alcanza de verdad, "
              "o cae en un rango con nombre y medida—, <b>no</b> que se sepa para "
              "qué sirve cada uno. Quedan 6568 bytes sin identificar y buena "
              "parte de las rutinas sin comentar. Está contado con cifras en "
              "<a href='LO-QUE-FALTA.html'>Lo que falta</a>.",
        ficha=["Topo Soft · <b>1987</b>", "Conversión del <b>ZX Spectrum</b>",
               "Carga de cinta <b>multicarga</b>", "MSX1 · <b>64K</b>"],
        nav=[("#numbers", "Las cifras"), ("#findings", "Hallazgos"),
             ("#screens", "Los gráficos"), ("#method", "Cómo se hizo")],
        docnav=[("EMPEZAR.html", "Empezar"), ("EL-JUEGO.html", "El juego"),
                ("LA-CINTA.html", "La cinta"), ("EL-CODIGO.html", "El código"),
                ("HALLAZGOS.html", "Hallazgos"),
                ("LO-QUE-FALTA.html", "Lo que falta")],
        otro=("../", "In English"),
        h_num="El juego en cifras", h_find="Lo que apareció al desmontarlo",
        h_scr="Los gráficos", h_met="Cómo se hizo",
        cifras=[("100%", "del binario con dueño"), ("106", "rutinas identificadas"),
                ("7+1", "zonas de naves, y una a pie"), ("27.635", "bytes de código"),
                ("66.226", "bytes de datos"), ("6.568", "bytes sin identificar")],
        nota_scr="No son capturas de pantalla. Están dibujadas a partir de los "
                 "datos del propio binario, con la geometría que usa el juego. "
                 "Por eso valen de comprobación: si el reparto del bloque "
                 "estuviera mal, saldría ruido en vez de una tilería.",
        pie_leg="Trabajo de documentación y preservación sobre un juego de 1987. "
                "El código y los gráficos son de sus autores y de Topo Soft. La "
                "imagen de cinta no se distribuye. Parte del análisis se apoya en "
                "el desensamblado de la versión de ZX Spectrum publicado por sus "
                "autores originales; ver el aviso legal.",
    ),
    "en": dict(
        titulo="Stardust (1987) — a commented disassembly",
        claim="A 1987 cassette tape, taken apart block by block. Inside it turned "
              "out to be <b>a ZX Spectrum conversion that brought the tape system "
              "across with it</b>.",
        aviso="<b>This is not finished, and work continues.</b> The budget closing "
              "at 100% means every byte on the tape has an owner —either code the "
              "tracer genuinely reaches, or a range with a name and a "
              "measurement— <b>not</b> that its purpose is known. 6568 bytes "
              "remain unidentified and much of the code is still uncommented. It "
              "is set out with figures in "
              "<a href='WHATS-MISSING.html'>What's missing</a>.",
        ficha=["Topo Soft · <b>1987</b>", "A <b>ZX Spectrum</b> conversion",
               "<b>Multiload</b> from tape", "MSX1 · <b>64K</b>"],
        nav=[("#numbers", "The numbers"), ("#findings", "What turned up"),
             ("#screens", "The graphics"), ("#method", "How it was done")],
        docnav=[("GETTING-STARTED.html", "Getting started"),
                ("THE-GAME.html", "The game"),
                ("THE-TAPE.html", "The tape"), ("THE-CODE.html", "The code"),
                ("FINDINGS.html", "Findings"),
                ("WHATS-MISSING.html", "What's missing")],
        otro=("es/", "En castellano"),
        h_num="The game in numbers", h_find="What turned up when we took it apart",
        h_scr="The graphics", h_met="How it was done",
        cifras=[("100%", "of the binary owned"), ("106", "routines identified"),
                ("7+1", "ship zones, plus one on foot"), ("27,635", "bytes of code"),
                ("66,226", "bytes of data"), ("6,568", "bytes unidentified")],
        nota_scr="These aren't screen captures. They are drawn from the binary's "
                 "own data, using the geometry the game itself uses. That is what "
                 "makes them a check: if the block's layout were wrong, noise "
                 "would come out instead of a tileset.",
        pie_leg="Documentation and preservation work on a 1987 game. The code and "
                "artwork belong to their authors and to Topo Soft. The tape image "
                "is not distributed. Part of the analysis leans on the ZX Spectrum "
                "disassembly published by its original authors; see the legal "
                "notice.",
    ),
}

HALLAZGOS = {
    "es": [
        ("La cinta no es una cinta de MSX",
         "<p>Un juego de MSX se graba en bloques <b>KCS</b>, que es el formato del "
         "sistema. Stardust, no: sus cuatro bloques de datos son <b>bloques del ZX "
         "Spectrum</b>, con su bandera, sus datos y un XOR de comprobación. Los "
         "cuatro traen ese checksum correcto.</p>"
         "<p>Y el cargador es una <b>reimplementación de LD-BYTES</b>, la rutina de "
         "carga de la ROM del Spectrum, con su mismo interfaz de registros.</p>"),
        ("El cargador trae una puerta trasera para trainers",
         "<p>Antes de arrancar el juego, el cargador salva 94 bytes a memoria alta "
         "y mira si empiezan por tres <code>0xC9</code>. Si es así, los trata como "
         "una lista de parches y los aplica sobre el juego recién cargado: "
         "dirección y valor, uno detrás de otro.</p>"
         "<p>La cuenta dice para cuántos: 3 de firma + 1 de contador + <b>30 "
         "parches de 3 bytes = 94</b>. Está dimensionado exactamente para treinta. "
         "Es lo que usaban los cargadores de las revistas de la época.</p>"),
        ("Dos juegos en una cinta",
         "<p>Al superar la última zona de naves el juego vuelve al cassette a por "
         "una segunda parte en la que el protagonista va a pie. Y no usa para ello "
         "la rutina del cargador, que sigue viva en memoria: <b>trae la suya</b>, "
         "que enciende el motor de la cinta y lee el bit de datos del chip de "
         "sonido.</p>"
         "<p>Los dos programas ni siquiera comparten motor: sus objetos llevan "
         "estructuras de 8 bytes en la primera parte y de 46 en la segunda.</p>"),
        ("Lo que el MSX obligó a cambiar",
         "<p>El Spectrum escribe directamente en su memoria de pantalla, que es RAM "
         "normal. En el MSX la memoria de vídeo está detrás del chip gráfico y hay "
         "que enviarla por un puerto, byte a byte.</p>"
         "<p>Por eso esta versión lleva un <b>buffer de pantalla</b> que el original "
         "no necesita: 960 bytes en 0x4B40, de 40 columnas por 24 filas, que se "
         "recorren por columnas. Cuarenta cuando en pantalla caben treinta y dos: "
         "esas ocho de más son el margen del scroll.</p>"),
        ("Sprites dibujados a mano",
         "<p>El MSX tiene sprites por hardware. Aquí no se usan: se dibujan por "
         "software, a la manera del Spectrum, desplazando el dibujo bit a bit y "
         "componiéndolo con AND y OR.</p>"
         "<p>Las dos partes del juego comparten esa rutina. De 40 bytes comparados "
         "solo difieren seis, y tres de ellos son <code>and (hl)</code> contra "
         "<code>or (hl)</code>.</p>"),
        ("Una cobertura que era mentira, dos veces",
         "<p>A mitad del trabajo, sembrar el trazador con rutinas sacadas del cotejo "
         "con la versión de Spectrum subió la cobertura <b>del 25 % al 75,8 % de "
         "golpe</b>. Parecía el hallazgo de la sesión y era contaminación: las tablas "
         "de color, el relleno de ceros y hasta los datos de nivel aparecían marcados "
         "como código al 100 %.</p>"
         "<p>Se arregló declarando esas zonas como datos… y volvió a colarse, porque "
         "las rutinas se quedaron como <b>puntos de entrada</b>. Cuarenta y una caían "
         "dentro de los tiles y los sprites, así que el trazador seguía entrando a "
         "desensamblar dibujos: <b>17.000 bytes de gráficos publicados como "
         "instrucciones</b>, con la cobertura hinchada del 24,6 % al 61,6 %.</p>"
         "<p>Nada de lo que se comprobaba podía verlo. El binario reensamblaba igual "
         "—son los mismos bytes, solo cambia cómo se leen—, el presupuesto cerraba "
         "igual, y la sanidad del trazado sólo miraba los rangos de un fichero donde "
         "los gráficos no estaban. Ahora hay una comprobación para exactamente esto: "
         "<b>ningún punto de entrada puede caer dentro de un rango declarado como "
         "datos</b>.</p>"
         "<p>Y luego llegó la prueba de verdad. Un aficionado, Araubi, había "
         "grabado una partida completa de 38 minutos en el emulador. "
         "Reproduciéndola y anotando por dónde pasa el procesador, de las "
         "<b>1489 direcciones que el juego ejecutó, el trazador ya alcanzaba "
         "1444</b>: la limpieza era correcta. Y las que faltaban dejaron de ser "
         "una corazonada para pasar a ser código con su cuenta de muestras al "
         "lado. La cobertura real del bloque es del <b>24,7 %</b>, y la de la "
         "segunda parte subió al <b>51,3 %</b> al aparecer ahí sus dos rutinas "
         "más trabajadoras, que estaban clasificadas como tablas de datos.</p>"),
    ],
    "en": [
        ("This isn't an MSX tape",
         "<p>MSX games are recorded in <b>KCS</b> blocks, the system's own format. "
         "Not Stardust: its four data blocks are <b>ZX Spectrum blocks</b>, with "
         "their flag, their data and an XOR checksum. All four carry that checksum "
         "correctly.</p>"
         "<p>And the loader is a <b>reimplementation of LD-BYTES</b>, the Spectrum "
         "ROM's load routine, with the same register interface.</p>"),
        ("The loader ships with a back door for trainers",
         "<p>Before starting the game, the loader saves 94 bytes to high memory and "
         "checks whether they begin with three <code>0xC9</code>. If so, it treats "
         "them as a list of patches and applies them to the freshly loaded game: "
         "address and value, one after another.</p>"
         "<p>The arithmetic says how many: 3 of signature + 1 counter + <b>30 "
         "patches of 3 bytes = 94</b>. Sized for exactly thirty. This is what the "
         "magazine loaders of the day were using.</p>"),
        ("Two games on one tape",
         "<p>Clearing the last ship zone sends the game back to the cassette for a "
         "second part where the character continues on foot. And it doesn't use the "
         "loader's routine, still alive in memory: <b>it brings its own</b>, which "
         "starts the tape motor and reads the data bit off the sound chip.</p>"
         "<p>The two programs don't even share an engine: their objects carry 8-byte "
         "structures in the first part and 46-byte ones in the second.</p>"),
        ("What the MSX forced them to change",
         "<p>The Spectrum writes straight into its screen memory, which is ordinary "
         "RAM. On the MSX, video memory sits behind the graphics chip and has to be "
         "sent through a port, byte by byte.</p>"
         "<p>So this version carries a <b>screen buffer</b> the original doesn't "
         "need: 960 bytes at 0x4B40, 40 columns by 24 rows, walked by columns. "
         "Forty when only thirty-two fit on screen: those extra eight are the "
         "scrolling margin.</p>"),
        ("Sprites drawn by hand",
         "<p>The MSX has hardware sprites. They aren't used here: sprites are drawn "
         "in software, the Spectrum way, shifting the image bit by bit and "
         "compositing it with AND and OR.</p>"
         "<p>Both halves of the game share that routine. Of 40 bytes compared only "
         "six differ, and three of those are <code>and (hl)</code> versus "
         "<code>or (hl)</code>.</p>"),
        ("A coverage figure that was a lie, twice over",
         "<p>Midway through, seeding the tracer with routines from the cross-check "
         "against the Spectrum version pushed coverage <b>from 25% to 75.8% in one "
         "go</b>. It looked like the find of the session and it was contamination: "
         "colour tables, zero padding and even level data were showing up marked as "
         "code at 100%.</p>"
         "<p>That was fixed by declaring those zones as data… and it crept back in, "
         "because the routines stayed on as <b>entry points</b>. Forty-one of them "
         "landed inside the tiles and the sprites, so the tracer kept walking into "
         "artwork: <b>17,000 bytes of graphics published as instructions</b>, with "
         "coverage inflated from 24.6% to 61.6%.</p>"
         "<p>Nothing being checked could see it. The binary still reassembled — same "
         "bytes, only read differently — the budget still closed, and the trace "
         "sanity check only looked at ranges in a file the graphics weren't in. There "
         "is now a check for exactly this: <b>no entry point may fall inside a range "
         "declared as data</b>.</p>"
         "<p>Then came the real test. An enthusiast, Araubi, had recorded a "
         "complete 38-minute playthrough in the emulator. Replaying it and "
         "noting where the processor actually goes, of the <b>1489 addresses "
         "the game executed the tracer already reached 1444</b>: the cleanup "
         "was right. And the ones it missed stopped being a hunch and became "
         "code with a sample count beside it. The block's real coverage is "
         "<b>24.7%</b>, and the second part's rose to <b>51.3%</b> when its two "
         "hardest-working routines turned up there, both of which had been "
         "classified as data tables.</p>"),
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


def main(argv):
    if len(argv) < 5:
        print(__doc__)
        return 2
    imgdir, salida, idioma = argv[2], argv[3], argv[4]
    t = TXT[idioma]

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
<header>
  <h1>Stardust <span class="anyo">1987</span></h1>
  <p class="claim">{t['claim']}</p>
  <p class="ficha">{' · '.join(t['ficha'])}</p>
</header>
<nav>{nav}</nav>
<section class="aviso"><p>{t['aviso']}</p></section>
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
<footer><p>{t['pie_leg']}</p></footer>
"""
    with open(salida, "w", encoding="utf-8") as f:
        f.write(html)
    print("  %s: %d KB (%s)" % (salida, len(html) // 1024, idioma))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
