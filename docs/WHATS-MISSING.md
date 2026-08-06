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

**4896 bytes, 5.2% of the tape**, are declared as "unclassified data". For each
one we know where it starts, where it ends and what it measures —average run of
equal bits, entropy, and how many distinct values it uses— but not what it is or
what it is used for.

Most of those arrived here from the other direction: they were listed as **code**
in the first published version of this page, and were only traced because the
tracer had been seeded with entry points that fell inside the graphics. Once
those were removed, the bytes were left ownerless. Before labelling them, the
program counter of a real 900-second playthrough was sampled: **25 of those 26
ranges did not execute even once**, and the only one the counter fell into was
at the two system hook addresses, which the game overwrites on startup. So they
are not "code we can't reach"; but neither is it known what they are.

They are spread across small ranges inside the two big blocks. You can list them
with:

```sh
grep "datos sin clasificar" src/juego.notes src/parte2.notes
```

and measure them again with `tools/clasifica_huecos.py`, which is where their
classification came from.

## What is left to trace

The budget measures bytes; coverage measures something else. Of the code in the
two big blocks, the tracer reaches this:

    ship game        25.9 %
    on-foot part     51.3 %

The rest is data, yes, but there is also **code that isn't arrived at by
following the flow**: routines entered only through computed jumps, through
tables, or through pointers filled in while playing. Some are known to exist
because the emulator caught them running; others aren't known at all.

The precise measure of that blindness is the **indirect jumps**: `jp (hl)`,
where the destination isn't written in the binary but sits in a register, and
the tracer stops because it cannot know where it goes. There are **five**, three
in the ship part and two in the one on foot, and they are listed in the trace
itself:

```sh
python3 -c "import json;print(json.load(open('work/juego.trace.json'))['blind'])"
```

Of the five, **four are resolved**. The one at 0xE230 is the script
interpreter's dispatcher, and its table of 35 pointers is read from the binary.
The other three —0xCB99 and 0xD6B8 in the ship part, 0xC544 in the one on foot—
were not resolved by reading code but by playing with the emulator open and
noting the destination each time the jump executed, because the structures
carrying those pointers arrive all 0xFF on the tape and are filled in while
playing.

**One is unresolved**: the one at 0xC544's neighbour, 0x984D, in the second
part, which **never fired** — not in the 300 seconds it was first given, and not
in a complete 38-minute playthrough either. It isn't even confirmed to be used.

## What hasn't been checked

- The second part has been seen to start and run, and now to be played through,
  but the code behind its later screens is still thin.
- The cross-check against the ZX Spectrum version has been withdrawn entirely.
  The tool that produced it located sections by their first 32 bytes and kept
  the first match, without demanding a unique match or a consistent offset.
- The listings' comments cover the main routines and the data zones, but **most
  routines still have no comment explaining what they do**. They have a name and
  they are bounded; that isn't the same thing.

## Why it is published like this

Because a half-done disassembly that says clearly where it stands is useful, and
one that pretends to be complete is worse than nothing: it sends whoever comes
next looking in the wrong place.

The criterion across the whole series is that every claim can be checked against
the binary. That includes claims about what is **not** known: which is why the
4896 bytes are bounded one by one instead of swept under the carpet, and why the
coverage figures come out of the tracer rather than out of an impression.

## What is being worked on now

This isn't parked. The open lines, in order of what would pay off most:

- **More hand-played sessions.** The screens no harness reaches —game over,
  the high-score entry, the demo, the menu and redefine keys— have now been
  visited in a recorded session, and that yielded 22 routines and the key
  table. What is left to visit the same way is the second part, on foot.
- **The unclassified bytes.** The cross-check route is closed until the search
  is fixed to demand a unique match and a consistent offset.
- **The indirect jump at 0x984D**, still unfired and with no known destination.
- **Commenting the routines** one by one. They are bounded and named; what they
  do is still to be written down.

If you have an idea about any of that, or you want to look at it yourself,
everything needed is in the repository: the listings, the measuring tools and
the notes files where each finding gets recorded.

When those 4896 bytes are identified, this page will get shorter.
