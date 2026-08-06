# Lo que falta

Esta página existe para que el «100 %» de la portada no se lea como lo que no
es. **Este desensamblado no está terminado, y se sigue trabajando en él.**

Lo que hay aquí es el estado a día de hoy, con las cuentas exactas de lo que
falta. Se publica así a propósito: es más útil un trabajo a medias que dice por
dónde va que uno que aparenta estar cerrado.

## Qué significa ese 100 %, y qué no

El presupuesto de bytes dice:

    TOTAL 93861 bytes, 93861 explicados (100.00%), 0 sin explicar

Eso quiere decir una cosa muy concreta: **cada byte de la cinta tiene dueño**. O
es código que el trazador alcanza siguiendo el flujo de verdad, o cae dentro de
un rango declarado con un nombre y una explicación de cómo se sabe.

Lo que **no** quiere decir es que se sepa para qué sirve cada byte. Hay rangos
cuyo nombre es, literalmente, «datos sin clasificar», y esos cuentan como
explicados en el sentido de que están medidos y acotados, no en el de que se
entiendan. Confundir las dos cosas sería vender humo.

Aquí está el desglose de verdad.

## Lo que falta por identificar

**4713 bytes, el 5,0 % de la cinta**, están declarados como «datos sin
clasificar». De cada uno se sabe dónde empieza, dónde acaba y qué medidas da
—racha media de bits iguales, entropía y cuántos valores distintos usa— pero no
qué son ni para qué se usan.

De esos, **5305 llegaron aquí desde el otro lado**: figuraban como código en la
primera versión publicada de esta página, y sólo estaban trazados porque el
trazador venía sembrado con puntos de entrada que caían dentro de los gráficos.
Al quitarlos se quedaron sin dueño. Antes de etiquetarlos se muestreó el
contador de programa de una partida real de 900 segundos: **25 de esos 26 rangos
no se ejecutaron ni una vez**, y el único donde cayó el contador fue en las dos
direcciones de los ganchos del sistema, que el juego reescribe al arrancar. Así
que no son «código al que no se llega»; pero tampoco se sabe qué son.

Están repartidos en rangos pequeños dentro de los dos bloques grandes. Se pueden
listar con:

```sh
grep "datos sin clasificar" src/juego.notes src/parte2.notes
```

Y se pueden volver a medir con `tools/clasifica_huecos.py`, que es de donde
salió su clasificación.

## Lo que falta por trazar

El presupuesto mide bytes; la cobertura mide otra cosa. Del código de los dos
bloques grandes, el trazador alcanza esto:

    juego de naves    25,9 %
    parte de a pie    51,3 %

El resto son datos, sí, pero también hay **código al que no se llega siguiendo
el flujo**: rutinas a las que solo se entra por saltos calculados, por tablas o
por punteros que se rellenan jugando. De algunas ya se sabe que existen porque
el emulador las pilló ejecutándose; de otras, no se sabe.

La medida exacta de esa ceguera son los **saltos indirectos**: `jp (hl)`, donde
el destino no está escrito en el binario sino en un registro, y el trazador se
para porque no puede saber a dónde va. Hay **cinco**, tres en la parte de naves
y dos en la de a pie, y salen listados en el propio trazado:

```sh
python3 -c "import json;print(json.load(open('work/juego.trace.json'))['blind'])"
```

De los cinco hay **cuatro resueltos**. El de 0xE230 es el despachador del
intérprete de guiones, y su tabla de 35 punteros se lee del binario. Los otros
tres —0xCB99 y 0xD6B8 en la parte de naves, 0xC544 en la de a pie— no se
resolvieron leyendo código sino jugando con el emulador delante y anotando el
destino cada vez que el salto se ejecutaba, porque las estructuras que llevan
esos punteros vienen a 0xFF en la cinta y se rellenan jugando.

Queda **uno sin resolver**: el de 0x984D, en la segunda parte, que **no llegó a
dispararse** en los 300 segundos de partida que se le dieron. Ni siquiera está
confirmado que se use.

## Lo que no se ha comprobado

- La segunda parte del juego se ha visto arrancar y correr, pero **no se ha
  jugado entera**. Lo que hace de la mitad en adelante está sin mirar.
- El cotejo con la versión de Spectrum no puede decir nada sobre esa segunda
  parte: el snapshot con el que se compara se capturó en el menú de la primera,
  así que la fase de a pie del original no está ahí.
- Los comentarios de los listados cubren las rutinas principales y las zonas de
  datos, pero **la mayoría de las rutinas no tienen todavía un comentario que
  explique qué hacen**. Tienen nombre y están acotadas; no es lo mismo.

## Por qué se publica así

Porque un desensamblado a medias que dice claramente por dónde va es útil, y uno
que aparenta estar completo es peor que nada: manda a quien venga detrás a
buscar en el sitio equivocado.

El criterio de toda la serie es que cada afirmación se pueda contrastar con el
binario. Eso incluye las afirmaciones sobre lo que **no** se sabe: por eso los
4713 bytes están acotados uno a uno en vez de barridos bajo la alfombra, y por
eso las cifras de cobertura salen del trazador y no de una impresión.

## En qué se está trabajando ahora

Esto no está parado. Las líneas abiertas, por orden de lo que más rendiría:

- **Los 4713 bytes sin clasificar.** La vía del cotejo con la versión de
  Spectrum está de momento cerrada: la herramienta que lo hacía buscaba cada
  sección con una aguja de 32 bytes y se quedaba con la primera coincidencia,
  sin comprobar que fuera única ni que el desplazamiento resultante encajara con
  el del resto, y ahí es donde se generó la contaminación. Hasta que esa
  búsqueda esté arreglada, nada del cotejo vuelve al proyecto.
- **Seguir jugando a mano.** Las pantallas que un arnés no alcanza —fin de
  partida, entrada de récord, demo, menú y redefinir teclas— ya se han visitado
  en una sesión grabada, y de ahí salieron 22 rutinas y la tabla de teclas. Lo
  que queda por visitar de la misma forma es la segunda parte, la de a pie.
- **Jugar la segunda parte entera**, con el trainer puesto, y capturar sus
  rutinas como se hizo con la primera. Ahí es donde más código sin trazar queda.
- **El salto indirecto de 0x984D**, que sigue sin dispararse y sin destino
  conocido.
- **Comentar las rutinas** una a una. Están acotadas y con nombre; falta
  explicar qué hace cada una.

Si tienes una idea sobre cualquiera de esas cosas, o quieres mirarlo por tu
cuenta, todo lo necesario está en el repositorio: los listados, las
herramientas de medida y los ficheros de notas donde se anota cada hallazgo.

Cuando esos 4713 bytes se identifiquen, esta página se hará más corta.
