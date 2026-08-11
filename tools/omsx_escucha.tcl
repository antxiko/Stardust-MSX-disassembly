# DEJA EL JUEGO SONANDO PARA ESCUCHARLO CON LOS OIDOS.
#
# Para que sirve: toda la lectura de la musica es deduccion sobre el listado, y
# el sintetizador de tools/suena_musica.py toca UNA voz suelta, plana y sin
# instrumento. Antes de dar por buena una partitura conviene oir la de verdad.
#
# Por que sobre el replay y no sobre un savestate: la musica se instala en un
# momento concreto (arranca_musica, 0xE16F) y un savestate cogido en mitad de
# la partida cae donde cae. El replay tiene el menu localizado: el GAMEOVER es
# t=1861,95 y la demo arranca en t=2069,55, o sea que entre medias hay tres
# minutos largos de menu.
#
# A diferencia de las capturas, esto va a VELOCIDAD REAL (throttle on): si no,
# el sonido sale acelerado y no se puede juzgar.
#
# De paso, y sin costar nada, apunta cada vez que pasa por arranca_musica
# (0xE16F) y por el instalador de canal (0xE1BC), que dice QUE guion entra en
# QUE canal. Asi la escucha deja tambien un dato medido.
#
# Uso:  STARDUST_REPLAY=<ruta.omr> [STARDUST_T=<instante>] \
#           openmsx -machine Philips_VG_8020-20 -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set T [expr {[info exists ::env(STARDUST_T)] ? $::env(STARDUST_T) : 1870}]
set LOG [open "/tmp/omsx_escucha.log" w]
proc say {m} { global LOG; puts $LOG "\[emu [format %8.2f [machine_info time]]\] $m"; flush $LOG }

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }
array set st [reverse status]
say "replay hasta t=$st(end); saltando a t=$T"

# El salto se hace SIN sonido y a toda velocidad; si no, el usuario se come el
# fast-forward por el altavoz.
set throttle off
set mute on
set r [catch {reverse goto $T} msg]
say "reverse goto $T rc=$r: $msg"

# Quien instala la musica y con que guion.
debug set_bp 0x0E16F {} { say "arranca_musica: instala las tres voces" }
debug set_bp 0x0E1BC {} { say "  instala canal [expr {[reg A] & 0x7F}] <- guion [format 0x%04X [reg DE]]" }

# Y ahora, a velocidad real y con sonido.
set throttle on
set mute off
say "SONANDO a velocidad real desde t=$T. Escucha."

# Un reloj en pantalla, para poder decir "en el minuto tal sonaba mal".
proc reloj {} {
    catch {osd destroy reloj}
    osd create rectangle reloj -x 0 -y 0 -w 96 -h 14 -rgba 0x000000c0
    osd create text reloj.t -x 3 -y 2 -size 9 -rgb 0xffffff \
        -text "t=[format %.1f [machine_info time]]"
    after time 1 reloj
}
reloj
