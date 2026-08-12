; ==========================================================================
; STARDUST - MSX - la segunda parte, a pie
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x061d0


; ----------------------------------------------------------------------
; Etiquetas que no caen en ninguna posicion emitida del listado
; (destinos fuera del binario o dentro de una instruccion).
; ----------------------------------------------------------------------
L_C794:	equ 0x0c794

; ----------------------------------------------------------------------
; Direcciones que solo aparecen como VALOR -en un `ld`, no en
; un salto-: son punteros que el codigo se pasa o numeros que
; casualmente coinciden con una direccion. No hay nada que
; trazar en ellas; el equ existe para que el listado ensamble.
; ----------------------------------------------------------------------
ladc4h:	equ 0x0adc4
lafa1h:	equ 0x0afa1
lb262h:	equ 0x0b262

; ----------------------------------------------------------------------
; DATOS ocho: bytes sin identificar, lo que queda de lo que se llamo "tabla de punteros a los graficos" (ver el bloque de la escena final)
;   0x61d0..0x61d8  (8 bytes)
; DATOS el: GUION DE LA ESCENA FINAL (173 B): 78 pasos de (columna, fila) con marcadores por encima de 0xC0 que cambian el fotograma, y 0xC0 como terminador. Lo recorre el bucle de 0xBE47
;   0x61d8..0x6285  (173 bytes)
; DATOS la: IMAGEN de la escena final (720 B): 40 filas de 18 bytes que copia_al_buffer lleva a la banda C del buffer, centradas (18 + 6 = 24, el ancho). 0x6285 + 0x2D0 = 0x6555, justo donde arranca el pool de sprites
;   0x6285..0x6555  (720 bytes)
; DATOS EL: POOL DE SPRITES de la fase: entradas de 64 bytes (16x16 con mascara, dibujo y mascara intercalados por linea, el mismo formato que los sprites de naves). Lo fija el codigo del derrumbe: HL = frame*64 + 0x6555, copiado al slot de trabajo 0x60 en 0x7D55 = 0x6555 + 0x60*64. Dibujadas las primeras 24 entradas salen los bichos andantes limpios, con sus poses
;   0x6555..0x6644  (239 bytes)
; DATOS pool: de sprites de la fase (tramo): las entradas 3 a 11 del pool de 64 B de 0x6555, dibujadas limpias con la geometria de 16x16 con mascara. Los recortes que habia aqui (dos rangos sin clasificar y una "tabla" de 9 B) eran cortes arbitrarios en mitad de los sprites
;   0x6644..0x682e  (490 bytes)
; DATOS pool: de sprites de la fase (continuacion): entradas de 64 B; los frames del derrumbe del protagonista (0x50 en adelante) caen aqui, en 0x6555 + 0x50*64 = 0x7955
;   0x682e..0x7c78  (5194 bytes)
; DATOS pool: de sprites de la fase (cola de la entrada 0x48)
;   0x7c78..0x7c9d  (37 bytes)
; DATOS graficos:: el final del pool de sprites (hasta 0x7D54), el slot de trabajo 0x60 del derrumbe (0x7D55-0x7D94) y graficos hasta el mapa de 0x840B
;   0x7c9d..0x840b  (1902 bytes)
; DATOS el: MAPA de la fase, que es dos mapas en uno (468 B: 78 filas de 6 celdas de 32x32 px, 280 con suelo). Cada byte es el INDICE DE TILE del pozo de 0x87F3 con el que se dibuja la celda (redibuja_fondo: origen = 0x87F3 + valor*128) y a la vez la COLISION (consulta_mapa acaba en and a: 0 = vacio, y sus seis llamadores solo miran el flag Z). La partida recorre las filas 71 a 0. OJO: estuvo publicado como celdas de 32x16 y torre de 1248 px; el alto se habia derivado en vez de medirse, y es 32 px (tile de 128 B = 4 B x 32 filas, consulta_mapa divide Y entre 32, y el fino 0xAD2C da 16 pasos de 2 px por fila). La torre es 192x2496
;   0x840b..0x85df  (468 bytes)
; DATOS ceros: bajo la zona (532 B, todos 0x00 comprobado: el vacio y el relleno hasta el pozo)
;   0x85df..0x87f3  (532 bytes)
; DATOS graficos:: el arranque del pozo de tiles del blitter (el pozo entero son 45 TILES de 32x32, 128 B cada uno, 0x87F3-0x9E72: 0x87F3 + 45*128 - 1 = 0x9E72, y el valor maximo del mapa es 44 — cierra al byte con lo medido en el puerto 0x98). El tile 0 (0x87F3-0x8872) es la TRAMA DEL FONDO de las celdas vacias, y esta viva: los rotadores 0xB140/0xB167 la desplazan una fila de pixel por cada 2 px de scroll, el parallax a mitad de velocidad. Los tiles 0x28/0x29 son el cartel-flecha de la base y el 0x2A la roseta que corona la fila 0
;   0x87f3..0x8a78  (645 bytes)
; DATOS graficos: (3542 B; racha 1.51, entropia 5.00, 153 valores: mas
;   0x8a78..0x984e  (3542 bytes)
; DATOS graficos: tramados (1957 B; rachas cortas y muchos valores, firma del damero)
;   0x984e..0x9ff3  (1957 bytes)
; DATOS la: partida grabada de la DEMO de la fase a pie (646 B)
;   0x9ff3..0xa279  (646 bytes)
; ----------------------------------------------------------------------
	defb 07fh,042h,00ch,01ch,038h,071h,07fh,000h,0c1h,078h,0bah,078h,0b8h,078h,0b6h,078h	; 61d0  .B..8q...x.x.x.x
	defb 0b4h,078h,0b2h,078h,0b0h,078h,0aeh,078h,0ach,078h,0aah,078h,0a8h,078h,0a6h,078h	; 61e0  .x.x.x.x.x.x.x.x
	defb 0a4h,078h,0a2h,078h,0a0h,078h,09eh,078h,09ch,078h,09ah,078h,098h,078h,096h,078h	; 61f0  .x.x.x.x.x.x.x.x
	defb 094h,078h,092h,078h,090h,078h,08eh,078h,08ch,0c2h,078h,08ah,078h,088h,077h,086h	; 6200  .x.x.x.x..x.x.w.
	defb 0c1h,077h,084h,078h,082h,078h,080h,078h,07eh,0c3h,078h,07ch,078h,07ah,079h,078h	; 6210  .w.x.x.x~.x|xzyx
	defb 0c1h,079h,076h,078h,074h,078h,072h,078h,070h,0c2h,078h,06eh,078h,06ch,077h,06ah	; 6220  .yvxtxrxp.xnxlwj
	defb 0c4h,076h,068h,074h,066h,072h,064h,070h,062h,0c5h,06eh,061h,06ch,060h,06ah,05fh	; 6230  .vhtfrdpb.nal`j_
	defb 0c6h,068h,05fh,066h,05fh,064h,05fh,062h,05fh,060h,05fh,05eh,05fh,05ch,05fh,0c7h	; 6240  .h_f_d_b_`_^_\_.
	defb 05ah,05fh,057h,05fh,054h,05fh,0c8h,051h,05fh,04eh,05fh,04bh,05fh,0c9h,047h,05fh	; 6250  Z_W_T_.Q_N_K_.G_
	defb 043h,05fh,03fh,05fh,0cah,03bh,05fh,037h,05fh,033h,05fh,0cbh,02eh,05eh,02ah,05dh	; 6260  C_?_.;_7_3_..^*]
	defb 026h,05ch,022h,05bh,0cch,01eh,05ah,01ah,059h,015h,058h,010h,057h,0cdh,00ah,055h	; 6270  &\"[..Z.Y.X.W..U
	defb 003h,053h,000h,000h,0c0h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6280  .S..............
	defb 000h,000h,000h,002h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6290  ................
	defb 000h,000h,000h,000h,000h,01dh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 62a0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,00bh,000h,000h,000h,000h,000h,000h,000h,000h	; 62b0  ................
	defb 000h,000h,000h,000h,000h,018h,000h,000h,000h,030h,000h,000h,000h,000h,000h,000h	; 62c0  .........0......
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,0cdh,000h,000h,000h,000h	; 62d0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,01eh,034h,000h,000h	; 62e0  .............4..
	defb 000h,000h,000h,018h,000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,0c3h,0eeh	; 62f0  ................
	defb 0e0h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,00fh	; 6300  ................
	defb 02bh,0b9h,070h,000h,018h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6310  +.p.............
	defb 000h,075h,056h,0f5h,070h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6320  .uV.p...........
	defb 000h,000h,003h,0fah,0f9h,04eh,0e0h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6330  .....N..........
	defb 000h,000h,001h,000h,000h,005h,0e6h,0d0h,0d0h,000h,000h,000h,000h,000h,000h,000h	; 6340  ................
	defb 000h,000h,000h,000h,001h,000h,001h,0f8h,019h,01bh,031h,000h,000h,000h,000h,000h	; 6350  ..........1.....
	defb 000h,000h,000h,018h,000h,000h,001h,000h,01ch,005h,0e6h,06dh,0afh,080h,000h,000h	; 6360  ...........m....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,003h,007h,0efh,0feh,0dch,0b5h,051h,000h	; 6370  ..............Q.
	defb 000h,000h,000h,000h,000h,000h,080h,000h,000h,000h,003h,078h,0d9h,07bh,000h,000h	; 6380  ...........x.{..
	defb 008h,000h,000h,000h,000h,000h,000h,000h,080h,000h,000h,000h,005h,067h,037h,0f7h	; 6390  .............g7.
	defb 05bh,05bh,0deh,000h,000h,000h,000h,000h,000h,001h,080h,000h,000h,000h,03ch,0d8h	; 63a0  [[............<.
	defb 0dch,000h,0b5h,0f5h,0a6h,000h,000h,000h,000h,000h,000h,001h,040h,000h,000h,001h	; 63b0  ............@...
	defb 0c0h,0e7h,032h,0abh,000h,000h,065h,006h,000h,000h,000h,000h,000h,000h,080h,000h	; 63c0  ..2...e.........
	defb 000h,003h,0aah,0f0h,07ch,000h,0ebh,0ffh,082h,00fh,000h,000h,000h,000h,000h,000h	; 63d0  ....|...........
	defb 080h,000h,000h,003h,055h,0fdh,077h,0bfh,094h,001h,0c0h,00eh,000h,000h,000h,000h	; 63e0  ....U.w.........
	defb 000h,000h,0c0h,000h,030h,00bh,003h,09ah,0abh,0d2h,067h,055h,0c0h,005h,040h,000h	; 63f0  ....0.....gU..@.
	defb 000h,000h,000h,001h,080h,000h,078h,012h,07bh,06dh,07fh,0a9h,0fbh,0bfh,0c0h,002h	; 6400  ......x.{m......
	defb 060h,000h,000h,000h,000h,001h,080h,000h,067h,08dh,087h,09fh,000h,0dch,078h,000h	; 6410  `.......g.....x.
	defb 000h,002h,080h,000h,018h,000h,000h,001h,040h,070h,01ch,07eh,074h,000h,0feh,0b3h	; 6420  ........@p.~t...
	defb 09ah,0abh,080h,001h,070h,000h,000h,000h,000h,001h,043h,0cch,003h,0f3h,0cdh,0ffh	; 6430  ....p.....C.....
	defb 054h,0aah,0e5h,056h,000h,002h,088h,000h,000h,000h,000h,001h,0e0h,067h,0fdh,06dh	; 6440  T..V.........g.m
	defb 0b2h,0aah,0a9h,070h,014h,008h,002h,002h,088h,000h,000h,000h,000h,000h,0f7h,0bfh	; 6450  ...p............
	defb 01ah,0ech,034h,000h,015h,0bfh,0fbh,060h,00dh,081h,070h,000h,000h,000h,000h,006h	; 6460  ..4....`..p.....
	defb 0cfh,078h,0cfh,0d3h,0cbh,0fdh,0cah,0c4h,000h,0a1h,0dah,0ddh,000h,000h,000h,000h	; 6470  .x..............
	defb 000h,039h,038h,0c7h,03eh,03ch,07ah,0adh,0b2h,0b8h,079h,062h,0e7h,039h,000h,000h	; 6480  .98.><z...yb.9..
	defb 000h,000h,001h,0e7h,0c7h,080h,0f9h,0c0h,000h,003h,0afh,0bbh,087h,083h,078h,0e5h	; 6490  ..............x.
	defb 040h,000h,040h,000h,00fh,0deh,03fh,0ffh,0e7h,09bh,030h,0dbh,0ffh,0fch,078h,063h	; 64a0  @.@...?...0...xc
	defb 07fh,0edh,060h,000h,040h,000h,071h,0e1h,0ffh,00fh,09eh,026h,0cfh,030h,000h,003h	; 64b0  ..`.@.q....&.0..
	defb 09fh,033h,0bch,076h,0b0h,000h,040h,003h,08eh,0ffh,0e0h,0c7h,079h,06eh,035h,057h	; 64c0  .3.v..@.....yn5W
	defb 0cfh,0ffh,0e3h,0d1h,0dbh,0bbh,0d0h,000h,050h,01ch,076h,0fch,017h,0d3h,080h,015h	; 64d0  ........P.v.....
	defb 060h,00fh,033h,0ffh,0fch,061h,0dah,03bh,0d8h,000h,060h,0e3h,0b1h,0e2h,0bch,02bh	; 64e0  `.3..a.;..`....+
	defb 0ffh,0abh,00fh,0feh,075h,0ffh,0ffh,080h,02dh,01ch,03ch,000h,047h,01dh,08fh,015h	; 64f0  ....u...-.<.G...
	defb 043h,05bh,0f8h,057h,030h,07dh,00dh,0f0h,007h,0dfh,0d6h,0efh,0fch,000h,03eh,0ech	; 6500  C[.W0}........>.
	defb 078h,0abh,09dh,0b5h,0e7h,006h,07fh,0b8h,0f1h,0eah,0a7h,0e0h,016h,08fh,00eh,001h	; 6510  x...............
	defb 0feh,003h,0c5h,05eh,076h,01dh,09ah,0ech,083h,0bbh,06dh,0d4h,033h,0f8h,07bh,046h	; 6520  ...^v.....m.3.{F
	defb 0f7h,00fh,0e3h,0feh,02ah,0f1h,0c2h,000h,07dh,0d9h,0d7h,0d8h,001h,0a5h,0dbh,0f8h	; 6530  ....*...}.......
	defb 03dh,0bah,0f7h,0ffh,01dh,0f1h,057h,083h,0bbh,001h,0fdh,0d3h,0ffh,0dfh,0ffh,053h	; 6540  =.....W........S
	defb 0e3h,0fch,03dh,0abh,003h,0ffh,0e3h,000h,000h,0ffh,0ebh,000h,008h,0f0h,0e9h,000h	; 6550  ..=.............
	defb 008h,0f6h,00dh,006h,00ch,0f6h,069h,006h,068h,0f4h,00dh,004h,00ch,0f3h,0e5h,003h	; 6560  ......i.h.......
	defb 0e4h,086h,021h,006h,020h,0b5h,0dch,035h,0dch,0a2h,02eh,022h,02eh,09bh,0ech,01bh	; 6570  ..!. ..5..."....
	defb 0ech,0bbh,0e1h,03bh,0e0h,09bh,0efh,01bh,0e0h,0c1h,0cfh,001h,0c0h,0fch,01fh,000h	; 6580  ...;............
	defb 000h,0ffh,0ffh,000h,000h,0ffh,087h,000h,000h,0e3h,037h,000h,030h,0cah,077h,008h	; 6590  ..........7.0.w.
	defb 070h,0d0h,0c7h,010h,0c0h,017h,01fh,017h,000h,069h,087h,069h,080h,076h,0d4h,076h	; 65a0  p........i.i.v.v
	defb 0d0h,029h,071h,029h,071h,09ch,0a2h,01ch,0a2h,0deh,0a4h,01eh,0a4h,0dfh,04ah,01fh	; 65b0  .)q)q.........J.
	defb 04ah,0ceh,0e8h,00eh,0e8h,0e0h,073h,000h,070h,0ffh,007h,000h,000h,0ffh,0ffh,000h	; 65c0  J.....s.p.......
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0e0h,07fh,000h,000h,0cbh,07fh,00bh	; 65d0  ................
	defb 000h,0ddh,07fh,01dh,000h,0dch,003h,01ch,000h,0c1h,0bbh,001h,0b8h,09eh,0dbh,01eh	; 65e0  ................
	defb 0d8h,0bdh,043h,03dh,040h,0bdh,047h,03dh,040h,0bdh,057h,03dh,050h,09eh,0d7h,01eh	; 65f0  ..C=@.G=@.W=P...
	defb 0d0h,0c1h,000h,001h,000h,0f7h,03eh,007h,03eh,0f7h,068h,007h,068h,0f2h,003h,002h	; 6600  ......>.>.h.h...
	defb 000h,0f8h,0ffh,000h,000h,0ffh,00fh,000h,000h,0feh,06fh,000h,060h,0f0h,0e3h,000h	; 6610  ..........o.`...
	defb 0e0h,0e7h,059h,007h,058h,0efh,0a5h,00fh,0a4h,0efh,051h,00fh,050h,0eeh,057h,00eh	; 6620  ..Y.X.....Q.P.W.
	defb 050h,0e4h,0b3h,004h,0b0h,0cbh,069h,00bh,068h,0dch,0cch,01ch,0cch,0dbh,086h,01bh	; 6630  P.....i.h.......
	defb 086h,0d0h,0d6h,010h,0c6h,0cch,010h,00ch,000h,0e2h,07fh,002h,000h,0f5h,03fh,005h	; 6640  ..............?.
	defb 000h,0f0h,0bfh,000h,080h,0ffh,0ffh,000h,000h,0f8h,03fh,000h,000h,0f3h,083h,003h	; 6650  ..........?.....
	defb 080h,0f7h,0d9h,007h,0d8h,087h,0ddh,007h,0dch,037h,0d9h,037h,0d8h,074h,045h,074h	; 6660  .........7.7.tEt
	defb 044h,03bh,0adh,03bh,0ach,084h,061h,004h,060h,0a7h,0cfh,027h,0c0h,0b0h,02fh,030h	; 6670  D;.;..a.`..'../0
	defb 020h,096h,06fh,016h,060h,0b0h,06fh,030h,060h,097h,00fh,010h,000h,0d7h,0ffh,010h	; 6680   .o.`.o0`.......
	defb 000h,0c7h,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0e0h,0ffh,000h	; 6690  ................
	defb 000h,0ceh,007h,00eh,000h,017h,073h,017h,070h,052h,0fbh,052h,0f8h,025h,07bh,025h	; 66a0  ......s.pR.R.%{%
	defb 078h,045h,039h,045h,038h,08eh,094h,08eh,094h,02bh,06eh,00bh,06eh,0e1h,096h,001h	; 66b0  xE9E8....+n.n...
	defb 096h,0f8h,0e8h,000h,0e8h,0e3h,00bh,003h,008h,0eeh,053h,00eh,010h,0ech,0c7h,00ch	; 66c0  ..........S.....
	defb 000h,0e1h,0ffh,000h,000h,0ffh,01fh,000h,000h,0c0h,04fh,000h,040h,016h,0efh,016h	; 66d0  ..........O.@...
	defb 0e0h,07ch,0efh,07ch,0e0h,000h,083h,000h,080h,0ebh,079h,00bh,078h,0eah,0bdh,00ah	; 66e0  .|.|......y.x...
	defb 0bch,0e2h,0bdh,002h,0bch,0c2h,0bdh,002h,0bch,0dbh,079h,01bh,078h,0ddh,083h,01dh	; 66f0  ..........y.x...
	defb 080h,0c0h,03bh,000h,038h,0feh,0bbh,000h,0b8h,0feh,0d3h,000h,0d0h,0feh,007h,000h	; 6700  ..;.8...........
	defb 000h,0ffh,0ffh,000h,000h,0fdh,00fh,001h,000h,0fch,0afh,000h,0a0h,0feh,047h,000h	; 6710  ..............G.
	defb 040h,008h,033h,000h,030h,06bh,00bh,063h,008h,061h,0dbh,061h,0d8h,033h,03bh,033h	; 6720  @.3.0k.c.a.a.3;3
	defb 038h,096h,0d3h,016h,0d0h,0cdh,027h,00dh,020h,0eah,077h,00ah,070h,08ah,0f7h,00ah	; 6730  8.....'. .w.p...
	defb 0f0h,0a5h,0f7h,025h,0f0h,09ah,0e7h,01ah,0e0h,0c7h,00fh,007h,000h,0f6h,07fh,006h	; 6740  ...%............
	defb 000h,0f0h,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0f1h,000h	; 6750  ................
	defb 000h,0ffh,0f5h,000h,004h,0f0h,084h,000h,004h,0f6h,0b6h,006h,036h,084h,014h,004h	; 6760  ............6...
	defb 014h,0b3h,0e6h,033h,0e6h,0a6h,032h,026h,032h,099h,0cch,019h,0cch,0bah,02eh,03ah	; 6770  ...3..2&2......:
	defb 02eh,09bh,0ech,01bh,0ech,0c3h,0e1h,003h,0e0h,0fbh,0efh,003h,0e0h,0f9h,0cfh,001h	; 6780  ................
	defb 0c0h,0fch,01fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0e1h,0ffh,000h	; 6790  ................
	defb 000h,0cch,03fh,00ch,000h,011h,0bfh,011h,080h,06eh,00fh,06eh,000h,073h,028h,073h	; 67a0  ..?......n.n.s(s
	defb 020h,02dh,0a2h,02dh,0a2h,092h,0c4h,012h,0c4h,0b9h,049h,039h,048h,0bdh,055h,03dh	; 67b0   -.-......I9H.U=
	defb 054h,0beh,0b1h,03eh,0b0h,09dh,0c7h,01dh,0c0h,0c0h,0dfh,000h,0c0h,0feh,01fh,000h	; 67c0  T..>............
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0f0h,03fh,000h,000h,0e5h,0bfh,005h	; 67d0  ..........?.....
	defb 080h,0eeh,0bfh,00eh,080h,0eeh,00fh,00eh,000h,081h,06fh,001h,060h,03dh,0afh,03dh	; 67e0  ..........o.`=.=
	defb 0a0h,07ah,08fh,07ah,080h,07ah,0bfh,07ah,080h,07ah,08fh,07ah,080h,03dh,0afh,03dh	; 67f0  .z.z.z.z.z.z.=.=
	defb 0a0h,081h,06fh,001h,060h,0eeh,003h,00eh,000h,0eeh,0fbh,00eh,0f8h,0e5h,0a3h,005h	; 6800  ..o.`...........
	defb 0a0h,0f0h,00fh,000h,000h,0ffh,00fh,000h,000h,0e0h,06fh,000h,060h,0ceh,0e7h,00eh	; 6810  ..........o.`...
	defb 0e0h,0dfh,053h,01fh,050h,0deh,0abh,01eh,0a8h,0dch,0abh,01ch,0a8h,0c9h,063h,009h	; 6820  ..S.P.........c.
	defb 060h,096h,0d7h,016h,0d0h,0b9h,097h,039h,090h,0b7h,007h,037h,000h,088h,0dfh,008h	; 6830  `......9...7....
	defb 0c0h,0ech,01fh,00ch,000h,0e2h,07fh,002h,000h,0f5h,03fh,005h,000h,0f0h,0bfh,000h	; 6840  ..........?.....
	defb 080h,0feh,03fh,000h,000h,0f8h,03fh,000h,000h,0f3h,09fh,003h,080h,0f7h,0dfh,007h	; 6850  ..?...?.........
	defb 0c0h,087h,0c3h,007h,0c0h,037h,0d9h,037h,0d8h,074h,05dh,074h,05ch,033h,099h,033h	; 6860  .....7.7.t]t\3.3
	defb 098h,04ch,065h,04ch,064h,067h,0cdh,067h,0cch,028h,021h,028h,020h,06dh,06fh,06ch	; 6870  .LeLdg.g.(!( mol
	defb 060h,021h,00fh,020h,000h,0afh,0ffh,020h,000h,08fh,0ffh,000h,000h,0ffh,0ffh,000h	; 6880  `!. ... ........
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0f8h,07fh,000h,000h,0fbh,003h,003h	; 6890  ................
	defb 000h,0e3h,0b9h,003h,0b8h,08dh,07dh,00dh,07ch,0aah,0bdh,02ah,0bch,092h,09dh,012h	; 68a0  ......}.|..*....
	defb 09ch,023h,049h,023h,048h,045h,0b4h,045h,0b4h,014h,0ceh,004h,0ceh,0f0h,076h,000h	; 68b0  .#I#HE.E......v.
	defb 076h,0fdh,088h,001h,088h,0fch,033h,000h,030h,0ffh,087h,000h,000h,0ffh,0ffh,000h	; 68c0  v.....3.0.......
	defb 000h,0ffh,0ffh,000h,000h,0f0h,00fh,000h,000h,0c5h,0a7h,005h,0a0h,0dfh,077h,01fh	; 68d0  ..............w.
	defb 070h,0c0h,077h,000h,070h,0f6h,081h,006h,080h,0f5h,0bch,005h,0bch,0f1h,05eh,001h	; 68e0  p.w.p.........^.
	defb 05eh,0fdh,05eh,001h,05eh,0f1h,05eh,001h,05eh,0f5h,0bch,005h,0bch,0f6h,081h,006h	; 68f0  ^.^.^.^.^.......
	defb 080h,0f0h,077h,000h,070h,0fdh,077h,001h,070h,0fdh,0a7h,001h,0a0h,0fch,00fh,000h	; 6900  ..w.p.w.p.......
	defb 000h,0ffh,0ffh,000h,000h,0fch,07fh,000h,000h,0fdh,00fh,001h,000h,0fch,0afh,000h	; 6910  ................
	defb 0a0h,0feh,047h,000h,040h,0f8h,037h,000h,030h,0fbh,011h,003h,010h,0e0h,0edh,000h	; 6920  ..G.@.7.0.......
	defb 0ech,0e9h,09dh,009h,09ch,0ebh,069h,00bh,068h,0c6h,093h,006h,090h,0d5h,03bh,015h	; 6930  ......i.h.....;.
	defb 038h,0d5h,07bh,015h,078h,0cah,0fbh,00ah,0f8h,0e7h,073h,007h,070h,0f6h,007h,006h	; 6940  8.{.x.....s.p...
	defb 000h,0f0h,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,087h,000h	; 6950  ................
	defb 000h,0f8h,031h,000h,030h,0e3h,035h,003h,034h,0ech,014h,00ch,014h,0edh,0e6h,00dh	; 6960  ..1.0.5.4.......
	defb 0e6h,0c2h,034h,002h,034h,09dh,0d6h,01dh,0d6h,0bah,022h,03ah,022h,09bh,0ech,01bh	; 6970  ..4.4.....":"...
	defb 0ech,0c3h,0eeh,003h,0eeh,0fbh,0ech,003h,0ech,0f9h,0c1h,001h,0c0h,0fch,01fh,000h	; 6980  ................
	defb 000h,0ffh,0ffh,000h,000h,0f0h,0ffh,000h,000h,0e6h,0ffh,006h,000h,08ch,021h,00ch	; 6990  ..............!.
	defb 000h,0b1h,0adh,031h,08ch,0bfh,00dh,03fh,00ch,099h,099h,019h,098h,0c6h,0d3h,006h	; 69a0  ...1...?........
	defb 0d0h,0c9h,067h,009h,060h,0dch,0a1h,01ch,0a0h,0deh,0a5h,01eh,0a4h,0dfh,049h,01fh	; 69b0  ..g.`.........I.
	defb 048h,0ceh,093h,00eh,090h,0e1h,0ebh,001h,0e8h,0fdh,0a3h,001h,0a0h,0fch,00fh,000h	; 69c0  H...............
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0f8h,0ffh,000h,000h,0f2h,07fh,002h	; 69d0  ................
	defb 000h,0f7h,00fh,007h,000h,0f7h,06fh,007h,060h,0c1h,067h,001h,060h,09eh,097h,01eh	; 69e0  ......o.`.g.`...
	defb 090h,0bdh,057h,03dh,050h,0bdh,047h,03dh,040h,0bdh,043h,03dh,040h,09eh,0dbh,01eh	; 69f0  ..W=P.G=@.C=@...
	defb 0d8h,0c1h,0bbh,001h,0b8h,0dch,003h,01ch,000h,0ddh,0f7h,01dh,0f0h,0cbh,047h,00bh	; 6a00  ..............G.
	defb 040h,0e0h,01fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0c3h,000h,000h,0f0h,01bh,000h	; 6a10  @...............
	defb 018h,0e7h,039h,007h,038h,0efh,0b4h,00fh,0b4h,0efh,056h,00fh,056h,08eh,052h,00eh	; 6a20  ..9.8.....V.V.R.
	defb 052h,0b4h,0b8h,034h,0b8h,0bbh,06bh,03bh,068h,094h,0c3h,014h,0c0h,0b3h,08fh,033h	; 6a30  R..4..k;h......3
	defb 080h,088h,063h,008h,060h,0d4h,03bh,014h,038h,0c2h,09bh,002h,018h,0f8h,0c3h,000h	; 6a40  ..c.`.;.8.......
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0f8h,03fh,000h,000h,083h,09fh,003h	; 6a50  ..........?.....
	defb 080h,037h,0dfh,037h,0c0h,077h,0c3h,077h,0c0h,037h,0d9h,037h,0d8h,044h,05dh,044h	; 6a60  .7.7.w.w.7.7.D]D
	defb 05ch,06bh,0b9h,06bh,0b8h,02ch,043h,02ch,040h,067h,0b7h,067h,0b0h,028h,037h,028h	; 6a70  \k.k.,C,@g.g.(7(
	defb 030h,0ach,0c7h,02ch,0c0h,08ch,01fh,00ch,000h,0e1h,0ffh,000h,000h,0ffh,0ffh,000h	; 6a80  0..,............
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0f0h,03fh,000h,000h,0c5h,0bfh,005h	; 6a90  ..........?.....
	defb 080h,0d7h,087h,017h,080h,0c9h,073h,009h,070h,092h,0fbh,012h,0f8h,0a5h,07bh,025h	; 6aa0  ......s.p.....{%
	defb 078h,085h,03bh,005h,038h,0e6h,093h,006h,090h,0cbh,063h,00bh,060h,099h,099h,019h	; 6ab0  x.;.8.....c.`...
	defb 098h,0b0h,0fdh,030h,0fch,0b5h,08dh,031h,08ch,084h,031h,000h,030h,0ffh,067h,000h	; 6ac0  ...0...1..1.0.g.
	defb 060h,0ffh,00fh,000h,000h,0f8h,007h,000h,000h,0e2h,0d3h,002h,0d0h,0efh,0bbh,00fh	; 6ad0  `...............
	defb 0b8h,0c0h,03bh,000h,038h,0ddh,083h,01dh,080h,0dbh,079h,01bh,078h,0c2h,0bdh,002h	; 6ae0  ..;.8.....y.x...
	defb 0bch,0e2h,0bdh,002h,0bch,0eah,0bdh,00ah,0bch,0e9h,079h,009h,078h,0e6h,083h,006h	; 6af0  ..........y.x...
	defb 080h,0f6h,0efh,006h,0e0h,0f0h,0efh,000h,0e0h,0feh,04fh,000h,040h,0ffh,01fh,000h	; 6b00  ..........O.@...
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0c3h,01fh,000h,000h,0d9h,043h,018h	; 6b10  ..............C.
	defb 040h,0dch,02bh,01ch,028h,0c6h,011h,006h,010h,0f1h,0cdh,001h,0cch,0c3h,029h,003h	; 6b20  @.+.(.........).
	defb 028h,0d6h,0ddh,016h,0dch,01dh,02dh,01dh,02ch,04ah,071h,04ah,070h,06ah,0f7h,06ah	; 6b30  (.....-.,JqJpj.j
	defb 0f0h,02dh,0f7h,02dh,0f0h,09ch,0e7h,01ch,0e0h,0d8h,00fh,018h,000h,0c3h,0ffh,000h	; 6b40  .-.-............
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0f0h,0ffh,000h	; 6b50  ................
	defb 000h,0f6h,00fh,006h,000h,0f6h,063h,006h,060h,0f4h,01bh,004h,018h,0f3h,0dbh,003h	; 6b60  ......c.`.......
	defb 0d8h,086h,021h,006h,020h,0b5h,0ddh,035h,0dch,0a3h,0edh,023h,0ech,098h,009h,018h	; 6b70  ..!. ..5...#....
	defb 008h,0dbh,063h,01bh,060h,0cbh,0efh,00bh,0e0h,0e1h,0cfh,001h,0c0h,0fch,01fh,000h	; 6b80  ..c.`...........
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0c3h,0ffh,000h,000h,098h,021h,018h	; 6b90  ..............!.
	defb 000h,0a1h,0adh,021h,08ch,097h,00dh,017h,00ch,0b9h,099h,039h,098h,096h,0d3h,016h	; 6ba0  ...!.......9....
	defb 0d0h,0c7h,067h,007h,060h,0dbh,0afh,01bh,0a0h,0d9h,0a3h,019h,0a0h,0deh,04bh,01eh	; 6bb0  ..g.`.........K.
	defb 048h,0ceh,0b3h,00eh,0b0h,0e1h,0c7h,001h,0c0h,0fch,09fh,000h,080h,0feh,03fh,000h	; 6bc0  H.............?.
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0f8h,07fh,000h,000h,0e3h,07fh,003h	; 6bd0  ................
	defb 000h,0cdh,07fh,00dh,000h,0dch,003h,01ch,000h,0c1h,0bbh,001h,0b8h,09ah,0dbh,01ah	; 6be0  ................
	defb 0d8h,0bbh,043h,03bh,040h,0b3h,047h,033h,040h,0bbh,057h,03bh,050h,09ah,097h,01ah	; 6bf0  ..C;@.G3@.W;P...
	defb 090h,0c1h,067h,001h,060h,0f7h,06fh,007h,060h,0f3h,00fh,003h,000h,0f8h,07fh,000h	; 6c00  ..g.`.o.`.......
	defb 000h,0ffh,0ffh,000h,000h,0ffh,01fh,000h,000h,0feh,04fh,000h,040h,0f0h,0e3h,000h	; 6c10  ..........O.@...
	defb 0e0h,0e7h,059h,007h,058h,0efh,025h,00fh,024h,0ech,0d1h,00ch,0d0h,0edh,0d7h,00dh	; 6c20  ..Y.X.%.$.......
	defb 0d0h,0e3h,0b3h,003h,0b0h,0cbh,069h,00bh,068h,0dch,0cch,01ch,0cch,0cbh,086h,00bh	; 6c30  ......i.h.......
	defb 086h,0d0h,0d6h,010h,0c6h,0cch,010h,00ch,000h,0e1h,0ffh,000h,000h,0ffh,0ffh,000h	; 6c40  ................
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0f8h,03fh,000h,000h,0c3h,09fh,003h	; 6c50  ..........?.....
	defb 080h,097h,0dfh,017h,0c0h,0b6h,0c7h,036h,0c0h,030h,013h,030h,010h,047h,0dbh,047h	; 6c60  .......6.0.0.G.G
	defb 0d8h,06bh,0bbh,06bh,0b8h,00ch,043h,00ch,040h,0e7h,0b7h,007h,0b0h,0e8h,037h,008h	; 6c70  .k.k..C.@.....7.
	defb 030h,0ech,0c7h,00ch,0c0h,0ech,01fh,00ch,000h,0e1h,0ffh,000h,000h,0ffh,0ffh,000h	; 6c80  0...............
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0e0h,0ffh,000h	; 6c90  ................
	defb 000h,0cah,007h,00ah,000h,0d7h,073h,017h,070h,0d2h,07bh,012h,078h,0c5h,09bh,005h	; 6ca0  ......s.p.{.x...
	defb 098h,0e5h,0d9h,005h,0d8h,0eeh,0e4h,00eh,0e4h,0ebh,06eh,00bh,06eh,0e1h,094h,001h	; 6cb0  ..........n.n...
	defb 094h,0f8h,0e9h,000h,0e8h,0e3h,00bh,003h,008h,0eeh,053h,00eh,010h,0ech,0c7h,00ch	; 6cc0  ..........S.....
	defb 000h,0e1h,0ffh,000h,000h,0feh,01fh,000h,000h,0feh,0c7h,000h,0c0h,0feh,0b3h,000h	; 6cd0  ................
	defb 0b0h,0c0h,03bh,000h,038h,0ddh,083h,01dh,080h,0dbh,059h,01bh,058h,0c2h,0ddh,002h	; 6ce0  ..;.8.....Y.X...
	defb 0dch,0e2h,0cdh,002h,0cch,0eah,0ddh,00ah,0dch,0e9h,059h,009h,058h,0e6h,083h,006h	; 6cf0  ..........Y.X...
	defb 080h,0f6h,0efh,006h,0e0h,0f0h,0cfh,000h,0c0h,0feh,01fh,000h,000h,0ffh,0ffh,000h	; 6d00  ................
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0c3h,0ffh,000h,000h,0d9h,08fh,018h	; 6d10  ................
	defb 000h,0dch,0a7h,01ch,020h,0c6h,017h,006h,010h,0f1h,0d3h,001h,0d0h,0c3h,029h,003h	; 6d20  .... .........).
	defb 028h,0d6h,0ddh,016h,0dch,0ddh,0c9h,01dh,0c8h,0cbh,0b3h,00bh,0b0h,08bh,037h,00bh	; 6d30  (.............7.
	defb 030h,0a4h,0f7h,024h,0f0h,0aeh,0e7h,02eh,0e0h,094h,00fh,014h,000h,0c1h,0ffh,000h	; 6d40  0..$............
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 6d50  ................
	defb 000h,0ffh,0ffh,000h,000h,0f0h,087h,000h,000h,0f6h,0b7h,006h,030h,084h,010h,004h	; 6d60  ............0...
	defb 010h,0b3h,0e6h,033h,0e6h,0a6h,032h,026h,032h,099h,0cch,019h,0cch,0dbh,0edh,01bh	; 6d70  ...3..2&2.......
	defb 0ech,0c8h,009h,008h,008h,0e3h,063h,003h,060h,0fbh,0efh,003h,0e0h,0f9h,0cfh,001h	; 6d80  ......c.`.......
	defb 0c0h,0fch,01fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0e1h,0ffh,000h	; 6d90  ................
	defb 000h,0cch,03fh,00ch,000h,091h,0bfh,011h,080h,02eh,00fh,02eh,000h,073h,02fh,073h	; 6da0  ..?..........s/s
	defb 020h,02dh,0afh,02dh,0a0h,08eh,0cfh,00eh,0c0h,0b7h,047h,037h,040h,0b3h,057h,033h	; 6db0   -.-......G7@.W3
	defb 050h,0bch,0b7h,03ch,0b0h,09dh,0c7h,01dh,0c0h,0c0h,09fh,000h,080h,0feh,03fh,000h	; 6dc0  P..<..........?.
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0fch,03fh,000h,000h,0f1h,0bfh,001h	; 6dd0  ..........?.....
	defb 080h,0e6h,0bfh,006h,080h,0eeh,00fh,00eh,000h,081h,06fh,001h,060h,035h,0afh,035h	; 6de0  ..........o.`5.5
	defb 0a0h,076h,08fh,076h,080h,066h,0bfh,066h,080h,076h,08fh,076h,080h,035h,0afh,035h	; 6df0  .v.v.f.f.v.v.5.5
	defb 0a0h,081h,06fh,001h,060h,0eeh,00fh,00eh,000h,0e6h,0bfh,006h,080h,0f1h,0bfh,001h	; 6e00  ..o.`...........
	defb 080h,0fch,03fh,000h,000h,0ffh,01fh,000h,000h,0e0h,04fh,000h,040h,0ceh,0e7h,00eh	; 6e10  ..?.......O.@...
	defb 0e0h,0deh,053h,01eh,050h,0d9h,0abh,019h,0a8h,0dbh,0abh,01bh,0a8h,0c7h,063h,007h	; 6e20  ..S.P.........c.
	defb 060h,096h,0d7h,016h,0d0h,0b9h,097h,039h,090h,097h,007h,017h,000h,0c8h,0dfh,008h	; 6e30  `......9........
	defb 0c0h,0ech,01fh,00ch,000h,0e1h,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 6e40  ................
	defb 000h,0ffh,0ffh,000h,000h,0f8h,03fh,000h,000h,0f3h,09fh,003h,080h,0f7h,0dfh,007h	; 6e50  ......?.........
	defb 0c0h,0c6h,0c7h,006h,0c0h,090h,013h,010h,010h,0b7h,0dbh,037h,0d8h,033h,099h,033h	; 6e60  ...........7.3.3
	defb 098h,04ch,065h,04ch,064h,067h,0cdh,067h,0cch,008h,021h,008h,020h,0edh,06fh,00ch	; 6e70  .LeLdg.g..!. .o.
	defb 060h,0e1h,00fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 6e80  `...............
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0fch,07fh,000h,000h,0f9h,003h,001h	; 6e90  ................
	defb 000h,0e3h,0b9h,003h,0b8h,0edh,03dh,00dh,03ch,0eah,0cdh,00ah,0cch,0e2h,0edh,002h	; 6ea0  ......=.<.......
	defb 0ech,0f3h,071h,003h,070h,0f5h,0b4h,005h,0b4h,0f4h,0ceh,004h,0ceh,0f0h,074h,000h	; 6eb0  ..q.p.........t.
	defb 074h,0fdh,089h,001h,088h,0fch,033h,000h,030h,0ffh,087h,000h,000h,0ffh,0ffh,000h	; 6ec0  t.....3.0.......
	defb 000h,0ffh,0ffh,000h,000h,0fch,03fh,000h,000h,0fdh,08fh,001h,080h,0fdh,067h,001h	; 6ed0  ......?.......g.
	defb 060h,0f0h,077h,000h,070h,0f6h,081h,006h,080h,0f5h,0ach,005h,0ach,0f1h,06eh,001h	; 6ee0  `.w.p.........n.
	defb 06eh,0fdh,066h,001h,066h,0f1h,06eh,001h,06eh,0f5h,0ach,005h,0ach,0f6h,081h,006h	; 6ef0  n.f.f.n.n.......
	defb 080h,0f0h,077h,000h,070h,0fdh,067h,001h,060h,0fdh,08fh,001h,080h,0fch,03fh,000h	; 6f00  ..w.p.g.`.....?.
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 6f10  ................
	defb 000h,0ffh,087h,000h,000h,0f8h,037h,000h,030h,0fbh,013h,003h,010h,0e0h,0e9h,000h	; 6f20  ......7.0.......
	defb 0e8h,0e9h,09dh,009h,09ch,0ebh,069h,00bh,068h,0c6h,0e3h,006h,0e0h,0d5h,0dbh,015h	; 6f30  ......i.h.......
	defb 0d8h,0d5h,09bh,015h,098h,0cah,07bh,00ah,078h,0e7h,073h,007h,070h,0f2h,007h,002h	; 6f40  ......{.x.s.p...
	defb 000h,0f8h,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,087h,000h	; 6f50  ................
	defb 000h,0f8h,037h,000h,030h,0e3h,037h,003h,030h,0ech,017h,00ch,010h,0edh,0e7h,00dh	; 6f60  ..7.0.7.0.......
	defb 0e0h,0c2h,030h,002h,030h,0ddh,0d6h,01dh,0d6h,0dbh,0e2h,01bh,0e2h,0c8h,00ch,008h	; 6f70  ..0.0...........
	defb 00ch,0e3h,06dh,003h,06ch,0fbh,0e9h,003h,0e8h,0f9h,0c3h,001h,0c0h,0fch,01fh,000h	; 6f80  ..m.l...........
	defb 000h,0ffh,0ffh,000h,000h,0ffh,087h,000h,000h,0e3h,037h,000h,030h,0cah,077h,008h	; 6f90  ..........7.0.w.
	defb 070h,0d0h,0c7h,010h,0c0h,097h,01fh,017h,000h,029h,087h,029h,080h,076h,0d7h,076h	; 6fa0  p........).).v.v
	defb 0d0h,027h,077h,027h,070h,09bh,0a7h,01bh,0a0h,0d9h,0a3h,019h,0a0h,0deh,04bh,01eh	; 6fb0  .'w'p.........K.
	defb 048h,0ceh,0ebh,00eh,0e8h,0e0h,053h,000h,050h,0ffh,007h,000h,000h,0ffh,0ffh,000h	; 6fc0  H.....S.P.......
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0f8h,07fh,000h	; 6fd0  ................
	defb 000h,0f3h,00fh,003h,000h,0f7h,06fh,007h,060h,0c1h,067h,001h,060h,09ah,097h,01ah	; 6fe0  ......o.`.g.`...
	defb 090h,0bbh,057h,03bh,050h,0b3h,047h,033h,040h,0bbh,043h,03bh,040h,09ah,0dbh,01ah	; 6ff0  ..W;P.G3@.C;@...
	defb 0d8h,0c1h,0bbh,001h,0b8h,0dch,003h,01ch,000h,0cdh,07fh,00dh,000h,0e3h,07fh,003h	; 7000  ................
	defb 000h,0f8h,07fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,083h,000h,000h,0f0h,029h,000h	; 7010  ..............).
	defb 028h,0e7h,075h,007h,074h,0efh,025h,00fh,024h,0ech,0d1h,00ch,0d0h,0cdh,0d3h,00dh	; 7020  (.u.t.%.$.......
	defb 0d0h,093h,0bbh,013h,0b8h,0bbh,06bh,03bh,068h,094h,0c3h,014h,0c0h,0cbh,08fh,00bh	; 7030  ......k;h.......
	defb 080h,0e8h,063h,008h,060h,0e5h,03bh,004h,038h,0f1h,09bh,000h,018h,0ffh,0c3h,000h	; 7040  ..c.`.;.8.......
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0f8h,03fh,000h,000h,0f3h,087h,003h	; 7050  ..........?.....
	defb 080h,0f7h,0d3h,007h,0d0h,0c6h,0dbh,006h,0d8h,090h,019h,010h,018h,0b7h,0c5h,037h	; 7060  ...............7
	defb 0c4h,0bbh,0adh,03bh,0ach,084h,061h,004h,060h,0dbh,0cfh,01bh,0c0h,0d8h,02fh,018h	; 7070  ...;..a.`...../.
	defb 020h,0c6h,06fh,006h,060h,0f0h,06fh,000h,060h,0ffh,00fh,000h,000h,0ffh,0ffh,000h	; 7080   .o.`.o.`.......
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0fch,07fh,000h,000h,0f9h,03fh,001h	; 7090  ..............?.
	defb 000h,0e3h,087h,003h,080h,0cdh,073h,00dh,070h,0d2h,07bh,012h,078h,0c5h,09bh,005h	; 70a0  ......s.p.{.x...
	defb 098h,0f5h,0dbh,005h,0d8h,0e6h,0e3h,006h,0e0h,0cbh,069h,00bh,068h,099h,09dh,019h	; 70b0  ..........i.h...
	defb 09ch,0b0h,0e9h,030h,0e8h,0b5h,085h,031h,084h,084h,019h,000h,018h,0ffh,0c3h,000h	; 70c0  ...0...1........
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0feh,01fh,000h,000h,0f0h,0cfh,000h	; 70d0  ................
	defb 0c0h,0f6h,0efh,006h,0e0h,0e6h,083h,006h,080h,0e9h,059h,009h,058h,0eah,0ddh,00ah	; 70e0  ..........Y.X...
	defb 0dch,0e2h,0cdh,002h,0cch,0c2h,0ddh,002h,0dch,0dbh,059h,01bh,058h,0ddh,083h,01dh	; 70f0  ..........Y.X...
	defb 080h,0c0h,03bh,000h,038h,0feh,0b3h,000h,0b0h,0feh,0c7h,000h,0c0h,0feh,01fh,000h	; 7100  ..;.8...........
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,087h,000h	; 7110  ................
	defb 000h,008h,033h,000h,030h,06bh,00bh,063h,008h,061h,0d3h,061h,0d0h,033h,03bh,033h	; 7120  ..3.0k.c.a.a.3;3
	defb 038h,096h,0d3h,016h,0d0h,0cdh,0c7h,00dh,0c0h,0ebh,0b7h,00bh,0b0h,08bh,037h,00bh	; 7130  8.............7.
	defb 030h,0a4h,0f7h,024h,0f0h,09ah,0e7h,01ah,0e0h,0c7h,00fh,007h,000h,0f2h,07fh,002h	; 7140  0..$............
	defb 000h,0f8h,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0f0h,0ffh,000h	; 7150  ................
	defb 000h,0f6h,087h,006h,000h,0f6h,0b7h,006h,030h,084h,010h,004h,010h,0b3h,0e6h,033h	; 7160  ........0......3
	defb 0e6h,0b6h,036h,036h,036h,0a5h,0d2h,025h,0d2h,09bh,0ech,01bh,0ech,0dbh,0edh,01bh	; 7170  ..666..%........
	defb 0ech,0cbh,069h,00bh,068h,0e2h,0a3h,002h,0a0h,0fbh,06fh,003h,060h,0f9h,0cfh,001h	; 7180  ..i.h.....o.`...
	defb 0c0h,0fch,01fh,000h,000h,0ffh,0ffh,000h,000h,0c3h,0ffh,000h,000h,0d8h,021h,018h	; 7190  ..............!.
	defb 000h,099h,0adh,019h,08ch,0a7h,00dh,027h,00ch,029h,099h,029h,098h,076h,0d3h,076h	; 71a0  .......'.).).v.v
	defb 0d0h,02fh,067h,02fh,060h,09fh,0afh,01fh,0a0h,0b7h,0a3h,037h,0a0h,0abh,05bh,02bh	; 71b0  ./g/`......7..[+
	defb 058h,0b6h,09bh,036h,098h,09dh,0e3h,01dh,0e0h,0c0h,08fh,000h,080h,0feh,03fh,000h	; 71c0  X..6..........?.
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0fch,01fh,000h,000h,0f1h,0dfh,001h	; 71d0  ................
	defb 0c0h,0e6h,0dfh,006h,0c0h,0eeh,003h,00eh,000h,081h,0bbh,001h,0b8h,03eh,0dbh,03eh	; 71e0  .............>.>
	defb 0d8h,06fh,043h,06fh,040h,057h,05fh,057h,040h,06fh,047h,06fh,040h,03eh,0d7h,03eh	; 71f0  .oCo@W_W@oGo@>.>
	defb 0d0h,081h,0b7h,001h,0b0h,0eeh,007h,00eh,000h,0e6h,0dfh,006h,0c0h,0f1h,0dfh,001h	; 7200  ................
	defb 0c0h,0fch,01fh,000h,000h,0ffh,01fh,000h,000h,0e0h,047h,000h,040h,0ceh,0f1h,00eh	; 7210  ..........G.@...
	defb 0f0h,0dbh,04dh,01bh,04ch,0d5h,0adh,015h,0ach,0dbh,0d1h,01bh,0d0h,0cfh,0d3h,00fh	; 7220  ..M.L...........
	defb 0d0h,097h,0bbh,017h,0b8h,0bbh,06bh,03bh,068h,094h,0c3h,014h,0c0h,0d3h,08fh,013h	; 7230  ......k;h.......
	defb 080h,0cch,063h,00ch,060h,0edh,03bh,00ch,038h,0e1h,09bh,000h,018h,0ffh,0c3h,000h	; 7240  ..c.`.;.8.......
	defb 000h,0ffh,0ffh,000h,000h,0f8h,03fh,000h,000h,0f3h,09fh,003h,080h,0f7h,0dfh,007h	; 7250  ......?.........
	defb 0c0h,0c7h,0c7h,007h,0c0h,096h,0d3h,016h,0d0h,0b5h,05bh,035h,058h,036h,0d9h,036h	; 7260  ..........[5X6.6
	defb 0d8h,04bh,0a5h,04bh,0a4h,06ch,06dh,06ch,06ch,067h,0cdh,067h,0cch,008h,021h,008h	; 7270  .K.K.lmllg.g..!.
	defb 020h,0edh,06fh,00ch,060h,0edh,00fh,00ch,000h,0e1h,0ffh,000h,000h,0ffh,0ffh,000h	; 7280   .o.`...........
	defb 000h,0ffh,0ffh,000h,000h,0f8h,0ffh,000h,000h,0e2h,007h,002h,000h,08fh,073h,00fh	; 7290  ..............s.
	defb 070h,0b2h,0dbh,032h,0d8h,0b5h,0abh,035h,0a8h,08bh,0dbh,00bh,0d8h,0cbh,0f3h,00bh	; 72a0  p..2...5........
	defb 0f0h,0ddh,0e9h,01dh,0e8h,0d6h,0ddh,016h,0dch,0c3h,029h,003h,028h,0f1h,0cbh,001h	; 72b0  ..........).(...
	defb 0c8h,0c6h,033h,006h,030h,0dch,0b7h,01ch,030h,0d9h,087h,018h,000h,0c3h,0ffh,000h	; 72c0  ..3.0...0.......
	defb 000h,0ffh,0ffh,000h,000h,0f8h,03fh,000h,000h,0fbh,08fh,003h,080h,0fbh,067h,003h	; 72d0  ......?.......g.
	defb 060h,0c0h,077h,000h,070h,0ddh,081h,01dh,080h,0dbh,07ch,01bh,07ch,0c2h,0deh,002h	; 72e0  `.w.p.....|.|...
	defb 0deh,0fah,0aeh,002h,0aeh,0e2h,0deh,002h,0deh,0ebh,07ch,00bh,07ch,0edh,081h,00dh	; 72f0  ..........|.|...
	defb 080h,0e0h,077h,000h,070h,0fbh,067h,003h,060h,0fbh,08fh,003h,080h,0f8h,03fh,000h	; 7300  ..w.p.g.`.....?.
	defb 000h,0ffh,0ffh,000h,000h,0e1h,0ffh,000h,000h,0ech,0c3h,00ch,000h,0eeh,05bh,00eh	; 7310  ..............[.
	defb 018h,0e3h,019h,003h,018h,0f8h,0e5h,000h,0e4h,0e1h,094h,001h,094h,0ebh,06eh,00bh	; 7320  ..............n.
	defb 06eh,0eeh,0b4h,00eh,0b4h,0e5h,059h,005h,058h,0c5h,0bdh,005h,0bch,0dah,0fdh,01ah	; 7330  n.....Y.X.......
	defb 0fch,0d9h,07dh,019h,07ch,0c7h,0b9h,007h,0b8h,0f1h,003h,001h,000h,0fch,07fh,000h	; 7340  ..}.|...........
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 7350  ................
	defb 000h,0f0h,087h,000h,000h,0f6h,0b7h,006h,030h,084h,010h,004h,010h,0b3h,0e6h,033h	; 7360  ........0......3
	defb 0e6h,0b6h,036h,036h,036h,0a5h,0d2h,025h,0d2h,09bh,0ech,01bh,0ech,0dbh,06dh,01bh	; 7370  ..666..%......m.
	defb 06ch,0cah,0a9h,00ah,0a8h,0e3h,063h,003h,060h,0fbh,0efh,003h,0e0h,0f9h,0cfh,001h	; 7380  l.....c.`.......
	defb 0c0h,0fch,01fh,000h,000h,0ffh,0ffh,000h,000h,0c3h,0ffh,000h,000h,0dah,01fh,018h	; 7390  ................
	defb 000h,098h,0dfh,018h,0c0h,0a7h,007h,027h,000h,029h,097h,029h,090h,076h,0d7h,076h	; 73a0  .......'.).).v.v
	defb 0d0h,02fh,067h,02fh,060h,09bh,0afh,01bh,0a0h,0b5h,0a3h,035h,0a0h,0bbh,05bh,03bh	; 73b0  ./g/`......5..[;
	defb 058h,0beh,09bh,03eh,098h,09dh,0e3h,01dh,0e0h,0c0h,08fh,000h,080h,0feh,03fh,000h	; 73c0  X..>..........?.
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0fch,01fh,000h,000h,0f1h,0dfh,001h	; 73d0  ................
	defb 0c0h,0e6h,0dfh,006h,0c0h,0eeh,007h,00eh,000h,081h,0b7h,001h,0b0h,03eh,0d7h,03eh	; 73e0  .............>.>
	defb 0d0h,077h,047h,077h,040h,06bh,05fh,06bh,040h,077h,047h,077h,040h,03eh,0d7h,03eh	; 73f0  .wGw@k_k@wGw@>.>
	defb 0d0h,081h,0b7h,001h,0b0h,0eeh,007h,00eh,000h,0e6h,0dfh,006h,0c0h,0f1h,0dfh,001h	; 7400  ................
	defb 0c0h,0fch,01fh,000h,000h,0ffh,01fh,000h,000h,0e0h,047h,000h,040h,0ceh,0f1h,00eh	; 7410  ..........G.@...
	defb 0f0h,0dfh,04dh,01fh,04ch,0ddh,0adh,01dh,0ach,0dah,0d1h,01ah,0d0h,0cdh,0d7h,00dh	; 7420  ..M.L...........
	defb 0d0h,097h,0b3h,017h,0b0h,0bbh,06bh,03bh,068h,094h,0cbh,014h,0c8h,0d3h,083h,013h	; 7430  ......k;h.......
	defb 080h,0cch,06fh,00ch,060h,0edh,00fh,00ch,000h,0e1h,0ffh,000h,000h,0ffh,0ffh,000h	; 7440  ..o.`...........
	defb 000h,0ffh,0ffh,000h,000h,0f8h,03fh,000h,000h,0f3h,09fh,003h,080h,0f7h,0dfh,007h	; 7450  ......?.........
	defb 0c0h,0c6h,0c7h,006h,0c0h,095h,053h,015h,050h,0b6h,0dbh,036h,0d8h,037h,0d9h,037h	; 7460  ......S.P..6.7.7
	defb 0d8h,04bh,0a5h,04bh,0a4h,06ch,06dh,06ch,06ch,067h,0cdh,067h,0cch,008h,021h,008h	; 7470  .K.K.lmllg.g..!.
	defb 020h,0edh,06fh,00ch,060h,0e1h,00fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 7480   .o.`...........
	defb 000h,0ffh,0ffh,000h,000h,0f8h,0ffh,000h,000h,0e2h,007h,002h,000h,08fh,073h,00fh	; 7490  ..............s.
	defb 070h,0b2h,0fbh,032h,0f8h,0b5h,0bbh,035h,0b8h,08bh,05bh,00bh,058h,0ebh,0b3h,00bh	; 74a0  p..2...5..[.X...
	defb 0b0h,0cdh,0e9h,00dh,0e8h,0d6h,0ddh,016h,0dch,0d3h,029h,013h,028h,0c1h,0cbh,001h	; 74b0  ..........).(...
	defb 0c8h,0f6h,033h,006h,030h,0f0h,0b7h,000h,030h,0ffh,087h,000h,000h,0ffh,0ffh,000h	; 74c0  ..3.0...0.......
	defb 000h,0ffh,0ffh,000h,000h,0f8h,03fh,000h,000h,0fbh,08fh,003h,080h,0fbh,067h,003h	; 74d0  ......?.......g.
	defb 060h,0e0h,077h,000h,070h,0edh,081h,00dh,080h,0ebh,07ch,00bh,07ch,0e2h,0eeh,002h	; 74e0  `.w.p.....|.|...
	defb 0eeh,0fah,0d6h,002h,0d6h,0e2h,0eeh,002h,0eeh,0ebh,07ch,00bh,07ch,0edh,081h,00dh	; 74f0  ..........|.|...
	defb 080h,0e0h,077h,000h,070h,0fbh,067h,003h,060h,0fbh,08fh,003h,080h,0f8h,03fh,000h	; 7500  ..w.p.g.`.....?.
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0c3h,000h,000h,0f8h,05bh,000h	; 7510  ..............[.
	defb 018h,0fbh,019h,003h,018h,0e0h,0e5h,000h,0e4h,0e9h,094h,009h,094h,0ebh,06eh,00bh	; 7520  ..............n.
	defb 06eh,0e6h,0f4h,006h,0f4h,0f5h,0d9h,005h,0d8h,0c5h,0adh,005h,0ach,0dah,0ddh,01ah	; 7530  n...............
	defb 0dch,0d9h,07dh,019h,07ch,0c7h,0b9h,007h,0b8h,0f1h,003h,001h,000h,0fch,07fh,000h	; 7540  ..}.|...........
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,087h,000h	; 7550  ................
	defb 000h,0f0h,0b7h,000h,030h,0f6h,0b7h,006h,030h,084h,010h,004h,010h,0b3h,0e6h,033h	; 7560  ....0...0......3
	defb 0e6h,0b6h,036h,036h,036h,0a5h,0d2h,025h,0d2h,09bh,06ch,01bh,06ch,0dah,0adh,01ah	; 7570  ..666..%..l.l...
	defb 0ach,0cbh,069h,00bh,068h,0e3h,0e3h,003h,0e0h,0fbh,0efh,003h,0e0h,0f9h,0cfh,001h	; 7580  ..i.h...........
	defb 0c0h,0fch,01fh,000h,000h,0ffh,087h,000h,000h,0c3h,037h,000h,030h,0dah,077h,018h	; 7590  ..........7.0.w.
	defb 070h,098h,0c7h,018h,0c0h,0a7h,01fh,027h,000h,029h,087h,029h,080h,076h,0d7h,076h	; 75a0  p......'.).).v.v
	defb 0d0h,02dh,077h,02dh,070h,09ah,0a7h,01ah,0a0h,0bdh,0a3h,03dh,0a0h,0bfh,05bh,03fh	; 75b0  .-w-p......=..[?
	defb 058h,0beh,09bh,03eh,098h,09dh,0e3h,01dh,0e0h,0c0h,08fh,000h,080h,0feh,03fh,000h	; 75c0  X..>..........?.
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0fch,01fh,000h,000h,0f1h,0dfh,001h	; 75d0  ................
	defb 0c0h,0e6h,0dfh,006h,0c0h,0eeh,007h,00eh,000h,081h,0b7h,001h,0b0h,03eh,0d7h,03eh	; 75e0  .............>.>
	defb 0d0h,07bh,047h,07bh,040h,075h,05fh,075h,040h,07bh,043h,07bh,040h,03eh,0dbh,03eh	; 75f0  .{G{@u_u@{C{@>.>
	defb 0d8h,081h,0bbh,001h,0b8h,0eeh,003h,00eh,000h,0e6h,0dfh,006h,0c0h,0f1h,0dfh,001h	; 7600  ................
	defb 0c0h,0fch,01fh,000h,000h,0ffh,01fh,000h,000h,0e0h,047h,000h,040h,0ceh,0f1h,00eh	; 7610  ..........G.@...
	defb 0f0h,0dfh,04dh,01fh,04ch,0dfh,0adh,01fh,0ach,0deh,0d1h,01eh,0d0h,0cdh,057h,00dh	; 7620  ..M.L.........W.
	defb 050h,096h,0b3h,016h,0b0h,0bbh,069h,03bh,068h,094h,0cch,014h,0cch,0d3h,086h,013h	; 7630  P.....i;h.......
	defb 086h,0cch,0d6h,00ch,0c6h,0ech,010h,00ch,000h,0e1h,0ffh,000h,000h,0ffh,0ffh,000h	; 7640  ................
	defb 000h,0ffh,0ffh,000h,000h,0f8h,03fh,000h,000h,0f3h,09fh,003h,080h,0f6h,0dfh,006h	; 7650  ......?.........
	defb 0c0h,0c5h,047h,005h,040h,096h,0d3h,016h,0d0h,0b7h,0dbh,037h,0d8h,037h,0d9h,037h	; 7660  ..G.@......7.7.7
	defb 0d8h,04bh,0a5h,04bh,0a4h,06ch,06dh,06ch,06ch,067h,0cdh,067h,0cch,008h,021h,008h	; 7670  .K.K.lmllg.g..!.
	defb 020h,0edh,06fh,00ch,060h,0e1h,06fh,000h,060h,0ffh,00fh,000h,000h,0ffh,0ffh,000h	; 7680   .o.`.o.`.......
	defb 000h,0ffh,0ffh,000h,000h,0f8h,0ffh,000h,000h,0e2h,007h,002h,000h,08fh,073h,00fh	; 7690  ..............s.
	defb 070h,0b2h,0fbh,032h,0f8h,0b5h,0fbh,035h,0f8h,08bh,07bh,00bh,078h,0eah,0b3h,00ah	; 76a0  p..2...5..{.x...
	defb 0b0h,0cdh,069h,00dh,068h,096h,0ddh,016h,0dch,033h,029h,033h,028h,061h,0cbh,061h	; 76b0  ..i.h....3)3(a.a
	defb 0c8h,06bh,033h,063h,030h,008h,037h,000h,030h,0ffh,087h,000h,000h,0ffh,0ffh,000h	; 76c0  .k3c0.7.0.......
	defb 000h,0ffh,0ffh,000h,000h,0f8h,03fh,000h,000h,0fbh,08fh,003h,080h,0fbh,067h,003h	; 76d0  ......?.......g.
	defb 060h,0e0h,077h,000h,070h,0edh,081h,00dh,080h,0ebh,07ch,00bh,07ch,0e2h,0f6h,002h	; 76e0  `.w.p.....|.|...
	defb 0f6h,0fah,0eah,002h,0eah,0c2h,0f6h,002h,0f6h,0dbh,07ch,01bh,07ch,0ddh,081h,01dh	; 76f0  ..........|.|...
	defb 080h,0c0h,077h,000h,070h,0fbh,067h,003h,060h,0fbh,08fh,003h,080h,0f8h,03fh,000h	; 7700  ..w.p.g.`.....?.
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0c3h,000h,000h,084h,01bh,000h	; 7710  ................
	defb 018h,0b5h,099h,031h,098h,0b0h,0e5h,030h,0e4h,099h,094h,019h,094h,0cbh,06eh,00bh	; 7720  ...1...0......n.
	defb 06eh,0e6h,0f4h,006h,0f4h,0f5h,0f9h,005h,0f8h,0c5h,0edh,005h,0ech,0dah,0d5h,01ah	; 7730  n...............
	defb 0d4h,0d9h,06dh,019h,06ch,0c7h,0b9h,007h,0b8h,0f1h,003h,001h,000h,0fch,07fh,000h	; 7740  ..m.l...........
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,087h,0e1h,000h,000h,0b3h,0cdh,030h	; 7750  ...............0
	defb 00ch,0abh,0d5h,028h,014h,098h,019h,018h,018h,0c5h,0a3h,005h,0a0h,0f3h,0cfh,003h	; 7760  ...(............
	defb 0c0h,0f4h,02fh,004h,020h,0f4h,02fh,004h,020h,0f3h,0cfh,003h,0c0h,0c5h,0a3h,005h	; 7770  ../. ./. .......
	defb 0a0h,098h,019h,018h,018h,0abh,0d5h,028h,014h,0b3h,0cdh,030h,00ch,087h,0e1h,000h	; 7780  .......(...0....
	defb 000h,0ffh,0ffh,000h,000h,007h,0e0h,000h,000h,073h,0ceh,070h,00eh,04bh,0d2h,048h	; 7790  .........s.p.K.H
	defb 012h,04bh,0d2h,048h,012h,038h,01ch,038h,01ch,085h,0a1h,005h,0a0h,0f2h,04fh,002h	; 77a0  .K.H.8.8......O.
	defb 040h,0f6h,06fh,006h,060h,0f6h,06fh,006h,060h,0f2h,04fh,002h,040h,085h,0a1h,005h	; 77b0  @.o.`.o.`.O.@...
	defb 0a0h,038h,01ch,038h,01ch,04bh,0d2h,048h,012h,04bh,0d2h,048h,012h,073h,0ceh,070h	; 77c0  .8.8.K.H.K.H.s.p
	defb 00eh,007h,0e0h,000h,000h,0f1h,00fh,000h,000h,0e4h,06fh,004h,060h,0e9h,083h,009h	; 77d0  ..........o.`...
	defb 080h,087h,0e9h,007h,0e8h,0ach,035h,02ch,034h,0a8h,011h,028h,010h,098h,05bh,018h	; 77e0  ......5,4..(..[.
	defb 058h,0d8h,059h,018h,058h,089h,095h,009h,094h,0ach,035h,02ch,034h,097h,0e1h,017h	; 77f0  X.Y.X.....5,4...
	defb 0e0h,0c1h,097h,001h,090h,0f6h,027h,006h,020h,0f0h,08fh,000h,000h,0ffh,0ffh,000h	; 7800  ......'. .......
	defb 000h,0ffh,0ffh,000h,000h,0f9h,07fh,001h,000h,0c2h,003h,002h,000h,0d1h,09bh,011h	; 7810  ................
	defb 098h,0d7h,0e3h,017h,0e0h,0cch,031h,00ch,030h,0c8h,014h,008h,014h,018h,05ah,018h	; 7820  ......1.0.....Z.
	defb 05ah,058h,058h,058h,058h,029h,093h,029h,090h,08ch,033h,00ch,030h,0c7h,0ebh,007h	; 7830  ZXXXX).)..3.0...
	defb 0e8h,0d9h,08bh,019h,088h,0c0h,043h,000h,040h,0feh,09fh,000h,080h,0feh,03fh,000h	; 7840  ......C.@.....?.
	defb 000h,0ffh,0ffh,000h,000h,0f0h,0ffh,000h,000h,0c6h,007h,006h,000h,097h,0b1h,017h	; 7850  ................
	defb 0b0h,033h,0bch,033h,0bch,06eh,036h,06eh,036h,05fh,0d8h,05fh,0d8h,016h,06ch,016h	; 7860  .3.3.n6n6_._..l.
	defb 06ch,0b5h,0eah,035h,0eah,0bbh,0deh,03bh,0deh,095h,0fah,015h,0fah,097h,044h,017h	; 7870  l..5...;......D.
	defb 044h,0b8h,0f9h,038h,0f8h,0bdh,06bh,03dh,068h,09bh,033h,01bh,030h,0c6h,007h,006h	; 7880  D..8..k=h.3.0...
	defb 000h,0f0h,0ffh,000h,000h,0f0h,01fh,000h,000h,0e7h,043h,007h,040h,08ch,0fbh,00ch	; 7890  ..........C.@...
	defb 0f8h,02bh,068h,02bh,068h,07bh,076h,07bh,076h,07fh,0b6h,07fh,0b6h,04fh,0f6h,04fh	; 78a0  .+h+h{v{v....O.O
	defb 0f6h,03dh,0eeh,03dh,0eeh,09bh,0fch,01bh,0fch,0b6h,0eeh,036h,0eeh,097h,01ch,017h	; 78b0  .=.=.......6....
	defb 01ch,0dbh,0edh,01bh,0ech,0d5h,0f1h,015h,0f0h,0cfh,077h,00fh,070h,0e7h,007h,007h	; 78c0  ..........w.p...
	defb 000h,0f0h,07fh,000h,000h,0feh,03fh,000h,000h,086h,0bfh,000h,080h,0b6h,03fh,030h	; 78d0  ......?.......?0
	defb 000h,086h,018h,000h,000h,0f0h,0c2h,000h,0c2h,0f7h,0d0h,007h,0d0h,0e2h,0b9h,002h	; 78e0  ................
	defb 0b8h,0edh,0ddh,00dh,0dch,0edh,0d5h,00dh,0d4h,0e7h,0f9h,007h,0f8h,0f7h,063h,007h	; 78f0  ..............c.
	defb 060h,081h,077h,001h,070h,0abh,0a7h,023h,0a0h,089h,087h,001h,080h,0fch,017h,000h	; 7900  `.w.p..#........
	defb 010h,0ffh,0c7h,000h,000h,0dfh,0ffh,000h,000h,0afh,0e3h,020h,000h,0dch,06bh,000h	; 7910  ........... ..k.
	defb 008h,0c5h,063h,001h,000h,0d4h,03fh,010h,000h,0c1h,09bh,001h,080h,0fah,0d5h,002h	; 7920  ..c...?.........
	defb 0c4h,0bbh,095h,003h,084h,059h,0dbh,041h,0c0h,040h,018h,040h,000h,0abh,08ah,008h	; 7930  .....Y.A.@.@....
	defb 002h,0e3h,0a8h,000h,020h,0ffh,08fh,000h,000h,0f9h,0ffh,000h,000h,0f6h,0ffh,006h	; 7940  .... ...........
	defb 000h,0f9h,0ffh,000h,000h,0f8h,03fh,000h,000h,0f3h,09fh,003h,080h,0f7h,0dfh,007h	; 7950  ......?.........
	defb 0c0h,0c7h,0c7h,007h,0c0h,094h,053h,014h,050h,0b4h,05bh,034h,058h,02bh,0a9h,02bh	; 7960  ......S.P.[4X+.+
	defb 0a8h,044h,045h,044h,044h,047h,0c5h,047h,0c4h,04bh,0a5h,04bh,0a4h,00ch,061h,00ch	; 7970  .DEDDG.G.K.K..a.
	defb 060h,0c9h,027h,008h,020h,093h,093h,010h,010h,0b7h,0dbh,030h,018h,0b7h,0dbh,030h	; 7980  `.'. ......0...0
	defb 018h,087h,0c3h,000h,000h,01ch,038h,000h,000h,049h,092h,041h,082h,06bh,0d6h,063h	; 7990  ......8..I.A.k.c
	defb 0c6h,022h,044h,022h,044h,092h,049h,012h,048h,0cdh,0b3h,00dh,0b0h,0e6h,067h,006h	; 79a0  ."D"D.I.H.....g.
	defb 060h,0f3h,0cfh,003h,0c0h,0f3h,0cfh,003h,0c0h,0e5h,0a7h,005h,0a0h,00eh,070h,00eh	; 79b0  `.............p.
	defb 070h,068h,016h,068h,016h,073h,0ceh,070h,00eh,037h,0ech,030h,00ch,097h,0e9h,010h	; 79c0  ph.h.s.p.7.0....
	defb 008h,0c7h,0e3h,000h,000h,0ffh,0ffh,000h,000h,0fch,03fh,000h,000h,0f9h,09fh,001h	; 79d0  ..........?.....
	defb 080h,0fah,05fh,002h,040h,082h,041h,002h,040h,0b1h,08dh,031h,08ch,08eh,071h,00eh	; 79e0  .._.@.A.@..1..q.
	defb 070h,0e3h,0c7h,003h,0c0h,0f9h,09fh,001h,080h,0f2h,04fh,002h,040h,0c4h,023h,004h	; 79f0  p.........O.@.#.
	defb 020h,0d9h,09bh,018h,018h,0cbh,0d3h,008h,010h,0e3h,0c7h,000h,000h,0ffh,0ffh,000h	; 7a00   ...............
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0fch,03fh,000h	; 7a10  ..............?.
	defb 000h,0fdh,0bfh,001h,080h,0f9h,09fh,001h,080h,0f2h,04fh,002h,040h,0e5h,0afh,005h	; 7a20  ..........O.@...
	defb 0a0h,0e9h,08fh,009h,080h,0e2h,05fh,002h,040h,0f2h,04fh,002h,040h,0f4h,02fh,004h	; 7a30  ......_.@.O.@./.
	defb 020h,0f1h,08fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 7a40   ...............
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 7a50  ................
	defb 000h,0fch,07fh,000h,000h,0f1h,01fh,001h,000h,0f7h,0dfh,007h,0c0h,0f1h,01fh,001h	; 7a60  ................
	defb 000h,0f2h,09fh,002h,080h,0f4h,05fh,004h,040h,0f1h,01fh,000h,000h,0ffh,0ffh,000h	; 7a70  ......_.@.......
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 7a80  ................
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 7a90  ................
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0fch,07fh,000h,000h,0fdh,07fh,001h	; 7aa0  ................
	defb 000h,0fch,07fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 7ab0  ................
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 7ac0  ................
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 7ad0  ................
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 7ae0  ................
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 7af0  ................
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 7b00  ................
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 7b10  ................
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 7b20  ................
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 7b30  ................
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 7b40  ................
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 7b50  ................
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0fch,07fh,000h,000h,0fdh,07fh,001h	; 7b60  ................
	defb 000h,0fch,07fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 7b70  ................
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 7b80  ................
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 7b90  ................
	defb 000h,0fch,07fh,000h,000h,0f1h,03fh,001h,000h,0f6h,0bfh,006h,080h,0e3h,0bfh,003h	; 7ba0  ......?.........
	defb 080h,0edh,0bfh,00dh,080h,0e6h,03fh,006h,000h,0f0h,0ffh,000h,000h,0ffh,0ffh,000h	; 7bb0  ......?.........
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 7bc0  ................
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0fch,03fh,000h	; 7bd0  ..............?.
	defb 000h,0f1h,08fh,001h,080h,0e7h,0efh,007h,0e0h,0eah,0e7h,00ah,0e0h,0edh,077h,00dh	; 7be0  ..............w.
	defb 070h,0e6h,067h,006h,060h,0f5h,0d7h,005h,0d0h,0f7h,067h,007h,060h,0f1h,0cfh,001h	; 7bf0  p.g.`.....g.`...
	defb 0c0h,0fch,01fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 7c00  ................
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 7c10  ................
	defb 000h,0ffh,08fh,000h,000h,0e0h,02fh,000h,020h,0e9h,00fh,009h,000h,0e2h,0bfh,002h	; 7c20  ....../. .......
	defb 080h,0f8h,03fh,000h,000h,0f1h,01fh,000h,000h,0c5h,05fh,004h,040h,0d1h,01fh,010h	; 7c30  ..?......._.@...
	defb 000h,0c7h,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h	; 7c40  ................
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0fch,03fh,000h	; 7c50  ..............?.
	defb 000h,0f9h,087h,001h,080h,0f3h,0b3h,003h,0b0h,0e7h,0bbh,007h,0b8h,0efh,06bh,00fh	; 7c60  ..............k.
	defb 068h,0ebh,0f3h,00bh,0f0h,0e6h,0d7h,006h,0d0h,0e7h,0a7h,007h,0a0h,0eeh,0efh,00eh	; 7c70  h...............
	defb 0e0h,0e5h,0efh,005h,0e0h,0f0h,08fh,000h,080h,0feh,03fh,000h,000h,0ffh,0ffh,000h	; 7c80  ..........?.....
	defb 000h,0ffh,0ffh,000h,000h,0fch,01fh,000h,000h,0c1h,0c3h,001h,0c0h,09bh,0b9h,01bh	; 7c90  ................
	defb 0b8h,0bbh,05dh,03bh,05ch,03fh,0ddh,03fh,0dch,07dh,0f8h,07dh,0f8h,054h,03ah,054h	; 7ca0  ..];\?.?.}.}.T:T
	defb 03ah,021h,0a2h,020h,022h,078h,038h,078h,038h,03ah,0ddh,03ah,0dch,0bfh,07dh,03fh	; 7cb0  :!. "x8x8:.:..}?
	defb 07ch,091h,0b9h,011h,0b8h,0c7h,0b3h,007h,0b0h,0f7h,0c7h,007h,0c0h,0f1h,0dfh,001h	; 7cc0  |...............
	defb 0c0h,0fch,01fh,000h,000h,0f8h,03fh,000h,000h,0f3h,08fh,003h,080h,0c5h,0e1h,005h	; 7cd0  ......?.........
	defb 0e0h,0dfh,074h,01fh,074h,018h,0feh,018h,0feh,07eh,02eh,07eh,02eh,070h,09ah,070h	; 7ce0  ..t.t....~.~.p.p
	defb 01ah,07bh,090h,078h,010h,06bh,0bdh,068h,03ch,018h,01dh,018h,01ch,0dfh,069h,01fh	; 7cf0  .{.x.k.h<.....i.
	defb 068h,0cbh,0e3h,00bh,0e0h,0eeh,0efh,00eh,0e0h,0e1h,0cfh,001h,0c0h,0fch,0dfh,000h	; 7d00  h...............
	defb 0c0h,0feh,01fh,000h,000h,0ffh,0ffh,000h,000h,0c4h,03fh,000h,000h,0d5h,09fh,011h	; 7d10  ..........?.....
	defb 080h,0c4h,0c3h,000h,0c0h,0e2h,00bh,000h,008h,089h,098h,008h,018h,0bdh,0beh,03ch	; 7d20  ...............<
	defb 03eh,095h,094h,014h,014h,0d9h,0c1h,018h,000h,0c0h,07fh,000h,000h,013h,047h,003h	; 7d30  >.............G.
	defb 000h,046h,013h,046h,010h,008h,05bh,008h,058h,0e5h,06bh,004h,068h,0f1h,013h,000h	; 7d40  .F.F..[.X.k.h...
	defb 010h,0ffh,0c7h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 7d50  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 7d60  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 7d70  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 7d80  ................
	defb 000h,000h,000h,000h,000h,040h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 7d90  .....@..........
	defb 000h,000h,000h,000h,040h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 7da0  ....@...........
	defb 000h,000h,040h,000h,000h,000h,000h,000h,040h,000h,000h,000h,040h,000h,020h,000h	; 7db0  ..@.....@...@. .
	defb 040h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,040h,020h,090h,008h	; 7dc0  @...........@ ..
	defb 042h,021h,094h,001h,0ceh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0ffh,000h,0ffh	; 7dd0  B!..............
	defb 000h,0e3h,003h,0c7h,0c0h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 7de0  ................
	defb 000h,08fh,00fh,0f1h,0f0h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 7df0  ................
	defb 000h,03fh,03fh,0fch,0fch,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0fch	; 7e00  .??.............
	defb 000h,07fh,07fh,0feh,0feh,03fh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0f9h	; 7e10  .....?..........
	defb 001h,0ffh,0ffh,0ffh,0ffh,09fh,080h,0ffh,000h,0ffh,000h,0ffh,000h,0feh,000h,033h	; 7e20  ...............3
	defb 003h,0ffh,0ffh,0ffh,0ffh,0cch,0c0h,07fh,000h,0ffh,000h,0ffh,000h,0fch,000h,087h	; 7e30  ................
	defb 087h,0f8h,0f8h,03fh,03fh,0e1h,0e1h,03fh,000h,0ffh,000h,0ffh,000h,0fdh,001h,04fh	; 7e40  ...??..?.......O
	defb 04fh,0a3h,0a3h,0cfh,0cfh,0f2h,0f2h,0bfh,080h,0ffh,000h,0ffh,000h,0fdh,001h,05fh	; 7e50  O.............._
	defb 05fh,04fh,04fh,0f7h,0f7h,0fah,0fah,0bfh,080h,0ffh,000h,0ffh,000h,0fdh,001h,0deh	; 7e60  _OO.............
	defb 0deh,097h,097h,0ebh,0ebh,0fbh,0fbh,0bfh,080h,0ffh,000h,0ffh,000h,0fdh,001h,0bdh	; 7e70  ................
	defb 0bdh,032h,032h,05dh,05dh,0f5h,0f5h,0bfh,080h,0ffh,000h,0ffh,000h,0fch,000h,0bah	; 7e80  .22]]...........
	defb 0bah,069h,069h,09eh,09eh,0f9h,0f9h,03fh,000h,0ffh,000h,0ffh,000h,0f8h,000h,0b4h	; 7e90  .ii....?........
	defb 0b4h,0d6h,0d6h,06fh,06fh,075h,075h,01fh,000h,0ffh,000h,0ffh,000h,0f2h,002h,0b8h	; 7ea0  ...oouu.........
	defb 0b8h,0e8h,0e8h,017h,017h,079h,079h,04fh,040h,0ffh,000h,0ffh,000h,0f6h,006h,0b5h	; 7eb0  .....yyO@.......
	defb 0b5h,0c8h,0c8h,017h,017h,0b5h,0b5h,06fh,060h,0ffh,000h,0ffh,000h,0e4h,004h,0a9h	; 7ec0  .......o`.......
	defb 0a9h,090h,090h,08bh,08bh,0b9h,0b9h,067h,060h,0ffh,000h,0ffh,000h,0cah,00ah,0b3h	; 7ed0  .......g`.......
	defb 0b3h,020h,020h,045h,045h,0ddh,0ddh,073h,070h,0ffh,000h,0ffh,000h,0dch,01ch,0aah	; 7ee0  .  EE..sp.......
	defb 0aah,0a0h,0a0h,065h,065h,0d9h,0d9h,07bh,078h,0ffh,000h,0ffh,000h,09ah,01ah,0b3h	; 7ef0  ...ee..{x.......
	defb 0b3h,040h,040h,022h,022h,0edh,0edh,079h,078h,0ffh,000h,0ffh,000h,0bch,03ch,0a6h	; 7f00  .@@""..yx.....<.
	defb 0a6h,040h,040h,032h,032h,0e9h,0e9h,07dh,07ch,0ffh,000h,0ffh,000h,03ah,03ah,035h	; 7f10  .@@22..}|....::5
	defb 035h,040h,040h,032h,032h,0ech,0ech,07ch,07ch,0ffh,000h,0ffh,000h,06dh,06dh,0c6h	; 7f20  5@@22..||....mm.
	defb 0c6h,080h,080h,011h,011h,00bh,00bh,0b6h,0b6h,0ffh,000h,0feh,000h,069h,069h,0d6h	; 7f30  .............ii.
	defb 0d6h,080h,080h,019h,019h,06bh,06bh,0b6h,0b6h,07fh,000h,0feh,000h,0cch,0cch,006h	; 7f40  .....kk.........
	defb 006h,080h,080h,019h,019h,068h,068h,037h,037h,07fh,000h,0fch,000h,0e9h,0e9h,0d4h	; 7f50  .....hh77.......
	defb 0d4h,080h,080h,019h,019h,06ah,06ah,0d7h,0d7h,03fh,000h,0f9h,001h,0c2h,0c2h,0eeh	; 7f60  .....jj..?......
	defb 0eeh,080h,080h,019h,019h,075h,075h,0c7h,0c7h,09fh,080h,0fbh,003h,0e9h,0e9h,0ech	; 7f70  .....uu.........
	defb 0ech,080h,080h,019h,019h,073h,073h,0d7h,0d7h,0dfh,0c0h,0f3h,003h,0e2h,0e2h,0dah	; 7f80  .....ss.........
	defb 0dah,080h,080h,011h,011h,079h,079h,0cfh,0cfh,0cfh,0c0h,0f7h,007h,0f9h,0f9h,0ach	; 7f90  .....yy.........
	defb 0ach,080h,080h,031h,031h,075h,075h,09fh,09fh,0efh,0e0h,0f7h,007h,0a1h,0a1h,04eh	; 7fa0  ...11uu........N
	defb 04eh,080h,080h,061h,061h,072h,072h,08fh,08fh,0efh,0e0h,0e7h,007h,056h,056h,0ach	; 7fb0  N..aarr......VV.
	defb 0ach,080h,080h,0c1h,0c1h,075h,075h,06fh,06fh,0e7h,0e0h,0eeh,00eh,083h,083h,06eh	; 7fc0  .....uuoo......n
	defb 06eh,040h,040h,002h,002h,076h,076h,0c7h,0c7h,0f7h,0f0h,0cfh,00fh,01dh,01dh,09dh	; 7fd0  n@@..vv.........
	defb 09dh,030h,030h,00ch,00ch,0b9h,0b9h,0bbh,0bbh,0f3h,0f0h,0deh,01eh,03eh,03eh,053h	; 7fe0  .00..........>>S
	defb 053h,08fh,08fh,0f1h,0f1h,0cah,0cah,07dh,07dh,0fbh,0f8h,0ddh,01dh,03eh,03eh,0cfh	; 7ff0  S......}}....>>.
	defb 0cfh,0f0h,0f0h,00fh,00fh,0f3h,0f3h,07dh,07dh,0fbh,0f8h,09eh,01eh,09dh,09dh,0b7h	; 8000  .......}}.......
	defb 0b7h,0ffh,0ffh,0ffh,0ffh,0edh,0edh,09bh,09bh,0f9h,0f8h,0bdh,03dh,01ch,01ch,00bh	; 8010  ............=...
	defb 00bh,0f8h,0f8h,01fh,01fh,0d0h,0d0h,03bh,03bh,0fdh,0fch,0beh,03eh,02ah,02ah,0adh	; 8020  .......;;...>**.
	defb 0adh,0e3h,0e3h,0c7h,0c7h,0b5h,0b5h,05dh,05dh,0fdh,0fch,0bch,03ch,05ch,05ch,0aeh	; 8030  .......]]...<\\.
	defb 0aeh,0d4h,0d4h,02bh,02bh,075h,075h,03eh,03eh,0fdh,0fch,03ah,03ah,02ch,02ch,0aeh	; 8040  ...++uu>>..::,,.
	defb 0aeh,0b3h,0b3h,0cdh,0cdh,075h,075h,01eh,01eh,0fch,0fch,074h,074h,01ch,01ch,0adh	; 8050  .....uu....tt...
	defb 0adh,06ch,06ch,036h,036h,0b5h,0b5h,038h,038h,07eh,07eh,07ah,07ah,06eh,06eh,0adh	; 8060  .ll66..88~~zznn.
	defb 0adh,01ah,01ah,058h,058h,0b5h,0b5h,056h,056h,0feh,0feh,075h,075h,02fh,02fh,00eh	; 8070  ...XX..VV..uu//.
	defb 00eh,0d5h,0d5h,0abh,0abh,070h,070h,0b5h,0b5h,0feh,0feh,078h,078h,01fh,01fh,05eh	; 8080  .....pp....xx..^
	defb 05eh,0abh,0abh,0d5h,0d5h,07ah,07ah,078h,078h,07eh,07eh,074h,074h,0bfh,0bfh,066h	; 8090  ^....zzxx~~tt..f
	defb 066h,088h,088h,015h,015h,064h,064h,0bfh,0bfh,07eh,07eh,07ah,07ah,000h,000h,0dah	; 80a0  f....dd..~~zz...
	defb 0dah,0abh,0abh,0d5h,0d5h,05ah,05ah,000h,000h,0feh,0feh,0f4h,0f4h,0bfh,0bfh,05ah	; 80b0  .....ZZ........Z
	defb 05ah,08ch,08ch,035h,035h,058h,058h,0bfh,0bfh,07fh,07fh,0fah,0fah,05eh,05eh,0e5h	; 80c0  Z..55XX......^^.
	defb 0e5h,093h,093h,0c9h,0c9h,0a2h,0a2h,05eh,05eh,0ffh,0ffh,01dh,01dh,001h,001h,0fdh	; 80d0  .......^^.......
	defb 0fdh,055h,055h,0aah,0aah,0bdh,0bdh,001h,001h,0f8h,0f8h,0a2h,0a2h,05eh,05eh,0fbh	; 80e0  .UU..........^^.
	defb 0fbh,02ah,02ah,056h,056h,0dah,0dah,05eh,05eh,0c7h,0c7h,0d4h,0d4h,081h,081h,0fah	; 80f0  .**VV..^^.......
	defb 0fah,0cah,0cah,0b5h,0b5h,05dh,05dh,001h,001h,03fh,03fh,0eah,0eah,05eh,05eh,0fah	; 8100  .....]]..??..^^.
	defb 0fah,06ah,06ah,056h,056h,05ah,05ah,07eh,07eh,0ffh,0ffh,0d0h,0d0h,03fh,03fh,03ah	; 8110  .jjVVZZ~~....??:
	defb 03ah,0cah,0cah,0b5h,0b5h,05ch,05ch,0beh,0beh,01fh,01fh,0e3h,0e3h,000h,000h,0c2h	; 8120  :....\\.........
	defb 0c2h,065h,065h,04eh,04eh,042h,042h,000h,000h,0dfh,0dfh,0d3h,0d3h,03fh,03fh,07bh	; 8130  .eeNNBB......??{
	defb 07bh,033h,033h,08ch,08ch,0d4h,0d4h,0beh,0beh,0dfh,0dfh,0e8h,0e8h,05fh,05fh,075h	; 8140  {33..........__u
	defb 075h,058h,058h,03ah,03ah,0a8h,0a8h,07eh,07eh,03fh,03fh,074h,074h,0bfh,0bfh,075h	; 8150  uXX::..~~??tt..u
	defb 075h,0adh,0adh,0b5h,0b5h,0ach,0ach,0bfh,0bfh,07eh,07eh,03ah,03ah,000h,000h,0fah	; 8160  u........~~::...
	defb 0fah,0c3h,0c3h,0c3h,0c3h,05ah,05ah,000h,000h,0fch,0fch,084h,004h,0bfh,0bfh,07fh	; 8170  .....ZZ.........
	defb 07fh,07fh,07fh,0feh,0feh,0fch,0fch,0bfh,0bfh,061h,060h,0f0h,000h,07fh,07fh,000h	; 8180  .........a`.....
	defb 000h,00fh,00fh,0f0h,0f0h,000h,000h,07fh,07fh,00fh,000h,0f9h,001h,0bfh,0bfh,09fh	; 8190  ................
	defb 080h,0e0h,000h,007h,000h,0f9h,001h,0bfh,0bfh,09fh,080h,0f3h,003h,05fh,05fh,0cfh	; 81a0  .............__.
	defb 0c0h,0ffh,000h,0ffh,000h,0f3h,003h,05fh,05fh,0cfh,0c0h,0f6h,006h,000h,000h,06fh	; 81b0  .......__......o
	defb 060h,0ffh,000h,0ffh,000h,0f6h,006h,000h,000h,06fh,060h,0f1h,001h,0ffh,0ffh,08fh	; 81c0  `........o`.....
	defb 080h,0ffh,000h,0ffh,000h,0f1h,001h,0ffh,0ffh,08fh,080h,0efh,000h,0ffh,03ah,0bdh	; 81d0  ..............:.
	defb 098h,0efh,011h,0ffh,040h,0fbh,08ah,0ffh,020h,0bfh,048h,0fdh,002h,0ffh,020h,0efh	; 81e0  ....@... .H... .
	defb 008h,0ffh,000h,0efh,000h,0ffh,09ch,0bdh,03ah,0efh,058h,0ffh,009h,0fbh,010h,0ffh	; 81f0  ........:.X.....
	defb 092h,0bfh,004h,0fdh,015h,0ffh,040h,0efh,000h,0ffh,000h,0bdh,03ch,042h,042h,095h	; 8200  ......@.....<BB.
	defb 095h,0afh,0afh,09dh,09dh,0bfh,0bfh,056h,056h,0bdh,03ch,0ffh,000h,0ffh,000h,0c3h	; 8210  .......VV.<.....
	defb 000h,0dbh,018h,0dbh,018h,0c3h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0c3h,000h,099h	; 8220  ................
	defb 018h,0bdh,03ch,0bdh,03ch,099h,018h,0c3h,000h,0ffh,000h,039h,038h,07ch,07ch,0feh	; 8230  ..<.<......98||.
	defb 0feh,0feh,0feh,0feh,0feh,07ch,07ch,039h,038h,083h,000h,0ffh,000h,0c3h,000h,018h	; 8240  .....||98.......
	defb 018h,07eh,07eh,0dbh,0dbh,024h,024h,081h,000h,0ffh,000h,0ffh,000h,083h,000h,038h	; 8250  .~~..$$........8
	defb 038h,07fh,07fh,054h,054h,0c1h,0c0h,01fh,000h,0ffh,000h,0ffh,000h,0c1h,000h,01ch	; 8260  8..TT...........
	defb 01ch,0feh,0feh,02ah,02ah,083h,003h,0f8h,000h,0ffh,000h,0e0h,000h,08eh,00eh,0bch	; 8270  ...**...........
	defb 03ch,03ah,03ah,070h,070h,067h,060h,057h,050h,007h,000h,0c5h,004h,09dh,01ch,0b1h	; 8280  <::ppg`WP.......
	defb 030h,0bbh,038h,0b3h,030h,09bh,018h,0d3h,010h,0d7h,010h,0cbh,008h,0d9h,018h,095h	; 8290  0.8.0...........
	defb 014h,0b9h,038h,0b9h,038h,095h,014h,0d9h,018h,0cbh,008h,0cdh,00ch,0dch,01ch,09ah	; 82a0  ..8.8...........
	defb 01ah,0ach,02ch,0ach,02ch,09ah,01ah,0dch,01ch,0cdh,00ch,0cdh,00ch,09ch,01ch,03ah	; 82b0  ..,.,..........:
	defb 03ah,05ch,05ch,04ch,04ch,03ah,03ah,09ch,01ch,0cdh,00ch,0ceh,00eh,09eh,01eh,035h	; 82c0  :\\LL::........5
	defb 035h,05eh,05eh,04eh,04eh,035h,035h,09eh,01eh,0ceh,00eh,09eh,01eh,02eh,02eh,07dh	; 82d0  5^^NN55........}
	defb 07dh,0beh,0beh,08eh,08eh,07dh,07dh,02eh,02eh,09eh,01eh,0e0h,000h,08eh,00eh,03fh	; 82e0  }....}}........?
	defb 03fh,0ceh,0ceh,0ffh,0ffh,03eh,03eh,08eh,00eh,0e0h,000h,0ffh,000h,0c0h,000h,01eh	; 82f0  ?....>>.........
	defb 01eh,06fh,06fh,0feh,0feh,03eh,03eh,08eh,00eh,0e0h,000h,0ffh,000h,0ffh,000h,0c0h	; 8300  .oo..>>.........
	defb 000h,0a7h,027h,03fh,03fh,0ffh,0ffh,01eh,01eh,0c0h,000h,000h,000h,000h,000h,000h	; 8310  ..'??...........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8320  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8330  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8340  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8350  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8360  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8370  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8380  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8390  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 83a0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 83b0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 83c0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 83d0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 83e0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 83f0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,02ah,02ah,02ah,02ah,02ah	; 8400  ...........*****
	defb 02ah,000h,000h,000h,000h,000h,000h,00dh,025h,01bh,004h,004h,01ah,00fh,027h,01eh	; 8410  *.......%.....'.
	defb 00ch,003h,01fh,000h,000h,000h,00eh,000h,000h,000h,000h,005h,00bh,006h,000h,020h	; 8420  ............... 
	defb 00dh,009h,013h,002h,000h,02ch,000h,007h,003h,008h,000h,026h,000h,000h,000h,000h	; 8430  .....,.....&....
	defb 000h,00eh,000h,000h,005h,004h,006h,022h,02bh,00dh,009h,013h,00ah,000h,000h,000h	; 8440  ......."+.......
	defb 007h,00ch,008h,000h,000h,000h,000h,02ch,000h,000h,000h,000h,000h,00eh,000h,000h	; 8450  .......,........
	defb 005h,01ah,00dh,023h,000h,000h,001h,002h,000h,000h,000h,000h,001h,002h,000h,000h	; 8460  ...#............
	defb 000h,004h,017h,00ah,02bh,00dh,021h,003h,015h,002h,000h,000h,00eh,000h,001h,00ah	; 8470  ....+.!.........
	defb 00dh,025h,023h,00dh,01eh,01ch,000h,00eh,000h,000h,000h,024h,02bh,023h,000h,000h	; 8480  .%#........$+#..
	defb 000h,00eh,000h,000h,000h,02bh,025h,027h,00dh,021h,000h,000h,02ch,000h,000h,00eh	; 8490  .....+%'.!..,...
	defb 000h,000h,00eh,000h,000h,024h,00dh,000h,022h,025h,02bh,026h,000h,000h,000h,02ch	; 84a0  .....$.."%+&...,
	defb 000h,00eh,000h,000h,000h,00eh,000h,02ch,000h,020h,00dh,023h,000h,018h,004h,00eh	; 84b0  .......,. .#....
	defb 000h,000h,000h,007h,015h,026h,000h,000h,000h,000h,001h,012h,000h,000h,005h,004h	; 84c0  .....&..........
	defb 017h,000h,000h,000h,001h,013h,014h,000h,00fh,00dh,009h,013h,002h,000h,000h,000h	; 84d0  ................
	defb 001h,014h,008h,006h,000h,005h,017h,002h,000h,016h,004h,017h,013h,002h,000h,003h	; 84e0  ................
	defb 003h,003h,015h,00ah,00dh,000h,000h,000h,001h,002h,000h,005h,01ah,02bh,01eh,008h	; 84f0  .............+..
	defb 000h,001h,002h,000h,000h,000h,000h,017h,002h,000h,000h,00fh,021h,015h,00ah,010h	; 8500  ............!...
	defb 000h,000h,00eh,001h,002h,000h,000h,005h,00bh,017h,016h,006h,000h,019h,003h,014h	; 8510  ................
	defb 003h,008h,000h,00eh,000h,01ch,000h,000h,000h,022h,01bh,02ch,000h,000h,000h,000h	; 8520  .........".,....
	defb 001h,018h,006h,000h,005h,004h,017h,019h,01fh,02bh,01eh,003h,015h,01dh,000h,000h	; 8530  .........+......
	defb 000h,000h,001h,01ch,000h,005h,006h,000h,001h,00eh,000h,001h,016h,004h,017h,022h	; 8540  ..............."
	defb 00dh,01eh,015h,013h,014h,000h,000h,000h,001h,014h,008h,000h,011h,000h,001h,002h	; 8550  ................
	defb 000h,000h,024h,00dh,009h,002h,000h,000h,012h,000h,019h,008h,000h,000h,000h,000h	; 8560  ..$.............
	defb 00eh,000h,000h,000h,000h,005h,01dh,000h,000h,000h,000h,001h,002h,000h,000h,005h	; 8570  ................
	defb 004h,017h,00ah,02bh,01bh,007h,003h,00ch,01fh,00dh,01eh,000h,000h,02ch,000h,000h	; 8580  ...+.........,..
	defb 000h,000h,005h,00bh,004h,006h,000h,000h,019h,003h,015h,002h,000h,000h,02ch,000h	; 8590  ..............,.
	defb 001h,00ah,00dh,020h,023h,000h,007h,01ch,000h,00eh,000h,000h,000h,02ch,000h,018h	; 85a0  ... #........,..
	defb 006h,000h,000h,018h,004h,017h,016h,004h,01ah,01eh,003h,015h,013h,013h,002h,000h	; 85b0  ................
	defb 000h,007h,00ch,003h,01fh,025h,02bh,000h,00eh,028h,029h,00eh,000h,000h,02ch,028h	; 85c0  .....%+..()...,(
	defb 029h,02ch,000h,000h,00eh,028h,029h,00eh,000h,000h,000h,000h,000h,000h,000h,000h	; 85d0  ),...().........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 85e0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 85f0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8600  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8610  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8620  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8630  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8640  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8650  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8660  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8670  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8680  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8690  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 86a0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 86b0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 86c0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 86d0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 86e0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 86f0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8700  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8710  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8720  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8730  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8740  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8750  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8760  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8770  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8780  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 8790  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 87a0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 87b0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 87c0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 87d0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 87e0  ................
	defb 000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0beh,0aah,0beh,0aah,07dh,055h,07dh,055h,0fch	; 87f0  ...........}U}U.
	defb 0aah,0fch,0aah,0fch,055h,0fch,055h,0fch,02bh,0fch,02bh,0fch,02bh,0fch,02bh,0fch	; 8800  ....U.U.+.+.+.+.
	defb 033h,0fch,033h,0fch,033h,0fch,033h,0fch,02bh,0fch,02bh,0fch,02bh,0fch,02bh,0fch	; 8810  3.3.3.3.+.+.+.+.
	defb 055h,0fch,055h,0fch,0aah,0fch,0aah,07dh,055h,07dh,055h,0beh,0aah,0beh,0aah,0ffh	; 8820  U.U....}U}U.....
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0beh,0aah,0beh,0aah,07dh,055h,07dh,055h,0fch	; 8830  ...........}U}U.
	defb 0aah,0fch,0aah,0fch,055h,0fch,055h,0fch,02bh,0fch,02bh,0fch,02bh,0fch,02bh,0fch	; 8840  ....U.U.+.+.+.+.
	defb 033h,0fch,033h,0fch,033h,0fch,033h,0fch,02bh,0fch,02bh,0fch,02bh,0fch,02bh,0fch	; 8850  3.3.3.3.+.+.+.+.
	defb 055h,0fch,055h,0fch,0aah,0fch,0aah,07dh,055h,07dh,055h,0beh,0aah,0beh,0aah,0ffh	; 8860  U.U....}U}U.....
	defb 0ffh,0ffh,0ffh,015h,054h,055h,055h,00fh,0feh,02ah,0aah,017h,0fch,050h,041h,00eh	; 8870  ....TUU..*...PA.
	defb 0aeh,02ah,0aah,017h,0fch,050h,041h,00eh,0aeh,02ah,0aah,017h,0fch,050h,041h,00eh	; 8880  .*...PA..*...PA.
	defb 0aeh,02ah,0aah,017h,0fch,050h,041h,00eh,0aeh,02ah,0aah,017h,0fch,050h,041h,00eh	; 8890  .*...PA..*...PA.
	defb 0aeh,02ah,0aah,017h,0fdh,015h,055h,00eh,0aeh,08fh,0ffh,017h,0fdh,05bh,0ffh,00eh	; 88a0  .*....U......[..
	defb 0aeh,0aah,0aah,017h,0fdh,053h,055h,00eh,0aeh,0aah,0aah,017h,0fdh,053h,054h,00eh	; 88b0  .....SU......ST.
	defb 0aeh,0aah,0a8h,017h,0fdh,053h,051h,00fh,0feh,0aah,0a2h,015h,055h,053h,045h,00ah	; 88c0  .....SQ.....USE.
	defb 0aah,0aah,0a2h,015h,055h,053h,045h,00ah,0aah,0aah,0a2h,015h,055h,002h,005h,00ah	; 88d0  ....USE.....U...
	defb 0aah,000h,00ah,015h,054h,055h,055h,00ah,0aah,02ah,0aah,015h,054h,055h,055h,00ah	; 88e0  ....TUU..*..TUU.
	defb 0aah,02ah,0aah,055h,057h,055h,057h,0aah,0abh,0aah,0afh,055h,057h,055h,057h,0aah	; 88f0  .*.UWUW....UWUW.
	defb 0abh,0aah,0afh,055h,057h,055h,057h,0aah,0abh,0aah,0afh,057h,0ffh,055h,057h,0afh	; 8900  ...UWUW....W.UW.
	defb 0feh,0a8h,02fh,057h,055h,055h,057h,0aeh,0aah,0a8h,02fh,057h,055h,055h,057h,0aeh	; 8910  ../WUUW.../WUUW.
	defb 0aah,0a8h,02fh,057h,055h,055h,057h,0feh,080h,000h,02fh,0fdh,055h,055h,057h,0aah	; 8920  ../WUUW.../.UUW.
	defb 080h,000h,02fh,055h,055h,055h,057h,0aah,080h,000h,02fh,005h,055h,055h,057h,00eh	; 8930  ../UUUW.../.UUW.
	defb 0aah,0a8h,02fh,057h,055h,055h,057h,0abh,0aah,0a8h,02fh,055h,0d5h,055h,057h,0aah	; 8940  ../WUUW.../U.UW.
	defb 0eah,0a8h,02fh,055h,0d5h,055h,057h,0aah,0eah,0aah,0afh,055h,0c1h,055h,057h,0aah	; 8950  ../U.UW....U.UW.
	defb 083h,0aah,0afh,055h,057h,055h,057h,0aah,0abh,0aah,0afh,055h,057h,055h,057h,0aah	; 8960  ...UWUW....UWUW.
	defb 0abh,0aah,0afh,057h,055h,055h,015h,0abh,080h,000h,02ah,055h,000h,000h,015h,0aah	; 8970  ...WUU....*U....
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0a8h,055h,07fh,0ffh,0f9h,0aah	; 8980  ...UUUU....U....
	defb 0b5h,055h,058h,055h,07fh,0ffh,0f9h,0aah,0aah,0aah,0a8h,055h,07fh,0ffh,0f9h,0aah	; 8990  .UXU.......U....
	defb 0b5h,055h,058h,055h,07fh,0ffh,0f9h,0aah,0aah,0aah,0a8h,055h,07fh,0ffh,0f9h,0aah	; 89a0  .UXU.......U....
	defb 080h,000h,000h,055h,000h,000h,081h,0aah,0aah,0aah,0aah,055h,055h,054h,0d5h,0aah	; 89b0  ...U.......UUT..
	defb 0aah,0aah,0aah,0ffh,0f5h,05eh,0ffh,0ffh,0fah,0beh,0ffh,055h,05fh,0f4h,0d5h,0aah	; 89c0  .....^.....U_...
	defb 06fh,0eah,0aah,055h,055h,054h,0d5h,000h,06ah,0aah,000h,0ffh,055h,055h,0ffh,0aah	; 89d0  o..UUT..j...UU..
	defb 06ah,0aah,0aah,055h,055h,055h,055h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 89e0  j..UUUU.........
	defb 0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0aah	; 89f0  ................
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 8a00  ...UUUU....UUUU.
	defb 0aah,0ffh,0aah,055h,055h,061h,055h,000h,00ah,0b5h,0a0h,000h,005h,059h,040h,0aah	; 8a10  ...UUaU......Y@.
	defb 0a2h,0adh,0a2h,055h,051h,057h,045h,0aah,0a8h,0abh,0a2h,055h,054h,055h,045h,099h	; 8a20  ...UQWE....UTUE.
	defb 0aah,02ah,0a2h,055h,055h,015h,045h,099h,0aah,08ah,0a2h,055h,055h,045h,045h,099h	; 8a30  .*.UU.E....UUEE.
	defb 0aah,0a2h,0a2h,055h,055h,051h,045h,099h,0aah,0a8h,00ah,055h,055h,054h,015h,099h	; 8a40  ...UUQE....UUT..
	defb 0aah,0aah,0aah,055h,055h,055h,055h,099h,0aah,0aah,0aah,055h,055h,095h,055h,099h	; 8a50  ...UUUU....UU.U.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0ffh,0feh,0aah,055h,0ffh,0fch,055h,0abh	; 8a60  ...UUUU....U..U.
	defb 0aah,0aah,02ah,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,00ah	; 8a70  ..*.............
	defb 0aah,0aah,0aah,015h,055h,055h,055h,00ah,0aah,0aah,0aah,015h,055h,055h,055h,00ah	; 8a80  ....UUU.....UUU.
	defb 0aah,0aah,0aah,015h,055h,055h,055h,00ah,0aah,000h,000h,015h,054h,000h,000h,00ah	; 8a90  ....UUU.....T...
	defb 0a8h,0aah,0aah,015h,051h,055h,055h,00ah,0a2h,0aah,0aah,015h,045h,055h,055h,00ah	; 8aa0  ....QUU.....EUU.
	defb 0a2h,0afh,0e2h,015h,045h,058h,015h,00ah,0a2h,0aah,0b2h,015h,045h,059h,055h,00ah	; 8ab0  ....EX......EYU.
	defb 0a2h,0aah,0b2h,015h,051h,059h,055h,00ah,0a8h,0aah,0b2h,015h,054h,059h,055h,00ah	; 8ac0  ....QYU.....TYU.
	defb 0aah,02ah,0b2h,015h,054h,059h,055h,00ah,0aah,02bh,0f2h,015h,054h,058h,005h,00ah	; 8ad0  .*..TYU..+..TX..
	defb 0aah,02ah,0aah,015h,054h,055h,055h,00ah,0aah,02ah,0aah,015h,054h,055h,055h,00ah	; 8ae0  .*..TUU..*..TUU.
	defb 0aah,02ah,0aah,000h,000h,000h,001h,000h,000h,000h,003h,000h,000h,000h,007h,0aah	; 8af0  .*..............
	defb 0aah,0aah,0afh,055h,055h,055h,057h,0aah,0aah,0aah,0afh,054h,000h,015h,057h,0a8h	; 8b00  ...UUUW....T..W.
	defb 000h,03ah,0afh,051h,055h,05dh,057h,002h,0aah,0aeh,0afh,005h,055h,057h,057h,0aah	; 8b10  .:.QU]W.....UWW.
	defb 0aah,0aeh,0afh,055h,055h,057h,057h,0aah,0aah,0aeh,0afh,055h,07dh,057h,057h,0aah	; 8b20  ...UUWW....U}WW.
	defb 0eah,0aeh,0afh,055h,05dh,057h,057h,0aah,0eah,0aeh,0afh,055h,05dh,057h,057h,0aah	; 8b30  ...U]WW....U]WW.
	defb 0eah,0aeh,0afh,055h,05dh,057h,057h,0afh,0eah,0aeh,0afh,05dh,05dh,05dh,057h,0aah	; 8b40  ...U]WW....]]]W.
	defb 0aah,0bah,0afh,05fh,0fdh,075h,057h,0aah,0aah,0eah,0afh,055h,055h,0d5h,057h,0aah	; 8b50  ..._.uW....UU.W.
	defb 0abh,0aah,0afh,055h,057h,055h,057h,0aah,0abh,0aah,0afh,055h,057h,055h,057h,0aah	; 8b60  ...UWUW....UWUW.
	defb 0abh,0aah,0afh,015h,054h,055h,055h,00ah,0aeh,02ah,0aah,010h,00ch,055h,055h,008h	; 8b70  ....TUU..*...UU.
	defb 08eh,02ah,02ah,012h,02ch,055h,0d5h,008h,08eh,02ah,0aah,012h,02ch,055h,055h,008h	; 8b80  .**.,U...*..,UU.
	defb 08eh,02ah,02ah,012h,02ch,055h,0d5h,008h,08eh,02ah,0aah,012h,02ch,055h,055h,008h	; 8b90  .**.,U...*..,UU.
	defb 08eh,02ah,02ah,012h,02ch,055h,0d5h,008h,08eh,02ah,0aah,012h,02ch,055h,055h,008h	; 8ba0  .**.,U...*..,UU.
	defb 08eh,02ah,0aah,012h,02ch,055h,055h,008h,08eh,03fh,0eah,012h,02ch,07fh,0f5h,008h	; 8bb0  .*..,UU..?..,...
	defb 08eh,0aah,0bah,010h,00dh,055h,05fh,00fh,0feh,0aah,0afh,01fh,0fdh,055h,055h,00ah	; 8bc0  .....U_......UU.
	defb 0aah,0aah,0aah,015h,055h,055h,055h,00ah,0aah,0a0h,000h,015h,055h,05fh,0ffh,00ah	; 8bd0  ....UUU.....U_..
	defb 0aah,0aah,0aah,015h,055h,055h,055h,03fh,0ffh,0ffh,0ffh,07fh,0ffh,0ffh,0ffh,0ffh	; 8be0  ....UUU?........
	defb 0ffh,0ffh,0ffh,055h,057h,055h,057h,080h,00bh,0aah,0afh,05fh,0e7h,055h,057h,09ah	; 8bf0  ...UWUW...._.UW.
	defb 0abh,0aah,0afh,05ah,0a7h,055h,057h,095h,06bh,0aah,0afh,055h,067h,055h,057h,09ah	; 8c00  ...Z.UW.k..UgUW.
	defb 0abh,0aah,0afh,05ah,0a7h,055h,057h,095h,06bh,0aah,0afh,055h,067h,055h,057h,09ah	; 8c10  ...Z.UW.k..UgUW.
	defb 0abh,0aah,0afh,05ah,0a7h,055h,057h,095h,06eh,0aah,0afh,055h,06dh,055h,057h,09fh	; 8c20  ...Z.UW.n..UmUW.
	defb 0eah,0aah,0afh,040h,00dh,07fh,0d7h,0aah,0bah,0ffh,0efh,055h,05dh,060h,0d7h,0aah	; 8c30  ...@.......U]`..
	defb 0bah,0e0h,0efh,0ffh,0f5h,07fh,0d7h,0ffh,0eah,0ffh,0efh,055h,055h,055h,057h,0aah	; 8c40  ...........UUUW.
	defb 0aah,09ah,0afh,055h,055h,055h,057h,000h,000h,01ah,0afh,0ffh,0ffh,0f5h,057h,0aah	; 8c50  ...UUUW.......W.
	defb 0aah,0aah,0afh,055h,055h,055h,057h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 8c60  ...UUUW.........
	defb 0ffh,0ffh,0ffh,015h,054h,055h,055h,02ah,0aah,02ah,0aah,055h,054h,055h,055h,0aah	; 8c70  ....TUU*.*.UTUU.
	defb 0aah,02ah,0aah,055h,054h,055h,055h,0aah,0aah,02ah,0aah,040h,004h,055h,055h,080h	; 8c80  .*.UTUU..*.@.UU.
	defb 00ah,00ah,0aah,045h,05ch,005h,055h,088h,03ah,08ah,0aah,040h,01dh,045h,055h,088h	; 8c90  ...E\.U.:..@.EU.
	defb 0bah,08ah,0aah,042h,01dh,045h,055h,088h,0bah,08ah,0ffh,002h,01dh,045h,0ffh,008h	; 8ca0  ...B.EU......E..
	defb 03ah,08ah,0eah,000h,01dh,045h,0d5h,008h,03ah,08ah,0eah,000h,09dh,045h,0c0h,008h	; 8cb0  :....E..:....E..
	defb 03ah,08ah,080h,001h,01dh,045h,055h,008h,03ah,08ah,0aah,005h,05dh,015h,055h,00fh	; 8cc0  :....EU.:...].U.
	defb 0fah,02ah,0aah,01fh,0fch,055h,055h,0aah,0aah,02ah,0aah,055h,054h,055h,055h,0aah	; 8cd0  .*...UU..*.UTUU.
	defb 0aah,02ah,0aah,055h,054h,055h,055h,0aah,0aah,02ah,0aah,0d5h,054h,055h,055h,0eah	; 8ce0  .*.UTUU..*..TUU.
	defb 0aah,02ah,0aah,055h,057h,055h,050h,0aah,0abh,0aah,0a8h,055h,055h,0d5h,054h,0aah	; 8cf0  .*.UWUP....UU.T.
	defb 0aah,0eah,0aah,05fh,0d5h,075h,055h,0bah,0eah,0bah,0aah,050h,055h,05dh,055h,0b8h	; 8d00  ..._.uU....PU]U.
	defb 0eah,0aeh,0aah,050h,055h,05dh,055h,0bah,0eah,0aeh,0aah,05fh,0d5h,05dh,055h,0aah	; 8d10  ...PU]U...._.]U.
	defb 0aah,0aeh,0aah,055h,055h,05dh,055h,0ffh,0ffh,0aeh,0aah,0ffh,0ffh,05fh,0ffh,0aah	; 8d20  ...UU]U......_..
	defb 0aah,02fh,0ffh,055h,054h,05fh,055h,0aah,0aah,02fh,0aah,000h,014h,05fh,055h,000h	; 8d30  ./.UT_U../..._U.
	defb 03ah,02fh,0aah,055h,074h,05fh,055h,0aah,0bah,02fh,0aah,055h,074h,05fh,055h,0aah	; 8d40  :/.Ut_U../.Ut_U.
	defb 0bah,0feh,000h,055h,075h,0fch,000h,0aah,0bah,0aah,0aah,055h,075h,055h,055h,0aah	; 8d50  ...Uu......UuUU.
	defb 0bah,0aah,0aah,055h,05dh,055h,055h,0aah,0aeh,0aah,0abh,055h,057h,055h,057h,0aah	; 8d60  ...U]UU....UWUW.
	defb 0abh,0aah,0afh,015h,0d5h,054h,057h,02ah,0eah,0a8h,0abh,055h,0d5h,054h,055h,0aah	; 8d70  .....TW*...U.TU.
	defb 0eah,0a8h,0aah,055h,0c0h,000h,055h,0aah,080h,000h,0aah,055h,055h,055h,055h,0aah	; 8d80  ...U..U....UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,000h,00ah,0aah,000h,000h,015h,055h,000h,0aah	; 8d90  ...UUUU......U..
	defb 0bah,0aah,02ah,07fh,0fdh,055h,015h,0e0h,02eh,0aah,02ah,04fh,077h,055h,015h,0ebh	; 8da0  ..*..U....*OwU..
	defb 02bh,0ffh,0aah,04dh,076h,000h,015h,0ebh,02bh,0aah,02ah,04fh,077h,0ffh,095h,0e0h	; 8db0  +..Mv...+.*Ow...
	defb 02ah,000h,02ah,055h,077h,055h,015h,0ffh,0eeh,0aah,02ah,055h,05dh,055h,015h,0aah	; 8dc0  *.*UwU....*U]U..
	defb 0bah,0aah,02ah,055h,075h,055h,015h,0aah,0eah,0aah,02ah,055h,0d5h,055h,015h,0abh	; 8dd0  ..*UuU....*U.U..
	defb 0a0h,002h,02ah,057h,05fh,0fdh,015h,0abh,0aah,0aah,02ah,057h,055h,055h,015h,0abh	; 8de0  ..*W_.....*WUU..
	defb 0aah,0aah,02ah,057h,055h,055h,015h,0abh,0aah,0aah,02ah,057h,055h,055h,015h,0abh	; 8df0  ..*WUU....*WUU..
	defb 0aah,0aah,02ah,055h,0d5h,055h,015h,0aah,0eah,0aah,02ah,055h,075h,055h,015h,0aah	; 8e00  ..*U.U....*UuU..
	defb 0bah,0aah,02ah,055h,05dh,055h,015h,0aah,0aeh,0aah,02ah,055h,057h,055h,015h,0aah	; 8e10  ..*U]U....*UWU..
	defb 0abh,0aah,02ah,055h,057h,055h,015h,0aah,0abh,0aah,02ah,055h,057h,055h,015h,0aah	; 8e20  ..*UWU....*UWU..
	defb 0abh,0aah,02ah,057h,0ffh,055h,015h,0afh,0feh,0aah,08ah,05dh,055h,055h,045h,0bah	; 8e30  ..*W.U.....]UUE.
	defb 0aah,0aah,0a2h,0f5h,0ffh,055h,051h,0ebh,001h,0aah,0abh,055h,07dh,055h,055h,0abh	; 8e40  .....UQ....U}UU.
	defb 045h,0aah,0aah,055h,055h,055h,0d5h,001h,055h,0aah,080h,0ffh,045h,055h,0ffh,0abh	; 8e50  E..UUU..U...EU..
	defb 07dh,0aah,0aah,055h,001h,055h,0d5h,02bh,0ffh,0aah,0abh,015h,0ffh,0ffh,057h,00ah	; 8e60  }..U.U.+......W.
	defb 0ffh,0feh,0afh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0aah	; 8e70  ................
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 8e80  ...UUUU....UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0ffh,0aah,0aah,055h,0ffh,015h,055h,0abh	; 8e90  ...UUUU....U..U.
	defb 0aah,08ah,0aah,057h,055h,045h,055h,0aeh,080h,0a2h,0aah,0fdh,03eh,045h,0ffh,0fah	; 8ea0  ...WUEU.....>E..
	defb 0aah,0a3h,0ffh,055h,03eh,047h,055h,0aah,0aah,0a6h,0aah,055h,03eh,04dh,055h,0aah	; 8eb0  ...U>GU....U>MU.
	defb 0aah,0bah,0aah,055h,03eh,055h,055h,0aah,080h,0aah,0aah,055h,055h,055h,055h,000h	; 8ec0  ...U>UU....UUUU.
	defb 000h,02ah,0a0h,000h,000h,075h,040h,0aah,0aah,0bah,08ah,055h,055h,050h,015h,0aah	; 8ed0  .*...u@....UUP..
	defb 0aah,0a0h,02ah,055h,055h,055h,055h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 8ee0  ..*UUUU.........
	defb 0ffh,0ffh,0ffh,015h,0d5h,054h,057h,00ah,0eah,0a8h,0afh,015h,0d5h,054h,057h,00ah	; 8ef0  .....TW......TW.
	defb 0eah,0a8h,0afh,015h,0cch,0cch,057h,00ah,0eah,0a8h,0afh,015h,0d5h,054h,057h,00ah	; 8f00  ......W......TW.
	defb 0eah,0a8h,0afh,015h,075h,051h,057h,00ah,0b8h,002h,0afh,015h,050h,005h,057h,000h	; 8f10  ....uQW.....P.W.
	defb 0aah,0aah,007h,00eh,055h,055h,077h,00eh,000h,000h,077h,00eh,0ffh,0ffh,077h,00eh	; 8f20  ....UUw...w...w.
	defb 0a8h,00ah,077h,000h,057h,0f5h,007h,00ah,0a8h,00ah,0afh,015h,057h,0f5h,057h,00ah	; 8f30  ..w.W.......W.W.
	defb 0a8h,00ah,0afh,015h,015h,057h,057h,00ah,08ah,0aeh,0afh,015h,0c5h,05ch,057h,00ah	; 8f40  .....WW......\W.
	defb 0e3h,0f8h,0afh,015h,0d7h,0f4h,057h,00ah,0eah,0a8h,0afh,015h,0d5h,054h,057h,00ah	; 8f50  ......W......TW.
	defb 0eah,0a8h,0afh,015h,0d5h,054h,057h,00ah,0eah,0a8h,0afh,015h,0d5h,054h,057h,00ah	; 8f60  .....TW......TW.
	defb 0eah,0a8h,0afh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,00ah	; 8f70  ................
	defb 0aah,0aah,0aah,015h,055h,055h,055h,00ah,0a8h,000h,002h,015h,055h,0ffh,0f5h,00ah	; 8f80  ....UUU.....U...
	defb 0a8h,000h,032h,015h,055h,055h,035h,00ah,0aah,0aah,0b2h,015h,05fh,0f5h,005h,00ah	; 8f90  ..2.UU5....._...
	defb 0bfh,0e2h,0aah,015h,075h,051h,055h,00ah,0eah,0a8h,0aah,015h,0d5h,054h,07fh,00ah	; 8fa0  ....uQU......T..
	defb 0e6h,06ah,0ffh,015h,0d5h,055h,055h,00ah,0e6h,066h,0aah,015h,0d5h,055h,055h,00ah	; 8fb0  .j...UU..f...UU.
	defb 0e6h,066h,066h,015h,0d5h,055h,055h,00ah,0eah,066h,0aah,015h,075h,055h,055h,00ah	; 8fc0  .ff..UU..f..uUU.
	defb 0bah,0aah,080h,015h,05dh,055h,000h,00ah,0aeh,000h,02ah,015h,054h,000h,055h,00ah	; 8fd0  ....]U....*.T.U.
	defb 0aah,0aah,0aah,015h,055h,055h,055h,03fh,0ffh,0ffh,0ffh,07fh,0ffh,0ffh,0ffh,0ffh	; 8fe0  ....UUU?........
	defb 0ffh,0ffh,0ffh,000h,000h,000h,001h,000h,000h,000h,003h,000h,000h,000h,007h,0aah	; 8ff0  ................
	defb 0aah,0aah,0afh,055h,055h,055h,057h,0aah,0aah,0aah,0afh,055h,057h,0ffh,0d7h,0aah	; 9000  ...UUUW....UW...
	defb 0afh,0ffh,0afh,04ch,0d7h,033h,017h,0aah,0aeh,0cch,02fh,055h,057h,003h,017h,0aah	; 9010  ...L.3..../UW...
	defb 0aeh,0d4h,02fh,055h,057h,013h,017h,0aah,0aeh,0d4h,02fh,0ffh,0d7h,013h,017h,0ffh	; 9020  ../UW...../.....
	defb 0aeh,0d4h,02fh,055h,017h,013h,017h,0aah,02eh,0d4h,02fh,055h,017h,013h,017h,0aah	; 9030  ../U....../U....
	defb 02eh,0d4h,02fh,055h,017h,013h,017h,0aah,02eh,0c4h,02fh,055h,017h,033h,017h,000h	; 9040  ../U....../U.3..
	defb 02eh,0cch,02fh,000h,014h,000h,017h,0aah,0a8h,000h,02fh,055h,055h,055h,057h,0aah	; 9050  ../......./UUUW.
	defb 0aah,0aah,0afh,055h,055h,055h,057h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9060  ...UUUW.........
	defb 0ffh,0ffh,0ffh,000h,000h,000h,001h,000h,000h,000h,003h,000h,000h,000h,007h,00ah	; 9070  ................
	defb 0aah,0aah,0afh,015h,055h,055h,057h,008h,0a2h,08ah,02fh,010h,041h,004h,017h,00ah	; 9080  ....UUW.../.A...
	defb 0aah,0aah,0afh,010h,041h,004h,017h,00ah,0aah,0aah,0afh,010h,041h,004h,017h,00ah	; 9090  ....A.......A...
	defb 0aah,0aah,0afh,010h,041h,004h,017h,00ah,0aah,0aah,0afh,010h,041h,004h,017h,00ah	; 90a0  ....A.......A...
	defb 0aah,0aah,0afh,010h,041h,004h,017h,00ah,0aah,0aah,0afh,010h,041h,004h,017h,00ah	; 90b0  ....A.......A...
	defb 0a2h,08ah,0afh,010h,055h,054h,017h,00ah,0aah,0aah,0afh,010h,057h,0d4h,017h,00ah	; 90c0  ....UT......W...
	defb 0afh,08ah,0afh,010h,05dh,044h,017h,008h,0bah,0a2h,02fh,015h,075h,051h,057h,00ah	; 90d0  ....]D..../.uQW.
	defb 0eah,0a8h,0afh,015h,0d5h,054h,057h,00ah,0ffh,0feh,0afh,015h,080h,000h,057h,00ah	; 90e0  .....TW.......W.
	defb 0eah,0a8h,0afh,015h,0d5h,054h,057h,00ah,0eah,0a8h,0afh,015h,0ffh,0feh,057h,00ah	; 90f0  .....TW.......W.
	defb 080h,000h,0afh,015h,0d5h,054h,057h,00ah,0eah,0a8h,0afh,015h,0ffh,0feh,057h,00ah	; 9100  .....TW.......W.
	defb 080h,000h,0afh,015h,0d5h,054h,057h,00bh,0b8h,0e2h,02fh,017h,047h,01dh,017h,00eh	; 9110  .....TW.../.G...
	defb 0aah,0aah,08fh,017h,000h,001h,017h,00eh,000h,015h,08fh,017h,001h,041h,017h,00eh	; 9120  .............A..
	defb 000h,009h,08fh,017h,028h,0a1h,017h,00eh,000h,001h,08fh,017h,050h,001h,017h,00eh	; 9130  ....(.......P...
	defb 000h,005h,08fh,017h,0ffh,0ffh,017h,00eh,0aah,0aah,08fh,017h,055h,055h,017h,00bh	; 9140  ............UU..
	defb 0aah,0aah,02fh,015h,0c0h,000h,057h,00ah,080h,000h,0afh,015h,055h,055h,057h,00ah	; 9150  ../...W.....UUW.
	defb 0aah,0aah,0afh,015h,055h,055h,057h,03fh,0ffh,0ffh,0ffh,07fh,0ffh,0ffh,0ffh,0ffh	; 9160  ....UUW?........
	defb 0ffh,0ffh,0ffh,057h,055h,055h,015h,0abh,0aah,0aah,02ah,057h,055h,055h,015h,0abh	; 9170  ...WUU....*WUU..
	defb 080h,00ah,02ah,057h,07fh,0f5h,015h,0abh,0aah,0aah,02ah,057h,055h,055h,015h,0abh	; 9180  ..*W......*WUU..
	defb 0a8h,02ah,02ah,057h,050h,075h,015h,0abh,0a2h,0bah,02ah,057h,045h,05dh,015h,0abh	; 9190  .**WPu....*WE]..
	defb 0a2h,0bah,08ah,057h,045h,05dh,045h,0ffh,0a3h,0bah,0afh,0ffh,044h,05dh,05fh,0aah	; 91a0  ...WE]E.....D]_.
	defb 0a2h,0bah,0aah,055h,045h,05dh,055h,0aah,08ah,03ah,0aah,000h,015h,0d0h,000h,000h	; 91b0  ...UE]U..:......
	defb 02ah,0a0h,000h,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,05fh,0ffh,0d5h,0aah	; 91c0  *..UUUU....U_...
	defb 0bfh,0ffh,0aah,055h,075h,055h,015h,0aah,0eah,0aah,02ah,055h,0d5h,055h,015h,0abh	; 91d0  ...UuU....*U.U..
	defb 0aah,0aah,02ah,057h,055h,055h,015h,0abh,0aah,0aah,02ah,057h,055h,055h,015h,0abh	; 91e0  ..*WUU....*WUU..
	defb 0aah,0aah,02ah,057h,055h,055h,015h,0abh,0aah,0aah,02ah,057h,055h,055h,015h,0abh	; 91f0  ..*WUU....*WUU..
	defb 0aah,0aah,02ah,057h,055h,055h,015h,0abh,0aah,0aah,02ah,055h,0d5h,055h,015h,0aah	; 9200  ..*WUU....*U.U..
	defb 0eah,0aah,02ah,055h,070h,055h,015h,0aah,0a0h,0aah,02ah,055h,055h,0d5h,015h,0aah	; 9210  ..*UpU....*UU...
	defb 0aah,0eah,02ah,055h,055h,075h,015h,0feh,0aah,0bah,02ah,0fdh,055h,074h,055h,0a8h	; 9220  ..*UUu....*.UtU.
	defb 08ah,0b8h,0aah,051h,075h,074h,055h,0a8h,0aah,0b8h,0aah,001h,055h,074h,055h,000h	; 9230  ...QutU.....UtU.
	defb 0aah,0b8h,0aah,055h,055h,075h,0ffh,0aah,08ah,0bbh,0ffh,055h,075h,075h,055h,0aah	; 9240  ...UUu.....UuuU.
	defb 0aah,0eah,0aah,055h,055h,0d5h,055h,0aah,0abh,0aah,000h,055h,057h,055h,0ffh,0aah	; 9250  ...UU.U....UWU..
	defb 08bh,0aah,0aah,055h,077h,055h,055h,0aah,0abh,0aah,0abh,055h,057h,055h,057h,0aah	; 9260  ...UwUU....UWUW.
	defb 0abh,0aah,0afh,057h,055h,055h,015h,0abh,000h,000h,02ah,057h,0ffh,0ffh,015h,0abh	; 9270  ...WUU....*W....
	defb 0aah,0aah,02ah,057h,055h,055h,015h,0abh,0aah,0aah,02ah,057h,000h,000h,015h,0abh	; 9280  ..*WUU....*W....
	defb 0ffh,0ffh,02ah,055h,0d5h,055h,015h,0aah,0eah,0aah,02ah,055h,075h,055h,015h,0aah	; 9290  ..*U.U....*UuU..
	defb 0bah,0aah,08ah,055h,05dh,055h,045h,0aah,0aeh,0aah,0a3h,055h,057h,055h,057h,0aah	; 92a0  ...U]UE....UWUW.
	defb 0abh,0aah,0aah,055h,055h,0d5h,055h,0aah,0aah,0eah,0aah,055h,055h,040h,000h,0aah	; 92b0  ...UU.U....UU@..
	defb 0aah,0a0h,000h,0ffh,055h,055h,055h,0feh,02ah,0aah,0aah,055h,015h,055h,055h,0aah	; 92c0  ....UUU.*..U.UU.
	defb 08ah,0aah,0aah,055h,045h,055h,055h,002h,0afh,0aah,0aah,0fdh,05fh,055h,055h,0aah	; 92d0  ...UEUU....._UU.
	defb 0aah,02ah,0aah,055h,054h,055h,055h,02ah,0aah,02ah,0aah,015h,054h,055h,055h,00ah	; 92e0  .*.UTUU*.*..TUU.
	defb 0aah,02ah,0aah,055h,057h,055h,057h,0aah,0abh,0aah,0abh,055h,057h,055h,055h,0aah	; 92f0  .*.UWUW....UWUU.
	defb 0abh,0aah,0aah,066h,067h,055h,055h,0aah,0abh,0aah,0aah,055h,057h,055h,055h,0aah	; 9300  ...fgUU....UWUU.
	defb 0abh,0aah,0aah,055h,057h,055h,055h,0aah,0aeh,0aah,000h,055h,05dh,054h,000h,0aah	; 9310  ...UWUU....U]T..
	defb 0bah,0a8h,0aah,055h,05dh,051h,055h,0ffh,0bah,0a2h,088h,0ffh,05dh,045h,055h,0aah	; 9320  ...U]QU.....]EU.
	defb 03ah,08ah,088h,054h,05dh,015h,055h,0aah,03ah,028h,088h,000h,05ch,055h,055h,000h	; 9330  :..T].U.:(..\UU.
	defb 03ah,028h,088h,055h,05ch,055h,055h,0aah,0bah,028h,088h,055h,05ch,055h,055h,0aah	; 9340  :(.U\UU..(.U\UU.
	defb 0bah,02ah,0aah,055h,074h,055h,055h,0aah,0eah,000h,02ah,055h,0d4h,000h,015h,0abh	; 9350  .*.UtUU...*U....
	defb 0aah,0aah,02ah,057h,055h,055h,015h,0abh,0aah,0aah,02ah,057h,055h,055h,015h,0abh	; 9360  ..*WUU....*WUU..
	defb 0aah,0aah,02ah,015h,054h,055h,055h,02ah,0aah,02ah,0aah,055h,054h,055h,055h,0aah	; 9370  ..*.TUU*.*.UTUU.
	defb 0aah,02ah,0aah,055h,055h,015h,055h,0aah,0aah,08ah,0aah,055h,055h,045h,055h,0aah	; 9380  .*.UU.U....UUEU.
	defb 0aah,0a2h,0aah,055h,055h,051h,055h,000h,00ah,0a8h,0aah,000h,01dh,054h,055h,0aah	; 9390  ...UUQU......TU.
	defb 0aeh,0aah,02ah,055h,057h,055h,015h,0aah,0abh,0aah,0bfh,055h,055h,0d5h,07fh,0aah	; 93a0  ..*UWU.....UU...
	defb 0aah,0eah,0aah,055h,055h,075h,055h,0a0h,002h,0eah,0aah,055h,051h,075h,040h,0a0h	; 93b0  ...UUuU....UQu@.
	defb 002h,0eah,080h,055h,055h,075h,015h,0aah,0aah,0eah,02ah,055h,055h,075h,015h,0aah	; 93c0  ...UUu....*UUu..
	defb 0aah,0eah,02ah,055h,055h,0d5h,015h,0abh,0ffh,0aah,02ah,057h,0ffh,055h,015h,0abh	; 93d0  ..*UU.....*W.U..
	defb 0aah,0aah,02ah,057h,055h,055h,015h,0abh,0aah,0aah,02ah,057h,055h,055h,015h,0abh	; 93e0  ..*WUU....*WUU..
	defb 0aah,0aah,02ah,015h,0d5h,054h,057h,00ah,0e0h,008h,0abh,015h,0c0h,01ch,055h,00ah	; 93f0  ..*..TW.......U.
	defb 0cah,0ach,0aah,015h,095h,056h,055h,00ah,0aah,0aah,0aah,015h,055h,055h,055h,00ah	; 9400  .....VU.....UUU.
	defb 0aah,0aah,0aah,015h,0ffh,055h,055h,00bh,000h,020h,000h,015h,001h,040h,000h,00bh	; 9410  .....UU.. ...@..
	defb 038h,00ah,0aah,015h,001h,045h,055h,00bh,038h,00ah,0aah,015h,001h,045h,055h,00bh	; 9420  8....EU.8....EU.
	defb 000h,02fh,0eah,015h,039h,05fh,0d5h,00bh,000h,02ah,08ah,015h,001h,055h,015h,00bh	; 9430  ./..9_...*...U..
	defb 000h,02ah,08ah,015h,039h,055h,015h,00bh,000h,020h,00ah,015h,001h,040h,015h,00bh	; 9440  .*..9U... ...@..
	defb 000h,00ah,0aah,015h,055h,015h,055h,00ah,000h,02ah,0aah,015h,054h,055h,0fdh,00ah	; 9450  ....U.U..*..TU..
	defb 0aah,02ah,002h,015h,054h,055h,055h,00ah,0aah,02ah,0aah,015h,054h,055h,055h,00ah	; 9460  .*..TUU..*..TUU.
	defb 0aah,02ah,0aah,015h,054h,055h,055h,00ah,0aah,02ah,0aah,015h,054h,055h,013h,00ah	; 9470  .*..TUU..*..TU..
	defb 0aah,022h,00ah,017h,0fch,041h,053h,00eh,0aeh,02ah,00ah,015h,054h,041h,053h,00fh	; 9480  ."...AS..*..TAS.
	defb 0feh,02ah,00ah,015h,054h,041h,053h,00ah,0a8h,0aah,00ah,015h,051h,041h,053h,00ah	; 9490  .*..TAS.....QAS.
	defb 0a2h,0aah,00ah,015h,045h,041h,053h,00ah,08ah,0aah,00ah,015h,015h,041h,053h,00ah	; 94a0  ....EAS......AS.
	defb 02ah,0aah,00ah,014h,055h,041h,013h,00ah,02ah,0a2h,0aah,014h,055h,055h,055h,00ah	; 94b0  *...UA..*...UUU.
	defb 02ah,0aah,0aah,014h,07fh,0ffh,0ffh,00ah,0ffh,0ffh,0dfh,015h,055h,055h,055h,00ah	; 94c0  *...........UUU.
	defb 0aah,0aah,09ah,015h,055h,055h,055h,00ah,0ffh,0eah,080h,015h,0ffh,0c5h,05fh,00ah	; 94d0  ....UUU......._.
	defb 0eah,0a2h,0aah,015h,0d5h,051h,055h,00ah,0ffh,0fch,0abh,015h,080h,000h,057h,00ah	; 94e0  .....QU.......W.
	defb 0eah,0a8h,0afh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0aah	; 94f0  ................
	defb 0afh,0ffh,0feh,055h,047h,0ffh,0ffh,0aah,0a2h,0aah,0aeh,055h,044h,01ch,037h,0aah	; 9500  ...UG......UD.7.
	defb 0a2h,0ffh,0aeh,055h,044h,0ddh,037h,000h,062h,0beh,0aeh,000h,0c4h,0ddh,037h,0abh	; 9510  ...UD.7.b.....7.
	defb 0a2h,0beh,0aeh,057h,044h,0ddh,037h,0aeh,0a2h,0beh,0aeh,05dh,044h,0ddh,037h,0aeh	; 9520  ...WD.7....]D.7.
	defb 0a2h,0beh,0afh,05dh,044h,01ch,035h,0aeh,0a2h,0ebh,0eah,05dh,045h,055h,055h,0aeh	; 9530  ...]D.5....]EUU.
	defb 0a2h,0aah,0aah,05ch,005h,055h,055h,0a8h,002h,0aah,0aah,055h,055h,055h,055h,0aah	; 9540  ...\.UU....UUUU.
	defb 0aah,000h,000h,055h,057h,000h,000h,0aah,0abh,0aah,0aah,055h,057h,055h,055h,0aah	; 9550  ...UW......UWUU.
	defb 0abh,0aah,0aah,055h,057h,055h,055h,0aah,0abh,0aah,0abh,055h,057h,055h,057h,0aah	; 9560  ...UWUU....UWUW.
	defb 0abh,0aah,0afh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh	; 9570  ................
	defb 0feh,0aah,0aah,040h,005h,055h,055h,0d5h,056h,0aah,0aah,040h,005h,055h,055h,0cah	; 9580  ...@.UU.V..@.UU.
	defb 0a6h,0aah,0aah,040h,005h,055h,055h,0d5h,056h,080h,000h,040h,005h,000h,000h,0ffh	; 9590  ...@.UU.V..@....
	defb 0feh,02ah,0aah,055h,054h,055h,055h,0aah,0aah,02bh,0feh,0ffh,054h,055h,055h,0feh	; 95a0  .*.UTUU..+..TUU.
	defb 0a8h,0abh,0feh,054h,051h,055h,055h,0a8h,0a2h,0abh,0feh,054h,04fh,0f5h,055h,0a8h	; 95b0  ...TQUU....TO.U.
	defb 09fh,0e2h,0beh,054h,055h,051h,055h,0a8h,0aah,0a8h,0beh,054h,055h,054h,055h,000h	; 95c0  ...TUQU....TUTU.
	defb 0aah,080h,03eh,000h,055h,000h,055h,0aah,0aah,02ah,0beh,055h,054h,055h,055h,0aah	; 95d0  ..>.U.U..*.UTUU.
	defb 0aah,02fh,0feh,055h,054h,055h,055h,02ah,0aah,02fh,0feh,015h,054h,055h,055h,00ah	; 95e0  ./.UTUU*./..TUU.
	defb 0aah,02ah,0aah,055h,057h,055h,057h,0aah,0abh,0aah,0afh,055h,057h,055h,057h,0aah	; 95f0  .*.UWUW....UWUW.
	defb 0abh,0aah,0afh,07fh,0f7h,055h,057h,080h,00bh,0aah,0afh,055h,057h,055h,057h,0aah	; 9600  .....UW....UWUW.
	defb 0abh,0aah,0afh,055h,057h,000h,017h,0aah,0aah,000h,02fh,07fh,0f5h,055h,077h,080h	; 9610  ...UW...../..Uw.
	defb 00ah,0aah,0efh,055h,055h,055h,077h,0aah,0aah,0aah,0efh,055h,055h,055h,077h,0aah	; 9620  ...UUUw....UUUw.
	defb 0aah,0aah,0efh,07fh,0ffh,05fh,0d7h,080h,000h,0bfh,0afh,055h,055h,075h,057h,0aah	; 9630  ....._.....UUuW.
	defb 0aah,0eah,0afh,0ffh,0ffh,0d5h,057h,0feh,0ffh,0aah,0afh,054h,0d5h,055h,057h,0aah	; 9640  ......W....T.UW.
	defb 0aah,0aah,0afh,054h,0d5h,055h,057h,000h,0abh,0feh,0afh,0ffh,0d7h,0fch,057h,0aah	; 9650  ...T.UW.......W.
	defb 0aeh,0a8h,0afh,055h,0fdh,054h,057h,02ah,0fbh,018h,0afh,015h,0d5h,054h,057h,00ah	; 9660  ...U.TW*.....TW.
	defb 0eah,0a8h,0afh,015h,0d5h,054h,057h,022h,0eah,0a8h,0afh,049h,0c0h,000h,057h,0aah	; 9670  .....TW"...I..W.
	defb 080h,000h,0afh,049h,055h,055h,057h,0aah,0aah,0aah,0afh,049h,040h,001h,057h,0aah	; 9680  ...IUUW....I@.W.
	defb 080h,003h,0afh,049h,015h,055h,0d7h,000h,02ah,0aah,0efh,000h,055h,055h,077h,0aah	; 9690  ...I.U..*...UUw.
	defb 0aah,0aah,0efh,055h,055h,055h,077h,0aah,0aah,0aah,0efh,05fh,0fdh,055h,077h,0a0h	; 96a0  ...UUUw...._.Uw.
	defb 002h,0aah,0efh,055h,055h,055h,077h,0aah,0aah,0aah,0efh,055h,055h,07fh,0d7h,0bfh	; 96b0  ...UUUw....UU...
	defb 0fah,0ffh,0afh,040h,005h,0d5h,057h,0aah,0abh,0aah,0afh,055h,057h,040h,017h,0aah	; 96c0  ...@..W....UW@..
	defb 0abh,0a2h,02fh,055h,057h,048h,097h,0bfh,0fbh,0a2h,02fh,040h,007h,048h,097h,0aah	; 96d0  ../UWH..../@.H..
	defb 0abh,0a2h,02fh,055h,057h,040h,017h,0aah,0abh,0aah,0afh,055h,057h,055h,057h,0aah	; 96e0  ../UW@.....UWUW.
	defb 0abh,0aah,0afh,015h,054h,055h,055h,02ah,0aah,02ah,0aah,05fh,0f4h,055h,055h,0b0h	; 96f0  ....TUU*.*._.UU.
	defb 01ah,026h,066h,057h,0d4h,055h,055h,0b4h,05ah,02ah,066h,055h,054h,005h,055h,0b5h	; 9700  .&fW.UU.Z*fUT.U.
	defb 05ah,002h,066h,054h,055h,045h,055h,0b7h,0dah,0a2h,066h,050h,015h,045h,055h,0bfh	; 9710  Z.fTUEU...fP.EU.
	defb 0fah,0a2h,066h,055h,055h,045h,055h,0aah,0aah,0a2h,0a6h,0ffh,0d5h,051h,055h,0ffh	; 9720  ..fUUEU......QU.
	defb 08ah,0a8h,0aah,055h,045h,054h,055h,0aah,0a2h,0aah,02ah,055h,051h,055h,015h,0aah	; 9730  ...UETU...*UQU..
	defb 0a8h,0aah,08ah,055h,054h,055h,047h,0aah,0aah,02ah,0afh,055h,055h,015h,055h,000h	; 9740  ...UTUG..*.UU.U.
	defb 000h,00ah,0aah,000h,000h,015h,055h,0aah,0aah,0aah,0a0h,055h,055h,055h,05fh,0aah	; 9750  ......U....UUU_.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9760  ...UUUU.........
	defb 0ffh,0ffh,0ffh,055h,057h,055h,057h,0aah,0abh,0aah,0abh,041h,057h,055h,055h,09ch	; 9770  ...UWUW....AWUU.
	defb 003h,080h,000h,057h,0f7h,05fh,0fdh,09ch,003h,080h,000h,041h,057h,055h,055h,0aah	; 9780  ...W._.....AWUU.
	defb 0bfh,0aah,0aah,055h,07fh,055h,055h,0aah,0eah,0aah,0aah,055h,0d5h,07fh,055h,0abh	; 9790  ...U.UU....U..U.
	defb 0aah,0feh,02ah,057h,055h,0d5h,015h,0aeh,0abh,0aah,08ah,05dh,057h,055h,047h,0aeh	; 97a0  ..*WU......]WUG.
	defb 0aeh,0aah,0afh,05dh,05dh,055h,055h,0aeh,0bah,0aah,0aah,05dh,05dh,055h,055h,0aeh	; 97b0  ...]]UU....]]UU.
	defb 0bah,066h,066h,0fdh,05dh,055h,055h,0feh,0bah,0aah,0aah,055h,05dh,055h,055h,0aah	; 97c0  .ff.]UU....U]UU.
	defb 0bah,0aah,000h,055h,05dh,054h,000h,002h,0aeh,000h,0aah,0fdh,054h,001h,055h,0aah	; 97d0  ...U]T......T.U.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 97e0  ...UUUU.........
	defb 0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,00ah	; 97f0  ................
	defb 0aah,0aah,0aah,015h,055h,055h,055h,000h,0aah,0aah,0a2h,015h,057h,0ffh,049h,004h	; 9800  ....UUU.....W.I.
	defb 0afh,0feh,0aah,015h,05dh,054h,049h,004h,0bah,0aah,02ah,011h,075h,054h,049h,00ah	; 9810  ....]TI...*.uTI.
	defb 0eah,0aah,022h,015h,0d5h,054h,055h,00bh,0aah,0aah,02ah,017h,050h,001h,01fh,00eh	; 9820  .."..TU...*.P...
	defb 0a7h,0fah,0bfh,017h,054h,009h,055h,00eh,0a5h,0eah,0aah,017h,055h,069h,055h,00eh	; 9830  ....T.U.....UiU.
	defb 0a5h,0aah,0aah,017h,055h,069h,055h,00eh,0a5h,0aah,0aah,017h,055h,0e9h,050h,00bh	; 9840  ....UiU.....U.P.
	defb 0a4h,00ah,0a0h,015h,0d7h,0f9h,045h,00ah,0e0h,002h,08ah,015h,0d5h,055h,015h,00ah	; 9850  ......E......U..
	defb 0eah,0aah,02ah,015h,0c0h,004h,055h,00ah,0efh,0e8h,0abh,015h,0c0h,004h,057h,00ah	; 9860  ..*...U.......W.
	defb 0eah,0a8h,0afh,000h,000h,000h,001h,000h,000h,000h,003h,000h,000h,000h,007h,0aah	; 9870  ................
	defb 0aah,0aah,0afh,055h,055h,055h,057h,0aah,0aah,0aah,0afh,055h,07fh,0f5h,057h,0aah	; 9880  ...UUUW....U..W.
	defb 0ffh,0e2h,0afh,055h,0d5h,040h,007h,0abh,0aah,08bh,0f7h,057h,055h,010h,007h,0aeh	; 9890  ...U.@.....WU...
	defb 0aah,02ah,0afh,05dh,054h,055h,057h,0aeh,0a8h,0afh,0efh,0fdh,051h,05fh,0d7h,0fah	; 98a0  .*.]TUW.....Q_..
	defb 0a2h,0bah,08fh,055h,045h,075h,017h,0aah,08ah,0eah,08fh,055h,015h,0d5h,017h,0aah	; 98b0  ...UEu.....U....
	defb 02bh,0aah,08fh,054h,057h,045h,017h,0a8h,0aeh,092h,08fh,001h,05dh,055h,017h,002h	; 98c0  +..TWE......]U..
	defb 0bah,092h,08fh,055h,074h,055h,017h,0aah,0e9h,012h,02fh,055h,0d5h,054h,057h,0aah	; 98d0  ...UtU..../U.TW.
	defb 0e9h,010h,0afh,055h,0d5h,054h,057h,02ah,0e9h,000h,0afh,015h,0d4h,054h,057h,00ah	; 98e0  ...U.TW*.....TW.
	defb 0eah,0a8h,0afh,015h,0d5h,054h,057h,00ah,0eah,0a8h,0abh,015h,0d5h,054h,055h,00ah	; 98f0  .....TW......TU.
	defb 0eah,0a8h,0aah,015h,0d5h,054h,055h,00bh,0aah,0a8h,002h,017h,055h,054h,005h,00eh	; 9900  .....TU.....UT..
	defb 0aah,0aah,0a2h,017h,000h,000h,045h,00eh,0bfh,0feh,0a2h,017h,000h,000h,045h,00eh	; 9910  ......E.......E.
	defb 0aah,0aah,0a2h,017h,055h,055h,045h,00eh,0aah,0aah,0a2h,017h,000h,040h,007h,00eh	; 9920  ....UUE......@..
	defb 0beh,0afh,0afh,017h,000h,040h,015h,00eh,0aah,0aah,0aah,017h,055h,055h,055h,00eh	; 9930  .....@......UUU.
	defb 0a8h,002h,0aah,017h,054h,007h,055h,00bh,0a8h,0feh,0aah,015h,0d5h,0ffh,055h,00ah	; 9940  ....T.U.......U.
	defb 0eah,0aah,080h,015h,075h,055h,000h,00ah,0bah,0aah,02ah,015h,05ch,000h,055h,00ah	; 9950  ....uU....*.\.U.
	defb 0a8h,000h,0aah,015h,055h,055h,055h,03fh,0ffh,0ffh,0ffh,07fh,0ffh,0ffh,0ffh,0ffh	; 9960  ....UUU?........
	defb 0ffh,0ffh,0ffh,015h,0d5h,054h,057h,02ah,0eah,0a8h,0afh,055h,0d5h,054h,077h,0aah	; 9970  .....TW*...U.Tw.
	defb 0eah,0e8h,08fh,055h,0d5h,0b4h,057h,0aah,0eah,0e8h,0afh,055h,075h,054h,077h,0a0h	; 9980  ...U..W....UuTw.
	defb 0bah,0a8h,08fh,044h,05dh,054h,057h,0aeh,0aeh,0a8h,0afh,044h,057h,054h,077h,0a0h	; 9990  ...D]TW....DWTw.
	defb 0abh,0a8h,08fh,055h,055h,0d4h,057h,0aah,0aah,0e8h,0afh,0ffh,0ffh,0f4h,077h,0ffh	; 99a0  ...UU.W.......w.
	defb 0ffh,0f8h,08fh,055h,055h,054h,057h,0aah,0aah,0aah,02fh,05fh,0ffh,0f5h,017h,0a0h	; 99b0  ...UUTW.../_....
	defb 000h,00ah,02fh,05fh,0ffh,0f5h,017h,0aah,0aah,0aah,02fh,055h,055h,054h,057h,000h	; 99c0  ../_....../UUTW.
	defb 000h,000h,0afh,000h,000h,001h,057h,0aah,0aah,0aah,0afh,055h,055h,055h,057h,0aah	; 99d0  ......W....UUUW.
	defb 0aah,0aah,0afh,055h,055h,055h,057h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 99e0  ...UUUW.........
	defb 0ffh,0ffh,0ffh,015h,0d5h,054h,057h,00ah,0eah,0a8h,0abh,015h,0d5h,054h,055h,00ah	; 99f0  .....TW......TU.
	defb 0eah,0a8h,0aah,015h,0d5h,054h,055h,00ah,0eah,0aah,02ah,015h,0d5h,055h,015h,00ah	; 9a00  .....TU...*..U..
	defb 0eah,0aah,08ah,015h,075h,055h,045h,00ah,0bah,0aah,0a2h,015h,05dh,055h,045h,00ah	; 9a10  ....uUE.....]UE.
	defb 0aeh,0aah,0a2h,015h,057h,055h,045h,000h,00bh,0aah,08ah,015h,047h,055h,01fh,002h	; 9a20  ....WUE.....GU..
	defb 0abh,0aah,0bfh,015h,0c7h,055h,055h,003h,0abh,0aah,0aah,015h,0c7h,055h,055h,003h	; 9a30  .....UU......UU.
	defb 0abh,0a0h,0aah,015h,047h,040h,055h,002h,0abh,08ah,0eah,010h,007h,045h,075h,00ah	; 9a40  ....G@U......Eu.
	defb 0abh,08ah,0b8h,015h,057h,045h,050h,00ah,0ffh,080h,0aah,015h,0ffh,040h,055h,00ah	; 9a50  ....WEP......@U.
	defb 0eah,0a8h,0aah,015h,0d5h,054h,055h,00ah,0eah,0a8h,0abh,015h,0d5h,054h,057h,00ah	; 9a60  .....TU......TW.
	defb 0eah,0a8h,0afh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0aah	; 9a70  ................
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0a8h,0aah,0aah,07fh,0d2h,055h,055h,0bfh	; 9a80  ...UUUU......UU.
	defb 0a7h,02ah,02ah,075h,00dh,097h,015h,0bah,027h,02eh,08ah,075h,012h,05dh,015h,0bah	; 9a90  .**u....'..u.]..
	defb 028h,0bah,02ah,075h,015h,074h,055h,0bah,02ah,0e8h,0aah,0f5h,015h,0d1h,07fh,0fah	; 9aa0  (.*u.tU.*.......
	defb 02bh,0a2h,0bfh,055h,017h,045h,075h,0aah,02eh,08ah,0bah,054h,05dh,015h,075h,0a8h	; 9ab0  +..U.Eu....T].u.
	defb 0bah,08ah,0bah,051h,075h,015h,075h,0a8h,0eah,08ah,0bah,051h,0d5h,015h,075h,000h	; 9ac0  ...Qu.u....Q..u.
	defb 0eah,08ah,0a0h,001h,0d5h,015h,040h,0aah,0eah,08ah,0aah,055h,0d5h,000h,055h,0aah	; 9ad0  ......@....U..U.
	defb 0eah,080h,0aah,055h,0d5h,054h,055h,02ah,0eah,0a8h,0abh,015h,0d5h,054h,057h,00ah	; 9ae0  ...U.TU*.....TW.
	defb 0eah,0a8h,0afh,015h,0d5h,054h,057h,02ah,0eah,0a8h,0afh,055h,0ffh,07eh,057h,0aah	; 9af0  .....TW*...U.~W.
	defb 080h,080h,0afh,07dh,0d5h,054h,057h,0aah,0eah,0a8h,0afh,07dh,0d5h,054h,057h,0aah	; 9b00  ...}.TW....}.TW.
	defb 0eah,0a8h,0afh,07dh,0d5h,051h,057h,0aah,0eah,0a2h,0afh,07dh,075h,045h,007h,0aah	; 9b10  ...}.QW....}uE..
	defb 0bah,08ah,02fh,055h,05dh,045h,067h,0aah,0aeh,08ah,02fh,0ffh,057h,045h,067h,0feh	; 9b20  ../U]Eg.../.WEg.
	defb 0fbh,089h,02fh,054h,0d3h,045h,067h,0a8h,0abh,089h,02fh,054h,0d3h,045h,067h,0a8h	; 9b30  ../T.Eg.../T.Eg.
	defb 0abh,089h,02fh,054h,003h,045h,067h,0a8h,0abh,08ah,02fh,054h,057h,045h,067h,000h	; 9b40  ../T.Eg.../TWEg.
	defb 0aeh,08ah,02fh,000h,05dh,045h,007h,0aah,0bah,0a2h,0afh,055h,075h,051h,057h,0aah	; 9b50  ../.]E.....UuQW.
	defb 0eah,0a8h,0afh,055h,0d5h,054h,057h,02ah,0eah,0a8h,0afh,015h,0d5h,054h,057h,00ah	; 9b60  ...U.TW*.....TW.
	defb 0eah,0a8h,0afh,015h,0d5h,054h,057h,02ah,0eah,000h,0abh,051h,0d4h,0f4h,055h,0aeh	; 9b70  .....TW*...Q..U.
	defb 0eah,090h,0aah,055h,0d4h,0f4h,0fdh,0aah,0eah,000h,0a8h,011h,0c1h,054h,0c5h,0eeh	; 9b80  ...U.........T..
	defb 082h,0a8h,080h,055h,057h,054h,0c5h,0aah,0abh,0a8h,080h,011h,011h,0d4h,0c5h,0eeh	; 9b90  ...UWT..........
	defb 0eeh,0e8h,0a8h,055h,055h,0d4h,001h,0aah,0aah,0e8h,0aah,0ffh,0d5h,0d5h,0ffh,0ffh	; 9ba0  ...UU...........
	defb 08ah,0ebh,0ffh,040h,045h,0d5h,055h,0aah,0e2h,0eah,0aah,055h,071h,075h,055h,0aah	; 9bb0  ...@E.U....UquU.
	defb 0b8h,0bah,0aah,055h,059h,05dh,055h,0aah,0a8h,0aeh,0aah,07fh,059h,057h,055h,000h	; 9bc0  ...UY]U.....YWU.
	defb 028h,0abh,080h,001h,019h,055h,000h,0abh,0b8h,0aah,0aah,055h,001h,055h,055h,0aah	; 9bd0  (....U.....U.UU.
	defb 000h,0aah,0aah,055h,055h,055h,055h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9be0  ...UUUU.........
	defb 0ffh,0ffh,0ffh,038h,000h,000h,000h,038h,000h,000h,000h,038h,000h,000h,001h,038h	; 9bf0  ...8...8...8...8
	defb 000h,000h,001h,038h,000h,000h,001h,038h,000h,040h,001h,038h,000h,040h,001h,038h	; 9c00  ...8...8.@.8.@.8
	defb 000h,0e0h,001h,038h,000h,0e0h,001h,038h,001h,0f0h,001h,038h,001h,0f0h,001h,038h	; 9c10  ...8...8...8...8
	defb 003h,0f8h,001h,038h,003h,0f8h,001h,038h,007h,0fch,001h,038h,000h,0e0h,000h,038h	; 9c20  ...8...8...8...8
	defb 000h,0e0h,000h,038h,000h,0e0h,000h,038h,000h,0e0h,000h,038h,000h,0e0h,001h,038h	; 9c30  ...8...8...8...8
	defb 000h,0e0h,001h,038h,000h,0e0h,001h,038h,000h,0e0h,001h,038h,000h,0e0h,001h,038h	; 9c40  ...8...8...8...8
	defb 000h,0e0h,001h,038h,000h,0e0h,001h,038h,000h,0e0h,001h,038h,000h,000h,001h,038h	; 9c50  ...8...8...8...8
	defb 000h,000h,001h,038h,000h,000h,001h,038h,000h,000h,001h,038h,000h,000h,000h,038h	; 9c60  ...8...8...8...8
	defb 000h,000h,000h,000h,000h,000h,01ch,000h,000h,000h,01ch,080h,000h,000h,01ch,080h	; 9c70  ................
	defb 000h,000h,01ch,080h,000h,000h,01ch,080h,002h,000h,01ch,080h,002h,000h,01ch,080h	; 9c80  ................
	defb 007h,000h,01ch,080h,007h,000h,01ch,080h,00fh,080h,01ch,080h,00fh,080h,01ch,080h	; 9c90  ................
	defb 01fh,0c0h,01ch,080h,01fh,0c0h,01ch,080h,03fh,0e0h,01ch,000h,007h,000h,01ch,000h	; 9ca0  ........?.......
	defb 007h,000h,01ch,000h,007h,000h,01ch,000h,007h,000h,01ch,080h,007h,000h,01ch,080h	; 9cb0  ................
	defb 007h,000h,01ch,080h,007h,000h,01ch,080h,007h,000h,01ch,080h,007h,000h,01ch,080h	; 9cc0  ................
	defb 007h,000h,01ch,080h,007h,000h,01ch,080h,007h,000h,01ch,080h,000h,000h,01ch,080h	; 9cd0  ................
	defb 000h,000h,01ch,080h,000h,000h,01ch,080h,000h,000h,01ch,000h,000h,000h,01ch,000h	; 9ce0  ................
	defb 000h,000h,01ch,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0bfh	; 9cf0  ...UUUU....UUUU.
	defb 0ffh,0ffh,0fah,050h,000h,000h,00dh,017h,0ffh,0ffh,0e8h,0f4h,0f5h,05fh,02fh,0b4h	; 9d00  ...P........._/.
	defb 0e0h,00fh,02ah,057h,0c0h,017h,0edh,0b7h,08ah,0bbh,0eah,057h,015h,05dh,0edh,016h	; 9d10  ..*W.......W.]..
	defb 02fh,0eeh,0e8h,0f4h,054h,057h,06fh,0b6h,038h,03bh,0eah,054h,050h,017h,06dh,0b6h	; 9d20  /...TWo.8;.TP.m.
	defb 030h,01bh,0eah,054h,050h,017h,06dh,016h,038h,03bh,0e8h,0f4h,054h,057h,06fh,0b6h	; 9d30  0..TP.m.8;..TWo.
	defb 02fh,0eeh,0eah,057h,015h,05dh,0edh,0b7h,08ah,0bbh,0eah,057h,0c7h,0f7h,0edh,014h	; 9d40  /..W.].....W....
	defb 0efh,0efh,028h,0f4h,0f5h,05fh,02fh,0b7h,0ffh,0ffh,0eah,050h,000h,000h,00dh,0bfh	; 9d50  ..(.._/....P....
	defb 0ffh,0ffh,0fah,055h,055h,055h,055h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9d60  ...UUUU.........
	defb 0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0aah	; 9d70  ................
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,05fh,055h,055h,0aah	; 9d80  ...UUUU....U_UU.
	defb 0beh,0aah,0aah,055h,074h,07fh,0f5h,0aah,0e8h,0bfh,0e2h,055h,0d4h,075h,045h,0abh	; 9d90  ...Ut......U.uE.
	defb 0a8h,0bah,0a2h,057h,05ch,075h,045h,0aeh,0a0h,0bbh,0a2h,0fdh,054h,076h,0c7h,0fah	; 9da0  ...W\uE.....Tv..
	defb 0a8h,0bbh,0afh,055h,05ch,075h,055h,0aah,0a0h,0b9h,02ah,040h,014h,075h,055h,0afh	; 9db0  ...U\uU...*@.uU.
	defb 0a8h,0b9h,02ah,040h,01ch,075h,055h,0aah,0a0h,0b9h,02ah,055h,054h,075h,055h,000h	; 9dc0  ..*@.uU...*UTuU.
	defb 0a8h,0b9h,020h,000h,05ch,075h,040h,0aah,020h,0b9h,022h,055h,014h,071h,005h,0aah	; 9dd0  .. .\u@. ."U.q..
	defb 080h,0a0h,002h,055h,040h,055h,055h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9de0  ...U@UU.........
	defb 0ffh,0ffh,0ffh,015h,0d5h,054h,057h,00bh,0aah,0aah,02fh,017h,055h,055h,017h,00eh	; 9df0  .....TW.../.UU..
	defb 080h,002h,08fh,017h,040h,005h,017h,00eh,08ch,0ceh,08fh,017h,043h,03dh,017h,00eh	; 9e00  ....@.......C=..
	defb 08ch,0ceh,08fh,017h,043h,03dh,017h,00eh,08ch,0ceh,08fh,017h,05fh,0fdh,017h,00eh	; 9e10  ....C=......_...
	defb 0bdh,0deh,08fh,017h,055h,055h,017h,00bh,0a8h,08ah,02fh,015h,0d5h,054h,057h,00ah	; 9e20  ....UU..../..TW.
	defb 0eah,0a8h,0afh,015h,075h,051h,057h,00ah,0bah,0a2h,0afh,015h,05dh,045h,057h,00ah	; 9e30  ....uQW.....]EW.
	defb 0aeh,08ah,0afh,015h,057h,015h,057h,000h,006h,09fh,0ffh,017h,0f7h,010h,017h,000h	; 9e40  ....W.W.........
	defb 006h,09fh,0ffh,015h,057h,015h,057h,00ah,0aeh,08ah,0afh,015h,05dh,045h,057h,00ah	; 9e50  ....W.W.....]EW.
	defb 0bah,0a2h,0afh,015h,075h,051h,057h,00ah,0eah,0a8h,0afh,015h,0d5h,054h,057h,00ah	; 9e60  ....uQW......TW.
	defb 0eah,0a8h,0afh,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 9e70  ...UUUU....UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 9e80  ...UUUU....UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 9e90  ...UUUU....UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 9ea0  ...UUUU....UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 9eb0  ...UUUU....UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 9ec0  ...UUUU....UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 9ed0  ...UUUU....UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 9ee0  ...UUUU....UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 9ef0  ...UUUU....UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 9f00  ...UUUU....UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 9f10  ...UUUU....UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 9f20  ...UUUU....UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 9f30  ...UUUU....UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 9f40  ...UUUU....UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 9f50  ...UUUU....UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 9f60  ...UUUU....UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 9f70  ...UUUU....UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 9f80  ...UUUU....UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 9f90  ...UUUU....UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 9fa0  ...UUUU....UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 9fb0  ...UUUU....UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 9fc0  ...UUUU....UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 9fd0  ...UUUU....UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 9fe0  ...UUUU....UUUU.
	defb 0aah,0aah,0aah,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9ff0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,002h,002h,002h,002h,002h,002h,002h,002h	; a000  ................
	defb 002h,002h,002h,000h,000h,000h,010h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a010  ................
	defb 012h,012h,002h,012h,012h,002h,006h,006h,006h,006h,006h,006h,006h,006h,006h,006h	; a020  ................
	defb 006h,006h,006h,004h,004h,004h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a030  ................
	defb 000h,000h,008h,008h,008h,008h,008h,008h,008h,008h,008h,008h,008h,008h,008h,008h	; a040  ................
	defb 008h,008h,008h,008h,008h,008h,008h,008h,008h,00ah,00ah,00ah,00ah,00ah,00ah,00ah	; a050  ................
	defb 00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah	; a060  ................
	defb 00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,002h,002h,002h,002h,016h,006h	; a070  ................
	defb 016h,006h,01ah,01ah,00ah,01ah,012h,006h,016h,006h,01ah,00ah,01ah,012h,012h,002h	; a080  ................
	defb 014h,004h,014h,004h,010h,000h,010h,008h,01ah,00ah,01ah,00ah,012h,002h,012h,006h	; a090  ................
	defb 016h,014h,014h,014h,004h,010h,010h,010h,010h,000h,010h,010h,010h,010h,010h,000h	; a0a0  ................
	defb 006h,006h,006h,006h,006h,006h,006h,006h,002h,002h,002h,00ah,00ah,002h,006h,015h	; a0b0  ................
	defb 015h,00dh,018h,018h,000h,010h,01ah,002h,002h,002h,012h,002h,016h,006h,01ah,00ah	; a0c0  ................
	defb 01ah,002h,016h,006h,016h,006h,006h,016h,01ah,01ah,012h,006h,016h,014h,014h,004h	; a0d0  ................
	defb 014h,014h,014h,014h,006h,006h,006h,016h,006h,01ah,00ah,016h,006h,016h,00eh,00ah	; a0e0  ................
	defb 01ah,006h,016h,006h,012h,00ah,01ah,006h,016h,006h,01ah,01ah,002h,006h,006h,01eh	; a0f0  ................
	defb 00ah,01ah,00ah,016h,006h,01ah,00ah,01ah,006h,016h,00eh,01ah,00ah,016h,006h,006h	; a100  ................
	defb 01ah,016h,016h,016h,016h,016h,00ah,002h,002h,006h,002h,002h,002h,002h,002h,002h	; a110  ................
	defb 002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h	; a120  ................
	defb 002h,002h,002h,002h,006h,016h,006h,004h,014h,000h,000h,000h,000h,000h,000h,002h	; a130  ................
	defb 002h,002h,000h,000h,000h,004h,004h,004h,000h,000h,000h,000h,000h,000h,000h,000h	; a140  ................
	defb 000h,000h,000h,000h,000h,000h,002h,002h,002h,006h,006h,006h,002h,002h,002h,002h	; a150  ................
	defb 002h,002h,002h,002h,002h,00ah,00ah,00ah,002h,002h,002h,002h,002h,002h,002h,002h	; a160  ................
	defb 000h,000h,000h,000h,000h,000h,002h,002h,002h,002h,002h,002h,002h,000h,000h,000h	; a170  ................
	defb 000h,010h,000h,000h,002h,002h,002h,002h,002h,000h,000h,000h,000h,000h,000h,000h	; a180  ................
	defb 000h,008h,000h,000h,000h,010h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a190  ................
	defb 000h,000h,000h,000h,000h,000h,004h,004h,004h,004h,004h,004h,004h,002h,002h,002h	; a1a0  ................
	defb 002h,002h,002h,006h,004h,004h,000h,000h,000h,000h,002h,000h,000h,010h,000h,000h	; a1b0  ................
	defb 010h,000h,012h,000h,010h,000h,010h,000h,018h,008h,000h,010h,000h,010h,000h,000h	; a1c0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,008h,008h,000h,000h,000h,000h,000h,000h,002h	; a1d0  ................
	defb 002h,00ah,00ah,00ah,002h,002h,002h,002h,002h,00ah,000h,000h,000h,000h,000h,000h	; a1e0  ................
	defb 000h,000h,000h,000h,000h,008h,008h,000h,008h,008h,00ah,00ah,000h,000h,000h,000h	; a1f0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a200  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a210  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a220  ................
	defb 000h,000h,000h,000h,000h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h	; a230  ................
	defb 001h,001h,001h,001h,001h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a240  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a250  ................
	defb 002h,002h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a260  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,010h	; a270  .........

; ======================================================================
; CODIGO 0xa279..0xa5f0  (887 bytes)
; ======================================================================


arranque_apie:		; Todo el armazon de la fase (0xA279-0xA538): pone la pila, enciende la pantalla con R1=0xE2 heredando el SCREEN 2 que dejo la fase de naves, engancha `ret` en H.KEYI y `jp 0xC46E` en H.TIMI, recoge los records y el marcador que el otro programa dejo en 0xD6D8, monta el titulo, arranca la partida y se queda en el bucle de juego. Entra por el `jp 0a279h` de 0xF7B5, ya en el bloque de naves
	di			;a279
	ld sp,05b32h		;a27a
	in a,(099h)		;a27d
	and a			;a27f
	ld a,0e2h		;a280
	out (099h),a		;a282
	ld a,081h		;a284
	and a			;a286
	and a			;a287
	out (099h),a		;a288
	ld a,0c9h		;a28a
	ld (0fd9ah),a		;a28c
	ld a,0c3h		;a28f
	ld (0fd9fh),a		;a291
	ld hl,0c46eh		;a294
	ld (0fda0h),hl		;a297
	ld a,r			;a29a
	ld l,a			;a29c
	ld a,r			;a29d
	ld h,a			;a29f
	ld (0ad28h),hl		;a2a0
	xor a			;a2a3
	ld (0b87ch),a		;a2a4
	ld hl,0d6d8h		;a2a7
	ld de,0b8c8h		;a2aa
	ld bc,00078h		;a2ad
	ldir			;a2b0
	ld de,06557h		;a2b2
	ld hl,00748h		;a2b5
	ld c,002h		;a2b8
L_A2BA:
	ld b,010h		;a2ba
	call vram_pon_dir		;a2bc
	push de			;a2bf
L_A2C0:
	ld a,(de)		;a2c0
	out (098h),a		;a2c1
	inc de			;a2c3
	inc de			;a2c4
	inc de			;a2c5
	inc de			;a2c6
	djnz L_A2C0		;a2c7
	pop de			;a2c9
	inc de			;a2ca
	ld hl,00788h		;a2cb
	dec c			;a2ce
	jr nz,L_A2BA		;a2cf
	ei			;a2d1
L_A2D2:
	call entra_en_records		;a2d2
L_A2D5:
	ld hl,06858h		;a2d5
	ld (0a6ebh),hl		;a2d8
	ld sp,05b32h		;a2db
	ld hl,04000h		;a2de
	ld (0c463h),hl		;a2e1
	xor a			;a2e4
	ld (0ad0eh),a		;a2e5
	ld (0acf8h),a		;a2e8
	ld (0ace3h),a		;a2eb
	ld (0aca2h),a		;a2ee
	ld (0ad03h),a		;a2f1
	inc a			;a2f4
	ld (0c45ch),a		;a2f5
	ld a,040h		;a2f8
	ld (0c465h),a		;a2fa
	ld hl,02f78h		;a2fd
	call pinta_marca_hud		;a300
	ld a,0f1h		;a303
	call rellena_colores		;a305
	call repinta_escudo		;a308
	ld a,003h		;a30b
	ld (0c45fh),a		;a30d
	call hud_vidas		;a310
	ld hl,0a6fch		;a313
	ld (0a689h),hl		;a316
	ld a,r			;a319
	ld l,a			;a31b
	ld a,r			;a31c
	ld h,a			;a31e
	ld (0ad28h),hl		;a31f
	call borra_torre		;a322
L_A325:
	ld a,0a0h		;a325
	ld (0ad27h),a		;a327
L_A32A:
	call borra_buffer		;a32a
	ld a,001h		;a32d
	ld (0ad2ah),a		;a32f
	call pinta_estrellas		;a332
	call juega_en_firme		;a335
	call rotula_menu		;a338
	ld a,(0c462h)		;a33b
	and a			;a33e
	jr z,L_A36F		;a33f
	cp 002h			;a341
	ld hl,(0c463h)		;a343
	ld de,00030h		;a346
	jr z,L_A354		;a349
	sbc hl,de		;a34b
	ld a,h			;a34d
	cp 039h			;a34e
	jr nz,L_A362		;a350
	jr L_A36F		;a352
L_A354:
	add hl,de		;a354
	ld a,h			;a355
	cp 067h			;a356
	jr nz,L_A35E		;a358
	ld h,040h		;a35a
	jr L_A362		;a35c
L_A35E:
	cp 043h			;a35e
	jr z,L_A36F		;a360
L_A362:
	ld (0c463h),hl		;a362
	ld hl,0c462h		;a365
	ld a,(0c465h)		;a368
	add a,(hl)		;a36b
	ld (0c465h),a		;a36c
L_A36F:
	call vuelca_pantalla		;a36f
	ld a,(0ad27h)		;a372
	dec a			;a375
	jp z,L_B68C		;a376
	ld (0ad27h),a		;a379
	ld a,(0c45bh)		;a37c
	and a			;a37f
	jr z,L_A32A		;a380
	bit 4,a			;a382
	jp z,L_A325		;a384
	ld a,(0c465h)		;a387
	cp 010h			;a38a
	jp z,L_A325		;a38c
	cp 0f8h			;a38f
	jr c,L_A39A		;a391
	xor a			;a393
	ld (0b87ch),a		;a394
	jp L_A325		;a397
L_A39A:
	cp 030h			;a39a
	jp z,L_A325		;a39c
	jr nc,L_A3A7		;a39f
	ld (0b87ch),a		;a3a1
	jp L_A325		;a3a4
L_A3A7:
	cp 050h			;a3a7
	jp z,L_A325		;a3a9
	jr c,L_A3B4		;a3ac
	call redefine_teclas		;a3ae
	jp L_A2D5		;a3b1
L_A3B4:
	ld hl,0b87fh		;a3b4
	ld de,0b880h		;a3b7
	ld bc,00005h		;a3ba
	ld (hl),030h		;a3bd
	ldir			;a3bf
	ld ix,0b87fh		;a3c1
	ld de,012b0h		;a3c5
	call hud_imprime		;a3c8
	ld a,002h		;a3cb
	ld (0c45fh),a		;a3cd
	call hud_vidas		;a3d0
	call borra_buffer		;a3d3
	call vuelca_pantalla		;a3d6
	call borra_torre		;a3d9
	ld hl,0d750h		;a3dc
	ld de,0b87fh		;a3df
	ld bc,00007h		;a3e2
	ld a,(0a689h)		;a3e5
	cp 0eeh			;a3e8
	jr z,L_A3EE		;a3ea
	ldir			;a3ec
L_A3EE:
	ld ix,0b87fh		;a3ee
	ld de,012b0h		;a3f2
	call hud_imprime		;a3f5
	xor a			;a3f8
	ld (0bc34h),a		;a3f9
	ld (0c468h),a		;a3fc
	ld hl,09ff3h		;a3ff
	ld (0c460h),hl		;a402
	ld a,047h		;a405
	ld (0c466h),a		;a407
	ld a,002h		;a40a
	ld (0c467h),a		;a40c
	ld hl,06858h		;a40f
	ld (0a6e9h),hl		;a412
	ld a,006h		;a415
	ld (0bc33h),a		;a417
	ld b,a			;a41a
	ld ix,0bc24h		;a41b
L_A41F:
	ld a,b			;a41f
	dec a			;a420
	add a,a			;a421
	add a,a			;a422
	add a,a			;a423
	add a,a			;a424
	add a,a			;a425
	add a,00ch		;a426
	ld (ix+000h),a		;a428
	call azar		;a42b
	and 00fh		;a42e
	ld (ix+001h),a		;a430
	inc ix			;a433
	inc ix			;a435
	djnz L_A41F		;a437
respawn:		; Devuelve al jugador a la ultima posicion pisada en firme (0xA6E9) con la camara del checkpoint 0xC466/67, escudo a 3, tablas de enemigos vaciadas y el update restaurado
	call repinta_escudo		;a439
	ld hl,L_A580		;a43c
	ld (update_jugador+1),hl	;a43f
	xor a			;a442
	ld (0acbbh),a		;a443
	ld (0ad0eh),a		;a446
	ld (0b87ah),a		;a449
	ld (0c459h),a		;a44c
	ld hl,(0a6e9h)		;a44f
	ld (0a6ebh),hl		;a452
	ld a,(0c466h)		;a455
	ld (0ad2ah),a		;a458
	ld a,(0c467h)		;a45b
	ld (0ad2ch),a		;a45e
	xor a			;a461
	ld (0ace3h),a		;a462
	ld (0acf8h),a		;a465
	ld (0ad03h),a		;a468
	ld (0aca2h),a		;a46b
	ld (0ad27h),a		;a46e
	ld (0b879h),a		;a471
	ld (0b87bh),a		;a474
	ld (0b878h),a		;a477
	ld (0c45ah),a		;a47a
	ld (0c45ch),a		;a47d
	ld (0b720h),a		;a480
	call sonido_reset		;a483
	call borra_globales_sonido		;a486
	call hud_vidas		;a489
	call azar		;a48c
	and 003h		;a48f
	ld l,a			;a491
	ld h,000h		;a492
	ld de,0c46ah		;a494
	add hl,de		;a497
	ld a,(hl)		;a498
	call rellena_colores		;a499
	ld a,001h		;a49c
	ld (0ad30h),a		;a49e
L_A4A1:
	ld hl,0ad27h		;a4a1
	inc (hl)		;a4a4
	ld a,0c2h		;a4a5
	ld (0a98eh),a		;a4a7
	call redibuja_fondo		;a4aa
	call mueve_voladores		;a4ad
	ld a,0cah		;a4b0
	ld (0a98eh),a		;a4b2
	call redibuja_fondo		;a4b5
	call mueve_disparos		;a4b8
	call dispara_torretas		;a4bb
	call mueve_enemigos		;a4be
	call tic_cuenta_atras		;a4c1
	call mueve_tiros_torreta		;a4c4
	call voladores_activos		;a4c7
	call alta_enemigo_cuadro		;a4ca
	xor a			;a4cd
	ld (0c462h),a		;a4ce
	ld a,(0a689h)		;a4d1
	cp 0eeh			;a4d4
	jr nz,L_A501		;a4d6
	call hay_tecla		;a4d8
	jp nz,L_A2D5		;a4db
	ld a,(0ad27h)		;a4de
	and 008h		;a4e1
	jr z,L_A501		;a4e3
	ld a,0ffh		;a4e5
	ld (0b4aah),a		;a4e7
	ld (0b4b0h),a		;a4ea
	ld ix,0b9abh		;a4ed
	ld hl,04d94h		;a4f1
	call rotula_cadena		;a4f4
	ld a,055h		;a4f7
	ld (0b4aah),a		;a4f9
	ld a,0aah		;a4fc
	ld (0b4b0h),a		;a4fe
L_A501:
	call update_jugador		;a501
	call vuelca_pantalla		;a504
	ld ix,0b86ah		;a507
	ld a,(ix+00dh)		;a50b
	out (0aah),a		;a50e
	in a,(0a9h)		;a510
	and (ix+00ch)		;a512
	jp z,L_A2D2		;a515
	call pausa		;a518
	ld a,(0a6edh)		;a51b
	cp 02dh			;a51e
	jr nc,L_A525		;a520
	jp L_A4A1		;a522
L_A525:
	ld a,(0c45fh)		;a525
	sub 001h		;a528   ; El embudo de las vidas: con 0xA6ED >= 0x2D resta una a 0xC45F; con acarreo game over, si no respawn
	ld (0c45fh),a		;a52a
	ld hl,L_A580		;a52d
	ld (update_jugador+1),hl	;a530
	jp c,L_A2D2		;a533
	jp respawn		;a536
pausa:		; Si la tecla PARAR (la sexta de 0xB86A) esta pulsada, espera a que se suelten todas las teclas y luego a que se pulse cualquiera
	ld ix,0b86ah		;a539
	ld a,(ix+00bh)		;a53d
	out (0aah),a		;a540
	in a,(0a9h)		;a542
	and (ix+00ah)		;a544
	ret nz			;a547
L_A548:
	ld d,0f0h		;a548
	ld a,d			;a54a
L_A54B:
	out (0aah),a		;a54b
	in a,(0a9h)		;a54d
	cpl			;a54f
	and a			;a550
	jr nz,L_A548		;a551
	inc d			;a553
	ld a,d			;a554
	cp 0f9h			;a555
	jr nz,L_A54B		;a557
L_A559:
	ld d,0f0h		;a559
	ld a,d			;a55b
L_A55C:
	out (0aah),a		;a55c
	in a,(0a9h)		;a55e
	cpl			;a560
	and a			;a561
	ret nz			;a562
	inc d			;a563
	ld a,d			;a564
	cp 0f9h			;a565
	jr nz,L_A55C		;a567
	jr L_A559		;a569
hud_vidas:		; Pasa las vidas de 0xC45F a ASCII con `add a,030h` y las estampa con hud_imprime en la tabla de patrones 0x07A0, la misma posicion que usa el indicador de vidas de la fase de naves
	ld a,(0c45fh)		;a56b
	add a,030h		;a56e
	ld (0c45dh),a		;a570
	ld ix,0c45dh		;a573
	ld de,007a0h		;a577
	jp hud_imprime		;a57a
update_jugador:		; El turno del jugador, y la unica llamada que se parchea en caliente: es un `jp` cuyo operando (0xA57E) apunta a 0xA580 en juego normal y a cadaver_parabola tras un impacto. Reparte segun 0xA6ED -1 a 3 vivo, 4 sentencia, 5 a 0x2D agonia- y de 7 a 0x1E pinta los doce fotogramas del derrumbe (0x50 a 0x5B, dos cuadros cada uno)
	jp L_A580		;a57d
L_A580:
	ld hl,(0a6ebh)		;a580
L_A583:
	ld a,(0a6edh)		;a583
	ld hl,(0a6ebh)		;a586
	cp 004h			;a589
	jp c,L_A665		;a58b
	jr z,$+99		;a58e
	inc a			;a590
	ld (0a6edh),a		;a591
	call pinta_torre		;a594
	ld a,(0a6edh)		;a597
	cp 01fh			;a59a
	ret nc			;a59c
	sub 007h		;a59d
	jr c,L_A5D0		;a59f
	push af			;a5a1
	jr nz,L_A5B3		;a5a2
	call sonido_reset		;a5a4
	ld a,002h		;a5a7
	ld de,0cda5h		;a5a9
	call arranca_guion		;a5ac
	call sonido_off		;a5af
	xor a			;a5b2
L_A5B3:
	cp 014h			;a5b3
	jr nz,L_A5C1		;a5b5
	xor a			;a5b7
	ld de,0ce1eh		;a5b8
	di			;a5bb
	call arranca_guion_sin_di		;a5bc
	ld a,014h		;a5bf
L_A5C1:
	pop af			;a5c1
	rra			;a5c2
	add a,050h		;a5c3
	call 00000h		;a5c5   ; BIOS CHKRAM - Tests RAM and sets RAM slot for the system  [alias: STARTUP, RESET, BOOT]
	ld hl,(0a6ebh)		;a5c8
	ld a,060h		;a5cb
	jp pinta_sprite		;a5cd
L_A5D0:
	ld a,(0ad0eh)		;a5d0
	ld hl,(0a6ebh)		;a5d3
	ld bc,00202h		;a5d6
	call aplica_rumbo		;a5d9
	ld (0a6ebh),hl		;a5dc
	ld a,(0c469h)		;a5df
	call gira_rumbo		;a5e2
	ld (0c469h),a		;a5e5
	and 007h		;a5e8
	ld hl,(0a6ebh)		;a5ea
	jp pinta_sprite		;a5ed

; ----------------------------------------------------------------------
; DATOS relleno: o resto (1 B; 1 bytes)
;   0xa5f0..0xa5f1  (1 bytes)
; ----------------------------------------------------------------------
	defb 0c9h	; a5f0  .

; ======================================================================
; CODIGO 0xa5f1..0xa6e9  (248 bytes)
; ======================================================================


L_A5F1:
	inc a			;a5f1
	ld (0a6edh),a		;a5f2
	ld a,(0ad0eh)		;a5f5
	and 007h		;a5f8
	ld (0ad0eh),a		;a5fa
	bit 0,a			;a5fd
	jr z,L_A632		;a5ff
	cp 004h			;a601
	jr c,L_A61C		;a603
	ld a,l			;a605
	add a,002h		;a606
	ld l,a			;a608
	call consulta_mapa		;a609
	ld a,006h		;a60c
	jr nz,L_A632		;a60e
	ld a,(0ad0eh)		;a610
	cp 007h			;a613
	ld a,004h		;a615
	jr nz,L_A632		;a617
	xor a			;a619
	jr L_A632		;a61a
L_A61C:
	ld a,l			;a61c
	sub 002h		;a61d
	ld l,a			;a61f
	call consulta_mapa		;a620
	ld a,002h		;a623
	jr nz,L_A632		;a625
	ld a,(0ad0eh)		;a627
	and 007h		;a62a
	dec a			;a62c
	ld a,004h		;a62d
	jr nz,L_A632		;a62f
	xor a			;a631
L_A632:
	and a			;a632
	jr nz,L_A638		;a633
	ld hl,0b396h		;a635
L_A638:
	cp 002h			;a638
	jr nz,L_A63F		;a63a
	ld hl,0b2a6h		;a63c
L_A63F:
	cp 004h			;a63f
	jr nz,L_A646		;a641
	ld hl,0b36eh		;a643
L_A646:
	cp 006h			;a646
	jr nz,L_A64D		;a648
	ld hl,0b30ah		;a64a
L_A64D:
	ld (0a5c6h),hl		;a64d
	ld (0ad0eh),a		;a650
	ld c,a			;a653
	add a,004h		;a654
	and 007h		;a656
	rrca			;a658
	rrca			;a659
	rrca			;a65a
	or c			;a65b
	ld (0c469h),a		;a65c
	call pinta_torre		;a65f
	jp L_A5D0		;a662
L_A665:
	call consulta_mapa		;a665   ; La consulta del suelo del JUGADOR: celda vacia bajo los pies = 0xA6ED=4, muerte sentenciada (la unica escritura de la via de caida)
	jr nz,juega_en_firme		;a668
	ld a,004h		;a66a
	ld (0a6edh),a		;a66c
	jp L_A583		;a66f
juega_en_firme:		; El turno del jugador cuando hay suelo bajo los pies: apunta el checkpoint, lee el mando por el `call` parcheable de 0xA688, dispara, gira el rumbo, da el paso y avanza la animacion sumando 8 a 0xAD0E solo si se ha movido de verdad. Lo llama tambien el bucle del titulo, que es lo que mueve el cursor del menu
	xor a			;a672
	ld (0c462h),a		;a673
	ld hl,(0a6ebh)		;a676
	ld (0a6e9h),hl		;a679
	ld a,(0ad2ah)		;a67c
	ld (0c466h),a		;a67f
	ld a,(0ad2ch)		;a682
	ld (0c467h),a		;a685
	call lee_mando		;a688
	ld (0c45bh),a		;a68b
	call dispara		;a68e
	and 00fh		;a691
	call poda_rumbo_jugador		;a693
	call rumbo_a_mascara2		;a696
	cp 0ffh			;a699
	ld hl,(0a6ebh)		;a69b
	jr z,L_A6D1		;a69e
	rrca			;a6a0
	rrca			;a6a1
	rrca			;a6a2
	ld c,a			;a6a3
	ld a,(0ad0eh)		;a6a4
	and 01fh		;a6a7
	or c			;a6a9
	call gira_rumbo		;a6aa
	ld (0ad0eh),a		;a6ad
	ld c,002h		;a6b0
	call paso_jugador		;a6b2
	call recorta_x_jugador		;a6b5
	ld (0a6ebh),hl		;a6b8
	ld a,(0c462h)		;a6bb
	and a			;a6be
	jr nz,L_A6C7		;a6bf
	ld a,(0a6e9h)		;a6c1
	cp l			;a6c4
	jr z,L_A6D1		;a6c5
L_A6C7:
	ld a,(0ad0eh)		;a6c7
	and 01fh		;a6ca
	add a,008h		;a6cc
	ld (0ad0eh),a		;a6ce
L_A6D1:
	ld a,(0ad0eh)		;a6d1
	and 01fh		;a6d4
	bit 3,a			;a6d6
	jr z,L_A6DC		;a6d8
	res 4,a			;a6da
L_A6DC:
	call pinta_sprite		;a6dc
	call pinta_torre		;a6df
	ld hl,(0a6ebh)		;a6e2
	call tiro_alcanza_jugador		;a6e5
	ret			;a6e8

; ----------------------------------------------------------------------
; DATOS relleno: o resto (5 B; 5 bytes)
;   0xa6e9..0xa6ee  (5 bytes)
; ----------------------------------------------------------------------
	defb 000h,000h,000h,000h,000h	; a6e9  .....

; ======================================================================
; CODIGO 0xa6ee..0xaca2  (1460 bytes)
; ======================================================================


lee_mando_demo:		; Saca el siguiente byte de la partida grabada de la demo (puntero en 0xC460) y avanza
	ld ix,(0c460h)		;a6ee
	ld a,(ix+000h)		;a6f2
	inc ix			;a6f5
	ld (0c460h),ix		;a6f7
	ret			;a6fb
lee_mando:		; Los cinco controles en un byte: por el registro 14 del PSG si 0xB87C dice joystick, o preguntando las teclas de 0xB86A si dice teclado. Los bits del joystick se reordenan a mano igual que en la fase de naves
	ld a,(0b87ch)		;a6fc
	and a			;a6ff
	ld c,000h		;a700
	jr z,L_A733		;a702
	ld a,(0c45ch)		;a704
	and a			;a707
	jr nz,L_A733		;a708
	ld a,007h		;a70a
	out (0a0h),a		;a70c
	ld a,0ffh		;a70e
	out (0a1h),a		;a710
	ld a,00eh		;a712
	out (0a0h),a		;a714
	in a,(0a2h)		;a716
	rra			;a718
	jr c,L_A71D		;a719
	set 1,c			;a71b
L_A71D:
	rra			;a71d
	jr c,L_A722		;a71e
	set 0,c			;a720
L_A722:
	rra			;a722
	jr c,L_A727		;a723
	set 3,c			;a725
L_A727:
	rra			;a727
	jr c,L_A72C		;a728
	set 2,c			;a72a
L_A72C:
	rra			;a72c
	jr c,L_A731		;a72d
	set 4,c			;a72f
L_A731:
	ld a,c			;a731
	ret			;a732
L_A733:
	ld ix,0b86ah		;a733
	ld b,005h		;a737
L_A739:
	ld a,(ix+001h)		;a739
	out (0aah),a		;a73c
	in a,(0a9h)		;a73e
	and (ix+000h)		;a740
	jr nz,L_A746		;a743
	scf			;a745
L_A746:
	rr c			;a746
	inc ix			;a748
	inc ix			;a74a
	djnz L_A739		;a74c
	ld a,c			;a74e
	rrca			;a74f
	rrca			;a750
	rrca			;a751
	ret			;a752
mueve_enemigos:		; El bucle de los enemigos andantes (tabla 0xACE4, contador 0xACE3): scroll sumado (0xC462), y rumbo por azar entre vagar y perseguir al jugador
	ld ix,0ace4h		;a753
	ld a,(0ace3h)		;a757
	and a			;a75a
	ret z			;a75b
	ld b,a			;a75c
L_A75D:
	push bc			;a75d
	ld a,(0c462h)		;a75e
	add a,(ix+001h)		;a761
	ld (ix+001h),a		;a764
	ld a,(ix+003h)		;a767
	cp 014h			;a76a
	jr c,L_A787		;a76c
	ld l,(ix+000h)		;a76e
	ld h,(ix+001h)		;a771
	add a,03fh		;a774
	call pinta_sprite		;a776
	inc (ix+003h)		;a779
	ld a,(ix+003h)		;a77c
	cp 021h			;a77f
	jp nz,L_A88C		;a781
	jp L_A897		;a784
L_A787:
	ld b,(ix+001h)		;a787
	ld c,(ix+000h)		;a78a
	call azar		;a78d
	bit 4,a			;a790
	jr z,L_A79B		;a792
	and 007h		;a794
	call rumbo_a_mascara		;a796
	jr L_A7A2		;a799
L_A79B:
	ld de,(0a6ebh)		;a79b
	call rumbo_al_jugador		;a79f
L_A7A2:
	call borde_pantalla		;a7a2
	call rumbo_a_mascara2		;a7a5
	ld (0b13fh),a		;a7a8
	ld l,(ix+000h)		;a7ab
	ld h,(ix+001h)		;a7ae
	rrca			;a7b1
	rrca			;a7b2
	rrca			;a7b3
	ld c,a			;a7b4
	ld a,(ix+003h)		;a7b5
	inc a			;a7b8
	cp 009h			;a7b9
	ld (ix+003h),a		;a7bb
	ld a,(ix+002h)		;a7be
	jr nz,L_A7D9		;a7c1
	ld (ix+003h),000h	;a7c3
	and 01fh		;a7c7
	or c			;a7c9
	call gira_rumbo		;a7ca
	and 01fh		;a7cd
	ld c,a			;a7cf
	ld a,(ix+002h)		;a7d0
	and 020h		;a7d3
	or c			;a7d5
	ld (ix+002h),a		;a7d6
L_A7D9:
	ld l,(ix+000h)		;a7d9
	ld h,(ix+001h)		;a7dc
	and 007h		;a7df
	ld bc,00202h		;a7e1
	call aplica_rumbo		;a7e4
	call recorta_x_objeto		;a7e7
	push hl			;a7ea
	push ix			;a7eb
	call consulta_mapa		;a7ed   ; El paso a prueba: aplicado el rumbo se consulta el mapa, y si la celda es vacio el paso se deshace
	pop ix			;a7f0
	pop hl			;a7f2
	jr nz,L_A7FE		;a7f3
	ld l,(ix+000h)		;a7f5
	ld h,(ix+001h)		;a7f8
	jp L_A821		;a7fb
L_A7FE:
	ld e,(ix+000h)		;a7fe
	ld d,(ix+001h)		;a801
	and a			;a804
	sbc hl,de		;a805
	jr z,L_A81A		;a807
	ld a,(ix+002h)		;a809
	add a,008h		;a80c
	and 018h		;a80e
	ld c,a			;a810
	ld a,(ix+002h)		;a811
	and 0e7h		;a814
	or c			;a816
	ld (ix+002h),a		;a817
L_A81A:
	add hl,de		;a81a
	ld (ix+000h),l		;a81b
	ld (ix+001h),h		;a81e
L_A821:
	ld a,h			;a821
	cp 0e0h			;a822
	jp nc,L_A897		;a824
	ld a,(ix+002h)		;a827
	and 01fh		;a82a
	bit 3,a			;a82c
	jr z,L_A832		;a82e
	res 4,a			;a830
L_A832:
	add a,018h		;a832
	bit 5,(ix+002h)		;a834
	jr z,L_A83C		;a838
	add a,018h		;a83a
L_A83C:
	call pinta_sprite		;a83c
	ld a,(0b13fh)		;a83f
	xor (ix+002h)		;a842
	and 007h		;a845
	jr nz,L_A865		;a847
	ld a,(ix+002h)		;a849
	and 007h		;a84c
	ex af,af'		;a84e
	call azar		;a84f
	and 01fh		;a852
	jr nz,L_A865		;a854
	ld a,(ix+000h)		;a856
	add a,004h		;a859
	ld c,a			;a85b
	ld a,(ix+001h)		;a85c
	add a,004h		;a85f
	ld b,a			;a861
	call alta_tiro_enemigo		;a862
L_A865:
	call disparo_derriba_andante		;a865
	ld a,(0a6edh)		;a868
	cp 004h			;a86b
	jr nc,L_A88C		;a86d
	ld l,(ix+000h)		;a86f
	ld h,(ix+001h)		;a872
	call choca_con_jugador		;a875
	jr c,L_A88C		;a878
	ld (ix+002h),0ffh	;a87a
	ld (ix+003h),01dh	;a87e
	xor a			;a882
	ld de,0cd6dh		;a883
	call arranca_guion		;a886
	call mata_jugador_impacto		;a889
L_A88C:
	ld de,00005h		;a88c
	add ix,de		;a88f
L_A891:
	pop bc			;a891
	dec b			;a892
	jp nz,L_A75D		;a893
	ret			;a896
L_A897:
	ld hl,0ace3h		;a897
	dec (hl)		;a89a
	pop bc			;a89b
	push bc			;a89c
	ld a,b			;a89d
	cp 001h			;a89e
	jr z,L_A891		;a8a0
	push ix			;a8a2
	pop de			;a8a4
	push de			;a8a5
	inc de			;a8a6
	inc de			;a8a7
	inc de			;a8a8
	inc de			;a8a9
	inc de			;a8aa
	ld hl,0acf8h		;a8ab
	and a			;a8ae
	sbc hl,de		;a8af
	ld b,h			;a8b1
	ld c,l			;a8b2
	ex de,hl		;a8b3
	pop de			;a8b4
	ldir			;a8b5
	jp L_A891		;a8b7
paso_jugador:		; Cruza la mascara del rumbo actual con la del pedido y mueve 2 px solo en lo que tengan en comun; luego FIJA la fila en 0x68 y, si el paso la habia cambiado, cae en actualiza_scroll con el carry diciendo si sube
	push af			;a8ba
	and 007h		;a8bb
	call rumbo_a_mascara		;a8bd
	ld h,a			;a8c0
	pop af			;a8c1
	rlca			;a8c2
	rlca			;a8c3
	rlca			;a8c4
	and 007h		;a8c5
	call rumbo_a_mascara		;a8c7
	and h			;a8ca
	ld h,068h		;a8cb
	ret z			;a8cd
	ld b,002h		;a8ce
	call rumbo_a_mascara2		;a8d0
	call aplica_rumbo		;a8d3
	ld a,h			;a8d6
	ld h,068h		;a8d7
	cp h			;a8d9
	ret z			;a8da
actualiza_scroll:		; La camara: fino 0xAD2C +-2 con ciclo 2..32; al agotarlo la fila 0xAD2A avanza (topes 0 y 71). Carry = subir. Remata rotando el tile 0 (L_B140/L_B167)
	ld iy,0ad2ah		;a8db
	jr nc,L_A8FF		;a8df
	ld a,(iy+002h)		;a8e1
	cp 020h			;a8e4
	jr z,L_A8F0		;a8e6
	add a,002h		;a8e8
	ld (iy+002h),a		;a8ea
	jp rota_fondo_sube		;a8ed
L_A8F0:
	ld a,(iy+000h)		;a8f0
	or a			;a8f3
	ret z			;a8f4
	ld (iy+002h),002h	;a8f5
	dec (iy+000h)		;a8f9   ; El engranaje de la camara: fino agotado (32) -> fila una menos, fino a 2
	jp rota_fondo_sube		;a8fc
L_A8FF:
	ld a,(iy+002h)		;a8ff
	cp 002h			;a902
	jr z,L_A90E		;a904
	sub 002h		;a906
	ld (iy+002h),a		;a908
	jp rota_fondo_baja		;a90b
L_A90E:
	ld a,(iy+000h)		;a90e
	cp 047h			;a911
	jr z,remate_de_fase		;a913
	ld (iy+002h),020h	;a915
	inc (iy+000h)		;a919
	jp rota_fondo_baja		;a91c
remate_de_fase:		; La puerta del remate: con el scroll en la fila 0x47, los seis objetivos muertos (0xBC33) y el jugador entre 0x50 y 0x5F, salta a rehace_pantalla
	ld a,(0bc33h)		;a91f
	and a			;a922
	ret nz			;a923
	ld a,(0a6ebh)		;a924
	cp 050h			;a927
	ret c			;a929
	cp 060h			;a92a
	ret nc			;a92c
	jp rehace_pantalla		;a92d
borra_globales_sonido:		; Pone a cero los catorce bytes de variables globales del interprete de sonido, 0xD0F2-0xD0FF, que es 0xD068 + 3*46: justo detras del tercer estado de canal
	ld hl,0d0f2h		;a930
	ld de,0d0f3h		;a933
	ld bc,0000dh		;a936
	ld (hl),000h		;a939
	ldir			;a93b
	ret			;a93d
redibuja_fondo:		; Pinta la pantalla desde el mapa: origen = 0x87F3 + celda*128 (+4*(32-fino) en la tira parcial de arriba), 6 columnas x 5-6 tiras. El jp de 0xA98E se parchea con TRES opcodes: 0xC2 pinta solo las celdas vacias (tile 0), 0xCA solo las solidas y 0xDA todas
	ld iy,0ad2ah		;a93e
	ld (iy+003h),000h	;a942
	call base_mapa		;a946
	ld de,04000h		;a949
L_A94C:
	ld a,(iy+002h)		;a94c
	cp 020h			;a94f
	jr z,L_A977		;a951
	ld a,(iy+003h)		;a953
	and a			;a956
	jr z,L_A964		;a957
	cp 005h			;a959
	ld a,020h		;a95b
	jr nz,L_A977		;a95d
	sub (iy+002h)		;a95f
	jr L_A977		;a962
L_A964:
	ld a,020h		;a964
	sub (iy+002h)		;a966
	add a,a			;a969
	add a,a			;a96a
	ld (iy+005h),a		;a96b
	ld a,(iy+002h)		;a96e
	ld (iy+004h),a		;a971
	jp L_A97E		;a974
L_A977:
	ld (iy+004h),a		;a977
	ld (iy+005h),000h	;a97a
L_A97E:
	ld a,006h		;a97e
L_A980:
	ex af,af'		;a980
	ld (0b13eh),de		;a981
	ld a,(ix+000h)		;a985
	inc ix			;a988
	and a			;a98a
	ld b,(iy+004h)		;a98b
	jp z,L_A9E4		;a98e   ; El opcode parcheado: 0xC2 solo las celdas vacias, 0xCA solo las solidas, y 0xDA -jp c, con el carry recien limpiado por el `and a` de arriba- no salta NUNCA, o sea las pinta todas
	ld d,a			;a991
	xor a			;a992
	ld e,a			;a993
	rr d			;a994
	rr e			;a996
	ld hl,087f3h		;a998
	add hl,de		;a99b
	ld e,(iy+005h)		;a99c
	ld d,a			;a99f
	add hl,de		;a9a0
	ld de,(0b13eh)		;a9a1
	ld a,d			;a9a5
	cp 04fh			;a9a6
	jr nc,L_A9C2		;a9a8
	ld c,0ffh		;a9aa
L_A9AC:
	ldi			;a9ac   ; El blitter de fondo: cuatro ldi por tira de 4 columnas, paso 24; redibuja las tres bandas enteras 10 veces por segundo
	ldi			;a9ae
	ldi			;a9b0
	ldi			;a9b2
	dec b			;a9b4
	jr z,L_A9C2		;a9b5
	ld a,e			;a9b7
	add a,014h		;a9b8
	ld e,a			;a9ba
	jp nc,L_A9AC		;a9bb
	inc d			;a9be
	jp L_A9AC		;a9bf
L_A9C2:
	ex af,af'		;a9c2
	dec a			;a9c3
	jr z,L_A9D1		;a9c4
	ld de,(0b13eh)		;a9c6
	inc de			;a9ca
	inc de			;a9cb
	inc de			;a9cc
	inc de			;a9cd
	jp L_A980		;a9ce
L_A9D1:
	inc (iy+003h)		;a9d1
	ld a,(iy+002h)		;a9d4
	cp 020h			;a9d7
	ld a,005h		;a9d9
	adc a,000h		;a9db
	cp (iy+003h)		;a9dd
	jp nz,L_A94C		;a9e0
	ret			;a9e3
L_A9E4:
	ld de,00018h		;a9e4
	dec b			;a9e7
	ld hl,(0b13eh)		;a9e8
L_A9EB:
	add hl,de		;a9eb
	djnz L_A9EB		;a9ec
	ld e,004h		;a9ee
	add hl,de		;a9f0
	ex de,hl		;a9f1
	jp L_A9C2		;a9f2
base_mapa:		; IX = 0x840B + fila*6: la base del mapa de colision de la fase
	ld ix,0840bh		;a9f5
	ld l,(iy+000h)		;a9f9
	ld h,000h		;a9fc
	ld d,h			;a9fe
	ld e,l			;a9ff
	add hl,hl		;aa00
	add hl,de		;aa01
	add hl,hl		;aa02
	ex de,hl		;aa03
	add ix,de		;aa04
	ret			;aa06
pinta_sprite:		; Estampa el sprite A (64 B en 0x6555 + A*64) en la posicion HL (H = fila + 0x20, L = columna en pixeles), con el desplazamiento fino resuelto parcheando los `jr` de 0xAA4F y 0xAA86
	push hl			;aa07
	ld h,000h		;aa08
	ld l,a			;aa0a
	add hl,hl		;aa0b
	add hl,hl		;aa0c
	add hl,hl		;aa0d
	add hl,hl		;aa0e
	add hl,hl		;aa0f
	add hl,hl		;aa10
	ld de,06555h		;aa11
	add hl,de		;aa14
	ex de,hl		;aa15
	pop hl			;aa16
	ld a,010h		;aa17
	ld (0b13eh),a		;aa19
	ld a,h			;aa1c
	sub 020h		;aa1d
	ld h,a			;aa1f
	ld a,l			;aa20
	and 007h		;aa21
	jr z,L_AA2B		;aa23
	dec a			;aa25
	ld c,a			;aa26
	add a,a			;aa27
	add a,c			;aa28
	add a,007h		;aa29
L_AA2B:
	ld (L_AA4F+1),a		;aa2b
	ld (L_AA86+1),a		;aa2e
	srl l			;aa31
	srl l			;aa33
	srl l			;aa35
	call buffer_dir		;aa37
L_AA3A:
	ld a,h			;aa3a
	cp 04fh			;aa3b
	jr c,L_AA45		;aa3d
	inc de			;aa3f
	inc de			;aa40
	inc hl			;aa41
	inc hl			;aa42
	jr L_AAB1		;aa43
L_AA45:
	ld a,0ffh		;aa45
	push de			;aa47
	push hl			;aa48
	ex de,hl		;aa49
	ld d,(hl)		;aa4a
	inc hl			;aa4b
	ld e,(hl)		;aa4c
	scf			;aa4d
	ex de,hl		;aa4e
L_AA4F:
	jr L_AA4F		;aa4f
atajo_mascara24:		; Desplazamiento de ocho de la mascara: A = H, H = L, L = 0xFF, sin recorrer la tira. Gemela de la de naves
	ld a,h			;aa51
	ld h,l			;aa52
	ld l,0ffh		;aa53
	jp L_AA6D		;aa55
tira_mascara24:		; La tira de la mascara: siete `adc hl,hl / adc a,a` en los que se entra por el peldano n-1 para dar 8-n pasos, rellenando de unos (A=0xFF y `scf` a la entrada)
	adc hl,hl		;aa58
	adc a,a			;aa5a
	adc hl,hl		;aa5b
	adc a,a			;aa5d
	adc hl,hl		;aa5e
	adc a,a			;aa60
	adc hl,hl		;aa61
	adc a,a			;aa63
	adc hl,hl		;aa64
	adc a,a			;aa66
	adc hl,hl		;aa67
	adc a,a			;aa69
	adc hl,hl		;aa6a
	adc a,a			;aa6c
L_AA6D:
	ex de,hl		;aa6d
	pop hl			;aa6e
	and (hl)		;aa6f
	ld (hl),a		;aa70   ; Los sprites de 24 px de ancho, con mascara and/or, precalculando el desplazamiento con las cadenas de adc
	inc hl			;aa71
	ld a,d			;aa72
	and (hl)		;aa73
	ld (hl),a		;aa74
	inc hl			;aa75
	ld a,e			;aa76
	and (hl)		;aa77
	ld (hl),a		;aa78
	pop de			;aa79
	inc de			;aa7a
	inc de			;aa7b
	dec hl			;aa7c
	dec hl			;aa7d
	xor a			;aa7e
	push de			;aa7f
	push hl			;aa80
	ex de,hl		;aa81
	ld d,(hl)		;aa82
	inc hl			;aa83
	ld e,(hl)		;aa84
	ex de,hl		;aa85
L_AA86:
	jr L_AA86		;aa86
atajo_dibujo24:		; Desplazamiento de ocho del dibujo: A = H, H = L, L = 0x00
	ld a,h			;aa88
	ld h,l			;aa89
	ld l,000h		;aa8a
	jp L_AAA4		;aa8c
tira_dibujo24:		; La misma tira para el dibujo: se entra con `xor a`, que pone A a cero y limpia el acarreo, o sea rellenando de ceros
	adc hl,hl		;aa8f
	adc a,a			;aa91
	adc hl,hl		;aa92
	adc a,a			;aa94
	adc hl,hl		;aa95
	adc a,a			;aa97
	adc hl,hl		;aa98
	adc a,a			;aa9a
	adc hl,hl		;aa9b
	adc a,a			;aa9d
	adc hl,hl		;aa9e
	adc a,a			;aaa0
	adc hl,hl		;aaa1
	adc a,a			;aaa3
L_AAA4:
	ex de,hl		;aaa4
	pop hl			;aaa5
	or (hl)			;aaa6
	ld (hl),a		;aaa7
	inc hl			;aaa8
	ld a,d			;aaa9
	or (hl)			;aaaa
	ld (hl),a		;aaab
	inc hl			;aaac
	ld a,e			;aaad
	or (hl)			;aaae
	ld (hl),a		;aaaf
	pop de			;aab0
L_AAB1:
	inc de			;aab1
	inc de			;aab2
	ld bc,00016h		;aab3
	add hl,bc		;aab6
	ld a,h			;aab7
	add a,00fh		;aab8
	cp 067h			;aaba
	jr c,L_AABF		;aabc
	xor a			;aabe
L_AABF:
	sub 00fh		;aabf
	ld h,a			;aac1
	ld a,(0b13eh)		;aac2
	dec a			;aac5
	ret z			;aac6
	ld (0b13eh),a		;aac7
	jp L_AA3A		;aaca
buffer_dir:		; La direccion en el buffer de pantalla: HL = 0x4000 + fila*24 + columna. Identica byte a byte a la del bloque de naves
	push de			;aacd
	ld a,l			;aace
	ld l,h			;aacf
	ld h,000h		;aad0
	ld d,h			;aad2
	ld e,l			;aad3
	add hl,hl		;aad4
	add hl,de		;aad5
	add hl,hl		;aad6
	add hl,hl		;aad7
	add hl,hl		;aad8
	ld e,a			;aad9
	ld d,040h		;aada
	add hl,de		;aadc
	pop de			;aadd
	ret			;aade
pinta_glifo:		; Estampa en el buffer el glifo A de la fuente con el mismo esquema que pinta_sprite, con el desplazamiento fino parcheado
	push hl			;aadf
	ld h,000h		;aae0
	ld l,a			;aae2
	add hl,hl		;aae3
	add hl,hl		;aae4
	add hl,hl		;aae5
	add hl,hl		;aae6
	ld de,0820bh		;aae7
	add hl,de		;aaea
	ex de,hl		;aaeb
	pop hl			;aaec
	ld b,008h		;aaed
	ld a,h			;aaef
	sub 020h		;aaf0
	ld h,a			;aaf2
	ld a,l			;aaf3
	and 007h		;aaf4
	jr z,L_AAFB		;aaf6
	add a,a			;aaf8
	add a,004h		;aaf9
L_AAFB:
	ld (L_AB1A+1),a		;aafb
	ld (L_AB3F+1),a		;aafe
	srl l			;ab01
	srl l			;ab03
	srl l			;ab05
	call buffer_dir		;ab07
L_AB0A:
	ld a,h			;ab0a
	cp 04fh			;ab0b
	jr c,L_AB13		;ab0d
	inc de			;ab0f
	inc de			;ab10
	jr L_AB5E		;ab11
L_AB13:
	push hl			;ab13
	ld a,(de)		;ab14
	ld h,0ffh		;ab15
	ld l,a			;ab17
	inc de			;ab18
	scf			;ab19
L_AB1A:
	jr L_AB1A		;ab1a
atajo_mascara16:		; Desplazamiento de ocho de la mascara de 16 bits: H = L, L = 0xFF. Aqui la ventana es de dos bytes y no hace falta arrastrar A
	ld h,l			;ab1c
	ld l,0ffh		;ab1d
	jp L_AB30		;ab1f
tira_mascara16:		; La tira de 16 bits: siete `adc hl,hl` a secas, con el relleno de unos ya puesto en H
	adc hl,hl		;ab22
	adc hl,hl		;ab24
	adc hl,hl		;ab26
	adc hl,hl		;ab28
	adc hl,hl		;ab2a
	adc hl,hl		;ab2c
	adc hl,hl		;ab2e
L_AB30:
	ld a,h			;ab30
	ld c,l			;ab31
	pop hl			;ab32
	and (hl)		;ab33
	ld (hl),a		;ab34   ; Los sprites de 16 px de ancho, mismo esquema que los de 24
	inc hl			;ab35
	ld a,c			;ab36
	and (hl)		;ab37
	ld (hl),a		;ab38
	push hl			;ab39
	xor a			;ab3a
	ld h,a			;ab3b
	ld a,(de)		;ab3c
	inc de			;ab3d
	ld l,a			;ab3e
L_AB3F:
	jr L_AB3F		;ab3f
atajo_dibujo16:		; Desplazamiento de ocho del dibujo de 16 bits: H = L, L = 0x00
	ld h,l			;ab41
	ld l,000h		;ab42
	jp L_AB55		;ab44
tira_dibujo16:		; La tira de 16 bits del dibujo, siete peldanos, con el relleno de ceros puesto en H
	adc hl,hl		;ab47
	adc hl,hl		;ab49
	adc hl,hl		;ab4b
	adc hl,hl		;ab4d
	adc hl,hl		;ab4f
	adc hl,hl		;ab51
	adc hl,hl		;ab53
L_AB55:
	ld a,l			;ab55
	ld c,h			;ab56
	pop hl			;ab57
	or (hl)			;ab58
	ld (hl),a		;ab59
	dec hl			;ab5a
	ld a,c			;ab5b
	or (hl)			;ab5c
	ld (hl),a		;ab5d
L_AB5E:
	ld a,l			;ab5e
	add a,018h		;ab5f
	ld l,a			;ab61
	jr nc,L_AB6C		;ab62
	inc h			;ab64
	ld a,h			;ab65
	cp 058h			;ab66
	jr nz,L_AB6C		;ab68
	ld h,040h		;ab6a
L_AB6C:
	djnz L_AB0A		;ab6c
	ret			;ab6e
gira_rumbo:		; Acerca el rumbo actual (bits 0-2) al pedido (bits 5-7) un octavo por vez y por el lado corto, y lo aplica en el acto: aqui no hay el contador de espera que si tiene la nave
	ld b,a			;ab6f
	and 007h		;ab70
	ld e,a			;ab72
	ld a,b			;ab73
	rlca			;ab74
	rlca			;ab75
	rlca			;ab76
	and 007h		;ab77
	sub e			;ab79
	and 007h		;ab7a
	jr nz,L_AB80		;ab7c
	ld a,b			;ab7e
	ret			;ab7f
L_AB80:
	cp 005h			;ab80
	ld c,0ffh		;ab82
	jr nc,L_AB88		;ab84
	ld c,001h		;ab86
L_AB88:
	ld a,e			;ab88
	add a,c			;ab89
	and 007h		;ab8a
	ld e,a			;ab8c
	ld a,b			;ab8d
	and 0f8h		;ab8e
	or e			;ab90
	ret			;ab91
rumbo_a_mascara:		; Traduce el rumbo A a su mascara de movimiento por la tabla de 0xAD0F
	ld de,0ad0fh		;ab92
	jp L_AB9B		;ab95
rumbo_a_mascara2:		; Lo mismo por la tabla de 0xAD17, la otra de las dos que hay
	ld de,0ad17h		;ab98
L_AB9B:
	push hl			;ab9b
	ld l,a			;ab9c
	ld h,000h		;ab9d
	add hl,de		;ab9f
	ld a,(hl)		;aba0
	pop hl			;aba1
	ret			;aba2
aplica_rumbo:		; Aplica la mascara de rumbo: bits 0/1 mueven la vertical, 2/3 la horizontal; sin recorte
	push hl			;aba3
	call rumbo_a_mascara		;aba4
	ld de,00000h		;aba7
	pop hl			;abaa
	rrca			;abab
	jr nc,L_ABAF		;abac
	ld d,b			;abae
L_ABAF:
	rrca			;abaf
	jr nc,L_ABB8		;abb0
	push af			;abb2
	ld a,b			;abb3
	neg			;abb4
	ld d,a			;abb6
	pop af			;abb7
L_ABB8:
	rrca			;abb8
	jr nc,L_ABBC		;abb9
	ld e,c			;abbb
L_ABBC:
	rrca			;abbc
	jr nc,L_ABC3		;abbd
	ld a,c			;abbf
	neg			;abc0
	ld e,a			;abc2
L_ABC3:
	ld a,h			;abc3
	add a,d			;abc4
	ld h,a			;abc5
	ld a,l			;abc6
	add a,e			;abc7
	ld l,a			;abc8
	ret			;abc9
rumbo_al_jugador:		; La direccion dominante hacia DE (el jugador), como mascara de bits de rumbo
	ld a,b			;abca
	sub d			;abcb
	jr c,L_ABD3		;abcc
	ld h,002h		;abce
	jp L_ABD7		;abd0
L_ABD3:
	ld h,001h		;abd3
	neg			;abd5
L_ABD7:
	ld d,a			;abd7
	ld a,c			;abd8
	sub e			;abd9
	jr c,L_ABE1		;abda
	ld l,008h		;abdc
	jp L_ABE5		;abde
L_ABE1:
	ld l,004h		;abe1
	neg			;abe3
L_ABE5:
	ld e,a			;abe5
	ld b,a			;abe6
	srl b			;abe7
	add a,a			;abe9
	jr c,L_ABF4		;abea
	add a,b			;abec
	jr c,L_ABF4		;abed
	cp d			;abef
	ld c,000h		;abf0
	jr c,L_ABF5		;abf2
L_ABF4:
	ld c,l			;abf4
L_ABF5:
	ld a,d			;abf5
	ld b,a			;abf6
	srl b			;abf7
	add a,a			;abf9
	jr c,L_AC02		;abfa
	add a,b			;abfc
	jr c,L_AC02		;abfd
	cp e			;abff
	ld a,c			;ac00
	ret c			;ac01
L_AC02:
	ld a,c			;ac02
	or h			;ac03
	ld c,a			;ac04
	ret			;ac05
azar:		; El generador de azar: lee tres bytes de la ROM del BIOS (ventana 0x2000-0x3FFF, puntero en 0xAD28) y los mezcla
	push hl			;ac06
	ld hl,(0ad28h)		;ac07
	ld a,h			;ac0a
	and 01fh		;ac0b
	or 020h			;ac0d
	ld h,a			;ac0f
	ld a,000h		;ac10
	xor (hl)		;ac12
	inc hl			;ac13
	xor (hl)		;ac14
	inc hl			;ac15
	xor (hl)		;ac16
	inc hl			;ac17
	add a,h			;ac18
	sub l			;ac19
	ld (0ad28h),hl		;ac1a
	pop hl			;ac1d
	ret			;ac1e
borra_buffer:		; Borra los 3840 bytes del buffer con la PILA: SP al final (0x4F00) y 80 vueltas de 24 `push de`, que son 3840 bytes justos
	ld hl,00000h		;ac1f
	add hl,sp		;ac22
	di			;ac23
	ld sp,04f00h		;ac24
	ld b,050h		;ac27
	ld de,00000h		;ac29
L_AC2C:
	push de			;ac2c
	push de			;ac2d
	push de			;ac2e
	push de			;ac2f
	push de			;ac30
	push de			;ac31
	push de			;ac32
	push de			;ac33
	push de			;ac34
	push de			;ac35
	push de			;ac36
	push de			;ac37
	push de			;ac38
	push de			;ac39
	push de			;ac3a
	push de			;ac3b
	push de			;ac3c
	push de			;ac3d
	push de			;ac3e
	push de			;ac3f
	push de			;ac40
	push de			;ac41
	push de			;ac42
	push de			;ac43
	djnz L_AC2C		;ac44
	ld sp,hl		;ac46
	ei			;ac47
	ret			;ac48
alta_enemigo:		; Mete un enemigo andante en la tabla de 0xACE4 (contador 0xACE3, tope 4, entradas de 5 B) con el rumbo sacado del azar, y suena 0xCE35 en el canal 0
	ld hl,0ace3h		;ac49
	ld a,(hl)		;ac4c
	cp 004h			;ac4d
	ret nc			;ac4f
	inc (hl)		;ac50
	ld h,000h		;ac51
	ld l,a			;ac53
	ld d,h			;ac54
	ld e,l			;ac55
	add hl,hl		;ac56
	add hl,hl		;ac57
	add hl,de		;ac58
	ld de,0ace4h		;ac59
	add hl,de		;ac5c
	ld (hl),c		;ac5d
	inc hl			;ac5e
	ld (hl),b		;ac5f
	inc hl			;ac60
	call azar		;ac61
	and 020h		;ac64
	or 014h			;ac66
	ld (hl),a		;ac68
	inc hl			;ac69
	ld (hl),000h		;ac6a
	inc hl			;ac6c
	ex af,af'		;ac6d
	ld (hl),a		;ac6e
	xor a			;ac6f
	ld de,0ce35h		;ac70
	call arranca_guion_libre		;ac73
	scf			;ac76
	ret			;ac77
lanza_tiro_torreta:		; Mete un tiro de torreta en la tabla 0xAD04 si hay hueco (max 2), con su sonido
	ld hl,0ad03h		;ac78
	ld a,(hl)		;ac7b
	cp 002h			;ac7c
	ret nc			;ac7e
	inc (hl)		;ac7f
	ld h,000h		;ac80
	ld l,a			;ac82
	ld d,h			;ac83
	ld e,l			;ac84
	add hl,hl		;ac85
	add hl,hl		;ac86
	add hl,de		;ac87
	ld de,0ad04h		;ac88
	add hl,de		;ac8b
	ld (hl),005h		;ac8c
	inc hl			;ac8e
	ex af,af'		;ac8f
	ld (hl),a		;ac90
	inc hl			;ac91
	ld (hl),c		;ac92
	inc hl			;ac93
	ld (hl),b		;ac94
	inc hl			;ac95
	ld (hl),000h		;ac96
	ld a,001h		;ac98
	ld de,0cd91h		;ac9a
	call arranca_guion_libre		;ac9d
	scf			;aca0
	ret			;aca1

; ----------------------------------------------------------------------
; DATOS variables: del juego (143 B): 0xACE3 contador y 0xACE4-0xACF7 la tabla de enemigos ANDANTES (4 entradas de 5 B: X, Y, rumbo/flags, animacion, extra — los "contadores de cuadro" 0xACE7/0xACEC/0xACF6 son el campo +3 de los objetos 0/1/3, y 0xACE9, que "solo cambiaba al andar", es la X del objeto 1); 0xACF8 contador y 0xACF9 la tabla de los VOLADORES (5 B); 0xAD03 tiros de torreta vivos, 0xAD04-0xAD0D los dos tiros (5 B cada uno), 0xAD27 contador de cuadros global (parpadeo del DEMO y ritmo de la cuenta atras), 0xAD28/29 semilla del azar, 0xAD2A/0xAD2C la camara (fila del mapa + scroll fino; 0xAD2B no lo toca nadie), 0xAD2D-0xAD2F trabajo del redibujado
;   0xaca2..0xad31  (143 bytes)
; ----------------------------------------------------------------------
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; aca2  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; acb2  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; acc2  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h	; acd2  ................
	defb 000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; ace2  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; acf2  ................
	defb 0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,002h,006h,004h	; ad02  ................
	defb 005h,001h,009h,008h,00ah,0ffh,004h,000h,0ffh,002h,003h,001h,002h,006h,005h,007h	; ad12  ................
	defb 006h,0ffh,004h,000h,0ffh,000h,000h,000h,00eh,000h,020h,000h,000h,000h,000h	; ad22  .......... ....

; ======================================================================
; CODIGO 0xad31..0xb13e  (1037 bytes)
; ======================================================================


persigue_con_inercia:		; Guia un tiro de torreta: una de cada dos veces empuja la velocidad BC un paso hacia el blanco con tope mas menos cinco, y siempre la suma a la posicion; si la columna se sale repone la X guardada y rebota negando C. Es vaga_o_persigue con velocidades en pixeles y otros topes
	ld (0b13eh),hl		;ad31
	call azar		;ad34
	and 001h		;ad37
	jr z,L_AD67		;ad39
	ld a,h			;ad3b
	cp d			;ad3c
	ld a,b			;ad3d
	jr nc,L_AD48		;ad3e
	add a,005h		;ad40
	cp 00ah			;ad42
	adc a,000h		;ad44
	jr L_AD4E		;ad46
L_AD48:
	add a,005h		;ad48
	cp 001h			;ad4a
	adc a,0ffh		;ad4c
L_AD4E:
	sub 005h		;ad4e
	ld b,a			;ad50
	ld a,l			;ad51
	cp e			;ad52
	ld a,c			;ad53
	jr nc,L_AD5E		;ad54
	add a,005h		;ad56
	cp 00ah			;ad58
	adc a,000h		;ad5a
	jr L_AD64		;ad5c
L_AD5E:
	add a,005h		;ad5e
	cp 001h			;ad60
	adc a,0ffh		;ad62
L_AD64:
	sub 005h		;ad64
	ld c,a			;ad66
L_AD67:
	add hl,bc		;ad67
	ld a,l			;ad68
	cp 0b8h			;ad69
	jr c,L_AD75		;ad6b
	ld a,(0b13eh)		;ad6d
	ld l,a			;ad70
	ld a,c			;ad71
	neg			;ad72
	ld c,a			;ad74
L_AD75:
	ret			;ad75
mueve_disparos:		; Pasa las DOS tablas de disparos por el mismo motor parcheando antes el paso en el `ld bc` de 0xADC4: los tiros enemigos a 4 pixeles por cuadro y los del jugador a 10. El 0x0707 que trae el binario no lo usa nadie
	ld ix,ladc4h		;ad76
	ld (ix+001h),004h	;ad7a
	ld (ix+002h),004h	;ad7e
	ld ix,0aca3h		;ad82
	ld hl,0acbbh		;ad86
	ld a,005h		;ad89
	call mueve_tabla_disparos		;ad8b
	ld ix,ladc4h		;ad8e
	ld (ix+001h),00ah	;ad92
	ld (ix+002h),00ah	;ad96
	ld ix,0acbch		;ad9a
	ld hl,0ace0h		;ad9e
	ld a,004h		;ada1
mueve_tabla_disparos:		; El motor comun de las dos tablas: suma el scroll del cuadro a la fila, mueve con el paso parcheado, pinta el glifo y da de baja al que traiga 0x80 en el rumbo o se salga (fila 0xC0, columna 0xBC), compactando con un `ldir`
	ld (0ace0h),hl		;ada3
	ld (0ace2h),a		;ada6
	ld a,(ix-001h)		;ada9
	and a			;adac
	ret z			;adad
	ld b,a			;adae
L_ADAF:
	push bc			;adaf
	ld a,(0c462h)		;adb0
	add a,(ix+001h)		;adb3
	ld (ix+001h),a		;adb6
	ld l,(ix+000h)		;adb9
	ld h,a			;adbc
	ld a,(ix+002h)		;adbd
	cp 080h			;adc0
	jr z,L_ADE8		;adc2
L_ADC4:
	ld bc,00707h		;adc4
	call aplica_rumbo		;adc7
	ld a,h			;adca
	cp 0c0h			;adcb
	jr nc,L_ADE8		;adcd
	ld a,l			;adcf
	cp 0bch			;add0
	jr nc,L_ADE8		;add2
	ld (ix+000h),l		;add4
	ld (ix+001h),h		;add7
	ld a,002h		;adda
	call pinta_glifo		;addc
	ld de,00004h		;addf
	add ix,de		;ade2
L_ADE4:
	pop bc			;ade4
	djnz L_ADAF		;ade5
	ret			;ade7
L_ADE8:
	ld a,(0ace2h)		;ade8
	cp 005h			;adeb
	ld hl,0aca2h		;aded
	jr z,L_ADF5		;adf0
	ld hl,0acbbh		;adf2
L_ADF5:
	dec (hl)		;adf5
	pop bc			;adf6
	push bc			;adf7
	ld a,b			;adf8
	cp 001h			;adf9
	jp z,L_ADE4		;adfb
	push ix			;adfe
	pop de			;ae00
	push de			;ae01
	inc de			;ae02
	inc de			;ae03
	inc de			;ae04
	inc de			;ae05
	ld hl,(0ace0h)		;ae06
	and a			;ae09
	sbc hl,de		;ae0a
	ld b,h			;ae0c
	ld c,l			;ae0d
	ex de,hl		;ae0e
	pop de			;ae0f
	ldir			;ae10
	jp L_ADE4		;ae12
alta_tiro_enemigo:		; Mete un tiro enemigo en la tabla de 0xACA3 (contador 0xACA2, tope 6) con el guion 0xCD5F en el canal 1. Es la COLA de alta_enemigo de la fase de naves -7 de 11 bytes iguales desde 0xCC98- SIN la tirada de dificultad por zona que aquella lleva delante, que aqui no tendria de donde sacar la zona
	ld hl,0aca2h		;ae15
	ld e,006h		;ae18
	exx			;ae1a
	ld h,001h		;ae1b
	ld de,0cd5fh		;ae1d
	jp alta_en_tabla		;ae20
alta_objeto_acbb:		; Mete un objeto en la tabla de 0xACBB (tope 9) con el sonido 0xCD53 al canal 2: los mismos tope y canal que su gemela de la fase de naves
	ld hl,0acbbh		;ae23
	ld e,009h		;ae26
	exx			;ae28
	ld h,002h		;ae29
	ld de,0cd53h		;ae2b
alta_en_tabla:		; El alta comun a las tablas: si el contador no ha llegado al tope, lo incrementa, arranca el sonido DE en el canal H y escribe C, B y A' en la entrada indice*4. Vuelve con carry si ha entrado
	exx			;ae2e
	ld a,(hl)		;ae2f
	cp e			;ae30
	ret nc			;ae31
	exx			;ae32
	push af			;ae33
	ld a,h			;ae34
	call arranca_guion_libre		;ae35
	pop af			;ae38
	exx			;ae39
	inc (hl)		;ae3a
	ld e,l			;ae3b
	ld d,h			;ae3c
	inc de			;ae3d
	ld h,000h		;ae3e
	ld l,a			;ae40
	add hl,hl		;ae41
	add hl,hl		;ae42
	add hl,de		;ae43
	ld (hl),c		;ae44
	inc hl			;ae45
	ld (hl),b		;ae46
	inc hl			;ae47
	ex af,af'		;ae48
	ld (hl),a		;ae49
	scf			;ae4a
	ret			;ae4b
vaga_o_persigue:		; Tres de cada cuatro veces deja al enemigo yendo recto y la cuarta -cuando el azar and 3 da cero- empuja su velocidad un paso hacia el jugador, un eje cada vez. (Aqui puso "la suma modular de ocho direcciones" y no lo es: `add a,004h / cp 008h / adc a,000h / sub 004h` sube uno SATURANDO en +4, y su pareja `cp 001h / adc a,0ffh` baja uno saturando en -4. Y B y C no son rumbos, son velocidades en pixeles)
	ld (0b13eh),hl		;ae4c
	call azar		;ae4f
	and 003h		;ae52
	jr z,L_AE5A		;ae54
	add hl,bc		;ae56
	jp L_AE87		;ae57
L_AE5A:
	ld a,h			;ae5a
	cp d			;ae5b
	ld a,b			;ae5c
	jr nc,L_AE67		;ae5d
	add a,004h		;ae5f
	cp 008h			;ae61
	adc a,000h		;ae63
	jr L_AE6D		;ae65
L_AE67:
	add a,004h		;ae67
	cp 001h			;ae69
	adc a,0ffh		;ae6b
L_AE6D:
	sub 004h		;ae6d
	ld b,a			;ae6f
	ld a,l			;ae70
	cp e			;ae71
	ld a,c			;ae72
	jr nc,L_AE7D		;ae73
	add a,004h		;ae75
	cp 008h			;ae77
	adc a,000h		;ae79
	jr L_AE83		;ae7b
L_AE7D:
	add a,004h		;ae7d
	cp 001h			;ae7f
	adc a,0ffh		;ae81
L_AE83:
	sub 004h		;ae83
	ld c,a			;ae85
	add hl,bc		;ae86
L_AE87:
	ld a,l			;ae87
	cp 0b0h			;ae88
	jr c,L_AE94		;ae8a
	ld a,c			;ae8c
	neg			;ae8d
	ld c,a			;ae8f
	ld hl,(0b13eh)		;ae90
	add hl,bc		;ae93
L_AE94:
	ret			;ae94
alta_volador:		; Da de alta un volador en la tabla de 0xACF9 (contador 0xACF8, tope 2, entradas de 5 B): velocidad horizontal 0, la vertical la que traiga A' (+4 si nace arriba, -4 si nace abajo), la fase del aleteo al azar en los dos bits altos, y el estado a cero
	ld hl,0acf8h		;ae95
	ld a,(hl)		;ae98
	cp 002h			;ae99
	ret nc			;ae9b
	inc (hl)		;ae9c
	ld h,000h		;ae9d
	ld l,a			;ae9f
	ld d,h			;aea0
	ld e,l			;aea1
	add hl,hl		;aea2
	add hl,hl		;aea3
	add hl,de		;aea4
	ld de,0acf9h		;aea5
	add hl,de		;aea8
	ld (hl),000h		;aea9
	inc hl			;aeab
	ex af,af'		;aeac
	add a,004h		;aead
	ld e,a			;aeaf
	call azar		;aeb0
	and 0c0h		;aeb3
	or e			;aeb5
	sub 004h		;aeb6
	ld (hl),a		;aeb8
	inc hl			;aeb9
	ld (hl),c		;aeba
	inc hl			;aebb
	ld (hl),b		;aebc
	inc hl			;aebd
	ld (hl),000h		;aebe
	scf			;aec0
	ret			;aec1
solapa_eje:		; Solapamiento en UN eje: BC corrige las dos coordenadas (H y L), D y E son los dos tamanos, y vuelve con carry si NO se tocan. Identica byte a byte a la del bloque de naves
	add hl,bc		;aec2
	ld a,l			;aec3
	cp h			;aec4
	jr nc,L_AECA		;aec5
	add a,e			;aec7
	cp h			;aec8
	ret			;aec9
L_AECA:
	ld a,h			;aeca
	add a,d			;aecb
	cp l			;aecc
	ret			;aecd
voladores_activos:		; La segunda mitad de la vida de los voladores, la de estado 0x2E o mas: de 0x2E a 0x32 suben 3 px por cuadro, 0x33 es la forma que persigue al jugador y dispara una de cada 64 veces, y de 0x34 a 0x37 la explosion. Se reparte la tabla con mueve_voladores, que se queda con los de estado menor: los dos cortes son complementarios
	ld ix,0acf9h		;aece
	ld a,(0acf8h)		;aed2
	and a			;aed5
	ret z			;aed6
	ld b,a			;aed7
L_AED8:
	push bc			;aed8
	ld a,(0c462h)		;aed9
	add a,(ix+003h)		;aedc
	ld (ix+003h),a		;aedf
	ld c,(ix+000h)		;aee2
	ld b,(ix+001h)		;aee5
	ld l,(ix+002h)		;aee8
	ld h,a			;aeeb
	ld a,(ix+004h)		;aeec
	cp 034h			;aeef
	jr c,L_AF09		;aef1
	add a,028h		;aef3
	call pinta_sprite		;aef5
	inc (ix+004h)		;aef8
	ld a,(ix+004h)		;aefb
	cp 038h			;aefe
	jp c,L_AF9C		;af00
	ld de,lafa1h		;af03
	jp L_AFA7		;af06
L_AF09:
	ld de,(0a6ebh)		;af09
	cp 02eh			;af0d
	jp c,L_AF9C		;af0f
	cp 033h			;af12
	jr nc,L_AF21		;af14
	dec h			;af16
	dec h			;af17
	dec h			;af18
	ld (ix+003h),h		;af19
	inc (ix+004h)		;af1c
	jr L_AF69		;af1f
L_AF21:
	ld a,b			;af21
	add a,004h		;af22
	and 03fh		;af24
	sub 004h		;af26
	ld b,a			;af28
	call vaga_o_persigue		;af29
	ld a,h			;af2c
	cp 0e0h			;af2d
	ld de,lafa1h		;af2f
	jr nc,L_AFA7		;af32
	ld (ix+000h),c		;af34
	ld a,b			;af37
	add a,004h		;af38
	ld c,a			;af3a
	ld a,(ix+001h)		;af3b
	add a,004h		;af3e
	and 0c0h		;af40
	or c			;af42
	sub 004h		;af43
	ld (ix+001h),a		;af45
	ld (ix+002h),l		;af48
	ld (ix+003h),h		;af4b
	call azar		;af4e
	and 03fh		;af51
	jr nz,L_AF69		;af53
	push hl			;af55
	ld bc,00404h		;af56
	add hl,bc		;af59
	ld b,h			;af5a
	ld c,l			;af5b
	push bc			;af5c
	call rumbo_al_jugador		;af5d
	call rumbo_a_mascara2		;af60
	ex af,af'		;af63
	pop bc			;af64
	call alta_tiro_enemigo		;af65
	pop hl			;af68
L_AF69:
	ld a,(ix+001h)		;af69
	add a,004h		;af6c
	push af			;af6e
	and 0c0h		;af6f
	rlca			;af71
	rlca			;af72
	add a,048h		;af73
	call pinta_sprite		;af75
	pop af			;af78
	xor 040h		;af79
	sub 004h		;af7b
	ld (ix+001h),a		;af7d
	call disparo_derriba_volador		;af80
	ld a,(0a6edh)		;af83
	cp 004h			;af86
	jr nc,L_AF9C		;af88
	ld l,(ix+002h)		;af8a
	ld h,(ix+003h)		;af8d
	call choca_con_jugador		;af90
	jr c,L_AF9C		;af93
	ld (ix+004h),034h	;af95
	call mata_jugador_impacto		;af99
L_AF9C:
	ld de,00005h		;af9c
	add ix,de		;af9f
L_AFA1:
	pop bc			;afa1
	dec b			;afa2
	jp nz,L_AED8		;afa3
	ret			;afa6
L_AFA7:
	ld hl,0acf8h		;afa7
	dec (hl)		;afaa
	pop bc			;afab
	push bc			;afac
	push de			;afad
	ld a,b			;afae
	dec a			;afaf
	ret z			;afb0
	push ix			;afb1
	pop de			;afb3
	push de			;afb4
	inc de			;afb5
	inc de			;afb6
	inc de			;afb7
	inc de			;afb8
	inc de			;afb9
	ld hl,0ad03h		;afba
	and a			;afbd
	sbc hl,de		;afbe
	ld b,h			;afc0
	ld c,l			;afc1
	ex de,hl		;afc2
	pop de			;afc3
	ldir			;afc4
	ret			;afc6
disparo_derriba_andante:		; Mira si un disparo del jugador ha tocado al enemigo andante de IX: lo pasa a explosion (0xFF/0x1D), marca el disparo con 0x80, suena 0xCD6D y paga 440 puntos
	ld l,(ix+000h)		;afc7
	ld h,(ix+001h)		;afca
	ld iy,0acbch		;afcd
	ld de,0060eh		;afd1
	ld bc,00101h		;afd4
	call choca_con_tabla		;afd7
	ret c			;afda
	xor a			;afdb
	ld de,0cd6dh		;afdc
	call arranca_guion		;afdf
	ld (ix+002h),0ffh	;afe2
	ld (ix+003h),01dh	;afe6
	ld (iy+002h),080h	;afea
	ld hl,0b883h		;afee
	ld b,02ch		;aff1
	call premia		;aff3
	ret			;aff6
choca_con_tabla:		; Busca contacto entre HL y toda una tabla de objetos: IY apunta a la primera entrada y (iy-1) es el contador, entradas de 4 B, dos solapa_eje por objeto
	exx			;aff7
	ld a,(iy-001h)		;aff8
	and a			;affb
	scf			;affc
	ret z			;affd
	ld b,a			;affe
L_AFFF:
	exx			;afff
	push hl			;b000
	ld h,(iy+000h)		;b001
	call solapa_eje		;b004
	pop hl			;b007
	jr c,L_B014		;b008
	push hl			;b00a
	ld l,h			;b00b
	ld h,(iy+001h)		;b00c
	call solapa_eje		;b00f
	pop hl			;b012
	ret nc			;b013
L_B014:
	exx			;b014
	ld de,00004h		;b015
	add iy,de		;b018
	djnz L_AFFF		;b01a
	exx			;b01c
	scf			;b01d
	ret			;b01e
disparo_derriba_volador:		; Lo mismo para los voladores de la tabla de 0xACF9, con la posicion en (ix+002/003): en vez de sembrar la explosion escribe 0x34 en (ix+004h), y paga 410
	ld l,(ix+002h)		;b01f
	ld h,(ix+003h)		;b022
	ld iy,0acbch		;b025
	ld de,0060eh		;b029
	ld bc,00101h		;b02c
	call choca_con_tabla		;b02f
	ret c			;b032
	xor a			;b033
	ld de,0cd6dh		;b034
	call arranca_guion		;b037
	ld (ix+004h),034h	;b03a
	ld (iy+002h),080h	;b03e
	ld hl,0b883h		;b042
	ld b,029h		;b045
	call premia		;b047
	ret			;b04a
tiro_alcanza_jugador:		; El contacto al reves: el jugador (0xA6EB) contra la tabla de tiros enemigos (0xACA3), y al chocar marca al culpable y se va por impacto_simple
	ld hl,(0a6ebh)		;b04b
	ld iy,0aca3h		;b04e
	ld de,0040ah		;b052
	ld bc,00203h		;b055
	call choca_con_tabla		;b058
	ret c			;b05b
	ld (iy+002h),080h	;b05c
	call impacto_simple		;b060
	ret			;b063
disparo_derriba_tiro:		; Lo mismo contra un tiro de torreta: 0x7C en (ix+000h) y 53 puntos. Gemela de la de naves, con las mismas cajas y el mismo premio
	ld l,(ix+002h)		;b064
	ld h,(ix+003h)		;b067
	ld iy,0acbch		;b06a
	ld de,00408h		;b06e
	ld bc,00200h		;b071
	call choca_con_tabla		;b074
	ret c			;b077
	ld (ix+000h),07ch	;b078
	ld (iy+002h),080h	;b07c
	ld hl,0b884h		;b080
	ld b,035h		;b083
	call premia		;b085
	ret			;b088
choca_con_jugador:		; Contacto con el jugador (0xA6EB/0xA6EC): solapa_eje con 2x3 contra 0x0C x 0x0A, las mismas medidas que la caja pequena de la nave
	push hl			;b089
	ld a,(0a6ech)		;b08a
	ld l,a			;b08d
	ld bc,00203h		;b08e
	ld de,00c0ah		;b091
	call solapa_eje		;b094
	pop hl			;b097
	ret c			;b098
	ld h,l			;b099
	ld a,(0a6ebh)		;b09a
	ld l,a			;b09d
	jp solapa_eje		;b09e
poda_rumbo_jugador:		; Quita del rumbo pedido las direcciones que el borde no permite. Es la de naves TRUNCADA: solo los dos topes horizontales, porque aqui no se vuela
	ld hl,(0a6ebh)		;b0a1
	ex af,af'		;b0a4
	ld a,l			;b0a5
	and a			;b0a6
	jr nz,L_B0AD		;b0a7
	ex af,af'		;b0a9
	and 0f7h		;b0aa
	ex af,af'		;b0ac
L_B0AD:
	cp 0b0h			;b0ad
	jr nz,L_B0B5		;b0af
	ex af,af'		;b0b1
	and 0fbh		;b0b2
	ret			;b0b4
L_B0B5:
	ex af,af'		;b0b5
	ret			;b0b6
recorta_x_jugador:		; Deshace el paso lateral del jugador si se ha salido: con L >= 0xB1 repone la X desde 0xA6EB. Es la primera mitad de recorta_a_area; la banda vertical 0x38..0xB1 que si vigila la nave aqui no existe
	ld a,l			;b0b7
	cp 0b1h			;b0b8
	ret c			;b0ba
	ld a,(0a6ebh)		;b0bb
	ld l,a			;b0be
	ret			;b0bf
borde_pantalla:		; Poda el rumbo en los bordes laterales: X<3 quita el bit de izquierda, X>=174 el de derecha
	ex af,af'		;b0c0
	ld a,(ix+000h)		;b0c1
	add a,010h		;b0c4
	cp 013h			;b0c6
	jr nc,L_B0CE		;b0c8
	ex af,af'		;b0ca
	and 0f7h		;b0cb
	ret			;b0cd
L_B0CE:
	cp 0beh			;b0ce
	jr c,L_B0D6		;b0d0
	ex af,af'		;b0d2
	and 0fbh		;b0d3
	ret			;b0d5
L_B0D6:
	ex af,af'		;b0d6
	ret			;b0d7
recorta_x_objeto:		; Lo mismo para el objeto de IX, reponiendo L desde (ix+000h). Identica byte a byte a la de la fase de naves
	ld a,l			;b0d8
	cp 0b1h			;b0d9
	ret c			;b0db
	ld l,(ix+000h)		;b0dc
	ret			;b0df
impacto_simple:		; Gasta un punto del escudo de 0xA6ED y, si ya estaba a cero, manda a mata_jugador_impacto. Gemela de la de naves cambiando solo la direccion del escudo
	ld a,(0a6edh)		;b0e0
	and a			;b0e3
	jr z,mata_jugador_impacto		;b0e4
	dec a			;b0e6
	ld (0a6edh),a		;b0e7
	jr L_B0F9		;b0ea
impacto_doble:		; Gasta dos puntos de 0xA6ED, comprobando entre uno y otro si el primero ya bastaba para matar. La usan los tiros de las torretas
	ld a,(0a6edh)		;b0ec
	and a			;b0ef
	jr z,mata_jugador_impacto		;b0f0
	dec a			;b0f2
	jr z,mata_jugador_impacto		;b0f3
	dec a			;b0f5
	ld (0a6edh),a		;b0f6
L_B0F9:
	ld hl,02f50h		;b0f9
	xor 003h		;b0fc
	ld c,011h		;b0fe
	push af			;b100
	call pinta_celda_color		;b101
	pop af			;b104
	dec a			;b105
	ret z			;b106
	ld hl,02f48h		;b107
	ld c,011h		;b10a
	push af			;b10c
	call pinta_celda_color		;b10d
	pop af			;b110
	dec a			;b111
	ret z			;b112
	ld hl,02f40h		;b113
	ld c,011h		;b116
	jp pinta_celda_color		;b118
mata_jugador_impacto:		; Escudo agotado: 0xA6ED=4, sonido, y el update del jugador (operando 0xA57E) parcheado al cadaver de 0xB268
	ld hl,02778h		;b11b
	call pinta_marca_hud		;b11e
	ld a,004h		;b121
	ld (0a6edh),a		;b123
	ld a,05bh		;b126
	ld (0ad0eh),a		;b128
	xor a			;b12b
	ld de,0cd6dh		;b12c
	call arranca_guion		;b12f
	ld hl,0b268h		;b132
	ld (0a57eh),hl		;b135
	ld hl,02f48h		;b138
	jp pinta_marca_hud		;b13b

; ----------------------------------------------------------------------
; DATOS relleno: o resto (2 B; 2 bytes)
;   0xb13e..0xb140  (2 bytes)
; ----------------------------------------------------------------------
	defb 000h,000h	; b13e  ..

; ======================================================================
; CODIGO 0xb140..0xb51b  (987 bytes)
; ======================================================================


rota_fondo_sube:		; Rota el tile 0 una fila de pixel (ldir de 124 B) y deja el delta del cuadro en 0xC462 (+2): la trama del fondo, a mitad de velocidad que el scroll
	push hl			;b140
	ld hl,087f3h		;b141
	ld e,(hl)		;b144
	inc hl			;b145
	ld d,(hl)		;b146
	push de			;b147
	inc hl			;b148
	ld e,(hl)		;b149
	inc hl			;b14a
	ld d,(hl)		;b14b
	push de			;b14c
	inc hl			;b14d
	ld de,087f3h		;b14e
	ld bc,0007ch		;b151
	ldir			;b154
	ex de,hl		;b156
	pop de			;b157
	pop bc			;b158
	ld (hl),c		;b159
	inc hl			;b15a
	ld (hl),b		;b15b
	inc hl			;b15c
	ld (hl),e		;b15d
	inc hl			;b15e
	ld (hl),d		;b15f
	ld hl,0c462h		;b160
	ld (hl),002h		;b163
	pop hl			;b165
	ret			;b166
rota_fondo_baja:		; El simetrico de rota_fondo_sube (lddr; 0xC462 = -2)
	push hl			;b167
	ld hl,08872h		;b168
	ld e,(hl)		;b16b
	dec hl			;b16c
	ld d,(hl)		;b16d
	push de			;b16e
	dec hl			;b16f
	ld e,(hl)		;b170
	dec hl			;b171
	ld d,(hl)		;b172
	push de			;b173
	dec hl			;b174
	ld de,08872h		;b175
	ld bc,0007ch		;b178
	lddr			;b17b
	ex de,hl		;b17d
	pop de			;b17e
	pop bc			;b17f
	ld (hl),c		;b180
	dec hl			;b181
	ld (hl),b		;b182
	dec hl			;b183
	ld (hl),e		;b184
	dec hl			;b185
	ld (hl),d		;b186
	ld hl,0c462h		;b187
	ld (hl),0feh		;b18a
	pop hl			;b18c
	ret			;b18d
consulta_mapa:		; Pasa la posicion a mundo (Y+0x28-fino, X+8) y lee la celda mapa[fila*6 + Y/32*6 + X/32 - 6] (celdas de 32x32): Z = celda 0 = vacio. Devuelve el valor en A pero nadie lo usa: para la fisica el mapa es binario
	ld a,h			;b18e
	ld iy,0ad2ah		;b18f
	add a,028h		;b193
	sub (iy+002h)		;b195
	ld h,a			;b198
	ld a,l			;b199
	add a,008h		;b19a
	ld l,a			;b19c
	push hl			;b19d
	call base_mapa		;b19e
	pop hl			;b1a1
	ld a,h			;b1a2
	rlca			;b1a3
	rlca			;b1a4
	rlca			;b1a5
	rlca			;b1a6
	and 00eh		;b1a7
	ld d,a			;b1a9
	add a,a			;b1aa
	add a,d			;b1ab
	ld d,a			;b1ac
	ld a,l			;b1ad
	rlca			;b1ae
	rlca			;b1af
	rlca			;b1b0
	and 007h		;b1b1
	add a,d			;b1b3
	ld e,a			;b1b4
	ld d,000h		;b1b5
	add ix,de		;b1b7
	ld a,(ix-006h)		;b1b9
	and a			;b1bc
	ret			;b1bd
consulta_mapa_fina:		; consulta_mapa mas el test de sub-celda: con celda vacia, carry solo si la posicion cae en la banda central [8,24) de la celda en X e Y. La usan SOLO los voladores (desde 0xB20F) para elegir hueco donde anidar
	call consulta_mapa		;b1be
	ret nz			;b1c1
	ld a,h			;b1c2
	and 0e0h		;b1c3
	ld d,a			;b1c5
	ld a,l			;b1c6
	and 0e0h		;b1c7
	ld e,a			;b1c9
	sbc hl,de		;b1ca
	ld a,h			;b1cc
	sub 008h		;b1cd
	ccf			;b1cf
	ret nc			;b1d0
	sub 010h		;b1d1
	ret nc			;b1d3
	ld a,l			;b1d4
	sub 008h		;b1d5
	ccf			;b1d7
	ret nc			;b1d8
	sub 010h		;b1d9
	ret			;b1db
mueve_voladores:		; El vuelo de los enemigos voladores (tabla 0xACF9, contador 0xACF8, 5 B por objeto): vuelan hacia el jugador (0x6858) y con consulta_mapa_fina deciden donde anidar
	ld ix,0acf9h		;b1dc
	ld a,(0acf8h)		;b1e0
	and a			;b1e3
	ret z			;b1e4
	ld b,a			;b1e5
L_B1E6:
	push bc			;b1e6
	ld a,(ix+001h)		;b1e7
	add a,004h		;b1ea
	and 03fh		;b1ec
	sub 004h		;b1ee
	ld b,a			;b1f0
	ld a,(ix+004h)		;b1f1
	cp 02eh			;b1f4
	jr nc,L_B25D		;b1f6
	ld c,(ix+000h)		;b1f8
	ld l,(ix+002h)		;b1fb
	ld h,(ix+003h)		;b1fe
	inc (ix+004h)		;b201
	cp 02dh			;b204
	jr c,L_B21D		;b206
	dec (ix+004h)		;b208
	push hl			;b20b
	push bc			;b20c
	push ix			;b20d
	call consulta_mapa_fina		;b20f
	pop ix			;b212
	pop bc			;b214
	pop hl			;b215
	jr nc,L_B21D		;b216
	inc (ix+004h)		;b218
	jr L_B25D		;b21b
L_B21D:
	ld de,06858h		;b21d
	call vaga_o_persigue		;b220
	ld a,h			;b223
	cp 0e0h			;b224
	ld de,lb262h		;b226
	jp nc,L_AFA7		;b229
	ld (ix+000h),c		;b22c
	ld a,b			;b22f
	add a,004h		;b230
	ld c,a			;b232
	ld a,(ix+001h)		;b233
	add a,004h		;b236
	and 0c0h		;b238
	or c			;b23a
	sub 004h		;b23b
	ld (ix+001h),a		;b23d
	ld (ix+002h),l		;b240
	ld (ix+003h),h		;b243
	ld a,(ix+001h)		;b246
	add a,004h		;b249
	push af			;b24b
	and 0c0h		;b24c
	rlca			;b24e
	rlca			;b24f
	add a,048h		;b250
	call pinta_sprite		;b252
	pop af			;b255
	xor 040h		;b256
	sub 004h		;b258
	ld (ix+001h),a		;b25a
L_B25D:
	ld de,00005h		;b25d
	add ix,de		;b260
L_B262:
	pop bc			;b262
	dec b			;b263
	jp nz,L_B1E6		;b264
	ret			;b267
cadaver_parabola:		; El cuerpo tras el impacto: sube y cae acelerando (h += estado-12), sin consultar el mapa; se retira pasado Y=0xC4
	ld hl,(0a6ebh)		;b268
	ld a,(0a6edh)		;b26b
	inc a			;b26e
	ld (0a6edh),a		;b26f
	sub 00ch		;b272
	add a,h			;b274
	push af			;b275
	push hl			;b276
	call nc,pinta_torre		;b277
	pop hl			;b27a
	pop af			;b27b
	push af			;b27c
	cp 0c4h			;b27d
	jp nc,L_B2A4		;b27f
	ld h,a			;b282
	ld (0a6ebh),hl		;b283
	ld a,(0ad0eh)		;b286
	and 007h		;b289
	call pinta_sprite		;b28b
	ld hl,(0a6ebh)		;b28e
	ld h,068h		;b291
	ld a,(0ad0eh)		;b293
	inc a			;b296
	ld (0ad0eh),a		;b297
	cp 060h			;b29a
	call c,pinta_sprite		;b29c
	pop af			;b29f
	call c,pinta_torre		;b2a0
	ret			;b2a3
L_B2A4:
	pop af			;b2a4
	ret			;b2a5
gira_sprite_dcha:		; Gira el sprite un cuarto de vuelta a la derecha sobre el slot de trabajo: cuatro pasadas de predesplaza_sprite, una por cada byte de la fila de cuatro
	ld h,000h		;b2a6
	ld l,a			;b2a8
	add hl,hl		;b2a9
	add hl,hl		;b2aa
	add hl,hl		;b2ab
	add hl,hl		;b2ac
	add hl,hl		;b2ad
	add hl,hl		;b2ae
	ld de,06555h		;b2af
	add hl,de		;b2b2
	ld de,00004h		;b2b3
	ld iy,07d55h		;b2b6
	call predesplaza_sprite		;b2ba
	inc hl			;b2bd
	ld iy,07d75h		;b2be
	call predesplaza_sprite		;b2c2
	inc hl			;b2c5
	ld iy,07d57h		;b2c6
	call predesplaza_sprite		;b2ca
	inc hl			;b2cd
	ld iy,07d77h		;b2ce
predesplaza_sprite:		; El nucleo de los giros: por cada bit que saca del original con `rlca` lo mete con `rr` en OCHO destinos distintos, separados 4 bytes -(iy+001), +005, +009, +00D, +011, +015, +019 y +01D-. Ocho `rlca` repartiendo un bit a cada destino, durante ocho filas, es TRASPONER un bloque de 8x8 bits. (Aqui puso CINCO destinos y que era un pre-desplazado: son ocho, contados en el binario, y no desplaza: traspone)
	push hl			;b2d2
	ld c,002h		;b2d3
L_B2D5:
	ld b,008h		;b2d5
L_B2D7:
	ld a,(hl)		;b2d7
	rlca			;b2d8
	rr (iy+001h)		;b2d9
	rlca			;b2dd
	rr (iy+005h)		;b2de
	rlca			;b2e2
	rr (iy+009h)		;b2e3
	rlca			;b2e7
	rr (iy+00dh)		;b2e8
	rlca			;b2ec
	rr (iy+011h)		;b2ed
	rlca			;b2f1
	rr (iy+015h)		;b2f2
	rlca			;b2f6
	rr (iy+019h)		;b2f7
	rlca			;b2fb
	rr (iy+01dh)		;b2fc
	add hl,de		;b300
	djnz L_B2D7		;b301
	dec iy			;b303
	dec c			;b305
	jr nz,L_B2D5		;b306
	pop hl			;b308
	ret			;b309
gira_sprite_izda:		; La simetrica, girando a la izquierda con predesplaza_sprite_izq y los mismos cuatro destinos en otro orden
	ld h,000h		;b30a
	ld l,a			;b30c
	add hl,hl		;b30d
	add hl,hl		;b30e
	add hl,hl		;b30f
	add hl,hl		;b310
	add hl,hl		;b311
	add hl,hl		;b312
	ld de,06555h		;b313
	add hl,de		;b316
	ld de,00004h		;b317
	ld iy,07d75h		;b31a
	call predesplaza_sprite_izq		;b31e
	inc hl			;b321
	ld iy,07d55h		;b322
	call predesplaza_sprite_izq		;b326
	inc hl			;b329
	ld iy,07d77h		;b32a
	call predesplaza_sprite_izq		;b32e
	inc hl			;b331
	ld iy,07d57h		;b332
predesplaza_sprite_izq:		; La simetrica: mismo bucle, sacando los bits con `rrca` y metiendolos con `rl`, y con los ocho destinos en (iy+000), +004, +008, +00C, +010, +014, +018 y +01C. Traspone en el otro sentido
	push hl			;b336
	ld c,002h		;b337
L_B339:
	ld b,008h		;b339
L_B33B:
	ld a,(hl)		;b33b
	rrca			;b33c
	rl (iy+000h)		;b33d
	rrca			;b341
	rl (iy+004h)		;b342
	rrca			;b346
	rl (iy+008h)		;b347
	rrca			;b34b
	rl (iy+00ch)		;b34c
	rrca			;b350
	rl (iy+010h)		;b351
	rrca			;b355
	rl (iy+014h)		;b356
	rrca			;b35a
	rl (iy+018h)		;b35b
	rrca			;b35f
	rl (iy+01ch)		;b360
	add hl,de		;b364
	djnz L_B33B		;b365
	inc iy			;b367
	dec c			;b369
	jr nz,L_B339		;b36a
	pop hl			;b36c
	ret			;b36d
voltea_sprite:		; Media vuelta: copia el sprite con la PILA -`ld sp,hl` sobre el pozo y dieciseis vueltas de `pop de / pop bc`- escribiendo las filas hacia atras desde el final del slot
	ld h,000h		;b36e
	ld l,a			;b370
	add hl,hl		;b371
	add hl,hl		;b372
	add hl,hl		;b373
	add hl,hl		;b374
	add hl,hl		;b375
	add hl,hl		;b376
	ld de,06555h		;b377
	add hl,de		;b37a
	ld a,010h		;b37b
	ld (0b393h),sp		;b37d
	ld sp,hl		;b381
	ld hl,07d94h		;b382
L_B385:
	pop de			;b385
	pop bc			;b386
	ld (hl),b		;b387
	dec hl			;b388
	ld (hl),c		;b389
	dec hl			;b38a
	ld (hl),d		;b38b
	dec hl			;b38c
	ld (hl),e		;b38d
	dec hl			;b38e
	dec a			;b38f
	jr nz,L_B385		;b390
	ld sp,00000h		;b392
	ret			;b395
copia_sprite:		; La identidad de las cuatro: un `ldir` de 0x40 bytes del pozo al slot de trabajo
	ld h,000h		;b396
	ld l,a			;b398
	add hl,hl		;b399
	add hl,hl		;b39a
	add hl,hl		;b39b
	add hl,hl		;b39c
	add hl,hl		;b39d
	add hl,hl		;b39e
	ld de,06555h		;b39f
	add hl,de		;b3a2
	ld de,07d55h		;b3a3
	ld bc,00040h		;b3a6
	ldir			;b3a9
	ret			;b3ab
suma_puntos:		; Suma al marcador de 0xB87F en ASCII con acarreo decimal a mano de derecha a izquierda, repinta, y mira si toca vida extra
	ld a,(0b880h)		;b3ac
	push af			;b3af
L_B3B0:
	push hl			;b3b0
L_B3B1:
	ld a,(hl)		;b3b1
	inc a			;b3b2
	cp 03ah			;b3b3
	jr c,L_B3BE		;b3b5
	sub 00ah		;b3b7
	ld (hl),a		;b3b9
	dec hl			;b3ba
	jp L_B3B1		;b3bb
L_B3BE:
	ld (hl),a		;b3be
	pop hl			;b3bf
	djnz L_B3B0		;b3c0
	call hud_imprime		;b3c2
	pop de			;b3c5
	ld a,(0b880h)		;b3c6
	cp d			;b3c9
	ret z			;b3ca
	ld a,080h		;b3cb
	ld de,0cdb1h		;b3cd
	call arranca_guion		;b3d0
	inc a			;b3d3
	ld de,0cdd0h		;b3d4
	call arranca_guion		;b3d7
	inc a			;b3da
	ld de,0cdech		;b3db
	call arranca_guion		;b3de
	call sonido_off		;b3e1
	ld a,(0a6edh)		;b3e4
	cp 002h			;b3e7
	jp c,repinta_escudo		;b3e9
	ld hl,0c45fh		;b3ec
	ld a,(hl)		;b3ef
	cp 009h			;b3f0
	ret nc			;b3f2
	inc (hl)		;b3f3
	jp hud_vidas		;b3f4
alta_enemigo_cuadro:		; El alta de enemigos cuadro a cuadro: una de cada cuatro tiradas y solo con 0xB720 a cero, saca columna al azar por debajo de 0xB0, elige nacer por arriba (fila 0x10) o por abajo (0xC0), y manda a la tabla de voladores o, si consulta_mapa da suelo firme, a la de andantes
	call azar		;b3f7
	and 003h		;b3fa
	ret nz			;b3fc
	ld a,(0b720h)		;b3fd
	and a			;b400
	ret nz			;b401
L_B402:
	call azar		;b402
	cp 0b0h			;b405
	jr nc,L_B402		;b407
	ld c,a			;b409
	bit 3,a			;b40a
	ld b,010h		;b40c
	jr z,L_B412		;b40e
	ld b,0c0h		;b410
L_B412:
	bit 1,c			;b412
	jr z,L_B424		;b414
	ld a,b			;b416
	cp 0c0h			;b417
	ld a,0fch		;b419
	jr z,L_B41F		;b41b
	ld a,004h		;b41d
L_B41F:
	ex af,af'		;b41f
	call alta_volador		;b420
	ret c			;b423
L_B424:
	ld h,b			;b424
	ld l,c			;b425
	call consulta_mapa		;b426
	ret z			;b429
	ld a,b			;b42a
	cp 0c0h			;b42b
	ld a,004h		;b42d
	jr nz,L_B432		;b42f
	xor a			;b431
L_B432:
	ex af,af'		;b432
	jp alta_enemigo		;b433
repinta_escudo:		; Pone el escudo a 3 (0xA6ED) y repinta su indicador: cuatro celdas de color, 0x2778 en 0xF9, 0x2F40 y 0x2F48 en 0xF5, y 0x2F50 en 0xF1
	ld a,003h		;b436
	ld (0a6edh),a		;b438
	ld hl,02778h		;b43b
	ld c,0f9h		;b43e
	call pinta_celda_color		;b440
	ld hl,02f40h		;b443
	ld c,0f5h		;b446
	call pinta_celda_color		;b448
	ld hl,02f48h		;b44b
	ld c,0f5h		;b44e
	call pinta_celda_color		;b450
	ld hl,02f50h		;b453
	ld c,0f1h		;b456
pinta_celda_color:		; Rellena dos celdas de color consecutivas de la VRAM (8 bytes cada una, separadas 0x40) con el valor C. Es la misma que la 0xD480 de la fase de naves salvo por UNA instruccion: alli hay un `ei` dentro del bucle (0xD48E) que aqui no esta, y por eso las dos se desalinean a partir del byte 14 aunque hagan lo mismo
	call vram_pon_dir		;b458
	ld a,c			;b45b
	ld c,002h		;b45c
L_B45E:
	ld b,008h		;b45e
L_B460:
	out (098h),a		;b460
	and a			;b462
	dec b			;b463
	jr nz,L_B460		;b464
	ld de,00040h		;b466
	add hl,de		;b469
	call vram_pon_dir		;b46a
	dec c			;b46d
	jr nz,L_B45E		;b46e
	ei			;b470
	ret			;b471
rotula_glifo:		; Estampa el glifo 0x5F00+A*8 a DOBLE altura y tramado en damero: borra con rlca/cpl/and, pinta con and 0x55/0xAA; recorta al llegar a 0x4F00
	ld e,a			;b472
	ld a,h			;b473
	cp 04fh			;b474
	ld a,e			;b476
	ret nc			;b477
	cp 020h			;b478
	push hl			;b47a
	ld h,000h		;b47b
	ld l,a			;b47d
	add hl,hl		;b47e
	add hl,hl		;b47f
	add hl,hl		;b480
	ld de,05f00h		;b481
	add hl,de		;b484
	ex de,hl		;b485
	pop hl			;b486
	push hl			;b487
	push de			;b488
	ld bc,00018h		;b489
	ld a,008h		;b48c
L_B48E:
	ex af,af'		;b48e
	ld a,(de)		;b48f
	rlca			;b490
	cpl			;b491
	and (hl)		;b492
	ld (hl),a		;b493
	add hl,bc		;b494
	ld a,(de)		;b495
	rlca			;b496
	cpl			;b497
	and (hl)		;b498
	ld (hl),a		;b499
	add hl,bc		;b49a
	inc de			;b49b
	ex af,af'		;b49c
	dec a			;b49d
	jp nz,L_B48E		;b49e
	pop de			;b4a1
	pop hl			;b4a2
	push hl			;b4a3
	add hl,bc		;b4a4
	ld a,008h		;b4a5
L_B4A7:
	ex af,af'		;b4a7
	ld a,(de)		;b4a8
	and 055h		;b4a9
	or (hl)			;b4ab
	ld (hl),a		;b4ac
	add hl,bc		;b4ad
	ld a,(de)		;b4ae
	and 0aah		;b4af
	or (hl)			;b4b1
	ld (hl),a		;b4b2
	add hl,bc		;b4b3
	inc de			;b4b4
	ex af,af'		;b4b5
	dec a			;b4b6
	jp nz,L_B4A7		;b4b7
	pop hl			;b4ba
	ret			;b4bb
rotula_cadena:		; Imprime la cadena de (IX) hasta el 0 con rotula_glifo: el rotulo DEMO y el menu
	ld a,(ix+000h)		;b4bc
	inc ix			;b4bf
	and a			;b4c1
	ret z			;b4c2
	call rotula_glifo		;b4c3
	inc hl			;b4c6
	jp rotula_cadena		;b4c7
rotula_menu:		; Rotula el menu entero sobre el buffer con las cinco cadenas encadenadas de 0xB886, y remata poniendo la marca de seleccion en la linea que diga 0xB87C
	ld ix,0b886h		;b4ca
	ld de,000c8h		;b4ce
	call suma_scroll		;b4d1
	call rotula_cadena_menu		;b4d4
	ld de,003c2h		;b4d7
	call suma_scroll		;b4da
	call rotula_cadena_menu		;b4dd
	ld de,006c2h		;b4e0
	call suma_scroll		;b4e3
	call rotula_cadena		;b4e6
	ld de,009c2h		;b4e9
	call suma_scroll		;b4ec
	call rotula_cadena		;b4ef
	ld de,00cc2h		;b4f2
	call suma_scroll		;b4f5
	call rotula_cadena		;b4f8
	ld a,(0b87ch)		;b4fb
	and a			;b4fe
	jr z,L_B50E		;b4ff
	ld ix,0b8b7h		;b501
	ld de,009c2h		;b505
	call suma_scroll		;b508
	jp rotula_cadena		;b50b
L_B50E:
	ld ix,0b8c0h		;b50e
	ld de,00cc2h		;b512
	call suma_scroll		;b515
	jp rotula_cadena		;b518

; ----------------------------------------------------------------------
; DATOS relleno: (320 B; 320 de 320 bytes son 0xFF)
;   0xb51b..0xb65b  (320 bytes)
; ----------------------------------------------------------------------
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b51b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b52b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b53b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b54b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b55b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b56b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b57b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b58b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b59b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b5ab  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b5bb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b5cb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b5db  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b5eb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b5fb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b60b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b61b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b62b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b63b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; b64b  ................

; ======================================================================
; CODIGO 0xb65b..0xb720  (197 bytes)
; ======================================================================


scroll_records:		; El scroll de la pantalla de records: baja el puntero de 0xB87D una fila del buffer por vuelta y rotula el titulo y las ocho fichas de 0xB8C8; cuando el rotulo se sale por arriba, el llamador desapila, arranca la musica y entra en la demo. Gemela de la de naves, 35 de 49 bytes
	ld hl,(0b87dh)		;b65b
	ld de,00018h		;b65e
	and a			;b661
	sbc hl,de		;b662
	ld a,h			;b664
	cp 040h			;b665
	jp c,L_B6A7		;b667
	ld (0b87dh),hl		;b66a
	ld ix,0b886h		;b66d
	call rotula_cadena		;b671
	ld de,00235h		;b674
	add hl,de		;b677
	ld ix,0b8c8h		;b678
	ld de,00172h		;b67c
	ld b,008h		;b67f
L_B681:
	push bc			;b681
	push de			;b682
	call rotula_cadena		;b683
	pop de			;b686
	add hl,de		;b687
	pop bc			;b688
	djnz L_B681		;b689
	ret			;b68b
L_B68C:
	ld hl,04f08h		;b68c
	ld (0b87dh),hl		;b68f
L_B692:
	call borra_buffer		;b692
	call pinta_estrellas		;b695
	call scroll_records		;b698
	call vuelca_pantalla		;b69b
	call hay_tecla		;b69e
	jp nz,L_A2D5		;b6a1
	jp L_B692		;b6a4
L_B6A7:
	pop hl			;b6a7
	call arranca_musica		;b6a8
	nop			;b6ab
	nop			;b6ac
	nop			;b6ad
	xor a			;b6ae
	ld (0d10dh),a		;b6af
L_B6B2:
	call hay_tecla		;b6b2
	jr nz,L_B6C4		;b6b5
	ld bc,003e8h		;b6b7
	call espera		;b6ba
	ld hl,(0d096h)		;b6bd
	ld a,h			;b6c0
	or l			;b6c1
	jr nz,L_B6B2		;b6c2
L_B6C4:
	ld hl,0a7f8h		;b6c4
	ld (0ad28h),hl		;b6c7
	ld hl,0a6eeh		;b6ca
	ld (0a689h),hl		;b6cd
	jp L_A3B4		;b6d0
entra_en_records:		; Mira si el marcador entra en la tabla: compara los seis digitos contra los ocho campos de puntuacion y, al ganar uno, hace hueco con un `lddr` y salta a la entrada del nombre. Es por donde vuelve todo game over. Gemela de la de naves, 57 de 71 bytes
	ld hl,0b8d0h		;b6d3
	ld c,008h		;b6d6
L_B6D8:
	ld de,0b87fh		;b6d8
	push hl			;b6db
	ld b,006h		;b6dc
L_B6DE:
	ld a,(de)		;b6de
	cp (hl)			;b6df
	jr c,L_B711		;b6e0
	jr z,L_B70D		;b6e2
	ld hl,0b931h		;b6e4
	dec c			;b6e7
	jr z,L_B700		;b6e8
	ld h,000h		;b6ea
	ld l,c			;b6ec
	ld d,h			;b6ed
	ld e,l			;b6ee
	add hl,hl		;b6ef
	add hl,hl		;b6f0
	add hl,hl		;b6f1
	add hl,hl		;b6f2
	sbc hl,de		;b6f3
	ld b,h			;b6f5
	ld c,l			;b6f6
	ld hl,0b930h		;b6f7
	ld de,0b93fh		;b6fa
	lddr			;b6fd
	inc hl			;b6ff
L_B700:
	pop de			;b700
	push hl			;b701
	ld hl,0b87fh		;b702
	ld bc,00006h		;b705
	ldir			;b708
	jp L_D3C4		;b70a
L_B70D:
	inc hl			;b70d
	inc de			;b70e
	djnz L_B6DE		;b70f
L_B711:
	pop hl			;b711
	ld de,0000fh		;b712
	add hl,de		;b715
	dec c			;b716
	jr nz,L_B6D8		;b717
	ret			;b719
espera:		; Espera de BC vueltas: el paso de las escenas del final
	dec bc			;b71a
	ld a,b			;b71b
	or c			;b71c
	jr nz,espera		;b71d
	ret			;b71f

; ----------------------------------------------------------------------
; DATOS textos: de la segunda parte: menu, redefinir teclas, records y mensajes (656 B, 75 % imprimible)
;   0xb720..0xb9b0  (656 bytes)
; ----------------------------------------------------------------------
	defb 000h,020h,020h,020h,020h,041h,042h,041h,04ah,04fh,020h,020h,020h,020h,020h,000h	; b720  .    ABAJO     .
	defb 000h,000h,000h,000h,000h,000h,00dh,00dh,020h,020h,020h,020h,041h,052h,052h,049h	; b730  ........    ARRI
	defb 042h,041h,020h,020h,020h,020h,000h,000h,000h,000h,000h,000h,000h,00dh,00dh,020h	; b740  BA    ......... 
	defb 020h,020h,020h,044h,045h,052h,045h,043h,048h,041h,020h,020h,020h,000h,000h,000h	; b750     DERECHA   ...
	defb 000h,000h,000h,000h,00dh,00dh,020h,020h,020h,020h,049h,05ah,051h,055h,049h,045h	; b760  ......    IZQUIE
	defb 052h,044h,041h,020h,000h,000h,000h,000h,000h,000h,000h,00dh,00dh,020h,020h,020h	; b770  RDA .........   
	defb 020h,044h,049h,053h,050h,041h,052h,04fh,020h,020h,020h,000h,000h,000h,000h,000h	; b780   DISPARO   .....
	defb 000h,000h,00dh,00dh,020h,020h,020h,020h,050h,041h,052h,041h,052h,020h,020h,020h	; b790  ....    PARAR   
	defb 020h,020h,000h,000h,000h,000h,000h,000h,000h,00dh,00dh,020h,020h,020h,020h,041h	; b7a0    .........    A
	defb 042h,041h,04eh,044h,04fh,04eh,041h,052h,020h,000h,000h,000h,000h,000h,000h,000h	; b7b0  BANDONAR .......
	defb 00dh,000h,030h,031h,032h,033h,034h,035h,036h,037h,038h,039h,02dh,03dh,023h,022h	; b7c0  ..0123456789-=#"
	defb 024h,026h,027h,03bh,02ch,02eh,02fh,025h,041h,042h,043h,044h,045h,046h,047h,048h	; b7d0  $&';,./%ABCDEFGH
	defb 049h,04ah,04bh,04ch,04dh,04eh,04fh,050h,051h,052h,053h,054h,055h,056h,057h,058h	; b7e0  IJKLMNOPQRSTUVWX
	defb 059h,05ah,001h,002h,003h,004h,005h,006h,007h,008h,009h,00ah,00bh,00ch,00dh,00eh	; b7f0  YZ..............
	defb 00fh,010h,011h,012h,013h,014h,020h,020h,020h,020h,020h,053h,048h,049h,046h,054h	; b800  ......     SHIFT
	defb 000h,043h,054h,052h,04ch,000h,047h,052h,041h,050h,048h,000h,043h,041h,050h,053h	; b810  .CTRL.GRAPH.CAPS
	defb 000h,043h,04fh,044h,045h,000h,046h,020h,031h,000h,046h,020h,032h,000h,046h,020h	; b820  .CODE.F 1.F 2.F 
	defb 033h,000h,046h,020h,034h,000h,046h,020h,035h,000h,045h,053h,043h,000h,054h,041h	; b830  3.F 4.F 5.ESC.TA
	defb 042h,000h,053h,054h,04fh,050h,000h,042h,053h,000h,053h,045h,04ch,045h,043h,054h	; b840  B.STOP.BS.SELECT
	defb 000h,045h,04eh,054h,045h,052h,000h,053h,050h,041h,043h,045h,000h,048h,04fh,04dh	; b850  .ENTER.SPACE.HOM
	defb 045h,000h,049h,04eh,053h,000h,044h,045h,04ch,000h,040h,0f2h,040h,0f4h,020h,0f4h	; b860  E.INS.DEL.@.@. .
	defb 010h,0f4h,001h,0f8h,020h,0f3h,010h,0f3h,000h,000h,000h,000h,000h,000h,000h,030h	; b870  .... ..........0
	defb 030h,030h,030h,030h,030h,000h,053h,054h,041h,052h,044h,055h,053h,054h,000h,052h	; b880  00000.STARDUST.R
	defb 045h,044h,045h,046h,049h,04eh,049h,052h,020h,054h,045h,043h,04ch,041h,053h,000h	; b890  EDEFINIR TECLAS.
	defb 04ah,055h,047h,041h,052h,000h,04ah,04fh,059h,053h,054h,049h,043h,04bh,000h,054h	; b8a0  JUGAR.JOYSTICK.T
	defb 045h,043h,04ch,041h,044h,04fh,000h,03ch,03eh,03eh,03eh,03eh,03eh,03eh,03eh,000h	; b8b0  ECLADO.<>>>>>>>.
	defb 03ch,03eh,03eh,03eh,03eh,03eh,03eh,000h,04ah,041h,056h,049h,045h,052h,020h,020h	; b8c0  <>>>>>>.JAVIER  
	defb 031h,030h,030h,030h,030h,030h,000h,04ah,055h,041h,04eh,020h,043h,020h,020h,030h	; b8d0  100000.JUAN C  0
	defb 038h,030h,030h,030h,030h,000h,04dh,041h,052h,054h,041h,020h,020h,020h,030h,036h	; b8e0  80000.MARTA   06
	defb 030h,030h,030h,030h,000h,04dh,041h,052h,049h,041h,020h,020h,020h,030h,035h,030h	; b8f0  0000.MARIA   050
	defb 030h,030h,030h,000h,020h,020h,020h,020h,020h,020h,020h,020h,030h,034h,030h,030h	; b900  000.        0400
	defb 030h,030h,000h,020h,054h,04fh,050h,04fh,020h,020h,020h,030h,033h,030h,030h,030h	; b910  00. TOPO   03000
	defb 030h,000h,020h,053h,04fh,046h,054h,020h,020h,020h,030h,032h,030h,030h,030h,030h	; b920  0. SOFT   020000
	defb 000h,020h,020h,020h,020h,020h,020h,020h,020h,030h,031h,030h,030h,030h,030h,000h	; b930  .        010000.
	defb 001h,00bh,042h,020h,052h,020h,041h,020h,056h,020h,04fh,00dh,00dh,00dh,00dh,001h	; b940  ..B R A V O.....
	defb 007h,048h,041h,053h,020h,043h,04fh,04eh,053h,045h,047h,055h,049h,044h,04fh,020h	; b950  .HAS CONSEGUIDO 
	defb 055h,04eh,041h,00dh,00dh,001h,009h,044h,045h,020h,04ch,041h,053h,020h,04dh,045h	; b960  UNA....DE LAS ME
	defb 04ah,04fh,052h,045h,053h,00dh,00dh,001h,006h,050h,055h,04eh,054h,055h,041h,043h	; b970  JORES....PUNTUAC
	defb 049h,04fh,04eh,045h,053h,020h,020h,044h,045h,020h,048h,04fh,059h,00dh,00dh,00dh	; b980  IONES  DE HOY...
	defb 001h,007h,045h,053h,043h,052h,049h,042h,045h,020h,020h,054h,055h,020h,04eh,04fh	; b990  ..ESCRIBE  TU NO
	defb 04dh,042h,052h,045h,00dh,00dh,00dh,00dh,001h,00dh,000h,044h,045h,04dh,04fh,000h	; b9a0  MBRE.......DEMO.

; ======================================================================
; CODIGO 0xb9b0..0xbc24  (628 bytes)
; ======================================================================


mueve_tiros_torreta:		; Mueve los tiros de las torretas (tabla 0xAD04, max 2): al cruzar el borde del piso (Y+10 >= 0x7C) caen al vacio y en la fila 0x80 se borran
	ld ix,0ad04h		;b9b0
	ld a,(0ad03h)		;b9b4
	and a			;b9b7
	ret z			;b9b8
	ld b,a			;b9b9
L_B9BA:
	push bc			;b9ba
	ld c,(ix+000h)		;b9bb
	ld b,(ix+001h)		;b9be
	ld e,(ix+002h)		;b9c1
	ld d,(ix+003h)		;b9c4
	ld hl,(0a6ebh)		;b9c7
	ld a,c			;b9ca
	add a,00ah		;b9cb
	cp 07ch			;b9cd   ; El borde del piso inferior: Y+10 contra 0x7C (fila 124); cruzarlo es caer al vacio
	jr c,L_B9E9		;b9cf
	ex de,hl		;b9d1
	ld bc,00404h		;b9d2
	sbc hl,bc		;b9d5
	sub 03ah		;b9d7
	call pinta_sprite		;b9d9
	inc (ix+000h)		;b9dc
	ld a,(ix+000h)		;b9df
	cp 080h			;b9e2
	jr c,L_BA47		;b9e4
	jp L_BA52		;b9e6
L_B9E9:
	ld a,(ix+004h)		;b9e9
	cp 0b4h			;b9ec
	jr nc,L_B9F3		;b9ee
	ld hl,0ff60h		;b9f0
L_B9F3:
	ex de,hl		;b9f3
	call persigue_con_inercia		;b9f4
	ex de,hl		;b9f7
	ld a,d			;b9f8
	cp 0e0h			;b9f9
	jr nc,L_BA52		;b9fb
	ld (ix+000h),c		;b9fd
	ld (ix+001h),b		;ba00
	ld (ix+002h),e		;ba03
	ld (ix+003h),d		;ba06
	ld a,(ix+004h)		;ba09
	and 001h		;ba0c
	dec (ix+004h)		;ba0e
	ex de,hl		;ba11
	call pinta_glifo		;ba12
	call disparo_derriba_tiro		;ba15
	ld a,(0a6edh)		;ba18
	cp 004h			;ba1b
	jr nc,L_BA47		;ba1d
	ld l,(ix+002h)		;ba1f
	ld h,(ix+003h)		;ba22
	push hl			;ba25
	ld a,(0a6ech)		;ba26
	ld l,a			;ba29
	ld de,0040ah		;ba2a
	ld bc,00203h		;ba2d
	call solapa_eje		;ba30
	pop hl			;ba33
	jr c,L_BA47		;ba34
	ld h,l			;ba36
	ld a,(0a6ebh)		;ba37
	ld l,a			;ba3a
	call solapa_eje		;ba3b
	jr c,L_BA47		;ba3e
	call impacto_doble		;ba40
	ld (ix+000h),07ch	;ba43
L_BA47:
	ld de,00005h		;ba47
	add ix,de		;ba4a
L_BA4C:
	pop bc			;ba4c
	dec b			;ba4d
	jp nz,L_B9BA		;ba4e
	ret			;ba51
L_BA52:
	ld hl,0ad03h		;ba52
	dec (hl)		;ba55
	pop bc			;ba56
	push bc			;ba57
	ld a,b			;ba58
	cp 001h			;ba59
	jr z,L_BA4C		;ba5b
	push ix			;ba5d
	pop de			;ba5f
	push de			;ba60
	inc de			;ba61
	inc de			;ba62
	inc de			;ba63
	inc de			;ba64
	inc de			;ba65
	ld hl,0ad0eh		;ba66
	and a			;ba69
	sbc hl,de		;ba6a
	ld b,h			;ba6c
	ld c,l			;ba6d
	ex de,hl		;ba6e
	pop de			;ba6f
	ldir			;ba70
	jp L_BA4C		;ba72
dispara:		; Mete disparos en la tabla del jugador (0xACBC) en su posicion mas 0x0404, con la mejora de 0xC459 cuatro en los rumbos base, +2, +4 y +6. OJO: el filtro del gatillo NO es el de la fase de naves: aqui se guarda el estado en 0xC45A y se sale con `xor c / ret z`, o sea que entra cada vez que el boton CAMBIA -al pulsar y al soltar-, no solo al pulsar
	bit 4,a			;ba75
	ld bc,(0c45ah)		;ba77
	ld b,a			;ba7b
	ld a,010h		;ba7c
	jr nz,L_BA82		;ba7e
	ld a,000h		;ba80
L_BA82:
	ld (0c45ah),a		;ba82
	xor c			;ba85
	ld a,b			;ba86
	ret z			;ba87
	push af			;ba88
	push hl			;ba89
	ld a,(0ad0eh)		;ba8a
	and 007h		;ba8d
	ld bc,00404h		;ba8f
	add hl,bc		;ba92
	ld b,h			;ba93
	ld c,l			;ba94
	ex af,af'		;ba95
	call alta_objeto_acbb		;ba96
	add a,002h		;ba99
	and 007h		;ba9b
	ex af,af'		;ba9d
	ld a,(0c459h)		;ba9e
	and a			;baa1
	jr z,L_BAB7		;baa2
	call alta_objeto_acbb		;baa4
	add a,002h		;baa7
	and 007h		;baa9
	ex af,af'		;baab
	call alta_objeto_acbb		;baac
	add a,002h		;baaf
	and 007h		;bab1
	ex af,af'		;bab3
	call alta_objeto_acbb		;bab4
L_BAB7:
	pop hl			;bab7
	pop af			;bab8
	ret			;bab9
rotula_glifo_menu:		; rotula_glifo con otro recorte, solo para el menu: mismo glifo a doble altura y mismas mascaras de damero, pero sin el recorte de la entrada y con uno por fila que, tal como esta escrito, NO se cumple nunca (compara H contra C, que vale 0x18 fijo). No se nota porque el menu nunca baja tanto
	cp 020h			;baba
	push hl			;babc
	ld h,000h		;babd
	ld l,a			;babf
	add hl,hl		;bac0
	add hl,hl		;bac1
	add hl,hl		;bac2
	ld de,05f00h		;bac3
	add hl,de		;bac6
	ex de,hl		;bac7
	pop hl			;bac8
	push hl			;bac9
	push de			;baca
	ld bc,00018h		;bacb
	ld a,008h		;bace
L_BAD0:
	ex af,af'		;bad0
	ld a,h			;bad1
	cp c			;bad2
	jr nz,L_BAD7		;bad3
	ld h,0f1h		;bad5
L_BAD7:
	ld a,(de)		;bad7
	rlca			;bad8
	cpl			;bad9
	and (hl)		;bada
	ld (hl),a		;badb
	add hl,bc		;badc
	ld a,(de)		;badd
	rlca			;bade
	cpl			;badf
	and (hl)		;bae0
	ld (hl),a		;bae1
	add hl,bc		;bae2
	inc de			;bae3
	ex af,af'		;bae4
	dec a			;bae5
	jp nz,L_BAD0		;bae6
	pop de			;bae9
	pop hl			;baea
	push hl			;baeb
	add hl,bc		;baec
	ld a,008h		;baed
L_BAEF:
	ex af,af'		;baef
	ld a,h			;baf0
	cp c			;baf1
	jr nz,L_BAF6		;baf2
	ld h,0f1h		;baf4
L_BAF6:
	ld a,(de)		;baf6
	and 055h		;baf7
	or (hl)			;baf9
	ld (hl),a		;bafa
	add hl,bc		;bafb
	ld a,(de)		;bafc
	and 0aah		;bafd
	or (hl)			;baff
	ld (hl),a		;bb00
	add hl,bc		;bb01
	inc de			;bb02
	ex af,af'		;bb03
	dec a			;bb04
	jp nz,L_BAEF		;bb05
	pop hl			;bb08
	ret			;bb09
rotula_cadena_menu:		; La cadena de rotula_glifo_menu: lee (IX), avanza y sale con el cero. Byte a byte la misma que rotula_cadena, cambiando solo a quien llama
	ld a,(ix+000h)		;bb0a
	inc ix			;bb0d
	and a			;bb0f
	ret z			;bb10
	call rotula_glifo_menu		;bb11
	inc hl			;bb14
	jp rotula_cadena_menu		;bb15
suma_scroll:		; HL = el scroll de 0xC463 mas DE
	ld hl,(0c463h)		;bb18
	add hl,de		;bb1b
	ret			;bb1c
pinta_estrellas:		; Estampa el patron 0x18 -dos pixeles- en 48 posiciones del buffer sacadas de 96 bytes de la ROM del BIOS en 0x07D0, leidos como pares (byte alto enmascarado a 0x4x, byte bajo)
	ld hl,007d0h		;bb1d
	ld b,030h		;bb20
L_BB22:
	ld a,(hl)		;bb22
	inc hl			;bb23
	and 00fh		;bb24
	add a,040h		;bb26
	ld d,a			;bb28
	ld a,(hl)		;bb29
	inc hl			;bb2a
	ld e,a			;bb2b
	ld a,018h		;bb2c
	ld (de),a		;bb2e
	djnz L_BB22		;bb2f
	ret			;bb31
dispara_torretas:		; Recorre las SEIS torretas de 0xBC24 (solo con el scroll parado, 0xAD2A a cero): cada una viva dispara con lanza_tiro_torreta, y si le toca turno se dibuja y se mira si algo la ha alcanzado. Al caer paga 200 puntos y arranca la cuenta atras de 0xBC31
	ld a,(0ad2ah)		;bb32
	and a			;bb35
	ret nz			;bb36
	ld b,006h		;bb37
	ld ix,0bc24h		;bb39
L_BB3D:
	push bc			;bb3d
	ld a,(ix+001h)		;bb3e
	inc a			;bb41
	jr z,L_BB9A		;bb42
	and 00fh		;bb44
	ld (ix+001h),a		;bb46
	ld a,(0ad2ch)		;bb49
	add a,00ch		;bb4c
	ld h,a			;bb4e
	ld l,(ix+000h)		;bb4f
	push hl			;bb52
	xor a			;bb53
	ex af,af'		;bb54
	ld b,h			;bb55
	ld c,l			;bb56
	call lanza_tiro_torreta		;bb57   ; Cada torreta viva dispara: mete su tiro en la tabla de 0xAD04
	pop hl			;bb5a
	bit 3,(ix+001h)		;bb5b
	jr z,L_BB9A		;bb5f
	push hl			;bb61
	ld a,003h		;bb62
	call pinta_glifo		;bb64
	pop hl			;bb67
	ld iy,0acbch		;bb68
	ld de,00408h		;bb6c
	ld bc,00200h		;bb6f
	call choca_con_tabla		;bb72
	jr c,L_BB9A		;bb75
	ld (iy+002h),080h	;bb77
	ld a,014h		;bb7b
	ld (0b879h),a		;bb7d
	ld (ix+001h),0ffh	;bb80
	xor a			;bb84
	ld (0bc30h),a		;bb85
	ld hl,0106fh		;bb88
	ld (0bc31h),hl		;bb8b
	ld hl,0b882h		;bb8e
	ld a,00fh		;bb91
	call premia		;bb93
	ld hl,0bc33h		;bb96
	dec (hl)		;bb99
L_BB9A:
	inc ix			;bb9a
	inc ix			;bb9c
	pop bc			;bb9e
	djnz L_BB3D		;bb9f
	ret			;bba1
tic_cuenta_atras:		; El tic de la torre: solo con los 6 objetivos muertos (0xBC33=0) y 1 de cada 16 del contador de cuadros 0xAD27; pinta una fila y a las 161 (0xBC30) salta a tiempo_agotado
	ld a,(0bc33h)		;bba2
	and a			;bba5
	ret nz			;bba6
	ld a,(0ad27h)		;bba7
	and 00fh		;bbaa
	ret nz			;bbac
	ld a,(0bc30h)		;bbad
	inc a			;bbb0
	ld (0bc30h),a		;bbb1
	cp 0a1h			;bbb4
	jp z,tiempo_agotado		;bbb6
	xor a			;bbb9
	ld de,0cd9ch		;bbba
	call arranca_guion_libre		;bbbd
	ld hl,(0bc31h)		;bbc0
	call vram_pon_dir		;bbc3
	ld a,07eh		;bbc6
	out (098h),a		;bbc8   ; La fila que crece de la torre blanca de la cuenta atras
	ei			;bbca
	call avanza_torre		;bbcb
	ld (0bc31h),hl		;bbce
	ret			;bbd1
avanza_torre:		; Sube la punta de la torre una fila (0xBC31/32); el salto de tercio del SCREEN 2 es el l|=0x3F / h-=8
	ld a,l			;bbd2
	and 03fh		;bbd3
	jr z,L_BBD9		;bbd5
	dec hl			;bbd7
	ret			;bbd8
L_BBD9:
	ld a,l			;bbd9
	or 03fh			;bbda
	ld l,a			;bbdc
	ld a,h			;bbdd
	sub 008h		;bbde
	ld h,a			;bbe0
	ret			;bbe1
borra_torre:		; Borra la torre de la cuenta atras en los tres tercios: los patrones a cero en 0x0050, 0x0840 y 0x1040 (48, 64 y 48 bytes) y los colores a 0xF1 en los 0x2050, 0x2840 y 0x3040 correspondientes
	ld bc,03098h		;bbe2
	ld hl,00050h		;bbe5
	call vram_pone_ceros		;bbe8
	ld b,040h		;bbeb
	ld hl,00840h		;bbed
	call vram_pone_ceros		;bbf0
	ld b,030h		;bbf3
	ld hl,01040h		;bbf5
vram_pone_ceros:		; Escribe B ceros seguidos por el puerto que traiga C, sin releer la direccion
	call vram_pon_dir		;bbf8
L_BBFB:
	ld a,000h		;bbfb
	out (c),a		;bbfd
	nop			;bbff
	djnz L_BBFB		;bc00
	ld bc,03098h		;bc02
	ld hl,02050h		;bc05
	call vram_pone_f1		;bc08
	ld b,040h		;bc0b
	ld hl,02840h		;bc0d
	call vram_pone_f1		;bc10
	ld b,030h		;bc13
	ld hl,03040h		;bc15
vram_pone_f1:		; Lo mismo con el valor 0xF1: la pareja de la de arriba, para la tabla de colores
	call vram_pon_dir		;bc18
L_BC1B:
	ld a,0f1h		;bc1b
	out (c),a		;bc1d
	nop			;bc1f
	djnz L_BC1B		;bc20
	ei			;bc22
	ret			;bc23

; ----------------------------------------------------------------------
; DATOS variables: de la cuenta atras: los 6 objetivos (2 B cada uno, 0xBC24-0xBC2F), filas de torre pintadas (0xBC30), punta de la torre en VRAM (0xBC31/32), objetivos restantes (0xBC33, que 0xA415 pone a 6) y un byte sin dueno (0xBC34)
;   0xbc24..0xbc35  (17 bytes)
; ----------------------------------------------------------------------
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h	; bc24  ................
	defb 000h	; bc34  .

; ======================================================================
; CODIGO 0xbc35..0xbdaa  (373 bytes)
; ======================================================================


pinta_torre:		; Dibuja la torre, y solo cuando el scroll ha llegado: `ld a,(ix+000h) / sub 044h / ret c` sobre la fila de 0xAD2A, o sea que por debajo de la fila 0x44 no pinta nada
	ld ix,0ad2ah		;bc35
	ld a,(ix+000h)		;bc39
	sub 044h		;bc3c
	ret c			;bc3e
	sub 003h		;bc3f
	neg			;bc41
	add a,a			;bc43
	add a,a			;bc44
	add a,a			;bc45
	add a,a			;bc46
	add a,a			;bc47
	add a,040h		;bc48
	add a,(ix+002h)		;bc4a
	ld c,a			;bc4d
	ld a,(0c462h)		;bc4e
	sub c			;bc51
	neg			;bc52
	ld c,a			;bc54
	ld h,a			;bc55
	ld l,008h		;bc56
	call buffer_dir		;bc58
	ld a,c			;bc5b
	sub 0a0h		;bc5c
	neg			;bc5e
pinta_nave:		; Estampa en el buffer, desde HL y durante A filas, el dibujo de 64x64 de 0x7DDB leido con la pila (ocho `pop de` por fila); si 0xC468 no es cero le anade bajo las dos toberas una llama de (0xC468+8)/2 filas, sacada del final de las dos tablas de 24 bytes de detras del dibujo
	ld c,a			;bc60
	ld a,h			;bc61
	cp 04fh			;bc62
	ret nc			;bc64
	ld a,c			;bc65
	ld bc,00011h		;bc66
	exx			;bc69
	cp 041h			;bc6a
	jr c,L_BC70		;bc6c
	ld a,040h		;bc6e
L_BC70:
	ld b,a			;bc70
	ld (L_BCE9+1),sp	;bc71
	di			;bc75
	ld sp,07ddbh		;bc76
L_BC79:
	exx			;bc79
	pop de			;bc7a
	ld a,(hl)		;bc7b
	and e			;bc7c
	or d			;bc7d
	ld (hl),a		;bc7e
	inc l			;bc7f
	pop de			;bc80
	ld a,(hl)		;bc81
	and e			;bc82
	or d			;bc83
	ld (hl),a		;bc84
	inc l			;bc85
	pop de			;bc86
	ld a,(hl)		;bc87
	and e			;bc88
	or d			;bc89
	ld (hl),a		;bc8a
	inc l			;bc8b
	pop de			;bc8c
	ld a,(hl)		;bc8d
	and e			;bc8e
	or d			;bc8f
	ld (hl),a		;bc90
	inc l			;bc91
	pop de			;bc92
	ld a,(hl)		;bc93
	and e			;bc94
	or d			;bc95
	ld (hl),a		;bc96
	inc l			;bc97
	pop de			;bc98
	ld a,(hl)		;bc99
	and e			;bc9a
	or d			;bc9b
	ld (hl),a		;bc9c
	inc l			;bc9d
	pop de			;bc9e
	ld a,(hl)		;bc9f
	and e			;bca0
	or d			;bca1
	ld (hl),a		;bca2
	inc l			;bca3
	pop de			;bca4
	ld a,(hl)		;bca5
	and e			;bca6
	or d			;bca7
	ld (hl),a		;bca8
	add hl,bc		;bca9
	exx			;bcaa
	djnz L_BC79		;bcab
	exx			;bcad
	ld a,(0ad27h)		;bcae
	and 001h		;bcb1
	ld de,081dbh		;bcb3
	jr z,L_BCBB		;bcb6
	ld de,081f3h		;bcb8
L_BCBB:
	ld a,(0c468h)		;bcbb
	and a			;bcbe
	jp z,L_BCE9		;bcbf
	add a,008h		;bcc2
	rra			;bcc4
	exx			;bcc5
	ld b,a			;bcc6
	exx			;bcc7
	ld a,(0c468h)		;bcc8
	sub 010h		;bccb
	neg			;bccd
	ld c,a			;bccf
	ex de,hl		;bcd0
	add hl,bc		;bcd1
	ld sp,hl		;bcd2
	ex de,hl		;bcd3
	inc l			;bcd4
	exx			;bcd5
L_BCD6:
	exx			;bcd6
	pop de			;bcd7
	ld a,(hl)		;bcd8
	and e			;bcd9
	or d			;bcda
	ld (hl),a		;bcdb
	ld c,005h		;bcdc
	add hl,bc		;bcde
	ld a,(hl)		;bcdf
	and e			;bce0
	or d			;bce1
	ld (hl),a		;bce2
	ld c,013h		;bce3
	add hl,bc		;bce5
	exx			;bce6
	djnz L_BCD6		;bce7
L_BCE9:
	ld sp,00000h		;bce9
	ei			;bcec
	ret			;bced
tiempo_agotado:		; Se acabo el tiempo: flash de dameros, decaimiento de pixeles al azar, y a la tabla de records: game over sin FELICIDADES
	ld hl,0bdaah		;bcee
	ld (hl),07eh		;bcf1
	inc hl			;bcf3
	ld (hl),07eh		;bcf4
	ld a,002h		;bcf6
	ld de,0ce07h		;bcf8
	call arranca_guion		;bcfb
	ld b,014h		;bcfe
L_BD00:
	push bc			;bd00
	ld de,02a54h		;bd01
	call flash_dameros		;bd04
	ld de,0542ah		;bd07
	call flash_dameros		;bd0a
	pop bc			;bd0d
	djnz L_BD00		;bd0e
	ld hl,0bdaah		;bd10
	ld (hl),07eh		;bd13
	inc hl			;bd15
	ld (hl),07eh		;bd16
	ld a,002h		;bd18
	ld de,0ce11h		;bd1a
	call arranca_guion		;bd1d
	ld bc,0005ah		;bd20
L_BD23:
	call azar		;bd23
	xor b			;bd26
	xor c			;bd27
	cp 0a0h			;bd28
	jr c,L_BD2E		;bd2a
	sub 080h		;bd2c
L_BD2E:
	add a,008h		;bd2e
	ld d,a			;bd30
	call azar		;bd31
	xor b			;bd34
	xor c			;bd35
	and 01fh		;bd36
	cp 018h			;bd38
	jr c,L_BD3E		;bd3a
	sub 010h		;bd3c
L_BD3E:
	add a,004h		;bd3e
	ld e,a			;bd40
	call dir_vram_de_fila_columna		;bd41
	di			;bd44
	in a,(099h)		;bd45
	ld a,l			;bd47
	out (099h),a		;bd48
	add a,a			;bd4a
	ld a,h			;bd4b
	out (099h),a		;bd4c
	add a,a			;bd4e
	add a,a			;bd4f
	in a,(098h)		;bd50
	ei			;bd52
	ld e,a			;bd53
	call azar		;bd54
	and e			;bd57
	ld e,a			;bd58
	call vram_pon_dir		;bd59
	ld a,e			;bd5c
	out (098h),a		;bd5d
	ei			;bd5f
	call azar		;bd60
	and 018h		;bd63
	nop			;bd65
	call azar		;bd66
	call azar		;bd69
	and 007h		;bd6c
	inc a			;bd6e
L_BD6F:
	dec a			;bd6f
	jp nz,L_BD6F		;bd70
	djnz L_BD23		;bd73
	dec c			;bd75
	jr nz,L_BD23		;bd76
	jp L_A2D2		;bd78
flash_dameros:		; XOR de los tres tercios de la pantalla con el patron DE (0x2A54/0x542A alternados): el destello de la explosion
	ld hl,0bdaah		;bd7b
	ld a,(hl)		;bd7e
	xor d			;bd7f
	ld (hl),a		;bd80
	ld d,a			;bd81
	inc hl			;bd82
	ld a,(hl)		;bd83
	xor e			;bd84
	ld (hl),a		;bd85
	ld e,a			;bd86
	ld b,018h		;bd87
	ld hl,00050h		;bd89
	call escribe_par_vram		;bd8c
	ld b,020h		;bd8f
	ld hl,00840h		;bd91
	call escribe_par_vram		;bd94
	ld b,018h		;bd97
	ld hl,01040h		;bd99
escribe_par_vram:		; Escribe la pareja D,E en la VRAM B veces seguidas, avanzando la direccion de una en una
	call vram_pon_dir		;bd9c
	ld a,d			;bd9f
	out (098h),a		;bda0
	ld a,e			;bda2
	inc hl			;bda3
	out (098h),a		;bda4
	ei			;bda6
	djnz escribe_par_vram		;bda7
	ret			;bda9

; ----------------------------------------------------------------------
; DATOS relleno: o resto (2 B; 2 bytes)
;   0xbdaa..0xbdac  (2 bytes)
; ----------------------------------------------------------------------
	defb 000h,000h	; bdaa  ..

; ======================================================================
; CODIGO 0xbdac..0xbfeb  (575 bytes)
; ======================================================================


rehace_pantalla:		; Coloca la camara en 0x4638, parchea el salto de 0xA98E con el 0xDA que no salta nunca -para que el dibujado pinte todas las celdas de una pasada- y arranca el guion 0xCD80
	ld hl,04638h		;bdac
	ld (0a6ebh),hl		;bdaf
	ld a,0dah		;bdb2
	ld (0a98eh),a		;bdb4
	xor a			;bdb7
	ld de,0cd80h		;bdb8
	call arranca_guion		;bdbb
	ld b,010h		;bdbe
L_BDC0:
	push bc			;bdc0
	call repinta_todo		;bdc1
	pop bc			;bdc4
	ld hl,(0a6ebh)		;bdc5
	ld de,00018h		;bdc8
	and a			;bdcb
	sbc hl,de		;bdcc
	ld (0a6ebh),hl		;bdce
	djnz L_BDC0		;bdd1
	ld a,002h		;bdd3
	ld (0c468h),a		;bdd5
L_BDD8:
	ld b,00ah		;bdd8
L_BDDA:
	push bc			;bdda
	call repinta_todo		;bddb
	ld hl,0ad27h		;bdde
	inc (hl)		;bde1
	ld a,(0c468h)		;bde2
	rrca			;bde5
L_BDE6:
	push af			;bde6
	scf			;bde7
	call actualiza_scroll		;bde8
	pop af			;bdeb
	dec a			;bdec
	jr nz,L_BDE6		;bded
	ld a,(0ad2ah)		;bdef
	and a			;bdf2
	pop bc			;bdf3
	jr z,escena_final		;bdf4
	djnz L_BDDA		;bdf6
	ld a,(0c468h)		;bdf8
	cp 010h			;bdfb
	jr z,L_BDD8		;bdfd
	inc a			;bdff
	inc a			;be00
	ld (0c468h),a		;be01
	jr L_BDD8		;be04
repinta_todo:		; Rehace la pantalla entera: el fondo desde el mapa, el jugador encima y el volcado del buffer a la VRAM
	call redibuja_fondo		;be06
	ld hl,(0a6ebh)		;be09
	ld a,040h		;be0c
	call pinta_nave		;be0e
	call vuelca_pantalla		;be11
	ret			;be14
escena_final:		; La pantalla de estrellas del final: silencio, colores, el fondo de 0x6285 al buffer, cuatro esperas largas y el guion 0xCD8F, y luego el bucle que interpreta la animacion de 0x61D8
	ld iy,01388h		;be15
	ld ix,061d8h		;be19
	call sonido_reset		;be1d
	ld a,0f1h		;be20
	call rellena_colores		;be22
	call borra_buffer		;be25
	call pinta_estrellas		;be28
	call copia_al_buffer		;be2b
	call vuelca_pantalla		;be2e
	ld bc,00000h		;be31
	call espera		;be34
	call espera		;be37
	call espera		;be3a
	call espera		;be3d
	xor a			;be40
	ld de,0cd8fh		;be41
	call arranca_guion		;be44
anima_guion:		; Recorre el guion de (IX): 0xC0 termina, un byte por encima de 0xC0 cambia el fotograma parcheando el operando de 0xBE6B, y el resto son parejas (columna, fila) que se pintan con pinta_glifo sobre las estrellas
	call borra_buffer		;be47
	call pinta_estrellas		;be4a
	call copia_al_buffer		;be4d
	ld a,(ix+000h)		;be50
	cp 0c0h			;be53
	jr z,L_BE76		;be55
	jr c,L_BE63		;be57
	sub 0bdh		;be59
	ld (0be6ch),a		;be5b
	inc ix			;be5e
	ld a,(ix+000h)		;be60
L_BE63:
	ld l,a			;be63
	ld h,(ix+001h)		;be64
	inc ix			;be67
	inc ix			;be69
	ld a,000h		;be6b
	call pinta_glifo		;be6d
	call vuelca_pantalla		;be70
	jp anima_guion		;be73
L_BE76:
	ld bc,00000h		;be76
	call espera		;be79
	call espera		;be7c
	call espera		;be7f
	call espera		;be82
	ld hl,001d0h		;be85
	ld ix,0c33bh		;be88
	call rotula_secuencia		;be8c
	ld e,00fh		;be8f
L_BE91:
	ld bc,00000h		;be91
	call espera		;be94
	dec e			;be97
	jr nz,L_BE91		;be98
	call siembra_metralla		;be9a
	ld a,008h		;be9d
	ld (0bec8h),a		;be9f
	ld ix,0c30bh		;bea2
	ld iy,07d95h		;bea6
	ld de,00003h		;beaa
	ld b,008h		;bead
L_BEAF:
	ld (ix+000h),000h	;beaf
	add ix,de		;beb3
	djnz L_BEAF		;beb5
	ld b,046h		;beb7
L_BEB9:
	push bc			;beb9
	call borra_buffer		;beba
	call pinta_estrellas		;bebd
	call copia_al_buffer		;bec0
	ld ix,0c30bh		;bec3
	ld b,008h		;bec7
	ld a,(iy+000h)		;bec9
	dec a			;becc
	jr nz,L_BED4		;becd
	ld a,010h		;becf
	ld (0bec8h),a		;bed1
L_BED4:
	ld a,(ix+000h)		;bed4
	and a			;bed7
	jr nz,L_BF07		;bed8
	bit 7,(iy+000h)		;beda
	jr z,L_BF25		;bede
	xor a			;bee0
	ld de,0cd6dh		;bee1
	push bc			;bee4
	call arranca_guion		;bee5
	pop bc			;bee8
	call posicion_al_azar		;bee9
	ld a,h			;beec
	sub 008h		;beed
	ld h,a			;beef
	call azar		;bef0
	and 001h		;bef3
	jr z,L_BEF9		;bef5
	ld a,010h		;bef7
L_BEF9:
	add a,04ch		;bef9
	ld (ix+002h),a		;befb
	ld (ix+000h),l		;befe
	ld (ix+001h),h		;bf01
	ld c,001h		;bf04
	ld a,l			;bf06
L_BF07:
	ld l,a			;bf07
	ld h,(ix+001h)		;bf08
	ld a,(ix+002h)		;bf0b
	push bc			;bf0e
	call pinta_sprite		;bf0f
	pop bc			;bf12
	inc (ix+002h)		;bf13
	ld a,(ix+002h)		;bf16
	cp 050h			;bf19
	jr z,L_BF21		;bf1b
	cp 060h			;bf1d
	jr nz,L_BF25		;bf1f
L_BF21:
	ld (ix+000h),000h	;bf21
L_BF25:
	ld de,00003h		;bf25
	add ix,de		;bf28
	rlc (iy+000h)		;bf2a
	djnz L_BED4		;bf2e
	call vuelca_pantalla		;bf30
	pop bc			;bf33
	inc iy			;bf34
	dec b			;bf36
	jp nz,L_BEB9		;bf37
	ld a,002h		;bf3a
	ld de,0ce11h		;bf3c
	call arranca_guion		;bf3f
	call fogonazo_final		;bf42
	ld b,06eh		;bf45
L_BF47:
	push bc			;bf47
	call borra_buffer		;bf48
	call pinta_estrellas		;bf4b
	call mueve_metralla		;bf4e
	call vuelca_pantalla		;bf51
	pop bc			;bf54
	djnz L_BF47		;bf55
	call borra_buffer		;bf57
	call pinta_estrellas		;bf5a
	call vuelca_pantalla		;bf5d
	ld bc,00000h		;bf60
	call espera		;bf63
	call espera		;bf66
	call espera		;bf69
	jp L_A2D2		;bf6c
mueve_metralla:		; Mueve y pinta las 200 particulas del final feliz: posicion+velocidad en un solo add hl,de, poda fuera de pantalla, y 4 filas de brillo al azar en el buffer
	ld ix,0bfebh		;bf6f
	ld c,0c8h		;bf73
L_BF75:
	ld e,(ix+000h)		;bf75
	ld d,(ix+001h)		;bf78
	ld l,(ix+002h)		;bf7b
	ld h,(ix+003h)		;bf7e
	add hl,de		;bf81
	ld a,h			;bf82
	cp 0a0h			;bf83
	jr nc,L_BFAD		;bf85
	ld a,l			;bf87
	cp 0c0h			;bf88
	jr nc,L_BFAD		;bf8a
	ld (ix+002h),l		;bf8c
	ld (ix+003h),h		;bf8f
	srl l			;bf92
	srl l			;bf94
	srl l			;bf96
	call buffer_dir		;bf98
	ld de,00018h		;bf9b
	ld b,004h		;bf9e
L_BFA0:
	call azar		;bfa0
	and 03ch		;bfa3
	ld (hl),a		;bfa5
	and 018h		;bfa6
	out (0feh),a		;bfa8   ; FOSIL DEL SPECTRUM: 0xFE es el puerto del borde (y altavoz) del Spectrum; en MSX este out no hace nada
	add hl,de		;bfaa
	djnz L_BFA0		;bfab
L_BFAD:
	ld de,00004h		;bfad
	add ix,de		;bfb0
	dec c			;bfb2
	jr nz,L_BF75		;bfb3
	ret			;bfb5
siembra_metralla:		; Siembra las 200 particulas de la nave insignia explotando: dx -7..+8, dy -13..+2 sesgado hacia ARRIBA (metralla en fuente), tabla en 0xBFEB
	ld ix,0bfebh		;bfb6
	ld b,0c8h		;bfba
L_BFBC:
	call posicion_al_azar		;bfbc
L_BFBF:
	call azar		;bfbf
	and 00fh		;bfc2
	sub 007h		;bfc4
	jr z,L_BFBF		;bfc6
	ld (ix+000h),a		;bfc8
L_BFCB:
	call azar		;bfcb
	and 00fh		;bfce
	sub 00dh		;bfd0
	jr z,L_BFCB		;bfd2
	dec a			;bfd4
	jr z,L_BFCB		;bfd5
	ld (ix+001h),a		;bfd7
	ld a,h			;bfda
	sub 020h		;bfdb
	ld (ix+002h),l		;bfdd
	ld (ix+003h),a		;bfe0
	ld de,00004h		;bfe3
	add ix,de		;bfe6
	djnz L_BFBC		;bfe8
	ret			;bfea

; ----------------------------------------------------------------------
; DATOS relleno: (22 B; 22 de 22 bytes son 0xFF)
;   0xbfeb..0xc001  (22 bytes)
; DATOS graficos: (987 B; racha 10.91, entropia 1.35, 29 valores: rachas mas largas que el azar)
;   0xc001..0xc3dc  (987 bytes)
; ----------------------------------------------------------------------
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfeb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bffb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c00b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c01b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c02b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c03b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c04b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c05b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c06b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c07b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c08b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c09b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c0ab  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c0bb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c0cb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c0db  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c0eb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c0fb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c10b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c11b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c12b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c13b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c14b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c15b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c16b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c17b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c18b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c19b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c1ab  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c1bb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c1cb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c1db  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c1eb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c1fb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c20b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c21b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c22b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c23b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c24b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c25b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c26b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c27b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c28b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c29b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c2ab  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c2bb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c2cb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c2db  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c2eb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c2fb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c30b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c31b  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c32b  ................
	defb 021h,021h,021h,020h,046h,045h,04ch,049h,043h,049h,044h,041h,044h,045h,053h,020h	; c33b  !!! FELICIDADES 
	defb 021h,021h,021h,00dh,00dh,048h,041h,053h,020h,043h,04fh,04eh,053h,045h,047h,055h	; c34b  !!!..HAS CONSEGU
	defb 049h,044h,04fh,020h,044h,045h,053h,054h,052h,055h,049h,052h,00dh,00dh,04ch,04fh	; c35b  IDO DESTRUIR..LO
	defb 053h,020h,043h,045h,04eh,054h,052h,04fh,053h,020h,050h,052h,049h,04eh,043h,049h	; c36b  S CENTROS PRINCI
	defb 050h,041h,04ch,045h,053h,00dh,00dh,020h,020h,044h,045h,020h,04ch,041h,020h,04eh	; c37b  PALES..  DE LA N
	defb 041h,056h,045h,020h,049h,04eh,053h,049h,047h,04eh,049h,041h,02ch,00dh,00dh,020h	; c38b  AVE INSIGNIA,.. 
	defb 059h,020h,041h,044h,045h,04dh,041h,053h,020h,04ch,04fh,047h,052h,041h,053h,054h	; c39b  Y ADEMAS LOGRAST
	defb 045h,020h,048h,055h,049h,052h,00dh,00dh,001h,00bh,054h,052h,041h,053h,020h,045h	; c3ab  E HUIR....TRAS E
	defb 04ch,04ch,04fh,02eh,00dh,014h,014h,00dh,020h,02eh,02eh,02eh,059h,041h,020h,045h	; c3bb  LLO..... ...YA E
	defb 052h,045h,053h,020h,055h,04eh,020h,048h,045h,052h,04fh,045h,02eh,02eh,02eh,00dh	; c3cb  RES UN HEROE....
	defb 000h	; c3db  .

; ======================================================================
; CODIGO 0xc3dc..0xc459  (125 bytes)
; ======================================================================


posicion_al_azar:		; Saca una posicion al azar dentro del area de juego, repitiendo la tirada hasta que cae dentro: la columna entre 0x18 y 0xA7 (azar por debajo de 0x90) y la fila entre 0x98 y 0xBF (azar and 0x3F por debajo de 0x28)
	call azar		;c3dc
	cp 090h			;c3df
	jr nc,posicion_al_azar		;c3e1
	add a,018h		;c3e3
	ld l,a			;c3e5
L_C3E6:
	call azar		;c3e6
	and 03fh		;c3e9
	cp 028h			;c3eb
	jr nc,L_C3E6		;c3ed
	add a,098h		;c3ef
	ld h,a			;c3f1
	push hl			;c3f2
	ld a,h			;c3f3
	sub 020h		;c3f4
	ld h,a			;c3f6
	srl l			;c3f7
	srl l			;c3f9
	srl l			;c3fb
	call buffer_dir		;c3fd
	ld a,(hl)		;c400
	and 0e7h		;c401
	pop hl			;c403
	jr z,posicion_al_azar		;c404
	ret			;c406
fogonazo_final:		; El destello del final feliz: rellena la tabla de colores cuatro veces seguidas -0x99, 0xAA, 0xFF y 0xF1, que es el color normal- justo antes de la metralla
	ld a,099h		;c407
	ld iy,00bb8h		;c409
	call rellena_colores		;c40d
	ld a,0aah		;c410
	call rellena_colores		;c412
	ld a,0ffh		;c415
	call rellena_colores		;c417
	xor a			;c41a
	ld a,0f1h		;c41b
	call rellena_colores		;c41d
	ret			;c420
copia_al_buffer:		; Copia 720 bytes de 0x6285 al buffer en 0x4B43, en tiras de 18 con un salto de 6: 18 + 6 = 24, el ancho del buffer, o sea 40 filas de 18 bytes centradas en la banda C
	ld hl,06285h		;c421
	ld bc,002d0h		;c424
	ld de,04b43h		;c427
L_C42A:
	ldi			;c42a
	ldi			;c42c
	ldi			;c42e
	ldi			;c430
	ldi			;c432
	ldi			;c434
	ldi			;c436
	ldi			;c438
	ldi			;c43a
	ldi			;c43c
	ldi			;c43e
	ldi			;c440
	ldi			;c442
	ldi			;c444
	ldi			;c446
	ldi			;c448
	ldi			;c44a
	ldi			;c44c
	ret po			;c44e
	push hl			;c44f
	ld hl,00006h		;c450
	add hl,de		;c453
	ex de,hl		;c454
	pop hl			;c455
	jp L_C42A		;c456

; ----------------------------------------------------------------------
; DATOS variables: (17 B): eran 5 B de "relleno o resto" mas 12 que el
;   0xc459..0xc46a  (17 bytes)
; DATOS los: CUATRO COLORES de la fase (E1/B1/A1/71, tinta sobre negro): el arranque del nivel elige uno AL AZAR (call azar / and 3 en 0xA48F, HL = 0xC46A + n en 0xA494) y L_D31C lo aplica. Por eso la fase de a pie no siempre se ve del mismo color. (Estuvo como "sin clasificar: no se referencian desde ningun sitio", y la referencia existia: el ld de,0c46ah de 0xA494)
;   0xc46a..0xc46e  (4 bytes)
; ----------------------------------------------------------------------
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,010h	; c459  ................
	defb 000h,0e1h,0b1h,0a1h,071h	; c469  ....q

; ======================================================================
; CODIGO 0xc46e..0xc8f7  (1161 bytes)
; ======================================================================


interrupcion:		; El epilogo de la interrupcion, enganchado en H.TIMI: `pop hl` para tirar la vuelta a la ROM, una llamada al motor de sonido y los diez pares de registros desapilados en orden. Gemela de la de la fase de naves, 19 de 21 bytes
	di			;c46e
	pop hl			;c46f
	call tic_sonido		;c470
	pop ix			;c473
	pop iy			;c475
	pop af			;c477
	pop bc			;c478
	pop de			;c479
	pop hl			;c47a
	ex af,af'		;c47b
	exx			;c47c
	pop af			;c47d
	pop bc			;c47e
	pop de			;c47f
	pop hl			;c480
	ei			;c481
	ret			;c482
arranca_musica:		; La musica de esta mitad: canal 0 a 0xCE45, canal 1 a 0xCF3D y canal 2 a 0xCFBE, y CAE en sonido_off, o sea que deja el sonido cerrado detras
	ld a,080h		;c483
	ld de,0ce45h		;c485
	call arranca_guion		;c488
	inc a			;c48b
	ld de,0cf3dh		;c48c
	call arranca_guion		;c48f
	ld a,002h		;c492
	ld de,0cfbeh		;c494
	call arranca_guion		;c497
sonido_off:		; Cierra el sonido metiendo un `ret` (0xC9) en la cabecera de arranca_guion y arranca_guion_libre, igual que el 0xE186 del bloque de naves
	ld a,0c9h		;c49a
	ld (arranca_guion),a	;c49c
	ld (arranca_guion_libre),a		;c49f
	ret			;c4a2
arranca_guion_libre:		; arranca_guion, pero si el canal pedido esta ocupado recorre los TRES buscando uno libre, y solo pisa el pedido si no queda ninguno
	di			;c4a3
	push af			;c4a4
	push de			;c4a5
	and 07fh		;c4a6
	ld de,0002eh		;c4a8
	call mul_a_de		;c4ab
	ld de,0d068h		;c4ae
	add hl,de		;c4b1
	push hl			;c4b2
	ld a,(hl)		;c4b3
	inc hl			;c4b4
	or (hl)			;c4b5
	jr z,L_C4CA		;c4b6
	ld d,003h		;c4b8
	ld hl,0d068h		;c4ba
	ld bc,0002eh		;c4bd
L_C4C0:
	inc hl			;c4c0
	ld a,(hl)		;c4c1
	dec hl			;c4c2
	or (hl)			;c4c3
	jr z,L_C4CD		;c4c4
	add hl,bc		;c4c6
	dec d			;c4c7
	jr nz,L_C4C0		;c4c8
L_C4CA:
	pop hl			;c4ca
	jr L_C4DF		;c4cb
L_C4CD:
	pop de			;c4cd
	jr L_C4DF		;c4ce
arranca_guion:		; Pone el guion DE a sonar en el canal A (bit 7 = volver sin `ei`): borra los 46 bytes de su estado en 0xD068+canal*46 y siembra el puntero de ejecucion y el de inicio
	di			;c4d0
arranca_guion_sin_di:		; La entrada de arranca_guion saltandose su `di`, para el unico cliente que ya lo ha hecho el mismo (0xA5BC)
	push af			;c4d1
	push de			;c4d2
	and 07fh		;c4d3
	ld de,0002eh		;c4d5
	call mul_a_de		;c4d8
	ld de,0d068h		;c4db
	add hl,de		;c4de
L_C4DF:
	push hl			;c4df
	xor a			;c4e0
	ld b,02eh		;c4e1
L_C4E3:
	ld (hl),a		;c4e3
	inc hl			;c4e4
	djnz L_C4E3		;c4e5
	pop hl			;c4e7
	pop de			;c4e8
	ld (hl),e		;c4e9
	inc hl			;c4ea
	ld (hl),d		;c4eb
	inc hl			;c4ec
	ld (hl),e		;c4ed
	inc hl			;c4ee
	ld (hl),d		;c4ef
	ld a,001h		;c4f0
	ld (0d10dh),a		;c4f2
	pop af			;c4f5
	push af			;c4f6
	and 07fh		;c4f7
	ld hl,0d114h		;c4f9
	add a,l			;c4fc
	ld l,a			;c4fd
	ld a,h			;c4fe
	adc a,000h		;c4ff
	ld h,a			;c501
	ld (hl),000h		;c502
	pop af			;c504
	or a			;c505
	ret m			;c506
	ei			;c507
	ret			;c508
tic_sonido:		; El motor del sonido, y lo unico que hace la interrupcion: recorre los tres canales desde 0xD068, gasta la duracion y, al agotarse, calla el canal y va a por el siguiente byte del guion -comando si es 0x80 o mas, nota si no, sumandole la transposicion del canal-; luego corre las envolventes de volumen y de tono y vuelca el canal al bloque sombra de 0xD100
	push af			;c509
	ld b,003h		;c50a
	xor a			;c50c
	ld ix,0d068h		;c50d
	ld de,0d100h		;c511
	ld hl,0d108h		;c514
L_C517:
	push af			;c517
	push hl			;c518
	push de			;c519
	push bc			;c51a
	ld (0d10ch),a		;c51b
	ld a,(ix+004h)		;c51e
	or (ix+005h)		;c521
	jp nz,L_C582		;c524
	xor a			;c527
	call mezclador_canal		;c528
	ld c,(ix+002h)		;c52b
	ld b,(ix+003h)		;c52e
	ld a,b			;c531
	or c			;c532
	jp z,L_C63B		;c533
L_C536:
	ld a,(bc)		;c536
	cp 080h			;c537
	jp c,L_C545		;c539
	sub 080h		;c53c
	ld hl,0cabeh		;c53e
	call lee_puntero		;c541
	jp (hl)			;c544
L_C545:
	push af			;c545
	call estado_canal_actual		;c546
	pop af			;c549
	add a,(hl)		;c54a
	ld hl,0c9feh		;c54b
	call lee_puntero		;c54e
	ld (ix+00ah),l		;c551
	ld (ix+00bh),h		;c554
	inc bc			;c557
L_C558:
	ld a,(ix+008h)		;c558
	call mezclador_canal		;c55b
	call carga_envolvente_1		;c55e
	ld (ix+02ah),000h	;c561
	call carga_envolvente_2		;c565
	ld (ix+02bh),000h	;c568
	ld (ix+02ch),000h	;c56c
L_C570:
	ld (ix+002h),c		;c570
	ld (ix+003h),b		;c573
	ld l,(ix+006h)		;c576
	ld h,(ix+007h)		;c579
	ld (ix+004h),l		;c57c
	ld (ix+005h),h		;c57f
L_C582:
	ld l,(ix+004h)		;c582
	ld h,(ix+005h)		;c585
	dec hl			;c588
	ld (ix+004h),l		;c589
	ld (ix+005h),h		;c58c
	push ix			;c58f
	pop iy			;c591
	ld d,002h		;c593
	ld c,000h		;c595
L_C597:
	ld a,(iy+00ch)		;c597
	or a			;c59a
	jr z,L_C5A4		;c59b
	dec a			;c59d
	ld (iy+00ch),a		;c59e
	inc c			;c5a1
	jr L_C5C5		;c5a2
L_C5A4:
	ld a,(iy+00eh)		;c5a4
	or a			;c5a7
	jr z,L_C5C0		;c5a8
	dec a			;c5aa
	ld (iy+00eh),a		;c5ab
	ld a,(ix+02ah)		;c5ae
	add a,(iy+01bh)		;c5b1
	ld (ix+02ah),a		;c5b4
	ld a,(iy+020h)		;c5b7
	ld (iy+00ch),a		;c5ba
	inc c			;c5bd
	jr L_C5C5		;c5be
L_C5C0:
	inc iy			;c5c0
	dec d			;c5c2
	jr nz,L_C597		;c5c3
L_C5C5:
	ld a,c			;c5c5
	or a			;c5c6
	jr nz,L_C5D0		;c5c7
	bit 0,(ix+02dh)		;c5c9
	call nz,carga_envolvente_1	;c5cd
L_C5D0:
	push ix			;c5d0
	pop iy			;c5d2
	ld d,003h		;c5d4
	ld c,000h		;c5d6
L_C5D8:
	ld a,(iy+010h)		;c5d8
	or a			;c5db
	jr z,L_C5E5		;c5dc
	dec a			;c5de
	ld (iy+010h),a		;c5df
	inc c			;c5e2
	jr L_C630		;c5e3
L_C5E5:
	ld a,(iy+013h)		;c5e5
	or a			;c5e8
	jr z,L_C62B		;c5e9
	dec a			;c5eb
	ld (iy+013h),a		;c5ec
	ld a,(iy+01dh)		;c5ef
	or a			;c5f2
	jp p,L_C60F		;c5f3
	ld a,(iy+01dh)		;c5f6
	cpl			;c5f9
	inc a			;c5fa
	ld e,a			;c5fb
	ld a,(ix+02bh)		;c5fc
	sub e			;c5ff
	ld (ix+02bh),a		;c600
	ld a,(ix+02ch)		;c603
	sbc a,000h		;c606
	and 00fh		;c608
	ld (ix+02ch),a		;c60a
	jr L_C622		;c60d
L_C60F:
	ld a,(ix+02bh)		;c60f
	add a,(iy+01dh)		;c612
	ld (ix+02bh),a		;c615
	ld a,(ix+02ch)		;c618
	adc a,000h		;c61b
	and 00fh		;c61d
	ld (ix+02ch),a		;c61f
L_C622:
	ld a,(iy+022h)		;c622
	ld (iy+010h),a		;c625
	inc c			;c628
	jr L_C630		;c629
L_C62B:
	inc iy			;c62b
	dec d			;c62d
	jr nz,L_C5D8		;c62e
L_C630:
	ld a,c			;c630
	or a			;c631
	jr nz,L_C63B		;c632
	bit 1,(ix+02dh)		;c634
	call nz,carga_envolvente_2	;c638
L_C63B:
	pop bc			;c63b
	pop de			;c63c
	pop hl			;c63d
	ld a,(ix+009h)		;c63e
	add a,(ix+02ah)		;c641
	and 00fh		;c644
	ld (hl),a		;c646
	ld a,(ix+00ah)		;c647
	add a,(ix+02bh)		;c64a
	ld (de),a		;c64d
	inc de			;c64e
	ld a,(ix+00bh)		;c64f
	adc a,(ix+02ch)		;c652
	ld (de),a		;c655
	inc de			;c656
	push de			;c657
	ld de,0002eh		;c658
	add ix,de		;c65b
	pop de			;c65d
	pop af			;c65e
	inc a			;c65f
	inc hl			;c660
	dec b			;c661
	jp nz,L_C517		;c662
	ld iy,0d0f2h		;c665
	ld d,002h		;c669
	ld c,000h		;c66b
L_C66D:
	ld a,(iy+000h)		;c66d
	or a			;c670
	jr z,L_C67A		;c671
	dec a			;c673
	ld (iy+000h),a		;c674
	inc c			;c677
	jr L_C69B		;c678
L_C67A:
	ld a,(iy+002h)		;c67a
	or a			;c67d
	jr z,L_C696		;c67e
	dec a			;c680
	ld (iy+002h),a		;c681
	ld a,(0d0feh)		;c684
	add a,(iy+006h)		;c687
	ld (0d0feh),a		;c68a
	ld a,(iy+008h)		;c68d
	ld (iy+000h),a		;c690
	inc c			;c693
	jr L_C69B		;c694
L_C696:
	inc iy			;c696
	dec d			;c698
	jr nz,L_C66D		;c699
L_C69B:
	ld a,c			;c69b
	or a			;c69c
	jr nz,L_C6A7		;c69d
	ld a,(0d0fch)		;c69f
	bit 2,a			;c6a2
	call nz,refresca_globales_sonido	;c6a4
L_C6A7:
	ld a,(0d0fdh)		;c6a7
	ld e,a			;c6aa
	ld a,(0d0feh)		;c6ab
	add a,e			;c6ae
	ld (0d106h),a		;c6af
	call vuelca_psg		;c6b2
	pop af			;c6b5
	ret			;c6b6
carga_envolvente_1:		; Copia dos parejas de la plantilla del instrumento a las variables vivas; identica byte a byte a la de la fase de naves
	push ix			;c6b7
	ld d,002h		;c6b9
L_C6BB:
	ld a,(ix+020h)		;c6bb
	ld (ix+00ch),a		;c6be
	ld a,(ix+016h)		;c6c1
	ld (ix+00eh),a		;c6c4
	inc ix			;c6c7
	dec d			;c6c9
	jr nz,L_C6BB		;c6ca
	pop ix			;c6cc
	ret			;c6ce
carga_envolvente_2:		; Lo mismo con tres parejas; tambien identica
	ld d,003h		;c6cf
	push ix			;c6d1
L_C6D3:
	ld a,(ix+022h)		;c6d3
	ld (ix+010h),a		;c6d6
	ld a,(ix+018h)		;c6d9
	ld (ix+013h),a		;c6dc
	inc ix			;c6df
	dec d			;c6e1
	jr nz,L_C6D3		;c6e2
	pop ix			;c6e4
	ret			;c6e6
refresca_globales_sonido:		; Refresca las variables globales del interprete desde 0xD0F2, que es 0xD068 + 3*46: justo detras del tercer estado de canal
	ld d,002h		;c6e7
	push iy			;c6e9
	ld iy,0d0f2h		;c6eb
L_C6EF:
	ld a,(iy+008h)		;c6ef
	ld (iy+000h),a		;c6f2
	ld a,(iy+004h)		;c6f5
	ld (iy+002h),a		;c6f8
	inc iy			;c6fb
	dec d			;c6fd
	jr nz,L_C6EF		;c6fe
	pop iy			;c700
	ret			;c702
op_volumen:		; 0x80 n: mete el argumento en (ix+009), el volumen base de la voz. Quien lo usa es el volcado de 0xC63E, que le suma la envolvente de volumen (ix+02A), lo recorta con `and 00fh` y lo deja en 0xD108+canal; sus 57 argumentos en la musica del bloque van de 0x00 a 0x0F, o sea que ya vienen cabiendo en los cuatro bits
	inc bc			;c703
	ld a,(bc)		;c704
	ld (ix+009h),a		;c705
	inc bc			;c708
	jp L_C536		;c709
op_duracion:		; 0x83 n: (ix+006/007) = argumento por el tempo, con mul_a_de y el tempo leido de 0xD10B (`ld de,(0d10bh) / ld d,000h`: solo el byte bajo, porque el alto seria 0xD10C, que es el numero de canal). Es el valor de RECARGA, no la cuenta atras: quien lo copia a (ix+004/005) es 0xC570
	inc bc			;c70c
	ld a,(bc)		;c70d
	ld de,(0d10bh)		;c70e
	ld d,000h		;c712
	call mul_a_de		;c714
	ld (ix+006h),l		;c717
	ld (ix+007h),h		;c71a
	inc bc			;c71d
	jp L_C536		;c71e
op_tono_ruido:		; 0x81 n: (ix+008) = argumento and 0x09, que son los bits 0 y 3, la pareja tono/ruido del registro 7 del PSG. OJO AL SENTIDO: el mezclador de 0xC83E aplica el argumento COMPLEMENTADO, asi que un bit PUESTO enciende el generador. Lo confirma la musica, cuyos 28 argumentos son solo 0x01 (tono, 19 veces), 0x08 (ruido, 8) y 0x09 (los dos, 1)
	inc bc			;c721
	ld a,(bc)		;c722
	and 009h		;c723
	ld (ix+008h),a		;c725
	inc bc			;c728
	jp L_C536		;c729
op_fin:		; 0x8B: cierra la voz. Borra los 46 bytes de su estado (`ld b,02eh`), pone a cero su transposicion en 0xD114+canal y repone el `di` (0xF3) en la cabecera de arranca_guion y arranca_guion_libre, deshaciendo el `ret` (0xC9) que planto sonido_off; y si el canal que acaba es el mismo que anoto op_efecto en 0xD0FF, limpia ademas 0xD0F2-0xD0FC y 0xD0FE, saltandose 0xD0FD -el periodo de ruido- porque el `ldir` es de diez. Es UN BYTE mas largo que el 0xE418 de naves, y esa es la razon de que los manejadores de aqui en adelante lleven delta 0x1CEB y los anteriores 0x1CEC
	push ix			;c72c
	pop hl			;c72e
	xor a			;c72f
	ld b,02eh		;c730
L_C732:
	ld (hl),a		;c732
	inc hl			;c733
	djnz L_C732		;c734
	ld a,0f3h		;c736
	ld (arranca_guion_libre),a		;c738
	ld (arranca_guion),a	;c73b
	call estado_canal_actual		;c73e
	ld (hl),b		;c741
	ld hl,0d0ffh		;c742
	xor (hl)		;c745
	jp nz,L_C63B		;c746
	ld hl,0d0f2h		;c749
	ld de,0d0f3h		;c74c
	ld bc,0000ah		;c74f
	ld (hl),a		;c752
	ldir			;c753
	inc de			;c755
	ld (de),a		;c756
	jp L_C63B		;c757
op_tempo:		; 0x85 n: 0xD10B = 6000 / (argumento * 8), con mul_a_de para el producto y la division de 0xC8BB, guardando solo el byte bajo del cociente. Es el multiplicador que aplica op_duracion, asi que a MAS argumento, tempo mas corto y musica mas rapida; sus diez apariciones son 0x32, 0xA0 (ocho veces) y 0xFF, que dan 15, 4 y 2
	inc bc			;c75a
	ld a,(bc)		;c75b
	push bc			;c75c
	ld de,00008h		;c75d
	call mul_a_de		;c760
	ld bc,01770h		;c763
	push hl			;c766
	pop de			;c767
	call div_bc_de		;c768
	ld a,c			;c76b
	ld (0d10bh),a		;c76c
	pop bc			;c76f
	inc bc			;c770
	jp L_C536		;c771
op_ruido:		; 0x88 n: 0xD0FD = argumento and 0x1F, los cinco bits del periodo de ruido del PSG, y de paso rearma la envolvente global con refresca_globales_sonido; lo que llega al chip es 0xD0FD + 0xD0FE, sumados en 0xC6A7. El BIT 7 del argumento decide por donde sigue el interprete: puesto, vuelve al bucle de comandos y solo cambia el parametro; a cero, cae en el ataque de 0xC558 y consume una duracion como si fuera una nota. De sus doce apariciones, once llevan el bit 7 a cero
	inc bc			;c774
	ld a,(bc)		;c775
	push af			;c776
	and 01fh		;c777
	ld (0d0fdh),a		;c779
	call refresca_globales_sonido		;c77c
	pop af			;c77f
	inc bc			;c780
	or a			;c781
	jp m,L_C536		;c782
	jp L_C558		;c785
op_liga:		; 0x84: cuatro bytes y sin argumento. En vez de volver al bucle de comandos salta a 0xC570, saltandose entero el ataque de 0xC558-0xC56F: ni mezclador, ni carga_envolvente_1/2, ni (ix+02A/02B/02C) a cero. Solo recarga la cuenta atras, o sea que lo que estuviera sonando sigue igual y unicamente se cuenta otra duracion. Aparece 16 veces en la musica y se ejecuta 554 en el replay
	inc bc			;c788
	jp L_C570		;c789
op_bucle:		; 0x82: recarga el puntero de ejecucion (ix+002/003) con el de inicio (ix+000/001) y vuelve a empezar el guion: dentro de una cancion es un bucle interno, NO un terminador. Solo cae en op_fin si se dan las dos condiciones de su cabecera, que el canal sea el 1 y que 0xD10D valga cero. Ese byte lo pone a 1 arranca_guion en 0xC4F2 cada vez que se lanza algo, y el unico que lo apaga es 0xB6AF, que justo despues se queda esperando a que se borren los dos primeros bytes del estado del canal 1: apagar 0xD10D es como se le pide a la musica que termine
	ld a,(0d10ch)		;c78c
	dec a			;c78f
	jr nz,L_C798		;c790
	ld a,(0d10dh)		;c792
	and a			;c795
	jr z,op_fin		;c796
L_C798:
	ld c,(ix+000h)		;c798
	ld b,(ix+001h)		;c79b
	ld (ix+002h),c		;c79e
	ld (ix+003h),b		;c7a1
	jp L_C536		;c7a4
op_banderas:		; 0x8A n: enciende bits con OR, sin apagar ninguno, y mete el argumento entero en las banderas del canal (ix+02D) y en las globales 0xD0FC. Son los bits de REPETICION de envolvente, y solo se leen tres en todo el bloque: el bit 0 hace que 0xC5C9 vuelva a llamar a carga_envolvente_1 cuando la envolvente de volumen se agota, el bit 1 que 0xC634 rellame a carga_envolvente_2 con la de tono, y el bit 2 que 0xC69F rellame a refresca_globales_sonido con la de ruido. Los apagan op_instrumento (`res 0` y `res 1`) y op_efecto (`res 2`)
	inc bc			;c7a7
	ld a,(bc)		;c7a8
	ld e,a			;c7a9
	or (ix+02dh)		;c7aa
	ld (ix+02dh),a		;c7ad
	ld a,(0d0fch)		;c7b0
	or e			;c7b3
	ld (0d0fch),a		;c7b4
	inc bc			;c7b7
	jp L_C536		;c7b8
op_instrumento:		; 0x87 n: copia los quince bytes del instrumento n -que vive en 0xC8F7 + n*15- a (ix+016) y siguientes, que son las dos fases de la envolvente de volumen y las tres de la de tono, con su cuenta, su paso y su recarga cada una; de paso apaga los bits 0 y 1 de (ix+02D) y pone a cero los contadores (ix+00C/00D) y (ix+010/011/012) y los acumuladores (ix+02A) y (ix+02B/02C). La musica pide 47 veces los instrumentos 0 a 12 y el 15
	inc bc			;c7bb
	res 0,(ix+02dh)		;c7bc
	res 1,(ix+02dh)		;c7c0
	ld a,(bc)		;c7c4
	ld de,0000fh		;c7c5
	call mul_a_de		;c7c8
	ld de,0c8f7h		;c7cb
	add hl,de		;c7ce
	push ix			;c7cf
	ld d,00fh		;c7d1
L_C7D3:
	ld a,(hl)		;c7d3
	ld (ix+016h),a		;c7d4
	inc hl			;c7d7
	inc ix			;c7d8
	dec d			;c7da
	jp nz,L_C7D3		;c7db
	pop ix			;c7de
	inc bc			;c7e0
	ld (ix+00ch),000h	;c7e1
	ld (ix+00dh),000h	;c7e5
	ld (ix+010h),000h	;c7e9
	ld (ix+011h),000h	;c7ed
	ld (ix+012h),000h	;c7f1
	ld (ix+02ah),000h	;c7f5
	ld (ix+02bh),000h	;c7f9
	ld (ix+02ch),000h	;c7fd
	jp L_C536		;c801
op_efecto:		; 0x89 n: arranca el barrido del RUIDO. Copia los seis bytes del efecto n -de 0xC9E7 + n*6- a las globales 0xD0F6-0xD0FB, que son las dos fases de la envolvente que va sumando en 0xD0FE; pone a cero 0xD0F2/0xD0F3 y el propio 0xD0FE, apaga el bit 2 de las banderas 0xD0FC -el que hace que la envolvente se recargue sola- y anota en 0xD0FF el canal que lo lanzo, que es a quien op_fin le pedira cuentas. La musica solo pide los efectos 0 y 3, y en el replay entero salta UNA vez
	inc bc			;c804
	ld a,(0d0fch)		;c805
	res 2,a			;c808
	ld (0d0fch),a		;c80a
	ld a,(bc)		;c80d
	ld de,00006h		;c80e
	call mul_a_de		;c811
	ld de,0c9e7h		;c814
	add hl,de		;c817
	ld iy,0d0f2h		;c818
	ld (iy+000h),000h	;c81c
	ld (iy+001h),000h	;c820
	ld d,006h		;c824
L_C826:
	ld a,(hl)		;c826
	ld (iy+004h),a		;c827
	inc hl			;c82a
	inc iy			;c82b
	dec d			;c82d
	jr nz,L_C826		;c82e
	xor a			;c830
	ld (0d0feh),a		;c831
	inc bc			;c834
	ld a,(0d10ch)		;c835
	ld (0d0ffh),a		;c838
	jp L_C536		;c83b
mezclador_canal:		; Enciende o apaga el tono y el ruido del canal que dice 0xD10C en la copia del registro 7 del PSG (0xD107): parte de D = 0x09 -bit 0 el tono y bit 3 el ruido del canal 0- y de E = complemento de A, los desplaza a la izquierda tantas veces como el numero de canal metiendo unos, y remata con `or d / and e`, o sea apaga la pareja entera y vuelve a encender solo lo que pide A. La llama tic_sonido dos veces por canal: con A=0 para callar el canal antes de leer el guion y con A=(ix+008) al atacar la nota. Gemela de la 0xE529 de la fase de naves
	push de			;c83e
	cpl			;c83f
	ld e,a			;c840
	ld d,009h		;c841
	ld a,(0d10ch)		;c843
L_C846:
	dec a			;c846
	jp m,L_C851		;c847
	scf			;c84a
	rl e			;c84b
	sla d			;c84d
	jr L_C846		;c84f
L_C851:
	ld a,(0d107h)		;c851
	or d			;c854
	and e			;c855
	ld (0d107h),a		;c856
	pop de			;c859
	ret			;c85a
op_tempo1:		; 0x86: el tempo a 1, sin argumento: la unidad de tiempo mas corta posible, una interrupcion por duracion. Sale nueve veces escrito en la musica y se ejecuta 701 en el replay
	ld a,001h		;c85b
	ld (0d10bh),a		;c85d
	inc bc			;c860
	jp L_C536		;c861
op_llama_frase:		; 0x8C n: el CALL del interprete. Guarda en 0xD10E + canal*2 el puntero al byte que sigue al operando y mete en BC la frase n leida de la tabla de veinte punteros de 0xCADC. Es de UN SOLO NIVEL -tres huecos de 2 B, uno por canal, y 0xD10E + 3*2 = 0xD114, donde ya empieza la tabla de transposiciones-, y a la musica le basta: es con diferencia el comando mas frecuente, 208 apariciones, y ninguna de las veinte frases lleva un 0x8C dentro
	ld a,(0d10ch)		;c864
	inc bc			;c867
	add a,a			;c868
	ld l,a			;c869
	ld h,000h		;c86a
	ld a,(bc)		;c86c
	inc bc			;c86d
	ld de,0d10eh		;c86e
	add hl,de		;c871
	ld (hl),c		;c872
	inc hl			;c873
	ld (hl),b		;c874
	ld hl,0cadch		;c875
	call lee_puntero		;c878
	ld b,h			;c87b
	ld c,l			;c87c
	jp L_C536		;c87d
op_vuelve:		; 0x8D: el RET del interprete, sin argumento. Recupera BC del hueco de 0xD10E + canal*2 que dejo op_llama_frase y sigue desde ahi. Por eso diecinueve de las veinte entradas de la tabla de frases acaban en 0x8D; la vigesima (0xCD53) acaba en 0x8B porque no es una frase sino un guion entero, el sonido que alta_objeto_acbb lanza al canal 2, y ninguno de los 208 comandos 0x8C la pide: todos van del 0 al 18
	ld a,(0d10ch)		;c880
	add a,a			;c883
	ld l,a			;c884
	ld h,000h		;c885
	ld de,0d10eh		;c887
	add hl,de		;c88a
	ld c,(hl)		;c88b
	inc hl			;c88c
	ld b,(hl)		;c88d
	jp L_C536		;c88e
op_transporte:		; 0x8E n: escribe el argumento en 0xD114 + canal, que es la TRANSPOSICION de la voz: el lector de notas se lo suma al numero de nota antes de buscar el periodo en la tabla de 0xC9FE (`call estado_canal_actual / add a,(hl)` en 0xC546). La musica lo usa 34 veces, con 2, 5, 9, 11 y 14 hacia arriba y con 0xF6, 0xFD y 0xFF -o sea -10, -3 y -1 semitonos- hacia abajo
	inc bc			;c891
	call estado_canal_actual		;c892
	ld a,(bc)		;c895
	inc bc			;c896
	ld (hl),a		;c897
	jp L_C536		;c898
estado_canal_actual:		; HL = 0xD114 + el numero que haya en 0xD10C: la entrada del canal que el interprete esta atendiendo
	ld a,(0d10ch)		;c89b
	ld l,a			;c89e
	ld h,000h		;c89f
	ld de,0d114h		;c8a1
	add hl,de		;c8a4
	ret			;c8a5
mul_a_de:		; HL = A * DE por desplazamiento y suma; identica byte a byte a la del bloque de naves
	ld hl,00000h		;c8a6
	and a			;c8a9
	ret z			;c8aa
	push bc			;c8ab
	ld b,008h		;c8ac
L_C8AE:
	srl a			;c8ae
	jr nc,L_C8B3		;c8b0
	add hl,de		;c8b2
L_C8B3:
	sla e			;c8b3
	rl d			;c8b5
	djnz L_C8AE		;c8b7
	pop bc			;c8b9
	ret			;c8ba
div_bc_de:		; BC = BC / DE por restas y desplazamientos, dieciseis vueltas de `rl c / rla / adc hl,hl / sbc hl,de`, dejando el resto en HL y conservando AF; simulada contra 4000 divisiones al azar da el cociente y el resto exactos. Su unico cliente es op_tempo, que la llama con BC = 0x1770 = 6000 y DE = argumento*8. Gemela de la 0xE5A6 de la fase de naves
	push af			;c8bb
	ld hl,00000h		;c8bc
	ld a,b			;c8bf
	ld b,010h		;c8c0
L_C8C2:
	rl c			;c8c2
	rla			;c8c4
	adc hl,hl		;c8c5
	sbc hl,de		;c8c7
	jr nc,L_C8CC		;c8c9
	add hl,de		;c8cb
L_C8CC:
	ccf			;c8cc
	djnz L_C8C2		;c8cd
	rl c			;c8cf
	rla			;c8d1
	ld b,a			;c8d2
	pop af			;c8d3
	ret			;c8d4
lee_puntero:		; HL = la palabra que hay en HL + A*2; identica byte a byte a la del bloque de naves
	push af			;c8d5
	add a,a			;c8d6
	add a,l			;c8d7
	ld l,a			;c8d8
	jr nc,L_C8DC		;c8d9
	inc h			;c8db
L_C8DC:
	ld a,(hl)		;c8dc
	inc hl			;c8dd
	ld h,(hl)		;c8de
	ld l,a			;c8df
	pop af			;c8e0
	ret			;c8e1
vuelca_psg:		; Vuelca al PSG los once bytes del bloque sombra 0xD100-0xD10A, que son los registros 0 a 10 del chip -los tres periodos de tono, el del ruido, el mezclador y los tres volumenes-, alternando el numero de registro por el puerto 0xA0 y el dato por el 0xA1. La llama tic_sonido una sola vez por interrupcion, al final, con los tres canales ya resueltos. Sus dieciocho ultimos bytes (0xC8E5-0xC8F6) son los de 0xE5D0 de la fase de naves sin tocar una coma; lo unico distinto son los tres del `ld hl,0d100h`
	ld hl,0d100h		;c8e2
	ld a,000h		;c8e5
	ld d,00bh		;c8e7
L_C8E9:
	push af			;c8e9
	ld c,(hl)		;c8ea
	out (0a0h),a		;c8eb
	ld a,c			;c8ed
	out (0a1h),a		;c8ee
	pop af			;c8f0
	inc a			;c8f1
	inc hl			;c8f2
	dec d			;c8f3
	jr nz,L_C8E9		;c8f4
	ret			;c8f6

; ----------------------------------------------------------------------
; DATOS instrumentos: Tabla de instrumentos: 16 entradas de 15 B que el comando 0x87 copia a (ix+016), las dos fases de la envolvente de volumen y las tres de la de tono. La musica pide hasta el instrumento 15, o sea que las dieciseis hacen falta
;   0xc8f7..0xc9e7  (240 bytes)
; DATOS efectos_ruido: Tabla de efectos de ruido: entradas de 6 B que el comando 0x89 copia a 0xD0F6-0xD0FB. Caben TRES enteras y una cuarta a la que le falta el sexto byte, que ya es el primero de la tabla de notas. Ese byte prestado SI se copia -el bucle de op_efecto es de seis fijos, `ld d,006h`-, pero es inerte: cae en la espera de la segunda fase de la envolvente, y esa fase tiene cero pasos. La musica de este bloque pide la 0 y la 3, o sea que usa justamente la truncada
;   0xc9e7..0xc9fe  (23 bytes)
; DATOS la: TABLA DE NOTAS del interprete de sonido: 96 periodos de 16 bits, ocho octavas de do1 a si8. Es BYTE A BYTE la misma que la del juego de naves (0xE6E3), los 192 bytes. Estuvo dentro del rango declarado como graficos, que llegaba hasta 0xCAA0 y se pasaba
;   0xc9fe..0xcabe  (192 bytes)
; DATOS la: tabla de saltos de los QUINCE opcodes del interprete: 15 punteros de 2 B. Son los del juego de naves (0xE7A3) reubicados unos 0x1CEB, con una holgura de un byte segun el opcode porque el codigo no es copia exacta
;   0xcabe..0xcadc  (30 bytes)
; DATOS la: tabla de las VEINTE frases de musica: 20 punteros de 2 B. Los veinte son EXACTAMENTE los del juego de naves (0xE7C1) menos 0x1CE5, sin una sola excepcion
;   0xcadc..0xcb04  (40 bytes)
; DATOS LA: MUSICA DE LA FASE DE A PIE, 1380 B escritos en el lenguaje del interprete de sonido. El trazador se los tragaba como CODIGO -1318 de 1380, el 95,5 %- por una semilla mala en 0xCC3E, que cae dentro de un guion. Es el mismo error que se corrigio en el juego de naves y que aqui no se habia aplicado. PRUEBA de que es musica: recorriendo la zona con el lector del lenguaje salen 38 bloques, CERO bytes fuera del lenguaje, y el recorrido cierra clavado en 0xD068, que es donde empiezan los estados de canal. Si el numero de argumentos de un solo comando estuviera mal, no cerraria. Aqui habia cinco trozos declarados sueltos como "tabla" y "relleno" (0xCB0F, 0xCB26, 0xCBDB, 0xCC99, 0xCDC0) que eran cachos de esta misma musica
;   0xcb04..0xd068  (1380 bytes)
; DATOS variables: a cero (175 B), y los primeros 138 tienen nombre: son los TRES ESTADOS DE CANAL del interprete de sonido, de 46 B cada uno (0xD068, 0xD096, 0xD0C4), que es lo que resolvio el enigma de los "objetos de 46 bytes". Los 37 restantes (0xD0F2-0xD117) son las variables globales del interprete y las que el listado lee con ld a,(nn). Confirmado ademas desde fuera: al volcar la memoria justo tras la multicarga, los bytes que ya no coinciden con la cinta se agolpan aqui. El trazador contaba todo esto como codigo
;   0xd068..0xd117  (175 bytes)
; ----------------------------------------------------------------------
	defb 001h,00bh,032h,000h,000h,004h,0ffh,008h,000h,000h,000h,003h,000h,000h,000h,002h	; c8f7  ..2.............
	defb 00bh,001h,001h,000h,002h,0ffh,004h,0feh,000h,002h,007h,000h,000h,000h,00ah,000h	; c907  ................
	defb 000h,000h,000h,0ffh,000h,000h,000h,000h,003h,000h,000h,000h,000h,00fh,00fh,028h	; c917  ...............(
	defb 000h,000h,001h,0ffh,001h,000h,000h,000h,004h,001h,000h,000h,005h,00fh,000h,000h	; c927  ................
	defb 000h,003h,0ffh,000h,000h,000h,000h,002h,000h,000h,000h,00fh,005h,000h,000h,000h	; c937  ................
	defb 001h,0ffh,000h,000h,000h,001h,028h,000h,000h,000h,006h,00ch,01eh,000h,000h,002h	; c947  ......(.........
	defb 0ffh,000h,000h,000h,001h,004h,003h,000h,000h,005h,00fh,000h,000h,000h,003h,0ffh	; c957  ................
	defb 000h,000h,000h,000h,00fh,000h,000h,000h,00ah,000h,000h,000h,000h,0ffh,000h,000h	; c967  ................
	defb 000h,000h,002h,000h,000h,000h,000h,001h,001h,000h,000h,000h,000h,0f9h,000h,000h	; c977  ................
	defb 000h,003h,000h,000h,000h,000h,006h,000h,000h,000h,000h,0ffh,000h,000h,000h,000h	; c987  ................
	defb 00ah,000h,000h,000h,000h,003h,00ch,000h,000h,000h,001h,0ffh,000h,000h,000h,00ah	; c997  ................
	defb 00ah,000h,000h,000h,001h,006h,00fh,000h,000h,004h,0ffh,014h,000h,000h,000h,003h	; c9a7  ................
	defb 001h,000h,000h,00fh,000h,000h,000h,000h,0ffh,000h,000h,000h,000h,000h,000h,000h	; c9b7  ................
	defb 000h,000h,00fh,000h,000h,000h,000h,0ffh,000h,000h,000h,000h,004h,000h,000h,000h	; c9c7  ................
	defb 000h,002h,001h,000h,000h,000h,0feh,002h,000h,000h,000h,001h,002h,000h,000h,000h	; c9d7  ................
	defb 020h,000h,001h,000h,002h,000h,001h,008h,010h,0feh,000h,000h,020h,000h,0ffh,000h	; c9e7   ........... ...
	defb 014h,001h,01fh,000h,0ffh,032h,008h,05dh,00dh,09dh,00ch,0e7h,00bh,03ch,00bh,09bh	; c9f7  .....2.].....<..
	defb 00ah,003h,00ah,073h,009h,0ebh,008h,06bh,008h,0f2h,007h,080h,007h,014h,007h,0aeh	; ca07  ...s...k........
	defb 006h,04eh,006h,0f4h,005h,09eh,005h,04dh,005h,001h,005h,0b9h,004h,075h,004h,035h	; ca17  .N.....M.....u.5
	defb 004h,0f9h,003h,0c0h,003h,08ah,003h,057h,003h,027h,003h,0fah,002h,0cfh,002h,0a7h	; ca27  .......W.'......
	defb 002h,081h,002h,05dh,002h,03bh,002h,01bh,002h,0fch,001h,0e0h,001h,0c5h,001h,0ach	; ca37  ...].;..........
	defb 001h,094h,001h,07dh,001h,068h,001h,053h,001h,040h,001h,02eh,001h,01dh,001h,00dh	; ca47  ...}.h.S.@......
	defb 001h,0feh,000h,0f0h,000h,0e2h,000h,0d6h,000h,0cah,000h,0beh,000h,0b4h,000h,0aah	; ca57  ................
	defb 000h,0a0h,000h,097h,000h,08fh,000h,087h,000h,07fh,000h,078h,000h,071h,000h,06bh	; ca67  ...........x.q.k
	defb 000h,065h,000h,05fh,000h,05ah,000h,055h,000h,050h,000h,04ch,000h,047h,000h,043h	; ca77  .e._.Z.U.P.L.G.C
	defb 000h,040h,000h,03ch,000h,039h,000h,035h,000h,032h,000h,030h,000h,02dh,000h,02ah	; ca87  .@.<.9.5.2.0.-.*
	defb 000h,028h,000h,026h,000h,024h,000h,022h,000h,020h,000h,01eh,000h,01ch,000h,01bh	; ca97  .(.&.$.". ......
	defb 000h,019h,000h,018h,000h,016h,000h,015h,000h,014h,000h,013h,000h,012h,000h,011h	; caa7  ................
	defb 000h,010h,000h,00fh,000h,00eh,000h,003h,0c7h,021h,0c7h,08ch,0c7h,00ch,0c7h,088h	; cab7  .........!......
	defb 0c7h,05ah,0c7h,05bh,0c8h,0bbh,0c7h,074h,0c7h,004h,0c8h,0a7h,0c7h,02ch,0c7h,064h	; cac7  .Z.[...t.....,.d
	defb 0c8h,080h,0c8h,091h,0c8h,061h,0cbh,004h,0cbh,011h,0cbh,02bh,0cbh,03ah,0cbh,047h	; cad7  .....a.....+.:.G
	defb 0cbh,054h,0cbh,0aah,0cbh,0bdh,0cbh,0d0h,0cbh,0e3h,0cbh,0f6h,0cbh,045h,0cch,08ch	; cae7  .T...........E..
	defb 0cch,0a2h,0cch,0b8h,0cch,0f7h,0cch,015h,0cdh,02fh,0cdh,053h,0cdh,087h,008h,080h	; caf7  ........./.S....
	defb 00fh,083h,010h,018h,080h,00ch,018h,018h,018h,08dh,081h,008h,087h,00ah,089h,000h	; cb07  ................
	defb 080h,008h,083h,020h,084h,088h,018h,083h,010h,084h,083h,008h,088h,018h,084h,083h	; cb17  ... ............
	defb 020h,088h,018h,08dh,087h,009h,080h,007h,083h,008h,030h,03ch,048h,054h,037h,043h	; cb27   .........0<HT7C
	defb 04ah,048h,08dh,087h,008h,080h,00fh,083h,010h,021h,080h,00ch,021h,021h,021h,08dh	; cb37  JH.......!..!!!.
	defb 087h,008h,080h,00fh,083h,010h,01dh,080h,00ch,01dh,01dh,01dh,08dh,087h,008h,080h	; cb47  ................
	defb 00fh,083h,010h,01fh,080h,00ch,01fh,01fh,01fh,08dh,087h,00bh,083h,010h,087h,00ah	; cb57  ................
	defb 030h,02bh,030h,083h,020h,032h,083h,010h,032h,034h,032h,030h,02dh,02bh,083h,050h	; cb67  0+0. 2..2420-+.P
	defb 02dh,083h,010h,030h,02bh,030h,083h,020h,032h,083h,010h,032h,034h,032h,030h,02dh	; cb77  -..0+0. 2..2420-
	defb 02bh,083h,050h,02dh,083h,010h,035h,034h,030h,083h,030h,029h,083h,010h,035h,083h	; cb87  +.P-..540.0)..5.
	defb 020h,034h,030h,083h,040h,037h,083h,010h,037h,035h,034h,030h,02bh,029h,028h,083h	; cb97   40.@7..7540+)(.
	defb 0a0h,024h,08dh,083h,008h,021h,021h,02dh,021h,02bh,02dh,084h,01fh,021h,021h,02dh	; cba7  .$...!!-!+-..!!-
	defb 021h,02dh,02dh,026h,028h,08dh,083h,008h,01dh,01dh,029h,01dh,027h,029h,084h,01bh	; cbb7  !--&(.....).')..
	defb 01dh,01dh,029h,01dh,027h,018h,022h,024h,08dh,083h,008h,01ah,01ah,026h,01ah,024h	; cbc7  ..).'."$.....&.$
	defb 026h,084h,018h,01ah,01ah,026h,01ah,024h,026h,01fh,021h,08dh,083h,008h,01ch,01ch	; cbd7  &....&.$&.!.....
	defb 028h,01ch,026h,028h,084h,01ah,01ch,01ch,028h,023h,026h,028h,01ch,01fh,08dh,087h	; cbe7  (.&(....(#&(....
	defb 00ah,083h,008h,039h,02dh,039h,02dh,037h,034h,037h,039h,084h,087h,00ch,021h,083h	; cbf7  ...9-9-7479...!.
	defb 010h,02bh,083h,020h,021h,087h,00ah,083h,008h,039h,032h,039h,032h,037h,034h,037h	; cc07  .+. !....9292747
	defb 083h,028h,039h,083h,020h,087h,00ch,01fh,087h,00ah,083h,008h,03eh,032h,040h,032h	; cc17  .(9. .......>2@2
	defb 03eh,03ch,039h,03ch,03eh,032h,040h,032h,03eh,03ch,039h,03ch,040h,034h,040h,034h	; cc27  ><9<>2@2><9<@4@4
	defb 03eh,03bh,03eh,083h,018h,083h,028h,040h,083h,020h,087h,00ch,030h,08dh,087h,00bh	; cc37  >;>...(@. ..0...
	defb 08ah,001h,083h,060h,039h,087h,008h,080h,00dh,083h,008h,03ch,03bh,039h,037h,087h	; cc47  ...`9......<;97.
	defb 00bh,080h,00ah,083h,060h,039h,087h,008h,080h,00dh,083h,008h,03ch,03bh,039h,037h	; cc57  ....`9......<;97
	defb 080h,00ah,087h,00bh,083h,060h,035h,080h,00dh,087h,008h,083h,008h,035h,039h,03ch	; cc67  .....`5......59<
	defb 039h,080h,00ah,087h,00bh,083h,060h,03bh,087h,008h,083h,008h,080h,00dh,040h,034h	; cc77  9.....`;......@4
	defb 03eh,040h,080h,00ah,08dh,087h,008h,080h,00fh,083h,010h,018h,080h,00ch,083h,008h	; cc87  >@..............
	defb 018h,018h,080h,00fh,083h,010h,018h,080h,00ch,013h,08dh,087h,008h,080h,00fh,083h	; cc97  ................
	defb 010h,01ah,080h,00ch,083h,008h,01ah,01ah,080h,00fh,083h,010h,01ah,080h,00ch,015h	; cca7  ................
	defb 08dh,081h,001h,087h,009h,083h,008h,080h,009h,030h,037h,03ch,037h,03eh,03ch,036h	; ccb7  .........07<7><6
	defb 03eh,030h,03ch,036h,037h,083h,020h,087h,00ah,081h,008h,088h,00ch,081h,001h,087h	; ccc7  >0<67. .........
	defb 009h,087h,009h,083h,008h,080h,009h,030h,037h,03ch,037h,03eh,03ch,036h,03eh,030h	; ccd7  .......07<7><6>0
	defb 03ch,036h,037h,083h,020h,087h,00ah,081h,008h,088h,012h,081h,001h,087h,009h,08dh	; cce7  <67. ...........
	defb 087h,00ah,083h,030h,030h,083h,008h,02bh,030h,083h,030h,032h,083h,008h,030h,032h	; ccf7  ...00..+0.02..02
	defb 083h,030h,037h,083h,008h,035h,034h,083h,010h,035h,034h,030h,02bh,08dh,080h,00ch	; cd07  .07..54..540+...
	defb 087h,00ah,083h,030h,030h,083h,008h,087h,008h,037h,037h,080h,00fh,036h,083h,028h	; cd17  ...00....77..6.(
	defb 084h,083h,008h,080h,00dh,02bh,02bh,08dh,087h,00fh,08ah,001h,083h,020h,030h,037h	; cd27  .....++...... 07
	defb 036h,032h,034h,030h,083h,010h,030h,03bh,03ah,039h,083h,020h,032h,037h,036h,039h	; cd37  6240..0;:9. 2769
	defb 038h,083h,008h,032h,037h,036h,039h,083h,020h,038h,039h,08dh,085h,0a0h,083h,00ch	; cd47  8..2769. 89.....
	defb 081h,001h,080h,007h,087h,000h,050h,08bh,085h,0a0h,083h,019h,081h,001h,080h,007h	; cd57  ......P.........
	defb 087h,001h,08ah,002h,046h,08bh,085h,0a0h,083h,001h,081h,008h,080h,00fh,088h,019h	; cd67  ....F...........
	defb 083h,00ah,080h,00ah,087h,002h,088h,01fh,08bh,085h,032h,083h,0c8h,080h,000h,081h	; cd77  ..........2.....
	defb 008h,087h,005h,089h,003h,088h,01fh,08bh,08bh,08bh,085h,0ffh,083h,002h,081h,008h	; cd87  ................
	defb 080h,00fh,088h,00fh,08bh,086h,083h,002h,081h,001h,080h,00fh,05ah,08bh,085h,0a0h	; cd97  ............Z...
	defb 083h,01eh,081h,001h,080h,000h,087h,003h,046h,08bh,086h,080h,00ch,087h,008h,08ah	; cda7  ........F.......
	defb 000h,081h,001h,083h,004h,08eh,005h,018h,024h,018h,024h,018h,024h,018h,024h,01dh	; cdb7  ........$.$.$.$.
	defb 029h,01fh,02bh,018h,024h,018h,018h,018h,08bh,080h,00ch,087h,008h,08ah,000h,081h	; cdc7  ).+.$...........
	defb 001h,083h,004h,08eh,005h,028h,02bh,030h,02bh,028h,02bh,030h,02bh,02dh,030h,02fh	; cdd7  .....(+0+(+0+-0/
	defb 032h,02bh,02bh,02bh,08bh,080h,00fh,087h,00fh,08ah,001h,081h,001h,083h,004h,08eh	; cde7  2+++............
	defb 005h,043h,040h,043h,040h,083h,00ch,043h,083h,004h,040h,083h,010h,03eh,03ch,08bh	; cdf7  .C@C@..C..@..><.
	defb 086h,083h,001h,081h,001h,080h,00fh,032h,046h,082h,085h,0a0h,083h,064h,081h,008h	; ce07  .......2F....d..
	defb 080h,000h,087h,007h,088h,01fh,08bh,085h,0a0h,083h,01eh,081h,008h,080h,000h,087h	; ce17  ................
	defb 004h,088h,014h,08bh,086h,083h,001h,081h,001h,080h,00ah,04ch,084h,082h,085h,0a0h	; ce27  ...........L....
	defb 08bh,014h,081h,009h,080h,000h,087h,006h,089h,000h,088h,080h,028h,08bh,08eh,002h	; ce37  ............(...
	defb 086h,081h,001h,08ch,001h,08ch,001h,08ch,004h,08ch,004h,08ch,001h,08ch,001h,08ch	; ce47  ................
	defb 004h,08ch,004h,08ch,005h,08ch,005h,08ch,006h,08ch,006h,08ch,001h,08ch,001h,08ch	; ce57  ................
	defb 001h,08ch,001h,086h,081h,001h,08ch,001h,08ch,001h,08ch,004h,08ch,004h,08ch,001h	; ce67  ................
	defb 08ch,001h,08ch,004h,08ch,004h,08ch,005h,08ch,005h,08ch,006h,08ch,006h,08ch,001h	; ce77  ................
	defb 08ch,001h,08ch,001h,08ch,001h,086h,081h,001h,08ch,001h,08ch,001h,08ch,004h,08ch	; ce87  ................
	defb 004h,08ch,001h,08ch,001h,08ch,004h,08ch,004h,08ch,005h,08ch,005h,08ch,006h,08ch	; ce97  ................
	defb 006h,08ch,001h,08ch,001h,08ch,001h,08ch,001h,080h,00dh,08ch,007h,08ch,008h,08ch	; cea7  ................
	defb 009h,08ch,00ah,08ch,007h,08ch,008h,08ch,009h,08ch,00ah,08ch,007h,08ch,008h,08ch	; ceb7  ................
	defb 009h,08ch,00ah,08ch,007h,08ch,008h,08ch,009h,08ch,00ah,08ch,007h,08ch,008h,08ch	; cec7  ................
	defb 009h,08ch,00ah,08eh,009h,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00eh,08ch	; ced7  ................
	defb 00eh,08ch,00eh,08ch,00eh,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00eh,08ch	; cee7  ................
	defb 00eh,08ch,00eh,08ch,00eh,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00eh,08ch	; cef7  ................
	defb 00eh,08ch,00eh,08ch,00eh,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00eh,08ch	; cf07  ................
	defb 00eh,08ch,00eh,08ch,00eh,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00eh,08ch	; cf17  ................
	defb 00eh,08ch,00eh,08ch,00eh,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00eh,08ch	; cf27  ................
	defb 00eh,08ch,00eh,08ch,00eh,082h,08eh,002h,081h,001h,08ch,003h,08ch,003h,08ch,003h	; cf37  ................
	defb 08ch,003h,08ch,003h,08ch,003h,08ch,003h,08ch,003h,08ch,003h,08ch,003h,08ch,003h	; cf47  ................
	defb 08ch,003h,08ch,003h,08ch,003h,08ch,003h,08ch,003h,080h,00bh,08ch,000h,080h,00ah	; cf57  ................
	defb 08eh,00eh,08ch,000h,08eh,002h,080h,00ah,083h,080h,084h,084h,084h,084h,08ch,00bh	; cf67  ................
	defb 08eh,00eh,08ch,00bh,08eh,002h,08ch,00ch,08eh,0f6h,08ch,00ch,08eh,002h,08eh,009h	; cf77  ................
	defb 080h,00ch,087h,00ah,08ch,010h,08eh,00bh,08ch,010h,08eh,0fdh,080h,00dh,08ch,010h	; cf87  ................
	defb 08eh,0ffh,08ch,010h,08eh,009h,08ch,011h,08ch,011h,08eh,00bh,08ch,011h,08ch,011h	; cf97  ................
	defb 08eh,0fdh,08ch,011h,08ch,011h,08eh,0ffh,08ch,011h,08ch,011h,080h,00fh,08eh,009h	; cfa7  ................
	defb 08ch,012h,08eh,0fdh,08ch,012h,082h,08bh,08ch,002h,08ch,002h,08ch,002h,08ch,002h	; cfb7  ................
	defb 08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h	; cfc7  ................
	defb 08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h	; cfd7  ................
	defb 08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h	; cfe7  ................
	defb 08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h	; cff7  ................
	defb 08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h	; d007  ................
	defb 08eh,009h,08ch,00fh,08eh,00bh,08ch,00fh,08eh,009h,08ch,00fh,08eh,00bh,08ch,00fh	; d017  ................
	defb 08eh,009h,08ch,00fh,08eh,00bh,08ch,00fh,08eh,009h,08ch,00fh,08eh,00bh,08ch,00fh	; d027  ................
	defb 08eh,009h,08ch,00fh,08eh,00bh,08ch,00fh,08eh,009h,08ch,00fh,08eh,00bh,08ch,00fh	; d037  ................
	defb 082h,085h,0a0h,083h,01eh,081h,001h,080h,003h,087h,007h,014h,08bh,086h,083h,001h	; d047  ................
	defb 081h,001h,080h,00ah,040h,084h,082h,086h,083h,001h,081h,001h,080h,00ah,034h,084h	; d057  ....@.........4.
	defb 082h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; d067  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; d077  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; d087  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; d097  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; d0a7  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; d0b7  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; d0c7  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; d0d7  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; d0e7  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; d0f7  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; d107  ................

; ======================================================================
; CODIGO 0xd117..0xd13a  (35 bytes)
; ======================================================================


vram_pon_dir:		; Fija la direccion de ESCRITURA del VDP por el puerto 0x99; identica byte a byte a la del bloque de naves
	di			;d117
	push af			;d118
	in a,(099h)		;d119
	ld a,l			;d11b
	out (099h),a		;d11c
	ld a,h			;d11e
	and 07fh		;d11f
	or 040h			;d121
	out (099h),a		;d123
	pop af			;d125
	ret			;d126
premia:		; Suma B al marcador por el digito que apunta HL (dentro de 0xB87F) y lo repinta en 0x12B0, que es la misma posicion de pantalla que usa el marcador de la fase de naves
	push ix			;d127
	ld ix,0b87fh		;d129
	ld de,012b0h		;d12d
	call suma_puntos		;d130
	pop ix			;d133
	ret			;d135
pinta_marca_hud:		; Pinta la marca del HUD con el color 0x11
	ld a,011h		;d136
	jr $+4			;d138

; ----------------------------------------------------------------------
; DATOS relleno: o resto (2 B; 2 bytes)
;   0xd13a..0xd13c  (2 bytes)
; ----------------------------------------------------------------------
	defb 03eh,071h	; d13a  >q

; ======================================================================
; CODIGO 0xd13c..0xd348  (524 bytes)
; ======================================================================


L_D13C:
	ld b,002h		;d13c
L_D13E:
	push bc			;d13e
	push hl			;d13f
	ld c,002h		;d140
	call vram_pon_dir		;d142
L_D145:
	ld b,008h		;d145
L_D147:
	out (098h),a		;d147
	and a			;d149
	and a			;d14a
	dec b			;d14b
	jr nz,L_D147		;d14c
	push af			;d14e
	ld a,l			;d14f
	and 038h		;d150
	cp 038h			;d152
	jr nz,L_D161		;d154
	ld a,l			;d156
	and 0c0h		;d157
	ld l,a			;d159
	ld a,h			;d15a
	add a,008h		;d15b
	ld h,a			;d15d
	call vram_pon_dir		;d15e
L_D161:
	pop af			;d161
	dec c			;d162
	jr nz,L_D145		;d163
	pop hl			;d165
	ld bc,00040h		;d166
	add hl,bc		;d169
	pop bc			;d16a
	djnz L_D13E		;d16b
	ei			;d16d
	ret			;d16e
redefine_teclas:		; La pantalla de REDEFINIR TECLAS: limpia el buffer, fuerza teclado, libera los nombres de tecla quitandoles el bit 7 y da ocho vueltas rotulando, con siete llamadas intercaladas que rellenan las siete entradas de 0xB86A. Gemela de la de naves, 34 de 48 bytes
	call borra_buffer		;d16f
	call vuelca_pantalla		;d172
	xor a			;d175
	ld (0b87ch),a		;d176
	ld hl,0b7c2h		;d179
	ld b,048h		;d17c
L_D17E:
	res 7,(hl)		;d17e
	inc hl			;d180
	djnz L_D17E		;d181
	ld c,008h		;d183
	ld ix,0b721h		;d185
	ld iy,0b86ah		;d189
	ld hl,00120h		;d18d
L_D190:
	push bc			;d190
	call rotula_secuencia		;d191
	pop bc			;d194
	dec c			;d195
	jr nz,redefine_tecla		;d196
	ld b,c			;d198
L_D199:
	dec bc			;d199
	ld a,b			;d19a
	or c			;d19b
	jr nz,L_D199		;d19c
	ret			;d19e
lee_tecla_pulsada:		; Barre las nueve filas de la matriz y devuelve en E el indice fila*8 + bit de la primera tecla pulsada
	ld de,0f000h		;d19f
L_D1A2:
	ld a,d			;d1a2
	out (0aah),a		;d1a3
	in a,(0a9h)		;d1a5
	ld b,008h		;d1a7
L_D1A9:
	rrca			;d1a9
	ret nc			;d1aa
	inc e			;d1ab
	djnz L_D1A9		;d1ac
	inc d			;d1ae
	ld a,0f9h		;d1af
	cp d			;d1b1
	jr z,lee_tecla_pulsada		;d1b2
	jr L_D1A2		;d1b4
redefine_tecla:		; Espera una tecla y guarda su entrada en la tabla: la mascara del bit en (iy+000) y el valor del puerto en (iy+001)
	call lee_tecla_pulsada		;d1b6
	xor a			;d1b9
	scf			;d1ba
L_D1BB:
	rra			;d1bb
	djnz L_D1BB		;d1bc
	ld (iy+000h),a		;d1be
	inc iy			;d1c1
	ld (iy+000h),d		;d1c3
	inc iy			;d1c6
	ld d,b			;d1c8
	push hl			;d1c9
	ld hl,0b7c2h		;d1ca
	add hl,de		;d1cd
	ld a,(hl)		;d1ce
	bit 7,a			;d1cf
	jr z,L_D1DA		;d1d1
	dec iy			;d1d3
	dec iy			;d1d5
	pop hl			;d1d7
	jr redefine_tecla		;d1d8
L_D1DA:
	set 7,(hl)		;d1da
	push ix			;d1dc
	pop hl			;d1de
	ld b,006h		;d1df
L_D1E1:
	ld (hl),020h		;d1e1
	inc hl			;d1e3
	djnz L_D1E1		;d1e4
	cp 015h			;d1e6
	jr c,L_D1F0		;d1e8
	ld (ix+000h),a		;d1ea
	pop hl			;d1ed
	jr L_D190		;d1ee
L_D1F0:
	ld b,a			;d1f0
	ld hl,0b80bh		;d1f1
	jr L_D1FC		;d1f4
L_D1F6:
	ld a,(hl)		;d1f6
	cp 000h			;d1f7
	inc hl			;d1f9
	jr nz,L_D1F6		;d1fa
L_D1FC:
	djnz L_D1F6		;d1fc
	push ix			;d1fe
	pop de			;d200
L_D201:
	ld a,(hl)		;d201
	cp 000h			;d202
	jr z,L_D20B		;d204
	ld (de),a		;d206
	inc hl			;d207
	inc de			;d208
	jr L_D201		;d209
L_D20B:
	pop hl			;d20b
	jr L_D190		;d20c
rotula_secuencia:		; Recorre la cadena de (IX) hasta el 0 pasandole cada byte a imprime_marco, con el sonido puesto a cero antes y despues
	call sonido_reset		;d20e
L_D211:
	ld a,(ix+000h)		;d211
	inc ix			;d214
	and a			;d216
	jr z,sonido_reset		;d217
	call imprime_marco		;d219
	jr L_D211		;d21c
arranca_musica_carteles:		; Instala de golpe los tres guiones de la musica de los carteles, los dos primeros sin `ei`. La llama el rotulador como codigo de control
	ld a,080h		;d21e
	ld de,0ce2bh		;d220
	push hl			;d223
	call arranca_guion		;d224
	inc a			;d227
	ld de,0d054h		;d228
	call arranca_guion		;d22b
	ld a,002h		;d22e
	ld de,0d05eh		;d230
	call arranca_guion		;d233
	pop hl			;d236
	ret			;d237
sonido_reset:		; Reabre el sonido reponiendo el `di` (0xF3) que sonido_off machaco en las dos rutinas de arranque, y deja los tres canales a cero con un guion nulo
	ld a,0f3h		;d238
	ld (0c4d0h),a		;d23a
	ld (0c4a3h),a		;d23d
	xor a			;d240
	ld de,00000h		;d241
	push hl			;d244
	call arranca_guion		;d245
	inc a			;d248
	call arranca_guion		;d249
	inc a			;d24c
	call arranca_guion		;d24d
	pop hl			;d250
	ret			;d251
imprime_marco:		; El impresor del marco: DIRECTO a la VRAM con la fuente de 0x5F00; A<0x20 es control (0 borra la celda, 1 posiciona con el parametro de (IX))
	ld bc,00bb8h		;d252
	push af			;d255
	call espera_bc		;d256
	pop af			;d259
	cp 020h			;d25a
	jr nc,L_D2D3		;d25c
	call vram_pon_dir		;d25e
	ld b,008h		;d261
	push af			;d263
L_D264:
	xor a			;d264
	out (098h),a		;d265
	and a			;d267
	and a			;d268
	djnz L_D264		;d269
	ei			;d26b
	pop af			;d26c
	cp 001h			;d26d
	jr nz,L_D28B		;d26f
	ld a,h			;d271
	and 018h		;d272
	ld h,a			;d274
	ld a,l			;d275
	and 038h		;d276
	ld l,a			;d278
	ld a,(ix+000h)		;d279
	inc ix			;d27c
	push hl			;d27e
	ld l,a			;d27f
	ld h,000h		;d280
	ld b,006h		;d282
L_D284:
	add hl,hl		;d284
	djnz L_D284		;d285
	pop bc			;d287
	add hl,bc		;d288
	jr L_D2F2		;d289
L_D28B:
	cp 014h			;d28b
	jr nz,L_D29E		;d28d
	call sonido_reset		;d28f
	ld bc,00000h		;d292
	call espera_bc		;d295
	call espera_bc		;d298
	jp arranca_musica_carteles		;d29b
L_D29E:
	ld a,h			;d29e
	and 018h		;d29f
	ld h,a			;d2a1
	ld a,l			;d2a2
	and 038h		;d2a3
	ld l,a			;d2a5
	cp 038h			;d2a6
	jr nz,L_D2B2		;d2a8
	ld a,h			;d2aa
	add a,009h		;d2ab
	ld h,a			;d2ad
	ld l,000h		;d2ae
	jr L_D2B6		;d2b0
L_D2B2:
	ld bc,00108h		;d2b2
	add hl,bc		;d2b5
L_D2B6:
	ld b,007h		;d2b6
	call vram_pon_dir		;d2b8
L_D2BB:
	ld a,07fh		;d2bb
	out (098h),a		;d2bd
	and a			;d2bf
	and a			;d2c0
	djnz L_D2BB		;d2c1
	ei			;d2c3
	push hl			;d2c4
	call sonido_reset		;d2c5
	ld bc,00fa0h		;d2c8
	call espera_bc		;d2cb
	call arranca_musica_carteles		;d2ce
	pop hl			;d2d1
	ret			;d2d2
L_D2D3:
	push hl			;d2d3
	ld l,a			;d2d4
	ld h,000h		;d2d5
	add hl,hl		;d2d7
	add hl,hl		;d2d8
	add hl,hl		;d2d9
	ld de,05f00h		;d2da
	add hl,de		;d2dd
	ex de,hl		;d2de
	pop hl			;d2df
	call vram_pon_dir		;d2e0
	ld b,008h		;d2e3
L_D2E5:
	ld a,(de)		;d2e5
	out (098h),a		;d2e6
	inc de			;d2e8
	and a			;d2e9
	and a			;d2ea
	djnz L_D2E5		;d2eb
	ei			;d2ed
	ld bc,00040h		;d2ee
	add hl,bc		;d2f1
L_D2F2:
	call vram_pon_dir		;d2f2
	ld b,007h		;d2f5
L_D2F7:
	ld a,07fh		;d2f7
	out (098h),a		;d2f9
	and a			;d2fb
	and a			;d2fc
	djnz L_D2F7		;d2fd
	ei			;d2ff
	ld b,000h		;d300
L_D302:
	djnz L_D302		;d302
	ret			;d304
espera_bc:		; Espera activa: decrementa BC hasta cero y vuelve
	dec bc			;d305
	ld a,b			;d306
	or c			;d307
	jr nz,espera_bc		;d308
	ret			;d30a
hay_tecla:		; Vuelve con NZ si hay alguna tecla pulsada, barriendo las nueve filas de la matriz por los puertos 0xAA y 0xA9
	ld d,0f0h		;d30b
L_D30D:
	ld a,d			;d30d
	out (0aah),a		;d30e
	in a,(0a9h)		;d310
	cp 0ffh			;d312
	ret nz			;d314
	inc d			;d315
	ld a,0f9h		;d316
	cp d			;d318
	ret z			;d319
	jr L_D30D		;d31a
rellena_colores:		; Pone el color A en la tabla de colores, tercio a tercio: 0x2108 x 56 filas, 0x2900 x 64 y 0x3100 x 40
	ld hl,02108h		;d31c
	ld c,038h		;d31f
	call rellena_tercio		;d321
	ld hl,02900h		;d324
	ld c,040h		;d327
	call rellena_tercio		;d329
	ld hl,03100h		;d32c
	ld c,028h		;d32f
rellena_tercio:		; El nucleo de rellena_colores: 24 filas de C bytes cada una, avanzando 0x40 en la VRAM entre fila y fila
	ld b,018h		;d331
L_D333:
	call vram_pon_dir		;d333
	push bc			;d336
	push hl			;d337
L_D338:
	out (098h),a		;d338
	and a			;d33a
	dec c			;d33b
	jr nz,L_D338		;d33c
	pop hl			;d33e
	ld bc,00040h		;d33f
	add hl,bc		;d342
	pop bc			;d343
	djnz L_D333		;d344
	ei			;d346
	ret			;d347

; ----------------------------------------------------------------------
; DATOS tabla: (19 B; racha 2.45, entropia 3.72, 14 valores: pocos valores para ser un dibujo)
;   0xd348..0xd35b  (19 bytes)
; ----------------------------------------------------------------------
	defb 023h,07dh,0e6h,03fh,0c0h,02bh,07dh,0e6h,0c0h,06fh,0d3h,099h,07ch,0c6h,008h,067h	; d348  #}.?.+}..o..|..g
	defb 0d3h,099h,0c9h	; d358  ...

; ======================================================================
; CODIGO 0xd35b..0xd48c  (305 bytes)
; ======================================================================


hud_imprime:		; Recorre la cadena de indices de glifo de (IX) hasta el 0 estampando cada uno en la VRAM: 8 bytes desde la fuente de 0x5F00 y 0x40 de avance por caracter
	ld a,(ix+000h)		;d35b
	and a			;d35e
	ret z			;d35f
	ld l,a			;d360
	ld h,000h		;d361
	add hl,hl		;d363
	add hl,hl		;d364
	add hl,hl		;d365
	ld bc,05f00h		;d366
	add hl,bc		;d369
	ex de,hl		;d36a
	call vram_pon_dir		;d36b
	ld b,008h		;d36e
L_D370:
	ld a,(de)		;d370
	out (098h),a		;d371
	inc de			;d373
	and a			;d374
	and a			;d375
	djnz L_D370		;d376
	ei			;d378
	ld de,00040h		;d379
	add hl,de		;d37c
	ex de,hl		;d37d
	inc ix			;d37e
	jp hud_imprime		;d380
vuelca_pantalla:		; Vuelca el buffer a la VRAM en TRES bandas: 0x4000/56 filas a 0x0108, 0x4540/64 a 0x0900, 0x4B40/40 a 0x1100
	ld de,04000h		;d383
	ld hl,00108h		;d386
	ld b,038h		;d389
	call vuelca_columnas		;d38b
	ld de,04540h		;d38e
	ld hl,00900h		;d391
	ld b,040h		;d394
	call vuelca_columnas		;d396
	ld de,04b40h		;d399
	ld hl,01100h		;d39c
	ld b,028h		;d39f
	call vuelca_columnas		;d3a1
	ei			;d3a4
	ret			;d3a5
vuelca_columnas:		; El nucleo del volcado, identico al de la fase de naves: 24 vueltas por banda recogiendo el buffer a saltos de 24 -por columnas- y avanzando 0x40 en la VRAM entre una y otra
	ld c,018h		;d3a6
L_D3A8:
	push bc			;d3a8
	call vram_pon_dir		;d3a9
	push de			;d3ac
	push hl			;d3ad
	ex de,hl		;d3ae
	ld de,00018h		;d3af
L_D3B2:
	ld a,(hl)		;d3b2
	out (098h),a		;d3b3
	add hl,de		;d3b5
	djnz L_D3B2		;d3b6
	pop hl			;d3b8
	ld de,00040h		;d3b9
	add hl,de		;d3bc
	pop de			;d3bd
	inc de			;d3be
	pop bc			;d3bf
	dec c			;d3c0
	jr nz,L_D3A8		;d3c1
	ret			;d3c3
L_D3C4:
	call borra_buffer		;d3c4
	call vuelca_pantalla		;d3c7
	ld ix,0b940h		;d3ca
	ld hl,00118h		;d3ce
	call rotula_secuencia		;d3d1
	pop de			;d3d4
	push hl			;d3d5
	ld h,d			;d3d6
	ld l,e			;d3d7
	inc de			;d3d8
	ld bc,00005h		;d3d9
	ld (hl),020h		;d3dc
	ldir			;d3de
	ld bc,00005h		;d3e0
	and a			;d3e3
	sbc hl,bc		;d3e4
	ex de,hl		;d3e6
	ld b,006h		;d3e7
	pop hl			;d3e9
L_D3EA:
	push bc			;d3ea
	push de			;d3eb
L_D3EC:
	call hay_tecla		;d3ec
	jr nz,L_D3EC		;d3ef
	ld bc,007d0h		;d3f1
	call espera		;d3f4
	call lee_tecla_pulsada		;d3f7
	ld d,000h		;d3fa
	push hl			;d3fc
	ld hl,0b7c2h		;d3fd
	add hl,de		;d400
	ld a,(hl)		;d401
	pop hl			;d402
	and 07fh		;d403
	cp 030h			;d405
	jr nc,L_D41B		;d407
	cp 014h			;d409
	jr z,L_D43C		;d40b
	cp 011h			;d40d
	jr z,L_D419		;d40f
	cp 010h			;d411
	jr nz,L_D3EC		;d413
	pop de			;d415
	pop bc			;d416
	jr L_D428		;d417
L_D419:
	ld a,020h		;d419
L_D41B:
	pop de			;d41b
	pop bc			;d41c
	push bc			;d41d
	ld (de),a		;d41e
	push de			;d41f
	call imprime_marco		;d420
	pop de			;d423
	inc de			;d424
	pop bc			;d425
	djnz L_D3EA		;d426
L_D428:
	ld a,00dh		;d428
	call imprime_marco		;d42a
	call sonido_reset		;d42d
	ld bc,00000h		;d430
L_D433:
	dec bc			;d433
	ld a,b			;d434
	or c			;d435
	jr nz,L_D433		;d436
	pop hl			;d438
	jp L_B68C		;d439
L_D43C:
	pop de			;d43c
	pop bc			;d43d
	ld a,b			;d43e
	push bc			;d43f
	push de			;d440
	cp 006h			;d441
	jp z,L_D3EC		;d443
	call vram_pon_dir		;d446
	ld b,008h		;d449
L_D44B:
	ld a,000h		;d44b
	out (098h),a		;d44d
	nop			;d44f
	djnz L_D44B		;d450
	ei			;d452
	ld de,00040h		;d453
	and a			;d456
	sbc hl,de		;d457
	call vram_pon_dir		;d459
	ld b,007h		;d45c
L_D45E:
	ld a,07fh		;d45e
	out (098h),a		;d460
	nop			;d462
	djnz L_D45E		;d463
	out (098h),a		;d465
	ei			;d467
	pop de			;d468
	dec de			;d469
	ld a,020h		;d46a
	ld (de),a		;d46c
	pop bc			;d46d
	inc b			;d46e
	jp L_D3EA		;d46f
dir_vram_de_fila_columna:		; De la fila de pixel D y la columna E a la direccion de VRAM: (D>>6)*0x800 + E*0x40 + (D and 0x3F). Identica byte a byte a la de la fase de naves, las 26. Y explica el reparto 56/64/40 de las tres bandas: el buffer empieza en la fila 8, y 8+56=64 y 64+64=128 son las dos fronteras de tercio del SCREEN 2. Las bandas son los tercios de la pantalla, cortados donde manda el hardware
	ld l,000h		;d472
	ld a,e			;d474
	rra			;d475
	rr l			;d476
	rra			;d478
	rr l			;d479
	and 007h		;d47b
	ld h,a			;d47d
	ld a,d			;d47e
	and 03fh		;d47f
	or l			;d481
	ld l,a			;d482
	ld a,d			;d483
	rra			;d484
	rra			;d485
	rra			;d486
	and 018h		;d487
	or h			;d489
	ld h,a			;d48a
	ret			;d48b

; ----------------------------------------------------------------------
; DATOS 489: bytes al final del bloque que NO son codigo, y estuvieron publicados como "la rutina mas caliente de la segunda parte, 139.323 muestras". Se desensambla a `nop / rst 38h / nop / rst 38h...`, no lo llama nadie, y muestreando el PC en 130 s de partida limpia -259.149 muestras en dos ventanas- NO CAE NI UNA AQUI. La medida vieja se hizo abriendo la ventana en t=1775 "cuando la carga termina", y la carga no habia terminado: a t=1775 el PC esta en 0xF87E/0xF88D/0xF887, dentro del cargador de cinta, con solo 45 direcciones distintas. QUE SON, dicho sin pasarse: datos de poca variedad -21 valores distintos, 199 de los 489 bytes son 0xFF, y el resto tienen pocos bits puestos-, que es la pinta de un dibujo con mascara, el idioma de esta conversion. No se afirma mas porque no se ha medido mas
;   0xd48c..0xd675  (489 bytes)
; ----------------------------------------------------------------------
	defb 000h,0ffh,000h,0ffh,020h,0ffh,000h,0ffh,002h,0ffh,000h,0ffh,001h,0ffh,000h,0ffh	; d48c  .... ...........
	defb 001h,0ffh,000h,0ffh,020h,0ffh,000h,0ffh,001h,0ffh,040h,0ffh,000h,0ffh,004h,0ffh	; d49c  .... .....@.....
	defb 003h,0ffh,044h,0ffh,000h,0ffh,004h,0ffh,021h,0ffh,004h,0ffh,002h,0ffh,024h,0ffh	; d4ac  ..D.....!.....$.
	defb 000h,0ffh,004h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,001h,0ffh,040h,0ffh,000h,0ffh	; d4bc  ............@...
	defb 000h,0ffh,000h,0ffh,040h,0ffh,000h,0ffh,040h,0ffh,000h,0ffh,004h,0ffh,000h,0ffh	; d4cc  ....@...@.......
	defb 000h,0ffh,000h,0ffh,040h,0ffh,000h,0ffh,044h,0ffh,000h,0ffh,060h,0ffh,000h,0ffh	; d4dc  ....@...D...`...
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,040h,0ffh,000h,0ffh	; d4ec  ............@...
	defb 000h,0ffh,000h,0efh,0ffh,040h,0fbh,040h,0ffh,040h,0ffh,040h,0ffh,041h,0fbh,000h	; d4fc  .....@.@.@.@.A..
	defb 0ffh,040h,0ffh,000h,0fdh,000h,0ffh,001h,0ffh,040h,0ffh,041h,0ffh,041h,0ffh,040h	; d50c  .@.......@.A.A.@
	defb 0ffh,040h,0ffh,000h,0ffh,040h,0ffh,040h,0fdh,040h,0ffh,001h,0ffh,041h,0ffh,000h	; d51c  .@...@.@.@...A..
	defb 0ffh,040h,0f9h,001h,0ffh,041h,0ffh,000h,0ffh,040h,0fbh,000h,0fdh,041h,0fbh,001h	; d52c  .@...A...@...A..
	defb 0ffh,040h,0ffh,000h,0fbh,040h,0ffh,040h,0fbh,040h,0ffh,040h,0fbh,041h,0ffh,000h	; d53c  .@...@.@.@.@.A..
	defb 0fbh,040h,0fbh,000h,0f9h,040h,0ffh,000h,0f9h,040h,0ffh,040h,0fbh,040h,0ffh,040h	; d54c  .@...@...@.@.@.@
	defb 0fbh,040h,0ffh,000h,0fbh,040h,0ffh,040h,0fbh,040h,0ffh,040h,0fbh,041h,0fdh,040h	; d55c  .@...@.@.@.@.A.@
	defb 0fbh,040h,0ffh,040h,0fbh,040h,0f9h,000h,0fbh,040h,0ffh,041h,0ffh,040h,0fdh,040h	; d56c  .@.@.@...@.A.@.@
	defb 0fbh,040h,0ffh,051h,000h,0ffh,004h,0ffh,001h,0ffh,004h,0ffh,000h,0ffh,044h,0ffh	; d57c  .@.Q..........D.
	defb 000h,0ffh,004h,0ffh,020h,0ffh,004h,0ffh,002h,0ffh,004h,0ffh,001h,0ffh,004h,0ffh	; d58c  .... ...........
	defb 001h,0ffh,004h,0ffh,020h,0ffh,004h,0ffh,005h,0ffh,044h,0ffh,000h,0ffh,004h,0ffh	; d59c  .... .....D.....
	defb 007h,0ffh,044h,0ffh,004h,0ffh,004h,0ffh,025h,0ffh,004h,0ffh,002h,0ffh,024h,0ffh	; d5ac  ..D.....%.....$.
	defb 004h,0ffh,004h,0ffh,000h,0ffh,000h,0ffh,004h,0ffh,001h,0ffh,040h,0ffh,000h,0ffh	; d5bc  ............@...
	defb 004h,0ffh,000h,0ffh,040h,0ffh,000h,0ffh,040h,0ffh,000h,0ffh,004h,0ffh,000h,0ffh	; d5cc  ....@...@.......
	defb 004h,0ffh,000h,0ffh,040h,0ffh,020h,0ffh,044h,0ffh,000h,0ffh,060h,0ffh,000h,0ffh	; d5dc  ....@. .D...`...
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,040h,0ffh,000h,0ffh	; d5ec  ............@...
	defb 000h,0ffh,000h,0ffh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,001h,0ffh,000h	; d5fc  ................
	defb 0ffh,000h,0ffh,000h,0fdh,000h,0ffh,001h,0ffh,000h,0ffh,001h,0ffh,001h,0ffh,000h	; d60c  ................
	defb 0ffh,000h,0bfh,000h,0ffh,000h,0ffh,000h,0fdh,000h,0ffh,001h,0ffh,001h,0ffh,000h	; d61c  ................
	defb 0ffh,000h,0fdh,001h,0ffh,005h,0ffh,000h,0ffh,000h,0ffh,000h,0fdh,001h,0ffh,001h	; d62c  ................
	defb 0ffh,000h,0ffh,000h,0bfh,004h,0ffh,004h,0ffh,000h,0ffh,004h,0bfh,005h,0ffh,004h	; d63c  ................
	defb 0bfh,004h,0ffh,004h,0fdh,000h,0ffh,004h,0fdh,000h,0ffh,004h,0bfh,000h,0ffh,004h	; d64c  ................
	defb 0bfh,000h,0ffh,004h,0bfh,000h,0ffh,004h,0bfh,000h,0ffh,004h,0bfh,001h,0fdh,004h	; d65c  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0fdh,004h,002h	; d66c  .........
