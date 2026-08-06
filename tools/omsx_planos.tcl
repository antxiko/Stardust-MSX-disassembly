# Busca los dos contadores de scroll de la fase de a pie, midiendo SOBRE UNA
# PARTIDA DE VERDAD.
#
# QUE SE BUSCA. Un jugador conto que la fase de a pie tiene DOS PISOS que
# scrollean a velocidades distintas -el de abajo mas lento-, dando sensacion de
# profundidad. Si eso es asi, en memoria tiene que haber dos posiciones que
# avancen a ritmos distintos.
#
# POR QUE NO SE LEE DEL LISTADO. Se busco primero la firma de un acumulador de
# 16 bits (`ld hl,(nn) / add hl,de / ld (nn),hl`) y no hay ni uno en el bloque,
# asi que los contadores son de 8 bits y hay cientos de candidatos.
#
# POR QUE SOBRE EL REPLAY Y NO SOBRE UN SAVESTATE. Los dos primeros intentos
# partieron del savestate `stardust_parte2` sintetizando pulsaciones a mano, y
# los dos salieron en blanco:
#   - el primero pulsaba la flecha derecha, y este juego trae la disposicion del
#     ZX Spectrum (Q-A-O-P-espacio), asi que el personaje no se movio;
#   - el segundo pulsaba la P, la buena, y tampoco: desde ese savestate el
#     personaje no arranca a andar solo por tener la tecla apretada.
# Con una partida grabada por alguien que se paso el juego no hay nada que
# suponer: el personaje anda porque anduvo, y el escenario se mueve porque se
# movio. Es la diferencia entre reproducir y simular.
#
# Uso:  STARDUST_REPLAY=<ruta.omr> STARDUST_OUT=<dir> STARDUST_T=<segundo> \
#           openmsx -machine Philips_VG_8020-20 -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
set T $::env(STARDUST_T)
file mkdir $OUT
set LOG [open "$OUT/planos.log" w]
proc say {m} { global LOG; puts $LOG "\[[format %8.2f [machine_info time]]\] $m"; flush $LOG }

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }

set r [catch {reverse goto $T} msg]
say "reverse goto $T rc=$r: $msg"
say "PC=[format 0x%04X [reg PC]]"

# Se muestrea EL BUFFER DE PANTALLA, no la RAM entera. La medida de la VRAM
# (tools/omsx_vram_apie.tcl) dejo claro que los dos planos no se distinguen ahi:
# una sola rutina, la de 0xD3B3, vuelca el buffer entero con 595.200 escrituras,
# o sea que los planos se componen ANTES, en RAM. Asi que hay que mirar el
# buffer: si un plano va mas lento que el otro, sus filas se desplazaran a menos
# velocidad, y eso se ve fila a fila.
# EL BUFFER ENTERO, no el ultimo cuarto. La primera version muestreaba
# 0x4B40-0x4EFF (960 bytes), que es el tamano del buffer de la PARTE DE NAVES.
# El de la fase de a pie es mas grande: la medida de la VRAM
# (tools/omsx_vram_apie.tcl) dice que la rutina de volcado 0xD3B3 lee con HL
# entre 0x4000 y 0x4EFF, o sea 3840 bytes. Mirando solo el ultimo cuarto no
# aparecian ni las franjas de sombra del piso inferior ni nada reconocible.
set INI 0x4000
set N   [expr {0x4F00 - $INI}]

set ::fotos {}
proc foto {} {
    global INI N
    lappend ::fotos [debug read_block memory $INI $N]
    if {[llength $::fotos] >= 200} { vuelca ; exit 0 }
    after time 0.02 foto       ;# un fotograma a 50 Hz
}

proc vuelca {} {
    global OUT INI N
    set f [open "$OUT/planos.bin" wb]
    fconfigure $f -translation binary
    foreach b $::fotos { puts -nonewline $f $b }
    close $f
    say "volcadas [llength $::fotos] fotos de $N bytes desde [format 0x%04X $INI]"
}

set throttle off
foto
