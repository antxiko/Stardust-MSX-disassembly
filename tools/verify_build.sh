#!/bin/sh
# Verificacion de reproducibilidad: ensambla un listado y comprueba que sale
# EXACTAMENTE el binario original, byte a byte.
#
# Es el criterio que decide si el desensamblado es fiable. Mientras esto no este
# en verde, cualquier modificacion del juego se hace a ciegas: no habria forma de
# saber si un cambio de comportamiento viene de lo que hemos tocado o de un error
# del propio desensamblado.
#
# Uso: verify_build.sh <listado.asm> <binario_original> <org>

set -e
ASM="$1"
ORIG="$2"
ORG="$3"
OUT="/tmp/$(basename "$ASM" .asm).bin"

echo "== ensamblando $ASM (org $ORG) =="
if ! pasmo --bin "$ASM" "$OUT" 2>/tmp/pasmo.err; then
    echo "FALLO: pasmo no pudo ensamblar. Primeros errores:"
    head -20 /tmp/pasmo.err
    exit 1
fi

SZ_A=$(wc -c < "$OUT" | tr -d ' ')
SZ_B=$(wc -c < "$ORIG" | tr -d ' ')
H_A=$(shasum -a 256 "$OUT"  | cut -d' ' -f1)
H_B=$(shasum -a 256 "$ORIG" | cut -d' ' -f1)

echo "  ensamblado : $SZ_A bytes  $H_A"
echo "  original   : $SZ_B bytes  $H_B"

if [ "$H_A" = "$H_B" ]; then
    echo "OK: reproducible byte a byte"
    exit 0
fi

echo "DIFIERE. Primeras discrepancias:"
cmp -l "$OUT" "$ORIG" 2>/dev/null | head -20 || true
echo "(total de bytes distintos: $(cmp -l "$OUT" "$ORIG" 2>/dev/null | wc -l | tr -d ' '))"
exit 1
