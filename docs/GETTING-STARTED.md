# Getting started

## What you need

`pasmo` and `z80dasm` to assemble and disassemble, and Python 3 for the
tools. And for screenshots, and for the harnesses that pull data out of the
running game, `openmsx`.

The tape isn't distributed with this repository, only the documentation
work. So you'll need your own copy, named `stardust.tsx` in the root of the
project, and it has to give this sha256:

    8f4fb3840e5ad043d8d694faeaa86a6e4a5cd2cabe5dd99fec08e5cf0a7dbb13

## The commands

```sh
make          # extracts the blocks, generates the listings and checks everything
make test     # the tests only
make web      # rebuilds the site under docs/
```

`make` on its own runs the whole cycle, and it fails if anything doesn't
add up: if a listing stops reproducing its block byte for byte, if the
tracer wanders into a data zone, if an entry point sits inside a range
declared as data, or if a single byte of the tape is left unaccounted for.

## Without the tape

You can still read the listings in `src/` and the notes, which is where the
work actually lives. And the tests that don't depend on the binary pass all
the same, needing nothing else: a handful of them just do arithmetic on the
published figures.

## How it is laid out

Each block on the tape has three files that govern its disassembly:

| | |
|---|---|
| `src/X.entries` | the entry points: where tracing starts |
| `src/X.nocode` | the zones that are NOT code, and how that is known |
| `src/X.notes` | the annotations, and the data ranges with their explanation |

Those produce the `src/stardust_X.asm` files, and those never get touched
by hand: they're generated. If you want to change a comment, it goes in the
`.notes` file instead.

That separation is exactly what keeps the listing and its verification
from drifting apart over time: the file that gets published is the same
one that gets checked.

### How the data blocks are laid out

Every data range declared in the notes comes out as a block of its own: its own
heading saying what it is for, its own label, and the dump aligned to its first
byte, so where one table ends and the next begins is visible at a glance. An
optional line gives the block the row width of its real structure: the 59
characters of the charset eight bytes at a time -one glyph per row-, the level
tiles four -one row of a 32x32 tile-, the sentinels three, the final scene's
picture eighteen (its own row length), the instrument table fifteen bytes per
instrument, and the tables of counter-plus-records with the counter alone on the
first row. Tables of pointers come out as `defw`, with the destination named
next to them where it has a name.

## The tools you'll reach for most

| | |
|---|---|
| `tools/perfil.py` | X-rays a binary and says where the nature of the data changes |
| `tools/clasifica_huecos.py` | classifies a range by measuring it, and says which measurement the label came from |
| `tools/check_entradas.py` | refuses any entry point that falls inside a range declared as data |
| `tools/coteja_spectrum.py` | cross-checks this binary against the Spectrum version's |
| `tools/render_graficos.py` | draws tiles, sprites and charset straight from the tape |
| `tools/omsx_*.tcl` | openMSX harnesses: they pull out of the running game what the binary won't say |
| `tools/omsx_replay.tcl` | replays a recorded playthrough and samples the program counter |

## If you want to pull on a thread

No bytes are left unowned, and no routines uncommented — but there are
still loose ends, like the 149 bytes of music nothing names, or the noise
mode no score ever switches on. They're counted, figures and all, in
[Open questions](OPEN-QUESTIONS.html), and everything needed to look into
them is right there in the repository.
