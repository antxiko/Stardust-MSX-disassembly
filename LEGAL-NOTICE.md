# Legal and attribution notice

*(También disponible [en castellano](AVISO-LEGAL.md).)*

## Who owns what

**The game is not ours.** *Stardust* (1987) was published by **Topo Soft**. All
rights in the game remain with their holders.

By the game's own credits screen, read straight out of the binary, the MSX
conversion is by **Carlos Arias**, the graphics are by **Juan Carlos and Javier
Arévalo** —along with **Julio Martín**—, the music is by **Gominolas**, and the
whole thing is based on an original idea by **José Manuel Muñoz**. The loading
screen is signed **Cano**.

**What is ours** are the tools in this repository, the comments in the listings,
the analysis and the documentation. That is published under the licence in
`LICENSE`.

## What this repository contains

The `src/*.asm` files are the commented disassembly of the tape's blocks. They
are published for the **preservation, study and documentation** of a title that
is part of the history of Spanish software, and that is not on sale through any
channel today.

The tape image (`.tsx`) is **not** distributed here.

The images in `docs/` are not screenshots taken from the game: they are
generated from the binary's own data using the repository's tools, as part of
demonstrating that the format is properly understood.

## Third-party work this leans on

This disassembly uses, and must say so plainly, work by other people.

**The ZX Spectrum disassembly**, published by the game's original authors at
<https://github.com/TheJare/stardust-48k> with the permission of all of them.

A warning about it, which has been paid for the hard way. Those authors say in
their own README that the MSX version **was done by other people** ("we
originally ported it to the Amstrad CPC, while other people did the MSX, C-64
and eventual PC versions") — and the credits screen of this very binary confirms
it by name. So their labels are a *hypothesis* about this binary, never a fact.

The rule was meant to be that one of their labels is only adopted when the
corresponding stretch appears **byte-for-byte identical** in both binaries. The
tool that checked this, `tools/coteja_spectrum.py`, turned out to be unsound: it
located each section by searching for its first 32 bytes and taking the **first**
match, without requiring that the match be unique or that the resulting offset
agree with the rest. Because both versions share the artwork, those needles
landed inside the tileset, and a batch of routine names ended up attached to
addresses that hold graphics.

**What came from that cross-check has been removed**, and nothing from it will
come back until the search is fixed. That took two passes: the entry points
first, and later 28 data ranges that had survived in another file still carrying
their Spectrum names —"Starfield vertical positions", "Keyboard map", "High
Score table", and one called "Split text to prevent bug in SkoolKit", after the
Spectrum's own disassembly tool. All of them sat inside ranges this project had
already identified as artwork.

One thing is kept from that batch, and not because of where it came from: the
addresses of the seven zone maps, which have since been verified here by
expanding them —each one yields a valid compressed stream of exactly 450 tile
indices. What is published now rests only on the MSX binary and on the
emulator. There is a
check, `tools/check_entradas.py`, that refuses any entry point falling inside a
range declared as data, which is exactly the shape that error took.

**The loader published in issue 19 of the magazine *Input MSX***, whose three
POKEs are quoted in the documentation. They have been verified against this
binary and applied in the emulator.

**A full playthrough recorded by Araubi** (openMSX replay, 2021), which is what
made it possible to trace the code behind the screens a scripted run never
reaches.

## If you are one of the authors

If you worked on *Stardust*, or you hold rights in the game, and you would
rather this material were not published, **say so and it comes down without
argument**. The intent of this work is the exact opposite of harming you: it is
to put on record how it was built.
