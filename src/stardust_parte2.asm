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
L_66A2:	equ 0x066a2
L_90CE:	equ 0x090ce
L_90FE:	equ 0x090fe
L_911A:	equ 0x0911a
L_9434:	equ 0x09434
L_A3AA:	equ 0x0a3aa
L_AA2A:	equ 0x0aa2a
L_AA57:	equ 0x0aa57
L_AAA2:	equ 0x0aaa2
L_AFA8:	equ 0x0afa8
L_C36D:	equ 0x0c36d
L_C3A4:	equ 0x0c3a4
L_C3C6:	equ 0x0c3c6
L_C3F5:	equ 0x0c3f5
L_C425:	equ 0x0c425
L_CAB8:	equ 0x0cab8
L_CAEE:	equ 0x0caee
L_CB1E:	equ 0x0cb1e
L_CB2A:	equ 0x0cb2a
L_CB6F:	equ 0x0cb6f
L_CB7A:	equ 0x0cb7a
L_CB9F:	equ 0x0cb9f
L_CBB5:	equ 0x0cbb5
L_CBCD:	equ 0x0cbcd
L_CC19:	equ 0x0cc19
L_CCCE:	equ 0x0ccce
L_CD06:	equ 0x0cd06
L_CD41:	equ 0x0cd41
L_CD46:	equ 0x0cd46
L_CD4C:	equ 0x0cd4c
L_CE0B:	equ 0x0ce0b
L_CE0F:	equ 0x0ce0f
L_CF1C:	equ 0x0cf1c
L_CF26:	equ 0x0cf26
L_CF2A:	equ 0x0cf2a
L_D491:	equ 0x0d491
L_D4A1:	equ 0x0d4a1
L_D525:	equ 0x0d525
L_D591:	equ 0x0d591
L_D5A1:	equ 0x0d5a1
L_D5E3:	equ 0x0d5e3

; ----------------------------------------------------------------------
; Destinos de salto que z80dasm referencia pero que el trazador no
; marco como codigo. Cada uno es un sitio a revisar: probablemente
; hay codigo ahi que falta por trazar.
; ----------------------------------------------------------------------
ladc4h:	equ 0x0adc4
lafa1h:	equ 0x0afa1
lb262h:	equ 0x0b262

; ======================================================================
; CODIGO 0x61d0..0x621c  (76 bytes)
; ======================================================================


L_61D0:
	ld a,a			;61d0
	ld b,d			;61d1
	inc c			;61d2
	inc e			;61d3
	jr c,$+115		;61d4
	ld a,a			;61d6
	nop			;61d7
	pop bc			;61d8
	ld a,b			;61d9
	cp d			;61da
	ld a,b			;61db
	cp b			;61dc
	ld a,b			;61dd
	or (hl)			;61de
	ld a,b			;61df
	or h			;61e0
	ld a,b			;61e1
	or d			;61e2
	ld a,b			;61e3
	or b			;61e4
	ld a,b			;61e5
	xor (hl)		;61e6
	ld a,b			;61e7
	xor h			;61e8
	ld a,b			;61e9
	xor d			;61ea
	ld a,b			;61eb
	xor b			;61ec
	ld a,b			;61ed
	and (hl)		;61ee
	ld a,b			;61ef
	and h			;61f0
	ld a,b			;61f1
	and d			;61f2
	ld a,b			;61f3
	and b			;61f4
	ld a,b			;61f5
	sbc a,(hl)		;61f6
	ld a,b			;61f7
	sbc a,h			;61f8
	ld a,b			;61f9
	sbc a,d			;61fa
	ld a,b			;61fb
	sbc a,b			;61fc
	ld a,b			;61fd
	sub (hl)		;61fe
	ld a,b			;61ff
	sub h			;6200
	ld a,b			;6201
	sub d			;6202
	ld a,b			;6203
	sub b			;6204
	ld a,b			;6205
	adc a,(hl)		;6206
	ld a,b			;6207
	adc a,h			;6208
	jp nz,L_8A78		;6209
	ld a,b			;620c
	adc a,b			;620d
	ld (hl),a		;620e
	add a,(hl)		;620f
	pop bc			;6210
	ld (hl),a		;6211
	add a,h			;6212
	ld a,b			;6213
	add a,d			;6214
	ld a,b			;6215
	add a,b			;6216
	ld a,b			;6217
	ld a,(hl)		;6218
	jp L_7C78		;6219

; ----------------------------------------------------------------------
; DATOS tabla: (43 B; racha 2.21, entropia 4.27, 23 valores: pocos valores para ser un dibujo)
;   0x621c..0x6247  (43 bytes)
; ----------------------------------------------------------------------
	defb 078h,07ah,079h,078h,0c1h,079h,076h,078h,074h,078h,072h,078h,070h,0c2h,078h,06eh	; 621c  xzyx.yvxtxrxp.xn
	defb 078h,06ch,077h,06ah,0c4h,076h,068h,074h,066h,072h,064h,070h,062h,0c5h,06eh,061h	; 622c  xlwj.vhtfrdpb.na
	defb 06ch,060h,06ah,05fh,0c6h,068h,05fh,066h,05fh,064h,05fh	; 623c  l`j_.h_f_d_

; ======================================================================
; CODIGO 0x6247..0x625e  (23 bytes)
; ======================================================================


L_6247:
	ld h,d			;6247
	ld e,a			;6248
	ld h,b			;6249
	ld e,a			;624a
	ld e,(hl)		;624b
	ld e,a			;624c
	ld e,h			;624d
	ld e,a			;624e
	rst 0			;624f
	ld e,d			;6250
	ld e,a			;6251
	ld d,a			;6252
	ld e,a			;6253
	ld d,h			;6254
	ld e,a			;6255
	ret z			;6256
	ld d,c			;6257
	ld e,a			;6258
	ld c,(hl)		;6259
	ld e,a			;625a
	ld c,e			;625b
	ld e,a			;625c
	ret			;625d

; ----------------------------------------------------------------------
; DATOS graficos: (998 B; racha 3.85, entropia 5.55, 199 valores: rachas mas largas que el azar)
;   0x625e..0x6644  (998 bytes)
; ----------------------------------------------------------------------
	defb 047h,05fh,043h,05fh,03fh,05fh,0cah,03bh,05fh,037h,05fh,033h,05fh,0cbh,02eh,05eh	; 625e  G_C_?_.;_7_3_..^
	defb 02ah,05dh,026h,05ch,022h,05bh,0cch,01eh,05ah,01ah,059h,015h,058h,010h,057h,0cdh	; 626e  *]&\"[..Z.Y.X.W.
	defb 00ah,055h,003h,053h,000h,000h,0c0h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 627e  .U.S............
	defb 000h,000h,000h,000h,000h,002h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 628e  ................
	defb 000h,000h,000h,000h,000h,000h,000h,01dh,000h,000h,000h,000h,000h,000h,000h,000h	; 629e  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,00bh,000h,000h,000h,000h,000h,000h	; 62ae  ................
	defb 000h,000h,000h,000h,000h,000h,000h,018h,000h,000h,000h,030h,000h,000h,000h,000h	; 62be  ...........0....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,0cdh,000h,000h	; 62ce  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,01eh,034h	; 62de  ...............4
	defb 000h,000h,000h,000h,000h,018h,000h,000h,000h,000h,000h,000h,000h,000h,000h,001h	; 62ee  ................
	defb 0c3h,0eeh,0e0h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 62fe  ................
	defb 000h,00fh,02bh,0b9h,070h,000h,018h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 630e  ..+.p...........
	defb 000h,000h,000h,075h,056h,0f5h,070h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 631e  ...uV.p.........
	defb 000h,000h,000h,000h,003h,0fah,0f9h,04eh,0e0h,000h,000h,000h,000h,000h,000h,000h	; 632e  .......N........
	defb 000h,000h,000h,000h,001h,000h,000h,005h,0e6h,0d0h,0d0h,000h,000h,000h,000h,000h	; 633e  ................
	defb 000h,000h,000h,000h,000h,000h,001h,000h,001h,0f8h,019h,01bh,031h,000h,000h,000h	; 634e  ............1...
	defb 000h,000h,000h,000h,000h,018h,000h,000h,001h,000h,01ch,005h,0e6h,06dh,0afh,080h	; 635e  .............m..
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,003h,007h,0efh,0feh,0dch,0b5h	; 636e  ................
	defb 051h,000h,000h,000h,000h,000h,000h,000h,080h,000h,000h,000h,003h,078h,0d9h,07bh	; 637e  Q............x.{
	defb 000h,000h,008h,000h,000h,000h,000h,000h,000h,000h,080h,000h,000h,000h,005h,067h	; 638e  ...............g
	defb 037h,0f7h,05bh,05bh,0deh,000h,000h,000h,000h,000h,000h,001h,080h,000h,000h,000h	; 639e  7.[[............
	defb 03ch,0d8h,0dch,000h,0b5h,0f5h,0a6h,000h,000h,000h,000h,000h,000h,001h,040h,000h	; 63ae  <.............@.
	defb 000h,001h,0c0h,0e7h,032h,0abh,000h,000h,065h,006h,000h,000h,000h,000h,000h,000h	; 63be  ....2...e.......
	defb 080h,000h,000h,003h,0aah,0f0h,07ch,000h,0ebh,0ffh,082h,00fh,000h,000h,000h,000h	; 63ce  ......|.........
	defb 000h,000h,080h,000h,000h,003h,055h,0fdh,077h,0bfh,094h,001h,0c0h,00eh,000h,000h	; 63de  ......U.w.......
	defb 000h,000h,000h,000h,0c0h,000h,030h,00bh,003h,09ah,0abh,0d2h,067h,055h,0c0h,005h	; 63ee  ......0.....gU..
	defb 040h,000h,000h,000h,000h,001h,080h,000h,078h,012h,07bh,06dh,07fh,0a9h,0fbh,0bfh	; 63fe  @.......x.{m....
	defb 0c0h,002h,060h,000h,000h,000h,000h,001h,080h,000h,067h,08dh,087h,09fh,000h,0dch	; 640e  ..`.......g.....
	defb 078h,000h,000h,002h,080h,000h,018h,000h,000h,001h,040h,070h,01ch,07eh,074h,000h	; 641e  x.........@p.~t.
	defb 0feh,0b3h,09ah,0abh,080h,001h,070h,000h,000h,000h,000h,001h,043h,0cch,003h,0f3h	; 642e  ......p.....C...
	defb 0cdh,0ffh,054h,0aah,0e5h,056h,000h,002h,088h,000h,000h,000h,000h,001h,0e0h,067h	; 643e  ..T..V.........g
	defb 0fdh,06dh,0b2h,0aah,0a9h,070h,014h,008h,002h,002h,088h,000h,000h,000h,000h,000h	; 644e  .m...p..........
	defb 0f7h,0bfh,01ah,0ech,034h,000h,015h,0bfh,0fbh,060h,00dh,081h,070h,000h,000h,000h	; 645e  ....4....`..p...
	defb 000h,006h,0cfh,078h,0cfh,0d3h,0cbh,0fdh,0cah,0c4h,000h,0a1h,0dah,0ddh,000h,000h	; 646e  ...x............
	defb 000h,000h,000h,039h,038h,0c7h,03eh,03ch,07ah,0adh,0b2h,0b8h,079h,062h,0e7h,039h	; 647e  ...98.><z...yb.9
	defb 000h,000h,000h,000h,001h,0e7h,0c7h,080h,0f9h,0c0h,000h,003h,0afh,0bbh,087h,083h	; 648e  ................
	defb 078h,0e5h,040h,000h,040h,000h,00fh,0deh,03fh,0ffh,0e7h,09bh,030h,0dbh,0ffh,0fch	; 649e  x.@.@...?...0...
	defb 078h,063h,07fh,0edh,060h,000h,040h,000h,071h,0e1h,0ffh,00fh,09eh,026h,0cfh,030h	; 64ae  xc..`.@.q....&.0
	defb 000h,003h,09fh,033h,0bch,076h,0b0h,000h,040h,003h,08eh,0ffh,0e0h,0c7h,079h,06eh	; 64be  ...3.v..@.....yn
	defb 035h,057h,0cfh,0ffh,0e3h,0d1h,0dbh,0bbh,0d0h,000h,050h,01ch,076h,0fch,017h,0d3h	; 64ce  5W........P.v...
	defb 080h,015h,060h,00fh,033h,0ffh,0fch,061h,0dah,03bh,0d8h,000h,060h,0e3h,0b1h,0e2h	; 64de  ..`.3..a.;..`...
	defb 0bch,02bh,0ffh,0abh,00fh,0feh,075h,0ffh,0ffh,080h,02dh,01ch,03ch,000h,047h,01dh	; 64ee  .+....u...-.<.G.
	defb 08fh,015h,043h,05bh,0f8h,057h,030h,07dh,00dh,0f0h,007h,0dfh,0d6h,0efh,0fch,000h	; 64fe  ..C[.W0}........
	defb 03eh,0ech,078h,0abh,09dh,0b5h,0e7h,006h,07fh,0b8h,0f1h,0eah,0a7h,0e0h,016h,08fh	; 650e  >.x.............
	defb 00eh,001h,0feh,003h,0c5h,05eh,076h,01dh,09ah,0ech,083h,0bbh,06dh,0d4h,033h,0f8h	; 651e  .....^v.....m.3.
	defb 07bh,046h,0f7h,00fh,0e3h,0feh,02ah,0f1h,0c2h,000h,07dh,0d9h,0d7h,0d8h,001h,0a5h	; 652e  {F....*...}.....
	defb 0dbh,0f8h,03dh,0bah,0f7h,0ffh,01dh,0f1h,057h,083h,0bbh,001h,0fdh,0d3h,0ffh,0dfh	; 653e  ..=.....W.......
	defb 0ffh,053h,0e3h,0fch,03dh,0abh,003h,0ffh,0e3h,000h,000h,0ffh,0ebh,000h,008h,0f0h	; 654e  .S..=...........
	defb 0e9h,000h,008h,0f6h,00dh,006h,00ch,0f6h,069h,006h,068h,0f4h,00dh,004h,00ch,0f3h	; 655e  ........i.h.....
	defb 0e5h,003h,0e4h,086h,021h,006h,020h,0b5h,0dch,035h,0dch,0a2h,02eh,022h,02eh,09bh	; 656e  ....!. ..5..."..
	defb 0ech,01bh,0ech,0bbh,0e1h,03bh,0e0h,09bh,0efh,01bh,0e0h,0c1h,0cfh,001h,0c0h,0fch	; 657e  .....;..........
	defb 01fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,087h,000h,000h,0e3h,037h,000h,030h,0cah	; 658e  ............7.0.
	defb 077h,008h,070h,0d0h,0c7h,010h,0c0h,017h,01fh,017h,000h,069h,087h,069h,080h,076h	; 659e  w.p........i.i.v
	defb 0d4h,076h,0d0h,029h,071h,029h,071h,09ch,0a2h,01ch,0a2h,0deh,0a4h,01eh,0a4h,0dfh	; 65ae  .v.)q)q.........
	defb 04ah,01fh,04ah,0ceh,0e8h,00eh,0e8h,0e0h,073h,000h,070h,0ffh,007h,000h,000h,0ffh	; 65be  J.J.....s.p.....
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0e0h,07fh,000h,000h,0cbh	; 65ce  ................
	defb 07fh,00bh,000h,0ddh,07fh,01dh,000h,0dch,003h,01ch,000h,0c1h,0bbh,001h,0b8h,09eh	; 65de  ................
	defb 0dbh,01eh,0d8h,0bdh,043h,03dh,040h,0bdh,047h,03dh,040h,0bdh,057h,03dh,050h,09eh	; 65ee  ....C=@.G=@.W=P.
	defb 0d7h,01eh,0d0h,0c1h,000h,001h,000h,0f7h,03eh,007h,03eh,0f7h,068h,007h,068h,0f2h	; 65fe  ........>.>.h.h.
	defb 003h,002h,000h,0f8h,0ffh,000h,000h,0ffh,00fh,000h,000h,0feh,06fh,000h,060h,0f0h	; 660e  ............o.`.
	defb 0e3h,000h,0e0h,0e7h,059h,007h,058h,0efh,0a5h,00fh,0a4h,0efh,051h,00fh,050h,0eeh	; 661e  ....Y.X.....Q.P.
	defb 057h,00eh,050h,0e4h,0b3h,004h,0b0h,0cbh,069h,00bh,068h,0dch,0cch,01ch,0cch,0dbh	; 662e  W.P.....i.h.....
	defb 086h,01bh,086h,0d0h,0d6h,010h	; 663e  ......

; ======================================================================
; CODIGO 0x6644..0x6788  (324 bytes)
; ======================================================================


L_6644:
	add a,0cch		;6644
	djnz L_6654		;6646
	nop			;6648
	jp po,0027fh		;6649
	nop			;664c
	push af			;664d
	ccf			;664e
	dec b			;664f
	nop			;6650
	ret p			;6651
	cp a			;6652
	nop			;6653
L_6654:
	add a,b			;6654
	rst 38h			;6655
	rst 38h			;6656
	nop			;6657
	nop			;6658
	ret m			;6659
	ccf			;665a
	nop			;665b
	nop			;665c
	di			;665d
	add a,e			;665e
	inc bc			;665f
	add a,b			;6660
	rst 30h			;6661
	exx			;6662
	rlca			;6663
	ret c			;6664
	add a,a			;6665
	defb 0ddh,007h,0dch ;illegal sequence	;6666
	scf			;6669
	exx			;666a
	scf			;666b
	ret c			;666c
	ld (hl),h		;666d
	ld b,l			;666e
	ld (hl),h		;666f
	ld b,h			;6670
	dec sp			;6671
	xor l			;6672
	dec sp			;6673
	xor h			;6674
	add a,h			;6675
	ld h,c			;6676
	inc b			;6677
	ld h,b			;6678
	and a			;6679
	rst 8			;667a
	daa			;667b
	ret nz			;667c
	or b			;667d
	cpl			;667e
	jr nc,L_66A1		;667f
	sub (hl)		;6681
	ld l,a			;6682
	ld d,060h		;6683
	or b			;6685
	ld l,a			;6686
	jr nc,L_66E9		;6687
	sub a			;6689
	rrca			;668a
	djnz L_668D		;668b
L_668D:
	rst 10h			;668d
	rst 38h			;668e
	djnz L_6691		;668f
L_6691:
	rst 0			;6691
	rst 38h			;6692
	nop			;6693
	nop			;6694
	rst 38h			;6695
	rst 38h			;6696
	nop			;6697
	nop			;6698
	rst 38h			;6699
	rst 38h			;669a
	nop			;669b
	nop			;669c
	ret po			;669d
	rst 38h			;669e
	nop			;669f
	nop			;66a0
L_66A1:
	adc a,007h		;66a1
	ld c,000h		;66a3
	rla			;66a5
	ld (hl),e		;66a6
	rla			;66a7
	ld (hl),b		;66a8
	ld d,d			;66a9
	ei			;66aa
	ld d,d			;66ab
	ret m			;66ac
	dec h			;66ad
	ld a,e			;66ae
	dec h			;66af
	ld a,b			;66b0
	ld b,l			;66b1
	add hl,sp		;66b2
	ld b,l			;66b3
	jr c,L_6644		;66b4
	sub h			;66b6
	adc a,(hl)		;66b7
	sub h			;66b8
	dec hl			;66b9
	ld l,(hl)		;66ba
	dec bc			;66bb
	ld l,(hl)		;66bc
	pop hl			;66bd
	sub (hl)		;66be
	ld bc,0f896h		;66bf
	ret pe			;66c2
	nop			;66c3
	ret pe			;66c4
	ex (sp),hl		;66c5
	dec bc			;66c6
	inc bc			;66c7
L_66C8:
	ex af,af'		;66c8
	xor 053h		;66c9
	ld c,010h		;66cb
	call pe,00cc7h		;66cd
	nop			;66d0
	pop hl			;66d1
	rst 38h			;66d2
	nop			;66d3
	nop			;66d4
	rst 38h			;66d5
	rra			;66d6
	nop			;66d7
	nop			;66d8
	ret nz			;66d9
	ld c,a			;66da
	nop			;66db
	ld b,b			;66dc
	ld d,0efh		;66dd
	ld d,0e0h		;66df
	ld a,h			;66e1
	rst 28h			;66e2
	ld a,h			;66e3
	ret po			;66e4
	nop			;66e5
	add a,e			;66e6
	nop			;66e7
	add a,b			;66e8
L_66E9:
	ex de,hl		;66e9
	ld a,c			;66ea
	dec bc			;66eb
	ld a,b			;66ec
	jp pe,00abdh		;66ed
	cp h			;66f0
	jp po,002bdh		;66f1
	cp h			;66f4
	jp nz,002bdh		;66f5
	cp h			;66f8
	in a,(079h)		;66f9
	dec de			;66fb
	ld a,b			;66fc
	defb 0ddh,083h,01dh ;illegal sequence	;66fd
	add a,b			;6700
	ret nz			;6701
	dec sp			;6702
	nop			;6703
L_6704:
	jr c,L_6704		;6704
	cp e			;6706
	nop			;6707
	cp b			;6708
	cp 0d3h			;6709
	nop			;670b
	ret nc			;670c
	cp 007h			;670d
	nop			;670f
	nop			;6710
	rst 38h			;6711
	rst 38h			;6712
	nop			;6713
	nop			;6714
	defb 0fdh,00fh,001h ;illegal sequence	;6715
	nop			;6718
	call m,000afh		;6719
	and b			;671c
	cp 047h			;671d
	nop			;671f
	ld b,b			;6720
	ex af,af'		;6721
	inc sp			;6722
	nop			;6723
L_6724:
	jr nc,$+109		;6724
	dec bc			;6726
	ld h,e			;6727
	ex af,af'		;6728
	ld h,c			;6729
	in a,(061h)		;672a
	ret c			;672c
	inc sp			;672d
	dec sp			;672e
	inc sp			;672f
	jr c,L_66C8		;6730
	out (016h),a		;6732
	ret nc			;6734
	call 00d27h		;6735
	jr nz,L_6724		;6738
	ld (hl),a		;673a
	ld a,(bc)		;673b
	ld (hl),b		;673c
	adc a,d			;673d
	rst 30h			;673e
	ld a,(bc)		;673f
	ret p			;6740
	and l			;6741
	rst 30h			;6742
	dec h			;6743
	ret p			;6744
	sbc a,d			;6745
	rst 20h			;6746
	ld a,(de)		;6747
	ret po			;6748
	rst 0			;6749
	rrca			;674a
	rlca			;674b
	nop			;674c
	or 07fh			;674d
	ld b,000h		;674f
	ret p			;6751
	rst 38h			;6752
	nop			;6753
	nop			;6754
	rst 38h			;6755
	rst 38h			;6756
	nop			;6757
	nop			;6758
	rst 38h			;6759
	rst 38h			;675a
	nop			;675b
	nop			;675c
	rst 38h			;675d
	pop af			;675e
	nop			;675f
	nop			;6760
	rst 38h			;6761
	push af			;6762
	nop			;6763
	inc b			;6764
	ret p			;6765
	add a,h			;6766
	nop			;6767
	inc b			;6768
	or 0b6h			;6769
	ld b,036h		;676b
	add a,h			;676d
	inc d			;676e
	inc b			;676f
	inc d			;6770
	or e			;6771
	and 033h		;6772
	and 0a6h		;6774
	ld (03226h),a		;6776
	sbc a,c			;6779
	call z,L_CC19		;677a
	cp d			;677d
	ld l,03ah		;677e
	ld l,09bh		;6780
	call pe,0ec1bh		;6782
	jp 003e1h		;6785

; ----------------------------------------------------------------------
; DATOS tabla: (9 B; racha 4.00, entropia 2.95, 8 valores: pocos valores para ser un dibujo)
;   0x6788..0x6791  (9 bytes)
; ----------------------------------------------------------------------
	defb 0e0h,0fbh,0efh,003h,0e0h,0f9h,0cfh,001h,0c0h	; 6788  .........

; ======================================================================
; CODIGO 0x6791..0x682e  (157 bytes)
; ======================================================================


L_6791:
	call m,0001fh		;6791
	nop			;6794
	rst 38h			;6795
	rst 38h			;6796
	nop			;6797
	nop			;6798
	rst 38h			;6799
	rst 38h			;679a
	nop			;679b
	nop			;679c
	pop hl			;679d
	rst 38h			;679e
	nop			;679f
	nop			;67a0
	call z,00c3fh		;67a1
	nop			;67a4
	ld de,011bfh		;67a5
	add a,b			;67a8
	ld l,(hl)		;67a9
	rrca			;67aa
	ld l,(hl)		;67ab
	nop			;67ac
	ld (hl),e		;67ad
	jr z,L_6823		;67ae
	jr nz,L_67DF		;67b0
	and d			;67b2
	dec l			;67b3
	and d			;67b4
	sub d			;67b5
	call nz,L_C412		;67b6
	cp c			;67b9
	ld c,c			;67ba
	add hl,sp		;67bb
	ld c,b			;67bc
	cp l			;67bd
	ld d,l			;67be
	dec a			;67bf
	ld d,h			;67c0
	cp (hl)			;67c1
	or c			;67c2
	ld a,0b0h		;67c3
	sbc a,l			;67c5
	rst 0			;67c6
	dec e			;67c7
	ret nz			;67c8
	ret nz			;67c9
	rst 18h			;67ca
	nop			;67cb
	ret nz			;67cc
	cp 01fh			;67cd
	nop			;67cf
	nop			;67d0
	rst 38h			;67d1
	rst 38h			;67d2
	nop			;67d3
	nop			;67d4
	rst 38h			;67d5
	rst 38h			;67d6
	nop			;67d7
	nop			;67d8
	ret p			;67d9
	ccf			;67da
	nop			;67db
	nop			;67dc
	push hl			;67dd
	cp a			;67de
L_67DF:
	dec b			;67df
	add a,b			;67e0
	xor 0bfh		;67e1
	ld c,080h		;67e3
	xor 00fh		;67e5
	ld c,000h		;67e7
	add a,c			;67e9
	ld l,a			;67ea
	ld bc,03d60h		;67eb
	xor a			;67ee
	dec a			;67ef
	and b			;67f0
	ld a,d			;67f1
	adc a,a			;67f2
	ld a,d			;67f3
	add a,b			;67f4
	ld a,d			;67f5
	cp a			;67f6
	ld a,d			;67f7
	add a,b			;67f8
	ld a,d			;67f9
	adc a,a			;67fa
	ld a,d			;67fb
	add a,b			;67fc
	dec a			;67fd
	xor a			;67fe
	dec a			;67ff
	and b			;6800
	add a,c			;6801
	ld l,a			;6802
	ld bc,0ee60h		;6803
	inc bc			;6806
	ld c,000h		;6807
	xor 0fbh		;6809
	ld c,0f8h		;680b
	push hl			;680d
	and e			;680e
	dec b			;680f
	and b			;6810
	ret p			;6811
	rrca			;6812
	nop			;6813
	nop			;6814
	rst 38h			;6815
	rrca			;6816
	nop			;6817
	nop			;6818
	ret po			;6819
	ld l,a			;681a
	nop			;681b
	ld h,b			;681c
	adc a,0e7h		;681d
	ld c,0e0h		;681f
	rst 18h			;6821
	ld d,e			;6822
L_6823:
	rra			;6823
	ld d,b			;6824
	sbc a,0abh		;6825
	ld e,0a8h		;6827
	call c,01cabh		;6829
	xor b			;682c
	ret			;682d

; ----------------------------------------------------------------------
; DATOS graficos: (5194 B; racha 3.08, entropia 6.49, 245 valores: rachas mas largas que el azar)
;   0x682e..0x7c78  (5194 bytes)
; ----------------------------------------------------------------------
	defb 063h,009h,060h,096h,0d7h,016h,0d0h,0b9h,097h,039h,090h,0b7h,007h,037h,000h,088h	; 682e  c.`......9...7..
	defb 0dfh,008h,0c0h,0ech,01fh,00ch,000h,0e2h,07fh,002h,000h,0f5h,03fh,005h,000h,0f0h	; 683e  ............?...
	defb 0bfh,000h,080h,0feh,03fh,000h,000h,0f8h,03fh,000h,000h,0f3h,09fh,003h,080h,0f7h	; 684e  ....?...?.......
	defb 0dfh,007h,0c0h,087h,0c3h,007h,0c0h,037h,0d9h,037h,0d8h,074h,05dh,074h,05ch,033h	; 685e  .......7.7.t]t\3
	defb 099h,033h,098h,04ch,065h,04ch,064h,067h,0cdh,067h,0cch,028h,021h,028h,020h,06dh	; 686e  .3.LeLdg.g.(!( m
	defb 06fh,06ch,060h,021h,00fh,020h,000h,0afh,0ffh,020h,000h,08fh,0ffh,000h,000h,0ffh	; 687e  ol`!. ... ......
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0f8h,07fh,000h,000h,0fbh	; 688e  ................
	defb 003h,003h,000h,0e3h,0b9h,003h,0b8h,08dh,07dh,00dh,07ch,0aah,0bdh,02ah,0bch,092h	; 689e  ........}.|..*..
	defb 09dh,012h,09ch,023h,049h,023h,048h,045h,0b4h,045h,0b4h,014h,0ceh,004h,0ceh,0f0h	; 68ae  ...#I#HE.E......
	defb 076h,000h,076h,0fdh,088h,001h,088h,0fch,033h,000h,030h,0ffh,087h,000h,000h,0ffh	; 68be  v.v.....3.0.....
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0f0h,00fh,000h,000h,0c5h,0a7h,005h,0a0h,0dfh	; 68ce  ................
	defb 077h,01fh,070h,0c0h,077h,000h,070h,0f6h,081h,006h,080h,0f5h,0bch,005h,0bch,0f1h	; 68de  w.p.w.p.........
	defb 05eh,001h,05eh,0fdh,05eh,001h,05eh,0f1h,05eh,001h,05eh,0f5h,0bch,005h,0bch,0f6h	; 68ee  ^.^.^.^.^.^.....
	defb 081h,006h,080h,0f0h,077h,000h,070h,0fdh,077h,001h,070h,0fdh,0a7h,001h,0a0h,0fch	; 68fe  ....w.p.w.p.....
	defb 00fh,000h,000h,0ffh,0ffh,000h,000h,0fch,07fh,000h,000h,0fdh,00fh,001h,000h,0fch	; 690e  ................
	defb 0afh,000h,0a0h,0feh,047h,000h,040h,0f8h,037h,000h,030h,0fbh,011h,003h,010h,0e0h	; 691e  ....G.@.7.0.....
	defb 0edh,000h,0ech,0e9h,09dh,009h,09ch,0ebh,069h,00bh,068h,0c6h,093h,006h,090h,0d5h	; 692e  ........i.h.....
	defb 03bh,015h,038h,0d5h,07bh,015h,078h,0cah,0fbh,00ah,0f8h,0e7h,073h,007h,070h,0f6h	; 693e  ;.8.{.x.....s.p.
	defb 007h,006h,000h,0f0h,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 694e  ................
	defb 087h,000h,000h,0f8h,031h,000h,030h,0e3h,035h,003h,034h,0ech,014h,00ch,014h,0edh	; 695e  ....1.0.5.4.....
	defb 0e6h,00dh,0e6h,0c2h,034h,002h,034h,09dh,0d6h,01dh,0d6h,0bah,022h,03ah,022h,09bh	; 696e  ....4.4.....":".
	defb 0ech,01bh,0ech,0c3h,0eeh,003h,0eeh,0fbh,0ech,003h,0ech,0f9h,0c1h,001h,0c0h,0fch	; 697e  ................
	defb 01fh,000h,000h,0ffh,0ffh,000h,000h,0f0h,0ffh,000h,000h,0e6h,0ffh,006h,000h,08ch	; 698e  ................
	defb 021h,00ch,000h,0b1h,0adh,031h,08ch,0bfh,00dh,03fh,00ch,099h,099h,019h,098h,0c6h	; 699e  !....1...?......
	defb 0d3h,006h,0d0h,0c9h,067h,009h,060h,0dch,0a1h,01ch,0a0h,0deh,0a5h,01eh,0a4h,0dfh	; 69ae  ....g.`.........
	defb 049h,01fh,048h,0ceh,093h,00eh,090h,0e1h,0ebh,001h,0e8h,0fdh,0a3h,001h,0a0h,0fch	; 69be  I.H.............
	defb 00fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0f8h,0ffh,000h,000h,0f2h	; 69ce  ................
	defb 07fh,002h,000h,0f7h,00fh,007h,000h,0f7h,06fh,007h,060h,0c1h,067h,001h,060h,09eh	; 69de  ........o.`.g.`.
	defb 097h,01eh,090h,0bdh,057h,03dh,050h,0bdh,047h,03dh,040h,0bdh,043h,03dh,040h,09eh	; 69ee  ....W=P.G=@.C=@.
	defb 0dbh,01eh,0d8h,0c1h,0bbh,001h,0b8h,0dch,003h,01ch,000h,0ddh,0f7h,01dh,0f0h,0cbh	; 69fe  ................
	defb 047h,00bh,040h,0e0h,01fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0c3h,000h,000h,0f0h	; 6a0e  G.@.............
	defb 01bh,000h,018h,0e7h,039h,007h,038h,0efh,0b4h,00fh,0b4h,0efh,056h,00fh,056h,08eh	; 6a1e  ....9.8.....V.V.
	defb 052h,00eh,052h,0b4h,0b8h,034h,0b8h,0bbh,06bh,03bh,068h,094h,0c3h,014h,0c0h,0b3h	; 6a2e  R.R..4..k;h.....
	defb 08fh,033h,080h,088h,063h,008h,060h,0d4h,03bh,014h,038h,0c2h,09bh,002h,018h,0f8h	; 6a3e  .3..c.`.;.8.....
	defb 0c3h,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0f8h,03fh,000h,000h,083h	; 6a4e  ............?...
	defb 09fh,003h,080h,037h,0dfh,037h,0c0h,077h,0c3h,077h,0c0h,037h,0d9h,037h,0d8h,044h	; 6a5e  ...7.7.w.w.7.7.D
	defb 05dh,044h,05ch,06bh,0b9h,06bh,0b8h,02ch,043h,02ch,040h,067h,0b7h,067h,0b0h,028h	; 6a6e  ]D\k.k.,C,@g.g.(
	defb 037h,028h,030h,0ach,0c7h,02ch,0c0h,08ch,01fh,00ch,000h,0e1h,0ffh,000h,000h,0ffh	; 6a7e  7(0..,..........
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0f0h,03fh,000h,000h,0c5h	; 6a8e  ............?...
	defb 0bfh,005h,080h,0d7h,087h,017h,080h,0c9h,073h,009h,070h,092h,0fbh,012h,0f8h,0a5h	; 6a9e  ........s.p.....
	defb 07bh,025h,078h,085h,03bh,005h,038h,0e6h,093h,006h,090h,0cbh,063h,00bh,060h,099h	; 6aae  {%x.;.8.....c.`.
	defb 099h,019h,098h,0b0h,0fdh,030h,0fch,0b5h,08dh,031h,08ch,084h,031h,000h,030h,0ffh	; 6abe  .....0...1..1.0.
	defb 067h,000h,060h,0ffh,00fh,000h,000h,0f8h,007h,000h,000h,0e2h,0d3h,002h,0d0h,0efh	; 6ace  g.`.............
	defb 0bbh,00fh,0b8h,0c0h,03bh,000h,038h,0ddh,083h,01dh,080h,0dbh,079h,01bh,078h,0c2h	; 6ade  ....;.8.....y.x.
	defb 0bdh,002h,0bch,0e2h,0bdh,002h,0bch,0eah,0bdh,00ah,0bch,0e9h,079h,009h,078h,0e6h	; 6aee  ............y.x.
	defb 083h,006h,080h,0f6h,0efh,006h,0e0h,0f0h,0efh,000h,0e0h,0feh,04fh,000h,040h,0ffh	; 6afe  ............O.@.
	defb 01fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0c3h,01fh,000h,000h,0d9h	; 6b0e  ................
	defb 043h,018h,040h,0dch,02bh,01ch,028h,0c6h,011h,006h,010h,0f1h,0cdh,001h,0cch,0c3h	; 6b1e  C.@.+.(.........
	defb 029h,003h,028h,0d6h,0ddh,016h,0dch,01dh,02dh,01dh,02ch,04ah,071h,04ah,070h,06ah	; 6b2e  ).(.....-.,JqJpj
	defb 0f7h,06ah,0f0h,02dh,0f7h,02dh,0f0h,09ch,0e7h,01ch,0e0h,0d8h,00fh,018h,000h,0c3h	; 6b3e  .j.-.-..........
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0f0h	; 6b4e  ................
	defb 0ffh,000h,000h,0f6h,00fh,006h,000h,0f6h,063h,006h,060h,0f4h,01bh,004h,018h,0f3h	; 6b5e  ........c.`.....
	defb 0dbh,003h,0d8h,086h,021h,006h,020h,0b5h,0ddh,035h,0dch,0a3h,0edh,023h,0ech,098h	; 6b6e  ....!. ..5...#..
	defb 009h,018h,008h,0dbh,063h,01bh,060h,0cbh,0efh,00bh,0e0h,0e1h,0cfh,001h,0c0h,0fch	; 6b7e  ....c.`.........
	defb 01fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0c3h,0ffh,000h,000h,098h	; 6b8e  ................
	defb 021h,018h,000h,0a1h,0adh,021h,08ch,097h,00dh,017h,00ch,0b9h,099h,039h,098h,096h	; 6b9e  !....!.......9..
	defb 0d3h,016h,0d0h,0c7h,067h,007h,060h,0dbh,0afh,01bh,0a0h,0d9h,0a3h,019h,0a0h,0deh	; 6bae  ....g.`.........
	defb 04bh,01eh,048h,0ceh,0b3h,00eh,0b0h,0e1h,0c7h,001h,0c0h,0fch,09fh,000h,080h,0feh	; 6bbe  K.H.............
	defb 03fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0f8h,07fh,000h,000h,0e3h	; 6bce  ?...............
	defb 07fh,003h,000h,0cdh,07fh,00dh,000h,0dch,003h,01ch,000h,0c1h,0bbh,001h,0b8h,09ah	; 6bde  ................
	defb 0dbh,01ah,0d8h,0bbh,043h,03bh,040h,0b3h,047h,033h,040h,0bbh,057h,03bh,050h,09ah	; 6bee  ....C;@.G3@.W;P.
	defb 097h,01ah,090h,0c1h,067h,001h,060h,0f7h,06fh,007h,060h,0f3h,00fh,003h,000h,0f8h	; 6bfe  ....g.`.o.`.....
	defb 07fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,01fh,000h,000h,0feh,04fh,000h,040h,0f0h	; 6c0e  ............O.@.
	defb 0e3h,000h,0e0h,0e7h,059h,007h,058h,0efh,025h,00fh,024h,0ech,0d1h,00ch,0d0h,0edh	; 6c1e  ....Y.X.%.$.....
	defb 0d7h,00dh,0d0h,0e3h,0b3h,003h,0b0h,0cbh,069h,00bh,068h,0dch,0cch,01ch,0cch,0cbh	; 6c2e  ........i.h.....
	defb 086h,00bh,086h,0d0h,0d6h,010h,0c6h,0cch,010h,00ch,000h,0e1h,0ffh,000h,000h,0ffh	; 6c3e  ................
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0f8h,03fh,000h,000h,0c3h	; 6c4e  ............?...
	defb 09fh,003h,080h,097h,0dfh,017h,0c0h,0b6h,0c7h,036h,0c0h,030h,013h,030h,010h,047h	; 6c5e  .........6.0.0.G
	defb 0dbh,047h,0d8h,06bh,0bbh,06bh,0b8h,00ch,043h,00ch,040h,0e7h,0b7h,007h,0b0h,0e8h	; 6c6e  .G.k.k..C.@.....
	defb 037h,008h,030h,0ech,0c7h,00ch,0c0h,0ech,01fh,00ch,000h,0e1h,0ffh,000h,000h,0ffh	; 6c7e  7.0.............
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0e0h	; 6c8e  ................
	defb 0ffh,000h,000h,0cah,007h,00ah,000h,0d7h,073h,017h,070h,0d2h,07bh,012h,078h,0c5h	; 6c9e  ........s.p.{.x.
	defb 09bh,005h,098h,0e5h,0d9h,005h,0d8h,0eeh,0e4h,00eh,0e4h,0ebh,06eh,00bh,06eh,0e1h	; 6cae  ............n.n.
	defb 094h,001h,094h,0f8h,0e9h,000h,0e8h,0e3h,00bh,003h,008h,0eeh,053h,00eh,010h,0ech	; 6cbe  ............S...
	defb 0c7h,00ch,000h,0e1h,0ffh,000h,000h,0feh,01fh,000h,000h,0feh,0c7h,000h,0c0h,0feh	; 6cce  ................
	defb 0b3h,000h,0b0h,0c0h,03bh,000h,038h,0ddh,083h,01dh,080h,0dbh,059h,01bh,058h,0c2h	; 6cde  ....;.8.....Y.X.
	defb 0ddh,002h,0dch,0e2h,0cdh,002h,0cch,0eah,0ddh,00ah,0dch,0e9h,059h,009h,058h,0e6h	; 6cee  ............Y.X.
	defb 083h,006h,080h,0f6h,0efh,006h,0e0h,0f0h,0cfh,000h,0c0h,0feh,01fh,000h,000h,0ffh	; 6cfe  ................
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0c3h,0ffh,000h,000h,0d9h	; 6d0e  ................
	defb 08fh,018h,000h,0dch,0a7h,01ch,020h,0c6h,017h,006h,010h,0f1h,0d3h,001h,0d0h,0c3h	; 6d1e  ...... .........
	defb 029h,003h,028h,0d6h,0ddh,016h,0dch,0ddh,0c9h,01dh,0c8h,0cbh,0b3h,00bh,0b0h,08bh	; 6d2e  ).(.............
	defb 037h,00bh,030h,0a4h,0f7h,024h,0f0h,0aeh,0e7h,02eh,0e0h,094h,00fh,014h,000h,0c1h	; 6d3e  7.0..$..........
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 6d4e  ................
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0f0h,087h,000h,000h,0f6h,0b7h,006h,030h,084h	; 6d5e  ..............0.
	defb 010h,004h,010h,0b3h,0e6h,033h,0e6h,0a6h,032h,026h,032h,099h,0cch,019h,0cch,0dbh	; 6d6e  .....3..2&2.....
	defb 0edh,01bh,0ech,0c8h,009h,008h,008h,0e3h,063h,003h,060h,0fbh,0efh,003h,0e0h,0f9h	; 6d7e  ........c.`.....
	defb 0cfh,001h,0c0h,0fch,01fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0e1h	; 6d8e  ................
	defb 0ffh,000h,000h,0cch,03fh,00ch,000h,091h,0bfh,011h,080h,02eh,00fh,02eh,000h,073h	; 6d9e  ....?..........s
	defb 02fh,073h,020h,02dh,0afh,02dh,0a0h,08eh,0cfh,00eh,0c0h,0b7h,047h,037h,040h,0b3h	; 6dae  /s -.-......G7@.
	defb 057h,033h,050h,0bch,0b7h,03ch,0b0h,09dh,0c7h,01dh,0c0h,0c0h,09fh,000h,080h,0feh	; 6dbe  W3P..<..........
	defb 03fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0fch,03fh,000h,000h,0f1h	; 6dce  ?...........?...
	defb 0bfh,001h,080h,0e6h,0bfh,006h,080h,0eeh,00fh,00eh,000h,081h,06fh,001h,060h,035h	; 6dde  ............o.`5
	defb 0afh,035h,0a0h,076h,08fh,076h,080h,066h,0bfh,066h,080h,076h,08fh,076h,080h,035h	; 6dee  .5.v.v.f.f.v.v.5
	defb 0afh,035h,0a0h,081h,06fh,001h,060h,0eeh,00fh,00eh,000h,0e6h,0bfh,006h,080h,0f1h	; 6dfe  .5..o.`.........
	defb 0bfh,001h,080h,0fch,03fh,000h,000h,0ffh,01fh,000h,000h,0e0h,04fh,000h,040h,0ceh	; 6e0e  ....?.......O.@.
	defb 0e7h,00eh,0e0h,0deh,053h,01eh,050h,0d9h,0abh,019h,0a8h,0dbh,0abh,01bh,0a8h,0c7h	; 6e1e  ....S.P.........
	defb 063h,007h,060h,096h,0d7h,016h,0d0h,0b9h,097h,039h,090h,097h,007h,017h,000h,0c8h	; 6e2e  c.`......9......
	defb 0dfh,008h,0c0h,0ech,01fh,00ch,000h,0e1h,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 6e3e  ................
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0f8h,03fh,000h,000h,0f3h,09fh,003h,080h,0f7h	; 6e4e  ........?.......
	defb 0dfh,007h,0c0h,0c6h,0c7h,006h,0c0h,090h,013h,010h,010h,0b7h,0dbh,037h,0d8h,033h	; 6e5e  .............7.3
	defb 099h,033h,098h,04ch,065h,04ch,064h,067h,0cdh,067h,0cch,008h,021h,008h,020h,0edh	; 6e6e  .3.LeLdg.g..!. .
	defb 06fh,00ch,060h,0e1h,00fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 6e7e  o.`.............
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0fch,07fh,000h,000h,0f9h	; 6e8e  ................
	defb 003h,001h,000h,0e3h,0b9h,003h,0b8h,0edh,03dh,00dh,03ch,0eah,0cdh,00ah,0cch,0e2h	; 6e9e  ........=.<.....
	defb 0edh,002h,0ech,0f3h,071h,003h,070h,0f5h,0b4h,005h,0b4h,0f4h,0ceh,004h,0ceh,0f0h	; 6eae  ....q.p.........
	defb 074h,000h,074h,0fdh,089h,001h,088h,0fch,033h,000h,030h,0ffh,087h,000h,000h,0ffh	; 6ebe  t.t.....3.0.....
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0fch,03fh,000h,000h,0fdh,08fh,001h,080h,0fdh	; 6ece  ........?.......
	defb 067h,001h,060h,0f0h,077h,000h,070h,0f6h,081h,006h,080h,0f5h,0ach,005h,0ach,0f1h	; 6ede  g.`.w.p.........
	defb 06eh,001h,06eh,0fdh,066h,001h,066h,0f1h,06eh,001h,06eh,0f5h,0ach,005h,0ach,0f6h	; 6eee  n.n.f.f.n.n.....
	defb 081h,006h,080h,0f0h,077h,000h,070h,0fdh,067h,001h,060h,0fdh,08fh,001h,080h,0fch	; 6efe  ....w.p.g.`.....
	defb 03fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 6f0e  ?...............
	defb 0ffh,000h,000h,0ffh,087h,000h,000h,0f8h,037h,000h,030h,0fbh,013h,003h,010h,0e0h	; 6f1e  ........7.0.....
	defb 0e9h,000h,0e8h,0e9h,09dh,009h,09ch,0ebh,069h,00bh,068h,0c6h,0e3h,006h,0e0h,0d5h	; 6f2e  ........i.h.....
	defb 0dbh,015h,0d8h,0d5h,09bh,015h,098h,0cah,07bh,00ah,078h,0e7h,073h,007h,070h,0f2h	; 6f3e  ........{.x.s.p.
	defb 007h,002h,000h,0f8h,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 6f4e  ................
	defb 087h,000h,000h,0f8h,037h,000h,030h,0e3h,037h,003h,030h,0ech,017h,00ch,010h,0edh	; 6f5e  ....7.0.7.0.....
	defb 0e7h,00dh,0e0h,0c2h,030h,002h,030h,0ddh,0d6h,01dh,0d6h,0dbh,0e2h,01bh,0e2h,0c8h	; 6f6e  ....0.0.........
	defb 00ch,008h,00ch,0e3h,06dh,003h,06ch,0fbh,0e9h,003h,0e8h,0f9h,0c3h,001h,0c0h,0fch	; 6f7e  ....m.l.........
	defb 01fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,087h,000h,000h,0e3h,037h,000h,030h,0cah	; 6f8e  ............7.0.
	defb 077h,008h,070h,0d0h,0c7h,010h,0c0h,097h,01fh,017h,000h,029h,087h,029h,080h,076h	; 6f9e  w.p........).).v
	defb 0d7h,076h,0d0h,027h,077h,027h,070h,09bh,0a7h,01bh,0a0h,0d9h,0a3h,019h,0a0h,0deh	; 6fae  .v.'w'p.........
	defb 04bh,01eh,048h,0ceh,0ebh,00eh,0e8h,0e0h,053h,000h,050h,0ffh,007h,000h,000h,0ffh	; 6fbe  K.H.....S.P.....
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0f8h	; 6fce  ................
	defb 07fh,000h,000h,0f3h,00fh,003h,000h,0f7h,06fh,007h,060h,0c1h,067h,001h,060h,09ah	; 6fde  ........o.`.g.`.
	defb 097h,01ah,090h,0bbh,057h,03bh,050h,0b3h,047h,033h,040h,0bbh,043h,03bh,040h,09ah	; 6fee  ....W;P.G3@.C;@.
	defb 0dbh,01ah,0d8h,0c1h,0bbh,001h,0b8h,0dch,003h,01ch,000h,0cdh,07fh,00dh,000h,0e3h	; 6ffe  ................
	defb 07fh,003h,000h,0f8h,07fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,083h,000h,000h,0f0h	; 700e  ................
	defb 029h,000h,028h,0e7h,075h,007h,074h,0efh,025h,00fh,024h,0ech,0d1h,00ch,0d0h,0cdh	; 701e  ).(.u.t.%.$.....
	defb 0d3h,00dh,0d0h,093h,0bbh,013h,0b8h,0bbh,06bh,03bh,068h,094h,0c3h,014h,0c0h,0cbh	; 702e  ........k;h.....
	defb 08fh,00bh,080h,0e8h,063h,008h,060h,0e5h,03bh,004h,038h,0f1h,09bh,000h,018h,0ffh	; 703e  ....c.`.;.8.....
	defb 0c3h,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0f8h,03fh,000h,000h,0f3h	; 704e  ............?...
	defb 087h,003h,080h,0f7h,0d3h,007h,0d0h,0c6h,0dbh,006h,0d8h,090h,019h,010h,018h,0b7h	; 705e  ................
	defb 0c5h,037h,0c4h,0bbh,0adh,03bh,0ach,084h,061h,004h,060h,0dbh,0cfh,01bh,0c0h,0d8h	; 706e  .7...;..a.`.....
	defb 02fh,018h,020h,0c6h,06fh,006h,060h,0f0h,06fh,000h,060h,0ffh,00fh,000h,000h,0ffh	; 707e  /. .o.`.o.`.....
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0fch,07fh,000h,000h,0f9h	; 708e  ................
	defb 03fh,001h,000h,0e3h,087h,003h,080h,0cdh,073h,00dh,070h,0d2h,07bh,012h,078h,0c5h	; 709e  ?.......s.p.{.x.
	defb 09bh,005h,098h,0f5h,0dbh,005h,0d8h,0e6h,0e3h,006h,0e0h,0cbh,069h,00bh,068h,099h	; 70ae  ............i.h.
	defb 09dh,019h,09ch,0b0h,0e9h,030h,0e8h,0b5h,085h,031h,084h,084h,019h,000h,018h,0ffh	; 70be  .....0...1......
	defb 0c3h,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0feh,01fh,000h,000h,0f0h	; 70ce  ................
	defb 0cfh,000h,0c0h,0f6h,0efh,006h,0e0h,0e6h,083h,006h,080h,0e9h,059h,009h,058h,0eah	; 70de  ............Y.X.
	defb 0ddh,00ah,0dch,0e2h,0cdh,002h,0cch,0c2h,0ddh,002h,0dch,0dbh,059h,01bh,058h,0ddh	; 70ee  ............Y.X.
	defb 083h,01dh,080h,0c0h,03bh,000h,038h,0feh,0b3h,000h,0b0h,0feh,0c7h,000h,0c0h,0feh	; 70fe  ....;.8.........
	defb 01fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 710e  ................
	defb 087h,000h,000h,008h,033h,000h,030h,06bh,00bh,063h,008h,061h,0d3h,061h,0d0h,033h	; 711e  ....3.0k.c.a.a.3
	defb 03bh,033h,038h,096h,0d3h,016h,0d0h,0cdh,0c7h,00dh,0c0h,0ebh,0b7h,00bh,0b0h,08bh	; 712e  ;38.............
	defb 037h,00bh,030h,0a4h,0f7h,024h,0f0h,09ah,0e7h,01ah,0e0h,0c7h,00fh,007h,000h,0f2h	; 713e  7.0..$..........
	defb 07fh,002h,000h,0f8h,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0f0h	; 714e  ................
	defb 0ffh,000h,000h,0f6h,087h,006h,000h,0f6h,0b7h,006h,030h,084h,010h,004h,010h,0b3h	; 715e  ..........0.....
	defb 0e6h,033h,0e6h,0b6h,036h,036h,036h,0a5h,0d2h,025h,0d2h,09bh,0ech,01bh,0ech,0dbh	; 716e  .3..666..%......
	defb 0edh,01bh,0ech,0cbh,069h,00bh,068h,0e2h,0a3h,002h,0a0h,0fbh,06fh,003h,060h,0f9h	; 717e  ....i.h.....o.`.
	defb 0cfh,001h,0c0h,0fch,01fh,000h,000h,0ffh,0ffh,000h,000h,0c3h,0ffh,000h,000h,0d8h	; 718e  ................
	defb 021h,018h,000h,099h,0adh,019h,08ch,0a7h,00dh,027h,00ch,029h,099h,029h,098h,076h	; 719e  !........'.).).v
	defb 0d3h,076h,0d0h,02fh,067h,02fh,060h,09fh,0afh,01fh,0a0h,0b7h,0a3h,037h,0a0h,0abh	; 71ae  .v./g/`......7..
	defb 05bh,02bh,058h,0b6h,09bh,036h,098h,09dh,0e3h,01dh,0e0h,0c0h,08fh,000h,080h,0feh	; 71be  [+X..6..........
	defb 03fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0fch,01fh,000h,000h,0f1h	; 71ce  ?...............
	defb 0dfh,001h,0c0h,0e6h,0dfh,006h,0c0h,0eeh,003h,00eh,000h,081h,0bbh,001h,0b8h,03eh	; 71de  ...............>
	defb 0dbh,03eh,0d8h,06fh,043h,06fh,040h,057h,05fh,057h,040h,06fh,047h,06fh,040h,03eh	; 71ee  .>.oCo@W_W@oGo@>
	defb 0d7h,03eh,0d0h,081h,0b7h,001h,0b0h,0eeh,007h,00eh,000h,0e6h,0dfh,006h,0c0h,0f1h	; 71fe  .>..............
	defb 0dfh,001h,0c0h,0fch,01fh,000h,000h,0ffh,01fh,000h,000h,0e0h,047h,000h,040h,0ceh	; 720e  ............G.@.
	defb 0f1h,00eh,0f0h,0dbh,04dh,01bh,04ch,0d5h,0adh,015h,0ach,0dbh,0d1h,01bh,0d0h,0cfh	; 721e  ....M.L.........
	defb 0d3h,00fh,0d0h,097h,0bbh,017h,0b8h,0bbh,06bh,03bh,068h,094h,0c3h,014h,0c0h,0d3h	; 722e  ........k;h.....
	defb 08fh,013h,080h,0cch,063h,00ch,060h,0edh,03bh,00ch,038h,0e1h,09bh,000h,018h,0ffh	; 723e  ....c.`.;.8.....
	defb 0c3h,000h,000h,0ffh,0ffh,000h,000h,0f8h,03fh,000h,000h,0f3h,09fh,003h,080h,0f7h	; 724e  ........?.......
	defb 0dfh,007h,0c0h,0c7h,0c7h,007h,0c0h,096h,0d3h,016h,0d0h,0b5h,05bh,035h,058h,036h	; 725e  ............[5X6
	defb 0d9h,036h,0d8h,04bh,0a5h,04bh,0a4h,06ch,06dh,06ch,06ch,067h,0cdh,067h,0cch,008h	; 726e  .6.K.K.lmllg.g..
	defb 021h,008h,020h,0edh,06fh,00ch,060h,0edh,00fh,00ch,000h,0e1h,0ffh,000h,000h,0ffh	; 727e  !. .o.`.........
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0f8h,0ffh,000h,000h,0e2h,007h,002h,000h,08fh	; 728e  ................
	defb 073h,00fh,070h,0b2h,0dbh,032h,0d8h,0b5h,0abh,035h,0a8h,08bh,0dbh,00bh,0d8h,0cbh	; 729e  s.p..2...5......
	defb 0f3h,00bh,0f0h,0ddh,0e9h,01dh,0e8h,0d6h,0ddh,016h,0dch,0c3h,029h,003h,028h,0f1h	; 72ae  ............).(.
	defb 0cbh,001h,0c8h,0c6h,033h,006h,030h,0dch,0b7h,01ch,030h,0d9h,087h,018h,000h,0c3h	; 72be  ....3.0...0.....
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0f8h,03fh,000h,000h,0fbh,08fh,003h,080h,0fbh	; 72ce  ........?.......
	defb 067h,003h,060h,0c0h,077h,000h,070h,0ddh,081h,01dh,080h,0dbh,07ch,01bh,07ch,0c2h	; 72de  g.`.w.p.....|.|.
	defb 0deh,002h,0deh,0fah,0aeh,002h,0aeh,0e2h,0deh,002h,0deh,0ebh,07ch,00bh,07ch,0edh	; 72ee  ............|.|.
	defb 081h,00dh,080h,0e0h,077h,000h,070h,0fbh,067h,003h,060h,0fbh,08fh,003h,080h,0f8h	; 72fe  ....w.p.g.`.....
	defb 03fh,000h,000h,0ffh,0ffh,000h,000h,0e1h,0ffh,000h,000h,0ech,0c3h,00ch,000h,0eeh	; 730e  ?...............
	defb 05bh,00eh,018h,0e3h,019h,003h,018h,0f8h,0e5h,000h,0e4h,0e1h,094h,001h,094h,0ebh	; 731e  [...............
	defb 06eh,00bh,06eh,0eeh,0b4h,00eh,0b4h,0e5h,059h,005h,058h,0c5h,0bdh,005h,0bch,0dah	; 732e  n.n.....Y.X.....
	defb 0fdh,01ah,0fch,0d9h,07dh,019h,07ch,0c7h,0b9h,007h,0b8h,0f1h,003h,001h,000h,0fch	; 733e  ....}.|.........
	defb 07fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 734e  ................
	defb 0ffh,000h,000h,0f0h,087h,000h,000h,0f6h,0b7h,006h,030h,084h,010h,004h,010h,0b3h	; 735e  ..........0.....
	defb 0e6h,033h,0e6h,0b6h,036h,036h,036h,0a5h,0d2h,025h,0d2h,09bh,0ech,01bh,0ech,0dbh	; 736e  .3..666..%......
	defb 06dh,01bh,06ch,0cah,0a9h,00ah,0a8h,0e3h,063h,003h,060h,0fbh,0efh,003h,0e0h,0f9h	; 737e  m.l.....c.`.....
	defb 0cfh,001h,0c0h,0fch,01fh,000h,000h,0ffh,0ffh,000h,000h,0c3h,0ffh,000h,000h,0dah	; 738e  ................
	defb 01fh,018h,000h,098h,0dfh,018h,0c0h,0a7h,007h,027h,000h,029h,097h,029h,090h,076h	; 739e  .........'.).).v
	defb 0d7h,076h,0d0h,02fh,067h,02fh,060h,09bh,0afh,01bh,0a0h,0b5h,0a3h,035h,0a0h,0bbh	; 73ae  .v./g/`......5..
	defb 05bh,03bh,058h,0beh,09bh,03eh,098h,09dh,0e3h,01dh,0e0h,0c0h,08fh,000h,080h,0feh	; 73be  [;X..>..........
	defb 03fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0fch,01fh,000h,000h,0f1h	; 73ce  ?...............
	defb 0dfh,001h,0c0h,0e6h,0dfh,006h,0c0h,0eeh,007h,00eh,000h,081h,0b7h,001h,0b0h,03eh	; 73de  ...............>
	defb 0d7h,03eh,0d0h,077h,047h,077h,040h,06bh,05fh,06bh,040h,077h,047h,077h,040h,03eh	; 73ee  .>.wGw@k_k@wGw@>
	defb 0d7h,03eh,0d0h,081h,0b7h,001h,0b0h,0eeh,007h,00eh,000h,0e6h,0dfh,006h,0c0h,0f1h	; 73fe  .>..............
	defb 0dfh,001h,0c0h,0fch,01fh,000h,000h,0ffh,01fh,000h,000h,0e0h,047h,000h,040h,0ceh	; 740e  ............G.@.
	defb 0f1h,00eh,0f0h,0dfh,04dh,01fh,04ch,0ddh,0adh,01dh,0ach,0dah,0d1h,01ah,0d0h,0cdh	; 741e  ....M.L.........
	defb 0d7h,00dh,0d0h,097h,0b3h,017h,0b0h,0bbh,06bh,03bh,068h,094h,0cbh,014h,0c8h,0d3h	; 742e  ........k;h.....
	defb 083h,013h,080h,0cch,06fh,00ch,060h,0edh,00fh,00ch,000h,0e1h,0ffh,000h,000h,0ffh	; 743e  ....o.`.........
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0f8h,03fh,000h,000h,0f3h,09fh,003h,080h,0f7h	; 744e  ........?.......
	defb 0dfh,007h,0c0h,0c6h,0c7h,006h,0c0h,095h,053h,015h,050h,0b6h,0dbh,036h,0d8h,037h	; 745e  ........S.P..6.7
	defb 0d9h,037h,0d8h,04bh,0a5h,04bh,0a4h,06ch,06dh,06ch,06ch,067h,0cdh,067h,0cch,008h	; 746e  .7.K.K.lmllg.g..
	defb 021h,008h,020h,0edh,06fh,00ch,060h,0e1h,00fh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 747e  !. .o.`.........
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0f8h,0ffh,000h,000h,0e2h,007h,002h,000h,08fh	; 748e  ................
	defb 073h,00fh,070h,0b2h,0fbh,032h,0f8h,0b5h,0bbh,035h,0b8h,08bh,05bh,00bh,058h,0ebh	; 749e  s.p..2...5..[.X.
	defb 0b3h,00bh,0b0h,0cdh,0e9h,00dh,0e8h,0d6h,0ddh,016h,0dch,0d3h,029h,013h,028h,0c1h	; 74ae  ............).(.
	defb 0cbh,001h,0c8h,0f6h,033h,006h,030h,0f0h,0b7h,000h,030h,0ffh,087h,000h,000h,0ffh	; 74be  ....3.0...0.....
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0f8h,03fh,000h,000h,0fbh,08fh,003h,080h,0fbh	; 74ce  ........?.......
	defb 067h,003h,060h,0e0h,077h,000h,070h,0edh,081h,00dh,080h,0ebh,07ch,00bh,07ch,0e2h	; 74de  g.`.w.p.....|.|.
	defb 0eeh,002h,0eeh,0fah,0d6h,002h,0d6h,0e2h,0eeh,002h,0eeh,0ebh,07ch,00bh,07ch,0edh	; 74ee  ............|.|.
	defb 081h,00dh,080h,0e0h,077h,000h,070h,0fbh,067h,003h,060h,0fbh,08fh,003h,080h,0f8h	; 74fe  ....w.p.g.`.....
	defb 03fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0c3h,000h,000h,0f8h	; 750e  ?...............
	defb 05bh,000h,018h,0fbh,019h,003h,018h,0e0h,0e5h,000h,0e4h,0e9h,094h,009h,094h,0ebh	; 751e  [...............
	defb 06eh,00bh,06eh,0e6h,0f4h,006h,0f4h,0f5h,0d9h,005h,0d8h,0c5h,0adh,005h,0ach,0dah	; 752e  n.n.............
	defb 0ddh,01ah,0dch,0d9h,07dh,019h,07ch,0c7h,0b9h,007h,0b8h,0f1h,003h,001h,000h,0fch	; 753e  ....}.|.........
	defb 07fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 754e  ................
	defb 087h,000h,000h,0f0h,0b7h,000h,030h,0f6h,0b7h,006h,030h,084h,010h,004h,010h,0b3h	; 755e  ......0...0.....
	defb 0e6h,033h,0e6h,0b6h,036h,036h,036h,0a5h,0d2h,025h,0d2h,09bh,06ch,01bh,06ch,0dah	; 756e  .3..666..%..l.l.
	defb 0adh,01ah,0ach,0cbh,069h,00bh,068h,0e3h,0e3h,003h,0e0h,0fbh,0efh,003h,0e0h,0f9h	; 757e  ....i.h.........
	defb 0cfh,001h,0c0h,0fch,01fh,000h,000h,0ffh,087h,000h,000h,0c3h,037h,000h,030h,0dah	; 758e  ............7.0.
	defb 077h,018h,070h,098h,0c7h,018h,0c0h,0a7h,01fh,027h,000h,029h,087h,029h,080h,076h	; 759e  w.p......'.).).v
	defb 0d7h,076h,0d0h,02dh,077h,02dh,070h,09ah,0a7h,01ah,0a0h,0bdh,0a3h,03dh,0a0h,0bfh	; 75ae  .v.-w-p......=..
	defb 05bh,03fh,058h,0beh,09bh,03eh,098h,09dh,0e3h,01dh,0e0h,0c0h,08fh,000h,080h,0feh	; 75be  [?X..>..........
	defb 03fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0fch,01fh,000h,000h,0f1h	; 75ce  ?...............
	defb 0dfh,001h,0c0h,0e6h,0dfh,006h,0c0h,0eeh,007h,00eh,000h,081h,0b7h,001h,0b0h,03eh	; 75de  ...............>
	defb 0d7h,03eh,0d0h,07bh,047h,07bh,040h,075h,05fh,075h,040h,07bh,043h,07bh,040h,03eh	; 75ee  .>.{G{@u_u@{C{@>
	defb 0dbh,03eh,0d8h,081h,0bbh,001h,0b8h,0eeh,003h,00eh,000h,0e6h,0dfh,006h,0c0h,0f1h	; 75fe  .>..............
	defb 0dfh,001h,0c0h,0fch,01fh,000h,000h,0ffh,01fh,000h,000h,0e0h,047h,000h,040h,0ceh	; 760e  ............G.@.
	defb 0f1h,00eh,0f0h,0dfh,04dh,01fh,04ch,0dfh,0adh,01fh,0ach,0deh,0d1h,01eh,0d0h,0cdh	; 761e  ....M.L.........
	defb 057h,00dh,050h,096h,0b3h,016h,0b0h,0bbh,069h,03bh,068h,094h,0cch,014h,0cch,0d3h	; 762e  W.P.....i;h.....
	defb 086h,013h,086h,0cch,0d6h,00ch,0c6h,0ech,010h,00ch,000h,0e1h,0ffh,000h,000h,0ffh	; 763e  ................
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0f8h,03fh,000h,000h,0f3h,09fh,003h,080h,0f6h	; 764e  ........?.......
	defb 0dfh,006h,0c0h,0c5h,047h,005h,040h,096h,0d3h,016h,0d0h,0b7h,0dbh,037h,0d8h,037h	; 765e  ....G.@......7.7
	defb 0d9h,037h,0d8h,04bh,0a5h,04bh,0a4h,06ch,06dh,06ch,06ch,067h,0cdh,067h,0cch,008h	; 766e  .7.K.K.lmllg.g..
	defb 021h,008h,020h,0edh,06fh,00ch,060h,0e1h,06fh,000h,060h,0ffh,00fh,000h,000h,0ffh	; 767e  !. .o.`.o.`.....
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0f8h,0ffh,000h,000h,0e2h,007h,002h,000h,08fh	; 768e  ................
	defb 073h,00fh,070h,0b2h,0fbh,032h,0f8h,0b5h,0fbh,035h,0f8h,08bh,07bh,00bh,078h,0eah	; 769e  s.p..2...5..{.x.
	defb 0b3h,00ah,0b0h,0cdh,069h,00dh,068h,096h,0ddh,016h,0dch,033h,029h,033h,028h,061h	; 76ae  ....i.h....3)3(a
	defb 0cbh,061h,0c8h,06bh,033h,063h,030h,008h,037h,000h,030h,0ffh,087h,000h,000h,0ffh	; 76be  .a.k3c0.7.0.....
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0f8h,03fh,000h,000h,0fbh,08fh,003h,080h,0fbh	; 76ce  ........?.......
	defb 067h,003h,060h,0e0h,077h,000h,070h,0edh,081h,00dh,080h,0ebh,07ch,00bh,07ch,0e2h	; 76de  g.`.w.p.....|.|.
	defb 0f6h,002h,0f6h,0fah,0eah,002h,0eah,0c2h,0f6h,002h,0f6h,0dbh,07ch,01bh,07ch,0ddh	; 76ee  ............|.|.
	defb 081h,01dh,080h,0c0h,077h,000h,070h,0fbh,067h,003h,060h,0fbh,08fh,003h,080h,0f8h	; 76fe  ....w.p.g.`.....
	defb 03fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0c3h,000h,000h,084h	; 770e  ?...............
	defb 01bh,000h,018h,0b5h,099h,031h,098h,0b0h,0e5h,030h,0e4h,099h,094h,019h,094h,0cbh	; 771e  .....1...0......
	defb 06eh,00bh,06eh,0e6h,0f4h,006h,0f4h,0f5h,0f9h,005h,0f8h,0c5h,0edh,005h,0ech,0dah	; 772e  n.n.............
	defb 0d5h,01ah,0d4h,0d9h,06dh,019h,06ch,0c7h,0b9h,007h,0b8h,0f1h,003h,001h,000h,0fch	; 773e  ....m.l.........
	defb 07fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,087h,0e1h,000h,000h,0b3h	; 774e  ................
	defb 0cdh,030h,00ch,0abh,0d5h,028h,014h,098h,019h,018h,018h,0c5h,0a3h,005h,0a0h,0f3h	; 775e  .0...(..........
	defb 0cfh,003h,0c0h,0f4h,02fh,004h,020h,0f4h,02fh,004h,020h,0f3h,0cfh,003h,0c0h,0c5h	; 776e  ..../. ./. .....
	defb 0a3h,005h,0a0h,098h,019h,018h,018h,0abh,0d5h,028h,014h,0b3h,0cdh,030h,00ch,087h	; 777e  .........(...0..
	defb 0e1h,000h,000h,0ffh,0ffh,000h,000h,007h,0e0h,000h,000h,073h,0ceh,070h,00eh,04bh	; 778e  ...........s.p.K
	defb 0d2h,048h,012h,04bh,0d2h,048h,012h,038h,01ch,038h,01ch,085h,0a1h,005h,0a0h,0f2h	; 779e  .H.K.H.8.8......
	defb 04fh,002h,040h,0f6h,06fh,006h,060h,0f6h,06fh,006h,060h,0f2h,04fh,002h,040h,085h	; 77ae  O.@.o.`.o.`.O.@.
	defb 0a1h,005h,0a0h,038h,01ch,038h,01ch,04bh,0d2h,048h,012h,04bh,0d2h,048h,012h,073h	; 77be  ...8.8.K.H.K.H.s
	defb 0ceh,070h,00eh,007h,0e0h,000h,000h,0f1h,00fh,000h,000h,0e4h,06fh,004h,060h,0e9h	; 77ce  .p..........o.`.
	defb 083h,009h,080h,087h,0e9h,007h,0e8h,0ach,035h,02ch,034h,0a8h,011h,028h,010h,098h	; 77de  ........5,4..(..
	defb 05bh,018h,058h,0d8h,059h,018h,058h,089h,095h,009h,094h,0ach,035h,02ch,034h,097h	; 77ee  [.X.Y.X.....5,4.
	defb 0e1h,017h,0e0h,0c1h,097h,001h,090h,0f6h,027h,006h,020h,0f0h,08fh,000h,000h,0ffh	; 77fe  ........'. .....
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0f9h,07fh,001h,000h,0c2h,003h,002h,000h,0d1h	; 780e  ................
	defb 09bh,011h,098h,0d7h,0e3h,017h,0e0h,0cch,031h,00ch,030h,0c8h,014h,008h,014h,018h	; 781e  ........1.0.....
	defb 05ah,018h,05ah,058h,058h,058h,058h,029h,093h,029h,090h,08ch,033h,00ch,030h,0c7h	; 782e  Z.ZXXXX).)..3.0.
	defb 0ebh,007h,0e8h,0d9h,08bh,019h,088h,0c0h,043h,000h,040h,0feh,09fh,000h,080h,0feh	; 783e  ........C.@.....
	defb 03fh,000h,000h,0ffh,0ffh,000h,000h,0f0h,0ffh,000h,000h,0c6h,007h,006h,000h,097h	; 784e  ?...............
	defb 0b1h,017h,0b0h,033h,0bch,033h,0bch,06eh,036h,06eh,036h,05fh,0d8h,05fh,0d8h,016h	; 785e  ...3.3.n6n6_._..
	defb 06ch,016h,06ch,0b5h,0eah,035h,0eah,0bbh,0deh,03bh,0deh,095h,0fah,015h,0fah,097h	; 786e  l.l..5...;......
	defb 044h,017h,044h,0b8h,0f9h,038h,0f8h,0bdh,06bh,03dh,068h,09bh,033h,01bh,030h,0c6h	; 787e  D.D..8..k=h.3.0.
	defb 007h,006h,000h,0f0h,0ffh,000h,000h,0f0h,01fh,000h,000h,0e7h,043h,007h,040h,08ch	; 788e  ............C.@.
	defb 0fbh,00ch,0f8h,02bh,068h,02bh,068h,07bh,076h,07bh,076h,07fh,0b6h,07fh,0b6h,04fh	; 789e  ...+h+h{v{v....O
	defb 0f6h,04fh,0f6h,03dh,0eeh,03dh,0eeh,09bh,0fch,01bh,0fch,0b6h,0eeh,036h,0eeh,097h	; 78ae  .O.=.=.......6..
	defb 01ch,017h,01ch,0dbh,0edh,01bh,0ech,0d5h,0f1h,015h,0f0h,0cfh,077h,00fh,070h,0e7h	; 78be  ............w.p.
	defb 007h,007h,000h,0f0h,07fh,000h,000h,0feh,03fh,000h,000h,086h,0bfh,000h,080h,0b6h	; 78ce  ........?.......
	defb 03fh,030h,000h,086h,018h,000h,000h,0f0h,0c2h,000h,0c2h,0f7h,0d0h,007h,0d0h,0e2h	; 78de  ?0..............
	defb 0b9h,002h,0b8h,0edh,0ddh,00dh,0dch,0edh,0d5h,00dh,0d4h,0e7h,0f9h,007h,0f8h,0f7h	; 78ee  ................
	defb 063h,007h,060h,081h,077h,001h,070h,0abh,0a7h,023h,0a0h,089h,087h,001h,080h,0fch	; 78fe  c.`.w.p..#......
	defb 017h,000h,010h,0ffh,0c7h,000h,000h,0dfh,0ffh,000h,000h,0afh,0e3h,020h,000h,0dch	; 790e  ............. ..
	defb 06bh,000h,008h,0c5h,063h,001h,000h,0d4h,03fh,010h,000h,0c1h,09bh,001h,080h,0fah	; 791e  k...c...?.......
	defb 0d5h,002h,0c4h,0bbh,095h,003h,084h,059h,0dbh,041h,0c0h,040h,018h,040h,000h,0abh	; 792e  .......Y.A.@.@..
	defb 08ah,008h,002h,0e3h,0a8h,000h,020h,0ffh,08fh,000h,000h,0f9h,0ffh,000h,000h,0f6h	; 793e  ...... .........
	defb 0ffh,006h,000h,0f9h,0ffh,000h,000h,0f8h,03fh,000h,000h,0f3h,09fh,003h,080h,0f7h	; 794e  ........?.......
	defb 0dfh,007h,0c0h,0c7h,0c7h,007h,0c0h,094h,053h,014h,050h,0b4h,05bh,034h,058h,02bh	; 795e  ........S.P.[4X+
	defb 0a9h,02bh,0a8h,044h,045h,044h,044h,047h,0c5h,047h,0c4h,04bh,0a5h,04bh,0a4h,00ch	; 796e  .+.DEDDG.G.K.K..
	defb 061h,00ch,060h,0c9h,027h,008h,020h,093h,093h,010h,010h,0b7h,0dbh,030h,018h,0b7h	; 797e  a.`.'. ......0..
	defb 0dbh,030h,018h,087h,0c3h,000h,000h,01ch,038h,000h,000h,049h,092h,041h,082h,06bh	; 798e  .0......8..I.A.k
	defb 0d6h,063h,0c6h,022h,044h,022h,044h,092h,049h,012h,048h,0cdh,0b3h,00dh,0b0h,0e6h	; 799e  .c."D"D.I.H.....
	defb 067h,006h,060h,0f3h,0cfh,003h,0c0h,0f3h,0cfh,003h,0c0h,0e5h,0a7h,005h,0a0h,00eh	; 79ae  g.`.............
	defb 070h,00eh,070h,068h,016h,068h,016h,073h,0ceh,070h,00eh,037h,0ech,030h,00ch,097h	; 79be  p.ph.h.s.p.7.0..
	defb 0e9h,010h,008h,0c7h,0e3h,000h,000h,0ffh,0ffh,000h,000h,0fch,03fh,000h,000h,0f9h	; 79ce  ............?...
	defb 09fh,001h,080h,0fah,05fh,002h,040h,082h,041h,002h,040h,0b1h,08dh,031h,08ch,08eh	; 79de  ...._.@.A.@..1..
	defb 071h,00eh,070h,0e3h,0c7h,003h,0c0h,0f9h,09fh,001h,080h,0f2h,04fh,002h,040h,0c4h	; 79ee  q.p.........O.@.
	defb 023h,004h,020h,0d9h,09bh,018h,018h,0cbh,0d3h,008h,010h,0e3h,0c7h,000h,000h,0ffh	; 79fe  #. .............
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0fch	; 7a0e  ................
	defb 03fh,000h,000h,0fdh,0bfh,001h,080h,0f9h,09fh,001h,080h,0f2h,04fh,002h,040h,0e5h	; 7a1e  ?...........O.@.
	defb 0afh,005h,0a0h,0e9h,08fh,009h,080h,0e2h,05fh,002h,040h,0f2h,04fh,002h,040h,0f4h	; 7a2e  ........_.@.O.@.
	defb 02fh,004h,020h,0f1h,08fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 7a3e  /. .............
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 7a4e  ................
	defb 0ffh,000h,000h,0fch,07fh,000h,000h,0f1h,01fh,001h,000h,0f7h,0dfh,007h,0c0h,0f1h	; 7a5e  ................
	defb 01fh,001h,000h,0f2h,09fh,002h,080h,0f4h,05fh,004h,040h,0f1h,01fh,000h,000h,0ffh	; 7a6e  ........_.@.....
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 7a7e  ................
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 7a8e  ................
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0fch,07fh,000h,000h,0fdh	; 7a9e  ................
	defb 07fh,001h,000h,0fch,07fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 7aae  ................
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 7abe  ................
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 7ace  ................
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 7ade  ................
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 7aee  ................
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 7afe  ................
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 7b0e  ................
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 7b1e  ................
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 7b2e  ................
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 7b3e  ................
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 7b4e  ................
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0fch,07fh,000h,000h,0fdh	; 7b5e  ................
	defb 07fh,001h,000h,0fch,07fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 7b6e  ................
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 7b7e  ................
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 7b8e  ................
	defb 0ffh,000h,000h,0fch,07fh,000h,000h,0f1h,03fh,001h,000h,0f6h,0bfh,006h,080h,0e3h	; 7b9e  ........?.......
	defb 0bfh,003h,080h,0edh,0bfh,00dh,080h,0e6h,03fh,006h,000h,0f0h,0ffh,000h,000h,0ffh	; 7bae  ........?.......
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 7bbe  ................
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0fch	; 7bce  ................
	defb 03fh,000h,000h,0f1h,08fh,001h,080h,0e7h,0efh,007h,0e0h,0eah,0e7h,00ah,0e0h,0edh	; 7bde  ?...............
	defb 077h,00dh,070h,0e6h,067h,006h,060h,0f5h,0d7h,005h,0d0h,0f7h,067h,007h,060h,0f1h	; 7bee  w.p.g.`.....g.`.
	defb 0cfh,001h,0c0h,0fch,01fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 7bfe  ................
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 7c0e  ................
	defb 0ffh,000h,000h,0ffh,08fh,000h,000h,0e0h,02fh,000h,020h,0e9h,00fh,009h,000h,0e2h	; 7c1e  ......../. .....
	defb 0bfh,002h,080h,0f8h,03fh,000h,000h,0f1h,01fh,000h,000h,0c5h,05fh,004h,040h,0d1h	; 7c2e  ....?......._.@.
	defb 01fh,010h,000h,0c7h,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; 7c3e  ................
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0fch	; 7c4e  ................
	defb 03fh,000h,000h,0f9h,087h,001h,080h,0f3h,0b3h,003h,0b0h,0e7h,0bbh,007h,0b8h,0efh	; 7c5e  ?...............
	defb 06bh,00fh,068h,0ebh,0f3h,00bh,0f0h,0e6h,0d7h,006h	; 7c6e  k.h.......

; ======================================================================
; CODIGO 0x7c78..0x7c9d  (37 bytes)
; ======================================================================


L_7C78:
	ret nc			;7c78
	rst 20h			;7c79
	and a			;7c7a
	rlca			;7c7b
	and b			;7c7c
	xor 0efh		;7c7d
	ld c,0e0h		;7c7f
	push hl			;7c81
	rst 28h			;7c82
	dec b			;7c83
	ret po			;7c84
	ret p			;7c85
	adc a,a			;7c86
	nop			;7c87
	add a,b			;7c88
	cp 03fh			;7c89
	nop			;7c8b
	nop			;7c8c
	rst 38h			;7c8d
	rst 38h			;7c8e
	nop			;7c8f
	nop			;7c90
	rst 38h			;7c91
	rst 38h			;7c92
	nop			;7c93
	nop			;7c94
	call m,0001fh		;7c95
	nop			;7c98
	pop bc			;7c99
	jp L_C001		;7c9a

; ----------------------------------------------------------------------
; DATOS graficos: (3547 B; racha 3.25, entropia 5.40, 231 valores: rachas mas largas que el azar)
;   0x7c9d..0x8a78  (3547 bytes)
; ----------------------------------------------------------------------
	defb 09bh,0b9h,01bh,0b8h,0bbh,05dh,03bh,05ch,03fh,0ddh,03fh,0dch,07dh,0f8h,07dh,0f8h	; 7c9d  .....];\?.?.}.}.
	defb 054h,03ah,054h,03ah,021h,0a2h,020h,022h,078h,038h,078h,038h,03ah,0ddh,03ah,0dch	; 7cad  T:T:!. "x8x8:.:.
	defb 0bfh,07dh,03fh,07ch,091h,0b9h,011h,0b8h,0c7h,0b3h,007h,0b0h,0f7h,0c7h,007h,0c0h	; 7cbd  .}?|............
	defb 0f1h,0dfh,001h,0c0h,0fch,01fh,000h,000h,0f8h,03fh,000h,000h,0f3h,08fh,003h,080h	; 7ccd  .........?......
	defb 0c5h,0e1h,005h,0e0h,0dfh,074h,01fh,074h,018h,0feh,018h,0feh,07eh,02eh,07eh,02eh	; 7cdd  .....t.t....~.~.
	defb 070h,09ah,070h,01ah,07bh,090h,078h,010h,06bh,0bdh,068h,03ch,018h,01dh,018h,01ch	; 7ced  p.p.{.x.k.h<....
	defb 0dfh,069h,01fh,068h,0cbh,0e3h,00bh,0e0h,0eeh,0efh,00eh,0e0h,0e1h,0cfh,001h,0c0h	; 7cfd  .i.h............
	defb 0fch,0dfh,000h,0c0h,0feh,01fh,000h,000h,0ffh,0ffh,000h,000h,0c4h,03fh,000h,000h	; 7d0d  .............?..
	defb 0d5h,09fh,011h,080h,0c4h,0c3h,000h,0c0h,0e2h,00bh,000h,008h,089h,098h,008h,018h	; 7d1d  ................
	defb 0bdh,0beh,03ch,03eh,095h,094h,014h,014h,0d9h,0c1h,018h,000h,0c0h,07fh,000h,000h	; 7d2d  ..<>............
	defb 013h,047h,003h,000h,046h,013h,046h,010h,008h,05bh,008h,058h,0e5h,06bh,004h,068h	; 7d3d  .G..F.F..[.X.k.h
	defb 0f1h,013h,000h,010h,0ffh,0c7h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 7d4d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 7d5d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 7d6d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 7d7d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,040h,000h,000h,000h,000h,000h,000h,000h	; 7d8d  ........@.......
	defb 000h,000h,000h,000h,000h,000h,000h,040h,000h,000h,000h,000h,000h,000h,000h,000h	; 7d9d  .......@........
	defb 000h,000h,000h,000h,000h,040h,000h,000h,000h,000h,000h,040h,000h,000h,000h,040h	; 7dad  .....@.....@...@
	defb 000h,020h,000h,040h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,040h	; 7dbd  . .@...........@
	defb 020h,090h,008h,042h,021h,094h,001h,0ceh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h	; 7dcd   ..B!...........
	defb 0ffh,000h,0ffh,000h,0e3h,003h,0c7h,0c0h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 7ddd  ................
	defb 0ffh,000h,0ffh,000h,08fh,00fh,0f1h,0f0h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 7ded  ................
	defb 0ffh,000h,0ffh,000h,03fh,03fh,0fch,0fch,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 7dfd  ....??..........
	defb 0ffh,000h,0fch,000h,07fh,07fh,0feh,0feh,03fh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 7e0d  ........?.......
	defb 0ffh,000h,0f9h,001h,0ffh,0ffh,0ffh,0ffh,09fh,080h,0ffh,000h,0ffh,000h,0ffh,000h	; 7e1d  ................
	defb 0feh,000h,033h,003h,0ffh,0ffh,0ffh,0ffh,0cch,0c0h,07fh,000h,0ffh,000h,0ffh,000h	; 7e2d  ..3.............
	defb 0fch,000h,087h,087h,0f8h,0f8h,03fh,03fh,0e1h,0e1h,03fh,000h,0ffh,000h,0ffh,000h	; 7e3d  ......??..?.....
	defb 0fdh,001h,04fh,04fh,0a3h,0a3h,0cfh,0cfh,0f2h,0f2h,0bfh,080h,0ffh,000h,0ffh,000h	; 7e4d  ..OO............
	defb 0fdh,001h,05fh,05fh,04fh,04fh,0f7h,0f7h,0fah,0fah,0bfh,080h,0ffh,000h,0ffh,000h	; 7e5d  ..__OO..........
	defb 0fdh,001h,0deh,0deh,097h,097h,0ebh,0ebh,0fbh,0fbh,0bfh,080h,0ffh,000h,0ffh,000h	; 7e6d  ................
	defb 0fdh,001h,0bdh,0bdh,032h,032h,05dh,05dh,0f5h,0f5h,0bfh,080h,0ffh,000h,0ffh,000h	; 7e7d  ....22]]........
	defb 0fch,000h,0bah,0bah,069h,069h,09eh,09eh,0f9h,0f9h,03fh,000h,0ffh,000h,0ffh,000h	; 7e8d  ....ii....?.....
	defb 0f8h,000h,0b4h,0b4h,0d6h,0d6h,06fh,06fh,075h,075h,01fh,000h,0ffh,000h,0ffh,000h	; 7e9d  ......oouu......
	defb 0f2h,002h,0b8h,0b8h,0e8h,0e8h,017h,017h,079h,079h,04fh,040h,0ffh,000h,0ffh,000h	; 7ead  ........yyO@....
	defb 0f6h,006h,0b5h,0b5h,0c8h,0c8h,017h,017h,0b5h,0b5h,06fh,060h,0ffh,000h,0ffh,000h	; 7ebd  ..........o`....
	defb 0e4h,004h,0a9h,0a9h,090h,090h,08bh,08bh,0b9h,0b9h,067h,060h,0ffh,000h,0ffh,000h	; 7ecd  ..........g`....
	defb 0cah,00ah,0b3h,0b3h,020h,020h,045h,045h,0ddh,0ddh,073h,070h,0ffh,000h,0ffh,000h	; 7edd  ....  EE..sp....
	defb 0dch,01ch,0aah,0aah,0a0h,0a0h,065h,065h,0d9h,0d9h,07bh,078h,0ffh,000h,0ffh,000h	; 7eed  ......ee..{x....
	defb 09ah,01ah,0b3h,0b3h,040h,040h,022h,022h,0edh,0edh,079h,078h,0ffh,000h,0ffh,000h	; 7efd  ....@@""..yx....
	defb 0bch,03ch,0a6h,0a6h,040h,040h,032h,032h,0e9h,0e9h,07dh,07ch,0ffh,000h,0ffh,000h	; 7f0d  .<..@@22..}|....
	defb 03ah,03ah,035h,035h,040h,040h,032h,032h,0ech,0ech,07ch,07ch,0ffh,000h,0ffh,000h	; 7f1d  ::55@@22..||....
	defb 06dh,06dh,0c6h,0c6h,080h,080h,011h,011h,00bh,00bh,0b6h,0b6h,0ffh,000h,0feh,000h	; 7f2d  mm..............
	defb 069h,069h,0d6h,0d6h,080h,080h,019h,019h,06bh,06bh,0b6h,0b6h,07fh,000h,0feh,000h	; 7f3d  ii......kk......
	defb 0cch,0cch,006h,006h,080h,080h,019h,019h,068h,068h,037h,037h,07fh,000h,0fch,000h	; 7f4d  ........hh77....
	defb 0e9h,0e9h,0d4h,0d4h,080h,080h,019h,019h,06ah,06ah,0d7h,0d7h,03fh,000h,0f9h,001h	; 7f5d  ........jj..?...
	defb 0c2h,0c2h,0eeh,0eeh,080h,080h,019h,019h,075h,075h,0c7h,0c7h,09fh,080h,0fbh,003h	; 7f6d  ........uu......
	defb 0e9h,0e9h,0ech,0ech,080h,080h,019h,019h,073h,073h,0d7h,0d7h,0dfh,0c0h,0f3h,003h	; 7f7d  ........ss......
	defb 0e2h,0e2h,0dah,0dah,080h,080h,011h,011h,079h,079h,0cfh,0cfh,0cfh,0c0h,0f7h,007h	; 7f8d  ........yy......
	defb 0f9h,0f9h,0ach,0ach,080h,080h,031h,031h,075h,075h,09fh,09fh,0efh,0e0h,0f7h,007h	; 7f9d  ......11uu......
	defb 0a1h,0a1h,04eh,04eh,080h,080h,061h,061h,072h,072h,08fh,08fh,0efh,0e0h,0e7h,007h	; 7fad  ..NN..aarr......
	defb 056h,056h,0ach,0ach,080h,080h,0c1h,0c1h,075h,075h,06fh,06fh,0e7h,0e0h,0eeh,00eh	; 7fbd  VV......uuoo....
	defb 083h,083h,06eh,06eh,040h,040h,002h,002h,076h,076h,0c7h,0c7h,0f7h,0f0h,0cfh,00fh	; 7fcd  ..nn@@..vv......
	defb 01dh,01dh,09dh,09dh,030h,030h,00ch,00ch,0b9h,0b9h,0bbh,0bbh,0f3h,0f0h,0deh,01eh	; 7fdd  ....00..........
	defb 03eh,03eh,053h,053h,08fh,08fh,0f1h,0f1h,0cah,0cah,07dh,07dh,0fbh,0f8h,0ddh,01dh	; 7fed  >>SS......}}....
	defb 03eh,03eh,0cfh,0cfh,0f0h,0f0h,00fh,00fh,0f3h,0f3h,07dh,07dh,0fbh,0f8h,09eh,01eh	; 7ffd  >>........}}....
	defb 09dh,09dh,0b7h,0b7h,0ffh,0ffh,0ffh,0ffh,0edh,0edh,09bh,09bh,0f9h,0f8h,0bdh,03dh	; 800d  ...............=
	defb 01ch,01ch,00bh,00bh,0f8h,0f8h,01fh,01fh,0d0h,0d0h,03bh,03bh,0fdh,0fch,0beh,03eh	; 801d  ..........;;...>
	defb 02ah,02ah,0adh,0adh,0e3h,0e3h,0c7h,0c7h,0b5h,0b5h,05dh,05dh,0fdh,0fch,0bch,03ch	; 802d  **........]]...<
	defb 05ch,05ch,0aeh,0aeh,0d4h,0d4h,02bh,02bh,075h,075h,03eh,03eh,0fdh,0fch,03ah,03ah	; 803d  \\....++uu>>..::
	defb 02ch,02ch,0aeh,0aeh,0b3h,0b3h,0cdh,0cdh,075h,075h,01eh,01eh,0fch,0fch,074h,074h	; 804d  ,,......uu....tt
	defb 01ch,01ch,0adh,0adh,06ch,06ch,036h,036h,0b5h,0b5h,038h,038h,07eh,07eh,07ah,07ah	; 805d  ....ll66..88~~zz
	defb 06eh,06eh,0adh,0adh,01ah,01ah,058h,058h,0b5h,0b5h,056h,056h,0feh,0feh,075h,075h	; 806d  nn....XX..VV..uu
	defb 02fh,02fh,00eh,00eh,0d5h,0d5h,0abh,0abh,070h,070h,0b5h,0b5h,0feh,0feh,078h,078h	; 807d  //......pp....xx
	defb 01fh,01fh,05eh,05eh,0abh,0abh,0d5h,0d5h,07ah,07ah,078h,078h,07eh,07eh,074h,074h	; 808d  ..^^....zzxx~~tt
	defb 0bfh,0bfh,066h,066h,088h,088h,015h,015h,064h,064h,0bfh,0bfh,07eh,07eh,07ah,07ah	; 809d  ..ff....dd..~~zz
	defb 000h,000h,0dah,0dah,0abh,0abh,0d5h,0d5h,05ah,05ah,000h,000h,0feh,0feh,0f4h,0f4h	; 80ad  ........ZZ......
	defb 0bfh,0bfh,05ah,05ah,08ch,08ch,035h,035h,058h,058h,0bfh,0bfh,07fh,07fh,0fah,0fah	; 80bd  ..ZZ..55XX......
	defb 05eh,05eh,0e5h,0e5h,093h,093h,0c9h,0c9h,0a2h,0a2h,05eh,05eh,0ffh,0ffh,01dh,01dh	; 80cd  ^^........^^....
	defb 001h,001h,0fdh,0fdh,055h,055h,0aah,0aah,0bdh,0bdh,001h,001h,0f8h,0f8h,0a2h,0a2h	; 80dd  ....UU..........
	defb 05eh,05eh,0fbh,0fbh,02ah,02ah,056h,056h,0dah,0dah,05eh,05eh,0c7h,0c7h,0d4h,0d4h	; 80ed  ^^..**VV..^^....
	defb 081h,081h,0fah,0fah,0cah,0cah,0b5h,0b5h,05dh,05dh,001h,001h,03fh,03fh,0eah,0eah	; 80fd  ........]]..??..
	defb 05eh,05eh,0fah,0fah,06ah,06ah,056h,056h,05ah,05ah,07eh,07eh,0ffh,0ffh,0d0h,0d0h	; 810d  ^^..jjVVZZ~~....
	defb 03fh,03fh,03ah,03ah,0cah,0cah,0b5h,0b5h,05ch,05ch,0beh,0beh,01fh,01fh,0e3h,0e3h	; 811d  ??::....\\......
	defb 000h,000h,0c2h,0c2h,065h,065h,04eh,04eh,042h,042h,000h,000h,0dfh,0dfh,0d3h,0d3h	; 812d  ....eeNNBB......
	defb 03fh,03fh,07bh,07bh,033h,033h,08ch,08ch,0d4h,0d4h,0beh,0beh,0dfh,0dfh,0e8h,0e8h	; 813d  ??{{33..........
	defb 05fh,05fh,075h,075h,058h,058h,03ah,03ah,0a8h,0a8h,07eh,07eh,03fh,03fh,074h,074h	; 814d  __uuXX::..~~??tt
	defb 0bfh,0bfh,075h,075h,0adh,0adh,0b5h,0b5h,0ach,0ach,0bfh,0bfh,07eh,07eh,03ah,03ah	; 815d  ..uu........~~::
	defb 000h,000h,0fah,0fah,0c3h,0c3h,0c3h,0c3h,05ah,05ah,000h,000h,0fch,0fch,084h,004h	; 816d  ........ZZ......
	defb 0bfh,0bfh,07fh,07fh,07fh,07fh,0feh,0feh,0fch,0fch,0bfh,0bfh,061h,060h,0f0h,000h	; 817d  ............a`..
	defb 07fh,07fh,000h,000h,00fh,00fh,0f0h,0f0h,000h,000h,07fh,07fh,00fh,000h,0f9h,001h	; 818d  ................
	defb 0bfh,0bfh,09fh,080h,0e0h,000h,007h,000h,0f9h,001h,0bfh,0bfh,09fh,080h,0f3h,003h	; 819d  ................
	defb 05fh,05fh,0cfh,0c0h,0ffh,000h,0ffh,000h,0f3h,003h,05fh,05fh,0cfh,0c0h,0f6h,006h	; 81ad  __........__....
	defb 000h,000h,06fh,060h,0ffh,000h,0ffh,000h,0f6h,006h,000h,000h,06fh,060h,0f1h,001h	; 81bd  ..o`........o`..
	defb 0ffh,0ffh,08fh,080h,0ffh,000h,0ffh,000h,0f1h,001h,0ffh,0ffh,08fh,080h,0efh,000h	; 81cd  ................
	defb 0ffh,03ah,0bdh,098h,0efh,011h,0ffh,040h,0fbh,08ah,0ffh,020h,0bfh,048h,0fdh,002h	; 81dd  .:.....@... .H..
	defb 0ffh,020h,0efh,008h,0ffh,000h,0efh,000h,0ffh,09ch,0bdh,03ah,0efh,058h,0ffh,009h	; 81ed  . .........:.X..
	defb 0fbh,010h,0ffh,092h,0bfh,004h,0fdh,015h,0ffh,040h,0efh,000h,0ffh,000h,0bdh,03ch	; 81fd  .........@.....<
	defb 042h,042h,095h,095h,0afh,0afh,09dh,09dh,0bfh,0bfh,056h,056h,0bdh,03ch,0ffh,000h	; 820d  BB........VV.<..
	defb 0ffh,000h,0c3h,000h,0dbh,018h,0dbh,018h,0c3h,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 821d  ................
	defb 0c3h,000h,099h,018h,0bdh,03ch,0bdh,03ch,099h,018h,0c3h,000h,0ffh,000h,039h,038h	; 822d  .....<.<......98
	defb 07ch,07ch,0feh,0feh,0feh,0feh,0feh,0feh,07ch,07ch,039h,038h,083h,000h,0ffh,000h	; 823d  ||......||98....
	defb 0c3h,000h,018h,018h,07eh,07eh,0dbh,0dbh,024h,024h,081h,000h,0ffh,000h,0ffh,000h	; 824d  ....~~..$$......
	defb 083h,000h,038h,038h,07fh,07fh,054h,054h,0c1h,0c0h,01fh,000h,0ffh,000h,0ffh,000h	; 825d  ..88..TT........
	defb 0c1h,000h,01ch,01ch,0feh,0feh,02ah,02ah,083h,003h,0f8h,000h,0ffh,000h,0e0h,000h	; 826d  ......**........
	defb 08eh,00eh,0bch,03ch,03ah,03ah,070h,070h,067h,060h,057h,050h,007h,000h,0c5h,004h	; 827d  ...<::ppg`WP....
	defb 09dh,01ch,0b1h,030h,0bbh,038h,0b3h,030h,09bh,018h,0d3h,010h,0d7h,010h,0cbh,008h	; 828d  ...0.8.0........
	defb 0d9h,018h,095h,014h,0b9h,038h,0b9h,038h,095h,014h,0d9h,018h,0cbh,008h,0cdh,00ch	; 829d  .....8.8........
	defb 0dch,01ch,09ah,01ah,0ach,02ch,0ach,02ch,09ah,01ah,0dch,01ch,0cdh,00ch,0cdh,00ch	; 82ad  .....,.,........
	defb 09ch,01ch,03ah,03ah,05ch,05ch,04ch,04ch,03ah,03ah,09ch,01ch,0cdh,00ch,0ceh,00eh	; 82bd  ..::\\LL::......
	defb 09eh,01eh,035h,035h,05eh,05eh,04eh,04eh,035h,035h,09eh,01eh,0ceh,00eh,09eh,01eh	; 82cd  ..55^^NN55......
	defb 02eh,02eh,07dh,07dh,0beh,0beh,08eh,08eh,07dh,07dh,02eh,02eh,09eh,01eh,0e0h,000h	; 82dd  ..}}....}}......
	defb 08eh,00eh,03fh,03fh,0ceh,0ceh,0ffh,0ffh,03eh,03eh,08eh,00eh,0e0h,000h,0ffh,000h	; 82ed  ..??....>>......
	defb 0c0h,000h,01eh,01eh,06fh,06fh,0feh,0feh,03eh,03eh,08eh,00eh,0e0h,000h,0ffh,000h	; 82fd  ....oo..>>......
	defb 0ffh,000h,0c0h,000h,0a7h,027h,03fh,03fh,0ffh,0ffh,01eh,01eh,0c0h,000h,000h,000h	; 830d  .....'??........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 831d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 832d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 833d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 834d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 835d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 836d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 837d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 838d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 839d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 83ad  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 83bd  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 83cd  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 83dd  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 83ed  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,02ah,02ah	; 83fd  ..............**
	defb 02ah,02ah,02ah,02ah,000h,000h,000h,000h,000h,000h,00dh,025h,01bh,004h,004h,01ah	; 840d  ****.......%....
	defb 00fh,027h,01eh,00ch,003h,01fh,000h,000h,000h,00eh,000h,000h,000h,000h,005h,00bh	; 841d  .'..............
	defb 006h,000h,020h,00dh,009h,013h,002h,000h,02ch,000h,007h,003h,008h,000h,026h,000h	; 842d  .. .....,.....&.
	defb 000h,000h,000h,000h,00eh,000h,000h,005h,004h,006h,022h,02bh,00dh,009h,013h,00ah	; 843d  .........."+....
	defb 000h,000h,000h,007h,00ch,008h,000h,000h,000h,000h,02ch,000h,000h,000h,000h,000h	; 844d  ..........,.....
	defb 00eh,000h,000h,005h,01ah,00dh,023h,000h,000h,001h,002h,000h,000h,000h,000h,001h	; 845d  ......#.........
	defb 002h,000h,000h,000h,004h,017h,00ah,02bh,00dh,021h,003h,015h,002h,000h,000h,00eh	; 846d  .......+.!......
	defb 000h,001h,00ah,00dh,025h,023h,00dh,01eh,01ch,000h,00eh,000h,000h,000h,024h,02bh	; 847d  ....%#........$+
	defb 023h,000h,000h,000h,00eh,000h,000h,000h,02bh,025h,027h,00dh,021h,000h,000h,02ch	; 848d  #.......+%'.!..,
	defb 000h,000h,00eh,000h,000h,00eh,000h,000h,024h,00dh,000h,022h,025h,02bh,026h,000h	; 849d  ........$.."%+&.
	defb 000h,000h,02ch,000h,00eh,000h,000h,000h,00eh,000h,02ch,000h,020h,00dh,023h,000h	; 84ad  ..,.......,. .#.
	defb 018h,004h,00eh,000h,000h,000h,007h,015h,026h,000h,000h,000h,000h,001h,012h,000h	; 84bd  ........&.......
	defb 000h,005h,004h,017h,000h,000h,000h,001h,013h,014h,000h,00fh,00dh,009h,013h,002h	; 84cd  ................
	defb 000h,000h,000h,001h,014h,008h,006h,000h,005h,017h,002h,000h,016h,004h,017h,013h	; 84dd  ................
	defb 002h,000h,003h,003h,003h,015h,00ah,00dh,000h,000h,000h,001h,002h,000h,005h,01ah	; 84ed  ................
	defb 02bh,01eh,008h,000h,001h,002h,000h,000h,000h,000h,017h,002h,000h,000h,00fh,021h	; 84fd  +..............!
	defb 015h,00ah,010h,000h,000h,00eh,001h,002h,000h,000h,005h,00bh,017h,016h,006h,000h	; 850d  ................
	defb 019h,003h,014h,003h,008h,000h,00eh,000h,01ch,000h,000h,000h,022h,01bh,02ch,000h	; 851d  ............".,.
	defb 000h,000h,000h,001h,018h,006h,000h,005h,004h,017h,019h,01fh,02bh,01eh,003h,015h	; 852d  ............+...
	defb 01dh,000h,000h,000h,000h,001h,01ch,000h,005h,006h,000h,001h,00eh,000h,001h,016h	; 853d  ................
	defb 004h,017h,022h,00dh,01eh,015h,013h,014h,000h,000h,000h,001h,014h,008h,000h,011h	; 854d  ..".............
	defb 000h,001h,002h,000h,000h,024h,00dh,009h,002h,000h,000h,012h,000h,019h,008h,000h	; 855d  .....$..........
	defb 000h,000h,000h,00eh,000h,000h,000h,000h,005h,01dh,000h,000h,000h,000h,001h,002h	; 856d  ................
	defb 000h,000h,005h,004h,017h,00ah,02bh,01bh,007h,003h,00ch,01fh,00dh,01eh,000h,000h	; 857d  ......+.........
	defb 02ch,000h,000h,000h,000h,005h,00bh,004h,006h,000h,000h,019h,003h,015h,002h,000h	; 858d  ,...............
	defb 000h,02ch,000h,001h,00ah,00dh,020h,023h,000h,007h,01ch,000h,00eh,000h,000h,000h	; 859d  .,.... #........
	defb 02ch,000h,018h,006h,000h,000h,018h,004h,017h,016h,004h,01ah,01eh,003h,015h,013h	; 85ad  ,...............
	defb 013h,002h,000h,000h,007h,00ch,003h,01fh,025h,02bh,000h,00eh,028h,029h,00eh,000h	; 85bd  ........%+..()..
	defb 000h,02ch,028h,029h,02ch,000h,000h,00eh,028h,029h,00eh,000h,000h,000h,000h,000h	; 85cd  .,(),...()......
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 85dd  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 85ed  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 85fd  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 860d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 861d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 862d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 863d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 864d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 865d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 866d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 867d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 868d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 869d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 86ad  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 86bd  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 86cd  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 86dd  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 86ed  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 86fd  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 870d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 871d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 872d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 873d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 874d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 875d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 876d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 877d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 878d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 879d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 87ad  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 87bd  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 87cd  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 87dd  ................
	defb 000h,000h,000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0beh,0aah,0beh,0aah,07dh,055h	; 87ed  ..............}U
	defb 07dh,055h,0fch,0aah,0fch,0aah,0fch,055h,0fch,055h,0fch,02bh,0fch,02bh,0fch,02bh	; 87fd  }U.....U.U.+.+.+
	defb 0fch,02bh,0fch,033h,0fch,033h,0fch,033h,0fch,033h,0fch,02bh,0fch,02bh,0fch,02bh	; 880d  .+.3.3.3.3.+.+.+
	defb 0fch,02bh,0fch,055h,0fch,055h,0fch,0aah,0fch,0aah,07dh,055h,07dh,055h,0beh,0aah	; 881d  .+.U.U....}U}U..
	defb 0beh,0aah,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0beh,0aah,0beh,0aah,07dh,055h	; 882d  ..............}U
	defb 07dh,055h,0fch,0aah,0fch,0aah,0fch,055h,0fch,055h,0fch,02bh,0fch,02bh,0fch,02bh	; 883d  }U.....U.U.+.+.+
	defb 0fch,02bh,0fch,033h,0fch,033h,0fch,033h,0fch,033h,0fch,02bh,0fch,02bh,0fch,02bh	; 884d  .+.3.3.3.3.+.+.+
	defb 0fch,02bh,0fch,055h,0fch,055h,0fch,0aah,0fch,0aah,07dh,055h,07dh,055h,0beh,0aah	; 885d  .+.U.U....}U}U..
	defb 0beh,0aah,0ffh,0ffh,0ffh,0ffh,015h,054h,055h,055h,00fh,0feh,02ah,0aah,017h,0fch	; 886d  .......TUU..*...
	defb 050h,041h,00eh,0aeh,02ah,0aah,017h,0fch,050h,041h,00eh,0aeh,02ah,0aah,017h,0fch	; 887d  PA..*...PA..*...
	defb 050h,041h,00eh,0aeh,02ah,0aah,017h,0fch,050h,041h,00eh,0aeh,02ah,0aah,017h,0fch	; 888d  PA..*...PA..*...
	defb 050h,041h,00eh,0aeh,02ah,0aah,017h,0fdh,015h,055h,00eh,0aeh,08fh,0ffh,017h,0fdh	; 889d  PA..*....U......
	defb 05bh,0ffh,00eh,0aeh,0aah,0aah,017h,0fdh,053h,055h,00eh,0aeh,0aah,0aah,017h,0fdh	; 88ad  [.......SU......
	defb 053h,054h,00eh,0aeh,0aah,0a8h,017h,0fdh,053h,051h,00fh,0feh,0aah,0a2h,015h,055h	; 88bd  ST......SQ.....U
	defb 053h,045h,00ah,0aah,0aah,0a2h,015h,055h,053h,045h,00ah,0aah,0aah,0a2h,015h,055h	; 88cd  SE.....USE.....U
	defb 002h,005h,00ah,0aah,000h,00ah,015h,054h,055h,055h,00ah,0aah,02ah,0aah,015h,054h	; 88dd  .......TUU..*..T
	defb 055h,055h,00ah,0aah,02ah,0aah,055h,057h,055h,057h,0aah,0abh,0aah,0afh,055h,057h	; 88ed  UU..*.UWUW....UW
	defb 055h,057h,0aah,0abh,0aah,0afh,055h,057h,055h,057h,0aah,0abh,0aah,0afh,057h,0ffh	; 88fd  UW....UWUW....W.
	defb 055h,057h,0afh,0feh,0a8h,02fh,057h,055h,055h,057h,0aeh,0aah,0a8h,02fh,057h,055h	; 890d  UW.../WUUW.../WU
	defb 055h,057h,0aeh,0aah,0a8h,02fh,057h,055h,055h,057h,0feh,080h,000h,02fh,0fdh,055h	; 891d  UW.../WUUW.../.U
	defb 055h,057h,0aah,080h,000h,02fh,055h,055h,055h,057h,0aah,080h,000h,02fh,005h,055h	; 892d  UW.../UUUW.../.U
	defb 055h,057h,00eh,0aah,0a8h,02fh,057h,055h,055h,057h,0abh,0aah,0a8h,02fh,055h,0d5h	; 893d  UW.../WUUW.../U.
	defb 055h,057h,0aah,0eah,0a8h,02fh,055h,0d5h,055h,057h,0aah,0eah,0aah,0afh,055h,0c1h	; 894d  UW.../U.UW....U.
	defb 055h,057h,0aah,083h,0aah,0afh,055h,057h,055h,057h,0aah,0abh,0aah,0afh,055h,057h	; 895d  UW....UWUW....UW
	defb 055h,057h,0aah,0abh,0aah,0afh,057h,055h,055h,015h,0abh,080h,000h,02ah,055h,000h	; 896d  UW....WUU....*U.
	defb 000h,015h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0a8h,055h,07fh	; 897d  ......UUUU....U.
	defb 0ffh,0f9h,0aah,0b5h,055h,058h,055h,07fh,0ffh,0f9h,0aah,0aah,0aah,0a8h,055h,07fh	; 898d  ....UXU.......U.
	defb 0ffh,0f9h,0aah,0b5h,055h,058h,055h,07fh,0ffh,0f9h,0aah,0aah,0aah,0a8h,055h,07fh	; 899d  ....UXU.......U.
	defb 0ffh,0f9h,0aah,080h,000h,000h,055h,000h,000h,081h,0aah,0aah,0aah,0aah,055h,055h	; 89ad  ......U.......UU
	defb 054h,0d5h,0aah,0aah,0aah,0aah,0ffh,0f5h,05eh,0ffh,0ffh,0fah,0beh,0ffh,055h,05fh	; 89bd  T.......^.....U_
	defb 0f4h,0d5h,0aah,06fh,0eah,0aah,055h,055h,054h,0d5h,000h,06ah,0aah,000h,0ffh,055h	; 89cd  ...o..UUT..j...U
	defb 055h,0ffh,0aah,06ah,0aah,0aah,055h,055h,055h,055h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 89dd  U..j..UUUU......
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 89ed  ................
	defb 000h,000h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h	; 89fd  ......UUUU....UU
	defb 055h,055h,0aah,0aah,0ffh,0aah,055h,055h,061h,055h,000h,00ah,0b5h,0a0h,000h,005h	; 8a0d  UU....UUaU......
	defb 059h,040h,0aah,0a2h,0adh,0a2h,055h,051h,057h,045h,0aah,0a8h,0abh,0a2h,055h,054h	; 8a1d  Y@....UQWE....UT
	defb 055h,045h,099h,0aah,02ah,0a2h,055h,055h,015h,045h,099h,0aah,08ah,0a2h,055h,055h	; 8a2d  UE..*.UU.E....UU
	defb 045h,045h,099h,0aah,0a2h,0a2h,055h,055h,051h,045h,099h,0aah,0a8h,00ah,055h,055h	; 8a3d  EE....UUQE....UU
	defb 054h,015h,099h,0aah,0aah,0aah,055h,055h,055h,055h,099h,0aah,0aah,0aah,055h,055h	; 8a4d  T.....UUUU....UU
	defb 095h,055h,099h,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0ffh,0feh,0aah,055h,0ffh	; 8a5d  .U....UUUU....U.
	defb 0fch,055h,0abh,0aah,0aah,02ah,000h,000h,000h,000h,000h	; 8a6d  .U...*.....

; ======================================================================
; CODIGO 0x8a78..0x984e  (3542 bytes)
; ======================================================================


L_8A78:
	nop			;8a78
	nop			;8a79
	nop			;8a7a
	nop			;8a7b
	nop			;8a7c
	nop			;8a7d
	nop			;8a7e
	ld a,(bc)		;8a7f
	xor d			;8a80
	xor d			;8a81
	xor d			;8a82
	dec d			;8a83
	ld d,l			;8a84
	ld d,l			;8a85
	ld d,l			;8a86
	ld a,(bc)		;8a87
	xor d			;8a88
	xor d			;8a89
	xor d			;8a8a
	dec d			;8a8b
	ld d,l			;8a8c
	ld d,l			;8a8d
	ld d,l			;8a8e
	ld a,(bc)		;8a8f
	xor d			;8a90
	xor d			;8a91
	xor d			;8a92
	dec d			;8a93
	ld d,l			;8a94
	ld d,l			;8a95
	ld d,l			;8a96
	ld a,(bc)		;8a97
	xor d			;8a98
	nop			;8a99
	nop			;8a9a
	dec d			;8a9b
	ld d,h			;8a9c
	nop			;8a9d
	nop			;8a9e
	ld a,(bc)		;8a9f
	xor b			;8aa0
	xor d			;8aa1
	xor d			;8aa2
	dec d			;8aa3
	ld d,c			;8aa4
	ld d,l			;8aa5
	ld d,l			;8aa6
	ld a,(bc)		;8aa7
	and d			;8aa8
	xor d			;8aa9
	xor d			;8aaa
	dec d			;8aab
	ld b,l			;8aac
	ld d,l			;8aad
	ld d,l			;8aae
	ld a,(bc)		;8aaf
	and d			;8ab0
	xor a			;8ab1
	jp po,04515h		;8ab2
	ld e,b			;8ab5
	dec d			;8ab6
	ld a,(bc)		;8ab7
	and d			;8ab8
	xor d			;8ab9
	or d			;8aba
	dec d			;8abb
	ld b,l			;8abc
	ld e,c			;8abd
	ld d,l			;8abe
	ld a,(bc)		;8abf
	and d			;8ac0
	xor d			;8ac1
	or d			;8ac2
	dec d			;8ac3
	ld d,c			;8ac4
	ld e,c			;8ac5
	ld d,l			;8ac6
	ld a,(bc)		;8ac7
	xor b			;8ac8
	xor d			;8ac9
	or d			;8aca
	dec d			;8acb
	ld d,h			;8acc
	ld e,c			;8acd
	ld d,l			;8ace
	ld a,(bc)		;8acf
	xor d			;8ad0
	ld hl,(015b2h)		;8ad1
	ld d,h			;8ad4
	ld e,c			;8ad5
	ld d,l			;8ad6
	ld a,(bc)		;8ad7
	xor d			;8ad8
	dec hl			;8ad9
	jp p,05415h		;8ada
	ld e,b			;8add
	dec b			;8ade
	ld a,(bc)		;8adf
	xor d			;8ae0
	ld hl,(015aah)		;8ae1
	ld d,h			;8ae4
	ld d,l			;8ae5
	ld d,l			;8ae6
	ld a,(bc)		;8ae7
	xor d			;8ae8
	ld hl,(015aah)		;8ae9
	ld d,h			;8aec
	ld d,l			;8aed
	ld d,l			;8aee
	ld a,(bc)		;8aef
	xor d			;8af0
	ld hl,(000aah)		;8af1
	nop			;8af4
	nop			;8af5
	ld bc,00000h		;8af6
	nop			;8af9
	inc bc			;8afa
	nop			;8afb
	nop			;8afc
	nop			;8afd
	rlca			;8afe
	xor d			;8aff
	xor d			;8b00
	xor d			;8b01
	xor a			;8b02
	ld d,l			;8b03
	ld d,l			;8b04
	ld d,l			;8b05
	ld d,a			;8b06
	xor d			;8b07
	xor d			;8b08
	xor d			;8b09
	xor a			;8b0a
	ld d,h			;8b0b
	nop			;8b0c
	dec d			;8b0d
	ld d,a			;8b0e
	xor b			;8b0f
	nop			;8b10
	ld a,(051afh)		;8b11
	ld d,l			;8b14
	ld e,l			;8b15
	ld d,a			;8b16
	ld (bc),a		;8b17
	xor d			;8b18
	xor (hl)		;8b19
	xor a			;8b1a
	dec b			;8b1b
	ld d,l			;8b1c
	ld d,a			;8b1d
	ld d,a			;8b1e
	xor d			;8b1f
	xor d			;8b20
	xor (hl)		;8b21
	xor a			;8b22
	ld d,l			;8b23
	ld d,l			;8b24
	ld d,a			;8b25
	ld d,a			;8b26
	xor d			;8b27
	xor d			;8b28
	xor (hl)		;8b29
	xor a			;8b2a
	ld d,l			;8b2b
	ld a,l			;8b2c
	ld d,a			;8b2d
	ld d,a			;8b2e
	xor d			;8b2f
	jp pe,L_AFAE		;8b30
	ld d,l			;8b33
	ld e,l			;8b34
	ld d,a			;8b35
	ld d,a			;8b36
	xor d			;8b37
	jp pe,L_AFAE		;8b38
	ld d,l			;8b3b
	ld e,l			;8b3c
	ld d,a			;8b3d
	ld d,a			;8b3e
	xor d			;8b3f
	jp pe,L_AFAE		;8b40
	ld d,l			;8b43
	ld e,l			;8b44
	ld d,a			;8b45
	ld d,a			;8b46
	xor a			;8b47
	jp pe,L_AFAE		;8b48
	ld e,l			;8b4b
	ld e,l			;8b4c
	ld e,l			;8b4d
	ld d,a			;8b4e
	xor d			;8b4f
	xor d			;8b50
	cp d			;8b51
	xor a			;8b52
	ld e,a			;8b53
	ld (iy+057h),l		;8b54
	xor d			;8b57
	xor d			;8b58
	jp pe,055afh		;8b59
	ld d,l			;8b5c
	push de			;8b5d
	ld d,a			;8b5e
	xor d			;8b5f
	xor e			;8b60
	xor d			;8b61
	xor a			;8b62
	ld d,l			;8b63
	ld d,a			;8b64
	ld d,l			;8b65
	ld d,a			;8b66
	xor d			;8b67
	xor e			;8b68
	xor d			;8b69
	xor a			;8b6a
	ld d,l			;8b6b
	ld d,a			;8b6c
	ld d,l			;8b6d
	ld d,a			;8b6e
	xor d			;8b6f
	xor e			;8b70
	xor d			;8b71
	xor a			;8b72
	dec d			;8b73
	ld d,h			;8b74
	ld d,l			;8b75
	ld d,l			;8b76
	ld a,(bc)		;8b77
	xor (hl)		;8b78
	ld hl,(010aah)		;8b79
	inc c			;8b7c
	ld d,l			;8b7d
	ld d,l			;8b7e
	ex af,af'		;8b7f
	adc a,(hl)		;8b80
	ld hl,(0122ah)		;8b81
	inc l			;8b84
	ld d,l			;8b85
	push de			;8b86
	ex af,af'		;8b87
	adc a,(hl)		;8b88
	ld hl,(012aah)		;8b89
	inc l			;8b8c
	ld d,l			;8b8d
	ld d,l			;8b8e
	ex af,af'		;8b8f
	adc a,(hl)		;8b90
	ld hl,(0122ah)		;8b91
	inc l			;8b94
	ld d,l			;8b95
	push de			;8b96
	ex af,af'		;8b97
	adc a,(hl)		;8b98
	ld hl,(012aah)		;8b99
	inc l			;8b9c
	ld d,l			;8b9d
	ld d,l			;8b9e
	ex af,af'		;8b9f
	adc a,(hl)		;8ba0
	ld hl,(0122ah)		;8ba1
	inc l			;8ba4
	ld d,l			;8ba5
	push de			;8ba6
	ex af,af'		;8ba7
	adc a,(hl)		;8ba8
	ld hl,(012aah)		;8ba9
	inc l			;8bac
	ld d,l			;8bad
	ld d,l			;8bae
	ex af,af'		;8baf
	adc a,(hl)		;8bb0
	ld hl,(012aah)		;8bb1
	inc l			;8bb4
	ld d,l			;8bb5
	ld d,l			;8bb6
	ex af,af'		;8bb7
	adc a,(hl)		;8bb8
	ccf			;8bb9
	jp pe,02c12h		;8bba
	ld a,a			;8bbd
	push af			;8bbe
	ex af,af'		;8bbf
	adc a,(hl)		;8bc0
	xor d			;8bc1
	cp d			;8bc2
	djnz L_8BD2		;8bc3
	ld d,l			;8bc5
	ld e,a			;8bc6
	rrca			;8bc7
	cp 0aah			;8bc8
	xor a			;8bca
	rra			;8bcb
	defb 0fdh,055h ;ld d,iyl	;8bcc
	ld d,l			;8bce
	ld a,(bc)		;8bcf
	xor d			;8bd0
	xor d			;8bd1
L_8BD2:
	xor d			;8bd2
	dec d			;8bd3
	ld d,l			;8bd4
	ld d,l			;8bd5
	ld d,l			;8bd6
	ld a,(bc)		;8bd7
	xor d			;8bd8
	and b			;8bd9
	nop			;8bda
	dec d			;8bdb
	ld d,l			;8bdc
	ld e,a			;8bdd
	rst 38h			;8bde
	ld a,(bc)		;8bdf
	xor d			;8be0
	xor d			;8be1
	xor d			;8be2
	dec d			;8be3
	ld d,l			;8be4
	ld d,l			;8be5
	ld d,l			;8be6
	ccf			;8be7
	rst 38h			;8be8
	rst 38h			;8be9
	rst 38h			;8bea
	ld a,a			;8beb
	rst 38h			;8bec
	rst 38h			;8bed
	rst 38h			;8bee
	rst 38h			;8bef
	rst 38h			;8bf0
	rst 38h			;8bf1
	rst 38h			;8bf2
	ld d,l			;8bf3
	ld d,a			;8bf4
	ld d,l			;8bf5
	ld d,a			;8bf6
	add a,b			;8bf7
	dec bc			;8bf8
	xor d			;8bf9
	xor a			;8bfa
	ld e,a			;8bfb
	rst 20h			;8bfc
	ld d,l			;8bfd
	ld d,a			;8bfe
	sbc a,d			;8bff
	xor e			;8c00
	xor d			;8c01
	xor a			;8c02
	ld e,d			;8c03
	and a			;8c04
	ld d,l			;8c05
	ld d,a			;8c06
	sub l			;8c07
	ld l,e			;8c08
	xor d			;8c09
	xor a			;8c0a
	ld d,l			;8c0b
	ld h,a			;8c0c
	ld d,l			;8c0d
	ld d,a			;8c0e
	sbc a,d			;8c0f
	xor e			;8c10
	xor d			;8c11
	xor a			;8c12
	ld e,d			;8c13
	and a			;8c14
	ld d,l			;8c15
	ld d,a			;8c16
	sub l			;8c17
	ld l,e			;8c18
	xor d			;8c19
	xor a			;8c1a
	ld d,l			;8c1b
	ld h,a			;8c1c
	ld d,l			;8c1d
	ld d,a			;8c1e
	sbc a,d			;8c1f
	xor e			;8c20
	xor d			;8c21
	xor a			;8c22
	ld e,d			;8c23
	and a			;8c24
	ld d,l			;8c25
	ld d,a			;8c26
	sub l			;8c27
	ld l,(hl)		;8c28
	xor d			;8c29
	xor a			;8c2a
	ld d,l			;8c2b
	ld l,l			;8c2c
	ld d,l			;8c2d
	ld d,a			;8c2e
	sbc a,a			;8c2f
	jp pe,L_AFAA		;8c30
	ld b,b			;8c33
	dec c			;8c34
	ld a,a			;8c35
	rst 10h			;8c36
	xor d			;8c37
	cp d			;8c38
	rst 38h			;8c39
	rst 28h			;8c3a
	ld d,l			;8c3b
	ld e,l			;8c3c
	ld h,b			;8c3d
	rst 10h			;8c3e
	xor d			;8c3f
	cp d			;8c40
	ret po			;8c41
	rst 28h			;8c42
	rst 38h			;8c43
	push af			;8c44
	ld a,a			;8c45
	rst 10h			;8c46
	rst 38h			;8c47
	jp pe,0efffh		;8c48
	ld d,l			;8c4b
	ld d,l			;8c4c
	ld d,l			;8c4d
	ld d,a			;8c4e
	xor d			;8c4f
	xor d			;8c50
	sbc a,d			;8c51
	xor a			;8c52
	ld d,l			;8c53
	ld d,l			;8c54
	ld d,l			;8c55
	ld d,a			;8c56
	nop			;8c57
	nop			;8c58
	ld a,(de)		;8c59
	xor a			;8c5a
	rst 38h			;8c5b
	rst 38h			;8c5c
	push af			;8c5d
	ld d,a			;8c5e
	xor d			;8c5f
	xor d			;8c60
	xor d			;8c61
	xor a			;8c62
	ld d,l			;8c63
	ld d,l			;8c64
	ld d,l			;8c65
	ld d,a			;8c66
	rst 38h			;8c67
	rst 38h			;8c68
	rst 38h			;8c69
	rst 38h			;8c6a
	rst 38h			;8c6b
	rst 38h			;8c6c
	rst 38h			;8c6d
	rst 38h			;8c6e
	rst 38h			;8c6f
	rst 38h			;8c70
	rst 38h			;8c71
	rst 38h			;8c72
	dec d			;8c73
	ld d,h			;8c74
	ld d,l			;8c75
	ld d,l			;8c76
	ld hl,(02aaah)		;8c77
	xor d			;8c7a
	ld d,l			;8c7b
	ld d,h			;8c7c
	ld d,l			;8c7d
	ld d,l			;8c7e
	xor d			;8c7f
	xor d			;8c80
	ld hl,(055aah)		;8c81
	ld d,h			;8c84
	ld d,l			;8c85
	ld d,l			;8c86
	xor d			;8c87
	xor d			;8c88
	ld hl,(040aah)		;8c89
	inc b			;8c8c
	ld d,l			;8c8d
	ld d,l			;8c8e
	add a,b			;8c8f
	ld a,(bc)		;8c90
	ld a,(bc)		;8c91
	xor d			;8c92
	ld b,l			;8c93
	ld e,h			;8c94
	dec b			;8c95
	ld d,l			;8c96
	adc a,b			;8c97
	ld a,(0aa8ah)		;8c98
	ld b,b			;8c9b
	dec e			;8c9c
	ld b,l			;8c9d
	ld d,l			;8c9e
	adc a,b			;8c9f
	cp d			;8ca0
	adc a,d			;8ca1
	xor d			;8ca2
	ld b,d			;8ca3
	dec e			;8ca4
	ld b,l			;8ca5
	ld d,l			;8ca6
	adc a,b			;8ca7
	cp d			;8ca8
	adc a,d			;8ca9
	rst 38h			;8caa
	ld (bc),a		;8cab
	dec e			;8cac
	ld b,l			;8cad
	rst 38h			;8cae
	ex af,af'		;8caf
	ld a,(0ea8ah)		;8cb0
	nop			;8cb3
	dec e			;8cb4
	ld b,l			;8cb5
	push de			;8cb6
	ex af,af'		;8cb7
	ld a,(0ea8ah)		;8cb8
	nop			;8cbb
	sbc a,l			;8cbc
	ld b,l			;8cbd
	ret nz			;8cbe
	ex af,af'		;8cbf
	ld a,(0808ah)		;8cc0
	ld bc,0451dh		;8cc3
	ld d,l			;8cc6
	ex af,af'		;8cc7
	ld a,(0aa8ah)		;8cc8
	dec b			;8ccb
	ld e,l			;8ccc
	dec d			;8ccd
	ld d,l			;8cce
	rrca			;8ccf
	jp m,L_AA2A		;8cd0
	rra			;8cd3
	call m,05555h		;8cd4
	xor d			;8cd7
	xor d			;8cd8
	ld hl,(055aah)		;8cd9
	ld d,h			;8cdc
	ld d,l			;8cdd
	ld d,l			;8cde
	xor d			;8cdf
	xor d			;8ce0
	ld hl,(055aah)		;8ce1
	ld d,h			;8ce4
	ld d,l			;8ce5
	ld d,l			;8ce6
	xor d			;8ce7
	xor d			;8ce8
	ld hl,(0d5aah)		;8ce9
	ld d,h			;8cec
	ld d,l			;8ced
	ld d,l			;8cee
	jp pe,02aaah		;8cef
	xor d			;8cf2
	ld d,l			;8cf3
	ld d,a			;8cf4
	ld d,l			;8cf5
	ld d,b			;8cf6
	xor d			;8cf7
	xor e			;8cf8
	xor d			;8cf9
	xor b			;8cfa
	ld d,l			;8cfb
	ld d,l			;8cfc
	push de			;8cfd
	ld d,h			;8cfe
	xor d			;8cff
	xor d			;8d00
	jp pe,05faah		;8d01
	push de			;8d04
	ld (hl),l		;8d05
	ld d,l			;8d06
	cp d			;8d07
	jp pe,L_AABA		;8d08
	ld d,b			;8d0b
	ld d,l			;8d0c
	ld e,l			;8d0d
	ld d,l			;8d0e
	cp b			;8d0f
	jp pe,L_AAAE		;8d10
	ld d,b			;8d13
	ld d,l			;8d14
	ld e,l			;8d15
	ld d,l			;8d16
	cp d			;8d17
	jp pe,L_AAAE		;8d18
	ld e,a			;8d1b
	push de			;8d1c
	ld e,l			;8d1d
	ld d,l			;8d1e
	xor d			;8d1f
	xor d			;8d20
	xor (hl)		;8d21
	xor d			;8d22
	ld d,l			;8d23
	ld d,l			;8d24
	ld e,l			;8d25
	ld d,l			;8d26
	rst 38h			;8d27
	rst 38h			;8d28
	xor (hl)		;8d29
	xor d			;8d2a
	rst 38h			;8d2b
	rst 38h			;8d2c
	ld e,a			;8d2d
	rst 38h			;8d2e
	xor d			;8d2f
	xor d			;8d30
	cpl			;8d31
	rst 38h			;8d32
	ld d,l			;8d33
	ld d,h			;8d34
	ld e,a			;8d35
	ld d,l			;8d36
	xor d			;8d37
	xor d			;8d38
	cpl			;8d39
	xor d			;8d3a
	nop			;8d3b
	inc d			;8d3c
	ld e,a			;8d3d
	ld d,l			;8d3e
	nop			;8d3f
	ld a,(0aa2fh)		;8d40
	ld d,l			;8d43
	ld (hl),h		;8d44
	ld e,a			;8d45
	ld d,l			;8d46
	xor d			;8d47
	cp d			;8d48
	cpl			;8d49
	xor d			;8d4a
	ld d,l			;8d4b
	ld (hl),h		;8d4c
	ld e,a			;8d4d
	ld d,l			;8d4e
	xor d			;8d4f
	cp d			;8d50
	cp 000h			;8d51
	ld d,l			;8d53
	ld (hl),l		;8d54
	call m,L_AA00		;8d55
	cp d			;8d58
	xor d			;8d59
	xor d			;8d5a
	ld d,l			;8d5b
	ld (hl),l		;8d5c
	ld d,l			;8d5d
	ld d,l			;8d5e
	xor d			;8d5f
	cp d			;8d60
	xor d			;8d61
	xor d			;8d62
	ld d,l			;8d63
	ld e,l			;8d64
	ld d,l			;8d65
	ld d,l			;8d66
	xor d			;8d67
	xor (hl)		;8d68
	xor d			;8d69
	xor e			;8d6a
	ld d,l			;8d6b
	ld d,a			;8d6c
	ld d,l			;8d6d
	ld d,a			;8d6e
	xor d			;8d6f
	xor e			;8d70
	xor d			;8d71
	xor a			;8d72
	dec d			;8d73
	push de			;8d74
	ld d,h			;8d75
	ld d,a			;8d76
	ld hl,(0a8eah)		;8d77
	xor e			;8d7a
	ld d,l			;8d7b
	push de			;8d7c
	ld d,h			;8d7d
	ld d,l			;8d7e
	xor d			;8d7f
	jp pe,L_AAA8		;8d80
	ld d,l			;8d83
	ret nz			;8d84
	nop			;8d85
	ld d,l			;8d86
	xor d			;8d87
	add a,b			;8d88
	nop			;8d89
	xor d			;8d8a
	ld d,l			;8d8b
	ld d,l			;8d8c
	ld d,l			;8d8d
	ld d,l			;8d8e
	xor d			;8d8f
	xor d			;8d90
	xor d			;8d91
	xor d			;8d92
	ld d,l			;8d93
	ld d,l			;8d94
	ld d,l			;8d95
	ld d,l			;8d96
	nop			;8d97
	ld a,(bc)		;8d98
	xor d			;8d99
	nop			;8d9a
	nop			;8d9b
	dec d			;8d9c
	ld d,l			;8d9d
	nop			;8d9e
	xor d			;8d9f
	cp d			;8da0
	xor d			;8da1
	ld hl,(0fd7fh)		;8da2
	ld d,l			;8da5
	dec d			;8da6
	ret po			;8da7
	ld l,0aah		;8da8
	ld hl,(0774fh)		;8daa
	ld d,l			;8dad
	dec d			;8dae
	ex de,hl		;8daf
	dec hl			;8db0
	rst 38h			;8db1
	xor d			;8db2
	ld c,l			;8db3
	halt			;8db4
	nop			;8db5
	dec d			;8db6
	ex de,hl		;8db7
	dec hl			;8db8
	xor d			;8db9
	ld hl,(0774fh)		;8dba
	rst 38h			;8dbd
	sub l			;8dbe
	ret po			;8dbf
	ld hl,(02a00h)		;8dc0
	ld d,l			;8dc3
	ld (hl),a		;8dc4
	ld d,l			;8dc5
	dec d			;8dc6
	rst 38h			;8dc7
	xor 0aah		;8dc8
	ld hl,(05d55h)		;8dca
	ld d,l			;8dcd
	dec d			;8dce
	xor d			;8dcf
	cp d			;8dd0
	xor d			;8dd1
	ld hl,(07555h)		;8dd2
	ld d,l			;8dd5
	dec d			;8dd6
	xor d			;8dd7
	jp pe,02aaah		;8dd8
	ld d,l			;8ddb
	push de			;8ddc
	ld d,l			;8ddd
	dec d			;8dde
	xor e			;8ddf
	and b			;8de0
	ld (bc),a		;8de1
	ld hl,(05f57h)		;8de2
	defb 0fdh,015h,0abh ;illegal sequence	;8de5
	xor d			;8de8
	xor d			;8de9
	ld hl,(05557h)		;8dea
	ld d,l			;8ded
	dec d			;8dee
	xor e			;8def
	xor d			;8df0
	xor d			;8df1
	ld hl,(05557h)		;8df2
	ld d,l			;8df5
	dec d			;8df6
	xor e			;8df7
	xor d			;8df8
	xor d			;8df9
	ld hl,(05557h)		;8dfa
	ld d,l			;8dfd
	dec d			;8dfe
	xor e			;8dff
	xor d			;8e00
	xor d			;8e01
	ld hl,(0d555h)		;8e02
	ld d,l			;8e05
	dec d			;8e06
	xor d			;8e07
	jp pe,02aaah		;8e08
	ld d,l			;8e0b
	ld (hl),l		;8e0c
	ld d,l			;8e0d
	dec d			;8e0e
	xor d			;8e0f
	cp d			;8e10
	xor d			;8e11
	ld hl,(05d55h)		;8e12
	ld d,l			;8e15
	dec d			;8e16
	xor d			;8e17
	xor (hl)		;8e18
	xor d			;8e19
	ld hl,(05755h)		;8e1a
	ld d,l			;8e1d
	dec d			;8e1e
	xor d			;8e1f
	xor e			;8e20
	xor d			;8e21
	ld hl,(05755h)		;8e22
	ld d,l			;8e25
	dec d			;8e26
	xor d			;8e27
	xor e			;8e28
	xor d			;8e29
	ld hl,(05755h)		;8e2a
	ld d,l			;8e2d
	dec d			;8e2e
	xor d			;8e2f
	xor e			;8e30
	xor d			;8e31
	ld hl,(0ff57h)		;8e32
	ld d,l			;8e35
	dec d			;8e36
	xor a			;8e37
	cp 0aah			;8e38
	adc a,d			;8e3a
	ld e,l			;8e3b
	ld d,l			;8e3c
	ld d,l			;8e3d
	ld b,l			;8e3e
	cp d			;8e3f
	xor d			;8e40
	xor d			;8e41
	and d			;8e42
	push af			;8e43
	rst 38h			;8e44
	ld d,l			;8e45
	ld d,c			;8e46
	ex de,hl		;8e47
	ld bc,0abaah		;8e48
	ld d,l			;8e4b
	ld a,l			;8e4c
	ld d,l			;8e4d
	ld d,l			;8e4e
	xor e			;8e4f
	ld b,l			;8e50
	xor d			;8e51
	xor d			;8e52
	ld d,l			;8e53
	ld d,l			;8e54
	ld d,l			;8e55
	push de			;8e56
	ld bc,0aa55h		;8e57
	add a,b			;8e5a
	rst 38h			;8e5b
	ld b,l			;8e5c
	ld d,l			;8e5d
	rst 38h			;8e5e
	xor e			;8e5f
	ld a,l			;8e60
	xor d			;8e61
	xor d			;8e62
	ld d,l			;8e63
	ld bc,0d555h		;8e64
	dec hl			;8e67
	rst 38h			;8e68
	xor d			;8e69
	xor e			;8e6a
	dec d			;8e6b
	rst 38h			;8e6c
	rst 38h			;8e6d
	ld d,a			;8e6e
	ld a,(bc)		;8e6f
	rst 38h			;8e70
	cp 0afh			;8e71
	nop			;8e73
	nop			;8e74
	nop			;8e75
	nop			;8e76
	nop			;8e77
	nop			;8e78
	nop			;8e79
	nop			;8e7a
	nop			;8e7b
	nop			;8e7c
	nop			;8e7d
	nop			;8e7e
	xor d			;8e7f
	xor d			;8e80
	xor d			;8e81
	xor d			;8e82
	ld d,l			;8e83
	ld d,l			;8e84
	ld d,l			;8e85
	ld d,l			;8e86
	xor d			;8e87
	xor d			;8e88
	xor d			;8e89
	xor d			;8e8a
	ld d,l			;8e8b
	ld d,l			;8e8c
	ld d,l			;8e8d
	ld d,l			;8e8e
	xor d			;8e8f
	xor d			;8e90
	xor d			;8e91
	xor d			;8e92
	ld d,l			;8e93
	ld d,l			;8e94
	ld d,l			;8e95
	ld d,l			;8e96
	xor d			;8e97
	rst 38h			;8e98
	xor d			;8e99
	xor d			;8e9a
	ld d,l			;8e9b
	rst 38h			;8e9c
	dec d			;8e9d
	ld d,l			;8e9e
	xor e			;8e9f
	xor d			;8ea0
	adc a,d			;8ea1
	xor d			;8ea2
	ld d,a			;8ea3
	ld d,l			;8ea4
	ld b,l			;8ea5
	ld d,l			;8ea6
	xor (hl)		;8ea7
	add a,b			;8ea8
	and d			;8ea9
	xor d			;8eaa
	defb 0fdh,03eh,045h ;illegal sequence	;8eab
	rst 38h			;8eae
	jp m,L_A3AA		;8eaf
	rst 38h			;8eb2
	ld d,l			;8eb3
	ld a,047h		;8eb4
	ld d,l			;8eb6
	xor d			;8eb7
	xor d			;8eb8
	and (hl)		;8eb9
	xor d			;8eba
	ld d,l			;8ebb
	ld a,04dh		;8ebc
	ld d,l			;8ebe
	xor d			;8ebf
	xor d			;8ec0
	cp d			;8ec1
	xor d			;8ec2
	ld d,l			;8ec3
	ld a,055h		;8ec4
	ld d,l			;8ec6
	xor d			;8ec7
	add a,b			;8ec8
	xor d			;8ec9
	xor d			;8eca
	ld d,l			;8ecb
	ld d,l			;8ecc
	ld d,l			;8ecd
	ld d,l			;8ece
	nop			;8ecf
	nop			;8ed0
	ld hl,(000a0h)		;8ed1
	nop			;8ed4
	ld (hl),l		;8ed5
	ld b,b			;8ed6
	xor d			;8ed7
	xor d			;8ed8
	cp d			;8ed9
	adc a,d			;8eda
	ld d,l			;8edb
	ld d,l			;8edc
	ld d,b			;8edd
	dec d			;8ede
	xor d			;8edf
	xor d			;8ee0
	and b			;8ee1
	ld hl,(05555h)		;8ee2
	ld d,l			;8ee5
	ld d,l			;8ee6
	rst 38h			;8ee7
	rst 38h			;8ee8
	rst 38h			;8ee9
	rst 38h			;8eea
	rst 38h			;8eeb
	rst 38h			;8eec
	rst 38h			;8eed
	rst 38h			;8eee
	rst 38h			;8eef
	rst 38h			;8ef0
	rst 38h			;8ef1
	rst 38h			;8ef2
	dec d			;8ef3
	push de			;8ef4
	ld d,h			;8ef5
	ld d,a			;8ef6
	ld a,(bc)		;8ef7
	jp pe,L_AFA8		;8ef8
	dec d			;8efb
	push de			;8efc
	ld d,h			;8efd
	ld d,a			;8efe
	ld a,(bc)		;8eff
	jp pe,L_AFA8		;8f00
	dec d			;8f03
	call z,057cch		;8f04
	ld a,(bc)		;8f07
	jp pe,L_AFA8		;8f08
	dec d			;8f0b
	push de			;8f0c
	ld d,h			;8f0d
	ld d,a			;8f0e
	ld a,(bc)		;8f0f
	jp pe,L_AFA8		;8f10
	dec d			;8f13
	ld (hl),l		;8f14
	ld d,c			;8f15
	ld d,a			;8f16
	ld a,(bc)		;8f17
	cp b			;8f18
	ld (bc),a		;8f19
	xor a			;8f1a
	dec d			;8f1b
	ld d,b			;8f1c
	dec b			;8f1d
	ld d,a			;8f1e
	nop			;8f1f
	xor d			;8f20
	xor d			;8f21
	rlca			;8f22
	ld c,055h		;8f23
	ld d,l			;8f25
	ld (hl),a		;8f26
	ld c,000h		;8f27
	nop			;8f29
	ld (hl),a		;8f2a
	ld c,0ffh		;8f2b
	rst 38h			;8f2d
	ld (hl),a		;8f2e
	ld c,0a8h		;8f2f
	ld a,(bc)		;8f31
	ld (hl),a		;8f32
	nop			;8f33
	ld d,a			;8f34
	push af			;8f35
	rlca			;8f36
	ld a,(bc)		;8f37
	xor b			;8f38
	ld a,(bc)		;8f39
	xor a			;8f3a
	dec d			;8f3b
	ld d,a			;8f3c
	push af			;8f3d
	ld d,a			;8f3e
	ld a,(bc)		;8f3f
	xor b			;8f40
	ld a,(bc)		;8f41
	xor a			;8f42
	dec d			;8f43
	dec d			;8f44
	ld d,a			;8f45
	ld d,a			;8f46
	ld a,(bc)		;8f47
	adc a,d			;8f48
	xor (hl)		;8f49
	xor a			;8f4a
	dec d			;8f4b
	push bc			;8f4c
	ld e,h			;8f4d
	ld d,a			;8f4e
	ld a,(bc)		;8f4f
	ex (sp),hl		;8f50
	ret m			;8f51
	xor a			;8f52
	dec d			;8f53
	rst 10h			;8f54
	call p,00a57h		;8f55
	jp pe,L_AFA8		;8f58
	dec d			;8f5b
	push de			;8f5c
	ld d,h			;8f5d
	ld d,a			;8f5e
	ld a,(bc)		;8f5f
	jp pe,L_AFA8		;8f60
	dec d			;8f63
	push de			;8f64
	ld d,h			;8f65
	ld d,a			;8f66
	ld a,(bc)		;8f67
	jp pe,L_AFA8		;8f68
	dec d			;8f6b
	push de			;8f6c
	ld d,h			;8f6d
	ld d,a			;8f6e
	ld a,(bc)		;8f6f
	jp pe,L_AFA8		;8f70
	nop			;8f73
	nop			;8f74
	nop			;8f75
	nop			;8f76
	nop			;8f77
	nop			;8f78
	nop			;8f79
	nop			;8f7a
	nop			;8f7b
	nop			;8f7c
	nop			;8f7d
	nop			;8f7e
	ld a,(bc)		;8f7f
	xor d			;8f80
	xor d			;8f81
	xor d			;8f82
	dec d			;8f83
	ld d,l			;8f84
	ld d,l			;8f85
	ld d,l			;8f86
	ld a,(bc)		;8f87
	xor b			;8f88
	nop			;8f89
	ld (bc),a		;8f8a
	dec d			;8f8b
	ld d,l			;8f8c
	rst 38h			;8f8d
	push af			;8f8e
	ld a,(bc)		;8f8f
	xor b			;8f90
	nop			;8f91
	ld (05515h),a		;8f92
	ld d,l			;8f95
	dec (hl)		;8f96
	ld a,(bc)		;8f97
	xor d			;8f98
	xor d			;8f99
	or d			;8f9a
	dec d			;8f9b
	ld e,a			;8f9c
	push af			;8f9d
	dec b			;8f9e
	ld a,(bc)		;8f9f
	cp a			;8fa0
	jp po,015aah		;8fa1
	ld (hl),l		;8fa4
	ld d,c			;8fa5
	ld d,l			;8fa6
	ld a,(bc)		;8fa7
	jp pe,L_AAA8		;8fa8
	dec d			;8fab
	push de			;8fac
	ld d,h			;8fad
	ld a,a			;8fae
	ld a,(bc)		;8faf
	and 06ah		;8fb0
	rst 38h			;8fb2
	dec d			;8fb3
	push de			;8fb4
	ld d,l			;8fb5
	ld d,l			;8fb6
	ld a,(bc)		;8fb7
	and 066h		;8fb8
	xor d			;8fba
	dec d			;8fbb
	push de			;8fbc
	ld d,l			;8fbd
	ld d,l			;8fbe
	ld a,(bc)		;8fbf
	and 066h		;8fc0
	ld h,(hl)		;8fc2
	dec d			;8fc3
	push de			;8fc4
	ld d,l			;8fc5
	ld d,l			;8fc6
	ld a,(bc)		;8fc7
	jp pe,L_AA66		;8fc8
	dec d			;8fcb
	ld (hl),l		;8fcc
	ld d,l			;8fcd
	ld d,l			;8fce
	ld a,(bc)		;8fcf
	cp d			;8fd0
	xor d			;8fd1
	add a,b			;8fd2
	dec d			;8fd3
	ld e,l			;8fd4
	ld d,l			;8fd5
	nop			;8fd6
	ld a,(bc)		;8fd7
	xor (hl)		;8fd8
	nop			;8fd9
	ld hl,(05415h)		;8fda
	nop			;8fdd
	ld d,l			;8fde
	ld a,(bc)		;8fdf
	xor d			;8fe0
	xor d			;8fe1
	xor d			;8fe2
	dec d			;8fe3
	ld d,l			;8fe4
	ld d,l			;8fe5
	ld d,l			;8fe6
	ccf			;8fe7
	rst 38h			;8fe8
	rst 38h			;8fe9
	rst 38h			;8fea
	ld a,a			;8feb
	rst 38h			;8fec
	rst 38h			;8fed
	rst 38h			;8fee
	rst 38h			;8fef
	rst 38h			;8ff0
	rst 38h			;8ff1
	rst 38h			;8ff2
	nop			;8ff3
	nop			;8ff4
	nop			;8ff5
	ld bc,00000h		;8ff6
	nop			;8ff9
	inc bc			;8ffa
	nop			;8ffb
	nop			;8ffc
	nop			;8ffd
	rlca			;8ffe
	xor d			;8fff
	xor d			;9000
	xor d			;9001
	xor a			;9002
	ld d,l			;9003
	ld d,l			;9004
	ld d,l			;9005
	ld d,a			;9006
	xor d			;9007
	xor d			;9008
	xor d			;9009
	xor a			;900a
	ld d,l			;900b
	ld d,a			;900c
	rst 38h			;900d
	rst 10h			;900e
	xor d			;900f
	xor a			;9010
	rst 38h			;9011
	xor a			;9012
	ld c,h			;9013
	rst 10h			;9014
	inc sp			;9015
	rla			;9016
	xor d			;9017
	xor (hl)		;9018
	call z,0552fh		;9019
	ld d,a			;901c
	inc bc			;901d
	rla			;901e
	xor d			;901f
	xor (hl)		;9020
	call nc,0552fh		;9021
	ld d,a			;9024
	inc de			;9025
	rla			;9026
	xor d			;9027
	xor (hl)		;9028
	call nc,0ff2fh		;9029
	rst 10h			;902c
	inc de			;902d
	rla			;902e
	rst 38h			;902f
	xor (hl)		;9030
	call nc,0552fh		;9031
	rla			;9034
	inc de			;9035
	rla			;9036
	xor d			;9037
	ld l,0d4h		;9038
	cpl			;903a
	ld d,l			;903b
	rla			;903c
	inc de			;903d
	rla			;903e
	xor d			;903f
	ld l,0d4h		;9040
	cpl			;9042
	ld d,l			;9043
	rla			;9044
	inc de			;9045
	rla			;9046
	xor d			;9047
	ld l,0c4h		;9048
	cpl			;904a
	ld d,l			;904b
	rla			;904c
	inc sp			;904d
	rla			;904e
	nop			;904f
	ld l,0cch		;9050
	cpl			;9052
	nop			;9053
	inc d			;9054
	nop			;9055
	rla			;9056
	xor d			;9057
	xor b			;9058
	nop			;9059
	cpl			;905a
	ld d,l			;905b
	ld d,l			;905c
	ld d,l			;905d
	ld d,a			;905e
	xor d			;905f
	xor d			;9060
	xor d			;9061
	xor a			;9062
	ld d,l			;9063
	ld d,l			;9064
	ld d,l			;9065
	ld d,a			;9066
	rst 38h			;9067
	rst 38h			;9068
	rst 38h			;9069
	rst 38h			;906a
	rst 38h			;906b
	rst 38h			;906c
	rst 38h			;906d
	rst 38h			;906e
	rst 38h			;906f
	rst 38h			;9070
	rst 38h			;9071
	rst 38h			;9072
	nop			;9073
	nop			;9074
	nop			;9075
	ld bc,00000h		;9076
	nop			;9079
	inc bc			;907a
	nop			;907b
	nop			;907c
	nop			;907d
	rlca			;907e
	ld a,(bc)		;907f
	xor d			;9080
	xor d			;9081
	xor a			;9082
	dec d			;9083
	ld d,l			;9084
	ld d,l			;9085
	ld d,a			;9086
	ex af,af'		;9087
	and d			;9088
	adc a,d			;9089
	cpl			;908a
	djnz $+67		;908b
	inc b			;908d
	rla			;908e
	ld a,(bc)		;908f
	xor d			;9090
	xor d			;9091
	xor a			;9092
	djnz L_90D6		;9093
	inc b			;9095
	rla			;9096
	ld a,(bc)		;9097
	xor d			;9098
	xor d			;9099
	xor a			;909a
	djnz L_90DE		;909b
	inc b			;909d
	rla			;909e
	ld a,(bc)		;909f
	xor d			;90a0
	xor d			;90a1
	xor a			;90a2
	djnz L_90E6		;90a3
	inc b			;90a5
	rla			;90a6
	ld a,(bc)		;90a7
	xor d			;90a8
	xor d			;90a9
	xor a			;90aa
	djnz L_90EE		;90ab
	inc b			;90ad
	rla			;90ae
	ld a,(bc)		;90af
	xor d			;90b0
	xor d			;90b1
	xor a			;90b2
	djnz L_90F6		;90b3
	inc b			;90b5
	rla			;90b6
	ld a,(bc)		;90b7
	xor d			;90b8
	xor d			;90b9
	xor a			;90ba
	djnz $+67		;90bb
	inc b			;90bd
	rla			;90be
	ld a,(bc)		;90bf
	and d			;90c0
	adc a,d			;90c1
	xor a			;90c2
	djnz $+87		;90c3
	ld d,h			;90c5
	rla			;90c6
	ld a,(bc)		;90c7
	xor d			;90c8
	xor d			;90c9
	xor a			;90ca
	djnz L_9124		;90cb
	call nc,00a17h		;90cd
	xor a			;90d0
	adc a,d			;90d1
	xor a			;90d2
	djnz L_9132		;90d3
	ld b,h			;90d5
L_90D6:
	rla			;90d6
L_90D7:
	ex af,af'		;90d7
	cp d			;90d8
	and d			;90d9
	cpl			;90da
	dec d			;90db
	ld (hl),l		;90dc
	ld d,c			;90dd
L_90DE:
	ld d,a			;90de
	ld a,(bc)		;90df
	jp pe,L_AFA8		;90e0
	dec d			;90e3
	push de			;90e4
	ld d,h			;90e5
L_90E6:
	ld d,a			;90e6
	ld a,(bc)		;90e7
	rst 38h			;90e8
	cp 0afh			;90e9
	dec d			;90eb
	add a,b			;90ec
	nop			;90ed
L_90EE:
	ld d,a			;90ee
	ld a,(bc)		;90ef
	jp pe,L_AFA8		;90f0
	dec d			;90f3
	push de			;90f4
	ld d,h			;90f5
L_90F6:
	ld d,a			;90f6
	ld a,(bc)		;90f7
	jp pe,L_AFA8		;90f8
	dec d			;90fb
	rst 38h			;90fc
	cp 057h			;90fd
	ld a,(bc)		;90ff
	add a,b			;9100
	nop			;9101
	xor a			;9102
	dec d			;9103
	push de			;9104
	ld d,h			;9105
	ld d,a			;9106
	ld a,(bc)		;9107
	jp pe,L_AFA8		;9108
	dec d			;910b
	rst 38h			;910c
	cp 057h			;910d
	ld a,(bc)		;910f
	add a,b			;9110
	nop			;9111
	xor a			;9112
	dec d			;9113
	push de			;9114
	ld d,h			;9115
	ld d,a			;9116
	dec bc			;9117
	cp b			;9118
	jp po,0172fh		;9119
	ld b,a			;911c
	dec e			;911d
	rla			;911e
	ld c,0aah		;911f
	xor d			;9121
	adc a,a			;9122
	rla			;9123
L_9124:
	nop			;9124
	ld bc,00e17h		;9125
	nop			;9128
	dec d			;9129
	adc a,a			;912a
	rla			;912b
	ld bc,01741h		;912c
	ld c,000h		;912f
	add hl,bc		;9131
L_9132:
	adc a,a			;9132
	rla			;9133
	jr z,L_90D7		;9134
	rla			;9136
	ld c,000h		;9137
	ld bc,0178fh		;9139
	ld d,b			;913c
	ld bc,00e17h		;913d
	nop			;9140
	dec b			;9141
	adc a,a			;9142
	rla			;9143
	rst 38h			;9144
	rst 38h			;9145
	rla			;9146
	ld c,0aah		;9147
	xor d			;9149
	adc a,a			;914a
	rla			;914b
	ld d,l			;914c
	ld d,l			;914d
	rla			;914e
	dec bc			;914f
	xor d			;9150
	xor d			;9151
	cpl			;9152
	dec d			;9153
	ret nz			;9154
	nop			;9155
	ld d,a			;9156
	ld a,(bc)		;9157
	add a,b			;9158
	nop			;9159
	xor a			;915a
	dec d			;915b
	ld d,l			;915c
	ld d,l			;915d
	ld d,a			;915e
	ld a,(bc)		;915f
	xor d			;9160
	xor d			;9161
	xor a			;9162
	dec d			;9163
	ld d,l			;9164
	ld d,l			;9165
	ld d,a			;9166
	ccf			;9167
	rst 38h			;9168
	rst 38h			;9169
	rst 38h			;916a
	ld a,a			;916b
	rst 38h			;916c
	rst 38h			;916d
	rst 38h			;916e
	rst 38h			;916f
	rst 38h			;9170
	rst 38h			;9171
	rst 38h			;9172
	ld d,a			;9173
	ld d,l			;9174
	ld d,l			;9175
	dec d			;9176
	xor e			;9177
	xor d			;9178
	xor d			;9179
	ld hl,(05557h)		;917a
	ld d,l			;917d
	dec d			;917e
	xor e			;917f
	add a,b			;9180
	ld a,(bc)		;9181
	ld hl,(07f57h)		;9182
	push af			;9185
	dec d			;9186
	xor e			;9187
	xor d			;9188
	xor d			;9189
	ld hl,(05557h)		;918a
	ld d,l			;918d
	dec d			;918e
	xor e			;918f
	xor b			;9190
	ld hl,(0572ah)		;9191
	ld d,b			;9194
	ld (hl),l		;9195
	dec d			;9196
	xor e			;9197
	and d			;9198
	cp d			;9199
	ld hl,(04557h)		;919a
	ld e,l			;919d
	dec d			;919e
	xor e			;919f
	and d			;91a0
	cp d			;91a1
	adc a,d			;91a2
	ld d,a			;91a3
	ld b,l			;91a4
	ld e,l			;91a5
	ld b,l			;91a6
	rst 38h			;91a7
	and e			;91a8
	cp d			;91a9
	xor a			;91aa
	rst 38h			;91ab
	ld b,h			;91ac
	ld e,l			;91ad
	ld e,a			;91ae
	xor d			;91af
	and d			;91b0
	cp d			;91b1
	xor d			;91b2
	ld d,l			;91b3
	ld b,l			;91b4
	ld e,l			;91b5
	ld d,l			;91b6
	xor d			;91b7
	adc a,d			;91b8
	ld a,(000aah)		;91b9
	dec d			;91bc
	ret nc			;91bd
	nop			;91be
	nop			;91bf
	ld hl,(000a0h)		;91c0
	ld d,l			;91c3
	ld d,l			;91c4
	ld d,l			;91c5
	ld d,l			;91c6
	xor d			;91c7
	xor d			;91c8
	xor d			;91c9
	xor d			;91ca
	ld d,l			;91cb
	ld e,a			;91cc
	rst 38h			;91cd
	push de			;91ce
	xor d			;91cf
	cp a			;91d0
	rst 38h			;91d1
	xor d			;91d2
	ld d,l			;91d3
	ld (hl),l		;91d4
	ld d,l			;91d5
	dec d			;91d6
	xor d			;91d7
	jp pe,02aaah		;91d8
	ld d,l			;91db
	push de			;91dc
	ld d,l			;91dd
	dec d			;91de
	xor e			;91df
	xor d			;91e0
	xor d			;91e1
	ld hl,(05557h)		;91e2
	ld d,l			;91e5
	dec d			;91e6
	xor e			;91e7
	xor d			;91e8
	xor d			;91e9
	ld hl,(05557h)		;91ea
	ld d,l			;91ed
	dec d			;91ee
	xor e			;91ef
	xor d			;91f0
	xor d			;91f1
	ld hl,(05557h)		;91f2
	ld d,l			;91f5
	dec d			;91f6
	xor e			;91f7
	xor d			;91f8
	xor d			;91f9
	ld hl,(05557h)		;91fa
	ld d,l			;91fd
	dec d			;91fe
	xor e			;91ff
	xor d			;9200
	xor d			;9201
	ld hl,(05557h)		;9202
	ld d,l			;9205
	dec d			;9206
	xor e			;9207
	xor d			;9208
	xor d			;9209
	ld hl,(0d555h)		;920a
	ld d,l			;920d
	dec d			;920e
	xor d			;920f
	jp pe,02aaah		;9210
	ld d,l			;9213
	ld (hl),b		;9214
	ld d,l			;9215
	dec d			;9216
	xor d			;9217
	and b			;9218
	xor d			;9219
	ld hl,(05555h)		;921a
	push de			;921d
	dec d			;921e
	xor d			;921f
	xor d			;9220
	jp pe,0552ah		;9221
	ld d,l			;9224
	ld (hl),l		;9225
	dec d			;9226
	cp 0aah			;9227
	cp d			;9229
	ld hl,(055fdh)		;922a
	ld (hl),h		;922d
	ld d,l			;922e
	xor b			;922f
	adc a,d			;9230
	cp b			;9231
	xor d			;9232
	ld d,c			;9233
	ld (hl),l		;9234
	ld (hl),h		;9235
	ld d,l			;9236
	xor b			;9237
	xor d			;9238
	cp b			;9239
	xor d			;923a
	ld bc,07455h		;923b
	ld d,l			;923e
	nop			;923f
	xor d			;9240
	cp b			;9241
	xor d			;9242
	ld d,l			;9243
	ld d,l			;9244
	ld (hl),l		;9245
	rst 38h			;9246
	xor d			;9247
	adc a,d			;9248
	cp e			;9249
	rst 38h			;924a
	ld d,l			;924b
	ld (hl),l		;924c
	ld (hl),l		;924d
	ld d,l			;924e
	xor d			;924f
	xor d			;9250
	jp pe,055aah		;9251
	ld d,l			;9254
	push de			;9255
	ld d,l			;9256
	xor d			;9257
	xor e			;9258
	xor d			;9259
	nop			;925a
	ld d,l			;925b
	ld d,a			;925c
	ld d,l			;925d
	rst 38h			;925e
	xor d			;925f
	adc a,e			;9260
	xor d			;9261
	xor d			;9262
	ld d,l			;9263
	ld (hl),a		;9264
	ld d,l			;9265
	ld d,l			;9266
	xor d			;9267
	xor e			;9268
	xor d			;9269
	xor e			;926a
	ld d,l			;926b
	ld d,a			;926c
	ld d,l			;926d
	ld d,a			;926e
	xor d			;926f
	xor e			;9270
	xor d			;9271
	xor a			;9272
	ld d,a			;9273
	ld d,l			;9274
	ld d,l			;9275
	dec d			;9276
	xor e			;9277
	nop			;9278
	nop			;9279
	ld hl,(0ff57h)		;927a
	rst 38h			;927d
	dec d			;927e
	xor e			;927f
	xor d			;9280
	xor d			;9281
	ld hl,(05557h)		;9282
	ld d,l			;9285
	dec d			;9286
	xor e			;9287
	xor d			;9288
	xor d			;9289
	ld hl,(00057h)		;928a
	nop			;928d
	dec d			;928e
	xor e			;928f
	rst 38h			;9290
	rst 38h			;9291
	ld hl,(0d555h)		;9292
	ld d,l			;9295
	dec d			;9296
	xor d			;9297
	jp pe,02aaah		;9298
	ld d,l			;929b
	ld (hl),l		;929c
	ld d,l			;929d
	dec d			;929e
	xor d			;929f
	cp d			;92a0
	xor d			;92a1
	adc a,d			;92a2
	ld d,l			;92a3
	ld e,l			;92a4
	ld d,l			;92a5
	ld b,l			;92a6
	xor d			;92a7
	xor (hl)		;92a8
	xor d			;92a9
	and e			;92aa
	ld d,l			;92ab
	ld d,a			;92ac
	ld d,l			;92ad
	ld d,a			;92ae
	xor d			;92af
	xor e			;92b0
	xor d			;92b1
	xor d			;92b2
	ld d,l			;92b3
	ld d,l			;92b4
	push de			;92b5
	ld d,l			;92b6
	xor d			;92b7
	xor d			;92b8
	jp pe,055aah		;92b9
	ld d,l			;92bc
	ld b,b			;92bd
	nop			;92be
	xor d			;92bf
	xor d			;92c0
	and b			;92c1
	nop			;92c2
	rst 38h			;92c3
	ld d,l			;92c4
	ld d,l			;92c5
	ld d,l			;92c6
	cp 02ah			;92c7
	xor d			;92c9
	xor d			;92ca
	ld d,l			;92cb
	dec d			;92cc
	ld d,l			;92cd
	ld d,l			;92ce
	xor d			;92cf
	adc a,d			;92d0
	xor d			;92d1
	xor d			;92d2
L_92D3:
	ld d,l			;92d3
	ld b,l			;92d4
	ld d,l			;92d5
	ld d,l			;92d6
	ld (bc),a		;92d7
	xor a			;92d8
	xor d			;92d9
	xor d			;92da
	defb 0fdh,05fh,055h ;illegal sequence	;92db
	ld d,l			;92de
	xor d			;92df
	xor d			;92e0
	ld hl,(055aah)		;92e1
	ld d,h			;92e4
	ld d,l			;92e5
	ld d,l			;92e6
	ld hl,(02aaah)		;92e7
	xor d			;92ea
	dec d			;92eb
	ld d,h			;92ec
	ld d,l			;92ed
	ld d,l			;92ee
	ld a,(bc)		;92ef
	xor d			;92f0
	ld hl,(055aah)		;92f1
	ld d,a			;92f4
	ld d,l			;92f5
	ld d,a			;92f6
	xor d			;92f7
	xor e			;92f8
	xor d			;92f9
	xor e			;92fa
	ld d,l			;92fb
	ld d,a			;92fc
	ld d,l			;92fd
	ld d,l			;92fe
	xor d			;92ff
	xor e			;9300
	xor d			;9301
	xor d			;9302
	ld h,(hl)		;9303
	ld h,a			;9304
	ld d,l			;9305
	ld d,l			;9306
	xor d			;9307
	xor e			;9308
	xor d			;9309
	xor d			;930a
	ld d,l			;930b
	ld d,a			;930c
	ld d,l			;930d
	ld d,l			;930e
	xor d			;930f
	xor e			;9310
	xor d			;9311
	xor d			;9312
	ld d,l			;9313
	ld d,a			;9314
	ld d,l			;9315
	ld d,l			;9316
	xor d			;9317
	xor (hl)		;9318
	xor d			;9319
	nop			;931a
	ld d,l			;931b
	ld e,l			;931c
	ld d,h			;931d
	nop			;931e
	xor d			;931f
	cp d			;9320
	xor b			;9321
	xor d			;9322
	ld d,l			;9323
	ld e,l			;9324
	ld d,c			;9325
	ld d,l			;9326
	rst 38h			;9327
	cp d			;9328
	and d			;9329
	adc a,b			;932a
	rst 38h			;932b
	ld e,l			;932c
	ld b,l			;932d
	ld d,l			;932e
	xor d			;932f
	ld a,(0888ah)		;9330
	ld d,h			;9333
	ld e,l			;9334
	dec d			;9335
	ld d,l			;9336
	xor d			;9337
	ld a,(08828h)		;9338
	nop			;933b
	ld e,h			;933c
	ld d,l			;933d
	ld d,l			;933e
	nop			;933f
	ld a,(08828h)		;9340
	ld d,l			;9343
	ld e,h			;9344
	ld d,l			;9345
	ld d,l			;9346
	xor d			;9347
	cp d			;9348
	jr z,L_92D3		;9349
	ld d,l			;934b
	ld e,h			;934c
	ld d,l			;934d
	ld d,l			;934e
	xor d			;934f
	cp d			;9350
	ld hl,(055aah)		;9351
	ld (hl),h		;9354
	ld d,l			;9355
	ld d,l			;9356
	xor d			;9357
	jp pe,02a00h		;9358
	ld d,l			;935b
	call nc,01500h		;935c
	xor e			;935f
	xor d			;9360
	xor d			;9361
	ld hl,(05557h)		;9362
	ld d,l			;9365
	dec d			;9366
	xor e			;9367
	xor d			;9368
	xor d			;9369
	ld hl,(05557h)		;936a
	ld d,l			;936d
	dec d			;936e
	xor e			;936f
	xor d			;9370
	xor d			;9371
	ld hl,(05415h)		;9372
	ld d,l			;9375
	ld d,l			;9376
	ld hl,(02aaah)		;9377
	xor d			;937a
	ld d,l			;937b
	ld d,h			;937c
	ld d,l			;937d
	ld d,l			;937e
	xor d			;937f
	xor d			;9380
	ld hl,(055aah)		;9381
	ld d,l			;9384
	dec d			;9385
	ld d,l			;9386
	xor d			;9387
	xor d			;9388
	adc a,d			;9389
	xor d			;938a
	ld d,l			;938b
	ld d,l			;938c
	ld b,l			;938d
	ld d,l			;938e
	xor d			;938f
	xor d			;9390
	and d			;9391
	xor d			;9392
	ld d,l			;9393
	ld d,l			;9394
	ld d,c			;9395
	ld d,l			;9396
	nop			;9397
	ld a,(bc)		;9398
	xor b			;9399
	xor d			;939a
	nop			;939b
	dec e			;939c
	ld d,h			;939d
	ld d,l			;939e
	xor d			;939f
	xor (hl)		;93a0
	xor d			;93a1
	ld hl,(05755h)		;93a2
	ld d,l			;93a5
	dec d			;93a6
	xor d			;93a7
	xor e			;93a8
	xor d			;93a9
	cp a			;93aa
	ld d,l			;93ab
	ld d,l			;93ac
	push de			;93ad
	ld a,a			;93ae
	xor d			;93af
	xor d			;93b0
	jp pe,055aah		;93b1
	ld d,l			;93b4
	ld (hl),l		;93b5
	ld d,l			;93b6
	and b			;93b7
	ld (bc),a		;93b8
	jp pe,055aah		;93b9
	ld d,c			;93bc
	ld (hl),l		;93bd
	ld b,b			;93be
	and b			;93bf
	ld (bc),a		;93c0
	jp pe,05580h		;93c1
	ld d,l			;93c4
	ld (hl),l		;93c5
	dec d			;93c6
	xor d			;93c7
	xor d			;93c8
	jp pe,0552ah		;93c9
	ld d,l			;93cc
	ld (hl),l		;93cd
	dec d			;93ce
	xor d			;93cf
	xor d			;93d0
	jp pe,0552ah		;93d1
	ld d,l			;93d4
	push de			;93d5
	dec d			;93d6
	xor e			;93d7
	rst 38h			;93d8
	xor d			;93d9
	ld hl,(0ff57h)		;93da
	ld d,l			;93dd
	dec d			;93de
	xor e			;93df
	xor d			;93e0
	xor d			;93e1
	ld hl,(05557h)		;93e2
	ld d,l			;93e5
	dec d			;93e6
	xor e			;93e7
	xor d			;93e8
	xor d			;93e9
	ld hl,(05557h)		;93ea
	ld d,l			;93ed
	dec d			;93ee
	xor e			;93ef
	xor d			;93f0
	xor d			;93f1
	ld hl,(0d515h)		;93f2
	ld d,h			;93f5
	ld d,a			;93f6
	ld a,(bc)		;93f7
	ret po			;93f8
	ex af,af'		;93f9
	xor e			;93fa
	dec d			;93fb
	ret nz			;93fc
	inc e			;93fd
	ld d,l			;93fe
	ld a,(bc)		;93ff
	jp z,L_AAAC		;9400
	dec d			;9403
	sub l			;9404
	ld d,(hl)		;9405
	ld d,l			;9406
	ld a,(bc)		;9407
	xor d			;9408
	xor d			;9409
	xor d			;940a
	dec d			;940b
	ld d,l			;940c
	ld d,l			;940d
	ld d,l			;940e
	ld a,(bc)		;940f
	xor d			;9410
	xor d			;9411
	xor d			;9412
	dec d			;9413
	rst 38h			;9414
	ld d,l			;9415
	ld d,l			;9416
	dec bc			;9417
	nop			;9418
	jr nz,L_941B		;9419
L_941B:
	dec d			;941b
	ld bc,00040h		;941c
	dec bc			;941f
	jr c,L_942C		;9420
	xor d			;9422
	dec d			;9423
	ld bc,05545h		;9424
	dec bc			;9427
	jr c,$+12		;9428
	xor d			;942a
	dec d			;942b
L_942C:
	ld bc,05545h		;942c
	dec bc			;942f
	nop			;9430
	cpl			;9431
	jp pe,03915h		;9432
	ld e,a			;9435
	push de			;9436
	dec bc			;9437
	nop			;9438
	ld hl,(0158ah)		;9439
	ld bc,01555h		;943c
	dec bc			;943f
	nop			;9440
	ld hl,(0158ah)		;9441
	add hl,sp		;9444
	ld d,l			;9445
	dec d			;9446
	dec bc			;9447
	nop			;9448
	jr nz,L_9455		;9449
	dec d			;944b
	ld bc,01540h		;944c
	dec bc			;944f
	nop			;9450
	ld a,(bc)		;9451
	xor d			;9452
	dec d			;9453
	ld d,l			;9454
L_9455:
	dec d			;9455
	ld d,l			;9456
	ld a,(bc)		;9457
	nop			;9458
	ld hl,(015aah)		;9459
	ld d,h			;945c
	ld d,l			;945d
	defb 0fdh,00ah,0aah ;illegal sequence	;945e
	ld hl,(01502h)		;9461
	ld d,h			;9464
	ld d,l			;9465
	ld d,l			;9466
	ld a,(bc)		;9467
	xor d			;9468
	ld hl,(015aah)		;9469
	ld d,h			;946c
	ld d,l			;946d
	ld d,l			;946e
	ld a,(bc)		;946f
	xor d			;9470
	ld hl,(015aah)		;9471
	ld d,h			;9474
	ld d,l			;9475
	ld d,l			;9476
	ld a,(bc)		;9477
	xor d			;9478
	ld hl,(015aah)		;9479
	ld d,h			;947c
	ld d,l			;947d
	inc de			;947e
	ld a,(bc)		;947f
	xor d			;9480
	ld (0170ah),hl		;9481
	call m,05341h		;9484
	ld c,0aeh		;9487
	ld hl,(0150ah)		;9489
	ld d,h			;948c
	ld b,c			;948d
	ld d,e			;948e
	rrca			;948f
	cp 02ah			;9490
	ld a,(bc)		;9492
	dec d			;9493
	ld d,h			;9494
	ld b,c			;9495
	ld d,e			;9496
	ld a,(bc)		;9497
	xor b			;9498
	xor d			;9499
	ld a,(bc)		;949a
	dec d			;949b
	ld d,c			;949c
	ld b,c			;949d
	ld d,e			;949e
	ld a,(bc)		;949f
	and d			;94a0
	xor d			;94a1
	ld a,(bc)		;94a2
	dec d			;94a3
	ld b,l			;94a4
	ld b,c			;94a5
	ld d,e			;94a6
	ld a,(bc)		;94a7
	adc a,d			;94a8
	xor d			;94a9
	ld a,(bc)		;94aa
	dec d			;94ab
	dec d			;94ac
	ld b,c			;94ad
	ld d,e			;94ae
	ld a,(bc)		;94af
	ld hl,(00aaah)		;94b0
	inc d			;94b3
	ld d,l			;94b4
	ld b,c			;94b5
	inc de			;94b6
	ld a,(bc)		;94b7
	ld hl,(0aaa2h)		;94b8
	inc d			;94bb
	ld d,l			;94bc
	ld d,l			;94bd
	ld d,l			;94be
	ld a,(bc)		;94bf
	ld hl,(0aaaah)		;94c0
	inc d			;94c3
	ld a,a			;94c4
	rst 38h			;94c5
	rst 38h			;94c6
	ld a,(bc)		;94c7
	rst 38h			;94c8
	rst 38h			;94c9
	rst 18h			;94ca
	dec d			;94cb
	ld d,l			;94cc
	ld d,l			;94cd
	ld d,l			;94ce
	ld a,(bc)		;94cf
	xor d			;94d0
	xor d			;94d1
	sbc a,d			;94d2
	dec d			;94d3
	ld d,l			;94d4
	ld d,l			;94d5
	ld d,l			;94d6
	ld a,(bc)		;94d7
	rst 38h			;94d8
	jp pe,01580h		;94d9
	rst 38h			;94dc
	push bc			;94dd
	ld e,a			;94de
	ld a,(bc)		;94df
	jp pe,L_AAA2		;94e0
	dec d			;94e3
	push de			;94e4
	ld d,c			;94e5
	ld d,l			;94e6
	ld a,(bc)		;94e7
	rst 38h			;94e8
	call m,015abh		;94e9
	add a,b			;94ec
	nop			;94ed
	ld d,a			;94ee
	ld a,(bc)		;94ef
	jp pe,L_AFA8		;94f0
	nop			;94f3
	nop			;94f4
	nop			;94f5
	nop			;94f6
	nop			;94f7
	nop			;94f8
	nop			;94f9
	nop			;94fa
	nop			;94fb
	nop			;94fc
	nop			;94fd
	nop			;94fe
	xor d			;94ff
	xor a			;9500
	rst 38h			;9501
	cp 055h			;9502
	ld b,a			;9504
	rst 38h			;9505
	rst 38h			;9506
	xor d			;9507
	and d			;9508
	xor d			;9509
	xor (hl)		;950a
	ld d,l			;950b
	ld b,h			;950c
	inc e			;950d
	scf			;950e
	xor d			;950f
	and d			;9510
	rst 38h			;9511
	xor (hl)		;9512
	ld d,l			;9513
	ld b,h			;9514
	defb 0ddh,037h,000h ;illegal sequence	;9515
	ld h,d			;9518
	cp (hl)			;9519
	xor (hl)		;951a
	nop			;951b
	call nz,037ddh		;951c
	xor e			;951f
	and d			;9520
	cp (hl)			;9521
	xor (hl)		;9522
	ld d,a			;9523
	ld b,h			;9524
	defb 0ddh,037h,0aeh ;illegal sequence	;9525
	and d			;9528
	cp (hl)			;9529
	xor (hl)		;952a
	ld e,l			;952b
	ld b,h			;952c
	defb 0ddh,037h,0aeh ;illegal sequence	;952d
	and d			;9530
	cp (hl)			;9531
	xor a			;9532
	ld e,l			;9533
	ld b,h			;9534
	inc e			;9535
	dec (hl)		;9536
	xor (hl)		;9537
	and d			;9538
	ex de,hl		;9539
	jp pe,0455dh		;953a
	ld d,l			;953d
	ld d,l			;953e
	xor (hl)		;953f
	and d			;9540
	xor d			;9541
	xor d			;9542
	ld e,h			;9543
	dec b			;9544
	ld d,l			;9545
	ld d,l			;9546
	xor b			;9547
	ld (bc),a		;9548
	xor d			;9549
	xor d			;954a
	ld d,l			;954b
	ld d,l			;954c
	ld d,l			;954d
	ld d,l			;954e
	xor d			;954f
	xor d			;9550
	nop			;9551
	nop			;9552
	ld d,l			;9553
	ld d,a			;9554
	nop			;9555
	nop			;9556
	xor d			;9557
	xor e			;9558
	xor d			;9559
	xor d			;955a
	ld d,l			;955b
	ld d,a			;955c
	ld d,l			;955d
	ld d,l			;955e
	xor d			;955f
	xor e			;9560
	xor d			;9561
	xor d			;9562
	ld d,l			;9563
	ld d,a			;9564
	ld d,l			;9565
	ld d,l			;9566
	xor d			;9567
	xor e			;9568
	xor d			;9569
	xor e			;956a
	ld d,l			;956b
	ld d,a			;956c
	ld d,l			;956d
	ld d,a			;956e
	xor d			;956f
	xor e			;9570
	xor d			;9571
	xor a			;9572
	nop			;9573
	nop			;9574
	nop			;9575
	nop			;9576
	nop			;9577
	nop			;9578
	nop			;9579
	nop			;957a
	nop			;957b
	nop			;957c
	nop			;957d
	nop			;957e
	rst 38h			;957f
	cp 0aah			;9580
	xor d			;9582
	ld b,b			;9583
	dec b			;9584
	ld d,l			;9585
	ld d,l			;9586
	push de			;9587
	ld d,(hl)		;9588
	xor d			;9589
	xor d			;958a
	ld b,b			;958b
	dec b			;958c
	ld d,l			;958d
	ld d,l			;958e
	jp z,L_AAA6		;958f
	xor d			;9592
	ld b,b			;9593
	dec b			;9594
	ld d,l			;9595
	ld d,l			;9596
	push de			;9597
	ld d,(hl)		;9598
	add a,b			;9599
	nop			;959a
	ld b,b			;959b
	dec b			;959c
	nop			;959d
	nop			;959e
	rst 38h			;959f
	cp 02ah			;95a0
	xor d			;95a2
	ld d,l			;95a3
	ld d,h			;95a4
	ld d,l			;95a5
	ld d,l			;95a6
	xor d			;95a7
	xor d			;95a8
	dec hl			;95a9
	cp 0ffh			;95aa
	ld d,h			;95ac
	ld d,l			;95ad
	ld d,l			;95ae
	cp 0a8h			;95af
	xor e			;95b1
	cp 054h			;95b2
	ld d,c			;95b4
	ld d,l			;95b5
	ld d,l			;95b6
	xor b			;95b7
	and d			;95b8
	xor e			;95b9
	cp 054h			;95ba
	ld c,a			;95bc
	push af			;95bd
	ld d,l			;95be
	xor b			;95bf
	sbc a,a			;95c0
	jp po,054beh		;95c1
	ld d,l			;95c4
	ld d,c			;95c5
	ld d,l			;95c6
	xor b			;95c7
	xor d			;95c8
	xor b			;95c9
	cp (hl)			;95ca
	ld d,h			;95cb
	ld d,l			;95cc
	ld d,h			;95cd
	ld d,l			;95ce
	nop			;95cf
	xor d			;95d0
	add a,b			;95d1
	ld a,000h		;95d2
	ld d,l			;95d4
	nop			;95d5
	ld d,l			;95d6
	xor d			;95d7
	xor d			;95d8
	ld hl,(055beh)		;95d9
	ld d,h			;95dc
	ld d,l			;95dd
	ld d,l			;95de
	xor d			;95df
	xor d			;95e0
	cpl			;95e1
	cp 055h			;95e2
	ld d,h			;95e4
	ld d,l			;95e5
	ld d,l			;95e6
	ld hl,(02faah)		;95e7
	cp 015h			;95ea
	ld d,h			;95ec
	ld d,l			;95ed
	ld d,l			;95ee
	ld a,(bc)		;95ef
	xor d			;95f0
	ld hl,(055aah)		;95f1
	ld d,a			;95f4
	ld d,l			;95f5
	ld d,a			;95f6
	xor d			;95f7
	xor e			;95f8
	xor d			;95f9
	xor a			;95fa
	ld d,l			;95fb
	ld d,a			;95fc
	ld d,l			;95fd
	ld d,a			;95fe
	xor d			;95ff
	xor e			;9600
	xor d			;9601
	xor a			;9602
	ld a,a			;9603
	rst 30h			;9604
	ld d,l			;9605
	ld d,a			;9606
	add a,b			;9607
	dec bc			;9608
	xor d			;9609
	xor a			;960a
	ld d,l			;960b
	ld d,a			;960c
	ld d,l			;960d
	ld d,a			;960e
	xor d			;960f
	xor e			;9610
	xor d			;9611
	xor a			;9612
	ld d,l			;9613
	ld d,a			;9614
	nop			;9615
	rla			;9616
	xor d			;9617
	xor d			;9618
	nop			;9619
	cpl			;961a
	ld a,a			;961b
	push af			;961c
	ld d,l			;961d
	ld (hl),a		;961e
	add a,b			;961f
	ld a,(bc)		;9620
	xor d			;9621
	rst 28h			;9622
	ld d,l			;9623
	ld d,l			;9624
	ld d,l			;9625
	ld (hl),a		;9626
	xor d			;9627
	xor d			;9628
	xor d			;9629
	rst 28h			;962a
	ld d,l			;962b
	ld d,l			;962c
	ld d,l			;962d
	ld (hl),a		;962e
	xor d			;962f
	xor d			;9630
	xor d			;9631
	rst 28h			;9632
	ld a,a			;9633
	rst 38h			;9634
	ld e,a			;9635
	rst 10h			;9636
	add a,b			;9637
	nop			;9638
	cp a			;9639
	xor a			;963a
	ld d,l			;963b
	ld d,l			;963c
	ld (hl),l		;963d
	ld d,a			;963e
	xor d			;963f
	xor d			;9640
	jp pe,0ffafh		;9641
	rst 38h			;9644
	push de			;9645
	ld d,a			;9646
	cp 0ffh			;9647
	xor d			;9649
	xor a			;964a
	ld d,h			;964b
	push de			;964c
	ld d,l			;964d
	ld d,a			;964e
	xor d			;964f
	xor d			;9650
	xor d			;9651
	xor a			;9652
	ld d,h			;9653
	push de			;9654
	ld d,l			;9655
	ld d,a			;9656
	nop			;9657
	xor e			;9658
	cp 0afh			;9659
	rst 38h			;965b
	rst 10h			;965c
	call m,L_AA57		;965d
	xor (hl)		;9660
	xor b			;9661
	xor a			;9662
	ld d,l			;9663
	defb 0fdh,054h ;ld d,iyh	;9664
	ld d,a			;9666
	ld hl,(018fbh)		;9667
	xor a			;966a
	dec d			;966b
	push de			;966c
	ld d,h			;966d
	ld d,a			;966e
	ld a,(bc)		;966f
	jp pe,L_AFA8		;9670
	dec d			;9673
	push de			;9674
	ld d,h			;9675
	ld d,a			;9676
	ld (0a8eah),hl		;9677
	xor a			;967a
	ld c,c			;967b
	ret nz			;967c
	nop			;967d
	ld d,a			;967e
	xor d			;967f
	add a,b			;9680
	nop			;9681
	xor a			;9682
	ld c,c			;9683
	ld d,l			;9684
	ld d,l			;9685
	ld d,a			;9686
	xor d			;9687
	xor d			;9688
	xor d			;9689
	xor a			;968a
	ld c,c			;968b
	ld b,b			;968c
	ld bc,0aa57h		;968d
	add a,b			;9690
	inc bc			;9691
	xor a			;9692
	ld c,c			;9693
	dec d			;9694
	ld d,l			;9695
	rst 10h			;9696
	nop			;9697
	ld hl,(0efaah)		;9698
	nop			;969b
	ld d,l			;969c
	ld d,l			;969d
	ld (hl),a		;969e
	xor d			;969f
	xor d			;96a0
	xor d			;96a1
	rst 28h			;96a2
	ld d,l			;96a3
	ld d,l			;96a4
	ld d,l			;96a5
	ld (hl),a		;96a6
	xor d			;96a7
	xor d			;96a8
	xor d			;96a9
	rst 28h			;96aa
	ld e,a			;96ab
	defb 0fdh,055h ;ld d,iyl	;96ac
	ld (hl),a		;96ae
	and b			;96af
	ld (bc),a		;96b0
	xor d			;96b1
	rst 28h			;96b2
	ld d,l			;96b3
	ld d,l			;96b4
	ld d,l			;96b5
	ld (hl),a		;96b6
	xor d			;96b7
	xor d			;96b8
	xor d			;96b9
	rst 28h			;96ba
	ld d,l			;96bb
	ld d,l			;96bc
	ld a,a			;96bd
	rst 10h			;96be
	cp a			;96bf
	jp m,L_AFFF		;96c0
	ld b,b			;96c3
	dec b			;96c4
	push de			;96c5
	ld d,a			;96c6
	xor d			;96c7
	xor e			;96c8
	xor d			;96c9
	xor a			;96ca
	ld d,l			;96cb
	ld d,a			;96cc
	ld b,b			;96cd
	rla			;96ce
	xor d			;96cf
	xor e			;96d0
	and d			;96d1
	cpl			;96d2
	ld d,l			;96d3
	ld d,a			;96d4
	ld c,b			;96d5
	sub a			;96d6
	cp a			;96d7
	ei			;96d8
	and d			;96d9
	cpl			;96da
	ld b,b			;96db
	rlca			;96dc
	ld c,b			;96dd
	sub a			;96de
	xor d			;96df
	xor e			;96e0
	and d			;96e1
	cpl			;96e2
	ld d,l			;96e3
	ld d,a			;96e4
	ld b,b			;96e5
	rla			;96e6
	xor d			;96e7
	xor e			;96e8
	xor d			;96e9
	xor a			;96ea
	ld d,l			;96eb
	ld d,a			;96ec
	ld d,l			;96ed
	ld d,a			;96ee
	xor d			;96ef
	xor e			;96f0
	xor d			;96f1
	xor a			;96f2
	dec d			;96f3
	ld d,h			;96f4
	ld d,l			;96f5
	ld d,l			;96f6
	ld hl,(02aaah)		;96f7
	xor d			;96fa
	ld e,a			;96fb
	call p,05555h		;96fc
	or b			;96ff
	ld a,(de)		;9700
	ld h,066h		;9701
	ld d,a			;9703
	call nc,05555h		;9704
	or h			;9707
	ld e,d			;9708
	ld hl,(05566h)		;9709
	ld d,h			;970c
	dec b			;970d
	ld d,l			;970e
	or l			;970f
	ld e,d			;9710
	ld (bc),a		;9711
	ld h,(hl)		;9712
	ld d,h			;9713
	ld d,l			;9714
	ld b,l			;9715
	ld d,l			;9716
	or a			;9717
	jp c,L_66A2		;9718
	ld d,b			;971b
	dec d			;971c
	ld b,l			;971d
	ld d,l			;971e
	cp a			;971f
	jp m,L_66A2		;9720
	ld d,l			;9723
	ld d,l			;9724
	ld b,l			;9725
	ld d,l			;9726
	xor d			;9727
	xor d			;9728
	and d			;9729
	and (hl)		;972a
	rst 38h			;972b
	push de			;972c
	ld d,c			;972d
	ld d,l			;972e
	rst 38h			;972f
	adc a,d			;9730
	xor b			;9731
	xor d			;9732
	ld d,l			;9733
	ld b,l			;9734
	ld d,h			;9735
	ld d,l			;9736
	xor d			;9737
	and d			;9738
	xor d			;9739
	ld hl,(05155h)		;973a
	ld d,l			;973d
	dec d			;973e
	xor d			;973f
	xor b			;9740
	xor d			;9741
	adc a,d			;9742
	ld d,l			;9743
	ld d,h			;9744
	ld d,l			;9745
	ld b,a			;9746
	xor d			;9747
	xor d			;9748
	ld hl,(055afh)		;9749
	ld d,l			;974c
	dec d			;974d
	ld d,l			;974e
	nop			;974f
	nop			;9750
	ld a,(bc)		;9751
	xor d			;9752
	nop			;9753
	nop			;9754
	dec d			;9755
	ld d,l			;9756
	xor d			;9757
	xor d			;9758
	xor d			;9759
	and b			;975a
	ld d,l			;975b
	ld d,l			;975c
	ld d,l			;975d
	ld e,a			;975e
	xor d			;975f
	xor d			;9760
	xor d			;9761
	xor d			;9762
	ld d,l			;9763
	ld d,l			;9764
	ld d,l			;9765
	ld d,l			;9766
	rst 38h			;9767
	rst 38h			;9768
	rst 38h			;9769
	rst 38h			;976a
	rst 38h			;976b
	rst 38h			;976c
	rst 38h			;976d
	rst 38h			;976e
	rst 38h			;976f
	rst 38h			;9770
	rst 38h			;9771
	rst 38h			;9772
	ld d,l			;9773
	ld d,a			;9774
	ld d,l			;9775
	ld d,a			;9776
	xor d			;9777
	xor e			;9778
	xor d			;9779
	xor e			;977a
	ld b,c			;977b
	ld d,a			;977c
	ld d,l			;977d
	ld d,l			;977e
	sbc a,h			;977f
	inc bc			;9780
	add a,b			;9781
	nop			;9782
	ld d,a			;9783
	rst 30h			;9784
	ld e,a			;9785
	defb 0fdh,09ch ;sbc a,iyh	;9786
	inc bc			;9788
	add a,b			;9789
	nop			;978a
	ld b,c			;978b
	ld d,a			;978c
	ld d,l			;978d
	ld d,l			;978e
	xor d			;978f
	cp a			;9790
	xor d			;9791
	xor d			;9792
	ld d,l			;9793
	ld a,a			;9794
	ld d,l			;9795
	ld d,l			;9796
	xor d			;9797
	jp pe,L_AAAA		;9798
	ld d,l			;979b
	push de			;979c
	ld a,a			;979d
	ld d,l			;979e
	xor e			;979f
	xor d			;97a0
	cp 02ah			;97a1
	ld d,a			;97a3
	ld d,l			;97a4
	push de			;97a5
	dec d			;97a6
	xor (hl)		;97a7
	xor e			;97a8
	xor d			;97a9
	adc a,d			;97aa
	ld e,l			;97ab
	ld d,a			;97ac
	ld d,l			;97ad
	ld b,a			;97ae
	xor (hl)		;97af
	xor (hl)		;97b0
	xor d			;97b1
	xor a			;97b2
	ld e,l			;97b3
	ld e,l			;97b4
	ld d,l			;97b5
	ld d,l			;97b6
	xor (hl)		;97b7
	cp d			;97b8
	xor d			;97b9
	xor d			;97ba
	ld e,l			;97bb
	ld e,l			;97bc
	ld d,l			;97bd
	ld d,l			;97be
	xor (hl)		;97bf
	cp d			;97c0
	ld h,(hl)		;97c1
	ld h,(hl)		;97c2
	defb 0fdh,05dh ;ld e,iyl	;97c3
	ld d,l			;97c5
	ld d,l			;97c6
	cp 0bah			;97c7
	xor d			;97c9
	xor d			;97ca
	ld d,l			;97cb
	ld e,l			;97cc
	ld d,l			;97cd
	ld d,l			;97ce
	xor d			;97cf
	cp d			;97d0
	xor d			;97d1
	nop			;97d2
	ld d,l			;97d3
	ld e,l			;97d4
	ld d,h			;97d5
	nop			;97d6
	ld (bc),a		;97d7
	xor (hl)		;97d8
	nop			;97d9
	xor d			;97da
	defb 0fdh,054h ;ld d,iyh	;97db
	ld bc,0aa55h		;97dd
	xor d			;97e0
	xor d			;97e1
	xor d			;97e2
	ld d,l			;97e3
	ld d,l			;97e4
	ld d,l			;97e5
	ld d,l			;97e6
	rst 38h			;97e7
	rst 38h			;97e8
	rst 38h			;97e9
	rst 38h			;97ea
	rst 38h			;97eb
	rst 38h			;97ec
	rst 38h			;97ed
	rst 38h			;97ee
	rst 38h			;97ef
	rst 38h			;97f0
	rst 38h			;97f1
	rst 38h			;97f2
	nop			;97f3
	nop			;97f4
	nop			;97f5
	nop			;97f6
	nop			;97f7
	nop			;97f8
	nop			;97f9
	nop			;97fa
	nop			;97fb
	nop			;97fc
	nop			;97fd
	nop			;97fe
	ld a,(bc)		;97ff
	xor d			;9800
	xor d			;9801
	xor d			;9802
	dec d			;9803
	ld d,l			;9804
	ld d,l			;9805
	ld d,l			;9806
	nop			;9807
	xor d			;9808
	xor d			;9809
	and d			;980a
	dec d			;980b
	ld d,a			;980c
	rst 38h			;980d
	ld c,c			;980e
	inc b			;980f
	xor a			;9810
	cp 0aah			;9811
	dec d			;9813
	ld e,l			;9814
	ld d,h			;9815
	ld c,c			;9816
	inc b			;9817
	cp d			;9818
	xor d			;9819
	ld hl,(07511h)		;981a
	ld d,h			;981d
	ld c,c			;981e
	ld a,(bc)		;981f
	jp pe,022aah		;9820
	dec d			;9823
	push de			;9824
	ld d,h			;9825
	ld d,l			;9826
	dec bc			;9827
	xor d			;9828
	xor d			;9829
	ld hl,(05017h)		;982a
	ld bc,00e1fh		;982d
	and a			;9830
	jp m,017bfh		;9831
	ld d,h			;9834
	add hl,bc		;9835
	ld d,l			;9836
	ld c,0a5h		;9837
	jp pe,017aah		;9839
	ld d,l			;983c
	ld l,c			;983d
	ld d,l			;983e
	ld c,0a5h		;983f
	xor d			;9841
	xor d			;9842
	rla			;9843
	ld d,l			;9844
	ld l,c			;9845
	ld d,l			;9846
	ld c,0a5h		;9847
	xor d			;9849
	xor d			;984a
	rla			;984b
	ld d,l			;984c
	jp (hl)			;984d

; ----------------------------------------------------------------------
; DATOS graficos: tramados (2692 B; racha 1.96, entropia 5.26, 156 valores: rachas cortas y muchos valores, firma del damero)
;   0x984e..0xa2d2  (2692 bytes)
; ----------------------------------------------------------------------
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
	defb 055h,0aah,0aah,0aah,0aah,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9fee  U...............
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,002h,002h,002h,002h,002h,002h	; 9ffe  ................
	defb 002h,002h,002h,002h,002h,000h,000h,000h,010h,000h,000h,000h,000h,000h,000h,000h	; a00e  ................
	defb 000h,000h,012h,012h,002h,012h,012h,002h,006h,006h,006h,006h,006h,006h,006h,006h	; a01e  ................
	defb 006h,006h,006h,006h,006h,004h,004h,004h,000h,000h,000h,000h,000h,000h,000h,000h	; a02e  ................
	defb 000h,000h,000h,000h,008h,008h,008h,008h,008h,008h,008h,008h,008h,008h,008h,008h	; a03e  ................
	defb 008h,008h,008h,008h,008h,008h,008h,008h,008h,008h,008h,00ah,00ah,00ah,00ah,00ah	; a04e  ................
	defb 00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah	; a05e  ................
	defb 00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,002h,002h,002h,002h	; a06e  ................
	defb 016h,006h,016h,006h,01ah,01ah,00ah,01ah,012h,006h,016h,006h,01ah,00ah,01ah,012h	; a07e  ................
	defb 012h,002h,014h,004h,014h,004h,010h,000h,010h,008h,01ah,00ah,01ah,00ah,012h,002h	; a08e  ................
	defb 012h,006h,016h,014h,014h,014h,004h,010h,010h,010h,010h,000h,010h,010h,010h,010h	; a09e  ................
	defb 010h,000h,006h,006h,006h,006h,006h,006h,006h,006h,002h,002h,002h,00ah,00ah,002h	; a0ae  ................
	defb 006h,015h,015h,00dh,018h,018h,000h,010h,01ah,002h,002h,002h,012h,002h,016h,006h	; a0be  ................
	defb 01ah,00ah,01ah,002h,016h,006h,016h,006h,006h,016h,01ah,01ah,012h,006h,016h,014h	; a0ce  ................
	defb 014h,004h,014h,014h,014h,014h,006h,006h,006h,016h,006h,01ah,00ah,016h,006h,016h	; a0de  ................
	defb 00eh,00ah,01ah,006h,016h,006h,012h,00ah,01ah,006h,016h,006h,01ah,01ah,002h,006h	; a0ee  ................
	defb 006h,01eh,00ah,01ah,00ah,016h,006h,01ah,00ah,01ah,006h,016h,00eh,01ah,00ah,016h	; a0fe  ................
	defb 006h,006h,01ah,016h,016h,016h,016h,016h,00ah,002h,002h,006h,002h,002h,002h,002h	; a10e  ................
	defb 002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h	; a11e  ................
	defb 002h,002h,002h,002h,002h,002h,006h,016h,006h,004h,014h,000h,000h,000h,000h,000h	; a12e  ................
	defb 000h,002h,002h,002h,000h,000h,000h,004h,004h,004h,000h,000h,000h,000h,000h,000h	; a13e  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,002h,002h,002h,006h,006h,006h,002h,002h	; a14e  ................
	defb 002h,002h,002h,002h,002h,002h,002h,00ah,00ah,00ah,002h,002h,002h,002h,002h,002h	; a15e  ................
	defb 002h,002h,000h,000h,000h,000h,000h,000h,002h,002h,002h,002h,002h,002h,002h,000h	; a16e  ................
	defb 000h,000h,000h,010h,000h,000h,002h,002h,002h,002h,002h,000h,000h,000h,000h,000h	; a17e  ................
	defb 000h,000h,000h,008h,000h,000h,000h,010h,000h,000h,000h,000h,000h,000h,000h,000h	; a18e  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,004h,004h,004h,004h,004h,004h,004h,002h	; a19e  ................
	defb 002h,002h,002h,002h,002h,006h,004h,004h,000h,000h,000h,000h,002h,000h,000h,010h	; a1ae  ................
	defb 000h,000h,010h,000h,012h,000h,010h,000h,010h,000h,018h,008h,000h,010h,000h,010h	; a1be  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,008h,008h,000h,000h,000h,000h,000h	; a1ce  ................
	defb 000h,002h,002h,00ah,00ah,00ah,002h,002h,002h,002h,002h,00ah,000h,000h,000h,000h	; a1de  ................
	defb 000h,000h,000h,000h,000h,000h,000h,008h,008h,000h,008h,008h,00ah,00ah,000h,000h	; a1ee  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a1fe  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a20e  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a21e  ................
	defb 000h,000h,000h,000h,000h,000h,000h,001h,001h,001h,001h,001h,001h,001h,001h,001h	; a22e  ................
	defb 001h,001h,001h,001h,001h,001h,001h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a23e  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a24e  ................
	defb 000h,000h,002h,002h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; a25e  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,010h,0f3h,031h,032h,05bh,0dbh	; a26e  ............12[.
	defb 099h,0a7h,03eh,0e2h,0d3h,099h,03eh,081h,0a7h,0a7h,0d3h,099h,03eh,0c9h,032h,09ah	; a27e  ..>...>.....>.2.
	defb 0fdh,03eh,0c3h,032h,09fh,0fdh,021h,06eh,0c4h,022h,0a0h,0fdh,0edh,05fh,06fh,0edh	; a28e  .>.2..!n."..._o.
	defb 05fh,067h,022h,028h,0adh,0afh,032h,07ch,0b8h,021h,0d8h,0d6h,011h,0c8h,0b8h,001h	; a29e  _g"(..2|.!......
	defb 078h,000h,0edh,0b0h,011h,057h,065h,021h,048h,007h,00eh,002h,006h,010h,0cdh,017h	; a2ae  x....We!H.......
	defb 0d1h,0d5h,01ah,0d3h,098h,013h,013h,013h,013h,010h,0f7h,0d1h,013h,021h,088h,007h	; a2be  .............!..
	defb 00dh,020h,0e9h,0fbh	; a2ce  . ..

; ======================================================================
; CODIGO 0xa2d2..0xa5f0  (798 bytes)
; ======================================================================


L_A2D2:
	call L_B6D3		;a2d2
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
	call L_D136		;a300
	ld a,0f1h		;a303
	call L_D31C		;a305
	call L_B436		;a308
	ld a,003h		;a30b
	ld (0c45fh),a		;a30d
	call L_A56B		;a310
	ld hl,0a6fch		;a313
	ld (0a689h),hl		;a316
	ld a,r			;a319
	ld l,a			;a31b
	ld a,r			;a31c
	ld h,a			;a31e
	ld (0ad28h),hl		;a31f
	call L_BBE2		;a322
L_A325:
	ld a,0a0h		;a325
	ld (0ad27h),a		;a327
L_A32A:
	call L_AC1F		;a32a
	ld a,001h		;a32d
	ld (0ad2ah),a		;a32f
	call L_BB1D		;a332
	call L_A672		;a335
	call L_B4CA		;a338
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
	call L_D383		;a36f
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
	call L_D16F		;a3ae
	jp L_A2D5		;a3b1
L_A3B4:
	ld hl,0b87fh		;a3b4
	ld de,0b880h		;a3b7
	ld bc,00005h		;a3ba
	ld (hl),030h		;a3bd
	ldir			;a3bf
	ld ix,0b87fh		;a3c1
	ld de,012b0h		;a3c5
	call L_D35B		;a3c8
	ld a,002h		;a3cb
	ld (0c45fh),a		;a3cd
	call L_A56B		;a3d0
	call L_AC1F		;a3d3
	call L_D383		;a3d6
	call L_BBE2		;a3d9
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
	call L_D35B		;a3f5
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
	call L_AC06		;a42b
	and 00fh		;a42e
	ld (ix+001h),a		;a430
	inc ix			;a433
	inc ix			;a435
	djnz L_A41F		;a437
L_A439:
	call L_B436		;a439
	ld hl,L_A580		;a43c
	ld (L_A57D+1),hl	;a43f
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
	call L_D238		;a483
	call L_A930		;a486
	call L_A56B		;a489
	call L_AC06		;a48c
	and 003h		;a48f
	ld l,a			;a491
	ld h,000h		;a492
	ld de,0c46ah		;a494
	add hl,de		;a497
	ld a,(hl)		;a498
	call L_D31C		;a499
	ld a,001h		;a49c
	ld (0ad30h),a		;a49e
L_A4A1:
	ld hl,0ad27h		;a4a1
	inc (hl)		;a4a4
	ld a,0c2h		;a4a5
	ld (0a98eh),a		;a4a7
	call L_A93E		;a4aa
	call L_B1DC		;a4ad
	ld a,0cah		;a4b0
	ld (0a98eh),a		;a4b2
	call L_A93E		;a4b5
	call L_AD76		;a4b8
	call L_BB32		;a4bb
	call L_A753		;a4be
	call L_BBA2		;a4c1
	call L_B9B0		;a4c4
	call L_AECE		;a4c7
	call L_B3F7		;a4ca
	xor a			;a4cd
	ld (0c462h),a		;a4ce
	ld a,(0a689h)		;a4d1
	cp 0eeh			;a4d4
	jr nz,L_A501		;a4d6
	call L_D30B		;a4d8
	jp nz,L_A2D5		;a4db
	ld a,(0ad27h)		;a4de
	and 008h		;a4e1
	jr z,L_A501		;a4e3
	ld a,0ffh		;a4e5
	ld (0b4aah),a		;a4e7
	ld (0b4b0h),a		;a4ea
	ld ix,0b9abh		;a4ed
	ld hl,04d94h		;a4f1
	call L_B4BC		;a4f4
	ld a,055h		;a4f7
	ld (0b4aah),a		;a4f9
	ld a,0aah		;a4fc
	ld (0b4b0h),a		;a4fe
L_A501:
	call L_A57D		;a501
	call L_D383		;a504
	ld ix,0b86ah		;a507
	ld a,(ix+00dh)		;a50b
	out (0aah),a		;a50e
	in a,(0a9h)		;a510
	and (ix+00ch)		;a512
	jp z,L_A2D2		;a515
	call L_A539		;a518
	ld a,(0a6edh)		;a51b
	cp 02dh			;a51e
	jr nc,L_A525		;a520
	jp L_A4A1		;a522
L_A525:
	ld a,(0c45fh)		;a525
	sub 001h		;a528
	ld (0c45fh),a		;a52a
	ld hl,L_A580		;a52d
	ld (L_A57D+1),hl	;a530
	jp c,L_A2D2		;a533
	jp L_A439		;a536
L_A539:
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
L_A56B:
	ld a,(0c45fh)		;a56b
	add a,030h		;a56e
	ld (0c45dh),a		;a570
	ld ix,0c45dh		;a573
	ld de,007a0h		;a577
	jp L_D35B		;a57a
L_A57D:
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
	call L_BC35		;a594
	ld a,(0a6edh)		;a597
	cp 01fh			;a59a
	ret nc			;a59c
	sub 007h		;a59d
	jr c,L_A5D0		;a59f
	push af			;a5a1
	jr nz,L_A5B3		;a5a2
	call L_D238		;a5a4
	ld a,002h		;a5a7
	ld de,0cda5h		;a5a9
	call L_C4D0		;a5ac
	call L_C49A		;a5af
	xor a			;a5b2
L_A5B3:
	cp 014h			;a5b3
	jr nz,L_A5C1		;a5b5
	xor a			;a5b7
	ld de,0ce1eh		;a5b8
	di			;a5bb
	call L_C4D1		;a5bc
	ld a,014h		;a5bf
L_A5C1:
	pop af			;a5c1
	rra			;a5c2
	add a,050h		;a5c3
	call 00000h		;a5c5   ; BIOS CHKRAM - Tests RAM and sets RAM slot for the system  [alias: STARTUP, RESET, BOOT]
	ld hl,(0a6ebh)		;a5c8
	ld a,060h		;a5cb
	jp L_AA07		;a5cd
L_A5D0:
	ld a,(0ad0eh)		;a5d0
	ld hl,(0a6ebh)		;a5d3
	ld bc,00202h		;a5d6
	call L_ABA3		;a5d9
	ld (0a6ebh),hl		;a5dc
	ld a,(0c469h)		;a5df
	call L_AB6F		;a5e2
	ld (0c469h),a		;a5e5
	and 007h		;a5e8
	ld hl,(0a6ebh)		;a5ea
	jp L_AA07		;a5ed

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
	call L_B18E		;a609
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
	call L_B18E		;a620
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
	call L_BC35		;a65f
	jp L_A5D0		;a662
L_A665:
	call L_B18E		;a665
	jr nz,L_A672		;a668
	ld a,004h		;a66a
	ld (0a6edh),a		;a66c
	jp L_A583		;a66f
L_A672:
	xor a			;a672
	ld (0c462h),a		;a673
	ld hl,(0a6ebh)		;a676
	ld (0a6e9h),hl		;a679
	ld a,(0ad2ah)		;a67c
	ld (0c466h),a		;a67f
	ld a,(0ad2ch)		;a682
	ld (0c467h),a		;a685
	call L_A6FC		;a688
	ld (0c45bh),a		;a68b
	call L_BA75		;a68e
	and 00fh		;a691
	call L_B0A1		;a693
	call L_AB98		;a696
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
	call L_AB6F		;a6aa
	ld (0ad0eh),a		;a6ad
	ld c,002h		;a6b0
	call L_A8BA		;a6b2
	call L_B0B7		;a6b5
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
	call L_AA07		;a6dc
	call L_BC35		;a6df
	ld hl,(0a6ebh)		;a6e2
	call L_B04B		;a6e5
	ret			;a6e8

; ----------------------------------------------------------------------
; DATOS tabla: (19 B; racha 2.71, entropia 2.80, 9 valores: pocos valores para ser un dibujo)
;   0xa6e9..0xa6fc  (19 bytes)
; ----------------------------------------------------------------------
	defb 000h,000h,000h,000h,000h,0ddh,02ah,060h,0c4h,0ddh,07eh,000h,0ddh,023h,0ddh,022h	; a6e9  ......*`..~..#."
	defb 060h,0c4h,0c9h	; a6f9  `..

; ======================================================================
; CODIGO 0xa6fc..0xab41  (1093 bytes)
; ======================================================================


L_A6FC:
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
L_A753:
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
	call L_AA07		;a776
	inc (ix+003h)		;a779
	ld a,(ix+003h)		;a77c
	cp 021h			;a77f
	jp nz,L_A88C		;a781
	jp L_A897		;a784
L_A787:
	ld b,(ix+001h)		;a787
	ld c,(ix+000h)		;a78a
	call L_AC06		;a78d
	bit 4,a			;a790
	jr z,L_A79B		;a792
	and 007h		;a794
	call L_AB92		;a796
	jr L_A7A2		;a799
L_A79B:
	ld de,(0a6ebh)		;a79b
	call L_ABCA		;a79f
L_A7A2:
	call L_B0C0		;a7a2
	call L_AB98		;a7a5
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
	call L_AB6F		;a7ca
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
	call L_ABA3		;a7e4
	call L_B0D8		;a7e7
	push hl			;a7ea
	push ix			;a7eb
	call L_B18E		;a7ed
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
	call L_AA07		;a83c
	ld a,(0b13fh)		;a83f
	xor (ix+002h)		;a842
	and 007h		;a845
	jr nz,L_A865		;a847
	ld a,(ix+002h)		;a849
	and 007h		;a84c
	ex af,af'		;a84e
	call L_AC06		;a84f
	and 01fh		;a852
	jr nz,L_A865		;a854
	ld a,(ix+000h)		;a856
	add a,004h		;a859
	ld c,a			;a85b
	ld a,(ix+001h)		;a85c
	add a,004h		;a85f
	ld b,a			;a861
	call L_AE15		;a862
L_A865:
	call L_AFC7		;a865
	ld a,(0a6edh)		;a868
	cp 004h			;a86b
	jr nc,L_A88C		;a86d
	ld l,(ix+000h)		;a86f
	ld h,(ix+001h)		;a872
	call L_B089		;a875
	jr c,L_A88C		;a878
	ld (ix+002h),0ffh	;a87a
	ld (ix+003h),01dh	;a87e
	xor a			;a882
	ld de,0cd6dh		;a883
	call L_C4D0		;a886
	call L_B11B		;a889
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
L_A8BA:
	push af			;a8ba
	and 007h		;a8bb
	call L_AB92		;a8bd
	ld h,a			;a8c0
	pop af			;a8c1
	rlca			;a8c2
	rlca			;a8c3
	rlca			;a8c4
	and 007h		;a8c5
	call L_AB92		;a8c7
	and h			;a8ca
	ld h,068h		;a8cb
	ret z			;a8cd
	ld b,002h		;a8ce
	call L_AB98		;a8d0
	call L_ABA3		;a8d3
	ld a,h			;a8d6
	ld h,068h		;a8d7
	cp h			;a8d9
	ret z			;a8da
L_A8DB:
	ld iy,0ad2ah		;a8db
	jr nc,L_A8FF		;a8df
	ld a,(iy+002h)		;a8e1
	cp 020h			;a8e4
	jr z,L_A8F0		;a8e6
	add a,002h		;a8e8
	ld (iy+002h),a		;a8ea
	jp L_B140		;a8ed
L_A8F0:
	ld a,(iy+000h)		;a8f0
	or a			;a8f3
	ret z			;a8f4
	ld (iy+002h),002h	;a8f5
	dec (iy+000h)		;a8f9
	jp L_B140		;a8fc
L_A8FF:
	ld a,(iy+002h)		;a8ff
	cp 002h			;a902
	jr z,L_A90E		;a904
	sub 002h		;a906
	ld (iy+002h),a		;a908
	jp L_B167		;a90b
L_A90E:
	ld a,(iy+000h)		;a90e
	cp 047h			;a911
	jr z,L_A91F		;a913
	ld (iy+002h),020h	;a915
	inc (iy+000h)		;a919
	jp L_B167		;a91c
L_A91F:
	ld a,(0bc33h)		;a91f
	and a			;a922
	ret nz			;a923
	ld a,(0a6ebh)		;a924
	cp 050h			;a927
	ret c			;a929
	cp 060h			;a92a
	ret nc			;a92c
	jp L_BDAC		;a92d
L_A930:
	ld hl,0d0f2h		;a930
	ld de,0d0f3h		;a933
	ld bc,0000dh		;a936
	ld (hl),000h		;a939
	ldir			;a93b
	ret			;a93d
L_A93E:
	ld iy,0ad2ah		;a93e
	ld (iy+003h),000h	;a942
	call L_A9F5		;a946
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
	jp z,L_A9E4		;a98e
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
	ldi			;a9ac
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
L_A9F5:
	ld ix,0840bh		;a9f5
	ld l,(iy+000h)		;a9f9
	ld h,000h		;a9fc
	ld d,h			;a9fe
	ld e,l			;a9ff
L_AA00:
	add hl,hl		;aa00
	add hl,de		;aa01
	add hl,hl		;aa02
	ex de,hl		;aa03
	add ix,de		;aa04
	ret			;aa06
L_AA07:
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
	call L_AACD		;aa37
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
L_AA51:
	ld a,h			;aa51
	ld h,l			;aa52
	ld l,0ffh		;aa53
	jp L_AA6D		;aa55
	adc hl,hl		;aa58
	adc a,a			;aa5a
	adc hl,hl		;aa5b
	adc a,a			;aa5d
	adc hl,hl		;aa5e
	adc a,a			;aa60
	adc hl,hl		;aa61
	adc a,a			;aa63
	adc hl,hl		;aa64
L_AA66:
	adc a,a			;aa66
	adc hl,hl		;aa67
	adc a,a			;aa69
	adc hl,hl		;aa6a
	adc a,a			;aa6c
L_AA6D:
	ex de,hl		;aa6d
	pop hl			;aa6e
	and (hl)		;aa6f
	ld (hl),a		;aa70
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
L_AA88:
	ld a,h			;aa88
	ld h,l			;aa89
	ld l,000h		;aa8a
	jp L_AAA4		;aa8c
L_AA8F:
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
L_AAA6:
	or (hl)			;aaa6
	ld (hl),a		;aaa7
L_AAA8:
	inc hl			;aaa8
	ld a,d			;aaa9
L_AAAA:
	or (hl)			;aaaa
	ld (hl),a		;aaab
L_AAAC:
	inc hl			;aaac
	ld a,e			;aaad
L_AAAE:
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
L_AABA:
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
L_AACD:
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
L_AADF:
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
	call L_AACD		;ab07
L_AB0A:
	ld a,h			;ab0a
	cp 04fh			;ab0b
	jr c,L_AB13		;ab0d
	inc de			;ab0f
	inc de			;ab10
	jr $+77			;ab11
L_AB13:
	push hl			;ab13
	ld a,(de)		;ab14
	ld h,0ffh		;ab15
	ld l,a			;ab17
	inc de			;ab18
	scf			;ab19
L_AB1A:
	jr L_AB1A		;ab1a
L_AB1C:
	ld h,l			;ab1c
	ld l,0ffh		;ab1d
	jp L_AB30		;ab1f
L_AB22:
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
	ld (hl),a		;ab34
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

; ----------------------------------------------------------------------
; DATOS tabla: (29 B; racha 1.57, entropia 3.36, 15 valores: pocos valores para ser un dibujo)
;   0xab41..0xab5e  (29 bytes)
; ----------------------------------------------------------------------
	defb 065h,02eh,000h,0c3h,055h,0abh,0edh,06ah,0edh,06ah,0edh,06ah,0edh,06ah,0edh,06ah	; ab41  e...U..j.j.j.j.j
	defb 0edh,06ah,0edh,06ah,07dh,04ch,0e1h,0b6h,077h,02bh,079h,0b6h,077h	; ab51  .j.j}L..w+y.w

; ======================================================================
; CODIGO 0xab5e..0xaca2  (324 bytes)
; ======================================================================


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
	djnz $-98		;ab6c
	ret			;ab6e
L_AB6F:
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
L_AB92:
	ld de,0ad0fh		;ab92
	jp L_AB9B		;ab95
L_AB98:
	ld de,0ad17h		;ab98
L_AB9B:
	push hl			;ab9b
	ld l,a			;ab9c
	ld h,000h		;ab9d
	add hl,de		;ab9f
	ld a,(hl)		;aba0
	pop hl			;aba1
	ret			;aba2
L_ABA3:
	push hl			;aba3
	call L_AB92		;aba4
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
L_ABCA:
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
L_AC06:
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
L_AC1F:
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
L_AC49:
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
	call L_AC06		;ac61
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
	call L_C4A3		;ac73
	scf			;ac76
	ret			;ac77
L_AC78:
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
	call L_C4A3		;ac9d
	scf			;aca0
	ret			;aca1

; ----------------------------------------------------------------------
; DATOS tabla: (143 B; racha 17.07, entropia 1.59, 14 valores: pocos valores para ser un dibujo)
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


L_AD31:
	ld (0b13eh),hl		;ad31
	call L_AC06		;ad34
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
L_AD76:
	ld ix,ladc4h		;ad76
	ld (ix+001h),004h	;ad7a
	ld (ix+002h),004h	;ad7e
	ld ix,0aca3h		;ad82
	ld hl,0acbbh		;ad86
	ld a,005h		;ad89
	call L_ADA3		;ad8b
	ld ix,ladc4h		;ad8e
	ld (ix+001h),00ah	;ad92
	ld (ix+002h),00ah	;ad96
	ld ix,0acbch		;ad9a
	ld hl,0ace0h		;ad9e
	ld a,004h		;ada1
L_ADA3:
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
	call L_ABA3		;adc7
	ld a,h			;adca
	cp 0c0h			;adcb
	jr nc,L_ADE8		;adcd
	ld a,l			;adcf
	cp 0bch			;add0
	jr nc,L_ADE8		;add2
	ld (ix+000h),l		;add4
	ld (ix+001h),h		;add7
	ld a,002h		;adda
	call L_AADF		;addc
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
L_AE15:
	ld hl,0aca2h		;ae15
	ld e,006h		;ae18
	exx			;ae1a
	ld h,001h		;ae1b
	ld de,0cd5fh		;ae1d
	jp L_AE2E		;ae20
L_AE23:
	ld hl,0acbbh		;ae23
	ld e,009h		;ae26
	exx			;ae28
	ld h,002h		;ae29
	ld de,0cd53h		;ae2b
L_AE2E:
	exx			;ae2e
	ld a,(hl)		;ae2f
	cp e			;ae30
	ret nc			;ae31
	exx			;ae32
	push af			;ae33
	ld a,h			;ae34
	call L_C4A3		;ae35
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
L_AE4C:
	ld (0b13eh),hl		;ae4c
	call L_AC06		;ae4f
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
L_AE95:
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
	call L_AC06		;aeb0
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
L_AEC2:
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
L_AECE:
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
	call L_AA07		;aef5
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
	call L_AE4C		;af29
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
	call L_AC06		;af4e
	and 03fh		;af51
	jr nz,L_AF69		;af53
	push hl			;af55
	ld bc,00404h		;af56
	add hl,bc		;af59
	ld b,h			;af5a
	ld c,l			;af5b
	push bc			;af5c
	call L_ABCA		;af5d
	call L_AB98		;af60
	ex af,af'		;af63
	pop bc			;af64
	call L_AE15		;af65
	pop hl			;af68
L_AF69:
	ld a,(ix+001h)		;af69
	add a,004h		;af6c
	push af			;af6e
	and 0c0h		;af6f
	rlca			;af71
	rlca			;af72
	add a,048h		;af73
	call L_AA07		;af75
	pop af			;af78
	xor 040h		;af79
	sub 004h		;af7b
	ld (ix+001h),a		;af7d
	call L_B01F		;af80
	ld a,(0a6edh)		;af83
	cp 004h			;af86
	jr nc,L_AF9C		;af88
	ld l,(ix+002h)		;af8a
	ld h,(ix+003h)		;af8d
	call L_B089		;af90
	jr c,L_AF9C		;af93
	ld (ix+004h),034h	;af95
	call L_B11B		;af99
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
L_AFAA:
	dec (hl)		;afaa
	pop bc			;afab
	push bc			;afac
	push de			;afad
L_AFAE:
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
L_AFC7:
	ld l,(ix+000h)		;afc7
	ld h,(ix+001h)		;afca
	ld iy,0acbch		;afcd
	ld de,0060eh		;afd1
	ld bc,00101h		;afd4
	call L_AFF7		;afd7
	ret c			;afda
	xor a			;afdb
	ld de,0cd6dh		;afdc
	call L_C4D0		;afdf
	ld (ix+002h),0ffh	;afe2
	ld (ix+003h),01dh	;afe6
	ld (iy+002h),080h	;afea
	ld hl,0b883h		;afee
	ld b,02ch		;aff1
	call L_D127		;aff3
	ret			;aff6
L_AFF7:
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
	call L_AEC2		;b004
	pop hl			;b007
	jr c,L_B014		;b008
	push hl			;b00a
	ld l,h			;b00b
	ld h,(iy+001h)		;b00c
	call L_AEC2		;b00f
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
L_B01F:
	ld l,(ix+002h)		;b01f
	ld h,(ix+003h)		;b022
	ld iy,0acbch		;b025
	ld de,0060eh		;b029
	ld bc,00101h		;b02c
	call L_AFF7		;b02f
	ret c			;b032
	xor a			;b033
	ld de,0cd6dh		;b034
	call L_C4D0		;b037
	ld (ix+004h),034h	;b03a
	ld (iy+002h),080h	;b03e
	ld hl,0b883h		;b042
	ld b,029h		;b045
	call L_D127		;b047
	ret			;b04a
L_B04B:
	ld hl,(0a6ebh)		;b04b
	ld iy,0aca3h		;b04e
	ld de,0040ah		;b052
	ld bc,00203h		;b055
	call L_AFF7		;b058
	ret c			;b05b
	ld (iy+002h),080h	;b05c
	call L_B0E0		;b060
	ret			;b063
L_B064:
	ld l,(ix+002h)		;b064
	ld h,(ix+003h)		;b067
	ld iy,0acbch		;b06a
	ld de,00408h		;b06e
	ld bc,00200h		;b071
	call L_AFF7		;b074
	ret c			;b077
	ld (ix+000h),07ch	;b078
	ld (iy+002h),080h	;b07c
	ld hl,0b884h		;b080
	ld b,035h		;b083
	call L_D127		;b085
	ret			;b088
L_B089:
	push hl			;b089
	ld a,(0a6ech)		;b08a
	ld l,a			;b08d
	ld bc,00203h		;b08e
	ld de,00c0ah		;b091
	call L_AEC2		;b094
	pop hl			;b097
	ret c			;b098
	ld h,l			;b099
	ld a,(0a6ebh)		;b09a
	ld l,a			;b09d
	jp L_AEC2		;b09e
L_B0A1:
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
L_B0B7:
	ld a,l			;b0b7
	cp 0b1h			;b0b8
	ret c			;b0ba
	ld a,(0a6ebh)		;b0bb
	ld l,a			;b0be
	ret			;b0bf
L_B0C0:
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
L_B0D8:
	ld a,l			;b0d8
	cp 0b1h			;b0d9
	ret c			;b0db
	ld l,(ix+000h)		;b0dc
	ret			;b0df
L_B0E0:
	ld a,(0a6edh)		;b0e0
	and a			;b0e3
	jr z,L_B11B		;b0e4
	dec a			;b0e6
	ld (0a6edh),a		;b0e7
	jr L_B0F9		;b0ea
L_B0EC:
	ld a,(0a6edh)		;b0ec
	and a			;b0ef
	jr z,L_B11B		;b0f0
	dec a			;b0f2
	jr z,L_B11B		;b0f3
	dec a			;b0f5
	ld (0a6edh),a		;b0f6
L_B0F9:
	ld hl,02f50h		;b0f9
	xor 003h		;b0fc
	ld c,011h		;b0fe
	push af			;b100
	call L_B458		;b101
	pop af			;b104
	dec a			;b105
	ret z			;b106
	ld hl,02f48h		;b107
	ld c,011h		;b10a
	push af			;b10c
	call L_B458		;b10d
	pop af			;b110
	dec a			;b111
	ret z			;b112
	ld hl,02f40h		;b113
	ld c,011h		;b116
	jp L_B458		;b118
L_B11B:
	ld hl,02778h		;b11b
	call L_D136		;b11e
	ld a,004h		;b121
	ld (0a6edh),a		;b123
	ld a,05bh		;b126
	ld (0ad0eh),a		;b128
	xor a			;b12b
	ld de,0cd6dh		;b12c
	call L_C4D0		;b12f
	ld hl,0b268h		;b132
	ld (0a57eh),hl		;b135
	ld hl,02f48h		;b138
	jp L_D136		;b13b

; ----------------------------------------------------------------------
; DATOS relleno: o resto (2 B; 2 bytes)
;   0xb13e..0xb140  (2 bytes)
; ----------------------------------------------------------------------
	defb 000h,000h	; b13e  ..

; ======================================================================
; CODIGO 0xb140..0xb2a6  (358 bytes)
; ======================================================================


L_B140:
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
L_B167:
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
L_B18E:
	ld a,h			;b18e
	ld iy,0ad2ah		;b18f
	add a,028h		;b193
	sub (iy+002h)		;b195
	ld h,a			;b198
	ld a,l			;b199
	add a,008h		;b19a
	ld l,a			;b19c
	push hl			;b19d
	call L_A9F5		;b19e
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
L_B1BE:
	call L_B18E		;b1be
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
L_B1DC:
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
	call L_B1BE		;b20f
	pop ix			;b212
	pop bc			;b214
	pop hl			;b215
	jr nc,L_B21D		;b216
	inc (ix+004h)		;b218
	jr L_B25D		;b21b
L_B21D:
	ld de,06858h		;b21d
	call L_AE4C		;b220
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
	call L_AA07		;b252
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
L_B268:
	ld hl,(0a6ebh)		;b268
	ld a,(0a6edh)		;b26b
	inc a			;b26e
	ld (0a6edh),a		;b26f
	sub 00ch		;b272
	add a,h			;b274
	push af			;b275
	push hl			;b276
	call nc,L_BC35		;b277
	pop hl			;b27a
	pop af			;b27b
	push af			;b27c
	cp 0c4h			;b27d
	jp nc,L_B2A4		;b27f
	ld h,a			;b282
	ld (0a6ebh),hl		;b283
	ld a,(0ad0eh)		;b286
	and 007h		;b289
	call L_AA07		;b28b
	ld hl,(0a6ebh)		;b28e
	ld h,068h		;b291
	ld a,(0ad0eh)		;b293
	inc a			;b296
	ld (0ad0eh),a		;b297
	cp 060h			;b29a
	call c,L_AA07		;b29c
	pop af			;b29f
	call c,L_BC35		;b2a0
	ret			;b2a3
L_B2A4:
	pop af			;b2a4
	ret			;b2a5

; ----------------------------------------------------------------------
; DATOS datos: sin clasificar (262 B; racha 2.14, entropia 5.31, 64 valores)
;   0xb2a6..0xb3ac  (262 bytes)
; ----------------------------------------------------------------------
	defb 026h,000h,06fh,029h,029h,029h,029h,029h,029h,011h,055h,065h,019h,011h,004h,000h	; b2a6  &.o)))))).Ue....
	defb 0fdh,021h,055h,07dh,0cdh,0d2h,0b2h,023h,0fdh,021h,075h,07dh,0cdh,0d2h,0b2h,023h	; b2b6  .!U}...#.!u}...#
	defb 0fdh,021h,057h,07dh,0cdh,0d2h,0b2h,023h,0fdh,021h,077h,07dh,0e5h,00eh,002h,006h	; b2c6  .!W}...#.!w}....
	defb 008h,07eh,007h,0fdh,0cbh,001h,01eh,007h,0fdh,0cbh,005h,01eh,007h,0fdh,0cbh,009h	; b2d6  .~..............
	defb 01eh,007h,0fdh,0cbh,00dh,01eh,007h,0fdh,0cbh,011h,01eh,007h,0fdh,0cbh,015h,01eh	; b2e6  ................
	defb 007h,0fdh,0cbh,019h,01eh,007h,0fdh,0cbh,01dh,01eh,019h,010h,0d4h,0fdh,02bh,00dh	; b2f6  ..............+.
	defb 020h,0cdh,0e1h,0c9h,026h,000h,06fh,029h,029h,029h,029h,029h,029h,011h,055h,065h	; b306   ...&.o)))))).Ue
	defb 019h,011h,004h,000h,0fdh,021h,075h,07dh,0cdh,036h,0b3h,023h,0fdh,021h,055h,07dh	; b316  .....!u}.6.#.!U}
	defb 0cdh,036h,0b3h,023h,0fdh,021h,077h,07dh,0cdh,036h,0b3h,023h,0fdh,021h,057h,07dh	; b326  .6.#.!w}.6.#.!W}
	defb 0e5h,00eh,002h,006h,008h,07eh,00fh,0fdh,0cbh,000h,016h,00fh,0fdh,0cbh,004h,016h	; b336  .....~..........
	defb 00fh,0fdh,0cbh,008h,016h,00fh,0fdh,0cbh,00ch,016h,00fh,0fdh,0cbh,010h,016h,00fh	; b346  ................
	defb 0fdh,0cbh,014h,016h,00fh,0fdh,0cbh,018h,016h,00fh,0fdh,0cbh,01ch,016h,019h,010h	; b356  ................
	defb 0d4h,0fdh,023h,00dh,020h,0cdh,0e1h,0c9h,026h,000h,06fh,029h,029h,029h,029h,029h	; b366  ..#. ...&.o)))))
	defb 029h,011h,055h,065h,019h,03eh,010h,0edh,073h,093h,0b3h,0f9h,021h,094h,07dh,0d1h	; b376  ).Ue.>..s...!.}.
	defb 0c1h,070h,02bh,071h,02bh,072h,02bh,073h,02bh,03dh,020h,0f3h,031h,000h,000h,0c9h	; b386  .p+q+r+s+= .1...
	defb 026h,000h,06fh,029h,029h,029h,029h,029h,029h,011h,055h,065h,019h,011h,055h,07dh	; b396  &.o)))))).Ue..U}
	defb 001h,040h,000h,0edh,0b0h,0c9h	; b3a6  .@....

; ======================================================================
; CODIGO 0xb3ac..0xb51b  (367 bytes)
; ======================================================================


L_B3AC:
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
	call L_D35B		;b3c2
	pop de			;b3c5
	ld a,(0b880h)		;b3c6
	cp d			;b3c9
	ret z			;b3ca
	ld a,080h		;b3cb
	ld de,0cdb1h		;b3cd
	call L_C4D0		;b3d0
	inc a			;b3d3
	ld de,0cdd0h		;b3d4
	call L_C4D0		;b3d7
	inc a			;b3da
	ld de,0cdech		;b3db
	call L_C4D0		;b3de
	call L_C49A		;b3e1
	ld a,(0a6edh)		;b3e4
	cp 002h			;b3e7
	jp c,L_B436		;b3e9
	ld hl,0c45fh		;b3ec
	ld a,(hl)		;b3ef
	cp 009h			;b3f0
	ret nc			;b3f2
	inc (hl)		;b3f3
	jp L_A56B		;b3f4
L_B3F7:
	call L_AC06		;b3f7
	and 003h		;b3fa
	ret nz			;b3fc
	ld a,(0b720h)		;b3fd
	and a			;b400
	ret nz			;b401
L_B402:
	call L_AC06		;b402
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
	call L_AE95		;b420
	ret c			;b423
L_B424:
	ld h,b			;b424
	ld l,c			;b425
	call L_B18E		;b426
	ret z			;b429
	ld a,b			;b42a
	cp 0c0h			;b42b
	ld a,004h		;b42d
	jr nz,L_B432		;b42f
	xor a			;b431
L_B432:
	ex af,af'		;b432
	jp L_AC49		;b433
L_B436:
	ld a,003h		;b436
	ld (0a6edh),a		;b438
	ld hl,02778h		;b43b
	ld c,0f9h		;b43e
	call L_B458		;b440
	ld hl,02f40h		;b443
	ld c,0f5h		;b446
	call L_B458		;b448
	ld hl,02f48h		;b44b
	ld c,0f5h		;b44e
	call L_B458		;b450
	ld hl,02f50h		;b453
	ld c,0f1h		;b456
L_B458:
	call L_D117		;b458
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
	call L_D117		;b46a
	dec c			;b46d
	jr nz,L_B45E		;b46e
	ei			;b470
	ret			;b471
L_B472:
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
L_B4BC:
	ld a,(ix+000h)		;b4bc
	inc ix			;b4bf
	and a			;b4c1
	ret z			;b4c2
	call L_B472		;b4c3
	inc hl			;b4c6
	jp L_B4BC		;b4c7
L_B4CA:
	ld ix,0b886h		;b4ca
	ld de,000c8h		;b4ce
	call L_BB18		;b4d1
	call L_BB0A		;b4d4
	ld de,003c2h		;b4d7
	call L_BB18		;b4da
	call L_BB0A		;b4dd
	ld de,006c2h		;b4e0
	call L_BB18		;b4e3
	call L_B4BC		;b4e6
	ld de,009c2h		;b4e9
	call L_BB18		;b4ec
	call L_B4BC		;b4ef
	ld de,00cc2h		;b4f2
	call L_BB18		;b4f5
	call L_B4BC		;b4f8
	ld a,(0b87ch)		;b4fb
	and a			;b4fe
	jr z,L_B50E		;b4ff
	ld ix,0b8b7h		;b501
	ld de,009c2h		;b505
	call L_BB18		;b508
	jp L_B4BC		;b50b
L_B50E:
	ld ix,0b8c0h		;b50e
	ld de,00cc2h		;b512
	call L_BB18		;b515
	jp L_B4BC		;b518

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


L_B65B:
	ld hl,(0b87dh)		;b65b
	ld de,00018h		;b65e
	and a			;b661
	sbc hl,de		;b662
	ld a,h			;b664
	cp 040h			;b665
	jp c,L_B6A7		;b667
	ld (0b87dh),hl		;b66a
	ld ix,0b886h		;b66d
	call L_B4BC		;b671
	ld de,00235h		;b674
	add hl,de		;b677
	ld ix,0b8c8h		;b678
	ld de,00172h		;b67c
	ld b,008h		;b67f
L_B681:
	push bc			;b681
	push de			;b682
	call L_B4BC		;b683
	pop de			;b686
	add hl,de		;b687
	pop bc			;b688
	djnz L_B681		;b689
	ret			;b68b
L_B68C:
	ld hl,04f08h		;b68c
	ld (0b87dh),hl		;b68f
L_B692:
	call L_AC1F		;b692
	call L_BB1D		;b695
	call L_B65B		;b698
	call L_D383		;b69b
	call L_D30B		;b69e
	jp nz,L_A2D5		;b6a1
	jp L_B692		;b6a4
L_B6A7:
	pop hl			;b6a7
	call L_C483		;b6a8
	nop			;b6ab
	nop			;b6ac
	nop			;b6ad
	xor a			;b6ae
	ld (0d10dh),a		;b6af
L_B6B2:
	call L_D30B		;b6b2
	jr nz,L_B6C4		;b6b5
	ld bc,003e8h		;b6b7
	call L_B71A		;b6ba
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
L_B6D3:
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
L_B71A:
	dec bc			;b71a
	ld a,b			;b71b
	or c			;b71c
	jr nz,L_B71A		;b71d
	ret			;b71f

; ----------------------------------------------------------------------
; DATOS datos: sin clasificar (656 B; racha 2.44, entropia 4.76, 77 valores)
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


L_B9B0:
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
	cp 07ch			;b9cd
	jr c,L_B9E9		;b9cf
	ex de,hl		;b9d1
	ld bc,00404h		;b9d2
	sbc hl,bc		;b9d5
	sub 03ah		;b9d7
	call L_AA07		;b9d9
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
	call L_AD31		;b9f4
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
	call L_AADF		;ba12
	call L_B064		;ba15
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
	call L_AEC2		;ba30
	pop hl			;ba33
	jr c,L_BA47		;ba34
	ld h,l			;ba36
	ld a,(0a6ebh)		;ba37
	ld l,a			;ba3a
	call L_AEC2		;ba3b
	jr c,L_BA47		;ba3e
	call L_B0EC		;ba40
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
L_BA75:
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
	call L_AE23		;ba96
	add a,002h		;ba99
	and 007h		;ba9b
	ex af,af'		;ba9d
	ld a,(0c459h)		;ba9e
	and a			;baa1
	jr z,L_BAB7		;baa2
	call L_AE23		;baa4
	add a,002h		;baa7
	and 007h		;baa9
	ex af,af'		;baab
	call L_AE23		;baac
	add a,002h		;baaf
	and 007h		;bab1
	ex af,af'		;bab3
	call L_AE23		;bab4
L_BAB7:
	pop hl			;bab7
	pop af			;bab8
	ret			;bab9
L_BABA:
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
L_BB0A:
	ld a,(ix+000h)		;bb0a
	inc ix			;bb0d
	and a			;bb0f
	ret z			;bb10
	call L_BABA		;bb11
	inc hl			;bb14
	jp L_BB0A		;bb15
L_BB18:
	ld hl,(0c463h)		;bb18
	add hl,de		;bb1b
	ret			;bb1c
L_BB1D:
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
L_BB32:
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
	call L_AC78		;bb57
	pop hl			;bb5a
	bit 3,(ix+001h)		;bb5b
	jr z,L_BB9A		;bb5f
	push hl			;bb61
	ld a,003h		;bb62
	call L_AADF		;bb64
	pop hl			;bb67
	ld iy,0acbch		;bb68
	ld de,00408h		;bb6c
	ld bc,00200h		;bb6f
	call L_AFF7		;bb72
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
	call L_D127		;bb93
	ld hl,0bc33h		;bb96
	dec (hl)		;bb99
L_BB9A:
	inc ix			;bb9a
	inc ix			;bb9c
	pop bc			;bb9e
	djnz L_BB3D		;bb9f
	ret			;bba1
L_BBA2:
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
	jp z,L_BCEE		;bbb6
	xor a			;bbb9
	ld de,0cd9ch		;bbba
	call L_C4A3		;bbbd
	ld hl,(0bc31h)		;bbc0
	call L_D117		;bbc3
	ld a,07eh		;bbc6
	out (098h),a		;bbc8
	ei			;bbca
	call L_BBD2		;bbcb
	ld (0bc31h),hl		;bbce
	ret			;bbd1
L_BBD2:
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
L_BBE2:
	ld bc,03098h		;bbe2
	ld hl,00050h		;bbe5
	call L_BBF8		;bbe8
	ld b,040h		;bbeb
	ld hl,00840h		;bbed
	call L_BBF8		;bbf0
	ld b,030h		;bbf3
	ld hl,01040h		;bbf5
L_BBF8:
	call L_D117		;bbf8
L_BBFB:
	ld a,000h		;bbfb
	out (c),a		;bbfd
	nop			;bbff
	djnz L_BBFB		;bc00
	ld bc,03098h		;bc02
	ld hl,02050h		;bc05
	call L_BC18		;bc08
	ld b,040h		;bc0b
	ld hl,02840h		;bc0d
	call L_BC18		;bc10
	ld b,030h		;bc13
	ld hl,03040h		;bc15
L_BC18:
	call L_D117		;bc18
L_BC1B:
	ld a,0f1h		;bc1b
	out (c),a		;bc1d
	nop			;bc1f
	djnz L_BC1B		;bc20
	ei			;bc22
	ret			;bc23

; ----------------------------------------------------------------------
; DATOS tabla: (17 B; racha 68.00, entropia 0.87, 2 valores: pocos valores para ser un dibujo)
;   0xbc24..0xbc35  (17 bytes)
; ----------------------------------------------------------------------
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h	; bc24  ................
	defb 000h	; bc34  .

; ======================================================================
; CODIGO 0xbc35..0xbdaa  (373 bytes)
; ======================================================================


L_BC35:
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
	call L_AACD		;bc58
	ld a,c			;bc5b
	sub 0a0h		;bc5c
	neg			;bc5e
L_BC60:
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
L_BCEE:
	ld hl,0bdaah		;bcee
	ld (hl),07eh		;bcf1
	inc hl			;bcf3
	ld (hl),07eh		;bcf4
	ld a,002h		;bcf6
	ld de,0ce07h		;bcf8
	call L_C4D0		;bcfb
	ld b,014h		;bcfe
L_BD00:
	push bc			;bd00
	ld de,02a54h		;bd01
	call L_BD7B		;bd04
	ld de,0542ah		;bd07
	call L_BD7B		;bd0a
	pop bc			;bd0d
	djnz L_BD00		;bd0e
	ld hl,0bdaah		;bd10
	ld (hl),07eh		;bd13
	inc hl			;bd15
	ld (hl),07eh		;bd16
	ld a,002h		;bd18
	ld de,0ce11h		;bd1a
	call L_C4D0		;bd1d
	ld bc,0005ah		;bd20
L_BD23:
	call L_AC06		;bd23
	xor b			;bd26
	xor c			;bd27
	cp 0a0h			;bd28
	jr c,L_BD2E		;bd2a
	sub 080h		;bd2c
L_BD2E:
	add a,008h		;bd2e
	ld d,a			;bd30
	call L_AC06		;bd31
	xor b			;bd34
	xor c			;bd35
	and 01fh		;bd36
	cp 018h			;bd38
	jr c,L_BD3E		;bd3a
	sub 010h		;bd3c
L_BD3E:
	add a,004h		;bd3e
	ld e,a			;bd40
	call L_D472		;bd41
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
	call L_AC06		;bd54
	and e			;bd57
	ld e,a			;bd58
	call L_D117		;bd59
	ld a,e			;bd5c
	out (098h),a		;bd5d
	ei			;bd5f
	call L_AC06		;bd60
	and 018h		;bd63
	nop			;bd65
	call L_AC06		;bd66
	call L_AC06		;bd69
	and 007h		;bd6c
	inc a			;bd6e
L_BD6F:
	dec a			;bd6f
	jp nz,L_BD6F		;bd70
	djnz L_BD23		;bd73
	dec c			;bd75
	jr nz,L_BD23		;bd76
	jp L_A2D2		;bd78
L_BD7B:
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
	call L_BD9C		;bd8c
	ld b,020h		;bd8f
	ld hl,00840h		;bd91
	call L_BD9C		;bd94
	ld b,018h		;bd97
	ld hl,01040h		;bd99
L_BD9C:
	call L_D117		;bd9c
	ld a,d			;bd9f
	out (098h),a		;bda0
	ld a,e			;bda2
	inc hl			;bda3
	out (098h),a		;bda4
	ei			;bda6
	djnz L_BD9C		;bda7
	ret			;bda9

; ----------------------------------------------------------------------
; DATOS relleno: o resto (2 B; 2 bytes)
;   0xbdaa..0xbdac  (2 bytes)
; ----------------------------------------------------------------------
	defb 000h,000h	; bdaa  ..

; ======================================================================
; CODIGO 0xbdac..0xbfeb  (575 bytes)
; ======================================================================


L_BDAC:
	ld hl,04638h		;bdac
	ld (0a6ebh),hl		;bdaf
	ld a,0dah		;bdb2
	ld (0a98eh),a		;bdb4
	xor a			;bdb7
	ld de,0cd80h		;bdb8
	call L_C4D0		;bdbb
	ld b,010h		;bdbe
L_BDC0:
	push bc			;bdc0
	call L_BE06		;bdc1
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
	call L_BE06		;bddb
	ld hl,0ad27h		;bdde
	inc (hl)		;bde1
	ld a,(0c468h)		;bde2
	rrca			;bde5
L_BDE6:
	push af			;bde6
	scf			;bde7
	call L_A8DB		;bde8
	pop af			;bdeb
	dec a			;bdec
	jr nz,L_BDE6		;bded
	ld a,(0ad2ah)		;bdef
	and a			;bdf2
	pop bc			;bdf3
	jr z,L_BE15		;bdf4
	djnz L_BDDA		;bdf6
	ld a,(0c468h)		;bdf8
	cp 010h			;bdfb
	jr z,L_BDD8		;bdfd
	inc a			;bdff
	inc a			;be00
	ld (0c468h),a		;be01
	jr L_BDD8		;be04
L_BE06:
	call L_A93E		;be06
	ld hl,(0a6ebh)		;be09
	ld a,040h		;be0c
	call L_BC60		;be0e
	call L_D383		;be11
	ret			;be14
L_BE15:
	ld iy,01388h		;be15
	ld ix,061d8h		;be19
	call L_D238		;be1d
	ld a,0f1h		;be20
	call L_D31C		;be22
	call L_AC1F		;be25
	call L_BB1D		;be28
	call L_C421		;be2b
	call L_D383		;be2e
	ld bc,00000h		;be31
	call L_B71A		;be34
	call L_B71A		;be37
	call L_B71A		;be3a
	call L_B71A		;be3d
	xor a			;be40
	ld de,0cd8fh		;be41
	call L_C4D0		;be44
L_BE47:
	call L_AC1F		;be47
	call L_BB1D		;be4a
	call L_C421		;be4d
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
	call L_AADF		;be6d
	call L_D383		;be70
	jp L_BE47		;be73
L_BE76:
	ld bc,00000h		;be76
	call L_B71A		;be79
	call L_B71A		;be7c
	call L_B71A		;be7f
	call L_B71A		;be82
	ld hl,001d0h		;be85
	ld ix,0c33bh		;be88
	call L_D20E		;be8c
	ld e,00fh		;be8f
L_BE91:
	ld bc,00000h		;be91
	call L_B71A		;be94
	dec e			;be97
	jr nz,L_BE91		;be98
	call L_BFB6		;be9a
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
	call L_AC1F		;beba
	call L_BB1D		;bebd
	call L_C421		;bec0
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
	call L_C4D0		;bee5
	pop bc			;bee8
	call L_C3DC		;bee9
	ld a,h			;beec
	sub 008h		;beed
	ld h,a			;beef
	call L_AC06		;bef0
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
	call L_AA07		;bf0f
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
	call L_D383		;bf30
	pop bc			;bf33
	inc iy			;bf34
	dec b			;bf36
	jp nz,L_BEB9		;bf37
	ld a,002h		;bf3a
	ld de,0ce11h		;bf3c
	call L_C4D0		;bf3f
	call L_C407		;bf42
	ld b,06eh		;bf45
L_BF47:
	push bc			;bf47
	call L_AC1F		;bf48
	call L_BB1D		;bf4b
	call L_BF6F		;bf4e
	call L_D383		;bf51
	pop bc			;bf54
	djnz L_BF47		;bf55
	call L_AC1F		;bf57
	call L_BB1D		;bf5a
	call L_D383		;bf5d
	ld bc,00000h		;bf60
	call L_B71A		;bf63
	call L_B71A		;bf66
	call L_B71A		;bf69
	jp L_A2D2		;bf6c
L_BF6F:
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
	call L_AACD		;bf98
	ld de,00018h		;bf9b
	ld b,004h		;bf9e
L_BFA0:
	call L_AC06		;bfa0
	and 03ch		;bfa3
	ld (hl),a		;bfa5
	and 018h		;bfa6
	out (0feh),a		;bfa8
	add hl,de		;bfaa
	djnz L_BFA0		;bfab
L_BFAD:
	ld de,00004h		;bfad
	add ix,de		;bfb0
	dec c			;bfb2
	jr nz,L_BF75		;bfb3
	ret			;bfb5
L_BFB6:
	ld ix,0bfebh		;bfb6
	ld b,0c8h		;bfba
L_BFBC:
	call L_C3DC		;bfbc
L_BFBF:
	call L_AC06		;bfbf
	and 00fh		;bfc2
	sub 007h		;bfc4
	jr z,L_BFBF		;bfc6
	ld (ix+000h),a		;bfc8
L_BFCB:
	call L_AC06		;bfcb
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
; ----------------------------------------------------------------------
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bfeb  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; bffb  ......

; ======================================================================
; CODIGO 0xc001..0xc459  (1112 bytes)
; ======================================================================


L_C001:
	rst 38h			;c001
	rst 38h			;c002
	rst 38h			;c003
	rst 38h			;c004
	rst 38h			;c005
	rst 38h			;c006
	rst 38h			;c007
	rst 38h			;c008
	rst 38h			;c009
	rst 38h			;c00a
	rst 38h			;c00b
	rst 38h			;c00c
	rst 38h			;c00d
	rst 38h			;c00e
	rst 38h			;c00f
	rst 38h			;c010
	rst 38h			;c011
	rst 38h			;c012
	rst 38h			;c013
	rst 38h			;c014
	rst 38h			;c015
	rst 38h			;c016
	rst 38h			;c017
	rst 38h			;c018
	rst 38h			;c019
	rst 38h			;c01a
	rst 38h			;c01b
	rst 38h			;c01c
	rst 38h			;c01d
	rst 38h			;c01e
	rst 38h			;c01f
	rst 38h			;c020
	rst 38h			;c021
	rst 38h			;c022
	rst 38h			;c023
	rst 38h			;c024
	rst 38h			;c025
	rst 38h			;c026
	rst 38h			;c027
	rst 38h			;c028
	rst 38h			;c029
	rst 38h			;c02a
	rst 38h			;c02b
	rst 38h			;c02c
	rst 38h			;c02d
	rst 38h			;c02e
	rst 38h			;c02f
	rst 38h			;c030
	rst 38h			;c031
	rst 38h			;c032
	rst 38h			;c033
	rst 38h			;c034
	rst 38h			;c035
	rst 38h			;c036
	rst 38h			;c037
	rst 38h			;c038
	rst 38h			;c039
	rst 38h			;c03a
	rst 38h			;c03b
	rst 38h			;c03c
	rst 38h			;c03d
	rst 38h			;c03e
	rst 38h			;c03f
	rst 38h			;c040
	rst 38h			;c041
	rst 38h			;c042
	rst 38h			;c043
	rst 38h			;c044
	rst 38h			;c045
	rst 38h			;c046
	rst 38h			;c047
	rst 38h			;c048
	rst 38h			;c049
	rst 38h			;c04a
	rst 38h			;c04b
	rst 38h			;c04c
	rst 38h			;c04d
	rst 38h			;c04e
	rst 38h			;c04f
	rst 38h			;c050
	rst 38h			;c051
	rst 38h			;c052
	rst 38h			;c053
	rst 38h			;c054
	rst 38h			;c055
	rst 38h			;c056
	rst 38h			;c057
	rst 38h			;c058
	rst 38h			;c059
	rst 38h			;c05a
	rst 38h			;c05b
	rst 38h			;c05c
	rst 38h			;c05d
	rst 38h			;c05e
	rst 38h			;c05f
	rst 38h			;c060
	rst 38h			;c061
	rst 38h			;c062
	rst 38h			;c063
	rst 38h			;c064
	rst 38h			;c065
	rst 38h			;c066
	rst 38h			;c067
	rst 38h			;c068
	rst 38h			;c069
	rst 38h			;c06a
	rst 38h			;c06b
	rst 38h			;c06c
	rst 38h			;c06d
	rst 38h			;c06e
	rst 38h			;c06f
	rst 38h			;c070
	rst 38h			;c071
	rst 38h			;c072
	rst 38h			;c073
	rst 38h			;c074
	rst 38h			;c075
	rst 38h			;c076
	rst 38h			;c077
	rst 38h			;c078
	rst 38h			;c079
	rst 38h			;c07a
	rst 38h			;c07b
	rst 38h			;c07c
	rst 38h			;c07d
	rst 38h			;c07e
	rst 38h			;c07f
	rst 38h			;c080
	rst 38h			;c081
	rst 38h			;c082
	rst 38h			;c083
	rst 38h			;c084
	rst 38h			;c085
	rst 38h			;c086
	rst 38h			;c087
	rst 38h			;c088
	rst 38h			;c089
	rst 38h			;c08a
	rst 38h			;c08b
	rst 38h			;c08c
	rst 38h			;c08d
	rst 38h			;c08e
	rst 38h			;c08f
	rst 38h			;c090
	rst 38h			;c091
	rst 38h			;c092
	rst 38h			;c093
	rst 38h			;c094
	rst 38h			;c095
	rst 38h			;c096
	rst 38h			;c097
	rst 38h			;c098
	rst 38h			;c099
	rst 38h			;c09a
	rst 38h			;c09b
	rst 38h			;c09c
	rst 38h			;c09d
	rst 38h			;c09e
	rst 38h			;c09f
	rst 38h			;c0a0
	rst 38h			;c0a1
	rst 38h			;c0a2
	rst 38h			;c0a3
	rst 38h			;c0a4
	rst 38h			;c0a5
	rst 38h			;c0a6
	rst 38h			;c0a7
	rst 38h			;c0a8
	rst 38h			;c0a9
	rst 38h			;c0aa
	rst 38h			;c0ab
	rst 38h			;c0ac
	rst 38h			;c0ad
	rst 38h			;c0ae
	rst 38h			;c0af
	rst 38h			;c0b0
	rst 38h			;c0b1
	rst 38h			;c0b2
	rst 38h			;c0b3
	rst 38h			;c0b4
	rst 38h			;c0b5
	rst 38h			;c0b6
	rst 38h			;c0b7
	rst 38h			;c0b8
	rst 38h			;c0b9
	rst 38h			;c0ba
	rst 38h			;c0bb
	rst 38h			;c0bc
	rst 38h			;c0bd
	rst 38h			;c0be
	rst 38h			;c0bf
	rst 38h			;c0c0
	rst 38h			;c0c1
	rst 38h			;c0c2
	rst 38h			;c0c3
	rst 38h			;c0c4
	rst 38h			;c0c5
	rst 38h			;c0c6
	rst 38h			;c0c7
	rst 38h			;c0c8
	rst 38h			;c0c9
	rst 38h			;c0ca
	rst 38h			;c0cb
	rst 38h			;c0cc
	rst 38h			;c0cd
	rst 38h			;c0ce
	rst 38h			;c0cf
	rst 38h			;c0d0
	rst 38h			;c0d1
	rst 38h			;c0d2
	rst 38h			;c0d3
	rst 38h			;c0d4
	rst 38h			;c0d5
	rst 38h			;c0d6
	rst 38h			;c0d7
	rst 38h			;c0d8
	rst 38h			;c0d9
	rst 38h			;c0da
	rst 38h			;c0db
	rst 38h			;c0dc
	rst 38h			;c0dd
	rst 38h			;c0de
	rst 38h			;c0df
	rst 38h			;c0e0
	rst 38h			;c0e1
	rst 38h			;c0e2
	rst 38h			;c0e3
	rst 38h			;c0e4
	rst 38h			;c0e5
	rst 38h			;c0e6
	rst 38h			;c0e7
	rst 38h			;c0e8
	rst 38h			;c0e9
	rst 38h			;c0ea
	rst 38h			;c0eb
	rst 38h			;c0ec
	rst 38h			;c0ed
	rst 38h			;c0ee
	rst 38h			;c0ef
	rst 38h			;c0f0
	rst 38h			;c0f1
	rst 38h			;c0f2
	rst 38h			;c0f3
	rst 38h			;c0f4
	rst 38h			;c0f5
	rst 38h			;c0f6
	rst 38h			;c0f7
	rst 38h			;c0f8
	rst 38h			;c0f9
	rst 38h			;c0fa
	rst 38h			;c0fb
	rst 38h			;c0fc
	rst 38h			;c0fd
	rst 38h			;c0fe
	rst 38h			;c0ff
	rst 38h			;c100
	rst 38h			;c101
	rst 38h			;c102
	rst 38h			;c103
	rst 38h			;c104
	rst 38h			;c105
	rst 38h			;c106
	rst 38h			;c107
	rst 38h			;c108
	rst 38h			;c109
	rst 38h			;c10a
	rst 38h			;c10b
	rst 38h			;c10c
	rst 38h			;c10d
	rst 38h			;c10e
	rst 38h			;c10f
	rst 38h			;c110
	rst 38h			;c111
	rst 38h			;c112
	rst 38h			;c113
	rst 38h			;c114
	rst 38h			;c115
	rst 38h			;c116
	rst 38h			;c117
	rst 38h			;c118
	rst 38h			;c119
	rst 38h			;c11a
	rst 38h			;c11b
	rst 38h			;c11c
	rst 38h			;c11d
	rst 38h			;c11e
	rst 38h			;c11f
	rst 38h			;c120
	rst 38h			;c121
	rst 38h			;c122
	rst 38h			;c123
	rst 38h			;c124
	rst 38h			;c125
	rst 38h			;c126
	rst 38h			;c127
	rst 38h			;c128
	rst 38h			;c129
	rst 38h			;c12a
	rst 38h			;c12b
	rst 38h			;c12c
	rst 38h			;c12d
	rst 38h			;c12e
	rst 38h			;c12f
	rst 38h			;c130
	rst 38h			;c131
	rst 38h			;c132
	rst 38h			;c133
	rst 38h			;c134
	rst 38h			;c135
	rst 38h			;c136
	rst 38h			;c137
	rst 38h			;c138
	rst 38h			;c139
	rst 38h			;c13a
	rst 38h			;c13b
	rst 38h			;c13c
	rst 38h			;c13d
	rst 38h			;c13e
	rst 38h			;c13f
	rst 38h			;c140
	rst 38h			;c141
	rst 38h			;c142
	rst 38h			;c143
	rst 38h			;c144
	rst 38h			;c145
	rst 38h			;c146
	rst 38h			;c147
	rst 38h			;c148
	rst 38h			;c149
	rst 38h			;c14a
	rst 38h			;c14b
	rst 38h			;c14c
	rst 38h			;c14d
	rst 38h			;c14e
	rst 38h			;c14f
	rst 38h			;c150
	rst 38h			;c151
	rst 38h			;c152
	rst 38h			;c153
	rst 38h			;c154
	rst 38h			;c155
	rst 38h			;c156
	rst 38h			;c157
	rst 38h			;c158
	rst 38h			;c159
	rst 38h			;c15a
	rst 38h			;c15b
	rst 38h			;c15c
	rst 38h			;c15d
	rst 38h			;c15e
	rst 38h			;c15f
	rst 38h			;c160
	rst 38h			;c161
	rst 38h			;c162
	rst 38h			;c163
	rst 38h			;c164
	rst 38h			;c165
	rst 38h			;c166
	rst 38h			;c167
	rst 38h			;c168
	rst 38h			;c169
	rst 38h			;c16a
	rst 38h			;c16b
	rst 38h			;c16c
	rst 38h			;c16d
	rst 38h			;c16e
	rst 38h			;c16f
	rst 38h			;c170
	rst 38h			;c171
	rst 38h			;c172
	rst 38h			;c173
	rst 38h			;c174
	rst 38h			;c175
	rst 38h			;c176
	rst 38h			;c177
	rst 38h			;c178
	rst 38h			;c179
	rst 38h			;c17a
	rst 38h			;c17b
	rst 38h			;c17c
	rst 38h			;c17d
	rst 38h			;c17e
	rst 38h			;c17f
	rst 38h			;c180
	rst 38h			;c181
	rst 38h			;c182
	rst 38h			;c183
	rst 38h			;c184
	rst 38h			;c185
	rst 38h			;c186
	rst 38h			;c187
	rst 38h			;c188
	rst 38h			;c189
	rst 38h			;c18a
	rst 38h			;c18b
	rst 38h			;c18c
	rst 38h			;c18d
	rst 38h			;c18e
	rst 38h			;c18f
	rst 38h			;c190
	rst 38h			;c191
	rst 38h			;c192
	rst 38h			;c193
	rst 38h			;c194
	rst 38h			;c195
	rst 38h			;c196
	rst 38h			;c197
	rst 38h			;c198
	rst 38h			;c199
	rst 38h			;c19a
	rst 38h			;c19b
	rst 38h			;c19c
	rst 38h			;c19d
	rst 38h			;c19e
	rst 38h			;c19f
	rst 38h			;c1a0
	rst 38h			;c1a1
	rst 38h			;c1a2
	rst 38h			;c1a3
	rst 38h			;c1a4
	rst 38h			;c1a5
	rst 38h			;c1a6
	rst 38h			;c1a7
	rst 38h			;c1a8
	rst 38h			;c1a9
	rst 38h			;c1aa
	rst 38h			;c1ab
	rst 38h			;c1ac
	rst 38h			;c1ad
	rst 38h			;c1ae
	rst 38h			;c1af
	rst 38h			;c1b0
	rst 38h			;c1b1
	rst 38h			;c1b2
	rst 38h			;c1b3
	rst 38h			;c1b4
	rst 38h			;c1b5
	rst 38h			;c1b6
	rst 38h			;c1b7
	rst 38h			;c1b8
	rst 38h			;c1b9
	rst 38h			;c1ba
	rst 38h			;c1bb
	rst 38h			;c1bc
	rst 38h			;c1bd
	rst 38h			;c1be
	rst 38h			;c1bf
	rst 38h			;c1c0
	rst 38h			;c1c1
	rst 38h			;c1c2
	rst 38h			;c1c3
	rst 38h			;c1c4
	rst 38h			;c1c5
	rst 38h			;c1c6
	rst 38h			;c1c7
	rst 38h			;c1c8
	rst 38h			;c1c9
	rst 38h			;c1ca
	rst 38h			;c1cb
	rst 38h			;c1cc
	rst 38h			;c1cd
	rst 38h			;c1ce
	rst 38h			;c1cf
	rst 38h			;c1d0
	rst 38h			;c1d1
	rst 38h			;c1d2
	rst 38h			;c1d3
	rst 38h			;c1d4
	rst 38h			;c1d5
	rst 38h			;c1d6
	rst 38h			;c1d7
	rst 38h			;c1d8
	rst 38h			;c1d9
	rst 38h			;c1da
	rst 38h			;c1db
	rst 38h			;c1dc
	rst 38h			;c1dd
	rst 38h			;c1de
	rst 38h			;c1df
	rst 38h			;c1e0
	rst 38h			;c1e1
	rst 38h			;c1e2
	rst 38h			;c1e3
	rst 38h			;c1e4
	rst 38h			;c1e5
	rst 38h			;c1e6
	rst 38h			;c1e7
	rst 38h			;c1e8
	rst 38h			;c1e9
	rst 38h			;c1ea
	rst 38h			;c1eb
	rst 38h			;c1ec
	rst 38h			;c1ed
	rst 38h			;c1ee
	rst 38h			;c1ef
	rst 38h			;c1f0
	rst 38h			;c1f1
	rst 38h			;c1f2
	rst 38h			;c1f3
	rst 38h			;c1f4
	rst 38h			;c1f5
	rst 38h			;c1f6
	rst 38h			;c1f7
	rst 38h			;c1f8
	rst 38h			;c1f9
	rst 38h			;c1fa
	rst 38h			;c1fb
	rst 38h			;c1fc
	rst 38h			;c1fd
	rst 38h			;c1fe
	rst 38h			;c1ff
	rst 38h			;c200
	rst 38h			;c201
	rst 38h			;c202
	rst 38h			;c203
	rst 38h			;c204
	rst 38h			;c205
	rst 38h			;c206
	rst 38h			;c207
	rst 38h			;c208
	rst 38h			;c209
	rst 38h			;c20a
	rst 38h			;c20b
	rst 38h			;c20c
	rst 38h			;c20d
	rst 38h			;c20e
	rst 38h			;c20f
	rst 38h			;c210
	rst 38h			;c211
	rst 38h			;c212
	rst 38h			;c213
	rst 38h			;c214
	rst 38h			;c215
	rst 38h			;c216
	rst 38h			;c217
	rst 38h			;c218
	rst 38h			;c219
	rst 38h			;c21a
	rst 38h			;c21b
	rst 38h			;c21c
	rst 38h			;c21d
	rst 38h			;c21e
	rst 38h			;c21f
	rst 38h			;c220
	rst 38h			;c221
	rst 38h			;c222
	rst 38h			;c223
	rst 38h			;c224
	rst 38h			;c225
	rst 38h			;c226
	rst 38h			;c227
	rst 38h			;c228
	rst 38h			;c229
	rst 38h			;c22a
	rst 38h			;c22b
	rst 38h			;c22c
	rst 38h			;c22d
	rst 38h			;c22e
	rst 38h			;c22f
	rst 38h			;c230
	rst 38h			;c231
	rst 38h			;c232
	rst 38h			;c233
	rst 38h			;c234
	rst 38h			;c235
	rst 38h			;c236
	rst 38h			;c237
	rst 38h			;c238
	rst 38h			;c239
	rst 38h			;c23a
	rst 38h			;c23b
	rst 38h			;c23c
	rst 38h			;c23d
	rst 38h			;c23e
	rst 38h			;c23f
	rst 38h			;c240
	rst 38h			;c241
	rst 38h			;c242
	rst 38h			;c243
	rst 38h			;c244
	rst 38h			;c245
	rst 38h			;c246
	rst 38h			;c247
	rst 38h			;c248
	rst 38h			;c249
	rst 38h			;c24a
	rst 38h			;c24b
	rst 38h			;c24c
	rst 38h			;c24d
	rst 38h			;c24e
	rst 38h			;c24f
	rst 38h			;c250
	rst 38h			;c251
	rst 38h			;c252
	rst 38h			;c253
	rst 38h			;c254
	rst 38h			;c255
	rst 38h			;c256
	rst 38h			;c257
	rst 38h			;c258
	rst 38h			;c259
	rst 38h			;c25a
	rst 38h			;c25b
	rst 38h			;c25c
	rst 38h			;c25d
	rst 38h			;c25e
	rst 38h			;c25f
	rst 38h			;c260
	rst 38h			;c261
	rst 38h			;c262
	rst 38h			;c263
	rst 38h			;c264
	rst 38h			;c265
	rst 38h			;c266
	rst 38h			;c267
	rst 38h			;c268
	rst 38h			;c269
	rst 38h			;c26a
	rst 38h			;c26b
	rst 38h			;c26c
	rst 38h			;c26d
	rst 38h			;c26e
	rst 38h			;c26f
	rst 38h			;c270
	rst 38h			;c271
	rst 38h			;c272
	rst 38h			;c273
	rst 38h			;c274
	rst 38h			;c275
	rst 38h			;c276
	rst 38h			;c277
	rst 38h			;c278
	rst 38h			;c279
	rst 38h			;c27a
	rst 38h			;c27b
	rst 38h			;c27c
	rst 38h			;c27d
	rst 38h			;c27e
	rst 38h			;c27f
	rst 38h			;c280
	rst 38h			;c281
	rst 38h			;c282
	rst 38h			;c283
	rst 38h			;c284
	rst 38h			;c285
	rst 38h			;c286
	rst 38h			;c287
	rst 38h			;c288
	rst 38h			;c289
	rst 38h			;c28a
	rst 38h			;c28b
	rst 38h			;c28c
	rst 38h			;c28d
	rst 38h			;c28e
	rst 38h			;c28f
	rst 38h			;c290
	rst 38h			;c291
	rst 38h			;c292
	rst 38h			;c293
	rst 38h			;c294
	rst 38h			;c295
	rst 38h			;c296
	rst 38h			;c297
	rst 38h			;c298
	rst 38h			;c299
	rst 38h			;c29a
	rst 38h			;c29b
	rst 38h			;c29c
	rst 38h			;c29d
	rst 38h			;c29e
	rst 38h			;c29f
	rst 38h			;c2a0
	rst 38h			;c2a1
	rst 38h			;c2a2
	rst 38h			;c2a3
	rst 38h			;c2a4
	rst 38h			;c2a5
	rst 38h			;c2a6
	rst 38h			;c2a7
	rst 38h			;c2a8
	rst 38h			;c2a9
	rst 38h			;c2aa
	rst 38h			;c2ab
	rst 38h			;c2ac
	rst 38h			;c2ad
	rst 38h			;c2ae
	rst 38h			;c2af
	rst 38h			;c2b0
	rst 38h			;c2b1
	rst 38h			;c2b2
	rst 38h			;c2b3
	rst 38h			;c2b4
	rst 38h			;c2b5
	rst 38h			;c2b6
	rst 38h			;c2b7
	rst 38h			;c2b8
	rst 38h			;c2b9
	rst 38h			;c2ba
	rst 38h			;c2bb
	rst 38h			;c2bc
	rst 38h			;c2bd
	rst 38h			;c2be
	rst 38h			;c2bf
	rst 38h			;c2c0
	rst 38h			;c2c1
	rst 38h			;c2c2
	rst 38h			;c2c3
	rst 38h			;c2c4
	rst 38h			;c2c5
	rst 38h			;c2c6
	rst 38h			;c2c7
	rst 38h			;c2c8
	rst 38h			;c2c9
	rst 38h			;c2ca
	rst 38h			;c2cb
	rst 38h			;c2cc
	rst 38h			;c2cd
	rst 38h			;c2ce
	rst 38h			;c2cf
	rst 38h			;c2d0
	rst 38h			;c2d1
	rst 38h			;c2d2
	rst 38h			;c2d3
	rst 38h			;c2d4
	rst 38h			;c2d5
	rst 38h			;c2d6
	rst 38h			;c2d7
	rst 38h			;c2d8
	rst 38h			;c2d9
	rst 38h			;c2da
	rst 38h			;c2db
	rst 38h			;c2dc
	rst 38h			;c2dd
	rst 38h			;c2de
	rst 38h			;c2df
	rst 38h			;c2e0
	rst 38h			;c2e1
	rst 38h			;c2e2
	rst 38h			;c2e3
	rst 38h			;c2e4
	rst 38h			;c2e5
	rst 38h			;c2e6
	rst 38h			;c2e7
	rst 38h			;c2e8
	rst 38h			;c2e9
	rst 38h			;c2ea
	rst 38h			;c2eb
	rst 38h			;c2ec
	rst 38h			;c2ed
	rst 38h			;c2ee
	rst 38h			;c2ef
	rst 38h			;c2f0
	rst 38h			;c2f1
	rst 38h			;c2f2
	rst 38h			;c2f3
	rst 38h			;c2f4
	rst 38h			;c2f5
	rst 38h			;c2f6
	rst 38h			;c2f7
	rst 38h			;c2f8
	rst 38h			;c2f9
	rst 38h			;c2fa
	rst 38h			;c2fb
	rst 38h			;c2fc
	rst 38h			;c2fd
	rst 38h			;c2fe
	rst 38h			;c2ff
	rst 38h			;c300
	rst 38h			;c301
	rst 38h			;c302
	rst 38h			;c303
	rst 38h			;c304
	rst 38h			;c305
	rst 38h			;c306
	rst 38h			;c307
	rst 38h			;c308
	rst 38h			;c309
	rst 38h			;c30a
	rst 38h			;c30b
	rst 38h			;c30c
	rst 38h			;c30d
	rst 38h			;c30e
	rst 38h			;c30f
	rst 38h			;c310
	rst 38h			;c311
	rst 38h			;c312
	rst 38h			;c313
	rst 38h			;c314
	rst 38h			;c315
	rst 38h			;c316
	rst 38h			;c317
	rst 38h			;c318
	rst 38h			;c319
	rst 38h			;c31a
	rst 38h			;c31b
	rst 38h			;c31c
	rst 38h			;c31d
	rst 38h			;c31e
	rst 38h			;c31f
	rst 38h			;c320
	rst 38h			;c321
	rst 38h			;c322
	rst 38h			;c323
	rst 38h			;c324
	rst 38h			;c325
	rst 38h			;c326
	rst 38h			;c327
	rst 38h			;c328
	rst 38h			;c329
	rst 38h			;c32a
	rst 38h			;c32b
	rst 38h			;c32c
	rst 38h			;c32d
	rst 38h			;c32e
	rst 38h			;c32f
	rst 38h			;c330
	rst 38h			;c331
	rst 38h			;c332
	rst 38h			;c333
	rst 38h			;c334
	rst 38h			;c335
	rst 38h			;c336
	rst 38h			;c337
	rst 38h			;c338
	rst 38h			;c339
	rst 38h			;c33a
	ld hl,02121h		;c33b
	jr nz,L_C386		;c33e
	ld b,l			;c340
	ld c,h			;c341
	ld c,c			;c342
	ld b,e			;c343
	ld c,c			;c344
	ld b,h			;c345
	ld b,c			;c346
	ld b,h			;c347
	ld b,l			;c348
	ld d,e			;c349
	jr nz,$+35		;c34a
	ld hl,00d21h		;c34c
	dec c			;c34f
	ld c,b			;c350
	ld b,c			;c351
	ld d,e			;c352
	jr nz,L_C398		;c353
	ld c,a			;c355
	ld c,(hl)		;c356
	ld d,e			;c357
	ld b,l			;c358
	ld b,a			;c359
	ld d,l			;c35a
	ld c,c			;c35b
	ld b,h			;c35c
	ld c,a			;c35d
	jr nz,$+70		;c35e
	ld b,l			;c360
	ld d,e			;c361
	ld d,h			;c362
	ld d,d			;c363
	ld d,l			;c364
	ld c,c			;c365
	ld d,d			;c366
	dec c			;c367
	dec c			;c368
	ld c,h			;c369
	ld c,a			;c36a
	ld d,e			;c36b
	jr nz,L_C3B1		;c36c
	ld b,l			;c36e
	ld c,(hl)		;c36f
	ld d,h			;c370
	ld d,d			;c371
	ld c,a			;c372
	ld d,e			;c373
	jr nz,$+82		;c374
	ld d,d			;c376
	ld c,c			;c377
	ld c,(hl)		;c378
	ld b,e			;c379
	ld c,c			;c37a
	ld d,b			;c37b
	ld b,c			;c37c
	ld c,h			;c37d
	ld b,l			;c37e
	ld d,e			;c37f
	dec c			;c380
	dec c			;c381
	jr nz,$+34		;c382
	ld b,h			;c384
	ld b,l			;c385
L_C386:
	jr nz,L_C3D4		;c386
	ld b,c			;c388
	jr nz,L_C3D9		;c389
	ld b,c			;c38b
	ld d,(hl)		;c38c
	ld b,l			;c38d
	jr nz,L_C3D9		;c38e
	ld c,(hl)		;c390
	ld d,e			;c391
	ld c,c			;c392
	ld b,a			;c393
	ld c,(hl)		;c394
	ld c,c			;c395
	ld b,c			;c396
	inc l			;c397
L_C398:
	dec c			;c398
	dec c			;c399
	jr nz,$+91		;c39a
	jr nz,L_C3DF		;c39c
	ld b,h			;c39e
	ld b,l			;c39f
	ld c,l			;c3a0
	ld b,c			;c3a1
	ld d,e			;c3a2
	jr nz,L_C3F1		;c3a3
	ld c,a			;c3a5
	ld b,a			;c3a6
	ld d,d			;c3a7
	ld b,c			;c3a8
	ld d,e			;c3a9
	ld d,h			;c3aa
	ld b,l			;c3ab
	jr nz,L_C3F6		;c3ac
	ld d,l			;c3ae
	ld c,c			;c3af
	ld d,d			;c3b0
L_C3B1:
	dec c			;c3b1
	dec c			;c3b2
	ld bc,0540bh		;c3b3
	ld d,d			;c3b6
	ld b,c			;c3b7
	ld d,e			;c3b8
	jr nz,L_C400		;c3b9
	ld c,h			;c3bb
	ld c,h			;c3bc
	ld c,a			;c3bd
	ld l,00dh		;c3be
	inc d			;c3c0
	inc d			;c3c1
	dec c			;c3c2
	jr nz,L_C3F3		;c3c3
	ld l,02eh		;c3c5
	ld e,c			;c3c7
	ld b,c			;c3c8
	jr nz,L_C410		;c3c9
	ld d,d			;c3cb
	ld b,l			;c3cc
	ld d,e			;c3cd
	jr nz,$+87		;c3ce
	ld c,(hl)		;c3d0
	jr nz,L_C41B		;c3d1
	ld b,l			;c3d3
L_C3D4:
	ld d,d			;c3d4
	ld c,a			;c3d5
	ld b,l			;c3d6
	ld l,02eh		;c3d7
L_C3D9:
	ld l,00dh		;c3d9
	nop			;c3db
L_C3DC:
	call L_AC06		;c3dc
L_C3DF:
	cp 090h			;c3df
	jr nc,L_C3DC		;c3e1
	add a,018h		;c3e3
	ld l,a			;c3e5
L_C3E6:
	call L_AC06		;c3e6
	and 03fh		;c3e9
	cp 028h			;c3eb
	jr nc,L_C3E6		;c3ed
	add a,098h		;c3ef
L_C3F1:
	ld h,a			;c3f1
	push hl			;c3f2
L_C3F3:
	ld a,h			;c3f3
	sub 020h		;c3f4
L_C3F6:
	ld h,a			;c3f6
	srl l			;c3f7
	srl l			;c3f9
	srl l			;c3fb
	call L_AACD		;c3fd
L_C400:
	ld a,(hl)		;c400
	and 0e7h		;c401
	pop hl			;c403
	jr z,L_C3DC		;c404
	ret			;c406
L_C407:
	ld a,099h		;c407
	ld iy,00bb8h		;c409
	call L_D31C		;c40d
L_C410:
	ld a,0aah		;c410
L_C412:
	call L_D31C		;c412
	ld a,0ffh		;c415
	call L_D31C		;c417
	xor a			;c41a
L_C41B:
	ld a,0f1h		;c41b
	call L_D31C		;c41d
	ret			;c420
L_C421:
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
; DATOS relleno: o resto (5 B; 5 bytes)
;   0xc459..0xc45e  (5 bytes)
; ----------------------------------------------------------------------
	defb 000h,000h,000h,000h,000h	; c459  .....

; ======================================================================
; CODIGO 0xc45e..0xc788  (810 bytes)
; ======================================================================


L_C45E:
	nop			;c45e
	nop			;c45f
	nop			;c460
	nop			;c461
	nop			;c462
	nop			;c463
	nop			;c464
	nop			;c465
	nop			;c466
	nop			;c467
	djnz L_C46A		;c468
L_C46A:
	pop hl			;c46a
	or c			;c46b
	and c			;c46c
	ld (hl),c		;c46d
	di			;c46e
	pop hl			;c46f
	call L_C509		;c470
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
L_C483:
	ld a,080h		;c483
	ld de,0ce45h		;c485
	call L_C4D0		;c488
	inc a			;c48b
	ld de,0cf3dh		;c48c
	call L_C4D0		;c48f
	ld a,002h		;c492
	ld de,0cfbeh		;c494
	call L_C4D0		;c497
L_C49A:
	ld a,0c9h		;c49a
	ld (L_C4D0),a	;c49c
	ld (L_C4A3),a		;c49f
	ret			;c4a2
L_C4A3:
	di			;c4a3
	push af			;c4a4
	push de			;c4a5
	and 07fh		;c4a6
	ld de,0002eh		;c4a8
	call L_C8A6		;c4ab
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
L_C4D0:
	di			;c4d0
L_C4D1:
	push af			;c4d1
	push de			;c4d2
	and 07fh		;c4d3
	ld de,0002eh		;c4d5
	call L_C8A6		;c4d8
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
L_C509:
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
	call L_C83E		;c528
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
	call L_C8D5		;c541
	jp (hl)			;c544
L_C545:
	push af			;c545
	call L_C89B		;c546
	pop af			;c549
	add a,(hl)		;c54a
	ld hl,0c9feh		;c54b
	call L_C8D5		;c54e
	ld (ix+00ah),l		;c551
	ld (ix+00bh),h		;c554
	inc bc			;c557
L_C558:
	ld a,(ix+008h)		;c558
	call L_C83E		;c55b
	call L_C6B7		;c55e
	ld (ix+02ah),000h	;c561
	call L_C6CF		;c565
	ld (ix+02bh),000h	;c568
	ld (ix+02ch),000h	;c56c
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
	call nz,L_C6B7	;c5cd
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
	call nz,L_C6CF	;c638
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
	call nz,L_C6E7	;c6a4
L_C6A7:
	ld a,(0d0fdh)		;c6a7
	ld e,a			;c6aa
	ld a,(0d0feh)		;c6ab
	add a,e			;c6ae
	ld (0d106h),a		;c6af
	call L_C8E2		;c6b2
	pop af			;c6b5
	ret			;c6b6
L_C6B7:
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
L_C6CF:
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
L_C6E7:
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
L_C703:
	inc bc			;c703
	ld a,(bc)		;c704
	ld (ix+009h),a		;c705
	inc bc			;c708
	jp L_C536		;c709
L_C70C:
	inc bc			;c70c
	ld a,(bc)		;c70d
	ld de,(0d10bh)		;c70e
L_C712:
	ld d,000h		;c712
	call L_C8A6		;c714
	ld (ix+006h),l		;c717
	ld (ix+007h),h		;c71a
	inc bc			;c71d
	jp L_C536		;c71e
L_C721:
	inc bc			;c721
	ld a,(bc)		;c722
	and 009h		;c723
	ld (ix+008h),a		;c725
	inc bc			;c728
	jp L_C536		;c729
L_C72C:
	push ix			;c72c
	pop hl			;c72e
	xor a			;c72f
	ld b,02eh		;c730
L_C732:
	ld (hl),a		;c732
	inc hl			;c733
	djnz L_C732		;c734
	ld a,0f3h		;c736
	ld (L_C4A3),a		;c738
	ld (L_C4D0),a	;c73b
	call L_C89B		;c73e
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
L_C75A:
	inc bc			;c75a
	ld a,(bc)		;c75b
	push bc			;c75c
	ld de,00008h		;c75d
	call L_C8A6		;c760
	ld bc,01770h		;c763
	push hl			;c766
	pop de			;c767
	call L_C8BB		;c768
	ld a,c			;c76b
	ld (0d10bh),a		;c76c
	pop bc			;c76f
	inc bc			;c770
	jp L_C536		;c771
L_C774:
	inc bc			;c774
	ld a,(bc)		;c775
	push af			;c776
	and 01fh		;c777
	ld (0d0fdh),a		;c779
	call L_C6E7		;c77c
	pop af			;c77f
	inc bc			;c780
	or a			;c781
	jp m,L_C536		;c782
	jp L_C558		;c785

; ----------------------------------------------------------------------
; DATOS tabla: (12 B; racha 2.40, entropia 3.42, 11 valores: pocos valores para ser un dibujo)
;   0xc788..0xc794  (12 bytes)
; ----------------------------------------------------------------------
	defb 003h,0c3h,070h,0c5h,03ah,00ch,0d1h,03dh,020h,006h,03ah,00dh	; c788  ..p.:..= .:.

; ======================================================================
; CODIGO 0xc794..0xc804  (112 bytes)
; ======================================================================


L_C794:
	pop de			;c794
	and a			;c795
	jr z,$-106		;c796
	ld c,(ix+000h)		;c798
	ld b,(ix+001h)		;c79b
	ld (ix+002h),c		;c79e
	ld (ix+003h),b		;c7a1
	jp L_C536		;c7a4
L_C7A7:
	inc bc			;c7a7
	ld a,(bc)		;c7a8
	ld e,a			;c7a9
	or (ix+02dh)		;c7aa
	ld (ix+02dh),a		;c7ad
	ld a,(0d0fch)		;c7b0
	or e			;c7b3
	ld (0d0fch),a		;c7b4
L_C7B7:
	inc bc			;c7b7
	jp L_C536		;c7b8
L_C7BB:
	inc bc			;c7bb
	res 0,(ix+02dh)		;c7bc
	res 1,(ix+02dh)		;c7c0
	ld a,(bc)		;c7c4
	ld de,0000fh		;c7c5
	call L_C8A6		;c7c8
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

; ----------------------------------------------------------------------
; DATOS datos: sin clasificar (58 B; racha 2.42, entropia 4.95, 37 valores)
;   0xc804..0xc83e  (58 bytes)
; ----------------------------------------------------------------------
	defb 003h,03ah,0fch,0d0h,0cbh,097h,032h,0fch,0d0h,00ah,011h,006h,000h,0cdh,0a6h,0c8h	; c804  .:....2.........
	defb 011h,0e7h,0c9h,019h,0fdh,021h,0f2h,0d0h,0fdh,036h,000h,000h,0fdh,036h,001h,000h	; c814  .....!...6...6..
	defb 016h,006h,07eh,0fdh,077h,004h,023h,0fdh,023h,015h,020h,0f6h,0afh,032h,0feh,0d0h	; c824  ..~.w.#.#. ..2..
	defb 003h,03ah,00ch,0d1h,032h,0ffh,0d0h,0c3h,036h,0c5h	; c834  .:..2...6.

; ======================================================================
; CODIGO 0xc83e..0xc864  (38 bytes)
; ======================================================================


L_C83E:
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
L_C85B:
	ld a,001h		;c85b
	ld (0d10bh),a		;c85d
	inc bc			;c860
	jp L_C536		;c861

; ----------------------------------------------------------------------
; DATOS relleno: o resto (1 B; 1 bytes)
;   0xc864..0xc865  (1 bytes)
; ----------------------------------------------------------------------
	defb 03ah	; c864  :

; ======================================================================
; CODIGO 0xc865..0xc880  (27 bytes)
; ======================================================================


L_C865:
	inc c			;c865
	pop de			;c866
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
	call L_C8D5		;c878
	ld b,h			;c87b
	ld c,l			;c87c
	jp L_C536		;c87d

; ----------------------------------------------------------------------
; DATOS tabla: (17 B; racha 2.12, entropia 3.97, 16 valores: pocos valores para ser un dibujo)
;   0xc880..0xc891  (17 bytes)
; ----------------------------------------------------------------------
	defb 03ah,00ch,0d1h,087h,06fh,026h,000h,011h,00eh,0d1h,019h,04eh,023h,046h,0c3h,036h	; c880  :...o&.....N#F.6
	defb 0c5h	; c890  .

; ======================================================================
; CODIGO 0xc891..0xc8f7  (102 bytes)
; ======================================================================


L_C891:
	inc bc			;c891
	call L_C89B		;c892
	ld a,(bc)		;c895
	inc bc			;c896
	ld (hl),a		;c897
	jp L_C536		;c898
L_C89B:
	ld a,(0d10ch)		;c89b
	ld l,a			;c89e
	ld h,000h		;c89f
	ld de,0d114h		;c8a1
	add hl,de		;c8a4
	ret			;c8a5
L_C8A6:
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
L_C8BB:
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
L_C8D5:
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
L_C8E2:
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
; DATOS graficos: (425 B; racha 5.10, entropia 3.96, 93 valores: rachas mas largas que el azar)
;   0xc8f7..0xcaa0  (425 bytes)
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
	defb 000h,028h,000h,026h,000h,024h,000h,022h,000h	; ca97  .(.&.$.".

; ======================================================================
; CODIGO 0xcaa0..0xcb0f  (111 bytes)
; ======================================================================


L_CAA0:
	jr nz,L_CAA2		;caa0
L_CAA2:
	ld e,000h		;caa2
	inc e			;caa4
L_CAA5:
	nop			;caa5
	dec de			;caa6
	nop			;caa7
	add hl,de		;caa8
	nop			;caa9
L_CAAA:
	jr L_CAAC		;caaa
L_CAAC:
	ld d,000h		;caac
	dec d			;caae
	nop			;caaf
	inc d			;cab0
L_CAB1:
	nop			;cab1
	inc de			;cab2
	nop			;cab3
	ld (de),a		;cab4
	nop			;cab5
	ld de,01000h		;cab6
	nop			;cab9
L_CABA:
	rrca			;caba
	nop			;cabb
	ld c,000h		;cabc
	inc bc			;cabe
	rst 0			;cabf
	ld hl,08cc7h		;cac0
	rst 0			;cac3
	inc c			;cac4
	rst 0			;cac5
	adc a,b			;cac6
	rst 0			;cac7
	ld e,d			;cac8
	rst 0			;cac9
	ld e,e			;caca
	ret z			;cacb
	cp e			;cacc
	rst 0			;cacd
	ld (hl),h		;cace
	rst 0			;cacf
	inc b			;cad0
	ret z			;cad1
	and a			;cad2
	rst 0			;cad3
	inc l			;cad4
	rst 0			;cad5
	ld h,h			;cad6
	ret z			;cad7
	add a,b			;cad8
	ret z			;cad9
	sub c			;cada
	ret z			;cadb
	ld h,c			;cadc
	rlc h			;cadd
	rl c			;cadf
	sra e			;cae1
	srl d			;cae3
	bit 0,a			;cae5
	bit 2,h			;cae7
	res 5,d			;cae9
	res 7,l			;caeb
L_CAED:
	set 2,b			;caed
	set 4,e			;caef
	set 6,(hl)		;caf1
	bit 0,l			;caf3
	call z,L_CC8C		;caf5
	and d			;caf8
	call z,L_CCB8		;caf9
	rst 30h			;cafc
	call z,L_CD15		;cafd
	cpl			;cb00
L_CB01:
	call L_CD53		;cb01
	add a,a			;cb04
	ex af,af'		;cb05
	add a,b			;cb06
	rrca			;cb07
	add a,e			;cb08
	djnz $+26		;cb09
	add a,b			;cb0b
	inc c			;cb0c
	jr $+26			;cb0d

; ----------------------------------------------------------------------
; DATOS relleno: o resto (5 B; 5 bytes)
;   0xcb0f..0xcb14  (5 bytes)
; ----------------------------------------------------------------------
	defb 018h,08dh,081h,008h,087h	; cb0f  .....

; ======================================================================
; CODIGO 0xcb14..0xcb26  (18 bytes)
; ======================================================================


L_CB14:
	ld a,(bc)		;cb14
	adc a,c			;cb15
	nop			;cb16
	add a,b			;cb17
	ex af,af'		;cb18
	add a,e			;cb19
	jr nz,$-122		;cb1a
	adc a,b			;cb1c
	jr $-123		;cb1d
	djnz $-122		;cb1f
	add a,e			;cb21
	ex af,af'		;cb22
L_CB23:
	adc a,b			;cb23
	jr $-122		;cb24

; ----------------------------------------------------------------------
; DATOS relleno: o resto (1 B; 1 bytes)
;   0xcb26..0xcb27  (1 bytes)
; ----------------------------------------------------------------------
	defb 083h	; cb26  .

; ======================================================================
; CODIGO 0xcb27..0xcbdb  (180 bytes)
; ======================================================================


L_CB27:
	jr nz,$-118		;cb27
	jr $-113		;cb29
	add a,a			;cb2b
	add hl,bc		;cb2c
	add a,b			;cb2d
	rlca			;cb2e
	add a,e			;cb2f
	ex af,af'		;cb30
	jr nc,$+62		;cb31
	ld c,b			;cb33
	ld d,h			;cb34
	scf			;cb35
	ld b,e			;cb36
	ld c,d			;cb37
	ld c,b			;cb38
	adc a,l			;cb39
	add a,a			;cb3a
	ex af,af'		;cb3b
	add a,b			;cb3c
	rrca			;cb3d
	add a,e			;cb3e
	djnz L_CB62		;cb3f
	add a,b			;cb41
	inc c			;cb42
	ld hl,02121h		;cb43
	adc a,l			;cb46
	add a,a			;cb47
	ex af,af'		;cb48
	add a,b			;cb49
	rrca			;cb4a
	add a,e			;cb4b
	djnz L_CB6B		;cb4c
	add a,b			;cb4e
	inc c			;cb4f
	dec e			;cb50
	dec e			;cb51
	dec e			;cb52
	adc a,l			;cb53
	add a,a			;cb54
	ex af,af'		;cb55
	add a,b			;cb56
	rrca			;cb57
	add a,e			;cb58
	djnz $+33		;cb59
	add a,b			;cb5b
	inc c			;cb5c
	rra			;cb5d
	rra			;cb5e
	rra			;cb5f
	adc a,l			;cb60
	add a,a			;cb61
L_CB62:
	dec bc			;cb62
	add a,e			;cb63
	djnz $-119		;cb64
	ld a,(bc)		;cb66
	jr nc,L_CB94		;cb67
	jr nc,$-123		;cb69
L_CB6B:
	jr nz,$+52		;cb6b
	add a,e			;cb6d
	djnz L_CBA2		;cb6e
	inc (hl)		;cb70
	ld (02d30h),a		;cb71
	dec hl			;cb74
	add a,e			;cb75
	ld d,b			;cb76
	dec l			;cb77
	add a,e			;cb78
	djnz L_CBAB		;cb79
	dec hl			;cb7b
	jr nc,$-123		;cb7c
	jr nz,L_CBB2		;cb7e
	add a,e			;cb80
	djnz $+52		;cb81
	inc (hl)		;cb83
	ld (02d30h),a		;cb84
	dec hl			;cb87
	add a,e			;cb88
	ld d,b			;cb89
	dec l			;cb8a
	add a,e			;cb8b
	djnz L_CBC3		;cb8c
	inc (hl)		;cb8e
	jr nc,$-123		;cb8f
	jr nc,L_CBBC		;cb91
	add a,e			;cb93
L_CB94:
	djnz L_CBCB		;cb94
	add a,e			;cb96
	jr nz,$+54		;cb97
	jr nc,$-123		;cb99
	ld b,b			;cb9b
	scf			;cb9c
	add a,e			;cb9d
	djnz L_CBD7		;cb9e
	dec (hl)		;cba0
L_CBA1:
	inc (hl)		;cba1
L_CBA2:
	jr nc,L_CBCF		;cba2
L_CBA4:
	add hl,hl		;cba4
	jr z,$-123		;cba5
L_CBA7:
	and b			;cba7
	inc h			;cba8
	adc a,l			;cba9
	add a,e			;cbaa
L_CBAB:
	ex af,af'		;cbab
	ld hl,02d21h		;cbac
	ld hl,02d2bh		;cbaf
L_CBB2:
	add a,h			;cbb2
	rra			;cbb3
	ld hl,02d21h		;cbb4
	ld hl,02d2dh		;cbb7
	ld h,028h		;cbba
L_CBBC:
	adc a,l			;cbbc
	add a,e			;cbbd
	ex af,af'		;cbbe
	dec e			;cbbf
L_CBC0:
	dec e			;cbc0
	add hl,hl		;cbc1
	dec e			;cbc2
L_CBC3:
	daa			;cbc3
	add hl,hl		;cbc4
	add a,h			;cbc5
	dec de			;cbc6
	dec e			;cbc7
	dec e			;cbc8
L_CBC9:
	add hl,hl		;cbc9
	dec e			;cbca
L_CBCB:
	daa			;cbcb
	jr $+36			;cbcc
	inc h			;cbce
L_CBCF:
	adc a,l			;cbcf
	add a,e			;cbd0
	ex af,af'		;cbd1
L_CBD2:
	ld a,(de)		;cbd2
	ld a,(de)		;cbd3
	ld h,01ah		;cbd4
	inc h			;cbd6
L_CBD7:
	ld h,084h		;cbd7
	jr $+28			;cbd9

; ----------------------------------------------------------------------
; DATOS tabla: (21 B; racha 2.43, entropia 3.16, 11 valores: pocos valores para ser un dibujo)
;   0xcbdb..0xcbf0  (21 bytes)
; ----------------------------------------------------------------------
	defb 01ah,026h,01ah,024h,026h,01fh,021h,08dh,083h,008h,01ch,01ch,028h,01ch,026h,028h	; cbdb  .&.$&.!.....(.&(
	defb 084h,01ah,01ch,01ch,028h	; cbeb  ....(

; ======================================================================
; CODIGO 0xcbf0..0xcc3d  (77 bytes)
; ======================================================================


L_CBF0:
	inc hl			;cbf0
	ld h,028h		;cbf1
	inc e			;cbf3
	rra			;cbf4
L_CBF5:
	adc a,l			;cbf5
	add a,a			;cbf6
	ld a,(bc)		;cbf7
	add a,e			;cbf8
	ex af,af'		;cbf9
	add hl,sp		;cbfa
	dec l			;cbfb
	add hl,sp		;cbfc
	dec l			;cbfd
	scf			;cbfe
	inc (hl)		;cbff
	scf			;cc00
	add hl,sp		;cc01
	add a,h			;cc02
	add a,a			;cc03
	inc c			;cc04
	ld hl,01083h		;cc05
	dec hl			;cc08
	add a,e			;cc09
	jr nz,L_CC2D		;cc0a
	add a,a			;cc0c
	ld a,(bc)		;cc0d
	add a,e			;cc0e
	ex af,af'		;cc0f
	add hl,sp		;cc10
	ld (03239h),a		;cc11
	scf			;cc14
	inc (hl)		;cc15
	scf			;cc16
	add a,e			;cc17
	jr z,$+59		;cc18
	add a,e			;cc1a
	jr nz,$-119		;cc1b
	inc c			;cc1d
	rra			;cc1e
	add a,a			;cc1f
	ld a,(bc)		;cc20
	add a,e			;cc21
	ex af,af'		;cc22
	ld a,032h		;cc23
	ld b,b			;cc25
	ld (03c3eh),a		;cc26
	add hl,sp		;cc29
	inc a			;cc2a
	ld a,032h		;cc2b
L_CC2D:
	ld b,b			;cc2d
	ld (03c3eh),a		;cc2e
	add hl,sp		;cc31
	inc a			;cc32
	ld b,b			;cc33
	inc (hl)		;cc34
	ld b,b			;cc35
	inc (hl)		;cc36
	ld a,03bh		;cc37
	ld a,083h		;cc39
	jr $-123		;cc3b

; ----------------------------------------------------------------------
; DATOS relleno: o resto (1 B; 1 bytes)
;   0xcc3d..0xcc3e  (1 bytes)
; ----------------------------------------------------------------------
	defb 028h	; cc3d  (

; ======================================================================
; CODIGO 0xcc3e..0xcc99  (91 bytes)
; ======================================================================


L_CC3E:
	ld b,b			;cc3e
	add a,e			;cc3f
	jr nz,$-119		;cc40
	inc c			;cc42
	jr nc,$-113		;cc43
	add a,a			;cc45
	dec bc			;cc46
	adc a,d			;cc47
	ld bc,06083h		;cc48
	add hl,sp		;cc4b
	add a,a			;cc4c
	ex af,af'		;cc4d
	add a,b			;cc4e
	dec c			;cc4f
	add a,e			;cc50
	ex af,af'		;cc51
	inc a			;cc52
L_CC53:
	dec sp			;cc53
	add hl,sp		;cc54
	scf			;cc55
L_CC56:
	add a,a			;cc56
	dec bc			;cc57
	add a,b			;cc58
	ld a,(bc)		;cc59
	add a,e			;cc5a
	ld h,b			;cc5b
	add hl,sp		;cc5c
	add a,a			;cc5d
	ex af,af'		;cc5e
	add a,b			;cc5f
	dec c			;cc60
	add a,e			;cc61
	ex af,af'		;cc62
	inc a			;cc63
	dec sp			;cc64
	add hl,sp		;cc65
	scf			;cc66
	add a,b			;cc67
	ld a,(bc)		;cc68
	add a,a			;cc69
	dec bc			;cc6a
	add a,e			;cc6b
	ld h,b			;cc6c
	dec (hl)		;cc6d
	add a,b			;cc6e
	dec c			;cc6f
	add a,a			;cc70
	ex af,af'		;cc71
	add a,e			;cc72
	ex af,af'		;cc73
L_CC74:
	dec (hl)		;cc74
	add hl,sp		;cc75
	inc a			;cc76
	add hl,sp		;cc77
	add a,b			;cc78
	ld a,(bc)		;cc79
	add a,a			;cc7a
	dec bc			;cc7b
	add a,e			;cc7c
	ld h,b			;cc7d
	dec sp			;cc7e
	add a,a			;cc7f
	ex af,af'		;cc80
	add a,e			;cc81
	ex af,af'		;cc82
	add a,b			;cc83
L_CC84:
	dec c			;cc84
	ld b,b			;cc85
	inc (hl)		;cc86
	ld a,040h		;cc87
	add a,b			;cc89
	ld a,(bc)		;cc8a
	adc a,l			;cc8b
L_CC8C:
	add a,a			;cc8c
	ex af,af'		;cc8d
	add a,b			;cc8e
	rrca			;cc8f
	add a,e			;cc90
	djnz $+26		;cc91
	add a,b			;cc93
	inc c			;cc94
	add a,e			;cc95
	ex af,af'		;cc96
	jr $+26			;cc97

; ----------------------------------------------------------------------
; DATOS tabla: (18 B; racha 3.43, entropia 3.28, 11 valores: pocos valores para ser un dibujo)
;   0xcc99..0xccab  (18 bytes)
; ----------------------------------------------------------------------
	defb 080h,00fh,083h,010h,018h,080h,00ch,013h,08dh,087h,008h,080h,00fh,083h,010h,01ah	; cc99  ................
	defb 080h,00ch	; cca9  ..

; ======================================================================
; CODIGO 0xccab..0xcdc0  (277 bytes)
; ======================================================================


L_CCAB:
	add a,e			;ccab
L_CCAC:
	ex af,af'		;ccac
	ld a,(de)		;ccad
	ld a,(de)		;ccae
	add a,b			;ccaf
	rrca			;ccb0
L_CCB1:
	add a,e			;ccb1
	djnz $+28		;ccb2
	add a,b			;ccb4
	inc c			;ccb5
	dec d			;ccb6
	adc a,l			;ccb7
L_CCB8:
	add a,c			;ccb8
	ld bc,00987h		;ccb9
	add a,e			;ccbc
	ex af,af'		;ccbd
	add a,b			;ccbe
L_CCBF:
	add hl,bc		;ccbf
	jr nc,L_CCF9		;ccc0
	inc a			;ccc2
	scf			;ccc3
	ld a,03ch		;ccc4
	ld (hl),03eh		;ccc6
	jr nc,$+62		;ccc8
	ld (hl),037h		;ccca
L_CCCC:
	add a,e			;cccc
	jr nz,$-119		;cccd
	ld a,(bc)		;cccf
	add a,c			;ccd0
	ex af,af'		;ccd1
	adc a,b			;ccd2
	inc c			;ccd3
	add a,c			;ccd4
	ld bc,00987h		;ccd5
	add a,a			;ccd8
	add hl,bc		;ccd9
	add a,e			;ccda
	ex af,af'		;ccdb
	add a,b			;ccdc
	add hl,bc		;ccdd
	jr nc,L_CD17		;ccde
	inc a			;cce0
	scf			;cce1
	ld a,03ch		;cce2
	ld (hl),03eh		;cce4
	jr nc,L_CD24		;cce6
	ld (hl),037h		;cce8
	add a,e			;ccea
	jr nz,$-119		;cceb
	ld a,(bc)		;cced
	add a,c			;ccee
	ex af,af'		;ccef
	adc a,b			;ccf0
	ld (de),a		;ccf1
	add a,c			;ccf2
	ld bc,00987h		;ccf3
	adc a,l			;ccf6
	add a,a			;ccf7
	ld a,(bc)		;ccf8
L_CCF9:
	add a,e			;ccf9
	jr nc,L_CD2C		;ccfa
	add a,e			;ccfc
	ex af,af'		;ccfd
	dec hl			;ccfe
	jr nc,$-123		;ccff
	jr nc,L_CD35		;cd01
	add a,e			;cd03
	ex af,af'		;cd04
	jr nc,L_CD39		;cd05
	add a,e			;cd07
	jr nc,$+57		;cd08
	add a,e			;cd0a
	ex af,af'		;cd0b
	dec (hl)		;cd0c
	inc (hl)		;cd0d
	add a,e			;cd0e
	djnz $+55		;cd0f
	inc (hl)		;cd11
	jr nc,L_CD3F		;cd12
	adc a,l			;cd14
L_CD15:
	add a,b			;cd15
	inc c			;cd16
L_CD17:
	add a,a			;cd17
	ld a,(bc)		;cd18
	add a,e			;cd19
	jr nc,$+50		;cd1a
	add a,e			;cd1c
	ex af,af'		;cd1d
	add a,a			;cd1e
	ex af,af'		;cd1f
	scf			;cd20
	scf			;cd21
	add a,b			;cd22
	rrca			;cd23
L_CD24:
	ld (hl),083h		;cd24
	jr z,L_CCAC		;cd26
	add a,e			;cd28
	ex af,af'		;cd29
	add a,b			;cd2a
	dec c			;cd2b
L_CD2C:
	dec hl			;cd2c
	dec hl			;cd2d
	adc a,l			;cd2e
	add a,a			;cd2f
	rrca			;cd30
	adc a,d			;cd31
	ld bc,02083h		;cd32
L_CD35:
	jr nc,L_CD6E		;cd35
	ld (hl),032h		;cd37
L_CD39:
	inc (hl)		;cd39
	jr nc,L_CCBF		;cd3a
	djnz L_CD6E		;cd3c
	dec sp			;cd3e
L_CD3F:
	ld a,(08339h)		;cd3f
	jr nz,L_CD76		;cd42
	scf			;cd44
	ld (hl),039h		;cd45
	jr c,L_CCCC		;cd47
	ex af,af'		;cd49
	ld (03637h),a		;cd4a
	add hl,sp		;cd4d
	add a,e			;cd4e
	jr nz,L_CD89		;cd4f
	add hl,sp		;cd51
	adc a,l			;cd52
L_CD53:
	add a,l			;cd53
	and b			;cd54
	add a,e			;cd55
	inc c			;cd56
	add a,c			;cd57
	ld bc,00780h		;cd58
	add a,a			;cd5b
	nop			;cd5c
	ld d,b			;cd5d
	adc a,e			;cd5e
	add a,l			;cd5f
	and b			;cd60
	add a,e			;cd61
	add hl,de		;cd62
	add a,c			;cd63
	ld bc,00780h		;cd64
	add a,a			;cd67
	ld bc,0028ah		;cd68
	ld b,(hl)		;cd6b
	adc a,e			;cd6c
	add a,l			;cd6d
L_CD6E:
	and b			;cd6e
	add a,e			;cd6f
	ld bc,00881h		;cd70
	add a,b			;cd73
	rrca			;cd74
	adc a,b			;cd75
L_CD76:
	add hl,de		;cd76
	add a,e			;cd77
	ld a,(bc)		;cd78
	add a,b			;cd79
	ld a,(bc)		;cd7a
	add a,a			;cd7b
	ld (bc),a		;cd7c
	adc a,b			;cd7d
	rra			;cd7e
	adc a,e			;cd7f
	add a,l			;cd80
	ld (0c883h),a		;cd81
	add a,b			;cd84
	nop			;cd85
	add a,c			;cd86
	ex af,af'		;cd87
	add a,a			;cd88
L_CD89:
	dec b			;cd89
	adc a,c			;cd8a
	inc bc			;cd8b
	adc a,b			;cd8c
	rra			;cd8d
	adc a,e			;cd8e
	adc a,e			;cd8f
	adc a,e			;cd90
	add a,l			;cd91
	rst 38h			;cd92
	add a,e			;cd93
	ld (bc),a		;cd94
	add a,c			;cd95
	ex af,af'		;cd96
	add a,b			;cd97
	rrca			;cd98
	adc a,b			;cd99
	rrca			;cd9a
	adc a,e			;cd9b
	add a,(hl)		;cd9c
	add a,e			;cd9d
	ld (bc),a		;cd9e
	add a,c			;cd9f
	ld bc,00f80h		;cda0
	ld e,d			;cda3
	adc a,e			;cda4
	add a,l			;cda5
	and b			;cda6
	add a,e			;cda7
	ld e,081h		;cda8
	ld bc,00080h		;cdaa
	add a,a			;cdad
	inc bc			;cdae
	ld b,(hl)		;cdaf
	adc a,e			;cdb0
	add a,(hl)		;cdb1
	add a,b			;cdb2
	inc c			;cdb3
	add a,a			;cdb4
	ex af,af'		;cdb5
	adc a,d			;cdb6
	nop			;cdb7
	add a,c			;cdb8
	ld bc,00483h		;cdb9
	adc a,(hl)		;cdbc
	dec b			;cdbd
	jr $+38			;cdbe

; ----------------------------------------------------------------------
; DATOS tabla: (16 B; racha 2.37, entropia 2.27, 7 valores: pocos valores para ser un dibujo)
;   0xcdc0..0xcdd0  (16 bytes)
; ----------------------------------------------------------------------
	defb 018h,024h,018h,024h,018h,024h,01dh,029h,01fh,02bh,018h,024h,018h,018h,018h,08bh	; cdc0  .$.$.$.).+.$....

; ======================================================================
; CODIGO 0xcdd0..0xd13a  (874 bytes)
; ======================================================================


L_CDD0:
	add a,b			;cdd0
	inc c			;cdd1
	add a,a			;cdd2
	ex af,af'		;cdd3
	adc a,d			;cdd4
	nop			;cdd5
	add a,c			;cdd6
	ld bc,00483h		;cdd7
	adc a,(hl)		;cdda
	dec b			;cddb
	jr z,L_CE09		;cddc
	jr nc,$+45		;cdde
	jr z,L_CE0D		;cde0
	jr nc,$+45		;cde2
L_CDE4:
	dec l			;cde4
	jr nc,L_CE16		;cde5
	ld (02b2bh),a		;cde7
	dec hl			;cdea
	adc a,e			;cdeb
	add a,b			;cdec
	rrca			;cded
	add a,a			;cdee
	rrca			;cdef
	adc a,d			;cdf0
	ld bc,00181h		;cdf1
	add a,e			;cdf4
	inc b			;cdf5
	adc a,(hl)		;cdf6
	dec b			;cdf7
	ld b,e			;cdf8
	ld b,b			;cdf9
	ld b,e			;cdfa
	ld b,b			;cdfb
	add a,e			;cdfc
	inc c			;cdfd
	ld b,e			;cdfe
	add a,e			;cdff
	inc b			;ce00
	ld b,b			;ce01
	add a,e			;ce02
	djnz L_CE43		;ce03
	inc a			;ce05
	adc a,e			;ce06
	add a,(hl)		;ce07
	add a,e			;ce08
L_CE09:
	ld bc,00181h		;ce09
	add a,b			;ce0c
L_CE0D:
	rrca			;ce0d
	ld (08246h),a		;ce0e
	add a,l			;ce11
	and b			;ce12
	add a,e			;ce13
	ld h,h			;ce14
	add a,c			;ce15
L_CE16:
	ex af,af'		;ce16
	add a,b			;ce17
	nop			;ce18
	add a,a			;ce19
	rlca			;ce1a
	adc a,b			;ce1b
	rra			;ce1c
	adc a,e			;ce1d
	add a,l			;ce1e
	and b			;ce1f
	add a,e			;ce20
	ld e,081h		;ce21
	ex af,af'		;ce23
	add a,b			;ce24
	nop			;ce25
	add a,a			;ce26
	inc b			;ce27
	adc a,b			;ce28
	inc d			;ce29
	adc a,e			;ce2a
	add a,(hl)		;ce2b
	add a,e			;ce2c
	ld bc,00181h		;ce2d
	add a,b			;ce30
	ld a,(bc)		;ce31
	ld c,h			;ce32
	add a,h			;ce33
	add a,d			;ce34
	add a,l			;ce35
	and b			;ce36
	adc a,e			;ce37
	inc d			;ce38
	add a,c			;ce39
	add hl,bc		;ce3a
	add a,b			;ce3b
	nop			;ce3c
	add a,a			;ce3d
	ld b,089h		;ce3e
	nop			;ce40
	adc a,b			;ce41
	add a,b			;ce42
L_CE43:
	jr z,L_CDD0		;ce43
	adc a,(hl)		;ce45
	ld (bc),a		;ce46
	add a,(hl)		;ce47
	add a,c			;ce48
	ld bc,0018ch		;ce49
	adc a,h			;ce4c
	ld bc,0048ch		;ce4d
	adc a,h			;ce50
	inc b			;ce51
	adc a,h			;ce52
	ld bc,0018ch		;ce53
	adc a,h			;ce56
	inc b			;ce57
	adc a,h			;ce58
	inc b			;ce59
	adc a,h			;ce5a
	dec b			;ce5b
	adc a,h			;ce5c
	dec b			;ce5d
	adc a,h			;ce5e
	ld b,08ch		;ce5f
	ld b,08ch		;ce61
	ld bc,0018ch		;ce63
	adc a,h			;ce66
	ld bc,0018ch		;ce67
	add a,(hl)		;ce6a
	add a,c			;ce6b
	ld bc,0018ch		;ce6c
	adc a,h			;ce6f
	ld bc,0048ch		;ce70
	adc a,h			;ce73
	inc b			;ce74
	adc a,h			;ce75
	ld bc,0018ch		;ce76
	adc a,h			;ce79
	inc b			;ce7a
	adc a,h			;ce7b
	inc b			;ce7c
	adc a,h			;ce7d
	dec b			;ce7e
	adc a,h			;ce7f
	dec b			;ce80
	adc a,h			;ce81
	ld b,08ch		;ce82
	ld b,08ch		;ce84
	ld bc,0018ch		;ce86
	adc a,h			;ce89
	ld bc,0018ch		;ce8a
	add a,(hl)		;ce8d
	add a,c			;ce8e
	ld bc,0018ch		;ce8f
	adc a,h			;ce92
	ld bc,0048ch		;ce93
	adc a,h			;ce96
	inc b			;ce97
	adc a,h			;ce98
	ld bc,0018ch		;ce99
	adc a,h			;ce9c
	inc b			;ce9d
	adc a,h			;ce9e
	inc b			;ce9f
	adc a,h			;cea0
	dec b			;cea1
	adc a,h			;cea2
	dec b			;cea3
	adc a,h			;cea4
	ld b,08ch		;cea5
	ld b,08ch		;cea7
	ld bc,0018ch		;cea9
	adc a,h			;ceac
	ld bc,0018ch		;cead
	add a,b			;ceb0
	dec c			;ceb1
	adc a,h			;ceb2
	rlca			;ceb3
	adc a,h			;ceb4
	ex af,af'		;ceb5
	adc a,h			;ceb6
	add hl,bc		;ceb7
	adc a,h			;ceb8
	ld a,(bc)		;ceb9
	adc a,h			;ceba
	rlca			;cebb
	adc a,h			;cebc
	ex af,af'		;cebd
	adc a,h			;cebe
	add hl,bc		;cebf
	adc a,h			;cec0
	ld a,(bc)		;cec1
	adc a,h			;cec2
	rlca			;cec3
	adc a,h			;cec4
	ex af,af'		;cec5
	adc a,h			;cec6
	add hl,bc		;cec7
	adc a,h			;cec8
	ld a,(bc)		;cec9
	adc a,h			;ceca
	rlca			;cecb
	adc a,h			;cecc
	ex af,af'		;cecd
	adc a,h			;cece
	add hl,bc		;cecf
	adc a,h			;ced0
	ld a,(bc)		;ced1
	adc a,h			;ced2
	rlca			;ced3
	adc a,h			;ced4
	ex af,af'		;ced5
	adc a,h			;ced6
	add hl,bc		;ced7
	adc a,h			;ced8
	ld a,(bc)		;ced9
	adc a,(hl)		;ceda
	add hl,bc		;cedb
	adc a,h			;cedc
	dec c			;cedd
	adc a,h			;cede
	dec c			;cedf
	adc a,h			;cee0
	dec c			;cee1
	adc a,h			;cee2
	dec c			;cee3
	adc a,h			;cee4
	ld c,08ch		;cee5
	ld c,08ch		;cee7
	ld c,08ch		;cee9
	ld c,08ch		;ceeb
	dec c			;ceed
	adc a,h			;ceee
	dec c			;ceef
	adc a,h			;cef0
	dec c			;cef1
	adc a,h			;cef2
	dec c			;cef3
	adc a,h			;cef4
	ld c,08ch		;cef5
	ld c,08ch		;cef7
	ld c,08ch		;cef9
	ld c,08ch		;cefb
	dec c			;cefd
	adc a,h			;cefe
	dec c			;ceff
	adc a,h			;cf00
	dec c			;cf01
	adc a,h			;cf02
	dec c			;cf03
	adc a,h			;cf04
	ld c,08ch		;cf05
	ld c,08ch		;cf07
	ld c,08ch		;cf09
	ld c,08ch		;cf0b
	dec c			;cf0d
	adc a,h			;cf0e
	dec c			;cf0f
	adc a,h			;cf10
	dec c			;cf11
	adc a,h			;cf12
	dec c			;cf13
	adc a,h			;cf14
	ld c,08ch		;cf15
	ld c,08ch		;cf17
	ld c,08ch		;cf19
	ld c,08ch		;cf1b
	dec c			;cf1d
	adc a,h			;cf1e
	dec c			;cf1f
L_CF20:
	adc a,h			;cf20
	dec c			;cf21
	adc a,h			;cf22
	dec c			;cf23
	adc a,h			;cf24
	ld c,08ch		;cf25
	ld c,08ch		;cf27
	ld c,08ch		;cf29
	ld c,08ch		;cf2b
	dec c			;cf2d
	adc a,h			;cf2e
	dec c			;cf2f
	adc a,h			;cf30
	dec c			;cf31
	adc a,h			;cf32
	dec c			;cf33
	adc a,h			;cf34
	ld c,08ch		;cf35
	ld c,08ch		;cf37
	ld c,08ch		;cf39
	ld c,082h		;cf3b
	adc a,(hl)		;cf3d
	ld (bc),a		;cf3e
	add a,c			;cf3f
	ld bc,0038ch		;cf40
	adc a,h			;cf43
	inc bc			;cf44
	adc a,h			;cf45
	inc bc			;cf46
	adc a,h			;cf47
	inc bc			;cf48
	adc a,h			;cf49
	inc bc			;cf4a
	adc a,h			;cf4b
	inc bc			;cf4c
	adc a,h			;cf4d
	inc bc			;cf4e
	adc a,h			;cf4f
	inc bc			;cf50
	adc a,h			;cf51
	inc bc			;cf52
	adc a,h			;cf53
	inc bc			;cf54
	adc a,h			;cf55
	inc bc			;cf56
	adc a,h			;cf57
	inc bc			;cf58
	adc a,h			;cf59
	inc bc			;cf5a
	adc a,h			;cf5b
	inc bc			;cf5c
	adc a,h			;cf5d
	inc bc			;cf5e
	adc a,h			;cf5f
	inc bc			;cf60
	add a,b			;cf61
	dec bc			;cf62
	adc a,h			;cf63
	nop			;cf64
	add a,b			;cf65
	ld a,(bc)		;cf66
	adc a,(hl)		;cf67
	ld c,08ch		;cf68
	nop			;cf6a
	adc a,(hl)		;cf6b
	ld (bc),a		;cf6c
	add a,b			;cf6d
	ld a,(bc)		;cf6e
	add a,e			;cf6f
	add a,b			;cf70
	add a,h			;cf71
	add a,h			;cf72
	add a,h			;cf73
	add a,h			;cf74
	adc a,h			;cf75
	dec bc			;cf76
	adc a,(hl)		;cf77
	ld c,08ch		;cf78
	dec bc			;cf7a
	adc a,(hl)		;cf7b
	ld (bc),a		;cf7c
	adc a,h			;cf7d
	inc c			;cf7e
	adc a,(hl)		;cf7f
	or 08ch			;cf80
	inc c			;cf82
	adc a,(hl)		;cf83
	ld (bc),a		;cf84
	adc a,(hl)		;cf85
	add hl,bc		;cf86
	add a,b			;cf87
	inc c			;cf88
	add a,a			;cf89
	ld a,(bc)		;cf8a
	adc a,h			;cf8b
	djnz $-112		;cf8c
	dec bc			;cf8e
	adc a,h			;cf8f
	djnz L_CF20		;cf90
	defb 0fdh,080h,00dh ;illegal sequence	;cf92
	adc a,h			;cf95
	djnz $-112		;cf96
	rst 38h			;cf98
	adc a,h			;cf99
	djnz $-112		;cf9a
	add hl,bc		;cf9c
	adc a,h			;cf9d
	ld de,0118ch		;cf9e
	adc a,(hl)		;cfa1
	dec bc			;cfa2
	adc a,h			;cfa3
	ld de,0118ch		;cfa4
	adc a,(hl)		;cfa7
	defb 0fdh,08ch ;adc a,iyh	;cfa8
	ld de,0118ch		;cfaa
	adc a,(hl)		;cfad
	rst 38h			;cfae
	adc a,h			;cfaf
	ld de,0118ch		;cfb0
	add a,b			;cfb3
	rrca			;cfb4
	adc a,(hl)		;cfb5
	add hl,bc		;cfb6
	adc a,h			;cfb7
	ld (de),a		;cfb8
	adc a,(hl)		;cfb9
	defb 0fdh,08ch ;adc a,iyh	;cfba
	ld (de),a		;cfbc
	add a,d			;cfbd
	adc a,e			;cfbe
	adc a,h			;cfbf
	ld (bc),a		;cfc0
	adc a,h			;cfc1
	ld (bc),a		;cfc2
	adc a,h			;cfc3
	ld (bc),a		;cfc4
	adc a,h			;cfc5
	ld (bc),a		;cfc6
	adc a,h			;cfc7
	ld (bc),a		;cfc8
	adc a,h			;cfc9
	ld (bc),a		;cfca
	adc a,h			;cfcb
	ld (bc),a		;cfcc
	adc a,h			;cfcd
	ld (bc),a		;cfce
	adc a,h			;cfcf
	ld (bc),a		;cfd0
	adc a,h			;cfd1
	ld (bc),a		;cfd2
	adc a,h			;cfd3
	ld (bc),a		;cfd4
	adc a,h			;cfd5
	ld (bc),a		;cfd6
	adc a,h			;cfd7
	ld (bc),a		;cfd8
	adc a,h			;cfd9
	ld (bc),a		;cfda
	adc a,h			;cfdb
	ld (bc),a		;cfdc
	adc a,h			;cfdd
	ld (bc),a		;cfde
	adc a,h			;cfdf
	ld (bc),a		;cfe0
	adc a,h			;cfe1
	ld (bc),a		;cfe2
	adc a,h			;cfe3
	ld (bc),a		;cfe4
	adc a,h			;cfe5
	ld (bc),a		;cfe6
	adc a,h			;cfe7
	ld (bc),a		;cfe8
	adc a,h			;cfe9
	ld (bc),a		;cfea
	adc a,h			;cfeb
	ld (bc),a		;cfec
	adc a,h			;cfed
	ld (bc),a		;cfee
	adc a,h			;cfef
	ld (bc),a		;cff0
	adc a,h			;cff1
	ld (bc),a		;cff2
	adc a,h			;cff3
	ld (bc),a		;cff4
	adc a,h			;cff5
	ld (bc),a		;cff6
	adc a,h			;cff7
	ld (bc),a		;cff8
	adc a,h			;cff9
	ld (bc),a		;cffa
	adc a,h			;cffb
	ld (bc),a		;cffc
	adc a,h			;cffd
	ld (bc),a		;cffe
	adc a,h			;cfff
	ld (bc),a		;d000
	adc a,h			;d001
	ld (bc),a		;d002
	adc a,h			;d003
	ld (bc),a		;d004
	adc a,h			;d005
	ld (bc),a		;d006
	adc a,h			;d007
	ld (bc),a		;d008
	adc a,h			;d009
	ld (bc),a		;d00a
	adc a,h			;d00b
	ld (bc),a		;d00c
	adc a,h			;d00d
	ld (bc),a		;d00e
	adc a,h			;d00f
	ld (bc),a		;d010
	adc a,h			;d011
	ld (bc),a		;d012
	adc a,h			;d013
	ld (bc),a		;d014
	adc a,h			;d015
	ld (bc),a		;d016
	adc a,(hl)		;d017
	add hl,bc		;d018
	adc a,h			;d019
	rrca			;d01a
	adc a,(hl)		;d01b
	dec bc			;d01c
	adc a,h			;d01d
	rrca			;d01e
	adc a,(hl)		;d01f
	add hl,bc		;d020
	adc a,h			;d021
	rrca			;d022
	adc a,(hl)		;d023
	dec bc			;d024
	adc a,h			;d025
	rrca			;d026
	adc a,(hl)		;d027
	add hl,bc		;d028
	adc a,h			;d029
	rrca			;d02a
	adc a,(hl)		;d02b
	dec bc			;d02c
	adc a,h			;d02d
	rrca			;d02e
	adc a,(hl)		;d02f
	add hl,bc		;d030
	adc a,h			;d031
	rrca			;d032
	adc a,(hl)		;d033
	dec bc			;d034
	adc a,h			;d035
	rrca			;d036
	adc a,(hl)		;d037
	add hl,bc		;d038
	adc a,h			;d039
	rrca			;d03a
	adc a,(hl)		;d03b
	dec bc			;d03c
	adc a,h			;d03d
	rrca			;d03e
	adc a,(hl)		;d03f
	add hl,bc		;d040
	adc a,h			;d041
	rrca			;d042
	adc a,(hl)		;d043
	dec bc			;d044
	adc a,h			;d045
	rrca			;d046
	add a,d			;d047
	add a,l			;d048
	and b			;d049
	add a,e			;d04a
	ld e,081h		;d04b
	ld bc,00380h		;d04d
	add a,a			;d050
	rlca			;d051
	inc d			;d052
	adc a,e			;d053
	add a,(hl)		;d054
	add a,e			;d055
	ld bc,00181h		;d056
	add a,b			;d059
	ld a,(bc)		;d05a
	ld b,b			;d05b
	add a,h			;d05c
	add a,d			;d05d
	add a,(hl)		;d05e
	add a,e			;d05f
	ld bc,00181h		;d060
	add a,b			;d063
	ld a,(bc)		;d064
	inc (hl)		;d065
	add a,h			;d066
	add a,d			;d067
	nop			;d068
	nop			;d069
	nop			;d06a
	nop			;d06b
	nop			;d06c
	nop			;d06d
	nop			;d06e
	nop			;d06f
	nop			;d070
	nop			;d071
	nop			;d072
	nop			;d073
	nop			;d074
	nop			;d075
	nop			;d076
	nop			;d077
	nop			;d078
	nop			;d079
	nop			;d07a
	nop			;d07b
	nop			;d07c
	nop			;d07d
	nop			;d07e
	nop			;d07f
	nop			;d080
	nop			;d081
	nop			;d082
	nop			;d083
	nop			;d084
	nop			;d085
	nop			;d086
	nop			;d087
	nop			;d088
	nop			;d089
	nop			;d08a
	nop			;d08b
	nop			;d08c
	nop			;d08d
	nop			;d08e
	nop			;d08f
	nop			;d090
	nop			;d091
	nop			;d092
	nop			;d093
	nop			;d094
	nop			;d095
	nop			;d096
	nop			;d097
	nop			;d098
	nop			;d099
	nop			;d09a
	nop			;d09b
	nop			;d09c
	nop			;d09d
	nop			;d09e
	nop			;d09f
	nop			;d0a0
	nop			;d0a1
	nop			;d0a2
	nop			;d0a3
	nop			;d0a4
	nop			;d0a5
	nop			;d0a6
	nop			;d0a7
	nop			;d0a8
	nop			;d0a9
	nop			;d0aa
	nop			;d0ab
	nop			;d0ac
	nop			;d0ad
	nop			;d0ae
	nop			;d0af
	nop			;d0b0
	nop			;d0b1
	nop			;d0b2
	nop			;d0b3
	nop			;d0b4
	nop			;d0b5
	nop			;d0b6
	nop			;d0b7
	nop			;d0b8
	nop			;d0b9
	nop			;d0ba
	nop			;d0bb
	nop			;d0bc
	nop			;d0bd
	nop			;d0be
	nop			;d0bf
	nop			;d0c0
	nop			;d0c1
	nop			;d0c2
	nop			;d0c3
	nop			;d0c4
	nop			;d0c5
	nop			;d0c6
	nop			;d0c7
	nop			;d0c8
	nop			;d0c9
	nop			;d0ca
	nop			;d0cb
	nop			;d0cc
	nop			;d0cd
	nop			;d0ce
	nop			;d0cf
	nop			;d0d0
	nop			;d0d1
	nop			;d0d2
	nop			;d0d3
	nop			;d0d4
	nop			;d0d5
	nop			;d0d6
	nop			;d0d7
	nop			;d0d8
	nop			;d0d9
	nop			;d0da
	nop			;d0db
	nop			;d0dc
	nop			;d0dd
	nop			;d0de
	nop			;d0df
	nop			;d0e0
	nop			;d0e1
	nop			;d0e2
	nop			;d0e3
	nop			;d0e4
	nop			;d0e5
	nop			;d0e6
	nop			;d0e7
	nop			;d0e8
	nop			;d0e9
	nop			;d0ea
	nop			;d0eb
	nop			;d0ec
	nop			;d0ed
	nop			;d0ee
	nop			;d0ef
	nop			;d0f0
	nop			;d0f1
	nop			;d0f2
	nop			;d0f3
	nop			;d0f4
	nop			;d0f5
	nop			;d0f6
	nop			;d0f7
	nop			;d0f8
	nop			;d0f9
	nop			;d0fa
	nop			;d0fb
	nop			;d0fc
	nop			;d0fd
	nop			;d0fe
	nop			;d0ff
	nop			;d100
	nop			;d101
	nop			;d102
	nop			;d103
	nop			;d104
	nop			;d105
	nop			;d106
	nop			;d107
	nop			;d108
	nop			;d109
	nop			;d10a
	nop			;d10b
	nop			;d10c
	nop			;d10d
	nop			;d10e
	nop			;d10f
	nop			;d110
	nop			;d111
	nop			;d112
	nop			;d113
	nop			;d114
	nop			;d115
	nop			;d116
L_D117:
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
L_D127:
	push ix			;d127
	ld ix,0b87fh		;d129
	ld de,012b0h		;d12d
	call L_B3AC		;d130
	pop ix			;d133
	ret			;d135
L_D136:
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
	call L_D117		;d142
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
	call L_D117		;d15e
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
L_D16F:
	call L_AC1F		;d16f
	call L_D383		;d172
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
	call L_D20E		;d191
	pop bc			;d194
	dec c			;d195
	jr nz,L_D1B6		;d196
	ld b,c			;d198
L_D199:
	dec bc			;d199
	ld a,b			;d19a
	or c			;d19b
	jr nz,L_D199		;d19c
	ret			;d19e
L_D19F:
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
	jr z,L_D19F		;d1b2
	jr L_D1A2		;d1b4
L_D1B6:
	call L_D19F		;d1b6
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
	jr L_D1B6		;d1d8
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
L_D20E:
	call L_D238		;d20e
L_D211:
	ld a,(ix+000h)		;d211
	inc ix			;d214
	and a			;d216
	jr z,L_D238		;d217
	call L_D252		;d219
	jr L_D211		;d21c
L_D21E:
	ld a,080h		;d21e
	ld de,0ce2bh		;d220
	push hl			;d223
	call L_C4D0		;d224
	inc a			;d227
	ld de,0d054h		;d228
	call L_C4D0		;d22b
	ld a,002h		;d22e
	ld de,0d05eh		;d230
	call L_C4D0		;d233
	pop hl			;d236
	ret			;d237
L_D238:
	ld a,0f3h		;d238
	ld (0c4d0h),a		;d23a
	ld (0c4a3h),a		;d23d
	xor a			;d240
	ld de,00000h		;d241
	push hl			;d244
	call L_C4D0		;d245
	inc a			;d248
	call L_C4D0		;d249
	inc a			;d24c
	call L_C4D0		;d24d
	pop hl			;d250
	ret			;d251
L_D252:
	ld bc,00bb8h		;d252
	push af			;d255
	call L_D305		;d256
	pop af			;d259
	cp 020h			;d25a
	jr nc,L_D2D3		;d25c
	call L_D117		;d25e
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
	call L_D238		;d28f
	ld bc,00000h		;d292
	call L_D305		;d295
	call L_D305		;d298
	jp L_D21E		;d29b
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
	call L_D117		;d2b8
L_D2BB:
	ld a,07fh		;d2bb
	out (098h),a		;d2bd
	and a			;d2bf
	and a			;d2c0
	djnz L_D2BB		;d2c1
	ei			;d2c3
	push hl			;d2c4
	call L_D238		;d2c5
	ld bc,00fa0h		;d2c8
	call L_D305		;d2cb
	call L_D21E		;d2ce
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
	call L_D117		;d2e0
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
	call L_D117		;d2f2
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
L_D305:
	dec bc			;d305
	ld a,b			;d306
	or c			;d307
	jr nz,L_D305		;d308
	ret			;d30a
L_D30B:
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
L_D31C:
	ld hl,02108h		;d31c
	ld c,038h		;d31f
	call L_D331		;d321
	ld hl,02900h		;d324
	ld c,040h		;d327
	call L_D331		;d329
	ld hl,03100h		;d32c
	ld c,028h		;d32f
L_D331:
	ld b,018h		;d331
L_D333:
	call L_D117		;d333
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
; CODIGO 0xd35b..0xd675  (794 bytes)
; ======================================================================


L_D35B:
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
	call L_D117		;d36b
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
	jp L_D35B		;d380
L_D383:
	ld de,04000h		;d383
	ld hl,00108h		;d386
	ld b,038h		;d389
	call L_D3A6		;d38b
	ld de,04540h		;d38e
	ld hl,00900h		;d391
	ld b,040h		;d394
	call L_D3A6		;d396
	ld de,04b40h		;d399
	ld hl,01100h		;d39c
	ld b,028h		;d39f
	call L_D3A6		;d3a1
	ei			;d3a4
	ret			;d3a5
L_D3A6:
	ld c,018h		;d3a6
L_D3A8:
	push bc			;d3a8
	call L_D117		;d3a9
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
	call L_AC1F		;d3c4
	call L_D383		;d3c7
	ld ix,0b940h		;d3ca
	ld hl,00118h		;d3ce
	call L_D20E		;d3d1
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
	call L_D30B		;d3ec
	jr nz,L_D3EC		;d3ef
	ld bc,007d0h		;d3f1
	call L_B71A		;d3f4
	call L_D19F		;d3f7
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
	call L_D252		;d420
	pop de			;d423
	inc de			;d424
	pop bc			;d425
	djnz L_D3EA		;d426
L_D428:
	ld a,00dh		;d428
	call L_D252		;d42a
	call L_D238		;d42d
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
	call L_D117		;d446
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
	call L_D117		;d459
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
L_D472:
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
L_D48C:
	nop			;d48c
	rst 38h			;d48d
	nop			;d48e
	rst 38h			;d48f
	jr nz,$+1		;d490
	nop			;d492
	rst 38h			;d493
	ld (bc),a		;d494
	rst 38h			;d495
	nop			;d496
	rst 38h			;d497
	ld bc,000ffh		;d498
	rst 38h			;d49b
	ld bc,000ffh		;d49c
	rst 38h			;d49f
	jr nz,$+1		;d4a0
	nop			;d4a2
	rst 38h			;d4a3
	ld bc,040ffh		;d4a4
	rst 38h			;d4a7
	nop			;d4a8
	rst 38h			;d4a9
	inc b			;d4aa
	rst 38h			;d4ab
	inc bc			;d4ac
	rst 38h			;d4ad
	ld b,h			;d4ae
	rst 38h			;d4af
	nop			;d4b0
	rst 38h			;d4b1
	inc b			;d4b2
	rst 38h			;d4b3
	ld hl,004ffh		;d4b4
	rst 38h			;d4b7
	ld (bc),a		;d4b8
	rst 38h			;d4b9
	inc h			;d4ba
	rst 38h			;d4bb
	nop			;d4bc
	rst 38h			;d4bd
	inc b			;d4be
	rst 38h			;d4bf
	nop			;d4c0
	rst 38h			;d4c1
	nop			;d4c2
	rst 38h			;d4c3
	nop			;d4c4
	rst 38h			;d4c5
	ld bc,040ffh		;d4c6
	rst 38h			;d4c9
	nop			;d4ca
	rst 38h			;d4cb
	nop			;d4cc
	rst 38h			;d4cd
	nop			;d4ce
	rst 38h			;d4cf
	ld b,b			;d4d0
	rst 38h			;d4d1
	nop			;d4d2
	rst 38h			;d4d3
	ld b,b			;d4d4
	rst 38h			;d4d5
	nop			;d4d6
	rst 38h			;d4d7
	inc b			;d4d8
	rst 38h			;d4d9
	nop			;d4da
	rst 38h			;d4db
	nop			;d4dc
	rst 38h			;d4dd
	nop			;d4de
	rst 38h			;d4df
	ld b,b			;d4e0
	rst 38h			;d4e1
	nop			;d4e2
	rst 38h			;d4e3
	ld b,h			;d4e4
	rst 38h			;d4e5
	nop			;d4e6
	rst 38h			;d4e7
	ld h,b			;d4e8
	rst 38h			;d4e9
	nop			;d4ea
	rst 38h			;d4eb
	nop			;d4ec
	rst 38h			;d4ed
	nop			;d4ee
	rst 38h			;d4ef
	nop			;d4f0
	rst 38h			;d4f1
	nop			;d4f2
	rst 38h			;d4f3
	nop			;d4f4
	rst 38h			;d4f5
	nop			;d4f6
	rst 38h			;d4f7
	ld b,b			;d4f8
	rst 38h			;d4f9
	nop			;d4fa
	rst 38h			;d4fb
	nop			;d4fc
	rst 38h			;d4fd
	nop			;d4fe
	rst 28h			;d4ff
	rst 38h			;d500
	ld b,b			;d501
	ei			;d502
	ld b,b			;d503
	rst 38h			;d504
	ld b,b			;d505
	rst 38h			;d506
	ld b,b			;d507
	rst 38h			;d508
	ld b,c			;d509
	ei			;d50a
	nop			;d50b
	rst 38h			;d50c
	ld b,b			;d50d
	rst 38h			;d50e
	nop			;d50f
	defb 0fdh,000h,0ffh ;illegal sequence	;d510
	ld bc,040ffh		;d513
	rst 38h			;d516
	ld b,c			;d517
	rst 38h			;d518
	ld b,c			;d519
	rst 38h			;d51a
	ld b,b			;d51b
	rst 38h			;d51c
	ld b,b			;d51d
	rst 38h			;d51e
	nop			;d51f
	rst 38h			;d520
	ld b,b			;d521
	rst 38h			;d522
	ld b,b			;d523
	defb 0fdh,040h,0ffh ;illegal sequence	;d524
	ld bc,041ffh		;d527
	rst 38h			;d52a
	nop			;d52b
	rst 38h			;d52c
	ld b,b			;d52d
	ld sp,hl		;d52e
	ld bc,041ffh		;d52f
	rst 38h			;d532
	nop			;d533
	rst 38h			;d534
	ld b,b			;d535
	ei			;d536
	nop			;d537
	defb 0fdh,041h,0fbh ;illegal sequence	;d538
	ld bc,040ffh		;d53b
	rst 38h			;d53e
	nop			;d53f
	ei			;d540
	ld b,b			;d541
	rst 38h			;d542
	ld b,b			;d543
	ei			;d544
	ld b,b			;d545
	rst 38h			;d546
	ld b,b			;d547
	ei			;d548
	ld b,c			;d549
	rst 38h			;d54a
	nop			;d54b
	ei			;d54c
	ld b,b			;d54d
	ei			;d54e
	nop			;d54f
	ld sp,hl		;d550
	ld b,b			;d551
	rst 38h			;d552
	nop			;d553
	ld sp,hl		;d554
	ld b,b			;d555
	rst 38h			;d556
	ld b,b			;d557
	ei			;d558
	ld b,b			;d559
	rst 38h			;d55a
	ld b,b			;d55b
	ei			;d55c
	ld b,b			;d55d
	rst 38h			;d55e
	nop			;d55f
	ei			;d560
	ld b,b			;d561
	rst 38h			;d562
	ld b,b			;d563
	ei			;d564
	ld b,b			;d565
	rst 38h			;d566
	ld b,b			;d567
	ei			;d568
	ld b,c			;d569
	defb 0fdh,040h,0fbh ;illegal sequence	;d56a
	ld b,b			;d56d
	rst 38h			;d56e
	ld b,b			;d56f
	ei			;d570
	ld b,b			;d571
	ld sp,hl		;d572
	nop			;d573
	ei			;d574
	ld b,b			;d575
	rst 38h			;d576
	ld b,c			;d577
	rst 38h			;d578
	ld b,b			;d579
	defb 0fdh,040h,0fbh ;illegal sequence	;d57a
	ld b,b			;d57d
	rst 38h			;d57e
L_D57F:
	ld d,c			;d57f
	nop			;d580
	rst 38h			;d581
	inc b			;d582
	rst 38h			;d583
	ld bc,004ffh		;d584
	rst 38h			;d587
	nop			;d588
	rst 38h			;d589
	ld b,h			;d58a
	rst 38h			;d58b
	nop			;d58c
	rst 38h			;d58d
	inc b			;d58e
	rst 38h			;d58f
	jr nz,$+1		;d590
	inc b			;d592
	rst 38h			;d593
	ld (bc),a		;d594
	rst 38h			;d595
	inc b			;d596
	rst 38h			;d597
	ld bc,004ffh		;d598
	rst 38h			;d59b
	ld bc,004ffh		;d59c
	rst 38h			;d59f
	jr nz,$+1		;d5a0
	inc b			;d5a2
	rst 38h			;d5a3
	dec b			;d5a4
	rst 38h			;d5a5
	ld b,h			;d5a6
	rst 38h			;d5a7
	nop			;d5a8
	rst 38h			;d5a9
	inc b			;d5aa
	rst 38h			;d5ab
	rlca			;d5ac
	rst 38h			;d5ad
	ld b,h			;d5ae
	rst 38h			;d5af
	inc b			;d5b0
	rst 38h			;d5b1
	inc b			;d5b2
	rst 38h			;d5b3
	dec h			;d5b4
	rst 38h			;d5b5
	inc b			;d5b6
	rst 38h			;d5b7
	ld (bc),a		;d5b8
	rst 38h			;d5b9
	inc h			;d5ba
	rst 38h			;d5bb
	inc b			;d5bc
	rst 38h			;d5bd
	inc b			;d5be
	rst 38h			;d5bf
	nop			;d5c0
	rst 38h			;d5c1
	nop			;d5c2
	rst 38h			;d5c3
	inc b			;d5c4
	rst 38h			;d5c5
	ld bc,040ffh		;d5c6
	rst 38h			;d5c9
	nop			;d5ca
	rst 38h			;d5cb
	inc b			;d5cc
	rst 38h			;d5cd
	nop			;d5ce
	rst 38h			;d5cf
	ld b,b			;d5d0
	rst 38h			;d5d1
	nop			;d5d2
	rst 38h			;d5d3
	ld b,b			;d5d4
	rst 38h			;d5d5
	nop			;d5d6
	rst 38h			;d5d7
	inc b			;d5d8
	rst 38h			;d5d9
	nop			;d5da
	rst 38h			;d5db
	inc b			;d5dc
	rst 38h			;d5dd
	nop			;d5de
	rst 38h			;d5df
	ld b,b			;d5e0
	rst 38h			;d5e1
	jr nz,$+1		;d5e2
	ld b,h			;d5e4
	rst 38h			;d5e5
	nop			;d5e6
	rst 38h			;d5e7
	ld h,b			;d5e8
	rst 38h			;d5e9
	nop			;d5ea
	rst 38h			;d5eb
	nop			;d5ec
	rst 38h			;d5ed
	nop			;d5ee
	rst 38h			;d5ef
	nop			;d5f0
	rst 38h			;d5f1
	nop			;d5f2
	rst 38h			;d5f3
	nop			;d5f4
	rst 38h			;d5f5
	nop			;d5f6
	rst 38h			;d5f7
	ld b,b			;d5f8
	rst 38h			;d5f9
	nop			;d5fa
	rst 38h			;d5fb
	nop			;d5fc
	rst 38h			;d5fd
	nop			;d5fe
	rst 38h			;d5ff
	rst 38h			;d600
	nop			;d601
	rst 38h			;d602
	nop			;d603
	rst 38h			;d604
	nop			;d605
	rst 38h			;d606
	nop			;d607
	rst 38h			;d608
	ld bc,000ffh		;d609
	rst 38h			;d60c
	nop			;d60d
	rst 38h			;d60e
	nop			;d60f
	defb 0fdh,000h,0ffh ;illegal sequence	;d610
	ld bc,000ffh		;d613
	rst 38h			;d616
	ld bc,001ffh		;d617
	rst 38h			;d61a
	nop			;d61b
	rst 38h			;d61c
	nop			;d61d
	cp a			;d61e
	nop			;d61f
	rst 38h			;d620
	nop			;d621
	rst 38h			;d622
	nop			;d623
	defb 0fdh,000h,0ffh ;illegal sequence	;d624
	ld bc,001ffh		;d627
	rst 38h			;d62a
	nop			;d62b
	rst 38h			;d62c
	nop			;d62d
	defb 0fdh,001h,0ffh ;illegal sequence	;d62e
	dec b			;d631
	rst 38h			;d632
	nop			;d633
	rst 38h			;d634
	nop			;d635
	rst 38h			;d636
	nop			;d637
	defb 0fdh,001h,0ffh ;illegal sequence	;d638
	ld bc,000ffh		;d63b
	rst 38h			;d63e
	nop			;d63f
	cp a			;d640
	inc b			;d641
	rst 38h			;d642
	inc b			;d643
	rst 38h			;d644
	nop			;d645
	rst 38h			;d646
	inc b			;d647
	cp a			;d648
	dec b			;d649
	rst 38h			;d64a
	inc b			;d64b
	cp a			;d64c
	inc b			;d64d
	rst 38h			;d64e
	inc b			;d64f
	defb 0fdh,000h,0ffh ;illegal sequence	;d650
	inc b			;d653
	defb 0fdh,000h,0ffh ;illegal sequence	;d654
	inc b			;d657
	cp a			;d658
	nop			;d659
	rst 38h			;d65a
	inc b			;d65b
	cp a			;d65c
	nop			;d65d
	rst 38h			;d65e
	inc b			;d65f
	cp a			;d660
	nop			;d661
	rst 38h			;d662
	inc b			;d663
	cp a			;d664
	nop			;d665
	rst 38h			;d666
	inc b			;d667
	cp a			;d668
	ld bc,004fdh		;d669
	rst 38h			;d66c
	nop			;d66d
	rst 38h			;d66e
	nop			;d66f
	rst 38h			;d670
	nop			;d671
	defb 0fdh,004h,002h	;d672
