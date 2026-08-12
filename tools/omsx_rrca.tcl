# EL `rrca` DEL ALTA DE ENEMIGOS, MEDIDO EN MARCHA
#
# Que se quiere comprobar. La dificultad del alta de enemigos de la fase de
# naves sale de 0xD432-0xD436:
#
#     d432: ld a,007h / sub b        <- b = la zona (0xE157)
#     d435: rrca                     <- ROTA, no desplaza
#     d436: add a,e                  <- e = enemigos ya volando
#
# Como `rrca` rota, cuando (7 - zona) es IMPAR -o sea en las zonas PARES- el bit
# bajo se va al bit 7 y el resultado se dispara por encima de 0x80; la mascara
# de 0xD43B se satura entonces en 0xFF y esa via de alta cae a una de cada 256.
# Leyendolo del listado la cuenta es esta:
#
#     zona 1 -> 7-1 = 6 = 0b00000110 -> rrca -> 0b00000011 = 0x03
#     zona 2 -> 7-2 = 5 = 0b00000101 -> rrca -> 0b10000010 = 0x82   <- el salto
#     zona 3 -> 4 -> 0x02      zona 4 -> 3 -> 0x81
#     zona 5 -> 2 -> 0x01      zona 6 -> 1 -> 0x80
#     zona 7 -> 0 -> 0x00
#
# Con ver UNA vez A=0x82 con la zona en 2 queda cerrado, sin estadistica: es
# aritmetica, no una tendencia. Por eso esta medida es barata.
#
# El bp va en 0xD436, que es donde EMPIEZA el `add a,e`: el `rrca` ya se ha
# ejecutado y A trae su resultado. (Ponerlo en 0xD435 daria 7-zona sin rotar, y
# ponerlo en mitad de una instruccion no dispararia nunca.)
#
# No importa que parte de la ventana sea la demo de atraccion: la demo ejecuta
# este mismo codigo y la relacion que se mide es aritmetica, la misma juegue
# quien juegue. Lo que si se apunta es el ritmo, que en la demo no significa lo
# mismo.
#
# Control obligatorio: un bp en 0x0038, el vector de interrupcion de la ROM. Si
# sale 0, la instrumentacion no vale y los demas ceros no son datos.
#
# Uso:  STARDUST_REPLAY=<ruta.omr> STARDUST_OUT=<dir> \
#       [STARDUST_T=<inicio>] [STARDUST_FIN=<fin>] \
#           openmsx -machine <maquina> -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
file mkdir $OUT
set LOG [open "$OUT/rrca.log" w]
proc say {m} { global LOG; puts $LOG "\[emu [format %8.2f [machine_info time]]\] $m"; flush $LOG }

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }
array set st [reverse status]
set T   [expr {[info exists ::env(STARDUST_T)]   ? $::env(STARDUST_T)   : $st(begin)}]
set FIN [expr {[info exists ::env(STARDUST_FIN)] ? $::env(STARDUST_FIN) : $st(end)}]
say "replay de $st(begin) a $st(end); ventana $T-$FIN"
if {$T > $st(begin)} { set r [catch {reverse goto $T} msg] ; say "goto rc=$r: $msg" }

set ::n0038 0
debug set_bp 0x0038 {} { incr ::n0038 }

# Los pares (zona, A) que salen del rrca, y el sumando E de propina: con el se
# ve si la tirada llego a hacerse o si la suma dio cero y el enemigo entro sin
# tirar (el `jr z` de 0xD437).
set ::pares [dict create]
set ::nd436 0
debug set_bp 0xD436 {} {
    incr ::nd436
    dict incr ::pares [list [debug read memory 0xE157] [reg A] [reg E]]
}

# El paso de las zonas, muestreado aparte: sirve para saber que zonas llego a
# ver esta partida y, si alguna no sale en los pares, poder decir que no salio
# porque no se jugo.
set ::zonas [dict create]
proc mira_zona {} {
    dict incr ::zonas [debug read memory 0xE157]
    after time 1 mira_zona
}
after time 1 mira_zona

proc informe {} {
    say "--- INFORME ---"
    say "CONTROL bp 0x0038: $::n0038 pasadas (si es 0, esto no vale)"
    say "0xD436 se ejecuto $::nd436 veces"
    say "zonas vistas (muestreo de 0xE157, una muestra por segundo emulado):"
    foreach z [lsort -integer [dict keys $::zonas]] {
        say [format "   zona %3d   %6d s" $z [dict get $::zonas $z]]
    }
    say "pares (zona, A tras el rrca, E) y cuantas veces:"
    foreach k [lsort [dict keys $::pares]] {
        say [format "   zona %3d   A=0x%02X   E=0x%02X   %8d veces" \
                 [lindex $k 0] [lindex $k 1] [lindex $k 2] [dict get $::pares $k]]
    }
    say "FIN"
}

proc vigila {} {
    global FIN
    if {[machine_info time] >= $FIN} {
        informe
        exit 0
    }
    after time 5 vigila
}
after time 5 vigila
set throttle off
