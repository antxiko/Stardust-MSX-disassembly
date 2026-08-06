# BUSCA LOS SEGUNDOS DEL REPLAY DONDE COINCIDEN EL DAMERO Y EL SCROLL.
#
# POR QUE. Para comparar la velocidad del damero (0xB48E) con la del fondo hacen
# falta los dos A LA VEZ: el damero solo dibuja en cuatro tramos del replay
# (dump/busca_damero/damero.txt) y el scroll solo se mueve cuando el jugador
# anda. En t=1870 habia damero pero el blitter de fondo estaba PARADO (0
# escrituras en 127 cuadros): eso no es partida, es la carga o la presentacion.
#
# COMO SE DETECTA EL SCROLL SIN MEDIR EL BUFFER. Con 0xACE9, que es la unica de
# las cuatro variables de 0xACE7-0xACF6 que NO avanza sola: clavada en 86 con el
# personaje quieto (t=2400, medido) y moviendose solo al andar (68-158 en
# t=2535-2545, medido). Se sondea cada 0,2 s emulados, que un cambio de scroll
# dura muchos cuadros y no se escapa.
#
# Y EL BLITTER DE FONDO, para distinguir "partida" de "carga/presentacion": un
# punto de ejecucion en 0xA9AD contado por segundo. Si esta a cero, lo que diga
# el damero no es de juego.
#
# Uso:  STARDUST_REPLAY=<ruta.omr> STARDUST_OUT=<dir> \
#       [STARDUST_T=<inicio>] [STARDUST_FIN=<final>] \
#           openmsx -machine Philips_VG_8020-20 -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
file mkdir $OUT
set LOG [open "$OUT/busca.log" w]
proc say {m} { global LOG; puts $LOG "\[emu [format %8.2f [machine_info time]]\] $m"; flush $LOG }

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }
array set st [reverse status]
set FIN [expr {[info exists ::env(STARDUST_FIN)] ? $::env(STARDUST_FIN) : $st(end)}]
say "replay cargado, llega hasta t=$st(end), se mira hasta t=$FIN"

if {[info exists ::env(STARDUST_T)]} {
    set r [catch {reverse goto $::env(STARDUST_T)} msg]
    say "reverse goto $::env(STARDUST_T) rc=$r: $msg"
}

set ::DAM 0
set ::BLIT 0
set ::VALS {}
debug set_bp 0xB493 {} { incr ::DAM }
debug set_bp 0xA9AD {} { incr ::BLIT }

proc sonda {} {
    lappend ::VALS [debug read memory 0xACE9]
    after time 0.2 sonda
}

set ::TL {}
proc tic {} {
    set u [lsort -unique -integer $::VALS]
    lappend ::TL [list [machine_info time] $::DAM $::BLIT [llength $u] [lindex $u 0] [lindex $u end]]
    set ::DAM 0 ; set ::BLIT 0 ; set ::VALS {}
    after time 1 tic
}

proc vuelca {} {
    global OUT
    set f [open "$OUT/scroll.txt" w]
    puts $f "# t | damero/s | blitter/s | valores distintos de 0xACE9 | min | max"
    foreach r $::TL {
        puts $f [format "%9.2f %7d %8d %3d %4d %4d" [lindex $r 0] [lindex $r 1] \
            [lindex $r 2] [lindex $r 3] [lindex $r 4] [lindex $r 5]]
    }
    close $f
}

set ::lat 0
proc latido {} {
    incr ::lat 30
    say "latido: $::lat s reales, t emulado [format %.1f [machine_info time]]"
    vuelca
    after realtime 30 latido
}

proc vigila {} {
    global FIN
    if {[machine_info time] >= $FIN - 1} {
        vuelca
        say "FIN"
        exit 0
    }
    after time 5 vigila
}

set throttle off
sonda
tic
vigila
after realtime 30 latido