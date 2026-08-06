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

The two halves of the game don't share an engine, and it shows in the size of
their objects. In both, each entity carries a pointer to its governing routine
in its structure, and the game jumps there with a `jp (hl)`. Capturing those
jumps with the game running:

    the ship part:  the IX values go up in 8s   (0xCB3A, 0xCB42 · 0xC8D8, 0xC8E0…)
    the foot part:  the IX values go up in 46s  (0xD068, 0xD096, 0xD0C4)

The entities of the second part carry a structure almost six times bigger.

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
in RAM, and a routine that dumps it. The buffer is at 0x4B40 and measures **960
bytes, 24 wide by 40 tall**, and the size is known through two paths that agree
without depending on each other: the code says so (`ld de,04b40h`, and 24×40 =
960, running from 0x4B40 to 0x4EFF) and the emulator confirms it, where that
routine made **3,252,480 writes** with the pointer reaching exactly 0x4EFF.

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

## A script interpreter

Inside the ship game there is a small virtual machine. The scripts that govern
the enemies are bytes, and the ones valued 0x80 or above are **opcodes**:

    e230: ld a,(bc) / cp 080h / jp c,0e231h   ; below 0x80 it isn't an opcode
          sub 080h / ld hl,0e7a3h / call 0e5c0h / jp (hl)

and `0xE5C0` is exactly "HL = table + A×2, HL = (HL)". The table at 0xE7A3 has
**35 entries**, and that it is 35 and no more is not an estimate: the table ends
at 0xE7E8 and the code for opcode 0x90 starts right up against it, at 0xE7E9.

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
