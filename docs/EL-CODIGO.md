# El código

> **Note:** this page is not translated yet. The documentation is written in
> Spanish first and translated afterwards; this is the Spanish text. The
> figures, addresses and code fragments read the same in both languages.


Los cinco bloques de la cinta suman **93 861 bytes**, y de ellos unos 43 700 son
código que el trazador alcanza siguiendo el flujo. El resto son gráficos,
tablas, buffers y relleno, todo con su nombre.

## Cómo se dibuja la pantalla

Aquí está la diferencia grande con el original. El Spectrum escribe directamente
en su memoria de pantalla, que es RAM normal; el MSX tiene la memoria de vídeo
detrás del chip gráfico y hay que enviarla por un puerto. Así que esta versión
lleva un **buffer intermedio** que el original no necesita.

El buffer está en **0x4B40** y mide 960 bytes: 40 columnas por 24 filas. Y se
recorre **por columnas**, no por filas:

```
f3f2: ld de,04b40h   ; el buffer
f3f5: ld hl,01100h   ; la direccion de memoria de video
f3f8: ld b,028h      ; 40 columnas
f3ff: ld c,018h      ; 24 filas
f408: ld de,00018h   ; el paso entre bytes: 24
f40b: ld a,(hl) / out (098h),a / add hl,de / djnz
```

Cuarenta columnas cuando en pantalla caben treinta y dos: esas ocho de más son
el margen del scroll. Esa rutina hizo **3.252.480 escrituras** en dos minutos de
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

El comportamiento de los enemigos no está escrito como código, sino como
guiones que interpreta una máquina virtual pequeña. Los bytes por debajo de 0x80
son datos; de 0x80 para arriba son opcodes:

```
e230: ld a,(bc) / cp 080h / jp c,0e231h
      sub 080h / ld hl,0e7a3h / call 0e5c0h / jp (hl)
```

con `0xE5C0` haciendo «HL = tabla + A×2, HL = (HL)». Son **35 opcodes**, y esa
tabla de saltos es también la primera trampa del trazado: si no se declara como
datos, el trazador se mete dentro y empieza a desensamblar direcciones como si
fueran instrucciones.

## Cada objeto lleva su rutina

Las dos partes del juego resuelven igual el comportamiento de las entidades:
cada una guarda en su estructura un puntero a la rutina que la gobierna, y el
juego salta ahí con `jp (hl)`. Esas estructuras vienen **a 0xFF en la cinta** y
se rellenan jugando, así que los destinos no se pueden leer del binario: hay que
capturarlos con el juego en marcha.

Haciéndolo salen ocho rutinas en la parte de naves y diez en la de a pie. Y el
tamaño de las estructuras delata que son motores distintos: **8 bytes** por
entidad en la primera parte, **46** en la segunda.

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
