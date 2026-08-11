# CADA CUANTO SE LLAMA AL INTERPRETE DE SONIDO.
#
# De donde sale la pregunta: la musica de los records de la fase de a pie cuadra
# con la lectura al 99,4 % usando una rejilla de 50,15 Hz -el ritmo de la
# interrupcion-, pero la musica de DENTRO del juego toca las mismas notas en el
# mismo orden y las sostiene 6, 7 o 10 cuadros donde el guion dice 4. O sea que
# la melodia esta bien leida y lo que cambia es el RITMO al que alguien llama al
# interprete.
#
# Esto lo mide en vez de suponerlo: un breakpoint en la entrada del interprete
# (0xC517 en la parte de a pie; son los mismos 24 bytes que el 0xE203 del juego
# de naves salvo el operando reubicado) y se apunta el instante de cada llamada.
# Del reparto de intervalos sale la respuesta:
#
#   - si sale un pico limpio en 1/50,15 s, lo llama la interrupcion;
#   - si sale disperso y mas largo, lo llama el bucle del juego, y entonces la
#     musica va al ritmo que le deje la accion en pantalla.
#
# Se mide en DOS ventanas para poder comparar: la pantalla de records, que esta
# quieta, y un tramo de partida.
#
# Uso:  STARDUST_REPLAY=<ruta.omr> STARDUST_OUT=<dir> \
#       STARDUST_T=<inicio> STARDUST_FIN=<final> [STARDUST_BP=<direccion>] \
#           openmsx -machine <maquina> -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
file mkdir $OUT
set ETIQ [expr {[info exists ::env(STARDUST_ETIQ)] ? $::env(STARDUST_ETIQ) : "tramo"}]
set LOG [open "$OUT/ritmo_$ETIQ.log" w]
proc say {m} { global LOG; puts $LOG "\[emu [format %8.2f [machine_info time]]\] $m"; flush $LOG }

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }
set T   $::env(STARDUST_T)
set FIN $::env(STARDUST_FIN)
set BP  [expr {[info exists ::env(STARDUST_BP)] ? $::env(STARDUST_BP) : 0xC517}]
say "ventana $T-$FIN, breakpoint en [format 0x%04X $BP]"
set r [catch {reverse goto $T} msg]
say "goto rc=$r: $msg"

set ::t {}
set ::n0038 0
debug set_bp 0x00038 {} { incr ::n0038 }
debug set_bp $BP {} {
    if {[llength $::t] < 40000} { lappend ::t [machine_info time] }
}

proc vigila {} {
    global FIN OUT ETIQ
    if {[machine_info time] >= $FIN} {
        say "CONTROL bp 0x0038: $::n0038 pasadas"
        say "llamadas al interprete: [llength $::t]"
        if {[llength $::t] > 2} {
            # El reparto de intervalos, en cuadros de video de 50,15 Hz.
            set h [dict create]
            set prev [lindex $::t 0]
            set suma 0.0 ; set n 0
            foreach x [lrange $::t 1 end] {
                set d [expr {($x - $prev) * 50.15}]
                set prev $x
                if {$d <= 0} continue
                set suma [expr {$suma + $d}] ; incr n
                # se redondea a cuartos de cuadro para que el reparto se lea
                dict incr h [format %.2f [expr {round($d*4.0)/4.0}]]
            }
            say "intervalo medio: [format %.3f [expr {$suma/$n}]] cuadros de video"
            set l {}
            foreach k [lsort -real [dict keys $h]] { lappend l "$k:[dict get $h $k]" }
            say "reparto de intervalos (cuadros:veces): [join $l { }]"
        }
        say "FIN"
        exit 0
    }
    after time 5 vigila
}
after time 5 vigila
set throttle off
