# Juega a Stardust en openMSX y caza lo que solo se ve con la partida en marcha.
#
# La primera pasada (tools/omsx_traza.tcl) se quedo en la pantalla de titulo y
# los dos `jp (hl)` de objetos no llegaron a dispararse ni una vez: esas rutinas
# solo corren cuando hay enemigos en pantalla. Este script parte del savestate
# que dejo aquella, aporrea la tecla de disparo para entrar en partida, y se
# queda un buen rato apuntando:
#
#   - cada destino de los `jp (hl)` de 0xCB99 y 0xD6B8, con el IX que lo mandaba,
#     que es lo que identifica a que objeto pertenece cada rutina;
#   - el PC muestreado, para seguir descubriendo codigo alcanzado por tabla;
#   - cualquier lectura del puerto de cinta, que es lo que delatara COMO pide el
#     juego la segunda carga.
#
# Uso:  STARDUST_OUT=... openmsx -machine <maq> -script este.tcl

set OUT $::env(STARDUST_OUT)
file mkdir $OUT
set LOG [open "$OUT/juega.log" w]
proc say {m} { global LOG; puts $LOG "\[[format %8.2f [machine_info time]]\] $m"; flush $LOG }

set ::destinos [dict create]
set ::pcs [dict create]
set ::cinta 0

proc anota {donde} {
    set hl [reg HL]
    set ix [reg IX]
    dict incr ::destinos [format "%s hl=%04X ix=%04X" $donde $hl $ix]
}

set throttle off
loadstate stardust_juego
say "savestate cargado, PC=[format 0x%04X [reg PC]]"

debug set_bp 0xCB99 {} { anota CB99 }
debug set_bp 0xD6B8 {} { anota D6B8 }

# La rutina de carga del Spectrum reimplementada, que sobrevive en la pagina 1:
# si el juego la llama para la segunda parte, aqui se vera.
debug set_bp 0x405C {} { say "!!! LLAMADA A LA RUTINA DE CARGA 0x405C (multicarga)"; incr ::cinta }

proc muestrea {} {
    dict incr ::pcs [format "%04X" [reg PC]]
    after time 0.002 muestrea
}
muestrea

# Aporrear el disparo: barra espaciadora (fila 8, bit 0) cada dos segundos.
proc aporrea {} {
    keymatrixdown 8 1
    after time 0.15 { keymatrixup 8 1 }
    after time 2 aporrea
}
after time 3 aporrea

after time 400 {
    set f [open "$OUT/destinos2.txt" w]
    foreach k [lsort [dict keys $::destinos]] { puts $f "$k [dict get $::destinos $k]" }
    close $f
    set f [open "$OUT/pcs2.txt" w]
    foreach k [lsort [dict keys $::pcs]] { puts $f "$k [dict get $::pcs $k]" }
    close $f
    set throttle on
    after time 2 {
        screenshot -raw -prefix "$OUT/png/juego_"
        say "volcados [dict size $::destinos] destinos, [dict size $::pcs] PCs, cinta=$::cinta"
        exit 0
    }
}
