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

1. Hunts for RAM and maps it into pages 1 and 2, to get a flat 64K.
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

This is not a technicality. It is the trap this disassembly fell into more than
once — an address without an instant attached to it means nothing here. Sampling
the program counter of a real playthrough, 122 addresses looked like code
executing inside the tileset, and not one of them was: 66 belonged to the TOPO
logo, 9 to the loading screen, and 56 were below 0x8000, which is the BASIC ROM
until the loader maps RAM over it.

## How much came across from the Spectrum

There was a table here with byte-for-byte match percentages against the ZX
Spectrum binary. **It has been withdrawn**, and it is worth explaining why
rather than quietly deleting it.

It was produced by `tools/coteja_spectrum.py`, which located each section of the
other binary by taking its first 32 bytes and searching for them with a `find`:
it kept the **first** match, without checking that it was the only one or that
the resulting offset agreed with the other sections. Since both versions share a
good deal of the artwork, those needles landed inside the tileset — and out of
that came both the percentages and a batch of routine names pinned to addresses
that hold graphics.

What does stand up without that tool, because it is read from the MSX binary
itself: the loader is **MSX code from end to end** —it has to map RAM into the
pages and talk to the sound chip and to the tape motor port, things that on the
Spectrum either don't exist or live somewhere else— and the loading screen is
signed by Cano, so it belongs to this version.

When the search is fixed, and made to require a unique match and a consistent
offset, the table will come back with figures that can be defended.
