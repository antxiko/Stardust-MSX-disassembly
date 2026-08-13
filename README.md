# Stardust (Topo Soft, 1987, MSX) — a commented disassembly

A 1987 cassette tape, taken apart block by block. All **93,861 bytes** on it are
bounded and owned, and inside it is **a ZX Spectrum conversion that brought
the tape system across with it**.

✅ **The disassembly is finished**: every byte on the tape has an owner, all
five blocks reassemble byte for byte, and the listing's **335 routines** are
commented, evidence included. "Finished" does not mean exhausted: the questions
still open, figures and all, are on
[the open-questions page](https://antxiko.github.io/Stardust-MSX-disassembly/OPEN-QUESTIONS.html).

📖 **[Full documentation](https://antxiko.github.io/Stardust-MSX-disassembly/)**
· [En castellano](https://antxiko.github.io/Stardust-MSX-disassembly/es/)
· [README en castellano](README.es.md)

---

## What this is

*Stardust* is a vertical shoot'em up Topo Soft published for the MSX in 1987.
This repository holds the code of its five blocks, commented, along with the
tools to rebuild and verify it.

What makes this one different from the rest of the label's output: **it is a
conversion, and it shows in places you wouldn't look**. Topo Soft's other MSX
titles record in KCS blocks, the MSX's own tape format. Stardust uses **ZX
Spectrum blocks**, with their `[flag][data][XOR]`, and its loader is a
**reimplementation of LD-BYTES**, the Spectrum ROM's load routine, with the same
register interface. Before anything else it maps RAM into pages 1 and 2, to get
the flat 48K of RAM the Spectrum has as standard and the MSX does not.

And it is **multiload**: zones 1 to 7 are played flying a ship and, once the
last one is cleared, the game goes back to the tape for a second part where the
character continues on foot. Two different programs on one cassette.

## How you know this is true

`make` extracts the blocks from the tape, generates the listings and requires
that rebuilding them gives back exactly the original:

```
topo    4254 B   OK: reproducible byte a byte
loader   351 B   OK: reproducible byte a byte
pre    12468 B   OK: reproducible byte a byte
juego  46663 B   OK: reproducible byte a byte
parte2 29861 B   OK: reproducible byte a byte

TOTAL 93861 bytes, 93861 explicados (100.00%), 0 sin explicar
```

There is also a **budget**, which is a different check: every byte must be
either code the tracer genuinely reaches, or a data range with a name and an
explanation. It exists because reproducibility cannot see misinterpretation — if
graphics were marked as code, the bytes would still come out identical and only
the listing would lie.

And that danger is real, not theoretical: `tools/check_datos_como_codigo.py`
crosses every declared data zone against what the tracer believes, precisely
because contamination like that can inflate coverage from 25% to 75.8% in one
go — the tracer wandered into the colour tables and the level data — and
look like a triumph. It's written up on the how-it-was-done page.

And **17 tests**, dedicated to checking that what the documentation says is what
the game does.

## Getting started

```sh
make          # extract, generate the listings and verify everything
make test     # tests only
make web      # rebuild the site in docs/
```

You need `pasmo`, `z80dasm` and Python 3. For the screenshots, `openmsx`.

**The tape is not distributed** with this repository, only the documentation
work (see [LEGAL-NOTICE.md](LEGAL-NOTICE.md)). To rebuild everything you need your
own copy, named `stardust.tsx` in the root, with this sha256:

```
8f4fb3840e5ad043d8d694faeaa86a6e4a5cd2cabe5dd99fec08e5cf0a7dbb13
```

## What lives where

| | |
|---|---|
| `src/stardust_juego.asm` | the ship game, zones 1 to 7 |
| `src/stardust_parte2.asm` | the second part, on foot |
| `src/stardust_pre.asm` | the screen you look at while it loads |
| `src/stardust_loader.asm` | the turbo loader |
| `src/stardust_topo.asm` | the publisher's animated logo |
| `src/*.notes` | the annotations the listings are generated from |
| `src/*.nocode` | the zones that are NOT code, and how that is known |
| `tools/coteja_spectrum.py` | cross-checks this binary against the Spectrum one |
| `tools/render_graficos.py` | draws tiles, sprites and charset from the tape |
| `docs/` | the documentation and the website |

Note that the source listings and their comments are written in Spanish; the
documentation site is available in both languages.

## On other people's work

Part of this disassembly leans on the **ZX Spectrum disassembly published by the
game's original authors**, and that is set out in detail in
[LEGAL-NOTICE.md](LEGAL-NOTICE.md). The rule followed has been to take none of
their labels on trust: only those for stretches that appear **identical byte for
byte** in both binaries are adopted, because the MSX version was made by other
people and their names are a hypothesis until the bytes confirm them.

## Credits

*Stardust* belongs to Topo Soft and to its authors; this is preservation and
study work. This version's loading screen is signed **CANO**. See
[LEGAL-NOTICE.md](LEGAL-NOTICE.md).
