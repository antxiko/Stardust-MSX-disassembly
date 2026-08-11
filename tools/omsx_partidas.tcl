# CUANTAS PARTIDAS Y CUANTAS MUERTES HAY EN EL REPLAY, SEPARANDO LA DEMO.
#
# El problema que resuelve: contar muertes sobre el replay entero mezcla la
# partida del usuario con las pasadas de la DEMO de atraccion, que ejecuta el
# MISMO codigo de juego (y por tanto las mismas rutinas de muerte). Publicar
# "N muertes" sin separarlas es publicar una cifra que suma cosas distintas.
#
# Como se separan (leido del listado, aqui se contrasta en vivo):
#   - 0xA689 es el operando de un `call` reescrito desde dos sitios: 0xA6FC en
#     partida normal (a313) y 0xA6EE en demo (b6ca). El propio arranque lo
#     consulta con `ld a,(0a689h) / cp 0eeh` en 0xA3E5 para no repintar el
#     marcador durante la demo. O sea que el byte de 0xA689 dice, en cualquier
#     instante, si lo que corre es la demo o una partida de verdad.
#   - 0xA3CB (`ld a,002h / ld (0c45fh),a`) es el arranque de partida: fija las
#     vidas en DOS. OJO: 0xA30B pone 3, pero eso es el menu y esto lo pisa.
#   - 0xA2D2 es el game over.
#
# Uso:  STARDUST_REPLAY=<ruta.omr> STARDUST_OUT=<dir> \
#       [STARDUST_T=<inicio>] [STARDUST_FIN=<final>] \
#           openmsx -machine Philips_VG_8020-20 -script este.tcl
set REPLAY $::env(STARDUST_REPLAY)
set OUT $::env(STARDUST_OUT)
file mkdir $OUT
set LOG [open "$OUT/partidas.log" w]
proc modo {} { return [expr {[debug read memory 0xA689] == 0xEE ? "DEMO " : "JUEGO"}] }
proc say {m} { global LOG; puts $LOG "\[emu [format %8.2f [machine_info time]]\] $m"; flush $LOG }

set r [catch {reverse loadreplay -viewonly $REPLAY} msg]
say "loadreplay rc=$r: $msg"
if {$r} { say "ABORTADO"; exit 1 }
array set st [reverse status]
set T   [expr {[info exists ::env(STARDUST_T)]   ? $::env(STARDUST_T)   : 1692}]
set FIN [expr {[info exists ::env(STARDUST_FIN)] ? $::env(STARDUST_FIN) : 3492}]
say "replay hasta t=$st(end); ventana $T-$FIN"
set r [catch {reverse goto $T} msg]
say "reverse goto $T rc=$r: $msg"

# Arranque de partida: fija vidas=2. Separa una partida de la siguiente.
debug set_bp 0xA3CB {} { say "ARRANQUE  [modo]  (vidas <- 2)" }
# Fin de partida. OJO: 0xA2D2 NO es "game over" a secas — es el retorno al
# estado inicial, y ahi desembocan varias vias, asi que se separan en origen.
#
# Y OJO CON LOS SALTOS CONDICIONALES: un set_bp en 0xA533 (`jp c,L_A2D2`)
# salta cada vez que se EJECUTA la instruccion, se tome el salto o no. O sea
# que cuenta descuentos de vida, NO game overs. Para saber si el salto se
# tomo habria que mirar el acarreo; aqui no se hace, asi que la etiqueta dice
# lo que de verdad mide.
debug set_bp 0xA533 {} { say "DESCUENTO [modo]  (ejecuta el jp c del embudo; NO implica game over)" }
# Estos dos si son `jp` incondicionales: ejecutarlos es tomarlos.
debug set_bp 0xBF6C {} { say "FINAL     [modo]  (se paso el juego: desde 0xBF47)" }
debug set_bp 0xBD78 {} { say "FIN_BD78  [modo]" }
# Las dos vias de muerte.
debug set_bp 0xB123 {} { say "MUERTE    [modo]  impacto" }
debug set_bp 0xA66C {} { say "MUERTE    [modo]  caida" }
# El embudo: descuenta la vida.
debug set_bp 0xA528 {} { say "VIDA--    [modo]  C45F=[debug read memory 0xC45F] antes de restar" }

proc vigila {} {
    global FIN
    if {[machine_info time] >= $FIN} { say "FIN"; exit 0 }
    after time 30 vigila
}
after time 30 vigila
set throttle off
