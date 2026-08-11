# ¿SE EJECUTA ESTA DIRECCION, SI O NO?
#
# Para que sirve: el muestreo del PC dice que direcciones estan CALIENTES, pero
# no sirve para descartar. Una rutina que corre una sola vez -el arranque de la
# fase, el pre-desplazado de los sprites al empezar un nivel- puede no aparecer
# en ninguna muestra y ser codigo perfectamente. Un breakpoint la caza aunque
# pase una vez en media hora.
#
# De donde sale la necesidad: la medida del 2026-08-07 abrio su ventana en
# t=1775 dando la carga por terminada, y no lo estaba, asi que las entradas que
# declaro hay que revisarlas una a una. Dos ya se cayeron (0xD48C y 0xD525, que
# no son codigo). Estas son las demas.
#
# Los breakpoints de ejecucion funcionan sobre un replay -comprobado con un bp
# de control en 0x0038-, y ese control va puesto: si sale cero, esto no vale.
#
# Uso:  STARDUST_REPLAY=<ruta.omr> STARDUST_OUT=<dir> \
#       STARDUST_DIRS=<0xAAAA,0xBBBB,...> [STARDUST_T=<inicio>] [STARDUST_FIN=<fin>]
#           openmsx -machine <maquina> -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
file mkdir $OUT
set LOG [open "$OUT/se_ejecuta.log" w]
proc say {m} { global LOG; puts $LOG "\[emu [format %8.2f [machine_info time]]\] $m"; flush $LOG }

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }
array set st [reverse status]
set T   [expr {[info exists ::env(STARDUST_T)]   ? $::env(STARDUST_T)   : $st(begin)}]
set FIN [expr {[info exists ::env(STARDUST_FIN)] ? $::env(STARDUST_FIN) : $st(end)}]
say "replay de $st(begin) a $st(end); ventana $T-$FIN"
if {$T > $st(begin)} { set r [catch {reverse goto $T} msg] ; say "goto rc=$r: $msg" }

set ::n0038 0
debug set_bp 0x00038 {} { incr ::n0038 }

set ::cuenta [dict create]
set ::primera [dict create]
foreach d [split $::env(STARDUST_DIRS) ,] {
    set a [expr $d]
    dict set ::cuenta $a 0
    debug set_bp $a {} "
        dict incr ::cuenta $a
        if {\[dict get \$::cuenta $a\] == 1} {
            dict set ::primera $a \[machine_info time\]
        }
    "
}
say "vigilando [dict size $::cuenta] direcciones"

proc vigila {} {
    global FIN
    if {[machine_info time] >= $FIN} {
        say "--- INFORME ---"
        say "CONTROL bp 0x0038: $::n0038 pasadas (si es 0, esto no vale)"
        foreach a [lsort -integer [dict keys $::cuenta]] {
            set n [dict get $::cuenta $a]
            if {$n} {
                say [format "  0x%04X  SE EJECUTA  %8d veces, la primera en t=%.2f" \
                         $a $n [dict get $::primera $a]]
            } else {
                say [format "  0x%04X  NO SE EJECUTA ni una vez en toda la ventana" $a]
            }
        }
        say "FIN"
        exit 0
    }
    after time 5 vigila
}
after time 5 vigila
set throttle off
