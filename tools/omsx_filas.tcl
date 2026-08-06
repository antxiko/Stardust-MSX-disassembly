# EL DESPLAZAMIENTO EXACTO DE CADA BANDA, MEDIDO SIN MIRAR LA IMAGEN.
#
# POR QUE HACE FALTA OTRA MEDIDA. tools/omsx_bandas.tcl ya dijo QUIEN escribe en
# el buffer, y con el escenario en marcha (t=2535) enseno que el maximo del
# origen que lee el blitter de fondo baja de 8 en 8 y que la MISMA secuencia de
# valores pasa por la banda A, luego por la B y luego por la C. Eso es contenido
# bajando por la pantalla. Pero el maximo es UN solo numero por banda: si hubiera
# un segundo plano dibujado con graficos de direccion mas baja, no saldria ahi.
#
# LA MEDIDA BUENA. El blitter copia 4 bytes por fila con paso 24, o sea que
# dibuja TIRAS de 4 columnas (0-3, 4-7, ... 20-23). Para cada escritura se sabe
# el destino (DE) y el origen (HL), asi que se puede levantar, cuadro a cuadro,
# la tabla completa "fila -> de donde se leyo". Comparando esa tabla entre dos
# cuadros seguidos, el desplazamiento sale por igualdad exacta de enteros: si la
# fila 20 de este cuadro lee lo que la fila 18 leia en el anterior, la banda se
# ha movido 2 filas. Nada de correlar imagenes, que es lo que fallo ocho veces.
#
# Y como se levanta por TIRA DE COLUMNAS ademas de por banda, si hay dos planos a
# velocidades distintas conviviendo, salen como dos desplazamientos distintos.
#
# EL CORTE ENTRE CUADROS NO SE ESTIMA POR RELOJ. La rutina de volcado 0xD383 se
# ejecuta una vez por cuadro para pasar el buffer a la VRAM, asi que un punto de
# interrupcion de EJECUCION ahi marca el limite exacto. (Los de ejecucion no dan
# problemas; los de escritura sobre rangos grandes son los que hay que vigilar.)
# De paso confirma el ritmo: la medida anterior dio 1344/1536/960 escrituras por
# decima de segundo, que es EXACTAMENTE el tamano de cada banda, o sea que el
# juego redibuja el buffer entero 10 veces por segundo.
#
# VALE PARA LAS DOS FASES. Cada una tiene su blitter y su volcado, con la misma
# estructura (4 `ldi` por tira, tres bandas, mismo reparto 1344/1536/960):
#   a pie:  blitter 0xA9AC (primer ldi escribe con PC=0xA9AD), volcado 0xD383
#   naves:  blitter 0xC3F2 (primer ldi escribe con PC=0xC3F4), volcado 0xF3DC
# Por defecto va con la de a pie; STARDUST_BLIT y STARDUST_VOLCADO lo cambian.
#
# Uso:  STARDUST_REPLAY=<ruta.omr> STARDUST_OUT=<dir> STARDUST_T=<segundo> \
#       [STARDUST_DUR=<segundos emulados>] \
#       [STARDUST_BLIT=0xC3F4 STARDUST_VOLCADO=0xF3DC] \
#           openmsx -machine Philips_VG_8020-20 -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
set T $::env(STARDUST_T)
set DUR [expr {[info exists ::env(STARDUST_DUR)] ? $::env(STARDUST_DUR) : 10}]
set ::BLIT [expr {[info exists ::env(STARDUST_BLIT)] ? $::env(STARDUST_BLIT) : 0xA9AD}]
set VOLCADO [expr {[info exists ::env(STARDUST_VOLCADO)] ? $::env(STARDUST_VOLCADO) : 0xD383}]
file mkdir $OUT
set LOG [open "$OUT/filas.log" w]
proc say {m} { global LOG; puts $LOG "\[emu [format %8.2f [machine_info time]]\] $m"; flush $LOG }

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }
set r [catch {reverse goto $T} msg]
say "reverse goto $T rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }
say "PC tras el goto = [format 0x%04X [reg PC]]"

array set ::CUR {}
set ::FR {}
set ::NF 0

# El damero (0xB48E) es el unico escritor que no pasa por el blitter y pinta
# SOLO en la banda C; en t=2400 estaba activo y en t=2535 no aparecio, asi que
# es el candidato a "otro plano" y hay que verlo POR CUADRO: cuantas escrituras
# y en que rango de destino (aqui el destino es HL, que las suyas son ld (hl),a).
set ::DAM 0
set ::DMIN 65536
set ::DMAX 0

# Solo el PRIMER `ldi` de los cuatro (0xA9AD): asi se apunta una vez por tira de
# 4 bytes, con el destino alineado al principio de la tira.
debug set_watchpoint write_mem {0x4000 0x453F} {} {
    if {[reg PC] == $::BLIT} { set ::CUR(A,[expr {[reg DE]-0x4000}]) [reg HL] }
}
debug set_watchpoint write_mem {0x4540 0x4B3F} {} {
    if {[reg PC] == $::BLIT} { set ::CUR(B,[expr {[reg DE]-0x4540}]) [reg HL] }
}
debug set_watchpoint write_mem {0x4B40 0x4EFF} {} {
    set pc [reg PC]
    if {$pc == $::BLIT} {
        set ::CUR(C,[expr {[reg DE]-0x4B40}]) [reg HL]
    } elseif {$pc >= 0xB48E && $pc <= 0xB4B8} {
        incr ::DAM
        set hl [reg HL]
        if {$hl < $::DMIN} { set ::DMIN $hl }
        if {$hl > $::DMAX} { set ::DMAX $hl }
    }
}

# El limite de cuadro: el volcado a la VRAM.
proc instantanea {} {
    lappend ::FR [list [machine_info time] [array get ::CUR] $::DAM $::DMIN $::DMAX]
    array unset ::CUR
    array set ::CUR {}
    set ::DAM 0 ; set ::DMIN 65536 ; set ::DMAX 0
    incr ::NF
}
debug set_bp $VOLCADO {} { instantanea }

proc vuelca {} {
    global OUT
    set f [open "$OUT/filas.txt" w]
    puts $f "# fila -> origen leido por el blitter de fondo, por banda y tira de columnas"
    puts $f "# una linea por (cuadro, banda, tira); ---- = esa fila no se dibujo en ese cuadro"
    set n 0
    foreach fr $::FR {
        array unset X ; array set X [lindex $fr 1]
        puts $f "# cuadro $n t=[format %.3f [lindex $fr 0]] damero=[lindex $fr 2] hl=[format 0x%04X [lindex $fr 3]]-[format 0x%04X [lindex $fr 4]]"
        foreach {b alto} {A 56 B 64 C 40} {
            for {set c 0} {$c < 24} {incr c 4} {
                set l {}
                for {set r 0} {$r < $alto} {incr r} {
                    set off [expr {$r*24 + $c}]
                    if {[info exists X($b,$off)]} {
                        lappend l [format %04X $X($b,$off)]
                    } else {
                        lappend l "----"
                    }
                }
                puts $f "$b $c $l"
            }
        }
        incr n
    }
    close $f
    say "volcados $::NF cuadros"
}

set ::lat 0
proc latido {} {
    incr ::lat 5
    say "latido: $::lat s reales, $::NF cuadros"
    after realtime 5 latido
}

proc fin {} { vuelca ; say "FIN" ; exit 0 }

set throttle off
after realtime 5 latido
after time $DUR fin
