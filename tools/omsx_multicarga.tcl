# Caza la segunda carga y la deja TERMINAR.
#
# La version anterior ponia un watchpoint en 0x61D0 y hacia exit en cuanto
# saltaba: cazaba el instante exacto, si, pero cerraba el emulador justo al
# empezar a cargar, asi que no se veia el resultado. Ahora se apunta quien la
# dispara y se deja correr para ver entrar la segunda parte.
#
# Lo que se averiguo con aquella pasada: la carga NO usa la rutina del cargador
# (0x405C, que nunca salto en 4000 segundos de juego). El juego trae la SUYA, en
# 0xF7F6, que enciende el motor con `out (0abh),a` y selecciona el registro 14
# del PSG, que es donde el MSX lee el bit de cinta.
set OUT $::env(STARDUST_OUT)
set LOG [open "$OUT/multicarga.log" w]
proc say {m} { global LOG; puts $LOG "\[[format %8.2f [machine_info time]]\] $m"; flush $LOG }
set throttle off
loadstate stardust_trainer
set ::visto 0

debug set_bp 0xF7F6 {} {
    if {!$::visto} { say "arranca la rutina de carga propia del juego (0xF7F6)" }
}
debug set_watchpoint write_mem {0x61D0 0x61D1} {} {
    if {!$::visto} {
        set ::visto 1
        say [format "primera escritura en 0x61D0 desde PC=0x%04X" [reg PC]]
        # a partir de aqui, fotos periodicas para ver entrar la segunda parte
        proc foto {n} {
            global OUT
            set throttle on
            after time 1 "screenshot -raw -prefix \"$OUT/png/carga$n\_\" ; set throttle off"
        }
        foreach {n t} {0 1 1 20 2 60 3 120 4 200} { after time $t "foto $n" }
        after time 260 {
            savestate stardust_parte2
            say "savestate 'stardust_parte2' guardado tras la carga"
            # comprobar que lo cargado es el bloque [12]
            set f [open "$OUT/cargado_61d0.bin" w]
            fconfigure $f -translation binary
            puts -nonewline $f [debug read_block memory 0x61D0 29861]
            close $f
            say "volcados 29861 bytes de 0x61D0 para contrastar con el bloque de la cinta"
            exit 0
        }
    }
}
proc aporrea {} {
    keymatrixdown 8 1
    after time 0.15 { keymatrixup 8 1 }
    after time 1.5 aporrea
}
after time 2 aporrea
after time 6000 { say "fin sin multicarga" ; exit 0 }
