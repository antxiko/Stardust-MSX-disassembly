# LAS DOS VIAS DE MUERTE DEL JUGADOR EN LA FASE A PIE, Y EL DOBLE PASE DEL FONDO.
#
# QUE CONFIRMA (leido del listado, aqui se contrasta en vivo):
#   - Muerte por CAIDA: consulta_mapa en 0xA665 con la posicion del jugador; si
#     la celda es vacia, 0xA66C escribe 0xA6ED=4. Unico punto de esa via.
#   - Muerte por IMPACTO (escudo agotado): L_B11B, que escribe estado=4 en 0xB123.
#   - Embudo comun: 0xA528 descuenta la vida de 0xC45F cuando 0xA6ED >= 0x2D.
#   - L_B1BE NO es del jugador: su unico llamador es 0xB20F (voladores anidando),
#     o sea que el retorno en la pila debe ser SIEMPRE 0xB212.
#   - El fondo se pinta en DOS pasadas parcheando el opcode de 0xA98E: 0xC2
#     (jp nz: solo celdas VACIAS, con el tile 0 rotante = estrellas) antes del
#     call de 0xA4AA, y 0xCA (jp z: solo solidas) antes del de 0xA4B5.
#
# Uso:  STARDUST_REPLAY=<ruta.omr> STARDUST_OUT=<dir> \
#       [STARDUST_T=<inicio>] [STARDUST_FIN=<final>] \
#           openmsx -machine Philips_VG_8020-20 -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
file mkdir $OUT
set LOG [open "$OUT/muerte.log" w]
proc say {m} { global LOG; puts $LOG "\[emu [format %8.2f [machine_info time]]\] $m"; flush $LOG }

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }
array set st [reverse status]
set T   [expr {[info exists ::env(STARDUST_T)]   ? $::env(STARDUST_T)   : 2464}]
set FIN [expr {[info exists ::env(STARDUST_FIN)] ? $::env(STARDUST_FIN) : 3100}]
say "replay hasta t=$st(end); ventana $T-$FIN"
set r [catch {reverse goto $T} msg]
say "reverse goto $T rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }

# Las muertes: se apuntan con reloj, posicion y scroll.
debug set_bp 0xA66C {} {
    say "CAIDA: jugador=[format %04X [debug read memory 0xA6EB]][format %02X [debug read memory 0xA6EC]] fila=[debug read memory 0xAD2A] fino=[debug read memory 0xAD2C]"
}
debug set_bp 0xB123 {} {
    say "IMPACTO: jugador=[format %02X [debug read memory 0xA6EB]]/[format %02X [debug read memory 0xA6EC]] fila=[debug read memory 0xAD2A]"
}
debug set_bp 0xA528 {} {
    say "VIDA--: C45F=[debug read memory 0xC45F] antes de restar"
}
debug set_bp 0xA44F {} {
    say "RESPAWN: vuelve a=[format %02X [debug read memory 0xA6E9]]/[format %02X [debug read memory 0xA6EA]] fila_chk=[debug read memory 0xC466]"
}

# L_B1BE: el retorno en la pila, contado en crudo (la afirmacion: siempre 0xB212).
set ::b1be [dict create]
debug set_bp 0xB1BE {} {
    dict incr ::b1be [expr {[debug read memory [reg SP]] | ([debug read memory [expr {[reg SP]+1}]] << 8)}]
}

# El doble pase: que opcode hay en 0xA98E en cada uno de los dos call.
set ::pase1_c2 0 ; set ::pase1_mal 0
set ::pase2_ca 0 ; set ::pase2_mal 0
debug set_bp 0xA4AA {} {
    if {[debug read memory 0xA98E] == 0xC2} { incr ::pase1_c2 } else { incr ::pase1_mal }
}
debug set_bp 0xA4B5 {} {
    if {[debug read memory 0xA98E] == 0xCA} { incr ::pase2_ca } else { incr ::pase2_mal }
}

proc vigila {} {
    global FIN
    set l {}
    dict for {k v} $::b1be { lappend l "[format %04X $k]:$v" }
    say "pases C2/mal=$::pase1_c2/$::pase1_mal CA/mal=$::pase2_ca/$::pase2_mal  B1BE_ret={$l}"
    if {[machine_info time] >= $FIN} { say "FIN"; exit 0 }
    after time 30 vigila
}
after time 30 vigila
set throttle off
