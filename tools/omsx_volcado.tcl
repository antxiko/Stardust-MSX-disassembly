# VUELCA UN TROZO DE LA RAM EN UN INSTANTE DE UN REPLAY
#
# Para que sirve: contestar "que programa hay ahi dentro" sin discutir. En esta
# cinta los bloques SE SOLAPAN -la segunda parte se carga encima de la primera-,
# asi que la unica manera limpia de saber cual de los dos esta en memoria es
# sacar los bytes y compararlos con los de la cinta.
#
# Uso:  STARDUST_REPLAY=<ruta.omr> STARDUST_OUT=<dir> STARDUST_T=<instante> \
#       STARDUST_DE=<0xAAAA> STARDUST_A=<0xBBBB> \
#           openmsx -machine <maquina> -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
file mkdir $OUT
set LOG [open "$OUT/volcado.log" w]
proc say {m} { global LOG; puts $LOG "\[emu [format %8.2f [machine_info time]]\] $m"; flush $LOG }

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }
set T $::env(STARDUST_T)
set r [catch {reverse goto $T} msg]
say "goto $T rc=$r: $msg"

set DE [expr $::env(STARDUST_DE)]
set A  [expr $::env(STARDUST_A)]
set f [open "$OUT/ram.bin" wb]
fconfigure $f -translation binary
for {set d $DE} {$d < $A} {incr d} {
    puts -nonewline $f [binary format c [debug read memory $d]]
}
close $f
say [format "volcados %d bytes de 0x%04X a 0x%04X en %s/ram.bin" [expr {$A - $DE}] $DE $A $OUT]
say [format "PC=0x%04X  SP=0x%04X" [reg PC] [reg SP]]
say "FIN"
exit 0
