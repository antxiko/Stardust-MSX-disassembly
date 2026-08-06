# De donde sale cada plano de la fase de a pie: seguir el camino RAM -> VRAM.
#
# Es el metodo que ya funciono con la parte de naves (tools/omsx_vram.tcl), con
# dos diferencias que aqui importan:
#
#   1. Se corre sobre el REPLAY de una partida de verdad, no sobre un arnes que
#      aporrea el disparo. Un arnes no hace andar al personaje, y sin andar no
#      hay scroll que separar.
#
#   2. Se sigue tambien el PUERTO 0x99, no solo el 0x98. El 0x98 es por donde
#      entran los datos y dice QUIEN dibuja; el 0x99 es por donde se fija la
#      direccion de destino y dice DONDE. Sin el segundo no se pueden separar
#      dos planos: los dos escriben, y lo que los distingue es a que altura de
#      la pantalla lo hacen.
#
# El protocolo del VDP para escribir: se manda por 0x99 el byte bajo de la
# direccion y luego el alto con el bit 6 puesto; a partir de ahi cada byte
# metido por 0x98 se escribe y la direccion se autoincrementa.
#
# Uso:  STARDUST_REPLAY=<ruta.omr> STARDUST_OUT=<dir> STARDUST_T=<segundo> \
#           openmsx -machine Philips_VG_8020-20 -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
set T $::env(STARDUST_T)
file mkdir $OUT
set LOG [open "$OUT/vram.log" w]
proc say {m} { global LOG; puts $LOG $m; flush $LOG }

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }
set r [catch {reverse goto $T} msg]
say "reverse goto $T rc=$r: $msg"
say "PC al empezar = [format 0x%04X [reg PC]]"

# Reconstruccion de la direccion del VDP a partir del puerto 0x99.
set ::vdp 0
set ::medio 0
set ::bajo 0
debug set_watchpoint write_io 0x99 {} {
    set v $::wp_last_value
    if {$::medio} {
        if {($v & 0x80) == 0} { set ::vdp [expr {(($v & 0x3F) << 8) | $::bajo}] }
        set ::medio 0
    } else {
        set ::bajo $v
        set ::medio 1
    }
}

# Cada escritura de datos: quien la hace, de donde viene y a donde va.
set ::porpc [dict create]
proc anota {} {
    set pc [format "%04X" [reg PC]]
    set hl [reg HL]
    set v  $::vdp
    if {[dict exists $::porpc $pc]} {
        set r [dict get $::porpc $pc]
        dict set ::porpc $pc [list [expr {[lindex $r 0]+1}] \
            [expr {min([lindex $r 1],$hl)}] [expr {max([lindex $r 2],$hl)}] \
            [expr {min([lindex $r 3],$v)}]  [expr {max([lindex $r 4],$v)}]]
    } else {
        dict set ::porpc $pc [list 1 $hl $hl $v $v]
    }
    incr ::vdp
}
debug set_watchpoint write_io 0x98 {} { anota }

set throttle off

after time 20 {
    say ""
    say "PC que escribe | veces | rango de HL (origen en RAM) | rango de VRAM (destino)"
    say "-----------------------------------------------------------------------------"
    foreach pc [lsort -command {apply {{a b} {expr {[llength $a]}}}} [dict keys $::porpc]] {}
    set filas {}
    dict for {pc r} $::porpc { lappend filas [list [lindex $r 0] $pc $r] }
    foreach f [lsort -integer -decreasing -index 0 $filas] {
        set pc [lindex $f 1] ; set r [lindex $f 2]
        say [format "  0x%s  %8d   0x%04X-0x%04X   0x%04X-0x%04X" $pc [lindex $r 0] \
             [lindex $r 1] [lindex $r 2] [lindex $r 3] [lindex $r 4]]
    }
    exit 0
}
