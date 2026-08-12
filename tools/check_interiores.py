#!/usr/bin/env python3
"""Caza los puntos de entrada que NO son inicios de rutina.

Un punto de entrada declarado en un .entries deberia ser el PRINCIPIO de una
rutina. Si la instruccion inmediatamente anterior no corta el flujo -o sea, si
no es un `ret`, un `jp`/`jr` incondicional, un `reti`/`retn` ni un `djnz` que
salga-, entonces se puede CAER dentro desde arriba, y lo que hay ahi no es una
rutina: es una etiqueta interior (el bucle de otra, casi siempre).

Por que importa: la cifra de "rutinas identificadas" que publica la web se
cuenta sobre los .entries. Contar etiquetas interiores la infla, que es
exactamente el error que ya se cometio una vez publicando 1956 etiquetas del
trazador como si fueran rutinas.

De donde salen: de sembrar el trazador con direcciones medidas en el emulador.
Un watchpoint sobre el puerto 0x98 reporta el PC del `out`, que cae en mitad
del bucle de dibujado, no en la cabecera de la rutina.

Uso:  check_interiores.py <src/X.asm> <src/X.entries> [...]
Salida: una linea por punto interior, con la instruccion anterior como prueba.
Codigo de salida 1 si hay alguno, para poder colgarlo del Makefile.
"""
import re
import sys

# Que instrucciones cortan el flujo, o sea, tras las cuales NO se puede caer
# en lo que venga detras.
#
# Esto estuvo escrito como una lista de prefijos -`jp` seguido de un digito
# hexadecimal, de una L, de un guion bajo o de un parentesis- y tenia dos
# agujeros, los dos en la direccion de contar de menos:
#
#   1. En cuanto una rutina recibe NOMBRE en el .notes, el listado pasa a decir
#      `jp pinta_marca_hud`, que no empieza por ninguno de esos caracteres. El
#      salto dejaba de contar como corte y lo de debajo aparecia como etiqueta
#      interior. O sea que la herramienta castigaba justo el trabajo de
#      comentar: cuantas mas rutinas se nombraban, mas falsos interiores salian
#      y mas bajaba sola la cifra publicada.
#   2. `^ret` tambien casa con `ret nz`, y un ret CONDICIONAL no corta nada.
#
# Se mira por la condicion, que es lo que de verdad decide: un `jp`/`jr` corta
# si su operando no empieza por una de las ocho condiciones del Z80 seguida de
# coma. Asi el destino puede llamarse como quiera -incluido `premia`, que
# empieza por p, o `carga_cinta`, que empieza por c- sin confundirse con `jp
# p,` ni con `jp c,`, porque sin la coma no es una condicion.
CONDICION = re.compile(r"^(?:nz|z|nc|c|po|pe|p|m)\s*,")


def corta_el_flujo(instruccion):
    texto = instruccion.strip().lower()
    if texto in ("ret", "reti", "retn"):
        return True
    m = re.match(r"^(?:jp|jr)\s+(.*)$", texto)
    return bool(m) and not CONDICION.match(m.group(1).strip())


def instrucciones(ruta):
    """Devuelve {direccion: (texto, direccion_anterior)} leyendo el listado."""
    orden, texto = [], {}
    with open(ruta, encoding="utf-8") as f:
        for linea in f:
            m = re.search(r";([0-9a-f]{4})\s*$", linea.rstrip())
            if not m:
                continue
            dire = int(m.group(1), 16)
            cuerpo = linea.split(";")[0].strip()
            if not cuerpo or cuerpo.endswith(":"):
                continue
            orden.append(dire)
            texto[dire] = cuerpo
    orden.sort()
    previa = {}
    for i, d in enumerate(orden):
        if i:
            previa[d] = orden[i - 1]
    return texto, previa


def main(*args):
    if len(args) < 2 or len(args) % 2:
        print(__doc__)
        return 2
    malos = 0
    for i in range(0, len(args), 2):
        asm, entries = args[i], args[i + 1]
        texto, previa = instrucciones(asm)
        with open(entries, encoding="utf-8") as f:
            for linea in f:
                m = re.match(r"0x([0-9A-Fa-f]{4})\s+(\S+)", linea.strip())
                if not m:
                    continue
                dire, nombre = int(m.group(1), 16), m.group(2)
                if dire not in texto or dire not in previa:
                    continue
                # Contiguidad: solo se puede CAER desde la instruccion de
                # arriba si esta pegada. Una instruccion Z80 mide 1-4 bytes;
                # si hay mas hueco es que en medio hay DATOS, y entonces no
                # hay caida posible. Sin esta comprobacion salen falsos
                # positivos a punados (los op_XX del interprete de guiones
                # estan precedidos por sus tablas, a 72 bytes de distancia).
                if dire - previa[dire] > 4:
                    continue
                anterior = texto[previa[dire]]
                if not corta_el_flujo(anterior):
                    print("  INTERIOR 0x%04X %-22s se cae desde 0x%04X: %s"
                          % (dire, nombre, previa[dire], anterior))
                    malos += 1
    if malos:
        print("  %d puntos de entrada son etiquetas INTERIORES, no rutinas" % malos)
        return 1
    print("  OK: todos los puntos de entrada son inicios de rutina")
    return 0


if __name__ == "__main__":
    sys.exit(main(*sys.argv[1:]))
