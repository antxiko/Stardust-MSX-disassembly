# ¿LLEGA A ENTRAR LA SEGUNDA PARTE, Y QUIEN LA METE?
#
# Complemento de omsx_quien_carga.tcl, que dejo el asunto a medias: aquel
# arranca del savestate 'stardust_multicarga', que esta guardado con PC=0xF849,
# o sea DENTRO de la rutina de carga (0xF7F6-0xF89E). Por eso un breakpoint en
# su entrada no puede saltar: se entro antes de guardar. Eso explica el "no
# salto ni una vez" que llevaba meses figurando como contradiccion.
#
# Lo que falta por comprobar es lo otro: que desde ese punto la carga TERMINA y
# lo que entra en 0x61D0 es el bloque [12] de la cinta. Para eso:
#   - se vigila el avance mirando el puntero IX, que es donde la rutina guarda
#     (`ld (ix+000h),l` en 0xF848), en vez de poner watchpoints sobre 29861
#     bytes;
#   - se compara periodicamente la memoria con el bloque de la cinta;
#   - y se apunta donde cae el PC, separando la rutina de carga del resto.
#
# Uso:  STARDUST_OUT=<dir> openmsx -machine <maquina> -script este.tcl
set OUT $::env(STARDUST_OUT)
file mkdir $OUT
set LOG [open "$OUT/carga2.log" w]
proc say {m} { global LOG; puts $LOG "\[[format %8.2f [machine_info time]]\] $m"; flush $LOG }

set r [catch {loadstate stardust_multicarga} msg]
say "loadstate rc=$r $msg"
if {$r} { say "ABORTADO"; exit 1 }
say "PC de partida = [format 0x%04X [reg PC]]   IX = [format 0x%04X [reg IX]]"
say "la rutina de carga vive en 0xF7F6-0xF89E, o sea que se arranca DENTRO"

# Que hay en el reproductor de cinta: sin cinta no hay carga que valga, y
# conviene saberlo antes de interpretar un cero.
set r [catch {cassetteplayer} msg]
say "cassetteplayer rc=$r: $msg"

# El puntero de escritura de la rutina. Su avance ES el progreso de la carga.
set ::ixmin 0xFFFF ; set ::ixmax 0
proc mira {} {
    set ix [reg IX]
    if {$ix < $::ixmin} { set ::ixmin $ix }
    if {$ix > $::ixmax} { set ::ixmax $ix }
    after time 0.05 mira
}
mira

# Donde esta el procesador, separando la rutina de carga del resto.
set ::pc(carga) 0 ; set ::pc(rom) 0 ; set ::pc(otro) 0
proc muestrea {} {
    set pc [reg PC]
    if {$pc >= 0xF7F6 && $pc <= 0xF89E} { incr ::pc(carga) } \
    elseif {$pc < 0x4000} { incr ::pc(rom) } \
    else { incr ::pc(otro) }
    after time 0.002 muestrea
}
muestrea

proc coteja {cuando {volcar 0}} {
    global OUT
    if {$volcar} {
        set mem [debug read_block memory 0x61D0 29861]
        set f [open "$OUT/mem61d0_$cuando.bin" w]
        fconfigure $f -translation binary
        puts -nonewline $f $mem
        close $f
    }
    say "t=$cuando: IX ha recorrido [format 0x%04X $::ixmin]-[format 0x%04X $::ixmax]; volcados 29861 B"
    say "   PC: carga=$::pc(carga) rom=$::pc(rom) otro=$::pc(otro)"
    # SIN capturas: `screenshot -raw` reventaba el emulador (exit 139) justo
    # despues del primer volcado. El progreso ya lo da IX.
}

foreach t {30 60 90 120 150 170 185 200} { after time $t "coteja $t" }
after time 215 { coteja final 1 ; say "FIN" ; exit 0 }
set throttle off
