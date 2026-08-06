# Deja el juego cargado y esperando en el menu, grabando, para jugar a mano.
#
# La carga de la cinta son unos 450 segundos emulados y no tiene ningun interes
# verla: se pasa con el acelerador quitado y se vuelve a poner justo antes de
# devolver el mando. El corte exacto es 0xBD85, donde el cargador salta al juego.
#
# OJO con el arranque: con `throttle off` los primeros segundos emulados pasan en
# un suspiro, y si se escribe RUN"CAS:" antes de que el BASIC este listo la orden
# se pierde y la maquina se queda mirando. Por eso aqui se espera de verdad y se
# reintenta hasta que la carga arranca.
#
# A partir del menu la grabacion queda abierta (`reverse start`), asi que todo lo
# que se haga con el teclado entra en el replay. Para guardarlo, desde la consola
# de openMSX (F10):
#
#     reverse savereplay stardust_pantallas
#
# Uso:  openmsx -machine <maq> -cassetteplayer <cinta.tsx> -script este.tcl
set L [open "/tmp/omsx_menu.log" w]
proc say {m} { global L; puts $L "\[[format %8.2f [machine_info time]]\] $m"; flush $L }

say "cinta: [cassetteplayer]"

set ::en_el_juego 0
set ::cargando 0
set ::intentos 0

debug set_bp 0xBD85 {} {
    if {!$::en_el_juego} { set ::en_el_juego 1 ; say "el cargador salta al juego" }
}
# El cargador turbo empieza en 0xD2F0: si el PC pasa por ahi, la cinta ya esta
# entrando de verdad y no hace falta reintentar la orden.
debug set_bp 0xD2F0 {} {
    if {!$::cargando} { set ::cargando 1 ; say "la carga ha arrancado" }
}

set throttle off

# Se escribe la orden cuando el BASIC ya responde, y se reintenta si no prende.
proc arranca {} {
    if {$::cargando || $::en_el_juego} { return }
    incr ::intentos
    if {$::intentos > 6} { say "NO ARRANCA la carga tras $::intentos intentos"; return }
    type "RUN\"CAS:\"\r"
    say "escrito RUN\"CAS:\" (intento $::intentos)"
    after time 12 arranca
}
after time 10 arranca

proc espera {} {
    if {$::en_el_juego} {
        after time 3 {
            set throttle on
            reverse start
            say "GRABANDO. El mando es tuyo."
            say "Para guardar:  reverse savereplay stardust_pantallas"
        }
        return
    }
    after time 5 espera
}
after time 12 espera
