# La cinta

> **Note:** this page is not translated yet. The documentation is written in
> Spanish first and translated afterwards; this is the Spanish text. The
> figures, addresses and code fragments read the same in both languages.


94 228 bytes de fichero TSX, que al abrirlos dan **93 861 bytes de contenido**
repartidos en siete bloques. Lo raro empieza en el primer vistazo: dos de ellos
están grabados como manda el MSX y **cuatro no**.

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

Los tres primeros son **bloques KCS**, el formato de cinta del MSX, con su
cabecera y su nombre de fichero. Los cuatro siguientes son **bloques del ZX
Spectrum**: una bandera, los datos y un XOR de comprobación. Los cuatro traen
ese XOR correcto, comprobado uno a uno.

## La cadena de carga

Empieza en el cargador BASIC, que son cinco líneas:

```basic
10 COLOR 1,1,1:SCREEN 2
20 BLOAD"cas:",R          ' el logo, que se ejecuta solo
30 BLOAD"cas:"            ' el cargador turbo, que NO se ejecuta
40 CLS:COLOR 0,0,0:SCREEN 2
50 DEFUSR=54000!:A=USR(0) ' 54000 = 0xD2F0: ahora si
```

Y sigue en el cargador turbo, que hace esto por orden:

1. Busca RAM y la mapea en las páginas 1 y 2, para tener los 64K planos.
2. Se copia 300 bytes a sí mismo en 0x4000 y salta allí.
3. Salva 94 bytes de 0xDAC0 a 0xFDE8 (el buzón de parches) y pone la pila.
4. Carga el bloque de la pantalla **y lo ejecuta**.
5. Carga el bloque del juego encima, machacando al anterior.
6. Aplica los parches del buzón, si los hay.
7. Salta a 0xBD85, que es el juego.

El descriptor de ocho bytes y el último bloque no los carga él: los pide el
propio juego al superar la última zona.

## Los bloques se pisan unos a otros

Esto es lo que obliga a mirar la cinta de otra forma. En memoria, los bloques
**no conviven**:

```
pantalla de carga   0x9B8C - 0xCC3F
juego de naves      0x47A0 - 0xFDE6    <- machaca a la pantalla entera
segunda parte       0x61D0 - 0xD674    <- cae dentro del juego
```

O sea que no hay una imagen de 64K que contenga todo el juego, sino **tres fotos
de la memoria en momentos distintos**. Cada listado va con el `org` de donde se
ejecuta de verdad, y el presupuesto de bytes se suma sobre los bloques de la
cinta y no sobre el mapa de memoria: si se sumara sobre la memoria, los bytes
que se pisan se contarían mal.

## Cuánto se trajo del Spectrum

Aquí había un cuadro con porcentajes de coincidencia byte a byte contra el
binario de la versión de Spectrum. **Se ha retirado**, y conviene explicar por
qué en vez de borrarlo sin más.

Los producía `tools/coteja_spectrum.py`, que localizaba cada sección del otro
binario cogiendo sus primeros 32 bytes y buscándolos con un `find`: se quedaba
con la **primera** coincidencia, sin comprobar que fuera la única ni que el
desplazamiento resultante encajara con el del resto de secciones. Como las dos
versiones comparten buena parte del dibujo, esas agujas caían dentro de la
tilería, y de ahí salieron tanto los porcentajes como una tanda de nombres de
rutina colocados en direcciones que son gráficos.

Lo que sí se sostiene sin esa herramienta, porque se lee en el propio binario de
MSX: el cargador es **código de MSX de cabo a rabo** —tiene que mapear RAM en
las páginas y hablar con el chip de sonido y con el puerto del motor de la
cinta, cosas que en el Spectrum no existen o están en otro sitio— y la pantalla
de carga va firmada por Cano, o sea que es de esta versión.

Cuando la búsqueda esté arreglada y exija coincidencia única y desplazamiento
coherente, el cuadro volverá con cifras que se puedan defender.
