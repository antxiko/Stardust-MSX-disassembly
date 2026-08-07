# ¿TOCA EL JUEGO DE NAVES EL TRAMO 0xF972-0xFDE7 DURANTE LA PARTIDA?
#
# POR QUE. Es el ultimo rango grande sin clasificar del bloque (1141 B), y sus
# bytes en la cinta son 566 ceros + 566 0xFF alternados de dos en dos con 9
# bytes sueltos: el patron de encendido de una DRAM de 64K. La hipotesis es que
# el master se grabo volcando la RAM tal cual y ese tramo es relleno que llego
# hasta 0xFDE7 (el limite del buzon de POKEs) SIN que el juego lo use... o es
# espacio de variables que el juego escribe en marcha. Un watchpoint de lectura
# y otro de escritura sobre el rango entero lo zanjan: en juego normal aguantan
# si el callback es barato.
#
# Uso:  STARDUST_REPLAY=<ruta.omr> STARDUST_OUT=<dir> \
#       [STARDUST_T=<inicio>] [STARDUST_FIN=<final>] \
#           openmsx -machine Philips_VG_8020-20 -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
file mkdir $OUT
set LOG [open "$OUT/f972.log" w]
proc say {m} { global LOG; puts $LOG "\[emu [format %8.2f [machine_info time]]\] $m"; flush $LOG }

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }
array set st [reverse status]
set T   [expr {[info exists ::env(STARDUST_T)]   ? $::env(STARDUST_T)   : 905}]
set FIN [expr {[info exists ::env(STARDUST_FIN)] ? $::env(STARDUST_FIN) : 1255}]
say "replay hasta t=$st(end); ventana $T-$FIN"
set r [catch {reverse goto $T} msg]
say "reverse goto $T rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }

# Validez: el blitter de naves tiene que estar dibujando. El bp va donde
# EMPIEZA el primer ldi, 0xC3F3 -LEIDO DEL LISTADO, linea 2816-. Las dos
# primeras pasadas lo pusieron en 0xC3F2 y 0xC3F4 (los PC que reportan los
# watchpoints van +1) y salio 0 las dos veces: la trampa del bp en mitad de
# una instruccion, pagada dos veces mas. La regla que queda: la direccion de
# un bp de ejecucion se mira en el LISTADO, no se deriva de un log.
set ::BLIT 0
debug set_bp 0xC3F3 {} { incr ::BLIT }

set ::lect [dict create]
set ::escr [dict create]
set ::primera [dict create]
proc anota {d pc} {
    dict incr $d $pc
    if {![dict exists $::primera $pc]} { dict set ::primera $pc [format %.1f [machine_info time]] }
}
proc arma {} {
    debug set_watchpoint read_mem  {0xF972 0xFDE7} {} { anota ::lect [reg PC] }
    debug set_watchpoint write_mem {0xF972 0xFDE7} {} { anota ::escr [reg PC] }
    say "watchpoints armados"
}
# Sobre un replay que arranca desde el encendido, armar los watchpoints durante
# la CARGA congela el reloj emulado (leccion pagada con 0xD674): con
# STARDUST_ARMA_EN_BD85=1 se arman en el momento exacto en que el cargador
# salta al juego, con un bp de ejecucion, que es inocuo durante la carga.
if {[info exists ::env(STARDUST_ARMA_EN_BD85)]} {
    debug set_bp 0xBD85 {} { arma }
} else {
    arma
}

proc vigila {} {
    global FIN
    say "blitter=$::BLIT lectores=[dict size $::lect] escritores=[dict size $::escr]"
    set ::BLIT 0
    if {[machine_info time] >= $FIN} {
        foreach {nom d} {LECTOR ::lect ESCRITOR ::escr} {
            dict for {pc n} [set $d] { say "$nom pc=[format %04X $pc] n=$n primera_vez=[dict get $::primera $pc]" }
        }
        say "FIN"
        exit 0
    }
    after time 10 vigila
}
after time 10 vigila
set throttle off
