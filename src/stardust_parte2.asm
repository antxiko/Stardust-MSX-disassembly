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
; DATOS ocho_bytes_sin_identificar: Ocho bytes sin identificar, lo que queda
;   de lo que se llamo "tabla de punteros a los graficos" (ver el bloque de la
;   escena final)
;   0x61d0..0x61d8  (8 bytes)
DATA_ocho_bytes_sin_identificar:
	defb 07fh,042h,00ch,01ch,038h,071h,07fh,000h	; 61d0  .B..8q..

; ----------------------------------------------------------------------
; DATOS guion_de_la_escena_final: El GUION DE LA ESCENA FINAL (173 B): 78
;   pasos de (columna, fila) con marcadores por encima de 0xC0 que cambian el
;   fotograma, y 0xC0 como terminador. Lo recorre el bucle de 0xBE47
;   0x61d8..0x6285  (173 bytes)
DATA_guion_de_la_escena_final:
	defb 0c1h,078h	; 61d8
	defb 0bah,078h	; 61da
	defb 0b8h,078h	; 61dc
	defb 0b6h,078h	; 61de
	defb 0b4h,078h	; 61e0
	defb 0b2h,078h	; 61e2
	defb 0b0h,078h	; 61e4
	defb 0aeh,078h	; 61e6
	defb 0ach,078h	; 61e8
	defb 0aah,078h	; 61ea
	defb 0a8h,078h	; 61ec
	defb 0a6h,078h	; 61ee
	defb 0a4h,078h	; 61f0
	defb 0a2h,078h	; 61f2
	defb 0a0h,078h	; 61f4
	defb 09eh,078h	; 61f6
	defb 09ch,078h	; 61f8
	defb 09ah,078h	; 61fa
	defb 098h,078h	; 61fc
	defb 096h,078h	; 61fe
	defb 094h,078h	; 6200
	defb 092h,078h	; 6202
	defb 090h,078h	; 6204
	defb 08eh,078h	; 6206
	defb 08ch,0c2h	; 6208
	defb 078h,08ah	; 620a
	defb 078h,088h	; 620c
	defb 077h,086h	; 620e
	defb 0c1h,077h	; 6210
	defb 084h,078h	; 6212
	defb 082h,078h	; 6214
	defb 080h,078h	; 6216
	defb 07eh,0c3h	; 6218
	defb 078h,07ch	; 621a
	defb 078h,07ah	; 621c
	defb 079h,078h	; 621e
	defb 0c1h,079h	; 6220
	defb 076h,078h	; 6222
	defb 074h,078h	; 6224
	defb 072h,078h	; 6226
	defb 070h,0c2h	; 6228
	defb 078h,06eh	; 622a
	defb 078h,06ch	; 622c
	defb 077h,06ah	; 622e
	defb 0c4h,076h	; 6230
	defb 068h,074h	; 6232
	defb 066h,072h	; 6234
	defb 064h,070h	; 6236
	defb 062h,0c5h	; 6238
	defb 06eh,061h	; 623a
	defb 06ch,060h	; 623c
	defb 06ah,05fh	; 623e
	defb 0c6h,068h	; 6240
	defb 05fh,066h	; 6242
	defb 05fh,064h	; 6244
	defb 05fh,062h	; 6246
	defb 05fh,060h	; 6248
	defb 05fh,05eh	; 624a
	defb 05fh,05ch	; 624c
	defb 05fh,0c7h	; 624e
	defb 05ah,05fh	; 6250
	defb 057h,05fh	; 6252
	defb 054h,05fh	; 6254
	defb 0c8h,051h	; 6256
	defb 05fh,04eh	; 6258
	defb 05fh,04bh	; 625a
	defb 05fh,0c9h	; 625c
	defb 047h,05fh	; 625e
	defb 043h,05fh	; 6260
	defb 03fh,05fh	; 6262
	defb 0cah,03bh	; 6264
	defb 05fh,037h	; 6266
	defb 05fh,033h	; 6268
	defb 05fh,0cbh	; 626a
	defb 02eh,05eh	; 626c
	defb 02ah,05dh	; 626e
	defb 026h,05ch	; 6270
	defb 022h,05bh	; 6272
	defb 0cch,01eh	; 6274
	defb 05ah,01ah	; 6276
	defb 059h,015h	; 6278
	defb 058h,010h	; 627a
	defb 057h,0cdh	; 627c
	defb 00ah,055h	; 627e
	defb 003h,053h	; 6280
	defb 000h,000h	; 6282
	defb 0c0h	; 6284

; ----------------------------------------------------------------------
; DATOS imagen_de_la_escena_final: La IMAGEN de la escena final (720 B): 40
;   filas de 18 bytes que copia_al_buffer lleva a la banda C del buffer,
;   centradas (18 + 6 = 24, el ancho). 0x6285 + 0x2D0 = 0x6555, justo donde
;   arranca el pool de sprites
;   0x6285..0x6555  (720 bytes)
DATA_imagen_de_la_escena_final:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,002h,000h,000h,000h	; 6285  ..................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,01dh,000h,000h,000h	; 6297  ..................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,00bh,000h,000h,000h	; 62a9  ..................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,018h,000h,000h,000h,030h,000h,000h,000h	; 62bb  ..............0...
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,0cdh,000h,000h,000h	; 62cd  ..................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,01eh,034h,000h,000h,000h	; 62df  ..............4...
	defb 000h,000h,018h,000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,0c3h,0eeh,0e0h,000h,000h	; 62f1  ..................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,00fh,02bh,0b9h,070h,000h,018h	; 6303  .............+.p..
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,075h,056h,0f5h,070h,000h,000h	; 6315  ............uV.p..
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,003h,0fah,0f9h,04eh,0e0h,000h,000h	; 6327  ..............N...
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,000h,000h,005h,0e6h,0d0h,0d0h,000h,000h	; 6339  ..................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,000h,001h,0f8h,019h,01bh,031h,000h,000h	; 634b  ...............1..
	defb 000h,000h,000h,000h,000h,000h,018h,000h,000h,001h,000h,01ch,005h,0e6h,06dh,0afh,080h,000h	; 635d  ..............m...
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,003h,007h,0efh,0feh,0dch,0b5h,051h,000h,000h	; 636f  ...............Q..
	defb 000h,000h,000h,000h,000h,080h,000h,000h,000h,003h,078h,0d9h,07bh,000h,000h,008h,000h,000h	; 6381  ..........x.{.....
	defb 000h,000h,000h,000h,000h,080h,000h,000h,000h,005h,067h,037h,0f7h,05bh,05bh,0deh,000h,000h	; 6393  ..........g7.[[...
	defb 000h,000h,000h,000h,001h,080h,000h,000h,000h,03ch,0d8h,0dch,000h,0b5h,0f5h,0a6h,000h,000h	; 63a5  .........<........
	defb 000h,000h,000h,000h,001h,040h,000h,000h,001h,0c0h,0e7h,032h,0abh,000h,000h,065h,006h,000h	; 63b7  .....@.....2...e..
	defb 000h,000h,000h,000h,000h,080h,000h,000h,003h,0aah,0f0h,07ch,000h,0ebh,0ffh,082h,00fh,000h	; 63c9  ...........|......
	defb 000h,000h,000h,000h,000h,080h,000h,000h,003h,055h,0fdh,077h,0bfh,094h,001h,0c0h,00eh,000h	; 63db  .........U.w......
	defb 000h,000h,000h,000h,000h,0c0h,000h,030h,00bh,003h,09ah,0abh,0d2h,067h,055h,0c0h,005h,040h	; 63ed  .......0.....gU..@
	defb 000h,000h,000h,000h,001h,080h,000h,078h,012h,07bh,06dh,07fh,0a9h,0fbh,0bfh,0c0h,002h,060h	; 63ff  .......x.{m......`
	defb 000h,000h,000h,000h,001h,080h,000h,067h,08dh,087h,09fh,000h,0dch,078h,000h,000h,002h,080h	; 6411  .......g.....x....
	defb 000h,018h,000h,000h,001h,040h,070h,01ch,07eh,074h,000h,0feh,0b3h,09ah,0abh,080h,001h,070h	; 6423  .....@p.~t.......p
	defb 000h,000h,000h,000h,001h,043h,0cch,003h,0f3h,0cdh,0ffh,054h,0aah,0e5h,056h,000h,002h,088h	; 6435  .....C.....T..V...
	defb 000h,000h,000h,000h,001h,0e0h,067h,0fdh,06dh,0b2h,0aah,0a9h,070h,014h,008h,002h,002h,088h	; 6447  ......g.m...p.....
	defb 000h,000h,000h,000h,000h,0f7h,0bfh,01ah,0ech,034h,000h,015h,0bfh,0fbh,060h,00dh,081h,070h	; 6459  .........4....`..p
	defb 000h,000h,000h,000h,006h,0cfh,078h,0cfh,0d3h,0cbh,0fdh,0cah,0c4h,000h,0a1h,0dah,0ddh,000h	; 646b  ......x...........
	defb 000h,000h,000h,000h,039h,038h,0c7h,03eh,03ch,07ah,0adh,0b2h,0b8h,079h,062h,0e7h,039h,000h	; 647d  ....98.><z...yb.9.
	defb 000h,000h,000h,001h,0e7h,0c7h,080h,0f9h,0c0h,000h,003h,0afh,0bbh,087h,083h,078h,0e5h,040h	; 648f  ...............x.@
	defb 000h,040h,000h,00fh,0deh,03fh,0ffh,0e7h,09bh,030h,0dbh,0ffh,0fch,078h,063h,07fh,0edh,060h	; 64a1  .@...?...0...xc..`
	defb 000h,040h,000h,071h,0e1h,0ffh,00fh,09eh,026h,0cfh,030h,000h,003h,09fh,033h,0bch,076h,0b0h	; 64b3  .@.q....&.0...3.v.
	defb 000h,040h,003h,08eh,0ffh,0e0h,0c7h,079h,06eh,035h,057h,0cfh,0ffh,0e3h,0d1h,0dbh,0bbh,0d0h	; 64c5  .@.....yn5W.......
	defb 000h,050h,01ch,076h,0fch,017h,0d3h,080h,015h,060h,00fh,033h,0ffh,0fch,061h,0dah,03bh,0d8h	; 64d7  .P.v.....`.3..a.;.
	defb 000h,060h,0e3h,0b1h,0e2h,0bch,02bh,0ffh,0abh,00fh,0feh,075h,0ffh,0ffh,080h,02dh,01ch,03ch	; 64e9  .`....+....u...-.<
	defb 000h,047h,01dh,08fh,015h,043h,05bh,0f8h,057h,030h,07dh,00dh,0f0h,007h,0dfh,0d6h,0efh,0fch	; 64fb  .G...C[.W0}.......
	defb 000h,03eh,0ech,078h,0abh,09dh,0b5h,0e7h,006h,07fh,0b8h,0f1h,0eah,0a7h,0e0h,016h,08fh,00eh	; 650d  .>.x..............
	defb 001h,0feh,003h,0c5h,05eh,076h,01dh,09ah,0ech,083h,0bbh,06dh,0d4h,033h,0f8h,07bh,046h,0f7h	; 651f  ....^v.....m.3.{F.
	defb 00fh,0e3h,0feh,02ah,0f1h,0c2h,000h,07dh,0d9h,0d7h,0d8h,001h,0a5h,0dbh,0f8h,03dh,0bah,0f7h	; 6531  ...*...}.......=..
	defb 0ffh,01dh,0f1h,057h,083h,0bbh,001h,0fdh,0d3h,0ffh,0dfh,0ffh,053h,0e3h,0fch,03dh,0abh,003h	; 6543  ...W........S..=..

; ----------------------------------------------------------------------
; DATOS pool_de_sprites: EL POOL DE SPRITES de la fase: entradas de 64 bytes
;   (16x16 con mascara, dibujo y mascara intercalados por linea, el mismo
;   formato que los sprites de naves). Lo fija el codigo del derrumbe: HL =
;   frame*64 + 0x6555, copiado al slot de trabajo 0x60 en 0x7D55 = 0x6555 +
;   0x60*64. Dibujadas las primeras 24 entradas salen los bichos andantes
;   limpios, con sus poses
;   0x6555..0x6644  (239 bytes)

; ----------------------------------------------------------------------
; MEDIDO sobre el binario (entrada 0, las 16 lineas): de los tres
; repartes posibles de los 4 bytes por linea, el UNICO que cuadra es
; mascara izda, mascara dcha, dibujo izdo, dibujo dcho. Y la relacion
; entre los dos no es la de "el dibujo cae donde la mascara esta a
; cero": es `dibujo and mascara == dibujo` en las 16 lineas, o sea que
; el dibujo va DENTRO de la mascara.
;
; CORREGIDO al leer el pintor (2026-08-21). De ahi se dedujo que la
; mascara era la SILUETA -uno donde el sprite ocupa- y que habria que
; invertirla antes del `and`, y las dos cosas son falsas: 0xAA6F hace
; `and` con la mascara TAL CUAL, sin un `cpl` por ningun lado, y
; 0xAAA6 `or` con el dibujo. Leido asi, cada pixel sale de dos bits:
; mascara 1 y dibujo 0 deja el fondo como esta (transparente),
; mascara 0 lo fuerza a NEGRO y dibujo 1 lo fuerza a BLANCO. O sea que
; la mascara vale UNO donde el sprite no toca, que es lo contrario de
; la silueta. Remedido ahora sobre las 96 entradas enteras (1536
; lineas, no una): ni una viola `dibujo and mascara == dibujo` -eso
; seguia bien- y 240 lineas son mascara 0xFFFF con dibujo 0x0000, o
; sea filas COMPLETAMENTE transparentes, que con la mascara-silueta
; serian filas que borran su franja entera de pantalla. El relleno con
; que las tiras de desplazamiento arrastran los bordes lo remacha:
; unos para la mascara (0xAA45) y ceros para el dibujo (0xAA7E), y en
; las dos el relleno tiene que querer decir "aqui no hay sprite".
; ----------------------------------------------------------------------
DATA_pool_de_sprites:
	defb 0ffh,0e3h	; 6555
	defb 000h,000h	; 6557
	defb 0ffh,0ebh	; 6559
	defb 000h,008h	; 655b
	defb 0f0h,0e9h	; 655d
	defb 000h,008h	; 655f
	defb 0f6h,00dh	; 6561
	defb 006h,00ch	; 6563
	defb 0f6h,069h	; 6565
	defb 006h,068h	; 6567
	defb 0f4h,00dh	; 6569
	defb 004h,00ch	; 656b
	defb 0f3h,0e5h	; 656d
	defb 003h,0e4h	; 656f
	defb 086h,021h	; 6571
	defb 006h,020h	; 6573
	defb 0b5h,0dch	; 6575
	defb 035h,0dch	; 6577
	defb 0a2h,02eh	; 6579
	defb 022h,02eh	; 657b
	defb 09bh,0ech	; 657d
	defb 01bh,0ech	; 657f
	defb 0bbh,0e1h	; 6581
	defb 03bh,0e0h	; 6583
	defb 09bh,0efh	; 6585
	defb 01bh,0e0h	; 6587
	defb 0c1h,0cfh	; 6589
	defb 001h,0c0h	; 658b
	defb 0fch,01fh	; 658d
	defb 000h,000h	; 658f
	defb 0ffh,0ffh	; 6591
	defb 000h,000h	; 6593
	defb 0ffh,087h	; 6595
	defb 000h,000h	; 6597
	defb 0e3h,037h	; 6599
	defb 000h,030h	; 659b
	defb 0cah,077h	; 659d
	defb 008h,070h	; 659f
	defb 0d0h,0c7h	; 65a1
	defb 010h,0c0h	; 65a3
	defb 017h,01fh	; 65a5
	defb 017h,000h	; 65a7
	defb 069h,087h	; 65a9
	defb 069h,080h	; 65ab
	defb 076h,0d4h	; 65ad
	defb 076h,0d0h	; 65af
	defb 029h,071h	; 65b1
	defb 029h,071h	; 65b3
	defb 09ch,0a2h	; 65b5
	defb 01ch,0a2h	; 65b7
	defb 0deh,0a4h	; 65b9
	defb 01eh,0a4h	; 65bb
	defb 0dfh,04ah	; 65bd
	defb 01fh,04ah	; 65bf
	defb 0ceh,0e8h	; 65c1
	defb 00eh,0e8h	; 65c3
	defb 0e0h,073h	; 65c5
	defb 000h,070h	; 65c7
	defb 0ffh,007h	; 65c9
	defb 000h,000h	; 65cb
	defb 0ffh,0ffh	; 65cd
	defb 000h,000h	; 65cf
	defb 0ffh,0ffh	; 65d1
	defb 000h,000h	; 65d3
	defb 0ffh,0ffh	; 65d5
	defb 000h,000h	; 65d7
	defb 0e0h,07fh	; 65d9
	defb 000h,000h	; 65db
	defb 0cbh,07fh	; 65dd
	defb 00bh,000h	; 65df
	defb 0ddh,07fh	; 65e1
	defb 01dh,000h	; 65e3
	defb 0dch,003h	; 65e5
	defb 01ch,000h	; 65e7
	defb 0c1h,0bbh	; 65e9
	defb 001h,0b8h	; 65eb
	defb 09eh,0dbh	; 65ed
	defb 01eh,0d8h	; 65ef
	defb 0bdh,043h	; 65f1
	defb 03dh,040h	; 65f3
	defb 0bdh,047h	; 65f5
	defb 03dh,040h	; 65f7
	defb 0bdh,057h	; 65f9
	defb 03dh,050h	; 65fb
	defb 09eh,0d7h	; 65fd
	defb 01eh,0d0h	; 65ff
	defb 0c1h,000h	; 6601
	defb 001h,000h	; 6603
	defb 0f7h,03eh	; 6605
	defb 007h,03eh	; 6607
	defb 0f7h,068h	; 6609
	defb 007h,068h	; 660b
	defb 0f2h,003h	; 660d
	defb 002h,000h	; 660f
	defb 0f8h,0ffh	; 6611
	defb 000h,000h	; 6613
	defb 0ffh,00fh	; 6615
	defb 000h,000h	; 6617
	defb 0feh,06fh	; 6619
	defb 000h,060h	; 661b
	defb 0f0h,0e3h	; 661d
	defb 000h,0e0h	; 661f
	defb 0e7h,059h	; 6621
	defb 007h,058h	; 6623
	defb 0efh,0a5h	; 6625
	defb 00fh,0a4h	; 6627
	defb 0efh,051h	; 6629
	defb 00fh,050h	; 662b
	defb 0eeh,057h	; 662d
	defb 00eh,050h	; 662f
	defb 0e4h,0b3h	; 6631
	defb 004h,0b0h	; 6633
	defb 0cbh,069h	; 6635
	defb 00bh,068h	; 6637
	defb 0dch,0cch	; 6639
	defb 01ch,0cch	; 663b
	defb 0dbh,086h	; 663d
	defb 01bh,086h	; 663f
	defb 0d0h,0d6h	; 6641
	defb 010h	; 6643

; ----------------------------------------------------------------------
; DATOS pool_de_sprites_tramo: Pool de sprites de la fase (tramo): las
;   entradas 3 a 11 del pool de 64 B de 0x6555, dibujadas limpias con la
;   geometria de 16x16 con mascara. Los recortes que habia aqui (dos rangos
;   sin clasificar y una "tabla" de 9 B) eran cortes arbitrarios en mitad de
;   los sprites
;   0x6644..0x682e  (490 bytes)
DATA_pool_de_sprites_tramo:
	defb 0c6h,0cch	; 6644
	defb 010h,00ch	; 6646
	defb 000h,0e2h	; 6648
	defb 07fh,002h	; 664a
	defb 000h,0f5h	; 664c
	defb 03fh,005h	; 664e
	defb 000h,0f0h	; 6650
	defb 0bfh,000h	; 6652
	defb 080h,0ffh	; 6654
	defb 0ffh,000h	; 6656
	defb 000h,0f8h	; 6658
	defb 03fh,000h	; 665a
	defb 000h,0f3h	; 665c
	defb 083h,003h	; 665e
	defb 080h,0f7h	; 6660
	defb 0d9h,007h	; 6662
	defb 0d8h,087h	; 6664
	defb 0ddh,007h	; 6666
	defb 0dch,037h	; 6668
	defb 0d9h,037h	; 666a
	defb 0d8h,074h	; 666c
	defb 045h,074h	; 666e
	defb 044h,03bh	; 6670
	defb 0adh,03bh	; 6672
	defb 0ach,084h	; 6674
	defb 061h,004h	; 6676
	defb 060h,0a7h	; 6678
	defb 0cfh,027h	; 667a
	defb 0c0h,0b0h	; 667c
	defb 02fh,030h	; 667e
	defb 020h,096h	; 6680
	defb 06fh,016h	; 6682
	defb 060h,0b0h	; 6684
	defb 06fh,030h	; 6686
	defb 060h,097h	; 6688
	defb 00fh,010h	; 668a
	defb 000h,0d7h	; 668c
	defb 0ffh,010h	; 668e
	defb 000h,0c7h	; 6690
	defb 0ffh,000h	; 6692
	defb 000h,0ffh	; 6694
	defb 0ffh,000h	; 6696
	defb 000h,0ffh	; 6698
	defb 0ffh,000h	; 669a
	defb 000h,0e0h	; 669c
	defb 0ffh,000h	; 669e
	defb 000h,0ceh	; 66a0
	defb 007h,00eh	; 66a2
	defb 000h,017h	; 66a4
	defb 073h,017h	; 66a6
	defb 070h,052h	; 66a8
	defb 0fbh,052h	; 66aa
	defb 0f8h,025h	; 66ac
	defb 07bh,025h	; 66ae
	defb 078h,045h	; 66b0
	defb 039h,045h	; 66b2
	defb 038h,08eh	; 66b4
	defb 094h,08eh	; 66b6
	defb 094h,02bh	; 66b8
	defb 06eh,00bh	; 66ba
	defb 06eh,0e1h	; 66bc
	defb 096h,001h	; 66be
	defb 096h,0f8h	; 66c0
	defb 0e8h,000h	; 66c2
	defb 0e8h,0e3h	; 66c4
	defb 00bh,003h	; 66c6
	defb 008h,0eeh	; 66c8
	defb 053h,00eh	; 66ca
	defb 010h,0ech	; 66cc
	defb 0c7h,00ch	; 66ce
	defb 000h,0e1h	; 66d0
	defb 0ffh,000h	; 66d2
	defb 000h,0ffh	; 66d4
	defb 01fh,000h	; 66d6
	defb 000h,0c0h	; 66d8
	defb 04fh,000h	; 66da
	defb 040h,016h	; 66dc
	defb 0efh,016h	; 66de
	defb 0e0h,07ch	; 66e0
	defb 0efh,07ch	; 66e2
	defb 0e0h,000h	; 66e4
	defb 083h,000h	; 66e6
	defb 080h,0ebh	; 66e8
	defb 079h,00bh	; 66ea
	defb 078h,0eah	; 66ec
	defb 0bdh,00ah	; 66ee
	defb 0bch,0e2h	; 66f0
	defb 0bdh,002h	; 66f2
	defb 0bch,0c2h	; 66f4
	defb 0bdh,002h	; 66f6
	defb 0bch,0dbh	; 66f8
	defb 079h,01bh	; 66fa
	defb 078h,0ddh	; 66fc
	defb 083h,01dh	; 66fe
	defb 080h,0c0h	; 6700
	defb 03bh,000h	; 6702
	defb 038h,0feh	; 6704
	defb 0bbh,000h	; 6706
	defb 0b8h,0feh	; 6708
	defb 0d3h,000h	; 670a
	defb 0d0h,0feh	; 670c
	defb 007h,000h	; 670e
	defb 000h,0ffh	; 6710
	defb 0ffh,000h	; 6712
	defb 000h,0fdh	; 6714
	defb 00fh,001h	; 6716
	defb 000h,0fch	; 6718
	defb 0afh,000h	; 671a
	defb 0a0h,0feh	; 671c
	defb 047h,000h	; 671e
	defb 040h,008h	; 6720
	defb 033h,000h	; 6722
	defb 030h,06bh	; 6724
	defb 00bh,063h	; 6726
	defb 008h,061h	; 6728
	defb 0dbh,061h	; 672a
	defb 0d8h,033h	; 672c
	defb 03bh,033h	; 672e
	defb 038h,096h	; 6730
	defb 0d3h,016h	; 6732
	defb 0d0h,0cdh	; 6734
	defb 027h,00dh	; 6736
	defb 020h,0eah	; 6738
	defb 077h,00ah	; 673a
	defb 070h,08ah	; 673c
	defb 0f7h,00ah	; 673e
	defb 0f0h,0a5h	; 6740
	defb 0f7h,025h	; 6742
	defb 0f0h,09ah	; 6744
	defb 0e7h,01ah	; 6746
	defb 0e0h,0c7h	; 6748
	defb 00fh,007h	; 674a
	defb 000h,0f6h	; 674c
	defb 07fh,006h	; 674e
	defb 000h,0f0h	; 6750
	defb 0ffh,000h	; 6752
	defb 000h,0ffh	; 6754
	defb 0ffh,000h	; 6756
	defb 000h,0ffh	; 6758
	defb 0ffh,000h	; 675a
	defb 000h,0ffh	; 675c
	defb 0f1h,000h	; 675e
	defb 000h,0ffh	; 6760
	defb 0f5h,000h	; 6762
	defb 004h,0f0h	; 6764
	defb 084h,000h	; 6766
	defb 004h,0f6h	; 6768
	defb 0b6h,006h	; 676a
	defb 036h,084h	; 676c
	defb 014h,004h	; 676e
	defb 014h,0b3h	; 6770
	defb 0e6h,033h	; 6772
	defb 0e6h,0a6h	; 6774
	defb 032h,026h	; 6776
	defb 032h,099h	; 6778
	defb 0cch,019h	; 677a
	defb 0cch,0bah	; 677c
	defb 02eh,03ah	; 677e
	defb 02eh,09bh	; 6780
	defb 0ech,01bh	; 6782
	defb 0ech,0c3h	; 6784
	defb 0e1h,003h	; 6786
	defb 0e0h,0fbh	; 6788
	defb 0efh,003h	; 678a
	defb 0e0h,0f9h	; 678c
	defb 0cfh,001h	; 678e
	defb 0c0h,0fch	; 6790
	defb 01fh,000h	; 6792
	defb 000h,0ffh	; 6794
	defb 0ffh,000h	; 6796
	defb 000h,0ffh	; 6798
	defb 0ffh,000h	; 679a
	defb 000h,0e1h	; 679c
	defb 0ffh,000h	; 679e
	defb 000h,0cch	; 67a0
	defb 03fh,00ch	; 67a2
	defb 000h,011h	; 67a4
	defb 0bfh,011h	; 67a6
	defb 080h,06eh	; 67a8
	defb 00fh,06eh	; 67aa
	defb 000h,073h	; 67ac
	defb 028h,073h	; 67ae
	defb 020h,02dh	; 67b0
	defb 0a2h,02dh	; 67b2
	defb 0a2h,092h	; 67b4
	defb 0c4h,012h	; 67b6
	defb 0c4h,0b9h	; 67b8
	defb 049h,039h	; 67ba
	defb 048h,0bdh	; 67bc
	defb 055h,03dh	; 67be
	defb 054h,0beh	; 67c0
	defb 0b1h,03eh	; 67c2
	defb 0b0h,09dh	; 67c4
	defb 0c7h,01dh	; 67c6
	defb 0c0h,0c0h	; 67c8
	defb 0dfh,000h	; 67ca
	defb 0c0h,0feh	; 67cc
	defb 01fh,000h	; 67ce
	defb 000h,0ffh	; 67d0
	defb 0ffh,000h	; 67d2
	defb 000h,0ffh	; 67d4
	defb 0ffh,000h	; 67d6
	defb 000h,0f0h	; 67d8
	defb 03fh,000h	; 67da
	defb 000h,0e5h	; 67dc
	defb 0bfh,005h	; 67de
	defb 080h,0eeh	; 67e0
	defb 0bfh,00eh	; 67e2
	defb 080h,0eeh	; 67e4
	defb 00fh,00eh	; 67e6
	defb 000h,081h	; 67e8
	defb 06fh,001h	; 67ea
	defb 060h,03dh	; 67ec
	defb 0afh,03dh	; 67ee
	defb 0a0h,07ah	; 67f0
	defb 08fh,07ah	; 67f2
	defb 080h,07ah	; 67f4
	defb 0bfh,07ah	; 67f6
	defb 080h,07ah	; 67f8
	defb 08fh,07ah	; 67fa
	defb 080h,03dh	; 67fc
	defb 0afh,03dh	; 67fe
	defb 0a0h,081h	; 6800
	defb 06fh,001h	; 6802
	defb 060h,0eeh	; 6804
	defb 003h,00eh	; 6806
	defb 000h,0eeh	; 6808
	defb 0fbh,00eh	; 680a
	defb 0f8h,0e5h	; 680c
	defb 0a3h,005h	; 680e
	defb 0a0h,0f0h	; 6810
	defb 00fh,000h	; 6812
	defb 000h,0ffh	; 6814
	defb 00fh,000h	; 6816
	defb 000h,0e0h	; 6818
	defb 06fh,000h	; 681a
	defb 060h,0ceh	; 681c
	defb 0e7h,00eh	; 681e
	defb 0e0h,0dfh	; 6820
	defb 053h,01fh	; 6822
	defb 050h,0deh	; 6824
	defb 0abh,01eh	; 6826
	defb 0a8h,0dch	; 6828
	defb 0abh,01ch	; 682a
	defb 0a8h,0c9h	; 682c

; ----------------------------------------------------------------------
; DATOS pool_de_sprites_continuacion: Pool de sprites de la fase
;   (continuacion): entradas de 64 B; los frames del derrumbe del protagonista
;   (0x50 en adelante) caen aqui, en 0x6555 + 0x50*64 = 0x7955
;   0x682e..0x7c78  (5194 bytes)
DATA_pool_de_sprites_continuacion:
	defb 063h,009h	; 682e
	defb 060h,096h	; 6830
	defb 0d7h,016h	; 6832
	defb 0d0h,0b9h	; 6834
	defb 097h,039h	; 6836
	defb 090h,0b7h	; 6838
	defb 007h,037h	; 683a
	defb 000h,088h	; 683c
	defb 0dfh,008h	; 683e
	defb 0c0h,0ech	; 6840
	defb 01fh,00ch	; 6842
	defb 000h,0e2h	; 6844
	defb 07fh,002h	; 6846
	defb 000h,0f5h	; 6848
	defb 03fh,005h	; 684a
	defb 000h,0f0h	; 684c
	defb 0bfh,000h	; 684e
	defb 080h,0feh	; 6850
	defb 03fh,000h	; 6852
	defb 000h,0f8h	; 6854
	defb 03fh,000h	; 6856
	defb 000h,0f3h	; 6858
	defb 09fh,003h	; 685a
	defb 080h,0f7h	; 685c
	defb 0dfh,007h	; 685e
	defb 0c0h,087h	; 6860
	defb 0c3h,007h	; 6862
	defb 0c0h,037h	; 6864
	defb 0d9h,037h	; 6866
	defb 0d8h,074h	; 6868
	defb 05dh,074h	; 686a
	defb 05ch,033h	; 686c
	defb 099h,033h	; 686e
	defb 098h,04ch	; 6870
	defb 065h,04ch	; 6872
	defb 064h,067h	; 6874
	defb 0cdh,067h	; 6876
	defb 0cch,028h	; 6878
	defb 021h,028h	; 687a
	defb 020h,06dh	; 687c
	defb 06fh,06ch	; 687e
	defb 060h,021h	; 6880
	defb 00fh,020h	; 6882
	defb 000h,0afh	; 6884
	defb 0ffh,020h	; 6886
	defb 000h,08fh	; 6888
	defb 0ffh,000h	; 688a
	defb 000h,0ffh	; 688c
	defb 0ffh,000h	; 688e
	defb 000h,0ffh	; 6890
	defb 0ffh,000h	; 6892
	defb 000h,0ffh	; 6894
	defb 0ffh,000h	; 6896
	defb 000h,0f8h	; 6898
	defb 07fh,000h	; 689a
	defb 000h,0fbh	; 689c
	defb 003h,003h	; 689e
	defb 000h,0e3h	; 68a0
	defb 0b9h,003h	; 68a2
	defb 0b8h,08dh	; 68a4
	defb 07dh,00dh	; 68a6
	defb 07ch,0aah	; 68a8
	defb 0bdh,02ah	; 68aa
	defb 0bch,092h	; 68ac
	defb 09dh,012h	; 68ae
	defb 09ch,023h	; 68b0
	defb 049h,023h	; 68b2
	defb 048h,045h	; 68b4
	defb 0b4h,045h	; 68b6
	defb 0b4h,014h	; 68b8
	defb 0ceh,004h	; 68ba
	defb 0ceh,0f0h	; 68bc
	defb 076h,000h	; 68be
	defb 076h,0fdh	; 68c0
	defb 088h,001h	; 68c2
	defb 088h,0fch	; 68c4
	defb 033h,000h	; 68c6
	defb 030h,0ffh	; 68c8
	defb 087h,000h	; 68ca
	defb 000h,0ffh	; 68cc
	defb 0ffh,000h	; 68ce
	defb 000h,0ffh	; 68d0
	defb 0ffh,000h	; 68d2
	defb 000h,0f0h	; 68d4
	defb 00fh,000h	; 68d6
	defb 000h,0c5h	; 68d8
	defb 0a7h,005h	; 68da
	defb 0a0h,0dfh	; 68dc
	defb 077h,01fh	; 68de
	defb 070h,0c0h	; 68e0
	defb 077h,000h	; 68e2
	defb 070h,0f6h	; 68e4
	defb 081h,006h	; 68e6
	defb 080h,0f5h	; 68e8
	defb 0bch,005h	; 68ea
	defb 0bch,0f1h	; 68ec
	defb 05eh,001h	; 68ee
	defb 05eh,0fdh	; 68f0
	defb 05eh,001h	; 68f2
	defb 05eh,0f1h	; 68f4
	defb 05eh,001h	; 68f6
	defb 05eh,0f5h	; 68f8
	defb 0bch,005h	; 68fa
	defb 0bch,0f6h	; 68fc
	defb 081h,006h	; 68fe
	defb 080h,0f0h	; 6900
	defb 077h,000h	; 6902
	defb 070h,0fdh	; 6904
	defb 077h,001h	; 6906
	defb 070h,0fdh	; 6908
	defb 0a7h,001h	; 690a
	defb 0a0h,0fch	; 690c
	defb 00fh,000h	; 690e
	defb 000h,0ffh	; 6910
	defb 0ffh,000h	; 6912
	defb 000h,0fch	; 6914
	defb 07fh,000h	; 6916
	defb 000h,0fdh	; 6918
	defb 00fh,001h	; 691a
	defb 000h,0fch	; 691c
	defb 0afh,000h	; 691e
	defb 0a0h,0feh	; 6920
	defb 047h,000h	; 6922
	defb 040h,0f8h	; 6924
	defb 037h,000h	; 6926
	defb 030h,0fbh	; 6928
	defb 011h,003h	; 692a
	defb 010h,0e0h	; 692c
	defb 0edh,000h	; 692e
	defb 0ech,0e9h	; 6930
	defb 09dh,009h	; 6932
	defb 09ch,0ebh	; 6934
	defb 069h,00bh	; 6936
	defb 068h,0c6h	; 6938
	defb 093h,006h	; 693a
	defb 090h,0d5h	; 693c
	defb 03bh,015h	; 693e
	defb 038h,0d5h	; 6940
	defb 07bh,015h	; 6942
	defb 078h,0cah	; 6944
	defb 0fbh,00ah	; 6946
	defb 0f8h,0e7h	; 6948
	defb 073h,007h	; 694a
	defb 070h,0f6h	; 694c
	defb 007h,006h	; 694e
	defb 000h,0f0h	; 6950
	defb 0ffh,000h	; 6952
	defb 000h,0ffh	; 6954
	defb 0ffh,000h	; 6956
	defb 000h,0ffh	; 6958
	defb 0ffh,000h	; 695a
	defb 000h,0ffh	; 695c
	defb 087h,000h	; 695e
	defb 000h,0f8h	; 6960
	defb 031h,000h	; 6962
	defb 030h,0e3h	; 6964
	defb 035h,003h	; 6966
	defb 034h,0ech	; 6968
	defb 014h,00ch	; 696a
	defb 014h,0edh	; 696c
	defb 0e6h,00dh	; 696e
	defb 0e6h,0c2h	; 6970
	defb 034h,002h	; 6972
	defb 034h,09dh	; 6974
	defb 0d6h,01dh	; 6976
	defb 0d6h,0bah	; 6978
	defb 022h,03ah	; 697a
	defb 022h,09bh	; 697c
	defb 0ech,01bh	; 697e
	defb 0ech,0c3h	; 6980
	defb 0eeh,003h	; 6982
	defb 0eeh,0fbh	; 6984
	defb 0ech,003h	; 6986
	defb 0ech,0f9h	; 6988
	defb 0c1h,001h	; 698a
	defb 0c0h,0fch	; 698c
	defb 01fh,000h	; 698e
	defb 000h,0ffh	; 6990
	defb 0ffh,000h	; 6992
	defb 000h,0f0h	; 6994
	defb 0ffh,000h	; 6996
	defb 000h,0e6h	; 6998
	defb 0ffh,006h	; 699a
	defb 000h,08ch	; 699c
	defb 021h,00ch	; 699e
	defb 000h,0b1h	; 69a0
	defb 0adh,031h	; 69a2
	defb 08ch,0bfh	; 69a4
	defb 00dh,03fh	; 69a6
	defb 00ch,099h	; 69a8
	defb 099h,019h	; 69aa
	defb 098h,0c6h	; 69ac
	defb 0d3h,006h	; 69ae
	defb 0d0h,0c9h	; 69b0
	defb 067h,009h	; 69b2
	defb 060h,0dch	; 69b4
	defb 0a1h,01ch	; 69b6
	defb 0a0h,0deh	; 69b8
	defb 0a5h,01eh	; 69ba
	defb 0a4h,0dfh	; 69bc
	defb 049h,01fh	; 69be
	defb 048h,0ceh	; 69c0
	defb 093h,00eh	; 69c2
	defb 090h,0e1h	; 69c4
	defb 0ebh,001h	; 69c6
	defb 0e8h,0fdh	; 69c8
	defb 0a3h,001h	; 69ca
	defb 0a0h,0fch	; 69cc
	defb 00fh,000h	; 69ce
	defb 000h,0ffh	; 69d0
	defb 0ffh,000h	; 69d2
	defb 000h,0ffh	; 69d4
	defb 0ffh,000h	; 69d6
	defb 000h,0f8h	; 69d8
	defb 0ffh,000h	; 69da
	defb 000h,0f2h	; 69dc
	defb 07fh,002h	; 69de
	defb 000h,0f7h	; 69e0
	defb 00fh,007h	; 69e2
	defb 000h,0f7h	; 69e4
	defb 06fh,007h	; 69e6
	defb 060h,0c1h	; 69e8
	defb 067h,001h	; 69ea
	defb 060h,09eh	; 69ec
	defb 097h,01eh	; 69ee
	defb 090h,0bdh	; 69f0
	defb 057h,03dh	; 69f2
	defb 050h,0bdh	; 69f4
	defb 047h,03dh	; 69f6
	defb 040h,0bdh	; 69f8
	defb 043h,03dh	; 69fa
	defb 040h,09eh	; 69fc
	defb 0dbh,01eh	; 69fe
	defb 0d8h,0c1h	; 6a00
	defb 0bbh,001h	; 6a02
	defb 0b8h,0dch	; 6a04
	defb 003h,01ch	; 6a06
	defb 000h,0ddh	; 6a08
	defb 0f7h,01dh	; 6a0a
	defb 0f0h,0cbh	; 6a0c
	defb 047h,00bh	; 6a0e
	defb 040h,0e0h	; 6a10
	defb 01fh,000h	; 6a12
	defb 000h,0ffh	; 6a14
	defb 0ffh,000h	; 6a16
	defb 000h,0ffh	; 6a18
	defb 0c3h,000h	; 6a1a
	defb 000h,0f0h	; 6a1c
	defb 01bh,000h	; 6a1e
	defb 018h,0e7h	; 6a20
	defb 039h,007h	; 6a22
	defb 038h,0efh	; 6a24
	defb 0b4h,00fh	; 6a26
	defb 0b4h,0efh	; 6a28
	defb 056h,00fh	; 6a2a
	defb 056h,08eh	; 6a2c
	defb 052h,00eh	; 6a2e
	defb 052h,0b4h	; 6a30
	defb 0b8h,034h	; 6a32
	defb 0b8h,0bbh	; 6a34
	defb 06bh,03bh	; 6a36
	defb 068h,094h	; 6a38
	defb 0c3h,014h	; 6a3a
	defb 0c0h,0b3h	; 6a3c
	defb 08fh,033h	; 6a3e
	defb 080h,088h	; 6a40
	defb 063h,008h	; 6a42
	defb 060h,0d4h	; 6a44
	defb 03bh,014h	; 6a46
	defb 038h,0c2h	; 6a48
	defb 09bh,002h	; 6a4a
	defb 018h,0f8h	; 6a4c
	defb 0c3h,000h	; 6a4e
	defb 000h,0ffh	; 6a50
	defb 0ffh,000h	; 6a52
	defb 000h,0ffh	; 6a54
	defb 0ffh,000h	; 6a56
	defb 000h,0f8h	; 6a58
	defb 03fh,000h	; 6a5a
	defb 000h,083h	; 6a5c
	defb 09fh,003h	; 6a5e
	defb 080h,037h	; 6a60
	defb 0dfh,037h	; 6a62
	defb 0c0h,077h	; 6a64
	defb 0c3h,077h	; 6a66
	defb 0c0h,037h	; 6a68
	defb 0d9h,037h	; 6a6a
	defb 0d8h,044h	; 6a6c
	defb 05dh,044h	; 6a6e
	defb 05ch,06bh	; 6a70
	defb 0b9h,06bh	; 6a72
	defb 0b8h,02ch	; 6a74
	defb 043h,02ch	; 6a76
	defb 040h,067h	; 6a78
	defb 0b7h,067h	; 6a7a
	defb 0b0h,028h	; 6a7c
	defb 037h,028h	; 6a7e
	defb 030h,0ach	; 6a80
	defb 0c7h,02ch	; 6a82
	defb 0c0h,08ch	; 6a84
	defb 01fh,00ch	; 6a86
	defb 000h,0e1h	; 6a88
	defb 0ffh,000h	; 6a8a
	defb 000h,0ffh	; 6a8c
	defb 0ffh,000h	; 6a8e
	defb 000h,0ffh	; 6a90
	defb 0ffh,000h	; 6a92
	defb 000h,0ffh	; 6a94
	defb 0ffh,000h	; 6a96
	defb 000h,0f0h	; 6a98
	defb 03fh,000h	; 6a9a
	defb 000h,0c5h	; 6a9c
	defb 0bfh,005h	; 6a9e
	defb 080h,0d7h	; 6aa0
	defb 087h,017h	; 6aa2
	defb 080h,0c9h	; 6aa4
	defb 073h,009h	; 6aa6
	defb 070h,092h	; 6aa8
	defb 0fbh,012h	; 6aaa
	defb 0f8h,0a5h	; 6aac
	defb 07bh,025h	; 6aae
	defb 078h,085h	; 6ab0
	defb 03bh,005h	; 6ab2
	defb 038h,0e6h	; 6ab4
	defb 093h,006h	; 6ab6
	defb 090h,0cbh	; 6ab8
	defb 063h,00bh	; 6aba
	defb 060h,099h	; 6abc
	defb 099h,019h	; 6abe
	defb 098h,0b0h	; 6ac0
	defb 0fdh,030h	; 6ac2
	defb 0fch,0b5h	; 6ac4
	defb 08dh,031h	; 6ac6
	defb 08ch,084h	; 6ac8
	defb 031h,000h	; 6aca
	defb 030h,0ffh	; 6acc
	defb 067h,000h	; 6ace
	defb 060h,0ffh	; 6ad0
	defb 00fh,000h	; 6ad2
	defb 000h,0f8h	; 6ad4
	defb 007h,000h	; 6ad6
	defb 000h,0e2h	; 6ad8
	defb 0d3h,002h	; 6ada
	defb 0d0h,0efh	; 6adc
	defb 0bbh,00fh	; 6ade
	defb 0b8h,0c0h	; 6ae0
	defb 03bh,000h	; 6ae2
	defb 038h,0ddh	; 6ae4
	defb 083h,01dh	; 6ae6
	defb 080h,0dbh	; 6ae8
	defb 079h,01bh	; 6aea
	defb 078h,0c2h	; 6aec
	defb 0bdh,002h	; 6aee
	defb 0bch,0e2h	; 6af0
	defb 0bdh,002h	; 6af2
	defb 0bch,0eah	; 6af4
	defb 0bdh,00ah	; 6af6
	defb 0bch,0e9h	; 6af8
	defb 079h,009h	; 6afa
	defb 078h,0e6h	; 6afc
	defb 083h,006h	; 6afe
	defb 080h,0f6h	; 6b00
	defb 0efh,006h	; 6b02
	defb 0e0h,0f0h	; 6b04
	defb 0efh,000h	; 6b06
	defb 0e0h,0feh	; 6b08
	defb 04fh,000h	; 6b0a
	defb 040h,0ffh	; 6b0c
	defb 01fh,000h	; 6b0e
	defb 000h,0ffh	; 6b10
	defb 0ffh,000h	; 6b12
	defb 000h,0ffh	; 6b14
	defb 0ffh,000h	; 6b16
	defb 000h,0c3h	; 6b18
	defb 01fh,000h	; 6b1a
	defb 000h,0d9h	; 6b1c
	defb 043h,018h	; 6b1e
	defb 040h,0dch	; 6b20
	defb 02bh,01ch	; 6b22
	defb 028h,0c6h	; 6b24
	defb 011h,006h	; 6b26
	defb 010h,0f1h	; 6b28
	defb 0cdh,001h	; 6b2a
	defb 0cch,0c3h	; 6b2c
	defb 029h,003h	; 6b2e
	defb 028h,0d6h	; 6b30
	defb 0ddh,016h	; 6b32
	defb 0dch,01dh	; 6b34
	defb 02dh,01dh	; 6b36
	defb 02ch,04ah	; 6b38
	defb 071h,04ah	; 6b3a
	defb 070h,06ah	; 6b3c
	defb 0f7h,06ah	; 6b3e
	defb 0f0h,02dh	; 6b40
	defb 0f7h,02dh	; 6b42
	defb 0f0h,09ch	; 6b44
	defb 0e7h,01ch	; 6b46
	defb 0e0h,0d8h	; 6b48
	defb 00fh,018h	; 6b4a
	defb 000h,0c3h	; 6b4c
	defb 0ffh,000h	; 6b4e
	defb 000h,0ffh	; 6b50
	defb 0ffh,000h	; 6b52
	defb 000h,0ffh	; 6b54
	defb 0ffh,000h	; 6b56
	defb 000h,0ffh	; 6b58
	defb 0ffh,000h	; 6b5a
	defb 000h,0f0h	; 6b5c
	defb 0ffh,000h	; 6b5e
	defb 000h,0f6h	; 6b60
	defb 00fh,006h	; 6b62
	defb 000h,0f6h	; 6b64
	defb 063h,006h	; 6b66
	defb 060h,0f4h	; 6b68
	defb 01bh,004h	; 6b6a
	defb 018h,0f3h	; 6b6c
	defb 0dbh,003h	; 6b6e
	defb 0d8h,086h	; 6b70
	defb 021h,006h	; 6b72
	defb 020h,0b5h	; 6b74
	defb 0ddh,035h	; 6b76
	defb 0dch,0a3h	; 6b78
	defb 0edh,023h	; 6b7a
	defb 0ech,098h	; 6b7c
	defb 009h,018h	; 6b7e
	defb 008h,0dbh	; 6b80
	defb 063h,01bh	; 6b82
	defb 060h,0cbh	; 6b84
	defb 0efh,00bh	; 6b86
	defb 0e0h,0e1h	; 6b88
	defb 0cfh,001h	; 6b8a
	defb 0c0h,0fch	; 6b8c
	defb 01fh,000h	; 6b8e
	defb 000h,0ffh	; 6b90
	defb 0ffh,000h	; 6b92
	defb 000h,0ffh	; 6b94
	defb 0ffh,000h	; 6b96
	defb 000h,0c3h	; 6b98
	defb 0ffh,000h	; 6b9a
	defb 000h,098h	; 6b9c
	defb 021h,018h	; 6b9e
	defb 000h,0a1h	; 6ba0
	defb 0adh,021h	; 6ba2
	defb 08ch,097h	; 6ba4
	defb 00dh,017h	; 6ba6
	defb 00ch,0b9h	; 6ba8
	defb 099h,039h	; 6baa
	defb 098h,096h	; 6bac
	defb 0d3h,016h	; 6bae
	defb 0d0h,0c7h	; 6bb0
	defb 067h,007h	; 6bb2
	defb 060h,0dbh	; 6bb4
	defb 0afh,01bh	; 6bb6
	defb 0a0h,0d9h	; 6bb8
	defb 0a3h,019h	; 6bba
	defb 0a0h,0deh	; 6bbc
	defb 04bh,01eh	; 6bbe
	defb 048h,0ceh	; 6bc0
	defb 0b3h,00eh	; 6bc2
	defb 0b0h,0e1h	; 6bc4
	defb 0c7h,001h	; 6bc6
	defb 0c0h,0fch	; 6bc8
	defb 09fh,000h	; 6bca
	defb 080h,0feh	; 6bcc
	defb 03fh,000h	; 6bce
	defb 000h,0ffh	; 6bd0
	defb 0ffh,000h	; 6bd2
	defb 000h,0ffh	; 6bd4
	defb 0ffh,000h	; 6bd6
	defb 000h,0f8h	; 6bd8
	defb 07fh,000h	; 6bda
	defb 000h,0e3h	; 6bdc
	defb 07fh,003h	; 6bde
	defb 000h,0cdh	; 6be0
	defb 07fh,00dh	; 6be2
	defb 000h,0dch	; 6be4
	defb 003h,01ch	; 6be6
	defb 000h,0c1h	; 6be8
	defb 0bbh,001h	; 6bea
	defb 0b8h,09ah	; 6bec
	defb 0dbh,01ah	; 6bee
	defb 0d8h,0bbh	; 6bf0
	defb 043h,03bh	; 6bf2
	defb 040h,0b3h	; 6bf4
	defb 047h,033h	; 6bf6
	defb 040h,0bbh	; 6bf8
	defb 057h,03bh	; 6bfa
	defb 050h,09ah	; 6bfc
	defb 097h,01ah	; 6bfe
	defb 090h,0c1h	; 6c00
	defb 067h,001h	; 6c02
	defb 060h,0f7h	; 6c04
	defb 06fh,007h	; 6c06
	defb 060h,0f3h	; 6c08
	defb 00fh,003h	; 6c0a
	defb 000h,0f8h	; 6c0c
	defb 07fh,000h	; 6c0e
	defb 000h,0ffh	; 6c10
	defb 0ffh,000h	; 6c12
	defb 000h,0ffh	; 6c14
	defb 01fh,000h	; 6c16
	defb 000h,0feh	; 6c18
	defb 04fh,000h	; 6c1a
	defb 040h,0f0h	; 6c1c
	defb 0e3h,000h	; 6c1e
	defb 0e0h,0e7h	; 6c20
	defb 059h,007h	; 6c22
	defb 058h,0efh	; 6c24
	defb 025h,00fh	; 6c26
	defb 024h,0ech	; 6c28
	defb 0d1h,00ch	; 6c2a
	defb 0d0h,0edh	; 6c2c
	defb 0d7h,00dh	; 6c2e
	defb 0d0h,0e3h	; 6c30
	defb 0b3h,003h	; 6c32
	defb 0b0h,0cbh	; 6c34
	defb 069h,00bh	; 6c36
	defb 068h,0dch	; 6c38
	defb 0cch,01ch	; 6c3a
	defb 0cch,0cbh	; 6c3c
	defb 086h,00bh	; 6c3e
	defb 086h,0d0h	; 6c40
	defb 0d6h,010h	; 6c42
	defb 0c6h,0cch	; 6c44
	defb 010h,00ch	; 6c46
	defb 000h,0e1h	; 6c48
	defb 0ffh,000h	; 6c4a
	defb 000h,0ffh	; 6c4c
	defb 0ffh,000h	; 6c4e
	defb 000h,0ffh	; 6c50
	defb 0ffh,000h	; 6c52
	defb 000h,0ffh	; 6c54
	defb 0ffh,000h	; 6c56
	defb 000h,0f8h	; 6c58
	defb 03fh,000h	; 6c5a
	defb 000h,0c3h	; 6c5c
	defb 09fh,003h	; 6c5e
	defb 080h,097h	; 6c60
	defb 0dfh,017h	; 6c62
	defb 0c0h,0b6h	; 6c64
	defb 0c7h,036h	; 6c66
	defb 0c0h,030h	; 6c68
	defb 013h,030h	; 6c6a
	defb 010h,047h	; 6c6c
	defb 0dbh,047h	; 6c6e
	defb 0d8h,06bh	; 6c70
	defb 0bbh,06bh	; 6c72
	defb 0b8h,00ch	; 6c74
	defb 043h,00ch	; 6c76
	defb 040h,0e7h	; 6c78
	defb 0b7h,007h	; 6c7a
	defb 0b0h,0e8h	; 6c7c
	defb 037h,008h	; 6c7e
	defb 030h,0ech	; 6c80
	defb 0c7h,00ch	; 6c82
	defb 0c0h,0ech	; 6c84
	defb 01fh,00ch	; 6c86
	defb 000h,0e1h	; 6c88
	defb 0ffh,000h	; 6c8a
	defb 000h,0ffh	; 6c8c
	defb 0ffh,000h	; 6c8e
	defb 000h,0ffh	; 6c90
	defb 0ffh,000h	; 6c92
	defb 000h,0ffh	; 6c94
	defb 0ffh,000h	; 6c96
	defb 000h,0ffh	; 6c98
	defb 0ffh,000h	; 6c9a
	defb 000h,0e0h	; 6c9c
	defb 0ffh,000h	; 6c9e
	defb 000h,0cah	; 6ca0
	defb 007h,00ah	; 6ca2
	defb 000h,0d7h	; 6ca4
	defb 073h,017h	; 6ca6
	defb 070h,0d2h	; 6ca8
	defb 07bh,012h	; 6caa
	defb 078h,0c5h	; 6cac
	defb 09bh,005h	; 6cae
	defb 098h,0e5h	; 6cb0
	defb 0d9h,005h	; 6cb2
	defb 0d8h,0eeh	; 6cb4
	defb 0e4h,00eh	; 6cb6
	defb 0e4h,0ebh	; 6cb8
	defb 06eh,00bh	; 6cba
	defb 06eh,0e1h	; 6cbc
	defb 094h,001h	; 6cbe
	defb 094h,0f8h	; 6cc0
	defb 0e9h,000h	; 6cc2
	defb 0e8h,0e3h	; 6cc4
	defb 00bh,003h	; 6cc6
	defb 008h,0eeh	; 6cc8
	defb 053h,00eh	; 6cca
	defb 010h,0ech	; 6ccc
	defb 0c7h,00ch	; 6cce
	defb 000h,0e1h	; 6cd0
	defb 0ffh,000h	; 6cd2
	defb 000h,0feh	; 6cd4
	defb 01fh,000h	; 6cd6
	defb 000h,0feh	; 6cd8
	defb 0c7h,000h	; 6cda
	defb 0c0h,0feh	; 6cdc
	defb 0b3h,000h	; 6cde
	defb 0b0h,0c0h	; 6ce0
	defb 03bh,000h	; 6ce2
	defb 038h,0ddh	; 6ce4
	defb 083h,01dh	; 6ce6
	defb 080h,0dbh	; 6ce8
	defb 059h,01bh	; 6cea
	defb 058h,0c2h	; 6cec
	defb 0ddh,002h	; 6cee
	defb 0dch,0e2h	; 6cf0
	defb 0cdh,002h	; 6cf2
	defb 0cch,0eah	; 6cf4
	defb 0ddh,00ah	; 6cf6
	defb 0dch,0e9h	; 6cf8
	defb 059h,009h	; 6cfa
	defb 058h,0e6h	; 6cfc
	defb 083h,006h	; 6cfe
	defb 080h,0f6h	; 6d00
	defb 0efh,006h	; 6d02
	defb 0e0h,0f0h	; 6d04
	defb 0cfh,000h	; 6d06
	defb 0c0h,0feh	; 6d08
	defb 01fh,000h	; 6d0a
	defb 000h,0ffh	; 6d0c
	defb 0ffh,000h	; 6d0e
	defb 000h,0ffh	; 6d10
	defb 0ffh,000h	; 6d12
	defb 000h,0ffh	; 6d14
	defb 0ffh,000h	; 6d16
	defb 000h,0c3h	; 6d18
	defb 0ffh,000h	; 6d1a
	defb 000h,0d9h	; 6d1c
	defb 08fh,018h	; 6d1e
	defb 000h,0dch	; 6d20
	defb 0a7h,01ch	; 6d22
	defb 020h,0c6h	; 6d24
	defb 017h,006h	; 6d26
	defb 010h,0f1h	; 6d28
	defb 0d3h,001h	; 6d2a
	defb 0d0h,0c3h	; 6d2c
	defb 029h,003h	; 6d2e
	defb 028h,0d6h	; 6d30
	defb 0ddh,016h	; 6d32
	defb 0dch,0ddh	; 6d34
	defb 0c9h,01dh	; 6d36
	defb 0c8h,0cbh	; 6d38
	defb 0b3h,00bh	; 6d3a
	defb 0b0h,08bh	; 6d3c
	defb 037h,00bh	; 6d3e
	defb 030h,0a4h	; 6d40
	defb 0f7h,024h	; 6d42
	defb 0f0h,0aeh	; 6d44
	defb 0e7h,02eh	; 6d46
	defb 0e0h,094h	; 6d48
	defb 00fh,014h	; 6d4a
	defb 000h,0c1h	; 6d4c
	defb 0ffh,000h	; 6d4e
	defb 000h,0ffh	; 6d50
	defb 0ffh,000h	; 6d52
	defb 000h,0ffh	; 6d54
	defb 0ffh,000h	; 6d56
	defb 000h,0ffh	; 6d58
	defb 0ffh,000h	; 6d5a
	defb 000h,0ffh	; 6d5c
	defb 0ffh,000h	; 6d5e
	defb 000h,0ffh	; 6d60
	defb 0ffh,000h	; 6d62
	defb 000h,0f0h	; 6d64
	defb 087h,000h	; 6d66
	defb 000h,0f6h	; 6d68
	defb 0b7h,006h	; 6d6a
	defb 030h,084h	; 6d6c
	defb 010h,004h	; 6d6e
	defb 010h,0b3h	; 6d70
	defb 0e6h,033h	; 6d72
	defb 0e6h,0a6h	; 6d74
	defb 032h,026h	; 6d76
	defb 032h,099h	; 6d78
	defb 0cch,019h	; 6d7a
	defb 0cch,0dbh	; 6d7c
	defb 0edh,01bh	; 6d7e
	defb 0ech,0c8h	; 6d80
	defb 009h,008h	; 6d82
	defb 008h,0e3h	; 6d84
	defb 063h,003h	; 6d86
	defb 060h,0fbh	; 6d88
	defb 0efh,003h	; 6d8a
	defb 0e0h,0f9h	; 6d8c
	defb 0cfh,001h	; 6d8e
	defb 0c0h,0fch	; 6d90
	defb 01fh,000h	; 6d92
	defb 000h,0ffh	; 6d94
	defb 0ffh,000h	; 6d96
	defb 000h,0ffh	; 6d98
	defb 0ffh,000h	; 6d9a
	defb 000h,0e1h	; 6d9c
	defb 0ffh,000h	; 6d9e
	defb 000h,0cch	; 6da0
	defb 03fh,00ch	; 6da2
	defb 000h,091h	; 6da4
	defb 0bfh,011h	; 6da6
	defb 080h,02eh	; 6da8
	defb 00fh,02eh	; 6daa
	defb 000h,073h	; 6dac
	defb 02fh,073h	; 6dae
	defb 020h,02dh	; 6db0
	defb 0afh,02dh	; 6db2
	defb 0a0h,08eh	; 6db4
	defb 0cfh,00eh	; 6db6
	defb 0c0h,0b7h	; 6db8
	defb 047h,037h	; 6dba
	defb 040h,0b3h	; 6dbc
	defb 057h,033h	; 6dbe
	defb 050h,0bch	; 6dc0
	defb 0b7h,03ch	; 6dc2
	defb 0b0h,09dh	; 6dc4
	defb 0c7h,01dh	; 6dc6
	defb 0c0h,0c0h	; 6dc8
	defb 09fh,000h	; 6dca
	defb 080h,0feh	; 6dcc
	defb 03fh,000h	; 6dce
	defb 000h,0ffh	; 6dd0
	defb 0ffh,000h	; 6dd2
	defb 000h,0ffh	; 6dd4
	defb 0ffh,000h	; 6dd6
	defb 000h,0fch	; 6dd8
	defb 03fh,000h	; 6dda
	defb 000h,0f1h	; 6ddc
	defb 0bfh,001h	; 6dde
	defb 080h,0e6h	; 6de0
	defb 0bfh,006h	; 6de2
	defb 080h,0eeh	; 6de4
	defb 00fh,00eh	; 6de6
	defb 000h,081h	; 6de8
	defb 06fh,001h	; 6dea
	defb 060h,035h	; 6dec
	defb 0afh,035h	; 6dee
	defb 0a0h,076h	; 6df0
	defb 08fh,076h	; 6df2
	defb 080h,066h	; 6df4
	defb 0bfh,066h	; 6df6
	defb 080h,076h	; 6df8
	defb 08fh,076h	; 6dfa
	defb 080h,035h	; 6dfc
	defb 0afh,035h	; 6dfe
	defb 0a0h,081h	; 6e00
	defb 06fh,001h	; 6e02
	defb 060h,0eeh	; 6e04
	defb 00fh,00eh	; 6e06
	defb 000h,0e6h	; 6e08
	defb 0bfh,006h	; 6e0a
	defb 080h,0f1h	; 6e0c
	defb 0bfh,001h	; 6e0e
	defb 080h,0fch	; 6e10
	defb 03fh,000h	; 6e12
	defb 000h,0ffh	; 6e14
	defb 01fh,000h	; 6e16
	defb 000h,0e0h	; 6e18
	defb 04fh,000h	; 6e1a
	defb 040h,0ceh	; 6e1c
	defb 0e7h,00eh	; 6e1e
	defb 0e0h,0deh	; 6e20
	defb 053h,01eh	; 6e22
	defb 050h,0d9h	; 6e24
	defb 0abh,019h	; 6e26
	defb 0a8h,0dbh	; 6e28
	defb 0abh,01bh	; 6e2a
	defb 0a8h,0c7h	; 6e2c
	defb 063h,007h	; 6e2e
	defb 060h,096h	; 6e30
	defb 0d7h,016h	; 6e32
	defb 0d0h,0b9h	; 6e34
	defb 097h,039h	; 6e36
	defb 090h,097h	; 6e38
	defb 007h,017h	; 6e3a
	defb 000h,0c8h	; 6e3c
	defb 0dfh,008h	; 6e3e
	defb 0c0h,0ech	; 6e40
	defb 01fh,00ch	; 6e42
	defb 000h,0e1h	; 6e44
	defb 0ffh,000h	; 6e46
	defb 000h,0ffh	; 6e48
	defb 0ffh,000h	; 6e4a
	defb 000h,0ffh	; 6e4c
	defb 0ffh,000h	; 6e4e
	defb 000h,0ffh	; 6e50
	defb 0ffh,000h	; 6e52
	defb 000h,0f8h	; 6e54
	defb 03fh,000h	; 6e56
	defb 000h,0f3h	; 6e58
	defb 09fh,003h	; 6e5a
	defb 080h,0f7h	; 6e5c
	defb 0dfh,007h	; 6e5e
	defb 0c0h,0c6h	; 6e60
	defb 0c7h,006h	; 6e62
	defb 0c0h,090h	; 6e64
	defb 013h,010h	; 6e66
	defb 010h,0b7h	; 6e68
	defb 0dbh,037h	; 6e6a
	defb 0d8h,033h	; 6e6c
	defb 099h,033h	; 6e6e
	defb 098h,04ch	; 6e70
	defb 065h,04ch	; 6e72
	defb 064h,067h	; 6e74
	defb 0cdh,067h	; 6e76
	defb 0cch,008h	; 6e78
	defb 021h,008h	; 6e7a
	defb 020h,0edh	; 6e7c
	defb 06fh,00ch	; 6e7e
	defb 060h,0e1h	; 6e80
	defb 00fh,000h	; 6e82
	defb 000h,0ffh	; 6e84
	defb 0ffh,000h	; 6e86
	defb 000h,0ffh	; 6e88
	defb 0ffh,000h	; 6e8a
	defb 000h,0ffh	; 6e8c
	defb 0ffh,000h	; 6e8e
	defb 000h,0ffh	; 6e90
	defb 0ffh,000h	; 6e92
	defb 000h,0ffh	; 6e94
	defb 0ffh,000h	; 6e96
	defb 000h,0fch	; 6e98
	defb 07fh,000h	; 6e9a
	defb 000h,0f9h	; 6e9c
	defb 003h,001h	; 6e9e
	defb 000h,0e3h	; 6ea0
	defb 0b9h,003h	; 6ea2
	defb 0b8h,0edh	; 6ea4
	defb 03dh,00dh	; 6ea6
	defb 03ch,0eah	; 6ea8
	defb 0cdh,00ah	; 6eaa
	defb 0cch,0e2h	; 6eac
	defb 0edh,002h	; 6eae
	defb 0ech,0f3h	; 6eb0
	defb 071h,003h	; 6eb2
	defb 070h,0f5h	; 6eb4
	defb 0b4h,005h	; 6eb6
	defb 0b4h,0f4h	; 6eb8
	defb 0ceh,004h	; 6eba
	defb 0ceh,0f0h	; 6ebc
	defb 074h,000h	; 6ebe
	defb 074h,0fdh	; 6ec0
	defb 089h,001h	; 6ec2
	defb 088h,0fch	; 6ec4
	defb 033h,000h	; 6ec6
	defb 030h,0ffh	; 6ec8
	defb 087h,000h	; 6eca
	defb 000h,0ffh	; 6ecc
	defb 0ffh,000h	; 6ece
	defb 000h,0ffh	; 6ed0
	defb 0ffh,000h	; 6ed2
	defb 000h,0fch	; 6ed4
	defb 03fh,000h	; 6ed6
	defb 000h,0fdh	; 6ed8
	defb 08fh,001h	; 6eda
	defb 080h,0fdh	; 6edc
	defb 067h,001h	; 6ede
	defb 060h,0f0h	; 6ee0
	defb 077h,000h	; 6ee2
	defb 070h,0f6h	; 6ee4
	defb 081h,006h	; 6ee6
	defb 080h,0f5h	; 6ee8
	defb 0ach,005h	; 6eea
	defb 0ach,0f1h	; 6eec
	defb 06eh,001h	; 6eee
	defb 06eh,0fdh	; 6ef0
	defb 066h,001h	; 6ef2
	defb 066h,0f1h	; 6ef4
	defb 06eh,001h	; 6ef6
	defb 06eh,0f5h	; 6ef8
	defb 0ach,005h	; 6efa
	defb 0ach,0f6h	; 6efc
	defb 081h,006h	; 6efe
	defb 080h,0f0h	; 6f00
	defb 077h,000h	; 6f02
	defb 070h,0fdh	; 6f04
	defb 067h,001h	; 6f06
	defb 060h,0fdh	; 6f08
	defb 08fh,001h	; 6f0a
	defb 080h,0fch	; 6f0c
	defb 03fh,000h	; 6f0e
	defb 000h,0ffh	; 6f10
	defb 0ffh,000h	; 6f12
	defb 000h,0ffh	; 6f14
	defb 0ffh,000h	; 6f16
	defb 000h,0ffh	; 6f18
	defb 0ffh,000h	; 6f1a
	defb 000h,0ffh	; 6f1c
	defb 0ffh,000h	; 6f1e
	defb 000h,0ffh	; 6f20
	defb 087h,000h	; 6f22
	defb 000h,0f8h	; 6f24
	defb 037h,000h	; 6f26
	defb 030h,0fbh	; 6f28
	defb 013h,003h	; 6f2a
	defb 010h,0e0h	; 6f2c
	defb 0e9h,000h	; 6f2e
	defb 0e8h,0e9h	; 6f30
	defb 09dh,009h	; 6f32
	defb 09ch,0ebh	; 6f34
	defb 069h,00bh	; 6f36
	defb 068h,0c6h	; 6f38
	defb 0e3h,006h	; 6f3a
	defb 0e0h,0d5h	; 6f3c
	defb 0dbh,015h	; 6f3e
	defb 0d8h,0d5h	; 6f40
	defb 09bh,015h	; 6f42
	defb 098h,0cah	; 6f44
	defb 07bh,00ah	; 6f46
	defb 078h,0e7h	; 6f48
	defb 073h,007h	; 6f4a
	defb 070h,0f2h	; 6f4c
	defb 007h,002h	; 6f4e
	defb 000h,0f8h	; 6f50
	defb 0ffh,000h	; 6f52
	defb 000h,0ffh	; 6f54
	defb 0ffh,000h	; 6f56
	defb 000h,0ffh	; 6f58
	defb 0ffh,000h	; 6f5a
	defb 000h,0ffh	; 6f5c
	defb 087h,000h	; 6f5e
	defb 000h,0f8h	; 6f60
	defb 037h,000h	; 6f62
	defb 030h,0e3h	; 6f64
	defb 037h,003h	; 6f66
	defb 030h,0ech	; 6f68
	defb 017h,00ch	; 6f6a
	defb 010h,0edh	; 6f6c
	defb 0e7h,00dh	; 6f6e
	defb 0e0h,0c2h	; 6f70
	defb 030h,002h	; 6f72
	defb 030h,0ddh	; 6f74
	defb 0d6h,01dh	; 6f76
	defb 0d6h,0dbh	; 6f78
	defb 0e2h,01bh	; 6f7a
	defb 0e2h,0c8h	; 6f7c
	defb 00ch,008h	; 6f7e
	defb 00ch,0e3h	; 6f80
	defb 06dh,003h	; 6f82
	defb 06ch,0fbh	; 6f84
	defb 0e9h,003h	; 6f86
	defb 0e8h,0f9h	; 6f88
	defb 0c3h,001h	; 6f8a
	defb 0c0h,0fch	; 6f8c
	defb 01fh,000h	; 6f8e
	defb 000h,0ffh	; 6f90
	defb 0ffh,000h	; 6f92
	defb 000h,0ffh	; 6f94
	defb 087h,000h	; 6f96
	defb 000h,0e3h	; 6f98
	defb 037h,000h	; 6f9a
	defb 030h,0cah	; 6f9c
	defb 077h,008h	; 6f9e
	defb 070h,0d0h	; 6fa0
	defb 0c7h,010h	; 6fa2
	defb 0c0h,097h	; 6fa4
	defb 01fh,017h	; 6fa6
	defb 000h,029h	; 6fa8
	defb 087h,029h	; 6faa
	defb 080h,076h	; 6fac
	defb 0d7h,076h	; 6fae
	defb 0d0h,027h	; 6fb0
	defb 077h,027h	; 6fb2
	defb 070h,09bh	; 6fb4
	defb 0a7h,01bh	; 6fb6
	defb 0a0h,0d9h	; 6fb8
	defb 0a3h,019h	; 6fba
	defb 0a0h,0deh	; 6fbc
	defb 04bh,01eh	; 6fbe
	defb 048h,0ceh	; 6fc0
	defb 0ebh,00eh	; 6fc2
	defb 0e8h,0e0h	; 6fc4
	defb 053h,000h	; 6fc6
	defb 050h,0ffh	; 6fc8
	defb 007h,000h	; 6fca
	defb 000h,0ffh	; 6fcc
	defb 0ffh,000h	; 6fce
	defb 000h,0ffh	; 6fd0
	defb 0ffh,000h	; 6fd2
	defb 000h,0ffh	; 6fd4
	defb 0ffh,000h	; 6fd6
	defb 000h,0ffh	; 6fd8
	defb 0ffh,000h	; 6fda
	defb 000h,0f8h	; 6fdc
	defb 07fh,000h	; 6fde
	defb 000h,0f3h	; 6fe0
	defb 00fh,003h	; 6fe2
	defb 000h,0f7h	; 6fe4
	defb 06fh,007h	; 6fe6
	defb 060h,0c1h	; 6fe8
	defb 067h,001h	; 6fea
	defb 060h,09ah	; 6fec
	defb 097h,01ah	; 6fee
	defb 090h,0bbh	; 6ff0
	defb 057h,03bh	; 6ff2
	defb 050h,0b3h	; 6ff4
	defb 047h,033h	; 6ff6
	defb 040h,0bbh	; 6ff8
	defb 043h,03bh	; 6ffa
	defb 040h,09ah	; 6ffc
	defb 0dbh,01ah	; 6ffe
	defb 0d8h,0c1h	; 7000
	defb 0bbh,001h	; 7002
	defb 0b8h,0dch	; 7004
	defb 003h,01ch	; 7006
	defb 000h,0cdh	; 7008
	defb 07fh,00dh	; 700a
	defb 000h,0e3h	; 700c
	defb 07fh,003h	; 700e
	defb 000h,0f8h	; 7010
	defb 07fh,000h	; 7012
	defb 000h,0ffh	; 7014
	defb 0ffh,000h	; 7016
	defb 000h,0ffh	; 7018
	defb 083h,000h	; 701a
	defb 000h,0f0h	; 701c
	defb 029h,000h	; 701e
	defb 028h,0e7h	; 7020
	defb 075h,007h	; 7022
	defb 074h,0efh	; 7024
	defb 025h,00fh	; 7026
	defb 024h,0ech	; 7028
	defb 0d1h,00ch	; 702a
	defb 0d0h,0cdh	; 702c
	defb 0d3h,00dh	; 702e
	defb 0d0h,093h	; 7030
	defb 0bbh,013h	; 7032
	defb 0b8h,0bbh	; 7034
	defb 06bh,03bh	; 7036
	defb 068h,094h	; 7038
	defb 0c3h,014h	; 703a
	defb 0c0h,0cbh	; 703c
	defb 08fh,00bh	; 703e
	defb 080h,0e8h	; 7040
	defb 063h,008h	; 7042
	defb 060h,0e5h	; 7044
	defb 03bh,004h	; 7046
	defb 038h,0f1h	; 7048
	defb 09bh,000h	; 704a
	defb 018h,0ffh	; 704c
	defb 0c3h,000h	; 704e
	defb 000h,0ffh	; 7050
	defb 0ffh,000h	; 7052
	defb 000h,0ffh	; 7054
	defb 0ffh,000h	; 7056
	defb 000h,0f8h	; 7058
	defb 03fh,000h	; 705a
	defb 000h,0f3h	; 705c
	defb 087h,003h	; 705e
	defb 080h,0f7h	; 7060
	defb 0d3h,007h	; 7062
	defb 0d0h,0c6h	; 7064
	defb 0dbh,006h	; 7066
	defb 0d8h,090h	; 7068
	defb 019h,010h	; 706a
	defb 018h,0b7h	; 706c
	defb 0c5h,037h	; 706e
	defb 0c4h,0bbh	; 7070
	defb 0adh,03bh	; 7072
	defb 0ach,084h	; 7074
	defb 061h,004h	; 7076
	defb 060h,0dbh	; 7078
	defb 0cfh,01bh	; 707a
	defb 0c0h,0d8h	; 707c
	defb 02fh,018h	; 707e
	defb 020h,0c6h	; 7080
	defb 06fh,006h	; 7082
	defb 060h,0f0h	; 7084
	defb 06fh,000h	; 7086
	defb 060h,0ffh	; 7088
	defb 00fh,000h	; 708a
	defb 000h,0ffh	; 708c
	defb 0ffh,000h	; 708e
	defb 000h,0ffh	; 7090
	defb 0ffh,000h	; 7092
	defb 000h,0ffh	; 7094
	defb 0ffh,000h	; 7096
	defb 000h,0fch	; 7098
	defb 07fh,000h	; 709a
	defb 000h,0f9h	; 709c
	defb 03fh,001h	; 709e
	defb 000h,0e3h	; 70a0
	defb 087h,003h	; 70a2
	defb 080h,0cdh	; 70a4
	defb 073h,00dh	; 70a6
	defb 070h,0d2h	; 70a8
	defb 07bh,012h	; 70aa
	defb 078h,0c5h	; 70ac
	defb 09bh,005h	; 70ae
	defb 098h,0f5h	; 70b0
	defb 0dbh,005h	; 70b2
	defb 0d8h,0e6h	; 70b4
	defb 0e3h,006h	; 70b6
	defb 0e0h,0cbh	; 70b8
	defb 069h,00bh	; 70ba
	defb 068h,099h	; 70bc
	defb 09dh,019h	; 70be
	defb 09ch,0b0h	; 70c0
	defb 0e9h,030h	; 70c2
	defb 0e8h,0b5h	; 70c4
	defb 085h,031h	; 70c6
	defb 084h,084h	; 70c8
	defb 019h,000h	; 70ca
	defb 018h,0ffh	; 70cc
	defb 0c3h,000h	; 70ce
	defb 000h,0ffh	; 70d0
	defb 0ffh,000h	; 70d2
	defb 000h,0ffh	; 70d4
	defb 0ffh,000h	; 70d6
	defb 000h,0feh	; 70d8
	defb 01fh,000h	; 70da
	defb 000h,0f0h	; 70dc
	defb 0cfh,000h	; 70de
	defb 0c0h,0f6h	; 70e0
	defb 0efh,006h	; 70e2
	defb 0e0h,0e6h	; 70e4
	defb 083h,006h	; 70e6
	defb 080h,0e9h	; 70e8
	defb 059h,009h	; 70ea
	defb 058h,0eah	; 70ec
	defb 0ddh,00ah	; 70ee
	defb 0dch,0e2h	; 70f0
	defb 0cdh,002h	; 70f2
	defb 0cch,0c2h	; 70f4
	defb 0ddh,002h	; 70f6
	defb 0dch,0dbh	; 70f8
	defb 059h,01bh	; 70fa
	defb 058h,0ddh	; 70fc
	defb 083h,01dh	; 70fe
	defb 080h,0c0h	; 7100
	defb 03bh,000h	; 7102
	defb 038h,0feh	; 7104
	defb 0b3h,000h	; 7106
	defb 0b0h,0feh	; 7108
	defb 0c7h,000h	; 710a
	defb 0c0h,0feh	; 710c
	defb 01fh,000h	; 710e
	defb 000h,0ffh	; 7110
	defb 0ffh,000h	; 7112
	defb 000h,0ffh	; 7114
	defb 0ffh,000h	; 7116
	defb 000h,0ffh	; 7118
	defb 0ffh,000h	; 711a
	defb 000h,0ffh	; 711c
	defb 087h,000h	; 711e
	defb 000h,008h	; 7120
	defb 033h,000h	; 7122
	defb 030h,06bh	; 7124
	defb 00bh,063h	; 7126
	defb 008h,061h	; 7128
	defb 0d3h,061h	; 712a
	defb 0d0h,033h	; 712c
	defb 03bh,033h	; 712e
	defb 038h,096h	; 7130
	defb 0d3h,016h	; 7132
	defb 0d0h,0cdh	; 7134
	defb 0c7h,00dh	; 7136
	defb 0c0h,0ebh	; 7138
	defb 0b7h,00bh	; 713a
	defb 0b0h,08bh	; 713c
	defb 037h,00bh	; 713e
	defb 030h,0a4h	; 7140
	defb 0f7h,024h	; 7142
	defb 0f0h,09ah	; 7144
	defb 0e7h,01ah	; 7146
	defb 0e0h,0c7h	; 7148
	defb 00fh,007h	; 714a
	defb 000h,0f2h	; 714c
	defb 07fh,002h	; 714e
	defb 000h,0f8h	; 7150
	defb 0ffh,000h	; 7152
	defb 000h,0ffh	; 7154
	defb 0ffh,000h	; 7156
	defb 000h,0ffh	; 7158
	defb 0ffh,000h	; 715a
	defb 000h,0f0h	; 715c
	defb 0ffh,000h	; 715e
	defb 000h,0f6h	; 7160
	defb 087h,006h	; 7162
	defb 000h,0f6h	; 7164
	defb 0b7h,006h	; 7166
	defb 030h,084h	; 7168
	defb 010h,004h	; 716a
	defb 010h,0b3h	; 716c
	defb 0e6h,033h	; 716e
	defb 0e6h,0b6h	; 7170
	defb 036h,036h	; 7172
	defb 036h,0a5h	; 7174
	defb 0d2h,025h	; 7176
	defb 0d2h,09bh	; 7178
	defb 0ech,01bh	; 717a
	defb 0ech,0dbh	; 717c
	defb 0edh,01bh	; 717e
	defb 0ech,0cbh	; 7180
	defb 069h,00bh	; 7182
	defb 068h,0e2h	; 7184
	defb 0a3h,002h	; 7186
	defb 0a0h,0fbh	; 7188
	defb 06fh,003h	; 718a
	defb 060h,0f9h	; 718c
	defb 0cfh,001h	; 718e
	defb 0c0h,0fch	; 7190
	defb 01fh,000h	; 7192
	defb 000h,0ffh	; 7194
	defb 0ffh,000h	; 7196
	defb 000h,0c3h	; 7198
	defb 0ffh,000h	; 719a
	defb 000h,0d8h	; 719c
	defb 021h,018h	; 719e
	defb 000h,099h	; 71a0
	defb 0adh,019h	; 71a2
	defb 08ch,0a7h	; 71a4
	defb 00dh,027h	; 71a6
	defb 00ch,029h	; 71a8
	defb 099h,029h	; 71aa
	defb 098h,076h	; 71ac
	defb 0d3h,076h	; 71ae
	defb 0d0h,02fh	; 71b0
	defb 067h,02fh	; 71b2
	defb 060h,09fh	; 71b4
	defb 0afh,01fh	; 71b6
	defb 0a0h,0b7h	; 71b8
	defb 0a3h,037h	; 71ba
	defb 0a0h,0abh	; 71bc
	defb 05bh,02bh	; 71be
	defb 058h,0b6h	; 71c0
	defb 09bh,036h	; 71c2
	defb 098h,09dh	; 71c4
	defb 0e3h,01dh	; 71c6
	defb 0e0h,0c0h	; 71c8
	defb 08fh,000h	; 71ca
	defb 080h,0feh	; 71cc
	defb 03fh,000h	; 71ce
	defb 000h,0ffh	; 71d0
	defb 0ffh,000h	; 71d2
	defb 000h,0ffh	; 71d4
	defb 0ffh,000h	; 71d6
	defb 000h,0fch	; 71d8
	defb 01fh,000h	; 71da
	defb 000h,0f1h	; 71dc
	defb 0dfh,001h	; 71de
	defb 0c0h,0e6h	; 71e0
	defb 0dfh,006h	; 71e2
	defb 0c0h,0eeh	; 71e4
	defb 003h,00eh	; 71e6
	defb 000h,081h	; 71e8
	defb 0bbh,001h	; 71ea
	defb 0b8h,03eh	; 71ec
	defb 0dbh,03eh	; 71ee
	defb 0d8h,06fh	; 71f0
	defb 043h,06fh	; 71f2
	defb 040h,057h	; 71f4
	defb 05fh,057h	; 71f6
	defb 040h,06fh	; 71f8
	defb 047h,06fh	; 71fa
	defb 040h,03eh	; 71fc
	defb 0d7h,03eh	; 71fe
	defb 0d0h,081h	; 7200
	defb 0b7h,001h	; 7202
	defb 0b0h,0eeh	; 7204
	defb 007h,00eh	; 7206
	defb 000h,0e6h	; 7208
	defb 0dfh,006h	; 720a
	defb 0c0h,0f1h	; 720c
	defb 0dfh,001h	; 720e
	defb 0c0h,0fch	; 7210
	defb 01fh,000h	; 7212
	defb 000h,0ffh	; 7214
	defb 01fh,000h	; 7216
	defb 000h,0e0h	; 7218
	defb 047h,000h	; 721a
	defb 040h,0ceh	; 721c
	defb 0f1h,00eh	; 721e
	defb 0f0h,0dbh	; 7220
	defb 04dh,01bh	; 7222
	defb 04ch,0d5h	; 7224
	defb 0adh,015h	; 7226
	defb 0ach,0dbh	; 7228
	defb 0d1h,01bh	; 722a
	defb 0d0h,0cfh	; 722c
	defb 0d3h,00fh	; 722e
	defb 0d0h,097h	; 7230
	defb 0bbh,017h	; 7232
	defb 0b8h,0bbh	; 7234
	defb 06bh,03bh	; 7236
	defb 068h,094h	; 7238
	defb 0c3h,014h	; 723a
	defb 0c0h,0d3h	; 723c
	defb 08fh,013h	; 723e
	defb 080h,0cch	; 7240
	defb 063h,00ch	; 7242
	defb 060h,0edh	; 7244
	defb 03bh,00ch	; 7246
	defb 038h,0e1h	; 7248
	defb 09bh,000h	; 724a
	defb 018h,0ffh	; 724c
	defb 0c3h,000h	; 724e
	defb 000h,0ffh	; 7250
	defb 0ffh,000h	; 7252
	defb 000h,0f8h	; 7254
	defb 03fh,000h	; 7256
	defb 000h,0f3h	; 7258
	defb 09fh,003h	; 725a
	defb 080h,0f7h	; 725c
	defb 0dfh,007h	; 725e
	defb 0c0h,0c7h	; 7260
	defb 0c7h,007h	; 7262
	defb 0c0h,096h	; 7264
	defb 0d3h,016h	; 7266
	defb 0d0h,0b5h	; 7268
	defb 05bh,035h	; 726a
	defb 058h,036h	; 726c
	defb 0d9h,036h	; 726e
	defb 0d8h,04bh	; 7270
	defb 0a5h,04bh	; 7272
	defb 0a4h,06ch	; 7274
	defb 06dh,06ch	; 7276
	defb 06ch,067h	; 7278
	defb 0cdh,067h	; 727a
	defb 0cch,008h	; 727c
	defb 021h,008h	; 727e
	defb 020h,0edh	; 7280
	defb 06fh,00ch	; 7282
	defb 060h,0edh	; 7284
	defb 00fh,00ch	; 7286
	defb 000h,0e1h	; 7288
	defb 0ffh,000h	; 728a
	defb 000h,0ffh	; 728c
	defb 0ffh,000h	; 728e
	defb 000h,0ffh	; 7290
	defb 0ffh,000h	; 7292
	defb 000h,0f8h	; 7294
	defb 0ffh,000h	; 7296
	defb 000h,0e2h	; 7298
	defb 007h,002h	; 729a
	defb 000h,08fh	; 729c
	defb 073h,00fh	; 729e
	defb 070h,0b2h	; 72a0
	defb 0dbh,032h	; 72a2
	defb 0d8h,0b5h	; 72a4
	defb 0abh,035h	; 72a6
	defb 0a8h,08bh	; 72a8
	defb 0dbh,00bh	; 72aa
	defb 0d8h,0cbh	; 72ac
	defb 0f3h,00bh	; 72ae
	defb 0f0h,0ddh	; 72b0
	defb 0e9h,01dh	; 72b2
	defb 0e8h,0d6h	; 72b4
	defb 0ddh,016h	; 72b6
	defb 0dch,0c3h	; 72b8
	defb 029h,003h	; 72ba
	defb 028h,0f1h	; 72bc
	defb 0cbh,001h	; 72be
	defb 0c8h,0c6h	; 72c0
	defb 033h,006h	; 72c2
	defb 030h,0dch	; 72c4
	defb 0b7h,01ch	; 72c6
	defb 030h,0d9h	; 72c8
	defb 087h,018h	; 72ca
	defb 000h,0c3h	; 72cc
	defb 0ffh,000h	; 72ce
	defb 000h,0ffh	; 72d0
	defb 0ffh,000h	; 72d2
	defb 000h,0f8h	; 72d4
	defb 03fh,000h	; 72d6
	defb 000h,0fbh	; 72d8
	defb 08fh,003h	; 72da
	defb 080h,0fbh	; 72dc
	defb 067h,003h	; 72de
	defb 060h,0c0h	; 72e0
	defb 077h,000h	; 72e2
	defb 070h,0ddh	; 72e4
	defb 081h,01dh	; 72e6
	defb 080h,0dbh	; 72e8
	defb 07ch,01bh	; 72ea
	defb 07ch,0c2h	; 72ec
	defb 0deh,002h	; 72ee
	defb 0deh,0fah	; 72f0
	defb 0aeh,002h	; 72f2
	defb 0aeh,0e2h	; 72f4
	defb 0deh,002h	; 72f6
	defb 0deh,0ebh	; 72f8
	defb 07ch,00bh	; 72fa
	defb 07ch,0edh	; 72fc
	defb 081h,00dh	; 72fe
	defb 080h,0e0h	; 7300
	defb 077h,000h	; 7302
	defb 070h,0fbh	; 7304
	defb 067h,003h	; 7306
	defb 060h,0fbh	; 7308
	defb 08fh,003h	; 730a
	defb 080h,0f8h	; 730c
	defb 03fh,000h	; 730e
	defb 000h,0ffh	; 7310
	defb 0ffh,000h	; 7312
	defb 000h,0e1h	; 7314
	defb 0ffh,000h	; 7316
	defb 000h,0ech	; 7318
	defb 0c3h,00ch	; 731a
	defb 000h,0eeh	; 731c
	defb 05bh,00eh	; 731e
	defb 018h,0e3h	; 7320
	defb 019h,003h	; 7322
	defb 018h,0f8h	; 7324
	defb 0e5h,000h	; 7326
	defb 0e4h,0e1h	; 7328
	defb 094h,001h	; 732a
	defb 094h,0ebh	; 732c
	defb 06eh,00bh	; 732e
	defb 06eh,0eeh	; 7330
	defb 0b4h,00eh	; 7332
	defb 0b4h,0e5h	; 7334
	defb 059h,005h	; 7336
	defb 058h,0c5h	; 7338
	defb 0bdh,005h	; 733a
	defb 0bch,0dah	; 733c
	defb 0fdh,01ah	; 733e
	defb 0fch,0d9h	; 7340
	defb 07dh,019h	; 7342
	defb 07ch,0c7h	; 7344
	defb 0b9h,007h	; 7346
	defb 0b8h,0f1h	; 7348
	defb 003h,001h	; 734a
	defb 000h,0fch	; 734c
	defb 07fh,000h	; 734e
	defb 000h,0ffh	; 7350
	defb 0ffh,000h	; 7352
	defb 000h,0ffh	; 7354
	defb 0ffh,000h	; 7356
	defb 000h,0ffh	; 7358
	defb 0ffh,000h	; 735a
	defb 000h,0ffh	; 735c
	defb 0ffh,000h	; 735e
	defb 000h,0f0h	; 7360
	defb 087h,000h	; 7362
	defb 000h,0f6h	; 7364
	defb 0b7h,006h	; 7366
	defb 030h,084h	; 7368
	defb 010h,004h	; 736a
	defb 010h,0b3h	; 736c
	defb 0e6h,033h	; 736e
	defb 0e6h,0b6h	; 7370
	defb 036h,036h	; 7372
	defb 036h,0a5h	; 7374
	defb 0d2h,025h	; 7376
	defb 0d2h,09bh	; 7378
	defb 0ech,01bh	; 737a
	defb 0ech,0dbh	; 737c
	defb 06dh,01bh	; 737e
	defb 06ch,0cah	; 7380
	defb 0a9h,00ah	; 7382
	defb 0a8h,0e3h	; 7384
	defb 063h,003h	; 7386
	defb 060h,0fbh	; 7388
	defb 0efh,003h	; 738a
	defb 0e0h,0f9h	; 738c
	defb 0cfh,001h	; 738e
	defb 0c0h,0fch	; 7390
	defb 01fh,000h	; 7392
	defb 000h,0ffh	; 7394
	defb 0ffh,000h	; 7396
	defb 000h,0c3h	; 7398
	defb 0ffh,000h	; 739a
	defb 000h,0dah	; 739c
	defb 01fh,018h	; 739e
	defb 000h,098h	; 73a0
	defb 0dfh,018h	; 73a2
	defb 0c0h,0a7h	; 73a4
	defb 007h,027h	; 73a6
	defb 000h,029h	; 73a8
	defb 097h,029h	; 73aa
	defb 090h,076h	; 73ac
	defb 0d7h,076h	; 73ae
	defb 0d0h,02fh	; 73b0
	defb 067h,02fh	; 73b2
	defb 060h,09bh	; 73b4
	defb 0afh,01bh	; 73b6
	defb 0a0h,0b5h	; 73b8
	defb 0a3h,035h	; 73ba
	defb 0a0h,0bbh	; 73bc
	defb 05bh,03bh	; 73be
	defb 058h,0beh	; 73c0
	defb 09bh,03eh	; 73c2
	defb 098h,09dh	; 73c4
	defb 0e3h,01dh	; 73c6
	defb 0e0h,0c0h	; 73c8
	defb 08fh,000h	; 73ca
	defb 080h,0feh	; 73cc
	defb 03fh,000h	; 73ce
	defb 000h,0ffh	; 73d0
	defb 0ffh,000h	; 73d2
	defb 000h,0ffh	; 73d4
	defb 0ffh,000h	; 73d6
	defb 000h,0fch	; 73d8
	defb 01fh,000h	; 73da
	defb 000h,0f1h	; 73dc
	defb 0dfh,001h	; 73de
	defb 0c0h,0e6h	; 73e0
	defb 0dfh,006h	; 73e2
	defb 0c0h,0eeh	; 73e4
	defb 007h,00eh	; 73e6
	defb 000h,081h	; 73e8
	defb 0b7h,001h	; 73ea
	defb 0b0h,03eh	; 73ec
	defb 0d7h,03eh	; 73ee
	defb 0d0h,077h	; 73f0
	defb 047h,077h	; 73f2
	defb 040h,06bh	; 73f4
	defb 05fh,06bh	; 73f6
	defb 040h,077h	; 73f8
	defb 047h,077h	; 73fa
	defb 040h,03eh	; 73fc
	defb 0d7h,03eh	; 73fe
	defb 0d0h,081h	; 7400
	defb 0b7h,001h	; 7402
	defb 0b0h,0eeh	; 7404
	defb 007h,00eh	; 7406
	defb 000h,0e6h	; 7408
	defb 0dfh,006h	; 740a
	defb 0c0h,0f1h	; 740c
	defb 0dfh,001h	; 740e
	defb 0c0h,0fch	; 7410
	defb 01fh,000h	; 7412
	defb 000h,0ffh	; 7414
	defb 01fh,000h	; 7416
	defb 000h,0e0h	; 7418
	defb 047h,000h	; 741a
	defb 040h,0ceh	; 741c
	defb 0f1h,00eh	; 741e
	defb 0f0h,0dfh	; 7420
	defb 04dh,01fh	; 7422
	defb 04ch,0ddh	; 7424
	defb 0adh,01dh	; 7426
	defb 0ach,0dah	; 7428
	defb 0d1h,01ah	; 742a
	defb 0d0h,0cdh	; 742c
	defb 0d7h,00dh	; 742e
	defb 0d0h,097h	; 7430
	defb 0b3h,017h	; 7432
	defb 0b0h,0bbh	; 7434
	defb 06bh,03bh	; 7436
	defb 068h,094h	; 7438
	defb 0cbh,014h	; 743a
	defb 0c8h,0d3h	; 743c
	defb 083h,013h	; 743e
	defb 080h,0cch	; 7440
	defb 06fh,00ch	; 7442
	defb 060h,0edh	; 7444
	defb 00fh,00ch	; 7446
	defb 000h,0e1h	; 7448
	defb 0ffh,000h	; 744a
	defb 000h,0ffh	; 744c
	defb 0ffh,000h	; 744e
	defb 000h,0ffh	; 7450
	defb 0ffh,000h	; 7452
	defb 000h,0f8h	; 7454
	defb 03fh,000h	; 7456
	defb 000h,0f3h	; 7458
	defb 09fh,003h	; 745a
	defb 080h,0f7h	; 745c
	defb 0dfh,007h	; 745e
	defb 0c0h,0c6h	; 7460
	defb 0c7h,006h	; 7462
	defb 0c0h,095h	; 7464
	defb 053h,015h	; 7466
	defb 050h,0b6h	; 7468
	defb 0dbh,036h	; 746a
	defb 0d8h,037h	; 746c
	defb 0d9h,037h	; 746e
	defb 0d8h,04bh	; 7470
	defb 0a5h,04bh	; 7472
	defb 0a4h,06ch	; 7474
	defb 06dh,06ch	; 7476
	defb 06ch,067h	; 7478
	defb 0cdh,067h	; 747a
	defb 0cch,008h	; 747c
	defb 021h,008h	; 747e
	defb 020h,0edh	; 7480
	defb 06fh,00ch	; 7482
	defb 060h,0e1h	; 7484
	defb 00fh,000h	; 7486
	defb 000h,0ffh	; 7488
	defb 0ffh,000h	; 748a
	defb 000h,0ffh	; 748c
	defb 0ffh,000h	; 748e
	defb 000h,0ffh	; 7490
	defb 0ffh,000h	; 7492
	defb 000h,0f8h	; 7494
	defb 0ffh,000h	; 7496
	defb 000h,0e2h	; 7498
	defb 007h,002h	; 749a
	defb 000h,08fh	; 749c
	defb 073h,00fh	; 749e
	defb 070h,0b2h	; 74a0
	defb 0fbh,032h	; 74a2
	defb 0f8h,0b5h	; 74a4
	defb 0bbh,035h	; 74a6
	defb 0b8h,08bh	; 74a8
	defb 05bh,00bh	; 74aa
	defb 058h,0ebh	; 74ac
	defb 0b3h,00bh	; 74ae
	defb 0b0h,0cdh	; 74b0
	defb 0e9h,00dh	; 74b2
	defb 0e8h,0d6h	; 74b4
	defb 0ddh,016h	; 74b6
	defb 0dch,0d3h	; 74b8
	defb 029h,013h	; 74ba
	defb 028h,0c1h	; 74bc
	defb 0cbh,001h	; 74be
	defb 0c8h,0f6h	; 74c0
	defb 033h,006h	; 74c2
	defb 030h,0f0h	; 74c4
	defb 0b7h,000h	; 74c6
	defb 030h,0ffh	; 74c8
	defb 087h,000h	; 74ca
	defb 000h,0ffh	; 74cc
	defb 0ffh,000h	; 74ce
	defb 000h,0ffh	; 74d0
	defb 0ffh,000h	; 74d2
	defb 000h,0f8h	; 74d4
	defb 03fh,000h	; 74d6
	defb 000h,0fbh	; 74d8
	defb 08fh,003h	; 74da
	defb 080h,0fbh	; 74dc
	defb 067h,003h	; 74de
	defb 060h,0e0h	; 74e0
	defb 077h,000h	; 74e2
	defb 070h,0edh	; 74e4
	defb 081h,00dh	; 74e6
	defb 080h,0ebh	; 74e8
	defb 07ch,00bh	; 74ea
	defb 07ch,0e2h	; 74ec
	defb 0eeh,002h	; 74ee
	defb 0eeh,0fah	; 74f0
	defb 0d6h,002h	; 74f2
	defb 0d6h,0e2h	; 74f4
	defb 0eeh,002h	; 74f6
	defb 0eeh,0ebh	; 74f8
	defb 07ch,00bh	; 74fa
	defb 07ch,0edh	; 74fc
	defb 081h,00dh	; 74fe
	defb 080h,0e0h	; 7500
	defb 077h,000h	; 7502
	defb 070h,0fbh	; 7504
	defb 067h,003h	; 7506
	defb 060h,0fbh	; 7508
	defb 08fh,003h	; 750a
	defb 080h,0f8h	; 750c
	defb 03fh,000h	; 750e
	defb 000h,0ffh	; 7510
	defb 0ffh,000h	; 7512
	defb 000h,0ffh	; 7514
	defb 0ffh,000h	; 7516
	defb 000h,0ffh	; 7518
	defb 0c3h,000h	; 751a
	defb 000h,0f8h	; 751c
	defb 05bh,000h	; 751e
	defb 018h,0fbh	; 7520
	defb 019h,003h	; 7522
	defb 018h,0e0h	; 7524
	defb 0e5h,000h	; 7526
	defb 0e4h,0e9h	; 7528
	defb 094h,009h	; 752a
	defb 094h,0ebh	; 752c
	defb 06eh,00bh	; 752e
	defb 06eh,0e6h	; 7530
	defb 0f4h,006h	; 7532
	defb 0f4h,0f5h	; 7534
	defb 0d9h,005h	; 7536
	defb 0d8h,0c5h	; 7538
	defb 0adh,005h	; 753a
	defb 0ach,0dah	; 753c
	defb 0ddh,01ah	; 753e
	defb 0dch,0d9h	; 7540
	defb 07dh,019h	; 7542
	defb 07ch,0c7h	; 7544
	defb 0b9h,007h	; 7546
	defb 0b8h,0f1h	; 7548
	defb 003h,001h	; 754a
	defb 000h,0fch	; 754c
	defb 07fh,000h	; 754e
	defb 000h,0ffh	; 7550
	defb 0ffh,000h	; 7552
	defb 000h,0ffh	; 7554
	defb 0ffh,000h	; 7556
	defb 000h,0ffh	; 7558
	defb 0ffh,000h	; 755a
	defb 000h,0ffh	; 755c
	defb 087h,000h	; 755e
	defb 000h,0f0h	; 7560
	defb 0b7h,000h	; 7562
	defb 030h,0f6h	; 7564
	defb 0b7h,006h	; 7566
	defb 030h,084h	; 7568
	defb 010h,004h	; 756a
	defb 010h,0b3h	; 756c
	defb 0e6h,033h	; 756e
	defb 0e6h,0b6h	; 7570
	defb 036h,036h	; 7572
	defb 036h,0a5h	; 7574
	defb 0d2h,025h	; 7576
	defb 0d2h,09bh	; 7578
	defb 06ch,01bh	; 757a
	defb 06ch,0dah	; 757c
	defb 0adh,01ah	; 757e
	defb 0ach,0cbh	; 7580
	defb 069h,00bh	; 7582
	defb 068h,0e3h	; 7584
	defb 0e3h,003h	; 7586
	defb 0e0h,0fbh	; 7588
	defb 0efh,003h	; 758a
	defb 0e0h,0f9h	; 758c
	defb 0cfh,001h	; 758e
	defb 0c0h,0fch	; 7590
	defb 01fh,000h	; 7592
	defb 000h,0ffh	; 7594
	defb 087h,000h	; 7596
	defb 000h,0c3h	; 7598
	defb 037h,000h	; 759a
	defb 030h,0dah	; 759c
	defb 077h,018h	; 759e
	defb 070h,098h	; 75a0
	defb 0c7h,018h	; 75a2
	defb 0c0h,0a7h	; 75a4
	defb 01fh,027h	; 75a6
	defb 000h,029h	; 75a8
	defb 087h,029h	; 75aa
	defb 080h,076h	; 75ac
	defb 0d7h,076h	; 75ae
	defb 0d0h,02dh	; 75b0
	defb 077h,02dh	; 75b2
	defb 070h,09ah	; 75b4
	defb 0a7h,01ah	; 75b6
	defb 0a0h,0bdh	; 75b8
	defb 0a3h,03dh	; 75ba
	defb 0a0h,0bfh	; 75bc
	defb 05bh,03fh	; 75be
	defb 058h,0beh	; 75c0
	defb 09bh,03eh	; 75c2
	defb 098h,09dh	; 75c4
	defb 0e3h,01dh	; 75c6
	defb 0e0h,0c0h	; 75c8
	defb 08fh,000h	; 75ca
	defb 080h,0feh	; 75cc
	defb 03fh,000h	; 75ce
	defb 000h,0ffh	; 75d0
	defb 0ffh,000h	; 75d2
	defb 000h,0ffh	; 75d4
	defb 0ffh,000h	; 75d6
	defb 000h,0fch	; 75d8
	defb 01fh,000h	; 75da
	defb 000h,0f1h	; 75dc
	defb 0dfh,001h	; 75de
	defb 0c0h,0e6h	; 75e0
	defb 0dfh,006h	; 75e2
	defb 0c0h,0eeh	; 75e4
	defb 007h,00eh	; 75e6
	defb 000h,081h	; 75e8
	defb 0b7h,001h	; 75ea
	defb 0b0h,03eh	; 75ec
	defb 0d7h,03eh	; 75ee
	defb 0d0h,07bh	; 75f0
	defb 047h,07bh	; 75f2
	defb 040h,075h	; 75f4
	defb 05fh,075h	; 75f6
	defb 040h,07bh	; 75f8
	defb 043h,07bh	; 75fa
	defb 040h,03eh	; 75fc
	defb 0dbh,03eh	; 75fe
	defb 0d8h,081h	; 7600
	defb 0bbh,001h	; 7602
	defb 0b8h,0eeh	; 7604
	defb 003h,00eh	; 7606
	defb 000h,0e6h	; 7608
	defb 0dfh,006h	; 760a
	defb 0c0h,0f1h	; 760c
	defb 0dfh,001h	; 760e
	defb 0c0h,0fch	; 7610
	defb 01fh,000h	; 7612
	defb 000h,0ffh	; 7614
	defb 01fh,000h	; 7616
	defb 000h,0e0h	; 7618
	defb 047h,000h	; 761a
	defb 040h,0ceh	; 761c
	defb 0f1h,00eh	; 761e
	defb 0f0h,0dfh	; 7620
	defb 04dh,01fh	; 7622
	defb 04ch,0dfh	; 7624
	defb 0adh,01fh	; 7626
	defb 0ach,0deh	; 7628
	defb 0d1h,01eh	; 762a
	defb 0d0h,0cdh	; 762c
	defb 057h,00dh	; 762e
	defb 050h,096h	; 7630
	defb 0b3h,016h	; 7632
	defb 0b0h,0bbh	; 7634
	defb 069h,03bh	; 7636
	defb 068h,094h	; 7638
	defb 0cch,014h	; 763a
	defb 0cch,0d3h	; 763c
	defb 086h,013h	; 763e
	defb 086h,0cch	; 7640
	defb 0d6h,00ch	; 7642
	defb 0c6h,0ech	; 7644
	defb 010h,00ch	; 7646
	defb 000h,0e1h	; 7648
	defb 0ffh,000h	; 764a
	defb 000h,0ffh	; 764c
	defb 0ffh,000h	; 764e
	defb 000h,0ffh	; 7650
	defb 0ffh,000h	; 7652
	defb 000h,0f8h	; 7654
	defb 03fh,000h	; 7656
	defb 000h,0f3h	; 7658
	defb 09fh,003h	; 765a
	defb 080h,0f6h	; 765c
	defb 0dfh,006h	; 765e
	defb 0c0h,0c5h	; 7660
	defb 047h,005h	; 7662
	defb 040h,096h	; 7664
	defb 0d3h,016h	; 7666
	defb 0d0h,0b7h	; 7668
	defb 0dbh,037h	; 766a
	defb 0d8h,037h	; 766c
	defb 0d9h,037h	; 766e
	defb 0d8h,04bh	; 7670
	defb 0a5h,04bh	; 7672
	defb 0a4h,06ch	; 7674
	defb 06dh,06ch	; 7676
	defb 06ch,067h	; 7678
	defb 0cdh,067h	; 767a
	defb 0cch,008h	; 767c
	defb 021h,008h	; 767e
	defb 020h,0edh	; 7680
	defb 06fh,00ch	; 7682
	defb 060h,0e1h	; 7684
	defb 06fh,000h	; 7686
	defb 060h,0ffh	; 7688
	defb 00fh,000h	; 768a
	defb 000h,0ffh	; 768c
	defb 0ffh,000h	; 768e
	defb 000h,0ffh	; 7690
	defb 0ffh,000h	; 7692
	defb 000h,0f8h	; 7694
	defb 0ffh,000h	; 7696
	defb 000h,0e2h	; 7698
	defb 007h,002h	; 769a
	defb 000h,08fh	; 769c
	defb 073h,00fh	; 769e
	defb 070h,0b2h	; 76a0
	defb 0fbh,032h	; 76a2
	defb 0f8h,0b5h	; 76a4
	defb 0fbh,035h	; 76a6
	defb 0f8h,08bh	; 76a8
	defb 07bh,00bh	; 76aa
	defb 078h,0eah	; 76ac
	defb 0b3h,00ah	; 76ae
	defb 0b0h,0cdh	; 76b0
	defb 069h,00dh	; 76b2
	defb 068h,096h	; 76b4
	defb 0ddh,016h	; 76b6
	defb 0dch,033h	; 76b8
	defb 029h,033h	; 76ba
	defb 028h,061h	; 76bc
	defb 0cbh,061h	; 76be
	defb 0c8h,06bh	; 76c0
	defb 033h,063h	; 76c2
	defb 030h,008h	; 76c4
	defb 037h,000h	; 76c6
	defb 030h,0ffh	; 76c8
	defb 087h,000h	; 76ca
	defb 000h,0ffh	; 76cc
	defb 0ffh,000h	; 76ce
	defb 000h,0ffh	; 76d0
	defb 0ffh,000h	; 76d2
	defb 000h,0f8h	; 76d4
	defb 03fh,000h	; 76d6
	defb 000h,0fbh	; 76d8
	defb 08fh,003h	; 76da
	defb 080h,0fbh	; 76dc
	defb 067h,003h	; 76de
	defb 060h,0e0h	; 76e0
	defb 077h,000h	; 76e2
	defb 070h,0edh	; 76e4
	defb 081h,00dh	; 76e6
	defb 080h,0ebh	; 76e8
	defb 07ch,00bh	; 76ea
	defb 07ch,0e2h	; 76ec
	defb 0f6h,002h	; 76ee
	defb 0f6h,0fah	; 76f0
	defb 0eah,002h	; 76f2
	defb 0eah,0c2h	; 76f4
	defb 0f6h,002h	; 76f6
	defb 0f6h,0dbh	; 76f8
	defb 07ch,01bh	; 76fa
	defb 07ch,0ddh	; 76fc
	defb 081h,01dh	; 76fe
	defb 080h,0c0h	; 7700
	defb 077h,000h	; 7702
	defb 070h,0fbh	; 7704
	defb 067h,003h	; 7706
	defb 060h,0fbh	; 7708
	defb 08fh,003h	; 770a
	defb 080h,0f8h	; 770c
	defb 03fh,000h	; 770e
	defb 000h,0ffh	; 7710
	defb 0ffh,000h	; 7712
	defb 000h,0ffh	; 7714
	defb 0ffh,000h	; 7716
	defb 000h,0ffh	; 7718
	defb 0c3h,000h	; 771a
	defb 000h,084h	; 771c
	defb 01bh,000h	; 771e
	defb 018h,0b5h	; 7720
	defb 099h,031h	; 7722
	defb 098h,0b0h	; 7724
	defb 0e5h,030h	; 7726
	defb 0e4h,099h	; 7728
	defb 094h,019h	; 772a
	defb 094h,0cbh	; 772c
	defb 06eh,00bh	; 772e
	defb 06eh,0e6h	; 7730
	defb 0f4h,006h	; 7732
	defb 0f4h,0f5h	; 7734
	defb 0f9h,005h	; 7736
	defb 0f8h,0c5h	; 7738
	defb 0edh,005h	; 773a
	defb 0ech,0dah	; 773c
	defb 0d5h,01ah	; 773e
	defb 0d4h,0d9h	; 7740
	defb 06dh,019h	; 7742
	defb 06ch,0c7h	; 7744
	defb 0b9h,007h	; 7746
	defb 0b8h,0f1h	; 7748
	defb 003h,001h	; 774a
	defb 000h,0fch	; 774c
	defb 07fh,000h	; 774e
	defb 000h,0ffh	; 7750
	defb 0ffh,000h	; 7752
	defb 000h,0ffh	; 7754
	defb 0ffh,000h	; 7756
	defb 000h,087h	; 7758
	defb 0e1h,000h	; 775a
	defb 000h,0b3h	; 775c
	defb 0cdh,030h	; 775e
	defb 00ch,0abh	; 7760
	defb 0d5h,028h	; 7762
	defb 014h,098h	; 7764
	defb 019h,018h	; 7766
	defb 018h,0c5h	; 7768
	defb 0a3h,005h	; 776a
	defb 0a0h,0f3h	; 776c
	defb 0cfh,003h	; 776e
	defb 0c0h,0f4h	; 7770
	defb 02fh,004h	; 7772
	defb 020h,0f4h	; 7774
	defb 02fh,004h	; 7776
	defb 020h,0f3h	; 7778
	defb 0cfh,003h	; 777a
	defb 0c0h,0c5h	; 777c
	defb 0a3h,005h	; 777e
	defb 0a0h,098h	; 7780
	defb 019h,018h	; 7782
	defb 018h,0abh	; 7784
	defb 0d5h,028h	; 7786
	defb 014h,0b3h	; 7788
	defb 0cdh,030h	; 778a
	defb 00ch,087h	; 778c
	defb 0e1h,000h	; 778e
	defb 000h,0ffh	; 7790
	defb 0ffh,000h	; 7792
	defb 000h,007h	; 7794
	defb 0e0h,000h	; 7796
	defb 000h,073h	; 7798
	defb 0ceh,070h	; 779a
	defb 00eh,04bh	; 779c
	defb 0d2h,048h	; 779e
	defb 012h,04bh	; 77a0
	defb 0d2h,048h	; 77a2
	defb 012h,038h	; 77a4
	defb 01ch,038h	; 77a6
	defb 01ch,085h	; 77a8
	defb 0a1h,005h	; 77aa
	defb 0a0h,0f2h	; 77ac
	defb 04fh,002h	; 77ae
	defb 040h,0f6h	; 77b0
	defb 06fh,006h	; 77b2
	defb 060h,0f6h	; 77b4
	defb 06fh,006h	; 77b6
	defb 060h,0f2h	; 77b8
	defb 04fh,002h	; 77ba
	defb 040h,085h	; 77bc
	defb 0a1h,005h	; 77be
	defb 0a0h,038h	; 77c0
	defb 01ch,038h	; 77c2
	defb 01ch,04bh	; 77c4
	defb 0d2h,048h	; 77c6
	defb 012h,04bh	; 77c8
	defb 0d2h,048h	; 77ca
	defb 012h,073h	; 77cc
	defb 0ceh,070h	; 77ce
	defb 00eh,007h	; 77d0
	defb 0e0h,000h	; 77d2
	defb 000h,0f1h	; 77d4
	defb 00fh,000h	; 77d6
	defb 000h,0e4h	; 77d8
	defb 06fh,004h	; 77da
	defb 060h,0e9h	; 77dc
	defb 083h,009h	; 77de
	defb 080h,087h	; 77e0
	defb 0e9h,007h	; 77e2
	defb 0e8h,0ach	; 77e4
	defb 035h,02ch	; 77e6
	defb 034h,0a8h	; 77e8
	defb 011h,028h	; 77ea
	defb 010h,098h	; 77ec
	defb 05bh,018h	; 77ee
	defb 058h,0d8h	; 77f0
	defb 059h,018h	; 77f2
	defb 058h,089h	; 77f4
	defb 095h,009h	; 77f6
	defb 094h,0ach	; 77f8
	defb 035h,02ch	; 77fa
	defb 034h,097h	; 77fc
	defb 0e1h,017h	; 77fe
	defb 0e0h,0c1h	; 7800
	defb 097h,001h	; 7802
	defb 090h,0f6h	; 7804
	defb 027h,006h	; 7806
	defb 020h,0f0h	; 7808
	defb 08fh,000h	; 780a
	defb 000h,0ffh	; 780c
	defb 0ffh,000h	; 780e
	defb 000h,0ffh	; 7810
	defb 0ffh,000h	; 7812
	defb 000h,0f9h	; 7814
	defb 07fh,001h	; 7816
	defb 000h,0c2h	; 7818
	defb 003h,002h	; 781a
	defb 000h,0d1h	; 781c
	defb 09bh,011h	; 781e
	defb 098h,0d7h	; 7820
	defb 0e3h,017h	; 7822
	defb 0e0h,0cch	; 7824
	defb 031h,00ch	; 7826
	defb 030h,0c8h	; 7828
	defb 014h,008h	; 782a
	defb 014h,018h	; 782c
	defb 05ah,018h	; 782e
	defb 05ah,058h	; 7830
	defb 058h,058h	; 7832
	defb 058h,029h	; 7834
	defb 093h,029h	; 7836
	defb 090h,08ch	; 7838
	defb 033h,00ch	; 783a
	defb 030h,0c7h	; 783c
	defb 0ebh,007h	; 783e
	defb 0e8h,0d9h	; 7840
	defb 08bh,019h	; 7842
	defb 088h,0c0h	; 7844
	defb 043h,000h	; 7846
	defb 040h,0feh	; 7848
	defb 09fh,000h	; 784a
	defb 080h,0feh	; 784c
	defb 03fh,000h	; 784e
	defb 000h,0ffh	; 7850
	defb 0ffh,000h	; 7852
	defb 000h,0f0h	; 7854
	defb 0ffh,000h	; 7856
	defb 000h,0c6h	; 7858
	defb 007h,006h	; 785a
	defb 000h,097h	; 785c
	defb 0b1h,017h	; 785e
	defb 0b0h,033h	; 7860
	defb 0bch,033h	; 7862
	defb 0bch,06eh	; 7864
	defb 036h,06eh	; 7866
	defb 036h,05fh	; 7868
	defb 0d8h,05fh	; 786a
	defb 0d8h,016h	; 786c
	defb 06ch,016h	; 786e
	defb 06ch,0b5h	; 7870
	defb 0eah,035h	; 7872
	defb 0eah,0bbh	; 7874
	defb 0deh,03bh	; 7876
	defb 0deh,095h	; 7878
	defb 0fah,015h	; 787a
	defb 0fah,097h	; 787c
	defb 044h,017h	; 787e
	defb 044h,0b8h	; 7880
	defb 0f9h,038h	; 7882
	defb 0f8h,0bdh	; 7884
	defb 06bh,03dh	; 7886
	defb 068h,09bh	; 7888
	defb 033h,01bh	; 788a
	defb 030h,0c6h	; 788c
	defb 007h,006h	; 788e
	defb 000h,0f0h	; 7890
	defb 0ffh,000h	; 7892
	defb 000h,0f0h	; 7894
	defb 01fh,000h	; 7896
	defb 000h,0e7h	; 7898
	defb 043h,007h	; 789a
	defb 040h,08ch	; 789c
	defb 0fbh,00ch	; 789e
	defb 0f8h,02bh	; 78a0
	defb 068h,02bh	; 78a2
	defb 068h,07bh	; 78a4
	defb 076h,07bh	; 78a6
	defb 076h,07fh	; 78a8
	defb 0b6h,07fh	; 78aa
	defb 0b6h,04fh	; 78ac
	defb 0f6h,04fh	; 78ae
	defb 0f6h,03dh	; 78b0
	defb 0eeh,03dh	; 78b2
	defb 0eeh,09bh	; 78b4
	defb 0fch,01bh	; 78b6
	defb 0fch,0b6h	; 78b8
	defb 0eeh,036h	; 78ba
	defb 0eeh,097h	; 78bc
	defb 01ch,017h	; 78be
	defb 01ch,0dbh	; 78c0
	defb 0edh,01bh	; 78c2
	defb 0ech,0d5h	; 78c4
	defb 0f1h,015h	; 78c6
	defb 0f0h,0cfh	; 78c8
	defb 077h,00fh	; 78ca
	defb 070h,0e7h	; 78cc
	defb 007h,007h	; 78ce
	defb 000h,0f0h	; 78d0
	defb 07fh,000h	; 78d2
	defb 000h,0feh	; 78d4
	defb 03fh,000h	; 78d6
	defb 000h,086h	; 78d8
	defb 0bfh,000h	; 78da
	defb 080h,0b6h	; 78dc
	defb 03fh,030h	; 78de
	defb 000h,086h	; 78e0
	defb 018h,000h	; 78e2
	defb 000h,0f0h	; 78e4
	defb 0c2h,000h	; 78e6
	defb 0c2h,0f7h	; 78e8
	defb 0d0h,007h	; 78ea
	defb 0d0h,0e2h	; 78ec
	defb 0b9h,002h	; 78ee
	defb 0b8h,0edh	; 78f0
	defb 0ddh,00dh	; 78f2
	defb 0dch,0edh	; 78f4
	defb 0d5h,00dh	; 78f6
	defb 0d4h,0e7h	; 78f8
	defb 0f9h,007h	; 78fa
	defb 0f8h,0f7h	; 78fc
	defb 063h,007h	; 78fe
	defb 060h,081h	; 7900
	defb 077h,001h	; 7902
	defb 070h,0abh	; 7904
	defb 0a7h,023h	; 7906
	defb 0a0h,089h	; 7908
	defb 087h,001h	; 790a
	defb 080h,0fch	; 790c
	defb 017h,000h	; 790e
	defb 010h,0ffh	; 7910
	defb 0c7h,000h	; 7912
	defb 000h,0dfh	; 7914
	defb 0ffh,000h	; 7916
	defb 000h,0afh	; 7918
	defb 0e3h,020h	; 791a
	defb 000h,0dch	; 791c
	defb 06bh,000h	; 791e
	defb 008h,0c5h	; 7920
	defb 063h,001h	; 7922
	defb 000h,0d4h	; 7924
	defb 03fh,010h	; 7926
	defb 000h,0c1h	; 7928
	defb 09bh,001h	; 792a
	defb 080h,0fah	; 792c
	defb 0d5h,002h	; 792e
	defb 0c4h,0bbh	; 7930
	defb 095h,003h	; 7932
	defb 084h,059h	; 7934
	defb 0dbh,041h	; 7936
	defb 0c0h,040h	; 7938
	defb 018h,040h	; 793a
	defb 000h,0abh	; 793c
	defb 08ah,008h	; 793e
	defb 002h,0e3h	; 7940
	defb 0a8h,000h	; 7942
	defb 020h,0ffh	; 7944
	defb 08fh,000h	; 7946
	defb 000h,0f9h	; 7948
	defb 0ffh,000h	; 794a
	defb 000h,0f6h	; 794c
	defb 0ffh,006h	; 794e
	defb 000h,0f9h	; 7950
	defb 0ffh,000h	; 7952
	defb 000h,0f8h	; 7954
	defb 03fh,000h	; 7956
	defb 000h,0f3h	; 7958
	defb 09fh,003h	; 795a
	defb 080h,0f7h	; 795c
	defb 0dfh,007h	; 795e
	defb 0c0h,0c7h	; 7960
	defb 0c7h,007h	; 7962
	defb 0c0h,094h	; 7964
	defb 053h,014h	; 7966
	defb 050h,0b4h	; 7968
	defb 05bh,034h	; 796a
	defb 058h,02bh	; 796c
	defb 0a9h,02bh	; 796e
	defb 0a8h,044h	; 7970
	defb 045h,044h	; 7972
	defb 044h,047h	; 7974
	defb 0c5h,047h	; 7976
	defb 0c4h,04bh	; 7978
	defb 0a5h,04bh	; 797a
	defb 0a4h,00ch	; 797c
	defb 061h,00ch	; 797e
	defb 060h,0c9h	; 7980
	defb 027h,008h	; 7982
	defb 020h,093h	; 7984
	defb 093h,010h	; 7986
	defb 010h,0b7h	; 7988
	defb 0dbh,030h	; 798a
	defb 018h,0b7h	; 798c
	defb 0dbh,030h	; 798e
	defb 018h,087h	; 7990
	defb 0c3h,000h	; 7992
	defb 000h,01ch	; 7994
	defb 038h,000h	; 7996
	defb 000h,049h	; 7998
	defb 092h,041h	; 799a
	defb 082h,06bh	; 799c
	defb 0d6h,063h	; 799e
	defb 0c6h,022h	; 79a0
	defb 044h,022h	; 79a2
	defb 044h,092h	; 79a4
	defb 049h,012h	; 79a6
	defb 048h,0cdh	; 79a8
	defb 0b3h,00dh	; 79aa
	defb 0b0h,0e6h	; 79ac
	defb 067h,006h	; 79ae
	defb 060h,0f3h	; 79b0
	defb 0cfh,003h	; 79b2
	defb 0c0h,0f3h	; 79b4
	defb 0cfh,003h	; 79b6
	defb 0c0h,0e5h	; 79b8
	defb 0a7h,005h	; 79ba
	defb 0a0h,00eh	; 79bc
	defb 070h,00eh	; 79be
	defb 070h,068h	; 79c0
	defb 016h,068h	; 79c2
	defb 016h,073h	; 79c4
	defb 0ceh,070h	; 79c6
	defb 00eh,037h	; 79c8
	defb 0ech,030h	; 79ca
	defb 00ch,097h	; 79cc
	defb 0e9h,010h	; 79ce
	defb 008h,0c7h	; 79d0
	defb 0e3h,000h	; 79d2
	defb 000h,0ffh	; 79d4
	defb 0ffh,000h	; 79d6
	defb 000h,0fch	; 79d8
	defb 03fh,000h	; 79da
	defb 000h,0f9h	; 79dc
	defb 09fh,001h	; 79de
	defb 080h,0fah	; 79e0
	defb 05fh,002h	; 79e2
	defb 040h,082h	; 79e4
	defb 041h,002h	; 79e6
	defb 040h,0b1h	; 79e8
	defb 08dh,031h	; 79ea
	defb 08ch,08eh	; 79ec
	defb 071h,00eh	; 79ee
	defb 070h,0e3h	; 79f0
	defb 0c7h,003h	; 79f2
	defb 0c0h,0f9h	; 79f4
	defb 09fh,001h	; 79f6
	defb 080h,0f2h	; 79f8
	defb 04fh,002h	; 79fa
	defb 040h,0c4h	; 79fc
	defb 023h,004h	; 79fe
	defb 020h,0d9h	; 7a00
	defb 09bh,018h	; 7a02
	defb 018h,0cbh	; 7a04
	defb 0d3h,008h	; 7a06
	defb 010h,0e3h	; 7a08
	defb 0c7h,000h	; 7a0a
	defb 000h,0ffh	; 7a0c
	defb 0ffh,000h	; 7a0e
	defb 000h,0ffh	; 7a10
	defb 0ffh,000h	; 7a12
	defb 000h,0ffh	; 7a14
	defb 0ffh,000h	; 7a16
	defb 000h,0ffh	; 7a18
	defb 0ffh,000h	; 7a1a
	defb 000h,0fch	; 7a1c
	defb 03fh,000h	; 7a1e
	defb 000h,0fdh	; 7a20
	defb 0bfh,001h	; 7a22
	defb 080h,0f9h	; 7a24
	defb 09fh,001h	; 7a26
	defb 080h,0f2h	; 7a28
	defb 04fh,002h	; 7a2a
	defb 040h,0e5h	; 7a2c
	defb 0afh,005h	; 7a2e
	defb 0a0h,0e9h	; 7a30
	defb 08fh,009h	; 7a32
	defb 080h,0e2h	; 7a34
	defb 05fh,002h	; 7a36
	defb 040h,0f2h	; 7a38
	defb 04fh,002h	; 7a3a
	defb 040h,0f4h	; 7a3c
	defb 02fh,004h	; 7a3e
	defb 020h,0f1h	; 7a40
	defb 08fh,000h	; 7a42
	defb 000h,0ffh	; 7a44
	defb 0ffh,000h	; 7a46
	defb 000h,0ffh	; 7a48
	defb 0ffh,000h	; 7a4a
	defb 000h,0ffh	; 7a4c
	defb 0ffh,000h	; 7a4e
	defb 000h,0ffh	; 7a50
	defb 0ffh,000h	; 7a52
	defb 000h,0ffh	; 7a54
	defb 0ffh,000h	; 7a56
	defb 000h,0ffh	; 7a58
	defb 0ffh,000h	; 7a5a
	defb 000h,0ffh	; 7a5c
	defb 0ffh,000h	; 7a5e
	defb 000h,0fch	; 7a60
	defb 07fh,000h	; 7a62
	defb 000h,0f1h	; 7a64
	defb 01fh,001h	; 7a66
	defb 000h,0f7h	; 7a68
	defb 0dfh,007h	; 7a6a
	defb 0c0h,0f1h	; 7a6c
	defb 01fh,001h	; 7a6e
	defb 000h,0f2h	; 7a70
	defb 09fh,002h	; 7a72
	defb 080h,0f4h	; 7a74
	defb 05fh,004h	; 7a76
	defb 040h,0f1h	; 7a78
	defb 01fh,000h	; 7a7a
	defb 000h,0ffh	; 7a7c
	defb 0ffh,000h	; 7a7e
	defb 000h,0ffh	; 7a80
	defb 0ffh,000h	; 7a82
	defb 000h,0ffh	; 7a84
	defb 0ffh,000h	; 7a86
	defb 000h,0ffh	; 7a88
	defb 0ffh,000h	; 7a8a
	defb 000h,0ffh	; 7a8c
	defb 0ffh,000h	; 7a8e
	defb 000h,0ffh	; 7a90
	defb 0ffh,000h	; 7a92
	defb 000h,0ffh	; 7a94
	defb 0ffh,000h	; 7a96
	defb 000h,0ffh	; 7a98
	defb 0ffh,000h	; 7a9a
	defb 000h,0ffh	; 7a9c
	defb 0ffh,000h	; 7a9e
	defb 000h,0ffh	; 7aa0
	defb 0ffh,000h	; 7aa2
	defb 000h,0ffh	; 7aa4
	defb 0ffh,000h	; 7aa6
	defb 000h,0fch	; 7aa8
	defb 07fh,000h	; 7aaa
	defb 000h,0fdh	; 7aac
	defb 07fh,001h	; 7aae
	defb 000h,0fch	; 7ab0
	defb 07fh,000h	; 7ab2
	defb 000h,0ffh	; 7ab4
	defb 0ffh,000h	; 7ab6
	defb 000h,0ffh	; 7ab8
	defb 0ffh,000h	; 7aba
	defb 000h,0ffh	; 7abc
	defb 0ffh,000h	; 7abe
	defb 000h,0ffh	; 7ac0
	defb 0ffh,000h	; 7ac2
	defb 000h,0ffh	; 7ac4
	defb 0ffh,000h	; 7ac6
	defb 000h,0ffh	; 7ac8
	defb 0ffh,000h	; 7aca
	defb 000h,0ffh	; 7acc
	defb 0ffh,000h	; 7ace
	defb 000h,0ffh	; 7ad0
	defb 0ffh,000h	; 7ad2
	defb 000h,0ffh	; 7ad4
	defb 0ffh,000h	; 7ad6
	defb 000h,0ffh	; 7ad8
	defb 0ffh,000h	; 7ada
	defb 000h,0ffh	; 7adc
	defb 0ffh,000h	; 7ade
	defb 000h,0ffh	; 7ae0
	defb 0ffh,000h	; 7ae2
	defb 000h,0ffh	; 7ae4
	defb 0ffh,000h	; 7ae6
	defb 000h,0ffh	; 7ae8
	defb 0ffh,000h	; 7aea
	defb 000h,0ffh	; 7aec
	defb 0ffh,000h	; 7aee
	defb 000h,0ffh	; 7af0
	defb 0ffh,000h	; 7af2
	defb 000h,0ffh	; 7af4
	defb 0ffh,000h	; 7af6
	defb 000h,0ffh	; 7af8
	defb 0ffh,000h	; 7afa
	defb 000h,0ffh	; 7afc
	defb 0ffh,000h	; 7afe
	defb 000h,0ffh	; 7b00
	defb 0ffh,000h	; 7b02
	defb 000h,0ffh	; 7b04
	defb 0ffh,000h	; 7b06
	defb 000h,0ffh	; 7b08
	defb 0ffh,000h	; 7b0a
	defb 000h,0ffh	; 7b0c
	defb 0ffh,000h	; 7b0e
	defb 000h,0ffh	; 7b10
	defb 0ffh,000h	; 7b12
	defb 000h,0ffh	; 7b14
	defb 0ffh,000h	; 7b16
	defb 000h,0ffh	; 7b18
	defb 0ffh,000h	; 7b1a
	defb 000h,0ffh	; 7b1c
	defb 0ffh,000h	; 7b1e
	defb 000h,0ffh	; 7b20
	defb 0ffh,000h	; 7b22
	defb 000h,0ffh	; 7b24
	defb 0ffh,000h	; 7b26
	defb 000h,0ffh	; 7b28
	defb 0ffh,000h	; 7b2a
	defb 000h,0ffh	; 7b2c
	defb 0ffh,000h	; 7b2e
	defb 000h,0ffh	; 7b30
	defb 0ffh,000h	; 7b32
	defb 000h,0ffh	; 7b34
	defb 0ffh,000h	; 7b36
	defb 000h,0ffh	; 7b38
	defb 0ffh,000h	; 7b3a
	defb 000h,0ffh	; 7b3c
	defb 0ffh,000h	; 7b3e
	defb 000h,0ffh	; 7b40
	defb 0ffh,000h	; 7b42
	defb 000h,0ffh	; 7b44
	defb 0ffh,000h	; 7b46
	defb 000h,0ffh	; 7b48
	defb 0ffh,000h	; 7b4a
	defb 000h,0ffh	; 7b4c
	defb 0ffh,000h	; 7b4e
	defb 000h,0ffh	; 7b50
	defb 0ffh,000h	; 7b52
	defb 000h,0ffh	; 7b54
	defb 0ffh,000h	; 7b56
	defb 000h,0ffh	; 7b58
	defb 0ffh,000h	; 7b5a
	defb 000h,0ffh	; 7b5c
	defb 0ffh,000h	; 7b5e
	defb 000h,0ffh	; 7b60
	defb 0ffh,000h	; 7b62
	defb 000h,0ffh	; 7b64
	defb 0ffh,000h	; 7b66
	defb 000h,0fch	; 7b68
	defb 07fh,000h	; 7b6a
	defb 000h,0fdh	; 7b6c
	defb 07fh,001h	; 7b6e
	defb 000h,0fch	; 7b70
	defb 07fh,000h	; 7b72
	defb 000h,0ffh	; 7b74
	defb 0ffh,000h	; 7b76
	defb 000h,0ffh	; 7b78
	defb 0ffh,000h	; 7b7a
	defb 000h,0ffh	; 7b7c
	defb 0ffh,000h	; 7b7e
	defb 000h,0ffh	; 7b80
	defb 0ffh,000h	; 7b82
	defb 000h,0ffh	; 7b84
	defb 0ffh,000h	; 7b86
	defb 000h,0ffh	; 7b88
	defb 0ffh,000h	; 7b8a
	defb 000h,0ffh	; 7b8c
	defb 0ffh,000h	; 7b8e
	defb 000h,0ffh	; 7b90
	defb 0ffh,000h	; 7b92
	defb 000h,0ffh	; 7b94
	defb 0ffh,000h	; 7b96
	defb 000h,0ffh	; 7b98
	defb 0ffh,000h	; 7b9a
	defb 000h,0ffh	; 7b9c
	defb 0ffh,000h	; 7b9e
	defb 000h,0fch	; 7ba0
	defb 07fh,000h	; 7ba2
	defb 000h,0f1h	; 7ba4
	defb 03fh,001h	; 7ba6
	defb 000h,0f6h	; 7ba8
	defb 0bfh,006h	; 7baa
	defb 080h,0e3h	; 7bac
	defb 0bfh,003h	; 7bae
	defb 080h,0edh	; 7bb0
	defb 0bfh,00dh	; 7bb2
	defb 080h,0e6h	; 7bb4
	defb 03fh,006h	; 7bb6
	defb 000h,0f0h	; 7bb8
	defb 0ffh,000h	; 7bba
	defb 000h,0ffh	; 7bbc
	defb 0ffh,000h	; 7bbe
	defb 000h,0ffh	; 7bc0
	defb 0ffh,000h	; 7bc2
	defb 000h,0ffh	; 7bc4
	defb 0ffh,000h	; 7bc6
	defb 000h,0ffh	; 7bc8
	defb 0ffh,000h	; 7bca
	defb 000h,0ffh	; 7bcc
	defb 0ffh,000h	; 7bce
	defb 000h,0ffh	; 7bd0
	defb 0ffh,000h	; 7bd2
	defb 000h,0ffh	; 7bd4
	defb 0ffh,000h	; 7bd6
	defb 000h,0ffh	; 7bd8
	defb 0ffh,000h	; 7bda
	defb 000h,0fch	; 7bdc
	defb 03fh,000h	; 7bde
	defb 000h,0f1h	; 7be0
	defb 08fh,001h	; 7be2
	defb 080h,0e7h	; 7be4
	defb 0efh,007h	; 7be6
	defb 0e0h,0eah	; 7be8
	defb 0e7h,00ah	; 7bea
	defb 0e0h,0edh	; 7bec
	defb 077h,00dh	; 7bee
	defb 070h,0e6h	; 7bf0
	defb 067h,006h	; 7bf2
	defb 060h,0f5h	; 7bf4
	defb 0d7h,005h	; 7bf6
	defb 0d0h,0f7h	; 7bf8
	defb 067h,007h	; 7bfa
	defb 060h,0f1h	; 7bfc
	defb 0cfh,001h	; 7bfe
	defb 0c0h,0fch	; 7c00
	defb 01fh,000h	; 7c02
	defb 000h,0ffh	; 7c04
	defb 0ffh,000h	; 7c06
	defb 000h,0ffh	; 7c08
	defb 0ffh,000h	; 7c0a
	defb 000h,0ffh	; 7c0c
	defb 0ffh,000h	; 7c0e
	defb 000h,0ffh	; 7c10
	defb 0ffh,000h	; 7c12
	defb 000h,0ffh	; 7c14
	defb 0ffh,000h	; 7c16
	defb 000h,0ffh	; 7c18
	defb 0ffh,000h	; 7c1a
	defb 000h,0ffh	; 7c1c
	defb 0ffh,000h	; 7c1e
	defb 000h,0ffh	; 7c20
	defb 08fh,000h	; 7c22
	defb 000h,0e0h	; 7c24
	defb 02fh,000h	; 7c26
	defb 020h,0e9h	; 7c28
	defb 00fh,009h	; 7c2a
	defb 000h,0e2h	; 7c2c
	defb 0bfh,002h	; 7c2e
	defb 080h,0f8h	; 7c30
	defb 03fh,000h	; 7c32
	defb 000h,0f1h	; 7c34
	defb 01fh,000h	; 7c36
	defb 000h,0c5h	; 7c38
	defb 05fh,004h	; 7c3a
	defb 040h,0d1h	; 7c3c
	defb 01fh,010h	; 7c3e
	defb 000h,0c7h	; 7c40
	defb 0ffh,000h	; 7c42
	defb 000h,0ffh	; 7c44
	defb 0ffh,000h	; 7c46
	defb 000h,0ffh	; 7c48
	defb 0ffh,000h	; 7c4a
	defb 000h,0ffh	; 7c4c
	defb 0ffh,000h	; 7c4e
	defb 000h,0ffh	; 7c50
	defb 0ffh,000h	; 7c52
	defb 000h,0ffh	; 7c54
	defb 0ffh,000h	; 7c56
	defb 000h,0ffh	; 7c58
	defb 0ffh,000h	; 7c5a
	defb 000h,0fch	; 7c5c
	defb 03fh,000h	; 7c5e
	defb 000h,0f9h	; 7c60
	defb 087h,001h	; 7c62
	defb 080h,0f3h	; 7c64
	defb 0b3h,003h	; 7c66
	defb 0b0h,0e7h	; 7c68
	defb 0bbh,007h	; 7c6a
	defb 0b8h,0efh	; 7c6c
	defb 06bh,00fh	; 7c6e
	defb 068h,0ebh	; 7c70
	defb 0f3h,00bh	; 7c72
	defb 0f0h,0e6h	; 7c74
	defb 0d7h,006h	; 7c76

; ----------------------------------------------------------------------
; DATOS pool_de_sprites_cola: Pool de sprites de la fase (cola de la entrada
;   0x48)
;   0x7c78..0x7c9d  (37 bytes)
DATA_pool_de_sprites_cola:
	defb 0d0h,0e7h	; 7c78
	defb 0a7h,007h	; 7c7a
	defb 0a0h,0eeh	; 7c7c
	defb 0efh,00eh	; 7c7e
	defb 0e0h,0e5h	; 7c80
	defb 0efh,005h	; 7c82
	defb 0e0h,0f0h	; 7c84
	defb 08fh,000h	; 7c86
	defb 080h,0feh	; 7c88
	defb 03fh,000h	; 7c8a
	defb 000h,0ffh	; 7c8c
	defb 0ffh,000h	; 7c8e
	defb 000h,0ffh	; 7c90
	defb 0ffh,000h	; 7c92
	defb 000h,0fch	; 7c94
	defb 01fh,000h	; 7c96
	defb 000h,0c1h	; 7c98
	defb 0c3h,001h	; 7c9a
	defb 0c0h	; 7c9c

; ----------------------------------------------------------------------
; DATOS graficos_final_del_pool: Graficos: el final del pool de sprites de
;   0x6555, hasta la entrada 0x5F
;   0x7c9d..0x7d55  (184 bytes)
DATA_graficos_final_del_pool:
	defb 09bh,0b9h	; 7c9d
	defb 01bh,0b8h	; 7c9f
	defb 0bbh,05dh	; 7ca1
	defb 03bh,05ch	; 7ca3
	defb 03fh,0ddh	; 7ca5
	defb 03fh,0dch	; 7ca7
	defb 07dh,0f8h	; 7ca9
	defb 07dh,0f8h	; 7cab
	defb 054h,03ah	; 7cad
	defb 054h,03ah	; 7caf
	defb 021h,0a2h	; 7cb1
	defb 020h,022h	; 7cb3
	defb 078h,038h	; 7cb5
	defb 078h,038h	; 7cb7
	defb 03ah,0ddh	; 7cb9
	defb 03ah,0dch	; 7cbb
	defb 0bfh,07dh	; 7cbd
	defb 03fh,07ch	; 7cbf
	defb 091h,0b9h	; 7cc1
	defb 011h,0b8h	; 7cc3
	defb 0c7h,0b3h	; 7cc5
	defb 007h,0b0h	; 7cc7
	defb 0f7h,0c7h	; 7cc9
	defb 007h,0c0h	; 7ccb
	defb 0f1h,0dfh	; 7ccd
	defb 001h,0c0h	; 7ccf
	defb 0fch,01fh	; 7cd1
	defb 000h,000h	; 7cd3
	defb 0f8h,03fh	; 7cd5
	defb 000h,000h	; 7cd7
	defb 0f3h,08fh	; 7cd9
	defb 003h,080h	; 7cdb
	defb 0c5h,0e1h	; 7cdd
	defb 005h,0e0h	; 7cdf
	defb 0dfh,074h	; 7ce1
	defb 01fh,074h	; 7ce3
	defb 018h,0feh	; 7ce5
	defb 018h,0feh	; 7ce7
	defb 07eh,02eh	; 7ce9
	defb 07eh,02eh	; 7ceb
	defb 070h,09ah	; 7ced
	defb 070h,01ah	; 7cef
	defb 07bh,090h	; 7cf1
	defb 078h,010h	; 7cf3
	defb 06bh,0bdh	; 7cf5
	defb 068h,03ch	; 7cf7
	defb 018h,01dh	; 7cf9
	defb 018h,01ch	; 7cfb
	defb 0dfh,069h	; 7cfd
	defb 01fh,068h	; 7cff
	defb 0cbh,0e3h	; 7d01
	defb 00bh,0e0h	; 7d03
	defb 0eeh,0efh	; 7d05
	defb 00eh,0e0h	; 7d07
	defb 0e1h,0cfh	; 7d09
	defb 001h,0c0h	; 7d0b
	defb 0fch,0dfh	; 7d0d
	defb 000h,0c0h	; 7d0f
	defb 0feh,01fh	; 7d11
	defb 000h,000h	; 7d13
	defb 0ffh,0ffh	; 7d15
	defb 000h,000h	; 7d17
	defb 0c4h,03fh	; 7d19
	defb 000h,000h	; 7d1b
	defb 0d5h,09fh	; 7d1d
	defb 011h,080h	; 7d1f
	defb 0c4h,0c3h	; 7d21
	defb 000h,0c0h	; 7d23
	defb 0e2h,00bh	; 7d25
	defb 000h,008h	; 7d27
	defb 089h,098h	; 7d29
	defb 008h,018h	; 7d2b
	defb 0bdh,0beh	; 7d2d
	defb 03ch,03eh	; 7d2f
	defb 095h,094h	; 7d31
	defb 014h,014h	; 7d33
	defb 0d9h,0c1h	; 7d35
	defb 018h,000h	; 7d37
	defb 0c0h,07fh	; 7d39
	defb 000h,000h	; 7d3b
	defb 013h,047h	; 7d3d
	defb 003h,000h	; 7d3f
	defb 046h,013h	; 7d41
	defb 046h,010h	; 7d43
	defb 008h,05bh	; 7d45
	defb 008h,058h	; 7d47
	defb 0e5h,06bh	; 7d49
	defb 004h,068h	; 7d4b
	defb 0f1h,013h	; 7d4d
	defb 000h,010h	; 7d4f
	defb 0ffh,0c7h	; 7d51
	defb 000h,000h	; 7d53

; ----------------------------------------------------------------------
; DATOS slot_de_trabajo_del_sprite: EL SLOT DE TRABAJO, que es la entrada 0x60
;   del pool (64 B): aqui dejan su resultado las cuatro rutinas de giro de
;   0xB2A6 y de aqui lo lee pinta_sprite. 0x6555 + 0x60*64 = 0x7D55
;   0x7d55..0x7d95  (64 bytes)
DATA_slot_de_trabajo_del_sprite:
	defb 000h,000h,000h,000h	; 7d55
	defb 000h,000h,000h,000h	; 7d59
	defb 000h,000h,000h,000h	; 7d5d
	defb 000h,000h,000h,000h	; 7d61
	defb 000h,000h,000h,000h	; 7d65
	defb 000h,000h,000h,000h	; 7d69
	defb 000h,000h,000h,000h	; 7d6d
	defb 000h,000h,000h,000h	; 7d71
	defb 000h,000h,000h,000h	; 7d75
	defb 000h,000h,000h,000h	; 7d79
	defb 000h,000h,000h,000h	; 7d7d
	defb 000h,000h,000h,000h	; 7d81
	defb 000h,000h,000h,000h	; 7d85
	defb 000h,000h,000h,000h	; 7d89
	defb 000h,000h,000h,000h	; 7d8d
	defb 000h,000h,000h,000h	; 7d91

; ----------------------------------------------------------------------
; DATOS coreografia_del_estallido: LA COREOGRAFIA DEL ESTALLIDO de la nave
;   insignia (70 B, uno por cuadro del bucle de 0xBEB9, que da 0x46 vueltas):
;   cada BIT dice que hueco de explosion se enciende ese cuadro, y el `rlc
;   (iy+000h)` de 0xBF2A va pasando de bit en bit -ocho rotaciones lo dejan
;   como estaba, asi que la tabla no se estropea-. Empieza con chispas sueltas
;   (48 de los 70 bytes son cero) y acaba con seis 0xFF seguidos, todo a la
;   vez. El unico byte que vale 1 es ademas la senal que busca el `dec a` de
;   0xBECC para doblar los huecos de 8 a 16. Cierra al byte: 0x7D95 + 70 =
;   0x7DDB
;   0x7d95..0x7ddb  (70 bytes)
DATA_coreografia_del_estallido:
	defb 040h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,040h	; 7d95  @..............@
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,040h,000h,000h	; 7da5  .............@..
	defb 000h,000h,000h,040h,000h,000h,000h,040h,000h,020h,000h,040h,000h,000h,000h,000h	; 7db5  ...@...@. .@....
	defb 000h,000h,000h,000h,000h,000h,000h,040h,020h,090h,008h,042h,021h,094h,001h,0ceh	; 7dc5  .......@ ..B!...
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 7dd5

; ----------------------------------------------------------------------
; DATOS dibujo_de_la_nave: EL DIBUJO DE LA NAVE del final (1024 B): 64 filas
;   de ocho parejas (mascara, dibujo), o sea 64x64 pixeles, que pinta_nave lee
;   con la PILA. 64 x 16 = 1024, y 0x7DDB + 0x400 = 0x81DB cierra clavado con
;   las tablas de la llama
;   0x7ddb..0x81db  (1024 bytes)
DATA_dibujo_de_la_nave:
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0e3h,003h,0c7h,0c0h,0ffh,000h,0ffh,000h,0ffh,000h	; 7ddb  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,08fh,00fh,0f1h,0f0h,0ffh,000h,0ffh,000h,0ffh,000h	; 7deb  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,03fh,03fh,0fch,0fch,0ffh,000h,0ffh,000h,0ffh,000h	; 7dfb  ......??........
	defb 0ffh,000h,0ffh,000h,0fch,000h,07fh,07fh,0feh,0feh,03fh,000h,0ffh,000h,0ffh,000h	; 7e0b  ..........?.....
	defb 0ffh,000h,0ffh,000h,0f9h,001h,0ffh,0ffh,0ffh,0ffh,09fh,080h,0ffh,000h,0ffh,000h	; 7e1b  ................
	defb 0ffh,000h,0feh,000h,033h,003h,0ffh,0ffh,0ffh,0ffh,0cch,0c0h,07fh,000h,0ffh,000h	; 7e2b  ....3...........
	defb 0ffh,000h,0fch,000h,087h,087h,0f8h,0f8h,03fh,03fh,0e1h,0e1h,03fh,000h,0ffh,000h	; 7e3b  ........??..?...
	defb 0ffh,000h,0fdh,001h,04fh,04fh,0a3h,0a3h,0cfh,0cfh,0f2h,0f2h,0bfh,080h,0ffh,000h	; 7e4b  ....OO..........
	defb 0ffh,000h,0fdh,001h,05fh,05fh,04fh,04fh,0f7h,0f7h,0fah,0fah,0bfh,080h,0ffh,000h	; 7e5b  ....__OO........
	defb 0ffh,000h,0fdh,001h,0deh,0deh,097h,097h,0ebh,0ebh,0fbh,0fbh,0bfh,080h,0ffh,000h	; 7e6b  ................
	defb 0ffh,000h,0fdh,001h,0bdh,0bdh,032h,032h,05dh,05dh,0f5h,0f5h,0bfh,080h,0ffh,000h	; 7e7b  ......22]]......
	defb 0ffh,000h,0fch,000h,0bah,0bah,069h,069h,09eh,09eh,0f9h,0f9h,03fh,000h,0ffh,000h	; 7e8b  ......ii....?...
	defb 0ffh,000h,0f8h,000h,0b4h,0b4h,0d6h,0d6h,06fh,06fh,075h,075h,01fh,000h,0ffh,000h	; 7e9b  ........oouu....
	defb 0ffh,000h,0f2h,002h,0b8h,0b8h,0e8h,0e8h,017h,017h,079h,079h,04fh,040h,0ffh,000h	; 7eab  ..........yyO@..
	defb 0ffh,000h,0f6h,006h,0b5h,0b5h,0c8h,0c8h,017h,017h,0b5h,0b5h,06fh,060h,0ffh,000h	; 7ebb  ............o`..
	defb 0ffh,000h,0e4h,004h,0a9h,0a9h,090h,090h,08bh,08bh,0b9h,0b9h,067h,060h,0ffh,000h	; 7ecb  ............g`..
	defb 0ffh,000h,0cah,00ah,0b3h,0b3h,020h,020h,045h,045h,0ddh,0ddh,073h,070h,0ffh,000h	; 7edb  ......  EE..sp..
	defb 0ffh,000h,0dch,01ch,0aah,0aah,0a0h,0a0h,065h,065h,0d9h,0d9h,07bh,078h,0ffh,000h	; 7eeb  ........ee..{x..
	defb 0ffh,000h,09ah,01ah,0b3h,0b3h,040h,040h,022h,022h,0edh,0edh,079h,078h,0ffh,000h	; 7efb  ......@@""..yx..
	defb 0ffh,000h,0bch,03ch,0a6h,0a6h,040h,040h,032h,032h,0e9h,0e9h,07dh,07ch,0ffh,000h	; 7f0b  ...<..@@22..}|..
	defb 0ffh,000h,03ah,03ah,035h,035h,040h,040h,032h,032h,0ech,0ech,07ch,07ch,0ffh,000h	; 7f1b  ..::55@@22..||..
	defb 0ffh,000h,06dh,06dh,0c6h,0c6h,080h,080h,011h,011h,00bh,00bh,0b6h,0b6h,0ffh,000h	; 7f2b  ..mm............
	defb 0feh,000h,069h,069h,0d6h,0d6h,080h,080h,019h,019h,06bh,06bh,0b6h,0b6h,07fh,000h	; 7f3b  ..ii......kk....
	defb 0feh,000h,0cch,0cch,006h,006h,080h,080h,019h,019h,068h,068h,037h,037h,07fh,000h	; 7f4b  ..........hh77..
	defb 0fch,000h,0e9h,0e9h,0d4h,0d4h,080h,080h,019h,019h,06ah,06ah,0d7h,0d7h,03fh,000h	; 7f5b  ..........jj..?.
	defb 0f9h,001h,0c2h,0c2h,0eeh,0eeh,080h,080h,019h,019h,075h,075h,0c7h,0c7h,09fh,080h	; 7f6b  ..........uu....
	defb 0fbh,003h,0e9h,0e9h,0ech,0ech,080h,080h,019h,019h,073h,073h,0d7h,0d7h,0dfh,0c0h	; 7f7b  ..........ss....
	defb 0f3h,003h,0e2h,0e2h,0dah,0dah,080h,080h,011h,011h,079h,079h,0cfh,0cfh,0cfh,0c0h	; 7f8b  ..........yy....
	defb 0f7h,007h,0f9h,0f9h,0ach,0ach,080h,080h,031h,031h,075h,075h,09fh,09fh,0efh,0e0h	; 7f9b  ........11uu....
	defb 0f7h,007h,0a1h,0a1h,04eh,04eh,080h,080h,061h,061h,072h,072h,08fh,08fh,0efh,0e0h	; 7fab  ....NN..aarr....
	defb 0e7h,007h,056h,056h,0ach,0ach,080h,080h,0c1h,0c1h,075h,075h,06fh,06fh,0e7h,0e0h	; 7fbb  ..VV......uuoo..
	defb 0eeh,00eh,083h,083h,06eh,06eh,040h,040h,002h,002h,076h,076h,0c7h,0c7h,0f7h,0f0h	; 7fcb  ....nn@@..vv....
	defb 0cfh,00fh,01dh,01dh,09dh,09dh,030h,030h,00ch,00ch,0b9h,0b9h,0bbh,0bbh,0f3h,0f0h	; 7fdb  ......00........
	defb 0deh,01eh,03eh,03eh,053h,053h,08fh,08fh,0f1h,0f1h,0cah,0cah,07dh,07dh,0fbh,0f8h	; 7feb  ..>>SS......}}..
	defb 0ddh,01dh,03eh,03eh,0cfh,0cfh,0f0h,0f0h,00fh,00fh,0f3h,0f3h,07dh,07dh,0fbh,0f8h	; 7ffb  ..>>........}}..
	defb 09eh,01eh,09dh,09dh,0b7h,0b7h,0ffh,0ffh,0ffh,0ffh,0edh,0edh,09bh,09bh,0f9h,0f8h	; 800b  ................
	defb 0bdh,03dh,01ch,01ch,00bh,00bh,0f8h,0f8h,01fh,01fh,0d0h,0d0h,03bh,03bh,0fdh,0fch	; 801b  .=..........;;..
	defb 0beh,03eh,02ah,02ah,0adh,0adh,0e3h,0e3h,0c7h,0c7h,0b5h,0b5h,05dh,05dh,0fdh,0fch	; 802b  .>**........]]..
	defb 0bch,03ch,05ch,05ch,0aeh,0aeh,0d4h,0d4h,02bh,02bh,075h,075h,03eh,03eh,0fdh,0fch	; 803b  .<\\....++uu>>..
	defb 03ah,03ah,02ch,02ch,0aeh,0aeh,0b3h,0b3h,0cdh,0cdh,075h,075h,01eh,01eh,0fch,0fch	; 804b  ::,,......uu....
	defb 074h,074h,01ch,01ch,0adh,0adh,06ch,06ch,036h,036h,0b5h,0b5h,038h,038h,07eh,07eh	; 805b  tt....ll66..88~~
	defb 07ah,07ah,06eh,06eh,0adh,0adh,01ah,01ah,058h,058h,0b5h,0b5h,056h,056h,0feh,0feh	; 806b  zznn....XX..VV..
	defb 075h,075h,02fh,02fh,00eh,00eh,0d5h,0d5h,0abh,0abh,070h,070h,0b5h,0b5h,0feh,0feh	; 807b  uu//......pp....
	defb 078h,078h,01fh,01fh,05eh,05eh,0abh,0abh,0d5h,0d5h,07ah,07ah,078h,078h,07eh,07eh	; 808b  xx..^^....zzxx~~
	defb 074h,074h,0bfh,0bfh,066h,066h,088h,088h,015h,015h,064h,064h,0bfh,0bfh,07eh,07eh	; 809b  tt..ff....dd..~~
	defb 07ah,07ah,000h,000h,0dah,0dah,0abh,0abh,0d5h,0d5h,05ah,05ah,000h,000h,0feh,0feh	; 80ab  zz........ZZ....
	defb 0f4h,0f4h,0bfh,0bfh,05ah,05ah,08ch,08ch,035h,035h,058h,058h,0bfh,0bfh,07fh,07fh	; 80bb  ....ZZ..55XX....
	defb 0fah,0fah,05eh,05eh,0e5h,0e5h,093h,093h,0c9h,0c9h,0a2h,0a2h,05eh,05eh,0ffh,0ffh	; 80cb  ..^^........^^..
	defb 01dh,01dh,001h,001h,0fdh,0fdh,055h,055h,0aah,0aah,0bdh,0bdh,001h,001h,0f8h,0f8h	; 80db  ......UU........
	defb 0a2h,0a2h,05eh,05eh,0fbh,0fbh,02ah,02ah,056h,056h,0dah,0dah,05eh,05eh,0c7h,0c7h	; 80eb  ..^^..**VV..^^..
	defb 0d4h,0d4h,081h,081h,0fah,0fah,0cah,0cah,0b5h,0b5h,05dh,05dh,001h,001h,03fh,03fh	; 80fb  ..........]]..??
	defb 0eah,0eah,05eh,05eh,0fah,0fah,06ah,06ah,056h,056h,05ah,05ah,07eh,07eh,0ffh,0ffh	; 810b  ..^^..jjVVZZ~~..
	defb 0d0h,0d0h,03fh,03fh,03ah,03ah,0cah,0cah,0b5h,0b5h,05ch,05ch,0beh,0beh,01fh,01fh	; 811b  ..??::....\\....
	defb 0e3h,0e3h,000h,000h,0c2h,0c2h,065h,065h,04eh,04eh,042h,042h,000h,000h,0dfh,0dfh	; 812b  ......eeNNBB....
	defb 0d3h,0d3h,03fh,03fh,07bh,07bh,033h,033h,08ch,08ch,0d4h,0d4h,0beh,0beh,0dfh,0dfh	; 813b  ..??{{33........
	defb 0e8h,0e8h,05fh,05fh,075h,075h,058h,058h,03ah,03ah,0a8h,0a8h,07eh,07eh,03fh,03fh	; 814b  ..__uuXX::..~~??
	defb 074h,074h,0bfh,0bfh,075h,075h,0adh,0adh,0b5h,0b5h,0ach,0ach,0bfh,0bfh,07eh,07eh	; 815b  tt..uu........~~
	defb 03ah,03ah,000h,000h,0fah,0fah,0c3h,0c3h,0c3h,0c3h,05ah,05ah,000h,000h,0fch,0fch	; 816b  ::........ZZ....
	defb 084h,004h,0bfh,0bfh,07fh,07fh,07fh,07fh,0feh,0feh,0fch,0fch,0bfh,0bfh,061h,060h	; 817b  ..............a`
	defb 0f0h,000h,07fh,07fh,000h,000h,00fh,00fh,0f0h,0f0h,000h,000h,07fh,07fh,00fh,000h	; 818b  ................
	defb 0f9h,001h,0bfh,0bfh,09fh,080h,0e0h,000h,007h,000h,0f9h,001h,0bfh,0bfh,09fh,080h	; 819b  ................
	defb 0f3h,003h,05fh,05fh,0cfh,0c0h,0ffh,000h,0ffh,000h,0f3h,003h,05fh,05fh,0cfh,0c0h	; 81ab  ..__........__..
	defb 0f6h,006h,000h,000h,06fh,060h,0ffh,000h,0ffh,000h,0f6h,006h,000h,000h,06fh,060h	; 81bb  ....o`........o`
	defb 0f1h,001h,0ffh,0ffh,08fh,080h,0ffh,000h,0ffh,000h,0f1h,001h,0ffh,0ffh,08fh,080h	; 81cb  ................

; ----------------------------------------------------------------------
; DATOS tablas_de_la_llama: Las DOS tablas de la llama de las toberas (2 x 24
;   B): pinta_nave se turna entre ellas con el bit 0 del contador de cuadros y
;   entra por el final, tan atras como diga 0xC468
;   0x81db..0x820b  (48 bytes)
DATA_tablas_de_la_llama:
	defb 0efh,000h,0ffh,03ah,0bdh,098h,0efh,011h,0ffh,040h,0fbh,08ah,0ffh,020h,0bfh,048h,0fdh,002h,0ffh,020h,0efh,008h,0ffh,000h	; 81db  ...:.....@... .H... ....
	defb 0efh,000h,0ffh,09ch,0bdh,03ah,0efh,058h,0ffh,009h,0fbh,010h,0ffh,092h,0bfh,004h,0fdh,015h,0ffh,040h,0efh,000h,0ffh,000h	; 81f3  .....:.X...........@....

; ----------------------------------------------------------------------
; DATOS graficos_hasta_el_mapa: Graficos: lo que queda hasta el mapa de 0x840B
;   0x820b..0x840b  (512 bytes)
DATA_graficos_hasta_el_mapa:
	defb 0bdh,03ch,042h,042h,095h,095h,0afh,0afh,09dh,09dh,0bfh,0bfh,056h,056h,0bdh,03ch	; 820b  .<BB........VV.<
	defb 0ffh,000h,0ffh,000h,0c3h,000h,0dbh,018h,0dbh,018h,0c3h,000h,0ffh,000h,0ffh,000h	; 821b  ................
	defb 0ffh,000h,0c3h,000h,099h,018h,0bdh,03ch,0bdh,03ch,099h,018h,0c3h,000h,0ffh,000h	; 822b  .......<.<......
	defb 039h,038h,07ch,07ch,0feh,0feh,0feh,0feh,0feh,0feh,07ch,07ch,039h,038h,083h,000h	; 823b  98||......||98..
	defb 0ffh,000h,0c3h,000h,018h,018h,07eh,07eh,0dbh,0dbh,024h,024h,081h,000h,0ffh,000h	; 824b  ......~~..$$....
	defb 0ffh,000h,083h,000h,038h,038h,07fh,07fh,054h,054h,0c1h,0c0h,01fh,000h,0ffh,000h	; 825b  ....88..TT......
	defb 0ffh,000h,0c1h,000h,01ch,01ch,0feh,0feh,02ah,02ah,083h,003h,0f8h,000h,0ffh,000h	; 826b  ........**......
	defb 0e0h,000h,08eh,00eh,0bch,03ch,03ah,03ah,070h,070h,067h,060h,057h,050h,007h,000h	; 827b  .....<::ppg`WP..
	defb 0c5h,004h,09dh,01ch,0b1h,030h,0bbh,038h,0b3h,030h,09bh,018h,0d3h,010h,0d7h,010h	; 828b  .....0.8.0......
	defb 0cbh,008h,0d9h,018h,095h,014h,0b9h,038h,0b9h,038h,095h,014h,0d9h,018h,0cbh,008h	; 829b  .......8.8......
	defb 0cdh,00ch,0dch,01ch,09ah,01ah,0ach,02ch,0ach,02ch,09ah,01ah,0dch,01ch,0cdh,00ch	; 82ab  .......,.,......
	defb 0cdh,00ch,09ch,01ch,03ah,03ah,05ch,05ch,04ch,04ch,03ah,03ah,09ch,01ch,0cdh,00ch	; 82bb  ....::\\LL::....
	defb 0ceh,00eh,09eh,01eh,035h,035h,05eh,05eh,04eh,04eh,035h,035h,09eh,01eh,0ceh,00eh	; 82cb  ....55^^NN55....
	defb 09eh,01eh,02eh,02eh,07dh,07dh,0beh,0beh,08eh,08eh,07dh,07dh,02eh,02eh,09eh,01eh	; 82db  ....}}....}}....
	defb 0e0h,000h,08eh,00eh,03fh,03fh,0ceh,0ceh,0ffh,0ffh,03eh,03eh,08eh,00eh,0e0h,000h	; 82eb  ....??....>>....
	defb 0ffh,000h,0c0h,000h,01eh,01eh,06fh,06fh,0feh,0feh,03eh,03eh,08eh,00eh,0e0h,000h	; 82fb  ......oo..>>....
	defb 0ffh,000h,0ffh,000h,0c0h,000h,0a7h,027h,03fh,03fh,0ffh,0ffh,01eh,01eh,0c0h,000h	; 830b  .......'??......
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 831b  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 832b  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 833b  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 834b  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 835b  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 836b  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 837b  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 838b  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 839b  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 83ab  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 83bb  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 83cb  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 83db  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 83eb  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 83fb  ................

; ----------------------------------------------------------------------
; DATOS mapa_de_la_fase: El MAPA de la fase, que es dos mapas en uno (468 B:
;   78 filas de 6 celdas de 32x32 px, 280 con suelo). Cada byte es el INDICE
;   DE TILE del pozo de 0x87F3 con el que se dibuja la celda (redibuja_fondo:
;   origen = 0x87F3 + valor*128) y a la vez la COLISION (consulta_mapa acaba
;   en and a: 0 = vacio, y sus seis llamadores solo miran el flag Z). La
;   partida recorre las filas 71 a 0. OJO: estuvo publicado como celdas de
;   32x16 y torre de 1248 px; el alto se habia derivado en vez de medirse, y
;   es 32 px (tile de 128 B = 4 B x 32 filas, consulta_mapa divide Y entre 32,
;   y el fino 0xAD2C da 16 pasos de 2 px por fila). La torre es 192x2496
;   0x840b..0x85df  (468 bytes)
DATA_mapa_de_la_fase:
	defb 02ah,02ah,02ah,02ah,02ah,02ah	; 840b
	defb 000h,000h,000h,000h,000h,000h	; 8411
	defb 00dh,025h,01bh,004h,004h,01ah	; 8417
	defb 00fh,027h,01eh,00ch,003h,01fh	; 841d
	defb 000h,000h,000h,00eh,000h,000h	; 8423
	defb 000h,000h,005h,00bh,006h,000h	; 8429
	defb 020h,00dh,009h,013h,002h,000h	; 842f
	defb 02ch,000h,007h,003h,008h,000h	; 8435
	defb 026h,000h,000h,000h,000h,000h	; 843b
	defb 00eh,000h,000h,005h,004h,006h	; 8441
	defb 022h,02bh,00dh,009h,013h,00ah	; 8447
	defb 000h,000h,000h,007h,00ch,008h	; 844d
	defb 000h,000h,000h,000h,02ch,000h	; 8453
	defb 000h,000h,000h,000h,00eh,000h	; 8459
	defb 000h,005h,01ah,00dh,023h,000h	; 845f
	defb 000h,001h,002h,000h,000h,000h	; 8465
	defb 000h,001h,002h,000h,000h,000h	; 846b
	defb 004h,017h,00ah,02bh,00dh,021h	; 8471
	defb 003h,015h,002h,000h,000h,00eh	; 8477
	defb 000h,001h,00ah,00dh,025h,023h	; 847d
	defb 00dh,01eh,01ch,000h,00eh,000h	; 8483
	defb 000h,000h,024h,02bh,023h,000h	; 8489
	defb 000h,000h,00eh,000h,000h,000h	; 848f
	defb 02bh,025h,027h,00dh,021h,000h	; 8495
	defb 000h,02ch,000h,000h,00eh,000h	; 849b
	defb 000h,00eh,000h,000h,024h,00dh	; 84a1
	defb 000h,022h,025h,02bh,026h,000h	; 84a7
	defb 000h,000h,02ch,000h,00eh,000h	; 84ad
	defb 000h,000h,00eh,000h,02ch,000h	; 84b3
	defb 020h,00dh,023h,000h,018h,004h	; 84b9
	defb 00eh,000h,000h,000h,007h,015h	; 84bf
	defb 026h,000h,000h,000h,000h,001h	; 84c5
	defb 012h,000h,000h,005h,004h,017h	; 84cb
	defb 000h,000h,000h,001h,013h,014h	; 84d1
	defb 000h,00fh,00dh,009h,013h,002h	; 84d7
	defb 000h,000h,000h,001h,014h,008h	; 84dd
	defb 006h,000h,005h,017h,002h,000h	; 84e3
	defb 016h,004h,017h,013h,002h,000h	; 84e9
	defb 003h,003h,003h,015h,00ah,00dh	; 84ef
	defb 000h,000h,000h,001h,002h,000h	; 84f5
	defb 005h,01ah,02bh,01eh,008h,000h	; 84fb
	defb 001h,002h,000h,000h,000h,000h	; 8501
	defb 017h,002h,000h,000h,00fh,021h	; 8507
	defb 015h,00ah,010h,000h,000h,00eh	; 850d
	defb 001h,002h,000h,000h,005h,00bh	; 8513
	defb 017h,016h,006h,000h,019h,003h	; 8519
	defb 014h,003h,008h,000h,00eh,000h	; 851f
	defb 01ch,000h,000h,000h,022h,01bh	; 8525
	defb 02ch,000h,000h,000h,000h,001h	; 852b
	defb 018h,006h,000h,005h,004h,017h	; 8531
	defb 019h,01fh,02bh,01eh,003h,015h	; 8537
	defb 01dh,000h,000h,000h,000h,001h	; 853d
	defb 01ch,000h,005h,006h,000h,001h	; 8543
	defb 00eh,000h,001h,016h,004h,017h	; 8549
	defb 022h,00dh,01eh,015h,013h,014h	; 854f
	defb 000h,000h,000h,001h,014h,008h	; 8555
	defb 000h,011h,000h,001h,002h,000h	; 855b
	defb 000h,024h,00dh,009h,002h,000h	; 8561
	defb 000h,012h,000h,019h,008h,000h	; 8567
	defb 000h,000h,000h,00eh,000h,000h	; 856d
	defb 000h,000h,005h,01dh,000h,000h	; 8573
	defb 000h,000h,001h,002h,000h,000h	; 8579
	defb 005h,004h,017h,00ah,02bh,01bh	; 857f
	defb 007h,003h,00ch,01fh,00dh,01eh	; 8585
	defb 000h,000h,02ch,000h,000h,000h	; 858b
	defb 000h,005h,00bh,004h,006h,000h	; 8591
	defb 000h,019h,003h,015h,002h,000h	; 8597
	defb 000h,02ch,000h,001h,00ah,00dh	; 859d
	defb 020h,023h,000h,007h,01ch,000h	; 85a3
	defb 00eh,000h,000h,000h,02ch,000h	; 85a9
	defb 018h,006h,000h,000h,018h,004h	; 85af
	defb 017h,016h,004h,01ah,01eh,003h	; 85b5
	defb 015h,013h,013h,002h,000h,000h	; 85bb
	defb 007h,00ch,003h,01fh,025h,02bh	; 85c1
	defb 000h,00eh,028h,029h,00eh,000h	; 85c7
	defb 000h,02ch,028h,029h,02ch,000h	; 85cd
	defb 000h,00eh,028h,029h,00eh,000h	; 85d3
	defb 000h,000h,000h,000h,000h,000h	; 85d9

; ----------------------------------------------------------------------
; DATOS ceros_bajo_la_zona: Ceros bajo la zona (532 B, todos 0x00 comprobado:
;   el vacio y el relleno hasta el pozo)
;   0x85df..0x87f3  (532 bytes)
DATA_ceros_bajo_la_zona:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 85df  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 85ef  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 85ff  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 860f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 861f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 862f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 863f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 864f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 865f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 866f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 867f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 868f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 869f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 86af  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 86bf  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 86cf  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 86df  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 86ef  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 86ff  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 870f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 871f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 872f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 873f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 874f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 875f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 876f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 877f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 878f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 879f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 87af  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 87bf  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 87cf  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 87df  ................
	defb 000h,000h,000h,000h	; 87ef

; ----------------------------------------------------------------------
; DATOS graficos_pozo_de_tiles: Graficos: el arranque del pozo de tiles del
;   blitter (el pozo entero son 45 TILES de 32x32, 128 B cada uno,
;   0x87F3-0x9E72: 0x87F3 + 45*128 - 1 = 0x9E72, y el valor maximo del mapa es
;   44 — cierra al byte con lo medido en el puerto 0x98). El tile 0
;   (0x87F3-0x8872) es la TRAMA DEL FONDO de las celdas vacias, y esta viva:
;   los rotadores 0xB140/0xB167 la desplazan una fila de pixel por cada 2 px
;   de scroll, el parallax a mitad de velocidad. Los tiles 0x28/0x29 son el
;   cartel-flecha de la base y el 0x2A la roseta que corona la fila 0
;   0x87f3..0x8a78  (645 bytes)
DATA_graficos_pozo_de_tiles:
	defb 0ffh,0ffh,0ffh,0ffh,0beh,0aah,0beh,0aah,07dh,055h,07dh,055h,0fch,0aah,0fch,0aah	; 87f3  ........}U}U....
	defb 0fch,055h,0fch,055h,0fch,02bh,0fch,02bh,0fch,02bh,0fch,02bh,0fch,033h,0fch,033h	; 8803  .U.U.+.+.+.+.3.3
	defb 0fch,033h,0fch,033h,0fch,02bh,0fch,02bh,0fch,02bh,0fch,02bh,0fch,055h,0fch,055h	; 8813  .3.3.+.+.+.+.U.U
	defb 0fch,0aah,0fch,0aah,07dh,055h,07dh,055h,0beh,0aah,0beh,0aah,0ffh,0ffh,0ffh,0ffh	; 8823  ....}U}U........
	defb 0ffh,0ffh,0ffh,0ffh,0beh,0aah,0beh,0aah,07dh,055h,07dh,055h,0fch,0aah,0fch,0aah	; 8833  ........}U}U....
	defb 0fch,055h,0fch,055h,0fch,02bh,0fch,02bh,0fch,02bh,0fch,02bh,0fch,033h,0fch,033h	; 8843  .U.U.+.+.+.+.3.3
	defb 0fch,033h,0fch,033h,0fch,02bh,0fch,02bh,0fch,02bh,0fch,02bh,0fch,055h,0fch,055h	; 8853  .3.3.+.+.+.+.U.U
	defb 0fch,0aah,0fch,0aah,07dh,055h,07dh,055h,0beh,0aah,0beh,0aah,0ffh,0ffh,0ffh,0ffh	; 8863  ....}U}U........
	defb 015h,054h,055h,055h,00fh,0feh,02ah,0aah,017h,0fch,050h,041h,00eh,0aeh,02ah,0aah	; 8873  .TUU..*...PA..*.
	defb 017h,0fch,050h,041h,00eh,0aeh,02ah,0aah,017h,0fch,050h,041h,00eh,0aeh,02ah,0aah	; 8883  ..PA..*...PA..*.
	defb 017h,0fch,050h,041h,00eh,0aeh,02ah,0aah,017h,0fch,050h,041h,00eh,0aeh,02ah,0aah	; 8893  ..PA..*...PA..*.
	defb 017h,0fdh,015h,055h,00eh,0aeh,08fh,0ffh,017h,0fdh,05bh,0ffh,00eh,0aeh,0aah,0aah	; 88a3  ...U......[.....
	defb 017h,0fdh,053h,055h,00eh,0aeh,0aah,0aah,017h,0fdh,053h,054h,00eh,0aeh,0aah,0a8h	; 88b3  ..SU......ST....
	defb 017h,0fdh,053h,051h,00fh,0feh,0aah,0a2h,015h,055h,053h,045h,00ah,0aah,0aah,0a2h	; 88c3  ..SQ.....USE....
	defb 015h,055h,053h,045h,00ah,0aah,0aah,0a2h,015h,055h,002h,005h,00ah,0aah,000h,00ah	; 88d3  .USE.....U......
	defb 015h,054h,055h,055h,00ah,0aah,02ah,0aah,015h,054h,055h,055h,00ah,0aah,02ah,0aah	; 88e3  .TUU..*..TUU..*.
	defb 055h,057h,055h,057h,0aah,0abh,0aah,0afh,055h,057h,055h,057h,0aah,0abh,0aah,0afh	; 88f3  UWUW....UWUW....
	defb 055h,057h,055h,057h,0aah,0abh,0aah,0afh,057h,0ffh,055h,057h,0afh,0feh,0a8h,02fh	; 8903  UWUW....W.UW.../
	defb 057h,055h,055h,057h,0aeh,0aah,0a8h,02fh,057h,055h,055h,057h,0aeh,0aah,0a8h,02fh	; 8913  WUUW.../WUUW.../
	defb 057h,055h,055h,057h,0feh,080h,000h,02fh,0fdh,055h,055h,057h,0aah,080h,000h,02fh	; 8923  WUUW.../.UUW.../
	defb 055h,055h,055h,057h,0aah,080h,000h,02fh,005h,055h,055h,057h,00eh,0aah,0a8h,02fh	; 8933  UUUW.../.UUW.../
	defb 057h,055h,055h,057h,0abh,0aah,0a8h,02fh,055h,0d5h,055h,057h,0aah,0eah,0a8h,02fh	; 8943  WUUW.../U.UW.../
	defb 055h,0d5h,055h,057h,0aah,0eah,0aah,0afh,055h,0c1h,055h,057h,0aah,083h,0aah,0afh	; 8953  U.UW....U.UW....
	defb 055h,057h,055h,057h,0aah,0abh,0aah,0afh,055h,057h,055h,057h,0aah,0abh,0aah,0afh	; 8963  UWUW....UWUW....
	defb 057h,055h,055h,015h,0abh,080h,000h,02ah,055h,000h,000h,015h,0aah,0aah,0aah,0aah	; 8973  WUU....*U.......
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0a8h,055h,07fh,0ffh,0f9h,0aah,0b5h,055h,058h	; 8983  UUUU....U.....UX
	defb 055h,07fh,0ffh,0f9h,0aah,0aah,0aah,0a8h,055h,07fh,0ffh,0f9h,0aah,0b5h,055h,058h	; 8993  U.......U.....UX
	defb 055h,07fh,0ffh,0f9h,0aah,0aah,0aah,0a8h,055h,07fh,0ffh,0f9h,0aah,080h,000h,000h	; 89a3  U.......U.......
	defb 055h,000h,000h,081h,0aah,0aah,0aah,0aah,055h,055h,054h,0d5h,0aah,0aah,0aah,0aah	; 89b3  U.......UUT.....
	defb 0ffh,0f5h,05eh,0ffh,0ffh,0fah,0beh,0ffh,055h,05fh,0f4h,0d5h,0aah,06fh,0eah,0aah	; 89c3  ..^.....U_...o..
	defb 055h,055h,054h,0d5h,000h,06ah,0aah,000h,0ffh,055h,055h,0ffh,0aah,06ah,0aah,0aah	; 89d3  UUT..j...UU..j..
	defb 055h,055h,055h,055h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 89e3  UUUU............
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0aah,0aah,0aah,0aah	; 89f3  ................
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0ffh,0aah	; 8a03  UUUU....UUUU....
	defb 055h,055h,061h,055h,000h,00ah,0b5h,0a0h,000h,005h,059h,040h,0aah,0a2h,0adh,0a2h	; 8a13  UUaU......Y@....
	defb 055h,051h,057h,045h,0aah,0a8h,0abh,0a2h,055h,054h,055h,045h,099h,0aah,02ah,0a2h	; 8a23  UQWE....UTUE..*.
	defb 055h,055h,015h,045h,099h,0aah,08ah,0a2h,055h,055h,045h,045h,099h,0aah,0a2h,0a2h	; 8a33  UU.E....UUEE....
	defb 055h,055h,051h,045h,099h,0aah,0a8h,00ah,055h,055h,054h,015h,099h,0aah,0aah,0aah	; 8a43  UUQE....UUT.....
	defb 055h,055h,055h,055h,099h,0aah,0aah,0aah,055h,055h,095h,055h,099h,0aah,0aah,0aah	; 8a53  UUUU....UU.U....
	defb 055h,055h,055h,055h,0aah,0ffh,0feh,0aah,055h,0ffh,0fch,055h,0abh,0aah,0aah,02ah	; 8a63  UUUU....U..U...*
	defb 000h,000h,000h,000h,000h	; 8a73

; ----------------------------------------------------------------------
; DATOS graficos_8A78: Graficos (3542 B; racha 1.51, entropia 5.00, 153
;   valores: mas
;   0x8a78..0x984e  (3542 bytes)
DATA_graficos_8A78:
	defb 000h,000h,000h,000h,000h,000h,000h,00ah,0aah,0aah,0aah,015h,055h,055h,055h,00ah	; 8a78  ............UUU.
	defb 0aah,0aah,0aah,015h,055h,055h,055h,00ah,0aah,0aah,0aah,015h,055h,055h,055h,00ah	; 8a88  ....UUU.....UUU.
	defb 0aah,000h,000h,015h,054h,000h,000h,00ah,0a8h,0aah,0aah,015h,051h,055h,055h,00ah	; 8a98  ....T.......QUU.
	defb 0a2h,0aah,0aah,015h,045h,055h,055h,00ah,0a2h,0afh,0e2h,015h,045h,058h,015h,00ah	; 8aa8  ....EUU.....EX..
	defb 0a2h,0aah,0b2h,015h,045h,059h,055h,00ah,0a2h,0aah,0b2h,015h,051h,059h,055h,00ah	; 8ab8  ....EYU.....QYU.
	defb 0a8h,0aah,0b2h,015h,054h,059h,055h,00ah,0aah,02ah,0b2h,015h,054h,059h,055h,00ah	; 8ac8  ....TYU..*..TYU.
	defb 0aah,02bh,0f2h,015h,054h,058h,005h,00ah,0aah,02ah,0aah,015h,054h,055h,055h,00ah	; 8ad8  .+..TX...*..TUU.
	defb 0aah,02ah,0aah,015h,054h,055h,055h,00ah,0aah,02ah,0aah,000h,000h,000h,001h,000h	; 8ae8  .*..TUU..*......
	defb 000h,000h,003h,000h,000h,000h,007h,0aah,0aah,0aah,0afh,055h,055h,055h,057h,0aah	; 8af8  ...........UUUW.
	defb 0aah,0aah,0afh,054h,000h,015h,057h,0a8h,000h,03ah,0afh,051h,055h,05dh,057h,002h	; 8b08  ...T..W..:.QU]W.
	defb 0aah,0aeh,0afh,005h,055h,057h,057h,0aah,0aah,0aeh,0afh,055h,055h,057h,057h,0aah	; 8b18  ....UWW....UUWW.
	defb 0aah,0aeh,0afh,055h,07dh,057h,057h,0aah,0eah,0aeh,0afh,055h,05dh,057h,057h,0aah	; 8b28  ...U}WW....U]WW.
	defb 0eah,0aeh,0afh,055h,05dh,057h,057h,0aah,0eah,0aeh,0afh,055h,05dh,057h,057h,0afh	; 8b38  ...U]WW....U]WW.
	defb 0eah,0aeh,0afh,05dh,05dh,05dh,057h,0aah,0aah,0bah,0afh,05fh,0fdh,075h,057h,0aah	; 8b48  ...]]]W...._.uW.
	defb 0aah,0eah,0afh,055h,055h,0d5h,057h,0aah,0abh,0aah,0afh,055h,057h,055h,057h,0aah	; 8b58  ...UU.W....UWUW.
	defb 0abh,0aah,0afh,055h,057h,055h,057h,0aah,0abh,0aah,0afh,015h,054h,055h,055h,00ah	; 8b68  ...UWUW.....TUU.
	defb 0aeh,02ah,0aah,010h,00ch,055h,055h,008h,08eh,02ah,02ah,012h,02ch,055h,0d5h,008h	; 8b78  .*...UU..**.,U..
	defb 08eh,02ah,0aah,012h,02ch,055h,055h,008h,08eh,02ah,02ah,012h,02ch,055h,0d5h,008h	; 8b88  .*..,UU..**.,U..
	defb 08eh,02ah,0aah,012h,02ch,055h,055h,008h,08eh,02ah,02ah,012h,02ch,055h,0d5h,008h	; 8b98  .*..,UU..**.,U..
	defb 08eh,02ah,0aah,012h,02ch,055h,055h,008h,08eh,02ah,0aah,012h,02ch,055h,055h,008h	; 8ba8  .*..,UU..*..,UU.
	defb 08eh,03fh,0eah,012h,02ch,07fh,0f5h,008h,08eh,0aah,0bah,010h,00dh,055h,05fh,00fh	; 8bb8  .?..,........U_.
	defb 0feh,0aah,0afh,01fh,0fdh,055h,055h,00ah,0aah,0aah,0aah,015h,055h,055h,055h,00ah	; 8bc8  .....UU.....UUU.
	defb 0aah,0a0h,000h,015h,055h,05fh,0ffh,00ah,0aah,0aah,0aah,015h,055h,055h,055h,03fh	; 8bd8  ....U_......UUU?
	defb 0ffh,0ffh,0ffh,07fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,055h,057h,055h,057h,080h	; 8be8  ...........UWUW.
	defb 00bh,0aah,0afh,05fh,0e7h,055h,057h,09ah,0abh,0aah,0afh,05ah,0a7h,055h,057h,095h	; 8bf8  ..._.UW....Z.UW.
	defb 06bh,0aah,0afh,055h,067h,055h,057h,09ah,0abh,0aah,0afh,05ah,0a7h,055h,057h,095h	; 8c08  k..UgUW....Z.UW.
	defb 06bh,0aah,0afh,055h,067h,055h,057h,09ah,0abh,0aah,0afh,05ah,0a7h,055h,057h,095h	; 8c18  k..UgUW....Z.UW.
	defb 06eh,0aah,0afh,055h,06dh,055h,057h,09fh,0eah,0aah,0afh,040h,00dh,07fh,0d7h,0aah	; 8c28  n..UmUW....@....
	defb 0bah,0ffh,0efh,055h,05dh,060h,0d7h,0aah,0bah,0e0h,0efh,0ffh,0f5h,07fh,0d7h,0ffh	; 8c38  ...U]`..........
	defb 0eah,0ffh,0efh,055h,055h,055h,057h,0aah,0aah,09ah,0afh,055h,055h,055h,057h,000h	; 8c48  ...UUUW....UUUW.
	defb 000h,01ah,0afh,0ffh,0ffh,0f5h,057h,0aah,0aah,0aah,0afh,055h,055h,055h,057h,0ffh	; 8c58  ......W....UUUW.
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,015h,054h,055h,055h,02ah	; 8c68  ............TUU*
	defb 0aah,02ah,0aah,055h,054h,055h,055h,0aah,0aah,02ah,0aah,055h,054h,055h,055h,0aah	; 8c78  .*.UTUU..*.UTUU.
	defb 0aah,02ah,0aah,040h,004h,055h,055h,080h,00ah,00ah,0aah,045h,05ch,005h,055h,088h	; 8c88  .*.@.UU....E\.U.
	defb 03ah,08ah,0aah,040h,01dh,045h,055h,088h,0bah,08ah,0aah,042h,01dh,045h,055h,088h	; 8c98  :..@.EU....B.EU.
	defb 0bah,08ah,0ffh,002h,01dh,045h,0ffh,008h,03ah,08ah,0eah,000h,01dh,045h,0d5h,008h	; 8ca8  .....E..:....E..
	defb 03ah,08ah,0eah,000h,09dh,045h,0c0h,008h,03ah,08ah,080h,001h,01dh,045h,055h,008h	; 8cb8  :....E..:....EU.
	defb 03ah,08ah,0aah,005h,05dh,015h,055h,00fh,0fah,02ah,0aah,01fh,0fch,055h,055h,0aah	; 8cc8  :...].U..*...UU.
	defb 0aah,02ah,0aah,055h,054h,055h,055h,0aah,0aah,02ah,0aah,055h,054h,055h,055h,0aah	; 8cd8  .*.UTUU..*.UTUU.
	defb 0aah,02ah,0aah,0d5h,054h,055h,055h,0eah,0aah,02ah,0aah,055h,057h,055h,050h,0aah	; 8ce8  .*..TUU..*.UWUP.
	defb 0abh,0aah,0a8h,055h,055h,0d5h,054h,0aah,0aah,0eah,0aah,05fh,0d5h,075h,055h,0bah	; 8cf8  ...UU.T...._.uU.
	defb 0eah,0bah,0aah,050h,055h,05dh,055h,0b8h,0eah,0aeh,0aah,050h,055h,05dh,055h,0bah	; 8d08  ...PU]U....PU]U.
	defb 0eah,0aeh,0aah,05fh,0d5h,05dh,055h,0aah,0aah,0aeh,0aah,055h,055h,05dh,055h,0ffh	; 8d18  ..._.]U....UU]U.
	defb 0ffh,0aeh,0aah,0ffh,0ffh,05fh,0ffh,0aah,0aah,02fh,0ffh,055h,054h,05fh,055h,0aah	; 8d28  ....._.../.UT_U.
	defb 0aah,02fh,0aah,000h,014h,05fh,055h,000h,03ah,02fh,0aah,055h,074h,05fh,055h,0aah	; 8d38  ./..._U.:/.Ut_U.
	defb 0bah,02fh,0aah,055h,074h,05fh,055h,0aah,0bah,0feh,000h,055h,075h,0fch,000h,0aah	; 8d48  ./.Ut_U....Uu...
	defb 0bah,0aah,0aah,055h,075h,055h,055h,0aah,0bah,0aah,0aah,055h,05dh,055h,055h,0aah	; 8d58  ...UuUU....U]UU.
	defb 0aeh,0aah,0abh,055h,057h,055h,057h,0aah,0abh,0aah,0afh,015h,0d5h,054h,057h,02ah	; 8d68  ...UWUW......TW*
	defb 0eah,0a8h,0abh,055h,0d5h,054h,055h,0aah,0eah,0a8h,0aah,055h,0c0h,000h,055h,0aah	; 8d78  ...U.TU....U..U.
	defb 080h,000h,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,000h	; 8d88  ...UUUU....UUUU.
	defb 00ah,0aah,000h,000h,015h,055h,000h,0aah,0bah,0aah,02ah,07fh,0fdh,055h,015h,0e0h	; 8d98  .....U....*..U..
	defb 02eh,0aah,02ah,04fh,077h,055h,015h,0ebh,02bh,0ffh,0aah,04dh,076h,000h,015h,0ebh	; 8da8  ..*OwU..+..Mv...
	defb 02bh,0aah,02ah,04fh,077h,0ffh,095h,0e0h,02ah,000h,02ah,055h,077h,055h,015h,0ffh	; 8db8  +.*Ow...*.*UwU..
	defb 0eeh,0aah,02ah,055h,05dh,055h,015h,0aah,0bah,0aah,02ah,055h,075h,055h,015h,0aah	; 8dc8  ..*U]U....*UuU..
	defb 0eah,0aah,02ah,055h,0d5h,055h,015h,0abh,0a0h,002h,02ah,057h,05fh,0fdh,015h,0abh	; 8dd8  ..*U.U....*W_...
	defb 0aah,0aah,02ah,057h,055h,055h,015h,0abh,0aah,0aah,02ah,057h,055h,055h,015h,0abh	; 8de8  ..*WUU....*WUU..
	defb 0aah,0aah,02ah,057h,055h,055h,015h,0abh,0aah,0aah,02ah,055h,0d5h,055h,015h,0aah	; 8df8  ..*WUU....*U.U..
	defb 0eah,0aah,02ah,055h,075h,055h,015h,0aah,0bah,0aah,02ah,055h,05dh,055h,015h,0aah	; 8e08  ..*UuU....*U]U..
	defb 0aeh,0aah,02ah,055h,057h,055h,015h,0aah,0abh,0aah,02ah,055h,057h,055h,015h,0aah	; 8e18  ..*UWU....*UWU..
	defb 0abh,0aah,02ah,055h,057h,055h,015h,0aah,0abh,0aah,02ah,057h,0ffh,055h,015h,0afh	; 8e28  ..*UWU....*W.U..
	defb 0feh,0aah,08ah,05dh,055h,055h,045h,0bah,0aah,0aah,0a2h,0f5h,0ffh,055h,051h,0ebh	; 8e38  ...]UUE......UQ.
	defb 001h,0aah,0abh,055h,07dh,055h,055h,0abh,045h,0aah,0aah,055h,055h,055h,0d5h,001h	; 8e48  ...U}UU.E..UUU..
	defb 055h,0aah,080h,0ffh,045h,055h,0ffh,0abh,07dh,0aah,0aah,055h,001h,055h,0d5h,02bh	; 8e58  U...EU..}..U.U.+
	defb 0ffh,0aah,0abh,015h,0ffh,0ffh,057h,00ah,0ffh,0feh,0afh,000h,000h,000h,000h,000h	; 8e68  ......W.........
	defb 000h,000h,000h,000h,000h,000h,000h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 8e78  ...........UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 8e88  ...UUUU....UUUU.
	defb 0ffh,0aah,0aah,055h,0ffh,015h,055h,0abh,0aah,08ah,0aah,057h,055h,045h,055h,0aeh	; 8e98  ...U..U....WUEU.
	defb 080h,0a2h,0aah,0fdh,03eh,045h,0ffh,0fah,0aah,0a3h,0ffh,055h,03eh,047h,055h,0aah	; 8ea8  ....>E.....U>GU.
	defb 0aah,0a6h,0aah,055h,03eh,04dh,055h,0aah,0aah,0bah,0aah,055h,03eh,055h,055h,0aah	; 8eb8  ...U>MU....U>UU.
	defb 080h,0aah,0aah,055h,055h,055h,055h,000h,000h,02ah,0a0h,000h,000h,075h,040h,0aah	; 8ec8  ...UUUU..*...u@.
	defb 0aah,0bah,08ah,055h,055h,050h,015h,0aah,0aah,0a0h,02ah,055h,055h,055h,055h,0ffh	; 8ed8  ...UUP....*UUUU.
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,015h,0d5h,054h,057h,00ah	; 8ee8  .............TW.
	defb 0eah,0a8h,0afh,015h,0d5h,054h,057h,00ah,0eah,0a8h,0afh,015h,0cch,0cch,057h,00ah	; 8ef8  .....TW.......W.
	defb 0eah,0a8h,0afh,015h,0d5h,054h,057h,00ah,0eah,0a8h,0afh,015h,075h,051h,057h,00ah	; 8f08  .....TW.....uQW.
	defb 0b8h,002h,0afh,015h,050h,005h,057h,000h,0aah,0aah,007h,00eh,055h,055h,077h,00eh	; 8f18  ....P.W.....UUw.
	defb 000h,000h,077h,00eh,0ffh,0ffh,077h,00eh,0a8h,00ah,077h,000h,057h,0f5h,007h,00ah	; 8f28  ..w...w...w.W...
	defb 0a8h,00ah,0afh,015h,057h,0f5h,057h,00ah,0a8h,00ah,0afh,015h,015h,057h,057h,00ah	; 8f38  ....W.W......WW.
	defb 08ah,0aeh,0afh,015h,0c5h,05ch,057h,00ah,0e3h,0f8h,0afh,015h,0d7h,0f4h,057h,00ah	; 8f48  .....\W.......W.
	defb 0eah,0a8h,0afh,015h,0d5h,054h,057h,00ah,0eah,0a8h,0afh,015h,0d5h,054h,057h,00ah	; 8f58  .....TW......TW.
	defb 0eah,0a8h,0afh,015h,0d5h,054h,057h,00ah,0eah,0a8h,0afh,000h,000h,000h,000h,000h	; 8f68  .....TW.........
	defb 000h,000h,000h,000h,000h,000h,000h,00ah,0aah,0aah,0aah,015h,055h,055h,055h,00ah	; 8f78  ............UUU.
	defb 0a8h,000h,002h,015h,055h,0ffh,0f5h,00ah,0a8h,000h,032h,015h,055h,055h,035h,00ah	; 8f88  ....U.....2.UU5.
	defb 0aah,0aah,0b2h,015h,05fh,0f5h,005h,00ah,0bfh,0e2h,0aah,015h,075h,051h,055h,00ah	; 8f98  ...._.......uQU.
	defb 0eah,0a8h,0aah,015h,0d5h,054h,07fh,00ah,0e6h,06ah,0ffh,015h,0d5h,055h,055h,00ah	; 8fa8  .....T...j...UU.
	defb 0e6h,066h,0aah,015h,0d5h,055h,055h,00ah,0e6h,066h,066h,015h,0d5h,055h,055h,00ah	; 8fb8  .f...UU..ff..UU.
	defb 0eah,066h,0aah,015h,075h,055h,055h,00ah,0bah,0aah,080h,015h,05dh,055h,000h,00ah	; 8fc8  .f..uUU.....]U..
	defb 0aeh,000h,02ah,015h,054h,000h,055h,00ah,0aah,0aah,0aah,015h,055h,055h,055h,03fh	; 8fd8  ..*.T.U.....UUU?
	defb 0ffh,0ffh,0ffh,07fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,001h,000h	; 8fe8  ................
	defb 000h,000h,003h,000h,000h,000h,007h,0aah,0aah,0aah,0afh,055h,055h,055h,057h,0aah	; 8ff8  ...........UUUW.
	defb 0aah,0aah,0afh,055h,057h,0ffh,0d7h,0aah,0afh,0ffh,0afh,04ch,0d7h,033h,017h,0aah	; 9008  ...UW......L.3..
	defb 0aeh,0cch,02fh,055h,057h,003h,017h,0aah,0aeh,0d4h,02fh,055h,057h,013h,017h,0aah	; 9018  ../UW...../UW...
	defb 0aeh,0d4h,02fh,0ffh,0d7h,013h,017h,0ffh,0aeh,0d4h,02fh,055h,017h,013h,017h,0aah	; 9028  ../......./U....
	defb 02eh,0d4h,02fh,055h,017h,013h,017h,0aah,02eh,0d4h,02fh,055h,017h,013h,017h,0aah	; 9038  ../U....../U....
	defb 02eh,0c4h,02fh,055h,017h,033h,017h,000h,02eh,0cch,02fh,000h,014h,000h,017h,0aah	; 9048  ../U.3..../.....
	defb 0a8h,000h,02fh,055h,055h,055h,057h,0aah,0aah,0aah,0afh,055h,055h,055h,057h,0ffh	; 9058  ../UUUW....UUUW.
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,001h,000h	; 9068  ................
	defb 000h,000h,003h,000h,000h,000h,007h,00ah,0aah,0aah,0afh,015h,055h,055h,057h,008h	; 9078  ............UUW.
	defb 0a2h,08ah,02fh,010h,041h,004h,017h,00ah,0aah,0aah,0afh,010h,041h,004h,017h,00ah	; 9088  ../.A.......A...
	defb 0aah,0aah,0afh,010h,041h,004h,017h,00ah,0aah,0aah,0afh,010h,041h,004h,017h,00ah	; 9098  ....A.......A...
	defb 0aah,0aah,0afh,010h,041h,004h,017h,00ah,0aah,0aah,0afh,010h,041h,004h,017h,00ah	; 90a8  ....A.......A...
	defb 0aah,0aah,0afh,010h,041h,004h,017h,00ah,0a2h,08ah,0afh,010h,055h,054h,017h,00ah	; 90b8  ....A.......UT..
	defb 0aah,0aah,0afh,010h,057h,0d4h,017h,00ah,0afh,08ah,0afh,010h,05dh,044h,017h,008h	; 90c8  ....W.......]D..
	defb 0bah,0a2h,02fh,015h,075h,051h,057h,00ah,0eah,0a8h,0afh,015h,0d5h,054h,057h,00ah	; 90d8  ../.uQW......TW.
	defb 0ffh,0feh,0afh,015h,080h,000h,057h,00ah,0eah,0a8h,0afh,015h,0d5h,054h,057h,00ah	; 90e8  ......W......TW.
	defb 0eah,0a8h,0afh,015h,0ffh,0feh,057h,00ah,080h,000h,0afh,015h,0d5h,054h,057h,00ah	; 90f8  ......W......TW.
	defb 0eah,0a8h,0afh,015h,0ffh,0feh,057h,00ah,080h,000h,0afh,015h,0d5h,054h,057h,00bh	; 9108  ......W......TW.
	defb 0b8h,0e2h,02fh,017h,047h,01dh,017h,00eh,0aah,0aah,08fh,017h,000h,001h,017h,00eh	; 9118  ../.G...........
	defb 000h,015h,08fh,017h,001h,041h,017h,00eh,000h,009h,08fh,017h,028h,0a1h,017h,00eh	; 9128  .....A......(...
	defb 000h,001h,08fh,017h,050h,001h,017h,00eh,000h,005h,08fh,017h,0ffh,0ffh,017h,00eh	; 9138  ....P...........
	defb 0aah,0aah,08fh,017h,055h,055h,017h,00bh,0aah,0aah,02fh,015h,0c0h,000h,057h,00ah	; 9148  ....UU..../...W.
	defb 080h,000h,0afh,015h,055h,055h,057h,00ah,0aah,0aah,0afh,015h,055h,055h,057h,03fh	; 9158  ....UUW.....UUW?
	defb 0ffh,0ffh,0ffh,07fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,057h,055h,055h,015h,0abh	; 9168  ...........WUU..
	defb 0aah,0aah,02ah,057h,055h,055h,015h,0abh,080h,00ah,02ah,057h,07fh,0f5h,015h,0abh	; 9178  ..*WUU....*W....
	defb 0aah,0aah,02ah,057h,055h,055h,015h,0abh,0a8h,02ah,02ah,057h,050h,075h,015h,0abh	; 9188  ..*WUU...**WPu..
	defb 0a2h,0bah,02ah,057h,045h,05dh,015h,0abh,0a2h,0bah,08ah,057h,045h,05dh,045h,0ffh	; 9198  ..*WE].....WE]E.
	defb 0a3h,0bah,0afh,0ffh,044h,05dh,05fh,0aah,0a2h,0bah,0aah,055h,045h,05dh,055h,0aah	; 91a8  ....D]_....UE]U.
	defb 08ah,03ah,0aah,000h,015h,0d0h,000h,000h,02ah,0a0h,000h,055h,055h,055h,055h,0aah	; 91b8  .:......*..UUUU.
	defb 0aah,0aah,0aah,055h,05fh,0ffh,0d5h,0aah,0bfh,0ffh,0aah,055h,075h,055h,015h,0aah	; 91c8  ...U_......UuU..
	defb 0eah,0aah,02ah,055h,0d5h,055h,015h,0abh,0aah,0aah,02ah,057h,055h,055h,015h,0abh	; 91d8  ..*U.U....*WUU..
	defb 0aah,0aah,02ah,057h,055h,055h,015h,0abh,0aah,0aah,02ah,057h,055h,055h,015h,0abh	; 91e8  ..*WUU....*WUU..
	defb 0aah,0aah,02ah,057h,055h,055h,015h,0abh,0aah,0aah,02ah,057h,055h,055h,015h,0abh	; 91f8  ..*WUU....*WUU..
	defb 0aah,0aah,02ah,055h,0d5h,055h,015h,0aah,0eah,0aah,02ah,055h,070h,055h,015h,0aah	; 9208  ..*U.U....*UpU..
	defb 0a0h,0aah,02ah,055h,055h,0d5h,015h,0aah,0aah,0eah,02ah,055h,055h,075h,015h,0feh	; 9218  ..*UU.....*UUu..
	defb 0aah,0bah,02ah,0fdh,055h,074h,055h,0a8h,08ah,0b8h,0aah,051h,075h,074h,055h,0a8h	; 9228  ..*.UtU....QutU.
	defb 0aah,0b8h,0aah,001h,055h,074h,055h,000h,0aah,0b8h,0aah,055h,055h,075h,0ffh,0aah	; 9238  ....UtU....UUu..
	defb 08ah,0bbh,0ffh,055h,075h,075h,055h,0aah,0aah,0eah,0aah,055h,055h,0d5h,055h,0aah	; 9248  ...UuuU....UU.U.
	defb 0abh,0aah,000h,055h,057h,055h,0ffh,0aah,08bh,0aah,0aah,055h,077h,055h,055h,0aah	; 9258  ...UWU.....UwUU.
	defb 0abh,0aah,0abh,055h,057h,055h,057h,0aah,0abh,0aah,0afh,057h,055h,055h,015h,0abh	; 9268  ...UWUW....WUU..
	defb 000h,000h,02ah,057h,0ffh,0ffh,015h,0abh,0aah,0aah,02ah,057h,055h,055h,015h,0abh	; 9278  ..*W......*WUU..
	defb 0aah,0aah,02ah,057h,000h,000h,015h,0abh,0ffh,0ffh,02ah,055h,0d5h,055h,015h,0aah	; 9288  ..*W......*U.U..
	defb 0eah,0aah,02ah,055h,075h,055h,015h,0aah,0bah,0aah,08ah,055h,05dh,055h,045h,0aah	; 9298  ..*UuU.....U]UE.
	defb 0aeh,0aah,0a3h,055h,057h,055h,057h,0aah,0abh,0aah,0aah,055h,055h,0d5h,055h,0aah	; 92a8  ...UWUW....UU.U.
	defb 0aah,0eah,0aah,055h,055h,040h,000h,0aah,0aah,0a0h,000h,0ffh,055h,055h,055h,0feh	; 92b8  ...UU@......UUU.
	defb 02ah,0aah,0aah,055h,015h,055h,055h,0aah,08ah,0aah,0aah,055h,045h,055h,055h,002h	; 92c8  *..U.UU....UEUU.
	defb 0afh,0aah,0aah,0fdh,05fh,055h,055h,0aah,0aah,02ah,0aah,055h,054h,055h,055h,02ah	; 92d8  ...._UU..*.UTUU*
	defb 0aah,02ah,0aah,015h,054h,055h,055h,00ah,0aah,02ah,0aah,055h,057h,055h,057h,0aah	; 92e8  .*..TUU..*.UWUW.
	defb 0abh,0aah,0abh,055h,057h,055h,055h,0aah,0abh,0aah,0aah,066h,067h,055h,055h,0aah	; 92f8  ...UWUU....fgUU.
	defb 0abh,0aah,0aah,055h,057h,055h,055h,0aah,0abh,0aah,0aah,055h,057h,055h,055h,0aah	; 9308  ...UWUU....UWUU.
	defb 0aeh,0aah,000h,055h,05dh,054h,000h,0aah,0bah,0a8h,0aah,055h,05dh,051h,055h,0ffh	; 9318  ...U]T.....U]QU.
	defb 0bah,0a2h,088h,0ffh,05dh,045h,055h,0aah,03ah,08ah,088h,054h,05dh,015h,055h,0aah	; 9328  ....]EU.:..T].U.
	defb 03ah,028h,088h,000h,05ch,055h,055h,000h,03ah,028h,088h,055h,05ch,055h,055h,0aah	; 9338  :(..\UU.:(.U\UU.
	defb 0bah,028h,088h,055h,05ch,055h,055h,0aah,0bah,02ah,0aah,055h,074h,055h,055h,0aah	; 9348  .(.U\UU..*.UtUU.
	defb 0eah,000h,02ah,055h,0d4h,000h,015h,0abh,0aah,0aah,02ah,057h,055h,055h,015h,0abh	; 9358  ..*U......*WUU..
	defb 0aah,0aah,02ah,057h,055h,055h,015h,0abh,0aah,0aah,02ah,015h,054h,055h,055h,02ah	; 9368  ..*WUU....*.TUU*
	defb 0aah,02ah,0aah,055h,054h,055h,055h,0aah,0aah,02ah,0aah,055h,055h,015h,055h,0aah	; 9378  .*.UTUU..*.UU.U.
	defb 0aah,08ah,0aah,055h,055h,045h,055h,0aah,0aah,0a2h,0aah,055h,055h,051h,055h,000h	; 9388  ...UUEU....UUQU.
	defb 00ah,0a8h,0aah,000h,01dh,054h,055h,0aah,0aeh,0aah,02ah,055h,057h,055h,015h,0aah	; 9398  .....TU...*UWU..
	defb 0abh,0aah,0bfh,055h,055h,0d5h,07fh,0aah,0aah,0eah,0aah,055h,055h,075h,055h,0a0h	; 93a8  ...UU......UUuU.
	defb 002h,0eah,0aah,055h,051h,075h,040h,0a0h,002h,0eah,080h,055h,055h,075h,015h,0aah	; 93b8  ...UQu@....UUu..
	defb 0aah,0eah,02ah,055h,055h,075h,015h,0aah,0aah,0eah,02ah,055h,055h,0d5h,015h,0abh	; 93c8  ..*UUu....*UU...
	defb 0ffh,0aah,02ah,057h,0ffh,055h,015h,0abh,0aah,0aah,02ah,057h,055h,055h,015h,0abh	; 93d8  ..*W.U....*WUU..
	defb 0aah,0aah,02ah,057h,055h,055h,015h,0abh,0aah,0aah,02ah,015h,0d5h,054h,057h,00ah	; 93e8  ..*WUU....*..TW.
	defb 0e0h,008h,0abh,015h,0c0h,01ch,055h,00ah,0cah,0ach,0aah,015h,095h,056h,055h,00ah	; 93f8  ......U......VU.
	defb 0aah,0aah,0aah,015h,055h,055h,055h,00ah,0aah,0aah,0aah,015h,0ffh,055h,055h,00bh	; 9408  ....UUU......UU.
	defb 000h,020h,000h,015h,001h,040h,000h,00bh,038h,00ah,0aah,015h,001h,045h,055h,00bh	; 9418  . ...@..8....EU.
	defb 038h,00ah,0aah,015h,001h,045h,055h,00bh,000h,02fh,0eah,015h,039h,05fh,0d5h,00bh	; 9428  8....EU../..9_..
	defb 000h,02ah,08ah,015h,001h,055h,015h,00bh,000h,02ah,08ah,015h,039h,055h,015h,00bh	; 9438  .*...U...*..9U..
	defb 000h,020h,00ah,015h,001h,040h,015h,00bh,000h,00ah,0aah,015h,055h,015h,055h,00ah	; 9448  . ...@......U.U.
	defb 000h,02ah,0aah,015h,054h,055h,0fdh,00ah,0aah,02ah,002h,015h,054h,055h,055h,00ah	; 9458  .*..TU...*..TUU.
	defb 0aah,02ah,0aah,015h,054h,055h,055h,00ah,0aah,02ah,0aah,015h,054h,055h,055h,00ah	; 9468  .*..TUU..*..TUU.
	defb 0aah,02ah,0aah,015h,054h,055h,013h,00ah,0aah,022h,00ah,017h,0fch,041h,053h,00eh	; 9478  .*..TU..."...AS.
	defb 0aeh,02ah,00ah,015h,054h,041h,053h,00fh,0feh,02ah,00ah,015h,054h,041h,053h,00ah	; 9488  .*..TAS..*..TAS.
	defb 0a8h,0aah,00ah,015h,051h,041h,053h,00ah,0a2h,0aah,00ah,015h,045h,041h,053h,00ah	; 9498  ....QAS.....EAS.
	defb 08ah,0aah,00ah,015h,015h,041h,053h,00ah,02ah,0aah,00ah,014h,055h,041h,013h,00ah	; 94a8  .....AS.*...UA..
	defb 02ah,0a2h,0aah,014h,055h,055h,055h,00ah,02ah,0aah,0aah,014h,07fh,0ffh,0ffh,00ah	; 94b8  *...UUU.*.......
	defb 0ffh,0ffh,0dfh,015h,055h,055h,055h,00ah,0aah,0aah,09ah,015h,055h,055h,055h,00ah	; 94c8  ....UUU.....UUU.
	defb 0ffh,0eah,080h,015h,0ffh,0c5h,05fh,00ah,0eah,0a2h,0aah,015h,0d5h,051h,055h,00ah	; 94d8  ......_......QU.
	defb 0ffh,0fch,0abh,015h,080h,000h,057h,00ah,0eah,0a8h,0afh,000h,000h,000h,000h,000h	; 94e8  ......W.........
	defb 000h,000h,000h,000h,000h,000h,000h,0aah,0afh,0ffh,0feh,055h,047h,0ffh,0ffh,0aah	; 94f8  ...........UG...
	defb 0a2h,0aah,0aeh,055h,044h,01ch,037h,0aah,0a2h,0ffh,0aeh,055h,044h,0ddh,037h,000h	; 9508  ...UD.7....UD.7.
	defb 062h,0beh,0aeh,000h,0c4h,0ddh,037h,0abh,0a2h,0beh,0aeh,057h,044h,0ddh,037h,0aeh	; 9518  b.....7....WD.7.
	defb 0a2h,0beh,0aeh,05dh,044h,0ddh,037h,0aeh,0a2h,0beh,0afh,05dh,044h,01ch,035h,0aeh	; 9528  ...]D.7....]D.5.
	defb 0a2h,0ebh,0eah,05dh,045h,055h,055h,0aeh,0a2h,0aah,0aah,05ch,005h,055h,055h,0a8h	; 9538  ...]EUU....\.UU.
	defb 002h,0aah,0aah,055h,055h,055h,055h,0aah,0aah,000h,000h,055h,057h,000h,000h,0aah	; 9548  ...UUUU....UW...
	defb 0abh,0aah,0aah,055h,057h,055h,055h,0aah,0abh,0aah,0aah,055h,057h,055h,055h,0aah	; 9558  ...UWUU....UWUU.
	defb 0abh,0aah,0abh,055h,057h,055h,057h,0aah,0abh,0aah,0afh,000h,000h,000h,000h,000h	; 9568  ...UWUW.........
	defb 000h,000h,000h,000h,000h,000h,000h,0ffh,0feh,0aah,0aah,040h,005h,055h,055h,0d5h	; 9578  ...........@.UU.
	defb 056h,0aah,0aah,040h,005h,055h,055h,0cah,0a6h,0aah,0aah,040h,005h,055h,055h,0d5h	; 9588  V..@.UU....@.UU.
	defb 056h,080h,000h,040h,005h,000h,000h,0ffh,0feh,02ah,0aah,055h,054h,055h,055h,0aah	; 9598  V..@.....*.UTUU.
	defb 0aah,02bh,0feh,0ffh,054h,055h,055h,0feh,0a8h,0abh,0feh,054h,051h,055h,055h,0a8h	; 95a8  .+..TUU....TQUU.
	defb 0a2h,0abh,0feh,054h,04fh,0f5h,055h,0a8h,09fh,0e2h,0beh,054h,055h,051h,055h,0a8h	; 95b8  ...TO.U....TUQU.
	defb 0aah,0a8h,0beh,054h,055h,054h,055h,000h,0aah,080h,03eh,000h,055h,000h,055h,0aah	; 95c8  ...TUTU...>.U.U.
	defb 0aah,02ah,0beh,055h,054h,055h,055h,0aah,0aah,02fh,0feh,055h,054h,055h,055h,02ah	; 95d8  .*.UTUU../.UTUU*
	defb 0aah,02fh,0feh,015h,054h,055h,055h,00ah,0aah,02ah,0aah,055h,057h,055h,057h,0aah	; 95e8  ./..TUU..*.UWUW.
	defb 0abh,0aah,0afh,055h,057h,055h,057h,0aah,0abh,0aah,0afh,07fh,0f7h,055h,057h,080h	; 95f8  ...UWUW......UW.
	defb 00bh,0aah,0afh,055h,057h,055h,057h,0aah,0abh,0aah,0afh,055h,057h,000h,017h,0aah	; 9608  ...UWUW....UW...
	defb 0aah,000h,02fh,07fh,0f5h,055h,077h,080h,00ah,0aah,0efh,055h,055h,055h,077h,0aah	; 9618  ../..Uw....UUUw.
	defb 0aah,0aah,0efh,055h,055h,055h,077h,0aah,0aah,0aah,0efh,07fh,0ffh,05fh,0d7h,080h	; 9628  ...UUUw......_..
	defb 000h,0bfh,0afh,055h,055h,075h,057h,0aah,0aah,0eah,0afh,0ffh,0ffh,0d5h,057h,0feh	; 9638  ...UUuW.......W.
	defb 0ffh,0aah,0afh,054h,0d5h,055h,057h,0aah,0aah,0aah,0afh,054h,0d5h,055h,057h,000h	; 9648  ...T.UW....T.UW.
	defb 0abh,0feh,0afh,0ffh,0d7h,0fch,057h,0aah,0aeh,0a8h,0afh,055h,0fdh,054h,057h,02ah	; 9658  ......W....U.TW*
	defb 0fbh,018h,0afh,015h,0d5h,054h,057h,00ah,0eah,0a8h,0afh,015h,0d5h,054h,057h,022h	; 9668  .....TW......TW"
	defb 0eah,0a8h,0afh,049h,0c0h,000h,057h,0aah,080h,000h,0afh,049h,055h,055h,057h,0aah	; 9678  ...I..W....IUUW.
	defb 0aah,0aah,0afh,049h,040h,001h,057h,0aah,080h,003h,0afh,049h,015h,055h,0d7h,000h	; 9688  ...I@.W....I.U..
	defb 02ah,0aah,0efh,000h,055h,055h,077h,0aah,0aah,0aah,0efh,055h,055h,055h,077h,0aah	; 9698  *...UUw....UUUw.
	defb 0aah,0aah,0efh,05fh,0fdh,055h,077h,0a0h,002h,0aah,0efh,055h,055h,055h,077h,0aah	; 96a8  ..._.Uw....UUUw.
	defb 0aah,0aah,0efh,055h,055h,07fh,0d7h,0bfh,0fah,0ffh,0afh,040h,005h,0d5h,057h,0aah	; 96b8  ...UU......@..W.
	defb 0abh,0aah,0afh,055h,057h,040h,017h,0aah,0abh,0a2h,02fh,055h,057h,048h,097h,0bfh	; 96c8  ...UW@..../UWH..
	defb 0fbh,0a2h,02fh,040h,007h,048h,097h,0aah,0abh,0a2h,02fh,055h,057h,040h,017h,0aah	; 96d8  ../@.H..../UW@..
	defb 0abh,0aah,0afh,055h,057h,055h,057h,0aah,0abh,0aah,0afh,015h,054h,055h,055h,02ah	; 96e8  ...UWUW.....TUU*
	defb 0aah,02ah,0aah,05fh,0f4h,055h,055h,0b0h,01ah,026h,066h,057h,0d4h,055h,055h,0b4h	; 96f8  .*._.UU..&fW.UU.
	defb 05ah,02ah,066h,055h,054h,005h,055h,0b5h,05ah,002h,066h,054h,055h,045h,055h,0b7h	; 9708  Z*fUT.U.Z.fTUEU.
	defb 0dah,0a2h,066h,050h,015h,045h,055h,0bfh,0fah,0a2h,066h,055h,055h,045h,055h,0aah	; 9718  ..fP.EU...fUUEU.
	defb 0aah,0a2h,0a6h,0ffh,0d5h,051h,055h,0ffh,08ah,0a8h,0aah,055h,045h,054h,055h,0aah	; 9728  .....QU....UETU.
	defb 0a2h,0aah,02ah,055h,051h,055h,015h,0aah,0a8h,0aah,08ah,055h,054h,055h,047h,0aah	; 9738  ..*UQU.....UTUG.
	defb 0aah,02ah,0afh,055h,055h,015h,055h,000h,000h,00ah,0aah,000h,000h,015h,055h,0aah	; 9748  .*.UU.U.......U.
	defb 0aah,0aah,0a0h,055h,055h,055h,05fh,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0ffh	; 9758  ...UUU_....UUUU.
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,055h,057h,055h,057h,0aah	; 9768  ...........UWUW.
	defb 0abh,0aah,0abh,041h,057h,055h,055h,09ch,003h,080h,000h,057h,0f7h,05fh,0fdh,09ch	; 9778  ...AWUU....W._..
	defb 003h,080h,000h,041h,057h,055h,055h,0aah,0bfh,0aah,0aah,055h,07fh,055h,055h,0aah	; 9788  ...AWUU....U.UU.
	defb 0eah,0aah,0aah,055h,0d5h,07fh,055h,0abh,0aah,0feh,02ah,057h,055h,0d5h,015h,0aeh	; 9798  ...U..U...*WU...
	defb 0abh,0aah,08ah,05dh,057h,055h,047h,0aeh,0aeh,0aah,0afh,05dh,05dh,055h,055h,0aeh	; 97a8  ...]WUG....]]UU.
	defb 0bah,0aah,0aah,05dh,05dh,055h,055h,0aeh,0bah,066h,066h,0fdh,05dh,055h,055h,0feh	; 97b8  ...]]UU..ff.]UU.
	defb 0bah,0aah,0aah,055h,05dh,055h,055h,0aah,0bah,0aah,000h,055h,05dh,054h,000h,002h	; 97c8  ...U]UU....U]T..
	defb 0aeh,000h,0aah,0fdh,054h,001h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0ffh	; 97d8  ....T.U....UUUU.
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h	; 97e8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,00ah,0aah,0aah,0aah,015h,055h,055h,055h,000h	; 97f8  ............UUU.
	defb 0aah,0aah,0a2h,015h,057h,0ffh,049h,004h,0afh,0feh,0aah,015h,05dh,054h,049h,004h	; 9808  ....W.I.....]TI.
	defb 0bah,0aah,02ah,011h,075h,054h,049h,00ah,0eah,0aah,022h,015h,0d5h,054h,055h,00bh	; 9818  ..*.uTI..."..TU.
	defb 0aah,0aah,02ah,017h,050h,001h,01fh,00eh,0a7h,0fah,0bfh,017h,054h,009h,055h,00eh	; 9828  ..*.P.......T.U.
	defb 0a5h,0eah,0aah,017h,055h,069h,055h,00eh,0a5h,0aah,0aah,017h,055h,069h,055h,00eh	; 9838  ....UiU.....UiU.
	defb 0a5h,0aah,0aah,017h,055h,0e9h	; 9848

; ----------------------------------------------------------------------
; DATOS graficos_tramados: Graficos tramados (1957 B; rachas cortas y muchos
;   valores, firma del damero)
;   0x984e..0x9ff3  (1957 bytes)
DATA_graficos_tramados:
	defb 050h,00bh,0a4h,00ah,0a0h,015h,0d7h,0f9h,045h,00ah,0e0h,002h,08ah,015h,0d5h,055h	; 984e  P.......E......U
	defb 015h,00ah,0eah,0aah,02ah,015h,0c0h,004h,055h,00ah,0efh,0e8h,0abh,015h,0c0h,004h	; 985e  ....*...U.......
	defb 057h,00ah,0eah,0a8h,0afh,000h,000h,000h,001h,000h,000h,000h,003h,000h,000h,000h	; 986e  W...............
	defb 007h,0aah,0aah,0aah,0afh,055h,055h,055h,057h,0aah,0aah,0aah,0afh,055h,07fh,0f5h	; 987e  .....UUUW....U..
	defb 057h,0aah,0ffh,0e2h,0afh,055h,0d5h,040h,007h,0abh,0aah,08bh,0f7h,057h,055h,010h	; 988e  W....U.@.....WU.
	defb 007h,0aeh,0aah,02ah,0afh,05dh,054h,055h,057h,0aeh,0a8h,0afh,0efh,0fdh,051h,05fh	; 989e  ...*.]TUW.....Q_
	defb 0d7h,0fah,0a2h,0bah,08fh,055h,045h,075h,017h,0aah,08ah,0eah,08fh,055h,015h,0d5h	; 98ae  .....UEu.....U..
	defb 017h,0aah,02bh,0aah,08fh,054h,057h,045h,017h,0a8h,0aeh,092h,08fh,001h,05dh,055h	; 98be  ..+..TWE......]U
	defb 017h,002h,0bah,092h,08fh,055h,074h,055h,017h,0aah,0e9h,012h,02fh,055h,0d5h,054h	; 98ce  .....UtU..../U.T
	defb 057h,0aah,0e9h,010h,0afh,055h,0d5h,054h,057h,02ah,0e9h,000h,0afh,015h,0d4h,054h	; 98de  W....U.TW*.....T
	defb 057h,00ah,0eah,0a8h,0afh,015h,0d5h,054h,057h,00ah,0eah,0a8h,0abh,015h,0d5h,054h	; 98ee  W......TW......T
	defb 055h,00ah,0eah,0a8h,0aah,015h,0d5h,054h,055h,00bh,0aah,0a8h,002h,017h,055h,054h	; 98fe  U......TU.....UT
	defb 005h,00eh,0aah,0aah,0a2h,017h,000h,000h,045h,00eh,0bfh,0feh,0a2h,017h,000h,000h	; 990e  ........E.......
	defb 045h,00eh,0aah,0aah,0a2h,017h,055h,055h,045h,00eh,0aah,0aah,0a2h,017h,000h,040h	; 991e  E.....UUE......@
	defb 007h,00eh,0beh,0afh,0afh,017h,000h,040h,015h,00eh,0aah,0aah,0aah,017h,055h,055h	; 992e  .......@......UU
	defb 055h,00eh,0a8h,002h,0aah,017h,054h,007h,055h,00bh,0a8h,0feh,0aah,015h,0d5h,0ffh	; 993e  U.....T.U.......
	defb 055h,00ah,0eah,0aah,080h,015h,075h,055h,000h,00ah,0bah,0aah,02ah,015h,05ch,000h	; 994e  U.....uU....*.\.
	defb 055h,00ah,0a8h,000h,0aah,015h,055h,055h,055h,03fh,0ffh,0ffh,0ffh,07fh,0ffh,0ffh	; 995e  U.....UUU?......
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,015h,0d5h,054h,057h,02ah,0eah,0a8h,0afh,055h,0d5h,054h	; 996e  .......TW*...U.T
	defb 077h,0aah,0eah,0e8h,08fh,055h,0d5h,0b4h,057h,0aah,0eah,0e8h,0afh,055h,075h,054h	; 997e  w....U..W....UuT
	defb 077h,0a0h,0bah,0a8h,08fh,044h,05dh,054h,057h,0aeh,0aeh,0a8h,0afh,044h,057h,054h	; 998e  w....D]TW....DWT
	defb 077h,0a0h,0abh,0a8h,08fh,055h,055h,0d4h,057h,0aah,0aah,0e8h,0afh,0ffh,0ffh,0f4h	; 999e  w....UU.W.......
	defb 077h,0ffh,0ffh,0f8h,08fh,055h,055h,054h,057h,0aah,0aah,0aah,02fh,05fh,0ffh,0f5h	; 99ae  w....UUTW.../_..
	defb 017h,0a0h,000h,00ah,02fh,05fh,0ffh,0f5h,017h,0aah,0aah,0aah,02fh,055h,055h,054h	; 99be  ..../_....../UUT
	defb 057h,000h,000h,000h,0afh,000h,000h,001h,057h,0aah,0aah,0aah,0afh,055h,055h,055h	; 99ce  W.......W....UUU
	defb 057h,0aah,0aah,0aah,0afh,055h,055h,055h,057h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 99de  W....UUUW.......
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,015h,0d5h,054h,057h,00ah,0eah,0a8h,0abh,015h,0d5h,054h	; 99ee  .......TW......T
	defb 055h,00ah,0eah,0a8h,0aah,015h,0d5h,054h,055h,00ah,0eah,0aah,02ah,015h,0d5h,055h	; 99fe  U......TU...*..U
	defb 015h,00ah,0eah,0aah,08ah,015h,075h,055h,045h,00ah,0bah,0aah,0a2h,015h,05dh,055h	; 9a0e  ......uUE.....]U
	defb 045h,00ah,0aeh,0aah,0a2h,015h,057h,055h,045h,000h,00bh,0aah,08ah,015h,047h,055h	; 9a1e  E.....WUE.....GU
	defb 01fh,002h,0abh,0aah,0bfh,015h,0c7h,055h,055h,003h,0abh,0aah,0aah,015h,0c7h,055h	; 9a2e  .......UU......U
	defb 055h,003h,0abh,0a0h,0aah,015h,047h,040h,055h,002h,0abh,08ah,0eah,010h,007h,045h	; 9a3e  U.....G@U......E
	defb 075h,00ah,0abh,08ah,0b8h,015h,057h,045h,050h,00ah,0ffh,080h,0aah,015h,0ffh,040h	; 9a4e  u.....WEP......@
	defb 055h,00ah,0eah,0a8h,0aah,015h,0d5h,054h,055h,00ah,0eah,0a8h,0abh,015h,0d5h,054h	; 9a5e  U......TU......T
	defb 057h,00ah,0eah,0a8h,0afh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9a6e  W...............
	defb 000h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0a8h,0aah,0aah,07fh,0d2h,055h	; 9a7e  .....UUUU......U
	defb 055h,0bfh,0a7h,02ah,02ah,075h,00dh,097h,015h,0bah,027h,02eh,08ah,075h,012h,05dh	; 9a8e  U..**u....'..u.]
	defb 015h,0bah,028h,0bah,02ah,075h,015h,074h,055h,0bah,02ah,0e8h,0aah,0f5h,015h,0d1h	; 9a9e  ..(.*u.tU.*.....
	defb 07fh,0fah,02bh,0a2h,0bfh,055h,017h,045h,075h,0aah,02eh,08ah,0bah,054h,05dh,015h	; 9aae  ..+..U.Eu....T].
	defb 075h,0a8h,0bah,08ah,0bah,051h,075h,015h,075h,0a8h,0eah,08ah,0bah,051h,0d5h,015h	; 9abe  u....Qu.u....Q..
	defb 075h,000h,0eah,08ah,0a0h,001h,0d5h,015h,040h,0aah,0eah,08ah,0aah,055h,0d5h,000h	; 9ace  u.......@....U..
	defb 055h,0aah,0eah,080h,0aah,055h,0d5h,054h,055h,02ah,0eah,0a8h,0abh,015h,0d5h,054h	; 9ade  U....U.TU*.....T
	defb 057h,00ah,0eah,0a8h,0afh,015h,0d5h,054h,057h,02ah,0eah,0a8h,0afh,055h,0ffh,07eh	; 9aee  W......TW*...U.~
	defb 057h,0aah,080h,080h,0afh,07dh,0d5h,054h,057h,0aah,0eah,0a8h,0afh,07dh,0d5h,054h	; 9afe  W....}.TW....}.T
	defb 057h,0aah,0eah,0a8h,0afh,07dh,0d5h,051h,057h,0aah,0eah,0a2h,0afh,07dh,075h,045h	; 9b0e  W....}.QW....}uE
	defb 007h,0aah,0bah,08ah,02fh,055h,05dh,045h,067h,0aah,0aeh,08ah,02fh,0ffh,057h,045h	; 9b1e  ..../U]Eg.../.WE
	defb 067h,0feh,0fbh,089h,02fh,054h,0d3h,045h,067h,0a8h,0abh,089h,02fh,054h,0d3h,045h	; 9b2e  g.../T.Eg.../T.E
	defb 067h,0a8h,0abh,089h,02fh,054h,003h,045h,067h,0a8h,0abh,08ah,02fh,054h,057h,045h	; 9b3e  g.../T.Eg.../TWE
	defb 067h,000h,0aeh,08ah,02fh,000h,05dh,045h,007h,0aah,0bah,0a2h,0afh,055h,075h,051h	; 9b4e  g.../.]E.....UuQ
	defb 057h,0aah,0eah,0a8h,0afh,055h,0d5h,054h,057h,02ah,0eah,0a8h,0afh,015h,0d5h,054h	; 9b5e  W....U.TW*.....T
	defb 057h,00ah,0eah,0a8h,0afh,015h,0d5h,054h,057h,02ah,0eah,000h,0abh,051h,0d4h,0f4h	; 9b6e  W......TW*...Q..
	defb 055h,0aeh,0eah,090h,0aah,055h,0d4h,0f4h,0fdh,0aah,0eah,000h,0a8h,011h,0c1h,054h	; 9b7e  U....U.........T
	defb 0c5h,0eeh,082h,0a8h,080h,055h,057h,054h,0c5h,0aah,0abh,0a8h,080h,011h,011h,0d4h	; 9b8e  .....UWT........
	defb 0c5h,0eeh,0eeh,0e8h,0a8h,055h,055h,0d4h,001h,0aah,0aah,0e8h,0aah,0ffh,0d5h,0d5h	; 9b9e  .....UU.........
	defb 0ffh,0ffh,08ah,0ebh,0ffh,040h,045h,0d5h,055h,0aah,0e2h,0eah,0aah,055h,071h,075h	; 9bae  .....@E.U....Uqu
	defb 055h,0aah,0b8h,0bah,0aah,055h,059h,05dh,055h,0aah,0a8h,0aeh,0aah,07fh,059h,057h	; 9bbe  U....UY]U.....YW
	defb 055h,000h,028h,0abh,080h,001h,019h,055h,000h,0abh,0b8h,0aah,0aah,055h,001h,055h	; 9bce  U.(....U.....U.U
	defb 055h,0aah,000h,0aah,0aah,055h,055h,055h,055h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9bde  U....UUUU.......
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,038h,000h,000h,000h,038h,000h,000h,000h,038h,000h,000h	; 9bee  .....8...8...8..
	defb 001h,038h,000h,000h,001h,038h,000h,000h,001h,038h,000h,040h,001h,038h,000h,040h	; 9bfe  .8...8...8.@.8.@
	defb 001h,038h,000h,0e0h,001h,038h,000h,0e0h,001h,038h,001h,0f0h,001h,038h,001h,0f0h	; 9c0e  .8...8...8...8..
	defb 001h,038h,003h,0f8h,001h,038h,003h,0f8h,001h,038h,007h,0fch,001h,038h,000h,0e0h	; 9c1e  .8...8...8...8..
	defb 000h,038h,000h,0e0h,000h,038h,000h,0e0h,000h,038h,000h,0e0h,000h,038h,000h,0e0h	; 9c2e  .8...8...8...8..
	defb 001h,038h,000h,0e0h,001h,038h,000h,0e0h,001h,038h,000h,0e0h,001h,038h,000h,0e0h	; 9c3e  .8...8...8...8..
	defb 001h,038h,000h,0e0h,001h,038h,000h,0e0h,001h,038h,000h,0e0h,001h,038h,000h,000h	; 9c4e  .8...8...8...8..
	defb 001h,038h,000h,000h,001h,038h,000h,000h,001h,038h,000h,000h,001h,038h,000h,000h	; 9c5e  .8...8...8...8..
	defb 000h,038h,000h,000h,000h,000h,000h,000h,01ch,000h,000h,000h,01ch,080h,000h,000h	; 9c6e  .8..............
	defb 01ch,080h,000h,000h,01ch,080h,000h,000h,01ch,080h,002h,000h,01ch,080h,002h,000h	; 9c7e  ................
	defb 01ch,080h,007h,000h,01ch,080h,007h,000h,01ch,080h,00fh,080h,01ch,080h,00fh,080h	; 9c8e  ................
	defb 01ch,080h,01fh,0c0h,01ch,080h,01fh,0c0h,01ch,080h,03fh,0e0h,01ch,000h,007h,000h	; 9c9e  ..........?.....
	defb 01ch,000h,007h,000h,01ch,000h,007h,000h,01ch,000h,007h,000h,01ch,080h,007h,000h	; 9cae  ................
	defb 01ch,080h,007h,000h,01ch,080h,007h,000h,01ch,080h,007h,000h,01ch,080h,007h,000h	; 9cbe  ................
	defb 01ch,080h,007h,000h,01ch,080h,007h,000h,01ch,080h,007h,000h,01ch,080h,000h,000h	; 9cce  ................
	defb 01ch,080h,000h,000h,01ch,080h,000h,000h,01ch,080h,000h,000h,01ch,000h,000h,000h	; 9cde  ................
	defb 01ch,000h,000h,000h,01ch,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h	; 9cee  .....UUUU....UUU
	defb 055h,0bfh,0ffh,0ffh,0fah,050h,000h,000h,00dh,017h,0ffh,0ffh,0e8h,0f4h,0f5h,05fh	; 9cfe  U....P........._
	defb 02fh,0b4h,0e0h,00fh,02ah,057h,0c0h,017h,0edh,0b7h,08ah,0bbh,0eah,057h,015h,05dh	; 9d0e  /...*W.......W.]
	defb 0edh,016h,02fh,0eeh,0e8h,0f4h,054h,057h,06fh,0b6h,038h,03bh,0eah,054h,050h,017h	; 9d1e  ../...TWo.8;.TP.
	defb 06dh,0b6h,030h,01bh,0eah,054h,050h,017h,06dh,016h,038h,03bh,0e8h,0f4h,054h,057h	; 9d2e  m.0..TP.m.8;..TW
	defb 06fh,0b6h,02fh,0eeh,0eah,057h,015h,05dh,0edh,0b7h,08ah,0bbh,0eah,057h,0c7h,0f7h	; 9d3e  o./..W.].....W..
	defb 0edh,014h,0efh,0efh,028h,0f4h,0f5h,05fh,02fh,0b7h,0ffh,0ffh,0eah,050h,000h,000h	; 9d4e  ....(.._/....P..
	defb 00dh,0bfh,0ffh,0ffh,0fah,055h,055h,055h,055h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9d5e  .....UUUU.......
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9d6e  ................
	defb 000h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,05fh,055h	; 9d7e  .....UUUU....U_U
	defb 055h,0aah,0beh,0aah,0aah,055h,074h,07fh,0f5h,0aah,0e8h,0bfh,0e2h,055h,0d4h,075h	; 9d8e  U....Ut......U.u
	defb 045h,0abh,0a8h,0bah,0a2h,057h,05ch,075h,045h,0aeh,0a0h,0bbh,0a2h,0fdh,054h,076h	; 9d9e  E....W\uE.....Tv
	defb 0c7h,0fah,0a8h,0bbh,0afh,055h,05ch,075h,055h,0aah,0a0h,0b9h,02ah,040h,014h,075h	; 9dae  .....U\uU...*@.u
	defb 055h,0afh,0a8h,0b9h,02ah,040h,01ch,075h,055h,0aah,0a0h,0b9h,02ah,055h,054h,075h	; 9dbe  U...*@.uU...*UTu
	defb 055h,000h,0a8h,0b9h,020h,000h,05ch,075h,040h,0aah,020h,0b9h,022h,055h,014h,071h	; 9dce  U... .\u@. ."U.q
	defb 005h,0aah,080h,0a0h,002h,055h,040h,055h,055h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 9dde  .....U@UU.......
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,015h,0d5h,054h,057h,00bh,0aah,0aah,02fh,017h,055h,055h	; 9dee  .......TW.../.UU
	defb 017h,00eh,080h,002h,08fh,017h,040h,005h,017h,00eh,08ch,0ceh,08fh,017h,043h,03dh	; 9dfe  ......@.......C=
	defb 017h,00eh,08ch,0ceh,08fh,017h,043h,03dh,017h,00eh,08ch,0ceh,08fh,017h,05fh,0fdh	; 9e0e  ......C=......_.
	defb 017h,00eh,0bdh,0deh,08fh,017h,055h,055h,017h,00bh,0a8h,08ah,02fh,015h,0d5h,054h	; 9e1e  ......UU..../..T
	defb 057h,00ah,0eah,0a8h,0afh,015h,075h,051h,057h,00ah,0bah,0a2h,0afh,015h,05dh,045h	; 9e2e  W.....uQW.....]E
	defb 057h,00ah,0aeh,08ah,0afh,015h,057h,015h,057h,000h,006h,09fh,0ffh,017h,0f7h,010h	; 9e3e  W.....W.W.......
	defb 017h,000h,006h,09fh,0ffh,015h,057h,015h,057h,00ah,0aeh,08ah,0afh,015h,05dh,045h	; 9e4e  ......W.W.....]E
	defb 057h,00ah,0bah,0a2h,0afh,015h,075h,051h,057h,00ah,0eah,0a8h,0afh,015h,0d5h,054h	; 9e5e  W.....uQW......T
	defb 057h,00ah,0eah,0a8h,0afh,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h	; 9e6e  W....UUUU....UUU
	defb 055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h	; 9e7e  U....UUUU....UUU
	defb 055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h	; 9e8e  U....UUUU....UUU
	defb 055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h	; 9e9e  U....UUUU....UUU
	defb 055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h	; 9eae  U....UUUU....UUU
	defb 055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h	; 9ebe  U....UUUU....UUU
	defb 055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h	; 9ece  U....UUUU....UUU
	defb 055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h	; 9ede  U....UUUU....UUU
	defb 055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h	; 9eee  U....UUUU....UUU
	defb 055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h	; 9efe  U....UUUU....UUU
	defb 055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h	; 9f0e  U....UUUU....UUU
	defb 055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h	; 9f1e  U....UUUU....UUU
	defb 055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h	; 9f2e  U....UUUU....UUU
	defb 055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h	; 9f3e  U....UUUU....UUU
	defb 055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h	; 9f4e  U....UUUU....UUU
	defb 055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h	; 9f5e  U....UUUU....UUU
	defb 055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h	; 9f6e  U....UUUU....UUU
	defb 055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h	; 9f7e  U....UUUU....UUU
	defb 055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h	; 9f8e  U....UUUU....UUU
	defb 055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h	; 9f9e  U....UUUU....UUU
	defb 055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h	; 9fae  U....UUUU....UUU
	defb 055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h	; 9fbe  U....UUUU....UUU
	defb 055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h	; 9fce  U....UUUU....UUU
	defb 055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h	; 9fde  U....UUUU....UUU
	defb 055h,0aah,0aah,0aah,0aah	; 9fee

; ----------------------------------------------------------------------
; DATOS partida_grabada_de_la_demo: La partida grabada de la DEMO de la fase a
;   pie (646 B)
;   0x9ff3..0xa279  (646 bytes)
DATA_partida_grabada_de_la_demo:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9ff3  ................
	defb 000h,000h,000h,000h,000h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h	; a003  ................
	defb 000h,000h,000h,010h,000h,000h,000h,000h,000h,000h,000h,000h,000h,012h,012h,002h	; a013  ................
	defb 012h,012h,002h,006h,006h,006h,006h,006h,006h,006h,006h,006h,006h,006h,006h,006h	; a023  ................
	defb 004h,004h,004h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,008h	; a033  ................
	defb 008h,008h,008h,008h,008h,008h,008h,008h,008h,008h,008h,008h,008h,008h,008h,008h	; a043  ................
	defb 008h,008h,008h,008h,008h,008h,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah	; a053  ................
	defb 00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah	; a063  ................
	defb 00ah,00ah,00ah,00ah,00ah,00ah,00ah,002h,002h,002h,002h,016h,006h,016h,006h,01ah	; a073  ................
	defb 01ah,00ah,01ah,012h,006h,016h,006h,01ah,00ah,01ah,012h,012h,002h,014h,004h,014h	; a083  ................
	defb 004h,010h,000h,010h,008h,01ah,00ah,01ah,00ah,012h,002h,012h,006h,016h,014h,014h	; a093  ................
	defb 014h,004h,010h,010h,010h,010h,000h,010h,010h,010h,010h,010h,000h,006h,006h,006h	; a0a3  ................
	defb 006h,006h,006h,006h,006h,002h,002h,002h,00ah,00ah,002h,006h,015h,015h,00dh,018h	; a0b3  ................
	defb 018h,000h,010h,01ah,002h,002h,002h,012h,002h,016h,006h,01ah,00ah,01ah,002h,016h	; a0c3  ................
	defb 006h,016h,006h,006h,016h,01ah,01ah,012h,006h,016h,014h,014h,004h,014h,014h,014h	; a0d3  ................
	defb 014h,006h,006h,006h,016h,006h,01ah,00ah,016h,006h,016h,00eh,00ah,01ah,006h,016h	; a0e3  ................
	defb 006h,012h,00ah,01ah,006h,016h,006h,01ah,01ah,002h,006h,006h,01eh,00ah,01ah,00ah	; a0f3  ................
	defb 016h,006h,01ah,00ah,01ah,006h,016h,00eh,01ah,00ah,016h,006h,006h,01ah,016h,016h	; a103  ................
	defb 016h,016h,016h,00ah,002h,002h,006h,002h,002h,002h,002h,002h,002h,002h,002h,002h	; a113  ................
	defb 002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h	; a123  ................
	defb 002h,006h,016h,006h,004h,014h,000h,000h,000h,000h,000h,000h,002h,002h,002h,000h	; a133  ................
	defb 000h,000h,004h,004h,004h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a143  ................
	defb 000h,000h,000h,002h,002h,002h,006h,006h,006h,002h,002h,002h,002h,002h,002h,002h	; a153  ................
	defb 002h,002h,00ah,00ah,00ah,002h,002h,002h,002h,002h,002h,002h,002h,000h,000h,000h	; a163  ................
	defb 000h,000h,000h,002h,002h,002h,002h,002h,002h,002h,000h,000h,000h,000h,010h,000h	; a173  ................
	defb 000h,002h,002h,002h,002h,002h,000h,000h,000h,000h,000h,000h,000h,000h,008h,000h	; a183  ................
	defb 000h,000h,010h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a193  ................
	defb 000h,000h,000h,004h,004h,004h,004h,004h,004h,004h,002h,002h,002h,002h,002h,002h	; a1a3  ................
	defb 006h,004h,004h,000h,000h,000h,000h,002h,000h,000h,010h,000h,000h,010h,000h,012h	; a1b3  ................
	defb 000h,010h,000h,010h,000h,018h,008h,000h,010h,000h,010h,000h,000h,000h,000h,000h	; a1c3  ................
	defb 000h,000h,000h,000h,008h,008h,000h,000h,000h,000h,000h,000h,002h,002h,00ah,00ah	; a1d3  ................
	defb 00ah,002h,002h,002h,002h,002h,00ah,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a1e3  ................
	defb 000h,000h,008h,008h,000h,008h,008h,00ah,00ah,000h,000h,000h,000h,000h,000h,000h	; a1f3  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a203  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a213  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a223  ................
	defb 000h,000h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h,001h	; a233  ................
	defb 001h,001h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a243  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,002h,002h,000h	; a253  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a263  ................
	defb 000h,000h,000h,000h,000h,010h	; a273

; ======================================================================
; CODIGO 0xa279..0xa5f0  (887 bytes)
; ======================================================================


arranque_apie:		; Todo el armazon de la fase (0xA279-0xA538): pone la pila, enciende la pantalla con R1=0xE2 heredando el SCREEN 2 que dejo la fase de naves, engancha `ret` en H.KEYI y `jp 0xC46E` en H.TIMI, recoge los records y el marcador que el otro programa dejo en 0xD6D8, monta el titulo, arranca la partida y se queda en el bucle de juego. Entra por el `jp 0a279h` de 0xF7B5, ya en el bloque de naves
	di			;a279
	ld sp,05b32h		;a27a   ; SP en 0x5B32, la misma pila que monta el bloque de naves en 0xBD85. De aqui a 0xA29C es su mismo arranque reescrito, instruccion por instruccion
	in a,(099h)		;a27d   ; Lee el registro de estado del VDP: el valor no se usa, pero la lectura deja el puerto 0x99 esperando el primer byte de un par
	and a			;a27f   ; Relleno de espera entre los dos bytes del par; el bloque de naves usa aqui un `ld hl,0` para lo mismo
	ld a,0e2h		;a280   ; Primer byte del par: el DATO, 0xE2
	out (099h),a		;a282
	ld a,081h		;a284   ; Segundo byte: 0x80+1, o sea "escribe en el registro 1". R1 = 0xE2 deja la PANTALLA ENCENDIDA, las interrupciones del VDP encendidas y los sprites en 16x16. La fase de naves escribe 0x82 en este mismo sitio -pantalla APAGADA- porque va a montar el SCREEN 2 de cero; aqui el modo ya viene puesto de la carga anterior y no hay nada que ocultar
	and a			;a286   ; Dos `and a` seguidos, mas espera entre outs
	and a			;a287
	out (099h),a		;a288
	ld a,0c9h		;a28a   ; 0xC9 es el opcode de `ret`...
	ld (0fd9ah),a		;a28c   ; ...y va a H.KEYI (0xFD9A): el gancho de teclado queda desactivado
	ld a,0c3h		;a28f   ; 0xC3 es el de `jp`...
	ld (0fd9fh),a		;a291   ; ...y va a H.TIMI (0xFD9F): el gancho de reloj pasa a ser un salto
	ld hl,0c46eh		;a294   ; El destino del salto, la interrupcion de 0xC46E, en los dos bytes de detras (0xFDA0)
	ld (0fda0h),hl		;a297
	ld a,r		;a29a   ; El registro R como semilla, una lectura por byte: identico al 0xBDB9 de la fase de naves
	ld l,a			;a29c
	ld a,r		;a29d
	ld h,a			;a29f
	ld (0ad28h),hl		;a2a0   ; La semilla es un PUNTERO: azar (0xAC06) la pasea por la ROM del BIOS
	xor a			;a2a3
	ld (0b87ch),a		;a2a4   ; 0xB87C = 0: el mando arranca en TECLADO, y es el mismo byte que rotula_menu mira para poner la marca de seleccion
	ld hl,0d6d8h		;a2a7   ; Los records que la fase de naves puso a salvo en 0xD6D8 antes de volver a la cinta: ocho fichas de 15 B = 120 = 0x78 clavado. 0xD6D8 esta por encima de 0xD674, o sea fuera de lo que esta segunda carga machaca
	ld de,0b8c8h		;a2aa
	ld bc,00078h		;a2ad
	ldir		;a2b0
	ld de,06557h		;a2b2   ; La entrada 0 del pool de sprites (0x6555) y su byte +2. El formato es de 4 B por linea -mascara izda, mascara dcha, dibujo izdo, dibujo dcho-, asi que con paso 4 se lee el DIBUJO de las 16 lineas y la mascara se deja atras: aqui no hay fondo que respetar
	ld hl,00748h		;a2b5   ; VRAM 0x0748: tercio 0, columna 29, fila de pixel 8. La geometria de esta pantalla es tercio*0x800 + columna*0x40 + fila, o sea por COLUMNAS
	ld c,002h		;a2b8   ; Dos vueltas: la mitad izquierda del sprite de 16x16 y la derecha
L_A2BA:
	ld b,010h		;a2ba   ; 16 bytes seguidos, que en esta geometria son las 16 lineas de pixel de dos caracteres apilados de la misma columna
	call vram_pon_dir		;a2bc
	push de			;a2bf
L_A2C0:
	ld a,(de)			;a2c0   ; Byte a byte por el puerto 0x98 sin volver a fijar la direccion: el VDP autoincrementa
	out (098h),a		;a2c1
	inc de			;a2c3   ; Paso 4, que es lo que ocupa una linea del sprite
	inc de			;a2c4
	inc de			;a2c5
	inc de			;a2c6
	djnz L_A2C0		;a2c7
	pop de			;a2c9
	inc de			;a2ca   ; La segunda vuelta arranca en 0x6558, el dibujo de la mitad DERECHA...
	ld hl,00788h		;a2cb   ; ...y va a la columna 30, pegada a la anterior. Entre las dos dejan el monigote del HUD arriba a la derecha, con el contador de vidas justo debajo (0x07A0)
	dec c			;a2ce
	jr nz,L_A2BA		;a2cf
	ei			;a2d1   ; Con H.TIMI ya apuntando a 0xC46E, aqui empieza a latir el juego
L_A2D2:
	call entra_en_records		;a2d2   ; La puerta de TODO game over y tambien del arranque en frio: se mira si el marcador entra en la tabla y, entre o no entre, se cae al titulo de aqui abajo
L_A2D5:
	ld hl,06858h		;a2d5   ; El jugador al centro: 0x6858 es X = 0x58 y la fila 0x68, que es donde paso_jugador lo clava siempre
	ld (0a6ebh),hl		;a2d8
	ld sp,05b32h		;a2db   ; La pila otra vez, porque a este punto se entra con `jp` desde dentro de llamadas (0xA3B1, 0xA4DB)
	ld hl,04000h		;a2de   ; 0xC463 es la base del menu dentro del buffer, y suma_scroll (0xBB18) le suma el offset de cada rotulo: mover este puntero es lo que hace deslizarse el menu entero
	ld (0c463h),hl		;a2e1
	xor a			;a2e4   ; Las cinco tablas a cero: 0xAD0E animacion del jugador, 0xACF8 voladores, 0xACE3 andantes, 0xACA2 tiros enemigos y 0xAD03 tiros de torreta
	ld (0ad0eh),a		;a2e5
	ld (0acf8h),a		;a2e8
	ld (0ace3h),a		;a2eb
	ld (0aca2h),a		;a2ee
	ld (0ad03h),a		;a2f1
	inc a			;a2f4   ; 0xC45C = 1: mientras dure el titulo lee_mando ignora el joystick y pregunta siempre al teclado. Es el gemelo del 0xE151 de la fase de naves
	ld (0c45ch),a		;a2f5
	ld a,040h		;a2f8   ; 0xC465 = 0x40, la altura del cursor del menu. 0x40 cae en la banda de JUGAR, que asi es la opcion por defecto
	ld (0c465h),a		;a2fa
	ld hl,02f78h		;a2fd   ; 0x2F78 cae en la tabla de COLORES: tercio 1, columna 29, la del HUD lateral. Se pinta de 0x11, negro sobre negro
	call pinta_marca_hud		;a300
	ld a,0f1h		;a303   ; 0xF1 -tinta blanca sobre fondo negro- en las tres bandas de la tabla de colores
	call rellena_colores		;a305
	call repinta_escudo		;a308
	ld a,003h		;a30b   ; Tres vidas en el titulo; al empezar la partida de verdad 0xA3CB las baja a dos
	ld (0c45fh),a		;a30d
	call hud_vidas		;a310
	ld hl,0a6fch		;a313   ; El operando del `call` de 0xA688 apuntando a lee_mando: es lo que deshace el 0xA6EE que deja ahi la demo
	ld (0a689h),hl		;a316
	ld a,r		;a319   ; Segunda tirada de semilla, esta ya con las interrupciones abiertas: R ha corrido y el valor no es el de 0xA29A
	ld l,a			;a31b
	ld a,r		;a31c
	ld h,a			;a31e
	ld (0ad28h),hl		;a31f
	call borra_torre		;a322   ; Borra la torre de la cuenta atras, que en el titulo no se ve
L_A325:
	ld a,0a0h		;a325   ; 0xAD27 = 0xA0: 160 vueltas de titulo sin elegir nada y entra la pantalla de records. Cada vez que se toca el mando se rearma aqui
	ld (0ad27h),a		;a327
L_A32A:
	call borra_buffer		;a32a   ; El titulo se redibuja entero cada vuelta sobre el buffer limpio
	ld a,001h		;a32d   ; Fila 1 del mapa: el fondo del titulo es el propio decorado de la fase
	ld (0ad2ah),a		;a32f
	call pinta_estrellas		;a332
	call juega_en_firme		;a335   ; El mismo turno de jugador que en partida: el cursor del menu es el protagonista andando, y lo que mueve el menu es el scroll de camara que esa llamada deja en 0xC462
	call rotula_menu		;a338   ; Los cinco rotulos encadenados desde 0xB886 -STARDUST, REDEFINIR TECLAS, JUGAR, JOYSTICK, TECLADO-, colgados de 0xC463
	ld a,(0c462h)		;a33b   ; 0xC462 es el delta del scroll de este cuadro: +2 si la camara subio, 0xFE si bajo, 0 si no se movio. Lo ponen los rotadores 0xB140/0xB167
	and a			;a33e
	jr z,L_A36F		;a33f
	cp 002h		;a341   ; Solo hay dos valores posibles: +2 va a L_A354 y cualquier otro es el -2
	ld hl,(0c463h)		;a343
	ld de,00030h		;a346   ; 0x30 = 48 bytes = dos filas del buffer, que son 24 B cada una: los 2 px de scroll
	jr z,L_A354		;a349
	sbc hl,de		;a34b   ; Menu hacia un lado...
	ld a,h			;a34d
	cp 039h		;a34e   ; ...con tope en 0x39xx, que se alcanza tras 33 pasos y con 0xC465 ya en 0x00, justo la opcion TECLADO. Ahi se planta
	jr nz,L_A362		;a350
	jr L_A36F		;a352
L_A354:
	add hl,de			;a354   ; Menu hacia el otro...
	ld a,h			;a355
	cp 067h		;a356   ; ...y este 0x67 no se alcanza nunca partiendo de 0x4000: el tope de 0x43 salta antes. Codigo defensivo, o resto del original
	jr nz,L_A35E		;a358
	ld h,040h		;a35a
	jr L_A362		;a35c
L_A35E:
	cp 043h		;a35e   ; El tope de arriba: 0x4300 son 16 pasos y deja 0xC465 en 0x5E, dentro de la banda de REDEFINIR TECLAS
	jr z,L_A36F		;a360
L_A362:
	ld (0c463h),hl		;a362   ; Y la altura del cursor sigue al puntero: a 0xC465 se le suma el mismo delta, que es lo que se mide luego para saber que opcion hay debajo
	ld hl,0c462h		;a365
	ld a,(0c465h)		;a368
	add a,(hl)			;a36b
	ld (0c465h),a		;a36c
L_A36F:
	call vuelca_pantalla		;a36f   ; El buffer a la VRAM, en las tres bandas
	ld a,(0ad27h)		;a372   ; El reloj de paciencia del titulo...
	dec a			;a375
	jp z,L_B68C		;a376   ; ...agotado, a la pantalla de records y de ahi a la demo
	ld (0ad27h),a		;a379
	ld a,(0c45bh)		;a37c   ; 0xC45B es el byte de controles que juega_en_firme acaba de guardar en 0xA68B
	and a			;a37f
	jr z,L_A32A		;a380   ; Sin tocar nada, otra vuelta y el reloj sigue corriendo
	bit 4,a		;a382   ; El bit 4 es el disparo (el `bit 4,a` de dispara): moverse sin disparar solo rearma el reloj
	jp z,L_A325		;a384
	ld a,(0c465h)		;a387   ; Disparo pulsado: la banda en la que este el cursor decide la opcion
	cp 010h		;a38a   ; 0x10, y mas abajo 0x30 y 0x50, son las fronteras entre opciones: caer justo encima no elige nada
	jp z,L_A325		;a38c
	cp 0f8h		;a38f   ; Por encima de 0xF8 seria cursor pasado de rosca por abajo; con el tope de 0xA34E no ocurre, pero si ocurriera cae en TECLADO
	jr c,L_A39A		;a391
	xor a			;a393
	ld (0b87ch),a		;a394
	jp L_A325		;a397
L_A39A:
	cp 030h		;a39a   ; Por debajo de 0x30, JOYSTICK o TECLADO...
	jp z,L_A325		;a39c
	jr nc,L_A3A7		;a39f
	ld (0b87ch),a		;a3a1   ; ...y la altura se guarda TAL CUAL en 0xB87C, que solo se mira contra cero: el 0x00 del tope de abajo es TECLADO y cualquier otro valor es JOYSTICK
	jp L_A325		;a3a4
L_A3A7:
	cp 050h		;a3a7   ; Entre 0x30 y 0x50, JUGAR
	jp z,L_A325		;a3a9
	jr c,L_A3B4		;a3ac
	call redefine_teclas		;a3ae   ; Por encima de 0x50, REDEFINIR TECLAS; al volver se rehace el titulo entero
	jp L_A2D5		;a3b1
L_A3B4:
	ld hl,0b87fh		;a3b4   ; El marcador a "000000": un `ld (hl),030h` y un ldir solapado de cinco, seis digitos ASCII en 0xB87F-0xB884 con el 0 de cierre detras
	ld de,0b880h		;a3b7
	ld bc,00005h		;a3ba
	ld (hl),030h		;a3bd
	ldir		;a3bf
	ld ix,0b87fh		;a3c1
	ld de,012b0h		;a3c5   ; VRAM 0x12B0 = tercio 2, columna 10, fila de pixel 48: el marcador del HUD, que hud_imprime va estampando de 0x40 en 0x40, columna a columna
	call hud_imprime		;a3c8
	ld a,002h		;a3cb   ; DOS vidas de reserva, no las tres del titulo: la que se esta jugando no cuenta. El mismo detalle que el 0xBE96 de la fase de naves
	ld (0c45fh),a		;a3cd
	call hud_vidas		;a3d0
	call borra_buffer		;a3d3   ; Pantalla en negro antes de entrar
	call vuelca_pantalla		;a3d6
	call borra_torre		;a3d9
	ld hl,0d750h		;a3dc   ; El marcador que la fase de naves dejo en 0xD750: se sigue jugando con los puntos de las siete zonas
	ld de,0b87fh		;a3df
	ld bc,00007h		;a3e2
	ld a,(0a689h)		;a3e5   ; ...pero NO en la demo: si el `call` de 0xA688 apunta al lector de la grabacion (0xA6EE, byte bajo 0xEE), la demo empieza a cero
	cp 0eeh		;a3e8
	jr z,L_A3EE		;a3ea
	ldir		;a3ec
L_A3EE:
	ld ix,0b87fh		;a3ee   ; Repinta el marcador, ya con los puntos heredados
	ld de,012b0h		;a3f2
	call hud_imprime		;a3f5
	xor a			;a3f8   ; 0xC468 = 0 apaga las llamas de la nave del final, que es lo que pinta_nave mide
	ld (0bc34h),a		;a3f9
	ld (0c468h),a		;a3fc
	ld hl,09ff3h		;a3ff   ; El puntero de la demo al principio de su partida grabada, 0x9FF3
	ld (0c460h),hl		;a402
	ld a,047h		;a405   ; El checkpoint de salida: fila 0x47 del mapa -la de mas abajo de las 78- y scroll fino 2
	ld (0c466h),a		;a407
	ld a,002h		;a40a
	ld (0c467h),a		;a40c
	ld hl,06858h		;a40f   ; Y la ultima posicion pisada en firme, la misma 0x6858 del centro
	ld (0a6e9h),hl		;a412
	ld a,006h		;a415   ; Seis objetivos que derribar; hasta que 0xBC33 no llegue a cero la cuenta atras no corre
	ld (0bc33h),a		;a417
	ld b,a			;a41a
	ld ix,0bc24h		;a41b
L_A41F:
	ld a,b			;a41f   ; Una torreta por columna del mapa: (b-1)*32 + 12, o sea 12, 44, 76, 108, 140 y 172, los centros de las seis celdas de 32 px de ancho
	dec a			;a420
	add a,a			;a421
	add a,a			;a422
	add a,a			;a423
	add a,a			;a424
	add a,a			;a425
	add a,00ch		;a426
	ld (ix+000h),a		;a428
	call azar		;a42b   ; El segundo byte de cada ficha, al azar entre 0 y 15: es lo que reparte el turno de las seis para que no disparen todas a la vez
	and 00fh		;a42e
	ld (ix+001h),a		;a430
	inc ix		;a433   ; Dos bytes por ficha: la tabla de las seis torretas es la de 0xBC24, la misma que luego lee la cuenta atras
	inc ix		;a435
	djnz L_A41F		;a437
respawn:		; Devuelve al jugador a la ultima posicion pisada en firme (0xA6E9) con la camara del checkpoint 0xC466/67, escudo a 3, tablas de enemigos vaciadas y el update restaurado
	call repinta_escudo		;a439   ; Escudo a 3 y sus tres iconos repintados
	ld hl,turno_jugador_vivo		;a43c   ; Deshace el parche del cadaver: update_jugador vuelve a ser el turno normal
	ld (update_jugador+1),hl		;a43f
	xor a			;a442   ; 0xACBB los disparos del jugador y 0xAD0E su animacion
	ld (0acbbh),a		;a443
	ld (0ad0eh),a		;a446
	ld (0b87ah),a		;a449   ; 0xB87A -y mas abajo 0xB878, 0xB879 y 0xB87B- se ponen a cero y no los lee NADIE en todo el bloque: cuatro bytes muertos, justo detras de las siete entradas de teclas de 0xB86A
	ld (0c459h),a		;a44c   ; 0xC459, la mejora del disparo, se pierde al morir
	ld hl,(0a6e9h)		;a44f   ; Vuelta a la ultima posicion pisada en firme...
	ld (0a6ebh),hl		;a452
	ld a,(0c466h)		;a455   ; ...y la camara al checkpoint que juega_en_firme va apuntando en cada paso
	ld (0ad2ah),a		;a458
	ld a,(0c467h)		;a45b
	ld (0ad2ch),a		;a45e
	xor a			;a461   ; Las cuatro tablas de enemigos vaciadas: lo que hubiera en pantalla no reaparece
	ld (0ace3h),a		;a462
	ld (0acf8h),a		;a465
	ld (0ad03h),a		;a468
	ld (0aca2h),a		;a46b
	ld (0ad27h),a		;a46e
	ld (0b879h),a		;a471
	ld (0b87bh),a		;a474
	ld (0b878h),a		;a477
	ld (0c45ah),a		;a47a   ; 0xC45A es el estado anterior del gatillo y 0xC45C el "solo teclado" que dejo puesto el titulo
	ld (0c45ch),a		;a47d
	ld (0b720h),a		;a480   ; 0xB720 a cero levanta el freno de alta_enemigo_cuadro
	call sonido_reset		;a483
	call borra_globales_sonido		;a486
	call hud_vidas		;a489
	call azar		;a48c   ; Uno de los CUATRO colores de 0xC46A al azar: por esto la fase a pie no se ve siempre igual
	and 003h		;a48f
	ld l,a			;a491
	ld h,000h		;a492
	ld de,0c46ah		;a494
	add hl,de			;a497
	ld a,(hl)			;a498
	call rellena_colores		;a499
	ld a,001h		;a49c   ; 0xAD30 = 1, y no lo lee nadie: esta es la unica instruccion de todo el bloque que toca ese byte
	ld (0ad30h),a		;a49e
L_A4A1:
	ld hl,0ad27h		;a4a1   ; El contador de cuadros, que reparte turnos y marca el ritmo de la cuenta atras y del parpadeo del DEMO
	inc (hl)			;a4a4
	ld a,0c2h		;a4a5   ; Parche 0xC2 = `jp nz`: redibuja_fondo pinta SOLO las celdas vacias...
	ld (0a98eh),a		;a4a7
	call redibuja_fondo		;a4aa
	call mueve_voladores		;a4ad   ; ...y los voladores se estampan encima de ese fondo vacio
	ld a,0cah		;a4b0   ; Parche 0xCA = `jp z`: ahora SOLO las celdas solidas, que vuelven a taparlos. Los dos pases del fondo con el volador en medio son lo que da la profundidad
	ld (0a98eh),a		;a4b2
	call redibuja_fondo		;a4b5
	call mueve_disparos		;a4b8
	call dispara_torretas		;a4bb   ; Las seis torretas, que solo disparan con el scroll parado
	call mueve_enemigos		;a4be
	call tic_cuenta_atras		;a4c1   ; La cuenta atras, que solo corre con los seis objetivos ya muertos
	call mueve_tiros_torreta		;a4c4
	call voladores_activos		;a4c7
	call alta_enemigo_cuadro		;a4ca
	xor a			;a4cd   ; Consumido el delta del scroll, a cero para el cuadro siguiente
	ld (0c462h),a		;a4ce
	ld a,(0a689h)		;a4d1   ; 0xEE es el byte bajo de 0xA6EE, el lector de la grabacion: asi se sabe si esto es la demo
	cp 0eeh		;a4d4
	jr nz,L_A501		;a4d6
	call hay_tecla		;a4d8   ; En demo, cualquier tecla corta y devuelve al titulo
	jp nz,L_A2D5		;a4db
	ld a,(0ad27h)		;a4de   ; El bit 3 del contador de cuadros: el rotulo DEMO parpadea ocho cuadros si y ocho no
	and 008h		;a4e1
	jr z,L_A501		;a4e3
	ld a,0ffh		;a4e5   ; 0xFF en los dos operandos de los `and` de rotula_glifo (0xB4A9 y 0xB4AF) lo deja pintar SOLIDO...
	ld (0b4aah),a		;a4e7
	ld (0b4b0h),a		;a4ea
	ld ix,0b9abh		;a4ed   ; ...para el rotulo DEMO de 0xB9AB, en 0x4D94 del buffer: la misma posicion que en la fase de naves
	ld hl,04d94h		;a4f1
	call rotula_cadena		;a4f4
	ld a,055h		;a4f7   ; ...y se repone el damero 0x55/0xAA, que es como se rotula todo lo demas
	ld (0b4aah),a		;a4f9
	ld a,0aah		;a4fc
	ld (0b4b0h),a		;a4fe
L_A501:
	call update_jugador		;a501   ; El turno del jugador, por el `jp` parcheable: en pie, agonizando o derrumbandose
	call vuelca_pantalla		;a504
	ld ix,0b86ah		;a507   ; La septima entrada de la tabla de teclas de 0xB86A: ABANDONAR, mascara en +12 y fila de teclado en +13
	ld a,(ix+00dh)		;a50b
	out (0aah),a		;a50e
	in a,(0a9h)		;a510
	and (ix+00ch)		;a512   ; Las teclas dan 0 al pulsarse, o sea que Z = pulsada...
	jp z,L_A2D2		;a515   ; ...y ABANDONAR es game over inmediato, derecho a la tabla de records
	call pausa		;a518   ; PARAR se mira aparte, porque bloquea alli mismo
	ld a,(0a6edh)		;a51b   ; 0xA6ED por debajo de 0x2D es que el jugador sigue en pie o agonizando: otra vuelta del bucle
	cp 02dh		;a51e
	jr nc,L_A525		;a520
	jp L_A4A1		;a522
L_A525:
	ld a,(0c45fh)		;a525
	sub 001h		;a528   ; El embudo de las vidas: con 0xA6ED >= 0x2D resta una a 0xC45F; con acarreo game over, si no respawn
	ld (0c45fh),a		;a52a
	ld hl,turno_jugador_vivo		;a52d   ; Y el `jp` parcheable restaurado antes de cualquiera de las dos salidas
	ld (update_jugador+1),hl		;a530
	jp c,L_A2D2		;a533
	jp respawn		;a536
pausa:		; Si la tecla PARAR (la sexta de 0xB86A) esta pulsada, espera a que se suelten todas las teclas y luego a que se pulse cualquiera
	ld ix,0b86ah		;a539   ; La sexta entrada de 0xB86A, PARAR: mascara en +10 y fila de teclado en +11
	ld a,(ix+00bh)		;a53d
	out (0aah),a		;a540
	in a,(0a9h)		;a542
	and (ix+00ah)		;a544
	ret nz			;a547   ; No pulsada, se vuelve sin parar nada
L_A548:
	ld d,0f0h		;a548   ; Primero espera a que se suelte TODO: encontrar una sola tecla pulsada reinicia el barrido
	ld a,d			;a54a
L_A54B:
	out (0aah),a		;a54b   ; Las nueve primeras filas de la matriz, 0xF0 a 0xF8; el nibble alto a 1 deja quietos el motor del casete, el LED de CAPS y el click
	in a,(0a9h)		;a54d
	cpl			;a54f   ; El `cpl` pone a 1 las teclas pulsadas, y el `and a` mira si queda alguna
	and a			;a550
	jr nz,L_A548		;a551
	inc d			;a553
	ld a,d			;a554
	cp 0f9h		;a555
	jr nz,L_A54B		;a557
L_A559:
	ld d,0f0h		;a559   ; Y ahora al reves: hasta que no se pulse algo no se sigue
	ld a,d			;a55b
L_A55C:
	out (0aah),a		;a55c   ; En cuanto una fila no da 0xFF entero se sale; si las nueve estan limpias, otra ronda
	in a,(0a9h)		;a55e
	cpl			;a560
	and a			;a561
	ret nz			;a562
	inc d			;a563
	ld a,d			;a564
	cp 0f9h		;a565
	jr nz,L_A55C		;a567
	jr L_A559		;a569   ; Agotadas las nueve filas sin nada pulsado, vuelta a empezar: aqui se queda todo parado hasta que alguien toque una tecla
hud_vidas:		; Pasa las vidas de 0xC45F a ASCII con `add a,030h` y las estampa con hud_imprime en la tabla de patrones 0x07A0, la misma posicion que usa el indicador de vidas de la fase de naves
	ld a,(0c45fh)		;a56b   ; De 0 a 9 a su digito ASCII
	add a,030h		;a56e
	ld (0c45dh),a		;a570
	ld ix,0c45dh		;a573   ; VRAM 0x07A0 = tercio 0, columna 30, fila de pixel 32: justo debajo del monigote que dejo puesto el arranque en 0xA2B2
	ld de,007a0h		;a577
	jp hud_imprime		;a57a
update_jugador:		; El turno del jugador, y la unica llamada que se parchea en caliente: es un `jp` cuyo operando (0xA57E) apunta a 0xA580 en juego normal y a cadaver_parabola tras un impacto. Reparte segun 0xA6ED -1 a 3 vivo, 4 sentencia, 5 a 0x2D agonia- y de 7 a 0x1E pinta los doce fotogramas del derrumbe (0x50 a 0x5B, dos cuadros cada uno)
	jp turno_jugador_vivo		;a57d   ; El operando de este `jp` esta en 0xA57E, y es lo unico que se parchea en caliente en toda la fase
turno_jugador_vivo:		; El destino normal del `jp` parcheable de 0xA57D: el turno del jugador cuando no le han dado
	ld hl,(0a6ebh)		;a580   ; Este `ld hl` no sirve de nada: dos instrucciones mas alla, 0xA586 vuelve a cargar la misma posicion. Lo util del `jp` de arriba empieza en la linea siguiente
reparte_estado_jugador:		; El semaforo de 0xA6ED: por debajo de 4 se juega, 4 es la sentencia de caida y de 5 en adelante corre la agonia -dos cuadros deslizandose, doce dibujos de derrumbe a dos cuadros cada uno y catorce de espera hasta el 0x2D que le cuesta la vida-
	ld a,(0a6edh)		;a583   ; 0xA6ED hace de semaforo: 1 a 3 es el escudo mientras se vive, 4 la sentencia de muerte y de 5 en adelante la cuenta de la agonia
	ld hl,(0a6ebh)		;a586   ; HL, la posicion: L es la X y H la fila, clavada siempre en 0x68
	cp 004h		;a589
	jp c,L_A665		;a58b   ; Por debajo de 4 el jugador esta en pie: a mirar el suelo que pisa
	jr z,$+99		;a58e   ; Exactamente 4 es la sentencia recien firmada. El destino de este `jr` es 0xA58E+99 = 0xA5F1, donde se decide hacia donde se derrumba
	inc a			;a590   ; De 5 en adelante la agonia avanza sola, un punto por cuadro y sin mirar el mando
	ld (0a6edh),a		;a591
	call pinta_torre		;a594   ; La torre se sigue dibujando mientras el jugador se muere
	ld a,(0a6edh)		;a597
	cp 01fh		;a59a   ; Pasado 0x1F ya no hay nada que pintar: quedan catorce cuadros de espera hasta el 0x2D que el bucle de 0xA51B vigila para restar la vida
	ret nc			;a59c
	sub 007h		;a59d   ; 7 es el primer cuadro del derrumbe, asi que lo que queda en A es el numero de cuadro contado desde ahi: de 0 a 0x17
	jr c,desliza_cadaver		;a59f   ; Los cuadros 5 y 6 todavia son el monigote de pie, deslizandose
	push af			;a5a1   ; Guarda el cuadro Y el acarreo -que aqui es cero-, porque el `rra` de 0xA5C2 va a contar con el
	jr nz,L_A5B3		;a5a2   ; Lo de abajo pasa una sola vez, en el cuadro 7 exacto
	call sonido_reset		;a5a4   ; Reabre el sonido: repone el `di` que sonido_off habia machacado en la cabecera de las dos rutinas de arranque
	ld a,002h		;a5a7   ; Canal 2...
	ld de,0cda5h		;a5a9   ; ...y el guion de 0xCDA5, el sonido de la caida
	call arranca_guion		;a5ac
	call sonido_off		;a5af   ; Y vuelve a cerrar la puerta: con el `ret` otra vez en la cabecera de arranca_guion, nada de lo que suene despues puede pisar a este
	xor a			;a5b2   ; Las tres llamadas de arriba han machacado A; esto lo devuelve al 0 que traia, para que la comparacion de la linea siguiente valga
L_A5B3:
	cp 014h		;a5b3   ; El cuadro 0x14 del derrumbe -0x1B en 0xA6ED-, ya casi al final
	jr nz,L_A5C1		;a5b5
	xor a			;a5b7   ; Canal 0 esta vez...
	ld de,0ce1eh		;a5b8   ; ...y el segundo guion, 0xCE1E
	di			;a5bb   ; El `di` a mano, porque...
	call arranca_guion_sin_di		;a5bc   ; ...esta llamada entra POR DETRAS del `di`: sonido_off dejo un `ret` en 0xC4D0 y saltar a 0xC4D1 es la unica forma de arrancar un guion con la puerta cerrada
	ld a,014h		;a5bf   ; Repone A como hizo el `xor a` de 0xA5B2, pero aqui sobra: el `pop af` de la linea siguiente lo pisa antes de que nadie lo lea
L_A5C1:
	pop af			;a5c1   ; Recupera el cuadro (0 a 0x17) y con el el acarreo a cero que guardo 0xA5A1
	rra			;a5c2   ; Entre dos: cada dibujo del derrumbe dura DOS cuadros, y por eso los doce llenan los 24
	add a,050h		;a5c3   ; Los doce fotogramas del derrumbe son las entradas 0x50 a 0x5B del pool de sprites
	call 00000h		;a5c5   ; BIOS CHKRAM - Tests RAM and sets RAM slot for the system  [alias: STARTUP, RESET, BOOT] | No es la BIOS: el 0x0000 es un hueco, y el operando de verdad lo escribe 0xA64D en 0xA5C6. Vale copia_sprite, gira_sprite_dcha, voltea_sprite o gira_sprite_izda, o sea que doce dibujos por cuatro giros dan 48 poses de derrumbe sin gastar un byte mas de graficos
	ld hl,(0a6ebh)		;a5c8
	ld a,060h		;a5cb   ; 0x60 es el slot de trabajo (0x7D55 = 0x6555 + 0x60*64), donde acaba de quedar el dibujo ya girado
	jp pinta_sprite		;a5cd
desliza_cadaver:		; Los DOS cuadros -estados 5 y 6- en que el cuerpo ya no anda pero sigue moviendose: dos pixeles por el rumbo de la caida y sin mirar el mapa, girando sobre si mismo porque 0xA65C le deja pedido el rumbo OPUESTO. Con un octavo por cuadro y solo dos cuadros, el giro que se ve es un cuarto de vuelta
	ld a,(0ad0eh)		;a5d0   ; Aqui 0xAD0E ya no lleva fase de animacion: 0xA650 lo dejo con el rumbo de la caida a secas, 0, 2, 4 o 6
	ld hl,(0a6ebh)		;a5d3
	ld bc,00202h		;a5d6   ; Dos pixeles por cuadro en las dos coordenadas, el mismo paso que andando
	call aplica_rumbo		;a5d9   ; El cuerpo se desliza sin consultar el mapa: por eso se le ve salirse de la plataforma
	ld (0a6ebh),hl		;a5dc
	ld a,(0c469h)		;a5df   ; 0xC469 es el rumbo del cadaver: el actual en los bits 0-2 y el pedido en los 5-7
	call gira_rumbo		;a5e2   ; Un octavo de vuelta por cuadro hacia el rumbo OPUESTO que le dejo pedido 0xA65C. Media vuelta serian cuatro cuadros, pero aqui solo se pasa DOS veces -los estados 5 y 6-, asi que al cuerpo le da tiempo a un cuarto de vuelta antes de que arranque el derrumbe
	ld (0c469h),a		;a5e5
	and 007h		;a5e8   ; El dibujo es el rumbo pelado, 0 a 7: las ocho poses de pie del pool
	ld hl,(0a6ebh)		;a5ea
	jp pinta_sprite		;a5ed

; ----------------------------------------------------------------------
; DATOS relleno_A5F0: Relleno o resto (1 B; 1 bytes)
;   0xa5f0..0xa5f1  (1 bytes)
DATA_relleno_A5F0:
	defb 0c9h	; a5f0

; ======================================================================
; CODIGO 0xa5f1..0xa6e9  (248 bytes)
; ======================================================================


elige_lado_de_la_caida:		; Firmada la sentencia, decide hacia cual de los CUATRO lados cardinales se derrumba el cuerpo. Con rumbo par no hay nada que elegir; con rumbo diagonal mira la celda dos pixeles al lado contrario y se queda con la componente que le hizo cruzar el borde
	inc a			;a5f1   ; El 4 pasa a 5: la sentencia se vuelve agonia, y con eso este reparto no se ejecuta mas de una vez
	ld (0a6edh),a		;a5f2
	ld a,(0ad0eh)		;a5f5   ; 0xAD0E: rumbo en los bits 0-2, fase del ciclo de andar en los bits 3-4
	and 007h		;a5f8   ; La fase se tira; a partir de aqui el byte es solo el rumbo de la caida
	ld (0ad0eh),a		;a5fa
	bit 0,a		;a5fd   ; Rumbo PAR -arriba, derecha, abajo o izquierda- y no hay nada que decidir: el cuerpo cae hacia donde iba
	jr z,elige_giro_del_cadaver		;a5ff
	cp 004h		;a601   ; Los cuatro rumbos diagonales hay que romperlos en uno de los cuatro cardinales, que son los unicos que saben girar el dibujo
	jr c,caida_diagonal_dcha		;a603   ; 1 y 3 son las diagonales que tiran a la derecha; 5 y 7, las que tiran a la izquierda
	ld a,l			;a605   ; Diagonal hacia la izquierda: mira la celda DOS pixeles a la derecha, o sea la que acaba de dejar atras
	add a,002h		;a606
	ld l,a			;a608
	call consulta_mapa		;a609
	ld a,006h		;a60c   ; Si ahi todavia hay suelo es que acaba de cruzar el borde de lado, y el cuerpo se va por la IZQUIERDA
	jr nz,elige_giro_del_cadaver		;a60e
	ld a,(0ad0eh)		;a610   ; Y si tampoco hay suelo detras, manda la componente vertical de la diagonal
	cp 007h		;a613
	ld a,004h		;a615   ; Rumbo 5, abajo-izquierda: cae hacia ABAJO
	jr nz,elige_giro_del_cadaver		;a617
	xor a			;a619   ; Rumbo 7, arriba-izquierda: cae hacia ARRIBA
	jr elige_giro_del_cadaver		;a61a
caida_diagonal_dcha:		; La mitad de las diagonales que van hacia la derecha (rumbos 1 y 3): mira el suelo dos pixeles a la izquierda, que es de donde viene
	ld a,l			;a61c   ; La simetrica, para las diagonales de la derecha: la celda que se prueba es la de dos pixeles a la IZQUIERDA
	sub 002h		;a61d
	ld l,a			;a61f
	call consulta_mapa		;a620
	ld a,002h		;a623   ; Con suelo detras, el cuerpo se va por la DERECHA
	jr nz,elige_giro_del_cadaver		;a625
	ld a,(0ad0eh)		;a627   ; Sin suelo detras, decide otra vez la componente vertical
	and 007h		;a62a
	dec a			;a62c   ; El `dec a` separa el 1 del 3; el `ld` de debajo no toca banderas
	ld a,004h		;a62d   ; Rumbo 3, abajo-derecha: ABAJO
	jr nz,elige_giro_del_cadaver		;a62f
	xor a			;a631   ; Rumbo 1, arriba-derecha: ARRIBA
elige_giro_del_cadaver:		; Traduce el lado de la caida al giro que hay que darle al dibujo, y lo deja escrito en el operando del `call` de 0xA5C5. Los doce fotogramas del derrumbe existen SOLO mirando hacia arriba: las otras tres direcciones se sacan girandolos al vuelo
	and a			;a632   ; Cuatro comparaciones encadenadas, una por lado. Arriba se lleva copia_sprite, que es la identidad: los doce fotogramas estan dibujados mirando hacia arriba
	jr nz,L_A638		;a633
	ld hl,0b396h		;a635
L_A638:
	cp 002h		;a638   ; Derecha: un cuarto de vuelta a la derecha, que es transponer el bloque bit a bit
	jr nz,L_A63F		;a63a
	ld hl,0b2a6h		;a63c
L_A63F:
	cp 004h		;a63f   ; Abajo: la del truco de leer el sprite con `ld sp,hl` y `pop`, que le da la vuelta de arriba abajo (espejo, no media vuelta)
	jr nz,L_A646		;a641
	ld hl,0b36eh		;a643
L_A646:
	cp 006h		;a646   ; Izquierda: el cuarto de vuelta del otro lado
	jr nz,L_A64D		;a648
	ld hl,0b30ah		;a64a
L_A64D:
	ld (0a5c6h),hl		;a64d   ; Y el elegido se escribe en el operando del `call` de 0xA5C5, tres bytes mas atras del sitio donde se va a usar
	ld (0ad0eh),a		;a650   ; 0xAD0E se queda con el rumbo de la caida a pelo, sin fase de animacion: es lo que desliza_cadaver da por supuesto
	ld c,a			;a653
	add a,004h		;a654   ; Mas cuatro de ocho es el rumbo OPUESTO...
	and 007h		;a656
	rrca			;a658   ; ...subido a los bits 5-7, que es donde gira_rumbo busca el pedido
	rrca			;a659
	rrca			;a65a
	or c			;a65b
	ld (0c469h),a		;a65c   ; Asi el cuerpo empieza a darse la vuelta mientras se desliza; como solo hay dos cuadros de deslizamiento, se queda a mitad de camino
	call pinta_torre		;a65f   ; La torre otra vez, antes de irse a pintar el cadaver
	jp desliza_cadaver		;a662
L_A665:
	call consulta_mapa		;a665   ; La consulta del suelo del JUGADOR: celda vacia bajo los pies = 0xA6ED=4, muerte sentenciada (la unica escritura de la via de caida)
	jr nz,juega_en_firme		;a668   ; Celda con suelo: turno normal
	ld a,004h		;a66a   ; Celda vacia: sentencia firmada, y la vuelta al reparto de arriba con el 4 ya puesto pinta el primer cuadro de la caida en ESTE mismo cuadro, sin esperar al siguiente
	ld (0a6edh),a		;a66c
	jp reparte_estado_jugador		;a66f
juega_en_firme:		; El turno del jugador cuando hay suelo bajo los pies: apunta el checkpoint, lee el mando por el `call` parcheable de 0xA688, dispara, gira el rumbo, da el paso y avanza la animacion sumando 8 a 0xAD0E solo si se ha movido de verdad. Lo llama tambien el bucle del titulo, que es lo que mueve el cursor del menu
	xor a			;a672   ; El delta del scroll de este cuadro a cero ANTES de dar el paso: quien lo levanta es actualiza_scroll, y mas abajo es lo que dice si el jugador se ha movido de verdad
	ld (0c462h),a		;a673
	ld hl,(0a6ebh)		;a676   ; El CHECKPOINT: mientras se pise firme se apunta la posicion...
	ld (0a6e9h),hl		;a679
	ld a,(0ad2ah)		;a67c   ; ...y la camara entera, fila y scroll fino. Es lo que repone respawn despues de cada muerte
	ld (0c466h),a		;a67f
	ld a,(0ad2ch)		;a682
	ld (0c467h),a		;a685
	call lee_mando		;a688   ; El operando de este `call` esta en 0xA689 y se parchea: lee_mando en partida y lee_mando_demo (0xA6EE) mientras corre la grabacion
	ld (0c45bh),a		;a68b   ; El byte de controles queda a la vista en 0xC45B, que es de donde lo saca el bucle del titulo para elegir opcion del menu
	call dispara		;a68e   ; dispara devuelve A intacto, asi que el mismo byte sigue sirviendo para lo de abajo
	and 00fh		;a691   ; El nibble bajo YA es una mascara de movimiento -bit 0 abajo, 1 arriba, 2 derecha, 3 izquierda-, y lo montan asi tanto el camino de joystick como el de teclado
	call poda_rumbo_jugador		;a693   ; Los topes laterales: con X=0 se cae el bit de izquierda y con X=0xB0 el de derecha
	call rumbo_a_mascara2		;a696   ; Tabla 0xAD17, la INVERSA de la de rumbos: de mascara a rumbo 0 a 7, con 0xFF para las combinaciones que no dicen nada (nada pulsado, o izquierda y derecha a la vez)
	cp 0ffh		;a699
	ld hl,(0a6ebh)		;a69b
	jr z,remata_turno_jugador		;a69e   ; Sin direccion pedida no se gira ni se anda: se salta directo a repintar lo que ya hay
	rrca			;a6a0   ; El rumbo pedido sube a los bits 5-7...
	rrca			;a6a1
	rrca			;a6a2
	ld c,a			;a6a3
	ld a,(0ad0eh)		;a6a4
	and 01fh		;a6a7   ; ...y se pega al rumbo actual y a la fase, que viven en los bits 0-4
	or c			;a6a9
	call gira_rumbo		;a6aa   ; Un octavo de vuelta por cuadro y por el lado corto: el protagonista no cambia de direccion de golpe, gira
	ld (0ad0eh),a		;a6ad
	ld c,002h		;a6b0   ; Dos pixeles de paso
	call paso_jugador		;a6b2   ; El paso solo avanza en lo que el rumbo actual y el pedido tienen en comun, asi que mientras gira casi no se mueve. Y ademas mueve la CAMARA: la fila vuelve siempre a 0x68 y lo que sube o baja es el mundo
	call recorta_x_jugador		;a6b5   ; Y si el paso lateral se ha salido por la derecha, se deshace
	ld (0a6ebh),hl		;a6b8
	ld a,(0c462h)		;a6bb   ; Se ha movido de verdad? Si la camara ha cambiado, si...
	and a			;a6be
	jr nz,L_A6C7		;a6bf
	ld a,(0a6e9h)		;a6c1   ; ...y si no, se compara la X de ahora con la que se apunto en el checkpoint, unas lineas antes de leer el mando
	cp l			;a6c4
	jr z,remata_turno_jugador		;a6c5   ; Mismo sitio: la fase no avanza, y el monigote se queda quieto en vez de pedalear contra la pared
L_A6C7:
	ld a,(0ad0eh)		;a6c7
	and 01fh		;a6ca   ; Se conserva el rumbo (bits 0-2) y la fase (bits 3-4)
	add a,008h		;a6cc   ; Mas ocho es una fase mas del ciclo de andar: 0, 1, 2, 3 y vuelta a empezar
	ld (0ad0eh),a		;a6ce
remata_turno_jugador:		; El cierre del turno: elige el dibujo del ciclo de andar, lo estampa, pinta la torre encima y cobra los tiros enemigos que le hayan alcanzado
	ld a,(0ad0eh)		;a6d1
	and 01fh		;a6d4   ; El numero de dibujo del pool es fase*8 + rumbo
	bit 3,a		;a6d6   ; Las fases 1 y 3 comparten dibujo...
	jr z,L_A6DC		;a6d8
	res 4,a		;a6da   ; ...porque bajar el bit 4 convierte la 3 en la 1. El ciclo de andar es 0-1-2-1: tres dibujos por cada uno de los ocho rumbos, o sea las 24 primeras entradas del pool
L_A6DC:
	call pinta_sprite		;a6dc
	call pinta_torre		;a6df   ; La torre se pinta DESPUES del jugador, o sea por encima de el
	ld hl,(0a6ebh)		;a6e2
	call tiro_alcanza_jugador		;a6e5   ; Y lo ultimo del turno es cobrar: los tiros enemigos contra la posicion nueva
	ret			;a6e8

; ----------------------------------------------------------------------
; DATOS variables_del_jugador: Las CINCO variables del jugador, y no relleno:
;   0xA6E9/0xA6EA la ultima posicion pisada en firme -el checkpoint que apunta
;   juega_en_firme y repone respawn-, 0xA6EB/0xA6EC la posicion actual (X en
;   el byte bajo, fila en el alto, clavada en 0x68) y 0xA6ED el semaforo de
;   escudo y agonia. Caen aqui, entre dos trozos de codigo, porque el programa
;   las lleva incrustadas en su propio cuerpo
;   0xa6e9..0xa6ee  (5 bytes)
DATA_variables_del_jugador:
	defb 000h,000h,000h,000h,000h	; a6e9

; ======================================================================
; CODIGO 0xa6ee..0xaca2  (1460 bytes)
; ======================================================================


lee_mando_demo:		; Saca el siguiente byte de la partida grabada de la demo (puntero en 0xC460) y avanza
	ld ix,(0c460h)		;a6ee   ; El puntero de la grabacion, que 0xA3FF dejo apuntando a 0x9FF3
	ld a,(ix+000h)		;a6f2   ; Un byte por cuadro, y el byte ES el estado de los cinco controles en el mismo formato que devuelve lee_mando: la demo se grabo asi de barata
	inc ix		;a6f5
	ld (0c460h),ix		;a6f7   ; Y avanza, sin tope ni vuelta atras: la demo la corta el bucle de juego, en cuanto se toca una tecla o el jugador de mentira se mata
	ret			;a6fb
lee_mando:		; Los cinco controles en un byte: por el registro 14 del PSG si 0xB87C dice joystick, o preguntando las teclas de 0xB86A si dice teclado. Los bits del joystick se reordenan a mano igual que en la fase de naves
	ld a,(0b87ch)		;a6fc   ; 0 es teclado y cualquier otra cosa es joystick. Quien lo escribe es el menu del titulo, y le mete la ALTURA del cursor: el "cualquier otra cosa" es literal
	and a			;a6ff
	ld c,000h		;a700   ; En C se va montando el resultado bit a bit
	jr z,lee_teclado		;a702
	ld a,(0c45ch)		;a704   ; 0xC45C lo levanta el titulo: mientras se elige en el menu el joystick no vale aunque este seleccionado
	and a			;a707
	jr nz,lee_teclado		;a708
	ld a,007h		;a70a   ; Registro 7 del PSG, el mezclador...
	out (0a0h),a		;a70c
	ld a,0ffh		;a70e   ; ...a 0xFF entero. El volcado de sonido lo repone en el siguiente tic de interrupcion, asi que este valor solo dura las dos instrucciones que faltan hasta el `in`
	out (0a1h),a		;a710
	ld a,00eh		;a712   ; Registro 14, que es donde el MSX cablea el mando
	out (0a0h),a		;a714
	in a,(0a2h)		;a716   ; La lectura del PSG va por el puerto 0xA2, no por el 0xA1 con el que se escribe
	rra			;a718   ; Cinco `rra` que reparten los bits UNO A UNO, porque el orden del joystick del MSX no es el de la mascara de movimiento del juego
	jr c,L_A71D		;a719   ; El puerto trae 0 en lo que esta pulsado
	set 1,c		;a71b   ; Arriba del joystick -> bit 1
L_A71D:
	rra			;a71d
	jr c,L_A722		;a71e
	set 0,c		;a720   ; Abajo -> bit 0
L_A722:
	rra			;a722
	jr c,L_A727		;a723
	set 3,c		;a725   ; Izquierda -> bit 3
L_A727:
	rra			;a727
	jr c,L_A72C		;a728
	set 2,c		;a72a   ; Derecha -> bit 2
L_A72C:
	rra			;a72c
	jr c,L_A731		;a72d
	set 4,c		;a72f   ; Disparo -> bit 4, el unico que cae en su sitio
L_A731:
	ld a,c			;a731   ; Y el byte montado a mano se devuelve en A
	ret			;a732
lee_teclado:		; El camino de teclado de lee_mando: recorre las CINCO primeras entradas de 0xB86A metiendo cada tecla por el bit 7 de C y remata con tres `rrca`. Gemela de la de 0xC1F4 de la fase de naves
	ld ix,0b86ah		;a733   ; La tabla de teclas: dos bytes por entrada, mascara del bit y valor de la fila
	ld b,005h		;a737   ; CINCO, no siete: PARAR y ABANDONAR se leen aparte, en 0xA539 y 0xA507
lee_teclado_bucle:		; Una entrada de la tabla: fila por el puerto 0xAA, lectura por el 0xA9, mascara del bit y el resultado a C por acarreo
	ld a,(ix+001h)		;a739   ; La fila, por el puerto 0xAA...
	out (0aah),a		;a73c
	in a,(0a9h)		;a73e   ; ...y los ocho bits de esa fila, por el 0xA9
	and (ix+000h)		;a740   ; Filtrados con la mascara del bit de esa tecla
	jr nz,L_A746		;a743
	scf			;a745   ; Las teclas dan CERO al pulsarse, asi que el acarreo se pone justo cuando el `and` sale a cero
L_A746:
	rr c		;a746   ; Que entra por el bit 7 de C y va bajando vuelta a vuelta
	inc ix		;a748   ; Dos bytes por entrada
	inc ix		;a74a
	djnz lee_teclado_bucle		;a74c
	ld a,c			;a74e
	rrca			;a74f   ; Tras las cinco vueltas los bits estan del 7 al 3; estos tres `rrca` los bajan al 4 al 0 y en el orden de la tabla, que es ABAJO, ARRIBA, DERECHA, IZQUIERDA, DISPARO. O sea, exactamente la mascara de movimiento que espera la tabla de 0xAD17
	rrca			;a750
	rrca			;a751
	ret			;a752
mueve_enemigos:		; El bucle de los enemigos andantes (tabla 0xACE4, contador 0xACE3): scroll sumado (0xC462), y rumbo por azar entre vagar y perseguir al jugador
	ld ix,0ace4h		;a753   ; IX recorre la tabla: cuatro fichas de cinco bytes -X, Y, rumbo con banderas, reloj y un quinto que escribe alta_enemigo y que aqui no lee nadie-
	ld a,(0ace3h)		;a757   ; Cuantos andantes hay vivos ahora mismo
	and a			;a75a
	ret z			;a75b
	ld b,a			;a75c
L_A75D:
	push bc			;a75d
	ld a,(0c462h)		;a75e   ; El delta del scroll de este cuadro se le suma a la Y: los andantes van anclados al MUNDO, no a la pantalla
	add a,(ix+001h)		;a761
	ld (ix+001h),a		;a764
	ld a,(ix+003h)		;a767   ; El cuarto byte de la ficha hace dos papeles: por debajo de 0x14 es el reloj que dice cuando volver a apuntar, y de 0x1D en adelante es el contador de la explosion
	cp 014h		;a76a
	jr c,elige_rumbo_andante		;a76c
	ld l,(ix+000h)		;a76e   ; Explotando la ficha ya no anda ni dispara, solo pasa fotogramas
	ld h,(ix+001h)		;a771
	add a,03fh		;a774   ; Mas 0x3F sobre el contador 0x1D..0x20 da los dibujos 0x5C a 0x5F del pool: los cuatro cuadros de explosion, los mismos que se lleva el jugador reventado de un impacto
	call pinta_sprite		;a776
	inc (ix+003h)		;a779
	ld a,(ix+003h)		;a77c
	cp 021h		;a77f   ; Agotado el cuarto, la ficha se borra de la tabla
	jp nz,L_A88C		;a781
	jp borra_andante		;a784
elige_rumbo_andante:		; El rumbo de un andante vivo: una tirada de azar decide, mitad y mitad, entre vagar hacia un rumbo cualquiera y perseguir al jugador
	ld b,(ix+001h)		;a787   ; B la Y y C la X, que es como las quiere rumbo_al_jugador
	ld c,(ix+000h)		;a78a
	call azar		;a78d   ; Una tirada de azar por bicho y por cuadro
	bit 4,a		;a790   ; El bit 4 echa la moneda: vagar o perseguir, mitad y mitad
	jr z,L_A79B		;a792
	and 007h		;a794   ; Vagar: los tres bits bajos del mismo numero dan un rumbo cualquiera de los ocho...
	call rumbo_a_mascara		;a796   ; ...traducido a mascara, que es la forma en que sale el otro camino
	jr L_A7A2		;a799
L_A79B:
	ld de,(0a6ebh)		;a79b   ; Perseguir: DE es la posicion del jugador, E la X y D la fila
	call rumbo_al_jugador		;a79f   ; Devuelve la mascara de la direccion dominante, con las dos componentes si las distancias no se llevan mas de dos veces y media
L_A7A2:
	call borde_pantalla		;a7a2   ; Los mismos topes laterales que el jugador, pero con el margen de tres pixeles que lleva la version de objeto
	call rumbo_a_mascara2		;a7a5   ; De vuelta a rumbo por la tabla inversa de 0xAD17
	ld (0b13fh),a		;a7a8   ; Y el rumbo pedido se aparca en 0xB13F hasta 0xA83F, que lo compara con el que de verdad lleva para decidir si el bicho puede disparar
	ld l,(ix+000h)		;a7ab
	ld h,(ix+001h)		;a7ae
	rrca			;a7b1   ; A los bits 5-7, que es el sitio del rumbo pedido
	rrca			;a7b2
	rrca			;a7b3
	ld c,a			;a7b4
	ld a,(ix+003h)		;a7b5   ; El reloj de la ficha...
	inc a			;a7b8
	cp 009h		;a7b9   ; ...que corre de 0 a 9: solo una vez cada nueve cuadros se corrige el rumbo, y por eso los bichos describen curvas en vez de perseguir en linea recta
	ld (ix+003h),a		;a7bb
	ld a,(ix+002h)		;a7be   ; El tercer byte: rumbo en los bits 0-2, fase de andar en los 3-4 y el TIPO de bicho en el 5
	jr nz,L_A7D9		;a7c1
	ld (ix+003h),000h		;a7c3   ; Toca corregir: el reloj vuelve a cero...
	and 01fh		;a7c7   ; ...se junta el rumbo actual con el pedido...
	or c			;a7c9
	call gira_rumbo		;a7ca   ; ...y se gira un octavo, con la misma rutina que el jugador
	and 01fh		;a7cd   ; El bit 5 no puede perderse por el camino: es lo que elige entre los dos juegos de dibujos
	ld c,a			;a7cf
	ld a,(ix+002h)		;a7d0
	and 020h		;a7d3
	or c			;a7d5
	ld (ix+002h),a		;a7d6
L_A7D9:
	ld l,(ix+000h)		;a7d9   ; La posicion vieja se recarga entera, que lo de arriba solo tocaba el rumbo
	ld h,(ix+001h)		;a7dc
	and 007h		;a7df   ; Solo el rumbo ACTUAL: el bicho anda hacia donde mira, no hacia donde quiere ir
	ld bc,00202h		;a7e1   ; Dos pixeles, el mismo paso que el jugador
	call aplica_rumbo		;a7e4
	call recorta_x_objeto		;a7e7   ; Y el mismo recorte lateral
	push hl			;a7ea
	push ix		;a7eb   ; consulta_mapa machaca IX, y en IX va la ficha
	call consulta_mapa		;a7ed   ; El paso a prueba: aplicado el rumbo se consulta el mapa, y si la celda es vacio el paso se deshace
	pop ix		;a7f0
	pop hl			;a7f2
	jr nz,L_A7FE		;a7f3
	ld l,(ix+000h)		;a7f5   ; Celda vacia: el paso se deshace y la ficha se queda donde estaba. Los andantes NO se caen de la torre; el unico que se cae es el jugador
	ld h,(ix+001h)		;a7f8
	jp L_A821		;a7fb
L_A7FE:
	ld e,(ix+000h)		;a7fe   ; DE la posicion de antes del paso, HL la de despues
	ld d,(ix+001h)		;a801
	and a			;a804
	sbc hl,de		;a805   ; Se ha movido de verdad?
	jr z,L_A81A		;a807   ; No: la fase de andar se queda quieta, la misma regla que el jugador
	ld a,(ix+002h)		;a809   ; Si: mas ocho en los bits 3-4...
	add a,008h		;a80c
	and 018h		;a80e   ; ...con la vuelta al cero hecha por la mascara, y sin tocar ni el rumbo ni el bit del tipo
	ld c,a			;a810
	ld a,(ix+002h)		;a811
	and 0e7h		;a814
	or c			;a816
	ld (ix+002h),a		;a817
L_A81A:
	add hl,de			;a81a   ; HL llevaba la diferencia desde el `sbc`; el `add` le devuelve la posicion nueva
	ld (ix+000h),l		;a81b
	ld (ix+001h),h		;a81e
L_A821:
	ld a,h			;a821   ; Por encima de 0xE0 la fila ha dado la vuelta -por arriba o por abajo- y la ficha se borra. Es el unico limite vertical que tienen
	cp 0e0h		;a822
	jp nc,borra_andante		;a824
	ld a,(ix+002h)		;a827   ; El dibujo: fase por ocho mas rumbo, igual que el jugador
	and 01fh		;a82a
	bit 3,a		;a82c   ; Y la misma doblez, la fase 3 dibujada como la 1
	jr z,L_A832		;a82e
	res 4,a		;a830
L_A832:
	add a,018h		;a832   ; Los andantes empiezan en la entrada 0x18 del pool: las 24 de delante son el protagonista
	bit 5,(ix+002h)		;a834   ; Y el bit 5 de la ficha, echado a suertes al darla de alta (0xAC61: azar, `and 020h`, `or 014h`), suma otras 24: cada andante tira de uno de DOS juegos del pool, 0x18-0x2F o 0x30-0x47. Que los dibujos de los dos juegos sean distintos de verdad esta sin comprobar en pantalla
	jr z,L_A83C		;a838
	add a,018h		;a83a
L_A83C:
	call pinta_sprite		;a83c
	ld a,(0b13fh)		;a83f   ; El rumbo que se pidio arriba...
	xor (ix+002h)		;a842   ; ...contra el que de verdad lleva: solo dispara el que YA mira hacia donde quiere ir, o sea el que persigue y ha terminado de girar
	and 007h		;a845
	jr nz,L_A865		;a847
	ld a,(ix+002h)		;a849   ; El tiro sale con el rumbo del bicho...
	and 007h		;a84c
	ex af,af'			;a84e   ; ...que es como lo espera alta_tiro_enemigo, en A'
	call azar		;a84f   ; Y aun asi, una de cada 32 veces
	and 01fh		;a852
	jr nz,L_A865		;a854
	ld a,(ix+000h)		;a856   ; El tiro nace en el centro del bicho, cuatro pixeles adentro en las dos coordenadas
	add a,004h		;a859
	ld c,a			;a85b
	ld a,(ix+001h)		;a85c
	add a,004h		;a85f
	ld b,a			;a861
	call alta_tiro_enemigo		;a862
L_A865:
	call disparo_derriba_andante		;a865   ; Los disparos del jugador contra este bicho
	ld a,(0a6edh)		;a868   ; Con el jugador ya sentenciado (0xA6ED por encima de 3) no hay contacto que valga
	cp 004h		;a86b
	jr nc,L_A88C		;a86d
	ld l,(ix+000h)		;a86f
	ld h,(ix+001h)		;a872
	call choca_con_jugador		;a875   ; solapa_eje vuelve con acarreo cuando NO se tocan
	jr c,L_A88C		;a878
	ld (ix+002h),0ffh		;a87a   ; Tocarse mata a los dos: el bicho pasa a explosion...
	ld (ix+003h),01dh		;a87e   ; ...con el contador puesto en 0x1D, el primero de los cuatro cuadros
	xor a			;a882
	ld de,0cd6dh		;a883
	call arranca_guion		;a886
	call mata_jugador_impacto		;a889   ; ...y al jugador lo mata DIRECTAMENTE, sin gastar escudo. Chocar con un andante es muerte segura; sus tiros, en cambio, solo cuestan un punto de escudo (impacto_simple)
L_A88C:
	ld de,00005h		;a88c   ; Cinco bytes por ficha
	add ix,de		;a88f
L_A891:
	pop bc			;a891   ; El contador de la vuelta, que se guardo en la pila al entrar
	dec b			;a892
	jp nz,L_A75D		;a893   ; Y a por la siguiente ficha
	ret			;a896
borra_andante:		; Saca la ficha de la tabla: una menos en 0xACE3 y todo lo que hay detras sube cinco bytes con un `ldir`, dejando IX quieto para que la vuelta siguiente procese la ficha que ha caido en el hueco
	ld hl,0ace3h		;a897   ; Una ficha menos...
	dec (hl)			;a89a
	pop bc			;a89b   ; ...y si la que se va es la ultima que quedaba por recorrer no hay nada detras que mover
	push bc			;a89c
	ld a,b			;a89d   ; B es lo que queda de vuelta, no cuantas fichas hay en la tabla
	cp 001h		;a89e
	jr z,L_A891		;a8a0
	push ix		;a8a2   ; DE, la ficha que se va...
	pop de			;a8a4
	push de			;a8a5
	inc de			;a8a6   ; ...y cinco bytes mas adelante, la siguiente
	inc de			;a8a7
	inc de			;a8a8
	inc de			;a8a9
	inc de			;a8aa
	ld hl,0acf8h		;a8ab   ; 0xACF8 es el byte de despues del final de la tabla: la resta da cuantos hay que subir
	and a			;a8ae
	sbc hl,de		;a8af
	ld b,h			;a8b1
	ld c,l			;a8b2
	ex de,hl			;a8b3
	pop de			;a8b4
	ldir		;a8b5   ; Todo lo de detras sube cinco bytes, e IX se queda donde estaba: la vuelta siguiente procesa la ficha que acaba de caer en este hueco
	jp L_A891		;a8b7
paso_jugador:		; Cruza la mascara del rumbo actual con la del pedido y mueve 2 px solo en lo que tengan en comun; luego FIJA la fila en 0x68 y, si el paso la habia cambiado, cae en actualiza_scroll con el carry diciendo si sube
	push af			;a8ba   ; El byte de rumbo entero, que trae dos cosas: el rumbo actual en los bits 0-2 y el pedido en los 5-7. Se guarda porque hacen falta los dos
	and 007h		;a8bb   ; El rumbo ACTUAL, hacia donde el monigote mira ahora mismo
	call rumbo_a_mascara		;a8bd   ; Tabla 0xAD0F, de rumbo a mascara: bit 0 abajo, 1 arriba, 2 derecha, 3 izquierda. Los rumbos pares son cardinales (arriba 0x02, derecha 0x04) y los impares diagonales, con los dos bits (arriba-derecha 0x06)
	ld h,a			;a8c0   ; H hace de aparcamiento de la mascara. Se puede porque la fila se vuelve a clavar tres lineas mas abajo, y porque L -la X- la salva rumbo_a_mascara
	pop af			;a8c1
	rlca			;a8c2   ; Tres rotaciones bajan el rumbo PEDIDO de los bits 5-7 a los 0-2
	rlca			;a8c3
	rlca			;a8c4
	and 007h		;a8c5   ; Y su mascara, por la misma tabla
	call rumbo_a_mascara		;a8c7
	and h			;a8ca   ; La INTERSECCION de las dos mascaras, que es toda la regla del paso. Con las ocho mascaras de 0xAD0F sale asi: a 135 grados o mas nunca queda un bit y el cuadro se va entero en girar; a 90 depende de por donde se venia -en diagonal queda la componente comun, arriba-derecha cruzado con abajo-derecha da derecha, y en cruz no queda nada-; a 45 y a 0 siempre queda algo. Como gira_rumbo, dos lineas antes, solo acerca un octavo por cuadro, dar media vuelta deja al monigote clavado en el sitio los primeros cuadros: dos si venia en cruz y uno si venia en diagonal
	ld h,068h		;a8cb   ; La fila del jugador vuelve a 0x68 pase lo que pase: en pantalla no sube ni baja NUNCA. Y el `ld` no toca banderas, asi que el `ret z` de abajo sigue mirando el `and`
	ret z			;a8cd   ; Sin nada en comun no hay paso, no hay scroll y no hay fase de andar: solo el giro
	ld b,002h		;a8ce   ; Dos pixeles en vertical; los dos de horizontal vienen en C, puestos por el llamador en 0xA6B0
	call rumbo_a_mascara2		;a8d0   ; El rodeo por la tabla INVERSA (0xAD17, de mascara a rumbo) convierte la mascara cruzada otra vez en un rumbo de 0 a 7, que es lo unico que aplica_rumbo sabe leer. De paso NORMALIZA: arriba-derecha cruzado con arriba-izquierda da 0x02, y 0x02 es arriba a secas
	call aplica_rumbo		;a8d3   ; Y ahi se suman o se restan los dos pixeles a las dos coordenadas
	ld a,h			;a8d6   ; La fila que ha quedado despues del paso...
	ld h,068h		;a8d7   ; ...porque la buena se vuelve a clavar en 0x68 y lo que se mueve es el mundo
	cp h			;a8d9   ; Este `cp` hace dos cosas de golpe: dice si el paso movio la fila y deja el acarreo puesto justo cuando la nueva es MENOR que 0x68, o sea cuando el jugador tiraba hacia arriba. Eso es todo el argumento con el que se entra en actualiza_scroll
	ret z			;a8da   ; Paso puramente lateral: la camara no se entera
actualiza_scroll:		; La camara: fino 0xAD2C +-2 con ciclo 2..32; al agotarlo la fila 0xAD2A avanza (topes 0 y 71). Carry = subir. Remata rotando el tile 0 (L_B140/L_B167)
	ld iy,0ad2ah		;a8db   ; IY a la camara. Son seis bytes con dos oficios: +0 la fila del mapa y +2 el scroll fino, que son la posicion de verdad; +3, +4 y +5 el bloc de notas del redibujado de aqui abajo
	jr nc,baja_la_camara		;a8df   ; Acarreo puesto = hacia arriba; sin el, hacia abajo. Lo unico que se le pasa a esta rutina es una bandera
	ld a,(iy+002h)		;a8e1   ; El fino va de 2 a 32: los dieciseis pasos de 2 px que mide de alto una fila del mapa
	cp 020h		;a8e4   ; A tope, asi que este paso ya no cabe en la fila
	jr z,agota_fino_subiendo		;a8e6
	add a,002h		;a8e8   ; Dentro de la fila: dos pixeles y listo
	ld (iy+002h),a		;a8ea
	jp rota_fondo_sube		;a8ed   ; Y todo camino que mueve la camara acaba rotando el tile 0 una fila de pixel. Como el scroll va de 2 en 2 y la rotacion de 1 en 1, la trama del fondo viaja a mitad de velocidad que las plataformas: el parallax
agota_fino_subiendo:		; El fino ya en 32: o la camara pasa a la fila de arriba (una menos, que el mapa guarda la cima en la 0) o se ha llegado a la cima y no se mueve nada
	ld a,(iy+000h)		;a8f0   ; La fila del mapa. Subiendo se DECREMENTA porque el mapa esta guardado con la cima de la torre en la fila 0 y el pie en la 71
	or a			;a8f3   ; Fila 0, la cima: la camara se planta ahi y ni siquiera se rota el fondo. El monigote puede seguir andando, pero el mundo ya no se mueve
	ret z			;a8f4
	ld (iy+002h),002h		;a8f5
	dec (iy+000h)		;a8f9   ; El engranaje de la camara: fino agotado (32) -> fila una menos, fino a 2
	jp rota_fondo_sube		;a8fc
baja_la_camara:		; El ciclo simetrico, el del jugador tirando hacia abajo: el fino de 2 en 2 hacia atras hasta agotarse en 2
	ld a,(iy+002h)		;a8ff   ; Bajando el ciclo es el mismo del reves, y se agota por el otro extremo
	cp 002h		;a902   ; En 2 ya no cabe otro paso hacia atras
	jr z,agota_fino_bajando		;a904
	sub 002h		;a906
	ld (iy+002h),a		;a908   ; Dos pixeles menos
	jp rota_fondo_baja		;a90b
agota_fino_bajando:		; El fino ya en 2: la camara pasa a la fila de abajo, salvo que ya este en la 71, el pie de la torre, que es donde se comprueba si la fase esta ganada
	ld a,(iy+000h)		;a90e   ; 0x47 = 71 es el pie de la torre, la fila donde arranca la partida
	cp 047h		;a911
	jr z,remate_de_fase		;a913   ; Y aqui NO se vuelve con un `ret` como en la cima: intentar bajar del pie es LA condicion que dispara la comprobacion de si la fase esta ganada. La salida no es una celda especial del mapa, es un tope de camara
	ld (iy+002h),020h		;a915   ; Fila una mas y el fino arriba del todo, que es el reverso exacto de 0xA8F5
	inc (iy+000h)		;a919
	jp rota_fondo_baja		;a91c
remate_de_fase:		; La puerta del remate, y no se llega a ella andando sino INTENTANDO BAJAR con la camara ya en el pie de la torre (0xA913): con los seis objetivos muertos (0xBC33) y la X del jugador entre 0x50 y 0x5F -franja centrada en el 0x58 con el que empieza la fase-, salta a rehace_pantalla
	ld a,(0bc33h)		;a91f   ; Los objetivos que quedan, que 0xA415 pone a seis al empezar la fase
	and a			;a922   ; Con una sola torreta en pie no se sale: se vuelve, y la camara se queda clavada en el pie de la torre
	ret nz			;a923
	ld a,(0a6ebh)		;a924   ; El byte bajo de 0xA6EB, o sea la X del jugador; la fila no hace falta mirarla porque siempre es 0x68
	cp 050h		;a927   ; La puerta es una franja estrecha, de 0x50 a 0x5F: dieciseis pixeles de los 176 que se pueden pisar
	ret c			;a929
	cp 060h		;a92a   ; Y 0x58, el centro exacto de esa franja, es la MISMA X con la que 0xA2D5 planta al jugador al empezar: se sale por donde se entro. Debajo estan las filas 74 a 76 del mapa, las que llevan en las columnas 2 y 3 la pareja de tiles 0x28/0x29, el cartel-flecha de la base
	ret nc			;a92c
	jp rehace_pantalla		;a92d   ; Torre limpia y jugador en la puerta: se acaba la fase de a pie
borra_globales_sonido:		; Pone a cero los catorce bytes de variables globales del interprete de sonido, 0xD0F2-0xD0FF, que es 0xD068 + 3*46: justo detras del tercer estado de canal
	ld hl,0d0f2h		;a930   ; El truco de siempre para llenar de un valor: se escribe a mano el primer byte...
	ld de,0d0f3h		;a933
	ld bc,0000dh		;a936   ; ...y el `ldir` lo arrastra sobre los trece de detras, que con el primero son catorce
	ld (hl),000h		;a939
	ldir		;a93b   ; Se llama una sola vez, en el arranque de la fase (0xA486), justo detras de sonido_reset: primero se repone el motor de sonido y luego se le borran las variables de encima
	ret			;a93d
redibuja_fondo:		; Pinta la pantalla desde el mapa: origen = 0x87F3 + celda*128 (+4*(32-fino) en la tira parcial de arriba), 6 columnas x 5-6 tiras. El jp de 0xA98E se parchea con TRES opcodes: 0xC2 pinta solo las celdas vacias (tile 0), 0xCA solo las solidas y 0xDA todas
	ld iy,0ad2ah		;a93e   ; La camara otra vez, y aqui es sobre todo el bloc de notas: +3 la tira que toca, +4 cuantas filas de pixel se copian de ella y +5 por donde hay que empezar a leer el tile
	ld (iy+003h),000h		;a942   ; A la tira 0, la de arriba
	call base_mapa		;a946   ; IX = 0x840B + fila*6: la fila del mapa que asoma por el borde de arriba de la pantalla
	ld de,04000h		;a949   ; Y el destino, el principio del buffer de 24 bytes por 160 filas (0x4000-0x4EFF)
prepara_la_tira:		; Reparte la pantalla en tiras de celda: con el fino a tope son CINCO enteras y cuadradas con el borde; con cualquier otro valor son SEIS, la primera y la ultima partidas
	ld a,(iy+002h)		;a94c   ; El scroll fino es lo que manda el reparto en tiras
	cp 020h		;a94f   ; Con el fino a tope las celdas cuadran con el borde de la pantalla: cinco tiras de 32 filas dan las 160 justas y ninguna sale partida
	jr z,tira_completa		;a951
	ld a,(iy+003h)		;a953   ; Con cualquier otro valor hacen falta SEIS tiras, y las de los extremos van cortadas
	and a			;a956
	jr z,tira_de_arriba		;a957   ; La 0 es la de arriba, de la que solo se ve la parte de abajo
	cp 005h		;a959   ; La 5 es la de abajo, de la que solo se ve la parte de arriba...
	ld a,020h		;a95b   ; ...32 - fino filas de ella. El `ld a` va delante del `jr` a proposito: cargar no toca las banderas del `cp`
	jr nz,tira_completa		;a95d   ; Las tiras 1 a 4 son enteras, 32 filas cada una
	sub (iy+002h)		;a95f
	jr tira_completa		;a962
tira_de_arriba:		; La tira 0 con fino intermedio: se ve solo su parte BAJA -fino filas de pixel- y por eso hay que empezar a leer el tile 4*(32-fino) bytes adentro
	ld a,020h		;a964   ; La tira de arriba: se ven `fino` filas de pixel, y son las de ABAJO del tile
	sub (iy+002h)		;a966
	add a,a			;a969   ; Por cuatro, que es lo que ocupa una fila de tile -4 bytes, 32 px-: sale el desplazamiento en BYTES desde el que hay que leer
	add a,a			;a96a
	ld (iy+005h),a		;a96b   ; Ese desplazamiento solo es distinto de cero en esta tira; en las otras cinco el tile se lee desde el principio
	ld a,(iy+002h)		;a96e   ; Y las filas que se copian de la tira 0 son justo las del fino: fino + 4*32 + (32-fino) = 160, el alto del buffer, salga el fino que salga
	ld (iy+004h),a		;a971
	jp L_A97E		;a974
tira_completa:		; Las tiras que se leen desde el principio del tile: las cuatro enteras de en medio y la ultima, que se corta por abajo sola
	ld (iy+004h),a		;a977   ; Las demas tiras: las filas ya vienen en A y el tile se lee desde arriba
	ld (iy+005h),000h		;a97a
L_A97E:
	ld a,006h		;a97e   ; SEIS columnas por tira, el ancho de la torre: 6 celdas de 32 px son los 192 de la pantalla
pinta_columna:		; Una celda: saca del mapa el indice de tile, decide con el opcode parcheado de 0xA98E si le toca en este pase y copia su trozo al buffer
	ex af,af'			;a980   ; El contador de columnas se aparca en A', porque A hace falta entera para la celda
	ld (0b13eh),de		;a981   ; 0xB13E es el bloc de notas del bloque -aqui la direccion de esta columna en el buffer, en pinta_sprite el contador de filas, y su byte alto 0xB13F el rumbo pedido del bicho de turno-, y hay que reponerlo en cada vuelta porque los `ldi` mueven el destino
	ld a,(ix+000h)		;a985   ; La celda del mapa, que hace dos papeles: es el INDICE del tile con el que se dibuja y a la vez la colision (cero = vacio)
	inc ix		;a988   ; La lectura del mapa avanza sola, celda a celda, las seis columnas de cada una de las seis tiras: 36 celdas por pase
	and a			;a98a   ; Celda vacia? Y de paso limpia el acarreo, que es lo que vuelve inofensivo el tercero de los parches
	ld b,(iy+004h)		;a98b   ; Las filas de pixel que toca copiar en esta tira
	jp z,salta_la_celda		;a98e   ; El opcode parcheado: 0xC2 solo las celdas vacias, 0xCA solo las solidas, y 0xDA -jp c, con el carry recien limpiado por el `and a` de arriba- no salta NUNCA, o sea las pinta todas
	ld d,a			;a991   ; De aqui abajo, la celda SOLIDA. DE = celda*256...
	xor a			;a992
	ld e,a			;a993
	rr d		;a994   ; ...y un desplazamiento de 16 bits a la derecha lo deja en celda*128, que es lo que mide un tile
	rr e		;a996
	ld hl,087f3h		;a998   ; El pozo de tiles: 45 dibujos de 32x32 a 128 bytes cada uno
	add hl,de			;a99b
	ld e,(iy+005h)		;a99c   ; Mas el desplazamiento dentro del tile, que en cinco de las seis tiras es cero
	ld d,a			;a99f
	add hl,de			;a9a0
	ld de,(0b13eh)		;a9a1   ; Y el destino, recien aparcado dos lineas arriba
	ld a,d			;a9a5
	cp 04fh		;a9a6   ; El portero del final del buffer: a partir de 0x4F00 no se pinta. Ahora bien, el reparto de arriba suma siempre las 160 filas clavadas -fino + 4*32 + (32-fino), o 5*32 con el fino a tope-, asi que la ultima tira acaba justo en 0x4F00 y este `jr` no llega a saltar. Red de seguridad
	jr nc,columna_siguiente		;a9a8
	ld c,0ffh		;a9aa   ; C alto a proposito: los `ldi` decrementan BC entero, y arrancando en 0xFF no llegan a robarle una vuelta a B, que es el contador de filas de verdad
blitter_de_fondo:		; El nucleo del redibujado: cuatro `ldi` sin bucle por fila de tile (4 bytes = 32 px) y 20 mas de salto hasta la fila de abajo del buffer
	ldi		;a9ac   ; Cuatro `ldi` seguidos y sin bucle: los 4 bytes de una fila de tile, 32 pixeles de ancho de una tacada
	ldi		;a9ae
	ldi		;a9b0
	ldi		;a9b2
	dec b			;a9b4   ; Una fila menos de la tira
	jr z,columna_siguiente		;a9b5
	ld a,e			;a9b7   ; Los `ldi` ya han adelantado el destino cuatro bytes; con estos veinte mas suman los 24 del ancho del buffer, o sea la fila de abajo. El origen no hay que tocarlo: dentro del tile las filas van seguidas
	add a,014h		;a9b8
	ld e,a			;a9ba
	jp nc,blitter_de_fondo		;a9bb   ; Lo normal es que el byte bajo no se lleve nada y la vuelta se de sin tocar D
	inc d			;a9be
	jp blitter_de_fondo		;a9bf
columna_siguiente:		; Cierre de columna: son seis por tira, y el destino de la que viene son cuatro bytes a la derecha del principio de esta
	ex af,af'			;a9c2   ; Vuelve el contador de columnas de A'
	dec a			;a9c3
	jr z,tira_siguiente		;a9c4   ; Las seis hechas: se cierra la tira
	ld de,(0b13eh)		;a9c6   ; Del principio de la columna de antes...
	inc de			;a9ca   ; ...cuatro bytes a la derecha, que es la de al lado. Ojo con la linea de arriba: en la ULTIMA columna esto no se ejecuta, asi que DE tiene que llegar aqui apuntando ya al principio de la tira siguiente, y eso es lo que se encargan de dejar tanto el blitter como el camino que se salta la celda
	inc de			;a9cb
	inc de			;a9cc
	inc de			;a9cd
	jp pinta_columna		;a9ce
tira_siguiente:		; Cierre de tira: cinco tiras si el fino esta a tope, seis si no, y el numero sale del acarreo del propio `cp`
	inc (iy+003h)		;a9d1   ; Una tira mas hecha
	ld a,(iy+002h)		;a9d4   ; Cuantas tiras hay en total depende otra vez del fino...
	cp 020h		;a9d7
	ld a,005h		;a9d9
	adc a,000h		;a9db   ; ...y se resuelve con el acarreo del `cp` de arriba, sin un solo salto: cinco con el fino a tope, seis si no
	cp (iy+003h)		;a9dd   ; Mientras queden tiras, otra vuelta
	jp nz,prepara_la_tira		;a9e0
	ret			;a9e3
salta_la_celda:		; El camino de la celda que este pase no pinta: no copia nada, pero deja el destino exactamente donde lo habria dejado el blitter, que es de lo que vive la tira siguiente
	ld de,00018h		;a9e4   ; Los 24 del ancho del buffer
	dec b			;a9e7   ; Una menos, porque a la ultima fila de la tira no le sigue salto de linea
	ld hl,(0b13eh)		;a9e8
L_A9EB:
	add hl,de			;a9eb   ; Sumar 24 tantas veces como filas es lo que aqui hace de multiplicacion; con 32 filas como mucho, sale mas barato que montar el producto
	djnz L_A9EB		;a9ec
	ld e,004h		;a9ee   ; Y los cuatro bytes de la columna, igual que en el camino que si pinta: los dos dejan el destino en el mismo sitio
	add hl,de			;a9f0
	ex de,hl			;a9f1
	jp columna_siguiente		;a9f2
base_mapa:		; IX = 0x840B + fila*6: la base del mapa de colision de la fase
	ld ix,0840bh		;a9f5   ; El mapa de la fase: 78 filas de 6 celdas de 32x32
	ld l,(iy+000h)		;a9f9   ; La fila de la camara: 0 es la cima de la torre y 71 el pie
	ld h,000h		;a9fc
	ld d,h			;a9fe
	ld e,l			;a9ff
	add hl,hl			;aa00   ; Por dos, mas una, por dos: seis, las celdas que tiene una fila
	add hl,de			;aa01
	add hl,hl			;aa02
	ex de,hl			;aa03
	add ix,de		;aa04   ; IX se queda al principio de la fila. Ojo: consulta_mapa luego lee con (ix-006h), o sea una fila POR ENCIMA de esta
	ret			;aa06
pinta_sprite:		; Estampa el sprite A (64 B en 0x6555 + A*64) en la posicion HL (H = fila + 0x20, L = columna en pixeles), con el desplazamiento fino resuelto parcheando los `jr` de 0xAA4F y 0xAA86
	push hl			;aa07   ; La posicion a la pila, que HL hace falta para la cuenta del sprite
	ld h,000h		;aa08
	ld l,a			;aa0a
	add hl,hl			;aa0b   ; Seis veces por dos: 64 bytes por entrada, que son 16 filas de mascara y dibujo a dos bytes cada uno
	add hl,hl			;aa0c
	add hl,hl			;aa0d
	add hl,hl			;aa0e
	add hl,hl			;aa0f
	add hl,hl			;aa10
	ld de,06555h		;aa11   ; El pozo de sprites de la fase. El pintor de la fase de naves es este mismo hasta el ultimo byte salvo las direcciones -pozo, contador y destinos de salto- y UNA constante: el recorte de 0xAA3B, que alli es 0x50 y aqui 0x4F
	add hl,de			;aa14
	ex de,hl			;aa15
	pop hl			;aa16
	ld a,010h		;aa17   ; DIECISEIS filas...
	ld (0b13eh),a		;aa19   ; ...contadas en 0xB13E, el mismo bloc que usa el redibujado del fondo. No se pisan porque redibuja_fondo no llama a nadie que pinte sprites
	ld a,h			;aa1c   ; La fila llega subida 0x20 -el jugador anda con 0x68- y aqui se le quita para tener la fila del buffer
	sub 020h		;aa1d
	ld h,a			;aa1f
	ld a,l			;aa20   ; Los tres bits bajos de la X son el desplazamiento DENTRO del byte, de 0 a 7
	and 007h		;aa21
	jr z,L_AA2B		;aa23   ; Alineado al byte: el atajo, que mueve ocho bits cambiando registros de sitio
	dec a			;aa25   ; Tres bytes por peldano de la tira -`adc hl,hl` son dos y `adc a,a` uno- mas siete de arranque: el numero que hace entrar por el peldano justo
	ld c,a			;aa26
	add a,a			;aa27
	add a,c			;aa28
	add a,007h		;aa29
L_AA2B:
	ld (jr_fino_mascara24+1),a		;aa2b   ; El `jr` de la mascara...
	ld (jr_fino_dibujo24+1),a		;aa2e   ; ...y el del dibujo, los dos con el mismo numero. Asi el desplazamiento fino se paga UNA vez por sprite y no una por fila, que es de lo que va todo este invento
	srl l		;aa31   ; La X entre ocho: la columna en bytes
	srl l		;aa33
	srl l		;aa35
	call buffer_dir		;aa37   ; HL = 0x4000 + fila*24 + columna
pinta_fila_del_sprite:		; Una de las dieciseis filas: recorta si ha caido fuera del buffer y, si no, estampa la mascara con `and` y el dibujo con `or`
	ld a,h			;aa3a   ; Recorte por abajo: en cuanto la fila cae fuera del buffer no se estampa nada...
	cp 04fh		;aa3b
	jr c,sprite_lee_mascara		;aa3d
	inc de			;aa3f   ; ...pero los cuatro bytes de sprite se consumen igual -dos aqui y dos en 0xAAB1- y el destino avanza sus 24, para que la fila siguiente caiga donde debe
	inc de			;aa40
	inc hl			;aa41
	inc hl			;aa42
	jr sprite_fila_siguiente		;aa43
sprite_lee_mascara:		; Los dos bytes de mascara de la fila a la ventana de 24 bits, con A y el acarreo a UNOS: lo que entre por la derecha al desplazar tiene que ser "no tocar"
	ld a,0ffh		;aa45   ; A entero de unos, que es el relleno con el que se desplaza la mascara: lo que entre por la derecha tiene que querer decir "el fondo se queda como esta"
	push de			;aa47   ; El puntero al sprite y el destino, a la pila: los dos se recuperan mas abajo
	push hl			;aa48
	ex de,hl			;aa49
	ld d,(hl)			;aa4a   ; Los dos primeros bytes de la linea son la MASCARA, izquierdo y derecho...
	inc hl			;aa4b
	ld e,(hl)			;aa4c
	scf			;aa4d   ; ...y el `scf` pone el primer uno que va a entrar por la derecha, porque ni el `inc hl` ni el `ex de,hl` tocan el acarreo
	ex de,hl			;aa4e
jr_fino_mascara24:		; El `jr` cuyo operando parchea 0xAA2B: hace entrar en la tira por el peldano que da los 8-(X and 7) desplazamientos que tocan. Con operando 0 no salta y cae en el atajo de ocho
	jr jr_fino_mascara24		;aa4f   ; Aqui esta el operando que se parchea: el `jr` sin tocar salta sobre si mismo, y con el numero puesto entra en la tira por su peldano
atajo_mascara24:		; Desplazamiento de ocho de la mascara: A = H, H = L, L = 0xFF, sin recorrer la tira. Gemela de la de naves
	ld a,h			;aa51   ; Desplazar ocho no es desplazar: es mover los bytes de sitio. A se queda con el de la izquierda, H con el de la derecha y L se rellena de unos
	ld h,l			;aa52
	ld l,0ffh		;aa53
	jp sprite_estampa_mascara		;aa55
tira_mascara24:		; La tira de la mascara: siete `adc hl,hl / adc a,a` en los que se entra por el peldano n-1 para dar 8-n pasos, rellenando de unos (A=0xFF y `scf` a la entrada)
	adc hl,hl		;aa58   ; Cada peldano desplaza a la izquierda la ventana entera de 24 bits A:H:L: el bit que sale por arriba de HL entra por abajo de A, y por abajo de L entra el relleno
	adc a,a			;aa5a
	adc hl,hl		;aa5b   ; Se entra por el peldano que deja 8-(X and 7) pasos, con lo que el sprite acaba a (X and 7) pixeles del borde izquierdo de la ventana, que es justo donde se le quiere. Los otros tres desplazadores del bloque son esta misma tira con el relleno o el ancho cambiados
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
sprite_estampa_mascara:		; Vuelca los tres bytes de la ventana sobre el buffer con `and`, y de paso deja el puntero del sprite en el par del dibujo y el destino atras del todo
	ex de,hl			;aa6d   ; Las dos mitades bajas de la ventana pasan a DE...
	pop hl			;aa6e   ; ...y HL vuelve a ser el destino en el buffer
	and (hl)			;aa6f   ; La mascara va con `and` y va DIRECTA, sin invertir: en el pozo esta guardada ya al reves de como se suele contar -uno donde el fondo se deja en paz, cero donde el sprite pinta negro-, asi que el `and` abre el hueco sin gastar un `cpl`
	ld (hl),a			;aa70   ; El byte de la izquierda de la ventana, el primero de los tres del ancho de 24
	inc hl			;aa71   ; Tres bytes seguidos, 24 pixeles, para un sprite de 16: los 8 de sobra son el margen que hace falta para poder colocarlo en cualquier X
	ld a,d			;aa72
	and (hl)			;aa73
	ld (hl),a			;aa74
	inc hl			;aa75
	ld a,e			;aa76
	and (hl)			;aa77
	ld (hl),a			;aa78
	pop de			;aa79   ; El puntero al sprite...
	inc de			;aa7a   ; ...dos bytes mas alla, que es donde empieza el DIBUJO de esta misma linea
	inc de			;aa7b
	dec hl			;aa7c   ; Y el destino, atras del todo otra vez
	dec hl			;aa7d
	xor a			;aa7e   ; Ahora el relleno es de CEROS, y el mismo `xor a` limpia el acarreo: el dibujo se estampa con `or` y un cero es "aqui no pinto"
	push de			;aa7f
	push hl			;aa80
	ex de,hl			;aa81
	ld d,(hl)			;aa82
	inc hl			;aa83
	ld e,(hl)			;aa84
	ex de,hl			;aa85
jr_fino_dibujo24:		; El `jr` gemelo del de la mascara, parcheado por 0xAA2E con el mismo numero
	jr jr_fino_dibujo24		;aa86   ; El otro `jr` parcheado, con el mismo numero que el de la mascara
atajo_dibujo24:		; Desplazamiento de ocho del dibujo: A = H, H = L, L = 0x00
	ld a,h			;aa88   ; El atajo gemelo, cambiando los unos por ceros
	ld h,l			;aa89
	ld l,000h		;aa8a
	jp sprite_estampa_dibujo		;aa8c
tira_dibujo24:		; La misma tira para el dibujo: se entra con `xor a`, que pone A a cero y limpia el acarreo, o sea rellenando de ceros
	adc hl,hl		;aa8f   ; La tira gemela: los mismos siete peldanos, y lo unico distinto es con que se entra y que abajo se estampa con `or`
	adc a,a			;aa91
	adc hl,hl		;aa92   ; Siete peldanos como la de la mascara, ni uno mas: 8 es el maximo desplazamiento y ese se despacha con el atajo de arriba
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
sprite_estampa_dibujo:		; Los mismos tres bytes, ahora con `or`: el dibujo enciende lo blanco del sprite
	ex de,hl			;aaa4   ; Las dos mitades bajas, igual que en la mascara
	pop hl			;aaa5
	or (hl)			;aaa6   ; `or` en vez de `and`: el dibujo enciende lo blanco del sprite. Y no puede pisar lo que la mascara acaba de abrir, porque en las 96 entradas del pool -1536 lineas medidas- no hay ni una en la que el dibujo salga fuera de la mascara
	ld (hl),a			;aaa7
	inc hl			;aaa8
	ld a,d			;aaa9
	or (hl)			;aaaa
	ld (hl),a			;aaab
	inc hl			;aaac
	ld a,e			;aaad
	or (hl)			;aaae
	ld (hl),a			;aaaf
	pop de			;aab0
sprite_fila_siguiente:		; Consume el par del dibujo, baja una fila del buffer (22 mas los 2 que adelanto el estampado) y descuenta de las dieciseis
	inc de			;aab1   ; Los dos bytes del dibujo, consumidos
	inc de			;aab2
	ld bc,00016h		;aab3   ; Veintidos mas los dos que adelanto el estampado son los 24 del ancho del buffer: la fila de abajo
	add hl,bc			;aab6
	ld a,h			;aab7   ; Pasada la fila 0x58 -el borde del anillo de 24x256 bytes que arranca en 0x4000- H se queda clavado en 0xF1, y como cada fila empieza mirando `cp 04fh`, ahi se acaba de pintar el sprite. El pintor de glifos, con el mismo problema delante, hace lo contrario: cose el anillo y sigue
	add a,00fh		;aab8
	cp 067h		;aaba
	jr c,L_AABF		;aabc
	xor a			;aabe
L_AABF:
	sub 00fh		;aabf   ; Si no se ha pasado, este `sub` deshace el `add` de arriba y H sale como entro: la comprobacion no cuesta ni una instruccion de mas
	ld h,a			;aac1
	ld a,(0b13eh)		;aac2   ; Una fila menos de las dieciseis
	dec a			;aac5
	ret z			;aac6
	ld (0b13eh),a		;aac7
	jp pinta_fila_del_sprite		;aaca
buffer_dir:		; La direccion en el buffer de pantalla: HL = 0x4000 + fila*24 + columna. Identica byte a byte a la del bloque de naves
	push de			;aacd   ; Lo unico que hay que salvar es DE, que viene con el puntero al sprite
	ld a,l			;aace   ; L trae la columna y H la fila; se cambian de sitio para poder multiplicar la fila
	ld l,h			;aacf
	ld h,000h		;aad0
	ld d,h			;aad2
	ld e,l			;aad3
	add hl,hl			;aad4   ; Por dos, mas una, por dos, por dos y por dos: veinticuatro, el ancho del buffer
	add hl,de			;aad5
	add hl,hl			;aad6
	add hl,hl			;aad7
	add hl,hl			;aad8
	ld e,a			;aad9
	ld d,040h		;aada   ; El buffer empieza en 0x4000, que no tiene bits bajos: por eso la base y la columna se pueden sumar de una vez en el mismo `add`
	add hl,de			;aadc
	pop de			;aadd
	ret			;aade
pinta_glifo:		; Estampa en el buffer el glifo A de la fuente con el mismo esquema que pinta_sprite, con el desplazamiento fino parcheado
	push hl			;aadf   ; El mismo esquema que pinta_sprite de cabo a rabo, con dos cambios: el pozo es la fuente y las entradas miden 16 bytes
	ld h,000h		;aae0
	ld l,a			;aae2
	add hl,hl			;aae3   ; Cuatro veces por dos: 16 bytes por glifo, que son 8 filas de un byte de mascara y otro de dibujo
	add hl,hl			;aae4
	add hl,hl			;aae5
	add hl,hl			;aae6
	ld de,0820bh		;aae7
	add hl,de			;aaea
	ex de,hl			;aaeb
	pop hl			;aaec
	ld b,008h		;aaed   ; OCHO filas, y aqui el contador va en B: el glifo es corto y no hace falta la variable de 0xB13E
	ld a,h			;aaef   ; La misma resta de 0x20 de siempre
	sub 020h		;aaf0
	ld h,a			;aaf2
	ld a,l			;aaf3
	and 007h		;aaf4   ; Y el mismo desplazamiento fino, pero la tira de 16 bits gasta DOS bytes por peldano en vez de tres, asi que el numero es otro
	jr z,glifo_parchea_los_jr		;aaf6
	add a,a			;aaf8
	add a,004h		;aaf9
glifo_parchea_los_jr:		; Los dos `jr` del pintor de 16, 0xAB1A y 0xAB3F, con 2*(X and 7)+4: la tira de 16 bits gasta DOS bytes por peldano y no tres
	ld (jr_fino_mascara16+1),a		;aafb   ; Los dos `jr` de este pintor
	ld (jr_fino_dibujo16+1),a		;aafe
	srl l		;ab01   ; La X entre ocho, la columna en bytes
	srl l		;ab03
	srl l		;ab05
	call buffer_dir		;ab07
pinta_fila_del_glifo:		; Una de las ocho filas del glifo, con el mismo recorte por abajo que el pintor de sprites
	ld a,h			;ab0a   ; Recorte por abajo, igual que en el pintor de sprites...
	cp 04fh		;ab0b
	jr c,glifo_lee_mascara		;ab0d
	inc de			;ab0f   ; ...consumiendo los dos bytes de la fila, mascara y dibujo. Aqui no hace falta tocar HL porque el estampado de abajo lo deja donde lo encontro
	inc de			;ab10
	jr glifo_fila_siguiente		;ab11
glifo_lee_mascara:		; El unico byte de mascara de la fila a la ventana de 16 bits, con H de unos de relleno
	push hl			;ab13   ; El destino a la pila, que HL va a hacer de ventana
	ld a,(de)			;ab14   ; UN solo byte de mascara: los glifos son de 8 px de ancho
	ld h,0ffh		;ab15   ; H de unos, el relleno de "no tocar" que se va comiendo el desplazamiento
	ld l,a			;ab17
	inc de			;ab18
	scf			;ab19   ; Y el primer uno que entra por la derecha
jr_fino_mascara16:		; El `jr` que parchea 0xAAFB: el mismo truco del pintor de sprites, entrando en la tira de 16 bits por el peldano que toque
	jr jr_fino_mascara16		;ab1a   ; Igual que 0xAA4F, pero para la ventana de 16 bits
atajo_mascara16:		; Desplazamiento de ocho de la mascara de 16 bits: H = L, L = 0xFF. Aqui la ventana es de dos bytes y no hace falta arrastrar A
	ld h,l			;ab1c   ; Desplazar ocho es, otra vez, mover el byte de sitio sin tocar un solo bit
	ld l,0ffh		;ab1d
	jp glifo_estampa_mascara		;ab1f
tira_mascara16:		; La tira de 16 bits: siete `adc hl,hl` a secas, con el relleno de unos ya puesto en H
	adc hl,hl		;ab22   ; La ventana cabe entera en HL, asi que aqui sobra el `adc a,a` que la de 24 bits necesitaba para arrastrar su tercer byte
	adc hl,hl		;ab24
	adc hl,hl		;ab26
	adc hl,hl		;ab28
	adc hl,hl		;ab2a
	adc hl,hl		;ab2c
	adc hl,hl		;ab2e
glifo_estampa_mascara:		; Los dos bytes de la ventana sobre el buffer con `and`, y el destino de vuelta a la pila para el dibujo
	ld a,h			;ab30   ; Los dos bytes de la ventana, a A y a C
	ld c,l			;ab31
	pop hl			;ab32   ; Y vuelve el destino
	and (hl)			;ab33
	ld (hl),a			;ab34   ; Dos bytes, 16 pixeles, para un glifo de 8: el mismo margen y el mismo `and` que en los sprites
	inc hl			;ab35
	ld a,c			;ab36
	and (hl)			;ab37
	ld (hl),a			;ab38
	push hl			;ab39   ; El destino otra vez a la pila, que hace falta para el dibujo
	xor a			;ab3a   ; Cero de relleno y acarreo limpio, como en la de 24
	ld h,a			;ab3b
	ld a,(de)			;ab3c   ; El segundo byte de la linea es el dibujo
	inc de			;ab3d
	ld l,a			;ab3e
jr_fino_dibujo16:		; El `jr` gemelo del de la mascara, parcheado por 0xAAFE con el mismo numero
	jr jr_fino_dibujo16		;ab3f   ; El `jr` gemelo, con el mismo numero
atajo_dibujo16:		; Desplazamiento de ocho del dibujo de 16 bits: H = L, L = 0x00
	ld h,l			;ab41   ; El atajo de ocho del dibujo, con cero de relleno
	ld l,000h		;ab42
	jp glifo_estampa_dibujo		;ab44
tira_dibujo16:		; La tira de 16 bits del dibujo, siete peldanos, con el relleno de ceros puesto en H
	adc hl,hl		;ab47   ; Siete `adc hl,hl` y a estampar con `or`: la cuarta y ultima de las tiras del bloque, todas cortadas por el mismo patron
	adc hl,hl		;ab49   ; El relleno de ceros lo trae ya puesto H desde 0xAB3B, asi que el acarreo con el que se entra tiene que estar limpio
	adc hl,hl		;ab4b
	adc hl,hl		;ab4d
	adc hl,hl		;ab4f
	adc hl,hl		;ab51
	adc hl,hl		;ab53
glifo_estampa_dibujo:		; Los mismos dos bytes con `or`, escritos de derecha a izquierda para ahorrarse un `push`
	ld a,l			;ab55   ; Los dos bytes de la ventana del dibujo...
	ld c,h			;ab56
	pop hl			;ab57
	or (hl)			;ab58   ; ...estampados con `or`, y de derecha a izquierda: escribiendo primero el byte de la derecha y bajando con un `dec hl` se ahorra el `push` que haria falta para volver al principio
	ld (hl),a			;ab59
	dec hl			;ab5a
	ld a,c			;ab5b
	or (hl)			;ab5c
	ld (hl),a			;ab5d
glifo_fila_siguiente:		; Baja los 24 del ancho del buffer sumandolos a mano, y cose el anillo: en 0x5800 se vuelve a 0x4000
	ld a,l			;ab5e   ; Los 24 del ancho del buffer, sumados a mano
	add a,018h		;ab5f
	ld l,a			;ab61
	jr nc,L_AB6C		;ab62   ; Lo normal es que no se lleve nada y no haya que tocar H
	inc h			;ab64
	ld a,h			;ab65
	cp 058h		;ab66   ; Y si se lleva, el anillo: 0x5800 es 0x4000 mas 24*256, o sea las 256 filas que caben en un byte de fila, y ahi se vuelve al principio del buffer. Este pintor cose el borde; el de sprites, en 0xAAB7, prefiere dejar de pintar
	jr nz,L_AB6C		;ab68
	ld h,040h		;ab6a
L_AB6C:
	djnz pinta_fila_del_glifo		;ab6c   ; Las ocho filas del glifo
	ret			;ab6e
gira_rumbo:		; Acerca el rumbo actual (bits 0-2) al pedido (bits 5-7) un octavo por vez y por el lado corto, y lo aplica en el acto: aqui no hay el contador de espera que si tiene la nave
	ld b,a			;ab6f   ; El rumbo cabe en un byte: los bits 0-2 son hacia donde va y los 5-7 hacia donde quiere ir
	and 007h		;ab70   ; El de ahora, a E
	ld e,a			;ab72
	ld a,b			;ab73
	rlca			;ab74   ; Tres rotaciones bajan los bits 5-7 al 0-2, y asi el pedido se lee con la misma mascara que el actual
	rlca			;ab75
	rlca			;ab76
	and 007h		;ab77
	sub e			;ab79   ; Lo que le falta de vuelta, en octavos y del 0 al 7
	and 007h		;ab7a
	jr nz,L_AB80		;ab7c   ; Si ya coincide no hay nada que girar, y el byte sale como entro
	ld a,b			;ab7e
	ret			;ab7f
L_AB80:
	cp 005h		;ab80   ; De 1 a 4 se sube y de 5 a 7 se baja: siempre el lado corto. La media vuelta justa -el 4- cae del lado de subir, porque el `cp` aun deja acarreo
	ld c,0ffh		;ab82
	jr nc,L_AB88		;ab84
	ld c,001h		;ab86
L_AB88:
	ld a,e			;ab88   ; Un octavo, y otra vez modulo 8 para que el 7 y el 0 sean vecinos
	add a,c			;ab89
	and 007h		;ab8a
	ld e,a			;ab8c
	ld a,b			;ab8d
	and 0f8h		;ab8e   ; Se guarda todo lo demas del byte -el pedido y el bit 3- y solo se cambia el rumbo actual: por eso el pedido sigue ahi para el cuadro siguiente
	or e			;ab90
	ret			;ab91
rumbo_a_mascara:		; Traduce el rumbo A a su mascara de movimiento por la tabla de 0xAD0F
	ld de,0ad0fh		;ab92   ; Los ocho rumbos en el sentido de las agujas del reloj empezando por arriba: 0 arriba (0x02), 1 arriba-derecha (0x06), 2 derecha (0x04), 3 abajo-derecha (0x05), 4 abajo (0x01), 5 abajo-izquierda (0x09), 6 izquierda (0x08) y 7 arriba-izquierda (0x0A). Es la misma tabla que la 0xC9A4 de la fase de naves, byte a byte
	jp L_AB9B		;ab95
rumbo_a_mascara2:		; Lo mismo por la tabla de 0xAD17, la otra de las dos que hay
	ld de,0ad17h		;ab98   ; Y la vuelta, indexada por los cuatro bits de la mascara: la que anula el eje que se contradice. Tambien identica a su gemela, la 0xC9AC
L_AB9B:
	push hl			;ab9b   ; El indice viene en A y la tabla en DE, asi que las dos entradas se reparten un solo cuerpo de siete instrucciones
	ld l,a			;ab9c
	ld h,000h		;ab9d
	add hl,de			;ab9f
	ld a,(hl)			;aba0
	pop hl			;aba1
	ret			;aba2
aplica_rumbo:		; Aplica la mascara de rumbo: bits 0/1 mueven la vertical, 2/3 la horizontal; sin recorte
	push hl			;aba3
	call rumbo_a_mascara		;aba4   ; De rumbo a mascara, que es un bit por sentido
	ld de,00000h		;aba7   ; DE es el paso que se va a dar, y arranca a cero por si la mascara no pide nada
	pop hl			;abaa
	rrca			;abab   ; Bit 0, bajar: la fila se lleva B
	jr nc,L_ABAF		;abac
	ld d,b			;abae
L_ABAF:
	rrca			;abaf   ; Bit 1, subir: la misma B, negada. Desde la tabla de rumbos los dos bits nunca vienen juntos, pero si vinieran ganaria este
	jr nc,L_ABB8		;abb0
	push af			;abb2
	ld a,b			;abb3
	neg		;abb4
	ld d,a			;abb6
	pop af			;abb7
L_ABB8:
	rrca			;abb8   ; Bit 2, derecha: la columna se lleva C
	jr nc,L_ABBC		;abb9
	ld e,c			;abbb
L_ABBC:
	rrca			;abbc   ; Bit 3, izquierda: la misma C, negada
	jr nc,L_ABC3		;abbd
	ld a,c			;abbf
	neg		;abc0
	ld e,a			;abc2
L_ABC3:
	ld a,h			;abc3   ; Y las dos sumas de una vez, con H de fila y L de columna. Aqui no se recorta nada: quien llama mira despues si se ha salido
	add a,d			;abc4
	ld h,a			;abc5
	ld a,l			;abc6
	add a,e			;abc7
	ld l,a			;abc8
	ret			;abc9
rumbo_al_jugador:		; La direccion dominante hacia DE (el jugador), como mascara de bits de rumbo
	ld a,b			;abca   ; Fila del bicho menos fila del jugador...
	sub d			;abcb
	jr c,L_ABD3		;abcc
	ld h,002h		;abce   ; ...y si el bicho esta mas abajo, el sentido es subir
	jp L_ABD7		;abd0
L_ABD3:
	ld h,001h		;abd3   ; Y si esta mas arriba, bajar, con la resta al derecho para quedarse con la distancia a secas
	neg		;abd5
L_ABD7:
	ld d,a			;abd7
	ld a,c			;abd8   ; Lo mismo con las columnas: el bicho a la derecha del jugador pide izquierda, y a la izquierda, derecha
	sub e			;abd9
	jr c,L_ABE1		;abda
	ld l,008h		;abdc
	jp L_ABE5		;abde
L_ABE1:
	ld l,004h		;abe1
	neg		;abe3
L_ABE5:
	ld e,a			;abe5
	ld b,a			;abe6   ; Dos veces y media la distancia horizontal, con un desplazamiento y dos sumas. Y 2,5 es la aproximacion barata de 1+raiz(2) = 2,4142, que es la cotangente de 22,5 grados, o sea el reparto exacto de la rosa de ocho vientos
	srl b		;abe7
	add a,a			;abe9
	jr c,L_ABF4		;abea   ; Si al doblarla ya no cabe en el byte, la horizontal manda de calle y no hace falta comparar
	add a,b			;abec
	jr c,L_ABF4		;abed
	cp d			;abef   ; Vale la horizontal si 2,5 veces su distancia llega a la vertical
	ld c,000h		;abf0   ; Y si no llega, se cae y no entra en el resultado
	jr c,L_ABF5		;abf2
L_ABF4:
	ld c,l			;abf4
L_ABF5:
	ld a,d			;abf5   ; Y otra vez lo mismo con los papeles cambiados, para la vertical
	ld b,a			;abf6
	srl b		;abf7
	add a,a			;abf9
	jr c,L_AC02		;abfa
	add a,b			;abfc
	jr c,L_AC02		;abfd
	cp e			;abff
	ld a,c			;ac00
	ret c			;ac01   ; Si la vertical no cuenta, sale el sentido horizontal a secas, que es uno de los cuatro rectos
L_AC02:
	ld a,c			;ac02
	or h			;ac03   ; Y si cuentan los dos, la diagonal. Con el factor 2,5 los ocho sectores salen casi iguales: 43,6 grados los cuatro rectos y 46,4 los cuatro diagonales
	ld c,a			;ac04
	ret			;ac05
azar:		; El generador de azar: lee tres bytes de la ROM del BIOS (ventana 0x2000-0x3FFF, puntero en 0xAD28) y los mezcla
	push hl			;ac06
	ld hl,(0ad28h)		;ac07   ; La semilla no es un numero, es un PUNTERO que se pasea por la ROM del BIOS
	ld a,h			;ac0a
	and 01fh		;ac0b   ; Se le encaja el rango 0x2000-0x3FFF, la mitad alta de la BIOS, que como tabla de ruido sobra
	or 020h		;ac0d
	ld h,a			;ac0f
	ld a,000h		;ac10   ; El acumulador arranca a cero...
	xor (hl)			;ac12   ; ...y se traga tres bytes seguidos a golpe de `xor`
	inc hl			;ac13
	xor (hl)			;ac14
	inc hl			;ac15
	xor (hl)			;ac16
	inc hl			;ac17
	add a,h			;ac18   ; Y encima se mezcla la propia direccion, sumando el byte alto y restando el bajo: asi dos ventanas de bytes iguales no dan lo mismo
	sub l			;ac19
	ld (0ad28h),hl		;ac1a   ; El puntero avanza de tres en tres y queda guardado para la llamada siguiente
	pop hl			;ac1d
	ret			;ac1e
borra_buffer:		; Borra los 3840 bytes del buffer con la PILA: SP al final (0x4F00) y 80 vueltas de 24 `push de`, que son 3840 bytes justos
	ld hl,00000h		;ac1f   ; La pila se va a usar de brocha, asi que lo primero es guardarsela
	add hl,sp			;ac22
	di			;ac23   ; Y con SP fuera de sitio no puede entrar una interrupcion
	ld sp,04f00h		;ac24   ; Se apunta al FINAL del buffer, porque `push` escribe hacia atras
	ld b,050h		;ac27   ; Ochenta vueltas...
	ld de,00000h		;ac29
L_AC2C:
	push de			;ac2c   ; ...de veinticuatro `push` de dos bytes: 80 x 24 x 2 son los 3840 del buffer, o sea de 0x4000 a 0x4EFF. Sale a 5,7 ciclos por byte contando el `djnz`, cuando un `ldir` cuesta 21: cuatro veces mas
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
	ld sp,hl			;ac46   ; SP a su sitio, y ya se puede volver a interrumpir
	ei			;ac47
	ret			;ac48
alta_enemigo:		; Mete un enemigo andante en la tabla de 0xACE4 (contador 0xACE3, tope 4, entradas de 5 B) con el rumbo sacado del azar, y suena 0xCE35 en el canal 0
	ld hl,0ace3h		;ac49   ; Los andantes vivos, con tope cuatro
	ld a,(hl)			;ac4c
	cp 004h		;ac4d
	ret nc			;ac4f   ; Lleno: no entra, y se vuelve sin acarreo
	inc (hl)			;ac50   ; El hueco es el que dice el contador, que ademas es el numero de fichas
	ld h,000h		;ac51   ; Fichas de cinco bytes: indice*5 con dos `add hl,hl` y la suma del propio indice
	ld l,a			;ac53
	ld d,h			;ac54
	ld e,l			;ac55
	add hl,hl			;ac56
	add hl,hl			;ac57
	add hl,de			;ac58
	ld de,0ace4h		;ac59
	add hl,de			;ac5c
	ld (hl),c			;ac5d   ; Los dos primeros campos son la posicion que traen BC: X en el +0 e Y en el +1
	inc hl			;ac5e
	ld (hl),b			;ac5f
	inc hl			;ac60
	call azar		;ac61   ; El bit 5 del tercer campo se echa a suertes, y es el que elige entre los dos juegos de dibujos del pool; lo demas es fijo, y sus bits 0-2 dejan el rumbo en 4, mirando abajo
	and 020h		;ac64
	or 014h		;ac66
	ld (hl),a			;ac68
	inc hl			;ac69
	ld (hl),000h		;ac6a   ; El cuarto campo, el reloj que decide cuando volver a apuntar, arranca a cero
	inc hl			;ac6c
	ex af,af'			;ac6d   ; Y el quinto lo trae A', que aqui no lo lee nadie
	ld (hl),a			;ac6e
	xor a			;ac6f   ; El canal 0, para el guion de 0xCE35
	ld de,0ce35h		;ac70
	call arranca_guion_libre		;ac73
	scf			;ac76   ; Acarreo: ha entrado
	ret			;ac77
lanza_tiro_torreta:		; Mete un tiro de torreta en la tabla 0xAD04 si hay hueco (max 2), con su sonido
	ld hl,0ad03h		;ac78   ; Los tiros de torreta vivos, con tope dos
	ld a,(hl)			;ac7b
	cp 002h		;ac7c
	ret nc			;ac7e
	inc (hl)			;ac7f   ; Mismo reparto que los andantes -indice*5 sobre la tabla-, pero con los campos en otro orden
	ld h,000h		;ac80
	ld l,a			;ac82
	ld d,h			;ac83
	ld e,l			;ac84
	add hl,hl			;ac85
	add hl,hl			;ac86
	add hl,de			;ac87
	ld de,0ad04h		;ac88
	add hl,de			;ac8b
	ld (hl),005h		;ac8c   ; El +0 es la velocidad horizontal, y arranca en 5, que es justo el tope al que satura persigue_con_inercia. Este mismo byte es despues el contador de la explosion: cuando el tiro alcanza al jugador, 0xBA43 le planta un 0x7C
	inc hl			;ac8e
	ex af,af'			;ac8f   ; El +1 es la velocidad vertical, la que traiga A'
	ld (hl),a			;ac90
	inc hl			;ac91
	ld (hl),c			;ac92   ; Y el +2 y el +3, la posicion de salida
	inc hl			;ac93
	ld (hl),b			;ac94
	inc hl			;ac95
	ld (hl),000h		;ac96   ; El +4 arranca a cero y va BAJANDO, asi que da la vuelta en el primer `dec`: desde 0xFF hasta 0xB4 el tiro persigue al jugador -76 cuadros-, y por debajo de eso apunta al punto fijo de 0xFF60
	ld a,001h		;ac98   ; El canal 1, para el guion de 0xCD91
	ld de,0cd91h		;ac9a
	call arranca_guion_libre		;ac9d
	scf			;aca0
	ret			;aca1

; ----------------------------------------------------------------------
; DATOS contador_tiros_enemigos: Cuantos tiros enemigos hay volando (1 B, tope
;   6). Va DELANTE de su tabla, y por eso mueve_tabla_disparos lo lee con
;   (ix-001h)
;   0xaca2..0xaca3  (1 bytes)
DATA_contador_tiros_enemigos:
	defb 000h	; aca2

; ----------------------------------------------------------------------
; DATOS tabla_tiros_enemigos: Los tiros enemigos, seis fichas de 4 B (24 B):
;   X, Y, rumbo -0x80 es la marca de muerto- y un cuarto byte que no escribe
;   ni lee nadie. Las mueve mueve_tabla_disparos a 4 pixeles por cuadro y las
;   da de alta alta_tiro_enemigo
;   0xaca3..0xacbb  (24 bytes)
DATA_tabla_tiros_enemigos:
	defb 0ffh,0ffh,0ffh,0ffh	; aca3
	defb 0ffh,0ffh,0ffh,0ffh	; aca7
	defb 0ffh,0ffh,0ffh,0ffh	; acab
	defb 0ffh,0ffh,0ffh,0ffh	; acaf
	defb 0ffh,0ffh,0ffh,0ffh	; acb3
	defb 0ffh,0ffh,0ffh,0ffh	; acb7

; ----------------------------------------------------------------------
; DATOS contador_disparos_jugador: Cuantos disparos del jugador hay volando (1
;   B, tope 9)
;   0xacbb..0xacbc  (1 bytes)
DATA_contador_disparos_jugador:
	defb 000h	; acbb

; ----------------------------------------------------------------------
; DATOS tabla_disparos_jugador: Los disparos del jugador, nueve fichas de 4 B
;   (36 B), con el mismo reparto que los enemigos pero a 10 pixeles por cuadro
;   0xacbc..0xace0  (36 bytes)
DATA_tabla_disparos_jugador:
	defb 0ffh,0ffh,0ffh,0ffh	; acbc
	defb 0ffh,0ffh,0ffh,0ffh	; acc0
	defb 0ffh,0ffh,0ffh,0ffh	; acc4
	defb 0ffh,0ffh,0ffh,0ffh	; acc8
	defb 0ffh,0ffh,0ffh,0ffh	; accc
	defb 0ffh,0ffh,0ffh,0ffh	; acd0
	defb 0ffh,0ffh,0ffh,0ffh	; acd4
	defb 0ffh,0ffh,0ffh,0ffh	; acd8
	defb 0ffh,0ffh,0ffh,0ffh	; acdc

; ----------------------------------------------------------------------
; DATOS trabajo_mueve_disparos: Lo que aparca mueve_tabla_disparos para
;   atender a las dos tablas con el mismo codigo (3 B): 0xACE0/0xACE1 donde
;   acaba la tabla que toca y 0xACE2 cual de las dos es (5 la de enemigos, 4
;   la del jugador)
;   0xace0..0xace3  (3 bytes)
DATA_trabajo_mueve_disparos:
	defb 000h,000h,000h	; ace0

; ----------------------------------------------------------------------
; DATOS contador_andantes: Cuantos enemigos andantes hay vivos (1 B, tope 4)
;   0xace3..0xace4  (1 bytes)
DATA_contador_andantes:
	defb 000h	; ace3

; ----------------------------------------------------------------------
; DATOS tabla_andantes: Los enemigos ANDANTES, cuatro fichas de 5 B (20 B): X,
;   Y, rumbo con banderas -el bit 5 elige entre los dos juegos de dibujos-,
;   reloj (por debajo de 0x14 dice cuando volver a apuntar, de 0x1D en
;   adelante es el contador de la explosion) y un quinto que escribe
;   alta_enemigo y que no lee nadie
;   0xace4..0xacf8  (20 bytes)
DATA_tabla_andantes:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh	; ace4
	defb 0ffh,0ffh,0ffh,0ffh,0ffh	; ace9
	defb 0ffh,0ffh,0ffh,0ffh,0ffh	; acee
	defb 0ffh,0ffh,0ffh,0ffh,0ffh	; acf3

; ----------------------------------------------------------------------
; DATOS contador_voladores: Cuantos voladores hay vivos (1 B, tope 2)
;   0xacf8..0xacf9  (1 bytes)
DATA_contador_voladores:
	defb 000h	; acf8

; ----------------------------------------------------------------------
; DATOS tabla_voladores: Los VOLADORES, dos fichas de 5 B (10 B): velocidad
;   horizontal, velocidad vertical en los bits 0-5 con sesgo de 4 mas la fase
;   del aleteo en los dos altos, X, Y y estado
;   0xacf9..0xad03  (10 bytes)
DATA_tabla_voladores:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh	; acf9
	defb 0ffh,0ffh,0ffh,0ffh,0ffh	; acfe

; ----------------------------------------------------------------------
; DATOS contador_tiros_torreta: Cuantos tiros de torreta hay volando (1 B,
;   tope 2)
;   0xad03..0xad04  (1 bytes)
DATA_contador_tiros_torreta:
	defb 000h	; ad03

; ----------------------------------------------------------------------
; DATOS tabla_tiros_torreta: Los tiros de las torretas, dos fichas de 5 B (10
;   B): velocidad horizontal -que al alcanzar al jugador se recicla como
;   contador de la explosion, ver 0xBA43-, velocidad vertical, X, Y y el reloj
;   que decrece y decide cuando dejan de perseguir
;   0xad04..0xad0e  (10 bytes)
DATA_tabla_tiros_torreta:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh	; ad04
	defb 0ffh,0ffh,0ffh,0ffh,0ffh	; ad09

; ----------------------------------------------------------------------
; DATOS animacion_del_jugador: El fotograma del protagonista (1 B). Es la
;   quinta de las tablas que pone a cero el reinicio de 0xA2E4
;   0xad0e..0xad0f  (1 bytes)
DATA_animacion_del_jugador:
	defb 000h	; ad0e

; ----------------------------------------------------------------------
; DATOS tabla_rumbo_a_mascara: De rumbo a mascara, las OCHO direcciones en el
;   sentido de las agujas del reloj empezando por arriba (8 B): 0 arriba
;   (0x02), 1 arriba-derecha (0x06), 2 derecha (0x04), 3 abajo-derecha (0x05),
;   4 abajo (0x01), 5 abajo-izquierda (0x09), 6 izquierda (0x08) y 7
;   arriba-izquierda (0x0A). La lee rumbo_a_mascara (0xAB92), y es BYTE A BYTE
;   la misma que la 0xC9A4 de la fase de naves
;   0xad0f..0xad17  (8 bytes)
DATA_tabla_rumbo_a_mascara:
	defb 002h	; ad0f
	defb 006h	; ad10
	defb 004h	; ad11
	defb 005h	; ad12
	defb 001h	; ad13
	defb 009h	; ad14
	defb 008h	; ad15
	defb 00ah	; ad16

; ----------------------------------------------------------------------
; DATOS tabla_mascara_a_rumbo: La vuelta: de mascara a rumbo, indexada por los
;   cuatro bits (16 B). La lee rumbo_a_mascara2 (0xAB98). Las mascaras que se
;   contradicen no son un descuido -el eje que se anula se cae y queda el
;   otro: 0x07, arriba+abajo+derecha, da 2, que es derecha- y solo las cuatro
;   en las que no sobrevive nada -0x00, 0x03, 0x0C y 0x0F- valen 0xFF. Tambien
;   identica a su gemela de la fase de naves, la 0xC9AC
;   0xad17..0xad27  (16 bytes)
DATA_tabla_mascara_a_rumbo:
	defb 0ffh	; ad17
	defb 004h	; ad18
	defb 000h	; ad19
	defb 0ffh	; ad1a
	defb 002h	; ad1b
	defb 003h	; ad1c
	defb 001h	; ad1d
	defb 002h	; ad1e
	defb 006h	; ad1f
	defb 005h	; ad20
	defb 007h	; ad21
	defb 006h	; ad22
	defb 0ffh	; ad23
	defb 004h	; ad24
	defb 000h	; ad25
	defb 0ffh	; ad26

; ----------------------------------------------------------------------
; DATOS variables_de_cuadro: Lo que cambia cada cuadro (10 B): 0xAD27 contador
;   de cuadros global (parpadeo del DEMO y ritmo de la cuenta atras),
;   0xAD28/29 semilla del azar -que es un puntero paseandose por la ROM del
;   BIOS, no un numero-, 0xAD2A/0xAD2C la camara (fila del mapa mas scroll
;   fino; 0xAD2B no lo toca nadie) y 0xAD2D-0xAD30 el trabajo del redibujado
;   0xad27..0xad31  (10 bytes)
DATA_variables_de_cuadro:
	defb 000h,000h,000h,00eh,000h,020h,000h,000h,000h,000h	; ad27  ..... ....

; ======================================================================
; CODIGO 0xad31..0xb13e  (1037 bytes)
; ======================================================================


persigue_con_inercia:		; Guia un tiro de torreta: una de cada dos veces empuja la velocidad BC un paso hacia el blanco con tope mas menos cinco, y siempre la suma a la posicion; si la columna se sale repone la X guardada y rebota negando C. Es vaga_o_persigue con velocidades en pixeles y otros topes
	ld (0b13eh),hl		;ad31   ; La posicion de partida, guardada por si hay que rebotar
	call azar		;ad34   ; Solo una de cada dos veces se corrige el rumbo: asi el tiro conserva inercia y describe una curva en vez de una linea quebrada
	and 001h		;ad37
	jr z,L_AD67		;ad39
	ld a,h			;ad3b   ; La fila del tiro contra la del blanco...
	cp d			;ad3c
	ld a,b			;ad3d
	jr nc,L_AD48		;ad3e
	add a,005h		;ad40   ; ...y la velocidad vertical sube un paso, saturando en +5
	cp 00ah		;ad42
	adc a,000h		;ad44
	jr L_AD4E		;ad46
L_AD48:
	add a,005h		;ad48   ; O baja uno, saturando en -5. El sesgo de cinco es lo que permite hacer las dos cosas con comparaciones sin signo
	cp 001h		;ad4a
	adc a,0ffh		;ad4c
L_AD4E:
	sub 005h		;ad4e   ; Quitado el sesgo, la velocidad vuelve a su rango de -5 a +5
	ld b,a			;ad50
	ld a,l			;ad51   ; Y lo mismo con la columna
	cp e			;ad52
	ld a,c			;ad53
	jr nc,L_AD5E		;ad54
	add a,005h		;ad56
	cp 00ah		;ad58
	adc a,000h		;ad5a
	jr L_AD64		;ad5c
L_AD5E:
	add a,005h		;ad5e
	cp 001h		;ad60
	adc a,0ffh		;ad62
L_AD64:
	sub 005h		;ad64
	ld c,a			;ad66
L_AD67:
	add hl,bc			;ad67   ; El paso, sea el de siempre o el recien corregido
	ld a,l			;ad68   ; Y el recorte, solo en la columna: aqui el ancho util es 0xB8, ocho mas que el que usan los bichos en vaga_o_persigue
	cp 0b8h		;ad69
	jr c,L_AD75		;ad6b
	ld a,(0b13eh)		;ad6d   ; Se repone la X de partida y se niega la velocidad horizontal: el tiro rebota contra el lado en vez de morir
	ld l,a			;ad70
	ld a,c			;ad71
	neg		;ad72
	ld c,a			;ad74
L_AD75:
	ret			;ad75
mueve_disparos:		; Pasa las DOS tablas de disparos por el mismo motor parcheando antes el paso en el `ld bc` de 0xADC4: los tiros enemigos a 4 pixeles por cuadro y los del jugador a 10. El 0x0707 que trae el binario no lo usa nadie
	ld ix,ladc4h		;ad76   ; Las dos tablas de disparos pasan por el mismo motor, y lo unico que cambia es el paso: se parchea EN CALIENTE el operando del `ld bc` de 0xADC4
	ld (ix+001h),004h		;ad7a   ; Los tiros enemigos, a cuatro pixeles por cuadro en los dos ejes
	ld (ix+002h),004h		;ad7e
	ld ix,0aca3h		;ad82   ; Tabla de 0xACA3, que acaba en 0xACBB, con seis fichas de tope
	ld hl,0acbbh		;ad86
	ld a,005h		;ad89
	call mueve_tabla_disparos		;ad8b
	ld ix,ladc4h		;ad8e   ; Y los del jugador a diez, dos veces y media mas rapidos que los enemigos
	ld (ix+001h),00ah		;ad92
	ld (ix+002h),00ah		;ad96
	ld ix,0acbch		;ad9a   ; Tabla de 0xACBC, que acaba en 0xACE0, con nueve de tope
	ld hl,0ace0h		;ad9e
	ld a,004h		;ada1
mueve_tabla_disparos:		; El motor comun de las dos tablas: suma el scroll del cuadro a la fila, mueve con el paso parcheado, pinta el glifo y da de baja al que traiga 0x80 en el rumbo o se salga (fila 0xC0, columna 0xBC), compactando con un `ldir`
	ld (0ace0h),hl		;ada3   ; El motor comun aparca en 0xACE0 donde acaba la tabla y en 0xACE2 cual de las dos es, que es lo que la baja necesita para compactar
	ld (0ace2h),a		;ada6
	ld a,(ix-001h)		;ada9   ; El contador vive UN byte por delante de la tabla, de ahi el indice negativo
	and a			;adac
	ret z			;adad
	ld b,a			;adae
L_ADAF:
	push bc			;adaf
	ld a,(0c462h)		;adb0   ; El scroll del cuadro se le suma a la fila: los disparos van clavados al mundo, no a la pantalla
	add a,(ix+001h)		;adb3
	ld (ix+001h),a		;adb6
	ld l,(ix+000h)		;adb9   ; La posicion, con L de columna y H de fila
	ld h,a			;adbc
	ld a,(ix+002h)		;adbd   ; El rumbo a 0x80 exacto es la marca de muerto, que pone quien acierta el impacto
	cp 080h		;adc0
	jr z,L_ADE8		;adc2
L_ADC4:
	ld bc,00707h		;adc4   ; Aqui esta el operando que se parchea. El 0x0707 que trae el binario no lo escribe nadie: los dos llamantes lo pisan antes de entrar
	call aplica_rumbo		;adc7
	ld a,h			;adca   ; Fuera por abajo...
	cp 0c0h		;adcb
	jr nc,L_ADE8		;adcd
	ld a,l			;adcf   ; ...o por la derecha, y en los dos casos se da de baja
	cp 0bch		;add0
	jr nc,L_ADE8		;add2
	ld (ix+000h),l		;add4   ; La posicion nueva, ya buena, vuelve a la ficha
	ld (ix+001h),h		;add7
	ld a,002h		;adda   ; El glifo del disparo, que es el dibujo 2
	call pinta_glifo		;addc
	ld de,00004h		;addf   ; Cuatro bytes por ficha, no cinco: estas dos tablas son mas estrechas que las de bichos, y su cuarto byte no lo escribe ni lo lee nadie
	add ix,de		;ade2
L_ADE4:
	pop bc			;ade4
	djnz L_ADAF		;ade5
	ret			;ade7
L_ADE8:
	ld a,(0ace2h)		;ade8   ; La baja: primero, cual de los dos contadores hay que bajar
	cp 005h		;adeb
	ld hl,0aca2h		;aded
	jr z,L_ADF5		;adf0
	ld hl,0acbbh		;adf2
L_ADF5:
	dec (hl)			;adf5   ; Una ficha menos
	pop bc			;adf6
	push bc			;adf7
	ld a,b			;adf8   ; Si la que muere es la ultima que quedaba por mirar, no hay nada que mover
	cp 001h		;adf9
	jp z,L_ADE4		;adfb
	push ix		;adfe   ; El compactado: se trae encima todo lo que va detras de la ficha muerta...
	pop de			;ae00
	push de			;ae01
	inc de			;ae02
	inc de			;ae03
	inc de			;ae04
	inc de			;ae05
	ld hl,(0ace0h)		;ae06   ; ...y lo que se mueve es lo que va de la ficha siguiente al final de la tabla
	and a			;ae09
	sbc hl,de		;ae0a
	ld b,h			;ae0c
	ld c,l			;ae0d
	ex de,hl			;ae0e
	pop de			;ae0f
	ldir		;ae10   ; Un `ldir` y hueco cerrado. IX no avanza, asi que la ficha que ocupa el sitio se mira en la vuelta siguiente y no se salta ninguna
	jp L_ADE4		;ae12
alta_tiro_enemigo:		; Mete un tiro enemigo en la tabla de 0xACA3 (contador 0xACA2, tope 6) con el guion 0xCD5F en el canal 1. Es la COLA de alta_enemigo de la fase de naves -7 de 11 bytes iguales desde 0xCC98- SIN la tirada de dificultad por zona que aquella lleva delante, que aqui no tendria de donde sacar la zona
	ld hl,0aca2h		;ae15   ; Los tiros enemigos: contador en 0xACA2, tope seis...
	ld e,006h		;ae18
	exx			;ae1a
	ld h,001h		;ae1b   ; ...canal 1 y guion 0xCD5F
	ld de,0cd5fh		;ae1d
	jp alta_en_tabla		;ae20
alta_objeto_acbb:		; Mete un objeto en la tabla de 0xACBB (tope 9) con el sonido 0xCD53 al canal 2: los mismos tope y canal que su gemela de la fase de naves
	ld hl,0acbbh		;ae23   ; Y los del jugador: contador en 0xACBB, tope nueve...
	ld e,009h		;ae26
	exx			;ae28
	ld h,002h		;ae29   ; ...canal 2 y guion 0xCD53
	ld de,0cd53h		;ae2b
alta_en_tabla:		; El alta comun a las tablas: si el contador no ha llegado al tope, lo incrementa, arranca el sonido DE en el canal H y escribe C, B y A' en la entrada indice*4. Vuelve con carry si ha entrado
	exx			;ae2e   ; El juego alterno lleva el contador y el tope, que es lo unico que distingue a las dos entradas
	ld a,(hl)			;ae2f
	cp e			;ae30   ; Lleno: no entra, y sin acarreo
	ret nc			;ae31
	exx			;ae32
	push af			;ae33   ; El sonido se arranca ANTES de escribir la ficha, aunque para eso haya que pasear A por la pila
	ld a,h			;ae34
	call arranca_guion_libre		;ae35
	pop af			;ae38
	exx			;ae39
	inc (hl)			;ae3a   ; Una ficha mas, y la tabla empieza justo detras del contador
	ld e,l			;ae3b
	ld d,h			;ae3c
	inc de			;ae3d
	ld h,000h		;ae3e   ; Cuatro bytes por ficha: dos `add hl,hl` y ya
	ld l,a			;ae40
	add hl,hl			;ae41
	add hl,hl			;ae42
	add hl,de			;ae43
	ld (hl),c			;ae44   ; Posicion en el +0 y el +1, y en el +2 el rumbo que trae A'. El +3 ni se toca
	inc hl			;ae45
	ld (hl),b			;ae46
	inc hl			;ae47
	ex af,af'			;ae48
	ld (hl),a			;ae49
	scf			;ae4a   ; Acarreo: ha entrado
	ret			;ae4b
vaga_o_persigue:		; Tres de cada cuatro veces deja al enemigo yendo recto y la cuarta -cuando el azar and 3 da cero- empuja su velocidad un paso hacia el jugador, un eje cada vez. (Aqui puso "la suma modular de ocho direcciones" y no lo es: `add a,004h / cp 008h / adc a,000h / sub 004h` sube uno SATURANDO en +4, y su pareja `cp 001h / adc a,0ffh` baja uno saturando en -4. Y B y C no son rumbos, son velocidades en pixeles)
	ld (0b13eh),hl		;ae4c   ; La posicion de partida, por si hay que deshacer el paso
	call azar		;ae4f   ; Tres de cada cuatro veces se sigue recto...
	and 003h		;ae52
	jr z,L_AE5A		;ae54
	add hl,bc			;ae56   ; ...y esas tres solo cuestan una suma
	jp L_AE87		;ae57
L_AE5A:
	ld a,h			;ae5a   ; La cuarta se corrige, un eje cada vez. La fila del bicho contra la del jugador...
	cp d			;ae5b
	ld a,b			;ae5c
	jr nc,L_AE67		;ae5d
	add a,004h		;ae5f   ; ...y la velocidad vertical sube un paso, saturando en +4
	cp 008h		;ae61
	adc a,000h		;ae63
	jr L_AE6D		;ae65
L_AE67:
	add a,004h		;ae67   ; O baja uno, saturando en -4
	cp 001h		;ae69
	adc a,0ffh		;ae6b
L_AE6D:
	sub 004h		;ae6d   ; El sesgo de cuatro, quitado: la velocidad vuelve a su rango de -4 a +4
	ld b,a			;ae6f
	ld a,l			;ae70   ; Y otra vez con la columna
	cp e			;ae71
	ld a,c			;ae72
	jr nc,L_AE7D		;ae73
	add a,004h		;ae75
	cp 008h		;ae77
	adc a,000h		;ae79
	jr L_AE83		;ae7b
L_AE7D:
	add a,004h		;ae7d
	cp 001h		;ae7f
	adc a,0ffh		;ae81
L_AE83:
	sub 004h		;ae83
	ld c,a			;ae85
	add hl,bc			;ae86
L_AE87:
	ld a,l			;ae87   ; El recorte, solo en la columna: 0xB0 es el ancho util de esta fase
	cp 0b0h		;ae88
	jr c,L_AE94		;ae8a
	ld a,c			;ae8c   ; Rebote: se niega la velocidad horizontal, se repone la posicion de partida y se da el paso otra vez, ya hacia dentro. Al bicho le cuesta el cuadro entero darse la vuelta
	neg		;ae8d
	ld c,a			;ae8f
	ld hl,(0b13eh)		;ae90
	add hl,bc			;ae93
L_AE94:
	ret			;ae94
alta_volador:		; Da de alta un volador en la tabla de 0xACF9 (contador 0xACF8, tope 2, entradas de 5 B): velocidad horizontal 0, la vertical la que traiga A' (+4 si nace arriba, -4 si nace abajo), la fase del aleteo al azar en los dos bits altos, y el estado a cero
	ld hl,0acf8h		;ae95   ; Los voladores vivos, con tope dos
	ld a,(hl)			;ae98
	cp 002h		;ae99
	ret nc			;ae9b
	inc (hl)			;ae9c   ; Fichas de cinco bytes, como las de los andantes
	ld h,000h		;ae9d
	ld l,a			;ae9f
	ld d,h			;aea0
	ld e,l			;aea1
	add hl,hl			;aea2
	add hl,hl			;aea3
	add hl,de			;aea4
	ld de,0acf9h		;aea5
	add hl,de			;aea8
	ld (hl),000h		;aea9   ; El +0, la velocidad horizontal, arranca a cero: los voladores nacen subiendo o bajando en vertical
	inc hl			;aeab
	ex af,af'			;aeac   ; El +1 lleva DOS cosas: la velocidad vertical en los bits 0-5, sesgada en cuatro, y la fase del aleteo en los dos altos
	add a,004h		;aead
	ld e,a			;aeaf
	call azar		;aeb0   ; La fase se echa a suertes...
	and 0c0h		;aeb3
	or e			;aeb5
	sub 004h		;aeb6   ; ...y el sesgo se quita del byte ENTERO, asi que cuando la velocidad es -4 el prestamo baja en uno los dos bits del azar. Como los cuatro valores siguen saliendo, lo unico que cambia es cual toca
	ld (hl),a			;aeb8
	inc hl			;aeb9
	ld (hl),c			;aeba   ; La posicion de salida, en el +2 y el +3
	inc hl			;aebb
	ld (hl),b			;aebc
	inc hl			;aebd
	ld (hl),000h		;aebe   ; Y el estado a cero, que es por donde empieza la vida del volador
	scf			;aec0
	ret			;aec1
solapa_eje:		; Solapamiento en UN eje: BC corrige las dos coordenadas (H y L), D y E son los dos tamanos, y vuelve con carry si NO se tocan. Identica byte a byte a la del bloque de naves
	add hl,bc			;aec2   ; BC corrige las dos coordenadas antes de comparar: lo que se mide es la esquina de la caja, no el punto que se pinta
	ld a,l			;aec3
	cp h			;aec4   ; Al que va delante se le suma SU tamano: si L queda por debajo de H, se mira si L+E alcanza a H...
	jr nc,L_AECA		;aec5
	add a,e			;aec7
	cp h			;aec8
	ret			;aec9
L_AECA:
	ld a,h			;aeca   ; ...y si no, si H+D alcanza a L. Vuelve con acarreo cuando NO se tocan
	add a,d			;aecb
	cp l			;aecc
	ret			;aecd
voladores_activos:		; La segunda mitad de la vida de los voladores, la de estado 0x2E o mas: de 0x2E a 0x32 suben 3 px por cuadro, 0x33 es la forma que persigue al jugador y dispara una de cada 64 veces, y de 0x34 a 0x37 la explosion. Se reparte la tabla con mueve_voladores, que se queda con los de estado menor: los dos cortes son complementarios
	ld ix,0acf9h		;aece   ; Las dos fichas de voladores, de cinco bytes
	ld a,(0acf8h)		;aed2
	and a			;aed5
	ret z			;aed6   ; Sin ninguno vivo no hay nada que hacer
	ld b,a			;aed7
L_AED8:
	push bc			;aed8
	ld a,(0c462h)		;aed9   ; El scroll del cuadro, a la fila: los voladores van clavados al mundo
	add a,(ix+003h)		;aedc
	ld (ix+003h),a		;aedf
	ld c,(ix+000h)		;aee2   ; La velocidad en BC y la posicion en HL, que es como las quieren vaga_o_persigue y pinta_sprite
	ld b,(ix+001h)		;aee5
	ld l,(ix+002h)		;aee8
	ld h,a			;aeeb
	ld a,(ix+004h)		;aeec   ; El estado manda, y este bucle solo atiende a los de 0x2E para arriba: los de menos son de mueve_voladores, y los dos cortes son complementarios
	cp 034h		;aeef
	jr c,L_AF09		;aef1
	add a,028h		;aef3   ; Explotando: el estado 0x34 mas 0x28 da el dibujo 0x5C, y de ahi a 0x5F. Son los mismos cuatro que usan los andantes y el jugador reventado
	call pinta_sprite		;aef5
	inc (ix+004h)		;aef8   ; Un fotograma por cuadro...
	ld a,(ix+004h)		;aefb
	cp 038h		;aefe   ; ...y en 0x38, cuatro despues, se da de baja
	jp c,L_AF9C		;af00
	ld de,lafa1h		;af03   ; La baja necesita saber a donde volver, y se lo lleva en DE: ver 0xAFAD
	jp L_AFA7		;af06
L_AF09:
	ld de,(0a6ebh)		;af09   ; La posicion del jugador, que es a donde apunta todo lo de abajo
	cp 02eh		;af0d   ; Por debajo de 0x2E la ficha no es de esta rutina
	jp c,L_AF9C		;af0f
	cp 033h		;af12   ; De 0x2E a 0x32 el volador esta entrando...
	jr nc,L_AF21		;af14
	dec h			;af16   ; ...y son tres pixeles hacia arriba por cuadro, a pelo, sin mirar nada
	dec h			;af17
	dec h			;af18
	ld (ix+003h),h		;af19
	inc (ix+004h)		;af1c   ; Un paso de la entrada, y a los cinco cuadros llega al 0x33
	jr L_AF69		;af1f
L_AF21:
	ld a,b			;af21   ; El 0x33 es la vida de verdad. La velocidad vertical sale del byte con el sesgo de cuatro, dejando fuera los dos bits de la fase del aleteo
	add a,004h		;af22
	and 03fh		;af24
	sub 004h		;af26
	ld b,a			;af28
	call vaga_o_persigue		;af29   ; Y ya vaga o persigue, como los andantes
	ld a,h			;af2c   ; Salirse por arriba es morir sin explosion
	cp 0e0h		;af2d
	ld de,lafa1h		;af2f
	jr nc,L_AFA7		;af32
	ld (ix+000h),c		;af34   ; La velocidad horizontal, entera
	ld a,b			;af37
	add a,004h		;af38   ; Y la vertical vuelve al byte compartido: se le pone el sesgo...
	ld c,a			;af3a
	ld a,(ix+001h)		;af3b   ; ...se conservan los dos bits de la fase del que habia...
	add a,004h		;af3e
	and 0c0h		;af40
	or c			;af42
	sub 004h		;af43   ; ...y se quita el sesgo del conjunto, con el mismo prestamo de siempre
	ld (ix+001h),a		;af45
	ld (ix+002h),l		;af48   ; La posicion nueva
	ld (ix+003h),h		;af4b
	call azar		;af4e   ; Una de cada 64 veces, el volador dispara
	and 03fh		;af51
	jr nz,L_AF69		;af53
	push hl			;af55
	ld bc,00404h		;af56   ; El tiro no sale de la esquina de la ficha sino cuatro y cuatro adentro, o sea del centro del bicho
	add hl,bc			;af59
	ld b,h			;af5a
	ld c,l			;af5b
	push bc			;af5c
	call rumbo_al_jugador		;af5d   ; La direccion dominante hacia el jugador, que sale como mascara...
	call rumbo_a_mascara2		;af60   ; ...y la tabla inversa la vuelve rumbo, que es lo que la ficha del tiro guarda. Pese al nombre, esta segunda entrada va de mascara A rumbo
	ex af,af'			;af63
	pop bc			;af64
	call alta_tiro_enemigo		;af65   ; Con el rumbo en A' y la posicion en BC, que es como lo quiere el alta
	pop hl			;af68
L_AF69:
	ld a,(ix+001h)		;af69   ; El dibujo: los dos bits altos del byte compartido...
	add a,004h		;af6c
	push af			;af6e
	and 0c0h		;af6f   ; ...bajados a los bits 0 y 1 con dos rotaciones, que dejan indice = bit6 + 2 por bit7...
	rlca			;af71
	rlca			;af72
	add a,048h		;af73   ; ...y sumados a 0x48, el primero de los cuatro dibujos de volador
	call pinta_sprite		;af75
	pop af			;af78
	xor 040h		;af79   ; El aleteo alterna SOLO el bit 6, asi que el volador va y viene entre dos dibujos. El bit 7 lo echo a suertes alta_volador y no lo cambia nadie: es el que elige si esa pareja es la 0x48/0x49 o la 0x4A/0x4B
	sub 004h		;af7b
	ld (ix+001h),a		;af7d
	call disparo_derriba_volador		;af80   ; Le toca al jugador: primero, si alguno de sus disparos lo ha alcanzado
	ld a,(0a6edh)		;af83   ; Y el contacto solo se mira si el jugador esta entero: de 4 en adelante 0xA6ED ya no es escudo sino la cuenta de la agonia
	cp 004h		;af86
	jr nc,L_AF9C		;af88
	ld l,(ix+002h)		;af8a
	ld h,(ix+003h)		;af8d
	call choca_con_jugador		;af90
	jr c,L_AF9C		;af93
	ld (ix+004h),034h		;af95   ; Chocar cuesta los dos: el volador se pone a explotar y el jugador se muere
	call mata_jugador_impacto		;af99
L_AF9C:
	ld de,00005h		;af9c   ; Cinco bytes a la ficha siguiente
	add ix,de		;af9f
L_AFA1:
	pop bc			;afa1
	dec b			;afa2
	jp nz,L_AED8		;afa3
	ret			;afa6
L_AFA7:
	ld hl,0acf8h		;afa7   ; La baja de un volador: uno menos...
	dec (hl)			;afaa
	pop bc			;afab
	push bc			;afac
	push de			;afad   ; ...y aqui el `push de` con el `ret` de dos lineas mas abajo, que es un salto disfrazado: se vuelve a 0xAFA1, el final del bucle, sin gastar un `jp` en cada una de las dos salidas
	ld a,b			;afae
	dec a			;afaf   ; Si la que muere es la ultima por mirar, no hay nada que compactar
	ret z			;afb0
	push ix		;afb1   ; Y si no, se trae encima todo lo que hay entre la ficha siguiente y el final de la tabla, que es 0xAD03
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
	ex de,hl			;afc2
	pop de			;afc3
	ldir		;afc4
	ret			;afc6
disparo_derriba_andante:		; Mira si un disparo del jugador ha tocado al enemigo andante de IX: lo pasa a explosion (0xFF/0x1D), marca el disparo con 0x80, suena 0xCD6D y paga 440 puntos
	ld l,(ix+000h)		;afc7   ; La posicion del andante, con X en el +0 e Y en el +1
	ld h,(ix+001h)		;afca
	ld iy,0acbch		;afcd   ; Contra la tabla de disparos del jugador, entera
	ld de,0060eh		;afd1   ; Las dos cajas: 6 el disparo y 0x0E el andante, iguales en los dos ejes
	ld bc,00101h		;afd4
	call choca_con_tabla		;afd7
	ret c			;afda   ; Sin contacto, no hay nada mas que hacer
	xor a			;afdb   ; El sonido del derribo, en el canal 0
	ld de,0cd6dh		;afdc
	call arranca_guion		;afdf
	ld (ix+002h),0ffh		;afe2   ; El andante pasa a explotar: 0xFF en el rumbo lo deja quieto y el 0x1D arranca los cuatro dibujos
	ld (ix+003h),01dh		;afe6
	ld (iy+002h),080h		;afea   ; Y el disparo que acerto se marca con 0x80, que es como mueve_tabla_disparos sabe que hay que darlo de baja
	ld hl,0b883h		;afee   ; 44 sobre 0xB883, que es el digito de las decenas: 440 puntos por un andante
	ld b,02ch		;aff1
	call premia		;aff3
	ret			;aff6
choca_con_tabla:		; Busca contacto entre HL y toda una tabla de objetos: IY apunta a la primera entrada y (iy-1) es el contador, entradas de 4 B, dos solapa_eje por objeto
	exx			;aff7   ; El juego alterno guarda el contador de vueltas, porque HL hace falta entero para la posicion
	ld a,(iy-001h)		;aff8   ; El contador vive delante de la tabla, como en todas las de este juego
	and a			;affb
	scf			;affc   ; Tabla vacia: se vuelve con acarreo, que aqui significa "no toca nada"
	ret z			;affd
	ld b,a			;affe
L_AFFF:
	exx			;afff
	push hl			;b000
	ld h,(iy+000h)		;b001   ; Primero el eje horizontal: L es la X propia y H se pisa con la del candidato
	call solapa_eje		;b004
	pop hl			;b007
	jr c,L_B014		;b008   ; Si en un eje no se solapan, ya no hace falta mirar el otro
	push hl			;b00a
	ld l,h			;b00b   ; Y ahora el vertical, con la Y propia bajada a L y la del candidato en H
	ld h,(iy+001h)		;b00c
	call solapa_eje		;b00f
	pop hl			;b012
	ret nc			;b013   ; Solapan los dos ejes: contacto, y se sale SIN acarreo con IY apuntando al culpable
L_B014:
	exx			;b014
	ld de,00004h		;b015   ; Cuatro bytes por ficha, que es la anchura de las dos tablas de disparos
	add iy,de		;b018
	djnz L_AFFF		;b01a
	exx			;b01c
	scf			;b01d   ; Recorrida entera sin tocar nada
	ret			;b01e
disparo_derriba_volador:		; Lo mismo para los voladores de la tabla de 0xACF9, con la posicion en (ix+002/003): en vez de sembrar la explosion escribe 0x34 en (ix+004h), y paga 410
	ld l,(ix+002h)		;b01f   ; Igual que la del andante, pero aqui la posicion vive en el +2 y el +3
	ld h,(ix+003h)		;b022
	ld iy,0acbch		;b025
	ld de,0060eh		;b029
	ld bc,00101h		;b02c
	call choca_con_tabla		;b02f
	ret c			;b032
	xor a			;b033
	ld de,0cd6dh		;b034
	call arranca_guion		;b037
	ld (ix+004h),034h		;b03a   ; El volador no siembra explosion: le basta con ponerse en el estado 0x34, que es por donde 0xAEEF lo manda a los cuatro dibujos
	ld (iy+002h),080h		;b03e
	ld hl,0b883h		;b042   ; 41 en el mismo digito: 410 puntos, treinta menos que un andante
	ld b,029h		;b045
	call premia		;b047
	ret			;b04a
tiro_alcanza_jugador:		; El contacto al reves: el jugador (0xA6EB) contra la tabla de tiros enemigos (0xACA3), y al chocar marca al culpable y se va por impacto_simple
	ld hl,(0a6ebh)		;b04b   ; El contacto al reves: aqui el que se mira es el jugador...
	ld iy,0aca3h		;b04e   ; ...contra la tabla de tiros enemigos entera
	ld de,0040ah		;b052   ; Cajas de 4 y 10: el tiro es estrecho y el jugador ancho
	ld bc,00203h		;b055
	call choca_con_tabla		;b058
	ret c			;b05b
	ld (iy+002h),080h		;b05c   ; Al tiro que acierta se le pone la marca de muerto, y el jugador paga un punto de escudo
	call impacto_simple		;b060
	ret			;b063
disparo_derriba_tiro:		; Lo mismo contra un tiro de torreta: 0x7C en (ix+000h) y 53 puntos. Gemela de la de naves, con las mismas cajas y el mismo premio
	ld l,(ix+002h)		;b064   ; Y contra los tiros de torreta, que llevan la posicion en el +2 y el +3
	ld h,(ix+003h)		;b067
	ld iy,0acbch		;b06a
	ld de,00408h		;b06e
	ld bc,00200h		;b071
	call choca_con_tabla		;b074
	ret c			;b077
	ld (ix+000h),07ch		;b078   ; Aqui esta el otro sitio que planta el 0x7C: derribado el tiro, su byte de velocidad pasa a ser el contador de la explosion. El mismo camino que el impacto de 0xBA43
	ld (iy+002h),080h		;b07c
	ld hl,0b884h		;b080   ; 53 en las unidades, no en las decenas: derribar un tiro de torreta es lo que menos paga de todo el bloque
	ld b,035h		;b083
	call premia		;b085
	ret			;b088
choca_con_jugador:		; Contacto con el jugador (0xA6EB/0xA6EC): solapa_eje con 2x3 contra 0x0C x 0x0A, las mismas medidas que la caja pequena de la nave
	push hl			;b089
	ld a,(0a6ech)		;b08a   ; La X del jugador, para el primer eje
	ld l,a			;b08d
	ld bc,00203h		;b08e   ; BC corrige 2 y 3 y los tamanos son 0x0C y 0x0A: las mismas medidas que la caja pequena de la nave
	ld de,00c0ah		;b091
	call solapa_eje		;b094
	pop hl			;b097
	ret c			;b098   ; Si el primer eje ya no solapa, se sale con acarreo y sin mirar el segundo
	ld h,l			;b099   ; Y el segundo eje, con la Y del jugador. El `jp` en vez de `call` deja que sea solapa_eje quien devuelva el acarreo
	ld a,(0a6ebh)		;b09a
	ld l,a			;b09d
	jp solapa_eje		;b09e
poda_rumbo_jugador:		; Quita del rumbo pedido las direcciones que el borde no permite. Es la de naves TRUNCADA: solo los dos topes horizontales, porque aqui no se vuela
	ld hl,(0a6ebh)		;b0a1   ; La X del jugador, que es lo unico que hace falta: aqui no se vuela y no hay topes arriba y abajo
	ex af,af'			;b0a4   ; El rumbo pedido viaja en A', que es donde lo dejo quien llama
	ld a,l			;b0a5
	and a			;b0a6   ; Pegado al borde izquierdo, o sea X justo 0...
	jr nz,L_B0AD		;b0a7
	ex af,af'			;b0a9
	and 0f7h		;b0aa   ; ...se le quita el bit 3, que es el de ir a la izquierda
	ex af,af'			;b0ac
L_B0AD:
	cp 0b0h		;b0ad   ; Y pegado al derecho, X justo 0xB0...
	jr nz,L_B0B5		;b0af
	ex af,af'			;b0b1
	and 0fbh		;b0b2   ; ...se le quita el bit 2, el de ir a la derecha. Son comparaciones EXACTAS: solo podan en la columna del tope, y de pasarse ya se encarga recorta_x_jugador
	ret			;b0b4
L_B0B5:
	ex af,af'			;b0b5
	ret			;b0b6
recorta_x_jugador:		; Deshace el paso lateral del jugador si se ha salido: con L >= 0xB1 repone la X desde 0xA6EB. Es la primera mitad de recorta_a_area; la banda vertical 0x38..0xB1 que si vigila la nave aqui no existe
	ld a,l			;b0b7
	cp 0b1h		;b0b8   ; Con la columna 0xB1 o mas alla, el paso se deshace...
	ret c			;b0ba
	ld a,(0a6ebh)		;b0bb   ; ...reponiendo la X que la ficha traia de antes
	ld l,a			;b0be
	ret			;b0bf
borde_pantalla:		; Poda el rumbo en los bordes laterales: X<3 quita el bit de izquierda, X>=174 el de derecha
	ex af,af'			;b0c0
	ld a,(ix+000h)		;b0c1   ; El sesgo de 16 no es adorno: mete las dieciseis columnas negativas -0xF0 a 0xFF- dentro del rango bajo, y asi un objeto que ya se ha pasado del borde por la izquierda tambien queda podado. Sin el, un `cp 003h` a secas los daria por buenos
	add a,010h		;b0c4
	cp 013h		;b0c6   ; Por debajo de la columna 3, fuera el bit de la izquierda
	jr nc,L_B0CE		;b0c8
	ex af,af'			;b0ca
	and 0f7h		;b0cb
	ret			;b0cd
L_B0CE:
	cp 0beh		;b0ce   ; Y de la 174 en adelante, fuera el de la derecha
	jr c,L_B0D6		;b0d0
	ex af,af'			;b0d2
	and 0fbh		;b0d3
	ret			;b0d5
L_B0D6:
	ex af,af'			;b0d6
	ret			;b0d7
recorta_x_objeto:		; Lo mismo para el objeto de IX, reponiendo L desde (ix+000h). Identica byte a byte a la de la fase de naves
	ld a,l			;b0d8   ; La misma poda que la del jugador, pero reponiendo desde la ficha de IX
	cp 0b1h		;b0d9
	ret c			;b0db
	ld l,(ix+000h)		;b0dc   ; La misma poda, reponiendo desde la ficha de IX
	ret			;b0df
impacto_simple:		; Gasta un punto del escudo de 0xA6ED y, si ya estaba a cero, manda a mata_jugador_impacto. Gemela de la de naves cambiando solo la direccion del escudo
	ld a,(0a6edh)		;b0e0   ; El escudo que le queda al jugador
	and a			;b0e3
	jr z,mata_jugador_impacto		;b0e4   ; Ya estaba a cero: este impacto lo mata
	dec a			;b0e6
	ld (0a6edh),a		;b0e7
	jr L_B0F9		;b0ea
impacto_doble:		; Gasta dos puntos de 0xA6ED, comprobando entre uno y otro si el primero ya bastaba para matar. La usan los tiros de las torretas
	ld a,(0a6edh)		;b0ec   ; El impacto doble baja dos, pero mira entre uno y otro...
	and a			;b0ef
	jr z,mata_jugador_impacto		;b0f0
	dec a			;b0f2
	jr z,mata_jugador_impacto		;b0f3   ; ...porque con uno solo de escudo el primero ya basta y no hay que gastar el segundo
	dec a			;b0f5
	ld (0a6edh),a		;b0f6
L_B0F9:
	ld hl,02f50h		;b0f9   ; El HUD: A trae el escudo que queda, y el `xor 003h` lo vuelve del reves, o sea CUANTOS puntos se han perdido
	xor 003h		;b0fc
	ld c,011h		;b0fe   ; Las tres celdas se marcan con el mismo color y van de ocho en ocho, que en la geometria de este juego -tercio*0x800 + columna*0x40 + fila- es la misma columna y filas seguidas. Se empieza por 0x2F50, la de abajo, y se sube
	push af			;b100
	call pinta_celda_color		;b101
	pop af			;b104
	dec a			;b105   ; Una celda por punto perdido: con el escudo entero no se marca ninguna mas
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
	jp pinta_celda_color		;b118   ; Y la tercera con un `jp`, que ya no hay nada detras
mata_jugador_impacto:		; Escudo agotado: 0xA6ED=4, sonido, y el update del jugador (operando 0xA57E) parcheado al cadaver de 0xB268
	ld hl,02778h		;b11b   ; La marca del HUD que dice que se acabo
	call pinta_marca_hud		;b11e
	ld a,004h		;b121   ; El 4 en 0xA6ED es la sentencia: de aqui en adelante ese byte deja de ser escudo y pasa a contar la agonia
	ld (0a6edh),a		;b123
	ld a,05bh		;b126   ; Y la animacion del jugador arranca en 0x5B, que es de donde tira el cadaver
	ld (0ad0eh),a		;b128
	xor a			;b12b   ; El sonido de la muerte, en el canal 0
	ld de,0cd6dh		;b12c
	call arranca_guion		;b12f
	ld hl,0b268h		;b132   ; **EL PARCHE**: se escribe cadaver_parabola en el operando de 0xA57E, o sea que el turno del jugador deja de ser el turno del jugador y pasa a ser la caida del cuerpo. Nadie comprueba una bandera: se cambia el codigo
	ld (0a57eh),hl		;b135
	ld hl,02f48h		;b138
	jp pinta_marca_hud		;b13b

; ----------------------------------------------------------------------
; DATOS relleno_B13E: Relleno o resto (2 B; 2 bytes)
;   0xb13e..0xb140  (2 bytes)
DATA_relleno_B13E:
	defb 000h,000h	; b13e

; ======================================================================
; CODIGO 0xb140..0xb51b  (987 bytes)
; ======================================================================


rota_fondo_sube:		; Rota el tile 0 una fila de pixel (ldir de 124 B) y deja el delta del cuadro en 0xC462 (+2): la trama del fondo, a mitad de velocidad que el scroll
	push hl			;b140   ; Los cuatro primeros bytes de la tira, guardados...
	ld hl,087f3h		;b141
	ld e,(hl)			;b144
	inc hl			;b145
	ld d,(hl)			;b146
	push de			;b147
	inc hl			;b148
	ld e,(hl)			;b149
	inc hl			;b14a
	ld d,(hl)			;b14b
	push de			;b14c
	inc hl			;b14d
	ld de,087f3h		;b14e   ; ...los 124 que quedan suben cuatro posiciones...
	ld bc,0007ch		;b151
	ldir		;b154
	ex de,hl			;b156
	pop de			;b157
	pop bc			;b158
	ld (hl),c			;b159   ; ...y los guardados entran por el final: una rotacion circular de los 128 bytes de 0x87F3 a 0x8872, en pasos de cuatro
	inc hl			;b15a
	ld (hl),b			;b15b
	inc hl			;b15c
	ld (hl),e			;b15d
	inc hl			;b15e
	ld (hl),d			;b15f
	ld hl,0c462h		;b160
	ld (hl),002h		;b163   ; Y el delta del cuadro, que es lo que suman a su fila todos los que van clavados al mundo: mas dos
	pop hl			;b165
	ret			;b166
rota_fondo_baja:		; El simetrico de rota_fondo_sube (lddr; 0xC462 = -2)
	push hl			;b167   ; El simetrico exacto, empezando por el ultimo byte y con `lddr`
	ld hl,08872h		;b168
	ld e,(hl)			;b16b
	dec hl			;b16c
	ld d,(hl)			;b16d
	push de			;b16e
	dec hl			;b16f
	ld e,(hl)			;b170
	dec hl			;b171
	ld d,(hl)			;b172
	push de			;b173
	dec hl			;b174
	ld de,08872h		;b175
	ld bc,0007ch		;b178
	lddr		;b17b
	ex de,hl			;b17d
	pop de			;b17e
	pop bc			;b17f
	ld (hl),c			;b180
	dec hl			;b181
	ld (hl),b			;b182
	dec hl			;b183
	ld (hl),e			;b184
	dec hl			;b185
	ld (hl),d			;b186
	ld hl,0c462h		;b187
	ld (hl),0feh		;b18a   ; Y aqui el delta es 0xFE, o sea menos dos
	pop hl			;b18c
	ret			;b18d
consulta_mapa:		; Pasa la posicion a mundo (Y+0x28-fino, X+8) y lee la celda mapa[fila*6 + Y/32*6 + X/32 - 6] (celdas de 32x32): Z = celda 0 = vacio. Devuelve el valor en A pero nadie lo usa: para la fisica el mapa es binario
	ld a,h			;b18e   ; De pantalla a mundo: a la fila se le suman 0x28...
	ld iy,0ad2ah		;b18f
	add a,028h		;b193
	sub (iy+002h)		;b195   ; ...y se le quita el scroll fino de la camara, que es el desfase del cuadro
	ld h,a			;b198
	ld a,l			;b199   ; A la columna, ocho: el punto que se consulta no es la esquina de la ficha sino su centro bajo
	add a,008h		;b19a
	ld l,a			;b19c
	push hl			;b19d
	call base_mapa		;b19e   ; La base del mapa de la zona, que cambia con la altura
	pop hl			;b1a1
	ld a,h			;b1a2
	rlca			;b1a3   ; Cuatro rotaciones y `and 00eh` dejan (fila/32) por dos...
	rlca			;b1a4
	rlca			;b1a5
	rlca			;b1a6
	and 00eh		;b1a7
	ld d,a			;b1a9
	add a,a			;b1aa   ; ...y con `add a,a / add a,d` se multiplica por tres: total, (fila/32) por SEIS, que es el ancho del mapa en celdas
	add a,d			;b1ab
	ld d,a			;b1ac
	ld a,l			;b1ad   ; Tres rotaciones y `and 007h` dan la columna/32, sin multiplicar por nada
	rlca			;b1ae
	rlca			;b1af
	rlca			;b1b0
	and 007h		;b1b1
	add a,d			;b1b3
	ld e,a			;b1b4
	ld d,000h		;b1b5
	add ix,de		;b1b7
	ld a,(ix-006h)		;b1b9   ; Menos seis es retroceder una fila entera del mapa, que mide seis celdas de ancho: con el 0x28 que se le sumo a la fila en 0xB193, es lo que alinea la consulta con el punto del bicho que importa
	and a			;b1bc   ; Cero es vacio, y eso es todo lo que mira la fisica: el valor sale en A pero no lo lee nadie
	ret			;b1bd
consulta_mapa_fina:		; consulta_mapa mas el test de sub-celda: con celda vacia, carry solo si la posicion cae en la banda central [8,24) de la celda en X e Y. La usan SOLO los voladores (desde 0xB20F) para elegir hueco donde anidar
	call consulta_mapa		;b1be
	ret nz			;b1c1   ; Con la celda ocupada no hay nada mas que preguntar
	ld a,h			;b1c2
	and 0e0h		;b1c3   ; Los cinco bits bajos de cada eje son la posicion DENTRO de la celda de 32x32...
	ld d,a			;b1c5
	ld a,l			;b1c6
	and 0e0h		;b1c7
	ld e,a			;b1c9
	sbc hl,de		;b1ca
	ld a,h			;b1cc
	sub 008h		;b1cd   ; ...y se exige que caiga en la banda central: el `sub 008h / ccf` descarta por abajo...
	ccf			;b1cf
	ret nc			;b1d0
	sub 010h		;b1d1   ; ...y el `sub 010h` por arriba, o sea la banda [8,24) de las 32
	ret nc			;b1d3
	ld a,l			;b1d4   ; Lo mismo en la columna, y solo si los dos ejes caen dentro se vuelve con acarreo
	sub 008h		;b1d5
	ccf			;b1d7
	ret nc			;b1d8
	sub 010h		;b1d9
	ret			;b1db
mueve_voladores:		; La PRIMERA mitad de la vida de los voladores (tabla 0xACF9, contador 0xACF8, 5 B por objeto), la de estado por debajo de 0x2E: vuelan hacia un PUNTO FIJO del centro -fila 0x68, columna 0x58, que el `ld de,06858h` de 0xB21D carga como valor, no como puntero- y en el estado 0x2D se plantan a probar con consulta_mapa_fina hasta dar con celda vacia y centrada. Perseguir al jugador de verdad es cosa del estado 0x33, en voladores_activos, que lo lee de memoria con `ld de,(0a6ebh)`
	ld ix,0acf9h		;b1dc   ; Las dos fichas de voladores, otra vez
	ld a,(0acf8h)		;b1e0
	and a			;b1e3
	ret z			;b1e4
	ld b,a			;b1e5
L_B1E6:
	push bc			;b1e6
	ld a,(ix+001h)		;b1e7   ; La velocidad vertical, limpia de los dos bits de la fase
	add a,004h		;b1ea
	and 03fh		;b1ec
	sub 004h		;b1ee
	ld b,a			;b1f0
	ld a,(ix+004h)		;b1f1
	cp 02eh		;b1f4   ; De 0x2E en adelante la ficha es de voladores_activos: los dos cortes son complementarios y ninguna ficha se mira dos veces
	jr nc,L_B25D		;b1f6
	ld c,(ix+000h)		;b1f8
	ld l,(ix+002h)		;b1fb
	ld h,(ix+003h)		;b1fe
	inc (ix+004h)		;b201   ; El estado sube un paso por cuadro...
	cp 02dh		;b204   ; ...menos en el 0x2D, que es donde el volador se planta a buscar sitio
	jr c,L_B21D		;b206
	dec (ix+004h)		;b208   ; Y para plantarse deshace su propio `inc`: mientras no encuentre hueco, el estado no se mueve del 0x2D
	push hl			;b20b
	push bc			;b20c
	push ix		;b20d
	call consulta_mapa_fina		;b20f   ; Hueco es celda vacia Y bien centrado en ella
	pop ix		;b212
	pop bc			;b214
	pop hl			;b215
	jr nc,L_B21D		;b216   ; Sin hueco, a seguir volando un cuadro mas
	inc (ix+004h)		;b218   ; Con hueco, 0x2E: la ficha pasa a la otra mitad y ya no se mira mas en este bucle
	jr L_B25D		;b21b
L_B21D:
	ld de,06858h		;b21d   ; El blanco es un PUNTO FIJO -fila 0x68, columna 0x58, el centro-, no el jugador: es carga inmediata. Perseguir al jugador es cosa del estado 0x33, en la otra mitad
	call vaga_o_persigue		;b220
	ld a,h			;b223
	cp 0e0h		;b224
	ld de,lb262h		;b226   ; La baja, con la direccion de vuelta en DE como siempre
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
	ld a,(ix+001h)		;b246   ; Y el mismo dibujo y el mismo aleteo que en la otra mitad, byte por byte
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
	ld hl,(0a6ebh)		;b268   ; La posicion desde donde arranca la caida
	ld a,(0a6edh)		;b26b   ; El byte que era el escudo ahora cuenta la agonia, y sube un paso por cuadro
	inc a			;b26e
	ld (0a6edh),a		;b26f
	sub 00ch		;b272   ; Menos doce: el cuerpo sale despedido a siete pixeles hacia arriba y va perdiendo uno por cuadro, asi que a los siete se para y luego cae acelerando. La parabola no cuesta ni una variable mas
	add a,h			;b274
	push af			;b275
	push hl			;b276
	call nc,pinta_torre		;b277   ; La torre se pinta ANTES o DESPUES del cuerpo segun el acarreo de esa suma, que es justo el que distingue el tramo que sube del que cae
	pop hl			;b27a
	pop af			;b27b
	push af			;b27c
	cp 0c4h		;b27d   ; Pasada la fila 0xC4 el cuerpo ya no se pinta y la caida se acaba
	jp nc,L_B2A4		;b27f
	ld h,a			;b282
	ld (0a6ebh),hl		;b283
	ld a,(0ad0eh)		;b286   ; El cuerpo va pasando por las ocho poses del protagonista, que es lo unico que hace el `and 007h`
	and 007h		;b289
	call pinta_sprite		;b28b
	ld hl,(0a6ebh)		;b28e
	ld h,068h		;b291   ; Y encima, en fila fija, los cuatro dibujos de la explosion...
	ld a,(0ad0eh)		;b293
	inc a			;b296
	ld (0ad0eh),a		;b297
	cp 060h		;b29a   ; ...que solo salen los cuatro primeros cuadros: de 0x60 en adelante queda el cuerpo dando vueltas a secas
	call c,pinta_sprite		;b29c
	pop af			;b29f
	call c,pinta_torre		;b2a0
	ret			;b2a3
L_B2A4:
	pop af			;b2a4
	ret			;b2a5
gira_sprite_dcha:		; Gira el sprite un cuarto de vuelta a la derecha sobre el slot de trabajo: cuatro pasadas de predesplaza_sprite, una por cada byte de la fila de cuatro
	ld h,000h		;b2a6   ; Cada dibujo del pool ocupa 64 bytes, de ahi las seis duplicaciones
	ld l,a			;b2a8
	add hl,hl			;b2a9
	add hl,hl			;b2aa
	add hl,hl			;b2ab
	add hl,hl			;b2ac
	add hl,hl			;b2ad
	add hl,hl			;b2ae
	ld de,06555h		;b2af   ; El pozo de dibujos de la fase
	add hl,de			;b2b2
	ld de,00004h		;b2b3   ; Los cuatro destinos -0x7D55, 0x7D75, 0x7D57 y 0x7D77- no son una rejilla cualquiera: el paso de 2 separa los dos PLANOS (mascara en +0/+1 y dibujo en +2/+3) y el de 0x20 separa las ocho filas de arriba de las ocho de abajo. Cada llamada convierte una columna de ocho pixeles del original en ocho filas del resultado, y la mitad izquierda del original acaba siendo la de arriba: eso es girar a la derecha
	ld iy,07d55h		;b2b6
	call predesplaza_sprite		;b2ba   ; Una llamada por columna de bytes del original, y el `inc hl` de en medio pasa a la siguiente
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
	ld c,002h		;b2d3   ; Dos tandas de ocho filas, que son las 16 del dibujo
L_B2D5:
	ld b,008h		;b2d5   ; Ocho filas por tanda: las que caben en un byte del resultado
L_B2D7:
	ld a,(hl)			;b2d7   ; Una fila del original, ocho pixeles en un byte
	rlca			;b2d8   ; El `rlca` saca el pixel de mas a la izquierda...
	rr (iy+001h)		;b2d9   ; ...y el `rr` lo mete por arriba del destino empujando lo que ya habia, asi que la primera fila leida acaba en el bit 0, la columna de mas a la derecha
	rlca			;b2dd
	rr (iy+005h)		;b2de   ; Los ocho destinos van de cuatro en cuatro, o sea OCHO FILAS SEGUIDAS del slot: el pixel n de la fila leida es el que va a la fila n del resultado. Eso es trasponer
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
	add hl,de			;b300   ; Cuatro bytes por fila: sumarlos es bajar una fila del original
	djnz L_B2D7		;b301
	dec iy		;b303   ; Entre las dos tandas el destino retrocede un byte: de la mitad derecha del resultado a la izquierda, que es donde va la mitad de abajo del original
	dec c			;b305
	jr nz,L_B2D5		;b306   ; Dos vueltas de ocho y el dibujo entero girado
	pop hl			;b308
	ret			;b309
gira_sprite_izda:		; La simetrica, girando a la izquierda con predesplaza_sprite_izq y los mismos cuatro destinos en otro orden
	ld h,000h		;b30a   ; La misma cuenta que la de la derecha: dibujo por 64 mas el pozo
	ld l,a			;b30c
	add hl,hl			;b30d
	add hl,hl			;b30e
	add hl,hl			;b30f
	add hl,hl			;b310
	add hl,hl			;b311
	add hl,hl			;b312
	ld de,06555h		;b313
	add hl,de			;b316
	ld de,00004h		;b317   ; Los mismos cuatro destinos, pero cruzados dos a dos: ahora la mitad de arriba del original acaba en la mitad IZQUIERDA, que es girar al otro lado
	ld iy,07d75h		;b31a
	call predesplaza_sprite_izq		;b31e   ; Y la misma reparticion, una llamada por columna
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
	ld c,002h		;b337   ; Las mismas dos tandas de ocho filas
L_B339:
	ld b,008h		;b339
L_B33B:
	ld a,(hl)			;b33b   ; La fila del original...
	rrca			;b33c   ; ...pero aqui el `rrca` saca el pixel de mas a la DERECHA...
	rl (iy+000h)		;b33d   ; ...y el `rl` lo mete por abajo del destino: todo del reves que en la otra, y sale el giro simetrico
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
	add hl,de			;b364   ; Una fila mas abajo del original
	djnz L_B33B		;b365
	inc iy		;b367   ; Y aqui el destino AVANZA un byte en vez de retroceder
	dec c			;b369
	jr nz,L_B339		;b36a
	pop hl			;b36c
	ret			;b36d
voltea_sprite:		; Le da la vuelta de arriba abajo: copia el sprite con la PILA -`ld sp,hl` sobre el pozo y dieciseis vueltas de `pop de / pop bc`- escribiendo las filas hacia atras desde el final del slot. NO es media vuelta, aunque asi figurara: los cuatro bytes de cada fila se sueltan en orden inverso sobre direcciones que bajan, con lo que la fila sale igual, y no hay ni una instruccion que invierta bits ni que cruce el byte izquierdo con el derecho. Es un ESPEJO VERTICAL; una media vuelta de verdad dejaria ademas el dibujo cambiado de izquierda a derecha
	ld h,000h		;b36e
	ld l,a			;b370
	add hl,hl			;b371
	add hl,hl			;b372
	add hl,hl			;b373
	add hl,hl			;b374
	add hl,hl			;b375
	add hl,hl			;b376
	ld de,06555h		;b377
	add hl,de			;b37a
	ld a,010h		;b37b   ; Dieciseis vueltas, una por fila del dibujo
	ld (0b393h),sp		;b37d   ; SP se va a usar de lector, asi que el bueno se guarda en el operando del `ld sp,00000h` de 0xB392, que es donde se repone al salir
	ld sp,hl			;b381   ; La pila apuntando al dibujo del pozo: dos `pop` traen los cuatro bytes de la fila mas rapido que ningun `ld`
	ld hl,07d94h		;b382   ; Y se escribe desde el FINAL del slot hacia atras
L_B385:
	pop de			;b385
	pop bc			;b386
	ld (hl),b			;b387   ; Los cuatro bytes se sueltan en orden inverso -B, C, D, E- sobre direcciones que bajan, con lo que la fila queda IGUAL: lo unico que se da la vuelta es el orden de las filas
	dec hl			;b388
	ld (hl),c			;b389
	dec hl			;b38a
	ld (hl),d			;b38b
	dec hl			;b38c
	ld (hl),e			;b38d
	dec hl			;b38e
	dec a			;b38f   ; Una fila menos
	jr nz,L_B385		;b390
	ld sp,00000h		;b392   ; SP repuesto, con el valor que escribio 0xB37D
	ret			;b395
copia_sprite:		; La identidad de las cuatro: un `ldir` de 0x40 bytes del pozo al slot de trabajo
	ld h,000h		;b396
	ld l,a			;b398
	add hl,hl			;b399   ; Dibujo por 64, la cuenta de siempre
	add hl,hl			;b39a
	add hl,hl			;b39b
	add hl,hl			;b39c
	add hl,hl			;b39d
	add hl,hl			;b39e
	ld de,06555h		;b39f
	add hl,de			;b3a2
	ld de,07d55h		;b3a3   ; Al slot de trabajo 0x60, que es el que se pinta
	ld bc,00040h		;b3a6   ; Los 64 bytes tal cual: este es el caso de mirar hacia arriba, que es como estan dibujados los doce fotogramas
	ldir		;b3a9
	ret			;b3ab
suma_puntos:		; Suma al marcador de 0xB87F en ASCII con acarreo decimal a mano de derecha a izquierda, repinta, y mira si toca vida extra. Es LA MISMA RUTINA que la 0xD3CF de la fase de naves: 38 instrucciones cada una y 12 diferencias, todas direcciones
	ld a,(0b880h)		;b3ac   ; Las decenas de millar ANTES de sumar, guardadas para compararlas al final
	push af			;b3af
L_B3B0:
	push hl			;b3b0   ; B dice cuantos puntos se suman, y se suman DE UNO EN UNO; cuanto vale cada unidad lo elige el llamante apuntando HL al digito que quiere subir
L_B3B1:
	ld a,(hl)			;b3b1   ; Sube el digito, que es ASCII
	inc a			;b3b2
	cp 03ah		;b3b3   ; Si no se ha pasado del nueve, ya esta
	jr c,L_B3BE		;b3b5
	sub 00ah		;b3b7   ; Y si se ha pasado, vuelve al cero y el acarreo sigue por el digito de la izquierda
	ld (hl),a			;b3b9
	dec hl			;b3ba
	jp L_B3B1		;b3bb
L_B3BE:
	ld (hl),a			;b3be   ; El primero que no se desborda se escribe, y esa unidad ya esta sumada
	pop hl			;b3bf
	djnz L_B3B0		;b3c0
	call hud_imprime		;b3c2   ; Repinta el marcador entero, con IX y DE puestos por premia
	pop de			;b3c5   ; El digito viejo vuelve por D: el `push af` de la entrada dejo A en la parte alta
	ld a,(0b880h)		;b3c6   ; Si las decenas de millar no han cambiado no hay premio. O sea que se premia cada 10.000 y el contador es el propio marcador, sin gastar una variable
	cp d			;b3c9
	ret z			;b3ca
	ld a,080h		;b3cb   ; El aviso: tres guiones, uno por canal, con el bit 7 puesto para volver sin `ei`
	ld de,0cdb1h		;b3cd
	call arranca_guion		;b3d0
	inc a			;b3d3
	ld de,0cdd0h		;b3d4
	call arranca_guion		;b3d7
	inc a			;b3da
	ld de,0cdech		;b3db
	call arranca_guion		;b3de
	call sonido_off		;b3e1   ; Y detras cierra la puerta del sonido: hasta que alguien llame a sonido_reset no puede arrancar ningun guion nuevo, asi que al aviso no lo pisa nada
	ld a,(0a6edh)		;b3e4   ; Con el escudo por debajo de 2 el premio es escudo nuevo...
	cp 002h		;b3e7
	jp c,repinta_escudo		;b3e9
	ld hl,0c45fh		;b3ec   ; ...y con el escudo entero, una vida mas
	ld a,(hl)			;b3ef
	cp 009h		;b3f0   ; Con tope nueve: de ahi para arriba el premio se pierde
	ret nc			;b3f2
	inc (hl)			;b3f3
	jp hud_vidas		;b3f4
alta_enemigo_cuadro:		; El alta de enemigos cuadro a cuadro: una de cada cuatro tiradas -el freno de 0xB720 no llega a frenar: ese byte ya vale 0 en el bloque de textos y la unica escritura directa que tiene, la de 0xA480, tambien le mete 0-, saca columna al azar por debajo de 0xB0, elige nacer por arriba (fila 0x10) o por abajo (0xC0) con el bit 3 de esa misma columna, y con el bit 1 manda a la tabla de voladores o, si consulta_mapa da suelo firme, a la de andantes. Con la de voladores llena no se pierde la tirada: se prueba el andante
	call azar		;b3f7
	and 003h		;b3fa   ; Una tirada de cada cuatro; los otros tres cuadros ni se intenta
	ret nz			;b3fc
	ld a,(0b720h)		;b3fd   ; El freno de 0xB720 no frena nunca: ese byte es el cero que cierra una cadena del bloque de textos, o sea que ya vale 0, y la unica escritura directa que tiene en todo el listado -la de 0xA480- tambien le mete 0
	and a			;b400
	ret nz			;b401
L_B402:
	call azar		;b402   ; La columna sale del azar, y se vuelve a tirar hasta que caiga dentro del ancho de juego
	cp 0b0h		;b405
	jr nc,L_B402		;b407
	ld c,a			;b409
	bit 3,a		;b40a   ; El mismo byte hace de columna y de moneda al aire: el bit 3 dice si el bicho nace pegado arriba (fila 0x10) o abajo (0xC0)...
	ld b,010h		;b40c
	jr z,L_B412		;b40e
	ld b,0c0h		;b410
L_B412:
	bit 1,c		;b412   ; ...y el bit 1, si lo que nace es volador o andante
	jr z,L_B424		;b414
	ld a,b			;b416
	cp 0c0h		;b417   ; El volador entra siempre hacia dentro: naciendo abajo sube cuatro pixeles por cuadro y naciendo arriba baja cuatro
	ld a,0fch		;b419
	jr z,L_B41F		;b41b
	ld a,004h		;b41d
L_B41F:
	ex af,af'			;b41f
	call alta_volador		;b420   ; Si la tabla de voladores esta llena -solo caben dos- la tirada no se pierde: se sigue por el andante
	ret c			;b423
L_B424:
	ld h,b			;b424
	ld l,c			;b425
	call consulta_mapa		;b426   ; El andante necesita suelo donde nacer: con celda vacia no sale nadie
	ret z			;b429
	ld a,b			;b42a
	cp 0c0h		;b42b   ; Aqui se calcula lo mismo para el andante -4 naciendo arriba y 0 naciendo abajo, que serian los rumbos "abajo" y "arriba"- pero alta_enemigo mete A' en el quinto campo de la ficha, que no lo lee nadie, y pone el rumbo fijo en 4. Se calcula para nada
	ld a,004h		;b42d
	jr nz,L_B432		;b42f
	xor a			;b431
L_B432:
	ex af,af'			;b432
	jp alta_enemigo		;b433
repinta_escudo:		; Pone el escudo a 3 (0xA6ED) y repinta su indicador: cuatro posiciones -0x2778 en 0xF9, 0x2F40 y 0x2F48 en 0xF5, y 0x2F50 en 0xF1- que son ocho celdas, porque pinta_celda_color pinta siempre la de la direccion y la de la columna de al lado. Deshace lo que marcaron el HUD de 0xB0F9 (color 0x11 por cada punto de escudo perdido) y la marca de muerte de 0x2778
	ld a,003h		;b436   ; Escudo a tope, que es lo que premia suma_puntos cuando falta
	ld (0a6edh),a		;b438
	ld hl,02778h		;b43b   ; Las cuatro posiciones del HUD, de arriba abajo y todas con tinta blanca: la marca de 0x2778 sobre rojo claro y las tres celdas del escudo sobre azul, azul y negro
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
	ld c,002h		;b45c   ; Dos celdas por llamada
L_B45E:
	ld b,008h		;b45e   ; Ocho bytes, que es una celda entera de la tabla de colores
L_B460:
	out (098h),a		;b460   ; El byte va a pelo por el puerto de datos, sin tocar la direccion: el VDP la sube sola
	and a			;b462   ; El `and a` no comprueba nada -el `dec b` de detras vuelve a poner las banderas-: esta para darle tiempo al VDP entre byte y byte
	dec b			;b463
	jr nz,L_B460		;b464
	ld de,00040h		;b466   ; La celda de al lado esta 0x40 mas alla, que en la geometria por columnas de este juego es la columna siguiente
	add hl,de			;b469
	call vram_pon_dir		;b46a   ; Y hay que volver a dar la direccion, que la de antes se quedo ocho bytes mas alla
	dec c			;b46d
	jr nz,L_B45E		;b46e
	ei			;b470
	ret			;b471
rotula_glifo:		; Estampa el glifo 0x5F00+A*8 a DOBLE altura y tramado en damero: borra con rlca/cpl/and, pinta con and 0x55/0xAA; recorta al llegar a 0x4F00
	ld e,a			;b472
	ld a,h			;b473   ; El buffer acaba en 0x4EFF: si el rotulo ha caido mas alla, no se pinta
	cp 04fh		;b474
	ld a,e			;b476
	ret nc			;b477
	cp 020h		;b478   ; Este `cp 020h` -o sea, si el caracter es un espacio- no lo lee nadie: lo unico que mira banderas detras es el `dec a` del bucle, y las pone el mismo. Esta igual de muerto en la gemela del menu (0xBABA), asi que viene de la version de la que salen las dos
	push hl			;b47a
	ld h,000h		;b47b   ; El glifo son ocho bytes en 0x5F00 + caracter*8
	ld l,a			;b47d
	add hl,hl			;b47e
	add hl,hl			;b47f
	add hl,hl			;b480
	ld de,05f00h		;b481
	add hl,de			;b484
	ex de,hl			;b485
	pop hl			;b486
	push hl			;b487
	push de			;b488
	ld bc,00018h		;b489   ; 0x18 es el ancho del buffer: sumarlo es bajar una fila
	ld a,008h		;b48c   ; Ocho filas de glifo...
L_B48E:
	ex af,af'			;b48e   ; ...y cada una se estampa en DOS filas del buffer: el rotulo sale a doble altura
	ld a,(de)			;b48f
	rlca			;b490   ; Esta pasada BORRA, y borra el glifo corrido un pixel a la izquierda: el `rlca` lo corre y el `cpl` lo pone del reves para el `and`
	cpl			;b491
	and (hl)			;b492
	ld (hl),a			;b493
	add hl,bc			;b494
	ld a,(de)			;b495
	rlca			;b496
	cpl			;b497
	and (hl)			;b498
	ld (hl),a			;b499
	add hl,bc			;b49a
	inc de			;b49b   ; Byte siguiente del glifo
	ex af,af'			;b49c
	dec a			;b49d
	jp nz,L_B48E		;b49e
	pop de			;b4a1
	pop hl			;b4a2
	push hl			;b4a3   ; La segunda pasada arranca una fila mas abajo que la de borrar, asi que lo borrado asoma una fila por encima del trazo
	add hl,bc			;b4a4
	ld a,008h		;b4a5
L_B4A7:
	ex af,af'			;b4a7
	ld a,(de)			;b4a8
	and 055h		;b4a9   ; Y ahora se pinta con `or`, pero tramado: en una fila los pixeles impares...
	or (hl)			;b4ab
	ld (hl),a			;b4ac
	add hl,bc			;b4ad
	ld a,(de)			;b4ae
	and 0aah		;b4af   ; ...y en la de al lado los pares, o sea un damero que deja ver el fondo entre trazo y trazo
	or (hl)			;b4b1
	ld (hl),a			;b4b2
	add hl,bc			;b4b3
	inc de			;b4b4   ; Byte siguiente, igual que en la de borrar
	ex af,af'			;b4b5
	dec a			;b4b6
	jp nz,L_B4A7		;b4b7
	pop hl			;b4ba
	ret			;b4bb
rotula_cadena:		; Imprime la cadena de (IX) hasta el 0 con rotula_glifo: el rotulo DEMO y el menu
	ld a,(ix+000h)		;b4bc   ; Un caracter de la cadena de IX...
	inc ix		;b4bf
	and a			;b4c1
	ret z			;b4c2   ; ...y el cero la cierra
	call rotula_glifo		;b4c3
	inc hl			;b4c6   ; Un byte del buffer por caracter: los glifos van pegados
	jp rotula_cadena		;b4c7
rotula_menu:		; Rotula el menu entero sobre el buffer con las cinco cadenas encadenadas de 0xB886, y remata poniendo la marca de seleccion en la linea que diga 0xB87C
	ld ix,0b886h		;b4ca   ; Las cinco cadenas van SEGUIDAS desde 0xB886 -STARDUST, REDEFINIR TECLAS, JUGAR, JOYSTICK y TECLADO- y cada rotulada deja IX apuntando a la siguiente
	ld de,000c8h		;b4ce   ; El titulo, ocho filas mas abajo y ocho columnas a la derecha (0xC8 = 8*24 + 8)
	call suma_scroll		;b4d1   ; Todas las posiciones se suman al scroll: por eso el menu sube con el fondo
	call rotula_cadena_menu		;b4d4   ; Las dos de arriba, con el rotulador del menu, que lleva otro recorte
	ld de,003c2h		;b4d7   ; Las cuatro lineas de abajo van en la columna 2 y de 32 en 32 filas: 0x3C2, 0x6C2, 0x9C2 y 0xCC2
	call suma_scroll		;b4da
	call rotula_cadena_menu		;b4dd
	ld de,006c2h		;b4e0
	call suma_scroll		;b4e3
	call rotula_cadena		;b4e6   ; Y de aqui abajo, con el rotulador normal
	ld de,009c2h		;b4e9
	call suma_scroll		;b4ec
	call rotula_cadena		;b4ef
	ld de,00cc2h		;b4f2
	call suma_scroll		;b4f5
	call rotula_cadena		;b4f8
	ld a,(0b87ch)		;b4fb   ; 0xB87C dice el mando elegido: 0 es teclado y cualquier otra cosa joystick
	and a			;b4fe
	jr z,L_B50E		;b4ff
	ld ix,0b8b7h		;b501   ; La marca se rotula ENCIMA de la palabra elegida, en su mismo sitio del buffer, y trae tantas flechas como letras tiene: ocho para JOYSTICK...
	ld de,009c2h		;b505
	call suma_scroll		;b508
	jp rotula_cadena		;b50b
L_B50E:
	ld ix,0b8c0h		;b50e   ; ...y siete para TECLADO. Como rotula_glifo solo borra por donde va a pintar, la palabra no se va: las flechas se le montan encima
	ld de,00cc2h		;b512
	call suma_scroll		;b515
	jp rotula_cadena		;b518

; ----------------------------------------------------------------------
; DATOS relleno_B51B: Relleno (320 B; 320 de 320 bytes son 0xFF)
;   0xb51b..0xb65b  (320 bytes)
DATA_relleno_B51B:
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


scroll_records:		; El scroll de la pantalla de records: le resta al puntero de 0xB87D una fila del buffer por vuelta -o sea que el rotulo SUBE un escalon- y vuelve a rotular el titulo y las ocho fichas de 0xB8C8. Cuando el rotulo se ha ido por arriba no vuelve: el `pop hl` de 0xB6A7 se come su propia direccion de retorno, y de ahi sigue con la musica, la espera y la demo. Gemela de la de naves, 35 de 49 bytes
	ld hl,(0b87dh)		;b65b   ; El puntero donde se rotula, que 0xB68C arranca en 0x4F08
	ld de,00018h		;b65e   ; Restarle el ancho del buffer es subir el rotulo una fila: eso es todo el scroll
	and a			;b661
	sbc hl,de		;b662
	ld a,h			;b664
	cp 040h		;b665   ; Y por encima de 0x4000 el rotulo entero se ha ido por arriba
	jp c,L_B6A7		;b667
	ld (0b87dh),hl		;b66a
	ld ix,0b886h		;b66d   ; El titulo, la primera de las cadenas encadenadas de 0xB886
	call rotula_cadena		;b671
	ld de,00235h		;b674   ; Del titulo a la primera ficha: sus 8 caracteres mas 0x235 son 573 bytes, o sea 24 filas mas abajo y la columna 5
	add hl,de			;b677
	ld ix,0b8c8h		;b678   ; Las ocho fichas de record, que van seguidas: ocho de nombre, seis de puntos y el cero
	ld de,00172h		;b67c   ; De una ficha a la de abajo: sus 14 caracteres mas 0x172 son 384 justos, 16 filas, que es lo que mide un renglon a doble altura
	ld b,008h		;b67f
L_B681:
	push bc			;b681
	push de			;b682
	call rotula_cadena		;b683   ; Nombre y puntos se rotulan de una vez: son la misma cadena
	pop de			;b686
	add hl,de			;b687   ; Y a la ficha siguiente
	pop bc			;b688
	djnz L_B681		;b689
	ret			;b68b
L_B68C:
	ld hl,04f08h		;b68c   ; La pantalla de records empieza con el rotulo por debajo del buffer, en la fila 160
	ld (0b87dh),hl		;b68f
L_B692:
	call borra_buffer		;b692   ; El cuadro: borrar, estrellas, subir el rotulo un escalon y volcar
	call pinta_estrellas		;b695
	call scroll_records		;b698
	call vuelca_pantalla		;b69b
	call hay_tecla		;b69e   ; Con cualquier tecla se corta y se vuelve al titulo
	jp nz,L_A2D5		;b6a1
	jp L_B692		;b6a4
L_B6A7:
	pop hl			;b6a7   ; Aqui ya no se vuelve: el `pop` se come la direccion de retorno del bucle de arriba
	call arranca_musica		;b6a8   ; Con el rotulo fuera, la musica
	nop			;b6ab   ; Tres `nop` seguidos detras del `call`, con pinta de algo quitado a mano; los mismos modales que los dos de 0xEEAF en la fase de naves
	nop			;b6ac
	nop			;b6ad
	xor a			;b6ae
	ld (0d10dh),a		;b6af   ; Apagar 0xD10D es como se le pide a la musica que acabe: op_bucle (0xC78C) mira ese byte para decidir si el guion del canal 1 se repite o se termina
L_B6B2:
	call hay_tecla		;b6b2   ; Y se espera a lo que llegue antes: una tecla...
	jr nz,L_B6C4		;b6b5
	ld bc,003e8h		;b6b7
	call espera		;b6ba
	ld hl,(0d096h)		;b6bd   ; ...o que el canal 1 se quede sin puntero de ejecucion, o sea que la musica se haya acabado
	ld a,h			;b6c0
	or l			;b6c1
	jr nz,L_B6B2		;b6c2
L_B6C4:
	ld hl,0a7f8h		;b6c4   ; La semilla del azar a un valor FIJO -0xA7F8, que la mascara de azar deja en 0x27F8-: sin eso la partida grabada no se repetiria igual
	ld (0ad28h),hl		;b6c7
	ld hl,0a6eeh		;b6ca   ; Y el `call` del lector de mando parcheado al lector de la grabacion: esto de aqui es la DEMO
	ld (0a689h),hl		;b6cd
	jp L_A3B4		;b6d0   ; De ahi en adelante, como una partida cualquiera
entra_en_records:		; Mira si el marcador entra en la tabla: compara los seis digitos contra los ocho campos de puntuacion y, al ganar uno, hace hueco con un `lddr` y salta a la entrada del nombre. Es por donde vuelve todo game over. Gemela de la de naves, 57 de 71 bytes
	ld hl,0b8d0h		;b6d3   ; Los puntos de la primera ficha; el nombre son los ocho bytes de delante
	ld c,008h		;b6d6   ; Las ocho fichas, de la mejor a la peor
L_B6D8:
	ld de,0b87fh		;b6d8   ; Contra los seis digitos del marcador
	push hl			;b6db
	ld b,006h		;b6dc
L_B6DE:
	ld a,(de)			;b6de   ; Digito a digito, empezando por el de mas peso
	cp (hl)			;b6df
	jr c,L_B711		;b6e0   ; Menor: esta ficha no se supera, a probar con la siguiente
	jr z,L_B70D		;b6e2   ; Iguales: al digito de al lado. Un empate exacto recorre los seis y acaba cayendo a la ficha de abajo, o sea que empatar no adelanta a nadie
	ld hl,0b931h		;b6e4   ; Superada: 0xB931 es la ultima de las ocho, que es donde se escribe si no hay nada que correr
	dec c			;b6e7   ; Y eso pasa justo cuando la superada es la ultima
	jr z,L_B700		;b6e8
	ld h,000h		;b6ea   ; Si no, hay que bajar un puesto a todas las de debajo: quince bytes por ficha, contados como hl*16 - hl
	ld l,c			;b6ec
	ld d,h			;b6ed
	ld e,l			;b6ee
	add hl,hl			;b6ef
	add hl,hl			;b6f0
	add hl,hl			;b6f1
	add hl,hl			;b6f2
	sbc hl,de		;b6f3
	ld b,h			;b6f5
	ld c,l			;b6f6
	ld hl,0b930h		;b6f7
	ld de,0b93fh		;b6fa
	lddr		;b6fd   ; El `lddr` las corre de una en una desde el final, y la octava se cae de la tabla
	inc hl			;b6ff   ; Y HL queda en el nombre del hueco que se acaba de abrir
L_B700:
	pop de			;b700   ; Los puntos de la ficha superada, guardados antes del bucle de digitos
	push hl			;b701
	ld hl,0b87fh		;b702   ; El marcador entero a su sitio...
	ld bc,00006h		;b705
	ldir		;b708
	jp L_D3C4		;b70a   ; ...y a meter el nombre, con el puntero al hueco en la pila
L_B70D:
	inc hl			;b70d   ; Digito siguiente
	inc de			;b70e
	djnz L_B6DE		;b70f
L_B711:
	pop hl			;b711   ; Ficha siguiente, quince bytes mas alla
	ld de,0000fh		;b712
	add hl,de			;b715
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
; DATOS textos_de_la_segunda_parte: Textos de la segunda parte: menu,
;   redefinir teclas, records y mensajes (656 B, 75 % imprimible)
;   0xb720..0xb9b0  (656 bytes)
DATA_textos_de_la_segunda_parte:
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


mueve_tiros_torreta:		; Mueve los tiros de las torretas (tabla 0xAD04, max 2): mientras vuelan persiguen al jugador con inercia, y al alcanzarlo -0xBA43 les planta un 0x7C en el +0- pasan a los cuatro fotogramas de explosion
	ld ix,0ad04h		;b9b0
	ld a,(0ad03h)		;b9b4
	and a			;b9b7
	ret z			;b9b8
	ld b,a			;b9b9
L_B9BA:
	push bc			;b9ba
	ld c,(ix+000h)		;b9bb   ; Los dos primeros campos son la velocidad y los dos siguientes la posicion, que es como los quiere persigue_con_inercia
	ld b,(ix+001h)		;b9be
	ld e,(ix+002h)		;b9c1
	ld d,(ix+003h)		;b9c4
	ld hl,(0a6ebh)		;b9c7
	ld a,c			;b9ca   ; El +0 no es una coordenada: es la velocidad horizontal, entre -5 y +5, asi que sumandole 10 no llega a 0x7C ni de lejos
	add a,00ah		;b9cb
	cp 07ch		;b9cd   ; Y por eso el 0x7C reparte: por debajo, el tiro vuela; por encima, esta explotando. El 0x7C se lo planta 0xBA43 al alcanzar al jugador
	jr c,L_B9E9		;b9cf
	ex de,hl			;b9d1
	ld bc,00404h		;b9d2   ; La posicion, corrida cuatro y cuatro para centrar el dibujo de la explosion, que es mas ancho que el tiro
	sbc hl,bc		;b9d5
	sub 03ah		;b9d7   ; El mismo byte da el fotograma: +0 mas 10 menos 0x3A son los dibujos 0x4C a 0x4F
	call pinta_sprite		;b9d9
	inc (ix+000h)		;b9dc   ; Un fotograma por cuadro...
	ld a,(ix+000h)		;b9df
	cp 080h		;b9e2   ; ...y en 0x80, cuatro despues, se borra de la tabla
	jr c,L_BA47		;b9e4
	jp L_BA52		;b9e6
L_B9E9:
	ld a,(ix+004h)		;b9e9   ; Mientras el reloj del +4 aguanta por encima de 0xB4 el tiro va a por el jugador...
	cp 0b4h		;b9ec
	jr nc,L_B9F3		;b9ee
	ld hl,0ff60h		;b9f0   ; ...y cuando baja, a un punto fijo de fuera de la pantalla: el tiro deja de perseguir y se va
L_B9F3:
	ex de,hl			;b9f3
	call persigue_con_inercia		;b9f4   ; Un paso de persecucion con inercia, con la velocidad en el +0/+1 y la posicion en el +2/+3
	ex de,hl			;b9f7
	ld a,d			;b9f8   ; La poda vertical de verdad, esta si sobre la fila: 0xE0 para arriba es haberse salido por el techo
	cp 0e0h		;b9f9
	jr nc,L_BA52		;b9fb
	ld (ix+000h),c		;b9fd   ; La ficha se queda con lo que devuelva: velocidad nueva...
	ld (ix+001h),b		;ba00
	ld (ix+002h),e		;ba03   ; ...y posicion nueva
	ld (ix+003h),d		;ba06
	ld a,(ix+004h)		;ba09   ; El bit 0 del reloj del +4 elige entre los dos dibujos del tiro, y el reloj baja un paso por cuadro
	and 001h		;ba0c
	dec (ix+004h)		;ba0e
	ex de,hl			;ba11
	call pinta_glifo		;ba12
	call disparo_derriba_tiro		;ba15   ; Un disparo del jugador lo puede derribar aqui mismo
	ld a,(0a6edh)		;ba18   ; Con el jugador ya sentenciado -0xA6ED de 4 en adelante- el tiro ya no puede alcanzarlo: el muerto no se muere dos veces
	cp 004h		;ba1b
	jr nc,L_BA47		;ba1d
	ld l,(ix+002h)		;ba1f
	ld h,(ix+003h)		;ba22
	push hl			;ba25   ; Primero el eje horizontal contra la X del jugador...
	ld a,(0a6ech)		;ba26
	ld l,a			;ba29
	ld de,0040ah		;ba2a
	ld bc,00203h		;ba2d
	call solapa_eje		;ba30
	pop hl			;ba33
	jr c,L_BA47		;ba34
	ld h,l			;ba36   ; ...y solo si ese solapa, el vertical
	ld a,(0a6ebh)		;ba37
	ld l,a			;ba3a
	call solapa_eje		;ba3b
	jr c,L_BA47		;ba3e
	call impacto_doble		;ba40
	ld (ix+000h),07ch		;ba43   ; Alcanzado el jugador, el tiro se marca para explotar reutilizando el byte de la velocidad
L_BA47:
	ld de,00005h		;ba47   ; Ficha siguiente, cinco bytes
	add ix,de		;ba4a
L_BA4C:
	pop bc			;ba4c
	dec b			;ba4d
	jp nz,L_B9BA		;ba4e
	ret			;ba51
L_BA52:
	ld hl,0ad03h		;ba52   ; Un tiro menos en la tabla
	dec (hl)			;ba55
	pop bc			;ba56
	push bc			;ba57
	ld a,b			;ba58   ; Si el que se va es el ultimo del recorrido no hay nada que compactar
	cp 001h		;ba59
	jr z,L_BA4C		;ba5b
	push ix		;ba5d
	pop de			;ba5f
	push de			;ba60
	inc de			;ba61   ; Cinco `inc de` son la ficha siguiente...
	inc de			;ba62
	inc de			;ba63
	inc de			;ba64
	inc de			;ba65
	ld hl,0ad0eh		;ba66   ; ...y de ahi hasta 0xAD0E, el final de la tabla, es lo que hay que subir un hueco. Esta mide hasta el final; la del otro compactador del bloque mide (B-1)*8
	and a			;ba69
	sbc hl,de		;ba6a
	ld b,h			;ba6c
	ld c,l			;ba6d
	ex de,hl			;ba6e
	pop de			;ba6f
	ldir		;ba70   ; IX no avanza: la ficha que ocupa el sitio se mira en la vuelta siguiente
	jp L_BA4C		;ba72
dispara:		; Mete disparos en la tabla del jugador (0xACBC) en su posicion mas 0x0404, con la mejora de 0xC459 cuatro en los rumbos base, +2, +4 y +6. OJO: el filtro del gatillo NO es el de la fase de naves: aqui se guarda el estado en 0xC45A y se sale con `xor c / ret z`, o sea que entra cada vez que el boton CAMBIA -al pulsar y al soltar-, no solo al pulsar
	bit 4,a		;ba75   ; El bit 4 de la mascara del mando es el gatillo
	ld bc,(0c45ah)		;ba77   ; El estado del gatillo del cuadro anterior vive en 0xC45A
	ld b,a			;ba7b
	ld a,010h		;ba7c
	jr nz,L_BA82		;ba7e
	ld a,000h		;ba80
L_BA82:
	ld (0c45ah),a		;ba82   ; Se guarda el de ahora...
	xor c			;ba85   ; ...y el `xor` dice si ha CAMBIADO, no si esta pulsado: se dispara al apretar y otra vez al soltar
	ld a,b			;ba86
	ret z			;ba87
	push af			;ba88
	push hl			;ba89
	ld a,(0ad0eh)		;ba8a   ; El rumbo del disparo es el del jugador, en los tres bits bajos de 0xAD0E
	and 007h		;ba8d
	ld bc,00404h		;ba8f   ; El disparo nace cuatro pixeles a la derecha y cuatro por debajo
	add hl,bc			;ba92
	ld b,h			;ba93
	ld c,l			;ba94
	ex af,af'			;ba95
	call alta_objeto_acbb		;ba96   ; El primero, en el rumbo del jugador
	add a,002h		;ba99   ; Y cada uno de los otros tres, dos rumbos mas alla: sobre ocho, dos son un cuarto de vuelta
	and 007h		;ba9b
	ex af,af'			;ba9d
	ld a,(0c459h)		;ba9e   ; Sin la mejora de 0xC459 se queda en uno solo
	and a			;baa1
	jr z,L_BAB7		;baa2
	call alta_objeto_acbb		;baa4
	add a,002h		;baa7
	and 007h		;baa9
	ex af,af'			;baab
	call alta_objeto_acbb		;baac
	add a,002h		;baaf
	and 007h		;bab1
	ex af,af'			;bab3
	call alta_objeto_acbb		;bab4
L_BAB7:
	pop hl			;bab7
	pop af			;bab8
	ret			;bab9
rotula_glifo_menu:		; rotula_glifo con otro recorte, solo para el menu: mismo glifo a doble altura y mismas mascaras de damero, pero sin el recorte de la entrada y con uno por fila que, tal como esta escrito, NO se cumple nunca (compara H contra C, que vale 0x18 fijo). No se nota porque el menu nunca baja tanto
	cp 020h		;baba   ; El mismo `cp 020h` muerto que la de 0xB472, byte por byte
	push hl			;babc
	ld h,000h		;babd
	ld l,a			;babf
	add hl,hl			;bac0
	add hl,hl			;bac1
	add hl,hl			;bac2
	ld de,05f00h		;bac3
	add hl,de			;bac6
	ex de,hl			;bac7
	pop hl			;bac8
	push hl			;bac9
	push de			;baca
	ld bc,00018h		;bacb   ; 0x18 es el ancho del buffer, y a la vez el numero contra el que se compara el byte alto del destino: de ahi que el recorte no sirva
	ld a,008h		;bace
L_BAD0:
	ex af,af'			;bad0
	ld a,h			;bad1   ; El recorte por fila: si H fuese C, la fila se desviaria a 0xF1xx y se perderia. Pero C vale 0x18 y H es una pagina del buffer, de 0x40 a 0x4E: nunca coinciden
	cp c			;bad2
	jr nz,L_BAD7		;bad3
	ld h,0f1h		;bad5
L_BAD7:
	ld a,(de)			;bad7   ; De aqui abajo es la de 0xB48E: borrar con el glifo corrido un pixel...
	rlca			;bad8
	cpl			;bad9
	and (hl)			;bada
	ld (hl),a			;badb
	add hl,bc			;badc   ; Sumar el ancho del buffer es bajar una fila: cada fila del glifo se estampa dos veces
	ld a,(de)			;badd
	rlca			;bade
	cpl			;badf
	and (hl)			;bae0
	ld (hl),a			;bae1
	add hl,bc			;bae2
	inc de			;bae3   ; Byte siguiente del glifo
	ex af,af'			;bae4
	dec a			;bae5   ; Ocho filas y fuera
	jp nz,L_BAD0		;bae6
	pop de			;bae9
	pop hl			;baea
	push hl			;baeb
	add hl,bc			;baec
	ld a,008h		;baed
L_BAEF:
	ex af,af'			;baef
	ld a,h			;baf0
	cp c			;baf1
	jr nz,L_BAF6		;baf2
	ld h,0f1h		;baf4
L_BAF6:
	ld a,(de)			;baf6   ; ...y pintar en damero, una fila los impares y la de al lado los pares
	and 055h		;baf7
	or (hl)			;baf9
	ld (hl),a			;bafa
	add hl,bc			;bafb
	ld a,(de)			;bafc
	and 0aah		;bafd   ; La otra mitad del damero, en la fila de al lado
	or (hl)			;baff
	ld (hl),a			;bb00
	add hl,bc			;bb01   ; Y otra fila abajo
	inc de			;bb02
	ex af,af'			;bb03
	dec a			;bb04   ; Las ocho filas del glifo, tambien aqui
	jp nz,L_BAEF		;bb05
	pop hl			;bb08
	ret			;bb09
rotula_cadena_menu:		; La cadena de rotula_glifo_menu: lee (IX), avanza y sale con el cero. Byte a byte la misma que rotula_cadena, cambiando solo a quien llama
	ld a,(ix+000h)		;bb0a   ; Un caracter de la cadena de IX...
	inc ix		;bb0d
	and a			;bb0f
	ret z			;bb10   ; ...y el cero la cierra
	call rotula_glifo_menu		;bb11
	inc hl			;bb14   ; Un byte del buffer por caracter
	jp rotula_cadena_menu		;bb15
suma_scroll:		; HL = el scroll de 0xC463 mas DE
	ld hl,(0c463h)		;bb18
	add hl,de			;bb1b
	ret			;bb1c
pinta_estrellas:		; Estampa el patron 0x18 -dos pixeles- en 48 posiciones del buffer sacadas de 96 bytes de la ROM del BIOS en 0x07D0, leidos como pares (byte alto enmascarado a 0x4x, byte bajo)
	ld hl,007d0h		;bb1d   ; Noventa y seis bytes de la ROM del BIOS: no hay tabla de estrellas, el ruido se coge prestado de la maquina
	ld b,030h		;bb20   ; Cuarenta y ocho estrellas
L_BB22:
	ld a,(hl)			;bb22
	inc hl			;bb23
	and 00fh		;bb24   ; El primer byte del par, enmascarado a cuatro bits y subido a la pagina del buffer: de 0x40 a 0x4F. Como el buffer acaba en 0x4EFF, las que salgan en la 0x4F se pintan fuera
	add a,040h		;bb26
	ld d,a			;bb28
	ld a,(hl)			;bb29   ; Y el segundo byte, tal cual, es la posicion dentro de la pagina
	inc hl			;bb2a
	ld e,a			;bb2b
	ld a,018h		;bb2c   ; El patron 0x18 son dos pixeles pegados en medio del byte: eso es una estrella
	ld (de),a			;bb2e
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
	ld a,(ix+001h)		;bb3e   ; 0xFF en el +1 quiere decir torreta muerta
	inc a			;bb41
	jr z,L_BB9A		;bb42
	and 00fh		;bb44   ; El contador del +1 da la vuelta cada dieciseis cuadros
	ld (ix+001h),a		;bb46
	ld a,(0ad2ch)		;bb49   ; La fila sale del scroll fino (0xAD2C) mas doce, y la columna es el +0 de la ficha: las seis torretas no tienen fila propia, van todas a la misma altura de pantalla
	add a,00ch		;bb4c
	ld h,a			;bb4e
	ld l,(ix+000h)		;bb4f
	push hl			;bb52
	xor a			;bb53
	ex af,af'			;bb54
	ld b,h			;bb55
	ld c,l			;bb56
	call lanza_tiro_torreta		;bb57   ; Cada torreta viva dispara: mete su tiro en la tabla de 0xAD04
	pop hl			;bb5a
	bit 3,(ix+001h)		;bb5b   ; Solo con el bit 3 del contador -ocho cuadros de cada dieciseis- se dibuja y se deja alcanzar: apagada es invulnerable, pero tampoco deja de disparar
	jr z,L_BB9A		;bb5f
	push hl			;bb61
	ld a,003h		;bb62
	call pinta_glifo		;bb64   ; El dibujo 3 es la torreta
	pop hl			;bb67
	ld iy,0acbch		;bb68   ; Contra la tabla de disparos del jugador, con caja de 4x8
	ld de,00408h		;bb6c
	ld bc,00200h		;bb6f
	call choca_con_tabla		;bb72
	jr c,L_BB9A		;bb75
	ld (iy+002h),080h		;bb77   ; El disparo que acerto se marca con 0x80, que es como se da de baja
	ld a,014h		;bb7b
	ld (0b879h),a		;bb7d   ; Este 0x14 va a 0xB879, uno de los cuatro bytes de 0xB878-0xB87B que no lee nadie en todo el bloque
	ld (ix+001h),0ffh		;bb80   ; La torreta, muerta
	xor a			;bb84
	ld (0bc30h),a		;bb85   ; Y la torre de la cuenta atras vuelve a cero: ninguna fila pintada y la punta otra vez abajo del todo
	ld hl,0106fh		;bb88
	ld (0bc31h),hl		;bb8b
	ld hl,0b882h		;bb8e   ; Los 200 puntos van sobre el digito de las centenas...
	ld a,00fh		;bb91   ; ...pero aqui NO hay `ld b`, al reves que los otros tres premios del bloque: el 2 que se suma es el que quedo en B del `ld bc,00200h` que se le paso a choca_con_tabla como tamano de caja. Y este `ld a,00fh` no lo lee nadie, que suma_puntos pisa A en su primera instruccion
	call premia		;bb93
	ld hl,0bc33h		;bb96   ; Un objetivo menos de los seis
	dec (hl)			;bb99
L_BB9A:
	inc ix		;bb9a   ; Torreta siguiente, dos bytes
	inc ix		;bb9c
	pop bc			;bb9e
	djnz L_BB3D		;bb9f
	ret			;bba1
tic_cuenta_atras:		; El tic de la torre: solo con los 6 objetivos muertos (0xBC33=0) y 1 de cada 16 del contador de cuadros 0xAD27; pinta una fila y a las 161 (0xBC30) salta a tiempo_agotado
	ld a,(0bc33h)		;bba2   ; Hasta que no caigan las seis torretas la cuenta atras no corre
	and a			;bba5
	ret nz			;bba6
	ld a,(0ad27h)		;bba7   ; Y aun asi, una fila cada dieciseis cuadros
	and 00fh		;bbaa
	ret nz			;bbac
	ld a,(0bc30h)		;bbad
	inc a			;bbb0
	ld (0bc30h),a		;bbb1
	cp 0a1h		;bbb4   ; A las 161 filas se acaba el tiempo, que es justo el cuadro siguiente al que llena la columna
	jp z,tiempo_agotado		;bbb6
	xor a			;bbb9
	ld de,0cd9ch		;bbba   ; El tic, en el canal 0
	call arranca_guion_libre		;bbbd
	ld hl,(0bc31h)		;bbc0   ; La punta de la torre, que va subiendo
	call vram_pon_dir		;bbc3
	ld a,07eh		;bbc6   ; Y 0x7E es la fila que se pinta: seis pixeles con un hueco a cada lado
	out (098h),a		;bbc8   ; La fila que crece de la torre blanca de la cuenta atras
	ei			;bbca
	call avanza_torre		;bbcb
	ld (0bc31h),hl		;bbce
	ret			;bbd1
avanza_torre:		; Sube la punta de la torre una fila (0xBC31/32); el salto de tercio del SCREEN 2 es el l|=0x3F / h-=8
	ld a,l			;bbd2   ; Dentro del tercio se sube restando uno...
	and 03fh		;bbd3
	jr z,L_BBD9		;bbd5
	dec hl			;bbd7
	ret			;bbd8
L_BBD9:
	ld a,l			;bbd9   ; ...y al llegar al principio de la columna hay que saltar al tercio de arriba: su ultima fila (l or 0x3F) y 0x800 menos (h - 8)
	or 03fh		;bbda
	ld l,a			;bbdc
	ld a,h			;bbdd
	sub 008h		;bbde
	ld h,a			;bbe0
	ret			;bbe1
borra_torre:		; Borra la torre de la cuenta atras en los tres tercios: los patrones a cero en 0x0050, 0x0840 y 0x1040 (48, 64 y 48 bytes) y los colores a 0xF1 en los 0x2050, 0x2840 y 0x3040 correspondientes
	ld bc,03098h		;bbe2   ; Los tres tramos de la columna 1: 48 filas en el primer tercio, 64 en el segundo y 48 en el tercero. 160 en total, que es lo que mide la torre
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
	ld a,000h		;bbfb   ; Un `nop` de respiro entre byte y byte, que es lo que el VDP necesita
	out (c),a		;bbfd
	nop			;bbff
	djnz L_BBFB		;bc00
	ld bc,03098h		;bc02   ; Y lo mismo en la tabla de colores, con 0xF1: tinta blanca sobre fondo negro
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
	ld a,0f1h		;bc1b   ; Y este es el mismo con 0xF1, byte a byte y con su `nop` de respiro
	out (c),a		;bc1d
	nop			;bc1f
	djnz L_BC1B		;bc20
	ei			;bc22
	ret			;bc23

; ----------------------------------------------------------------------
; DATOS variables_de_la_cuenta_atras: Variables de la cuenta atras: los 6
;   objetivos (2 B cada uno, 0xBC24-0xBC2F), filas de torre pintadas (0xBC30),
;   punta de la torre en VRAM (0xBC31/32), objetivos restantes (0xBC33, que
;   0xA415 pone a 6) y un byte sin dueno (0xBC34)
;   0xbc24..0xbc35  (17 bytes)
DATA_variables_de_la_cuenta_atras:
	defb 0ffh,0ffh	; bc24
	defb 0ffh,0ffh	; bc26
	defb 0ffh,0ffh	; bc28
	defb 0ffh,0ffh	; bc2a
	defb 0ffh,0ffh	; bc2c
	defb 0ffh,0ffh	; bc2e
	defb 000h	; bc30
	defb 000h	; bc31
	defb 000h	; bc32
	defb 000h	; bc33
	defb 000h	; bc34

; ======================================================================
; CODIGO 0xbc35..0xbdaa  (373 bytes)
; ======================================================================


pinta_torre:		; Dibuja la torre, y solo cuando el scroll ha llegado: `ld a,(ix+000h) / sub 044h / ret c` sobre la fila de 0xAD2A, o sea que por debajo de la fila 0x44 no pinta nada
	ld ix,0ad2ah		;bc35
	ld a,(ix+000h)		;bc39   ; La fila del mapa en la que esta la camara
	sub 044h		;bc3c   ; Por debajo de la fila 0x44 la nave todavia no asoma
	ret c			;bc3e
	sub 003h		;bc3f   ; Las cuatro filas de arriba del mapa, contadas al reves: 0x47 menos la fila
	neg		;bc41
	add a,a			;bc43   ; Por 32, que es lo que mide de alto una fila del mapa
	add a,a			;bc44
	add a,a			;bc45
	add a,a			;bc46
	add a,a			;bc47
	add a,040h		;bc48   ; Mas el margen y el scroll fino, y ya sale la fila de pantalla de la nave
	add a,(ix+002h)		;bc4a
	ld c,a			;bc4d
	ld a,(0c462h)		;bc4e   ; Menos el paso del scroll de este cuadro, que el fondo ya se ha movido
	sub c			;bc51
	neg		;bc52
	ld c,a			;bc54
	ld h,a			;bc55
	ld l,008h		;bc56   ; Siempre en la columna 8
	call buffer_dir		;bc58
	ld a,c			;bc5b
	sub 0a0h		;bc5c   ; Y hasta la fila 0xA0: solo se pinta el trozo de nave que ha entrado
	neg		;bc5e
pinta_nave:		; Estampa en el buffer, desde HL y durante A filas, el dibujo de 64x64 de 0x7DDB leido con la pila (ocho `pop de` por fila); si 0xC468 no es cero le anade bajo las dos toberas una llama de (0xC468+8)/2 filas, sacada del final de las dos tablas de 24 bytes de detras del dibujo
	ld c,a			;bc60
	ld a,h			;bc61
	cp 04fh		;bc62   ; Si el sitio se ha ido del buffer, no se pinta nada
	ret nc			;bc64
	ld a,c			;bc65
	ld bc,00011h		;bc66   ; 0x11 son 17: con los siete `inc l` del cuerpo hacen las 24 columnas del buffer, o sea la fila siguiente
	exx			;bc69
	cp 041h		;bc6a   ; Sesenta y cuatro filas como mucho, que es lo que mide el dibujo
	jr c,L_BC70		;bc6c
	ld a,040h		;bc6e
L_BC70:
	ld b,a			;bc70
	ld (L_BCE9+1),sp		;bc71   ; SP se va a usar de lector, asi que el bueno se guarda en el operando del `ld sp` de 0xBCE9
	di			;bc75
	ld sp,07ddbh		;bc76   ; El dibujo de la nave: 64x64 con la mascara y el dibujo intercalados
L_BC79:
	exx			;bc79
	pop de			;bc7a   ; Cada `pop` trae la pareja de esta columna: E la mascara y D el dibujo
	ld a,(hl)			;bc7b   ; El fondo se abre con `and` y se rellena con `or`, sin invertir nada: la mascara viene ya del derecho
	and e			;bc7c
	or d			;bc7d
	ld (hl),a			;bc7e
	inc l			;bc7f   ; Ocho bytes seguidos, que son los 64 pixeles de ancho...
	pop de			;bc80
	ld a,(hl)			;bc81
	and e			;bc82
	or d			;bc83
	ld (hl),a			;bc84
	inc l			;bc85
	pop de			;bc86
	ld a,(hl)			;bc87
	and e			;bc88
	or d			;bc89
	ld (hl),a			;bc8a
	inc l			;bc8b
	pop de			;bc8c
	ld a,(hl)			;bc8d
	and e			;bc8e
	or d			;bc8f
	ld (hl),a			;bc90
	inc l			;bc91
	pop de			;bc92
	ld a,(hl)			;bc93
	and e			;bc94
	or d			;bc95
	ld (hl),a			;bc96
	inc l			;bc97
	pop de			;bc98
	ld a,(hl)			;bc99
	and e			;bc9a
	or d			;bc9b
	ld (hl),a			;bc9c
	inc l			;bc9d
	pop de			;bc9e
	ld a,(hl)			;bc9f
	and e			;bca0
	or d			;bca1
	ld (hl),a			;bca2
	inc l			;bca3
	pop de			;bca4
	ld a,(hl)			;bca5
	and e			;bca6
	or d			;bca7
	ld (hl),a			;bca8
	add hl,bc			;bca9   ; ...y el paso de 0x11 lleva a la fila de abajo
	exx			;bcaa
	djnz L_BC79		;bcab   ; Sesenta y cuatro filas
	exx			;bcad
	ld a,(0ad27h)		;bcae   ; El bit 0 del contador de cuadros elige una de las dos tablas de llama, que son de 24 bytes y van seguidas: la llama parpadea cada cuadro
	and 001h		;bcb1
	ld de,081dbh		;bcb3
	jr z,L_BCBB		;bcb6
	ld de,081f3h		;bcb8
L_BCBB:
	ld a,(0c468h)		;bcbb   ; Con 0xC468 a cero no hay llama
	and a			;bcbe
	jp z,L_BCE9		;bcbf
	add a,008h		;bcc2   ; Y si la hay, mide (0xC468 + 8) / 2 filas
	rra			;bcc4
	exx			;bcc5
	ld b,a			;bcc6
	exx			;bcc7
	ld a,(0c468h)		;bcc8   ; Se entra en la tabla por el final: cuanto mas grande es la llama, mas atras se empieza
	sub 010h		;bccb
	neg		;bccd
	ld c,a			;bccf
	ex de,hl			;bcd0
	add hl,bc			;bcd1
	ld sp,hl			;bcd2   ; La tabla de la llama, a la pila
	ex de,hl			;bcd3
	inc l			;bcd4   ; Y un byte a la derecha del dibujo, que es donde caen las toberas
	exx			;bcd5
L_BCD6:
	exx			;bcd6
	pop de			;bcd7   ; Una sola pareja por fila, que se estampa DOS veces...
	ld a,(hl)			;bcd8
	and e			;bcd9
	or d			;bcda
	ld (hl),a			;bcdb
	ld c,005h		;bcdc   ; ...separadas cinco bytes: las dos toberas echan el mismo fuego
	add hl,bc			;bcde
	ld a,(hl)			;bcdf
	and e			;bce0
	or d			;bce1
	ld (hl),a			;bce2
	ld c,013h		;bce3   ; Y 0x13 mas para caer en la fila siguiente: 1 + 5 + 19 son 24
	add hl,bc			;bce5
	exx			;bce6
	djnz L_BCD6		;bce7
L_BCE9:
	ld sp,00000h		;bce9   ; SP repuesto con el que guardo 0xBC71
	ei			;bcec
	ret			;bced
tiempo_agotado:		; Se acabo el tiempo: flash de dameros, decaimiento de pixeles al azar, y a la tabla de records: game over sin FELICIDADES
	ld hl,0bdaah		;bcee   ; Los dos bytes del patron del destello, sembrados a 0x7E
	ld (hl),07eh		;bcf1
	inc hl			;bcf3
	ld (hl),07eh		;bcf4
	ld a,002h		;bcf6   ; El sonido del final de tiempo, en el canal 2
	ld de,0ce07h		;bcf8
	call arranca_guion		;bcfb
	ld b,014h		;bcfe   ; Veinte destellos...
L_BD00:
	push bc			;bd00
	ld de,02a54h		;bd01   ; ...cada uno con las dos parejas cruzadas: como el patron se acumula con `xor`, la barra va pasando por 0x54, 0x00, 0x2A y 0x7E
	call flash_dameros		;bd04
	ld de,0542ah		;bd07
	call flash_dameros		;bd0a
	pop bc			;bd0d
	djnz L_BD00		;bd0e
	ld hl,0bdaah		;bd10   ; El patron, otra vez a 0x7E para lo que viene
	ld (hl),07eh		;bd13
	inc hl			;bd15
	ld (hl),07eh		;bd16
	ld a,002h		;bd18   ; Y otro guion para el desvanecido
	ld de,0ce11h		;bd1a
	call arranca_guion		;bd1d
	ld bc,0005ah		;bd20   ; 90 por 256 puntos: la pantalla se cae a cachos
L_BD23:
	call azar		;bd23   ; La fila, al azar y mezclada con los dos contadores del bucle
	xor b			;bd26
	xor c			;bd27
	cp 0a0h		;bd28   ; Encajada entre la 8 y la 0xA7, que son las 160 filas del buffer
	jr c,L_BD2E		;bd2a
	sub 080h		;bd2c
L_BD2E:
	add a,008h		;bd2e
	ld d,a			;bd30
	call azar		;bd31   ; Y la columna, igual...
	xor b			;bd34
	xor c			;bd35
	and 01fh		;bd36   ; ...entre la 4 y la 0x1B, las 24 del area de juego
	cp 018h		;bd38
	jr c,L_BD3E		;bd3a
	sub 010h		;bd3c
L_BD3E:
	add a,004h		;bd3e
	ld e,a			;bd40
	call dir_vram_de_fila_columna		;bd41   ; De fila y columna a direccion de VRAM
	di			;bd44
	in a,(099h)		;bd45   ; Aqui se LEE de la VRAM a pelo: el `in a,(099h)` desengancha el latch del puerto y los `add a,a` son el respiro entre acceso y acceso
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
	call azar		;bd54   ; El byte leido se cruza con otro numero al azar: apaga unos pixeles y deja los otros
	and e			;bd57
	ld e,a			;bd58
	call vram_pon_dir		;bd59   ; Y se devuelve a su sitio
	ld a,e			;bd5c
	out (098h),a		;bd5d
	ei			;bd5f
	call azar		;bd60   ; Este `and 018h` no lo lee nadie -el `call azar` de dos lineas mas abajo pisa A-: las tres llamadas seguidas son tiempo y semilla, no un numero
	and 018h		;bd63
	nop			;bd65
	call azar		;bd66
	call azar		;bd69
	and 007h		;bd6c   ; El retardo de verdad: de 1 a 8 vueltas en vacio, para que el desvanecido no sea instantaneo
	inc a			;bd6e
L_BD6F:
	dec a			;bd6f
	jp nz,L_BD6F		;bd70
	djnz L_BD23		;bd73
	dec c			;bd75
	jr nz,L_BD23		;bd76
	jp L_A2D2		;bd78   ; Y de ahi a la tabla de records: game over sin FELICIDADES
flash_dameros:		; El parpadeo del final de tiempo, y NO es de la pantalla entera como figuraba: son los tres tramos de la COLUMNA DE LA TORRE (0x0050, 0x0840 y 0x1040, los mismos sitios que borra_torre pero la mitad de largos), o sea la barra de la cuenta atras. El patron se ACUMULA con `xor` sobre los dos bytes de 0xBDAA, asi que la pareja 0x2A54/0x542A partiendo de 0x7E da la vuelta cada cuatro llamadas -0x54, 0x00, 0x2A, 0x7E- y las veinte del bucle son diez parpadeos
	ld hl,0bdaah		;bd7b   ; El patron no se pone, se ACUMULA: cada llamada le hace `xor` a lo que quedo de la anterior
	ld a,(hl)			;bd7e
	xor d			;bd7f
	ld (hl),a			;bd80
	ld d,a			;bd81
	inc hl			;bd82
	ld a,(hl)			;bd83
	xor e			;bd84
	ld (hl),a			;bd85
	ld e,a			;bd86
	ld b,018h		;bd87   ; Los tres tramos de la columna de la torre, los mismos sitios que borra_torre pero la mitad de largos
	ld hl,00050h		;bd89
	call escribe_par_vram		;bd8c
	ld b,020h		;bd8f
	ld hl,00840h		;bd91
	call escribe_par_vram		;bd94
	ld b,018h		;bd97
	ld hl,01040h		;bd99
escribe_par_vram:		; Escribe la pareja D,E en la VRAM B veces, pero volviendo a dar la direccion en cada vuelta y subiendo HL de UNO en uno: la D de cada vuelta cae encima de la E de la anterior. Lo que queda es la banda entera de D con la E solo en el ultimo byte, asi que la pareja nunca llega a alternarse
	call vram_pon_dir		;bd9c   ; Aqui se vuelve a dar la direccion en CADA vuelta y HL solo sube uno, asi que la D de esta pisa la E de la anterior: la banda acaba entera de D y solo el ultimo byte se queda con E
	ld a,d			;bd9f
	out (098h),a		;bda0
	ld a,e			;bda2
	inc hl			;bda3
	out (098h),a		;bda4   ; El segundo byte va detras sin volver a dar direccion, que el VDP la sube solo
	ei			;bda6
	djnz escribe_par_vram		;bda7
	ret			;bda9

; ----------------------------------------------------------------------
; DATOS relleno_BDAA: Relleno o resto (2 B; 2 bytes)
;   0xbdaa..0xbdac  (2 bytes)
DATA_relleno_BDAA:
	defb 000h,000h	; bdaa

; ======================================================================
; CODIGO 0xbdac..0xbfeb  (575 bytes)
; ======================================================================


rehace_pantalla:		; Coloca la camara en 0x4638, parchea el salto de 0xA98E con el 0xDA que no salta nunca -para que el dibujado pinte todas las celdas de una pasada- y arranca el guion 0xCD80
	ld hl,04638h		;bdac   ; La camara al sitio desde el que arranca el final
	ld (0a6ebh),hl		;bdaf
	ld a,0dah		;bdb2   ; El 0xDA parchea el `jp` de 0xA98E: `jp c` con el acarreo apagado no salta nunca, y asi el fondo se pinta entero de una pasada en vez de en dos mitades
	ld (0a98eh),a		;bdb4
	xor a			;bdb7
	ld de,0cd80h		;bdb8   ; La musica del despegue, en el canal 0
	call arranca_guion		;bdbb
	ld b,010h		;bdbe   ; Dieciseis pasadas, subiendo una fila del buffer cada una: la nave sale de la torre
L_BDC0:
	push bc			;bdc0
	call repinta_todo		;bdc1
	pop bc			;bdc4
	ld hl,(0a6ebh)		;bdc5   ; La posicion del jugador, que a estas alturas ya es la nave...
	ld de,00018h		;bdc8
	and a			;bdcb
	sbc hl,de		;bdcc   ; ...una fila del buffer mas arriba en cada pasada
	ld (0a6ebh),hl		;bdce
	djnz L_BDC0		;bdd1
	ld a,002h		;bdd3   ; La llama arranca valiendo 2
	ld (0c468h),a		;bdd5
L_BDD8:
	ld b,00ah		;bdd8   ; Diez repintados por vuelta
L_BDDA:
	push bc			;bdda
	call repinta_todo		;bddb
	ld hl,0ad27h		;bdde   ; El contador global hay que subirlo a mano, que aqui no corre el cuadro normal
	inc (hl)			;bde1
	ld a,(0c468h)		;bde2   ; Los pasos de scroll son la mitad de la llama: cuanto mas fuego, mas deprisa sube
	rrca			;bde5
L_BDE6:
	push af			;bde6
	scf			;bde7
	call actualiza_scroll		;bde8
	pop af			;bdeb
	dec a			;bdec
	jr nz,L_BDE6		;bded
	ld a,(0ad2ah)		;bdef   ; Con la fila del mapa a cero se ha llegado arriba del todo: escena final
	and a			;bdf2
	pop bc			;bdf3
	jr z,escena_final		;bdf4
	djnz L_BDDA		;bdf6
	ld a,(0c468h)		;bdf8   ; Y si no, la llama crece de dos en dos hasta 16, y ahi se queda
	cp 010h		;bdfb
	jr z,L_BDD8		;bdfd
	inc a			;bdff
	inc a			;be00
	ld (0c468h),a		;be01
	jr L_BDD8		;be04
repinta_todo:		; Rehace la pantalla entera: el fondo desde el mapa, el jugador encima y el volcado del buffer a la VRAM
	call redibuja_fondo		;be06   ; El fondo, desde el mapa
	ld hl,(0a6ebh)		;be09   ; La nave encima, y aqui entera: 0x40 filas
	ld a,040h		;be0c
	call pinta_nave		;be0e
	call vuelca_pantalla		;be11   ; Y el buffer a la pantalla
	ret			;be14
escena_final:		; La pantalla de estrellas del final: silencio, colores, el fondo de 0x6285 al buffer, cuatro esperas largas y el guion 0xCD8F, y luego el bucle que interpreta la animacion de 0x61D8
	ld iy,01388h		;be15   ; Este `ld iy,01388h` no lo lee nadie: hasta 0xBEA6, que es donde IY vuelve a cargarse, no lo mira ni el tramo ni ninguna de las rutinas que se llaman. 5000 en decimal, con pinta de espera quitada
	ld ix,061d8h		;be19   ; El guion de la animacion final, que empieza en 0x61D8
	call sonido_reset		;be1d   ; Silencio, reponiendo el `di` que sonido_off machaco
	ld a,0f1h		;be20   ; Toda la tabla de colores a blanco sobre negro
	call rellena_colores		;be22
	call borra_buffer		;be25
	call pinta_estrellas		;be28
	call copia_al_buffer		;be2b   ; La imagen del final (0x6285) al buffer: 40 filas de 18 bytes centradas
	call vuelca_pantalla		;be2e
	ld bc,00000h		;be31   ; BC a cero son 65536 vueltas, y se hace cuatro veces: el respiro antes de que arranque la escena
	call espera		;be34
	call espera		;be37
	call espera		;be3a
	call espera		;be3d
	xor a			;be40   ; La musica del final, en el canal 0
	ld de,0cd8fh		;be41
	call arranca_guion		;be44
anima_guion:		; Recorre el guion de (IX): 0xC0 termina, un byte por encima de 0xC0 cambia el fotograma parcheando el operando de 0xBE6B, y el resto son parejas (columna, fila) que se pintan con pinta_glifo sobre las estrellas
	call borra_buffer		;be47   ; Cada paso del guion rehace el fondo entero: borrar, estrellas y la imagen
	call pinta_estrellas		;be4a
	call copia_al_buffer		;be4d
	ld a,(ix+000h)		;be50   ; El guion, byte a byte...
	cp 0c0h		;be53   ; ...0xC0 lo termina...
	jr z,L_BE76		;be55
	jr c,L_BE63		;be57   ; ...por debajo de 0xC0 es la columna de una pareja...
	sub 0bdh		;be59   ; ...y por encima, el fotograma: se escribe en el operando del `ld a` de 0xBE6B, o sea que el guion cambia de dibujo parcheando el codigo
	ld (0be6ch),a		;be5b
	inc ix		;be5e
	ld a,(ix+000h)		;be60
L_BE63:
	ld l,a			;be63   ; La pareja son columna y fila, dos bytes
	ld h,(ix+001h)		;be64
	inc ix		;be67
	inc ix		;be69
	ld a,000h		;be6b
	call pinta_glifo		;be6d   ; El dibujo va con pinta_glifo, el de dos bytes de ancho
	call vuelca_pantalla		;be70   ; Un paso de guion por cuadro
	jp anima_guion		;be73
L_BE76:
	ld bc,00000h		;be76   ; Cuatro esperas mas con la escena quieta...
	call espera		;be79
	call espera		;be7c
	call espera		;be7f
	call espera		;be82
	ld hl,001d0h		;be85   ; ...y el cartel de FELICIDADES, que se imprime DIRECTO a la VRAM
	ld ix,0c33bh		;be88
	call rotula_secuencia		;be8c
	ld e,00fh		;be8f   ; Y quince esperas antes del estallido
L_BE91:
	ld bc,00000h		;be91
	call espera		;be94
	dec e			;be97
	jr nz,L_BE91		;be98
	call siembra_metralla		;be9a   ; Las 200 particulas se siembran ANTES de que estalle nada: cuando les toque volar ya estan puestas
	ld a,008h		;be9d   ; Ocho huecos de explosion, escritos en el operando del `ld b` de 0xBEC7
	ld (0bec8h),a		;be9f
	ld ix,0c30bh		;bea2   ; Los huecos, tres bytes cada uno, desde 0xC30B
	ld iy,07d95h		;bea6   ; Y la coreografia del estallido, un byte por cuadro desde 0x7D95
	ld de,00003h		;beaa
	ld b,008h		;bead
L_BEAF:
	ld (ix+000h),000h		;beaf   ; Solo se limpian los OCHO primeros huecos
	add ix,de		;beb3
	djnz L_BEAF		;beb5
	ld b,046h		;beb7   ; Setenta cuadros, uno por byte de la coreografia
L_BEB9:
	push bc			;beb9
	call borra_buffer		;beba
	call pinta_estrellas		;bebd
	call copia_al_buffer		;bec0
	ld ix,0c30bh		;bec3
	ld b,008h		;bec7
	ld a,(iy+000h)		;bec9   ; El byte de la coreografia que vale 1 dobla los huecos a dieciseis...
	dec a			;becc
	jr nz,L_BED4		;becd
	ld a,010h		;becf   ; ...pero los ocho de arriba no los limpia nadie: la cinta los deja a 0xFF, o sea ocupados, y con 80 cuadros para soltarse cuando solo quedan seis no se encienden ni una vez
	ld (0bec8h),a		;bed1
L_BED4:
	ld a,(ix+000h)		;bed4   ; Hueco ocupado: a seguir dibujandolo
	and a			;bed7
	jr nz,L_BF07		;bed8
	bit 7,(iy+000h)		;beda   ; Y hueco libre: se enciende solo si el bit que le toca de la coreografia esta puesto
	jr z,L_BF25		;bede
	xor a			;bee0   ; Cada explosion nueva trae su sonido
	ld de,0cd6dh		;bee1
	push bc			;bee4
	call arranca_guion		;bee5
	pop bc			;bee8
	call posicion_al_azar		;bee9   ; Sitio al azar dentro del area, ocho filas mas arriba
	ld a,h			;beec
	sub 008h		;beed
	ld h,a			;beef
	call azar		;bef0   ; Y una de las dos explosiones echada a suertes: la que arranca en 0x4C o la que arranca en 0x5C
	and 001h		;bef3
	jr z,L_BEF9		;bef5
	ld a,010h		;bef7
L_BEF9:
	add a,04ch		;bef9
	ld (ix+002h),a		;befb
	ld (ix+000h),l		;befe   ; La posicion, al hueco, que a partir de aqui vive sola
	ld (ix+001h),h		;bf01
	ld c,001h		;bf04
	ld a,l			;bf06
L_BF07:
	ld l,a			;bf07   ; El fotograma de este cuadro
	ld h,(ix+001h)		;bf08
	ld a,(ix+002h)		;bf0b
	push bc			;bf0e
	call pinta_sprite		;bf0f
	pop bc			;bf12
	inc (ix+002h)		;bf13   ; Uno por cuadro...
	ld a,(ix+002h)		;bf16
	cp 050h		;bf19   ; ...y al llegar a 0x50 o a 0x60 -el final de cada una de las dos tandas de cuatro- el hueco vuelve a quedar libre
	jr z,L_BF21		;bf1b
	cp 060h		;bf1d
	jr nz,L_BF25		;bf1f
L_BF21:
	ld (ix+000h),000h		;bf21
L_BF25:
	ld de,00003h		;bf25   ; Hueco siguiente, tres bytes...
	add ix,de		;bf28
	rlc (iy+000h)		;bf2a   ; ...y el bit siguiente de la coreografia. Como son ocho rotaciones, el byte acaba el cuadro como lo empezo
	djnz L_BED4		;bf2e
	call vuelca_pantalla		;bf30
	pop bc			;bf33
	inc iy		;bf34   ; Cuadro siguiente de la coreografia
	dec b			;bf36
	jp nz,L_BEB9		;bf37
	ld a,002h		;bf3a   ; Acabada la coreografia, el fogonazo...
	ld de,0ce11h		;bf3c
	call arranca_guion		;bf3f
	call fogonazo_final		;bf42
	ld b,06eh		;bf45   ; ...y 110 cuadros de metralla volando
L_BF47:
	push bc			;bf47
	call borra_buffer		;bf48
	call pinta_estrellas		;bf4b
	call mueve_metralla		;bf4e
	call vuelca_pantalla		;bf51
	pop bc			;bf54
	djnz L_BF47		;bf55
	call borra_buffer		;bf57   ; Se acaba con la pantalla limpia de todo menos estrellas...
	call pinta_estrellas		;bf5a
	call vuelca_pantalla		;bf5d
	ld bc,00000h		;bf60
	call espera		;bf63
	call espera		;bf66
	call espera		;bf69
	jp L_A2D2		;bf6c   ; ...y de ahi al game over de siempre: entra_en_records y el titulo
mueve_metralla:		; Mueve y pinta las 200 particulas del final feliz: posicion+velocidad en un solo add hl,de, poda fuera de pantalla, y 4 filas de brillo al azar en el buffer
	ld ix,0bfebh		;bf6f
	ld c,0c8h		;bf73
L_BF75:
	ld e,(ix+000h)		;bf75   ; Velocidad en el +0/+1 y posicion en el +2/+3
	ld d,(ix+001h)		;bf78
	ld l,(ix+002h)		;bf7b
	ld h,(ix+003h)		;bf7e
	add hl,de			;bf81   ; Un solo `add hl,de` mueve las dos cosas: L es la columna y H la fila
	ld a,h			;bf82
	cp 0a0h		;bf83   ; Pasada la fila 0xA0...
	jr nc,L_BFAD		;bf85
	ld a,l			;bf87
	cp 0c0h		;bf88   ; ...o la columna 0xC0, la particula ni se guarda ni se pinta: se queda con su ultima posicion buena y ya no vuelve a salir, porque la suma da lo mismo cada cuadro
	jr nc,L_BFAD		;bf8a
	ld (ix+002h),l		;bf8c
	ld (ix+003h),h		;bf8f
	srl l		;bf92   ; La columna entre ocho, que buffer_dir la quiere en bytes
	srl l		;bf94
	srl l		;bf96
	call buffer_dir		;bf98
	ld de,00018h		;bf9b
	ld b,004h		;bf9e   ; Cuatro filas de brillo por particula
L_BFA0:
	call azar		;bfa0
	and 03ch		;bfa3   ; El dibujo tambien es al azar, recortado a los cuatro pixeles de en medio del byte
	ld (hl),a			;bfa5
	and 018h		;bfa6
	out (0feh),a		;bfa8   ; FOSIL DEL SPECTRUM: 0xFE es el puerto del borde (y altavoz) del Spectrum; en MSX este out no hace nada
	add hl,de			;bfaa
	djnz L_BFA0		;bfab
L_BFAD:
	ld de,00004h		;bfad   ; Particula siguiente, cuatro bytes
	add ix,de		;bfb0
	dec c			;bfb2
	jr nz,L_BF75		;bfb3
	ret			;bfb5
siembra_metralla:		; Siembra las 200 particulas de la nave insignia explotando, en la tabla de 0xBFEB (4 B cada una): dx de -7 a +8 sin el cero, y dy de -14 a -2 mas el +1. OJO, que la vertical figuraba como "-13..+2": el `dec a` de 0xBFD4 no solo compara, se queda con el valor, asi que lo que se guarda es (azar and 0x0F) - 14. Trece salidas hacia ARRIBA por cada una hacia abajo, y ni el 0 ni el -1 salen nunca
	ld ix,0bfebh		;bfb6   ; Doscientas particulas de cuatro bytes desde 0xBFEB
	ld b,0c8h		;bfba
L_BFBC:
	call posicion_al_azar		;bfbc   ; Cada una nace en un sitio al azar del area de juego
L_BFBF:
	call azar		;bfbf   ; La velocidad horizontal, de -7 a +8, y el cero se vuelve a tirar: ninguna sale recta
	and 00fh		;bfc2
	sub 007h		;bfc4
	jr z,L_BFBF		;bfc6
	ld (ix+000h),a		;bfc8
L_BFCB:
	call azar		;bfcb   ; Y la vertical, con dos filtros seguidos...
	and 00fh		;bfce
	sub 00dh		;bfd0
	jr z,L_BFCB		;bfd2
	dec a			;bfd4   ; ...y ojo con este `dec a`, que no solo compara: se queda con el valor. Lo que se guarda es azar-14, o sea de -14 a -2 mas el +1, con trece salidas hacia arriba por cada una hacia abajo
	jr z,L_BFCB		;bfd5
	ld (ix+001h),a		;bfd7
	ld a,h			;bfda   ; La fila se guarda con 0x20 menos, que es como la quiere el pintor
	sub 020h		;bfdb
	ld (ix+002h),l		;bfdd
	ld (ix+003h),a		;bfe0
	ld de,00004h		;bfe3   ; Particula siguiente
	add ix,de		;bfe6
	djnz L_BFBC		;bfe8
	ret			;bfea

; ----------------------------------------------------------------------
; DATOS relleno_BFEB: Relleno (22 B; 22 de 22 bytes son 0xFF)
;   0xbfeb..0xc001  (22 bytes)
DATA_relleno_BFEB:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfeb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bffb

; ----------------------------------------------------------------------
; DATOS graficos_C001: Graficos (987 B; racha 10.91, entropia 1.35, 29
;   valores: rachas mas largas que el azar)
;   0xc001..0xc3dc  (987 bytes)
DATA_graficos_C001:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c001  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c011  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c021  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c031  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c041  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c051  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c061  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c071  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c081  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c091  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c0a1  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c0b1  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c0c1  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c0d1  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c0e1  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c0f1  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c101  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c111  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c121  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c131  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c141  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c151  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c161  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c171  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c181  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c191  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c1a1  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c1b1  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c1c1  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c1d1  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c1e1  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c1f1  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c201  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c211  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c221  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c231  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c241  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c251  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c261  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c271  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c281  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c291  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c2a1  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c2b1  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c2c1  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c2d1  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c2e1  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c2f1  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c301  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c311  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c321  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,021h,021h,021h,020h,046h,045h	; c331  ..........!!! FE
	defb 04ch,049h,043h,049h,044h,041h,044h,045h,053h,020h,021h,021h,021h,00dh,00dh,048h	; c341  LICIDADES !!!..H
	defb 041h,053h,020h,043h,04fh,04eh,053h,045h,047h,055h,049h,044h,04fh,020h,044h,045h	; c351  AS CONSEGUIDO DE
	defb 053h,054h,052h,055h,049h,052h,00dh,00dh,04ch,04fh,053h,020h,043h,045h,04eh,054h	; c361  STRUIR..LOS CENT
	defb 052h,04fh,053h,020h,050h,052h,049h,04eh,043h,049h,050h,041h,04ch,045h,053h,00dh	; c371  ROS PRINCIPALES.
	defb 00dh,020h,020h,044h,045h,020h,04ch,041h,020h,04eh,041h,056h,045h,020h,049h,04eh	; c381  .  DE LA NAVE IN
	defb 053h,049h,047h,04eh,049h,041h,02ch,00dh,00dh,020h,059h,020h,041h,044h,045h,04dh	; c391  SIGNIA,.. Y ADEM
	defb 041h,053h,020h,04ch,04fh,047h,052h,041h,053h,054h,045h,020h,048h,055h,049h,052h	; c3a1  AS LOGRASTE HUIR
	defb 00dh,00dh,001h,00bh,054h,052h,041h,053h,020h,045h,04ch,04ch,04fh,02eh,00dh,014h	; c3b1  ....TRAS ELLO...
	defb 014h,00dh,020h,02eh,02eh,02eh,059h,041h,020h,045h,052h,045h,053h,020h,055h,04eh	; c3c1  .. ...YA ERES UN
	defb 020h,048h,045h,052h,04fh,045h,02eh,02eh,02eh,00dh,000h	; c3d1   HEROE.....

; ======================================================================
; CODIGO 0xc3dc..0xc459  (125 bytes)
; ======================================================================


posicion_al_azar:		; Saca una posicion al azar dentro del area de juego, repitiendo la tirada hasta que cae dentro: la columna entre 0x18 y 0xA7 (azar por debajo de 0x90) y la fila entre 0x98 y 0xBF (azar and 0x3F por debajo de 0x28)
	call azar		;c3dc
	cp 090h		;c3df
	jr nc,posicion_al_azar		;c3e1
	add a,018h		;c3e3
	ld l,a			;c3e5
L_C3E6:
	call azar		;c3e6
	and 03fh		;c3e9
	cp 028h		;c3eb
	jr nc,L_C3E6		;c3ed
	add a,098h		;c3ef
	ld h,a			;c3f1
	push hl			;c3f2
	ld a,h			;c3f3
	sub 020h		;c3f4
	ld h,a			;c3f6
	srl l		;c3f7
	srl l		;c3f9
	srl l		;c3fb
	call buffer_dir		;c3fd
	ld a,(hl)			;c400
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
	ldi		;c42a
	ldi		;c42c
	ldi		;c42e
	ldi		;c430
	ldi		;c432
	ldi		;c434
	ldi		;c436
	ldi		;c438
	ldi		;c43a
	ldi		;c43c
	ldi		;c43e
	ldi		;c440
	ldi		;c442
	ldi		;c444
	ldi		;c446
	ldi		;c448
	ldi		;c44a
	ldi		;c44c
	ret po			;c44e
	push hl			;c44f
	ld hl,00006h		;c450
	add hl,de			;c453
	ex de,hl			;c454
	pop hl			;c455
	jp L_C42A		;c456

; ----------------------------------------------------------------------
; DATOS variables_C459: Variables (17 B): eran 5 B de "relleno o resto" mas 12
;   que el
;   0xc459..0xc46a  (17 bytes)
DATA_variables_C459:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,010h	; c459  ................
	defb 000h	; c469

; ----------------------------------------------------------------------
; DATOS colores_de_la_fase: Los CUATRO COLORES de la fase (E1/B1/A1/71, tinta
;   sobre negro): el arranque del nivel elige uno AL AZAR (call azar / and 3
;   en 0xA48F, HL = 0xC46A + n en 0xA494) y L_D31C lo aplica. Por eso la fase
;   de a pie no siempre se ve del mismo color. (Estuvo como "sin clasificar:
;   no se referencian desde ningun sitio", y la referencia existia: el ld
;   de,0c46ah de 0xA494)
;   0xc46a..0xc46e  (4 bytes)
DATA_colores_de_la_fase:
	defb 0e1h,0b1h,0a1h,071h	; c46a

; ======================================================================
; CODIGO 0xc46e..0xc8f7  (1161 bytes)
; ======================================================================


interrupcion:		; El epilogo de la interrupcion, enganchado en H.TIMI: `pop hl` para tirar la vuelta a la ROM, una llamada al motor de sonido y los diez pares de registros desapilados en orden. Gemela de la de la fase de naves, 19 de 21 bytes
	di			;c46e
	pop hl			;c46f
	call tic_sonido		;c470
	pop ix		;c473
	pop iy		;c475
	pop af			;c477
	pop bc			;c478
	pop de			;c479
	pop hl			;c47a
	ex af,af'			;c47b
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
	ld (arranca_guion),a		;c49c
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
	add hl,de			;c4b1
	push hl			;c4b2
	ld a,(hl)			;c4b3
	inc hl			;c4b4
	or (hl)			;c4b5
	jr z,L_C4CA		;c4b6
	ld d,003h		;c4b8
	ld hl,0d068h		;c4ba
	ld bc,0002eh		;c4bd
L_C4C0:
	inc hl			;c4c0
	ld a,(hl)			;c4c1
	dec hl			;c4c2
	or (hl)			;c4c3
	jr z,L_C4CD		;c4c4
	add hl,bc			;c4c6
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
	add hl,de			;c4de
L_C4DF:
	push hl			;c4df
	xor a			;c4e0
	ld b,02eh		;c4e1
L_C4E3:
	ld (hl),a			;c4e3
	inc hl			;c4e4
	djnz L_C4E3		;c4e5
	pop hl			;c4e7
	pop de			;c4e8
	ld (hl),e			;c4e9
	inc hl			;c4ea
	ld (hl),d			;c4eb
	inc hl			;c4ec
	ld (hl),e			;c4ed
	inc hl			;c4ee
	ld (hl),d			;c4ef
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
	ld a,(bc)			;c536
	cp 080h		;c537
	jp c,L_C545		;c539
	sub 080h		;c53c
	ld hl,0cabeh		;c53e
	call lee_puntero		;c541
	jp (hl)			;c544
L_C545:
	push af			;c545
	call estado_canal_actual		;c546
	pop af			;c549
	add a,(hl)			;c54a
	ld hl,0c9feh		;c54b
	call lee_puntero		;c54e
	ld (ix+00ah),l		;c551
	ld (ix+00bh),h		;c554
	inc bc			;c557
L_C558:
	ld a,(ix+008h)		;c558
	call mezclador_canal		;c55b
	call carga_envolvente_1		;c55e
	ld (ix+02ah),000h		;c561
	call carga_envolvente_2		;c565
	ld (ix+02bh),000h		;c568
	ld (ix+02ch),000h		;c56c
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
	push ix		;c58f
	pop iy		;c591
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
	inc iy		;c5c0
	dec d			;c5c2
	jr nz,L_C597		;c5c3
L_C5C5:
	ld a,c			;c5c5
	or a			;c5c6
	jr nz,L_C5D0		;c5c7
	bit 0,(ix+02dh)		;c5c9
	call nz,carga_envolvente_1		;c5cd
L_C5D0:
	push ix		;c5d0
	pop iy		;c5d2
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
	inc iy		;c62b
	dec d			;c62d
	jr nz,L_C5D8		;c62e
L_C630:
	ld a,c			;c630
	or a			;c631
	jr nz,L_C63B		;c632
	bit 1,(ix+02dh)		;c634
	call nz,carga_envolvente_2		;c638
L_C63B:
	pop bc			;c63b
	pop de			;c63c
	pop hl			;c63d
	ld a,(ix+009h)		;c63e
	add a,(ix+02ah)		;c641
	and 00fh		;c644
	ld (hl),a			;c646
	ld a,(ix+00ah)		;c647
	add a,(ix+02bh)		;c64a
	ld (de),a			;c64d
	inc de			;c64e
	ld a,(ix+00bh)		;c64f
	adc a,(ix+02ch)		;c652
	ld (de),a			;c655
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
	inc iy		;c696
	dec d			;c698
	jr nz,L_C66D		;c699
L_C69B:
	ld a,c			;c69b
	or a			;c69c
	jr nz,L_C6A7		;c69d
	ld a,(0d0fch)		;c69f
	bit 2,a		;c6a2
	call nz,refresca_globales_sonido		;c6a4
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
	push ix		;c6b7
	ld d,002h		;c6b9
L_C6BB:
	ld a,(ix+020h)		;c6bb
	ld (ix+00ch),a		;c6be
	ld a,(ix+016h)		;c6c1
	ld (ix+00eh),a		;c6c4
	inc ix		;c6c7
	dec d			;c6c9
	jr nz,L_C6BB		;c6ca
	pop ix		;c6cc
	ret			;c6ce
carga_envolvente_2:		; Lo mismo con tres parejas; tambien identica
	ld d,003h		;c6cf
	push ix		;c6d1
L_C6D3:
	ld a,(ix+022h)		;c6d3
	ld (ix+010h),a		;c6d6
	ld a,(ix+018h)		;c6d9
	ld (ix+013h),a		;c6dc
	inc ix		;c6df
	dec d			;c6e1
	jr nz,L_C6D3		;c6e2
	pop ix		;c6e4
	ret			;c6e6
refresca_globales_sonido:		; Refresca las variables globales del interprete desde 0xD0F2, que es 0xD068 + 3*46: justo detras del tercer estado de canal
	ld d,002h		;c6e7
	push iy		;c6e9
	ld iy,0d0f2h		;c6eb
L_C6EF:
	ld a,(iy+008h)		;c6ef
	ld (iy+000h),a		;c6f2
	ld a,(iy+004h)		;c6f5
	ld (iy+002h),a		;c6f8
	inc iy		;c6fb
	dec d			;c6fd
	jr nz,L_C6EF		;c6fe
	pop iy		;c700
	ret			;c702
op_volumen:		; 0x80 n: mete el argumento en (ix+009), el volumen base de la voz. Quien lo usa es el volcado de 0xC63E, que le suma la envolvente de volumen (ix+02A), lo recorta con `and 00fh` y lo deja en 0xD108+canal; sus 57 argumentos en la musica del bloque van de 0x00 a 0x0F, o sea que ya vienen cabiendo en los cuatro bits
	inc bc			;c703
	ld a,(bc)			;c704
	ld (ix+009h),a		;c705
	inc bc			;c708
	jp L_C536		;c709
op_duracion:		; 0x83 n: (ix+006/007) = argumento por el tempo, con mul_a_de y el tempo leido de 0xD10B (`ld de,(0d10bh) / ld d,000h`: solo el byte bajo, porque el alto seria 0xD10C, que es el numero de canal). Es el valor de RECARGA, no la cuenta atras: quien lo copia a (ix+004/005) es 0xC570
	inc bc			;c70c
	ld a,(bc)			;c70d
	ld de,(0d10bh)		;c70e
	ld d,000h		;c712
	call mul_a_de		;c714
	ld (ix+006h),l		;c717
	ld (ix+007h),h		;c71a
	inc bc			;c71d
	jp L_C536		;c71e
op_tono_ruido:		; 0x81 n: (ix+008) = argumento and 0x09, que son los bits 0 y 3, la pareja tono/ruido del registro 7 del PSG. OJO AL SENTIDO: el mezclador de 0xC83E aplica el argumento COMPLEMENTADO, asi que un bit PUESTO enciende el generador. Lo confirma la musica, cuyos 28 argumentos son solo 0x01 (tono, 19 veces), 0x08 (ruido, 8) y 0x09 (los dos, 1)
	inc bc			;c721
	ld a,(bc)			;c722
	and 009h		;c723
	ld (ix+008h),a		;c725
	inc bc			;c728
	jp L_C536		;c729
op_fin:		; 0x8B: cierra la voz. Borra los 46 bytes de su estado (`ld b,02eh`), pone a cero su transposicion en 0xD114+canal y repone el `di` (0xF3) en la cabecera de arranca_guion y arranca_guion_libre, deshaciendo el `ret` (0xC9) que planto sonido_off; y si el canal que acaba es el mismo que anoto op_efecto en 0xD0FF, limpia ademas 0xD0F2-0xD0FC y 0xD0FE, saltandose 0xD0FD -el periodo de ruido- porque el `ldir` es de diez. Es UN BYTE mas largo que el 0xE418 de naves, y esa es la razon de que los manejadores de aqui en adelante lleven delta 0x1CEB y los anteriores 0x1CEC
	push ix		;c72c
	pop hl			;c72e
	xor a			;c72f
	ld b,02eh		;c730
L_C732:
	ld (hl),a			;c732
	inc hl			;c733
	djnz L_C732		;c734
	ld a,0f3h		;c736
	ld (arranca_guion_libre),a		;c738
	ld (arranca_guion),a		;c73b
	call estado_canal_actual		;c73e
	ld (hl),b			;c741
	ld hl,0d0ffh		;c742
	xor (hl)			;c745
	jp nz,L_C63B		;c746
	ld hl,0d0f2h		;c749
	ld de,0d0f3h		;c74c
	ld bc,0000ah		;c74f
	ld (hl),a			;c752
	ldir		;c753
	inc de			;c755
	ld (de),a			;c756
	jp L_C63B		;c757
op_tempo:		; 0x85 n: 0xD10B = 6000 / (argumento * 8), con mul_a_de para el producto y la division de 0xC8BB, guardando solo el byte bajo del cociente. Es el multiplicador que aplica op_duracion, asi que a MAS argumento, tempo mas corto y musica mas rapida; sus diez apariciones son 0x32, 0xA0 (ocho veces) y 0xFF, que dan 15, 4 y 2
	inc bc			;c75a
	ld a,(bc)			;c75b
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
	ld a,(bc)			;c775
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
	ld a,(bc)			;c7a8
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
	ld a,(bc)			;c7c4
	ld de,0000fh		;c7c5
	call mul_a_de		;c7c8
	ld de,0c8f7h		;c7cb
	add hl,de			;c7ce
	push ix		;c7cf
	ld d,00fh		;c7d1
L_C7D3:
	ld a,(hl)			;c7d3
	ld (ix+016h),a		;c7d4
	inc hl			;c7d7
	inc ix		;c7d8
	dec d			;c7da
	jp nz,L_C7D3		;c7db
	pop ix		;c7de
	inc bc			;c7e0
	ld (ix+00ch),000h		;c7e1
	ld (ix+00dh),000h		;c7e5
	ld (ix+010h),000h		;c7e9
	ld (ix+011h),000h		;c7ed
	ld (ix+012h),000h		;c7f1
	ld (ix+02ah),000h		;c7f5
	ld (ix+02bh),000h		;c7f9
	ld (ix+02ch),000h		;c7fd
	jp L_C536		;c801
op_efecto:		; 0x89 n: arranca el barrido del RUIDO. Copia los seis bytes del efecto n -de 0xC9E7 + n*6- a las globales 0xD0F6-0xD0FB, que son las dos fases de la envolvente que va sumando en 0xD0FE; pone a cero 0xD0F2/0xD0F3 y el propio 0xD0FE, apaga el bit 2 de las banderas 0xD0FC -el que hace que la envolvente se recargue sola- y anota en 0xD0FF el canal que lo lanzo, que es a quien op_fin le pedira cuentas. La musica solo pide los efectos 0 y 3, y en el replay entero salta UNA vez
	inc bc			;c804
	ld a,(0d0fch)		;c805
	res 2,a		;c808
	ld (0d0fch),a		;c80a
	ld a,(bc)			;c80d
	ld de,00006h		;c80e
	call mul_a_de		;c811
	ld de,0c9e7h		;c814
	add hl,de			;c817
	ld iy,0d0f2h		;c818
	ld (iy+000h),000h		;c81c
	ld (iy+001h),000h		;c820
	ld d,006h		;c824
L_C826:
	ld a,(hl)			;c826
	ld (iy+004h),a		;c827
	inc hl			;c82a
	inc iy		;c82b
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
	rl e		;c84b
	sla d		;c84d
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
	ld a,(bc)			;c86c
	inc bc			;c86d
	ld de,0d10eh		;c86e
	add hl,de			;c871
	ld (hl),c			;c872
	inc hl			;c873
	ld (hl),b			;c874
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
	add hl,de			;c88a
	ld c,(hl)			;c88b
	inc hl			;c88c
	ld b,(hl)			;c88d
	jp L_C536		;c88e
op_transporte:		; 0x8E n: escribe el argumento en 0xD114 + canal, que es la TRANSPOSICION de la voz: el lector de notas se lo suma al numero de nota antes de buscar el periodo en la tabla de 0xC9FE (`call estado_canal_actual / add a,(hl)` en 0xC546). La musica lo usa 34 veces, con 2, 5, 9, 11 y 14 hacia arriba y con 0xF6, 0xFD y 0xFF -o sea -10, -3 y -1 semitonos- hacia abajo
	inc bc			;c891
	call estado_canal_actual		;c892
	ld a,(bc)			;c895
	inc bc			;c896
	ld (hl),a			;c897
	jp L_C536		;c898
estado_canal_actual:		; HL = 0xD114 + el numero que haya en 0xD10C: la entrada del canal que el interprete esta atendiendo
	ld a,(0d10ch)		;c89b
	ld l,a			;c89e
	ld h,000h		;c89f
	ld de,0d114h		;c8a1
	add hl,de			;c8a4
	ret			;c8a5
mul_a_de:		; HL = A * DE por desplazamiento y suma; identica byte a byte a la del bloque de naves
	ld hl,00000h		;c8a6
	and a			;c8a9
	ret z			;c8aa
	push bc			;c8ab
	ld b,008h		;c8ac
L_C8AE:
	srl a		;c8ae
	jr nc,L_C8B3		;c8b0
	add hl,de			;c8b2
L_C8B3:
	sla e		;c8b3
	rl d		;c8b5
	djnz L_C8AE		;c8b7
	pop bc			;c8b9
	ret			;c8ba
div_bc_de:		; BC = BC / DE por restas y desplazamientos, dieciseis vueltas de `rl c / rla / adc hl,hl / sbc hl,de`, dejando el resto en HL y conservando AF; simulada contra 4000 divisiones al azar da el cociente y el resto exactos. Su unico cliente es op_tempo, que la llama con BC = 0x1770 = 6000 y DE = argumento*8. Gemela de la 0xE5A6 de la fase de naves
	push af			;c8bb
	ld hl,00000h		;c8bc
	ld a,b			;c8bf
	ld b,010h		;c8c0
L_C8C2:
	rl c		;c8c2
	rla			;c8c4
	adc hl,hl		;c8c5
	sbc hl,de		;c8c7
	jr nc,L_C8CC		;c8c9
	add hl,de			;c8cb
L_C8CC:
	ccf			;c8cc
	djnz L_C8C2		;c8cd
	rl c		;c8cf
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
	ld a,(hl)			;c8dc
	inc hl			;c8dd
	ld h,(hl)			;c8de
	ld l,a			;c8df
	pop af			;c8e0
	ret			;c8e1
vuelca_psg:		; Vuelca al PSG los once bytes del bloque sombra 0xD100-0xD10A, que son los registros 0 a 10 del chip -los tres periodos de tono, el del ruido, el mezclador y los tres volumenes-, alternando el numero de registro por el puerto 0xA0 y el dato por el 0xA1. La llama tic_sonido una sola vez por interrupcion, al final, con los tres canales ya resueltos. Sus dieciocho ultimos bytes (0xC8E5-0xC8F6) son los de 0xE5D0 de la fase de naves sin tocar una coma; lo unico distinto son los tres del `ld hl,0d100h`
	ld hl,0d100h		;c8e2
	ld a,000h		;c8e5
	ld d,00bh		;c8e7
L_C8E9:
	push af			;c8e9
	ld c,(hl)			;c8ea
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
; DATOS instrumentos: Tabla de instrumentos: 16 entradas de 15 B que el
;   comando 0x87 copia a (ix+016), las dos fases de la envolvente de volumen y
;   las tres de la de tono. La musica pide hasta el instrumento 15, o sea que
;   las dieciseis hacen falta
;   0xc8f7..0xc9e7  (240 bytes)
DATA_instrumentos:
	defb 001h,00bh,032h,000h,000h,004h,0ffh,008h,000h,000h,000h,003h,000h,000h,000h	; c8f7  ..2............
	defb 002h,00bh,001h,001h,000h,002h,0ffh,004h,0feh,000h,002h,007h,000h,000h,000h	; c906  ...............
	defb 00ah,000h,000h,000h,000h,0ffh,000h,000h,000h,000h,003h,000h,000h,000h,000h	; c915  ...............
	defb 00fh,00fh,028h,000h,000h,001h,0ffh,001h,000h,000h,000h,004h,001h,000h,000h	; c924  ..(............
	defb 005h,00fh,000h,000h,000h,003h,0ffh,000h,000h,000h,000h,002h,000h,000h,000h	; c933  ...............
	defb 00fh,005h,000h,000h,000h,001h,0ffh,000h,000h,000h,001h,028h,000h,000h,000h	; c942  ...........(...
	defb 006h,00ch,01eh,000h,000h,002h,0ffh,000h,000h,000h,001h,004h,003h,000h,000h	; c951  ...............
	defb 005h,00fh,000h,000h,000h,003h,0ffh,000h,000h,000h,000h,00fh,000h,000h,000h	; c960  ...............
	defb 00ah,000h,000h,000h,000h,0ffh,000h,000h,000h,000h,002h,000h,000h,000h,000h	; c96f  ...............
	defb 001h,001h,000h,000h,000h,000h,0f9h,000h,000h,000h,003h,000h,000h,000h,000h	; c97e  ...............
	defb 006h,000h,000h,000h,000h,0ffh,000h,000h,000h,000h,00ah,000h,000h,000h,000h	; c98d  ...............
	defb 003h,00ch,000h,000h,000h,001h,0ffh,000h,000h,000h,00ah,00ah,000h,000h,000h	; c99c  ...............
	defb 001h,006h,00fh,000h,000h,004h,0ffh,014h,000h,000h,000h,003h,001h,000h,000h	; c9ab  ...............
	defb 00fh,000h,000h,000h,000h,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h	; c9ba  ...............
	defb 00fh,000h,000h,000h,000h,0ffh,000h,000h,000h,000h,004h,000h,000h,000h,000h	; c9c9  ...............
	defb 002h,001h,000h,000h,000h,0feh,002h,000h,000h,000h,001h,002h,000h,000h,000h	; c9d8  ...............

; ----------------------------------------------------------------------
; DATOS efectos_ruido: Tabla de efectos de ruido: entradas de 6 B que el
;   comando 0x89 copia a 0xD0F6-0xD0FB. Caben TRES enteras y una cuarta a la
;   que le falta el sexto byte, que ya es el primero de la tabla de notas. Ese
;   byte prestado SI se copia -el bucle de op_efecto es de seis fijos, `ld
;   d,006h`-, pero es inerte: cae en la espera de la segunda fase de la
;   envolvente, y esa fase tiene cero pasos. La musica de este bloque pide la
;   0 y la 3, o sea que usa justamente la truncada
;   0xc9e7..0xc9fe  (23 bytes)
DATA_efectos_ruido:
	defb 020h,000h,001h,000h,002h,000h	; c9e7
	defb 001h,008h,010h,0feh,000h,000h	; c9ed
	defb 020h,000h,0ffh,000h,014h,001h	; c9f3
	defb 01fh,000h,0ffh,032h,008h	; c9f9

; ----------------------------------------------------------------------
; DATOS tabla_de_notas: La TABLA DE NOTAS del interprete de sonido: 96
;   periodos de 16 bits, ocho octavas de do1 a si8. Es BYTE A BYTE la misma
;   que la del juego de naves (0xE6E3), los 192 bytes. Estuvo dentro del rango
;   declarado como graficos, que llegaba hasta 0xCAA0 y se pasaba
;   0xc9fe..0xcabe  (192 bytes)
DATA_tabla_de_notas:
	defw 00d5dh,00c9dh,00be7h,00b3ch,00a9bh,00a03h,00973h,008ebh	; c9fe
	defw 0086bh,007f2h,00780h,00714h,006aeh,0064eh,005f4h,0059eh	; ca0e
	defw 0054dh,00501h,004b9h,00475h,00435h,003f9h,003c0h,0038ah	; ca1e
	defw 00357h,00327h,002fah,002cfh,002a7h,00281h,0025dh,0023bh	; ca2e
	defw 0021bh,001fch,001e0h,001c5h,001ach,00194h,0017dh,00168h	; ca3e
	defw 00153h,00140h,0012eh,0011dh,0010dh,000feh,000f0h,000e2h	; ca4e
	defw 000d6h,000cah,000beh,000b4h,000aah,000a0h,00097h,0008fh	; ca5e
	defw 00087h,0007fh,00078h,00071h,0006bh,00065h,0005fh,0005ah	; ca6e
	defw 00055h,00050h,0004ch,00047h,00043h,00040h,0003ch,00039h	; ca7e
	defw 00035h,00032h,00030h,0002dh,0002ah,00028h,00026h,00024h	; ca8e
	defw 00022h,00020h,0001eh,0001ch,0001bh,00019h,00018h,00016h	; ca9e
	defw 00015h,00014h,00013h,00012h,00011h,00010h,0000fh,0000eh	; caae

; ----------------------------------------------------------------------
; DATOS tabla_de_opcodes: La tabla de saltos de los QUINCE opcodes del
;   interprete: 15 punteros de 2 B. Son los del juego de naves (0xE7A3)
;   reubicados unos 0x1CEB, con una holgura de un byte segun el opcode porque
;   el codigo no es copia exacta
;   0xcabe..0xcadc  (30 bytes)
DATA_tabla_de_opcodes:
	defw 0c703h	; cabe  -> op_volumen
	defw 0c721h	; cac0  -> op_tono_ruido
	defw 0c78ch	; cac2  -> op_bucle
	defw 0c70ch	; cac4  -> op_duracion
	defw 0c788h	; cac6  -> op_liga
	defw 0c75ah	; cac8  -> op_tempo
	defw 0c85bh	; caca  -> op_tempo1
	defw 0c7bbh	; cacc  -> op_instrumento
	defw 0c774h	; cace  -> op_ruido
	defw 0c804h	; cad0  -> op_efecto
	defw 0c7a7h	; cad2  -> op_banderas
	defw 0c72ch	; cad4  -> op_fin
	defw 0c864h	; cad6  -> op_llama_frase
	defw 0c880h	; cad8  -> op_vuelve
	defw 0c891h	; cada  -> op_transporte

; ----------------------------------------------------------------------
; DATOS punteros_de_frases: La tabla de las VEINTE frases de musica: 20
;   punteros de 2 B. Los veinte son EXACTAMENTE los del juego de naves
;   (0xE7C1) menos 0x1CE5, sin una sola excepcion
;   0xcadc..0xcb04  (40 bytes)
DATA_punteros_de_frases:
	defw 0cb61h,0cb04h,0cb11h,0cb2bh,0cb3ah,0cb47h,0cb54h,0cbaah,0cbbdh,0cbd0h	; cadc
	defw 0cbe3h,0cbf6h,0cc45h,0cc8ch,0cca2h,0ccb8h,0ccf7h,0cd15h,0cd2fh,0cd53h	; caf0

; ----------------------------------------------------------------------
; DATOS musica_de_la_fase: LA MUSICA DE LA FASE DE A PIE, 1380 B escritos en
;   el lenguaje del interprete de sonido. El trazador se los tragaba como
;   CODIGO -1318 de 1380, el 95,5 %- por una semilla mala en 0xCC3E, que cae
;   dentro de un guion. Es el mismo error que se corrigio en el juego de naves
;   y que aqui no se habia aplicado. PRUEBA de que es musica: recorriendo la
;   zona con el lector del lenguaje salen 38 bloques, CERO bytes fuera del
;   lenguaje, y el recorrido cierra clavado en 0xD068, que es donde empiezan
;   los estados de canal. Si el numero de argumentos de un solo comando
;   estuviera mal, no cerraria. Aqui habia cinco trozos declarados sueltos
;   como "tabla" y "relleno" (0xCB0F, 0xCB26, 0xCBDB, 0xCC99, 0xCDC0) que eran
;   cachos de esta misma musica
;   0xcb04..0xd068  (1380 bytes)
DATA_musica_de_la_fase:
	defb 087h,008h,080h,00fh,083h,010h,018h,080h,00ch,018h,018h,018h,08dh,081h,008h,087h	; cb04  ................
	defb 00ah,089h,000h,080h,008h,083h,020h,084h,088h,018h,083h,010h,084h,083h,008h,088h	; cb14  ...... .........
	defb 018h,084h,083h,020h,088h,018h,08dh,087h,009h,080h,007h,083h,008h,030h,03ch,048h	; cb24  ... .........0<H
	defb 054h,037h,043h,04ah,048h,08dh,087h,008h,080h,00fh,083h,010h,021h,080h,00ch,021h	; cb34  T7CJH.......!..!
	defb 021h,021h,08dh,087h,008h,080h,00fh,083h,010h,01dh,080h,00ch,01dh,01dh,01dh,08dh	; cb44  !!..............
	defb 087h,008h,080h,00fh,083h,010h,01fh,080h,00ch,01fh,01fh,01fh,08dh,087h,00bh,083h	; cb54  ................
	defb 010h,087h,00ah,030h,02bh,030h,083h,020h,032h,083h,010h,032h,034h,032h,030h,02dh	; cb64  ...0+0. 2..2420-
	defb 02bh,083h,050h,02dh,083h,010h,030h,02bh,030h,083h,020h,032h,083h,010h,032h,034h	; cb74  +.P-..0+0. 2..24
	defb 032h,030h,02dh,02bh,083h,050h,02dh,083h,010h,035h,034h,030h,083h,030h,029h,083h	; cb84  20-+.P-..540.0).
	defb 010h,035h,083h,020h,034h,030h,083h,040h,037h,083h,010h,037h,035h,034h,030h,02bh	; cb94  .5. 40.@7..7540+
	defb 029h,028h,083h,0a0h,024h,08dh,083h,008h,021h,021h,02dh,021h,02bh,02dh,084h,01fh	; cba4  )(..$...!!-!+-..
	defb 021h,021h,02dh,021h,02dh,02dh,026h,028h,08dh,083h,008h,01dh,01dh,029h,01dh,027h	; cbb4  !!-!--&(.....).'
	defb 029h,084h,01bh,01dh,01dh,029h,01dh,027h,018h,022h,024h,08dh,083h,008h,01ah,01ah	; cbc4  )....).'."$.....
	defb 026h,01ah,024h,026h,084h,018h,01ah,01ah,026h,01ah,024h,026h,01fh,021h,08dh,083h	; cbd4  &.$&....&.$&.!..
	defb 008h,01ch,01ch,028h,01ch,026h,028h,084h,01ah,01ch,01ch,028h,023h,026h,028h,01ch	; cbe4  ...(.&(....(#&(.
	defb 01fh,08dh,087h,00ah,083h,008h,039h,02dh,039h,02dh,037h,034h,037h,039h,084h,087h	; cbf4  ......9-9-7479..
	defb 00ch,021h,083h,010h,02bh,083h,020h,021h,087h,00ah,083h,008h,039h,032h,039h,032h	; cc04  .!..+. !....9292
	defb 037h,034h,037h,083h,028h,039h,083h,020h,087h,00ch,01fh,087h,00ah,083h,008h,03eh	; cc14  747.(9. .......>
	defb 032h,040h,032h,03eh,03ch,039h,03ch,03eh,032h,040h,032h,03eh,03ch,039h,03ch,040h	; cc24  2@2><9<>2@2><9<@
	defb 034h,040h,034h,03eh,03bh,03eh,083h,018h,083h,028h,040h,083h,020h,087h,00ch,030h	; cc34  4@4>;>...(@. ..0
	defb 08dh,087h,00bh,08ah,001h,083h,060h,039h,087h,008h,080h,00dh,083h,008h,03ch,03bh	; cc44  ......`9......<;
	defb 039h,037h,087h,00bh,080h,00ah,083h,060h,039h,087h,008h,080h,00dh,083h,008h,03ch	; cc54  97.....`9......<
	defb 03bh,039h,037h,080h,00ah,087h,00bh,083h,060h,035h,080h,00dh,087h,008h,083h,008h	; cc64  ;97.....`5......
	defb 035h,039h,03ch,039h,080h,00ah,087h,00bh,083h,060h,03bh,087h,008h,083h,008h,080h	; cc74  59<9.....`;.....
	defb 00dh,040h,034h,03eh,040h,080h,00ah,08dh,087h,008h,080h,00fh,083h,010h,018h,080h	; cc84  .@4>@...........
	defb 00ch,083h,008h,018h,018h,080h,00fh,083h,010h,018h,080h,00ch,013h,08dh,087h,008h	; cc94  ................
	defb 080h,00fh,083h,010h,01ah,080h,00ch,083h,008h,01ah,01ah,080h,00fh,083h,010h,01ah	; cca4  ................
	defb 080h,00ch,015h,08dh,081h,001h,087h,009h,083h,008h,080h,009h,030h,037h,03ch,037h	; ccb4  ............07<7
	defb 03eh,03ch,036h,03eh,030h,03ch,036h,037h,083h,020h,087h,00ah,081h,008h,088h,00ch	; ccc4  ><6>0<67. ......
	defb 081h,001h,087h,009h,087h,009h,083h,008h,080h,009h,030h,037h,03ch,037h,03eh,03ch	; ccd4  ..........07<7><
	defb 036h,03eh,030h,03ch,036h,037h,083h,020h,087h,00ah,081h,008h,088h,012h,081h,001h	; cce4  6>0<67. ........
	defb 087h,009h,08dh,087h,00ah,083h,030h,030h,083h,008h,02bh,030h,083h,030h,032h,083h	; ccf4  ......00..+0.02.
	defb 008h,030h,032h,083h,030h,037h,083h,008h,035h,034h,083h,010h,035h,034h,030h,02bh	; cd04  .02.07..54..540+
	defb 08dh,080h,00ch,087h,00ah,083h,030h,030h,083h,008h,087h,008h,037h,037h,080h,00fh	; cd14  ......00....77..
	defb 036h,083h,028h,084h,083h,008h,080h,00dh,02bh,02bh,08dh,087h,00fh,08ah,001h,083h	; cd24  6.(.....++......
	defb 020h,030h,037h,036h,032h,034h,030h,083h,010h,030h,03bh,03ah,039h,083h,020h,032h	; cd34   076240..0;:9. 2
	defb 037h,036h,039h,038h,083h,008h,032h,037h,036h,039h,083h,020h,038h,039h,08dh,085h	; cd44  7698..2769. 89..
	defb 0a0h,083h,00ch,081h,001h,080h,007h,087h,000h,050h,08bh,085h,0a0h,083h,019h,081h	; cd54  .........P......
	defb 001h,080h,007h,087h,001h,08ah,002h,046h,08bh,085h,0a0h,083h,001h,081h,008h,080h	; cd64  .......F........
	defb 00fh,088h,019h,083h,00ah,080h,00ah,087h,002h,088h,01fh,08bh,085h,032h,083h,0c8h	; cd74  .............2..
	defb 080h,000h,081h,008h,087h,005h,089h,003h,088h,01fh,08bh,08bh,08bh,085h,0ffh,083h	; cd84  ................
	defb 002h,081h,008h,080h,00fh,088h,00fh,08bh,086h,083h,002h,081h,001h,080h,00fh,05ah	; cd94  ...............Z
	defb 08bh,085h,0a0h,083h,01eh,081h,001h,080h,000h,087h,003h,046h,08bh,086h,080h,00ch	; cda4  ...........F....
	defb 087h,008h,08ah,000h,081h,001h,083h,004h,08eh,005h,018h,024h,018h,024h,018h,024h	; cdb4  ...........$.$.$
	defb 018h,024h,01dh,029h,01fh,02bh,018h,024h,018h,018h,018h,08bh,080h,00ch,087h,008h	; cdc4  .$.).+.$........
	defb 08ah,000h,081h,001h,083h,004h,08eh,005h,028h,02bh,030h,02bh,028h,02bh,030h,02bh	; cdd4  ........(+0+(+0+
	defb 02dh,030h,02fh,032h,02bh,02bh,02bh,08bh,080h,00fh,087h,00fh,08ah,001h,081h,001h	; cde4  -0/2+++.........
	defb 083h,004h,08eh,005h,043h,040h,043h,040h,083h,00ch,043h,083h,004h,040h,083h,010h	; cdf4  ....C@C@..C..@..
	defb 03eh,03ch,08bh,086h,083h,001h,081h,001h,080h,00fh,032h,046h,082h,085h,0a0h,083h	; ce04  ><........2F....
	defb 064h,081h,008h,080h,000h,087h,007h,088h,01fh,08bh,085h,0a0h,083h,01eh,081h,008h	; ce14  d...............
	defb 080h,000h,087h,004h,088h,014h,08bh,086h,083h,001h,081h,001h,080h,00ah,04ch,084h	; ce24  ..............L.
	defb 082h,085h,0a0h,08bh,014h,081h,009h,080h,000h,087h,006h,089h,000h,088h,080h,028h	; ce34  ...............(
	defb 08bh,08eh,002h,086h,081h,001h,08ch,001h,08ch,001h,08ch,004h,08ch,004h,08ch,001h	; ce44  ................
	defb 08ch,001h,08ch,004h,08ch,004h,08ch,005h,08ch,005h,08ch,006h,08ch,006h,08ch,001h	; ce54  ................
	defb 08ch,001h,08ch,001h,08ch,001h,086h,081h,001h,08ch,001h,08ch,001h,08ch,004h,08ch	; ce64  ................
	defb 004h,08ch,001h,08ch,001h,08ch,004h,08ch,004h,08ch,005h,08ch,005h,08ch,006h,08ch	; ce74  ................
	defb 006h,08ch,001h,08ch,001h,08ch,001h,08ch,001h,086h,081h,001h,08ch,001h,08ch,001h	; ce84  ................
	defb 08ch,004h,08ch,004h,08ch,001h,08ch,001h,08ch,004h,08ch,004h,08ch,005h,08ch,005h	; ce94  ................
	defb 08ch,006h,08ch,006h,08ch,001h,08ch,001h,08ch,001h,08ch,001h,080h,00dh,08ch,007h	; cea4  ................
	defb 08ch,008h,08ch,009h,08ch,00ah,08ch,007h,08ch,008h,08ch,009h,08ch,00ah,08ch,007h	; ceb4  ................
	defb 08ch,008h,08ch,009h,08ch,00ah,08ch,007h,08ch,008h,08ch,009h,08ch,00ah,08ch,007h	; cec4  ................
	defb 08ch,008h,08ch,009h,08ch,00ah,08eh,009h,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00dh	; ced4  ................
	defb 08ch,00eh,08ch,00eh,08ch,00eh,08ch,00eh,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00dh	; cee4  ................
	defb 08ch,00eh,08ch,00eh,08ch,00eh,08ch,00eh,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00dh	; cef4  ................
	defb 08ch,00eh,08ch,00eh,08ch,00eh,08ch,00eh,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00dh	; cf04  ................
	defb 08ch,00eh,08ch,00eh,08ch,00eh,08ch,00eh,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00dh	; cf14  ................
	defb 08ch,00eh,08ch,00eh,08ch,00eh,08ch,00eh,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00dh	; cf24  ................
	defb 08ch,00eh,08ch,00eh,08ch,00eh,08ch,00eh,082h,08eh,002h,081h,001h,08ch,003h,08ch	; cf34  ................
	defb 003h,08ch,003h,08ch,003h,08ch,003h,08ch,003h,08ch,003h,08ch,003h,08ch,003h,08ch	; cf44  ................
	defb 003h,08ch,003h,08ch,003h,08ch,003h,08ch,003h,08ch,003h,08ch,003h,080h,00bh,08ch	; cf54  ................
	defb 000h,080h,00ah,08eh,00eh,08ch,000h,08eh,002h,080h,00ah,083h,080h,084h,084h,084h	; cf64  ................
	defb 084h,08ch,00bh,08eh,00eh,08ch,00bh,08eh,002h,08ch,00ch,08eh,0f6h,08ch,00ch,08eh	; cf74  ................
	defb 002h,08eh,009h,080h,00ch,087h,00ah,08ch,010h,08eh,00bh,08ch,010h,08eh,0fdh,080h	; cf84  ................
	defb 00dh,08ch,010h,08eh,0ffh,08ch,010h,08eh,009h,08ch,011h,08ch,011h,08eh,00bh,08ch	; cf94  ................
	defb 011h,08ch,011h,08eh,0fdh,08ch,011h,08ch,011h,08eh,0ffh,08ch,011h,08ch,011h,080h	; cfa4  ................
	defb 00fh,08eh,009h,08ch,012h,08eh,0fdh,08ch,012h,082h,08bh,08ch,002h,08ch,002h,08ch	; cfb4  ................
	defb 002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch	; cfc4  ................
	defb 002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch	; cfd4  ................
	defb 002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch	; cfe4  ................
	defb 002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch	; cff4  ................
	defb 002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch	; d004  ................
	defb 002h,08ch,002h,08eh,009h,08ch,00fh,08eh,00bh,08ch,00fh,08eh,009h,08ch,00fh,08eh	; d014  ................
	defb 00bh,08ch,00fh,08eh,009h,08ch,00fh,08eh,00bh,08ch,00fh,08eh,009h,08ch,00fh,08eh	; d024  ................
	defb 00bh,08ch,00fh,08eh,009h,08ch,00fh,08eh,00bh,08ch,00fh,08eh,009h,08ch,00fh,08eh	; d034  ................
	defb 00bh,08ch,00fh,082h,085h,0a0h,083h,01eh,081h,001h,080h,003h,087h,007h,014h,08bh	; d044  ................
	defb 086h,083h,001h,081h,001h,080h,00ah,040h,084h,082h,086h,083h,001h,081h,001h,080h	; d054  .......@........
	defb 00ah,034h,084h,082h	; d064

; ----------------------------------------------------------------------
; DATOS variables_del_interprete: Variables a cero (175 B), y los primeros 138
;   tienen nombre: son los TRES ESTADOS DE CANAL del interprete de sonido, de
;   46 B cada uno (0xD068, 0xD096, 0xD0C4), que es lo que resolvio el enigma
;   de los "objetos de 46 bytes". Los 37 restantes (0xD0F2-0xD117) son las
;   variables globales del interprete y las que el listado lee con ld a,(nn).
;   Confirmado ademas desde fuera: al volcar la memoria justo tras la
;   multicarga, los bytes que ya no coinciden con la cinta se agolpan aqui. El
;   trazador contaba todo esto como codigo
;   0xd068..0xd117  (175 bytes)
DATA_variables_del_interprete:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; d068  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; d078  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; d088  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; d098  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; d0a8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; d0b8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; d0c8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; d0d8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; d0e8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; d0f8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; d108  ...............

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
	or 040h		;d121
	out (099h),a		;d123
	pop af			;d125
	ret			;d126
premia:		; Suma B al marcador por el digito que apunta HL (dentro de 0xB87F) y lo repinta en 0x12B0, que es la misma posicion de pantalla que usa el marcador de la fase de naves
	push ix		;d127
	ld ix,0b87fh		;d129
	ld de,012b0h		;d12d
	call suma_puntos		;d130
	pop ix		;d133
	ret			;d135
pinta_marca_hud:		; Pinta la marca del HUD con el color 0x11
	ld a,011h		;d136
	jr $+4		;d138

; ----------------------------------------------------------------------
; DATOS relleno_D13A: Relleno o resto (2 B; 2 bytes)
;   0xd13a..0xd13c  (2 bytes)
DATA_relleno_D13A:
	defb 03eh,071h	; d13a

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
	cp 038h		;d152
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
	add hl,bc			;d169
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
	inc iy		;d1c1
	ld (iy+000h),d		;d1c3
	inc iy		;d1c6
	ld d,b			;d1c8
	push hl			;d1c9
	ld hl,0b7c2h		;d1ca
	add hl,de			;d1cd
	ld a,(hl)			;d1ce
	bit 7,a		;d1cf
	jr z,L_D1DA		;d1d1
	dec iy		;d1d3
	dec iy		;d1d5
	pop hl			;d1d7
	jr redefine_tecla		;d1d8
L_D1DA:
	set 7,(hl)		;d1da
	push ix		;d1dc
	pop hl			;d1de
	ld b,006h		;d1df
L_D1E1:
	ld (hl),020h		;d1e1
	inc hl			;d1e3
	djnz L_D1E1		;d1e4
	cp 015h		;d1e6
	jr c,L_D1F0		;d1e8
	ld (ix+000h),a		;d1ea
	pop hl			;d1ed
	jr L_D190		;d1ee
L_D1F0:
	ld b,a			;d1f0
	ld hl,0b80bh		;d1f1
	jr L_D1FC		;d1f4
L_D1F6:
	ld a,(hl)			;d1f6
	cp 000h		;d1f7
	inc hl			;d1f9
	jr nz,L_D1F6		;d1fa
L_D1FC:
	djnz L_D1F6		;d1fc
	push ix		;d1fe
	pop de			;d200
L_D201:
	ld a,(hl)			;d201
	cp 000h		;d202
	jr z,L_D20B		;d204
	ld (de),a			;d206
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
	inc ix		;d214
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
	cp 020h		;d25a
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
	cp 001h		;d26d
	jr nz,L_D28B		;d26f
	ld a,h			;d271
	and 018h		;d272
	ld h,a			;d274
	ld a,l			;d275
	and 038h		;d276
	ld l,a			;d278
	ld a,(ix+000h)		;d279
	inc ix		;d27c
	push hl			;d27e
	ld l,a			;d27f
	ld h,000h		;d280
	ld b,006h		;d282
L_D284:
	add hl,hl			;d284
	djnz L_D284		;d285
	pop bc			;d287
	add hl,bc			;d288
	jr L_D2F2		;d289
L_D28B:
	cp 014h		;d28b
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
	cp 038h		;d2a6
	jr nz,L_D2B2		;d2a8
	ld a,h			;d2aa
	add a,009h		;d2ab
	ld h,a			;d2ad
	ld l,000h		;d2ae
	jr L_D2B6		;d2b0
L_D2B2:
	ld bc,00108h		;d2b2
	add hl,bc			;d2b5
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
	add hl,hl			;d2d7
	add hl,hl			;d2d8
	add hl,hl			;d2d9
	ld de,05f00h		;d2da
	add hl,de			;d2dd
	ex de,hl			;d2de
	pop hl			;d2df
	call vram_pon_dir		;d2e0
	ld b,008h		;d2e3
L_D2E5:
	ld a,(de)			;d2e5
	out (098h),a		;d2e6
	inc de			;d2e8
	and a			;d2e9
	and a			;d2ea
	djnz L_D2E5		;d2eb
	ei			;d2ed
	ld bc,00040h		;d2ee
	add hl,bc			;d2f1
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
	cp 0ffh		;d312
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
	add hl,bc			;d342
	pop bc			;d343
	djnz L_D333		;d344
	ei			;d346
	ret			;d347

; ----------------------------------------------------------------------
; DATOS tabla_D348: Tabla (19 B; racha 2.45, entropia 3.72, 14 valores: pocos
;   valores para ser un dibujo)
;   0xd348..0xd35b  (19 bytes)
DATA_tabla_D348:
	defb 023h,07dh,0e6h,03fh,0c0h,02bh,07dh,0e6h,0c0h,06fh,0d3h,099h,07ch,0c6h,008h,067h	; d348  #}.?.+}..o..|..g
	defb 0d3h,099h,0c9h	; d358

; ======================================================================
; CODIGO 0xd35b..0xd48c  (305 bytes)
; ======================================================================


hud_imprime:		; Recorre la cadena de indices de glifo de (IX) hasta el 0 estampando cada uno en la VRAM: 8 bytes desde la fuente de 0x5F00 y 0x40 de avance por caracter
	ld a,(ix+000h)		;d35b
	and a			;d35e
	ret z			;d35f
	ld l,a			;d360
	ld h,000h		;d361
	add hl,hl			;d363
	add hl,hl			;d364
	add hl,hl			;d365
	ld bc,05f00h		;d366
	add hl,bc			;d369
	ex de,hl			;d36a
	call vram_pon_dir		;d36b
	ld b,008h		;d36e
L_D370:
	ld a,(de)			;d370
	out (098h),a		;d371
	inc de			;d373
	and a			;d374
	and a			;d375
	djnz L_D370		;d376
	ei			;d378
	ld de,00040h		;d379
	add hl,de			;d37c
	ex de,hl			;d37d
	inc ix		;d37e
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
	ex de,hl			;d3ae
	ld de,00018h		;d3af
L_D3B2:
	ld a,(hl)			;d3b2
	out (098h),a		;d3b3
	add hl,de			;d3b5
	djnz L_D3B2		;d3b6
	pop hl			;d3b8
	ld de,00040h		;d3b9
	add hl,de			;d3bc
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
	ldir		;d3de
	ld bc,00005h		;d3e0
	and a			;d3e3
	sbc hl,bc		;d3e4
	ex de,hl			;d3e6
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
	add hl,de			;d400
	ld a,(hl)			;d401
	pop hl			;d402
	and 07fh		;d403
	cp 030h		;d405
	jr nc,L_D41B		;d407
	cp 014h		;d409
	jr z,L_D43C		;d40b
	cp 011h		;d40d
	jr z,L_D419		;d40f
	cp 010h		;d411
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
	ld (de),a			;d41e
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
	cp 006h		;d441
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
	ld (de),a			;d46c
	pop bc			;d46d
	inc b			;d46e
	jp L_D3EA		;d46f
dir_vram_de_fila_columna:		; De la fila de pixel D y la columna E a la direccion de VRAM: (D>>6)*0x800 + E*0x40 + (D and 0x3F). Identica byte a byte a la de la fase de naves, las 26. Y explica el reparto 56/64/40 de las tres bandas: el buffer empieza en la fila 8, y 8+56=64 y 64+64=128 son las dos fronteras de tercio del SCREEN 2. Las bandas son los tercios de la pantalla, cortados donde manda el hardware
	ld l,000h		;d472
	ld a,e			;d474
	rra			;d475
	rr l		;d476
	rra			;d478
	rr l		;d479
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
; DATOS datos_finales_del_bloque: 489 bytes al final del bloque que NO son
;   codigo, y estuvieron publicados como "la rutina mas caliente de la segunda
;   parte, 139.323 muestras". Se desensambla a `nop / rst 38h / nop / rst
;   38h...`, no lo llama nadie, y muestreando el PC en 130 s de partida limpia
;   -259.149 muestras en dos ventanas- NO CAE NI UNA AQUI. La medida vieja se
;   hizo abriendo la ventana en t=1775 "cuando la carga termina", y la carga
;   no habia terminado: a t=1775 el PC esta en 0xF87E/0xF88D/0xF887, dentro
;   del cargador de cinta, con solo 45 direcciones distintas. QUE SON, dicho
;   sin pasarse: datos de poca variedad -21 valores distintos, 199 de los 489
;   bytes son 0xFF, y el resto tienen pocos bits puestos-, que es la pinta de
;   un dibujo con mascara, el idioma de esta conversion. No se afirma mas
;   porque no se ha medido mas
;   0xd48c..0xd675  (489 bytes)
DATA_datos_finales_del_bloque:
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
