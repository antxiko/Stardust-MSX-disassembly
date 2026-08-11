# LA PISTA DEL CHIP DE SONIDO: QUE NOTA SUENA, EN QUE CANAL Y CUANDO.
#
# Que anade sobre omsx_psg.tcl: aquella cuenta periodos en un monton y no
# distingue de que canal salen ni en que orden llegan, y con eso no se puede
# separar la MUSICA de los EFECTOS -que barren la frecuencia a mano y ensucian
# el recuento-. Esta apunta tres cosas mas:
#
#   1. Cuantas escrituras va a CADA registro del PSG (0-15). Sirve para leer
#      logs raros: 33.110 escrituras con cero periodos de tono no es "no suena
#      nada", es "todo fue a volumen/mezclador".
#   2. El periodo por CANAL, no en un monton comun.
#   3. Una PISTA en el tiempo: cada vez que un canal cambia de periodo o de
#      volumen, una linea con el instante. Eso es la melodia, y es lo que se
#      puede cotejar contra la partitura que saca tools/lee_musica.py.
#
# El callback sigue siendo barato: asignaciones, dict incr y un lappend solo
# cuando el valor CAMBIA de verdad (no en cada escritura). machine_info time
# tampoco se llama en cada evento, solo en los cambios.
#
# Uso:  STARDUST_REPLAY=<ruta.omr> STARDUST_OUT=<dir> \
#       [STARDUST_T=<inicio>] [STARDUST_FIN=<final>] \
#           openmsx -machine Philips_VG_8020-20 -script este.tcl
#
# Salidas: $OUT/psg.log   resumen (trae la misma linea "periodos vistos" que
#                         omsx_psg.tcl, para poder cotejar las dos)
#          $OUT/pista.txt una linea por cambio: "t canal periodo volumen"
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
file mkdir $OUT
set LOG [open "$OUT/psg.log" w]
proc say {m} { global LOG; puts $LOG "\[emu [format %8.2f [machine_info time]]\] $m"; flush $LOG }

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }
array set st [reverse status]
set T   [expr {[info exists ::env(STARDUST_T)]   ? $::env(STARDUST_T)   : 1700}]
set FIN [expr {[info exists ::env(STARDUST_FIN)] ? $::env(STARDUST_FIN) : 1760}]
set TRAMOS [expr {[info exists ::env(STARDUST_TRAMOS)] ? $::env(STARDUST_TRAMOS) : 0}]
say "replay hasta t=$st(end); ventana $T-$FIN"
set r [catch {reverse goto $T} msg]
say "reverse goto $T rc=$r: $msg"

# QUIEN ARRANCA CADA SONIDO. Los tres puntos de entrada del subsistema, con sus
# argumentos (A = canal, DE = guion). Y un CONTROL: el interprete de 0xE203
# corre desde la interrupcion, o sea 50 veces por segundo; si su contador sale
# cero es que los breakpoints no estan funcionando y el resto del log no vale.
#
# Y un CONTROL DE VERDAD: un bp en 0x0038, el vector de interrupcion de la ROM.
# Si ese sale cero mientras el watchpoint de E/S captura miles de eventos, lo
# que no funciona son los breakpoints de EJECUCION, y entonces ningun "no salto
# nunca" de este proyecto significa nada.
set ::llamadas {}
set ::nE203 0 ; set ::nE16F 0 ; set ::nE18F 0 ; set ::nE1BC 0 ; set ::n0038 0
# Y se apuntan los INSTANTES, no solo la cuenta: el juego se pierde
# interrupciones cuando la pantalla se carga, asi que el "cuadro" no dura
# siempre lo mismo y una rejilla de ritmo fijo no puede seguir a la musica.
# Con estos instantes se construye la rejilla de verdad.
set ::interrupciones {}
debug set_bp 0x00038 {} {
    incr ::n0038
    if {[llength $::interrupciones] < 200000} {
        lappend ::interrupciones [machine_info time]
    }
}
debug set_bp 0x0E203 {} { incr ::nE203 }
debug set_bp 0x0E16F {} { incr ::nE16F
    lappend ::llamadas [list [machine_info time] "E16F arranca_musica" 0 0] }
debug set_bp 0x0E18F {} { incr ::nE18F
    lappend ::llamadas [list [machine_info time] "E18F sin_limpiar" [expr {[reg A] & 0x7F}] [reg DE]] }
debug set_bp 0x0E1BC {} { incr ::nE1BC
    lappend ::llamadas [list [machine_info time] "E1BC limpiando" [expr {[reg A] & 0x7F}] [reg DE]] }

set ::reg 0
set ::psg [dict create]          ; # registro -> ultimo valor
set ::periodos [dict create]     ; # periodo completo -> veces visto (metodo viejo)
set ::periodos_ok [dict create]  ; # idem, contando solo el par ya completo
set ::porcanal [dict create]     ; # "canal:periodo" -> veces visto
set ::regs [dict create]         ; # registro -> escrituras
set ::escrituras 0
set ::pista {}                   ; # {t canal periodo volumen}
# Ultimo periodo y volumen conocidos de cada canal, para no apuntar repeticiones.
set ::mezcla 255 ; set ::ruido 0
set ::up(0) -1 ; set ::up(1) -1 ; set ::up(2) -1
set ::uv(0) -1 ; set ::uv(1) -1 ; set ::uv(2) -1

# 0xA0: elegir registro.
debug set_watchpoint write_io 0xA0 {} { set ::reg [expr {$::wp_last_value & 0x0F}] }

# 0xA1: el dato.
set ::pcs [dict create]          ; # PC que escribe -> veces
set ::orden {}                   ; # los primeros registros, EN ORDEN

debug set_watchpoint write_io 0xA1 {} {
    incr ::escrituras
    dict incr ::regs $::reg
    # QUIEN escribe. Un watchpoint si funciona (lo demuestra que capture), asi
    # que esta es la via fiable para localizar la rutina de sonido sin depender
    # de los breakpoints. OJO: el PC que reporta cae DESPUES del `out`.
    dict incr ::pcs [reg PC]
    # Y EN QUE ORDEN. Hace falta para saber si el periodo se puede reconstruir
    # despues del byte bajo o solo despues del alto: si se toma antes de que el
    # par este completo, salen periodos intermedios que el juego nunca quiso.
    if {[llength $::orden] < 300} { lappend ::orden $::reg }
    dict set ::psg $::reg $::wp_last_value
    if {$::reg < 6} {
        # Registros de tono: en pares (bajo, alto de 4 bits) por canal.
        set c [expr {$::reg / 2}]
        set lo [expr {[dict exists $::psg [expr {$c*2}]] ? [dict get $::psg [expr {$c*2}]] : 0}]
        set hi [expr {[dict exists $::psg [expr {$c*2+1}]] ? [dict get $::psg [expr {$c*2+1}]] : 0}]
        set p [expr {$lo | (($hi & 0x0F) << 8)}]
        if {$p > 0} {
            # ::periodos es el recuento INGENUO, el que hacia omsx_psg.tcl:
            # recompone el periodo en CADA escritura, tambien tras el byte bajo,
            # cuando el alto todavia es el de la nota anterior. Se mantiene solo
            # para poder comparar con las cifras ya publicadas.
            dict incr ::periodos $p
            # ::periodos_ok solo cuenta tras el byte ALTO (registro impar), que
            # es cuando el par esta completo. El orden medido es 0,1,2,...,10 en
            # cada cuadro, o sea bajo y luego alto, asi que este es el periodo
            # que el juego quiso de verdad.
            if {$::reg & 1} { dict incr ::periodos_ok $p ; dict incr ::porcanal "$c:$p" }
            if {($::reg & 1) && $p != $::up($c) && [llength $::pista] < 400000} {
                set ::up($c) $p
                lappend ::pista [list [machine_info time] $c $p $::uv($c) $::mezcla $::ruido]
            }
        }
    } elseif {$::reg == 6} {
        set ::ruido [expr {$::wp_last_value & 0x1F}]
    } elseif {$::reg == 7} {
        # El mezclador. Sin el no se puede reproducir lo medido: un canal con el
        # tono cortado tiene periodo y no suena, y uno con el ruido abierto suena
        # aunque su periodo no cambie.
        set ::mezcla $::wp_last_value
    } elseif {$::reg >= 8 && $::reg <= 10} {
        # Registros de volumen: uno por canal.
        set c [expr {$::reg - 8}]
        set v [expr {$::wp_last_value & 0x1F}]
        if {$v != $::uv($c) && [llength $::pista] < 400000} {
            set ::uv($c) $v
            lappend ::pista [list [machine_info time] $c $::up($c) $v $::mezcla $::ruido]
        }
    }
}

# QUE PROGRAMA CORRE. Los dos juegos comparten los 64K: la parte de a pie se
# carga en 0x61D0-0xD674 y machaca ese trozo del juego de naves. Asi que la
# franja donde cae el PC dice cual de los dos esta ejecutando, y eso hay que
# saberlo ANTES de atribuirle a nadie la musica que suena.
set ::pc(rom) 0 ; set ::pc(naves) 0 ; set ::pc(apie) 0
proc muestrea {} {
    set pc [reg PC]
    if {$pc < 0x4000} { incr ::pc(rom) } \
    elseif {$pc >= 0x61D0 && $pc <= 0xD674} { incr ::pc(apie) } \
    else { incr ::pc(naves) }
    after time 0.002 muestrea
}
muestrea

set ::previo 0
proc tramo {} {
    # Un renglon por tramo: sirve para BARRER un replay entero y ver donde hay
    # sonido y donde no, sin tener que adivinar la ventana de antemano.
    global TRAMOS
    if {!$TRAMOS} return
    set d [expr {$::escrituras - $::previo}]
    set ::previo $::escrituras
    if {$d} { say "  tramo: $d escrituras, ultimo PC escritor [format 0x%04X [lindex [dict keys $::pcs] end]]" }
}

proc vigila {} {
    global FIN OUT
    tramo
    if {[machine_info time] >= $FIN} {
        say "escrituras al PSG: $::escrituras"
        set l {}
        dict for {r v} $::regs { lappend l "R$r:$v" }
        say "escrituras por registro: [join $l { }]"
        say "PC muestreado: rom=$::pc(rom) naves=$::pc(naves) apie=$::pc(apie)"
        set l {}
        dict for {p v} $::periodos { lappend l "$p:$v" }
        say "periodos vistos ([llength $l] distintos): [join $l { }]"
        set l {}
        dict for {p v} $::periodos_ok { lappend l "$p:$v" }
        say "periodos reales ([llength $l] distintos): [join $l { }]"
        for {set c 0} {$c < 3} {incr c} {
            set l {}
            set n 0
            dict for {k v} $::porcanal {
                if {[string first "$c:" $k] == 0} {
                    lappend l "[string range $k 2 end]:$v"
                    incr n $v
                }
            }
            say "canal $c: [llength $l] periodos distintos, $n escrituras: [join $l { }]"
        }
        say "CONTROL bp 0x0038 (interrupcion de la ROM): $::n0038 pasadas"
        say "CONTROL interprete E203: $::nE203 pasadas (si es 0, los bp no van y esto no vale)"
        set l {}
        dict for {pc v} $::pcs { lappend l "[format 0x%04X $pc]:$v" }
        say "QUIEN escribe en 0xA1 ([llength $l] sitios): [join $l { }]"
        say "orden de los primeros registros: $::orden"
        say "arrancadores: E16F=$::nE16F E18F=$::nE18F E1BC=$::nE1BC"
        foreach e $::llamadas {
            say [format "  t=%8.2f  %-20s canal %d  guion 0x%04X" {*}$e]
        }
        set P [open "$OUT/pista.txt" w]
        foreach e $::pista { puts $P [format "%.4f %d %d %d %d %d" {*}$e] }
        close $P
        set I [open "$OUT/interrupciones.txt" w]
        foreach x $::interrupciones { puts $I [format "%.6f" $x] }
        close $I
        say "interrupciones: [llength $::interrupciones] -> $OUT/interrupciones.txt"
        say "pista: [llength $::pista] cambios -> $OUT/pista.txt"
        say "FIN"
        exit 0
    }
    after time 5 vigila
}
after time 5 vigila
set throttle off
