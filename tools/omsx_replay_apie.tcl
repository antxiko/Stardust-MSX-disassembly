# Muestrea el PC durante la PARTIDA COMPLETA DE LA FASE DE A PIE.
#
# En que se diferencia de omsx_replay.tcl, que hace lo mismo con el replay de
# Araubi: aquel arranca desde el encendido, pasa por el logo, la pantalla de
# carga, las siete zonas de naves y la multicarga, asi que tiene que separar por
# TIEMPO quien es el dueno de cada direccion -los dos programas viven en las
# mismas- y usa una ventana medida a mano (1575-1775).
#
# Este replay es otra cosa: se grabo partiendo del savestate `stardust_multicarga`,
# o sea con la segunda carga ya empezada, y a partir de ahi es TODO fase de a
# pie. No hay naves que separar. Lo unico que hay que descartar es la carga del
# principio, y eso no hace falta estimarlo por reloj: se sabe EXACTO.
#
# EL CORTE. El bloque [12] son 29861 bytes que van a 0x61D0, asi que su ultimo
# byte cae en 0x61D0 + 29861 - 1 = 0xD674. Cuando ese byte tiene ya su valor de
# la cinta, la segunda parte esta entera en RAM y es la duena de 0x61D0-0xD674.
# Antes de eso no se atribuye nada a nadie.
#
# SE COMPRUEBA SONDEANDO, NO CON UN PUNTO DE OBSERVACION. El primer intento puso
# `debug set_watchpoint write_mem 0xD674` y el emulador se quedo CONGELADO: el
# reloj emulado se paro en seco a los 90 segundos y no volvio a avanzar. Tiene
# sentido: durante la carga entran 29.861 bytes y cada escritura hay que
# contrastarla contra el punto de observacion. El guion equivalente que funciona,
# tools/omsx_replay.tcl, usa solo puntos de interrupcion de EJECUCION.
#
# Asi que se mira el byte cada poco, desde el mismo temporizador que ya vuelca:
# sale gratis y da la misma respuesta.
#
# Uso:  STARDUST_REPLAY=<ruta.omr> STARDUST_OUT=<dir> \
#           openmsx -machine Philips_VG_8020-20 -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
file mkdir $OUT
set L [open "$OUT/apie.log" w]
proc say {m} { global L; puts $L "\[[format %8.2f [machine_info time]]\] $m"; flush $L }

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO: no se pudo cargar el replay"; exit 1 }

array set st [reverse status]
set FIN $st(end)
say "replay cargado, llega hasta t=$FIN"
say "PC al empezar = [format 0x%04X [reg PC]]"

# El final de la carga, medido y no estimado.
# Se comparan los CINCO ultimos bytes, no uno: 0xD670-0xD674 valen FF 00 FD 04 02
# en la cinta y 84 67 C1 10 A0 en lo que deja el bloque de naves, asi que no hay
# forma de confundirlos ni de que el sondeo salte antes de tiempo.
set ::CARGADA 0
set ::COLA {255 0 253 4 2}
proc mira_carga {} {
    if {$::CARGADA} { return }
    set a 0xD670
    foreach v $::COLA {
        if {[debug read memory $a] != $v} { return }
        incr a
    }
    set ::CARGADA 1
    say "0xD670-0xD674 ya son los de la cinta: la segunda parte esta entera en RAM"
}

# Los PC, separados en antes y despues de que termine la carga.
set ::pcs_carga [dict create]
set ::pcs [dict create]
proc muestrea {} {
    if {$::CARGADA} {
        dict incr ::pcs [format "%04X" [reg PC]]
    } else {
        dict incr ::pcs_carga [format "%04X" [reg PC]]
    }
    after time 0.001 muestrea
}

# Los dos saltos indirectos de la segunda parte. El de 0x984D nunca llego a
# dispararse -ni en 300 segundos de arnes ni en el replay de Araubi- y sigue sin
# destino conocido. Una partida jugada hasta el final es la mejor ocasion que ha
# habido de verlo saltar.
set ::dest [dict create]
proc anota {d} { dict incr ::dest [format "%s -> %04X (ix=%04X hl=%04X)" $d [reg HL] [reg IX] [reg HL]] }
debug set_bp 0xC544 {} { anota C544 }
debug set_bp 0x984D {} { anota 984D }

proc sondea {} { mira_carga ; after time 0.5 sondea }
set throttle off
muestrea
sondea

proc vuelca {} {
    global OUT
    set f [open "$OUT/apie_pcs.txt" w]
    foreach k [lsort [dict keys $::pcs]] { puts $f "$k [dict get $::pcs $k]" }
    close $f
    set f [open "$OUT/apie_pcs_carga.txt" w]
    foreach k [lsort [dict keys $::pcs_carga]] { puts $f "$k [dict get $::pcs_carga $k]" }
    close $f
    set f [open "$OUT/apie_destinos.txt" w]
    foreach k [lsort [dict keys $::dest]] { puts $f "$k [dict get $::dest $k]" }
    close $f
    say "volcados [dict size $::pcs] PC de la fase, [dict size $::pcs_carga] de la carga, [dict size $::dest] destinos"
}

# Se vuelca cada poco, para no perderlo todo si algo se tuerce, y se sale al
# llegar al final del replay.
proc vigila {} {
    global FIN
    vuelca
    if {[machine_info time] >= $FIN - 1} {
        say "fin del replay"
        vuelca
        exit 0
    }
    after time 30 vigila
}
after time 30 vigila
