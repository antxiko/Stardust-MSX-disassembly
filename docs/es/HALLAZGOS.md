# Hallazgos

Stardust es una conversión del ZX Spectrum, y eso se sabía. Lo que no se
esperaba al abrir la cinta es **hasta dónde llega la conversión**: no se
trajeron los gráficos y rehicieron lo demás, se trajeron el sistema de
grabación, la rutina de carga y la forma de dibujar. Lo que sigue es lo que
apareció al desmontarla, cada cosa con la prueba que la sostiene.

## La cinta no es una cinta de MSX

Un juego de MSX se graba en bloques **KCS**, que es el formato del sistema: lo
escribe la propia BIOS y lo lee la propia BIOS. Los otros títulos de Topo Soft
para esta máquina lo hacen así.

Stardust, no. Sus cuatro bloques de datos son **bloques del ZX Spectrum**, con
la estructura de allí: un byte de bandera, los datos, y un byte final que es el
XOR de todo lo anterior. Los cuatro traen ese checksum correcto, comprobado uno
por uno; es la única verificación de integridad que lleva la cinta.

Y el cargador es una **reimplementación de LD-BYTES**, la rutina de carga de la
ROM del Spectrum, con su mismo interfaz de registros:

    ld ix,047a0h    ; IX = donde va
    ld de,0b647h    ; DE = cuantos bytes
    ld a,000h       ; A  = la bandera que se espera
    scf             ; carry activado = cargar, no verificar
    call 0405ch

Quien haya programado un Spectrum reconoce esa llamada: es la de `0x0556` de su
ROM, parámetro por parámetro.

## Los 64K que el Spectrum tiene y el MSX no

Antes de cargar nada, el cargador hace algo que en un juego de MSX normal no
haría falta: **busca RAM y la mapea en las páginas 1 y 2**.

    ld hl,04000h / call sub_d30fh
    ld hl,08000h / call sub_d30fh

La rutina de `0xD30F` prueba a escribir en cada ranura con `ENASLT` (la llamada
`0x0024` de la BIOS) hasta encontrar RAM. El motivo es que el Spectrum tiene 48K
planos de RAM y el MSX no: en el MSX, la mitad baja de la memoria la ocupa la
ROM del BASIC. Para que el juego portado encuentre la memoria donde la espera,
hay que quitar la ROM de en medio.

## El cargador trae una puerta trasera para trainers

Esta es la mejor. El cargador, antes de arrancar el juego, copia **94 bytes**
desde 0xDAC0 a 0xFDE8 —memoria alta, donde nada los va a machacar— y luego mira
qué hay en ellos:

    4040: ld hl,0fde8h / ld b,003h
    4045: ld a,(hl) / cp 0c9h / jp nz,0bd85h   ; ¿tres 0xC9 de firma?
    404e: ld b,(hl)                            ; B = cuantos parches
    4050: ld e,(hl) / ld d,(hl) / ld a,(hl)    ; direccion y valor
    4056: ld (de),a / djnz 4050                ; aplicarlos
    4059: jp 0bd85h                            ; y ahora si, al juego

Si esos 94 bytes empiezan por tres `0xC9`, el cargador los trata como una lista
de parches y los aplica sobre el juego recién cargado. Es **un aplicador de
POKEs de fábrica**, metido en el cargador comercial del juego.

Y la cuenta dice para cuántos: 3 bytes de firma + 1 de contador + **30 parches
de 3 bytes cada uno = 94**. Está dimensionado exactamente para treinta.

Eso explica por qué los cargadores de las revistas de la época funcionaban tan
bien con este juego. El de *Input MSX* número 19 escribe con
`FOR I=56000 TO 56012`, y 56000 es 0xDAC0: el buzón. Sus tres parches, leídos
del binario antes de aplicarlos:

    0xC06E/6F:  38 1F (jr c,+31)  ->  18 EC (jr -20)
    0xF7B1:     01 -> 00

El primero convierte un salto condicional en incondicional, saltándose una
comprobación que va justo detrás de `ld a,(0c188h) / cp 004h`. El segundo cambia
el `1` de un `ld a,001h` por un `0`. Aplicados por el propio cargador del juego,
la nave aguantó dieciséis minutos seguidos sin morir.

## Cómo pide el juego la segunda parte

Al superar la última zona de naves sale una pantalla que dice

    FELICIDADES
    HAS CONSEGUIDO PENETRAR LAS DEFENSAS DE LA NAVE INSIGNIA
    PERO LO PEOR AUN NO HA LLEGADO

y el juego vuelve a la cinta a por la segunda parte, la de a pie.

Lo interesante es **cómo** lo hace. La rutina de carga del cargador sobrevive
toda la partida en la página 1 —el juego se carga a partir de 0x47A0 y no la
pisa— así que lo lógico sería que la llamara. Pues no. El juego trae la suya, y
esa rutina es **un segundo port de la LD-BYTES del Spectrum**, la misma que el
cargador de cinta ya había reimplementado por su cuenta:

    f7f6: ld hl,0f89fh / push hl    ; empuja a mano la direccion de vuelta
    f7fb: ld a,008h / out (0abh),a  ; enciende el MOTOR de la cinta
    f7ff: ld a,00eh / out (0a0h),a  ; registro 14 del PSG, el del bit de cinta
    f804: inc d / ex af,af' / dec d / di      ; LD-BYTES, instruccion a instruccion
    f808: ld a,005h  ...  ld hl,00415h        ; y hasta su constante, 0x0415
    f848: ld (ix+000h),l            ; cada byte leido, guardado a traves de IX
    f887: in a,(0a2h) / cpl / xor c ; lee el bit de cinta por el PSG
    f893: ld a,r / and 00fh / out (099h),a    ; y parpadea el borde, por el VDP
                                              ; donde el Spectrum usaba un puerto

Tampoco es una copia de la del cargador: se buscó su firma byte a byte en los
tres bloques y no aparece en ninguno.

**Cómo se zanjó.** Partiendo de un savestate cogido en la pantalla de
FELICIDADES y muestreando el contador de programa cada dos milisegundos durante
toda la carga: **84.441 muestras, todas y cada una dentro de 0xF7F6-0xF89E. Ni
una en la ROM, ni una en la página 1.** Mientras tanto IX —el puntero por el que
guarda ese `ld (ix+000h),l`— recorre de 0x61D0 a 0xD674, que es exactamente el
último byte de un bloque de 29.861. Ni la BIOS ni el cargador pintan nada aquí.

Lo que queda en memoria después coincide con el bloque de la cinta al **99,78 %**:
66 bytes de 29.861, en treinta rachas cortas, y son las variables que la segunda
parte ya había escrito cuando se hizo el volcado —entre ellas los tres estados
de canal de sonido, de 46 bytes, en 0xD068, 0xD096 y 0xD0C4.

Esto figuró aquí una temporada como contradicción abierta, porque al reproducir
una partida grabada un punto de interrupción en 0xF7F6 no saltaba nunca. La
explicación resultó ser de lo más prosaica: esa grabación *empieza* con el
cargador ya en marcha —su primer fotograma tiene el contador de programa en
0xF849, dentro de la rutina—, así que un punto de interrupción en la entrada ya
no tiene nada que cazar. El 0xF89F que había en la pila solo puede haberlo
puesto el `push hl` de 0xF7F9.

## Dos motores distintos en una cinta

Las dos partes del juego no comparten motor, y se ve en cómo llevan a sus
criaturas. En la parte de naves cada entidad apunta en su estructura de 8 bytes
la rutina que la gobierna, y el juego salta ahí con un `jp (hl)`: capturando
esos saltos con el juego en marcha, los IX van de 8 en 8 (0xCB3A, 0xCB42 ·
0xC8D8, 0xC8E0…).

La parte de a pie no trata así a sus enemigos: viven en **tablas de 5 bytes por
objeto** —los andantes en 0xACE4, cuatro como máximo; los voladores en 0xACF9;
los dos tiros de la torreta en 0xAD04— y no llevan rutina apuntada, los mueven
bucles fijos, uno por especie.

Aquí estuvo publicado "los IX van de 46 en 46: entidades casi seis veces
mayores", por tomar por enemigos lo que despacha el `jp (hl)` de 0xC544. La
medida era buena y la lectura no. Y ahora, además, se sabe qué son de verdad:
**los tres canales del intérprete de sonido**.

Lo dice el propio código, y de la forma más simple: la rutina que arranca un
sonido recibe el número de canal, lo **multiplica por 46** y le suma una base
para llegar al estado de ese canal. Las dos partes del juego llevan esa rutina,
idéntica salvo la base:

    naves    and 07fh / ld de,0002eh / call ... / ld de,0ed75h
    a pie    and 07fh / ld de,0002eh / call ... / ld de,0d068h

Y 0xD068 es exactamente donde caían los IX del misterio. La cuenta cierra por
los dos lados: tres canales de 46 bytes desde 0xED75 terminan en 0xEDFF, que es
justo la dirección que el código carga para las variables del intérprete.

Así que ese `jp (hl)` no despachaba entidades: despachaba **comandos de
música**. Es el mismo intérprete de las dos partes, con sus tres canales.

Lo que sí comparten es el oficio de dibujar. Comparando 40 bytes de la rutina de
sprites de una parte con la de la otra, **solo difieren seis**, y tres de ellos
son `and (hl)` contra `or (hl)`. Es la técnica del Spectrum, que no tiene
sprites por hardware: se desplaza el dibujo bit a bit con una tira desenrollada
de `adc hl,hl`, se abre hueco con AND y se pinta con OR.

## Lo que el MSX obligó a cambiar

Hay una diferencia de fondo entre las dos máquinas que la conversión no pudo
esquivar. El Spectrum escribe **directamente** en su memoria de pantalla, que es
RAM normal en 0x4000. En el MSX la memoria de vídeo está detrás del chip gráfico
y no se puede direccionar: hay que enviarla byte a byte por un puerto.

Por eso esta versión lleva algo que el original no necesita: un **buffer de
pantalla** en RAM, y una rutina que lo vuelca. El buffer va de **0x4000 a
0x4EFF: 3.840 bytes, 24 de ancho por 160 de alto**, y el volcado lo pasa a la
VRAM en **tres bandas** —0x4000 con 56 filas, 0x4540 con 64 y 0x4B40 con 40—,
una por cada llamada de la rutina, cada una a su tercio del SCREEN 2. Lo dice
el código (las tres llamadas de 0xF3DC, contiguas y cerrando al byte) y lo
confirma el emulador, donde esa rutina hizo **3.252.480 escrituras** con el
puntero recorriendo exactamente 0x4000-0x4EFF.

**Los ejes estuvieron publicados al revés**, y merece contarse porque el error
se propagó. El `ld b,028h` del volcado se leyó como «40 columnas», pero es el
bucle interior y recorre el buffer a saltos de 24: recoge 40 bytes de una misma
columna. Quien cuenta columnas es el exterior, `ld c,018h`, que avanza de uno en
uno 24 veces.

Lo caza dibujarlo: de 24 en 24 sale la tabla de récords legible; de 40 en 40,
ruido. Y encaja con lo que se ve jugando, que es de donde salió la duda: 24
bytes son 192 píxeles, más estrecho que la pantalla —por eso el marco de los
lados no se mueve—, y lo que sobra está a lo alto, que es por donde scrollea.

## La fase de a pie tiene su propia demo, y su propia partida grabada

La demo de la parte de naves no es una máquina jugando: son **869 bytes de
partida grabada**, un byte por fotograma. La fase de a pie tiene la suya, y no
podría ser de otro modo: la grabación de las naves está en 0xBA20 y su lector en
0xC1AF, y **las dos direcciones caen dentro de 0x61D0-0xD674**, o sea que la
segunda parte las machaca al cargarse.

La suya empieza en **0x9FF3** y son **646 bytes**, que a 50 Hz son 12,9 segundos.
El sitio lo dice el propio código —`ld hl,09ff3h` en 0xA3FF— y el corte se ve a
simple vista, porque justo antes hay dibujo:

```
9FE3  55 55 55 55 AA AA AA AA 55 55 55 55 AA AA AA AA   <- damero, dos valores
9FF3  00 00 00 00 00 00 00 00 ...                       <- ya no
```

Los 646 bytes usan 17 valores distintos, **todos pares y ninguno mayor de 0x1E**:
es la máscara de controles, un byte por fotograma.

Y lo interesante es **cómo se enciende**. En 0xA688 hay una llamada cuyo operando
se reescribe desde dos sitios:

```
a313: ld hl,0a6fch / ld (0a689h),hl   <- partida normal: lee los mandos
b6ca: ld hl,0a6eeh / ld (0a689h),hl   <- demo: lee la grabación
```

La misma llamada, dos orígenes, conmutados parcheando el código. Y el rótulo
DEMO que parpadea abajo a la derecha **no consulta ningún indicador**: le
pregunta a la instrucción parcheada.

```
a4d1: ld a,(0a689h)   ; el operando de esa llamada
a4d4: cp 0eeh         ; ¿apunta a 0xA6EE, el lector de la grabación?
a4d6: jr nz,...       ; si no, no estamos en demo
```

Esto apareció porque un jugador se pasó el juego y contó que, tras la tabla de
récords, arrancaba una demo **de la fase a pie**. El lector estaba dentro de un
rango que este proyecto tenía etiquetado como «tabla».

## Lo que decía aquí sobre la música, y por qué ya no

Aquí se afirmaba que las tablas de música se habían portado enteras, con 754
bytes idénticos a los de la versión de Spectrum en 0xAB0E. **Se retira.**

Esa coincidencia la daba la misma herramienta de cotejo cuya búsqueda resultó
estar mal, y 0xAB0E cae dentro del rango que este proyecto declara como sprites
(0xA560-0xBA20). O sea que el «hallazgo» consistía en encontrar dibujo donde se
buscaba código, que es exactamente el fallo que contaminó el trazado entero.

Que las dos partes del juego suenan parecido se puede seguir mirando —y hay una
rutina de sonido identificada en el binario de MSX—, pero la afirmación fuerte,
la de los 754 bytes, no se sostiene hasta rehacer el cotejo con una búsqueda que
exija coincidencia única.

## La misma letra, nítida o transparente

En la tabla de récords el texto sale con los píxeles separados, como si fuera
medio transparente, y en cambio el rótulo `DEMO` se ve totalmente nítido.
Parecen dos tipografías. Es la misma rutina, y la diferencia está hecha
**parcheando el código al vuelo**.

La rutina que dibuja un carácter lo hace a doble altura: cada línea de la fuente
se pinta dos veces, y cada copia va enmascarada con un patrón distinto.

```
d4d0: ld a,(de) / and 055h / or (hl) / ld (hl),a / add hl,bc
      ld a,(de) / and 0aah / or (hl) / ld (hl),a / add hl,bc
```

`0x55` y `0xAA` son `01010101` y `10101010`: píxeles alternos, y desplazados de
una línea a la siguiente. Sale un damero, que a la vista es un medio tono.

Y ahora lo bueno: esas dos máscaras **no son constantes**. Son los operandos de
esos dos `and`, en 0xD4D3 y 0xD4D9, y el juego los reescribe antes de dibujar:

```
bfb4: ld a,0ffh / ld (0d4d3h),a / ld (0d4d9h),a   ; máscara neutra
bfbc: ld ix,0ddf2h                                ; la cadena "DEMO"
bfc0: ld hl,04d94h / call 0d4e5h                  ; dibujar
bfc6: ld a,055h / ld (0d4d3h),a
bfcb: ld a,0aah / ld (0d4d9h),a                   ; y restaurar
```

Con `0xFF` el `and` no quita nada y salen todos los píxeles. Es código
automodificable usado como si fuera un parámetro.

De paso, la rutina confirma dónde está la fuente: indexa con `0x5F00 + código×8`,
y con el primer código 0x20 eso da 0x6000, que es justo donde están los 59
caracteres. Y el paso entre líneas de pantalla es 24, el alto del buffer por
columnas.

## Un solo plano, y por qué parece que hay dos

Quien lo jugó recuerda dos pisos moviéndose a velocidades distintas, con su
sensación de profundidad. Se buscó en serio: vigilando qué rutina escribe en
cada banda del buffer, y levantando cuadro a cuadro la tabla de «qué fila se
dibujó desde qué dirección», que permite medir el desplazamiento por igualdad
exacta de números en vez de comparando imágenes.

El resultado es rotundo: **el fondo es un solo plano**. En cuatro medidas —tres
momentos de la fase de a pie y uno de la de naves— las dieciocho tiras del
buffer (tres bandas por seis columnas) se desplazan **igual**: +2 filas por
cuadro andando, 0 paradas, −2 hacia atrás, con el 100 % de acierto y sin
desplazamiento horizontal.

La profundidad está en otro sitio: en el **orden de dibujo**. Numerando cada
escritura al buffer dentro del cuadro, en la fase de naves sale siempre la
misma secuencia: primero el fondo entero, después los sprites, y **después de
los sprites** una rutina más (0xC77A) que pinta columnas del decorado leyendo
de su propio almacén de tiles. Se le vio hacerlo en directo: un pilar bajando,
la nave subiendo hacia él, y al cruzarse los destinos el pilar quedó pintado
encima. La nave no pasa *por debajo del piso*: pasa **por detrás de lo que se
repinta después**.

Y en la fase de a pie el parallax **existe de verdad**, solo que no es un
plano: es un dibujo que se redibuja distinto. El fondo se pinta **dos veces
por cuadro parcheando un opcode**: el bucle de juego escribe `0xC2` (`jp nz`)
en 0xA98E y llama al redibujado —así solo se pintan las celdas vacías, que
llevan el tile 0— y después escribe `0xCA` (`jp z`) y vuelve a llamar, para
las sólidas. Y ese tile 0 está vivo: cada paso de scroll lo **rota una fila de
píxel** (0xB140 al subir, 0xB167 al bajar; la fila que sale entra por el otro
lado). Una fila de trama por cada dos de scroll: **el fondo de los huecos se
mueve a mitad de velocidad que las plataformas**. Por eso las tiras del buffer
se desplazan todas igual —lo del párrafo de arriba sigue siendo cierto— y aun
así el ojo ve dos velocidades. Medido sobre la partida entera: 4712 pases con
cada opcode, ni un cuadro con otro valor.

## La torre entera, y un mapa que es dos mapas

La zona de la fase de a pie es una torre, y su mapa está en 0x840B: **78 filas
de 6 celdas**, 468 bytes, 280 celdas con suelo. Lo delata `base_mapa` (0xA9F5),
que hace `ld ix,0840bh` y devuelve la base más fila por seis. Es la única
referencia a ese rango en todo el listado, y por ella pasan los dos únicos
lectores.

Y esos dos lectores hacen del byte de celda **dos cosas a la vez**. Para el
redibujado, un **índice de tile**: origen = 0x87F3 + valor×128, así que la
celda dice con qué dibujo se pinta. Para la física, un **booleano**:
`consulta_mapa` (0xB18E) termina en `and a` y sus seis llamadores miran solo el
flag Z —celda cero es vacío—, ninguno usa el valor. No hay un mapa de colisión
y otro de decorado: hay uno solo con dos lecturas.

Las cuentas cierran al byte. El valor más alto del mapa es 44, y 0x87F3 +
45×128 − 1 = **0x9E72, exactamente el último byte** que se había visto leer al
blitter midiendo el puerto de vídeo: el pozo son 45 tiles justos.

Los tiles son de **32×32 píxeles** (128 bytes: 4 por fila, 32 filas), y eso
corrige un dato publicado: aquí decía que las celdas eran de 32×16 y la torre
de 1248 píxeles de alto. El alto de celda estaba **derivado, no medido** —otra
cifra heredada, como la de los ejes del buffer— y lo desmienten tres caminos
independientes: el tile de 128 bytes, la división entre 32 de `consulta_mapa`,
y el scroll fino, que da dieciséis pasos de 2 píxeles entre fila y fila. La
torre es de **192×2496 píxeles**, el doble de alta de lo publicado.

Con el mapa y el pozo, la torre se dibuja entera:

![La torre de la fase de a pie, compuesta desde su mapa y sus tiles](../imagenes/torre_apie.png)

Abajo del punto de salida está el **cartel de flechas** que señala hacia
arriba (los tiles 0x28 y 0x29, que solo aparecen ahí), y la fila 0 es una
cornisa de rosetas (el tile 0x2A). La estructura sola, sin la trama de fondo,
está en [torre_estructura.png](../imagenes/torre_estructura.png), y el pozo de
45 tiles en [tiles_apie.png](../imagenes/tiles_apie.png).

La cámara que recorre la torre es el par (0xAD2A, 0xAD2C): fila del mapa más
desplazamiento fino en píxeles. El actualizador (0xA8DB) mueve el fino de 2 en
2 hasta 32 y entonces cambia de fila, con topes en la 0 y la 71; el engranaje
se vio en directo en el emulador: la sonda registró `(fila 57, fino 32)` y al
paso siguiente `(fila 56, fino 2)`. Cada paso sobre suelo firme guarda además
un **checkpoint** (posición en 0xA6E9, cámara en 0xC466/67), que es adonde te
devuelve la muerte.

## La muerte del jugador estaba en otra parte

El jugador muere al pisar el vacío, y la rutina que parecía explicarlo —una
variante «fina» de la consulta del mapa, con lógica de sub-celda— resultó **no
ser suya**. Esa variante (0xB1BE) responde si una posición cae *bien centrada*
dentro de una celda vacía, y la usan solo los **enemigos voladores** para
decidir en qué hueco del muro anidar. Se midió sobre la partida entera: 2934
pasadas por ella, y el retorno apilado fue **siempre el mismo llamador**, el
bucle de los voladores. Ni una vez el jugador.

El jugador no está en ninguna tabla de objetos: vive en dos bytes (0xA6EB, con
la Y clavada en 0x68: subir y bajar no le mueve a él, mueve el mundo) y tiene
**su propia llamada** a `consulta_mapa`, en 0xA665, con la celda bajo los
pies. Si la celda es vacía:

```
a665: call consulta_mapa
a668: jr nz,<sigue andando>
a66a: ld a,004h / ld (0a6edh),a     ; estado 4: sentenciado
```

Y ya no hay vuelta: en toda la agonía (estados 4 a 45) no vuelve a consultarse
el mapa. **No existe el aterrizaje**: se muere en el instante de pisar el
vacío, y la caída que se ve es la animación del derrumbe, con sus frames
rotados según hacia dónde tropezó.

La otra muerte es por contacto. El **escudo** (0xA6ED, de 3 a 1, los tres
iconos del marcador) se descuenta al ser alcanzado, y a cero el juego parchea
el puntero de actualización del jugador para sustituirlo por un **cadáver en
parábola** (0xB268): sube, cae acelerando y —como tampoco consulta el mapa—
**atraviesa el suelo** y sale por abajo de la pantalla.

Las dos vías desembocan en el mismo embudo: cuando el estado llega a 45, se
resta una vida (0xC45F: **dos** al empezar, se ganan por puntos hasta nueve), y
con el contador agotado, game over; si quedan, el **respawn** te devuelve a la
última posición pisada en firme con la cámara del checkpoint, el escudo a
tres y las tablas de enemigos vaciadas.

Lo de las dos vidas tiene truco, y aquí estuvo publicado "tres": hay **dos
inicializaciones**, y la que manda es la segunda. El menú deja un tres en el
contador (0xA30B), pero el arranque de la partida lo pisa con un dos (0xA3CB,
`ld a,002h`). Por eso la primera muerte de cualquier partida encuentra el
contador a dos.

### El estado de agonía: no hay temporizador, hay un bucle lento

Entre que el juego te da por muerto y que de verdad te quita la vida pasan
unos cinco segundos, y no los cuenta ningún reloj. El contador sube **uno por
vuelta del bucle principal**, sin prescaler y sin sincronía ninguna con el
vídeo: en todo el módulo no hay un solo `halt`, el volcado a la memoria de
vídeo son bucles de copia, y ninguna rutina de la agonía mira el contador
global.

Lo lento es la vuelta. Una vuelta del motor —doble pase del fondo, enemigos,
disparos y volcado de las tres bandas— cuesta unos **123 milisegundos**, que
son 6,15 cuadros de los 50 por segundo de la máquina. Cuarenta y una vueltas
a ese ritmo son 5,04 segundos, y el emulador mide 23 agonías de entre 4,76 y
5,29 segundos, con media de 5,04. La cuenta sale clavada.

Mientras dura, eres intocable: tres comprobaciones independientes del listado
se saltan la colisión si el estado ya llegó a cuatro.

### Veintitrés muertes, y otras cuarenta y cuatro que no son tuyas

Sobre la partida grabada sale el retrato completo: **veintitrés muertes, 22
por contacto y una sola por caída**, las veintitrés pasando por el mismo
descuento y el mismo respawn. La partida va del segundo 2.464 al 3.124 —once
minutos— y **acaba pasándose el juego**: el emulador ve pasar el programa por
la rutina del final feliz, no por la de quedarse sin vidas. Y el contador de
vidas antes de cada descuento fue subiendo de dos a seis: el jugador ganaba
vidas más deprisa de lo que las perdía.

(Aquí estuvo publicado "veinte muertes, 19 por contacto", por medir una
ventana de tiempo que se cortaba antes del final de la partida.)

Pero la cinta grabada contiene **otras 44 muertes que no son del jugador**: son
de la **demo de atracción**, que ejecuta exactamente el mismo código de juego
y por tanto las mismas rutinas de muerte. Separarlas no es cuestión de mirar
el reloj, porque el juego lo dice él mismo: la dirección 0xA689 guarda el
operando de una llamada que vale una cosa en partida normal y otra en demo, y
el propio arranque la consulta (`cp 0eeh`) para no repintar el marcador
mientras la demo juega. Preguntándole a ese byte en cada muerte, las dos
pasadas de demo de la grabación —la de antes de empezar y la de después de la
tabla de récords— se separan solas de los once minutos de partida de verdad.

## La cuenta atrás es una torre que crece

Al final de la fase de a pie hay que destruir seis objetivos, y al caer el
sexto arranca una cuenta atrás. No son dígitos: es una **torre blanca que gana
una fila de píxeles cada ~2 segundos**. El mecanismo está entero en el listado:
el arranque del nivel deja un 6 en 0xBC33, cada objetivo destruido lo resta, y
con el contador a cero cada tic pinta una fila (`ld a,07eh / out (098h),a`) y
suma una a 0xBC30. El ritmo lo da el contador de cuadros global: un tic cada
dieciséis.

```
bbb4: cp 0a1h / jp z,0bceeh    ; a las 161 filas, se acabó
```

Y como en la partida grabada el jugador escapó, lo del final se comprobó **
dejando que se agotara**: se cargó la partida con la torre a medias, se
desconectó el mando, y a las 161 filas exactas saltó 0xBCEE: la secuencia de
destrucción, y de ahí directo a la tabla de récords. Game over, sin
FELICIDADES. Las cuentas de la partida real salen finas: escapó con unos **30
segundos de margen** de los 5,8 minutos que da el juego.

## Las explosiones llevan un fósil del Spectrum dentro

Las dos fases tienen explosión de partículas, cada una con su copia del código.
La de naves —cuando derriban al protagonista— siembra **64 partículas** en la
posición de la nave y las mueve **con gravedad**: la velocidad vertical crece
un punto por cuadro, y cada partícula es un píxel suelto dibujado sobre el
buffer. La del final feliz —la nave insignia vista desde fuera— son **200
partículas de metralla** sesgadas hacia arriba, sin gravedad.

Y en las dos, dentro del bucle que pinta cada partícula, está esto:

```
c663: and 018h / out (0feh),a
```

**0xFE es el puerto del borde del ZX Spectrum.** En el original, cada partícula
hacía parpadear el borde de la pantalla; en el MSX ese puerto no hace nada, y
ahí sigue la instrucción, ejecutándose en balde en cada partícula desde 1987.
Las dos copias del efecto la arrastran: la prueba más limpia que ha dado el
proyecto de que estas rutinas se trajeron del original tal cual.

De paso: el azar de las partículas —y del campo de 48 estrellas del fondo de
naves, que son alturas aleatorias pintadas con el patrón fijo `0x18`— sale de
un generador que **lee la ROM del BIOS como tabla de entropía**. Y el POKE de
inmortalidad de la revista Input MSX (el que parchea 0xC06E) actúa justo en el
despachador que decide si la nave está viva o explotando: la inmortalidad es,
literalmente, no dejar que se llame nunca al sistema de partículas.

## Por qué la segunda parte carga justo en 0x61D0

La dirección de carga del bloque de la fase de a pie parecía arbitraria hasta
que salió la fuente. Los dos rotuladores de esa fase —el del rótulo DEMO y el
menú, que pinta a doble altura con el damero, y el del marco, que escribe
directo a la memoria de vídeo— usan la misma fuente ASCII, indexada como
`0x5F00 + código×8`. La fuente la deja cargada el bloque de naves, y la fase de
a pie la reutiliza.

La cuenta cierra sola: el último carácter que la fuente necesita es la `Y`
(código 89), y 0x5F00 + 90×8 = **0x61D0 exacto**. El bloque de la segunda parte
carga en el primer byte libre después del glifo de la `Y`: ni un byte antes,
para no comerse la fuente heredada.

## Un intérprete de guiones

Dentro del juego de naves hay una máquina virtual pequeña. Los guiones que
gobiernan a los enemigos son bytes, y los que valen 0x80 o más son **opcodes**:

    e230: ld a,(bc) / cp 080h / jp c,0e231h   ; por debajo de 0x80 no es opcode
          sub 080h / ld hl,0e7a3h / call 0e5c0h / jp (hl)

y `0xE5C0` es exactamente «HL = tabla + A×2, HL = (HL)». La tabla de 0xE7A3
tiene **35 entradas**, y que son 35 y no más no es una estimación: la tabla
acaba en 0xE7E8 y el código del opcode 0x90 empieza pegado, en 0xE7E9.

## El sonido del juego es un lenguaje, y se puede leer

Stardust no guarda su música como notas sueltas: trae un **intérprete** con su
propio lenguaje de quince comandos, y las melodías están escritas en él. Los
comandos se distinguen de las notas por el bit alto —de 0x80 para arriba es una
orden, por debajo es una nota—, y cada uno se lee de su rutina:

    0x80  volumen          0x87  instrumento
    0x81  tono/ruido       0x88  ruido
    0x82  bucle            0x89  efecto
    0x83  duración         0x8A  banderas
    0x85  tempo            0x8B  fin
    0x86  tempo a 1        0x8C  llama a frase
                           0x8D  vuelve

Dos de ellos delatan el chip de sonido del MSX sin necesidad de mirar nada más:
el de tono/ruido enmascara su argumento con `and 9`, que son justo los dos bits
del registro 7 del PSG, y el de ruido lo enmascara con `and 0x1F`, que son los
cinco bits del periodo de ruido. El código no lo dice, pero las máscaras sí.

Y hay dos comandos que convierten esto en un lenguaje de verdad: **llamar** y
**volver**. El intérprete guarda la dirección de retorno en una pila que tiene
por canal, exactamente como haría un procesador. Así que las canciones no
repiten sus compases: los **llaman**. Veinte frases guardadas aparte, y las
canciones invocándolas por número. Es la misma idea del diccionario recursivo
con el que se comprimen los mapas de nivel, aplicada al sonido por la misma
gente.

Con la tabla de comandos en la mano, la zona de música se recorre entera **sin
descuadrarse ni una vez**, y eso es la mejor prueba de que está bien leída: si
el número de argumentos de un solo comando estuviera mal, el recorrido se
desincronizaría y los bloques no acabarían donde acaban.

Lo que sale del recorrido: **veintiún sonidos**. Diecisiete son cortos, de 9 a
31 bytes —los efectos—, y el tramo largo del final resulta ser **la música**,
repartida en tres voces como se cuenta justo abajo. Otros dos no terminan: dan
la vuelta y siguen sonando en bucle.

### La música es una sola, a tres voces

Aquí estuvo publicado que había "dos canciones largas, de 378 y 149 bytes", y
estaba mal partido. La rutina que arranca la música instala **tres guiones de
golpe, uno por canal**:

    canal 0   0xEB52   248 bytes, y al acabar repite
    canal 1   0xEC4A   129 bytes, y al acabar repite
    canal 2   0xECCB   apunta a un «fin», o sea que entra callado

No son canciones distintas: son **las tres voces de la misma música**, sonando
a la vez. Las dos primeras empiezan además con la misma orden de transposición,
+2, lo que las afina juntas.

Eso explica de paso algo que despistaba: al sintetizar el primer guion por su
cuenta salían cuatro notas graves repitiéndose. No es que la música fuera
pobre; es que se estaba escuchando **la línea de bajo sola**.

### Las canciones no tienen ni una nota

Y aquí está lo mejor del asunto. Descodificada, la canción de 378 bytes resulta
ser **152 llamadas a frase y cero notas propias**. La de 149, cincuenta y seis
llamadas y una sola nota suelta. **La melodía no está en las canciones**: está
en las frases, y la canción es únicamente la estructura que las encadena. Por
eso 1.420 bytes dan para toda la banda sonora del juego.

Con la tabla de notas al lado, la armonía se lee a simple vista. Las frases 1,
4, 5 y 6 son cuatro notas repetidas —do3, la3, fa3 y sol3, las fundamentales—
y la canción larga empieza llamándolas en este orden:

    1 1 4 4 1 1 4 4 5 5 6 6 1 1 1 1 1 1 4 4 ...

Do, la, fa, sol, dos compases por acorde: es **la progresión I–vi–IV–V**, la de
los doo-wop de los cincuenta, sonando en un matamarcianos de 1987. Usa
diecisiete de las veinte frases.

La otra canción es un caso distinto: cincuenta y seis llamadas a sólo **dos**
frases, y la que repite veinticuatro veces seguidas no tiene ni una nota. Es
percusión, sonando por el canal de ruido.

La tabla de notas, de paso, se comprueba sola: con el reloj del chip de sonido
del MSX, el primer periodo da **32,70 Hz, que es el do1 teórico**, y de los 84
pares separados doce posiciones, 76 tienen razón exactamente 2 —la definición
de octava—. Los ocho que fallan son los más agudos, donde el periodo ya es un
entero de dos cifras y el redondeo se nota. Ocho octavas justas, de do1 a si8.

No hay ninguna tabla que los ordene. Cada sitio del juego que quiere sonar algo
lleva la dirección escrita a pelo, y hay **44 de esas llamadas** repartidas por
el código; la más repetida, siete veces, es el mismo efecto. Dos de ellas
apuntan a **mitad** de una melodía en vez de a su principio: es una manera
barata de tener variaciones sin gastar un byte más.

## Los créditos pasan con un scroll que no mueve el dibujo

Los créditos del juego —los cinco carteles con los nombres de quienes hicieron
la versión de MSX— se muestran de uno en uno en la franja central de la
pantalla, con una pausa para leerlos, y cada uno se despide **deslizándose
hacia arriba**.

Mover esa franja parece caro: son 2.048 bytes de dibujos. La rutina no los
toca. Recuerda que en el MSX hay dos tablas, la de qué dibujo lleva cada celda
y la de los dibujos, y **mueve la primera**: 256 bytes en vez de 2.048. Como
cada celda apunta a su dibujo, correr los índices corre la imagen. Ocho veces
sale ocho veces más barato.

El paso de cada tirón son 32 posiciones, que es justo una fila de la pantalla,
y da ocho tirones: las ocho filas de la franja. Al terminar borra los dibujos
y **reconstruye la tabla de celdas**, y ahí aparece la confirmación bonita: la
reconstruye con el mismo entrelazado de ocho en ocho que dejó la pantalla de
carga —0, 8, 16… 248, luego 1, 9, 17…— en seis instrucciones. El juego sabe
perfectamente cómo viene esa tabla y se encarga de devolverla a su sitio.

Hasta ahora ese entrelazado sólo se había leído en el código de la pantalla de
carga. Aquí aparece por segunda vez, escrito por otra mano y en otro bloque, y
explica de paso por qué el marcador puede escribir dibujos y acertar siempre
de celda.

## El marcador no escribe letras: redibuja las celdas

Todo el marcador de la fase de naves —los puntos, las vidas, el número de
zona— sale de una sola rutina, en 0xF41D, y lo primero que sorprende de ella
es que **no escribe caracteres**. En la memoria de vídeo del MSX hay una tabla
que dice qué dibujo lleva cada celda de la pantalla y otra que guarda los
dibujos. Lo normal para escribir un "7" sería poner el número del dibujo del
siete en la celda que toca. Esta rutina hace lo contrario: deja las celdas
como están y **cambia el dibujo que hay debajo**.

Puede permitírselo porque la mesa ya está puesta. La tabla de celdas la dejó
la pantalla de carga y el juego la hereda intacta, así que cada hueco del
marcador ya apunta a un dibujo propio que no usa nadie más. Escribir se
convierte en volcar los ocho bytes de la letra encima.

El detalle que lo remata es el paso entre glifo y glifo: **0x40 bytes**, que
son ocho dibujos. Parece un salto raro hasta que se recuerda que la tabla de
celdas viene **entrelazada de ocho en ocho** de la pantalla de carga. Con ese
entrelazado, saltar ocho dibujos es caer justo en la celda de al lado. Las dos
rarezas se cancelan.

Cuatro sitios del código la llaman, y cada uno es un indicador:

- Los **puntos** son seis dígitos guardados como texto en 0xDD80. Una rutina
  los pone a "000000" al empezar, y otra les suma **haciendo la aritmética
  decimal a mano sobre el ASCII**: incrementa el dígito, y si se pasa del "9"
  lo devuelve al "0" y se lleva una al de la izquierda. Nunca hay un número
  binario que convertir, porque el marcador *es* el número.
- Las **vidas** y la **zona** son un dígito cada una (0xE156 y 0xE157), y se
  pintan sumándoles 0x30 para pasarlas a ASCII.

Y hay una coincidencia que dice mucho: los puntos se pintan en la misma
dirección de vídeo, 0x12B0, en las dos fases del juego. La de naves y la de a
pie no comparten ni una línea de código, pero ponen el marcador en el mismo
sitio de la pantalla.

### Las dos fases se mueren igual

Puestos a leer las vidas de la fase de naves, aparecen tres cosas idénticas a
las de la fase de a pie, y ninguna es casualidad:

- **Se inicializan dos veces, y manda la segunda**: el menú deja un tres y el
  arranque de la partida lo pisa con un dos. Exactamente el mismo par que a
  pie, hasta en el orden.
- **La vida extra por puntos tiene tope nueve** en las dos.
- Y el descuento solo se dispara cuando un contador llega a **45**, que es el
  mismo número que cierra la agonía de la fase de a pie. La dirección cambia
  —0xC188 aquí, 0xA6ED allí— pero el mecanismo es el mismo: un byte que vale
  poco mientras vives y se pone a contar en cuanto te matan.

Ahí encaja, por fin, una pieza que llevaba suelta desde el primer día. El POKE
de inmortalidad que publicó la revista *Input MSX* nº 19 parchea un salto para
saltarse la comparación de ese contador contra cuatro. Es **la misma puerta de
invulnerabilidad** que la fase de a pie tiene por triplicado: con el contador
ya en cuatro o más, el juego ignora los choques porque cree que estás
muriéndote. El POKE no regala vidas: deja al jugador permanentemente en ese
estado.

## El marco del juego viaja en el bloque, y la pantalla de carga le deja la mesa puesta

El cuadro decorado que rodea el área de juego —con su HUD: la roseta con la
nave, los medidores de colores, la barra de PUNTOS y ZONA— no se dibuja pieza
a pieza: **viene dibujado de fábrica dentro del bloque del juego**. Sus
primeros 1415 bytes son el logo STARDUST (un bitmap de 128×16 que el modo
atracción anima en el área central) y, detrás, los patrones y los colores del
marco, 0x900 bytes de cada, que una rutina del arranque copia a la memoria de
vídeo.

La copia tiene una forma rara —dos filas de carácter por tercio de pantalla y
cuarenta y ocho tiras sueltas— que solo cobra sentido con la otra mitad del
truco: el juego **no construye la tabla de nombres** del SCREEN 2. **La hereda
de la pantalla de carga**, que la había rellenado «sumando ocho»: el carácter
n de cada tercio se ve en la columna n÷8, fila n mod 8. La carga de la cinta
machaca en RAM el programa de la pantalla de carga, pero la memoria de vídeo
sobrevive, y el juego cuenta con ello. Con ese mapeo heredado, el reparto raro
es, sencillamente, **la forma del marco**: los caracteres 0 a 31 y 224 a 255
de cada tercio son las cuatro columnas de cada lado, y las tiras, la fila de
arriba y la barra de abajo.

Las dos mitades están contrastadas con el emulador: la tabla de nombres real
del juego en marcha coincide **768 de 768** con el patrón heredado, y los
patrones y colores de la cinta aparecen idénticos en el **97,4 %** —el resto
es lo que el juego pinta encima: el campo de estrellas, los marcadores vivos—.
Y la prueba que vale por todas es dibujarlo desde la cinta con ese mapeo:

![El marco de la pantalla de juego, dibujado desde los datos de la cinta](../imagenes/marco.png)

## La pantalla de carga

![La pantalla que se ve mientras carga](../imagenes/carga.png)

No es una captura: está dibujada a partir de los 12.288 bytes que el propio
bloque vuelca —6144 de patrón a la memoria de vídeo 0x0000 y 6144 de color a
0x2000—, siguiendo lo que hace su rutina de 0x9C10.

Tiene truco, y de los que enseñan algo. La tabla que dice qué dibujo va en cada
casilla no se rellena en orden 0, 1, 2, 3… sino **sumando ocho**: 0, 8, 16 …
248, 1, 9, 17 … Son los mismos 256 valores por tercio de pantalla, pero
intercalados. Dibujarla suponiendo orden secuencial da ruido convincente, que es
el peor tipo de error: parece que el reparto del bloque está mal cuando lo que
está mal es cómo lo lees.

Va firmada **CANO**, abajo a la izquierda.
