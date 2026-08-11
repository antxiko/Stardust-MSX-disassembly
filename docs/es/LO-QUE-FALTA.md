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

Lo que **no** quiere decir es que se sepa para qué sirve cada byte. Durante
casi todo el proyecto hubo rangos cuyo nombre era, literalmente, «datos sin
clasificar»: contaban como explicados en el sentido de estar medidos y
acotados, no en el de entenderse. Confundir las dos cosas sería vender humo.
Esa categoría está hoy vacía, y abajo se cuenta cómo se vació.

Aquí está el desglose de verdad.

## Lo que faltaba por identificar, que ya no falta

**La categoría «datos sin clasificar» se ha quedado vacía.** Llegó a tener
4089 bytes; hoy, cada byte de la cinta tiene nombre: o es código que el
trazador alcanza, o cae en un rango que dice qué es y cómo se sabe.

El camino, por tandas: primero se identificaron 1221; después **1415 de una
sola tacada**, cuando el tramo grande del principio del bloque resultó ser el
marco de la pantalla de juego; después otros **1141**, el relleno de la
grabación que remata el bloque; después **252**, los instrumentos del
intérprete de sonido; y los **541 últimos** cayeron en una tarde: 481 eran el
pool de sprites de la fase a pie, 4 los colores de esa fase, uno el `ret`
huérfano de una rutina de tiles, y los 55 del bloque de 0xCA5F resultaron ser
18 variables con nombre y 37 bytes muertos del master. Las historias, abajo.

### Lo que resultaron ser

**656 bytes: el bloque de textos de la segunda parte** (0xB720). No hubo que
interpretar nada, se lee tal cual: los rótulos de redefinir teclas, el menú, el
mensaje de récord y la tabla de récords de fábrica, que empieza por *JAVIER
100000* y *JUAN C 080000* —los dos Arévalo, que firman los gráficos—. Y entre
los nombres de teclas están GRAPH, CODE y SELECT, que **son teclas del MSX y en
un ZX Spectrum no existen**: ese bloque no vino portado, se escribió aquí.

**192 bytes: la tabla de notas del chip de sonido** (0xE6E3). Son palabras de
16 bits estrictamente decrecientes, y lo que las delata es que **cada una vale
exactamente el doble que la que está doce posiciones más allá** —la razón sale
2,0000 en las 69 comprobables—, que es la definición de una octava de doce
semitonos. Con el reloj del PSG del MSX, la primera da 32,70 Hz, que es el **do1
teórico**. La lee el intérprete de guiones de 0xE203: saca un byte, y si vale
menos de 0x80 es una nota y va a esta tabla; si no, es un comando.

Aquí estuvo publicada como **81 notas y 162 bytes**, y se quedaba corta. Son
**96, ocho octavas justas**: 0xE6E3 + 96×2 = 0xE7A3 cierra al byte contra la
tabla que empieza ahí, y los 30 bytes que sobraban resultaron ser 15 periodos
más, los más agudos, siguiendo la misma serie decreciente. Lo confirma la
propia música del juego, que usa la nota número 84 — imposible si sólo hubiera
81.

**1415 bytes: el marco de la pantalla de juego, viajando dentro del bloque.**
El principio del bloque (0x47A0-0x5A9F) no eran «gráficos» a bulto: los
primeros 256 bytes son el **logo STARDUST**, un bitmap de 128×16 a 16 bytes
por fila —dibujado a ese ancho se lee el nombre; el animador del arranque lo
copia con dieciséis `ldi` por fila desde `ld hl,047a0h`—, y detrás van los
**patrones** (0x48A0) y los **colores** (0x51A0) del **marco**: el cuadro
decorado, con su HUD, que rodea el área de juego. 0x900 bytes de cada, que la
rutina de 0xEF28 copia a la memoria de vídeo en dos filas de carácter por
tercio más cuarenta y ocho tiras; la tabla de nombres del SCREEN 2 —que el
juego hereda de la pantalla de carga— es la que recoloca después esos 288
caracteres en el borde de la pantalla. La
aritmética cierra sola: 0x48A0 + 0x900 = 0x51A0, y 0x51A0 + 0x900 = 0x5AA0. Y
el contraste con el emulador también: el 97,4 % de esos bytes aparece
idéntico en la memoria de vídeo real con el juego en marcha, y el resto es lo
que el juego pinta encima. Dentro del tramo vivían además dos rangos
etiquetados «colores de tiles» por su firma de nibble: la firma era verdad,
pero son los colores del marco, no de los tiles del juego.

**490 bytes: el pool de sprites de la fase a pie** (0x6555). Dos rangos «sin
clasificar» y una «tabla» de 9 bytes eran cortes arbitrarios en mitad de las
entradas del pool: sprites de **16×16 con máscara, 64 bytes cada uno**, el
mismo formato que los de la fase de naves. La geometría la fija el código del
derrumbe del protagonista —frame×64 + 0x6555, copiado al slot de trabajo en
0x7D55, que es exactamente 0x6555 + 0x60×64— y dibujadas las entradas salen
los enemigos andantes limpios, con sus poses.

**120 bytes que no eran datos, sino código: los comportamientos de los tiles
especiales.** Un despachador en 0xC116 asigna a ciertos índices de tile de
las zonas (0x30 a 0x5D) una rutina de comportamiento, guardándola como
puntero en el objeto; como a esas rutinas solo se entra por puntero, el
trazador no las veía, y sus cabezas figuraban como «relleno o resto» o
«tabla». Las diez se sembraron como puntos de entrada con su evidencia
—cada una aparece cargada con un literal en el despachador o instalada por
el estado anterior de la cadena— y la cobertura del bloque de naves subió
del 25,7 % al 26,0 %.

**4 bytes: los colores de la fase a pie** (0xC46A). Cuatro bytes de color
—E1, B1, A1 y 71, cuatro tintas sobre negro— entre los que el arranque del
nivel elige **al azar** (`and 3` sobre el generador). Por eso la fase de a
pie no siempre se ve del mismo color.

**37 bytes muertos en 0xCA5F.** Tienen estructura de variables —valores
pequeños, del 0 al 10— pero nadie los toca: sin referencias ni punteros en el
binario, y con watchpoints de lectura y escritura **a cero** sobre la partida
completa de 38 minutos más 350 segundos de otra. Residuo de la máquina del
master, como el relleno del final del bloque; qué fueron antes de morir no se
sabe.

**252 bytes: los instrumentos del intérprete de sonido** (0xE5E2). El rango
estaba pegado por delante a la tabla de notas, y resultó ser su vecino
natural: una tabla de **16 instrumentos de 15 bytes** que un comando del
intérprete copia al estado del canal cuando el guion lo pide (la dirección se
calcula como 0xE5E2 + n×15), y detrás otra de entradas de 6 bytes para el
canal de efectos. Cierra al byte por los dos lados: el código vecino acaba en
un `ret` en 0xE5E1, y 0xE5E2 + 16×15 = 0xE6D2, donde empieza la segunda
tabla, que muere donde empiezan las notas.

**1141 bytes: el relleno de la grabación del master.** El tramo que remata el
bloque del juego (0xF972-0xFDE6, y la «tabla» de 170 bytes que lo precedía,
que era lo mismo) es **RAM sin inicializar volcada tal cual al grabar la
cinta**: 00 y FF alternados de dos en dos, con una marca y un volteo de fase
cada 128 bytes exactos —el aspecto de una DRAM recién encendida— y una decena
de bytes que la máquina del estudio ya había tocado. El bloque acaba así justo
debajo del buzón de parches de 0xFDE8. La prueba la dio el emulador, sobre la
**partida completa de 38 minutos**: las únicas escrituras al tramo en toda la
partida son las cuatro del arranque con las que el juego instala sus ganchos
de interrupción, y las únicas lecturas, la ejecución de esos ganchos. Nadie
usa el resto ni una vez.

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

### Los que quedan, y una vía que se cerró y luego tuvo gracia

Buena parte de lo que quedaba estaba en 0x4952-0x563F, **y ahí el original no
podía ayudar**: en el ZX Spectrum esas direcciones son la **memoria de
pantalla**, 6144 bytes de píxeles y 768 de atributos. Allí no hay juego que
mirar, hay imagen. La vía del cotejo se cerró en su día con ese motivo.

Y el desenlace tiene su gracia: cuando por fin se identificó el tramo, resultó
que **aquí también había una imagen** —el marco de la pantalla de juego, contado arriba—.
En el original, esas direcciones muestran una pantalla; en la conversión,
guardan una.

Los cinco rangos que quedan se pueden listar con:

```sh
grep "datos sin clasificar" src/juego.notes src/parte2.notes
```

Y se pueden volver a medir con `tools/clasifica_huecos.py`, que es de donde
salió su clasificación.

## Veinte «rutinas» que eran música, y 1.386 bytes que dejan de ser código

De los 35 comandos que se publicaron para el intérprete de sonido, **veinte no
existen**. Eran las **melodías del juego**, escritas en el lenguaje del propio
intérprete y desensambladas como si fueran instrucciones.

Lo destapa el comando 0x8C, que es el *call* del intérprete: coge un número de
frase, guarda la dirección de vuelta en una pila que hay por canal, y salta a
la frase leyéndola de **una tabla que está en 0xE7C1**. Y 0xE7C1 es
exactamente 0xE7A3 + 15×2. Es decir: la tabla de comandos tiene **quince**
entradas y muere ahí; lo que sigue es **otra tabla**, la de las melodías. Al
leerlas como una sola de 35, los veinte punteros de música entraron en el
disassembler como si apuntaran a código.

El otro extremo lo cierra el comando 0x8D, que es el *return*: recupera la
dirección de vuelta de esa misma pila. Por eso **todas las frases terminan en
`8D`**. Las canciones no: terminan en `8B`, que es el comando que limpia el
canal. Son dos niveles, canciones que llaman a frases — la misma idea que el
diccionario recursivo con el que se comprimen los mapas de nivel.

Que esos 1.420 bytes son música y no código se comprueba leyéndolos con la
gramática del intérprete, y encajan: de todos los bytes altos del tramo,
**todos son comandos válidos salvo quince**, y esos quince son argumentos que
se identifican uno a uno. En 1.420 bytes de código Z80 de verdad aparecerían
`ret`, `call` o los prefijos de IX a cada paso; aquí no hay ni uno. El comando
más repetido es precisamente el que llama a las frases, 208 veces.

La consecuencia en las cifras es directa y va en la dirección incómoda:
**1.386 bytes dejan de contar como código**, la cobertura del bloque de naves
baja del 26,0 % al 23,0 %, y las rutinas identificadas quedan en 106. El
presupuesto sigue cerrando al 100 %, porque esos bytes no desaparecen: cambian
de columna.

## La cifra de rutinas bajó de 164 a 106, y es la misma confusión de siempre

Esta página ya contaba que la cifra de rutinas estuvo publicada como **1956**,
que era el número de **etiquetas** del trazador: todo destino de salto, incluidos
los saltos internos de una misma rutina. Se corrigió contando sólo lo que
alguien había averiguado a mano.

Pues la misma confusión volvió a colarse, en pequeño. Los ficheros de puntos de
entrada recogen dos clases de cosas: las rutinas que se han leído y entendido,
y los puntos **medidos en el emulador** —dónde estuvo el contador de programa,
dónde saltó un aviso de escritura—. Los segundos son evidencia muy útil, pero
casi nunca son el principio de una rutina: un aviso puesto sobre el puerto de
vídeo informa de la dirección del `out`, y ese `out` está **dentro del bucle**
de dibujado, no en la cabecera.

De los puntos declarados, **39 son etiquetas interiores**: sitios a los que
se llega cayendo desde la instrucción de arriba. Rutinas de verdad hay **106**,
y es la cifra que se publica ahora.

Lo caza una herramienta nueva, `tools/check_interiores.py`, con una regla
sencilla: si a un punto se puede caer desde la instrucción anterior, no es una
cabecera. Y una lección de su propia construcción, porque la primera versión
señaló 61 y cinco eran mentira: hay que comprobar que la instrucción de arriba
esté **pegada**. Cuando en medio hay datos —los opcodes del intérprete de
guiones tienen sus tablas delante, a 72 bytes— no se puede caer desde ninguna
parte. Una herramienta de verificación que no se verifica a sí misma sirve de
poco.

Ahora la comprobación corre en el Makefile y el test que vigila la cifra la
usa, así que la cifra publicada y la comprobación no pueden separarse.

## Lo que falta por trazar

El presupuesto mide bytes; la cobertura mide otra cosa. Del código de los dos
bloques grandes, el trazador alcanza esto:

    juego de naves    23,0 %
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
bytes sin clasificar estuvieron acotados uno a uno mientras existieron, y por
eso las cifras de cobertura salen del trazador y no de una impresión.

## En qué se está trabajando ahora

Esto no está parado. Las líneas abiertas, por orden de lo que más rendiría:

- **Comentar las rutinas** una a una. Están acotadas y con nombre; falta
  explicar qué hace cada una.

Si tienes una idea sobre cualquiera de esas cosas, o quieres mirarlo por tu
cuenta, todo lo necesario está en el repositorio: los listados, las
herramientas de medida y los ficheros de notas donde se anota cada hallazgo.

Los bytes por identificar se acabaron, y esta página, como estaba prometido,
se ha hecho más corta. Lo que queda es de otra clase: el código al que no se
llega siguiendo el flujo, y las rutinas por comentar.
