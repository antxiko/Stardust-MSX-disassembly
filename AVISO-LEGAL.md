# Aviso legal y de atribución

## De quién es cada cosa

**El juego no es nuestro.** *Stardust* (1987) lo publicó **Topo Soft**. Todos los
derechos sobre el juego siguen siendo de sus titulares.

**Lo que sí es nuestro** son las herramientas de este repositorio, los
comentarios de los listados, el análisis y la documentación. Eso se publica bajo
la licencia que consta en `LICENSE`.

## Qué contiene este repositorio

Los ficheros `src/*.asm` son el desensamblado comentado de los bloques de la
cinta. Se publican con ánimo de **preservación, estudio y documentación** de un
título que forma parte de la historia del software español, y que hoy no está a
la venta por ningún canal.

La imagen de cinta (`.tsx`) **no** se distribuye aquí.

Las imágenes de `docs/` no son capturas tomadas del juego: se generan a partir
de los datos del binario con las herramientas del repositorio, como parte de la
demostración de que el formato está bien entendido.

## Trabajo de terceros en el que se apoya

Este desensamblado usa, y debe reconocerlo con claridad, el trabajo de otros.

**El desensamblado de la versión de ZX Spectrum**, publicado por los autores
originales del juego en <https://github.com/TheJare/stardust-48k> con permiso de
todos ellos. De ahí salen los nombres de buena parte de las secciones de datos y
de las rutinas.

Ahora bien, **nada de eso se ha dado por bueno sin comprobarlo**, y hay una
razón concreta: ellos mismos avisan en su README de que la versión de MSX **la
hizo otra gente** («we originally ported it to the Amstrad CPC, while other
people did the MSX, C-64 and eventual PC versions»). Sus etiquetas son, por
tanto, una hipótesis sobre este binario, no un hecho.

El criterio que se ha seguido es este: una etiqueta suya solo se adopta cuando
el tramo correspondiente aparece **idéntico byte a byte** en los dos binarios.
Cuando los bytes son los mismos, la etiqueta viaja con ellos; cuando no
coinciden, no se usa. Eso se puede rehacer y discutir con
`tools/coteja_spectrum.py`.

Lo mismo vale para las geometrías de los gráficos, que salen de su
`tools/ExtractImages.cpp`: aquí se comprueban dibujándolas, porque una geometría
equivocada produce ruido y no una tilería reconocible.

**El cargador publicado en la revista Input MSX número 19**, cuyos tres POKEs se
citan en la documentación. Se han verificado contra este binario y aplicados en
el emulador, y sirvieron para llegar a la segunda parte del juego y ver la
multicarga en funcionamiento.

## Si eres uno de los autores

Si trabajaste en *Stardust* o eres titular de derechos sobre el juego, y
prefieres que este material no esté publicado, **dilo y se retira sin
discusión**. La intención de este trabajo es exactamente la contraria a
perjudicaros: es dejar constancia de cómo estaba hecho.
