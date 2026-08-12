# UNA CAPTURA DEL JUEGO CORRIENDO DE VERDAD
#
# El criterio 7 de la mision pide ver el juego arrancar en openMSX. Las
# imagenes de la web son renders del binario -tiles, mapas, la torre-, que
# demuestran que los datos se han entendido pero NO que el programa corra.
#
# Se saca de la partida grabada, no de una sesion a mano: asi la pantalla es
# una que el jugador vio de verdad, con su instante apuntado.
#
# OJO: `reverse goto` restaura el estado, pero la pantalla no esta pintada
# hasta que la maquina emula unos cuadros mas. Por eso la captura se toma
# despues de dejar correr un poco, no inmediatamente.
#
# Y LA OTRA TRAMPA, que costo una captura en negro: lanzado con `-script`, el
# emulador arranca con el renderer en `uninitialized` y `screenshot` devuelve
# rc=0 con un PNG todo negro. Hay que encenderlo a mano con
# `set renderer SDLGL-PP`, que es lo que abre la ventana de verdad.
#
# Uso:  STARDUST_REPLAY=<ruta.omr> STARDUST_OUT=<dir> STARDUST_T=<instante> \
#       [STARDUST_CORRE=<segundos>] [STARDUST_NOMBRE=<fichero.png>]
#           openmsx -machine <maquina> -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
file mkdir $OUT
set LOG [open "$OUT/captura.log" w]
proc say {m} { global LOG; puts $LOG "\[emu [format %8.2f [machine_info time]]\] $m"; flush $LOG }

set r [catch {set renderer SDLGL-PP} msg]
say "renderer rc=$r: [set renderer]"

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }
set T $::env(STARDUST_T)
set r [catch {reverse goto $T} msg]
say "goto $T rc=$r: $msg"

set CORRE [expr {[info exists ::env(STARDUST_CORRE)] ? $::env(STARDUST_CORRE) : 2}]
set NOMBRE [expr {[info exists ::env(STARDUST_NOMBRE)] ? $::env(STARDUST_NOMBRE) : "captura.png"}]

proc dispara {} {
    global OUT NOMBRE
    set r [catch {screenshot -raw -doublesize $OUT/$NOMBRE} msg]
    say "screenshot rc=$r: $msg"
    if {$r} {
        set r2 [catch {screenshot $OUT/$NOMBRE} msg2]
        say "screenshot (sin opciones) rc=$r2: $msg2"
    }
    say [format "PC=0x%04X  zona=%d" [reg PC] [debug read memory 0xE157]]
    say "FIN"
    exit 0
}
# Y LA TERCERA TRAMPA, que costo otra captura en negro: con `set throttle off`
# y un `after time` (tiempo EMULADO) la maquina corre a toda pastilla y el
# renderer se salta los cuadros, asi que no llega a dibujar ninguno. La captura
# hay que pedirla con `after realtime` y el acelerador PUESTO: unos segundos de
# reloj de pared, que es lo que tarda la pantalla en pintarse de verdad.
after realtime $CORRE dispara
