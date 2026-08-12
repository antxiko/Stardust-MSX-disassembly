# Stardust (Topo Soft, 1987, MSX1) - desensamblado
#
# `make` extrae los bloques de la cinta, los traza y comprueba que al rehacer
# los listados sale EXACTAMENTE el original, byte a byte.
#
# Lo que hace raro a este juego: es una conversion del ZX Spectrum y se trajeron
# el sistema de cinta entero. Los bloques no son KCS del MSX sino bloques del
# Spectrum (TZX 0x10) con su `[bandera][datos][XOR]`, y el cargador es una
# reimplementacion de LD-BYTES de la ROM del Spectrum. Ademas es MULTICARGA: las
# zonas 1 a 7 se juegan con una nave y, al pasar la 7, el juego vuelve a la
# cinta a por una segunda parte en la que se va a pie. Por eso aqui no hay una
# imagen unica de 64K, sino varias fotos de la memoria en momentos distintos.

TSX  := stardust.tsx
TSX_SHA := 8f4fb3840e5ad043d8d694faeaa86a6e4a5cd2cabe5dd99fec08e5cf0a7dbb13
SYMS := work/msx.sym

.PHONY: all verify clean extract cuerpos trazado listados sanity test cinta imagenes web

all: verify

# ---------------------------------------------------------------- extraccion
cinta:
	@if [ ! -f "$(TSX)" ]; then \
	  echo ""; \
	  echo "  Falta la imagen de cinta: $(TSX)"; \
	  echo ""; \
	  echo "  No se distribuye con este repositorio, solo el trabajo de"; \
	  echo "  documentacion (ver AVISO-LEGAL.md). Para reconstruirlo todo hace"; \
	  echo "  falta tu propia copia del TSX de Stardust, con ese nombre y en la"; \
	  echo "  raiz del proyecto. Debe dar este sha256:"; \
	  echo "      $(TSX_SHA)"; \
	  echo ""; \
	  exit 1; \
	fi
	@echo "$(TSX_SHA)  $(TSX)" | shasum -a 256 -c - >/dev/null 2>&1 \
	  || { echo "  AVISO: $(TSX) no da el sha256 esperado; los listados pueden no cuadrar."; }

extract: extracted/.stamp
extracted/.stamp: tools/tsx_parse.py tools/cuerpos.py | cinta
	@mkdir -p work
	python3 tools/tsx_parse.py "$(TSX)" extracted >/dev/null
	python3 tools/cuerpos.py extracted work
	@touch $@

cuerpos: extract

# ------------------------------------------------------------------ trazado
# El bloque del juego de naves. Los puntos de entrada NO son solo el arranque:
# hay que darle a mano la rutina de interrupcion (que se engancha en H.TIMI, no
# se llama con un CALL) y los 35 opcodes del interprete de guiones, que salen de
# una tabla de punteros. Y hay que declarar esa tabla como datos, o el trazador
# se mete dentro y da cobertura falsa.
work/juego.trace.json: tools/z80trace.py src/juego.entries src/juego.nocode extracted/.stamp
	python3 tools/z80trace.py work/juego.raw 0x47A0 src/juego.entries work/juego src/juego.nocode

work/parte2.trace.json: tools/z80trace.py src/parte2.entries src/parte2.nocode extracted/.stamp
	python3 tools/z80trace.py work/parte2.raw 0x61D0 src/parte2.entries work/parte2

work/pre.trace.json: tools/z80trace.py src/pre.entries extracted/.stamp
	python3 tools/z80trace.py work/pre.raw 0x9B8C src/pre.entries work/pre

work/loader.trace.json: tools/z80trace.py src/loader.entries extracted/.stamp
	python3 tools/z80trace.py work/loader.raw 0xD2F0 src/loader.entries work/loader

trazado: work/juego.trace.json work/parte2.trace.json work/pre.trace.json work/loader.trace.json

# ----------------------------------------------------------------- listados
# Cuatro de los cinco listados se generan desde el trazado y sus notas. El del
# logo de la casa NO: ese bloque es byte-identico al de otros juegos de Topo
# Soft, asi que se reutiliza su desensamblado ya comentado y aqui solo se
# comprueba que sigue reproduciendo el binario.
listados: src/stardust_juego.asm src/stardust_parte2.asm src/stardust_pre.asm src/stardust_loader.asm

src/stardust_juego.asm: work/juego.trace.json src/juego.notes tools/mkasm.py
	python3 tools/mkasm.py work/juego.raw 0x47A0 work/juego.trace.json \
	  src/juego.notes $(SYMS) $@ "STARDUST - MSX - el juego de naves, zonas 1 a 7"

src/stardust_parte2.asm: work/parte2.trace.json src/parte2.notes tools/mkasm.py
	python3 tools/mkasm.py work/parte2.raw 0x61D0 work/parte2.trace.json \
	  src/parte2.notes $(SYMS) $@ "STARDUST - MSX - la segunda parte, a pie"

src/stardust_pre.asm: work/pre.trace.json src/pre.notes tools/mkasm.py
	python3 tools/mkasm.py work/pre.raw 0x9B8C work/pre.trace.json \
	  src/pre.notes $(SYMS) $@ "STARDUST - MSX - la pantalla que se ve al cargar"

src/stardust_loader.asm: work/loader.trace.json src/loader.notes tools/mkasm.py
	python3 tools/mkasm.py work/loader.raw 0xD2F0 work/loader.trace.json \
	  src/loader.notes $(SYMS) $@ "STARDUST - MSX - el cargador turbo"

work/topo.trace.json: tools/z80trace.py src/topo.entries extracted/.stamp
	python3 tools/z80trace.py work/topo.raw 0x9470 src/topo.entries work/topo

sanity: work/juego.trace.json work/topo.trace.json work/parte2.trace.json
	@echo "=================================================================="
	@echo " Coherencia: ningun punto de entrada dentro de una zona de datos"
	@echo "=================================================================="
	@python3 tools/check_entradas.py src/juego.entries src/juego.notes src/juego.nocode
	@python3 tools/check_entradas.py src/parte2.entries src/parte2.notes
	@python3 tools/check_entradas.py src/pre.entries src/pre.notes
	@python3 tools/check_entradas.py src/loader.entries src/loader.notes
	@echo ""
	@echo "=================================================================="
	@echo " Cuales de los puntos de entrada son rutinas y cuales no lo son"
	@echo "=================================================================="
	-@python3 tools/check_interiores.py src/stardust_juego.asm src/juego.entries \
	    src/stardust_parte2.asm src/parte2.entries | tail -1
	@echo ""
	@echo "=================================================================="
	@echo " Sanidad del trazado: las zonas de datos no pueden salir como codigo"
	@echo "=================================================================="
	python3 tools/check_trace.py work/juego.trace.json src/juego.nocode
	@echo ""
	@echo "=================================================================="
	@echo " Y el cruce COMPLETO: las 94 zonas D contra lo que el trazador cree"
	@echo "=================================================================="
	@echo " (check_trace mira solo el .nocode; esto mira TODAS las zonas de"
	@echo "  datos declaradas. Una semilla metida dentro de una de ellas hace"
	@echo "  desensamblar datos como codigo e infla la cobertura: paso tres"
	@echo "  veces en este proyecto, la ultima con la musica de la fase a pie)"
	python3 tools/check_datos_como_codigo.py work src
	@echo ""
	@echo "=================================================================="
	@echo " Presupuesto de la cinta: no deben quedar bytes sin explicar"
	@echo "=================================================================="
	@python3 tools/presupuesto.py work src

# Las imagenes de la web. No son capturas: se dibujan a partir de los datos de
# la cinta siguiendo lo que hace el propio juego. Por eso valen de comprobacion:
# la pantalla de carga solo sale limpia si el reparto del bloque [09] y el orden
# intercalado de su tabla de nombres son los que decimos. Si algo de eso
# estuviera mal, de aqui saldria ruido.
imagenes: extracted/.stamp
	@mkdir -p docs/imagenes
	python3 tools/render_carga.py work/pre.raw docs/imagenes/carga.png
	python3 tools/render_graficos.py work/juego.raw docs/imagenes
	python3 tools/render_niveles.py work/juego.raw docs/imagenes
	python3 tools/render_torre.py work/parte2.raw docs/imagenes
	python3 tools/render_marco.py work/juego.raw docs/imagenes
	python3 tools/render_final.py work/parte2.raw docs/imagenes

verify: listados sanity imagenes
	@echo "=================================================================="
	@echo " Reproducibilidad: ensamblar debe dar el binario exacto"
	@echo "=================================================================="
	@./tools/verify_build.sh src/stardust_juego.asm  work/juego.raw  0x47A0
	@./tools/verify_build.sh src/stardust_parte2.asm work/parte2.raw 0x61D0
	@./tools/verify_build.sh src/stardust_pre.asm    work/pre.raw    0x9B8C
	@./tools/verify_build.sh src/stardust_loader.asm work/loader.raw 0xD2F0
	@./tools/verify_build.sh src/stardust_topo.asm   work/topo.raw   0x9470

test:
	@echo "=================================================================="
	@echo " Tests"
	@echo "=================================================================="
	@python3 -m unittest discover -s tests -v

# La web de GitHub Pages: ingles en docs/ y castellano en docs/es/. El diseno es
# el compartido por la serie (tools/estilo_web.py) y las paginas salen
# autocontenidas, con las imagenes embebidas.
web: imagenes
	python3 tools/md2html.py docs en
	python3 tools/md2html.py docs/es es
	python3 tools/make_web.py work/juego.raw docs/imagenes docs/index.html en
	python3 tools/make_web.py work/juego.raw docs/imagenes docs/es/index.html es
	@touch docs/.nojekyll
	@python3 tools/check_enlaces.py docs

clean:
	rm -rf extracted dump build work/*.raw work/*.bin work/*.json
	rm -f extracted/.stamp
