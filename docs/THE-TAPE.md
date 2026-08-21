# The tape

It's 94,228 bytes of TSX file, which open up into 93,861 bytes of content
spread across seven blocks. And the odd part shows up right at first
glance: three of them are recorded the way the MSX expects, and the other
four aren't.

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

The first three are KCS blocks, the MSX's own tape format, with the usual
header and filename. The four that follow are ZX Spectrum blocks: a flag
byte, the data, and an XOR check byte at the end. All four carry that XOR
correctly, verified one by one.

## The loading chain

It starts in the BASIC loader, which is just five lines:

```basic
10 COLOR 1,1,1:SCREEN 2
20 BLOAD"cas:",R          ' the logo, which runs by itself
30 BLOAD"cas:"            ' the turbo loader, which does NOT run
40 CLS:COLOR 0,0,0:SCREEN 2
50 DEFUSR=54000!:A=USR(0) ' 54000 = 0xD2F0: now it does
```

And it carries on in the turbo loader, which does all this in order: hunts
for RAM and maps it into pages 1 and 2, to get a flat 48K from 0x4000 to
0xFFFF, like the Spectrum's; copies 300 bytes of itself to 0x4000 and jumps
there; saves 94 bytes from 0xDAC0 to 0xFDE8, the patch mailbox, and sets
the stack; loads the loading-screen block and executes it; loads the game
block right on top, wiping out the previous one; applies the patches from
the mailbox, if there are any; and finally jumps to 0xBD85, which is the
game.

The eight-byte descriptor and the last block aren't loaded by it at all:
the game itself asks for them later, on clearing the last zone.

## And the eight-byte descriptor isn't data: it's code

Those eight bytes are the prettiest thing on the whole tape. The game asks
for them at 0xF77D, and that address is no ordinary mailbox: it is the exact
spot where the two instructions that will load the next block live, in the
listing itself. The header **lands on top of them** and they are executed
right afterwards.

On tape, the eight bytes are:

```
02 DD 21 D0 61 11 A5 74
```

The `02` is the type, and the game checks it before anything else. The other
seven are, as they stand, `ld ix,061D0h` and `ld de,074A5h`: the destination
address and the length, opcodes included. That is why the jump at 0xF77B is
a `jr $+3`, which skips the type byte and lands right on them.

It adds up on all four sides: the next block is 0x74A5 bytes long,
0x61D0 + 0x74A5 = 0xD675, and the loader's final jump, to 0xA279, falls
inside what has just been loaded.

And the same `2` does three jobs: it is the header's type, it is the last
byte of the data block —the mark that it arrived whole— and it is the
constant the two are compared against. The game does not keep that constant
anywhere separate: it reads it from the operand of its own `cp 002h`, at
0xF76E. Three uses, one single byte.

## The blocks tread on each other

And this is exactly what forces you to look at the tape differently. In
memory, the blocks don't coexist at all:

```
loading screen   0x9B8C - 0xCC3F
ship game        0x47A0 - 0xFDE6    <- wipes out the whole loading screen
second part      0x61D0 - 0xD674    <- lands inside the game
```

So there's no single 64K image holding the whole game, just three
photographs of memory at different moments. Each listing carries the `org`
of where it really runs, and the byte budget gets summed over the tape's
blocks rather than the memory map — summing over memory would count the
overlapping bytes wrong, some twice and others not at all.

And this isn't a technicality: an address without an instant attached to
it means nothing here, because several programs share the same addresses
at different moments. Sampling the program counter of a real playthrough
turns up 122 addresses that look like code executing inside the tileset
and aren't: 66 belong to the TOPO logo, 9 to the loading screen, and 56 sit
below 0x8000, which is the BASIC ROM until the loader maps RAM over it.

## How much came across from the Spectrum

The cross-check tool (`tools/coteja_spectrum.py`) aligns the two binaries
whole: it indexes the windows of the Spectrum binary, counts which offsets
keep coming up, and from the dominant ones extracts the maximal runs of
identical bytes. Every stretch it calls shared comes with its own evidence
— where it starts in each binary, how long it is, and at what offset.
Locating each section just by its first 32 bytes and keeping the first
match doesn't work at all here: since both versions share the artwork,
those needles land inside the tileset.

And what comes out of it reframes quite a bit of how you picture this
conversion:

```
25,015 bytes identical to the Spectrum      53.6% of the block
   of those, CODE:       81 bytes            0.3%
   of those, DATA:   24,934 bytes           99.7%
```

The code isn't shared. The artwork and the data were carried across byte
for byte — and to the same address, at offset zero: the graphics occupy
0x6037–0xA55F and 0xA561–0xBD84 on both machines — but the code got
rewritten from scratch. The only two stretches of code that do match, 55
and 24 bytes, are unrolled runs of `adc hl,hl`: they come out identical
because they're the same instruction repeated many times over, not because
anyone actually copied them.

And that fits what the game's own credits screen says, crediting the
conversion to Carlos Arias while the graphics stay with the Arévalo
brothers, same as the original.

Of the names in the Spectrum's control file, 20 out of 138 are backed by
identical bytes. Among them the data for the seven zones, the tile
geometry — "111 tiles at 4x32 bytes per tile", exactly matching what this
project measures on its own — and the `DEMO` message, in the same string.

About the on-foot part, the cross-check can't say a thing, and it's not
the tool's fault: the authors of the Spectrum disassembly warn in their
own README that "the entire on-foot second stage of the game also fell
outside the scope". They simply never disassembled it, so it isn't in the
snapshot being compared against here.
