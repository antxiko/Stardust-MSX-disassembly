# Hallazgos

> **Note:** this page is not translated yet. The documentation is written in
> Spanish first and translated afterwards; this is the Spanish text. The
> figures, addresses and code fragments read the same in both languages.


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
pisa— así que lo lógico sería que la llamara. Pues no: un punto de observación
sobre ella no saltó **ni una vez en 4000 segundos de juego**. El juego trae la
suya:

    f7f6: ld hl,0f89fh / push hl    ; empuja a mano la direccion de vuelta
    f7fb: ld a,008h / out (0abh),a  ; enciende el MOTOR de la cinta
    f7ff: ld a,00eh / out (0a0h),a  ; registro 14 del PSG, el del bit de cinta

Tampoco es una copia de la otra: se buscó su firma byte a byte en los tres
bloques y no aparece en ninguno.

Se caza poniendo un punto de observación no sobre una rutina, sino sobre el
**destino**: cualquier escritura en 0x61D0, que es donde el descriptor dice que
va la segunda parte. Salta con el contador de programa en 0xF849. Y lo que
queda ahí después coincide con el bloque de la cinta salvo 180 bytes de 29861
—el 99,4 %—, que son las variables que la segunda parte ya había tocado cuando
se miró.

## Dos motores distintos en una cinta

Las dos partes del juego no comparten motor, y se ve en el tamaño de sus
objetos. En las dos, cada entidad lleva apuntada en su estructura la rutina que
la gobierna, y el juego salta ahí con un `jp (hl)`. Capturando esos saltos con
el juego en marcha:

    la parte de naves:  los IX van de 8 en 8    (0xCB3A, 0xCB42 · 0xC8D8, 0xC8E0…)
    la parte de a pie:  los IX van de 46 en 46  (0xD068, 0xD096, 0xD0C4)

Las entidades de la segunda parte llevan una estructura casi seis veces mayor.

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
pantalla** en RAM, y una rutina que lo vuelca. El buffer está en 0x4B40 y mide
**960 bytes, 40 columnas por 24 filas**, y eso se sabe por dos caminos que
coinciden: lo dice el código (`ld de,04b40h`, `ld b,028h`, `ld c,018h`, y
0x4B40 + 40×24 = 0x4F00) y lo confirma el emulador, donde esa rutina hizo
**3.252.480 escrituras** con el puntero llegando exactamente hasta 0x4EFF.

Cuarenta columnas cuando en pantalla caben treinta y dos: esas ocho de más son
el margen que permite el scroll.

## La música se portó entera

Las tablas de música son las mismas, byte a byte:

    754 bytes, los 754 completos, idénticos a los de la versión de Spectrum

y la segunda parte reutiliza 259 de esos mismos bytes. Las dos mitades del juego
suenan con los mismos datos.

## Un intérprete de guiones

Dentro del juego de naves hay una máquina virtual pequeña. Los guiones que
gobiernan a los enemigos son bytes, y los que valen 0x80 o más son **opcodes**:

    e230: ld a,(bc) / cp 080h / jp c,0e231h   ; por debajo de 0x80 no es opcode
          sub 080h / ld hl,0e7a3h / call 0e5c0h / jp (hl)

y `0xE5C0` es exactamente «HL = tabla + A×2, HL = (HL)». La tabla de 0xE7A3
tiene **35 entradas**, y que son 35 y no más no es una estimación: la tabla
acaba en 0xE7E8 y el código del opcode 0x90 empieza pegado, en 0xE7E9.

## La pantalla de carga

![La pantalla que se ve mientras carga](imagenes/carga.png)

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
