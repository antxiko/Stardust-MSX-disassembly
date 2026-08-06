# CONFIRMA SI EL FINAL FELIZ (la nave insignia explotando vista desde fuera)
# USA LAS MISMAS RUTINAS DE EXPLOSION QUE EL TIEMPO AGOTADO.
#
# Del listado: L_BCEE (tiempo agotado) usa L_BD7B (flash: XOR de los tres
# tercios con los dameros 0x2A54/0x542A) y el bucle de particulas de 0xBD23
# (leer VRAM, and con mascara aleatoria, reescribir: come pixeles). El usuario
# dice que al escapar tambien se ve la nave explotar desde fuera. Si en el
# tramo del final feliz del replay (t=3080-3098, antes del FELICIDADES de
# t=3091) saltan esos mismos bp, es la misma maquinaria.
#
# Uso:  STARDUST_REPLAY=<ruta.omr> STARDUST_OUT=<dir> \
#           openmsx -machine Philips_VG_8020-20 -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
file mkdir $OUT
set LOG [open "$OUT/finalfeliz.log" w]
proc say {m} { global LOG; puts $LOG "\[emu [format %8.2f [machine_info time]]\] $m"; flush $LOG }

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }
set r [catch {reverse goto 3080} msg]
say "reverse goto 3080 rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }

set ::N(flash) 0
set ::N(particulas) 0
set ::N(bcee) 0
debug set_bp 0xBD7B {} { incr ::N(flash) ; if {$::N(flash)<=3} { say "flash L_BD7B (llamada $::N(flash))" } }
debug set_bp 0xBD23 {} { incr ::N(particulas) ; if {$::N(particulas)<=3} { say "particulas 0xBD23 (paso $::N(particulas))" } }
debug set_bp 0xBCEE {} { incr ::N(bcee) ; say "L_BCEE (tiempo agotado) !!" }

proc fin {} {
    say "FIN a t=3098: flash=$::N(flash) particulas=$::N(particulas) bcee=$::N(bcee)"
    exit 0
}
set throttle off
after time 18 fin