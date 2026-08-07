# QUIEN ESCRIBE Y QUIEN LEE 0xAD2A / 0xAD2C / 0xACE9 (fase a pie).
#
# POR QUE. 0xAD2A es la fila gruesa del scroll (71->0, medida). 0xAD2C oscila
# entre 2 y 32 en partida y la hipotesis es "ajuste fino del scroll": las celdas
# del mapa son de 16 px de alto y el fondo se mueve 2 px por cuadro, asi que
# 2-32 en pasos de 2 seria justo una celda. Y 0xACE9 se mueve solo a veces al
# andar y NO es la posicion del scroll (t=2535-2537: fondo moviendose con el
# clavado en 86); si la tabla de objetos empieza en 0xACE4 con 46 bytes por
# objeto, 0xACE9 es el campo +5 del objeto 0.
#
# QUE MIDE. Sobre el replay de la partida real, en una ventana donde el usuario
# ANDA y el fondo se mueve (comprobado antes de medir, regla de la casa):
#   - cada ESCRITURA a las tres direcciones: reloj, PC y valor escrito;
#   - cada LECTURA de 0xAD2C y 0xACE9: solo el PC, contado (para los consumidores);
#   - y una sonda cada 0,1 s con el valor de las tres a la vez, para correlarlas.
#
# OJO con el PC que reporta un watchpoint: cae EN MITAD de la instruccion.
# Para anclarlo al listado hay que buscar la instruccion que EMPIEZA antes.
#
# Los watchpoints se arman DESPUES del goto, para no tragarse el catch-up.
# Callbacks baratos (lappend/dict incr en crudo, sin format): es lo que no
# congela el emulador en juego normal.
#
# Uso:  STARDUST_REPLAY=<ruta.omr> STARDUST_OUT=<dir> \
#       [STARDUST_T=<inicio>] [STARDUST_FIN=<final>] \
#           openmsx -machine Philips_VG_8020-20 -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
file mkdir $OUT
set LOG [open "$OUT/ad2c.log" w]
proc say {m} { global LOG; puts $LOG "\[emu [format %8.2f [machine_info time]]\] $m"; flush $LOG }

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }
array set st [reverse status]
set T   [expr {[info exists ::env(STARDUST_T)]   ? $::env(STARDUST_T)   : 2520}]
set FIN [expr {[info exists ::env(STARDUST_FIN)] ? $::env(STARDUST_FIN) : $T + 45}]
say "replay hasta t=$st(end); ventana $T-$FIN"

set r [catch {reverse goto $T} msg]
say "reverse goto $T rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }

# COMPROBAR QUE PASA LO QUE SE QUIERE MEDIR: el blitter de fondo tiene que
# estar escribiendo (si no, la ventana es menu/carga y la medida no vale).
# OJO: en 0xA9AC, donde EMPIEZA el ldi. La primera pasada de este guion puso
# 0xA9AD -copiado de un log de watchpoint- y salio blitter=0: la trampa
# documentada del bp en el segundo byte, pagada por segunda vez.
set ::BLIT 0
debug set_bp 0xA9AC {} { incr ::BLIT }

# Escrituras: reloj (centesimas, entero), PC y valor, en crudo.
set ::wAD2A {}
set ::wAD2C {}
set ::wACE9 {}
debug set_watchpoint write_mem 0xAD2A {} { lappend ::wAD2A [expr {int([machine_info time]*100)}] [reg PC] $::wp_last_value }
debug set_watchpoint write_mem 0xAD2C {} { lappend ::wAD2C [expr {int([machine_info time]*100)}] [reg PC] $::wp_last_value }
debug set_watchpoint write_mem 0xACE9 {} { lappend ::wACE9 [expr {int([machine_info time]*100)}] [reg PC] $::wp_last_value }

# Lecturas: solo quien (PC), contado.
set ::rAD2C [dict create]
set ::rACE9 [dict create]
debug set_watchpoint read_mem 0xAD2C {} { dict incr ::rAD2C [reg PC] }
debug set_watchpoint read_mem 0xACE9 {} { dict incr ::rACE9 [reg PC] }

# La sonda que correla las tres.
set ::TL {}
proc sonda {} {
    lappend ::TL [list [format %.2f [machine_info time]] \
        [debug read memory 0xAD2A] [debug read memory 0xAD2C] [debug read memory 0xACE9]]
    after time 0.1 sonda
}
sonda

proc vuelca {} {
    global OUT
    set f [open "$OUT/escrituras.txt" w]
    foreach {var lst} [list AD2A $::wAD2A AD2C $::wAD2C ACE9 $::wACE9] {
        foreach {t pc v} $lst { puts $f "$var t=[expr {$t/100.0}] pc=[format %04X $pc] val=$v" }
    }
    close $f
    set f [open "$OUT/lectores.txt" w]
    foreach {nom d} [list AD2C $::rAD2C ACE9 $::rACE9] {
        foreach pc [lsort -integer [dict keys $d]] { puts $f "$nom pc=[format %04X $pc] n=[dict get $d $pc]" }
    }
    close $f
    set f [open "$OUT/sonda.txt" w]
    foreach s $::TL { puts $f $s }
    close $f
}

proc vigila {} {
    global FIN
    vuelca
    say "blitter=$::BLIT escrituras: AD2A=[expr {[llength $::wAD2A]/3}] AD2C=[expr {[llength $::wAD2C]/3}] ACE9=[expr {[llength $::wACE9]/3}]"
    set ::BLIT 0
    if {[machine_info time] >= $FIN} { say "FIN"; vuelca; exit 0 }
    after time 5 vigila
}
after time 5 vigila
set throttle off
