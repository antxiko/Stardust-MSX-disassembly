; ==========================================================================
; STARDUST - MSX - el logo de Topo Soft
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x09470


; ----------------------------------------------------------------------
; Direcciones que solo aparecen como VALOR -en un `ld`, no en
; un salto-: son punteros que el codigo se pasa o numeros que
; casualmente coinciden con una direccion. No hay nada que
; trazar en ellas; el equ existe para que el listado ensamble.
; ----------------------------------------------------------------------
l94f3h:	equ 0x094f3

; ======================================================================
; CODIGO 0x9470..0x9694  (548 bytes)
; ======================================================================



; ----------------------------------------------------------------------
; ############################################################
; EL LOGO DE TOPO SOFT
; ############################################################
; Una animacion corta: los trozos del logo entran recorriendo
; una trayectoria y al llegar se quedan. Se temporiza esperando
; barridos de pantalla, no contando vueltas de un bucle, asi que
; va al mismo ritmo en cualquier maquina.
; Verificado en openMSX: el juego pasa por 0x9470 a los 69,7 s
; de empezar a cargar la cinta.
; ----------------------------------------------------------------------
topo_inicio:		; Punto de entrada (BLOAD ,R)
	jp topo_main		;9470   ; el codigo util empieza mas adelante; esto solo salta alli
corre_el_color:		; Corre el color por las dos bandas del recuadro de abajo, de izquierda a derecha; no anima el logo. La llama topo_main desde 0x95FA
	ld hl,02f78h		;9473   ; primera celda de color que se retoca
	ld de,02fb8h		;9476   ; y la ultima, ocho caracteres mas alla
	ld bc,000f7h		;9479   ; salto a la segunda banda: con los ocho bytes que ya avanzo pinta_celda son 255, uno menos que la fila de caracteres entera
L_947C:
	and a			;947c   ; compara HL con DE para saber si ha llegado al final del recorrido
	sbc hl,de		;947d
	ret z			;947f
	add hl,de			;9480
	ld a,081h		;9481   ; rojo sobre negro en la banda de arriba
	call pinta_celda		;9483
	push hl			;9486
	add hl,bc			;9487   ; la misma columna, en la de abajo
	ld a,081h		;9488
	call pinta_celda		;948a
	pop hl			;948d
	push hl			;948e
	ld a,0f1h		;948f   ; y blanco sobre negro una celda mas a la derecha
	call pinta_celda		;9491
	add hl,bc			;9494
	ld a,0f1h		;9495
	call pinta_celda		;9497
	pop hl			;949a
	ei			;949b   ; la interrupcion, solo para poder esperar
	push bc			;949c
	ld b,003h		;949d
L_949F:
	halt			;949f   ; espera 3 interrupciones de barrido: asi se temporiza la animacion
	djnz L_949F		;94a0
	pop bc			;94a2
	di			;94a3
	jr L_947C		;94a4   ; otra celda: el color va corriendo hacia la derecha
pinta_celda:		; Escribe A en ocho bytes seguidos de VRAM: el color de un caracter entero
	push bc			;94a6
	ld b,008h		;94a7   ; ocho bytes: los ocho scanlines de un caracter
L_94A9:
	call 0004dh		;94a9   ; BIOS WRTVRM - Writes data in VRAM
	inc hl			;94ac
	djnz L_94A9		;94ad
	pop bc			;94af
	ret			;94b0
dibuja_trozo:		; Vuelca un trozo del logo a la VRAM. Los tres parametros van parcheados en el propio codigo
	ld hl,0000dh		;94b1   ; la fila por la que empezar. El 0x0D lo parchea quien llama
	add hl,hl			;94b4   ; por dos, que tabla_vram es de palabras
	ld de,096f8h		;94b5
	add hl,de			;94b8
	ld (096f6h),hl		;94b9   ; guarda el puntero a la entrada de tabla_vram
	ld hl,0000eh		;94bc   ; el numero de trozo, tambien parcheado
	add hl,hl			;94bf
	ld de,09694h		;94c0   ; su posicion dentro de los dibujos
	add hl,de			;94c3
	ld e,(hl)			;94c4
	inc hl			;94c5
	ld d,(hl)			;94c6
	ld hl,09728h		;94c7   ; principio del trozo; los dos primeros bytes son la cabecera
	add hl,de			;94ca
	ld a,(hl)			;94cb   ; el ancho en bytes, al contador del bucle interior
	ld (094f1h),a		;94cc
	inc hl			;94cf
	ld a,(hl)			;94d0   ; y las filas, al del exterior
	ld (094ddh),a		;94d1
	inc hl			;94d4
	ld (096f4h),hl		;94d5   ; aqui empiezan los datos
	ld ix,(096f6h)		;94d8   ; la entrada de tabla_vram por la que empezar
	ld c,005h		;94dc   ; cuantas filas (parcheado desde la cabecera)
L_94DE:
	ld e,(ix+000h)		;94de   ; direccion de la fila, sacada de tabla_vram
	inc ix		;94e1
	ld d,(ix+000h)		;94e3
	inc ix		;94e6
	ld hl,000b0h		;94e8   ; la columna, en bytes: tambien parcheada
	add hl,de			;94eb
	ld de,(096f4h)		;94ec   ; el puntero al dibujo, donde lo dejo la fila anterior
	ld b,018h		;94f0   ; bytes de esta fila (parcheado desde la cabecera)
L_94F2:
	ld a,(de)			;94f2
L_94F3:
	nop			;94f3   ; byte parcheable: nop pisa lo que hubiera, `or (hl)` lo superpone a la copia de 0xC000
	inc de			;94f4
	res 7,h		;94f5   ; sin los bits 14 y 15, la direccion de la tabla es la de VRAM
	res 6,h		;94f7
	call 0004dh		;94f9   ; BIOS WRTVRM - Writes data in VRAM
	inc hl			;94fc
	set 6,h		;94fd   ; y con ellos vuelve a apuntar a la copia en RAM
	set 7,h		;94ff
	djnz L_94F2		;9501
	ld (096f4h),de		;9503   ; deja el puntero listo para la fila siguiente
	dec c			;9507   ; una fila menos
	jr nz,L_94DE		;9508
	ret			;950a
anima_topo:		; Recorre secuencia_1 dibujando un trozo cada dos frames en la fila 15
	ld a,00fh		;950b   ; fila 15
	ld (dibuja_trozo+1),a		;950d   ; parchea el `ld hl` de dibuja_trozo: asi se le pasa la fila
	ld a,078h		;9510   ; columna 0x78, el caracter 15
	ld (094e9h),a		;9512
	xor a			;9515   ; sin OR: cada trozo pisa al anterior
	ld (l94f3h),a		;9516
	ld hl,096b2h		;9519   ; la lista de trozos que se van alternando
L_951C:
	ld a,(hl)			;951c   ; numero de trozo; el 0xFF cierra la lista
	cp 0ffh		;951d
	ret z			;951f
	ld (094bdh),a		;9520   ; se lo parchea a dibuja_trozo
	push hl			;9523
	ei			;9524
	ld b,002h		;9525   ; dos frames entre trozo y trozo
L_9527:
	halt			;9527   ; la espera
	djnz L_9527		;9528
	di			;952a
	call dibuja_trozo		;952b   ; y a dibujar
	pop hl			;952e
	inc hl			;952f   ; siguiente numero de la lista
	jr L_951C		;9530
entra_trozo_7:		; El trozo 7 aparece corriendose hacia la derecha
	ld a,007h		;9532   ; el trozo 7, el mas ancho: nueve caracteres por once filas
	ld (094bdh),a		;9534
	ld a,006h		;9537   ; a partir de la fila 6
	ld (dibuja_trozo+1),a		;9539
	ld a,000h		;953c   ; empezando por la columna 0
L_953E:
	cp 018h		;953e   ; tres posiciones: columnas 0, 8 y 16
	ret z			;9540
	ld (094e9h),a		;9541   ; la columna, parcheada
	push af			;9544
	call dibuja_trozo		;9545
	pop af			;9548
	add a,008h		;9549   ; un caracter mas a la derecha
	jr L_953E		;954b
entra_trozo_9:		; El trozo 9, al reves: entra de derecha a izquierda
	ld a,009h		;954d   ; el trozo 9, seis caracteres por diez filas
	ld (094bdh),a		;954f
	ld a,007h		;9552   ; en la fila 7
	ld (dibuja_trozo+1),a		;9554
	ld a,090h		;9557   ; este entra al reves: de la columna 0x90 a la 0x58
L_9559:
	cp 050h		;9559   ; ocho posiciones, de derecha a izquierda
	ret z			;955b
	ld (094e9h),a		;955c   ; la columna, parcheada
	push af			;955f
	ei			;9560   ; un frame entre paso y paso
	halt			;9561
	di			;9562
	call dibuja_trozo		;9563
	pop af			;9566
	sub 008h		;9567   ; un caracter a la izquierda
	jr L_9559		;9569
estela_trozo_8:		; El trozo 8 dibujado en siete filas seguidas, superponiendose
	ld a,0b6h		;956b   ; 0xB6 es `or (hl)`: a partir de aqui el trozo se superpone
	ld (l94f3h),a		;956d
	ld a,008h		;9570   ; el trozo 8, cinco caracteres por siete filas
	ld (094bdh),a		;9572
	ld a,038h		;9575   ; columna 0x38, el caracter 7
	ld (094e9h),a		;9577
	ld a,000h		;957a   ; desde la fila 0
L_957C:
	cp 007h		;957c   ; el mismo trozo en las filas 0 a 6, una encima de otra
	jr z,L_958B		;957e
	ld (dibuja_trozo+1),a		;9580   ; la fila, parcheada
	push af			;9583
	call dibuja_trozo		;9584
	pop af			;9587
	inc a			;9588   ; una fila mas abajo
	jr L_957C		;9589
L_958B:
	jp dibuja_trozo		;958b   ; lo dibuja una vez mas; como va superponiendo con OR, repetir no cambia nada
vuelo_trozo_10:		; El trozo 10 siguiendo el recorrido de 0x96CC
	ld a,00ah		;958e   ; el trozo 10, siete caracteres por diez filas
	ld (094bdh),a		;9590
	ld hl,096cch		;9593   ; el recorrido: parejas de columna y fila
L_9596:
	ld a,(hl)			;9596   ; columna; el 0xFF cierra el recorrido
	cp 0ffh		;9597
	jr z,L_95AB		;9599
	inc hl			;959b
	ld (094e9h),a		;959c   ; parchea la columna
	ld a,(hl)			;959f   ; y detras viene la fila
	inc hl			;95a0
	ld (dibuja_trozo+1),a		;95a1
	push hl			;95a4
	call dibuja_trozo		;95a5   ; cada punto del recorrido, encima del anterior
	pop hl			;95a8
	jr L_9596		;95a9
L_95AB:
	jp dibuja_trozo		;95ab   ; una vez mas en el ultimo punto
ultima_secuencia:		; Recorre secuencia_2 en la fila 13
	ld hl,096e9h		;95ae   ; la segunda lista de trozos
L_95B1:
	ld a,(hl)			;95b1   ; numero de trozo, hasta el 0xFF
	cp 0ffh		;95b2
	ret z			;95b4
	push hl			;95b5
	ld (094bdh),a		;95b6   ; parchea el trozo
	ld a,0b0h		;95b9   ; columna 0xB0, el caracter 22
	ld (094e9h),a		;95bb
	ld a,00dh		;95be   ; fila 13
	ld (dibuja_trozo+1),a		;95c0
	ei			;95c3
	ld b,004h		;95c4   ; cuatro frames entre trozo y trozo
L_95C6:
	halt			;95c6   ; la espera
	djnz L_95C6		;95c7
	di			;95c9
	call dibuja_trozo		;95ca   ; a dibujar
	pop hl			;95cd
	inc hl			;95ce   ; el siguiente de la lista
	jr L_95B1		;95cf
topo_main:		; Lo que hace el logo, de principio a fin
	di			;95d1   ; con la interrupcion parada: el logo se dibuja a mano
	xor a			;95d2
	ld (l94f3h),a		;95d3   ; sin OR, de momento
	call borra_color		;95d6   ; borra la tabla de colores
	call entra_trozo_7		;95d9   ; entran los dos trozos grandes, uno por cada lado
	call entra_trozo_9		;95dc
	call guarda_pantalla		;95df   ; guarda la pantalla en RAM para poder superponer
	call estela_trozo_8		;95e2   ; la estela vertical del trozo 8
	call guarda_pantalla		;95e5   ; vuelve a guardarla, ya con la estela
	call vuelo_trozo_10		;95e8   ; el trozo 10 recorriendo su trayectoria
	call abre_color		;95eb   ; los colores se abren desde el centro
	call pinta_recuadro		;95ee   ; el recuadro de las dos filas de abajo
	call anima_topo		;95f1   ; tres pasadas de la animacion
	call anima_topo		;95f4
	call anima_topo		;95f7
	call corre_el_color		;95fa   ; el color corriendo por el recuadro
	call ultima_secuencia		;95fd   ; y la ultima lista de trozos
	ei			;9600   ; devuelve la interrupcion y vuelve al BASIC
	ret			;9601
borra_color:		; Deja la tabla de colores entera en blanco sobre transparente
	ld hl,02000h		;9602   ; tabla de colores de SCREEN 2: 0x2000, 6144 bytes
	ld bc,01800h		;9605
L_9608:
	ld a,0f0h		;9608   ; 0xF0: blanco sobre transparente en todas las celdas
	call 0004dh		;960a   ; BIOS WRTVRM - Writes data in VRAM
	inc hl			;960d
	dec bc			;960e
	ld a,b			;960f
	or c			;9610
	jr nz,L_9608		;9611
	ret			;9613
pinta_recuadro:		; Rojo sobre negro en dos bandas de ocho caracteres, donde luego corre el color
	ld hl,02f78h		;9614   ; 0x2F78: el color de la fila 15, caracter 15
	ld a,081h		;9617   ; rojo sobre negro
	ld c,002h		;9619   ; dos bandas
L_961B:
	ld b,040h		;961b   ; ocho caracteres cada una
L_961D:
	call 0004dh		;961d   ; BIOS WRTVRM - Writes data in VRAM
	inc hl			;9620
	djnz L_961D		;9621
	ld de,000c0h		;9623   ; 0x40 escritos mas 0xC0: la fila de caracteres siguiente
	add hl,de			;9626
	dec c			;9627
	jr nz,L_961B		;9628
	ret			;962a
abre_color:		; Va coloreando dos columnas que se separan desde el centro
	ld de,00008h		;962b   ; ocho bytes: lo que separa las dos columnas al empezar
	ld hl,02658h		;962e   ; 0x2658: el color de la fila 6, caracter 11, el centro
L_9631:
	push hl			;9631
	ld b,005h		;9632
	push de			;9634
L_9635:
	ld a,071h		;9635   ; cinco filas de cian sobre negro
	call pinta_celda_c		;9637
	ld de,000f8h		;963a   ; ocho escritos mas 0xF8 son 256: la fila de abajo
	add hl,de			;963d
	djnz L_9635		;963e
	ld b,006h		;9640
L_9642:
	ld a,031h		;9642   ; y seis mas de verde sobre negro
	call pinta_celda_c		;9644
	add hl,de			;9647   ; otra vez 256 bytes mas alla
	djnz L_9642		;9648
	pop de			;964a
	pop hl			;964b
	push hl			;964c
	add hl,de			;964d   ; la otra columna, a la distancia que toque
	push de			;964e
	ld b,005h		;964f
L_9651:
	ld a,071h		;9651   ; los mismos cinco de cian
	call pinta_celda_c		;9653
	ld de,000f8h		;9656   ; y la fila de abajo
	add hl,de			;9659
	djnz L_9651		;965a
	ld b,006h		;965c
L_965E:
	ld a,031h		;965e   ; los mismos seis de verde
	call pinta_celda_c		;9660
	add hl,de			;9663   ; fila de abajo
	djnz L_965E		;9664
	pop de			;9666
	pop hl			;9667
	ld a,e			;9668   ; hasta que las dos columnas esten a 0x98 una de otra
	cp 098h		;9669
	ret z			;966b
	ei			;966c
	ld b,004h		;966d
L_966F:
	halt			;966f   ; cuatro frames por paso
	djnz L_966F		;9670
	di			;9672
	add a,010h		;9673   ; la derecha, dos caracteres mas alla
	ld e,a			;9675
	push de			;9676
	ld de,0fff8h		;9677   ; y la izquierda, uno menos: se abren desde el centro
	add hl,de			;967a
	pop de			;967b
	jr L_9631		;967c
pinta_celda_c:		; Igual que pinta_celda pero contando con C
	ld c,008h		;967e   ; ocho bytes, un caracter
L_9680:
	call 0004dh		;9680   ; BIOS WRTVRM - Writes data in VRAM
	inc hl			;9683
	dec c			;9684
	jr nz,L_9680		;9685
	ret			;9687
guarda_pantalla:		; Copia la tabla de patrones de la VRAM a 0xC000, para poder superponer
	ld hl,00000h		;9688   ; la tabla de patrones entera, 6144 bytes
	ld de,0c000h		;968b   ; a 0xC000, que es justo la base de tabla_vram
	ld bc,01800h		;968e
	jp 00059h		;9691   ; BIOS LDIRMV - Block transfers to memory from VRAM | de ahi la lee el `or (hl)` de 0x94F3 para superponer sin borrar

; ----------------------------------------------------------------------
; DATOS tabla_trozos: Quince posiciones dentro de los dibujos de abajo, una
;   por trozo del logo. El codigo indexa aqui (numero de trozo por dos) para
;   saber donde empieza cada uno
;   0x9694..0x96b2  (30 bytes)
DATA_tabla_trozos:
	defb 000h,000h	; 9694
	defb 082h,000h	; 9696
	defb 004h,001h	; 9698
	defb 086h,001h	; 969a
	defb 008h,002h	; 969c
	defb 08ah,002h	; 969e
	defb 00ch,003h	; 96a0
	defb 08eh,003h	; 96a2
	defb 0a8h,006h	; 96a4
	defb 0eah,007h	; 96a6
	defb 0cch,009h	; 96a8
	defb 0feh,00bh	; 96aa
	defb 078h,00ch	; 96ac
	defb 0f2h,00ch	; 96ae
	defb 06ch,00dh	; 96b0

; ----------------------------------------------------------------------
; DATOS secuencia_1: Lista de numeros de dibujo que se van sucediendo, cerrada
;   con 0xFF
;   0x96b2..0x96cc  (26 bytes)
DATA_secuencia_1:
	defb 001h,001h,002h,002h,003h,003h,004h,004h,005h,005h,006h,006h,005h,005h,004h,004h	; 96b2  ................
	defb 003h,003h,002h,002h,001h,001h,000h,000h,0ffh,0ffh	; 96c2  ..........

; ----------------------------------------------------------------------
; DATOS recorrido: La trayectoria de entrada: catorce parejas de coordenadas,
;   cerradas con 0xFF
;   0x96cc..0x96e9  (29 bytes)
DATA_recorrido:
	defb 030h,006h	; 96cc
	defb 030h,005h	; 96ce
	defb 030h,004h	; 96d0
	defb 038h,004h	; 96d2
	defb 038h,003h	; 96d4
	defb 040h,002h	; 96d6
	defb 048h,002h	; 96d8
	defb 050h,001h	; 96da
	defb 058h,002h	; 96dc
	defb 060h,002h	; 96de
	defb 068h,003h	; 96e0
	defb 070h,004h	; 96e2
	defb 070h,005h	; 96e4
	defb 070h,006h	; 96e6
	defb 0ffh	; 96e8

; ----------------------------------------------------------------------
; DATOS secuencia_2: Segunda lista de numeros de dibujo (11, 12, 13, 12, 11,
;   12, 13 y 14), cerrada con 0xFF, y dos bytes de relleno. La recorre 0x95AE,
;   cuatro frames por trozo, en la fila 13
;   0x96e9..0x96f4  (11 bytes)
DATA_secuencia_2:
	defb 00bh,00ch,00dh,00ch,00bh,00ch,00dh,00eh,0ffh,000h,000h	; 96e9  ...........

; ----------------------------------------------------------------------
; DATOS punteros: Dos variables de trabajo que dibuja_trozo reescribe: 0x96F4
;   por donde va leyendo el dibujo y 0x96F6 la entrada de tabla_vram por la
;   que empezo. En la cinta vienen grabadas con 0xA50E y 0x9712, que son el
;   final de los dibujos y la entrada 13 de tabla_vram: justo lo que dejan al
;   dibujar el trozo 14 en la fila 13, el ultimo de secuencia_2
;   0x96f4..0x96f8  (4 bytes)
DATA_punteros:
	defw 0a50eh,09712h	; 96f4

; ----------------------------------------------------------------------
; DATOS tabla_vram: Las veinticuatro filas de caracter de la tabla de
;   patrones, de 256 en 256 bytes. Van apuntadas a 0xC000-0xD700 y no a
;   0x0000-0x1700 porque sirven para las dos cosas: tal cual son la copia que
;   guarda_pantalla deja en RAM, y sin los bits 14 y 15 -que es lo que hace el
;   bucle de 0x94F5- son la direccion de VRAM
;   0x96f8..0x9728  (48 bytes)
DATA_tabla_vram:
	defw 0c000h,0c100h,0c200h,0c300h,0c400h,0c500h,0c600h,0c700h	; 96f8
	defw 0c800h,0c900h,0ca00h,0cb00h,0cc00h,0cd00h,0ce00h,0cf00h	; 9708
	defw 0d000h,0d100h,0d200h,0d300h,0d400h,0d500h,0d600h,0d700h	; 9718

; ----------------------------------------------------------------------
; DATOS dibujos_logo: Los quince trozos del logo, en el orden al que apunta
;   tabla_trozos. Cada uno empieza por dos bytes de cabecera -ancho en bytes y
;   filas de caracter- y detras van ancho*filas bytes de patrones. Sumados los
;   quince dan 3558 bytes, que es exactamente lo que ocupa el bloque: del 0 al
;   6, siete cuadros de 64x2 para la animacion; el 7 de 72x11 y el 9 de 48x10,
;   que son los dos trozos grandes que entran por los lados; el 8 de 40x7, que
;   deja la estela; el 10 de 56x10, el que hace el recorrido; y del 11 al 14,
;   cuatro de 24x5 para la ultima secuencia
;   0x9728..0xa50e  (3558 bytes)
DATA_dibujos_logo:
	defb 040h,002h,000h,000h,000h,01fh,03fh,078h,070h,03fh,000h,000h,000h,0e0h,0f8h,03ch	; 9728  @.....?xp?.....<
	defb 001h,0fdh,000h,000h,000h,01fh,07fh,0f8h,0c0h,080h,000h,000h,000h,0f0h,0fch,03eh	; 9738  ...............>
	defb 007h,003h,000h,000h,000h,003h,007h,01eh,038h,03fh,000h,000h,000h,0ffh,0ffh,000h	; 9748  ........8?......
	defb 000h,080h,000h,000h,000h,09fh,09fh,090h,000h,000h,000h,000h,000h,0feh,0feh,0c2h	; 9758  ................
	defb 0c0h,0c0h,00fh,070h,038h,01fh,007h,000h,000h,000h,0fdh,01ch,038h,0f0h,0c0h,000h	; 9768  ...p8.......8...
	defb 000h,000h,0c0h,0f0h,07ch,01fh,007h,000h,000h,000h,007h,01eh,07ch,0f0h,0c0h,000h	; 9778  ....|.......|...
	defb 000h,000h,03fh,030h,030h,030h,030h,000h,000h,000h,080h,000h,000h,000h,000h,000h	; 9788  ..?0000.........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0c0h,0c0h,0c0h,0c0h,0c0h,000h	; 9798  ................
	defb 000h,000h,040h,002h,000h,000h,000h,000h,000h,000h,01fh,078h,000h,000h,000h,000h	; 97a8  ..@........x....
	defb 000h,000h,0e0h,03ch,000h,000h,000h,000h,000h,000h,01fh,0f8h,000h,000h,000h,000h	; 97b8  ...<............
	defb 000h,000h,0f0h,01eh,000h,000h,000h,000h,000h,000h,003h,01eh,000h,000h,000h,000h	; 97c8  ................
	defb 000h,000h,0ffh,000h,000h,000h,000h,000h,000h,000h,09fh,090h,000h,000h,000h,000h	; 97d8  ................
	defb 000h,000h,0feh,0c2h,03fh,070h,01fh,000h,000h,000h,000h,000h,0fdh,01ch,0f0h,000h	; 97e8  ....?p..........
	defb 000h,000h,000h,000h,080h,0f0h,03fh,000h,000h,000h,000h,000h,003h,01eh,0f8h,000h	; 97f8  ......?.........
	defb 000h,000h,000h,000h,03fh,030h,030h,000h,000h,000h,000h,000h,080h,000h,000h,000h	; 9808  ....?00.........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0c0h,0c0h,0c0h,000h	; 9818  ................
	defb 000h,000h,000h,000h,040h,002h,000h,000h,000h,000h,000h,000h,000h,01fh,000h,000h	; 9828  ....@...........
	defb 000h,000h,000h,000h,000h,0e0h,000h,000h,000h,000h,000h,000h,000h,07fh,000h,000h	; 9838  ................
	defb 000h,000h,000h,000h,000h,0fch,000h,000h,000h,000h,000h,000h,000h,003h,000h,000h	; 9848  ................
	defb 000h,000h,000h,000h,000h,0ffh,000h,000h,000h,000h,000h,000h,000h,09fh,000h,000h	; 9858  ................
	defb 000h,000h,000h,000h,000h,0feh,03fh,01fh,000h,000h,000h,000h,000h,000h,0fdh,0f0h	; 9868  ......?.........
	defb 000h,000h,000h,000h,000h,000h,0c0h,07fh,000h,000h,000h,000h,000h,000h,007h,0fch	; 9878  ................
	defb 000h,000h,000h,000h,000h,000h,03fh,030h,000h,000h,000h,000h,000h,000h,080h,000h	; 9888  ......?0........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0c0h,0c0h	; 9898  ................
	defb 000h,000h,000h,000h,000h,000h,040h,002h,000h,000h,000h,000h,000h,000h,000h,000h	; 98a8  ......@.........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 98b8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 98c8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 98d8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,03fh,000h,000h,000h,000h,000h,000h,000h	; 98e8  ........?.......
	defb 0fdh,000h,000h,000h,000h,000h,000h,000h,0ffh,000h,000h,000h,000h,000h,000h,000h	; 98f8  ................
	defb 0ffh,000h,000h,000h,000h,000h,000h,000h,03fh,000h,000h,000h,000h,000h,000h,000h	; 9908  ........?.......
	defb 0ffh,000h,000h,000h,000h,000h,000h,000h,09fh,000h,000h,000h,000h,000h,000h,000h	; 9918  ................
	defb 0feh,000h,000h,000h,000h,000h,000h,000h,040h,002h,000h,000h,000h,000h,000h,000h	; 9928  ........@.......
	defb 000h,01fh,000h,000h,000h,000h,000h,000h,000h,0f0h,000h,000h,000h,000h,000h,000h	; 9938  ................
	defb 000h,07fh,000h,000h,000h,000h,000h,000h,000h,0fch,000h,000h,000h,000h,000h,000h	; 9948  ................
	defb 000h,030h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9958  .0..............
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,0c0h,03fh,01fh,000h,000h,000h,000h	; 9968  ..........?.....
	defb 000h,000h,0fdh,0e0h,000h,000h,000h,000h,000h,000h,0c0h,07fh,000h,000h,000h,000h	; 9978  ................
	defb 000h,000h,007h,0fch,000h,000h,000h,000h,000h,000h,03fh,003h,000h,000h,000h,000h	; 9988  ..........?.....
	defb 000h,000h,080h,0ffh,000h,000h,000h,000h,000h,000h,000h,09fh,000h,000h,000h,000h	; 9998  ................
	defb 000h,000h,0c0h,0feh,000h,000h,000h,000h,000h,000h,040h,002h,000h,000h,000h,000h	; 99a8  ..........@.....
	defb 000h,000h,01fh,070h,000h,000h,000h,000h,000h,000h,0f0h,01ch,000h,000h,000h,000h	; 99b8  ...p............
	defb 000h,000h,03fh,0f0h,000h,000h,000h,000h,000h,000h,0f8h,01eh,000h,000h,000h,000h	; 99c8  ..?.............
	defb 000h,000h,030h,030h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 99d8  ..00............
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0c0h,0c0h,03fh,078h,01fh,000h	; 99e8  ............?x..
	defb 000h,000h,000h,000h,0fdh,03ch,0e0h,000h,000h,000h,000h,000h,080h,0f8h,01fh,000h	; 99f8  .....<..........
	defb 000h,000h,000h,000h,003h,01eh,0f0h,000h,000h,000h,000h,000h,03fh,01eh,003h,000h	; 9a08  ............?...
	defb 000h,000h,000h,000h,080h,000h,0ffh,000h,000h,000h,000h,000h,000h,090h,09fh,000h	; 9a18  ................
	defb 000h,000h,000h,000h,0c0h,0c2h,0feh,000h,000h,000h,000h,000h,040h,002h,000h,000h	; 9a28  ............@...
	defb 000h,007h,01fh,038h,070h,00fh,000h,000h,000h,0c0h,0f0h,038h,01ch,0fdh,000h,000h	; 9a38  ...8p......8....
	defb 000h,007h,01fh,07ch,0f0h,0c0h,000h,000h,000h,0c0h,0f0h,07ch,01eh,007h,000h,000h	; 9a48  ...|.......|....
	defb 000h,030h,030h,030h,030h,03fh,000h,000h,000h,000h,000h,000h,000h,080h,000h,000h	; 9a58  .0000?..........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,0c0h,0c0h,0c0h,0c0h,0c0h,03fh,070h	; 9a68  ..............?p
	defb 078h,03fh,01fh,000h,000h,000h,0fdh,001h,03ch,0f8h,0e0h,000h,000h,000h,080h,0c0h	; 9a78  x?......<.......
	defb 0f8h,07fh,01fh,000h,000h,000h,003h,007h,03eh,0fch,0f0h,000h,000h,000h,03fh,038h	; 9a88  ........>.....?8
	defb 01eh,007h,003h,000h,000h,000h,080h,000h,000h,0ffh,0ffh,000h,000h,000h,000h,000h	; 9a98  ................
	defb 090h,09fh,09fh,000h,000h,000h,0c0h,0c0h,0c2h,0feh,0feh,000h,000h,000h,048h,00bh	; 9aa8  ..............H.
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,003h,002h,002h,002h,002h,002h	; 9ab8  ................
	defb 000h,000h,0ffh,000h,07fh,03fh,01fh,000h,000h,000h,0ffh,000h,070h,0ddh,072h,000h	; 9ac8  .....?......p.r.
	defb 000h,000h,0ffh,000h,000h,050h,0a8h,001h,000h,000h,0f0h,010h,010h,050h,0d0h,0d0h	; 9ad8  .....P.......P..
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9ae8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9af8  ................
	defb 002h,002h,002h,002h,002h,002h,002h,002h,00fh,008h,084h,08ah,041h,08ah,045h,088h	; 9b08  ............A.E.
	defb 0ffh,000h,000h,000h,000h,000h,000h,080h,0fdh,005h,005h,005h,005h,005h,005h,005h	; 9b18  ................
	defb 0d0h,0d0h,0d0h,090h,0d0h,0d0h,050h,0d0h,000h,000h,000h,000h,000h,000h,000h,000h	; 9b28  ......P.........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9b38  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,002h,002h,002h,002h,002h,002h,03eh,020h	; 9b48  ..............> 
	defb 045h,04ah,0cdh,0a8h,0edh,06ah,0cdh,0eah,000h,000h,040h,080h,040h,020h,040h,0a0h	; 9b58  EJ...j....@.@ @.
	defb 004h,005h,005h,005h,004h,005h,005h,005h,090h,0d0h,050h,0d0h,090h,0d0h,050h,0c0h	; 9b68  ..........P...P.
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9b78  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9b88  ................
	defb 027h,023h,021h,020h,020h,020h,020h,028h,06dh,0aah,0cdh,00eh,0ffh,0feh,0ffh,0ffh	; 9b98  '#!    (m.......
	defb 010h,0a8h,044h,0a8h,050h,0aah,045h,0aah,004h,005h,004h,004h,007h,000h,000h,000h	; 9ba8  ..D.P.E.........
	defb 0b8h,07ch,0f8h,000h,0f0h,020h,020h,040h,000h,000h,000h,000h,000h,000h,000h,000h	; 9bb8  .|...  @........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9bc8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,020h,028h,024h,028h,024h,028h,024h,028h	; 9bd8  ........ ($($($(
	defb 0ffh,0ffh,0ffh,0bfh,0bfh,0bfh,09fh,087h,0d1h,0eah,0d5h,0eah,0f4h,0feh,0ffh,0ffh	; 9be8  ................
	defb 040h,020h,050h,0a8h,004h,0abh,0d0h,0f8h,040h,080h,080h,080h,080h,000h,000h,000h	; 9bf8  @ P.....@.......
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9c08  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9c18  ................
	defb 024h,028h,024h,028h,026h,024h,02eh,02ah,080h,080h,080h,080h,080h,080h,0fch,004h	; 9c28  $($(&$.*........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,001h,001h,001h,000h,003h,00fh	; 9c38  ................
	defb 000h,000h,000h,000h,080h,080h,080h,080h,000h,000h,000h,000h,000h,000h,000h,000h	; 9c48  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9c58  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,02dh,02bh,026h,020h,03fh,000h,000h,000h	; 9c68  ........-+& ?...
	defb 064h,0c4h,086h,002h,082h,083h,081h,0c1h,000h,000h,003h,007h,01fh,03fh,0ffh,0ffh	; 9c78  d............?..
	defb 07fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0c0h,0c0h,0e0h,0e0h,0f0h,0f8h,0f8h,0fch	; 9c88  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9c98  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9ca8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,041h,040h,060h,020h,030h,012h,019h,00ah	; 9cb8  ........A@` 0...
	defb 0ffh,0ffh,0ffh,07fh,07fh,03fh,03fh,09fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9cc8  .....??.........
	defb 0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0c0h,0f0h,0fch,0ffh,0ffh,0ffh	; 9cd8  ................
	defb 000h,000h,000h,000h,000h,0c0h,0ffh,0ffh,000h,000h,000h,001h,007h,07fh,0ffh,0ffh	; 9ce8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9cf8  ................
	defb 00dh,006h,002h,003h,001h,000h,000h,000h,04fh,08fh,057h,02bh,095h,0ceh,05bh,06eh	; 9d08  ........O.W+..[n
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,07fh,0bfh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9d18  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0fdh,0fah,0fdh,0fah,0f5h	; 9d28  ................
	defb 0fah,0d5h,0aah,055h,0aah,055h,0aah,055h,000h,000h,000h,000h,000h,000h,000h,000h	; 9d38  ...U.U.U........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9d48  ................
	defb 037h,01ah,00dh,006h,003h,000h,000h,000h,0dfh,0efh,0f3h,07dh,0beh,0dfh,067h,03bh	; 9d58  7..........}..g;
	defb 0ffh,0ffh,0ffh,0ffh,07fh,09fh,0e7h,0e8h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9d68  ................
	defb 0fah,0f5h,0eah,0f5h,0eah,0f5h,0eah,0d5h,0aah,055h,0aah,055h,0aah,055h,0aah,055h	; 9d78  .........U.U.U.U
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9d88  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9d98  ................
	defb 00ch,007h,001h,000h,000h,000h,000h,000h,0feh,02bh,0ceh,071h,01eh,003h,000h,000h	; 9da8  .........+.q....
	defb 01fh,040h,0aah,015h,000h,0c0h,07eh,003h,0eah,0d5h,000h,000h,000h,000h,000h,0ffh	; 9db8  .@....~.........
	defb 0aah,040h,000h,000h,000h,000h,00fh,0f8h,028h,007h,000h,000h,000h,000h,000h,000h	; 9dc8  .@......(.......
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9dd8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9de8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9df8  ................
	defb 000h,00fh,000h,000h,000h,000h,000h,000h,0ffh,080h,000h,000h,000h,000h,000h,000h	; 9e08  ................
	defb 0e0h,03eh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,003h,006h,00ch,008h	; 9e18  .>..............
	defb 000h,000h,038h,0e0h,080h,000h,000h,001h,00ah,035h,00ah,015h,00ah,000h,02ah,055h	; 9e28  ..8......5....*U
	defb 0aah,055h,083h,07ch,0bbh,07fh,086h,041h,080h,000h,080h,0e0h,038h,08ch,0f4h,0f8h	; 9e38  .U.|...A....8...
	defb 078h,038h,000h,001h,003h,003h,007h,00fh,00fh,01fh,06ah,0f5h,0fah,0f5h,0fah,0f5h	; 9e48  x8........j.....
	defb 0fah,0fdh,0aah,055h,0aah,055h,0aah,055h,0aah,055h,0a0h,040h,0a8h,050h,0a0h,054h	; 9e58  ...U.U.U.U.@.P.T
	defb 0a8h,055h,008h,000h,000h,000h,000h,000h,000h,008h,01fh,03fh,03fh,03fh,03fh,07fh	; 9e68  .U.........????.
	defb 03fh,00fh,0feh,0fdh,0feh,0ffh,0feh,0ffh,0ffh,0ffh,0aah,055h,0aah,055h,0aah,0d5h	; 9e78  ?..........U.U..
	defb 0fah,0ffh,0aah,055h,0aah,055h,0aah,055h,0aah,0d0h,014h,038h,0b4h,03ah,09dh,02ah	; 9e88  ...U.U.U...8.:.*
	defb 01fh,00eh,000h,010h,028h,010h,008h,004h,00ah,001h,000h,000h,000h,000h,000h,000h	; 9e98  ....(...........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9ea8  ................
	defb 000h,000h,000h,040h,000h,040h,068h,054h,07ah,05dh,00ah,004h,002h,001h,002h,001h	; 9eb8  ...@.@hTz]......
	defb 000h,000h,080h,040h,020h,050h,0aah,055h,0a8h,055h,000h,000h,000h,000h,080h,050h	; 9ec8  ...@ P.U.U.....P
	defb 0aah,045h,000h,000h,000h,000h,000h,000h,000h,055h,077h,07fh,05eh,076h,07ch,078h	; 9ed8  .E.......Uw.^v|x
	defb 078h,070h,000h,000h,000h,000h,000h,000h,000h,000h,00ah,005h,000h,000h,000h,000h	; 9ee8  xp..............
	defb 000h,000h,0aah,055h,0a2h,015h,000h,000h,000h,000h,02ah,054h,0a8h,000h,000h,000h	; 9ef8  ...U......*T....
	defb 000h,000h,040h,000h,000h,000h,000h,000h,000h,000h,030h,00ah,000h,000h,000h,000h	; 9f08  ..@.......0.....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,00fh,000h,000h,000h,000h	; 9f18  ................
	defb 000h,000h,0ffh,080h,000h,000h,000h,000h,000h,000h,0e0h,03eh,000h,000h,000h,000h	; 9f28  ...........>....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,003h,006h	; 9f38  ................
	defb 004h,000h,000h,000h,038h,0e0h,080h,000h,000h,002h,00fh,03fh,002h,015h,00ah,000h	; 9f48  ....8......?....
	defb 015h,0aah,055h,0aah,083h,07ch,0adh,03fh,046h,001h,000h,000h,080h,0e0h,038h,0cch	; 9f58  ..U..|.?F.....8.
	defb 0f4h,0f8h,078h,038h,000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,003h,003h	; 9f68  ..x8............
	defb 001h,000h,000h,008h,07fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,07fh,0d5h,0eah,0d5h,0eah	; 9f78  ................
	defb 0d5h,0aah,0d5h,0aah,000h,000h,000h,000h,040h,080h,040h,080h,008h,000h,000h,000h	; 9f88  ........@.@.....
	defb 000h,008h,004h,00ah,000h,000h,000h,000h,000h,000h,000h,000h,014h,038h,034h,03ah	; 9f98  .............84:
	defb 01dh,02ah,01fh,00eh,07fh,03fh,03fh,03fh,03fh,01fh,00fh,003h,0d5h,0eah,0d5h,0eah	; 9fa8  .*...????.......
	defb 0f5h,0fah,0fdh,0feh,050h,0a0h,050h,0a8h,051h,0a8h,054h,0a8h,014h,02ah,015h,03eh	; 9fb8  ....P.P.Q.T..*.>
	defb 03fh,07fh,03fh,00eh,000h,000h,000h,000h,000h,000h,000h,000h,000h,040h,000h,040h	; 9fc8  ?.?..........@.@
	defb 068h,054h,07ah,05dh,000h,050h,050h,050h,0a0h,0a0h,0a0h,0aah,000h,000h,000h,000h	; 9fd8  hTz].PPP........
	defb 000h,000h,000h,0a0h,000h,001h,001h,001h,000h,000h,000h,000h,000h,000h,000h,004h	; 9fe8  ................
	defb 082h,095h,0aah,095h,000h,000h,000h,000h,000h,000h,000h,000h,077h,07fh,05eh,076h	; 9ff8  ............w.^v
	defb 07dh,07ah,079h,072h,015h,06ah,095h,02ah,015h,0aah,055h,0aah,051h,0aah,055h,0aah	; a008  }zyr.j.*..U.Q.U.
	defb 055h,0aah,055h,0aah,040h,0aah,055h,0aah,055h,0aah,055h,0aah,04ah,0d5h,06ah,0a4h	; a018  U.U.@.U.U.U.J.j.
	defb 074h,0b8h,078h,0f0h,000h,000h,000h,000h,000h,000h,000h,000h,045h,02ah,055h,06ah	; a028  t.x.........E*Uj
	defb 075h,06ah,075h,07ah,055h,0aah,055h,0aah,057h,0afh,05fh,0bfh,055h,0aah,05fh,0bfh	; a038  ujuzU.U.W._.U._.
	defb 0ffh,0f8h,0f8h,0fah,055h,0ffh,0feh,0f9h,0c2h,005h,002h,000h,0c0h,0b8h,068h,0b8h	; a048  ....U.........h.
	defb 0e0h,048h,038h,0e0h,000h,000h,000h,000h,000h,000h,000h,000h,03fh,057h,02bh,055h	; a058  .H8.........?W+U
	defb 02bh,055h,02ah,055h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fbh,0fbh,0fbh,0fbh	; a068  +U*U............
	defb 0f1h,0e0h,0c0h,080h,003h,09eh,0b0h,0a0h,0a0h,020h,060h,0c0h,080h,000h,000h,000h	; a078  ......... `.....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,02ah,055h,02ah,055h	; a088  ............*U*U
	defb 02ah,055h,028h,043h,0ffh,07eh,0f8h,075h,08ah,035h,0e8h,0b3h,001h,043h,0a6h,04ch	; a098  *U(C.~.u.5...C.L
	defb 0b8h,060h,0c0h,080h,080h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a0a8  .`..............
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,01fh,07fh,07eh,071h	; a0b8  ..............~q
	defb 00fh,078h,0c0h,000h,0e6h,09ch,070h,0c0h,000h,000h,000h,000h,000h,000h,000h,000h	; a0c8  .x....p.........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a0d8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,038h,00ah,000h,000h	; a0e8  ............8...
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a0f8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a108  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a118  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a128  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,00fh,000h,000h	; a138  ................
	defb 000h,000h,000h,000h,0ffh,080h,000h,000h,000h,000h,000h,000h,0f0h,03eh,000h,000h	; a148  .............>..
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a158  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,003h,006h,004h,000h,000h,000h,038h,0e0h	; a168  ..............8.
	defb 080h,000h,000h,003h,00fh,03fh,001h,02ah,045h,000h,028h,0d4h,0aah,0d5h,043h,0ach	; a178  .....?.*E.(...C.
	defb 05bh,03fh,006h,001h,000h,000h,080h,0e0h,038h,0cch,0b6h,0fbh,07dh,03eh,000h,000h	; a188  [?......8...}>..
	defb 000h,000h,000h,000h,080h,0c0h,000h,000h,000h,000h,000h,000h,000h,000h,000h,001h	; a198  ................
	defb 003h,003h,001h,008h,004h,00ah,07fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,07fh,0aah,0d5h	; a1a8  ................
	defb 0aah,0d5h,0eah,0d5h,0eah,0f5h,000h,000h,000h,000h,080h,000h,080h,040h,00fh,007h	; a1b8  .............@..
	defb 003h,003h,001h,000h,000h,000h,060h,0b0h,0d0h,058h,0c8h,06ch,0f4h,056h,000h,000h	; a1c8  ......`..X.l.V..
	defb 000h,000h,000h,000h,000h,000h,014h,02ah,015h,03eh,03fh,07fh,03fh,00eh,07fh,03fh	; a1d8  .......*.>?.?..?
	defb 03fh,03fh,03fh,0dfh,08fh,003h,0eah,0f5h,0fah,0fdh,0ffh,0ffh,0ffh,0ffh,0a0h,050h	; a1e8  ???............P
	defb 0a8h,055h,0aah,0d5h,0fah,0ffh,000h,001h,003h,011h,0ach,054h,0b8h,0e0h,07ah,0b2h	; a1f8  .U.........T..z.
	defb 0aah,093h,0a9h,095h,049h,041h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a208  ....IA..........
	defb 000h,004h,002h,015h,02ah,015h,000h,010h,010h,010h,0a0h,0a0h,0a4h,06ah,000h,000h	; a218  ....*........j..
	defb 000h,000h,000h,000h,000h,080h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a228  ................
	defb 000h,000h,000h,000h,000h,000h,041h,041h,041h,041h,0a1h,093h,0aah,092h,000h,000h	; a238  ......AAAA......
	defb 000h,000h,000h,000h,000h,000h,00ah,015h,00ah,004h,005h,003h,003h,001h,055h,06ah	; a248  ..............Uj
	defb 0f5h,0feh,0ffh,0ffh,0ffh,0ffh,050h,0a8h,055h,0aah,055h,0eah,0f5h,0fah,000h,000h	; a258  ......P.U.U.....
	defb 000h,080h,040h,080h,040h,0a0h,001h,001h,002h,002h,005h,00bh,009h,037h,02ah,056h	; a268  ..@.@........7*V
	defb 0a4h,0cch,068h,0d8h,0d0h,030h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a278  ..h..0..........
	defb 000h,000h,004h,006h,003h,000h,07fh,03fh,00fh,003h,000h,005h,082h,0e5h,0fdh,0fah	; a288  .......?........
	defb 0fdh,0ffh,03fh,040h,0adh,057h,050h,0a9h,05eh,0f9h,087h,05fh,0f7h,07ch,04bh,0beh	; a298  ..?@.WP.^.._.|K.
	defb 07dh,0fbh,0f6h,0cch,038h,0e0h,060h,0c0h,080h,000h,000h,000h,000h,000h,000h,000h	; a2a8  }...8.`.........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,038h,00fh	; a2b8  ..............8.
	defb 000h,000h,000h,000h,000h,000h,02dh,080h,0ffh,000h,000h,000h,000h,000h,0c3h,03eh	; a2c8  ......-........>
	defb 0e0h,000h,000h,000h,000h,000h,080h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a2d8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a2e8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a2f8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a308  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,018h,005h	; a318  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a328  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,001h	; a338  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a348  ................
	defb 001h,001h,000h,0feh,0feh,0c2h,0c0h,0c1h,000h,000h,000h,000h,0f0h,000h,000h,000h	; a358  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,0c1h,0c0h,0c0h,0c0h,0c0h,000h,000h,000h	; a368  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a378  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a388  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,018h,005h,000h,000h,000h,000h,000h,000h	; a398  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a3a8  ................
	defb 000h,000h,000h,000h,000h,000h,001h,001h,001h,001h,000h,000h,000h,000h,000h,000h	; a3b8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,001h,000h,0feh,0feh,0c2h	; a3c8  ................
	defb 0c0h,0c1h,000h,000h,040h,000h,0feh,000h,000h,040h,000h,000h,000h,000h,000h,000h	; a3d8  ....@....@......
	defb 000h,000h,0c1h,0c1h,0c1h,0c1h,0c0h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a3e8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a3f8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a408  ................
	defb 000h,000h,018h,005h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a418  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,001h	; a428  ................
	defb 001h,001h,001h,001h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a438  ................
	defb 000h,000h,000h,000h,001h,011h,000h,0feh,0feh,0c2h,0c0h,0c9h,000h,020h,040h,000h	; a448  ............. @.
	defb 0ffh,000h,000h,040h,000h,000h,000h,000h,080h,000h,000h,000h,0c1h,0c1h,0c1h,0c1h	; a458  ...@............
	defb 0c1h,001h,000h,000h,020h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a468  .... ...........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a478  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,018h,005h,000h,000h	; a488  ................
	defb 000h,000h,000h,000h,001h,001h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a498  ................
	defb 000h,000h,000h,000h,000h,000h,001h,001h,001h,001h,001h,001h,001h,001h,000h,000h	; a4a8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,021h,011h	; a4b8  ..............!.
	defb 000h,0feh,0feh,0c2h,0c0h,0c9h,010h,020h,040h,000h,0ffh,000h,000h,040h,000h,000h	; a4c8  ....... @....@..
	defb 000h,000h,0f0h,000h,000h,000h,0d1h,0c1h,0c1h,0c1h,0c1h,001h,001h,001h,020h,010h	; a4d8  .............. .
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,000h	; a4e8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a4f8  ................
	defb 000h,000h,000h,000h,000h,000h	; a508
