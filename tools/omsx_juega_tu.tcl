# Deja una partida en marcha y grabando, para jugarla a mano.
#
# Por que se parte de un savestate y no de la cinta: cargarla son 450 segundos
# emulados y una danza de teclear RUN"CAS:" en el momento justo, y no aporta
# nada -el cargador ya esta trazado-. Lo que hace falta trazar son las pantallas
# a las que un arnes no llega: el menu, redefinir teclas, la demo, el fin de
# partida y la tabla de records.
#
# Se entra en mitad de la partida a proposito. Al perder las vidas se pasa por
# el fin de partida, quiza por la tabla de records -si la puntuacion heredada da
# para entrar- y de ahi al menu, que es donde estan las otras tres. O sea que el
# orden natural de jugar recorre las cinco.
#
# La grabacion queda abierta desde el primer momento. Para guardarla, desde la
# consola de openMSX (F10):
#
#     reverse savereplay stardust_pantallas
#
# Uso:  STARDUST_ESTADO=<savestate> [STARDUST_REPLAY=<nombre>] \
#           openmsx -machine <maquina> -script este.tcl
#
# STARDUST_REPLAY da nombre a la grabacion. Tiene valor por defecto por comodidad,
# pero conviene pasarlo SIEMPRE: el guardado automatico machaca el fichero, y una
# sesion de la parte de a pie grabada encima de la de las pantallas se lleva por
# delante un trabajo que costo horas.
set ESTADO $::env(STARDUST_ESTADO)
set REPLAY [expr {[info exists ::env(STARDUST_REPLAY)] ? $::env(STARDUST_REPLAY) : "stardust_pantallas"}]
set L [open "/tmp/omsx_juega_tu.log" w]
proc say {m} { global L; puts $L "\[[format %8.2f [machine_info time]]\] $m"; flush $L }

set r [catch {loadstate $ESTADO} msg]
say "loadstate $ESTADO rc=$r $msg"
if {$r} { say "ABORTADO: no se pudo cargar el estado"; exit 1 }

# A velocidad normal, que esto se juega a mano.
set throttle on
say "PC=[format 0x%04X [reg PC]]"

set r [catch {reverse start} msg]
say "reverse start rc=$r $msg"
say "GRABANDO. El mando es tuyo."

# Se guarda solo cada minuto, machacando el mismo fichero. La primera version de
# esto dependia de que quien juega escribiera `reverse savereplay` ANTES de
# cerrar la ventana, y una sesion entera se perdio por cerrarla sin guardar. Una
# grabacion que solo existe en memoria es una grabacion que se va a perder.
set ::guardados 0
proc autoguarda {} {
    # OJO: el `global`. Sin el, la primera version parametrizada de esto fallaba
    # en CADA guardado con "can't read REPLAY: no such variable" y la sesion se
    # quedaba sin grabar en disco, avisando solo en el log.
    global REPLAY
    set r [catch {reverse savereplay $REPLAY} msg]
    if {$r} {
        say "AVISO: no se pudo guardar ($msg)"
    } else {
        incr ::guardados
        say "guardado automatico #$::guardados"
    }
    after time 60 autoguarda
}
after time 60 autoguarda
say "Se guarda solo cada minuto en ~/.openMSX/replays/$REPLAY.omr"
say "Puedes cerrar la ventana cuando quieras: se pierde como mucho el ultimo minuto."
