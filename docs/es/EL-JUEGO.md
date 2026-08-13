# El juego

*Stardust* es un matamarcianos de scroll vertical. Se pilota una nave —el
Astrohunter— sobre la superficie de una flota de supercruceros enemigos que
va camino de la Tierra, esquivando o destruyendo lo que sale al paso hasta
llegar a los generadores de escudo.

Y luego, de repente, cambia de juego. Al superar la última zona de naves, el
protagonista aterriza y sigue a pie, y esa es la fase final.

Esta página reúne el juego tal como se ve y se oye: los gráficos, los 7+1
niveles con sus mapas, los textos, la música y dos capturas del juego en
marcha. El cómo y el porqué de cada cosa está contado en
[Hallazgos](HALLAZGOS.html).

## Los gráficos, sacados de la cinta

Nada de lo que hay aquí es una captura de pantalla: todo está dibujado a
partir de los bytes del binario, con la misma geometría que usa el propio
juego. Y eso es justo lo que lo convierte en una comprobación además de una
ilustración — si el reparto del bloque estuviera mal, lo que saldría es
ruido.

### El logo

![El logotipo STARDUST, dibujado desde la cinta](../imagenes/logo.png)

Es lo primero que hay en el bloque del juego: sus 256 primeros bytes, un
bitmap de 128×16 píxeles a 16 bytes por fila. Es el mismo rótulo que el
modo atracción anima rebotando sobre el área de juego, y el mismo que
encabeza la portada de esta web.

### Los 111 tiles del decorado

![Los 111 tiles de los niveles](../imagenes/tiles.png)

Ocupan de 0x6DE0 a 0xA55F y son de 32×32 píxeles, cuatro bytes por línea,
128 bytes cada uno. La cuenta cierra sola: 111 × 128 = 14 208, y 0x6DE0 +
14 208 = 0xA560, que es justo donde empiezan los sprites.

### Los 83 sprites

![Los 83 sprites del juego](../imagenes/sprites.png)

De 0xA560 a 0xBA1F, 16×16 píxeles con máscara: cada línea trae los bits del
dibujo y los de la máscara que dice qué píxeles son suyos, 64 bytes por
sprite en total. Esa máscara no es un capricho de diseño: es lo que
necesita el dibujado por software del Spectrum, que abre hueco con AND
antes de pintar con OR.

### La tipografía y los centinelas

![El juego de caracteres](../imagenes/charset.png)

59 caracteres de 8×8 en 0x6000, y los quince nodos centinela de 24×24, en
0x69A8:

![Los quince nodos centinela](../imagenes/centinelas.png)

## Los ocho niveles: siete zonas y una torre

El juego son en realidad 7+1 niveles: siete zonas que se sobrevuelan
pilotando la nave, y una octava —el propio marcador la numera ZONA:08— que
se escala a pie.

### Las siete zonas de naves

Cada zona ocupa unos 250 bytes en la cinta, que no da ni de lejos para un
mapa completo. Van comprimidos, y el esquema tiene su gracia: un
diccionario de frases recursivo. Cada byte del flujo es un token — si tiene
el bit 7 a cero es un número de tile que va directo al mapa, y si lo tiene
a uno los siete bits bajos indexan una frase del diccionario. Esa frase se
expande llamando a la misma rutina, así que una frase puede contener
otras. Es una gramática, no un simple copia-pega. Un 0xFF acaba el nivel.

Al expandirlos, las siete zonas dan exactamente 450 bytes, y que siete
flujos distintos caigan en el mismo tamaño es la señal de que el
descompresor lee bien. Y 450 = 6 × 75: el ancho no se elige, sale de que el
buffer de pantalla mide 24 caracteres de ancho y cada tile mide cuatro —los
ejes del buffer son fáciles de leer al revés, y con el ancho bueno los
mapas salen simétricos y con las estructuras enteras.

Cada byte es un índice de tile, y van de 0 a 110, justo cuando hay 111
tiles en total. La zona 7 usa el 110, el último de todos: otra comprobación
que sale sola sin buscarla. El color de cada zona viene de la misma tabla
que el puntero, y las siete ciclan entre tres: rojo, blanco y cian.

![Mapa de la zona 1](../imagenes/zona1.png)
![Mapa de la zona 2](../imagenes/zona2.png)
![Mapa de la zona 3](../imagenes/zona3.png)
![Mapa de la zona 4](../imagenes/zona4.png)
![Mapa de la zona 5](../imagenes/zona5.png)
![Mapa de la zona 6](../imagenes/zona6.png)
![Mapa de la zona 7](../imagenes/zona7.png)

Se rehacen con `tools/descomprime_nivel.py` y `tools/render_niveles.py`.

### La zona 8: la torre de a pie

La última zona no se sobrevuela: se escala. Su mapa está en 0x840B —78
filas de 6 celdas— y se dibuja con un pozo propio de 45 tiles de 32×32, así
que la torre entera mide 192×2496 píxeles, casi el doble de alta que las
siete zonas de naves juntas de ancho. Cada byte del mapa es dos cosas a la
vez, el dibujo de la celda y su física, y esa historia —con la cámara, los
checkpoints y la muerte por caída— está en
[Hallazgos](HALLAZGOS.html#la-torre-entera-y-un-mapa-que-es-dos-mapas).

![La torre de la fase de a pie, compuesta desde su mapa y sus tiles](../imagenes/torre_apie.png)

Abajo del punto de salida está el cartel de flechas que señala hacia arriba
—los tiles 0x28 y 0x29 solo aparecen ahí— y la fila 0 es una cornisa de
rosetas. La estructura sola, sin la trama de fondo, y su pozo de tiles:

![La estructura de la torre, sin la trama de fondo](../imagenes/torre_estructura.png)

![El pozo de 45 tiles de la torre](../imagenes/tiles_apie.png)

Se rehacen con `tools/render_torre.py`.

## El marco y la pantalla de carga

La pantalla de juego lleva un marco de adornos por los cuatro lados y deja
una ventana central para la acción, con la puntuación y el número de zona
abajo. El marco es muy de la época y muy de Spectrum: aprovecha que los
bordes no cambian nunca para llenarlos de detalle sin coste ninguno. No se
dibuja pieza a pieza en ningún momento: viene dibujado de fábrica dentro del
bloque del juego, y por eso puede componerse directamente desde la cinta:

![El marco de la pantalla de juego, dibujado desde los datos de la cinta](../imagenes/marco.png)

Cómo hereda su tabla de nombres de la pantalla de carga —y por qué eso le
permite al marcador escribir dibujos en vez de letras— está contado en
[Hallazgos](HALLAZGOS.html#el-marco-del-juego-viaja-en-el-bloque-y-la-pantalla-de-carga-le-deja-la-mesa-puesta).

![La pantalla que se ve mientras carga](../imagenes/carga.png)

La pantalla de carga tampoco es una captura: está dibujada a partir de los
12 288 bytes que su propio bloque vuelca a la memoria de vídeo. Va firmada
CANO, abajo a la izquierda.

## Los textos del juego

Leídos del binario, tal cual están escritos:

- El menú: `JOYSTICK`, `TECLADO`, `REDEFINIR TECLAS`, `JUGAR`.
- La tabla de récords viene de fábrica con nombres de la casa: `JAVIER
  100000`, `JUAN C 080000`, `MARTA 060000`, `MARIA 050000`, `TOPO 030000`,
  `SOFT 020000`.
- Y el aviso de que viene lo bueno, justo antes de la segunda carga:
  `HAS CONSEGUIDO PENETRAR LAS DEFENSAS DE LA NAVE INSIGNIA / PERO LO PEOR
  AUN NO HA LLEGADO`.

Y los créditos, que son con diferencia lo más interesante de todo el bloque
de texto, porque contestan la pregunta de fondo de este desensamblado:
quién hizo la versión de MSX. Los autores de la versión de ZX Spectrum
avisan en su propio repositorio de que ellos no la hicieron, y aquí está el
nombre, escrito en el propio binario:

```
CONVERSION POR
CARLOS ARIAS
GRAFICOS
JUAN CARLOS Y JAVIER AREVALO
...ADEMAS DE...
JULIO MARTIN
MUSICA COMPUESTA POR
GOMINOLAS
BASADO  EN
UNA IDEA  ORIGINAL
JOSE MANUEL  MU&OZ
TOPO SOFT
```

Los gráficos siguen siendo de los hermanos Arévalo, los mismos de la
versión original, lo que encaja con que el dibujo se trajera tal cual, sin
retocar. La conversión del código, en cambio, la firma Carlos Arias. Y ese
`&` de `MU&OZ` no es una errata de transcripción: es sencillamente cómo la
tipografía del juego codifica la eñe.

## La música, tal como la soltó el chip

Stardust guarda su música en un lenguaje propio de quince comandos, y esa
historia —el intérprete, las tres voces, una partitura que no tiene ni una
nota— está contada en [Hallazgos](HALLAZGOS.html#el-sonido-es-un-lenguaje).
Aquí está el resultado: lo que de verdad se oía en 1987.

Estas dos piezas no son una síntesis del listado, ojo: son lo que el chip
de sonido llegó a emitir de verdad, capturado registro a registro con el
juego corriendo en el emulador y vuelto a convertir en sonido. Por eso
llevan «medida» en el nombre. La lectura de la partitura se verificó
aparte, cuadro a cuadro, contra estas mismas capturas.

La música del juego de naves —la progresión do–la–fa–sol, dos compases por
acorde—:

<audio controls src="../audio/musica_naves_medida.mp3"></audio>

Y la de la tabla de récords de la fase de a pie:

<audio controls src="../audio/musica_records_medida.mp3"></audio>

## Y así se ve corriendo

Todo lo de arriba está dibujado desde la cinta. Estas dos imágenes son
justo lo contrario: dos fotogramas de la partida grabada que viene en el
repositorio (`Stardust.omr`), sacados con openMSX en los segundos 1002 y
2150 de la grabación. Un render demuestra que los datos se han entendido
bien; una captura demuestra otra cosa distinta, que el programa arranca y
corre de verdad.

![La fase de naves en el segundo 1002 de la grabación: ZONA:05](../imagenes/emulador_naves.png)

![La fase de a pie en el segundo 2150: el marcador dice ZONA:08](../imagenes/emulador_apie.png)

La segunda vale además como prueba de la multicarga, y por eso está tomada
tan tarde: en esa partida el jugador supera la zona 7, el juego vuelve a la
cinta —el motor se enciende en el segundo 1552,20— y lo que sigue corriendo
ya es el otro programa. No hace falta creerse el marcador sin más: volcando
la memoria de 0x61D0 a 0xD674 en ese instante, 29 585 de sus 29 861 bytes
—el 99,08 %— son los del cuarto bloque de la cinta, contra solo 674 del
bloque de naves que había antes en esas mismas direcciones. Y el contador
de programa está en 0xA9BA, ya dentro de la segunda parte.
