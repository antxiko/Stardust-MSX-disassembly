# CUANDO ARRANCA CADA MUSICA DE LA FASE DE A PIE.
#
# La fase de a pie tiene DOS musicas, cada una con su rutina que instala tres
# voces de golpe: la de 0xB3CB (voces 0xCDB1/0xCDD0/0xCDEC, propias de la fase)
# y la de 0xC483 (la homologa de la del juego de naves). La segunda ya esta
# cotejada contra el chip al 99,4 % sobre la musica de los records; de la
# primera no se ha medido un tramo donde suene, asi que no se ha podido cotejar.
#
# Esto es lo barato que hay que hacer antes: barrer el replay entero apuntando
# CUANDO pasa por cada una, para luego capturar una ventana corta a tiro hecho
# en vez de adivinar. Sin watchpoints de E/S ni muestreo de PC, que es lo que
# encarece las capturas: solo dos breakpoints y un contador.
#
# Los breakpoints de ejecucion funcionan sobre un replay -esta comprobado con un
# bp de control en 0x0038, el vector de interrupcion de la ROM-, y ese control va
# puesto aqui tambien: si sale cero, el resto del log no vale.
#
# Uso:  STARDUST_REPLAY=<ruta.omr> STARDUST_OUT=<dir> \
#       [STARDUST_T=<inicio>] [STARDUST_FIN=<final>] \
#           openmsx -machine <maquina> -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
file mkdir $OUT
set LOG [open "$OUT/cuando_suena.log" w]
proc say {m} { global LOG; puts $LOG "\[emu [format %8.2f [machine_info time]]\] $m"; flush $LOG }

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }
array set st [reverse status]
set T   [expr {[info exists ::env(STARDUST_T)]   ? $::env(STARDUST_T)   : 0}]
set FIN [expr {[info exists ::env(STARDUST_FIN)] ? $::env(STARDUST_FIN) : $st(end)}]
say "replay de $st(begin) a $st(end); ventana $T-$FIN"
if {$T > 0} { set r [catch {reverse goto $T} msg] ; say "goto $T rc=$r: $msg" }

set ::n0038 0 ; set ::nB3CB 0 ; set ::nC483 0
debug set_bp 0x00038 {} { incr ::n0038 }
debug set_bp 0x0B3CB {} {
    incr ::nB3CB
    if {$::nB3CB <= 12} { say "musica A (0xB3CB, la propia de la fase) arranca — pasada $::nB3CB" }
}
debug set_bp 0x0C483 {} {
    incr ::nC483
    if {$::nC483 <= 12} { say "musica B (0xC483, la homologa de naves) arranca — pasada $::nC483" }
}

proc vigila {} {
    global FIN
    if {[machine_info time] >= $FIN} {
        say "--- INFORME ---"
        say "CONTROL bp 0x0038: $::n0038 pasadas (si es 0, esto no vale)"
        say "musica A (0xB3CB): $::nB3CB arranques"
        say "musica B (0xC483): $::nC483 arranques"
        say "FIN"
        exit 0
    }
    after time 5 vigila
}
after time 5 vigila
set throttle off
