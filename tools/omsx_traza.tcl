# Carga Stardust en openMSX y saca de la partida lo que el trazador no puede saber.
#
# Hay dos cosas que un trazador estatico no puede resolver, y las dos deciden
# buena parte del mapa de este juego:
#
#   1. Los saltos indirectos `jp (hl)` de 0xCB99 y 0xD6B8. Cada objeto del juego
#      lleva su rutina de comportamiento en (ix+3)/(ix+4), y esa estructura viene
#      TODA a 0xFF en la cinta: se rellena jugando. Leyendo el binario no hay
#      forma; aqui se apunta cada destino real segun ocurre.
#
#   2. Que codigo se ejecuta de verdad. Muestreando el PC salen rutinas a las que
#      solo se llega por tabla, y que el trazado deja como "datos".
#
# Y de paso se guarda un savestate en el arranque del juego, porque la cinta son
# 94 KB y no hay por que volver a cargarla en cada intento.
#
# Uso:  STARDUST_TSX=... STARDUST_OUT=... openmsx -machine <maq> -script este.tcl

set TSX $::env(STARDUST_TSX)
set OUT $::env(STARDUST_OUT)
file mkdir $OUT

set LOG [open "$OUT/traza.log" w]
proc say {m} { global LOG; puts $LOG "\[[format %8.2f [machine_info time]]\] $m"; flush $LOG }

# --- lo que vamos recogiendo
set ::destinos [dict create]     ;# destino de jp (hl) -> cuantas veces
set ::pcs [dict create]          ;# PC muestreado -> cuantas veces

proc anota_destino {donde} {
    set hl [reg HL]
    dict incr ::destinos [format "%s:%04X" $donde $hl]
}

set throttle off
cassetteplayer insert $TSX
say "cinta insertada"

# El cargador salta aqui cuando el juego ya esta en memoria.
debug set_bp 0xBD85 {} {
    say "el juego arranca en 0xBD85; savestate guardado"
    savestate stardust_juego
    cassetteplayer eject

    # A partir de aqui, a cazar los saltos indirectos.
    debug set_bp 0xCB99 {} { anota_destino CB99 }
    debug set_bp 0xD6B8 {} { anota_destino D6B8 }
    say "puntos de observacion puestos en 0xCB99 y 0xD6B8"

    # Muestreo del PC: cada pocos milisegundos emulados, apunta donde esta.
    proc muestrea {} {
        dict incr ::pcs [format "%04X" [reg PC]]
        after time 0.002 muestrea
    }
    muestrea

    # Se le da un rato de juego y se vuelca lo recogido.
    after time 90 {
        set f [open "$OUT/destinos.txt" w]
        foreach k [lsort [dict keys $::destinos]] {
            puts $f "$k [dict get $::destinos $k]"
        }
        close $f
        set f [open "$OUT/pcs.txt" w]
        foreach k [lsort [dict keys $::pcs]] {
            puts $f "$k [dict get $::pcs $k]"
        }
        close $f
        say "volcados [dict size $::destinos] destinos y [dict size $::pcs] PCs distintos"
        exit 0
    }
}

after time 2 { type "RUN\"CAS:\"\r" ; say "tecleado RUN CAS:" }
after time 1200 { say "TIMEOUT: el juego no llego a 0xBD85" ; exit 1 }
