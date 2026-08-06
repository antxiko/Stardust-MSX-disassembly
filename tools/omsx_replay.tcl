# Muestrea el PC durante una PARTIDA COMPLETA reproducida desde un replay.
#
# Por que esto vale mas que jugar: un arnes que aporrea el disparo llega hasta
# donde llega. Una partida de verdad, grabada por alguien que se sabe el juego,
# pasa por las siete zonas, por la carga de la segunda parte, por la fase de a
# pie y por las pantallas que un bot no ve nunca -fin de partida, tabla de
# records, menu, redefinir teclas-. Justo esas pantallas son las que dejan sin
# trazar buena parte del bloque.
#
# El replay lo grabo Araubi (openMSX 17.0-rc1, Sony HB-20P, 2021). Trae la ruta
# de SU copia de la cinta, que aqui no existe: hay que reescribirla a la local
# antes de cargarlo. Eso lo hace tools/prepara_replay.py.
#
# Uso:  STARDUST_REPLAY=... STARDUST_OUT=... openmsx -machine <maq> -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
file mkdir $OUT

set L [open "$OUT/replay.log" w]
proc say {m} { global L; puts $L "\[[format %8.2f [machine_info time]]\] $m"; flush $L }

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }

array set st [reverse status]
set FIN $st(end)
say "replay cargado, dura $FIN segundos"

# OJO: los dos programas viven en las MISMAS direcciones en momentos distintos.
# La segunda parte se carga en 0x61D0 y machaca al juego de naves, asi que un PC
# de 0x7D0D es codigo de una o de otra segun cuando se mire. Mezclarlos da una
# lectura falsa, y de las que enganan: parece que se ejecuta codigo dentro de los
# graficos, que es justo el error que ya contamino este proyecto una vez.
# LA FRONTERA ENTRE LAS DOS FASES, Y POR QUE ES POR TIEMPO
#
# Se probaron dos marcadores y los dos fallaron, asi que conviene dejarlo dicho:
#
#   - watchpoint de escritura en 0x61D0: salta a los 223 s, en plena carga
#     INICIAL, porque el bloque del juego de naves va de 0x47A0 a 0xFDE6 y ya
#     cubre esa direccion. No distingue una carga de la otra.
#   - breakpoint en 0xF7F6, la rutina de carga propia del juego: no salta ni una
#     vez en los 2280 s del replay, aunque la segunda parte se carga de verdad.
#     Queda como pregunta abierta.
#
# Lo que si es medible sin suponer nada es CUANDO esta la segunda parte en RAM,
# comparando 0x61D0 en adelante contra el bloque [12] de la cinta:
#
#       t=1550    3,87 % coincide      t=1750   42,34 %
#       t=1600   40,28 %               t=1800  100,00 %
#
# O sea que la carga ocupa la ventana 1575-1775. Fuera de ella no hay duda de
# quien es el dueno de cada direccion, y dentro no se atribuye a nadie.
set ::CARGA_INI 1575
set ::CARGA_FIN 1775

# Y por delante hay OTRA frontera que tambien hay que respetar: hasta que el
# cargador no salta al juego, esas mismas direcciones son de otros. Se comprobo
# midiendo, y de los 122 PC que parecian ejecutarse dentro de los tiles:
#   66 eran del logo de TOPO      (0x9470-0xA50D, se carga y se ejecuta primero)
#    9 eran de la pantalla de carga (0x9B8C-0xCC3F, tambien se ejecuta)
#   56 estaban por debajo de 0x8000, o sea en la ROM DEL BASIC: hasta que el
#      cargador mapea RAM en las paginas 1 y 2, ahi no hay RAM que valga.
# Ninguno era codigo dentro de los graficos. Pero si no se corta por aqui, lo
# parece, y esa lectura falsa es la que ya costo una republicacion.
#
# El corte exacto es el salto del cargador al juego, en 0xBD85.
set ::ARRANCADO 0
debug set_bp 0xBD85 {} {
    if {!$::ARRANCADO} { set ::ARRANCADO 1 ; say "el cargador salta al juego (0xBD85)" }
}

set ::pcs0 [dict create]
set ::pcs1 [dict create]
set ::pcs2 [dict create]
proc muestrea {} {
    set t [machine_info time]
    if {!$::ARRANCADO} {
        dict incr ::pcs0 [format "%04X" [reg PC]]
    } elseif {$t < $::CARGA_INI} {
        dict incr ::pcs1 [format "%04X" [reg PC]]
    } elseif {$t > $::CARGA_FIN} {
        dict incr ::pcs2 [format "%04X" [reg PC]]
    }
    after time 0.001 muestrea
}

# Los saltos indirectos, que es lo que el trazador no puede seguir. Con una
# partida entera salen los destinos de todas las fases, no solo los de la
# primera pantalla.
set ::dest [dict create]
proc anota {d} { dict incr ::dest [format "%s -> %04X (ix=%04X)" $d [reg HL] [reg IX]] }
debug set_bp 0xCB99 {} { anota CB99 }
debug set_bp 0xD6B8 {} { anota D6B8 }
debug set_bp 0xC544 {} { anota C544 }
debug set_bp 0x984D {} { anota 984D }

set throttle off
muestrea

proc vuelca {} {
    global OUT FIN
    set f [open "$OUT/replay_pcs_arranque.txt" w]
    foreach k [lsort [dict keys $::pcs0]] { puts $f "$k [dict get $::pcs0 $k]" }
    close $f
    set f [open "$OUT/replay_pcs_naves.txt" w]
    foreach k [lsort [dict keys $::pcs1]] { puts $f "$k [dict get $::pcs1 $k]" }
    close $f
    set f [open "$OUT/replay_pcs_apie.txt" w]
    foreach k [lsort [dict keys $::pcs2]] { puts $f "$k [dict get $::pcs2 $k]" }
    close $f
    set f [open "$OUT/replay_destinos.txt" w]
    foreach k [lsort [dict keys $::dest]] { puts $f "$k [dict get $::dest $k]" }
    close $f
    say "volcados [dict size $::pcs0] PCs de arranque, [dict size $::pcs1] de naves, [dict size $::pcs2] de a pie, [dict size $::dest] destinos"
}

# Se vuelca cada pocos minutos, para no perderlo todo si algo se tuerce, y se
# sale al llegar al final del replay.
proc vigila {} {
    global FIN
    if {[machine_info time] >= $FIN - 1} {
        say "fin del replay"
        vuelca
        exit 0
    }
    vuelca
    after time 120 vigila
}
after time 120 vigila
