#!/usr/bin/env python3
"""Toca la musica de Stardust a TRES voces, ejecutando el interprete del juego.

La diferencia con tools/suena_musica.py: aquella toca UN guion y solo saca
alturas -ni mezclador, ni ruido, ni envolventes-, y por eso la musica sonaba a
cuatro notas graves. Esta ejecuta el interprete completo, los tres canales a la
vez y cuadro a cuadro, y compone la sombra de los once registros del PSG igual
que hace el juego en cada interrupcion:

  - las dos envolventes por canal (0xE283 la de volumen, con dos fases, y
    0xE2C4 la de periodo, con tres), con sus plantillas sacadas del instrumento
    que instala el comando 0x87 -quince bytes en 0xE5E2 + n*15-;
  - el mezclador (0xE529), que es lo que decide si un canal saca TONO, RUIDO o
    nada: la pareja de bits 0x09 desplazada tantas posiciones como el canal;
  - el barrido de ruido global (0xE359) que arranca el comando 0x89;
  - y el volcado (0xE5CD): volumen = (ix+009) + (ix+02A) a cuatro bits, periodo
    = (ix+00A/00B) + (ix+02B/02C) a doce.

PARA QUE SIRVE, ademas de oirla: el canal 2 recibe 0xECCB, que es un 0x8B -el
comando FIN- y entra mudo. Detras, en 0xECCC, hay un guion completo que nadie
nombra, y con `--canal2 0xECCC` se puede oir lo que ese guion toca. Es
percusion: sus 44 llamadas a la frase 2 abren el RUIDO y cierran el TONO.

LO QUE ESTO ES Y LO QUE NO ES. Esto es NUESTRA LECTURA sonando: si un comando
estuviera mal leido, sonaria el error. No es una medida del chip. La medida de
verdad se hace con tools/omsx_psg_pista.tcl sobre el emulador y se reproduce con
tools/suena_pista.py; esas dos son la referencia contra la que juzgar esta.

Uso:  suena_tres_voces.py work/juego.raw salida.wav [--canal2 0xECCB] [--seg 45]
"""
import struct
import sys

# El juego trae la MISMA musica dos veces, una por bloque de la cinta, con el
# subsistema de sonido entero duplicado y reubicado. Los tres guiones son
# identicos byte a byte -0xEB52 y 0xCE45 estan a 0x1D0D uno de otro-, pero las
# tablas no van todas al mismo desfase (las frases estan a 0x1CE5) y cuatro
# instrumentos se retocaron, asi que cada bloque necesita sus direcciones.
#
# Y LOS DOS TRAEN EL MISMO FALLO: la voz 2 recibe la direccion de un 0x8B, o
# sea el comando FIN, y entra muda. El guion de percusion empieza un byte mas
# alla y es el mismo en los dos (137 bytes identicos).
BLOQUES = {
    "naves": dict(raw="work/juego.raw", org=0x47A0,
                  notas=0xE6E3, frases=0xE7C1, instru=0xE5E2, efectos=0xE6D2,
                  voces=(0xEB52, 0xEC4A, 0xECCB), percusion=0xECCC),
    "apie":  dict(raw="work/parte2.raw", org=0x61D0,
                  notas=0xC9FE, frases=0xCADC, instru=0xC8F7, efectos=0xC9E7,
                  voces=(0xCE45, 0xCF3D, 0xCFBE), percusion=0xCFBF),
}

ORG = 0x47A0
NOTAS = 0xE6E3          # 96 periodos de 16 bits
FRASES = 0xE7C1         # 20 punteros a frases
INSTRU = 0xE5E2         # 15 bytes por instrumento
EFECTOS = 0xE6D2        # 6 bytes por efecto (el barrido de ruido)

# Los tres guiones que reparte arranca_musica (0xE16F).
VOZ0 = 0xEB52
VOZ1 = 0xEC4A
VOZ2 = 0xECCB           # el 0x8B que calla el canal; 0xECCC es el guion de verdad


ACTIVO = "naves"


def usa_bloque(nombre):
    """Reapunta las tablas del modulo al bloque pedido: 'naves' o 'apie'."""
    global ORG, NOTAS, FRASES, INSTRU, EFECTOS, VOZ0, VOZ1, VOZ2, ACTIVO
    b = BLOQUES[nombre]
    ACTIVO = nombre
    ORG, NOTAS, FRASES = b["org"], b["notas"], b["frases"]
    INSTRU, EFECTOS = b["instru"], b["efectos"]
    VOZ0, VOZ1, VOZ2 = b["voces"]
    return b

HZ = 22050
RELOJ = 3579545 / 2.0 / 16.0     # el divisor de tono del AY-3-8910
CUADRO = 1 / 50.0

# Las 16 amplitudes del AY, normalizadas: unos 3 dB por paso, no una rampa.
AMP = [0.0000, 0.0137, 0.0205, 0.0291, 0.0423, 0.0618, 0.0847, 0.1369,
       0.1691, 0.2647, 0.3527, 0.4499, 0.5704, 0.6873, 0.8482, 1.0000]

ARG = {0x80: 1, 0x81: 1, 0x82: 0, 0x83: 1, 0x84: 0, 0x85: 1, 0x86: 0, 0x87: 1,
       0x88: 1, 0x89: 1, 0x8A: 1, 0x8B: 0, 0x8C: 1, 0x8D: 0, 0x8E: 1}


def con_signo(b):
    return b - 256 if b > 127 else b


class Canal:
    """Los 46 bytes del estado de un canal (0xED75 + canal*0x2E)."""

    def __init__(self):
        self.ini = 0          # +00/01  puntero de inicio
        self.pc = 0           # +02/03  puntero de ejecucion
        self.queda = 0        # +04/05  cuenta atras de la nota en curso
        self.dur = 0          # +06/07  duracion recargable
        self.mezcla = 0       # +08     bits de tono y ruido del comando 0x81
        self.vol = 0          # +09     volumen de la partitura
        self.periodo = 0      # +0A/0B  periodo de la nota
        self.esp_v = [0, 0]      # +0C/0D  esperas vivas de la envolvente de volumen
        self.pas_v = [0, 0]      # +0E/0F  pasos vivos
        self.esp_p = [0, 0, 0]   # +10..12 esperas vivas de la de periodo
        self.pas_p = [0, 0, 0]   # +13..15 pasos vivos
        # La plantilla del instrumento, quince bytes en +16..+24
        self.t_pas_v = [0, 0]
        self.t_pas_p = [0, 0, 0]
        self.t_del_v = [0, 0]
        self.t_del_p = [0, 0, 0]
        self.t_esp_v = [0, 0]
        self.t_esp_p = [0, 0, 0]
        self.acc_v = 0        # +2A     lo que la envolvente lleva sumado al volumen
        self.acc_p = 0        # +2B/2C  idem al periodo
        self.flags = 0        # +2D     banderas del canal
        self.pila = []        # la pila de frases (0xEE1B + canal*2)

    def instrumento(self, d, n):
        """op_instrumento (0xE4A6): quince bytes a +16, y ocho campos a cero."""
        p = INSTRU - ORG + n * 15
        b = d[p:p + 15]
        self.t_pas_v = [b[0], b[1]]
        self.t_pas_p = [b[2], b[3], b[4]]
        self.t_del_v = [con_signo(b[5]), con_signo(b[6])]
        self.t_del_p = [con_signo(b[7]), con_signo(b[8]), con_signo(b[9])]
        self.t_esp_v = [b[10], b[11]]
        self.t_esp_p = [b[12], b[13], b[14]]
        self.flags &= ~0x03
        self.esp_v = [0, 0]
        self.esp_p = [0, 0, 0]
        self.acc_v = 0
        self.acc_p = 0

    def envolvente_1(self):
        """carga_envolvente_1 (0xE3A3): +20 -> +0C y +16 -> +0E, dos fases."""
        self.esp_v = list(self.t_esp_v)
        self.pas_v = list(self.t_pas_v)

    def envolvente_2(self):
        """carga_envolvente_2 (0xE3BB): +22 -> +10 y +18 -> +13, tres fases."""
        self.esp_p = list(self.t_esp_p)
        self.pas_p = list(self.t_pas_p)

    def limpia(self):
        """op_fin (0xE418): los 46 bytes a cero."""
        self.__init__()


class Musica:
    def __init__(self, d, guiones):
        self.d = d
        self.c = [Canal(), Canal(), Canal()]
        self.transp = [0, 0, 0]     # 0xEE21 + canal
        self.r7 = 0xFF              # 0xEE14, el mezclador: un bit a 1 es canal mudo
        self.ruido_base = 0         # 0xEE0A
        self.ruido_barrido = 0      # 0xEE0B
        self.ruido = 0              # 0xEE13
        self.tempo = 1              # 0xEE18
        self.gflags = 0             # 0xEE09
        # El barrido de ruido global, dos fases (0xEDFF-0xEE08)
        self.g_esp = [0, 0]
        self.g_pas = [0, 0]
        self.g_t_pas = [0, 0]
        self.g_del = [0, 0]
        self.g_t_esp = [0, 0]
        for i, g in enumerate(guiones):
            if g:
                self.c[i].ini = g
                self.c[i].pc = g

    def byte(self, a):
        return self.d[a - ORG]

    def palabra(self, a):
        return self.d[a - ORG] | (self.d[a - ORG + 1] << 8)

    def mezclador_canal(self, canal, bits):
        """0xE529: R7 = (R7 | 0x09<<canal) & ~((bits & 9) << canal)."""
        enciende = 0x09 << canal
        apaga = (bits << canal) & 0xFF
        self.r7 = ((self.r7 | enciende) & ~apaga) & 0xFF

    def efecto(self, n):
        """op_efecto (0xE4EF): seis bytes de 0xE6D2 + n*6, y el bit 2 apagado."""
        self.gflags &= ~0x04
        p = EFECTOS - ORG + n * 6
        b = self.d[p:p + 6]
        self.g_t_pas = [b[0], b[1]]
        self.g_del = [con_signo(b[2]), con_signo(b[3])]
        self.g_t_esp = [b[4], b[5]]
        self.g_esp = [0, 0]
        self.ruido_barrido = 0

    def refresca_globales(self):
        """0xE3D3: (iy+008) -> (iy+000) y (iy+004) -> (iy+002), dos veces."""
        self.g_esp = list(self.g_t_esp)
        self.g_pas = list(self.g_t_pas)

    # ---------------------------------------------------------------- el tic
    def interprete(self, i):
        """L_E203 para un canal: lee el guion si toca, y corre las envolventes."""
        c = self.c[i]
        if c.queda == 0:
            self.mezclador_canal(i, 0)      # 0xE213: lo primero es CALLAR
            if c.pc == 0:
                return
            self.lee_guion(i)
        c.queda = (c.queda - 1) & 0xFFFF

        # La envolvente de VOLUMEN: dos fases (L_E283).
        hizo = 0
        for f in range(2):
            if c.esp_v[f]:
                c.esp_v[f] -= 1
                hizo += 1
                break
            if c.pas_v[f]:
                c.pas_v[f] -= 1
                c.acc_v = (c.acc_v + c.t_del_v[f]) & 0xFF
                c.esp_v[f] = c.t_esp_v[f]
                hizo += 1
                break
        if not hizo and (c.flags & 0x01):
            c.envolvente_1()

        # La envolvente de PERIODO: tres fases (L_E2C4), a doce bits.
        hizo = 0
        for f in range(3):
            if c.esp_p[f]:
                c.esp_p[f] -= 1
                hizo += 1
                break
            if c.pas_p[f]:
                c.pas_p[f] -= 1
                c.acc_p = (c.acc_p + c.t_del_p[f]) & 0xFFF
                c.esp_p[f] = c.t_esp_p[f]
                hizo += 1
                break
        if not hizo and (c.flags & 0x02):
            c.envolvente_2()

    def lee_guion(self, i):
        """L_E222: comandos hasta que uno consuma tiempo (0xE25C) o el canal muera."""
        c = self.c[i]
        d = self.d
        for _ in range(4000):               # cinturon: guion que se muerde la cola
            b = self.byte(c.pc)
            if b < 0x80:                    # una NOTA
                nota = (b + self.transp[i]) & 0xFF
                c.periodo = self.palabra(NOTAS + nota * 2)
                c.pc += 1
                self.ataca(i)
                return
            n = ARG[b]
            arg = self.byte(c.pc + 1) if n else 0
            sig = c.pc + 1 + n
            if b == 0x80:                   # volumen
                c.vol = arg & 0x0F
                c.pc = sig
            elif b == 0x81:                 # tono / ruido
                c.mezcla = arg & 0x09
                c.pc = sig
            elif b == 0x82:                 # BUCLE (o fin, solo en el canal 1)
                if i == 1 and self.fin_pedido:
                    c.limpia()
                    return
                c.pc = c.ini
            elif b == 0x83:                 # duracion = n * tempo
                c.dur = (arg * self.tempo) & 0xFFFF
                c.pc = sig
            elif b == 0x84:                 # liga: cuenta duracion SIN reatacar
                c.pc = sig
                self.arranca_duracion(i)
                return
            elif b == 0x85:                 # tempo
                self.tempo = (6000 // (arg * 8)) & 0xFF if arg else 1
                c.pc = sig
            elif b == 0x86:                 # tempo a 1
                self.tempo = 1
                c.pc = sig
            elif b == 0x87:                 # instrumento
                c.instrumento(d, arg)
                c.pc = sig
            elif b == 0x88:                 # periodo de ruido
                self.ruido_base = arg & 0x1F
                self.refresca_globales()
                c.pc = sig
                if arg & 0x80:              # con el bit 7, sigue sin atacar
                    continue
                self.ataca(i)
                return
            elif b == 0x89:                 # efecto: el barrido de ruido
                self.efecto(arg)
                c.pc = sig
            elif b == 0x8A:                 # banderas, con OR
                c.flags |= arg
                self.gflags |= arg
                c.pc = sig
            elif b == 0x8B:                 # FIN
                c.limpia()
                return
            elif b == 0x8C:                 # llama a la frase
                c.pila.append(sig)
                c.pc = self.palabra(FRASES + arg * 2)
            elif b == 0x8D:                 # vuelve
                if not c.pila:
                    c.limpia()
                    return
                c.pc = c.pila.pop()
            elif b == 0x8E:                 # transposicion
                self.transp[i] = con_signo(arg)
                c.pc = sig
        c.limpia()

    def ataca(self, i):
        """ataca_nota (0xE244): abre el mezclador y rearma las dos envolventes."""
        c = self.c[i]
        self.mezclador_canal(i, c.mezcla)
        c.envolvente_1()
        c.acc_v = 0
        c.envolvente_2()
        c.acc_p = 0
        self.arranca_duracion(i)

    def arranca_duracion(self, i):
        c = self.c[i]
        c.queda = c.dur

    def tic(self):
        """Un cuadro: los tres canales, el barrido global y la sombra del PSG."""
        for i in range(3):
            self.interprete(i)
        # El barrido de ruido global, dos fases (L_E359).
        hizo = 0
        for f in range(2):
            if self.g_esp[f]:
                self.g_esp[f] -= 1
                hizo += 1
                break
            if self.g_pas[f]:
                self.g_pas[f] -= 1
                self.ruido_barrido = (self.ruido_barrido + self.g_del[f]) & 0xFF
                self.g_esp[f] = self.g_t_esp[f]
                hizo += 1
                break
        if not hizo and (self.gflags & 0x04):
            self.refresca_globales()
        self.ruido = (self.ruido_base + self.ruido_barrido) & 0xFF
        # El volcado (0xE327): volumen a cuatro bits, periodo a doce.
        per, vol = [], []
        for i in range(3):
            c = self.c[i]
            vol.append((c.vol + c.acc_v) & 0x0F)
            per.append((c.periodo + c.acc_p) & 0xFFFF)
        return per, vol, self.r7, self.ruido & 0x1F

    fin_pedido = False


def sintetiza(cuadros):
    """Los cuadros del PSG a muestras: tres cuadradas y un ruido de 17 bits."""
    fase = [0.0, 0.0, 0.0]
    lfsr = 1
    fase_r = 0.0
    m = bytearray()
    por_cuadro = int(CUADRO * HZ)
    for per, vol, r7, rui in cuadros:
        # Cuanto avanza cada oscilador por muestra.
        paso = []
        for c in range(3):
            paso.append(RELOJ / per[c] / HZ if per[c] > 0 else 0.0)
        paso_r = (RELOJ / rui / HZ) if rui > 0 else RELOJ / 1.0 / HZ
        amp = [AMP[vol[c]] for c in range(3)]
        # Los bits del mezclador: 1 quiere decir CERRADO.
        tdis = [(r7 >> c) & 1 for c in range(3)]
        ndis = [(r7 >> (c + 3)) & 1 for c in range(3)]
        for _ in range(por_cuadro):
            fase_r += paso_r
            while fase_r >= 1.0:
                fase_r -= 1.0
                # El registro de desplazamiento de 17 bits del AY.
                lfsr = (lfsr >> 1) | (((lfsr ^ (lfsr >> 3)) & 1) << 16)
            nbit = lfsr & 1
            v = 0.0
            for c in range(3):
                if amp[c] == 0.0:
                    continue
                if paso[c]:
                    fase[c] += paso[c]
                    if fase[c] >= 1.0:
                        fase[c] -= int(fase[c])
                tbit = 1 if (tdis[c] or fase[c] < 0.5) else 0
                nb = 1 if ndis[c] else nbit
                if tbit and nb:
                    v += amp[c]
            s = int(128 + 40 * v)
            m.append(255 if s > 255 else (0 if s < 0 else s))
    return bytes(m)


def escribe_wav(ruta, datos):
    with open(ruta, "wb") as f:
        f.write(b"RIFF" + struct.pack("<I", 36 + len(datos)) + b"WAVEfmt ")
        f.write(struct.pack("<IHHIIHH", 16, 1, 1, HZ, HZ, 1, 8))
        f.write(b"data" + struct.pack("<I", len(datos)) + datos)


def main(raw, salida, *flags):
    f = list(flags)
    canal2 = None
    segundos = 45.0
    solo2 = False
    while f:
        k = f.pop(0)
        if k == "--canal2":
            canal2 = int(f.pop(0), 0)
        elif k == "--seg":
            segundos = float(f.pop(0))
        elif k == "--bloque":
            usa_bloque(f.pop(0))
        elif k == "--descallada":
            canal2 = BLOQUES[ACTIVO]["percusion"]
        elif k == "--solo-percusion":
            solo2 = True
    d = open(raw, "rb").read()
    if canal2 is None:
        canal2 = VOZ2
    voces = [0, 0, canal2] if solo2 else [VOZ0, VOZ1, canal2]
    m = Musica(d, voces)
    n = int(segundos / CUADRO)
    cuadros = [m.tic() for _ in range(n)]
    escribe_wav(salida, sintetiza(cuadros))
    # Un resumen que sirve de comprobacion: si el canal 2 esta mudo, ni tono ni
    # ruido abiertos y volumen a cero en todos los cuadros.
    print("canal 2 = 0x%04X, %d cuadros (%.1f s) -> %s" % (canal2, n, segundos, salida))
    for c in range(3):
        tono = sum(1 for _, _, r7, _ in cuadros if not (r7 >> c) & 1)
        rui = sum(1 for _, _, r7, _ in cuadros if not (r7 >> (c + 3)) & 1)
        vmax = max(v[c] for _, v, _, _ in cuadros)
        pers = len({p[c] for p, _, _, _ in cuadros if p[c]})
        print("  canal %d: tono abierto %5d cuadros, ruido %5d, volumen max %2d, "
              "%d periodos distintos" % (c, tono, rui, vmax, pers))
    return 0


if __name__ == "__main__":
    sys.exit(main(*sys.argv[1:]))
