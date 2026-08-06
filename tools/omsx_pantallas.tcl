# Muestrea una grabacion corta hecha a mano para cazar las pantallas que una
# partida normal no toca: menu, redefinir teclas, demo, fin de partida, entrada
# de record y el scroll de la tabla.
#
# Se diferencia de omsx_replay.tcl en que aqui NO hay que separar por ventanas:
# la grabacion arranca de un savestate en mitad de la parte de naves y no llega
# a la multicarga, asi que el bloque del juego es el dueno de la memoria todo el
# rato. En la partida completa eso no vale, porque conviven cinco programas en
# las mismas direcciones.
#
# Ademas se vuelca la RAM al final, que es donde queda la tabla de teclas ya
# redefinida por quien jugo.
#
# Uso:  STARDUST_REPLAY=... STARDUST_OUT=... openmsx -machine <maq> -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
file mkdir $OUT

set L [open "$OUT/pantallas.log" w]
proc say {m} { global L; puts $L "\[[format %8.2f [machine_info time]]\] $m"; flush $L }

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }

array set st [reverse status]
set FIN $st(end)
say "grabacion de $st(begin) a $FIN"

set ::pcs [dict create]
proc muestrea {} { dict incr ::pcs [format "%04X" [reg PC]] ; after time 0.001 muestrea }

set ::dest [dict create]
proc anota {d} { dict incr ::dest [format "%s -> %04X (ix=%04X)" $d [reg HL] [reg IX]] }
debug set_bp 0xCB99 {} { anota CB99 }
debug set_bp 0xD6B8 {} { anota D6B8 }
debug set_bp 0xE230 {} { anota E230 }

set throttle off
muestrea

proc vuelca {} {
    global OUT
    set f [open "$OUT/pantallas_pcs.txt" w]
    foreach k [lsort [dict keys $::pcs]] { puts $f "$k [dict get $::pcs $k]" }
    close $f
    set f [open "$OUT/pantallas_destinos.txt" w]
    foreach k [lsort [dict keys $::dest]] { puts $f "$k [dict get $::dest $k]" }
    close $f
    say "volcados [dict size $::pcs] PCs y [dict size $::dest] destinos"
}

proc vigila {} {
    global FIN OUT
    if {[machine_info time] >= $FIN - 1} {
        say "fin de la grabacion"
        vuelca
        # La RAM del final: ahi esta la tabla de teclas ya redefinida.
        set f [open "$OUT/ram_final.bin" w]
        fconfigure $f -translation binary
        for {set a 0x4000} {$a <= 0xFFFF} {incr a} {
            puts -nonewline $f [binary format c [debug read memory $a]]
        }
        close $f
        say "volcada la RAM de 0x4000 a 0xFFFF"
        exit 0
    }
    vuelca
    after time 60 vigila
}
after time 60 vigila
