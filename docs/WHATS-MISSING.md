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

What it does **not** mean is that the purpose of every byte is known. For most
of the project there were ranges whose name was, literally, "unclassified
data": they counted as explained in the sense of being measured and bounded,
not in the sense of being understood. Confusing the two would be selling
smoke. That category is empty today, and below is how it emptied.

Here is the honest breakdown.

## What was left to identify, and no longer is

**The "unclassified data" category is now empty.** It once held 4089 bytes;
today every byte on the tape has a name: either code the tracer reaches, or a
range that says what it is and how that is known.

The road, in stages: first 1221 were identified; then **1415 in one stroke**,
when the big stretch at the start of the block turned out to be the game
screen's frame; then **1141 more**, the recording filler that closes the
block; then **252**, the sound interpreter's instruments; and the **final
541** fell in a single afternoon: 481 were the on-foot sprite pool, 4 that
stage's colours, one an orphaned `ret` of a tile routine, and the 55 bytes of
the 0xCA5F block turned out to be 18 named variables plus 37 dead bytes from
the master. The stories are below.

### What they turned out to be

**656 bytes: the second part's text block** (0xB720). Nothing had to be
interpreted, it simply reads: the redefine-keys labels, the menu, the high-score
message and the factory high-score table, which opens with *JAVIER 100000* and
*JUAN C 080000* —the two Arévalo brothers, who are credited with the graphics.
And among the key names are GRAPH, CODE and SELECT, which **are MSX keys and do
not exist on a ZX Spectrum**: that block was not ported, it was written here.

**192 bytes: the sound chip's note table** (0xE6E3). It is strictly decreasing
16-bit words, and what gives it away is that **each entry is exactly twice the
one twelve positions further on** —the ratio comes out at 2.0000 in all 69
checkable cases— which is the definition of an octave of twelve semitones. With
the MSX PSG's clock, the first one yields 32.70 Hz, which is theoretical **C1**.
It is read by the script interpreter at 0xE203: it fetches a byte, and if it is
below 0x80 it is a note and indexes this table; otherwise it is a command.

This was published as **81 notes and 162 bytes**, and fell short. There are
**96, eight full octaves**: 0xE6E3 + 96×2 = 0xE7A3 closes to the byte against
the table that starts there, and the 30 leftover bytes turned out to be 15 more
periods, the highest ones, continuing the same decreasing series. The game's own
music confirms it by using note number 84 — impossible with only 81.

**1415 bytes: the game screen's frame, travelling inside the block.** The
start of the block (0x47A0-0x5A9F) was not just "graphics": the first 256
bytes are the **STARDUST logo**, a 128×16 bitmap at 16 bytes per row —drawn
at that width the name reads out; the startup animator copies it sixteen
`ldi` per row from `ld hl,047a0h`—, and behind it come the **patterns**
(0x48A0) and **colours** (0x51A0) of the **frame**: the decorated border,
HUD included, that surrounds the play area. 0x900 bytes of each, which the
routine at 0xEF28 copies to video memory in two character rows per third
plus forty-eight strips; the SCREEN 2 name table —which the game inherits
from the loading screen— is what then rearranges those 288 characters around
the edge of the screen. The arithmetic closes on
its own: 0x48A0 + 0x900 = 0x51A0, and 0x51A0 + 0x900 = 0x5AA0. And so does
the check against the emulator: 97.4% of those bytes appear identical in the
real video memory with the game running, the rest being what the game paints
on top. Inside the stretch also lived two ranges labelled "tile colours" by
their nibble signature: the signature was true, but they are the frame's
colours, not the game tiles'.

**490 bytes: the on-foot sprite pool** (0x6555). Two "unclassified" ranges
and a 9-byte "table" were arbitrary cuts through the middle of the pool's
entries: **16×16 masked sprites, 64 bytes each**, the same format as the ship
stage's. The geometry is pinned by the protagonist's collapse code —frame×64
+ 0x6555, copied to the working slot at 0x7D55, which is exactly 0x6555 +
0x60×64— and drawing the entries yields the walking enemies, clean, in their
poses.

**120 bytes that were not data but code: the special tiles' behaviours.** A
dispatcher at 0xC116 assigns certain tile indices of the zones (0x30 to
0x5D) a behaviour routine, storing it as a pointer in the object; since
those routines are only ever entered through the pointer, the tracer never
saw them, and their heads figured as "filler or remainder" or "table". All
ten were seeded as entry points with their evidence —each one appears loaded
as a literal in the dispatcher, or installed by the previous state in the
chain— and the ship block's coverage rose from 25.7% to 26.0%.

**4 bytes: the on-foot stage's colours** (0xC46A). Four colour bytes —E1,
B1, A1 and 71, four inks on black— from which the level start picks **at
random** (`and 3` over the generator). That is why the on-foot stage doesn't
always come up the same colour.

**37 dead bytes at 0xCA5F.** They have the structure of variables —small
values, 0 to 10— but nothing touches them: no references or pointers in the
binary, and read **and** write watchpoints at **zero** over the complete
38-minute playthrough plus 350 seconds of another. Residue of the mastering
machine, like the filler at the block's end; what they were before they died
is not known.

**252 bytes: the sound interpreter's instruments** (0xE5E2). The range sat
right in front of the note table, and turned out to be its natural
neighbour: a table of **16 instruments of 15 bytes** that one of the
interpreter's commands copies into the channel state when the script asks
for it (the address is computed as 0xE5E2 + n×15), followed by another table
of 6-byte entries for the effects channel. It closes to the byte on both
sides: the neighbouring code ends in a `ret` at 0xE5E1, and 0xE5E2 + 16×15 =
0xE6D2, where the second table starts, dying where the notes begin.

**1141 bytes: the master recording's filler.** The stretch that closes the
game block (0xF972-0xFDE6, plus the 170-byte "table" right before it, which
was the same thing) is **uninitialised RAM dumped as-is when the tape was
mastered**: 00 and FF alternating in pairs, with a mark and a phase flip
every exactly 128 bytes —what a freshly powered DRAM looks like— and a dozen
bytes the studio machine had already touched. The block thus ends right below
the patch mailbox at 0xFDE8. The proof came from the emulator, over the
**complete 38-minute playthrough**: the only writes into the stretch in the
whole game are the four at startup with which the game installs its interrupt
hooks, and the only reads are the execution of those hooks. Nothing ever uses
the rest.

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

And it happened again. That 35.0% **was also a lie**, for the same reason: a
seed placed at 0xCC3E landed inside a music script, and with it the tracer
disassembled **1,318 of the 1,380 bytes of the stage's soundtrack** as
instructions. Take it out and the real coverage is **30.2%**. Same mistake a
third time, and what catches it isn't staring at the listing but having a second
way to read those bytes: walked with the sound interpreter's language they yield
38 blocks, zero bytes outside the language, and the walk closes exactly where the
channel states begin.

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

### What is left, and a closed route with a punchline

Much of what remained sat in 0x4952-0x563F, **and there the original could not
help**: on the ZX Spectrum those addresses are the **screen memory**, 6144
bytes of pixels and 768 of attributes. There is no game to look at there,
there is a picture. The cross-check route was closed in its day for that
reason.

And the ending has its charm: when the stretch was finally identified, it
turned out that **there was a picture here too** —the game screen's frame, told
above—. In the original, those addresses show a screen; in the conversion,
they store one.

The five remaining ranges can be listed with:

```sh
grep "datos sin clasificar" src/juego.notes src/parte2.notes
```

and measure them again with `tools/clasifica_huecos.py`, which is where their
classification came from.

## Twenty "routines" that were music, and 1,386 bytes that stop being code

Of the 35 commands published for the sound interpreter, **twenty don't
exist**. They were the game's **melodies**, written in the interpreter's own
language and disassembled as if they were instructions.

The command 0x8C gives it away: it is the interpreter's *call*. It takes a
phrase number, saves the return address on a per-channel stack, and jumps to
the phrase by reading **a table at 0xE7C1**. And 0xE7C1 is exactly 0xE7A3 +
15×2. That is: the command table has **fifteen** entries and dies there; what
follows is **another table**, the melodies'. Read as a single table of 35, the
twenty music pointers went into the disassembler as if they pointed at code.

The other end is closed by command 0x8D, the *return*: it recovers the address
from that same stack. Which is why **every phrase ends in `8D`**. Songs don't:
they end in `8B`, the command that clears the channel. Two levels, songs
calling phrases — the same idea as the recursive dictionary that compresses the
level maps.

That those 1,420 bytes are music and not code is checked by reading them with
the interpreter's grammar, and they fit: of every high byte in the stretch,
**all are valid commands except fifteen**, and those fifteen are arguments that
can be identified one by one. In 1,420 bytes of real Z80 you would hit `ret`,
`call` or the IX prefixes at every turn; here there isn't one. The most
repeated command is precisely the one that calls phrases, 208 times.

The consequence for the figures is direct, and goes the uncomfortable way:
**1,386 bytes stop counting as code**, the ship block's coverage drops from
26.0% to 23.0%, and identified routines fall to 106. The budget still closes at
100%, because those bytes don't vanish: they change column.

## The routine count dropped from 164 to 106, and it is the same old confusion

This page already told how the routine count was once published as **1956**,
which was the number of the tracer's **labels**: every jump target, including
jumps internal to a single routine. It was fixed by counting only what somebody
had worked out by hand.

Well, the same confusion crept back in, on a smaller scale. The entry-point
files hold two different kinds of thing: routines that have been read and
understood, and points **measured in the emulator** —where the program counter
was, where a write watchpoint fired. The latter are very useful evidence, but
they are almost never the start of a routine: a watchpoint on the video port
reports the address of the `out`, and that `out` sits **inside the drawing
loop**, not at the routine's head.

Of the declared points, **39 are interior labels**: places reached by
falling through from the instruction above. Actual routines number **106**, and
that is the figure published now.

A new tool catches them, `tools/check_interiores.py`, with a simple rule: if a
point can be fallen into from the previous instruction, it isn't a head. And
there's a lesson from building it, because the first version flagged 61 and
five of those were false: you have to check that the instruction above is
**adjacent**. Where there is data in between —the script interpreter's opcodes
have their tables in front of them, 72 bytes away— nothing can fall through. A
verification tool that doesn't verify itself is worth little.

The check now runs in the Makefile and the test that guards the figure uses it,
so the published figure and the check cannot drift apart.

## What is left to trace

The budget measures bytes; coverage measures something else. Of the code in the
two big blocks, the tracer reaches this:

    ship game        23.0 %
    on-foot part     30.2 %

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

- **Commenting the routines** one by one. They are bounded and named; what they
  do is still to be written down.

If you have an idea about any of that, or you want to look at it yourself,
everything needed is in the repository: the listings, the measuring tools and
the notes files where each finding gets recorded.

The bytes left to identify have run out, and this page, as promised, has
grown shorter. What remains is of a different kind: the code no flow reaches,
and the routines still to be commented.
