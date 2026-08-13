# The tape

94,228 bytes of TSX file, which open up into **93,861 bytes of content** spread
across seven blocks. The odd part shows up at first glance: three of them are
recorded the way the MSX expects and **four are not**.

## The seven blocks

| | block | bytes | goes to | what it is |
|---|---|---|---|---|
| 1 | `STARDU` | 256 | — | the BASIC loader, plain text |
| 2 | `TOPO` | 4254 | 0x9470 | the publisher's animated logo |
| 3 | `LOADER` | 351 | 0xD2F0 | the turbo loader |
| 4 | — | 12,468 | 0x9B8C | the loading screen, and it executes |
| 5 | — | 46,663 | 0x47A0 | the ship game, zones 1 to 7 |
| 6 | — | 8 | — | an eight-byte descriptor |
| 7 | — | 29,861 | 0x61D0 | the second part, the one on foot |

The first three are **KCS blocks**, the MSX's own tape format, with their header
and their filename. The four that follow are **ZX Spectrum blocks**: a flag
byte, the data, and an XOR check byte. All four carry that XOR correctly,
verified one by one.

## The loading chain

It starts in the BASIC loader, which is five lines:

```basic
10 COLOR 1,1,1:SCREEN 2
20 BLOAD"cas:",R          ' the logo, which runs by itself
30 BLOAD"cas:"            ' the turbo loader, which does NOT run
40 CLS:COLOR 0,0,0:SCREEN 2
50 DEFUSR=54000!:A=USR(0) ' 54000 = 0xD2F0: now it does
```

And it carries on in the turbo loader, which does this in order:

1. Hunts for RAM and maps it into pages 1 and 2, to get a flat 48K from
   0x4000 to 0xFFFF, like the Spectrum's.
2. Copies 300 bytes of itself to 0x4000 and jumps there.
3. Saves 94 bytes from 0xDAC0 to 0xFDE8 (the patch mailbox) and sets the stack.
4. Loads the loading-screen block **and executes it**.
5. Loads the game block on top, wiping out the previous one.
6. Applies the patches from the mailbox, if there are any.
7. Jumps to 0xBD85, which is the game.

The eight-byte descriptor and the last block are not loaded by it: the game
itself asks for them on clearing the last zone.

## The blocks tread on each other

This is what forces you to look at the tape differently. In memory, the blocks
**do not coexist**:

```
loading screen   0x9B8C - 0xCC3F
ship game        0x47A0 - 0xFDE6    <- wipes out the whole loading screen
second part      0x61D0 - 0xD674    <- lands inside the game
```

So there is no single 64K image holding the whole game, but **three photographs
of memory at different moments**. Each listing carries the `org` of where it
really runs, and the byte budget is summed over the tape's blocks rather than
over the memory map: summing over memory would count the bytes that overlap
wrongly.

This is not a technicality: an address without an instant attached to it means
nothing here, because several programs share the same addresses at different
moments. Sampling the program counter of a real playthrough turns up 122
addresses that look like code executing inside the tileset and are not: 66
belong to the TOPO logo, 9 to the loading screen, and 56 sit below 0x8000,
which is the BASIC ROM until the loader maps RAM over it.

## How much came across from the Spectrum

The cross-check tool (`tools/coteja_spectrum.py`) **aligns the two binaries
whole**: it indexes the windows of the Spectrum binary, counts which offsets
keep coming up, and from the dominant ones extracts the maximal runs of
identical bytes. Every stretch it calls shared comes with its evidence: where
it starts in each binary, how long it is, and at what offset. Locating each
section by its first 32 bytes and keeping the first match doesn't work: since
both versions share the artwork, those needles land inside the tileset.

And what comes out reframes how you picture this conversion:

```
25,015 bytes identical to the Spectrum      53.6% of the block
   of those, CODE:       81 bytes            0.3%
   of those, DATA:   24,934 bytes           99.7%
```

**The code is not shared.** The artwork and the data were carried across byte
for byte —and to the same address, at offset zero: the graphics occupy
0x6037–0xA55F and 0xA561–0xBD84 on both machines— and the code was rewritten.
The only two stretches of code that do match, 55 and 24 bytes, are unrolled runs
of `adc hl,hl`: they come out identical because they are the same instruction
repeated many times, not because anyone copied them.

That fits what the game's own credits screen says, crediting the conversion to
Carlos Arias while the graphics stay with the Arévalo brothers, the same as the
original.

Of the names in the Spectrum control file, **20 out of 138** are backed by
identical bytes. Among them the data for the seven zones, the tile geometry
—"111 tiles at 4x32 bytes per tile", exactly matching this project's own
measurement— and the `DEMO` message, in the same string.

About the **on-foot part** the cross-check can say nothing, and not because of
the tool: the authors of the Spectrum disassembly warn in their README that "the
entire on-foot second stage of the game also fell outside the scope". They did
not disassemble it, and it is not in the snapshot being compared against.
