# VUELCA LO QUE IMPRIME EL ROTULADOR DEL MARCO (L_D252) EN UN TRAMO DEL REPLAY.
#
# L_D252 (0xD252) es el impresor de HUD de la fase de a pie: escribe DIRECTO a
# la VRAM del marco con la fuente ASCII de 0x5F00 (ver src/parte2.notes). Se
# cazo actualizando glifos en los ultimos 20 s de la partida y es el candidato
# a la CUENTA ATRAS de las torretas. Este guion apunta cada llamada: el reloj,
# el caracter en A y, si A es el codigo de control 1 (posicionar), el parametro
# que va a leer de (IX).
#
# El bp va en 0xD252, que es donde EMPIEZA la rutina (un bp en mitad de una
# instruccion no salta nunca, ya se pago).
#
# Uso:  STARDUST_REPLAY=<ruta.omr> STARDUST_OUT=<dir> STARDUST_T=<segundo> \
#       [STARDUST_DUR=<segundos emulados>] \
#           openmsx -machine Philips_VG_8020-20 -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
set T $::env(STARDUST_T)
set DUR [expr {[info exists ::env(STARDUST_DUR)] ? $::env(STARDUST_DUR) : 104}]
file mkdir $OUT
set LOG [open "$OUT/marco.log" w]
proc say {m} { global LOG; puts $LOG "\[emu [format %8.2f [machine_info time]]\] $m"; flush $LOG }

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }
set r [catch {reverse goto $T} msg]
say "reverse goto $T rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }

set ::N 0
set ::LL {}
debug set_bp 0xD252 {} {
    set a [expr {[reg AF] >> 8}]
    if {$a == 1} {
        lappend ::LL [list [machine_info time] $a [debug read memory [reg IX]]]
    } else {
        lappend ::LL [list [machine_info time] $a -1]
    }
    incr ::N
}

proc vuelca {} {
    global OUT
    set f [open "$OUT/marco.txt" w]
    puts $f "# t | codigo (hex) | caracter o control | parametro si posicionar"
    foreach r $::LL {
        set a [lindex $r 1]
        set p [lindex $r 2]
        if {$a >= 32 && $a < 127} { set txt [format %c $a] } else { set txt [format "ctrl%02X" $a] }
        if {$p >= 0} {
            puts $f [format "%9.3f %02X %s param=%02X" [lindex $r 0] $a $txt $p]
        } else {
            puts $f [format "%9.3f %02X %s" [lindex $r 0] $a $txt]
        }
    }
    close $f
}

set ::lat 0
proc latido {} {
    incr ::lat 15
    say "latido: $::lat s reales, t emulado [format %.1f [machine_info time]], $::N llamadas"
    vuelca
    after realtime 15 latido
}

proc fin {} { vuelca ; say "FIN: $::N llamadas" ; exit 0 }

set throttle off
after realtime 15 latido
after time $DUR fin