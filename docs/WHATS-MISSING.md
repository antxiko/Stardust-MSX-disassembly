# What's missing

This page exists so that the "100%" on the front page isn't read as something it
isn't. **This disassembly is not finished, and work continues.**

What follows is the state as of today, with exact figures for what is left. It
is published this way on purpose: a half-done piece of work that says clearly
where it stands is more useful than one that looks closed.

## What that 100% means, and what it doesn't

The byte budget says:

    TOTAL 93861 bytes, 93861 explicados (100.00%), 0 sin explicar

That means one very specific thing: **every byte on the tape has an owner**.
Either it is code the tracer genuinely reaches by following the flow, or it
falls inside a range declared with a name and an explanation of how that is
known.

What it does **not** mean is that the purpose of every byte is known. There are
ranges whose name is, literally, "unclassified data", and those count as
explained in the sense of being measured and bounded, not in the sense of being
understood. Confusing the two would be selling smoke.

Here is the honest breakdown.

## What is left to identify

**3349 bytes, 3.6% of the tape**, are declared as "unclassified data". For each
one we know where it starts, where it ends and what it measures —average run of
equal bits, entropy, and how many distinct values it uses— but not what it is or
what it is used for.

There used to be 4089. **1221 have been identified**, and with them the on-foot
part is left without a single unclassified range: every one that remains is in
the ship game's block.

### What they turned out to be

**656 bytes: the second part's text block** (0xB720). Nothing had to be
interpreted, it simply reads: the redefine-keys labels, the menu, the high-score
message and the factory high-score table, which opens with *JAVIER 100000* and
*JUAN C 080000* —the two Arévalo brothers, who are credited with the graphics.
And among the key names are GRAPH, CODE and SELECT, which **are MSX keys and do
not exist on a ZX Spectrum**: that block was not ported, it was written here.

**162 bytes: the sound chip's note table** (0xE6E3). It is 81 strictly
decreasing 16-bit words, and what gives it away is that **each entry is exactly
twice the one twelve positions further on** —the ratio comes out at 2.0000 in
all 69 checkable cases— which is the definition of an octave of twelve
semitones. With the MSX PSG's clock, the first one yields 32.70 Hz, which is
theoretical **C1**. It is read by the script interpreter at 0xE203: it fetches a
byte, and if it is below 0x80 it is a note and indexes this table; otherwise it
is a command. The fit is exact to the byte: 0xE6E3 + 81×2 lands precisely where
the range ended.

**403 bytes that were not data but code.** Four sprite pre-shifting routines in
the second part (0xB2A6), another of 58 bytes (0xC804), and one of 83 in the
ship part (0xDA72) that had been split across three separate ranges. They had
been classified by measuring entropy; disassembled, they come out clean from end
to end, and their limits are set by the `ret` instructions of the already-traced
code on either side.

**And one boundary in the wrong place.** The ship part's text block was declared
as starting at 0xDAD9, which is **the S of "HAS CONSEGUIDO"**: it cut a string in
half. It starts at 0xDAC5, right after the `ret` at 0xDAC4.

### The on-foot part's entry point was wrong, and it dragged 3618 bytes with it

This is the largest error the second part's block has had, and a playthrough to
the end of the game is what uncovered it.

The entry-point file said, in as many words: *"0x61D0 — the first byte of the
block, for want of knowing the real start"*. It was **a guess**: 0x61D0 is where
the block is *loaded*, not where it starts executing. Everything else hung off
that guess:

- 38 bytes in there is a **pointer table** —words descending by two, 76% of them
  pointing inside the graphics— which the tracer read as code;
- 57 bytes in it hit a `C2 78 8A` read straddling two entries of that table,
  that is, a `jp nz,8A78`, **and walked straight into the artwork**;
- and from there it disassembled **3542 bytes of graphics** as instructions,
  with the `0xE9` at the end standing in as the project's last blind jump.

The real entry point is found by following the loader. In the ship block, as
soon as the tape load succeeds:

```
f7b0: ld a,001h / ld (0a529h),a
f7b5: jp 0a279h            <- the second part starts here
```

And **0xA279 disassembles to a textbook program start**: it disables interrupts,
sets up its own stack with `ld sp,05b32h`, programs the graphics chip and writes
`JP 0xC46E` into 0xFD9F, which is **H.TIMI, the MSX interrupt hook**. The address
it installs there, 0xC46E, is the same one that had been identified separately
from the shape of its epilogue: two independent routes agreeing.

It was hidden, on top of that, inside the range declared as graphics: that range
ran to 0xA2D2 and **swallowed the program's entry point**.

Effect on the figures: the on-foot part's coverage drops from 51.7% to 35.0%,
because 3618 bytes that were counted as code turn out not to be. The figure gets
worse and the work gets better.

### And 367 more bytes counted as code that aren't

Looking for self-modifying code turned up the opposite error. **Three blocks of
variables were marked as code**: 175 bytes at 0xED75 in the ship part, and 17 at
0xC459 and 175 at 0xD068 in the on-foot one. They arrive from tape as zeros, and
0x00 disassembles to `nop`, so when the flow fell into them the tracer walked
them one at a time and counted them as instructions.

That they are variables is stated by the listing itself, which **reads and
writes them with absolute addressing from more than seventy places**. An
instruction is not read byte by byte from half the program.

One of those bytes did real damage: the 0x10 at 0xC468 was read as a `djnz` and
sent the tracer into a stretch of code by a path that does not exist. Declaring
the variables as data left that stretch orphaned, and it turned out to be the
second part's **interrupt handler epilogue** —21 bytes ending in `ei / ret` that
fit exactly— entered through a pointer, which is why following the flow never
reaches it. It is now declared as what it is.

That is why the code bytes go down and the data bytes go up against what was
published before: the earlier figure was inflated.

### What is left, and one route that can now be closed

Of the 3349 still unidentified, **1415 are in 0x4952-0x563F, and there the
original cannot help**. Not for want of trying: on the ZX Spectrum those
addresses are the **screen memory**, 6144 bytes of pixels and 768 of attributes.
There is no game to look at there, there is a picture.

And that is precisely why there is something here: this version has those
addresses free, because on the MSX the video memory sits behind the graphics
chip and cannot be addressed. It is the same thing that forced the screen buffer
at 0x4000-0x4EFF to be added. So those bytes are, by construction, the least likely of
all to have come from the other side. That does not identify them; what it does
is close a route **with a reason**, instead of leaving it as "not tried".

They are spread across small ranges. You can list them with:

```sh
grep "datos sin clasificar" src/juego.notes src/parte2.notes
```

and measure them again with `tools/clasifica_huecos.py`, which is where their
classification came from.

## What is left to trace

The budget measures bytes; coverage measures something else. Of the code in the
two big blocks, the tracer reaches this:

    ship game        25.7 %
    on-foot part     35.0 %

The rest is data, yes, but there is also **code that isn't arrived at by
following the flow**: routines entered only through computed jumps, through
tables, or through pointers filled in while playing. Some are known to exist
because the emulator caught them running; others aren't known at all.

The precise measure of that blindness is the **indirect jumps**: `jp (hl)`,
where the destination isn't written in the binary but sits in a register, and
the tracer stops because it cannot know where it goes. There are **four**, three
in the ship part and one in the one on foot, and they are listed in the trace
itself:

```sh
python3 -c "import json;print(json.load(open('work/juego.trace.json'))['blind'])"
```

**All four are resolved**, and for the first time none is left pending. The one
at 0xE230 is the script interpreter's dispatcher, and its table of 35 pointers
is read from the binary. The other three —0xCB99 and 0xD6B8 in the ship part,
0xC544 in the one on foot— were not resolved by reading code but by playing with
the emulator open and noting the destination each time the jump executed,
because the structures carrying those pointers arrive all 0xFF on the tape and
are filled in while playing.

### The fifth one did not exist

A fifth used to be listed here, at 0x984D, "unresolved" because it never fired.
Now we know why: **it is not a jump**. It is an `0xE9` inside a drawing:

```
9840  A5 AA AA 17 55 69 55 0E
9848  A5 AA AA 17 55 E9 50 0B      <- that E9
```

It did not need resolving, it needed removing. And behind it was the largest
error this block has had, set out in the next section.

## What hasn't been checked

- The second part has been seen to start and run, but **it has not been played
  all the way through**. What it does from the middle onwards is unexamined.
- The cross-check against the ZX Spectrum version can say nothing about that
  second part: the snapshot it compares against was captured in the *first*
  part's menu, so the original's on-foot stage simply isn't in it.
- The listings' comments cover the main routines and the data zones, but **most
  routines still have no comment explaining what they do**. They have a name and
  they are bounded; that isn't the same thing.

## Why it is published like this

Because a half-done disassembly that says clearly where it stands is useful, and
one that pretends to be complete is worse than nothing: it sends whoever comes
next looking in the wrong place.

The criterion across the whole series is that every claim can be checked against
the binary. That includes claims about what is **not** known: which is why the
3349 bytes are bounded one by one instead of swept under the carpet, and why the
coverage figures come out of the tracer rather than out of an impression.

## What is being worked on now

This isn't parked. The open lines, in order of what would pay off most:

- **More hand-played sessions.** The screens no harness reaches —game over,
  the high-score entry, the demo, the menu and redefine keys— have now been
  visited in a recorded session, and that yielded 22 routines and the key
  table. What is left to visit the same way is the second part, on foot.
- **The 3349 bytes still unclassified.** The cross-check route was closed while
  the tool looked for each section with a 32-byte needle and kept the first
  match, demanding neither that it be unique nor that the resulting offset
  agree with the rest: that is where the contamination came from. It has been
  rewritten —it now aligns both binaries first and only then looks at the
  names— and out of it came the thesis the project now rests on. On top of
  that there is a second tool, `tools/coteja_equivalencias.py`, which looks at
  what the original had at the **equivalent** address even when the bytes do
  not match. It deliberately adopts nothing on its own: what it produces are
  leads to be followed by hand, which is how the bytes above were identified.
- **The indirect jump at 0x984D**, still unfired and with no known destination.
- **Commenting the routines** one by one. They are bounded and named; what they
  do is still to be written down.

If you have an idea about any of that, or you want to look at it yourself,
everything needed is in the repository: the listings, the measuring tools and
the notes files where each finding gets recorded.

When those 3349 bytes are identified, this page will get shorter.
