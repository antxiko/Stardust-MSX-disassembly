# QUE RUTINA ESCRIBE EN QUE BANDA DEL BUFFER DE PANTALLA, Y A QUE RITMO.
#
# QUE SE BUSCA. La fase de a pie tiene dos planos de scroll a velocidades
# distintas (dato de un jugador). Ocho intentos de separarlos MIRANDO LA IMAGEN
# salieron en blanco, porque entre los sprites, el damero y una escena que se
# recompone tile a tile no queda un corrimiento limpio que correlar. Asi que se
# separan por QUIEN LOS DIBUJA: se vigila el buffer y se apunta que PC escribe
# en cada banda, y de donde lee.
#
# LA GEOMETRIA. La rutina de volcado (0xD383 a pie, 0xF3DC en naves: son
# IDENTICAS parametro a parametro) hace TRES llamadas, cada una con su buffer,
# su destino en la VRAM y su altura:
#
#     0x4000  56 filas   -> VRAM 0x0108
#     0x4540  64 filas   -> VRAM 0x0900
#     0x4B40  40 filas   -> VRAM 0x1100
#
# Son contiguas y cierran al byte: 0x4000-0x4EFF, 3840 bytes. Dentro de cada
# banda la direccion es base + fila*24 + columna, porque el bucle interior
# recorre el buffer a saltos de 24.
#
# EL TAMANO DEL RANGO VIGILADO, medido y no supuesto. Un punto de observacion de
# escritura sobre un rango grande congela el emulador: paso con 0xD674 durante
# la carga del bloque [12] y el reloj emulado se paro en seco. Por eso la primera
# pasada se hizo con TRES SONDAS DE 24 BYTES, que es lo que se sabia seguro que
# aguanta -el punto de 0x61D0, de dos bytes, ya habia funcionado en
# tools/omsx_multicarga.tcl-. Salio bien, y de ahi el ritmo: ~670.000 escrituras
# en 20 s sobre el buffer entero, el mismo orden que la medida del puerto 0x98
# (595.200) que ya se sabia que aguanta. La segunda pasada, con las tres bandas
# ENTERAS, tampoco congelo: 677.776 escrituras en 20 s emulados.
# Con STARDUST_SONDAS=1 se vuelve a las tres filas sueltas, por si acaso.
#
# COMO SE SABE QUE BANDA ES SIN MIRAR LA DIRECCION. Tres puntos de observacion,
# uno por banda entera, cada uno con su contador. Asi el callback no tiene que
# resolver la direccion y no depende de que openMSX exponga wp_last_address.
#
# --- LO QUE APRENDIO LA PRIMERA MEDIDA (t=2400) Y POR QUE NO VALIA ------------
#
# Salieron cuatro escritores, y eso sigue en pie:
#     0xA9AC  fondo, 4 `ldi` por fila con paso 24, origen 0x87F3+   597.232
#     0xAA51  sprite con mascara, 3 bytes de ancho                   65.604
#     0xAB1F  sprite con mascara, 2 bytes de ancho                    5.640
#     0xB48E  16 filas en damero, SOLO en la banda C                  9.300
#
# PERO EN ESE MOMENTO EL ESCENARIO ESTABA PARADO: solo se movian los enemigos.
# Lo dijo el usuario mirando la partida. La comprobacion que hacia este guion
# -"el buffer cambio en 3190 de 3840 bytes"- NO distingue scroll de enemigos, y
# por eso dio por bueno un momento que no servia. Es la tercera vez en el
# proyecto que se mide sin comprobar que hay algo que medir.
#
# --- POR ESO EL RITMO, Y NO SOLO EL RECUENTO ---------------------------------
#
# Contar escrituras por banda no separa dos velocidades: el blitter de fondo
# escribe en las tres bandas y es UNO SOLO. Lo que si las separa es DE DONDE
# LEE. Si el piso de arriba avanza al doble que el de abajo, la ventana de datos
# que el blitter recorre para una banda se desplaza al doble de rapido que la de
# la otra. Asi que se apunta, cada decima de segundo emulado, el rango de HL
# (el origen) que ha usado el blitter en cada banda. Dos pendientes distintas =
# dos planos, medidos por quien los dibuja y no por como se ven.
#
# De paso se muestrean los cuatro candidatos a contador de scroll que se
# encontraron antes (0xACE7/0xACEC/0xACF6 a +1 por cuadro y 0xACE9 a +2). Se
# midieron en el t=2400 que resulto no tener scroll, asi que hay que ver si
# avanzan tambien cuando NO se anda -y entonces son contadores de cuadro, no de
# scroll- o solo cuando se anda.
#
# Uso:  STARDUST_REPLAY=<ruta.omr> STARDUST_OUT=<dir> STARDUST_T=<segundo> \
#       [STARDUST_DUR=<segundos emulados>] [STARDUST_SONDAS=1] \
#           openmsx -machine Philips_VG_8020-20 -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
set T $::env(STARDUST_T)
set DUR [expr {[info exists ::env(STARDUST_DUR)] ? $::env(STARDUST_DUR) : 20}]
file mkdir $OUT
set LOG [open "$OUT/bandas.log" w]
proc say {m} { global LOG; puts $LOG "\[emu [format %8.2f [machine_info time]]\] $m"; flush $LOG }

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO: no se pudo cargar el replay"; exit 1 }
array set st [reverse status]
say "replay cargado, llega hasta t=$st(end)"

set r [catch {reverse goto $T} msg]
say "reverse goto $T rc=$r: $msg"
if {$r} { say "ABORTADO: no se pudo ir a t=$T"; exit 1 }
say "PC tras el goto = [format 0x%04X [reg PC]]"

# --- Contadores ---------------------------------------------------------------
array set ::W {A {} B {} C {}}
array set ::N {A 0 B 0 C 0}

# Ventana de la linea de tiempo: origen (HL) que ha usado el blitter de fondo en
# cada banda desde el ultimo apunte.
array set ::TMIN {A 65536 B 65536 C 65536}
array set ::TMAX {A 0 B 0 C 0}
array set ::TN   {A 0 B 0 C 0}
set ::TL {}

# El blitter de fondo son cuatro `ldi` seguidos en 0xA9AC-0xA9B3; el PC que se
# ve al escribir es el segundo byte de cada uno.
proc anota {b pc hl de} {
    incr ::N($b)
    if {[dict exists $::W($b) $pc]} {
        set r [dict get $::W($b) $pc]
        dict set ::W($b) $pc [list [expr {[lindex $r 0]+1}] \
            [expr {min([lindex $r 1],$hl)}] [expr {max([lindex $r 2],$hl)}] \
            [expr {min([lindex $r 3],$de)}] [expr {max([lindex $r 4],$de)}]]
    } else {
        dict set ::W($b) $pc [list 1 $hl $hl $de $de]
    }
    if {$pc >= 0xA9AD && $pc <= 0xA9B3} {
        incr ::TN($b)
        if {$hl < $::TMIN($b)} { set ::TMIN($b) $hl }
        if {$hl > $::TMAX($b)} { set ::TMAX($b) $hl }
    }
}

proc arma {} {
    if {[info exists ::env(STARDUST_SONDAS)]} {
        set rangos {{0x42A0 0x42B7} {0x4840 0x4857} {0x4D20 0x4D37}}
        say "armadas 3 SONDAS de 24 bytes (modo prudente)"
    } else {
        set rangos {{0x4000 0x453F} {0x4540 0x4B3F} {0x4B40 0x4EFF}}
        say "armadas 3 BANDAS enteras: A 0x4000-0x453F (56 filas), B 0x4540-0x4B3F (64), C 0x4B40-0x4EFF (40)"
    }
    debug set_watchpoint write_mem [lindex $rangos 0] {} { anota A [reg PC] [reg HL] [reg DE] }
    debug set_watchpoint write_mem [lindex $rangos 1] {} { anota B [reg PC] [reg HL] [reg DE] }
    debug set_watchpoint write_mem [lindex $rangos 2] {} { anota C [reg PC] [reg HL] [reg DE] }
}

# --- La linea de tiempo -------------------------------------------------------
proc tic {} {
    lappend ::TL [list [machine_info time] \
        $::TN(A) $::TMIN(A) $::TMAX(A) \
        $::TN(B) $::TMIN(B) $::TMAX(B) \
        $::TN(C) $::TMIN(C) $::TMAX(C) \
        [debug read memory 0xACE7] [debug read memory 0xACE9] \
        [debug read memory 0xACEC] [debug read memory 0xACF6]]
    foreach b {A B C} { set ::TN($b) 0 ; set ::TMIN($b) 65536 ; set ::TMAX($b) 0 }
    after time 0.1 tic
}

proc vuelca {} {
    global OUT
    set f [open "$OUT/bandas.txt" w]
    puts $f "# escrituras al buffer de pantalla, por PC y por banda"
    puts $f "# t emulado = [format %.2f [machine_info time]]"
    puts $f "# totales: A=$::N(A)  B=$::N(B)  C=$::N(C)"
    puts $f ""
    puts $f "PC        bandaA    bandaB    bandaC     % en A   % en B   % en C"
    set pcs [lsort -integer [lsort -unique [concat [dict keys $::W(A)] [dict keys $::W(B)] [dict keys $::W(C)]]]]
    foreach pc $pcs {
        set v {}
        foreach b {A B C} {
            if {[dict exists $::W($b) $pc]} { lappend v [lindex [dict get $::W($b) $pc] 0] } else { lappend v 0 }
        }
        set t [expr {[lindex $v 0] + [lindex $v 1] + [lindex $v 2]}]
        if {$t == 0} { continue }
        puts $f [format "0x%04X %9d %9d %9d %9.1f %8.1f %8.1f" $pc \
            [lindex $v 0] [lindex $v 1] [lindex $v 2] \
            [expr {100.0*[lindex $v 0]/$t}] [expr {100.0*[lindex $v 1]/$t}] [expr {100.0*[lindex $v 2]/$t}]]
    }
    puts $f ""
    puts $f "# rangos de registro al escribir, por banda"
    puts $f "banda  PC        veces   HL de-a          DE de-a"
    foreach b {A B C} {
        foreach pc [lsort -integer [dict keys $::W($b)]] {
            set r [dict get $::W($b) $pc]
            puts $f [format "  %s   0x%04X %9d   0x%04X-0x%04X   0x%04X-0x%04X" \
                $b $pc [lindex $r 0] [lindex $r 1] [lindex $r 2] [lindex $r 3] [lindex $r 4]]
        }
    }
    close $f

    set f [open "$OUT/ritmo.txt" w]
    puts $f "# origen que lee el blitter de fondo (0xA9AC) en cada banda, cada 0,1 s"
    puts $f "# y los cuatro candidatos a contador de scroll"
    puts $f "#"
    puts $f "# t         nA   HL_A de-a        nB   HL_B de-a        nC   HL_C de-a       ACE7 ACE9 ACEC ACF6"
    foreach r $::TL {
        puts $f [format "%9.2f  %5d 0x%04X-0x%04X  %5d 0x%04X-0x%04X  %5d 0x%04X-0x%04X   %3d  %3d  %3d  %3d" \
            [lindex $r 0] \
            [lindex $r 1] [lindex $r 2] [lindex $r 3] \
            [lindex $r 4] [lindex $r 5] [lindex $r 6] \
            [lindex $r 7] [lindex $r 8] [lindex $r 9] \
            [lindex $r 10] [lindex $r 11] [lindex $r 12] [lindex $r 13]]
    }
    close $f
}

# Latido en tiempo REAL: si el reloj emulado se queda clavado, se ve aqui.
set ::lat 0
proc latido {} {
    incr ::lat 5
    say "latido: $::lat s reales -- A=$::N(A) B=$::N(B) C=$::N(C)"
    vuelca
    after realtime 5 latido
}

proc fin {} {
    global DUR
    vuelca
    say "FIN tras $DUR s emulados: A=$::N(A) B=$::N(B) C=$::N(C)"
    exit 0
}

set throttle off
arma
tic
after realtime 5 latido
after time $DUR fin
