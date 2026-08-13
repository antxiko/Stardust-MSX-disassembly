# Preguntas abiertas

Los siete criterios de este desensamblado están cumplidos: cada byte de la
cinta tiene dueño, los cinco bloques reensamblan byte a byte, y las 335
rutinas del listado tienen escrito qué hacen y con qué evidencia. Nada de eso
se cuenta como una lista de deberes: esta página recoge, con exactitud, **qué
significa cada cifra** y **qué queda por saber sobre el juego**.

## Las preguntas abiertas

- **La escena que cierra la zona 7.** La mecánica está leída byte a byte —dos
  sprites que bajan y arrastran a la nave fuera de la pantalla—, pero no está
  comprobado qué dibujan exactamente esos dos sprites. Es justo la escena que
  enlaza con la segunda carga.
- **Los 149 bytes de 0xECCC, sin dueño.** Un bloque escrito en el lenguaje del
  intérprete de sonido —56 llamadas a dos frases, con pinta de percusión— al
  que **nada apunta**: el valor 0xECCC no aparece ni una vez en los tres
  bloques de la cinta, y ninguna frase llega tan arriba. La historia entera, con
  su control, está en [Hallazgos](HALLAZGOS.html#el-sonido-es-un-lenguaje).
- **El motor de sonido trae un modo que el juego no usa.** El barrido de ruido
  puede recargarse solo al agotarse, y eso lo enciende un bit que **ninguna de
  las dos partituras enciende jamás**: todos los argumentos de ese comando valen
  0, 1 o 2, y nunca el 4 que haría falta. Código muerto en las dos mitades.
- **A la tabla de efectos de ruido le falta un byte, en las dos mitades**, y
  cada una usa justo la entrada truncada. El byte que falta se lo roba a la
  tabla de notas que empieza ahí mismo, y **sí se copia** —el bucle es de seis
  fijos—, pero cae en un campo que no se llega a usar. Que el recorte sea
  deliberado es lo que sugiere el detalle de que los cinco bytes que sobreviven
  en una mitad son los mismos que la entrada completa de la otra: dos cortes
  independientes de exactamente un byte, los dos en el único sitio inofensivo.
  Sugerirlo no es demostrarlo.
- **El comando 0x84 del intérprete de sonido**, que cuenta una duración sin
  reatacar la nota —se salta entero el tramo de ataque—. Que eso sea una
  ligadura es la lectura musical, y encaja con dónde aparece en la partitura,
  pero no está probado contra el chip como sí lo está el resto del intérprete.
- **Cuántos finales distintos hay.** Se han visto los dos —terminar el juego y
  quedarse sin vidas— pero no se ha buscado si el marcador o la puntuación
  cambian algo más en el remate.

Si tienes una idea sobre cualquiera de esas cosas, o quieres mirarlo por tu
cuenta, todo lo necesario está en el repositorio: los listados, las
herramientas de medida y los ficheros de notas donde se anota cada hallazgo.

## Qué significa ese 100 %, y qué no

El presupuesto de bytes dice:

    TOTAL 93861 bytes, 93861 explicados (100.00%), 0 sin explicar

Eso quiere decir una cosa muy concreta: **cada byte de la cinta tiene dueño**. O
es código que el trazador alcanza siguiendo el flujo de verdad, o cae dentro de
un rango declarado con un nombre y una explicación de cómo se sabe.

Lo que **no** quiere decir es que se sepa para qué sirve cada byte. Un rango
puede estar acotado y medido sin estar entendido, y confundir las dos cosas
sería vender humo. Ningún rango de la cinta queda hoy sin nombre.

Que ningún byte se lea como algo que no es lo vigila
`tools/check_datos_como_codigo.py`, cruzando todas las zonas declaradas como
datos contra lo que el trazador cree, colgado del `make sanity` y de los
tests.

## Las rutinas, contadas

Una rutina de este desensamblado pasa por tres estados, y conviene no
confundirlos:

1. **acotada**: el trazador sabe dónde empieza y dónde acaba;
2. **nombrada**: alguien ha averiguado qué es y le ha puesto nombre;
3. **comentada**: está escrito qué hace, y con qué evidencia.

El tercero es el que cuesta, y va así:

    fase de naves    191 rutinas, 191 comentadas (100 %)
    fase de a pie    144 rutinas, 144 comentadas (100 %)
    ------------------------------------------------------
    total             335 rutinas, 335 comentadas (100 %)

O sea que **quedan 0 sin comentar**. La cifra la mide
`tools/rutinas_comentadas.py` y la vigila un test, para que no pueda quedarse
vieja aquí mientras el listado avanza.

**Y ese 100 % tampoco quiere decir «terminado», igual que el de los bytes.**
Quiere decir que cada rutina tiene escrito qué hace y con qué evidencia. No
quiere decir que todo se haya comprobado en marcha: unas cuantas se sostienen
sobre la lectura del listado y están marcadas como tales allí donde lo están.

Cuenta como rutina una etiqueta que sea destino de al menos un `call`, o que
esté declarada como punto de entrada. Los destinos de salto no cuentan: son
bucles internos de otra rutina, no cabeceras.

`tools/check_interiores.py` distingue las dos cosas con una regla sencilla: si
a un punto se puede caer desde la instrucción de arriba, no es una cabecera.
Corre en el Makefile, y el test que vigila la cifra de rutinas lo usa.

## Lo que el trazador no alcanza

El presupuesto mide bytes; la cobertura mide otra cosa. Del código de los dos
bloques grandes, el trazador alcanza esto:

    juego de naves    23,0 %
    parte de a pie    28,6 %

El resto son datos, sí, pero también hay **código al que no se llega siguiendo
el flujo**: rutinas a las que solo se entra por saltos calculados, por tablas o
por punteros que se rellenan jugando. De algunas ya se sabe que existen porque
el emulador las pilló ejecutándose; de otras, no se sabe.

La medida exacta de esa ceguera son los **saltos indirectos**: `jp (hl)`, donde
el destino no está escrito en el binario sino en un registro, y el trazador se
para porque no puede saber a dónde va. Hay **cuatro**, tres en la parte de naves
y uno en la de a pie, y salen listados en el propio trazado:

```sh
python3 -c "import json;print(json.load(open('work/juego.trace.json'))['blind'])"
```

**Los cuatro están resueltos, y no queda ninguno pendiente.** El de 0xE230 es
el despachador del intérprete de guiones del sonido, y su tabla de quince
punteros se lee del binario. Los otros tres —0xCB99 y 0xD6B8 en la parte de
naves, 0xC544 en la de a pie— se resuelven jugando con el emulador delante y
anotando el destino cada vez que el salto se ejecuta, porque las estructuras
que llevan esos punteros vienen a 0xFF en la cinta y se rellenan jugando.

Un quinto punto, en 0x984D, no es un salto: es un `0xE9` dentro de un dibujo.

```
9840  A5 AA AA 17 55 69 55 0E
9848  A5 AA AA 17 55 E9 50 0B      <- ese E9
```

## Lo que no se ha comprobado

- **Cuántos finales distintos hay**, dicho arriba: no se ha buscado si la
  puntuación o el marcador cambian algo en el remate.
- El cotejo con la versión de Spectrum no puede decir nada sobre la segunda
  parte: el snapshot con el que se compara se capturó en el menú de la
  primera, así que la fase de a pie del original no está ahí.
- **Que las 335 rutinas tengan comentario no quiere decir que estén todas
  comprobadas en marcha.** Unas cuantas se sostienen sólo sobre la lectura del
  listado, y allí donde es así queda dicho.

## Por qué se publica así

Porque un desensamblado que dice claramente dónde está cada afirmación —y de
qué clase de evidencia cuelga— es útil, y uno que aparenta más de lo que sabe
es peor que nada: manda a quien venga detrás a buscar en el sitio equivocado.

El criterio de toda la serie es que cada afirmación se pueda contrastar con el
binario. Eso incluye las afirmaciones sobre lo que **no** se sabe: por eso las
cifras de cobertura salen del trazador y no de una impresión.
