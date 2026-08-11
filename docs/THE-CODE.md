# The code

The tape's five blocks come to **93,861 bytes**, and **28,172** of them are code
the tracer reaches by following the flow. The rest are graphics, tables, buffers
and padding, all of it named.

That figure is deliberately low: it counts only code genuinely arrived at by
following calls and jumps from a known entry point. There is more code on the
tape, but until we know how it is entered it is not counted — taking it as
traced is precisely the mistake that had to be undone here.

## How the screen gets drawn

This is the big difference from the original. The Spectrum writes straight into
its screen memory, which is ordinary RAM; the MSX has its video memory behind
the graphics chip and it has to be sent through a port. So this version carries
an **intermediate buffer** the original doesn't need.

The buffer runs from **0x4000 to 0x4EFF** and is 3,840 bytes: **24 wide by 160
tall**. The dump moves it to VRAM in **three bands** —0x4000 with 56 rows,
0x4540 with 64 and 0x4B40 with 40, contiguous and closing to the byte—, one per
call, each into its own third of SCREEN 2. And each band is walked **by
columns**, not by rows (here the third call, the 40-row one):

```
f3f2: ld de,04b40h     ;       the band: its buffer, its target and its height
f3ff: ld c,018h        ; 24  <- OUTER loop: steps the buffer one byte at a time
f401:   call 0EE24h    ;        sets the video memory address
f408:   ld de,00018h   ; 24  <- the STRIDE within the buffer
f40b:   ld a,(hl) / out (098h),a / add hl,de
f40f:   djnz           ; 40  <- INNER loop, with B=0x28
```

The axes are worth dwelling on, because **they were read backwards here and went
out wrong**. The `ld b,028h` looks like it says "40 columns" and it does not: it
is the inner loop, and it walks the buffer in steps of 24, so it collects 40
bytes from **a single column**. The one counting columns is the outer loop,
which steps the buffer one byte at a time, 24 times.

Drawing it settles it: split the buffer 24 at a time and the high-score table
comes out legible, halftone and all; split it 40 at a time and it is noise. And
it matches what you see while playing: 24 bytes are 192 pixels, narrower than
the screen's 256 —hence the fixed frame down the sides— and the surplus is in
the **vertical**, which is exactly where it scrolls.

That routine made **3,252,480 writes** in two minutes of play,
which makes it by far the hardest-working code in the game.

Watching the port that video memory arrives through turns up **seventeen
routines** that write to it. That method —look at who writes, instead of
guessing what the data is— is what allowed the buffer to be pinned down to the
byte.

## Sprites, the Spectrum way

The Spectrum has no hardware sprites, so they have to be drawn by hand: the
image is shifted bit by bit to the exact position, a hole is opened in the
background with AND, and it is painted with OR. To avoid paying for the shift
loop, the instruction is written out N times and entered in the middle:

```
c4c5: ld a,h / ld h,l / ld l,0ffh
c4c9: jp 0c4e1h          ; the jump that vaults over the whole run
c4cc: adc hl,hl / adc a,a / adc hl,hl / adc a,a / ...
```

That technique is what throws the tracer off: the `jp` skips the entire run, and
the `adc`s are entered through a computed jump that isn't in the binary. We know
they execute because the emulator caught them running half-way down the run.

And the MSX **does** have hardware sprites, which are not used for this: the
conversion brought the source machine's method across with it.

## A script interpreter

Enemy behaviour is not written as code but as scripts run by a small virtual
machine. Bytes below 0x80 are data; from 0x80 up they are opcodes:

```
e230: ld a,(bc) / cp 080h / jp c,0e231h
      sub 080h / ld hl,0e7a3h / call 0e5c0h / jp (hl)
```

with `0xE5C0` doing "HL = table + A×2, HL = (HL)". There are **35 opcodes**, and
that jump table is also the first trap in tracing: if it isn't declared as data,
the tracer walks into it and starts disassembling addresses as though they were
instructions.

## Every object carries its own routine

Both halves of the game settle entity behaviour the same way: each one keeps a
pointer to its governing routine in its own structure, and the game jumps there
with `jp (hl)`. Those structures arrive **all 0xFF on the tape** and are filled
in while playing, so the destinations can't be read from the binary — they have
to be captured with the game running.

Doing that turns up eight routines in the ship part and ten in the one on foot.
And the size of the structures gives away that these are different engines:
**8 bytes** per entity in the first part, **46** in the second.

## Code that writes itself

There is a dispatcher that patches its own calls:

```
f000: ld (0f016h),hl    ; the operand of a CALL gets written
f003: ld (0f019h),de    ; and the operand of another
...
f015: call 0000h        ; that 0000 isn't real: HL fills it in
f018: call 0000h        ; and DE this one
```

Read cold that looks like `call 0`, which would reset the machine. Where it
really calls isn't in the binary — it is in the registers of whoever invokes it.

## What only a full playthrough shows

Both of the things above —the unrolled runs and the self-patching dispatcher—
are cases of the same problem: a static tracer cannot follow them. The way past
it is to watch the machine run, and for that a recorded playthrough is worth
more than any scripted harness, because it reaches screens a script never does.

Replaying a complete 38-minute run and sampling the program counter, of the
**1489 addresses the ship game executed the tracer already reached 1444**. The
45 it missed became entry points, each with its sample count beside it.

In the second part, which is far less explored because you have to clear seven
zones to get there, 159 addresses turned up untraced, and this page used to
report two of them as the hardest-working routines in the whole thing:

```
0xD48C   139,323 samples   was down as a 489-byte "table"
0xC865    27,928 samples   was down as "unclassified data"
```

**The first one is withdrawn, and the way it fell is worth more than the claim
was.** 0xD48C is not code. It disassembles to `nop / rst 38h / nop / rst 38h`,
the disassembler gives up on part of it with an *illegal sequence*, nothing in
the listing calls it, and sampling the program counter over 130 seconds of
verified play —259,149 samples across two windows— **not one lands in it**.

What went wrong was the window. That measurement opened at t=1775 "once the load
finishes", and the load had not finished: sampled at t=1775 the program counter
sits at 0xF87E, 0xF88D, 0xF887 — inside the tape loader, across only 45 distinct
addresses. The tape was still turning, and half the memory from 0x61D0 up was
still the ship game underneath.

Which is exactly the trap this page warns about two paragraphs down, walked into
head first. Five programs occupy the **same addresses** at different moments, so
the samples have to be split into windows —the loader's jump to the game at
0xBD85, and the second load— or the TOPO logo, the loading screen and the BASIC
ROM all show up looking like code inside the tileset. Getting the window's *end*
right is not enough; its beginning has to be measured too.

The 489 bytes go back to being data, and what they look like is stated no more
firmly than it has been measured: 21 distinct values, 199 of them 0xFF, and the
rest bytes with few bits set, arranged in pairs — `40 ff / 01 ff / 41 ff /
00 ff / 40 f9` — which is what artwork with a mask looks like in a conversion
that has to shift its sprites by hand.

0xC865 survives: it does show samples in a clean window.
