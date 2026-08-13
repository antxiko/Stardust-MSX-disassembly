# Open questions

The seven criteria this disassembly set for itself are met: every byte on
the tape has an owner, all five blocks reassemble byte for byte, and the
listing's 335 routines have what they do written down, with the evidence.
That doesn't turn it into a checked-off to-do list, though — this page sets
out exactly what each figure means, and what's still left to learn about
the game itself.

## The open questions

The scene that closes zone 7 is read byte by byte — two sprites descend and
drag the ship off the screen — but nobody has checked what those two
sprites actually draw. It's exactly the scene that leads into the second
tape load, so it would be worth a look.

There are also 149 bytes at 0xECCC with no owner at all. It's a block
written in the sound interpreter's language, looking like percussion — 56
calls to two phrases — but nothing points at it: the value 0xECCC doesn't
appear once in the tape's three blocks, and no phrase reaches that high.
The whole story, with its control, is in
[Findings](FINDINGS.html#sound-is-a-language).

The sound engine, for its part, carries a mode the game never actually
uses: the noise sweep can reload itself once it runs out, and that gets
switched on by a bit neither score ever sets. Every argument of that
command comes out 0, 1 or 2, never the 4 it would take. Dead code in both
halves of the game.

And the noise-effect table is one byte short, in both halves, with each
half using precisely the truncated entry. The missing byte gets borrowed
from the note table that starts right there next to it, and it is copied —
the loop's a fixed six — but it lands in a field that never gets read. What
suggests the trim was deliberate is a curious detail: the five surviving
bytes in one half are the same as the complete entry in the other, as if
two independent one-byte cuts happened, both in the one spot where it's
harmless. Suggesting isn't proving, of course.

The sound interpreter's 0x84 command consumes a duration without
re-attacking the note, skipping the whole attack section. Reading that as a
tie is the musical interpretation, and it fits where the command shows up
in the score, but it still hasn't been proven against the chip the way the
rest of the interpreter has.

And one last question remains: how many distinct endings there are. Both
have been seen — finishing the game and running out of lives — but nobody
has looked for whether the score or the scoreboard change anything else in
the finale.

If you've got an idea about any of this, or fancy looking into it yourself,
everything needed is right there in the repository: the listings, the
measuring tools, and the notes files where every finding gets recorded.

## What that 100% means, and what it doesn't

The byte budget says:

    TOTAL 93861 bytes, 93861 explicados (100.00%), 0 sin explicar

And that means one very specific thing: every byte on the tape has an
owner. Either it's code the tracer genuinely reaches by following the
flow, or it falls inside a range declared with a name and an explanation of
how that's known.

What it doesn't mean is that every byte's purpose is understood. A range
can be bounded and measured without being understood, and confusing the two
would be selling smoke. That said, no range on the tape is left unnamed
today.

And that no byte gets misread as something it isn't is watched by
`tools/check_datos_como_codigo.py`, crossing every declared data zone
against what the tracer believes — it hangs off `make sanity` and the test
suite.

## The routines, counted

A routine in this disassembly goes through three states, and they're worth
keeping apart: bounded, when the tracer knows where it starts and ends;
named, when somebody's worked out what it is and given it a name; and
commented, when what it does is written down, evidence included.

That third state is the expensive one, and today it stands here:

    ship stage       191 routines, 191 commented (100 %)
    on-foot stage    144 routines, 144 commented (100 %)
    ------------------------------------------------------
    total             335 routines, 335 commented (100 %)

So **0 are left**. The figure is measured by `tools/rutinas_comentadas.py`,
and a test watches it so it can't go stale while the listing keeps moving.

And that 100% doesn't mean "finished" either, no more than the one about
bytes does: it means every routine has what it does written down, with
evidence, but not that everything's been checked while actually running. A
handful rest on reading the listing alone, and they're marked as such
wherever that's the case.

A routine counts as one when its label is the target of at least one
`call`, or when it's declared as an entry point — jump targets don't count,
since they're almost always loops inside another routine, not new headers.
`tools/check_interiores.py` tells the two apart with a simple rule: if a
point can be fallen into from the instruction above, it isn't a head. It
runs in the Makefile, and the test guarding the routine count leans on it.

## What the tracer doesn't reach

The budget measures bytes; coverage measures something else entirely. Of
the code in the two big blocks, the tracer reaches this:

    ship game        23.0 %
    on-foot part      28.6 %

The rest is data, yes, but there's also code that isn't arrived at by
following the flow: routines only entered through computed jumps, through
tables, or through pointers filled in while playing. Some are known to
exist because the emulator caught them running; others simply aren't known
at all yet.

The precise measure of that blindness is the indirect jumps: a `jp (hl)`
whose destination isn't written in the binary but sits in a register, so
the tracer just stops, unable to know where it goes. There are four, three
in the ship part and one in the one on foot, and they're listed right in
the trace itself:

```sh
python3 -c "import json;print(json.load(open('work/juego.trace.json'))['blind'])"
```

And all four are resolved: none is left pending. The one at 0xE230 is the
sound script interpreter's dispatcher, and its table of fifteen pointers
reads straight off the binary. The other three — 0xCB99 and 0xD6B8 in the
ship part, 0xC544 in the one on foot — get resolved a different way,
playing with the emulator open and noting the destination every time the
jump fires, because the structures carrying those pointers arrive all 0xFF
on the tape and only get filled in while playing.

And a fifth point, at 0x984D, isn't a jump at all: it's an `0xE9` sitting
inside a drawing.

```
9840  A5 AA AA 17 55 69 55 0E
9848  A5 AA AA 17 55 E9 50 0B      <- that E9
```

## What hasn't been checked

How many distinct endings there are still isn't known, as said above:
nobody's looked for whether the score or the scoreboard change anything
else in the finale. The cross-check against the Spectrum version can't say
anything about the second part either, because the snapshot it compares
against was captured in the first part's menu, so the original's on-foot
stage isn't even in there. And all 335 routines having a comment doesn't
mean every one of them has been checked running: a few rest on reading the
listing alone, and where that's the case, it's said.

## Why it is published like this

Because a disassembly that says clearly where every claim stands — and what
kind of evidence it hangs from — is genuinely useful, while one that
pretends to know more than it does is worse than nothing: it sends whoever
comes next looking in the wrong place.

The criterion across the whole series is the same one: every claim has to
be checkable against the binary, including claims about what still isn't
known. Which is why the coverage figures always come straight out of the
tracer, never out of an impression.
