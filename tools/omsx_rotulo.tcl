# LEE LAS CADENAS QUE IMPRIME EL ROTULADOR DE LA FASE DE A PIE.
#
# L_B4BC (0xB4BC) imprime una cadena: lee codigos de (IX++) hasta el 0 y llama
# a L_B472 por cada uno. La fuente de 0x5F00 es ASCII (dibujada entera en
# dump/fuente_5f00.png), asi que basta un punto de interrupcion de EJECUCION en
# 0xB4BC que vuelque IX y los bytes de la cadena para saber QUE dice.
#
# OJO: el bp va en 0xB4BC, que es DONDE EMPIEZA la instruccion (un bp en mitad
# de una instruccion no salta nunca; ya se pago una vez con 0xA9AD).
#
# Uso:  STARDUST_REPLAY=<ruta.omr> STARDUST_OUT=<dir> STARDUST_T=<segundo> \
#       [STARDUST_DUR=<segundos emulados>] \
#           openmsx -machine Philips_VG_8020-20 -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
set T $::env(STARDUST_T)
set DUR [expr {[info exists ::env(STARDUST_DUR)] ? $::env(STARDUST_DUR) : 8}]
file mkdir $OUT
set LOG [open "$OUT/rotulo.log" w]
proc say {m} { global LOG; puts $LOG "\[emu [format %8.2f [machine_info time]]\] $m"; flush $LOG }

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }
set r [catch {reverse goto $T} msg]
say "reverse goto $T rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }

set ::VISTAS [dict create]
debug set_bp 0xB4BC {} {
    set ix [reg IX]
    set s ""
    set txt ""
    for {set i 0} {$i < 40} {incr i} {
        set b [debug read memory [expr {$ix+$i}]]
        if {$b == 0} { break }
        append s [format "%02X " $b]
        if {$b >= 32 && $b < 127} { append txt [format %c $b] } else { append txt "?" }
    }
    dict incr ::VISTAS "IX=[format 0x%04X $ix] HL=[format 0x%04X [reg HL]] \[$s\] \"$txt\""
}

proc fin {} {
    global OUT
    set f [open "$OUT/cadenas.txt" w]
    dict for {k n} $::VISTAS { puts $f "x$n  $k" }
    close $f
    say "FIN: [dict size $::VISTAS] cadenas distintas"
    exit 0
}

set throttle off
after time $DUR fin