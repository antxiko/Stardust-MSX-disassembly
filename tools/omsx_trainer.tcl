# Comprueba la puerta trasera de POKEs del cargador de Stardust.
#
# El cargador copia 94 bytes de 0xDAC0 a 0xFDE8 y, antes de saltar al juego,
# mira si esos bytes empiezan por tres 0xC9. Si es que si, los trata como una
# lista de parches: un byte con cuantos hay, y luego direccion (2 bytes) y valor
# (1 byte) por cada uno. Es un aplicador de POKEs incorporado de fabrica, y es
# lo que usaban los cargadores de las revistas de la epoca (el de Input MSX 19
# escribe justo ahi con un FOR I=56000 TO 56012).
#
# Aqui se escriben los mismos 13 bytes de aquel cargador, pero directamente en
# memoria justo antes de que el LDIR se los lleve, en vez de teclear el BASIC.
set OUT $::env(STARDUST_OUT)
set LOG [open "$OUT/trainer.log" w]
proc say {m} { global LOG; puts $LOG "\[[format %8.2f [machine_info time]]\] $m"; flush $LOG }
set throttle off
cassetteplayer insert $::env(STARDUST_TSX)

# 201,201,201 = la firma. 3 = tres parches. Luego direccion y valor de cada uno.
set POKES {201 201 201 3  0x6E 0xC0 24  0x6F 0xC0 236  0xB1 0xF7 0}

debug set_bp 0x4000 {} {
    set a 0xDAC0
    foreach v $::POKES { debug write memory $a $v ; incr a }
    say "escritos [llength $::POKES] bytes de trainer en 0xDAC0"
}

# Justo antes de saltar al juego: comprobar que los parches se aplicaron.
debug set_bp 0xBD85 {} {
    say "en 0xBD85. Valores YA parcheados en el juego:"
    foreach d {0xC06E 0xC06F 0xF7B1} {
        say [format "   %s = 0x%02X" $d [debug read memory $d]]
    }
    savestate stardust_trainer
    cassetteplayer eject
    say "savestate 'stardust_trainer' guardado"
    exit 0
}
after time 2 { type "RUN\"CAS:\"\r" }
after time 1200 { say "TIMEOUT" ; exit 1 }
