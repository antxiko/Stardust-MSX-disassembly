# DESCALLAR EL CANAL 2: LA TERCERA VOZ QUE EL JUEGO NUNCA TOCA.
#
# El listado dice que arranca_musica (0xE16F) reparte tres guiones y que al
# canal 2 le da 0xECCB, que es un 0x8B suelto -el comando FIN-, asi que la voz
# se apaga antes de sonar una nota. Justo detras, en 0xECCC, hay un guion
# completo que nadie nombra: 137 bytes, 44 llamadas a la frase 2 (que abre el
# RUIDO y cierra el TONO: percusion) y 12 a la frase 15, y dura exactamente los
# mismos 8704 cuadros que las otras dos voces.
#
# Esta sonda comprueba las dos mitades de esa lectura sobre el hardware:
#
#   pasada SIN parche  -> el canal 2 no recibe ni una nota de la musica, y el
#                         bit 5 del mezclador (ruido C) se queda a 1
#   pasada CON parche  -> se le da 0xECCC en vez de 0xECCB y tiene que aparecer
#                         percusion: ruido abierto en C y escrituras al registro 6
#
# El parche NO toca la memoria del juego. Se pone un breakpoint en 0xE183 -el
# `call` que sigue al `ld de,0eccbh`- y se cambia DE ahi mismo, que es el unico
# sitio donde ese valor existe. Lo unico que cambia es el argumento de una
# llamada de sonido; el resto del juego corre igual.
#
# POR QUE ARRANCA DE CINTA Y NO DE UN REPLAY: Stardust.omr esta grabado en un
# Sony HB-20P y aqui no esta esa BIOS (openMSX aborta con "Couldn't find ROM
# file for MSX BIOS with BASIC ROM"). No hace falta: la musica de la partida
# suena sola en la presentacion y en la demo de atraccion, sin tocar una tecla.
#
# A un -script de openMSX NO se le pueden pasar argumentos (ni por la linea de
# ordenes ni por $::argv), asi que la configuracion entra por un fichero,
# work/canal2.cfg, una linea `clave valor` por ajuste:
#
#       out     dump/canal2_parche
#       parche  1       <- 0 = tal como esta, 1 = darle 0xECCC al canal 2
#       mide    200     <- segundos emulados a medir desde que arranca el juego
#
# Uso:  openmsx -machine Philips_VG_8020-20 -cassetteplayer stardust.tsx \
#               -script tools/omsx_canal2.tcl
#
# Salidas: $out/canal2.log  el informe
#          $out/pista.txt   una linea por cambio: t canal periodo volumen mezcla ruido
#                           (el mismo formato que omsx_psg_pista.tcl, o sea que
#                            tools/suena_pista.py lo convierte a WAV tal cual)

array set C {out dump/canal2 parche 0 mide 200}
set f [open work/canal2.cfg r]
foreach linea [split [read $f] "\n"] {
    set linea [string trim $linea]
    if {$linea eq "" || [string index $linea 0] eq "#"} continue
    set i [string first " " $linea]
    if {$i < 0} continue
    set C([string range $linea 0 [expr {$i-1}]]) [string trim [string range $linea $i end]]
}
close $f

set OUT $C(out)
file mkdir $OUT
set LOG [open "$OUT/canal2.log" w]
# Sin corchetes dentro del formato: en Tcl son sustitucion de comando, y la proc
# reventaria en su primera llamada dejando el emulador colgado y el log vacio.
proc say {m} { global LOG; puts $LOG [format "t=%9.2f  %s" [machine_info time] $m]; flush $LOG }

say "CONFIG out=$C(out) parche=$C(parche) mide=$C(mide)"
say "cinta: [cassetteplayer]"

# --- ARRANQUE DE LA CINTA ---------------------------------------------------
# Copiado de tools/omsx_menu.tcl: con el acelerador quitado los primeros
# segundos emulados pasan en un suspiro, y un RUN"CAS:" escrito antes de que el
# BASIC responda se pierde sin que nadie proteste. Por eso se reintenta.
set ::en_el_juego 0
set ::cargando 0
set ::intentos 0

debug set_bp 0xBD85 {} {
    if {!$::en_el_juego} { set ::en_el_juego 1 ; empieza_a_medir }
}
debug set_bp 0xD2F0 {} {
    if {!$::cargando} { set ::cargando 1 ; say "la carga ha arrancado" }
}

# --- EL PARCHE, Y SU CONTROL ------------------------------------------------
# 0xE183 es el `call L_E1BC` que sigue al `ld de,0eccbh` de 0xE180. El bp salta
# con DE ya cargado y A=2, justo antes de instalar el guion en el canal.
set ::nparche 0
set ::visto {}
debug set_bp 0x0E183 {} {
    incr ::nparche
    lappend ::visto [list [machine_info time] [reg DE] [expr {[reg A] & 0x7F}]]
    if {$::C(parche)} { reg DE 0x0ECCC }
}

# CONTROLES. Sin ellos un cero no se distingue de la instrumentacion rota.
set ::n0038 0 ; set ::nE203 0
debug set_bp 0x00038 {} { incr ::n0038 }
debug set_bp 0x0E203 {} { incr ::nE203 }

# --- LA PISTA DEL CHIP ------------------------------------------------------
set ::reg 0
set ::psg [dict create]
set ::regs [dict create]
set ::porcanal [dict create]
set ::mezclas [dict create]      ; # valor del registro 7 -> escrituras
set ::ruidos [dict create]       ; # valor del registro 6 -> escrituras
set ::escrituras 0
set ::pista {}
set ::mezcla 255 ; set ::ruido 0
set ::up(0) -1 ; set ::up(1) -1 ; set ::up(2) -1
set ::uv(0) -1 ; set ::uv(1) -1 ; set ::uv(2) -1
# Cuantas escrituras del registro 7 dejaron abierto el TONO y el RUIDO de cada
# canal. Es lo que decide el veredicto: la tercera voz es percusion, o sea
# ruido sin tono.
set ::tono(0) 0 ; set ::tono(1) 0 ; set ::tono(2) 0
set ::rui(0) 0 ; set ::rui(1) 0 ; set ::rui(2) 0
set ::pc(rom) 0 ; set ::pc(naves) 0 ; set ::pc(apie) 0
set ::t0 0

proc lee_psg {} {
    incr ::escrituras
    dict incr ::regs $::reg
    dict set ::psg $::reg $::wp_last_value
    if {$::reg < 6} {
        set c [expr {$::reg / 2}]
        set lo [expr {[dict exists $::psg [expr {$c*2}]] ? [dict get $::psg [expr {$c*2}]] : 0}]
        set hi [expr {[dict exists $::psg [expr {$c*2+1}]] ? [dict get $::psg [expr {$c*2+1}]] : 0}]
        set p [expr {$lo | (($hi & 0x0F) << 8)}]
        # Solo tras el byte ALTO: recomponer en cada escritura mezcla el bajo
        # nuevo con el alto viejo e inventa periodos que el juego no pidio.
        if {$p > 0 && ($::reg & 1)} {
            dict incr ::porcanal "$c:$p"
            if {$p != $::up($c) && [llength $::pista] < 400000} {
                set ::up($c) $p
                lappend ::pista [list [machine_info time] $c $p $::uv($c) $::mezcla $::ruido]
            }
        }
    } elseif {$::reg == 6} {
        set ::ruido [expr {$::wp_last_value & 0x1F}]
        dict incr ::ruidos $::ruido
    } elseif {$::reg == 7} {
        set ::mezcla $::wp_last_value
        dict incr ::mezclas $::mezcla
        # Registro 7 del AY: bits 0-2 el TONO de A,B,C y bits 3-5 el RUIDO;
        # en los dos casos un 0 quiere decir ABIERTO.
        for {set c 0} {$c < 3} {incr c} {
            if {!($::mezcla & (1 << $c))} { incr ::tono($c) }
            if {!($::mezcla & (1 << ($c+3)))} { incr ::rui($c) }
        }
    } elseif {$::reg >= 8 && $::reg <= 10} {
        set c [expr {$::reg - 8}]
        set v [expr {$::wp_last_value & 0x1F}]
        if {$v != $::uv($c) && [llength $::pista] < 400000} {
            set ::uv($c) $v
            lappend ::pista [list [machine_info time] $c $::up($c) $v $::mezcla $::ruido]
        }
    }
}

# Los puntos de observacion del chip se enchufan al ENTRAR EN EL JUEGO, no
# antes: durante la carga de la cinta no hay nada que medir y los callbacks
# solo estorban.
proc empieza_a_medir {} {
    set ::t0 [machine_info time]
    say "el cargador salta al juego; empieza la medida"
    debug set_watchpoint write_io 0xA0 {} { set ::reg [expr {$::wp_last_value & 0x0F}] }
    debug set_watchpoint write_io 0xA1 {} { lee_psg }
    muestrea
}

# QUE PROGRAMA CORRE: los dos juegos comparten los 64K, y atribuirle al de
# naves una musica de la fase de a pie ya costo una sesion entera.
proc muestrea {} {
    after time 0.002 muestrea      ; # reprogramar LO PRIMERO: si lo de abajo
                                     # falla una vez, la cadena no se muere
    catch {
        set pc [reg PC]
        if {$pc < 0x4000} { incr ::pc(rom) } \
        elseif {$pc >= 0x61D0 && $pc <= 0xD674} { incr ::pc(apie) } \
        else { incr ::pc(naves) }
    }
}

proc arranca {} {
    if {$::cargando || $::en_el_juego} { return }
    incr ::intentos
    if {$::intentos > 8} { say "NO ARRANCA la carga tras $::intentos intentos"; return }
    type "RUN\"CAS:\"\r"
    say "escrito RUN\"CAS:\" (intento $::intentos)"
    after time 12 arranca
}

proc informe {} {
    global OUT C
    say "--- INFORME ---"
    say "CONTROL bp 0x0038: $::n0038 pasadas (si es 0, los bp no van y nada de esto vale)"
    say "CONTROL interprete E203: $::nE203 pasadas"
    say "PC muestreado: rom=$::pc(rom) naves=$::pc(naves) apie=$::pc(apie)"
    say "escrituras al PSG: $::escrituras"
    say "arranca_musica canal 2 (bp 0xE183): $::nparche pasadas, parche=$C(parche)"
    foreach v $::visto {
        say [format "   t=%.2f  DE=0x%04X  A=%d" [lindex $v 0] [lindex $v 1] [lindex $v 2]]
    }
    for {set c 0} {$c < 3} {incr c} {
        set l {} ; set n 0
        dict for {k v} $::porcanal {
            if {[string first "$c:" $k] == 0} { lappend l "[string range $k 2 end]:$v" ; incr n $v }
        }
        say "canal $c: [llength $l] periodos distintos, $n escrituras de periodo"
        say "   R7 dejo el TONO abierto $::tono($c) veces y el RUIDO $::rui($c)"
        say "   periodos: [join $l { }]"
    }
    set l {} ; dict for {m v} $::mezclas { lappend l "[format 0x%02X $m]:$v" }
    say "mezclador (R7), valores escritos: [join $l { }]"
    set l {} ; dict for {m v} $::ruidos { lappend l "$m:$v" }
    say "periodo de ruido (R6), valores escritos: [join $l { }]"
    set f [open "$OUT/pista.txt" w]
    foreach e $::pista { puts $f [join $e " "] }
    close $f
    say "pista: [llength $::pista] cambios -> $OUT/pista.txt"
    say "FIN"
}

proc vigila {} {
    global C
    after time 1 vigila
    catch {
        if {$::en_el_juego && [machine_info time] - $::t0 >= $C(mide)} {
            informe ; close $::LOG ; exit 0
        }
        # Cinturon: si la cinta no prende, no dejar el emulador colgado.
        if {!$::en_el_juego && [machine_info time] > 900} {
            say "ABORTADO: 900 s emulados y el juego no ha arrancado"
            close $::LOG ; exit 1
        }
    }
}

set throttle off
set renderer none
after time 10 arranca
vigila
