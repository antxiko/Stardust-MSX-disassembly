# Findings

That Stardust is a ZX Spectrum conversion was already known. What you don't
expect is quite how far that conversion goes: they didn't just bring the
graphics across and rebuild the rest, they brought the whole recording
system, the load routine, and even the way the screen gets drawn. What
follows is what kept turning up as the tape came apart, each thing with the
evidence behind it, grouped by theme: the conversion itself, the loading, the
two engines, the craft of drawing, the world and its creatures, the sound,
and the ending.

## Who actually made this version

The ZX Spectrum authors warn in their own repository that somebody else made
the MSX version. And the game answers that on its own, in its credits
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

The conversion is Carlos Arias's, and the graphics still belong to the
Arévalo brothers, same as the original — which fits with the artwork having
been carried across exactly as it was, untouched.

## A conversion down to the bone

The first thing that jumps out on close inspection is how much of this tape
isn't MSX at all, but the Spectrum it came from.

### This isn't an MSX tape

MSX games are recorded in KCS blocks, the system's own format: the BIOS
writes them and the BIOS reads them, and that's how the rest of Topo Soft's
titles for this machine do it.

Not Stardust. Its four data blocks are ZX Spectrum blocks, with the
structure from over there: a flag byte, the data, and a final byte that's
the XOR of everything before it. All four carry that checksum correctly —
checked one by one — and it's the only integrity check the tape has at all.

The tape carries it, yes, but **nobody looks at it**: the load routine works
out the XOR and returns with the carry saying whether it matches, and both
call sites (0x4018 and 0x403D) carry on without testing it. There is no retry
and no error message: if the tape reads badly, the game starts anyway.

And the loader isn't native either: it's a reimplementation of LD-BYTES, the
Spectrum ROM's own load routine, with the same register interface:

    ld ix,047a0h    ; IX = where it goes
    ld de,0b647h    ; DE = how many bytes
    ld a,000h       ; A  = the flag expected
    scf             ; carry set = load, don't verify
    call 0405ch

Anyone who's ever programmed a Spectrum will recognise that call: it's the
one at `0x0556` in its ROM, parameter for parameter.

### The flat 48K the Spectrum has and the MSX doesn't

Before loading anything, the loader does something an ordinary MSX game
wouldn't ever need to bother with: it hunts for RAM and maps it into pages 1
and 2.

    ld hl,04000h / call sub_d30fh
    ld hl,08000h / call sub_d30fh

The routine at `0xD30F` keeps trying to write into each slot with `ENASLT`
(the BIOS call at `0x0024`) until it finds actual RAM. Why bother? Because
the Spectrum has 48K of flat RAM and the MSX doesn't: here, the lower half
of memory is taken up by the BASIC ROM, so for the ported game to find memory
exactly where it expects it, that ROM has to be shoved out of the way
first.

### The second load brings the Spectrum's LD-BYTES again

We already know the loader reimplements LD-BYTES, the routine the ZX
Spectrum's ROM uses to read from tape. Well, the routine the game uses to
load its own second part isn't a copy of that one — its signature was
searched for byte by byte across the whole tape and turns up nowhere — but
it comes from the same place, and it says so right there in its constants:
three numbers, each in its own spot and in the same order as the original.

    0x16     LD-EDGE-1's delay
    0x0415   LD-START's wait
    0x9C and 0xC6   the thresholds LD-LEADER uses to recognise the guide
                    tone by measuring how long the pulse lasts

Even the split into two routines is the same: one calls the other and
bails out if it fails, exactly what LD-EDGE-2 and LD-EDGE-1 do. The only
thing that's genuinely ported is the bit read itself, because the Spectrum
goes through `in a,(0feh)` and here it has to go through PSG register 14
instead.

And as a bonus, the show: on every edge read, the routine dumps the masked
refresh register into the border colour (`ld a,r / and 00fh`), which is
exactly the colour stripes the Spectrum flashes while loading, dressed up
over the one place the MSX has anything resembling a border colour at all.

Worth being clear about what kind of proof this is: it's an identification
by structure and by constants, not a diff — there's no Spectrum ROM in this
repository to compare against byte by byte. With three numbers that specific
landing exactly where they should, it's hard to imagine it's anything else,
but it's worth saying plainly what kind of evidence this is.

### The explosions carry a Spectrum fossil inside

Both stages have their own particle explosion, each with its own copy of the
code. The ship one — when the ship gets shot down — seeds 64 particles at the
ship's position and moves them with gravity: vertical speed grows by one
point per frame, and each particle is just a loose pixel drawn onto the
buffer. The happy-ending one — the flagship seen from outside — is 200
particles of shrapnel, biased upward, no gravity this time.

And in both, buried inside the loop that paints each particle, sits this:

```
c663: and 018h / out (0feh),a
```

0xFE is the ZX Spectrum's border port. On the original, every particle made
the screen border flicker; here on the MSX that port does absolutely
nothing, and the instruction just sits there anyway, firing uselessly on
every single particle since 1987. Both copies of the effect carry the same
fossil, and it's the cleanest proof this project has that these routines
were carried across from the original as they were, without anyone
reviewing them.

While we're at it: the randomness for the particles — and for the 48-star
field in the ship stage's background, which are actually random heights
painted with the same fixed pattern `0x18` — comes from a generator that
reads the BIOS ROM as if it were an entropy table. And the immortality POKE
from Input MSX magazine, the one that patches 0xC06E, sends the ship through
0xC05C on every frame, where a 3 goes into the shield counter: immortality here
is, literally, a shield that is recharged before it can ever run out.

### A slip in the enemy spawner, inherited instruction by instruction

The routine at 0xD41A works out the difficulty with `rrca`, which rotates
instead of shifting. Since `7 − zone` comes out odd on exactly the even
zones, the low bit spills into bit 7 right there, the mask saturates to
0xFF, and the odds of an enemy spawning that way drop to one in 256. The
progression only stays clean on the odd zones — 1/8, 1/4, 1/2 — and on
zone 7 the enemy just walks in without rolling anything.

And it's not the conversion's fault: it comes straight from the factory.
Checked against the disassembly the ZX Spectrum authors published
themselves, the matching routine sits at $D4CF with the exact same sequence
— `LD A,$07 / SUB B / RRCA / ADD A,E` — 52 of its 68 bytes identical and not
a single opcode different: the 16 that change are just address operands. The
`rrca` was there back in 1987, and the port copied it instruction by
instruction, untouched.

And in play, that's exactly what happens. Pointing the emulator at the `add
a,e` at 0xD436 — right after the `rrca`, with the zone sitting alongside —
over the stretch of the recorded game where the ship stage runs the show,
the 206 times it fires give this table and no other:

```
zone 2   A=0x82      zone 3   A=0x02
zone 4   A=0x81      zone 5   A=0x01
zone 6   A=0x80      zone 7   A=0x00
```

The three even zones that actually got played all carry bit 7 set, so the
mask really does saturate; the odd ones give the clean progression. And zone
7 comes out 0x00, exactly the case where the enemy walks in without rolling
anything at all. It's softened a bit, mind you, because those tables have
another spawn route, through the map tiles, that ignores the zone entirely.

What can't be claimed is intent. That a shift was meant is what everything
suggests — the game uses `srl` to divide in both blocks, and `rra` sits one
bit away from `rrca` — but nobody can read the mind of whoever wrote it, and
the original authors left that routine uncommented too.

## The loader, and what it carries

The loader alone is good for several findings, and the game hides a second
loader inside it besides.

### The loader ships with a back door for trainers

And this is the best one of all. Before starting the game, the loader
copies 94 bytes from 0xDAC0 to 0xFDE8 — high memory, where nothing's going
to overwrite them — and then takes a look at what's in there:

    4040: ld hl,0fde8h / ld b,003h
    4045: ld a,(hl) / cp 0c9h / jp nz,0bd85h   ; three 0xC9 signature bytes?
    404e: ld b,(hl)                            ; B = how many patches
    4050: ld e,(hl) / ld d,(hl) / ld a,(hl)    ; address and value
    4056: ld (de),a / djnz 4050                ; apply them
    4059: jp 0bd85h                            ; and now, at last, into the game

If those 94 bytes start with three `0xC9`, the loader treats them as a list
of patches and applies them straight onto the game it just loaded. So the
commercial loader itself ships, from the factory, with a POKE applicator
built in.

And the arithmetic settles on its own: three signature bytes, one counter
byte, and thirty patches of three bytes each, ninety-four in total. It's
sized for exactly thirty pokes.

Which explains, in passing, why the magazine loaders of the day worked so
well with this particular game. The one in *Input MSX* issue 19 writes with
`FOR I=56000 TO 56012`, and 56000 is exactly 0xDAC0: the mailbox. Its three
patches, read straight from the binary before they get applied:

    0xC06E/6F:  38 1F (jr c,+31)  ->  18 EC (jr -20)
    0xF7B1:     01 -> 00

The second one changes the `1` of an `ld a,001h` into a `0`. Applied by the
game's own loader, the ship survived sixteen minutes straight without dying
once.

#### And the first one jumps into a routine the game ships and never calls

That patch's displacement is `EC`, which is −20: the jump doesn't skip
anything by going forward, it goes backwards, to 0xC070 − 20 = 0xC05C.

And at 0xC05C there are seven bytes that aren't filler, whatever they might
look like:

    c05c:  ld a,003h        ; the shield
    c05e:  ld (0c188h),a    ; back to three
    c061:  jr  0c08fh       ; and on with the ship, as if nothing happened

So immortality here isn't about dodging the explosion at all: it's that the
shield gets refilled to three on every single frame, faster than the game
can ever spend it.

And the striking part is whose routine this actually is. It's sitting on
the tape, and in the game as it was sold, nobody calls it at all: its
address doesn't appear even once among the block's 46,663 bytes, and no
relative jump lands anywhere near it. Seven bytes doing exactly what you'd
need in order never to die, sitting exactly twenty bytes away from the jump
you have to patch to reach them.

That the authors left it there on purpose, as some kind of test switch, is
what it looks like — but that's a guess, and it's stated as one. What is
actually measured is the behaviour, and twice over: in the PC sampling of
the long session, played with the trainer on, those three instructions turn
up 28, 13 and 33 times, and the explosion's particle seeder not once; in the
sampling of a session played by hand without the trainer, it's the other way
round, 0xC05C never shows up and the explosion does.

### How the game asks for the second part

Clearing the last ship zone brings up a screen reading

    FELICIDADES
    HAS CONSEGUIDO PENETRAR LAS DEFENSAS DE LA NAVE INSIGNIA
    PERO LO PEOR AUN NO HA LLEGADO

and the game goes back to the tape for the second part, the one on foot.

The interesting bit is how it does that. The loader's own load routine
survives the whole game in page 1 — the game loads from 0x47A0 up and never
treads on it — so calling it back would be the obvious move. It doesn't. The
game brings its own routine instead, and it turns out to be a second port of
the Spectrum's LD-BYTES, the same one the tape loader had already
reimplemented on its own account:

    f7f6: ld hl,0f89fh / push hl    ; the return address, pushed by hand
    f7fb: ld a,008h / out (0abh),a  ; switches on the tape MOTOR
    f7ff: ld a,00eh / out (0a0h),a  ; PSG register 14, the tape-bit one
    f804: inc d / ex af,af' / dec d / di      ; LD-BYTES, opcode for opcode
    f808: ld a,005h  ...  ld hl,00415h        ; and its very constant, 0x0415
    f848: ld (ix+000h),l            ; each byte read, stored through IX
    f887: in a,(0a2h) / cpl / xor c ; reads the tape bit back off the PSG
    f893: ld a,r / and 00fh / out (099h),a    ; and flickers the border, via the
                                              ; VDP where the Spectrum used a port

And it isn't a copy of the loader's version either: its signature was
searched byte by byte across the whole tape and turns up nowhere.

So how was this settled? Starting from a savestate grabbed right on the
FELICIDADES screen and sampling the program counter every two milliseconds
through the whole load: 84,441 samples, every single one inside
0xF7F6–0xF89E, not one in ROM, not one in page 1. Meanwhile IX — the pointer
that `ld (ix+000h),l` stores through — walks from 0x61D0 to 0xD674, exactly
the last byte of a 29,861-byte block. Neither the BIOS nor the loader has
anything to do with any of this.

What's left in memory afterwards matches the tape's block to 99.78%: only
66 bytes out of 29,861 differ, spread across thirty short runs, and they're
the variables the second part had already written to by the time the dump
was taken — among them the three 46-byte sound-channel states at 0xD068,
0xD096 and 0xD0C4.

And if you replay a recorded playthrough, a breakpoint on 0xF7F6 never
fires: the recording begins with the loader already running — its very
first frame has the program counter sitting at 0xF849, inside the routine —
so the entry point simply has nothing left to catch. The 0xF89F sitting on
the stack is put there by the `push hl` at 0xF7F9.

### Why the second part loads exactly at 0x61D0

The load address of the on-foot stage's block is not arbitrary at all: the
font fixes it. That stage's two text printers — the one for the DEMO sign
and the menu, which paints double-height through the checkerboard, and the
frame one, which writes straight to video memory — use the same ASCII font,
indexed as `0x5F00 + code×8`. The ship block leaves that font loaded, and
the on-foot stage simply reuses it.

The arithmetic closes on its own: the last character the font needs is `Y`
(code 89), and 0x5F00 + 90×8 works out to exactly 0x61D0. The second part's
block loads at the first free byte right after the `Y` glyph, not one byte
earlier, so as not to eat into the inherited font.

### Where the second part starts executing

0x61D0 is only where the block is *loaded*. The program starts executing at
0xA279, and the loader itself takes it there, as soon as the tape load
succeeds:

```
f7b0: ld a,001h / ld (0a529h),a
f7b5: jp 0a279h            <- the second part starts here
```

And 0xA279 disassembles to a textbook program start: it disables
interrupts, sets up its own stack with `ld sp,05b32h`, programs the
graphics chip and writes `JP 0xC46E` into 0xFD9F, which is H.TIMI, the MSX
interrupt hook. That same address, 0xC46E, had already been identified
separately from the shape of its epilogue: two independent routes agreeing
on the same spot.

## Two engines, one shared library

The two halves of the game don't share an engine — but they do share the
tools.

### Two different engines on one tape

The two parts of the game don't share an engine, and it shows most clearly
in how they carry their creatures around. In the ship stage, every entity
keeps a pointer to its governing routine right in its own 8-byte structure,
and the game jumps there with a `jp (hl)`. Catching those jumps with the
game actually running, the IX values step 8 at a time: 0xCB3A, 0xCB42,
0xC8D8, 0xC8E0...

And that `jp (hl)` is really a disguised call, not a jump, because the Z80
has no `call (hl)` instruction. What the game does is push the return
address by hand:

    ld hl,0cb9dh        <- the return address
    push hl             <- onto the stack, as a CALL would
    ld l,(ix+003h)
    ld h,(ix+004h)
    jp (hl)             <- and off to the object's behaviour

The `ret` that ends that behaviour lands on 0xCB9D, which is the very next
instruction: an indirect call built out of two plain instructions.

And there's an even finer touch. When an object has nothing to do, instead
of storing a null pointer and checking for it every time, the game installs
the address of a `ret` that already exists in the code (0xD959). That way
the loop never has to ask anything: it always calls, and whatever has
nothing to do just returns immediately.

The on-foot part doesn't treat its enemies this way at all. They live in
5-byte tables — walkers at 0xACE4, four at most; flyers at 0xACF9; the
turret's two shots at 0xAD04 — and carry no routine pointer: fixed loops
move them, one per species.

And what the `jp (hl)` at 0xC544 actually dispatches isn't enemies at all:
it's the sound interpreter's three channels.

The code says so, in the simplest possible way. The routine that starts a
sound takes the channel number, multiplies it by 46, and adds a base to
reach that channel's state. Both halves of the game carry the same routine
for this, identical but for the base:

    ships    and 07fh / ld de,0002eh / call ... / ld de,0ed75h
    on foot  and 07fh / ld de,0002eh / call ... / ld de,0d068h

And 0xD068 is exactly where the mystery IX values landed. The arithmetic
closes on both sides: three 46-byte channels counted from 0xED75 end at
0xEDFF, precisely the address the code loads for the interpreter's
variables.

So that `jp (hl)` was never dispatching entities: it was dispatching music
commands. It's the same interpreter in both halves, with the same three
channels.

What they do genuinely share is the craft of drawing. It's the Spectrum
technique, from a machine with no hardware sprites at all: the image gets
shifted bit by bit with an unrolled run of `adc hl,hl`, a hole gets opened
with AND, and it gets painted with OR.

And if you pair up the drawing run of one half against the drawing run of
the other — not against the mask run, which is the other half of the same
routine — 26 bytes come out identical out of 28, and the only difference is
one jump's operand.

#### And it isn't just the sprites: they share a whole library

The rest of the service routines don't merely resemble each other: they're
the exact same routines, copied and relocated from one place to the other.
Five are identical byte for byte:

    buffer_dir      0xC541 / 0xAACD   18 of 18 bytes
    solapa_eje      0xCD7A / 0xAEC2   12 of 12
    hay_tecla       0xF660 / 0xD30B   16 of 16
    mul_a_de        0xE591 / 0xC8A6   21 of 21
    vram_pon_dir    0xEE24 / 0xD117   16 of 16

And in the rest, what turns resemblance into proof is where the differences
land: in pairs of consecutive bytes, exactly what a 16-bit operand measures.
The sprite painter is 198 bytes long and 21 of them differ: twenty are ten
addresses — the sprite pool, the row counter, the two `jr` instructions the
routine patches into itself, the call to `buffer_dir`, the two jumps the
shortcuts use to vault over the runs, and the one that closes the row loop —
and the twenty-first is one loose byte, the bottom clip: `0x50` in the ship
stage and `0x4F` in the on-foot one. Out of the whole routine, that's the
only thing that genuinely changes. The glyph painter, 144 bytes, gives the
same picture: 13 differences, six addresses and that same byte again.

In `borra_buffer` the four differences are just that the `di` sits before
the `ld hl,0 / add hl,sp` in one half and after it in the other. In the
random number generator, all four differences are the seed's address,
which shows up twice.

Counted in the raw, searching for identical stretches of 32 bytes or more
between the two blocks turns up 58 stretches and 5,867 bytes, of which
1,200 fall in code territory. And that figure is deliberately on the low
side, because every different address splits a stretch in two.

There are also differences that aren't relocation at all, but a genuine
design choice. `gira_rumbo` exists in both halves and does the same thing —
nudging the current heading toward the requested one an eighth at a time,
the short way round — but the on-foot version is missing the bit that
checks a wait counter tucked into bits 3 and 4 before applying the turn.
Which is why the ship takes a few frames to tip over from one bank angle to
the next, while the on-foot character changes direction instantly.

With that, the earlier line can be sharpened: the two game engines are
different, the service library is exactly the same one.

#### How to place a drawing between two bytes: four ladders

Video memory works in bytes, eight pixels at a time. To put a ship at
column 173 you have to shift the drawing within the byte, and on a Z80,
that costs. The solution the game brings is the house special: a run of
shift instructions written out one after another, entered at exactly the
right height. The painter takes the low three bits of X and writes the jump
into itself:

    c494:  ld a,l / and 007h / jr z,...              the column lands exactly
    c499:  dec a / ld c,a / add a,a / add a,c / add a,007h    (n−1)·3 + 7
    c49f:  ld (0c4c4h),a / ld (0c4fbh),a             patches the two `jr`s

The 3 is what one rung costs (`adc hl,hl` is two bytes and `adc a,a` one),
and the 7 is what the shortcut in front costs. That way the jump lands on
exactly the right rung, and only the steps that are actually needed get
taken.

And the steps go backwards from what you'd expect. To shift the drawing n
pixels to the right, you take 8−n steps to the left over a three-byte
window, because whatever spills out the top is exactly what needs to show
up in the byte next door. With n=0 you'd need all eight steps, and those
come free just by swapping registers around — that's the shortcut.

Looked at closely, the run doesn't shift at all: it rotates. A, H and L
turn together as if they were a single 24-bit number, and it works like a
shift only because it's the filler bits that come around the loop. And the
filler is the only thing that tells the two runs each painter carries
apart:

    mask     enters with A=0xFF and `scf`   → fills with ONES  (lets the background show)
    drawing  enters with `xor a`            → fills with ZEROES (doesn't overpaint)

Which is why it's the same code written out twice rather than one routine
called twice: each copy ends up somewhere different — the one that stamps
with AND and the one that stamps with OR — and all of this sits inside a
sixteen-row loop, where a real call and its return would be paid thirty-two
times over per sprite.

There are four ladders in total, two per painter — the sprite one works at
24 bits, the letter one at 16 — and all four show up in both halves of the
game, identical byte for byte apart from where the jump lands:

    mask 24-bit    0xC4C5 / 0xAA51   26 of 28 bytes
    drawing 24-bit 0xC4FC / 0xAA88   26 of 28
    mask 16-bit    0xC590 / 0xAB1C   18 of 20
    drawing 16-bit 0xC5B5 / 0xAB41   18 of 20

#### The glyph painter's ladder starts six bytes before its declared range

In the glyph painter, the patch's arithmetic is `n·2 + 4` instead of
`(n−1)·3 + 7`, because its rungs are two bytes each and its shortcut is six
(it's the same formula written differently: `n·2 + 4` is `(n−1)·2 + 6`). And
written that way it points straight at where the run starts: with n=1 the
jump goes to 0xC5B5 + 6 = 0xC5BB.

And at 0xC5BB there's a run, not filler. The six bytes in front of its
fourth rung — `ed 6a` three times over — are the ladder starting, and with
them it has the same seven rungs as the other three.

Seeing it takes crossing two things no tool crosses on its own: the
program-counter dump, which carries those three rungs at 40, 155 and 226
samples — more than plenty of already-declared addresses —, and the ranges
declared as data. The guard that exists crosses data zones against the
trace, but the tracer doesn't reach this ladder either; the cross-check has
to be done by hand.

And that cross-check turns up two more ranges, both code: the seven bytes
where the magazine's POKE lands — told above — and eight more at 0xE03D,
which turn out to be an object behaviour installed as a pointer from two
places in the block itself. Fifteen bytes sitting in the wrong column.

## The craft of drawing on an MSX

What had to be invented to draw a Spectrum game on a machine that keeps its
screen behind a port.

### What the MSX forced them to change

There's a fundamental difference between the two machines the conversion
couldn't dodge no matter what. The Spectrum writes directly into its screen
memory, which is ordinary RAM at 0x4000. On the MSX, video memory sits
behind the graphics chip and can't be addressed at all: it has to go out
byte by byte through a port.

Which is why this version carries something the original never needed: a
screen buffer in RAM, with a routine to dump it out. The buffer runs from
0x4000 to 0x4EFF, 3,840 bytes, 24 wide by 160 tall, and the dump sends it to
VRAM in three bands — 0x4000 with 56 rows, 0x4540 with 64 and 0x4B40 with
40 — one per call, each into its own third of SCREEN 2. The code says so,
with its three contiguous calls from 0xF3DC, and the emulator confirms it:
that routine racked up 3,252,480 writes, with the pointer walking exactly
0x4000-0x4EFF.

And the axes are easy to read backwards, with everything that drags along
if you do: the dump's `ld b,028h` looks like it's saying "40 columns", but
it's the inner loop, and it walks the buffer in steps of 24 — which means
it's actually collecting 40 bytes from a single column. The one really
counting columns is the outer loop, `ld c,018h`, stepping one byte at a
time, 24 times over.

Drawing it settles the question: split 24 at a time and the high-score
table comes out legible; 40 at a time, pure noise. And it matches what you
see while playing: 24 bytes are 192 pixels, narrower than the screen —
that's why the frame down the sides never moves — and the surplus sits
vertically, exactly where it scrolls.

### One plane only, and why it looks like two

Anyone who's played this remembers two floors moving at different speeds,
with that sense of depth. So it got checked properly: watching which
routine writes to each band of the buffer, and building up, frame by
frame, a table of which row got drawn from which address — which lets the
shift get measured by exact number matches instead of eyeballing images.

And the result is unambiguous: the background is a single plane. Across
four separate measurements — three moments in the on-foot stage and one in
the ship stage — the buffer's eighteen strips, three bands by six columns,
all shift exactly the same: +2 rows per frame walking, 0 standing still,
−2 walking backwards, with 100% agreement and no horizontal shift at all.

The depth lives somewhere else: in the drawing order. Numbering every write
to the buffer within a single frame, the ship stage always produces the
same sequence: the whole background first, then the sprites, and after the
sprites, still one more routine (0xC77A) that paints columns of scenery
reading from its own tile store. And it got caught doing exactly that: a
pillar coming down, the ship rising toward it, and right where the two
crossed, the pillar ended up painted on top. The ship doesn't pass under the
floor — it passes behind whatever gets repainted afterward.

In the on-foot stage, though, the parallax is real, only it isn't a plane:
it's a drawing that redraws itself differently each time. The background
gets painted twice per frame by patching an opcode: the game loop writes
`0xC2` (`jp nz`) into 0xA98E and calls the redraw — so only the empty
cells, the ones carrying tile 0, get painted — then writes `0xCA` (`jp z`)
and calls it again, this time for the solid ones. And that tile 0 is alive:
every scroll step rotates it by one row of pixels (0xB140 going up, 0xB167
going down; the row that leaves comes back in on the other side). One row
of pattern for every two of scroll means the background in the gaps moves
at half the speed of the platforms. Which is why the buffer's strips all
shift exactly the same — the earlier point still holds — and yet the eye
still sees two different speeds. Measured across the whole game: 4,712
passes with each opcode, and not one frame comes out with any other value.

#### And there is a third opcode, which is an impossible jump

The background is painted with three opcodes, not two, and the third is the
cleverest of the lot. The instruction right before the patched jump is an
`and a`, which clears the carry by definition:

    a98a: and a                <- carry is 0, always
    a98b: ld b,(iy+004h)
    a98e: jp ?,L_A9E4          <- the opcode that gets patched

So the third possible value, `0xDA` (`jp c`), never jumps at all. It isn't
a third condition — it's the way of having no condition whatsoever. With
`0xC2` only the empty cells get painted, with `0xCA` only the solid ones,
and with `0xDA` everything gets painted in a single pass.

One routine writes it, and reaching that routine takes three things at
once: the scroll at the very top (row 0x47), all six targets destroyed, and
the player sitting between 0x50 and 0x5F. That is: the end of the stage.

Which explains why the 4,712-pass measurement over the bulk of the game
never sees that third value — those three conditions simply aren't met
until the very end. The third opcode's only use in the whole game is the
closing travelling shot, told in
[How the game ends](#how-the-game-ends-and-a-pointer-table-that-was-coordinates).

### The same lettering, sharp or see-through

On the high-score table the text comes out with its pixels separated, as if
it were half transparent, while the `DEMO` sign reads perfectly sharp.
They look like two different typefaces. It's the same routine, and the
difference is made by patching the code on the fly.

The routine that draws a character does it at double height: each line of
the font gets painted twice, and each copy is masked with a different
pattern.

```
d4d0: ld a,(de) / and 055h / or (hl) / ld (hl),a / add hl,bc
      ld a,(de) / and 0aah / or (hl) / ld (hl),a / add hl,bc
```

`0x55` and `0xAA` are `01010101` and `10101010`: alternating pixels,
shifted from one line to the next. Which gives you a checkerboard, and a
checkerboard to the eye reads as halftone.

And here's the good part: those two masks aren't constants at all. They're
the operands of those two `and`s, at 0xD4D3 and 0xD4D9, and the game
rewrites them before drawing, every single time:

```
bfb4: ld a,0ffh / ld (0d4d3h),a / ld (0d4d9h),a   ; neutral mask
bfbc: ld ix,0ddf2h                                ; the string "DEMO"
bfc0: ld hl,04d94h / call 0d4e5h                  ; draw
bfc6: ld a,055h / ld (0d4d3h),a
bfcb: ld a,0aah / ld (0d4d9h),a                   ; and restore
```

With `0xFF` the `and` doesn't strip anything, and every pixel comes
through. It's self-modifying code used exactly like a function parameter.

Along the way, the routine confirms where the font lives: it indexes with
`0x5F00 + code×8`, and with the first code, 0x20, that comes out to 0x6000,
right where the 59 characters live. And the stride between screen lines is
24, the buffer's height when read by columns.

### Two `call 0000h` that don't exist, and 193 bytes that were not text

The very first thing the game does, before anything else, is bounce the
STARDUST logo. And that animation is exactly why a cold disassembler can't
handle this stretch.

Putting together one frame takes two operations: painting the logo
stretched to whatever height it's at, and erasing whatever rows the
previous frame left dirty. And which order those two happen in depends on
whether the logo's going up or down. Instead of settling that with a plain
`if`, the routine writes its own two `call`s into itself:

    f000:  ld (0f016h),hl        the first call's operand gets written
    f003:  ld (0f019h),de        and the second one's
    ...
    f015:  call 0000h            HL fills this one in
    f018:  call 0000h            and DE this one

On tape those operands sit at `00 00`, so a cold listing shows two `call
0000h` — and an overly helpful disassembler will even hang the comment for a
harmless BIOS routine on them. Running live, they're always the same two
addresses, in whichever order an `ex de,hl` decides.

Worth checking twice before writing anything off as orphaned: no `call`
names either of these two routines directly, but their addresses are
written into the binary anyway, once each, as the operands of an `ld`.

The credits text is 234 bytes, `0xF1E7-0xF2D1`. The 193 in front of it,
`0xF126-0xF1E7`, are the logo's frame table: 96 pairs of top-row and height
that describe the bounce — the height grows from 1 to 16, the logo drops to
row 186 squashing flat, and comes back up — with an `0xFF` closing the list. Where the real text
starts is stated by the code itself, and the binary confirms it: right
before `CONVERSION POR` there are climbing pairs that aren't text and don't
even look like it.

### The credits scroll without moving the picture

The game's credits — the five cards naming whoever made the MSX version —
show up one at a time in the middle band of the screen, with a pause to
read each one, and each one signs off by sliding upward.

Moving that band should be expensive: it's 2,048 bytes of artwork. The
routine doesn't touch a single one of them. Remember the MSX keeps two
tables, one for which picture each cell carries and one for the pictures
themselves — and it moves only the first: 256 bytes instead of 2,048. Since
every cell already points at its picture, shifting the indices shifts the
whole image. Eight times cheaper, no exaggeration.

Each nudge is 32 positions, exactly one screen row, and there are eight
nudges total: the band's eight rows. When it's done, it wipes the pictures
and rebuilds the cell table — and there's the nice confirmation: it rebuilds
it with the exact same eight-by-eight interleaving the loading screen left
behind — 0, 8, 16… 248, then 1, 9, 17… — in just six instructions. The game
knows perfectly well how that table is supposed to arrive, and takes care of
putting it back that way itself.

Up to this point, that interleaving had only ever shown up in the loading
screen's code. Here it turns up a second time, written by a different hand
in a different block entirely — and it explains, in passing, why the
scoreboard can write pictures and always land on the right cell.

### The scoreboard doesn't write letters: it redraws the cells

The whole ship stage's scoreboard — the score, the lives, the zone number —
comes out of a single routine, at 0xF41D, and the first surprising thing
about it is that it doesn't write characters at all. In MSX video memory
there's a table saying which picture each screen cell carries, and another
holding the pictures themselves. The normal way to write a "7" would be to
put the seven's picture number into the right cell. This routine does
exactly the opposite: it leaves the cells alone and changes the picture
underneath instead.

And it can afford to, because the table's already set. The loading screen
left the cell table behind, and the game inherits it untouched, so every
gap in the scoreboard already points at a picture nobody else uses. Writing
becomes just dumping the letter's eight bytes on top of that picture.

The detail that seals it is the stride between one glyph and the next: 0x40
bytes, eight pictures' worth. Looks like an odd jump until you remember the
cell table arrives interleaved eight at a time from the loading screen.
With that interleaving, skipping eight pictures lands you exactly on the
cell next door. The two oddities cancel each other out.

Four places in the code call this routine, and each is a tell in its own
right:

- The score is six digits kept as text at 0xDD80. One routine resets it to
  "000000" at the start, and another adds to it doing decimal arithmetic by
  hand straight on the ASCII: bump the digit, and if it goes past "9", roll
  it back to "0" and carry one to the left. There's never a binary number
  to convert, because the scoreboard *is* the number.
- Lives and zone are one digit each (0xE156 and 0xE157), painted by simply
  adding 0x30 to turn them into ASCII.

And there's a coincidence worth noting: the score is painted at the same
video address, 0x12B0, in both halves of the game. The ship stage and the
on-foot one don't share a single line of code, but they put the scoreboard
in exactly the same spot on screen.

#### Both stages die the same way

Reading through the ship stage's lives turns up three things identical to
the on-foot stage, and none of it is coincidence:

- They both get initialised twice, and the second one wins: the menu
  leaves a three in the counter, and the start of play overwrites it with
  a two. The exact same pair as on foot, right down to the order.
- The extra life from points caps out at nine in both.
- And the deduction only fires once a counter reaches 45, the same number
  that closes out the on-foot stage's dying state. The address changes —
  0xC188 here, 0xA6ED there — but the mechanism is identical: a byte that's
  worth little while you're alive and starts counting the moment you're
  killed.

And that "worth little while you're alive" turns out to be more specific
than it sounds: it's the shield. It runs 0 to 3, counting the hits the ship
can take, and there are two kinds of hit, one that costs a point and one
that costs two — the second checks twice, between one subtraction and the
next, whether the first already finished the job. Of the six places that
write to that variable, only one ever writes the four that starts the
explosion, and ten spots in the listing lead there: death has exactly one
door.

Which makes the 10,000-point bonus make complete sense. Before handing out
a life, the game checks the shield: if you're below 2, instead of a life it
refills the shield to 3. So the same bonus is one thing or the other
depending on how you arrive at it — get there banged up and you get healed,
get there at full shield and you get an extra life.

And that finally settles a loose piece that had been sitting around since day
one: the immortality POKE published by *Input MSX* issue 19. This page used to
say it left the player stuck in the dying state, and **that is wrong**. The
arithmetic settles it.

The POKE replaces the `jr c` at 0xC06E with the bytes `18 EC` — `jr -20`
counted from 0xC070, so **0xC070 − 20 = 0xC05C**: three instructions that put a
3 into 0xC188 and carry on into the ship's movement. And 0xC188 is the shield.
So what the POKE does is **recharge your shield to full on every frame**, not
leave you dying: the ship always goes through there, the counter never reaches
four and the explosion is never triggered.

The pretty detail is that those three instructions **are called by nothing in
the original game** — their address does not appear once in the block. They are
there for the POKE to land on.

### The game frame travels in the block, and the loading screen sets the table

The decorated frame around the play area — with its HUD: the ship rosette,
the colour meters, the SCORE and ZONE bar — isn't drawn piece by piece
anywhere: it ships ready-drawn inside the game block itself. Its first
1,415 bytes are the STARDUST logo, a 128×16 bitmap the attract mode animates
in the middle of the screen, and right behind it come the frame's patterns
and colours, 0x900 bytes of each, which a startup routine copies to video
memory.

The copy has an odd shape — two character rows per screen third, plus
forty-eight loose strips — that only makes sense once you know the other
half of the trick: the game doesn't build the SCREEN 2 name table at all, it
inherits it from the loading screen, which had filled it in by counting in
eights: character n of each third shows up in column n÷8, row n mod 8.
Loading the tape wipes out the loading screen's program in RAM, but video
memory survives untouched, and the game counts on exactly that. With that
inherited mapping, the odd layout is simply the shape of the frame: each
third's characters 0 to 31 and 224 to 255 are the four columns on each side,
and the loose strips are the top row and the bottom bar.

Both halves check out against the emulator: the game's real running name
table matches the inherited pattern 768 out of 768, and the tape's patterns
and colours show up identical 97.4% of the time — the rest being whatever
the game paints on top, the starfield, the live scoreboard. And the proof
that beats all the others is drawing it straight from the tape with that
same mapping:

![The play screen's frame, drawn from the tape's data](imagenes/marco.png)

### The loading screen

![The screen you watch while it loads](imagenes/carga.png)

It's not a capture: it's drawn from the 12,288 bytes the block itself dumps
— 6,144 of pattern to video memory at 0x0000 and 6,144 of colour at 0x2000 —
following what its routine at 0x9C10 does.

And it has a trick worth knowing, the kind that teaches you something. The
table saying which picture goes in each cell isn't filled in order 0, 1, 2,
3… it's filled counting in eights: 0, 8, 16… 248, 1, 9, 17… Same 256 values
per screen third, just interleaved. Drawing it assuming sequential order
gives you convincing-looking noise, which is the worst kind of error there
is: it makes the block's layout look wrong when what's actually wrong is
how you're reading it.

It's signed CANO, bottom left.

## The world and its creatures

How the game carries its maps, its enemies, its collisions, and its deaths.

### The map cell is the drawing and the state at once

The things fixed into the scenery — the turrets and nests scattered through
each zone — aren't flying enemies at all: they're eight-byte objects the
level builder creates on entering the zone, one per occupied cell of a 5×5
grid. Each one carries its position, its type, a pointer to its own cell in
that grid, and the address of the routine that governs it.

And here's the pretty part: the installation doesn't keep its own frame
anywhere. It writes it straight into the cell it points at, and whatever
draws the zone paints whatever that cell says. Which is why a turret's
reload cycle reads, in the listing, as a plain count from 6 to 10 over a
single map byte: 6 is the loaded cannon, 7, 8 and 9 are the animation, and
hitting 10 sends it back to 6. Same idea that already turned up in the
on-foot stage, where the cell byte is both the drawing's index and the
physics' solid flag.

States chain together by rewriting their own governing routine: the turret
fires and turns into "turret reloading"; the nest drops an enemy aimed at
the ship and marks itself; whatever gets destroyed climbs its cell value up
to 0x10 and retires by installing, as its own behaviour, the address of a
`ret` that already exists in the code — so the loop can keep calling
everyone without ever having to ask first.

And the level builder decides what each cell is by its value, with a roll
of the dice thrown in: `call azar / and 004h / add a,006h` turns the value 6
into either 6 or 10, so the exact same cell in the exact same level comes
out a turret sometimes and a nest other times.

Which is also where the four-way shot comes from. It's dropped by the bonus
you get for destroying one specific type of installation, and only if
you're already at 10 energy — one time in four; otherwise what you get is
just ten energy, plain and simple.

#### Seven tables in a row, and not one boundary has to be guessed

That whole RAM map can be read start to finish without guessing a single
thing, because every table carries its own counter up front and dies
exactly where the next counter begins. Neither the cap nor the entry size
gets estimated: both come straight out of the spawning routine itself, its
`cp` against the cap and how it indexes each entry.

    0xC8D7  counter          0xC8D8  9 installations of 8 B   →  0xC920
    0xC920  the zone's 5×5 grid, 25 B                         →  0xC939
    0xC939  counter          0xC93A  6 enemy shots of 4 B     →  0xC952
    0xC952  counter          0xC953  9 of your own shots of 4 B → 0xC977
    0xC977  the table walker's two variables                  →  0xC97A
    0xC97A  counter          0xC97B  4 objects of 5 B         →  0xC98F
    0xC98F  counter          0xC990  2 objects of 4 B         →  0xC998
    0xC998  counter          0xC999  2 objects of 5 B         →  0xC9A3

6×4, 9×4, 4×5, 2×4 and 2×5, and every one lands exactly. There's a second
identical table for the special tiles, with its own counter at 0xCA92 and
eight objects from 0xCB3A: 64 bytes that end right where the declared range
used to.

And one thing worth saying even though it doesn't wrap up neatly: the first
table never checks its own cap. The builder bumps the counter without
looking, and there's only room for nine before the grid begins. Either the
level data guarantees it never overflows, or there's an overflow sitting
there unmeasured — this one hasn't been checked either way.

### Nobody polices the collisions: each one asks about itself

Both halves of the game keep two tables of things flying around, one per
side: one gets filled by the player's trigger, the other by the enemies.
What there isn't, anywhere, is a central detector cross-checking them.
Every object, right after painting itself, asks itself whether it just got
hit, always with the same routine, changing only the hit box and what it
pays out:

    who's asking               box        prize
    the enemy flock             4 × 0x0C    130 points
    the swarm objects            4 × 0x0C    140
    an enemy shot                4 × 8        53
    the ship (against the other table)       one point of shield

Watch out reading those prices, there's an easy trap here: the routine that
pays out doesn't add points as such, it adds to whichever digit it's told,
and the carry runs to the left. So the same value is 130 points or 13
depending on which digit of the scoreboard it lands in. The 53 points for
downing an enemy shot are identical in both halves of the game, same
number, same digit.

#### The four-way shot sounds once, and it manages that by gagging the sound

With the upgrade collected, the trigger fires four shots in a cross instead
of one. And since every new entry in the table starts its own sound effect,
you'd get four "pew"s at once, stacked on top of each other. What the game
does about it is drop a `ret` into the second byte of the routine that
starts sounds, right before the three extra shots, and put it back
afterward.

The nice bit is how it puts it back: there's no stored constant for that
anywhere. It copies the byte straight from its twin routine, the one that
starts scripts without hunting for a free channel, which shares the same
prologue. It just borrows it from the routine next door.

And there's a curious asymmetry between the two halves: the on-foot stage
has that exact same four-way shot, and can never turn it on. The byte that
decides it gets read in one place and written in exactly one, right behind
an `xor a` — meaning it only ever gets written a zero. The three extra
entries are dead code in the version that shipped. It doesn't carry the
silencing patch either: if those four shots ever did come out, all four
would sound at once.

### The whole tower, and a map that is two maps

The on-foot stage is a tower, and its map sits at 0x840B: 78 rows of 6
cells, 468 bytes, 280 cells with floor in them. `base_mapa` (0xA9F5) gives
it away, doing `ld ix,0840bh` and returning the base plus row times six.
It's the only reference to that range in the entire listing, and the two
readers that exist both go through it.

And those two readers make the cell byte two things at once. For the
redraw, it's a tile index: origin = 0x87F3 + value×128, so the cell says
which picture gets painted. For physics, it's a boolean:
`consulta_mapa` (0xB18E) ends in `and a`, and its six callers only ever look
at the Z flag — cell zero means empty — none of them use the value itself.
There isn't a separate collision map and scenery map: there's one map, read
two different ways.

The arithmetic closes to the byte. The map's highest value is 44, and
0x87F3 + 45×128 − 1 comes out to exactly 0x9E72, the very last byte that
had been seen the blitter reading while measuring the video port: the pool
is exactly 45 tiles, no more, no less.

The tiles are 32×32 pixels — 128 bytes, four per row, thirty-two rows —
and with that the whole tower measures 192×2496 pixels. Three independent
routes confirm it: the 128-byte tile, `consulta_mapa` dividing Y by 32, and
the fine scroll, which takes sixteen 2-pixel steps between one row and the
next.

With the map and the pool, the whole tower can be drawn — it's in
[The game](THE-GAME.html#zone-8-the-on-foot-tower), right next to the other
seven zone maps, with its bare structure and its 45-tile pool. Below the
starting point sits the arrow sign pointing up (tiles 0x28 and 0x29, which
appear nowhere else at all), and row 0 is a cornice of rosettes.

The camera that climbs the tower is the pair (0xAD2A, 0xAD2C): map row plus
a fine pixel offset. The updater (0xA8DB) moves that fine offset 2 at a
time up to 32 and then switches row, clamped at rows 0 and 71 — the gearing
got caught live in the emulator: the probe logged (row 57, fine 32) and,
one step later, (row 56, fine 2). Every step on firm ground also saves a
checkpoint, position at 0xA6E9 and camera at 0xC466/67, which is exactly
where death sends you back to.

### The player's death

The player dies stepping into the void. And the check that decides it isn't
the "fine" variant of the map query, with sub-cell logic: that one (0xB1BE)
answers whether a position falls well centred inside an empty cell, and
only the flying enemies use it, to decide which hole in the wall to nest in
— measured over the whole recorded game, 2,934 passes through it, and the
return address on the stack was always the same caller, the flyers' loop,
not once the player.

The player isn't in any object table at all: he lives in two bytes (0xA6EB,
with Y pinned at 0x68 — moving up or down never moves him, it moves the
world around him) and has his own call to `consulta_mapa`, at 0xA665,
checking the cell right under his feet. If that cell comes back empty:

```
a665: call consulta_mapa
a668: jr nz,<sigue andando>
a66a: ld a,004h / ld (0a6edh),a     ; state 4: doomed
```

And there's no going back: through the whole dying state, states 4 to 45,
the map never gets checked again, not once. There's no such thing as
landing safely: you die the instant you step into the void, and the fall
you see afterward is only the collapse animation, its frames rotated
depending on which way you tripped.

The other way to die is by contact. The shield (0xA6ED, running 3 down to
1, the three icons on the scoreboard) gets docked when you're hit, and once
it reaches zero the game patches the player's update pointer to swap in a
corpse in freefall (0xB268): it rises, falls accelerating and — since it
never checks the map either — passes straight through the floor and exits
off the bottom of the screen.

Both routes funnel into the same place: once the state reaches 45, a life
gets subtracted (the counter starts at two, and more are earned through
points up to a cap of nine), and once the counter's spent, game over; if
there are lives left, the respawn drops you back at the last firm ground
you stood on, with the checkpoint's camera, the shield back at three and
the enemy tables emptied out.

And the two starting lives have a catch: there are two initialisations, and
the second one wins. The menu leaves a three in the counter, but the start
of play immediately overwrites it with a two. Which is why the first death
of any game finds the counter already sitting at two.

#### The dying state: no timer, just a slow loop

Between the game writing you off and actually taking your life away sit
about five seconds, and no real clock counts them. The counter climbs one
per turn of the main loop, with no prescaler and no sync with the video
whatsoever: there isn't a single `halt` anywhere in the module, the video
memory dump is just a copy loop, and no routine in the dying sequence ever
looks at the global frame counter.

What's slow is the turn itself. One turn of the engine — a double pass over
the background, enemies, shots and the dump of the three bands — costs
about 123 milliseconds, which is 6.15 of the machine's 50 frames a second.
Forty-one turns at that rate come to 5.04 seconds, and the emulator
measures 23 separate dying sequences running from 4.76 to 5.29 seconds,
averaging 5.04. The sum lands exactly on the mark.

And while it lasts, you're untouchable: three independent checks in the
listing skip collision outright once the state has already reached four.

#### Twenty-three deaths, and another forty-four that aren't yours

The recorded game yields the full picture: twenty-three deaths, 22 by
contact and just one by falling, and all twenty-three go through the same
deduction and the same respawn. The game runs from second 2,464 to 3,124 —
eleven minutes — and ends by actually finishing the game: the emulator
watches the program pass through the happy-ending routine, not the one for
running out of lives.

And the life counter never went down, because that particular game was
played with a cheat: it doesn't climb from two to six by earning lives
faster than losing them, it climbs because none get lost at all. The
trainer patches exactly one byte, the operand of the `sub 001h` sitting
right behind the funnel:

    a528:  D6 01     sub 001h      <- what the tape carries
    a528:  D6 00     sub 000h      <- what the recorded game had

That doesn't stop you dying. You die just the same, go through the funnel
just the same, and the scoreboard repaints just the same: the only thing
that changes is that the subtraction subtracts nothing. And as a side
effect, that puts the game over out of reach entirely, because `sub 0` can
never set the carry, under any circumstances.

Putting that `01` back — which is just restoring the tape's own byte, not
touching the game at all — and getting killed six times in a row, the
counter goes 5, 4, 3, 2, 1, 0, and on the sixth the carry finally fires: the
`jp c` gets taken at last, and the game ends for real. That's the first time
that jump has ever been seen taken. With one detail thrown in for free: the
subtraction gets stored *before* the jump, so the life counter is left
sitting at 255. There's no cap and no check of any kind, and it doesn't
matter, because there's no coming back from there.

But the recorded tape holds another 44 deaths that aren't the player's at
all: they belong to the attract-mode demo, which runs exactly the same game
code and therefore hits the exact same death routines. Telling them apart
isn't a matter of watching the clock, because the game says so itself:
address 0xA689 holds the operand of a call that's worth one thing in a real
game and another in demo mode, and the startup routine itself checks it (`cp
0eeh`) so it doesn't repaint the scoreboard while the demo's running solo.
Asking that byte at every death, the recording's two demo passes — the one
before the game starts and the one after the high-score table — separate
themselves cleanly from the eleven minutes of real play.

### The countdown is a tower that grows

Near the end of the on-foot stage you need to destroy six targets, and once
the sixth falls, a countdown begins. And it isn't digits: it's a white
tower gaining one row of pixels roughly every two seconds. The whole
mechanism sits in the listing: the level start leaves a 6 at 0xBC33, every
destroyed target subtracts from it, and once the counter hits zero, every
tick paints one row (`ld a,07eh / out (098h),a`) and adds one to 0xBC30. The
pace comes from the global frame counter, one tick every sixteen frames.

```
bbb4: cp 0a1h / jp z,0bceeh    ; at row 161, it's over
```

And since the player escaped in time in the recorded game, checking the
ending meant letting it run out separately: the game got loaded with the
tower halfway up, the controller got unplugged, and at exactly row 161 it
jumped to 0xBCEE, the destruction sequence, and straight from there to the
high-score table. Game over, no FELICIDADES. The numbers from the real game
land close: the player escaped with about 30 seconds to spare out of the
5.8 minutes the game gives you.

### The on-foot stage has its own demo, and its own recorded game

The ship stage's demo isn't a machine playing on its own: it's 869 bytes of
recorded play, one byte per frame. And the on-foot stage has its own —
couldn't be otherwise, since the ship stage's recording sits at 0xBA20 and
its reader at 0xC1AF, and both addresses fall inside 0x61D0-0xD674, which
means the second part wipes them out the moment it loads.

Its own version starts at 0x9FF3 and runs 646 bytes, which at 50Hz is 12.9
seconds. The location is stated by the code itself — `ld hl,09ff3h` at
0xA3FF — and the boundary is visible at a glance, because right before it
there's pure artwork:

```
9FE3  55 55 55 55 AA AA AA AA 55 55 55 55 AA AA AA AA   <- checkerboard, two values
9FF3  00 00 00 00 00 00 00 00 ...                       <- not anymore
```

Those 646 bytes use 17 distinct values, all of them even and none higher
than 0x1E: it's the control mask, one byte per frame of play.

And the interesting part is how it switches on. At 0xA688 there's a call
whose operand gets rewritten from two different places:

```
a313: ld hl,0a6fch / ld (0a689h),hl   <- normal game: reads the controls
b6ca: ld hl,0a6eeh / ld (0a689h),hl   <- demo: reads the recording
```

Same call, two possible origins, switched by patching the code on the fly.
And the DEMO sign flashing in the bottom right corner doesn't check any
flag at all: it asks the patched instruction directly.

```
a4d1: ld a,(0a689h)   ; that call's operand
a4d4: cp 0eeh         ; does it point at 0xA6EE, the recording reader?
a4d6: jr nz,...       ; if not, we're not in demo mode
```

This one turned up because a player actually finished the game and reported
that, right after the high-score table, a demo of the on-foot stage kicked
in. The reader was sitting inside a range this project had, up to then,
labelled simply "table".

## Sound is a language

The music isn't stored as notes: it's written in a language of its own, and
it can be read — and checked against the chip, frame by frame.

### A script interpreter

Stardust's sound isn't written as code at all: it's scripts run by a small
virtual machine. Bytes below 0x80 are notes; those valued 0x80 or above are
commands:

    e230: ld a,(bc) / cp 080h / jp c,0e231h   ; below 0x80 it isn't a command
          sub 080h / ld hl,0e7a3h / call 0e5c0h / jp (hl)

and `0xE5C0` is exactly "HL = table + A×2, HL = (HL)". The jump table at
0xE7A3 has fifteen entries, 0x80 to 0x8E, and dies right there: the limit is
set by the interpreter itself, whose call command reads the music's phrases
from 0xE7C1, which is 0xE7A3 + 15×2.

Right behind those fifteen command pointers come another twenty that look
like the same table continuing, and turn out to be another table entirely:
the music's phrases. Read as if they were a single table of 35 entries,
those twenty pointers send the disassembler off to read the game's melodies
as if they were routines. Told with figures in
[Open questions](OPEN-QUESTIONS.html).

That same table is also the first trap in tracing: left undeclared as data,
the tracer walks straight in and starts disassembling addresses as though
they were instructions.

### The game's sound is a language, and it can be read

Stardust doesn't store its music as loose notes at all: it carries an
interpreter with a language of its own, fifteen commands wide, and the
melodies are written straight in it. Commands are told apart from notes by
the top bit — 0x80 and up is an order, below is a note — and each one reads
straight off its own routine:

    0x80  volume           0x87  instrument
    0x81  tone/noise       0x88  noise
    0x82  loop             0x89  effect
    0x83  duration         0x8A  flags
    0x84  tie              0x8B  end
    0x85  tempo            0x8C  call phrase
    0x86  tempo to 1       0x8D  return
                           0x8E  transpose

Thirteen of the fifteen read off at a glance from their own routine. The
other two — 0x84 and 0x8E — take a bit more work to pin down.

0x8E doesn't store "a byte" anywhere, as it might first look: it's the
voice's transpose. It writes its argument into a three-byte table, one per
channel, and the note reader adds it to the note number before going to
look up the period:

    call ...            <- HL = this channel's entry
    add a,(hl)          <- add it to the note
    ld hl,0e6e3h        <- and look up the period with that

And 0x84 is settled by looking at where it returns to, not what it does.
The other fourteen commands return to the head of the command loop; this
one jumps further down, and what sits in between is exactly the attack of a
note: opening the mixer, setting up the instrument's envelope and zeroing
it. Which means 0x84 consumes a duration without re-attacking: whatever's
already sounding carries on exactly as it was, and only time passes. In
musical terms, that's a tie.

And since that last claim is interpretation, not just reading, it got
checked against the actual score. Walking the block of songs with the
interpreter's grammar — not counting loose bytes, which would confuse
arguments for commands — turns up nineteen 0x84s, and every single one has
this in front of it:

    after a note          9
    after another 0x84     5
    after 0x83 duration    4
    after 0x88 noise       1

Not one opens a block, and not one lands where nothing's sounding at all —
and five stacking up behind another 0x84 is exactly what you'd expect from
something that extends a note: they pile up to stretch it further.

And there's more: duration gets multiplied by tempo, and tempo is itself a
division. The duration command leaves `argument × tempo` in the counter,
and the tempo command computes `6000 / (argument × 8)` using a 16-bit
division routine that was sitting right there, unnamed, waiting to be
identified. So the score's durations aren't measured in frames at all:
they're in tempo units.

Two of the commands give away the MSX sound chip without needing to look
at anything else: the tone/noise one masks its argument with `and 9`, which
are exactly the two bits of the PSG's register 7, and the noise one masks
with `and 0x1F`, the five bits of the noise period. The code doesn't say
so in any comment, but the masks do.

And there are two commands that turn this into a genuine language: call and
return. The interpreter keeps the return address on a per-channel stack,
exactly the way a real processor would. So the songs don't repeat their own
bars: they call them. There are twenty phrases stashed separately, and the
songs simply invoke them by number. Same idea as the recursive dictionary
that compresses the level maps, applied to sound this time, by the same
people.

With the command table in hand, the music area walks through start to
finish without ever losing sync, and that's the best proof it's being read
correctly: if a single command's argument count were wrong, the walk would
desynchronise fast, and the blocks wouldn't end where they're supposed to.

What comes out of the walk is twenty-one sounds in total. Seventeen are
short, 9 to 31 bytes — the effects — and the long stretch at the end turns
out to be the music, split across three voices, as told just below. The
other two never actually end: they loop back and keep playing forever.

#### The music is one piece, in three voices

The routine that starts the music installs three scripts at once, one per
channel, not two separate songs as it might first look:

    channel 0   0xEB52   248 bytes, and repeats when done
    channel 1   0xEC4A   129 bytes, and repeats when done
    channel 2   0xECCB   points at an "end", so it comes in silent

They aren't separate songs at all: they're the three voices of the same
piece, sounding together. The first two even open with the same
transposition command, +2, which is what tunes them together from the very
first note.

Which explains, in passing, something that had been confusing: synthesising
the first script on its own produced just four low notes repeating over and
over. It wasn't that the music was thin — it was that only the bass line
was being heard, on its own, without the other two voices on top.

#### The songs don't contain a single note

And here's the best part of the whole thing. Decoded, the 378-byte song
turns out to be 152 phrase calls and zero notes of its own — not one. The
149-byte one is fifty-six calls and a single loose note. The melody isn't in
the songs at all: it's in the phrases, and the song is only the structure
that chains them together. Which is why 1,420 bytes are enough for the
entire soundtrack.

With the note table alongside, the harmony reads at a glance. Phrases 1, 4,
5 and 6 are four repeated notes — C3, A3, F3 and G3, the fundamentals — and
the long song opens by calling them in this order:

    1 1 4 4 1 1 4 4 5 5 6 6 1 1 1 1 1 1 4 4 ...

C, A, F, G, two bars per chord: that's the I–vi–IV–V progression, the same
one from fifties doo-wop, playing here in a 1987 shoot'em up. It uses
seventeen of the twenty available phrases.

There's also a 149-byte block, right behind the third voice: fifty-six
calls to just two phrases, and the one that repeats twenty-four times in a
row doesn't have a single note, so it's pure percussion through the noise
channel. It isn't one of the three voices — the third one starts a byte
earlier, and is a terminator — and who actually plays it still hasn't been
tracked down. It stays a block written in the interpreter's language with
no known owner, and "no owner" here is already a measurement, not a shrug:
the value 0xECCC doesn't appear once anywhere on the tape. The
control says the search is sound: 0xECCB does appear, exactly once, at
0xE181, precisely the instruction that hands it to channel 2, and its
neighbours 0xED61 and 0xED6B turn up too, loaded from 0xF4FE and 0xF506.
It's not reached by continuity either: the byte before it is a terminator,
and none of the twenty phrases point that high.

Said precisely, because it matters here: there's no literal reference to
it. A hand-built address — an `ld hl,0eccbh / inc hl` — would slip past
this search without anyone noticing, so the claim isn't that the block is
unreachable, only that nothing names it by address. The reasonable
suspicion, stated as exactly that, a suspicion: that this really was the
third voice, and the conversion switched it off by leaving the pointer one
byte short, sitting right on top of the terminator.

The note table, incidentally, checks itself: with the MSX sound chip's
clock, the first period gives 32.70 Hz, the theoretical C1, and of the 84
pairs sitting twelve positions apart, 76 come out at a ratio of 2.00 within
one per cent — the very definition of an octave. On the exact ratio the
count drops to 43 of 84, because the period is a whole number; the eight
that miss even that margin are the highest ones, where the period's
already down to two digits and rounding starts to bite. Eight full octaves,
C1 to B8.

There's no table ordering these sounds at all. Every place in the game that
wants something to play carries the address written out in full, and
there are 44 such calls scattered through the code; the most repeated one,
seven times over, is the same effect. Two of them point halfway into a
melody instead of at its start, which is a cheap way of getting variations
without spending another byte.

#### And then we checked it against the chip

Everything above is deduction, however solid it looks. Fifteen commands,
how many arguments each one eats, phrases called through a stack, a table
of ninety-six periods: all of it read out of raw bytes, and any one of
those could be a confident mistake. So it got taken to the hardware.

First up was how the sound actually reaches the chip, which turns out not
to be through the interpreter directly. The game keeps a copy of all eleven
sound registers in RAM, and spits the whole thing out on every interrupt,
fifty times a second:

    e5d0: ld a,000h / ld d,00bh    ; from register 0, and there are eleven
    e5d4: push af / ld c,(hl)
    e5d6: out (0a0h),a             ; which register
    e5d9: out (0a1h),a             ; and its value
    e5db: pop af / inc a / inc hl / dec d / jr nz

Measured for real, that's exactly what happens: across a whole capture
there's a single place writing to the sound port, and all eleven registers
get the same number of writes to the byte.

That detail matters when measuring. Since the registers come out in order,
the low byte of a note's period arrives before the high byte; rebuilding the
period on every single write glues a new low byte onto the *previous* note's
high byte half the time, and out come periods the game never asked for.
Counting only once the pair is complete, over clean music: 23 distinct
periods, 6,020 writes, and not one outside the table — 100.0%.

And then came the real test. The reading got run frame by frame and
checked against what the emulator actually saw enter the chip — frame by
frame and not note by note, because that's the only way to catch a
*duration* error, which a plain list of notes would swallow whole. Over the
ship stage's music:

    channel 0    746 hits, 1 miss
    channel 1    653 hits, 1 miss
    channel 2      0 hits, 1 miss    (silent, as the reading said)
    → 1,399 of 1,402 frames with sound, 99.8%

And the three misses are always frame zero of each channel: the tail of the
previous sound still sitting in the registers right as the new music comes
in. After that first frame, not one discrepancy.

The on-foot part checked out the same way, holding up for a whole minute:
5,852 of 5,886 frames, 99.4%, with the thirty-four misses all sitting right
next to a note change. Pointing the same tool at the *other* music in that
stage gives 0.0%, which is exactly the check that the earlier hit rate
wasn't a fluke.

Two things have to be right for this measurement. A frame doesn't last
exactly 1/50 of a second: a breakpoint on the ROM's
interrupt vector gives 1,003 firings in twenty seconds, that's 50.15 Hz,
and using 50.00 the comparison drifts almost two frames in six hundred and
drops to 98.2% over something that has nothing to do with the music at all.
And a silent channel isn't the same as a held note: the game only writes
the tone when it changes, so once the music stops the last period just sits
there — without also checking volume and the mixer, a channel that's been
silent for twenty seconds looks, to a naive measurement, like a single note
a thousand frames long.

#### The music drags while you play, and the game is to blame

The on-foot stage has two pieces of music, and checking the second one
turned up something better than a percentage. Its notes came out both
right and wrong on duration at once: where the score says a note lasts four
beats, the chip held it for six, seven, sometimes ten video frames, and
never the same number twice.

The interpreter isn't at fault here. A breakpoint on its entry shows it
gets called exactly three times per interrupt — once per channel — on both
screens:

    high-score screen   2,256 calls in 15 s  = 3 × 752
    inside the game      1,275 calls in 15 s  = 3 × 425

What actually changes is the interrupt rate. Those same fifteen seconds
bring 752 interrupts on the still screen and only 425 during play: 50.13 Hz
against 28.33. The game loses interrupts while it's busy drawing, and since
the music's clock *is* the interrupt, the exact same score plays 1.77 times
slower in the thick of the action than on the high-score table. The melody
drags whenever the screen's under load, and it's less a bug than something
the player was never meant to notice at all.

Which forces a different way of measuring, because no fixed rhythm can
follow that. A grid at 50.15 Hz scores the piece at 1.0%, sweeping every
rate between 50 and 17 Hz tops out at 5.1%, and the measured average of
28.33 Hz gives 4.9% — all three wrong for the same reason. Building the
grid out of the actual instants the interrupts really fired, that same
comparison comes back at 192 of 192 frames: 100.0%, not a single miss
across all three voices.

That piece, by the way, turns out not to be a soundtrack at all: its three
scripts end at 68, 60 and 64 beats — about two and a half seconds — and it
plays eight times across the recorded session, always in the middle of the
game. Scored over a full minute it drops to 5.2%, and not because it's
misread: it's that after two seconds the piece has already finished, and
what's left in those channels is gunfire.

The measurement settled one more thing on the way. The third voice comes in
silent, and the suspicion was that channel 2 was simply reserved for
effects. Only half true: of 271 effects fired in four minutes of play, 150
go to channel 2 — 55% — which is exactly why the music leaves it empty. But
63 go to channel 1 and 58 to channel 0, stepping right over the music.
It's not reserved; it's just the busiest of the three.

### The 754 bytes at 0xAB0E are artwork, not shared music

0xAB0E falls inside the range this project declares as sprites
(0xA560-0xBA20), and read with the sound interpreter's grammar, those 754
bytes don't hold up as a score at all: 306 of them are values above 0x7F
that don't exist as commands in a language whose orders only run 0x80 to
0x8E. Run that same count over 754 bytes of real music and it comes back at
seven. Whatever those bytes are — and the sprite range says artwork — they
aren't a score.

What the two halves do genuinely share, read straight off the binary with
nothing assumed, is the entire sound subsystem of the ship game,
relocated. The note table is the same 192 bytes to the byte, the routine
that blits the registers to the chip is the same eighteen instructions, and
all twenty phrase pointers sit at a constant offset from each other.

## The ending

The sequence the game closes with, read first from the listing and then
watched actually happening.

### How the game ends, and a pointer table that was coordinates

The sequence Stardust ends with is three things in a row, all chained from
the background's third opcode.

A tracking shot that accelerates. The camera rises one cell row sixteen
times, repainting each time, then enters a loop that moves it *A* times per
frame. That *A* isn't fixed: it starts at 2 and climbs by two every ten
frames, until it hits 16, where it stays.

    bdd3: ld a,002h / ld (0c468h),a
    bdf8: ld a,(0c468h) / cp 010h / jr z,...
    bdff: inc a / inc a / ld (0c468h),a

So the tower falls away below, faster and faster, until the scroll finally
runs out.

A starfield screen. Silence, colours, the buffer cleared, the 48 stars
pulled straight from the MSX ROM, a background picture, four long waits in
a row, and a brand new tune.

And an animation written as a script — here's the good part. At 0x61D8
there's a list the game walks like this: a byte above 0xC0 changes the
frame, doing it by patching the operand of the instruction that draws it; a
`0xC0` ends the list; and everything else comes in pairs of bytes that are
simply position.

Decoded in full, it's 78 steps and thirteen frames. The column starts at
0x78, the exact centre of the 192 pixels of width, and the row at 0xBA,
right at the bottom. The row always decreases, without a single exception
across all 78 steps, and the column drifts left until the very last step is
(0, 0). Something that lifts off from the centre, climbs, and recedes out
the corner.

That list is very easy to misread: read as little-endian words, the pairs
give 0x78BA, 0x78B8, 0x78B6… "words descending by two" that land right
inside the graphics range and look for all the world like they point there.
They point at nothing at all: what's descending by two is simply the
drawing climbing up the screen.

And it can be checked just by looking, which is the proof that actually
counts on this project: drawing those 720 bytes with the geometry the copy
routine states — 40 rows of 18 bytes — yields a real surface, not noise.
And laying the script's 78 steps over it shows exactly what it does: it
leaves the ground at the centre, climbs straight for a good stretch, and
near the top curves left until it exits the screen.

![The final scene's background, drawn from the tape](imagenes/escena_final.png)

![The same picture with the 78 steps of the script drawn over it](imagenes/escena_final_guion.png)

Neither one is a screenshot: both are drawn straight from the binary, using
the same geometry the game itself uses.

And the arithmetic closes it from both sides at once. The script ends at
0x6284; the scene's background picture starts at 0x6285 and measures 720
bytes — 40 rows of 18, exactly what the copy routine takes to the buffer's
middle band — and 0x6285 + 0x2D0 comes out to exactly 0x6555, precisely
where the stage's sprite pool begins. Three stretches sitting flush against
each other without a single byte to spare, and with that, three "tables"
that had been classified earlier by their entropy simply disappear: they
were pieces of the same script, cut in the wrong places.

#### The sequence, watched happening

Putting a breakpoint on every routine in the chain and replaying the
recorded game, the whole sequence turns up start to finish, with exact
timestamps:

    t=3060.95   the end-of-stage gate: scroll at the top, all six targets
                destroyed and the player in the middle band
    t=3060.95   the tracking shot
    t=3081.06   the starfield screen
    t=3083.49   the animation: 79 passes, and the script has 78 steps
    t=3107.67   the 200 particles, initialised
    t=3113.31   the explosion, 110 passes

The background's third opcode — the one that paints every cell in a single
pass — gets used right here, in the tracking shot, and that's its only use
in the entire game.

![The tracking shot: the tower repainted in one pass, ship lifting off](imagenes/final_travelling.png)

![The starfield screen: the flagship below and yours climbing away](imagenes/final_estrellas.png)

![The text, written over the scene](imagenes/final_felicidades.png)

![And the flagship turned into 200 particles](imagenes/final_metralla.png)

And the bad ending is this exact same one with everything stripped away. On
running out of lives — or on the countdown expiring — the game shows no
screen of its own at all: it jumps straight to the initial state, and from
there to the high-score table. No escape, no explosion, no text of any
kind; the bad ending is defined, literally, by everything it's missing.

![The bad ending: no escape, no explosion, straight to the scores](imagenes/final_malo.png)
