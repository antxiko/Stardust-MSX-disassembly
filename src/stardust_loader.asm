; ==========================================================================
; STARDUST - MSX - el cargador turbo
; ==========================================================================
; Generado por tools/mkasm.py a partir del trazado de flujo real.
; Los comentarios provienen de tools/../src/*.notes y estan anclados a
; direccion, de modo que sobreviven a un retrazado.
; ==========================================================================

	org 0x0d2f0


; ======================================================================
; CODIGO 0xd2f0..0xd33a  (74 bytes)
; ======================================================================


L_D2F0:
	di			;d2f0
	call L_D302		;d2f1
	ld hl,0d33ah		;d2f4
	ld de,04000h		;d2f7
	ld bc,0012ch		;d2fa
	ldir		;d2fd
	jp 04000h		;d2ff
L_D302:
	ld hl,04000h		;d302
	call L_D30F		;d305
	ld hl,08000h		;d308
	call L_D30F		;d30b
	ret			;d30e
L_D30F:
	ld a,080h		;d30f
	ld c,004h		;d311
L_D313:
	and 083h		;d313
	ld b,004h		;d315
L_D317:
	push af			;d317
	push bc			;d318
	push hl			;d319
	call 00024h		;d31a   ; BIOS ENASLT - Switches to specified slot and page definitively
	pop hl			;d31d
	ld (hl),020h		;d31e
	ld a,(hl)			;d320
	cp 020h		;d321
	jr nz,L_D32C		;d323
	ld (hl),0fah		;d325
	ld a,(hl)			;d327
	cp 0fah		;d328
	jr z,L_D337		;d32a
L_D32C:
	pop bc			;d32c
	pop af			;d32d
	add a,004h		;d32e
	djnz L_D317		;d330
	inc a			;d332
	dec c			;d333
	jr nz,L_D313		;d334
	ret			;d336
L_D337:
	pop bc			;d337
	pop af			;d338
	ret			;d339

; ----------------------------------------------------------------------
; DATOS codigo_recolocado: Codigo que se ejecuta recolocado en la pagina 1
;   (0x4000)
;   0xd33a..0xd44f  (277 bytes)
DATA_codigo_recolocado:
	defb 021h,0c0h,0dah,011h,0e8h,0fdh,001h,05eh,000h,0edh,0b0h,031h,050h,046h,0ddh,021h	; d33a  !......^...1PF.!
	defb 08ch,09bh,011h,0b4h,030h,03eh,000h,037h,0cdh,05ch,040h,03eh,082h,0d3h,099h,0a7h	; d34a  ....0>.7.\@>....
	defb 0a7h,03eh,081h,0d3h,099h,0cdh,08ch,09bh,03eh,0c2h,0d3h,099h,0a7h,0a7h,03eh,081h	; d35a  .>......>.....>.
	defb 0d3h,099h,0f3h,0ddh,021h,0a0h,047h,011h,047h,0b6h,03eh,000h,037h,0cdh,05ch,040h	; d36a  ....!.G.G.>.7.\@
	defb 021h,0e8h,0fdh,006h,003h,07eh,0feh,0c9h,0c2h,085h,0bdh,023h,010h,0f7h,046h,023h	; d37a  !....~.....#..F#
	defb 05eh,023h,056h,023h,07eh,023h,012h,010h,0f7h,0c3h,085h,0bdh,021h,005h,041h,0e5h	; d38a  ^#V#~#......!.A.
	defb 0f5h,03eh,008h,0d3h,0abh,03eh,00eh,0d3h,0a0h,0f1h,014h,008h,015h,0f3h,03eh,005h	; d39a  .>...>........>.
	defb 04fh,0bfh,0cdh,0e2h,040h,030h,0fbh,021h,015h,004h,010h,0feh,02bh,07ch,0b5h,020h	; d3aa  O...@0.!....+|. 
	defb 0f9h,0cdh,0deh,040h,030h,0ech,006h,09ch,0cdh,0deh,040h,030h,0e5h,03eh,0c6h,0b8h	; d3ba  ...@0.....@0.>..
	defb 030h,0e0h,024h,020h,0f1h,006h,0c9h,0cdh,0e2h,040h,030h,0d6h,078h,0feh,0d4h,030h	; d3ca  0.$ .....@0.x..0
	defb 0f4h,0cdh,0e2h,040h,0d0h,026h,000h,006h,0b0h,018h,018h,008h,020h,005h,0ddh,075h	; d3da  ...@.&...... ..u
	defb 000h,018h,00ah,0cbh,019h,0adh,0c0h,079h,017h,04fh,013h,018h,002h,0ddh,023h,01bh	; d3ea  .......y.O....#.
	defb 008h,006h,0b2h,02eh,001h,0cdh,0deh,040h,0d0h,03eh,0cbh,0b8h,0cbh,015h,006h,0b0h	; d3fa  .......@.>......
	defb 0d2h,0c5h,040h,07ch,0adh,067h,07ah,0b3h,020h,0d1h,07ch,0feh,001h,0c9h,0cdh,0e2h	; d40a  ..@|.gz. .|.....
	defb 040h,0d0h,03eh,016h,03dh,020h,0fdh,0a7h,004h,000h,0c8h,03eh,000h,0dbh,0a2h,02fh	; d41a  @.>.= .....>.../
	defb 0a9h,0e6h,080h,0cah,0e8h,040h,079h,02fh,04fh,0edh,05fh,0e6h,00fh,0d3h,099h,03eh	; d42a  .....@y/O._....>
	defb 087h,0d3h,099h,037h,0c9h,01eh,013h,03eh,009h,0d3h,0abh,03eh,001h,0d3h,099h,03eh	; d43a  ...7...>...>...>
	defb 087h,0d3h,099h,0c9h,068h	; d44a
