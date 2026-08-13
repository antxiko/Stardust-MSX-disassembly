# El código

Los cinco bloques de la cinta suman **93 861 bytes**, y de ellos **20 076** son
código que el trazador alcanza siguiendo el flujo. El resto son gráficos,
tablas, buffers y relleno, todo con su nombre.

Esa cifra es baja a propósito: sólo cuenta el código al que se llega de verdad
siguiendo llamadas y saltos desde un punto de entrada conocido. Hay más código
en la cinta, pero mientras no se sepa por dónde se entra no se cuenta, porque
darlo por trazado es justo el error que hizo falta deshacer aquí.

## Cómo se dibuja la pantalla

Aquí está la diferencia grande con el original. El Spectrum escribe directamente
en su memoria de pantalla, que es RAM normal; el MSX tiene la memoria de vídeo
detrás del chip gráfico y hay que enviarla por un puerto. Así que esta versión
lleva un **buffer intermedio** que el original no necesita.

El buffer va de **0x4000 a 0x4EFF** y mide 3.840 bytes: **24 de ancho por 160
de alto**. El volcado lo pasa a la VRAM en **tres bandas** —0x4000 con 56
filas, 0x4540 con 64 y 0x4B40 con 40, contiguas y cerrando al byte—, una por
llamada y cada una a su tercio del SCREEN 2. Y cada banda se recorre **por
columnas**, no por filas (aquí la tercera llamada, la de 40 filas):

```
f3f2: ld de,04b40h     ;       la banda: su buffer, su destino y su altura
f3ff: ld c,018h        ; 24  <- bucle EXTERIOR: avanza el buffer de uno en uno
f401:   call 0EE24h    ;        fija la direccion de memoria de video
f408:   ld de,00018h   ; 24  <- el PASO dentro del buffer
f40b:   ld a,(hl) / out (098h),a / add hl,de
f40f:   djnz           ; 40  <- bucle INTERIOR, con B=0x28
```

Conviene pararse en los ejes, porque **son fáciles de leer al revés**. El
`ld b,028h` parece decir «40 columnas» y no lo dice: es el bucle interior, y
recorre el buffer a saltos de 24, o sea que recoge 40 bytes de **una misma
columna**. El que cuenta columnas es el exterior, que avanza el buffer de uno
en uno 24 veces.

Se comprueba dibujándolo: partiendo el buffer de 24 en 24 sale la tabla de
récords legible, con su tramado; de 40 en 40 sale ruido. Y cuadra con lo que se
ve jugando: 24 bytes son 192 píxeles, más estrecho que los 256 de la pantalla
—de ahí el marco fijo a los lados—, y lo que sobra está **a lo alto**, que es
justo por donde scrollea.

Esa rutina hizo **3.252.480 escrituras** en dos minutos de
partida, que es de largo la que más trabaja del juego.

Vigilando el puerto por donde entra la memoria de vídeo salen **diecisiete
rutinas** que escriben en ella. Ese método —mirar quién escribe, en vez de
adivinar qué son los datos— es lo que permitió acotar el buffer al byte.

## Los sprites, a la manera del Spectrum

El Spectrum no tiene sprites por hardware, así que hay que dibujarlos a mano: se
desplaza el dibujo bit a bit hasta la posición exacta, se abre hueco en el fondo
con AND y se pinta con OR. Para no pagar el bucle del desplazamiento, se escribe
la instrucción repetida N veces y se entra por la mitad:

```
c4c5: ld a,h / ld h,l / ld l,0ffh
c4c9: jp 0c4e1h          ; el salto que pasa por encima de toda la tira
c4cc: adc hl,hl / adc a,a / adc hl,hl / adc a,a / ...
```

Esa técnica es la que despista al trazador: el `jp` salta la tira entera, y a los
`adc` se entra por un salto calculado que no está en el binario. Se sabe que se
ejecutan porque el emulador los pilló ejecutándose a media tira.

Y el MSX **sí tiene sprites por hardware**, que aquí no se usan para esto: la
conversión se trajo el método de la máquina de origen.

## Un intérprete de guiones

El sonido no está escrito como código, sino como guiones que interpreta una
máquina virtual pequeña. Los bytes por debajo de 0x80 son notas; de 0x80 para
arriba son comandos:

```
e230: ld a,(bc) / cp 080h / jp c,0e231h
      sub 080h / ld hl,0e7a3h / call 0e5c0h / jp (hl)
```

con `0xE5C0` haciendo «HL = tabla + A×2, HL = (HL)». Son **quince comandos**, y
esa tabla de saltos es también la primera trampa del trazado: si no se
declara como datos, el trazador se mete dentro y empieza a desensamblar
direcciones como si fueran instrucciones.

## Cada objeto lleva su rutina

La parte de naves resuelve así el comportamiento de las entidades: cada una
guarda en su estructura de **8 bytes** un puntero a la rutina que la gobierna, y
el juego salta ahí con `jp (hl)`. Esas estructuras vienen **a 0xFF en la cinta**
y se rellenan jugando, así que los destinos no se pueden leer del binario: hay
que capturarlos con el juego en marcha. Haciéndolo salen ocho rutinas, y los IX
capturados van de 8 en 8.

La misma medida en la parte de a pie da pasos de **46**. Ese `jp (hl)` —el de
0xC544— no despacha entidades: despacha los **comandos del intérprete de
sonido**, y los objetos
de 46 bytes son sus tres canales: la rutina que arranca un sonido recibe el
número de canal y lo multiplica por 46 (`ld de,0002eh`) para llegar a su estado.
Está contado entero en [Hallazgos](HALLAZGOS.html).

Los enemigos de a pie no llevan rutina apuntada. Viven en **tablas de 5 bytes
por objeto** —los andantes en 0xACE4, los voladores en 0xACF9, los dos tiros de
la torreta en 0xAD04— y los mueven bucles fijos, uno por especie.

## Código que se escribe a sí mismo

Hay un despachador que se parchea sus propias llamadas:

```
f000: ld (0f016h),hl    ; se escribe el operando de un CALL
f003: ld (0f019h),de    ; y el de otro
...
f015: call 0000h        ; ese 0000 no es real: lo rellena HL
f018: call 0000h        ; y este DE
```

En frío eso se lee como `call 0`, que reiniciaría la máquina. A dónde llama de
verdad no está en el binario, está en los registros de quien lo invoque.

## Lo que sólo se ve jugando

Las dos cosas de arriba —las tiras desenrolladas y el despachador que se parchea
solo— son casos del mismo problema: un trazador estático no puede seguirlas. La
salida es mirar la máquina en marcha, y para eso una partida grabada vale más
que cualquier arnés programado, porque llega a pantallas a las que un guion no
llega nunca.

Reproduciendo una partida entera de 38 minutos y muestreando el contador de
programa, de las **1489 direcciones que ejecutó el juego de naves el trazador ya
alcanzaba 1444**. Las 45 que se le escapaban pasaron a ser puntos de entrada,
cada una con su cuenta de muestras al lado.

En la segunda parte, mucho menos explorada porque hay que superar siete zonas
para llegar a ella, hay 159 direcciones sin trazar. Dos merecen contarse
aparte, porque enseñan la trampa de muestrear el contador de programa cuando
varias direcciones de la cinta sirven a programas distintos según el momento:

```
0xD48C   139.323 muestras (ventana mal puesta, ver abajo)
0xC865    27.928 muestras
```

**0xD48C no es código.** Se desensambla a `nop / rst 38h / nop / rst 38h`, el
desensamblador se rinde en un tramo con un *illegal sequence*, y no lo llama
nadie en el listado. Muestreando el contador de programa en 130 segundos de
partida con la ventana bien puesta —después de que la carga de cinta termine
de verdad, no cuando debería haber terminado— no cae ni una muestra ahí: son
259.149 muestras en dos ventanas, cero en esa dirección. Sus 489 bytes son
datos: 21 valores distintos, 199 de ellos 0xFF, y el resto bytes con pocos
bits puestos, colocados por parejas —`40 ff / 01 ff / 41 ff / 00 ff / 40 f9`—,
la pinta que tiene un dibujo con máscara en una conversión que desplaza sus
sprites a mano.

Lo que exige cuidado es la ventana. En t=1775 —«cuando termina la carga»— la
carga no ha terminado de verdad: el contador de programa está en 0xF87E,
0xF88D, 0xF887, dentro del cargador de cinta, y sólo en 45 direcciones
distintas. La cinta sigue girando, y media memoria desde 0x61D0 hacia arriba
es todavía el juego de naves de debajo. Cinco programas ocupan las **mismas
direcciones** en momentos distintos —el logo de TOPO, la pantalla de carga,
la ROM del BASIC, el juego de naves y la segunda parte—, así que las muestras
hay que partirlas en ventanas con un punto de referencia claro —el salto del
cargador al juego en 0xBD85, o la segunda carga— y acertar tanto el principio
de la ventana como el final.

**0xC865 no es una dirección real: es el segundo byte** de la instrucción que
empieza en **0xC864**, y por eso un breakpoint puesto en 0xC865 no salta
nunca —los puntos de interrupción sólo disparan donde empieza la
instrucción—. 0xC864 sí es código: el manejador del comando 0x8C del
intérprete de sonido, el que llama a una frase de la música. Con 208
apariciones en la partitura es con diferencia el comando más frecuente, así
que sus 27.928 muestras cuadran.
