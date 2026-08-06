# Muestrea el PC de una partida real y apunta por donde pasa.
#
# Para que sirve: cuando se retiran puntos de entrada que no eran validos, el
# trazador deja de alcanzar tramos que SI son codigo, y el presupuesto los da
# como "sin explicar". Adivinar que son seria repetir el error que se acaba de
# arreglar. Esto lo resuelve por la via que en este proyecto vale como prueba:
# si el procesador pasa por ahi, es codigo, y ademas sabemos por donde se entra.
#
# Se parte del savestate del trainer -con los POKEs de la revista puestos- para
# que la nave aguante y la partida recorra de verdad el juego.
#
# Uso:  STARDUST_OUT=... openmsx -machine <maq> -script este.tcl
set OUT $::env(STARDUST_OUT)
file mkdir $OUT

set ::pcs [dict create]
proc muestrea {} { dict incr ::pcs [format "%04X" [reg PC]] ; after time 0.001 muestrea }

# Los destinos de los saltos indirectos, que es lo otro que el trazador no puede
# deducir: el destino esta en un registro, no en el binario.
set ::dest [dict create]
proc anota {d} { dict incr ::dest [format "%s -> %04X (ix=%04X)" $d [reg HL] [reg IX]] }

set throttle off
loadstate stardust_trainer
debug set_bp 0xCB99 {} { anota CB99 }
debug set_bp 0xD6B8 {} { anota D6B8 }
muestrea

# Se aporrea el disparo para que la partida avance sola.
proc aporrea {} {
    keymatrixdown 8 1
    after time 0.12 { keymatrixup 8 1 }
    after time 0.9 aporrea
}
after time 2 aporrea

after time 900 {
    set f [open "$OUT/pcs.txt" w]
    foreach k [lsort [dict keys $::pcs]] { puts $f "$k [dict get $::pcs $k]" }
    close $f
    set f [open "$OUT/destinos.txt" w]
    foreach k [lsort [dict keys $::dest]] { puts $f "$k [dict get $::dest $k]" }
    close $f
    puts "muestreados [dict size $::pcs] PCs distintos y [dict size $::dest] destinos"
    exit 0
}
