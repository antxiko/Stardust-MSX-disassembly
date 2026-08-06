# Que son los 94 bytes que el cargador preserva en 0xFDE8?
#
# El codigo copiado a la pagina 1 empieza con `ld hl,0dac0h / ld de,0fde8h /
# ld bc,0005eh / ldir`, o sea que salva 94 bytes de 0xDAC0 a 0xFDE8, donde nada
# los va a machacar. Pero 0xDAC0 no esta dentro de ningun bloque de la cinta: el
# cargador ocupa 0xD2F0-0xD44E y el logo 0x9470-0xA50D. Lo que haya ahi en ese
# instante solo se puede saber mirandolo, asi que aqui se para justo antes del
# LDIR y se vuelca.
set OUT $::env(STARDUST_OUT)
set LOG [open "$OUT/n94.log" w]
proc say {m} { global LOG; puts $LOG "\[[format %8.2f [machine_info time]]\] $m"; flush $LOG }
set throttle off
cassetteplayer insert $::env(STARDUST_TSX)
debug set_bp 0x4000 {} {
    say "parado en 0x4000, justo antes del LDIR de 0xDAC0 a 0xFDE8"
    set f [open "$OUT/dac0.bin" w]
    fconfigure $f -translation binary
    puts -nonewline $f [debug read_block memory 0xDAC0 94]
    close $f
    say "volcados 94 bytes de 0xDAC0"
    debug set_bp 0xBD85 {} {
        set f [open "$OUT/fde8.bin" w]
        fconfigure $f -translation binary
        puts -nonewline $f [debug read_block memory 0xFDE8 94]
        close $f
        say "y los 94 de 0xFDE8 ya con el juego cargado"
        exit 0
    }
}
after time 2 { type "RUN\"CAS:\"\r" }
after time 1200 { say "TIMEOUT"; exit 1 }
