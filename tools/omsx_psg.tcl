# QUE PERIODOS ESCRIBE DE VERDAD EL JUEGO EN EL CHIP DE SONIDO.
#
# Para que sirve: toda la lectura de la musica -los quince comandos, cuantos
# argumentos consume cada uno, la tabla de 96 notas, la transposicion- es
# deduccion sobre el listado. Esto la contrasta contra el hardware emulado: si
# los periodos que el juego mete en el PSG son los de la tabla de notas, la
# cadena entera esta bien leida; si no, algo falla.
#
# Como se captura: en el MSX el PSG se habla por dos puertos, 0xA0 para elegir
# registro y 0xA1 para el dato. Asi que hay que llevar cual es el registro
# seleccionado en cada momento. Los registros 0-5 son los periodos de tono de
# los tres canales, en pares (bajo, alto de 4 bits); el 6 es el ruido y el 7 la
# habilitacion.
#
# El callback es BARATO a proposito -solo asignaciones y dict incr, nada de
# format ni de construir cadenas-, que es la condicion para que un watchpoint
# de E/S aguante cientos de miles de eventos sin congelar el emulador.
#
# Uso:  STARDUST_REPLAY=<ruta.omr> STARDUST_OUT=<dir> \
#       [STARDUST_T=<inicio>] [STARDUST_FIN=<final>] \
#           openmsx -machine Philips_VG_8020-20 -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
file mkdir $OUT
set LOG [open "$OUT/psg.log" w]
proc say {m} { global LOG; puts $LOG "\[emu [format %8.2f [machine_info time]]\] $m"; flush $LOG }

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }
array set st [reverse status]
set T   [expr {[info exists ::env(STARDUST_T)]   ? $::env(STARDUST_T)   : 1700}]
set FIN [expr {[info exists ::env(STARDUST_FIN)] ? $::env(STARDUST_FIN) : 1760}]
say "replay hasta t=$st(end); ventana $T-$FIN"
set r [catch {reverse goto $T} msg]
say "reverse goto $T rc=$r: $msg"

set ::reg 0
set ::psg [dict create]          ; # registro -> ultimo valor
set ::periodos [dict create]     ; # periodo completo -> veces visto
set ::escrituras 0

# 0xA0: elegir registro.
debug set_watchpoint write_io 0xA0 {} { set ::reg [expr {$::wp_last_value & 0x0F}] }

# 0xA1: el dato. Si toca un registro de tono, recompone el periodo de 12 bits
# de su canal y lo apunta.
debug set_watchpoint write_io 0xA1 {} {
    incr ::escrituras
    dict set ::psg $::reg $::wp_last_value
    if {$::reg < 6} {
        set c [expr {$::reg / 2}]
        set lo [expr {[dict exists $::psg [expr {$c*2}]] ? [dict get $::psg [expr {$c*2}]] : 0}]
        set hi [expr {[dict exists $::psg [expr {$c*2+1}]] ? [dict get $::psg [expr {$c*2+1}]] : 0}]
        set p [expr {$lo | (($hi & 0x0F) << 8)}]
        if {$p > 0} { dict incr ::periodos $p }
    }
}

proc vigila {} {
    global FIN
    if {[machine_info time] >= $FIN} {
        say "escrituras al PSG: $::escrituras"
        set l {}
        dict for {p v} $::periodos { lappend l "$p:$v" }
        say "periodos vistos ([llength $l] distintos): [join $l { }]"
        say "FIN"
        exit 0
    }
    after time 5 vigila
}
after time 5 vigila
set throttle off
