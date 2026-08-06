# Saca de la SEGUNDA parte (la de a pie) lo que el trazador no puede deducir.
#
# Se parte del savestate 'stardust_parte2', guardado justo despues de que el
# juego volviera a la cinta a por ella: ahi la memoria de 0x61D0 ya es la parte
# de a pie y esta corriendo (19951 muestras del PC dentro de su rango contra 39
# fuera). Asi no hay que jugarse otra vez los 21 minutos de naves.
#
# Se recogen dos cosas:
#   - los destinos de sus dos `jp (hl)`, en 0x984D y 0xC544, con el IX que los
#     mandaba, que es lo que identifica a que objeto pertenece cada rutina;
#   - el PC muestreado, para descubrir codigo al que solo se llega por tabla.
set OUT $::env(STARDUST_OUT)
set LOG [open "$OUT/parte2.log" w]
proc say {m} { global LOG; puts $LOG "\[[format %8.2f [machine_info time]]\] $m"; flush $LOG }
set ::dest [dict create]
set ::pcs [dict create]
proc anota {d} { dict incr ::dest [format "%s hl=%04X ix=%04X" $d [reg HL] [reg IX]] }

set throttle off
loadstate stardust_parte2
say "savestate cargado, PC=[format 0x%04X [reg PC]]"

debug set_bp 0x984D {} { anota 984D }
debug set_bp 0xC544 {} { anota C544 }

proc muestrea {} { dict incr ::pcs [format "%04X" [reg PC]] ; after time 0.002 muestrea }
muestrea
proc aporrea {} {
    keymatrixdown 8 1
    after time 0.15 { keymatrixup 8 1 }
    after time 1.5 aporrea
}
after time 2 aporrea

after time 300 {
    set f [open "$OUT/p2_destinos.txt" w]
    foreach k [lsort [dict keys $::dest]] { puts $f "$k [dict get $::dest $k]" }
    close $f
    set f [open "$OUT/p2_pcs.txt" w]
    foreach k [lsort [dict keys $::pcs]] { puts $f "$k [dict get $::pcs $k]" }
    close $f
    say "volcados [dict size $::dest] destinos y [dict size $::pcs] PCs"
    set throttle on
    after time 2 { screenshot -raw -prefix "$OUT/png/apie_" ; exit 0 }
}
