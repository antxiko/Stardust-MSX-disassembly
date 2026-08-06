# Contrasta la RAM del emulador contra la imagen que hemos reconstruido.
#
# Es la comprobacion que cierra el circulo: los listados reensamblan al binario
# que sale de la CINTA, pero eso no demuestra que ese binario sea lo que acaba
# corriendo en la maquina. Esto lo mira por el otro lado: se carga el savestate
# de la parte de a pie -donde el juego ya ha vuelto al cassette y ha traido el
# bloque [12]- y se vuelca la RAM del rango donde el descriptor dice que va.
#
# No tiene por que salir identico, y no salir identico no es un fallo: la
# segunda parte lleva un rato corriendo cuando se guardo el savestate, asi que
# sus variables ya estan tocadas. Lo que se mide es cuanto coincide, y donde no.
#
# Uso:  STARDUST_OUT=... openmsx -machine <maq> -script este.tcl
set OUT $::env(STARDUST_OUT)
set INI 0x61D0
set FIN 0xD674

loadstate stardust_parte2
set f [open "$OUT/ram_parte2.bin" w]
fconfigure $f -translation binary
for {set a $INI} {$a <= $FIN} {incr a} {
    puts -nonewline $f [binary format c [debug read memory $a]]
}
close $f
puts "volcados [expr {$FIN - $INI + 1}] bytes de [format 0x%04X $INI] con PC=[format 0x%04X [reg PC]]"

# El acelerador se quita solo para la captura: con throttle off openMSX no
# dibuja casi ningun fotograma y 'screenshot' devuelve el ultimo que llego a
# dibujarse, que puede ser de otro momento.
set throttle on
after time 2 { screenshot -raw "$OUT/apie.png" ; exit 0 }
