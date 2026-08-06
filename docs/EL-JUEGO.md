# El juego

> **Note:** this page is not translated yet. The documentation is written in
> Spanish first and translated afterwards; this is the Spanish text. The
> figures, addresses and code fragments read the same in both languages.


*Stardust* es un matamarcianos de scroll vertical. Se pilota una nave —el
Astrohunter— sobre la superficie de una flota de supercruceros enemigos que va
camino de la Tierra, esquivando o destruyendo lo que sale al paso hasta llegar a
los generadores de escudo.

Y luego cambia de juego. Al superar la última zona de naves, el protagonista
**aterriza y sigue a pie**, y esa es la fase final.

## Los gráficos, sacados de la cinta

Nada de lo que hay aquí son capturas: todo está dibujado a partir de los bytes
del binario, con la geometría que usa el propio juego. Eso es lo que lo
convierte en una comprobación y no en una ilustración: si el reparto del bloque
estuviera mal, saldría ruido.

### Los 111 tiles del decorado

![Los 111 tiles de los niveles](imagenes/tiles.png)

Ocupan de 0x6DE0 a 0xA55F y son de **32×32 píxeles**, cuatro bytes por línea,
128 bytes cada uno. La cuenta cierra sola: 111 × 128 = 14 208, y 0x6DE0 + 14 208
= 0xA560, que es justo donde empiezan los sprites.

### Los 83 sprites

![Los 83 sprites del juego](imagenes/sprites.png)

De 0xA560 a 0xBA1F, **16×16 píxeles con máscara**: cada línea trae los bits del
dibujo y los de la máscara que dice qué píxeles son suyos. Son 64 bytes por
sprite. Esa máscara no es un capricho: es lo que necesita el dibujado por
software del Spectrum, que abre hueco con AND antes de pintar con OR.

### La tipografía y los centinelas

![El juego de caracteres](imagenes/charset.png)

59 caracteres de 8×8 en 0x6000, y los quince nodos centinela de 24×24 en 0x69A8.

## El marcador y las zonas

La pantalla de juego lleva un marco de adornos por los cuatro lados y deja una
ventana central para la acción, con la puntuación y el número de zona abajo. El
marco es muy de la época y muy de Spectrum: aprovecha que los bordes no cambian
para llenarlos de detalle sin coste.

## Los textos del juego

Leídos del binario, tal cual están:

- El menú: `JOYSTICK`, `TECLADO`, `REDEFINIR TECLAS`, `JUGAR`.
- La tabla de récords viene de fábrica con nombres de la casa: `JAVIER 100000`,
  `JUAN C 080000`, `MARTA 060000`, `MARIA 050000`, `TOPO 030000`, `SOFT 020000`.
- Los créditos: `MUSICA COMPUESTA POR GOMINOLAS` y `BASADO EN UNA IDEA ORIGINAL
  DE JOSE MANUEL MUÑOZ`.
- Y el aviso de que viene lo bueno, justo antes de la segunda carga:
  `HAS CONSEGUIDO PENETRAR LAS DEFENSAS DE LA NAVE INSIGNIA / PERO LO PEOR AUN
  NO HA LLEGADO`.
