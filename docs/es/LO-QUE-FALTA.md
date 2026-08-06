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

**3349 bytes, el 3,6 % de la cinta**, están declarados como «datos sin
clasificar». De cada uno se sabe dónde empieza, dónde acaba y qué medidas da
—racha media de bits iguales, entropía y cuántos valores distintos usa— pero no
qué son ni para qué se usan.

Eran 4089. **Se han identificado 1221**, y con ellos la parte de a pie se ha
quedado sin ni un solo rango sin clasificar: todos los que quedan están en el
bloque del juego de naves.

### Lo que resultaron ser

**656 bytes: el bloque de textos de la segunda parte** (0xB720). No hubo que
interpretar nada, se lee tal cual: los rótulos de redefinir teclas, el menú, el
mensaje de récord y la tabla de récords de fábrica, que empieza por *JAVIER
100000* y *JUAN C 080000* —los dos Arévalo, que firman los gráficos—. Y entre
los nombres de teclas están GRAPH, CODE y SELECT, que **son teclas del MSX y en
un ZX Spectrum no existen**: ese bloque no vino portado, se escribió aquí.

**162 bytes: la tabla de notas del chip de sonido** (0xE6E3). Son 81 palabras de
16 bits estrictamente decrecientes, y lo que las delata es que **cada una vale
exactamente el doble que la que está doce posiciones más allá** —la razón sale
2,0000 en las 69 comprobables—, que es la definición de una octava de doce
semitonos. Con el reloj del PSG del MSX, la primera da 32,70 Hz, que es el **do1
teórico**. La lee el intérprete de guiones de 0xE203: saca un byte, y si vale
menos de 0x80 es una nota y va a esta tabla; si no, es un comando. El ajuste es
al byte: 0xE6E3 + 81×2 cae justo donde acababa el rango.

**403 bytes que no eran datos, sino código.** Cuatro rutinas de pre-desplazado
de sprites en la segunda parte (0xB2A6), otra de 58 bytes (0xC804) y una de 83
en la parte de naves (0xDA72) que estaba repartida en tres rangos distintos.
Estaban clasificadas midiendo entropía; desensambladas salen limpias de punta a
punta, y los límites los ponen los `ret` del código ya trazado que hay a los
lados.

**Y una raya mal puesta.** El bloque de textos de la parte de naves empezaba
declarado en 0xDAD9, que es **la S de «HAS CONSEGUIDO»**: cortaba una cadena por
la mitad. Empieza en 0xDAC5, justo después del `ret` de 0xDAC4.

### El arranque de la fase a pie estaba mal, y arrastraba 3618 bytes

Éste es el error más grande que ha tenido el bloque de la segunda parte, y lo
destapó una partida jugada hasta el final del juego.

El fichero de puntos de entrada decía, sin disimulo: *«0x61D0 — el primer byte
del bloque, a falta de saber el arranque real»*. Era **una suposición**: 0x61D0
es donde el bloque se *carga*, no donde empieza a ejecutarse. Y de esa
suposición colgaba todo lo demás:

- a 38 bytes hay una **tabla de punteros** —palabras descendiendo de dos en dos,
  el 76 % apuntando dentro de los gráficos— que el trazador leía como código;
- a 57 bytes se topaba con un `C2 78 8A` leído a caballo entre dos entradas de
  esa tabla, o sea un `jp nz,8A78`, **y se metía dentro del dibujo**;
- y desde ahí desensamblaba **3542 bytes de gráficos** como instrucciones, con
  el `0xE9` del final figurando como el último salto ciego del proyecto.

El arranque de verdad se encuentra siguiendo al cargador. En el bloque de naves,
en cuanto la carga de cinta termina bien:

```
f7b0: ld a,001h / ld (0a529h),a
f7b5: jp 0a279h            <- aquí empieza la segunda parte
```

Y **0xA279 desensambla a un arranque de programa de manual**: corta las
interrupciones, se monta su propia pila con `ld sp,05b32h`, programa el chip
gráfico y escribe `JP 0xC46E` en 0xFD9F, que es **H.TIMI, el gancho de
interrupción del MSX**. La dirección que instala ahí, 0xC46E, es la misma que se
había identificado por separado mirando la forma de su epílogo: dos caminos
independientes que dan lo mismo.

Estaba escondido, además, dentro del rango que se declaraba como gráficos: ése
llegaba hasta 0xA2D2 y **se tragaba el arranque del programa**.

Consecuencia en las cifras: la cobertura de la fase a pie baja del 51,7 % al
35,0 %, porque desaparecen 3618 bytes que se contaban como código sin serlo. La
cifra empeora y el trabajo mejora.

### Y 367 bytes más que se contaban como código y no lo son

Buscando código automodificable apareció el error contrario. **Tres bloques de
variables estaban marcados como código**: 175 bytes en 0xED75 de la parte de
naves, y 17 en 0xC459 y 175 en 0xD068 de la de a pie. Llegan de la cinta a cero,
y 0x00 desensambla a `nop`, así que al caer el flujo dentro el trazador los
recorría uno a uno y los contaba como instrucciones.

Que son variables lo dice el propio listado, que **las lee y las escribe con
direccionamiento absoluto desde más de setenta sitios**. Una instrucción no se
lee byte a byte desde medio programa.

Uno de esos bytes hacía daño de verdad: el 0x10 de 0xC468 se leía como un `djnz`
y mandaba al trazador a un trozo de código por un camino que no existe. Al
declarar las variables como datos ese trozo se quedó huérfano, y resultó ser el
**epílogo del manejador de interrupción** de la segunda parte —21 bytes que
acaban en `ei / ret` y encajan al byte—, al que se entra por puntero y por eso
no se alcanza siguiendo el flujo. Ahora está declarado como lo que es.

Por eso los bytes de código bajan y los de datos suben respecto a lo publicado
antes: la cifra de antes estaba inflada.

### Los que quedan, y una vía que ya se puede cerrar

De los 3349 que siguen sin identificar, **1415 están en 0x4952-0x563F, y ahí el
original no puede ayudar**. No por falta de haberlo intentado: en el ZX Spectrum
esas direcciones son la **memoria de pantalla**, 6144 bytes de píxeles y 768 de
atributos. Allí no hay juego que mirar, hay imagen.

Y es justo la razón por la que aquí hay algo: esta versión tiene esas
direcciones libres, porque en el MSX la memoria de vídeo está detrás del chip
gráfico y no se direcciona. Es lo mismo que obligó a añadir el buffer de
pantalla de 0x4B40. O sea que esos bytes son, por construcción, de los que menos
posibilidades tienen de venir del otro lado. Eso no los identifica; lo que hace
es cerrar una vía **con un motivo**, en vez de dejarla como «sin probar».

Están repartidos en rangos pequeños. Se pueden listar con:

```sh
grep "datos sin clasificar" src/juego.notes src/parte2.notes
```

Y se pueden volver a medir con `tools/clasifica_huecos.py`, que es de donde
salió su clasificación.

## Lo que falta por trazar

El presupuesto mide bytes; la cobertura mide otra cosa. Del código de los dos
bloques grandes, el trazador alcanza esto:

    juego de naves    25,7 %
    parte de a pie    35,0 %

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

**Los cuatro están resueltos**, y por primera vez no queda ninguno pendiente.
El de 0xE230 es el despachador del intérprete de guiones, y su tabla de 35
punteros se lee del binario. Los otros tres —0xCB99 y 0xD6B8 en la parte de
naves, 0xC544 en la de a pie— no se resolvieron leyendo código sino jugando con
el emulador delante y anotando el destino cada vez que el salto se ejecutaba,
porque las estructuras que llevan esos punteros vienen a 0xFF en la cinta y se
rellenan jugando.

### El quinto no existía

Aquí figuraba un quinto, en 0x984D, «sin resolver» porque no se disparaba nunca.
Ahora se sabe por qué: **no es un salto**. Es un `0xE9` dentro de un dibujo:

```
9840  A5 AA AA 17 55 69 55 0E
9848  A5 AA AA 17 55 E9 50 0B      <- ese E9
```

No había que buscarle destino, había que retirarlo. Y detrás de él estaba el
error más grande que ha tenido este bloque, contado en la sección siguiente.

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
3349 bytes están acotados uno a uno en vez de barridos bajo la alfombra, y por
eso las cifras de cobertura salen del trazador y no de una impresión.

## En qué se está trabajando ahora

Esto no está parado. Las líneas abiertas, por orden de lo que más rendiría:

- **Los 3349 bytes que siguen sin clasificar.** La vía del cotejo estuvo cerrada
  mientras la herramienta buscaba cada sección con una aguja de 32 bytes y se
  quedaba con la primera coincidencia, sin exigir que fuera única ni que el
  desplazamiento encajara con el del resto: ahí se generó la contaminación. Ya
  está reescrita —ahora alinea los dos binarios primero y sólo después mira los
  nombres— y de ella salió la tesis que hoy sostiene el proyecto. Sobre esa base
  hay una segunda herramienta, `tools/coteja_equivalencias.py`, que mira qué
  había en el original en la dirección **equivalente** aunque los bytes no
  coincidan. No adopta nada por su cuenta a propósito: lo que saca son pistas
  para mirar a mano, que es como se identificaron los bytes de arriba.
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

Cuando esos 3349 bytes se identifiquen, esta página se hará más corta.
