# QUIEN CARGA DE VERDAD LA SEGUNDA PARTE.
#
# La contradiccion mas vieja del proyecto. Escrito como hecho-verificado esta
# que el juego trae su PROPIA rutina de cinta en 0xF7F6 y no usa la del
# cargador (0x405C), pero al reproducir el replay completo un breakpoint en
# 0xF7F6 no salto NI UNA VEZ, y durante la segunda carga el PC caia en la ROM
# (0x1B09-0x1B2B). Las dos cosas no pueden ser.
#
# Por que se puede zanjar ahora y antes no: se ha comprobado que los
# breakpoints de EJECUCION si funcionan -un bp en 0x0038, el vector de
# interrupcion de la ROM, da el ritmo del cuadro-, asi que un cero ya significa
# algo. Aqui va ese control puesto, y si sale cero el resto del log no vale.
#
# Y hay una sospecha concreta que este guion prueba: que el "no salto nunca" de
# 0x405C se midiera con un punto de observacion de LECTURA DE MEMORIA. Esos no
# saltan cuando el procesador va a BUSCAR una instruccion, solo cuando la lee
# como dato. Con un bp de ejecucion la respuesta puede ser la contraria.
#
# Se parte del savestate 'stardust_multicarga', que esta guardado en la pantalla
# de FELICIDADES, justo antes de que el juego vaya a la cinta: asi no hay que
# jugarse los veintiun minutos de la primera parte.
#
# Uso:  STARDUST_OUT=<dir> openmsx -machine <maquina> -script este.tcl
set OUT $::env(STARDUST_OUT)
file mkdir $OUT
set LOG [open "$OUT/quien_carga.log" w]
proc say {m} { global LOG; puts $LOG "\[[format %8.2f [machine_info time]]\] $m"; flush $LOG }

set r [catch {loadstate stardust_multicarga} msg]
say "loadstate stardust_multicarga rc=$r $msg"
if {$r} { say "ABORTADO"; exit 1 }
say "PC de partida = [format 0x%04X [reg PC]]"

set ::n0038 0 ; set ::nF7F6 0 ; set ::n405C 0 ; set ::nCarga 0
set ::tF7F6 -1 ; set ::t405C -1
debug set_bp 0x00038 {} { incr ::n0038 }

# Los dos candidatos, con bp de EJECUCION los dos, que es lo que faltaba.
debug set_bp 0x0F7F6 {} {
    incr ::nF7F6
    if {$::tF7F6 < 0} {
        set ::tF7F6 [machine_info time]
        say [format "0xF7F6 (la rutina propia) por primera vez; vuelve a 0x%04X" \
                 [expr {[debug read memory [reg SP]] | ([debug read memory [expr {[reg SP]+1}]] << 8)}]]
    }
}
debug set_bp 0x0405C {} {
    incr ::n405C
    if {$::t405C < 0} {
        set ::t405C [machine_info time]
        say [format "0x405C (la del cargador) por primera vez; vuelve a 0x%04X" \
                 [expr {[debug read memory [reg SP]] | ([debug read memory [expr {[reg SP]+1}]] << 8)}]]
    }
}

# La carga entrando de verdad. Un watchpoint de escritura, que es la via que ya
# funciono y no depende de ninguna suposicion.
debug set_watchpoint write_mem {0x61D0 0x61D1} {} {
    incr ::nCarga
    if {$::nCarga == 1} {
        say [format "PRIMERA escritura en 0x61D0, con PC=0x%04X" [reg PC]]
    }
}

# DONDE ESTA EL PROCESADOR. Muestreo grueso, y de las visitas a la ROM se
# apunta ademas la direccion de vuelta que hay en la pila: eso dice QUIEN la
# llamo, que es la pregunta de verdad.
set ::pc(rom) 0 ; set ::pc(pag1) 0 ; set ::pc(juego) 0
set ::enrom [dict create]
set ::vuelve [dict create]
proc muestrea {} {
    set pc [reg PC]
    if {$pc < 0x4000} {
        incr ::pc(rom)
        dict incr ::enrom $pc
        if {[dict size $::vuelve] < 40} {
            set sp [reg SP]
            dict incr ::vuelve [expr {[debug read memory $sp] | ([debug read memory [expr {$sp+1}]] << 8)}]
        }
    } elseif {$pc < 0x8000} {
        incr ::pc(pag1)
    } else {
        incr ::pc(juego)
    }
    after time 0.001 muestrea
}
muestrea

# Por si la pantalla espera una tecla para seguir.
proc aporrea {} {
    keymatrixdown 8 1
    after time 0.15 { keymatrixup 8 1 }
    after time 1.5 aporrea
}
after time 2 aporrea

proc informe {} {
    say "--- INFORME ---"
    say "CONTROL bp 0x0038: $::n0038 pasadas (si es 0, nada de esto vale)"
    say "bp 0xF7F6 (rutina propia del juego): $::nF7F6 pasadas, primera en t=$::tF7F6"
    say "bp 0x405C (rutina del cargador):     $::n405C pasadas, primera en t=$::t405C"
    say "escrituras en 0x61D0/1: $::nCarga"
    say "PC muestreado: rom=$::pc(rom) pagina1=$::pc(pag1) juego=$::pc(juego)"
    set l {}
    foreach pc [lsort -integer [dict keys $::enrom]] {
        lappend l "[format 0x%04X $pc]:[dict get $::enrom $pc]"
    }
    say "direcciones de ROM pisadas ([llength $l]): [join $l { }]"
    set l {}
    dict for {a v} $::vuelve { lappend l "[format 0x%04X $a]:$v" }
    say "direcciones de vuelta vistas en la pila estando en ROM: [join $l { }]"
}

after time 400 { informe ; say "FIN por tiempo" ; exit 0 }
set throttle off
