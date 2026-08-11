# QUE DIRECCIONES EJECUTA DE VERDAD LA FASE DE A PIE.
#
# Rehace una medida vieja cuya VENTANA estaba mal. Aquella muestreo el PC "a
# partir de que la carga termina, t=1775 s" y de ahi salieron las dos rutinas
# "que mas trabajan" de la segunda parte, 0xD48C con 139.323 muestras y 0xC865
# con 27.928, que estaban declaradas como datos y se pasaron a codigo.
#
# El problema: la carga NO ha terminado en t=1775. Medido este mismo dia desde
# el savestate de la pantalla de FELICIDADES, la segunda carga tarda unos 170
# segundos, y el replay empieza en t=1692,95 con ella ya en marcha; o sea que
# no acaba hasta t=1863 largos. En t=1775 lo que corre es el CARGADOR, y la
# memoria de 0x61D0 en adelante todavia esta a medio llenar: la mitad es el
# bloque del juego de naves, que sigue ahi debajo.
#
# Asi que esto muestrea en una ventana de partida de verdad, ya comprobada: en
# t=2262 el 99,7 % de las muestras caen dentro de 0x61D0-0xD674.
#
# Uso:  STARDUST_REPLAY=<ruta.omr> STARDUST_OUT=<dir> \
#       STARDUST_T=<inicio> STARDUST_FIN=<final> \
#           openmsx -machine <maquina> -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
file mkdir $OUT
set LOG [open "$OUT/pc_calientes.log" w]
proc say {m} { global LOG; puts $LOG "\[emu [format %8.2f [machine_info time]]\] $m"; flush $LOG }

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }
set T   $::env(STARDUST_T)
set FIN $::env(STARDUST_FIN)
say "ventana $T-$FIN"
set r [catch {reverse goto $T} msg]
say "goto rc=$r: $msg"

set ::h [dict create]
set ::n 0
proc muestrea {} {
    dict incr ::h [reg PC]
    incr ::n
    after time 0.0005 muestrea
}
muestrea

proc vigila {} {
    global FIN OUT
    if {[machine_info time] >= $FIN} {
        say "$::n muestras, [dict size $::h] direcciones distintas"
        # Las mas calientes, que es lo que se quiere comparar.
        set l {}
        dict for {pc v} $::h { lappend l [list $v $pc] }
        set l [lsort -integer -index 0 -decreasing $l]
        say "las 25 mas calientes:"
        foreach e [lrange $l 0 24] {
            say [format "   0x%04X  %6d muestras" [lindex $e 1] [lindex $e 0]]
        }
        # Y la pregunta concreta: ¿se pisa la zona 0xD48C-0xD673?
        set z 0
        dict for {pc v} $::h {
            if {$pc >= 0xD48C && $pc <= 0xD673} { incr z $v }
        }
        say "muestras dentro de 0xD48C-0xD673: $z"
        set z2 0
        dict for {pc v} $::h {
            if {$pc >= 0xC865 && $pc <= 0xC8BA} { incr z2 $v }
        }
        say "muestras dentro de 0xC865-0xC8BA: $z2"
        set F [open "$OUT/pc.txt" w]
        foreach e $l { puts $F [format "%04X %d" [lindex $e 1] [lindex $e 0]] }
        close $F
        say "FIN"
        exit 0
    }
    after time 5 vigila
}
after time 5 vigila
set throttle off
