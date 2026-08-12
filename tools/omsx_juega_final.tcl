# TE DEJA LOS MANDOS CON LA CUENTA ATRAS EN MARCHA, PARA MORIRTE A GUSTO
#
# POR QUE EXISTE. Queda una pregunta abierta del proyecto que no se puede
# contestar leyendo: **si el `jp c` de 0xA533 llega a tomarse alguna vez**, o
# sea si el juego enseña un game over de verdad al quedarse sin vidas. En la
# partida grabada el jugador nunca se quedo a cero -gano vidas mas deprisa de
# lo que las perdia, de 2 a 6-, asi que ese salto no se ha visto tomar.
#
# Y no vale con dejar la maquina sola: el tiempo agotado (L_BCEE) ya se probo
# asi y va por OTRA puerta -es game over sin FELICIDADES, directo a los
# records-. Para agotar las VIDAS hace falta alguien que se deje matar.
#
# Lo que hace: carga la partida grabada, salta al instante en que acaba de caer
# el sexto objetivo -que es cuando la torre de la cuenta atras empieza a
# crecer-, se DESENGANCHA del replay y te deja el teclado.
#
# LAS TECLAS SON LAS DEL SPECTRUM, que es lo que trae el juego de fabrica
# (tabla de 0xB86A, la misma que la fase de naves):
#
#     Q arriba   A abajo   O izquierda   P derecha   ESPACIO disparo
#     H parar    G abandonar
#
# Y las del emulador: F9 guarda la grabacion de lo que llevas jugado, F12 una
# captura de pantalla, F8 alterna la velocidad.
#
# LO QUE MIDE MIENTRAS JUEGAS, que es a lo que venimos:
#
#     0xA525  el embudo de las vidas: apunta cuantas quedaban ANTES de restar
#     0xA533  el `jp c`: lee el ACARREO, que es lo unico que dice si el salto
#             se TOMA. Un bp aqui salta se tome o no -esa trampa ya se pago
#             una vez, contando 52 "game overs" que eran descuentos-
#     0xBCEE  el tiempo agotado, la otra puerta
#     0xA2D2  el estado inicial, donde desembocan las dos y el final feliz: por
#             eso no sirve para distinguirlas, y por eso se miran los origenes
#
# Al primer game over de verdad guarda la grabacion y una captura solo.
#
# Uso:  STARDUST_REPLAY=<ruta.omr> STARDUST_OUT=<dir> [STARDUST_T=<segundo>]
#           openmsx -machine <maquina> -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
set T [expr {[info exists ::env(STARDUST_T)] ? $::env(STARDUST_T) : 2795}]
file mkdir $OUT
set LOG [open "$OUT/juega_final.log" w]
proc say {m} { global LOG; puts $LOG "\[emu [format %8.2f [machine_info time]]\] $m"; flush $LOG }

# Con `-script` el emulador arranca con el renderer sin inicializar: sin esto
# no hay ventana que valga (y las capturas salen negras).
catch {set renderer SDLGL-PP}

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }
set r [catch {reverse goto $T} msg]
say "goto $T rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }

say [format "al llegar: torre=%d filas, objetivos=%d, vidas=%d, escudo=0x%02X" \
         [debug read memory 0xBC30] [debug read memory 0xBC33] \
         [debug read memory 0xC45F] [debug read memory 0xA6ED]]

# Desengancharse del replay. Sin esto el replay sigue inyectando la partida
# grabada -el usuario ESCAPA- y no hay manera de morirse.
set OK 0
foreach cmd {{reverse stop} {reverse_widgets::stop}} {
    if {![catch $cmd msg]} { say "desenganchado con: $cmd" ; set OK 1 ; break }
}
if {!$OK} { say "ABORTADO: no se pudo parar el replay" ; exit 1 }

# Y volver a grabar historia desde aqui, para poder guardar lo que se juegue.
set r [catch {reverse start} msg]
say "reverse start rc=$r: $msg"

# QUITAR EL POKE DE VIDAS INFINITAS (STARDUST_QUITA_POKE=1).
#
# La partida grabada se jugo CON TRAINER, y el trainer parchea un solo byte: el
# operando del `sub 001h` de 0xA528, que pasa a `sub 000h`. O sea que no impide
# morir -se pasa por el embudo igual- sino que la resta resta CERO, y por eso el
# `jp c` de 0xA533 no puede tomarse nunca: `sub 0` jamas da acarreo.
#
# Devolver el 0x01 no es tocar el juego: es RESTAURAR el byte que trae la cinta
# (work/parte2.raw dice 01 en esa posicion). Con eso las muertes descuentan de
# verdad y el game over por vidas se puede ver por fin.
if {[info exists ::env(STARDUST_QUITA_POKE)] && $::env(STARDUST_QUITA_POKE) == 1} {
    set antes [debug read memory 0xA529]
    debug write memory 0xA529 1
    say [format "poke retirado: 0xA529 valia 0x%02X, ahora 0x%02X (la cinta trae 0x01)" \
             $antes [debug read memory 0xA529]]
}

# ---------------------------------------------------------------- la medida
set ::muertes 0
set ::gameover 0
debug set_bp 0xA525 {} {
    incr ::muertes
    say [format "muerte %d: vidas antes de restar = %d" \
             $::muertes [debug read memory 0xC45F]]
}
debug set_bp 0xA533 {} {
    # El acarreo es el bit 0 de F, y F es el byte bajo de AF.
    set carry [expr {[reg AF] & 1}]
    if {$carry} {
        incr ::gameover
        say "*** ACARREO PUESTO en 0xA533: el `jp c` SE TOMA. GAME OVER DE VERDAD ***"
        say [format "    vidas=%d  escudo=0x%02X  torre=%d" \
                 [debug read memory 0xC45F] [debug read memory 0xA6ED] \
                 [debug read memory 0xBC30]]
        catch {screenshot -raw "$::env(STARDUST_OUT)/gameover.png"}
        catch {reverse savereplay "$::env(STARDUST_OUT)/gameover.omr"}
        after realtime 4 { catch {screenshot -raw "$::env(STARDUST_OUT)/gameover_mas4.png"} }
        after realtime 12 { catch {screenshot -raw "$::env(STARDUST_OUT)/gameover_mas12.png"} }
    } else {
        say "    (0xA533 ejecutado sin acarreo: es un descuento, no un game over)"
    }
}
debug set_bp 0xBCEE {} {
    say "*** L_BCEE: TIEMPO AGOTADO (torre=[debug read memory 0xBC30] filas) ***"
    catch {screenshot -raw "$::env(STARDUST_OUT)/timeup.png"}
    catch {reverse savereplay "$::env(STARDUST_OUT)/timeup.omr"}
}
debug set_bp 0xA2D2 {} { say "0xA2D2: vuelta al estado inicial" }

# ------------------------------------------------------------------- la vista
osd create rectangle panel -x 2 -y 2 -w 168 -h 42 -rgba 0x000000c0 -scaled true
osd create text panel.l1 -x 4 -y 2  -size 8 -rgb 0xffff40 -text ""
osd create text panel.l2 -x 4 -y 13 -size 8 -rgb 0x80ff80 -text ""
osd create text panel.l3 -x 4 -y 24 -size 6 -rgb 0xa0a0a0 -text "Q A O P + ESPACIO"
osd create text panel.l4 -x 4 -y 32 -size 6 -rgb 0xa0a0a0 -text "F9 guarda  F12 foto"

proc tic {} {
    set torre [debug read memory 0xBC30]
    osd configure panel.l1 -text [format "TORRE %3d/161   VIDAS %d" \
        $torre [debug read memory 0xC45F]]
    osd configure panel.l2 -text [format "escudo 0x%02X   muertes %d" \
        [debug read memory 0xA6ED] $::muertes]
    after realtime 0.25 tic
}
tic

proc guarda {} {
    global OUT
    set r [catch {reverse savereplay "$OUT/partida.omr"} msg]
    say "savereplay rc=$r: $msg"
    after realtime 60 guarda
}
after realtime 60 guarda

bind F9  "reverse savereplay $OUT/partida.omr"
bind F12 "screenshot -raw $OUT/foto.png"
bind F8  "toggle throttle"

say "MANDOS TUYOS. Q arriba / A abajo / O izq / P der / ESPACIO dispara."
