# Encuentra el contador de vidas dejando que el juego lo ensene.
#
# La parte dificil no es buscar el byte, es ENTRAR EN PARTIDA de forma fiable.
# Lo que fallo, para no repetirlo: pulsar el disparo dos veces (se queda en la
# presentacion), aporrearlo sin mas (acaba dando vueltas por el menu JOYSTICK /
# TECLADO / REDEFINIR TECLAS / JUGAR), y una secuencia de teclas con tiempos
# fijos (acabo en la tabla de records). El atract mode rota y las pulsaciones a
# ciegas caen donde caen.
#
# Lo que si funciona: aporrear hasta que se note que hay partida, y para eso hay
# un indicador que no falla: la rutina de comportamiento de objeto de 0xD8A3
# SOLO corre habiendo enemigos en pantalla. Se pone ahi un punto de observacion
# y, en cuanto salta, se deja de pulsar y se empieza a volcar: la nave se queda
# quieta y de matarla ya se encargan ellos.
set OUT $::env(STARDUST_OUT)
file mkdir $OUT/ram
set LOG [open "$OUT/vidas.log" w]
proc say {m} { global LOG; puts $LOG "\[[format %8.2f [machine_info time]]\] $m"; flush $LOG }
set throttle off
loadstate stardust_juego
set ::jugando 0
set ::n 0

proc vuelca {} {
    global OUT
    set f [open "$OUT/ram/v$::n.bin" w]
    fconfigure $f -translation binary
    puts -nonewline $f [debug read_block memory 0x4000 0xC000]
    close $f
    say "volcado v$::n"
    incr ::n
    if {$::n < 12} { after time 12 vuelca } else {
        set throttle on
        after time 2 { screenshot -raw -prefix "$OUT/png/vidas_" ; say "hecho" ; exit 0 }
    }
}

debug set_bp 0xD8A3 {} {
    if {!$::jugando} {
        set ::jugando 1
        say "HAY PARTIDA (salto la rutina de objeto 0xD8A3); se deja de pulsar"
        after time 3 vuelca
    }
}

proc aporrea {} {
    if {$::jugando} return
    keymatrixdown 8 1
    after time 0.15 { keymatrixup 8 1 }
    after time 1.5 aporrea
}
after time 2 aporrea
after time 600 { say "TIMEOUT: no se llego a partida" ; exit 1 }
