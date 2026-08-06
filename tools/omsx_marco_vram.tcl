# VIGILA LAS CELDAS DEL MARCO EN LA VRAM, MUESTREANDO, PARA CAZAR LA CUENTA
# ATRAS DE LAS TORRETAS.
#
# POR QUE ASI. La cuenta atras "sale en el marco" (dato del usuario) pero no
# pasa por el impresor L_D252 (cero llamadas en toda la partida, medido) y en
# las ventanas de 20 s vigiladas con el puerto 0x98 solo escribia el volcado
# del buffer. O se pinta una sola vez al matar cada torreta -y una ventana
# corta se la pierde-, o la pinta algo que no se ha mirado. En vez de adivinar
# el momento, se muestrea la VRAM ENTERA de la tabla de patrones cada medio
# segundo y se apunta que celda del MARCO cambia y cuando. Con el momento
# exacto, cazar al escritor es una segunda pasada dirigida.
#
# LA GEOMETRIA. El volcado del buffer escribe la ventana de juego: 24 columnas
# de tile (1-24) por 20 filas (1-20), VRAM 0x0108-0x16E7. El marco es el resto:
# la fila 0, las filas 21-23 y las columnas 0 y 25-31. Son 288 celdas de 8
# bytes. En SCREEN 2 la celda (fila,col) esta en fila*256 + col*8.
#
# Uso:  STARDUST_REPLAY=<ruta.omr> STARDUST_OUT=<dir> STARDUST_T=<segundo> \
#       [STARDUST_DUR=<segundos emulados>] \
#           openmsx -machine Philips_VG_8020-20 -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
set T $::env(STARDUST_T)
set DUR [expr {[info exists ::env(STARDUST_DUR)] ? $::env(STARDUST_DUR) : 660}]
file mkdir $OUT
set LOG [open "$OUT/marco_vram.log" w]
proc say {m} { global LOG; puts $LOG "\[emu [format %8.2f [machine_info time]]\] $m"; flush $LOG }

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }
set r [catch {reverse goto $T} msg]
say "reverse goto $T rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }

# El nombre del debuggable de la VRAM cambia entre versiones de openMSX:
# se prueba y se apunta cual es.
set ::VDEV ""
foreach cand {"physical VRAM" "VRAM" "VDP VRAM"} {
    if {![catch {debug read_block $cand 0 8}]} { set ::VDEV $cand ; break }
}
if {$::VDEV eq ""} {
    say "ABORTADO: no hay debuggable de VRAM; debug list = [debug list]"
    exit 1
}
say "VRAM via debuggable \"$::VDEV\""

# Las celdas del marco.
set ::CELDAS {}
for {set f 0} {$f < 24} {incr f} {
    for {set c 0} {$c < 32} {incr c} {
        if {$f >= 1 && $f <= 20 && $c >= 1 && $c <= 24} { continue }
        lappend ::CELDAS [list $f $c [expr {$f*256 + $c*8}]]
    }
}
say "[llength $::CELDAS] celdas de marco vigiladas"

array set ::PREV {}
set ::CAMBIOS {}
proc mira {} {
    set tabla [debug read_block $::VDEV 0 0x1800]
    foreach cel $::CELDAS {
        lassign $cel f c addr
        set v [string range $tabla $addr [expr {$addr+7}]]
        if {[info exists ::PREV($addr)] && $v ne $::PREV($addr)} {
            binary scan $v H16 hx
            lappend ::CAMBIOS [list [machine_info time] $f $c $addr $hx]
        }
        set ::PREV($addr) $v
    }
    after time 0.5 mira
}

proc vuelca {} {
    global OUT
    set f [open "$OUT/cambios.txt" w]
    puts $f "# t | fila,col del tile | direccion VRAM | contenido nuevo (hex)"
    foreach r $::CAMBIOS {
        puts $f [format "%9.2f  %2d,%2d  0x%04X  %s" [lindex $r 0] [lindex $r 1] \
            [lindex $r 2] [lindex $r 3] [lindex $r 4]]
    }
    close $f
}

set ::lat 0
proc latido {} {
    incr ::lat 30
    say "latido: $::lat s reales, t emulado [format %.1f [machine_info time]], [llength $::CAMBIOS] cambios"
    vuelca
    after realtime 30 latido
}

proc fin {} { vuelca ; say "FIN: [llength $::CAMBIOS] cambios de celda en el marco" ; exit 0 }

set throttle off
mira
after realtime 30 latido
after time $DUR fin