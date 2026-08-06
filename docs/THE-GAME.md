# The game

*Stardust* is a vertically scrolling shoot'em up. You fly a ship —the
Astrohunter— over the surface of a fleet of enemy supercruisers heading for
Earth, dodging or destroying whatever comes at you until you reach the shield
generators.

And then it changes game. On clearing the last ship zone the character **lands
and carries on on foot**, and that is the final stage.

## The graphics, taken out of the tape

None of what follows is a screenshot: it is all drawn from the bytes of the
binary, using the geometry the game itself uses. That is what makes it a check
rather than an illustration — if the block's layout were wrong, noise would come
out.

### The 111 scenery tiles

![The 111 level tiles](imagenes/tiles.png)

They run from 0x6DE0 to 0xA55F and are **32×32 pixels**, four bytes per line,
128 bytes each. The arithmetic closes on its own: 111 × 128 = 14,208, and
0x6DE0 + 14,208 = 0xA560, which is exactly where the sprites begin.

### The 83 sprites

![The game's 83 sprites](imagenes/sprites.png)

From 0xA560 to 0xBA1F, **16×16 pixels with a mask**: each line carries the bits
of the drawing and the bits of the mask that says which pixels belong to it.
That is 64 bytes per sprite. The mask is not a flourish — it is what the
Spectrum's software drawing needs, opening a hole with AND before painting with
OR.

### The charset and the sentinels

![The character set](imagenes/charset.png)

59 characters of 8×8 at 0x6000, and the fifteen 24×24 sentinel nodes at 0x69A8.

## The seven zone maps

Each zone takes about **250 bytes** on the tape, nowhere near enough for a map.
They are **compressed**, and the scheme is a pretty one: a *recursive* phrase
dictionary. Every byte of the stream is a token; with bit 7 clear it is a tile
number that goes straight into the map, and with bit 7 set the low seven bits
index a phrase in the dictionary. That phrase is expanded by calling the same
routine, so **a phrase can contain other phrases**. It is a grammar, not a
copy-paste. An 0xFF ends the level.

Expanded, all seven zones come to **exactly 450 bytes**. Seven different streams
landing on the same size is the sign that the decompressor is reading it right.
And 450 = 6 × 75: the width isn't a choice, it follows from the screen buffer
being 24 characters wide and each tile being four. (This went out as 10 × 45,
from reading the buffer's axes backwards; with the right width the maps come out
symmetrical and with their structures whole.)

Every byte is a tile index, and they run from 0 to 110 when there are exactly
111 tiles. Zone 7 uses number 110, the last one. Another check that falls out on
its own.

Each zone's colour comes from the same table as its pointer, and the seven cycle
through three: red, white and cyan.

![Zone 1 map](imagenes/zona1.png)
![Zone 2 map](imagenes/zona2.png)
![Zone 3 map](imagenes/zona3.png)
![Zone 4 map](imagenes/zona4.png)
![Zone 5 map](imagenes/zona5.png)
![Zone 6 map](imagenes/zona6.png)
![Zone 7 map](imagenes/zona7.png)

They are rebuilt with `tools/descomprime_nivel.py` and `tools/render_niveles.py`.

## The panel and the zones

The play screen carries a decorated frame on all four sides and leaves a central
window for the action, with the score and the zone number along the bottom. The
frame is very much of its time and very much of the Spectrum: it takes advantage
of the fact that the borders never change to fill them with detail at no cost.

## The game's text

Read out of the binary, exactly as it sits there:

- The menu: `JOYSTICK`, `TECLADO`, `REDEFINIR TECLAS`, `JUGAR` — joystick,
  keyboard, redefine keys, play.
- The high-score table ships from the factory with in-house names: `JAVIER
  100000`, `JUAN C 080000`, `MARTA 060000`, `MARIA 050000`, `TOPO 030000`,
  `SOFT 020000`.
- And the credits, which are the most interesting thing in the whole text block,
  because they answer the question underlying this disassembly: **who made the
  MSX version**. The authors of the ZX Spectrum version warn in their own
  repository that they did not make it, and here is the name, in the binary:

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

  "Conversion by Carlos Arias; graphics by Juan Carlos and Javier Arévalo; and
  also Julio Martín; music composed by Gominolas; based on an original idea by
  José Manuel Muñoz." The graphics are still the Arévalo brothers', the same as
  the original version, which fits with the artwork having been carried across
  as it was. The conversion of the code, on the other hand, is signed by Carlos
  Arias. That `&` in `MU&OZ` is not a transcription slip: it is how the game's
  charset encodes the letter ñ.
- And the notice that the good part is coming, right before the second load:
  `HAS CONSEGUIDO PENETRAR LAS DEFENSAS DE LA NAVE INSIGNIA / PERO LO PEOR AUN
  NO HA LLEGADO` — you have broken through the flagship's defences, but the
  worst is yet to come.
