# REPRODUCE UN REPLAY CON EL RELOJ EN PANTALLA, PARA QUE EL USUARIO BUSQUE EL
# MOMENTO QUE HACE FALTA MEDIR.
#
# POR QUE EXISTE. Las medidas sobre el replay se piden por SEGUNDO EMULADO
# (`reverse goto <T>`), y ese numero no se puede adivinar desde fuera: hay que
# ver la partida. La primera medida de las bandas se lanzo en t=2400 y ahi el
# escenario estaba parado -solo se movian los enemigos-, asi que no servia para
# separar los planos de scroll. Antes de volver a medir hay que mirar.
#
# LO QUE PINTA. Arriba a la izquierda, el tiempo emulado en dos formas:
#   - el numero crudo, que es LO QUE HAY QUE APUNTAR y lo que se le pasa a
#     STARDUST_T en las demas herramientas;
#   - minuto:segundo desde el principio del replay, para orientarse.
#
# TECLAS:
#   F8   alterna velocidad normal / a todo trapo (para pasar la carga de cinta)
#
# Va en `-viewonly`: el mando no hace nada, es una grabacion. Eso es lo que se
# quiere aqui, que la partida salga tal cual se jugo.
#
# Uso:  STARDUST_REPLAY=<ruta.omr> [STARDUST_T=<segundo>] \
#           openmsx -machine Philips_VG_8020-20 -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
if {$r} { error "no se pudo cargar el replay: $msg" }
array set st [reverse status]
set ::T0 $st(begin)
set ::TFIN $st(end)

if {[info exists ::env(STARDUST_T)]} {
    catch {reverse goto $::env(STARDUST_T)}
}

osd create rectangle reloj -x 2 -y 2 -w 150 -h 30 -rgba 0x000000c0 -scaled true
osd create text reloj.t1 -x 4 -y 2  -size 10 -rgb 0xffff40 -text ""
osd create text reloj.t2 -x 4 -y 15 -size 7  -rgb 0xa0a0a0 -text ""

proc tic {} {
    set t [machine_info time]
    set rel [expr {int($t - $::T0)}]
    osd configure reloj.t1 -text [format "t = %.1f" $t]
    osd configure reloj.t2 -text [format "%d:%02d de %d:%02d   F8=rapido" \
        [expr {$rel/60}] [expr {$rel%60}] \
        [expr {int($::TFIN-$::T0)/60}] [expr {int($::TFIN-$::T0)%60}]]
    after realtime 0.2 tic
}

bind F8 "toggle throttle"
tic
