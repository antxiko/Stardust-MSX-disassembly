# DEJA QUE LA CUENTA ATRAS SE AGOTE, PARA VER QUE PASA (idea del usuario).
#
# En el replay el usuario ESCAPO, asi que L_BCEE (el manejador del tiempo
# agotado) no llego a ejecutarse nunca y todo lo que se sabe de el es leido del
# listado. La prueba: cargar la partida con la barra a medias (t=3059, 18 filas
# de 161) y DESENGANCHARSE del replay, para que nadie toque los mandos y el
# personaje se quede quieto. La barra crece sola (su ritmo es el contador de
# cuadros, no el jugador) y al llegar a 0xA1 filas se dispara L_BCEE en vivo.
#
# Se registra: el valor de 0xBC30 (filas pintadas) cada 10 s, el momento exacto
# del disparo de 0xBCEE, todo lo que imprima L_D252 despues, y capturas de
# pantalla antes, en el disparo y despues.
#
# Uso:  STARDUST_REPLAY=<ruta.omr> STARDUST_OUT=<dir> \
#       [STARDUST_T=<segundo>] [STARDUST_MAX=<tope de segundos emulados>] \
#           openmsx -machine Philips_VG_8020-20 -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
set T [expr {[info exists ::env(STARDUST_T)] ? $::env(STARDUST_T) : 3059}]
set MAX [expr {[info exists ::env(STARDUST_MAX)] ? $::env(STARDUST_MAX) : 400}]
file mkdir $OUT
set LOG [open "$OUT/timeup.log" w]
proc say {m} { global LOG; puts $LOG "\[emu [format %8.2f [machine_info time]]\] $m"; flush $LOG }

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }
set r [catch {reverse goto $T} msg]
say "reverse goto $T rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }

# Desengancharse del replay: sin esto, el replay reproduce la huida del usuario
# y el tiempo nunca se agota. Se prueban las dos formas conocidas y se apunta
# cual ha funcionado; si ninguna funciona, se aborta y se dice.
set OK 0
foreach cmd {{reverse stop} {reverse_widgets::stop}} {
    if {![catch $cmd msg]} { say "desenganchado con: $cmd" ; set OK 1 ; break }
}
if {!$OK} { say "ABORTADO: no se pudo parar el replay; probar a poner 0xBC30 a mano" ; exit 1 }

say "0xBC30 al empezar = [debug read memory 0xBC30] filas"
catch {screenshot -raw "$OUT/antes.png"} msg
say "captura antes: $msg"

set ::FUEGO 0
debug set_bp 0xBCEE {} {
    if {!$::FUEGO} {
        set ::FUEGO 1
        say "*** L_BCEE DISPARADO: la cuenta atras se agoto (0xBC30=[debug read memory 0xBC30]) ***"
        catch {screenshot -raw "$::env(STARDUST_OUT)/disparo.png"}
        after time 3  { catch {screenshot -raw "$::env(STARDUST_OUT)/disparo_mas3.png"} }
        after time 10 { catch {screenshot -raw "$::env(STARDUST_OUT)/disparo_mas10.png"} }
        after time 25 { catch {screenshot -raw "$::env(STARDUST_OUT)/disparo_mas25.png"} ; say "capturas post-disparo hechas" }
        after time 30 { say "FIN, 30 s despues del disparo" ; exit 0 }
    }
}

# Lo que imprima el rotulador del marco despues del disparo, letra a letra.
debug set_bp 0xD252 {} {
    set a [expr {[reg AF] >> 8}]
    if {$a >= 32 && $a < 127} { say "D252 imprime '[format %c $a]'" } else { say "D252 ctrl [format %02X $a]" }
}

proc sondeo {} {
    say "0xBC30 = [debug read memory 0xBC30] filas (fuego=$::FUEGO)"
    after time 10 sondeo
}

set throttle off
sondeo
after time $MAX { say "TOPE de $MAX s emulados sin disparo" ; exit 1 }