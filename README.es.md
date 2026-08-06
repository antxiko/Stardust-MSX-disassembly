# Stardust (Topo Soft, 1987, MSX) — desensamblado comentado

Una cinta de cassette de 1987, desmontada bloque a bloque. Los **93 861 bytes**
que trae están acotados y con dueño, y por dentro resultó ser **una conversión
del ZX Spectrum que se trajo hasta el sistema de grabación**.

⚠️ **Esto no está terminado, y se sigue trabajando en ello.** Que el presupuesto
cierre al 100 % significa que cada byte tiene un nombre y una medida detrás, no
que se sepa para qué sirve: quedan **2868 bytes sin identificar** y buena parte
del código sin comentar. Lo que falta, con sus cifras, está en
[la página de lo que falta](https://antxiko.github.io/Stardust-MSX-disassembly/es/LO-QUE-FALTA.html).

📖 **[Documentación completa](https://antxiko.github.io/Stardust-MSX-disassembly/)**
· [En castellano](https://antxiko.github.io/Stardust-MSX-disassembly/es/)

---

## Qué es esto

*Stardust* es un matamarcianos vertical que Topo Soft publicó para MSX en 1987.
Este repositorio contiene el código de sus cinco bloques, comentado, más las
herramientas para reconstruirlo y comprobarlo.

Lo que hace este juego distinto de los demás de la casa: **es una conversión, y
se nota en sitios donde uno no la buscaría**. Los otros títulos de Topo Soft
para MSX graban en bloques KCS, que es el formato del MSX. Stardust usa
**bloques del ZX Spectrum**, con su `[bandera][datos][XOR]`, y su cargador es
una **reimplementación de LD-BYTES**, la rutina de carga de la ROM del Spectrum,
con el mismo interfaz de registros. Antes de nada mapea RAM en las páginas 1 y 2
para tener los 64K planos que el Spectrum da de serie y el MSX no.

Y es **multicarga**: las zonas 1 a 7 se juegan pilotando una nave y, al superar
la última, el juego vuelve a la cinta a por una segunda parte en la que el
protagonista va a pie. Son dos programas distintos en un mismo cassette.

## Cómo se comprueba que esto es verdad

`make` extrae los bloques de la cinta, genera los listados y exige que al
rehacerlos salga exactamente el original:

```
topo    4254 B   OK: reproducible byte a byte
loader   351 B   OK: reproducible byte a byte
pre    12468 B   OK: reproducible byte a byte
juego  46663 B   OK: reproducible byte a byte
parte2 29861 B   OK: reproducible byte a byte

TOTAL 93861 bytes, 93861 explicados (100.00%), 0 sin explicar
```

Ojo con ese 100 %, que es fácil de leer mal: quiere decir que **cada byte tiene
dueño** —o es código que el trazador alcanza de verdad, o cae en un rango con
nombre y medida—, no que se sepa para qué sirve cada uno. Los rangos cuyo nombre
es «datos sin clasificar» cuentan como explicados en el sentido de estar
acotados y medidos, no en el de estar entendidos. Son 2868 bytes y están
[contados uno a uno](https://antxiko.github.io/Stardust-MSX-disassembly/es/LO-QUE-FALTA.html).

Hay además un **presupuesto**, que es una comprobación distinta: cada byte tiene
que ser o código que el trazador alcanza de verdad, o un rango de datos con
nombre y explicación. Existe porque la reproducibilidad no ve los errores de
interpretación: si unos gráficos se marcaran como código, los bytes seguirían
saliendo idénticos y el único que mentiría sería el listado.

Aquí ese peligro no es teórico: **pasó**. En un momento del trabajo la cobertura
saltó del 25 % al 75,8 % de golpe y parecía un éxito. Era contaminación —el
trazador se había metido en las tablas de color y en los datos de nivel— y lo
que la cazó fue tener zonas de datos identificadas por otras vías con las que
contrastar. Está contado en la página de cómo se hizo.

Y **17 tests**, dedicados a comprobar que lo que dice la documentación es lo que
hace el juego.

## Empezar

```sh
make          # extrae, genera los listados y lo comprueba todo
make test     # solo los tests
make web      # regenera la web de docs/
```

Hace falta `pasmo`, `z80dasm` y Python 3. Para las capturas, `openmsx`.

**La cinta no se distribuye** con este repositorio, solo el trabajo de
documentación (ver [AVISO-LEGAL.md](AVISO-LEGAL.md)). Para reconstruirlo todo
hace falta tu propia copia, con el nombre `stardust.tsx` en la raíz y este
sha256:

```
8f4fb3840e5ad043d8d694faeaa86a6e4a5cd2cabe5dd99fec08e5cf0a7dbb13
```

## Qué hay en cada sitio

| | |
|---|---|
| `src/stardust_juego.asm` | el juego de naves, zonas 1 a 7 |
| `src/stardust_parte2.asm` | la segunda parte, la de a pie |
| `src/stardust_pre.asm` | la pantalla que se ve mientras carga |
| `src/stardust_loader.asm` | el cargador turbo |
| `src/stardust_topo.asm` | el logo animado de la casa |
| `src/*.notes` | las anotaciones de las que salen los listados |
| `src/*.nocode` | las zonas que NO son código, y por qué se sabe |
| `tools/coteja_spectrum.py` | coteja este binario contra el de la versión de Spectrum |
| `tools/render_graficos.py` | dibuja tiles, sprites y tipografía desde la cinta |
| `docs/` | la documentación y la web |

## Sobre el trabajo de otros

Parte de este desensamblado se apoya en el **desensamblado de la versión de ZX
Spectrum que publicaron sus autores originales**, y eso queda dicho con detalle
en [AVISO-LEGAL.md](AVISO-LEGAL.md). El criterio ha sido no dar por buena
ninguna de sus etiquetas sin comprobarla: solo se adoptan las de los tramos que
aparecen **idénticos byte a byte** en los dos binarios, porque la versión de MSX
la hizo otra gente y sus nombres son una hipótesis hasta que los bytes los
confirman.

## Créditos

*Stardust* es de Topo Soft y de sus autores; esto es trabajo de preservación y
estudio. La pantalla de carga de esta versión va firmada **CANO**. Ver
[AVISO-LEGAL.md](AVISO-LEGAL.md).
