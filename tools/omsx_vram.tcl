# De donde salen los graficos: seguir el camino RAM -> VRAM.
#
# La idea no es mia, es de un lector: en vez de adivinar geometrias sobre los
# datos, localizar las ESCRITURAS EN VRAM, ver de que direccion de RAM viene
# cada una, y considerar esas posiciones el buffer de la tabla de patrones.
# Cualquier rutina que escriba ahi es, por definicion, rutina de dibujado.
#
# Se vigila el puerto 0x98, que es por donde el VDP recibe los datos. De cada
# escritura se apunta QUIEN la hace (el PC) y con que registros, que es lo que
# delata el origen.
set OUT $::env(STARDUST_OUT)
set LOG [open "$OUT/vram.log" w]
proc say {m} { global LOG; puts $LOG $m; flush $LOG }

set ::porpc [dict create]      ;# PC que escribe -> cuantas veces
set ::hlpc  [dict create]      ;# PC -> rango de HL visto

set throttle off
loadstate stardust_juego

debug set_watchpoint write_io 0x98 {} {
    set pc [format "%04X" [reg PC]]
    dict incr ::porpc $pc
    set hl [reg HL]
    if {[dict exists $::hlpc $pc]} {
        set r [dict get $::hlpc $pc]
        set lo [lindex $r 0] ; set hi [lindex $r 1]
        if {$hl < $lo} { set lo $hl }
        if {$hl > $hi} { set hi $hl }
        dict set ::hlpc $pc [list $lo $hi]
    } else {
        dict set ::hlpc $pc [list $hl $hl]
    }
}

proc aporrea {} {
    keymatrixdown 8 1
    after time 0.15 { keymatrixup 8 1 }
    after time 1.5 aporrea
}
after time 2 aporrea

after time 120 {
    say "PC que escriben en VRAM (puerto 0x98), y el rango de HL que tenian:"
    foreach pc [lsort [dict keys $::porpc]] {
        set r [dict get $::hlpc $pc]
        say [format "  PC=0x%s  %7d escrituras   hl de 0x%04X a 0x%04X" \
             $pc [dict get $::porpc $pc] [lindex $r 0] [lindex $r 1]]
    }
    exit 0
}
