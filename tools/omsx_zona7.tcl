# Con el trainer puesto, dejar correr hasta que el juego vuelva a la cinta.
# El vigia esta en 0x405C, la rutina de carga del Spectrum reimplementada que
# sobrevive en la pagina 1: si el juego pide la segunda parte, tiene que pasar
# por ahi, y entonces se apunta IX (destino) y DE (longitud), que es lo que
# demostraria que el bloque [12] es la parte de a pie.
set OUT $::env(STARDUST_OUT)
set LOG [open "$OUT/zona7.log" w]
proc say {m} { global LOG; puts $LOG "\[[format %8.2f [machine_info time]]\] $m"; flush $LOG }
set throttle off
loadstate stardust_trainer
set ::jugando 0

debug set_bp 0x405C {} {
    say [format "!!! CARGA DE CINTA: ix=0x%04X de=0x%04X a=0x%02X" [reg IX] [reg DE] [reg A]]
    screenshot -raw -prefix "$OUT/png/multicarga_"
    exit 0
}
debug set_bp 0xD8A3 {} {
    if {!$::jugando} { set ::jugando 1 ; say "hay partida" }
}
proc aporrea {} {
    keymatrixdown 8 1
    after time 0.15 { keymatrixup 8 1 }
    after time 1.5 aporrea
}
after time 2 aporrea
proc foto {n} {
    global OUT
    set throttle on
    after time 1 "screenshot -raw -prefix \"$OUT/png/z$n\_\" ; set throttle off"
}
foreach {n t} {1 500 2 1000 3 1500 4 2000 5 2500 6 3000 7 3500} { after time $t "foto $n" }
after time 4000 { say "fin sin multicarga (jugando=$::jugando)" ; exit 0 }
