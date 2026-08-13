# El código

Los cinco bloques de la cinta suman **93 861 bytes**, y de ellos **20 076**
son código que el trazador alcanza siguiendo el flujo. El resto son
gráficos, tablas, buffers y relleno — todo con su nombre puesto, eso sí.

Esa cifra es baja a propósito. Solo cuenta el código al que se llega de
verdad, siguiendo llamadas y saltos desde un punto de entrada conocido, y
hay más código en la cinta del que eso cubre — pero mientras no se sepa por
dónde se entra, no se cuenta, porque darlo por trazado es justo el error que
hubo que deshacer aquí en su día.

## Cómo se dibuja la pantalla

Aquí está la diferencia grande con el original. El Spectrum escribe
directamente en su memoria de pantalla, que es RAM normal; el MSX tiene la
memoria de vídeo detrás del chip gráfico, así que hay que mandársela por un
puerto. Por eso esta versión lleva un buffer intermedio que el original no
necesita para nada.

El buffer va de 0x4000 a 0x4EFF, mide 3.840 bytes, de 24 de ancho por 160
de alto, y el volcado lo pasa a la VRAM en tres bandas —0x4000 con 56
filas, 0x4540 con 64 y 0x4B40 con 40, contiguas y cerrando al byte— una por
llamada, cada una a su tercio del SCREEN 2. Y cada banda se recorre por
columnas, no por filas (aquí la tercera llamada, la de 40 filas):

```
f3f2: ld de,04b40h     ;       la banda: su buffer, su destino y su altura
f3ff: ld c,018h        ; 24  <- bucle EXTERIOR: avanza el buffer de uno en uno
f401:   call 0EE24h    ;        fija la direccion de memoria de video
f408:   ld de,00018h   ; 24  <- el PASO dentro del buffer
f40b:   ld a,(hl) / out (098h),a / add hl,de
f40f:   djnz           ; 40  <- bucle INTERIOR, con B=0x28
```

Conviene pararse en los ejes, porque son fáciles de leer al revés. El `ld
b,028h` parece decir «40 columnas» y no lo dice: es el bucle interior, y
recorre el buffer a saltos de 24, o sea que en realidad recoge 40 bytes de
una misma columna. Quien de verdad cuenta columnas es el bucle exterior,
que avanza el buffer de uno en uno 24 veces.

Y se comprueba dibujándolo: partiendo el buffer de 24 en 24 sale la tabla
de récords legible, con su tramado; de 40 en 40 sale ruido puro. Encaja con
lo que se ve jugando, además: 24 bytes son 192 píxeles, más estrecho que
los 256 de la pantalla —de ahí el marco fijo a los lados— y lo que sobra
está a lo alto, que es justo por donde scrollea.

Esa rutina llegó a hacer 3.252.480 escrituras en dos minutos de partida, lo
que la convierte, de largo, en la que más trabaja de todo el juego.
Vigilando el puerto por el que entra la memoria de vídeo salen diecisiete
rutinas distintas que escriben en ella — y ese método, mirar quién escribe
en vez de adivinar qué son los datos, es justo lo que permitió acotar el
buffer al byte.

## Los sprites, a la manera del Spectrum

El Spectrum no tiene sprites por hardware, así que hay que dibujarlos a
mano: se desplaza el dibujo bit a bit hasta la posición exacta, se abre
hueco en el fondo con AND y se pinta con OR. Y para no pagar el bucle del
desplazamiento cada vez, se escribe la instrucción repetida N veces y se
entra por la mitad que toca:

```
c4c5: ld a,h / ld h,l / ld l,0ffh
c4c9: jp 0c4e1h          ; el salto que pasa por encima de toda la tira
c4cc: adc hl,hl / adc a,a / adc hl,hl / adc a,a / ...
```

Esa técnica es justo la que despista al trazador: el `jp` salta la tira
entera, y a los `adc` se entra por un salto calculado que no está escrito
en ningún sitio del binario. Solo se sabe que se ejecutan porque el
emulador los pilló en marcha, a media tira.

Y el MSX sí tiene sprites por hardware, aunque aquí no se usen para esto: la
conversión se trajo el método de la máquina de origen tal cual, sin
adaptarlo.

## Un intérprete de guiones

El sonido no está escrito como código, sino como guiones que interpreta una
máquina virtual pequeña. Los bytes por debajo de 0x80 son notas; de 0x80
para arriba son comandos:

```
e230: ld a,(bc) / cp 080h / jp c,0e231h
      sub 080h / ld hl,0e7a3h / call 0e5c0h / jp (hl)
```

con `0xE5C0` haciendo «HL = tabla + A×2, HL = (HL)». Son quince comandos en
total, y esa tabla de saltos es además la primera trampa del trazado: si no
se declara como datos, el trazador se mete dentro sin avisar y empieza a
desensamblar direcciones como si fueran instrucciones.

## Cada objeto lleva su rutina

La parte de naves resuelve así el comportamiento de sus entidades: cada una
guarda en su propia estructura de 8 bytes un puntero a la rutina que la
gobierna, y el juego salta ahí con `jp (hl)`. Esas estructuras llegan a 0xFF
en la cinta y se van rellenando solo al jugar, así que los destinos no se
pueden leer del binario en frío: hay que capturarlos con el juego en
marcha. Haciéndolo salen ocho rutinas, y los IX capturados van de 8 en 8.

La misma medida en la parte de a pie da pasos de 46. Pero ese `jp (hl)` —el
de 0xC544— no despacha entidades para nada: despacha los comandos del
intérprete de sonido, y los objetos de 46 bytes son sus tres canales. La
rutina que arranca un sonido recibe el número de canal y lo multiplica por
46 (`ld de,0002eh`) para llegar a su estado. Está contado entero en
[Hallazgos](HALLAZGOS.html).

Los enemigos de a pie, en cambio, no llevan rutina apuntada: viven en
tablas de 5 bytes por objeto —los andantes en 0xACE4, los voladores en
0xACF9, los dos tiros de la torreta en 0xAD04— y los mueven bucles fijos,
uno por especie.

## Código que se escribe a sí mismo

Hay un despachador que se parchea sus propias llamadas:

```
f000: ld (0f016h),hl    ; se escribe el operando de un CALL
f003: ld (0f019h),de    ; y el de otro
...
f015: call 0000h        ; ese 0000 no es real: lo rellena HL
f018: call 0000h        ; y este DE
```

En frío eso se lee como `call 0`, que reiniciaría la máquina si se
ejecutara tal cual. A dónde llama de verdad no está escrito en el binario:
está en los registros de quien lo invoque en cada momento.

## Lo que solo se ve jugando

Las dos cosas de arriba —las tiras desenrolladas y el despachador que se
parchea solo— son en realidad el mismo problema visto dos veces: un
trazador estático no puede seguirlas de ninguna manera. La única salida es
mirar la máquina en marcha, y para eso una partida grabada vale más que
cualquier arnés programado, porque llega a pantallas a las que un guion
automático no llega nunca.

Reproduciendo una partida entera de 38 minutos y muestreando el contador de
programa, de las 1489 direcciones que llegó a ejecutar el juego de naves,
el trazador ya alcanzaba 1444 por su cuenta. Las 45 que se le escapaban
pasaron a ser puntos de entrada, cada una con su cuenta de muestras al
lado.

En la segunda parte, mucho menos explorada porque hace falta superar siete
zonas para llegar hasta ella, hay 159 direcciones sin trazar. Dos merecen
contarse aparte, porque enseñan bien la trampa de muestrear el contador de
programa cuando varias direcciones de la cinta sirven a programas distintos
según el momento:

```
0xD48C   139.323 muestras (ventana mal puesta, ver abajo)
0xC865    27.928 muestras
```

0xD48C no es código. Se desensambla a `nop / rst 38h / nop / rst 38h`, el
desensamblador se rinde en un tramo con un *illegal sequence*, y no lo
llama nadie en todo el listado. Muestreando el contador de programa en 130
segundos de partida con la ventana bien puesta —después de que la carga de
cinta termine de verdad, no cuando debería haber terminado— no cae ni una
muestra ahí: 259.149 muestras repartidas en dos ventanas, cero en esa
dirección. Sus 489 bytes son datos, y punto: 21 valores distintos, 199 de
ellos 0xFF, y el resto bytes con pocos bits puestos, colocados por parejas
—`40 ff / 01 ff / 41 ff / 00 ff / 40 f9`— justo la pinta que tiene un
dibujo con máscara en una conversión que desplaza sus sprites a mano.

Lo que de verdad exige cuidado aquí es la ventana. En t=1775 —«cuando
termina la carga»— la carga en realidad no ha terminado: el contador de
programa está en 0xF87E, 0xF88D, 0xF887, todavía dentro del cargador de
cinta, y en solo 45 direcciones distintas. La cinta sigue girando, y media
memoria desde 0x61D0 hacia arriba sigue siendo el juego de naves de debajo.
Cinco programas ocupan las mismas direcciones en momentos distintos —el
logo de TOPO, la pantalla de carga, la ROM del BASIC, el juego de naves y
la segunda parte— así que las muestras hay que partirlas en ventanas con un
punto de referencia claro —el salto del cargador al juego en 0xBD85, o la
segunda carga— y acertar tanto el principio de la ventana como el final.

0xC865, en cambio, no es una dirección real: es el segundo byte de la
instrucción que empieza en 0xC864, y por eso un breakpoint puesto en 0xC865
no salta nunca — los puntos de interrupción solo disparan donde empieza de
verdad la instrucción. 0xC864 sí es código: el manejador del comando 0x8C
del intérprete de sonido, el que llama a una frase de la música. Con 208
apariciones en la partitura es, con diferencia, el comando más frecuente de
todos, así que sus 27.928 muestras cuadran perfectamente.
