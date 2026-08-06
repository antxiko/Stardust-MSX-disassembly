# BUSCA EN QUE MOMENTOS DEL REPLAY ESTA ACTIVO EL DAMERO (0xB48E).
#
# POR QUE. El fondo de tiles de la fase de a pie es UN solo plano: medido en
# t=2511 y t=2535, las 18 tiras (3 bandas x 6 columnas) se desplazan igual, +2
# filas por cuadro con el 100 % de igualdad exacta (tools/omsx_filas.tcl). Si
# hay un segundo plano, es el unico escritor que queda: la rutina 0xB48E, que
# pinta 16 filas en damero SOLO en la banda C y lee de 0x6120-0x617F. En los
# dos momentos medidos estaba PARADA (0 escrituras en 154 cuadros), asi que
# para medirla contra el scroll hay que encontrar cuando dibuja.
#
# COMO. Un punto de interrupcion de EJECUCION en 0xB493 (su primer ld (hl),a),
# que los de ejecucion no congelan nunca, y un contador por segundo emulado.
# De paso se cuentan los cuadros (0xD383) para tener la referencia.
#
# Uso:  STARDUST_REPLAY=<ruta.omr> STARDUST_OUT=<dir> \
#       [STARDUST_T=<segundo inicial>] \
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
set FIN $st(end)
say "replay cargado, llega hasta t=$FIN"

if {[info exists ::env(STARDUST_T)]} {
    set r [catch {reverse goto $::env(STARDUST_T)} msg]
    say "reverse goto $::env(STARDUST_T) rc=$r: $msg"
}

set ::DAM 0
set ::CUAD 0
set ::TL {}
debug set_bp 0xB493 {} { incr ::DAM }
debug set_bp 0xD383 {} { incr ::CUAD }

proc tic {} {
    lappend ::TL [list [machine_info time] $::DAM $::CUAD]
    set ::DAM 0 ; set ::CUAD 0
    after time 1 tic
}

proc vuelca {} {
    global OUT
    set f [open "$OUT/damero.txt" w]
    puts $f "# t emulado | escrituras del damero (bp 0xB493) | cuadros (bp 0xD383)"
    foreach r $::TL {
        puts $f [format "%9.2f %7d %5d" [lindex $r 0] [lindex $r 1] [lindex $r 2]]
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
        say "FIN del replay"
        exit 0
    }
    after time 5 vigila
}

set throttle off
tic
vigila
after realtime 30 latido