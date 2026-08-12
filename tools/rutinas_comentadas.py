#!/usr/bin/env python3
"""Cuantas rutinas del listado tienen un comentario que diga que hacen.

POR QUE HACE FALTA MEDIRLO
--------------------------
Las rutinas de este desensamblado pasan por tres estados, y es facil
confundirlos:

  1. ACOTADA   el trazador sabe donde empieza y donde acaba
  2. NOMBRADA  alguien ha averiguado que es y le ha puesto nombre
  3. COMENTADA hay escrito que hace, y con que evidencia

La pagina «Lo que falta» publica cuantas van por el tercer estado, y esa cifra
no se puede llevar a mano: se queda vieja en cuanto se comenta una rutina mas.

QUE CUENTA COMO RUTINA
----------------------
Una etiqueta del listado que sea destino de al menos un `call`, o que este
declarada en el fichero de puntos de entrada. Los destinos de salto NO cuentan:
la mayoria son bucles internos de otra rutina, y contarlos es la confusion que
ya inflo una cifra publicada a 1956 (ver «Lo que falta»).

QUE CUENTA COMO COMENTADA
-------------------------
Que su direccion tenga una directiva L o C en el fichero .notes, que es lo que
mkasm.py convierte en el comentario del listado.

Uso: rutinas_comentadas.py <listado.asm> <notas> <entradas> [...]
"""
import re
import sys


def anotadas(path):
    """Direcciones con directiva L (etiqueta con comentario) o C (comentario)."""
    out = set()
    with open(path, encoding="utf-8") as f:
        for linea in f:
            m = re.match(r"^([LC])\s+(0x[0-9A-Fa-f]+)\b", linea.strip())
            if m:
                out.add(int(m.group(2), 16))
    return out


def declaradas(path):
    out = set()
    with open(path, encoding="utf-8") as f:
        for linea in f:
            m = re.match(r"^(0x[0-9A-Fa-f]{4})\s+\S+", linea.strip())
            if m:
                out.add(int(m.group(1), 16))
    return out


def rutinas(asm, entradas):
    """{direccion: nombre} de las etiquetas que empiezan una rutina."""
    etiqueta, llamadas, pendiente = {}, set(), None
    with open(asm, encoding="utf-8") as f:
        for linea in f:
            m = re.match(r"^([A-Za-z_]\w*):\s*(?:;.*)?$", linea)
            if m:
                pendiente = m.group(1)
                continue
            m = re.match(r"^\t(.*?)\s*;([0-9a-f]{4})\b", linea)
            if not m:
                continue
            if pendiente:
                etiqueta[int(m.group(2), 16)] = pendiente
                pendiente = None
            c = re.match(r"^call\s+(?:\w+,)?(\S+)", m.group(1).strip())
            if c:
                llamadas.add(c.group(1))
    decl = declaradas(entradas)
    return {d: n for d, n in etiqueta.items() if n in llamadas or d in decl}


def main(*args):
    if len(args) < 3 or len(args) % 3:
        print(__doc__)
        return 2
    total_r = total_c = 0
    for i in range(0, len(args), 3):
        asm, notas, entradas = args[i], args[i + 1], args[i + 2]
        rut = rutinas(asm, entradas)
        anot = anotadas(notas)
        con = sum(1 for d in rut if d in anot)
        total_r += len(rut)
        total_c += con
        nombre = asm.split("/")[-1].replace("stardust_", "").replace(".asm", "")
        print("  %-10s %3d rutinas, %3d comentadas (%.0f %%)"
              % (nombre, len(rut), con, 100.0 * con / len(rut) if rut else 0))
    print("  %-10s %3d rutinas, %3d comentadas (%.0f %%)"
          % ("TOTAL", total_r, total_c,
             100.0 * total_c / total_r if total_r else 0))
    return 0


if __name__ == "__main__":
    sys.exit(main(*sys.argv[1:]))
