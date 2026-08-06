# EL ORDEN DE DIBUJO DENTRO DEL CUADRO, EN LA FASE DE NAVES.
#
# QUE SE BUSCA. El usuario, jugando: la nave puede pasar POR DEBAJO del piso
# inferior, y nave y enemigos vuelan por el medio, entre los dos pisos. El fondo
# es UN solo plano (medido con tools/omsx_filas.tcl: +2 filas/cuadro uniforme en
# las 18 tiras), asi que la profundidad no puede ser velocidad: tiene que ser
# ORDEN DE DIBUJO. La hipotesis es que una rutina repinta el decorado ENCIMA de
# los sprites; la candidata es 0xC77B, que lee tiles de un pozo propio
# (0x69F0-0x6BE7) distinto del pozo del blitter (0x6DE0-0x9ADC).
#
# COMO. Un contador global de escrituras al buffer da a cada escritura un numero
# de orden. Por cada PC escritor y cuadro se apunta: cuantas, el primer y el
# ultimo numero de orden, y los rangos de HL y DE. El corte de cuadro es un bp
# de ejecucion en el volcado (0xF3DC). Si los numeros de orden de 0xC77B caen
# DESPUES de los de los sprites (0xC4E4/0xC51B...) dentro del mismo cuadro, y
# sus destinos se solapan, el "pasar por debajo" queda explicado.
#
# Uso:  STARDUST_REPLAY=<ruta.omr> STARDUST_OUT=<dir> STARDUST_T=<segundo> \
#       [STARDUST_DUR=<segundos emulados>] \
#           openmsx -machine Philips_VG_8020-20 -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
set T $::env(STARDUST_T)
set DUR [expr {[info exists ::env(STARDUST_DUR)] ? $::env(STARDUST_DUR) : 6}]
file mkdir $OUT
set LOG [open "$OUT/orden.log" w]
proc say {m} { global LOG; puts $LOG "\[emu [format %8.2f [machine_info time]]\] $m"; flush $LOG }

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }
set r [catch {reverse goto $T} msg]
say "reverse goto $T rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }

set ::SEQ 0
array set ::W {}
set ::FR {}
set ::NF 0

proc apunta {} {
    incr ::SEQ
    set pc [reg PC]
    set hl [reg HL]
    set de [reg DE]
    if {[info exists ::W($pc)]} {
        set r $::W($pc)
        set ::W($pc) [list [expr {[lindex $r 0]+1}] [lindex $r 1] $::SEQ \
            [expr {min([lindex $r 3],$hl)}] [expr {max([lindex $r 4],$hl)}] \
            [expr {min([lindex $r 5],$de)}] [expr {max([lindex $r 6],$de)}]]
    } else {
        set ::W($pc) [list 1 $::SEQ $::SEQ $hl $hl $de $de]
    }
}
debug set_watchpoint write_mem {0x4000 0x4EFF} {} { apunta }

proc instantanea {} {
    lappend ::FR [list [machine_info time] [array get ::W]]
    array unset ::W
    array set ::W {}
    incr ::NF
}
debug set_bp 0xF3DC {} { instantanea }

proc vuelca {} {
    global OUT
    set f [open "$OUT/orden.txt" w]
    puts $f "# por cuadro: PC escritor | escrituras | orden primera-ultima | HL de-a | DE de-a"
    set n 0
    foreach fr $::FR {
        puts $f "# cuadro $n t=[format %.3f [lindex $fr 0]]"
        array unset X ; array set X [lindex $fr 1]
        foreach pc [lsort -integer [array names X]] {
            set r $X($pc)
            puts $f [format "  0x%04X %6d   %7d-%-7d   0x%04X-0x%04X   0x%04X-0x%04X" \
                $pc [lindex $r 0] [lindex $r 1] [lindex $r 2] \
                [lindex $r 3] [lindex $r 4] [lindex $r 5] [lindex $r 6]]
        }
        incr n
    }
    close $f
    say "volcados $::NF cuadros"
}

set ::lat 0
proc latido {} {
    incr ::lat 5
    say "latido: $::lat s reales, $::NF cuadros, seq=$::SEQ"
    after realtime 5 latido
}

proc fin {} { vuelca ; say "FIN" ; exit 0 }

set throttle off
after realtime 5 latido
after time $DUR fin