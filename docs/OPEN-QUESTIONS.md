# Open questions

The seven criteria this disassembly set for itself are met: every byte on the
tape has an owner, all five blocks reassemble byte for byte, and the
listing's 335 routines have what they do written down, with the evidence.
None of that reads as a to-do list: this page sets out, precisely, **what
each figure means** and **what remains unknown about the game**.

## The open questions

- **The scene that closes zone 7.** The mechanism has been read byte by byte —
  two sprites descend and drag the ship off the screen — but what those two
  sprites actually draw has not been checked. It is precisely the scene that
  leads into the second tape load.
- **The 149 bytes at 0xECCC, with no owner.** A block written in the sound
  interpreter's language —56 calls to two phrases, looking like percussion—
  that **nothing points at**: the value 0xECCC does not appear once in the
  tape's three blocks, and no phrase reaches that high. The whole story, with
  its control, is in [Findings](FINDINGS.html#sound-is-a-language).
- **The sound engine carries a mode the game never uses.** The noise sweep can
  reload itself when it runs out, and that is switched on by a bit **neither
  score ever sets**: every argument of that command is 0, 1 or 2, never the 4 it
  would take. Dead code in both halves.
- **The noise-effect table is one byte short, in both halves**, and each half
  uses precisely the truncated entry. The missing byte is borrowed from the note
  table that starts right there, and it **is** copied — the loop is a fixed six —
  but it lands in a field that never gets used. What suggests the trim was
  deliberate is that the five surviving bytes in one half are the same as the
  complete entry in the other: two independent one-byte cuts, both in the only
  harmless spot. Suggesting is not proving.
- **The sound interpreter's 0x84 command**, which consumes a duration without
  re-attacking the note — it skips the attack section entirely. Reading that
  as a tie is the musical interpretation, and it fits where the command
  appears in the score, but it has not been proven against the chip the way
  the rest of the interpreter has.
- **How many distinct endings there are.** Both have been seen —finishing the
  game and running out of lives— but nobody has looked for whether the score
  or the scoreboard change anything else in the finale.

If you have an idea about any of that, or you want to look at it yourself,
everything needed is in the repository: the listings, the measuring tools and
the notes files where each finding gets recorded.

## What that 100% means, and what it doesn't

The byte budget says:

    TOTAL 93861 bytes, 93861 explicados (100.00%), 0 sin explicar

That means one very specific thing: **every byte on the tape has an owner**.
Either it is code the tracer genuinely reaches by following the flow, or it
falls inside a range declared with a name and an explanation of how that is
known.

What it does **not** mean is that the purpose of every byte is known. A range
can be bounded and measured without being understood, and confusing the two
would be selling smoke. No range on the tape is left unnamed today.

That no byte is misread as something it isn't is watched by
`tools/check_datos_como_codigo.py`, crossing every declared data zone against
what the tracer believes, hung off `make sanity` and the test suite.

## The routines, counted

A routine in this disassembly goes through three states, and they are worth
keeping apart:

1. **bounded**: the tracer knows where it starts and where it ends;
2. **named**: somebody has worked out what it is and given it a name;
3. **commented**: what it does is written down, and with what evidence.

The third one is the expensive one, and it stands here:

    ship stage       191 routines, 191 commented (100 %)
    on-foot stage    144 routines, 144 commented (100 %)
    ------------------------------------------------------
    total             335 routines, 335 commented (100 %)

So **0 are left**. The figure is measured by `tools/rutinas_comentadas.py`
and guarded by a test, so it cannot go stale here while the listing moves on.

**And that 100 % does not mean "finished" either**, no more than the one about
bytes does. It means every routine has what it does written down, and with what
evidence. It does not mean everything has been checked while running: a handful
rest on reading the listing, and they say so where they do.

A routine counts as one when its label is the target of at least one `call`, or
when it is declared as an entry point. Jump targets do not count: they are
loops inside another routine, not headers.

`tools/check_interiores.py` tells the two apart with a simple rule: if a point
can be fallen into from the instruction above, it isn't a head. It runs in the
Makefile, and the test that guards the routine count uses it.

## What the tracer doesn't reach

The budget measures bytes; coverage measures something else. Of the code in the
two big blocks, the tracer reaches this:

    ship game        23.0 %
    on-foot part      28.6 %

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

**All four are resolved, and none is left pending.** The one at 0xE230 is the
sound script interpreter's dispatcher, and its table of fifteen pointers is
read from the binary. The other three —0xCB99 and 0xD6B8 in the ship part,
0xC544 in the one on foot— are resolved by playing with the emulator open and
noting the destination each time the jump executes, because the structures
carrying those pointers arrive all 0xFF on the tape and are filled in while
playing.

A fifth point, at 0x984D, isn't a jump: it is an `0xE9` inside a drawing.

```
9840  A5 AA AA 17 55 69 55 0E
9848  A5 AA AA 17 55 E9 50 0B      <- that E9
```

## What hasn't been checked

- **How many distinct endings there are**, said above: nobody has looked for
  whether the score or the scoreboard change anything in the finale.
- The cross-check against the ZX Spectrum version can say nothing about the
  second part: the snapshot it compares against was captured in the first
  part's menu, so the original's on-foot stage simply isn't in it.
- **All 335 routines having a comment does not mean all of them have been
  checked running.** A few rest on reading the listing alone, and where that is
  so it is said.

## Why it is published like this

Because a disassembly that says clearly where every claim stands —and what kind
of evidence it hangs from— is useful, and one that pretends to know more than
it does is worse than nothing: it sends whoever comes next looking in the wrong
place.

The criterion across the whole series is that every claim can be checked
against the binary. That includes claims about what is **not** known: which is
why the coverage figures come out of the tracer rather than out of an
impression.
