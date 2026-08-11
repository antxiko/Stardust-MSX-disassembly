# Findings

Stardust is a ZX Spectrum conversion, and that much was known. What wasn't
expected on opening the tape is **how far the conversion goes**: they didn't
bring the graphics across and rebuild the rest, they brought the recording
system, the load routine and the way of drawing. What follows is what turned up
on taking it apart, each thing with the evidence that holds it up.

## Who actually made this version

The ZX Spectrum authors warn in their own repository that the MSX version was
done by other people. The game answers the question itself, in its credits
screen, at 0xF124:

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

The conversion is **Carlos Arias**. The graphics stay with the Arévalo brothers,
the same as the original version, which fits with the artwork having been
carried over as it stood.

## This isn't an MSX tape

MSX games are recorded in **KCS** blocks, the system's own format: the BIOS
writes them and the BIOS reads them.

Not Stardust. Its four data blocks are **ZX Spectrum blocks**, with the
structure from over there: a flag byte, the data, and a final byte that is the
XOR of everything before it. All four carry that checksum correctly, verified
one by one; it is the only integrity check the tape has.

And the loader is a **reimplementation of LD-BYTES**, the Spectrum ROM's load
routine, with the same register interface:

    ld ix,047a0h    ; IX = where it goes
    ld de,0b647h    ; DE = how many bytes
    ld a,000h       ; A  = the flag expected
    scf             ; carry set = load, don't verify
    call 0405ch

Anyone who has programmed a Spectrum will recognise that call: it is the one at
`0x0556` in its ROM, parameter for parameter.

## The 64K the Spectrum has and the MSX doesn't

Before loading anything, the loader does something an ordinary MSX game would
never need to: it **hunts for RAM and maps it into pages 1 and 2**.

    ld hl,04000h / call sub_d30fh
    ld hl,08000h / call sub_d30fh

The routine at `0xD30F` tries writing into each slot with `ENASLT` (the BIOS
call at `0x0024`) until it finds RAM. The reason is that the Spectrum has 48K of
flat RAM and the MSX doesn't: on the MSX the lower half of memory is taken by
the BASIC ROM. For the ported game to find memory where it expects it, the ROM
has to be got out of the way.

## The loader ships with a back door for trainers

This is the best one. Before starting the game, the loader copies **94 bytes**
from 0xDAC0 to 0xFDE8 —high memory, where nothing is going to overwrite them—
and then looks at what is in them:

    4040: ld hl,0fde8h / ld b,003h
    4045: ld a,(hl) / cp 0c9h / jp nz,0bd85h   ; three 0xC9 as a signature?
    404e: ld b,(hl)                            ; B = how many patches
    4050: ld e,(hl) / ld d,(hl) / ld a,(hl)    ; address and value
    4056: ld (de),a / djnz 4050                ; apply them
    4059: jp 0bd85h                            ; and now, off to the game

If those 94 bytes begin with three `0xC9`, the loader treats them as a list of
patches and applies them to the freshly loaded game. It is **a factory-fitted
POKE applier**, inside the game's commercial loader.

And the arithmetic says how many it was built for: 3 bytes of signature + 1
counter + **30 patches of 3 bytes each = 94**. Sized for exactly thirty.

That explains why the magazine loaders of the period worked so well with this
game. The one in *Input MSX* number 19 writes with `FOR I=56000 TO 56012`, and
56000 is 0xDAC0: the mailbox. Its three patches, read out of the binary before
applying them:

    0xC06E/6F:  38 1F (jr c,+31)  ->  18 EC (jr -20)
    0xF7B1:     01 -> 00

The first turns a conditional jump into an unconditional one, skipping a check
that sits right behind `ld a,(0c188h) / cp 004h`. The second changes the `1` of
an `ld a,001h` into a `0`. Applied by the game's own loader, the ship survived
sixteen minutes straight.

## How the game asks for the second part

On clearing the last ship zone a screen comes up reading

    FELICIDADES
    HAS CONSEGUIDO PENETRAR LAS DEFENSAS DE LA NAVE INSIGNIA
    PERO LO PEOR AUN NO HA LLEGADO

and the game goes back to the cassette for the second part, the one on foot.

The interesting bit is **how**. The loader's load routine survives in page 1 for
the whole game —the game loads from 0x47A0 up and doesn't tread on it— so the
obvious thing would be for it to call that. It doesn't: a watchpoint on it never
fired **once in 4000 seconds of play**. The game brings its own:

    f7f6: ld hl,0f89fh / push hl    ; the return address, pushed by hand
    f7fb: ld a,008h / out (0abh),a  ; switches on the tape MOTOR
    f7ff: ld a,00eh / out (0a0h),a  ; PSG register 14, the tape-bit one

Nor is it a copy of the other one: its signature was searched for byte by byte
across the three blocks and appears in none of them.

It is caught by putting a watchpoint not on a routine but on the **destination**:
any write to 0x61D0, where the descriptor says the second part goes. It fires
with the program counter at 0xF849. And what is left there afterwards matches
the tape's block except for 180 bytes out of 29,861 —99.4%— which are the
variables the second part had already touched by the time it was looked at.

**One open question, and it is left open.** Replaying a complete recorded
playthrough, a breakpoint on 0xF7F6 never fired, and during the second load the
program counter falls in ROM (0x1B09–0x1B2B). That doesn't square with the
finding above, which was measured with the magazine's POKEs applied. Until it is
measured properly, neither version is being written down as settled.

## Two different engines on one tape

The two halves of the game don't share an engine, and it shows in how they
carry their creatures. In the ship part each entity points to its governing
routine inside its 8-byte structure, and the game jumps there with a `jp (hl)`:
capturing those jumps with the game running, the IX values go up in 8s (0xCB3A,
0xCB42 · 0xC8D8, 0xC8E0…).

The foot part doesn't treat its enemies that way: they live in tables of
**5 bytes per object** —the walkers at 0xACE4, four at most; the flyers at 0xACF9; the
turret's two shots at 0xAD04— and carry no routine pointer: fixed loops move
them, one per species. (This page used to say "the IX values go up in 46s:
entities almost six times bigger", from mistaking what its `jp (hl)` at 0xC544
dispatches for the enemies. The measurement was good, the reading wasn't: those
IX —0xD068, 0xD096, 0xD0C4, three consecutive 46-byte slots exactly— belong to
**another** structure, the variables area at 0xD068-0xD117 that arrives from
the tape zeroed. Which subsystem that is remains open.)

What they do share is the craft of drawing. Comparing 40 bytes of the sprite
routine of one part against the other, **only six differ**, and three of those
are `and (hl)` against `or (hl)`. It is the Spectrum technique, from a machine
with no hardware sprites: the image is shifted bit by bit with an unrolled run
of `adc hl,hl`, a hole is opened with AND, and it is painted with OR.

## What the MSX forced them to change

There is a difference of substance between the two machines that the conversion
could not dodge. The Spectrum writes **directly** into its screen memory, which
is ordinary RAM at 0x4000. On the MSX, video memory sits behind the graphics
chip and cannot be addressed: it has to be sent byte by byte through a port.

So this version carries something the original doesn't need: a **screen buffer**
in RAM, and a routine that dumps it. The buffer runs from **0x4000 to 0x4EFF:
3,840 bytes, 24 wide by 160 tall**, and the dump moves it to VRAM in **three
bands** —0x4000 with 56 rows, 0x4540 with 64 and 0x4B40 with 40—, one per call
of the routine, each into its own third of SCREEN 2. The code says so (the
three calls at 0xF3DC, contiguous and closing to the byte) and the emulator
confirms it, where that routine made **3,252,480 writes** with the pointer
walking exactly 0x4000-0x4EFF.

**The axes went out backwards**, and it is worth telling because the error
spread. The dump's `ld b,028h` was read as "40 columns", but it is the inner
loop and it walks the buffer in steps of 24: it collects 40 bytes from a single
column. The one counting columns is the outer loop, `ld c,018h`, stepping one
byte at a time, 24 times.

Drawing it catches it: 24 at a time gives a legible high-score table; 40 at a
time, noise. And it fits what you see while playing, which is where the doubt
came from: 24 bytes are 192 pixels, narrower than the screen —which is why the
frame down the sides never moves— and the surplus is vertical, which is the way
it scrolls.

## The on-foot stage has its own demo, and its own recorded game

The ship part's demo isn't a machine playing: it is **869 bytes of recorded
game**, one byte per frame. The on-foot stage has its own, and it could not be
otherwise: the ships' recording sits at 0xBA20 and its reader at 0xC1AF, and
**both addresses fall inside 0x61D0-0xD674** — which the second part overwrites
as it loads.

Its own starts at **0x9FF3** and runs to **646 bytes**, which at 50 Hz is 12.9
seconds. The code says where —`ld hl,09ff3h` at 0xA3FF— and the boundary is
visible to the naked eye, because just before it there is artwork:

```
9FE3  55 55 55 55 AA AA AA AA 55 55 55 55 AA AA AA AA   <- halftone, two values
9FF3  00 00 00 00 00 00 00 00 ...                       <- not any more
```

The 646 bytes use 17 distinct values, **all even and none above 0x1E**: the
control mask, one byte per frame.

The interesting part is **how it is switched on**. At 0xA688 there is a call
whose operand is rewritten from two places:

```
a313: ld hl,0a6fch / ld (0a689h),hl   <- normal play: read the controls
b6ca: ld hl,0a6eeh / ld (0a689h),hl   <- demo: read the recording
```

The same call, two sources, switched by patching the code. And the DEMO label
blinking in the bottom right **consults no flag at all**: it asks the patched
instruction.

```
a4d1: ld a,(0a689h)   ; the operand of that call
a4d4: cp 0eeh         ; does it point at 0xA6EE, the recording's reader?
a4d6: jr nz,...       ; if not, we are not in demo mode
```

This turned up because a player finished the game and reported that, after the
high-score table, a demo started **of the on-foot stage**. The reader was inside
a range this project had labelled "table".

## What this page used to say about the music, and why it doesn't

It used to claim here that the music tables had been carried across whole, with
754 bytes identical to the ZX Spectrum version's at 0xAB0E. **That is
withdrawn.**

The match came from the same cross-check tool whose search turned out to be
unsound, and 0xAB0E falls inside the range this project declares as sprites
(0xA560–0xBA20). So the "finding" amounted to locating artwork where code was
being looked for, which is exactly the fault that contaminated the whole trace.

That the two halves of the game sound alike can still be looked into —and there
is a sound routine identified in the MSX binary— but the strong claim, the one
about the 754 bytes, does not stand until the cross-check is redone with a
search that demands a unique match.

## The same lettering, sharp or see-through

On the high-score table the text comes out with its pixels separated, as though
half transparent, while the `DEMO` label is perfectly sharp. They look like two
typefaces. It is the same routine, and the difference is made by **patching the
code on the fly**.

The routine that draws a character draws it at double height: each line of the
font is painted twice, and each copy is masked with a different pattern.

```
d4d0: ld a,(de) / and 055h / or (hl) / ld (hl),a / add hl,bc
      ld a,(de) / and 0aah / or (hl) / ld (hl),a / add hl,bc
```

`0x55` and `0xAA` are `01010101` and `10101010`: alternating pixels, offset from
one line to the next. The result is a checkerboard, which reads as a half tone.

And here is the trick: those two masks **are not constants**. They are the
operands of those two `and` instructions, at 0xD4D3 and 0xD4D9, and the game
rewrites them before drawing:

```
bfb4: ld a,0ffh / ld (0d4d3h),a / ld (0d4d9h),a   ; neutral mask
bfbc: ld ix,0ddf2h                                ; the "DEMO" string
bfc0: ld hl,04d94h / call 0d4e5h                  ; draw
bfc6: ld a,055h / ld (0d4d3h),a
bfcb: ld a,0aah / ld (0d4d9h),a                   ; and put them back
```

With `0xFF` the `and` removes nothing and every pixel comes through. It is
self-modifying code used as if it were a parameter.

Along the way the routine confirms where the font lives: it indexes with
`0x5F00 + code×8`, and with the first code being 0x20 that lands on 0x6000,
exactly where the 59 characters are. And the stride between screen lines is 24,
the height of the column-major buffer.

## One plane only, and why it looks like two

Anyone who played it remembers two floors moving at different speeds, with that
sense of depth. It got looked into properly: watching which routine writes into
each band of the buffer, and building, frame by frame, the table of "which row
was drawn from which address", which lets the displacement be measured by exact
integer equality instead of by comparing images.

The verdict is emphatic: **the background is a single plane**. Across four
measurements —three moments of the on-foot stage and one of the ship stage—
the buffer's eighteen strips (three bands by six columns) move **identically**:
+2 rows per frame walking, 0 standing still, −2 backwards, at 100 % exact
match and with no horizontal displacement at all.

The depth lives somewhere else: in the **drawing order**. Numbering every
write into the buffer within a frame, the ship stage always produces the same
sequence: first the whole background, then the sprites, and **after the
sprites** one more routine (0xC77A) that paints scenery columns from its own
tile store. It was caught doing it live: a pillar coming down, the ship
climbing towards it, and when their destinations crossed, the pillar got
painted on top. The ship doesn't fly *under the floor*: it flies **behind
whatever gets repainted afterwards**.

And in the on-foot stage the parallax **really exists** — it just isn't a
plane: it is a picture that gets redrawn differently. The background is
painted **twice per frame by patching an opcode**: the game loop writes `0xC2`
(`jp nz`) into 0xA98E and calls the redraw —so only the empty cells get
painted, and they carry tile 0— then writes `0xCA` (`jp z`) and calls it
again, for the solid ones. And that tile 0 is alive: every scroll step
**rotates it by one pixel row** (0xB140 going up, 0xB167 going down; the row
that leaves comes back in on the other side). One row of pattern for every two
of scroll: **the background inside the gaps moves at half the speed of the
platforms**. That is why the buffer strips all move identically —the paragraph
above still holds— and the eye still sees two speeds. Measured over the whole
recorded game: 4712 passes with each opcode, not one frame with any other
value.

## The whole tower, and a map that is two maps

The on-foot zone is a tower, and its map lives at 0x840B: **78 rows of 6
cells**, 468 bytes, 280 cells with footing. `base_mapa` (0xA9F5) gives it
away: `ld ix,0840bh`, returning the base plus row times six. It is the only
reference to that range in the entire listing, and both of its only readers go
through it.

And those two readers make the cell byte **two things at once**. For the
redraw, a **tile index**: origin = 0x87F3 + value×128, so the cell says which
picture it is painted with. For the physics, a **boolean**: `consulta_mapa`
(0xB18E) ends in `and a` and its six callers only ever test the Z flag —cell
zero means empty— none of them uses the value. There is no separate collision
map and scenery map: there is one map with two readings.

The arithmetic closes to the byte. The highest value in the map is 44, and
0x87F3 + 45×128 − 1 = **0x9E72, exactly the last byte** the blitter had been
seen reading when the video port was measured: the pool is 45 tiles, no more,
no less.

The tiles are **32×32 pixels** (128 bytes: 4 per row, 32 rows), and that
corrects a published figure: this page used to say the cells were 32×16 and
the tower 1248 pixels tall. The cell height had been **derived, not measured**
—another inherited figure, like the buffer axes— and three independent routes
disprove it: the 128-byte tile, `consulta_mapa` dividing Y by 32, and the fine
scroll, which takes sixteen 2-pixel steps between one row and the next. The
tower is **192×2496 pixels**, twice as tall as published.

With the map and the pool, the whole tower can be drawn:

![The on-foot tower, composed from its map and its tiles](imagenes/torre_apie.png)

Below the starting point sits the **arrow sign** pointing up (tiles 0x28 and
0x29, which appear nowhere else), and row 0 is a cornice of rosettes (tile
0x2A). The bare structure, without the background pattern, is in
[torre_estructura.png](imagenes/torre_estructura.png), and the 45-tile pool in
[tiles_apie.png](imagenes/tiles_apie.png).

The camera that climbs the tower is the pair (0xAD2A, 0xAD2C): map row plus a
fine offset in pixels. The updater (0xA8DB) moves the fine offset 2 by 2 up to
32 and then switches row, clamped at rows 0 and 71; the gearing was caught
live in the emulator: the probe logged `(row 57, fine 32)` and, one step
later, `(row 56, fine 2)`. Every step on firm ground also saves a
**checkpoint** (position in 0xA6E9, camera in 0xC466/67), which is where death
sends you back to.

## The player's death was somewhere else

The player dies stepping into the void, and the routine that seemed to explain
it —a "fine" variant of the map query, with sub-cell logic— turned out **not
to be his**. That variant (0xB1BE) answers whether a position falls *well
centred* inside an empty cell, and only the **flying enemies** use it, to
decide which hole in the wall to nest in. Measured over the whole recorded
game: 2934 passes through it, and the return address on the stack was **always
the same caller**, the flyers' loop. Not once the player.

The player is in no object table: he lives in two bytes (0xA6EB, with Y pinned
at 0x68: moving up or down doesn't move him, it moves the world) and has **his
own call** to `consulta_mapa`, at 0xA665, with the cell under his feet. If
that cell is empty:

```
a665: call consulta_mapa
a668: jr nz,<keep walking>
a66a: ld a,004h / ld (0a6edh),a     ; state 4: sentenced
```

And there is no way back: through the whole agony (states 4 to 45) the map is
never consulted again. **There is no landing check**: you die the instant you
step into the void, and the fall you watch is the collapse animation, its
frames rotated according to which way you stumbled.

The other death is by contact. The **shield** (0xA6ED, 3 down to 1, the three
icons on the scoreboard) is docked on every hit, and at zero the game patches
the player's update pointer to replace him with a **corpse on a parabola**
(0xB268): it rises, falls accelerating and —since it doesn't consult the map
either— **passes straight through the floor** and out the bottom of the
screen.

Both roads end in the same funnel: when the state reaches 45, one life is
subtracted (0xC45F: **two** to start, more earned on points up to nine); with
the counter spent, game over; otherwise the **respawn** returns you to the
last position stepped on firm ground, with the checkpoint camera, the shield
back at three and the enemy tables emptied.

That "two" has a catch, and this page used to say "three": there are **two
initialisations**, and the second one wins. The menu leaves a three in the
counter (0xA30B), but the start of play overwrites it with a two (0xA3CB,
`ld a,002h`). That is why the first death of any game finds the counter at two.

### The dying state: no timer, just a slow loop

Between the game writing you off and actually taking the life away there are
about five seconds, and no clock counts them. The counter goes up **one per
turn of the main loop**, with no prescaler and no synchronisation with the
video whatsoever: there isn't a single `halt` in the module, the dump to video
memory is a copy loop, and no routine in the dying path looks at the global
counter.

The slow part is the turn. One turn of the engine —double pass over the
background, enemies, shots and the dump of the three bands— costs about **123
milliseconds**, which is 6.15 of the machine's 50 frames per second. Forty-one
turns at that rate come to 5.04 seconds, and the emulator measures 23 dying
sequences between 4.76 and 5.29 seconds, averaging 5.04. The sum lands exactly.

While it lasts you are untouchable: three independent checks in the listing
skip collision if the state has already reached four.

### Twenty-three deaths, and another forty-four that aren't yours

The recorded game yields the full portrait: **twenty-three deaths, 22 by
contact and a single one by falling**, all twenty-three through the same
subtraction and the same respawn. The game runs from second 2,464 to 3,124
—eleven minutes— and **ends by finishing the game**: the emulator watches the
program pass through the happy-ending routine, not through running out of
lives. And the life counter before each subtraction climbed from two to six:
the player was earning lives faster than he lost them.

(This page used to say "twenty deaths, 19 by contact", from measuring a time
window that stopped before the end of the game.)

But the recording holds **another 44 deaths that aren't the player's**: they
belong to the **attract-mode demo**, which runs exactly the same game code and
therefore the same death routines. Telling them apart isn't a matter of
reading the clock, because the game says so itself: address 0xA689 holds the
operand of a call that is one value in a real game and another in the demo,
and the start-up routine consults it (`cp 0eeh`) so as not to repaint the
scoreboard while the demo plays. Asking that byte at every death, the
recording's two demo runs —the one before play starts and the one after the
high-score table— separate themselves cleanly from the eleven minutes of real
game.

## The countdown is a tower that grows

At the end of the on-foot stage there are six targets to destroy, and when the
sixth one falls a countdown starts. It isn't digits: it is a **white tower
gaining one pixel row every ~2 seconds**. The whole mechanism is in the
listing: the level setup leaves a 6 at 0xBC33, every destroyed target
decrements it, and with the counter at zero each tick paints one row
(`ld a,07eh / out (098h),a`) and adds one to 0xBC30. The pace comes from the
global frame counter: one tick every sixteen.

```
bbb4: cp 0a1h / jp z,0bceeh    ; at 161 rows, time's up
```

And since in the recorded game the player escaped, the ending got checked by
**letting it run out**: the game was loaded with the tower half-built, the
controls were disconnected, and at exactly 161 rows 0xBCEE fired: the
destruction sequence, then straight to the high-score table. Game over, no
congratulations. The arithmetic of the real game comes out fine-grained: the
player escaped with about **30 seconds to spare** out of the 5.8 minutes the
game allows.

## The explosions carry a Spectrum fossil inside

Both stages have a particle explosion, each with its own copy of the code. The
ship one —when the protagonist gets shot down— seeds **64 particles** at the
ship's position and moves them **with gravity**: the vertical speed grows one
notch per frame, and each particle is a single pixel drawn onto the buffer.
The happy-ending one —the flagship seen from outside— is **200 shrapnel
particles** biased upwards, with no gravity.

And in both, inside the loop that paints each particle, sits this:

```
c663: and 018h / out (0feh),a
```

**0xFE is the ZX Spectrum's border port.** On the original, every particle
made the screen border flicker; on the MSX that port does nothing, and the
instruction is still there, running for nothing on every particle since 1987.
Both copies of the effect drag it along: the cleanest proof this project has
produced that these routines came over from the original untouched.

In passing: the randomness of the particles —and of the ship stage's 48-star
background field, which is random heights drawn with the fixed pattern
`0x18`— comes from a generator that **reads the BIOS ROM as an entropy
table**. And the immortality POKE from the Input MSX magazine (the one that
patches 0xC06E) acts precisely on the dispatcher that decides whether the ship
is alive or exploding: immortality is, literally, never letting the particle
system get called.

## Why the second part loads exactly at 0x61D0

The load address of the on-foot stage's block looked arbitrary until the font
turned up. That stage's two text printers —the one for the DEMO sign and the
menu, which paints double-height through the checkerboard, and the frame one,
which writes straight to video memory— use the same ASCII font, indexed as
`0x5F00 + code×8`. The font is left in place by the ship block, and the
on-foot stage reuses it.

The arithmetic closes on its own: the last character the font needs is `Y`
(code 89), and 0x5F00 + 90×8 = **0x61D0 exactly**. The second part's block
loads at the first free byte after the `Y` glyph: not one byte earlier, so as
not to eat the inherited font.

## A script interpreter

Inside the ship game there is a small virtual machine. The scripts that govern
the enemies are bytes, and the ones valued 0x80 or above are **opcodes**:

    e230: ld a,(bc) / cp 080h / jp c,0e231h   ; below 0x80 it isn't an opcode
          sub 080h / ld hl,0e7a3h / call 0e5c0h / jp (hl)

and `0xE5C0` is exactly "HL = table + A×2, HL = (HL)". The table at 0xE7A3 has
**35 entries**, and that it is 35 and no more is not an estimate: the table ends
at 0xE7E8 and the code for opcode 0x90 starts right up against it, at 0xE7E9.

## The scoreboard doesn't write letters: it redraws the cells

The whole scoreboard of the ship stage —score, lives, zone number— comes out
of a single routine at 0xF41D, and the first surprising thing about it is that
it **doesn't write characters**. MSX video memory holds one table saying which
drawing each screen cell carries, and another holding the drawings. The normal
way to print a "7" would be to put the number of the seven's drawing into the
right cell. This routine does the opposite: it leaves the cells alone and
**changes the drawing underneath**.

It can afford to because the table is already set. The cell table was left
there by the loading screen and the game inherits it untouched, so every slot
of the scoreboard already points at a drawing nobody else uses. Printing
becomes dumping the letter's eight bytes on top.

The detail that seals it is the step between glyphs: **0x40 bytes**, which is
eight drawings. It looks like an odd stride until you remember the cell table
arrives **interleaved in eights** from the loading screen. With that
interleave, skipping eight drawings lands exactly on the next cell along. The
two oddities cancel out.

Four places in the code call it, and each one is an indicator:

- The **score** is six digits kept as text at 0xDD80. One routine sets it to
  "000000" at the start, and another adds to it by **doing decimal arithmetic
  by hand on the ASCII**: bump the digit, and if it goes past "9" send it back
  to "0" and carry one to the left. There is never a binary number to convert,
  because the scoreboard *is* the number.
- **Lives** and **zone** are one digit each (0xE156 and 0xE157), printed by
  adding 0x30 to turn them into ASCII.

And there's a coincidence that says a lot: the score is painted at the same
video address, 0x12B0, in both stages of the game. The ship half and the
on-foot half don't share a single line of code, yet they put the scoreboard in
the same place on screen.

### Both stages die the same way

Once you read the ship stage's lives, three things turn out identical to the
on-foot stage, and none of them is chance:

- **They are initialised twice, and the second one wins**: the menu leaves a
  three and the start of play overwrites it with a two. Exactly the same pair
  as on foot, down to the order.
- **The extra life on points caps at nine** in both.
- And the subtraction only fires when a counter reaches **45**, the same
  number that closes the on-foot dying sequence. The address changes —0xC188
  here, 0xA6ED there— but the mechanism is the same: a byte that means little
  while you live and starts counting the moment you're killed.

Which is where a piece that had been lying loose since day one finally fits.
The immortality POKE published by *Input MSX* magazine issue 19 patches a jump
to skip the comparison of that counter against four. It is **the same
invulnerability gate** the on-foot stage has in triplicate: with the counter
already at four or more, the game ignores collisions because it thinks you are
in the middle of dying. The POKE doesn't hand out lives: it parks the player
in that state permanently.

## The game frame travels in the block, and the loading screen sets the table

The decorated border surrounding the play area —HUD included: the rosette
with the ship, the coloured gauges, the PUNTOS and ZONA bar— is not drawn
piece by piece: **it ships pre-drawn inside the game block**. Its first 1415
bytes are the STARDUST logo (a 128×16 bitmap the attract mode animates in the
central area) and, behind it, the frame's patterns and colours, 0x900 bytes
of each, which a startup routine copies to video memory.

The copy has an odd shape —two character rows per screen third and
forty-eight loose strips— that only makes sense with the other half of the
trick: the game **never builds the SCREEN 2 name table**. **It inherits it
from the loading screen**, which had filled it "adding eight": character n of
each third shows up at column n÷8, row n mod 8. Loading the tape tramples the
loading screen's program in RAM, but video memory survives, and the game
counts on that. Under that inherited mapping the odd layout is, simply, **the
shape of the frame**: characters 0 to 31 and 224 to 255 of each third are the
four columns on either side, and the strips are the top row and the bottom
bar.

Both halves are checked against the emulator: the running game's actual name
table matches the inherited pattern **768 out of 768**, and the tape's
patterns and colours appear identical at **97.4%** —the rest being what the
game paints on top: the starfield, the live counters—. And the proof that
outweighs them all is drawing it from the tape with that mapping:

![The game screen's frame, drawn from the tape's own data](imagenes/marco.png)

## The loading screen

![The screen you watch while it loads](imagenes/carga.png)

Not a screenshot: it is drawn from the 12,288 bytes the block itself dumps
—6144 of pattern to video memory 0x0000 and 6144 of colour to 0x2000— following
what its routine at 0x9C10 does.

There is a catch to it, and an instructive one. The table saying which tile goes
in each cell is not filled in the order 0, 1, 2, 3… but **by adding eight**: 0,
8, 16 … 248, 1, 9, 17 … The same 256 values per screen third, but interleaved.
Drawing it assuming sequential order gives convincing noise, which is the worst
kind of error: it looks as though the block's layout is wrong when what is wrong
is how you're reading it.

It is signed **CANO**, bottom left.
