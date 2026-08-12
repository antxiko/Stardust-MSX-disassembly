# Empezar

## Lo que hace falta

`pasmo` y `z80dasm` para ensamblar y desensamblar, y Python 3 para las
herramientas. Para las capturas y para los arneses que sacan datos del juego en
marcha, `openmsx`.

**La cinta no se distribuye** con este repositorio: solo el trabajo de
documentación. Hace falta tu propia copia, con el nombre `stardust.tsx` en la
raíz del proyecto, y tiene que dar este sha256:

    8f4fb3840e5ad043d8d694faeaa86a6e4a5cd2cabe5dd99fec08e5cf0a7dbb13

## Las órdenes

```sh
make          # extrae los bloques, genera los listados y lo comprueba todo
make test     # solo los tests
make web      # regenera la web de docs/
```

`make` sin más hace el ciclo entero y **falla si algo no cuadra**: si un listado
deja de reproducir su bloque byte a byte, si el trazador se mete en una zona de
datos, si un punto de entrada cae dentro de un rango declarado como datos, o si
queda un solo byte de la cinta sin asignar.

## Sin la cinta

Se pueden leer los listados de `src/` y las notas, que es donde está el trabajo.
Y los tests que no dependen del binario pasan igual: hay unos cuantos que solo
hacen cuentas sobre las cifras publicadas y se ejecutan sin nada más.

## Cómo está organizado

Cada bloque de la cinta tiene tres ficheros que gobiernan su desensamblado:

| | |
|---|---|
| `src/X.entries` | los puntos de entrada: por dónde empieza a trazar |
| `src/X.nocode` | las zonas que NO son código, y por qué se sabe |
| `src/X.notes` | las anotaciones y los rangos de datos con su explicación |

De ahí salen los `src/stardust_X.asm`, que **no se editan a mano**: se generan.
Si quieres cambiar un comentario, va en el `.notes`.

Esa separación es lo que permite que el listado y su comprobación no puedan
divergir: el fichero que se publica es el que se verifica.

## Las herramientas que más se usan

| | |
|---|---|
| `tools/perfil.py` | radiografía un binario y dice dónde cambia la naturaleza de los datos |
| `tools/clasifica_huecos.py` | clasifica un rango midiendo, y dice de qué medida sale |
| `tools/check_entradas.py` | rechaza cualquier punto de entrada que caiga dentro de un rango declarado como datos |
| `tools/coteja_spectrum.py` | coteja este binario contra el de la versión de Spectrum |
| `tools/render_graficos.py` | dibuja tiles, sprites y tipografía desde la cinta |
| `tools/omsx_*.tcl` | arneses de openMSX: sacan del juego en marcha lo que el binario no dice |
| `tools/omsx_replay.tcl` | reproduce una partida grabada y muestrea el contador de programa |

## Si quieres tirar del hilo

Ya no quedan bytes sin dueño ni rutinas sin comentar, pero sí cabos sueltos
—los 149 bytes de música que nadie nombra, el modo de ruido que ninguna
partitura enciende—, y están contados con sus cifras en
[Preguntas abiertas](PREGUNTAS-ABIERTAS.html). Todo lo necesario para mirarlos
está en el repositorio.
