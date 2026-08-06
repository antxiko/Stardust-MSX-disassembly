# Getting started

## What you need

`pasmo` and `z80dasm` to assemble and disassemble, and Python 3 for the tools.
For screenshots and for the harnesses that pull data out of the running game,
`openmsx`.

**The tape is not distributed** with this repository — only the documentation
work. You need your own copy, named `stardust.tsx` in the root of the project,
and it has to give this sha256:

    8f4fb3840e5ad043d8d694faeaa86a6e4a5cd2cabe5dd99fec08e5cf0a7dbb13

## The commands

```sh
make          # extracts the blocks, generates the listings and checks everything
make test     # the tests only
make web      # rebuilds the site under docs/
```

`make` on its own runs the whole cycle and **fails if anything doesn't add up**:
if a listing stops reproducing its block byte for byte, if the tracer wanders
into a data zone, if an entry point sits inside a range declared as data, or if
a single byte of the tape is left unaccounted for.

## Without the tape

You can read the listings in `src/` and the notes, which is where the work is.
And the tests that don't depend on the binary pass all the same: several of them
just do arithmetic on the published figures and run with nothing else.

## How it is laid out

Each block on the tape has three files that govern its disassembly:

| | |
|---|---|
| `src/X.entries` | the entry points: where tracing starts |
| `src/X.nocode` | the zones that are NOT code, and how that is known |
| `src/X.notes` | the annotations, and the data ranges with their explanation |

Those produce the `src/stardust_X.asm` files, which are **never edited by
hand**: they are generated. If you want to change a comment, it goes in the
`.notes`.

That separation is what keeps the listing and its verification from drifting
apart: the file that gets published is the file that gets checked.

## The tools you'll reach for most

| | |
|---|---|
| `tools/perfil.py` | X-rays a binary and says where the nature of the data changes |
| `tools/clasifica_huecos.py` | classifies a range by measuring it, and says which measurement the label came from |
| `tools/check_entradas.py` | refuses any entry point that falls inside a range declared as data |
| `tools/render_graficos.py` | draws tiles, sprites and charset straight from the tape |
| `tools/omsx_*.tcl` | openMSX harnesses: they pull out of the running game what the binary won't say |
| `tools/omsx_replay.tcl` | replays a recorded playthrough and samples the program counter |

## If you want to pull on a thread

What's missing is set out with figures in [What's missing](WHATS-MISSING.html).
The two lines where most ground can be gained right now are the 4896
unidentified bytes and the routines of the second part, which has barely been
played.
