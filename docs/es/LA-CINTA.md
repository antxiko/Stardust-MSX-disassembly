# La cinta

Son 94 228 bytes de fichero TSX, que al abrirlos dan 93 861 bytes de
contenido repartidos en siete bloques. Y lo raro salta a la vista desde el
primer momento: dos de esos bloques están grabados como manda el MSX, y
los otros cuatro no.

## Los siete bloques

| | bloque | bytes | dónde va | qué es |
|---|---|---|---|---|
| 1 | `STARDU` | 256 | — | el cargador BASIC, texto plano |
| 2 | `TOPO` | 4254 | 0x9470 | el logo animado de la casa |
| 3 | `LOADER` | 351 | 0xD2F0 | el cargador turbo |
| 4 | — | 12 468 | 0x9B8C | la pantalla de carga, y se ejecuta |
| 5 | — | 46 663 | 0x47A0 | el juego de naves, zonas 1 a 7 |
| 6 | — | 8 | — | un descriptor de ocho bytes |
| 7 | — | 29 861 | 0x61D0 | la segunda parte, la de a pie |

Los tres primeros son bloques KCS, el formato de cinta del MSX, con su
cabecera y su nombre de fichero de toda la vida. Los cuatro siguientes son
bloques del ZX Spectrum: una bandera, los datos y un XOR de comprobación al
final. Los cuatro traen ese XOR correcto, comprobado uno a uno.

## La cadena de carga

Empieza en el cargador BASIC, que no son más que cinco líneas:

```basic
10 COLOR 1,1,1:SCREEN 2
20 BLOAD"cas:",R          ' el logo, que se ejecuta solo
30 BLOAD"cas:"            ' el cargador turbo, que NO se ejecuta
40 CLS:COLOR 0,0,0:SCREEN 2
50 DEFUSR=54000!:A=USR(0) ' 54000 = 0xD2F0: ahora si
```

Y sigue en el cargador turbo, que hace esto por orden: busca RAM y la mapea
en las páginas 1 y 2, para tener 48K planos de 0x4000 a 0xFFFF, como los
del Spectrum; se copia 300 bytes a sí mismo en 0x4000 y salta allí; salva
94 bytes de 0xDAC0 a 0xFDE8, que es el buzón de parches, y pone la pila;
carga el bloque de la pantalla y lo ejecuta; carga el bloque del juego
encima, machacando al anterior; aplica los parches del buzón, si los hay; y
por fin salta a 0xBD85, que es el juego.

El descriptor de ocho bytes y el último bloque no los carga él: los pide el
propio juego, más tarde, al superar la última zona.

## Los bloques se pisan unos a otros

Y esto es justo lo que obliga a mirar la cinta de otra manera. En memoria,
los bloques no conviven en absoluto:

```
pantalla de carga   0x9B8C - 0xCC3F
juego de naves      0x47A0 - 0xFDE6    <- machaca a la pantalla entera
segunda parte       0x61D0 - 0xD674    <- cae dentro del juego
```

O sea que no hay una única imagen de 64K que contenga todo el juego, sino
tres fotos de la memoria en momentos distintos. Cada listado va con el
`org` de donde se ejecuta de verdad, y el presupuesto de bytes se suma
sobre los bloques de la cinta y no sobre el mapa de memoria — si se sumara
sobre la memoria, los bytes que se pisan se contarían mal, dos veces
algunos y ninguna otros.

Y esto no es un tecnicismo sin más: una dirección sin un instante al lado
no significa nada aquí, porque varios programas comparten las mismas
direcciones en momentos distintos. Muestreando el contador de programa de
una partida real salen 122 direcciones con pinta de código ejecutándose
dentro de la tilería, y no lo son: 66 pertenecen al logo de TOPO, 9 a la
pantalla de carga, y 56 caen por debajo de 0x8000, que es la ROM del BASIC
hasta que el cargador mapea RAM encima.

## Cuánto se trajo del Spectrum

La herramienta de cotejo (`tools/coteja_spectrum.py`) alinea los dos
binarios enteros: indexa las ventanas del binario de Spectrum, cuenta qué
desplazamientos aparecen una y otra vez, y con los dominantes extrae las
rachas máximas de bytes idénticos. Cada tramo que da por común trae su
prueba consigo — dónde empieza en cada binario, cuánto mide y con qué
desplazamiento. Buscar cada sección solo por sus primeros 32 bytes y
quedarse con la primera coincidencia no vale de nada aquí: como las dos
versiones comparten el dibujo, esas agujas caen dentro de la tilería.

Y lo que sale de ahí reformula bastante la idea que uno se hace de esta
conversión:

```
25.015 bytes idénticos al Spectrum      53,6 % del bloque
   de esos, CÓDIGO:      81 bytes        0,3 %
   de esos, DATOS:   24.934 bytes       99,7 %
```

El código no se comparte. Se trajeron el dibujo y los datos byte a byte —y
en la misma dirección, con desplazamiento cero: los gráficos ocupan
0x6037–0xA55F y 0xA561–0xBD84 en las dos máquinas— pero el código se
reescribió de cero. Los dos únicos tramos de código que sí coinciden, de 55
y 24 bytes, son tiras desenrolladas de `adc hl,hl`: salen iguales porque
son la misma instrucción repetida muchas veces, no porque nadie las
copiara a propósito.

Y eso encaja con lo que dice la propia pantalla de créditos, que firma la
conversión Carlos Arias mientras los gráficos siguen siendo de los
hermanos Arévalo, los mismos del original.

De los nombres del fichero de control del Spectrum, 20 de 138 quedan
respaldados por bytes idénticos. Entre ellos están los datos de las siete
zonas, la geometría de los tiles —«111 tiles at 4x32 bytes per tile», que
coincide exactamente con lo que mide este proyecto por su cuenta— y el
mensaje `DEMO`, en la misma cadena de texto.

De la parte de a pie el cotejo no puede decir nada, y no es culpa de la
herramienta: los propios autores del desensamblado de Spectrum avisan en su
README de que *«the entire on-foot second stage of the game also fell
outside the scope»*. Sencillamente no la desensamblaron, así que no está en
la instantánea con la que aquí se compara.
