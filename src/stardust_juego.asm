; ==========================================================================
; STARDUST - MSX - el juego de naves, zonas 1 a 7
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x047a0


; ----------------------------------------------------------------------
; Etiquetas que no caen en ninguna posicion emitida del listado
; (destinos fuera del binario o dentro de una instruccion).
; ----------------------------------------------------------------------
L_4A2F:	equ 0x04a2f
L_4A37:	equ 0x04a37
L_4A76:	equ 0x04a76
L_4AA6:	equ 0x04aa6
L_4AAA:	equ 0x04aaa
L_5147:	equ 0x05147
L_5152:	equ 0x05152
L_55BE:	equ 0x055be
L_55BF:	equ 0x055bf
L_55FE:	equ 0x055fe
L_6182:	equ 0x06182
L_70CA:	equ 0x070ca
L_722B:	equ 0x0722b
L_7241:	equ 0x07241
L_7F2B:	equ 0x07f2b
L_7FBF:	equ 0x07fbf
L_868F:	equ 0x0868f
L_871A:	equ 0x0871a
L_8810:	equ 0x08810
L_91B6:	equ 0x091b6
L_91B7:	equ 0x091b7
L_9259:	equ 0x09259
L_9377:	equ 0x09377
L_93A1:	equ 0x093a1
L_93AE:	equ 0x093ae
L_93C6:	equ 0x093c6
L_943A:	equ 0x0943a
L_9559:	equ 0x09559
L_9595:	equ 0x09595
L_96C5:	equ 0x096c5
L_9906:	equ 0x09906
L_993E:	equ 0x0993e
L_994E:	equ 0x0994e
L_9998:	equ 0x09998
L_9999:	equ 0x09999
L_99B9:	equ 0x099b9
L_9A2E:	equ 0x09a2e
L_9CAF:	equ 0x09caf
L_9CDB:	equ 0x09cdb
L_9DB2:	equ 0x09db2
L_9E40:	equ 0x09e40
L_A2E5:	equ 0x0a2e5
L_A469:	equ 0x0a469
L_A865:	equ 0x0a865
L_A892:	equ 0x0a892
L_A89C:	equ 0x0a89c
L_AC72:	equ 0x0ac72
L_B211:	equ 0x0b211
L_B758:	equ 0x0b758
L_B99A:	equ 0x0b99a
L_BC4B:	equ 0x0bc4b
L_BE55:	equ 0x0be55
L_BEAA:	equ 0x0beaa
L_C3C5:	equ 0x0c3c5
L_C407:	equ 0x0c407
L_C41D:	equ 0x0c41d
L_C4B2:	equ 0x0c4b2
L_CC02:	equ 0x0cc02
L_CF02:	equ 0x0cf02
L_D054:	equ 0x0d054
L_D438:	equ 0x0d438
L_D517:	equ 0x0d517
L_D544:	equ 0x0d544
L_D554:	equ 0x0d554
L_D5DC:	equ 0x0d5dc
L_D600:	equ 0x0d600
L_D854:	equ 0x0d854
L_DB42:	equ 0x0db42
L_DB76:	equ 0x0db76
L_DB8A:	equ 0x0db8a
L_DB8C:	equ 0x0db8c
L_DC3B:	equ 0x0dc3b
L_DC6F:	equ 0x0dc6f
L_DD30:	equ 0x0dd30
L_DD45:	equ 0x0dd45
L_DD4D:	equ 0x0dd4d
L_DD59:	equ 0x0dd59
L_DD60:	equ 0x0dd60
L_DD63:	equ 0x0dd63
L_DD68:	equ 0x0dd68
L_DD6A:	equ 0x0dd6a
L_DD6C:	equ 0x0dd6c
L_DD7A:	equ 0x0dd7a
L_DD89:	equ 0x0dd89
L_DD8F:	equ 0x0dd8f
L_DD91:	equ 0x0dd91
L_DD97:	equ 0x0dd97
L_DDAD:	equ 0x0ddad
L_DDE1:	equ 0x0dde1
L_DDFE:	equ 0x0ddfe
L_DE02:	equ 0x0de02
L_DEE9:	equ 0x0dee9
L_DF44:	equ 0x0df44
L_E2AB:	equ 0x0e2ab
L_E650:	equ 0x0e650
L_E785:	equ 0x0e785
L_E79D:	equ 0x0e79d
L_E803:	equ 0x0e803
L_E80F:	equ 0x0e80f
L_E854:	equ 0x0e854
L_E85F:	equ 0x0e85f
L_E884:	equ 0x0e884
L_E89A:	equ 0x0e89a
L_E8B2:	equ 0x0e8b2
L_E8D5:	equ 0x0e8d5
L_E9B3:	equ 0x0e9b3
L_E9EB:	equ 0x0e9eb
L_EA26:	equ 0x0ea26
L_EA2B:	equ 0x0ea2b
L_EA31:	equ 0x0ea31
L_EAAA:	equ 0x0eaaa
L_EB0F:	equ 0x0eb0f
L_EB3C:	equ 0x0eb3c
L_EC29:	equ 0x0ec29
L_EC33:	equ 0x0ec33
L_EC37:	equ 0x0ec37
L_ECBE:	equ 0x0ecbe
L_EE38:	equ 0x0ee38
L_EEAA:	equ 0x0eeaa
L_EFBB:	equ 0x0efbb
L_F11E:	equ 0x0f11e
L_F144:	equ 0x0f144
L_F14A:	equ 0x0f14a
L_F14E:	equ 0x0f14e
L_F152:	equ 0x0f152
L_F156:	equ 0x0f156
L_F160:	equ 0x0f160
L_F196:	equ 0x0f196
L_F19E:	equ 0x0f19e
L_F1A6:	equ 0x0f1a6
L_F1B8:	equ 0x0f1b8
L_F1C0:	equ 0x0f1c0
L_F1C3:	equ 0x0f1c3
L_F1CB:	equ 0x0f1cb
L_F1CE:	equ 0x0f1ce
L_F1D2:	equ 0x0f1d2
L_F1D5:	equ 0x0f1d5
L_F1E6:	equ 0x0f1e6
L_F1EA:	equ 0x0f1ea
L_F1FC:	equ 0x0f1fc
L_F262:	equ 0x0f262
L_F2DF:	equ 0x0f2df
L_F31F:	equ 0x0f31f
L_F3F1:	equ 0x0f3f1
L_F849:	equ 0x0f849

; ----------------------------------------------------------------------
; Destinos de salto que z80dasm referencia pero que el trazador no
; marco como codigo. Cada uno es un sitio a revisar: probablemente
; hay codigo ahi que falta por trazar.
; ----------------------------------------------------------------------
lcb9dh:	equ 0x0cb9d
lef00h:	equ 0x0ef00

; ----------------------------------------------------------------------
; DATOS graficos: (434 B; racha 4.21, entropia 5.08, 84 valores: rachas mas largas que el azar)
;   0x47a0..0x4952  (434 bytes)
; ----------------------------------------------------------------------
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 47a0  ................
	defb 000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0fch,000h,01fh,0ffh,0ffh,0ffh,0c0h	; 47b0  ................
	defb 000h,003h,0ffh,080h,003h,081h,0e0h,01ch,003h,0c0h,000h,07fh,0e0h,000h,0ffh,0fch	; 47c0  ................
	defb 000h,007h,0ffh,0bfh,0fbh,03ch,0efh,0c5h,0f9h,01ch,038h,0ffh,0efh,0feh,0f0h,000h	; 47d0  .....<....8.....
	defb 000h,007h,080h,03fh,0f8h,07eh,00fh,0f1h,0feh,01ch,038h,0e0h,00fh,0feh,000h,000h	; 47e0  ...?.~....8.....
	defb 000h,007h,080h,03fh,0f8h,07eh,00fh,0f9h,0ffh,01ch,038h,0e0h,00fh,0feh,000h,000h	; 47f0  ...?.~....8.....
	defb 000h,007h,0f0h,003h,080h,0e7h,00eh,039h,0c7h,01ch,038h,0fch,000h,0e0h,000h,000h	; 4800  .......9..8.....
	defb 000h,003h,0fch,003h,080h,0e7h,00eh,039h,0c3h,09ch,038h,07fh,000h,0e0h,000h,000h	; 4810  .......9..8.....
	defb 000h,000h,0feh,003h,080h,0e7h,00fh,0f9h,0c3h,09ch,038h,01fh,080h,0e0h,000h,000h	; 4820  ..........8.....
	defb 000h,000h,00eh,003h,081h,0c3h,08fh,0f1h,0c3h,09ch,038h,003h,080h,0e0h,000h,000h	; 4830  ..........8.....
	defb 000h,000h,00eh,003h,081h,0ffh,08fh,0e1h,0c3h,09ch,038h,003h,080h,0e0h,000h,000h	; 4840  ..........8.....
	defb 000h,000h,03eh,003h,081h,0ffh,08eh,0e1h,0c7h,01eh,078h,00fh,080h,0e0h,000h,000h	; 4850  ..>.......x.....
	defb 03fh,0ffh,0fch,003h,083h,0ffh,0ceh,071h,0ffh,01fh,0f9h,0ffh,000h,0e0h,000h,000h	; 4860  ?......q........
	defb 007h,0ffh,0f8h,003h,083h,081h,0ceh,039h,0feh,00fh,0f3h,0feh,000h,0e0h,000h,000h	; 4870  .......9........
	defb 000h,07fh,0e0h,003h,083h,081h,0ceh,039h,0f8h,003h,0c7h,0f8h,000h,0e0h,000h,000h	; 4880  .......9........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 4890  ................
	defb 07eh,0ceh,0b6h,0b6h,0ceh,0f8h,0e0h,0c0h,0aah,07fh,02ah,000h,0f8h,091h,0e2h,005h	; 48a0  ~.........*.....
	defb 0cbh,04ah,0cah,04ah,0cah,04ah,0cah,04ah,0cah,04ah,0cah,04ah,0cah,0aah,06ah,010h	; 48b0  .J.J.J.J.J.J..j.
	defb 02ch,05ch,02ch,05ch,03ch,05ch,03ch,05ch,000h,04ah,0eah,0aah,0eah,04ah,00ah,000h	; 48c0  ,\,\<\<\.J...J..
	defb 03fh,02bh,035h,03fh,000h,01ah,01ah,01ah,000h,07ch,000h,0feh,0bah,0feh,0feh,0feh	; 48d0  ?+5?.....|......
	defb 000h,0c0h,0deh,0deh,0c0h,03eh,062h,032h,09eh,0e0h,080h,03eh,0beh,000h,0feh,080h	; 48e0  .....>b2...>....
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h,000h,018h,024h,05ah,05ah,024h,018h,000h	; 48f0  ..$ZZ$....$ZZ$..
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h,000h,018h,024h,05ah,05ah,024h,018h,000h	; 4900  ..$ZZ$....$ZZ$..
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h,000h,018h,024h,05ah,05ah,024h,018h,000h	; 4910  ..$ZZ$....$ZZ$..
	defb 0ffh,0bfh,0ffh,0fbh,0f5h,0c4h,0e4h,0fbh,0ffh,0ffh,0ffh,0c0h,0eah,0ffh,0ffh,0efh	; 4920  ................
	defb 0d7h,0d0h,0d2h,0efh,0ffh,0fdh,0fah,0c2h,0eah,0fdh,0ffh,0ffh,0ffh,0c0h,0eah,0ffh	; 4930  ................
	defb 0ffh,0f7h,0ebh,0c8h,0eah,0f7h,0bfh,0ffh,000h,000h,06fh,000h,017h,000h,06fh,000h	; 4940  ..........o...o.
	defb 017h,000h	; 4950  ..

; ======================================================================
; CODIGO 0x4952..0x49e3  (145 bytes)
; ======================================================================


L_4952:
	ld l,a			;4952
	nop			;4953
	rla			;4954
	nop			;4955
	ld l,a			;4956
	nop			;4957
	rla			;4958
	nop			;4959
	ld l,a			;495a
	nop			;495b
	rla			;495c
	nop			;495d
	ld l,a			;495e
	nop			;495f
	rst 38h			;4960
	defb 0fdh,0ffh,0ffh ;illegal sequence	;4961
	rst 38h			;4964
	inc bc			;4965
	xor a			;4966
	rst 38h			;4967
	rst 38h			;4968
	cp a			;4969
	ld e,a			;496a
	ld b,e			;496b
	ld c,a			;496c
	cp a			;496d
	rst 38h			;496e
	rst 38h			;496f
	rst 38h			;4970
	inc bc			;4971
	xor a			;4972
	rst 38h			;4973
	rst 38h			;4974
	rst 38h			;4975
	rst 38h			;4976
	inc bc			;4977
	xor a			;4978
	rst 38h			;4979
	rst 38h			;497a
	rst 28h			;497b
	rst 10h			;497c
	inc de			;497d
	sub a			;497e
	rst 28h			;497f
	rst 38h			;4980
	rst 38h			;4981
	rst 38h			;4982
	inc bc			;4983
	xor a			;4984
	rst 38h			;4985
	defb 0fdh,0ffh,000h ;illegal sequence	;4986
	nop			;4989
	cp 000h			;498a
	ret m			;498c
	nop			;498d
	cp 000h			;498e
	ret m			;4990
	nop			;4991
	cp 000h			;4992
	ret m			;4994
	nop			;4995
	cp 000h			;4996
	ret m			;4998
	nop			;4999
	cp 000h			;499a
	ret m			;499c
	nop			;499d
	cp 000h			;499e
	cp d			;49a0
	cp 000h			;49a1
	ld a,h			;49a3
	nop			;49a4
	cp 0eeh			;49a5
	sub 0d6h		;49a7
	sub 054h		;49a9
	jr c,$+58		;49ab
	nop			;49ad
	cp 0deh			;49ae
	xor d			;49b0
	nop			;49b1
	djnz L_49B4		;49b2
L_49B4:
	jr c,L_49CE		;49b4
	jr c,L_49B8		;49b6
L_49B8:
	djnz L_49CA		;49b8
	djnz L_49CC		;49ba
	djnz L_49CE		;49bc
	djnz L_49C0		;49be
L_49C0:
	jr c,$+58		;49c0
	nop			;49c2
	ld e,h			;49c3
	nop			;49c4
	cp (hl)			;49c5
	ld a,(hl)		;49c6
	cp (hl)			;49c7
	ld a,(hl)		;49c8
	nop			;49c9
L_49CA:
	ld e,h			;49ca
	nop			;49cb
L_49CC:
	jr c,L_49CE		;49cc
L_49CE:
	ld e,h			;49ce
	nop			;49cf
	jr c,L_49D2		;49d0
L_49D2:
	ld e,h			;49d2
	nop			;49d3
	jr c,L_49D6		;49d4
L_49D6:
	ld e,h			;49d6
	nop			;49d7
	ld d,016h		;49d8
	ld d,006h		;49da
	ld a,(03a1ah)		;49dc
	ld a,(de)		;49df
	nop			;49e0
	jr $+38			;49e1

; ----------------------------------------------------------------------
; DATOS relleno: o resto (2 B; 2 bytes)
;   0x49e3..0x49e5  (2 bytes)
; ----------------------------------------------------------------------
	defb 05ah,05ah	; 49e3  ZZ

; ======================================================================
; CODIGO 0x49e5..0x49eb  (6 bytes)
; ======================================================================


L_49E5:
	inc h			;49e5
	jr L_49E8		;49e6
L_49E8:
	nop			;49e8
	jr $+38			;49e9

; ----------------------------------------------------------------------
; DATOS tabla: (15 B; racha 2.67, entropia 1.99, 4 valores: pocos valores para ser un dibujo)
;   0x49eb..0x49fa  (15 bytes)
; ----------------------------------------------------------------------
	defb 05ah,05ah,024h,018h,000h,000h,018h,024h,05ah,05ah,024h,018h,000h,000h,018h	; 49eb  ZZ$....$ZZ$....

; ======================================================================
; CODIGO 0x49fa..0x4a03  (9 bytes)
; ======================================================================


L_49FA:
	inc h			;49fa
	ld e,d			;49fb
	ld e,d			;49fc
	inc h			;49fd
	jr L_4A00		;49fe
L_4A00:
	nop			;4a00
	jr $+38			;4a01

; ----------------------------------------------------------------------
; DATOS relleno: o resto (4 B; 4 bytes)
;   0x4a03..0x4a07  (4 bytes)
; ----------------------------------------------------------------------
	defb 05ah,05ah,024h,018h	; 4a03  ZZ$.

; ======================================================================
; CODIGO 0x4a07..0x4a0b  (4 bytes)
; ======================================================================


L_4A07:
	nop			;4a07
	nop			;4a08
	jr $+38			;4a09

; ----------------------------------------------------------------------
; DATOS relleno: o resto (4 B; 4 bytes)
;   0x4a0b..0x4a0f  (4 bytes)
; ----------------------------------------------------------------------
	defb 05ah,05ah,024h,018h	; 4a0b  ZZ$.

; ======================================================================
; CODIGO 0x4a0f..0x4a13  (4 bytes)
; ======================================================================


L_4A0F:
	nop			;4a0f
	nop			;4a10
	jr $+38			;4a11

; ----------------------------------------------------------------------
; DATOS tabla: (20 B; racha 2.76, entropia 2.47, 6 valores: pocos valores para ser un dibujo)
;   0x4a13..0x4a27  (20 bytes)
; ----------------------------------------------------------------------
	defb 05ah,05ah,024h,018h,000h,000h,018h,024h,05ah,05ah,024h,018h,000h,017h,000h,06fh	; 4a13  ZZ$....$ZZ$....o
	defb 000h,017h,000h,06fh	; 4a23  ...o

; ======================================================================
; CODIGO 0x4a27..0x4ae3  (188 bytes)
; ======================================================================


L_4A27:
	nop			;4a27
	xor e			;4a28
	ld d,l			;4a29
L_4A2A:
	nop			;4a2a
	jr nc,$+123		;4a2b
	ld a,(0397ah)		;4a2d
	ld a,b			;4a30
	add hl,sp		;4a31
	jp c,L_DAD9		;4a32
	exx			;4a35
	jp c,038d9h		;4a36
	scf			;4a39
	ld d,a			;4a3a
	jr c,$+59		;4a3b
	jp c,0aae9h		;4a3d
	ld l,b			;4a40
	ld l,d			;4a41
	add hl,de		;4a42
	ld e,d			;4a43
	add hl,sp		;4a44
	ld a,d			;4a45
	ld a,c			;4a46
	ld (07801h),a		;4a47
	inc bc			;4a4a
	ld sp,03133h		;4a4b
	inc (hl)		;4a4e
	ld (03235h),a		;4a4f
	dec (hl)		;4a52
	ld (07a05h),a		;4a53
	call L_9584		;4a56
	call z,00479h		;4a59
	ld a,055h		;4a5c
	ld l,e			;4a5e
	ccf			;4a5f
	ret m			;4a60
	nop			;4a61
	cp 000h			;4a62
	ret m			;4a64
	nop			;4a65
	cp 000h			;4a66
	rst 38h			;4a68
	ld d,l			;4a69
	nop			;4a6a
	ld (hl),b		;4a6b
	call m,0fe02h		;4a6c
	cp 02eh			;4a6f
L_4A71:
	cp 0feh			;4a71
	cp 0feh			;4a73
	add a,0bah		;4a75
	xor d			;4a77
	ld a,d			;4a78
	jp pe,06afah		;4a79
	cp d			;4a7c
	cp d			;4a7d
	add a,0feh		;4a7e
	ld d,d			;4a80
	cp 0feh			;4a81
	cp 0feh			;4a83
	cp 0feh			;4a85
	ld (bc),a		;4a87
	call m,00070h		;4a88
	nop			;4a8b
	add a,b			;4a8c
	ret po			;4a8d
	or b			;4a8e
	ld d,b			;4a8f
	jr c,L_4A2A		;4a90
L_4A92:
	ld c,b			;4a92
	sbc a,h			;4a93
	ld c,h			;4a94
	and h			;4a95
	ld c,h			;4a96
	and h			;4a97
	ld c,h			;4a98
	and h			;4a99
	ld c,h			;4a9a
	and h			;4a9b
	ld c,h			;4a9c
	nop			;4a9d
	sbc a,(hl)		;4a9e
	sbc a,(hl)		;4a9f
	ld a,(03a1ah)		;4aa0
	ld b,016h		;4aa3
	ld b,03ah		;4aa5
	ld a,(de)		;4aa7
	ld a,(02a1ah)		;4aa8
	ld a,(de)		;4aab
	ld a,(03a1ah)		;4aac
	ld a,(01606h)		;4aaf
	ld d,016h		;4ab2
	ld d,016h		;4ab4
	ld d,016h		;4ab6
	ld d,000h		;4ab8
	ccf			;4aba
	dec hl			;4abb
	dec (hl)		;4abc
	ccf			;4abd
	nop			;4abe
	ld d,016h		;4abf
	ld d,000h		;4ac1
	ccf			;4ac3
	dec hl			;4ac4
	dec (hl)		;4ac5
	ccf			;4ac6
	nop			;4ac7
	ld d,016h		;4ac8
	ld d,016h		;4aca
	ld d,016h		;4acc
	rla			;4ace
	nop			;4acf
	rst 38h			;4ad0
	cp h			;4ad1
	di			;4ad2
	xor 0d9h		;4ad3
	jp nc,0aab5h		;4ad5
	and l			;4ad8
	or d			;4ad9
	push de			;4ada
	ret c			;4adb
	xor 0f3h		;4adc
	cp h			;4ade
	rst 38h			;4adf
	nop			;4ae0
	jr $+38			;4ae1

; ----------------------------------------------------------------------
; DATOS tabla: (36 B; racha 2.50, entropia 2.00, 4 valores: pocos valores para ser un dibujo)
;   0x4ae3..0x4b07  (36 bytes)
; ----------------------------------------------------------------------
	defb 05ah,05ah,024h,018h,000h,000h,018h,024h,05ah,05ah,024h,018h,000h,000h,018h,024h	; 4ae3  ZZ$....$ZZ$....$
	defb 05ah,05ah,024h,018h,000h,000h,018h,024h,05ah,05ah,024h,018h,000h,000h,018h,024h	; 4af3  ZZ$....$ZZ$....$
	defb 05ah,05ah,024h,018h	; 4b03  ZZ$.

; ======================================================================
; CODIGO 0x4b07..0x4b0b  (4 bytes)
; ======================================================================


L_4B07:
	nop			;4b07
	nop			;4b08
	jr $+38			;4b09

; ----------------------------------------------------------------------
; DATOS datos: sin clasificar (36 B; racha 2.13, entropia 4.57, 26 valores)
;   0x4b0b..0x4b2f  (36 bytes)
; ----------------------------------------------------------------------
	defb 05ah,05ah,024h,018h,000h,0ffh,03dh,0cfh,077h,01bh,0abh,04dh,0a5h,055h,0adh,04bh	; 4b0b  ZZ$...=.w..M.U.K
	defb 09bh,077h,0cfh,03dh,0ffh,001h,03ch,07eh,006h,066h,03eh,046h,01ah,05ah,064h,03ah	; 4b1b  .w.=..<~.f>F.Zd:
	defb 001h,001h,01ah,064h	; 4b2b  ...d

; ======================================================================
; CODIGO 0x4b2f..0x4b40  (17 bytes)
; ======================================================================


L_4B2F:
	ld e,d			;4b2f
	ld a,(de)		;4b30
	ld b,h			;4b31
	inc a			;4b32
	ld a,h			;4b33
	nop			;4b34
	ld a,l			;4b35
	ld bc,0017dh		;4b36
	ld a,h			;4b39
	nop			;4b3a
	ld a,b			;4b3b
	rlca			;4b3c
	cpl			;4b3d
	daa			;4b3e
	dec hl			;4b3f

; ----------------------------------------------------------------------
; DATOS buffer: de pantalla: 40 columnas x 24 filas, leido por columnas
;   0x4b40..0x4f00  (960 bytes)
; DATOS graficos: (337 B; racha 3.49, entropia 4.38, 73 valores: rachas mas largas que el azar)
;   0x4f00..0x5051  (337 bytes)
; ----------------------------------------------------------------------
	defb 027h,02fh,027h,02bh,025h,02bh,025h,02ah,025h,00ah,000h,003h,004h,00dh,018h,011h	; 4b40  '/'+%+%*%.......
	defb 013h,013h,013h,013h,013h,013h,013h,013h,011h,060h,030h,076h,032h,076h,036h,076h	; 4b50  .........`0v2v6v
	defb 0deh,09eh,000h,038h,05ch,03eh,042h,01ah,05ah,026h,05ch,080h,080h,05ch,026h,05ah	; 4b60  ...8\>B.Z&\..\&Z
	defb 05ah,022h,056h,02ch,000h,0feh,002h,026h,0feh,000h,0fch,000h,0fch,0fdh,0fdh,0fdh	; 4b70  Z"V,...&........
	defb 0fdh,0fdh,0fdh,0fdh,0fdh,0fdh,0fdh,0fdh,07dh,0ach,000h,0f0h,008h,0edh,000h,0ffh	; 4b80  ........}.......
	defb 01fh,011h,03fh,070h,070h,070h,070h,000h,0ffh,049h,041h,000h,0f0h,037h,0f0h,000h	; 4b90  ..?pppp..IA..7..
	defb 0e7h,09ah,075h,0c8h,013h,076h,0edh,0dbh,012h,012h,012h,002h,03ah,01ah,02ah,01ah	; 4ba0  ..u..v......:.*.
	defb 02ah,01ah,03ah,002h,012h,012h,012h,06ah,0f3h,0efh,0d8h,057h,038h,03fh,07ch,079h	; 4bb0  *.:....j...W8?|y
	defb 0b3h,0d6h,0b4h,0d4h,0b4h,0d4h,0b6h,073h,005h,00ah,016h,075h,0e5h,0f5h,0f2h,06dh	; 4bc0  .......s...u...m
	defb 025h,00dh,015h,02dh,055h,0a3h,04fh,09eh,05ch,09ch,058h,098h,058h,098h,048h,086h	; 4bd0  %..-U.O.\.X.X.H.
	defb 080h,02ah,07fh,0ffh,0ffh,000h,0ffh,000h,000h,001h,006h,00ch,01dh,035h,03ch,06ch	; 4be0  .*...........5<l
	defb 06eh,04dh,07dh,07bh,015h,00eh,00eh,000h,000h,0d0h,0ech,077h,0f8h,0f7h,00ch,0f8h	; 4bf0  nM}{.......w....
	defb 03fh,023h,075h,079h,071h,071h,07fh,000h,0f8h,00ch,007h,0a0h,0f4h,0e5h,0d5h,025h	; 4c00  ?#uyqq.........%
	defb 055h,004h,070h,0b7h,0b0h,080h,000h,000h,03fh,021h,03ch,070h,070h,071h,07fh,000h	; 4c10  U.p.....?!<ppq..
	defb 0ffh,0ffh,000h,0aah,0ffh,000h,0ffh,000h,000h,080h,060h,0b0h,038h,02ch,03ch,036h	; 4c20  ..........`.8,<6
	defb 076h,0b2h,0beh,0deh,0a8h,070h,070h,000h,000h,00bh,037h,0eeh,01fh,0efh,030h,01fh	; 4c30  v....pp...7...0.
	defb 03eh,002h,03eh,070h,070h,071h,07fh,000h,01fh,030h,0e2h,00ah,012h,0fah,0f2h,0aah	; 4c40  >.>ppq...0......
	defb 052h,0aah,000h,0feh,001h,000h,000h,000h,018h,008h,01ch,01ch,01ch,01ch,01ch,000h	; 4c50  R...............
	defb 07fh,000h,055h,0ffh,0ffh,07fh,0beh,0d8h,040h,050h,058h,05ch,05ch,05ch,05ch,05ch	; 4c60  ..U.....@PX\\\\\
	defb 05ch,05ch,058h,040h,050h,050h,050h,050h,0c0h,0f0h,018h,0e8h,01ch,0fch,07eh,0beh	; 4c70  \\X@PPPP......~.
	defb 0ddh,06bh,02dh,02bh,02dh,02bh,06dh,0deh,080h,000h,000h,0e0h,0f8h,0fch,0fch,0e8h	; 4c80  .k-+-+m.........
	defb 050h,0a0h,000h,080h,0c0h,0e0h,070h,020h,010h,010h,010h,010h,010h,010h,010h,010h	; 4c90  P.....p ........
	defb 04fh,096h,059h,0bfh,075h,08bh,039h,07bh,0f9h,0c3h,037h,0c6h,0d4h,044h,056h,066h	; 4ca0  O.Y.u.9{..7..DVf
	defb 037h,035h,05ah,05dh,04fh,0aeh,046h,023h,031h,038h,058h,059h,0d9h,0b9h,0e1h,0d9h	; 4cb0  75Z]O.F#18XY....
	defb 025h,02dh,018h,000h,018h,018h,028h,028h,078h,07ch,044h,038h,06dh,0d3h,0d3h,06dh	; 4cc0  %-....((x|D8m..m
	defb 038h,000h,00fh,01fh,03fh,03ch,039h,03bh,032h,034h,034h,030h,034h,030h,034h,034h	; 4cd0  8...?<9;24404044
	defb 03fh,021h,03ch,070h,070h,071h,07fh,000h,03fh,021h,03ch,070h,070h,071h,07fh,000h	; 4ce0  ?!<ppq..?!<ppq..
	defb 03fh,021h,03ch,070h,070h,071h,07fh,000h,080h,0f0h,07eh,0bfh,09fh,0c7h,0e3h,0f9h	; 4cf0  ?!<ppq....~.....
	defb 0f8h,0f6h,0eeh,06dh,02dh,015h,049h,065h,000h,0fbh,000h,0a5h,0b7h,0a7h,0b7h,0afh	; 4d00  ...m-.Ie........
	defb 08fh,000h,0ffh,0ffh,000h,000h,080h,000h,0ffh,0ffh,0c1h,0c1h,0c1h,0c0h,0c3h,01ah	; 4d10  ................
	defb 03eh,002h,03eh,070h,070h,071h,07fh,000h,03eh,022h,00eh,007h,007h,047h,07fh,000h	; 4d20  >.>ppq..>"...G..
	defb 044h,044h,07ch,00eh,00eh,00eh,00eh,000h,031h,07fh,0ffh,060h,08ah,0d0h,0c5h,02bh	; 4d30  DD|.....1..`...+
	defb 07fh,0cfh,0b0h,054h,056h,056h,059h,05ch,000h,0dfh,000h,044h,0adh,0ech,0edh,0f4h	; 4d40  ...TVVY\...D....
	defb 0f0h,000h,0ffh,0ffh,000h,000h,000h,000h,0ffh,0ffh,083h,083h,083h,003h,0c3h,058h	; 4d50  ...............X
	defb 010h,010h,010h,000h,038h,038h,000h,0f8h,078h,0b8h,058h,098h,058h,098h,056h,097h	; 4d60  ....88..x.X.X.V.
	defb 057h,096h,058h,098h,058h,094h,04eh,03eh,0dfh,0efh,0e3h,019h,0bch,00fh,050h,0b0h	; 4d70  W.X.X.N>......P.
	defb 0e0h,0c0h,000h,000h,000h,000h,000h,000h,000h,000h,080h,060h,030h,098h,048h,0a4h	; 4d80  ...........`0.H.
	defb 006h,00fh,0f1h,0fah,0fch,038h,01ah,01bh,00bh,009h,00bh,009h,00ah,009h,00bh,009h	; 4d90  .....8..........
	defb 030h,034h,030h,030h,030h,030h,030h,030h,038h,038h,05ch,04fh,067h,0f0h,0dfh,0aah	; 4da0  0400000088\Og...
	defb 070h,03ch,00eh,005h,002h,004h,009h,013h,026h,00eh,074h,074h,074h,074h,074h,00ch	; 4db0  p<......&.ttttt.
	defb 02ch,00ch,074h,074h,074h,00ch,02eh,06eh,0c7h,003h,001h,000h,000h,001h,043h,05bh	; 4dc0  ,.ttt..n......C[
	defb 05bh,05bh,053h,05bh,053h,05bh,053h,04bh,051h,002h,001h,000h,000h,000h,000h,000h	; 4dd0  [[S[S[SKQ.......
	defb 01ah,0c3h,0c0h,0c1h,0c1h,0c1h,0ffh,0ffh,000h,000h,000h,000h,0ffh,000h,0ffh,0aah	; 4de0  ................
	defb 000h,01fh,0dfh,015h,000h,0f5h,0c0h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 4df0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,0c0h,0ffh,0ffh,000h,0c1h,0e7h,0efh	; 4e00  ................
	defb 0c8h,0aah,0cah,0eah,0c8h,0efh,0cfh,0ebh,0c5h,0a2h,041h,000h,000h,000h,000h,000h	; 4e10  ..........A.....
	defb 058h,0c3h,003h,083h,083h,083h,0ffh,0ffh,000h,000h,000h,000h,0ffh,000h,0ffh,0aah	; 4e20  X...............
	defb 000h,0f0h,0b7h,050h,002h,057h,003h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 4e30  ...P.W..........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0f7h,08fh,06fh,0e9h,0cdh,0edh	; 4e40  ............o...
	defb 0e9h,0edh,0cdh,0a9h,0cfh,0efh,0cfh,0efh,04fh,0afh,047h,02ah,005h,002h,000h,000h	; 4e50  ........O.G*....
	defb 00bh,00bh,009h,00bh,00bh,00bh,00ah,008h,01ch,01ch,03ah,0f2h,0e6h,00fh,0f5h,0aah	; 4e60  ..........:.....
	defb 000h,000h,015h,08ah,045h,022h,091h,0c8h,065h,074h,025h,034h,024h,034h,026h,032h	; 4e70  ....E"..et%4$4&2
	defb 020h,034h,026h,036h,026h,037h,067h,077h,0e0h,00fh,0dfh,0dfh,0dfh,09fh,05fh,09eh	; 4e80   4&6&7gw......_.
	defb 0ddh,0deh,0dfh,09fh,0dfh,09fh,0dfh,0deh,0dfh,08fh,0ddh,08eh,055h,08ah,005h,000h	; 4e90  ............U...
	defb 00fh,077h,038h,04eh,074h,075h,04fh,000h,0f8h,0f7h,00ch,0bah,035h,06ah,0c0h,03fh	; 4ea0  .w8NtuO.....5j.?
	defb 000h,0ffh,000h,0aah,055h,0aah,000h,0ffh,001h,0ffh,007h,0abh,055h,0a8h,000h,0ffh	; 4eb0  ....U.......U...
	defb 0c0h,0dfh,0c0h,0c0h,0dfh,01ah,000h,0ffh,000h,0ffh,000h,00eh,06eh,0afh,00fh,0f6h	; 4ec0  ............n...
	defb 0ddh,0c9h,0ddh,009h,05dh,029h,055h,009h,07ah,072h,07ah,072h,07ah,072h,02ah,052h	; 4ed0  ....])U.zrzrzr*R
	defb 0c0h,0f0h,0e1h,0eeh,0e0h,0d8h,0b0h,040h,000h,000h,0ffh,0beh,055h,000h,000h,000h	; 4ee0  .......@....U...
	defb 000h,003h,09eh,0b0h,08ah,005h,000h,000h,000h,0c6h,06fh,00dh,009h,046h,0a8h,010h	; 4ef0  ..........o..F..
	defb 000h,001h,001h,07dh,029h,000h,001h,000h,000h,055h,055h,055h,055h,000h,055h,000h	; 4f00  ...})....UUUU.U.
	defb 000h,000h,007h,074h,07ah,001h,000h,000h,000h,000h,0c0h,05eh,0bah,000h,000h,000h	; 4f10  ...tz......^....
	defb 000h,000h,0feh,0feh,074h,0aah,000h,000h,000h,000h,000h,0ffh,0bah,000h,000h,000h	; 4f20  ....t...........
	defb 000h,000h,000h,0feh,0bah,000h,000h,000h,055h,0aah,0ffh,0bfh,09fh,0c0h,0e0h,07fh	; 4f30  ........U.......
	defb 055h,0aah,0ffh,0ffh,0ffh,000h,000h,0ffh,055h,0aah,0ffh,0ffh,0ffh,00dh,00dh,0ffh	; 4f40  U.......U.......
	defb 01bh,0adh,08dh,0a6h,093h,0a8h,0b5h,01bh,09bh,0cdh,0e4h,007h,0ffh,000h,055h,0dfh	; 4f50  ..............U.
	defb 000h,000h,007h,03eh,0f8h,0c0h,000h,0ffh,021h,021h,071h,071h,071h,071h,07fh,000h	; 4f60  ...>....!!qqqq..
	defb 0ffh,024h,004h,000h,000h,0ffh,000h,000h,000h,000h,0ffh,0beh,000h,000h,000h,0ffh	; 4f70  .$..............
	defb 03dh,025h,075h,075h,075h,075h,077h,000h,0ffh,092h,010h,000h,000h,0ffh,000h,000h	; 4f80  =%uuuuw.........
	defb 000h,000h,0ffh,0ebh,000h,000h,000h,0ffh,07fh,008h,01ch,01ch,01ch,01ch,01ch,000h	; 4f90  ................
	defb 0ffh,049h,041h,000h,000h,0ffh,000h,000h,000h,000h,0ffh,0abh,000h,000h,000h,0ffh	; 4fa0  .IA.............
	defb 03fh,021h,071h,071h,071h,071h,07fh,000h,0ffh,024h,004h,000h,000h,0feh,000h,000h	; 4fb0  ?!qqqq...$......
	defb 000h,07fh,07fh,02ah,055h,000h,000h,0ffh,03eh,020h,03eh,007h,007h,047h,07fh,000h	; 4fc0  ...*U...> >..G..
	defb 0ffh,092h,010h,0ffh,0aah,0d5h,0aah,0ffh,000h,0ffh,0fdh,0aah,055h,000h,000h,0ffh	; 4fd0  ............U...
	defb 000h,018h,018h,000h,018h,018h,000h,000h,0ffh,024h,020h,0e0h,0a0h,06fh,0a0h,0e0h	; 4fe0  .........$ ..o..
	defb 000h,0ffh,0ffh,0ebh,055h,000h,000h,0ffh,03fh,023h,075h,079h,071h,071h,07fh,000h	; 4ff0  ....U...?#uyqq..
	defb 0feh,049h,043h,007h,00fh,0edh,00ah,007h,000h,0ffh,0ffh,0ebh,055h,000h,000h,0ffh	; 5000  .IC.........U...
	defb 03fh,023h,075h,079h,071h,071h,07fh,000h,0bfh,0c4h,060h,070h,078h,05bh,0a8h,0f0h	; 5010  ?#uyqq....`px[..
	defb 000h,000h,07bh,055h,000h,000h,000h,0ffh,03fh,023h,075h,079h,071h,071h,07fh,000h	; 5020  ..{U....?#uyqq..
	defb 0ffh,092h,082h,000h,000h,0ffh,000h,000h,000h,000h,0ffh,05dh,000h,000h,000h,0ffh	; 5030  ...........]....
	defb 03fh,023h,075h,079h,071h,071h,07fh,000h,0ffh,049h,008h,000h,000h,0ffh,000h,000h	; 5040  ?#uyqq...I......
	defb 03fh	; 5050  ?

; ======================================================================
; CODIGO 0x5051..0x511b  (202 bytes)
; ======================================================================


L_5051:
	ld a,b			;5051
	ld d,a			;5052
	ld d,l			;5053
	ld a,b			;5054
L_5055:
	ccf			;5055
	nop			;5056
	rst 38h			;5057
	ccf			;5058
	inc hl			;5059
	ld (hl),l		;505a
	ld a,c			;505b
	ld (hl),c		;505c
	ld (hl),c		;505d
	ld a,a			;505e
	nop			;505f
	rst 38h			;5060
	inc h			;5061
	jr nz,L_5064		;5062
L_5064:
	nop			;5064
	rst 38h			;5065
	nop			;5066
	nop			;5067
	rst 38h			;5068
	ld bc,054beh		;5069
	ld bc,000ffh		;506c
	rst 38h			;506f
	ccf			;5070
	inc hl			;5071
	ld (hl),l		;5072
	ld a,c			;5073
	ld (hl),c		;5074
	ld (hl),c		;5075
	ld a,a			;5076
	nop			;5077
L_5078:
	rst 38h			;5078
	add a,d			;5079
L_507A:
	cp d			;507a
	ld a,l			;507b
	ld sp,hl		;507c
	ld h,b			;507d
	nop			;507e
	nop			;507f
	rst 38h			;5080
	ret nz			;5081
	cp (hl)			;5082
	xor c			;5083
	add a,(hl)		;5084
	ret m			;5085
	ld bc,0bf47h		;5086
	add a,b			;5089
	cp l			;508a
	ret nz			;508b
	cp a			;508c
	xor d			;508d
	and b			;508e
	add a,b			;508f
	rra			;5090
	jr nc,L_5078		;5091
	ld c,d			;5093
	sub l			;5094
	jp z,03f65h		;5095
	call m,L_E3B8		;5098
	add a,a			;509b
	ld e,06dh		;509c
	adc a,e			;509e
	ld d,0edh		;509f
	dec e			;50a1
	push de			;50a2
	inc bc			;50a3
	rst 30h			;50a4
	xor d			;50a5
	dec b			;50a6
	inc bc			;50a7
	ld sp,hl		;50a8
	inc c			;50a9
	ld d,a			;50aa
	xor d			;50ab
	ld d,c			;50ac
	xor e			;50ad
	ld d,(hl)		;50ae
	call m,00000h		;50af   ; BIOS CHKRAM - Tests RAM and sets RAM slot for the system  [alias: STARTUP, RESET, BOOT]
L_50B2:
	rst 38h			;50b2
	add a,b			;50b3
	ld a,a			;50b4
	cp e			;50b5
	nop			;50b6
	rst 38h			;50b7
	ld a,a			;50b8
	ld b,d			;50b9
	inc c			;50ba
	inc e			;50bb
	jr c,$+115		;50bc
	ld a,a			;50be
	nop			;50bf
	ret nz			;50c0
	ret p			;50c1
	inc l			;50c2
	sub a			;50c3
	adc a,d			;50c4
	ld bc,00000h		;50c5
	nop			;50c8
	nop			;50c9
	cp 001h			;50ca
	cp 0abh			;50cc
	nop			;50ce
	rst 38h			;50cf
	ccf			;50d0
	ld hl,07171h		;50d1
	ld (hl),c		;50d4
	ld (hl),c		;50d5
	ld a,a			;50d6
	nop			;50d7
	nop			;50d8
	nop			;50d9
	nop			;50da
	cp 0eeh			;50db
	ld d,(hl)		;50dd
	nop			;50de
	nop			;50df
	nop			;50e0
	ld bc,08f03h		;50e1
	cp (hl)			;50e4
	ld l,b			;50e5
	nop			;50e6
	rst 38h			;50e7
	dec a			;50e8
	dec h			;50e9
	ld (hl),l		;50ea
	ld (hl),l		;50eb
	ld (hl),l		;50ec
	ld (hl),l		;50ed
	ld (hl),a		;50ee
	nop			;50ef
	nop			;50f0
	nop			;50f1
	rst 38h			;50f2
	rst 38h			;50f3
	ei			;50f4
	ld d,l			;50f5
	xor d			;50f6
	nop			;50f7
	ld a,h			;50f8
	rst 0			;50f9
L_50FA:
	rst 30h			;50fa
	sbc a,a			;50fb
	dec c			;50fc
	ld (bc),a		;50fd
	nop			;50fe
	rst 38h			;50ff
	ld e,012h		;5100
	ccf			;5102
	ld (hl),c		;5103
	ld (hl),c		;5104
	ld (hl),c		;5105
	ld (hl),c		;5106
	nop			;5107
	nop			;5108
	nop			;5109
	nop			;510a
	ld a,(hl)		;510b
	nop			;510c
	ld a,(hl)		;510d
	nop			;510e
	nop			;510f
	inc bc			;5110
	rrca			;5111
	sbc a,0e6h		;5112
	ld a,c			;5114
	xor d			;5115
	nop			;5116
	rst 38h			;5117
	nop			;5118
	jr $+26			;5119

; ----------------------------------------------------------------------
; DATOS tabla: (20 B; racha 4.10, entropia 2.68, 9 valores: pocos valores para ser un dibujo)
;   0x511b..0x512f  (20 bytes)
; ----------------------------------------------------------------------
	defb 000h,018h,018h,000h,000h,000h,000h,0ffh,0ffh,0efh,055h,0aah,000h,080h,07fh,000h	; 511b  ..........U.....
	defb 0aah,0f7h,0ffh,000h	; 512b  ....

; ======================================================================
; CODIGO 0x512f..0x514a  (27 bytes)
; ======================================================================


L_512F:
	rst 38h			;512f
	ccf			;5130
	inc hl			;5131
	ld (hl),l		;5132
L_5133:
	ld a,c			;5133
	ld (hl),c		;5134
	ld (hl),c		;5135
	ld a,a			;5136
	nop			;5137
	nop			;5138
	nop			;5139
L_513A:
	nop			;513a
	ld a,a			;513b
	ld a,(hl)		;513c
	ld d,h			;513d
	nop			;513e
	nop			;513f
	rlca			;5140
	ei			;5141
	dec b			;5142
	cp b			;5143
	ret p			;5144
	rst 8			;5145
	jr nc,$+1		;5146
	jr $+10			;5148

; ----------------------------------------------------------------------
; DATOS relleno: o resto (7 B; 7 bytes)
;   0x514a..0x5151  (7 bytes)
; ----------------------------------------------------------------------
	defb 01ch,01ch,01ch,01ch,01ch,000h,01fh	; 514a  .......

; ======================================================================
; CODIGO 0x5151..0x5300  (431 bytes)
; ======================================================================


L_5151:
	jr nc,$-23		;5151
	ret nz			;5153
	add a,b			;5154
	nop			;5155
	nop			;5156
	nop			;5157
	rst 38h			;5158
	ei			;5159
	ld d,l			;515a
	nop			;515b
	nop			;515c
	ret nz			;515d
	ret p			;515e
	ld a,b			;515f
	cp h			;5160
	sbc a,h			;5161
	ld h,d			;5162
	ld a,(hl)		;5163
	ld d,h			;5164
	ld b,d			;5165
	add a,b			;5166
	sbc a,h			;5167
	jr c,L_51DA		;5168
	ret nz			;516a
	nop			;516b
	nop			;516c
	nop			;516d
	nop			;516e
	nop			;516f
	ret m			;5170
	ex de,hl		;5171
	ld d,b			;5172
	nop			;5173
	nop			;5174
	nop			;5175
	dec bc			;5176
	dec de			;5177
	ld hl,(0fb5bh)		;5178
	ei			;517b
	ld (hl),e		;517c
	cp e			;517d
	ld d,c			;517e
	dec hl			;517f
	ld de,0000ah		;5180
	nop			;5183
	nop			;5184
	nop			;5185
	nop			;5186
	nop			;5187
	ld bc,000ffh		;5188
	nop			;518b
	nop			;518c
	nop			;518d
	call po,L_B575		;518e
	ld (hl),l		;5191
	push af			;5192
	push hl			;5193
	push af			;5194
	push hl			;5195
	push af			;5196
	call po,0a055h		;5197
	nop			;519a
	nop			;519b
	nop			;519c
	nop			;519d
	nop			;519e
	nop			;519f
	or c			;51a0
	or c			;51a1
	or c			;51a2
	or c			;51a3
	or c			;51a4
	or c			;51a5
	or c			;51a6
	or c			;51a7
	ld d,c			;51a8
	and c			;51a9
	and c			;51aa
	pop af			;51ab
	and c			;51ac
	and c			;51ad
	and c			;51ae
	and c			;51af
	and c			;51b0
	and c			;51b1
	and c			;51b2
	and c			;51b3
	and c			;51b4
	and c			;51b5
	and c			;51b6
	and c			;51b7
	and c			;51b8
	and c			;51b9
	and c			;51ba
	and c			;51bb
	and c			;51bc
	and c			;51bd
	and c			;51be
	ld sp,03131h		;51bf
	ld sp,03131h		;51c2
	ld sp,03131h		;51c5
	ld sp,L_5151		;51c8
	ld d,c			;51cb
	ld d,c			;51cc
	ld d,c			;51cd
	ld d,c			;51ce
	pop af			;51cf
	ld hl,02121h		;51d0
	ld hl,081f1h		;51d3
	add a,c			;51d6
	add a,c			;51d7
	ld d,c			;51d8
	ld d,c			;51d9
L_51DA:
	pop af			;51da
	ld (hl),c		;51db
	ld (hl),c		;51dc
	ld (hl),c		;51dd
	ld (hl),c		;51de
	ld (hl),c		;51df
	ld d,c			;51e0
	ld d,c			;51e1
	ld d,c			;51e2
	ld d,c			;51e3
	ld d,c			;51e4
	ld d,c			;51e5
	ld d,c			;51e6
	ld d,c			;51e7
	ld d,c			;51e8
	and c			;51e9
	or c			;51ea
	or c			;51eb
	or c			;51ec
	or c			;51ed
	or c			;51ee
	pop af			;51ef
	ld sp,hl		;51f0
	ld sp,hl		;51f1
	ld sp,hl		;51f2
	ld sp,hl		;51f3
	ld sp,hl		;51f4
	ld sp,hl		;51f5
	ld sp,hl		;51f6
	ld sp,hl		;51f7
	ld sp,hl		;51f8
	ld sp,hl		;51f9
L_51FA:
	ld sp,hl		;51fa
	ld sp,hl		;51fb
	ld sp,hl		;51fc
	ld sp,hl		;51fd
	ld sp,hl		;51fe
	ld sp,hl		;51ff
	ld sp,hl		;5200
	ld sp,hl		;5201
	ld sp,hl		;5202
	ld sp,hl		;5203
	ld sp,hl		;5204
	ld sp,hl		;5205
	ld sp,hl		;5206
	ld sp,hl		;5207
	push af			;5208
	push af			;5209
	push af			;520a
	push af			;520b
	push af			;520c
	push af			;520d
	push af			;520e
	push af			;520f
	push af			;5210
	push af			;5211
	push af			;5212
	push af			;5213
	push af			;5214
	push af			;5215
	push af			;5216
	push af			;5217
	push af			;5218
	push af			;5219
	push af			;521a
	push af			;521b
	push af			;521c
	push af			;521d
	push af			;521e
	push af			;521f
	pop bc			;5220
	pop bc			;5221
	pop bc			;5222
	pop bc			;5223
	pop bc			;5224
	pop bc			;5225
	pop bc			;5226
	pop bc			;5227
	pop bc			;5228
	pop bc			;5229
	pop bc			;522a
	pop bc			;522b
	pop bc			;522c
	pop bc			;522d
	pop bc			;522e
	pop bc			;522f
	pop bc			;5230
	pop bc			;5231
	pop bc			;5232
	pop bc			;5233
	pop bc			;5234
	pop bc			;5235
	pop bc			;5236
	pop bc			;5237
	pop bc			;5238
	pop bc			;5239
	pop bc			;523a
	pop bc			;523b
	pop bc			;523c
	pop bc			;523d
	pop bc			;523e
	pop bc			;523f
	pop bc			;5240
	pop bc			;5241
	pop bc			;5242
	pop bc			;5243
	pop bc			;5244
	pop bc			;5245
	pop bc			;5246
	pop bc			;5247
	and c			;5248
	pop hl			;5249
	pop hl			;524a
	pop hl			;524b
	ld d,c			;524c
	ld d,c			;524d
	pop hl			;524e
	pop hl			;524f
	ld d,c			;5250
	ld d,c			;5251
	pop hl			;5252
	pop hl			;5253
	ld d,c			;5254
	pop hl			;5255
	pop hl			;5256
	ld d,c			;5257
	ld d,c			;5258
	pop hl			;5259
	pop hl			;525a
	pop hl			;525b
	ld d,c			;525c
	pop hl			;525d
	pop hl			;525e
	pop hl			;525f
	pop bc			;5260
	pop bc			;5261
	pop bc			;5262
	pop bc			;5263
	pop bc			;5264
	pop bc			;5265
	pop bc			;5266
	pop bc			;5267
	pop bc			;5268
	pop bc			;5269
	pop bc			;526a
	pop bc			;526b
	pop bc			;526c
	pop bc			;526d
	pop bc			;526e
	pop bc			;526f
	pop bc			;5270
	pop bc			;5271
	pop bc			;5272
	pop bc			;5273
	pop bc			;5274
	pop bc			;5275
	pop bc			;5276
	pop bc			;5277
	pop bc			;5278
	pop bc			;5279
	pop bc			;527a
	pop bc			;527b
	pop bc			;527c
	pop bc			;527d
	pop bc			;527e
	pop bc			;527f
	pop bc			;5280
	pop bc			;5281
	pop bc			;5282
	pop bc			;5283
	pop bc			;5284
	pop bc			;5285
	pop bc			;5286
	pop bc			;5287
	and c			;5288
	ld (hl),c		;5289
	pop af			;528a
	ld (hl),c		;528b
	ld (hl),c		;528c
	pop af			;528d
	pop af			;528e
	ld (hl),c		;528f
	ld (hl),c		;5290
	ld (hl),c		;5291
	pop af			;5292
	pop af			;5293
	ld (hl),c		;5294
	ld (hl),c		;5295
	pop af			;5296
	pop af			;5297
	ld (hl),c		;5298
	ld (hl),c		;5299
	pop af			;529a
	ld (hl),c		;529b
	ld (hl),c		;529c
	ld (hl),c		;529d
	pop af			;529e
	ld (hl),c		;529f
	ld (hl),c		;52a0
	ld (hl),c		;52a1
L_52A2:
	ld d,c			;52a2
	ld d,c			;52a3
	pop af			;52a4
	ld hl,02121h		;52a5
	ld hl,02121h		;52a8
	ld hl,0f121h		;52ab
	ld d,c			;52ae
	ld d,c			;52af
	ld d,c			;52b0
	ld (hl),c		;52b1
	ld (hl),c		;52b2
	pop af			;52b3
	ld d,c			;52b4
	ld d,c			;52b5
	ld d,c			;52b6
	ld d,c			;52b7
	ld (hl),c		;52b8
	ld (hl),c		;52b9
	ld (hl),c		;52ba
	ld (hl),c		;52bb
	ld (hl),c		;52bc
	ld (hl),c		;52bd
	ld (hl),c		;52be
	ld (hl),c		;52bf
	or c			;52c0
	or c			;52c1
	or c			;52c2
	or c			;52c3
	or c			;52c4
	and c			;52c5
	and c			;52c6
	and c			;52c7
	and c			;52c8
	and c			;52c9
	pop bc			;52ca
	ld sp,0c131h		;52cb
	pop bc			;52ce
	ld sp,03131h		;52cf
	pop bc			;52d2
	ld sp,03131h		;52d3
	pop bc			;52d6
	and c			;52d7
	and c			;52d8
	and c			;52d9
	and c			;52da
	and c			;52db
	and c			;52dc
	and c			;52dd
	and c			;52de
	and c			;52df
	push af			;52e0
	push af			;52e1
	push af			;52e2
	push af			;52e3
	push af			;52e4
	push af			;52e5
	push af			;52e6
	push af			;52e7
	push af			;52e8
	push af			;52e9
	push af			;52ea
	push af			;52eb
	push af			;52ec
	push af			;52ed
	push af			;52ee
	push af			;52ef
	push af			;52f0
	push af			;52f1
	push af			;52f2
	push af			;52f3
	push af			;52f4
	push af			;52f5
	push af			;52f6
	push af			;52f7
	push af			;52f8
	push af			;52f9
	push af			;52fa
	push af			;52fb
	push af			;52fc
	push af			;52fd
	push af			;52fe
	push af			;52ff

; ----------------------------------------------------------------------
; DATOS colores: de tiles: 480 bytes con el nibble bajo a 1
;   0x5300..0x54e0  (480 bytes)
; DATOS colores: (SCREEN 2) (10 B; racha 1.67, entropia 0.88, 2 valores, el nibble bajo es 0x1 en el 100%)
;   0x54e0..0x54ea  (10 bytes)
; ----------------------------------------------------------------------
	defb 0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h	; 5300  ................
	defb 0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h	; 5310  ................
	defb 051h,051h,0e1h,0e1h,051h,051h,0e1h,051h,051h,051h,0c1h,061h,061h,061h,061h,061h	; 5320  QQ..QQ.QQQ.aaaaa
	defb 061h,061h,061h,061h,061h,061h,061h,061h,061h,061h,061h,061h,061h,061h,061h,061h	; 5330  aaaaaaaaaaaaaaaa
	defb 061h,061h,061h,061h,061h,061h,061h,061h,051h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5340  aaaaaaaaQ.......
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5350  ................
	defb 071h,071h,0f1h,071h,071h,071h,0f1h,071h,071h,051h,031h,051h,051h,051h,091h,091h	; 5360  qq.qqq.qqQ1QQQ..
	defb 091h,091h,091h,091h,091h,091h,091h,091h,091h,091h,091h,091h,091h,091h,091h,091h	; 5370  ................
	defb 091h,091h,091h,091h,091h,091h,091h,091h,051h,051h,081h,031h,031h,031h,031h,031h	; 5380  ........QQ.11111
	defb 031h,031h,031h,031h,031h,031h,031h,031h,031h,031h,031h,031h,031h,031h,031h,031h	; 5390  1111111111111111
	defb 0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h	; 53a0  ................
	defb 0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0f1h,081h,081h,081h,081h,0f1h,0a1h	; 53b0  ................
	defb 0a1h,0a1h,0a1h,081h,081h,081h,081h,0f1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h	; 53c0  ................
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 53d0  ................
	defb 0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h	; 53e0  ................
	defb 0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h	; 53f0  ................
	defb 0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0c1h	; 5400  ................
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5410  ................
	defb 031h,041h,041h,041h,041h,041h,041h,041h,041h,041h,041h,041h,041h,041h,041h,041h	; 5420  1AAAAAAAAAAAAAAA
	defb 041h,041h,091h,091h,091h,091h,091h,091h,091h,091h,091h,091h,051h,051h,051h,051h	; 5430  AA..........QQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h	; 5440  QQQQQQQQQQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h,051h,061h,061h,061h,061h,061h,061h,061h	; 5450  QQQQQQQQQaaaaaaa
	defb 031h,031h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h	; 5460  11QQQQQQQQQQQQQQ
	defb 051h,051h,051h,051h,091h,091h,091h,091h,091h,091h,091h,0f1h,071h,071h,071h,071h	; 5470  QQQQ........qqqq
	defb 071h,071h,071h,071h,071h,071h,071h,071h,071h,051h,0f1h,051h,051h,051h,0f1h,051h	; 5480  qqqqqqqqqQ.QQQ.Q
	defb 071h,071h,071h,071h,071h,071h,071h,051h,051h,051h,051h,051h,051h,051h,051h,051h	; 5490  qqqqqqqQQQQQQQQQ
	defb 041h,041h,041h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h	; 54a0  AAAQQQQQQQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h	; 54b0  QQQQQQQQQQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h,051h,091h,091h,091h,091h,091h,061h,0c1h	; 54c0  QQQQQQQQQ.....a.
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 54d0  ................
	defb 051h,051h,051h,051h,051h,051h,051h,0f1h,0f1h,0f1h	; 54e0  QQQQQQQ...

; ======================================================================
; CODIGO 0x54ea..0x5642  (344 bytes)
; ======================================================================


L_54EA:
	pop af			;54ea
	pop af			;54eb
	pop af			;54ec
	pop af			;54ed
	pop af			;54ee
	pop af			;54ef
	pop af			;54f0
	pop af			;54f1
	pop af			;54f2
	pop af			;54f3
	pop af			;54f4
	pop af			;54f5
	pop af			;54f6
	pop af			;54f7
	pop af			;54f8
	ld d,c			;54f9
	ld d,c			;54fa
	ld d,c			;54fb
	ld d,c			;54fc
	ld d,c			;54fd
	ld d,c			;54fe
	ld d,c			;54ff
	ld (hl),c		;5500
	ld (hl),c		;5501
	ld (hl),c		;5502
	ld (hl),c		;5503
	ld (hl),c		;5504
L_5505:
	ld (hl),c		;5505
	ld (hl),c		;5506
	ld d,c			;5507
	ld d,c			;5508
	ld d,c			;5509
	ld d,c			;550a
	sub c			;550b
	sub c			;550c
	sub c			;550d
	sub c			;550e
	ld h,c			;550f
	ld h,c			;5510
L_5511:
	ld h,c			;5511
	pop bc			;5512
	pop bc			;5513
	pop bc			;5514
	pop bc			;5515
	or c			;5516
	or c			;5517
	cp c			;5518
	cp c			;5519
	cp c			;551a
	cp c			;551b
	cp c			;551c
	cp c			;551d
	cp c			;551e
	cp c			;551f
	ld b,c			;5520
L_5521:
	ld b,c			;5521
	ld b,c			;5522
	ld d,c			;5523
	ld d,c			;5524
	ld d,c			;5525
	ld d,c			;5526
	ld d,c			;5527
	ld d,c			;5528
	pop af			;5529
L_552A:
	pop af			;552a
	pop af			;552b
	pop af			;552c
	pop af			;552d
	pop af			;552e
	pop af			;552f
	pop af			;5530
	pop af			;5531
	pop af			;5532
	pop af			;5533
	pop af			;5534
	pop af			;5535
	pop af			;5536
	pop af			;5537
	pop af			;5538
	ld d,c			;5539
	ld d,c			;553a
	ld d,c			;553b
	ld d,c			;553c
	ld d,c			;553d
	ld d,c			;553e
L_553F:
	ld d,c			;553f
	ld (hl),c		;5540
	ld (hl),c		;5541
	ld (hl),c		;5542
	ld (hl),c		;5543
	ld (hl),c		;5544
L_5545:
	ld (hl),c		;5545
	ld (hl),c		;5546
	ld d,c			;5547
	ld d,c			;5548
	ld d,c			;5549
	ld d,c			;554a
	sub c			;554b
	sub c			;554c
L_554D:
	sub c			;554d
	sub c			;554e
	ld h,c			;554f
	ld h,c			;5550
L_5551:
	ld h,c			;5551
	pop af			;5552
	pop bc			;5553
	pop bc			;5554
L_5555:
	pop bc			;5555
	or c			;5556
L_5557:
	or c			;5557
	cp c			;5558
	cp c			;5559
	cp c			;555a
	cp c			;555b
	cp c			;555c
	cp c			;555d
	cp c			;555e
	cp c			;555f
	ld d,c			;5560
	pop af			;5561
	ld (hl),c		;5562
	ld (hl),c		;5563
	ld (hl),c		;5564
	ld (hl),c		;5565
	ld (hl),c		;5566
	ld (hl),c		;5567
	ld d,c			;5568
	ld d,c			;5569
	ld d,c			;556a
	ld d,c			;556b
	ld d,c			;556c
	ld d,c			;556d
	ld d,c			;556e
	ld d,c			;556f
	ld d,c			;5570
	ld d,c			;5571
	ld d,c			;5572
	ld d,c			;5573
	ld d,c			;5574
	ld d,c			;5575
	ld d,c			;5576
	ld d,c			;5577
	ld d,c			;5578
	ld d,c			;5579
	ld d,c			;557a
	ld d,c			;557b
	ld d,c			;557c
	ld d,c			;557d
	ld d,c			;557e
	ld d,c			;557f
	ld d,c			;5580
	ld d,c			;5581
	ld d,c			;5582
	ld d,c			;5583
	ld d,c			;5584
	ld d,c			;5585
	ld d,c			;5586
	ld d,c			;5587
	ld d,c			;5588
	pop af			;5589
L_558A:
	pop af			;558a
L_558B:
	sub c			;558b
	sub c			;558c
	sub c			;558d
	sub c			;558e
L_558F:
	ld h,c			;558f
	ld h,c			;5590
	ld h,c			;5591
	pop af			;5592
	pop bc			;5593
	pop bc			;5594
	pop bc			;5595
	pop bc			;5596
	pop bc			;5597
	pop bc			;5598
	pop bc			;5599
	pop bc			;559a
	pop bc			;559b
	pop bc			;559c
	pop bc			;559d
	pop bc			;559e
	pop bc			;559f
	pop bc			;55a0
	pop bc			;55a1
	pop bc			;55a2
	pop bc			;55a3
	pop bc			;55a4
	pop bc			;55a5
	pop bc			;55a6
	pop bc			;55a7
	pop bc			;55a8
	pop bc			;55a9
L_55AA:
	pop bc			;55aa
L_55AB:
	pop bc			;55ab
	pop bc			;55ac
	pop bc			;55ad
	pop bc			;55ae
L_55AF:
	pop bc			;55af
	pop bc			;55b0
	pop bc			;55b1
L_55B2:
	pop bc			;55b2
	pop bc			;55b3
	pop bc			;55b4
	pop bc			;55b5
	pop bc			;55b6
	ld hl,02121h		;55b7
	ld hl,02121h		;55ba
	ld hl,02121h		;55bd
L_55C0:
	ld hl,02121h		;55c0
	pop af			;55c3
L_55C4:
	sub c			;55c4
	sub c			;55c5
	sub c			;55c6
	sub c			;55c7
	sub c			;55c8
	sub c			;55c9
	sub c			;55ca
	add a,c			;55cb
	add a,c			;55cc
L_55CD:
	add a,c			;55cd
	add a,c			;55ce
	add a,c			;55cf
	add a,c			;55d0
	add a,c			;55d1
	ld d,c			;55d2
	ld d,c			;55d3
	ld d,c			;55d4
	ld d,c			;55d5
	ld d,c			;55d6
	ld d,c			;55d7
	ld d,c			;55d8
	ld d,c			;55d9
	ld d,c			;55da
	ld d,c			;55db
	ld d,c			;55dc
	ld d,c			;55dd
	ld d,c			;55de
	ld d,c			;55df
	or l			;55e0
	or l			;55e1
	or l			;55e2
	or l			;55e3
	or l			;55e4
	or l			;55e5
	or l			;55e6
	or l			;55e7
	or l			;55e8
	or l			;55e9
	or l			;55ea
	or l			;55eb
	or l			;55ec
	or l			;55ed
	or l			;55ee
	or l			;55ef
	or c			;55f0
	or c			;55f1
	or c			;55f2
	or c			;55f3
	or c			;55f4
	or c			;55f5
	or c			;55f6
	ld hl,02121h		;55f7
	ld hl,02121h		;55fa
	ld hl,02121h		;55fd
	ld hl,02121h		;5600
	ld hl,02121h		;5603
	ld hl,0a121h		;5606
	ld h,c			;5609
	and c			;560a
	and c			;560b
	and c			;560c
	and c			;560d
	and c			;560e
	and c			;560f
	and c			;5610
	add a,c			;5611
	ld d,c			;5612
	ld d,c			;5613
	ld d,c			;5614
	ld d,c			;5615
	ld d,c			;5616
	ld d,c			;5617
	ld (hl),c		;5618
	ld (hl),c		;5619
	ld (hl),c		;561a
	ld (hl),c		;561b
	ld (hl),c		;561c
	ld (hl),c		;561d
	ld (hl),c		;561e
	ld (hl),c		;561f
	or l			;5620
	or l			;5621
	or l			;5622
	or l			;5623
	or l			;5624
	or l			;5625
	or l			;5626
	or l			;5627
	or l			;5628
	or l			;5629
	or l			;562a
	or l			;562b
	or l			;562c
	or l			;562d
	or l			;562e
	or l			;562f
	or c			;5630
	or c			;5631
	or c			;5632
	or c			;5633
	or c			;5634
	or c			;5635
	or c			;5636
	pop af			;5637
	ld d,c			;5638
	ld d,c			;5639
	ld d,c			;563a
	ld d,c			;563b
	ld hl,02121h		;563c
	ld hl,02121h		;563f

; ----------------------------------------------------------------------
; DATOS colores: de tiles: 832 bytes mas de lo mismo
;   0x5640..0x5980  (832 bytes)
; DATOS tabla: (689 B; racha 4.20, entropia 2.68, 14 valores: pocos valores para ser un dibujo)
;   0x5980..0x5c31  (689 bytes)
; DATOS relleno:: 972 bytes
;   0x5c31..0x5ffd  (972 bytes)
; DATOS graficos: (339 B; racha 4.22, entropia 4.33, 50 valores: rachas mas largas que el azar)
;   0x5ffd..0x6150  (339 bytes)
; DATOS charset:: 59 caracteres de 8x8
;   0x6000..0x61d8  (472 bytes)
; ----------------------------------------------------------------------
	defb 021h,021h,021h,021h,021h,021h,0f1h,061h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h	; 5642  !!!!!!.a........
	defb 051h,051h,051h,0f1h,0f1h,0f1h,071h,071h,071h,071h,071h,071h,071h,071h,0c1h,0c1h	; 5652  QQQ...qqqqqqqq..
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h	; 5662  .....QQQQQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,021h,021h,021h,021h	; 5672  QQQQQQQQQQQQ!!!!
	defb 021h,021h,021h,021h,021h,0f1h,0f1h,0f1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h	; 5682  !!!!!...........
	defb 051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h	; 5692  QQQQQQQQQQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h	; 56a2  QQQQQQQQQQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h	; 56b2  QQQQQQQQQQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,031h,031h,031h,031h,031h,031h	; 56c2  QQQQQQQQQQ111111
	defb 031h,031h,021h,021h,021h,0c1h,0c1h,0c1h,0c1h,0c1h,071h,071h,071h,071h,071h,071h	; 56d2  11!!!.....qqqqqq
	defb 071h,071h,071h,071h,071h,071h,0f1h,0f1h,0f1h,0f1h,051h,0f1h,051h,051h,0f1h,081h	; 56e2  qqqqqq....Q.QQ..
	defb 081h,081h,051h,051h,051h,0f1h,071h,071h,071h,071h,071h,071h,071h,071h,071h,071h	; 56f2  ..QQQ.qqqqqqqqqq
	defb 071h,071h,071h,071h,071h,071h,071h,051h,051h,051h,0f1h,031h,031h,031h,031h,031h	; 5702  qqqqqqqQQQ.11111
	defb 031h,021h,021h,021h,021h,0c1h,0c1h,0c1h,0c1h,0c1h,071h,071h,071h,071h,071h,071h	; 5712  1!!!!.....qqqqqq
	defb 071h,071h,071h,071h,071h,071h,0f1h,0f1h,0f1h,0f1h,051h,0f1h,051h,051h,081h,081h	; 5722  qqqqqq....Q.QQ..
	defb 081h,081h,051h,051h,051h,051h,071h,071h,071h,071h,071h,071h,071h,071h,071h,071h	; 5732  ..QQQQqqqqqqqqqq
	defb 071h,071h,071h,071h,071h,071h,051h,051h,051h,031h,031h,031h,031h,031h,031h,031h	; 5742  qqqqqqQQQ1111111
	defb 031h,021h,021h,021h,021h,021h,021h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,051h,051h	; 5752  1!!!!!!.......QQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,0f1h,0f1h	; 5762  QQQQQQQQQQQQQQ..
	defb 051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h	; 5772  QQQQQQQQQQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,031h,031h,031h,031h,031h,031h,031h,031h,031h	; 5782  QQQQQQQ111111111
	defb 031h,021h,021h,021h,021h,021h,021h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,091h,091h	; 5792  1!!!!!!.........
	defb 091h,091h,091h,061h,061h,061h,091h,091h,091h,091h,091h,061h,091h,061h,0f1h,091h	; 57a2  ...aaa.....a.a..
	defb 091h,091h,091h,061h,091h,061h,091h,091h,091h,091h,091h,061h,0f1h,061h,091h,091h	; 57b2  ...a.a.....a.a..
	defb 091h,091h,091h,061h,0f1h,061h,091h,091h,091h,091h,091h,061h,061h,061h,051h,051h	; 57c2  ...a.a.....aaaQQ
	defb 051h,051h,051h,041h,041h,041h,051h,051h,051h,051h,051h,041h,041h,041h,051h,051h	; 57d2  QQQAAAQQQQQAAAQQ
	defb 051h,051h,051h,041h,041h,041h,0f1h,061h,061h,061h,061h,061h,0f1h,0f1h,0f1h,0c1h	; 57e2  QQQAAA.aaaaa....
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0f1h,0f1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0f1h,051h	; 57f2  ...............Q
	defb 051h,051h,041h,041h,041h,0f1h,0f1h,051h,051h,051h,041h,041h,041h,0f1h,0f1h,041h	; 5802  QQAAA..QQQAAA..A
	defb 041h,041h,041h,041h,0f1h,0f1h,0f1h,041h,041h,041h,041h,041h,0f1h,0f1h,0f1h,0f1h	; 5812  AAAA...AAAAA....
	defb 051h,051h,051h,051h,051h,0f1h,0f1h,0f1h,0f1h,041h,041h,0f1h,0f1h,0f1h,0f1h,0f1h	; 5822  QQQQQ....AA.....
	defb 0f1h,041h,041h,041h,041h,041h,061h,061h,061h,061h,061h,061h,061h,061h,061h,061h	; 5832  .AAAAAaaaaaaaaaa
	defb 061h,061h,061h,061h,061h,061h,061h,061h,061h,061h,061h,061h,061h,061h,041h,041h	; 5842  aaaaaaaaaaaaaaAA
	defb 041h,041h,041h,041h,041h,041h,041h,041h,041h,041h,041h,051h,051h,051h,0f1h,0b1h	; 5852  AAAAAAAAAAAQQQ..
	defb 051h,041h,041h,041h,0a1h,051h,071h,071h,071h,071h,071h,071h,071h,051h,051h,051h	; 5862  QAAA.QqqqqqqqQQQ
	defb 051h,051h,051h,051h,051h,0f1h,0f1h,0b1h,051h,041h,0f1h,0b1h,0f1h,051h,071h,071h	; 5872  QQQQQ...QA...Qqq
	defb 071h,071h,071h,071h,071h,071h,051h,051h,051h,051h,051h,051h,051h,0f1h,0f1h,0b1h	; 5882  qqqqqqQQQQQQQ...
	defb 051h,041h,0f1h,0b1h,0f1h,051h,071h,071h,071h,071h,071h,071h,071h,071h,051h,051h	; 5892  QA...QqqqqqqqqQQ
	defb 051h,051h,051h,051h,051h,0f1h,051h,051h,051h,041h,0f1h,0b1h,0f1h,051h,071h,071h	; 58a2  QQQQQ.QQQA...Qqq
	defb 071h,071h,071h,071h,071h,0f1h,051h,051h,051h,051h,051h,051h,051h,0f1h,0f1h,031h	; 58b2  qqqqq.QQQQQQQ..1
	defb 031h,0c1h,0c1h,031h,0f1h,051h,071h,071h,071h,071h,071h,071h,071h,0f1h,051h,051h	; 58c2  1..1.Qqqqqqqq.QQ
	defb 051h,051h,051h,051h,051h,051h,0f1h,031h,031h,0c1h,0c1h,031h,0f1h,051h,071h,071h	; 58d2  QQQQQQ.11..1.Qqq
	defb 071h,071h,071h,071h,071h,051h,051h,051h,051h,051h,051h,051h,051h,051h,031h,031h	; 58e2  qqqqqQQQQQQQQQ11
	defb 031h,0c1h,0c1h,031h,031h,051h,071h,071h,071h,071h,071h,071h,071h,0f1h,051h,051h	; 58f2  1..11Qqqqqqqq.QQ
	defb 051h,051h,051h,051h,051h,051h,031h,031h,031h,0c1h,0c1h,031h,031h,051h,071h,071h	; 5902  QQQQQQ111..11Qqq
	defb 071h,071h,071h,071h,071h,0f1h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h	; 5912  qqqqq.QQQQQQQQQQ
	defb 051h,041h,0a1h,0f1h,031h,051h,071h,071h,071h,071h,071h,071h,071h,0f1h,051h,051h	; 5922  QA..1Qqqqqqqq.QQ
	defb 051h,051h,0f1h,051h,0f1h,0f1h,0f1h,051h,051h,041h,0a1h,0f1h,0f1h,051h,071h,071h	; 5932  QQ.Q...QQA...Qqq
	defb 071h,071h,071h,071h,071h,071h,051h,051h,051h,051h,051h,051h,0f1h,0f1h,081h,081h	; 5942  qqqqqqQQQQQQ....
	defb 081h,081h,081h,081h,0f1h,051h,071h,071h,071h,071h,071h,071h,071h,071h,051h,051h	; 5952  .....QqqqqqqqqQQ
	defb 051h,051h,051h,051h,0f1h,0f1h,081h,081h,091h,091h,081h,081h,0f1h,051h,071h,071h	; 5962  QQQQ.........Qqq
	defb 071h,071h,071h,071h,071h,081h,051h,051h,051h,051h,051h,051h,0f1h,0f1h,081h,081h	; 5972  qqqqq.QQQQQQ....
	defb 081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h	; 5982  ................
	defb 081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h	; 5992  ................
	defb 081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,0f1h,0f1h	; 59a2  ................
	defb 081h,081h,081h,081h,081h,081h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,081h,081h	; 59b2  ................
	defb 081h,081h,081h,081h,081h,0f1h,0f1h,0f1h,081h,081h,081h,081h,0f1h,081h,0f5h,0f5h	; 59c2  ................
	defb 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f1h,0f1h,081h,081h,081h,081h,081h,0f1h,0f1h,081h	; 59d2  ................
	defb 081h,081h,081h,081h,081h,081h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f1h,071h	; 59e2  ...............q
	defb 071h,071h,071h,071h,071h,0f1h,081h,081h,081h,081h,081h,081h,081h,081h,0f5h,0f5h	; 59f2  qqqqq...........
	defb 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f1h,071h,091h,091h,071h,091h,0f1h,0f1h,061h,061h	; 5a02  .......q..q...aa
	defb 061h,061h,061h,061h,051h,081h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f1h,071h	; 5a12  aaaaQ..........q
	defb 071h,071h,071h,071h,071h,0c1h,051h,051h,051h,051h,051h,051h,051h,081h,0f5h,0f5h	; 5a22  qqqqq.QQQQQQQ...
	defb 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f1h,0f1h,0f1h,081h,081h,081h,0f1h,031h,051h,051h	; 5a32  .............1QQ
	defb 051h,051h,051h,051h,081h,081h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,081h,081h	; 5a42  QQQQ............
	defb 081h,081h,081h,081h,031h,031h,051h,051h,051h,051h,081h,081h,081h,081h,081h,081h	; 5a52  ....11QQQQ......
	defb 081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,031h,031h,031h,051h,051h	; 5a62  ...........111QQ
	defb 051h,051h,071h,031h,031h,031h,031h,031h,031h,031h,021h,021h,021h,0c1h,0c1h,0c1h	; 5a72  QQq1111111!!!...
	defb 0c1h,0c1h,081h,071h,071h,071h,051h,051h,051h,051h,031h,031h,031h,031h,031h,031h	; 5a82  ...qqqQQQQ111111
	defb 031h,031h,021h,021h,021h,0c1h,0c1h,0c1h,0c1h,0c1h,071h,071h,071h,071h,000h,0ffh	; 5a92  11!!!.....qqqq..
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 5aa2  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 5ab2  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 5ac2  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 5ad2  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 5ae2  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0f7h,000h	; 5af2  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 5b02  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 5b12  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 5b22  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 5b32  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 5b42  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 5b52  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 5b62  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,008h,0ffh	; 5b72  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 5b82  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 5b92  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 5ba2  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 5bb2  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 5bc2  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 5bd2  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 5be2  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,0ffh,000h	; 5bf2  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 5c02  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 5c12  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 5c22  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5c32  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5c42  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5c52  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5c62  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5c72  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5c82  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5c92  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5ca2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5cb2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5cc2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5cd2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5ce2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5cf2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d02  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d12  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d22  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d32  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d42  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d52  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d62  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d72  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d82  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d92  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5da2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5db2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5dc2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5dd2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5de2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5df2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e02  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e12  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e22  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e32  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e42  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e52  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e62  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e72  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e82  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e92  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5ea2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5eb2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5ec2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5ed2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5ee2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5ef2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f02  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f12  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f22  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f32  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f42  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f52  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f62  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f72  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f82  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f92  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5fa2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5fb2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5fc2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5fd2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5fe2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh,000h,0ffh,000h,000h	; 5ff2  ................
	defb 000h,000h,000h,000h,000h,000h,018h,018h,018h,018h,018h,000h,018h,000h,000h,03ch	; 6002  ...............<
	defb 030h,030h,030h,030h,030h,03ch,000h,040h,060h,030h,018h,00ch,006h,000h,000h,03ch	; 6012  00000<.@`0.....<
	defb 00ch,00ch,00ch,00ch,00ch,03ch,000h,010h,038h,06ch,0c6h,000h,000h,000h,006h,039h	; 6022  .....<..8l.....9
	defb 02dh,075h,075h,075h,073h,000h,018h,000h,008h,038h,070h,071h,07fh,000h,00ch,018h	; 6032  -uuus....8pq....
	defb 018h,018h,018h,018h,00ch,000h,030h,018h,018h,018h,018h,018h,030h,000h,000h,066h	; 6042  ......0.....0..f
	defb 018h,07eh,07eh,018h,066h,000h,000h,018h,018h,07eh,07eh,018h,018h,000h,000h,000h	; 6052  .~~.f....~~.....
	defb 000h,000h,00ch,00ch,018h,000h,000h,000h,000h,07eh,07eh,000h,000h,000h,000h,000h	; 6062  .........~~.....
	defb 000h,000h,000h,018h,018h,000h,001h,003h,006h,00ch,018h,030h,060h,000h,03fh,023h	; 6072  ...........0`.?#
	defb 075h,079h,071h,071h,07fh,000h,018h,008h,01ch,01ch,01ch,01ch,01ch,000h,03eh,002h	; 6082  uyqq..........>.
	defb 03eh,070h,070h,071h,07fh,000h,03eh,022h,00eh,007h,007h,047h,07fh,000h,044h,044h	; 6092  >ppq..>"...G..DD
	defb 07ch,00eh,00eh,00eh,00eh,000h,03fh,020h,03eh,007h,047h,047h,07fh,000h,01fh,030h	; 60a2  |.....? >.GG...0
	defb 07fh,071h,071h,071h,07fh,000h,07ch,044h,01eh,007h,007h,007h,007h,000h,01eh,012h	; 60b2  .qqq..|D........
	defb 03fh,071h,071h,071h,07fh,000h,03eh,022h,03eh,007h,007h,007h,007h,000h,000h,018h	; 60c2  ?qqq..>">.......
	defb 018h,000h,018h,018h,000h,000h,000h,018h,018h,000h,018h,018h,030h,000h,000h,000h	; 60d2  ............0...
	defb 000h,000h,000h,000h,000h,07fh,000h,07eh,07eh,000h,07eh,07eh,000h,000h,000h,000h	; 60e2  .......~~.~~....
	defb 000h,000h,000h,000h,000h,0ffh,07fh,047h,007h,00eh,008h,000h,00ch,000h,03ch,042h	; 60f2  .......G......<B
	defb 0bdh,0a1h,0b1h,0bdh,042h,03ch,01eh,012h,03fh,071h,071h,071h,071h,000h,03ch,024h	; 6102  ....B<..?qqqq.<$
	defb 03eh,072h,072h,072h,07eh,000h,03fh,021h,070h,070h,070h,071h,07fh,000h,03fh,021h	; 6112  >rrr~.?!pppq..?!
	defb 021h,071h,071h,071h,07fh,000h,03fh,021h,03ch,070h,070h,071h,07fh,000h,01fh,011h	; 6122  !qqq..?!<ppq....
	defb 03ch,070h,070h,070h,070h,000h,03fh,021h,020h,077h,071h,071h,07fh,000h,012h,012h	; 6132  <pppp.?! wqq....
	defb 03fh,071h,071h,071h,071h,000h,008h,008h,008h,01ch,01ch,01ch,01ch,000h	; 6142  ?qqqq.........

; ======================================================================
; CODIGO 0x6150..0x61c5  (117 bytes)
; ======================================================================


L_6150:
	ld (bc),a		;6150
	ld (bc),a		;6151
	ld (bc),a		;6152
	rlca			;6153
	ld b,a			;6154
	ld b,a			;6155
	ld a,a			;6156
	nop			;6157
	ld h,02ch		;6158
	jr c,$+122		;615a
	ld a,h			;615c
	halt			;615d
	ld (hl),e		;615e
	nop			;615f
	jr nz,$+34		;6160
	jr nz,$+114		;6162
	ld (hl),b		;6164
	ld (hl),c		;6165
	ld a,a			;6166
	nop			;6167
	ccf			;6168
	dec h			;6169
	dec h			;616a
	ld (hl),c		;616b
	ld (hl),c		;616c
	ld (hl),c		;616d
	ld (hl),c		;616e
	nop			;616f
	dec a			;6170
	dec h			;6171
	ld (hl),l		;6172
	ld (hl),l		;6173
	ld (hl),l		;6174
	ld (hl),l		;6175
	ld (hl),a		;6176
	nop			;6177
	ccf			;6178
	ld hl,07171h		;6179
	ld (hl),c		;617c
	ld (hl),c		;617d
	ld a,a			;617e
	nop			;617f
	rra			;6180
	ld de,0703fh		;6181
	ld (hl),b		;6184
	ld (hl),b		;6185
	ld (hl),b		;6186
	nop			;6187
	ccf			;6188
	ld hl,07121h		;6189
	ld (hl),l		;618c
	ld (hl),e		;618d
	ld a,a			;618e
	nop			;618f
	rra			;6190
	ld de,0723fh		;6191
	ld (hl),c		;6194
	ld (hl),c		;6195
	ld (hl),c		;6196
	nop			;6197
	ld a,020h		;6198
	ld a,007h		;619a
	rlca			;619c
	ld b,a			;619d
	ld a,a			;619e
	nop			;619f
	ld a,a			;61a0
	ex af,af'		;61a1
	inc e			;61a2
	inc e			;61a3
	inc e			;61a4
	inc e			;61a5
	inc e			;61a6
	nop			;61a7
	ld hl,07121h		;61a8
	ld (hl),c		;61ab
	ld (hl),c		;61ac
	ld (hl),c		;61ad
	ld a,a			;61ae
	nop			;61af
	ld b,c			;61b0
	ld b,c			;61b1
	ld h,d			;61b2
	ld (hl),d		;61b3
	ld (hl),h		;61b4
	inc (hl)		;61b5
	inc a			;61b6
	nop			;61b7
	ld hl,02121h		;61b8
	ld (hl),c		;61bb
	ld (hl),l		;61bc
	ld (hl),l		;61bd
	ld a,(04300h)		;61be
	ld h,(hl)		;61c1
	inc a			;61c2
	jr $+62			;61c3

; ----------------------------------------------------------------------
; DATOS charset:: 59 caracteres de 8x8
;   0x6000..0x61d8  (472 bytes)
; ----------------------------------------------------------------------
	defb 076h,063h,000h,022h,022h,03eh,008h,01ch,01ch,01ch,000h,07fh,042h,00ch,01ch	; 61c5  vc."">......B..

; ======================================================================
; CODIGO 0x61d4..0x61d8  (4 bytes)
; ======================================================================


L_61D4:
	jr c,$+115		;61d4
	ld a,a			;61d6
	nop			;61d7

; ----------------------------------------------------------------------
; DATOS Level: 1 Data
;   0x61d8..0x62d7  (255 bytes)
; DATOS Level: 2 Data
;   0x62d7..0x63d4  (253 bytes)
; DATOS Level: 3 Data
;   0x63d4..0x64d4  (256 bytes)
; DATOS Level: 4 Data
;   0x64d4..0x65db  (263 bytes)
; DATOS Level: 5 Data
;   0x65db..0x66ea  (271 bytes)
; DATOS Level: 6 Data
;   0x66ea..0x67e4  (250 bytes)
; DATOS Level: 7 Data
;   0x67e4..0x68ff  (283 bytes)
; DATOS relleno: (169 B; 169 de 169 bytes son 0x00)
;   0x68ff..0x69a8  (169 bytes)
; DATOS graficos: de los centinelas: 15 de 24x24
;   0x69a8..0x6de0  (1080 bytes)
; DATOS tiles: de los niveles: 111 de 32x32, 128 bytes cada uno
;   0x6de0..0xa560  (14208 bytes)
; ----------------------------------------------------------------------
	defb 088h,088h,027h,03bh,0a6h,03bh,024h,03ch,0beh,0bfh,03ch,01ah,010h,09ah,011h,01ah	; 61d8  ..';.;$<..<.....
	defb 03bh,032h,089h,030h,0c2h,036h,08eh,030h,01ah,097h,097h,0a8h,0c2h,0a7h,092h,037h	; 61e8  ;2.0.6.0.......7
	defb 01ah,0abh,037h,01ah,091h,0aah,037h,01ah,0a9h,0a7h,09ah,0a8h,0a2h,0a2h,0a2h,0a9h	; 61f8  ..7...7.........
	defb 09bh,0aah,026h,030h,030h,01ah,030h,025h,093h,03bh,01ah,094h,092h,019h,012h,091h	; 6208  ..&00.0%.;......
	defb 000h,090h,000h,0a3h,0a3h,000h,0b0h,000h,092h,03ch,03ch,091h,000h,010h,09ah,011h	; 6218  .........<<.....
	defb 080h,015h,087h,099h,083h,088h,0ach,0aah,03bh,002h,001h,032h,037h,030h,094h,001h	; 6228  ........;..270..
	defb 036h,025h,004h,011h,092h,01ah,002h,023h,099h,08fh,083h,084h,084h,084h,0b1h,027h	; 6238  6%.....#.......'
	defb 012h,019h,030h,030h,024h,0c2h,030h,097h,01ah,007h,030h,01ah,007h,01ah,08ch,026h	; 6248  ..00$.0...0....&
	defb 097h,015h,092h,043h,043h,019h,08dh,027h,025h,08ch,03ch,031h,03ch,002h,080h,0a8h	; 6258  ...CC..'%.<1<...
	defb 013h,002h,081h,093h,024h,08dh,080h,093h,019h,019h,080h,092h,0a5h,01eh,01eh,08ah	; 6268  ....$...........
	defb 0beh,098h,09eh,001h,032h,083h,001h,001h,036h,098h,095h,010h,026h,08dh,027h,043h	; 6278  ....2...6...&.'C
	defb 01ah,001h,00fh,03ch,037h,043h,01ah,001h,08bh,01eh,01eh,08ah,011h,0a0h,0a0h,010h	; 6288  ...<7C..........
	defb 094h,089h,093h,0a2h,091h,087h,092h,0b7h,012h,0a9h,0aah,01bh,012h,0a7h,0a8h,03bh	; 6298  ...............;
	defb 030h,0abh,01ah,030h,0abh,01ah,030h,0abh,01ah,026h,0a9h,0aah,025h,093h,030h,03bh	; 62a8  0..0..0..&..%.0;
	defb 094h,092h,0a0h,091h,000h,010h,09fh,011h,000h,084h,084h,098h,008h,009h,099h,000h	; 62b8  ................
	defb 00eh,09bh,00fh,000h,092h,012h,012h,0abh,030h,030h,091h,000h,090h,000h,0ffh,088h	; 62c8  ........00......
	defb 088h,027h,03ch,0a6h,03ch,024h,097h,097h,01ah,032h,0c2h,032h,0c2h,036h,0c2h,036h	; 62d8  .'<.<$...2.2.6.6
	defb 01ah,097h,097h,047h,037h,031h,0bch,047h,026h,037h,031h,0bdh,025h,093h,031h,012h	; 62e8  ...G71.G&71.%.1.
	defb 094h,092h,0a5h,091h,0b2h,0b5h,0b4h,027h,03ch,037h,01bh,03ch,024h,0bfh,045h,01bh	; 62f8  .......'<7.<$.E.
	defb 0beh,012h,08bh,08ah,012h,0c1h,031h,032h,0c0h,0a8h,031h,036h,0a7h,0b2h,0b5h,017h	; 6308  ......12..16....
	defb 09dh,09ch,017h,009h,092h,091h,008h,09ch,08eh,09dh,091h,023h,000h,092h,0b7h,026h	; 6318  ...........#...&
	defb 096h,095h,025h,093h,0a6h,094h,092h,043h,043h,091h,09eh,03ch,03ch,08bh,092h,019h	; 6328  ..%....CC..<<...
	defb 019h,091h,000h,090h,081h,085h,080h,0bfh,085h,0beh,037h,002h,085h,001h,030h,03bh	; 6338  ..........7...0;
	defb 002h,085h,001h,030h,01ah,0a9h,0aah,030h,01ah,03ch,013h,0bch,013h,026h,03ch,045h	; 6348  ...0...0.<...&<E
	defb 0bdh,025h,093h,0a0h,094h,000h,010h,09fh,011h,000h,084h,084h,098h,0a1h,099h,0a4h	; 6358  .%..............
	defb 0b4h,027h,0beh,0bfh,024h,047h,001h,030h,030h,002h,0bah,0c0h,0c1h,0bbh,0a7h,0a8h	; 6368  .'..$G.00.......
	defb 012h,0afh,086h,0aeh,0a3h,0a3h,0b1h,027h,007h,01ah,012h,043h,024h,00fh,037h,01ah	; 6378  .......'...C$.7.
	defb 012h,047h,047h,011h,007h,01ah,037h,047h,047h,0a8h,01ah,0a7h,004h,092h,037h,091h	; 6388  .GG...7GG.....7.
	defb 000h,09dh,045h,09ch,017h,092h,01ah,091h,000h,092h,01ah,096h,000h,09eh,03ch,03ch	; 6398  ..E...........<<
	defb 0a9h,092h,045h,0a7h,004h,009h,001h,012h,091h,015h,0a6h,012h,0a9h,003h,019h,019h	; 63a8  ..E.............
	defb 0bah,019h,019h,0a8h,0bbh,0a7h,0b2h,0b5h,000h,0b3h,000h,095h,0a5h,096h,001h,0a7h	; 63b8  ................
	defb 0a8h,002h,089h,080h,089h,089h,080h,089h,087h,080h,087h,0ffh,088h,088h,027h,037h	; 63c8  ..............'7
	defb 0a6h,037h,024h,03ch,0bch,01ah,0bah,026h,0bdh,01ah,0bbh,093h,03bh,012h,03ch,025h	; 63d8  .7$<...&....;.<%
	defb 092h,03bh,046h,094h,092h,046h,094h,000h,092h,01ah,091h,000h,095h,045h,08bh,01eh	; 63e8  .;F..F.......E..
	defb 027h,03ch,01ah,091h,000h,097h,096h,000h,0a5h,01ah,012h,0a9h,0a8h,01ah,046h,047h	; 63f8  '<............FG
	defb 047h,092h,0a1h,037h,025h,092h,08eh,094h,092h,0c2h,0abh,0c2h,091h,095h,045h,01ah	; 6408  G..7%.........E.
	defb 096h,027h,032h,0bch,032h,024h,03ch,036h,0bdh,036h,03ch,0a0h,046h,046h,0a0h,002h	; 6418  .'2.2$<6.6<.FF..
	defb 090h,001h,091h,023h,000h,092h,0b7h,01bh,0abh,031h,01ch,002h,008h,009h,001h,03ch	; 6428  ...#.....1.....<
	defb 01ch,0a6h,0a6h,03ch,0bfh,0a5h,0beh,0c1h,0a0h,0c0h,0a7h,09fh,0a8h,0b6h,09ch,0a1h	; 6438  ...<............
	defb 09dh,0a2h,091h,087h,0b9h,002h,081h,0b8h,0b7h,01ch,0a9h,0aah,0bah,0beh,0bfh,0bbh	; 6448  ................
	defb 001h,046h,018h,002h,0c2h,0c0h,0c1h,0c2h,01bh,046h,01bh,043h,01ah,0a7h,08ch,0a8h	; 6458  .F.......F.C....
	defb 0b7h,030h,091h,095h,03bh,030h,08bh,021h,0bch,012h,091h,001h,0bdh,012h,091h,0aeh	; 6468  .0..;0.!........
	defb 004h,032h,091h,083h,036h,091h,083h,01ah,091h,083h,01ah,096h,083h,01ah,030h,0a9h	; 6478  .2..6.........0.
	defb 00fh,000h,026h,030h,046h,037h,091h,093h,01ah,037h,091h,09eh,03ch,037h,0abh,03ch	; 6488  ..&0F7...7..<7.<
	defb 01ah,091h,095h,045h,01ah,096h,027h,0a0h,0a0h,024h,094h,08eh,093h,0b6h,0b6h,096h	; 6498  ...E..'..$......
	defb 0a1h,095h,00fh,0a6h,0a6h,00eh,011h,031h,0a5h,031h,010h,0a7h,08ch,0a8h,0b6h,0b6h	; 64a8  .......1.1......
	defb 0a9h,08dh,0aah,04bh,0bah,012h,012h,04ah,053h,0bbh,019h,019h,052h,0a7h,09ah,0a8h	; 64b8  ...K...JS...R...
	defb 091h,087h,092h,0b6h,09ch,020h,01fh,09dh,005h,082h,006h,0ffh,088h,088h,027h,032h	; 64c8  ..... ........'2
	defb 0a6h,032h,024h,037h,036h,0a1h,036h,037h,012h,00eh,09bh,00fh,012h,03ch,0c0h,0c1h	; 64d8  .2$76.67.....<..
	defb 03ch,0c6h,0c4h,0c7h,059h,037h,0c5h,037h,059h,097h,097h,01ah,012h,0cah,012h,0c2h	; 64e8  <...Y7.7Y.......
	defb 030h,0cah,030h,01ah,026h,030h,0cah,030h,025h,093h,0cah,094h,0b2h,000h,009h,092h	; 64f8  0.0.&0.0%.......
	defb 091h,008h,0a2h,005h,0b3h,006h,092h,030h,030h,091h,095h,0c2h,096h,027h,059h,012h	; 6508  .......00....'Y.
	defb 03ch,059h,024h,0c9h,01ah,045h,0c8h,037h,037h,0c2h,012h,012h,0a7h,026h,01ah,0a0h	; 6518  <Y$..E.77....&..
	defb 091h,010h,0afh,001h,091h,086h,092h,091h,086h,09eh,002h,0ach,00fh,092h,0a6h,01ah	; 6528  ................
	defb 024h,0aah,031h,037h,01ah,045h,0c6h,0bch,0c2h,059h,025h,0bdh,046h,01ah,094h,026h	; 6538  $.17.E...Y%.F..&
	defb 047h,0a0h,091h,08fh,006h,011h,000h,084h,083h,088h,083h,001h,032h,002h,020h,01eh	; 6548  G...........2. .
	defb 08ah,036h,002h,083h,001h,03ch,002h,083h,08fh,084h,088h,083h,001h,032h,002h,083h	; 6558  .6...<.......2..
	defb 001h,036h,08bh,01eh,01fh,001h,037h,002h,023h,099h,08fh,083h,084h,098h,0ach,00fh	; 6568  .6....7.#.......
	defb 080h,00eh,027h,032h,091h,000h,010h,026h,036h,091h,098h,0aeh,011h,000h,084h,084h	; 6578  ..'2...&6.......
	defb 098h,008h,009h,099h,0b4h,027h,04eh,045h,04fh,03bh,024h,03bh,059h,046h,059h,0a0h	; 6588  .....'NEO;$;YFY.
	defb 0a7h,08ch,005h,001h,005h,081h,0b9h,082h,0b8h,080h,0a1h,092h,000h,095h,0a9h,027h	; 6598  ...............'
	defb 0aah,0c6h,058h,037h,043h,043h,059h,0c4h,037h,026h,03ch,059h,0c5h,025h,0aeh,09ah	; 65a8  ..X7CCY.7&<Y.%..
	defb 0afh,0a4h,098h,087h,099h,084h,084h,000h,0beh,0bfh,000h,095h,045h,032h,096h,027h	; 65b8  ............E2.'
	defb 030h,012h,036h,030h,024h,037h,0a0h,0a0h,0c2h,002h,087h,001h,0c2h,0abh,03ch,0afh	; 65c8  0.60$7........<.
	defb 080h,0aeh,0ffh,088h,088h,027h,037h,0a6h,037h,024h,03ch,059h,045h,047h,059h,03ch	; 65d8  .....'7.7$<YEGY<
	defb 0c9h,046h,032h,0c8h,003h,0bfh,036h,0beh,004h,0c1h,059h,0c0h,08ch,09ah,08ch,0a4h	; 65e8  .F2...6...Y.....
	defb 08dh,09bh,08dh,0cbh,012h,059h,0bah,047h,01ah,045h,059h,0bbh,047h,01ah,046h,0c8h	; 65f8  .....Y.G.EY.G.F.
	defb 026h,03ch,01ah,030h,030h,025h,093h,0bch,094h,092h,0bdh,0abh,045h,045h,091h,0b2h	; 6608  &<.00%......EE..
	defb 0b5h,000h,0b3h,000h,092h,0cah,091h,009h,001h,046h,03ch,002h,008h,0a6h,0cah,0a6h	; 6618  .........F<.....
	defb 058h,0c9h,0c8h,058h,03ch,0cbh,047h,03ch,012h,012h,0c2h,047h,030h,026h,047h,01ah	; 6628  X..X<.G<...G0&G.
	defb 0a5h,025h,093h,0c2h,094h,0b2h,0b5h,016h,09dh,09ch,016h,099h,089h,098h,016h,017h	; 6638  .%..............
	defb 08eh,017h,016h,099h,086h,098h,099h,086h,098h,015h,0b0h,015h,0aah,045h,043h,0a9h	; 6648  .............EC.
	defb 03ch,0a7h,0a8h,03ch,094h,080h,093h,091h,008h,009h,092h,09ch,089h,09dh,09ch,089h	; 6658  <..<............
	defb 09dh,005h,092h,091h,006h,000h,0b3h,000h,0aah,0a5h,0a9h,032h,012h,0c4h,012h,032h	; 6668  ...........2...2
	defb 036h,032h,0c5h,032h,036h,026h,036h,0bah,036h,025h,093h,0bbh,094h,092h,0c2h,091h	; 6678  62.26&6.6%......
	defb 0b9h,0c2h,002h,00ah,0b8h,031h,037h,002h,00bh,092h,01ah,037h,091h,0aah,0c2h,096h	; 6688  .....17....7....
	defb 026h,0c3h,0c2h,024h,093h,0c7h,01ah,03bh,000h,093h,059h,01ah,025h,000h,092h,059h	; 6698  &..$...;..Y.%..Y
	defb 094h,000h,092h,045h,091h,009h,008h,027h,059h,096h,0a6h,012h,059h,012h,024h,03bh	; 66a8  ...E...'Y...Y.$;
	defb 01ah,045h,0c8h,058h,026h,0cbh,03bh,025h,093h,045h,046h,094h,0b2h,080h,0b3h,000h	; 66b8  .E.X&.;%.EF.....
	defb 092h,0bah,0abh,0bbh,091h,0aah,0bch,0a9h,0a5h,0bdh,0c6h,019h,0c3h,01ch,059h,03ch	; 66c8  ..............Y<
	defb 026h,097h,0a7h,093h,037h,094h,015h,092h,01ah,091h,016h,092h,01ah,091h,080h,08fh	; 66d8  &...7...........
	defb 080h,0ffh,088h,088h,093h,0a6h,03ch,024h,092h,0beh,08dh,092h,001h,032h,0a5h,0b9h	; 66e8  ......<$.....2..
	defb 001h,036h,0a7h,0b8h,0c0h,011h,025h,092h,037h,037h,094h,092h,0cah,091h,095h,037h	; 66f8  .6....%.77.....7
	defb 037h,096h,027h,007h,097h,024h,0cch,059h,0beh,0cdh,059h,0c0h,026h,03ch,03ch,0c8h	; 6708  7.'..$.Y..Y.&<<.
	defb 025h,0aeh,09ah,0afh,098h,087h,099h,084h,098h,0a1h,099h,0a4h,0ach,09bh,08dh,027h	; 6718  %..............'
	defb 01ch,047h,0bch,018h,057h,01bh,047h,0bdh,032h,05fh,0a7h,0a8h,036h,007h,0abh,0cah	; 6728  .G..W.G.2_..6...
	defb 091h,0b9h,0cah,091h,0b8h,030h,031h,096h,095h,030h,043h,032h,0a6h,043h,012h,013h	; 6738  .....01..0C2.C..
	defb 036h,046h,0cch,004h,0a8h,0cdh,080h,093h,0a7h,020h,01fh,09dh,091h,080h,0b3h,000h	; 6748  6F....... ......
	defb 095h,032h,03ch,002h,092h,037h,036h,094h,08ah,0c3h,0abh,012h,047h,002h,00ah,09eh	; 6758  .2<..76.....G...
	defb 012h,046h,002h,00bh,000h,0c0h,0afh,000h,098h,083h,000h,098h,00eh,0adh,000h,098h	; 6768  .F..............
	defb 001h,045h,091h,098h,010h,0afh,000h,098h,086h,080h,098h,086h,080h,0b1h,001h,032h	; 6778  .E.............2
	defb 0c3h,032h,002h,001h,036h,0a0h,036h,002h,08fh,08fh,084h,084h,0b1h,027h,0beh,0bfh	; 6788  .2..6.6......'..
	defb 024h,08ah,0a5h,08bh,026h,0c0h,0c1h,025h,093h,037h,059h,094h,092h,0cah,0abh,059h	; 6798  $...&..%.7Y....Y
	defb 03ch,0abh,0cah,091h,0aah,046h,059h,0a9h,059h,0cch,057h,0cah,0cdh,05fh,059h,0c8h	; 67a8  <....FY.Y.W.._Y.
	defb 058h,046h,0c9h,03ch,0a7h,0a8h,03ch,094h,023h,000h,093h,0b6h,09ch,0a1h,09dh,09ch	; 67b8  XF.<..<.#.......
	defb 08eh,09dh,091h,085h,092h,005h,098h,099h,006h,080h,085h,081h,0b0h,000h,092h,031h	; 67c8  ...............1
	defb 032h,0abh,031h,036h,0abh,0a0h,091h,000h,087h,087h,000h,0ffh,088h,088h,027h,01bh	; 67d8  2.16..........'.
	defb 0a6h,01bh,024h,059h,054h,055h,056h,054h,0cah,05ch,05dh,05eh,05ch,059h,0c8h,04fh	; 67e8  ..$YTUVT.\]^\Y.O
	defb 04eh,0c9h,0bch,0cah,012h,057h,0bdh,0cch,05fh,026h,047h,0cdh,025h,093h,0c3h,094h	; 67f8  N....W.._&G.%...
	defb 092h,046h,046h,002h,00ah,000h,0c0h,0c1h,00bh,084h,000h,016h,017h,017h,016h,000h	; 6808  .FF.............
	defb 084h,088h,083h,027h,03ch,002h,083h,0a5h,096h,099h,037h,057h,045h,024h,08dh,026h	; 6818  ...'<.....7WE$.&
	defb 05fh,0cbh,025h,093h,0bah,094h,09dh,0bbh,09ch,000h,010h,09ah,011h,000h,017h,09dh	; 6828  _.%.............
	defb 09ch,017h,009h,092h,091h,008h,09ch,08eh,09dh,096h,023h,000h,095h,032h,0abh,032h	; 6838  ..........#..2.2
	defb 036h,0abh,036h,01ah,0abh,0c2h,0abh,01ah,037h,096h,095h,03ch,0bfh,0a6h,0beh,03bh	; 6848  6.6.....7..<...;
	defb 08bh,08ah,03bh,0c1h,046h,030h,0c0h,08ch,026h,046h,0a7h,080h,001h,094h,000h,016h	; 6858  ..;.F0..&F......
	defb 09dh,09ch,016h,080h,001h,002h,00ah,000h,08dh,027h,002h,00bh,000h,026h,043h,045h	; 6868  .........'...&CE
	defb 096h,000h,093h,03bh,046h,096h,000h,093h,03ch,03ch,024h,000h,09eh,063h,064h,065h	; 6878  ...;F...<<$..cde
	defb 000h,092h,06bh,06ch,06dh,000h,092h,066h,067h,06eh,08dh,027h,03bh,0bch,08ch,0a8h	; 6888  ..klm..fgn.';...
	defb 0bdh,083h,093h,03ch,083h,095h,025h,08dh,0aah,094h,026h,0a5h,094h,000h,090h,000h	; 6898  ...<..%...&.....
	defb 0a3h,0a3h,080h,0beh,00fh,080h,0b9h,031h,091h,008h,0b8h,043h,002h,095h,092h,03bh	; 68a8  .......1...C...;
	defb 0a6h,03ch,095h,01ah,063h,064h,065h,027h,0c3h,06bh,06ch,06dh,037h,057h,045h,066h	; 68b8  .<..cde'.klm7WEf
	defb 067h,06eh,01ah,05fh,046h,032h,007h,025h,037h,0c4h,036h,094h,026h,0c5h,025h,011h	; 68c8  gn._F2.%7.6.&.%.
	defb 000h,0aeh,026h,002h,099h,0a4h,0a4h,0ach,09bh,08dh,027h,0beh,08dh,003h,032h,001h	; 68d8  ..&.......'...2.
	defb 0c6h,030h,037h,036h,001h,059h,03ch,0a7h,026h,0c0h,0c1h,025h,093h,0cah,094h,092h	; 68e8  .076.Y<.&..%....
	defb 045h,045h,091h,000h,090h,000h,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 68f8  EE..............
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6908  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6918  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6928  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6938  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6948  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6958  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6968  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6978  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6988  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6998  ................
	defb 000h,000h,000h,02ah,0aah,0aah,040h,000h,006h,000h,000h,00eh,045h,055h,05eh,00fh	; 69a8  ...*..@.....EU^.
	defb 0ffh,0ceh,044h,000h,05eh,00ch,0aah,0ceh,045h,0ffh,05eh,00ch,0feh,0ceh,045h,0c0h	; 69b8  ..D.^...E.^...E.
	defb 05eh,00ch,0c8h,0ceh,045h,0d8h,05eh,00ch,0c0h,0ceh,045h,0c0h,05eh,00ch,080h,0ceh	; 69c8  ^...E.^...E.^...
	defb 045h,055h,05eh,00fh,0ffh,0ceh,044h,000h,01eh,00ah,0aah,0aeh,05fh,0ffh,0feh,03fh	; 69d8  EU^...D....._..?
	defb 0ffh,0feh,07fh,0ffh,0feh,000h,000h,000h,000h,000h,000h,02ah,0aah,0aah,040h,000h	; 69e8  ...........*..@.
	defb 006h,000h,000h,00eh,045h,055h,05eh,008h,000h,02eh,040h,000h,07eh,008h,0aah,0eeh	; 69f8  ....EU^...@.~...
	defb 041h,001h,07eh,008h,07dh,0eeh,041h,069h,07eh,008h,055h,0eeh,041h,069h,07eh,008h	; 6a08  A.~.}.Ai~.U.Ai~.
	defb 055h,0eeh,041h,001h,07eh,008h,0ffh,0eeh,041h,055h,07eh,00bh,0ffh,0eeh,047h,0ffh	; 6a18  U.A.~...AU~...G.
	defb 0feh,00ah,0aah,0aeh,05fh,0ffh,0feh,03fh,0ffh,0feh,07fh,0ffh,0feh,000h,000h,000h	; 6a28  ...._..?........
	defb 000h,000h,000h,02ah,0aah,0aah,040h,000h,006h,000h,000h,00eh,045h,055h,05eh,008h	; 6a38  ...*..@.....EU^.
	defb 000h,02eh,044h,000h,05eh,008h,0aah,0eeh,044h,001h,0deh,008h,082h,0eeh,044h,017h	; 6a48  ..D.^...D.....D.
	defb 0deh,008h,0beh,0eeh,044h,07fh,0deh,008h,0aah,0eeh,044h,055h,0deh,00ah,02bh,0aeh	; 6a58  ....D.....DU..+.
	defb 045h,07fh,05eh,00ah,0c2h,0aeh,045h,07fh,05eh,00ah,0aah,0aeh,05fh,0ffh,0feh,039h	; 6a68  E.^...E.^..._..9
	defb 024h,09eh,07fh,0ffh,0feh,000h,000h,000h,000h,000h,000h,029h,0ffh,0eah,041h,089h	; 6a78  $..........)..A.
	defb 046h,001h,08dh,04eh,045h,0afh,05eh,009h,08dh,06eh,045h,06ah,05eh,009h,02ch,06eh	; 6a88  F..NE.^..nEj^.,n
	defb 045h,02ch,05eh,009h,04ah,06eh,045h,089h,05eh,009h,08dh,06eh,045h,0afh,05eh,009h	; 6a98  E,^.JnE.^..nE.^.
	defb 08dh,06eh,045h,06ah,05eh,009h,02ch,06eh,045h,02ch,05eh,009h,04ah,06eh,045h,089h	; 6aa8  .nEj^.,nE,^.JnE.
	defb 05eh,009h,08dh,06eh,05dh,0afh,07eh,03dh,08dh,07eh,07dh,06ah,07eh,001h,02ch,040h	; 6ab8  ^..n].~=.~}j~.,@
	defb 000h,000h,000h,029h,0ffh,0eah,041h,02ch,046h,001h,04ah,04eh,045h,089h,05eh,009h	; 6ac8  ...)..A,F.JNE.^.
	defb 08dh,06eh,045h,0afh,05eh,009h,08dh,06eh,045h,06ah,05eh,009h,02ch,06eh,045h,02ch	; 6ad8  .nE.^..nEj^.,nE,
	defb 05eh,009h,04ah,06eh,045h,089h,05eh,009h,08dh,06eh,045h,0afh,05eh,009h,08dh,06eh	; 6ae8  ^.JnE.^..nE.^..n
	defb 045h,06ah,05eh,009h,02ch,06eh,045h,009h,05eh,009h,0aah,06eh,05dh,04dh,07eh,03dh	; 6af8  Ej^.,nE.^..n]M~=
	defb 0aah,07eh,07dh,04dh,07eh,001h,008h,040h,000h,000h,000h,029h,0ffh,0eah,041h,009h	; 6b08  .~}M~..@...)..A.
	defb 046h,001h,0ach,04eh,045h,02ch,05eh,009h,04ah,06eh,045h,089h,05eh,009h,08dh,06eh	; 6b18  F..NE,^.JnE.^..n
	defb 045h,0afh,05eh,009h,08dh,06eh,045h,06ah,05eh,009h,02ch,06eh,045h,02ch,05eh,009h	; 6b28  E.^..nEj^.,nE,^.
	defb 04ah,06eh,045h,089h,05eh,009h,08dh,06eh,045h,0afh,05eh,009h,08dh,06eh,045h,06ah	; 6b38  JnE.^..nE.^..nEj
	defb 05eh,009h,02ch,06eh,05dh,009h,07eh,03dh,0aah,07eh,07dh,04dh,07eh,001h,008h,040h	; 6b48  ^.,n].~=.~}M~..@
	defb 000h,000h,000h,029h,0ffh,0eah,041h,009h,046h,001h,0ach,04eh,045h,02dh,05eh,009h	; 6b58  ...)..A.F..NE-^.
	defb 088h,06eh,045h,02ch,05eh,009h,04ah,06eh,045h,089h,05eh,009h,08dh,06eh,045h,0afh	; 6b68  .nE,^.JnE.^..nE.
	defb 05eh,009h,08dh,06eh,045h,06ah,05eh,009h,02ch,06eh,045h,02ch,05eh,009h,04ah,06eh	; 6b78  ^..nEj^.,nE,^.Jn
	defb 045h,089h,05eh,009h,08dh,06eh,045h,0afh,05eh,009h,08dh,06eh,05dh,06ah,07eh,03dh	; 6b88  E.^..nE.^..n]j~=
	defb 02ch,07eh,07dh,009h,07eh,001h,008h,040h,000h,000h,000h,02ah,0aah,0aah,040h,000h	; 6b98  ,~}.~..@...*..@.
	defb 006h,000h,000h,00eh,04ah,0a5h,05eh,005h,042h,0aeh,04ah,008h,05eh,004h,055h,02eh	; 6ba8  ....J.^.B.J.^.U.
	defb 048h,0ffh,09eh,005h,0feh,02eh,048h,0c0h,09eh,001h,0d8h,04eh,042h,0d8h,08eh,009h	; 6bb8  H.....H....NB...
	defb 0c0h,01eh,044h,0c0h,0aeh,009h,080h,01eh,044h,0aah,02eh,00ah,010h,05eh,045h,042h	; 6bc8  ..D.....D....^EB
	defb 0aeh,00ah,0a5h,05eh,05fh,0ffh,0feh,03fh,0ffh,0feh,07fh,0ffh,0feh,000h,000h,000h	; 6bd8  ...^_..?........
	defb 000h,000h,000h,02ah,0aah,0aah,040h,000h,006h,000h,000h,00eh,04ah,0a5h,05eh,005h	; 6be8  ...*..@.....J.^.
	defb 042h,0aeh,04ah,008h,05eh,004h,055h,02eh,048h,000h,09eh,005h,001h,02eh,048h,03fh	; 6bf8  B.J.^.U.H.....H?
	defb 09eh,001h,027h,04eh,042h,027h,08eh,009h,03fh,01eh,044h,03fh,0aeh,009h,07fh,01eh	; 6c08  ..'NB'..?.D?....
	defb 044h,0aah,02eh,00ah,010h,05eh,045h,042h,0aeh,00ah,0a5h,05eh,05fh,0ffh,0feh,03fh	; 6c18  D....^EB...^_..?
	defb 0ffh,0feh,07fh,0ffh,0feh,000h,000h,000h,000h,000h,000h,02ah,0aah,0aah,040h,000h	; 6c28  ...........*..@.
	defb 006h,000h,000h,00eh,045h,015h,05eh,00eh,0ebh,0eeh,049h,054h,07eh,00bh,0fah,0aeh	; 6c38  ....E.^...IT~...
	defb 045h,0cfh,05eh,00bh,0bfh,0aeh,047h,0bdh,01eh,00bh,0f5h,0eeh,04bh,0b5h,05eh,008h	; 6c48  E.^...G.....K.^.
	defb 0cbh,0aeh,04fh,0bah,05eh,00bh,0feh,0aeh,045h,0ddh,03eh,00ah,0aah,0aeh,047h,0f5h	; 6c58  ..O.^...E.>...G.
	defb 0feh,008h,02ah,0aeh,05fh,0ffh,0feh,03fh,0ffh,0feh,07fh,0ffh,0feh,000h,000h,000h	; 6c68  ..*._..?........
	defb 000h,000h,000h,02ah,0aah,0aah,070h,041h,086h,018h,041h,00ah,05dh,077h,076h,00eh	; 6c78  ...*..pA..A.]wv.
	defb 0deh,0eeh,06bh,0d7h,06eh,03bh,0b7h,04eh,04dh,03ah,09eh,00eh,0ddh,0e2h,047h,062h	; 6c88  ..k.n;.NM:....Gb
	defb 07ch,00fh,05dh,0aeh,07fh,07eh,0feh,019h,096h,0eeh,04eh,077h,0d6h,00dh,0c9h,02ah	; 6c98  |.]..~....Nw...*
	defb 05dh,0feh,0feh,07fh,08eh,0eeh,097h,0f5h,076h,00ah,0bbh,0b6h,057h,07eh,0fah,03eh	; 6ca8  ].......v...W~.>
	defb 0feh,0feh,07fh,0ffh,0feh,000h,000h,000h,000h,000h,000h,02ah,0aah,0aah,040h,000h	; 6cb8  ...........*..@.
	defb 006h,000h,000h,00eh,04dh,05dh,056h,00eh,0a2h,0eeh,047h,0d5h,02eh,00bh,05eh,0feh	; 6cc8  ....M]V...G...^.
	defb 046h,0dbh,0deh,00fh,03bh,0aeh,046h,0c6h,05eh,00ah,0fbh,0eeh,047h,039h,0c6h,00eh	; 6cd8  F...;.F.^...G9..
	defb 0fah,0feh,047h,036h,0deh,00fh,0fdh,0beh,04dh,073h,0eeh,01ah,0aeh,0ceh,049h,0e5h	; 6ce8  ..G6....Ms....I.
	defb 05eh,00ah,0beh,0aeh,05fh,0ffh,0feh,03fh,0ffh,0feh,07fh,0ffh,0feh,000h,000h,000h	; 6cf8  ^..._..?........
	defb 000h,000h,000h,02ah,0aah,0aah,040h,000h,006h,000h,000h,00eh,045h,055h,05eh,00ah	; 6d08  ...*..@.....EU^.
	defb 0eah,02eh,047h,045h,07eh,00ah,0aah,0aeh,046h,053h,05eh,00ah,0beh,0aeh,045h,0ebh	; 6d18  ..GE~...FS^...E.
	defb 03eh,00ah,0ebh,0eeh,043h,065h,09eh,00eh,0dfh,02eh,045h,065h,01eh,00ah,0fah,06eh	; 6d28  >...Ce....Ee...n
	defb 045h,054h,0deh,00ah,019h,0aeh,045h,0f5h,05eh,00ah,0aah,0aeh,05fh,0ffh,0feh,03fh	; 6d38  ET....E.^..._..?
	defb 0ffh,0feh,07fh,0ffh,0feh,000h,000h,000h,000h,000h,000h,02ah,0aah,0aah,040h,000h	; 6d48  ...........*..@.
	defb 006h,000h,000h,00eh,045h,055h,05eh,00ah,0eah,02eh,047h,045h,07eh,00ah,091h,0aeh	; 6d58  ....EU^...GE~...
	defb 046h,018h,0deh,00ah,018h,06eh,045h,0d8h,03eh,00ah,0dbh,0aeh,043h,058h,01eh,00dh	; 6d68  F....nE.>...CX..
	defb 0dbh,0aeh,044h,018h,01eh,00ah,010h,06eh,047h,000h,0deh,00bh,01bh,0aeh,045h,0f5h	; 6d78  ..D....nG.....E.
	defb 03eh,00ah,0aah,0aeh,05fh,0ffh,0beh,03fh,0ffh,0feh,07fh,0ffh,0feh,000h,000h,000h	; 6d88  >..._..?........
	defb 000h,000h,000h,02ah,0aah,0aah,040h,000h,006h,000h,000h,00eh,045h,055h,05eh,00ah	; 6d98  ...*..@.....EU^.
	defb 0eah,02eh,047h,045h,07eh,00ah,091h,0aeh,046h,000h,0deh,00ah,018h,06eh,045h,024h	; 6da8  ..GE~...F....nE$
	defb 03eh,00ah,04ah,0aeh,043h,05eh,01eh,00dh,02ch,0aeh,044h,018h,01eh,00ah,000h,06eh	; 6db8  >.J.C^..,.D....n
	defb 047h,000h,0deh,00bh,01bh,0aeh,045h,0f5h,03eh,00ah,0aah,0aeh,05fh,0ffh,0beh,03fh	; 6dc8  G.....E.>..._..?
	defb 0ffh,0feh,07fh,0ffh,0feh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6dd8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6de8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6df8  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6e08  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6e18  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6e28  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6e38  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6e48  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,001h,045h,055h,0d5h,082h,08ah,0aah,0eah	; 6e58  .........EU.....
	defb 001h,044h,005h,0d5h,082h,088h,00eh,0eah,001h,044h,05dh,0d5h,082h,088h,0aeh,0eah	; 6e68  .D.......D].....
	defb 001h,044h,05dh,0d5h,082h,088h,0aeh,0eah,001h,044h,05dh,0d5h,082h,088h,0aeh,0e2h	; 6e78  .D]......D].....
	defb 001h,044h,05dh,0c7h,082h,088h,0aeh,0eah,001h,044h,05dh,0c7h,082h,088h,0aeh,0eah	; 6e88  .D]......D].....
	defb 001h,044h,05dh,0c7h,082h,088h,0aeh,0eah,001h,044h,05dh,0c7h,082h,088h,0aeh,0eah	; 6e98  .D]......D].....
	defb 001h,044h,05dh,0c7h,082h,088h,0aeh,0eah,001h,044h,05dh,0c7h,082h,088h,0aeh,0eah	; 6ea8  .D]......D].....
	defb 001h,044h,05dh,0c7h,082h,088h,0aeh,0feh,001h,044h,05dh,0d5h,082h,088h,0aeh,0eah	; 6eb8  .D]......D].....
	defb 001h,044h,05dh,0d5h,082h,088h,0feh,0eah,001h,045h,0fdh,0d5h,082h,08ah,0aah,0eah	; 6ec8  .D]......E......
	defb 001h,045h,055h,0d5h,082h,08ah,0aah,0eah,055h,075h,0f5h,07fh,0aah,0a2h,0eah,0beh	; 6ed8  .EU.....Uu......
	defb 055h,075h,0f5h,07fh,0aah,0a2h,0eah,0beh,055h,075h,0f5h,07fh,0aah,0a2h,0eah,0beh	; 6ee8  Uu......Uu......
	defb 055h,075h,0f5h,07fh,0aah,080h,00ah,0beh,057h,0ffh,0ffh,07fh,0aeh,00ah,0bfh,0beh	; 6ef8  Uu......W.......
	defb 055h,041h,05fh,07fh,0aeh,00ah,0bfh,0beh,055h,041h,05fh,07fh,0aeh,00ah,0bfh,0beh	; 6f08  UA_.....UA_.....
	defb 055h,041h,05fh,07fh,0aeh,00ah,0bfh,0beh,057h,0ffh,0ffh,07fh,0aah,080h,00ah,0beh	; 6f18  UA_.....W.......
	defb 055h,075h,0f5h,07fh,0aah,0a2h,0eah,0beh,055h,075h,0f5h,07fh,0aah,0a2h,0eah,0beh	; 6f28  Uu......Uu......
	defb 055h,075h,0f5h,07fh,0aah,0a2h,0eah,0beh,055h,075h,0f5h,07fh,0aah,0a2h,0eah,0beh	; 6f38  Uu......Uu......
	defb 055h,075h,0f5h,07fh,0aah,0a2h,0eah,0beh,055h,075h,0f5h,07fh,0aah,0a2h,0eah,0beh	; 6f48  Uu......Uu......
	defb 055h,075h,0f5h,07fh,0aah,0a2h,0eah,0beh,055h,055h,055h,055h,000h,000h,000h,000h	; 6f58  Uu......UUUU....
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6f68  ................
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,0fdh,055h,055h,07fh,023h,0aah,0aah,0c8h	; 6f78  UUUU.....UU.#...
	defb 075h,0d0h,015h,01dh,0abh,0a0h,02ah,02ah,0f1h,0d1h,076h,05fh,0fah,0e2h,0ech,0bfh	; 6f88  u.....**..v_....
	defb 05fh,0d1h,077h,0f5h,0aah,0e2h,0ech,0eah,059h,0d1h,075h,075h,0aah,0e2h,0ech,0eah	; 6f98  _.w.....Y.uu....
	defb 059h,0d7h,0f5h,075h,0aah,0efh,0ech,0eah,05fh,0d5h,057h,0f5h,0aah,0eah,0ach,0eah	; 6fa8  Y..u...._.W.....
	defb 059h,07fh,0f9h,0f5h,0aah,090h,012h,0eah,055h,055h,055h,0d5h,0afh,0bah,0bfh,0eah	; 6fb8  Y.......UUU.....
	defb 057h,0ffh,0ffh,0d5h,0aah,0ffh,0feh,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 6fc8  W.......UUUU....
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,000h,001h,0aah	; 6fd8  UUUU....UUUU....
	defb 054h,000h,003h,055h,0aah,02ah,0abh,0aah,054h,055h,057h,055h,0aah,02ah,0abh,0aah	; 6fe8  T..U.*..TUWU.*..
	defb 055h,015h,057h,055h,006h,08ah,0aeh,080h,007h,045h,05dh,000h,0abh	; 6ff8  U.WU.....E]..

; ======================================================================
; CODIGO 0x7005..0x700e  (9 bytes)
; ======================================================================


L_7005:
	and d			;7005
	cp d			;7006
	ld hl,(0d155h)		;7007
	ld (hl),h		;700a
	ld d,l			;700b
	xor d			;700c
	jp (hl)			;700d

; ----------------------------------------------------------------------
; DATOS tiles: de los niveles: 111 de 32x32, 128 bytes cada uno
;   0x6de0..0xa560  (14208 bytes)
; ----------------------------------------------------------------------
	defb 0e8h,0aah,033h,075h,051h,033h,0aah,0bah,0a2h,0aah,033h,05dh,045h,033h,0aah,0a8h	; 700e  ..3uQ3....3]E3..
	defb 00ah,0aah	; 701e  ..

; ======================================================================
; CODIGO 0x7020..0x743c  (1052 bytes)
; ======================================================================


L_7020:
	inc sp			;7020
	jr nc,L_7036		;7021
	inc sp			;7023
	xor d			;7024
	xor d			;7025
	xor d			;7026
	xor d			;7027
	inc sp			;7028
	dec (hl)		;7029
	ld d,e			;702a
	inc sp			;702b
	xor d			;702c
	xor d			;702d
	xor d			;702e
	xor d			;702f
	ld d,l			;7030
	ld d,l			;7031
	ld d,l			;7032
	ld d,l			;7033
	rst 38h			;7034
	rst 38h			;7035
L_7036:
	rst 38h			;7036
	rst 38h			;7037
	rst 38h			;7038
	rst 38h			;7039
	rst 38h			;703a
	rst 38h			;703b
	xor d			;703c
	xor d			;703d
	xor d			;703e
	xor d			;703f
	ld d,l			;7040
	ld d,l			;7041
	ld d,l			;7042
	ld d,l			;7043
	xor d			;7044
	xor d			;7045
	xor d			;7046
	xor d			;7047
	rst 38h			;7048
	rst 38h			;7049
	rst 38h			;704a
	rst 38h			;704b
	rst 38h			;704c
	rst 38h			;704d
	rst 38h			;704e
	rst 38h			;704f
	rst 38h			;7050
	rst 38h			;7051
	rst 38h			;7052
	rst 38h			;7053
	rst 38h			;7054
	rst 38h			;7055
	rst 38h			;7056
	rst 38h			;7057
	rst 38h			;7058
	rst 38h			;7059
	rst 38h			;705a
	rst 38h			;705b
	xor d			;705c
	xor d			;705d
	xor d			;705e
	xor d			;705f
	ld d,l			;7060
	ld (hl),l		;7061
	push af			;7062
	ld a,a			;7063
	xor d			;7064
	and d			;7065
	jp pe,L_55FE		;7066
	ld e,a			;7069
	push de			;706a
	call m,L_AFAA		;706b
	xor e			;706e
	ret m			;706f
	ld d,l			;7070
	ld d,l			;7071
	ld d,a			;7072
	ret p			;7073
	xor d			;7074
L_7075:
	xor d			;7075
	xor a			;7076
	ret po			;7077
	ld d,l			;7078
	ld d,l			;7079
	ld e,a			;707a
	ret nz			;707b
	nop			;707c
	xor d			;707d
	cp a			;707e
	add a,b			;707f
	ld bc,07fd5h		;7080
	nop			;7083
	xor e			;7084
	xor d			;7085
	cp 000h			;7086
	ld d,l			;7088
	push de			;7089
	call m,0ab00h		;708a
	xor e			;708d
	ret m			;708e
	nop			;708f
	dec (hl)		;7090
	rst 10h			;7091
	ret p			;7092
	nop			;7093
	xor e			;7094
	xor a			;7095
	ret po			;7096
	nop			;7097
	scf			;7098
	ld e,a			;7099
	ret nz			;709a
	nop			;709b
	xor (hl)		;709c
	cp a			;709d
	add a,b			;709e
	nop			;709f
	ld e,l			;70a0
	ld a,a			;70a1
	nop			;70a2
	nop			;70a3
	cp d			;70a4
	cp 000h			;70a5
	nop			;70a7
	ld (hl),l		;70a8
	call m,00000h		;70a9   ; BIOS CHKRAM - Tests RAM and sets RAM slot for the system  [alias: STARTUP, RESET, BOOT]
L_70AC:
	ex de,hl		;70ac
	ret m			;70ad
	nop			;70ae
L_70AF:
	nop			;70af
	rst 10h			;70b0
	ret p			;70b1
	nop			;70b2
	nop			;70b3
	xor a			;70b4
	ret po			;70b5
	nop			;70b6
	nop			;70b7
	ld e,a			;70b8
	ret nz			;70b9
L_70BA:
	nop			;70ba
	nop			;70bb
	cp a			;70bc
	add a,b			;70bd
	nop			;70be
	nop			;70bf
	ld a,a			;70c0
	nop			;70c1
	nop			;70c2
	nop			;70c3
	cp 000h			;70c4
	nop			;70c6
	nop			;70c7
	call m,00000h		;70c8   ; BIOS CHKRAM - Tests RAM and sets RAM slot for the system  [alias: STARTUP, RESET, BOOT]
	nop			;70cb
	ret m			;70cc
	nop			;70cd
	nop			;70ce
	nop			;70cf
	ret p			;70d0
	nop			;70d1
	nop			;70d2
	nop			;70d3
	ret po			;70d4
	nop			;70d5
	nop			;70d6
	nop			;70d7
	ret nz			;70d8
	nop			;70d9
	nop			;70da
	nop			;70db
	add a,b			;70dc
	nop			;70dd
	nop			;70de
	nop			;70df
	ld b,c			;70e0
	ld b,l			;70e1
	ld d,l			;70e2
	push de			;70e3
	jr nz,L_7075		;70e4
	rst 38h			;70e6
	jp pe,05f10h		;70e7
	rst 38h			;70ea
	push de			;70eb
	ex af,af'		;70ec
	ld hl,(0aaaah)		;70ed
	inc b			;70f0
	dec d			;70f1
	ld d,l			;70f2
	ld d,l			;70f3
	ld (bc),a		;70f4
	ld a,(bc)		;70f5
	xor d			;70f6
	xor d			;70f7
	ld bc,05505h		;70f8
	ld d,l			;70fb
	nop			;70fc
	add a,d			;70fd
	xor b			;70fe
	nop			;70ff
	nop			;7100
	ld b,c			;7101
	ld d,h			;7102
	nop			;7103
	nop			;7104
	jr nz,L_70AF		;7105
	xor d			;7107
	nop			;7108
	djnz L_715F		;7109
	ld d,l			;710b
	nop			;710c
	ex af,af'		;710d
	jr z,L_70BA		;710e
	nop			;7110
	inc b			;7111
	inc d			;7112
	ld d,e			;7113
	nop			;7114
	ld (bc),a		;7115
	ld a,(bc)		;7116
	ld hl,(00100h)		;7117
	dec b			;711a
	inc de			;711b
	nop			;711c
	nop			;711d
	add a,d			;711e
	adc a,d			;711f
	nop			;7120
	nop			;7121
	ld b,c			;7122
	ld b,l			;7123
	nop			;7124
	nop			;7125
	jr nz,$-92		;7126
	nop			;7128
	nop			;7129
	djnz L_717D		;712a
	nop			;712c
	nop			;712d
	ex af,af'		;712e
	jr z,L_7131		;712f
L_7131:
	nop			;7131
	inc b			;7132
	inc d			;7133
	nop			;7134
	nop			;7135
	ld (bc),a		;7136
	ld a,(bc)		;7137
	nop			;7138
	nop			;7139
	ld bc,00005h		;713a
	nop			;713d
	nop			;713e
	add a,d			;713f
	nop			;7140
	nop			;7141
	nop			;7142
	ld b,c			;7143
	nop			;7144
	nop			;7145
	nop			;7146
	jr nz,L_7149		;7147
L_7149:
	nop			;7149
	nop			;714a
	djnz L_714D		;714b
L_714D:
	nop			;714d
	nop			;714e
	ex af,af'		;714f
	nop			;7150
	nop			;7151
	nop			;7152
	inc b			;7153
	nop			;7154
	nop			;7155
	nop			;7156
	ld (bc),a		;7157
	nop			;7158
	nop			;7159
	nop			;715a
	ld bc,00000h		;715b
	nop			;715e
L_715F:
	nop			;715f
	ld d,l			;7160
	ld d,l			;7161
	ld d,l			;7162
L_7163:
	ld d,l			;7163
	xor d			;7164
	xor d			;7165
L_7166:
	xor d			;7166
	xor d			;7167
	ld d,l			;7168
	ld d,l			;7169
	ld d,l			;716a
	ld d,l			;716b
	cp a			;716c
	rst 38h			;716d
	rst 38h			;716e
	jp m,0ff5fh		;716f
	rst 38h			;7172
	push af			;7173
	cp a			;7174
	rst 38h			;7175
	rst 38h			;7176
	jp po,0005ch		;7177   ; BIOS LDIRVM - Block transfers to VRAM from memory
	nop			;717a
	dec b			;717b
	cp h			;717c
L_717D:
	xor d			;717d
	xor d			;717e
	add a,d			;717f
	ld e,l			;7180
	nop			;7181
	nop			;7182
	dec b			;7183
	cp h			;7184
	nop			;7185
	nop			;7186
	add a,d			;7187
	ld e,l			;7188
	nop			;7189
	nop			;718a
	dec b			;718b
	cp h			;718c
	nop			;718d
	nop			;718e
	add a,d			;718f
	ld e,l			;7190
	nop			;7191
	nop			;7192
	dec b			;7193
	cp h			;7194
	nop			;7195
	nop			;7196
	add a,d			;7197
	ld e,l			;7198
	nop			;7199
	nop			;719a
	dec b			;719b
	cp h			;719c
	nop			;719d
	nop			;719e
	add a,d			;719f
	ld e,l			;71a0
	nop			;71a1
	nop			;71a2
	dec b			;71a3
	cp h			;71a4
	nop			;71a5
	nop			;71a6
	add a,d			;71a7
	ld e,l			;71a8
	nop			;71a9
	nop			;71aa
	dec b			;71ab
	cp h			;71ac
	nop			;71ad
	nop			;71ae
	add a,d			;71af
	ld e,l			;71b0
	nop			;71b1
	nop			;71b2
	dec b			;71b3
	cp h			;71b4
	nop			;71b5
	nop			;71b6
	add a,d			;71b7
	ld e,l			;71b8
	nop			;71b9
	nop			;71ba
	dec b			;71bb
	cp h			;71bc
	nop			;71bd
	nop			;71be
L_71BF:
	add a,d			;71bf
	ld e,l			;71c0
	ld d,l			;71c1
	ld d,l			;71c2
	dec b			;71c3
	cp h			;71c4
	nop			;71c5
	nop			;71c6
	ld (bc),a		;71c7
	ld e,h			;71c8
	nop			;71c9
	nop			;71ca
	dec b			;71cb
	cp b			;71cc
	nop			;71cd
	nop			;71ce
	ld (bc),a		;71cf
	ld d,b			;71d0
	nop			;71d1
	nop			;71d2
	dec b			;71d3
	xor d			;71d4
	xor d			;71d5
	xor d			;71d6
	xor d			;71d7
	ld d,l			;71d8
	ld d,l			;71d9
	ld d,l			;71da
	ld d,l			;71db
	xor d			;71dc
	xor d			;71dd
	xor d			;71de
	xor d			;71df
	nop			;71e0
	nop			;71e1
	nop			;71e2
	ld bc,00000h		;71e3
	nop			;71e6
	ld (bc),a		;71e7
	nop			;71e8
	nop			;71e9
	nop			;71ea
	inc b			;71eb
	nop			;71ec
	nop			;71ed
	nop			;71ee
	ex af,af'		;71ef
	nop			;71f0
	nop			;71f1
	nop			;71f2
	djnz L_71F5		;71f3
L_71F5:
	nop			;71f5
	nop			;71f6
	jr nz,L_71F9		;71f7
L_71F9:
	nop			;71f9
	nop			;71fa
	ld b,b			;71fb
	nop			;71fc
	nop			;71fd
	nop			;71fe
	add a,b			;71ff
	nop			;7200
	nop			;7201
	ld bc,00001h		;7202
	nop			;7205
	ld (bc),a		;7206
	inc bc			;7207
	nop			;7208
	nop			;7209
	inc b			;720a
	rlca			;720b
	nop			;720c
	nop			;720d
	ex af,af'		;720e
	ld a,(bc)		;720f
	nop			;7210
	nop			;7211
	djnz $+25		;7212
	nop			;7214
	nop			;7215
	jr nz,L_7243		;7216
	nop			;7218
	nop			;7219
	ld b,b			;721a
	ld d,l			;721b
	nop			;721c
	nop			;721d
	add a,b			;721e
	ld l,d			;721f
	nop			;7220
	ld bc,0d500h		;7221
	nop			;7224
	ld (bc),a		;7225
	nop			;7226
	jp pe,00400h		;7227
	ld bc,000d5h		;722a
	ex af,af'		;722d
	ld (bc),a		;722e
	jp pe,01000h		;722f
	dec b			;7232
	push de			;7233
	nop			;7234
	jr nz,$+12		;7235
	jp pe,04000h		;7237
	inc de			;723a
	push de			;723b
	nop			;723c
	add a,b			;723d
	ld h,0eah		;723e
	ld bc,04700h		;7240
L_7243:
	push de			;7243
	ld (bc),a		;7244
	nop			;7245
	adc a,(hl)		;7246
	jp pe,00104h		;7247
	rla			;724a
	push de			;724b
	ex af,af'		;724c
	ld (bc),a		;724d
	ld l,0eah		;724e
	djnz L_7256		;7250
	ld d,a			;7252
	push de			;7253
	jr nz,L_725E		;7254
L_7256:
	cp 0eah			;7256
	ld b,b			;7258
	ld b,l			;7259
	rst 38h			;725a
	push de			;725b
	add a,b			;725c
	adc a,d			;725d
L_725E:
	xor d			;725e
	jp pe,00000h		;725f   ; BIOS CHKRAM - Tests RAM and sets RAM slot for the system  [alias: STARTUP, RESET, BOOT]
	nop			;7262
	nop			;7263
	add a,b			;7264
	nop			;7265
	nop			;7266
	nop			;7267
	ret nz			;7268
	nop			;7269
	nop			;726a
	nop			;726b
	ret po			;726c
	nop			;726d
	nop			;726e
	nop			;726f
	ret p			;7270
	nop			;7271
	nop			;7272
	nop			;7273
	ret m			;7274
	nop			;7275
	nop			;7276
	nop			;7277
	call m,00000h		;7278   ; BIOS CHKRAM - Tests RAM and sets RAM slot for the system  [alias: STARTUP, RESET, BOOT]
	nop			;727b
	cp 000h			;727c
	nop			;727e
	nop			;727f
	rst 38h			;7280
	nop			;7281
	nop			;7282
	nop			;7283
	rst 38h			;7284
	add a,b			;7285
	nop			;7286
	nop			;7287
	ld e,a			;7288
	ret nz			;7289
	nop			;728a
	nop			;728b
	rst 28h			;728c
	ret po			;728d
	nop			;728e
	nop			;728f
	rst 10h			;7290
	ret p			;7291
	nop			;7292
	nop			;7293
	xor e			;7294
	ret m			;7295
	nop			;7296
	nop			;7297
	ld d,l			;7298
	call m,00000h		;7299   ; BIOS CHKRAM - Tests RAM and sets RAM slot for the system  [alias: STARTUP, RESET, BOOT]
	xor d			;729c
	cp 000h			;729d
	nop			;729f
	ld b,e			;72a0
	ld a,a			;72a1
	nop			;72a2
	nop			;72a3
	adc a,e			;72a4
	cp a			;72a5
	add a,b			;72a6
	nop			;72a7
	dec d			;72a8
	rst 18h			;72a9
	ret nz			;72aa
	nop			;72ab
	xor d			;72ac
	xor a			;72ad
	ret po			;72ae
	nop			;72af
	dec d			;72b0
	rst 10h			;72b1
	ret p			;72b2
	nop			;72b3
	xor d			;72b4
	xor e			;72b5
	ret m			;72b6
	nop			;72b7
	dec d			;72b8
	push de			;72b9
	call m,L_8B00		;72ba
	xor d			;72bd
	cp 000h			;72be
	ld c,a			;72c0
	ld d,l			;72c1
	ld a,a			;72c2
	nop			;72c3
	xor d			;72c4
	xor d			;72c5
	cp a			;72c6
	add a,b			;72c7
	ld d,l			;72c8
	ld d,l			;72c9
	ld e,a			;72ca
	ret nz			;72cb
	xor d			;72cc
	xor a			;72cd
	xor a			;72ce
	ret po			;72cf
	ld d,l			;72d0
	ld d,c			;72d1
	rst 10h			;72d2
	ret p			;72d3
	xor d			;72d4
	and d			;72d5
	ex de,hl		;72d6
	ret m			;72d7
	ld d,l			;72d8
	ld (hl),l		;72d9
	push af			;72da
	call m,L_A2AA		;72db
	jp pe,L_80FE		;72de
	nop			;72e1
	nop			;72e2
	nop			;72e3
	ld b,b			;72e4
	nop			;72e5
	nop			;72e6
	nop			;72e7
	xor b			;72e8
	nop			;72e9
	nop			;72ea
	nop			;72eb
	ld d,a			;72ec
	nop			;72ed
	nop			;72ee
	nop			;72ef
	call m,01cdeh		;72f0
	nop			;72f3
	ld b,b			;72f4
	cpl			;72f5
	xor 000h		;72f6
	ret po			;72f8
	ret nc			;72f9
	ld (02300h),a		;72fa
	add a,b			;72fd
	jr nz,L_7300		;72fe
L_7300:
	sbc a,000h		;7300
	jr L_7304		;7302
L_7304:
	ld e,b			;7304
	nop			;7305
	nop			;7306
	nop			;7307
	ret nc			;7308
	nop			;7309
	nop			;730a
	nop			;730b
	ret nc			;730c
	nop			;730d
	nop			;730e
	nop			;730f
	ld d,b			;7310
	nop			;7311
	nop			;7312
	nop			;7313
	ret nc			;7314
	nop			;7315
	ld (bc),a		;7316
	nop			;7317
	ld d,b			;7318
	djnz L_731E		;7319
	nop			;731b
	ret nc			;731c
	ret pe			;731d
L_731E:
	add hl,de		;731e
	nop			;731f
	ld d,e			;7320
	call z,L_8031		;7321
	rst 10h			;7324
	ld l,061h		;7325
	add a,b			;7327
	ld e,b			;7328
	and 061h		;7329
	add a,b			;732b
	out (0e9h),a		;732c
	ld h,b			;732e
	nop			;732f
	ld c,e			;7330
	defb 0edh ;next byte illegal after ed	;7331
	ld h,e			;7332
	ret nz			;7333
	call nc,036edh		;7334
	add a,b			;7337
	ld c,c			;7338
	ld l,e			;7339
	add hl,sp		;733a
	add a,b			;733b
	push de			;733c
	ld l,e			;733d
	dec hl			;733e
	nop			;733f
	ld c,c			;7340
	xor e			;7341
	inc l			;7342
	nop			;7343
	sub 0a6h		;7344
	ld c,b			;7346
	nop			;7347
	ld c,e			;7348
	ld h,(hl)		;7349
	ld e,b			;734a
	nop			;734b
	push de			;734c
	ld l,h			;734d
	ret p			;734e
	nop			;734f
	ld c,c			;7350
	sbc a,e			;7351
	ld h,b			;7352
	nop			;7353
	push de			;7354
	sbc a,e			;7355
	nop			;7356
	nop			;7357
	ld c,c			;7358
	inc (hl)		;7359
	nop			;735a
	nop			;735b
	call nc,000ebh		;735c
	nop			;735f
	ld c,c			;7360
	rst 10h			;7361
	nop			;7362
	nop			;7363
	rst 0			;7364
	or a			;7365
	nop			;7366
	nop			;7367
	ld c,a			;7368
	ld d,a			;7369
	nop			;736a
	nop			;736b
	rst 18h			;736c
	ld d,a			;736d
	nop			;736e
	nop			;736f
	ld c,(hl)		;7370
	xor (hl)		;7371
	nop			;7372
	nop			;7373
	defb 0ddh,02eh,000h ;ld ixl,000h	;7374
	nop			;7377
	ld c,l			;7378
	ld l,(hl)		;7379
	nop			;737a
	nop			;737b
	ld e,(ix+000h)		;737c
	nop			;737f
	ld c,d			;7380
	ld e,h			;7381
	nop			;7382
	nop			;7383
	jp c,000dch		;7384
	nop			;7387
	ld c,d			;7388
	inc a			;7389
	nop			;738a
	nop			;738b
	ret nc			;738c
	cp b			;738d
	nop			;738e
	nop			;738f
	ld c,a			;7390
	ret c			;7391
	nop			;7392
	nop			;7393
	rst 10h			;7394
	ret nc			;7395
	nop			;7396
	nop			;7397
	ld c,a			;7398
	ret nc			;7399
	nop			;739a
	nop			;739b
	ret nc			;739c
	nop			;739d
	nop			;739e
	nop			;739f
	ld b,a			;73a0
	ret nz			;73a1
	nop			;73a2
	nop			;73a3
	rst 10h			;73a4
	nop			;73a5
	nop			;73a6
	nop			;73a7
	ld c,b			;73a8
	add a,b			;73a9
	nop			;73aa
	nop			;73ab
	pop de			;73ac
	ret nz			;73ad
	nop			;73ae
	nop			;73af
	ld c,d			;73b0
	ret po			;73b1
	nop			;73b2
	nop			;73b3
	pop de			;73b4
	ld (hl),b		;73b5
	nop			;73b6
	nop			;73b7
	ld b,d			;73b8
	sbc a,b			;73b9
	nop			;73ba
	nop			;73bb
	pop de			;73bc
	inc l			;73bd
	nop			;73be
	nop			;73bf
	ld hl,00054h		;73c0
	nop			;73c3
	pop hl			;73c4
	ld (hl),h		;73c5
	nop			;73c6
	nop			;73c7
	ld bc,00074h		;73c8
	nop			;73cb
	ld bc,000b4h		;73cc
	nop			;73cf
	nop			;73d0
	ret z			;73d1
	nop			;73d2
	nop			;73d3
	nop			;73d4
	ld a,b			;73d5
	nop			;73d6
	nop			;73d7
	nop			;73d8
	jr nz,L_73DB		;73d9
L_73DB:
	nop			;73db
	nop			;73dc
	nop			;73dd
	nop			;73de
	nop			;73df
	nop			;73e0
	nop			;73e1
	nop			;73e2
	ld bc,00000h		;73e3
	nop			;73e6
	inc bc			;73e7
	nop			;73e8
	nop			;73e9
	nop			;73ea
	rlca			;73eb
	nop			;73ec
	nop			;73ed
	nop			;73ee
	dec bc			;73ef
	nop			;73f0
	nop			;73f1
	nop			;73f2
	ccf			;73f3
	nop			;73f4
	nop			;73f5
	nop			;73f6
	ld d,b			;73f7
	nop			;73f8
	nop			;73f9
	nop			;73fa
	ld h,a			;73fb
	nop			;73fc
	nop			;73fd
	nop			;73fe
	add a,h			;73ff
	nop			;7400
	nop			;7401
	nop			;7402
	adc a,c			;7403
	nop			;7404
	nop			;7405
	ld bc,0008ah		;7406
	nop			;7409
	ld bc,00091h		;740a
	nop			;740d
	nop			;740e
	ld (de),a		;740f
	nop			;7410
	nop			;7411
	nop			;7412
	add hl,hl		;7413
	nop			;7414
	nop			;7415
	nop			;7416
	ld hl,(00000h)		;7417
	nop			;741a
	ld e,c			;741b
	nop			;741c
	nop			;741d
	nop			;741e
	ld e,d			;741f
	nop			;7420
	nop			;7421
	nop			;7422
	xor c			;7423
	nop			;7424
	nop			;7425
	nop			;7426
	xor e			;7427
	nop			;7428
	nop			;7429
	ld bc,00071h		;742a
	nop			;742d
L_742E:
	ld bc,0007bh		;742e
	nop			;7431
	ld (bc),a		;7432
	ld sp,hl		;7433
	nop			;7434
	nop			;7435
	ld (bc),a		;7436
	di			;7437
	nop			;7438
	nop			;7439
	dec b			;743a
	jp (hl)			;743b

; ----------------------------------------------------------------------
; DATOS tiles: de los niveles: 111 de 32x32, 128 bytes cada uno
;   0x6de0..0xa560  (14208 bytes)
; ----------------------------------------------------------------------
	defb 000h,000h,009h,0d2h,000h,000h,012h,0a9h,000h,000h,032h,05bh,000h,000h,02ah,0bbh	; 743c  ..........2[..*.
	defb 000h,000h,029h,07bh,000h,000h,05ah,0e3h,000h,000h,0a9h,05bh,000h	; 744c  ..){..Z....[.

; ======================================================================
; CODIGO 0x7459..0x787d  (1060 bytes)
; ======================================================================


L_7459:
	nop			;7459
	defb 0cbh,031h ;sli c	;745a
	nop			;745c
	nop			;745d
	xor e			;745e
	dec hl			;745f
	nop			;7460
	nop			;7461
	xor e			;7462
	dec hl			;7463
	nop			;7464
	nop			;7465
	defb 0cbh,033h ;sli e	;7466
	nop			;7468
	nop			;7469
	xor c			;746a
	ld e,e			;746b
	nop			;746c
	nop			;746d
	ld e,d			;746e
	ex (sp),hl		;746f
	nop			;7470
	nop			;7471
	add hl,hl		;7472
	ld a,e			;7473
	nop			;7474
	nop			;7475
	ld hl,(000b9h)		;7476
	nop			;7479
	ld (0005bh),a		;747a
	nop			;747d
	ld (de),a		;747e
	xor e			;747f
	nop			;7480
	nop			;7481
	add hl,bc		;7482
	sub e			;7483
	nop			;7484
	nop			;7485
	dec b			;7486
	xor e			;7487
	nop			;7488
	nop			;7489
	ld (bc),a		;748a
	out (000h),a		;748b
	nop			;748d
	ld (bc),a		;748e
	ex de,hl		;748f
	nop			;7490
	nop			;7491
	ld bc,00073h		;7492
	nop			;7495
	ld bc,0007bh		;7496
	nop			;7499
	nop			;749a
	or e			;749b
	nop			;749c
	nop			;749d
	nop			;749e
	adc a,e			;749f
	nop			;74a0
	nop			;74a1
	nop			;74a2
	ld e,e			;74a3
	nop			;74a4
	nop			;74a5
	nop			;74a6
	ld e,e			;74a7
	nop			;74a8
	nop			;74a9
	nop			;74aa
	dec hl			;74ab
	nop			;74ac
	nop			;74ad
	nop			;74ae
	dec hl			;74af
	nop			;74b0
	nop			;74b1
	nop			;74b2
	inc de			;74b3
	nop			;74b4
	nop			;74b5
	nop			;74b6
	inc de			;74b7
	nop			;74b8
	nop			;74b9
	nop			;74ba
	dec bc			;74bb
	nop			;74bc
	nop			;74bd
	nop			;74be
	dec bc			;74bf
	nop			;74c0
	nop			;74c1
	inc b			;74c2
	ld b,h			;74c3
	nop			;74c4
	nop			;74c5
	ld (bc),a		;74c6
	rst 0			;74c7
	nop			;74c8
	nop			;74c9
	ld bc,000c0h		;74ca
	nop			;74cd
	inc bc			;74ce
	add a,c			;74cf
	nop			;74d0
	nop			;74d1
	rlca			;74d2
	ld (hl),e		;74d3
	nop			;74d4
	nop			;74d5
	nop			;74d6
	cpl			;74d7
	nop			;74d8
	nop			;74d9
	nop			;74da
	inc de			;74db
	nop			;74dc
	nop			;74dd
	nop			;74de
	ld bc,05555h		;74df
	ld d,l			;74e2
	ld d,l			;74e3
	add a,b			;74e4
	nop			;74e5
	nop			;74e6
	nop			;74e7
	nop			;74e8
	nop			;74e9
	nop			;74ea
	nop			;74eb
	add a,b			;74ec
	nop			;74ed
	nop			;74ee
	nop			;74ef
	nop			;74f0
	nop			;74f1
	nop			;74f2
	nop			;74f3
	add a,b			;74f4
	nop			;74f5
	nop			;74f6
	nop			;74f7
	ld bc,05555h		;74f8
	ld d,l			;74fb
	add a,d			;74fc
	xor d			;74fd
	xor d			;74fe
	xor d			;74ff
	ld bc,05555h		;7500
	ld e,a			;7503
	add a,d			;7504
	add a,b			;7505
	ld hl,(001b8h)		;7506
	ld b,b			;7509
	ld (hl),l		;750a
	ld (hl),c		;750b
	add a,d			;750c
	adc a,d			;750d
	jp pe,001e2h		;750e
	ld b,l			;7511
	ld (hl),l		;7512
	ld a,a			;7513
L_7514:
	add a,d			;7514
	adc a,d			;7515
	jp pe,001cfh		;7516
	ld b,l			;7519
	ld (hl),l		;751a
	ld d,a			;751b
	add a,d			;751c
	adc a,d			;751d
	jp z,0018eh		;751e
	ld b,l			;7521
	sbc a,a			;7522
	rla			;7523
	add a,d			;7524
	adc a,d			;7525
	ld hl,(0012eh)		;7526
	ld b,l			;7529
	ld d,a			;752a
	ld e,l			;752b
	add a,d			;752c
	adc a,d			;752d
	ld l,d			;752e
	cp d			;752f
	ld bc,03f45h		;7530
	push af			;7533
	add a,d			;7534
	adc a,d			;7535
	sbc a,a			;7536
	jp pe,04501h		;7537
	ld d,l			;753a
	ld d,l			;753b
	add a,d			;753c
	adc a,d			;753d
	jp pe,001aah		;753e
	ld b,l			;7541
	ld (hl),l		;7542
	ld d,l			;7543
	add a,d			;7544
	adc a,d			;7545
	jp pe,001aah		;7546
	ld b,l			;7549
	ld (hl),l		;754a
	ld d,l			;754b
	add a,d			;754c
	adc a,d			;754d
	jp pe,001aah		;754e
	ld b,l			;7551
	ld b,b			;7552
	ld d,l			;7553
	add a,d			;7554
	adc a,d			;7555
	add a,b			;7556
	jp pe,04501h		;7557
	ld d,l			;755a
	push de			;755b
	add a,d			;755c
	adc a,d			;755d
	xor d			;755e
	jp pe,L_5555		;755f
	ld d,l			;7562
	ld d,l			;7563
	nop			;7564
	nop			;7565
	nop			;7566
	ld (bc),a		;7567
	nop			;7568
	nop			;7569
	nop			;756a
	rlca			;756b
	nop			;756c
	nop			;756d
	nop			;756e
	ld c,000h		;756f
	nop			;7571
	nop			;7572
	rra			;7573
	nop			;7574
	nop			;7575
	nop			;7576
	ld a,055h		;7577
	ld d,l			;7579
	ld d,l			;757a
	ld a,a			;757b
	xor d			;757c
	xor d			;757d
	xor d			;757e
	cp (hl)			;757f
	rst 38h			;7580
	push af			;7581
	ld d,l			;7582
	ld a,a			;7583
	jr nz,L_7514		;7584
	xor d			;7586
	cp (hl)			;7587
	ld (hl),l		;7588
	rst 0			;7589
	ld d,l			;758a
	ld a,a			;758b
	xor d			;758c
	xor e			;758d
	xor d			;758e
	cp (hl)			;758f
	rst 38h			;7590
	rst 0			;7591
	push de			;7592
	ld a,a			;7593
	rst 38h			;7594
	ex de,hl		;7595
	xor d			;7596
	cp (hl)			;7597
	ld d,l			;7598
	ld b,a			;7599
	push de			;759a
	ld a,a			;759b
	xor d			;759c
	or e			;759d
	jp pe,L_55BE		;759e
	ld e,a			;75a1
	push de			;75a2
	ld a,a			;75a3
	xor d			;75a4
	or e			;75a5
	jp pe,L_55BE		;75a6
	ld e,c			;75a9
	push de			;75aa
	ld a,a			;75ab
	xor d			;75ac
	or e			;75ad
	jp pe,L_55BE		;75ae
	ld a,a			;75b1
	push de			;75b2
	ld a,a			;75b3
	xor d			;75b4
	and e			;75b5
	jp pe,L_55BE		;75b6
	ld (hl),l		;75b9
	push af			;75ba
	ld a,a			;75bb
	xor d			;75bc
	and d			;75bd
	jp pe,L_55BE		;75be
	ld (hl),l		;75c1
	push af			;75c2
	ld a,a			;75c3
	xor d			;75c4
	and d			;75c5
	jp pe,L_55BE		;75c6
	ld (hl),l		;75c9
	push af			;75ca
	ld a,a			;75cb
	xor d			;75cc
	and d			;75cd
	jp pe,L_55BE		;75ce
	ld (hl),l		;75d1
	push af			;75d2
	ld a,a			;75d3
	xor d			;75d4
	and d			;75d5
	jp pe,L_55BE		;75d6
	ld (hl),l		;75d9
	push af			;75da
	ld a,a			;75db
	xor d			;75dc
	and d			;75dd
	jp pe,001beh		;75de
	ld b,l			;75e1
	ld d,l			;75e2
	push de			;75e3
	add a,d			;75e4
	adc a,d			;75e5
	xor d			;75e6
	jp pe,04501h		;75e7
	ld d,l			;75ea
	push de			;75eb
	add a,d			;75ec
	adc a,(hl)		;75ed
	cp a			;75ee
	xor d			;75ef
	ld bc,07f5dh		;75f0
	ld d,l			;75f3
	add a,d			;75f4
	xor b			;75f5
	jp pe,001aah		;75f6
	ld d,c			;75f9
	push de			;75fa
	ld d,l			;75fb
	add a,d			;75fc
	xor b			;75fd
	ret pe			;75fe
	nop			;75ff
	ld bc,0d051h		;7600
	nop			;7603
	add a,d			;7604
	xor b			;7605
	jp po,001aah		;7606
	ld d,c			;7609
	push bc			;760a
	ld d,l			;760b
	add a,d			;760c
	xor b			;760d
	jp po,001aah		;760e
	ld d,c			;7611
	push bc			;7612
	inc sp			;7613
	add a,d			;7614
	xor b			;7615
	adc a,d			;7616
	xor d			;7617
	ld bc,05551h		;7618
	inc sp			;761b
	add a,d			;761c
	xor b			;761d
	xor d			;761e
	xor d			;761f
	ld bc,0f551h		;7620
	inc sp			;7623
	add a,d			;7624
	xor e			;7625
	jp po,001aah		;7626
	ld d,l			;7629
	ld b,l			;762a
	inc sp			;762b
	add a,d			;762c
	xor d			;762d
	and d			;762e
	xor d			;762f
	ld bc,04555h		;7630
	ld d,l			;7633
	add a,d			;7634
	xor d			;7635
	xor a			;7636
	rst 38h			;7637
	ld bc,05f55h		;7638
	rst 38h			;763b
	add a,d			;763c
	xor d			;763d
	xor d			;763e
	xor d			;763f
	ld bc,05555h		;7640
	ld d,l			;7643
	add a,d			;7644
	xor d			;7645
	xor d			;7646
	xor d			;7647
	inc bc			;7648
	rst 38h			;7649
	rst 38h			;764a
	rst 38h			;764b
	add a,a			;764c
	rst 38h			;764d
	rst 38h			;764e
	rst 38h			;764f
	rrca			;7650
	rst 38h			;7651
	rst 38h			;7652
	rst 38h			;7653
	sbc a,a			;7654
	rst 38h			;7655
	rst 38h			;7656
	rst 38h			;7657
	ccf			;7658
	rst 38h			;7659
	rst 38h			;765a
	rst 38h			;765b
	xor d			;765c
	xor d			;765d
	xor d			;765e
	xor d			;765f
	ld d,l			;7660
	ld (hl),l		;7661
	push af			;7662
	ld a,a			;7663
	xor d			;7664
	and d			;7665
	jp pe,L_55BE		;7666
	ld d,l			;7669
	push de			;766a
	ld a,a			;766b
	xor b			;766c
	rrca			;766d
	add a,d			;766e
	cp (hl)			;766f
	ld d,b			;7670
	nop			;7671
	rlca			;7672
	ld a,a			;7673
	and d			;7674
	xor d			;7675
	xor (hl)		;7676
	cp (hl)			;7677
	ld b,l			;7678
	ld d,l			;7679
	ld d,a			;767a
	ld a,a			;767b
	ld a,(bc)		;767c
	xor d			;767d
	xor (hl)		;767e
	cp (hl)			;767f
	inc de			;7680
	inc sp			;7681
	scf			;7682
	ld a,a			;7683
	xor d			;7684
	xor d			;7685
	xor (hl)		;7686
	cp (hl)			;7687
	ld d,e			;7688
	inc sp			;7689
	scf			;768a
	ld a,a			;768b
	xor d			;768c
	xor d			;768d
	xor (hl)		;768e
	cp (hl)			;768f
	inc sp			;7690
	inc sp			;7691
	scf			;7692
	ld a,a			;7693
	xor d			;7694
	xor d			;7695
	xor (hl)		;7696
	cp (hl)			;7697
	inc sp			;7698
	inc sp			;7699
	scf			;769a
	ld a,a			;769b
	xor d			;769c
	xor d			;769d
	xor (hl)		;769e
	cp (hl)			;769f
	inc sp			;76a0
	inc sp			;76a1
	scf			;76a2
	ld a,a			;76a3
	xor d			;76a4
	xor d			;76a5
	xor (hl)		;76a6
	cp (hl)			;76a7
	inc sp			;76a8
	inc sp			;76a9
	scf			;76aa
	ld a,a			;76ab
	xor d			;76ac
	xor d			;76ad
	xor (hl)		;76ae
	cp (hl)			;76af
	ld d,l			;76b0
	ld d,l			;76b1
	ld e,l			;76b2
	ld a,a			;76b3
	rst 38h			;76b4
	rst 38h			;76b5
	jp m,0ffbeh		;76b6
	rst 38h			;76b9
	push af			;76ba
	ld a,a			;76bb
	xor d			;76bc
	xor d			;76bd
	xor d			;76be
	cp (hl)			;76bf
	ld d,l			;76c0
	ld d,l			;76c1
	ld d,l			;76c2
	ld a,a			;76c3
	xor d			;76c4
	xor d			;76c5
	xor d			;76c6
	cp (hl)			;76c7
	rst 38h			;76c8
	rst 38h			;76c9
	rst 38h			;76ca
	rst 38h			;76cb
	rst 38h			;76cc
	rst 38h			;76cd
	rst 38h			;76ce
	cp 0ffh			;76cf
	rst 38h			;76d1
	rst 38h			;76d2
	rst 38h			;76d3
	rst 38h			;76d4
	rst 38h			;76d5
	rst 38h			;76d6
	cp 0ffh			;76d7
	rst 38h			;76d9
	rst 38h			;76da
	rst 38h			;76db
	xor d			;76dc
	xor d			;76dd
	xor d			;76de
	xor d			;76df
	ld d,l			;76e0
	ld d,l			;76e1
	ld d,l			;76e2
	ld d,l			;76e3
	add a,b			;76e4
	nop			;76e5
	nop			;76e6
	ld (bc),a		;76e7
	nop			;76e8
	nop			;76e9
	nop			;76ea
	dec b			;76eb
	adc a,d			;76ec
	xor d			;76ed
	xor d			;76ee
	xor (hl)		;76ef
	djnz L_76F2		;76f0
L_76F2:
	nop			;76f2
	dec e			;76f3
	add a,a			;76f4
	rst 38h			;76f5
	rst 38h			;76f6
	adc a,014h		;76f7
	nop			;76f9
	nop			;76fa
	ld e,l			;76fb
	add a,h			;76fc
	nop			;76fd
	and b			;76fe
L_76FF:
	ld c,(hl)		;76ff
	inc d			;7700
	ld a,(bc)		;7701
	nop			;7702
	ld e,l			;7703
	add a,h			;7704
	and b			;7705
	nop			;7706
	ld c,(hl)		;7707
	inc d			;7708
	nop			;7709
	and b			;770a
	ld e,l			;770b
	add a,h			;770c
	ld a,(bc)		;770d
	nop			;770e
	ld c,(hl)		;770f
	inc d			;7710
	and b			;7711
	nop			;7712
	ld e,l			;7713
	add a,h			;7714
	nop			;7715
	nop			;7716
	ld c,(hl)		;7717
	inc d			;7718
	nop			;7719
	nop			;771a
	ld e,l			;771b
	add a,h			;771c
	nop			;771d
	dec b			;771e
	ld c,(hl)		;771f
	inc d			;7720
	nop			;7721
	ld d,b			;7722
	ld e,l			;7723
	add a,h			;7724
	dec b			;7725
	nop			;7726
	ld c,(hl)		;7727
	inc d			;7728
	ld d,b			;7729
	dec b			;772a
	ld e,l			;772b
	add a,h			;772c
	nop			;772d
	ld d,b			;772e
	ld c,(hl)		;772f
	inc d			;7730
	dec b			;7731
	nop			;7732
	ld e,l			;7733
	add a,h			;7734
	ld d,b			;7735
	nop			;7736
	ld c,(hl)		;7737
	inc d			;7738
	nop			;7739
	nop			;773a
	ld e,l			;773b
	add a,h			;773c
	nop			;773d
	nop			;773e
	ld c,(hl)		;773f
	inc d			;7740
	nop			;7741
	nop			;7742
	ld e,l			;7743
	add a,h			;7744
	nop			;7745
	nop			;7746
	ld c,(hl)		;7747
	rla			;7748
	rst 38h			;7749
	rst 38h			;774a
	defb 0ddh,080h,000h ;illegal sequence	;774b
	nop			;774e
	ld c,015h		;774f
	ld d,l			;7751
	ld d,l			;7752
	ld e,l			;7753
	cp a			;7754
	rst 38h			;7755
	rst 38h			;7756
	cp 07fh			;7757
	rst 38h			;7759
	rst 38h			;775a
	defb 0fdh,0aah,0aah ;illegal sequence	;775b
	xor d			;775e
	xor d			;775f
	ld d,l			;7760
	ld d,l			;7761
	ld d,l			;7762
	ld d,l			;7763
	add a,b			;7764
	nop			;7765
	nop			;7766
	ld (bc),a		;7767
	nop			;7768
	nop			;7769
	nop			;776a
	dec b			;776b
	add a,b			;776c
	nop			;776d
	nop			;776e
	ld c,005h		;776f
	ld d,l			;7771
	ld d,l			;7772
	ld e,l			;7773
	adc a,a			;7774
	jp m,L_BEFF		;7775
	rlca			;7778
	pop af			;7779
	ld a,a			;777a
	dec e			;777b
	adc a,(hl)		;777c
	and d			;777d
	jp pe,0073eh		;777e
	ld d,c			;7781
	ld (hl),l		;7782
	dec e			;7783
	adc a,(hl)		;7784
	and d			;7785
	jp pe,0073eh		;7786
	ld d,c			;7789
	ld (hl),l		;778a
	dec e			;778b
	adc a,(hl)		;778c
	and d			;778d
	jp pe,0043eh		;778e
	ld bc,01d40h		;7791
	adc a,b			;7794
	ld (bc),a		;7795
	add a,b			;7796
	ld a,005h		;7797
	ld d,l			;7799
	ld d,l			;779a
	ld e,l			;779b
	adc a,d			;779c
	xor d			;779d
	xor d			;779e
	cp (hl)			;779f
	dec b			;77a0
	ld d,l			;77a1
	ld d,l			;77a2
	ld e,l			;77a3
	adc a,a			;77a4
	jp m,L_BEFF		;77a5
	rlca			;77a8
	pop af			;77a9
	ld a,a			;77aa
	dec e			;77ab
	adc a,(hl)		;77ac
	and d			;77ad
	jp pe,0073eh		;77ae
	ld d,c			;77b1
	ld (hl),l		;77b2
	dec e			;77b3
	adc a,(hl)		;77b4
	and d			;77b5
	jp pe,0073eh		;77b6
	ld d,c			;77b9
	ld (hl),l		;77ba
	dec e			;77bb
	adc a,(hl)		;77bc
	and d			;77bd
	jp pe,0043eh		;77be
	ld bc,01d40h		;77c1
	adc a,b			;77c4
	ld (bc),a		;77c5
	add a,b			;77c6
	ld a,005h		;77c7
	ld d,l			;77c9
	ld d,l			;77ca
	ld e,l			;77cb
	adc a,d			;77cc
	xor d			;77cd
	xor d			;77ce
	cp (hl)			;77cf
	rra			;77d0
	rst 38h			;77d1
	rst 38h			;77d2
	defb 0fdh,0bfh,0ffh ;illegal sequence	;77d3
	rst 38h			;77d6
	cp 07fh			;77d7
	rst 38h			;77d9
	rst 38h			;77da
	defb 0fdh,0aah,0aah ;illegal sequence	;77db
	xor d			;77de
	xor d			;77df
	nop			;77e0
	ret nz			;77e1
	ld e,l			;77e2
	nop			;77e3
	nop			;77e4
	and d			;77e5
	cp a			;77e6
	nop			;77e7
	nop			;77e8
	ret nz			;77e9
	ld e,l			;77ea
	nop			;77eb
	nop			;77ec
	and d			;77ed
	cp a			;77ee
	nop			;77ef
	nop			;77f0
	ret nz			;77f1
	ld e,l			;77f2
	nop			;77f3
	nop			;77f4
	and d			;77f5
	cp a			;77f6
	nop			;77f7
	nop			;77f8
	ret nz			;77f9
	ld e,l			;77fa
	nop			;77fb
	nop			;77fc
	and d			;77fd
	cp a			;77fe
	nop			;77ff
	nop			;7800
	ret nz			;7801
	ld e,l			;7802
	nop			;7803
	nop			;7804
	and d			;7805
	cp a			;7806
	nop			;7807
	nop			;7808
	ret nz			;7809
	ld e,l			;780a
	nop			;780b
	nop			;780c
	and d			;780d
	cp a			;780e
	nop			;780f
	nop			;7810
	ret nz			;7811
	ld e,l			;7812
	nop			;7813
	nop			;7814
	and d			;7815
	cp a			;7816
	nop			;7817
	nop			;7818
	ret nz			;7819
	ld e,l			;781a
	nop			;781b
	nop			;781c
	and d			;781d
	cp a			;781e
	nop			;781f
	nop			;7820
	ret nz			;7821
	ld e,l			;7822
	nop			;7823
	nop			;7824
	and d			;7825
	cp a			;7826
	nop			;7827
	nop			;7828
	ret nz			;7829
	ld e,l			;782a
	nop			;782b
	nop			;782c
	and d			;782d
	cp a			;782e
	nop			;782f
	nop			;7830
	ret nz			;7831
	ld e,l			;7832
	nop			;7833
	nop			;7834
	and d			;7835
	cp a			;7836
	nop			;7837
	nop			;7838
	ret nz			;7839
	ld e,l			;783a
	nop			;783b
	nop			;783c
	and d			;783d
	cp a			;783e
	nop			;783f
	nop			;7840
	ret nz			;7841
	ld e,l			;7842
	nop			;7843
	nop			;7844
	and d			;7845
	cp a			;7846
	nop			;7847
	nop			;7848
	ret nz			;7849
	ld e,l			;784a
	nop			;784b
	nop			;784c
	and d			;784d
	cp a			;784e
	nop			;784f
	nop			;7850
	ret nz			;7851
	ld e,l			;7852
	nop			;7853
	nop			;7854
	and d			;7855
	cp a			;7856
	nop			;7857
	nop			;7858
	ret nz			;7859
	ld e,l			;785a
	nop			;785b
	nop			;785c
	and d			;785d
	cp a			;785e
	nop			;785f
	nop			;7860
	rst 38h			;7861
	rst 38h			;7862
	nop			;7863
	nop			;7864
	ret nz			;7865
	rlca			;7866
	nop			;7867
	nop			;7868
	call nz,0000fh		;7869
	nop			;786c
	ret z			;786d
	dec de			;786e
	nop			;786f
	nop			;7870
	ret nc			;7871
	inc sp			;7872
	nop			;7873
	nop			;7874
	ret po			;7875
	ld h,e			;7876
	nop			;7877
	nop			;7878
	ret nz			;7879
	jp 00000h		;787a   ; BIOS CHKRAM - Tests RAM and sets RAM slot for the system  [alias: STARTUP, RESET, BOOT]

; ----------------------------------------------------------------------
; DATOS tiles: de los niveles: 111 de 32x32, 128 bytes cada uno
;   0x6de0..0xa560  (14208 bytes)
; ----------------------------------------------------------------------
	defb 0d5h,0abh,000h,000h,0ebh,057h,000h,000h,0c6h,003h,000h,000h,0cch,007h,000h,000h	; 787d  .....W..........
	defb 0d8h,00bh,000h,000h,0f0h,013h,000h,000h,0e0h,003h,000h,000h,0ffh,0ffh,000h,000h	; 788d  ................
	defb 0eah,0abh,000h,000h,0ffh,0ffh,000h,000h,0c0h,007h,000h,000h,0c4h,00fh,000h,000h	; 789d  ................
	defb 0c8h,01bh,000h,000h,0d0h,033h,000h,000h,0e0h,063h,000h,000h,0c0h,0c3h,000h,000h	; 78ad  .....3...c......
	defb 0d5h,0abh,000h,000h,0ebh,057h,000h,000h,0c6h,003h,000h,000h,0cch,007h,000h,000h	; 78bd  .....W..........
	defb 0d8h,00bh,000h,000h,0f0h,013h,000h,000h,0e0h,003h,000h,000h,0ffh,0ffh,000h,000h	; 78cd  ................
	defb 0eah,0abh,000h,000h,055h,055h,000h,001h,000h,000h,080h,000h,000h,000h,0c0h,004h	; 78dd  ....UU..........
	defb 000h,001h,0e0h,000h,03fh,0ffh,0f0h,010h,07fh,0fch,0f8h,000h,0d5h,054h,07ch,041h	; 78ed  ....?........T|A
	defb 0a6h,09ah,03eh,003h,055h,055h,01fh,086h,080h,002h,08fh,007h,000h,007h,04fh,086h	; 78fd  ..>.UU........O.
	defb 080h,006h,08fh,007h,00fh,0f7h,04fh,086h,088h,016h,08fh,007h,00ah,0d7h,04fh,086h	; 790d  ......O.......O.
	defb 08ah,016h,08fh,007h,008h,057h,04fh,086h,08bh,056h,08fh,007h,008h,017h,04fh,086h	; 791d  .....WO..V....O.
	defb 08fh,0f6h,08fh,007h,000h,007h,04fh,086h,0bfh,0feh,08fh,007h,07fh,0fdh,01fh,083h	; 792d  ......O.........
	defb 0aah,0aah,03fh,001h,0d9h,064h,07eh,020h,0eah,0a8h,0fch,000h,040h,001h,0f8h,008h	; 793d  ..?..d~ ....@...
	defb 000h,003h,0f0h,000h,03fh,0ffh,0e0h,002h,07fh,0ffh,0c0h,000h,07fh,0ffh,080h,000h	; 794d  ....?...........
	defb 0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 795d  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 796d  ................
	defb 000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0f1h,021h,0f1h,021h,058h	; 797d  ............!.!X
	defb 091h,058h,091h,0cdh,009h,0cdh,009h,046h,085h,046h,085h,0c3h,001h,0c3h,001h,041h	; 798d  .X.....F.F.....A
	defb 081h,041h,081h,0c0h,0c1h,0c0h,0c1h,041h,061h,041h,061h,0c0h,0b1h,0c0h,0b1h,051h	; 799d  .A.....AaAa....Q
	defb 019h,051h,019h,0c8h,08dh,0c8h,08dh,045h,007h,045h,007h,0ffh,0ffh,0ffh,0ffh,0ffh	; 79ad  .Q.....E.E......
	defb 0ffh,0ffh,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 79bd  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 79cd  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,001h,000h,000h,000h,003h,00ah	; 79dd  ................
	defb 0aah,0aah,0afh,01fh,0ffh,0ffh,0f7h,00fh,0f7h,0dfh,0efh,01dh,055h,055h,047h,08eh	; 79ed  ............UUG.
	defb 0a6h,09ah,08eh,01dh,055h,055h,047h,008h,004h,010h,00fh,01fh,0c0h,007h,0e7h,00eh	; 79fd  ....UUG.........
	defb 08ah,0aeh,08fh,01dh,010h,007h,047h,00eh,087h,0eeh,08fh,01dh,014h,027h,047h,008h	; 7a0d  ......G......'G.
	defb 005h,0ach,00fh,01fh,0d5h,0a7h,0e7h,00eh,085h,0aeh,08fh,01dh,015h,0a7h,047h,00eh	; 7a1d  ..............G.
	defb 084h,02eh,08fh,01dh,014h,027h,047h,008h,005h,0ach,00fh,01fh,0d5h,0a7h,0e7h,08eh	; 7a2d  .....'G.........
	defb 085h,0aeh,08eh,01dh,015h,0a7h,047h,00eh,084h,02eh,08fh,01ch,017h,0e4h,007h,008h	; 7a3d  ......G.........
	defb 000h,008h,00fh,015h,055h,055h,057h,01fh,0ffh,0ffh,0ffh,03fh,0ffh,0ffh,0ffh,07fh	; 7a4d  ....UUW....?....
	defb 0ffh,0ffh,0ffh,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 7a5d  ...UUUU....UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,000h,000h,000h,000h,000h	; 7a6d  ...UUUU.........
	defb 000h,000h,000h,055h,055h,055h,055h,0aah,0aah,0aah,0aah,000h,001h,000h,001h,080h	; 7a7d  ...UUUU.........
	defb 002h,080h,002h,015h,057h,015h,057h,08fh,0feh,08fh,0feh,01dh,047h,01dh,047h,08ah	; 7a8d  ....W.W.....G.G.
	defb 0aeh,08ah,0aeh,01dh,047h,01dh,047h,08ah,0aeh,08ah,0aeh,010h,007h,010h,007h,08ah	; 7a9d  ....G.G.........
	defb 0aeh,08ah,0aeh,01fh,0ffh,01fh,0ffh,0bfh,0feh,0bfh,0feh,055h,055h,055h,055h,0aah	; 7aad  ...........UUUU.
	defb 0aah,0aah,0aah,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,055h,055h,055h,055h,0aah	; 7abd  ...........UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah	; 7acd  ...UUUU....UUUU.
	defb 0aah,0aah,0aah,054h,055h,055h,0d5h,0a8h,0aah,0aah,0eah,054h,055h,055h,0d5h,0a8h	; 7add  ...TUU.....TUU..
	defb 0a0h,00ah,0eah,054h,045h,05dh,0d5h,0a8h,0afh,0eah,0eah,054h,045h,05dh,0d5h,0a8h	; 7aed  ...TE].....TE]..
	defb 0aeh,08ah,0eah,054h,045h,05dh,0d5h,0a8h,0aeh,08ah,0eah,054h,045h,05dh,0d5h,0a8h	; 7afd  ...TE].....TE]..
	defb 0aeh,08ah,0eah,054h,045h,05dh,0d5h,0a8h,0aeh,08ah,0eah,054h,045h,05dh,0d5h,0a8h	; 7b0d  ...TE].....TE]..
	defb 0aeh,08ah,0eah,054h,045h,05dh,0d5h,0a8h,0aeh,08ah,0eah,054h,045h,05dh,0d5h,0a8h	; 7b1d  ...TE].....TE]..
	defb 0aeh,08ah,0eah,054h,045h,05dh,0d5h,0a8h,0aeh,08ah,0eah,054h,045h,05dh,0d5h,0a8h	; 7b2d  ...TE].....TE]..
	defb 0aeh,08ah,0eah,054h,045h,05dh,0d5h,0a8h,0aeh,08ah,0eah,054h,044h,01dh,0d5h,0a8h	; 7b3d  ...TE].....TD...
	defb 0aah,0aah,0eah,054h,05fh,0fdh,0d5h,0a8h,0aah,0aah,0eah,054h,055h,055h,0d5h,0a8h	; 7b4d  ...T_......TUU..
	defb 0aah,0aah,0eah,055h,055h,055h,055h,0aah,0aah,02ah,0aah,055h,054h,015h,055h,0aah	; 7b5d  ...UUUU..*.UT.U.
	defb 0aah,02ah,0aah,055h,055h,055h,055h,0aah,0a0h,002h,0aah,055h,045h,051h,055h,0aah	; 7b6d  .*.UUUU....UEQU.
	defb 08ah,02bh,0aah,055h,015h,055h,0d5h,0aah,028h,00ah,0eah,054h,051h,05dh,055h,0a8h	; 7b7d  .+.U.U..(..TQ]U.
	defb 022h,02eh,0eah,054h,045h,05fh,075h,0a8h,08ah,02eh,0eah,050h,045h,057h,075h,0a8h	; 7b8d  "..TE_u....PEWu.
	defb 08ah,02eh,0fah,051h,014h,017h,075h,0a8h,08ah,02bh,0fah,051h,014h,017h,075h,0a0h	; 7b9d  ...Q..u..+.Q..u.
	defb 08ah,02bh,0bah,051h,014h,017h,07dh,0a0h,08ah,0abh,0bah,051h,01fh,0ffh,07dh,0a0h	; 7bad  .+.Q..}....Q..}.
	defb 0bfh,0ffh,0bah,051h,055h,055h,07dh,0a3h,0ffh,0ffh,0fah,057h,084h,010h,0fdh,0afh	; 7bbd  ...QUU}....W....
	defb 0ffh,0ffh,0fah,05fh,0f1h,0c7h,0fdh,0afh,0ffh,0ffh,0fah,055h,055h,055h,055h,0aah	; 7bcd  ..._.......UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0beh,0aah,0aah,0beh,049h,05dh,03dh,013h,0dch	; 7bdd  ...UUUU....I]=..
	defb 0b2h,08eh,03ah,076h,071h,04ch,06fh,0dbh,03ch,03ch,0dah,04dh,0c7h,0e3h,0b1h,0a6h	; 7bed  ..:vqLo.<<.M....
	defb 0f8h,01fh,062h,053h,0d5h,055h,0c5h,0abh,080h,002h,0cah,05dh,015h,057h,0bdh,0bdh	; 7bfd  ..bS.U.....].W..
	defb 0aah,0aah,0beh,065h,01fh,0f7h,0a5h,0a6h,0a8h,01ah,066h,052h,01ah,0d7h,051h,0aah	; 7c0d  ...e......fR..Q.
	defb 0abh,09ah,04ah,052h,019h,0d7h,055h,08ah,0abh,05ah,04ah,066h,018h,017h,065h,0a5h	; 7c1d  ..JR..U..ZJf..e.
	defb 0afh,0fah,0a6h,07dh,015h,057h,0bdh,0bdh,0aah,0aah,0bah,053h,07fh,0ffh,0d5h,0a3h	; 7c2d  ...}.W.....S....
	defb 0aah,0abh,0cah,046h,0f8h,01fh,065h,08dh,0c7h,0e3h,0b2h,05bh,03ch,03ch,0dbh,0f6h	; 7c3d  ...F..e....[<<..
	defb 032h,08eh,06eh,05ch,071h,04dh,03bh,0c8h,0bch,0bah,092h,07dh,055h,055h,07dh,0aah	; 7c4d  2.n\qM;....}UU}.
	defb 0aah,0aah,0aah,055h,075h,0f5h,07fh,0aah,0a2h,0eah,0bfh,055h,075h,0f5h,05fh,0aah	; 7c5d  ...Uu......Uu._.
	defb 0a2h,0eah,0afh,055h,075h,0f5h,057h,0aah,0a2h,0eah,0abh,055h,075h,0f5h,055h,0aah	; 7c6d  ...Uu.W....Uu.U.
	defb 0a2h,0eah,0aah,055h,075h,0f5h,055h,0aah,0a2h,0e8h,002h,055h,075h,0f0h,007h,0aah	; 7c7d  ...Uu.U....Uu...
	defb 0a2h,0e8h,0aeh,055h,075h,0f1h,057h,0aah,0a2h,0e8h,0aeh,055h,075h,0f1h,057h,0aah	; 7c8d  ...Uu.W....Uu.W.
	defb 0a2h,0e8h,0aeh,055h,075h,0f1h,057h,0aah,0a2h,0e8h,0aeh,055h,075h,0f1h,057h,0aah	; 7c9d  ...Uu.W....Uu.W.
	defb 0a2h,0e8h,0aeh,055h,075h,0f1h,057h,0aah,0a2h,0ebh,0feh,055h,075h,0f7h,0ffh,0aah	; 7cad  ...Uu.W....Uu...
	defb 0a2h,0eah,0aah,055h,075h,0f5h,055h,0aah,0a2h,0eah,0aah,055h,075h,0f5h,055h,0aah	; 7cbd  ...Uu.U....Uu.U.
	defb 0a2h,0eah,0abh,055h,075h,0f5h,057h,0aah,0a2h,0eah,0afh,055h,075h,0f5h,05fh,0aah	; 7ccd  ...Uu.W....Uu._.
	defb 0a2h,0eah,0bfh,055h,055h,055h,055h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 7cdd  ...UUUU.........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,055h,055h,055h,055h,0aah	; 7ced  ...........UUUU.
	defb 0aah,0aah,0aah,055h,055h,055h,055h,0a0h,00ah,0a0h,00ah,047h,0c5h,047h,0c5h,098h	; 7cfd  ...UUUU....G.G..
	defb 032h,098h,032h,020h,019h,020h,019h,022h,0b8h,022h,0b8h,045h,05dh,045h,05dh,04ah	; 7d0d  2.2 . .".".E]E]J
	defb 0ach,04ah,0ach,045h,05dh,045h,05dh,04ah,0ach,04ah,0ach,045h,05dh,045h,05dh,02ah	; 7d1d  .J.E]E]J.J.E]E]*
	defb 0b8h,02ah,0b8h,03dh,079h,03dh,079h,09fh,0f2h,09fh,0f2h,047h,0c5h,047h,0c5h,0a0h	; 7d2d  .*.=y=y....G.G..
	defb 00ah,0a0h,00ah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,0ffh,0ffh,0ffh,0ffh,0ffh	; 7d3d  ...UUUU.........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 7d4d  ........

; ======================================================================
; CODIGO 0x7d55..0x8234  (1247 bytes)
; ======================================================================


L_7D55:
	rst 38h			;7d55
	rst 38h			;7d56
	rst 38h			;7d57
	rst 38h			;7d58
	rst 38h			;7d59
	rst 38h			;7d5a
	rst 38h			;7d5b
	xor d			;7d5c
	xor d			;7d5d
	xor d			;7d5e
	xor d			;7d5f
	ld d,l			;7d60
	ld d,l			;7d61
	ld b,b			;7d62
	nop			;7d63
	nop			;7d64
	nop			;7d65
	jr z,L_7D68		;7d66
L_7D68:
	nop			;7d68
	nop			;7d69
	inc b			;7d6a
	nop			;7d6b
	nop			;7d6c
	nop			;7d6d
	ld (bc),a		;7d6e
	add a,b			;7d6f
	nop			;7d70
	nop			;7d71
	nop			;7d72
	ld b,b			;7d73
	nop			;7d74
	nop			;7d75
	nop			;7d76
	jr z,L_7DCE		;7d77
	ld d,l			;7d79
	ld b,b			;7d7a
	inc b			;7d7b
	xor d			;7d7c
	xor d			;7d7d
	and b			;7d7e
	ld (bc),a		;7d7f
	ld d,l			;7d80
	ld d,l			;7d81
	ld d,h			;7d82
	ld bc,00aa0h		;7d83
	xor d			;7d86
	ld (bc),a		;7d87
	ld b,a			;7d88
	push bc			;7d89
	ld d,l			;7d8a
	ld b,a			;7d8b
	sbc a,b			;7d8c
	ld (0aeaah),a		;7d8d
	jr nz,L_7DAB		;7d90
	ld d,l			;7d92
	ld e,a			;7d93
	ld (0aab8h),hl		;7d94
	cp (hl)			;7d97
	ld b,l			;7d98
	ld e,l			;7d99
	nop			;7d9a
	ld e,a			;7d9b
	ld c,d			;7d9c
	xor h			;7d9d
	xor d			;7d9e
	cp 045h			;7d9f
	ld e,l			;7da1
	dec d			;7da2
	ld e,a			;7da3
	ld c,d			;7da4
	xor h			;7da5
	xor d			;7da6
	cp 045h			;7da7
	ld e,l			;7da9
	ld a,a			;7daa
L_7DAB:
	rst 18h			;7dab
	ld hl,(0aab8h)		;7dac
	cp (hl)			;7daf
	dec a			;7db0
	ld a,c			;7db1
	ld d,l			;7db2
	ld e,a			;7db3
	sbc a,a			;7db4
	jp p,L_BEAA		;7db5
	ld b,a			;7db8
	push bc			;7db9
	ld d,l			;7dba
	rst 38h			;7dbb
	and b			;7dbc
	ld a,(bc)		;7dbd
	xor e			;7dbe
	cp 055h			;7dbf
	ld d,l			;7dc1
	ld e,a			;7dc2
	call m,0aaaah		;7dc3
	cp a			;7dc6
	ret p			;7dc7
	rst 38h			;7dc8
	rst 38h			;7dc9
	rst 38h			;7dca
	ret nz			;7dcb
	rst 38h			;7dcc
	rst 38h			;7dcd
L_7DCE:
	rst 38h			;7dce
	nop			;7dcf
	rst 38h			;7dd0
	rst 38h			;7dd1
	call m,0ff00h		;7dd2
	rst 38h			;7dd5
	ret p			;7dd6
	nop			;7dd7
	rst 38h			;7dd8
	rst 38h			;7dd9
	ret nz			;7dda
	nop			;7ddb
	xor d			;7ddc
	xor d			;7ddd
	add a,b			;7dde
	nop			;7ddf
	nop			;7de0
	dec b			;7de1
	ld d,l			;7de2
	ld d,l			;7de3
	nop			;7de4
	ex af,af'		;7de5
	nop			;7de6
	nop			;7de7
	nop			;7de8
	ld d,b			;7de9
	nop			;7dea
	nop			;7deb
	nop			;7dec
	add a,b			;7ded
	nop			;7dee
	nop			;7def
	dec b			;7df0
	nop			;7df1
	nop			;7df2
	nop			;7df3
	ex af,af'		;7df4
	nop			;7df5
	nop			;7df6
	nop			;7df7
	ld d,b			;7df8
	ld bc,05555h		;7df9
	add a,b			;7dfc
	ld a,(bc)		;7dfd
	xor d			;7dfe
	xor d			;7dff
	nop			;7e00
	dec d			;7e01
	ld d,l			;7e02
	ld d,l			;7e03
	add a,b			;7e04
	xor d			;7e05
	and b			;7e06
	ld a,(bc)		;7e07
	ld bc,04755h		;7e08
	push bc			;7e0b
	add a,d			;7e0c
	xor d			;7e0d
	sbc a,b			;7e0e
	ld (05501h),a		;7e0f
	jr nz,L_7E2D		;7e12
	add a,d			;7e14
	xor d			;7e15
	ld (000b8h),hl		;7e16
	ld bc,05d45h		;7e19
	add a,d			;7e1c
	xor d			;7e1d
	ld c,d			;7e1e
	xor h			;7e1f
	nop			;7e20
	ld d,a			;7e21
	ld b,l			;7e22
	ld e,l			;7e23
	add a,d			;7e24
	xor d			;7e25
	ld c,d			;7e26
	xor h			;7e27
	ld bc,045ffh		;7e28
	ld e,l			;7e2b
	add a,d			;7e2c
L_7E2D:
	xor d			;7e2d
	ld hl,(001b8h)		;7e2e
	ld d,l			;7e31
	dec a			;7e32
	ld a,c			;7e33
	adc a,(hl)		;7e34
	xor d			;7e35
	sbc a,a			;7e36
	jp p,L_553F		;7e37
	ld b,a			;7e3a
	push bc			;7e3b
	rst 38h			;7e3c
	jp pe,00aa0h		;7e3d
	ccf			;7e40
	push af			;7e41
	ld d,l			;7e42
	ld d,l			;7e43
	rrca			;7e44
	cp 0aah			;7e45
	xor d			;7e47
	inc bc			;7e48
	rst 38h			;7e49
	rst 38h			;7e4a
	rst 38h			;7e4b
	nop			;7e4c
	rst 38h			;7e4d
	rst 38h			;7e4e
	rst 38h			;7e4f
	nop			;7e50
	ccf			;7e51
	rst 38h			;7e52
	rst 38h			;7e53
	nop			;7e54
	rrca			;7e55
	rst 38h			;7e56
	rst 38h			;7e57
	nop			;7e58
	inc bc			;7e59
	rst 38h			;7e5a
	rst 38h			;7e5b
	nop			;7e5c
	nop			;7e5d
	xor d			;7e5e
	xor d			;7e5f
	ld bc,05545h		;7e60
	push de			;7e63
	ld (bc),a		;7e64
	adc a,d			;7e65
	xor d			;7e66
	jp pe,04405h		;7e67
	dec b			;7e6a
	push de			;7e6b
	ld a,(bc)		;7e6c
	adc a,b			;7e6d
	ld c,0eah		;7e6e
	dec d			;7e70
	ld b,h			;7e71
	ld e,l			;7e72
	push de			;7e73
	ld hl,(0ae88h)		;7e74
	jp pe,04455h		;7e77
	ld e,l			;7e7a
	push de			;7e7b
	xor d			;7e7c
	adc a,b			;7e7d
	xor (hl)		;7e7e
	jp pe,04455h		;7e7f
	ld e,l			;7e82
	push de			;7e83
	xor d			;7e84
	adc a,b			;7e85
	xor (hl)		;7e86
	jp pe,00440h		;7e87
	ld e,l			;7e8a
	push de			;7e8b
	add a,b			;7e8c
	ex af,af'		;7e8d
	cp 0eah			;7e8e
	ld b,l			;7e90
	ld d,l			;7e91
	defb 0fdh,0d5h,08ah ;illegal sequence	;7e92
	xor d			;7e95
	xor d			;7e96
	jp pe,L_5545		;7e97
	ld d,l			;7e9a
	push de			;7e9b
	adc a,d			;7e9c
	xor d			;7e9d
	xor d			;7e9e
	jp pe,L_5545		;7e9f
	ld d,l			;7ea2
	push de			;7ea3
	adc a,d			;7ea4
	xor d			;7ea5
	xor d			;7ea6
	jp pe,05445h		;7ea7
	dec b			;7eaa
	push de			;7eab
	adc a,d			;7eac
	xor b			;7ead
	ld c,0eah		;7eae
	ld e,a			;7eb0
	call p,L_D55D		;7eb1
	cp a			;7eb4
	ret pe			;7eb5
	xor (hl)		;7eb6
	jp pe,04455h		;7eb7
	ld e,l			;7eba
	push de			;7ebb
	xor d			;7ebc
	adc a,b			;7ebd
	xor (hl)		;7ebe
	jp pe,04455h		;7ebf
	ld e,l			;7ec2
	push de			;7ec3
	xor d			;7ec4
	adc a,b			;7ec5
	xor (hl)		;7ec6
	jp pe,04455h		;7ec7
	ld e,l			;7eca
	push de			;7ecb
	ld hl,(0fe88h)		;7ecc
	jp pe,04515h		;7ecf
	defb 0fdh,0d5h,00ah ;illegal sequence	;7ed2
	adc a,d			;7ed5
	xor d			;7ed6
	jp pe,04505h		;7ed7
	ld d,l			;7eda
	push de			;7edb
	add a,d			;7edc
	adc a,d			;7edd
	xor d			;7ede
	jp pe,00000h		;7edf   ; BIOS CHKRAM - Tests RAM and sets RAM slot for the system  [alias: STARTUP, RESET, BOOT]
	nop			;7ee2
	rlca			;7ee3
	nop			;7ee4
	nop			;7ee5
	nop			;7ee6
	ccf			;7ee7
	nop			;7ee8
	nop			;7ee9
	nop			;7eea
	ld a,b			;7eeb
	nop			;7eec
	nop			;7eed
	nop			;7eee
	ret nz			;7eef
	nop			;7ef0
	nop			;7ef1
	ld bc,0008fh		;7ef2
	nop			;7ef5
	ld bc,000b9h		;7ef6
	rra			;7ef9
	add a,b			;7efa
	rst 20h			;7efb
	nop			;7efc
	inc hl			;7efd
	ld (hl),c		;7efe
	sbc a,l			;7eff
L_7F00:
	nop			;7f00
	dec a			;7f01
	adc a,l			;7f02
	push af			;7f03
	nop			;7f04
L_7F05:
	ld a,0c2h		;7f05
	push bc			;7f07
	nop			;7f08
	ccf			;7f09
	ld h,c			;7f0a
	ld (hl),l		;7f0b
	nop			;7f0c
	ccf			;7f0d
	or b			;7f0e
	or l			;7f0f
	nop			;7f10
	dec e			;7f11
	ld e,b			;7f12
	ld d,c			;7f13
	nop			;7f14
	ld a,(de)		;7f15
	xor c			;7f16
	ld l,l			;7f17
	nop			;7f18
	rra			;7f19
	ld d,(hl)		;7f1a
	or l			;7f1b
	nop			;7f1c
	ld a,(bc)		;7f1d
	and e			;7f1e
	ld d,a			;7f1f
	nop			;7f20
	dec c			;7f21
	add hl,bc		;7f22
	cp e			;7f23
	nop			;7f24
	ld b,094h		;7f25
	in a,(000h)		;7f27
	inc b			;7f29
	ld l,0bbh		;7f2a
	nop			;7f2c
	ld (bc),a		;7f2d
	ld e,b			;7f2e
	ld a,e			;7f2f
	nop			;7f30
	ld (bc),a		;7f31
	or d			;7f32
	ld a,l			;7f33
	nop			;7f34
	ld bc,03de0h		;7f35
	nop			;7f38
	ld bc,03dcah		;7f39
	nop			;7f3c
	inc bc			;7f3d
	ld b,b			;7f3e
	dec a			;7f3f
	nop			;7f40
	ld b,020h		;7f41
	dec e			;7f43
	nop			;7f44
	inc c			;7f45
	djnz L_7F65		;7f46
	nop			;7f48
	djnz L_7F53		;7f49
	dec e			;7f4b
	nop			;7f4c
	jr nz,L_7F53		;7f4d
	inc c			;7f4f
	nop			;7f50
	nop			;7f51
	ld (bc),a		;7f52
L_7F53:
	jr L_7F55		;7f53
L_7F55:
	nop			;7f55
	ld bc,000a8h		;7f56
	nop			;7f59
	nop			;7f5a
	ld (hl),b		;7f5b
	nop			;7f5c
	nop			;7f5d
	nop			;7f5e
	nop			;7f5f
	rst 38h			;7f60
	rst 38h			;7f61
	rst 38h			;7f62
	rst 38h			;7f63
	rst 38h			;7f64
L_7F65:
	rst 38h			;7f65
L_7F66:
	rst 38h			;7f66
	rst 38h			;7f67
	ld d,h			;7f68
	dec c			;7f69
	ld (hl),b		;7f6a
	nop			;7f6b
	ld l,h			;7f6c
	ex af,af'		;7f6d
	ret p			;7f6e
	nop			;7f6f
	ld d,h			;7f70
	dec c			;7f71
	ld (hl),b		;7f72
	nop			;7f73
	ld l,h			;7f74
L_7F75:
	ex af,af'		;7f75
	ret p			;7f76
	nop			;7f77
	ld d,h			;7f78
	ld a,a			;7f79
	cp 000h			;7f7a
	jr z,L_7FFD		;7f7c
	cp 042h			;7f7e
	jr c,L_7F8F		;7f80
	ld (hl),b		;7f82
	ld l,h			;7f83
	djnz L_7FC5		;7f84
	rst 38h			;7f86
	ld a,b			;7f87
	djnz L_7FF9		;7f88
	push af			;7f8a
	ret m			;7f8b
	jr c,L_7F66		;7f8c
	ld a,(de)		;7f8e
L_7F8F:
	call m,L_B211		;7f8f
	xor l			;7f92
L_7F93:
	ld l,(hl)		;7f93
	inc bc			;7f94
	ld h,c			;7f95
	ld d,(hl)		;7f96
	or b			;7f97
	ld b,0cah		;7f98
	sbc a,e			;7f9a
	ld d,b			;7f9b
	dec b			;7f9c
	sub l			;7f9d
	add hl,sp		;7f9e
	or b			;7f9f
	ld b,0a2h		;7fa0
	and l			;7fa2
	ld d,b			;7fa3
	dec b			;7fa4
	sub b			;7fa5
	dec e			;7fa6
	or b			;7fa7
	ld b,0aah		;7fa8
	ld a,l			;7faa
	ld d,b			;7fab
	dec b			;7fac
	sub b			;7fad
	dec e			;7fae
	or b			;7faf
	ld b,0a2h		;7fb0
	and l			;7fb2
	ld h,b			;7fb3
	dec b			;7fb4
	push de			;7fb5
	cp e			;7fb6
	ret po			;7fb7
	ld b,0e9h		;7fb8
	rst 10h			;7fba
	ld b,b			;7fbb
	rlca			;7fbc
	ld (hl),e		;7fbd
	adc a,0c0h		;7fbe
	ld (bc),a		;7fc0
	cp b			;7fc1
	dec e			;7fc2
	ld b,b			;7fc3
	inc bc			;7fc4
L_7FC5:
	rst 38h			;7fc5
	rst 38h			;7fc6
	ret nz			;7fc7
	nop			;7fc8
	add a,c			;7fc9
	ld d,l			;7fca
	nop			;7fcb
	nop			;7fcc
	ld l,d			;7fcd
	cp (hl)			;7fce
	nop			;7fcf
	nop			;7fd0
	rra			;7fd1
	ret m			;7fd2
	nop			;7fd3
	nop			;7fd4
	nop			;7fd5
	nop			;7fd6
	nop			;7fd7
	nop			;7fd8
	nop			;7fd9
	nop			;7fda
	nop			;7fdb
	nop			;7fdc
	nop			;7fdd
	nop			;7fde
	nop			;7fdf
	ld d,l			;7fe0
	ld (hl),l		;7fe1
	push af			;7fe2
	ld a,a			;7fe3
	xor d			;7fe4
	and d			;7fe5
	jp pe,L_55BF		;7fe6
	ld (hl),l		;7fe9
	push af			;7fea
	ld e,a			;7feb
	xor d			;7fec
	and d			;7fed
	jp pe,L_55AF		;7fee
	ld (hl),l		;7ff1
	push af			;7ff2
	ld d,a			;7ff3
	xor d			;7ff4
	and d			;7ff5
	jp pe,L_55AB		;7ff6
L_7FF9:
	ld (hl),l		;7ff9
	push af			;7ffa
	ld d,l			;7ffb
	xor d			;7ffc
L_7FFD:
	and d			;7ffd
	jp pe,057aah		;7ffe
	rst 38h			;8001
	rst 38h			;8002
	ld a,a			;8003
	xor (hl)		;8004
	ld a,(bc)		;8005
	cp a			;8006
L_8007:
	ret z			;8007
	ld d,l			;8008
	ld b,c			;8009
	ld e,a			;800a
	dec e			;800b
	xor (hl)		;800c
	ld a,(bc)		;800d
	cp a			;800e
	ld hl,(04155h)		;800f
	ld e,a			;8012
	ld e,a			;8013
	xor (hl)		;8014
	ld a,(bc)		;8015
	cp a			;8016
	cp a			;8017
	ld d,l			;8018
	ld b,c			;8019
	ld e,a			;801a
	push af			;801b
	xor (hl)		;801c
	ld a,(bc)		;801d
	cp a			;801e
	jp pe,0ff57h		;801f
	rst 38h			;8022
	ld d,l			;8023
	xor d			;8024
	xor d			;8025
	xor d			;8026
	xor d			;8027
	ld b,b			;8028
	dec d			;8029
	ld d,b			;802a
	dec b			;802b
	add a,b			;802c
	ld hl,(00ea8h)		;802d
	ld b,l			;8030
L_8031:
	ld (hl),l		;8031
	ld d,c			;8032
	ld e,l			;8033
	adc a,d			;8034
	jp pe,L_AEA8		;8035
	ld b,l			;8038
	ld (hl),l		;8039
	ld d,c			;803a
	ld e,l			;803b
	adc a,d			;803c
	jp pe,L_AEA8		;803d
	ld b,l			;8040
	ld b,b			;8041
	ld bc,08a5dh		;8042
	add a,b			;8045
	ld (bc),a		;8046
	xor (hl)		;8047
	ld b,l			;8048
	ld d,l			;8049
	ld d,l			;804a
	ld e,l			;804b
	adc a,d			;804c
	xor d			;804d
	xor d			;804e
	xor (hl)		;804f
L_8050:
	ld b,l			;8050
	ld d,l			;8051
	ld d,l			;8052
	ld e,l			;8053
	adc a,a			;8054
L_8055:
	rst 38h			;8055
	rst 38h			;8056
	cp 05fh			;8057
	rst 38h			;8059
	rst 38h			;805a
	defb 0fdh,0aah,0aah ;illegal sequence	;805b
	xor d			;805e
	xor d			;805f
	ld d,l			;8060
	ld d,l			;8061
	ld d,l			;8062
	ld d,l			;8063
	xor d			;8064
	xor d			;8065
	xor d			;8066
	xor d			;8067
	ld d,l			;8068
	ld d,l			;8069
	ld d,l			;806a
	ld d,l			;806b
	xor d			;806c
	xor d			;806d
	xor d			;806e
	xor d			;806f
	ld d,l			;8070
	ld d,l			;8071
	ld d,l			;8072
	ld d,l			;8073
	xor d			;8074
	xor d			;8075
	xor d			;8076
	xor d			;8077
	ld d,l			;8078
	ld d,l			;8079
	ld d,l			;807a
	ld d,l			;807b
	xor d			;807c
	xor d			;807d
	xor d			;807e
	add a,b			;807f
	ld d,a			;8080
	rst 38h			;8081
	rst 38h			;8082
	ld b,b			;8083
	xor (hl)		;8084
	ld a,(bc)		;8085
	cp a			;8086
	adc a,d			;8087
	ld d,l			;8088
	ld b,c			;8089
	ld e,a			;808a
	ld b,l			;808b
	xor (hl)		;808c
	ld a,(bc)		;808d
	cp a			;808e
	adc a,d			;808f
	ld d,l			;8090
	ld b,c			;8091
	ld e,a			;8092
	ld b,e			;8093
	xor (hl)		;8094
	ld a,(bc)		;8095
	cp a			;8096
	adc a,d			;8097
	ld d,l			;8098
	ld b,c			;8099
	ld e,a			;809a
	ld b,e			;809b
	xor (hl)		;809c
	ld a,(bc)		;809d
	cp a			;809e
	adc a,d			;809f
	ld d,a			;80a0
	rst 38h			;80a1
	rst 38h			;80a2
	ld b,e			;80a3
	xor d			;80a4
	and d			;80a5
	jp pe,L_558A		;80a6
	ld (hl),l		;80a9
	push af			;80aa
	ld b,e			;80ab
	xor d			;80ac
	and d			;80ad
	jp pe,L_558A		;80ae
	ld (hl),l		;80b1
	push af			;80b2
	ld b,l			;80b3
	xor d			;80b4
	and d			;80b5
	jp pe,L_558F		;80b6
	ld (hl),l		;80b9
	push af			;80ba
	ld e,a			;80bb
	xor d			;80bc
	and d			;80bd
	jp pe,L_55AA		;80be
	ld (hl),l		;80c1
	push af			;80c2
	ld d,l			;80c3
	xor d			;80c4
	and d			;80c5
	jp pe,L_55AA		;80c6
	ld (hl),l		;80c9
	push af			;80ca
L_80CB:
	ld d,l			;80cb
	xor d			;80cc
	and d			;80cd
	jp pe,L_55AB		;80ce
	ld (hl),l		;80d1
	push af			;80d2
	ld d,a			;80d3
	xor d			;80d4
	and d			;80d5
	jp pe,L_55AF		;80d6
	ld (hl),l		;80d9
	push af			;80da
	ld e,a			;80db
	xor d			;80dc
	and d			;80dd
	jp pe,L_55BF		;80de
	ld d,l			;80e1
	ld d,l			;80e2
	ld d,l			;80e3
	xor d			;80e4
	xor d			;80e5
	xor d			;80e6
	xor d			;80e7
	ld d,l			;80e8
	ld d,l			;80e9
	ld d,l			;80ea
	ld d,l			;80eb
	xor d			;80ec
	xor d			;80ed
	xor d			;80ee
	xor d			;80ef
	ld d,l			;80f0
	ld d,l			;80f1
	ld d,l			;80f2
	dec (hl)		;80f3
	xor d			;80f4
	xor d			;80f5
	xor d			;80f6
	ld a,(05555h)		;80f7
	ld d,h			;80fa
	ld e,l			;80fb
	nop			;80fc
	nop			;80fd
L_80FE:
	xor b			;80fe
	xor (hl)		;80ff
	nop			;8100
	ld bc,057d1h		;8101
	xor d			;8104
	xor d			;8105
	ret pe			;8106
	xor (hl)		;8107
	ld d,l			;8108
	ld d,l			;8109
	ld (hl),h		;810a
	ld e,l			;810b
	xor d			;810c
	cp (hl)			;810d
	cp d			;810e
	ld a,(07c33h)		;810f
	ld e,l			;8112
	dec (hl)		;8113
	xor d			;8114
	jp pe,L_AA2E		;8115
	inc sp			;8118
	ld (hl),l		;8119
	rla			;811a
	ld d,l			;811b
	xor d			;811c
	jp pe,0aa8bh		;811d
	inc sp			;8120
	ld (hl),l		;8121
	ld b,l			;8122
	push de			;8123
	xor d			;8124
	jp pe,L_EAA2		;8125
	inc sp			;8128
	ld (hl),l		;8129
	ld d,c			;812a
	push de			;812b
	xor d			;812c
	cp d			;812d
	and d			;812e
	jp pe,05d55h		;812f
	ld d,c			;8132
	push de			;8133
	rst 38h			;8134
	xor (hl)		;8135
	and d			;8136
	jp pe,017ffh		;8137
L_813A:
	ld d,c			;813a
	push de			;813b
L_813C:
	xor d			;813c
	adc a,e			;813d
	and d			;813e
	jp pe,04755h		;813f
	ld d,c			;8142
	push de			;8143
	xor d			;8144
	adc a,e			;8145
	and d			;8146
	jp pe,04755h		;8147
	ld d,c			;814a
	push de			;814b
	ld hl,(0a28bh)		;814c
	jp pe,04715h		;814f
	ld bc,00ad5h		;8152
	adc a,d			;8155
	ld (bc),a		;8156
	jp pe,04505h		;8157
	ld d,l			;815a
	push de			;815b
	add a,d			;815c
	adc a,d			;815d
	xor d			;815e
	jp pe,04501h		;815f
	ld d,l			;8162
	push de			;8163
	ld (bc),a		;8164
	adc a,d			;8165
	xor d			;8166
	jp pe,04505h		;8167
	ld d,l			;816a
	push de			;816b
	ld a,(bc)		;816c
	adc a,a			;816d
	rst 38h			;816e
	jp pe,05f15h		;816f
	rst 38h			;8172
	push de			;8173
	ld hl,(0aaaah)		;8174
	xor d			;8177
	ld d,l			;8178
	ld d,l			;8179
	ld d,l			;817a
	ld d,l			;817b
	xor d			;817c
	xor d			;817d
	xor d			;817e
	xor d			;817f
	rst 38h			;8180
	rst 38h			;8181
	push af			;8182
	ld d,l			;8183
	jr nz,L_81A6		;8184
	adc a,(hl)		;8186
	xor d			;8187
	ld (hl),l		;8188
	ld (hl),l		;8189
	rst 0			;818a
	ld d,l			;818b
	xor d			;818c
	xor d			;818d
	xor e			;818e
	xor d			;818f
	rst 38h			;8190
	rst 38h			;8191
	rst 0			;8192
	push de			;8193
	rst 38h			;8194
	rst 38h			;8195
	ex de,hl		;8196
	xor d			;8197
	ld d,l			;8198
	ld d,l			;8199
	ld h,l			;819a
	push de			;819b
	xor d			;819c
	xor d			;819d
	or e			;819e
	xor d			;819f
	ld d,l			;81a0
	ld d,l			;81a1
	ld d,l			;81a2
	push de			;81a3
	xor d			;81a4
	xor d			;81a5
L_81A6:
	and e			;81a6
	xor d			;81a7
	ld d,a			;81a8
L_81A9:
	rst 38h			;81a9
	push bc			;81aa
	push de			;81ab
	xor h			;81ac
	jr nz,L_813A		;81ad
	xor d			;81af
	ld e,l			;81b0
	ld (hl),l		;81b1
	rst 10h			;81b2
	ld d,l			;81b3
	xor (hl)		;81b4
	xor d			;81b5
	xor (hl)		;81b6
	xor d			;81b7
	ld d,a			;81b8
L_81B9:
	rst 38h			;81b9
	defb 0fdh,055h ;ld d,iyl	;81ba
	xor e			;81bc
	rst 38h			;81bd
	jp m,L_55AA		;81be
	ld d,l			;81c1
	ld d,l			;81c2
	ld d,l			;81c3
	and b			;81c4
	xor b			;81c5
	ld hl,(0410ah)		;81c6
	ret nc			;81c9
	ld (hl),h		;81ca
	dec e			;81cb
	and e			;81cc
	xor b			;81cd
	jp pe,0453ah		;81ce
	pop de			;81d1
	ld (hl),h		;81d2
	ld e,l			;81d3
	xor a			;81d4
	xor e			;81d5
L_81D6:
	jp pe,05ffah		;81d6
	rst 10h			;81d9
	push af			;81da
	defb 0fdh,0aah,0aah ;illegal sequence	;81db
	xor d			;81de
	xor d			;81df
	ld d,l			;81e0
	ld d,l			;81e1
	ld d,l			;81e2
	ld d,l			;81e3
	xor d			;81e4
	xor d			;81e5
	xor d			;81e6
	xor d			;81e7
	ld d,l			;81e8
	ld d,l			;81e9
	ld d,c			;81ea
	ld d,l			;81eb
	xor d			;81ec
	nop			;81ed
	ld h,0aah		;81ee
	ld d,l			;81f0
	cp a			;81f1
	adc a,a			;81f2
	ld d,l			;81f3
	xor e			;81f4
	and a			;81f5
	exx			;81f6
	ld hl,(0db53h)		;81f7
	ld d,a			;81fa
	ld d,l			;81fb
	xor e			;81fc
	cp e			;81fd
	cp (hl)			;81fe
	xor d			;81ff
	ld d,e			;8200
	or (hl)			;8201
	ld b,0d5h		;8202
	xor e			;8204
	cp l			;8205
	ld sp,hl		;8206
	jp z,01052h		;8207
	cp 0d5h			;820a
	and l			;820c
	rst 30h			;820d
	ld a,(hl)		;820e
	jp z,L_B74B		;820f
	ret z			;8212
	push de			;8213
	xor e			;8214
	ld l,(hl)		;8215
	or a			;8216
	ld hl,(0f54ah)		;8217
	jp m,L_A2E5		;821a
	in a,(0fah)		;821d
	jp pe,L_BB53		;821f
	jp c,L_ABE5		;8222
	cp l			;8225
	add a,a			;8226
	jp z,L_BE55		;8227
	ld e,l			;822a
	sub l			;822b
	and (hl)		;822c
	dec a			;822d
	in a,(04ah)		;822e
	ld d,a			;8230
	jp L_D5DC		;8231

; ----------------------------------------------------------------------
; DATOS tiles: de los niveles: 111 de 32x32, 128 bytes cada uno
;   0x6de0..0xa560  (14208 bytes)
; ----------------------------------------------------------------------
	defb 0a7h,0dfh,0bfh,0cah,057h,0e0h,05fh,095h,0a7h,0fbh,0efh,02ah,053h,0f7h,0eeh,055h	; 8234  ....W._....*S..U
	defb 0a8h,00fh,0e0h,0aah,055h,043h,0c5h,055h,0aah,0a8h,00ah,0aah,055h,055h,055h,055h	; 8244  ....UC.U....UUUU
	defb 0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h	; 8254  ....UUUU....UUUU
	defb 0aah,0aah,0aah,0aah,055h,055h,055h,055h,0a8h,000h,00ah,0aah,053h,0bbh,0e5h,055h	; 8264  ....UUUU....S..U
	defb 0a3h,0bdh,0f2h,02ah,057h,0b8h,0f8h,075h,0a4h,0f7h,027h,06ah,053h,06fh,0dfh,055h	; 8274  ...*W..u..'jSo.U
	defb 0a7h,0ech,0b6h,0aah,04eh,077h,07ah,055h,09dh,0bfh,0bah,0aah,05bh,0b3h,0d6h,055h	; 8284  ....NwzU....[..U
	defb 0a7h,0efh,0deh,08eh,04fh,0deh,036h,095h,0afh,0bfh,0d9h,0aah,050h,0bdh,0dfh,015h	; 8294  ....O.6.....P...
	defb 0abh,0deh,0beh,0aah,056h,0e6h,0edh,085h,0adh,0fdh,0f3h,0aah,04dh,0dbh,03bh,095h	; 82a4  ....V.......M.;.
	defb 0adh,0e6h,0fdh,00ah,04eh,0eeh,0dch,015h,0afh,01eh,0eeh,0aah,057h,0f7h,066h,015h	; 82b4  ....N.......W.f.
	defb 0a8h,0efh,0e8h,0aah,055h,0f0h,005h,055h,0a8h,002h,0aah,08ah,055h,055h,055h,055h	; 82c4  ....U..U....UUUU
	defb 0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h	; 82d4  ....UUUU....UUUU
	defb 0aah,08ah,0aah,0aah,050h,065h,055h,055h,0aeh,0f0h,0aah,09ah,05dh,0cfh,001h,035h	; 82e4  ....PeUU....]..5
	defb 09dh,0ffh,0beh,02ah,051h,0f3h,0feh,075h,0adh,0efh,0feh,06ah,05dh,0deh,0f6h,095h	; 82f4  ...*Q..u...j]...
	defb 09dh,0dfh,00dh,0cah,05eh,0cfh,0bbh,0e5h,0bfh,0c7h,0bfh,0eah,03dh	; 8304  ....^.......=

; ======================================================================
; CODIGO 0x8311..0x8748  (1079 bytes)
; ======================================================================


L_8311:
	ret nz			;8311
	inc sp			;8312
	push de			;8313
	add a,e			;8314
	add a,b			;8315
	cpl			;8316
	ld b,(hl)		;8317
	ld b,a			;8318
	ld b,b			;8319
	cpl			;831a
	adc a,l			;831b
	and h			;831c
	xor 0afh		;831d
	sbc a,d			;831f
	ld c,a			;8320
	ret po			;8321
	rst 28h			;8322
	or l			;8323
	xor a			;8324
	defb 0edh ;next byte illegal after ed	;8325
	rst 38h			;8326
	ld l,d			;8327
	ld c,a			;8328
	add a,c			;8329
	sbc a,(hl)		;832a
	push bc			;832b
	and a			;832c
	cp 071h			;832d
	ld a,058h		;832f
	ld l,(hl)		;8331
	rst 38h			;8332
	dec d			;8333
	sbc a,l			;8334
	sbc a,0efh		;8335
	ld a,(bc)		;8337
	ld e,l			;8338
	or (hl)			;8339
	ld l,(hl)		;833a
L_833B:
	dec d			;833b
	sbc a,l			;833c
	or a			;833d
	ret nz			;833e
	jp m,L_FB4C		;833f
	sbc a,015h		;8342
	or e			;8344
	dec sp			;8345
	ld a,0fah		;8346
	ld e,e			;8348
	ret nz			;8349
	ld a,c			;834a
	push af			;834b
	cp e			;834c
	jp po,L_DA82		;834d
	ld d,e			;8350
	sub e			;8351
	ld d,l			;8352
	ld (hl),l		;8353
	xor b			;8354
	ld h,09ah		;8355
	xor d			;8357
	ld d,l			;8358
	ld d,l			;8359
	ld (hl),l		;835a
	ld d,l			;835b
	xor d			;835c
	xor (hl)		;835d
	xor d			;835e
	xor d			;835f
	ld d,l			;8360
	ld d,l			;8361
	ld d,l			;8362
	ld d,l			;8363
	xor d			;8364
	xor d			;8365
	xor d			;8366
	xor d			;8367
	ld d,l			;8368
	dec d			;8369
	ld d,h			;836a
	ld d,l			;836b
	and d			;836c
	ld l,b			;836d
	xor c			;836e
	sbc a,d			;836f
	ld c,l			;8370
	and d			;8371
	ld d,c			;8372
	or l			;8373
	sbc a,e			;8374
	ret pe			;8375
	ld h,a			;8376
	ld c,d			;8377
	ld e,(hl)		;8378
	dec l			;8379
	ld d,a			;837a
	push de			;837b
	sub l			;837c
	and 060h		;837d
	xor d			;837f
	ld b,a			;8380
	call nz,L_D557		;8381
	xor (hl)		;8384
	and b			;8385
	and a			;8386
	ld c,d			;8387
	ld c,l			;8388
	ret po			;8389
	sub b			;838a
	ld d,l			;838b
	xor l			;838c
	ret po			;838d
	or (hl)			;838e
	xor d			;838f
	ld b,b			;8390
	nop			;8391
	cp l			;8392
	ld d,l			;8393
	and b			;8394
	nop			;8395
	or b			;8396
	ld b,040h		;8397
	jr nz,L_833B		;8399
	dec c			;839b
	and a			;839c
	cp d			;839d
	sbc a,a			;839e
	ld e,d			;839f
	ld d,b			;83a0
	nop			;83a1
	ld e,a			;83a2
	dec (hl)		;83a3
	xor (hl)		;83a4
	cp 0dch			;83a5
	jp z,03e4eh		;83a7
	in a,(0c5h)		;83aa
	add a,h			;83ac
	ret nz			;83ad
	push af			;83ae
	sbc a,03fh		;83af
	ld b,b			;83b1
	xor (hl)		;83b2
	and l			;83b3
	or e			;83b4
	add a,b			;83b5
	ld a,0eah		;83b6
	ld a,a			;83b8
	add a,b			;83b9
	ld l,(hl)		;83ba
	ld h,l			;83bb
	ld l,l			;83bc
	ld a,h			;83bd
	push af			;83be
	xor d			;83bf
	inc l			;83c0
	ld h,c			;83c1
	or a			;83c2
	dec d			;83c3
	adc a,l			;83c4
	xor 030h		;83c5
	jp m,04b43h		;83c7
	dec (hl)		;83ca
	push af			;83cb
	cp (hl)			;83cc
	and d			;83cd
	adc a,d			;83ce
	jp c,05355h		;83cf
	ld d,l			;83d2
	ld (hl),l		;83d3
	xor d			;83d4
	and (hl)		;83d5
	sbc a,d			;83d6
	xor d			;83d7
	ld d,l			;83d8
	ld d,l			;83d9
	ld (hl),l		;83da
	ld d,l			;83db
	xor d			;83dc
	xor (hl)		;83dd
	xor d			;83de
	xor d			;83df
	ld d,l			;83e0
	ld d,l			;83e1
	ld d,l			;83e2
	ld d,l			;83e3
	xor d			;83e4
	xor d			;83e5
	xor d			;83e6
	xor d			;83e7
	ld d,l			;83e8
	dec (hl)		;83e9
	ld d,l			;83ea
	ld d,l			;83eb
	and (hl)		;83ec
	xor d			;83ed
	xor d			;83ee
	sbc a,d			;83ef
	ld d,l			;83f0
	dec d			;83f1
	ld d,l			;83f2
	dec (hl)		;83f3
	and (hl)		;83f4
	adc a,d			;83f5
	ld l,d			;83f6
	ld hl,(00d53h)		;83f7
	ld d,h			;83fa
	ld (hl),l		;83fb
	and d			;83fc
	add a,(hl)		;83fd
	ld l,b			;83fe
	jp pe,00453h		;83ff
	ld d,b			;8402
	push de			;8403
	xor c			;8404
	add a,b			;8405
	and c			;8406
	xor d			;8407
	ld d,b			;8408
	add a,b			;8409
	sub e			;840a
	ld d,l			;840b
	xor b			;840c
	nop			;840d
	or (hl)			;840e
	xor d			;840f
	ld b,h			;8410
	nop			;8411
	cp l			;8412
	ld d,l			;8413
	xor b			;8414
	nop			;8415
	or b			;8416
	ld b,040h		;8417
	nop			;8419
	or b			;841a
	dec c			;841b
	and a			;841c
	cp 0b7h			;841d
	jp c,00050h		;841f   ; BIOS SETRD - Enables VDP to read
	or b			;8422
	dec (hl)		;8423
	and a			;8424
	cp 0b7h			;8425
	xor d			;8427
	ld d,e			;8428
	cp 0b7h			;8429
	push bc			;842b
	xor b			;842c
	nop			;842d
	or b			;842e
	ld a,054h		;842f
	nop			;8431
	or b			;8432
	dec d			;8433
	xor d			;8434
	nop			;8435
	or b			;8436
	ld a,(bc)		;8437
	ld d,h			;8438
	nop			;8439
	or b			;843a
	dec d			;843b
	xor a			;843c
	defb 0fdh,0b7h,0fah ;illegal sequence	;843d
	ld d,b			;8440
	ld h,c			;8441
	inc l			;8442
	dec d			;8443
	cp l			;8444
	rst 28h			;8445
	dec hl			;8446
L_8447:
	jp m,04b5fh		;8447
	dec l			;844a
	push af			;844b
	cp (hl)			;844c
	and d			;844d
	sbc a,d			;844e
	jp c,05355h		;844f
	ld d,l			;8452
	ld (hl),l		;8453
	xor d			;8454
	and (hl)		;8455
	sbc a,d			;8456
	xor d			;8457
	ld d,l			;8458
	ld d,l			;8459
	ld (hl),l		;845a
	ld d,l			;845b
	xor d			;845c
	xor (hl)		;845d
	xor d			;845e
	xor d			;845f
	ld d,l			;8460
	ld d,l			;8461
	ld d,l			;8462
	ld d,l			;8463
	xor d			;8464
	xor d			;8465
	xor d			;8466
	xor d			;8467
	ld (hl),l		;8468
	ld e,c			;8469
	ld d,l			;846a
	ld d,l			;846b
	sbc a,(hl)		;846c
	xor b			;846d
	xor c			;846e
	xor d			;846f
	ld b,e			;8470
	ld e,c			;8471
	ld d,c			;8472
	ld d,l			;8473
	and c			;8474
	xor b			;8475
	ld l,c			;8476
	xor d			;8477
	ld d,h			;8478
	exx			;8479
	ld d,c			;847a
	push de			;847b
	xor d			;847c
	nop			;847d
	ld l,c			;847e
	xor d			;847f
	ld d,h			;8480
	ld d,h			;8481
	ld d,b			;8482
	push de			;8483
	xor b			;8484
	or h			;8485
	xor c			;8486
	or d			;8487
	ld d,c			;8488
	ld d,h			;8489
	jp L_A865		;848a
L_848D:
	or h			;848d
	jp m,05dcah		;848e
	ld d,h			;8491
	ld sp,hl		;8492
	sbc a,a			;8493
	xor b			;8494
	or h			;8495
	ld bc,05b60h		;8496
	call p,00500h		;8499
	or b			;849c
	inc b			;849d
	ld c,02ah		;849e
	ld d,b			;84a0
	inc l			;84a1
	ld c,055h		;84a2
	or b			;84a4
	inc l			;84a5
	nop			;84a6
	ld hl,(02d50h)		;84a7
	rst 38h			;84aa
	add a,l			;84ab
	xor b			;84ac
	inc l			;84ad
	nop			;84ae
	ld a,058h		;84af
	inc l			;84b1
	rst 38h			;84b2
	sub l			;84b3
	or d			;84b4
	adc a,(hl)		;84b5
	ld a,a			;84b6
	jp z,04e64h		;84b7
	nop			;84ba
	dec d			;84bb
	call z,L_BCAC		;84bc
	ld a,(de)		;84bf
	sub h			;84c0
	ld c,l			;84c1
	jr nz,L_84D1		;84c2
	xor h			;84c4
	xor h			;84c5
	ld l,d			;84c6
	ld b,055h		;84c7
	ld c,c			;84c9
	dec h			;84ca
	rlca			;84cb
	xor d			;84cc
	and d			;84cd
	adc a,d			;84ce
	and e			;84cf
	ld d,l			;84d0
L_84D1:
	ld d,c			;84d1
	ld d,l			;84d2
	ld d,c			;84d3
	xor d			;84d4
	and d			;84d5
	adc a,d			;84d6
	xor b			;84d7
	ld d,l			;84d8
	ld d,l			;84d9
	ld d,l			;84da
	ld d,l			;84db
	xor d			;84dc
	xor d			;84dd
	xor d			;84de
	xor d			;84df
	ld d,l			;84e0
	ld d,l			;84e1
	ld d,l			;84e2
	ld d,l			;84e3
	xor d			;84e4
	and b			;84e5
	add a,d			;84e6
	ld a,(bc)		;84e7
	ld d,l			;84e8
	ld d,l			;84e9
	ld d,l			;84ea
	ld d,l			;84eb
	xor d			;84ec
	and h			;84ed
	sub d			;84ee
	ld c,d			;84ef
	ld d,c			;84f0
	push de			;84f1
	ld d,l			;84f2
	ld d,l			;84f3
	and b			;84f4
	call po,L_4A92		;84f5
	ld b,b			;84f8
	nop			;84f9
	nop			;84fa
	nop			;84fb
	and d			;84fc
	xor d			;84fd
	xor d			;84fe
	xor d			;84ff
	ld b,a			;8500
	rst 38h			;8501
L_8502:
	rst 38h			;8502
	rst 38h			;8503
	and b			;8504
	ret po			;8505
	add a,d			;8506
	ld a,(bc)		;8507
	ld d,c			;8508
	push de			;8509
	ld d,l			;850a
	ld d,l			;850b
	xor a			;850c
	and h			;850d
	sub d			;850e
	ld c,d			;850f
	ld d,l			;8510
	ld d,l			;8511
	ld d,l			;8512
	ld d,l			;8513
	xor d			;8514
	and h			;8515
	sub d			;8516
	ld c,d			;8517
	nop			;8518
	dec d			;8519
	ld d,l			;851a
	ld d,l			;851b
	xor d			;851c
	add a,h			;851d
	sub d			;851e
	ld c,d			;851f
	ccf			;8520
	push de			;8521
	ld d,l			;8522
	ld d,l			;8523
	xor d			;8524
	add a,h			;8525
	sub d			;8526
	ld c,d			;8527
	nop			;8528
	dec d			;8529
	ld d,l			;852a
	ld d,l			;852b
	xor d			;852c
	and h			;852d
	sub d			;852e
	ld c,d			;852f
	ld d,c			;8530
	push de			;8531
	ld d,l			;8532
	ld d,l			;8533
	and b			;8534
	call po,L_4A92		;8535
	ld b,b			;8538
	nop			;8539
	nop			;853a
	nop			;853b
	and d			;853c
	xor d			;853d
	xor d			;853e
	xor d			;853f
	ld b,a			;8540
	rst 38h			;8541
	rst 38h			;8542
	rst 38h			;8543
	and b			;8544
	ret po			;8545
	add a,d			;8546
	ld a,(bc)		;8547
	ld d,c			;8548
	pop de			;8549
	ld b,l			;854a
	dec d			;854b
	xor a			;854c
	and h			;854d
	sub d			;854e
	ld c,d			;854f
	ld d,l			;8550
	ld d,l			;8551
	ld d,l			;8552
	ld d,l			;8553
	xor d			;8554
	and h			;8555
	sub d			;8556
	ld c,d			;8557
	ld d,l			;8558
	ld d,c			;8559
	ld b,l			;855a
	dec d			;855b
	xor d			;855c
	xor d			;855d
	xor d			;855e
	xor d			;855f
	ld d,l			;8560
	ld d,l			;8561
	ld d,l			;8562
	ld d,l			;8563
	xor b			;8564
	and d			;8565
	adc a,d			;8566
	xor d			;8567
	ld d,d			;8568
	ld c,c			;8569
	dec h			;856a
	ld d,l			;856b
	xor d			;856c
	xor d			;856d
	xor d			;856e
	xor d			;856f
	ld d,d			;8570
	ld c,c			;8571
	dec h			;8572
	dec d			;8573
	xor d			;8574
	xor d			;8575
	xor d			;8576
	ld a,(de)		;8577
	nop			;8578
	nop			;8579
	nop			;857a
	dec c			;857b
	ld d,l			;857c
	ld d,l			;857d
	ld d,l			;857e
	ld c,(hl)		;857f
	rst 38h			;8580
	rst 38h			;8581
	rst 38h			;8582
	push hl			;8583
	xor b			;8584
	and d			;8585
	add a,b			;8586
	ld c,052h		;8587
	ld c,c			;8589
L_858A:
	inc h			;858a
	ld e,l			;858b
	xor d			;858c
	xor d			;858d
	xor d			;858e
	jp m,L_4952		;858f
	dec h			;8592
	ld d,l			;8593
	xor d			;8594
	xor d			;8595
	xor d			;8596
	xor d			;8597
	ld d,d			;8598
	ld c,c			;8599
	jr nz,L_859D		;859a
	xor d			;859c
L_859D:
	xor d			;859d
	xor d			;859e
	xor b			;859f
	ld d,d			;85a0
	ld c,c			;85a1
	inc hl			;85a2
	defb 0fdh,0aah,0aah ;illegal sequence	;85a3
	xor d			;85a6
	xor b			;85a7
L_85A8:
	ld d,d			;85a8
	ld c,c			;85a9
	jr nz,L_85AD		;85aa
	xor d			;85ac
L_85AD:
	xor d			;85ad
	xor d			;85ae
	xor d			;85af
	ld d,d			;85b0
	ld c,c			;85b1
L_85B2:
	dec h			;85b2
	dec d			;85b3
	xor d			;85b4
	xor d			;85b5
	xor d			;85b6
	ld a,(de)		;85b7
	nop			;85b8
	nop			;85b9
	nop			;85ba
	dec c			;85bb
	ld d,l			;85bc
	ld d,l			;85bd
	ld d,l			;85be
	ld c,(hl)		;85bf
	rst 38h			;85c0
	rst 38h			;85c1
	rst 38h			;85c2
	push hl			;85c3
	xor b			;85c4
	and d			;85c5
	add a,b			;85c6
	ld c,052h		;85c7
	ld c,c			;85c9
	inc h			;85ca
	ld e,l			;85cb
	xor d			;85cc
	xor d			;85cd
	xor d			;85ce
	jp m,L_4952		;85cf
	dec h			;85d2
	ld d,l			;85d3
	xor d			;85d4
	xor d			;85d5
	xor d			;85d6
	xor d			;85d7
	ld d,b			;85d8
	ld b,c			;85d9
	dec b			;85da
	ld d,l			;85db
	xor d			;85dc
	xor d			;85dd
	xor d			;85de
	xor d			;85df
	ld d,l			;85e0
	ld b,b			;85e1
	dec b			;85e2
L_85E3:
	ld d,l			;85e3
	xor d			;85e4
	adc a,a			;85e5
	ret p			;85e6
	xor d			;85e7
	ld d,h			;85e8
	jr nc,L_85F7		;85e9
	ld d,l			;85eb
	xor b			;85ec
	ret nz			;85ed
	inc bc			;85ee
	ld hl,(00051h)		;85ef
	nop			;85f2
	sub l			;85f3
	and d			;85f4
	nop			;85f5
	sub h			;85f6
L_85F7:
	ld c,d			;85f7
	ld b,h			;85f8
	nop			;85f9
	nop			;85fa
	dec h			;85fb
	adc a,b			;85fc
	nop			;85fd
	adc a,d			;85fe
	sub d			;85ff
	ld d,b			;8600
	ld de,04910h		;8601
	sub b			;8604
	ld (bc),a		;8605
	add a,d			;8606
	xor b			;8607
	jr nz,L_858A		;8608
	inc (hl)		;860a
	dec d			;860b
	jr nz,L_8636		;860c
	xor d			;860e
	and h			;860f
	ld b,b			;8610
	ld b,l			;8611
	rlca			;8612
	ld d,(hl)		;8613
	ld b,d			;8614
	ld (bc),a		;8615
	jr z,L_85B2		;8616
	ld b,b			;8618
	inc d			;8619
	ld d,(ix+040h)		;861a
	and d			;861d
	cp d			;861e
	jp pe,00742h		;861f
	ld d,a			;8622
	ld d,(hl)		;8623
	ld b,b			;8624
	cp d			;8625
	jp pe,045bah		;8626
	ld de,0565fh		;8629
	ld b,b			;862c
	xor e			;862d
	cp a			;862e
	jp pe,L_5521		;862f
	ld a,a			;8632
	call c,033a4h		;8633
L_8636:
	rst 38h			;8636
	call pe,L_5511		;8637
	ld e,a			;863a
L_863B:
	exx			;863b
	sub b			;863c
	adc a,e			;863d
	cp a			;863e
	cp d			;863f
	ld c,b			;8640
	ld (hl),a		;8641
	ld e,a			;8642
	pop de			;8643
	and h			;8644
	xor d			;8645
	jp pe,L_52A2		;8646
	ld e,l			;8649
	ld e,a			;864a
	ld b,l			;864b
	xor c			;864c
	ld hl,(08a3ah)		;864d
	ld d,h			;8650
	rst 0			;8651
	ld d,a			;8652
	dec d			;8653
	xor d			;8654
	ld a,(02aach)		;8655
	ld d,l			;8658
	rrca			;8659
	pop af			;865a
	ld d,l			;865b
	xor d			;865c
	and b			;865d
	ld (bc),a		;865e
	xor d			;865f
	ld d,l			;8660
	ld d,b			;8661
	dec b			;8662
	ld d,l			;8663
	xor d			;8664
	adc a,a			;8665
	ret p			;8666
	xor d			;8667
	ld d,l			;8668
	ld (hl),b		;8669
	ld c,055h		;866a
	xor b			;866c
	add a,b			;866d
	dec b			;866e
	ld hl,(00c53h)		;866f
	jp po,L_A4D5		;8672
	djnz L_8684		;8675
	xor d			;8677
	ld c,b			;8678
	add a,b			;8679
	dec bc			;867a
	ld d,l			;867b
	xor c			;867c
	nop			;867d
	ld (bc),a		;867e
	or d			;867f
	ld d,d			;8680
	nop			;8681
	dec d			;8682
	ld l,c			;8683
L_8684:
	and b			;8684
	jr nz,$+10		;8685
	call c,L_7020		;8687
	inc de			;868a
	or l			;868b
	and h			;868c
	dec sp			;868d
	and 0dch		;868e
	ld c,b			;8690
	inc d			;8691
	scf			;8692
	sbc a,048h		;8693
	add hl,bc		;8695
	sbc a,e			;8696
	cp 040h			;8697
	ld (de),a		;8699
	ld c,a			;869a
	cp 040h			;869b
	dec d			;869d
	xor a			;869e
	cp 048h			;869f
	dec d			;86a1
	xor a			;86a2
	xor 048h		;86a3
	ld (de),a		;86a5
	ld c,a			;86a6
	xor 048h		;86a7
	ld e,c			;86a9
	sbc a,a			;86aa
	xor 051h		;86ab
	inc l			;86ad
	scf			;86ae
	cp 024h			;86af
	ld (hl),a		;86b1
	ex (sp),hl		;86b2
	cp 0b4h			;86b3
	rst 28h			;86b5
	pop af			;86b6
	call c,0572bh		;86b7
	ei			;86ba
	cp l			;86bb
	sub (hl)		;86bc
	cp a			;86bd
	rst 38h			;86be
	ld a,d			;86bf
	ld c,l			;86c0
	ld l,a			;86c1
	rst 38h			;86c2
	push af			;86c3
	xor d			;86c4
	cp a			;86c5
	defb 0fdh,0f2h,055h ;illegal sequence	;86c6
	adc a,a			;86c9
	di			;86ca
	push hl			;86cb
	xor e			;86cc
	ld a,h			;86cd
	ld a,a			;86ce
	jp z,L_BF54		;86cf
	rst 38h			;86d2
	dec d			;86d3
	xor d			;86d4
	ld a,a			;86d5
	cp 0aah			;86d6
	ld d,l			;86d8
	rrca			;86d9
	pop af			;86da
	ld d,l			;86db
	xor d			;86dc
	and b			;86dd
	ld a,(bc)		;86de
	xor d			;86df
	ld d,l			;86e0
	ld a,a			;86e1
	rst 38h			;86e2
	ld d,l			;86e3
	xor e			;86e4
	and d			;86e5
	cp a			;86e6
	xor d			;86e7
	ld d,a			;86e8
	ld b,l			;86e9
	ld a,a			;86ea
	ld d,l			;86eb
	xor d			;86ec
	add a,d			;86ed
	cp (hl)			;86ee
	jp pe,00054h		;86ef
	nop			;86f2
	ld d,l			;86f3
	cp a			;86f4
	ccf			;86f5
	call m,045feh		;86f6
	ld sp,0df74h		;86f9
	sla d			;86fc
	cp h			;86fe
	xor (hl)		;86ff
	ld b,(hl)		;8700
	ld sp,05f74h		;8701
	jp z,L_BD22		;8704
	ld l,(hl)		;8707
	ld b,(hl)		;8708
	ld sp,05f75h		;8709
	jp z,L_B912		;870c
	ld l,(hl)		;870f
	ld d,h			;8710
	ld de,0377bh		;8711
	call z,L_BB12		;8714
	xor (hl)		;8717
	ld d,h			;8718
	ld de,0b77bh		;8719
	adc a,b			;871c
	jr $-3			;871d
L_871F:
	sbc a,a			;871f
	sbc a,b			;8720
	add hl,bc		;8721
	ld (hl),e		;8722
	rst 10h			;8723
	xor b			;8724
	ex af,af'		;8725
	rst 30h			;8726
	in a,(090h)		;8727
	dec c			;8729
	ld (hl),a		;872a
	rst 8			;872b
	or b			;872c
	ex af,af'		;872d
	rst 30h			;872e
	ex de,hl		;872f
	sub h			;8730
	dec b			;8731
	ld h,a			;8732
	rst 8			;8733
	and b			;8734
	inc b			;8735
	rst 28h			;8736
	rst 20h			;8737
	and b			;8738
	dec d			;8739
	ld h,a			;873a
	rst 30h			;873b
	ret z			;873c
	ld (bc),a		;873d
	rst 8			;873e
	ex (sp),hl		;873f
	ret nc			;8740
	ld (de),a		;8741
	rst 10h			;8742
	di			;8743
	adc a,b			;8744
	add hl,bc		;8745
	adc a,a			;8746
	jp (hl)			;8747

; ----------------------------------------------------------------------
; DATOS tiles: de los niveles: 111 de 32x32, 128 bytes cada uno
;   0x6de0..0xa560  (14208 bytes)
; ----------------------------------------------------------------------
	defb 090h,015h,097h,0f5h,020h,008h,02fh,0f8h,0d0h,015h,057h,0f5h,0a0h,00ah,0afh,0fbh	; 8748  .... ./...W.....
	defb 0d0h,015h,057h,0f5h,0ffh,0ffh,0ffh,0ffh,055h,07fh,0ffh,055h,0abh,0c1h,07fh,0aah	; 8758  ..W.....U..U....
	defb 056h,082h,0beh,0d5h,0abh,005h	; 8768  V.....

; ======================================================================
; CODIGO 0x876e..0x8852  (228 bytes)
; ======================================================================


L_876E:
	ld e,a			;876e
	ld l,d			;876f
	ld d,b			;8770
	nop			;8771
	djnz L_8789		;8772
	cp e			;8774
	rst 38h			;8775
	rst 10h			;8776
	cp 072h			;8777
	dec hl			;8779
	call nc,L_B3BD		;877a
	rla			;877d
	push de			;877e
	halt			;877f
	ld (hl),d		;8780
	dec hl			;8781
	jp nc,L_B3BD		;8782
	rla			;8785
	sbc a,e			;8786
	halt			;8787
	ld l,d			;8788
L_8789:
	dec hl			;8789
	cp d			;878a
	cp l			;878b
	xor c			;878c
	rla			;878d
	sbc a,c			;878e
	halt			;878f
	ld l,c			;8790
	dec hl			;8791
	dec l			;8792
	cp l			;8793
	xor l			;8794
	rla			;8795
	ld e,l			;8796
	ld d,(hl)		;8797
	ld e,c			;8798
	dec hl			;8799
	inc l			;879a
	cp l			;879b
	or l			;879c
	ld d,05eh		;879d
	sub 059h		;879f
	ld a,(bc)		;87a1
	xor (hl)		;87a2
	cp l			;87a3
	or h			;87a4
	sub (hl)		;87a5
L_87A6:
	ld e,(hl)		;87a6
	ld d,(hl)		;87a7
	ld l,b			;87a8
	adc a,h			;87a9
	xor a			;87aa
	ld a,l			;87ab
	or h			;87ac
	sub l			;87ad
	ld e,a			;87ae
	ld e,(hl)		;87af
	ld l,b			;87b0
	adc a,h			;87b1
	xor a			;87b2
	dec a			;87b3
	or b			;87b4
	sbc a,c			;87b5
	ld e,a			;87b6
	cp (hl)			;87b7
	ld l,b			;87b8
	ld c,d			;87b9
	xor a			;87ba
	sbc a,l			;87bb
	ret nc			;87bc
	ld c,c			;87bd
	ld d,a			;87be
	sbc a,068h		;87bf
	ld d,d			;87c1
	xor a			;87c2
	call 035d0h		;87c3
	ld d,a			;87c6
	call pe,022a0h		;87c7
	xor a			;87ca
	push hl			;87cb
	ret nc			;87cc
	dec b			;87cd
	ld d,a			;87ce
	pop af			;87cf
	and b			;87d0
	ld a,(bc)		;87d1
	xor a			;87d2
	ei			;87d3
	ret nc			;87d4
	dec d			;87d5
	ld d,a			;87d6
	push af			;87d7
	and b			;87d8
	ld a,(bc)		;87d9
	xor a			;87da
	ei			;87db
	rst 38h			;87dc
	rst 38h			;87dd
	rst 38h			;87de
	rst 38h			;87df
	ld d,l			;87e0
	ld a,a			;87e1
	rst 38h			;87e2
	ld d,l			;87e3
	xor e			;87e4
	and d			;87e5
	cp a			;87e6
	xor d			;87e7
	ld d,a			;87e8
	ld b,l			;87e9
	ld a,a			;87ea
	ld d,l			;87eb
	xor d			;87ec
	add a,d			;87ed
	cp (hl)			;87ee
	jp pe,00154h		;87ef
	nop			;87f2
	ld d,l			;87f3
	xor a			;87f4
	call m,L_FABF		;87f5
	ld d,c			;87f8
	ld e,l			;87f9
	dec h			;87fa
	ld a,l			;87fb
	or d			;87fc
	cp h			;87fd
	and d			;87fe
	cp d			;87ff
	ld d,c			;8800
	ld e,l			;8801
	dec h			;8802
	ld a,l			;8803
	or d			;8804
	cp b			;8805
	sub d			;8806
	cp d			;8807
	ld d,c			;8808
	ld e,c			;8809
	ld d,l			;880a
	ld a,l			;880b
	or b			;880c
	cp d			;880d
	sub d			;880e
	jp m,L_5151		;880f
	ld c,l			;8812
	ld a,l			;8813
	or b			;8814
	or d			;8815
	xor d			;8816
	jp m,06551h		;8817
	ld b,l			;881a
	ld a,l			;881b
	or b			;881c
	xor d			;881d
	and (hl)		;881e
	jp m,04551h		;881f
	ld d,e			;8822
	ld a,l			;8823
	xor b			;8824
	jp z,L_F2AA		;8825
	ld l,c			;8828
	add a,l			;8829
	ld e,c			;882a
	ld (hl),l		;882b
	xor b			;882c
	adc a,d			;882d
	xor l			;882e
	or 069h			;882f
	dec b			;8831
	ld e,h			;8832
	push af			;8833
	xor c			;8834
	ld a,(bc)		;8835
	xor (hl)		;8836
	or 04ah			;8837
	dec d			;8839
	ld d,(hl)		;883a
	ld (hl),a		;883b
	jp pe,L_AF0A		;883c
	ld (hl),d		;883f
	ld c,h			;8840
	dec d			;8841
	ld d,a			;8842
	scf			;8843
	call pe,L_AF0A		;8844
	or d			;8847
	ret z			;8848
	dec d			;8849
	ld d,a			;884a
	sub l			;884b
	and b			;884c
	ld a,(bc)		;884d
	xor a			;884e
	jp 015d0h		;884f

; ----------------------------------------------------------------------
; DATOS tiles: de los niveles: 111 de 32x32, 128 bytes cada uno
;   0x6de0..0xa560  (14208 bytes)
; ----------------------------------------------------------------------
	defb 057h,0f5h,0a0h,00ah,0afh,0fbh,0d0h,015h,057h,0f5h,0ffh,0ffh,0ffh,0ffh,055h,07fh	; 8852  W.......W.....U.
	defb 0ffh,055h,0abh,0c1h,07fh,0aah,056h,082h,0beh,0d5h,0abh,005h,05fh,06ah,054h,000h	; 8862  .U....V....._jT.
	defb 000h,015h,0bfh,0e3h,0ffh,0dah,062h,0e2h,02bh,0cdh,0b1h,062h,017h,04eh,062h,0c2h	; 8872  ......b.+..b.Nb.
	defb 02bh,0cdh,0b1h,041h,017h,04eh,062h,0c1h,02bh,0cdh,0b1h,085h,017h,096h,062h,088h	; 8882  +..A.Nb.+.....b.
	defb 0abh,0b5h,0b1h,084h,097h,096h,063h,00ah,0abh,0bdh,0b5h,004h,057h,09ah,063h,00ah	; 8892  ......c.....W.c.
	defb 06fh,0adh,0b6h,005h,057h,01ah,062h,00ah,02fh,06dh,0a6h,005h,037h,056h,064h,00ah	; 88a2  o...W.b./m..7Vd.
	defb 0afh,06dh,0a4h,005h,017h,076h,068h,00ah,09eh,06bh,0a8h,015h,056h,0f6h,070h,00ah	; 88b2  .m...vh..k..V.p.
	defb 08eh,0ebh,0b0h,015h,04ch,0f6h,0e0h,00ah,0a5h,0fbh,080h,015h,051h,0f5h,0a0h,00ah	; 88c2  ....L.......Q...
	defb 0afh,0fbh,0d0h,015h,057h,0f5h,0a0h,00ah,0afh,0fbh,0ffh,0ffh,0ffh,0ffh,0d0h,015h	; 88d2  ....W...........
	defb 057h,0f5h,0a0h,00ah,0afh,0fbh,0d0h,015h,057h,0f5h,0a2h,00ah,0afh,0fbh,0d3h,015h	; 88e2  W.......W.......
	defb 057h,075h,0e2h,00ah,0afh,0fah,053h,015h,057h,077h,0e2h,00ah,0afh,0fah,053h,015h	; 88f2  Wu....S.Ww....S.
	defb 057h,077h,0eah,00ah,0afh,0eah,073h,015h,057h,075h,0aah,00ah,0afh,0eeh,073h,005h	; 8902  Ww....s.Wu....s.
	defb 05fh,075h,0aah,00ah,0afh,0eeh,053h,005h,05fh,07dh,0bah,00ah,0afh,0eah,053h,005h	; 8912  _u....S._}....S.
	defb 05fh,07dh,0aah,00ah,0afh,0fah,05bh,005h,05fh,075h,0aeh,00ah,0afh,0eah,057h,005h	; 8922  _}....[._u....W.
	defb 05fh,055h,0aah,00ah,0afh,0eah,057h,005h,05fh,055h,0aah,00ah,0afh,0eah,057h,005h	; 8932  _U....W._U....W.
	defb 05fh,055h,0aah,00ah,0afh,0eah,057h,005h,05fh,055h,0aah,00ah,0afh,0eah,057h,0ffh	; 8942  _U....W._U....W.
	defb 0ffh,0d5h,0abh,000h,000h,0eah,056h,000h,000h,055h,0abh,000h,000h,0aah,000h,000h	; 8952  ......V..U......
	defb 000h,001h,000h,000h,000h,003h,015h,055h,055h,057h,02ah,0abh,02ah,0abh,015h,055h	; 8962  .......UUW*.*..U
	defb 055h,057h,02ah,0abh,02ah,0abh,015h,055h,055h,057h,02ah,0abh,02ah,0abh,015h,055h	; 8972  UW*.*..UUW*.*..U
	defb 055h,057h,02ah,0abh,02ah,0abh,015h,055h,055h,057h,02ah,0abh,02ah,0abh,015h,055h	; 8982  UW*.*..UUW*.*..U
	defb 055h,057h,02ah,0abh,02ah,0abh,015h,055h,055h,057h,03fh,0ffh,0ffh,0ffh,000h,001h	; 8992  UW*.*..UUW?.....
	defb 000h,003h,02ah,0abh,02ah,0abh,015h,055h,055h,057h,02ah,0abh,02ah,0abh,015h,055h	; 89a2  ..*.*..UUW*.*..U
	defb 055h,057h,02ah,0abh,02ah,0abh,015h,055h,055h,057h,02ah,0abh,02ah,0abh,015h,055h	; 89b2  UW*.*..UUW*.*..U
	defb 055h,057h,02ah,0abh,02ah,0abh,015h,055h,055h,057h,02ah,0abh,02ah,0abh,015h,055h	; 89c2  UW*.*..UUW*.*..U
	defb 055h,057h,02ah,0abh,02ah,0abh,07fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,005h	; 89d2  UW*.*...........
	defb 040h,001h,000h,006h,080h,003h,015h,055h,055h,057h,02ah,0aeh,08ah,0abh,015h,055h	; 89e2  @......UUW*....U
	defb 055h,057h,02ah,0afh,0cah,0abh,015h,054h,015h,057h,02ah,0ach,00ah,0abh,015h,057h	; 89f2  UW*....T.W*....W
	defb 0d5h,057h,02ah,0aeh,08ah,0abh,015h,055h,055h,057h,02ah,0afh,0cah,0abh,015h,054h	; 8a02  .W*....UUW*....T
	defb 015h,057h,0ffh,0fch,03fh,0ffh,054h,0d0h,00dh,0f5h,0ach,0b1h,08bh,0eah,054h,0d1h	; 8a12  .W..?.T.......T.
	defb 08dh,0f5h,0ach,0b0h,00bh,0eah,000h,004h,000h,000h,02ah,0ach,00ah,0abh,015h,057h	; 8a22  ..........*....W
	defb 0d5h,057h,02ah,0aeh,08ah,0abh,015h,055h,055h,057h,02ah,0afh,0cah,0abh,015h,057h	; 8a32  .W*....UUW*....W
	defb 0d5h,057h,02ah,0afh,0cah,0abh,015h,057h,0d5h,057h,02ah,0aeh,08ah,0abh,015h,055h	; 8a42  .W*....W.W*....U
	defb 055h,057h,02ah,0aeh,08ah,0abh,07fh,0fdh,05fh,0ffh,0ffh,0feh,09fh,0ffh,000h,035h	; 8a52  UW*....._......5
	defb 050h,001h,000h,02ah,0a8h,003h,015h,075h,051h,057h,02ah,0aah,0aah,0abh,015h,075h	; 8a62  P..*...uQW*....u
	defb 051h,057h,02ah,0afh,0fah,0abh,015h,070h,009h,057h,02ah,0a0h,002h,0abh,015h,067h	; 8a72  QW*....p.W*....g
	defb 0e1h,057h,02ah,0bah,0bah,0abh,0ffh,0f5h,057h,0ffh,0aah,06bh,0ebh,0eah,054h,054h	; 8a82  .W*.....W..k..TT
	defb 037h,0f5h,0ach,0a8h,01bh,0eah,054h,0d0h,00dh,0f5h,0ach,0b1h,08bh,0eah,054h,0d1h	; 8a92  7.....T.......T.
	defb 08dh,0f5h,0ach,0b0h,00bh,0eah,054h,0d8h,015h,0f5h,0ach,06ch,02bh,0eah,056h,057h	; 8aa2  ......T....l+.VW
	defb 0d7h,0d5h,000h,02ah,0a8h,000h,015h,07dh,059h,057h,02ah,0bfh,0fah,0abh,015h,07fh	; 8ab2  ...*...}YW*.....
	defb 0f9h,057h,02ah,0bfh,0fah,0abh,015h,07fh,0f1h,057h,02ah,0aah,0aah,0abh,015h,075h	; 8ac2  .W*......W*....u
	defb 051h,057h,02ah,0aah,0aah,0abh,07fh,0f5h,053h,0ffh,0ffh,0eah,0abh,0ffh,000h,0d5h	; 8ad2  QW*.....S.......
	defb 054h,001h,000h,0aah,0aah,003h,015h,0d5h,054h,057h,02ah,0aah,0aah,0abh,015h,0d5h	; 8ae2  T.......TW*.....
	defb 054h,057h,02ah,0afh,0fah,0abh,015h,0f0h,00ch,057h,02ah,0c0h,002h,0abh	; 8af2  TW*......W*...

; ======================================================================
; CODIGO 0x8b00..0x8f1e  (1054 bytes)
; ======================================================================


L_8B00:
	rst 38h			;8b00
	add a,a			;8b01
	push hl			;8b02
	rst 38h			;8b03
	xor e			;8b04
	ld a,(de)		;8b05
	cp d			;8b06
	xor d			;8b07
	ld d,(hl)		;8b08
	dec (hl)		;8b09
	ld d,a			;8b0a
	push de			;8b0b
	xor d			;8b0c
	ld l,e			;8b0d
	jp pe,L_54EA		;8b0e
	ld d,h			;8b11
	scf			;8b12
	push af			;8b13
	xor h			;8b14
	xor b			;8b15
	dec de			;8b16
	jp pe,L_D054		;8b17
	dec c			;8b1a
	push af			;8b1b
	xor h			;8b1c
	or c			;8b1d
	adc a,e			;8b1e
	jp pe,L_D154		;8b1f
	adc a,l			;8b22
	push af			;8b23
	xor h			;8b24
	or b			;8b25
	dec bc			;8b26
	jp pe,L_D854		;8b27
L_8B2A:
	dec d			;8b2a
	push af			;8b2b
	xor l			;8b2c
	ld l,h			;8b2d
	dec hl			;8b2e
	jp pe,05756h		;8b2f
	rst 10h			;8b32
	push de			;8b33
	xor d			;8b34
	xor d			;8b35
	xor a			;8b36
	jp pe,L_7D55		;8b37
	ld e,a			;8b3a
	push de			;8b3b
	nop			;8b3c
	rst 18h			;8b3d
	cp 000h			;8b3e
	dec d			;8b40
	rst 38h			;8b41
	cp 057h			;8b42
	ld hl,(0febfh)		;8b44
	xor e			;8b47
	dec d			;8b48
	rst 18h			;8b49
	call p,02a57h		;8b4a
	xor d			;8b4d
	xor d			;8b4e
	xor e			;8b4f
	dec d			;8b50
	push de			;8b51
	ld d,h			;8b52
	ld d,a			;8b53
	ld hl,(0aaaah)		;8b54
	xor e			;8b57
	ld a,a			;8b58
	push de			;8b59
	ld d,h			;8b5a
	ld a,a			;8b5b
	rst 38h			;8b5c
	xor d			;8b5d
	xor d			;8b5e
	rst 38h			;8b5f
	ld bc,05555h		;8b60
	ld bc,0aa03h		;8b63
	xor d			;8b66
	inc bc			;8b67
	rla			;8b68
	ld d,l			;8b69
	ld d,l			;8b6a
	rla			;8b6b
	dec hl			;8b6c
	xor d			;8b6d
	xor d			;8b6e
	dec hl			;8b6f
	rla			;8b70
	ld d,l			;8b71
	ld d,l			;8b72
	rla			;8b73
	dec hl			;8b74
	xor a			;8b75
	jp m,L_7F2B		;8b76
	ld (hl),b		;8b79
	dec c			;8b7a
	ld a,a			;8b7b
	rst 38h			;8b7c
	ret nz			;8b7d
	ld (bc),a		;8b7e
	rst 38h			;8b7f
	ld d,l			;8b80
	add a,a			;8b81
	push hl			;8b82
	ld d,l			;8b83
	xor e			;8b84
	ld a,(de)		;8b85
	cp d			;8b86
	xor d			;8b87
	ld d,(hl)		;8b88
	dec (hl)		;8b89
	ld d,a			;8b8a
	push de			;8b8b
	xor d			;8b8c
	ld l,e			;8b8d
	jp pe,L_54EA		;8b8e
	ld d,h			;8b91
	scf			;8b92
	push af			;8b93
	xor h			;8b94
	xor b			;8b95
	dec de			;8b96
	jp pe,L_D054		;8b97
	dec c			;8b9a
	push af			;8b9b
	xor h			;8b9c
	or c			;8b9d
	adc a,e			;8b9e
	jp pe,L_D154		;8b9f
L_8BA2:
	adc a,l			;8ba2
	push af			;8ba3
	xor h			;8ba4
	or b			;8ba5
	dec bc			;8ba6
	jp pe,L_D854		;8ba7
	dec d			;8baa
	push af			;8bab
	xor l			;8bac
	ld l,h			;8bad
	dec hl			;8bae
	jp pe,05756h		;8baf
	rst 10h			;8bb2
	push de			;8bb3
	xor d			;8bb4
	xor d			;8bb5
	xor a			;8bb6
	jp pe,L_7D55		;8bb7
	ld e,a			;8bba
	push de			;8bbb
	xor d			;8bbc
	rst 18h			;8bbd
	rst 38h			;8bbe
	xor d			;8bbf
	ld bc,0ff7fh		;8bc0
	ld bc,0bf03h		;8bc3
	cp 003h			;8bc6
	rla			;8bc8
	ld e,a			;8bc9
	push af			;8bca
	rla			;8bcb
	dec hl			;8bcc
	xor d			;8bcd
	xor d			;8bce
	dec hl			;8bcf
	rla			;8bd0
	ld d,l			;8bd1
	ld d,l			;8bd2
	rla			;8bd3
	dec hl			;8bd4
	xor d			;8bd5
	xor d			;8bd6
	dec hl			;8bd7
	ld a,a			;8bd8
	ld d,l			;8bd9
	ld d,l			;8bda
	ld a,a			;8bdb
	rst 38h			;8bdc
	xor d			;8bdd
	xor d			;8bde
	rst 38h			;8bdf
	ld d,l			;8be0
	ld d,l			;8be1
	ld d,l			;8be2
	ld d,l			;8be3
	xor d			;8be4
	xor d			;8be5
	xor d			;8be6
	xor d			;8be7
	ld d,l			;8be8
	ld d,l			;8be9
	ld d,l			;8bea
	ld d,l			;8beb
	xor d			;8bec
	xor d			;8bed
	xor d			;8bee
	xor d			;8bef
	ld d,b			;8bf0
	nop			;8bf1
	nop			;8bf2
	dec d			;8bf3
	and b			;8bf4
	nop			;8bf5
	nop			;8bf6
	ld a,(00050h)		;8bf7
	nop			;8bfa
	ld (hl),l		;8bfb
	and b			;8bfc
	xor d			;8bfd
	xor d			;8bfe
	jp m,L_5551		;8bff
	ld d,l			;8c02
	ld (hl),l		;8c03
	and b			;8c04
	xor d			;8c05
	xor d			;8c06
	jp m,L_5551		;8c07
	ld d,l			;8c0a
	ld (hl),l		;8c0b
	and b			;8c0c
	xor d			;8c0d
	xor d			;8c0e
	jp m,L_5551		;8c0f
	ld d,l			;8c12
	ld (hl),l		;8c13
	and b			;8c14
	xor d			;8c15
	xor d			;8c16
	jp m,L_5551		;8c17
	ld d,l			;8c1a
	ld (hl),l		;8c1b
	and b			;8c1c
	xor d			;8c1d
	xor d			;8c1e
	jp m,L_5551		;8c1f
	ld d,l			;8c22
	ld (hl),l		;8c23
	and b			;8c24
	xor d			;8c25
	xor d			;8c26
	jp m,L_5551		;8c27
	ld d,l			;8c2a
	ld (hl),l		;8c2b
	and b			;8c2c
	xor d			;8c2d
	xor d			;8c2e
	jp m,L_5551		;8c2f
	ld d,l			;8c32
	ld (hl),l		;8c33
	and b			;8c34
	xor d			;8c35
	xor d			;8c36
	jp m,L_5551		;8c37
	ld d,l			;8c3a
	ld (hl),l		;8c3b
	and b			;8c3c
	xor d			;8c3d
	xor d			;8c3e
	jp m,L_5551		;8c3f
	ld d,l			;8c42
	ld (hl),l		;8c43
	and e			;8c44
	rst 38h			;8c45
	rst 38h			;8c46
	jp m,0ff57h		;8c47
	rst 38h			;8c4a
	push af			;8c4b
	xor a			;8c4c
	rst 38h			;8c4d
	rst 38h			;8c4e
	jp m,L_5555		;8c4f
	ld d,l			;8c52
	ld d,l			;8c53
	xor d			;8c54
	xor d			;8c55
	xor d			;8c56
	xor d			;8c57
	ld d,l			;8c58
	ld d,l			;8c59
	ld d,l			;8c5a
	ld d,l			;8c5b
	xor d			;8c5c
	xor d			;8c5d
	xor d			;8c5e
	xor d			;8c5f
	ld d,l			;8c60
	ld d,l			;8c61
	ld d,l			;8c62
	ld d,l			;8c63
	xor d			;8c64
	xor d			;8c65
	xor d			;8c66
	xor d			;8c67
	ld d,l			;8c68
	ld d,l			;8c69
	ld d,l			;8c6a
	ld d,l			;8c6b
	xor d			;8c6c
	xor d			;8c6d
	xor d			;8c6e
	xor d			;8c6f
	ld d,b			;8c70
	nop			;8c71
	nop			;8c72
	dec d			;8c73
	and b			;8c74
	nop			;8c75
	nop			;8c76
	ld a,(00050h)		;8c77
	nop			;8c7a
	ld (hl),l		;8c7b
	and b			;8c7c
	xor d			;8c7d
	xor d			;8c7e
	jp m,L_5551		;8c7f
	ld d,l			;8c82
	ld (hl),l		;8c83
	and b			;8c84
	xor d			;8c85
	xor d			;8c86
	jp m,L_5551		;8c87
	ld d,l			;8c8a
	ld (hl),l		;8c8b
	and b			;8c8c
	xor d			;8c8d
	xor d			;8c8e
	jp m,L_5551		;8c8f
	ld d,l			;8c92
	ld (hl),l		;8c93
	and b			;8c94
	xor d			;8c95
	xor d			;8c96
	jp m,05451h		;8c97
	ld d,l			;8c9a
	ld (hl),l		;8c9b
	and b			;8c9c
	xor c			;8c9d
	xor d			;8c9e
	jp m,L_5551		;8c9f
	sub l			;8ca2
	ld (hl),l		;8ca3
	and b			;8ca4
	xor d			;8ca5
	ld hl,(051fah)		;8ca6
	ld d,l			;8ca9
	ld d,l			;8caa
	ld (hl),l		;8cab
	and b			;8cac
	xor d			;8cad
	xor d			;8cae
	jp m,L_5551		;8caf
	ld d,l			;8cb2
	ld (hl),l		;8cb3
	and b			;8cb4
	xor d			;8cb5
	xor d			;8cb6
	jp m,L_5551		;8cb7
	ld d,l			;8cba
	ld (hl),l		;8cbb
	and b			;8cbc
	xor d			;8cbd
	xor d			;8cbe
	jp m,L_5551		;8cbf
	ld d,l			;8cc2
	ld (hl),l		;8cc3
	and e			;8cc4
	rst 38h			;8cc5
	rst 38h			;8cc6
	jp m,0ff57h		;8cc7
	rst 38h			;8cca
	push af			;8ccb
	xor a			;8ccc
	rst 38h			;8ccd
	rst 38h			;8cce
	jp m,L_5555		;8ccf
	ld d,l			;8cd2
	ld d,l			;8cd3
	xor d			;8cd4
	xor d			;8cd5
	xor d			;8cd6
	xor d			;8cd7
	ld d,l			;8cd8
	ld d,l			;8cd9
	ld d,l			;8cda
	ld d,l			;8cdb
	xor d			;8cdc
	xor d			;8cdd
	xor d			;8cde
	xor d			;8cdf
	ld d,l			;8ce0
	ld d,l			;8ce1
	ld d,l			;8ce2
	ld d,l			;8ce3
	xor d			;8ce4
	xor d			;8ce5
	xor d			;8ce6
	xor d			;8ce7
	ld d,l			;8ce8
	ld d,l			;8ce9
	ld d,l			;8cea
	ld d,l			;8ceb
	xor d			;8cec
	xor d			;8ced
	xor d			;8cee
	xor d			;8cef
	ld d,b			;8cf0
	nop			;8cf1
	nop			;8cf2
	dec d			;8cf3
	and b			;8cf4
	nop			;8cf5
	nop			;8cf6
	ld a,(00050h)		;8cf7
	nop			;8cfa
	ld (hl),l		;8cfb
	and b			;8cfc
	xor d			;8cfd
	xor d			;8cfe
	jp m,L_5551		;8cff
	ld d,l			;8d02
	ld (hl),l		;8d03
	and b			;8d04
	xor d			;8d05
	xor d			;8d06
	jp m,L_5551		;8d07
	ld d,l			;8d0a
	ld (hl),l		;8d0b
	and b			;8d0c
	xor d			;8d0d
	ld hl,(051fah)		;8d0e
	ld d,h			;8d11
	dec d			;8d12
	ld (hl),l		;8d13
	and b			;8d14
	xor b			;8d15
	ld a,(bc)		;8d16
	jp m,L_5051		;8d17
	dec b			;8d1a
	ld (hl),l		;8d1b
	and b			;8d1c
	xor a			;8d1d
	jp p,L_51FA		;8d1e
	ld c,a			;8d21
	push af			;8d22
	ld (hl),l		;8d23
	and b			;8d24
	and b			;8d25
	ld a,(bc)		;8d26
	jp m,L_5051		;8d27
	dec d			;8d2a
	ld (hl),l		;8d2b
	and b			;8d2c
	xor b			;8d2d
	ld hl,(051fah)		;8d2e
	ld d,h			;8d31
	ld d,l			;8d32
	ld (hl),l		;8d33
	and b			;8d34
	xor d			;8d35
	xor d			;8d36
	jp m,L_5551		;8d37
	ld d,l			;8d3a
	ld (hl),l		;8d3b
	and b			;8d3c
	xor d			;8d3d
	xor d			;8d3e
	jp m,L_5551		;8d3f
	ld d,l			;8d42
	ld (hl),l		;8d43
	and e			;8d44
	rst 38h			;8d45
	rst 38h			;8d46
	jp m,0ff57h		;8d47
	rst 38h			;8d4a
	push af			;8d4b
	xor a			;8d4c
	rst 38h			;8d4d
	rst 38h			;8d4e
	jp m,L_5555		;8d4f
	ld d,l			;8d52
	ld d,l			;8d53
	xor d			;8d54
	xor d			;8d55
	xor d			;8d56
	xor d			;8d57
	ld d,l			;8d58
	ld d,l			;8d59
	ld d,l			;8d5a
	ld d,l			;8d5b
	xor d			;8d5c
	xor d			;8d5d
	xor d			;8d5e
	xor d			;8d5f
	ld d,l			;8d60
	ld d,l			;8d61
	ld d,l			;8d62
	ld d,l			;8d63
	xor d			;8d64
	xor d			;8d65
	xor d			;8d66
	xor d			;8d67
	ld d,l			;8d68
	ld d,l			;8d69
	ld d,l			;8d6a
	ld d,l			;8d6b
	xor d			;8d6c
	xor d			;8d6d
	xor d			;8d6e
	xor d			;8d6f
	ld d,b			;8d70
	nop			;8d71
	nop			;8d72
	dec d			;8d73
	and b			;8d74
	nop			;8d75
	nop			;8d76
	ld a,(00050h)		;8d77
	nop			;8d7a
	ld (hl),l		;8d7b
	and b			;8d7c
	xor d			;8d7d
	ld d,l			;8d7e
	ld a,d			;8d7f
	ld d,c			;8d80
	ld d,h			;8d81
	ld hl,(0a0f5h)		;8d82
	xor b			;8d85
	dec d			;8d86
	ld a,d			;8d87
	ld d,c			;8d88
	ld d,b			;8d89
	ld a,(bc)		;8d8a
	push af			;8d8b
	and b			;8d8c
	and b			;8d8d
	dec b			;8d8e
	ld a,d			;8d8f
	ld d,c			;8d90
	ld b,b			;8d91
	ld (bc),a		;8d92
	push af			;8d93
	and b			;8d94
	add a,b			;8d95
	ld bc,0517ah		;8d96
	nop			;8d99
	nop			;8d9a
	push af			;8d9b
	and b			;8d9c
	rst 38h			;8d9d
	rst 38h			;8d9e
	ld a,d			;8d9f
	ld d,b			;8da0
	rst 38h			;8da1
	rst 38h			;8da2
	ld (hl),l		;8da3
	and c			;8da4
	nop			;8da5
	nop			;8da6
	jp m,L_8050		;8da7
	ld bc,0a175h		;8daa
	ld b,b			;8dad
	ld (bc),a		;8dae
	jp m,0a050h		;8daf
	dec b			;8db2
	ld (hl),l		;8db3
	and c			;8db4
	ld d,b			;8db5
	ld a,(bc)		;8db6
	jp m,L_A850		;8db7
	dec d			;8dba
	ld (hl),l		;8dbb
	and c			;8dbc
	ld d,h			;8dbd
	ld hl,(050fah)		;8dbe
	xor d			;8dc1
	ld d,l			;8dc2
	ld (hl),l		;8dc3
	and e			;8dc4
	rst 38h			;8dc5
	rst 38h			;8dc6
	jp m,0ff57h		;8dc7
	rst 38h			;8dca
	push af			;8dcb
	xor a			;8dcc
	rst 38h			;8dcd
	rst 38h			;8dce
	jp m,L_5555		;8dcf
	ld d,l			;8dd2
	ld d,l			;8dd3
	xor d			;8dd4
	xor d			;8dd5
	xor d			;8dd6
	xor d			;8dd7
	ld d,l			;8dd8
	ld d,l			;8dd9
	ld d,l			;8dda
	ld d,l			;8ddb
	xor d			;8ddc
	xor d			;8ddd
	xor d			;8dde
	xor d			;8ddf
	ld d,l			;8de0
	ld d,l			;8de1
	ld d,l			;8de2
	ld d,l			;8de3
	xor d			;8de4
	xor d			;8de5
	xor d			;8de6
	xor d			;8de7
	ld d,l			;8de8
	ld d,l			;8de9
	ld d,l			;8dea
	ld d,l			;8deb
	xor d			;8dec
	xor d			;8ded
	xor d			;8dee
	xor d			;8def
	ld d,b			;8df0
	nop			;8df1
	nop			;8df2
	dec d			;8df3
	and b			;8df4
	nop			;8df5
	nop			;8df6
	ld a,(00050h)		;8df7
	nop			;8dfa
	ld (hl),l		;8dfb
	and b			;8dfc
	xor d			;8dfd
	ld d,l			;8dfe
	ld a,d			;8dff
	ld d,c			;8e00
	ld d,h			;8e01
	ld hl,(0a0f5h)		;8e02
	xor b			;8e05
	dec d			;8e06
	ld a,d			;8e07
	ld d,c			;8e08
	ld d,b			;8e09
	ld a,(bc)		;8e0a
	push af			;8e0b
	and b			;8e0c
	and b			;8e0d
	dec b			;8e0e
	ld a,d			;8e0f
	ld d,c			;8e10
L_8E11:
	ld b,b			;8e11
	ld (bc),a		;8e12
	push af			;8e13
	and b			;8e14
	add a,b			;8e15
	add hl,bc		;8e16
L_8E17:
	ld a,d			;8e17
	ld d,c			;8e18
	nop			;8e19
	djnz L_8E11		;8e1a
	and b			;8e1c
	rst 38h			;8e1d
	jp nc,L_507A		;8e1e
	rst 38h			;8e21
	push de			;8e22
	ld (hl),l		;8e23
	and c			;8e24
	nop			;8e25
	ld (de),a		;8e26
	jp m,L_8050		;8e27
	add hl,bc		;8e2a
	ld (hl),l		;8e2b
	and c			;8e2c
	ld b,b			;8e2d
	ld (bc),a		;8e2e
	jp m,0a050h		;8e2f
	dec b			;8e32
	ld (hl),l		;8e33
	and c			;8e34
	ld d,b			;8e35
	ld a,(bc)		;8e36
	jp m,L_A850		;8e37
	dec d			;8e3a
	ld (hl),l		;8e3b
	and c			;8e3c
	ld d,h			;8e3d
	ld hl,(050fah)		;8e3e
	xor d			;8e41
	ld d,l			;8e42
	ld (hl),l		;8e43
	and e			;8e44
	rst 38h			;8e45
	rst 38h			;8e46
	jp m,0ff57h		;8e47
	rst 38h			;8e4a
	push af			;8e4b
	xor a			;8e4c
	rst 38h			;8e4d
	rst 38h			;8e4e
	jp m,L_5555		;8e4f
	ld d,l			;8e52
	ld d,l			;8e53
	xor d			;8e54
	xor d			;8e55
	xor d			;8e56
	xor d			;8e57
	ld d,l			;8e58
	ld d,l			;8e59
	ld d,l			;8e5a
	ld d,l			;8e5b
	xor d			;8e5c
	xor d			;8e5d
	xor d			;8e5e
	xor d			;8e5f
	ld d,l			;8e60
	ld d,l			;8e61
	ld d,l			;8e62
	ld d,l			;8e63
	xor d			;8e64
	xor d			;8e65
	xor d			;8e66
	xor d			;8e67
	ld d,l			;8e68
	ld d,l			;8e69
	ld d,l			;8e6a
	ld d,l			;8e6b
	xor d			;8e6c
	xor d			;8e6d
	xor d			;8e6e
	xor d			;8e6f
	ld d,b			;8e70
	nop			;8e71
	nop			;8e72
	dec d			;8e73
	and b			;8e74
	nop			;8e75
	nop			;8e76
	ld a,(00050h)		;8e77
	nop			;8e7a
	ld (hl),l		;8e7b
	and b			;8e7c
	xor d			;8e7d
	ld d,l			;8e7e
	ld a,d			;8e7f
	ld d,c			;8e80
	ld d,h			;8e81
	ld hl,(0a0f5h)		;8e82
	xor b			;8e85
	dec d			;8e86
	ld a,d			;8e87
	ld d,c			;8e88
	ld d,b			;8e89
	ld a,(de)		;8e8a
	push af			;8e8b
	and b			;8e8c
	and b			;8e8d
	dec b			;8e8e
	ld a,d			;8e8f
	ld d,c			;8e90
	ld b,b			;8e91
	ld a,(0a0f5h)		;8e92
	add a,b			;8e95
	ld b,c			;8e96
	ld a,d			;8e97
	ld d,c			;8e98
	nop			;8e99
	adc a,d			;8e9a
	push af			;8e9b
	and b			;8e9c
	cp 095h			;8e9d
	ld a,d			;8e9f
	ld d,b			;8ea0
	cp 0afh			;8ea1
	ld (hl),l		;8ea3
	and c			;8ea4
	nop			;8ea5
	sbc a,h			;8ea6
	jp m,L_8050		;8ea7
	ld l,c			;8eaa
	ld (hl),l		;8eab
	and c			;8eac
	ld b,b			;8ead
	ld a,(050fah)		;8eae
	and b			;8eb1
	dec b			;8eb2
	ld (hl),l		;8eb3
	and c			;8eb4
	ld d,b			;8eb5
	ld a,(de)		;8eb6
	jp m,L_A850		;8eb7
	dec d			;8eba
	ld (hl),l		;8ebb
	and c			;8ebc
	ld d,h			;8ebd
	ld hl,(050fah)		;8ebe
	xor d			;8ec1
	ld d,l			;8ec2
	ld (hl),l		;8ec3
	and e			;8ec4
	rst 38h			;8ec5
	rst 38h			;8ec6
	jp m,0ff57h		;8ec7
	rst 38h			;8eca
	push af			;8ecb
	xor a			;8ecc
	rst 38h			;8ecd
	rst 38h			;8ece
	jp m,L_5555		;8ecf
	ld d,l			;8ed2
	ld d,l			;8ed3
	xor d			;8ed4
	xor d			;8ed5
	xor d			;8ed6
	xor d			;8ed7
	ld d,l			;8ed8
	ld d,l			;8ed9
	ld d,l			;8eda
	ld d,l			;8edb
	xor d			;8edc
	xor d			;8edd
	xor d			;8ede
	xor d			;8edf
	ld d,l			;8ee0
	ld d,l			;8ee1
	ld d,l			;8ee2
	ld d,l			;8ee3
	xor d			;8ee4
	xor d			;8ee5
	xor d			;8ee6
	xor d			;8ee7
	ld d,l			;8ee8
	ld d,l			;8ee9
	ld d,l			;8eea
	ld d,l			;8eeb
	xor d			;8eec
	xor d			;8eed
	xor d			;8eee
	xor d			;8eef
	ld d,b			;8ef0
	nop			;8ef1
	nop			;8ef2
	dec d			;8ef3
	and b			;8ef4
	nop			;8ef5
	nop			;8ef6
	ld a,(00050h)		;8ef7
	nop			;8efa
	ld (hl),l		;8efb
	and b			;8efc
	xor d			;8efd
	ld d,l			;8efe
	ld a,d			;8eff
	ld d,c			;8f00
	ld d,l			;8f01
	xor d			;8f02
	push af			;8f03
	and b			;8f04
	xor c			;8f05
	sub l			;8f06
	ld a,d			;8f07
	ld d,c			;8f08
	ld d,c			;8f09
	adc a,d			;8f0a
	push af			;8f0b
	and b			;8f0c
	and b			;8f0d
	dec b			;8f0e
	ld a,d			;8f0f
	ld d,c			;8f10
	ld b,e			;8f11
	jp nz,0a0f5h		;8f12
	add a,h			;8f15
	ld hl,0517ah		;8f16
	ex af,af'		;8f19
	or b			;8f1a
	push af			;8f1b
	and b			;8f1c
	jp (hl)			;8f1d

; ----------------------------------------------------------------------
; DATOS tiles: de los niveles: 111 de 32x32, 128 bytes cada uno
;   0x6de0..0xa560  (14208 bytes)
; ----------------------------------------------------------------------
	defb 057h,07ah,050h,0eah,0f7h,075h,0a1h,009h,0d0h,0fah,050h,086h,0a1h,075h,0a1h,043h	; 8f1e  WzP..u....P..u.C

; ======================================================================
; CODIGO 0x8f2e..0x901f  (241 bytes)
; ======================================================================


L_8F2E:
	jp nz,L_50FA		;8f2e
	and b			;8f31
	dec b			;8f32
	ld (hl),l		;8f33
	and c			;8f34
	ld d,c			;8f35
	adc a,d			;8f36
	jp m,L_A950		;8f37
	sub l			;8f3a
	ld (hl),l		;8f3b
	and c			;8f3c
	ld d,l			;8f3d
	xor d			;8f3e
	jp m,L_AA50		;8f3f
	ld d,l			;8f42
	ld (hl),l		;8f43
	and e			;8f44
	rst 38h			;8f45
	rst 38h			;8f46
	jp m,0ff57h		;8f47
	rst 38h			;8f4a
	push af			;8f4b
	xor a			;8f4c
	rst 38h			;8f4d
	rst 38h			;8f4e
	jp m,L_5555		;8f4f
	ld d,l			;8f52
	ld d,l			;8f53
	xor d			;8f54
	xor d			;8f55
	xor d			;8f56
	xor d			;8f57
	ld d,l			;8f58
	ld d,l			;8f59
	ld d,l			;8f5a
	ld d,l			;8f5b
	xor d			;8f5c
	xor d			;8f5d
	xor d			;8f5e
	xor d			;8f5f
	nop			;8f60
	ld bc,00000h		;8f61
	ld a,a			;8f64
	call m,0febfh		;8f65
	ld b,b			;8f68
	inc b			;8f69
	jr nz,L_8F72		;8f6a
	ld b,e			;8f6c
	ld (hl),d		;8f6d
	ld c,(hl)		;8f6e
	adc a,040h		;8f6f
	ld (bc),a		;8f71
L_8F72:
	ld b,b			;8f72
	ld e,057h		;8f73
	rst 38h			;8f75
	rst 38h			;8f76
	jp m,00054h		;8f77
	nop			;8f7a
	ld e,d			;8f7b
	ld b,h			;8f7c
	nop			;8f7d
	nop			;8f7e
L_8F7F:
	sbc a,044h		;8f7f
	rst 38h			;8f81
	defb 0fdh,0deh,054h ;illegal sequence	;8f82
	xor d			;8f85
	xor c			;8f86
	jp c,L_D554		;8f87
	ld d,l			;8f8a
	jp c,0a054h		;8f8b
	add hl,sp		;8f8e
	jp c,L_C044		;8f8f
	ld (hl),l		;8f92
	sbc a,064h		;8f93
	and a			;8f95
	cp c			;8f96
	sbc a,01ch		;8f97
	push bc			;8f99
	dec (hl)		;8f9a
	ret c			;8f9b
	add a,h			;8f9c
	and (hl)		;8f9d
	cp c			;8f9e
	jp nz,L_C544		;8f9f
	dec (hl)		;8fa2
	pop bc			;8fa3
	inc e			;8fa4
	and b			;8fa5
	add hl,sp		;8fa6
	ret c			;8fa7
	ld h,h			;8fa8
	rst 0			;8fa9
	push af			;8faa
	sbc a,044h		;8fab
	xor a			;8fad
	ld sp,hl		;8fae
	sbc a,054h		;8faf
	push de			;8fb1
	ld d,l			;8fb2
	jp c,L_AA54		;8fb3
	xor c			;8fb6
	jp c,00044h		;8fb7   ; BIOS ENASCR - Displays the screen
	ld bc,054deh		;8fba
	rst 38h			;8fbd
	rst 38h			;8fbe
	jp c,0ff55h		;8fbf
	rst 38h			;8fc2
	jp c,0ff57h		;8fc3
	rst 38h			;8fc6
	jp c,00044h		;8fc7   ; BIOS ENASCR - Displays the screen
	nop			;8fca
	ld e,04fh		;8fcb
	cp 07fh			;8fcd
	cp 05fh			;8fcf
	cp 07fh			;8fd1
	cp 072h			;8fd3
	ld c,h			;8fd5
	ld (07f4eh),a		;8fd6
	defb 0fdh,03fh,0feh ;illegal sequence	;8fd9
	nop			;8fdc
	nop			;8fdd
	add a,b			;8fde
	nop			;8fdf
	nop			;8fe0
	ld bc,00000h		;8fe1
	ld a,a			;8fe4
	call m,0febfh		;8fe5
	ld b,b			;8fe8
	inc b			;8fe9
	jr nz,L_8FF2		;8fea
	ld b,e			;8fec
	ld (hl),d		;8fed
	ld c,(hl)		;8fee
	adc a,040h		;8fef
	ld (bc),a		;8ff1
L_8FF2:
	ld b,b			;8ff2
	ld e,057h		;8ff3
	rst 38h			;8ff5
	rst 38h			;8ff6
	cp 054h			;8ff7
	nop			;8ff9
	nop			;8ffa
	ld e,(hl)		;8ffb
	ld b,h			;8ffc
	nop			;8ffd
	nop			;8ffe
	sbc a,044h		;8fff
	rst 38h			;9001
	defb 0fdh,0deh,044h ;illegal sequence	;9002
	xor d			;9005
	xor c			;9006
	jp c,L_D544		;9007
	ld d,l			;900a
	jp c,L_BF44		;900b
	jp (hl)			;900e
L_900F:
	jp c,L_DF44		;900f
	push bc			;9012
	sbc a,064h		;9013
	cp b			;9015
	ld c,c			;9016
	sbc a,01ch		;9017
	exx			;9019
	ld b,l			;901a
	ret c			;901b
	add a,h			;901c
	cp d			;901d
	ret			;901e

; ----------------------------------------------------------------------
; DATOS tiles: de los niveles: 111 de 32x32, 128 bytes cada uno
;   0x6de0..0xa560  (14208 bytes)
; ----------------------------------------------------------------------
	defb 0c2h,044h,0d9h,045h,0c1h,01ch,0bbh,0c9h,0d8h,064h,0d8h,005h,0deh,044h,0b0h,009h	; 901f  .D.E.....d...D..
	defb 0deh,054h,0d5h,055h,0dah,054h,0aah,0a9h,0dah,044h,000h,001h,0deh,054h,0ffh,0ffh	; 902f  .T.U.T...D...T..
	defb 0dah,055h,0ffh,0ffh,0dah,057h,0ffh,0ffh,0dah,044h,000h,000h,01eh,04fh,0feh,07fh	; 903f  .U...W...D...O..
	defb 0feh,05fh,0feh,07fh,0feh,072h,04ch,033h,0ceh,07fh,0fdh,03fh,0feh,000h,000h,080h	; 904f  ._...rL3...?....
	defb 000h,055h,05fh,0f5h,055h,080h,0bfh,0e2h,002h,001h,0ddh,044h,007h,08bh,0bah,0a2h	; 905f  .U_.U......D....
	defb 02eh,015h,0ddh,044h,057h,0bfh,0bah,0a2h,0feh,07fh,0ddh,045h,0ffh,0aah,0bah,0a2h	; 906f  ...DW......E....
	defb 0aah,0ffh,0fdh,047h,0ffh,0ffh,0fah,0afh,0feh,0ffh,0ffh,0ffh,0fch,0eah,0aah,0aah	; 907f  ...G............
	defb 0a8h,0f0h,000h,000h,000h,0e3h,0ffh,0ffh,0c8h,0f2h,000h,000h,040h,0e2h,0eeh,077h	; 908f  ............@..w
	defb 048h,0f2h,0eeh,077h,040h,0e2h,000h,000h,048h,0f3h,0ffh,0ffh,0c0h,0e0h,000h,000h	; 909f  H..w@...H.......
	defb 008h,0f5h,055h,055h,050h,0e0h,000h,000h,000h,0c0h,005h,040h,000h,080h,00ah,0a0h	; 90af  ..UUP......@....
	defb 000h,055h,05dh,045h,055h,080h,0bah,0a2h,002h,001h,0ddh,044h,007h,08bh,0bah,0a2h	; 90bf  .U]EU......D....
	defb 02eh,015h,0ddh,044h,057h,0bfh,0bah,0a2h,0feh,07fh,0d0h,005h,0ffh,0aah,0a0h,002h	; 90cf  ...DW...........
	defb 0aah,055h,055h,055h,055h,0abh,0ffh,0ffh,0eah,054h,000h,000h,015h,0a9h,0ffh,0ffh	; 90df  .UUUU....T......
	defb 0cah,053h,0ffh,0ffh,025h,0a6h,0aah,0aah,092h,067h,07fh,0ffh,04fh,0a6h,0c0h,001h	; 90ef  .S..%....g..O...
	defb 08eh,067h,055h,055h,04fh,0a6h,0cfh,0f9h,08eh,067h,050h,005h,04fh,0a6h,0cfh,0f9h	; 90ff  .gUUO....gP.O...
	defb 08eh,067h,055h,055h,04fh,0a6h,0c0h,001h,08eh,053h,07fh,0ffh,05dh,0aah,0aah,0aah	; 910f  .gUUO....S..]...
	defb 09ah,05fh,000h,000h,03dh,0afh,080h,000h,0fah,057h,0ffh	; 911f  ._..=....W.

; ======================================================================
; CODIGO 0x912a..0x946d  (835 bytes)
; ======================================================================


L_912A:
	rst 38h			;912a
	push af			;912b
	xor e			;912c
	cp 0ffh			;912d
	jp pe,L_FD55		;912f
	ld a,a			;9132
	push de			;9133
	or d			;9134
	xor b			;9135
	jp m,L_55B2		;9136
	ld e,l			;9139
L_913A:
	ld (hl),l		;913a
	ld d,l			;913b
	or e			;913c
	jr z,L_913A		;913d
	ld (05d55h),a		;913f
L_9142:
	ld (hl),l		;9142
	ld d,l			;9143
	or e			;9144
	jr z,L_9142		;9145
	ld (05d55h),a		;9147
	ld (hl),l		;914a
	ld d,l			;914b
	xor d			;914c
	cp a			;914d
	jp m,057aah		;914e
	jp po,L_F5BF		;9151
	cp h			;9154
	dec b			;9155
	ld d,a			;9156
	cp 0ffh			;9157
	rst 38h			;9159
	rst 38h			;915a
	rst 38h			;915b
	nop			;915c
	nop			;915d
	nop			;915e
	nop			;915f
	ld d,l			;9160
	ld b,b			;9161
	dec b			;9162
	ld d,l			;9163
	xor d			;9164
	adc a,a			;9165
	ret p			;9166
	xor d			;9167
	ld d,h			;9168
	jr nc,L_9177		;9169
	ld d,l			;916b
	xor b			;916c
	ret nz			;916d
	inc bc			;916e
	ld hl,(00051h)		;916f
	nop			;9172
	sub l			;9173
	and d			;9174
	ld (bc),a		;9175
	and h			;9176
L_9177:
	jp z,01544h		;9177
	ld d,c			;917a
	ld h,l			;917b
	adc a,b			;917c
	cpl			;917d
	jp pe,L_50B2		;917e
	ld e,h			;9181
	or l			;9182
	exx			;9183
	sub b			;9184
	or c			;9185
	ld l,0f8h		;9186
	ld hl,04762h		;9188
	ld a,l			;918b
	ld (08bc4h),hl		;918c
	cp h			;918f
	ld b,c			;9190
	adc a,c			;9191
	inc de			;9192
	ld a,(hl)		;9193
	ld b,d			;9194
	sub d			;9195
	dec h			;9196
	cp (hl)			;9197
	ld b,l			;9198
	and h			;9199
	ld c,c			;919a
	sbc a,043h		;919b
	ld c,b			;919d
	sub c			;919e
	cp (hl)			;919f
	ld b,l			;91a0
	sub c			;91a1
	ld (043deh),hl		;91a2
	ld (0be44h),hl		;91a5
	ld b,l			;91a8
	call nz,L_DE89		;91a9
	ld b,d			;91ac
	adc a,c			;91ad
	inc de			;91ae
	cp (hl)			;91af
	ld hl,02592h		;91b0
	ld a,h			;91b3
	and h			;91b4
	call po,L_BC4B		;91b5
	ld de,09f68h		;91b8
	ld a,c			;91bb
	sub d			;91bc
	cp c			;91bd
	ld a,(049fah)		;91be
	ld e,a			;91c1
	push af			;91c2
	pop af			;91c3
	and (hl)		;91c4
	jp pe,L_E2AB		;91c5
	ld d,e			;91c8
	or l			;91c9
	ld e,a			;91ca
	push bc			;91cb
	xor c			;91cc
	rst 38h			;91cd
	rst 38h			;91ce
	adc a,d			;91cf
	ld d,h			;91d0
	rst 38h			;91d1
	rst 38h			;91d2
	dec d			;91d3
	xor d			;91d4
	ccf			;91d5
	call m,L_552A		;91d6
	rrca			;91d9
	pop af			;91da
	ld d,l			;91db
	xor d			;91dc
	and b			;91dd
	ld (bc),a		;91de
	xor d			;91df
	ld d,l			;91e0
	ld d,l			;91e1
	ld d,l			;91e2
	ld d,l			;91e3
	xor d			;91e4
	xor d			;91e5
	xor d			;91e6
	xor d			;91e7
	ld d,l			;91e8
	rst 38h			;91e9
	rst 38h			;91ea
	rst 38h			;91eb
	xor e			;91ec
	rst 38h			;91ed
	rst 38h			;91ee
	rst 38h			;91ef
	ld d,a			;91f0
	ld d,l			;91f1
	ld d,l			;91f2
	ld d,l			;91f3
	xor (hl)		;91f4
	xor d			;91f5
	xor d			;91f6
	xor d			;91f7
	ld e,l			;91f8
	ld d,l			;91f9
	ld d,l			;91fa
	ld d,l			;91fb
	cp d			;91fc
	xor b			;91fd
	nop			;91fe
	ld hl,(05075h)		;91ff
	nop			;9202
	ld (hl),l		;9203
	cp d			;9204
	and d			;9205
	xor d			;9206
	cp d			;9207
	ld (hl),l		;9208
	ld b,l			;9209
	ld d,l			;920a
	ld e,l			;920b
	cp d			;920c
	adc a,d			;920d
	cp 0aeh			;920e
	ld (hl),l		;9210
	rla			;9211
	rst 10h			;9212
	rst 10h			;9213
	cp d			;9214
	ld l,0aah		;9215
	ex de,hl		;9217
	ld (hl),h		;9218
	ld e,l			;9219
	ld d,l			;921a
	ld (hl),l		;921b
	cp b			;921c
	cp d			;921d
	xor d			;921e
	cp d			;921f
	ld (hl),c		;9220
	ld (hl),l		;9221
	ld d,l			;9222
	lddr			;9223
	jp pe,L_BEAA		;9225
	ld (hl),c		;9228
	ld d,l			;9229
	ld a,a			;922a
	push af			;922b
	cp b			;922c
	jp pe,L_BEC6		;922d
	ld (hl),c		;9230
	push de			;9231
	cp e			;9232
	rst 38h			;9233
	cp b			;9234
	xor e			;9235
	ld a,l			;9236
	cp 071h			;9237
	push de			;9239
	ld a,l			;923a
	rst 38h			;923b
	cp b			;923c
	xor e			;923d
	ld a,l			;923e
	cp 071h			;923f
	rst 10h			;9241
L_9242:
	cp e			;9242
	rst 38h			;9243
	cp b			;9244
	jp pe,0fec7h		;9245
	ld (hl),c		;9248
	ld d,a			;9249
	cp a			;924a
	defb 0fdh,0b8h,0fah ;illegal sequence	;924b
	rst 38h			;924e
	cp 071h			;924f
	ld (hl),a		;9251
	rst 38h			;9252
	defb 0fdh,0b8h,0bbh ;illegal sequence	;9253
	rst 38h			;9256
	jp m,05e74h		;9257
	rst 38h			;925a
	push af			;925b
	cp d			;925c
	cpl			;925d
	rst 38h			;925e
	ex de,hl		;925f
	ld d,l			;9260
	ld d,l			;9261
	ld d,l			;9262
	ld d,l			;9263
	xor d			;9264
	xor d			;9265
	xor d			;9266
	xor d			;9267
	rst 38h			;9268
	rst 38h			;9269
	rst 38h			;926a
	ld d,l			;926b
	rst 38h			;926c
	rst 38h			;926d
	cp 02ah			;926e
	ld d,l			;9270
	ld d,l			;9271
	ld d,l			;9272
	dec d			;9273
	xor d			;9274
	xor d			;9275
	xor d			;9276
	adc a,d			;9277
	ld d,l			;9278
	ld d,l			;9279
	ld d,l			;927a
	ld b,l			;927b
	xor b			;927c
	xor d			;927d
	xor d			;927e
	jp po,00057h		;927f
	nop			;9282
	ld de,030aah		;9283
	inc c			;9286
	and d			;9287
	ld d,l			;9288
	inc (hl)		;9289
	inc l			;928a
	ld d,c			;928b
	xor d			;928c
	inc (hl)		;928d
	inc l			;928e
	and d			;928f
	ld d,l			;9290
	inc (hl)		;9291
	inc l			;9292
	ld d,c			;9293
	xor b			;9294
	inc (hl)		;9295
	inc l			;9296
	jp po,034d7h		;9297
	inc l			;929a
	ld de,004eah		;929b
	jr nz,L_9242		;929e
	ld (hl),l		;92a0
	inc b			;92a1
	jr nz,L_92F5		;92a2
	jp pe,02004h		;92a4
	and d			;92a7
	ld (hl),l		;92a8
	inc (hl)		;92a9
L_92AA:
	inc l			;92aa
	ld d,c			;92ab
	ret pe			;92ac
	inc (hl)		;92ad
	inc l			;92ae
	jp po,03477h		;92af
	inc l			;92b2
	ld de,034eah		;92b3
	inc l			;92b6
	and d			;92b7
	ld (hl),l		;92b8
	inc (hl)		;92b9
	inc l			;92ba
	ld d,c			;92bb
	jp pe,02c34h		;92bc
	and d			;92bf
	ld (hl),l		;92c0
	inc (hl)		;92c1
	inc l			;92c2
	ld d,c			;92c3
	ret pe			;92c4
	inc b			;92c5
	jr nz,L_92AA		;92c6
	ld (hl),a		;92c8
	inc b			;92c9
	jr nz,L_92DD		;92ca
	jp pe,02004h		;92cc
	and d			;92cf
	ld (hl),l		;92d0
	inc (hl)		;92d1
	inc l			;92d2
	ld d,c			;92d3
	jp pe,02c34h		;92d4
	and d			;92d7
	push de			;92d8
	inc (hl)		;92d9
	inc l			;92da
	ld d,c			;92db
	xor b			;92dc
L_92DD:
	inc (hl)		;92dd
	inc l			;92de
	jp po,L_5555		;92df
	nop			;92e2
	nop			;92e3
	and b			;92e4
	ld hl,(0ff1fh)		;92e5
	ld b,b			;92e8
	ld (hl),h		;92e9
	ld a,a			;92ea
	rst 38h			;92eb
	adc a,d			;92ec
	ret pe			;92ed
	rst 38h			;92ee
	rst 38h			;92ef
	rla			;92f0
	pop de			;92f1
	ret z			;92f2
	nop			;92f3
	adc a,a			;92f4
L_92F5:
	and e			;92f5
	sbc a,b			;92f6
	ld de,0471fh		;92f7
	inc b			;92fa
	ld de,08e8eh		;92fb
	inc c			;92fe
	rra			;92ff
	dec e			;9300
	inc e			;9301
	ld (bc),a		;9302
	inc c			;9303
	sbc a,d			;9304
	jr c,L_933D		;9305
	ld a,a			;9307
	inc d			;9308
	ld (hl),b		;9309
	ld sp,0a87fh		;930a
	ret po			;930d
	inc sp			;930e
	nop			;930f
	ld d,c			;9310
	rst 0			;9311
	ret po			;9312
	add a,b			;9313
	and e			;9314
	add a,a			;9315
	pop de			;9316
	add a,b			;9317
	ld b,a			;9318
	ld b,020h		;9319
	ld b,b			;931b
	adc a,(hl)		;931c
	ld b,010h		;931d
	ret nz			;931f
	inc e			;9320
L_9321:
	ld e,020h		;9321
	jr nz,L_935D		;9323
	ld d,010h		;9325
	ld h,b			;9327
	jr nc,L_9340		;9328
	or b			;932a
	djnz $+118		;932b
	rla			;932d
	ld (hl),b		;932e
	jr nc,$+127		;932f
	djnz L_9363		;9331
	dec d			;9333
	ld (hl),e		;9334
	ld b,b			;9335
	jr nc,$+65		;9336
	ld (hl),b		;9338
	ret nc			;9339
	jr nc,L_939C		;933a
	ld (hl),b		;933c
L_933D:
	inc (hl)		;933d
	jr nc,L_9381		;933e
L_9340:
	ld (hl),b		;9340
	dec c			;9341
	ld de,07080h		;9342
	inc bc			;9345
	ld b,c			;9346
	dec a			;9347
	halt			;9348
	djnz L_9321		;9349
	ld a,h			;934b
	ld (hl),d		;934c
	djnz L_938B		;934d
	add a,l			;934f
	ld (hl),d		;9350
	ld a,a			;9351
	adc a,h			;9352
	add a,h			;9353
L_9354:
	ld (hl),d		;9354
	ld b,b			;9355
	inc h			;9356
	add a,c			;9357
	ld (hl),d		;9358
	ld b,b			;9359
	inc l			;935a
	ld (bc),a		;935b
	ld (hl),d		;935c
L_935D:
	ld b,(hl)		;935d
	dec h			;935e
	ld d,l			;935f
	nop			;9360
	nop			;9361
	ld d,l			;9362
L_9363:
	ld d,l			;9363
	rst 38h			;9364
	call m,00a20h		;9365
	rst 38h			;9368
	rst 38h			;9369
	djnz L_9389		;936a
L_936C:
	rst 38h			;936c
	rst 38h			;936d
	adc a,b			;936e
	xor (hl)		;936f
	nop			;9370
	rra			;9371
	call nz,00017h		;9372
	add hl,bc		;9375
	jp po,0000eh		;9376
	jr nc,L_936C		;9379
	rlca			;937b
	nop			;937c
	djnz L_93F7		;937d
	adc a,(hl)		;937f
	nop			;9380
L_9381:
	ld h,b			;9381
	inc a			;9382
	ld b,a			;9383
	ret p			;9384
	jr nz,L_93A5		;9385
	ld h,0feh		;9387
L_9389:
	rst 8			;9389
	adc a,a			;938a
L_938B:
	rla			;938b
	jr nc,L_93CE		;938c
	add a,a			;938e
	adc a,d			;938f
	dec a			;9390
	sbc a,(hl)		;9391
	add a,e			;9392
	push bc			;9393
	jr c,L_9354		;9394
	add a,c			;9396
	jp po,00633h		;9397
	add a,b			;939a
	pop af			;939b
L_939C:
	ld sp,0fe3eh		;939c
	ld a,b			;939f
	ld (hl),03eh		;93a0
	ld bc,0223ch		;93a2
L_93A5:
	scf			;93a5
	defb 0fdh,09ch ;sbc a,iyh	;93a6
L_93A8:
	inc l			;93a8
	scf			;93a9
	defb 0fdh,00eh,004h ;illegal sequence	;93aa
	jr nc,L_93BB		;93ad
	ld l,05ch		;93af
	jr nc,L_93BB		;93b1
	cp (hl)			;93b3
	call m,00230h		;93b4
	adc a,082h		;93b7
	jr nc,$+13		;93b9
L_93BB:
	ld c,0b3h		;93bb
	jr nc,L_93EB		;93bd
	ld c,0b0h		;93bf
	sub b			;93c1
	or c			;93c2
	ld c,0b0h		;93c3
	jp nz,00ec5h		;93c5
	or b			;93c8
	dec hl			;93c9
	dec c			;93ca
	ld c,081h		;93cb
	inc a			;93cd
L_93CE:
	dec c			;93ce
	ld c,003h		;93cf
L_93D1:
	sub c			;93d1
	dec c			;93d2
	ld c,046h		;93d3
	ld sp,00e8dh		;93d5
	and b			;93d8
	djnz L_93A8		;93d9
	ld c,0eah		;93db
	or b			;93dd
	call 0ff0eh		;93de
	rst 38h			;93e1
	rst 38h			;93e2
	rst 38h			;93e3
	rst 38h			;93e4
	rst 38h			;93e5
	rst 38h			;93e6
	rst 38h			;93e7
	ret m			;93e8
	rrca			;93e9
	nop			;93ea
L_93EB:
	ret p			;93eb
	call m,L_8007		;93ec
	ld (hl),b		;93ef
	rst 18h			;93f0
	rst 38h			;93f1
	rst 38h			;93f2
	rst 38h			;93f3
	ret z			;93f4
	nop			;93f5
	nop			;93f6
L_93F7:
	nop			;93f7
	set 7,a			;93f8
	rst 38h			;93fa
	rst 38h			;93fb
	srl h			;93fc
	inc a			;93fe
	inc a			;93ff
	jp z,0ffffh		;9400   ; BIOS SLTSL - Access address to selection register of secondary slots. (Available in extended slots only.)
	rst 38h			;9403
	jp z,00080h		;9404
	nop			;9407
	jp pe,0ffbfh		;9408
	rst 38h			;940b
	ei			;940c
	and (hl)		;940d
	ld h,(hl)		;940e
	ld h,(hl)		;940f
	ei			;9410
	cp c			;9411
	sbc a,c			;9412
	sbc a,c			;9413
	res 4,(hl)		;9414
	ld h,(hl)		;9416
	ld h,(hl)		;9417
	jp z,L_99B9		;9418
	sbc a,c			;941b
	jp z,000a6h		;941c
	ld h,b			;941f
L_9420:
	jp z,L_81B9		;9420
	sbc a,b			;9423
	jp z,000a6h		;9424
	ld h,b			;9427
	res 7,c			;9428
	sbc a,c			;942a
	sbc a,c			;942b
	ei			;942c
	and (hl)		;942d
	ld h,(hl)		;942e
	ld h,(hl)		;942f
	ei			;9430
	cp c			;9431
	sbc a,c			;9432
	sbc a,c			;9433
	jp pe,000a0h		;9434   ; BIOS PSG_ADDR - PSG AY-3-8910: selector de registro
	nop			;9437
	jp z,00080h		;9438
	nop			;943b
	jp z,0ffffh		;943c   ; BIOS SLTSL - Access address to selection register of secondary slots. (Available in extended slots only.)
	rst 38h			;943f
	srl h			;9440
	inc a			;9442
	inc a			;9443
	set 7,a			;9444
	rst 38h			;9446
	rst 38h			;9447
	ret z			;9448
	nop			;9449
	nop			;944a
	nop			;944b
	ret c			;944c
	nop			;944d
	nop			;944e
	nop			;944f
	di			;9450
	call m,L_8F7F		;9451
	rst 20h			;9454
	ret m			;9455
	rst 38h			;9456
	rrca			;9457
	ret nz			;9458
	nop			;9459
	nop			;945a
	nop			;945b
	add a,b			;945c
	nop			;945d
	nop			;945e
	nop			;945f
	rst 38h			;9460
	rst 38h			;9461
	rst 38h			;9462
	cp 0ffh			;9463
	rst 38h			;9465
	rst 38h			;9466
	call m,0000fh		;9467
	ret p			;946a
	jr $+16			;946b

; ----------------------------------------------------------------------
; DATOS tiles: de los niveles: 111 de 32x32, 128 bytes cada uno
;   0x6de0..0xa560  (14208 bytes)
; ----------------------------------------------------------------------
	defb 001h,0e0h,030h,0ffh,0ffh,0ffh,0e4h,000h,000h,000h,00ch,0ffh,0ffh,0ffh	; 946d  ..0...........

; ======================================================================
; CODIGO 0x947b..0x9527  (172 bytes)
; ======================================================================


L_947B:
	call z,03c3ch		;947b
	inc a			;947e
	call z,0ffffh		;947f   ; BIOS SLTSL - Access address to selection register of secondary slots. (Available in extended slots only.)
	rst 38h			;9482
	ld c,h			;9483
	nop			;9484
	nop			;9485
	ld bc,0ff4ch		;9486
	rst 38h			;9489
	defb 0fdh,048h,066h ;illegal sequence	;948a
	ld h,(hl)		;948d
	ld h,c			;948e
	ret nz			;948f
	sbc a,c			;9490
	sbc a,c			;9491
	sbc a,c			;9492
	ret nz			;9493
	ld h,(hl)		;9494
	ld h,(hl)		;9495
	ld h,c			;9496
	call z,L_9999		;9497
	sbc a,c			;949a
	ld c,h			;949b
	ld b,000h		;949c
	ld h,c			;949e
	ld c,h			;949f
	add hl,de		;94a0
	add a,c			;94a1
	sbc a,c			;94a2
	ld c,h			;94a3
	ld b,000h		;94a4
	ld h,c			;94a6
	ld c,h			;94a7
	sbc a,c			;94a8
	sbc a,c			;94a9
	sbc a,c			;94aa
	call z,06666h		;94ab
	ld h,c			;94ae
	ret nz			;94af
	sbc a,c			;94b0
	sbc a,c			;94b1
	sbc a,c			;94b2
	ret nz			;94b3
	nop			;94b4
	nop			;94b5
	ld bc,00048h		;94b6
	nop			;94b9
	ld bc,0ff4ch		;94ba
	rst 38h			;94bd
	rst 38h			;94be
	ld c,h			;94bf
	inc a			;94c0
	inc a			;94c1
	inc a			;94c2
	call z,0ffffh		;94c3   ; BIOS SLTSL - Access address to selection register of secondary slots. (Available in extended slots only.)
	rst 38h			;94c6
	call z,00000h		;94c7   ; BIOS CHKRAM - Tests RAM and sets RAM slot for the system  [alias: STARTUP, RESET, BOOT]
	nop			;94ca
	inc c			;94cb
	nop			;94cc
	nop			;94cd
	nop			;94ce
	inc b			;94cf
	pop af			;94d0
	cp 03fh			;94d1
	ret nz			;94d3
	ret p			;94d4
	rst 38h			;94d5
	rra			;94d6
	ret po			;94d7
	nop			;94d8
	nop			;94d9
	nop			;94da
	nop			;94db
	nop			;94dc
	nop			;94dd
	nop			;94de
	nop			;94df
	ld d,l			;94e0
	ld d,l			;94e1
	ld d,l			;94e2
	ld d,l			;94e3
	or d			;94e4
	sra h			;94e5
	and b			;94e7
	ld d,l			;94e8
	ld d,l			;94e9
	ld d,l			;94ea
	ld b,b			;94eb
	and b			;94ec
	nop			;94ed
	xor d			;94ee
L_94EF:
	adc a,d			;94ef
	ld b,b			;94f0
	ld bc,01555h		;94f1
	jp po,0aaabh		;94f4
	cpl			;94f7
	dec b			;94f8
	ld d,l			;94f9
	call nc,L_A35F		;94fa
	jp m,L_BAE8		;94fd
	ld b,l			;9500
	pop af			;9501
	ld (hl),c		;9502
	ld (hl),h		;9503
	and e			;9504
	xor b			;9505
	or d			;9506
	jp (hl)			;9507
L_9508:
	ld b,l			;9508
	call nc,L_D355		;9509
	ex (sp),hl		;950c
	xor d			;950d
	dec hl			;950e
	and a			;950f
	dec b			;9510
	push de			;9511
	rla			;9512
	ld c,a			;9513
	and e			;9514
	xor d			;9515
	ld l,09fh		;9516
	ld b,l			;9518
	call nc,03f5dh		;9519
	and d			;951c
	ret pe			;951d
	cp d			;951e
	ld a,a			;951f
	ld d,c			;9520
	ld (hl),c		;9521
	ld (hl),h		;9522
	rst 38h			;9523
	ret pe			;9524
	or d			;9525
	jp (hl)			;9526

; ----------------------------------------------------------------------
; DATOS tiles: de los niveles: 111 de 32x32, 128 bytes cada uno
;   0x6de0..0xa560  (14208 bytes)
; ----------------------------------------------------------------------
	defb 0fbh,014h,055h,0d3h,0f3h,0aah,02bh,0a9h,0e3h,055h,017h,054h,0c7h,0aah,02eh,08ah	; 9527  ..U...+..U.T....
	defb 06fh	; 9537  o

; ======================================================================
; CODIGO 0x9538..0x9546  (14 bytes)
; ======================================================================


L_9538:
	ld d,h			;9538
	ld e,l			;9539
	dec h			;953a
	ld a,0e8h		;953b
	cp d			;953d
	ld (hl),d		;953e
	sbc a,h			;953f
	ld de,0f974h		;9540
	ld c,c			;9543
	and d			;9544
	jp (hl)			;9545

; ----------------------------------------------------------------------
; DATOS tiles: de los niveles: 111 de 32x32, 128 bytes cada uno
;   0x6de0..0xa560  (14208 bytes)
; ----------------------------------------------------------------------
	defb 0fch,0a2h,045h,0d3h,0f6h,054h,08bh,0a7h,0e3h,028h,017h	; 9546  ..E..T...(.

; ======================================================================
; CODIGO 0x9551..0x95cd  (124 bytes)
; ======================================================================


L_9551:
	ld c,a			;9551
	rst 0			;9552
	sub c			;9553
	adc a,(hl)		;9554
	sbc a,a			;9555
	adc a,a			;9556
	ld (03f17h),hl		;9557
	cp 045h			;955a
	adc a,(hl)		;955c
	ccf			;955d
	call m,L_558B		;955e
	ld d,l			;9561
	ld d,l			;9562
	ld d,l			;9563
	ld (bc),a		;9564
	sra h			;9565
	or d			;9567
	dec b			;9568
	ld d,l			;9569
	ld d,l			;956a
	ld d,l			;956b
	xor (hl)		;956c
	xor d			;956d
	add a,b			;956e
	ld a,(bc)		;956f
	ld d,a			;9570
	ld d,l			;9571
	nop			;9572
	rra			;9573
	ei			;9574
	xor d			;9575
L_9576:
	ld hl,(0f5b8h)		;9576
	call nc,05d55h		;9579
	and d			;957c
	ret pe			;957d
	cp a			;957e
	cp d			;957f
	ld d,c			;9580
	ld (hl),c		;9581
L_9582:
	ld a,a			;9582
	ld e,l			;9583
L_9584:
	jr z,$-76		;9584
	jp pe,L_943A		;9586
	ld d,l			;9589
	call nc,L_CA5F		;958a
	dec hl			;958d
	xor d			;958e
	jr c,L_9576		;958f
	rla			;9591
	ld d,h			;9592
	ld e,l			;9593
	jp p,0aa8bh		;9594
	ld a,(045f9h)		;9597
	call nc,L_FC5D		;959a
	and d			;959d
	ret pe			;959e
	cp d			;959f
	cp 051h			;95a0
	ld (hl),c		;95a2
	ld (hl),a		;95a3
	rst 18h			;95a4
	jr z,$-76		;95a5
	ret pe			;95a7
	rst 8			;95a8
	sub h			;95a9
	ld d,l			;95aa
	push de			;95ab
	rst 0			;95ac
	ld hl,(0aa2bh)		;95ad
	jp po,01755h		;95b0
	ld d,l			;95b3
	call p,L_8BA2		;95b4
	xor d			;95b7
	ld sp,hl		;95b8
	ld c,c			;95b9
	ld b,l			;95ba
	rst 10h			;95bb
	ld (hl),d		;95bc
	sbc a,h			;95bd
	and d			;95be
	ret pe			;95bf
	dec h			;95c0
	ld a,051h		;95c1
	ld (hl),l		;95c3
	adc a,d			;95c4
	ld a,a			;95c5
	jr z,L_9582		;95c6
	call nc,L_94EF		;95c8
	ld e,l			;95cb
	jp (hl)			;95cc

; ----------------------------------------------------------------------
; DATOS tiles: de los niveles: 111 de 32x32, 128 bytes cada uno
;   0x6de0..0xa560  (14208 bytes)
; ----------------------------------------------------------------------
	defb 0c7h,0cah,02eh,073h,0e3h,0e5h,017h,0b9h,0f1h,0f2h,08eh,05ch,0ffh,0f9h,017h,02eh	; 95cd  ...s.......\....
	defb 07fh,0fch	; 95dd  ..

; ======================================================================
; CODIGO 0x95df..0x96fd  (286 bytes)
; ======================================================================


L_95DF:
	adc a,(hl)		;95df
	ld (hl),l		;95e0
	dec d			;95e1
	rst 38h			;95e2
	ld d,a			;95e3
	cp d			;95e4
	adc a,d			;95e5
	xor d			;95e6
	xor (hl)		;95e7
	ld (hl),l		;95e8
	ld b,l			;95e9
	ld d,l			;95ea
	ld e,l			;95eb
	cp d			;95ec
	and e			;95ed
	rst 38h			;95ee
	jp m,05775h		;95ef
	rst 38h			;95f2
	push af			;95f3
	cp d			;95f4
	xor d			;95f5
	xor d			;95f6
	xor d			;95f7
	ld (hl),l		;95f8
	ld d,l			;95f9
	ld d,l			;95fa
	ld d,l			;95fb
	cp d			;95fc
	xor d			;95fd
	xor d			;95fe
	xor d			;95ff
	ld (hl),l		;9600
	ld d,a			;9601
	rst 38h			;9602
	rst 38h			;9603
	cp d			;9604
	xor b			;9605
	nop			;9606
	inc bc			;9607
	ld (hl),l		;9608
	ld d,b			;9609
	nop			;960a
	rrca			;960b
	cp d			;960c
	and a			;960d
	add hl,sp		;960e
	rst 18h			;960f
	ld (hl),l		;9610
	ld b,b			;9611
L_9612:
	nop			;9612
	rra			;9613
	cp d			;9614
	rst 38h			;9615
	rst 38h			;9616
	rst 38h			;9617
	ld (hl),l		;9618
	xor d			;9619
	xor d			;961a
	cp (hl)			;961b
	cp d			;961c
	push de			;961d
	ld d,l			;961e
	ld a,h			;961f
	ld (hl),l		;9620
	add a,b			;9621
	nop			;9622
	inc a			;9623
	cp d			;9624
	push de			;9625
	ld d,l			;9626
	ld a,h			;9627
	ld (hl),l		;9628
	xor d			;9629
	xor d			;962a
	cp h			;962b
	cp d			;962c
	rst 38h			;962d
	rst 38h			;962e
	call m,L_7F75		;962f
	rst 38h			;9632
	sbc a,0bah		;9633
	or c			;9635
	adc a,h			;9636
	ld l,a			;9637
	ld (hl),l		;9638
	ld e,a			;9639
L_963A:
	rst 38h			;963a
	di			;963b
	cp d			;963c
	xor a			;963d
	rst 38h			;963e
	rst 38h			;963f
	ld (hl),l		;9640
	ld d,l			;9641
L_9642:
	ld d,l			;9642
	ld d,l			;9643
	cp d			;9644
	xor d			;9645
	xor d			;9646
	xor d			;9647
	ld e,l			;9648
	ld d,l			;9649
	ld d,l			;964a
	ld d,l			;964b
	xor (hl)		;964c
	xor d			;964d
	xor d			;964e
	xor d			;964f
	ld d,a			;9650
	nop			;9651
	nop			;9652
	nop			;9653
	xor d			;9654
	nop			;9655
	nop			;9656
	nop			;9657
	ld d,l			;9658
	ld d,l			;9659
L_965A:
	ld d,l			;965a
	ld d,l			;965b
	xor d			;965c
	xor d			;965d
	xor d			;965e
	xor d			;965f
	ld d,a			;9660
	inc (hl)		;9661
	inc l			;9662
	ld de,034aah		;9663
	inc l			;9666
	and d			;9667
	ld d,l			;9668
	inc (hl)		;9669
	inc l			;966a
	ld d,c			;966b
	xor d			;966c
	inc b			;966d
	jr nz,L_9612		;966e
	ld d,l			;9670
	inc b			;9671
	jr nz,$+83		;9672
	xor b			;9674
	inc b			;9675
	jr nz,L_965A		;9676
	ld d,a			;9678
	inc (hl)		;9679
	inc l			;967a
	ld de,034aah		;967b
	inc l			;967e
	and d			;967f
	ld d,l			;9680
	inc (hl)		;9681
	inc l			;9682
	ld d,c			;9683
	xor d			;9684
	inc (hl)		;9685
	inc l			;9686
	and d			;9687
	ld d,l			;9688
	inc (hl)		;9689
	inc l			;968a
	ld d,c			;968b
	xor b			;968c
	inc (hl)		;968d
	inc l			;968e
	jp po,03457h		;968f
	inc l			;9692
	ld de,004aah		;9693
	jr nz,L_963A		;9696
	ld d,l			;9698
	inc b			;9699
	jr nz,L_96ED		;969a
	nop			;969c
	inc b			;969d
	jr nz,L_9642		;969e
	nop			;96a0
	inc (hl)		;96a1
	inc l			;96a2
	ld d,c			;96a3
	rst 20h			;96a4
	inc (hl)		;96a5
	inc l			;96a6
	jp po,03400h		;96a7
	inc l			;96aa
	ld de,03400h		;96ab
	inc l			;96ae
	and d			;96af
	ld d,l			;96b0
	inc (hl)		;96b1
	inc l			;96b2
	ld d,c			;96b3
	xor d			;96b4
	inc (hl)		;96b5
	inc l			;96b6
	and d			;96b7
	ld d,l			;96b8
	jr nc,L_96C7		;96b9
	ld d,c			;96bb
	xor b			;96bc
	nop			;96bd
	nop			;96be
	jp po,L_5557		;96bf
	ld d,l			;96c2
	ld de,0aaaah		;96c3
	xor d			;96c6
L_96C7:
	and d			;96c7
	ld d,l			;96c8
	ld d,l			;96c9
	ld d,l			;96ca
	ld b,l			;96cb
	xor d			;96cc
	xor d			;96cd
	xor d			;96ce
	adc a,d			;96cf
	nop			;96d0
	nop			;96d1
	nop			;96d2
	dec d			;96d3
	nop			;96d4
	nop			;96d5
	nop			;96d6
	ld hl,(05555h)		;96d7
	ld d,l			;96da
	ld d,l			;96db
	xor d			;96dc
	xor d			;96dd
	xor d			;96de
	xor d			;96df
	ld (hl),d		;96e0
	ld c,a			;96e1
	cpl			;96e2
	di			;96e3
	ld (hl),d		;96e4
	ld c,a			;96e5
	inc h			;96e6
	dec b			;96e7
	ld (hl),d		;96e8
	add a,02ch		;96e9
	add a,e			;96eb
	ld (hl),d		;96ec
L_96ED:
	ld b,b			;96ed
	inc b			;96ee
	add a,b			;96ef
	halt			;96f0
	ld b,(hl)		;96f1
	inc l			;96f2
	add a,l			;96f3
	ld (hl),b		;96f4
	ld c,b			;96f5
	cp (hl)			;96f6
	inc b			;96f7
	ld (hl),b		;96f8
	ld b,d			;96f9
	jp L_7005		;96fa

; ----------------------------------------------------------------------
; DATOS tiles: de los niveles: 111 de 32x32, 128 bytes cada uno
;   0x6de0..0xa560  (14208 bytes)
; ----------------------------------------------------------------------
	defb 00bh,000h,084h,070h,02ch,020h,0c5h,070h,0b0h,020h,020h,072h,0c7h,020h,035h,07bh	; 96fd  ...p, .p.  r. 5{
	defb 00fh,020h,09fh,07ch,046h,020h,0b0h,070h,040h,020h,014h,070h,046h,020h,067h,038h	; 970d  . .|F .p@ .pF g8
	defb 04fh,020h,026h,01ch,04fh,020h,0c6h,08eh,046h,020h,044h,047h,000h,021h,082h,0a3h	; 971d  O &.O ..F DG.!..
	defb 086h,020h,084h,051h,0cfh,023h,02ah,0a8h,0e7h,021h,004h,014h,072h,026h,02ah,09ah	; 972d  . .Q.#*..!..r&*.
	defb 038h,022h,057h,01dh,01ch,02ch,027h,08eh,08eh,004h,000h,01fh,047h,018h,000h,08fh	; 973d  8"W..,'.....G...
	defb 0a3h,088h,000h,015h,0d1h,0ffh,0ffh,08fh,0e8h,0ffh,0ffh,05fh,0f4h,03fh,0ffh,0aah	; 974d  ..........._.?..
	defb 0aah,080h,000h,0efh,0f0h,06dh,00eh,0e0h,030h,060h,00eh,0c0h,010h,07fh,0eeh,018h	; 975d  .....m..0`......
	defb 030h,060h,00eh,08ch,014h,04dh,00eh,08ch,03dh,00dh,00eh,086h,0c3h,045h,00eh,080h	; 976d  0`...M..=....E..
	defb 080h,0d1h,00eh,083h,03eh,034h,00eh,082h,078h,00dh,00eh,0d4h,000h,003h,04eh,0fch	; 977d  ....>4..x.....N.
	defb 000h,000h,0deh,004h,000h,00ch,03eh,00ch,000h,00dh,00ch,0e2h,000h,00dh,01ch,066h	; 978d  ......>........f
	defb 000h,01ah,038h,071h,07eh,034h,071h,003h,003h,0e8h,0e2h,000h,080h,011h,0c5h,001h	; 979d  ..8q~4q.........
	defb 080h,023h,08ah,000h,043h,0c7h,011h,07eh,0ceh,00eh,022h,060h,020h,01ch,047h,0e0h	; 97ad  .#..C..~.."` .G.
	defb 060h,038h,08eh,0e0h,010h,071h,007h,000h,030h,0e2h,00eh,000h,009h,0c4h,017h,000h	; 97bd  `8...q..0.......
	defb 01bh,088h,02eh,0ffh,0ffh	; 97cd  .....

; ======================================================================
; CODIGO 0x97d2..0x9af6  (804 bytes)
; ======================================================================


L_97D2:
	ld de,0ff57h		;97d2
	cp 023h			;97d5
	cp 0ffh			;97d7
	ret m			;97d9
	ld b,a			;97da
	defb 0fdh,000h,000h ;illegal sequence	;97db
	xor d			;97de
	xor d			;97df
	ld d,l			;97e0
	ld d,h			;97e1
	dec d			;97e2
	ld d,l			;97e3
	ld (bc),a		;97e4
	and b			;97e5
	ld a,(bc)		;97e6
	add a,b			;97e7
	rlca			;97e8
	ld b,a			;97e9
	push hl			;97ea
	ld bc,09b2eh		;97eb
	jp c,0178bh		;97ee
	dec de			;97f1
	exx			;97f2
	rla			;97f3
	ld a,023h		;97f4
	call nz,L_7FBF		;97f6
	dec e			;97f9
	cp l			;97fa
	ld a,a			;97fb
	xor d			;97fc
	ld l,07dh		;97fd
	xor d			;97ff
	ld d,l			;9800
	ld e,07dh		;9801
	ld d,l			;9803
	xor d			;9804
	dec l			;9805
	cp l			;9806
	xor d			;9807
	ld d,l			;9808
	inc hl			;9809
	push bc			;980a
	ld d,l			;980b
	xor d			;980c
	dec de			;980d
	in a,(0aah)		;980e
	inc e			;9810
	dec de			;9811
	exx			;9812
	rst 0			;9813
	sbc a,d			;9814
L_9815:
	ld b,a			;9815
	jp po,01ca6h		;9816
	ld d,b			;9819
	ld c,0c7h		;981a
	sbc a,b			;981c
	cp a			;981d
	cp 066h			;981e
	inc e			;9820
	ld a,a			;9821
	rst 38h			;9822
	ld b,a			;9823
	sbc a,b			;9824
	cp a			;9825
	rst 38h			;9826
	ld h,(hl)		;9827
	ld d,h			;9828
	ld d,b			;9829
	rrca			;982a
	ld d,l			;982b
	xor b			;982c
	add hl,hl		;982d
	or (hl)			;982e
	xor d			;982f
	ld d,h			;9830
	dec e			;9831
	cp c			;9832
	ld d,l			;9833
	xor d			;9834
	add hl,de		;9835
	cp d			;9836
	xor d			;9837
	dec e			;9838
	dec e			;9839
	cp e			;983a
	ld b,a			;983b
	sbc a,d			;983c
	sbc a,c			;983d
	cp d			;983e
	and (hl)		;983f
	dec e			;9840
	djnz L_984E		;9841
	ld b,a			;9843
	sbc a,d			;9844
	sub (hl)		;9845
	ld l,d			;9846
	and (hl)		;9847
	dec e			;9848
	ld d,063h		;9849
	ld b,a			;984b
	sbc a,d			;984c
L_984D:
	add a,(hl)		;984d
L_984E:
	ld h,d			;984e
	and (hl)		;984f
	ld d,l			;9850
	ld a,(de)		;9851
	ld e,c			;9852
	ld d,l			;9853
	xor d			;9854
	cp l			;9855
	cp h			;9856
	xor d			;9857
	ld d,l			;9858
	dec l			;9859
L_985A:
	or h			;985a
	ld d,l			;985b
	xor d			;985c
	ld d,l			;985d
	xor d			;985e
	xor d			;985f
	ld d,a			;9860
	rst 38h			;9861
	rst 38h			;9862
	rst 38h			;9863
	xor h			;9864
	nop			;9865
	nop			;9866
	nop			;9867
	ld e,b			;9868
	nop			;9869
	nop			;986a
	nop			;986b
	or d			;986c
	xor d			;986d
	xor d			;986e
	xor d			;986f
	ld h,l			;9870
	ld d,l			;9871
	ld d,l			;9872
	ld d,l			;9873
	jp z,00000h		;9874   ; BIOS CHKRAM - Tests RAM and sets RAM slot for the system  [alias: STARTUP, RESET, BOOT]
	nop			;9877
	sub h			;9878
	nop			;9879
	nop			;987a
	inc bc			;987b
	adc a,b			;987c
	xor d			;987d
	xor d			;987e
	adc a,b			;987f
	sub c			;9880
	ld d,l			;9881
	ld d,l			;9882
	dec d			;9883
	adc a,b			;9884
	xor a			;9885
	jp m,L_912A		;9886
	ld e,a			;9889
	ret p			;988a
	ld d,l			;988b
	adc a,b			;988c
	cp d			;988d
	and b			;988e
	xor b			;988f
	sub c			;9890
	ld (hl),b		;9891
	ld de,08847h		;9892
	ret po			;9895
	ld (0919fh),hl		;9896
	ld (hl),c		;9899
	ld (hl),c		;989a
	ld e,(hl)		;989b
	adc a,b			;989c
	jp po,L_B9E2		;989d
	sub c			;98a0
	ld (hl),c		;98a1
	ld (hl),c		;98a2
	dec sp			;98a3
	adc a,b			;98a4
	ex (sp),hl		;98a5
	jp po,L_91B7		;98a6
	ld (hl),a		;98a9
	pop af			;98aa
	scf			;98ab
	adc a,b			;98ac
	jp pe,L_BBA2		;98ad
	sub c			;98b0
	ld (hl),b		;98b1
	ld de,08839h		;98b2
	rst 28h			;98b5
	ret po			;98b6
	sbc a,(hl)		;98b7
	sub c			;98b8
	ld (hl),l		;98b9
	ld b,e			;98ba
	rst 18h			;98bb
	adc a,b			;98bc
	jp pe,L_87A6		;98bd
	sub c			;98c0
	ld (hl),b		;98c1
	dec b			;98c2
	djnz L_984D		;98c3
	rst 28h			;98c5
	jp nz,L_912A		;98c6
	ld (hl),l		;98c9
	ld b,l			;98ca
	ld d,a			;98cb
	adc a,b			;98cc
	cp d			;98cd
	adc a,d			;98ce
	cpl			;98cf
	sub c			;98d0
	ld e,h			;98d1
	dec b			;98d2
	ld e,a			;98d3
	adc a,b			;98d4
L_98D5:
	xor b			;98d5
	ld a,(bc)		;98d6
	cpl			;98d7
	sub c			;98d8
	ld d,l			;98d9
	dec d			;98da
	ld e,a			;98db
	adc a,b			;98dc
	cp 08ah			;98dd
	xor a			;98df
	rst 38h			;98e0
	rst 38h			;98e1
	rst 38h			;98e2
	push bc			;98e3
	nop			;98e4
L_98E5:
	nop			;98e5
	nop			;98e6
	ld (00000h),hl		;98e7
	nop			;98ea
	ld (hl),c		;98eb
	xor d			;98ec
	xor d			;98ed
	xor d			;98ee
	cp b			;98ef
	ld d,l			;98f0
	ld d,l			;98f1
	ld d,l			;98f2
	ld e,h			;98f3
	nop			;98f4
	nop			;98f5
	nop			;98f6
	xor (hl)		;98f7
	ret nz			;98f8
	nop			;98f9
	ld bc,032d6h		;98fa
	xor d			;98fd
L_98FE:
	xor d			;98fe
	xor 079h		;98ff
	ld d,a			;9901
	defb 0fdh,076h,0beh ;illegal sequence	;9902
	jp pe,L_EEAA		;9905
	ld e,a			;9908
	ld b,l			;9909
	ld bc,01f76h		;990a
	and d			;990d
L_990E:
	jr c,L_98FE		;990e
	rst 20h			;9910
	sub c			;9911
	add hl,sp		;9912
	halt			;9913
	ei			;9914
	ret c			;9915
	jr c,$-16		;9916
	ld a,e			;9918
	pop de			;9919
	add hl,sp		;991a
	halt			;991b
	sbc a,l			;991c
	ret c			;991d
L_991E:
	jr c,L_990E		;991e
	defb 0ddh,0d1h,039h ;illegal sequence	;9920
	halt			;9923
	defb 0edh ;next byte illegal after ed	;9924
	ret c			;9925
	nop			;9926
	xor 0edh		;9927
	pop de			;9929
	ld bc,0dd76h		;992a
	ret c			;992d
L_992E:
	jr c,L_991E		;992e
	sbc a,h			;9930
	pop de			;9931
	add hl,sp		;9932
	halt			;9933
	ld a,e			;9934
	jr L_996F		;9935
L_9937:
	xor 0fbh		;9937
	pop de			;9939
	add hl,sp		;993a
	halt			;993b
	ex (sp),hl		;993c
	jp pe,L_EE38		;993d
	dec e			;9940
	defb 0edh ;next byte illegal after ed	;9941
	add hl,sp		;9942
	halt			;9943
	cp 0eah			;9944
L_9946:
	nop			;9946
	xor 0feh		;9947
	push af			;9949
	ld bc,0fe76h		;994a
	or 038h			;994d
	xor 0feh		;994f
	push af			;9951
	add hl,sp		;9952
	halt			;9953
	cp 0f2h			;9954
	jr c,L_9946		;9956
	cp 0fbh			;9958
	add hl,sp		;995a
	halt			;995b
	rst 38h			;995c
	ld a,d			;995d
	jr c,$-16		;995e
	ld d,l			;9960
	ld b,b			;9961
	dec b			;9962
	ld d,l			;9963
	and b			;9964
	rrca			;9965
	ret p			;9966
	ld (bc),a		;9967
	ld e,a			;9968
	ld (hl),b		;9969
	ld c,07dh		;996a
	cp b			;996c
	add a,b			;996d
	rlca			;996e
L_996F:
	ld a,033h		;996f
	nop			;9971
	ld e,l			;9972
	defb 0ddh,0a4h ;and ixh	;9973
L_9975:
	ld (bc),a		;9975
L_9976:
	xor a			;9976
	ld l,(hl)		;9977
	jr z,L_997A		;9978
L_997A:
	ld e,a			;997a
	or l			;997b
	xor b			;997c
	ld (bc),a		;997d
	ccf			;997e
	jp nc,00510h		;997f
	ld d,a			;9982
	ld sp,hl		;9983
	and b			;9984
	djnz L_9976		;9985
	call pe,00520h		;9987
	ld e,a			;998a
	push af			;998b
	jr nz,$+12		;998c
	cp a			;998e
	call c,01540h		;998f
	ld d,a			;9992
	push af			;9993
	ld b,b			;9994
	ex af,af'		;9995
	rst 28h			;9996
	call m,02540h		;9997
	ld d,a			;999a
	push af			;999b
	ld b,b			;999c
	ld a,(bc)		;999d
	cp e			;999e
	call m,02440h		;999f
	ld (hl),a		;99a2
	or 040h			;99a3
	ld a,(bc)		;99a5
	xor a			;99a6
	jp m,00000h		;99a7   ; BIOS CHKRAM - Tests RAM and sets RAM slot for the system  [alias: STARTUP, RESET, BOOT]
	nop			;99aa
	nop			;99ab
	rst 38h			;99ac
	rst 38h			;99ad
	rst 38h			;99ae
	rst 38h			;99af
	ret nc			;99b0
L_99B1:
	ld b,l			;99b1
	rst 18h			;99b2
	rst 38h			;99b3
	add a,b			;99b4
	ld a,(bc)		;99b5
	cp e			;99b6
	defb 0fdh,0c0h,051h ;illegal sequence	;99b7
	ld a,a			;99ba
	rst 38h			;99bb
	add a,b			;99bc
	ld a,(bc)		;99bd
	xor e			;99be
	defb 0fdh,0d0h,015h ;illegal sequence	;99bf
	rst 18h			;99c2
	rst 38h			;99c3
	add a,b			;99c4
	ld (bc),a		;99c5
	cp e			;99c6
	defb 0fdh,0d0h,055h ;illegal sequence	;99c7
	ld e,a			;99ca
	rst 38h			;99cb
	add a,b			;99cc
	ld a,(bc)		;99cd
	ex de,hl		;99ce
	defb 0fdh,0ffh,0ffh ;illegal sequence	;99cf
	rst 38h			;99d2
	rst 38h			;99d3
	nop			;99d4
	nop			;99d5
	nop			;99d6
	nop			;99d7
	ld b,b			;99d8
	ld bc,0fe57h		;99d9
	ld b,b			;99dc
	ld hl,(0fabfh)		;99dd
	ld d,l			;99e0
	ld d,l			;99e1
	ld d,l			;99e2
	ld d,l			;99e3
	nop			;99e4
	nop			;99e5
	nop			;99e6
	nop			;99e7
	nop			;99e8
	nop			;99e9
	nop			;99ea
	nop			;99eb
	xor d			;99ec
	xor d			;99ed
	xor d			;99ee
	xor d			;99ef
	ld d,l			;99f0
	ld d,l			;99f1
	ld d,l			;99f2
	ld d,l			;99f3
	rst 38h			;99f4
	rst 38h			;99f5
	rst 38h			;99f6
	rst 38h			;99f7
	rst 38h			;99f8
	rst 38h			;99f9
	rst 38h			;99fa
	rst 38h			;99fb
	xor d			;99fc
	xor d			;99fd
	xor d			;99fe
	xor d			;99ff
	nop			;9a00
	ld bc,00040h		;9a01
	nop			;9a04
	ld (bc),a		;9a05
	add a,b			;9a06
	nop			;9a07
	rst 38h			;9a08
	pop af			;9a09
	ld c,a			;9a0a
	rst 38h			;9a0b
	rst 38h			;9a0c
	jp p,0ff8fh		;9a0d
	rst 38h			;9a10
	pop af			;9a11
	ld c,a			;9a12
	rst 38h			;9a13
	rst 38h			;9a14
	jp p,0ff8fh		;9a15
	rst 38h			;9a18
	pop af			;9a19
	ld c,a			;9a1a
	rst 38h			;9a1b
	ret po			;9a1c
	ld (hl),d		;9a1d
	adc a,(hl)		;9a1e
	rlca			;9a1f
	ret po			;9a20
	ld (hl),c		;9a21
	ld c,(hl)		;9a22
	rlca			;9a23
	ret po			;9a24
	ld (hl),d		;9a25
	adc a,(hl)		;9a26
	rlca			;9a27
	rst 38h			;9a28
	pop af			;9a29
	ld c,a			;9a2a
	rst 38h			;9a2b
	rst 38h			;9a2c
	jp p,0ff8fh		;9a2d
	rst 38h			;9a30
	pop af			;9a31
	ld c,a			;9a32
	rst 38h			;9a33
	rst 38h			;9a34
	jp p,0ff8fh		;9a35
	nop			;9a38
	ld bc,00040h		;9a39
	nop			;9a3c
	ld (bc),a		;9a3d
	add a,b			;9a3e
	nop			;9a3f
	ld d,l			;9a40
	ld d,l			;9a41
	ld d,l			;9a42
	ld d,l			;9a43
	nop			;9a44
	nop			;9a45
	nop			;9a46
	nop			;9a47
	nop			;9a48
	nop			;9a49
	nop			;9a4a
	nop			;9a4b
	xor d			;9a4c
	xor d			;9a4d
	xor d			;9a4e
	xor d			;9a4f
	ld d,l			;9a50
	ld d,l			;9a51
	ld d,l			;9a52
	ld d,l			;9a53
	rst 38h			;9a54
	rst 38h			;9a55
	rst 38h			;9a56
	rst 38h			;9a57
	rst 38h			;9a58
	rst 38h			;9a59
	rst 38h			;9a5a
	rst 38h			;9a5b
	xor d			;9a5c
	xor d			;9a5d
	xor d			;9a5e
	xor d			;9a5f
	rla			;9a60
	ccf			;9a61
	call m,L_8E17		;9a62
	ccf			;9a65
	call m,0178eh		;9a66
	ccf			;9a69
	call m,L_8E17		;9a6a
	ld a,03ch		;9a6d
	adc a,(hl)		;9a6f
	rla			;9a70
	ld a,03ch		;9a71
	rla			;9a73
	adc a,(hl)		;9a74
	ld a,03ch		;9a75
	adc a,(hl)		;9a77
	rla			;9a78
	ld a,03ch		;9a79
	rla			;9a7b
	adc a,(hl)		;9a7c
	ld a,03ch		;9a7d
	adc a,(hl)		;9a7f
	rla			;9a80
	ld a,03ch		;9a81
	rla			;9a83
	adc a,(hl)		;9a84
	ccf			;9a85
	call m,0178eh		;9a86
	ccf			;9a89
	call m,L_8E17		;9a8a
	ccf			;9a8d
	call m,0178eh		;9a8e
	nop			;9a91
	nop			;9a92
	rla			;9a93
	adc a,(hl)		;9a94
	nop			;9a95
	nop			;9a96
	adc a,(hl)		;9a97
	rla			;9a98
	ld d,l			;9a99
	ld d,l			;9a9a
	rla			;9a9b
	adc a,(hl)		;9a9c
	xor d			;9a9d
	xor d			;9a9e
	adc a,(hl)		;9a9f
	rla			;9aa0
	ld d,l			;9aa1
	ld d,l			;9aa2
	rla			;9aa3
	adc a,(hl)		;9aa4
	xor d			;9aa5
	xor d			;9aa6
	adc a,(hl)		;9aa7
	rla			;9aa8
	nop			;9aa9
	nop			;9aaa
	rla			;9aab
	adc a,(hl)		;9aac
	nop			;9aad
	nop			;9aae
	adc a,(hl)		;9aaf
	rla			;9ab0
	ccf			;9ab1
	call m,L_8E17		;9ab2
	ccf			;9ab5
	call m,0178eh		;9ab6
	ccf			;9ab9
	call m,L_8E17		;9aba
	ld a,03ch		;9abd
	adc a,(hl)		;9abf
	rla			;9ac0
	ld a,03ch		;9ac1
	rla			;9ac3
	adc a,(hl)		;9ac4
	ld a,03ch		;9ac5
	adc a,(hl)		;9ac7
	rla			;9ac8
	ld a,03ch		;9ac9
	rla			;9acb
	adc a,(hl)		;9acc
	ld a,03ch		;9acd
	adc a,(hl)		;9acf
	rla			;9ad0
	ld a,03ch		;9ad1
	rla			;9ad3
	adc a,(hl)		;9ad4
	ccf			;9ad5
	call m,0178eh		;9ad6
	ccf			;9ad9
	call m,L_8E17		;9ada
	ccf			;9add
	call m,0178eh		;9ade
	ccf			;9ae1
	cp 047h			;9ae2
	adc a,(hl)		;9ae4
	sbc a,a			;9ae5
	rst 38h			;9ae6
	inc hl			;9ae7
	rla			;9ae8
	ld c,a			;9ae9
	rra			;9aea
	sub c			;9aeb
	adc a,e			;9aec
	and a			;9aed
	adc a,a			;9aee
	jr z,$+71		;9aef
	out (0c6h),a		;9af1
	ld d,h			;9af3
	and d			;9af4
	jp (hl)			;9af5

; ----------------------------------------------------------------------
; DATOS tiles: de los niveles: 111 de 32x32, 128 bytes cada uno
;   0x6de0..0xa560  (14208 bytes)
; ----------------------------------------------------------------------
	defb 0ech,0a2h,051h,074h,0f9h,049h,0e8h,0bah,072h,09ch,014h,05dh,025h,03eh,0aah,02eh	; 9af6  ..Qt.I..r..]%>..
	defb 08ah,07fh,055h,017h,054h,0ffh,0aah,08bh	; 9b06  ..U.T...

; ======================================================================
; CODIGO 0x9b0e..0x9ed3  (965 bytes)
; ======================================================================


L_9B0E:
	xor c			;9b0e
	rst 28h			;9b0f
	ld d,l			;9b10
	dec d			;9b11
	out (0c7h),a		;9b12
	jp pe,L_E92A		;9b14
	ex (sp),hl		;9b17
	inc d			;9b18
	ld e,l			;9b19
	ld (hl),h		;9b1a
	di			;9b1b
	xor b			;9b1c
	cp b			;9b1d
	cp d			;9b1e
	ld a,e			;9b1f
	ld d,c			;9b20
	ld (hl),h		;9b21
	ld e,l			;9b22
	ccf			;9b23
	and d			;9b24
	jp pe,09f2eh		;9b25
	ld b,l			;9b28
	push de			;9b29
	rla			;9b2a
	ld c,a			;9b2b
	ex (sp),hl		;9b2c
	xor d			;9b2d
	adc a,e			;9b2e
	and a			;9b2f
	dec b			;9b30
	push de			;9b31
	dec d			;9b32
	out (0a3h),a		;9b33
	xor d			;9b35
L_9B36:
	ld hl,(045e9h)		;9b36
	call nc,L_7459		;9b39
	and e			;9b3c
	add a,b			;9b3d
	cp b			;9b3e
	cp d			;9b3f
	ld b,l			;9b40
	ld bc,05d74h		;9b41
	jp po,L_EAAA		;9b44
	ld l,005h		;9b47
	ld d,l			;9b49
L_9B4A:
	push de			;9b4a
	inc d			;9b4b
	xor a			;9b4c
	rst 38h			;9b4d
	xor d			;9b4e
	adc a,d			;9b4f
	ld e,a			;9b50
	rst 38h			;9b51
	ld d,l			;9b52
	ld b,l			;9b53
	xor d			;9b54
	xor d			;9b55
	xor d			;9b56
	xor a			;9b57
	ld e,c			;9b58
	ld h,l			;9b59
	sub (hl)		;9b5a
	ld e,a			;9b5b
	xor d			;9b5c
	xor d			;9b5d
	xor d			;9b5e
	xor d			;9b5f
	rla			;9b60
	ccf			;9b61
	call m,02e17h		;9b62
	ld a,a			;9b65
	call m,05c8eh		;9b66
	ret m			;9b69
	ld sp,hl		;9b6a
	rla			;9b6b
	cp c			;9b6c
	pop af			;9b6d
	jp p,L_742E		;9b6e
	ex (sp),hl		;9b71
	call po,L_EA5D		;9b72
	ld (hl),a		;9b75
	ret z			;9b76
	cp d			;9b77
	push bc			;9b78
	ccf			;9b79
	sub c			;9b7a
	ld (hl),l		;9b7b
	sub d			;9b7c
	sbc a,a			;9b7d
	ld (039eah),hl		;9b7e
	ld c,(hl)		;9b81
	ld b,l			;9b82
	rst 10h			;9b83
L_9B84:
	ld a,h			;9b84
	and h			;9b85
	adc a,e			;9b86
	xor b			;9b87
	cp 051h			;9b88
	rla			;9b8a
	ld d,l			;9b8b
	rst 30h			;9b8c
	ld hl,(0aa2eh)		;9b8d
	ex (sp),hl		;9b90
	sub h			;9b91
	ld d,a			;9b92
	ld d,l			;9b93
	rst 0			;9b94
	ret z			;9b95
L_9B96:
	xor e			;9b96
	xor d			;9b97
	rst 8			;9b98
	sub c			;9b99
	ld h,l			;9b9a
	rst 10h			;9b9b
	rst 18h			;9b9c
	ld (0e8e2h),hl		;9b9d
	cp 045h			;9ba0
	pop de			;9ba2
	ld (hl),l		;9ba3
	call m,L_A88B		;9ba4
	cp d			;9ba7
	ld sp,hl		;9ba8
	rla			;9ba9
	ld d,h			;9baa
	ld e,l			;9bab
	jp p,L_AA2E		;9bac
	ld a,(057e4h)		;9baf
	ld d,h			;9bb2
	ld e,a			;9bb3
	ret z			;9bb4
	xor e			;9bb5
	xor d			;9bb6
	jr c,L_9B4A		;9bb7
	ld h,l			;9bb9
	call nc,0225dh		;9bba
	jp po,03ae0h		;9bbd
	ld b,l			;9bc0
	pop de			;9bc1
	ld b,b			;9bc2
	ld e,l			;9bc3
	dec bc			;9bc4
	xor b			;9bc5
	xor d			;9bc6
	cp d			;9bc7
	rla			;9bc8
	ld d,h			;9bc9
	ld d,l			;9bca
	ld e,a			;9bcb
	xor (hl)		;9bcc
	xor d			;9bcd
	ccf			;9bce
	ret m			;9bcf
	ld e,l			;9bd0
	ld d,l			;9bd1
	ccf			;9bd2
	defb 0fdh,0fah,0aah ;illegal sequence	;9bd3
	xor d			;9bd6
	xor d			;9bd7
	call p,04dd3h		;9bd8
	dec (hl)		;9bdb
	xor d			;9bdc
	xor d			;9bdd
	xor d			;9bde
	xor d			;9bdf
	dec e			;9be0
	ld d,l			;9be1
	xor d			;9be2
	ld b,a			;9be3
	sbc a,d			;9be4
	ld c,(hl)		;9be5
	ld (hl),d		;9be6
	and (hl)		;9be7
	dec e			;9be8
	ld a,h			;9be9
	ld a,047h		;9bea
	sbc a,d			;9bec
	inc e			;9bed
	jr c,L_9B96		;9bee
	dec e			;9bf0
	inc b			;9bf1
	and c			;9bf2
	ld b,a			;9bf3
	sbc a,d			;9bf4
	add a,d			;9bf5
	ld c,d			;9bf6
	and (hl)		;9bf7
	ld d,l			;9bf8
	add hl,de		;9bf9
	sbc a,e			;9bfa
	ld d,l			;9bfb
	xor d			;9bfc
	sbc a,b			;9bfd
	ld a,(055aah)		;9bfe
L_9C01:
	dec e			;9c01
	cp e			;9c02
	ld d,l			;9c03
	xor d			;9c04
	sbc a,c			;9c05
	cp d			;9c06
	xor d			;9c07
	dec e			;9c08
	dec e			;9c09
	cp e			;9c0a
	ld b,a			;9c0b
	sbc a,d			;9c0c
	sbc a,c			;9c0d
	cp d			;9c0e
	and (hl)		;9c0f
	dec e			;9c10
	dec e			;9c11
	cp e			;9c12
	ld b,a			;9c13
	sbc a,d			;9c14
	adc a,c			;9c15
	or d			;9c16
	and (hl)		;9c17
	dec e			;9c18
	ld b,l			;9c19
	and a			;9c1a
	ld b,a			;9c1b
	sbc a,d			;9c1c
	and c			;9c1d
	adc a,(hl)		;9c1e
	and (hl)		;9c1f
	dec e			;9c20
	ld d,c			;9c21
	sbc a,l			;9c22
	ld b,a			;9c23
	sbc a,d			;9c24
	xor c			;9c25
	cp d			;9c26
	and (hl)		;9c27
	ld d,l			;9c28
	ld d,h			;9c29
	dec d			;9c2a
	ld d,l			;9c2b
	xor d			;9c2c
	xor d			;9c2d
	xor d			;9c2e
	xor d			;9c2f
	inc bc			;9c30
	ld d,l			;9c31
	ld d,l			;9c32
	ld bc,0ab06h		;9c33
	jp pe,03f83h		;9c36
	ld d,l			;9c39
	push de			;9c3a
	rra			;9c3b
	ld l,0abh		;9c3c
	jp pe,0379bh		;9c3e
	ld d,l			;9c41
	push de			;9c42
	inc de			;9c43
	ld h,0abh		;9c44
	jp pe,0379bh		;9c46
	ld d,l			;9c49
	push de			;9c4a
	inc de			;9c4b
	ld h,0afh		;9c4c
	jp m,0379bh		;9c4e
	ld d,a			;9c51
	push af			;9c52
	inc de			;9c53
	ld h,0abh		;9c54
	jp pe,L_7F93		;9c56
	ld d,l			;9c59
	push de			;9c5a
	rra			;9c5b
	cp 0aah			;9c5c
	xor d			;9c5e
	cp a			;9c5f
	sub c			;9c60
	ld bc,05f14h		;9c61
	adc a,b			;9c64
	xor d			;9c65
	ld hl,(091afh)		;9c66
	ld bc,05f14h		;9c69
	adc a,b			;9c6c
	cp 02ah			;9c6d
	cp a			;9c6f
	sub c			;9c70
	ld d,l			;9c71
	inc d			;9c72
	ld e,a			;9c73
	adc a,b			;9c74
	xor d			;9c75
	ld hl,(094afh)		;9c76
	ld a,a			;9c79
	inc d			;9c7a
	ld e,a			;9c7b
	adc a,d			;9c7c
	rst 38h			;9c7d
	adc a,d			;9c7e
	xor a			;9c7f
	sub l			;9c80
	ld d,l			;9c81
	ld b,h			;9c82
	ld d,a			;9c83
	jp z,L_A2AA		;9c84
	dec hl			;9c87
	ld h,a			;9c88
	rst 38h			;9c89
	pop af			;9c8a
	sub l			;9c8b
	cp a			;9c8c
	rst 38h			;9c8d
	ret m			;9c8e
	nop			;9c8f
	ld b,b			;9c90
	nop			;9c91
	dec d			;9c92
	ld d,l			;9c93
	xor d			;9c94
	xor d			;9c95
	or d			;9c96
	add a,b			;9c97
	nop			;9c98
	nop			;9c99
	ld d,l			;9c9a
	ld a,a			;9c9b
	add a,b			;9c9c
	nop			;9c9d
	jp p,015aah		;9c9e
	ld d,l			;9ca1
	push de			;9ca2
	ld d,l			;9ca3
	add a,b			;9ca4
	nop			;9ca5
	jp p,01080h		;9ca6
	ld bc,07fd1h		;9ca9
	add a,d			;9cac
	add a,b			;9cad
	jp p,010aah		;9cae
	add hl,hl		;9cb1
	pop de			;9cb2
	ld d,l			;9cb3
	add a,b			;9cb4
	nop			;9cb5
	jp p,01280h		;9cb6
	add a,c			;9cb9
	pop de			;9cba
	ld a,a			;9cbb
	add a,b			;9cbc
	jr z,$-14		;9cbd
	xor d			;9cbf
	djnz L_9CC3		;9cc0
	pop de			;9cc2
L_9CC3:
	ld d,l			;9cc3
	add a,b			;9cc4
	nop			;9cc5
	ret p			;9cc6
	add a,b			;9cc7
	djnz L_9CCB		;9cc8
	pop de			;9cca
L_9CCB:
	ld a,a			;9ccb
	add a,b			;9ccc
	nop			;9ccd
	ret p			;9cce
	xor d			;9ccf
	dec d			;9cd0
	ld d,l			;9cd1
	pop de			;9cd2
	ld d,l			;9cd3
	cp a			;9cd4
	rst 38h			;9cd5
	jp p,L_7F00		;9cd6
	rst 38h			;9cd9
	call nc,L_AA00		;9cda
	xor d			;9cdd
	cp b			;9cde
	nop			;9cdf
	rst 38h			;9ce0
	ld a,c			;9ce1
	add hl,sp		;9ce2
	halt			;9ce3
	rst 38h			;9ce4
	ld a,l			;9ce5
	nop			;9ce6
	xor 0ffh		;9ce7
	ld a,l			;9ce9
	ld d,l			;9cea
	halt			;9ceb
	rst 38h			;9cec
	ld a,l			;9ced
	add a,b			;9cee
	xor 0ffh		;9cef
	ld a,l			;9cf1
	ld a,a			;9cf2
	halt			;9cf3
	rst 38h			;9cf4
	ld a,l			;9cf5
	xor d			;9cf6
	xor 0ffh		;9cf7
	ld a,l			;9cf9
	rst 38h			;9cfa
	sub 0ffh		;9cfb
	ld a,e			;9cfd
	rst 38h			;9cfe
	xor (hl)		;9cff
	rst 38h			;9d00
	ld (hl),l		;9d01
	ld d,l			;9d02
	ld e,h			;9d03
	cp 06ah			;9d04
	xor d			;9d06
	cp b			;9d07
	ld a,l			;9d08
	sbc a,a			;9d09
	rst 38h			;9d0a
	pop af			;9d0b
	nop			;9d0c
	ccf			;9d0d
	rst 38h			;9d0e
	jp po,L_5055		;9d0f
	nop			;9d12
	dec b			;9d13
	nop			;9d14
	or d			;9d15
	xor d			;9d16
	xor d			;9d17
	rst 38h			;9d18
	ld d,a			;9d19
	rst 38h			;9d1a
	defb 0fdh,0aah,0b3h ;illegal sequence	;9d1b
	add a,(hl)		;9d1e
	jr L_9D76		;9d1f
L_9D21:
	ld d,a			;9d21
	rst 38h			;9d22
	pop af			;9d23
	nop			;9d24
	or d			;9d25
	rst 38h			;9d26
	call po,L_76FF		;9d27
	di			;9d2a
	dec h			;9d2b
	xor d			;9d2c
	or d			;9d2d
	call z,L_55C4		;9d2e
	halt			;9d31
	di			;9d32
	dec h			;9d33
	nop			;9d34
	or d			;9d35
	call z,0ffc0h		;9d36
	ld (hl),a		;9d39
	di			;9d3a
	ld hl,0f3aah		;9d3b
	call z,L_55C0		;9d3e
	halt			;9d41
	di			;9d42
	dec h			;9d43
	nop			;9d44
	jp p,L_C4CC		;9d45
	rst 38h			;9d48
	halt			;9d49
	di			;9d4a
	dec h			;9d4b
	xor d			;9d4c
	jp p,L_C4CC		;9d4d
	ld d,l			;9d50
	halt			;9d51
	ret nz			;9d52
	dec b			;9d53
	nop			;9d54
	inc sp			;9d55
	add a,b			;9d56
	nop			;9d57
	nop			;9d58
	rla			;9d59
	inc a			;9d5a
	ld a,c			;9d5b
	nop			;9d5c
	ld (bc),a		;9d5d
	nop			;9d5e
	nop			;9d5f
	ld b,b			;9d60
	dec b			;9d61
	in a,(0feh)		;9d62
	ld b,b			;9d64
L_9D65:
	ex af,af'		;9d65
	xor a			;9d66
	jp m,00000h		;9d67   ; BIOS CHKRAM - Tests RAM and sets RAM slot for the system  [alias: STARTUP, RESET, BOOT]
	nop			;9d6a
	nop			;9d6b
	rst 38h			;9d6c
	rst 38h			;9d6d
	rst 38h			;9d6e
	rst 38h			;9d6f
	ret nc			;9d70
	ld b,l			;9d71
	rst 18h			;9d72
	rst 38h			;9d73
	add a,b			;9d74
	ld a,(bc)		;9d75
L_9D76:
	cp e			;9d76
	defb 0fdh,0d0h,051h ;illegal sequence	;9d77
	ld a,a			;9d7a
	rst 38h			;9d7b
	add a,b			;9d7c
	ld a,(bc)		;9d7d
	xor e			;9d7e
	defb 0fdh,0d0h,055h ;illegal sequence	;9d7f
	rst 18h			;9d82
	rst 38h			;9d83
	add a,b			;9d84
	ld (bc),a		;9d85
	cp e			;9d86
	defb 0fdh,0d0h,055h ;illegal sequence	;9d87
	ld e,a			;9d8a
	rst 38h			;9d8b
	add a,b			;9d8c
	ld a,(bc)		;9d8d
	ex de,hl		;9d8e
	defb 0fdh,0ffh,0ffh ;illegal sequence	;9d8f
	rst 38h			;9d92
	rst 38h			;9d93
	nop			;9d94
	nop			;9d95
	nop			;9d96
	nop			;9d97
	ld b,b			;9d98
	rlca			;9d99
	ld e,a			;9d9a
	jp m,00a60h		;9d9b
	cp a			;9d9e
	cp 040h			;9d9f
	ld bc,0faffh		;9da1
	ld h,b			;9da4
	ld a,(bc)		;9da5
	xor a			;9da6
	cp 040h			;9da7
	rlca			;9da9
	ld a,a			;9daa
	jp m,02a60h		;9dab
	xor a			;9dae
	cp 030h			;9daf
	ld bc,0f6ffh		;9db1
	jr nz,L_9DE0		;9db4
	cp a			;9db6
	call m,05734h		;9db7
	ld e,a			;9dba
	defb 0edh ;next byte illegal after ed	;9dbb
	jr $+4			;9dbc
	rst 38h			;9dbe
	jp m,L_554D		;9dbf
	ld a,a			;9dc2
	push de			;9dc3
	ld l,d			;9dc4
	ei			;9dc5
	rst 38h			;9dc6
	or 04dh			;9dc7
	ld a,a			;9dc9
	rst 38h			;9dca
	ld h,l			;9dcb
	ld h,a			;9dcc
	cp a			;9dcd
	defb 0fdh,0ceh,070h ;illegal sequence	;9dce
	rst 10h			;9dd1
	rst 30h			;9dd2
	dec e			;9dd3
	ld a,07dh		;9dd4
	ld e,(hl)		;9dd6
	jp m,00f15h		;9dd7
	pop af			;9dda
	ld d,l			;9ddb
	xor d			;9ddc
	and b			;9ddd
	ld a,(bc)		;9dde
	xor d			;9ddf
L_9DE0:
	ld d,l			;9de0
	ld d,l			;9de1
	ld d,l			;9de2
	ld d,l			;9de3
	xor a			;9de4
	rst 38h			;9de5
	xor d			;9de6
	cp a			;9de7
	ld e,a			;9de8
	cp 055h			;9de9
	ret po			;9deb
	cp d			;9dec
	xor b			;9ded
	xor a			;9dee
	nop			;9def
	ld (hl),l		;9df0
	ld d,c			;9df1
	ld a,b			;9df2
	nop			;9df3
	jp pe,L_C082		;9df4
	nop			;9df7
	ld (hl),l		;9df8
	rlca			;9df9
	add a,b			;9dfa
	ccf			;9dfb
	jp pe,0012ch		;9dfc   ; BIOS SCANR - Scans screen pixels to the right
	ret po			;9dff
	ld (hl),h		;9e00
	ld e,b			;9e01
	rrca			;9e02
	dec d			;9e03
	ret pe			;9e04
	or b			;9e05
	jr $-84			;9e06
L_9E08:
	ld (hl),c		;9e08
	ld h,b			;9e09
	ld (hl),l		;9e0a
	ld d,l			;9e0b
	ret pe			;9e0c
	ret nz			;9e0d
	jp z,L_71BF		;9e0e
	add a,c			;9e11
	sub l			;9e12
	ret po			;9e13
	ex (sp),hl		;9e14
	inc bc			;9e15
	cpl			;9e16
	ld a,(bc)		;9e17
	ld h,(hl)		;9e18
	ld b,058h		;9e19
	ld d,l			;9e1b
	jp pe,L_B20C		;9e1c
	xor d			;9e1f
	ld d,(hl)		;9e20
	add hl,de		;9e21
	ld h,l			;9e22
	ld d,b			;9e23
	xor h			;9e24
	ld (08fcah),a		;9e25
	ld e,b			;9e28
	dec h			;9e29
	sub l			;9e2a
	ld (hl),b		;9e2b
	xor b			;9e2c
	ld l,e			;9e2d
	dec hl			;9e2e
	add a,b			;9e2f
	ld e,b			;9e30
	ld d,(hl)		;9e31
	ld d,(hl)		;9e32
	rrca			;9e33
	or b			;9e34
	call z,L_70AC		;9e35
	ld h,b			;9e38
	sub l			;9e39
	ld e,b			;9e3a
	add a,l			;9e3b
	and c			;9e3c
	xor d			;9e3d
	or c			;9e3e
	ld hl,(05961h)		;9e3f
	ld h,d			;9e42
	ld d,a			;9e43
	and c			;9e44
	ld (0afa4h),a		;9e45
	ld h,e			;9e48
	ld d,l			;9e49
	ld b,l			;9e4a
	rst 38h			;9e4b
	jp nz,L_C4B2		;9e4c
	add a,(hl)		;9e4f
	ld b,d			;9e50
	ld h,l			;9e51
	ld c,c			;9e52
	sub h			;9e53
	jp nz,L_4AAA		;9e54
	xor b			;9e57
	ld b,d			;9e58
	ld h,l			;9e59
	ld c,c			;9e5a
	sub l			;9e5b
	jp nz,L_4AAA		;9e5c
	xor d			;9e5f
	ld d,l			;9e60
	ld d,l			;9e61
	ld d,l			;9e62
	ld d,l			;9e63
	cp 0aah			;9e64
	xor a			;9e66
	cp a			;9e67
	inc bc			;9e68
	push de			;9e69
	ld e,a			;9e6a
	ld e,a			;9e6b
	nop			;9e6c
	ld a,d			;9e6d
	xor (hl)		;9e6e
	inc a			;9e6f
	nop			;9e70
	rrca			;9e71
	ld e,h			;9e72
	ld e,l			;9e73
	nop			;9e74
	ld bc,03da8h		;9e75
	cp 000h			;9e78
	push af			;9e7a
	ld e,l			;9e7b
	inc bc			;9e7c
	ret nz			;9e7d
	ld a,(de)		;9e7e
	cp h			;9e7f
	ld d,h			;9e80
	ld (hl),b		;9e81
	dec c			;9e82
	ld e,a			;9e83
	xor d			;9e84
	sbc a,h			;9e85
	ld b,0bfh		;9e86
	ld d,l			;9e88
	ld b,a			;9e89
	inc bc			;9e8a
	ld d,l			;9e8b
	jp m,L_81A9		;9e8c
	xor d			;9e8f
	rlca			;9e90
	call nc,L_C0CA		;9e91
	xor b			;9e94
	ld a,d			;9e95
	ld h,c			;9e96
	rra			;9e97
	ld d,l			;9e98
	dec e			;9e99
	inc (hl)		;9e9a
	ret p			;9e9b
	xor d			;9e9c
	xor (hl)		;9e9d
	sub e			;9e9e
	add a,b			;9e9f
	nop			;9ea0
	nop			;9ea1
	ld c,007h		;9ea2
	rst 38h			;9ea4
	rst 38h			;9ea5
	ret m			;9ea6
	rrca			;9ea7
	nop			;9ea8
	nop			;9ea9
	nop			;9eaa
	nop			;9eab
	nop			;9eac
	nop			;9ead
	nop			;9eae
	nop			;9eaf
	rst 38h			;9eb0
	rst 38h			;9eb1
	rst 38h			;9eb2
	rst 38h			;9eb3
	nop			;9eb4
	nop			;9eb5
	nop			;9eb6
	nop			;9eb7
	ld d,l			;9eb8
	ld d,l			;9eb9
	ld d,l			;9eba
	ld d,l			;9ebb
	xor d			;9ebc
	xor d			;9ebd
	xor d			;9ebe
	xor d			;9ebf
	rst 38h			;9ec0
	rst 38h			;9ec1
	rst 38h			;9ec2
	ret nc			;9ec3
	rst 38h			;9ec4
	rst 38h			;9ec5
	rst 38h			;9ec6
	xor a			;9ec7
	ld d,l			;9ec8
	ld d,l			;9ec9
	ld d,l			;9eca
	dec d			;9ecb
	xor d			;9ecc
	xor d			;9ecd
	nop			;9ece
	ld h,000h		;9ecf
	dec b			;9ed1
	nop			;9ed2

; ----------------------------------------------------------------------
; DATOS tiles: de los niveles: 111 de 32x32, 128 bytes cada uno
;   0x6de0..0xa560  (14208 bytes)
; ----------------------------------------------------------------------
	defb 015h,000h,00eh,000h,000h,055h,05dh,000h,000h,0aah,0aeh,00ch,0cch,055h,055h,055h	; 9ed3  .....U]......UUU
	defb 055h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,003h,0ffh,0ffh,0ffh	; 9ee3  U...............
	defb 0fbh,018h,0c6h,031h,08bh,0ffh,0ffh,0ffh,0fbh,000h,000h,000h,003h,0ffh,0ffh,0ffh	; 9ef3  ...1............
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,055h,055h,055h,055h,0aah,0aah,0aah,0aah,000h,000h,000h	; 9f03  .....UUUU.......
	defb 005h,0ffh,0ffh,0ffh,0fah,000h,000h,000h,00dh,000h,000h,000h,01eh,03ch,0f3h,0cfh	; 9f13  .............<..
	defb 03fh,03ch,0f3h,0cfh,01fh,000h,000h,000h,04fh,000h,000h,000h,0e7h,0ffh,0ffh,0ffh	; 9f23  ?<......O.......
	defb 0ffh,000h,000h,003h,0e7h,055h,055h,055h,0e7h,0aah,0aah,0aah,0e7h,000h,000h,014h	; 9f33  .....UUU........
	defb 0e7h,0ffh,0ffh,0aah,0ffh,055h,055h,094h,0ffh,066h,0aah,0aah,0e7h,055h,011h,090h	; 9f43  .....UU..f...U..
	defb 0e7h,002h,0aah,0aah,0e7h,005h,05fh,0fch,0e7h,0ceh,0bfh,0fah,0ffh,055h,055h,055h	; 9f53  ......_......UUU
	defb 055h,080h,000h,000h,000h,040h,000h,000h,000h,080h,000h,000h,000h,040h,000h,000h	; 9f63  U....@.......@..
	defb 000h,082h,0aah,0aah,0aah,041h,0fdh,05fh,0fdh,083h,0a8h,0bah,0a8h,041h,001h,050h	; 9f73  .....A._.....A.P
	defb 001h,082h,0aah,0aah,0aah,047h,0ffh,0ffh,0ffh,08fh,0ffh,0ffh,0ffh,05fh,000h,0ffh	; 9f83  .....G......._..
	defb 0ffh,0bch,00ah,03fh,0fch,058h,015h,095h,058h,0aah,00bh,0dah,0aah,058h,017h,0d4h	; 9f93  ...?.X..X....X..
	defb 018h,0aah,00bh,0d9h,0aah,058h,017h,0d5h,098h,0aah,07fh,0d9h,0aah,059h,080h,075h	; 9fa3  .....X.......Y.u
	defb 099h,0aah,00bh,019h,0aah,058h,017h,0d5h,098h,0aah,00bh,0d9h,0aah,058h,017h,0d5h	; 9fb3  .....X.......X..
	defb 098h,0aah,00bh,0d9h,0aah,058h,017h,0d5h,098h,0aah,07fh,0d9h,0aah,059h,080h,075h	; 9fc3  .....X.......Y.u
	defb 099h,0aah,00bh,019h,0aah,058h,017h,0d5h,098h,0aah,00bh,0d9h,0aah,055h,055h,055h	; 9fd3  .....X.......UUU
	defb 055h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9fe3  U...............
	defb 000h,0aah,0aah,0aah,0aah,057h,0ffh,0ffh,055h,0aeh,0aah,0aah,02bh,054h,000h,000h	; 9ff3  .....W..U...+T..
	defb 055h,0aah,0aah,0aah,0aah,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0ffh,0ffh	; a003  U...............
	defb 000h,00ah,03fh,0fch,00ah,015h,095h,058h,015h,00bh,0dah,0aah,00bh,017h,0d4h,018h	; a013  ..?....X........
	defb 017h,00bh,0d9h,0aah,00bh,017h,0d5h,098h,017h,07fh,0d9h,0aah,07fh,080h,075h,099h	; a023  ..............u.
	defb 080h,00bh,019h,0aah,00bh,017h,0d5h,098h,017h,00bh,0d9h,0aah,00bh,017h,0d5h,098h	; a033  ................
	defb 017h,00bh,0d9h,0aah,00bh,017h,0d5h,098h,017h,07fh,0d9h,0aah,07fh,080h,075h,099h	; a043  ..............u.
	defb 080h,00bh,019h,0aah,00bh,017h,0d5h,098h,017h,00bh,0d9h,0aah,00bh,055h,055h,055h	; a053  .............UUU
	defb 055h,000h,000h,000h,002h,000h,000h,000h,005h,000h,000h,000h,00eh,000h,000h,000h	; a063  U...............
	defb 01dh,0aah,0aah,0aah,0beh,0ffh,0f5h,07fh,07dh,0aah,0a2h,0eah,03eh,000h,005h,040h	; a073  ........}...>..@
	defb 07dh,0aah,0aah,0aah,0beh,0ffh,0ffh,0ffh,0fdh,0ffh,0ffh,0ffh,0feh,0ffh,0ffh,000h	; a083  }...............
	defb 0fdh,03fh,0fch,00ah,03eh,095h,058h,015h,095h,0dah,0aah,00bh,0dah,0d4h,018h,017h	; a093  .?..>.X.........
	defb 0d5h,0d9h,0aah,00bh,0dah,0d5h,098h,017h,0d5h,0d9h,0aah,07fh,0dah,075h,099h,080h	; a0a3  .............u..
	defb 075h,019h,0aah,00bh,01ah,0d5h,098h,017h,0d5h,0d9h,0aah,00bh,0dah,0d5h,098h,017h	; a0b3  u...............
	defb 0d5h,0d9h,0aah,00bh,0dah,0d5h,098h,017h,0d5h,0d9h,0aah,07fh,0dah,075h,099h,080h	; a0c3  .............u..
	defb 075h,019h,0aah,00bh,01ah,0d5h,098h,017h,0d5h,0d9h,0aah,00bh,0dah,005h,055h,055h	; a0d3  u.............UU
	defb 0c6h,08ch,0bfh,0feh,081h,005h,055h,055h,055h,08ah,0e8h,0bah,022h,005h,017h,045h	; a0e3  ......UUU..."..E
	defb 0ddh,08ah,0aah,0aah,0aah,000h,000h,000h,000h,080h,000h,000h,000h,000h,000h,000h	; a0f3  ................
	defb 000h,080h,0aah,0aah,0aah,001h,0d5h,055h,055h,080h,02fh,0ffh,0ffh,001h,05fh,0ffh	; a103  .......UU./..._.
	defb 0ffh,080h,0bah,0aah,0aah,001h,075h,055h,055h,080h,0ebh,0ffh,0ffh,001h,077h,011h	; a113  ......uUU.....w.
	defb 011h,080h,0ebh,0ffh,0ffh,001h,075h,055h,055h,080h,0bah,0aah,0aah,001h,05ch,000h	; a123  ......uUU.....\.
	defb 000h,080h,028h,000h,000h,001h,0d5h,055h,055h,080h,0aah,0aah,0aah,001h,0ffh,0ffh	; a133  ..(....UU.......
	defb 0ffh,083h,0ffh,0ffh,0ffh,007h,0ffh,0ffh,0ffh,08fh,0ffh,0ffh,0ffh,01fh,0ffh,0ffh	; a143  ................
	defb 0ffh,0bfh,0ffh,0ffh,0ffh,055h,055h,055h,055h,0aah,0aah,0aah,0aah,000h,060h,006h	; a153  .....UUUU.....`.
	defb 000h,0ffh,080h,001h,0ffh,055h,055h,055h,055h,022h,022h,022h,000h,0ddh,0ddh,0ddh	; a163  .....UUUU"""....
	defb 0ffh,0aah,0aah,0aah,0aah,000h,007h,000h,000h,000h,00fh,000h,000h,000h,01fh,000h	; a173  ................
	defb 000h,0aah,0bfh,002h,0aah,055h,01fh,005h,07fh,0feh,0ffh,002h,0eah,0fdh,05fh,005h	; a183  .....U........_.
	defb 04eh,0a8h,0bfh,002h,0eah,054h,05fh,004h,000h,0fah,03fh,000h,000h,01ch,05fh,004h	; a193  N....T_...?..._.
	defb 0fch,0fah,03fh,000h,0fch,054h,05fh,004h,000h,0a8h,0bfh,000h,000h,001h,05fh,005h	; a1a3  ..?..T_......._.
	defb 015h,002h,0ffh,002h,080h,055h,01fh,005h,055h,0aah,0bfh,002h,0aah,0ffh,0ffh,007h	; a1b3  .....U..U.......
	defb 0ffh,0ffh,0ffh,00fh,0ffh,0ffh,0ffh,01fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; a1c3  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,055h,055h,055h,055h,0aah,0aah,0aah,0aah,042h,065h,049h	; a1d3  .....UUUU....BeI
	defb 095h,0c2h,0aah,04ah,0afh,042h,065h,049h,097h,0c2h,0aah,04ah,086h,042h,065h,049h	; a1e3  ...J.BeI...J.BeI
	defb 0fch,0c2h,0b2h,0cah,0a8h,063h,055h,069h,055h,0a1h,032h,0a4h,0aah,061h,059h,06ch	; a1f3  .....cUiU.2..aYl
	defb 057h,0b1h,0aah,0b6h,028h,050h,095h,05bh,085h,0b0h,0ach,0aeh,0e0h,018h,0d6h,057h	; a203  W...(P.[.......W
	defb 0ffh,0e8h,06bh,02ah,0ffh,058h,025h,095h,03fh,0adh,032h,0cah,08fh,016h,059h,065h	; a213  ..k*.X%.?.2...Ye
	defb 050h,0ebh,02ch,0b2h,0aah,057h,056h,05ch,055h,0abh,0abh,02bh,08ah,015h,0d5h,095h	; a223  P.,..WV\U..+....
	defb 070h,0eah,0ebh,0cah,0afh,05dh,07dh,071h,055h,0aeh,0bbh,0fch,0aah,01bh,05eh,0ffh	; a233  p....]}qU.....^.
	defb 015h,0e9h,0afh,0ffh,0e0h,05ch,0d7h,0ffh,0ffh,0afh,0eah,0ffh,0ffh,015h,055h,07fh	; a243  .....\........U.
	defb 0ffh,0e2h,022h,02fh,0ffh,05dh,0ddh,0d7h,0ffh,0aah,0aah,0aah,0bfh,055h,05dh,003h	; a253  .."/.].......U].
	defb 033h,0ffh,0feh,00ch,0ffh,0ffh,0fdh,003h,0ffh,0aah,0aah,00ch,0c3h,000h,000h,003h	; a263  3...............
	defb 0ffh,000h,000h,00ch,0ffh,055h,055h,043h,033h,0aah,0aah,08fh,0ffh,077h,077h,05fh	; a273  .....UUC3....ww_
	defb 0ffh,088h,088h,0aah,0aah,055h,055h,055h,055h,000h	; a283  .....UUUU.

; ======================================================================
; CODIGO 0xa28d..0xa31f  (146 bytes)
; ======================================================================


L_A28D:
	nop			;a28d
	nop			;a28e
	nop			;a28f
	rst 38h			;a290
	rst 38h			;a291
	rst 38h			;a292
	rst 38h			;a293
	rst 38h			;a294
	rst 38h			;a295
	rst 38h			;a296
	rst 38h			;a297
	rst 38h			;a298
	rst 38h			;a299
	rst 38h			;a29a
	rst 38h			;a29b
	rst 38h			;a29c
	rst 38h			;a29d
	rst 38h			;a29e
	ret p			;a29f
	nop			;a2a0
	nop			;a2a1
	rrca			;a2a2
	ret m			;a2a3
	xor d			;a2a4
	xor (hl)		;a2a5
	sub e			;a2a6
	rst 38h			;a2a7
	ld d,l			;a2a8
	dec e			;a2a9
L_A2AA:
	inc a			;a2aa
	rst 38h			;a2ab
	xor b			;a2ac
	jp pe,01f7fh		;a2ad
	rlca			;a2b0
	ld d,h			;a2b1
	rst 38h			;a2b2
	ret nz			;a2b3
	jp m,0ffa9h		;a2b4
	xor d			;a2b7
	ld d,l			;a2b8
	ld d,a			;a2b9
	rst 38h			;a2ba
	ld d,l			;a2bb
	xor d			;a2bc
	adc a,a			;a2bd
	cp 0afh			;a2be
	ld d,h			;a2c0
	ld a,a			;a2c1
	defb 0fdh,058h,003h ;illegal sequence	;a2c2
	rst 38h			;a2c5
	jp m,0ffb7h		;a2c6
	rst 38h			;a2c9
	push af			;a2ca
	ld l,l			;a2cb
	rst 38h			;a2cc
	rst 38h			;a2cd
	xor d			;a2ce
	ret c			;a2cf
	rst 38h			;a2d0
	rst 38h			;a2d1
	ld d,b			;a2d2
	ccf			;a2d3
	rst 38h			;a2d4
	jp m,0ffbfh		;a2d5
	rst 38h			;a2d8
	push de			;a2d9
	ld d,l			;a2da
	ld d,l			;a2db
	cp 0aah			;a2dc
	xor d			;a2de
	xor d			;a2df
	dec a			;a2e0
	dec e			;a2e1
	ld e,h			;a2e2
	rst 38h			;a2e3
	adc a,0bah		;a2e4
	cp d			;a2e6
	rst 20h			;a2e7
	dec a			;a2e8
	ld e,l			;a2e9
	ld e,h			;a2ea
	rst 20h			;a2eb
	adc a,0bah		;a2ec
	cp d			;a2ee
	rst 20h			;a2ef
	dec a			;a2f0
	dec e			;a2f1
	ld e,h			;a2f2
	rst 20h			;a2f3
	adc a,0bfh		;a2f4
	jp m,03dffh		;a2f6
	ld e,a			;a2f9
	call m,0feffh		;a2fa
	xor d			;a2fd
	xor d			;a2fe
	rst 20h			;a2ff
	defb 0fdh,011h,010h ;illegal sequence	;a300
	rst 20h			;a303
	xor d			;a304
	xor d			;a305
	xor d			;a306
	rst 20h			;a307
	ld d,l			;a308
	ld d,l			;a309
	ld d,l			;a30a
	rst 20h			;a30b
	nop			;a30c
	nop			;a30d
	inc bc			;a30e
	rst 38h			;a30f
	rst 38h			;a310
	rst 38h			;a311
	rst 38h			;a312
	rst 38h			;a313
	rst 38h			;a314
	rst 38h			;a315
	rst 38h			;a316
	rst 20h			;a317
	rst 38h			;a318
	rst 38h			;a319
	rst 38h			;a31a
	rst 8			;a31b
	jp 0300ch		;a31c

; ----------------------------------------------------------------------
; DATOS tiles: de los niveles: 111 de 32x32, 128 bytes cada uno
;   0x6de0..0xa560  (14208 bytes)
; ----------------------------------------------------------------------
	defb 0dfh,0c3h,00ch,030h,0ffh,0ffh,0ffh,0ffh,0feh,0ffh,0ffh,0ffh,0fdh,0ffh,0ffh,0ffh	; a31f  ...0............
	defb 0fah,000h,000h,000h,005h,0aah,0aah,0aah,0aah,055h,0ffh,0ffh,0fdh,0fah,0ffh,0ffh	; a32f  .........U......
	defb 0f8h,00dh,0d5h,055h,051h,0fah,0e0h,000h,008h,05dh,0dfh,0ffh,0f1h,01ah,0e0h,000h	; a33f  ...UQ....]......
	defb 008h,0fdh,0d5h,055h,051h,0fah,080h,000h,000h,055h,000h,000h,001h,0aah,0aah,0aah	; a34f  ...UQ....U......

; ======================================================================
; CODIGO 0xa35f..0xa4b6  (343 bytes)
; ======================================================================


L_A35F:
	xor d			;a35f
	ld e,b			;a360
	rla			;a361
	push de			;a362
	sbc a,b			;a363
	xor d			;a364
	dec bc			;a365
	exx			;a366
	xor d			;a367
	ld e,b			;a368
	rla			;a369
	push de			;a36a
	sbc a,b			;a36b
	xor d			;a36c
	ld a,a			;a36d
	exx			;a36e
	xor d			;a36f
	ld e,c			;a370
	add a,b			;a371
	ld (hl),l		;a372
	sbc a,c			;a373
	xor d			;a374
	dec bc			;a375
	add hl,de		;a376
	xor d			;a377
	ld e,b			;a378
	rla			;a379
	push de			;a37a
	sbc a,b			;a37b
	xor d			;a37c
	dec bc			;a37d
	exx			;a37e
	xor d			;a37f
	ld e,b			;a380
	rla			;a381
	push de			;a382
	sbc a,b			;a383
	xor d			;a384
	dec bc			;a385
	exx			;a386
	xor d			;a387
	ld e,b			;a388
	rla			;a389
	push de			;a38a
	sbc a,b			;a38b
	xor d			;a38c
	ld a,a			;a38d
	exx			;a38e
	xor d			;a38f
	ld e,c			;a390
	add a,b			;a391
	ld (hl),l		;a392
	sbc a,c			;a393
	xor d			;a394
	dec bc			;a395
	add hl,de		;a396
	xor d			;a397
	ld e,b			;a398
	rla			;a399
	call nc,L_AA18		;a39a
	dec bc			;a39d
	jp c,058aah		;a39e
	rla			;a3a1
	push de			;a3a2
	ld e,b			;a3a3
	adc a,d			;a3a4
	dec bc			;a3a5
	djnz L_A3D2		;a3a6
	ld b,000h		;a3a8
	ld h,b			;a3aa
	ld a,b			;a3ab
	add a,c			;a3ac
	rst 38h			;a3ad
	add a,b			;a3ae
	jp pe,L_5505		;a3af
	ld d,l			;a3b2
	ld sp,hl		;a3b3
	adc a,d			;a3b4
	xor d			;a3b5
	xor d			;a3b6
	jp pe,L_7F05		;a3b7
	defb 0fdh,0f8h,08ch ;illegal sequence	;a3ba
	jp pe,L_EAAA		;a3bd
	dec b			;a3c0
	ld b,b			;a3c1
	ld bc,08af8h		;a3c2
	ret po			;a3c5
	ld a,(bc)		;a3c6
	jp pe,04e05h		;a3c7
	pop hl			;a3ca
	ret m			;a3cb
	adc a,d			;a3cc
	xor 0eah		;a3cd
	jp pe,04003h		;a3cf
L_A3D2:
	ld bc,08af9h		;a3d2
	ret po			;a3d5
	ld a,(bc)		;a3d6
	jp pe,L_5505		;a3d7
	ld d,c			;a3da
	ret m			;a3db
	adc a,d			;a3dc
	add a,b			;a3dd
	ld (bc),a		;a3de
	jp pe,L_D517		;a3df
	sbc a,b			;a3e2
	rla			;a3e3
	dec bc			;a3e4
	exx			;a3e5
	xor d			;a3e6
	dec bc			;a3e7
	rla			;a3e8
	push de			;a3e9
	sbc a,b			;a3ea
	rla			;a3eb
	ld a,a			;a3ec
	exx			;a3ed
	xor d			;a3ee
	ld a,a			;a3ef
	add a,b			;a3f0
	ld (hl),l		;a3f1
	sbc a,c			;a3f2
	add a,b			;a3f3
	dec bc			;a3f4
	add hl,de		;a3f5
	xor d			;a3f6
	dec bc			;a3f7
	rla			;a3f8
	push de			;a3f9
	sbc a,b			;a3fa
	rla			;a3fb
	dec bc			;a3fc
	exx			;a3fd
	xor d			;a3fe
	dec bc			;a3ff
	rla			;a400
	push de			;a401
	sbc a,b			;a402
	rla			;a403
	dec bc			;a404
	exx			;a405
	xor d			;a406
	dec bc			;a407
	rla			;a408
	push de			;a409
	sbc a,b			;a40a
	rla			;a40b
	ld a,a			;a40c
	exx			;a40d
	xor d			;a40e
	ld a,a			;a40f
	add a,b			;a410
	ld (hl),l		;a411
	sbc a,c			;a412
	add a,b			;a413
	dec bc			;a414
	add hl,de		;a415
	xor d			;a416
	dec bc			;a417
	rla			;a418
	push de			;a419
	sbc a,b			;a41a
	rla			;a41b
	dec bc			;a41c
	exx			;a41d
	xor d			;a41e
	dec bc			;a41f
	rla			;a420
	push de			;a421
	sbc a,b			;a422
	rla			;a423
	dec bc			;a424
	exx			;a425
	xor d			;a426
	dec bc			;a427
	rla			;a428
	push de			;a429
	sbc a,b			;a42a
	rla			;a42b
	ld a,a			;a42c
	exx			;a42d
	xor d			;a42e
	ld a,a			;a42f
	add a,b			;a430
	ld (hl),l		;a431
	sbc a,c			;a432
	add a,b			;a433
	dec bc			;a434
	add hl,de		;a435
	xor d			;a436
	dec bc			;a437
	rla			;a438
	push de			;a439
	sbc a,b			;a43a
	rla			;a43b
	dec bc			;a43c
	exx			;a43d
	xor d			;a43e
	dec bc			;a43f
	rla			;a440
	push de			;a441
	sbc a,b			;a442
	rla			;a443
	dec bc			;a444
	exx			;a445
	xor d			;a446
	dec bc			;a447
	rla			;a448
	push de			;a449
	sbc a,b			;a44a
	rla			;a44b
	ld a,a			;a44c
	exx			;a44d
	xor d			;a44e
	ld a,a			;a44f
	add a,b			;a450
	ld (hl),h		;a451
	add hl,de		;a452
	add a,b			;a453
	dec bc			;a454
	ld a,(de)		;a455
	xor d			;a456
	dec bc			;a457
	rla			;a458
	push de			;a459
	ld e,b			;a45a
	rla			;a45b
	dec bc			;a45c
	djnz $+12		;a45d
	dec bc			;a45f
L_A460:
	push de			;a460
	sbc a,b			;a461
	rla			;a462
	push de			;a463
	exx			;a464
	xor d			;a465
	dec bc			;a466
	jp c,L_98D5		;a467
	rla			;a46a
	push de			;a46b
	exx			;a46c
	xor d			;a46d
	ld a,a			;a46e
	jp c,L_9975		;a46f
	add a,b			;a472
	ld (hl),l		;a473
	add hl,de		;a474
	xor d			;a475
	dec bc			;a476
	ld a,(de)		;a477
	push de			;a478
	sbc a,b			;a479
	rla			;a47a
	push de			;a47b
	exx			;a47c
	xor d			;a47d
	dec bc			;a47e
	jp c,L_98D5		;a47f
	rla			;a482
	push de			;a483
	exx			;a484
	xor d			;a485
	dec bc			;a486
	jp c,L_98D5		;a487
	rla			;a48a
	push de			;a48b
	exx			;a48c
	xor d			;a48d
	ld a,a			;a48e
	jp c,L_9975		;a48f
	add a,b			;a492
	ld (hl),l		;a493
	add hl,de		;a494
	xor d			;a495
	dec bc			;a496
	ld a,(de)		;a497
	call nc,01718h		;a498
	push de			;a49b
	jp c,00baah		;a49c
	jp c,058d5h		;a49f
	rla			;a4a2
	push de			;a4a3
	ret c			;a4a4
	ex af,af'		;a4a5
	dec bc			;a4a6
	ld (de),a		;a4a7
	ret nc			;a4a8
	ld b,000h		;a4a9
	ld h,a			;a4ab
L_A4AC:
	ret c			;a4ac
	ld bc,08effh		;a4ad
	ld (hl),b		;a4b0
	ld d,l			;a4b1
	ld d,l			;a4b2
	ld e,a			;a4b3
	jr L_A460		;a4b4

; ----------------------------------------------------------------------
; DATOS tiles: de los niveles: 111 de 32x32, 128 bytes cada uno
;   0x6de0..0xa560  (14208 bytes)
; ----------------------------------------------------------------------
	defb 0aah,0aeh,0d0h,050h,000h,05fh,0d8h,0f0h,000h,0eeh,0d0h,041h,055h,0dfh,0d8h,0c2h	; a4b6  ...P._.....AU...
	defb 038h,0eeh,0d0h,051h,0c7h,0dfh,0d8h,0c2h,0aah,0eeh,070h,057h,0ffh,0dfh,018h	; a4c6  8..Q......pW...

; ======================================================================
; CODIGO 0xa4d5..0xa601  (300 bytes)
; ======================================================================


L_A4D5:
	rst 8			;a4d5
	rst 38h			;a4d6
	xor 0d0h		;a4d7
	ld d,l			;a4d9
	ld d,e			;a4da
	ld e,a			;a4db
	djnz $-48		;a4dc
	adc a,d			;a4de
	ld c,060h		;a4df
	ld d,c			;a4e1
	ld (hl),e		;a4e2
	ld e,a			;a4e3
	add a,b			;a4e4
	jp z,04eaah		;a4e5
	ld d,l			;a4e8
	ld b,b			;a4e9
	inc bc			;a4ea
	ld e,a			;a4eb
	nop			;a4ec
	rra			;a4ed
	cp 04eh			;a4ee
	rst 38h			;a4f0
	push af			;a4f1
	ld d,l			;a4f2
	rra			;a4f3
	xor d			;a4f4
	xor d			;a4f5
	xor d			;a4f6
	xor (hl)		;a4f7
	nop			;a4f8
	nop			;a4f9
	nop			;a4fa
	rra			;a4fb
	nop			;a4fc
	nop			;a4fd
	nop			;a4fe
	ld a,000h		;a4ff
	nop			;a501
	nop			;a502
	ld a,a			;a503
	xor d			;a504
	xor d			;a505
	xor d			;a506
	cp 0ffh			;a507
	rst 38h			;a509
	push de			;a50a
	ld a,a			;a50b
	xor d			;a50c
	xor d			;a50d
	jp pe,L_55FE		;a50e
	nop			;a511
	ld bc,09c7fh		;a512
	add a,b			;a515
	inc bc			;a516
	cp 055h			;a517
	dec d			;a519
	ld d,a			;a51a
	ld a,a			;a51b
	xor d			;a51c
	adc a,b			;a51d
	adc a,e			;a51e
	cp 000h			;a51f
	rla			;a521
	ld (hl),a		;a522
	ld a,a			;a523
	rst 38h			;a524
	push bc			;a525
	out (0feh),a		;a526
L_A528:
	ld d,l			;a528
	rla			;a529
	ld (hl),a		;a52a
	ld a,a			;a52b
	sbc a,h			;a52c
	adc a,b			;a52d
	adc a,e			;a52e
	cp 055h			;a52f
	dec d			;a531
	ld d,a			;a532
	ld a,a			;a533
	nop			;a534
	ccf			;a535
	rst 38h			;a536
	cp 055h			;a537
	ld a,a			;a539
	rst 38h			;a53a
	ld a,a			;a53b
	xor d			;a53c
	xor d			;a53d
	xor d			;a53e
	cp 0ffh			;a53f
	rst 38h			;a541
	rst 38h			;a542
	rst 38h			;a543
	rst 38h			;a544
	rst 38h			;a545
	rst 38h			;a546
	cp 0ffh			;a547
	rst 38h			;a549
	rst 38h			;a54a
	rst 38h			;a54b
	rst 38h			;a54c
	rst 38h			;a54d
	rst 38h			;a54e
	cp 0ffh			;a54f
	rst 38h			;a551
	rst 38h			;a552
	rst 38h			;a553
	rst 38h			;a554
	rst 38h			;a555
	rst 38h			;a556
	cp 055h			;a557
	ld d,l			;a559
	ld d,l			;a55a
	ld d,l			;a55b
	xor d			;a55c
	xor d			;a55d
	xor d			;a55e
	xor d			;a55f
	add hl,de		;a560
	ld a,a			;a561
	nop			;a562
	nop			;a563
	di			;a564
	ccf			;a565
	inc bc			;a566
	nop			;a567
	push hl			;a568
	sbc a,a			;a569
	dec b			;a56a
	add a,b			;a56b
L_A56C:
	jp z,00acfh		;a56c
	ret nz			;a56f
	jp nc,012e7h		;a570
	ret po			;a573
	ret nc			;a574
	or a			;a575
	djnz L_A528		;a576
	sub b			;a578
	di			;a579
	djnz L_A56C		;a57a
	xor b			;a57c
	in a,(028h)		;a57d
	ret c			;a57f
	or l			;a580
	in a,(035h)		;a581
	ret c			;a583
	cp d			;a584
	srl d			;a585
	ret z			;a587
	or (hl)			;a588
	ei			;a589
	ld (hl),0f8h		;a58a
	xor c			;a58c
	ld a,e			;a58d
	add hl,hl		;a58e
	ld a,b			;a58f
	adc a,l			;a590
	ld (hl),e		;a591
	dec c			;a592
	ld (hl),b		;a593
	in a,(087h)		;a594
	dec de			;a596
	add a,b			;a597
	in a,(0bfh)		;a598
	dec de			;a59a
	add a,b			;a59b
	ret nz			;a59c
	ccf			;a59d
	nop			;a59e
	nop			;a59f
	rst 38h			;a5a0
	rst 38h			;a5a1
	nop			;a5a2
	nop			;a5a3
	cp 001h			;a5a4
	nop			;a5a6
	nop			;a5a7
	ret m			;a5a8
	defb 0fdh,000h,0fch ;illegal sequence	;a5a9
	ex (sp),hl		;a5ac
	add a,l			;a5ad
	inc bc			;a5ae
	add a,h			;a5af
	rst 8			;a5b0
	dec d			;a5b1
	rrca			;a5b2
	inc d			;a5b3
	call nc,0142dh		;a5b4
	inc l			;a5b7
	add a,e			;a5b8
	dec e			;a5b9
	inc bc			;a5ba
	inc e			;a5bb
	ld a,(03aedh)		;a5bc
	call pe,L_F972		;a5bf
	ld (hl),d		;a5c2
	ret m			;a5c3
	ld l,l			;a5c4
	ex de,hl		;a5c5
	ld l,l			;a5c6
	ret pe			;a5c7
	dec e			;a5c8
	in a,(01dh)		;a5c9
	ret c			;a5cb
	cp e			;a5cc
	sub e			;a5cd
	dec sp			;a5ce
	sub b			;a5cf
	sub l			;a5d0
	rst 20h			;a5d1
	dec d			;a5d2
	ret po			;a5d3
	ret nz			;a5d4
	rst 8			;a5d5
	nop			;a5d6
	ret nz			;a5d7
	cp 01fh			;a5d8
	nop			;a5da
	nop			;a5db
	rst 38h			;a5dc
	rst 38h			;a5dd
	nop			;a5de
	nop			;a5df
	rst 38h			;a5e0
	rst 38h			;a5e1
	nop			;a5e2
	nop			;a5e3
	ret po			;a5e4
	ccf			;a5e5
	nop			;a5e6
	nop			;a5e7
	rrca			;a5e8
	add a,a			;a5e9
	rrca			;a5ea
	add a,b			;a5eb
	ld h,a			;a5ec
	ld (hl),e		;a5ed
	ld h,a			;a5ee
	ld (hl),b		;a5ef
	ld a,d			;a5f0
	adc a,c			;a5f1
	ld a,d			;a5f2
	adc a,b			;a5f3
	dec d			;a5f4
	inc b			;a5f5
	dec d			;a5f6
	inc b			;a5f7
	ld h,(hl)		;a5f8
	ld a,(de)		;a5f9
	ld h,(hl)		;a5fa
	ld a,(de)		;a5fb
	ld a,c			;a5fc
	ld b,079h		;a5fd
	ld b,067h		;a5ff

; ----------------------------------------------------------------------
; DATOS sprites:: 83 de 16x16 con mascara, 64 bytes cada uno
;   0xa560..0xba20  (5312 bytes)
; ----------------------------------------------------------------------
	defb 0fch,067h,0fch,01fh,0d9h,01fh,0d8h,0dch,073h,01ch,070h,0ddh,0e7h,01dh,0e0h,0cfh	; a601  .g......s.p.....
	defb 08fh,00fh,080h,0e0h,03fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0f8h	; a611  ....?...........
	defb 07fh,000h,000h,0e3h,03fh,003h,000h,0cbh,08fh,00bh,080h,0ddh,0a7h,01dh,0a0h,0ceh	; a621  ....?...........
	defb 097h,00eh,090h,0d6h,033h,016h,030h,0c9h,0dbh,009h,0d8h,09eh,059h,01eh,058h,0bfh	; a631  ....3.0.....Y.X.
	defb 08dh,03fh,08ch,0b7h,085h,037h,084h,093h,0a5h,013h,0a4h,0cdh,055h,00dh,054h,0e7h	; a641  .?...7......U.T.
	defb 0e5h,007h,0e4h,0f0h,0fdh,000h,0fch,0feh,001h,000h,000h,0ffh,0ffh,000h,000h,0fch	; a651  ................
	defb 003h,000h,000h,0fdh,0dbh,001h,0d8h,0e1h,0dbh,001h,0d8h,0ceh,0b1h,00eh,0b0h,0deh	; a661  ................
	defb 095h,01eh,094h,0dfh,06dh,01fh,06ch,0d3h,05dh,013h,05ch,0dbh,0adh,01bh,0ach,0dbh	; a671  ....m.l.].\.....
	defb 015h,01bh,014h,0cfh,009h,00fh,008h,0edh,00bh,00dh,008h,0e7h,04bh,007h,048h,0f3h	; a681  ............K.H.
	defb 053h,003h,050h,0f9h,0a7h,001h,0a0h,0fch,0cfh,000h,0c0h,0feh,01fh,000h,000h,0ffh	; a691  S.P.............
	defb 0ffh,000h,000h,0f8h,07fh,000h,000h,0f3h,003h,003h,000h,0e7h,0a9h,007h,0a8h,0c9h	; a6a1  ................
	defb 0ddh,009h,0dch,0dbh,0b8h,01bh,0b8h,0d7h,0b6h,017h,0b6h,09fh,04eh,01fh,04eh,0b7h	; a6b1  ............N.N.
	defb 05ch,037h,05ch,0b8h,0c1h,038h,0c0h,0b4h,02bh,034h,028h,0a8h,0f3h,028h,0f0h,0a1h	; a6c1  \7\..8..+4(..(..
	defb 0c7h,021h,0c0h,0bfh,01fh,03fh,000h,080h,07fh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; a6d1  .!...?..........
	defb 0ffh,000h,000h,0ffh,0ffh,000h,000h,0fch,007h,000h,000h,0f1h,0f3h,001h,0f0h,0e7h	; a6e1  ................
	defb 0bbh,007h,0b8h,0ceh,03bh,00eh,038h,09bh,0f8h,01bh,0f8h,03fh,0e6h,03fh,0e6h,060h	; a6f1  ....;.8....?.?.`
	defb 09eh,060h,09eh,058h,066h,058h,066h,020h,0a8h,020h,0a8h,091h,05eh,011h,05eh,0ceh	; a701  .`.XfXf . ..^.^.
	defb 0e6h,00eh,0e6h,0e1h,0f0h,001h,0f0h,0fch,007h,000h,000h,0ffh,0ffh,000h,000h,0ffh	; a711  ................
	defb 0ffh,000h,000h,080h,07fh,000h,000h,0bfh,00fh,03fh,000h,0a7h,0e7h,027h,0e0h,0aah	; a721  .........?...'..
	defb 0b3h,02ah,0b0h,0a5h,0c9h,025h,0c8h,0a1h,0edh,021h,0ech,0b1h,0fdh,031h,0fch,09ah	; a731  .*...%...!...1..
	defb 079h,01ah,078h,0dbh,093h,01bh,090h,0cch,06bh,00ch,068h,0e9h,073h,009h,070h,0e5h	; a741  y.x.....k.h.s.p.
	defb 0bbh,005h,0b8h,0f1h,0d3h,001h,0d0h,0fch,0c7h,000h,0c0h,0feh,01fh,000h,000h,0fch	; a751  ................
	defb 03fh,000h,000h,0f1h,08fh,001h,080h,0e6h,067h,006h,060h,0cch,0b3h,00ch,0b0h,09dh	; a761  ?.......g.`.....
	defb 039h,01dh,038h,0b5h,02dh,035h,02ch,03ch,03ch,03ch,03ch,06ch,036h,06ch,036h,06eh	; a771  9.8.-5,<<<<l6l6n
	defb 076h,06eh,076h,04dh,0b2h,04dh,0b2h,07dh,0beh,07dh,0beh,07bh,0deh,07bh,0deh,015h	; a781  vnvM.M.}.}.{.{..
	defb 0a8h,015h,0a8h,0ceh,073h,00eh,070h,0eeh,077h,00eh,070h,0e0h,007h,000h,000h,0fch	; a791  ....s.p.w.p.....
	defb 007h,000h,000h,0e1h,0f1h,001h,0f0h,0cfh,07dh,00fh,07ch,09dh,0c4h,01dh,0c4h,0b3h	; a7a1  ........}.|.....
	defb 096h,033h,096h,0b7h,026h,037h,026h,0bfh,00eh,03fh,00eh,088h,09ah,008h,09ah,097h	; a7b1  .3..&7&..?......
	defb 07eh,017h,07eh,0bbh,074h,03bh,074h,0b5h,06dh,035h,06ch,082h,0cdh,002h,0cch,0f7h	; a7c1  ~.~.t;t.m5l.....
	defb 079h,007h,078h,0f6h,073h,006h,070h,0f0h,007h,000h,000h,0ffh,0ffh,000h,000h,0e0h	; a7d1  y.x.s.p.........
	defb 03fh,000h,000h,0efh,08fh,00fh	; a7e1  ?.....

; ======================================================================
; CODIGO 0xa7e7..0xa942  (347 bytes)
; ======================================================================


L_A7E7:
	add a,b			;a7e7
	call 00de7h		;a7e8
	ret po			;a7eb
	inc e			;a7ec
	ld (hl),e		;a7ed
	inc e			;a7ee
	ld (hl),b		;a7ef
	ld l,a			;a7f0
	exx			;a7f1
	ld l,a			;a7f2
	ret c			;a7f3
	ld (hl),a		;a7f4
	ld (iy-004h),a		;a7f5
	ld l,c			;a7f8
	inc b			;a7f9
	ld l,c			;a7fa
	inc b			;a7fb
	ld e,032h		;a7fc
	ld e,032h		;a7fe
	ld e,00ah		;a800
	ld e,00ah		;a802
	ld l,c			;a804
	inc b			;a805
	ld l,c			;a806
	inc b			;a807
	ld (hl),a		;a808
	ld (iy-004h),a		;a809
	ld l,a			;a80c
	exx			;a80d
	ld l,a			;a80e
	ret c			;a80f
	inc e			;a810
	ld (hl),e		;a811
	inc e			;a812
	ld (hl),b		;a813
	call 00de7h		;a814
	ret po			;a817
	rst 28h			;a818
	adc a,a			;a819
	rrca			;a81a
	add a,b			;a81b
	ret po			;a81c
	ccf			;a81d
	nop			;a81e
	nop			;a81f
	rst 38h			;a820
	rst 38h			;a821
	nop			;a822
	nop			;a823
	ret p			;a824
	rlca			;a825
	nop			;a826
	nop			;a827
	or 073h			;a828
	ld b,070h		;a82a
	rst 30h			;a82c
	ld a,c			;a82d
	rlca			;a82e
	ld a,b			;a82f
	add a,d			;a830
	call L_CC02		;a831
	or l			;a834
	ld l,l			;a835
	dec (hl)		;a836
	ld l,h			;a837
	cp e			;a838
	ld (hl),h		;a839
	dec sp			;a83a
	ld (hl),h		;a83b
	sub a			;a83c
	ld a,(hl)		;a83d
	rla			;a83e
	ld a,(hl)		;a83f
	adc a,b			;a840
	sbc a,d			;a841
	ex af,af'		;a842
	sbc a,d			;a843
	cp a			;a844
	ld c,03fh		;a845
	ld c,0b7h		;a847
	ld h,037h		;a849
	ld h,0b3h		;a84b
	sub (hl)		;a84d
	inc sp			;a84e
	sub (hl)		;a84f
L_A850:
	sbc a,l			;a850
	call nz,L_C41D		;a851
	rst 8			;a854
	ld a,l			;a855
	rrca			;a856
	ld a,h			;a857
	pop hl			;a858
	pop af			;a859
	ld bc,0fcf0h		;a85a
	rlca			;a85d
	nop			;a85e
	nop			;a85f
	ret po			;a860
	rlca			;a861
	nop			;a862
	nop			;a863
	xor 077h		;a864
	ld c,070h		;a866
	adc a,073h		;a868
	ld c,070h		;a86a
	dec d			;a86c
	xor b			;a86d
	dec d			;a86e
	xor b			;a86f
	ld a,e			;a870
	sbc a,07bh		;a871
	sbc a,07dh		;a873
	cp (hl)			;a875
	ld a,l			;a876
	cp (hl)			;a877
	ld c,l			;a878
	or d			;a879
	ld c,l			;a87a
L_A87B:
	or d			;a87b
	ld l,(hl)		;a87c
	halt			;a87d
	ld l,(hl)		;a87e
	halt			;a87f
	ld l,h			;a880
	ld (hl),06ch		;a881
	ld (hl),03ch		;a883
	inc a			;a885
	inc a			;a886
	inc a			;a887
	or h			;a888
	xor l			;a889
	inc (hl)		;a88a
L_A88B:
	xor h			;a88b
	sbc a,h			;a88c
	cp c			;a88d
	inc e			;a88e
	cp b			;a88f
	call 00d33h		;a890
	jr nc,L_A87B		;a893
	ld h,a			;a895
	ld b,060h		;a896
	pop af			;a898
	adc a,a			;a899
	ld bc,0fc80h		;a89a
	ccf			;a89d
L_A89E:
	nop			;a89e
	nop			;a89f
	rst 38h			;a8a0
	rst 38h			;a8a1
	nop			;a8a2
	nop			;a8a3
	ret po			;a8a4
	rrca			;a8a5
	nop			;a8a6
	nop			;a8a7
	adc a,06fh		;a8a8
	ld c,060h		;a8aa
	sbc a,(hl)		;a8ac
	rst 28h			;a8ad
	ld e,0e0h		;a8ae
	or e			;a8b0
	ld b,c			;a8b1
	inc sp			;a8b2
	ld b,b			;a8b3
	or (hl)			;a8b4
	xor l			;a8b5
	ld (hl),0ach		;a8b6
	ld l,0ddh		;a8b8
	ld l,0dch		;a8ba
	ld a,(hl)		;a8bc
	jp (hl)			;a8bd
L_A8BE:
	ld a,(hl)		;a8be
	ret pe			;a8bf
	ld e,c			;a8c0
	ld de,01059h		;a8c1
	ld (hl),b		;a8c4
	ld (iy-004h),b		;a8c5
	ld h,h			;a8c8
	defb 0edh ;next byte illegal after ed	;a8c9
	ld h,h			;a8ca
	call pe,L_CD69		;a8cb
	ld l,c			;a8ce
	call z,L_B923		;a8cf
	inc hl			;a8d2
	cp b			;a8d3
	cp (hl)			;a8d4
	di			;a8d5
	ld a,0f0h		;a8d6
	adc a,a			;a8d8
	add a,a			;a8d9
	rrca			;a8da
	add a,b			;a8db
	ret po			;a8dc
	ccf			;a8dd
	nop			;a8de
	nop			;a8df
	call m,00007h		;a8e0   ; BIOS VDP_DW - Base port address for VDP data write
	nop			;a8e3
	pop af			;a8e4
	rst 30h			;a8e5
	ld bc,0e7f0h		;a8e6
	or e			;a8e9
	rlca			;a8ea
	or b			;a8eb
	adc a,038h		;a8ec
	ld c,038h		;a8ee
	sbc a,e			;a8f0
	or 01bh			;a8f1
	or 0bfh			;a8f3
	xor 03fh		;a8f5
	xor 020h		;a8f7
	sub (hl)		;a8f9
	jr nz,$-104		;a8fa
L_A8FC:
	ld d,b			;a8fc
	ld a,b			;a8fd
	ld d,b			;a8fe
	ld a,b			;a8ff
	ld c,h			;a900
	ld a,b			;a901
	ld c,h			;a902
	ld a,b			;a903
	jr nz,$-104		;a904
	jr nz,L_A89E		;a906
	cp a			;a908
	xor 03fh		;a909
	xor 09bh		;a90b
	or 01bh			;a90d
	or 0ceh			;a90f
	jr c,L_A921		;a911
	jr c,L_A8FC		;a913
	or e			;a915
	rlca			;a916
	or b			;a917
	pop af			;a918
	rst 30h			;a919
	ld bc,0fcf0h		;a91a
	rlca			;a91d
	nop			;a91e
	nop			;a91f
	ret po			;a920
L_A921:
	ccf			;a921
	nop			;a922
	nop			;a923
	adc a,a			;a924
	add a,a			;a925
	rrca			;a926
	add a,b			;a927
	cp (hl)			;a928
	di			;a929
	ld a,0f0h		;a92a
	inc hl			;a92c
	cp c			;a92d
	inc hl			;a92e
	cp b			;a92f
	ld l,c			;a930
	call L_CC69		;a931
	ld h,h			;a934
	defb 0edh ;next byte illegal after ed	;a935
	ld h,h			;a936
	call pe,L_FD70		;a937
	ld (hl),b		;a93a
	call m,01159h		;a93b
	ld e,c			;a93e
	djnz $+128		;a93f
	jp (hl)			;a941

; ----------------------------------------------------------------------
; DATOS sprites:: 83 de 16x16 con mascara, 64 bytes cada uno
;   0xa560..0xba20  (5312 bytes)
; ----------------------------------------------------------------------
	defb 07eh,0e8h,02eh,0ddh,02eh,0dch,0b6h,0adh,036h,0ach,0b3h,041h,033h,040h	; a942  ~.......6..A3@

; ======================================================================
; CODIGO 0xa950..0xa9c5  (117 bytes)
; ======================================================================


L_A950:
	sbc a,(hl)		;a950
	rst 28h			;a951
	ld e,0e0h		;a952
	adc a,06fh		;a954
	ld c,060h		;a956
	ret po			;a958
	rrca			;a959
	nop			;a95a
	nop			;a95b
	rst 38h			;a95c
	rst 38h			;a95d
	nop			;a95e
	nop			;a95f
	cp 01fh			;a960
	nop			;a962
	nop			;a963
	call m,000cfh		;a964   ; BIOS DSPFNK - Displays the function keys
	ret nz			;a967
	ld sp,hl		;a968
	and a			;a969
	ld bc,0f3a0h		;a96a
	ld d,e			;a96d
	inc bc			;a96e
	ld d,b			;a96f
	rst 20h			;a970
	ld c,e			;a971
	rlca			;a972
	ld c,b			;a973
	defb 0edh ;next byte illegal after ed	;a974
	dec bc			;a975
	dec c			;a976
	ex af,af'		;a977
	rst 8			;a978
	add hl,bc		;a979
	rrca			;a97a
	ex af,af'		;a97b
	in a,(015h)		;a97c
	dec de			;a97e
	inc d			;a97f
	in a,(0adh)		;a980
	dec de			;a982
	xor h			;a983
	out (05dh),a		;a984
	inc de			;a986
	ld e,h			;a987
	rst 18h			;a988
	ld l,l			;a989
	rra			;a98a
	ld l,h			;a98b
	sbc a,095h		;a98c
	ld e,094h		;a98e
	adc a,0b1h		;a990
	ld c,0b0h		;a992
	pop hl			;a994
	in a,(001h)		;a995
	ret c			;a997
	defb 0fdh,0dbh,001h ;illegal sequence	;a998
	ret c			;a99b
	call m,00003h		;a99c
	nop			;a99f
	rst 38h			;a9a0
	rst 38h			;a9a1
	nop			;a9a2
	nop			;a9a3
	cp 001h			;a9a4
	nop			;a9a6
	nop			;a9a7
	ret p			;a9a8
	defb 0fdh,000h,0fch ;illegal sequence	;a9a9
	rst 20h			;a9ac
	push hl			;a9ad
	rlca			;a9ae
	call po,L_55CD		;a9af
	dec c			;a9b2
L_A9B3:
	ld d,h			;a9b3
	sub e			;a9b4
	and l			;a9b5
	inc de			;a9b6
	and h			;a9b7
	or a			;a9b8
	add a,l			;a9b9
	scf			;a9ba
	add a,h			;a9bb
	cp a			;a9bc
	adc a,l			;a9bd
	ccf			;a9be
L_A9BF:
	adc a,h			;a9bf
	sbc a,(hl)		;a9c0
	ld e,c			;a9c1
	ld e,058h		;a9c2
	ret			;a9c4

; ----------------------------------------------------------------------
; DATOS sprites:: 83 de 16x16 con mascara, 64 bytes cada uno
;   0xa560..0xba20  (5312 bytes)
; ----------------------------------------------------------------------
	defb 0dbh,009h,0d8h,0d6h,033h,016h,030h,0ceh,097h,00eh,090h,0ddh,0a7h,01dh,0a0h,0cbh	; a9c5  ....3.0.........
	defb 08fh,00bh,080h,0e3h,03fh,003h,000h,0f8h,07fh,000h,000h,0ffh,0ffh,000h,000h,0ffh	; a9d5  ....?...........
	defb 0ffh,000h,000h,0e0h,03fh,000h,000h,0cfh,08fh,00fh,080h,0ddh,0e7h,01dh,0e0h,0dch	; a9e5  ....?...........
	defb 073h,01ch,070h,01fh,0d9h,01fh,0d8h,067h,0fch,067h,0fch	; a9f5  s.p....g.g.

; ======================================================================
; CODIGO 0xaa00..0xaa60  (96 bytes)
; ======================================================================


L_AA00:
	ld a,c			;aa00
	ld b,079h		;aa01
	ld b,066h		;aa03
	ld a,(de)		;aa05
	ld h,(hl)		;aa06
	ld a,(de)		;aa07
	dec d			;aa08
	inc b			;aa09
	dec d			;aa0a
	inc b			;aa0b
	ld a,d			;aa0c
	adc a,c			;aa0d
	ld a,d			;aa0e
	adc a,b			;aa0f
	ld h,a			;aa10
	ld (hl),e		;aa11
	ld h,a			;aa12
	ld (hl),b		;aa13
	rrca			;aa14
	add a,a			;aa15
	rrca			;aa16
	add a,b			;aa17
L_AA18:
	ret po			;aa18
	ccf			;aa19
	nop			;aa1a
	nop			;aa1b
	rst 38h			;aa1c
	rst 38h			;aa1d
	nop			;aa1e
	nop			;aa1f
	rst 38h			;aa20
	rst 38h			;aa21
	nop			;aa22
	nop			;aa23
	cp 01fh			;aa24
	nop			;aa26
	nop			;aa27
	ret nz			;aa28
	rst 8			;aa29
	nop			;aa2a
	ret nz			;aa2b
	sub l			;aa2c
	rst 20h			;aa2d
L_AA2E:
	dec d			;aa2e
	ret po			;aa2f
	cp e			;aa30
	sbc a,e			;aa31
	dec sp			;aa32
	sub b			;aa33
	dec e			;aa34
	in a,(01dh)		;aa35
	ret c			;aa37
	ld l,l			;aa38
	ex de,hl		;aa39
	ld l,l			;aa3a
	ret pe			;aa3b
L_AA3C:
	ld (hl),d		;aa3c
	ld sp,hl		;aa3d
	ld (hl),d		;aa3e
	ret m			;aa3f
	ld a,(03aedh)		;aa40
	call pe,01d83h		;aa43
	inc bc			;aa46
	inc e			;aa47
	call nc,0142dh		;aa48
	inc l			;aa4b
	rst 8			;aa4c
	dec d			;aa4d
	rrca			;aa4e
	inc d			;aa4f
L_AA50:
	ex (sp),hl		;aa50
	add a,l			;aa51
	inc bc			;aa52
	add a,h			;aa53
L_AA54:
	ret m			;aa54
	defb 0fdh,000h,0fch ;illegal sequence	;aa55
	cp 001h			;aa58
	nop			;aa5a
	nop			;aa5b
	rst 38h			;aa5c
	rst 38h			;aa5d
	nop			;aa5e
	nop			;aa5f

; ----------------------------------------------------------------------
; DATOS sprites:: 83 de 16x16 con mascara, 64 bytes cada uno
;   0xa560..0xba20  (5312 bytes)
; ----------------------------------------------------------------------
	defb 0c0h,03fh,000h,000h,0dbh,0bfh,01bh,080h,0dbh,087h,01bh,080h,08dh,073h,00dh,070h	; aa60  .?...........s.p
	defb 0a9h,07bh,029h,078h,0b6h,0fbh,036h,0f8h,0bah,0cbh,03ah,0c8h,0b5h,0dbh,035h,0d8h	; aa70  .{)x..6...:...5.
	defb 0a8h,0dbh,028h,0d8h,090h,0f3h,010h,0f0h,0d0h,0b7h,010h,0b0h,0d2h,0e7h,012h,0e0h	; aa80  ..(.............
	defb 0cah,0cfh,00ah,0c0h,0e5h,09fh,005h,080h,0f3h,03fh,003h,000h,0f8h,07fh,000h,000h	; aa90  .........?......
	defb 0feh,01fh,000h,000h,0fch,0c7h,000h,0c0h,0f1h,0d3h,001h,0d0h,0e5h,0bbh,005h,0b8h	; aaa0  ................
	defb 0e9h,073h,009h,070h,0cch,06bh,00ch,068h,0dbh,093h,01bh,090h,09ah,079h,01ah,078h	; aab0  .s.p.k.h.....y.x
	defb 0b1h,0fdh,031h,0fch,0a1h,0edh,021h,0ech,0a5h,0c9h,025h,0c8h,0aah,0b3h,02ah,0b0h	; aac0  ..1...!...%...*.
	defb 0a7h,0e7h,027h,0e0h,0bfh,00fh,03fh,000h,080h,07fh,000h,000h,0ffh,0ffh,000h,000h	; aad0  ..'...?.........
	defb 0ffh,0ffh,000h,000h,0fch,007h,000h,000h,0e1h,0f0h,001h,0f0h,0ceh,0e6h,00eh,0e6h	; aae0  ................
	defb 091h,05eh,011h,05eh,020h,0a8h,020h,0a8h,058h,066h,058h,066h,060h,09eh,060h,09eh	; aaf0  .^.^ . .XfXf`.`.
	defb 03fh,0e6h,03fh,0e6h,09bh,0f8h,01bh,0f8h,0ceh,03bh,00eh,038h,0e7h,0bbh,007h,0b8h	; ab00  ?.?......;.8....
	defb 0f9h,0f3h,001h,0f0h,0fch,007h,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h	; ab10  ................
	defb 0ffh,0ffh,000h,000h,080h,07fh,000h,000h,0bfh,01fh,03fh,000h,0a1h,0c7h,021h,0c0h	; ab20  ..........?...!.
	defb 0a8h,0f3h,028h,0f0h,0b4h,029h,034h,028h,0b8h,0c1h,038h,0c0h,0b7h,05ch,037h,05ch	; ab30  ..(..)4(..8..\7\
	defb 09fh,04eh,01fh,04eh,0d7h,0b6h,017h,0b6h,0dbh,0b8h,01bh,0b8h,0c9h,0ddh,009h,0dch	; ab40  .N.N............
	defb 0e7h,0a9h,007h,0a8h,0f3h,003h,003h,000h,0f8h,07fh,000h,000h,0ffh,0ffh,000h,000h	; ab50  ................
	defb 07fh,0feh,080h,000h,07fh,0feh,07fh,0ffh,000h,000h,0aah,0aah,000h,000h,055h,055h	; ab60  ..............UU
	defb 07fh,0feh,080h,000h,07fh,0feh,07fh,0ffh,000h,000h,0aah,0aah,000h,000h,055h,055h	; ab70  ..............UU
	defb 07fh,0feh,080h,000h,07fh,0feh,07fh,0ffh,000h,000h,0aah,0aah	; ab80  ............

; ======================================================================
; CODIGO 0xab8c..0xabca  (62 bytes)
; ======================================================================


L_AB8C:
	nop			;ab8c
	nop			;ab8d
	ld d,l			;ab8e
	ld d,l			;ab8f
	ld a,a			;ab90
	cp 080h			;ab91
	nop			;ab93
	ld a,a			;ab94
	cp 07fh			;ab95
	rst 38h			;ab97
	nop			;ab98
	nop			;ab99
	xor d			;ab9a
	xor d			;ab9b
	nop			;ab9c
	nop			;ab9d
	ld d,l			;ab9e
	ld d,l			;ab9f
	rst 38h			;aba0
	ret nz			;aba1
	nop			;aba2
	nop			;aba3
	rst 38h			;aba4
	ld a,(de)		;aba5
	nop			;aba6
	ld a,(de)		;aba7
	call m,00055h		;aba8
	ld d,l			;abab
	ld sp,hl		;abac
	ld a,a			;abad
	ld bc,0f27fh		;abae
	ret p			;abb1
	ld (bc),a		;abb2
	ret p			;abb3
	push hl			;abb4
	add a,l			;abb5
	dec b			;abb6
	add a,c			;abb7
	srl h			;abb8
	dec bc			;abba
	nop			;abbb
	sub 07dh		;abbc
	ld d,001h		;abbe
	adc a,h			;abc0
	ret m			;abc1
	inc c			;abc2
	nop			;abc3
	cp c			;abc4
	jp po,00238h		;abc5
	sbc a,e			;abc8
	ret			;abc9

; ----------------------------------------------------------------------
; DATOS sprites:: 83 de 16x16 con mascara, 64 bytes cada uno
;   0xa560..0xba20  (5312 bytes)
; ----------------------------------------------------------------------
	defb 018h,009h,03bh,090h,038h,010h,053h,0a7h,050h,027h,037h,00ch,030h,00ch,050h,048h	; abca  ..;.8.S.P'7.0.PH
	defb 050h,048h,035h,028h,035h,028h,007h,0ffh,000h,000h,0b0h	; abda  PH5(5(.....

; ======================================================================
; CODIGO 0xabe5..0xac74  (143 bytes)
; ======================================================================


L_ABE5:
	rst 38h			;abe5
	or b			;abe6
	nop			;abe7
	ld e,d			;abe8
	ccf			;abe9
	ld e,d			;abea
	nop			;abeb
	defb 0fdh,09fh,0fdh ;illegal sequence	;abec
	add a,b			;abef
	adc a,a			;abf0
	ld c,a			;abf1
	adc a,a			;abf2
	ld b,b			;abf3
	and c			;abf4
	rst 20h			;abf5
	add a,c			;abf6
	ret po			;abf7
	cp h			;abf8
	di			;abf9
	add a,b			;abfa
	ret p			;abfb
	cp (hl)			;abfc
	ld l,e			;abfd
	add a,b			;abfe
	ld l,b			;abff
	rra			;ac00
	add hl,sp		;ac01
	nop			;ac02
	jr c,$-119		;ac03
	sbc a,l			;ac05
	add a,b			;ac06
	inc e			;ac07
	ld d,e			;ac08
	call 00c50h		;ac09
	add hl,bc		;ac0c
	call nc,01408h		;ac0d
	push hl			;ac10
	adc a,0e4h		;ac11
	ld c,030h		;ac13
	jp pe,00a30h		;ac15
	ld d,006h		;ac18
	ld d,006h		;ac1a
	ld d,(hl)		;ac1c
	xor d			;ac1d
	ld d,(hl)		;ac1e
	xor d			;ac1f
	ld e,a			;ac20
	ld c,b			;ac21
	ld e,a			;ac22
	ld c,b			;ac23
	jr nc,L_AC4F		;ac24
	jr nc,L_AC51		;ac26
	ld d,a			;ac28
	inc c			;ac29
	ld d,b			;ac2a
	inc c			;ac2b
	ld (hl),e		;ac2c
	or a			;ac2d
	ld (hl),b		;ac2e
	scf			;ac2f
	dec sp			;ac30
	sbc a,b			;ac31
	jr c,L_AC4C		;ac32
	sbc a,e			;ac34
	rr b			;ac35
	dec bc			;ac37
	xor c			;ac38
	ex (sp),hl		;ac39
	jr z,L_AC3F		;ac3a
	sbc a,h			;ac3c
	ret m			;ac3d
	inc e			;ac3e
L_AC3F:
	nop			;ac3f
	sub 07ch		;ac40
	ld d,000h		;ac42
	rst 8			;ac44
	dec a			;ac45
	rrca			;ac46
	ld bc,084e6h		;ac47
	ld b,080h		;ac4a
L_AC4C:
	di			;ac4c
	ld d,c			;ac4d
	inc bc			;ac4e
L_AC4F:
	ld d,c			;ac4f
L_AC50:
	ld sp,hl		;ac50
L_AC51:
	jp pe,L_EA01		;ac51
	call m,0007dh		;ac54
	ld a,l			;ac57
	rst 38h			;ac58
	rrca			;ac59
	nop			;ac5a
	rrca			;ac5b
	rst 38h			;ac5c
	ret po			;ac5d
	nop			;ac5e
	nop			;ac5f
	ld d,(hl)		;ac60
	or 056h			;ac61
	or 096h			;ac63
	ld a,(bc)		;ac65
	sub (hl)		;ac66
	ld a,(bc)		;ac67
	jr nc,L_AC50		;ac68
	jr nc,$+8		;ac6a
	defb 0edh ;next byte illegal after ed	;ac6c
	adc a,0ech		;ac6d
	ld c,019h		;ac6f
	call nc,01418h		;ac71

; ----------------------------------------------------------------------
; DATOS sprites:: 83 de 16x16 con mascara, 64 bytes cada uno
;   0xa560..0xba20  (5312 bytes)
; ----------------------------------------------------------------------
	defb 0d3h,0cdh,0d0h,00ch,0c7h,09dh,0c0h,01ch,01fh,029h,000h,028h,0beh,05bh,080h,058h	; ac74  .........).(.[.X
	defb 0bch,0b3h,080h,0b0h,0a1h,067h,081h,060h,08ah,0cfh,08ah,0c0h,0b7h,09fh,0b7h,080h	; ac84  .....g.`........
	defb 05eh,03fh,05eh,000h,0f0h,0ffh,0f0h,000h,007h,0ffh,000h,000h,0f0h,0ffh,000h,000h	; ac94  ^?^.............
	defb 0c6h,007h,006h,000h,097h,0b1h,017h,0b0h,033h,0bch,033h,0bch,06eh,036h,06eh,036h	; aca4  ........3.3.n6n6
	defb 05fh,0d8h,05fh,0d8h,016h,06ch,016h,06ch,0b5h,0eah,035h,0eah,0bbh,0deh,03bh,0deh	; acb4  _._..l.l..5...;.
	defb 095h,0fah,015h,0fah,097h,044h,017h,044h,0b8h,0f9h,038h,0f8h,0bdh,06bh,03dh,068h	; acc4  .....D.D..8..k=h
	defb 09bh,033h,01bh,030h,0c6h,007h,006h,000h,0f0h,0ffh,000h,000h,0f0h,01fh,000h,000h	; acd4  .3.0............
	defb 0e7h,043h,007h,040h,08ch,0fbh,00ch,0f8h,02bh,068h,02bh,068h,07bh,076h,07bh,076h	; ace4  .C.@....+h+h{v{v
	defb 07fh,0b6h,07fh,0b6h,04fh,0f6h,04fh,0f6h,03dh,0eeh,03dh,0eeh,09bh,0fch,01bh,0fch	; acf4  ....O.O.=.=.....
	defb 0b6h,0eeh,036h,0eeh,097h,01ch,017h,01ch,0dbh,0edh,01bh,0ech,0d5h,0f1h,015h,0f0h	; ad04  ..6.............
	defb 0cfh,077h,00fh,070h,0e7h,007h,007h,000h,0f0h,07fh,000h,000h,0feh,03fh,000h,000h	; ad14  .w.p.........?..
	defb 086h,0bfh,000h,080h,0b6h,03fh,030h,000h,086h,018h,000h,000h,0f0h,0c2h,000h,0c2h	; ad24  .....?0.........
	defb 0f7h,0d0h,007h,0d0h,0e2h,0b9h,002h,0b8h,0edh,0ddh,00dh,0dch,0edh,0d5h,00dh,0d4h	; ad34  ................
	defb 0e7h,0f9h,007h,0f8h,0f7h,063h,007h,060h,081h,077h,001h,070h,0abh,0a7h,023h,0a0h	; ad44  .....c.`.w.p..#.
	defb 089h,087h,001h,080h,0fch,017h,000h,010h,0ffh,0c7h,000h,000h,0dfh,0ffh,000h,000h	; ad54  ................
	defb 0afh,0e3h,020h,000h,0dch,06bh,000h,008h,0c5h,063h,001h,000h,0d4h,03fh,010h,000h	; ad64  .. ..k...c...?..
	defb 0c1h,09bh,001h,080h,0fah,0d5h,002h,0c4h,0bbh,095h,003h,084h,059h,0dbh,041h,0c0h	; ad74  ............Y.A.
	defb 040h,018h,040h,000h,0abh,08ah,008h,002h,0e3h,0a8h,000h,020h,0ffh,08fh,000h,000h	; ad84  @.@........ ....
	defb 0f9h,0ffh,000h,000h,0f6h,0ffh,006h,000h,0f9h,0ffh,000h,000h,0f0h,07fh,000h,000h	; ad94  ................
	defb 0e7h,03fh,007h,000h,0c9h,09fh,009h,080h,0d2h,0cfh,012h,0c0h,090h,0e3h,010h,0e0h	; ada4  .?..............
	defb 0b0h,0fbh,030h,0f8h,099h,0cbh,019h,0c8h,0aah,0abh,02ah,0a8h,0aah,0abh,02ah,0a8h	; adb4  ..0.......*...*.
	defb 09ah,0d3h,01ah,0d0h,0cah,0f7h,00ah,0f0h,0e5h,067h,005h,060h,0f5h,08fh,005h,080h	; adc4  .........g.`....
	defb 0f5h,0bfh,005h,080h,0f5h,0bfh,005h,080h,0f0h,03fh,000h,000h,0feh,003h,000h,000h	; add4  .........?......
	defb 0fch,0fbh,000h,0f8h,0f1h,00bh,001h,008h,0e5h,02bh,005h,028h,0ebh,00bh,00bh,008h	; ade4  .........+.(....
	defb 0ech,01bh,00ch,018h,0e3h,079h,003h,078h,0cbh,04dh,00bh,04ch,094h,0d5h,014h,0d4h	; adf4  .....y.x.M.L....
	defb 0b1h,085h,031h,084h,0adh,0f9h,02dh,0f8h,09dh,0f3h,01dh,0f0h,0d8h,007h,018h,000h	; ae04  ..1...-.........
	defb 0c3h,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h	; ae14  ................
	defb 0fch,00fh,000h,000h,0f9h,0a3h,001h,0a0h,0f2h,079h,002h,078h,007h,0c4h,007h,0c4h	; ae24  .........y.x....
	defb 078h,002h,078h,002h,007h,08ah,007h,08ah,078h,046h,078h,046h,077h,0fch,077h,0fch	; ae34  x.x.....xFxFw.w.
	defb 00eh,079h,00eh,078h,0edh,0b3h,00dh,0b0h,0e6h,027h,006h,020h,0f1h,0efh,001h,0e0h	; ae44  .y.x.....'. ....
	defb 0fch,00fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h	; ae54  ................
	defb 0f0h,0ffh,000h,000h,0c6h,07fh,006h,000h,0dbh,007h,01bh,000h,0dch,0b3h,01ch,0b0h	; ae64  ................
	defb 0cdh,02bh,00dh,028h,0e0h,0d1h,000h,0d0h,0eeh,0dch,00eh,0dch,0efh,002h,00fh,002h	; ae74  .+.(............
	defb 0edh,0c2h,00dh,0c2h,0ech,04ah,00ch,04ah,0edh,062h,00dh,062h,0e4h,0feh,004h,0feh	; ae84  .....J.J.b.b....
	defb 0f3h,080h,003h,080h,0f8h,03fh,000h,000h,0ffh,0ffh,000h,000h,0fch,00fh,000h,000h	; ae94  .....?..........
	defb 0fdh,0afh,001h,0a0h	; aea4  ....

; ======================================================================
; CODIGO 0xaea8..0xaef1  (73 bytes)
; ======================================================================


L_AEA8:
	defb 0fdh,0afh,001h ;illegal sequence	;aea8
	and b			;aeab
	pop af			;aeac
	xor a			;aead
	ld bc,0e6a0h		;aeae
	and a			;aeb1
	ld b,0a0h		;aeb2
	rst 28h			;aeb4
	ld d,e			;aeb5
	rrca			;aeb6
	ld d,b			;aeb7
	bit 3,c			;aeb8
	dec bc			;aeba
	ld e,b			;aebb
	push de			;aebc
	ld d,l			;aebd
	dec d			;aebe
	ld d,h			;aebf
L_AEC0:
	push de			;aec0
	ld d,l			;aec1
	dec d			;aec2
	ld d,h			;aec3
	out (099h),a		;aec4
	inc de			;aec6
	sbc a,b			;aec7
	rst 18h			;aec8
	dec c			;aec9
	rra			;aeca
	inc c			;aecb
	rst 0			;aecc
	add hl,bc		;aecd
	rlca			;aece
	ex af,af'		;aecf
	di			;aed0
	ld c,e			;aed1
	inc bc			;aed2
	ld c,b			;aed3
	ld sp,hl		;aed4
	sub e			;aed5
	ld bc,0fc90h		;aed6
	rst 20h			;aed9
	nop			;aeda
	ret po			;aedb
	cp 00fh			;aedc
	nop			;aede
	nop			;aedf
	rst 38h			;aee0
	rst 38h			;aee1
	nop			;aee2
	nop			;aee3
	rst 38h			;aee4
	rst 38h			;aee5
	nop			;aee6
	nop			;aee7
	rst 38h			;aee8
	jp 00000h		;aee9   ; BIOS CHKRAM - Tests RAM and sets RAM slot for the system  [alias: STARTUP, RESET, BOOT]
L_AEEC:
	ret po			;aeec
	dec de			;aeed
	nop			;aeee
	jr L_AEC0		;aeef

; ----------------------------------------------------------------------
; DATOS sprites:: 83 de 16x16 con mascara, 64 bytes cada uno
;   0xa560..0xba20  (5312 bytes)
; ----------------------------------------------------------------------
	defb 0b9h,00fh,0b8h,09fh,0b5h,01fh,0b4h,0a1h,08dh,021h,08ch,0abh,029h,02bh,028h,0b2h	; aef1  .........!..)+(.
	defb 0d3h,032h,0d0h,09eh,0c7h,01eh,0c0h,0d8h,037h	; af01  .2......7

; ======================================================================
; CODIGO 0xaf0a..0xaf0c  (2 bytes)
; ======================================================================


L_AF0A:
	jr $+50			;af0a

; ----------------------------------------------------------------------
; DATOS sprites:: 83 de 16x16 con mascara, 64 bytes cada uno
;   0xa560..0xba20  (5312 bytes)
; ----------------------------------------------------------------------
	defb 0d0h,0d7h,010h,0d0h,0d4h,0a7h,014h,0a0h,0d0h,08fh,010h,080h,0dfh,03fh,01fh,000h	; af0c  .............?..
	defb 0c0h,07fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0f0h,03fh,000h,000h	; af1c  .............?..
	defb 0f7h,08fh,007h,080h,0e4h,067h,004h,060h,0cdh,0b7h,00dh,0b0h,09eh,070h,01eh,070h	; af2c  .....g.`.....p.p

; ======================================================================
; CODIGO 0xaf3c..0xb001  (197 bytes)
; ======================================================================


L_AF3C:
	ccf			;af3c
	xor 03fh		;af3d
	xor 062h		;af3f
	ld e,062h		;af41
	ld e,051h		;af43
	ret po			;af45
	ld d,c			;af46
	ret po			;af47
	ld b,b			;af48
	ld e,040h		;af49
	ld e,023h		;af4b
	ret po			;af4d
	inc hl			;af4e
	ret po			;af4f
	sbc a,(hl)		;af50
	ld c,a			;af51
	ld e,040h		;af52
	push bc			;af54
	sbc a,a			;af55
	dec b			;af56
	add a,b			;af57
	ret p			;af58
	ccf			;af59
	nop			;af5a
	nop			;af5b
	rst 38h			;af5c
	rst 38h			;af5d
	nop			;af5e
	nop			;af5f
	rst 38h			;af60
	rst 38h			;af61
	nop			;af62
	nop			;af63
	call m,0001fh		;af64
	nop			;af67
	ld bc,001cfh		;af68
	ret nz			;af6b
	ld a,a			;af6c
	daa			;af6d
	ld a,a			;af6e
	jr nz,L_AFB7		;af6f
L_AF71:
	or a			;af71
	ld b,(hl)		;af72
	or b			;af73
	ld d,d			;af74
	scf			;af75
	ld d,d			;af76
	jr nc,L_AFBC		;af77
	or a			;af79
	ld b,e			;af7a
	or b			;af7b
	ld b,b			;af7c
	rst 30h			;af7d
	ld b,b			;af7e
	ret p			;af7f
	dec sp			;af80
	ld (hl),a		;af81
	dec sp			;af82
	ld (hl),b		;af83
	adc a,e			;af84
	rlca			;af85
	dec bc			;af86
	nop			;af87
	call nc,014b3h		;af88
	or b			;af8b
	call 00d3bh		;af8c
	jr c,L_AF71		;af8f
	in a,(000h)		;af91
	ret c			;af93
	cp 063h			;af94
	nop			;af96
	ld h,b			;af97
	rst 38h			;af98
	rrca			;af99
	nop			;af9a
	nop			;af9b
	rst 38h			;af9c
	rst 38h			;af9d
	nop			;af9e
	nop			;af9f
	call m,0003fh		;afa0
	nop			;afa3
	ld sp,hl		;afa4
	sbc a,a			;afa5
	ld bc,0f280h		;afa6
	ld c,a			;afa9
L_AFAA:
	ld (bc),a		;afaa
	ld b,b			;afab
	push bc			;afac
	inc hl			;afad
	dec b			;afae
	jr nz,L_AFCD		;afaf
	jr c,L_AFCF		;afb1
	jr c,$+126		;afb3
	ld a,07ch		;afb5
L_AFB7:
	ld a,04eh		;afb7
	ld (hl),d		;afb9
	ld c,(hl)		;afba
	ld (hl),d		;afbb
L_AFBC:
	ld d,l			;afbc
	xor d			;afbd
	ld d,l			;afbe
	xor d			;afbf
	ld d,l			;afc0
	xor d			;afc1
	ld d,l			;afc2
	xor d			;afc3
	dec l			;afc4
	or h			;afc5
	dec l			;afc6
	or h			;afc7
	cp l			;afc8
	cp l			;afc9
	dec a			;afca
	cp h			;afcb
	sbc a,d			;afcc
L_AFCD:
	ld e,c			;afcd
	ld a,(de)		;afce
L_AFCF:
	ld e,b			;afcf
	add a,063h		;afd0
	ld b,060h		;afd2
	or 06fh			;afd4
	ld b,060h		;afd6
	or 06fh			;afd8
	ld b,060h		;afda
	ret p			;afdc
	rrca			;afdd
	nop			;afde
	nop			;afdf
	ex (sp),hl		;afe0
	rst 38h			;afe1
	nop			;afe2
	nop			;afe3
	ret z			;afe4
	rst 38h			;afe5
	ex af,af'		;afe6
	nop			;afe7
	sbc a,(hl)		;afe8
	inc bc			;afe9
	ld e,000h		;afea
	and a			;afec
	ei			;afed
	daa			;afee
	ret m			;afef
	xor e			;aff0
	xor e			;aff1
	dec hl			;aff2
	xor b			;aff3
	and e			;aff4
	dec bc			;aff5
	inc hl			;aff6
	ex af,af'		;aff7
	xor a			;aff8
	dec bc			;aff9
	cpl			;affa
	ex af,af'		;affb
	cp h			;affc
	dec de			;affd
	inc a			;affe
	jr L_AFBC		;afff

; ----------------------------------------------------------------------
; DATOS sprites:: 83 de 16x16 con mascara, 64 bytes cada uno
;   0xa560..0xba20  (5312 bytes)
; ----------------------------------------------------------------------
	defb 079h,03bh,078h,087h,07dh,007h,07ch,036h,0cch,036h,0cch,061h,0d6h,061h,0d6h,045h	; b001  y;x.}.|6.6.a.a.E
	defb 084h,045h,084h,00dh,0f9h,00dh,0f8h,0d8h,003h,018h,000h,0c3h,0ffh,000h,000h,0fch	; b011  .E..............
	defb 00fh,000h,000h,0f1h,0efh,001h,0e0h,0e6h,027h,006h,020h,0edh,0b7h,00dh,0b0h,00eh	; b021  ........'. .....
	defb 073h,00eh,070h,077h,0f9h,077h,0f8h,078h,044h,078h,044h,007h,08ah,007h,08ah,007h	; b031  s.pw.w.xDxD.....
	defb 082h,007h,082h,078h,044h,078h,044h,077h,0f9h,077h,0f8h,00eh,073h,00eh,070h,0edh	; b041  ...xDxDw.w..s.p.
	defb 0b7h,00dh,0b0h,0e6h,027h,006h,020h,0f1h,0efh,001h,0e0h,0fch,00fh,000h,000h,0c3h	; b051  ....'. .........
	defb 0ffh,000h,000h,098h,003h,018h,000h,00dh,0f9h,00dh,0f8h,045h,084h,045h,084h,061h	; b061  ...........E.E.a
	defb 0d6h,061h,0d6h,036h,0cch,036h,0cch,087h,07dh,007h,07ch,0bbh,079h,03bh,078h,0bch	; b071  .a.6.6..}.|.y;x.
	defb 01bh,03ch,018h,0afh,00bh,02fh,008h,0a3h,01bh,023h,018h,0abh,08bh,02bh,088h,0a7h	; b081  .<.../...#...+..
	defb 0fbh,027h,0f8h,09eh,003h,01eh,000h,0c8h,0ffh,008h,000h,0e3h,0ffh,000h,000h,0f0h	; b091  .'..............
	defb 00fh,000h,000h,0f6h,06fh,006h,060h,0f6h,06fh,006h,060h,0c6h,063h,006h,060h,09ah	; b0a1  ....o.`.o.`.c.`.
	defb 059h,01ah,058h,0bdh,0bdh,03dh,0bch,02dh,0b4h,02dh,0b4h,055h,0aah,055h,0aah,055h	; b0b1  Y.X..=.-.-.U.U.U
	defb 0aah,055h,0aah,04eh,072h,04eh,072h,07ch,03eh,07ch,03eh,01ch,038h,01ch,038h,0c4h	; b0c1  .U.NrNr|>|>.8.8.
	defb 0a3h,004h,0a0h,0f2h,04fh,002h,040h,0f9h,09fh,001h,080h,0fch,03fh,000h,000h,0ffh	; b0d1  ....O.@.....?...
	defb 0c3h,000h,000h,0c0h,01bh,000h,018h,09fh,0b0h,01fh,0b0h,021h,0a2h,021h,0a2h,06bh	; b0e1  ...........!.!.k
	defb 086h,06bh,086h,033h,06ch,033h,06ch,0beh,0e1h,03eh,0e0h,09eh,0ddh,01eh,0dch,0d8h	; b0f1  .k.3l3l..>......
	defb 03dh,018h,03ch,0d0h,0f5h,010h,0f4h,0d0h,0c5h,010h,0c4h,0d5h,0d5h,015h,0d4h,0dfh	; b101  =.<.............
	defb 0e5h,01fh,0e4h,0c0h,079h,000h,078h,0ffh,013h,000h,010h,0ffh,0c7h,000h,000h,0f0h	; b111  ....y.x.........
	defb 03fh,000h,000h,0f7h,08fh,007h,080h,0e4h,067h,004h,060h,0edh,0b7h,00dh,0b0h,0ceh	; b121  ?.......g.`.....
	defb 070h,00eh,070h,09fh,0eeh,01fh,0eeh,022h,01eh,022h,01eh,041h,0e0h,041h,0e0h,051h	; b131  p.p....".".A.A.Q
	defb 0e0h,051h,0e0h,022h,01eh,022h,01eh,09fh,0eeh,01fh,0eeh,0ceh,070h,00eh,070h,0edh	; b141  .Q."."......p.p.
	defb 0b7h,00dh,0b0h,0e4h,067h,004h,060h,0f7h,08fh,007h,080h,0f0h,03fh,000h,000h,0ffh	; b151  ....g.`.....?...
	defb 0c7h,000h,000h,0ffh,013h,000h,010h,0c0h,079h,000h,078h,0dfh,0e5h,01fh,0e4h,0d1h	; b161  ........y.x.....
	defb 0d5h,011h,0d4h,0d8h,0c5h,018h,0c4h,0d0h,0f5h,010h,0f4h,0d8h,03dh,018h,03ch,09eh	; b171  ............=.<.
	defb 0ddh,01eh,0dch,0beh,0e1h,03eh,0e0h,033h,06ch,033h,06ch,06bh,086h,06bh,086h,021h	; b181  .....>.3l3lk.k.!
	defb 0a2h,021h,0a2h,09fh,0b0h,01fh,0b0h,0c0h,01bh,000h,018h,0ffh,0c3h,000h,000h,0feh	; b191  .!..............
	defb 00fh,000h,000h,0fch,0e7h,000h,0e0h,0f9h,093h,001h,090h,0f3h,04bh,003h,048h,0c7h	; b1a1  ............K.H.
	defb 009h,007h,008h,0dfh,00dh,01fh,00ch,0d3h,099h,013h,098h,0d5h,055h,015h,054h,0d5h	; b1b1  ............U.T.
	defb 055h,015h,054h,0cbh,059h,00bh,058h,0efh,053h,00fh,050h,0e6h,0a7h,006h,0a0h,0f1h	; b1c1  U.T.Y.X.S.P.....
	defb 0afh,001h,0a0h,0fdh,0afh,001h,0a0h,0fdh,0afh,001h,0a0h,0fch,00fh,000h,000h,0ffh	; b1d1  ................
	defb 0ffh,000h,000h,0f8h,03fh,000h,000h,0f3h,080h,003h,080h,0e4h,0feh,004h,0feh,0edh	; b1e1  ....?...........
	defb 062h,00dh,062h,0ech,04ah,00ch,04ah,0edh,0c2h,00dh,0c2h,0efh,002h,00fh,002h,0eeh	; b1f1  b.b.J.J.........
	defb 0dch,00eh,0dch,0e0h,0d1h,000h,0d0h,0cdh,02bh,00dh,028h	; b201  ........+.(

; ======================================================================
; CODIGO 0xb20c..0xb26b  (95 bytes)
; ======================================================================


L_B20C:
	call c,01cb3h		;b20c
	or b			;b20f
	in a,(007h)		;b210
	dec de			;b212
	nop			;b213
	add a,07fh		;b214
	ld b,000h		;b216
	ret p			;b218
	rst 38h			;b219
	nop			;b21a
	nop			;b21b
	rst 38h			;b21c
	rst 38h			;b21d
	nop			;b21e
	nop			;b21f
	rst 38h			;b220
	rst 38h			;b221
	nop			;b222
	nop			;b223
	rst 38h			;b224
	rst 38h			;b225
	nop			;b226
	nop			;b227
	call m,0000fh		;b228
	nop			;b22b
	pop af			;b22c
	rst 28h			;b22d
	ld bc,0e6e0h		;b22e
	daa			;b231
	ld b,020h		;b232
	otir			;b234
	dec c			;b236
	or b			;b237
	ld c,079h		;b238
	ld c,078h		;b23a
	ld (hl),a		;b23c
	call m,L_FC77		;b23d
	ld a,b			;b240
	ld b,(hl)		;b241
	ld a,b			;b242
	ld b,(hl)		;b243
	rlca			;b244
	adc a,d			;b245
	rlca			;b246
	adc a,d			;b247
	ld a,b			;b248
	ld (bc),a		;b249
	ld a,b			;b24a
	ld (bc),a		;b24b
	rlca			;b24c
	call nz,L_C407		;b24d
	jp p,00279h		;b250
	ld a,b			;b253
	ld sp,hl		;b254
	and e			;b255
	ld bc,0fca0h		;b256
	rrca			;b259
	nop			;b25a
	nop			;b25b
	rst 38h			;b25c
	rst 38h			;b25d
	nop			;b25e
	nop			;b25f
	rst 38h			;b260
	rst 38h			;b261
	nop			;b262
	nop			;b263
	rst 38h			;b264
	rst 38h			;b265
	nop			;b266
	nop			;b267
	jp 000ffh		;b268   ; BIOS LEFTC - Shifts screen pixel to the left

; ----------------------------------------------------------------------
; DATOS sprites:: 83 de 16x16 con mascara, 64 bytes cada uno
;   0xa560..0xba20  (5312 bytes)
; ----------------------------------------------------------------------
	defb 000h,0d8h,007h,018h,000h,09dh,0f3h,01dh,0f0h,0adh,0f9h,02dh,0f8h,0b1h,085h,031h	; b26b  ...........-...1
	defb 084h,094h,0d5h,014h,0d4h,0cbh,04dh,00bh,04ch,0e3h,079h,003h,078h,0ech,01bh,00ch	; b27b  ......M.L.y.x...
	defb 018h,0ebh,00bh,00bh,008h,0e5h,02bh,005h,028h,0f1h,00bh,001h,008h,0fch,0fbh,000h	; b28b  ......+.(.......
	defb 0f8h,0feh,003h,000h,000h,0f0h,03fh,000h,000h,0f5h,0bfh,005h,080h,0f5h,0bfh,005h	; b29b  ......?.........
	defb 080h,0f5h,08fh,005h,080h,0e5h,067h,005h,060h,0cah,0f7h,00ah,0f0h,09ah,0d3h,01ah	; b2ab  ......g.`.......
	defb 0d0h,0aah,0abh,02ah,0a8h,0aah,0abh,02ah,0a8h,099h,0cbh,019h,0c8h,0b0h,0fbh,030h	; b2bb  ...*...*.......0
	defb 0f8h,090h,0e3h,010h,0e0h,0d2h,0cfh,012h,0c0h,0c9h,09fh,009h,080h,0e7h,03fh,007h	; b2cb  ..............?.
	defb 000h,0f0h,07fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,00fh,000h,000h,0feh,063h,000h	; b2db  ..............c.
	defb 060h,0e0h,0dbh,000h,0d8h,0cdh,03bh,00dh,038h,0d4h,0b3h,014h,0b0h,08bh,007h,00bh	; b2eb  `.....;.8.......
	defb 000h,03bh,077h,03bh,070h,040h,0f7h,040h,0f0h,043h,0b7h,043h,0b0h,052h,037h,052h	; b2fb  .;w;p@.@.C.C.R7R
	defb 030h,046h,0b7h,046h,0b0h,07fh,027h,07fh,020h,001h,0cfh,001h,0c0h,0fch,01fh,000h	; b30b  0F.F..'. .......
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0f0h,03fh,000h,000h,0c5h,09fh,005h	; b31b  ..........?.....
	defb 080h,09eh,04fh,01eh,040h,023h,0e0h,023h,0e0h,040h,01eh,040h,01eh,051h,0e0h,051h	; b32b  ..O.@#.#.@.@.Q.Q
	defb 0e0h,062h,01eh,062h,01eh,03fh,0eeh,03fh,0eeh,09eh,070h,01eh,070h,0cdh,0b7h,00dh	; b33b  .b.b.?.?..p.p...
	defb 0b0h,0e4h,067h,004h,060h,0f7h,08fh,007h,080h,0f0h,03fh,000h,000h,0ffh,0ffh,000h	; b34b  ..g.`.....?.....
	defb 000h,0ffh,0ffh,000h,000h,0c0h,07fh,000h,000h,0dfh,03fh,01fh,000h,0d0h,08fh,010h	; b35b  ..........?.....
	defb 080h,0d4h,0a7h,014h,0a0h,0d0h,0d7h,010h,0d0h,0d8h,037h,018h,030h,09eh,0c7h,01eh	; b36b  ..........7.0...
	defb 0c0h,0b2h,0d3h,032h,0d0h,0abh,029h,02bh,028h,0a1h,08dh,021h,08ch,09fh,0b5h,01fh	; b37b  ...2..)+(..!....
	defb 0b4h,0cfh,0b9h,00fh,0b8h,0e0h,01bh,000h,018h,0ffh,0c3h,000h,000h,0ffh,0ffh,000h	; b38b  ................
	defb 000h,0ffh,0ffh,000h,000h,0feh,07fh,000h,000h,0fch,03fh,000h,000h,0f4h,02fh,000h	; b39b  ..........?.../.
	defb 000h,0e6h,067h,000h,000h,0ceh,073h,000h,000h,0ffh,0ffh,000h,000h,09fh,0f9h,000h	; b3ab  ..g...s.........
	defb 000h,006h	; b3bb  ..

; ======================================================================
; CODIGO 0xb3bd..0xb44a  (141 bytes)
; ======================================================================


L_B3BD:
	ld h,b			;b3bd
	nop			;b3be
	nop			;b3bf
	ld b,060h		;b3c0
	nop			;b3c2
	nop			;b3c3
	sbc a,a			;b3c4
	ld sp,hl		;b3c5
	nop			;b3c6
	nop			;b3c7
	rst 38h			;b3c8
	rst 38h			;b3c9
	nop			;b3ca
	nop			;b3cb
	adc a,073h		;b3cc
	nop			;b3ce
	nop			;b3cf
	and 067h		;b3d0
	nop			;b3d2
	nop			;b3d3
	call p,0002fh		;b3d4
	nop			;b3d7
	call m,0003fh		;b3d8
	nop			;b3db
	cp 07fh			;b3dc
	nop			;b3de
	nop			;b3df
	nop			;b3e0
	nop			;b3e1
	nop			;b3e2
	nop			;b3e3
	nop			;b3e4
	nop			;b3e5
	nop			;b3e6
	nop			;b3e7
	ld a,07ch		;b3e8
	nop			;b3ea
	nop			;b3eb
	ld a,07ch		;b3ec
	nop			;b3ee
	nop			;b3ef
	ccf			;b3f0
	call m,00000h		;b3f1   ; BIOS CHKRAM - Tests RAM and sets RAM slot for the system  [alias: STARTUP, RESET, BOOT]
	ld a,07ch		;b3f4
	nop			;b3f6
	nop			;b3f7
	inc a			;b3f8
	inc a			;b3f9
	nop			;b3fa
	nop			;b3fb
	pop hl			;b3fc
	add a,a			;b3fd
	nop			;b3fe
	nop			;b3ff
	pop hl			;b400
	add a,a			;b401
	nop			;b402
	nop			;b403
	inc a			;b404
	inc a			;b405
	nop			;b406
	nop			;b407
	ld a,07ch		;b408
	nop			;b40a
	nop			;b40b
	ccf			;b40c
	call m,00000h		;b40d   ; BIOS CHKRAM - Tests RAM and sets RAM slot for the system  [alias: STARTUP, RESET, BOOT]
	ld a,07ch		;b410
	nop			;b412
	nop			;b413
	ld a,07ch		;b414
	nop			;b416
	nop			;b417
	nop			;b418
	nop			;b419
	nop			;b41a
	nop			;b41b
	nop			;b41c
	nop			;b41d
	nop			;b41e
	nop			;b41f
	rst 38h			;b420
	ret nz			;b421
	nop			;b422
	nop			;b423
	rst 38h			;b424
	ld a,(de)		;b425
	nop			;b426
	ld a,(de)		;b427
	call m,00055h		;b428
	ld d,l			;b42b
	ld sp,hl		;b42c
	ld a,a			;b42d
	ld bc,0f27fh		;b42e
	ret p			;b431
	ld (bc),a		;b432
	ret p			;b433
	push hl			;b434
	add a,l			;b435
	dec b			;b436
	add a,c			;b437
	srl h			;b438
	dec bc			;b43a
	nop			;b43b
	sub 07dh		;b43c
	ld d,001h		;b43e
	call z,00cf8h		;b440
	nop			;b443
	sbc a,c			;b444
	jp po,00218h		;b445
	xor e			;b448
	ret			;b449

; ----------------------------------------------------------------------
; DATOS sprites:: 83 de 16x16 con mascara, 64 bytes cada uno
;   0xa560..0xba20  (5312 bytes)
; ----------------------------------------------------------------------
	defb 028h,009h,083h,090h,000h,010h,093h,0a4h,010h,024h,031h,00dh,030h,00dh,054h,049h	; b44a  (........$1.0.TI
	defb 054h,049h,03ah,023h,03ah,023h,007h,0ffh,000h,000h,0b0h,0ffh,0b0h,000h,05ah,03fh	; b45a  TI:#:#........Z?
	defb 05ah,000h,0fdh,09fh,0fdh,080h,08fh,04fh,08fh,040h,0a1h,0e7h,081h,0e0h,0bch,0f3h	; b46a  Z......O.@......
	defb 080h,0f0h,0beh,06bh,080h,068h,03fh,039h,000h,038h,087h,09dh,080h,01ch,057h,0cdh	; b47a  ...k.h?9.8....W.
	defb 050h,00ch,007h,0d4h,000h,014h,033h,0ceh,030h,00eh,078h,06ah,078h,00ah,0b9h,066h	; b48a  P.....3.0.xjx..f
	defb 0b9h,006h,08bh,04ah,08bh,00ah,05dh,043h,05dh,043h,036h,021h,036h,021h,053h,00eh	; b49a  ...J..]C]C6!6!S.
	defb 053h,00eh,071h,05bh,071h,01bh,038h,05ah,038h,01ah,09bh,0dbh,018h,01bh,0a9h,0c5h	; b4aa  S.q[q.8Z8.......
	defb 028h,005h,09ch,0f7h,01ch,007h,0d6h,070h,016h,000h,0cfh,03eh,00fh,000h,0e6h,087h	; b4ba  (......p...>....
	defb 006h,080h,0f3h,053h,003h,050h,0f9h,0e9h,001h,0e8h,0fch,07ch,000h,07ch,0ffh,00fh	; b4ca  ...S.P.....|.|..
	defb 000h,00fh,0ffh,0e0h,000h,000h,077h,056h,077h,016h,03bh,04ah,03bh,00ah,0eeh,066h	; b4da  ......wVw.;J;..f
	defb 0eeh,006h,068h,0ceh,068h,00eh,0deh,0d4h,0deh,014h,03eh,0cdh,03eh,00ch,0d8h,09dh	; b4ea  ..h.h.....>.>...
	defb 0d8h,01ch,0e3h,029h,0e0h,028h,0eeh,05bh,0e0h,058h,00ch,0b3h,000h,0b0h,0e1h,067h	; b4fa  ...).(.[.X.....g
	defb 001h,060h,08ah,0cfh,00ah,0c0h,037h,09fh,037h,080h,05eh,03fh,05eh,000h,0f0h,0ffh	; b50a  .`....7.7.^?^...
	defb 0f0h,000h,007h	; b51a  ...

; ======================================================================
; CODIGO 0xb51d..0xb542  (37 bytes)
; ======================================================================


L_B51D:
	rst 38h			;b51d
	nop			;b51e
	nop			;b51f
	rst 38h			;b520
	ret nz			;b521
	nop			;b522
	nop			;b523
	rst 38h			;b524
	ld a,(de)		;b525
	nop			;b526
	ld a,(de)		;b527
	add a,b			;b528
	ld d,l			;b529
	nop			;b52a
	ld d,l			;b52b
	dec l			;b52c
	ld a,a			;b52d
	dec l			;b52e
	ld a,a			;b52f
	ld a,d			;b530
	ret p			;b531
	ld a,d			;b532
	ret p			;b533
	dec d			;b534
	add a,l			;b535
	dec d			;b536
	add a,c			;b537
	bit 3,h			;b538
	dec bc			;b53a
	ld b,b			;b53b
	sub 0c1h		;b53c
	ld d,0c1h		;b53e
	adc a,l			;b540
	jp (hl)			;b541

; ----------------------------------------------------------------------
; DATOS sprites:: 83 de 16x16 con mascara, 64 bytes cada uno
;   0xa560..0xba20  (5312 bytes)
; ----------------------------------------------------------------------
	defb 00dh,0e9h,0b8h,0bbh,038h,0bbh,09ah,07bh,018h,07bh,0abh,070h,028h,070h,083h,01fh	; b542  ....8..{.{.p(p..
	defb 000h,01fh,026h,07eh,020h,07eh,052h,0b1h,050h,0b1h,06ah,0edh,068h,0edh,024h,007h	; b552  ..&~ ~R.P.j.h.$.
	defb 004h,000h,08ah,0b7h,08ah,0b0h,01dh,067h,01dh,060h,086h,08fh,086h,080h,08bh,05fh	; b562  .......g.`....._
	defb 08bh,040h,093h	; b572  .@.

; ======================================================================
; CODIGO 0xb575..0xb60a  (149 bytes)
; ======================================================================


L_B575:
	add a,a			;b575
	sub e			;b576
	add a,b			;b577
	dec e			;b578
	ld d,e			;b579
	dec e			;b57a
	ld d,b			;b57b
	cp l			;b57c
	adc a,e			;b57d
	cp l			;b57e
	adc a,b			;b57f
	call nc,L_D438		;b580
	jr c,$-102		;b583
	rla			;b585
	sbc a,b			;b586
	rla			;b587
	call pe,L_ECBE		;b588
	cp (hl)			;b58b
	rst 28h			;b58c
	ret c			;b58d
	rst 28h			;b58e
	ret c			;b58f
	inc a			;b590
	cp 03ch			;b591
	cp 0dbh			;b593
	ld l,d			;b595
	in a,(06ah)		;b596
	rst 38h			;b598
	ld b,0ffh		;b599
	ld b,0b7h		;b59b
	ld l,d			;b59d
	or a			;b59e
	ld l,d			;b59f
	ld (0301fh),a		;b5a0
	rra			;b5a3
	cp b			;b5a4
	in a,(038h)		;b5a5
	in a,(094h)		;b5a7
	ld a,e			;b5a9
	inc d			;b5aa
	ld a,e			;b5ab
	jp c,01a5ch		;b5ac
	ld e,h			;b5af
	call z,00cdeh		;b5b0
	sbc a,0e1h		;b5b3
	ex (sp),hl		;b5b5
	ld bc,0f2e3h		;b5b6
	rst 30h			;b5b9
	ld (bc),a		;b5ba
	rst 30h			;b5bb
	rst 30h			;b5bc
	and l			;b5bd
	rlca			;b5be
	and l			;b5bf
	ex (sp),hl		;b5c0
	add a,l			;b5c1
	inc bc			;b5c2
	add a,l			;b5c3
	adc a,030h		;b5c4
	ld c,000h		;b5c6
	sbc a,d			;b5c8
	dec b			;b5c9
	ld a,(de)		;b5ca
	ld bc,051bch		;b5cb
	inc a			;b5ce
	ld d,c			;b5cf
	xor c			;b5d0
	ret pe			;b5d1
	add hl,hl		;b5d2
	ret pe			;b5d3
	and b			;b5d4
	ld a,h			;b5d5
	jr nz,$+126		;b5d6
	adc a,a			;b5d8
	rrca			;b5d9
	nop			;b5da
	rrca			;b5db
	rst 38h			;b5dc
	ret po			;b5dd
	nop			;b5de
	nop			;b5df
	ld (hl),l		;b5e0
	or 075h			;b5e1
	or 075h			;b5e3
	adc a,d			;b5e5
	ld (hl),l		;b5e6
	adc a,d			;b5e7
	call L_CDC6		;b5e8
	add a,07bh		;b5eb
	ld l,(hl)		;b5ed
	ld a,e			;b5ee
	ld l,(hl)		;b5ef
	rst 30h			;b5f0
	ld (hl),h		;b5f1
	rst 30h			;b5f2
	ld (hl),h		;b5f3
	ld c,0adh		;b5f4
	ld c,0ach		;b5f6
	or (hl)			;b5f8
	push bc			;b5f9
	or (hl)			;b5fa
	call nz,L_F179		;b5fb
	ld a,c			;b5fe
	ret p			;b5ff
	ld e,a			;b600
	ld (hl),a		;b601
	ld e,a			;b602
	ld (hl),b		;b603
	ld l,a			;b604
	and e			;b605
	ld l,a			;b606
	and b			;b607
	ld l,a			;b608
	ret			;b609

; ----------------------------------------------------------------------
; DATOS sprites:: 83 de 16x16 con mascara, 64 bytes cada uno
;   0xa560..0xba20  (5312 bytes)
; ----------------------------------------------------------------------
	defb 06fh,0c8h,0b6h,0ddh,0b6h,0dch,0f8h,0ddh,0f8h,0dch,01dh,0b9h,01dh,0b8h,081h,0f3h	; b60a  o...............
	defb 081h,0f0h,03ch,007h,000h,000h,0ffh,0c0h,000h,000h,0e0h,01bh,000h,01bh,0cah,05bh	; b61a  ..<............[
	defb 00ah,05bh,0ddh,047h,01dh,047h,018h,01fh,018h,01fh,071h,0cch,071h,0cch,06bh,0ebh	; b62a  .[.G.G....q.q.k.
	defb 06bh,0ebh,053h,033h,053h,033h,00eh,0edh,00eh,0edh,0e5h,08fh,005h,08fh,0f3h,06fh	; b63a  k.S3S3.........o
	defb 003h,06fh,010h,0ffh,000h,0ffh,046h,0f0h,046h,0f0h	; b64a  .o....F.F.

; ======================================================================
; CODIGO 0xb654..0xb69b  (71 bytes)
; ======================================================================


L_B654:
	ld h,0fdh		;b654
	ld h,0fdh		;b656
	add a,a			;b658
	dec e			;b659
	rlca			;b65a
	dec e			;b65b
	pop af			;b65c
	ei			;b65d
	ld bc,004fbh		;b65e
	rlca			;b661
	nop			;b662
	nop			;b663
	or c			;b664
	ld (hl),c		;b665
	or c			;b666
	ld (hl),b		;b667
	res 5,l			;b668
	res 5,h			;b66a
	in a,(059h)		;b66c
	in a,(058h)		;b66e
	sbc a,d			;b670
	cp l			;b671
	sbc a,d			;b672
	cp h			;b673
	ex de,hl		;b674
	ld l,l			;b675
	ex de,hl		;b676
	ld l,h			;b677
	ld (hl),a		;b678
	exx			;b679
	ld (hl),a		;b67a
	ret c			;b67b
	or e			;b67c
	add a,c			;b67d
	or e			;b67e
	add a,b			;b67f
	or l			;b680
	defb 0fdh,0b5h ;or iyl	;b681
	call m,L_91B6		;b683
	or (hl)			;b686
	sub b			;b687
	xor (hl)		;b688
	call L_CCAE		;b689
	ld a,l			;b68c
	defb 0ddh,07dh ;ld a,ixl	;b68d
	call c,L_A9B3		;b68f
	or e			;b692
	xor b			;b693
	sbc a,e			;b694
	ld h,c			;b695
	sbc a,e			;b696
	ld h,b			;b697
	jp L_C3C5		;b698

; ----------------------------------------------------------------------
; DATOS sprites:: 83 de 16x16 con mascara, 64 bytes cada uno
;   0xa560..0xba20  (5312 bytes)
; ----------------------------------------------------------------------
	defb 0c4h,098h,0c9h,080h,0c8h,0e3h,087h,003h,087h,0cfh,0e8h,00fh,0e8h,0dah,0eeh,01ah	; b69b  ................
	defb 0eeh,0d6h,0c6h,016h,0c6h,086h,097h,006h,097h,030h,01eh,030h,01eh,07fh,00eh,07fh	; b6ab  .........0.0....
	defb 00eh,066h,03ch,066h,03ch,01eh,0b6h,01eh,036h,056h,026h,056h,026h,074h,08eh,074h	; b6bb  .f<f<...6V&V&t.t
	defb 08eh,070h,054h,070h,054h,017h,066h,010h,066h,0a7h,006h,020h,006h,08fh,0f4h,000h	; b6cb  .pTpT.f.f.. ....
	defb 004h,0ffh,0f1h,000h,000h,086h,005h,080h,004h,011h,0e9h,010h,008h,0ddh,0e5h,01ch	; b6db  ................
	defb 004h,044h,031h,004h,000h,06eh,087h,00eh,080h,066h,0b3h,006h,0b0h,0f3h,03bh,003h	; b6eb  .D1..n...f....;.
	defb 038h,0f6h,0a9h,006h,0a8h,083h,0f5h,003h,0f4h,0aah,0edh,022h,0ech,02bh,01dh,023h	; b6fb  8..........".+.#
	defb 01ch,048h,0d9h,040h,0d8h,01dh,0d3h,001h,0d0h,0fch,007h,000h,000h,0ffh,0ffh,000h	; b70b  .H.@............
	defb 000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0f0h,0ffh,000h,000h,086h,03fh,006h	; b71b  ..............?.
	defb 000h,0b6h,09fh,036h,080h,0a7h,0d1h,027h,0c0h,0bdh,095h,03dh,084h,09dh,0b1h,01dh	; b72b  ...6...'...=....
	defb 080h,0bah,03fh,03ah,000h,08eh,0ffh,00eh,000h,0e6h,0e1h,006h,000h,0f0h,0cch,000h	; b73b  ..?:............

; ======================================================================
; CODIGO 0xb74b..0xb768  (29 bytes)
; ======================================================================


L_B74B:
	inc c			;b74b
	rst 38h			;b74c
	defb 0ddh,000h,01dh ;illegal sequence	;b74d
	rst 38h			;b750
	sbc a,a			;b751
	nop			;b752
	rra			;b753
	rst 38h			;b754
	cp b			;b755
	nop			;b756
	jr c,$+1		;b757
	add a,a			;b759
	nop			;b75a
	rlca			;b75b
	rst 38h			;b75c
	or a			;b75d
	nop			;b75e
	scf			;b75f
	rst 38h			;b760
	rst 38h			;b761
	nop			;b762
	nop			;b763
	rst 38h			;b764
	jp 00000h		;b765   ; BIOS CHKRAM - Tests RAM and sets RAM slot for the system  [alias: STARTUP, RESET, BOOT]

; ----------------------------------------------------------------------
; DATOS sprites:: 83 de 16x16 con mascara, 64 bytes cada uno
;   0xa560..0xba20  (5312 bytes)
; ----------------------------------------------------------------------
	defb 0e3h,019h,000h,018h,0eah,05dh,008h,05ch,0e2h,0cdh,000h,0cch,0feh,0a9h,000h,0a8h	; b768  .....].\........
	defb 0feh,07dh,000h,07ch,0c6h,0f5h,000h,0f4h,0d6h,0c9h,010h,0c8h,0c6h,063h,000h,060h	; b778  .}.|.........c.`
	defb 03fh,02fh,000h,020h,0bfh,08fh,080h,000h,08fh,0ffh,080h,000h,0afh,0ffh,0a0h,000h	; b788  ?/. ............
	defb 06fh,0ffh,060h,000h,04fh,0ffh,040h,000h,0c7h,0b9h,000h,039h,0d7h,097h,010h,017h	; b798  o.`.O.@....9....
	defb 0c4h,00eh,000h,00eh,0fdh,0a8h,001h,088h,0fch,023h,000h,000h,0ffh,0ffh,000h,000h	; b7a8  .........#......
	defb 0c3h,0ffh,000h,000h,098h,0ffh,018h,000h,0bah,063h,03ah,000h,0afh,06bh,02fh,008h	; b7b8  .........c:..k/.
	defb 095h,069h,015h,008h,0b6h,04ch,036h,00ch,093h,056h,013h,016h,0c6h,052h,006h,012h	; b7c8  .i...L6..V...R..
	defb 0f0h,0cch,000h,00ch,0ffh,0e1h,000h,000h,01fh,0ffh,000h,000h,0bfh,0ffh,080h,000h	; b7d8  ................
	defb 030h,0f1h,000h,000h,0f6h,0f5h,006h,004h,0f4h,0f1h,004h,000h,0f1h,0ffh,000h,000h	; b7e8  0...............
	defb 0ffh,0ffh,000h,000h,0ffh,00fh,000h,000h,0feh,063h,000h,060h,0feh,0ebh,000h,0e8h	; b7f8  .........c.`....
	defb 08ch,0dbh,000h,0d8h,0adh,03bh,021h,038h,08ch,0c3h,000h,0c0h,0fdh,0efh,001h,0e0h	; b808  .....;!8........
	defb 0fch,00fh,000h,000h,0ffh,0ffh,000h,000h,000h,000h,000h,000h,003h,080h,0e3h,08eh	; b818  ................
	defb 002h,080h,0bfh,0fah,003h,080h,0e3h,08eh,001h,000h,001h,000h,001h,000h,001h,000h	; b828  ................
	defb 001h,000h,001h,000h,0e3h,08eh,003h,080h,0ffh,0fah,003h,080h,0e3h,08eh,003h,080h	; b838  ................
	defb 001h,000h,001h,000h,001h,000h,001h,000h,001h,000h,001h,000h,003h,080h,003h,080h	; b848  ................
	defb 002h,080h,002h,080h,003h,080h,003h,080h,000h,000h,000h,000h,000h,000h,0e0h,00eh	; b858  ................
	defb 038h,01ch,0a0h,00ah,03fh,0f4h,0e0h,00eh,038h,01ch,040h,004h,010h,008h,040h,004h	; b868  8...?...8.@...@.
	defb 010h,008h,040h,004h,010h,008h,0e0h,00eh,010h,008h,0e0h,00eh,010h,008h,0e0h,00eh	; b878  ..@.............
	defb 010h,008h,040h,004h,038h,01ch,040h,004h,02fh,0f4h,040h,004h,038h,01ch,0e3h,08eh	; b888  ..@.8.@./.@.8...
	defb 000h,000h,0beh,0fah,000h,000h,0e3h,08eh,000h,000h,000h,000h,003h,080h,0e3h,08eh	; b898  ................
	defb 002h,080h,0beh,0fah,003h,080h,0e3h,08eh,001h,000h,001h,000h,001h,000h,001h,000h	; b8a8  ................
	defb 001h,000h,001h,000h,0e3h,08eh,003h,080h,0e3h,08ah,003h,080h,0e3h,08eh,003h,080h	; b8b8  ................
	defb 041h,004h,001h,000h,041h,004h,001h,000h,041h,004h,001h,000h,0e3h,08eh,0e3h,08eh	; b8c8  A...A...A.......
	defb 0beh,0fah,0beh,0fah,0e3h,08eh,0e3h,08eh,000h,000h,000h,000h,0e3h,08eh,0e3h,08eh	; b8d8  ................
	defb 0a2h,08ah,0beh,0fah,0e3h,08eh,0e3h,08eh,041h,004h,040h,004h,041h,004h,040h,004h	; b8e8  ........A.@.A.@.
	defb 041h,004h,040h,004h,0e3h,08eh,0e3h,08eh,0feh,0feh,0a3h,08ah,0e3h,08eh,0e3h,08eh	; b8f8  A.@.............
	defb 040h,004h,041h,004h,040h,004h,041h,004h,040h,004h	; b908  @.A.@.A.@.

; ======================================================================
; CODIGO 0xb912..0xbad7  (453 bytes)
; ======================================================================


L_B912:
	ld b,c			;b912
	inc b			;b913
	ret po			;b914
	ld c,0e3h		;b915
	adc a,(hl)		;b917
	and b			;b918
	ld a,(bc)		;b919
	cp a			;b91a
	jp m,00ee0h		;b91b
	ex (sp),hl		;b91e
	adc a,(hl)		;b91f
	call m,0003fh		;b920
L_B923:
	nop			;b923
	pop hl			;b924
	add a,a			;b925
	ld bc,0ca80h		;b926
	out (00ah),a		;b929
	ret nc			;b92b
	sbc a,d			;b92c
	exx			;b92d
	ld a,(de)		;b92e
	ret c			;b92f
	or d			;b930
	call L_CC32		;b931
	add a,h			;b934
	pop hl			;b935
	inc b			;b936
	ret po			;b937
	add hl,sp		;b938
	ld a,h			;b939
	add hl,sp		;b93a
	ld a,h			;b93b
	ld b,d			;b93c
	add a,(hl)		;b93d
	ld b,d			;b93e
	add a,(hl)		;b93f
	ld e,l			;b940
	ld a,(hl)		;b941
L_B942:
	ld e,l			;b942
	ld a,(hl)		;b943
L_B944:
	jr c,L_B942		;b944
	jr c,L_B944		;b946
	add a,h			;b948
	pop hl			;b949
	inc b			;b94a
	ret po			;b94b
	or d			;b94c
	call L_CC32		;b94d
	sbc a,d			;b950
	exx			;b951
	ld a,(de)		;b952
	ret c			;b953
	jp z,00ad3h		;b954
	ret nc			;b957
	pop hl			;b958
	add a,a			;b959
	ld bc,0fc80h		;b95a
	ccf			;b95d
	nop			;b95e
	nop			;b95f
	ret m			;b960
	rra			;b961
	nop			;b962
	nop			;b963
	jp po,00247h		;b964
	ld b,b			;b967
	defb 0edh ;next byte illegal after ed	;b968
	or a			;b969
	dec c			;b96a
	or b			;b96b
	adc a,l			;b96c
	or c			;b96d
	dec c			;b96e
	or b			;b96f
	or l			;b970
	xor l			;b971
	dec (hl)		;b972
	xor h			;b973
	dec sp			;b974
	call c,L_DC3B		;b975
	ld b,(hl)		;b978
	ld h,d			;b979
	ld b,(hl)		;b97a
	ld h,d			;b97b
	dec a			;b97c
L_B97D:
	cp h			;b97d
	dec a			;b97e
	cp h			;b97f
	dec a			;b980
	cp h			;b981
	dec a			;b982
	cp h			;b983
	ld b,(hl)		;b984
	ld h,d			;b985
	ld b,(hl)		;b986
	ld h,d			;b987
	dec sp			;b988
	call c,L_DC3B		;b989
	or l			;b98c
	xor l			;b98d
	dec (hl)		;b98e
	xor h			;b98f
	adc a,l			;b990
	or c			;b991
	dec c			;b992
	or b			;b993
	defb 0edh ;next byte illegal after ed	;b994
	or a			;b995
	dec c			;b996
	or b			;b997
	jp po,00247h		;b998
	ld b,b			;b99b
	ret m			;b99c
	rra			;b99d
	nop			;b99e
	nop			;b99f
	ret m			;b9a0
	rra			;b9a1
	nop			;b9a2
	nop			;b9a3
	ex (sp),hl		;b9a4
	rst 0			;b9a5
	inc bc			;b9a6
	ret nz			;b9a7
	adc a,0b3h		;b9a8
	ld c,0b0h		;b9aa
	sub a			;b9ac
	exx			;b9ad
	rla			;b9ae
	ret c			;b9af
	xor a			;b9b0
	defb 0edh ;next byte illegal after ed	;b9b1
	cpl			;b9b2
	call pe,0343ch		;b9b3
	inc a			;b9b6
	inc (hl)		;b9b7
	ld a,c			;b9b8
	sbc a,(hl)		;b9b9
	ld a,b			;b9ba
	ld e,05bh		;b9bb
	sub 058h		;b9bd
	ld d,07bh		;b9bf
	sbc a,078h		;b9c1
	ld e,059h		;b9c3
	sub (hl)		;b9c5
	ld e,b			;b9c6
	ld d,02ch		;b9c7
	inc l			;b9c9
	inc l			;b9ca
	inc l			;b9cb
	or a			;b9cc
	defb 0ddh,037h,0dch ;illegal sequence	;b9cd
	sbc a,d			;b9d0
	cp c			;b9d1
	ld a,(de)		;b9d2
	cp b			;b9d3
	rst 8			;b9d4
	di			;b9d5
	rrca			;b9d6
	ret p			;b9d7
	ex (sp),hl		;b9d8
	rst 0			;b9d9
	inc bc			;b9da
	ret nz			;b9db
	ret m			;b9dc
	rra			;b9dd
	nop			;b9de
	nop			;b9df
	ret m			;b9e0
	rra			;b9e1
L_B9E2:
	nop			;b9e2
	nop			;b9e3
	ex (sp),hl		;b9e4
	rst 0			;b9e5
	inc bc			;b9e6
	ret nz			;b9e7
	call z,00c33h		;b9e8
	jr nc,L_B97D		;b9eb
	add hl,de		;b9ed
	djnz L_BA08		;b9ee
	and d			;b9f0
	xor l			;b9f1
	ld (024ach),hl		;b9f2
	ld (hl),h		;b9f5
	inc h			;b9f6
	ld (hl),h		;b9f7
	ld c,b			;b9f8
	cp (hl)			;b9f9
	ld c,b			;b9fa
	cp (hl)			;b9fb
	ld b,c			;b9fc
	sub 041h		;b9fd
	sub 04bh		;b9ff
	ld a,04bh		;ba01
	ld a,041h		;ba03
	halt			;ba05
	ld b,c			;ba06
	halt			;ba07
L_BA08:
	add hl,hl		;ba08
	call pe,L_EC29		;ba09
	and l			;ba0c
	ld e,l			;ba0d
	dec h			;ba0e
	ld e,h			;ba0f
	sub d			;ba10
	cp c			;ba11
	ld (de),a		;ba12
	cp b			;ba13
	rst 8			;ba14
	di			;ba15
	rrca			;ba16
	ret p			;ba17
	ex (sp),hl		;ba18
	rst 0			;ba19
	inc bc			;ba1a
	ret nz			;ba1b
	ret m			;ba1c
	rra			;ba1d
	nop			;ba1e
	nop			;ba1f
	nop			;ba20
	nop			;ba21
	nop			;ba22
	nop			;ba23
	nop			;ba24
	nop			;ba25
	ld (bc),a		;ba26
	ld (bc),a		;ba27
	ld (bc),a		;ba28
	ld (bc),a		;ba29
	ld (bc),a		;ba2a
	ld (bc),a		;ba2b
	ld (bc),a		;ba2c
	ld (bc),a		;ba2d
	ld (bc),a		;ba2e
	ld (bc),a		;ba2f
	ld (bc),a		;ba30
	ld (bc),a		;ba31
	ld (bc),a		;ba32
	ld (bc),a		;ba33
	ld (bc),a		;ba34
	ld (bc),a		;ba35
	ld (bc),a		;ba36
	ld (bc),a		;ba37
	ld (bc),a		;ba38
	ld (bc),a		;ba39
	ld (bc),a		;ba3a
	ld (bc),a		;ba3b
	ld (bc),a		;ba3c
	ld (bc),a		;ba3d
	ld (bc),a		;ba3e
	ld (bc),a		;ba3f
	nop			;ba40
	nop			;ba41
	nop			;ba42
	nop			;ba43
	nop			;ba44
	nop			;ba45
	nop			;ba46
	nop			;ba47
	nop			;ba48
	nop			;ba49
	nop			;ba4a
	nop			;ba4b
	nop			;ba4c
	nop			;ba4d
	nop			;ba4e
	nop			;ba4f
	nop			;ba50
	nop			;ba51
	nop			;ba52
	nop			;ba53
	nop			;ba54
	nop			;ba55
	nop			;ba56
	nop			;ba57
	nop			;ba58
	nop			;ba59
	nop			;ba5a
	nop			;ba5b
	ld a,(bc)		;ba5c
	ld a,(bc)		;ba5d
	ld a,(bc)		;ba5e
	ld a,(bc)		;ba5f
	ld (bc),a		;ba60
	ld (bc),a		;ba61
	ld (bc),a		;ba62
	ld (bc),a		;ba63
	ld (bc),a		;ba64
	ld (bc),a		;ba65
	ld d,016h		;ba66
	dec b			;ba68
	dec d			;ba69
	dec d			;ba6a
	dec b			;ba6b
	dec d			;ba6c
	dec b			;ba6d
	dec d			;ba6e
	dec b			;ba6f
	dec b			;ba70
	add hl,bc		;ba71
	add hl,bc		;ba72
	add hl,bc		;ba73
	add hl,bc		;ba74
	add hl,bc		;ba75
	add hl,bc		;ba76
	add hl,bc		;ba77
	ld a,(bc)		;ba78
	ld a,(bc)		;ba79
	ld a,(bc)		;ba7a
	ld a,(bc)		;ba7b
	ld a,(bc)		;ba7c
	ld a,(bc)		;ba7d
	ld (bc),a		;ba7e
	ld (bc),a		;ba7f
	ld b,006h		;ba80
	ld b,006h		;ba82
	rlca			;ba84
	dec b			;ba85
	dec b			;ba86
	dec b			;ba87
	dec b			;ba88
	dec b			;ba89
	ld bc,00909h		;ba8a
	add hl,bc		;ba8d
	add hl,bc		;ba8e
	add hl,bc		;ba8f
	ex af,af'		;ba90
	ex af,af'		;ba91
	ex af,af'		;ba92
	ex af,af'		;ba93
	nop			;ba94
	djnz L_BA97		;ba95
L_BA97:
	nop			;ba97
	djnz L_BA9A		;ba98
L_BA9A:
	djnz L_BA9C		;ba9a
L_BA9C:
	nop			;ba9c
	djnz L_BA9F		;ba9d
L_BA9F:
	djnz L_BAA1		;ba9f
L_BAA1:
	djnz L_BAA3		;baa1
L_BAA3:
	djnz L_BAA5		;baa3
L_BAA5:
	djnz L_BAA7		;baa5
L_BAA7:
	djnz L_BAA9		;baa7
L_BAA9:
	nop			;baa9
	ld (de),a		;baaa
	ld (bc),a		;baab
	ld (de),a		;baac
	ld (bc),a		;baad
	ld (de),a		;baae
	ld (bc),a		;baaf
	ld (de),a		;bab0
	ld (bc),a		;bab1
	ld (de),a		;bab2
	ld (bc),a		;bab3
	ld (de),a		;bab4
	ld (bc),a		;bab5
	ld (bc),a		;bab6
	ld (bc),a		;bab7
	ld (bc),a		;bab8
	ld (bc),a		;bab9
	ld (bc),a		;baba
	ld (bc),a		;babb
	ld (bc),a		;babc
	ld (bc),a		;babd
	ld b,006h		;babe
	ld d,015h		;bac0
	dec b			;bac2
	dec d			;bac3
	dec b			;bac4
	dec d			;bac5
	dec b			;bac6
	inc d			;bac7
	inc d			;bac8
	inc b			;bac9
	inc d			;baca
	inc b			;bacb
	dec d			;bacc
	dec b			;bacd
	dec d			;bace
	dec c			;bacf
	add hl,bc		;bad0
	add hl,bc		;bad1
	add hl,bc		;bad2
	add hl,de		;bad3
	ex af,af'		;bad4
	jr $+10			;bad5

; ----------------------------------------------------------------------
; DATOS colores: (SCREEN 2) (8 B; racha 2.00, entropia 1.30, 3 valores, el nibble bajo es 0xA en el 88%)
;   0xbad7..0xbadf  (8 bytes)
; ----------------------------------------------------------------------
	defb 00ah,00ah,00ah,01ah,00ah,01ah,00ah,019h	; bad7  ........

; ======================================================================
; CODIGO 0xbadf..0xbb4e  (111 bytes)
; ======================================================================


L_BADF:
	add hl,de		;badf
	add hl,bc		;bae0
	add hl,de		;bae1
	ex af,af'		;bae2
	ex af,af'		;bae3
	ex af,af'		;bae4
	ex af,af'		;bae5
	jr L_BAF0		;bae6
L_BAE8:
	add hl,de		;bae8
	add hl,bc		;bae9
	add hl,bc		;baea
	add hl,de		;baeb
	add hl,bc		;baec
	add hl,de		;baed
	add hl,bc		;baee
	ex af,af'		;baef
L_BAF0:
	ex af,af'		;baf0
	ld a,(bc)		;baf1
	ld a,(bc)		;baf2
	ld a,(bc)		;baf3
	ld a,(bc)		;baf4
	ld a,(bc)		;baf5
	ld (bc),a		;baf6
	ld (bc),a		;baf7
	ld (bc),a		;baf8
	ld (de),a		;baf9
	ld (de),a		;bafa
	ld (bc),a		;bafb
	ld (de),a		;bafc
	ld (bc),a		;bafd
	ld (de),a		;bafe
	ld (bc),a		;baff
	ld (de),a		;bb00
	ld (bc),a		;bb01
	ld (de),a		;bb02
	nop			;bb03
	djnz L_BB06		;bb04
L_BB06:
	djnz L_BB08		;bb06
L_BB08:
	nop			;bb08
	nop			;bb09
	nop			;bb0a
	nop			;bb0b
	nop			;bb0c
	nop			;bb0d
	nop			;bb0e
	nop			;bb0f
	nop			;bb10
	nop			;bb11
L_BB12:
	nop			;bb12
	nop			;bb13
	nop			;bb14
	nop			;bb15
	djnz L_BB28		;bb16
	nop			;bb18
	dec b			;bb19
	dec b			;bb1a
	dec b			;bb1b
	dec b			;bb1c
	dec b			;bb1d
	dec b			;bb1e
	dec b			;bb1f
	dec b			;bb20
	dec b			;bb21
	dec b			;bb22
	dec b			;bb23
	dec b			;bb24
	dec b			;bb25
	dec b			;bb26
	dec b			;bb27
L_BB28:
	dec b			;bb28
	dec b			;bb29
	dec b			;bb2a
	dec b			;bb2b
	dec b			;bb2c
	dec b			;bb2d
	dec b			;bb2e
	dec b			;bb2f
	inc b			;bb30
	inc b			;bb31
	inc b			;bb32
	inc b			;bb33
	inc b			;bb34
	inc b			;bb35
	inc b			;bb36
	inc b			;bb37
	inc b			;bb38
	inc b			;bb39
	inc b			;bb3a
	inc b			;bb3b
	inc b			;bb3c
	inc b			;bb3d
	inc b			;bb3e
	inc b			;bb3f
	inc b			;bb40
	inc b			;bb41
	inc b			;bb42
	inc b			;bb43
	inc d			;bb44
	djnz L_BB49		;bb45
	ld a,(bc)		;bb47
	ld a,(bc)		;bb48
L_BB49:
	ld a,(bc)		;bb49
	add hl,de		;bb4a
	add hl,bc		;bb4b
	jr $+12			;bb4c

; ----------------------------------------------------------------------
; DATOS relleno: o resto (5 B; 5 bytes)
;   0xbb4e..0xbb53  (5 bytes)
; ----------------------------------------------------------------------
	defb 00ah,00ah,01ah,009h,009h	; bb4e  .....

; ======================================================================
; CODIGO 0xbb53..0xbb73  (32 bytes)
; ======================================================================


L_BB53:
	add hl,de		;bb53
	add hl,bc		;bb54
	add hl,de		;bb55
	add hl,bc		;bb56
	add hl,bc		;bb57
L_BB58:
	ld a,(bc)		;bb58
	ld a,(de)		;bb59
	ld a,(bc)		;bb5a
	ld a,(de)		;bb5b
	ld a,(bc)		;bb5c
	ld (bc),a		;bb5d
	ld b,016h		;bb5e
	ld b,016h		;bb60
	dec d			;bb62
	dec b			;bb63
	dec d			;bb64
	dec b			;bb65
	dec d			;bb66
	dec b			;bb67
	dec d			;bb68
	add hl,bc		;bb69
	add hl,bc		;bb6a
	add hl,bc		;bb6b
	add hl,bc		;bb6c
	add hl,bc		;bb6d
	ld a,(bc)		;bb6e
	ld a,(bc)		;bb6f
	ld a,(bc)		;bb70
	jr $+11			;bb71

; ----------------------------------------------------------------------
; DATOS tabla: (9 B; racha 2.18, entropia 1.75, 4 valores: pocos valores para ser un dibujo)
;   0xbb73..0xbb7c  (9 bytes)
; ----------------------------------------------------------------------
	defb 009h,019h,009h,019h,009h,009h,019h,008h,018h	; bb73  .........

; ======================================================================
; CODIGO 0xbb7c..0xbb7e  (2 bytes)
; ======================================================================


L_BB7C:
	jr $+12			;bb7c

; ----------------------------------------------------------------------
; DATOS tabla: (10 B; racha 2.16, entropia 0.72, 2 valores: pocos valores para ser un dibujo)
;   0xbb7e..0xbb88  (10 bytes)
; ----------------------------------------------------------------------
	defb 002h,002h,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah	; bb7e  ..........

; ======================================================================
; CODIGO 0xbb88..0xbbb2  (42 bytes)
; ======================================================================


L_BB88:
	ld a,(bc)		;bb88
	ld a,(bc)		;bb89
	ld (de),a		;bb8a
	ld b,006h		;bb8b
	ld d,005h		;bb8d
	dec b			;bb8f
	dec d			;bb90
	dec b			;bb91
	dec b			;bb92
	dec b			;bb93
	dec d			;bb94
	ld de,00101h		;bb95
	ld bc,00101h		;bb98
	djnz L_BB9D		;bb9b
L_BB9D:
	nop			;bb9d
	nop			;bb9e
	djnz L_BBA1		;bb9f
L_BBA1:
	nop			;bba1
L_BBA2:
	nop			;bba2
	djnz L_BBA5		;bba3
L_BBA5:
	ld (bc),a		;bba5
	ld (bc),a		;bba6
	ld (bc),a		;bba7
	ld (bc),a		;bba8
	ld (bc),a		;bba9
	ld (bc),a		;bbaa
	ld (bc),a		;bbab
	nop			;bbac
	nop			;bbad
	nop			;bbae
	nop			;bbaf
	jr $+27			;bbb0

; ----------------------------------------------------------------------
; DATOS tabla: (25 B; racha 2.30, entropia 2.95, 9 valores: pocos valores para ser un dibujo)
;   0xbbb2..0xbbcb  (25 bytes)
; ----------------------------------------------------------------------
	defb 009h,009h,019h,009h,009h,009h,001h,005h,015h,005h,014h,014h,004h,014h,006h,006h	; bbb2  ................
	defb 016h,006h,004h,014h,004h,016h,016h,006h,016h	; bbc2  .........

; ======================================================================
; CODIGO 0xbbcb..0xbc4f  (132 bytes)
; ======================================================================


L_BBCB:
	nop			;bbcb
	nop			;bbcc
	nop			;bbcd
	nop			;bbce
	nop			;bbcf
	nop			;bbd0
	nop			;bbd1
	nop			;bbd2
	nop			;bbd3
	nop			;bbd4
	nop			;bbd5
	nop			;bbd6
	nop			;bbd7
	nop			;bbd8
	nop			;bbd9
	nop			;bbda
	djnz L_BBED		;bbdb
	djnz L_BBDF		;bbdd
L_BBDF:
	nop			;bbdf
	ex af,af'		;bbe0
	ex af,af'		;bbe1
	ld a,(bc)		;bbe2
	ld a,(bc)		;bbe3
	ld (bc),a		;bbe4
	ld (bc),a		;bbe5
	ld (bc),a		;bbe6
	ld (bc),a		;bbe7
	ld (bc),a		;bbe8
	ld (de),a		;bbe9
	ld (de),a		;bbea
	inc b			;bbeb
	inc b			;bbec
L_BBED:
	inc d			;bbed
	inc d			;bbee
	inc b			;bbef
	inc b			;bbf0
	inc d			;bbf1
	inc b			;bbf2
	inc b			;bbf3
	inc d			;bbf4
	inc b			;bbf5
	inc b			;bbf6
	nop			;bbf7
	ld bc,00101h		;bbf8
	ld bc,00101h		;bbfb
	ld bc,00101h		;bbfe
	add hl,bc		;bc01
	add hl,bc		;bc02
	add hl,bc		;bc03
	add hl,bc		;bc04
	add hl,bc		;bc05
	add hl,bc		;bc06
	add hl,bc		;bc07
	add hl,bc		;bc08
	add hl,bc		;bc09
	add hl,bc		;bc0a
	ex af,af'		;bc0b
	ex af,af'		;bc0c
	ex af,af'		;bc0d
	ex af,af'		;bc0e
	ex af,af'		;bc0f
	ex af,af'		;bc10
	ex af,af'		;bc11
	ld a,(bc)		;bc12
	ld a,(bc)		;bc13
	ld a,(bc)		;bc14
	ld a,(bc)		;bc15
	ld a,(bc)		;bc16
	ld a,(bc)		;bc17
	ld (bc),a		;bc18
	ld (bc),a		;bc19
	ld (bc),a		;bc1a
	nop			;bc1b
	inc b			;bc1c
	inc d			;bc1d
	inc d			;bc1e
	inc b			;bc1f
	inc d			;bc20
	inc d			;bc21
	nop			;bc22
	ld (de),a		;bc23
	ld (bc),a		;bc24
	ld (bc),a		;bc25
	ld (de),a		;bc26
	ld (bc),a		;bc27
	ld (de),a		;bc28
	ld (bc),a		;bc29
	ld (de),a		;bc2a
	ld (de),a		;bc2b
	ld (bc),a		;bc2c
	ld (de),a		;bc2d
	ld (bc),a		;bc2e
	ld (de),a		;bc2f
	ld (bc),a		;bc30
	ld (de),a		;bc31
	ld (bc),a		;bc32
	ld (bc),a		;bc33
	ld (de),a		;bc34
	inc b			;bc35
	inc d			;bc36
	dec d			;bc37
	dec b			;bc38
	dec d			;bc39
	dec b			;bc3a
	dec d			;bc3b
	dec d			;bc3c
	dec b			;bc3d
	dec d			;bc3e
	dec b			;bc3f
	inc d			;bc40
	inc d			;bc41
	dec b			;bc42
	add hl,bc		;bc43
	add hl,bc		;bc44
	add hl,de		;bc45
	ex af,af'		;bc46
	ex af,af'		;bc47
	ld a,(de)		;bc48
	ld a,(bc)		;bc49
	jr $+10			;bc4a
	add hl,bc		;bc4c
	jr $+26			;bc4d

; ----------------------------------------------------------------------
; DATOS relleno: o resto (5 B; 5 bytes)
;   0xbc4f..0xbc54  (5 bytes)
; ----------------------------------------------------------------------
	defb 008h,008h,008h,008h,008h	; bc4f  .....

; ======================================================================
; CODIGO 0xbc54..0xc05c  (1032 bytes)
; ======================================================================


L_BC54:
	ex af,af'		;bc54
	ex af,af'		;bc55
	ex af,af'		;bc56
	ex af,af'		;bc57
	ex af,af'		;bc58
	ex af,af'		;bc59
	ex af,af'		;bc5a
	ex af,af'		;bc5b
	ex af,af'		;bc5c
	ld (bc),a		;bc5d
	ld (bc),a		;bc5e
	ld b,004h		;bc5f
	inc b			;bc61
	dec b			;bc62
	dec b			;bc63
	dec b			;bc64
	dec b			;bc65
	dec b			;bc66
L_BC67:
	dec b			;bc67
	inc b			;bc68
	inc b			;bc69
	inc b			;bc6a
	inc b			;bc6b
	inc b			;bc6c
	inc b			;bc6d
	inc b			;bc6e
	inc d			;bc6f
	inc d			;bc70
	inc b			;bc71
	inc d			;bc72
	inc b			;bc73
	inc d			;bc74
	inc b			;bc75
	add hl,bc		;bc76
	add hl,bc		;bc77
	add hl,bc		;bc78
	add hl,bc		;bc79
	ld bc,00101h		;bc7a
	nop			;bc7d
	nop			;bc7e
	ex af,af'		;bc7f
	ex af,af'		;bc80
	ex af,af'		;bc81
	ex af,af'		;bc82
	ex af,af'		;bc83
	ex af,af'		;bc84
	ex af,af'		;bc85
	ex af,af'		;bc86
	ex af,af'		;bc87
	add hl,bc		;bc88
	add hl,bc		;bc89
	add hl,bc		;bc8a
	add hl,bc		;bc8b
	add hl,bc		;bc8c
	add hl,bc		;bc8d
	add hl,bc		;bc8e
	add hl,bc		;bc8f
	add hl,bc		;bc90
	add hl,bc		;bc91
	add hl,bc		;bc92
	add hl,bc		;bc93
	add hl,bc		;bc94
	add hl,bc		;bc95
	ld bc,00010h		;bc96
	djnz L_BCAB		;bc99
	nop			;bc9b
	nop			;bc9c
	djnz L_BCAF		;bc9d
	nop			;bc9f
	djnz L_BCA2		;bca0
L_BCA2:
	djnz L_BCA6		;bca2
	ld (de),a		;bca4
	ld (bc),a		;bca5
L_BCA6:
	ld (de),a		;bca6
	ld (bc),a		;bca7
	ld (de),a		;bca8
	ld (bc),a		;bca9
	ld (de),a		;bcaa
L_BCAB:
	ld (bc),a		;bcab
L_BCAC:
	ld (de),a		;bcac
	ld (bc),a		;bcad
	ld (de),a		;bcae
L_BCAF:
	ld (bc),a		;bcaf
	ld (de),a		;bcb0
	ld (bc),a		;bcb1
	ld (de),a		;bcb2
	ld b,016h		;bcb3
	inc b			;bcb5
	dec b			;bcb6
	dec b			;bcb7
	dec b			;bcb8
	dec d			;bcb9
	dec d			;bcba
	dec b			;bcbb
	dec b			;bcbc
	dec b			;bcbd
	dec b			;bcbe
	dec b			;bcbf
	dec b			;bcc0
	dec b			;bcc1
	inc b			;bcc2
	inc b			;bcc3
	inc b			;bcc4
	inc b			;bcc5
	inc b			;bcc6
	inc b			;bcc7
	inc b			;bcc8
	inc b			;bcc9
	inc b			;bcca
	inc b			;bccb
	inc b			;bccc
	inc b			;bccd
	inc b			;bcce
	inc b			;bccf
	inc b			;bcd0
	inc b			;bcd1
	inc b			;bcd2
	inc b			;bcd3
	inc b			;bcd4
	inc b			;bcd5
	inc b			;bcd6
	inc b			;bcd7
	inc b			;bcd8
	inc b			;bcd9
	inc d			;bcda
	inc d			;bcdb
	inc b			;bcdc
	nop			;bcdd
	nop			;bcde
	nop			;bcdf
	nop			;bce0
	ex af,af'		;bce1
	ex af,af'		;bce2
	ex af,af'		;bce3
	ex af,af'		;bce4
	ex af,af'		;bce5
	ex af,af'		;bce6
	ex af,af'		;bce7
	ex af,af'		;bce8
	ex af,af'		;bce9
	ex af,af'		;bcea
	ex af,af'		;bceb
	ex af,af'		;bcec
	ex af,af'		;bced
	ex af,af'		;bcee
	ex af,af'		;bcef
	ex af,af'		;bcf0
	ex af,af'		;bcf1
	ex af,af'		;bcf2
	ex af,af'		;bcf3
	ex af,af'		;bcf4
	ex af,af'		;bcf5
	ex af,af'		;bcf6
	ex af,af'		;bcf7
	nop			;bcf8
	ex af,af'		;bcf9
	nop			;bcfa
	nop			;bcfb
	nop			;bcfc
	nop			;bcfd
	nop			;bcfe
	nop			;bcff
	nop			;bd00
	nop			;bd01
	nop			;bd02
	nop			;bd03
	nop			;bd04
	nop			;bd05
	nop			;bd06
	nop			;bd07
	nop			;bd08
	nop			;bd09
	nop			;bd0a
	ld b,006h		;bd0b
	ld b,006h		;bd0d
	ld b,002h		;bd0f
	ld (bc),a		;bd11
	ld a,(bc)		;bd12
	dec bc			;bd13
	add hl,bc		;bd14
	add hl,bc		;bd15
	ld de,00111h		;bd16
	ld bc,00101h		;bd19
	ld bc,00000h		;bd1c
	djnz L_BD31		;bd1f
	nop			;bd21
L_BD22:
	nop			;bd22
	nop			;bd23
	nop			;bd24
	nop			;bd25
	nop			;bd26
	nop			;bd27
	nop			;bd28
	nop			;bd29
	nop			;bd2a
	nop			;bd2b
	nop			;bd2c
	ex af,af'		;bd2d
	ex af,af'		;bd2e
	ex af,af'		;bd2f
	ld a,(bc)		;bd30
L_BD31:
	ld a,(bc)		;bd31
	ld a,(bc)		;bd32
	ld (bc),a		;bd33
	ld (bc),a		;bd34
	ld (de),a		;bd35
	ld (bc),a		;bd36
	ld (bc),a		;bd37
	ld (de),a		;bd38
	ld (bc),a		;bd39
	ld (de),a		;bd3a
	ld (bc),a		;bd3b
	djnz L_BD3E		;bd3c
L_BD3E:
	nop			;bd3e
	add hl,de		;bd3f
	add hl,bc		;bd40
	add hl,bc		;bd41
	add hl,de		;bd42
	add hl,bc		;bd43
	add hl,de		;bd44
	add hl,bc		;bd45
	add hl,de		;bd46
	add hl,bc		;bd47
	add hl,de		;bd48
	ld de,01505h		;bd49
	dec d			;bd4c
	inc b			;bd4d
	inc b			;bd4e
	inc d			;bd4f
	inc d			;bd50
	inc b			;bd51
	ld d,002h		;bd52
	ld (bc),a		;bd54
	ld (de),a		;bd55
	ld a,(bc)		;bd56
	ld a,(de)		;bd57
	ld a,(bc)		;bd58
	ld a,(bc)		;bd59
	ld a,(de)		;bd5a
	ld (bc),a		;bd5b
	ld (bc),a		;bd5c
	ld (bc),a		;bd5d
	ld (bc),a		;bd5e
	ld (bc),a		;bd5f
	ld (bc),a		;bd60
	ld (bc),a		;bd61
	ld (bc),a		;bd62
	ld (bc),a		;bd63
	ld (bc),a		;bd64
	ld b,006h		;bd65
	inc d			;bd67
	inc b			;bd68
	inc b			;bd69
	inc b			;bd6a
	inc b			;bd6b
	inc b			;bd6c
	inc b			;bd6d
	inc b			;bd6e
	inc b			;bd6f
	inc b			;bd70
	inc b			;bd71
	inc b			;bd72
	inc b			;bd73
	inc b			;bd74
	dec b			;bd75
	dec b			;bd76
	dec b			;bd77
	dec b			;bd78
	dec b			;bd79
	inc b			;bd7a
	inc b			;bd7b
	inc b			;bd7c
	inc b			;bd7d
	inc b			;bd7e
	inc b			;bd7f
	inc b			;bd80
	inc b			;bd81
	inc b			;bd82
	nop			;bd83
	nop			;bd84
L_BD85:
	ld sp,05b32h		;bd85
	in a,(099h)		;bd88
	ld hl,00000h		;bd8a
	ld a,082h		;bd8d
	out (099h),a		;bd8f
	ld a,081h		;bd91
	and a			;bd93
	out (099h),a		;bd94
	ld a,0c9h		;bd96
	ld (0fd9ah),a		;bd98
	ld a,0c3h		;bd9b
	ld (0fd9fh),a		;bd9d
	ld hl,0e15ah		;bda0
	ld (0fda0h),hl		;bda3
	call L_EE34		;bda6
	call L_F50E		;bda9
	ld hl,0edffh		;bdac
	ld de,0ee00h		;bdaf
	ld bc,0000dh		;bdb2
	ld (hl),000h		;bdb5
	ldir			;bdb7
	ld a,r			;bdb9
	ld l,a			;bdbb
	ld a,r			;bdbc
	ld h,a			;bdbe
	ld (0ca8fh),hl		;bdbf
	ld hl,05c32h		;bdc2
	ld de,05c33h		;bdc5
	ld bc,001fdh		;bdc8
	ldir			;bdcb
	xor a			;bdcd
	ld (0dcc3h),a		;bdce
	ld de,0cb09h		;bdd1
	ld b,030h		;bdd4
L_BDD6:
	call L_C83F		;bdd6
	cp 0a0h			;bdd9
	inc hl			;bddb
	jr nc,L_BDD6		;bddc
	ld (de),a		;bdde
	inc de			;bddf
	djnz L_BDD6		;bde0
L_BDE2:
	call L_D6F9		;bde2
L_BDE5:
	ld hl,0a058h		;bde5
	ld (0c184h),hl		;bde8
	xor a			;bdeb
	ld (0c9a3h),a		;bdec
	inc a			;bdef
	ld (0e151h),a		;bdf0
	ld a,001h		;bdf3
	ld (0e157h),a		;bdf5
	ld hl,02f78h		;bdf8
	call L_F3A3		;bdfb
	ld a,073h		;bdfe
L_BE00:
	call L_F5F4		;be00
	ld a,0f1h		;be03
	call L_F634		;be05
	ld a,00ah		;be08
	ld (0d3c1h),a		;be0a
	call L_F2D1		;be0d
	call L_D45E		;be10
	ld a,003h		;be13
	ld (0e156h),a		;be15
	call L_C038		;be18
	ld hl,0c1bdh		;be1b
	ld (0c090h),hl		;be1e
	ld a,r			;be21
	ld l,a			;be23
	ld a,r			;be24
	ld h,a			;be26
	ld (0ca8fh),hl		;be27
L_BE2A:
	ld a,0a0h		;be2a
	ld (0ca8eh),a		;be2c
L_BE2F:
	call L_C858		;be2f
	call L_C33F		;be32
	call L_C08F		;be35
	call L_D4F3		;be38
	call L_F3DC		;be3b
	ld a,(0ca8eh)		;be3e
	dec a			;be41
	jp z,L_D560		;be42
	ld (0ca8eh),a		;be45
	ld a,(0e150h)		;be48
	and a			;be4b
	jr z,L_BE2F		;be4c
	bit 4,a			;be4e
	jp z,L_BE2A		;be50
	ld a,(0c185h)		;be53
	cp 039h			;be56
	jr c,L_BE2A		;be58
	cp 058h			;be5a
	jr z,L_BE2A		;be5c
	jr nc,L_BE66		;be5e
	ld (0dcc3h),a		;be60
	jp L_BE2A		;be63
L_BE66:
	cp 078h			;be66
	jr z,L_BE2A		;be68
	jr nc,L_BE73		;be6a
	xor a			;be6c
	ld (0dcc3h),a		;be6d
	jp L_BE2A		;be70
L_BE73:
	cp 098h			;be73
	jr z,L_BE2A		;be75
	jr nc,L_BE7F		;be77
	call L_F445		;be79
	jp L_BDE5		;be7c
L_BE7F:
	ld hl,0dd80h		;be7f
	ld de,0dd81h		;be82
	ld bc,00005h		;be85
	ld (hl),030h		;be88
	ldir			;be8a
	ld ix,0dd80h		;be8c
	ld de,012b0h		;be90
	call L_F41D		;be93
	ld a,002h		;be96
	ld (0e156h),a		;be98
	dec a			;be9b
	ld (0e157h),a		;be9c
	ld hl,0d0dfh		;be9f
	ld (0d0ddh),hl		;bea2
	ld hl,0c066h		;bea5
	ld (0c064h),hl		;bea8
	ld hl,0ba20h		;beab
	ld (0e158h),hl		;beae
	ld a,00ah		;beb1
	ld (0d3c1h),a		;beb3
	call L_F2D1		;beb6
L_BEB9:
	call L_D45E		;beb9
	xor a			;bebc
	ld (0c952h),a		;bebd
	ld (0c9a3h),a		;bec0
	ld (0dcc1h),a		;bec3
L_BEC6:
	ld (0e14eh),a		;bec6
	ld hl,0a058h		;bec9
	ld (0c184h),hl		;becc
	ld hl,003e8h		;becf
	ld de,05b32h		;bed2
	ld b,040h		;bed5
L_BED7:
	call L_C83F		;bed7
	and 00fh		;beda
	sub 007h		;bedc
	ld (de),a		;bede
	inc de			;bedf
	inc hl			;bee0
	call L_C83F		;bee1
	and 00fh		;bee4
	sub 00fh		;bee6
	ld (de),a		;bee8
	inc de			;bee9
	inc hl			;beea
	djnz L_BED7		;beeb
L_BEED:
	ld a,(0e157h)		;beed
	dec a			;bef0
	ld l,a			;bef1
	ld h,000h		;bef2
	ld d,h			;bef4
	ld e,l			;bef5
	add hl,hl		;bef6
	add hl,de		;bef7
	ld de,0de03h		;bef8
	add hl,de		;befb
	ld e,(hl)		;befc
	inc hl			;befd
	ld d,(hl)		;befe
L_BEFF:
	inc hl			;beff
	ld a,(hl)		;bf00
	push af			;bf01
	ex de,hl		;bf02
	call L_DA33		;bf03
	ld iy,0cb03h		;bf06
	ld (iy+000h),050h	;bf0a
	ld (iy+001h),001h	;bf0e
	ld (iy+002h),020h	;bf12
	xor a			;bf16
	ld (0c97ah),a		;bf17
	ld (0c98fh),a		;bf1a
	ld (0d3c5h),a		;bf1d
	ld (0c998h),a		;bf20
	ld (0c939h),a		;bf23
	ld (0ca92h),a		;bf26
	ld (0ca8eh),a		;bf29
	ld (0d3bdh),a		;bf2c
	ld (0dcc0h),a		;bf2f
	ld (0dcc2h),a		;bf32
	ld (0dcbfh),a		;bf35
	ld (0e14fh),a		;bf38
	ld (0e151h),a		;bf3b
	ld (0dac5h),a		;bf3e
	call L_F50E		;bf41
L_BF44:
	ld hl,0edffh		;bf44
	ld de,0ee00h		;bf47
	ld bc,0000dh		;bf4a
	ld (hl),000h		;bf4d
	ldir			;bf4f
	call L_C038		;bf51
L_BF54:
	ld a,073h		;bf54
	call L_F5F4		;bf56
	pop af			;bf59
	call L_F634		;bf5a
	ld a,080h		;bf5d
	ld (0ca91h),a		;bf5f
	ld a,001h		;bf62
	ld (0cb39h),a		;bf64
	ld (0d3c2h),a		;bf67
L_BF6A:
	ld hl,0ca8eh		;bf6a
	inc (hl)		;bf6d
	call L_C38A		;bf6e
	call L_D0DC		;bf71
	call L_F363		;bf74
	call L_C33F		;bf77
	ld a,001h		;bf7a
	ld (0d3c2h),a		;bf7c
	call L_CB7A		;bf7f
	call L_CF36		;bf82
	call L_CEBC		;bf85
	call L_D1AF		;bf88
	call L_CBEB		;bf8b
	call L_DF0F		;bf8e
	call L_C214		;bf91
	call L_CD86		;bf94
	call L_D41A		;bf97
	call L_C063		;bf9a
	call L_D820		;bf9d
	ld a,(0c090h)		;bfa0
	cp 0afh			;bfa3
	jr nz,L_BFD0		;bfa5
	call L_F660		;bfa7
	jp nz,L_BDE5		;bfaa
	ld a,(0ca8eh)		;bfad
	and 008h		;bfb0
	jr z,L_BFD0		;bfb2
	ld a,0ffh		;bfb4
	ld (0d4d3h),a		;bfb6
	ld (0d4d9h),a		;bfb9
	ld ix,0ddf2h		;bfbc
	ld hl,04d94h		;bfc0
	call L_D4E5		;bfc3
	ld a,055h		;bfc6
	ld (0d4d3h),a		;bfc8
	ld a,0aah		;bfcb
	ld (0d4d9h),a		;bfcd
L_BFD0:
	call L_F3DC		;bfd0
	ld a,(0cb39h)		;bfd3
	and a			;bfd6
	jp z,L_D740		;bfd7
	ld ix,0dcb1h		;bfda
	ld a,(ix+00dh)		;bfde
	out (0aah),a		;bfe1
	in a,(0a9h)		;bfe3
	and (ix+00ch)		;bfe5
	jp z,L_BDE2		;bfe8
	call L_C006		;bfeb
	ld a,(0c188h)		;bfee
	cp 02dh			;bff1
	jr nc,L_BFF8		;bff3
	jp L_BF6A		;bff5
L_BFF8:
	ld a,(0e156h)		;bff8
	sub 001h		;bffb
	ld (0e156h),a		;bffd
	jp c,L_BDE2		;c000
	jp L_BEB9		;c003
L_C006:
	ld ix,0dcb1h		;c006
	ld a,(ix+00bh)		;c00a
	out (0aah),a		;c00d
	in a,(0a9h)		;c00f
	and (ix+00ah)		;c011
	ret nz			;c014
L_C015:
	ld d,0f0h		;c015
	ld a,d			;c017
L_C018:
	out (0aah),a		;c018
	in a,(0a9h)		;c01a
	cpl			;c01c
	and a			;c01d
	jr nz,L_C015		;c01e
	inc d			;c020
	ld a,d			;c021
	cp 0f9h			;c022
	jr nz,L_C018		;c024
L_C026:
	ld d,0f0h		;c026
	ld a,d			;c028
L_C029:
	out (0aah),a		;c029
	in a,(0a9h)		;c02b
	cpl			;c02d
	and a			;c02e
	ret nz			;c02f
	inc d			;c030
	ld a,d			;c031
	cp 0f9h			;c032
	jr nz,L_C029		;c034
	jr L_C026		;c036
L_C038:
	ld a,(0e156h)		;c038
	add a,030h		;c03b
	ld (0e152h),a		;c03d
	ld ix,0e152h		;c040
L_C044:
	ld de,007a0h		;c044
	call L_F41D		;c047
	ld a,(0e157h)		;c04a
	add a,030h		;c04d
	ld (0e154h),a		;c04f
	ld ix,0e154h		;c052
	ld de,01630h		;c056
	jp L_F41D		;c059

; ----------------------------------------------------------------------
; DATOS relleno: o resto (7 B; 7 bytes)
;   0xc05c..0xc063  (7 bytes)
; ----------------------------------------------------------------------
	defb 03eh,003h,032h,088h,0c1h,018h,02ch	; c05c  >.2...,

; ======================================================================
; CODIGO 0xc063..0xc184  (289 bytes)
; ======================================================================


L_C063:
	jp L_C066		;c063
L_C066:
	ld hl,(0c184h)		;c066
	ld a,(0c188h)		;c069
	cp 004h			;c06c
	jr c,L_C08F		;c06e
	jr z,L_C07A		;c070
	inc a			;c072
	ld (0c188h),a		;c073
	call L_C60C		;c076
	ret			;c079
L_C07A:
	inc a			;c07a
	ld (0c188h),a		;c07b
	ld a,h			;c07e
	sub 010h		;c07f
	ld h,a			;c081
L_C082:
	call L_C5E3		;c082
	call L_C60C		;c085
	ld hl,0ff58h		;c088
	ld (0c184h),hl		;c08b
	ret			;c08e
L_C08F:
	call L_C1BD		;c08f
	ld (0e150h),a		;c092
	call L_E0F8		;c095
	and 00fh		;c098
	call L_D109		;c09a
	call L_C7D3		;c09d
	cp 0ffh			;c0a0
	push af			;c0a2
	jr nz,L_C0A6		;c0a3
	xor a			;c0a5
L_C0A6:
	rrca			;c0a6
	rrca			;c0a7
	rrca			;c0a8
	ld c,a			;c0a9
	ld a,(0c9a3h)		;c0aa
	and 01fh		;c0ad
	or c			;c0af
	call L_C794		;c0b0
	ld (0c9a3h),a		;c0b3
	pop af			;c0b6
	ld hl,(0c184h)		;c0b7
	jr z,L_C0D0		;c0ba
	ld a,(0c9a3h)		;c0bc
	and 007h		;c0bf
	ld hl,(0c184h)		;c0c1
	ld bc,00404h		;c0c4
	call L_C7DC		;c0c7
L_C0CA:
	call L_D130		;c0ca
	ld (0c184h),hl		;c0cd
L_C0D0:
	ld a,(0c9a3h)		;c0d0
	and 01fh		;c0d3
	call L_C47B		;c0d5
	call L_D067		;c0d8
	ret			;c0db
L_C0DC:
	ex af,af'		;c0dc
	ld a,(0ca92h)		;c0dd
	cp 008h			;c0e0
	ret nc			;c0e2
	ld ix,0cb3ah		;c0e3
	and a			;c0e7
	jr z,L_C0F4		;c0e8
	ld c,a			;c0ea
	ld de,00008h		;c0eb
L_C0EE:
	add ix,de		;c0ee
	dec c			;c0f0
	jp nz,L_C0EE		;c0f1
L_C0F4:
	inc a			;c0f4
	ld (0ca92h),a		;c0f5
	ld (ix+000h),000h	;c0f8
	ld (ix+007h),000h	;c0fc
	ld a,006h		;c100
	sub b			;c102
	rrca			;c103
	rrca			;c104
	rrca			;c105
	ld (ix+001h),a		;c106
	ex af,af'		;c109
	ld (ix+002h),a		;c10a
	ld de,0c678h		;c10d
	ld (ix+003h),e		;c110
	ld (ix+004h),d		;c113
	cp 030h			;c116
	jr c,L_C17D		;c118
	jr nz,L_C122		;c11a
	ld de,0c189h		;c11c
	jp L_C177		;c11f
L_C122:
	cp 031h			;c122
	jr nz,L_C12C		;c124
	ld de,0c189h		;c126
	jp L_C177		;c129
L_C12C:
	cp 032h			;c12c
	jr nz,L_C136		;c12e
	ld de,0e091h		;c130
	jp L_C177		;c133
L_C136:
	cp 037h			;c136
	jr nz,L_C140		;c138
	ld de,0dfd4h		;c13a
	jp L_C177		;c13d
L_C140:
	cp 03bh			;c140
	jr nz,L_C14A		;c142
	ld de,0e002h		;c144
	jp L_C177		;c147
L_C14A:
	cp 03ch			;c14a
	jr nz,L_C154		;c14c
	ld de,0e02ah		;c14e
	jp L_C177		;c151
L_C154:
	cp 043h			;c154
	jr nz,L_C15E		;c156
	ld de,0d6c5h		;c158
	jp L_C177		;c15b
L_C15E:
	cp 045h			;c15e
	jr nz,L_C167		;c160
	ld de,0ce73h		;c162
	jr L_C177		;c165
L_C167:
	cp 046h			;c167
	jr nz,L_C170		;c169
	ld de,0d314h		;c16b
	jr L_C177		;c16e
L_C170:
	cp 05dh			;c170
	jr nz,L_C17D		;c172
	ld de,0da3dh		;c174
L_C177:
	ld (ix+003h),e		;c177
	ld (ix+004h),d		;c17a
L_C17D:
	ld (ix+005h),l		;c17d
	ld (ix+006h),h		;c180
	ret			;c183

; ----------------------------------------------------------------------
; DATOS relleno: o resto (5 B; 5 bytes)
;   0xc184..0xc189  (5 bytes)
; ----------------------------------------------------------------------
	defb 000h,000h,000h,000h,000h	; c184  .....

; ======================================================================
; CODIGO 0xc189..0xc190  (7 bytes)
; ======================================================================


L_C189:
	call L_D1F5		;c189
	call L_D6EA		;c18c
	ret			;c18f

; ----------------------------------------------------------------------
; DATOS datos: sin clasificar (45 B; racha 2.24, entropia 4.47, 29 valores)
;   0xc190..0xc1bd  (45 bytes)
; ----------------------------------------------------------------------
	defb 0ddh,07eh,002h,0ddh,06eh,005h,0ddh,066h,006h,077h,03ch,0ddh,077h,002h,0feh,02ch	; c190  .~..n..f.w<.w..,
	defb 0d8h,0c2h,078h,0c6h,05fh,0cdh,03fh,0c8h,0e6h,001h,083h,0ddh,077h,002h,0c9h,0ddh	; c1a0  ..x._.?.....w...
	defb 02ah,058h,0e1h,0ddh,07eh,000h,0ddh,023h,0ddh,022h,058h,0e1h,0c9h	; c1b0  *X..~..#."X..

; ======================================================================
; CODIGO 0xc1bd..0xc4fc  (831 bytes)
; ======================================================================


L_C1BD:
	ld a,(0dcc3h)		;c1bd
	and a			;c1c0
	ld c,000h		;c1c1
	jr z,L_C1F4		;c1c3
	ld a,(0e151h)		;c1c5
	and a			;c1c8
	jr nz,L_C1F4		;c1c9
	ld a,007h		;c1cb
	out (0a0h),a		;c1cd
	ld a,0ffh		;c1cf
	out (0a1h),a		;c1d1
	ld a,00eh		;c1d3
	out (0a0h),a		;c1d5
	in a,(0a2h)		;c1d7
	rra			;c1d9
	jr c,L_C1DE		;c1da
	set 1,c			;c1dc
L_C1DE:
	rra			;c1de
	jr c,L_C1E3		;c1df
	set 0,c			;c1e1
L_C1E3:
	rra			;c1e3
	jr c,L_C1E8		;c1e4
	set 3,c			;c1e6
L_C1E8:
	rra			;c1e8
	jr c,L_C1ED		;c1e9
	set 2,c			;c1eb
L_C1ED:
	rra			;c1ed
	jr c,L_C1F2		;c1ee
	set 4,c			;c1f0
L_C1F2:
	ld a,c			;c1f2
	ret			;c1f3
L_C1F4:
	ld ix,0dcb1h		;c1f4
	ld b,005h		;c1f8
L_C1FA:
	ld a,(ix+001h)		;c1fa
	out (0aah),a		;c1fd
	in a,(0a9h)		;c1ff
	and (ix+000h)		;c201
	jr nz,L_C207		;c204
	scf			;c206
L_C207:
	rr c			;c207
	inc ix			;c209
	inc ix			;c20b
	djnz L_C1FA		;c20d
	ld a,c			;c20f
	rrca			;c210
	rrca			;c211
	rrca			;c212
	ret			;c213
L_C214:
	ld ix,0c97bh		;c214
	ld a,(0c97ah)		;c218
	and a			;c21b
	ret z			;c21c
	ld b,a			;c21d
L_C21E:
	push bc			;c21e
	ld a,(ix+002h)		;c21f
	inc a			;c222
	jr nz,L_C23F		;c223
	ld a,(ix+003h)		;c225
	ld l,(ix+000h)		;c228
	ld h,(ix+001h)		;c22b
	call L_C47B		;c22e
	inc (ix+003h)		;c231
	ld a,(ix+003h)		;c234
	cp 021h			;c237
	jp nz,L_C311		;c239
	jp L_C31C		;c23c
L_C23F:
	ld a,(ix+004h)		;c23f
	dec (ix+004h)		;c242
	jr nz,L_C251		;c245
	xor a			;c247
	ld de,0eb42h		;c248
	call L_E18F		;c24b
	jp L_C311		;c24e
L_C251:
	cp 010h			;c251
	jp nc,L_C311		;c253
	inc (ix+004h)		;c256
	ld b,(ix+001h)		;c259
	ld c,(ix+000h)		;c25c
	ld de,(0c184h)		;c25f
	call L_C803		;c263
	call L_D144		;c266
	call L_C7D3		;c269
	ld l,(ix+000h)		;c26c
	ld h,(ix+001h)		;c26f
	rrca			;c272
	rrca			;c273
	rrca			;c274
	ld c,a			;c275
	ld a,(ix+003h)		;c276
	inc a			;c279
	cp 006h			;c27a
	ld (ix+003h),a		;c27c
	ld a,(ix+002h)		;c27f
	jr nz,L_C291		;c282
	ld (ix+003h),000h	;c284
	and 01fh		;c288
	or c			;c28a
	call L_C794		;c28b
	ld (ix+002h),a		;c28e
L_C291:
	ld l,(ix+000h)		;c291
	ld h,(ix+001h)		;c294
	and 007h		;c297
	ld bc,00404h		;c299
	call L_C7DC		;c29c
	call L_D15C		;c29f
	ld a,(ix+004h)		;c2a2
	and a			;c2a5
	jp z,L_C2B4		;c2a6
	add a,h			;c2a9
	ld h,a			;c2aa
	dec (ix+004h)		;c2ab
	dec (ix+004h)		;c2ae
	dec (ix+004h)		;c2b1
L_C2B4:
	ld (ix+000h),l		;c2b4
	ld (ix+001h),h		;c2b7
	ld a,h			;c2ba
	cp 0e0h			;c2bb
	jp nc,L_C31C		;c2bd
	ld a,(ix+002h)		;c2c0
	and 01fh		;c2c3
	add a,021h		;c2c5
	call L_C47B		;c2c7
	ld a,(ix+002h)		;c2ca
	bit 3,a			;c2cd
	jr z,L_C2EA		;c2cf
	and 007h		;c2d1
	ex af,af'		;c2d3
	call L_C83F		;c2d4
	and 007h		;c2d7
	jr nz,L_C2EA		;c2d9
	ld a,(ix+000h)		;c2db
	add a,004h		;c2de
	ld c,a			;c2e0
	ld a,(ix+001h)		;c2e1
	add a,004h		;c2e4
	ld b,a			;c2e6
	call L_CC83		;c2e7
L_C2EA:
	call L_CFA1		;c2ea
	ld a,(0c188h)		;c2ed
	cp 004h			;c2f0
	jr nc,L_C311		;c2f2
	ld l,(ix+000h)		;c2f4
	ld h,(ix+001h)		;c2f7
	call L_D0A5		;c2fa
	jr c,L_C311		;c2fd
	ld (ix+002h),0ffh	;c2ff
	ld (ix+003h),01dh	;c303
	xor a			;c307
	ld de,0ea52h		;c308
	call L_E18F		;c30b
	call L_D303		;c30e
L_C311:
	ld de,00005h		;c311
	add ix,de		;c314
L_C316:
	pop bc			;c316
	dec b			;c317
	jp nz,L_C21E		;c318
	ret			;c31b
L_C31C:
	ld hl,0c97ah		;c31c
	dec (hl)		;c31f
	pop bc			;c320
	push bc			;c321
	ld a,b			;c322
	cp 001h			;c323
	jr z,L_C316		;c325
	push ix			;c327
	pop de			;c329
	push de			;c32a
	inc de			;c32b
	inc de			;c32c
	inc de			;c32d
	inc de			;c32e
	inc de			;c32f
	ld hl,0c98fh		;c330
	and a			;c333
	sbc hl,de		;c334
	ld b,h			;c336
	ld c,l			;c337
	ex de,hl		;c338
	pop de			;c339
	ldir			;c33a
	jp L_C316		;c33c
L_C33F:
	ld de,0cb09h		;c33f
	ld c,030h		;c342
L_C344:
	ld a,(de)		;c344
	inc a			;c345
	cp 0a0h			;c346
	jr c,L_C34C		;c348
	sub 0a0h		;c34a
L_C34C:
	ld (de),a		;c34c
	ld h,a			;c34d
	ld l,c			;c34e
	call L_C541		;c34f
	ld (0d3cdh),hl		;c352
	ld b,008h		;c355
L_C357:
	ld a,(hl)		;c357
	and a			;c358
	jr nz,L_C36A		;c359
	ld a,l			;c35b
	add a,018h		;c35c
	ld l,a			;c35e
	jp nc,L_C365		;c35f
	inc h			;c362
	jr z,L_C36A		;c363
L_C365:
	djnz L_C357		;c365
	jp L_C380		;c367
L_C36A:
	ld hl,(0d3cdh)		;c36a
L_C36D:
	ld a,(hl)		;c36d
	and a			;c36e
	jr nz,L_C385		;c36f
	ld a,l			;c371
	sub 018h		;c372
	ld l,a			;c374
	jp nc,L_C37E		;c375
	dec h			;c378
	ld a,h			;c379
	cp 040h			;c37a
	jr c,L_C385		;c37c
L_C37E:
	djnz L_C36D		;c37e
L_C380:
	ld hl,(0d3cdh)		;c380
	ld (hl),018h		;c383
L_C385:
	inc de			;c385
	dec c			;c386
	jr nz,L_C344		;c387
	ret			;c389
L_C38A:
	ld iy,0cb03h		;c38a
	ld (iy+003h),000h	;c38e
	call L_C464		;c392
	ld de,04000h		;c395
L_C398:
	ld a,(iy+002h)		;c398
	cp 020h			;c39b
	jr z,L_C3C3		;c39d
	ld a,(iy+003h)		;c39f
	and a			;c3a2
	jr z,L_C3B0		;c3a3
	cp 005h			;c3a5
	ld a,020h		;c3a7
	jr nz,L_C3C3		;c3a9
	sub (iy+002h)		;c3ab
	jr L_C3C3		;c3ae
L_C3B0:
	ld a,020h		;c3b0
	sub (iy+002h)		;c3b2
	add a,a			;c3b5
	add a,a			;c3b6
	ld (iy+005h),a		;c3b7
	ld a,(iy+002h)		;c3ba
	ld (iy+004h),a		;c3bd
	jp L_C3CA		;c3c0
L_C3C3:
	ld (iy+004h),a		;c3c3
	ld (iy+005h),000h	;c3c6
L_C3CA:
	ld a,006h		;c3ca
L_C3CC:
	ex af,af'		;c3cc
	ld (0d3cdh),de		;c3cd
	ld d,(ix+000h)		;c3d1
	xor a			;c3d4
	ld e,a			;c3d5
	rr d			;c3d6
	rr e			;c3d8
	ld hl,06de0h		;c3da
	add hl,de		;c3dd
	ld b,(iy+004h)		;c3de
	ld e,(iy+005h)		;c3e1
	ld d,a			;c3e4
	add hl,de		;c3e5
	inc ix			;c3e6
	ld de,(0d3cdh)		;c3e8
	ld a,d			;c3ec
	cp 050h			;c3ed
	jr nc,L_C409		;c3ef
	ld c,0ffh		;c3f1
L_C3F3:
	ldi			;c3f3
	ldi			;c3f5
	ldi			;c3f7
	ldi			;c3f9
	dec b			;c3fb
	jr z,L_C409		;c3fc
	ld a,e			;c3fe
	add a,014h		;c3ff
	ld e,a			;c401
	jp nc,L_C3F3		;c402
	inc d			;c405
	jp L_C3F3		;c406
L_C409:
	ex af,af'		;c409
	dec a			;c40a
	jr z,L_C418		;c40b
	ld de,(0d3cdh)		;c40d
	inc de			;c411
	inc de			;c412
	inc de			;c413
	inc de			;c414
	jp L_C3CC		;c415
L_C418:
	inc (iy+003h)		;c418
	ld a,(iy+002h)		;c41b
	cp 020h			;c41e
	ld a,005h		;c420
	adc a,000h		;c422
	cp (iy+003h)		;c424
	jp nz,L_C398		;c427
	ld a,(iy+001h)		;c42a
	and a			;c42d
	ret z			;c42e
	ld a,(iy+002h)		;c42f
	cp 020h			;c432
	jr z,L_C43C		;c434
	add a,002h		;c436
	ld (iy+002h),a		;c438
	ret			;c43b
L_C43C:
	ld a,(iy+000h)		;c43c
	or a			;c43f
	jp z,L_C476		;c440
	ld (iy+002h),002h	;c443
	dec (iy+000h)		;c447
	call L_C464		;c44a
	push ix			;c44d
	pop hl			;c44f
	ld b,006h		;c450
L_C452:
	ld a,(hl)		;c452
	cp 05dh			;c453
	jr z,L_C45D		;c455
	cp 047h			;c457
	jr nc,L_C460		;c459
	cp 030h			;c45b
L_C45D:
	call nc,L_C0DC		;c45d
L_C460:
	inc hl			;c460
	djnz L_C452		;c461
	ret			;c463
L_C464:
	ld ix,05c32h		;c464
	ld l,(iy+000h)		;c468
	ld h,000h		;c46b
	ld d,h			;c46d
	ld e,l			;c46e
	add hl,hl		;c46f
	add hl,de		;c470
	add hl,hl		;c471
	ex de,hl		;c472
	add ix,de		;c473
	ret			;c475
L_C476:
	xor a			;c476
	ld (0cb39h),a		;c477
	ret			;c47a
L_C47B:
	push hl			;c47b
	ld h,000h		;c47c
	ld l,a			;c47e
	add hl,hl		;c47f
	add hl,hl		;c480
	add hl,hl		;c481
	add hl,hl		;c482
	add hl,hl		;c483
	add hl,hl		;c484
	ld de,0a560h		;c485
	add hl,de		;c488
	ex de,hl		;c489
	pop hl			;c48a
	ld a,010h		;c48b
	ld (0d3cdh),a		;c48d
	ld a,h			;c490
	sub 020h		;c491
	ld h,a			;c493
	ld a,l			;c494
	and 007h		;c495
	jr z,L_C49F		;c497
	dec a			;c499
	ld c,a			;c49a
	add a,a			;c49b
	add a,c			;c49c
	add a,007h		;c49d
L_C49F:
	ld (L_C4C3+1),a		;c49f
	ld (L_C4FA+1),a		;c4a2
	srl l			;c4a5
	srl l			;c4a7
	srl l			;c4a9
	call L_C541		;c4ab
L_C4AE:
	ld a,h			;c4ae
	cp 050h			;c4af
	jr c,L_C4B9		;c4b1
	inc de			;c4b3
	inc de			;c4b4
	inc hl			;c4b5
	inc hl			;c4b6
	jr $+110		;c4b7
L_C4B9:
	ld a,0ffh		;c4b9
	push de			;c4bb
	push hl			;c4bc
	ex de,hl		;c4bd
	ld d,(hl)		;c4be
	inc hl			;c4bf
	ld e,(hl)		;c4c0
	scf			;c4c1
	ex de,hl		;c4c2
L_C4C3:
	jr L_C4C3		;c4c3
L_C4C5:
	ld a,h			;c4c5
	ld h,l			;c4c6
	ld l,0ffh		;c4c7
	jp L_C4E1		;c4c9
L_C4CC:
	adc hl,hl		;c4cc
	adc a,a			;c4ce
	adc hl,hl		;c4cf
	adc a,a			;c4d1
	adc hl,hl		;c4d2
	adc a,a			;c4d4
	adc hl,hl		;c4d5
	adc a,a			;c4d7
	adc hl,hl		;c4d8
	adc a,a			;c4da
	adc hl,hl		;c4db
	adc a,a			;c4dd
	adc hl,hl		;c4de
	adc a,a			;c4e0
L_C4E1:
	ex de,hl		;c4e1
	pop hl			;c4e2
	and (hl)		;c4e3
	ld (hl),a		;c4e4
	inc hl			;c4e5
	ld a,d			;c4e6
	and (hl)		;c4e7
	ld (hl),a		;c4e8
	inc hl			;c4e9
	ld a,e			;c4ea
	and (hl)		;c4eb
	ld (hl),a		;c4ec
	pop de			;c4ed
	inc de			;c4ee
	inc de			;c4ef
	dec hl			;c4f0
	dec hl			;c4f1
	xor a			;c4f2
	push de			;c4f3
	push hl			;c4f4
	ex de,hl		;c4f5
	ld d,(hl)		;c4f6
	inc hl			;c4f7
	ld e,(hl)		;c4f8
	ex de,hl		;c4f9
L_C4FA:
	jr L_C4FA		;c4fa

; ----------------------------------------------------------------------
; DATOS tabla: (41 B; racha 1.89, entropia 3.64, 18 valores: pocos valores para ser un dibujo)
;   0xc4fc..0xc525  (41 bytes)
; ----------------------------------------------------------------------
	defb 07ch,065h,02eh,000h,0c3h,018h,0c5h,0edh,06ah,08fh,0edh,06ah,08fh,0edh,06ah,08fh	; c4fc  |e......j..j..j.
	defb 0edh,06ah,08fh,0edh,06ah,08fh,0edh,06ah,08fh,0edh,06ah,08fh,0ebh,0e1h,0b6h,077h	; c50c  .j..j..j..j....w
	defb 023h,07ah,0b6h,077h,023h,07bh,0b6h,077h,0d1h	; c51c  #z.w#{.w.

; ======================================================================
; CODIGO 0xc525..0xc5b5  (144 bytes)
; ======================================================================


L_C525:
	inc de			;c525
	inc de			;c526
	ld bc,00016h		;c527
	add hl,bc		;c52a
	ld a,h			;c52b
	add a,00fh		;c52c
	cp 067h			;c52e
	jr c,L_C533		;c530
	xor a			;c532
L_C533:
	sub 00fh		;c533
	ld h,a			;c535
	ld a,(0d3cdh)		;c536
	dec a			;c539
	ret z			;c53a
	ld (0d3cdh),a		;c53b
	jp L_C4AE		;c53e
L_C541:
	push de			;c541
	ld a,l			;c542
	ld l,h			;c543
L_C544:
	ld h,000h		;c544
	ld d,h			;c546
	ld e,l			;c547
	add hl,hl		;c548
	add hl,de		;c549
	add hl,hl		;c54a
	add hl,hl		;c54b
	add hl,hl		;c54c
	ld e,a			;c54d
	ld d,040h		;c54e
	add hl,de		;c550
	pop de			;c551
	ret			;c552
L_C553:
	push hl			;c553
	ld h,000h		;c554
	ld l,a			;c556
	add hl,hl		;c557
	add hl,hl		;c558
	add hl,hl		;c559
	add hl,hl		;c55a
	ld de,0ca93h		;c55b
	add hl,de		;c55e
	ex de,hl		;c55f
	pop hl			;c560
	ld b,008h		;c561
	ld a,h			;c563
	sub 020h		;c564
	ld h,a			;c566
	ld a,l			;c567
	and 007h		;c568
	jr z,L_C56F		;c56a
	add a,a			;c56c
	add a,004h		;c56d
L_C56F:
	ld (L_C58E+1),a		;c56f
	ld (L_C5B3+1),a		;c572
	srl l			;c575
	srl l			;c577
	srl l			;c579
	call L_C541		;c57b
L_C57E:
	ld a,h			;c57e
	cp 050h			;c57f
	jr c,L_C587		;c581
	inc de			;c583
	inc de			;c584
	jr $+77			;c585
L_C587:
	push hl			;c587
	ld a,(de)		;c588
	ld h,0ffh		;c589
	ld l,a			;c58b
	inc de			;c58c
	scf			;c58d
L_C58E:
	jr L_C58E		;c58e
L_C590:
	ld h,l			;c590
	ld l,0ffh		;c591
	jp L_C5A4		;c593
L_C596:
	adc hl,hl		;c596
	adc hl,hl		;c598
	adc hl,hl		;c59a
	adc hl,hl		;c59c
	adc hl,hl		;c59e
	adc hl,hl		;c5a0
	adc hl,hl		;c5a2
L_C5A4:
	ld a,h			;c5a4
	ld c,l			;c5a5
	pop hl			;c5a6
	and (hl)		;c5a7
	ld (hl),a		;c5a8
	inc hl			;c5a9
	ld a,c			;c5aa
	and (hl)		;c5ab
	ld (hl),a		;c5ac
	push hl			;c5ad
	xor a			;c5ae
	ld h,a			;c5af
	ld a,(de)		;c5b0
	inc de			;c5b1
	ld l,a			;c5b2
L_C5B3:
	jr L_C5B3		;c5b3

; ----------------------------------------------------------------------
; DATOS tabla: (29 B; racha 1.63, entropia 3.36, 15 valores: pocos valores para ser un dibujo)
;   0xc5b5..0xc5d2  (29 bytes)
; ----------------------------------------------------------------------
	defb 065h,02eh,000h,0c3h,0c9h,0c5h,0edh,06ah,0edh,06ah,0edh,06ah,0edh,06ah,0edh,06ah	; c5b5  e......j.j.j.j.j
	defb 0edh,06ah,0edh,06ah,07dh,04ch,0e1h,0b6h,077h,02bh,079h,0b6h,077h	; c5c5  .j.j}L..w+y.w

; ======================================================================
; CODIGO 0xc5d2..0xc8d7  (773 bytes)
; ======================================================================


L_C5D2:
	ld a,l			;c5d2
	add a,018h		;c5d3
	ld l,a			;c5d5
	jr nc,L_C5E0		;c5d6
	inc h			;c5d8
	ld a,h			;c5d9
	cp 058h			;c5da
	jr nz,L_C5E0		;c5dc
	ld h,040h		;c5de
L_C5E0:
	djnz $-98		;c5e0
	ret			;c5e2
L_C5E3:
	ld de,05bb2h		;c5e3
	ld b,040h		;c5e6
	ex de,hl		;c5e8
L_C5E9:
	ld (hl),e		;c5e9
	inc hl			;c5ea
	ld (hl),d		;c5eb
	inc hl			;c5ec
	djnz L_C5E9		;c5ed
	call L_F50E		;c5ef
	ld a,080h		;c5f2
	ld de,0eb00h		;c5f4
	call L_E1BC		;c5f7
	inc a			;c5fa
	ld de,0eb12h		;c5fb
	call L_E1BC		;c5fe
	ld a,002h		;c601
	ld de,0eb21h		;c603
	call L_E1BC		;c606
	jp L_E186		;c609
L_C60C:
	ld hl,05bb2h		;c60c
	ld iy,003e8h		;c60f
	ld ix,05b32h		;c613
	ld b,040h		;c617
L_C619:
	push bc			;c619
	push hl			;c61a
	ld e,(hl)		;c61b
	inc hl			;c61c
	ld d,(hl)		;c61d
	ld a,d			;c61e
	inc a			;c61f
	or e			;c620
	jr z,L_C66D		;c621
	dec d			;c623
	ex de,hl		;c624
	ld e,(ix+000h)		;c625
	ld d,(ix+001h)		;c628
	inc d			;c62b
	ld (ix+001h),d		;c62c
	add hl,de		;c62f
	ld a,h			;c630
	cp 0a0h			;c631
	jr nc,L_C63A		;c633
	ld a,l			;c635
	cp 0c0h			;c636
	jr c,L_C63D		;c638
L_C63A:
	ld hl,0ff00h		;c63a
L_C63D:
	ex de,hl		;c63d
	pop hl			;c63e
	ld (hl),e		;c63f
	inc hl			;c640
	ld (hl),d		;c641
	dec hl			;c642
	push hl			;c643
	ex de,hl		;c644
	ld a,l			;c645
	srl l			;c646
	srl l			;c648
	srl l			;c64a
	and 007h		;c64c
	ld b,a			;c64e
	inc b			;c64f
	call L_C541		;c650
	xor a			;c653
	scf			;c654
L_C655:
	rra			;c655
	djnz L_C655		;c656
	ld b,004h		;c658
L_C65A:
	ld a,(iy+000h)		;c65a
	inc iy			;c65d
	and 03ch		;c65f
	or (hl)			;c661
	ld (hl),a		;c662
	and 018h		;c663
	out (0feh),a		;c665
	ld de,00018h		;c667
	add hl,de		;c66a
	djnz L_C65A		;c66b
L_C66D:
	pop hl			;c66d
	inc hl			;c66e
	inc hl			;c66f
	inc ix			;c670
	inc ix			;c672
	pop bc			;c674
	djnz L_C619		;c675
	ret			;c677
L_C678:
	ld a,(0ca92h)		;c678
	dec a			;c67b
	ld (0ca92h),a		;c67c
	dec b			;c67f
	ret z			;c680
	ld a,b			;c681
	add a,a			;c682
	add a,a			;c683
	add a,a			;c684
	ld c,a			;c685
	ld b,000h		;c686
	push ix			;c688
	pop hl			;c68a
	push hl			;c68b
	ld de,00008h		;c68c
	add hl,de		;c68f
	pop de			;c690
	cpl			;c691
	push de			;c692
	ldir			;c693
	pop hl			;c695
	ld de,00008h		;c696
	sbc hl,de		;c699
	push hl			;c69b
	pop ix			;c69c
	ret			;c69e
L_C69F:
	ld a,h			;c69f
	sub 020h		;c6a0
	ld h,a			;c6a2
	ld a,000h		;c6a3
	adc a,d			;c6a5
	ld d,a			;c6a6
	call L_C541		;c6a7
	ld a,d			;c6aa
	and a			;c6ab
	jr z,L_C6B2		;c6ac
	ld a,h			;c6ae
	add a,018h		;c6af
	ld h,a			;c6b1
L_C6B2:
	exx			;c6b2
	ld a,06fh		;c6b3
	ex af,af'		;c6b5
	ld c,005h		;c6b6
L_C6B8:
	ld b,005h		;c6b8
L_C6BA:
	ld a,(ix+000h)		;c6ba
	inc ix			;c6bd
	and a			;c6bf
	exx			;c6c0
	jp z,L_C705		;c6c1
	cp 003h			;c6c4
	jp nc,L_C754		;c6c6
	dec a			;c6c9
	jp z,L_C724		;c6ca
	push hl			;c6cd
	ld de,000c0h		;c6ce
	add hl,de		;c6d1
	ld a,06fh		;c6d2
	cp h			;c6d4
	jr nc,L_C6D9		;c6d5
	ld h,040h		;c6d7
L_C6D9:
	ld bc,00816h		;c6d9
	ld de,0ca84h		;c6dc
L_C6DF:
	ld a,04fh		;c6df
	cp h			;c6e1
	jr nc,L_C6E8		;c6e2
	inc hl			;c6e4
	inc hl			;c6e5
	jr L_C6EE		;c6e6
L_C6E8:
	ld a,(de)		;c6e8
	ld (hl),a		;c6e9
	inc hl			;c6ea
	ld (hl),a		;c6eb
	inc hl			;c6ec
	ld (hl),a		;c6ed
L_C6EE:
	ld a,l			;c6ee
	add a,c			;c6ef
	ld l,a			;c6f0
	jp nc,L_C701		;c6f1
	inc h			;c6f4
	ld a,050h		;c6f5
	cp h			;c6f7
	jr nc,L_C701		;c6f8
	ld a,06fh		;c6fa
	cp h			;c6fc
	jr nc,L_C701		;c6fd
	ld h,040h		;c6ff
L_C701:
	inc de			;c701
	djnz L_C6DF		;c702
	pop hl			;c704
L_C705:
	inc hl			;c705
	inc hl			;c706
	inc hl			;c707
	exx			;c708
	djnz L_C6BA		;c709
	exx			;c70b
	ld de,00231h		;c70c
	add hl,de		;c70f
	ld a,050h		;c710
	cp h			;c712
	jr nc,L_C71E		;c713
	ld a,06fh		;c715
	cp h			;c717
	jr nc,L_C71E		;c718
	ld a,h			;c71a
	sub 030h		;c71b
	ld h,a			;c71d
L_C71E:
	exx			;c71e
	dec c			;c71f
	jp nz,L_C6B8		;c720
	ret			;c723
L_C724:
	push hl			;c724
	inc hl			;c725
	ld de,00018h		;c726
	ld bc,00c56h		;c729
L_C72C:
	ld a,04fh		;c72c
	cp h			;c72e
	jr c,L_C733		;c72f
	ld (hl),04eh		;c731
L_C733:
	add hl,de		;c733
	ld a,050h		;c734
	cp h			;c736
	jr nc,L_C740		;c737
	ld a,06fh		;c739
	cp h			;c73b
	jr nc,L_C741		;c73c
	ld h,040h		;c73e
L_C740:
	ld (hl),c		;c740
L_C741:
	add hl,de		;c741
	ld a,050h		;c742
	cp h			;c744
	jr nc,L_C74E		;c745
	ld a,06fh		;c747
	cp h			;c749
	jr nc,L_C74E		;c74a
	ld h,040h		;c74c
L_C74E:
	djnz L_C72C		;c74e
	pop hl			;c750
	jp L_C705		;c751
L_C754:
	push hl			;c754
	push hl			;c755
	sub 003h		;c756
	ld h,000h		;c758
	ld l,a			;c75a
	ld d,h			;c75b
	ld e,l			;c75c
	add hl,hl		;c75d
	add hl,de		;c75e
	ld d,h			;c75f
	ld e,l			;c760
	add hl,hl		;c761
	add hl,de		;c762
	add hl,hl		;c763
	add hl,hl		;c764
	add hl,hl		;c765
	ld de,069a8h		;c766
	add hl,de		;c769
	pop de			;c76a
	ld bc,018ffh		;c76b
L_C76E:
	ld a,d			;c76e
	cp 04fh			;c76f
	jr c,L_C77A		;c771
	inc hl			;c773
	inc hl			;c774
	inc hl			;c775
	ld a,018h		;c776
	jr L_C782		;c778
L_C77A:
	ldi			;c77a
	ldi			;c77c
	ldi			;c77e
	ld a,015h		;c780
L_C782:
	add a,e			;c782
	ld e,a			;c783
	jr nc,L_C78E		;c784
	inc d			;c786
	ld a,06fh		;c787
	cp d			;c789
	jr nc,L_C78E		;c78a
	ld d,040h		;c78c
L_C78E:
	djnz L_C76E		;c78e
	pop hl			;c790
	jp L_C705		;c791
L_C794:
	ld b,a			;c794
	and 007h		;c795
	ld e,a			;c797
	ld a,b			;c798
	rlca			;c799
	rlca			;c79a
	rlca			;c79b
	and 007h		;c79c
	sub e			;c79e
	and 007h		;c79f
	jr nz,L_C7A7		;c7a1
	ld a,e			;c7a3
	or 008h			;c7a4
	ret			;c7a6
L_C7A7:
	cp 005h			;c7a7
	jr c,L_C7B6		;c7a9
	ld c,0ffh		;c7ab
	ld a,b			;c7ad
	and 018h		;c7ae
	jr z,L_C7C3		;c7b0
	ld a,b			;c7b2
	sub 008h		;c7b3
	ret			;c7b5
L_C7B6:
	ld c,001h		;c7b6
	ld a,b			;c7b8
	and 018h		;c7b9
	cp 010h			;c7bb
	jr z,L_C7C3		;c7bd
	ld a,b			;c7bf
	add a,008h		;c7c0
	ret			;c7c2
L_C7C3:
	ld a,e			;c7c3
	add a,c			;c7c4
	and 007h		;c7c5
	ld e,a			;c7c7
	ld a,b			;c7c8
	and 0f8h		;c7c9
	or e			;c7cb
	ret			;c7cc
L_C7CD:
	ld de,0c9a4h		;c7cd
	jp L_C7D6		;c7d0
L_C7D3:
	ld de,0c9ach		;c7d3
L_C7D6:
	ld l,a			;c7d6
	ld h,000h		;c7d7
	add hl,de		;c7d9
	ld a,(hl)		;c7da
	ret			;c7db
L_C7DC:
	push hl			;c7dc
	call L_C7CD		;c7dd
	ld de,00000h		;c7e0
	pop hl			;c7e3
	rrca			;c7e4
	jr nc,L_C7E8		;c7e5
	ld d,b			;c7e7
L_C7E8:
	rrca			;c7e8
	jr nc,L_C7F1		;c7e9
	push af			;c7eb
	ld a,b			;c7ec
	neg			;c7ed
	ld d,a			;c7ef
	pop af			;c7f0
L_C7F1:
	rrca			;c7f1
	jr nc,L_C7F5		;c7f2
	ld e,c			;c7f4
L_C7F5:
	rrca			;c7f5
	jr nc,L_C7FC		;c7f6
	ld a,c			;c7f8
	neg			;c7f9
	ld e,a			;c7fb
L_C7FC:
	ld a,h			;c7fc
	add a,d			;c7fd
	ld h,a			;c7fe
	ld a,l			;c7ff
	add a,e			;c800
	ld l,a			;c801
	ret			;c802
L_C803:
	ld a,b			;c803
	sub d			;c804
	jr c,L_C80C		;c805
	ld h,002h		;c807
	jp L_C810		;c809
L_C80C:
	ld h,001h		;c80c
	neg			;c80e
L_C810:
	ld d,a			;c810
	ld a,c			;c811
	sub e			;c812
	jr c,L_C81A		;c813
	ld l,008h		;c815
	jp L_C81E		;c817
L_C81A:
	ld l,004h		;c81a
	neg			;c81c
L_C81E:
	ld e,a			;c81e
	ld b,a			;c81f
	srl b			;c820
	add a,a			;c822
	jr c,L_C82D		;c823
	add a,b			;c825
	jr c,L_C82D		;c826
	cp d			;c828
	ld c,000h		;c829
	jr c,L_C82E		;c82b
L_C82D:
	ld c,l			;c82d
L_C82E:
	ld a,d			;c82e
	ld b,a			;c82f
	srl b			;c830
	add a,a			;c832
	jr c,L_C83B		;c833
	add a,b			;c835
	jr c,L_C83B		;c836
	cp e			;c838
	ld a,c			;c839
	ret c			;c83a
L_C83B:
	ld a,c			;c83b
	or h			;c83c
	ld c,a			;c83d
	ret			;c83e
L_C83F:
	push hl			;c83f
	ld hl,(0ca8fh)		;c840
	ld a,h			;c843
	and 01fh		;c844
	or 020h			;c846
	ld h,a			;c848
	ld a,000h		;c849
	xor (hl)		;c84b
	inc hl			;c84c
	xor (hl)		;c84d
	inc hl			;c84e
	xor (hl)		;c84f
	inc hl			;c850
	add a,h			;c851
	sub l			;c852
	ld (0ca8fh),hl		;c853
	pop hl			;c856
	ret			;c857
L_C858:
	di			;c858
	ld hl,00000h		;c859
	add hl,sp		;c85c
	ld sp,04f00h		;c85d
	ld b,050h		;c860
	ld de,00000h		;c862
L_C865:
	push de			;c865
	push de			;c866
	push de			;c867
	push de			;c868
	push de			;c869
	push de			;c86a
	push de			;c86b
	push de			;c86c
	push de			;c86d
	push de			;c86e
	push de			;c86f
	push de			;c870
	push de			;c871
	push de			;c872
	push de			;c873
	push de			;c874
	push de			;c875
	push de			;c876
	push de			;c877
	push de			;c878
	push de			;c879
	push de			;c87a
	push de			;c87b
	push de			;c87c
	djnz L_C865		;c87d
	ld sp,hl		;c87f
	ei			;c880
	ret			;c881
L_C882:
	ld hl,0c97ah		;c882
	ld a,(hl)		;c885
	cp 004h			;c886
	ret nc			;c888
	inc (hl)		;c889
	ld h,000h		;c88a
	ld l,a			;c88c
	ld d,h			;c88d
	ld e,l			;c88e
	add hl,hl		;c88f
	add hl,hl		;c890
	add hl,de		;c891
	ld de,0c97bh		;c892
	add hl,de		;c895
	ld (hl),c		;c896
	inc hl			;c897
	ld (hl),b		;c898
	inc hl			;c899
	ld (hl),014h		;c89a
	inc hl			;c89c
	ld (hl),000h		;c89d
	inc hl			;c89f
	ex af,af'		;c8a0
	ld (hl),a		;c8a1
	and a			;c8a2
	scf			;c8a3
	ret nz			;c8a4
	ld de,0eb42h		;c8a5
	call L_E18F		;c8a8
	scf			;c8ab
	ret			;c8ac
L_C8AD:
	ld hl,0c998h		;c8ad
	ld a,(hl)		;c8b0
	cp 002h			;c8b1
	ret nc			;c8b3
	inc (hl)		;c8b4
	ld h,000h		;c8b5
	ld l,a			;c8b7
	ld d,h			;c8b8
	ld e,l			;c8b9
	add hl,hl		;c8ba
	add hl,hl		;c8bb
	add hl,de		;c8bc
	ld de,0c999h		;c8bd
	add hl,de		;c8c0
	ld (hl),000h		;c8c1
	inc hl			;c8c3
	ex af,af'		;c8c4
	ld (hl),a		;c8c5
	inc hl			;c8c6
	ld (hl),c		;c8c7
	inc hl			;c8c8
	ld (hl),b		;c8c9
	inc hl			;c8ca
	ld (hl),000h		;c8cb
	ld a,001h		;c8cd
	ld de,0ea81h		;c8cf
	call L_E18F		;c8d2
	scf			;c8d5
	ret			;c8d6

; ----------------------------------------------------------------------
; DATOS tabla: (392 B; racha 12.30, entropia 2.16, 12 valores: pocos valores para ser un dibujo)
;   0xc8d7..0xca5f  (392 bytes)
; ----------------------------------------------------------------------
	defb 000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c8d7  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c8e7  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c8f7  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c907  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c917  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c927  ................
	defb 0ffh,0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c937  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,0ffh	; c947  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c957  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c967  ................
	defb 000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c977  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c987  ................
	defb 0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,002h,006h,004h	; c997  ................
	defb 005h,001h,009h,008h,00ah,0ffh,004h,000h,0ffh,002h,003h,001h,002h,006h,005h,007h	; c9a7  ................
	defb 006h,0ffh,004h,000h,0ffh,000h,000h,00ah,000h,000h,000h,000h,001h,000h,000h,003h	; c9b7  ................
	defb 002h,005h,002h,006h,000h,000h,001h,000h,000h,000h,000h,006h,000h,000h,006h,002h	; c9c7  ................
	defb 005h,002h,006h,000h,000h,001h,000h,000h,000h,000h,004h,000h,000h,000h,000h,001h	; c9d7  ................
	defb 000h,000h,000h,000h,006h,000h,000h,000h,005h,002h,002h,00ah,000h,001h,000h,000h	; c9e7  ................
	defb 001h,000h,001h,000h,000h,001h,000h,006h,002h,002h,006h,000h,000h,000h,000h,000h	; c9f7  ................
	defb 004h,000h,000h,000h,005h,001h,000h,000h,000h,001h,00ah,000h,000h,000h,00ah,001h	; ca07  ................
	defb 000h,000h,000h,001h,006h,002h,006h,002h,006h,000h,000h,00ah,000h,000h,000h,000h	; ca17  ................
	defb 001h,000h,000h,003h,000h,005h,000h,00ah,001h,000h,001h,000h,001h,006h,002h,006h	; ca27  ................
	defb 002h,006h,006h,002h,00ah,002h,006h,000h,000h,001h,000h,000h,000h,000h,005h,000h	; ca37  ................
	defb 000h,000h,000h,001h,000h,000h,006h,002h,006h,002h,006h,00ah,000h,00ah,000h,00ah	; ca47  ................
	defb 001h,000h,001h,000h,001h,005h,002h,006h	; ca57  ........

; ======================================================================
; CODIGO 0xca5f..0xca96  (55 bytes)
; ======================================================================


L_CA5F:
	ld (bc),a		;ca5f
	inc b			;ca60
	ld bc,00000h		;ca61
	nop			;ca64
	ld bc,00006h		;ca65
	nop			;ca68
	nop			;ca69
	ld b,00ah		;ca6a
	ld (bc),a		;ca6c
	ld b,002h		;ca6d
	ld a,(bc)		;ca6f
	ld bc,00000h		;ca70
	nop			;ca73
	ld bc,0000ah		;ca74
	dec b			;ca77
	nop			;ca78
	ld a,(bc)		;ca79
	ld bc,00100h		;ca7a
	nop			;ca7d
	ld bc,00206h		;ca7e
	inc bc			;ca81
	ld (bc),a		;ca82
	ld b,000h		;ca83
	rst 38h			;ca85
	nop			;ca86
	ld d,l			;ca87
	xor d			;ca88
	rst 38h			;ca89
	rst 38h			;ca8a
	nop			;ca8b
	nop			;ca8c
	nop			;ca8d
	nop			;ca8e
	nop			;ca8f
	nop			;ca90
	inc bc			;ca91
	nop			;ca92
	jp L_813C		;ca93

; ----------------------------------------------------------------------
; DATOS tabla: (228 B; racha 14.03, entropia 1.41, 17 valores: pocos valores para ser un dibujo)
;   0xca96..0xcb7a  (228 bytes)
; ----------------------------------------------------------------------
	defb 042h,000h,089h,000h,095h,000h,0afh,000h,09dh,081h,04ah,0c3h,03ch,0ffh,000h,0e7h	; ca96  B.........J.<...
	defb 000h,0c3h,018h,081h,024h,081h,02ch,0c3h,018h,0e7h,000h,0ffh,000h,0ffh,000h,0c3h	; caa6  ....$.,.........
	defb 000h,081h,018h,081h,03ch,081h,03ch,081h,018h,0c3h,000h,0ffh,000h,0ffh,0ffh,0ffh	; cab6  ....<.<.........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; cac6  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; cad6  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; cae6  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,00eh,000h,020h	; caf6  ............... 
	defb 000h,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; cb06  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; cb16  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; cb26  ................
	defb 0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; cb36  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; cb46  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; cb56  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; cb66  ................
	defb 0ffh,0ffh,0ffh,0ffh	; cb76  ....

; ======================================================================
; CODIGO 0xcb7a..0xce73  (761 bytes)
; ======================================================================


L_CB7A:
	ld a,(0ca92h)		;cb7a
	and a			;cb7d
	ret z			;cb7e
	ld ix,0cb3ah		;cb7f
	ld b,a			;cb83
L_CB84:
	push bc			;cb84
	inc (ix+000h)		;cb85
	ld a,(ix+000h)		;cb88
	cp 060h			;cb8b
	jr z,L_CB9A		;cb8d
	ld hl,lcb9dh		;cb8f
	push hl			;cb92
	ld l,(ix+003h)		;cb93
	ld h,(ix+004h)		;cb96
	jp (hl)			;cb99
L_CB9A:
	call L_C678		;cb9a
L_CB9D:
	ld de,00008h		;cb9d
	add ix,de		;cba0
	pop bc			;cba2
	djnz L_CB84		;cba3
	ret			;cba5
L_CBA6:
	ld (0d3cdh),hl		;cba6
	call L_C83F		;cba9
	and 001h		;cbac
	jr z,L_CBDC		;cbae
	ld a,h			;cbb0
	cp d			;cbb1
	ld a,b			;cbb2
	jr nc,L_CBBD		;cbb3
	add a,005h		;cbb5
	cp 00ah			;cbb7
	adc a,000h		;cbb9
	jr L_CBC3		;cbbb
L_CBBD:
	add a,005h		;cbbd
	cp 001h			;cbbf
	adc a,0ffh		;cbc1
L_CBC3:
	sub 005h		;cbc3
	ld b,a			;cbc5
	ld a,l			;cbc6
	cp e			;cbc7
	ld a,c			;cbc8
	jr nc,L_CBD3		;cbc9
	add a,005h		;cbcb
	cp 00ah			;cbcd
	adc a,000h		;cbcf
	jr L_CBD9		;cbd1
L_CBD3:
	add a,005h		;cbd3
	cp 001h			;cbd5
	adc a,0ffh		;cbd7
L_CBD9:
	sub 005h		;cbd9
	ld c,a			;cbdb
L_CBDC:
	add hl,bc		;cbdc
	ld a,l			;cbdd
	cp 0b8h			;cbde
	jr c,L_CBEA		;cbe0
	ld a,(0d3cdh)		;cbe2
	ld l,a			;cbe5
	ld a,c			;cbe6
	neg			;cbe7
	ld c,a			;cbe9
L_CBEA:
	ret			;cbea
L_CBEB:
	ld ix,L_CC32		;cbeb
	ld (ix+001h),006h	;cbef
	ld (ix+002h),006h	;cbf3
	ld ix,0c93ah		;cbf7
	ld hl,0c952h		;cbfb
	ld a,005h		;cbfe
	call L_CC18		;cc00
	ld ix,L_CC32		;cc03
	ld (ix+001h),009h	;cc07
	ld (ix+002h),009h	;cc0b
	ld ix,0c953h		;cc0f
	ld hl,0c977h		;cc13
	ld a,004h		;cc16
L_CC18:
	ld (0c977h),hl		;cc18
	ld (0c979h),a		;cc1b
	ld a,(ix-001h)		;cc1e
	and a			;cc21
	ret z			;cc22
	ld b,a			;cc23
L_CC24:
	push bc			;cc24
	ld l,(ix+000h)		;cc25
	ld h,(ix+001h)		;cc28
	ld a,(ix+002h)		;cc2b
	cp 080h			;cc2e
	jr z,L_CC56		;cc30
L_CC32:
	ld bc,00707h		;cc32
	call L_C7DC		;cc35
	ld a,h			;cc38
	cp 0c0h			;cc39
	jr nc,L_CC56		;cc3b
	ld a,l			;cc3d
	cp 0bch			;cc3e
	jr nc,L_CC56		;cc40
	ld (ix+000h),l		;cc42
	ld (ix+001h),h		;cc45
	ld a,002h		;cc48
	call L_C553		;cc4a
	ld de,00004h		;cc4d
	add ix,de		;cc50
L_CC52:
	pop bc			;cc52
	djnz L_CC24		;cc53
	ret			;cc55
L_CC56:
	ld a,(0c979h)		;cc56
	cp 005h			;cc59
	ld hl,0c939h		;cc5b
	jr z,L_CC63		;cc5e
	ld hl,0c952h		;cc60
L_CC63:
	dec (hl)		;cc63
	pop bc			;cc64
	push bc			;cc65
	ld a,b			;cc66
	cp 001h			;cc67
L_CC69:
	jp z,L_CC52		;cc69
	push ix			;cc6c
	pop de			;cc6e
	push de			;cc6f
	inc de			;cc70
	inc de			;cc71
	inc de			;cc72
	inc de			;cc73
	ld hl,(0c977h)		;cc74
	and a			;cc77
	sbc hl,de		;cc78
	ld b,h			;cc7a
	ld c,l			;cc7b
	ex de,hl		;cc7c
	pop de			;cc7d
	ldir			;cc7e
	jp L_CC52		;cc80
L_CC83:
	ld hl,0c939h		;cc83
	ld a,(0e157h)		;cc86
	ld e,a			;cc89
	ld a,007h		;cc8a
	sub e			;cc8c
	add a,a			;cc8d
	add a,a			;cc8e
	add a,a			;cc8f
	add a,a			;cc90
	ld e,a			;cc91
	call L_C83F		;cc92
	cp e			;cc95
	ccf			;cc96
	ret nc			;cc97
	ld e,006h		;cc98
	exx			;cc9a
	ld h,001h		;cc9b
	ld de,0ea44h		;cc9d
	jp L_CCAE		;cca0
L_CCA3:
	ld hl,0c952h		;cca3
	ld e,009h		;cca6
	exx			;cca8
	ld h,002h		;cca9
	ld de,0ea38h		;ccab
L_CCAE:
	exx			;ccae
	ld a,(hl)		;ccaf
	cp e			;ccb0
	ret nc			;ccb1
	exx			;ccb2
	push af			;ccb3
	ld a,h			;ccb4
	call L_E18F		;ccb5
	pop af			;ccb8
	exx			;ccb9
	inc (hl)		;ccba
	ld e,l			;ccbb
	ld d,h			;ccbc
	inc de			;ccbd
	ld h,000h		;ccbe
	ld l,a			;ccc0
	add hl,hl		;ccc1
	add hl,hl		;ccc2
	add hl,de		;ccc3
	ld (hl),c		;ccc4
	inc hl			;ccc5
	ld (hl),b		;ccc6
	inc hl			;ccc7
	ex af,af'		;ccc8
	ld (hl),a		;ccc9
	scf			;ccca
	ret			;cccb
L_CCCC:
	ld (0d3cdh),hl		;cccc
	ld a,(0ca8eh)		;cccf
	and 003h		;ccd2
	jr z,L_CCE5		;ccd4
	cp 002h			;ccd6
	jr nz,L_CCE1		;ccd8
	call L_C83F		;ccda
	and 001h		;ccdd
	jr z,L_CCE5		;ccdf
L_CCE1:
	add hl,bc		;cce1
	jp L_CD12		;cce2
L_CCE5:
	ld a,h			;cce5
	cp d			;cce6
	ld a,b			;cce7
	jr nc,L_CCF2		;cce8
	add a,004h		;ccea
	cp 008h			;ccec
	adc a,000h		;ccee
	jr L_CCF8		;ccf0
L_CCF2:
	add a,004h		;ccf2
	cp 001h			;ccf4
	adc a,0ffh		;ccf6
L_CCF8:
	sub 004h		;ccf8
	ld b,a			;ccfa
	ld a,l			;ccfb
	cp e			;ccfc
	ld a,c			;ccfd
	jr nc,L_CD08		;ccfe
	add a,004h		;cd00
	cp 008h			;cd02
	adc a,000h		;cd04
	jr L_CD0E		;cd06
L_CD08:
	add a,004h		;cd08
	cp 001h			;cd0a
	adc a,0ffh		;cd0c
L_CD0E:
	sub 004h		;cd0e
	ld c,a			;cd10
	add hl,bc		;cd11
L_CD12:
	ld a,l			;cd12
	cp 0b0h			;cd13
	jr c,L_CD1F		;cd15
	ld a,c			;cd17
	neg			;cd18
	ld c,a			;cd1a
	ld hl,(0d3cdh)		;cd1b
	add hl,bc		;cd1e
L_CD1F:
	ret			;cd1f
L_CD20:
	ld hl,0c98fh		;cd20
	ld a,(hl)		;cd23
	cp 002h			;cd24
	ret nc			;cd26
	inc (hl)		;cd27
	ld h,000h		;cd28
	ld l,a			;cd2a
	add hl,hl		;cd2b
	add hl,hl		;cd2c
	ld de,0c990h		;cd2d
	add hl,de		;cd30
	ld (hl),000h		;cd31
	inc hl			;cd33
	ex af,af'		;cd34
	ld d,a			;cd35
	add a,004h		;cd36
	ld e,a			;cd38
	call L_C83F		;cd39
	and 0c0h		;cd3c
	or e			;cd3e
	sub 004h		;cd3f
	ld (hl),a		;cd41
	inc hl			;cd42
	ld (hl),c		;cd43
	inc hl			;cd44
	ld (hl),b		;cd45
	ld a,d			;cd46
	and a			;cd47
	scf			;cd48
	ret nz			;cd49
	ld de,0eb42h		;cd4a
	call L_E18F		;cd4d
	scf			;cd50
	ret			;cd51
L_CD52:
	push hl			;cd52
	push af			;cd53
	call L_C47B		;cd54
	ld bc,00010h		;cd57
	pop af			;cd5a
	inc a			;cd5b
	pop hl			;cd5c
	push hl			;cd5d
	add hl,bc		;cd5e
	push af			;cd5f
	call L_C47B		;cd60
	ld bc,01000h		;cd63
	pop af			;cd66
	inc a			;cd67
	pop hl			;cd68
L_CD69:
	push hl			;cd69
	add hl,bc		;cd6a
	push af			;cd6b
	call L_C47B		;cd6c
	ld bc,01010h		;cd6f
	pop af			;cd72
	inc a			;cd73
	pop hl			;cd74
	add hl,bc		;cd75
	call L_C47B		;cd76
	ret			;cd79
L_CD7A:
	add hl,bc		;cd7a
	ld a,l			;cd7b
	cp h			;cd7c
	jr nc,L_CD82		;cd7d
	add a,e			;cd7f
	cp h			;cd80
	ret			;cd81
L_CD82:
	ld a,h			;cd82
	add a,d			;cd83
	cp l			;cd84
	ret			;cd85
L_CD86:
	ld ix,0c990h		;cd86
	ld a,(0c98fh)		;cd8a
	and a			;cd8d
	ret z			;cd8e
	ld b,a			;cd8f
L_CD90:
	push bc			;cd90
	ld c,(ix+000h)		;cd91
	ld b,(ix+001h)		;cd94
	ld l,(ix+002h)		;cd97
	ld h,(ix+003h)		;cd9a
	ld a,c			;cd9d
	cp 080h			;cd9e
	jr nz,L_CDB6		;cda0
	ld a,(ix+001h)		;cda2
	call L_C47B		;cda5
	inc (ix+001h)		;cda8
	ld a,(ix+001h)		;cdab
	cp 021h			;cdae
	jp c,L_CE46		;cdb0
	jp L_CE51		;cdb3
L_CDB6:
	ld de,(0c184h)		;cdb6
	ld a,b			;cdba
	add a,004h		;cdbb
	and 03fh		;cdbd
	cp 014h			;cdbf
	jr c,L_CDD2		;cdc1
	jr nz,L_CDCC		;cdc3
	xor a			;cdc5
L_CDC6:
	ld de,0eb42h		;cdc6
	call L_E18F		;cdc9
L_CDCC:
	dec (ix+001h)		;cdcc
	jp L_CE46		;cdcf
L_CDD2:
	cp 008h			;cdd2
	jr c,L_CDD8		;cdd4
	sub 002h		;cdd6
L_CDD8:
	sub 004h		;cdd8
	ld b,a			;cdda
	call L_CCCC		;cddb
	ld a,h			;cdde
	cp 0e0h			;cddf
	jr nc,L_CE51		;cde1
	ld (ix+000h),c		;cde3
	ld a,b			;cde6
	add a,004h		;cde7
	ld c,a			;cde9
	ld a,(ix+001h)		;cdea
	add a,004h		;cded
	and 0c0h		;cdef
	or c			;cdf1
	sub 004h		;cdf2
	ld (ix+001h),a		;cdf4
	ld (ix+002h),l		;cdf7
	ld (ix+003h),h		;cdfa
	call L_C83F		;cdfd
	and 01fh		;ce00
	jr nz,L_CE18		;ce02
	push hl			;ce04
	ld bc,00404h		;ce05
	add hl,bc		;ce08
	ld b,h			;ce09
	ld c,l			;ce0a
	push bc			;ce0b
	call L_C803		;ce0c
	call L_C7D3		;ce0f
	ex af,af'		;ce12
	pop bc			;ce13
	call L_CC83		;ce14
	pop hl			;ce17
L_CE18:
	ld a,(ix+001h)		;ce18
	add a,004h		;ce1b
	and 0c0h		;ce1d
	rlca			;ce1f
	rlca			;ce20
	add a,04fh		;ce21
	call L_C47B		;ce23
	call L_D037		;ce26
	ld a,(0c188h)		;ce29
	cp 004h			;ce2c
	jr nc,L_CE46		;ce2e
	ld l,(ix+002h)		;ce30
	ld h,(ix+003h)		;ce33
	call L_D0A5		;ce36
	jr c,L_CE46		;ce39
	ld (ix+000h),080h	;ce3b
	ld (ix+001h),01dh	;ce3f
	call L_D303		;ce43
L_CE46:
	ld de,00004h		;ce46
	add ix,de		;ce49
L_CE4B:
	pop bc			;ce4b
	dec b			;ce4c
	jp nz,L_CD90		;ce4d
	ret			;ce50
L_CE51:
	ld hl,0c98fh		;ce51
	dec (hl)		;ce54
	pop bc			;ce55
	push bc			;ce56
	ld a,b			;ce57
	cp 001h			;ce58
	jr z,L_CE4B		;ce5a
	push ix			;ce5c
	pop de			;ce5e
	push de			;ce5f
	inc de			;ce60
	inc de			;ce61
	inc de			;ce62
	inc de			;ce63
	ld hl,0c998h		;ce64
	and a			;ce67
	sbc hl,de		;ce68
	ld b,h			;ce6a
	ld c,l			;ce6b
	ex de,hl		;ce6c
	pop de			;ce6d
	ldir			;ce6e
	jp L_CE4B		;ce70

; ----------------------------------------------------------------------
; DATOS datos: sin clasificar (73 B; racha 2.46, entropia 5.25, 45 valores)
;   0xce73..0xcebc  (73 bytes)
; ----------------------------------------------------------------------
	defb 0cdh,0f5h,0d1h,0ddh,07eh,000h,0feh,02dh,0d8h,03ah,0c5h,0d3h,0a7h,0c0h,03ah,091h	; ce73  ....~..-.:....:.
	defb 0cah,0feh,080h,0c0h,0fdh,021h,0c7h,0d3h,0ddh,07eh,000h,087h,0c6h,008h,067h,0ddh	; ce83  .....!...~....g.
	defb 07eh,001h,06fh,087h,0c6h,010h,032h,0c5h,0d3h,0fdh,075h,000h,0fdh,074h,001h,0fdh	; ce93  ~.o...2...u..t..
	defb 036h,002h,0f9h,0fdh,075h,003h,0fdh,074h,004h,0fdh,036h,005h,0f2h,03eh,010h,032h	; cea3  6...u..t..6..>.2
	defb 0c6h,0d3h,0afh,011h,055h,0edh,0c3h,08fh,0e1h	; ceb3  ....U....

; ======================================================================
; CODIGO 0xcebc..0xd314  (1112 bytes)
; ======================================================================


L_CEBC:
	ld a,(0d3c5h)		;cebc
	cp 00ah			;cebf
	ret c			;cec1
	ld iy,0d3c7h		;cec2
	ld l,(iy+000h)		;cec6
	ld h,(iy+001h)		;cec9
	ld bc,01901h		;cecc
	ld d,0fch		;cecf
	ld e,(iy+002h)		;ced1
	call L_CF14		;ced4
	ld (iy+000h),l		;ced7
	ld (iy+001h),h		;ceda
	ld (iy+002h),e		;cedd
	ld l,(iy+003h)		;cee0
	ld h,(iy+004h)		;cee3
	ld bc,01b02h		;cee6
	ld d,0fdh		;cee9
	ld e,(iy+005h)		;ceeb
	call L_CF14		;ceee
	ld (iy+003h),l		;cef1
	ld (iy+004h),h		;cef4
	ld (iy+005h),e		;cef7
	ld hl,0d3c6h		;cefa
	dec (hl)		;cefd
	ret nz			;cefe
	ld a,001h		;ceff
	ld (0d3c5h),a		;cf01
	xor a			;cf04
	ld (0d3c9h),a		;cf05
	ld a,003h		;cf08
	ld (0d3cah),a		;cf0a
	xor a			;cf0d
	ld de,0ea98h		;cf0e
	jp L_E18F		;cf11
L_CF14:
	push de			;cf14
	push hl			;cf15
	push bc			;cf16
	ld a,b			;cf17
	call L_C47B		;cf18
	pop bc			;cf1b
	pop hl			;cf1c
	push hl			;cf1d
	push bc			;cf1e
	ld a,(0d3c5h)		;cf1f
	sub l			;cf22
	ld l,a			;cf23
	ld a,b			;cf24
	inc a			;cf25
	call L_C47B		;cf26
	pop bc			;cf29
	pop hl			;cf2a
	pop de			;cf2b
	ld a,h			;cf2c
	add a,d			;cf2d
	ld h,a			;cf2e
	ld a,l			;cf2f
	add a,e			;cf30
	ld l,a			;cf31
	ld a,e			;cf32
	add a,c			;cf33
	ld e,a			;cf34
	ret			;cf35
L_CF36:
	ld a,(0d3c5h)		;cf36
	cp 005h			;cf39
	jr nc,L_CF85		;cf3b
	cp 001h			;cf3d
	ret nz			;cf3f
	ld hl,(0d3c7h)		;cf40
	ld bc,00808h		;cf43
	add hl,bc		;cf46
	ld b,h			;cf47
	ld c,l			;cf48
	ld de,(0c184h)		;cf49
	call L_C803		;cf4d
	call L_C7D3		;cf50
	ld hl,(0d3c7h)		;cf53
	ld bc,00202h		;cf56
	call L_C7DC		;cf59
	ld a,l			;cf5c
	cp 0a0h			;cf5d
	jr c,L_CF65		;cf5f
	ld a,(0d3c7h)		;cf61
	ld l,a			;cf64
L_CF65:
	ld (0d3c7h),hl		;cf65
	call L_C83F		;cf68
	and 03fh		;cf6b
	jr nz,L_CF7D		;cf6d
	ld bc,00c0ch		;cf6f
	add hl,bc		;cf72
	ld b,h			;cf73
	ld c,l			;cf74
	xor a			;cf75
	ex af,af'		;cf76
	call L_C8AD		;cf77
	ld hl,(0d3c7h)		;cf7a
L_CF7D:
	ld a,019h		;cf7d
	call L_CD52		;cf7f
	jp L_D25E		;cf82
L_CF85:
	cp 00ah			;cf85
	ret nc			;cf87
	inc a			;cf88
	cp 00ah			;cf89
	jr z,L_CF9C		;cf8b
	ld (0d3c5h),a		;cf8d
	sub 006h		;cf90
	add a,a			;cf92
	add a,a			;cf93
	add a,03bh		;cf94
	ld hl,(0d3c7h)		;cf96
	jp L_CD52		;cf99
L_CF9C:
	xor a			;cf9c
	ld (0d3c5h),a		;cf9d
	ret			;cfa0
L_CFA1:
	ld l,(ix+000h)		;cfa1
	ld h,(ix+001h)		;cfa4
	ld iy,0c953h		;cfa7
	ld de,0040ch		;cfab
	ld bc,00202h		;cfae
	call L_CFD1		;cfb1
	ret c			;cfb4
	xor a			;cfb5
	ld de,0ea52h		;cfb6
	call L_E18F		;cfb9
	ld (ix+002h),0ffh	;cfbc
	ld (ix+003h),01dh	;cfc0
	ld (iy+002h),080h	;cfc4
	ld hl,0dd84h		;cfc8
	ld b,00dh		;cfcb
	call L_F394		;cfcd
	ret			;cfd0
L_CFD1:
	exx			;cfd1
	ld a,(iy-001h)		;cfd2
	and a			;cfd5
	scf			;cfd6
	ret z			;cfd7
	ld b,a			;cfd8
L_CFD9:
	exx			;cfd9
	push hl			;cfda
	ld h,(iy+000h)		;cfdb
	call L_CD7A		;cfde
	pop hl			;cfe1
	jr c,L_CFEE		;cfe2
	push hl			;cfe4
	ld l,h			;cfe5
	ld h,(iy+001h)		;cfe6
	call L_CD7A		;cfe9
	pop hl			;cfec
	ret nc			;cfed
L_CFEE:
	exx			;cfee
	ld de,00004h		;cfef
	add iy,de		;cff2
	djnz L_CFD9		;cff4
	exx			;cff6
	scf			;cff7
	ret			;cff8
L_CFF9:
	ld a,(ix+000h)		;cff9
	add a,a			;cffc
	add a,a			;cffd
	add a,a			;cffe
	ld l,a			;cfff
	ld h,(ix+007h)		;d000
	ld de,00414h		;d003
	ld bc,00202h		;d006
	ld iy,0c953h		;d009
	call L_CFD1		;d00d
	ret c			;d010
	ld (iy+002h),080h	;d011
	xor a			;d015
	ld de,0ea52h		;d016
	call L_E18F		;d019
	ld hl,0d933h		;d01c
	ld (ix+003h),l		;d01f
	ld (ix+004h),h		;d022
	ld l,(ix+005h)		;d025
	ld h,(ix+006h)		;d028
	ld (hl),00ch		;d02b
	pop hl			;d02d
	ld hl,0dd84h		;d02e
	ld b,010h		;d031
	call L_F394		;d033
	ret			;d036
L_D037:
	ld l,(ix+002h)		;d037
	ld h,(ix+003h)		;d03a
	ld iy,0c953h		;d03d
	ld de,0040ch		;d041
	ld bc,00202h		;d044
	call L_CFD1		;d047
	ret c			;d04a
	xor a			;d04b
	ld de,0ea52h		;d04c
	call L_E18F		;d04f
	ld (ix+000h),080h	;d052
	ld (ix+001h),01dh	;d056
	ld (iy+002h),080h	;d05a
	ld hl,0dd84h		;d05e
	ld b,00eh		;d061
	call L_F394		;d063
	ret			;d066
L_D067:
	ld hl,(0c184h)		;d067
	ld iy,0c93ah		;d06a
	ld de,0040ah		;d06e
	ld bc,00203h		;d071
	call L_CFD1		;d074
	ret c			;d077
	ld (iy+002h),080h	;d078
	call L_D2B6		;d07c
	ret			;d07f
L_D080:
	ld l,(ix+002h)		;d080
	ld h,(ix+003h)		;d083
	ld iy,0c953h		;d086
	ld de,00408h		;d08a
	ld bc,00200h		;d08d
	call L_CFD1		;d090
	ret c			;d093
	ld (ix+000h),07ch	;d094
	ld (iy+002h),080h	;d098
	ld hl,0dd85h		;d09c
	ld b,035h		;d09f
	call L_F394		;d0a1
	ret			;d0a4
L_D0A5:
	push hl			;d0a5
	ld a,(0c185h)		;d0a6
	ld l,a			;d0a9
	ld bc,00203h		;d0aa
	ld de,00c0ah		;d0ad
	call L_CD7A		;d0b0
	pop hl			;d0b3
	ret c			;d0b4
	ld h,l			;d0b5
	ld a,(0c184h)		;d0b6
	ld l,a			;d0b9
	jp L_CD7A		;d0ba
L_D0BD:
	ld a,(0c188h)		;d0bd
	cp 004h			;d0c0
	ccf			;d0c2
	ret c			;d0c3
	push hl			;d0c4
	ld a,(0c185h)		;d0c5
	ld l,a			;d0c8
	ld bc,00503h		;d0c9
	ld de,0160ah		;d0cc
	call L_CD7A		;d0cf
	pop hl			;d0d2
	ret c			;d0d3
	ld h,l			;d0d4
	ld a,(0c184h)		;d0d5
	ld l,a			;d0d8
	jp L_CD7A		;d0d9
L_D0DC:
	jp L_D0DF		;d0dc
L_D0DF:
	ld a,(0c188h)		;d0df
	cp 004h			;d0e2
	ret nc			;d0e4
	ld hl,(0c184h)		;d0e5
	ld a,h			;d0e8
	sub 038h		;d0e9
	cp 020h			;d0eb
	jr nc,L_D0F1		;d0ed
	ld a,020h		;d0ef
L_D0F1:
	ld h,a			;d0f1
	ld a,(0d3c2h)		;d0f2
	xor 001h		;d0f5
	ld e,a			;d0f7
	push hl			;d0f8
	ld hl,02f78h		;d0f9
	call z,L_F3A3		;d0fc
	call nz,L_F3A7		;d0ff
	pop hl			;d102
	ld a,e			;d103
	add a,039h		;d104
	jp L_C47B		;d106
L_D109:
	ld hl,(0c184h)		;d109
	ex af,af'		;d10c
	ld a,l			;d10d
	and a			;d10e
	jr nz,L_D115		;d10f
	ex af,af'		;d111
	and 0f7h		;d112
	ex af,af'		;d114
L_D115:
	cp 0b0h			;d115
	jr nz,L_D11D		;d117
	ex af,af'		;d119
	and 0fbh		;d11a
	ex af,af'		;d11c
L_D11D:
	ld a,h			;d11d
	cp 038h			;d11e
	jr nz,L_D126		;d120
	ex af,af'		;d122
	and 0fdh		;d123
	ex af,af'		;d125
L_D126:
	cp 0b0h			;d126
	jr nz,L_D12E		;d128
	ex af,af'		;d12a
	and 0feh		;d12b
	ret			;d12d
L_D12E:
	ex af,af'		;d12e
	ret			;d12f
L_D130:
	ld a,l			;d130
	cp 0b1h			;d131
	jr c,L_D139		;d133
	ld a,(0c184h)		;d135
	ld l,a			;d138
L_D139:
	ld a,h			;d139
	sub 038h		;d13a
	cp 079h			;d13c
	ret c			;d13e
	ld a,(0c185h)		;d13f
	ld h,a			;d142
	ret			;d143
L_D144:
	ex af,af'		;d144
	ld a,(ix+000h)		;d145
	add a,010h		;d148
	cp 013h			;d14a
	jr nc,L_D152		;d14c
	ex af,af'		;d14e
	and 0f7h		;d14f
	ret			;d151
L_D152:
	cp 0beh			;d152
L_D154:
	jr c,L_D15A		;d154
	ex af,af'		;d156
	and 0fbh		;d157
	ret			;d159
L_D15A:
	ex af,af'		;d15a
	ret			;d15b
L_D15C:
	ld a,l			;d15c
	cp 0b1h			;d15d
	ret c			;d15f
	ld l,(ix+000h)		;d160
	ret			;d163
L_D164:
	ld iy,0d3bdh		;d164
	ld a,(iy+004h)		;d168
	and a			;d16b
	ret z			;d16c
	ld a,(iy+005h)		;d16d
	or (iy+000h)		;d170
	ret nz			;d173
	dec (iy+004h)		;d174
	call L_F2D1		;d177
	ld (iy+000h),003h	;d17a
	ld hl,(0c184h)		;d17e
	ld a,h			;d181
	sub 018h		;d182
	ld (iy+002h),a		;d184
	sub 008h		;d187
	cp 034h			;d189
	jr c,L_D18F		;d18b
	ld a,034h		;d18d
L_D18F:
	rrca			;d18f
	and 07fh		;d190
	ld (iy+003h),a		;d192
	ld a,l			;d195
	rrca			;d196
	rrca			;d197
	rrca			;d198
	ld e,a			;d199
	and 01fh		;d19a
	ld (iy+001h),a		;d19c
	cp e			;d19f
	ld hl,003c0h		;d1a0
	jr z,L_D1A8		;d1a3
	ld hl,0003ch		;d1a5
L_D1A8:
	ld (iy+006h),h		;d1a8
	ld (iy+007h),l		;d1ab
	ret			;d1ae
L_D1AF:
	ld iy,0d3bdh		;d1af
	ld a,(iy+000h)		;d1b3
	and a			;d1b6
	ret z			;d1b7
	ld l,(iy+001h)		;d1b8
	ld h,(iy+002h)		;d1bb
	call L_C541		;d1be
	ld de,00019h		;d1c1
	ld a,(iy+000h)		;d1c4
	dec (iy+000h)		;d1c7
	cp 002h			;d1ca
	push af			;d1cc
	jr nc,L_D1DB		;d1cd
	dec de			;d1cf
	ld b,(iy+003h)		;d1d0
L_D1D3:
	and a			;d1d3
	sbc hl,de		;d1d4
	djnz L_D1D3		;d1d6
	inc de			;d1d8
	jr L_D1DE		;d1d9
L_D1DB:
	call L_D1E2		;d1db
L_D1DE:
	pop af			;d1de
	cp 003h			;d1df
	ret nc			;d1e1
L_D1E2:
	ld b,(iy+003h)		;d1e2
L_D1E5:
	ld a,(iy+006h)		;d1e5
	or (hl)			;d1e8
	ld (hl),a		;d1e9
	inc hl			;d1ea
	ld a,(iy+007h)		;d1eb
	or (hl)			;d1ee
	ld (hl),a		;d1ef
	sbc hl,de		;d1f0
	djnz L_D1E5		;d1f2
	ret			;d1f4
L_D1F5:
	bit 2,(ix+007h)		;d1f5
	jr z,L_D21F		;d1f9
	ld a,(0d3bdh)		;d1fb
	dec a			;d1fe
	jr nz,L_D21F		;d1ff
	ld hl,0c190h		;d201
	ld (ix+003h),l		;d204
	ld (ix+004h),h		;d207
	ld (ix+002h),028h	;d20a
	xor a			;d20e
	ld de,0ea52h		;d20f
	call L_E18F		;d212
	pop hl			;d215
	ld hl,0dd83h		;d216
	ld b,002h		;d219
	call L_F394		;d21b
	ret			;d21e
L_D21F:
	ld a,(0c188h)		;d21f
	sla (ix+007h)		;d222
	cp 004h			;d226
	ret nc			;d228
	ld l,(ix+001h)		;d229
	ld h,(ix+000h)		;d22c
	sla h			;d22f
	call L_D23E		;d231
	ret c			;d234
	set 0,(ix+007h)		;d235
	xor a			;d239
	ld (0d3c2h),a		;d23a
	ret			;d23d
L_D23E:
	push hl			;d23e
	ld a,(0c185h)		;d23f
	sub 038h		;d242
	cp 020h			;d244
	jr nc,L_D24A		;d246
	ld a,020h		;d248
L_D24A:
	ld l,a			;d24a
	ld bc,00405h		;d24b
	ld de,01806h		;d24e
	call L_CD7A		;d251
	pop hl			;d254
	ret c			;d255
	ld h,l			;d256
	ld a,(0c184h)		;d257
	ld l,a			;d25a
	jp L_CD7A		;d25b
L_D25E:
	ld hl,(0d3c7h)		;d25e
	call L_D0BD		;d261
	jr c,L_D275		;d264
	ld a,005h		;d266
	ld (0d3c5h),a		;d268
	xor a			;d26b
	ld de,0ea52h		;d26c
	call L_E18F		;d26f
	jp L_D303		;d272
L_D275:
	ld a,(0d3c9h)		;d275
	bit 2,a			;d278
	jr z,L_D2A0		;d27a
	ld a,(0d3bdh)		;d27c
	dec a			;d27f
	jr nz,L_D2A0		;d280
	ld a,(0d3cah)		;d282
	dec a			;d285
	ld (0d3cah),a		;d286
	jr nz,L_D2A0		;d289
	ld a,005h		;d28b
	ld (0d3c5h),a		;d28d
	xor a			;d290
	ld de,0ea52h		;d291
	call L_E18F		;d294
	ld hl,0dd84h		;d297
	ld b,00fh		;d29a
	call L_F394		;d29c
	ret			;d29f
L_D2A0:
	ld hl,(0d3c7h)		;d2a0
	call L_D23E		;d2a3
	push af			;d2a6
	ld a,(0d3c9h)		;d2a7
	ccf			;d2aa
	rla			;d2ab
	ld (0d3c9h),a		;d2ac
	pop af			;d2af
	ret c			;d2b0
	xor a			;d2b1
	ld (0d3c2h),a		;d2b2
	ret			;d2b5
L_D2B6:
	ld a,(0c188h)		;d2b6
	and a			;d2b9
	jr z,L_D303		;d2ba
	dec a			;d2bc
	ld (0c188h),a		;d2bd
	jr L_D2CF		;d2c0
L_D2C2:
	ld a,(0c188h)		;d2c2
	and a			;d2c5
	jr z,L_D303		;d2c6
	dec a			;d2c8
	jr z,L_D303		;d2c9
	dec a			;d2cb
	ld (0c188h),a		;d2cc
L_D2CF:
	ld hl,06f50h		;d2cf
	xor 003h		;d2d2
	call L_D2E4		;d2d4
	dec a			;d2d7
	ret z			;d2d8
	ld hl,06f48h		;d2d9
	call L_D2E4		;d2dc
	dec a			;d2df
	ret z			;d2e0
	ld hl,06f40h		;d2e1
L_D2E4:
	ld e,002h		;d2e4
L_D2E6:
	di			;d2e6
	ld c,099h		;d2e7
	out (c),l		;d2e9
	and a			;d2eb
	and a			;d2ec
	out (c),h		;d2ed
	dec c			;d2ef
	ld b,011h		;d2f0
	ld d,008h		;d2f2
L_D2F4:
	out (c),b		;d2f4
	and a			;d2f6
	dec d			;d2f7
	jr nz,L_D2F4		;d2f8
	ei			;d2fa
	ld bc,00040h		;d2fb
	add hl,bc		;d2fe
	dec e			;d2ff
	jr nz,L_D2E6		;d300
	ret			;d302
L_D303:
	ld hl,02778h		;d303
	call L_F3A3		;d306
	ld hl,02f48h		;d309
	ld a,004h		;d30c
	ld (0c188h),a		;d30e
	jp L_F3A3		;d311

; ----------------------------------------------------------------------
; DATOS datos: sin clasificar (187 B; racha 2.55, entropia 5.95, 86 valores)
;   0xd314..0xd3cf  (187 bytes)
; ----------------------------------------------------------------------
	defb 0cdh,0f5h,0d1h,0ddh,07eh,002h,0feh,046h,020h,002h,03eh,0ffh,0feh,008h,028h,004h	; d314  ....~..F .>...(.
	defb 03ch,0ddh,077h,002h,087h,087h,087h,05fh,0ddh,07eh,001h,093h,06fh,0ddh,066h,000h	; d324  <.w...._.~..o.f.
	defb 0cbh,024h,0e5h,0cbh,03dh,0cbh,03dh,0cbh,03dh,0cdh,041h,0c5h,0ddh,07eh,002h,087h	; d334  .$..=.=.=.A..~..
	defb 0c6h,004h,047h,0cdh,083h,0d3h,03eh,001h,011h,0a1h,0eah,0cdh,08fh,0e1h,0e1h,03ah	; d344  ..G...>........:
	defb 088h	; d354  .

; ======================================================================
; CODIGO 0xd355..0xd383  (46 bytes)
; ======================================================================


L_D355:
	pop bc			;d355
	cp 004h			;d356
	ret nc			;d358
	ld a,h			;d359
	add a,020h		;d35a
	ld h,a			;d35c
	push hl			;d35d
	ld a,(0c185h)		;d35e
	ld l,a			;d361
	ld de,0060ch		;d362
	ld bc,00102h		;d365
	call L_CD7A		;d368
	pop hl			;d36b
	ret c			;d36c
	ld a,(ix+002h)		;d36d
	add a,a			;d370
	add a,a			;d371
	add a,a			;d372
	add a,a			;d373
	add a,01eh		;d374
	ld d,a			;d376
	ld h,l			;d377
	ld a,(0c184h)		;d378
	ld l,a			;d37b
	call L_CD7A		;d37c
	ret c			;d37f
	jp L_D303		;d380

; ----------------------------------------------------------------------
; DATOS datos: sin clasificar (187 B; racha 2.55, entropia 5.95, 86 valores)
;   0xd314..0xd3cf  (187 bytes)
; ----------------------------------------------------------------------
	defb 0c5h,0cdh,03fh,0c8h,0e6h,001h,011h,0adh,0d3h,028h,003h,011h,0b5h,0d3h,006h,008h	; d383  ..?......(......
	defb 0e5h,01ah,00fh,02fh,0a6h,077h,01ah,0b6h,077h,07dh,0c6h,018h,06fh,07ch,0ceh,000h	; d393  .../.w..w}..o|..
	defb 067h,013h,010h,0edh,0e1h,023h,0c1h,010h,0d7h,0c9h,044h,055h,07bh,0dfh,0f6h,0aah	; d3a3  g....#....DU{...
	defb 029h,008h,008h,029h,0adh,0fbh,0afh,0dah,052h,042h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; d3b3  )..)....RB......
	defb 0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h	; d3c3  ............

; ======================================================================
; CODIGO 0xd3cf..0xd6c5  (758 bytes)
; ======================================================================


L_D3CF:
	ld a,(0dd81h)		;d3cf
	push af			;d3d2
L_D3D3:
	push hl			;d3d3
L_D3D4:
	ld a,(hl)		;d3d4
	inc a			;d3d5
	cp 03ah			;d3d6
	jr c,L_D3E1		;d3d8
	sub 00ah		;d3da
	ld (hl),a		;d3dc
	dec hl			;d3dd
	jp L_D3D4		;d3de
L_D3E1:
	ld (hl),a		;d3e1
	pop hl			;d3e2
	djnz L_D3D3		;d3e3
	call L_F41D		;d3e5
	pop de			;d3e8
	ld a,(0dd81h)		;d3e9
	cp d			;d3ec
	ret z			;d3ed
	ld a,080h		;d3ee
	ld de,0eaaah		;d3f0
	call L_E1BC		;d3f3
	inc a			;d3f6
	ld de,0eac9h		;d3f7
	call L_E1BC		;d3fa
	inc a			;d3fd
	ld de,0eae5h		;d3fe
	call L_E1BC		;d401
	call L_E186		;d404
	ld a,(0c188h)		;d407
	cp 002h			;d40a
	jp c,L_D45E		;d40c
	ld hl,0e156h		;d40f
	ld a,(hl)		;d412
	cp 009h			;d413
	ret nc			;d415
	inc (hl)		;d416
	jp L_C038		;d417
L_D41A:
	call L_C83F		;d41a
	and 01fh		;d41d
	ret nz			;d41f
	ld a,(0dac5h)		;d420
	and a			;d423
	ret nz			;d424
	ld a,(0c97ah)		;d425
	ld e,a			;d428
	ld a,(0c98fh)		;d429
	add a,e			;d42c
	ld e,a			;d42d
	ld a,(0e157h)		;d42e
	ld b,a			;d431
	ld a,007h		;d432
	sub b			;d434
	rrca			;d435
	add a,e			;d436
	jr z,L_D445		;d437
	ld b,a			;d439
	xor a			;d43a
L_D43B:
	scf			;d43b
	rla			;d43c
	djnz L_D43B		;d43d
	ld e,a			;d43f
	call L_C83F		;d440
	and e			;d443
	ret nz			;d444
L_D445:
	call L_C83F		;d445
	cp 0b0h			;d448
	jr nc,L_D445		;d44a
	ld c,a			;d44c
	ld b,000h		;d44d
	and 002h		;d44f
	jr z,L_D459		;d451
	xor a			;d453
	ex af,af'		;d454
	call L_CD20		;d455
	ret c			;d458
L_D459:
	xor a			;d459
	ex af,af'		;d45a
	jp L_C882		;d45b
L_D45E:
	ld a,003h		;d45e
	ld (0c188h),a		;d460
	ld hl,02778h		;d463
	ld c,0f9h		;d466
	call L_D480		;d468
	ld hl,02f40h		;d46b
	ld c,0f5h		;d46e
	call L_D480		;d470
	ld hl,02f48h		;d473
	ld c,0f5h		;d476
	call L_D480		;d478
	ld hl,02f50h		;d47b
	ld c,0f1h		;d47e
L_D480:
	call L_EE24		;d480
	ld a,c			;d483
	ld c,002h		;d484
L_D486:
	ld b,008h		;d486
L_D488:
	out (098h),a		;d488
	and a			;d48a
	dec b			;d48b
	jr nz,L_D488		;d48c
	ei			;d48e
	ld de,00040h		;d48f
	add hl,de		;d492
	call L_EE24		;d493
	dec c			;d496
	jr nz,L_D486		;d497
	ei			;d499
	ret			;d49a
L_D49B:
	ld e,a			;d49b
	ld a,h			;d49c
	cp 04fh			;d49d
	ld a,e			;d49f
	ret nc			;d4a0
	cp 020h			;d4a1
	push hl			;d4a3
	ld h,000h		;d4a4
	ld l,a			;d4a6
	add hl,hl		;d4a7
	add hl,hl		;d4a8
	add hl,hl		;d4a9
	ld de,05f00h		;d4aa
	add hl,de		;d4ad
	ex de,hl		;d4ae
	pop hl			;d4af
	push hl			;d4b0
	push de			;d4b1
	ld bc,00018h		;d4b2
	ld a,008h		;d4b5
L_D4B7:
	ex af,af'		;d4b7
	ld a,(de)		;d4b8
	rlca			;d4b9
	cpl			;d4ba
	and (hl)		;d4bb
	ld (hl),a		;d4bc
	add hl,bc		;d4bd
	ld a,(de)		;d4be
	rlca			;d4bf
	cpl			;d4c0
	and (hl)		;d4c1
	ld (hl),a		;d4c2
	add hl,bc		;d4c3
	inc de			;d4c4
	ex af,af'		;d4c5
	dec a			;d4c6
	jp nz,L_D4B7		;d4c7
	pop de			;d4ca
	pop hl			;d4cb
	push hl			;d4cc
	add hl,bc		;d4cd
	ld a,008h		;d4ce
L_D4D0:
	ex af,af'		;d4d0
	ld a,(de)		;d4d1
	and 055h		;d4d2
	or (hl)			;d4d4
	ld (hl),a		;d4d5
	add hl,bc		;d4d6
	ld a,(de)		;d4d7
	and 0aah		;d4d8
	or (hl)			;d4da
	ld (hl),a		;d4db
	add hl,bc		;d4dc
	inc de			;d4dd
	ex af,af'		;d4de
	dec a			;d4df
	jp nz,L_D4D0		;d4e0
	pop hl			;d4e3
	ret			;d4e4
L_D4E5:
	ld a,(ix+000h)		;d4e5
	inc ix			;d4e8
	and a			;d4ea
	ret z			;d4eb
	call L_D49B		;d4ec
	inc hl			;d4ef
	jp L_D4E5		;d4f0
L_D4F3:
	ld ix,0dcc6h		;d4f3
	ld hl,040c8h		;d4f7
	call L_D4E5		;d4fa
	ld hl,043c2h		;d4fd
	call L_D4E5		;d500
	ld hl,046c2h		;d503
	call L_D4E5		;d506
	ld hl,049c2h		;d509
	call L_D4E5		;d50c
	ld hl,04ccah		;d50f
	call L_D4E5		;d512
	ld a,(0dcc3h)		;d515
	and a			;d518
	jr z,L_D525		;d519
	ld ix,0dcf7h		;d51b
	ld hl,043c2h		;d51f
	jp L_D4E5		;d522
L_D525:
	ld ix,0dd00h		;d525
	ld hl,046c2h		;d529
	jp L_D4E5		;d52c
L_D52F:
	ld hl,(0dcc4h)		;d52f
	ld de,00018h		;d532
	and a			;d535
	sbc hl,de		;d536
	ld a,h			;d538
	cp 040h			;d539
	jp c,L_D591		;d53b
	ld (0dcc4h),hl		;d53e
	ld ix,0dcc6h		;d541
	call L_D4E5		;d545
	ld de,00235h		;d548
	add hl,de		;d54b
	ld ix,0dd08h		;d54c
	ld de,00172h		;d550
	ld b,008h		;d553
L_D555:
	push bc			;d555
	push de			;d556
L_D557:
	call L_D4E5		;d557
	pop de			;d55a
	add hl,de		;d55b
	pop bc			;d55c
L_D55D:
	djnz L_D555		;d55d
	ret			;d55f
L_D560:
	ld hl,04f08h		;d560
	ld (0dcc4h),hl		;d563
L_D566:
	call L_C858		;d566
	call L_C33F		;d569
	call L_D52F		;d56c
	call L_F3DC		;d56f
	call L_F660		;d572
	jp nz,L_BDE5		;d575
	jp L_D566		;d578
L_D57B:
	xor a			;d57b
	ld (0ee1ah),a		;d57c
L_D57F:
	call L_F660		;d57f
	ret nz			;d582
	ld bc,003e8h		;d583
	call L_D81A		;d586
	ld hl,(0eda3h)		;d589
	ld a,h			;d58c
	or l			;d58d
	jr nz,L_D57F		;d58e
	ret			;d590
L_D591:
	pop hl			;d591
	nop			;d592
	nop			;d593
	nop			;d594
	call L_E16F		;d595
	call L_D57B		;d598
	ld hl,0a710h		;d59b
	ld (0ca8fh),hl		;d59e
	ld hl,0c1afh		;d5a1
	ld (0c090h),hl		;d5a4
	jp L_BE7F		;d5a7
L_D5AA:
	ld a,(0e157h)		;d5aa
	dec a			;d5ad
	jr z,L_D5BE		;d5ae
	dec a			;d5b0
	jr z,L_D5C6		;d5b1
	dec a			;d5b3
	jr z,L_D5CE		;d5b4
	call L_C83F		;d5b6
	and 007h		;d5b9
	jp L_D5D7		;d5bb
L_D5BE:
	call L_C83F		;d5be
	and 001h		;d5c1
	jp L_D5D7		;d5c3
L_D5C6:
	call L_C83F		;d5c6
	and 003h		;d5c9
	jp L_D5D7		;d5cb
L_D5CE:
	call L_C83F		;d5ce
	and 007h		;d5d1
	cp 006h			;d5d3
	jr nc,L_D5CE		;d5d5
L_D5D7:
	push af			;d5d7
	add a,096h		;d5d8
	call L_F5F4		;d5da
	pop af			;d5dd
	ld h,000h		;d5de
	ld l,a			;d5e0
	ld d,h			;d5e1
	ld e,l			;d5e2
	add hl,hl		;d5e3
	add hl,hl		;d5e4
	add hl,hl		;d5e5
	ld b,h			;d5e6
	ld c,l			;d5e7
	add hl,hl		;d5e8
	add hl,bc		;d5e9
	add hl,de		;d5ea
	ld de,0c9bch		;d5eb
	add hl,de		;d5ee
	ex de,hl		;d5ef
	ld a,0a8h		;d5f0
	ld (0ca8dh),a		;d5f2
	ld a,003h		;d5f5
	ld (0ca91h),a		;d5f7
	ld h,000h		;d5fa
	call L_C83F		;d5fc
	and 007h		;d5ff
	or 080h			;d601
	ld (0ca8ch),a		;d603
	ld c,a			;d606
	xor a			;d607
	ld (0c8d7h),a		;d608
	ld iy,0c8d8h		;d60b
	ld ix,0c920h		;d60f
	ld b,005h		;d613
L_D615:
	push bc			;d615
	ld b,005h		;d616
	ld l,c			;d618
L_D619:
	push bc			;d619
	ld a,(de)		;d61a
	cp 006h			;d61b
	jr nz,L_D626		;d61d
	call L_C83F		;d61f
	and 004h		;d622
	add a,006h		;d624
L_D626:
	ld (ix+000h),a		;d626
	cp 003h			;d629
	jr c,L_D665		;d62b
	ld (iy+002h),a		;d62d
	ld (iy+001h),h		;d630
	ld (iy+000h),l		;d633
	cp 006h			;d636
	jr nz,L_D640		;d638
	ld bc,0d8a3h		;d63a
	jp L_D64A		;d63d
L_D640:
	cp 00ah			;d640
	ld bc,0d8f4h		;d642
	jr nz,L_D64A		;d645
	ld bc,0d8f8h		;d647
L_D64A:
	ld (iy+003h),c		;d64a
	ld (iy+004h),b		;d64d
	push ix			;d650
	pop bc			;d652
	ld (iy+005h),c		;d653
	ld (iy+006h),b		;d656
	ld bc,00008h		;d659
	add iy,bc		;d65c
	ld a,(0c8d7h)		;d65e
	inc a			;d661
	ld (0c8d7h),a		;d662
L_D665:
	inc l			;d665
	inc l			;d666
	inc l			;d667
	inc ix			;d668
	inc de			;d66a
	pop bc			;d66b
	djnz L_D619		;d66c
	ld a,018h		;d66e
	add a,h			;d670
	ld h,a			;d671
	pop bc			;d672
	djnz L_D615		;d673
	xor a			;d675
	ld de,0ea73h		;d676
	jp L_E18F		;d679
L_D67C:
	ld a,(0c8d7h)		;d67c
	and a			;d67f
	ret z			;d680
	ld b,a			;d681
	ld ix,0c8d8h		;d682
L_D686:
	push bc			;d686
	ld a,(0ca8dh)		;d687
	add a,(ix+001h)		;d68a
	ld (ix+007h),a		;d68d
	ld a,(0ca8ch)		;d690
	jr nc,L_D697		;d693
	xor 080h		;d695
L_D697:
	and 080h		;d697
	res 7,(ix+000h)		;d699
	or (ix+000h)		;d69d
	ld (ix+000h),a		;d6a0
	bit 7,a			;d6a3
	jr nz,L_D6BC		;d6a5
	ld a,(ix+007h)		;d6a7
	cp 0c0h			;d6aa
	jr nc,L_D6B9		;d6ac
	ld hl,L_D6BC		;d6ae
	push hl			;d6b1
	ld h,(ix+004h)		;d6b2
	ld l,(ix+003h)		;d6b5
	jp (hl)			;d6b8
L_D6B9:
	call L_D950		;d6b9
L_D6BC:
	ld de,00008h		;d6bc
	add ix,de		;d6bf
	pop bc			;d6c1
	djnz L_D686		;d6c2
	ret			;d6c4

; ----------------------------------------------------------------------
; DATOS tabla: (37 B; racha 2.49, entropia 4.15, 23 valores: pocos valores para ser un dibujo)
;   0xd6c5..0xd6ea  (37 bytes)
; ----------------------------------------------------------------------
	defb 0cdh,0eah,0d6h,0ddh,07eh,000h,03dh,020h,008h,0cdh,03fh,0c8h,0e6h,007h,0ddh,077h	; d6c5  ....~.= ..?....w
	defb 007h,0ddh,07eh,007h,0ddh,034h,007h,0e6h,007h,0c0h,0ddh,06eh,005h,0ddh,066h,006h	; d6d5  ..~..4.....n..f.
	defb 03eh,007h,0aeh,077h,0c9h	; d6e5  >..w.

; ======================================================================
; CODIGO 0xd6ea..0xd9db  (753 bytes)
; ======================================================================


L_D6EA:
	ld h,(ix+000h)		;d6ea
	ld l,(ix+001h)		;d6ed
	sla h			;d6f0
	call L_D0BD		;d6f2
	ret c			;d6f5
	jp L_D303		;d6f6
L_D6F9:
	ld hl,0dd10h		;d6f9
	ld c,008h		;d6fc
L_D6FE:
	ld de,0dd80h		;d6fe
	push hl			;d701
	ld b,006h		;d702
L_D704:
	ld a,(de)		;d704
	cp (hl)			;d705
	jr c,L_D737		;d706
	jr z,L_D733		;d708
	ld hl,0dd71h		;d70a
	dec c			;d70d
	jr z,L_D726		;d70e
	ld h,000h		;d710
	ld l,c			;d712
	ld d,h			;d713
	ld e,l			;d714
	add hl,hl		;d715
	add hl,hl		;d716
	add hl,hl		;d717
	add hl,hl		;d718
	sbc hl,de		;d719
	ld b,h			;d71b
	ld c,l			;d71c
	ld hl,0dd70h		;d71d
	ld de,0dd7fh		;d720
	lddr			;d723
	inc hl			;d725
L_D726:
	pop de			;d726
	push hl			;d727
	ld hl,0dd80h		;d728
	ld bc,00006h		;d72b
	ldir			;d72e
	jp L_F671		;d730
L_D733:
	inc hl			;d733
	inc de			;d734
	djnz L_D704		;d735
L_D737:
	pop hl			;d737
	ld de,0000fh		;d738
	add hl,de		;d73b
	dec c			;d73c
	jr nz,L_D6FE		;d73d
	ret			;d73f
L_D740:
	xor a			;d740
	ld (0ddf7h),a		;d741
	ld a,(0e157h)		;d744
	add a,032h		;d747
	ld (0ddfeh),a		;d749
	ld a,030h		;d74c
	ld (0ddffh),a		;d74e
	ld a,(0e157h)		;d751
	inc a			;d754
	ld (0e157h),a		;d755
	call L_C038		;d758
L_D75B:
	ld a,(0ca8eh)		;d75b
	inc a			;d75e
	ld (0ca8eh),a		;d75f
	call L_C858		;d762
	ld bc,005dch		;d765
	call L_D81A		;d768
	call L_D0DC		;d76b
	ld a,001h		;d76e
	ld (0d3c2h),a		;d770
	call L_C33F		;d773
	call L_CF36		;d776
	call L_CBEB		;d779
	call L_DF0F		;d77c
	call L_C214		;d77f
	call L_D1AF		;d782
	call L_CD86		;d785
	call L_C006		;d788
	ld a,(0c188h)		;d78b
	cp 02dh			;d78e
	call c,L_C063		;d790
	ld a,(0ca91h)		;d793
	cp 080h			;d796
	call nz,L_D83A	;d798
	call L_D7A4		;d79b
	call L_F3DC		;d79e
	jp L_D75B		;d7a1
L_D7A4:
	call L_DA55		;d7a4
	jp nz,L_D817		;d7a7
	ld a,(0ddf7h)		;d7aa
	inc a			;d7ad
	ld (0ddf7h),a		;d7ae
	cp 014h			;d7b1
	jr c,L_D817		;d7b3
	cp 028h			;d7b5
	jr c,L_D7F9		;d7b7
	jr nz,L_D803		;d7b9
	dec a			;d7bb
	ld (0ddf7h),a		;d7bc
	ld hl,0dd83h		;d7bf
	ld b,001h		;d7c2
	call L_F394		;d7c4
	ld a,(0ddffh)		;d7c7
	dec a			;d7ca
	ld (0ddffh),a		;d7cb
	cp 030h			;d7ce
	ld a,(0ddfeh)		;d7d0
	jr nc,L_D7E1		;d7d3
	ld a,039h		;d7d5
	ld (0ddffh),a		;d7d7
	ld a,(0ddfeh)		;d7da
	dec a			;d7dd
	ld (0ddfeh),a		;d7de
L_D7E1:
	cp 030h			;d7e1
	jr nz,L_D7F1		;d7e3
	ld a,(0ddffh)		;d7e5
	cp 030h			;d7e8
	jr nz,L_D7F1		;d7ea
	ld a,028h		;d7ec
	ld (0ddf7h),a		;d7ee
L_D7F1:
	ld a,000h		;d7f1
	ld de,0eb2ch		;d7f3
	call L_E1BC		;d7f6
L_D7F9:
	ld ix,0ddf8h		;d7f9
	ld hl,040c7h		;d7fd
	jp L_D4E5		;d800
L_D803:
	cp 03ch			;d803
	jr c,L_D7F9		;d805
	cp 050h			;d807
	jr c,L_D817		;d809
	pop hl			;d80b
	ld a,(0e157h)		;d80c
	cp 008h			;d80f
	jp z,L_F71C		;d811
	jp L_BEED		;d814
L_D817:
	ld bc,003e8h		;d817
L_D81A:
	dec bc			;d81a
	ld a,b			;d81b
	or c			;d81c
	jr nz,L_D81A		;d81d
	ret			;d81f
L_D820:
	ld a,(0ca91h)		;d820
	cp 080h			;d823
	jr nz,L_D83A		;d825
	ld a,(0d3c5h)		;d827
	and a			;d82a
	ret nz			;d82b
	ld a,(0dac5h)		;d82c
	and a			;d82f
	ret nz			;d830
	call L_C83F		;d831
	and 07fh		;d834
	ret nz			;d836
	jp L_D5AA		;d837
L_D83A:
	call L_D67C		;d83a
	ld hl,(0ca8ch)		;d83d
	ld a,(0ca8eh)		;d840
	and 007h		;d843
	ld a,(0ca91h)		;d845
	jp nz,L_D86F		;d848
	ld a,l			;d84b
	and 080h		;d84c
	ld a,(0ca91h)		;d84e
	jr nz,L_D862		;d851
	ld a,(0c185h)		;d853
	sub 034h		;d856
	jr c,L_D85B		;d858
	cp h			;d85a
L_D85B:
	ld a,(0ca91h)		;d85b
	jr c,L_D86A		;d85e
	jr z,L_D872		;d860
L_D862:
	cp 003h			;d862
	jr z,L_D872		;d864
	inc a			;d866
	jp L_D86F		;d867
L_D86A:
	cp 001h			;d86a
	jr z,L_D872		;d86c
	dec a			;d86e
L_D86F:
	ld (0ca91h),a		;d86f
L_D872:
	add a,h			;d872
	ld h,a			;d873
	ld a,l			;d874
	jp nc,L_D87B		;d875
	xor 080h		;d878
	ld l,a			;d87a
L_D87B:
	ld (0ca8ch),hl		;d87b
	ex af,af'		;d87e
	ld a,h			;d87f
	cp 0c0h			;d880
	jr c,L_D894		;d882
	bit 7,l			;d884
	jr nz,L_D894		;d886
	ld a,080h		;d888
	ld (0ca91h),a		;d88a
	push hl			;d88d
	ld a,073h		;d88e
	call L_F5F4		;d890
	pop hl			;d893
L_D894:
	ex af,af'		;d894
	rla			;d895
	sbc a,a			;d896
	ld d,a			;d897
	ld a,l			;d898
	and 07fh		;d899
	ld l,a			;d89b
	ld ix,0c920h		;d89c
	jp L_C69F		;d8a0
L_D8A3:
	call L_CFF9		;d8a3
	call L_C83F		;d8a6
	and 01fh		;d8a9
	ret nz			;d8ab
	ld a,(ix+000h)		;d8ac
	add a,a			;d8af
	add a,a			;d8b0
	add a,a			;d8b1
	ld l,a			;d8b2
	ld h,(ix+007h)		;d8b3
	ld bc,01808h		;d8b6
	add hl,bc		;d8b9
	ld b,h			;d8ba
	ld c,l			;d8bb
	ld a,008h		;d8bc
	ex af,af'		;d8be
	call L_C8AD		;d8bf
	ret nc			;d8c2
	ld hl,L_D8CD		;d8c3
	ld (ix+003h),l		;d8c6
	ld (ix+004h),h		;d8c9
	ret			;d8cc
L_D8CD:
	call L_CFF9		;d8cd
	ld a,(0ca8eh)		;d8d0
	and 001h		;d8d3
	ret z			;d8d5
	inc (ix+002h)		;d8d6
	ld l,(ix+005h)		;d8d9
	ld h,(ix+006h)		;d8dc
	inc (hl)		;d8df
	ld a,(hl)		;d8e0
	cp 00ah			;d8e1
	ret c			;d8e3
	ld a,006h		;d8e4
	ld (hl),a		;d8e6
	ld (ix+002h),a		;d8e7
	ld hl,L_D8A3		;d8ea
	ld (ix+003h),l		;d8ed
	ld (ix+004h),h		;d8f0
	ret			;d8f3
L_D8F4:
	call L_CFF9		;d8f4
	ret			;d8f7
L_D8F8:
	call L_CFF9		;d8f8
	ld l,(ix+005h)		;d8fb
	ld h,(ix+006h)		;d8fe
	ld (hl),00ah		;d901
	call L_C83F		;d903
	and 03fh		;d906
	ret nz			;d908
	ld a,(ix+000h)		;d909
	add a,a			;d90c
	add a,a			;d90d
	add a,a			;d90e
	ld l,a			;d90f
	ld h,(ix+007h)		;d910
	ld bc,00808h		;d913
	add hl,bc		;d916
	ld b,h			;d917
	ld c,l			;d918
	push bc			;d919
	ld de,(0c184h)		;d91a
	call L_C803		;d91e
	call L_C7D3		;d921
	pop bc			;d924
	ex af,af'		;d925
	call L_CC83		;d926
	ret nc			;d929
	ld l,(ix+005h)		;d92a
	ld h,(ix+006h)		;d92d
	ld (hl),00bh		;d930
	ret			;d932
L_D933:
	ld l,(ix+005h)		;d933
	ld h,(ix+006h)		;d936
	inc (hl)		;d939
	ld a,(hl)		;d93a
	cp 010h			;d93b
	ret c			;d93d
	ld a,(ix+002h)		;d93e
	cp 005h			;d941
	jp nz,L_D950		;d943
	ld hl,L_D95A		;d946
	ld (ix+003h),l		;d949
	ld (ix+004h),h		;d94c
	ret			;d94f
L_D950:
	ld hl,L_D959		;d950
	ld (ix+003h),l		;d953
	ld (ix+004h),h		;d956
L_D959:
	ret			;d959
L_D95A:
	ld a,(0c188h)		;d95a
	cp 004h			;d95d
	jp nc,L_D9CA		;d95f
	ld hl,(0c184h)		;d962
	push hl			;d965
	ld l,(ix+007h)		;d966
	ld de,00c10h		;d969
	ld bc,00204h		;d96c
	call L_CD7A		;d96f
	pop hl			;d972
	jr c,L_D9CA		;d973
	ld h,l			;d975
	ld a,(ix+000h)		;d976
	add a,a			;d979
	add a,a			;d97a
	add a,a			;d97b
	ld l,a			;d97c
	call L_CD7A		;d97d
	jr c,L_D9CA		;d980
	ld l,(ix+005h)		;d982
	ld h,(ix+006h)		;d985
	ld (hl),010h		;d988
	ld a,(0d3c1h)		;d98a
	cp 00ah			;d98d
	jr c,L_D9AC		;d98f
	ld a,(0e14eh)		;d991
	and a			;d994
	jr nz,L_D9AC		;d995
	call L_C83F		;d997
	and 003h		;d99a
	jr nz,L_D9AC		;d99c
	inc a			;d99e
	ld (0e14eh),a		;d99f
	ld a,001h		;d9a2
	ld de,0ea8ch		;d9a4
	call L_E18F		;d9a7
	jr L_D9BF		;d9aa
L_D9AC:
	ld a,(0d3c1h)		;d9ac
	add a,00ah		;d9af
	ld (0d3c1h),a		;d9b1
	call L_F2D1		;d9b4
	ld a,001h		;d9b7
	ld de,0eaa1h		;d9b9
	call L_E18F		;d9bc
L_D9BF:
	ld hl,0dd85h		;d9bf
	ld b,01bh		;d9c2
	call L_F394		;d9c4
	jp L_D950		;d9c7
L_D9CA:
	ld a,(0ca8eh)		;d9ca
	and 003h		;d9cd
	ret nz			;d9cf
	ld l,(ix+005h)		;d9d0
	ld h,(ix+006h)		;d9d3
	ld a,(hl)		;d9d6
	xor 001h		;d9d7
	ld (hl),a		;d9d9
	ret			;d9da

; ----------------------------------------------------------------------
; DATOS datos: sin clasificar (43 B; racha 2.26, entropia 4.69, 29 valores)
;   0xd9db..0xda06  (43 bytes)
; ----------------------------------------------------------------------
	defb 03ah,088h,0c1h,0feh,004h,0d0h,0ddh,066h,000h,0cbh,024h,03ah,085h,0c1h,06fh,011h	; d9db  :......f..$:..o.
	defb 00ch,038h,001h,002h,004h,0cdh,07ah,0cdh,0d8h,0ddh,066h,001h,03ah,084h,0c1h,06fh	; d9eb  .8....z...f.:..o
	defb 016h,012h,006h,007h,0cdh,07ah,0cdh,0d8h,0c3h,003h,0d3h	; d9fb  .....z.....

; ======================================================================
; CODIGO 0xda06..0xda3d  (55 bytes)
; ======================================================================


L_DA06:
	ld a,(hl)		;da06
	cp 0ffh			;da07
	jr z,L_DA31		;da09
	jp p,L_DA2A		;da0b
	push hl			;da0e
	ld hl,0de18h		;da0f
	ld d,000h		;da12
	and 07fh		;da14
	jr z,L_DA1D		;da16
	ld b,a			;da18
L_DA19:
	ld e,(hl)		;da19
	add hl,de		;da1a
	djnz L_DA19		;da1b
L_DA1D:
	ld b,(hl)		;da1d
	dec b			;da1e
	inc hl			;da1f
L_DA20:
	push bc			;da20
	call L_DA06		;da21
	pop bc			;da24
	djnz L_DA20		;da25
	pop hl			;da27
	inc hl			;da28
	ret			;da29
L_DA2A:
	ld (ix+000h),a		;da2a
	inc ix			;da2d
	inc hl			;da2f
	ret			;da30
L_DA31:
	pop hl			;da31
	ret			;da32
L_DA33:
	ld ix,05c50h		;da33
L_DA37:
	call L_DA06		;da37
	jp L_DA37		;da3a

; ----------------------------------------------------------------------
; DATOS tabla: (24 B; racha 2.02, entropia 4.14, 19 valores: pocos valores para ser un dibujo)
;   0xda3d..0xda55  (24 bytes)
; ----------------------------------------------------------------------
	defb 0ddh,07eh,000h,0feh,00ah,0d8h,0afh,032h,004h,0cbh,03ch,032h,0c5h,0dah,021h,072h	; da3d  .~.....2..<2..!r
	defb 0dah,0ddh,075h,003h,0ddh,074h,004h,0c9h	; da4d  ..u..t..

; ======================================================================
; CODIGO 0xda55..0xda72  (29 bytes)
; ======================================================================


L_DA55:
	ld a,(0ca91h)		;da55
	cp 080h			;da58
	ret nz			;da5a
	ld a,(0c98fh)		;da5b
	ld e,a			;da5e
	ld a,(0c97ah)		;da5f
	or e			;da62
	ret nz			;da63
	ld a,(0c939h)		;da64
	ld e,a			;da67
	ld a,(0c998h)		;da68
	or e			;da6b
	ret nz			;da6c
	ld a,(0d3c5h)		;da6d
	or e			;da70
	ret			;da71

; ----------------------------------------------------------------------
; DATOS tabla: (16 B; racha 2.25, entropia 3.62, 13 valores: pocos valores para ser un dibujo)
;   0xda72..0xda82  (16 bytes)
; ----------------------------------------------------------------------
	defb 0cdh,055h,0dah,0ddh,036h,000h,000h,0c0h,03ah,084h,0c1h,0feh,058h,0c0h,03ah,0a3h	; da72  .U..6...:...X.:.

; ======================================================================
; CODIGO 0xda82..0xda83  (1 bytes)
; ======================================================================


L_DA82:
	ret			;da82

; ----------------------------------------------------------------------
; DATOS datos: sin clasificar (86 B; racha 2.17, entropia 5.59, 54 valores)
;   0xda83..0xdad9  (86 bytes)
; ----------------------------------------------------------------------
	defb 0feh,008h,0c0h,021h,09dh,0dah,022h,064h,0c0h,021h,059h,0d9h,022h,0ddh,0d0h,032h	; da83  ...!.."d.!Y."..2
	defb 004h,0cbh,03eh,01fh,032h,0a3h,0c9h,0c3h,078h,0c6h,02ah,084h,0c1h,0e5h,03eh,008h	; da93  ..>.2...x.*...>.
	defb 0cdh,07bh,0c4h,0e1h,03ah,0a3h,0c9h,0e5h,0f5h,067h,03eh,018h,0cdh,07bh,0c4h,0f1h	; daa3  .{..:....g>..{..
	defb 0e1h,0feh,0c8h,0d0h,03ch,03ch,0bch,038h,001h,067h,032h,0a3h,0c9h,07ch,032h,085h	; dab3  ....<<.8.g2..|2.
	defb 0c1h,0c9h,000h,00dh,001h,00ah,046h,045h,04ch,049h,043h,049h,044h,041h,044h,045h	; dac3  ......FELICIDADE
	defb 053h,00dh,00dh,00dh,048h,041h	; dad3  S...HA

; ======================================================================
; CODIGO 0xdad9..0xdfd4  (1275 bytes)
; ======================================================================


L_DAD9:
	ld d,e			;dad9
	jr nz,L_DB1F		;dada
	ld c,a			;dadc
	ld c,(hl)		;dadd
	ld d,e			;dade
	ld b,l			;dadf
	ld b,a			;dae0
	ld d,l			;dae1
	ld c,c			;dae2
	ld b,h			;dae3
	ld c,a			;dae4
	jr nz,L_DB37		;dae5
	ld b,l			;dae7
	ld c,(hl)		;dae8
	ld b,l			;dae9
	ld d,h			;daea
	ld d,d			;daeb
	ld b,c			;daec
	ld d,d			;daed
	dec c			;daee
	dec c			;daef
	ld c,h			;daf0
	ld b,c			;daf1
	ld d,e			;daf2
	jr nz,L_DB39		;daf3
	ld b,l			;daf5
	ld b,(hl)		;daf6
	ld b,l			;daf7
	ld c,(hl)		;daf8
	ld d,e			;daf9
	ld b,c			;dafa
	ld d,e			;dafb
	jr nz,$+70		;dafc
	ld b,l			;dafe
	jr nz,L_DB4D		;daff
	ld b,c			;db01
	jr nz,L_DB52		;db02
	ld b,c			;db04
	ld d,(hl)		;db05
	ld b,l			;db06
	dec c			;db07
	dec c			;db08
	ld bc,0490ch		;db09
	ld c,(hl)		;db0c
	ld d,e			;db0d
	ld c,c			;db0e
	ld b,a			;db0f
	ld c,(hl)		;db10
	ld c,c			;db11
	ld b,c			;db12
	dec c			;db13
	dec c			;db14
	dec c			;db15
	ld d,b			;db16
	ld b,l			;db17
	ld d,d			;db18
	ld c,a			;db19
	jr nz,L_DB68		;db1a
	ld c,a			;db1c
	jr nz,L_DB6F		;db1d
L_DB1F:
	ld b,l			;db1f
	ld c,a			;db20
	ld d,d			;db21
	jr nz,L_DB65		;db22
	ld d,l			;db24
	ld c,(hl)		;db25
	jr nz,$+80		;db26
	ld c,a			;db28
	jr nz,L_DB73		;db29
	ld b,c			;db2b
	dec c			;db2c
	dec c			;db2d
	ld bc,04c0ch		;db2e
	ld c,h			;db31
	ld b,l			;db32
	ld b,a			;db33
	ld b,c			;db34
	ld b,h			;db35
	ld c,a			;db36
L_DB37:
	dec c			;db37
	dec c			;db38
L_DB39:
	dec c			;db39
	ld bc,05007h		;db3a
	ld d,l			;db3d
	ld c,h			;db3e
	ld d,e			;db3f
	ld b,c			;db40
	jr nz,L_DB84		;db41
	ld c,h			;db43
	ld b,a			;db44
	ld d,l			;db45
	ld c,(hl)		;db46
	ld b,c			;db47
	jr nz,L_DB9E		;db48
	ld b,l			;db4a
	ld b,e			;db4b
	ld c,h			;db4c
L_DB4D:
	ld b,c			;db4d
	dec c			;db4e
	dec c			;db4f
	ld d,e			;db50
	ld c,c			;db51
L_DB52:
	jr nz,L_DBA5		;db52
	ld d,l			;db54
	ld c,c			;db55
	ld b,l			;db56
	ld d,d			;db57
	ld b,l			;db58
	ld d,e			;db59
	jr nz,L_DBA0		;db5a
	ld b,l			;db5c
	ld d,e			;db5d
	ld b,e			;db5e
	ld d,l			;db5f
	ld b,d			;db60
	ld d,d			;db61
	ld c,c			;db62
	ld d,d			;db63
	ld c,h			;db64
L_DB65:
	ld c,a			;db65
	dec c			;db66
	nop			;db67
L_DB68:
	jr nz,$+34		;db68
	jr nz,$+34		;db6a
	ld b,c			;db6c
	ld b,d			;db6d
	ld b,c			;db6e
L_DB6F:
	ld c,d			;db6f
	ld c,a			;db70
	jr nz,L_DB93		;db71
L_DB73:
	jr nz,L_DB95		;db73
	jr nz,L_DB77		;db75
L_DB77:
	nop			;db77
	nop			;db78
	nop			;db79
	nop			;db7a
	nop			;db7b
	nop			;db7c
	dec c			;db7d
	dec c			;db7e
	jr nz,L_DBA1		;db7f
	jr nz,L_DBA3		;db81
	ld b,c			;db83
L_DB84:
	ld d,d			;db84
	ld d,d			;db85
	ld c,c			;db86
	ld b,d			;db87
	ld b,c			;db88
	jr nz,L_DBAB		;db89
	jr nz,L_DBAD		;db8b
	nop			;db8d
L_DB8E:
	nop			;db8e
	nop			;db8f
	nop			;db90
	nop			;db91
	nop			;db92
L_DB93:
	nop			;db93
	dec c			;db94
L_DB95:
	dec c			;db95
	jr nz,L_DBB8		;db96
	jr nz,L_DBBA		;db98
	ld b,h			;db9a
	ld b,l			;db9b
	ld d,d			;db9c
	ld b,l			;db9d
L_DB9E:
	ld b,e			;db9e
	ld c,b			;db9f
L_DBA0:
	ld b,c			;dba0
L_DBA1:
	jr nz,L_DBC3		;dba1
L_DBA3:
	jr nz,L_DBA5		;dba3
L_DBA5:
	nop			;dba5
	nop			;dba6
	nop			;dba7
	nop			;dba8
	nop			;dba9
	nop			;dbaa
L_DBAB:
	dec c			;dbab
L_DBAC:
	dec c			;dbac
L_DBAD:
	jr nz,L_DBCF		;dbad
	jr nz,L_DBD1		;dbaf
	ld c,c			;dbb1
	ld e,d			;dbb2
	ld d,c			;dbb3
	ld d,l			;dbb4
	ld c,c			;dbb5
	ld b,l			;dbb6
	ld d,d			;dbb7
L_DBB8:
	ld b,h			;dbb8
	ld b,c			;dbb9
L_DBBA:
	jr nz,L_DBBC		;dbba
L_DBBC:
	nop			;dbbc
	nop			;dbbd
	nop			;dbbe
	nop			;dbbf
	nop			;dbc0
	nop			;dbc1
	dec c			;dbc2
L_DBC3:
	dec c			;dbc3
	jr nz,L_DBE6		;dbc4
	jr nz,L_DBE8		;dbc6
	ld b,h			;dbc8
	ld c,c			;dbc9
	ld d,e			;dbca
	ld d,b			;dbcb
	ld b,c			;dbcc
	ld d,d			;dbcd
	ld c,a			;dbce
L_DBCF:
	jr nz,L_DBF1		;dbcf
L_DBD1:
	jr nz,L_DBD3		;dbd1
L_DBD3:
	nop			;dbd3
	nop			;dbd4
	nop			;dbd5
	nop			;dbd6
	nop			;dbd7
	nop			;dbd8
	dec c			;dbd9
	dec c			;dbda
	jr nz,L_DBFD		;dbdb
	jr nz,L_DBFF		;dbdd
	ld d,b			;dbdf
	ld b,c			;dbe0
	ld d,d			;dbe1
	ld b,c			;dbe2
	ld d,d			;dbe3
	jr nz,L_DC06		;dbe4
L_DBE6:
	jr nz,L_DC08		;dbe6
L_DBE8:
	jr nz,L_DBEA		;dbe8
L_DBEA:
	nop			;dbea
	nop			;dbeb
	nop			;dbec
	nop			;dbed
	nop			;dbee
	nop			;dbef
	dec c			;dbf0
L_DBF1:
	dec c			;dbf1
	jr nz,L_DC14		;dbf2
	jr nz,L_DC16		;dbf4
	ld b,c			;dbf6
	ld b,d			;dbf7
	ld b,c			;dbf8
	ld c,(hl)		;dbf9
	ld b,h			;dbfa
	ld c,a			;dbfb
	ld c,(hl)		;dbfc
L_DBFD:
	ld b,c			;dbfd
	ld d,d			;dbfe
L_DBFF:
	jr nz,L_DC01		;dbff
L_DC01:
	nop			;dc01
	nop			;dc02
	nop			;dc03
	nop			;dc04
	nop			;dc05
L_DC06:
	nop			;dc06
	dec c			;dc07
L_DC08:
	nop			;dc08
	jr nc,L_DC3C		;dc09
	ld (03433h),a		;dc0b
	dec (hl)		;dc0e
	ld (hl),037h		;dc0f
	jr c,L_DC4C		;dc11
	dec l			;dc13
L_DC14:
	dec a			;dc14
	inc hl			;dc15
L_DC16:
	ld (02624h),hl		;dc16
	daa			;dc19
	dec sp			;dc1a
	inc l			;dc1b
	ld l,02fh		;dc1c
	dec h			;dc1e
	ld b,c			;dc1f
	ld b,d			;dc20
	ld b,e			;dc21
	ld b,h			;dc22
	ld b,l			;dc23
	ld b,(hl)		;dc24
	ld b,a			;dc25
	ld c,b			;dc26
	ld c,c			;dc27
	ld c,d			;dc28
	ld c,e			;dc29
	ld c,h			;dc2a
	ld c,l			;dc2b
	ld c,(hl)		;dc2c
	ld c,a			;dc2d
	ld d,b			;dc2e
	ld d,c			;dc2f
	ld d,d			;dc30
	ld d,e			;dc31
	ld d,h			;dc32
	ld d,l			;dc33
	ld d,(hl)		;dc34
	ld d,a			;dc35
	ld e,b			;dc36
	ld e,c			;dc37
	ld e,d			;dc38
	ld bc,00302h		;dc39
L_DC3C:
	inc b			;dc3c
	dec b			;dc3d
	ld b,007h		;dc3e
	ex af,af'		;dc40
	add hl,bc		;dc41
	ld a,(bc)		;dc42
	dec bc			;dc43
	inc c			;dc44
	dec c			;dc45
	ld c,00fh		;dc46
	djnz L_DC5B		;dc48
	ld (de),a		;dc4a
	inc de			;dc4b
L_DC4C:
	inc d			;dc4c
	jr nz,$+34		;dc4d
	jr nz,L_DC71		;dc4f
	jr nz,L_DCA6		;dc51
	ld c,b			;dc53
	ld c,c			;dc54
	ld b,(hl)		;dc55
	ld d,h			;dc56
	nop			;dc57
	ld b,e			;dc58
	ld d,h			;dc59
	ld d,d			;dc5a
L_DC5B:
	ld c,h			;dc5b
	nop			;dc5c
	ld b,a			;dc5d
	ld d,d			;dc5e
	ld b,c			;dc5f
	ld d,b			;dc60
	ld c,b			;dc61
	nop			;dc62
	ld b,e			;dc63
	ld b,c			;dc64
	ld d,b			;dc65
	ld d,e			;dc66
	nop			;dc67
	ld b,e			;dc68
	ld c,a			;dc69
	ld b,h			;dc6a
	ld b,l			;dc6b
	nop			;dc6c
	ld b,(hl)		;dc6d
	jr nz,L_DCA1		;dc6e
	nop			;dc70
L_DC71:
	ld b,(hl)		;dc71
	jr nz,L_DCA6		;dc72
	nop			;dc74
	ld b,(hl)		;dc75
	jr nz,L_DCAB		;dc76
	nop			;dc78
	ld b,(hl)		;dc79
	jr nz,L_DCB0		;dc7a
	nop			;dc7c
	ld b,(hl)		;dc7d
	jr nz,L_DCB5		;dc7e
	nop			;dc80
	ld b,l			;dc81
	ld d,e			;dc82
	ld b,e			;dc83
	nop			;dc84
	ld d,h			;dc85
	ld b,c			;dc86
	ld b,d			;dc87
	nop			;dc88
	ld d,e			;dc89
	ld d,h			;dc8a
	ld c,a			;dc8b
	ld d,b			;dc8c
	nop			;dc8d
	ld b,d			;dc8e
	ld d,e			;dc8f
	nop			;dc90
	ld d,e			;dc91
	ld b,l			;dc92
	ld c,h			;dc93
	ld b,l			;dc94
	ld b,e			;dc95
	ld d,h			;dc96
	nop			;dc97
	ld b,l			;dc98
	ld c,(hl)		;dc99
	ld d,h			;dc9a
	ld b,l			;dc9b
	ld d,d			;dc9c
	nop			;dc9d
	ld d,e			;dc9e
	ld d,b			;dc9f
	ld b,c			;dca0
L_DCA1:
	ld b,e			;dca1
	ld b,l			;dca2
	nop			;dca3
	ld c,b			;dca4
	ld c,a			;dca5
L_DCA6:
	ld c,l			;dca6
	ld b,l			;dca7
	nop			;dca8
	ld c,c			;dca9
	ld c,(hl)		;dcaa
L_DCAB:
	ld d,e			;dcab
	nop			;dcac
L_DCAD:
	ld b,h			;dcad
	ld b,l			;dcae
	ld c,h			;dcaf
L_DCB0:
	nop			;dcb0
	ld b,b			;dcb1
L_DCB2:
	jp p,L_F440		;dcb2
L_DCB5:
	jr nz,L_DCAB		;dcb5
	djnz L_DCAD		;dcb7
	ld bc,020f8h		;dcb9
	di			;dcbc
	djnz L_DCB2		;dcbd
	nop			;dcbf
	nop			;dcc0
	nop			;dcc1
	nop			;dcc2
	nop			;dcc3
	nop			;dcc4
	nop			;dcc5
	ld d,e			;dcc6
	ld d,h			;dcc7
	ld b,c			;dcc8
	ld d,d			;dcc9
	ld b,h			;dcca
	ld d,l			;dccb
	ld d,e			;dccc
	ld d,h			;dccd
	nop			;dcce
	ld c,d			;dccf
	ld c,a			;dcd0
	ld e,c			;dcd1
	ld d,e			;dcd2
	ld d,h			;dcd3
	ld c,c			;dcd4
	ld b,e			;dcd5
	ld c,e			;dcd6
	nop			;dcd7
	ld d,h			;dcd8
	ld b,l			;dcd9
	ld b,e			;dcda
	ld c,h			;dcdb
	ld b,c			;dcdc
	ld b,h			;dcdd
	ld c,a			;dcde
	nop			;dcdf
	ld d,d			;dce0
	ld b,l			;dce1
	ld b,h			;dce2
	ld b,l			;dce3
	ld b,(hl)		;dce4
	ld c,c			;dce5
	ld c,(hl)		;dce6
	ld c,c			;dce7
	ld d,d			;dce8
	jr nz,L_DD3F		;dce9
	ld b,l			;dceb
	ld b,e			;dcec
	ld c,h			;dced
	ld b,c			;dcee
	ld d,e			;dcef
	nop			;dcf0
	ld c,d			;dcf1
	ld d,l			;dcf2
	ld b,a			;dcf3
	ld b,c			;dcf4
	ld d,d			;dcf5
	nop			;dcf6
	inc a			;dcf7
	ld a,03eh		;dcf8
	ld a,03eh		;dcfa
	ld a,03eh		;dcfc
	ld a,000h		;dcfe
	inc a			;dd00
	ld a,03eh		;dd01
	ld a,03eh		;dd03
	ld a,03eh		;dd05
	nop			;dd07
	ld c,d			;dd08
	ld b,c			;dd09
	ld d,(hl)		;dd0a
	ld c,c			;dd0b
	ld b,l			;dd0c
	ld d,d			;dd0d
	jr nz,$+34		;dd0e
	ld sp,03030h		;dd10
	jr nc,$+50		;dd13
	jr nc,L_DD17		;dd15
L_DD17:
	ld c,d			;dd17
	ld d,l			;dd18
	ld b,c			;dd19
	ld c,(hl)		;dd1a
	jr nz,$+69		;dd1b
	jr nz,L_DD3F		;dd1d
	jr nc,$+58		;dd1f
	jr nc,L_DD53		;dd21
	jr nc,L_DD55		;dd23
	nop			;dd25
	ld c,l			;dd26
	ld b,c			;dd27
	ld d,d			;dd28
	ld d,h			;dd29
	ld b,c			;dd2a
	jr nz,$+34		;dd2b
	jr nz,L_DD5F		;dd2d
	ld (hl),030h		;dd2f
	jr nc,$+50		;dd31
	jr nc,L_DD35		;dd33
L_DD35:
	ld c,l			;dd35
	ld b,c			;dd36
	ld d,d			;dd37
	ld c,c			;dd38
	ld b,c			;dd39
	jr nz,L_DD5C		;dd3a
	jr nz,L_DD6E		;dd3c
	dec (hl)		;dd3e
L_DD3F:
	jr nc,L_DD71		;dd3f
	jr nc,L_DD73		;dd41
	nop			;dd43
	jr nz,L_DD66		;dd44
	jr nz,$+34		;dd46
	jr nz,$+34		;dd48
	jr nz,$+34		;dd4a
	jr nc,L_DD82		;dd4c
	jr nc,L_DD80		;dd4e
	jr nc,L_DD82		;dd50
	nop			;dd52
L_DD53:
	jr nz,L_DDA9		;dd53
L_DD55:
	ld c,a			;dd55
	ld d,b			;dd56
	ld c,a			;dd57
	jr nz,$+34		;dd58
	jr nz,L_DD8C		;dd5a
L_DD5C:
	inc sp			;dd5c
	jr nc,$+50		;dd5d
L_DD5F:
	jr nc,$+50		;dd5f
	nop			;dd61
L_DD62:
	jr nz,L_DDB7		;dd62
L_DD64:
	ld c,a			;dd64
	ld b,(hl)		;dd65
L_DD66:
	ld d,h			;dd66
L_DD67:
	jr nz,$+34		;dd67
L_DD69:
	jr nz,L_DD9B		;dd69
L_DD6B:
	ld (03030h),a		;dd6b
L_DD6E:
	jr nc,L_DDA0		;dd6e
	nop			;dd70
L_DD71:
	jr nz,L_DD93		;dd71
L_DD73:
	jr nz,L_DD95		;dd73
	jr nz,$+34		;dd75
	jr nz,L_DD99		;dd77
	jr nc,L_DDAC		;dd79
L_DD7B:
	jr nc,$+50		;dd7b
L_DD7D:
	jr nc,L_DDAF		;dd7d
	nop			;dd7f
L_DD80:
	jr nc,L_DDB2		;dd80
L_DD82:
	jr nc,L_DDB4		;dd82
	jr nc,L_DDB6		;dd84
	nop			;dd86
	ld bc,0420bh		;dd87
L_DD8A:
	jr nz,L_DDDE		;dd8a
L_DD8C:
	jr nz,L_DDCF		;dd8c
	jr nz,L_DDE6		;dd8e
L_DD90:
	jr nz,$+81		;dd90
	dec c			;dd92
L_DD93:
	dec c			;dd93
	dec c			;dd94
L_DD95:
	dec c			;dd95
	ld bc,04807h		;dd96
L_DD99:
	ld b,c			;dd99
	ld d,e			;dd9a
L_DD9B:
	jr nz,L_DDE0		;dd9b
	ld c,a			;dd9d
L_DD9E:
	ld c,(hl)		;dd9e
	ld d,e			;dd9f
L_DDA0:
	ld b,l			;dda0
	ld b,a			;dda1
	ld d,l			;dda2
	ld c,c			;dda3
	ld b,h			;dda4
	ld c,a			;dda5
	jr nz,L_DDFD		;dda6
	ld c,(hl)		;dda8
L_DDA9:
	ld b,c			;dda9
	dec c			;ddaa
	dec c			;ddab
L_DDAC:
	ld bc,04409h		;ddac
L_DDAF:
	ld b,l			;ddaf
	jr nz,$+78		;ddb0
L_DDB2:
	ld b,c			;ddb2
	ld d,e			;ddb3
L_DDB4:
	jr nz,L_DE03		;ddb4
L_DDB6:
	ld b,l			;ddb6
L_DDB7:
	ld c,d			;ddb7
	ld c,a			;ddb8
	ld d,d			;ddb9
	ld b,l			;ddba
	ld d,e			;ddbb
	dec c			;ddbc
	dec c			;ddbd
	ld bc,05006h		;ddbe
	ld d,l			;ddc1
	ld c,(hl)		;ddc2
	ld d,h			;ddc3
	ld d,l			;ddc4
	ld b,c			;ddc5
	ld b,e			;ddc6
	ld c,c			;ddc7
	ld c,a			;ddc8
	ld c,(hl)		;ddc9
	ld b,l			;ddca
	ld d,e			;ddcb
	jr nz,L_DDEE		;ddcc
	ld b,h			;ddce
L_DDCF:
	ld b,l			;ddcf
	jr nz,L_DE1A		;ddd0
	ld c,a			;ddd2
	ld e,c			;ddd3
	dec c			;ddd4
	dec c			;ddd5
	dec c			;ddd6
	ld bc,04507h		;ddd7
	ld d,e			;ddda
	ld b,e			;dddb
	ld d,d			;dddc
	ld c,c			;dddd
L_DDDE:
	ld b,d			;ddde
	ld b,l			;dddf
L_DDE0:
	jr nz,$+34		;dde0
	ld d,h			;dde2
	ld d,l			;dde3
	jr nz,L_DE34		;dde4
L_DDE6:
	ld c,a			;dde6
	ld c,l			;dde7
	ld b,d			;dde8
	ld d,d			;dde9
	ld b,l			;ddea
	dec c			;ddeb
	dec c			;ddec
	dec c			;dded
L_DDEE:
	dec c			;ddee
	ld bc,0000dh		;ddef
	ld b,h			;ddf2
	ld b,l			;ddf3
	ld c,l			;ddf4
	ld c,a			;ddf5
	nop			;ddf6
	nop			;ddf7
	ld b,d			;ddf8
	ld c,a			;ddf9
	ld c,(hl)		;ddfa
	ld d,l			;ddfb
	ld d,e			;ddfc
L_DDFD:
	jr nz,L_DE34		;ddfd
	jr nc,L_DE31		;ddff
	jr nc,L_DE03		;de01
L_DE03:
	ret c			;de03
	ld h,c			;de04
	and c			;de05
	rst 10h			;de06
	ld h,d			;de07
	pop af			;de08
	call nc,L_7163		;de09
	call nc,0a164h		;de0c
	in a,(065h)		;de0f
	pop af			;de11
	jp pe,L_7166		;de12
	call po,0a167h		;de15
	inc bc			;de18
	nop			;de19
L_DE1A:
	nop			;de1a
	inc bc			;de1b
	nop			;de1c
	add a,b			;de1d
	inc bc			;de1e
	add a,b			;de1f
	add a,b			;de20
	inc bc			;de21
	sbc a,b			;de22
	nop			;de23
	inc bc			;de24
	add a,e			;de25
	add a,e			;de26
	inc bc			;de27
	dec d			;de28
	dec d			;de29
	inc bc			;de2a
	inc d			;de2b
	inc d			;de2c
	inc bc			;de2d
	ld b,005h		;de2e
	inc bc			;de30
L_DE31:
	xor h			;de31
	add hl,bc		;de32
	inc bc			;de33
L_DE34:
	ld bc,00302h		;de34
L_DE37:
	ld e,021h		;de37
	inc bc			;de39
	dec e			;de3a
	ld e,003h		;de3b
	inc b			;de3d
	inc b			;de3e
	inc bc			;de3f
	inc bc			;de40
	inc bc			;de41
	inc bc			;de42
	djnz L_DE56		;de43
	inc bc			;de45
	xor (hl)		;de46
	dec b			;de47
	inc bc			;de48
	xor (hl)		;de49
	xor a			;de4a
	inc bc			;de4b
	ld (bc),a		;de4c
	nop			;de4d
	inc bc			;de4e
	nop			;de4f
	ld bc,00603h		;de50
	ld h,003h		;de53
	dec h			;de55
L_DE56:
	dec b			;de56
	inc bc			;de57
	ex af,af'		;de58
	daa			;de59
	inc bc			;de5a
	inc h			;de5b
	add hl,bc		;de5c
	inc b			;de5d
	inc de			;de5e
	add hl,de		;de5f
	inc de			;de60
	inc bc			;de61
	nop			;de62
	dec d			;de63
	inc bc			;de64
	dec d			;de65
	nop			;de66
	inc bc			;de67
	ld h,025h		;de68
	inc bc			;de6a
	daa			;de6b
	inc h			;de6c
	inc bc			;de6d
	ld (bc),a		;de6e
	rla			;de6f
	inc bc			;de70
	rla			;de71
	ld bc,02203h		;de72
	ld bc,00503h		;de75
	ld b,003h		;de78
	dec h			;de7a
	ld h,003h		;de7b
	ld c,00fh		;de7d
	inc b			;de7f
	sub c			;de80
	adc a,c			;de81
	sub d			;de82
	inc b			;de83
	add a,b			;de84
	add a,(hl)		;de85
	add a,b			;de86
	inc b			;de87
	sbc a,b			;de88
L_DE89:
	adc a,c			;de89
	sbc a,c			;de8a
	inc bc			;de8b
	dec sp			;de8c
	dec sp			;de8d
	inc bc			;de8e
	inc h			;de8f
	daa			;de90
	inc bc			;de91
	dec h			;de92
	inc b			;de93
	inc bc			;de94
	inc b			;de95
	ld h,003h		;de96
	inc h			;de98
	inc bc			;de99
	inc bc			;de9a
	inc bc			;de9b
	daa			;de9c
	inc bc			;de9d
	sub c			;de9e
	sub d			;de9f
	inc bc			;dea0
	ex af,af'		;dea1
	inc bc			;dea2
	inc bc			;dea3
	inc bc			;dea4
	add hl,bc		;dea5
	inc bc			;dea6
	ld b,004h		;dea7
	inc bc			;dea9
	inc b			;deaa
	dec b			;deab
	inc bc			;deac
	xor h			;dead
	xor l			;deae
	inc b			;deaf
	xor h			;deb0
	adc a,l			;deb1
	xor l			;deb2
	inc b			;deb3
	nop			;deb4
	sub e			;deb5
	sub h			;deb6
	inc bc			;deb7
	sub l			;deb8
	sub (hl)		;deb9
	inc b			;deba
	xor h			;debb
	sbc a,e			;debc
	xor l			;debd
	inc b			;debe
	add a,c			;debf
	adc a,c			;dec0
	add a,b			;dec1
	inc b			;dec2
	sub c			;dec3
	add a,b			;dec4
	sub d			;dec5
	inc b			;dec6
	sub (hl)		;dec7
	add a,b			;dec8
	sub l			;dec9
	inc bc			;deca
	dec c			;decb
	ld bc,00c03h		;decc
	ld bc,03203h		;decf
	ld (03603h),a		;ded2
	ld (hl),003h		;ded5
	ld c,d			;ded7
	ld c,e			;ded8
	inc bc			;ded9
	ld d,d			;deda
	ld d,e			;dedb
	inc bc			;dedc
	ld c,003h		;dedd
	inc bc			;dedf
	inc bc			;dee0
	rrca			;dee1
	inc bc			;dee2
	djnz $+6		;dee3
	inc bc			;dee5
	inc b			;dee6
	ld de,01a03h		;dee7
	ld a,(de)		;deea
	inc bc			;deeb
	ld c,h			;deec
	ld c,l			;deed
	inc bc			;deee
	ld c,b			;deef
	ld c,c			;def0
	inc bc			;def1
	ld d,b			;def2
	ld d,c			;def3
	inc bc			;def4
	ld c,(hl)		;def5
	ld e,b			;def6
	inc bc			;def7
	ld e,b			;def8
	ld c,a			;def9
	inc bc			;defa
	ld e,d			;defb
	ld e,b			;defc
	inc bc			;defd
	ld e,b			;defe
	ld e,e			;deff
	inc bc			;df00
	ld e,c			;df01
	ld e,c			;df02
	inc b			;df03
	ld l,018h		;df04
	cpl			;df06
	inc b			;df07
	ld h,b			;df08
	ld h,c			;df09
	ld h,d			;df0a
	inc b			;df0b
	ld l,b			;df0c
	ld l,c			;df0d
	ld l,d			;df0e
L_DF0F:
	ld ix,0c999h		;df0f
	ld a,(0c998h)		;df13
	and a			;df16
	ret z			;df17
	ld b,a			;df18
L_DF19:
	push bc			;df19
	ld c,(ix+000h)		;df1a
	ld b,(ix+001h)		;df1d
	ld e,(ix+002h)		;df20
	ld d,(ix+003h)		;df23
	ld hl,(0c184h)		;df26
	ld a,c			;df29
	add a,00ah		;df2a
	cp 07ch			;df2c
	jr c,L_DF48		;df2e
	ex de,hl		;df30
	ld bc,00404h		;df31
	sbc hl,bc		;df34
	sub 069h		;df36
	call L_C47B		;df38
	inc (ix+000h)		;df3b
	ld a,(ix+000h)		;df3e
	cp 080h			;df41
	jr c,L_DFA6		;df43
	jp L_DFB1		;df45
L_DF48:
	ld a,(ix+004h)		;df48
	cp 0b4h			;df4b
	jr nc,L_DF52		;df4d
	ld hl,0ff60h		;df4f
L_DF52:
	ex de,hl		;df52
	call L_CBA6		;df53
	ex de,hl		;df56
	ld a,d			;df57
	cp 0e0h			;df58
	jr nc,L_DFB1		;df5a
	ld (ix+000h),c		;df5c
	ld (ix+001h),b		;df5f
	ld (ix+002h),e		;df62
	ld (ix+003h),d		;df65
	ld a,(ix+004h)		;df68
	and 001h		;df6b
	dec (ix+004h)		;df6d
	ex de,hl		;df70
	call L_C553		;df71
	call L_D080		;df74
	ld a,(0c188h)		;df77
	cp 004h			;df7a
	jr nc,L_DFA6		;df7c
	ld l,(ix+002h)		;df7e
	ld h,(ix+003h)		;df81
	push hl			;df84
	ld a,(0c185h)		;df85
	ld l,a			;df88
	ld de,0040ah		;df89
	ld bc,00203h		;df8c
	call L_CD7A		;df8f
	pop hl			;df92
	jr c,L_DFA6		;df93
	ld h,l			;df95
	ld a,(0c184h)		;df96
	ld l,a			;df99
	call L_CD7A		;df9a
	jr c,L_DFA6		;df9d
	call L_D2C2		;df9f
	ld (ix+000h),07ch	;dfa2
L_DFA6:
	ld de,00005h		;dfa6
	add ix,de		;dfa9
L_DFAB:
	pop bc			;dfab
	dec b			;dfac
	jp nz,L_DF19		;dfad
	ret			;dfb0
L_DFB1:
	ld hl,0c998h		;dfb1
	dec (hl)		;dfb4
	pop bc			;dfb5
	push bc			;dfb6
	ld a,b			;dfb7
	cp 001h			;dfb8
	jr z,L_DFAB		;dfba
	push ix			;dfbc
	pop de			;dfbe
	push de			;dfbf
	inc de			;dfc0
	inc de			;dfc1
	inc de			;dfc2
	inc de			;dfc3
	inc de			;dfc4
	ld hl,0c9a3h		;dfc5
	and a			;dfc8
	sbc hl,de		;dfc9
	ld b,h			;dfcb
	ld c,l			;dfcc
	ex de,hl		;dfcd
	pop de			;dfce
	ldir			;dfcf
	jp L_DFAB		;dfd1

; ----------------------------------------------------------------------
; DATOS datos: sin clasificar (45 B; racha 2.31, entropia 4.55, 28 valores)
;   0xdfd4..0xe001  (45 bytes)
; ----------------------------------------------------------------------
	defb 0cdh,0f5h,0d1h,0cdh,03fh,0c8h,0e6h,01fh,0c0h,021h,0e7h,0dfh,0ddh,075h,003h,0ddh	; dfd4  ....?....!...u..
	defb 074h,004h,0c9h,0ddh,034h,002h,0cdh,0f5h,0d1h,0ddh,06eh,005h,0ddh,066h,006h,034h	; dfe4  t...4.....n..f.4
	defb 07eh,0feh,03bh,0d8h,021h,002h,0e0h,0ddh,075h,003h,0ddh,074h,004h	; dff4  ~.;.!...u..t.

; ======================================================================
; CODIGO 0xe001..0xe002  (1 bytes)
; ======================================================================


L_E001:
	ret			;e001

; ----------------------------------------------------------------------
; DATOS datos: sin clasificar (246 B; racha 2.31, entropia 5.63, 75 valores)
;   0xe002..0xe0f8  (246 bytes)
; ----------------------------------------------------------------------
	defb 0cdh,0f5h,0d1h,0cdh,03fh,0c8h,0e6h,01fh,0c0h,0ddh,06eh,001h,0ddh,066h,000h,0cbh	; e002  ....?.....n..f..
	defb 024h,001h,00ch,00ch,009h,044h,04dh,0c5h,0edh,05bh,084h,0c1h,0cdh,003h,0c8h,0cdh	; e012  $....DM..[......
	defb 0d3h,0c7h,008h,0c1h,0cdh,083h,0cch,0c9h,0cdh,0f5h,0d1h,0ddh,07eh,000h,0feh,010h	; e022  ............~...
	defb 0d8h,021h,03dh,0e0h,0ddh,075h,003h,0ddh,074h,004h,0c9h,0cdh,0f5h,0d1h,03ah,08eh	; e032  .!=..u..t.....:.
	defb 0cah,0e6h,001h,0c0h,0ddh,034h,002h,0ddh,06eh,005h,0ddh,066h,006h,034h,07eh,0feh	; e042  .....4..n..f.4~.
	defb 042h,0d8h,021h,05eh,0e0h,0ddh,075h,003h,0ddh,074h,004h,0c9h,0cdh,0f5h,0d1h,0cdh	; e052  B.!^..u..t......
	defb 03fh,0c8h,0e6h,01fh,0c0h,0ddh,06eh,001h,0ddh,066h,000h,0cbh,024h,001h,00ch,00ch	; e062  ?.....n..f..$...
	defb 009h,044h,04dh,0afh,008h,0cdh,0adh,0c8h,0d0h,03eh,03fh,0ddh,077h,002h,0ddh,06eh	; e072  .DM......>?.w..n
	defb 005h,0ddh,066h,006h,077h,021h,03dh,0e0h,0ddh,075h,003h,0ddh,074h,004h,0c9h,0cdh	; e082  ..f.w!=..u..t...
	defb 0dbh,0d9h,0ddh,07eh,000h,0feh,028h,0d0h,0cdh,03fh,0c8h,0e6h,00fh,0c0h,0ddh,06eh	; e092  ...~..(..?.....n
	defb 001h,0ddh,066h,000h,0cbh,024h,001h,008h,050h,009h,044h,04dh,0cdh,03fh,0c8h,0e6h	; e0a2  ..f..$..P.DM.?..
	defb 004h,028h,009h,03eh,01eh,008h,0cdh,020h,0cdh,0c3h,0c4h,0e0h,03eh,01bh,008h,0cdh	; e0b2  .(.>... ....>...
	defb 082h,0c8h,0d0h,021h,0cfh,0e0h,0ddh,075h,003h,0ddh,074h,004h,0c9h,0cdh,0dbh,0d9h	; e0c2  ...!...u..t.....
	defb 0ddh,034h,002h,03eh,001h,011h,098h,0eah,0cdh,08fh,0e1h,0ddh,06eh,005h,0ddh,066h	; e0d2  .4.>........n..f
	defb 006h,034h,07eh,0feh,036h,0d8h,03eh,032h,077h,0ddh,077h,002h,021h,091h,0e0h,0ddh	; e0e2  .4~.6.>2w.w.!...
	defb 075h,003h,0ddh,074h,004h,0c9h	; e0f2  u..t..

; ======================================================================
; CODIGO 0xe0f8..0xe14e  (86 bytes)
; ======================================================================


L_E0F8:
	bit 4,a			;e0f8
	ld bc,(0e14fh)		;e0fa
	ld b,a			;e0fe
	ld a,001h		;e0ff
	jr nz,L_E105		;e101
	ld a,000h		;e103
L_E105:
	ld (0e14fh),a		;e105
	ld a,b			;e108
	ret z			;e109
	ld a,c			;e10a
	and a			;e10b
	ld a,b			;e10c
	ret nz			;e10d
	push af			;e10e
	push hl			;e10f
	ld a,(0c9a3h)		;e110
	and 007h		;e113
	ld bc,00404h		;e115
	add hl,bc		;e118
	ld b,h			;e119
	ld c,l			;e11a
	ex af,af'		;e11b
	call L_CCA3		;e11c
	add a,004h		;e11f
	and 007h		;e121
	ex af,af'		;e123
	ld a,(0e14eh)		;e124
	and a			;e127
	jr z,L_E148		;e128
	ld a,0c9h		;e12a
	ld (0e190h),a		;e12c
	call L_CCA3		;e12f
	add a,002h		;e132
	and 007h		;e134
	ex af,af'		;e136
	call L_CCA3		;e137
	add a,004h		;e13a
	and 007h		;e13c
	ex af,af'		;e13e
	call L_CCA3		;e13f
	ld a,(0e1bdh)		;e142
	ld (0e190h),a		;e145
L_E148:
	call L_D164		;e148
	pop hl			;e14b
	pop af			;e14c
	ret			;e14d

; ----------------------------------------------------------------------
; DATOS relleno: (12 B; 12 de 12 bytes son 0x00)
;   0xe14e..0xe15a  (12 bytes)
; ----------------------------------------------------------------------
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; e14e  ............

; ======================================================================
; CODIGO 0xe15a..0xe5e2  (1160 bytes)
; ======================================================================


L_E15A:
	di			;e15a
	pop hl			;e15b
	call L_E1F5		;e15c
	pop ix			;e15f
	pop iy			;e161
	pop af			;e163
	pop bc			;e164
	pop de			;e165
	pop hl			;e166
	ex af,af'		;e167
	exx			;e168
	pop af			;e169
	pop bc			;e16a
	pop de			;e16b
	pop hl			;e16c
	ei			;e16d
	ret			;e16e
L_E16F:
	ld a,080h		;e16f
	ld de,0eb52h		;e171
	call L_E1BC		;e174
	inc a			;e177
	ld de,0ec4ah		;e178
	call L_E1BC		;e17b
	ld a,002h		;e17e
	ld de,0eccbh		;e180
	call L_E1BC		;e183
L_E186:
	ld a,0c9h		;e186
	ld (L_E1BC),a	;e188
	ld (L_E18F),a		;e18b
	ret			;e18e
L_E18F:
	di			;e18f
	push af			;e190
	push de			;e191
	and 07fh		;e192
	ld de,0002eh		;e194
	call L_E591		;e197
	ld de,0ed75h		;e19a
	add hl,de		;e19d
	push hl			;e19e
	ld a,(hl)		;e19f
	inc hl			;e1a0
	or (hl)			;e1a1
	jr z,L_E1B6		;e1a2
	ld d,003h		;e1a4
	ld hl,0ed75h		;e1a6
	ld bc,0002eh		;e1a9
L_E1AC:
	inc hl			;e1ac
	ld a,(hl)		;e1ad
	dec hl			;e1ae
	or (hl)			;e1af
	jr z,L_E1B9		;e1b0
	add hl,bc		;e1b2
	dec d			;e1b3
	jr nz,L_E1AC		;e1b4
L_E1B6:
	pop hl			;e1b6
	jr L_E1CB		;e1b7
L_E1B9:
	pop de			;e1b9
	jr L_E1CB		;e1ba
L_E1BC:
	di			;e1bc
	push af			;e1bd
	push de			;e1be
	and 07fh		;e1bf
	ld de,0002eh		;e1c1
	call L_E591		;e1c4
	ld de,0ed75h		;e1c7
	add hl,de		;e1ca
L_E1CB:
	push hl			;e1cb
	xor a			;e1cc
	ld b,02eh		;e1cd
L_E1CF:
	ld (hl),a		;e1cf
	inc hl			;e1d0
	djnz L_E1CF		;e1d1
	pop hl			;e1d3
	pop de			;e1d4
	ld (hl),e		;e1d5
	inc hl			;e1d6
	ld (hl),d		;e1d7
	inc hl			;e1d8
	ld (hl),e		;e1d9
	inc hl			;e1da
	ld (hl),d		;e1db
	ld a,001h		;e1dc
	ld (0ee1ah),a		;e1de
	pop af			;e1e1
	push af			;e1e2
	and 07fh		;e1e3
	ld hl,0ee21h		;e1e5
	add a,l			;e1e8
	ld l,a			;e1e9
	ld a,h			;e1ea
	adc a,000h		;e1eb
	ld h,a			;e1ed
	ld (hl),000h		;e1ee
	pop af			;e1f0
	or a			;e1f1
	ret m			;e1f2
	ei			;e1f3
	ret			;e1f4
L_E1F5:
	push af			;e1f5
	ld b,003h		;e1f6
	xor a			;e1f8
	ld ix,0ed75h		;e1f9
	ld de,0ee0dh		;e1fd
	ld hl,0ee15h		;e200
L_E203:
	push af			;e203
	push hl			;e204
	push de			;e205
	push bc			;e206
	ld (0ee19h),a		;e207
	ld a,(ix+004h)		;e20a
	or (ix+005h)		;e20d
	jp nz,L_E26E		;e210
	xor a			;e213
	call L_E529		;e214
	ld c,(ix+002h)		;e217
	ld b,(ix+003h)		;e21a
	ld a,b			;e21d
	or c			;e21e
	jp z,L_E327		;e21f
L_E222:
	ld a,(bc)		;e222
	cp 080h			;e223
	jp c,L_E231		;e225
	sub 080h		;e228
	ld hl,0e7a3h		;e22a
	call L_E5C0		;e22d
	jp (hl)			;e230
L_E231:
	push af			;e231
	call L_E586		;e232
	pop af			;e235
	add a,(hl)		;e236
	ld hl,0e6e3h		;e237
	call L_E5C0		;e23a
	ld (ix+00ah),l		;e23d
	ld (ix+00bh),h		;e240
	inc bc			;e243
L_E244:
	ld a,(ix+008h)		;e244
	call L_E529		;e247
	call L_E3A3		;e24a
	ld (ix+02ah),000h	;e24d
	call L_E3BB		;e251
	ld (ix+02bh),000h	;e254
	ld (ix+02ch),000h	;e258
L_E25C:
	ld (ix+002h),c		;e25c
	ld (ix+003h),b		;e25f
	ld l,(ix+006h)		;e262
	ld h,(ix+007h)		;e265
	ld (ix+004h),l		;e268
	ld (ix+005h),h		;e26b
L_E26E:
	ld l,(ix+004h)		;e26e
	ld h,(ix+005h)		;e271
	dec hl			;e274
	ld (ix+004h),l		;e275
	ld (ix+005h),h		;e278
	push ix			;e27b
	pop iy			;e27d
	ld d,002h		;e27f
	ld c,000h		;e281
L_E283:
	ld a,(iy+00ch)		;e283
	or a			;e286
	jr z,L_E290		;e287
	dec a			;e289
	ld (iy+00ch),a		;e28a
	inc c			;e28d
	jr L_E2B1		;e28e
L_E290:
	ld a,(iy+00eh)		;e290
	or a			;e293
	jr z,L_E2AC		;e294
	dec a			;e296
	ld (iy+00eh),a		;e297
	ld a,(ix+02ah)		;e29a
	add a,(iy+01bh)		;e29d
	ld (ix+02ah),a		;e2a0
	ld a,(iy+020h)		;e2a3
	ld (iy+00ch),a		;e2a6
	inc c			;e2a9
	jr L_E2B1		;e2aa
L_E2AC:
	inc iy			;e2ac
	dec d			;e2ae
	jr nz,L_E283		;e2af
L_E2B1:
	ld a,c			;e2b1
	or a			;e2b2
	jr nz,L_E2BC		;e2b3
	bit 0,(ix+02dh)		;e2b5
	call nz,L_E3A3	;e2b9
L_E2BC:
	push ix			;e2bc
	pop iy			;e2be
	ld d,003h		;e2c0
	ld c,000h		;e2c2
L_E2C4:
	ld a,(iy+010h)		;e2c4
	or a			;e2c7
	jr z,L_E2D1		;e2c8
	dec a			;e2ca
	ld (iy+010h),a		;e2cb
	inc c			;e2ce
	jr L_E31C		;e2cf
L_E2D1:
	ld a,(iy+013h)		;e2d1
	or a			;e2d4
	jr z,L_E317		;e2d5
	dec a			;e2d7
	ld (iy+013h),a		;e2d8
	ld a,(iy+01dh)		;e2db
	or a			;e2de
	jp p,L_E2FB		;e2df
	ld a,(iy+01dh)		;e2e2
	cpl			;e2e5
	inc a			;e2e6
	ld e,a			;e2e7
	ld a,(ix+02bh)		;e2e8
	sub e			;e2eb
	ld (ix+02bh),a		;e2ec
	ld a,(ix+02ch)		;e2ef
	sbc a,000h		;e2f2
	and 00fh		;e2f4
	ld (ix+02ch),a		;e2f6
	jr L_E30E		;e2f9
L_E2FB:
	ld a,(ix+02bh)		;e2fb
	add a,(iy+01dh)		;e2fe
	ld (ix+02bh),a		;e301
	ld a,(ix+02ch)		;e304
	adc a,000h		;e307
	and 00fh		;e309
	ld (ix+02ch),a		;e30b
L_E30E:
	ld a,(iy+022h)		;e30e
	ld (iy+010h),a		;e311
	inc c			;e314
	jr L_E31C		;e315
L_E317:
	inc iy			;e317
	dec d			;e319
	jr nz,L_E2C4		;e31a
L_E31C:
	ld a,c			;e31c
	or a			;e31d
	jr nz,L_E327		;e31e
	bit 1,(ix+02dh)		;e320
	call nz,L_E3BB	;e324
L_E327:
	pop bc			;e327
	pop de			;e328
	pop hl			;e329
	ld a,(ix+009h)		;e32a
	add a,(ix+02ah)		;e32d
	and 00fh		;e330
	ld (hl),a		;e332
	ld a,(ix+00ah)		;e333
	add a,(ix+02bh)		;e336
	ld (de),a		;e339
	inc de			;e33a
	ld a,(ix+00bh)		;e33b
	adc a,(ix+02ch)		;e33e
	ld (de),a		;e341
	inc de			;e342
	push de			;e343
	ld de,0002eh		;e344
	add ix,de		;e347
	pop de			;e349
	pop af			;e34a
	inc a			;e34b
	inc hl			;e34c
	dec b			;e34d
	jp nz,L_E203		;e34e
	ld iy,0edffh		;e351
	ld d,002h		;e355
	ld c,000h		;e357
L_E359:
	ld a,(iy+000h)		;e359
	or a			;e35c
	jr z,L_E366		;e35d
	dec a			;e35f
	ld (iy+000h),a		;e360
	inc c			;e363
	jr L_E387		;e364
L_E366:
	ld a,(iy+002h)		;e366
	or a			;e369
	jr z,L_E382		;e36a
	dec a			;e36c
	ld (iy+002h),a		;e36d
	ld a,(0ee0bh)		;e370
	add a,(iy+006h)		;e373
	ld (0ee0bh),a		;e376
	ld a,(iy+008h)		;e379
	ld (iy+000h),a		;e37c
	inc c			;e37f
	jr L_E387		;e380
L_E382:
	inc iy			;e382
	dec d			;e384
	jr nz,L_E359		;e385
L_E387:
	ld a,c			;e387
	or a			;e388
	jr nz,L_E393		;e389
	ld a,(0ee09h)		;e38b
	bit 2,a			;e38e
	call nz,L_E3D3	;e390
L_E393:
	ld a,(0ee0ah)		;e393
	ld e,a			;e396
	ld a,(0ee0bh)		;e397
	add a,e			;e39a
	ld (0ee13h),a		;e39b
	call L_E5CD		;e39e
	pop af			;e3a1
	ret			;e3a2
L_E3A3:
	push ix			;e3a3
	ld d,002h		;e3a5
L_E3A7:
	ld a,(ix+020h)		;e3a7
	ld (ix+00ch),a		;e3aa
	ld a,(ix+016h)		;e3ad
	ld (ix+00eh),a		;e3b0
	inc ix			;e3b3
	dec d			;e3b5
	jr nz,L_E3A7		;e3b6
L_E3B8:
	pop ix			;e3b8
	ret			;e3ba
L_E3BB:
	ld d,003h		;e3bb
	push ix			;e3bd
L_E3BF:
	ld a,(ix+022h)		;e3bf
	ld (ix+010h),a		;e3c2
	ld a,(ix+018h)		;e3c5
	ld (ix+013h),a		;e3c8
	inc ix			;e3cb
	dec d			;e3cd
	jr nz,L_E3BF		;e3ce
	pop ix			;e3d0
	ret			;e3d2
L_E3D3:
	ld d,002h		;e3d3
	push iy			;e3d5
	ld iy,0edffh		;e3d7
L_E3DB:
	ld a,(iy+008h)		;e3db
	ld (iy+000h),a		;e3de
	ld a,(iy+004h)		;e3e1
	ld (iy+002h),a		;e3e4
	inc iy			;e3e7
	dec d			;e3e9
	jr nz,L_E3DB		;e3ea
	pop iy			;e3ec
	ret			;e3ee
L_E3EF:
	inc bc			;e3ef
	ld a,(bc)		;e3f0
	ld (ix+009h),a		;e3f1
	inc bc			;e3f4
	jp L_E222		;e3f5
L_E3F8:
	inc bc			;e3f8
	ld a,(bc)		;e3f9
	ld de,(0ee18h)		;e3fa
	ld d,000h		;e3fe
	call L_E591		;e400
	ld (ix+006h),l		;e403
	ld (ix+007h),h		;e406
	inc bc			;e409
	jp L_E222		;e40a
L_E40D:
	inc bc			;e40d
	ld a,(bc)		;e40e
	and 009h		;e40f
	ld (ix+008h),a		;e411
	inc bc			;e414
	jp L_E222		;e415
L_E418:
	push ix			;e418
	pop hl			;e41a
	xor a			;e41b
	ld b,02eh		;e41c
L_E41E:
	ld (hl),a		;e41e
	inc hl			;e41f
	djnz L_E41E		;e420
	ld a,0f3h		;e422
	ld (L_E18F),a		;e424
	ld (L_E1BC),a	;e427
	ld a,(0ee19h)		;e42a
	ld hl,0ee0ch		;e42d
	xor (hl)		;e430
	jp nz,L_E327		;e431
	ld hl,0edffh		;e434
	ld de,0ee00h		;e437
	ld bc,0000ah		;e43a
	ld (hl),a		;e43d
	ldir			;e43e
	inc de			;e440
	ld (de),a		;e441
	jp L_E327		;e442
L_E445:
	inc bc			;e445
	ld a,(bc)		;e446
	push bc			;e447
	ld de,00008h		;e448
	call L_E591		;e44b
	ld bc,01770h		;e44e
	push hl			;e451
	pop de			;e452
	call L_E5A6		;e453
	ld a,c			;e456
	ld (0ee18h),a		;e457
	pop bc			;e45a
	inc bc			;e45b
	jp L_E222		;e45c
L_E45F:
	inc bc			;e45f
	ld a,(bc)		;e460
	push af			;e461
	and 01fh		;e462
	ld (0ee0ah),a		;e464
	call L_E3D3		;e467
	pop af			;e46a
	inc bc			;e46b
	or a			;e46c
	jp m,L_E222		;e46d
	jp L_E244		;e470
L_E473:
	inc bc			;e473
	jp L_E25C		;e474
L_E477:
	ld a,(0ee19h)		;e477
	dec a			;e47a
	jr nz,L_E483		;e47b
	ld a,(0ee1ah)		;e47d
	and a			;e480
	jr z,L_E418		;e481
L_E483:
	ld c,(ix+000h)		;e483
	ld b,(ix+001h)		;e486
	ld (ix+002h),c		;e489
	ld (ix+003h),b		;e48c
	jp L_E222		;e48f
L_E492:
	inc bc			;e492
	ld a,(bc)		;e493
	ld e,a			;e494
	or (ix+02dh)		;e495
	ld (ix+02dh),a		;e498
	ld a,(0ee09h)		;e49b
	or e			;e49e
	ld (0ee09h),a		;e49f
	inc bc			;e4a2
	jp L_E222		;e4a3
L_E4A6:
	inc bc			;e4a6
	res 0,(ix+02dh)		;e4a7
	res 1,(ix+02dh)		;e4ab
	ld a,(bc)		;e4af
	ld de,0000fh		;e4b0
	call L_E591		;e4b3
	ld de,0e5e2h		;e4b6
	add hl,de		;e4b9
	push ix			;e4ba
	ld d,00fh		;e4bc
L_E4BE:
	ld a,(hl)		;e4be
	ld (ix+016h),a		;e4bf
	inc hl			;e4c2
	inc ix			;e4c3
	dec d			;e4c5
	jp nz,L_E4BE		;e4c6
	pop ix			;e4c9
	inc bc			;e4cb
	ld (ix+00ch),000h	;e4cc
	ld (ix+00dh),000h	;e4d0
	ld (ix+010h),000h	;e4d4
	ld (ix+011h),000h	;e4d8
	ld (ix+012h),000h	;e4dc
	ld (ix+02ah),000h	;e4e0
	ld (ix+02bh),000h	;e4e4
	ld (ix+02ch),000h	;e4e8
	jp L_E222		;e4ec
L_E4EF:
	inc bc			;e4ef
	ld a,(0ee09h)		;e4f0
	res 2,a			;e4f3
	ld (0ee09h),a		;e4f5
	ld a,(bc)		;e4f8
	ld de,00006h		;e4f9
	call L_E591		;e4fc
	ld de,0e6d2h		;e4ff
	add hl,de		;e502
	ld iy,0edffh		;e503
	ld (iy+000h),000h	;e507
	ld (iy+001h),000h	;e50b
	ld d,006h		;e50f
L_E511:
	ld a,(hl)		;e511
	ld (iy+004h),a		;e512
	inc hl			;e515
	inc iy			;e516
	dec d			;e518
	jr nz,L_E511		;e519
	xor a			;e51b
	ld (0ee0bh),a		;e51c
	inc bc			;e51f
	ld a,(0ee19h)		;e520
	ld (0ee0ch),a		;e523
	jp L_E222		;e526
L_E529:
	push de			;e529
	cpl			;e52a
	ld e,a			;e52b
	ld d,009h		;e52c
	ld a,(0ee19h)		;e52e
L_E531:
	dec a			;e531
	jp m,L_E53C		;e532
	scf			;e535
	rl e			;e536
	sla d			;e538
	jr L_E531		;e53a
L_E53C:
	ld a,(0ee14h)		;e53c
	or d			;e53f
	and e			;e540
	ld (0ee14h),a		;e541
	pop de			;e544
	ret			;e545
L_E546:
	ld a,001h		;e546
	ld (0ee18h),a		;e548
	inc bc			;e54b
	jp L_E222		;e54c
L_E54F:
	ld a,(0ee19h)		;e54f
	inc bc			;e552
	add a,a			;e553
	ld l,a			;e554
	ld h,000h		;e555
	ld a,(bc)		;e557
	inc bc			;e558
	ld de,0ee1bh		;e559
	add hl,de		;e55c
	ld (hl),c		;e55d
	inc hl			;e55e
	ld (hl),b		;e55f
	ld hl,0e7c1h		;e560
	call L_E5C0		;e563
	ld b,h			;e566
	ld c,l			;e567
	jp L_E222		;e568
L_E56B:
	ld a,(0ee19h)		;e56b
	add a,a			;e56e
	ld l,a			;e56f
	ld h,000h		;e570
	ld de,0ee1bh		;e572
	add hl,de		;e575
	ld c,(hl)		;e576
	inc hl			;e577
	ld b,(hl)		;e578
	jp L_E222		;e579
L_E57C:
	inc bc			;e57c
	call L_E586		;e57d
	ld a,(bc)		;e580
	inc bc			;e581
	ld (hl),a		;e582
	jp L_E222		;e583
L_E586:
	ld a,(0ee19h)		;e586
	ld l,a			;e589
	ld h,000h		;e58a
	ld de,0ee21h		;e58c
	add hl,de		;e58f
	ret			;e590
L_E591:
	ld hl,00000h		;e591
	and a			;e594
	ret z			;e595
	push bc			;e596
	ld b,008h		;e597
L_E599:
	srl a			;e599
	jr nc,L_E59E		;e59b
	add hl,de		;e59d
L_E59E:
	sla e			;e59e
	rl d			;e5a0
	djnz L_E599		;e5a2
	pop bc			;e5a4
	ret			;e5a5
L_E5A6:
	push af			;e5a6
	ld hl,00000h		;e5a7
	ld a,b			;e5aa
	ld b,010h		;e5ab
L_E5AD:
	rl c			;e5ad
	rla			;e5af
	adc hl,hl		;e5b0
	sbc hl,de		;e5b2
	jr nc,L_E5B7		;e5b4
	add hl,de		;e5b6
L_E5B7:
	ccf			;e5b7
	djnz L_E5AD		;e5b8
	rl c			;e5ba
	rla			;e5bc
	ld b,a			;e5bd
	pop af			;e5be
	ret			;e5bf
L_E5C0:
	push af			;e5c0
	add a,a			;e5c1
	add a,l			;e5c2
	ld l,a			;e5c3
	jr nc,L_E5C7		;e5c4
	inc h			;e5c6
L_E5C7:
	ld a,(hl)		;e5c7
	inc hl			;e5c8
	ld h,(hl)		;e5c9
	ld l,a			;e5ca
	pop af			;e5cb
	ret			;e5cc
L_E5CD:
	ld hl,0ee0dh		;e5cd
	ld a,000h		;e5d0
	ld d,00bh		;e5d2
L_E5D4:
	push af			;e5d4
	ld c,(hl)		;e5d5
	out (0a0h),a		;e5d6
	ld a,c			;e5d8
	out (0a1h),a		;e5d9
	pop af			;e5db
	inc a			;e5dc
	inc hl			;e5dd
	dec d			;e5de
	jr nz,L_E5D4		;e5df
	ret			;e5e1

; ----------------------------------------------------------------------
; DATOS relleno: o resto (5 B; 5 bytes)
;   0xe5e2..0xe5e7  (5 bytes)
; ----------------------------------------------------------------------
	defb 001h,00bh,032h,000h,000h	; e5e2  ..2..

; ======================================================================
; CODIGO 0xe5e7..0xe7a3  (444 bytes)
; ======================================================================


L_E5E7:
	inc b			;e5e7
	rst 38h			;e5e8
	ex af,af'		;e5e9
	nop			;e5ea
	nop			;e5eb
	nop			;e5ec
	inc bc			;e5ed
	nop			;e5ee
	nop			;e5ef
	nop			;e5f0
	ld (bc),a		;e5f1
	dec bc			;e5f2
	ld bc,00001h		;e5f3
	ld (bc),a		;e5f6
	rst 38h			;e5f7
	inc b			;e5f8
	cp 000h			;e5f9
	ld (bc),a		;e5fb
	rlca			;e5fc
	nop			;e5fd
	nop			;e5fe
	nop			;e5ff
	ld a,(bc)		;e600
	nop			;e601
	nop			;e602
	nop			;e603
	nop			;e604
	rst 38h			;e605
	nop			;e606
	nop			;e607
	nop			;e608
	nop			;e609
	inc bc			;e60a
	nop			;e60b
	nop			;e60c
	nop			;e60d
	nop			;e60e
	ld bc,0030ah		;e60f
	inc bc			;e612
	nop			;e613
	ld a,(bc)		;e614
	rst 38h			;e615
	ld bc,000ffh		;e616
	nop			;e619
	nop			;e61a
	nop			;e61b
	nop			;e61c
	nop			;e61d
	dec bc			;e61e
	dec bc			;e61f
	ld bc,00001h		;e620
	ld bc,02affh		;e623
	sub 000h		;e626
	inc bc			;e628
	inc b			;e629
	nop			;e62a
	nop			;e62b
	nop			;e62c
	dec b			;e62d
	nop			;e62e
	ld e,000h		;e62f
	nop			;e631
	cp 000h			;e632
	adc a,b			;e634
	nop			;e635
	nop			;e636
	nop			;e637
	nop			;e638
	nop			;e639
	nop			;e63a
	nop			;e63b
	ld b,00ch		;e63c
	ld e,000h		;e63e
	nop			;e640
	ld (bc),a		;e641
	rst 38h			;e642
	nop			;e643
	nop			;e644
	nop			;e645
	ld bc,00304h		;e646
	nop			;e649
	nop			;e64a
	inc c			;e64b
	rrca			;e64c
	jr z,$+3		;e64d
	ld (0ff01h),a		;e64f
	jp (hl)			;e652
	nop			;e653
	rla			;e654
	inc bc			;e655
	inc bc			;e656
	nop			;e657
	nop			;e658
	nop			;e659
	ld a,(bc)		;e65a
	nop			;e65b
	nop			;e65c
	nop			;e65d
	nop			;e65e
	rst 38h			;e65f
	nop			;e660
	nop			;e661
	nop			;e662
	nop			;e663
	ld (bc),a		;e664
	nop			;e665
	nop			;e666
	nop			;e667
	nop			;e668
	ld bc,00001h		;e669
	nop			;e66c
	nop			;e66d
	nop			;e66e
	ld sp,hl		;e66f
	nop			;e670
	nop			;e671
	nop			;e672
	inc bc			;e673
	nop			;e674
	nop			;e675
	nop			;e676
	nop			;e677
	ld b,000h		;e678
	nop			;e67a
	nop			;e67b
	nop			;e67c
	rst 38h			;e67d
	nop			;e67e
	nop			;e67f
	nop			;e680
	nop			;e681
	ld a,(bc)		;e682
	nop			;e683
	nop			;e684
	nop			;e685
	nop			;e686
	inc bc			;e687
	inc c			;e688
	nop			;e689
	nop			;e68a
	nop			;e68b
	ld bc,000ffh		;e68c
	nop			;e68f
	nop			;e690
	ld a,(bc)		;e691
	ld a,(bc)		;e692
	nop			;e693
	nop			;e694
	nop			;e695
	ld bc,00f06h		;e696
	nop			;e699
	nop			;e69a
	inc b			;e69b
	rst 38h			;e69c
	inc d			;e69d
	nop			;e69e
	nop			;e69f
	nop			;e6a0
	inc bc			;e6a1
	ld bc,00000h		;e6a2
	rrca			;e6a5
	nop			;e6a6
	nop			;e6a7
	nop			;e6a8
	nop			;e6a9
	rst 38h			;e6aa
	nop			;e6ab
	nop			;e6ac
	nop			;e6ad
	nop			;e6ae
	nop			;e6af
	nop			;e6b0
	nop			;e6b1
	nop			;e6b2
	nop			;e6b3
	rrca			;e6b4
	nop			;e6b5
	nop			;e6b6
	nop			;e6b7
	nop			;e6b8
	rst 38h			;e6b9
	nop			;e6ba
	nop			;e6bb
	nop			;e6bc
	nop			;e6bd
	inc b			;e6be
	nop			;e6bf
	nop			;e6c0
	nop			;e6c1
	nop			;e6c2
	ld (bc),a		;e6c3
	ld bc,00000h		;e6c4
	nop			;e6c7
	cp 002h			;e6c8
	nop			;e6ca
	nop			;e6cb
	nop			;e6cc
	ld bc,00002h		;e6cd
	nop			;e6d0
	nop			;e6d1
	jr nz,L_E6D4		;e6d2
L_E6D4:
	ld bc,00200h		;e6d4
	nop			;e6d7
	ld bc,01008h		;e6d8
	cp 000h			;e6db
	nop			;e6dd
	jr nz,L_E6E0		;e6de
L_E6E0:
	rst 38h			;e6e0
	nop			;e6e1
	inc d			;e6e2
	ld e,l			;e6e3
	dec c			;e6e4
	sbc a,l			;e6e5
	inc c			;e6e6
	rst 20h			;e6e7
	dec bc			;e6e8
	inc a			;e6e9
	dec bc			;e6ea
	sbc a,e			;e6eb
	ld a,(bc)		;e6ec
	inc bc			;e6ed
	ld a,(bc)		;e6ee
	ld (hl),e		;e6ef
	add hl,bc		;e6f0
	ex de,hl		;e6f1
	ex af,af'		;e6f2
	ld l,e			;e6f3
	ex af,af'		;e6f4
	jp p,L_8007		;e6f5
	rlca			;e6f8
	inc d			;e6f9
	rlca			;e6fa
	xor (hl)		;e6fb
	ld b,04eh		;e6fc
	ld b,0f4h		;e6fe
	dec b			;e700
	sbc a,(hl)		;e701
	dec b			;e702
	ld c,l			;e703
	dec b			;e704
	ld bc,0b905h		;e705
	inc b			;e708
	ld (hl),l		;e709
	inc b			;e70a
	dec (hl)		;e70b
	inc b			;e70c
	ld sp,hl		;e70d
	inc bc			;e70e
	ret nz			;e70f
	inc bc			;e710
	adc a,d			;e711
	inc bc			;e712
	ld d,a			;e713
	inc bc			;e714
	daa			;e715
	inc bc			;e716
	jp m,L_CF02		;e717
	ld (bc),a		;e71a
	and a			;e71b
	ld (bc),a		;e71c
	add a,c			;e71d
	ld (bc),a		;e71e
	ld e,l			;e71f
	ld (bc),a		;e720
	dec sp			;e721
	ld (bc),a		;e722
	dec de			;e723
	ld (bc),a		;e724
	call m,L_E001		;e725
	ld bc,001c5h		;e728
	xor h			;e72b
	ld bc,00194h		;e72c
	ld a,l			;e72f
	ld bc,00168h		;e730
	ld d,e			;e733
	ld bc,00140h		;e734
	ld l,001h		;e737
	dec e			;e739
	ld bc,0010dh		;e73a
	cp 000h			;e73d
	ret p			;e73f
	nop			;e740
	jp po,L_D600		;e741
	nop			;e744
	jp z,L_BE00		;e745
	nop			;e748
	or h			;e749
	nop			;e74a
	xor d			;e74b
	nop			;e74c
	and b			;e74d
	nop			;e74e
	sub a			;e74f
	nop			;e750
	adc a,a			;e751
	nop			;e752
	add a,a			;e753
	nop			;e754
	ld a,a			;e755
	nop			;e756
	ld a,b			;e757
	nop			;e758
	ld (hl),c		;e759
	nop			;e75a
	ld l,e			;e75b
	nop			;e75c
	ld h,l			;e75d
	nop			;e75e
	ld e,a			;e75f
	nop			;e760
	ld e,d			;e761
	nop			;e762
	ld d,l			;e763
	nop			;e764
	ld d,b			;e765
	nop			;e766
	ld c,h			;e767
	nop			;e768
	ld b,a			;e769
	nop			;e76a
	ld b,e			;e76b
	nop			;e76c
	ld b,b			;e76d
	nop			;e76e
	inc a			;e76f
	nop			;e770
	add hl,sp		;e771
	nop			;e772
	dec (hl)		;e773
	nop			;e774
	ld (03000h),a		;e775
	nop			;e778
	dec l			;e779
	nop			;e77a
	ld hl,(02800h)		;e77b
	nop			;e77e
	ld h,000h		;e77f
	inc h			;e781
	nop			;e782
	ld (02000h),hl		;e783
	nop			;e786
L_E787:
	ld e,000h		;e787
	inc e			;e789
L_E78A:
	nop			;e78a
	dec de			;e78b
	nop			;e78c
	add hl,de		;e78d
	nop			;e78e
L_E78F:
	jr L_E791		;e78f
L_E791:
	ld d,000h		;e791
	dec d			;e793
	nop			;e794
	inc d			;e795
L_E796:
	nop			;e796
	inc de			;e797
	nop			;e798
	ld (de),a		;e799
	nop			;e79a
	ld de,01000h		;e79b
	nop			;e79e
L_E79F:
	rrca			;e79f
	nop			;e7a0
	ld c,000h		;e7a1

; ----------------------------------------------------------------------
; DATOS tabla: de saltos de los 35 opcodes del interprete
;   0xe7a3..0xe7e9  (70 bytes)
; ----------------------------------------------------------------------
	defb 0efh,0e3h,00dh,0e4h,077h,0e4h,0f8h,0e3h,073h,0e4h,045h,0e4h,046h,0e5h,0a6h,0e4h	; e7a3  ....w...s.E.F...
	defb 05fh,0e4h,0efh,0e4h,092h,0e4h,018h,0e4h,04fh,0e5h,06bh,0e5h,07ch,0e5h,046h,0e8h	; e7b3  _.......O.k.|.F.
	defb 0e9h,0e7h,0f6h,0e7h,010h,0e8h,01fh,0e8h,02ch,0e8h,039h,0e8h,08fh,0e8h,0a2h,0e8h	; e7c3  ........,.9.....
	defb 0b5h,0e8h,0c8h,0e8h,0dbh,0e8h,02ah,0e9h,071h,0e9h,087h,0e9h,09dh,0e9h,0dch,0e9h	; e7d3  ......*.q.......
	defb 0fah,0e9h,014h,0eah,038h,0eah	; e7e3  ....8.

; ======================================================================
; CODIGO 0xe7e9..0xe7f4  (11 bytes)
; ======================================================================


L_E7E9:
	add a,a			;e7e9
	ex af,af'		;e7ea
	add a,b			;e7eb
	rrca			;e7ec
	add a,e			;e7ed
	djnz $+26		;e7ee
	add a,b			;e7f0
	inc c			;e7f1
	jr $+26			;e7f2

; ----------------------------------------------------------------------
; DATOS relleno: o resto (2 B; 2 bytes)
;   0xe7f4..0xe7f6  (2 bytes)
; ----------------------------------------------------------------------
	defb 018h,08dh	; e7f4  ..

; ======================================================================
; CODIGO 0xe7f6..0xe80b  (21 bytes)
; ======================================================================


L_E7F6:
	add a,c			;e7f6
	ex af,af'		;e7f7
	add a,a			;e7f8
L_E7F9:
	ld a,(bc)		;e7f9
	adc a,c			;e7fa
	nop			;e7fb
	add a,b			;e7fc
	ex af,af'		;e7fd
	add a,e			;e7fe
	jr nz,$-122		;e7ff
	adc a,b			;e801
	jr $-123		;e802
	djnz $-122		;e804
	add a,e			;e806
	ex af,af'		;e807
L_E808:
	adc a,b			;e808
	jr $-122		;e809

; ----------------------------------------------------------------------
; DATOS relleno: o resto (1 B; 1 bytes)
;   0xe80b..0xe80c  (1 bytes)
; ----------------------------------------------------------------------
	defb 083h	; e80b  .

; ======================================================================
; CODIGO 0xe80c..0xe8c0  (180 bytes)
; ======================================================================


L_E80C:
	jr nz,$-118		;e80c
	jr $-113		;e80e
L_E810:
	add a,a			;e810
	add hl,bc		;e811
	add a,b			;e812
	rlca			;e813
	add a,e			;e814
	ex af,af'		;e815
	jr nc,$+62		;e816
	ld c,b			;e818
	ld d,h			;e819
	scf			;e81a
	ld b,e			;e81b
	ld c,d			;e81c
	ld c,b			;e81d
	adc a,l			;e81e
L_E81F:
	add a,a			;e81f
	ex af,af'		;e820
	add a,b			;e821
	rrca			;e822
	add a,e			;e823
	djnz L_E847		;e824
	add a,b			;e826
	inc c			;e827
	ld hl,02121h		;e828
	adc a,l			;e82b
L_E82C:
	add a,a			;e82c
	ex af,af'		;e82d
	add a,b			;e82e
	rrca			;e82f
	add a,e			;e830
	djnz L_E850		;e831
	add a,b			;e833
	inc c			;e834
	dec e			;e835
	dec e			;e836
	dec e			;e837
	adc a,l			;e838
L_E839:
	add a,a			;e839
	ex af,af'		;e83a
	add a,b			;e83b
	rrca			;e83c
	add a,e			;e83d
	djnz $+33		;e83e
	add a,b			;e840
	inc c			;e841
	rra			;e842
	rra			;e843
	rra			;e844
	adc a,l			;e845
L_E846:
	add a,a			;e846
L_E847:
	dec bc			;e847
	add a,e			;e848
	djnz $-119		;e849
	ld a,(bc)		;e84b
	jr nc,L_E879		;e84c
	jr nc,$-123		;e84e
L_E850:
	jr nz,$+52		;e850
	add a,e			;e852
	djnz L_E887		;e853
	inc (hl)		;e855
	ld (02d30h),a		;e856
	dec hl			;e859
	add a,e			;e85a
	ld d,b			;e85b
	dec l			;e85c
	add a,e			;e85d
	djnz L_E890		;e85e
	dec hl			;e860
	jr nc,$-123		;e861
	jr nz,L_E897		;e863
	add a,e			;e865
	djnz $+52		;e866
	inc (hl)		;e868
	ld (02d30h),a		;e869
	dec hl			;e86c
	add a,e			;e86d
	ld d,b			;e86e
	dec l			;e86f
	add a,e			;e870
	djnz L_E8A8		;e871
	inc (hl)		;e873
	jr nc,$-123		;e874
	jr nc,L_E8A1		;e876
	add a,e			;e878
L_E879:
	djnz L_E8B0		;e879
	add a,e			;e87b
	jr nz,$+54		;e87c
	jr nc,$-123		;e87e
	ld b,b			;e880
	scf			;e881
	add a,e			;e882
	djnz L_E8BC		;e883
	dec (hl)		;e885
L_E886:
	inc (hl)		;e886
L_E887:
	jr nc,L_E8B4		;e887
L_E889:
	add hl,hl		;e889
	jr z,$-123		;e88a
L_E88C:
	and b			;e88c
	inc h			;e88d
	adc a,l			;e88e
L_E88F:
	add a,e			;e88f
L_E890:
	ex af,af'		;e890
	ld hl,02d21h		;e891
	ld hl,02d2bh		;e894
L_E897:
	add a,h			;e897
	rra			;e898
	ld hl,02d21h		;e899
	ld hl,02d2dh		;e89c
	ld h,028h		;e89f
L_E8A1:
	adc a,l			;e8a1
L_E8A2:
	add a,e			;e8a2
	ex af,af'		;e8a3
	dec e			;e8a4
L_E8A5:
	dec e			;e8a5
	add hl,hl		;e8a6
	dec e			;e8a7
L_E8A8:
	daa			;e8a8
	add hl,hl		;e8a9
	add a,h			;e8aa
	dec de			;e8ab
	dec e			;e8ac
	dec e			;e8ad
	add hl,hl		;e8ae
	dec e			;e8af
L_E8B0:
	daa			;e8b0
	jr $+36			;e8b1
	inc h			;e8b3
L_E8B4:
	adc a,l			;e8b4
L_E8B5:
	add a,e			;e8b5
	ex af,af'		;e8b6
	ld a,(de)		;e8b7
	ld a,(de)		;e8b8
	ld h,01ah		;e8b9
	inc h			;e8bb
L_E8BC:
	ld h,084h		;e8bc
	jr $+28			;e8be

; ----------------------------------------------------------------------
; DATOS tabla: (8 B; racha 2.13, entropia 2.50, 6 valores: pocos valores para ser un dibujo)
;   0xe8c0..0xe8c8  (8 bytes)
; ----------------------------------------------------------------------
	defb 01ah,026h,01ah,024h,026h,01fh,021h,08dh	; e8c0  .&.$&.!.

; ======================================================================
; CODIGO 0xe8c8..0xe922  (90 bytes)
; ======================================================================


L_E8C8:
	add a,e			;e8c8
	ex af,af'		;e8c9
	inc e			;e8ca
	inc e			;e8cb
	jr z,L_E8EA		;e8cc
	ld h,028h		;e8ce
	add a,h			;e8d0
	ld a,(de)		;e8d1
	inc e			;e8d2
	inc e			;e8d3
	jr z,L_E8F9		;e8d4
	ld h,028h		;e8d6
	inc e			;e8d8
	rra			;e8d9
L_E8DA:
	adc a,l			;e8da
L_E8DB:
	add a,a			;e8db
	ld a,(bc)		;e8dc
	add a,e			;e8dd
	ex af,af'		;e8de
	add hl,sp		;e8df
	dec l			;e8e0
	add hl,sp		;e8e1
	dec l			;e8e2
	scf			;e8e3
	inc (hl)		;e8e4
	scf			;e8e5
	add hl,sp		;e8e6
	add a,h			;e8e7
	add a,a			;e8e8
	inc c			;e8e9
L_E8EA:
	ld hl,01083h		;e8ea
	dec hl			;e8ed
	add a,e			;e8ee
	jr nz,L_E912		;e8ef
	add a,a			;e8f1
	ld a,(bc)		;e8f2
	add a,e			;e8f3
	ex af,af'		;e8f4
	add hl,sp		;e8f5
	ld (03239h),a		;e8f6
L_E8F9:
	scf			;e8f9
	inc (hl)		;e8fa
	scf			;e8fb
	add a,e			;e8fc
	jr z,$+59		;e8fd
	add a,e			;e8ff
	jr nz,$-119		;e900
	inc c			;e902
	rra			;e903
	add a,a			;e904
	ld a,(bc)		;e905
	add a,e			;e906
	ex af,af'		;e907
	ld a,032h		;e908
	ld b,b			;e90a
	ld (03c3eh),a		;e90b
	add hl,sp		;e90e
	inc a			;e90f
	ld a,032h		;e910
L_E912:
	ld b,b			;e912
	ld (03c3eh),a		;e913
	add hl,sp		;e916
	inc a			;e917
	ld b,b			;e918
	inc (hl)		;e919
	ld b,b			;e91a
	inc (hl)		;e91b
	ld a,03bh		;e91c
	ld a,083h		;e91e
	jr $-123		;e920

; ----------------------------------------------------------------------
; DATOS tabla: (8 B; racha 2.46, entropia 3.00, 8 valores: pocos valores para ser un dibujo)
;   0xe922..0xe92a  (8 bytes)
; ----------------------------------------------------------------------
	defb 028h,040h,083h,020h,087h,00ch,030h,08dh	; e922  (@. ..0.

; ======================================================================
; CODIGO 0xe92a..0xe97e  (84 bytes)
; ======================================================================


L_E92A:
	add a,a			;e92a
	dec bc			;e92b
	adc a,d			;e92c
	ld bc,06083h		;e92d
	add hl,sp		;e930
	add a,a			;e931
	ex af,af'		;e932
	add a,b			;e933
	dec c			;e934
	add a,e			;e935
	ex af,af'		;e936
	inc a			;e937
L_E938:
	dec sp			;e938
	add hl,sp		;e939
	scf			;e93a
L_E93B:
	add a,a			;e93b
	dec bc			;e93c
	add a,b			;e93d
	ld a,(bc)		;e93e
	add a,e			;e93f
	ld h,b			;e940
	add hl,sp		;e941
	add a,a			;e942
	ex af,af'		;e943
	add a,b			;e944
	dec c			;e945
	add a,e			;e946
	ex af,af'		;e947
	inc a			;e948
	dec sp			;e949
	add hl,sp		;e94a
	scf			;e94b
	add a,b			;e94c
	ld a,(bc)		;e94d
	add a,a			;e94e
	dec bc			;e94f
	add a,e			;e950
	ld h,b			;e951
	dec (hl)		;e952
	add a,b			;e953
	dec c			;e954
	add a,a			;e955
	ex af,af'		;e956
	add a,e			;e957
	ex af,af'		;e958
L_E959:
	dec (hl)		;e959
	add hl,sp		;e95a
	inc a			;e95b
	add hl,sp		;e95c
	add a,b			;e95d
	ld a,(bc)		;e95e
	add a,a			;e95f
	dec bc			;e960
	add a,e			;e961
	ld h,b			;e962
	dec sp			;e963
	add a,a			;e964
	ex af,af'		;e965
	add a,e			;e966
	ex af,af'		;e967
	add a,b			;e968
L_E969:
	dec c			;e969
	ld b,b			;e96a
	inc (hl)		;e96b
	ld a,040h		;e96c
	add a,b			;e96e
	ld a,(bc)		;e96f
	adc a,l			;e970
L_E971:
	add a,a			;e971
	ex af,af'		;e972
	add a,b			;e973
	rrca			;e974
	add a,e			;e975
	djnz $+26		;e976
	add a,b			;e978
	inc c			;e979
	add a,e			;e97a
	ex af,af'		;e97b
	jr $+26			;e97c

; ----------------------------------------------------------------------
; DATOS tabla: (9 B; racha 3.43, entropia 2.95, 8 valores: pocos valores para ser un dibujo)
;   0xe97e..0xe987  (9 bytes)
; ----------------------------------------------------------------------
	defb 080h,00fh,083h,010h,018h,080h,00ch,013h,08dh	; e97e  .........

; ======================================================================
; CODIGO 0xe987..0xeab9  (306 bytes)
; ======================================================================


L_E987:
	add a,a			;e987
	ex af,af'		;e988
	add a,b			;e989
	rrca			;e98a
	add a,e			;e98b
	djnz L_E9A8		;e98c
	add a,b			;e98e
	inc c			;e98f
L_E990:
	add a,e			;e990
L_E991:
	ex af,af'		;e991
	ld a,(de)		;e992
	ld a,(de)		;e993
	add a,b			;e994
	rrca			;e995
L_E996:
	add a,e			;e996
	djnz $+28		;e997
	add a,b			;e999
	inc c			;e99a
	dec d			;e99b
	adc a,l			;e99c
L_E99D:
	add a,c			;e99d
	ld bc,00987h		;e99e
	add a,e			;e9a1
	ex af,af'		;e9a2
	add a,b			;e9a3
L_E9A4:
	add hl,bc		;e9a4
	jr nc,L_E9DE		;e9a5
	inc a			;e9a7
L_E9A8:
	scf			;e9a8
	ld a,03ch		;e9a9
	ld (hl),03eh		;e9ab
	jr nc,$+62		;e9ad
	ld (hl),037h		;e9af
L_E9B1:
	add a,e			;e9b1
	jr nz,$-119		;e9b2
	ld a,(bc)		;e9b4
	add a,c			;e9b5
	ex af,af'		;e9b6
	adc a,b			;e9b7
	inc c			;e9b8
	add a,c			;e9b9
	ld bc,00987h		;e9ba
	add a,a			;e9bd
	add hl,bc		;e9be
	add a,e			;e9bf
	ex af,af'		;e9c0
	add a,b			;e9c1
	add hl,bc		;e9c2
	jr nc,L_E9FC		;e9c3
	inc a			;e9c5
	scf			;e9c6
	ld a,03ch		;e9c7
	ld (hl),03eh		;e9c9
	jr nc,L_EA09		;e9cb
	ld (hl),037h		;e9cd
	add a,e			;e9cf
	jr nz,$-119		;e9d0
	ld a,(bc)		;e9d2
	add a,c			;e9d3
	ex af,af'		;e9d4
	adc a,b			;e9d5
	ld (de),a		;e9d6
	add a,c			;e9d7
	ld bc,00987h		;e9d8
	adc a,l			;e9db
L_E9DC:
	add a,a			;e9dc
	ld a,(bc)		;e9dd
L_E9DE:
	add a,e			;e9de
	jr nc,L_EA11		;e9df
	add a,e			;e9e1
	ex af,af'		;e9e2
	dec hl			;e9e3
	jr nc,$-123		;e9e4
	jr nc,L_EA1A		;e9e6
	add a,e			;e9e8
	ex af,af'		;e9e9
	jr nc,L_EA1E		;e9ea
	add a,e			;e9ec
	jr nc,$+57		;e9ed
	add a,e			;e9ef
	ex af,af'		;e9f0
	dec (hl)		;e9f1
	inc (hl)		;e9f2
	add a,e			;e9f3
	djnz $+55		;e9f4
	inc (hl)		;e9f6
	jr nc,L_EA24		;e9f7
	adc a,l			;e9f9
L_E9FA:
	add a,b			;e9fa
	inc c			;e9fb
L_E9FC:
	add a,a			;e9fc
	ld a,(bc)		;e9fd
	add a,e			;e9fe
	jr nc,$+50		;e9ff
L_EA01:
	add a,e			;ea01
	ex af,af'		;ea02
	add a,a			;ea03
	ex af,af'		;ea04
	scf			;ea05
	scf			;ea06
	add a,b			;ea07
	rrca			;ea08
L_EA09:
	ld (hl),083h		;ea09
	jr z,L_E991		;ea0b
	add a,e			;ea0d
	ex af,af'		;ea0e
	add a,b			;ea0f
	dec c			;ea10
L_EA11:
	dec hl			;ea11
	dec hl			;ea12
	adc a,l			;ea13
L_EA14:
	add a,a			;ea14
	rrca			;ea15
	adc a,d			;ea16
	ld bc,02083h		;ea17
L_EA1A:
	jr nc,L_EA53		;ea1a
	ld (hl),032h		;ea1c
L_EA1E:
	inc (hl)		;ea1e
	jr nc,L_E9A4		;ea1f
	djnz L_EA53		;ea21
	dec sp			;ea23
L_EA24:
	ld a,(08339h)		;ea24
	jr nz,L_EA5B		;ea27
	scf			;ea29
	ld (hl),039h		;ea2a
	jr c,L_E9B1		;ea2c
	ex af,af'		;ea2e
	ld (03637h),a		;ea2f
	add hl,sp		;ea32
	add a,e			;ea33
	jr nz,L_EA6E		;ea34
	add hl,sp		;ea36
	adc a,l			;ea37
L_EA38:
	add a,l			;ea38
	and b			;ea39
	add a,e			;ea3a
	inc c			;ea3b
	add a,c			;ea3c
	ld bc,00780h		;ea3d
	add a,a			;ea40
	nop			;ea41
	ld d,b			;ea42
	adc a,e			;ea43
	add a,l			;ea44
	and b			;ea45
	add a,e			;ea46
	add hl,de		;ea47
	add a,c			;ea48
	ld bc,00780h		;ea49
	add a,a			;ea4c
	ld bc,0028ah		;ea4d
	ld b,(hl)		;ea50
	adc a,e			;ea51
	add a,l			;ea52
L_EA53:
	and b			;ea53
	add a,e			;ea54
	ld bc,00881h		;ea55
	add a,b			;ea58
	rrca			;ea59
	adc a,b			;ea5a
L_EA5B:
	add hl,de		;ea5b
	add a,e			;ea5c
L_EA5D:
	ld a,(bc)		;ea5d
	add a,b			;ea5e
	ld a,(bc)		;ea5f
	add a,a			;ea60
	ld (bc),a		;ea61
	adc a,b			;ea62
	rra			;ea63
	adc a,e			;ea64
	add a,l			;ea65
	and b			;ea66
	add a,e			;ea67
	inc bc			;ea68
	add a,c			;ea69
	ld bc,00580h		;ea6a
	add a,a			;ea6d
L_EA6E:
	inc bc			;ea6e
	adc a,d			;ea6f
	ld (bc),a		;ea70
	ld e,d			;ea71
	adc a,e			;ea72
	add a,l			;ea73
	ld e,083h		;ea74
	dec b			;ea76
	add a,c			;ea77
	ld bc,00080h		;ea78
	add a,a			;ea7b
	inc b			;ea7c
	adc a,d			;ea7d
	ld (bc),a		;ea7e
	ld d,b			;ea7f
	adc a,e			;ea80
	add a,l			;ea81
	rst 38h			;ea82
	add a,e			;ea83
	ld (bc),a		;ea84
	add a,c			;ea85
	ex af,af'		;ea86
	add a,b			;ea87
	rrca			;ea88
	adc a,b			;ea89
	rrca			;ea8a
	adc a,e			;ea8b
	add a,l			;ea8c
	rst 38h			;ea8d
	add a,e			;ea8e
	ld (bc),a		;ea8f
	add a,c			;ea90
	ld bc,00f80h		;ea91
	add a,a			;ea94
	dec b			;ea95
	dec l			;ea96
	adc a,e			;ea97
	add a,(hl)		;ea98
	add a,e			;ea99
	ld bc,00181h		;ea9a
	add a,b			;ea9d
	ld a,(bc)		;ea9e
	ld e,d			;ea9f
	adc a,e			;eaa0
	add a,(hl)		;eaa1
L_EAA2:
	add a,e			;eaa2
	ld bc,00181h		;eaa3
	add a,b			;eaa6
	ld a,(bc)		;eaa7
	ld (0868bh),a		;eaa8
	add a,b			;eaab
	inc c			;eaac
	add a,a			;eaad
	ex af,af'		;eaae
	adc a,d			;eaaf
	nop			;eab0
	add a,c			;eab1
	ld bc,00483h		;eab2
	adc a,(hl)		;eab5
	dec b			;eab6
	jr $+38			;eab7

; ----------------------------------------------------------------------
; DATOS tabla: (36 B; racha 2.36, entropia 3.97, 21 valores: pocos valores para ser un dibujo)
;   0xeab9..0xeadd  (36 bytes)
; ----------------------------------------------------------------------
	defb 018h,024h,018h,024h,018h,024h,01dh,029h,01fh,02bh,018h,024h,018h,018h,018h,08bh	; eab9  .$.$.$.).+.$....
	defb 080h,00ch,087h,008h,08ah,000h,081h,001h,083h,004h,08eh,005h,028h,02bh,030h,02bh	; eac9  ............(+0+
	defb 028h,02bh,030h,02bh	; ead9  (+0+

; ======================================================================
; CODIGO 0xeadd..0xf07b  (1438 bytes)
; ======================================================================


L_EADD:
	dec l			;eadd
	jr nc,$+49		;eade
	ld (02b2bh),a		;eae0
	dec hl			;eae3
	adc a,e			;eae4
	add a,b			;eae5
	rrca			;eae6
	add a,a			;eae7
	rrca			;eae8
	adc a,d			;eae9
	ld bc,00181h		;eaea
	add a,e			;eaed
	inc b			;eaee
	adc a,(hl)		;eaef
	dec b			;eaf0
	ld b,e			;eaf1
	ld b,b			;eaf2
	ld b,e			;eaf3
	ld b,b			;eaf4
	add a,e			;eaf5
	inc c			;eaf6
	ld b,e			;eaf7
	add a,e			;eaf8
	inc b			;eaf9
	ld b,b			;eafa
	add a,e			;eafb
	djnz $+64		;eafc
	inc a			;eafe
	adc a,e			;eaff
	add a,(hl)		;eb00
	add a,e			;eb01
	ld e,081h		;eb02
	ex af,af'		;eb04
	add a,b			;eb05
	rrca			;eb06
	adc a,c			;eb07
	ld (bc),a		;eb08
	adc a,b			;eb09
	ld e,083h		;eb0a
	ld d,b			;eb0c
	add a,a			;eb0d
	ld c,088h		;eb0e
	rra			;eb10
	adc a,e			;eb11
	add a,e			;eb12
	rrca			;eb13
	add a,c			;eb14
	ex af,af'		;eb15
	add a,b			;eb16
	rrca			;eb17
	adc a,b			;eb18
	ld e,083h		;eb19
	rrca			;eb1b
	add a,a			;eb1c
	dec c			;eb1d
	adc a,b			;eb1e
	rra			;eb1f
	adc a,e			;eb20
	add a,c			;eb21
	ex af,af'		;eb22
	add a,b			;eb23
	rrca			;eb24
	add a,e			;eb25
	rrca			;eb26
	add a,a			;eb27
	dec c			;eb28
	adc a,b			;eb29
	rra			;eb2a
	adc a,e			;eb2b
	add a,(hl)		;eb2c
	add a,e			;eb2d
	ld bc,00181h		;eb2e
	add a,b			;eb31
	ld a,(bc)		;eb32
	ld a,(08484h)		;eb33
	add a,h			;eb36
	adc a,e			;eb37
	add a,(hl)		;eb38
	add a,e			;eb39
	ld bc,00181h		;eb3a
	add a,b			;eb3d
	ld a,(bc)		;eb3e
	ld c,h			;eb3f
	add a,h			;eb40
	add a,d			;eb41
	add a,l			;eb42
	and b			;eb43
	add a,e			;eb44
	inc d			;eb45
	add a,c			;eb46
	add hl,bc		;eb47
	add a,b			;eb48
	nop			;eb49
	add a,a			;eb4a
	ld b,089h		;eb4b
	nop			;eb4d
	adc a,b			;eb4e
	add a,b			;eb4f
	jr z,L_EADD		;eb50
	adc a,(hl)		;eb52
	ld (bc),a		;eb53
	add a,(hl)		;eb54
	add a,c			;eb55
	ld bc,0018ch		;eb56
	adc a,h			;eb59
	ld bc,0048ch		;eb5a
	adc a,h			;eb5d
	inc b			;eb5e
	adc a,h			;eb5f
	ld bc,0018ch		;eb60
	adc a,h			;eb63
	inc b			;eb64
	adc a,h			;eb65
	inc b			;eb66
	adc a,h			;eb67
	dec b			;eb68
	adc a,h			;eb69
	dec b			;eb6a
	adc a,h			;eb6b
	ld b,08ch		;eb6c
	ld b,08ch		;eb6e
	ld bc,0018ch		;eb70
	adc a,h			;eb73
	ld bc,0018ch		;eb74
	add a,(hl)		;eb77
	add a,c			;eb78
	ld bc,0018ch		;eb79
	adc a,h			;eb7c
	ld bc,0048ch		;eb7d
	adc a,h			;eb80
	inc b			;eb81
	adc a,h			;eb82
	ld bc,0018ch		;eb83
	adc a,h			;eb86
	inc b			;eb87
	adc a,h			;eb88
	inc b			;eb89
	adc a,h			;eb8a
	dec b			;eb8b
	adc a,h			;eb8c
	dec b			;eb8d
	adc a,h			;eb8e
	ld b,08ch		;eb8f
	ld b,08ch		;eb91
	ld bc,0018ch		;eb93
	adc a,h			;eb96
	ld bc,0018ch		;eb97
	add a,(hl)		;eb9a
	add a,c			;eb9b
	ld bc,0018ch		;eb9c
	adc a,h			;eb9f
	ld bc,0048ch		;eba0
	adc a,h			;eba3
	inc b			;eba4
	adc a,h			;eba5
	ld bc,0018ch		;eba6
	adc a,h			;eba9
	inc b			;ebaa
	adc a,h			;ebab
	inc b			;ebac
	adc a,h			;ebad
	dec b			;ebae
	adc a,h			;ebaf
	dec b			;ebb0
	adc a,h			;ebb1
	ld b,08ch		;ebb2
	ld b,08ch		;ebb4
	ld bc,0018ch		;ebb6
	adc a,h			;ebb9
	ld bc,0018ch		;ebba
	add a,b			;ebbd
	dec c			;ebbe
	adc a,h			;ebbf
	rlca			;ebc0
	adc a,h			;ebc1
	ex af,af'		;ebc2
	adc a,h			;ebc3
	add hl,bc		;ebc4
	adc a,h			;ebc5
	ld a,(bc)		;ebc6
	adc a,h			;ebc7
	rlca			;ebc8
	adc a,h			;ebc9
	ex af,af'		;ebca
	adc a,h			;ebcb
	add hl,bc		;ebcc
	adc a,h			;ebcd
	ld a,(bc)		;ebce
	adc a,h			;ebcf
	rlca			;ebd0
	adc a,h			;ebd1
	ex af,af'		;ebd2
	adc a,h			;ebd3
	add hl,bc		;ebd4
	adc a,h			;ebd5
	ld a,(bc)		;ebd6
	adc a,h			;ebd7
	rlca			;ebd8
	adc a,h			;ebd9
	ex af,af'		;ebda
	adc a,h			;ebdb
	add hl,bc		;ebdc
	adc a,h			;ebdd
	ld a,(bc)		;ebde
	adc a,h			;ebdf
	rlca			;ebe0
	adc a,h			;ebe1
	ex af,af'		;ebe2
	adc a,h			;ebe3
	add hl,bc		;ebe4
	adc a,h			;ebe5
	ld a,(bc)		;ebe6
	adc a,(hl)		;ebe7
	add hl,bc		;ebe8
	adc a,h			;ebe9
	dec c			;ebea
	adc a,h			;ebeb
	dec c			;ebec
	adc a,h			;ebed
	dec c			;ebee
	adc a,h			;ebef
	dec c			;ebf0
	adc a,h			;ebf1
	ld c,08ch		;ebf2
	ld c,08ch		;ebf4
	ld c,08ch		;ebf6
	ld c,08ch		;ebf8
	dec c			;ebfa
	adc a,h			;ebfb
	dec c			;ebfc
	adc a,h			;ebfd
	dec c			;ebfe
	adc a,h			;ebff
	dec c			;ec00
	adc a,h			;ec01
	ld c,08ch		;ec02
	ld c,08ch		;ec04
	ld c,08ch		;ec06
	ld c,08ch		;ec08
	dec c			;ec0a
	adc a,h			;ec0b
	dec c			;ec0c
	adc a,h			;ec0d
	dec c			;ec0e
	adc a,h			;ec0f
	dec c			;ec10
	adc a,h			;ec11
	ld c,08ch		;ec12
	ld c,08ch		;ec14
	ld c,08ch		;ec16
	ld c,08ch		;ec18
	dec c			;ec1a
	adc a,h			;ec1b
	dec c			;ec1c
	adc a,h			;ec1d
	dec c			;ec1e
	adc a,h			;ec1f
	dec c			;ec20
	adc a,h			;ec21
	ld c,08ch		;ec22
	ld c,08ch		;ec24
	ld c,08ch		;ec26
	ld c,08ch		;ec28
	dec c			;ec2a
	adc a,h			;ec2b
	dec c			;ec2c
L_EC2D:
	adc a,h			;ec2d
	dec c			;ec2e
	adc a,h			;ec2f
	dec c			;ec30
	adc a,h			;ec31
	ld c,08ch		;ec32
	ld c,08ch		;ec34
	ld c,08ch		;ec36
	ld c,08ch		;ec38
	dec c			;ec3a
	adc a,h			;ec3b
	dec c			;ec3c
	adc a,h			;ec3d
	dec c			;ec3e
	adc a,h			;ec3f
	dec c			;ec40
	adc a,h			;ec41
	ld c,08ch		;ec42
	ld c,08ch		;ec44
	ld c,08ch		;ec46
	ld c,082h		;ec48
	adc a,(hl)		;ec4a
	ld (bc),a		;ec4b
	add a,c			;ec4c
	ld bc,0038ch		;ec4d
	adc a,h			;ec50
	inc bc			;ec51
	adc a,h			;ec52
	inc bc			;ec53
	adc a,h			;ec54
	inc bc			;ec55
	adc a,h			;ec56
	inc bc			;ec57
	adc a,h			;ec58
	inc bc			;ec59
	adc a,h			;ec5a
	inc bc			;ec5b
	adc a,h			;ec5c
	inc bc			;ec5d
	adc a,h			;ec5e
	inc bc			;ec5f
	adc a,h			;ec60
	inc bc			;ec61
	adc a,h			;ec62
	inc bc			;ec63
	adc a,h			;ec64
	inc bc			;ec65
	adc a,h			;ec66
	inc bc			;ec67
	adc a,h			;ec68
	inc bc			;ec69
	adc a,h			;ec6a
	inc bc			;ec6b
	adc a,h			;ec6c
	inc bc			;ec6d
	add a,b			;ec6e
	dec bc			;ec6f
	adc a,h			;ec70
	nop			;ec71
	add a,b			;ec72
	ld a,(bc)		;ec73
	adc a,(hl)		;ec74
	ld c,08ch		;ec75
	nop			;ec77
	adc a,(hl)		;ec78
	ld (bc),a		;ec79
	add a,b			;ec7a
	ld a,(bc)		;ec7b
	add a,e			;ec7c
	add a,b			;ec7d
	add a,h			;ec7e
	add a,h			;ec7f
	add a,h			;ec80
	add a,h			;ec81
	adc a,h			;ec82
	dec bc			;ec83
	adc a,(hl)		;ec84
	ld c,08ch		;ec85
	dec bc			;ec87
	adc a,(hl)		;ec88
	ld (bc),a		;ec89
	adc a,h			;ec8a
	inc c			;ec8b
	adc a,(hl)		;ec8c
	or 08ch			;ec8d
	inc c			;ec8f
	adc a,(hl)		;ec90
	ld (bc),a		;ec91
	adc a,(hl)		;ec92
	add hl,bc		;ec93
	add a,b			;ec94
	inc c			;ec95
	add a,a			;ec96
	ld a,(bc)		;ec97
	adc a,h			;ec98
	djnz $-112		;ec99
	dec bc			;ec9b
	adc a,h			;ec9c
	djnz L_EC2D		;ec9d
	defb 0fdh,080h,00dh ;illegal sequence	;ec9f
	adc a,h			;eca2
	djnz $-112		;eca3
	rst 38h			;eca5
	adc a,h			;eca6
	djnz $-112		;eca7
	add hl,bc		;eca9
	adc a,h			;ecaa
	ld de,0118ch		;ecab
	adc a,(hl)		;ecae
	dec bc			;ecaf
	adc a,h			;ecb0
	ld de,0118ch		;ecb1
	adc a,(hl)		;ecb4
	defb 0fdh,08ch ;adc a,iyh	;ecb5
	ld de,0118ch		;ecb7
	adc a,(hl)		;ecba
	rst 38h			;ecbb
	adc a,h			;ecbc
	ld de,0118ch		;ecbd
	add a,b			;ecc0
	rrca			;ecc1
	adc a,(hl)		;ecc2
	add hl,bc		;ecc3
	adc a,h			;ecc4
	ld (de),a		;ecc5
	adc a,(hl)		;ecc6
	defb 0fdh,08ch ;adc a,iyh	;ecc7
	ld (de),a		;ecc9
	add a,d			;ecca
	adc a,e			;eccb
	adc a,h			;eccc
	ld (bc),a		;eccd
	adc a,h			;ecce
	ld (bc),a		;eccf
	adc a,h			;ecd0
	ld (bc),a		;ecd1
	adc a,h			;ecd2
	ld (bc),a		;ecd3
	adc a,h			;ecd4
	ld (bc),a		;ecd5
	adc a,h			;ecd6
	ld (bc),a		;ecd7
	adc a,h			;ecd8
	ld (bc),a		;ecd9
	adc a,h			;ecda
	ld (bc),a		;ecdb
	adc a,h			;ecdc
	ld (bc),a		;ecdd
	adc a,h			;ecde
	ld (bc),a		;ecdf
	adc a,h			;ece0
	ld (bc),a		;ece1
	adc a,h			;ece2
	ld (bc),a		;ece3
	adc a,h			;ece4
	ld (bc),a		;ece5
	adc a,h			;ece6
	ld (bc),a		;ece7
	adc a,h			;ece8
	ld (bc),a		;ece9
	adc a,h			;ecea
	ld (bc),a		;eceb
	adc a,h			;ecec
	ld (bc),a		;eced
	adc a,h			;ecee
	ld (bc),a		;ecef
	adc a,h			;ecf0
	ld (bc),a		;ecf1
	adc a,h			;ecf2
	ld (bc),a		;ecf3
	adc a,h			;ecf4
	ld (bc),a		;ecf5
	adc a,h			;ecf6
	ld (bc),a		;ecf7
	adc a,h			;ecf8
	ld (bc),a		;ecf9
	adc a,h			;ecfa
	ld (bc),a		;ecfb
	adc a,h			;ecfc
	ld (bc),a		;ecfd
	adc a,h			;ecfe
	ld (bc),a		;ecff
	adc a,h			;ed00
	ld (bc),a		;ed01
	adc a,h			;ed02
	ld (bc),a		;ed03
	adc a,h			;ed04
	ld (bc),a		;ed05
	adc a,h			;ed06
	ld (bc),a		;ed07
	adc a,h			;ed08
	ld (bc),a		;ed09
	adc a,h			;ed0a
	ld (bc),a		;ed0b
	adc a,h			;ed0c
	ld (bc),a		;ed0d
	adc a,h			;ed0e
	ld (bc),a		;ed0f
	adc a,h			;ed10
	ld (bc),a		;ed11
	adc a,h			;ed12
	ld (bc),a		;ed13
	adc a,h			;ed14
	ld (bc),a		;ed15
	adc a,h			;ed16
	ld (bc),a		;ed17
	adc a,h			;ed18
	ld (bc),a		;ed19
	adc a,h			;ed1a
	ld (bc),a		;ed1b
	adc a,h			;ed1c
	ld (bc),a		;ed1d
	adc a,h			;ed1e
	ld (bc),a		;ed1f
	adc a,h			;ed20
	ld (bc),a		;ed21
	adc a,h			;ed22
	ld (bc),a		;ed23
	adc a,(hl)		;ed24
	add hl,bc		;ed25
	adc a,h			;ed26
	rrca			;ed27
	adc a,(hl)		;ed28
	dec bc			;ed29
	adc a,h			;ed2a
	rrca			;ed2b
	adc a,(hl)		;ed2c
	add hl,bc		;ed2d
	adc a,h			;ed2e
	rrca			;ed2f
	adc a,(hl)		;ed30
	dec bc			;ed31
	adc a,h			;ed32
	rrca			;ed33
	adc a,(hl)		;ed34
	add hl,bc		;ed35
	adc a,h			;ed36
	rrca			;ed37
	adc a,(hl)		;ed38
	dec bc			;ed39
	adc a,h			;ed3a
	rrca			;ed3b
	adc a,(hl)		;ed3c
	add hl,bc		;ed3d
	adc a,h			;ed3e
	rrca			;ed3f
	adc a,(hl)		;ed40
	dec bc			;ed41
	adc a,h			;ed42
	rrca			;ed43
	adc a,(hl)		;ed44
	add hl,bc		;ed45
	adc a,h			;ed46
	rrca			;ed47
	adc a,(hl)		;ed48
	dec bc			;ed49
	adc a,h			;ed4a
	rrca			;ed4b
	adc a,(hl)		;ed4c
	add hl,bc		;ed4d
	adc a,h			;ed4e
	rrca			;ed4f
	adc a,(hl)		;ed50
	dec bc			;ed51
	adc a,h			;ed52
	rrca			;ed53
	add a,d			;ed54
	add a,l			;ed55
	and b			;ed56
	add a,e			;ed57
	ld e,081h		;ed58
	ld bc,00380h		;ed5a
	add a,a			;ed5d
	rlca			;ed5e
	inc d			;ed5f
	adc a,e			;ed60
	add a,(hl)		;ed61
	add a,e			;ed62
	ld bc,00181h		;ed63
	add a,b			;ed66
	ld a,(bc)		;ed67
	ld b,b			;ed68
	add a,h			;ed69
	add a,d			;ed6a
	add a,(hl)		;ed6b
	add a,e			;ed6c
	ld bc,00181h		;ed6d
	add a,b			;ed70
	ld a,(bc)		;ed71
	inc (hl)		;ed72
	add a,h			;ed73
	add a,d			;ed74
	nop			;ed75
	nop			;ed76
	nop			;ed77
	nop			;ed78
	nop			;ed79
	nop			;ed7a
	nop			;ed7b
	nop			;ed7c
	nop			;ed7d
	nop			;ed7e
	nop			;ed7f
	nop			;ed80
	nop			;ed81
	nop			;ed82
	nop			;ed83
	nop			;ed84
	nop			;ed85
	nop			;ed86
	nop			;ed87
	nop			;ed88
	nop			;ed89
	nop			;ed8a
	nop			;ed8b
	nop			;ed8c
	nop			;ed8d
	nop			;ed8e
	nop			;ed8f
	nop			;ed90
	nop			;ed91
	nop			;ed92
	nop			;ed93
	nop			;ed94
	nop			;ed95
	nop			;ed96
	nop			;ed97
	nop			;ed98
	nop			;ed99
	nop			;ed9a
	nop			;ed9b
	nop			;ed9c
	nop			;ed9d
	nop			;ed9e
	nop			;ed9f
	nop			;eda0
	nop			;eda1
	nop			;eda2
	nop			;eda3
	nop			;eda4
	nop			;eda5
	nop			;eda6
	nop			;eda7
	nop			;eda8
	nop			;eda9
	nop			;edaa
	nop			;edab
	nop			;edac
	nop			;edad
	nop			;edae
	nop			;edaf
	nop			;edb0
	nop			;edb1
	nop			;edb2
	nop			;edb3
	nop			;edb4
	nop			;edb5
	nop			;edb6
	nop			;edb7
	nop			;edb8
	nop			;edb9
	nop			;edba
	nop			;edbb
	nop			;edbc
	nop			;edbd
	nop			;edbe
	nop			;edbf
	nop			;edc0
	nop			;edc1
	nop			;edc2
	nop			;edc3
	nop			;edc4
	nop			;edc5
	nop			;edc6
	nop			;edc7
	nop			;edc8
	nop			;edc9
	nop			;edca
	nop			;edcb
	nop			;edcc
	nop			;edcd
	nop			;edce
	nop			;edcf
	nop			;edd0
	nop			;edd1
	nop			;edd2
	nop			;edd3
	nop			;edd4
	nop			;edd5
	nop			;edd6
	nop			;edd7
	nop			;edd8
	nop			;edd9
	nop			;edda
	nop			;eddb
	nop			;eddc
	nop			;eddd
	nop			;edde
	nop			;eddf
	nop			;ede0
	nop			;ede1
	nop			;ede2
	nop			;ede3
	nop			;ede4
	nop			;ede5
	nop			;ede6
	nop			;ede7
	nop			;ede8
	nop			;ede9
	nop			;edea
	nop			;edeb
	nop			;edec
	nop			;eded
	nop			;edee
	nop			;edef
	nop			;edf0
	nop			;edf1
	nop			;edf2
	nop			;edf3
	nop			;edf4
	nop			;edf5
	nop			;edf6
	nop			;edf7
	nop			;edf8
	nop			;edf9
	nop			;edfa
	nop			;edfb
	nop			;edfc
	nop			;edfd
	nop			;edfe
	nop			;edff
	nop			;ee00
	nop			;ee01
	nop			;ee02
	nop			;ee03
	nop			;ee04
	nop			;ee05
	nop			;ee06
	nop			;ee07
	nop			;ee08
	nop			;ee09
	nop			;ee0a
	nop			;ee0b
	nop			;ee0c
	nop			;ee0d
	nop			;ee0e
	nop			;ee0f
	nop			;ee10
	nop			;ee11
	nop			;ee12
	nop			;ee13
	nop			;ee14
	nop			;ee15
	nop			;ee16
	nop			;ee17
	nop			;ee18
	nop			;ee19
	nop			;ee1a
	nop			;ee1b
	nop			;ee1c
	nop			;ee1d
	nop			;ee1e
	nop			;ee1f
	nop			;ee20
	nop			;ee21
	nop			;ee22
	nop			;ee23
L_EE24:
	di			;ee24
	push af			;ee25
	in a,(099h)		;ee26
	ld a,l			;ee28
	out (099h),a		;ee29
	ld a,h			;ee2b
	and 07fh		;ee2c
	or 040h			;ee2e
	out (099h),a		;ee30
	pop af			;ee32
	ret			;ee33
L_EE34:
	ld b,032h		;ee34
	call L_EFC6		;ee36
	ld hl,00000h		;ee39
	ld bc,01800h		;ee3c
	xor a			;ee3f
	call L_F0E7		;ee40
	ld hl,02000h		;ee43
	ld bc,01800h		;ee46
	ld a,071h		;ee49
	call L_F0E7		;ee4b
	ld a,0e2h		;ee4e
	out (099h),a		;ee50
	and a			;ee52
	ld a,081h		;ee53
	out (099h),a		;ee55
	ld ix,0f120h		;ee57
	ld hl,0f126h		;ee5b
	ld a,(hl)		;ee5e
	ld (ix+001h),a		;ee5f
L_EE62:
	ld a,(hl)		;ee62
	cp 0ffh			;ee63
	jr z,L_EE7C		;ee65
	ld (ix+000h),a		;ee67
	inc hl			;ee6a
	ld a,(hl)		;ee6b
	ld (ix+002h),a		;ee6c
	inc hl			;ee6f
	push hl			;ee70
	ld b,001h		;ee71
	call L_EFC6		;ee73
	call L_EFD3		;ee76
	pop hl			;ee79
	jr L_EE62		;ee7a
L_EE7C:
	ld hl,02800h		;ee7c
	ld bc,00800h		;ee7f
	ld a,0a1h		;ee82
	call L_F0E7		;ee84
	ld b,032h		;ee87
	call L_EFC6		;ee89
	ld ix,0f1e7h		;ee8c
	ld b,005h		;ee90
L_EE92:
	push bc			;ee92
	ld hl,00900h		;ee93
	call L_F4E4		;ee96
	ld b,0c8h		;ee99
	call L_EFC6		;ee9b
	ld b,0c8h		;ee9e
	call L_EFC6		;eea0
	call L_EF6D		;eea3
	pop bc			;eea6
	djnz L_EE92		;eea7
	ld hl,00a98h		;eea9
	call L_F4E4		;eeac
	ld h,d			;eeaf
	ld l,e			;eeb0
	ld bc,00000h		;eeb1
	nop			;eeb4
	nop			;eeb5
	call L_E16F		;eeb6
	call L_D57B		;eeb9
	di			;eebc
	ld a,0a2h		;eebd
	out (099h),a		;eebf
	ld a,081h		;eec1
	and a			;eec3
	and a			;eec4
	out (099h),a		;eec5
	ld hl,02000h		;eec7
	ld c,003h		;eeca
L_EECC:
	ld b,002h		;eecc
L_EECE:
	push bc			;eece
	ld bc,00100h		;eecf
	ld a,011h		;eed2
	call L_F0E7		;eed4
	ld bc,00600h		;eed7
	add hl,bc		;eeda
	pop bc			;eedb
	djnz L_EECE		;eedc
	ld de,00100h		;eede
	add hl,de		;eee1
	dec c			;eee2
	jr nz,L_EECC		;eee3
	ld hl,02100h		;eee5
	ld e,018h		;eee8
L_EEEA:
	ld a,011h		;eeea
	ld bc,00008h		;eeec
	call L_F0E7		;eeef
	ld bc,00040h		;eef2
	add hl,bc		;eef5
	dec e			;eef6
	jr nz,L_EEEA		;eef7
	ld hl,03128h		;eef9
	ld e,018h		;eefc
L_EEFE:
	ld a,011h		;eefe
L_EF00:
	ld bc,00018h		;ef00
	call L_F0E7		;ef03
	ld bc,00040h		;ef06
	add hl,bc		;ef09
	dec e			;ef0a
	jr nz,L_EEFE		;ef0b
	ld hl,00000h		;ef0d
	ld de,048a0h		;ef10
	call L_EF28		;ef13
	ld hl,02000h		;ef16
	call L_EF28		;ef19
	di			;ef1c
	ld a,0e2h		;ef1d
	out (099h),a		;ef1f
	ld a,081h		;ef21
	and a			;ef23
	and a			;ef24
	out (099h),a		;ef25
	ret			;ef27
L_EF28:
	push hl			;ef28
	ld c,002h		;ef29
L_EF2B:
	ld b,003h		;ef2b
L_EF2D:
	push bc			;ef2d
	ld bc,00100h		;ef2e
	call L_F0F7		;ef31
	ld bc,00800h		;ef34
	add hl,bc		;ef37
	pop bc			;ef38
	djnz L_EF2D		;ef39
	push de			;ef3b
	ld de,lef00h		;ef3c
	add hl,de		;ef3f
	pop de			;ef40
	dec c			;ef41
	jr nz,L_EF2B		;ef42
	pop hl			;ef44
	inc h			;ef45
	ld b,018h		;ef46
	push hl			;ef48
L_EF49:
	push bc			;ef49
	ld bc,00008h		;ef4a
	call L_F0F7		;ef4d
	ld bc,00040h		;ef50
	add hl,bc		;ef53
	pop bc			;ef54
	djnz L_EF49		;ef55
	pop hl			;ef57
	ld bc,01028h		;ef58
	add hl,bc		;ef5b
	ld b,018h		;ef5c
L_EF5E:
	push bc			;ef5e
	ld bc,00018h		;ef5f
	call L_F0F7		;ef62
	ld bc,00040h		;ef65
	add hl,bc		;ef68
	pop bc			;ef69
	djnz L_EF5E		;ef6a
	ret			;ef6c
L_EF6D:
	ld hl,04100h		;ef6d
	ld de,04101h		;ef70
	ld bc,0001fh		;ef73
	ldir			;ef76
	ld de,04000h		;ef78
	ld hl,01900h		;ef7b
	ld bc,00100h		;ef7e
	call L_F105		;ef81
	ld a,008h		;ef84
L_EF86:
	ex af,af'		;ef86
	ld de,04000h		;ef87
	ld hl,04020h		;ef8a
	ld bc,00100h		;ef8d
	ldir			;ef90
	ld hl,01900h		;ef92
	ld de,04000h		;ef95
	ld bc,00100h		;ef98
	call L_F0F7		;ef9b
	ld b,00ah		;ef9e
	call L_EFC6		;efa0
	ex af,af'		;efa3
	dec a			;efa4
	jr nz,L_EF86		;efa5
	ld hl,00800h		;efa7
	ld bc,00800h		;efaa
	xor a			;efad
	call L_F0E7		;efae
	ld hl,01900h		;efb1
	call L_EE24		;efb4
	ld c,098h		;efb7
	xor a			;efb9
L_EFBA:
	out (c),a		;efba
	add a,008h		;efbc
	jr nc,L_EFBA		;efbe
	inc a			;efc0
	cp 008h			;efc1
	jr nz,L_EFBA		;efc3
	ret			;efc5
L_EFC6:
	push bc			;efc6
	ld bc,001f4h		;efc7
L_EFCA:
	dec bc			;efca
	ld a,b			;efcb
	or c			;efcc
	jr nz,L_EFCA		;efcd
	pop bc			;efcf
	djnz L_EFC6		;efd0
	ret			;efd2
L_EFD3:
	ld a,(ix+000h)		;efd3
	sub (ix+001h)		;efd6
	ld de,L_F02C		;efd9
	ld hl,0f07bh		;efdc
	ld c,(ix+001h)		;efdf
	jr c,L_EFF0		;efe2
	jr nz,L_EFFD		;efe4
	ld a,(ix+002h)		;efe6
	cp (ix+003h)		;efe9
	ld a,000h		;efec
	jr nc,L_EFFD		;efee
L_EFF0:
	ld c,(ix+000h)		;eff0
	neg			;eff3
	sub (ix+002h)		;eff5
	add a,(ix+003h)		;eff8
	ex de,hl		;effb
	inc a			;effc
L_EFFD:
	ld (ix+004h),a		;effd
L_F000:
	ld (0f016h),hl		;f000
	ld (0f019h),de		;f003
	ld d,c			;f007
	ld e,008h		;f008
	call L_F8AE		;f00a
	xor a			;f00d
	ld (0f125h),a		;f00e
	push hl			;f011
	ld de,04000h		;f012
	call 00000h		;f015   ; BIOS CHKRAM - Tests RAM and sets RAM slot for the system  [alias: STARTUP, RESET, BOOT]
	call 00000h		;f018   ; BIOS CHKRAM - Tests RAM and sets RAM slot for the system  [alias: STARTUP, RESET, BOOT]
	pop hl			;f01b
	call L_F0BD		;f01c
	ld a,(ix+000h)		;f01f
	ld (ix+001h),a		;f022
	ld a,(ix+002h)		;f025
	ld (ix+003h),a		;f028
	ret			;f02b
L_F02C:
	ld a,020h		;f02c
	ld b,010h		;f02e
	sub (ix+002h)		;f030
	ld c,a			;f033
	ex af,af'		;f034
	ld a,008h		;f035
	ld hl,047a0h		;f037
L_F03A:
	push de			;f03a
	ldi			;f03b
	ldi			;f03d
	ldi			;f03f
	ldi			;f041
	ldi			;f043
	ldi			;f045
	ldi			;f047
	ldi			;f049
	ldi			;f04b
	ldi			;f04d
	ldi			;f04f
	ldi			;f051
	ldi			;f053
	ldi			;f055
	ldi			;f057
	ldi			;f059
	pop de			;f05b
	add a,c			;f05c
	cp 010h			;f05d
	jr nc,L_F069		;f05f
	ex af,af'		;f061
	call L_F0AE		;f062
	ex af,af'		;f065
	add a,010h		;f066
	scf			;f068
L_F069:
	dec b			;f069
	jr z,L_F077		;f06a
	and a			;f06c
	sbc a,010h		;f06d
	ex af,af'		;f06f
	ld a,c			;f070
	add a,010h		;f071
	ld c,a			;f073
	ex af,af'		;f074
	jr L_F03A		;f075
L_F077:
	ret c			;f077
	jp L_F0AE		;f078

; ----------------------------------------------------------------------
; DATOS relleno: o resto (5 B; 5 bytes)
;   0xf07b..0xf080  (5 bytes)
; ----------------------------------------------------------------------
	defb 0ddh,07eh,004h,0a7h,0c8h	; f07b  .~...

; ======================================================================
; CODIGO 0xf080..0xf120  (160 bytes)
; ======================================================================


L_F080:
	push de			;f080
	pop hl			;f081
	push de			;f082
	inc de			;f083
	ld (hl),000h		;f084
L_F086:
	ldi			;f086
	ldi			;f088
	ldi			;f08a
	ldi			;f08c
	ldi			;f08e
	ldi			;f090
	ldi			;f092
	ldi			;f094
	ldi			;f096
	ldi			;f098
	ldi			;f09a
	ldi			;f09c
	ldi			;f09e
	ldi			;f0a0
	ldi			;f0a2
	pop de			;f0a4
	call L_F0AE		;f0a5
	dec (ix+004h)		;f0a8
	ret z			;f0ab
	jr L_F080		;f0ac
L_F0AE:
	push hl			;f0ae
	ld hl,00010h		;f0af
	add hl,de		;f0b2
	ex de,hl		;f0b3
	pop hl			;f0b4
	ld a,(0f125h)		;f0b5
	inc a			;f0b8
	ld (0f125h),a		;f0b9
	ret			;f0bc
L_F0BD:
	ld c,010h		;f0bd
	ld de,04000h		;f0bf
L_F0C2:
	call L_EE24		;f0c2
	push de			;f0c5
	ld a,(0f125h)		;f0c6
	ld b,a			;f0c9
	push hl			;f0ca
L_F0CB:
	ld a,(de)		;f0cb
L_F0CC:
	out (098h),a		;f0cc
	ld a,e			;f0ce
	add a,010h		;f0cf
	ld e,a			;f0d1
	ld a,d			;f0d2
	adc a,000h		;f0d3
	ld d,a			;f0d5
	call L_F5E1		;f0d6
	djnz L_F0CB		;f0d9
	pop hl			;f0db
	ld de,00040h		;f0dc
	add hl,de		;f0df
	pop de			;f0e0
	inc de			;f0e1
	dec c			;f0e2
	jr nz,L_F0C2		;f0e3
	ei			;f0e5
	ret			;f0e6
L_F0E7:
	ex af,af'		;f0e7
	call L_EE24		;f0e8
L_F0EB:
	ex af,af'		;f0eb
L_F0EC:
	out (098h),a		;f0ec
	ex af,af'		;f0ee
	dec bc			;f0ef
	ld a,b			;f0f0
	or c			;f0f1
	jr nz,L_F0EB		;f0f2
	ex af,af'		;f0f4
L_F0F5:
	ei			;f0f5
	ret			;f0f6
L_F0F7:
	call L_EE24		;f0f7
L_F0FA:
	ld a,(de)		;f0fa
L_F0FB:
	out (098h),a		;f0fb
	inc de			;f0fd
	dec bc			;f0fe
	ld a,b			;f0ff
L_F100:
	or c			;f100
	jr nz,L_F0FA		;f101
	ei			;f103
	ret			;f104
L_F105:
	call L_F114		;f105
	and a			;f108
L_F109:
	in a,(098h)		;f109
	ld (de),a		;f10b
L_F10C:
	inc de			;f10c
	dec bc			;f10d
	ld a,b			;f10e
	or c			;f10f
	jr nz,L_F109		;f110
	ei			;f112
	ret			;f113
L_F114:
	di			;f114
	in a,(099h)		;f115
	ld a,l			;f117
L_F118:
	out (099h),a		;f118
	ld a,h			;f11a
	and 03fh		;f11b
	out (099h),a		;f11d
	ret			;f11f

; ----------------------------------------------------------------------
; DATOS relleno: o resto (4 B; 4 bytes)
;   0xf120..0xf124  (4 bytes)
; ----------------------------------------------------------------------
	defb 000h,000h,000h,000h	; f120  ....

; ======================================================================
; CODIGO 0xf124..0xf393  (623 bytes)
; ======================================================================


L_F124:
	nop			;f124
	nop			;f125
L_F126:
	nop			;f126
	ld bc,00100h		;f127
	nop			;f12a
L_F12B:
	ld bc,00200h		;f12b
L_F12E:
	nop			;f12e
	ld (bc),a		;f12f
	nop			;f130
	inc bc			;f131
	nop			;f132
	inc bc			;f133
	nop			;f134
	inc b			;f135
L_F136:
	nop			;f136
	dec b			;f137
	nop			;f138
	ld b,000h		;f139
	ex af,af'		;f13b
	nop			;f13c
	ld a,(bc)		;f13d
	nop			;f13e
	dec c			;f13f
	nop			;f140
	djnz $+3		;f141
	djnz L_F147		;f143
	djnz $+5		;f145
L_F147:
	djnz $+7		;f147
	djnz $+9		;f149
	djnz $+11		;f14b
	djnz L_F15B		;f14d
	djnz $+17		;f14f
	djnz L_F165		;f151
	djnz L_F16D		;f153
	djnz L_F173		;f155
	djnz L_F179		;f157
	djnz L_F180		;f159
L_F15B:
	djnz L_F187		;f15b
	djnz L_F18E		;f15d
	djnz $+55		;f15f
	djnz $+61		;f161
	djnz $+67		;f163
L_F165:
	djnz L_F1AF		;f165
	djnz $+81		;f167
	djnz L_F1C1		;f169
	djnz $+96		;f16b
L_F16D:
	djnz $+104		;f16d
	djnz L_F1DF		;f16f
	djnz $+121		;f171
L_F173:
	djnz $-126		;f173
	djnz $-117		;f175
	djnz $-107		;f177
L_F179:
	djnz $-97		;f179
	djnz L_F124		;f17b
	djnz L_F12B		;f17d
	rrca			;f17f
L_F180:
	or e			;f180
	ex af,af'		;f181
	or a			;f182
	inc b			;f183
	cp c			;f184
	ld (bc),a		;f185
	cp d			;f186
L_F187:
	ld bc,001bah		;f187
	cp d			;f18a
	ld bc,002b9h		;f18b
L_F18E:
	or a			;f18e
	inc b			;f18f
	or e			;f190
	ex af,af'		;f191
	xor e			;f192
	djnz L_F136		;f193
	djnz L_F12E		;f195
	djnz L_F126		;f197
	djnz $-123		;f199
	djnz L_F217		;f19b
	djnz L_F210		;f19d
	djnz L_F209		;f19f
	djnz L_F202		;f1a1
	djnz $+89		;f1a3
	djnz L_F1F6		;f1a5
	djnz L_F1F0		;f1a7
	djnz $+65		;f1a9
	djnz L_F1E5		;f1ab
	djnz L_F1E0		;f1ad
L_F1AF:
	djnz L_F1DB		;f1af
	djnz L_F1D6		;f1b1
	djnz $+31		;f1b3
	djnz $+25		;f1b5
	djnz L_F1CA		;f1b7
	djnz L_F1C6		;f1b9
	djnz $+8		;f1bb
	djnz $+3		;f1bd
	djnz L_F1C2		;f1bf
L_F1C1:
	dec bc			;f1c1
L_F1C2:
	ld bc,00108h		;f1c2
	dec b			;f1c5
L_F1C6:
	ld bc,00103h		;f1c6
	ld (bc),a		;f1c9
L_F1CA:
	ld bc,00102h		;f1ca
	ld bc,00101h		;f1cd
	ld bc,00101h		;f1d0
	ld bc,00202h		;f1d3
L_F1D6:
	inc bc			;f1d6
	inc bc			;f1d7
	inc b			;f1d8
	inc b			;f1d9
	dec b			;f1da
L_F1DB:
	dec b			;f1db
	ld b,006h		;f1dc
	rlca			;f1de
L_F1DF:
	ex af,af'		;f1df
L_F1E0:
	ex af,af'		;f1e0
	ld a,(bc)		;f1e1
	add hl,bc		;f1e2
	dec c			;f1e3
	ld a,(bc)		;f1e4
L_F1E5:
	djnz $+1		;f1e5
	dec c			;f1e7
	ld bc,04309h		;f1e8
	ld c,a			;f1eb
	ld c,(hl)		;f1ec
	ld d,(hl)		;f1ed
	ld b,l			;f1ee
	ld d,d			;f1ef
L_F1F0:
	ld d,e			;f1f0
	ld c,c			;f1f1
	ld c,a			;f1f2
	ld c,(hl)		;f1f3
	jr nz,L_F246		;f1f4
L_F1F6:
	ld c,a			;f1f6
	ld d,d			;f1f7
	dec c			;f1f8
	dec c			;f1f9
	ld bc,02009h		;f1fa
	ld b,e			;f1fd
	ld b,c			;f1fe
	ld d,d			;f1ff
	ld c,h			;f200
	ld c,a			;f201
L_F202:
	ld d,e			;f202
	jr nz,L_F246		;f203
	ld d,d			;f205
	ld c,c			;f206
	ld b,c			;f207
	ld d,e			;f208
L_F209:
	dec c			;f209
	nop			;f20a
	ld bc,0470ch		;f20b
	ld d,d			;f20e
	ld b,c			;f20f
L_F210:
	ld b,(hl)		;f210
	ld c,c			;f211
	ld b,e			;f212
	ld c,a			;f213
	ld d,e			;f214
	dec c			;f215
	dec c			;f216
L_F217:
	ld bc,04a06h		;f217
	ld d,l			;f21a
	ld b,c			;f21b
	ld c,(hl)		;f21c
	jr nz,$+69		;f21d
	ld b,c			;f21f
	ld d,d			;f220
	ld c,h			;f221
	ld c,a			;f222
	ld d,e			;f223
	jr nz,L_F27F		;f224
	jr nz,L_F272		;f226
	ld b,c			;f228
	ld d,(hl)		;f229
	ld c,c			;f22a
	ld b,l			;f22b
	ld d,d			;f22c
	dec c			;f22d
	dec c			;f22e
	ld bc,0410ch		;f22f
	ld d,d			;f232
	ld b,l			;f233
	ld d,(hl)		;f234
	ld b,c			;f235
	ld c,h			;f236
	ld c,a			;f237
	dec c			;f238
	inc d			;f239
	dec c			;f23a
	ld bc,02e08h		;f23b
	ld l,02eh		;f23e
	ld b,c			;f240
L_F241:
	ld b,h			;f241
	ld b,l			;f242
	ld c,l			;f243
	ld b,c			;f244
	ld d,e			;f245
L_F246:
	jr nz,L_F28C		;f246
	ld b,l			;f248
	ld l,02eh		;f249
	ld l,00dh		;f24b
	nop			;f24d
	dec c			;f24e
	dec c			;f24f
	dec c			;f250
	ld bc,04a0ah		;f251
	ld d,l			;f254
	ld c,h			;f255
	ld c,c			;f256
	ld c,a			;f257
	jr nz,L_F2A7		;f258
	ld b,c			;f25a
	ld d,d			;f25b
	ld d,h			;f25c
	ld c,c			;f25d
	ld c,(hl)		;f25e
	dec c			;f25f
	nop			;f260
	ld bc,04d06h		;f261
	ld d,l			;f264
	ld d,e			;f265
	ld c,c			;f266
	ld b,e			;f267
	ld b,c			;f268
	jr nz,L_F2AE		;f269
	ld c,a			;f26b
	ld c,l			;f26c
	ld d,b			;f26d
	ld d,l			;f26e
	ld b,l			;f26f
	ld d,e			;f270
	ld d,h			;f271
L_F272:
	ld b,c			;f272
	jr nz,L_F2C5		;f273
	ld c,a			;f275
	ld d,d			;f276
	dec c			;f277
	dec c			;f278
	ld bc,0470bh		;f279
	ld c,a			;f27c
	ld c,l			;f27d
	ld c,c			;f27e
L_F27F:
	ld c,(hl)		;f27f
	ld c,a			;f280
	ld c,h			;f281
	ld b,c			;f282
	ld d,e			;f283
	dec c			;f284
	nop			;f285
	ld bc,0420bh		;f286
	ld b,c			;f289
	ld d,e			;f28a
	ld b,c			;f28b
L_F28C:
	ld b,h			;f28c
	ld c,a			;f28d
	jr nz,L_F2B0		;f28e
	ld b,l			;f290
	ld c,(hl)		;f291
	dec c			;f292
	dec c			;f293
	ld bc,05507h		;f294
	ld c,(hl)		;f297
	ld b,c			;f298
	jr nz,L_F2E4		;f299
	ld b,h			;f29b
	ld b,l			;f29c
	ld b,c			;f29d
	jr nz,L_F2C0		;f29e
	ld c,a			;f2a0
	ld d,d			;f2a1
	ld c,c			;f2a2
	ld b,a			;f2a3
	ld c,c			;f2a4
	ld c,(hl)		;f2a5
	ld b,c			;f2a6
L_F2A7:
	ld c,h			;f2a7
	dec c			;f2a8
	dec c			;f2a9
L_F2AA:
	ld bc,0440fh		;f2aa
	ld b,l			;f2ad
L_F2AE:
	dec c			;f2ae
	dec c			;f2af
L_F2B0:
	ld bc,04a07h		;f2b0
	ld c,a			;f2b3
	ld d,e			;f2b4
	ld b,l			;f2b5
	jr nz,L_F305		;f2b6
	ld b,c			;f2b8
	ld c,(hl)		;f2b9
	ld d,l			;f2ba
	ld b,l			;f2bb
	ld c,h			;f2bc
	jr nz,$+34		;f2bd
	ld c,l			;f2bf
L_F2C0:
	ld d,l			;f2c0
	ld h,04fh		;f2c1
	ld e,d			;f2c3
	dec c			;f2c4
L_F2C5:
	nop			;f2c5
	ld d,h			;f2c6
	ld c,a			;f2c7
	ld d,b			;f2c8
	ld c,a			;f2c9
	jr nz,$+85		;f2ca
	ld c,a			;f2cc
	ld b,(hl)		;f2cd
	ld d,h			;f2ce
	dec c			;f2cf
	nop			;f2d0
L_F2D1:
	ld a,(0d3c1h)		;f2d1
	ld hl,06050h		;f2d4
	cp 014h			;f2d7
	jr c,L_F2DD		;f2d9
	ld a,014h		;f2db
L_F2DD:
	ld b,a			;f2dd
	ld a,014h		;f2de
	sub b			;f2e0
	push af			;f2e1
	ld a,b			;f2e2
	and a			;f2e3
L_F2E4:
	jr z,L_F33A		;f2e4
	cp 004h			;f2e6
	jr nc,L_F301		;f2e8
	call L_F114		;f2ea
	in a,(098h)		;f2ed
	ei			;f2ef
	ld c,a			;f2f0
	ld a,(0f393h)		;f2f1
	and a			;f2f4
	jr nz,L_F303		;f2f5
	rrc c			;f2f7
	rrc c			;f2f9
	rrc c			;f2fb
	rrc c			;f2fd
	jr L_F303		;f2ff
L_F301:
	ld c,0f9h		;f301
L_F303:
	ld d,000h		;f303
L_F305:
	di			;f305
	ld a,l			;f306
	out (099h),a		;f307
	ld a,h			;f309
	or 040h			;f30a
	and a			;f30c
	out (099h),a		;f30d
	ld a,c			;f30f
	exx			;f310
	ld b,008h		;f311
L_F313:
	out (098h),a		;f313
	and a			;f315
	dec b			;f316
	jr nz,L_F313		;f317
	ei			;f319
	exx			;f31a
	ld a,d			;f31b
	cp 002h			;f31c
	jr c,L_F328		;f31e
	ld c,0f5h		;f320
	cp 009h			;f322
	jr c,L_F328		;f324
	ld c,0f1h		;f326
L_F328:
	inc a			;f328
	ld d,a			;f329
	ld a,l			;f32a
	add a,008h		;f32b
	cp 080h			;f32d
	jr nz,L_F337		;f32f
	ld a,h			;f331
	add a,008h		;f332
	ld h,a			;f334
	ld a,040h		;f335
L_F337:
	ld l,a			;f337
	djnz L_F305		;f338
L_F33A:
	pop af			;f33a
	and a			;f33b
	ret z			;f33c
	ld b,a			;f33d
L_F33E:
	di			;f33e
	ld a,l			;f33f
	out (099h),a		;f340
	and a			;f342
	ld a,h			;f343
	or 040h			;f344
	out (099h),a		;f346
	ld c,008h		;f348
L_F34A:
	ld a,011h		;f34a
L_F34C:
	out (098h),a		;f34c
	ei			;f34e
	dec c			;f34f
	jr nz,L_F34A		;f350
	ld a,l			;f352
	add a,008h		;f353
	cp 080h			;f355
	jr nz,L_F35F		;f357
	ld a,h			;f359
	add a,008h		;f35a
	ld h,a			;f35c
	ld a,040h		;f35d
L_F35F:
	ld l,a			;f35f
	djnz L_F33E		;f360
	ret			;f362
L_F363:
	ld a,(0d3c1h)		;f363
	cp 004h			;f366
	ret nc			;f368
	and a			;f369
	ret z			;f36a
	add a,a			;f36b
	add a,a			;f36c
	add a,a			;f36d
	ld b,a			;f36e
	ld a,(0f393h)		;f36f
	inc a			;f372
	and 007h		;f373
	ld (0f393h),a		;f375
	ret nz			;f378
	ld hl,06050h		;f379
	call L_F114		;f37c
	in a,(098h)		;f37f
	ei			;f381
	rrca			;f382
	rrca			;f383
	rrca			;f384
	rrca			;f385
	ex af,af'		;f386
	call L_EE24		;f387
	ex af,af'		;f38a
L_F38B:
	out (098h),a		;f38b
	and a			;f38d
	dec b			;f38e
	jr nz,L_F38B		;f38f
	ei			;f391
	ret			;f392

; ----------------------------------------------------------------------
; DATOS relleno: o resto (1 B; 1 bytes)
;   0xf393..0xf394  (1 bytes)
; ----------------------------------------------------------------------
	defb 000h	; f393  .

; ======================================================================
; CODIGO 0xf394..0xf77d  (1001 bytes)
; ======================================================================


L_F394:
	push ix			;f394
	ld ix,0dd80h		;f396
	ld de,012b0h		;f39a
	call L_D3CF		;f39d
	pop ix			;f3a0
	ret			;f3a2
L_F3A3:
	ld a,011h		;f3a3
	jr L_F3A9		;f3a5
L_F3A7:
	ld a,071h		;f3a7
L_F3A9:
	ld b,002h		;f3a9
L_F3AB:
	push bc			;f3ab
	push hl			;f3ac
	ld c,002h		;f3ad
	call L_EE24		;f3af
L_F3B2:
	ld b,008h		;f3b2
L_F3B4:
	out (098h),a		;f3b4
	and a			;f3b6
	and a			;f3b7
	dec b			;f3b8
	jr nz,L_F3B4		;f3b9
	push af			;f3bb
	ld a,l			;f3bc
	and 038h		;f3bd
	cp 038h			;f3bf
	jr nz,L_F3CE		;f3c1
	ld a,l			;f3c3
	and 0c0h		;f3c4
	ld l,a			;f3c6
	ld a,h			;f3c7
	add a,008h		;f3c8
	ld h,a			;f3ca
	call L_EE24		;f3cb
L_F3CE:
	pop af			;f3ce
	dec c			;f3cf
	jr nz,L_F3B2		;f3d0
	pop hl			;f3d2
	ld bc,00040h		;f3d3
	add hl,bc		;f3d6
	pop bc			;f3d7
	djnz L_F3AB		;f3d8
	ei			;f3da
	ret			;f3db
L_F3DC:
	ld de,04000h		;f3dc
	ld hl,00108h		;f3df
	ld b,038h		;f3e2
	call L_F3FF		;f3e4
	ld de,04540h		;f3e7
	ld hl,00900h		;f3ea
	ld b,040h		;f3ed
	call L_F3FF		;f3ef
	ld de,04b40h		;f3f2
	ld hl,01100h		;f3f5
	ld b,028h		;f3f8
	call L_F3FF		;f3fa
	ei			;f3fd
	ret			;f3fe
L_F3FF:
	ld c,018h		;f3ff
L_F401:
	push bc			;f401
	call L_EE24		;f402
	push de			;f405
	push hl			;f406
	ex de,hl		;f407
	ld de,00018h		;f408
L_F40B:
	ld a,(hl)		;f40b
	out (098h),a		;f40c
	add hl,de		;f40e
	djnz L_F40B		;f40f
	pop hl			;f411
	ld de,00040h		;f412
	add hl,de		;f415
	pop de			;f416
	inc de			;f417
	pop bc			;f418
	dec c			;f419
	jr nz,L_F401		;f41a
	ret			;f41c
L_F41D:
	ld a,(ix+000h)		;f41d
	and a			;f420
	ret z			;f421
	ld l,a			;f422
	ld h,000h		;f423
	add hl,hl		;f425
	add hl,hl		;f426
	add hl,hl		;f427
	ld bc,05f00h		;f428
	add hl,bc		;f42b
	ex de,hl		;f42c
	call L_EE24		;f42d
	ld b,008h		;f430
L_F432:
	ld a,(de)		;f432
L_F433:
	out (098h),a		;f433
	inc de			;f435
	and a			;f436
	and a			;f437
	djnz L_F432		;f438
	ei			;f43a
	ld de,00040h		;f43b
	add hl,de		;f43e
	ex de,hl		;f43f
L_F440:
	inc ix			;f440
	jp L_F41D		;f442
L_F445:
	call L_C858		;f445
	call L_F3DC		;f448
	xor a			;f44b
	ld (0dcc3h),a		;f44c
	ld hl,0dc09h		;f44f
	ld b,048h		;f452
L_F454:
	res 7,(hl)		;f454
	inc hl			;f456
	djnz L_F454		;f457
	ld c,008h		;f459
	ld ix,0db68h		;f45b
	ld iy,0dcb1h		;f45f
	ld hl,00120h		;f463
L_F466:
	push bc			;f466
	call L_F4E4		;f467
	pop bc			;f46a
	dec c			;f46b
	jr nz,L_F48C		;f46c
	ld b,c			;f46e
L_F46F:
	dec bc			;f46f
	ld a,b			;f470
	or c			;f471
	jr nz,L_F46F		;f472
	ret			;f474
L_F475:
	ld de,0f000h		;f475
L_F478:
	ld a,d			;f478
	out (0aah),a		;f479
	in a,(0a9h)		;f47b
	ld b,008h		;f47d
L_F47F:
	rrca			;f47f
	ret nc			;f480
	inc e			;f481
	djnz L_F47F		;f482
	inc d			;f484
	ld a,0f9h		;f485
	cp d			;f487
	jr z,L_F475		;f488
	jr L_F478		;f48a
L_F48C:
	call L_F475		;f48c
	xor a			;f48f
	scf			;f490
L_F491:
	rra			;f491
	djnz L_F491		;f492
	ld (iy+000h),a		;f494
	inc iy			;f497
	ld (iy+000h),d		;f499
	inc iy			;f49c
	ld d,b			;f49e
	push hl			;f49f
	ld hl,0dc09h		;f4a0
	add hl,de		;f4a3
	ld a,(hl)		;f4a4
	bit 7,a			;f4a5
	jr z,L_F4B0		;f4a7
	dec iy			;f4a9
	dec iy			;f4ab
	pop hl			;f4ad
	jr L_F48C		;f4ae
L_F4B0:
	set 7,(hl)		;f4b0
	push ix			;f4b2
	pop hl			;f4b4
	ld b,006h		;f4b5
L_F4B7:
	ld (hl),020h		;f4b7
	inc hl			;f4b9
	djnz L_F4B7		;f4ba
	cp 015h			;f4bc
	jr c,L_F4C6		;f4be
	ld (ix+000h),a		;f4c0
	pop hl			;f4c3
	jr L_F466		;f4c4
L_F4C6:
	ld b,a			;f4c6
	ld hl,0dc52h		;f4c7
	jr L_F4D2		;f4ca
L_F4CC:
	ld a,(hl)		;f4cc
	cp 000h			;f4cd
	inc hl			;f4cf
	jr nz,L_F4CC		;f4d0
L_F4D2:
	djnz L_F4CC		;f4d2
	push ix			;f4d4
	pop de			;f4d6
L_F4D7:
	ld a,(hl)		;f4d7
	cp 000h			;f4d8
	jr z,L_F4E1		;f4da
	ld (de),a		;f4dc
	inc hl			;f4dd
	inc de			;f4de
	jr L_F4D7		;f4df
L_F4E1:
	pop hl			;f4e1
	jr L_F466		;f4e2
L_F4E4:
	call L_F50E		;f4e4
L_F4E7:
	ld a,(ix+000h)		;f4e7
	inc ix			;f4ea
	and a			;f4ec
	jr z,L_F50E		;f4ed
	call L_F528		;f4ef
	jr L_F4E7		;f4f2
L_F4F4:
	ld a,080h		;f4f4
	ld de,0eb38h		;f4f6
	push hl			;f4f9
	call L_E1BC		;f4fa
	inc a			;f4fd
	ld de,0ed61h		;f4fe
	call L_E1BC		;f501
	ld a,002h		;f504
	ld de,0ed6bh		;f506
	call L_E1BC		;f509
	pop hl			;f50c
	ret			;f50d
L_F50E:
	ld a,0f3h		;f50e
	ld (0e1bch),a		;f510
	ld (0e18fh),a		;f513
	xor a			;f516
	ld de,00000h		;f517
	push hl			;f51a
	call L_E1BC		;f51b
	inc a			;f51e
	call L_E1BC		;f51f
	inc a			;f522
	call L_E1BC		;f523
	pop hl			;f526
	ret			;f527
L_F528:
	ld bc,00bb8h		;f528
	push af			;f52b
	call L_F5DB		;f52c
	pop af			;f52f
	cp 020h			;f530
	jr nc,L_F5A9		;f532
	call L_EE24		;f534
	ld b,008h		;f537
	push af			;f539
L_F53A:
	xor a			;f53a
L_F53B:
	out (098h),a		;f53b
	and a			;f53d
	and a			;f53e
	djnz L_F53A		;f53f
	ei			;f541
	pop af			;f542
	cp 001h			;f543
	jr nz,L_F561		;f545
	ld a,h			;f547
	and 018h		;f548
	ld h,a			;f54a
	ld a,l			;f54b
	and 038h		;f54c
	ld l,a			;f54e
	ld a,(ix+000h)		;f54f
	inc ix			;f552
	push hl			;f554
	ld l,a			;f555
	ld h,000h		;f556
	ld b,006h		;f558
L_F55A:
	add hl,hl		;f55a
	djnz L_F55A		;f55b
	pop bc			;f55d
	add hl,bc		;f55e
	jr L_F5C8		;f55f
L_F561:
	cp 014h			;f561
	jr nz,L_F574		;f563
	call L_F50E		;f565
	ld bc,00000h		;f568
	call L_F5DB		;f56b
	call L_F5DB		;f56e
	jp L_F4F4		;f571
L_F574:
	ld a,h			;f574
	and 018h		;f575
	ld h,a			;f577
	ld a,l			;f578
	and 038h		;f579
	ld l,a			;f57b
	cp 038h			;f57c
	jr nz,L_F588		;f57e
	ld a,h			;f580
	add a,009h		;f581
	ld h,a			;f583
	ld l,000h		;f584
	jr L_F58C		;f586
L_F588:
	ld bc,00108h		;f588
	add hl,bc		;f58b
L_F58C:
	ld b,007h		;f58c
	call L_EE24		;f58e
L_F591:
	ld a,07fh		;f591
L_F593:
	out (098h),a		;f593
	and a			;f595
	and a			;f596
	djnz L_F591		;f597
	ei			;f599
	push hl			;f59a
	call L_F50E		;f59b
	ld bc,00fa0h		;f59e
	call L_F5DB		;f5a1
	call L_F4F4		;f5a4
	pop hl			;f5a7
	ret			;f5a8
L_F5A9:
	push hl			;f5a9
	ld l,a			;f5aa
	ld h,000h		;f5ab
	add hl,hl		;f5ad
	add hl,hl		;f5ae
	add hl,hl		;f5af
	ld de,05f00h		;f5b0
	add hl,de		;f5b3
	ex de,hl		;f5b4
	pop hl			;f5b5
	call L_EE24		;f5b6
	ld b,008h		;f5b9
L_F5BB:
	ld a,(de)		;f5bb
L_F5BC:
	out (098h),a		;f5bc
	inc de			;f5be
L_F5BF:
	and a			;f5bf
	and a			;f5c0
	djnz L_F5BB		;f5c1
	ei			;f5c3
	ld bc,00040h		;f5c4
	add hl,bc		;f5c7
L_F5C8:
	call L_EE24		;f5c8
	ld b,007h		;f5cb
L_F5CD:
	ld a,07fh		;f5cd
L_F5CF:
	out (098h),a		;f5cf
	and a			;f5d1
	and a			;f5d2
	djnz L_F5CD		;f5d3
	ei			;f5d5
	ld b,000h		;f5d6
L_F5D8:
	djnz L_F5D8		;f5d8
	ret			;f5da
L_F5DB:
	dec bc			;f5db
	ld a,b			;f5dc
	or c			;f5dd
	jr nz,L_F5DB		;f5de
	ret			;f5e0
L_F5E1:
	inc hl			;f5e1
	ld a,l			;f5e2
	and 03fh		;f5e3
	ret nz			;f5e5
	dec hl			;f5e6
	ld a,l			;f5e7
	and 0c0h		;f5e8
	ld l,a			;f5ea
	out (099h),a		;f5eb
	ld a,h			;f5ed
	add a,008h		;f5ee
	ld h,a			;f5f0
	out (099h),a		;f5f1
	ret			;f5f3
L_F5F4:
	and a			;f5f4
	rra			;f5f5
	push af			;f5f6
	ld l,a			;f5f7
	ld h,000h		;f5f8
	add hl,hl		;f5fa
	add hl,hl		;f5fb
	add hl,hl		;f5fc
	add hl,hl		;f5fd
	add hl,hl		;f5fe
	add hl,hl		;f5ff
	ld de,0a560h		;f600
	add hl,de		;f603
	pop af			;f604
	jr nc,L_F609		;f605
	inc hl			;f607
	inc hl			;f608
L_F609:
	ld c,002h		;f609
	ld de,01758h		;f60b
	ex de,hl		;f60e
L_F60F:
	push hl			;f60f
	call L_EE24		;f610
	ld b,010h		;f613
L_F615:
	ld a,(de)		;f615
L_F616:
	out (098h),a		;f616
	inc de			;f618
	inc de			;f619
	inc de			;f61a
	inc de			;f61b
	call L_F5E1		;f61c
	djnz L_F615		;f61f
	ei			;f621
	ld hl,0ffc1h		;f622
	add hl,de		;f625
	ex de,hl		;f626
	pop hl			;f627
	ld a,040h		;f628
	add a,l			;f62a
	ld l,a			;f62b
	ld a,h			;f62c
	adc a,000h		;f62d
	ld h,a			;f62f
	dec c			;f630
	jr nz,L_F60F		;f631
	ret			;f633
L_F634:
	ld hl,02108h		;f634
	ld c,038h		;f637
	call L_F649		;f639
	ld hl,02900h		;f63c
	ld c,040h		;f63f
	call L_F649		;f641
	ld hl,03100h		;f644
	ld c,028h		;f647
L_F649:
	ld b,018h		;f649
L_F64B:
	call L_EE24		;f64b
	push bc			;f64e
	push hl			;f64f
L_F650:
	out (098h),a		;f650
	and a			;f652
	dec c			;f653
	jr nz,L_F650		;f654
	pop hl			;f656
	ld bc,00040h		;f657
	add hl,bc		;f65a
	pop bc			;f65b
	djnz L_F64B		;f65c
	ei			;f65e
	ret			;f65f
L_F660:
	ld d,0f0h		;f660
L_F662:
	ld a,d			;f662
	out (0aah),a		;f663
	in a,(0a9h)		;f665
	cp 0ffh			;f667
	ret nz			;f669
	inc d			;f66a
	ld a,0f9h		;f66b
	cp d			;f66d
	ret z			;f66e
	jr L_F662		;f66f
L_F671:
	call L_C858		;f671
	call L_F3DC		;f674
	ld ix,0dd87h		;f677
	ld hl,00118h		;f67b
	call L_F4E4		;f67e
	pop de			;f681
	push hl			;f682
	ld h,d			;f683
	ld l,e			;f684
	inc de			;f685
	ld bc,00005h		;f686
	ld (hl),020h		;f689
	ldir			;f68b
	ld bc,00005h		;f68d
	and a			;f690
	sbc hl,bc		;f691
	ex de,hl		;f693
	ld b,006h		;f694
	pop hl			;f696
L_F697:
	push bc			;f697
	push de			;f698
L_F699:
	call L_F660		;f699
	jr nz,L_F699		;f69c
	ld bc,007d0h		;f69e
	call L_D81A		;f6a1
	call L_F475		;f6a4
	ld d,000h		;f6a7
	push hl			;f6a9
	ld hl,0dc09h		;f6aa
	add hl,de		;f6ad
	ld a,(hl)		;f6ae
	pop hl			;f6af
	and 07fh		;f6b0
	cp 030h			;f6b2
	jr nc,L_F6C8		;f6b4
	cp 014h			;f6b6
	jr z,L_F6E6		;f6b8
	cp 011h			;f6ba
	jr z,L_F6C6		;f6bc
	cp 010h			;f6be
	jr nz,L_F699		;f6c0
	pop de			;f6c2
	pop bc			;f6c3
	jr L_F6D5		;f6c4
L_F6C6:
	ld a,020h		;f6c6
L_F6C8:
	pop de			;f6c8
	pop bc			;f6c9
	push bc			;f6ca
	ld (de),a		;f6cb
	push de			;f6cc
	call L_F528		;f6cd
	pop de			;f6d0
	inc de			;f6d1
	pop bc			;f6d2
	djnz L_F697		;f6d3
L_F6D5:
	ld a,00dh		;f6d5
	call L_F528		;f6d7
	ld bc,00000h		;f6da
L_F6DD:
	dec bc			;f6dd
	ld a,b			;f6de
	or c			;f6df
	jr nz,L_F6DD		;f6e0
	pop hl			;f6e2
	jp L_D560		;f6e3
L_F6E6:
	pop de			;f6e6
	pop bc			;f6e7
	ld a,b			;f6e8
	push bc			;f6e9
	push de			;f6ea
	cp 006h			;f6eb
	jp z,L_F699		;f6ed
	call L_EE24		;f6f0
	ld b,008h		;f6f3
L_F6F5:
	ld a,000h		;f6f5
	out (098h),a		;f6f7
	nop			;f6f9
	djnz L_F6F5		;f6fa
	ei			;f6fc
	ld de,00040h		;f6fd
	and a			;f700
	sbc hl,de		;f701
	call L_EE24		;f703
	ld b,007h		;f706
L_F708:
	ld a,07fh		;f708
	out (098h),a		;f70a
	nop			;f70c
	djnz L_F708		;f70d
	out (098h),a		;f70f
	ei			;f711
	pop de			;f712
	dec de			;f713
	ld a,020h		;f714
	ld (de),a		;f716
	pop bc			;f717
	inc b			;f718
	jp L_F697		;f719
L_F71C:
	ld a,0c2h		;f71c
	out (099h),a		;f71e
	and a			;f720
	and a			;f721
	ld a,081h		;f722
	out (099h),a		;f724
	call L_C858		;f726
	call L_F3DC		;f729
	ld ix,0dac6h		;f72c
	ld hl,00108h		;f730
	call L_F4E4		;f733
L_F736:
	call L_F660		;f736
	jr z,L_F736		;f739
L_F73B:
	call L_F3DC		;f73b
	ld ix,0f7d6h		;f73e
	ld hl,001f0h		;f742
	call L_F4E4		;f745
	ld hl,0dd08h		;f748
	ld de,0d6d8h		;f74b
	ld bc,0007fh		;f74e
	ldir			;f751
	nop			;f753
	nop			;f754
	nop			;f755
L_F756:
	ld a,0f9h		;f756
	ld (0f81ah),a		;f758
	ld ix,0f77dh		;f75b
	ld de,00008h		;f75f
	ld a,000h		;f762
	scf			;f764
	call L_F7F6		;f765
	jr nc,L_F756		;f768
	ld a,(0f77dh)		;f76a
	cp 002h			;f76d
	jr nz,L_F756		;f76f
	ld ix,0f7e6h		;f771
	ld hl,009d0h		;f775
	call L_F4E4		;f778
	jr $+3			;f77b

; ----------------------------------------------------------------------
; DATOS relleno: o resto (1 B; 1 bytes)
;   0xf77d..0xf77e  (1 bytes)
; ----------------------------------------------------------------------
	defb 000h	; f77d  .

; ======================================================================
; CODIGO 0xf77e..0xf7c7  (73 bytes)
; ======================================================================


L_F77E:
	ld ix,00000h		;f77e
	ld de,00000h		;f782
	xor a			;f785
	ld (0f81ah),a		;f786
	ld a,0ffh		;f789
	scf			;f78b
	call L_F7F6		;f78c
L_F78F:
	jr nc,L_F79D		;f78f
	dec ix			;f791
	ld b,(ix+000h)		;f793
	ld a,(0f76eh)		;f796
	cp b			;f799
	jp z,L_F7B0		;f79a
L_F79D:
	call L_F3DC		;f79d
	ld ix,0f7c7h		;f7a0
	ld hl,001f8h		;f7a4
	call L_F4E4		;f7a7
	call L_F7B8		;f7aa
	jp L_F73B		;f7ad
L_F7B0:
	ld a,001h		;f7b0
	ld (0a529h),a		;f7b2
	jp 0a279h		;f7b5
L_F7B8:
	ld b,008h		;f7b8
L_F7BA:
	push bc			;f7ba
	ld bc,00000h		;f7bb
L_F7BE:
	dec bc			;f7be
	ld a,b			;f7bf
	or c			;f7c0
	jr nz,L_F7BE		;f7c1
	pop bc			;f7c3
	djnz L_F7BA		;f7c4
	ret			;f7c6

; ----------------------------------------------------------------------
; DATOS tabla: (47 B; racha 1.95, entropia 3.71, 15 valores: pocos valores para ser un dibujo)
;   0xf7c7..0xf7f6  (47 bytes)
; ----------------------------------------------------------------------
	defb 045h,052h,052h,04fh,052h,020h,044h,045h,020h,043h,041h,052h,047h,041h,000h,042h	; f7c7  ERROR DE CARGA.B
	defb 055h,053h,043h,041h,04eh,044h,04fh,020h,046h,041h,053h,045h,020h,032h,000h,043h	; f7d7  USCANDO FASE 2.C
	defb 041h,052h,047h,041h,04eh,044h,04fh,020h,046h,041h,053h,045h,020h,032h,000h	; f7e7  ARGANDO FASE 2.

; ======================================================================
; CODIGO 0xf7f6..0xf8c8  (210 bytes)
; ======================================================================


L_F7F6:
	ld hl,L_F89F		;f7f6
	push hl			;f7f9
	push af			;f7fa
	ld a,008h		;f7fb
	out (0abh),a		;f7fd
	ld a,00eh		;f7ff
	out (0a0h),a		;f801
	pop af			;f803
	inc d			;f804
	ex af,af'		;f805
	dec d			;f806
	di			;f807
	ld a,005h		;f808
	ld c,a			;f80a
	cp a			;f80b
L_F80C:
	call L_F87C		;f80c
	jr nc,L_F80C		;f80f
	ld hl,00415h		;f811
L_F814:
	djnz L_F814		;f814
	dec hl			;f816
	ld a,h			;f817
	or l			;f818
	jr nz,L_F814		;f819
	call L_F878		;f81b
	jr nc,L_F80C		;f81e
L_F820:
	ld b,09ch		;f820
	call L_F878		;f822
	jr nc,L_F80C		;f825
	ld a,0c6h		;f827
	cp b			;f829
	jr nc,L_F80C		;f82a
	inc h			;f82c
	jr nz,L_F820		;f82d
L_F82F:
	ld b,0c9h		;f82f
	call L_F87C		;f831
	jr nc,L_F80C		;f834
	ld a,b			;f836
	cp 0d4h			;f837
	jr nc,L_F82F		;f839
	call L_F87C		;f83b
	ret nc			;f83e
	ld h,000h		;f83f
	ld b,0b0h		;f841
	jr L_F85D		;f843
L_F845:
	ex af,af'		;f845
	jr nz,L_F84D		;f846
	ld (ix+000h),l		;f848
	jr L_F857		;f84b
L_F84D:
	rr c			;f84d
	xor l			;f84f
	ret nz			;f850
	ld a,c			;f851
	rla			;f852
	ld c,a			;f853
	inc de			;f854
	jr L_F859		;f855
L_F857:
	inc ix			;f857
L_F859:
	dec de			;f859
	ex af,af'		;f85a
	ld b,0b2h		;f85b
L_F85D:
	ld l,001h		;f85d
L_F85F:
	call L_F878		;f85f
	ret nc			;f862
	ld a,0cbh		;f863
	cp b			;f865
	rl l			;f866
	ld b,0b0h		;f868
	jp nc,L_F85F		;f86a
	ld a,h			;f86d
	xor l			;f86e
	ld h,a			;f86f
	ld a,d			;f870
	or e			;f871
	jr nz,L_F845		;f872
	ld a,h			;f874
	cp 001h			;f875
	ret			;f877
L_F878:
	call L_F87C		;f878
	ret nc			;f87b
L_F87C:
	ld a,016h		;f87c
L_F87E:
	dec a			;f87e
	jr nz,L_F87E		;f87f
	and a			;f881
L_F882:
	inc b			;f882
	nop			;f883
	ret z			;f884
	ld a,000h		;f885
	in a,(0a2h)		;f887
	cpl			;f889
	xor c			;f88a
	and 080h		;f88b
	jp z,L_F882		;f88d
	ld a,c			;f890
	cpl			;f891
	ld c,a			;f892
	ld a,r			;f893
	and 00fh		;f895
	out (099h),a		;f897
	ld a,087h		;f899
	out (099h),a		;f89b
	scf			;f89d
	ret			;f89e
L_F89F:
	ld e,013h		;f89f
	ld a,009h		;f8a1
	out (0abh),a		;f8a3
	ld a,001h		;f8a5
	out (099h),a		;f8a7
	ld a,087h		;f8a9
	out (099h),a		;f8ab
	ret			;f8ad
L_F8AE:
	ld l,000h		;f8ae
	ld a,e			;f8b0
	rra			;f8b1
	rr l			;f8b2
	rra			;f8b4
	rr l			;f8b5
	and 007h		;f8b7
	ld h,a			;f8b9
	ld a,d			;f8ba
	and 03fh		;f8bb
	or l			;f8bd
	ld l,a			;f8be
	ld a,d			;f8bf
	rra			;f8c0
	rra			;f8c1
	rra			;f8c2
	and 018h		;f8c3
	or h			;f8c5
	ld h,a			;f8c6
	ret			;f8c7

; ----------------------------------------------------------------------
; DATOS tabla: (170 B; racha 8.14, entropia 1.05, 3 valores: pocos valores para ser un dibujo)
;   0xf8c8..0xf972  (170 bytes)
; ----------------------------------------------------------------------
	defb 0ffh,000h,000h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; f8c8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; f8d8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; f8e8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; f8f8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; f908  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; f918  ................
	defb 03fh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; f928  ?...............
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; f938  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; f948  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; f958  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; f968  ..........

; ======================================================================
; CODIGO 0xf972..0xfde7  (1141 bytes)
; ======================================================================


L_F972:
	nop			;f972
	rst 38h			;f973
	nop			;f974
	rst 38h			;f975
	nop			;f976
	rst 38h			;f977
	nop			;f978
	rst 38h			;f979
	nop			;f97a
	rst 38h			;f97b
	nop			;f97c
	rst 38h			;f97d
	nop			;f97e
	rst 38h			;f97f
	nop			;f980
	rst 38h			;f981
	nop			;f982
	rst 38h			;f983
	nop			;f984
	rst 38h			;f985
	nop			;f986
	rst 38h			;f987
	nop			;f988
	rst 38h			;f989
	nop			;f98a
	rst 38h			;f98b
	nop			;f98c
	rst 38h			;f98d
	nop			;f98e
	rst 38h			;f98f
	nop			;f990
	rst 38h			;f991
	nop			;f992
	rst 38h			;f993
	nop			;f994
	rst 38h			;f995
	nop			;f996
	rst 38h			;f997
	nop			;f998
	rst 38h			;f999
	nop			;f99a
	rst 38h			;f99b
	nop			;f99c
	rst 38h			;f99d
	nop			;f99e
	rst 38h			;f99f
	nop			;f9a0
	rst 38h			;f9a1
	nop			;f9a2
	rst 38h			;f9a3
	nop			;f9a4
	rst 38h			;f9a5
	nop			;f9a6
	rst 38h			;f9a7
	ld b,e			;f9a8
	nop			;f9a9
	rst 38h			;f9aa
	nop			;f9ab
	rst 38h			;f9ac
	nop			;f9ad
	rst 38h			;f9ae
	nop			;f9af
	rst 38h			;f9b0
	nop			;f9b1
	rst 38h			;f9b2
	nop			;f9b3
	rst 38h			;f9b4
	nop			;f9b5
	rst 38h			;f9b6
	nop			;f9b7
	rst 38h			;f9b8
	nop			;f9b9
	rst 38h			;f9ba
	nop			;f9bb
	rst 38h			;f9bc
	nop			;f9bd
	rst 38h			;f9be
	nop			;f9bf
	rst 38h			;f9c0
	nop			;f9c1
	rst 38h			;f9c2
	nop			;f9c3
	rst 38h			;f9c4
	nop			;f9c5
	rst 38h			;f9c6
	nop			;f9c7
	rst 38h			;f9c8
	nop			;f9c9
	rst 38h			;f9ca
	nop			;f9cb
	rst 38h			;f9cc
	nop			;f9cd
	rst 38h			;f9ce
	nop			;f9cf
	rst 38h			;f9d0
	nop			;f9d1
	rst 38h			;f9d2
	nop			;f9d3
	rst 38h			;f9d4
	nop			;f9d5
	rst 38h			;f9d6
	nop			;f9d7
	rst 38h			;f9d8
	nop			;f9d9
	rst 38h			;f9da
	nop			;f9db
	rst 38h			;f9dc
	nop			;f9dd
	rst 38h			;f9de
	nop			;f9df
	rst 38h			;f9e0
	nop			;f9e1
	rst 38h			;f9e2
	nop			;f9e3
	rst 38h			;f9e4
	nop			;f9e5
	rst 38h			;f9e6
	nop			;f9e7
	rst 38h			;f9e8
	nop			;f9e9
	rst 38h			;f9ea
	nop			;f9eb
	rst 38h			;f9ec
	nop			;f9ed
	rst 38h			;f9ee
	nop			;f9ef
	rst 38h			;f9f0
	nop			;f9f1
	rst 38h			;f9f2
	nop			;f9f3
	rst 38h			;f9f4
	nop			;f9f5
	rst 38h			;f9f6
	nop			;f9f7
	rst 38h			;f9f8
	nop			;f9f9
	rst 38h			;f9fa
	nop			;f9fb
	rst 38h			;f9fc
	nop			;f9fd
	rst 38h			;f9fe
	nop			;f9ff
	rst 38h			;fa00
	nop			;fa01
	rst 38h			;fa02
	nop			;fa03
	rst 38h			;fa04
	nop			;fa05
	rst 38h			;fa06
	nop			;fa07
	rst 38h			;fa08
	nop			;fa09
	rst 38h			;fa0a
	nop			;fa0b
	rst 38h			;fa0c
	nop			;fa0d
	rst 38h			;fa0e
	nop			;fa0f
	rst 38h			;fa10
	nop			;fa11
	rst 38h			;fa12
	nop			;fa13
	rst 38h			;fa14
	nop			;fa15
	rst 38h			;fa16
	nop			;fa17
	rst 38h			;fa18
	nop			;fa19
	rst 38h			;fa1a
	nop			;fa1b
	rst 38h			;fa1c
	nop			;fa1d
	rst 38h			;fa1e
	nop			;fa1f
	rst 38h			;fa20
	nop			;fa21
	rst 38h			;fa22
	nop			;fa23
	rst 38h			;fa24
	nop			;fa25
	rst 38h			;fa26
	nop			;fa27
	add a,e			;fa28
	rst 38h			;fa29
	nop			;fa2a
	rst 38h			;fa2b
	nop			;fa2c
	rst 38h			;fa2d
	nop			;fa2e
	rst 38h			;fa2f
	nop			;fa30
	rst 38h			;fa31
	nop			;fa32
	rst 38h			;fa33
	nop			;fa34
	rst 38h			;fa35
	nop			;fa36
	rst 38h			;fa37
	nop			;fa38
	rst 38h			;fa39
	nop			;fa3a
	rst 38h			;fa3b
	nop			;fa3c
	rst 38h			;fa3d
	nop			;fa3e
	rst 38h			;fa3f
	nop			;fa40
	rst 38h			;fa41
	nop			;fa42
	rst 38h			;fa43
	nop			;fa44
	rst 38h			;fa45
	nop			;fa46
	rst 38h			;fa47
	nop			;fa48
	rst 38h			;fa49
	nop			;fa4a
	rst 38h			;fa4b
	nop			;fa4c
	rst 38h			;fa4d
	nop			;fa4e
	rst 38h			;fa4f
	nop			;fa50
	rst 38h			;fa51
	nop			;fa52
	rst 38h			;fa53
	nop			;fa54
	rst 38h			;fa55
	nop			;fa56
	rst 38h			;fa57
	nop			;fa58
	rst 38h			;fa59
	nop			;fa5a
	rst 38h			;fa5b
	nop			;fa5c
	rst 38h			;fa5d
	nop			;fa5e
	rst 38h			;fa5f
	nop			;fa60
	rst 38h			;fa61
	nop			;fa62
	rst 38h			;fa63
	nop			;fa64
	rst 38h			;fa65
	nop			;fa66
	rst 38h			;fa67
	nop			;fa68
	rst 38h			;fa69
	nop			;fa6a
	rst 38h			;fa6b
	nop			;fa6c
	rst 38h			;fa6d
	nop			;fa6e
	rst 38h			;fa6f
	nop			;fa70
	rst 38h			;fa71
	nop			;fa72
	rst 38h			;fa73
	nop			;fa74
	rst 38h			;fa75
	nop			;fa76
	rst 38h			;fa77
	nop			;fa78
	rst 38h			;fa79
	nop			;fa7a
	rst 38h			;fa7b
	nop			;fa7c
	rst 38h			;fa7d
	nop			;fa7e
	rst 38h			;fa7f
	nop			;fa80
	rst 38h			;fa81
	nop			;fa82
	rst 38h			;fa83
	nop			;fa84
	rst 38h			;fa85
	nop			;fa86
	rst 38h			;fa87
	nop			;fa88
	rst 38h			;fa89
	nop			;fa8a
	rst 38h			;fa8b
	nop			;fa8c
	rst 38h			;fa8d
	nop			;fa8e
	rst 38h			;fa8f
	nop			;fa90
	rst 38h			;fa91
	nop			;fa92
	rst 38h			;fa93
	nop			;fa94
	rst 38h			;fa95
	nop			;fa96
	rst 38h			;fa97
	nop			;fa98
	rst 38h			;fa99
	nop			;fa9a
	rst 38h			;fa9b
	nop			;fa9c
	rst 38h			;fa9d
	nop			;fa9e
	rst 38h			;fa9f
	nop			;faa0
	rst 38h			;faa1
	nop			;faa2
	rst 38h			;faa3
	nop			;faa4
	rst 38h			;faa5
	nop			;faa6
	rst 38h			;faa7
	sub h			;faa8
	nop			;faa9
	rst 38h			;faaa
	nop			;faab
	rst 38h			;faac
	nop			;faad
	rst 38h			;faae
	nop			;faaf
	rst 38h			;fab0
	nop			;fab1
	rst 38h			;fab2
	nop			;fab3
	rst 38h			;fab4
	nop			;fab5
	rst 38h			;fab6
	nop			;fab7
	rst 38h			;fab8
	nop			;fab9
	rst 38h			;faba
	nop			;fabb
	rst 38h			;fabc
	nop			;fabd
	rst 38h			;fabe
L_FABF:
	nop			;fabf
	rst 38h			;fac0
	nop			;fac1
	rst 38h			;fac2
	nop			;fac3
	rst 38h			;fac4
	nop			;fac5
	rst 38h			;fac6
	nop			;fac7
	rst 38h			;fac8
	nop			;fac9
	rst 38h			;faca
	nop			;facb
	rst 38h			;facc
	nop			;facd
	rst 38h			;face
	nop			;facf
	rst 38h			;fad0
	nop			;fad1
	rst 38h			;fad2
	nop			;fad3
	rst 38h			;fad4
	nop			;fad5
	rst 38h			;fad6
	nop			;fad7
	rst 38h			;fad8
	nop			;fad9
	rst 38h			;fada
	nop			;fadb
	rst 38h			;fadc
	nop			;fadd
	rst 38h			;fade
	nop			;fadf
	rst 38h			;fae0
	nop			;fae1
	rst 38h			;fae2
	nop			;fae3
	rst 38h			;fae4
	nop			;fae5
	rst 38h			;fae6
	nop			;fae7
	rst 38h			;fae8
	nop			;fae9
	rst 38h			;faea
	nop			;faeb
	rst 38h			;faec
	nop			;faed
	rst 38h			;faee
	nop			;faef
	rst 38h			;faf0
	nop			;faf1
	rst 38h			;faf2
	nop			;faf3
	rst 38h			;faf4
	nop			;faf5
	rst 38h			;faf6
	nop			;faf7
	rst 38h			;faf8
	nop			;faf9
	rst 38h			;fafa
	nop			;fafb
	rst 38h			;fafc
	nop			;fafd
	rst 38h			;fafe
	nop			;faff
	rst 38h			;fb00
	nop			;fb01
	rst 38h			;fb02
	nop			;fb03
	rst 38h			;fb04
	nop			;fb05
	rst 38h			;fb06
	nop			;fb07
	rst 38h			;fb08
	nop			;fb09
	rst 38h			;fb0a
	nop			;fb0b
	rst 38h			;fb0c
	nop			;fb0d
	rst 38h			;fb0e
	nop			;fb0f
	rst 38h			;fb10
	nop			;fb11
	rst 38h			;fb12
	nop			;fb13
	rst 38h			;fb14
	nop			;fb15
	rst 38h			;fb16
	nop			;fb17
	rst 38h			;fb18
	nop			;fb19
	rst 38h			;fb1a
	nop			;fb1b
	rst 38h			;fb1c
	nop			;fb1d
	rst 38h			;fb1e
	nop			;fb1f
	rst 38h			;fb20
	nop			;fb21
	rst 38h			;fb22
	nop			;fb23
	rst 38h			;fb24
	nop			;fb25
	rst 38h			;fb26
	nop			;fb27
	sbc a,l			;fb28
	rst 38h			;fb29
	nop			;fb2a
	rst 38h			;fb2b
	nop			;fb2c
	rst 38h			;fb2d
	nop			;fb2e
	rst 38h			;fb2f
	nop			;fb30
	rst 38h			;fb31
	nop			;fb32
	rst 38h			;fb33
	nop			;fb34
	rst 38h			;fb35
	nop			;fb36
	rst 38h			;fb37
	nop			;fb38
	rst 38h			;fb39
	nop			;fb3a
	rst 38h			;fb3b
	nop			;fb3c
	rst 38h			;fb3d
	nop			;fb3e
	rst 38h			;fb3f
	nop			;fb40
	rst 38h			;fb41
	nop			;fb42
	rst 38h			;fb43
	nop			;fb44
	rst 38h			;fb45
	nop			;fb46
	rst 38h			;fb47
	nop			;fb48
	rst 38h			;fb49
	nop			;fb4a
	rst 38h			;fb4b
L_FB4C:
	nop			;fb4c
	rst 38h			;fb4d
	nop			;fb4e
	rst 38h			;fb4f
	nop			;fb50
	rst 38h			;fb51
	nop			;fb52
	rst 38h			;fb53
	nop			;fb54
	rst 38h			;fb55
	nop			;fb56
	rst 38h			;fb57
	nop			;fb58
	rst 38h			;fb59
	nop			;fb5a
	rst 38h			;fb5b
	nop			;fb5c
	rst 38h			;fb5d
	nop			;fb5e
	rst 38h			;fb5f
	nop			;fb60
	rst 38h			;fb61
	nop			;fb62
	rst 38h			;fb63
	nop			;fb64
	rst 38h			;fb65
	nop			;fb66
	rst 38h			;fb67
	nop			;fb68
	rst 38h			;fb69
	nop			;fb6a
	rst 38h			;fb6b
	nop			;fb6c
	rst 38h			;fb6d
	nop			;fb6e
	rst 38h			;fb6f
	nop			;fb70
	rst 38h			;fb71
	nop			;fb72
	rst 38h			;fb73
	nop			;fb74
	rst 38h			;fb75
	nop			;fb76
	rst 38h			;fb77
	nop			;fb78
	rst 38h			;fb79
	nop			;fb7a
	rst 38h			;fb7b
	nop			;fb7c
	rst 38h			;fb7d
	nop			;fb7e
	rst 38h			;fb7f
	nop			;fb80
	rst 38h			;fb81
	nop			;fb82
	rst 38h			;fb83
	nop			;fb84
	rst 38h			;fb85
	nop			;fb86
	rst 38h			;fb87
	nop			;fb88
	rst 38h			;fb89
	nop			;fb8a
	rst 38h			;fb8b
	nop			;fb8c
	rst 38h			;fb8d
	nop			;fb8e
	rst 38h			;fb8f
	nop			;fb90
	rst 38h			;fb91
	nop			;fb92
	rst 38h			;fb93
	nop			;fb94
	rst 38h			;fb95
	nop			;fb96
	rst 38h			;fb97
	nop			;fb98
	rst 38h			;fb99
	nop			;fb9a
	rst 38h			;fb9b
	nop			;fb9c
	rst 38h			;fb9d
	nop			;fb9e
	rst 38h			;fb9f
	nop			;fba0
	rst 38h			;fba1
	nop			;fba2
	rst 38h			;fba3
	nop			;fba4
	rst 38h			;fba5
	nop			;fba6
	rst 38h			;fba7
	inc h			;fba8
	nop			;fba9
	rst 38h			;fbaa
	nop			;fbab
	rst 38h			;fbac
	nop			;fbad
	rst 38h			;fbae
	nop			;fbaf
	rst 38h			;fbb0
	nop			;fbb1
	rst 38h			;fbb2
	nop			;fbb3
	rst 38h			;fbb4
	nop			;fbb5
	rst 38h			;fbb6
	nop			;fbb7
	rst 38h			;fbb8
	nop			;fbb9
	rst 38h			;fbba
	nop			;fbbb
	rst 38h			;fbbc
	nop			;fbbd
	rst 38h			;fbbe
	nop			;fbbf
	rst 38h			;fbc0
	nop			;fbc1
	rst 38h			;fbc2
	nop			;fbc3
	rst 38h			;fbc4
	nop			;fbc5
	rst 38h			;fbc6
	nop			;fbc7
	rst 38h			;fbc8
	nop			;fbc9
	rst 38h			;fbca
	nop			;fbcb
	rst 38h			;fbcc
	nop			;fbcd
	rst 38h			;fbce
	nop			;fbcf
	rst 38h			;fbd0
	nop			;fbd1
	rst 38h			;fbd2
	nop			;fbd3
	rst 38h			;fbd4
	nop			;fbd5
	rst 38h			;fbd6
	nop			;fbd7
	rst 38h			;fbd8
	nop			;fbd9
	rst 38h			;fbda
	nop			;fbdb
	rst 38h			;fbdc
	nop			;fbdd
	rst 38h			;fbde
	nop			;fbdf
	rst 38h			;fbe0
	nop			;fbe1
	rst 38h			;fbe2
	nop			;fbe3
	rst 38h			;fbe4
	nop			;fbe5
	rst 38h			;fbe6
	nop			;fbe7
	rst 38h			;fbe8
	nop			;fbe9
	rst 38h			;fbea
	nop			;fbeb
	rst 38h			;fbec
	nop			;fbed
	rst 38h			;fbee
	nop			;fbef
	rst 38h			;fbf0
	nop			;fbf1
	rst 38h			;fbf2
	nop			;fbf3
	rst 38h			;fbf4
	nop			;fbf5
	rst 38h			;fbf6
	nop			;fbf7
	rst 38h			;fbf8
	nop			;fbf9
	rst 38h			;fbfa
	nop			;fbfb
	rst 38h			;fbfc
	nop			;fbfd
	rst 38h			;fbfe
	nop			;fbff
	rst 38h			;fc00
	nop			;fc01
	rst 38h			;fc02
	nop			;fc03
	rst 38h			;fc04
	nop			;fc05
	rst 38h			;fc06
	nop			;fc07
	rst 38h			;fc08
	nop			;fc09
	rst 38h			;fc0a
	nop			;fc0b
	rst 38h			;fc0c
	nop			;fc0d
	rst 38h			;fc0e
	nop			;fc0f
	rst 38h			;fc10
	nop			;fc11
	rst 38h			;fc12
	nop			;fc13
	rst 38h			;fc14
	nop			;fc15
	rst 38h			;fc16
	nop			;fc17
	rst 38h			;fc18
	nop			;fc19
	rst 38h			;fc1a
	nop			;fc1b
	rst 38h			;fc1c
	nop			;fc1d
	rst 38h			;fc1e
	nop			;fc1f
	rst 38h			;fc20
	nop			;fc21
	rst 38h			;fc22
	nop			;fc23
	rst 38h			;fc24
	nop			;fc25
	rst 38h			;fc26
	nop			;fc27
	inc e			;fc28
	rst 38h			;fc29
	nop			;fc2a
	rst 38h			;fc2b
	nop			;fc2c
	rst 38h			;fc2d
	nop			;fc2e
	rst 38h			;fc2f
	nop			;fc30
	rst 38h			;fc31
	nop			;fc32
	rst 38h			;fc33
	nop			;fc34
	rst 38h			;fc35
	nop			;fc36
	rst 38h			;fc37
	nop			;fc38
	rst 38h			;fc39
	nop			;fc3a
	rst 38h			;fc3b
	nop			;fc3c
	rst 38h			;fc3d
	nop			;fc3e
	rst 38h			;fc3f
	nop			;fc40
	rst 38h			;fc41
	nop			;fc42
	rst 38h			;fc43
	nop			;fc44
	rst 38h			;fc45
	nop			;fc46
	rst 38h			;fc47
	nop			;fc48
	rst 38h			;fc49
	nop			;fc4a
	rst 38h			;fc4b
	nop			;fc4c
	rst 38h			;fc4d
	nop			;fc4e
	rst 38h			;fc4f
	nop			;fc50
	rst 38h			;fc51
	nop			;fc52
	rst 38h			;fc53
	nop			;fc54
	rst 38h			;fc55
	nop			;fc56
	rst 38h			;fc57
	nop			;fc58
	rst 38h			;fc59
	nop			;fc5a
	rst 38h			;fc5b
	nop			;fc5c
L_FC5D:
	rst 38h			;fc5d
	nop			;fc5e
	rst 38h			;fc5f
	nop			;fc60
	rst 38h			;fc61
	nop			;fc62
	rst 38h			;fc63
	nop			;fc64
	rst 38h			;fc65
	nop			;fc66
	rst 38h			;fc67
	nop			;fc68
	rst 38h			;fc69
	nop			;fc6a
	rst 38h			;fc6b
	nop			;fc6c
	rst 38h			;fc6d
	nop			;fc6e
	rst 38h			;fc6f
	nop			;fc70
	rst 38h			;fc71
	nop			;fc72
	rst 38h			;fc73
	nop			;fc74
	rst 38h			;fc75
	nop			;fc76
L_FC77:
	rst 38h			;fc77
	nop			;fc78
	rst 38h			;fc79
	nop			;fc7a
	rst 38h			;fc7b
	nop			;fc7c
	rst 38h			;fc7d
	nop			;fc7e
	rst 38h			;fc7f
	nop			;fc80
	rst 38h			;fc81
	nop			;fc82
	rst 38h			;fc83
	nop			;fc84
	rst 38h			;fc85
	nop			;fc86
	rst 38h			;fc87
	nop			;fc88
	rst 38h			;fc89
	nop			;fc8a
	rst 38h			;fc8b
	nop			;fc8c
	rst 38h			;fc8d
	nop			;fc8e
	rst 38h			;fc8f
	nop			;fc90
	rst 38h			;fc91
	nop			;fc92
	rst 38h			;fc93
	nop			;fc94
	rst 38h			;fc95
	nop			;fc96
	rst 38h			;fc97
	nop			;fc98
	rst 38h			;fc99
	nop			;fc9a
	rst 38h			;fc9b
	nop			;fc9c
	rst 38h			;fc9d
	nop			;fc9e
	rst 38h			;fc9f
	nop			;fca0
	rst 38h			;fca1
	nop			;fca2
	rst 38h			;fca3
	nop			;fca4
	rst 38h			;fca5
	nop			;fca6
	rst 38h			;fca7
	pop bc			;fca8
	nop			;fca9
	rst 38h			;fcaa
	nop			;fcab
	rst 38h			;fcac
	nop			;fcad
	rst 38h			;fcae
	nop			;fcaf
	rst 38h			;fcb0
	nop			;fcb1
	rst 38h			;fcb2
	nop			;fcb3
	rst 38h			;fcb4
	nop			;fcb5
	rst 38h			;fcb6
	nop			;fcb7
	rst 38h			;fcb8
	nop			;fcb9
	rst 38h			;fcba
	nop			;fcbb
	rst 38h			;fcbc
	nop			;fcbd
	rst 38h			;fcbe
	nop			;fcbf
	rst 38h			;fcc0
	nop			;fcc1
	rst 38h			;fcc2
	nop			;fcc3
	rst 38h			;fcc4
	nop			;fcc5
	rst 38h			;fcc6
	nop			;fcc7
	rst 38h			;fcc8
	nop			;fcc9
	rst 38h			;fcca
	nop			;fccb
	rst 38h			;fccc
	nop			;fccd
	rst 38h			;fcce
	nop			;fccf
	rst 38h			;fcd0
	nop			;fcd1
	rst 38h			;fcd2
	nop			;fcd3
	rst 38h			;fcd4
	nop			;fcd5
	rst 38h			;fcd6
	nop			;fcd7
	rst 38h			;fcd8
	nop			;fcd9
	rst 38h			;fcda
	nop			;fcdb
	rst 38h			;fcdc
	nop			;fcdd
	rst 38h			;fcde
	nop			;fcdf
	rst 38h			;fce0
	nop			;fce1
	rst 38h			;fce2
	nop			;fce3
	rst 38h			;fce4
	nop			;fce5
	rst 38h			;fce6
	nop			;fce7
	rst 38h			;fce8
	nop			;fce9
	rst 38h			;fcea
	nop			;fceb
	rst 38h			;fcec
	nop			;fced
	rst 38h			;fcee
	nop			;fcef
	rst 38h			;fcf0
	nop			;fcf1
	rst 38h			;fcf2
	nop			;fcf3
	rst 38h			;fcf4
	nop			;fcf5
	rst 38h			;fcf6
	nop			;fcf7
	rst 38h			;fcf8
	nop			;fcf9
	rst 38h			;fcfa
	nop			;fcfb
	rst 38h			;fcfc
	nop			;fcfd
	rst 38h			;fcfe
	nop			;fcff
	rst 38h			;fd00
	nop			;fd01
	rst 38h			;fd02
	nop			;fd03
	rst 38h			;fd04
	nop			;fd05
	rst 38h			;fd06
	nop			;fd07
	rst 38h			;fd08
	nop			;fd09
	rst 38h			;fd0a
	nop			;fd0b
	rst 38h			;fd0c
	nop			;fd0d
	rst 38h			;fd0e
	nop			;fd0f
	rst 38h			;fd10
	nop			;fd11
	rst 38h			;fd12
	nop			;fd13
	rst 38h			;fd14
	nop			;fd15
	rst 38h			;fd16
	nop			;fd17
	rst 38h			;fd18
	nop			;fd19
	rst 38h			;fd1a
	nop			;fd1b
	rst 38h			;fd1c
	nop			;fd1d
	rst 38h			;fd1e
	nop			;fd1f
	rst 38h			;fd20
	nop			;fd21
	rst 38h			;fd22
	nop			;fd23
	rst 38h			;fd24
	nop			;fd25
	rst 38h			;fd26
	nop			;fd27
	jp m,000ffh		;fd28   ; BIOS LEFTC - Shifts screen pixel to the left
	rst 38h			;fd2b
	nop			;fd2c
	rst 38h			;fd2d
	nop			;fd2e
	rst 38h			;fd2f
	nop			;fd30
	rst 38h			;fd31
	nop			;fd32
	rst 38h			;fd33
	nop			;fd34
	rst 38h			;fd35
	nop			;fd36
	rst 38h			;fd37
	nop			;fd38
	rst 38h			;fd39
	nop			;fd3a
	rst 38h			;fd3b
	nop			;fd3c
	rst 38h			;fd3d
	nop			;fd3e
	rst 38h			;fd3f
	nop			;fd40
	rst 38h			;fd41
	nop			;fd42
	rst 38h			;fd43
	nop			;fd44
	rst 38h			;fd45
	nop			;fd46
	rst 38h			;fd47
	nop			;fd48
	rst 38h			;fd49
	nop			;fd4a
	rst 38h			;fd4b
	nop			;fd4c
	rst 38h			;fd4d
	nop			;fd4e
	rst 38h			;fd4f
	nop			;fd50
	rst 38h			;fd51
	nop			;fd52
	rst 38h			;fd53
	nop			;fd54
L_FD55:
	rst 38h			;fd55
	nop			;fd56
	rst 38h			;fd57
	nop			;fd58
	rst 38h			;fd59
	nop			;fd5a
	rst 38h			;fd5b
	nop			;fd5c
	rst 38h			;fd5d
	nop			;fd5e
	rst 38h			;fd5f
	nop			;fd60
	rst 38h			;fd61
	nop			;fd62
	rst 38h			;fd63
	nop			;fd64
	rst 38h			;fd65
	nop			;fd66
	rst 38h			;fd67
	nop			;fd68
	rst 38h			;fd69
	nop			;fd6a
	rst 38h			;fd6b
	nop			;fd6c
	rst 38h			;fd6d
	nop			;fd6e
	rst 38h			;fd6f
L_FD70:
	nop			;fd70
	rst 38h			;fd71
	nop			;fd72
	rst 38h			;fd73
	nop			;fd74
	rst 38h			;fd75
	nop			;fd76
	rst 38h			;fd77
	nop			;fd78
	rst 38h			;fd79
	nop			;fd7a
	rst 38h			;fd7b
	nop			;fd7c
	rst 38h			;fd7d
	nop			;fd7e
	rst 38h			;fd7f
	nop			;fd80
	rst 38h			;fd81
	nop			;fd82
	rst 38h			;fd83
	nop			;fd84
	rst 38h			;fd85
	nop			;fd86
	rst 38h			;fd87
	nop			;fd88
	rst 38h			;fd89
	nop			;fd8a
	rst 38h			;fd8b
	nop			;fd8c
	rst 38h			;fd8d
	nop			;fd8e
	rst 38h			;fd8f
	nop			;fd90
	rst 38h			;fd91
	nop			;fd92
	rst 38h			;fd93
	nop			;fd94
	rst 38h			;fd95
	nop			;fd96
	rst 38h			;fd97
	nop			;fd98
	rst 38h			;fd99
	nop			;fd9a
	rst 38h			;fd9b
	nop			;fd9c
	rst 38h			;fd9d
	nop			;fd9e
	rst 38h			;fd9f
	nop			;fda0
	rst 38h			;fda1
	nop			;fda2
	rst 38h			;fda3
	nop			;fda4
	rst 38h			;fda5
	nop			;fda6
	rst 38h			;fda7
	ret pe			;fda8
	nop			;fda9
	rst 38h			;fdaa
	nop			;fdab
	rst 38h			;fdac
	nop			;fdad
	rst 38h			;fdae
	nop			;fdaf
	rst 38h			;fdb0
	nop			;fdb1
	rst 38h			;fdb2
	nop			;fdb3
	rst 38h			;fdb4
	nop			;fdb5
	rst 38h			;fdb6
	nop			;fdb7
	rst 38h			;fdb8
	nop			;fdb9
	rst 38h			;fdba
	nop			;fdbb
	rst 38h			;fdbc
	nop			;fdbd
	rst 38h			;fdbe
	nop			;fdbf
	rst 38h			;fdc0
	nop			;fdc1
	rst 38h			;fdc2
	nop			;fdc3
	rst 38h			;fdc4
	nop			;fdc5
	rst 38h			;fdc6
	nop			;fdc7
	rst 38h			;fdc8
	nop			;fdc9
	rst 38h			;fdca
	nop			;fdcb
	rst 38h			;fdcc
	nop			;fdcd
	rst 38h			;fdce
	nop			;fdcf
	rst 38h			;fdd0
	nop			;fdd1
	rst 38h			;fdd2
	nop			;fdd3
	rst 38h			;fdd4
	nop			;fdd5
	rst 38h			;fdd6
	nop			;fdd7
	rst 38h			;fdd8
	nop			;fdd9
	rst 38h			;fdda
	nop			;fddb
	rst 38h			;fddc
	nop			;fddd
	rst 38h			;fdde
	nop			;fddf
	rst 38h			;fde0
	nop			;fde1
	rst 38h			;fde2
	nop			;fde3
	rst 38h			;fde4
	nop			;fde5
	rst 38h			;fde6
