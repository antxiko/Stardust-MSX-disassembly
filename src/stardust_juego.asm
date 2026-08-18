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
L_F849:	equ 0x0f849

; ----------------------------------------------------------------------
; Direcciones que solo aparecen como VALOR -en un `ld`, no en
; un salto-: son punteros que el codigo se pasa o numeros que
; casualmente coinciden con una direccion. No hay nada que
; trazar en ellas; el equ existe para que el listado ensamble.
; ----------------------------------------------------------------------
lcb9dh:	equ 0x0cb9d
lcc32h:	equ 0x0cc32
ld959h:	equ 0x0d959
lef00h:	equ 0x0ef00

; ----------------------------------------------------------------------
; DATOS logo_stardust: El logo STARDUST del menu/atraccion: bitmap de 128x16
;   px, 16 B por fila; lo copia el animador del arranque (ld hl,047a0h en
;   0xF037, 16 ldi por fila)
;   0x47a0..0x48a0  (256 bytes)
DATA_logo_stardust:
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

; ----------------------------------------------------------------------
; DATOS patrones_del_marco: Patrones del MARCO de la pantalla de juego -el
;   cuadro decorado con el HUD que rodea el area de juego- (0x900 B): L_EF28
;   los copia a la VRAM 0x0000 (fuente ld de,048a0h en 0xEF10) en dos filas de
;   caracter por tercio mas 24 tiras de 8 B y 24 de 0x18 B. Quien recoloca
;   esos 288 caracteres en el borde es la tabla de NOMBRES del SCREEN 2, y el
;   juego NO la monta: LA HEREDA de la pantalla de carga (la rutina 0x9BDB del
;   bloque [09] la rellena sumando ocho; la carga del bloque [10] machaca esa
;   rutina en RAM pero la VRAM sobrevive). Contrastado contra la VRAM real en
;   marcha: 768/768 nombres identicos al patron del 9BDB, 97,4% de los 4608
;   bytes de patrones/colores identicos (el resto es lo que el juego pinta
;   encima), y dibujado desde la cinta con ese mapeo sale el marco entero
;   (tools/render_marco.py -> docs/imagenes/marco.png). Doble papel: en marcha
;   0x47A0-0x4B3F es el final de la banda B del buffer y 0x4B40-0x4EFF la
;   banda C entera
;   0x48a0..0x51a0  (2304 bytes)
DATA_patrones_del_marco:
	defb 07eh,0ceh,0b6h,0b6h,0ceh,0f8h,0e0h,0c0h	; 48a0  ~.......
	defb 0aah,07fh,02ah,000h,0f8h,091h,0e2h,005h	; 48a8  ..*.....
	defb 0cbh,04ah,0cah,04ah,0cah,04ah,0cah,04ah	; 48b0  .J.J.J.J
	defb 0cah,04ah,0cah,04ah,0cah,0aah,06ah,010h	; 48b8  .J.J..j.
	defb 02ch,05ch,02ch,05ch,03ch,05ch,03ch,05ch	; 48c0  ,\,\<\<\
	defb 000h,04ah,0eah,0aah,0eah,04ah,00ah,000h	; 48c8  .J...J..
	defb 03fh,02bh,035h,03fh,000h,01ah,01ah,01ah	; 48d0  ?+5?....
	defb 000h,07ch,000h,0feh,0bah,0feh,0feh,0feh	; 48d8  .|......
	defb 000h,0c0h,0deh,0deh,0c0h,03eh,062h,032h	; 48e0  .....>b2
	defb 09eh,0e0h,080h,03eh,0beh,000h,0feh,080h	; 48e8  ...>....
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h	; 48f0  ..$ZZ$..
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h	; 48f8  ..$ZZ$..
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h	; 4900  ..$ZZ$..
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h	; 4908  ..$ZZ$..
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h	; 4910  ..$ZZ$..
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h	; 4918  ..$ZZ$..
	defb 0ffh,0bfh,0ffh,0fbh,0f5h,0c4h,0e4h,0fbh	; 4920  ........
	defb 0ffh,0ffh,0ffh,0c0h,0eah,0ffh,0ffh,0efh	; 4928  ........
	defb 0d7h,0d0h,0d2h,0efh,0ffh,0fdh,0fah,0c2h	; 4930  ........
	defb 0eah,0fdh,0ffh,0ffh,0ffh,0c0h,0eah,0ffh	; 4938  ........
	defb 0ffh,0f7h,0ebh,0c8h,0eah,0f7h,0bfh,0ffh	; 4940  ........
	defb 000h,000h,06fh,000h,017h,000h,06fh,000h	; 4948  ..o...o.
	defb 017h,000h,06fh,000h,017h,000h,06fh,000h	; 4950  ..o...o.
	defb 017h,000h,06fh,000h,017h,000h,06fh,000h	; 4958  ..o...o.
	defb 0ffh,0fdh,0ffh,0ffh,0ffh,003h,0afh,0ffh	; 4960  ........
	defb 0ffh,0bfh,05fh,043h,04fh,0bfh,0ffh,0ffh	; 4968  .._CO...
	defb 0ffh,003h,0afh,0ffh,0ffh,0ffh,0ffh,003h	; 4970  ........
	defb 0afh,0ffh,0ffh,0efh,0d7h,013h,097h,0efh	; 4978  ........
	defb 0ffh,0ffh,0ffh,003h,0afh,0ffh,0fdh,0ffh	; 4980  ........
	defb 000h,000h,0feh,000h,0f8h,000h,0feh,000h	; 4988  ........
	defb 0f8h,000h,0feh,000h,0f8h,000h,0feh,000h	; 4990  ........
	defb 0f8h,000h,0feh,000h,0f8h,000h,0feh,000h	; 4998  ........
	defb 0bah,0feh,000h,07ch,000h,0feh,0eeh,0d6h	; 49a0  ...|....
	defb 0d6h,0d6h,054h,038h,038h,000h,0feh,0deh	; 49a8  ..T88...
	defb 0aah,000h,010h,000h,038h,018h,038h,000h	; 49b0  ....8.8.
	defb 010h,010h,010h,010h,010h,010h,010h,000h	; 49b8  ........
	defb 038h,038h,000h,05ch,000h,0beh,07eh,0beh	; 49c0  88.\..~.
	defb 07eh,000h,05ch,000h,038h,000h,05ch,000h	; 49c8  ~.\.8.\.
	defb 038h,000h,05ch,000h,038h,000h,05ch,000h	; 49d0  8.\.8.\.
	defb 016h,016h,016h,006h,03ah,01ah,03ah,01ah	; 49d8  ....:.:.
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h	; 49e0  ..$ZZ$..
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h	; 49e8  ..$ZZ$..
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h	; 49f0  ..$ZZ$..
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h	; 49f8  ..$ZZ$..
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h	; 4a00  ..$ZZ$..
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h	; 4a08  ..$ZZ$..
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h	; 4a10  ..$ZZ$..
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h	; 4a18  ..$ZZ$..
	defb 017h,000h,06fh,000h,017h,000h,06fh,000h	; 4a20  ..o...o.
	defb 0abh,055h,000h,030h,079h,03ah,07ah,039h	; 4a28  .U.0y:z9
	defb 078h,039h,0dah,0d9h,0dah,0d9h,0dah,0d9h	; 4a30  x9......
	defb 038h,037h,057h,038h,039h,0dah,0e9h,0aah	; 4a38  87W89...
	defb 068h,06ah,019h,05ah,039h,07ah,079h,032h	; 4a40  hj.Z9zy2
	defb 001h,078h,003h,031h,033h,031h,034h,032h	; 4a48  .x.13142
	defb 035h,032h,035h,032h,005h,07ah,0cdh,084h	; 4a50  5252.z..
	defb 095h,0cch,079h,004h,03eh,055h,06bh,03fh	; 4a58  ..y.>Uk?
	defb 0f8h,000h,0feh,000h,0f8h,000h,0feh,000h	; 4a60  ........
	defb 0ffh,055h,000h,070h,0fch,002h,0feh,0feh	; 4a68  .U.p....
	defb 02eh,0feh,0feh,0feh,0feh,0c6h,0bah,0aah	; 4a70  ........
	defb 07ah,0eah,0fah,06ah,0bah,0bah,0c6h,0feh	; 4a78  z..j....
	defb 052h,0feh,0feh,0feh,0feh,0feh,0feh,002h	; 4a80  R.......
	defb 0fch,070h,000h,000h,080h,0e0h,0b0h,050h	; 4a88  .p.....P
	defb 038h,098h,048h,09ch,04ch,0a4h,04ch,0a4h	; 4a90  8.H.L.L.
	defb 04ch,0a4h,04ch,0a4h,04ch,000h,09eh,09eh	; 4a98  L.L.L...
	defb 03ah,01ah,03ah,006h,016h,006h,03ah,01ah	; 4aa0  :.:...:.
	defb 03ah,01ah,02ah,01ah,03ah,01ah,03ah,03ah	; 4aa8  :.*.:.::
	defb 006h,016h,016h,016h,016h,016h,016h,016h	; 4ab0  ........
	defb 016h,000h,03fh,02bh,035h,03fh,000h,016h	; 4ab8  ..?+5?..
	defb 016h,016h,000h,03fh,02bh,035h,03fh,000h	; 4ac0  ...?+5?.
	defb 016h,016h,016h,016h,016h,016h,017h,000h	; 4ac8  ........
	defb 0ffh,0bch,0f3h,0eeh,0d9h,0d2h,0b5h,0aah	; 4ad0  ........
	defb 0a5h,0b2h,0d5h,0d8h,0eeh,0f3h,0bch,0ffh	; 4ad8  ........
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h	; 4ae0  ..$ZZ$..
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h	; 4ae8  ..$ZZ$..
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h	; 4af0  ..$ZZ$..
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h	; 4af8  ..$ZZ$..
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h	; 4b00  ..$ZZ$..
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h	; 4b08  ..$ZZ$..
	defb 0ffh,03dh,0cfh,077h,01bh,0abh,04dh,0a5h	; 4b10  .=.w..M.
	defb 055h,0adh,04bh,09bh,077h,0cfh,03dh,0ffh	; 4b18  U.K.w.=.
	defb 001h,03ch,07eh,006h,066h,03eh,046h,01ah	; 4b20  .<~.f>F.
	defb 05ah,064h,03ah,001h,001h,01ah,064h,05ah	; 4b28  Zd:...dZ
	defb 01ah,044h,03ch,07ch,000h,07dh,001h,07dh	; 4b30  .D<|.}.}
	defb 001h,07ch,000h,078h,007h,02fh,027h,02bh	; 4b38  .|.x./'+
	defb 027h,02fh,027h,02bh,025h,02bh,025h,02ah	; 4b40  '/'+%+%*
	defb 025h,00ah,000h,003h,004h,00dh,018h,011h	; 4b48  %.......
	defb 013h,013h,013h,013h,013h,013h,013h,013h	; 4b50  ........
	defb 011h,060h,030h,076h,032h,076h,036h,076h	; 4b58  .`0v2v6v
	defb 0deh,09eh,000h,038h,05ch,03eh,042h,01ah	; 4b60  ...8\>B.
	defb 05ah,026h,05ch,080h,080h,05ch,026h,05ah	; 4b68  Z&\..\&Z
	defb 05ah,022h,056h,02ch,000h,0feh,002h,026h	; 4b70  Z"V,...&
	defb 0feh,000h,0fch,000h,0fch,0fdh,0fdh,0fdh	; 4b78  ........
	defb 0fdh,0fdh,0fdh,0fdh,0fdh,0fdh,0fdh,0fdh	; 4b80  ........
	defb 07dh,0ach,000h,0f0h,008h,0edh,000h,0ffh	; 4b88  }.......
	defb 01fh,011h,03fh,070h,070h,070h,070h,000h	; 4b90  ..?pppp.
	defb 0ffh,049h,041h,000h,0f0h,037h,0f0h,000h	; 4b98  .IA..7..
	defb 0e7h,09ah,075h,0c8h,013h,076h,0edh,0dbh	; 4ba0  ..u..v..
	defb 012h,012h,012h,002h,03ah,01ah,02ah,01ah	; 4ba8  ....:.*.
	defb 02ah,01ah,03ah,002h,012h,012h,012h,06ah	; 4bb0  *.:....j
	defb 0f3h,0efh,0d8h,057h,038h,03fh,07ch,079h	; 4bb8  ...W8?|y
	defb 0b3h,0d6h,0b4h,0d4h,0b4h,0d4h,0b6h,073h	; 4bc0  .......s
	defb 005h,00ah,016h,075h,0e5h,0f5h,0f2h,06dh	; 4bc8  ...u...m
	defb 025h,00dh,015h,02dh,055h,0a3h,04fh,09eh	; 4bd0  %..-U.O.
	defb 05ch,09ch,058h,098h,058h,098h,048h,086h	; 4bd8  \.X.X.H.
	defb 080h,02ah,07fh,0ffh,0ffh,000h,0ffh,000h	; 4be0  .*......
	defb 000h,001h,006h,00ch,01dh,035h,03ch,06ch	; 4be8  .....5<l
	defb 06eh,04dh,07dh,07bh,015h,00eh,00eh,000h	; 4bf0  nM}{....
	defb 000h,0d0h,0ech,077h,0f8h,0f7h,00ch,0f8h	; 4bf8  ...w....
	defb 03fh,023h,075h,079h,071h,071h,07fh,000h	; 4c00  ?#uyqq..
	defb 0f8h,00ch,007h,0a0h,0f4h,0e5h,0d5h,025h	; 4c08  .......%
	defb 055h,004h,070h,0b7h,0b0h,080h,000h,000h	; 4c10  U.p.....
	defb 03fh,021h,03ch,070h,070h,071h,07fh,000h	; 4c18  ?!<ppq..
	defb 0ffh,0ffh,000h,0aah,0ffh,000h,0ffh,000h	; 4c20  ........
	defb 000h,080h,060h,0b0h,038h,02ch,03ch,036h	; 4c28  ..`.8,<6
	defb 076h,0b2h,0beh,0deh,0a8h,070h,070h,000h	; 4c30  v....pp.
	defb 000h,00bh,037h,0eeh,01fh,0efh,030h,01fh	; 4c38  ..7...0.
	defb 03eh,002h,03eh,070h,070h,071h,07fh,000h	; 4c40  >.>ppq..
	defb 01fh,030h,0e2h,00ah,012h,0fah,0f2h,0aah	; 4c48  .0......
	defb 052h,0aah,000h,0feh,001h,000h,000h,000h	; 4c50  R.......
	defb 018h,008h,01ch,01ch,01ch,01ch,01ch,000h	; 4c58  ........
	defb 07fh,000h,055h,0ffh,0ffh,07fh,0beh,0d8h	; 4c60  ..U.....
	defb 040h,050h,058h,05ch,05ch,05ch,05ch,05ch	; 4c68  @PX\\\\\
	defb 05ch,05ch,058h,040h,050h,050h,050h,050h	; 4c70  \\X@PPPP
	defb 0c0h,0f0h,018h,0e8h,01ch,0fch,07eh,0beh	; 4c78  ......~.
	defb 0ddh,06bh,02dh,02bh,02dh,02bh,06dh,0deh	; 4c80  .k-+-+m.
	defb 080h,000h,000h,0e0h,0f8h,0fch,0fch,0e8h	; 4c88  ........
	defb 050h,0a0h,000h,080h,0c0h,0e0h,070h,020h	; 4c90  P.....p 
	defb 010h,010h,010h,010h,010h,010h,010h,010h	; 4c98  ........
	defb 04fh,096h,059h,0bfh,075h,08bh,039h,07bh	; 4ca0  O.Y.u.9{
	defb 0f9h,0c3h,037h,0c6h,0d4h,044h,056h,066h	; 4ca8  ..7..DVf
	defb 037h,035h,05ah,05dh,04fh,0aeh,046h,023h	; 4cb0  75Z]O.F#
	defb 031h,038h,058h,059h,0d9h,0b9h,0e1h,0d9h	; 4cb8  18XY....
	defb 025h,02dh,018h,000h,018h,018h,028h,028h	; 4cc0  %-....((
	defb 078h,07ch,044h,038h,06dh,0d3h,0d3h,06dh	; 4cc8  x|D8m..m
	defb 038h,000h,00fh,01fh,03fh,03ch,039h,03bh	; 4cd0  8...?<9;
	defb 032h,034h,034h,030h,034h,030h,034h,034h	; 4cd8  24404044
	defb 03fh,021h,03ch,070h,070h,071h,07fh,000h	; 4ce0  ?!<ppq..
	defb 03fh,021h,03ch,070h,070h,071h,07fh,000h	; 4ce8  ?!<ppq..
	defb 03fh,021h,03ch,070h,070h,071h,07fh,000h	; 4cf0  ?!<ppq..
	defb 080h,0f0h,07eh,0bfh,09fh,0c7h,0e3h,0f9h	; 4cf8  ..~.....
	defb 0f8h,0f6h,0eeh,06dh,02dh,015h,049h,065h	; 4d00  ...m-.Ie
	defb 000h,0fbh,000h,0a5h,0b7h,0a7h,0b7h,0afh	; 4d08  ........
	defb 08fh,000h,0ffh,0ffh,000h,000h,080h,000h	; 4d10  ........
	defb 0ffh,0ffh,0c1h,0c1h,0c1h,0c0h,0c3h,01ah	; 4d18  ........
	defb 03eh,002h,03eh,070h,070h,071h,07fh,000h	; 4d20  >.>ppq..
	defb 03eh,022h,00eh,007h,007h,047h,07fh,000h	; 4d28  >"...G..
	defb 044h,044h,07ch,00eh,00eh,00eh,00eh,000h	; 4d30  DD|.....
	defb 031h,07fh,0ffh,060h,08ah,0d0h,0c5h,02bh	; 4d38  1..`...+
	defb 07fh,0cfh,0b0h,054h,056h,056h,059h,05ch	; 4d40  ...TVVY\
	defb 000h,0dfh,000h,044h,0adh,0ech,0edh,0f4h	; 4d48  ...D....
	defb 0f0h,000h,0ffh,0ffh,000h,000h,000h,000h	; 4d50  ........
	defb 0ffh,0ffh,083h,083h,083h,003h,0c3h,058h	; 4d58  .......X
	defb 010h,010h,010h,000h,038h,038h,000h,0f8h	; 4d60  ....88..
	defb 078h,0b8h,058h,098h,058h,098h,056h,097h	; 4d68  x.X.X.V.
	defb 057h,096h,058h,098h,058h,094h,04eh,03eh	; 4d70  W.X.X.N>
	defb 0dfh,0efh,0e3h,019h,0bch,00fh,050h,0b0h	; 4d78  ......P.
	defb 0e0h,0c0h,000h,000h,000h,000h,000h,000h	; 4d80  ........
	defb 000h,000h,080h,060h,030h,098h,048h,0a4h	; 4d88  ...`0.H.
	defb 006h,00fh,0f1h,0fah,0fch,038h,01ah,01bh	; 4d90  .....8..
	defb 00bh,009h,00bh,009h,00ah,009h,00bh,009h	; 4d98  ........
	defb 030h,034h,030h,030h,030h,030h,030h,030h	; 4da0  04000000
	defb 038h,038h,05ch,04fh,067h,0f0h,0dfh,0aah	; 4da8  88\Og...
	defb 070h,03ch,00eh,005h,002h,004h,009h,013h	; 4db0  p<......
	defb 026h,00eh,074h,074h,074h,074h,074h,00ch	; 4db8  &.ttttt.
	defb 02ch,00ch,074h,074h,074h,00ch,02eh,06eh	; 4dc0  ,.ttt..n
	defb 0c7h,003h,001h,000h,000h,001h,043h,05bh	; 4dc8  ......C[
	defb 05bh,05bh,053h,05bh,053h,05bh,053h,04bh	; 4dd0  [[S[S[SK
	defb 051h,002h,001h,000h,000h,000h,000h,000h	; 4dd8  Q.......
	defb 01ah,0c3h,0c0h,0c1h,0c1h,0c1h,0ffh,0ffh	; 4de0  ........
	defb 000h,000h,000h,000h,0ffh,000h,0ffh,0aah	; 4de8  ........
	defb 000h,01fh,0dfh,015h,000h,0f5h,0c0h,000h	; 4df0  ........
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 4df8  ........
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 4e00  ........
	defb 000h,0c0h,0ffh,0ffh,000h,0c1h,0e7h,0efh	; 4e08  ........
	defb 0c8h,0aah,0cah,0eah,0c8h,0efh,0cfh,0ebh	; 4e10  ........
	defb 0c5h,0a2h,041h,000h,000h,000h,000h,000h	; 4e18  ..A.....
	defb 058h,0c3h,003h,083h,083h,083h,0ffh,0ffh	; 4e20  X.......
	defb 000h,000h,000h,000h,0ffh,000h,0ffh,0aah	; 4e28  ........
	defb 000h,0f0h,0b7h,050h,002h,057h,003h,000h	; 4e30  ...P.W..
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 4e38  ........
	defb 000h,000h,000h,000h,000h,000h,000h,000h	; 4e40  ........
	defb 000h,000h,0f7h,08fh,06fh,0e9h,0cdh,0edh	; 4e48  ....o...
	defb 0e9h,0edh,0cdh,0a9h,0cfh,0efh,0cfh,0efh	; 4e50  ........
	defb 04fh,0afh,047h,02ah,005h,002h,000h,000h	; 4e58  O.G*....
	defb 00bh,00bh,009h,00bh,00bh,00bh,00ah,008h	; 4e60  ........
	defb 01ch,01ch,03ah,0f2h,0e6h,00fh,0f5h,0aah	; 4e68  ..:.....
	defb 000h,000h,015h,08ah,045h,022h,091h,0c8h	; 4e70  ....E"..
	defb 065h,074h,025h,034h,024h,034h,026h,032h	; 4e78  et%4$4&2
	defb 020h,034h,026h,036h,026h,037h,067h,077h	; 4e80   4&6&7gw
	defb 0e0h,00fh,0dfh,0dfh,0dfh,09fh,05fh,09eh	; 4e88  ......_.
	defb 0ddh,0deh,0dfh,09fh,0dfh,09fh,0dfh,0deh	; 4e90  ........
	defb 0dfh,08fh,0ddh,08eh,055h,08ah,005h,000h	; 4e98  ....U...
	defb 00fh,077h,038h,04eh,074h,075h,04fh,000h	; 4ea0  .w8NtuO.
	defb 0f8h,0f7h,00ch,0bah,035h,06ah,0c0h,03fh	; 4ea8  ....5j.?
	defb 000h,0ffh,000h,0aah,055h,0aah,000h,0ffh	; 4eb0  ....U...
	defb 001h,0ffh,007h,0abh,055h,0a8h,000h,0ffh	; 4eb8  ....U...
	defb 0c0h,0dfh,0c0h,0c0h,0dfh,01ah,000h,0ffh	; 4ec0  ........
	defb 000h,0ffh,000h,00eh,06eh,0afh,00fh,0f6h	; 4ec8  ....n...
	defb 0ddh,0c9h,0ddh,009h,05dh,029h,055h,009h	; 4ed0  ....])U.
	defb 07ah,072h,07ah,072h,07ah,072h,02ah,052h	; 4ed8  zrzrzr*R
	defb 0c0h,0f0h,0e1h,0eeh,0e0h,0d8h,0b0h,040h	; 4ee0  .......@
	defb 000h,000h,0ffh,0beh,055h,000h,000h,000h	; 4ee8  ....U...
	defb 000h,003h,09eh,0b0h,08ah,005h,000h,000h	; 4ef0  ........
	defb 000h,0c6h,06fh,00dh,009h,046h,0a8h,010h	; 4ef8  ..o..F..
	defb 000h,001h,001h,07dh,029h,000h,001h,000h	; 4f00  ...})...
	defb 000h,055h,055h,055h,055h,000h,055h,000h	; 4f08  .UUUU.U.
	defb 000h,000h,007h,074h,07ah,001h,000h,000h	; 4f10  ...tz...
	defb 000h,000h,0c0h,05eh,0bah,000h,000h,000h	; 4f18  ...^....
	defb 000h,000h,0feh,0feh,074h,0aah,000h,000h	; 4f20  ....t...
	defb 000h,000h,000h,0ffh,0bah,000h,000h,000h	; 4f28  ........
	defb 000h,000h,000h,0feh,0bah,000h,000h,000h	; 4f30  ........
	defb 055h,0aah,0ffh,0bfh,09fh,0c0h,0e0h,07fh	; 4f38  U.......
	defb 055h,0aah,0ffh,0ffh,0ffh,000h,000h,0ffh	; 4f40  U.......
	defb 055h,0aah,0ffh,0ffh,0ffh,00dh,00dh,0ffh	; 4f48  U.......
	defb 01bh,0adh,08dh,0a6h,093h,0a8h,0b5h,01bh	; 4f50  ........
	defb 09bh,0cdh,0e4h,007h,0ffh,000h,055h,0dfh	; 4f58  ......U.
	defb 000h,000h,007h,03eh,0f8h,0c0h,000h,0ffh	; 4f60  ...>....
	defb 021h,021h,071h,071h,071h,071h,07fh,000h	; 4f68  !!qqqq..
	defb 0ffh,024h,004h,000h,000h,0ffh,000h,000h	; 4f70  .$......
	defb 000h,000h,0ffh,0beh,000h,000h,000h,0ffh	; 4f78  ........
	defb 03dh,025h,075h,075h,075h,075h,077h,000h	; 4f80  =%uuuuw.
	defb 0ffh,092h,010h,000h,000h,0ffh,000h,000h	; 4f88  ........
	defb 000h,000h,0ffh,0ebh,000h,000h,000h,0ffh	; 4f90  ........
	defb 07fh,008h,01ch,01ch,01ch,01ch,01ch,000h	; 4f98  ........
	defb 0ffh,049h,041h,000h,000h,0ffh,000h,000h	; 4fa0  .IA.....
	defb 000h,000h,0ffh,0abh,000h,000h,000h,0ffh	; 4fa8  ........
	defb 03fh,021h,071h,071h,071h,071h,07fh,000h	; 4fb0  ?!qqqq..
	defb 0ffh,024h,004h,000h,000h,0feh,000h,000h	; 4fb8  .$......
	defb 000h,07fh,07fh,02ah,055h,000h,000h,0ffh	; 4fc0  ...*U...
	defb 03eh,020h,03eh,007h,007h,047h,07fh,000h	; 4fc8  > >..G..
	defb 0ffh,092h,010h,0ffh,0aah,0d5h,0aah,0ffh	; 4fd0  ........
	defb 000h,0ffh,0fdh,0aah,055h,000h,000h,0ffh	; 4fd8  ....U...
	defb 000h,018h,018h,000h,018h,018h,000h,000h	; 4fe0  ........
	defb 0ffh,024h,020h,0e0h,0a0h,06fh,0a0h,0e0h	; 4fe8  .$ ..o..
	defb 000h,0ffh,0ffh,0ebh,055h,000h,000h,0ffh	; 4ff0  ....U...
	defb 03fh,023h,075h,079h,071h,071h,07fh,000h	; 4ff8  ?#uyqq..
	defb 0feh,049h,043h,007h,00fh,0edh,00ah,007h	; 5000  .IC.....
	defb 000h,0ffh,0ffh,0ebh,055h,000h,000h,0ffh	; 5008  ....U...
	defb 03fh,023h,075h,079h,071h,071h,07fh,000h	; 5010  ?#uyqq..
	defb 0bfh,0c4h,060h,070h,078h,05bh,0a8h,0f0h	; 5018  ..`px[..
	defb 000h,000h,07bh,055h,000h,000h,000h,0ffh	; 5020  ..{U....
	defb 03fh,023h,075h,079h,071h,071h,07fh,000h	; 5028  ?#uyqq..
	defb 0ffh,092h,082h,000h,000h,0ffh,000h,000h	; 5030  ........
	defb 000h,000h,0ffh,05dh,000h,000h,000h,0ffh	; 5038  ...]....
	defb 03fh,023h,075h,079h,071h,071h,07fh,000h	; 5040  ?#uyqq..
	defb 0ffh,049h,008h,000h,000h,0ffh,000h,000h	; 5048  .I......
	defb 03fh,078h,057h,055h,078h,03fh,000h,0ffh	; 5050  ?xWUx?..
	defb 03fh,023h,075h,079h,071h,071h,07fh,000h	; 5058  ?#uyqq..
	defb 0ffh,024h,020h,000h,000h,0ffh,000h,000h	; 5060  .$ .....
	defb 0ffh,001h,0beh,054h,001h,0ffh,000h,0ffh	; 5068  ...T....
	defb 03fh,023h,075h,079h,071h,071h,07fh,000h	; 5070  ?#uyqq..
	defb 0ffh,082h,0bah,07dh,0f9h,060h,000h,000h	; 5078  ...}.`..
	defb 0ffh,0c0h,0beh,0a9h,086h,0f8h,001h,047h	; 5080  .......G
	defb 0bfh,080h,0bdh,0c0h,0bfh,0aah,0a0h,080h	; 5088  ........
	defb 01fh,030h,0e5h,04ah,095h,0cah,065h,03fh	; 5090  .0.J..e?
	defb 0fch,0b8h,0e3h,087h,01eh,06dh,08bh,016h	; 5098  .....m..
	defb 0edh,01dh,0d5h,003h,0f7h,0aah,005h,003h	; 50a0  ........
	defb 0f9h,00ch,057h,0aah,051h,0abh,056h,0fch	; 50a8  ..W.Q.V.
	defb 000h,000h,0ffh,080h,07fh,0bbh,000h,0ffh	; 50b0  ........
	defb 07fh,042h,00ch,01ch,038h,071h,07fh,000h	; 50b8  .B..8q..
	defb 0c0h,0f0h,02ch,097h,08ah,001h,000h,000h	; 50c0  ..,.....
	defb 000h,000h,0feh,001h,0feh,0abh,000h,0ffh	; 50c8  ........
	defb 03fh,021h,071h,071h,071h,071h,07fh,000h	; 50d0  ?!qqqq..
	defb 000h,000h,000h,0feh,0eeh,056h,000h,000h	; 50d8  .....V..
	defb 000h,001h,003h,08fh,0beh,068h,000h,0ffh	; 50e0  .....h..
	defb 03dh,025h,075h,075h,075h,075h,077h,000h	; 50e8  =%uuuuw.
	defb 000h,000h,0ffh,0ffh,0fbh,055h,0aah,000h	; 50f0  .....U..
	defb 07ch,0c7h,0f7h,09fh,00dh,002h,000h,0ffh	; 50f8  |.......
	defb 01eh,012h,03fh,071h,071h,071h,071h,000h	; 5100  ..?qqqq.
	defb 000h,000h,000h,07eh,000h,07eh,000h,000h	; 5108  ...~.~..
	defb 003h,00fh,0deh,0e6h,079h,0aah,000h,0ffh	; 5110  ....y...
	defb 000h,018h,018h,000h,018h,018h,000h,000h	; 5118  ........
	defb 000h,000h,0ffh,0ffh,0efh,055h,0aah,000h	; 5120  .....U..
	defb 080h,07fh,000h,0aah,0f7h,0ffh,000h,0ffh	; 5128  ........
	defb 03fh,023h,075h,079h,071h,071h,07fh,000h	; 5130  ?#uyqq..
	defb 000h,000h,000h,07fh,07eh,054h,000h,000h	; 5138  ....~T..
	defb 007h,0fbh,005h,0b8h,0f0h,0cfh,030h,0ffh	; 5140  ......0.
	defb 018h,008h,01ch,01ch,01ch,01ch,01ch,000h	; 5148  ........
	defb 01fh,030h,0e7h,0c0h,080h,000h,000h,000h	; 5150  .0......
	defb 0ffh,0fbh,055h,000h,000h,0c0h,0f0h,078h	; 5158  ..U....x
	defb 0bch,09ch,062h,07eh,054h,042h,080h,09ch	; 5160  ..b~TB..
	defb 038h,070h,0c0h,000h,000h,000h,000h,000h	; 5168  8p......
	defb 0f8h,0ebh,050h,000h,000h,000h,00bh,01bh	; 5170  ..P.....
	defb 02ah,05bh,0fbh,0fbh,073h,0bbh,051h,02bh	; 5178  *[..s.Q+
	defb 011h,00ah,000h,000h,000h,000h,000h,000h	; 5180  ........
	defb 001h,0ffh,000h,000h,000h,000h,0e4h,075h	; 5188  .......u
	defb 0b5h,075h,0f5h,0e5h,0f5h,0e5h,0f5h,0e4h	; 5190  .u......
	defb 055h,0a0h,000h,000h,000h,000h,000h,000h	; 5198  U.......

; ----------------------------------------------------------------------
; DATOS colores_del_marco: Colores del MARCO de la pantalla de juego (los
;   mismos 0x900 B, segunda llamada a L_EF28 con destino VRAM 0x2000). Aqui
;   vivian los rangos "colores de tiles" medidos por su firma de nibble: la
;   firma era verdad, pero son los colores del marco, no de los tiles del
;   juego
;   0x51a0..0x5aa0  (2304 bytes)
DATA_colores_del_marco:
	defb 0b1h,0b1h,0b1h,0b1h,0b1h,0b1h,0b1h,0b1h	; 51a0  ........
	defb 051h,0a1h,0a1h,0f1h,0a1h,0a1h,0a1h,0a1h	; 51a8  Q.......
	defb 0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h	; 51b0  ........
	defb 0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,031h	; 51b8  .......1
	defb 031h,031h,031h,031h,031h,031h,031h,031h	; 51c0  11111111
	defb 031h,051h,051h,051h,051h,051h,051h,0f1h	; 51c8  1QQQQQQ.
	defb 021h,021h,021h,021h,0f1h,081h,081h,081h	; 51d0  !!!!....
	defb 051h,051h,0f1h,071h,071h,071h,071h,071h	; 51d8  QQ.qqqqq
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 51e0  QQQQQQQQ
	defb 051h,0a1h,0b1h,0b1h,0b1h,0b1h,0b1h,0f1h	; 51e8  Q.......
	defb 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h	; 51f0  ........
	defb 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h	; 51f8  ........
	defb 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h	; 5200  ........
	defb 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h	; 5208  ........
	defb 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h	; 5210  ........
	defb 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h	; 5218  ........
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5220  ........
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5228  ........
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5230  ........
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5238  ........
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5240  ........
	defb 0a1h,0e1h,0e1h,0e1h,051h,051h,0e1h,0e1h	; 5248  ....QQ..
	defb 051h,051h,0e1h,0e1h,051h,0e1h,0e1h,051h	; 5250  QQ..Q..Q
	defb 051h,0e1h,0e1h,0e1h,051h,0e1h,0e1h,0e1h	; 5258  Q...Q...
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5260  ........
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5268  ........
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5270  ........
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5278  ........
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5280  ........
	defb 0a1h,071h,0f1h,071h,071h,0f1h,0f1h,071h	; 5288  .q.qq..q
	defb 071h,071h,0f1h,0f1h,071h,071h,0f1h,0f1h	; 5290  qq..qq..
	defb 071h,071h,0f1h,071h,071h,071h,0f1h,071h	; 5298  qq.qqq.q
	defb 071h,071h,051h,051h,0f1h,021h,021h,021h	; 52a0  qqQQ.!!!
	defb 021h,021h,021h,021h,021h,0f1h,051h,051h	; 52a8  !!!!!.QQ
	defb 051h,071h,071h,0f1h,051h,051h,051h,051h	; 52b0  Qqq.QQQQ
	defb 071h,071h,071h,071h,071h,071h,071h,071h	; 52b8  qqqqqqqq
	defb 0b1h,0b1h,0b1h,0b1h,0b1h,0a1h,0a1h,0a1h	; 52c0  ........
	defb 0a1h,0a1h,0c1h,031h,031h,0c1h,0c1h,031h	; 52c8  ...11..1
	defb 031h,031h,0c1h,031h,031h,031h,0c1h,0a1h	; 52d0  11.111..
	defb 0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h	; 52d8  ........
	defb 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h	; 52e0  ........
	defb 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h	; 52e8  ........
	defb 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h	; 52f0  ........
	defb 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h	; 52f8  ........
	defb 0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h	; 5300  ........
	defb 0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h	; 5308  ........
	defb 0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h	; 5310  ........
	defb 0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h	; 5318  ........
	defb 051h,051h,0e1h,0e1h,051h,051h,0e1h,051h	; 5320  QQ..QQ.Q
	defb 051h,051h,0c1h,061h,061h,061h,061h,061h	; 5328  QQ.aaaaa
	defb 061h,061h,061h,061h,061h,061h,061h,061h	; 5330  aaaaaaaa
	defb 061h,061h,061h,061h,061h,061h,061h,061h	; 5338  aaaaaaaa
	defb 061h,061h,061h,061h,061h,061h,061h,061h	; 5340  aaaaaaaa
	defb 051h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5348  Q.......
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5350  ........
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5358  ........
	defb 071h,071h,0f1h,071h,071h,071h,0f1h,071h	; 5360  qq.qqq.q
	defb 071h,051h,031h,051h,051h,051h,091h,091h	; 5368  qQ1QQQ..
	defb 091h,091h,091h,091h,091h,091h,091h,091h	; 5370  ........
	defb 091h,091h,091h,091h,091h,091h,091h,091h	; 5378  ........
	defb 091h,091h,091h,091h,091h,091h,091h,091h	; 5380  ........
	defb 051h,051h,081h,031h,031h,031h,031h,031h	; 5388  QQ.11111
	defb 031h,031h,031h,031h,031h,031h,031h,031h	; 5390  11111111
	defb 031h,031h,031h,031h,031h,031h,031h,031h	; 5398  11111111
	defb 0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h	; 53a0  ........
	defb 0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h	; 53a8  ........
	defb 0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h	; 53b0  ........
	defb 0a1h,0f1h,081h,081h,081h,081h,0f1h,0a1h	; 53b8  ........
	defb 0a1h,0a1h,0a1h,081h,081h,081h,081h,0f1h	; 53c0  ........
	defb 0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h	; 53c8  ........
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 53d0  ........
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 53d8  ........
	defb 0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h	; 53e0  ........
	defb 0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h	; 53e8  ........
	defb 0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h	; 53f0  ........
	defb 0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h	; 53f8  ........
	defb 0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h	; 5400  ........
	defb 0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0c1h	; 5408  ........
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5410  ........
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5418  ........
	defb 031h,041h,041h,041h,041h,041h,041h,041h	; 5420  1AAAAAAA
	defb 041h,041h,041h,041h,041h,041h,041h,041h	; 5428  AAAAAAAA
	defb 041h,041h,091h,091h,091h,091h,091h,091h	; 5430  AA......
	defb 091h,091h,091h,091h,051h,051h,051h,051h	; 5438  ....QQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 5440  QQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 5448  QQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 5450  QQQQQQQQ
	defb 051h,061h,061h,061h,061h,061h,061h,061h	; 5458  Qaaaaaaa
	defb 031h,031h,051h,051h,051h,051h,051h,051h	; 5460  11QQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 5468  QQQQQQQQ
	defb 051h,051h,051h,051h,091h,091h,091h,091h	; 5470  QQQQ....
	defb 091h,091h,091h,0f1h,071h,071h,071h,071h	; 5478  ....qqqq
	defb 071h,071h,071h,071h,071h,071h,071h,071h	; 5480  qqqqqqqq
	defb 071h,051h,0f1h,051h,051h,051h,0f1h,051h	; 5488  qQ.QQQ.Q
	defb 071h,071h,071h,071h,071h,071h,071h,051h	; 5490  qqqqqqqQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 5498  QQQQQQQQ
	defb 041h,041h,041h,051h,051h,051h,051h,051h	; 54a0  AAAQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 54a8  QQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 54b0  QQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 54b8  QQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 54c0  QQQQQQQQ
	defb 051h,091h,091h,091h,091h,091h,061h,0c1h	; 54c8  Q.....a.
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 54d0  ........
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 54d8  ........
	defb 051h,051h,051h,051h,051h,051h,051h,0f1h	; 54e0  QQQQQQQ.
	defb 0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h	; 54e8  ........
	defb 0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h	; 54f0  ........
	defb 0f1h,051h,051h,051h,051h,051h,051h,051h	; 54f8  .QQQQQQQ
	defb 071h,071h,071h,071h,071h,071h,071h,051h	; 5500  qqqqqqqQ
	defb 051h,051h,051h,091h,091h,091h,091h,061h	; 5508  QQQ....a
	defb 061h,061h,0c1h,0c1h,0c1h,0c1h,0b1h,0b1h	; 5510  aa......
	defb 0b9h,0b9h,0b9h,0b9h,0b9h,0b9h,0b9h,0b9h	; 5518  ........
	defb 041h,041h,041h,051h,051h,051h,051h,051h	; 5520  AAAQQQQQ
	defb 051h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h	; 5528  Q.......
	defb 0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h	; 5530  ........
	defb 0f1h,051h,051h,051h,051h,051h,051h,051h	; 5538  .QQQQQQQ
	defb 071h,071h,071h,071h,071h,071h,071h,051h	; 5540  qqqqqqqQ
	defb 051h,051h,051h,091h,091h,091h,091h,061h	; 5548  QQQ....a
	defb 061h,061h,0f1h,0c1h,0c1h,0c1h,0b1h,0b1h	; 5550  aa......
	defb 0b9h,0b9h,0b9h,0b9h,0b9h,0b9h,0b9h,0b9h	; 5558  ........
	defb 051h,0f1h,071h,071h,071h,071h,071h,071h	; 5560  Q.qqqqqq
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 5568  QQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 5570  QQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 5578  QQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 5580  QQQQQQQQ
	defb 051h,0f1h,0f1h,091h,091h,091h,091h,061h	; 5588  Q......a
	defb 061h,061h,0f1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5590  aa......
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5598  ........
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 55a0  ........
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 55a8  ........
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,021h	; 55b0  .......!
	defb 021h,021h,021h,021h,021h,021h,021h,021h	; 55b8  !!!!!!!!
	defb 021h,021h,021h,0f1h,091h,091h,091h,091h	; 55c0  !!!.....
	defb 091h,091h,091h,081h,081h,081h,081h,081h	; 55c8  ........
	defb 081h,081h,051h,051h,051h,051h,051h,051h	; 55d0  ..QQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 55d8  QQQQQQQQ
	defb 0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h	; 55e0  ........
	defb 0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h	; 55e8  ........
	defb 0b1h,0b1h,0b1h,0b1h,0b1h,0b1h,0b1h,021h	; 55f0  .......!
	defb 021h,021h,021h,021h,021h,021h,021h,021h	; 55f8  !!!!!!!!
	defb 021h,021h,021h,021h,021h,021h,021h,021h	; 5600  !!!!!!!!
	defb 0a1h,061h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h	; 5608  .a......
	defb 0a1h,081h,051h,051h,051h,051h,051h,051h	; 5610  ..QQQQQQ
	defb 071h,071h,071h,071h,071h,071h,071h,071h	; 5618  qqqqqqqq
	defb 0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h	; 5620  ........
	defb 0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h	; 5628  ........
	defb 0b1h,0b1h,0b1h,0b1h,0b1h,0b1h,0b1h,0f1h	; 5630  ........
	defb 051h,051h,051h,051h,021h,021h,021h,021h	; 5638  QQQQ!!!!
	defb 021h,021h,021h,021h,021h,021h,021h,021h	; 5640  !!!!!!!!
	defb 0f1h,061h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h	; 5648  .a......
	defb 0a1h,0a1h,051h,051h,051h,0f1h,0f1h,0f1h	; 5650  ..QQQ...
	defb 071h,071h,071h,071h,071h,071h,071h,071h	; 5658  qqqqqqqq
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,051h	; 5660  .......Q
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 5668  QQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 5670  QQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,021h,021h	; 5678  QQQQQQ!!
	defb 021h,021h,021h,021h,021h,021h,021h,0f1h	; 5680  !!!!!!!.
	defb 0f1h,0f1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h	; 5688  ........
	defb 0a1h,0a1h,051h,051h,051h,051h,051h,051h	; 5690  ..QQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 5698  QQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 56a0  QQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 56a8  QQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 56b0  QQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 56b8  QQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 56c0  QQQQQQQQ
	defb 051h,051h,051h,051h,031h,031h,031h,031h	; 56c8  QQQQ1111
	defb 031h,031h,031h,031h,021h,021h,021h,0c1h	; 56d0  1111!!!.
	defb 0c1h,0c1h,0c1h,0c1h,071h,071h,071h,071h	; 56d8  ....qqqq
	defb 071h,071h,071h,071h,071h,071h,071h,071h	; 56e0  qqqqqqqq
	defb 0f1h,0f1h,0f1h,0f1h,051h,0f1h,051h,051h	; 56e8  ....Q.QQ
	defb 0f1h,081h,081h,081h,051h,051h,051h,0f1h	; 56f0  ....QQQ.
	defb 071h,071h,071h,071h,071h,071h,071h,071h	; 56f8  qqqqqqqq
	defb 071h,071h,071h,071h,071h,071h,071h,071h	; 5700  qqqqqqqq
	defb 071h,051h,051h,051h,0f1h,031h,031h,031h	; 5708  qQQQ.111
	defb 031h,031h,031h,021h,021h,021h,021h,0c1h	; 5710  111!!!!.
	defb 0c1h,0c1h,0c1h,0c1h,071h,071h,071h,071h	; 5718  ....qqqq
	defb 071h,071h,071h,071h,071h,071h,071h,071h	; 5720  qqqqqqqq
	defb 0f1h,0f1h,0f1h,0f1h,051h,0f1h,051h,051h	; 5728  ....Q.QQ
	defb 081h,081h,081h,081h,051h,051h,051h,051h	; 5730  ....QQQQ
	defb 071h,071h,071h,071h,071h,071h,071h,071h	; 5738  qqqqqqqq
	defb 071h,071h,071h,071h,071h,071h,071h,071h	; 5740  qqqqqqqq
	defb 051h,051h,051h,031h,031h,031h,031h,031h	; 5748  QQQ11111
	defb 031h,031h,031h,021h,021h,021h,021h,021h	; 5750  111!!!!!
	defb 021h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5758  !.......
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 5760  QQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 5768  QQQQQQQQ
	defb 0f1h,0f1h,051h,051h,051h,051h,051h,051h	; 5770  ..QQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 5778  QQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 5780  QQQQQQQQ
	defb 051h,031h,031h,031h,031h,031h,031h,031h	; 5788  Q1111111
	defb 031h,031h,031h,021h,021h,021h,021h,021h	; 5790  111!!!!!
	defb 021h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5798  !.......
	defb 091h,091h,091h,091h,091h,061h,061h,061h	; 57a0  .....aaa
	defb 091h,091h,091h,091h,091h,061h,091h,061h	; 57a8  .....a.a
	defb 0f1h,091h,091h,091h,091h,061h,091h,061h	; 57b0  .....a.a
	defb 091h,091h,091h,091h,091h,061h,0f1h,061h	; 57b8  .....a.a
	defb 091h,091h,091h,091h,091h,061h,0f1h,061h	; 57c0  .....a.a
	defb 091h,091h,091h,091h,091h,061h,061h,061h	; 57c8  .....aaa
	defb 051h,051h,051h,051h,051h,041h,041h,041h	; 57d0  QQQQQAAA
	defb 051h,051h,051h,051h,051h,041h,041h,041h	; 57d8  QQQQQAAA
	defb 051h,051h,051h,051h,051h,041h,041h,041h	; 57e0  QQQQQAAA
	defb 0f1h,061h,061h,061h,061h,061h,0f1h,0f1h	; 57e8  .aaaaa..
	defb 0f1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0f1h	; 57f0  ........
	defb 0f1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 57f8  ........
	defb 0f1h,051h,051h,051h,041h,041h,041h,0f1h	; 5800  .QQQAAA.
	defb 0f1h,051h,051h,051h,041h,041h,041h,0f1h	; 5808  .QQQAAA.
	defb 0f1h,041h,041h,041h,041h,041h,0f1h,0f1h	; 5810  .AAAAA..
	defb 0f1h,041h,041h,041h,041h,041h,0f1h,0f1h	; 5818  .AAAAA..
	defb 0f1h,0f1h,051h,051h,051h,051h,051h,0f1h	; 5820  ..QQQQQ.
	defb 0f1h,0f1h,0f1h,041h,041h,0f1h,0f1h,0f1h	; 5828  ...AA...
	defb 0f1h,0f1h,0f1h,041h,041h,041h,041h,041h	; 5830  ...AAAAA
	defb 061h,061h,061h,061h,061h,061h,061h,061h	; 5838  aaaaaaaa
	defb 061h,061h,061h,061h,061h,061h,061h,061h	; 5840  aaaaaaaa
	defb 061h,061h,061h,061h,061h,061h,061h,061h	; 5848  aaaaaaaa
	defb 041h,041h,041h,041h,041h,041h,041h,041h	; 5850  AAAAAAAA
	defb 041h,041h,041h,041h,041h,051h,051h,051h	; 5858  AAAAAQQQ
	defb 0f1h,0b1h,051h,041h,041h,041h,0a1h,051h	; 5860  ..QAAA.Q
	defb 071h,071h,071h,071h,071h,071h,071h,051h	; 5868  qqqqqqqQ
	defb 051h,051h,051h,051h,051h,051h,051h,0f1h	; 5870  QQQQQQQ.
	defb 0f1h,0b1h,051h,041h,0f1h,0b1h,0f1h,051h	; 5878  ..QA...Q
	defb 071h,071h,071h,071h,071h,071h,071h,071h	; 5880  qqqqqqqq
	defb 051h,051h,051h,051h,051h,051h,051h,0f1h	; 5888  QQQQQQQ.
	defb 0f1h,0b1h,051h,041h,0f1h,0b1h,0f1h,051h	; 5890  ..QA...Q
	defb 071h,071h,071h,071h,071h,071h,071h,071h	; 5898  qqqqqqqq
	defb 051h,051h,051h,051h,051h,051h,051h,0f1h	; 58a0  QQQQQQQ.
	defb 051h,051h,051h,041h,0f1h,0b1h,0f1h,051h	; 58a8  QQQA...Q
	defb 071h,071h,071h,071h,071h,071h,071h,0f1h	; 58b0  qqqqqqq.
	defb 051h,051h,051h,051h,051h,051h,051h,0f1h	; 58b8  QQQQQQQ.
	defb 0f1h,031h,031h,0c1h,0c1h,031h,0f1h,051h	; 58c0  .11..1.Q
	defb 071h,071h,071h,071h,071h,071h,071h,0f1h	; 58c8  qqqqqqq.
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 58d0  QQQQQQQQ
	defb 0f1h,031h,031h,0c1h,0c1h,031h,0f1h,051h	; 58d8  .11..1.Q
	defb 071h,071h,071h,071h,071h,071h,071h,051h	; 58e0  qqqqqqqQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 58e8  QQQQQQQQ
	defb 031h,031h,031h,0c1h,0c1h,031h,031h,051h	; 58f0  111..11Q
	defb 071h,071h,071h,071h,071h,071h,071h,0f1h	; 58f8  qqqqqqq.
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 5900  QQQQQQQQ
	defb 031h,031h,031h,0c1h,0c1h,031h,031h,051h	; 5908  111..11Q
	defb 071h,071h,071h,071h,071h,071h,071h,0f1h	; 5910  qqqqqqq.
	defb 051h,051h,051h,051h,051h,051h,051h,051h	; 5918  QQQQQQQQ
	defb 051h,051h,051h,041h,0a1h,0f1h,031h,051h	; 5920  QQQA..1Q
	defb 071h,071h,071h,071h,071h,071h,071h,0f1h	; 5928  qqqqqqq.
	defb 051h,051h,051h,051h,0f1h,051h,0f1h,0f1h	; 5930  QQQQ.Q..
	defb 0f1h,051h,051h,041h,0a1h,0f1h,0f1h,051h	; 5938  .QQA...Q
	defb 071h,071h,071h,071h,071h,071h,071h,071h	; 5940  qqqqqqqq
	defb 051h,051h,051h,051h,051h,051h,0f1h,0f1h	; 5948  QQQQQQ..
	defb 081h,081h,081h,081h,081h,081h,0f1h,051h	; 5950  .......Q
	defb 071h,071h,071h,071h,071h,071h,071h,071h	; 5958  qqqqqqqq
	defb 051h,051h,051h,051h,051h,051h,0f1h,0f1h	; 5960  QQQQQQ..
	defb 081h,081h,091h,091h,081h,081h,0f1h,051h	; 5968  .......Q
	defb 071h,071h,071h,071h,071h,071h,071h,081h	; 5970  qqqqqqq.
	defb 051h,051h,051h,051h,051h,051h,0f1h,0f1h	; 5978  QQQQQQ..
	defb 081h,081h,081h,081h,081h,081h,081h,081h	; 5980  ........
	defb 081h,081h,081h,081h,081h,081h,081h,081h	; 5988  ........
	defb 081h,081h,081h,081h,081h,081h,081h,081h	; 5990  ........
	defb 081h,081h,081h,081h,081h,081h,081h,081h	; 5998  ........
	defb 081h,081h,081h,081h,081h,081h,081h,081h	; 59a0  ........
	defb 081h,081h,081h,081h,081h,081h,081h,081h	; 59a8  ........
	defb 0f1h,0f1h,081h,081h,081h,081h,081h,081h	; 59b0  ........
	defb 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h	; 59b8  ........
	defb 081h,081h,081h,081h,081h,081h,081h,0f1h	; 59c0  ........
	defb 0f1h,0f1h,081h,081h,081h,081h,0f1h,081h	; 59c8  ........
	defb 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h	; 59d0  ........
	defb 0f1h,0f1h,081h,081h,081h,081h,081h,0f1h	; 59d8  ........
	defb 0f1h,081h,081h,081h,081h,081h,081h,081h	; 59e0  ........
	defb 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h	; 59e8  ........
	defb 0f1h,071h,071h,071h,071h,071h,071h,0f1h	; 59f0  .qqqqqq.
	defb 081h,081h,081h,081h,081h,081h,081h,081h	; 59f8  ........
	defb 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h	; 5a00  ........
	defb 0f1h,071h,091h,091h,071h,091h,0f1h,0f1h	; 5a08  .q..q...
	defb 061h,061h,061h,061h,061h,061h,051h,081h	; 5a10  aaaaaaQ.
	defb 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h	; 5a18  ........
	defb 0f1h,071h,071h,071h,071h,071h,071h,0c1h	; 5a20  .qqqqqq.
	defb 051h,051h,051h,051h,051h,051h,051h,081h	; 5a28  QQQQQQQ.
	defb 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h	; 5a30  ........
	defb 0f1h,0f1h,0f1h,081h,081h,081h,0f1h,031h	; 5a38  .......1
	defb 051h,051h,051h,051h,051h,051h,081h,081h	; 5a40  QQQQQQ..
	defb 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h	; 5a48  ........
	defb 081h,081h,081h,081h,081h,081h,031h,031h	; 5a50  ......11
	defb 051h,051h,051h,051h,081h,081h,081h,081h	; 5a58  QQQQ....
	defb 081h,081h,081h,081h,081h,081h,081h,081h	; 5a60  ........
	defb 081h,081h,081h,081h,081h,031h,031h,031h	; 5a68  .....111
	defb 051h,051h,051h,051h,071h,031h,031h,031h	; 5a70  QQQQq111
	defb 031h,031h,031h,031h,021h,021h,021h,0c1h	; 5a78  1111!!!.
	defb 0c1h,0c1h,0c1h,0c1h,081h,071h,071h,071h	; 5a80  .....qqq
	defb 051h,051h,051h,051h,031h,031h,031h,031h	; 5a88  QQQQ1111
	defb 031h,031h,031h,031h,021h,021h,021h,0c1h	; 5a90  1111!!!.
	defb 0c1h,0c1h,0c1h,0c1h,071h,071h,071h,071h	; 5a98  ....qqqq

; ----------------------------------------------------------------------
; DATOS tabla_5AA0: Tabla (401 B; racha 7.98, entropia 1.05, 4 valores: pocos
;   valores para ser un dibujo)
;   0x5aa0..0x5c31  (401 bytes)
DATA_tabla_5AA0:
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 5aa0  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 5ab0  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 5ac0  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 5ad0  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 5ae0  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 5af0  ................
	defb 0f7h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 5b00  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 5b10  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 5b20  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 5b30  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 5b40  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 5b50  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 5b60  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 5b70  ................
	defb 008h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 5b80  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 5b90  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 5ba0  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 5bb0  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 5bc0  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 5bd0  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 5be0  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; 5bf0  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 5c00  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 5c10  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; 5c20  ................
	defb 0ffh	; 5c30

; ----------------------------------------------------------------------
; DATOS area_de_trabajo_5C31: Area de trabajo, que en la cinta llega a ceros y
;   por eso parecia relleno (972 B): los 510 primeros bytes son la tabla de 85
;   entradas de 6 que indexa 0xC464, y el arranque los limpia con el `ldir` de
;   0xBDC2 (ver el bloque de abajo)
;   0x5c31..0x5ffd  (972 bytes)
DATA_area_de_trabajo_5C31:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5c31  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5c41  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5c51  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5c61  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5c71  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5c81  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5c91  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5ca1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5cb1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5cc1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5cd1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5ce1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5cf1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d01  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d11  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d21  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d31  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d41  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d51  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d61  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d71  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d81  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d91  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5da1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5db1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5dc1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5dd1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5de1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5df1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e01  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e11  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e21  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e31  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e41  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e51  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e61  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e71  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e81  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e91  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5ea1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5eb1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5ec1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5ed1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5ee1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5ef1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f01  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f11  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f21  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f31  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f41  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f51  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f61  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f71  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f81  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f91  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5fa1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5fb1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5fc1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5fd1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5fe1  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5ff1  ............

; ----------------------------------------------------------------------
; DATOS graficos_5FFD: Graficos (339 B; racha 4.22, entropia 4.33, 50 valores:
;   rachas mas largas que el azar)
;   0x5ffd..0x6150  (339 bytes)
DATA_graficos_5FFD:
	defb 0ffh,000h,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,018h,018h,018h,018h,018h	; 5ffd  ................
	defb 000h,018h,000h,000h,03ch,030h,030h,030h,030h,030h,03ch,000h,040h,060h,030h,018h	; 600d  ....<00000<.@`0.
	defb 00ch,006h,000h,000h,03ch,00ch,00ch,00ch,00ch,00ch,03ch,000h,010h,038h,06ch,0c6h	; 601d  ....<.....<..8l.
	defb 000h,000h,000h,006h,039h,02dh,075h,075h,075h,073h,000h,018h,000h,008h,038h,070h	; 602d  ....9-uuus....8p
	defb 071h,07fh,000h,00ch,018h,018h,018h,018h,018h,00ch,000h,030h,018h,018h,018h,018h	; 603d  q..........0....
	defb 018h,030h,000h,000h,066h,018h,07eh,07eh,018h,066h,000h,000h,018h,018h,07eh,07eh	; 604d  .0..f.~~.f....~~
	defb 018h,018h,000h,000h,000h,000h,000h,00ch,00ch,018h,000h,000h,000h,000h,07eh,07eh	; 605d  ..............~~
	defb 000h,000h,000h,000h,000h,000h,000h,000h,018h,018h,000h,001h,003h,006h,00ch,018h	; 606d  ................
	defb 030h,060h,000h,03fh,023h,075h,079h,071h,071h,07fh,000h,018h,008h,01ch,01ch,01ch	; 607d  0`.?#uyqq.......
	defb 01ch,01ch,000h,03eh,002h,03eh,070h,070h,071h,07fh,000h,03eh,022h,00eh,007h,007h	; 608d  ...>.>ppq..>"...
	defb 047h,07fh,000h,044h,044h,07ch,00eh,00eh,00eh,00eh,000h,03fh,020h,03eh,007h,047h	; 609d  G..DD|.....? >.G
	defb 047h,07fh,000h,01fh,030h,07fh,071h,071h,071h,07fh,000h,07ch,044h,01eh,007h,007h	; 60ad  G...0.qqq..|D...
	defb 007h,007h,000h,01eh,012h,03fh,071h,071h,071h,07fh,000h,03eh,022h,03eh,007h,007h	; 60bd  .....?qqq..>">..
	defb 007h,007h,000h,000h,018h,018h,000h,018h,018h,000h,000h,000h,018h,018h,000h,018h	; 60cd  ................
	defb 018h,030h,000h,000h,000h,000h,000h,000h,000h,000h,07fh,000h,07eh,07eh,000h,07eh	; 60dd  .0..........~~.~
	defb 07eh,000h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh,07fh,047h,007h,00eh,008h	; 60ed  ~...........G...
	defb 000h,00ch,000h,03ch,042h,0bdh,0a1h,0b1h,0bdh,042h,03ch,01eh,012h,03fh,071h,071h	; 60fd  ...<B....B<..?qq
	defb 071h,071h,000h,03ch,024h,03eh,072h,072h,072h,07eh,000h,03fh,021h,070h,070h,070h	; 610d  qq.<$>rrr~.?!ppp
	defb 071h,07fh,000h,03fh,021h,021h,071h,071h,071h,07fh,000h,03fh,021h,03ch,070h,070h	; 611d  q..?!!qqq..?!<pp
	defb 071h,07fh,000h,01fh,011h,03ch,070h,070h,070h,070h,000h,03fh,021h,020h,077h,071h	; 612d  q....<pppp.?! wq
	defb 071h,07fh,000h,012h,012h,03fh,071h,071h,071h,071h,000h,008h,008h,008h,01ch,01ch	; 613d  q....?qqqq......
	defb 01ch,01ch,000h	; 614d

; ----------------------------------------------------------------------
; DATOS charset: Charset: 59 caracteres de 8x8
;   0x6150..0x61d8  (136 bytes)
DATA_6150:
	defb 002h,002h,002h,007h,047h,047h,07fh,000h,026h,02ch,038h,078h,07ch,076h,073h,000h	; 6150  ....GG..&,8x|vs.
	defb 020h,020h,020h,070h,070h,071h,07fh,000h,03fh,025h,025h,071h,071h,071h,071h,000h	; 6160     ppq..?%%qqqq.
	defb 03dh,025h,075h,075h,075h,075h,077h,000h,03fh,021h,071h,071h,071h,071h,07fh,000h	; 6170  =%uuuuw.?!qqqq..
	defb 01fh,011h,03fh,070h,070h,070h,070h,000h,03fh,021h,021h,071h,075h,073h,07fh,000h	; 6180  ..?pppp.?!!qus..
	defb 01fh,011h,03fh,072h,071h,071h,071h,000h,03eh,020h,03eh,007h,007h,047h,07fh,000h	; 6190  ..?rqqq.> >..G..
	defb 07fh,008h,01ch,01ch,01ch,01ch,01ch,000h,021h,021h,071h,071h,071h,071h,07fh,000h	; 61a0  ........!!qqqq..
	defb 041h,041h,062h,072h,074h,034h,03ch,000h,021h,021h,021h,071h,075h,075h,03ah,000h	; 61b0  AAbrt4<.!!!quu:.
	defb 043h,066h,03ch,018h,03ch,076h,063h,000h,022h,022h,03eh,008h,01ch,01ch,01ch,000h	; 61c0  Cf<.<vc."">.....
	defb 07fh,042h,00ch,01ch,038h,071h,07fh,000h	; 61d0  .B..8q..

; ----------------------------------------------------------------------
; DATOS datos_nivel_1: Level 1 Data
;   0x61d8..0x62d7  (255 bytes)
DATA_datos_nivel_1:
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
	defb 00eh,09bh,00fh,000h,092h,012h,012h,0abh,030h,030h,091h,000h,090h,000h,0ffh	; 62c8  ........00.....

; ----------------------------------------------------------------------
; DATOS datos_nivel_2: Level 2 Data
;   0x62d7..0x63d4  (253 bytes)
DATA_datos_nivel_2:
	defb 088h,088h,027h,03ch,0a6h,03ch,024h,097h,097h,01ah,032h,0c2h,032h,0c2h,036h,0c2h	; 62d7  ..'<.<$...2.2.6.
	defb 036h,01ah,097h,097h,047h,037h,031h,0bch,047h,026h,037h,031h,0bdh,025h,093h,031h	; 62e7  6...G71.G&71.%.1
	defb 012h,094h,092h,0a5h,091h,0b2h,0b5h,0b4h,027h,03ch,037h,01bh,03ch,024h,0bfh,045h	; 62f7  ........'<7.<$.E
	defb 01bh,0beh,012h,08bh,08ah,012h,0c1h,031h,032h,0c0h,0a8h,031h,036h,0a7h,0b2h,0b5h	; 6307  .......12..16...
	defb 017h,09dh,09ch,017h,009h,092h,091h,008h,09ch,08eh,09dh,091h,023h,000h,092h,0b7h	; 6317  ............#...
	defb 026h,096h,095h,025h,093h,0a6h,094h,092h,043h,043h,091h,09eh,03ch,03ch,08bh,092h	; 6327  &..%....CC..<<..
	defb 019h,019h,091h,000h,090h,081h,085h,080h,0bfh,085h,0beh,037h,002h,085h,001h,030h	; 6337  ...........7...0
	defb 03bh,002h,085h,001h,030h,01ah,0a9h,0aah,030h,01ah,03ch,013h,0bch,013h,026h,03ch	; 6347  ;...0...0.<...&<
	defb 045h,0bdh,025h,093h,0a0h,094h,000h,010h,09fh,011h,000h,084h,084h,098h,0a1h,099h	; 6357  E.%.............
	defb 0a4h,0b4h,027h,0beh,0bfh,024h,047h,001h,030h,030h,002h,0bah,0c0h,0c1h,0bbh,0a7h	; 6367  ..'..$G.00......
	defb 0a8h,012h,0afh,086h,0aeh,0a3h,0a3h,0b1h,027h,007h,01ah,012h,043h,024h,00fh,037h	; 6377  ........'...C$.7
	defb 01ah,012h,047h,047h,011h,007h,01ah,037h,047h,047h,0a8h,01ah,0a7h,004h,092h,037h	; 6387  ..GG...7GG.....7
	defb 091h,000h,09dh,045h,09ch,017h,092h,01ah,091h,000h,092h,01ah,096h,000h,09eh,03ch	; 6397  ...E...........<
	defb 03ch,0a9h,092h,045h,0a7h,004h,009h,001h,012h,091h,015h,0a6h,012h,0a9h,003h,019h	; 63a7  <..E............
	defb 019h,0bah,019h,019h,0a8h,0bbh,0a7h,0b2h,0b5h,000h,0b3h,000h,095h,0a5h,096h,001h	; 63b7  ................
	defb 0a7h,0a8h,002h,089h,080h,089h,089h,080h,089h,087h,080h,087h,0ffh	; 63c7  .............

; ----------------------------------------------------------------------
; DATOS datos_nivel_3: Level 3 Data
;   0x63d4..0x64d4  (256 bytes)
DATA_datos_nivel_3:
	defb 088h,088h,027h,037h,0a6h,037h,024h,03ch,0bch,01ah,0bah,026h,0bdh,01ah,0bbh,093h	; 63d4  ..'7.7$<...&....
	defb 03bh,012h,03ch,025h,092h,03bh,046h,094h,092h,046h,094h,000h,092h,01ah,091h,000h	; 63e4  ;.<%.;F..F......
	defb 095h,045h,08bh,01eh,027h,03ch,01ah,091h,000h,097h,096h,000h,0a5h,01ah,012h,0a9h	; 63f4  .E..'<..........
	defb 0a8h,01ah,046h,047h,047h,092h,0a1h,037h,025h,092h,08eh,094h,092h,0c2h,0abh,0c2h	; 6404  ..FGG..7%.......
	defb 091h,095h,045h,01ah,096h,027h,032h,0bch,032h,024h,03ch,036h,0bdh,036h,03ch,0a0h	; 6414  ..E..'2.2$<6.6<.
	defb 046h,046h,0a0h,002h,090h,001h,091h,023h,000h,092h,0b7h,01bh,0abh,031h,01ch,002h	; 6424  FF.....#.....1..
	defb 008h,009h,001h,03ch,01ch,0a6h,0a6h,03ch,0bfh,0a5h,0beh,0c1h,0a0h,0c0h,0a7h,09fh	; 6434  ...<...<........
	defb 0a8h,0b6h,09ch,0a1h,09dh,0a2h,091h,087h,0b9h,002h,081h,0b8h,0b7h,01ch,0a9h,0aah	; 6444  ................
	defb 0bah,0beh,0bfh,0bbh,001h,046h,018h,002h,0c2h,0c0h,0c1h,0c2h,01bh,046h,01bh,043h	; 6454  .....F.......F.C
	defb 01ah,0a7h,08ch,0a8h,0b7h,030h,091h,095h,03bh,030h,08bh,021h,0bch,012h,091h,001h	; 6464  .....0..;0.!....
	defb 0bdh,012h,091h,0aeh,004h,032h,091h,083h,036h,091h,083h,01ah,091h,083h,01ah,096h	; 6474  .....2..6.......
	defb 083h,01ah,030h,0a9h,00fh,000h,026h,030h,046h,037h,091h,093h,01ah,037h,091h,09eh	; 6484  ..0...&0F7...7..
	defb 03ch,037h,0abh,03ch,01ah,091h,095h,045h,01ah,096h,027h,0a0h,0a0h,024h,094h,08eh	; 6494  <7.<...E..'..$..
	defb 093h,0b6h,0b6h,096h,0a1h,095h,00fh,0a6h,0a6h,00eh,011h,031h,0a5h,031h,010h,0a7h	; 64a4  ...........1.1..
	defb 08ch,0a8h,0b6h,0b6h,0a9h,08dh,0aah,04bh,0bah,012h,012h,04ah,053h,0bbh,019h,019h	; 64b4  .......K...JS...
	defb 052h,0a7h,09ah,0a8h,091h,087h,092h,0b6h,09ch,020h,01fh,09dh,005h,082h,006h,0ffh	; 64c4  R........ ......

; ----------------------------------------------------------------------
; DATOS datos_nivel_4: Level 4 Data
;   0x64d4..0x65db  (263 bytes)
DATA_datos_nivel_4:
	defb 088h,088h,027h,032h,0a6h,032h,024h,037h,036h,0a1h,036h,037h,012h,00eh,09bh,00fh	; 64d4  ..'2.2$76.67....
	defb 012h,03ch,0c0h,0c1h,03ch,0c6h,0c4h,0c7h,059h,037h,0c5h,037h,059h,097h,097h,01ah	; 64e4  .<..<...Y7.7Y...
	defb 012h,0cah,012h,0c2h,030h,0cah,030h,01ah,026h,030h,0cah,030h,025h,093h,0cah,094h	; 64f4  ....0.0.&0.0%...
	defb 0b2h,000h,009h,092h,091h,008h,0a2h,005h,0b3h,006h,092h,030h,030h,091h,095h,0c2h	; 6504  ...........00...
	defb 096h,027h,059h,012h,03ch,059h,024h,0c9h,01ah,045h,0c8h,037h,037h,0c2h,012h,012h	; 6514  .'Y.<Y$..E.77...
	defb 0a7h,026h,01ah,0a0h,091h,010h,0afh,001h,091h,086h,092h,091h,086h,09eh,002h,0ach	; 6524  .&..............
	defb 00fh,092h,0a6h,01ah,024h,0aah,031h,037h,01ah,045h,0c6h,0bch,0c2h,059h,025h,0bdh	; 6534  ....$.17.E...Y%.
	defb 046h,01ah,094h,026h,047h,0a0h,091h,08fh,006h,011h,000h,084h,083h,088h,083h,001h	; 6544  F..&G...........
	defb 032h,002h,020h,01eh,08ah,036h,002h,083h,001h,03ch,002h,083h,08fh,084h,088h,083h	; 6554  2. ..6...<......
	defb 001h,032h,002h,083h,001h,036h,08bh,01eh,01fh,001h,037h,002h,023h,099h,08fh,083h	; 6564  .2...6....7.#...
	defb 084h,098h,0ach,00fh,080h,00eh,027h,032h,091h,000h,010h,026h,036h,091h,098h,0aeh	; 6574  ......'2...&6...
	defb 011h,000h,084h,084h,098h,008h,009h,099h,0b4h,027h,04eh,045h,04fh,03bh,024h,03bh	; 6584  .........'NEO;$;
	defb 059h,046h,059h,0a0h,0a7h,08ch,005h,001h,005h,081h,0b9h,082h,0b8h,080h,0a1h,092h	; 6594  YFY.............
	defb 000h,095h,0a9h,027h,0aah,0c6h,058h,037h,043h,043h,059h,0c4h,037h,026h,03ch,059h	; 65a4  ...'..X7CCY.7&<Y
	defb 0c5h,025h,0aeh,09ah,0afh,0a4h,098h,087h,099h,084h,084h,000h,0beh,0bfh,000h,095h	; 65b4  .%..............
	defb 045h,032h,096h,027h,030h,012h,036h,030h,024h,037h,0a0h,0a0h,0c2h,002h,087h,001h	; 65c4  E2.'0.60$7......
	defb 0c2h,0abh,03ch,0afh,080h,0aeh,0ffh	; 65d4

; ----------------------------------------------------------------------
; DATOS datos_nivel_5: Level 5 Data
;   0x65db..0x66ea  (271 bytes)
DATA_datos_nivel_5:
	defb 088h,088h,027h,037h,0a6h,037h,024h,03ch,059h,045h,047h,059h,03ch,0c9h,046h,032h	; 65db  ..'7.7$<YEGY<.F2
	defb 0c8h,003h,0bfh,036h,0beh,004h,0c1h,059h,0c0h,08ch,09ah,08ch,0a4h,08dh,09bh,08dh	; 65eb  ...6...Y........
	defb 0cbh,012h,059h,0bah,047h,01ah,045h,059h,0bbh,047h,01ah,046h,0c8h,026h,03ch,01ah	; 65fb  ..Y.G.EY.G.F.&<.
	defb 030h,030h,025h,093h,0bch,094h,092h,0bdh,0abh,045h,045h,091h,0b2h,0b5h,000h,0b3h	; 660b  00%......EE.....
	defb 000h,092h,0cah,091h,009h,001h,046h,03ch,002h,008h,0a6h,0cah,0a6h,058h,0c9h,0c8h	; 661b  ......F<.....X..
	defb 058h,03ch,0cbh,047h,03ch,012h,012h,0c2h,047h,030h,026h,047h,01ah,0a5h,025h,093h	; 662b  X<.G<...G0&G..%.
	defb 0c2h,094h,0b2h,0b5h,016h,09dh,09ch,016h,099h,089h,098h,016h,017h,08eh,017h,016h	; 663b  ................
	defb 099h,086h,098h,099h,086h,098h,015h,0b0h,015h,0aah,045h,043h,0a9h,03ch,0a7h,0a8h	; 664b  ..........EC.<..
	defb 03ch,094h,080h,093h,091h,008h,009h,092h,09ch,089h,09dh,09ch,089h,09dh,005h,092h	; 665b  <...............
	defb 091h,006h,000h,0b3h,000h,0aah,0a5h,0a9h,032h,012h,0c4h,012h,032h,036h,032h,0c5h	; 666b  ........2...262.
	defb 032h,036h,026h,036h,0bah,036h,025h,093h,0bbh,094h,092h,0c2h,091h,0b9h,0c2h,002h	; 667b  26&6.6%.........
	defb 00ah,0b8h,031h,037h,002h,00bh,092h,01ah,037h,091h,0aah,0c2h,096h,026h,0c3h,0c2h	; 668b  ..17....7....&..
	defb 024h,093h,0c7h,01ah,03bh,000h,093h,059h,01ah,025h,000h,092h,059h,094h,000h,092h	; 669b  $...;..Y.%..Y...
	defb 045h,091h,009h,008h,027h,059h,096h,0a6h,012h,059h,012h,024h,03bh,01ah,045h,0c8h	; 66ab  E...'Y...Y.$;.E.
	defb 058h,026h,0cbh,03bh,025h,093h,045h,046h,094h,0b2h,080h,0b3h,000h,092h,0bah,0abh	; 66bb  X&.;%.EF........
	defb 0bbh,091h,0aah,0bch,0a9h,0a5h,0bdh,0c6h,019h,0c3h,01ch,059h,03ch,026h,097h,0a7h	; 66cb  ...........Y<&..
	defb 093h,037h,094h,015h,092h,01ah,091h,016h,092h,01ah,091h,080h,08fh,080h,0ffh	; 66db  .7.............

; ----------------------------------------------------------------------
; DATOS datos_nivel_6: Level 6 Data
;   0x66ea..0x67e4  (250 bytes)
DATA_datos_nivel_6:
	defb 088h,088h,093h,0a6h,03ch,024h,092h,0beh,08dh,092h,001h,032h,0a5h,0b9h,001h,036h	; 66ea  ....<$.....2...6
	defb 0a7h,0b8h,0c0h,011h,025h,092h,037h,037h,094h,092h,0cah,091h,095h,037h,037h,096h	; 66fa  ....%.77.....77.
	defb 027h,007h,097h,024h,0cch,059h,0beh,0cdh,059h,0c0h,026h,03ch,03ch,0c8h,025h,0aeh	; 670a  '..$.Y..Y.&<<.%.
	defb 09ah,0afh,098h,087h,099h,084h,098h,0a1h,099h,0a4h,0ach,09bh,08dh,027h,01ch,047h	; 671a  .............'.G
	defb 0bch,018h,057h,01bh,047h,0bdh,032h,05fh,0a7h,0a8h,036h,007h,0abh,0cah,091h,0b9h	; 672a  ..W.G.2_..6.....
	defb 0cah,091h,0b8h,030h,031h,096h,095h,030h,043h,032h,0a6h,043h,012h,013h,036h,046h	; 673a  ...01..0C2.C..6F
	defb 0cch,004h,0a8h,0cdh,080h,093h,0a7h,020h,01fh,09dh,091h,080h,0b3h,000h,095h,032h	; 674a  ....... .......2
	defb 03ch,002h,092h,037h,036h,094h,08ah,0c3h,0abh,012h,047h,002h,00ah,09eh,012h,046h	; 675a  <..76.....G....F
	defb 002h,00bh,000h,0c0h,0afh,000h,098h,083h,000h,098h,00eh,0adh,000h,098h,001h,045h	; 676a  ...............E
	defb 091h,098h,010h,0afh,000h,098h,086h,080h,098h,086h,080h,0b1h,001h,032h,0c3h,032h	; 677a  .............2.2
	defb 002h,001h,036h,0a0h,036h,002h,08fh,08fh,084h,084h,0b1h,027h,0beh,0bfh,024h,08ah	; 678a  ..6.6......'..$.
	defb 0a5h,08bh,026h,0c0h,0c1h,025h,093h,037h,059h,094h,092h,0cah,0abh,059h,03ch,0abh	; 679a  ..&..%.7Y....Y<.
	defb 0cah,091h,0aah,046h,059h,0a9h,059h,0cch,057h,0cah,0cdh,05fh,059h,0c8h,058h,046h	; 67aa  ...FY.Y.W.._Y.XF
	defb 0c9h,03ch,0a7h,0a8h,03ch,094h,023h,000h,093h,0b6h,09ch,0a1h,09dh,09ch,08eh,09dh	; 67ba  .<..<.#.........
	defb 091h,085h,092h,005h,098h,099h,006h,080h,085h,081h,0b0h,000h,092h,031h,032h,0abh	; 67ca  .............12.
	defb 031h,036h,0abh,0a0h,091h,000h,087h,087h,000h,0ffh	; 67da  16........

; ----------------------------------------------------------------------
; DATOS datos_nivel_7: Level 7 Data
;   0x67e4..0x68ff  (283 bytes)
DATA_datos_nivel_7:
	defb 088h,088h,027h,01bh,0a6h,01bh,024h,059h,054h,055h,056h,054h,0cah,05ch,05dh,05eh	; 67e4  ..'...$YTUVT.\]^
	defb 05ch,059h,0c8h,04fh,04eh,0c9h,0bch,0cah,012h,057h,0bdh,0cch,05fh,026h,047h,0cdh	; 67f4  \Y.ON....W.._&G.
	defb 025h,093h,0c3h,094h,092h,046h,046h,002h,00ah,000h,0c0h,0c1h,00bh,084h,000h,016h	; 6804  %....FF.........
	defb 017h,017h,016h,000h,084h,088h,083h,027h,03ch,002h,083h,0a5h,096h,099h,037h,057h	; 6814  .......'<.....7W
	defb 045h,024h,08dh,026h,05fh,0cbh,025h,093h,0bah,094h,09dh,0bbh,09ch,000h,010h,09ah	; 6824  E$.&_.%.........
	defb 011h,000h,017h,09dh,09ch,017h,009h,092h,091h,008h,09ch,08eh,09dh,096h,023h,000h	; 6834  ..............#.
	defb 095h,032h,0abh,032h,036h,0abh,036h,01ah,0abh,0c2h,0abh,01ah,037h,096h,095h,03ch	; 6844  .2.26.6.....7..<
	defb 0bfh,0a6h,0beh,03bh,08bh,08ah,03bh,0c1h,046h,030h,0c0h,08ch,026h,046h,0a7h,080h	; 6854  ...;..;.F0..&F..
	defb 001h,094h,000h,016h,09dh,09ch,016h,080h,001h,002h,00ah,000h,08dh,027h,002h,00bh	; 6864  .............'..
	defb 000h,026h,043h,045h,096h,000h,093h,03bh,046h,096h,000h,093h,03ch,03ch,024h,000h	; 6874  .&CE...;F...<<$.
	defb 09eh,063h,064h,065h,000h,092h,06bh,06ch,06dh,000h,092h,066h,067h,06eh,08dh,027h	; 6884  .cde..klm..fgn.'
	defb 03bh,0bch,08ch,0a8h,0bdh,083h,093h,03ch,083h,095h,025h,08dh,0aah,094h,026h,0a5h	; 6894  ;......<..%...&.
	defb 094h,000h,090h,000h,0a3h,0a3h,080h,0beh,00fh,080h,0b9h,031h,091h,008h,0b8h,043h	; 68a4  ...........1...C
	defb 002h,095h,092h,03bh,0a6h,03ch,095h,01ah,063h,064h,065h,027h,0c3h,06bh,06ch,06dh	; 68b4  ...;.<..cde'.klm
	defb 037h,057h,045h,066h,067h,06eh,01ah,05fh,046h,032h,007h,025h,037h,0c4h,036h,094h	; 68c4  7WEfgn._F2.%7.6.
	defb 026h,0c5h,025h,011h,000h,0aeh,026h,002h,099h,0a4h,0a4h,0ach,09bh,08dh,027h,0beh	; 68d4  &.%...&.......'.
	defb 08dh,003h,032h,001h,0c6h,030h,037h,036h,001h,059h,03ch,0a7h,026h,0c0h,0c1h,025h	; 68e4  ..2..076.Y<.&..%
	defb 093h,0cah,094h,092h,045h,045h,091h,000h,090h,000h,0ffh	; 68f4  ....EE.....

; ----------------------------------------------------------------------
; DATOS relleno_68FF: Relleno (169 B; 169 de 169 bytes son 0x00)
;   0x68ff..0x69a8  (169 bytes)
DATA_relleno_68FF:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 68ff  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 690f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 691f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 692f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 693f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 694f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 695f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 696f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 697f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 698f  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h	; 699f  .........

; ----------------------------------------------------------------------
; DATOS graficos_de_los_centinelas: Graficos de los centinelas: 15 de 24x24
;   0x69a8..0x6de0  (1080 bytes)
DATA_graficos_de_los_centinelas:
	defb 000h,000h,000h	; 69a8
	defb 02ah,0aah,0aah	; 69ab
	defb 040h,000h,006h	; 69ae
	defb 000h,000h,00eh	; 69b1
	defb 045h,055h,05eh	; 69b4
	defb 00fh,0ffh,0ceh	; 69b7
	defb 044h,000h,05eh	; 69ba
	defb 00ch,0aah,0ceh	; 69bd
	defb 045h,0ffh,05eh	; 69c0
	defb 00ch,0feh,0ceh	; 69c3
	defb 045h,0c0h,05eh	; 69c6
	defb 00ch,0c8h,0ceh	; 69c9
	defb 045h,0d8h,05eh	; 69cc
	defb 00ch,0c0h,0ceh	; 69cf
	defb 045h,0c0h,05eh	; 69d2
	defb 00ch,080h,0ceh	; 69d5
	defb 045h,055h,05eh	; 69d8
	defb 00fh,0ffh,0ceh	; 69db
	defb 044h,000h,01eh	; 69de
	defb 00ah,0aah,0aeh	; 69e1
	defb 05fh,0ffh,0feh	; 69e4
	defb 03fh,0ffh,0feh	; 69e7
	defb 07fh,0ffh,0feh	; 69ea
	defb 000h,000h,000h	; 69ed
	defb 000h,000h,000h	; 69f0
	defb 02ah,0aah,0aah	; 69f3
	defb 040h,000h,006h	; 69f6
	defb 000h,000h,00eh	; 69f9
	defb 045h,055h,05eh	; 69fc
	defb 008h,000h,02eh	; 69ff
	defb 040h,000h,07eh	; 6a02
	defb 008h,0aah,0eeh	; 6a05
	defb 041h,001h,07eh	; 6a08
	defb 008h,07dh,0eeh	; 6a0b
	defb 041h,069h,07eh	; 6a0e
	defb 008h,055h,0eeh	; 6a11
	defb 041h,069h,07eh	; 6a14
	defb 008h,055h,0eeh	; 6a17
	defb 041h,001h,07eh	; 6a1a
	defb 008h,0ffh,0eeh	; 6a1d
	defb 041h,055h,07eh	; 6a20
	defb 00bh,0ffh,0eeh	; 6a23
	defb 047h,0ffh,0feh	; 6a26
	defb 00ah,0aah,0aeh	; 6a29
	defb 05fh,0ffh,0feh	; 6a2c
	defb 03fh,0ffh,0feh	; 6a2f
	defb 07fh,0ffh,0feh	; 6a32
	defb 000h,000h,000h	; 6a35
	defb 000h,000h,000h	; 6a38
	defb 02ah,0aah,0aah	; 6a3b
	defb 040h,000h,006h	; 6a3e
	defb 000h,000h,00eh	; 6a41
	defb 045h,055h,05eh	; 6a44
	defb 008h,000h,02eh	; 6a47
	defb 044h,000h,05eh	; 6a4a
	defb 008h,0aah,0eeh	; 6a4d
	defb 044h,001h,0deh	; 6a50
	defb 008h,082h,0eeh	; 6a53
	defb 044h,017h,0deh	; 6a56
	defb 008h,0beh,0eeh	; 6a59
	defb 044h,07fh,0deh	; 6a5c
	defb 008h,0aah,0eeh	; 6a5f
	defb 044h,055h,0deh	; 6a62
	defb 00ah,02bh,0aeh	; 6a65
	defb 045h,07fh,05eh	; 6a68
	defb 00ah,0c2h,0aeh	; 6a6b
	defb 045h,07fh,05eh	; 6a6e
	defb 00ah,0aah,0aeh	; 6a71
	defb 05fh,0ffh,0feh	; 6a74
	defb 039h,024h,09eh	; 6a77
	defb 07fh,0ffh,0feh	; 6a7a
	defb 000h,000h,000h	; 6a7d
	defb 000h,000h,000h	; 6a80
	defb 029h,0ffh,0eah	; 6a83
	defb 041h,089h,046h	; 6a86
	defb 001h,08dh,04eh	; 6a89
	defb 045h,0afh,05eh	; 6a8c
	defb 009h,08dh,06eh	; 6a8f
	defb 045h,06ah,05eh	; 6a92
	defb 009h,02ch,06eh	; 6a95
	defb 045h,02ch,05eh	; 6a98
	defb 009h,04ah,06eh	; 6a9b
	defb 045h,089h,05eh	; 6a9e
	defb 009h,08dh,06eh	; 6aa1
	defb 045h,0afh,05eh	; 6aa4
	defb 009h,08dh,06eh	; 6aa7
	defb 045h,06ah,05eh	; 6aaa
	defb 009h,02ch,06eh	; 6aad
	defb 045h,02ch,05eh	; 6ab0
	defb 009h,04ah,06eh	; 6ab3
	defb 045h,089h,05eh	; 6ab6
	defb 009h,08dh,06eh	; 6ab9
	defb 05dh,0afh,07eh	; 6abc
	defb 03dh,08dh,07eh	; 6abf
	defb 07dh,06ah,07eh	; 6ac2
	defb 001h,02ch,040h	; 6ac5
	defb 000h,000h,000h	; 6ac8
	defb 029h,0ffh,0eah	; 6acb
	defb 041h,02ch,046h	; 6ace
	defb 001h,04ah,04eh	; 6ad1
	defb 045h,089h,05eh	; 6ad4
	defb 009h,08dh,06eh	; 6ad7
	defb 045h,0afh,05eh	; 6ada
	defb 009h,08dh,06eh	; 6add
	defb 045h,06ah,05eh	; 6ae0
	defb 009h,02ch,06eh	; 6ae3
	defb 045h,02ch,05eh	; 6ae6
	defb 009h,04ah,06eh	; 6ae9
	defb 045h,089h,05eh	; 6aec
	defb 009h,08dh,06eh	; 6aef
	defb 045h,0afh,05eh	; 6af2
	defb 009h,08dh,06eh	; 6af5
	defb 045h,06ah,05eh	; 6af8
	defb 009h,02ch,06eh	; 6afb
	defb 045h,009h,05eh	; 6afe
	defb 009h,0aah,06eh	; 6b01
	defb 05dh,04dh,07eh	; 6b04
	defb 03dh,0aah,07eh	; 6b07
	defb 07dh,04dh,07eh	; 6b0a
	defb 001h,008h,040h	; 6b0d
	defb 000h,000h,000h	; 6b10
	defb 029h,0ffh,0eah	; 6b13
	defb 041h,009h,046h	; 6b16
	defb 001h,0ach,04eh	; 6b19
	defb 045h,02ch,05eh	; 6b1c
	defb 009h,04ah,06eh	; 6b1f
	defb 045h,089h,05eh	; 6b22
	defb 009h,08dh,06eh	; 6b25
	defb 045h,0afh,05eh	; 6b28
	defb 009h,08dh,06eh	; 6b2b
	defb 045h,06ah,05eh	; 6b2e
	defb 009h,02ch,06eh	; 6b31
	defb 045h,02ch,05eh	; 6b34
	defb 009h,04ah,06eh	; 6b37
	defb 045h,089h,05eh	; 6b3a
	defb 009h,08dh,06eh	; 6b3d
	defb 045h,0afh,05eh	; 6b40
	defb 009h,08dh,06eh	; 6b43
	defb 045h,06ah,05eh	; 6b46
	defb 009h,02ch,06eh	; 6b49
	defb 05dh,009h,07eh	; 6b4c
	defb 03dh,0aah,07eh	; 6b4f
	defb 07dh,04dh,07eh	; 6b52
	defb 001h,008h,040h	; 6b55
	defb 000h,000h,000h	; 6b58
	defb 029h,0ffh,0eah	; 6b5b
	defb 041h,009h,046h	; 6b5e
	defb 001h,0ach,04eh	; 6b61
	defb 045h,02dh,05eh	; 6b64
	defb 009h,088h,06eh	; 6b67
	defb 045h,02ch,05eh	; 6b6a
	defb 009h,04ah,06eh	; 6b6d
	defb 045h,089h,05eh	; 6b70
	defb 009h,08dh,06eh	; 6b73
	defb 045h,0afh,05eh	; 6b76
	defb 009h,08dh,06eh	; 6b79
	defb 045h,06ah,05eh	; 6b7c
	defb 009h,02ch,06eh	; 6b7f
	defb 045h,02ch,05eh	; 6b82
	defb 009h,04ah,06eh	; 6b85
	defb 045h,089h,05eh	; 6b88
	defb 009h,08dh,06eh	; 6b8b
	defb 045h,0afh,05eh	; 6b8e
	defb 009h,08dh,06eh	; 6b91
	defb 05dh,06ah,07eh	; 6b94
	defb 03dh,02ch,07eh	; 6b97
	defb 07dh,009h,07eh	; 6b9a
	defb 001h,008h,040h	; 6b9d
	defb 000h,000h,000h	; 6ba0
	defb 02ah,0aah,0aah	; 6ba3
	defb 040h,000h,006h	; 6ba6
	defb 000h,000h,00eh	; 6ba9
	defb 04ah,0a5h,05eh	; 6bac
	defb 005h,042h,0aeh	; 6baf
	defb 04ah,008h,05eh	; 6bb2
	defb 004h,055h,02eh	; 6bb5
	defb 048h,0ffh,09eh	; 6bb8
	defb 005h,0feh,02eh	; 6bbb
	defb 048h,0c0h,09eh	; 6bbe
	defb 001h,0d8h,04eh	; 6bc1
	defb 042h,0d8h,08eh	; 6bc4
	defb 009h,0c0h,01eh	; 6bc7
	defb 044h,0c0h,0aeh	; 6bca
	defb 009h,080h,01eh	; 6bcd
	defb 044h,0aah,02eh	; 6bd0
	defb 00ah,010h,05eh	; 6bd3
	defb 045h,042h,0aeh	; 6bd6
	defb 00ah,0a5h,05eh	; 6bd9
	defb 05fh,0ffh,0feh	; 6bdc
	defb 03fh,0ffh,0feh	; 6bdf
	defb 07fh,0ffh,0feh	; 6be2
	defb 000h,000h,000h	; 6be5
	defb 000h,000h,000h	; 6be8
	defb 02ah,0aah,0aah	; 6beb
	defb 040h,000h,006h	; 6bee
	defb 000h,000h,00eh	; 6bf1
	defb 04ah,0a5h,05eh	; 6bf4
	defb 005h,042h,0aeh	; 6bf7
	defb 04ah,008h,05eh	; 6bfa
	defb 004h,055h,02eh	; 6bfd
	defb 048h,000h,09eh	; 6c00
	defb 005h,001h,02eh	; 6c03
	defb 048h,03fh,09eh	; 6c06
	defb 001h,027h,04eh	; 6c09
	defb 042h,027h,08eh	; 6c0c
	defb 009h,03fh,01eh	; 6c0f
	defb 044h,03fh,0aeh	; 6c12
	defb 009h,07fh,01eh	; 6c15
	defb 044h,0aah,02eh	; 6c18
	defb 00ah,010h,05eh	; 6c1b
	defb 045h,042h,0aeh	; 6c1e
	defb 00ah,0a5h,05eh	; 6c21
	defb 05fh,0ffh,0feh	; 6c24
	defb 03fh,0ffh,0feh	; 6c27
	defb 07fh,0ffh,0feh	; 6c2a
	defb 000h,000h,000h	; 6c2d
	defb 000h,000h,000h	; 6c30
	defb 02ah,0aah,0aah	; 6c33
	defb 040h,000h,006h	; 6c36
	defb 000h,000h,00eh	; 6c39
	defb 045h,015h,05eh	; 6c3c
	defb 00eh,0ebh,0eeh	; 6c3f
	defb 049h,054h,07eh	; 6c42
	defb 00bh,0fah,0aeh	; 6c45
	defb 045h,0cfh,05eh	; 6c48
	defb 00bh,0bfh,0aeh	; 6c4b
	defb 047h,0bdh,01eh	; 6c4e
	defb 00bh,0f5h,0eeh	; 6c51
	defb 04bh,0b5h,05eh	; 6c54
	defb 008h,0cbh,0aeh	; 6c57
	defb 04fh,0bah,05eh	; 6c5a
	defb 00bh,0feh,0aeh	; 6c5d
	defb 045h,0ddh,03eh	; 6c60
	defb 00ah,0aah,0aeh	; 6c63
	defb 047h,0f5h,0feh	; 6c66
	defb 008h,02ah,0aeh	; 6c69
	defb 05fh,0ffh,0feh	; 6c6c
	defb 03fh,0ffh,0feh	; 6c6f
	defb 07fh,0ffh,0feh	; 6c72
	defb 000h,000h,000h	; 6c75
	defb 000h,000h,000h	; 6c78
	defb 02ah,0aah,0aah	; 6c7b
	defb 070h,041h,086h	; 6c7e
	defb 018h,041h,00ah	; 6c81
	defb 05dh,077h,076h	; 6c84
	defb 00eh,0deh,0eeh	; 6c87
	defb 06bh,0d7h,06eh	; 6c8a
	defb 03bh,0b7h,04eh	; 6c8d
	defb 04dh,03ah,09eh	; 6c90
	defb 00eh,0ddh,0e2h	; 6c93
	defb 047h,062h,07ch	; 6c96
	defb 00fh,05dh,0aeh	; 6c99
	defb 07fh,07eh,0feh	; 6c9c
	defb 019h,096h,0eeh	; 6c9f
	defb 04eh,077h,0d6h	; 6ca2
	defb 00dh,0c9h,02ah	; 6ca5
	defb 05dh,0feh,0feh	; 6ca8
	defb 07fh,08eh,0eeh	; 6cab
	defb 097h,0f5h,076h	; 6cae
	defb 00ah,0bbh,0b6h	; 6cb1
	defb 057h,07eh,0fah	; 6cb4
	defb 03eh,0feh,0feh	; 6cb7
	defb 07fh,0ffh,0feh	; 6cba
	defb 000h,000h,000h	; 6cbd
	defb 000h,000h,000h	; 6cc0
	defb 02ah,0aah,0aah	; 6cc3
	defb 040h,000h,006h	; 6cc6
	defb 000h,000h,00eh	; 6cc9
	defb 04dh,05dh,056h	; 6ccc
	defb 00eh,0a2h,0eeh	; 6ccf
	defb 047h,0d5h,02eh	; 6cd2
	defb 00bh,05eh,0feh	; 6cd5
	defb 046h,0dbh,0deh	; 6cd8
	defb 00fh,03bh,0aeh	; 6cdb
	defb 046h,0c6h,05eh	; 6cde
	defb 00ah,0fbh,0eeh	; 6ce1
	defb 047h,039h,0c6h	; 6ce4
	defb 00eh,0fah,0feh	; 6ce7
	defb 047h,036h,0deh	; 6cea
	defb 00fh,0fdh,0beh	; 6ced
	defb 04dh,073h,0eeh	; 6cf0
	defb 01ah,0aeh,0ceh	; 6cf3
	defb 049h,0e5h,05eh	; 6cf6
	defb 00ah,0beh,0aeh	; 6cf9
	defb 05fh,0ffh,0feh	; 6cfc
	defb 03fh,0ffh,0feh	; 6cff
	defb 07fh,0ffh,0feh	; 6d02
	defb 000h,000h,000h	; 6d05
	defb 000h,000h,000h	; 6d08
	defb 02ah,0aah,0aah	; 6d0b
	defb 040h,000h,006h	; 6d0e
	defb 000h,000h,00eh	; 6d11
	defb 045h,055h,05eh	; 6d14
	defb 00ah,0eah,02eh	; 6d17
	defb 047h,045h,07eh	; 6d1a
	defb 00ah,0aah,0aeh	; 6d1d
	defb 046h,053h,05eh	; 6d20
	defb 00ah,0beh,0aeh	; 6d23
	defb 045h,0ebh,03eh	; 6d26
	defb 00ah,0ebh,0eeh	; 6d29
	defb 043h,065h,09eh	; 6d2c
	defb 00eh,0dfh,02eh	; 6d2f
	defb 045h,065h,01eh	; 6d32
	defb 00ah,0fah,06eh	; 6d35
	defb 045h,054h,0deh	; 6d38
	defb 00ah,019h,0aeh	; 6d3b
	defb 045h,0f5h,05eh	; 6d3e
	defb 00ah,0aah,0aeh	; 6d41
	defb 05fh,0ffh,0feh	; 6d44
	defb 03fh,0ffh,0feh	; 6d47
	defb 07fh,0ffh,0feh	; 6d4a
	defb 000h,000h,000h	; 6d4d
	defb 000h,000h,000h	; 6d50
	defb 02ah,0aah,0aah	; 6d53
	defb 040h,000h,006h	; 6d56
	defb 000h,000h,00eh	; 6d59
	defb 045h,055h,05eh	; 6d5c
	defb 00ah,0eah,02eh	; 6d5f
	defb 047h,045h,07eh	; 6d62
	defb 00ah,091h,0aeh	; 6d65
	defb 046h,018h,0deh	; 6d68
	defb 00ah,018h,06eh	; 6d6b
	defb 045h,0d8h,03eh	; 6d6e
	defb 00ah,0dbh,0aeh	; 6d71
	defb 043h,058h,01eh	; 6d74
	defb 00dh,0dbh,0aeh	; 6d77
	defb 044h,018h,01eh	; 6d7a
	defb 00ah,010h,06eh	; 6d7d
	defb 047h,000h,0deh	; 6d80
	defb 00bh,01bh,0aeh	; 6d83
	defb 045h,0f5h,03eh	; 6d86
	defb 00ah,0aah,0aeh	; 6d89
	defb 05fh,0ffh,0beh	; 6d8c
	defb 03fh,0ffh,0feh	; 6d8f
	defb 07fh,0ffh,0feh	; 6d92
	defb 000h,000h,000h	; 6d95
	defb 000h,000h,000h	; 6d98
	defb 02ah,0aah,0aah	; 6d9b
	defb 040h,000h,006h	; 6d9e
	defb 000h,000h,00eh	; 6da1
	defb 045h,055h,05eh	; 6da4
	defb 00ah,0eah,02eh	; 6da7
	defb 047h,045h,07eh	; 6daa
	defb 00ah,091h,0aeh	; 6dad
	defb 046h,000h,0deh	; 6db0
	defb 00ah,018h,06eh	; 6db3
	defb 045h,024h,03eh	; 6db6
	defb 00ah,04ah,0aeh	; 6db9
	defb 043h,05eh,01eh	; 6dbc
	defb 00dh,02ch,0aeh	; 6dbf
	defb 044h,018h,01eh	; 6dc2
	defb 00ah,000h,06eh	; 6dc5
	defb 047h,000h,0deh	; 6dc8
	defb 00bh,01bh,0aeh	; 6dcb
	defb 045h,0f5h,03eh	; 6dce
	defb 00ah,0aah,0aeh	; 6dd1
	defb 05fh,0ffh,0beh	; 6dd4
	defb 03fh,0ffh,0feh	; 6dd7
	defb 07fh,0ffh,0feh	; 6dda
	defb 000h,000h,000h	; 6ddd

; ----------------------------------------------------------------------
; DATOS tiles_de_los_niveles: Tiles de los niveles: 111 de 32x32, 128 bytes
;   cada uno
;   0x6de0..0xa560  (14208 bytes)
DATA_tiles_de_los_niveles:
	defb 000h,000h,000h,000h	; 6de0
	defb 000h,000h,000h,000h	; 6de4
	defb 000h,000h,000h,000h	; 6de8
	defb 000h,000h,000h,000h	; 6dec
	defb 000h,000h,000h,000h	; 6df0
	defb 000h,000h,000h,000h	; 6df4
	defb 000h,000h,000h,000h	; 6df8
	defb 000h,000h,000h,000h	; 6dfc
	defb 000h,000h,000h,000h	; 6e00
	defb 000h,000h,000h,000h	; 6e04
	defb 000h,000h,000h,000h	; 6e08
	defb 000h,000h,000h,000h	; 6e0c
	defb 000h,000h,000h,000h	; 6e10
	defb 000h,000h,000h,000h	; 6e14
	defb 000h,000h,000h,000h	; 6e18
	defb 000h,000h,000h,000h	; 6e1c
	defb 000h,000h,000h,000h	; 6e20
	defb 000h,000h,000h,000h	; 6e24
	defb 000h,000h,000h,000h	; 6e28
	defb 000h,000h,000h,000h	; 6e2c
	defb 000h,000h,000h,000h	; 6e30
	defb 000h,000h,000h,000h	; 6e34
	defb 000h,000h,000h,000h	; 6e38
	defb 000h,000h,000h,000h	; 6e3c
	defb 000h,000h,000h,000h	; 6e40
	defb 000h,000h,000h,000h	; 6e44
	defb 000h,000h,000h,000h	; 6e48
	defb 000h,000h,000h,000h	; 6e4c
	defb 000h,000h,000h,000h	; 6e50
	defb 000h,000h,000h,000h	; 6e54
	defb 000h,000h,000h,000h	; 6e58
	defb 000h,000h,000h,000h	; 6e5c
	defb 001h,045h,055h,0d5h	; 6e60
	defb 082h,08ah,0aah,0eah	; 6e64
	defb 001h,044h,005h,0d5h	; 6e68
	defb 082h,088h,00eh,0eah	; 6e6c
	defb 001h,044h,05dh,0d5h	; 6e70
	defb 082h,088h,0aeh,0eah	; 6e74
	defb 001h,044h,05dh,0d5h	; 6e78
	defb 082h,088h,0aeh,0eah	; 6e7c
	defb 001h,044h,05dh,0d5h	; 6e80
	defb 082h,088h,0aeh,0e2h	; 6e84
	defb 001h,044h,05dh,0c7h	; 6e88
	defb 082h,088h,0aeh,0eah	; 6e8c
	defb 001h,044h,05dh,0c7h	; 6e90
	defb 082h,088h,0aeh,0eah	; 6e94
	defb 001h,044h,05dh,0c7h	; 6e98
	defb 082h,088h,0aeh,0eah	; 6e9c
	defb 001h,044h,05dh,0c7h	; 6ea0
	defb 082h,088h,0aeh,0eah	; 6ea4
	defb 001h,044h,05dh,0c7h	; 6ea8
	defb 082h,088h,0aeh,0eah	; 6eac
	defb 001h,044h,05dh,0c7h	; 6eb0
	defb 082h,088h,0aeh,0eah	; 6eb4
	defb 001h,044h,05dh,0c7h	; 6eb8
	defb 082h,088h,0aeh,0feh	; 6ebc
	defb 001h,044h,05dh,0d5h	; 6ec0
	defb 082h,088h,0aeh,0eah	; 6ec4
	defb 001h,044h,05dh,0d5h	; 6ec8
	defb 082h,088h,0feh,0eah	; 6ecc
	defb 001h,045h,0fdh,0d5h	; 6ed0
	defb 082h,08ah,0aah,0eah	; 6ed4
	defb 001h,045h,055h,0d5h	; 6ed8
	defb 082h,08ah,0aah,0eah	; 6edc
	defb 055h,075h,0f5h,07fh	; 6ee0
	defb 0aah,0a2h,0eah,0beh	; 6ee4
	defb 055h,075h,0f5h,07fh	; 6ee8
	defb 0aah,0a2h,0eah,0beh	; 6eec
	defb 055h,075h,0f5h,07fh	; 6ef0
	defb 0aah,0a2h,0eah,0beh	; 6ef4
	defb 055h,075h,0f5h,07fh	; 6ef8
	defb 0aah,080h,00ah,0beh	; 6efc
	defb 057h,0ffh,0ffh,07fh	; 6f00
	defb 0aeh,00ah,0bfh,0beh	; 6f04
	defb 055h,041h,05fh,07fh	; 6f08
	defb 0aeh,00ah,0bfh,0beh	; 6f0c
	defb 055h,041h,05fh,07fh	; 6f10
	defb 0aeh,00ah,0bfh,0beh	; 6f14
	defb 055h,041h,05fh,07fh	; 6f18
	defb 0aeh,00ah,0bfh,0beh	; 6f1c
	defb 057h,0ffh,0ffh,07fh	; 6f20
	defb 0aah,080h,00ah,0beh	; 6f24
	defb 055h,075h,0f5h,07fh	; 6f28
	defb 0aah,0a2h,0eah,0beh	; 6f2c
	defb 055h,075h,0f5h,07fh	; 6f30
	defb 0aah,0a2h,0eah,0beh	; 6f34
	defb 055h,075h,0f5h,07fh	; 6f38
	defb 0aah,0a2h,0eah,0beh	; 6f3c
	defb 055h,075h,0f5h,07fh	; 6f40
	defb 0aah,0a2h,0eah,0beh	; 6f44
	defb 055h,075h,0f5h,07fh	; 6f48
	defb 0aah,0a2h,0eah,0beh	; 6f4c
	defb 055h,075h,0f5h,07fh	; 6f50
	defb 0aah,0a2h,0eah,0beh	; 6f54
	defb 055h,075h,0f5h,07fh	; 6f58
	defb 0aah,0a2h,0eah,0beh	; 6f5c
	defb 055h,055h,055h,055h	; 6f60
	defb 000h,000h,000h,000h	; 6f64
	defb 000h,000h,000h,000h	; 6f68
	defb 000h,000h,000h,000h	; 6f6c
	defb 000h,000h,000h,000h	; 6f70
	defb 000h,000h,000h,000h	; 6f74
	defb 055h,055h,055h,055h	; 6f78
	defb 0aah,0aah,0aah,0aah	; 6f7c
	defb 0fdh,055h,055h,07fh	; 6f80
	defb 023h,0aah,0aah,0c8h	; 6f84
	defb 075h,0d0h,015h,01dh	; 6f88
	defb 0abh,0a0h,02ah,02ah	; 6f8c
	defb 0f1h,0d1h,076h,05fh	; 6f90
	defb 0fah,0e2h,0ech,0bfh	; 6f94
	defb 05fh,0d1h,077h,0f5h	; 6f98
	defb 0aah,0e2h,0ech,0eah	; 6f9c
	defb 059h,0d1h,075h,075h	; 6fa0
	defb 0aah,0e2h,0ech,0eah	; 6fa4
	defb 059h,0d7h,0f5h,075h	; 6fa8
	defb 0aah,0efh,0ech,0eah	; 6fac
	defb 05fh,0d5h,057h,0f5h	; 6fb0
	defb 0aah,0eah,0ach,0eah	; 6fb4
	defb 059h,07fh,0f9h,0f5h	; 6fb8
	defb 0aah,090h,012h,0eah	; 6fbc
	defb 055h,055h,055h,0d5h	; 6fc0
	defb 0afh,0bah,0bfh,0eah	; 6fc4
	defb 057h,0ffh,0ffh,0d5h	; 6fc8
	defb 0aah,0ffh,0feh,0aah	; 6fcc
	defb 055h,055h,055h,055h	; 6fd0
	defb 0aah,0aah,0aah,0aah	; 6fd4
	defb 055h,055h,055h,055h	; 6fd8
	defb 0aah,0aah,0aah,0aah	; 6fdc
	defb 055h,055h,055h,055h	; 6fe0
	defb 0aah,000h,001h,0aah	; 6fe4
	defb 054h,000h,003h,055h	; 6fe8
	defb 0aah,02ah,0abh,0aah	; 6fec
	defb 054h,055h,057h,055h	; 6ff0
	defb 0aah,02ah,0abh,0aah	; 6ff4
	defb 055h,015h,057h,055h	; 6ff8
	defb 006h,08ah,0aeh,080h	; 6ffc
	defb 007h,045h,05dh,000h	; 7000
	defb 0abh,0a2h,0bah,02ah	; 7004
	defb 055h,0d1h,074h,055h	; 7008
	defb 0aah,0e9h,0e8h,0aah	; 700c
	defb 033h,075h,051h,033h	; 7010
	defb 0aah,0bah,0a2h,0aah	; 7014
	defb 033h,05dh,045h,033h	; 7018
	defb 0aah,0a8h,00ah,0aah	; 701c
	defb 033h,030h,013h,033h	; 7020
	defb 0aah,0aah,0aah,0aah	; 7024
	defb 033h,035h,053h,033h	; 7028
	defb 0aah,0aah,0aah,0aah	; 702c
	defb 055h,055h,055h,055h	; 7030
	defb 0ffh,0ffh,0ffh,0ffh	; 7034
	defb 0ffh,0ffh,0ffh,0ffh	; 7038
	defb 0aah,0aah,0aah,0aah	; 703c
	defb 055h,055h,055h,055h	; 7040
	defb 0aah,0aah,0aah,0aah	; 7044
	defb 0ffh,0ffh,0ffh,0ffh	; 7048
	defb 0ffh,0ffh,0ffh,0ffh	; 704c
	defb 0ffh,0ffh,0ffh,0ffh	; 7050
	defb 0ffh,0ffh,0ffh,0ffh	; 7054
	defb 0ffh,0ffh,0ffh,0ffh	; 7058
	defb 0aah,0aah,0aah,0aah	; 705c
	defb 055h,075h,0f5h,07fh	; 7060
	defb 0aah,0a2h,0eah,0feh	; 7064
	defb 055h,05fh,0d5h,0fch	; 7068
	defb 0aah,0afh,0abh,0f8h	; 706c
	defb 055h,055h,057h,0f0h	; 7070
	defb 0aah,0aah,0afh,0e0h	; 7074
	defb 055h,055h,05fh,0c0h	; 7078
	defb 000h,0aah,0bfh,080h	; 707c
	defb 001h,0d5h,07fh,000h	; 7080
	defb 0abh,0aah,0feh,000h	; 7084
	defb 055h,0d5h,0fch,000h	; 7088
	defb 0abh,0abh,0f8h,000h	; 708c
	defb 035h,0d7h,0f0h,000h	; 7090
	defb 0abh,0afh,0e0h,000h	; 7094
	defb 037h,05fh,0c0h,000h	; 7098
	defb 0aeh,0bfh,080h,000h	; 709c
	defb 05dh,07fh,000h,000h	; 70a0
	defb 0bah,0feh,000h,000h	; 70a4
	defb 075h,0fch,000h,000h	; 70a8
	defb 0ebh,0f8h,000h,000h	; 70ac
	defb 0d7h,0f0h,000h,000h	; 70b0
	defb 0afh,0e0h,000h,000h	; 70b4
	defb 05fh,0c0h,000h,000h	; 70b8
	defb 0bfh,080h,000h,000h	; 70bc
	defb 07fh,000h,000h,000h	; 70c0
	defb 0feh,000h,000h,000h	; 70c4
	defb 0fch,000h,000h,000h	; 70c8
	defb 0f8h,000h,000h,000h	; 70cc
	defb 0f0h,000h,000h,000h	; 70d0
	defb 0e0h,000h,000h,000h	; 70d4
	defb 0c0h,000h,000h,000h	; 70d8
	defb 080h,000h,000h,000h	; 70dc
	defb 041h,045h,055h,0d5h	; 70e0
	defb 020h,08fh,0ffh,0eah	; 70e4
	defb 010h,05fh,0ffh,0d5h	; 70e8
	defb 008h,02ah,0aah,0aah	; 70ec
	defb 004h,015h,055h,055h	; 70f0
	defb 002h,00ah,0aah,0aah	; 70f4
	defb 001h,005h,055h,055h	; 70f8
	defb 000h,082h,0a8h,000h	; 70fc
	defb 000h,041h,054h,000h	; 7100
	defb 000h,020h,0a8h,0aah	; 7104
	defb 000h,010h,054h,055h	; 7108
	defb 000h,008h,028h,0aah	; 710c
	defb 000h,004h,014h,053h	; 7110
	defb 000h,002h,00ah,02ah	; 7114
	defb 000h,001h,005h,013h	; 7118
	defb 000h,000h,082h,08ah	; 711c
	defb 000h,000h,041h,045h	; 7120
	defb 000h,000h,020h,0a2h	; 7124
	defb 000h,000h,010h,051h	; 7128
	defb 000h,000h,008h,028h	; 712c
	defb 000h,000h,004h,014h	; 7130
	defb 000h,000h,002h,00ah	; 7134
	defb 000h,000h,001h,005h	; 7138
	defb 000h,000h,000h,082h	; 713c
	defb 000h,000h,000h,041h	; 7140
	defb 000h,000h,000h,020h	; 7144
	defb 000h,000h,000h,010h	; 7148
	defb 000h,000h,000h,008h	; 714c
	defb 000h,000h,000h,004h	; 7150
	defb 000h,000h,000h,002h	; 7154
	defb 000h,000h,000h,001h	; 7158
	defb 000h,000h,000h,000h	; 715c
	defb 055h,055h,055h,055h	; 7160
	defb 0aah,0aah,0aah,0aah	; 7164
	defb 055h,055h,055h,055h	; 7168
	defb 0bfh,0ffh,0ffh,0fah	; 716c
	defb 05fh,0ffh,0ffh,0f5h	; 7170
	defb 0bfh,0ffh,0ffh,0e2h	; 7174
	defb 05ch,000h,000h,005h	; 7178
	defb 0bch,0aah,0aah,082h	; 717c
	defb 05dh,000h,000h,005h	; 7180
	defb 0bch,000h,000h,082h	; 7184
	defb 05dh,000h,000h,005h	; 7188
	defb 0bch,000h,000h,082h	; 718c
	defb 05dh,000h,000h,005h	; 7190
	defb 0bch,000h,000h,082h	; 7194
	defb 05dh,000h,000h,005h	; 7198
	defb 0bch,000h,000h,082h	; 719c
	defb 05dh,000h,000h,005h	; 71a0
	defb 0bch,000h,000h,082h	; 71a4
	defb 05dh,000h,000h,005h	; 71a8
	defb 0bch,000h,000h,082h	; 71ac
	defb 05dh,000h,000h,005h	; 71b0
	defb 0bch,000h,000h,082h	; 71b4
	defb 05dh,000h,000h,005h	; 71b8
	defb 0bch,000h,000h,082h	; 71bc
	defb 05dh,055h,055h,005h	; 71c0
	defb 0bch,000h,000h,002h	; 71c4
	defb 05ch,000h,000h,005h	; 71c8
	defb 0b8h,000h,000h,002h	; 71cc
	defb 050h,000h,000h,005h	; 71d0
	defb 0aah,0aah,0aah,0aah	; 71d4
	defb 055h,055h,055h,055h	; 71d8
	defb 0aah,0aah,0aah,0aah	; 71dc
	defb 000h,000h,000h,001h	; 71e0
	defb 000h,000h,000h,002h	; 71e4
	defb 000h,000h,000h,004h	; 71e8
	defb 000h,000h,000h,008h	; 71ec
	defb 000h,000h,000h,010h	; 71f0
	defb 000h,000h,000h,020h	; 71f4
	defb 000h,000h,000h,040h	; 71f8
	defb 000h,000h,000h,080h	; 71fc
	defb 000h,000h,001h,001h	; 7200
	defb 000h,000h,002h,003h	; 7204
	defb 000h,000h,004h,007h	; 7208
	defb 000h,000h,008h,00ah	; 720c
	defb 000h,000h,010h,017h	; 7210
	defb 000h,000h,020h,02bh	; 7214
	defb 000h,000h,040h,055h	; 7218
	defb 000h,000h,080h,06ah	; 721c
	defb 000h,001h,000h,0d5h	; 7220
	defb 000h,002h,000h,0eah	; 7224
	defb 000h,004h,001h,0d5h	; 7228
	defb 000h,008h,002h,0eah	; 722c
	defb 000h,010h,005h,0d5h	; 7230
	defb 000h,020h,00ah,0eah	; 7234
	defb 000h,040h,013h,0d5h	; 7238
	defb 000h,080h,026h,0eah	; 723c
	defb 001h,000h,047h,0d5h	; 7240
	defb 002h,000h,08eh,0eah	; 7244
	defb 004h,001h,017h,0d5h	; 7248
	defb 008h,002h,02eh,0eah	; 724c
	defb 010h,004h,057h,0d5h	; 7250
	defb 020h,008h,0feh,0eah	; 7254
	defb 040h,045h,0ffh,0d5h	; 7258
	defb 080h,08ah,0aah,0eah	; 725c
	defb 000h,000h,000h,000h	; 7260
	defb 080h,000h,000h,000h	; 7264
	defb 0c0h,000h,000h,000h	; 7268
	defb 0e0h,000h,000h,000h	; 726c
	defb 0f0h,000h,000h,000h	; 7270
	defb 0f8h,000h,000h,000h	; 7274
	defb 0fch,000h,000h,000h	; 7278
	defb 0feh,000h,000h,000h	; 727c
	defb 0ffh,000h,000h,000h	; 7280
	defb 0ffh,080h,000h,000h	; 7284
	defb 05fh,0c0h,000h,000h	; 7288
	defb 0efh,0e0h,000h,000h	; 728c
	defb 0d7h,0f0h,000h,000h	; 7290
	defb 0abh,0f8h,000h,000h	; 7294
	defb 055h,0fch,000h,000h	; 7298
	defb 0aah,0feh,000h,000h	; 729c
	defb 043h,07fh,000h,000h	; 72a0
	defb 08bh,0bfh,080h,000h	; 72a4
	defb 015h,0dfh,0c0h,000h	; 72a8
	defb 0aah,0afh,0e0h,000h	; 72ac
	defb 015h,0d7h,0f0h,000h	; 72b0
	defb 0aah,0abh,0f8h,000h	; 72b4
	defb 015h,0d5h,0fch,000h	; 72b8
	defb 08bh,0aah,0feh,000h	; 72bc
	defb 04fh,055h,07fh,000h	; 72c0
	defb 0aah,0aah,0bfh,080h	; 72c4
	defb 055h,055h,05fh,0c0h	; 72c8
	defb 0aah,0afh,0afh,0e0h	; 72cc
	defb 055h,051h,0d7h,0f0h	; 72d0
	defb 0aah,0a2h,0ebh,0f8h	; 72d4
	defb 055h,075h,0f5h,0fch	; 72d8
	defb 0aah,0a2h,0eah,0feh	; 72dc
	defb 080h,000h,000h,000h	; 72e0
	defb 040h,000h,000h,000h	; 72e4
	defb 0a8h,000h,000h,000h	; 72e8
	defb 057h,000h,000h,000h	; 72ec
	defb 0fch,0deh,01ch,000h	; 72f0
	defb 040h,02fh,0eeh,000h	; 72f4
	defb 0e0h,0d0h,032h,000h	; 72f8
	defb 023h,080h,020h,000h	; 72fc
	defb 0deh,000h,018h,000h	; 7300
	defb 058h,000h,000h,000h	; 7304
	defb 0d0h,000h,000h,000h	; 7308
	defb 0d0h,000h,000h,000h	; 730c
	defb 050h,000h,000h,000h	; 7310
	defb 0d0h,000h,002h,000h	; 7314
	defb 050h,010h,003h,000h	; 7318
	defb 0d0h,0e8h,019h,000h	; 731c
	defb 053h,0cch,031h,080h	; 7320
	defb 0d7h,02eh,061h,080h	; 7324
	defb 058h,0e6h,061h,080h	; 7328
	defb 0d3h,0e9h,060h,000h	; 732c
	defb 04bh,0edh,063h,0c0h	; 7330
	defb 0d4h,0edh,036h,080h	; 7334
	defb 049h,06bh,039h,080h	; 7338
	defb 0d5h,06bh,02bh,000h	; 733c
	defb 049h,0abh,02ch,000h	; 7340
	defb 0d6h,0a6h,048h,000h	; 7344
	defb 04bh,066h,058h,000h	; 7348
	defb 0d5h,06ch,0f0h,000h	; 734c
	defb 049h,09bh,060h,000h	; 7350
	defb 0d5h,09bh,000h,000h	; 7354
	defb 049h,034h,000h,000h	; 7358
	defb 0d4h,0ebh,000h,000h	; 735c
	defb 049h,0d7h,000h,000h	; 7360
	defb 0c7h,0b7h,000h,000h	; 7364
	defb 04fh,057h,000h,000h	; 7368
	defb 0dfh,057h,000h,000h	; 736c
	defb 04eh,0aeh,000h,000h	; 7370
	defb 0ddh,02eh,000h,000h	; 7374
	defb 04dh,06eh,000h,000h	; 7378
	defb 0ddh,05eh,000h,000h	; 737c
	defb 04ah,05ch,000h,000h	; 7380
	defb 0dah,0dch,000h,000h	; 7384
	defb 04ah,03ch,000h,000h	; 7388
	defb 0d0h,0b8h,000h,000h	; 738c
	defb 04fh,0d8h,000h,000h	; 7390
	defb 0d7h,0d0h,000h,000h	; 7394
	defb 04fh,0d0h,000h,000h	; 7398
	defb 0d0h,000h,000h,000h	; 739c
	defb 047h,0c0h,000h,000h	; 73a0
	defb 0d7h,000h,000h,000h	; 73a4
	defb 048h,080h,000h,000h	; 73a8
	defb 0d1h,0c0h,000h,000h	; 73ac
	defb 04ah,0e0h,000h,000h	; 73b0
	defb 0d1h,070h,000h,000h	; 73b4
	defb 042h,098h,000h,000h	; 73b8
	defb 0d1h,02ch,000h,000h	; 73bc
	defb 021h,054h,000h,000h	; 73c0
	defb 0e1h,074h,000h,000h	; 73c4
	defb 001h,074h,000h,000h	; 73c8
	defb 001h,0b4h,000h,000h	; 73cc
	defb 000h,0c8h,000h,000h	; 73d0
	defb 000h,078h,000h,000h	; 73d4
	defb 000h,020h,000h,000h	; 73d8
	defb 000h,000h,000h,000h	; 73dc
	defb 000h,000h,000h,001h	; 73e0
	defb 000h,000h,000h,003h	; 73e4
	defb 000h,000h,000h,007h	; 73e8
	defb 000h,000h,000h,00bh	; 73ec
	defb 000h,000h,000h,03fh	; 73f0
	defb 000h,000h,000h,050h	; 73f4
	defb 000h,000h,000h,067h	; 73f8
	defb 000h,000h,000h,084h	; 73fc
	defb 000h,000h,000h,089h	; 7400
	defb 000h,000h,001h,08ah	; 7404
	defb 000h,000h,001h,091h	; 7408
	defb 000h,000h,000h,012h	; 740c
	defb 000h,000h,000h,029h	; 7410
	defb 000h,000h,000h,02ah	; 7414
	defb 000h,000h,000h,059h	; 7418
	defb 000h,000h,000h,05ah	; 741c
	defb 000h,000h,000h,0a9h	; 7420
	defb 000h,000h,000h,0abh	; 7424
	defb 000h,000h,001h,071h	; 7428
	defb 000h,000h,001h,07bh	; 742c
	defb 000h,000h,002h,0f9h	; 7430
	defb 000h,000h,002h,0f3h	; 7434
	defb 000h,000h,005h,0e9h	; 7438
	defb 000h,000h,009h,0d2h	; 743c
	defb 000h,000h,012h,0a9h	; 7440
	defb 000h,000h,032h,05bh	; 7444
	defb 000h,000h,02ah,0bbh	; 7448
	defb 000h,000h,029h,07bh	; 744c
	defb 000h,000h,05ah,0e3h	; 7450
	defb 000h,000h,0a9h,05bh	; 7454
	defb 000h,000h,0cbh,031h	; 7458
	defb 000h,000h,0abh,02bh	; 745c
	defb 000h,000h,0abh,02bh	; 7460
	defb 000h,000h,0cbh,033h	; 7464
	defb 000h,000h,0a9h,05bh	; 7468
	defb 000h,000h,05ah,0e3h	; 746c
	defb 000h,000h,029h,07bh	; 7470
	defb 000h,000h,02ah,0b9h	; 7474
	defb 000h,000h,032h,05bh	; 7478
	defb 000h,000h,012h,0abh	; 747c
	defb 000h,000h,009h,093h	; 7480
	defb 000h,000h,005h,0abh	; 7484
	defb 000h,000h,002h,0d3h	; 7488
	defb 000h,000h,002h,0ebh	; 748c
	defb 000h,000h,001h,073h	; 7490
	defb 000h,000h,001h,07bh	; 7494
	defb 000h,000h,000h,0b3h	; 7498
	defb 000h,000h,000h,08bh	; 749c
	defb 000h,000h,000h,05bh	; 74a0
	defb 000h,000h,000h,05bh	; 74a4
	defb 000h,000h,000h,02bh	; 74a8
	defb 000h,000h,000h,02bh	; 74ac
	defb 000h,000h,000h,013h	; 74b0
	defb 000h,000h,000h,013h	; 74b4
	defb 000h,000h,000h,00bh	; 74b8
	defb 000h,000h,000h,00bh	; 74bc
	defb 000h,000h,004h,044h	; 74c0
	defb 000h,000h,002h,0c7h	; 74c4
	defb 000h,000h,001h,0c0h	; 74c8
	defb 000h,000h,003h,081h	; 74cc
	defb 000h,000h,007h,073h	; 74d0
	defb 000h,000h,000h,02fh	; 74d4
	defb 000h,000h,000h,013h	; 74d8
	defb 000h,000h,000h,001h	; 74dc
	defb 055h,055h,055h,055h	; 74e0
	defb 080h,000h,000h,000h	; 74e4
	defb 000h,000h,000h,000h	; 74e8
	defb 080h,000h,000h,000h	; 74ec
	defb 000h,000h,000h,000h	; 74f0
	defb 080h,000h,000h,000h	; 74f4
	defb 001h,055h,055h,055h	; 74f8
	defb 082h,0aah,0aah,0aah	; 74fc
	defb 001h,055h,055h,05fh	; 7500
	defb 082h,080h,02ah,0b8h	; 7504
	defb 001h,040h,075h,071h	; 7508
	defb 082h,08ah,0eah,0e2h	; 750c
	defb 001h,045h,075h,07fh	; 7510
	defb 082h,08ah,0eah,0cfh	; 7514
	defb 001h,045h,075h,057h	; 7518
	defb 082h,08ah,0cah,08eh	; 751c
	defb 001h,045h,09fh,017h	; 7520
	defb 082h,08ah,02ah,02eh	; 7524
	defb 001h,045h,057h,05dh	; 7528
	defb 082h,08ah,06ah,0bah	; 752c
	defb 001h,045h,03fh,0f5h	; 7530
	defb 082h,08ah,09fh,0eah	; 7534
	defb 001h,045h,055h,055h	; 7538
	defb 082h,08ah,0eah,0aah	; 753c
	defb 001h,045h,075h,055h	; 7540
	defb 082h,08ah,0eah,0aah	; 7544
	defb 001h,045h,075h,055h	; 7548
	defb 082h,08ah,0eah,0aah	; 754c
	defb 001h,045h,040h,055h	; 7550
	defb 082h,08ah,080h,0eah	; 7554
	defb 001h,045h,055h,0d5h	; 7558
	defb 082h,08ah,0aah,0eah	; 755c
	defb 055h,055h,055h,055h	; 7560
	defb 000h,000h,000h,002h	; 7564
	defb 000h,000h,000h,007h	; 7568
	defb 000h,000h,000h,00eh	; 756c
	defb 000h,000h,000h,01fh	; 7570
	defb 000h,000h,000h,03eh	; 7574
	defb 055h,055h,055h,07fh	; 7578
	defb 0aah,0aah,0aah,0beh	; 757c
	defb 0ffh,0f5h,055h,07fh	; 7580
	defb 020h,08eh,0aah,0beh	; 7584
	defb 075h,0c7h,055h,07fh	; 7588
	defb 0aah,0abh,0aah,0beh	; 758c
	defb 0ffh,0c7h,0d5h,07fh	; 7590
	defb 0ffh,0ebh,0aah,0beh	; 7594
	defb 055h,047h,0d5h,07fh	; 7598
	defb 0aah,0b3h,0eah,0beh	; 759c
	defb 055h,05fh,0d5h,07fh	; 75a0
	defb 0aah,0b3h,0eah,0beh	; 75a4
	defb 055h,059h,0d5h,07fh	; 75a8
	defb 0aah,0b3h,0eah,0beh	; 75ac
	defb 055h,07fh,0d5h,07fh	; 75b0
	defb 0aah,0a3h,0eah,0beh	; 75b4
	defb 055h,075h,0f5h,07fh	; 75b8
	defb 0aah,0a2h,0eah,0beh	; 75bc
	defb 055h,075h,0f5h,07fh	; 75c0
	defb 0aah,0a2h,0eah,0beh	; 75c4
	defb 055h,075h,0f5h,07fh	; 75c8
	defb 0aah,0a2h,0eah,0beh	; 75cc
	defb 055h,075h,0f5h,07fh	; 75d0
	defb 0aah,0a2h,0eah,0beh	; 75d4
	defb 055h,075h,0f5h,07fh	; 75d8
	defb 0aah,0a2h,0eah,0beh	; 75dc
	defb 001h,045h,055h,0d5h	; 75e0
	defb 082h,08ah,0aah,0eah	; 75e4
	defb 001h,045h,055h,0d5h	; 75e8
	defb 082h,08eh,0bfh,0aah	; 75ec
	defb 001h,05dh,07fh,055h	; 75f0
	defb 082h,0a8h,0eah,0aah	; 75f4
	defb 001h,051h,0d5h,055h	; 75f8
	defb 082h,0a8h,0e8h,000h	; 75fc
	defb 001h,051h,0d0h,000h	; 7600
	defb 082h,0a8h,0e2h,0aah	; 7604
	defb 001h,051h,0c5h,055h	; 7608
	defb 082h,0a8h,0e2h,0aah	; 760c
	defb 001h,051h,0c5h,033h	; 7610
	defb 082h,0a8h,08ah,0aah	; 7614
	defb 001h,051h,055h,033h	; 7618
	defb 082h,0a8h,0aah,0aah	; 761c
	defb 001h,051h,0f5h,033h	; 7620
	defb 082h,0abh,0e2h,0aah	; 7624
	defb 001h,055h,045h,033h	; 7628
	defb 082h,0aah,0a2h,0aah	; 762c
	defb 001h,055h,045h,055h	; 7630
	defb 082h,0aah,0afh,0ffh	; 7634
	defb 001h,055h,05fh,0ffh	; 7638
	defb 082h,0aah,0aah,0aah	; 763c
	defb 001h,055h,055h,055h	; 7640
	defb 082h,0aah,0aah,0aah	; 7644
	defb 003h,0ffh,0ffh,0ffh	; 7648
	defb 087h,0ffh,0ffh,0ffh	; 764c
	defb 00fh,0ffh,0ffh,0ffh	; 7650
	defb 09fh,0ffh,0ffh,0ffh	; 7654
	defb 03fh,0ffh,0ffh,0ffh	; 7658
	defb 0aah,0aah,0aah,0aah	; 765c
	defb 055h,075h,0f5h,07fh	; 7660
	defb 0aah,0a2h,0eah,0beh	; 7664
	defb 055h,055h,0d5h,07fh	; 7668
	defb 0a8h,00fh,082h,0beh	; 766c
	defb 050h,000h,007h,07fh	; 7670
	defb 0a2h,0aah,0aeh,0beh	; 7674
	defb 045h,055h,057h,07fh	; 7678
	defb 00ah,0aah,0aeh,0beh	; 767c
	defb 013h,033h,037h,07fh	; 7680
	defb 0aah,0aah,0aeh,0beh	; 7684
	defb 053h,033h,037h,07fh	; 7688
	defb 0aah,0aah,0aeh,0beh	; 768c
	defb 033h,033h,037h,07fh	; 7690
	defb 0aah,0aah,0aeh,0beh	; 7694
	defb 033h,033h,037h,07fh	; 7698
	defb 0aah,0aah,0aeh,0beh	; 769c
	defb 033h,033h,037h,07fh	; 76a0
	defb 0aah,0aah,0aeh,0beh	; 76a4
	defb 033h,033h,037h,07fh	; 76a8
	defb 0aah,0aah,0aeh,0beh	; 76ac
	defb 055h,055h,05dh,07fh	; 76b0
	defb 0ffh,0ffh,0fah,0beh	; 76b4
	defb 0ffh,0ffh,0f5h,07fh	; 76b8
	defb 0aah,0aah,0aah,0beh	; 76bc
	defb 055h,055h,055h,07fh	; 76c0
	defb 0aah,0aah,0aah,0beh	; 76c4
	defb 0ffh,0ffh,0ffh,0ffh	; 76c8
	defb 0ffh,0ffh,0ffh,0feh	; 76cc
	defb 0ffh,0ffh,0ffh,0ffh	; 76d0
	defb 0ffh,0ffh,0ffh,0feh	; 76d4
	defb 0ffh,0ffh,0ffh,0ffh	; 76d8
	defb 0aah,0aah,0aah,0aah	; 76dc
	defb 055h,055h,055h,055h	; 76e0
	defb 080h,000h,000h,002h	; 76e4
	defb 000h,000h,000h,005h	; 76e8
	defb 08ah,0aah,0aah,0aeh	; 76ec
	defb 010h,000h,000h,01dh	; 76f0
	defb 087h,0ffh,0ffh,0ceh	; 76f4
	defb 014h,000h,000h,05dh	; 76f8
	defb 084h,000h,0a0h,04eh	; 76fc
	defb 014h,00ah,000h,05dh	; 7700
	defb 084h,0a0h,000h,04eh	; 7704
	defb 014h,000h,0a0h,05dh	; 7708
	defb 084h,00ah,000h,04eh	; 770c
	defb 014h,0a0h,000h,05dh	; 7710
	defb 084h,000h,000h,04eh	; 7714
	defb 014h,000h,000h,05dh	; 7718
	defb 084h,000h,005h,04eh	; 771c
	defb 014h,000h,050h,05dh	; 7720
	defb 084h,005h,000h,04eh	; 7724
	defb 014h,050h,005h,05dh	; 7728
	defb 084h,000h,050h,04eh	; 772c
	defb 014h,005h,000h,05dh	; 7730
	defb 084h,050h,000h,04eh	; 7734
	defb 014h,000h,000h,05dh	; 7738
	defb 084h,000h,000h,04eh	; 773c
	defb 014h,000h,000h,05dh	; 7740
	defb 084h,000h,000h,04eh	; 7744
	defb 017h,0ffh,0ffh,0ddh	; 7748
	defb 080h,000h,000h,00eh	; 774c
	defb 015h,055h,055h,05dh	; 7750
	defb 0bfh,0ffh,0ffh,0feh	; 7754
	defb 07fh,0ffh,0ffh,0fdh	; 7758
	defb 0aah,0aah,0aah,0aah	; 775c
	defb 055h,055h,055h,055h	; 7760
	defb 080h,000h,000h,002h	; 7764
	defb 000h,000h,000h,005h	; 7768
	defb 080h,000h,000h,00eh	; 776c
	defb 005h,055h,055h,05dh	; 7770
	defb 08fh,0fah,0ffh,0beh	; 7774
	defb 007h,0f1h,07fh,01dh	; 7778
	defb 08eh,0a2h,0eah,03eh	; 777c
	defb 007h,051h,075h,01dh	; 7780
	defb 08eh,0a2h,0eah,03eh	; 7784
	defb 007h,051h,075h,01dh	; 7788
	defb 08eh,0a2h,0eah,03eh	; 778c
	defb 004h,001h,040h,01dh	; 7790
	defb 088h,002h,080h,03eh	; 7794
	defb 005h,055h,055h,05dh	; 7798
	defb 08ah,0aah,0aah,0beh	; 779c
	defb 005h,055h,055h,05dh	; 77a0
	defb 08fh,0fah,0ffh,0beh	; 77a4
	defb 007h,0f1h,07fh,01dh	; 77a8
	defb 08eh,0a2h,0eah,03eh	; 77ac
	defb 007h,051h,075h,01dh	; 77b0
	defb 08eh,0a2h,0eah,03eh	; 77b4
	defb 007h,051h,075h,01dh	; 77b8
	defb 08eh,0a2h,0eah,03eh	; 77bc
	defb 004h,001h,040h,01dh	; 77c0
	defb 088h,002h,080h,03eh	; 77c4
	defb 005h,055h,055h,05dh	; 77c8
	defb 08ah,0aah,0aah,0beh	; 77cc
	defb 01fh,0ffh,0ffh,0fdh	; 77d0
	defb 0bfh,0ffh,0ffh,0feh	; 77d4
	defb 07fh,0ffh,0ffh,0fdh	; 77d8
	defb 0aah,0aah,0aah,0aah	; 77dc
	defb 000h,0c0h,05dh,000h	; 77e0
	defb 000h,0a2h,0bfh,000h	; 77e4
	defb 000h,0c0h,05dh,000h	; 77e8
	defb 000h,0a2h,0bfh,000h	; 77ec
	defb 000h,0c0h,05dh,000h	; 77f0
	defb 000h,0a2h,0bfh,000h	; 77f4
	defb 000h,0c0h,05dh,000h	; 77f8
	defb 000h,0a2h,0bfh,000h	; 77fc
	defb 000h,0c0h,05dh,000h	; 7800
	defb 000h,0a2h,0bfh,000h	; 7804
	defb 000h,0c0h,05dh,000h	; 7808
	defb 000h,0a2h,0bfh,000h	; 780c
	defb 000h,0c0h,05dh,000h	; 7810
	defb 000h,0a2h,0bfh,000h	; 7814
	defb 000h,0c0h,05dh,000h	; 7818
	defb 000h,0a2h,0bfh,000h	; 781c
	defb 000h,0c0h,05dh,000h	; 7820
	defb 000h,0a2h,0bfh,000h	; 7824
	defb 000h,0c0h,05dh,000h	; 7828
	defb 000h,0a2h,0bfh,000h	; 782c
	defb 000h,0c0h,05dh,000h	; 7830
	defb 000h,0a2h,0bfh,000h	; 7834
	defb 000h,0c0h,05dh,000h	; 7838
	defb 000h,0a2h,0bfh,000h	; 783c
	defb 000h,0c0h,05dh,000h	; 7840
	defb 000h,0a2h,0bfh,000h	; 7844
	defb 000h,0c0h,05dh,000h	; 7848
	defb 000h,0a2h,0bfh,000h	; 784c
	defb 000h,0c0h,05dh,000h	; 7850
	defb 000h,0a2h,0bfh,000h	; 7854
	defb 000h,0c0h,05dh,000h	; 7858
	defb 000h,0a2h,0bfh,000h	; 785c
	defb 000h,0ffh,0ffh,000h	; 7860
	defb 000h,0c0h,007h,000h	; 7864
	defb 000h,0c4h,00fh,000h	; 7868
	defb 000h,0c8h,01bh,000h	; 786c
	defb 000h,0d0h,033h,000h	; 7870
	defb 000h,0e0h,063h,000h	; 7874
	defb 000h,0c0h,0c3h,000h	; 7878
	defb 000h,0d5h,0abh,000h	; 787c
	defb 000h,0ebh,057h,000h	; 7880
	defb 000h,0c6h,003h,000h	; 7884
	defb 000h,0cch,007h,000h	; 7888
	defb 000h,0d8h,00bh,000h	; 788c
	defb 000h,0f0h,013h,000h	; 7890
	defb 000h,0e0h,003h,000h	; 7894
	defb 000h,0ffh,0ffh,000h	; 7898
	defb 000h,0eah,0abh,000h	; 789c
	defb 000h,0ffh,0ffh,000h	; 78a0
	defb 000h,0c0h,007h,000h	; 78a4
	defb 000h,0c4h,00fh,000h	; 78a8
	defb 000h,0c8h,01bh,000h	; 78ac
	defb 000h,0d0h,033h,000h	; 78b0
	defb 000h,0e0h,063h,000h	; 78b4
	defb 000h,0c0h,0c3h,000h	; 78b8
	defb 000h,0d5h,0abh,000h	; 78bc
	defb 000h,0ebh,057h,000h	; 78c0
	defb 000h,0c6h,003h,000h	; 78c4
	defb 000h,0cch,007h,000h	; 78c8
	defb 000h,0d8h,00bh,000h	; 78cc
	defb 000h,0f0h,013h,000h	; 78d0
	defb 000h,0e0h,003h,000h	; 78d4
	defb 000h,0ffh,0ffh,000h	; 78d8
	defb 000h,0eah,0abh,000h	; 78dc
	defb 000h,055h,055h,000h	; 78e0
	defb 001h,000h,000h,080h	; 78e4
	defb 000h,000h,000h,0c0h	; 78e8
	defb 004h,000h,001h,0e0h	; 78ec
	defb 000h,03fh,0ffh,0f0h	; 78f0
	defb 010h,07fh,0fch,0f8h	; 78f4
	defb 000h,0d5h,054h,07ch	; 78f8
	defb 041h,0a6h,09ah,03eh	; 78fc
	defb 003h,055h,055h,01fh	; 7900
	defb 086h,080h,002h,08fh	; 7904
	defb 007h,000h,007h,04fh	; 7908
	defb 086h,080h,006h,08fh	; 790c
	defb 007h,00fh,0f7h,04fh	; 7910
	defb 086h,088h,016h,08fh	; 7914
	defb 007h,00ah,0d7h,04fh	; 7918
	defb 086h,08ah,016h,08fh	; 791c
	defb 007h,008h,057h,04fh	; 7920
	defb 086h,08bh,056h,08fh	; 7924
	defb 007h,008h,017h,04fh	; 7928
	defb 086h,08fh,0f6h,08fh	; 792c
	defb 007h,000h,007h,04fh	; 7930
	defb 086h,0bfh,0feh,08fh	; 7934
	defb 007h,07fh,0fdh,01fh	; 7938
	defb 083h,0aah,0aah,03fh	; 793c
	defb 001h,0d9h,064h,07eh	; 7940
	defb 020h,0eah,0a8h,0fch	; 7944
	defb 000h,040h,001h,0f8h	; 7948
	defb 008h,000h,003h,0f0h	; 794c
	defb 000h,03fh,0ffh,0e0h	; 7950
	defb 002h,07fh,0ffh,0c0h	; 7954
	defb 000h,07fh,0ffh,080h	; 7958
	defb 000h,0ffh,0ffh,000h	; 795c
	defb 000h,000h,000h,000h	; 7960
	defb 000h,000h,000h,000h	; 7964
	defb 000h,000h,000h,000h	; 7968
	defb 000h,000h,000h,000h	; 796c
	defb 000h,000h,000h,000h	; 7970
	defb 000h,000h,000h,000h	; 7974
	defb 000h,000h,000h,000h	; 7978
	defb 000h,000h,000h,000h	; 797c
	defb 0ffh,0ffh,0ffh,0ffh	; 7980
	defb 0ffh,0ffh,0ffh,0ffh	; 7984
	defb 0f1h,021h,0f1h,021h	; 7988
	defb 058h,091h,058h,091h	; 798c
	defb 0cdh,009h,0cdh,009h	; 7990
	defb 046h,085h,046h,085h	; 7994
	defb 0c3h,001h,0c3h,001h	; 7998
	defb 041h,081h,041h,081h	; 799c
	defb 0c0h,0c1h,0c0h,0c1h	; 79a0
	defb 041h,061h,041h,061h	; 79a4
	defb 0c0h,0b1h,0c0h,0b1h	; 79a8
	defb 051h,019h,051h,019h	; 79ac
	defb 0c8h,08dh,0c8h,08dh	; 79b0
	defb 045h,007h,045h,007h	; 79b4
	defb 0ffh,0ffh,0ffh,0ffh	; 79b8
	defb 0ffh,0ffh,0ffh,0ffh	; 79bc
	defb 000h,000h,000h,000h	; 79c0
	defb 000h,000h,000h,000h	; 79c4
	defb 000h,000h,000h,000h	; 79c8
	defb 000h,000h,000h,000h	; 79cc
	defb 000h,000h,000h,000h	; 79d0
	defb 000h,000h,000h,000h	; 79d4
	defb 000h,000h,000h,000h	; 79d8
	defb 000h,000h,000h,000h	; 79dc
	defb 000h,000h,000h,000h	; 79e0
	defb 000h,000h,000h,001h	; 79e4
	defb 000h,000h,000h,003h	; 79e8
	defb 00ah,0aah,0aah,0afh	; 79ec
	defb 01fh,0ffh,0ffh,0f7h	; 79f0
	defb 00fh,0f7h,0dfh,0efh	; 79f4
	defb 01dh,055h,055h,047h	; 79f8
	defb 08eh,0a6h,09ah,08eh	; 79fc
	defb 01dh,055h,055h,047h	; 7a00
	defb 008h,004h,010h,00fh	; 7a04
	defb 01fh,0c0h,007h,0e7h	; 7a08
	defb 00eh,08ah,0aeh,08fh	; 7a0c
	defb 01dh,010h,007h,047h	; 7a10
	defb 00eh,087h,0eeh,08fh	; 7a14
	defb 01dh,014h,027h,047h	; 7a18
	defb 008h,005h,0ach,00fh	; 7a1c
	defb 01fh,0d5h,0a7h,0e7h	; 7a20
	defb 00eh,085h,0aeh,08fh	; 7a24
	defb 01dh,015h,0a7h,047h	; 7a28
	defb 00eh,084h,02eh,08fh	; 7a2c
	defb 01dh,014h,027h,047h	; 7a30
	defb 008h,005h,0ach,00fh	; 7a34
	defb 01fh,0d5h,0a7h,0e7h	; 7a38
	defb 08eh,085h,0aeh,08eh	; 7a3c
	defb 01dh,015h,0a7h,047h	; 7a40
	defb 00eh,084h,02eh,08fh	; 7a44
	defb 01ch,017h,0e4h,007h	; 7a48
	defb 008h,000h,008h,00fh	; 7a4c
	defb 015h,055h,055h,057h	; 7a50
	defb 01fh,0ffh,0ffh,0ffh	; 7a54
	defb 03fh,0ffh,0ffh,0ffh	; 7a58
	defb 07fh,0ffh,0ffh,0ffh	; 7a5c
	defb 055h,055h,055h,055h	; 7a60
	defb 0aah,0aah,0aah,0aah	; 7a64
	defb 055h,055h,055h,055h	; 7a68
	defb 0aah,0aah,0aah,0aah	; 7a6c
	defb 055h,055h,055h,055h	; 7a70
	defb 0aah,0aah,0aah,0aah	; 7a74
	defb 000h,000h,000h,000h	; 7a78
	defb 000h,000h,000h,000h	; 7a7c
	defb 055h,055h,055h,055h	; 7a80
	defb 0aah,0aah,0aah,0aah	; 7a84
	defb 000h,001h,000h,001h	; 7a88
	defb 080h,002h,080h,002h	; 7a8c
	defb 015h,057h,015h,057h	; 7a90
	defb 08fh,0feh,08fh,0feh	; 7a94
	defb 01dh,047h,01dh,047h	; 7a98
	defb 08ah,0aeh,08ah,0aeh	; 7a9c
	defb 01dh,047h,01dh,047h	; 7aa0
	defb 08ah,0aeh,08ah,0aeh	; 7aa4
	defb 010h,007h,010h,007h	; 7aa8
	defb 08ah,0aeh,08ah,0aeh	; 7aac
	defb 01fh,0ffh,01fh,0ffh	; 7ab0
	defb 0bfh,0feh,0bfh,0feh	; 7ab4
	defb 055h,055h,055h,055h	; 7ab8
	defb 0aah,0aah,0aah,0aah	; 7abc
	defb 0ffh,0ffh,0ffh,0ffh	; 7ac0
	defb 0ffh,0ffh,0ffh,0ffh	; 7ac4
	defb 055h,055h,055h,055h	; 7ac8
	defb 0aah,0aah,0aah,0aah	; 7acc
	defb 055h,055h,055h,055h	; 7ad0
	defb 0aah,0aah,0aah,0aah	; 7ad4
	defb 055h,055h,055h,055h	; 7ad8
	defb 0aah,0aah,0aah,0aah	; 7adc
	defb 054h,055h,055h,0d5h	; 7ae0
	defb 0a8h,0aah,0aah,0eah	; 7ae4
	defb 054h,055h,055h,0d5h	; 7ae8
	defb 0a8h,0a0h,00ah,0eah	; 7aec
	defb 054h,045h,05dh,0d5h	; 7af0
	defb 0a8h,0afh,0eah,0eah	; 7af4
	defb 054h,045h,05dh,0d5h	; 7af8
	defb 0a8h,0aeh,08ah,0eah	; 7afc
	defb 054h,045h,05dh,0d5h	; 7b00
	defb 0a8h,0aeh,08ah,0eah	; 7b04
	defb 054h,045h,05dh,0d5h	; 7b08
	defb 0a8h,0aeh,08ah,0eah	; 7b0c
	defb 054h,045h,05dh,0d5h	; 7b10
	defb 0a8h,0aeh,08ah,0eah	; 7b14
	defb 054h,045h,05dh,0d5h	; 7b18
	defb 0a8h,0aeh,08ah,0eah	; 7b1c
	defb 054h,045h,05dh,0d5h	; 7b20
	defb 0a8h,0aeh,08ah,0eah	; 7b24
	defb 054h,045h,05dh,0d5h	; 7b28
	defb 0a8h,0aeh,08ah,0eah	; 7b2c
	defb 054h,045h,05dh,0d5h	; 7b30
	defb 0a8h,0aeh,08ah,0eah	; 7b34
	defb 054h,045h,05dh,0d5h	; 7b38
	defb 0a8h,0aeh,08ah,0eah	; 7b3c
	defb 054h,045h,05dh,0d5h	; 7b40
	defb 0a8h,0aeh,08ah,0eah	; 7b44
	defb 054h,044h,01dh,0d5h	; 7b48
	defb 0a8h,0aah,0aah,0eah	; 7b4c
	defb 054h,05fh,0fdh,0d5h	; 7b50
	defb 0a8h,0aah,0aah,0eah	; 7b54
	defb 054h,055h,055h,0d5h	; 7b58
	defb 0a8h,0aah,0aah,0eah	; 7b5c
	defb 055h,055h,055h,055h	; 7b60
	defb 0aah,0aah,02ah,0aah	; 7b64
	defb 055h,054h,015h,055h	; 7b68
	defb 0aah,0aah,02ah,0aah	; 7b6c
	defb 055h,055h,055h,055h	; 7b70
	defb 0aah,0a0h,002h,0aah	; 7b74
	defb 055h,045h,051h,055h	; 7b78
	defb 0aah,08ah,02bh,0aah	; 7b7c
	defb 055h,015h,055h,0d5h	; 7b80
	defb 0aah,028h,00ah,0eah	; 7b84
	defb 054h,051h,05dh,055h	; 7b88
	defb 0a8h,022h,02eh,0eah	; 7b8c
	defb 054h,045h,05fh,075h	; 7b90
	defb 0a8h,08ah,02eh,0eah	; 7b94
	defb 050h,045h,057h,075h	; 7b98
	defb 0a8h,08ah,02eh,0fah	; 7b9c
	defb 051h,014h,017h,075h	; 7ba0
	defb 0a8h,08ah,02bh,0fah	; 7ba4
	defb 051h,014h,017h,075h	; 7ba8
	defb 0a0h,08ah,02bh,0bah	; 7bac
	defb 051h,014h,017h,07dh	; 7bb0
	defb 0a0h,08ah,0abh,0bah	; 7bb4
	defb 051h,01fh,0ffh,07dh	; 7bb8
	defb 0a0h,0bfh,0ffh,0bah	; 7bbc
	defb 051h,055h,055h,07dh	; 7bc0
	defb 0a3h,0ffh,0ffh,0fah	; 7bc4
	defb 057h,084h,010h,0fdh	; 7bc8
	defb 0afh,0ffh,0ffh,0fah	; 7bcc
	defb 05fh,0f1h,0c7h,0fdh	; 7bd0
	defb 0afh,0ffh,0ffh,0fah	; 7bd4
	defb 055h,055h,055h,055h	; 7bd8
	defb 0aah,0aah,0aah,0aah	; 7bdc
	defb 055h,055h,055h,055h	; 7be0
	defb 0beh,0aah,0aah,0beh	; 7be4
	defb 049h,05dh,03dh,013h	; 7be8
	defb 0dch,0b2h,08eh,03ah	; 7bec
	defb 076h,071h,04ch,06fh	; 7bf0
	defb 0dbh,03ch,03ch,0dah	; 7bf4
	defb 04dh,0c7h,0e3h,0b1h	; 7bf8
	defb 0a6h,0f8h,01fh,062h	; 7bfc
	defb 053h,0d5h,055h,0c5h	; 7c00
	defb 0abh,080h,002h,0cah	; 7c04
	defb 05dh,015h,057h,0bdh	; 7c08
	defb 0bdh,0aah,0aah,0beh	; 7c0c
	defb 065h,01fh,0f7h,0a5h	; 7c10
	defb 0a6h,0a8h,01ah,066h	; 7c14
	defb 052h,01ah,0d7h,051h	; 7c18
	defb 0aah,0abh,09ah,04ah	; 7c1c
	defb 052h,019h,0d7h,055h	; 7c20
	defb 08ah,0abh,05ah,04ah	; 7c24
	defb 066h,018h,017h,065h	; 7c28
	defb 0a5h,0afh,0fah,0a6h	; 7c2c
	defb 07dh,015h,057h,0bdh	; 7c30
	defb 0bdh,0aah,0aah,0bah	; 7c34
	defb 053h,07fh,0ffh,0d5h	; 7c38
	defb 0a3h,0aah,0abh,0cah	; 7c3c
	defb 046h,0f8h,01fh,065h	; 7c40
	defb 08dh,0c7h,0e3h,0b2h	; 7c44
	defb 05bh,03ch,03ch,0dbh	; 7c48
	defb 0f6h,032h,08eh,06eh	; 7c4c
	defb 05ch,071h,04dh,03bh	; 7c50
	defb 0c8h,0bch,0bah,092h	; 7c54
	defb 07dh,055h,055h,07dh	; 7c58
	defb 0aah,0aah,0aah,0aah	; 7c5c
	defb 055h,075h,0f5h,07fh	; 7c60
	defb 0aah,0a2h,0eah,0bfh	; 7c64
	defb 055h,075h,0f5h,05fh	; 7c68
	defb 0aah,0a2h,0eah,0afh	; 7c6c
	defb 055h,075h,0f5h,057h	; 7c70
	defb 0aah,0a2h,0eah,0abh	; 7c74
	defb 055h,075h,0f5h,055h	; 7c78
	defb 0aah,0a2h,0eah,0aah	; 7c7c
	defb 055h,075h,0f5h,055h	; 7c80
	defb 0aah,0a2h,0e8h,002h	; 7c84
	defb 055h,075h,0f0h,007h	; 7c88
	defb 0aah,0a2h,0e8h,0aeh	; 7c8c
	defb 055h,075h,0f1h,057h	; 7c90
	defb 0aah,0a2h,0e8h,0aeh	; 7c94
	defb 055h,075h,0f1h,057h	; 7c98
	defb 0aah,0a2h,0e8h,0aeh	; 7c9c
	defb 055h,075h,0f1h,057h	; 7ca0
	defb 0aah,0a2h,0e8h,0aeh	; 7ca4
	defb 055h,075h,0f1h,057h	; 7ca8
	defb 0aah,0a2h,0e8h,0aeh	; 7cac
	defb 055h,075h,0f1h,057h	; 7cb0
	defb 0aah,0a2h,0ebh,0feh	; 7cb4
	defb 055h,075h,0f7h,0ffh	; 7cb8
	defb 0aah,0a2h,0eah,0aah	; 7cbc
	defb 055h,075h,0f5h,055h	; 7cc0
	defb 0aah,0a2h,0eah,0aah	; 7cc4
	defb 055h,075h,0f5h,055h	; 7cc8
	defb 0aah,0a2h,0eah,0abh	; 7ccc
	defb 055h,075h,0f5h,057h	; 7cd0
	defb 0aah,0a2h,0eah,0afh	; 7cd4
	defb 055h,075h,0f5h,05fh	; 7cd8
	defb 0aah,0a2h,0eah,0bfh	; 7cdc
	defb 055h,055h,055h,055h	; 7ce0
	defb 000h,000h,000h,000h	; 7ce4
	defb 000h,000h,000h,000h	; 7ce8
	defb 000h,000h,000h,000h	; 7cec
	defb 000h,000h,000h,000h	; 7cf0
	defb 000h,000h,000h,000h	; 7cf4
	defb 055h,055h,055h,055h	; 7cf8
	defb 0aah,0aah,0aah,0aah	; 7cfc
	defb 055h,055h,055h,055h	; 7d00
	defb 0a0h,00ah,0a0h,00ah	; 7d04
	defb 047h,0c5h,047h,0c5h	; 7d08
	defb 098h,032h,098h,032h	; 7d0c
	defb 020h,019h,020h,019h	; 7d10
	defb 022h,0b8h,022h,0b8h	; 7d14
	defb 045h,05dh,045h,05dh	; 7d18
	defb 04ah,0ach,04ah,0ach	; 7d1c
	defb 045h,05dh,045h,05dh	; 7d20
	defb 04ah,0ach,04ah,0ach	; 7d24
	defb 045h,05dh,045h,05dh	; 7d28
	defb 02ah,0b8h,02ah,0b8h	; 7d2c
	defb 03dh,079h,03dh,079h	; 7d30
	defb 09fh,0f2h,09fh,0f2h	; 7d34
	defb 047h,0c5h,047h,0c5h	; 7d38
	defb 0a0h,00ah,0a0h,00ah	; 7d3c
	defb 055h,055h,055h,055h	; 7d40
	defb 0aah,0aah,0aah,0aah	; 7d44
	defb 0ffh,0ffh,0ffh,0ffh	; 7d48
	defb 0ffh,0ffh,0ffh,0ffh	; 7d4c
	defb 0ffh,0ffh,0ffh,0ffh	; 7d50
	defb 0ffh,0ffh,0ffh,0ffh	; 7d54
	defb 0ffh,0ffh,0ffh,0ffh	; 7d58
	defb 0aah,0aah,0aah,0aah	; 7d5c
	defb 055h,055h,040h,000h	; 7d60
	defb 000h,000h,028h,000h	; 7d64
	defb 000h,000h,004h,000h	; 7d68
	defb 000h,000h,002h,080h	; 7d6c
	defb 000h,000h,000h,040h	; 7d70
	defb 000h,000h,000h,028h	; 7d74
	defb 055h,055h,040h,004h	; 7d78
	defb 0aah,0aah,0a0h,002h	; 7d7c
	defb 055h,055h,054h,001h	; 7d80
	defb 0a0h,00ah,0aah,002h	; 7d84
	defb 047h,0c5h,055h,047h	; 7d88
	defb 098h,032h,0aah,0aeh	; 7d8c
	defb 020h,019h,055h,05fh	; 7d90
	defb 022h,0b8h,0aah,0beh	; 7d94
	defb 045h,05dh,000h,05fh	; 7d98
	defb 04ah,0ach,0aah,0feh	; 7d9c
	defb 045h,05dh,015h,05fh	; 7da0
	defb 04ah,0ach,0aah,0feh	; 7da4
	defb 045h,05dh,07fh,0dfh	; 7da8
	defb 02ah,0b8h,0aah,0beh	; 7dac
	defb 03dh,079h,055h,05fh	; 7db0
	defb 09fh,0f2h,0aah,0beh	; 7db4
	defb 047h,0c5h,055h,0ffh	; 7db8
	defb 0a0h,00ah,0abh,0feh	; 7dbc
	defb 055h,055h,05fh,0fch	; 7dc0
	defb 0aah,0aah,0bfh,0f0h	; 7dc4
	defb 0ffh,0ffh,0ffh,0c0h	; 7dc8
	defb 0ffh,0ffh,0ffh,000h	; 7dcc
	defb 0ffh,0ffh,0fch,000h	; 7dd0
	defb 0ffh,0ffh,0f0h,000h	; 7dd4
	defb 0ffh,0ffh,0c0h,000h	; 7dd8
	defb 0aah,0aah,080h,000h	; 7ddc
	defb 000h,005h,055h,055h	; 7de0
	defb 000h,008h,000h,000h	; 7de4
	defb 000h,050h,000h,000h	; 7de8
	defb 000h,080h,000h,000h	; 7dec
	defb 005h,000h,000h,000h	; 7df0
	defb 008h,000h,000h,000h	; 7df4
	defb 050h,001h,055h,055h	; 7df8
	defb 080h,00ah,0aah,0aah	; 7dfc
	defb 000h,015h,055h,055h	; 7e00
	defb 080h,0aah,0a0h,00ah	; 7e04
	defb 001h,055h,047h,0c5h	; 7e08
	defb 082h,0aah,098h,032h	; 7e0c
	defb 001h,055h,020h,019h	; 7e10
	defb 082h,0aah,022h,0b8h	; 7e14
	defb 000h,001h,045h,05dh	; 7e18
	defb 082h,0aah,04ah,0ach	; 7e1c
	defb 000h,057h,045h,05dh	; 7e20
	defb 082h,0aah,04ah,0ach	; 7e24
	defb 001h,0ffh,045h,05dh	; 7e28
	defb 082h,0aah,02ah,0b8h	; 7e2c
	defb 001h,055h,03dh,079h	; 7e30
	defb 08eh,0aah,09fh,0f2h	; 7e34
	defb 03fh,055h,047h,0c5h	; 7e38
	defb 0ffh,0eah,0a0h,00ah	; 7e3c
	defb 03fh,0f5h,055h,055h	; 7e40
	defb 00fh,0feh,0aah,0aah	; 7e44
	defb 003h,0ffh,0ffh,0ffh	; 7e48
	defb 000h,0ffh,0ffh,0ffh	; 7e4c
	defb 000h,03fh,0ffh,0ffh	; 7e50
	defb 000h,00fh,0ffh,0ffh	; 7e54
	defb 000h,003h,0ffh,0ffh	; 7e58
	defb 000h,000h,0aah,0aah	; 7e5c
	defb 001h,045h,055h,0d5h	; 7e60
	defb 002h,08ah,0aah,0eah	; 7e64
	defb 005h,044h,005h,0d5h	; 7e68
	defb 00ah,088h,00eh,0eah	; 7e6c
	defb 015h,044h,05dh,0d5h	; 7e70
	defb 02ah,088h,0aeh,0eah	; 7e74
	defb 055h,044h,05dh,0d5h	; 7e78
	defb 0aah,088h,0aeh,0eah	; 7e7c
	defb 055h,044h,05dh,0d5h	; 7e80
	defb 0aah,088h,0aeh,0eah	; 7e84
	defb 040h,004h,05dh,0d5h	; 7e88
	defb 080h,008h,0feh,0eah	; 7e8c
	defb 045h,055h,0fdh,0d5h	; 7e90
	defb 08ah,0aah,0aah,0eah	; 7e94
	defb 045h,055h,055h,0d5h	; 7e98
	defb 08ah,0aah,0aah,0eah	; 7e9c
	defb 045h,055h,055h,0d5h	; 7ea0
	defb 08ah,0aah,0aah,0eah	; 7ea4
	defb 045h,054h,005h,0d5h	; 7ea8
	defb 08ah,0a8h,00eh,0eah	; 7eac
	defb 05fh,0f4h,05dh,0d5h	; 7eb0
	defb 0bfh,0e8h,0aeh,0eah	; 7eb4
	defb 055h,044h,05dh,0d5h	; 7eb8
	defb 0aah,088h,0aeh,0eah	; 7ebc
	defb 055h,044h,05dh,0d5h	; 7ec0
	defb 0aah,088h,0aeh,0eah	; 7ec4
	defb 055h,044h,05dh,0d5h	; 7ec8
	defb 02ah,088h,0feh,0eah	; 7ecc
	defb 015h,045h,0fdh,0d5h	; 7ed0
	defb 00ah,08ah,0aah,0eah	; 7ed4
	defb 005h,045h,055h,0d5h	; 7ed8
	defb 082h,08ah,0aah,0eah	; 7edc
	defb 000h,000h,000h,007h	; 7ee0
	defb 000h,000h,000h,03fh	; 7ee4
	defb 000h,000h,000h,078h	; 7ee8
	defb 000h,000h,000h,0c0h	; 7eec
	defb 000h,000h,001h,08fh	; 7ef0
	defb 000h,000h,001h,0b9h	; 7ef4
	defb 000h,01fh,080h,0e7h	; 7ef8
	defb 000h,023h,071h,09dh	; 7efc
	defb 000h,03dh,08dh,0f5h	; 7f00
	defb 000h,03eh,0c2h,0c5h	; 7f04
	defb 000h,03fh,061h,075h	; 7f08
	defb 000h,03fh,0b0h,0b5h	; 7f0c
	defb 000h,01dh,058h,051h	; 7f10
	defb 000h,01ah,0a9h,06dh	; 7f14
	defb 000h,01fh,056h,0b5h	; 7f18
	defb 000h,00ah,0a3h,057h	; 7f1c
	defb 000h,00dh,009h,0bbh	; 7f20
	defb 000h,006h,094h,0dbh	; 7f24
	defb 000h,004h,02eh,0bbh	; 7f28
	defb 000h,002h,058h,07bh	; 7f2c
	defb 000h,002h,0b2h,07dh	; 7f30
	defb 000h,001h,0e0h,03dh	; 7f34
	defb 000h,001h,0cah,03dh	; 7f38
	defb 000h,003h,040h,03dh	; 7f3c
	defb 000h,006h,020h,01dh	; 7f40
	defb 000h,00ch,010h,01dh	; 7f44
	defb 000h,010h,008h,01dh	; 7f48
	defb 000h,020h,004h,00ch	; 7f4c
	defb 000h,000h,002h,018h	; 7f50
	defb 000h,000h,001h,0a8h	; 7f54
	defb 000h,000h,000h,070h	; 7f58
	defb 000h,000h,000h,000h	; 7f5c
	defb 0ffh,0ffh,0ffh,0ffh	; 7f60
	defb 0ffh,0ffh,0ffh,0ffh	; 7f64
	defb 054h,00dh,070h,000h	; 7f68
	defb 06ch,008h,0f0h,000h	; 7f6c
	defb 054h,00dh,070h,000h	; 7f70
	defb 06ch,008h,0f0h,000h	; 7f74
	defb 054h,07fh,0feh,000h	; 7f78
	defb 028h,07fh,0feh,042h	; 7f7c
	defb 038h,00dh,070h,06ch	; 7f80
	defb 010h,03fh,0ffh,078h	; 7f84
	defb 010h,06fh,0f5h,0f8h	; 7f88
	defb 038h,0d8h,01ah,0fch	; 7f8c
	defb 011h,0b2h,0adh,06eh	; 7f90
	defb 003h,061h,056h,0b0h	; 7f94
	defb 006h,0cah,09bh,050h	; 7f98
	defb 005h,095h,039h,0b0h	; 7f9c
	defb 006h,0a2h,0a5h,050h	; 7fa0
	defb 005h,090h,01dh,0b0h	; 7fa4
	defb 006h,0aah,07dh,050h	; 7fa8
	defb 005h,090h,01dh,0b0h	; 7fac
	defb 006h,0a2h,0a5h,060h	; 7fb0
	defb 005h,0d5h,0bbh,0e0h	; 7fb4
	defb 006h,0e9h,0d7h,040h	; 7fb8
	defb 007h,073h,0ceh,0c0h	; 7fbc
	defb 002h,0b8h,01dh,040h	; 7fc0
	defb 003h,0ffh,0ffh,0c0h	; 7fc4
	defb 000h,081h,055h,000h	; 7fc8
	defb 000h,06ah,0beh,000h	; 7fcc
	defb 000h,01fh,0f8h,000h	; 7fd0
	defb 000h,000h,000h,000h	; 7fd4
	defb 000h,000h,000h,000h	; 7fd8
	defb 000h,000h,000h,000h	; 7fdc
	defb 055h,075h,0f5h,07fh	; 7fe0
	defb 0aah,0a2h,0eah,0bfh	; 7fe4
	defb 055h,075h,0f5h,05fh	; 7fe8
	defb 0aah,0a2h,0eah,0afh	; 7fec
	defb 055h,075h,0f5h,057h	; 7ff0
	defb 0aah,0a2h,0eah,0abh	; 7ff4
	defb 055h,075h,0f5h,055h	; 7ff8
	defb 0aah,0a2h,0eah,0aah	; 7ffc
	defb 057h,0ffh,0ffh,07fh	; 8000
	defb 0aeh,00ah,0bfh,0c8h	; 8004
	defb 055h,041h,05fh,01dh	; 8008
	defb 0aeh,00ah,0bfh,02ah	; 800c
	defb 055h,041h,05fh,05fh	; 8010
	defb 0aeh,00ah,0bfh,0bfh	; 8014
	defb 055h,041h,05fh,0f5h	; 8018
	defb 0aeh,00ah,0bfh,0eah	; 801c
	defb 057h,0ffh,0ffh,055h	; 8020
	defb 0aah,0aah,0aah,0aah	; 8024
	defb 040h,015h,050h,005h	; 8028
	defb 080h,02ah,0a8h,00eh	; 802c
	defb 045h,075h,051h,05dh	; 8030
	defb 08ah,0eah,0a8h,0aeh	; 8034
	defb 045h,075h,051h,05dh	; 8038
	defb 08ah,0eah,0a8h,0aeh	; 803c
	defb 045h,040h,001h,05dh	; 8040
	defb 08ah,080h,002h,0aeh	; 8044
	defb 045h,055h,055h,05dh	; 8048
	defb 08ah,0aah,0aah,0aeh	; 804c
	defb 045h,055h,055h,05dh	; 8050
	defb 08fh,0ffh,0ffh,0feh	; 8054
	defb 05fh,0ffh,0ffh,0fdh	; 8058
	defb 0aah,0aah,0aah,0aah	; 805c
	defb 055h,055h,055h,055h	; 8060
	defb 0aah,0aah,0aah,0aah	; 8064
	defb 055h,055h,055h,055h	; 8068
	defb 0aah,0aah,0aah,0aah	; 806c
	defb 055h,055h,055h,055h	; 8070
	defb 0aah,0aah,0aah,0aah	; 8074
	defb 055h,055h,055h,055h	; 8078
	defb 0aah,0aah,0aah,080h	; 807c
	defb 057h,0ffh,0ffh,040h	; 8080
	defb 0aeh,00ah,0bfh,08ah	; 8084
	defb 055h,041h,05fh,045h	; 8088
	defb 0aeh,00ah,0bfh,08ah	; 808c
	defb 055h,041h,05fh,043h	; 8090
	defb 0aeh,00ah,0bfh,08ah	; 8094
	defb 055h,041h,05fh,043h	; 8098
	defb 0aeh,00ah,0bfh,08ah	; 809c
	defb 057h,0ffh,0ffh,043h	; 80a0
	defb 0aah,0a2h,0eah,08ah	; 80a4
	defb 055h,075h,0f5h,043h	; 80a8
	defb 0aah,0a2h,0eah,08ah	; 80ac
	defb 055h,075h,0f5h,045h	; 80b0
	defb 0aah,0a2h,0eah,08fh	; 80b4
	defb 055h,075h,0f5h,05fh	; 80b8
	defb 0aah,0a2h,0eah,0aah	; 80bc
	defb 055h,075h,0f5h,055h	; 80c0
	defb 0aah,0a2h,0eah,0aah	; 80c4
	defb 055h,075h,0f5h,055h	; 80c8
	defb 0aah,0a2h,0eah,0abh	; 80cc
	defb 055h,075h,0f5h,057h	; 80d0
	defb 0aah,0a2h,0eah,0afh	; 80d4
	defb 055h,075h,0f5h,05fh	; 80d8
	defb 0aah,0a2h,0eah,0bfh	; 80dc
	defb 055h,055h,055h,055h	; 80e0
	defb 0aah,0aah,0aah,0aah	; 80e4
	defb 055h,055h,055h,055h	; 80e8
	defb 0aah,0aah,0aah,0aah	; 80ec
	defb 055h,055h,055h,035h	; 80f0
	defb 0aah,0aah,0aah,03ah	; 80f4
	defb 055h,055h,054h,05dh	; 80f8
	defb 000h,000h,0a8h,0aeh	; 80fc
	defb 000h,001h,0d1h,057h	; 8100
	defb 0aah,0aah,0e8h,0aeh	; 8104
	defb 055h,055h,074h,05dh	; 8108
	defb 0aah,0beh,0bah,03ah	; 810c
	defb 033h,07ch,05dh,035h	; 8110
	defb 0aah,0eah,02eh,0aah	; 8114
	defb 033h,075h,017h,055h	; 8118
	defb 0aah,0eah,08bh,0aah	; 811c
	defb 033h,075h,045h,0d5h	; 8120
	defb 0aah,0eah,0a2h,0eah	; 8124
	defb 033h,075h,051h,0d5h	; 8128
	defb 0aah,0bah,0a2h,0eah	; 812c
	defb 055h,05dh,051h,0d5h	; 8130
	defb 0ffh,0aeh,0a2h,0eah	; 8134
	defb 0ffh,017h,051h,0d5h	; 8138
	defb 0aah,08bh,0a2h,0eah	; 813c
	defb 055h,047h,051h,0d5h	; 8140
	defb 0aah,08bh,0a2h,0eah	; 8144
	defb 055h,047h,051h,0d5h	; 8148
	defb 02ah,08bh,0a2h,0eah	; 814c
	defb 015h,047h,001h,0d5h	; 8150
	defb 00ah,08ah,002h,0eah	; 8154
	defb 005h,045h,055h,0d5h	; 8158
	defb 082h,08ah,0aah,0eah	; 815c
	defb 001h,045h,055h,0d5h	; 8160
	defb 002h,08ah,0aah,0eah	; 8164
	defb 005h,045h,055h,0d5h	; 8168
	defb 00ah,08fh,0ffh,0eah	; 816c
	defb 015h,05fh,0ffh,0d5h	; 8170
	defb 02ah,0aah,0aah,0aah	; 8174
	defb 055h,055h,055h,055h	; 8178
	defb 0aah,0aah,0aah,0aah	; 817c
	defb 0ffh,0ffh,0f5h,055h	; 8180
	defb 020h,020h,08eh,0aah	; 8184
	defb 075h,075h,0c7h,055h	; 8188
	defb 0aah,0aah,0abh,0aah	; 818c
	defb 0ffh,0ffh,0c7h,0d5h	; 8190
	defb 0ffh,0ffh,0ebh,0aah	; 8194
	defb 055h,055h,065h,0d5h	; 8198
	defb 0aah,0aah,0b3h,0aah	; 819c
	defb 055h,055h,055h,0d5h	; 81a0
	defb 0aah,0aah,0a3h,0aah	; 81a4
	defb 057h,0ffh,0c5h,0d5h	; 81a8
	defb 0ach,020h,08bh,0aah	; 81ac
	defb 05dh,075h,0d7h,055h	; 81b0
	defb 0aeh,0aah,0aeh,0aah	; 81b4
	defb 057h,0ffh,0fdh,055h	; 81b8
	defb 0abh,0ffh,0fah,0aah	; 81bc
	defb 055h,055h,055h,055h	; 81c0
	defb 0a0h,0a8h,02ah,00ah	; 81c4
	defb 041h,0d0h,074h,01dh	; 81c8
	defb 0a3h,0a8h,0eah,03ah	; 81cc
	defb 045h,0d1h,074h,05dh	; 81d0
	defb 0afh,0abh,0eah,0fah	; 81d4
	defb 05fh,0d7h,0f5h,0fdh	; 81d8
	defb 0aah,0aah,0aah,0aah	; 81dc
	defb 055h,055h,055h,055h	; 81e0
	defb 0aah,0aah,0aah,0aah	; 81e4
	defb 055h,055h,051h,055h	; 81e8
	defb 0aah,000h,026h,0aah	; 81ec
	defb 055h,0bfh,08fh,055h	; 81f0
	defb 0abh,0a7h,0d9h,02ah	; 81f4
	defb 053h,0dbh,057h,055h	; 81f8
	defb 0abh,0bbh,0beh,0aah	; 81fc
	defb 053h,0b6h,006h,0d5h	; 8200
	defb 0abh,0bdh,0f9h,0cah	; 8204
	defb 052h,010h,0feh,0d5h	; 8208
	defb 0a5h,0f7h,07eh,0cah	; 820c
	defb 04bh,0b7h,0c8h,0d5h	; 8210
	defb 0abh,06eh,0b7h,02ah	; 8214
	defb 04ah,0f5h,0fah,0e5h	; 8218
	defb 0a2h,0dbh,0fah,0eah	; 821c
	defb 053h,0bbh,0dah,0e5h	; 8220
	defb 0abh,0bdh,087h,0cah	; 8224
	defb 055h,0beh,05dh,095h	; 8228
	defb 0a6h,03dh,0dbh,04ah	; 822c
	defb 057h,0c3h,0dch,0d5h	; 8230
	defb 0a7h,0dfh,0bfh,0cah	; 8234
	defb 057h,0e0h,05fh,095h	; 8238
	defb 0a7h,0fbh,0efh,02ah	; 823c
	defb 053h,0f7h,0eeh,055h	; 8240
	defb 0a8h,00fh,0e0h,0aah	; 8244
	defb 055h,043h,0c5h,055h	; 8248
	defb 0aah,0a8h,00ah,0aah	; 824c
	defb 055h,055h,055h,055h	; 8250
	defb 0aah,0aah,0aah,0aah	; 8254
	defb 055h,055h,055h,055h	; 8258
	defb 0aah,0aah,0aah,0aah	; 825c
	defb 055h,055h,055h,055h	; 8260
	defb 0aah,0aah,0aah,0aah	; 8264
	defb 055h,055h,055h,055h	; 8268
	defb 0a8h,000h,00ah,0aah	; 826c
	defb 053h,0bbh,0e5h,055h	; 8270
	defb 0a3h,0bdh,0f2h,02ah	; 8274
	defb 057h,0b8h,0f8h,075h	; 8278
	defb 0a4h,0f7h,027h,06ah	; 827c
	defb 053h,06fh,0dfh,055h	; 8280
	defb 0a7h,0ech,0b6h,0aah	; 8284
	defb 04eh,077h,07ah,055h	; 8288
	defb 09dh,0bfh,0bah,0aah	; 828c
	defb 05bh,0b3h,0d6h,055h	; 8290
	defb 0a7h,0efh,0deh,08eh	; 8294
	defb 04fh,0deh,036h,095h	; 8298
	defb 0afh,0bfh,0d9h,0aah	; 829c
	defb 050h,0bdh,0dfh,015h	; 82a0
	defb 0abh,0deh,0beh,0aah	; 82a4
	defb 056h,0e6h,0edh,085h	; 82a8
	defb 0adh,0fdh,0f3h,0aah	; 82ac
	defb 04dh,0dbh,03bh,095h	; 82b0
	defb 0adh,0e6h,0fdh,00ah	; 82b4
	defb 04eh,0eeh,0dch,015h	; 82b8
	defb 0afh,01eh,0eeh,0aah	; 82bc
	defb 057h,0f7h,066h,015h	; 82c0
	defb 0a8h,0efh,0e8h,0aah	; 82c4
	defb 055h,0f0h,005h,055h	; 82c8
	defb 0a8h,002h,0aah,08ah	; 82cc
	defb 055h,055h,055h,055h	; 82d0
	defb 0aah,0aah,0aah,0aah	; 82d4
	defb 055h,055h,055h,055h	; 82d8
	defb 0aah,0aah,0aah,0aah	; 82dc
	defb 055h,055h,055h,055h	; 82e0
	defb 0aah,08ah,0aah,0aah	; 82e4
	defb 050h,065h,055h,055h	; 82e8
	defb 0aeh,0f0h,0aah,09ah	; 82ec
	defb 05dh,0cfh,001h,035h	; 82f0
	defb 09dh,0ffh,0beh,02ah	; 82f4
	defb 051h,0f3h,0feh,075h	; 82f8
	defb 0adh,0efh,0feh,06ah	; 82fc
	defb 05dh,0deh,0f6h,095h	; 8300
	defb 09dh,0dfh,00dh,0cah	; 8304
	defb 05eh,0cfh,0bbh,0e5h	; 8308
	defb 0bfh,0c7h,0bfh,0eah	; 830c
	defb 03dh,0c0h,033h,0d5h	; 8310
	defb 083h,080h,02fh,046h	; 8314
	defb 047h,040h,02fh,08dh	; 8318
	defb 0a4h,0eeh,0afh,09ah	; 831c
	defb 04fh,0e0h,0efh,0b5h	; 8320
	defb 0afh,0edh,0ffh,06ah	; 8324
	defb 04fh,081h,09eh,0c5h	; 8328
	defb 0a7h,0feh,071h,03eh	; 832c
	defb 058h,06eh,0ffh,015h	; 8330
	defb 09dh,0deh,0efh,00ah	; 8334
	defb 05dh,0b6h,06eh,015h	; 8338
	defb 09dh,0b7h,0c0h,0fah	; 833c
	defb 04ch,0fbh,0deh,015h	; 8340
	defb 0b3h,03bh,03eh,0fah	; 8344
	defb 05bh,0c0h,079h,0f5h	; 8348
	defb 0bbh,0e2h,082h,0dah	; 834c
	defb 053h,093h,055h,075h	; 8350
	defb 0a8h,026h,09ah,0aah	; 8354
	defb 055h,055h,075h,055h	; 8358
	defb 0aah,0aeh,0aah,0aah	; 835c
	defb 055h,055h,055h,055h	; 8360
	defb 0aah,0aah,0aah,0aah	; 8364
	defb 055h,015h,054h,055h	; 8368
	defb 0a2h,068h,0a9h,09ah	; 836c
	defb 04dh,0a2h,051h,0b5h	; 8370
	defb 09bh,0e8h,067h,04ah	; 8374
	defb 05eh,02dh,057h,0d5h	; 8378
	defb 095h,0e6h,060h,0aah	; 837c
	defb 047h,0c4h,057h,0d5h	; 8380
	defb 0aeh,0a0h,0a7h,04ah	; 8384
	defb 04dh,0e0h,090h,055h	; 8388
	defb 0adh,0e0h,0b6h,0aah	; 838c
	defb 040h,000h,0bdh,055h	; 8390
	defb 0a0h,000h,0b0h,006h	; 8394
	defb 040h,020h,0a0h,00dh	; 8398
	defb 0a7h,0bah,09fh,05ah	; 839c
	defb 050h,000h,05fh,035h	; 83a0
	defb 0aeh,0feh,0dch,0cah	; 83a4
	defb 04eh,03eh,0dbh,0c5h	; 83a8
	defb 084h,0c0h,0f5h,0deh	; 83ac
	defb 03fh,040h,0aeh,0a5h	; 83b0
	defb 0b3h,080h,03eh,0eah	; 83b4
	defb 07fh,080h,06eh,065h	; 83b8
	defb 06dh,07ch,0f5h,0aah	; 83bc
	defb 02ch,061h,0b7h,015h	; 83c0
	defb 08dh,0eeh,030h,0fah	; 83c4
	defb 043h,04bh,035h,0f5h	; 83c8
	defb 0beh,0a2h,08ah,0dah	; 83cc
	defb 055h,053h,055h,075h	; 83d0
	defb 0aah,0a6h,09ah,0aah	; 83d4
	defb 055h,055h,075h,055h	; 83d8
	defb 0aah,0aeh,0aah,0aah	; 83dc
	defb 055h,055h,055h,055h	; 83e0
	defb 0aah,0aah,0aah,0aah	; 83e4
	defb 055h,035h,055h,055h	; 83e8
	defb 0a6h,0aah,0aah,09ah	; 83ec
	defb 055h,015h,055h,035h	; 83f0
	defb 0a6h,08ah,06ah,02ah	; 83f4
	defb 053h,00dh,054h,075h	; 83f8
	defb 0a2h,086h,068h,0eah	; 83fc
	defb 053h,004h,050h,0d5h	; 8400
	defb 0a9h,080h,0a1h,0aah	; 8404
	defb 050h,080h,093h,055h	; 8408
	defb 0a8h,000h,0b6h,0aah	; 840c
	defb 044h,000h,0bdh,055h	; 8410
	defb 0a8h,000h,0b0h,006h	; 8414
	defb 040h,000h,0b0h,00dh	; 8418
	defb 0a7h,0feh,0b7h,0dah	; 841c
	defb 050h,000h,0b0h,035h	; 8420
	defb 0a7h,0feh,0b7h,0aah	; 8424
	defb 053h,0feh,0b7h,0c5h	; 8428
	defb 0a8h,000h,0b0h,03eh	; 842c
	defb 054h,000h,0b0h,015h	; 8430
	defb 0aah,000h,0b0h,00ah	; 8434
	defb 054h,000h,0b0h,015h	; 8438
	defb 0afh,0fdh,0b7h,0fah	; 843c
	defb 050h,061h,02ch,015h	; 8440
	defb 0bdh,0efh,02bh,0fah	; 8444
	defb 05fh,04bh,02dh,0f5h	; 8448
	defb 0beh,0a2h,09ah,0dah	; 844c
	defb 055h,053h,055h,075h	; 8450
	defb 0aah,0a6h,09ah,0aah	; 8454
	defb 055h,055h,075h,055h	; 8458
	defb 0aah,0aeh,0aah,0aah	; 845c
	defb 055h,055h,055h,055h	; 8460
	defb 0aah,0aah,0aah,0aah	; 8464
	defb 075h,059h,055h,055h	; 8468
	defb 09eh,0a8h,0a9h,0aah	; 846c
	defb 043h,059h,051h,055h	; 8470
	defb 0a1h,0a8h,069h,0aah	; 8474
	defb 054h,0d9h,051h,0d5h	; 8478
	defb 0aah,000h,069h,0aah	; 847c
	defb 054h,054h,050h,0d5h	; 8480
	defb 0a8h,0b4h,0a9h,0b2h	; 8484
	defb 051h,054h,0c3h,065h	; 8488
	defb 0a8h,0b4h,0fah,0cah	; 848c
	defb 05dh,054h,0f9h,09fh	; 8490
	defb 0a8h,0b4h,001h,060h	; 8494
	defb 05bh,0f4h,000h,005h	; 8498
	defb 0b0h,004h,00eh,02ah	; 849c
	defb 050h,02ch,00eh,055h	; 84a0
	defb 0b0h,02ch,000h,02ah	; 84a4
	defb 050h,02dh,0ffh,085h	; 84a8
	defb 0a8h,02ch,000h,03eh	; 84ac
	defb 058h,02ch,0ffh,095h	; 84b0
	defb 0b2h,08eh,07fh,0cah	; 84b4
	defb 064h,04eh,000h,015h	; 84b8
	defb 0cch,0ach,0bch,01ah	; 84bc
	defb 094h,04dh,020h,00dh	; 84c0
	defb 0ach,0ach,06ah,006h	; 84c4
	defb 055h,049h,025h,007h	; 84c8
	defb 0aah,0a2h,08ah,0a3h	; 84cc
	defb 055h,051h,055h,051h	; 84d0
	defb 0aah,0a2h,08ah,0a8h	; 84d4
	defb 055h,055h,055h,055h	; 84d8
	defb 0aah,0aah,0aah,0aah	; 84dc
	defb 055h,055h,055h,055h	; 84e0
	defb 0aah,0a0h,082h,00ah	; 84e4
	defb 055h,055h,055h,055h	; 84e8
	defb 0aah,0a4h,092h,04ah	; 84ec
	defb 051h,0d5h,055h,055h	; 84f0
	defb 0a0h,0e4h,092h,04ah	; 84f4
	defb 040h,000h,000h,000h	; 84f8
	defb 0a2h,0aah,0aah,0aah	; 84fc
	defb 047h,0ffh,0ffh,0ffh	; 8500
	defb 0a0h,0e0h,082h,00ah	; 8504
	defb 051h,0d5h,055h,055h	; 8508
	defb 0afh,0a4h,092h,04ah	; 850c
	defb 055h,055h,055h,055h	; 8510
	defb 0aah,0a4h,092h,04ah	; 8514
	defb 000h,015h,055h,055h	; 8518
	defb 0aah,084h,092h,04ah	; 851c
	defb 03fh,0d5h,055h,055h	; 8520
	defb 0aah,084h,092h,04ah	; 8524
	defb 000h,015h,055h,055h	; 8528
	defb 0aah,0a4h,092h,04ah	; 852c
	defb 051h,0d5h,055h,055h	; 8530
	defb 0a0h,0e4h,092h,04ah	; 8534
	defb 040h,000h,000h,000h	; 8538
	defb 0a2h,0aah,0aah,0aah	; 853c
	defb 047h,0ffh,0ffh,0ffh	; 8540
	defb 0a0h,0e0h,082h,00ah	; 8544
	defb 051h,0d1h,045h,015h	; 8548
	defb 0afh,0a4h,092h,04ah	; 854c
	defb 055h,055h,055h,055h	; 8550
	defb 0aah,0a4h,092h,04ah	; 8554
	defb 055h,051h,045h,015h	; 8558
	defb 0aah,0aah,0aah,0aah	; 855c
	defb 055h,055h,055h,055h	; 8560
	defb 0a8h,0a2h,08ah,0aah	; 8564
	defb 052h,049h,025h,055h	; 8568
	defb 0aah,0aah,0aah,0aah	; 856c
	defb 052h,049h,025h,015h	; 8570
	defb 0aah,0aah,0aah,01ah	; 8574
	defb 000h,000h,000h,00dh	; 8578
	defb 055h,055h,055h,04eh	; 857c
	defb 0ffh,0ffh,0ffh,0e5h	; 8580
	defb 0a8h,0a2h,080h,00eh	; 8584
	defb 052h,049h,024h,05dh	; 8588
	defb 0aah,0aah,0aah,0fah	; 858c
	defb 052h,049h,025h,055h	; 8590
	defb 0aah,0aah,0aah,0aah	; 8594
	defb 052h,049h,020h,001h	; 8598
	defb 0aah,0aah,0aah,0a8h	; 859c
	defb 052h,049h,023h,0fdh	; 85a0
	defb 0aah,0aah,0aah,0a8h	; 85a4
	defb 052h,049h,020h,001h	; 85a8
	defb 0aah,0aah,0aah,0aah	; 85ac
	defb 052h,049h,025h,015h	; 85b0
	defb 0aah,0aah,0aah,01ah	; 85b4
	defb 000h,000h,000h,00dh	; 85b8
	defb 055h,055h,055h,04eh	; 85bc
	defb 0ffh,0ffh,0ffh,0e5h	; 85c0
	defb 0a8h,0a2h,080h,00eh	; 85c4
	defb 052h,049h,024h,05dh	; 85c8
	defb 0aah,0aah,0aah,0fah	; 85cc
	defb 052h,049h,025h,055h	; 85d0
	defb 0aah,0aah,0aah,0aah	; 85d4
	defb 050h,041h,005h,055h	; 85d8
	defb 0aah,0aah,0aah,0aah	; 85dc
	defb 055h,040h,005h,055h	; 85e0
	defb 0aah,08fh,0f0h,0aah	; 85e4
	defb 054h,030h,00ch,055h	; 85e8
	defb 0a8h,0c0h,003h,02ah	; 85ec
	defb 051h,000h,000h,095h	; 85f0
	defb 0a2h,000h,094h,04ah	; 85f4
	defb 044h,000h,000h,025h	; 85f8
	defb 088h,000h,08ah,092h	; 85fc
	defb 050h,011h,010h,049h	; 8600
	defb 090h,002h,082h,0a8h	; 8604
	defb 020h,080h,034h,015h	; 8608
	defb 020h,028h,0aah,0a4h	; 860c
	defb 040h,045h,007h,056h	; 8610
	defb 042h,002h,028h,09ah	; 8614
	defb 040h,014h,0ddh,056h	; 8618
	defb 040h,0a2h,0bah,0eah	; 861c
	defb 042h,007h,057h,056h	; 8620
	defb 040h,0bah,0eah,0bah	; 8624
	defb 045h,011h,05fh,056h	; 8628
	defb 040h,0abh,0bfh,0eah	; 862c
	defb 021h,055h,07fh,0dch	; 8630
	defb 0a4h,033h,0ffh,0ech	; 8634
	defb 011h,055h,05fh,0d9h	; 8638
	defb 090h,08bh,0bfh,0bah	; 863c
	defb 048h,077h,05fh,0d1h	; 8640
	defb 0a4h,0aah,0eah,0a2h	; 8644
	defb 052h,05dh,05fh,045h	; 8648
	defb 0a9h,02ah,03ah,08ah	; 864c
	defb 054h,0c7h,057h,015h	; 8650
	defb 0aah,03ah,0ach,02ah	; 8654
	defb 055h,00fh,0f1h,055h	; 8658
	defb 0aah,0a0h,002h,0aah	; 865c
	defb 055h,050h,005h,055h	; 8660
	defb 0aah,08fh,0f0h,0aah	; 8664
	defb 055h,070h,00eh,055h	; 8668
	defb 0a8h,080h,005h,02ah	; 866c
	defb 053h,00ch,0e2h,0d5h	; 8670
	defb 0a4h,010h,00dh,0aah	; 8674
	defb 048h,080h,00bh,055h	; 8678
	defb 0a9h,000h,002h,0b2h	; 867c
	defb 052h,000h,015h,069h	; 8680
	defb 0a0h,020h,008h,0dch	; 8684
	defb 020h,070h,013h,0b5h	; 8688
	defb 0a4h,03bh,0e6h,0dch	; 868c
	defb 048h,014h,037h,0deh	; 8690
	defb 048h,009h,09bh,0feh	; 8694
	defb 040h,012h,04fh,0feh	; 8698
	defb 040h,015h,0afh,0feh	; 869c
	defb 048h,015h,0afh,0eeh	; 86a0
	defb 048h,012h,04fh,0eeh	; 86a4
	defb 048h,059h,09fh,0eeh	; 86a8
	defb 051h,02ch,037h,0feh	; 86ac
	defb 024h,077h,0e3h,0feh	; 86b0
	defb 0b4h,0efh,0f1h,0dch	; 86b4
	defb 02bh,057h,0fbh,0bdh	; 86b8
	defb 096h,0bfh,0ffh,07ah	; 86bc
	defb 04dh,06fh,0ffh,0f5h	; 86c0
	defb 0aah,0bfh,0fdh,0f2h	; 86c4
	defb 055h,08fh,0f3h,0e5h	; 86c8
	defb 0abh,07ch,07fh,0cah	; 86cc
	defb 054h,0bfh,0ffh,015h	; 86d0
	defb 0aah,07fh,0feh,0aah	; 86d4
	defb 055h,00fh,0f1h,055h	; 86d8
	defb 0aah,0a0h,00ah,0aah	; 86dc
	defb 055h,07fh,0ffh,055h	; 86e0
	defb 0abh,0a2h,0bfh,0aah	; 86e4
	defb 057h,045h,07fh,055h	; 86e8
	defb 0aah,082h,0beh,0eah	; 86ec
	defb 054h,000h,000h,055h	; 86f0
	defb 0bfh,03fh,0fch,0feh	; 86f4
	defb 045h,031h,074h,0dfh	; 86f8
	defb 0cbh,022h,0bch,0aeh	; 86fc
	defb 046h,031h,074h,05fh	; 8700
	defb 0cah,022h,0bdh,06eh	; 8704
	defb 046h,031h,075h,05fh	; 8708
	defb 0cah,012h,0b9h,06eh	; 870c
	defb 054h,011h,07bh,037h	; 8710
	defb 0cch,012h,0bbh,0aeh	; 8714
	defb 054h,011h,07bh,0b7h	; 8718
	defb 088h,018h,0fbh,09fh	; 871c
	defb 098h,009h,073h,0d7h	; 8720
	defb 0a8h,008h,0f7h,0dbh	; 8724
	defb 090h,00dh,077h,0cfh	; 8728
	defb 0b0h,008h,0f7h,0ebh	; 872c
	defb 094h,005h,067h,0cfh	; 8730
	defb 0a0h,004h,0efh,0e7h	; 8734
	defb 0a0h,015h,067h,0f7h	; 8738
	defb 0c8h,002h,0cfh,0e3h	; 873c
	defb 0d0h,012h,0d7h,0f3h	; 8740
	defb 088h,009h,08fh,0e9h	; 8744
	defb 090h,015h,097h,0f5h	; 8748
	defb 020h,008h,02fh,0f8h	; 874c
	defb 0d0h,015h,057h,0f5h	; 8750
	defb 0a0h,00ah,0afh,0fbh	; 8754
	defb 0d0h,015h,057h,0f5h	; 8758
	defb 0ffh,0ffh,0ffh,0ffh	; 875c
	defb 055h,07fh,0ffh,055h	; 8760
	defb 0abh,0c1h,07fh,0aah	; 8764
	defb 056h,082h,0beh,0d5h	; 8768
	defb 0abh,005h,05fh,06ah	; 876c
	defb 050h,000h,010h,015h	; 8770
	defb 0bbh,0ffh,0d7h,0feh	; 8774
	defb 072h,02bh,0d4h,0bdh	; 8778
	defb 0b3h,017h,0d5h,076h	; 877c
	defb 072h,02bh,0d2h,0bdh	; 8780
	defb 0b3h,017h,09bh,076h	; 8784
	defb 06ah,02bh,0bah,0bdh	; 8788
	defb 0a9h,017h,099h,076h	; 878c
	defb 069h,02bh,02dh,0bdh	; 8790
	defb 0adh,017h,05dh,056h	; 8794
	defb 059h,02bh,02ch,0bdh	; 8798
	defb 0b5h,016h,05eh,0d6h	; 879c
	defb 059h,00ah,0aeh,0bdh	; 87a0
	defb 0b4h,096h,05eh,056h	; 87a4
	defb 068h,08ch,0afh,07dh	; 87a8
	defb 0b4h,095h,05fh,05eh	; 87ac
	defb 068h,08ch,0afh,03dh	; 87b0
	defb 0b0h,099h,05fh,0beh	; 87b4
	defb 068h,04ah,0afh,09dh	; 87b8
	defb 0d0h,049h,057h,0deh	; 87bc
	defb 068h,052h,0afh,0cdh	; 87c0
	defb 0d0h,035h,057h,0ech	; 87c4
	defb 0a0h,022h,0afh,0e5h	; 87c8
	defb 0d0h,005h,057h,0f1h	; 87cc
	defb 0a0h,00ah,0afh,0fbh	; 87d0
	defb 0d0h,015h,057h,0f5h	; 87d4
	defb 0a0h,00ah,0afh,0fbh	; 87d8
	defb 0ffh,0ffh,0ffh,0ffh	; 87dc
	defb 055h,07fh,0ffh,055h	; 87e0
	defb 0abh,0a2h,0bfh,0aah	; 87e4
	defb 057h,045h,07fh,055h	; 87e8
	defb 0aah,082h,0beh,0eah	; 87ec
	defb 054h,001h,000h,055h	; 87f0
	defb 0afh,0fch,0bfh,0fah	; 87f4
	defb 051h,05dh,025h,07dh	; 87f8
	defb 0b2h,0bch,0a2h,0bah	; 87fc
	defb 051h,05dh,025h,07dh	; 8800
	defb 0b2h,0b8h,092h,0bah	; 8804
	defb 051h,059h,055h,07dh	; 8808
	defb 0b0h,0bah,092h,0fah	; 880c
	defb 051h,051h,04dh,07dh	; 8810
	defb 0b0h,0b2h,0aah,0fah	; 8814
	defb 051h,065h,045h,07dh	; 8818
	defb 0b0h,0aah,0a6h,0fah	; 881c
	defb 051h,045h,053h,07dh	; 8820
	defb 0a8h,0cah,0aah,0f2h	; 8824
	defb 069h,085h,059h,075h	; 8828
	defb 0a8h,08ah,0adh,0f6h	; 882c
	defb 069h,005h,05ch,0f5h	; 8830
	defb 0a9h,00ah,0aeh,0f6h	; 8834
	defb 04ah,015h,056h,077h	; 8838
	defb 0eah,00ah,0afh,072h	; 883c
	defb 04ch,015h,057h,037h	; 8840
	defb 0ech,00ah,0afh,0b2h	; 8844
	defb 0c8h,015h,057h,095h	; 8848
	defb 0a0h,00ah,0afh,0c3h	; 884c
	defb 0d0h,015h,057h,0f5h	; 8850
	defb 0a0h,00ah,0afh,0fbh	; 8854
	defb 0d0h,015h,057h,0f5h	; 8858
	defb 0ffh,0ffh,0ffh,0ffh	; 885c
	defb 055h,07fh,0ffh,055h	; 8860
	defb 0abh,0c1h,07fh,0aah	; 8864
	defb 056h,082h,0beh,0d5h	; 8868
	defb 0abh,005h,05fh,06ah	; 886c
	defb 054h,000h,000h,015h	; 8870
	defb 0bfh,0e3h,0ffh,0dah	; 8874
	defb 062h,0e2h,02bh,0cdh	; 8878
	defb 0b1h,062h,017h,04eh	; 887c
	defb 062h,0c2h,02bh,0cdh	; 8880
	defb 0b1h,041h,017h,04eh	; 8884
	defb 062h,0c1h,02bh,0cdh	; 8888
	defb 0b1h,085h,017h,096h	; 888c
	defb 062h,088h,0abh,0b5h	; 8890
	defb 0b1h,084h,097h,096h	; 8894
	defb 063h,00ah,0abh,0bdh	; 8898
	defb 0b5h,004h,057h,09ah	; 889c
	defb 063h,00ah,06fh,0adh	; 88a0
	defb 0b6h,005h,057h,01ah	; 88a4
	defb 062h,00ah,02fh,06dh	; 88a8
	defb 0a6h,005h,037h,056h	; 88ac
	defb 064h,00ah,0afh,06dh	; 88b0
	defb 0a4h,005h,017h,076h	; 88b4
	defb 068h,00ah,09eh,06bh	; 88b8
	defb 0a8h,015h,056h,0f6h	; 88bc
	defb 070h,00ah,08eh,0ebh	; 88c0
	defb 0b0h,015h,04ch,0f6h	; 88c4
	defb 0e0h,00ah,0a5h,0fbh	; 88c8
	defb 080h,015h,051h,0f5h	; 88cc
	defb 0a0h,00ah,0afh,0fbh	; 88d0
	defb 0d0h,015h,057h,0f5h	; 88d4
	defb 0a0h,00ah,0afh,0fbh	; 88d8
	defb 0ffh,0ffh,0ffh,0ffh	; 88dc
	defb 0d0h,015h,057h,0f5h	; 88e0
	defb 0a0h,00ah,0afh,0fbh	; 88e4
	defb 0d0h,015h,057h,0f5h	; 88e8
	defb 0a2h,00ah,0afh,0fbh	; 88ec
	defb 0d3h,015h,057h,075h	; 88f0
	defb 0e2h,00ah,0afh,0fah	; 88f4
	defb 053h,015h,057h,077h	; 88f8
	defb 0e2h,00ah,0afh,0fah	; 88fc
	defb 053h,015h,057h,077h	; 8900
	defb 0eah,00ah,0afh,0eah	; 8904
	defb 073h,015h,057h,075h	; 8908
	defb 0aah,00ah,0afh,0eeh	; 890c
	defb 073h,005h,05fh,075h	; 8910
	defb 0aah,00ah,0afh,0eeh	; 8914
	defb 053h,005h,05fh,07dh	; 8918
	defb 0bah,00ah,0afh,0eah	; 891c
	defb 053h,005h,05fh,07dh	; 8920
	defb 0aah,00ah,0afh,0fah	; 8924
	defb 05bh,005h,05fh,075h	; 8928
	defb 0aeh,00ah,0afh,0eah	; 892c
	defb 057h,005h,05fh,055h	; 8930
	defb 0aah,00ah,0afh,0eah	; 8934
	defb 057h,005h,05fh,055h	; 8938
	defb 0aah,00ah,0afh,0eah	; 893c
	defb 057h,005h,05fh,055h	; 8940
	defb 0aah,00ah,0afh,0eah	; 8944
	defb 057h,005h,05fh,055h	; 8948
	defb 0aah,00ah,0afh,0eah	; 894c
	defb 057h,0ffh,0ffh,0d5h	; 8950
	defb 0abh,000h,000h,0eah	; 8954
	defb 056h,000h,000h,055h	; 8958
	defb 0abh,000h,000h,0aah	; 895c
	defb 000h,000h,000h,001h	; 8960
	defb 000h,000h,000h,003h	; 8964
	defb 015h,055h,055h,057h	; 8968
	defb 02ah,0abh,02ah,0abh	; 896c
	defb 015h,055h,055h,057h	; 8970
	defb 02ah,0abh,02ah,0abh	; 8974
	defb 015h,055h,055h,057h	; 8978
	defb 02ah,0abh,02ah,0abh	; 897c
	defb 015h,055h,055h,057h	; 8980
	defb 02ah,0abh,02ah,0abh	; 8984
	defb 015h,055h,055h,057h	; 8988
	defb 02ah,0abh,02ah,0abh	; 898c
	defb 015h,055h,055h,057h	; 8990
	defb 02ah,0abh,02ah,0abh	; 8994
	defb 015h,055h,055h,057h	; 8998
	defb 03fh,0ffh,0ffh,0ffh	; 899c
	defb 000h,001h,000h,003h	; 89a0
	defb 02ah,0abh,02ah,0abh	; 89a4
	defb 015h,055h,055h,057h	; 89a8
	defb 02ah,0abh,02ah,0abh	; 89ac
	defb 015h,055h,055h,057h	; 89b0
	defb 02ah,0abh,02ah,0abh	; 89b4
	defb 015h,055h,055h,057h	; 89b8
	defb 02ah,0abh,02ah,0abh	; 89bc
	defb 015h,055h,055h,057h	; 89c0
	defb 02ah,0abh,02ah,0abh	; 89c4
	defb 015h,055h,055h,057h	; 89c8
	defb 02ah,0abh,02ah,0abh	; 89cc
	defb 015h,055h,055h,057h	; 89d0
	defb 02ah,0abh,02ah,0abh	; 89d4
	defb 07fh,0ffh,0ffh,0ffh	; 89d8
	defb 0ffh,0ffh,0ffh,0ffh	; 89dc
	defb 000h,005h,040h,001h	; 89e0
	defb 000h,006h,080h,003h	; 89e4
	defb 015h,055h,055h,057h	; 89e8
	defb 02ah,0aeh,08ah,0abh	; 89ec
	defb 015h,055h,055h,057h	; 89f0
	defb 02ah,0afh,0cah,0abh	; 89f4
	defb 015h,054h,015h,057h	; 89f8
	defb 02ah,0ach,00ah,0abh	; 89fc
	defb 015h,057h,0d5h,057h	; 8a00
	defb 02ah,0aeh,08ah,0abh	; 8a04
	defb 015h,055h,055h,057h	; 8a08
	defb 02ah,0afh,0cah,0abh	; 8a0c
	defb 015h,054h,015h,057h	; 8a10
	defb 0ffh,0fch,03fh,0ffh	; 8a14
	defb 054h,0d0h,00dh,0f5h	; 8a18
	defb 0ach,0b1h,08bh,0eah	; 8a1c
	defb 054h,0d1h,08dh,0f5h	; 8a20
	defb 0ach,0b0h,00bh,0eah	; 8a24
	defb 000h,004h,000h,000h	; 8a28
	defb 02ah,0ach,00ah,0abh	; 8a2c
	defb 015h,057h,0d5h,057h	; 8a30
	defb 02ah,0aeh,08ah,0abh	; 8a34
	defb 015h,055h,055h,057h	; 8a38
	defb 02ah,0afh,0cah,0abh	; 8a3c
	defb 015h,057h,0d5h,057h	; 8a40
	defb 02ah,0afh,0cah,0abh	; 8a44
	defb 015h,057h,0d5h,057h	; 8a48
	defb 02ah,0aeh,08ah,0abh	; 8a4c
	defb 015h,055h,055h,057h	; 8a50
	defb 02ah,0aeh,08ah,0abh	; 8a54
	defb 07fh,0fdh,05fh,0ffh	; 8a58
	defb 0ffh,0feh,09fh,0ffh	; 8a5c
	defb 000h,035h,050h,001h	; 8a60
	defb 000h,02ah,0a8h,003h	; 8a64
	defb 015h,075h,051h,057h	; 8a68
	defb 02ah,0aah,0aah,0abh	; 8a6c
	defb 015h,075h,051h,057h	; 8a70
	defb 02ah,0afh,0fah,0abh	; 8a74
	defb 015h,070h,009h,057h	; 8a78
	defb 02ah,0a0h,002h,0abh	; 8a7c
	defb 015h,067h,0e1h,057h	; 8a80
	defb 02ah,0bah,0bah,0abh	; 8a84
	defb 0ffh,0f5h,057h,0ffh	; 8a88
	defb 0aah,06bh,0ebh,0eah	; 8a8c
	defb 054h,054h,037h,0f5h	; 8a90
	defb 0ach,0a8h,01bh,0eah	; 8a94
	defb 054h,0d0h,00dh,0f5h	; 8a98
	defb 0ach,0b1h,08bh,0eah	; 8a9c
	defb 054h,0d1h,08dh,0f5h	; 8aa0
	defb 0ach,0b0h,00bh,0eah	; 8aa4
	defb 054h,0d8h,015h,0f5h	; 8aa8
	defb 0ach,06ch,02bh,0eah	; 8aac
	defb 056h,057h,0d7h,0d5h	; 8ab0
	defb 000h,02ah,0a8h,000h	; 8ab4
	defb 015h,07dh,059h,057h	; 8ab8
	defb 02ah,0bfh,0fah,0abh	; 8abc
	defb 015h,07fh,0f9h,057h	; 8ac0
	defb 02ah,0bfh,0fah,0abh	; 8ac4
	defb 015h,07fh,0f1h,057h	; 8ac8
	defb 02ah,0aah,0aah,0abh	; 8acc
	defb 015h,075h,051h,057h	; 8ad0
	defb 02ah,0aah,0aah,0abh	; 8ad4
	defb 07fh,0f5h,053h,0ffh	; 8ad8
	defb 0ffh,0eah,0abh,0ffh	; 8adc
	defb 000h,0d5h,054h,001h	; 8ae0
	defb 000h,0aah,0aah,003h	; 8ae4
	defb 015h,0d5h,054h,057h	; 8ae8
	defb 02ah,0aah,0aah,0abh	; 8aec
	defb 015h,0d5h,054h,057h	; 8af0
	defb 02ah,0afh,0fah,0abh	; 8af4
	defb 015h,0f0h,00ch,057h	; 8af8
	defb 02ah,0c0h,002h,0abh	; 8afc
	defb 0ffh,087h,0e5h,0ffh	; 8b00
	defb 0abh,01ah,0bah,0aah	; 8b04
	defb 056h,035h,057h,0d5h	; 8b08
	defb 0aah,06bh,0eah,0eah	; 8b0c
	defb 054h,054h,037h,0f5h	; 8b10
	defb 0ach,0a8h,01bh,0eah	; 8b14
	defb 054h,0d0h,00dh,0f5h	; 8b18
	defb 0ach,0b1h,08bh,0eah	; 8b1c
	defb 054h,0d1h,08dh,0f5h	; 8b20
	defb 0ach,0b0h,00bh,0eah	; 8b24
	defb 054h,0d8h,015h,0f5h	; 8b28
	defb 0adh,06ch,02bh,0eah	; 8b2c
	defb 056h,057h,0d7h,0d5h	; 8b30
	defb 0aah,0aah,0afh,0eah	; 8b34
	defb 055h,07dh,05fh,0d5h	; 8b38
	defb 000h,0dfh,0feh,000h	; 8b3c
	defb 015h,0ffh,0feh,057h	; 8b40
	defb 02ah,0bfh,0feh,0abh	; 8b44
	defb 015h,0dfh,0f4h,057h	; 8b48
	defb 02ah,0aah,0aah,0abh	; 8b4c
	defb 015h,0d5h,054h,057h	; 8b50
	defb 02ah,0aah,0aah,0abh	; 8b54
	defb 07fh,0d5h,054h,07fh	; 8b58
	defb 0ffh,0aah,0aah,0ffh	; 8b5c
	defb 001h,055h,055h,001h	; 8b60
	defb 003h,0aah,0aah,003h	; 8b64
	defb 017h,055h,055h,017h	; 8b68
	defb 02bh,0aah,0aah,02bh	; 8b6c
	defb 017h,055h,055h,017h	; 8b70
	defb 02bh,0afh,0fah,02bh	; 8b74
	defb 07fh,070h,00dh,07fh	; 8b78
	defb 0ffh,0c0h,002h,0ffh	; 8b7c
	defb 055h,087h,0e5h,055h	; 8b80
	defb 0abh,01ah,0bah,0aah	; 8b84
	defb 056h,035h,057h,0d5h	; 8b88
	defb 0aah,06bh,0eah,0eah	; 8b8c
	defb 054h,054h,037h,0f5h	; 8b90
	defb 0ach,0a8h,01bh,0eah	; 8b94
	defb 054h,0d0h,00dh,0f5h	; 8b98
	defb 0ach,0b1h,08bh,0eah	; 8b9c
	defb 054h,0d1h,08dh,0f5h	; 8ba0
	defb 0ach,0b0h,00bh,0eah	; 8ba4
	defb 054h,0d8h,015h,0f5h	; 8ba8
	defb 0adh,06ch,02bh,0eah	; 8bac
	defb 056h,057h,0d7h,0d5h	; 8bb0
	defb 0aah,0aah,0afh,0eah	; 8bb4
	defb 055h,07dh,05fh,0d5h	; 8bb8
	defb 0aah,0dfh,0ffh,0aah	; 8bbc
	defb 001h,07fh,0ffh,001h	; 8bc0
	defb 003h,0bfh,0feh,003h	; 8bc4
	defb 017h,05fh,0f5h,017h	; 8bc8
	defb 02bh,0aah,0aah,02bh	; 8bcc
	defb 017h,055h,055h,017h	; 8bd0
	defb 02bh,0aah,0aah,02bh	; 8bd4
	defb 07fh,055h,055h,07fh	; 8bd8
	defb 0ffh,0aah,0aah,0ffh	; 8bdc
	defb 055h,055h,055h,055h	; 8be0
	defb 0aah,0aah,0aah,0aah	; 8be4
	defb 055h,055h,055h,055h	; 8be8
	defb 0aah,0aah,0aah,0aah	; 8bec
	defb 050h,000h,000h,015h	; 8bf0
	defb 0a0h,000h,000h,03ah	; 8bf4
	defb 050h,000h,000h,075h	; 8bf8
	defb 0a0h,0aah,0aah,0fah	; 8bfc
	defb 051h,055h,055h,075h	; 8c00
	defb 0a0h,0aah,0aah,0fah	; 8c04
	defb 051h,055h,055h,075h	; 8c08
	defb 0a0h,0aah,0aah,0fah	; 8c0c
	defb 051h,055h,055h,075h	; 8c10
	defb 0a0h,0aah,0aah,0fah	; 8c14
	defb 051h,055h,055h,075h	; 8c18
	defb 0a0h,0aah,0aah,0fah	; 8c1c
	defb 051h,055h,055h,075h	; 8c20
	defb 0a0h,0aah,0aah,0fah	; 8c24
	defb 051h,055h,055h,075h	; 8c28
	defb 0a0h,0aah,0aah,0fah	; 8c2c
	defb 051h,055h,055h,075h	; 8c30
	defb 0a0h,0aah,0aah,0fah	; 8c34
	defb 051h,055h,055h,075h	; 8c38
	defb 0a0h,0aah,0aah,0fah	; 8c3c
	defb 051h,055h,055h,075h	; 8c40
	defb 0a3h,0ffh,0ffh,0fah	; 8c44
	defb 057h,0ffh,0ffh,0f5h	; 8c48
	defb 0afh,0ffh,0ffh,0fah	; 8c4c
	defb 055h,055h,055h,055h	; 8c50
	defb 0aah,0aah,0aah,0aah	; 8c54
	defb 055h,055h,055h,055h	; 8c58
	defb 0aah,0aah,0aah,0aah	; 8c5c
	defb 055h,055h,055h,055h	; 8c60
	defb 0aah,0aah,0aah,0aah	; 8c64
	defb 055h,055h,055h,055h	; 8c68
	defb 0aah,0aah,0aah,0aah	; 8c6c
	defb 050h,000h,000h,015h	; 8c70
	defb 0a0h,000h,000h,03ah	; 8c74
	defb 050h,000h,000h,075h	; 8c78
	defb 0a0h,0aah,0aah,0fah	; 8c7c
	defb 051h,055h,055h,075h	; 8c80
	defb 0a0h,0aah,0aah,0fah	; 8c84
	defb 051h,055h,055h,075h	; 8c88
	defb 0a0h,0aah,0aah,0fah	; 8c8c
	defb 051h,055h,055h,075h	; 8c90
	defb 0a0h,0aah,0aah,0fah	; 8c94
	defb 051h,054h,055h,075h	; 8c98
	defb 0a0h,0a9h,0aah,0fah	; 8c9c
	defb 051h,055h,095h,075h	; 8ca0
	defb 0a0h,0aah,02ah,0fah	; 8ca4
	defb 051h,055h,055h,075h	; 8ca8
	defb 0a0h,0aah,0aah,0fah	; 8cac
	defb 051h,055h,055h,075h	; 8cb0
	defb 0a0h,0aah,0aah,0fah	; 8cb4
	defb 051h,055h,055h,075h	; 8cb8
	defb 0a0h,0aah,0aah,0fah	; 8cbc
	defb 051h,055h,055h,075h	; 8cc0
	defb 0a3h,0ffh,0ffh,0fah	; 8cc4
	defb 057h,0ffh,0ffh,0f5h	; 8cc8
	defb 0afh,0ffh,0ffh,0fah	; 8ccc
	defb 055h,055h,055h,055h	; 8cd0
	defb 0aah,0aah,0aah,0aah	; 8cd4
	defb 055h,055h,055h,055h	; 8cd8
	defb 0aah,0aah,0aah,0aah	; 8cdc
	defb 055h,055h,055h,055h	; 8ce0
	defb 0aah,0aah,0aah,0aah	; 8ce4
	defb 055h,055h,055h,055h	; 8ce8
	defb 0aah,0aah,0aah,0aah	; 8cec
	defb 050h,000h,000h,015h	; 8cf0
	defb 0a0h,000h,000h,03ah	; 8cf4
	defb 050h,000h,000h,075h	; 8cf8
	defb 0a0h,0aah,0aah,0fah	; 8cfc
	defb 051h,055h,055h,075h	; 8d00
	defb 0a0h,0aah,0aah,0fah	; 8d04
	defb 051h,055h,055h,075h	; 8d08
	defb 0a0h,0aah,02ah,0fah	; 8d0c
	defb 051h,054h,015h,075h	; 8d10
	defb 0a0h,0a8h,00ah,0fah	; 8d14
	defb 051h,050h,005h,075h	; 8d18
	defb 0a0h,0afh,0f2h,0fah	; 8d1c
	defb 051h,04fh,0f5h,075h	; 8d20
	defb 0a0h,0a0h,00ah,0fah	; 8d24
	defb 051h,050h,015h,075h	; 8d28
	defb 0a0h,0a8h,02ah,0fah	; 8d2c
	defb 051h,054h,055h,075h	; 8d30
	defb 0a0h,0aah,0aah,0fah	; 8d34
	defb 051h,055h,055h,075h	; 8d38
	defb 0a0h,0aah,0aah,0fah	; 8d3c
	defb 051h,055h,055h,075h	; 8d40
	defb 0a3h,0ffh,0ffh,0fah	; 8d44
	defb 057h,0ffh,0ffh,0f5h	; 8d48
	defb 0afh,0ffh,0ffh,0fah	; 8d4c
	defb 055h,055h,055h,055h	; 8d50
	defb 0aah,0aah,0aah,0aah	; 8d54
	defb 055h,055h,055h,055h	; 8d58
	defb 0aah,0aah,0aah,0aah	; 8d5c
	defb 055h,055h,055h,055h	; 8d60
	defb 0aah,0aah,0aah,0aah	; 8d64
	defb 055h,055h,055h,055h	; 8d68
	defb 0aah,0aah,0aah,0aah	; 8d6c
	defb 050h,000h,000h,015h	; 8d70
	defb 0a0h,000h,000h,03ah	; 8d74
	defb 050h,000h,000h,075h	; 8d78
	defb 0a0h,0aah,055h,07ah	; 8d7c
	defb 051h,054h,02ah,0f5h	; 8d80
	defb 0a0h,0a8h,015h,07ah	; 8d84
	defb 051h,050h,00ah,0f5h	; 8d88
	defb 0a0h,0a0h,005h,07ah	; 8d8c
	defb 051h,040h,002h,0f5h	; 8d90
	defb 0a0h,080h,001h,07ah	; 8d94
	defb 051h,000h,000h,0f5h	; 8d98
	defb 0a0h,0ffh,0ffh,07ah	; 8d9c
	defb 050h,0ffh,0ffh,075h	; 8da0
	defb 0a1h,000h,000h,0fah	; 8da4
	defb 050h,080h,001h,075h	; 8da8
	defb 0a1h,040h,002h,0fah	; 8dac
	defb 050h,0a0h,005h,075h	; 8db0
	defb 0a1h,050h,00ah,0fah	; 8db4
	defb 050h,0a8h,015h,075h	; 8db8
	defb 0a1h,054h,02ah,0fah	; 8dbc
	defb 050h,0aah,055h,075h	; 8dc0
	defb 0a3h,0ffh,0ffh,0fah	; 8dc4
	defb 057h,0ffh,0ffh,0f5h	; 8dc8
	defb 0afh,0ffh,0ffh,0fah	; 8dcc
	defb 055h,055h,055h,055h	; 8dd0
	defb 0aah,0aah,0aah,0aah	; 8dd4
	defb 055h,055h,055h,055h	; 8dd8
	defb 0aah,0aah,0aah,0aah	; 8ddc
	defb 055h,055h,055h,055h	; 8de0
	defb 0aah,0aah,0aah,0aah	; 8de4
	defb 055h,055h,055h,055h	; 8de8
	defb 0aah,0aah,0aah,0aah	; 8dec
	defb 050h,000h,000h,015h	; 8df0
	defb 0a0h,000h,000h,03ah	; 8df4
	defb 050h,000h,000h,075h	; 8df8
	defb 0a0h,0aah,055h,07ah	; 8dfc
	defb 051h,054h,02ah,0f5h	; 8e00
	defb 0a0h,0a8h,015h,07ah	; 8e04
	defb 051h,050h,00ah,0f5h	; 8e08
	defb 0a0h,0a0h,005h,07ah	; 8e0c
	defb 051h,040h,002h,0f5h	; 8e10
	defb 0a0h,080h,009h,07ah	; 8e14
	defb 051h,000h,010h,0f5h	; 8e18
	defb 0a0h,0ffh,0d2h,07ah	; 8e1c
	defb 050h,0ffh,0d5h,075h	; 8e20
	defb 0a1h,000h,012h,0fah	; 8e24
	defb 050h,080h,009h,075h	; 8e28
	defb 0a1h,040h,002h,0fah	; 8e2c
	defb 050h,0a0h,005h,075h	; 8e30
	defb 0a1h,050h,00ah,0fah	; 8e34
	defb 050h,0a8h,015h,075h	; 8e38
	defb 0a1h,054h,02ah,0fah	; 8e3c
	defb 050h,0aah,055h,075h	; 8e40
	defb 0a3h,0ffh,0ffh,0fah	; 8e44
	defb 057h,0ffh,0ffh,0f5h	; 8e48
	defb 0afh,0ffh,0ffh,0fah	; 8e4c
	defb 055h,055h,055h,055h	; 8e50
	defb 0aah,0aah,0aah,0aah	; 8e54
	defb 055h,055h,055h,055h	; 8e58
	defb 0aah,0aah,0aah,0aah	; 8e5c
	defb 055h,055h,055h,055h	; 8e60
	defb 0aah,0aah,0aah,0aah	; 8e64
	defb 055h,055h,055h,055h	; 8e68
	defb 0aah,0aah,0aah,0aah	; 8e6c
	defb 050h,000h,000h,015h	; 8e70
	defb 0a0h,000h,000h,03ah	; 8e74
	defb 050h,000h,000h,075h	; 8e78
	defb 0a0h,0aah,055h,07ah	; 8e7c
	defb 051h,054h,02ah,0f5h	; 8e80
	defb 0a0h,0a8h,015h,07ah	; 8e84
	defb 051h,050h,01ah,0f5h	; 8e88
	defb 0a0h,0a0h,005h,07ah	; 8e8c
	defb 051h,040h,03ah,0f5h	; 8e90
	defb 0a0h,080h,041h,07ah	; 8e94
	defb 051h,000h,08ah,0f5h	; 8e98
	defb 0a0h,0feh,095h,07ah	; 8e9c
	defb 050h,0feh,0afh,075h	; 8ea0
	defb 0a1h,000h,09ch,0fah	; 8ea4
	defb 050h,080h,069h,075h	; 8ea8
	defb 0a1h,040h,03ah,0fah	; 8eac
	defb 050h,0a0h,005h,075h	; 8eb0
	defb 0a1h,050h,01ah,0fah	; 8eb4
	defb 050h,0a8h,015h,075h	; 8eb8
	defb 0a1h,054h,02ah,0fah	; 8ebc
	defb 050h,0aah,055h,075h	; 8ec0
	defb 0a3h,0ffh,0ffh,0fah	; 8ec4
	defb 057h,0ffh,0ffh,0f5h	; 8ec8
	defb 0afh,0ffh,0ffh,0fah	; 8ecc
	defb 055h,055h,055h,055h	; 8ed0
	defb 0aah,0aah,0aah,0aah	; 8ed4
	defb 055h,055h,055h,055h	; 8ed8
	defb 0aah,0aah,0aah,0aah	; 8edc
	defb 055h,055h,055h,055h	; 8ee0
	defb 0aah,0aah,0aah,0aah	; 8ee4
	defb 055h,055h,055h,055h	; 8ee8
	defb 0aah,0aah,0aah,0aah	; 8eec
	defb 050h,000h,000h,015h	; 8ef0
	defb 0a0h,000h,000h,03ah	; 8ef4
	defb 050h,000h,000h,075h	; 8ef8
	defb 0a0h,0aah,055h,07ah	; 8efc
	defb 051h,055h,0aah,0f5h	; 8f00
	defb 0a0h,0a9h,095h,07ah	; 8f04
	defb 051h,051h,08ah,0f5h	; 8f08
	defb 0a0h,0a0h,005h,07ah	; 8f0c
	defb 051h,043h,0c2h,0f5h	; 8f10
	defb 0a0h,084h,021h,07ah	; 8f14
	defb 051h,008h,0b0h,0f5h	; 8f18
	defb 0a0h,0e9h,057h,07ah	; 8f1c
	defb 050h,0eah,0f7h,075h	; 8f20
	defb 0a1h,009h,0d0h,0fah	; 8f24
	defb 050h,086h,0a1h,075h	; 8f28
	defb 0a1h,043h,0c2h,0fah	; 8f2c
	defb 050h,0a0h,005h,075h	; 8f30
	defb 0a1h,051h,08ah,0fah	; 8f34
	defb 050h,0a9h,095h,075h	; 8f38
	defb 0a1h,055h,0aah,0fah	; 8f3c
	defb 050h,0aah,055h,075h	; 8f40
	defb 0a3h,0ffh,0ffh,0fah	; 8f44
	defb 057h,0ffh,0ffh,0f5h	; 8f48
	defb 0afh,0ffh,0ffh,0fah	; 8f4c
	defb 055h,055h,055h,055h	; 8f50
	defb 0aah,0aah,0aah,0aah	; 8f54
	defb 055h,055h,055h,055h	; 8f58
	defb 0aah,0aah,0aah,0aah	; 8f5c
	defb 000h,001h,000h,000h	; 8f60
	defb 07fh,0fch,0bfh,0feh	; 8f64
	defb 040h,004h,020h,006h	; 8f68
	defb 043h,072h,04eh,0ceh	; 8f6c
	defb 040h,002h,040h,01eh	; 8f70
	defb 057h,0ffh,0ffh,0fah	; 8f74
	defb 054h,000h,000h,05ah	; 8f78
	defb 044h,000h,000h,0deh	; 8f7c
	defb 044h,0ffh,0fdh,0deh	; 8f80
	defb 054h,0aah,0a9h,0dah	; 8f84
	defb 054h,0d5h,055h,0dah	; 8f88
	defb 054h,0a0h,039h,0dah	; 8f8c
	defb 044h,0c0h,075h,0deh	; 8f90
	defb 064h,0a7h,0b9h,0deh	; 8f94
	defb 01ch,0c5h,035h,0d8h	; 8f98
	defb 084h,0a6h,0b9h,0c2h	; 8f9c
	defb 044h,0c5h,035h,0c1h	; 8fa0
	defb 01ch,0a0h,039h,0d8h	; 8fa4
	defb 064h,0c7h,0f5h,0deh	; 8fa8
	defb 044h,0afh,0f9h,0deh	; 8fac
	defb 054h,0d5h,055h,0dah	; 8fb0
	defb 054h,0aah,0a9h,0dah	; 8fb4
	defb 044h,000h,001h,0deh	; 8fb8
	defb 054h,0ffh,0ffh,0dah	; 8fbc
	defb 055h,0ffh,0ffh,0dah	; 8fc0
	defb 057h,0ffh,0ffh,0dah	; 8fc4
	defb 044h,000h,000h,01eh	; 8fc8
	defb 04fh,0feh,07fh,0feh	; 8fcc
	defb 05fh,0feh,07fh,0feh	; 8fd0
	defb 072h,04ch,032h,04eh	; 8fd4
	defb 07fh,0fdh,03fh,0feh	; 8fd8
	defb 000h,000h,080h,000h	; 8fdc
	defb 000h,001h,000h,000h	; 8fe0
	defb 07fh,0fch,0bfh,0feh	; 8fe4
	defb 040h,004h,020h,006h	; 8fe8
	defb 043h,072h,04eh,0ceh	; 8fec
	defb 040h,002h,040h,01eh	; 8ff0
	defb 057h,0ffh,0ffh,0feh	; 8ff4
	defb 054h,000h,000h,05eh	; 8ff8
	defb 044h,000h,000h,0deh	; 8ffc
	defb 044h,0ffh,0fdh,0deh	; 9000
	defb 044h,0aah,0a9h,0dah	; 9004
	defb 044h,0d5h,055h,0dah	; 9008
	defb 044h,0bfh,0e9h,0dah	; 900c
	defb 044h,0dfh,0c5h,0deh	; 9010
	defb 064h,0b8h,049h,0deh	; 9014
	defb 01ch,0d9h,045h,0d8h	; 9018
	defb 084h,0bah,0c9h,0c2h	; 901c
	defb 044h,0d9h,045h,0c1h	; 9020
	defb 01ch,0bbh,0c9h,0d8h	; 9024
	defb 064h,0d8h,005h,0deh	; 9028
	defb 044h,0b0h,009h,0deh	; 902c
	defb 054h,0d5h,055h,0dah	; 9030
	defb 054h,0aah,0a9h,0dah	; 9034
	defb 044h,000h,001h,0deh	; 9038
	defb 054h,0ffh,0ffh,0dah	; 903c
	defb 055h,0ffh,0ffh,0dah	; 9040
	defb 057h,0ffh,0ffh,0dah	; 9044
	defb 044h,000h,000h,01eh	; 9048
	defb 04fh,0feh,07fh,0feh	; 904c
	defb 05fh,0feh,07fh,0feh	; 9050
	defb 072h,04ch,033h,0ceh	; 9054
	defb 07fh,0fdh,03fh,0feh	; 9058
	defb 000h,000h,080h,000h	; 905c
	defb 055h,05fh,0f5h,055h	; 9060
	defb 080h,0bfh,0e2h,002h	; 9064
	defb 001h,0ddh,044h,007h	; 9068
	defb 08bh,0bah,0a2h,02eh	; 906c
	defb 015h,0ddh,044h,057h	; 9070
	defb 0bfh,0bah,0a2h,0feh	; 9074
	defb 07fh,0ddh,045h,0ffh	; 9078
	defb 0aah,0bah,0a2h,0aah	; 907c
	defb 0ffh,0fdh,047h,0ffh	; 9080
	defb 0ffh,0fah,0afh,0feh	; 9084
	defb 0ffh,0ffh,0ffh,0fch	; 9088
	defb 0eah,0aah,0aah,0a8h	; 908c
	defb 0f0h,000h,000h,000h	; 9090
	defb 0e3h,0ffh,0ffh,0c8h	; 9094
	defb 0f2h,000h,000h,040h	; 9098
	defb 0e2h,0eeh,077h,048h	; 909c
	defb 0f2h,0eeh,077h,040h	; 90a0
	defb 0e2h,000h,000h,048h	; 90a4
	defb 0f3h,0ffh,0ffh,0c0h	; 90a8
	defb 0e0h,000h,000h,008h	; 90ac
	defb 0f5h,055h,055h,050h	; 90b0
	defb 0e0h,000h,000h,000h	; 90b4
	defb 0c0h,005h,040h,000h	; 90b8
	defb 080h,00ah,0a0h,000h	; 90bc
	defb 055h,05dh,045h,055h	; 90c0
	defb 080h,0bah,0a2h,002h	; 90c4
	defb 001h,0ddh,044h,007h	; 90c8
	defb 08bh,0bah,0a2h,02eh	; 90cc
	defb 015h,0ddh,044h,057h	; 90d0
	defb 0bfh,0bah,0a2h,0feh	; 90d4
	defb 07fh,0d0h,005h,0ffh	; 90d8
	defb 0aah,0a0h,002h,0aah	; 90dc
	defb 055h,055h,055h,055h	; 90e0
	defb 0abh,0ffh,0ffh,0eah	; 90e4
	defb 054h,000h,000h,015h	; 90e8
	defb 0a9h,0ffh,0ffh,0cah	; 90ec
	defb 053h,0ffh,0ffh,025h	; 90f0
	defb 0a6h,0aah,0aah,092h	; 90f4
	defb 067h,07fh,0ffh,04fh	; 90f8
	defb 0a6h,0c0h,001h,08eh	; 90fc
	defb 067h,055h,055h,04fh	; 9100
	defb 0a6h,0cfh,0f9h,08eh	; 9104
	defb 067h,050h,005h,04fh	; 9108
	defb 0a6h,0cfh,0f9h,08eh	; 910c
	defb 067h,055h,055h,04fh	; 9110
	defb 0a6h,0c0h,001h,08eh	; 9114
	defb 053h,07fh,0ffh,05dh	; 9118
	defb 0aah,0aah,0aah,09ah	; 911c
	defb 05fh,000h,000h,03dh	; 9120
	defb 0afh,080h,000h,0fah	; 9124
	defb 057h,0ffh,0ffh,0f5h	; 9128
	defb 0abh,0feh,0ffh,0eah	; 912c
	defb 055h,0fdh,07fh,0d5h	; 9130
	defb 0b2h,0a8h,0fah,0b2h	; 9134
	defb 055h,05dh,075h,055h	; 9138
	defb 0b3h,028h,0fbh,032h	; 913c
	defb 055h,05dh,075h,055h	; 9140
	defb 0b3h,028h,0fbh,032h	; 9144
	defb 055h,05dh,075h,055h	; 9148
	defb 0aah,0bfh,0fah,0aah	; 914c
	defb 057h,0e2h,0bfh,0f5h	; 9150
	defb 0bch,005h,057h,0feh	; 9154
	defb 0ffh,0ffh,0ffh,0ffh	; 9158
	defb 000h,000h,000h,000h	; 915c
	defb 055h,040h,005h,055h	; 9160
	defb 0aah,08fh,0f0h,0aah	; 9164
	defb 054h,030h,00ch,055h	; 9168
	defb 0a8h,0c0h,003h,02ah	; 916c
	defb 051h,000h,000h,095h	; 9170
	defb 0a2h,002h,0a4h,0cah	; 9174
	defb 044h,015h,051h,065h	; 9178
	defb 088h,02fh,0eah,0b2h	; 917c
	defb 050h,05ch,0b5h,0d9h	; 9180
	defb 090h,0b1h,02eh,0f8h	; 9184
	defb 021h,062h,047h,07dh	; 9188
	defb 022h,0c4h,08bh,0bch	; 918c
	defb 041h,089h,013h,07eh	; 9190
	defb 042h,092h,025h,0beh	; 9194
	defb 045h,0a4h,049h,0deh	; 9198
	defb 043h,048h,091h,0beh	; 919c
	defb 045h,091h,022h,0deh	; 91a0
	defb 043h,022h,044h,0beh	; 91a4
	defb 045h,0c4h,089h,0deh	; 91a8
	defb 042h,089h,013h,0beh	; 91ac
	defb 021h,092h,025h,07ch	; 91b0
	defb 0a4h,0e4h,04bh,0bch	; 91b4
	defb 011h,068h,09fh,079h	; 91b8
	defb 092h,0b9h,03ah,0fah	; 91bc
	defb 049h,05fh,0f5h,0f1h	; 91c0
	defb 0a6h,0eah,0abh,0e2h	; 91c4
	defb 053h,0b5h,05fh,0c5h	; 91c8
	defb 0a9h,0ffh,0ffh,08ah	; 91cc
	defb 054h,0ffh,0ffh,015h	; 91d0
	defb 0aah,03fh,0fch,02ah	; 91d4
	defb 055h,00fh,0f1h,055h	; 91d8
	defb 0aah,0a0h,002h,0aah	; 91dc
	defb 055h,055h,055h,055h	; 91e0
	defb 0aah,0aah,0aah,0aah	; 91e4
	defb 055h,0ffh,0ffh,0ffh	; 91e8
	defb 0abh,0ffh,0ffh,0ffh	; 91ec
	defb 057h,055h,055h,055h	; 91f0
	defb 0aeh,0aah,0aah,0aah	; 91f4
	defb 05dh,055h,055h,055h	; 91f8
	defb 0bah,0a8h,000h,02ah	; 91fc
	defb 075h,050h,000h,075h	; 9200
	defb 0bah,0a2h,0aah,0bah	; 9204
	defb 075h,045h,055h,05dh	; 9208
	defb 0bah,08ah,0feh,0aeh	; 920c
	defb 075h,017h,0d7h,0d7h	; 9210
	defb 0bah,02eh,0aah,0ebh	; 9214
	defb 074h,05dh,055h,075h	; 9218
	defb 0b8h,0bah,0aah,0bah	; 921c
	defb 071h,075h,055h,0edh	; 9220
	defb 0b8h,0eah,0aah,0beh	; 9224
	defb 071h,055h,07fh,0f5h	; 9228
	defb 0b8h,0eah,0c6h,0beh	; 922c
	defb 071h,0d5h,0bbh,0ffh	; 9230
	defb 0b8h,0abh,07dh,0feh	; 9234
	defb 071h,0d5h,07dh,0ffh	; 9238
	defb 0b8h,0abh,07dh,0feh	; 923c
	defb 071h,0d7h,0bbh,0ffh	; 9240
	defb 0b8h,0eah,0c7h,0feh	; 9244
	defb 071h,057h,0bfh,0fdh	; 9248
	defb 0b8h,0fah,0ffh,0feh	; 924c
	defb 071h,077h,0ffh,0fdh	; 9250
	defb 0b8h,0bbh,0ffh,0fah	; 9254
	defb 074h,05eh,0ffh,0f5h	; 9258
	defb 0bah,02fh,0ffh,0ebh	; 925c
	defb 055h,055h,055h,055h	; 9260
	defb 0aah,0aah,0aah,0aah	; 9264
	defb 0ffh,0ffh,0ffh,055h	; 9268
	defb 0ffh,0ffh,0feh,02ah	; 926c
	defb 055h,055h,055h,015h	; 9270
	defb 0aah,0aah,0aah,08ah	; 9274
	defb 055h,055h,055h,045h	; 9278
	defb 0a8h,0aah,0aah,0e2h	; 927c
	defb 057h,000h,000h,011h	; 9280
	defb 0aah,030h,00ch,0a2h	; 9284
	defb 055h,034h,02ch,051h	; 9288
	defb 0aah,034h,02ch,0a2h	; 928c
	defb 055h,034h,02ch,051h	; 9290
	defb 0a8h,034h,02ch,0e2h	; 9294
	defb 0d7h,034h,02ch,011h	; 9298
	defb 0eah,004h,020h,0a2h	; 929c
	defb 075h,004h,020h,051h	; 92a0
	defb 0eah,004h,020h,0a2h	; 92a4
	defb 075h,034h,02ch,051h	; 92a8
	defb 0e8h,034h,02ch,0e2h	; 92ac
	defb 077h,034h,02ch,011h	; 92b0
	defb 0eah,034h,02ch,0a2h	; 92b4
	defb 075h,034h,02ch,051h	; 92b8
	defb 0eah,034h,02ch,0a2h	; 92bc
	defb 075h,034h,02ch,051h	; 92c0
	defb 0e8h,004h,020h,0e2h	; 92c4
	defb 077h,004h,020h,011h	; 92c8
	defb 0eah,004h,020h,0a2h	; 92cc
	defb 075h,034h,02ch,051h	; 92d0
	defb 0eah,034h,02ch,0a2h	; 92d4
	defb 0d5h,034h,02ch,051h	; 92d8
	defb 0a8h,034h,02ch,0e2h	; 92dc
	defb 055h,055h,000h,000h	; 92e0
	defb 0a0h,02ah,01fh,0ffh	; 92e4
	defb 040h,074h,07fh,0ffh	; 92e8
	defb 08ah,0e8h,0ffh,0ffh	; 92ec
	defb 017h,0d1h,0c8h,000h	; 92f0
	defb 08fh,0a3h,098h,011h	; 92f4
	defb 01fh,047h,004h,011h	; 92f8
	defb 08eh,08eh,00ch,01fh	; 92fc
	defb 01dh,01ch,002h,00ch	; 9300
	defb 09ah,038h,036h,07fh	; 9304
	defb 014h,070h,031h,07fh	; 9308
	defb 0a8h,0e0h,033h,000h	; 930c
	defb 051h,0c7h,0e0h,080h	; 9310
	defb 0a3h,087h,0d1h,080h	; 9314
	defb 047h,006h,020h,040h	; 9318
	defb 08eh,006h,010h,0c0h	; 931c
	defb 01ch,01eh,020h,020h	; 9320
	defb 038h,016h,010h,060h	; 9324
	defb 030h,016h,0b0h,010h	; 9328
	defb 074h,017h,070h,030h	; 932c
	defb 07dh,010h,030h,015h	; 9330
	defb 073h,040h,030h,03fh	; 9334
	defb 070h,0d0h,030h,060h	; 9338
	defb 070h,034h,030h,041h	; 933c
	defb 070h,00dh,011h,080h	; 9340
	defb 070h,003h,041h,03dh	; 9344
	defb 076h,010h,0d6h,07ch	; 9348
	defb 072h,010h,03ch,085h	; 934c
	defb 072h,07fh,08ch,084h	; 9350
	defb 072h,040h,024h,081h	; 9354
	defb 072h,040h,02ch,002h	; 9358
	defb 072h,046h,025h,055h	; 935c
	defb 000h,000h,055h,055h	; 9360
	defb 0ffh,0fch,020h,00ah	; 9364
	defb 0ffh,0ffh,010h,01dh	; 9368
	defb 0ffh,0ffh,088h,0aeh	; 936c
	defb 000h,01fh,0c4h,017h	; 9370
	defb 000h,009h,0e2h,00eh	; 9374
	defb 000h,030h,0f1h,007h	; 9378
	defb 000h,010h,078h,08eh	; 937c
	defb 000h,060h,03ch,047h	; 9380
	defb 0f0h,020h,01eh,026h	; 9384
	defb 0feh,0cfh,08fh,017h	; 9388
	defb 030h,040h,087h,08ah	; 938c
	defb 03dh,09eh,083h,0c5h	; 9390
	defb 038h,0beh,081h,0e2h	; 9394
	defb 033h,006h,080h,0f1h	; 9398
	defb 031h,03eh,0feh,078h	; 939c
	defb 036h,03eh,001h,03ch	; 93a0
	defb 022h,037h,0fdh,09ch	; 93a4
	defb 02ch,037h,0fdh,00eh	; 93a8
	defb 004h,030h,00ch,02eh	; 93ac
	defb 05ch,030h,008h,0beh	; 93b0
	defb 0fch,030h,002h,0ceh	; 93b4
	defb 082h,030h,00bh,00eh	; 93b8
	defb 0b3h,030h,02ch,00eh	; 93bc
	defb 0b0h,090h,0b1h,00eh	; 93c0
	defb 0b0h,0c2h,0c5h,00eh	; 93c4
	defb 0b0h,02bh,00dh,00eh	; 93c8
	defb 081h,03ch,00dh,00eh	; 93cc
	defb 003h,091h,00dh,00eh	; 93d0
	defb 046h,031h,08dh,00eh	; 93d4
	defb 0a0h,010h,0cdh,00eh	; 93d8
	defb 0eah,0b0h,0cdh,00eh	; 93dc
	defb 0ffh,0ffh,0ffh,0ffh	; 93e0
	defb 0ffh,0ffh,0ffh,0ffh	; 93e4
	defb 0f8h,00fh,000h,0f0h	; 93e8
	defb 0fch,007h,080h,070h	; 93ec
	defb 0dfh,0ffh,0ffh,0ffh	; 93f0
	defb 0c8h,000h,000h,000h	; 93f4
	defb 0cbh,0ffh,0ffh,0ffh	; 93f8
	defb 0cbh,03ch,03ch,03ch	; 93fc
	defb 0cah,0ffh,0ffh,0ffh	; 9400
	defb 0cah,080h,000h,000h	; 9404
	defb 0eah,0bfh,0ffh,0ffh	; 9408
	defb 0fbh,0a6h,066h,066h	; 940c
	defb 0fbh,0b9h,099h,099h	; 9410
	defb 0cbh,0a6h,066h,066h	; 9414
	defb 0cah,0b9h,099h,099h	; 9418
	defb 0cah,0a6h,000h,060h	; 941c
	defb 0cah,0b9h,081h,098h	; 9420
	defb 0cah,0a6h,000h,060h	; 9424
	defb 0cbh,0b9h,099h,099h	; 9428
	defb 0fbh,0a6h,066h,066h	; 942c
	defb 0fbh,0b9h,099h,099h	; 9430
	defb 0eah,0a0h,000h,000h	; 9434
	defb 0cah,080h,000h,000h	; 9438
	defb 0cah,0ffh,0ffh,0ffh	; 943c
	defb 0cbh,03ch,03ch,03ch	; 9440
	defb 0cbh,0ffh,0ffh,0ffh	; 9444
	defb 0c8h,000h,000h,000h	; 9448
	defb 0d8h,000h,000h,000h	; 944c
	defb 0f3h,0fch,07fh,08fh	; 9450
	defb 0e7h,0f8h,0ffh,00fh	; 9454
	defb 0c0h,000h,000h,000h	; 9458
	defb 080h,000h,000h,000h	; 945c
	defb 0ffh,0ffh,0ffh,0feh	; 9460
	defb 0ffh,0ffh,0ffh,0fch	; 9464
	defb 00fh,000h,0f0h,018h	; 9468
	defb 00eh,001h,0e0h,030h	; 946c
	defb 0ffh,0ffh,0ffh,0e4h	; 9470
	defb 000h,000h,000h,00ch	; 9474
	defb 0ffh,0ffh,0ffh,0cch	; 9478
	defb 03ch,03ch,03ch,0cch	; 947c
	defb 0ffh,0ffh,0ffh,04ch	; 9480
	defb 000h,000h,001h,04ch	; 9484
	defb 0ffh,0ffh,0fdh,048h	; 9488
	defb 066h,066h,061h,0c0h	; 948c
	defb 099h,099h,099h,0c0h	; 9490
	defb 066h,066h,061h,0cch	; 9494
	defb 099h,099h,099h,04ch	; 9498
	defb 006h,000h,061h,04ch	; 949c
	defb 019h,081h,099h,04ch	; 94a0
	defb 006h,000h,061h,04ch	; 94a4
	defb 099h,099h,099h,0cch	; 94a8
	defb 066h,066h,061h,0c0h	; 94ac
	defb 099h,099h,099h,0c0h	; 94b0
	defb 000h,000h,001h,048h	; 94b4
	defb 000h,000h,001h,04ch	; 94b8
	defb 0ffh,0ffh,0ffh,04ch	; 94bc
	defb 03ch,03ch,03ch,0cch	; 94c0
	defb 0ffh,0ffh,0ffh,0cch	; 94c4
	defb 000h,000h,000h,00ch	; 94c8
	defb 000h,000h,000h,004h	; 94cc
	defb 0f1h,0feh,03fh,0c0h	; 94d0
	defb 0f0h,0ffh,01fh,0e0h	; 94d4
	defb 000h,000h,000h,000h	; 94d8
	defb 000h,000h,000h,000h	; 94dc
	defb 055h,055h,055h,055h	; 94e0
	defb 0b2h,0cbh,02ch,0a0h	; 94e4
	defb 055h,055h,055h,040h	; 94e8
	defb 0a0h,000h,0aah,08ah	; 94ec
	defb 040h,001h,055h,015h	; 94f0
	defb 0e2h,0abh,0aah,02fh	; 94f4
	defb 005h,055h,0d4h,05fh	; 94f8
	defb 0a3h,0fah,0e8h,0bah	; 94fc
	defb 045h,0f1h,071h,074h	; 9500
	defb 0a3h,0a8h,0b2h,0e9h	; 9504
	defb 045h,0d4h,055h,0d3h	; 9508
	defb 0e3h,0aah,02bh,0a7h	; 950c
	defb 005h,0d5h,017h,04fh	; 9510
	defb 0a3h,0aah,02eh,09fh	; 9514
	defb 045h,0d4h,05dh,03fh	; 9518
	defb 0a2h,0e8h,0bah,07fh	; 951c
	defb 051h,071h,074h,0ffh	; 9520
	defb 0e8h,0b2h,0e9h,0fbh	; 9524
	defb 014h,055h,0d3h,0f3h	; 9528
	defb 0aah,02bh,0a9h,0e3h	; 952c
	defb 055h,017h,054h,0c7h	; 9530
	defb 0aah,02eh,08ah,06fh	; 9534
	defb 054h,05dh,025h,03eh	; 9538
	defb 0e8h,0bah,072h,09ch	; 953c
	defb 011h,074h,0f9h,049h	; 9540
	defb 0a2h,0e9h,0fch,0a2h	; 9544
	defb 045h,0d3h,0f6h,054h	; 9548
	defb 08bh,0a7h,0e3h,028h	; 954c
	defb 017h,04fh,0c7h,091h	; 9550
	defb 08eh,09fh,08fh,022h	; 9554
	defb 017h,03fh,0feh,045h	; 9558
	defb 08eh,03fh,0fch,08bh	; 955c
	defb 055h,055h,055h,055h	; 9560
	defb 002h,0cbh,02ch,0b2h	; 9564
	defb 005h,055h,055h,055h	; 9568
	defb 0aeh,0aah,080h,00ah	; 956c
	defb 057h,055h,000h,01fh	; 9570
	defb 0fbh,0aah,02ah,0b8h	; 9574
	defb 0f5h,0d4h,055h,05dh	; 9578
	defb 0a2h,0e8h,0bfh,0bah	; 957c
	defb 051h,071h,07fh,05dh	; 9580
	defb 028h,0b2h,0eah,03ah	; 9584
	defb 094h,055h,0d4h,05fh	; 9588
	defb 0cah,02bh,0aah,038h	; 958c
	defb 0e5h,017h,054h,05dh	; 9590
	defb 0f2h,08bh,0aah,03ah	; 9594
	defb 0f9h,045h,0d4h,05dh	; 9598
	defb 0fch,0a2h,0e8h,0bah	; 959c
	defb 0feh,051h,071h,077h	; 95a0
	defb 0dfh,028h,0b2h,0e8h	; 95a4
	defb 0cfh,094h,055h,0d5h	; 95a8
	defb 0c7h,02ah,02bh,0aah	; 95ac
	defb 0e2h,055h,017h,055h	; 95b0
	defb 0f4h,0a2h,08bh,0aah	; 95b4
	defb 0f9h,049h,045h,0d7h	; 95b8
	defb 072h,09ch,0a2h,0e8h	; 95bc
	defb 025h,03eh,051h,075h	; 95c0
	defb 08ah,07fh,028h,0bah	; 95c4
	defb 0d4h,0efh,094h,05dh	; 95c8
	defb 0e9h,0c7h,0cah,02eh	; 95cc
	defb 073h,0e3h,0e5h,017h	; 95d0
	defb 0b9h,0f1h,0f2h,08eh	; 95d4
	defb 05ch,0ffh,0f9h,017h	; 95d8
	defb 02eh,07fh,0fch,08eh	; 95dc
	defb 075h,015h,0ffh,057h	; 95e0
	defb 0bah,08ah,0aah,0aeh	; 95e4
	defb 075h,045h,055h,05dh	; 95e8
	defb 0bah,0a3h,0ffh,0fah	; 95ec
	defb 075h,057h,0ffh,0f5h	; 95f0
	defb 0bah,0aah,0aah,0aah	; 95f4
	defb 075h,055h,055h,055h	; 95f8
	defb 0bah,0aah,0aah,0aah	; 95fc
	defb 075h,057h,0ffh,0ffh	; 9600
	defb 0bah,0a8h,000h,003h	; 9604
	defb 075h,050h,000h,00fh	; 9608
	defb 0bah,0a7h,039h,0dfh	; 960c
	defb 075h,040h,000h,01fh	; 9610
	defb 0bah,0ffh,0ffh,0ffh	; 9614
	defb 075h,0aah,0aah,0beh	; 9618
	defb 0bah,0d5h,055h,07ch	; 961c
	defb 075h,080h,000h,03ch	; 9620
	defb 0bah,0d5h,055h,07ch	; 9624
	defb 075h,0aah,0aah,0bch	; 9628
	defb 0bah,0ffh,0ffh,0fch	; 962c
	defb 075h,07fh,0ffh,0deh	; 9630
	defb 0bah,0b1h,08ch,06fh	; 9634
	defb 075h,05fh,0ffh,0f3h	; 9638
	defb 0bah,0afh,0ffh,0ffh	; 963c
	defb 075h,055h,055h,055h	; 9640
	defb 0bah,0aah,0aah,0aah	; 9644
	defb 05dh,055h,055h,055h	; 9648
	defb 0aeh,0aah,0aah,0aah	; 964c
	defb 057h,000h,000h,000h	; 9650
	defb 0aah,000h,000h,000h	; 9654
	defb 055h,055h,055h,055h	; 9658
	defb 0aah,0aah,0aah,0aah	; 965c
	defb 057h,034h,02ch,011h	; 9660
	defb 0aah,034h,02ch,0a2h	; 9664
	defb 055h,034h,02ch,051h	; 9668
	defb 0aah,004h,020h,0a2h	; 966c
	defb 055h,004h,020h,051h	; 9670
	defb 0a8h,004h,020h,0e2h	; 9674
	defb 057h,034h,02ch,011h	; 9678
	defb 0aah,034h,02ch,0a2h	; 967c
	defb 055h,034h,02ch,051h	; 9680
	defb 0aah,034h,02ch,0a2h	; 9684
	defb 055h,034h,02ch,051h	; 9688
	defb 0a8h,034h,02ch,0e2h	; 968c
	defb 057h,034h,02ch,011h	; 9690
	defb 0aah,004h,020h,0a2h	; 9694
	defb 055h,004h,020h,051h	; 9698
	defb 000h,004h,020h,0a2h	; 969c
	defb 000h,034h,02ch,051h	; 96a0
	defb 0e7h,034h,02ch,0e2h	; 96a4
	defb 000h,034h,02ch,011h	; 96a8
	defb 000h,034h,02ch,0a2h	; 96ac
	defb 055h,034h,02ch,051h	; 96b0
	defb 0aah,034h,02ch,0a2h	; 96b4
	defb 055h,030h,00ch,051h	; 96b8
	defb 0a8h,000h,000h,0e2h	; 96bc
	defb 057h,055h,055h,011h	; 96c0
	defb 0aah,0aah,0aah,0a2h	; 96c4
	defb 055h,055h,055h,045h	; 96c8
	defb 0aah,0aah,0aah,08ah	; 96cc
	defb 000h,000h,000h,015h	; 96d0
	defb 000h,000h,000h,02ah	; 96d4
	defb 055h,055h,055h,055h	; 96d8
	defb 0aah,0aah,0aah,0aah	; 96dc
	defb 072h,04fh,02fh,0f3h	; 96e0
	defb 072h,04fh,024h,005h	; 96e4
	defb 072h,0c6h,02ch,083h	; 96e8
	defb 072h,040h,004h,080h	; 96ec
	defb 076h,046h,02ch,085h	; 96f0
	defb 070h,048h,0beh,004h	; 96f4
	defb 070h,042h,0c3h,005h	; 96f8
	defb 070h,00bh,000h,084h	; 96fc
	defb 070h,02ch,020h,0c5h	; 9700
	defb 070h,0b0h,020h,020h	; 9704
	defb 072h,0c7h,020h,035h	; 9708
	defb 07bh,00fh,020h,09fh	; 970c
	defb 07ch,046h,020h,0b0h	; 9710
	defb 070h,040h,020h,014h	; 9714
	defb 070h,046h,020h,067h	; 9718
	defb 038h,04fh,020h,026h	; 971c
	defb 01ch,04fh,020h,0c6h	; 9720
	defb 08eh,046h,020h,044h	; 9724
	defb 047h,000h,021h,082h	; 9728
	defb 0a3h,086h,020h,084h	; 972c
	defb 051h,0cfh,023h,02ah	; 9730
	defb 0a8h,0e7h,021h,004h	; 9734
	defb 014h,072h,026h,02ah	; 9738
	defb 09ah,038h,022h,057h	; 973c
	defb 01dh,01ch,02ch,027h	; 9740
	defb 08eh,08eh,004h,000h	; 9744
	defb 01fh,047h,018h,000h	; 9748
	defb 08fh,0a3h,088h,000h	; 974c
	defb 015h,0d1h,0ffh,0ffh	; 9750
	defb 08fh,0e8h,0ffh,0ffh	; 9754
	defb 05fh,0f4h,03fh,0ffh	; 9758
	defb 0aah,0aah,080h,000h	; 975c
	defb 0efh,0f0h,06dh,00eh	; 9760
	defb 0e0h,030h,060h,00eh	; 9764
	defb 0c0h,010h,07fh,0eeh	; 9768
	defb 018h,030h,060h,00eh	; 976c
	defb 08ch,014h,04dh,00eh	; 9770
	defb 08ch,03dh,00dh,00eh	; 9774
	defb 086h,0c3h,045h,00eh	; 9778
	defb 080h,080h,0d1h,00eh	; 977c
	defb 083h,03eh,034h,00eh	; 9780
	defb 082h,078h,00dh,00eh	; 9784
	defb 0d4h,000h,003h,04eh	; 9788
	defb 0fch,000h,000h,0deh	; 978c
	defb 004h,000h,00ch,03eh	; 9790
	defb 00ch,000h,00dh,00ch	; 9794
	defb 0e2h,000h,00dh,01ch	; 9798
	defb 066h,000h,01ah,038h	; 979c
	defb 071h,07eh,034h,071h	; 97a0
	defb 003h,003h,0e8h,0e2h	; 97a4
	defb 000h,080h,011h,0c5h	; 97a8
	defb 001h,080h,023h,08ah	; 97ac
	defb 000h,043h,0c7h,011h	; 97b0
	defb 07eh,0ceh,00eh,022h	; 97b4
	defb 060h,020h,01ch,047h	; 97b8
	defb 0e0h,060h,038h,08eh	; 97bc
	defb 0e0h,010h,071h,007h	; 97c0
	defb 000h,030h,0e2h,00eh	; 97c4
	defb 000h,009h,0c4h,017h	; 97c8
	defb 000h,01bh,088h,02eh	; 97cc
	defb 0ffh,0ffh,011h,057h	; 97d0
	defb 0ffh,0feh,023h,0feh	; 97d4
	defb 0ffh,0f8h,047h,0fdh	; 97d8
	defb 000h,000h,0aah,0aah	; 97dc
	defb 055h,054h,015h,055h	; 97e0
	defb 002h,0a0h,00ah,080h	; 97e4
	defb 007h,047h,0e5h,001h	; 97e8
	defb 02eh,09bh,0dah,08bh	; 97ec
	defb 017h,01bh,0d9h,017h	; 97f0
	defb 03eh,023h,0c4h,0bfh	; 97f4
	defb 07fh,01dh,0bdh,07fh	; 97f8
	defb 0aah,02eh,07dh,0aah	; 97fc
	defb 055h,01eh,07dh,055h	; 9800
	defb 0aah,02dh,0bdh,0aah	; 9804
	defb 055h,023h,0c5h,055h	; 9808
	defb 0aah,01bh,0dbh,0aah	; 980c
	defb 01ch,01bh,0d9h,0c7h	; 9810
	defb 09ah,047h,0e2h,0a6h	; 9814
	defb 01ch,050h,00eh,0c7h	; 9818
	defb 098h,0bfh,0feh,066h	; 981c
	defb 01ch,07fh,0ffh,047h	; 9820
	defb 098h,0bfh,0ffh,066h	; 9824
	defb 054h,050h,00fh,055h	; 9828
	defb 0a8h,029h,0b6h,0aah	; 982c
	defb 054h,01dh,0b9h,055h	; 9830
	defb 0aah,019h,0bah,0aah	; 9834
	defb 01dh,01dh,0bbh,047h	; 9838
	defb 09ah,099h,0bah,0a6h	; 983c
	defb 01dh,010h,00bh,047h	; 9840
	defb 09ah,096h,06ah,0a6h	; 9844
	defb 01dh,016h,063h,047h	; 9848
	defb 09ah,086h,062h,0a6h	; 984c
	defb 055h,01ah,059h,055h	; 9850
	defb 0aah,0bdh,0bch,0aah	; 9854
	defb 055h,02dh,0b4h,055h	; 9858
	defb 0aah,055h,0aah,0aah	; 985c
	defb 057h,0ffh,0ffh,0ffh	; 9860
	defb 0ach,000h,000h,000h	; 9864
	defb 058h,000h,000h,000h	; 9868
	defb 0b2h,0aah,0aah,0aah	; 986c
	defb 065h,055h,055h,055h	; 9870
	defb 0cah,000h,000h,000h	; 9874
	defb 094h,000h,000h,003h	; 9878
	defb 088h,0aah,0aah,088h	; 987c
	defb 091h,055h,055h,015h	; 9880
	defb 088h,0afh,0fah,02ah	; 9884
	defb 091h,05fh,0f0h,055h	; 9888
	defb 088h,0bah,0a0h,0a8h	; 988c
	defb 091h,070h,011h,047h	; 9890
	defb 088h,0e0h,022h,09fh	; 9894
	defb 091h,071h,071h,05eh	; 9898
	defb 088h,0e2h,0e2h,0b9h	; 989c
	defb 091h,071h,071h,03bh	; 98a0
	defb 088h,0e3h,0e2h,0b7h	; 98a4
	defb 091h,077h,0f1h,037h	; 98a8
	defb 088h,0eah,0a2h,0bbh	; 98ac
	defb 091h,070h,011h,039h	; 98b0
	defb 088h,0efh,0e0h,09eh	; 98b4
	defb 091h,075h,043h,0dfh	; 98b8
	defb 088h,0eah,0a6h,087h	; 98bc
	defb 091h,070h,005h,010h	; 98c0
	defb 088h,0efh,0c2h,02ah	; 98c4
	defb 091h,075h,045h,057h	; 98c8
	defb 088h,0bah,08ah,02fh	; 98cc
	defb 091h,05ch,005h,05fh	; 98d0
	defb 088h,0a8h,00ah,02fh	; 98d4
	defb 091h,055h,015h,05fh	; 98d8
	defb 088h,0feh,08ah,0afh	; 98dc
	defb 0ffh,0ffh,0ffh,0c5h	; 98e0
	defb 000h,000h,000h,022h	; 98e4
	defb 000h,000h,000h,071h	; 98e8
	defb 0aah,0aah,0aah,0b8h	; 98ec
	defb 055h,055h,055h,05ch	; 98f0
	defb 000h,000h,000h,0aeh	; 98f4
	defb 0c0h,000h,001h,0d6h	; 98f8
	defb 032h,0aah,0aah,0eeh	; 98fc
	defb 079h,057h,0fdh,076h	; 9900
	defb 0beh,0eah,0aah,0eeh	; 9904
	defb 05fh,045h,001h,076h	; 9908
	defb 01fh,0a2h,038h,0eeh	; 990c
	defb 0e7h,091h,039h,076h	; 9910
	defb 0fbh,0d8h,038h,0eeh	; 9914
	defb 07bh,0d1h,039h,076h	; 9918
	defb 09dh,0d8h,038h,0eeh	; 991c
	defb 0ddh,0d1h,039h,076h	; 9920
	defb 0edh,0d8h,000h,0eeh	; 9924
	defb 0edh,0d1h,001h,076h	; 9928
	defb 0ddh,0d8h,038h,0eeh	; 992c
	defb 09ch,0d1h,039h,076h	; 9930
	defb 07bh,018h,038h,0eeh	; 9934
	defb 0fbh,0d1h,039h,076h	; 9938
	defb 0e3h,0eah,038h,0eeh	; 993c
	defb 01dh,0edh,039h,076h	; 9940
	defb 0feh,0eah,000h,0eeh	; 9944
	defb 0feh,0f5h,001h,076h	; 9948
	defb 0feh,0f6h,038h,0eeh	; 994c
	defb 0feh,0f5h,039h,076h	; 9950
	defb 0feh,0f2h,038h,0eeh	; 9954
	defb 0feh,0fbh,039h,076h	; 9958
	defb 0ffh,07ah,038h,0eeh	; 995c
	defb 055h,040h,005h,055h	; 9960
	defb 0a0h,00fh,0f0h,002h	; 9964
	defb 05fh,070h,00eh,07dh	; 9968
	defb 0b8h,080h,007h,03eh	; 996c
	defb 033h,000h,05dh,0ddh	; 9970
	defb 0a4h,002h,0afh,06eh	; 9974
	defb 028h,000h,05fh,0b5h	; 9978
	defb 0a8h,002h,03fh,0d2h	; 997c
	defb 010h,005h,057h,0f9h	; 9980
	defb 0a0h,010h,0efh,0ech	; 9984
	defb 020h,005h,05fh,0f5h	; 9988
	defb 020h,00ah,0bfh,0dch	; 998c
	defb 040h,015h,057h,0f5h	; 9990
	defb 040h,008h,0efh,0fch	; 9994
	defb 040h,025h,057h,0f5h	; 9998
	defb 040h,00ah,0bbh,0fch	; 999c
	defb 040h,024h,077h,0f6h	; 99a0
	defb 040h,00ah,0afh,0fah	; 99a4
	defb 000h,000h,000h,000h	; 99a8
	defb 0ffh,0ffh,0ffh,0ffh	; 99ac
	defb 0d0h,045h,0dfh,0ffh	; 99b0
	defb 080h,00ah,0bbh,0fdh	; 99b4
	defb 0c0h,051h,07fh,0ffh	; 99b8
	defb 080h,00ah,0abh,0fdh	; 99bc
	defb 0d0h,015h,0dfh,0ffh	; 99c0
	defb 080h,002h,0bbh,0fdh	; 99c4
	defb 0d0h,055h,05fh,0ffh	; 99c8
	defb 080h,00ah,0ebh,0fdh	; 99cc
	defb 0ffh,0ffh,0ffh,0ffh	; 99d0
	defb 000h,000h,000h,000h	; 99d4
	defb 040h,001h,057h,0feh	; 99d8
	defb 040h,02ah,0bfh,0fah	; 99dc
	defb 055h,055h,055h,055h	; 99e0
	defb 000h,000h,000h,000h	; 99e4
	defb 000h,000h,000h,000h	; 99e8
	defb 0aah,0aah,0aah,0aah	; 99ec
	defb 055h,055h,055h,055h	; 99f0
	defb 0ffh,0ffh,0ffh,0ffh	; 99f4
	defb 0ffh,0ffh,0ffh,0ffh	; 99f8
	defb 0aah,0aah,0aah,0aah	; 99fc
	defb 000h,001h,040h,000h	; 9a00
	defb 000h,002h,080h,000h	; 9a04
	defb 0ffh,0f1h,04fh,0ffh	; 9a08
	defb 0ffh,0f2h,08fh,0ffh	; 9a0c
	defb 0ffh,0f1h,04fh,0ffh	; 9a10
	defb 0ffh,0f2h,08fh,0ffh	; 9a14
	defb 0ffh,0f1h,04fh,0ffh	; 9a18
	defb 0e0h,072h,08eh,007h	; 9a1c
	defb 0e0h,071h,04eh,007h	; 9a20
	defb 0e0h,072h,08eh,007h	; 9a24
	defb 0ffh,0f1h,04fh,0ffh	; 9a28
	defb 0ffh,0f2h,08fh,0ffh	; 9a2c
	defb 0ffh,0f1h,04fh,0ffh	; 9a30
	defb 0ffh,0f2h,08fh,0ffh	; 9a34
	defb 000h,001h,040h,000h	; 9a38
	defb 000h,002h,080h,000h	; 9a3c
	defb 055h,055h,055h,055h	; 9a40
	defb 000h,000h,000h,000h	; 9a44
	defb 000h,000h,000h,000h	; 9a48
	defb 0aah,0aah,0aah,0aah	; 9a4c
	defb 055h,055h,055h,055h	; 9a50
	defb 0ffh,0ffh,0ffh,0ffh	; 9a54
	defb 0ffh,0ffh,0ffh,0ffh	; 9a58
	defb 0aah,0aah,0aah,0aah	; 9a5c
	defb 017h,03fh,0fch,017h	; 9a60
	defb 08eh,03fh,0fch,08eh	; 9a64
	defb 017h,03fh,0fch,017h	; 9a68
	defb 08eh,03eh,03ch,08eh	; 9a6c
	defb 017h,03eh,03ch,017h	; 9a70
	defb 08eh,03eh,03ch,08eh	; 9a74
	defb 017h,03eh,03ch,017h	; 9a78
	defb 08eh,03eh,03ch,08eh	; 9a7c
	defb 017h,03eh,03ch,017h	; 9a80
	defb 08eh,03fh,0fch,08eh	; 9a84
	defb 017h,03fh,0fch,017h	; 9a88
	defb 08eh,03fh,0fch,08eh	; 9a8c
	defb 017h,000h,000h,017h	; 9a90
	defb 08eh,000h,000h,08eh	; 9a94
	defb 017h,055h,055h,017h	; 9a98
	defb 08eh,0aah,0aah,08eh	; 9a9c
	defb 017h,055h,055h,017h	; 9aa0
	defb 08eh,0aah,0aah,08eh	; 9aa4
	defb 017h,000h,000h,017h	; 9aa8
	defb 08eh,000h,000h,08eh	; 9aac
	defb 017h,03fh,0fch,017h	; 9ab0
	defb 08eh,03fh,0fch,08eh	; 9ab4
	defb 017h,03fh,0fch,017h	; 9ab8
	defb 08eh,03eh,03ch,08eh	; 9abc
	defb 017h,03eh,03ch,017h	; 9ac0
	defb 08eh,03eh,03ch,08eh	; 9ac4
	defb 017h,03eh,03ch,017h	; 9ac8
	defb 08eh,03eh,03ch,08eh	; 9acc
	defb 017h,03eh,03ch,017h	; 9ad0
	defb 08eh,03fh,0fch,08eh	; 9ad4
	defb 017h,03fh,0fch,017h	; 9ad8
	defb 08eh,03fh,0fch,08eh	; 9adc
	defb 017h,03fh,0feh,047h	; 9ae0
	defb 08eh,09fh,0ffh,023h	; 9ae4
	defb 017h,04fh,01fh,091h	; 9ae8
	defb 08bh,0a7h,08fh,028h	; 9aec
	defb 045h,0d3h,0c6h,054h	; 9af0
	defb 0a2h,0e9h,0ech,0a2h	; 9af4
	defb 051h,074h,0f9h,049h	; 9af8
	defb 0e8h,0bah,072h,09ch	; 9afc
	defb 014h,05dh,025h,03eh	; 9b00
	defb 0aah,02eh,08ah,07fh	; 9b04
	defb 055h,017h,054h,0ffh	; 9b08
	defb 0aah,08bh,0a9h,0efh	; 9b0c
	defb 055h,015h,0d3h,0c7h	; 9b10
	defb 0eah,02ah,0e9h,0e3h	; 9b14
	defb 014h,05dh,074h,0f3h	; 9b18
	defb 0a8h,0b8h,0bah,07bh	; 9b1c
	defb 051h,074h,05dh,03fh	; 9b20
	defb 0a2h,0eah,02eh,09fh	; 9b24
	defb 045h,0d5h,017h,04fh	; 9b28
	defb 0e3h,0aah,08bh,0a7h	; 9b2c
	defb 005h,0d5h,015h,0d3h	; 9b30
	defb 0a3h,0aah,02ah,0e9h	; 9b34
	defb 045h,0d4h,059h,074h	; 9b38
	defb 0a3h,080h,0b8h,0bah	; 9b3c
	defb 045h,001h,074h,05dh	; 9b40
	defb 0e2h,0aah,0eah,02eh	; 9b44
	defb 005h,055h,0d5h,014h	; 9b48
	defb 0afh,0ffh,0aah,08ah	; 9b4c
	defb 05fh,0ffh,055h,045h	; 9b50
	defb 0aah,0aah,0aah,0afh	; 9b54
	defb 059h,065h,096h,05fh	; 9b58
	defb 0aah,0aah,0aah,0aah	; 9b5c
	defb 017h,03fh,0fch,017h	; 9b60
	defb 02eh,07fh,0fch,08eh	; 9b64
	defb 05ch,0f8h,0f9h,017h	; 9b68
	defb 0b9h,0f1h,0f2h,02eh	; 9b6c
	defb 074h,0e3h,0e4h,05dh	; 9b70
	defb 0eah,077h,0c8h,0bah	; 9b74
	defb 0c5h,03fh,091h,075h	; 9b78
	defb 092h,09fh,022h,0eah	; 9b7c
	defb 039h,04eh,045h,0d7h	; 9b80
	defb 07ch,0a4h,08bh,0a8h	; 9b84
	defb 0feh,051h,017h,055h	; 9b88
	defb 0f7h,02ah,02eh,0aah	; 9b8c
	defb 0e3h,094h,057h,055h	; 9b90
	defb 0c7h,0c8h,0abh,0aah	; 9b94
	defb 0cfh,091h,065h,0d7h	; 9b98
	defb 0dfh,022h,0e2h,0e8h	; 9b9c
	defb 0feh,045h,0d1h,075h	; 9ba0
	defb 0fch,08bh,0a8h,0bah	; 9ba4
	defb 0f9h,017h,054h,05dh	; 9ba8
	defb 0f2h,02eh,0aah,03ah	; 9bac
	defb 0e4h,057h,054h,05fh	; 9bb0
	defb 0c8h,0abh,0aah,038h	; 9bb4
	defb 091h,065h,0d4h,05dh	; 9bb8
	defb 022h,0e2h,0e0h,03ah	; 9bbc
	defb 045h,0d1h,040h,05dh	; 9bc0
	defb 00bh,0a8h,0aah,0bah	; 9bc4
	defb 017h,054h,055h,05fh	; 9bc8
	defb 0aeh,0aah,03fh,0f8h	; 9bcc
	defb 05dh,055h,03fh,0fdh	; 9bd0
	defb 0fah,0aah,0aah,0aah	; 9bd4
	defb 0f4h,0d3h,04dh,035h	; 9bd8
	defb 0aah,0aah,0aah,0aah	; 9bdc
	defb 01dh,055h,0aah,047h	; 9be0
	defb 09ah,04eh,072h,0a6h	; 9be4
	defb 01dh,07ch,03eh,047h	; 9be8
	defb 09ah,01ch,038h,0a6h	; 9bec
	defb 01dh,004h,0a1h,047h	; 9bf0
	defb 09ah,082h,04ah,0a6h	; 9bf4
	defb 055h,019h,09bh,055h	; 9bf8
	defb 0aah,098h,03ah,0aah	; 9bfc
	defb 055h,01dh,0bbh,055h	; 9c00
	defb 0aah,099h,0bah,0aah	; 9c04
	defb 01dh,01dh,0bbh,047h	; 9c08
	defb 09ah,099h,0bah,0a6h	; 9c0c
	defb 01dh,01dh,0bbh,047h	; 9c10
	defb 09ah,089h,0b2h,0a6h	; 9c14
	defb 01dh,045h,0a7h,047h	; 9c18
	defb 09ah,0a1h,08eh,0a6h	; 9c1c
	defb 01dh,051h,09dh,047h	; 9c20
	defb 09ah,0a9h,0bah,0a6h	; 9c24
	defb 055h,054h,015h,055h	; 9c28
	defb 0aah,0aah,0aah,0aah	; 9c2c
	defb 003h,055h,055h,001h	; 9c30
	defb 006h,0abh,0eah,083h	; 9c34
	defb 03fh,055h,0d5h,01fh	; 9c38
	defb 02eh,0abh,0eah,09bh	; 9c3c
	defb 037h,055h,0d5h,013h	; 9c40
	defb 026h,0abh,0eah,09bh	; 9c44
	defb 037h,055h,0d5h,013h	; 9c48
	defb 026h,0afh,0fah,09bh	; 9c4c
	defb 037h,057h,0f5h,013h	; 9c50
	defb 026h,0abh,0eah,093h	; 9c54
	defb 07fh,055h,0d5h,01fh	; 9c58
	defb 0feh,0aah,0aah,0bfh	; 9c5c
	defb 091h,001h,014h,05fh	; 9c60
	defb 088h,0aah,02ah,0afh	; 9c64
	defb 091h,001h,014h,05fh	; 9c68
	defb 088h,0feh,02ah,0bfh	; 9c6c
	defb 091h,055h,014h,05fh	; 9c70
	defb 088h,0aah,02ah,0afh	; 9c74
	defb 094h,07fh,014h,05fh	; 9c78
	defb 08ah,0ffh,08ah,0afh	; 9c7c
	defb 095h,055h,044h,057h	; 9c80
	defb 0cah,0aah,0a2h,02bh	; 9c84
	defb 067h,0ffh,0f1h,095h	; 9c88
	defb 0bfh,0ffh,0f8h,000h	; 9c8c
	defb 040h,000h,015h,055h	; 9c90
	defb 0aah,0aah,0b2h,080h	; 9c94
	defb 000h,000h,055h,07fh	; 9c98
	defb 080h,000h,0f2h,0aah	; 9c9c
	defb 015h,055h,0d5h,055h	; 9ca0
	defb 080h,000h,0f2h,080h	; 9ca4
	defb 010h,001h,0d1h,07fh	; 9ca8
	defb 082h,080h,0f2h,0aah	; 9cac
	defb 010h,029h,0d1h,055h	; 9cb0
	defb 080h,000h,0f2h,080h	; 9cb4
	defb 012h,081h,0d1h,07fh	; 9cb8
	defb 080h,028h,0f0h,0aah	; 9cbc
	defb 010h,001h,0d1h,055h	; 9cc0
	defb 080h,000h,0f0h,080h	; 9cc4
	defb 010h,001h,0d1h,07fh	; 9cc8
	defb 080h,000h,0f0h,0aah	; 9ccc
	defb 015h,055h,0d1h,055h	; 9cd0
	defb 0bfh,0ffh,0f2h,000h	; 9cd4
	defb 07fh,0ffh,0d4h,000h	; 9cd8
	defb 0aah,0aah,0b8h,000h	; 9cdc
	defb 0ffh,079h,039h,076h	; 9ce0
	defb 0ffh,07dh,000h,0eeh	; 9ce4
	defb 0ffh,07dh,055h,076h	; 9ce8
	defb 0ffh,07dh,080h,0eeh	; 9cec
	defb 0ffh,07dh,07fh,076h	; 9cf0
	defb 0ffh,07dh,0aah,0eeh	; 9cf4
	defb 0ffh,07dh,0ffh,0d6h	; 9cf8
	defb 0ffh,07bh,0ffh,0aeh	; 9cfc
	defb 0ffh,075h,055h,05ch	; 9d00
	defb 0feh,06ah,0aah,0b8h	; 9d04
	defb 07dh,09fh,0ffh,0f1h	; 9d08
	defb 000h,03fh,0ffh,0e2h	; 9d0c
	defb 055h,050h,000h,005h	; 9d10
	defb 000h,0b2h,0aah,0aah	; 9d14
	defb 0ffh,057h,0ffh,0fdh	; 9d18
	defb 0aah,0b3h,086h,018h	; 9d1c
	defb 055h,057h,0ffh,0f1h	; 9d20
	defb 000h,0b2h,0ffh,0e4h	; 9d24
	defb 0ffh,076h,0f3h,025h	; 9d28
	defb 0aah,0b2h,0cch,0c4h	; 9d2c
	defb 055h,076h,0f3h,025h	; 9d30
	defb 000h,0b2h,0cch,0c0h	; 9d34
	defb 0ffh,077h,0f3h,021h	; 9d38
	defb 0aah,0f3h,0cch,0c0h	; 9d3c
	defb 055h,076h,0f3h,025h	; 9d40
	defb 000h,0f2h,0cch,0c4h	; 9d44
	defb 0ffh,076h,0f3h,025h	; 9d48
	defb 0aah,0f2h,0cch,0c4h	; 9d4c
	defb 055h,076h,0c0h,005h	; 9d50
	defb 000h,033h,080h,000h	; 9d54
	defb 000h,017h,03ch,079h	; 9d58
	defb 000h,002h,000h,000h	; 9d5c
	defb 040h,005h,0dbh,0feh	; 9d60
	defb 040h,008h,0afh,0fah	; 9d64
	defb 000h,000h,000h,000h	; 9d68
	defb 0ffh,0ffh,0ffh,0ffh	; 9d6c
	defb 0d0h,045h,0dfh,0ffh	; 9d70
	defb 080h,00ah,0bbh,0fdh	; 9d74
	defb 0d0h,051h,07fh,0ffh	; 9d78
	defb 080h,00ah,0abh,0fdh	; 9d7c
	defb 0d0h,055h,0dfh,0ffh	; 9d80
	defb 080h,002h,0bbh,0fdh	; 9d84
	defb 0d0h,055h,05fh,0ffh	; 9d88
	defb 080h,00ah,0ebh,0fdh	; 9d8c
	defb 0ffh,0ffh,0ffh,0ffh	; 9d90
	defb 000h,000h,000h,000h	; 9d94
	defb 040h,007h,05fh,0fah	; 9d98
	defb 060h,00ah,0bfh,0feh	; 9d9c
	defb 040h,001h,0ffh,0fah	; 9da0
	defb 060h,00ah,0afh,0feh	; 9da4
	defb 040h,007h,07fh,0fah	; 9da8
	defb 060h,02ah,0afh,0feh	; 9dac
	defb 030h,001h,0ffh,0f6h	; 9db0
	defb 020h,02ah,0bfh,0fch	; 9db4
	defb 034h,057h,05fh,0edh	; 9db8
	defb 018h,002h,0ffh,0fah	; 9dbc
	defb 04dh,055h,07fh,0d5h	; 9dc0
	defb 06ah,0fbh,0ffh,0f6h	; 9dc4
	defb 04dh,07fh,0ffh,065h	; 9dc8
	defb 067h,0bfh,0fdh,0ceh	; 9dcc
	defb 070h,0d7h,0f7h,01dh	; 9dd0
	defb 03eh,07dh,05eh,0fah	; 9dd4
	defb 015h,00fh,0f1h,055h	; 9dd8
	defb 0aah,0a0h,00ah,0aah	; 9ddc
	defb 055h,055h,055h,055h	; 9de0
	defb 0afh,0ffh,0aah,0bfh	; 9de4
	defb 05fh,0feh,055h,0e0h	; 9de8
	defb 0bah,0a8h,0afh,000h	; 9dec
	defb 075h,051h,078h,000h	; 9df0
	defb 0eah,082h,0c0h,000h	; 9df4
	defb 075h,007h,080h,03fh	; 9df8
	defb 0eah,02ch,001h,0e0h	; 9dfc
	defb 074h,058h,00fh,015h	; 9e00
	defb 0e8h,0b0h,018h,0aah	; 9e04
	defb 071h,060h,075h,055h	; 9e08
	defb 0e8h,0c0h,0cah,0bfh	; 9e0c
	defb 071h,081h,095h,0e0h	; 9e10
	defb 0e3h,003h,02fh,00ah	; 9e14
	defb 066h,006h,058h,055h	; 9e18
	defb 0eah,00ch,0b2h,0aah	; 9e1c
	defb 056h,019h,065h,050h	; 9e20
	defb 0ach,032h,0cah,08fh	; 9e24
	defb 058h,025h,095h,070h	; 9e28
	defb 0a8h,06bh,02bh,080h	; 9e2c
	defb 058h,056h,056h,00fh	; 9e30
	defb 0b0h,0cch,0ach,070h	; 9e34
	defb 060h,095h,058h,085h	; 9e38
	defb 0a1h,0aah,0b1h,02ah	; 9e3c
	defb 061h,059h,062h,057h	; 9e40
	defb 0a1h,032h,0a4h,0afh	; 9e44
	defb 063h,055h,045h,0ffh	; 9e48
	defb 0c2h,0b2h,0c4h,086h	; 9e4c
	defb 042h,065h,049h,094h	; 9e50
	defb 0c2h,0aah,04ah,0a8h	; 9e54
	defb 042h,065h,049h,095h	; 9e58
	defb 0c2h,0aah,04ah,0aah	; 9e5c
	defb 055h,055h,055h,055h	; 9e60
	defb 0feh,0aah,0afh,0bfh	; 9e64
	defb 003h,0d5h,05fh,05fh	; 9e68
	defb 000h,07ah,0aeh,03ch	; 9e6c
	defb 000h,00fh,05ch,05dh	; 9e70
	defb 000h,001h,0a8h,03dh	; 9e74
	defb 0feh,000h,0f5h,05dh	; 9e78
	defb 003h,0c0h,01ah,0bch	; 9e7c
	defb 054h,070h,00dh,05fh	; 9e80
	defb 0aah,09ch,006h,0bfh	; 9e84
	defb 055h,047h,003h,055h	; 9e88
	defb 0fah,0a9h,081h,0aah	; 9e8c
	defb 007h,0d4h,0cah,0c0h	; 9e90
	defb 0a8h,07ah,061h,01fh	; 9e94
	defb 055h,01dh,034h,0f0h	; 9e98
	defb 0aah,0aeh,093h,080h	; 9e9c
	defb 000h,000h,00eh,007h	; 9ea0
	defb 0ffh,0ffh,0f8h,00fh	; 9ea4
	defb 000h,000h,000h,000h	; 9ea8
	defb 000h,000h,000h,000h	; 9eac
	defb 0ffh,0ffh,0ffh,0ffh	; 9eb0
	defb 000h,000h,000h,000h	; 9eb4
	defb 055h,055h,055h,055h	; 9eb8
	defb 0aah,0aah,0aah,0aah	; 9ebc
	defb 0ffh,0ffh,0ffh,0d0h	; 9ec0
	defb 0ffh,0ffh,0ffh,0afh	; 9ec4
	defb 055h,055h,055h,015h	; 9ec8
	defb 0aah,0aah,000h,026h	; 9ecc
	defb 000h,005h,000h,015h	; 9ed0
	defb 000h,00eh,000h,000h	; 9ed4
	defb 055h,05dh,000h,000h	; 9ed8
	defb 0aah,0aeh,00ch,0cch	; 9edc
	defb 055h,055h,055h,055h	; 9ee0
	defb 0ffh,0ffh,0ffh,0ffh	; 9ee4
	defb 0ffh,0ffh,0ffh,0ffh	; 9ee8
	defb 000h,000h,000h,003h	; 9eec
	defb 0ffh,0ffh,0ffh,0fbh	; 9ef0
	defb 018h,0c6h,031h,08bh	; 9ef4
	defb 0ffh,0ffh,0ffh,0fbh	; 9ef8
	defb 000h,000h,000h,003h	; 9efc
	defb 0ffh,0ffh,0ffh,0ffh	; 9f00
	defb 0ffh,0ffh,0ffh,0ffh	; 9f04
	defb 055h,055h,055h,055h	; 9f08
	defb 0aah,0aah,0aah,0aah	; 9f0c
	defb 000h,000h,000h,005h	; 9f10
	defb 0ffh,0ffh,0ffh,0fah	; 9f14
	defb 000h,000h,000h,00dh	; 9f18
	defb 000h,000h,000h,01eh	; 9f1c
	defb 03ch,0f3h,0cfh,03fh	; 9f20
	defb 03ch,0f3h,0cfh,01fh	; 9f24
	defb 000h,000h,000h,04fh	; 9f28
	defb 000h,000h,000h,0e7h	; 9f2c
	defb 0ffh,0ffh,0ffh,0ffh	; 9f30
	defb 000h,000h,003h,0e7h	; 9f34
	defb 055h,055h,055h,0e7h	; 9f38
	defb 0aah,0aah,0aah,0e7h	; 9f3c
	defb 000h,000h,014h,0e7h	; 9f40
	defb 0ffh,0ffh,0aah,0ffh	; 9f44
	defb 055h,055h,094h,0ffh	; 9f48
	defb 066h,0aah,0aah,0e7h	; 9f4c
	defb 055h,011h,090h,0e7h	; 9f50
	defb 002h,0aah,0aah,0e7h	; 9f54
	defb 005h,05fh,0fch,0e7h	; 9f58
	defb 0ceh,0bfh,0fah,0ffh	; 9f5c
	defb 055h,055h,055h,055h	; 9f60
	defb 080h,000h,000h,000h	; 9f64
	defb 040h,000h,000h,000h	; 9f68
	defb 080h,000h,000h,000h	; 9f6c
	defb 040h,000h,000h,000h	; 9f70
	defb 082h,0aah,0aah,0aah	; 9f74
	defb 041h,0fdh,05fh,0fdh	; 9f78
	defb 083h,0a8h,0bah,0a8h	; 9f7c
	defb 041h,001h,050h,001h	; 9f80
	defb 082h,0aah,0aah,0aah	; 9f84
	defb 047h,0ffh,0ffh,0ffh	; 9f88
	defb 08fh,0ffh,0ffh,0ffh	; 9f8c
	defb 05fh,000h,0ffh,0ffh	; 9f90
	defb 0bch,00ah,03fh,0fch	; 9f94
	defb 058h,015h,095h,058h	; 9f98
	defb 0aah,00bh,0dah,0aah	; 9f9c
	defb 058h,017h,0d4h,018h	; 9fa0
	defb 0aah,00bh,0d9h,0aah	; 9fa4
	defb 058h,017h,0d5h,098h	; 9fa8
	defb 0aah,07fh,0d9h,0aah	; 9fac
	defb 059h,080h,075h,099h	; 9fb0
	defb 0aah,00bh,019h,0aah	; 9fb4
	defb 058h,017h,0d5h,098h	; 9fb8
	defb 0aah,00bh,0d9h,0aah	; 9fbc
	defb 058h,017h,0d5h,098h	; 9fc0
	defb 0aah,00bh,0d9h,0aah	; 9fc4
	defb 058h,017h,0d5h,098h	; 9fc8
	defb 0aah,07fh,0d9h,0aah	; 9fcc
	defb 059h,080h,075h,099h	; 9fd0
	defb 0aah,00bh,019h,0aah	; 9fd4
	defb 058h,017h,0d5h,098h	; 9fd8
	defb 0aah,00bh,0d9h,0aah	; 9fdc
	defb 055h,055h,055h,055h	; 9fe0
	defb 000h,000h,000h,000h	; 9fe4
	defb 000h,000h,000h,000h	; 9fe8
	defb 000h,000h,000h,000h	; 9fec
	defb 000h,000h,000h,000h	; 9ff0
	defb 0aah,0aah,0aah,0aah	; 9ff4
	defb 057h,0ffh,0ffh,055h	; 9ff8
	defb 0aeh,0aah,0aah,02bh	; 9ffc
	defb 054h,000h,000h,055h	; a000
	defb 0aah,0aah,0aah,0aah	; a004
	defb 0ffh,0ffh,0ffh,0ffh	; a008
	defb 0ffh,0ffh,0ffh,0ffh	; a00c
	defb 000h,0ffh,0ffh,000h	; a010
	defb 00ah,03fh,0fch,00ah	; a014
	defb 015h,095h,058h,015h	; a018
	defb 00bh,0dah,0aah,00bh	; a01c
	defb 017h,0d4h,018h,017h	; a020
	defb 00bh,0d9h,0aah,00bh	; a024
	defb 017h,0d5h,098h,017h	; a028
	defb 07fh,0d9h,0aah,07fh	; a02c
	defb 080h,075h,099h,080h	; a030
	defb 00bh,019h,0aah,00bh	; a034
	defb 017h,0d5h,098h,017h	; a038
	defb 00bh,0d9h,0aah,00bh	; a03c
	defb 017h,0d5h,098h,017h	; a040
	defb 00bh,0d9h,0aah,00bh	; a044
	defb 017h,0d5h,098h,017h	; a048
	defb 07fh,0d9h,0aah,07fh	; a04c
	defb 080h,075h,099h,080h	; a050
	defb 00bh,019h,0aah,00bh	; a054
	defb 017h,0d5h,098h,017h	; a058
	defb 00bh,0d9h,0aah,00bh	; a05c
	defb 055h,055h,055h,055h	; a060
	defb 000h,000h,000h,002h	; a064
	defb 000h,000h,000h,005h	; a068
	defb 000h,000h,000h,00eh	; a06c
	defb 000h,000h,000h,01dh	; a070
	defb 0aah,0aah,0aah,0beh	; a074
	defb 0ffh,0f5h,07fh,07dh	; a078
	defb 0aah,0a2h,0eah,03eh	; a07c
	defb 000h,005h,040h,07dh	; a080
	defb 0aah,0aah,0aah,0beh	; a084
	defb 0ffh,0ffh,0ffh,0fdh	; a088
	defb 0ffh,0ffh,0ffh,0feh	; a08c
	defb 0ffh,0ffh,000h,0fdh	; a090
	defb 03fh,0fch,00ah,03eh	; a094
	defb 095h,058h,015h,095h	; a098
	defb 0dah,0aah,00bh,0dah	; a09c
	defb 0d4h,018h,017h,0d5h	; a0a0
	defb 0d9h,0aah,00bh,0dah	; a0a4
	defb 0d5h,098h,017h,0d5h	; a0a8
	defb 0d9h,0aah,07fh,0dah	; a0ac
	defb 075h,099h,080h,075h	; a0b0
	defb 019h,0aah,00bh,01ah	; a0b4
	defb 0d5h,098h,017h,0d5h	; a0b8
	defb 0d9h,0aah,00bh,0dah	; a0bc
	defb 0d5h,098h,017h,0d5h	; a0c0
	defb 0d9h,0aah,00bh,0dah	; a0c4
	defb 0d5h,098h,017h,0d5h	; a0c8
	defb 0d9h,0aah,07fh,0dah	; a0cc
	defb 075h,099h,080h,075h	; a0d0
	defb 019h,0aah,00bh,01ah	; a0d4
	defb 0d5h,098h,017h,0d5h	; a0d8
	defb 0d9h,0aah,00bh,0dah	; a0dc
	defb 005h,055h,055h,0c6h	; a0e0
	defb 08ch,0bfh,0feh,081h	; a0e4
	defb 005h,055h,055h,055h	; a0e8
	defb 08ah,0e8h,0bah,022h	; a0ec
	defb 005h,017h,045h,0ddh	; a0f0
	defb 08ah,0aah,0aah,0aah	; a0f4
	defb 000h,000h,000h,000h	; a0f8
	defb 080h,000h,000h,000h	; a0fc
	defb 000h,000h,000h,000h	; a100
	defb 080h,0aah,0aah,0aah	; a104
	defb 001h,0d5h,055h,055h	; a108
	defb 080h,02fh,0ffh,0ffh	; a10c
	defb 001h,05fh,0ffh,0ffh	; a110
	defb 080h,0bah,0aah,0aah	; a114
	defb 001h,075h,055h,055h	; a118
	defb 080h,0ebh,0ffh,0ffh	; a11c
	defb 001h,077h,011h,011h	; a120
	defb 080h,0ebh,0ffh,0ffh	; a124
	defb 001h,075h,055h,055h	; a128
	defb 080h,0bah,0aah,0aah	; a12c
	defb 001h,05ch,000h,000h	; a130
	defb 080h,028h,000h,000h	; a134
	defb 001h,0d5h,055h,055h	; a138
	defb 080h,0aah,0aah,0aah	; a13c
	defb 001h,0ffh,0ffh,0ffh	; a140
	defb 083h,0ffh,0ffh,0ffh	; a144
	defb 007h,0ffh,0ffh,0ffh	; a148
	defb 08fh,0ffh,0ffh,0ffh	; a14c
	defb 01fh,0ffh,0ffh,0ffh	; a150
	defb 0bfh,0ffh,0ffh,0ffh	; a154
	defb 055h,055h,055h,055h	; a158
	defb 0aah,0aah,0aah,0aah	; a15c
	defb 000h,060h,006h,000h	; a160
	defb 0ffh,080h,001h,0ffh	; a164
	defb 055h,055h,055h,055h	; a168
	defb 022h,022h,022h,000h	; a16c
	defb 0ddh,0ddh,0ddh,0ffh	; a170
	defb 0aah,0aah,0aah,0aah	; a174
	defb 000h,007h,000h,000h	; a178
	defb 000h,00fh,000h,000h	; a17c
	defb 000h,01fh,000h,000h	; a180
	defb 0aah,0bfh,002h,0aah	; a184
	defb 055h,01fh,005h,07fh	; a188
	defb 0feh,0ffh,002h,0eah	; a18c
	defb 0fdh,05fh,005h,04eh	; a190
	defb 0a8h,0bfh,002h,0eah	; a194
	defb 054h,05fh,004h,000h	; a198
	defb 0fah,03fh,000h,000h	; a19c
	defb 01ch,05fh,004h,0fch	; a1a0
	defb 0fah,03fh,000h,0fch	; a1a4
	defb 054h,05fh,004h,000h	; a1a8
	defb 0a8h,0bfh,000h,000h	; a1ac
	defb 001h,05fh,005h,015h	; a1b0
	defb 002h,0ffh,002h,080h	; a1b4
	defb 055h,01fh,005h,055h	; a1b8
	defb 0aah,0bfh,002h,0aah	; a1bc
	defb 0ffh,0ffh,007h,0ffh	; a1c0
	defb 0ffh,0ffh,00fh,0ffh	; a1c4
	defb 0ffh,0ffh,01fh,0ffh	; a1c8
	defb 0ffh,0ffh,0ffh,0ffh	; a1cc
	defb 0ffh,0ffh,0ffh,0ffh	; a1d0
	defb 0ffh,0ffh,0ffh,0ffh	; a1d4
	defb 055h,055h,055h,055h	; a1d8
	defb 0aah,0aah,0aah,0aah	; a1dc
	defb 042h,065h,049h,095h	; a1e0
	defb 0c2h,0aah,04ah,0afh	; a1e4
	defb 042h,065h,049h,097h	; a1e8
	defb 0c2h,0aah,04ah,086h	; a1ec
	defb 042h,065h,049h,0fch	; a1f0
	defb 0c2h,0b2h,0cah,0a8h	; a1f4
	defb 063h,055h,069h,055h	; a1f8
	defb 0a1h,032h,0a4h,0aah	; a1fc
	defb 061h,059h,06ch,057h	; a200
	defb 0b1h,0aah,0b6h,028h	; a204
	defb 050h,095h,05bh,085h	; a208
	defb 0b0h,0ach,0aeh,0e0h	; a20c
	defb 018h,0d6h,057h,0ffh	; a210
	defb 0e8h,06bh,02ah,0ffh	; a214
	defb 058h,025h,095h,03fh	; a218
	defb 0adh,032h,0cah,08fh	; a21c
	defb 016h,059h,065h,050h	; a220
	defb 0ebh,02ch,0b2h,0aah	; a224
	defb 057h,056h,05ch,055h	; a228
	defb 0abh,0abh,02bh,08ah	; a22c
	defb 015h,0d5h,095h,070h	; a230
	defb 0eah,0ebh,0cah,0afh	; a234
	defb 05dh,07dh,071h,055h	; a238
	defb 0aeh,0bbh,0fch,0aah	; a23c
	defb 01bh,05eh,0ffh,015h	; a240
	defb 0e9h,0afh,0ffh,0e0h	; a244
	defb 05ch,0d7h,0ffh,0ffh	; a248
	defb 0afh,0eah,0ffh,0ffh	; a24c
	defb 015h,055h,07fh,0ffh	; a250
	defb 0e2h,022h,02fh,0ffh	; a254
	defb 05dh,0ddh,0d7h,0ffh	; a258
	defb 0aah,0aah,0aah,0bfh	; a25c
	defb 055h,05dh,003h,033h	; a260
	defb 0ffh,0feh,00ch,0ffh	; a264
	defb 0ffh,0fdh,003h,0ffh	; a268
	defb 0aah,0aah,00ch,0c3h	; a26c
	defb 000h,000h,003h,0ffh	; a270
	defb 000h,000h,00ch,0ffh	; a274
	defb 055h,055h,043h,033h	; a278
	defb 0aah,0aah,08fh,0ffh	; a27c
	defb 077h,077h,05fh,0ffh	; a280
	defb 088h,088h,0aah,0aah	; a284
	defb 055h,055h,055h,055h	; a288
	defb 000h,000h,000h,000h	; a28c
	defb 0ffh,0ffh,0ffh,0ffh	; a290
	defb 0ffh,0ffh,0ffh,0ffh	; a294
	defb 0ffh,0ffh,0ffh,0ffh	; a298
	defb 0ffh,0ffh,0ffh,0f0h	; a29c
	defb 000h,000h,00fh,0f8h	; a2a0
	defb 0aah,0aeh,093h,0ffh	; a2a4
	defb 055h,01dh,03ch,0ffh	; a2a8
	defb 0a8h,0eah,07fh,01fh	; a2ac
	defb 007h,054h,0ffh,0c0h	; a2b0
	defb 0fah,0a9h,0ffh,0aah	; a2b4
	defb 055h,057h,0ffh,055h	; a2b8
	defb 0aah,08fh,0feh,0afh	; a2bc
	defb 054h,07fh,0fdh,058h	; a2c0
	defb 003h,0ffh,0fah,0b7h	; a2c4
	defb 0ffh,0ffh,0f5h,06dh	; a2c8
	defb 0ffh,0ffh,0aah,0d8h	; a2cc
	defb 0ffh,0ffh,050h,03fh	; a2d0
	defb 0ffh,0fah,0bfh,0ffh	; a2d4
	defb 0ffh,0d5h,055h,055h	; a2d8
	defb 0feh,0aah,0aah,0aah	; a2dc
	defb 03dh,01dh,05ch,0ffh	; a2e0
	defb 0ceh,0bah,0bah,0e7h	; a2e4
	defb 03dh,05dh,05ch,0e7h	; a2e8
	defb 0ceh,0bah,0bah,0e7h	; a2ec
	defb 03dh,01dh,05ch,0e7h	; a2f0
	defb 0ceh,0bfh,0fah,0ffh	; a2f4
	defb 03dh,05fh,0fch,0ffh	; a2f8
	defb 0feh,0aah,0aah,0e7h	; a2fc
	defb 0fdh,011h,010h,0e7h	; a300
	defb 0aah,0aah,0aah,0e7h	; a304
	defb 055h,055h,055h,0e7h	; a308
	defb 000h,000h,003h,0ffh	; a30c
	defb 0ffh,0ffh,0ffh,0ffh	; a310
	defb 0ffh,0ffh,0ffh,0e7h	; a314
	defb 0ffh,0ffh,0ffh,0cfh	; a318
	defb 0c3h,00ch,030h,0dfh	; a31c
	defb 0c3h,00ch,030h,0ffh	; a320
	defb 0ffh,0ffh,0ffh,0feh	; a324
	defb 0ffh,0ffh,0ffh,0fdh	; a328
	defb 0ffh,0ffh,0ffh,0fah	; a32c
	defb 000h,000h,000h,005h	; a330
	defb 0aah,0aah,0aah,0aah	; a334
	defb 055h,0ffh,0ffh,0fdh	; a338
	defb 0fah,0ffh,0ffh,0f8h	; a33c
	defb 00dh,0d5h,055h,051h	; a340
	defb 0fah,0e0h,000h,008h	; a344
	defb 05dh,0dfh,0ffh,0f1h	; a348
	defb 01ah,0e0h,000h,008h	; a34c
	defb 0fdh,0d5h,055h,051h	; a350
	defb 0fah,080h,000h,000h	; a354
	defb 055h,000h,000h,001h	; a358
	defb 0aah,0aah,0aah,0aah	; a35c
	defb 058h,017h,0d5h,098h	; a360
	defb 0aah,00bh,0d9h,0aah	; a364
	defb 058h,017h,0d5h,098h	; a368
	defb 0aah,07fh,0d9h,0aah	; a36c
	defb 059h,080h,075h,099h	; a370
	defb 0aah,00bh,019h,0aah	; a374
	defb 058h,017h,0d5h,098h	; a378
	defb 0aah,00bh,0d9h,0aah	; a37c
	defb 058h,017h,0d5h,098h	; a380
	defb 0aah,00bh,0d9h,0aah	; a384
	defb 058h,017h,0d5h,098h	; a388
	defb 0aah,07fh,0d9h,0aah	; a38c
	defb 059h,080h,075h,099h	; a390
	defb 0aah,00bh,019h,0aah	; a394
	defb 058h,017h,0d4h,018h	; a398
	defb 0aah,00bh,0dah,0aah	; a39c
	defb 058h,017h,0d5h,058h	; a3a0
	defb 08ah,00bh,010h,02ah	; a3a4
	defb 006h,000h,060h,078h	; a3a8
	defb 081h,0ffh,080h,0eah	; a3ac
	defb 005h,055h,055h,0f9h	; a3b0
	defb 08ah,0aah,0aah,0eah	; a3b4
	defb 005h,07fh,0fdh,0f8h	; a3b8
	defb 08ch,0eah,0aah,0eah	; a3bc
	defb 005h,040h,001h,0f8h	; a3c0
	defb 08ah,0e0h,00ah,0eah	; a3c4
	defb 005h,04eh,0e1h,0f8h	; a3c8
	defb 08ah,0eeh,0eah,0eah	; a3cc
	defb 003h,040h,001h,0f9h	; a3d0
	defb 08ah,0e0h,00ah,0eah	; a3d4
	defb 005h,055h,051h,0f8h	; a3d8
	defb 08ah,080h,002h,0eah	; a3dc
	defb 017h,0d5h,098h,017h	; a3e0
	defb 00bh,0d9h,0aah,00bh	; a3e4
	defb 017h,0d5h,098h,017h	; a3e8
	defb 07fh,0d9h,0aah,07fh	; a3ec
	defb 080h,075h,099h,080h	; a3f0
	defb 00bh,019h,0aah,00bh	; a3f4
	defb 017h,0d5h,098h,017h	; a3f8
	defb 00bh,0d9h,0aah,00bh	; a3fc
	defb 017h,0d5h,098h,017h	; a400
	defb 00bh,0d9h,0aah,00bh	; a404
	defb 017h,0d5h,098h,017h	; a408
	defb 07fh,0d9h,0aah,07fh	; a40c
	defb 080h,075h,099h,080h	; a410
	defb 00bh,019h,0aah,00bh	; a414
	defb 017h,0d5h,098h,017h	; a418
	defb 00bh,0d9h,0aah,00bh	; a41c
	defb 017h,0d5h,098h,017h	; a420
	defb 00bh,0d9h,0aah,00bh	; a424
	defb 017h,0d5h,098h,017h	; a428
	defb 07fh,0d9h,0aah,07fh	; a42c
	defb 080h,075h,099h,080h	; a430
	defb 00bh,019h,0aah,00bh	; a434
	defb 017h,0d5h,098h,017h	; a438
	defb 00bh,0d9h,0aah,00bh	; a43c
	defb 017h,0d5h,098h,017h	; a440
	defb 00bh,0d9h,0aah,00bh	; a444
	defb 017h,0d5h,098h,017h	; a448
	defb 07fh,0d9h,0aah,07fh	; a44c
	defb 080h,074h,019h,080h	; a450
	defb 00bh,01ah,0aah,00bh	; a454
	defb 017h,0d5h,058h,017h	; a458
	defb 00bh,010h,00ah,00bh	; a45c
	defb 0d5h,098h,017h,0d5h	; a460
	defb 0d9h,0aah,00bh,0dah	; a464
	defb 0d5h,098h,017h,0d5h	; a468
	defb 0d9h,0aah,07fh,0dah	; a46c
	defb 075h,099h,080h,075h	; a470
	defb 019h,0aah,00bh,01ah	; a474
	defb 0d5h,098h,017h,0d5h	; a478
	defb 0d9h,0aah,00bh,0dah	; a47c
	defb 0d5h,098h,017h,0d5h	; a480
	defb 0d9h,0aah,00bh,0dah	; a484
	defb 0d5h,098h,017h,0d5h	; a488
	defb 0d9h,0aah,07fh,0dah	; a48c
	defb 075h,099h,080h,075h	; a490
	defb 019h,0aah,00bh,01ah	; a494
	defb 0d4h,018h,017h,0d5h	; a498
	defb 0dah,0aah,00bh,0dah	; a49c
	defb 0d5h,058h,017h,0d5h	; a4a0
	defb 0d8h,008h,00bh,012h	; a4a4
	defb 0d0h,006h,000h,067h	; a4a8
	defb 0d8h,001h,0ffh,08eh	; a4ac
	defb 070h,055h,055h,05fh	; a4b0
	defb 018h,0aah,0aah,0aeh	; a4b4
	defb 0d0h,050h,000h,05fh	; a4b8
	defb 0d8h,0f0h,000h,0eeh	; a4bc
	defb 0d0h,041h,055h,0dfh	; a4c0
	defb 0d8h,0c2h,038h,0eeh	; a4c4
	defb 0d0h,051h,0c7h,0dfh	; a4c8
	defb 0d8h,0c2h,0aah,0eeh	; a4cc
	defb 070h,057h,0ffh,0dfh	; a4d0
	defb 018h,0cfh,0ffh,0eeh	; a4d4
	defb 0d0h,055h,053h,05fh	; a4d8
	defb 010h,0ceh,08ah,00eh	; a4dc
	defb 060h,051h,073h,05fh	; a4e0
	defb 080h,0cah,0aah,04eh	; a4e4
	defb 055h,040h,003h,05fh	; a4e8
	defb 000h,01fh,0feh,04eh	; a4ec
	defb 0ffh,0f5h,055h,01fh	; a4f0
	defb 0aah,0aah,0aah,0aeh	; a4f4
	defb 000h,000h,000h,01fh	; a4f8
	defb 000h,000h,000h,03eh	; a4fc
	defb 000h,000h,000h,07fh	; a500
	defb 0aah,0aah,0aah,0feh	; a504
	defb 0ffh,0ffh,0d5h,07fh	; a508
	defb 0aah,0aah,0eah,0feh	; a50c
	defb 055h,000h,001h,07fh	; a510
	defb 09ch,080h,003h,0feh	; a514
	defb 055h,015h,057h,07fh	; a518
	defb 0aah,088h,08bh,0feh	; a51c
	defb 000h,017h,077h,07fh	; a520
	defb 0ffh,0c5h,0d3h,0feh	; a524
	defb 055h,017h,077h,07fh	; a528
	defb 09ch,088h,08bh,0feh	; a52c
	defb 055h,015h,057h,07fh	; a530
	defb 000h,03fh,0ffh,0feh	; a534
	defb 055h,07fh,0ffh,07fh	; a538
	defb 0aah,0aah,0aah,0feh	; a53c
	defb 0ffh,0ffh,0ffh,0ffh	; a540
	defb 0ffh,0ffh,0ffh,0feh	; a544
	defb 0ffh,0ffh,0ffh,0ffh	; a548
	defb 0ffh,0ffh,0ffh,0feh	; a54c
	defb 0ffh,0ffh,0ffh,0ffh	; a550
	defb 0ffh,0ffh,0ffh,0feh	; a554
	defb 055h,055h,055h,055h	; a558
	defb 0aah,0aah,0aah,0aah	; a55c

; ----------------------------------------------------------------------
; DATOS sprites: Sprites: 83 de 16x16 con mascara, 64 bytes cada uno
;   0xa560..0xba20  (5312 bytes)
DATA_sprites:
	defb 019h,07fh	; a560
	defb 000h,000h	; a562
	defb 0f3h,03fh	; a564
	defb 003h,000h	; a566
	defb 0e5h,09fh	; a568
	defb 005h,080h	; a56a
	defb 0cah,0cfh	; a56c
	defb 00ah,0c0h	; a56e
	defb 0d2h,0e7h	; a570
	defb 012h,0e0h	; a572
	defb 0d0h,0b7h	; a574
	defb 010h,0b0h	; a576
	defb 090h,0f3h	; a578
	defb 010h,0f0h	; a57a
	defb 0a8h,0dbh	; a57c
	defb 028h,0d8h	; a57e
	defb 0b5h,0dbh	; a580
	defb 035h,0d8h	; a582
	defb 0bah,0cbh	; a584
	defb 03ah,0c8h	; a586
	defb 0b6h,0fbh	; a588
	defb 036h,0f8h	; a58a
	defb 0a9h,07bh	; a58c
	defb 029h,078h	; a58e
	defb 08dh,073h	; a590
	defb 00dh,070h	; a592
	defb 0dbh,087h	; a594
	defb 01bh,080h	; a596
	defb 0dbh,0bfh	; a598
	defb 01bh,080h	; a59a
	defb 0c0h,03fh	; a59c
	defb 000h,000h	; a59e
	defb 0ffh,0ffh	; a5a0
	defb 000h,000h	; a5a2
	defb 0feh,001h	; a5a4
	defb 000h,000h	; a5a6
	defb 0f8h,0fdh	; a5a8
	defb 000h,0fch	; a5aa
	defb 0e3h,085h	; a5ac
	defb 003h,084h	; a5ae
	defb 0cfh,015h	; a5b0
	defb 00fh,014h	; a5b2
	defb 0d4h,02dh	; a5b4
	defb 014h,02ch	; a5b6
	defb 083h,01dh	; a5b8
	defb 003h,01ch	; a5ba
	defb 03ah,0edh	; a5bc
	defb 03ah,0ech	; a5be
	defb 072h,0f9h	; a5c0
	defb 072h,0f8h	; a5c2
	defb 06dh,0ebh	; a5c4
	defb 06dh,0e8h	; a5c6
	defb 01dh,0dbh	; a5c8
	defb 01dh,0d8h	; a5ca
	defb 0bbh,093h	; a5cc
	defb 03bh,090h	; a5ce
	defb 095h,0e7h	; a5d0
	defb 015h,0e0h	; a5d2
	defb 0c0h,0cfh	; a5d4
	defb 000h,0c0h	; a5d6
	defb 0feh,01fh	; a5d8
	defb 000h,000h	; a5da
	defb 0ffh,0ffh	; a5dc
	defb 000h,000h	; a5de
	defb 0ffh,0ffh	; a5e0
	defb 000h,000h	; a5e2
	defb 0e0h,03fh	; a5e4
	defb 000h,000h	; a5e6
	defb 00fh,087h	; a5e8
	defb 00fh,080h	; a5ea
	defb 067h,073h	; a5ec
	defb 067h,070h	; a5ee
	defb 07ah,089h	; a5f0
	defb 07ah,088h	; a5f2
	defb 015h,004h	; a5f4
	defb 015h,004h	; a5f6
	defb 066h,01ah	; a5f8
	defb 066h,01ah	; a5fa
	defb 079h,006h	; a5fc
	defb 079h,006h	; a5fe
	defb 067h,0fch	; a600
	defb 067h,0fch	; a602
	defb 01fh,0d9h	; a604
	defb 01fh,0d8h	; a606
	defb 0dch,073h	; a608
	defb 01ch,070h	; a60a
	defb 0ddh,0e7h	; a60c
	defb 01dh,0e0h	; a60e
	defb 0cfh,08fh	; a610
	defb 00fh,080h	; a612
	defb 0e0h,03fh	; a614
	defb 000h,000h	; a616
	defb 0ffh,0ffh	; a618
	defb 000h,000h	; a61a
	defb 0ffh,0ffh	; a61c
	defb 000h,000h	; a61e
	defb 0f8h,07fh	; a620
	defb 000h,000h	; a622
	defb 0e3h,03fh	; a624
	defb 003h,000h	; a626
	defb 0cbh,08fh	; a628
	defb 00bh,080h	; a62a
	defb 0ddh,0a7h	; a62c
	defb 01dh,0a0h	; a62e
	defb 0ceh,097h	; a630
	defb 00eh,090h	; a632
	defb 0d6h,033h	; a634
	defb 016h,030h	; a636
	defb 0c9h,0dbh	; a638
	defb 009h,0d8h	; a63a
	defb 09eh,059h	; a63c
	defb 01eh,058h	; a63e
	defb 0bfh,08dh	; a640
	defb 03fh,08ch	; a642
	defb 0b7h,085h	; a644
	defb 037h,084h	; a646
	defb 093h,0a5h	; a648
	defb 013h,0a4h	; a64a
	defb 0cdh,055h	; a64c
	defb 00dh,054h	; a64e
	defb 0e7h,0e5h	; a650
	defb 007h,0e4h	; a652
	defb 0f0h,0fdh	; a654
	defb 000h,0fch	; a656
	defb 0feh,001h	; a658
	defb 000h,000h	; a65a
	defb 0ffh,0ffh	; a65c
	defb 000h,000h	; a65e
	defb 0fch,003h	; a660
	defb 000h,000h	; a662
	defb 0fdh,0dbh	; a664
	defb 001h,0d8h	; a666
	defb 0e1h,0dbh	; a668
	defb 001h,0d8h	; a66a
	defb 0ceh,0b1h	; a66c
	defb 00eh,0b0h	; a66e
	defb 0deh,095h	; a670
	defb 01eh,094h	; a672
	defb 0dfh,06dh	; a674
	defb 01fh,06ch	; a676
	defb 0d3h,05dh	; a678
	defb 013h,05ch	; a67a
	defb 0dbh,0adh	; a67c
	defb 01bh,0ach	; a67e
	defb 0dbh,015h	; a680
	defb 01bh,014h	; a682
	defb 0cfh,009h	; a684
	defb 00fh,008h	; a686
	defb 0edh,00bh	; a688
	defb 00dh,008h	; a68a
	defb 0e7h,04bh	; a68c
	defb 007h,048h	; a68e
	defb 0f3h,053h	; a690
	defb 003h,050h	; a692
	defb 0f9h,0a7h	; a694
	defb 001h,0a0h	; a696
	defb 0fch,0cfh	; a698
	defb 000h,0c0h	; a69a
	defb 0feh,01fh	; a69c
	defb 000h,000h	; a69e
	defb 0ffh,0ffh	; a6a0
	defb 000h,000h	; a6a2
	defb 0f8h,07fh	; a6a4
	defb 000h,000h	; a6a6
	defb 0f3h,003h	; a6a8
	defb 003h,000h	; a6aa
	defb 0e7h,0a9h	; a6ac
	defb 007h,0a8h	; a6ae
	defb 0c9h,0ddh	; a6b0
	defb 009h,0dch	; a6b2
	defb 0dbh,0b8h	; a6b4
	defb 01bh,0b8h	; a6b6
	defb 0d7h,0b6h	; a6b8
	defb 017h,0b6h	; a6ba
	defb 09fh,04eh	; a6bc
	defb 01fh,04eh	; a6be
	defb 0b7h,05ch	; a6c0
	defb 037h,05ch	; a6c2
	defb 0b8h,0c1h	; a6c4
	defb 038h,0c0h	; a6c6
	defb 0b4h,02bh	; a6c8
	defb 034h,028h	; a6ca
	defb 0a8h,0f3h	; a6cc
	defb 028h,0f0h	; a6ce
	defb 0a1h,0c7h	; a6d0
	defb 021h,0c0h	; a6d2
	defb 0bfh,01fh	; a6d4
	defb 03fh,000h	; a6d6
	defb 080h,07fh	; a6d8
	defb 000h,000h	; a6da
	defb 0ffh,0ffh	; a6dc
	defb 000h,000h	; a6de
	defb 0ffh,0ffh	; a6e0
	defb 000h,000h	; a6e2
	defb 0ffh,0ffh	; a6e4
	defb 000h,000h	; a6e6
	defb 0fch,007h	; a6e8
	defb 000h,000h	; a6ea
	defb 0f1h,0f3h	; a6ec
	defb 001h,0f0h	; a6ee
	defb 0e7h,0bbh	; a6f0
	defb 007h,0b8h	; a6f2
	defb 0ceh,03bh	; a6f4
	defb 00eh,038h	; a6f6
	defb 09bh,0f8h	; a6f8
	defb 01bh,0f8h	; a6fa
	defb 03fh,0e6h	; a6fc
	defb 03fh,0e6h	; a6fe
	defb 060h,09eh	; a700
	defb 060h,09eh	; a702
	defb 058h,066h	; a704
	defb 058h,066h	; a706
	defb 020h,0a8h	; a708
	defb 020h,0a8h	; a70a
	defb 091h,05eh	; a70c
	defb 011h,05eh	; a70e
	defb 0ceh,0e6h	; a710
	defb 00eh,0e6h	; a712
	defb 0e1h,0f0h	; a714
	defb 001h,0f0h	; a716
	defb 0fch,007h	; a718
	defb 000h,000h	; a71a
	defb 0ffh,0ffh	; a71c
	defb 000h,000h	; a71e
	defb 0ffh,0ffh	; a720
	defb 000h,000h	; a722
	defb 080h,07fh	; a724
	defb 000h,000h	; a726
	defb 0bfh,00fh	; a728
	defb 03fh,000h	; a72a
	defb 0a7h,0e7h	; a72c
	defb 027h,0e0h	; a72e
	defb 0aah,0b3h	; a730
	defb 02ah,0b0h	; a732
	defb 0a5h,0c9h	; a734
	defb 025h,0c8h	; a736
	defb 0a1h,0edh	; a738
	defb 021h,0ech	; a73a
	defb 0b1h,0fdh	; a73c
	defb 031h,0fch	; a73e
	defb 09ah,079h	; a740
	defb 01ah,078h	; a742
	defb 0dbh,093h	; a744
	defb 01bh,090h	; a746
	defb 0cch,06bh	; a748
	defb 00ch,068h	; a74a
	defb 0e9h,073h	; a74c
	defb 009h,070h	; a74e
	defb 0e5h,0bbh	; a750
	defb 005h,0b8h	; a752
	defb 0f1h,0d3h	; a754
	defb 001h,0d0h	; a756
	defb 0fch,0c7h	; a758
	defb 000h,0c0h	; a75a
	defb 0feh,01fh	; a75c
	defb 000h,000h	; a75e
	defb 0fch,03fh	; a760
	defb 000h,000h	; a762
	defb 0f1h,08fh	; a764
	defb 001h,080h	; a766
	defb 0e6h,067h	; a768
	defb 006h,060h	; a76a
	defb 0cch,0b3h	; a76c
	defb 00ch,0b0h	; a76e
	defb 09dh,039h	; a770
	defb 01dh,038h	; a772
	defb 0b5h,02dh	; a774
	defb 035h,02ch	; a776
	defb 03ch,03ch	; a778
	defb 03ch,03ch	; a77a
	defb 06ch,036h	; a77c
	defb 06ch,036h	; a77e
	defb 06eh,076h	; a780
	defb 06eh,076h	; a782
	defb 04dh,0b2h	; a784
	defb 04dh,0b2h	; a786
	defb 07dh,0beh	; a788
	defb 07dh,0beh	; a78a
	defb 07bh,0deh	; a78c
	defb 07bh,0deh	; a78e
	defb 015h,0a8h	; a790
	defb 015h,0a8h	; a792
	defb 0ceh,073h	; a794
	defb 00eh,070h	; a796
	defb 0eeh,077h	; a798
	defb 00eh,070h	; a79a
	defb 0e0h,007h	; a79c
	defb 000h,000h	; a79e
	defb 0fch,007h	; a7a0
	defb 000h,000h	; a7a2
	defb 0e1h,0f1h	; a7a4
	defb 001h,0f0h	; a7a6
	defb 0cfh,07dh	; a7a8
	defb 00fh,07ch	; a7aa
	defb 09dh,0c4h	; a7ac
	defb 01dh,0c4h	; a7ae
	defb 0b3h,096h	; a7b0
	defb 033h,096h	; a7b2
	defb 0b7h,026h	; a7b4
	defb 037h,026h	; a7b6
	defb 0bfh,00eh	; a7b8
	defb 03fh,00eh	; a7ba
	defb 088h,09ah	; a7bc
	defb 008h,09ah	; a7be
	defb 097h,07eh	; a7c0
	defb 017h,07eh	; a7c2
	defb 0bbh,074h	; a7c4
	defb 03bh,074h	; a7c6
	defb 0b5h,06dh	; a7c8
	defb 035h,06ch	; a7ca
	defb 082h,0cdh	; a7cc
	defb 002h,0cch	; a7ce
	defb 0f7h,079h	; a7d0
	defb 007h,078h	; a7d2
	defb 0f6h,073h	; a7d4
	defb 006h,070h	; a7d6
	defb 0f0h,007h	; a7d8
	defb 000h,000h	; a7da
	defb 0ffh,0ffh	; a7dc
	defb 000h,000h	; a7de
	defb 0e0h,03fh	; a7e0
	defb 000h,000h	; a7e2
	defb 0efh,08fh	; a7e4
	defb 00fh,080h	; a7e6
	defb 0cdh,0e7h	; a7e8
	defb 00dh,0e0h	; a7ea
	defb 01ch,073h	; a7ec
	defb 01ch,070h	; a7ee
	defb 06fh,0d9h	; a7f0
	defb 06fh,0d8h	; a7f2
	defb 077h,0fdh	; a7f4
	defb 077h,0fch	; a7f6
	defb 069h,004h	; a7f8
	defb 069h,004h	; a7fa
	defb 01eh,032h	; a7fc
	defb 01eh,032h	; a7fe
	defb 01eh,00ah	; a800
	defb 01eh,00ah	; a802
	defb 069h,004h	; a804
	defb 069h,004h	; a806
	defb 077h,0fdh	; a808
	defb 077h,0fch	; a80a
	defb 06fh,0d9h	; a80c
	defb 06fh,0d8h	; a80e
	defb 01ch,073h	; a810
	defb 01ch,070h	; a812
	defb 0cdh,0e7h	; a814
	defb 00dh,0e0h	; a816
	defb 0efh,08fh	; a818
	defb 00fh,080h	; a81a
	defb 0e0h,03fh	; a81c
	defb 000h,000h	; a81e
	defb 0ffh,0ffh	; a820
	defb 000h,000h	; a822
	defb 0f0h,007h	; a824
	defb 000h,000h	; a826
	defb 0f6h,073h	; a828
	defb 006h,070h	; a82a
	defb 0f7h,079h	; a82c
	defb 007h,078h	; a82e
	defb 082h,0cdh	; a830
	defb 002h,0cch	; a832
	defb 0b5h,06dh	; a834
	defb 035h,06ch	; a836
	defb 0bbh,074h	; a838
	defb 03bh,074h	; a83a
	defb 097h,07eh	; a83c
	defb 017h,07eh	; a83e
	defb 088h,09ah	; a840
	defb 008h,09ah	; a842
	defb 0bfh,00eh	; a844
	defb 03fh,00eh	; a846
	defb 0b7h,026h	; a848
	defb 037h,026h	; a84a
	defb 0b3h,096h	; a84c
	defb 033h,096h	; a84e
	defb 09dh,0c4h	; a850
	defb 01dh,0c4h	; a852
	defb 0cfh,07dh	; a854
	defb 00fh,07ch	; a856
	defb 0e1h,0f1h	; a858
	defb 001h,0f0h	; a85a
	defb 0fch,007h	; a85c
	defb 000h,000h	; a85e
	defb 0e0h,007h	; a860
	defb 000h,000h	; a862
	defb 0eeh,077h	; a864
	defb 00eh,070h	; a866
	defb 0ceh,073h	; a868
	defb 00eh,070h	; a86a
	defb 015h,0a8h	; a86c
	defb 015h,0a8h	; a86e
	defb 07bh,0deh	; a870
	defb 07bh,0deh	; a872
	defb 07dh,0beh	; a874
	defb 07dh,0beh	; a876
	defb 04dh,0b2h	; a878
	defb 04dh,0b2h	; a87a
	defb 06eh,076h	; a87c
	defb 06eh,076h	; a87e
	defb 06ch,036h	; a880
	defb 06ch,036h	; a882
	defb 03ch,03ch	; a884
	defb 03ch,03ch	; a886
	defb 0b4h,0adh	; a888
	defb 034h,0ach	; a88a
	defb 09ch,0b9h	; a88c
	defb 01ch,0b8h	; a88e
	defb 0cdh,033h	; a890
	defb 00dh,030h	; a892
	defb 0e6h,067h	; a894
	defb 006h,060h	; a896
	defb 0f1h,08fh	; a898
	defb 001h,080h	; a89a
	defb 0fch,03fh	; a89c
	defb 000h,000h	; a89e
	defb 0ffh,0ffh	; a8a0
	defb 000h,000h	; a8a2
	defb 0e0h,00fh	; a8a4
	defb 000h,000h	; a8a6
	defb 0ceh,06fh	; a8a8
	defb 00eh,060h	; a8aa
	defb 09eh,0efh	; a8ac
	defb 01eh,0e0h	; a8ae
	defb 0b3h,041h	; a8b0
	defb 033h,040h	; a8b2
	defb 0b6h,0adh	; a8b4
	defb 036h,0ach	; a8b6
	defb 02eh,0ddh	; a8b8
	defb 02eh,0dch	; a8ba
	defb 07eh,0e9h	; a8bc
	defb 07eh,0e8h	; a8be
	defb 059h,011h	; a8c0
	defb 059h,010h	; a8c2
	defb 070h,0fdh	; a8c4
	defb 070h,0fch	; a8c6
	defb 064h,0edh	; a8c8
	defb 064h,0ech	; a8ca
	defb 069h,0cdh	; a8cc
	defb 069h,0cch	; a8ce
	defb 023h,0b9h	; a8d0
	defb 023h,0b8h	; a8d2
	defb 0beh,0f3h	; a8d4
	defb 03eh,0f0h	; a8d6
	defb 08fh,087h	; a8d8
	defb 00fh,080h	; a8da
	defb 0e0h,03fh	; a8dc
	defb 000h,000h	; a8de
	defb 0fch,007h	; a8e0
	defb 000h,000h	; a8e2
	defb 0f1h,0f7h	; a8e4
	defb 001h,0f0h	; a8e6
	defb 0e7h,0b3h	; a8e8
	defb 007h,0b0h	; a8ea
	defb 0ceh,038h	; a8ec
	defb 00eh,038h	; a8ee
	defb 09bh,0f6h	; a8f0
	defb 01bh,0f6h	; a8f2
	defb 0bfh,0eeh	; a8f4
	defb 03fh,0eeh	; a8f6
	defb 020h,096h	; a8f8
	defb 020h,096h	; a8fa
	defb 050h,078h	; a8fc
	defb 050h,078h	; a8fe
	defb 04ch,078h	; a900
	defb 04ch,078h	; a902
	defb 020h,096h	; a904
	defb 020h,096h	; a906
	defb 0bfh,0eeh	; a908
	defb 03fh,0eeh	; a90a
	defb 09bh,0f6h	; a90c
	defb 01bh,0f6h	; a90e
	defb 0ceh,038h	; a910
	defb 00eh,038h	; a912
	defb 0e7h,0b3h	; a914
	defb 007h,0b0h	; a916
	defb 0f1h,0f7h	; a918
	defb 001h,0f0h	; a91a
	defb 0fch,007h	; a91c
	defb 000h,000h	; a91e
	defb 0e0h,03fh	; a920
	defb 000h,000h	; a922
	defb 08fh,087h	; a924
	defb 00fh,080h	; a926
	defb 0beh,0f3h	; a928
	defb 03eh,0f0h	; a92a
	defb 023h,0b9h	; a92c
	defb 023h,0b8h	; a92e
	defb 069h,0cdh	; a930
	defb 069h,0cch	; a932
	defb 064h,0edh	; a934
	defb 064h,0ech	; a936
	defb 070h,0fdh	; a938
	defb 070h,0fch	; a93a
	defb 059h,011h	; a93c
	defb 059h,010h	; a93e
	defb 07eh,0e9h	; a940
	defb 07eh,0e8h	; a942
	defb 02eh,0ddh	; a944
	defb 02eh,0dch	; a946
	defb 0b6h,0adh	; a948
	defb 036h,0ach	; a94a
	defb 0b3h,041h	; a94c
	defb 033h,040h	; a94e
	defb 09eh,0efh	; a950
	defb 01eh,0e0h	; a952
	defb 0ceh,06fh	; a954
	defb 00eh,060h	; a956
	defb 0e0h,00fh	; a958
	defb 000h,000h	; a95a
	defb 0ffh,0ffh	; a95c
	defb 000h,000h	; a95e
	defb 0feh,01fh	; a960
	defb 000h,000h	; a962
	defb 0fch,0cfh	; a964
	defb 000h,0c0h	; a966
	defb 0f9h,0a7h	; a968
	defb 001h,0a0h	; a96a
	defb 0f3h,053h	; a96c
	defb 003h,050h	; a96e
	defb 0e7h,04bh	; a970
	defb 007h,048h	; a972
	defb 0edh,00bh	; a974
	defb 00dh,008h	; a976
	defb 0cfh,009h	; a978
	defb 00fh,008h	; a97a
	defb 0dbh,015h	; a97c
	defb 01bh,014h	; a97e
	defb 0dbh,0adh	; a980
	defb 01bh,0ach	; a982
	defb 0d3h,05dh	; a984
	defb 013h,05ch	; a986
	defb 0dfh,06dh	; a988
	defb 01fh,06ch	; a98a
	defb 0deh,095h	; a98c
	defb 01eh,094h	; a98e
	defb 0ceh,0b1h	; a990
	defb 00eh,0b0h	; a992
	defb 0e1h,0dbh	; a994
	defb 001h,0d8h	; a996
	defb 0fdh,0dbh	; a998
	defb 001h,0d8h	; a99a
	defb 0fch,003h	; a99c
	defb 000h,000h	; a99e
	defb 0ffh,0ffh	; a9a0
	defb 000h,000h	; a9a2
	defb 0feh,001h	; a9a4
	defb 000h,000h	; a9a6
	defb 0f0h,0fdh	; a9a8
	defb 000h,0fch	; a9aa
	defb 0e7h,0e5h	; a9ac
	defb 007h,0e4h	; a9ae
	defb 0cdh,055h	; a9b0
	defb 00dh,054h	; a9b2
	defb 093h,0a5h	; a9b4
	defb 013h,0a4h	; a9b6
	defb 0b7h,085h	; a9b8
	defb 037h,084h	; a9ba
	defb 0bfh,08dh	; a9bc
	defb 03fh,08ch	; a9be
	defb 09eh,059h	; a9c0
	defb 01eh,058h	; a9c2
	defb 0c9h,0dbh	; a9c4
	defb 009h,0d8h	; a9c6
	defb 0d6h,033h	; a9c8
	defb 016h,030h	; a9ca
	defb 0ceh,097h	; a9cc
	defb 00eh,090h	; a9ce
	defb 0ddh,0a7h	; a9d0
	defb 01dh,0a0h	; a9d2
	defb 0cbh,08fh	; a9d4
	defb 00bh,080h	; a9d6
	defb 0e3h,03fh	; a9d8
	defb 003h,000h	; a9da
	defb 0f8h,07fh	; a9dc
	defb 000h,000h	; a9de
	defb 0ffh,0ffh	; a9e0
	defb 000h,000h	; a9e2
	defb 0ffh,0ffh	; a9e4
	defb 000h,000h	; a9e6
	defb 0e0h,03fh	; a9e8
	defb 000h,000h	; a9ea
	defb 0cfh,08fh	; a9ec
	defb 00fh,080h	; a9ee
	defb 0ddh,0e7h	; a9f0
	defb 01dh,0e0h	; a9f2
	defb 0dch,073h	; a9f4
	defb 01ch,070h	; a9f6
	defb 01fh,0d9h	; a9f8
	defb 01fh,0d8h	; a9fa
	defb 067h,0fch	; a9fc
	defb 067h,0fch	; a9fe
	defb 079h,006h	; aa00
	defb 079h,006h	; aa02
	defb 066h,01ah	; aa04
	defb 066h,01ah	; aa06
	defb 015h,004h	; aa08
	defb 015h,004h	; aa0a
	defb 07ah,089h	; aa0c
	defb 07ah,088h	; aa0e
	defb 067h,073h	; aa10
	defb 067h,070h	; aa12
	defb 00fh,087h	; aa14
	defb 00fh,080h	; aa16
	defb 0e0h,03fh	; aa18
	defb 000h,000h	; aa1a
	defb 0ffh,0ffh	; aa1c
	defb 000h,000h	; aa1e
	defb 0ffh,0ffh	; aa20
	defb 000h,000h	; aa22
	defb 0feh,01fh	; aa24
	defb 000h,000h	; aa26
	defb 0c0h,0cfh	; aa28
	defb 000h,0c0h	; aa2a
	defb 095h,0e7h	; aa2c
	defb 015h,0e0h	; aa2e
	defb 0bbh,09bh	; aa30
	defb 03bh,090h	; aa32
	defb 01dh,0dbh	; aa34
	defb 01dh,0d8h	; aa36
	defb 06dh,0ebh	; aa38
	defb 06dh,0e8h	; aa3a
	defb 072h,0f9h	; aa3c
	defb 072h,0f8h	; aa3e
	defb 03ah,0edh	; aa40
	defb 03ah,0ech	; aa42
	defb 083h,01dh	; aa44
	defb 003h,01ch	; aa46
	defb 0d4h,02dh	; aa48
	defb 014h,02ch	; aa4a
	defb 0cfh,015h	; aa4c
	defb 00fh,014h	; aa4e
	defb 0e3h,085h	; aa50
	defb 003h,084h	; aa52
	defb 0f8h,0fdh	; aa54
	defb 000h,0fch	; aa56
	defb 0feh,001h	; aa58
	defb 000h,000h	; aa5a
	defb 0ffh,0ffh	; aa5c
	defb 000h,000h	; aa5e
	defb 0c0h,03fh	; aa60
	defb 000h,000h	; aa62
	defb 0dbh,0bfh	; aa64
	defb 01bh,080h	; aa66
	defb 0dbh,087h	; aa68
	defb 01bh,080h	; aa6a
	defb 08dh,073h	; aa6c
	defb 00dh,070h	; aa6e
	defb 0a9h,07bh	; aa70
	defb 029h,078h	; aa72
	defb 0b6h,0fbh	; aa74
	defb 036h,0f8h	; aa76
	defb 0bah,0cbh	; aa78
	defb 03ah,0c8h	; aa7a
	defb 0b5h,0dbh	; aa7c
	defb 035h,0d8h	; aa7e
	defb 0a8h,0dbh	; aa80
	defb 028h,0d8h	; aa82
	defb 090h,0f3h	; aa84
	defb 010h,0f0h	; aa86
	defb 0d0h,0b7h	; aa88
	defb 010h,0b0h	; aa8a
	defb 0d2h,0e7h	; aa8c
	defb 012h,0e0h	; aa8e
	defb 0cah,0cfh	; aa90
	defb 00ah,0c0h	; aa92
	defb 0e5h,09fh	; aa94
	defb 005h,080h	; aa96
	defb 0f3h,03fh	; aa98
	defb 003h,000h	; aa9a
	defb 0f8h,07fh	; aa9c
	defb 000h,000h	; aa9e
	defb 0feh,01fh	; aaa0
	defb 000h,000h	; aaa2
	defb 0fch,0c7h	; aaa4
	defb 000h,0c0h	; aaa6
	defb 0f1h,0d3h	; aaa8
	defb 001h,0d0h	; aaaa
	defb 0e5h,0bbh	; aaac
	defb 005h,0b8h	; aaae
	defb 0e9h,073h	; aab0
	defb 009h,070h	; aab2
	defb 0cch,06bh	; aab4
	defb 00ch,068h	; aab6
	defb 0dbh,093h	; aab8
	defb 01bh,090h	; aaba
	defb 09ah,079h	; aabc
	defb 01ah,078h	; aabe
	defb 0b1h,0fdh	; aac0
	defb 031h,0fch	; aac2
	defb 0a1h,0edh	; aac4
	defb 021h,0ech	; aac6
	defb 0a5h,0c9h	; aac8
	defb 025h,0c8h	; aaca
	defb 0aah,0b3h	; aacc
	defb 02ah,0b0h	; aace
	defb 0a7h,0e7h	; aad0
	defb 027h,0e0h	; aad2
	defb 0bfh,00fh	; aad4
	defb 03fh,000h	; aad6
	defb 080h,07fh	; aad8
	defb 000h,000h	; aada
	defb 0ffh,0ffh	; aadc
	defb 000h,000h	; aade
	defb 0ffh,0ffh	; aae0
	defb 000h,000h	; aae2
	defb 0fch,007h	; aae4
	defb 000h,000h	; aae6
	defb 0e1h,0f0h	; aae8
	defb 001h,0f0h	; aaea
	defb 0ceh,0e6h	; aaec
	defb 00eh,0e6h	; aaee
	defb 091h,05eh	; aaf0
	defb 011h,05eh	; aaf2
	defb 020h,0a8h	; aaf4
	defb 020h,0a8h	; aaf6
	defb 058h,066h	; aaf8
	defb 058h,066h	; aafa
	defb 060h,09eh	; aafc
	defb 060h,09eh	; aafe
	defb 03fh,0e6h	; ab00
	defb 03fh,0e6h	; ab02
	defb 09bh,0f8h	; ab04
	defb 01bh,0f8h	; ab06
	defb 0ceh,03bh	; ab08
	defb 00eh,038h	; ab0a
	defb 0e7h,0bbh	; ab0c
	defb 007h,0b8h	; ab0e
	defb 0f9h,0f3h	; ab10
	defb 001h,0f0h	; ab12
	defb 0fch,007h	; ab14
	defb 000h,000h	; ab16
	defb 0ffh,0ffh	; ab18
	defb 000h,000h	; ab1a
	defb 0ffh,0ffh	; ab1c
	defb 000h,000h	; ab1e
	defb 0ffh,0ffh	; ab20
	defb 000h,000h	; ab22
	defb 080h,07fh	; ab24
	defb 000h,000h	; ab26
	defb 0bfh,01fh	; ab28
	defb 03fh,000h	; ab2a
	defb 0a1h,0c7h	; ab2c
	defb 021h,0c0h	; ab2e
	defb 0a8h,0f3h	; ab30
	defb 028h,0f0h	; ab32
	defb 0b4h,029h	; ab34
	defb 034h,028h	; ab36
	defb 0b8h,0c1h	; ab38
	defb 038h,0c0h	; ab3a
	defb 0b7h,05ch	; ab3c
	defb 037h,05ch	; ab3e
	defb 09fh,04eh	; ab40
	defb 01fh,04eh	; ab42
	defb 0d7h,0b6h	; ab44
	defb 017h,0b6h	; ab46
	defb 0dbh,0b8h	; ab48
	defb 01bh,0b8h	; ab4a
	defb 0c9h,0ddh	; ab4c
	defb 009h,0dch	; ab4e
	defb 0e7h,0a9h	; ab50
	defb 007h,0a8h	; ab52
	defb 0f3h,003h	; ab54
	defb 003h,000h	; ab56
	defb 0f8h,07fh	; ab58
	defb 000h,000h	; ab5a
	defb 0ffh,0ffh	; ab5c
	defb 000h,000h	; ab5e
	defb 07fh,0feh	; ab60
	defb 080h,000h	; ab62
	defb 07fh,0feh	; ab64
	defb 07fh,0ffh	; ab66
	defb 000h,000h	; ab68
	defb 0aah,0aah	; ab6a
	defb 000h,000h	; ab6c
	defb 055h,055h	; ab6e
	defb 07fh,0feh	; ab70
	defb 080h,000h	; ab72
	defb 07fh,0feh	; ab74
	defb 07fh,0ffh	; ab76
	defb 000h,000h	; ab78
	defb 0aah,0aah	; ab7a
	defb 000h,000h	; ab7c
	defb 055h,055h	; ab7e
	defb 07fh,0feh	; ab80
	defb 080h,000h	; ab82
	defb 07fh,0feh	; ab84
	defb 07fh,0ffh	; ab86
	defb 000h,000h	; ab88
	defb 0aah,0aah	; ab8a
	defb 000h,000h	; ab8c
	defb 055h,055h	; ab8e
	defb 07fh,0feh	; ab90
	defb 080h,000h	; ab92
	defb 07fh,0feh	; ab94
	defb 07fh,0ffh	; ab96
	defb 000h,000h	; ab98
	defb 0aah,0aah	; ab9a
	defb 000h,000h	; ab9c
	defb 055h,055h	; ab9e
	defb 0ffh,0c0h	; aba0
	defb 000h,000h	; aba2
	defb 0ffh,01ah	; aba4
	defb 000h,01ah	; aba6
	defb 0fch,055h	; aba8
	defb 000h,055h	; abaa
	defb 0f9h,07fh	; abac
	defb 001h,07fh	; abae
	defb 0f2h,0f0h	; abb0
	defb 002h,0f0h	; abb2
	defb 0e5h,085h	; abb4
	defb 005h,081h	; abb6
	defb 0cbh,03ch	; abb8
	defb 00bh,000h	; abba
	defb 0d6h,07dh	; abbc
	defb 016h,001h	; abbe
	defb 08ch,0f8h	; abc0
	defb 00ch,000h	; abc2
	defb 0b9h,0e2h	; abc4
	defb 038h,002h	; abc6
	defb 09bh,0c9h	; abc8
	defb 018h,009h	; abca
	defb 03bh,090h	; abcc
	defb 038h,010h	; abce
	defb 053h,0a7h	; abd0
	defb 050h,027h	; abd2
	defb 037h,00ch	; abd4
	defb 030h,00ch	; abd6
	defb 050h,048h	; abd8
	defb 050h,048h	; abda
	defb 035h,028h	; abdc
	defb 035h,028h	; abde
	defb 007h,0ffh	; abe0
	defb 000h,000h	; abe2
	defb 0b0h,0ffh	; abe4
	defb 0b0h,000h	; abe6
	defb 05ah,03fh	; abe8
	defb 05ah,000h	; abea
	defb 0fdh,09fh	; abec
	defb 0fdh,080h	; abee
	defb 08fh,04fh	; abf0
	defb 08fh,040h	; abf2
	defb 0a1h,0e7h	; abf4
	defb 081h,0e0h	; abf6
	defb 0bch,0f3h	; abf8
	defb 080h,0f0h	; abfa
	defb 0beh,06bh	; abfc
	defb 080h,068h	; abfe
	defb 01fh,039h	; ac00
	defb 000h,038h	; ac02
	defb 087h,09dh	; ac04
	defb 080h,01ch	; ac06
	defb 053h,0cdh	; ac08
	defb 050h,00ch	; ac0a
	defb 009h,0d4h	; ac0c
	defb 008h,014h	; ac0e
	defb 0e5h,0ceh	; ac10
	defb 0e4h,00eh	; ac12
	defb 030h,0eah	; ac14
	defb 030h,00ah	; ac16
	defb 016h,006h	; ac18
	defb 016h,006h	; ac1a
	defb 056h,0aah	; ac1c
	defb 056h,0aah	; ac1e
	defb 05fh,048h	; ac20
	defb 05fh,048h	; ac22
	defb 030h,029h	; ac24
	defb 030h,029h	; ac26
	defb 057h,00ch	; ac28
	defb 050h,00ch	; ac2a
	defb 073h,0b7h	; ac2c
	defb 070h,037h	; ac2e
	defb 03bh,098h	; ac30
	defb 038h,018h	; ac32
	defb 09bh,0cbh	; ac34
	defb 018h,00bh	; ac36
	defb 0a9h,0e3h	; ac38
	defb 028h,003h	; ac3a
	defb 09ch,0f8h	; ac3c
	defb 01ch,000h	; ac3e
	defb 0d6h,07ch	; ac40
	defb 016h,000h	; ac42
	defb 0cfh,03dh	; ac44
	defb 00fh,001h	; ac46
	defb 0e6h,084h	; ac48
	defb 006h,080h	; ac4a
	defb 0f3h,051h	; ac4c
	defb 003h,051h	; ac4e
	defb 0f9h,0eah	; ac50
	defb 001h,0eah	; ac52
	defb 0fch,07dh	; ac54
	defb 000h,07dh	; ac56
	defb 0ffh,00fh	; ac58
	defb 000h,00fh	; ac5a
	defb 0ffh,0e0h	; ac5c
	defb 000h,000h	; ac5e
	defb 056h,0f6h	; ac60
	defb 056h,0f6h	; ac62
	defb 096h,00ah	; ac64
	defb 096h,00ah	; ac66
	defb 030h,0e6h	; ac68
	defb 030h,006h	; ac6a
	defb 0edh,0ceh	; ac6c
	defb 0ech,00eh	; ac6e
	defb 019h,0d4h	; ac70
	defb 018h,014h	; ac72
	defb 0d3h,0cdh	; ac74
	defb 0d0h,00ch	; ac76
	defb 0c7h,09dh	; ac78
	defb 0c0h,01ch	; ac7a
	defb 01fh,029h	; ac7c
	defb 000h,028h	; ac7e
	defb 0beh,05bh	; ac80
	defb 080h,058h	; ac82
	defb 0bch,0b3h	; ac84
	defb 080h,0b0h	; ac86
	defb 0a1h,067h	; ac88
	defb 081h,060h	; ac8a
	defb 08ah,0cfh	; ac8c
	defb 08ah,0c0h	; ac8e
	defb 0b7h,09fh	; ac90
	defb 0b7h,080h	; ac92
	defb 05eh,03fh	; ac94
	defb 05eh,000h	; ac96
	defb 0f0h,0ffh	; ac98
	defb 0f0h,000h	; ac9a
	defb 007h,0ffh	; ac9c
	defb 000h,000h	; ac9e
	defb 0f0h,0ffh	; aca0
	defb 000h,000h	; aca2
	defb 0c6h,007h	; aca4
	defb 006h,000h	; aca6
	defb 097h,0b1h	; aca8
	defb 017h,0b0h	; acaa
	defb 033h,0bch	; acac
	defb 033h,0bch	; acae
	defb 06eh,036h	; acb0
	defb 06eh,036h	; acb2
	defb 05fh,0d8h	; acb4
	defb 05fh,0d8h	; acb6
	defb 016h,06ch	; acb8
	defb 016h,06ch	; acba
	defb 0b5h,0eah	; acbc
	defb 035h,0eah	; acbe
	defb 0bbh,0deh	; acc0
	defb 03bh,0deh	; acc2
	defb 095h,0fah	; acc4
	defb 015h,0fah	; acc6
	defb 097h,044h	; acc8
	defb 017h,044h	; acca
	defb 0b8h,0f9h	; accc
	defb 038h,0f8h	; acce
	defb 0bdh,06bh	; acd0
	defb 03dh,068h	; acd2
	defb 09bh,033h	; acd4
	defb 01bh,030h	; acd6
	defb 0c6h,007h	; acd8
	defb 006h,000h	; acda
	defb 0f0h,0ffh	; acdc
	defb 000h,000h	; acde
	defb 0f0h,01fh	; ace0
	defb 000h,000h	; ace2
	defb 0e7h,043h	; ace4
	defb 007h,040h	; ace6
	defb 08ch,0fbh	; ace8
	defb 00ch,0f8h	; acea
	defb 02bh,068h	; acec
	defb 02bh,068h	; acee
	defb 07bh,076h	; acf0
	defb 07bh,076h	; acf2
	defb 07fh,0b6h	; acf4
	defb 07fh,0b6h	; acf6
	defb 04fh,0f6h	; acf8
	defb 04fh,0f6h	; acfa
	defb 03dh,0eeh	; acfc
	defb 03dh,0eeh	; acfe
	defb 09bh,0fch	; ad00
	defb 01bh,0fch	; ad02
	defb 0b6h,0eeh	; ad04
	defb 036h,0eeh	; ad06
	defb 097h,01ch	; ad08
	defb 017h,01ch	; ad0a
	defb 0dbh,0edh	; ad0c
	defb 01bh,0ech	; ad0e
	defb 0d5h,0f1h	; ad10
	defb 015h,0f0h	; ad12
	defb 0cfh,077h	; ad14
	defb 00fh,070h	; ad16
	defb 0e7h,007h	; ad18
	defb 007h,000h	; ad1a
	defb 0f0h,07fh	; ad1c
	defb 000h,000h	; ad1e
	defb 0feh,03fh	; ad20
	defb 000h,000h	; ad22
	defb 086h,0bfh	; ad24
	defb 000h,080h	; ad26
	defb 0b6h,03fh	; ad28
	defb 030h,000h	; ad2a
	defb 086h,018h	; ad2c
	defb 000h,000h	; ad2e
	defb 0f0h,0c2h	; ad30
	defb 000h,0c2h	; ad32
	defb 0f7h,0d0h	; ad34
	defb 007h,0d0h	; ad36
	defb 0e2h,0b9h	; ad38
	defb 002h,0b8h	; ad3a
	defb 0edh,0ddh	; ad3c
	defb 00dh,0dch	; ad3e
	defb 0edh,0d5h	; ad40
	defb 00dh,0d4h	; ad42
	defb 0e7h,0f9h	; ad44
	defb 007h,0f8h	; ad46
	defb 0f7h,063h	; ad48
	defb 007h,060h	; ad4a
	defb 081h,077h	; ad4c
	defb 001h,070h	; ad4e
	defb 0abh,0a7h	; ad50
	defb 023h,0a0h	; ad52
	defb 089h,087h	; ad54
	defb 001h,080h	; ad56
	defb 0fch,017h	; ad58
	defb 000h,010h	; ad5a
	defb 0ffh,0c7h	; ad5c
	defb 000h,000h	; ad5e
	defb 0dfh,0ffh	; ad60
	defb 000h,000h	; ad62
	defb 0afh,0e3h	; ad64
	defb 020h,000h	; ad66
	defb 0dch,06bh	; ad68
	defb 000h,008h	; ad6a
	defb 0c5h,063h	; ad6c
	defb 001h,000h	; ad6e
	defb 0d4h,03fh	; ad70
	defb 010h,000h	; ad72
	defb 0c1h,09bh	; ad74
	defb 001h,080h	; ad76
	defb 0fah,0d5h	; ad78
	defb 002h,0c4h	; ad7a
	defb 0bbh,095h	; ad7c
	defb 003h,084h	; ad7e
	defb 059h,0dbh	; ad80
	defb 041h,0c0h	; ad82
	defb 040h,018h	; ad84
	defb 040h,000h	; ad86
	defb 0abh,08ah	; ad88
	defb 008h,002h	; ad8a
	defb 0e3h,0a8h	; ad8c
	defb 000h,020h	; ad8e
	defb 0ffh,08fh	; ad90
	defb 000h,000h	; ad92
	defb 0f9h,0ffh	; ad94
	defb 000h,000h	; ad96
	defb 0f6h,0ffh	; ad98
	defb 006h,000h	; ad9a
	defb 0f9h,0ffh	; ad9c
	defb 000h,000h	; ad9e
	defb 0f0h,07fh	; ada0
	defb 000h,000h	; ada2
	defb 0e7h,03fh	; ada4
	defb 007h,000h	; ada6
	defb 0c9h,09fh	; ada8
	defb 009h,080h	; adaa
	defb 0d2h,0cfh	; adac
	defb 012h,0c0h	; adae
	defb 090h,0e3h	; adb0
	defb 010h,0e0h	; adb2
	defb 0b0h,0fbh	; adb4
	defb 030h,0f8h	; adb6
	defb 099h,0cbh	; adb8
	defb 019h,0c8h	; adba
	defb 0aah,0abh	; adbc
	defb 02ah,0a8h	; adbe
	defb 0aah,0abh	; adc0
	defb 02ah,0a8h	; adc2
	defb 09ah,0d3h	; adc4
	defb 01ah,0d0h	; adc6
	defb 0cah,0f7h	; adc8
	defb 00ah,0f0h	; adca
	defb 0e5h,067h	; adcc
	defb 005h,060h	; adce
	defb 0f5h,08fh	; add0
	defb 005h,080h	; add2
	defb 0f5h,0bfh	; add4
	defb 005h,080h	; add6
	defb 0f5h,0bfh	; add8
	defb 005h,080h	; adda
	defb 0f0h,03fh	; addc
	defb 000h,000h	; adde
	defb 0feh,003h	; ade0
	defb 000h,000h	; ade2
	defb 0fch,0fbh	; ade4
	defb 000h,0f8h	; ade6
	defb 0f1h,00bh	; ade8
	defb 001h,008h	; adea
	defb 0e5h,02bh	; adec
	defb 005h,028h	; adee
	defb 0ebh,00bh	; adf0
	defb 00bh,008h	; adf2
	defb 0ech,01bh	; adf4
	defb 00ch,018h	; adf6
	defb 0e3h,079h	; adf8
	defb 003h,078h	; adfa
	defb 0cbh,04dh	; adfc
	defb 00bh,04ch	; adfe
	defb 094h,0d5h	; ae00
	defb 014h,0d4h	; ae02
	defb 0b1h,085h	; ae04
	defb 031h,084h	; ae06
	defb 0adh,0f9h	; ae08
	defb 02dh,0f8h	; ae0a
	defb 09dh,0f3h	; ae0c
	defb 01dh,0f0h	; ae0e
	defb 0d8h,007h	; ae10
	defb 018h,000h	; ae12
	defb 0c3h,0ffh	; ae14
	defb 000h,000h	; ae16
	defb 0ffh,0ffh	; ae18
	defb 000h,000h	; ae1a
	defb 0ffh,0ffh	; ae1c
	defb 000h,000h	; ae1e
	defb 0ffh,0ffh	; ae20
	defb 000h,000h	; ae22
	defb 0fch,00fh	; ae24
	defb 000h,000h	; ae26
	defb 0f9h,0a3h	; ae28
	defb 001h,0a0h	; ae2a
	defb 0f2h,079h	; ae2c
	defb 002h,078h	; ae2e
	defb 007h,0c4h	; ae30
	defb 007h,0c4h	; ae32
	defb 078h,002h	; ae34
	defb 078h,002h	; ae36
	defb 007h,08ah	; ae38
	defb 007h,08ah	; ae3a
	defb 078h,046h	; ae3c
	defb 078h,046h	; ae3e
	defb 077h,0fch	; ae40
	defb 077h,0fch	; ae42
	defb 00eh,079h	; ae44
	defb 00eh,078h	; ae46
	defb 0edh,0b3h	; ae48
	defb 00dh,0b0h	; ae4a
	defb 0e6h,027h	; ae4c
	defb 006h,020h	; ae4e
	defb 0f1h,0efh	; ae50
	defb 001h,0e0h	; ae52
	defb 0fch,00fh	; ae54
	defb 000h,000h	; ae56
	defb 0ffh,0ffh	; ae58
	defb 000h,000h	; ae5a
	defb 0ffh,0ffh	; ae5c
	defb 000h,000h	; ae5e
	defb 0ffh,0ffh	; ae60
	defb 000h,000h	; ae62
	defb 0f0h,0ffh	; ae64
	defb 000h,000h	; ae66
	defb 0c6h,07fh	; ae68
	defb 006h,000h	; ae6a
	defb 0dbh,007h	; ae6c
	defb 01bh,000h	; ae6e
	defb 0dch,0b3h	; ae70
	defb 01ch,0b0h	; ae72
	defb 0cdh,02bh	; ae74
	defb 00dh,028h	; ae76
	defb 0e0h,0d1h	; ae78
	defb 000h,0d0h	; ae7a
	defb 0eeh,0dch	; ae7c
	defb 00eh,0dch	; ae7e
	defb 0efh,002h	; ae80
	defb 00fh,002h	; ae82
	defb 0edh,0c2h	; ae84
	defb 00dh,0c2h	; ae86
	defb 0ech,04ah	; ae88
	defb 00ch,04ah	; ae8a
	defb 0edh,062h	; ae8c
	defb 00dh,062h	; ae8e
	defb 0e4h,0feh	; ae90
	defb 004h,0feh	; ae92
	defb 0f3h,080h	; ae94
	defb 003h,080h	; ae96
	defb 0f8h,03fh	; ae98
	defb 000h,000h	; ae9a
	defb 0ffh,0ffh	; ae9c
	defb 000h,000h	; ae9e
	defb 0fch,00fh	; aea0
	defb 000h,000h	; aea2
	defb 0fdh,0afh	; aea4
	defb 001h,0a0h	; aea6
	defb 0fdh,0afh	; aea8
	defb 001h,0a0h	; aeaa
	defb 0f1h,0afh	; aeac
	defb 001h,0a0h	; aeae
	defb 0e6h,0a7h	; aeb0
	defb 006h,0a0h	; aeb2
	defb 0efh,053h	; aeb4
	defb 00fh,050h	; aeb6
	defb 0cbh,059h	; aeb8
	defb 00bh,058h	; aeba
	defb 0d5h,055h	; aebc
	defb 015h,054h	; aebe
	defb 0d5h,055h	; aec0
	defb 015h,054h	; aec2
	defb 0d3h,099h	; aec4
	defb 013h,098h	; aec6
	defb 0dfh,00dh	; aec8
	defb 01fh,00ch	; aeca
	defb 0c7h,009h	; aecc
	defb 007h,008h	; aece
	defb 0f3h,04bh	; aed0
	defb 003h,048h	; aed2
	defb 0f9h,093h	; aed4
	defb 001h,090h	; aed6
	defb 0fch,0e7h	; aed8
	defb 000h,0e0h	; aeda
	defb 0feh,00fh	; aedc
	defb 000h,000h	; aede
	defb 0ffh,0ffh	; aee0
	defb 000h,000h	; aee2
	defb 0ffh,0ffh	; aee4
	defb 000h,000h	; aee6
	defb 0ffh,0c3h	; aee8
	defb 000h,000h	; aeea
	defb 0e0h,01bh	; aeec
	defb 000h,018h	; aeee
	defb 0cfh,0b9h	; aef0
	defb 00fh,0b8h	; aef2
	defb 09fh,0b5h	; aef4
	defb 01fh,0b4h	; aef6
	defb 0a1h,08dh	; aef8
	defb 021h,08ch	; aefa
	defb 0abh,029h	; aefc
	defb 02bh,028h	; aefe
	defb 0b2h,0d3h	; af00
	defb 032h,0d0h	; af02
	defb 09eh,0c7h	; af04
	defb 01eh,0c0h	; af06
	defb 0d8h,037h	; af08
	defb 018h,030h	; af0a
	defb 0d0h,0d7h	; af0c
	defb 010h,0d0h	; af0e
	defb 0d4h,0a7h	; af10
	defb 014h,0a0h	; af12
	defb 0d0h,08fh	; af14
	defb 010h,080h	; af16
	defb 0dfh,03fh	; af18
	defb 01fh,000h	; af1a
	defb 0c0h,07fh	; af1c
	defb 000h,000h	; af1e
	defb 0ffh,0ffh	; af20
	defb 000h,000h	; af22
	defb 0ffh,0ffh	; af24
	defb 000h,000h	; af26
	defb 0f0h,03fh	; af28
	defb 000h,000h	; af2a
	defb 0f7h,08fh	; af2c
	defb 007h,080h	; af2e
	defb 0e4h,067h	; af30
	defb 004h,060h	; af32
	defb 0cdh,0b7h	; af34
	defb 00dh,0b0h	; af36
	defb 09eh,070h	; af38
	defb 01eh,070h	; af3a
	defb 03fh,0eeh	; af3c
	defb 03fh,0eeh	; af3e
	defb 062h,01eh	; af40
	defb 062h,01eh	; af42
	defb 051h,0e0h	; af44
	defb 051h,0e0h	; af46
	defb 040h,01eh	; af48
	defb 040h,01eh	; af4a
	defb 023h,0e0h	; af4c
	defb 023h,0e0h	; af4e
	defb 09eh,04fh	; af50
	defb 01eh,040h	; af52
	defb 0c5h,09fh	; af54
	defb 005h,080h	; af56
	defb 0f0h,03fh	; af58
	defb 000h,000h	; af5a
	defb 0ffh,0ffh	; af5c
	defb 000h,000h	; af5e
	defb 0ffh,0ffh	; af60
	defb 000h,000h	; af62
	defb 0fch,01fh	; af64
	defb 000h,000h	; af66
	defb 001h,0cfh	; af68
	defb 001h,0c0h	; af6a
	defb 07fh,027h	; af6c
	defb 07fh,020h	; af6e
	defb 046h,0b7h	; af70
	defb 046h,0b0h	; af72
	defb 052h,037h	; af74
	defb 052h,030h	; af76
	defb 043h,0b7h	; af78
	defb 043h,0b0h	; af7a
	defb 040h,0f7h	; af7c
	defb 040h,0f0h	; af7e
	defb 03bh,077h	; af80
	defb 03bh,070h	; af82
	defb 08bh,007h	; af84
	defb 00bh,000h	; af86
	defb 0d4h,0b3h	; af88
	defb 014h,0b0h	; af8a
	defb 0cdh,03bh	; af8c
	defb 00dh,038h	; af8e
	defb 0e0h,0dbh	; af90
	defb 000h,0d8h	; af92
	defb 0feh,063h	; af94
	defb 000h,060h	; af96
	defb 0ffh,00fh	; af98
	defb 000h,000h	; af9a
	defb 0ffh,0ffh	; af9c
	defb 000h,000h	; af9e
	defb 0fch,03fh	; afa0
	defb 000h,000h	; afa2
	defb 0f9h,09fh	; afa4
	defb 001h,080h	; afa6
	defb 0f2h,04fh	; afa8
	defb 002h,040h	; afaa
	defb 0c5h,023h	; afac
	defb 005h,020h	; afae
	defb 01ch,038h	; afb0
	defb 01ch,038h	; afb2
	defb 07ch,03eh	; afb4
	defb 07ch,03eh	; afb6
	defb 04eh,072h	; afb8
	defb 04eh,072h	; afba
	defb 055h,0aah	; afbc
	defb 055h,0aah	; afbe
	defb 055h,0aah	; afc0
	defb 055h,0aah	; afc2
	defb 02dh,0b4h	; afc4
	defb 02dh,0b4h	; afc6
	defb 0bdh,0bdh	; afc8
	defb 03dh,0bch	; afca
	defb 09ah,059h	; afcc
	defb 01ah,058h	; afce
	defb 0c6h,063h	; afd0
	defb 006h,060h	; afd2
	defb 0f6h,06fh	; afd4
	defb 006h,060h	; afd6
	defb 0f6h,06fh	; afd8
	defb 006h,060h	; afda
	defb 0f0h,00fh	; afdc
	defb 000h,000h	; afde
	defb 0e3h,0ffh	; afe0
	defb 000h,000h	; afe2
	defb 0c8h,0ffh	; afe4
	defb 008h,000h	; afe6
	defb 09eh,003h	; afe8
	defb 01eh,000h	; afea
	defb 0a7h,0fbh	; afec
	defb 027h,0f8h	; afee
	defb 0abh,0abh	; aff0
	defb 02bh,0a8h	; aff2
	defb 0a3h,00bh	; aff4
	defb 023h,008h	; aff6
	defb 0afh,00bh	; aff8
	defb 02fh,008h	; affa
	defb 0bch,01bh	; affc
	defb 03ch,018h	; affe
	defb 0bbh,079h	; b000
	defb 03bh,078h	; b002
	defb 087h,07dh	; b004
	defb 007h,07ch	; b006
	defb 036h,0cch	; b008
	defb 036h,0cch	; b00a
	defb 061h,0d6h	; b00c
	defb 061h,0d6h	; b00e
	defb 045h,084h	; b010
	defb 045h,084h	; b012
	defb 00dh,0f9h	; b014
	defb 00dh,0f8h	; b016
	defb 0d8h,003h	; b018
	defb 018h,000h	; b01a
	defb 0c3h,0ffh	; b01c
	defb 000h,000h	; b01e
	defb 0fch,00fh	; b020
	defb 000h,000h	; b022
	defb 0f1h,0efh	; b024
	defb 001h,0e0h	; b026
	defb 0e6h,027h	; b028
	defb 006h,020h	; b02a
	defb 0edh,0b7h	; b02c
	defb 00dh,0b0h	; b02e
	defb 00eh,073h	; b030
	defb 00eh,070h	; b032
	defb 077h,0f9h	; b034
	defb 077h,0f8h	; b036
	defb 078h,044h	; b038
	defb 078h,044h	; b03a
	defb 007h,08ah	; b03c
	defb 007h,08ah	; b03e
	defb 007h,082h	; b040
	defb 007h,082h	; b042
	defb 078h,044h	; b044
	defb 078h,044h	; b046
	defb 077h,0f9h	; b048
	defb 077h,0f8h	; b04a
	defb 00eh,073h	; b04c
	defb 00eh,070h	; b04e
	defb 0edh,0b7h	; b050
	defb 00dh,0b0h	; b052
	defb 0e6h,027h	; b054
	defb 006h,020h	; b056
	defb 0f1h,0efh	; b058
	defb 001h,0e0h	; b05a
	defb 0fch,00fh	; b05c
	defb 000h,000h	; b05e
	defb 0c3h,0ffh	; b060
	defb 000h,000h	; b062
	defb 098h,003h	; b064
	defb 018h,000h	; b066
	defb 00dh,0f9h	; b068
	defb 00dh,0f8h	; b06a
	defb 045h,084h	; b06c
	defb 045h,084h	; b06e
	defb 061h,0d6h	; b070
	defb 061h,0d6h	; b072
	defb 036h,0cch	; b074
	defb 036h,0cch	; b076
	defb 087h,07dh	; b078
	defb 007h,07ch	; b07a
	defb 0bbh,079h	; b07c
	defb 03bh,078h	; b07e
	defb 0bch,01bh	; b080
	defb 03ch,018h	; b082
	defb 0afh,00bh	; b084
	defb 02fh,008h	; b086
	defb 0a3h,01bh	; b088
	defb 023h,018h	; b08a
	defb 0abh,08bh	; b08c
	defb 02bh,088h	; b08e
	defb 0a7h,0fbh	; b090
	defb 027h,0f8h	; b092
	defb 09eh,003h	; b094
	defb 01eh,000h	; b096
	defb 0c8h,0ffh	; b098
	defb 008h,000h	; b09a
	defb 0e3h,0ffh	; b09c
	defb 000h,000h	; b09e
	defb 0f0h,00fh	; b0a0
	defb 000h,000h	; b0a2
	defb 0f6h,06fh	; b0a4
	defb 006h,060h	; b0a6
	defb 0f6h,06fh	; b0a8
	defb 006h,060h	; b0aa
	defb 0c6h,063h	; b0ac
	defb 006h,060h	; b0ae
	defb 09ah,059h	; b0b0
	defb 01ah,058h	; b0b2
	defb 0bdh,0bdh	; b0b4
	defb 03dh,0bch	; b0b6
	defb 02dh,0b4h	; b0b8
	defb 02dh,0b4h	; b0ba
	defb 055h,0aah	; b0bc
	defb 055h,0aah	; b0be
	defb 055h,0aah	; b0c0
	defb 055h,0aah	; b0c2
	defb 04eh,072h	; b0c4
	defb 04eh,072h	; b0c6
	defb 07ch,03eh	; b0c8
	defb 07ch,03eh	; b0ca
	defb 01ch,038h	; b0cc
	defb 01ch,038h	; b0ce
	defb 0c4h,0a3h	; b0d0
	defb 004h,0a0h	; b0d2
	defb 0f2h,04fh	; b0d4
	defb 002h,040h	; b0d6
	defb 0f9h,09fh	; b0d8
	defb 001h,080h	; b0da
	defb 0fch,03fh	; b0dc
	defb 000h,000h	; b0de
	defb 0ffh,0c3h	; b0e0
	defb 000h,000h	; b0e2
	defb 0c0h,01bh	; b0e4
	defb 000h,018h	; b0e6
	defb 09fh,0b0h	; b0e8
	defb 01fh,0b0h	; b0ea
	defb 021h,0a2h	; b0ec
	defb 021h,0a2h	; b0ee
	defb 06bh,086h	; b0f0
	defb 06bh,086h	; b0f2
	defb 033h,06ch	; b0f4
	defb 033h,06ch	; b0f6
	defb 0beh,0e1h	; b0f8
	defb 03eh,0e0h	; b0fa
	defb 09eh,0ddh	; b0fc
	defb 01eh,0dch	; b0fe
	defb 0d8h,03dh	; b100
	defb 018h,03ch	; b102
	defb 0d0h,0f5h	; b104
	defb 010h,0f4h	; b106
	defb 0d0h,0c5h	; b108
	defb 010h,0c4h	; b10a
	defb 0d5h,0d5h	; b10c
	defb 015h,0d4h	; b10e
	defb 0dfh,0e5h	; b110
	defb 01fh,0e4h	; b112
	defb 0c0h,079h	; b114
	defb 000h,078h	; b116
	defb 0ffh,013h	; b118
	defb 000h,010h	; b11a
	defb 0ffh,0c7h	; b11c
	defb 000h,000h	; b11e
	defb 0f0h,03fh	; b120
	defb 000h,000h	; b122
	defb 0f7h,08fh	; b124
	defb 007h,080h	; b126
	defb 0e4h,067h	; b128
	defb 004h,060h	; b12a
	defb 0edh,0b7h	; b12c
	defb 00dh,0b0h	; b12e
	defb 0ceh,070h	; b130
	defb 00eh,070h	; b132
	defb 09fh,0eeh	; b134
	defb 01fh,0eeh	; b136
	defb 022h,01eh	; b138
	defb 022h,01eh	; b13a
	defb 041h,0e0h	; b13c
	defb 041h,0e0h	; b13e
	defb 051h,0e0h	; b140
	defb 051h,0e0h	; b142
	defb 022h,01eh	; b144
	defb 022h,01eh	; b146
	defb 09fh,0eeh	; b148
	defb 01fh,0eeh	; b14a
	defb 0ceh,070h	; b14c
	defb 00eh,070h	; b14e
	defb 0edh,0b7h	; b150
	defb 00dh,0b0h	; b152
	defb 0e4h,067h	; b154
	defb 004h,060h	; b156
	defb 0f7h,08fh	; b158
	defb 007h,080h	; b15a
	defb 0f0h,03fh	; b15c
	defb 000h,000h	; b15e
	defb 0ffh,0c7h	; b160
	defb 000h,000h	; b162
	defb 0ffh,013h	; b164
	defb 000h,010h	; b166
	defb 0c0h,079h	; b168
	defb 000h,078h	; b16a
	defb 0dfh,0e5h	; b16c
	defb 01fh,0e4h	; b16e
	defb 0d1h,0d5h	; b170
	defb 011h,0d4h	; b172
	defb 0d8h,0c5h	; b174
	defb 018h,0c4h	; b176
	defb 0d0h,0f5h	; b178
	defb 010h,0f4h	; b17a
	defb 0d8h,03dh	; b17c
	defb 018h,03ch	; b17e
	defb 09eh,0ddh	; b180
	defb 01eh,0dch	; b182
	defb 0beh,0e1h	; b184
	defb 03eh,0e0h	; b186
	defb 033h,06ch	; b188
	defb 033h,06ch	; b18a
	defb 06bh,086h	; b18c
	defb 06bh,086h	; b18e
	defb 021h,0a2h	; b190
	defb 021h,0a2h	; b192
	defb 09fh,0b0h	; b194
	defb 01fh,0b0h	; b196
	defb 0c0h,01bh	; b198
	defb 000h,018h	; b19a
	defb 0ffh,0c3h	; b19c
	defb 000h,000h	; b19e
	defb 0feh,00fh	; b1a0
	defb 000h,000h	; b1a2
	defb 0fch,0e7h	; b1a4
	defb 000h,0e0h	; b1a6
	defb 0f9h,093h	; b1a8
	defb 001h,090h	; b1aa
	defb 0f3h,04bh	; b1ac
	defb 003h,048h	; b1ae
	defb 0c7h,009h	; b1b0
	defb 007h,008h	; b1b2
	defb 0dfh,00dh	; b1b4
	defb 01fh,00ch	; b1b6
	defb 0d3h,099h	; b1b8
	defb 013h,098h	; b1ba
	defb 0d5h,055h	; b1bc
	defb 015h,054h	; b1be
	defb 0d5h,055h	; b1c0
	defb 015h,054h	; b1c2
	defb 0cbh,059h	; b1c4
	defb 00bh,058h	; b1c6
	defb 0efh,053h	; b1c8
	defb 00fh,050h	; b1ca
	defb 0e6h,0a7h	; b1cc
	defb 006h,0a0h	; b1ce
	defb 0f1h,0afh	; b1d0
	defb 001h,0a0h	; b1d2
	defb 0fdh,0afh	; b1d4
	defb 001h,0a0h	; b1d6
	defb 0fdh,0afh	; b1d8
	defb 001h,0a0h	; b1da
	defb 0fch,00fh	; b1dc
	defb 000h,000h	; b1de
	defb 0ffh,0ffh	; b1e0
	defb 000h,000h	; b1e2
	defb 0f8h,03fh	; b1e4
	defb 000h,000h	; b1e6
	defb 0f3h,080h	; b1e8
	defb 003h,080h	; b1ea
	defb 0e4h,0feh	; b1ec
	defb 004h,0feh	; b1ee
	defb 0edh,062h	; b1f0
	defb 00dh,062h	; b1f2
	defb 0ech,04ah	; b1f4
	defb 00ch,04ah	; b1f6
	defb 0edh,0c2h	; b1f8
	defb 00dh,0c2h	; b1fa
	defb 0efh,002h	; b1fc
	defb 00fh,002h	; b1fe
	defb 0eeh,0dch	; b200
	defb 00eh,0dch	; b202
	defb 0e0h,0d1h	; b204
	defb 000h,0d0h	; b206
	defb 0cdh,02bh	; b208
	defb 00dh,028h	; b20a
	defb 0dch,0b3h	; b20c
	defb 01ch,0b0h	; b20e
	defb 0dbh,007h	; b210
	defb 01bh,000h	; b212
	defb 0c6h,07fh	; b214
	defb 006h,000h	; b216
	defb 0f0h,0ffh	; b218
	defb 000h,000h	; b21a
	defb 0ffh,0ffh	; b21c
	defb 000h,000h	; b21e
	defb 0ffh,0ffh	; b220
	defb 000h,000h	; b222
	defb 0ffh,0ffh	; b224
	defb 000h,000h	; b226
	defb 0fch,00fh	; b228
	defb 000h,000h	; b22a
	defb 0f1h,0efh	; b22c
	defb 001h,0e0h	; b22e
	defb 0e6h,027h	; b230
	defb 006h,020h	; b232
	defb 0edh,0b3h	; b234
	defb 00dh,0b0h	; b236
	defb 00eh,079h	; b238
	defb 00eh,078h	; b23a
	defb 077h,0fch	; b23c
	defb 077h,0fch	; b23e
	defb 078h,046h	; b240
	defb 078h,046h	; b242
	defb 007h,08ah	; b244
	defb 007h,08ah	; b246
	defb 078h,002h	; b248
	defb 078h,002h	; b24a
	defb 007h,0c4h	; b24c
	defb 007h,0c4h	; b24e
	defb 0f2h,079h	; b250
	defb 002h,078h	; b252
	defb 0f9h,0a3h	; b254
	defb 001h,0a0h	; b256
	defb 0fch,00fh	; b258
	defb 000h,000h	; b25a
	defb 0ffh,0ffh	; b25c
	defb 000h,000h	; b25e
	defb 0ffh,0ffh	; b260
	defb 000h,000h	; b262
	defb 0ffh,0ffh	; b264
	defb 000h,000h	; b266
	defb 0c3h,0ffh	; b268
	defb 000h,000h	; b26a
	defb 0d8h,007h	; b26c
	defb 018h,000h	; b26e
	defb 09dh,0f3h	; b270
	defb 01dh,0f0h	; b272
	defb 0adh,0f9h	; b274
	defb 02dh,0f8h	; b276
	defb 0b1h,085h	; b278
	defb 031h,084h	; b27a
	defb 094h,0d5h	; b27c
	defb 014h,0d4h	; b27e
	defb 0cbh,04dh	; b280
	defb 00bh,04ch	; b282
	defb 0e3h,079h	; b284
	defb 003h,078h	; b286
	defb 0ech,01bh	; b288
	defb 00ch,018h	; b28a
	defb 0ebh,00bh	; b28c
	defb 00bh,008h	; b28e
	defb 0e5h,02bh	; b290
	defb 005h,028h	; b292
	defb 0f1h,00bh	; b294
	defb 001h,008h	; b296
	defb 0fch,0fbh	; b298
	defb 000h,0f8h	; b29a
	defb 0feh,003h	; b29c
	defb 000h,000h	; b29e
	defb 0f0h,03fh	; b2a0
	defb 000h,000h	; b2a2
	defb 0f5h,0bfh	; b2a4
	defb 005h,080h	; b2a6
	defb 0f5h,0bfh	; b2a8
	defb 005h,080h	; b2aa
	defb 0f5h,08fh	; b2ac
	defb 005h,080h	; b2ae
	defb 0e5h,067h	; b2b0
	defb 005h,060h	; b2b2
	defb 0cah,0f7h	; b2b4
	defb 00ah,0f0h	; b2b6
	defb 09ah,0d3h	; b2b8
	defb 01ah,0d0h	; b2ba
	defb 0aah,0abh	; b2bc
	defb 02ah,0a8h	; b2be
	defb 0aah,0abh	; b2c0
	defb 02ah,0a8h	; b2c2
	defb 099h,0cbh	; b2c4
	defb 019h,0c8h	; b2c6
	defb 0b0h,0fbh	; b2c8
	defb 030h,0f8h	; b2ca
	defb 090h,0e3h	; b2cc
	defb 010h,0e0h	; b2ce
	defb 0d2h,0cfh	; b2d0
	defb 012h,0c0h	; b2d2
	defb 0c9h,09fh	; b2d4
	defb 009h,080h	; b2d6
	defb 0e7h,03fh	; b2d8
	defb 007h,000h	; b2da
	defb 0f0h,07fh	; b2dc
	defb 000h,000h	; b2de
	defb 0ffh,0ffh	; b2e0
	defb 000h,000h	; b2e2
	defb 0ffh,00fh	; b2e4
	defb 000h,000h	; b2e6
	defb 0feh,063h	; b2e8
	defb 000h,060h	; b2ea
	defb 0e0h,0dbh	; b2ec
	defb 000h,0d8h	; b2ee
	defb 0cdh,03bh	; b2f0
	defb 00dh,038h	; b2f2
	defb 0d4h,0b3h	; b2f4
	defb 014h,0b0h	; b2f6
	defb 08bh,007h	; b2f8
	defb 00bh,000h	; b2fa
	defb 03bh,077h	; b2fc
	defb 03bh,070h	; b2fe
	defb 040h,0f7h	; b300
	defb 040h,0f0h	; b302
	defb 043h,0b7h	; b304
	defb 043h,0b0h	; b306
	defb 052h,037h	; b308
	defb 052h,030h	; b30a
	defb 046h,0b7h	; b30c
	defb 046h,0b0h	; b30e
	defb 07fh,027h	; b310
	defb 07fh,020h	; b312
	defb 001h,0cfh	; b314
	defb 001h,0c0h	; b316
	defb 0fch,01fh	; b318
	defb 000h,000h	; b31a
	defb 0ffh,0ffh	; b31c
	defb 000h,000h	; b31e
	defb 0ffh,0ffh	; b320
	defb 000h,000h	; b322
	defb 0f0h,03fh	; b324
	defb 000h,000h	; b326
	defb 0c5h,09fh	; b328
	defb 005h,080h	; b32a
	defb 09eh,04fh	; b32c
	defb 01eh,040h	; b32e
	defb 023h,0e0h	; b330
	defb 023h,0e0h	; b332
	defb 040h,01eh	; b334
	defb 040h,01eh	; b336
	defb 051h,0e0h	; b338
	defb 051h,0e0h	; b33a
	defb 062h,01eh	; b33c
	defb 062h,01eh	; b33e
	defb 03fh,0eeh	; b340
	defb 03fh,0eeh	; b342
	defb 09eh,070h	; b344
	defb 01eh,070h	; b346
	defb 0cdh,0b7h	; b348
	defb 00dh,0b0h	; b34a
	defb 0e4h,067h	; b34c
	defb 004h,060h	; b34e
	defb 0f7h,08fh	; b350
	defb 007h,080h	; b352
	defb 0f0h,03fh	; b354
	defb 000h,000h	; b356
	defb 0ffh,0ffh	; b358
	defb 000h,000h	; b35a
	defb 0ffh,0ffh	; b35c
	defb 000h,000h	; b35e
	defb 0c0h,07fh	; b360
	defb 000h,000h	; b362
	defb 0dfh,03fh	; b364
	defb 01fh,000h	; b366
	defb 0d0h,08fh	; b368
	defb 010h,080h	; b36a
	defb 0d4h,0a7h	; b36c
	defb 014h,0a0h	; b36e
	defb 0d0h,0d7h	; b370
	defb 010h,0d0h	; b372
	defb 0d8h,037h	; b374
	defb 018h,030h	; b376
	defb 09eh,0c7h	; b378
	defb 01eh,0c0h	; b37a
	defb 0b2h,0d3h	; b37c
	defb 032h,0d0h	; b37e
	defb 0abh,029h	; b380
	defb 02bh,028h	; b382
	defb 0a1h,08dh	; b384
	defb 021h,08ch	; b386
	defb 09fh,0b5h	; b388
	defb 01fh,0b4h	; b38a
	defb 0cfh,0b9h	; b38c
	defb 00fh,0b8h	; b38e
	defb 0e0h,01bh	; b390
	defb 000h,018h	; b392
	defb 0ffh,0c3h	; b394
	defb 000h,000h	; b396
	defb 0ffh,0ffh	; b398
	defb 000h,000h	; b39a
	defb 0ffh,0ffh	; b39c
	defb 000h,000h	; b39e
	defb 0feh,07fh	; b3a0
	defb 000h,000h	; b3a2
	defb 0fch,03fh	; b3a4
	defb 000h,000h	; b3a6
	defb 0f4h,02fh	; b3a8
	defb 000h,000h	; b3aa
	defb 0e6h,067h	; b3ac
	defb 000h,000h	; b3ae
	defb 0ceh,073h	; b3b0
	defb 000h,000h	; b3b2
	defb 0ffh,0ffh	; b3b4
	defb 000h,000h	; b3b6
	defb 09fh,0f9h	; b3b8
	defb 000h,000h	; b3ba
	defb 006h,060h	; b3bc
	defb 000h,000h	; b3be
	defb 006h,060h	; b3c0
	defb 000h,000h	; b3c2
	defb 09fh,0f9h	; b3c4
	defb 000h,000h	; b3c6
	defb 0ffh,0ffh	; b3c8
	defb 000h,000h	; b3ca
	defb 0ceh,073h	; b3cc
	defb 000h,000h	; b3ce
	defb 0e6h,067h	; b3d0
	defb 000h,000h	; b3d2
	defb 0f4h,02fh	; b3d4
	defb 000h,000h	; b3d6
	defb 0fch,03fh	; b3d8
	defb 000h,000h	; b3da
	defb 0feh,07fh	; b3dc
	defb 000h,000h	; b3de
	defb 000h,000h	; b3e0
	defb 000h,000h	; b3e2
	defb 000h,000h	; b3e4
	defb 000h,000h	; b3e6
	defb 03eh,07ch	; b3e8
	defb 000h,000h	; b3ea
	defb 03eh,07ch	; b3ec
	defb 000h,000h	; b3ee
	defb 03fh,0fch	; b3f0
	defb 000h,000h	; b3f2
	defb 03eh,07ch	; b3f4
	defb 000h,000h	; b3f6
	defb 03ch,03ch	; b3f8
	defb 000h,000h	; b3fa
	defb 0e1h,087h	; b3fc
	defb 000h,000h	; b3fe
	defb 0e1h,087h	; b400
	defb 000h,000h	; b402
	defb 03ch,03ch	; b404
	defb 000h,000h	; b406
	defb 03eh,07ch	; b408
	defb 000h,000h	; b40a
	defb 03fh,0fch	; b40c
	defb 000h,000h	; b40e
	defb 03eh,07ch	; b410
	defb 000h,000h	; b412
	defb 03eh,07ch	; b414
	defb 000h,000h	; b416
	defb 000h,000h	; b418
	defb 000h,000h	; b41a
	defb 000h,000h	; b41c
	defb 000h,000h	; b41e
	defb 0ffh,0c0h	; b420
	defb 000h,000h	; b422
	defb 0ffh,01ah	; b424
	defb 000h,01ah	; b426
	defb 0fch,055h	; b428
	defb 000h,055h	; b42a
	defb 0f9h,07fh	; b42c
	defb 001h,07fh	; b42e
	defb 0f2h,0f0h	; b430
	defb 002h,0f0h	; b432
	defb 0e5h,085h	; b434
	defb 005h,081h	; b436
	defb 0cbh,03ch	; b438
	defb 00bh,000h	; b43a
	defb 0d6h,07dh	; b43c
	defb 016h,001h	; b43e
	defb 0cch,0f8h	; b440
	defb 00ch,000h	; b442
	defb 099h,0e2h	; b444
	defb 018h,002h	; b446
	defb 0abh,0c9h	; b448
	defb 028h,009h	; b44a
	defb 083h,090h	; b44c
	defb 000h,010h	; b44e
	defb 093h,0a4h	; b450
	defb 010h,024h	; b452
	defb 031h,00dh	; b454
	defb 030h,00dh	; b456
	defb 054h,049h	; b458
	defb 054h,049h	; b45a
	defb 03ah,023h	; b45c
	defb 03ah,023h	; b45e
	defb 007h,0ffh	; b460
	defb 000h,000h	; b462
	defb 0b0h,0ffh	; b464
	defb 0b0h,000h	; b466
	defb 05ah,03fh	; b468
	defb 05ah,000h	; b46a
	defb 0fdh,09fh	; b46c
	defb 0fdh,080h	; b46e
	defb 08fh,04fh	; b470
	defb 08fh,040h	; b472
	defb 0a1h,0e7h	; b474
	defb 081h,0e0h	; b476
	defb 0bch,0f3h	; b478
	defb 080h,0f0h	; b47a
	defb 0beh,06bh	; b47c
	defb 080h,068h	; b47e
	defb 03fh,039h	; b480
	defb 000h,038h	; b482
	defb 087h,09dh	; b484
	defb 080h,01ch	; b486
	defb 057h,0cdh	; b488
	defb 050h,00ch	; b48a
	defb 007h,0d4h	; b48c
	defb 000h,014h	; b48e
	defb 033h,0ceh	; b490
	defb 030h,00eh	; b492
	defb 078h,06ah	; b494
	defb 078h,00ah	; b496
	defb 0b9h,066h	; b498
	defb 0b9h,006h	; b49a
	defb 08bh,04ah	; b49c
	defb 08bh,00ah	; b49e
	defb 05dh,043h	; b4a0
	defb 05dh,043h	; b4a2
	defb 036h,021h	; b4a4
	defb 036h,021h	; b4a6
	defb 053h,00eh	; b4a8
	defb 053h,00eh	; b4aa
	defb 071h,05bh	; b4ac
	defb 071h,01bh	; b4ae
	defb 038h,05ah	; b4b0
	defb 038h,01ah	; b4b2
	defb 09bh,0dbh	; b4b4
	defb 018h,01bh	; b4b6
	defb 0a9h,0c5h	; b4b8
	defb 028h,005h	; b4ba
	defb 09ch,0f7h	; b4bc
	defb 01ch,007h	; b4be
	defb 0d6h,070h	; b4c0
	defb 016h,000h	; b4c2
	defb 0cfh,03eh	; b4c4
	defb 00fh,000h	; b4c6
	defb 0e6h,087h	; b4c8
	defb 006h,080h	; b4ca
	defb 0f3h,053h	; b4cc
	defb 003h,050h	; b4ce
	defb 0f9h,0e9h	; b4d0
	defb 001h,0e8h	; b4d2
	defb 0fch,07ch	; b4d4
	defb 000h,07ch	; b4d6
	defb 0ffh,00fh	; b4d8
	defb 000h,00fh	; b4da
	defb 0ffh,0e0h	; b4dc
	defb 000h,000h	; b4de
	defb 077h,056h	; b4e0
	defb 077h,016h	; b4e2
	defb 03bh,04ah	; b4e4
	defb 03bh,00ah	; b4e6
	defb 0eeh,066h	; b4e8
	defb 0eeh,006h	; b4ea
	defb 068h,0ceh	; b4ec
	defb 068h,00eh	; b4ee
	defb 0deh,0d4h	; b4f0
	defb 0deh,014h	; b4f2
	defb 03eh,0cdh	; b4f4
	defb 03eh,00ch	; b4f6
	defb 0d8h,09dh	; b4f8
	defb 0d8h,01ch	; b4fa
	defb 0e3h,029h	; b4fc
	defb 0e0h,028h	; b4fe
	defb 0eeh,05bh	; b500
	defb 0e0h,058h	; b502
	defb 00ch,0b3h	; b504
	defb 000h,0b0h	; b506
	defb 0e1h,067h	; b508
	defb 001h,060h	; b50a
	defb 08ah,0cfh	; b50c
	defb 00ah,0c0h	; b50e
	defb 037h,09fh	; b510
	defb 037h,080h	; b512
	defb 05eh,03fh	; b514
	defb 05eh,000h	; b516
	defb 0f0h,0ffh	; b518
	defb 0f0h,000h	; b51a
	defb 007h,0ffh	; b51c
	defb 000h,000h	; b51e
	defb 0ffh,0c0h	; b520
	defb 000h,000h	; b522
	defb 0ffh,01ah	; b524
	defb 000h,01ah	; b526
	defb 080h,055h	; b528
	defb 000h,055h	; b52a
	defb 02dh,07fh	; b52c
	defb 02dh,07fh	; b52e
	defb 07ah,0f0h	; b530
	defb 07ah,0f0h	; b532
	defb 015h,085h	; b534
	defb 015h,081h	; b536
	defb 0cbh,05ch	; b538
	defb 00bh,040h	; b53a
	defb 0d6h,0c1h	; b53c
	defb 016h,0c1h	; b53e
	defb 08dh,0e9h	; b540
	defb 00dh,0e9h	; b542
	defb 0b8h,0bbh	; b544
	defb 038h,0bbh	; b546
	defb 09ah,07bh	; b548
	defb 018h,07bh	; b54a
	defb 0abh,070h	; b54c
	defb 028h,070h	; b54e
	defb 083h,01fh	; b550
	defb 000h,01fh	; b552
	defb 026h,07eh	; b554
	defb 020h,07eh	; b556
	defb 052h,0b1h	; b558
	defb 050h,0b1h	; b55a
	defb 06ah,0edh	; b55c
	defb 068h,0edh	; b55e
	defb 024h,007h	; b560
	defb 004h,000h	; b562
	defb 08ah,0b7h	; b564
	defb 08ah,0b0h	; b566
	defb 01dh,067h	; b568
	defb 01dh,060h	; b56a
	defb 086h,08fh	; b56c
	defb 086h,080h	; b56e
	defb 08bh,05fh	; b570
	defb 08bh,040h	; b572
	defb 093h,087h	; b574
	defb 093h,080h	; b576
	defb 01dh,053h	; b578
	defb 01dh,050h	; b57a
	defb 0bdh,08bh	; b57c
	defb 0bdh,088h	; b57e
	defb 0d4h,038h	; b580
	defb 0d4h,038h	; b582
	defb 098h,017h	; b584
	defb 098h,017h	; b586
	defb 0ech,0beh	; b588
	defb 0ech,0beh	; b58a
	defb 0efh,0d8h	; b58c
	defb 0efh,0d8h	; b58e
	defb 03ch,0feh	; b590
	defb 03ch,0feh	; b592
	defb 0dbh,06ah	; b594
	defb 0dbh,06ah	; b596
	defb 0ffh,006h	; b598
	defb 0ffh,006h	; b59a
	defb 0b7h,06ah	; b59c
	defb 0b7h,06ah	; b59e
	defb 032h,01fh	; b5a0
	defb 030h,01fh	; b5a2
	defb 0b8h,0dbh	; b5a4
	defb 038h,0dbh	; b5a6
	defb 094h,07bh	; b5a8
	defb 014h,07bh	; b5aa
	defb 0dah,05ch	; b5ac
	defb 01ah,05ch	; b5ae
	defb 0cch,0deh	; b5b0
	defb 00ch,0deh	; b5b2
	defb 0e1h,0e3h	; b5b4
	defb 001h,0e3h	; b5b6
	defb 0f2h,0f7h	; b5b8
	defb 002h,0f7h	; b5ba
	defb 0f7h,0a5h	; b5bc
	defb 007h,0a5h	; b5be
	defb 0e3h,085h	; b5c0
	defb 003h,085h	; b5c2
	defb 0ceh,030h	; b5c4
	defb 00eh,000h	; b5c6
	defb 09ah,005h	; b5c8
	defb 01ah,001h	; b5ca
	defb 0bch,051h	; b5cc
	defb 03ch,051h	; b5ce
	defb 0a9h,0e8h	; b5d0
	defb 029h,0e8h	; b5d2
	defb 0a0h,07ch	; b5d4
	defb 020h,07ch	; b5d6
	defb 08fh,00fh	; b5d8
	defb 000h,00fh	; b5da
	defb 0ffh,0e0h	; b5dc
	defb 000h,000h	; b5de
	defb 075h,0f6h	; b5e0
	defb 075h,0f6h	; b5e2
	defb 075h,08ah	; b5e4
	defb 075h,08ah	; b5e6
	defb 0cdh,0c6h	; b5e8
	defb 0cdh,0c6h	; b5ea
	defb 07bh,06eh	; b5ec
	defb 07bh,06eh	; b5ee
	defb 0f7h,074h	; b5f0
	defb 0f7h,074h	; b5f2
	defb 00eh,0adh	; b5f4
	defb 00eh,0ach	; b5f6
	defb 0b6h,0c5h	; b5f8
	defb 0b6h,0c4h	; b5fa
	defb 079h,0f1h	; b5fc
	defb 079h,0f0h	; b5fe
	defb 05fh,077h	; b600
	defb 05fh,070h	; b602
	defb 06fh,0a3h	; b604
	defb 06fh,0a0h	; b606
	defb 06fh,0c9h	; b608
	defb 06fh,0c8h	; b60a
	defb 0b6h,0ddh	; b60c
	defb 0b6h,0dch	; b60e
	defb 0f8h,0ddh	; b610
	defb 0f8h,0dch	; b612
	defb 01dh,0b9h	; b614
	defb 01dh,0b8h	; b616
	defb 081h,0f3h	; b618
	defb 081h,0f0h	; b61a
	defb 03ch,007h	; b61c
	defb 000h,000h	; b61e
	defb 0ffh,0c0h	; b620
	defb 000h,000h	; b622
	defb 0e0h,01bh	; b624
	defb 000h,01bh	; b626
	defb 0cah,05bh	; b628
	defb 00ah,05bh	; b62a
	defb 0ddh,047h	; b62c
	defb 01dh,047h	; b62e
	defb 018h,01fh	; b630
	defb 018h,01fh	; b632
	defb 071h,0cch	; b634
	defb 071h,0cch	; b636
	defb 06bh,0ebh	; b638
	defb 06bh,0ebh	; b63a
	defb 053h,033h	; b63c
	defb 053h,033h	; b63e
	defb 00eh,0edh	; b640
	defb 00eh,0edh	; b642
	defb 0e5h,08fh	; b644
	defb 005h,08fh	; b646
	defb 0f3h,06fh	; b648
	defb 003h,06fh	; b64a
	defb 010h,0ffh	; b64c
	defb 000h,0ffh	; b64e
	defb 046h,0f0h	; b650
	defb 046h,0f0h	; b652
	defb 026h,0fdh	; b654
	defb 026h,0fdh	; b656
	defb 087h,01dh	; b658
	defb 007h,01dh	; b65a
	defb 0f1h,0fbh	; b65c
	defb 001h,0fbh	; b65e
	defb 004h,007h	; b660
	defb 000h,000h	; b662
	defb 0b1h,071h	; b664
	defb 0b1h,070h	; b666
	defb 0cbh,0adh	; b668
	defb 0cbh,0ach	; b66a
	defb 0dbh,059h	; b66c
	defb 0dbh,058h	; b66e
	defb 09ah,0bdh	; b670
	defb 09ah,0bch	; b672
	defb 0ebh,06dh	; b674
	defb 0ebh,06ch	; b676
	defb 077h,0d9h	; b678
	defb 077h,0d8h	; b67a
	defb 0b3h,081h	; b67c
	defb 0b3h,080h	; b67e
	defb 0b5h,0fdh	; b680
	defb 0b5h,0fch	; b682
	defb 0b6h,091h	; b684
	defb 0b6h,090h	; b686
	defb 0aeh,0cdh	; b688
	defb 0aeh,0cch	; b68a
	defb 07dh,0ddh	; b68c
	defb 07dh,0dch	; b68e
	defb 0b3h,0a9h	; b690
	defb 0b3h,0a8h	; b692
	defb 09bh,061h	; b694
	defb 09bh,060h	; b696
	defb 0c3h,0c5h	; b698
	defb 0c3h,0c4h	; b69a
	defb 098h,0c9h	; b69c
	defb 080h,0c8h	; b69e
	defb 0e3h,087h	; b6a0
	defb 003h,087h	; b6a2
	defb 0cfh,0e8h	; b6a4
	defb 00fh,0e8h	; b6a6
	defb 0dah,0eeh	; b6a8
	defb 01ah,0eeh	; b6aa
	defb 0d6h,0c6h	; b6ac
	defb 016h,0c6h	; b6ae
	defb 086h,097h	; b6b0
	defb 006h,097h	; b6b2
	defb 030h,01eh	; b6b4
	defb 030h,01eh	; b6b6
	defb 07fh,00eh	; b6b8
	defb 07fh,00eh	; b6ba
	defb 066h,03ch	; b6bc
	defb 066h,03ch	; b6be
	defb 01eh,0b6h	; b6c0
	defb 01eh,036h	; b6c2
	defb 056h,026h	; b6c4
	defb 056h,026h	; b6c6
	defb 074h,08eh	; b6c8
	defb 074h,08eh	; b6ca
	defb 070h,054h	; b6cc
	defb 070h,054h	; b6ce
	defb 017h,066h	; b6d0
	defb 010h,066h	; b6d2
	defb 0a7h,006h	; b6d4
	defb 020h,006h	; b6d6
	defb 08fh,0f4h	; b6d8
	defb 000h,004h	; b6da
	defb 0ffh,0f1h	; b6dc
	defb 000h,000h	; b6de
	defb 086h,005h	; b6e0
	defb 080h,004h	; b6e2
	defb 011h,0e9h	; b6e4
	defb 010h,008h	; b6e6
	defb 0ddh,0e5h	; b6e8
	defb 01ch,004h	; b6ea
	defb 044h,031h	; b6ec
	defb 004h,000h	; b6ee
	defb 06eh,087h	; b6f0
	defb 00eh,080h	; b6f2
	defb 066h,0b3h	; b6f4
	defb 006h,0b0h	; b6f6
	defb 0f3h,03bh	; b6f8
	defb 003h,038h	; b6fa
	defb 0f6h,0a9h	; b6fc
	defb 006h,0a8h	; b6fe
	defb 083h,0f5h	; b700
	defb 003h,0f4h	; b702
	defb 0aah,0edh	; b704
	defb 022h,0ech	; b706
	defb 02bh,01dh	; b708
	defb 023h,01ch	; b70a
	defb 048h,0d9h	; b70c
	defb 040h,0d8h	; b70e
	defb 01dh,0d3h	; b710
	defb 001h,0d0h	; b712
	defb 0fch,007h	; b714
	defb 000h,000h	; b716
	defb 0ffh,0ffh	; b718
	defb 000h,000h	; b71a
	defb 0ffh,0ffh	; b71c
	defb 000h,000h	; b71e
	defb 0ffh,0ffh	; b720
	defb 000h,000h	; b722
	defb 0f0h,0ffh	; b724
	defb 000h,000h	; b726
	defb 086h,03fh	; b728
	defb 006h,000h	; b72a
	defb 0b6h,09fh	; b72c
	defb 036h,080h	; b72e
	defb 0a7h,0d1h	; b730
	defb 027h,0c0h	; b732
	defb 0bdh,095h	; b734
	defb 03dh,084h	; b736
	defb 09dh,0b1h	; b738
	defb 01dh,080h	; b73a
	defb 0bah,03fh	; b73c
	defb 03ah,000h	; b73e
	defb 08eh,0ffh	; b740
	defb 00eh,000h	; b742
	defb 0e6h,0e1h	; b744
	defb 006h,000h	; b746
	defb 0f0h,0cch	; b748
	defb 000h,00ch	; b74a
	defb 0ffh,0ddh	; b74c
	defb 000h,01dh	; b74e
	defb 0ffh,09fh	; b750
	defb 000h,01fh	; b752
	defb 0ffh,0b8h	; b754
	defb 000h,038h	; b756
	defb 0ffh,087h	; b758
	defb 000h,007h	; b75a
	defb 0ffh,0b7h	; b75c
	defb 000h,037h	; b75e
	defb 0ffh,0ffh	; b760
	defb 000h,000h	; b762
	defb 0ffh,0c3h	; b764
	defb 000h,000h	; b766
	defb 0e3h,019h	; b768
	defb 000h,018h	; b76a
	defb 0eah,05dh	; b76c
	defb 008h,05ch	; b76e
	defb 0e2h,0cdh	; b770
	defb 000h,0cch	; b772
	defb 0feh,0a9h	; b774
	defb 000h,0a8h	; b776
	defb 0feh,07dh	; b778
	defb 000h,07ch	; b77a
	defb 0c6h,0f5h	; b77c
	defb 000h,0f4h	; b77e
	defb 0d6h,0c9h	; b780
	defb 010h,0c8h	; b782
	defb 0c6h,063h	; b784
	defb 000h,060h	; b786
	defb 03fh,02fh	; b788
	defb 000h,020h	; b78a
	defb 0bfh,08fh	; b78c
	defb 080h,000h	; b78e
	defb 08fh,0ffh	; b790
	defb 080h,000h	; b792
	defb 0afh,0ffh	; b794
	defb 0a0h,000h	; b796
	defb 06fh,0ffh	; b798
	defb 060h,000h	; b79a
	defb 04fh,0ffh	; b79c
	defb 040h,000h	; b79e
	defb 0c7h,0b9h	; b7a0
	defb 000h,039h	; b7a2
	defb 0d7h,097h	; b7a4
	defb 010h,017h	; b7a6
	defb 0c4h,00eh	; b7a8
	defb 000h,00eh	; b7aa
	defb 0fdh,0a8h	; b7ac
	defb 001h,088h	; b7ae
	defb 0fch,023h	; b7b0
	defb 000h,000h	; b7b2
	defb 0ffh,0ffh	; b7b4
	defb 000h,000h	; b7b6
	defb 0c3h,0ffh	; b7b8
	defb 000h,000h	; b7ba
	defb 098h,0ffh	; b7bc
	defb 018h,000h	; b7be
	defb 0bah,063h	; b7c0
	defb 03ah,000h	; b7c2
	defb 0afh,06bh	; b7c4
	defb 02fh,008h	; b7c6
	defb 095h,069h	; b7c8
	defb 015h,008h	; b7ca
	defb 0b6h,04ch	; b7cc
	defb 036h,00ch	; b7ce
	defb 093h,056h	; b7d0
	defb 013h,016h	; b7d2
	defb 0c6h,052h	; b7d4
	defb 006h,012h	; b7d6
	defb 0f0h,0cch	; b7d8
	defb 000h,00ch	; b7da
	defb 0ffh,0e1h	; b7dc
	defb 000h,000h	; b7de
	defb 01fh,0ffh	; b7e0
	defb 000h,000h	; b7e2
	defb 0bfh,0ffh	; b7e4
	defb 080h,000h	; b7e6
	defb 030h,0f1h	; b7e8
	defb 000h,000h	; b7ea
	defb 0f6h,0f5h	; b7ec
	defb 006h,004h	; b7ee
	defb 0f4h,0f1h	; b7f0
	defb 004h,000h	; b7f2
	defb 0f1h,0ffh	; b7f4
	defb 000h,000h	; b7f6
	defb 0ffh,0ffh	; b7f8
	defb 000h,000h	; b7fa
	defb 0ffh,00fh	; b7fc
	defb 000h,000h	; b7fe
	defb 0feh,063h	; b800
	defb 000h,060h	; b802
	defb 0feh,0ebh	; b804
	defb 000h,0e8h	; b806
	defb 08ch,0dbh	; b808
	defb 000h,0d8h	; b80a
	defb 0adh,03bh	; b80c
	defb 021h,038h	; b80e
	defb 08ch,0c3h	; b810
	defb 000h,0c0h	; b812
	defb 0fdh,0efh	; b814
	defb 001h,0e0h	; b816
	defb 0fch,00fh	; b818
	defb 000h,000h	; b81a
	defb 0ffh,0ffh	; b81c
	defb 000h,000h	; b81e
	defb 000h,000h	; b820
	defb 000h,000h	; b822
	defb 003h,080h	; b824
	defb 0e3h,08eh	; b826
	defb 002h,080h	; b828
	defb 0bfh,0fah	; b82a
	defb 003h,080h	; b82c
	defb 0e3h,08eh	; b82e
	defb 001h,000h	; b830
	defb 001h,000h	; b832
	defb 001h,000h	; b834
	defb 001h,000h	; b836
	defb 001h,000h	; b838
	defb 001h,000h	; b83a
	defb 0e3h,08eh	; b83c
	defb 003h,080h	; b83e
	defb 0ffh,0fah	; b840
	defb 003h,080h	; b842
	defb 0e3h,08eh	; b844
	defb 003h,080h	; b846
	defb 001h,000h	; b848
	defb 001h,000h	; b84a
	defb 001h,000h	; b84c
	defb 001h,000h	; b84e
	defb 001h,000h	; b850
	defb 001h,000h	; b852
	defb 003h,080h	; b854
	defb 003h,080h	; b856
	defb 002h,080h	; b858
	defb 002h,080h	; b85a
	defb 003h,080h	; b85c
	defb 003h,080h	; b85e
	defb 000h,000h	; b860
	defb 000h,000h	; b862
	defb 000h,000h	; b864
	defb 0e0h,00eh	; b866
	defb 038h,01ch	; b868
	defb 0a0h,00ah	; b86a
	defb 03fh,0f4h	; b86c
	defb 0e0h,00eh	; b86e
	defb 038h,01ch	; b870
	defb 040h,004h	; b872
	defb 010h,008h	; b874
	defb 040h,004h	; b876
	defb 010h,008h	; b878
	defb 040h,004h	; b87a
	defb 010h,008h	; b87c
	defb 0e0h,00eh	; b87e
	defb 010h,008h	; b880
	defb 0e0h,00eh	; b882
	defb 010h,008h	; b884
	defb 0e0h,00eh	; b886
	defb 010h,008h	; b888
	defb 040h,004h	; b88a
	defb 038h,01ch	; b88c
	defb 040h,004h	; b88e
	defb 02fh,0f4h	; b890
	defb 040h,004h	; b892
	defb 038h,01ch	; b894
	defb 0e3h,08eh	; b896
	defb 000h,000h	; b898
	defb 0beh,0fah	; b89a
	defb 000h,000h	; b89c
	defb 0e3h,08eh	; b89e
	defb 000h,000h	; b8a0
	defb 000h,000h	; b8a2
	defb 003h,080h	; b8a4
	defb 0e3h,08eh	; b8a6
	defb 002h,080h	; b8a8
	defb 0beh,0fah	; b8aa
	defb 003h,080h	; b8ac
	defb 0e3h,08eh	; b8ae
	defb 001h,000h	; b8b0
	defb 001h,000h	; b8b2
	defb 001h,000h	; b8b4
	defb 001h,000h	; b8b6
	defb 001h,000h	; b8b8
	defb 001h,000h	; b8ba
	defb 0e3h,08eh	; b8bc
	defb 003h,080h	; b8be
	defb 0e3h,08ah	; b8c0
	defb 003h,080h	; b8c2
	defb 0e3h,08eh	; b8c4
	defb 003h,080h	; b8c6
	defb 041h,004h	; b8c8
	defb 001h,000h	; b8ca
	defb 041h,004h	; b8cc
	defb 001h,000h	; b8ce
	defb 041h,004h	; b8d0
	defb 001h,000h	; b8d2
	defb 0e3h,08eh	; b8d4
	defb 0e3h,08eh	; b8d6
	defb 0beh,0fah	; b8d8
	defb 0beh,0fah	; b8da
	defb 0e3h,08eh	; b8dc
	defb 0e3h,08eh	; b8de
	defb 000h,000h	; b8e0
	defb 000h,000h	; b8e2
	defb 0e3h,08eh	; b8e4
	defb 0e3h,08eh	; b8e6
	defb 0a2h,08ah	; b8e8
	defb 0beh,0fah	; b8ea
	defb 0e3h,08eh	; b8ec
	defb 0e3h,08eh	; b8ee
	defb 041h,004h	; b8f0
	defb 040h,004h	; b8f2
	defb 041h,004h	; b8f4
	defb 040h,004h	; b8f6
	defb 041h,004h	; b8f8
	defb 040h,004h	; b8fa
	defb 0e3h,08eh	; b8fc
	defb 0e3h,08eh	; b8fe
	defb 0feh,0feh	; b900
	defb 0a3h,08ah	; b902
	defb 0e3h,08eh	; b904
	defb 0e3h,08eh	; b906
	defb 040h,004h	; b908
	defb 041h,004h	; b90a
	defb 040h,004h	; b90c
	defb 041h,004h	; b90e
	defb 040h,004h	; b910
	defb 041h,004h	; b912
	defb 0e0h,00eh	; b914
	defb 0e3h,08eh	; b916
	defb 0a0h,00ah	; b918
	defb 0bfh,0fah	; b91a
	defb 0e0h,00eh	; b91c
	defb 0e3h,08eh	; b91e
	defb 0fch,03fh	; b920
	defb 000h,000h	; b922
	defb 0e1h,087h	; b924
	defb 001h,080h	; b926
	defb 0cah,0d3h	; b928
	defb 00ah,0d0h	; b92a
	defb 09ah,0d9h	; b92c
	defb 01ah,0d8h	; b92e
	defb 0b2h,0cdh	; b930
	defb 032h,0cch	; b932
	defb 084h,0e1h	; b934
	defb 004h,0e0h	; b936
	defb 039h,07ch	; b938
	defb 039h,07ch	; b93a
	defb 042h,086h	; b93c
	defb 042h,086h	; b93e
	defb 05dh,07eh	; b940
	defb 05dh,07eh	; b942
	defb 038h,0fch	; b944
	defb 038h,0fch	; b946
	defb 084h,0e1h	; b948
	defb 004h,0e0h	; b94a
	defb 0b2h,0cdh	; b94c
	defb 032h,0cch	; b94e
	defb 09ah,0d9h	; b950
	defb 01ah,0d8h	; b952
	defb 0cah,0d3h	; b954
	defb 00ah,0d0h	; b956
	defb 0e1h,087h	; b958
	defb 001h,080h	; b95a
	defb 0fch,03fh	; b95c
	defb 000h,000h	; b95e
	defb 0f8h,01fh	; b960
	defb 000h,000h	; b962
	defb 0e2h,047h	; b964
	defb 002h,040h	; b966
	defb 0edh,0b7h	; b968
	defb 00dh,0b0h	; b96a
	defb 08dh,0b1h	; b96c
	defb 00dh,0b0h	; b96e
	defb 0b5h,0adh	; b970
	defb 035h,0ach	; b972
	defb 03bh,0dch	; b974
	defb 03bh,0dch	; b976
	defb 046h,062h	; b978
	defb 046h,062h	; b97a
	defb 03dh,0bch	; b97c
	defb 03dh,0bch	; b97e
	defb 03dh,0bch	; b980
	defb 03dh,0bch	; b982
	defb 046h,062h	; b984
	defb 046h,062h	; b986
	defb 03bh,0dch	; b988
	defb 03bh,0dch	; b98a
	defb 0b5h,0adh	; b98c
	defb 035h,0ach	; b98e
	defb 08dh,0b1h	; b990
	defb 00dh,0b0h	; b992
	defb 0edh,0b7h	; b994
	defb 00dh,0b0h	; b996
	defb 0e2h,047h	; b998
	defb 002h,040h	; b99a
	defb 0f8h,01fh	; b99c
	defb 000h,000h	; b99e
	defb 0f8h,01fh	; b9a0
	defb 000h,000h	; b9a2
	defb 0e3h,0c7h	; b9a4
	defb 003h,0c0h	; b9a6
	defb 0ceh,0b3h	; b9a8
	defb 00eh,0b0h	; b9aa
	defb 097h,0d9h	; b9ac
	defb 017h,0d8h	; b9ae
	defb 0afh,0edh	; b9b0
	defb 02fh,0ech	; b9b2
	defb 03ch,034h	; b9b4
	defb 03ch,034h	; b9b6
	defb 079h,09eh	; b9b8
	defb 078h,01eh	; b9ba
	defb 05bh,0d6h	; b9bc
	defb 058h,016h	; b9be
	defb 07bh,0deh	; b9c0
	defb 078h,01eh	; b9c2
	defb 059h,096h	; b9c4
	defb 058h,016h	; b9c6
	defb 02ch,02ch	; b9c8
	defb 02ch,02ch	; b9ca
	defb 0b7h,0ddh	; b9cc
	defb 037h,0dch	; b9ce
	defb 09ah,0b9h	; b9d0
	defb 01ah,0b8h	; b9d2
	defb 0cfh,0f3h	; b9d4
	defb 00fh,0f0h	; b9d6
	defb 0e3h,0c7h	; b9d8
	defb 003h,0c0h	; b9da
	defb 0f8h,01fh	; b9dc
	defb 000h,000h	; b9de
	defb 0f8h,01fh	; b9e0
	defb 000h,000h	; b9e2
	defb 0e3h,0c7h	; b9e4
	defb 003h,0c0h	; b9e6
	defb 0cch,033h	; b9e8
	defb 00ch,030h	; b9ea
	defb 090h,019h	; b9ec
	defb 010h,018h	; b9ee
	defb 0a2h,0adh	; b9f0
	defb 022h,0ach	; b9f2
	defb 024h,074h	; b9f4
	defb 024h,074h	; b9f6
	defb 048h,0beh	; b9f8
	defb 048h,0beh	; b9fa
	defb 041h,0d6h	; b9fc
	defb 041h,0d6h	; b9fe
	defb 04bh,03eh	; ba00
	defb 04bh,03eh	; ba02
	defb 041h,076h	; ba04
	defb 041h,076h	; ba06
	defb 029h,0ech	; ba08
	defb 029h,0ech	; ba0a
	defb 0a5h,05dh	; ba0c
	defb 025h,05ch	; ba0e
	defb 092h,0b9h	; ba10
	defb 012h,0b8h	; ba12
	defb 0cfh,0f3h	; ba14
	defb 00fh,0f0h	; ba16
	defb 0e3h,0c7h	; ba18
	defb 003h,0c0h	; ba1a
	defb 0f8h,01fh	; ba1c
	defb 000h,000h	; ba1e

; ----------------------------------------------------------------------
; DATOS mandos_de_la_demo: La DEMO: los mandos grabados, un byte por fotograma
;   (869 B = 17,4 s)
;   0xba20..0xbd85  (869 bytes)
DATA_mandos_de_la_demo:
	defb 000h,000h,000h,000h,000h,000h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h	; ba20  ................
	defb 002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h,002h	; ba30  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; ba40  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,00ah,00ah,00ah,00ah	; ba50  ................
	defb 002h,002h,002h,002h,002h,002h,016h,016h,005h,015h,015h,005h,015h,005h,015h,005h	; ba60  ................
	defb 005h,009h,009h,009h,009h,009h,009h,009h,00ah,00ah,00ah,00ah,00ah,00ah,002h,002h	; ba70  ................
	defb 006h,006h,006h,006h,007h,005h,005h,005h,005h,005h,001h,009h,009h,009h,009h,009h	; ba80  ................
	defb 008h,008h,008h,008h,000h,010h,000h,000h,010h,000h,010h,000h,000h,010h,000h,010h	; ba90  ................
	defb 000h,010h,000h,010h,000h,010h,000h,010h,000h,000h,012h,002h,012h,002h,012h,002h	; baa0  ................
	defb 012h,002h,012h,002h,012h,002h,002h,002h,002h,002h,002h,002h,002h,002h,006h,006h	; bab0  ................
	defb 016h,015h,005h,015h,005h,015h,005h,014h,014h,004h,014h,004h,015h,005h,015h,00dh	; bac0  ................
	defb 009h,009h,009h,019h,008h,018h,008h,00ah,00ah,00ah,01ah,00ah,01ah,00ah,019h,019h	; bad0  ................
	defb 009h,019h,008h,008h,008h,008h,018h,008h,019h,009h,009h,019h,009h,019h,009h,008h	; bae0  ................
	defb 008h,00ah,00ah,00ah,00ah,00ah,002h,002h,002h,012h,012h,002h,012h,002h,012h,002h	; baf0  ................
	defb 012h,002h,012h,000h,010h,000h,010h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; bb00  ................
	defb 000h,000h,000h,000h,000h,000h,010h,010h,000h,005h,005h,005h,005h,005h,005h,005h	; bb10  ................
	defb 005h,005h,005h,005h,005h,005h,005h,005h,005h,005h,005h,005h,005h,005h,005h,005h	; bb20  ................
	defb 004h,004h,004h,004h,004h,004h,004h,004h,004h,004h,004h,004h,004h,004h,004h,004h	; bb30  ................
	defb 004h,004h,004h,004h,014h,010h,002h,00ah,00ah,00ah,019h,009h,018h,00ah,00ah,00ah	; bb40  ................
	defb 01ah,009h,009h,019h,009h,019h,009h,009h,00ah,01ah,00ah,01ah,00ah,002h,006h,016h	; bb50  ................
	defb 006h,016h,015h,005h,015h,005h,015h,005h,015h,009h,009h,009h,009h,009h,00ah,00ah	; bb60  ................
	defb 00ah,018h,009h,009h,019h,009h,019h,009h,009h,019h,008h,018h,018h,00ah,002h,002h	; bb70  ................
	defb 00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,00ah,012h,006h,006h,016h,005h,005h	; bb80  ................
	defb 015h,005h,005h,005h,015h,011h,001h,001h,001h,001h,001h,010h,000h,000h,000h,010h	; bb90  ................
	defb 000h,000h,000h,010h,000h,002h,002h,002h,002h,002h,002h,002h,000h,000h,000h,000h	; bba0  ................
	defb 018h,019h,009h,009h,019h,009h,009h,009h,001h,005h,015h,005h,014h,014h,004h,014h	; bbb0  ................
	defb 006h,006h,016h,006h,004h,014h,004h,016h,016h,006h,016h,000h,000h,000h,000h,000h	; bbc0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,010h,010h,010h,000h,000h	; bbd0  ................
	defb 008h,008h,00ah,00ah,002h,002h,002h,002h,002h,012h,012h,004h,004h,014h,014h,004h	; bbe0  ................
	defb 004h,014h,004h,004h,014h,004h,004h,000h,001h,001h,001h,001h,001h,001h,001h,001h	; bbf0  ................
	defb 001h,009h,009h,009h,009h,009h,009h,009h,009h,009h,009h,008h,008h,008h,008h,008h	; bc00  ................
	defb 008h,008h,00ah,00ah,00ah,00ah,00ah,00ah,002h,002h,002h,000h,004h,014h,014h,004h	; bc10  ................
	defb 014h,014h,000h,012h,002h,002h,012h,002h,012h,002h,012h,012h,002h,012h,002h,012h	; bc20  ................
	defb 002h,012h,002h,002h,012h,004h,014h,015h,005h,015h,005h,015h,015h,005h,015h,005h	; bc30  ................
	defb 014h,014h,005h,009h,009h,019h,008h,008h,01ah,00ah,018h,008h,009h,018h,018h,008h	; bc40  ................
	defb 008h,008h,008h,008h,008h,008h,008h,008h,008h,008h,008h,008h,008h,002h,002h,006h	; bc50  ................
	defb 004h,004h,005h,005h,005h,005h,005h,005h,004h,004h,004h,004h,004h,004h,004h,014h	; bc60  ................
	defb 014h,004h,014h,004h,014h,004h,009h,009h,009h,009h,001h,001h,001h,000h,000h,008h	; bc70  ................
	defb 008h,008h,008h,008h,008h,008h,008h,008h,009h,009h,009h,009h,009h,009h,009h,009h	; bc80  ................
	defb 009h,009h,009h,009h,009h,009h,001h,010h,000h,010h,010h,000h,000h,010h,010h,000h	; bc90  ................
	defb 010h,000h,010h,002h,012h,002h,012h,002h,012h,002h,012h,002h,012h,002h,012h,002h	; bca0  ................
	defb 012h,002h,012h,006h,016h,004h,005h,005h,005h,015h,015h,005h,005h,005h,005h,005h	; bcb0  ................
	defb 005h,005h,004h,004h,004h,004h,004h,004h,004h,004h,004h,004h,004h,004h,004h,004h	; bcc0  ................
	defb 004h,004h,004h,004h,004h,004h,004h,004h,004h,004h,014h,014h,004h,000h,000h,000h	; bcd0  ................
	defb 000h,008h,008h,008h,008h,008h,008h,008h,008h,008h,008h,008h,008h,008h,008h,008h	; bce0  ................
	defb 008h,008h,008h,008h,008h,008h,008h,008h,000h,008h,000h,000h,000h,000h,000h,000h	; bcf0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,006h,006h,006h,006h,006h	; bd00  ................
	defb 002h,002h,00ah,00bh,009h,009h,011h,011h,001h,001h,001h,001h,001h,000h,000h,010h	; bd10  ................
	defb 010h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,008h,008h,008h	; bd20  ................
	defb 00ah,00ah,00ah,002h,002h,012h,002h,002h,012h,002h,012h,002h,010h,000h,000h,019h	; bd30  ................
	defb 009h,009h,019h,009h,019h,009h,019h,009h,019h,011h,005h,015h,015h,004h,004h,014h	; bd40  ................
	defb 014h,004h,016h,002h,002h,012h,00ah,01ah,00ah,00ah,01ah,002h,002h,002h,002h,002h	; bd50  ................
	defb 002h,002h,002h,002h,002h,006h,006h,014h,004h,004h,004h,004h,004h,004h,004h,004h	; bd60  ................
	defb 004h,004h,004h,004h,004h,005h,005h,005h,005h,005h,004h,004h,004h,004h,004h,004h	; bd70  ................
	defb 004h,004h,004h,000h,000h	; bd80

; ======================================================================
; CODIGO 0xbd85..0xc184  (1023 bytes)
; ======================================================================


arranque:		; Donde salta el cargador: pila en 0x5B32, apaga la pantalla por el registro 1 del VDP, engancha `ret` en H.KEYI y `jp 0xE15A` en H.TIMI, hace la presentacion y los creditos, limpia el mapa y las variables del sonido, siembra el azar con dos `ld a,r`, monta la pantalla del menu y se queda en el bucle de atraccion de 0xBE2F hasta que el disparo elige opcion por la fila de la nave
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
	call presentacion		;bda6
	call sonido_reset		;bda9
	ld hl,0edffh		;bdac
	ld de,0ee00h		;bdaf
	ld bc,0000dh		;bdb2
	ld (hl),000h		;bdb5
	ldir		;bdb7
	ld a,r		;bdb9
	ld l,a			;bdbb
	ld a,r		;bdbc
	ld h,a			;bdbe
	ld (0ca8fh),hl		;bdbf
	ld hl,05c32h		;bdc2
	ld de,05c33h		;bdc5
	ld bc,001fdh		;bdc8
	ldir		;bdcb
	xor a			;bdcd
	ld (0dcc3h),a		;bdce
	ld de,0cb09h		;bdd1
	ld b,030h		;bdd4   ; Rellena la tabla de las 48 estrellas (0xCB09) con alturas al azar menores de 0xA0
L_BDD6:
	call azar		;bdd6
	cp 0a0h		;bdd9
	inc hl			;bddb
	jr nc,L_BDD6		;bddc
	ld (de),a			;bdde
	inc de			;bddf
	djnz L_BDD6		;bde0
L_BDE2:
	call entra_en_records		;bde2
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
	call pinta_marca_hud		;bdfb
	ld a,073h		;bdfe
	call dibuja_sprite_vram		;be00
	ld a,0f1h		;be03
	call rellena_colores		;be05
	ld a,00ah		;be08
	ld (0d3c1h),a		;be0a
	call pinta_energia		;be0d
	call repone_escudo		;be10
	ld a,003h		;be13
	ld (0e156h),a		;be15
	call hud_vidas_zona		;be18
	ld hl,0c1bdh		;be1b
	ld (actualiza_nave+1),hl		;be1e
	ld a,r		;be21
	ld l,a			;be23
	ld a,r		;be24
	ld h,a			;be26
	ld (0ca8fh),hl		;be27
L_BE2A:
	ld a,0a0h		;be2a
	ld (0ca8eh),a		;be2c
L_BE2F:
	call borra_buffer		;be2f
	call mueve_estrellas		;be32
	call actualiza_nave		;be35
	call pinta_menu		;be38
	call vuelca_pantalla		;be3b
	ld a,(0ca8eh)		;be3e
	dec a			;be41
	jp z,L_D560		;be42
	ld (0ca8eh),a		;be45
	ld a,(0e150h)		;be48
	and a			;be4b
	jr z,L_BE2F		;be4c
	bit 4,a		;be4e
	jp z,L_BE2A		;be50
	ld a,(0c185h)		;be53
	cp 039h		;be56
	jr c,L_BE2A		;be58
	cp 058h		;be5a
	jr z,L_BE2A		;be5c
	jr nc,L_BE66		;be5e
	ld (0dcc3h),a		;be60
	jp L_BE2A		;be63
L_BE66:
	cp 078h		;be66
	jr z,L_BE2A		;be68
	jr nc,L_BE73		;be6a
	xor a			;be6c
	ld (0dcc3h),a		;be6d
	jp L_BE2A		;be70
L_BE73:
	cp 098h		;be73
	jr z,L_BE2A		;be75
	jr nc,hud_reset		;be77
	call redefine_teclas		;be79
	jp L_BDE5		;be7c
hud_reset:		; Pone el marcador de puntos a "000000" (seis 0x30 desde 0xDD80) y lo pinta en 0x12B0, la misma posicion que usa la fase de a pie
	ld hl,0dd80h		;be7f
	ld de,0dd81h		;be82
	ld bc,00005h		;be85
	ld (hl),030h		;be88
	ldir		;be8a
	ld ix,0dd80h		;be8c
	ld de,012b0h		;be90
	call hud_imprime		;be93
	ld a,002h		;be96
	ld (0e156h),a		;be98
	dec a			;be9b
	ld (0e157h),a		;be9c
	ld hl,0d0dfh		;be9f
	ld (0d0ddh),hl		;bea2
	ld hl,nave_estado		;bea5
	ld (va_a_nave_estado+1),hl		;bea8
	ld hl,0ba20h		;beab
	ld (0e158h),hl		;beae
	ld a,00ah		;beb1
	ld (0d3c1h),a		;beb3
	call pinta_energia		;beb6
L_BEB9:
	call repone_escudo		;beb9
	xor a			;bebc
	ld (0c952h),a		;bebd
	ld (0c9a3h),a		;bec0
	ld (0dcc1h),a		;bec3
	ld (0e14eh),a		;bec6
	ld hl,0a058h		;bec9
	ld (0c184h),hl		;becc
	ld hl,003e8h		;becf
	ld de,05b32h		;bed2
	ld b,040h		;bed5
L_BED7:
	call azar		;bed7
	and 00fh		;beda
	sub 007h		;bedc
	ld (de),a			;bede
	inc de			;bedf
	inc hl			;bee0
	call azar		;bee1
	and 00fh		;bee4
	sub 00fh		;bee6
	ld (de),a			;bee8
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
	add hl,hl			;bef6
	add hl,de			;bef7
	ld de,0de03h		;bef8
	add hl,de			;befb
	ld e,(hl)			;befc
	inc hl			;befd
	ld d,(hl)			;befe
	inc hl			;beff
	ld a,(hl)			;bf00
	push af			;bf01
	ex de,hl			;bf02
	call descomprime_nivel		;bf03
	ld iy,0cb03h		;bf06
	ld (iy+000h),050h		;bf0a
	ld (iy+001h),001h		;bf0e
	ld (iy+002h),020h		;bf12
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
	call sonido_reset		;bf41
	ld hl,0edffh		;bf44
	ld de,0ee00h		;bf47
	ld bc,0000dh		;bf4a
	ld (hl),000h		;bf4d
	ldir		;bf4f
	call hud_vidas_zona		;bf51
	ld a,073h		;bf54
	call dibuja_sprite_vram		;bf56
	pop af			;bf59
	call rellena_colores		;bf5a
	ld a,080h		;bf5d
	ld (0ca91h),a		;bf5f
	ld a,001h		;bf62
	ld (0cb39h),a		;bf64
	ld (0d3c2h),a		;bf67
L_BF6A:
	ld hl,0ca8eh		;bf6a
	inc (hl)			;bf6d
	call repinta_fondo		;bf6e
	call pinta_escudo		;bf71
	call parpadeo_energia		;bf74
	call mueve_estrellas		;bf77
	ld a,001h		;bf7a
	ld (0d3c2h),a		;bf7c
	call recorre_tiles_especiales		;bf7f
	call mueve_perseguidor		;bf82
	call aparece_perseguidor		;bf85
	call traza_estela		;bf88
	call recorre_las_dos_tablas		;bf8b
	call mueve_disparos		;bf8e
	call mueve_bandada		;bf91
	call mueve_objetos		;bf94
	call alta_enemigo_cuadro		;bf97
	call va_a_nave_estado		;bf9a
	call gobierna_instalaciones		;bf9d
	ld a,(actualiza_nave+1)		;bfa0
	cp 0afh		;bfa3
	jr nz,L_BFD0		;bfa5
	call hay_tecla		;bfa7
	jp nz,L_BDE5		;bfaa
	ld a,(0ca8eh)		;bfad
	and 008h		;bfb0
	jr z,L_BFD0		;bfb2
	ld a,0ffh		;bfb4
	ld (0d4d3h),a		;bfb6
	ld (0d4d9h),a		;bfb9
	ld ix,0ddf2h		;bfbc
	ld hl,04d94h		;bfc0
	call rotula_cadena		;bfc3
	ld a,055h		;bfc6
	ld (0d4d3h),a		;bfc8
	ld a,0aah		;bfcb
	ld (0d4d9h),a		;bfcd
L_BFD0:
	call vuelca_pantalla		;bfd0
	ld a,(0cb39h)		;bfd3
	and a			;bfd6
	jp z,L_D740		;bfd7
	ld ix,0dcb1h		;bfda
	ld a,(ix+00dh)		;bfde
	out (0aah),a		;bfe1
	in a,(0a9h)		;bfe3
	and (ix+00ch)		;bfe5
	jp z,L_BDE2		;bfe8
	call pausa		;bfeb
	ld a,(0c188h)		;bfee
	cp 02dh		;bff1
	jr nc,L_BFF8		;bff3
	jp L_BF6A		;bff5
L_BFF8:
	ld a,(0e156h)		;bff8
	sub 001h		;bffb
	ld (0e156h),a		;bffd
	jp c,L_BDE2		;c000
	jp L_BEB9		;c003
pausa:		; Si la tecla PARAR (la sexta de 0xDCB1) esta pulsada, espera a que se suelten todas las teclas y luego a que se pulse cualquiera
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
	cp 0f9h		;c022
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
	cp 0f9h		;c032
	jr nz,L_C029		;c034
	jr L_C026		;c036
hud_vidas_zona:		; Repinta los dos indicadores de un digito, vidas (0xE156 -> 0xE152, patrones 0x07A0) y zona (0xE157 -> 0xE154, patrones 0x1630), pasandolos a ASCII con add a,030h
	ld a,(0e156h)		;c038
	add a,030h		;c03b
	ld (0e152h),a		;c03d
	ld ix,0e152h		;c040
	ld de,007a0h		;c044
	call hud_imprime		;c047
	ld a,(0e157h)		;c04a
	add a,030h		;c04d
	ld (0e154h),a		;c04f
	ld ix,0e154h		;c052
	ld de,01630h		;c056
	jp hud_imprime		;c059
recarga_escudo:		; Pone el escudo (0xC188) a 3 y sigue en actualiza_nave. Nadie la llama en el juego original -su direccion no aparece ni una vez en el bloque-: es donde aterriza el POKE de inmortalidad de Input MSX 19, que cambia el `jr c` de 0xC06E por un `jr -20`
	ld a,003h		;c05c
	ld (0c188h),a		;c05e
	jr actualiza_nave		;c061
va_a_nave_estado:		; Trampolin de tres bytes: `jp nave_estado`
	jp nave_estado		;c063
nave_estado:		; El despachador de 0xC188, que es ESCUDO y agonia en la misma variable: de 0 a 3 son los impactos que aguanta; igual a 4 arranca la explosion (siembra_particulas) y aparca la nave en 0xFF58; mas de 4 la explosion sigue. El POKE de inmortalidad de Input MSX 19 parchea su jr c de 0xC06E
	ld hl,(0c184h)		;c066
	ld a,(0c188h)		;c069
	cp 004h		;c06c
	jr c,actualiza_nave		;c06e
	jr z,L_C07A		;c070
	inc a			;c072
	ld (0c188h),a		;c073
	call mueve_particulas		;c076
	ret			;c079
L_C07A:
	inc a			;c07a
	ld (0c188h),a		;c07b
	ld a,h			;c07e
	sub 010h		;c07f
	ld h,a			;c081
	call siembra_particulas		;c082
	call mueve_particulas		;c085
	ld hl,0ff58h		;c088
	ld (0c184h),hl		;c08b
	ret			;c08e
actualiza_nave:		; La nave, de punta a punta: lee el mando, pasa el rumbo pedido por gira_rumbo, mueve la posicion de 0xC184 con aplica_rumbo y la pinta con pinta_sprite. El fotograma esta en los 5 bits bajos de 0xC9A3 y los 3 altos son el rumbo
	call lee_mando		;c08f
	ld (0e150h),a		;c092
	call dispara		;c095
	and 00fh		;c098
	call poda_rumbo_nave		;c09a
	call rumbo_a_mascara2		;c09d
	cp 0ffh		;c0a0
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
	call gira_rumbo		;c0b0
	ld (0c9a3h),a		;c0b3
	pop af			;c0b6
	ld hl,(0c184h)		;c0b7
	jr z,L_C0D0		;c0ba
	ld a,(0c9a3h)		;c0bc
	and 007h		;c0bf
	ld hl,(0c184h)		;c0c1
	ld bc,00404h		;c0c4
	call aplica_rumbo		;c0c7
	call recorta_a_area		;c0ca
	ld (0c184h),hl		;c0cd
L_C0D0:
	ld a,(0c9a3h)		;c0d0
	and 01fh		;c0d3
	call pinta_sprite		;c0d5
	call tiro_alcanza_nave		;c0d8
	ret			;c0db
alta_tile_especial:		; Mete una entrada en la tabla de los tiles especiales (0xCB3A, contador 0xCA92, tope 8): columna en (ix+001), indice de tile en (ix+002) y puntero al byte del mapa en (ix+005/006); la rutina de gobierno la pone luego el despachador de 0xC116 segun el indice, con 0xC678 de serie
	ex af,af'			;c0dc
	ld a,(0ca92h)		;c0dd
	cp 008h		;c0e0
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
	ld (ix+000h),000h		;c0f8
	ld (ix+007h),000h		;c0fc
	ld a,006h		;c100
	sub b			;c102
	rrca			;c103
	rrca			;c104
	rrca			;c105
	ld (ix+001h),a		;c106
	ex af,af'			;c109
	ld (ix+002h),a		;c10a
	ld de,0c678h		;c10d
	ld (ix+003h),e		;c110
	ld (ix+004h),d		;c113
	cp 030h		;c116
	jr c,L_C17D		;c118
	jr nz,L_C122		;c11a
	ld de,0c189h		;c11c
	jp L_C177		;c11f
L_C122:
	cp 031h		;c122
	jr nz,L_C12C		;c124
	ld de,0c189h		;c126
	jp L_C177		;c129
L_C12C:
	cp 032h		;c12c
	jr nz,L_C136		;c12e
	ld de,0e091h		;c130
	jp L_C177		;c133
L_C136:
	cp 037h		;c136
	jr nz,L_C140		;c138
	ld de,0dfd4h		;c13a
	jp L_C177		;c13d
L_C140:
	cp 03bh		;c140
	jr nz,L_C14A		;c142
	ld de,0e002h		;c144
	jp L_C177		;c147
L_C14A:
	cp 03ch		;c14a
	jr nz,L_C154		;c14c
	ld de,0e02ah		;c14e
	jp L_C177		;c151
L_C154:
	cp 043h		;c154
	jr nz,L_C15E		;c156
	ld de,0d6c5h		;c158
	jp L_C177		;c15b
L_C15E:
	cp 045h		;c15e
	jr nz,L_C167		;c160
	ld de,0ce73h		;c162
	jr L_C177		;c165
L_C167:
	cp 046h		;c167
	jr nz,L_C170		;c169
	ld de,0d314h		;c16b
	jr L_C177		;c16e
L_C170:
	cp 05dh		;c170
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
; DATOS relleno_C184: Relleno o resto (5 B; 5 bytes)
;   0xc184..0xc189  (5 bytes)
DATA_relleno_C184:
	defb 000h,000h,000h,000h,000h	; c184

; ======================================================================
; CODIGO 0xc189..0xc8d7  (1870 bytes)
; ======================================================================


tile_30_31:		; El comportamiento de los tiles 0x30 y 0x31, los dos unicos que el despachador manda a la misma rutina (`ld de,0c189h` en 0xC11C y en 0xC126): siete bytes que solo encadenan impacto_objeto -quien lo revienta y paga los 200 puntos- y contacto_instalacion, que con la caja de choca_con_nave3 va derecho a mata_nave. Ni se anima ni dispara: es el tile que solo esta ahi para matar al que lo roce
	call impacto_objeto		;c189
	call contacto_instalacion		;c18c
	ret			;c18f
tile_estalla:		; El derrumbe de un tile especial: el estado que impacto_objeto le instala al reventarlo, con (ix+002) puesto a 0x28 (`ld hl,0c190h` en 0xD201). Cada cuadro escribe (ix+002) en la celda del mapa que apunta (ix+005/006) y lo sube uno, o sea que la celda recorre los tiles 0x28, 0x29, 0x2A y 0x2B -que dibujados son el boquete abriendose-; al llegar a 0x2C echa a suertes entre 0x2C y 0x2D (`call azar / and 001h / add a,e`), lo pinta un cuadro mas y se da de baja dejando ese crater en el mapa. Cinco cuadros clavados
	ld a,(ix+002h)		;c190
	ld l,(ix+005h)		;c193
	ld h,(ix+006h)		;c196
	ld (hl),a			;c199
	inc a			;c19a
	ld (ix+002h),a		;c19b
	cp 02ch		;c19e
	ret c			;c1a0
	jp nz,baja_tile_especial		;c1a1
	ld e,a			;c1a4
	call azar		;c1a5
	and 001h		;c1a8
	add a,e			;c1aa
	ld (ix+002h),a		;c1ab
	ret			;c1ae
lee_mando_demo:		; Saca el siguiente byte de la partida grabada de la demo (puntero en 0xE158) y avanza: la demo entra por el mismo sitio que el jugador
	ld ix,(0e158h)		;c1af
	ld a,(ix+000h)		;c1b3
	inc ix		;c1b6
	ld (0e158h),ix		;c1b8
	ret			;c1bc
lee_mando:		; Los cinco controles en un byte: por el registro 14 del PSG si 0xDCC3 dice joystick, o preguntando las cinco primeras teclas de 0xDCB1 si dice teclado. En el joystick los bits se reordenan a mano al codigo de rumbo del juego
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
	set 1,c		;c1dc
L_C1DE:
	rra			;c1de
	jr c,L_C1E3		;c1df
	set 0,c		;c1e1
L_C1E3:
	rra			;c1e3
	jr c,L_C1E8		;c1e4
	set 3,c		;c1e6
L_C1E8:
	rra			;c1e8
	jr c,L_C1ED		;c1e9
	set 2,c		;c1eb
L_C1ED:
	rra			;c1ed
	jr c,L_C1F2		;c1ee
	set 4,c		;c1f0
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
	rr c		;c207
	inc ix		;c209
	inc ix		;c20b
	djnz L_C1FA		;c20d
	ld a,c			;c20f
	rrca			;c210
	rrca			;c211
	rrca			;c212
	ret			;c213
mueve_bandada:		; Recorre la tabla de 0xC97B (contador en 0xC97A): a los vivos les mira el contador de (ix+004) -y al agotarse suena 0xEB42- y a los marcados con 0xFF en (ix+002) les pinta la explosion, fotograma a fotograma hasta el 0x21
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
	call pinta_sprite		;c22e
	inc (ix+003h)		;c231
	ld a,(ix+003h)		;c234
	cp 021h		;c237
	jp nz,L_C311		;c239
	jp L_C31C		;c23c
L_C23F:
	ld a,(ix+004h)		;c23f
	dec (ix+004h)		;c242
	jr nz,L_C251		;c245
	xor a			;c247
	ld de,0eb42h		;c248
	call arranca_guion_libre		;c24b
	jp L_C311		;c24e
L_C251:
	cp 010h		;c251
	jp nc,L_C311		;c253
	inc (ix+004h)		;c256
	ld b,(ix+001h)		;c259
	ld c,(ix+000h)		;c25c
	ld de,(0c184h)		;c25f
	call rumbo_hacia		;c263
	call borde_pantalla		;c266
	call rumbo_a_mascara2		;c269
	ld l,(ix+000h)		;c26c
	ld h,(ix+001h)		;c26f
	rrca			;c272
	rrca			;c273
	rrca			;c274
	ld c,a			;c275
	ld a,(ix+003h)		;c276
	inc a			;c279
	cp 006h		;c27a
	ld (ix+003h),a		;c27c
	ld a,(ix+002h)		;c27f
	jr nz,L_C291		;c282
	ld (ix+003h),000h		;c284
	and 01fh		;c288
	or c			;c28a
	call gira_rumbo		;c28b
	ld (ix+002h),a		;c28e
L_C291:
	ld l,(ix+000h)		;c291
	ld h,(ix+001h)		;c294
	and 007h		;c297
	ld bc,00404h		;c299
	call aplica_rumbo		;c29c
	call recorta_x_objeto		;c29f
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
	cp 0e0h		;c2bb
	jp nc,L_C31C		;c2bd
	ld a,(ix+002h)		;c2c0
	and 01fh		;c2c3
	add a,021h		;c2c5
	call pinta_sprite		;c2c7
	ld a,(ix+002h)		;c2ca
	bit 3,a		;c2cd
	jr z,L_C2EA		;c2cf
	and 007h		;c2d1
	ex af,af'			;c2d3
	call azar		;c2d4
	and 007h		;c2d7
	jr nz,L_C2EA		;c2d9
	ld a,(ix+000h)		;c2db
	add a,004h		;c2de
	ld c,a			;c2e0
	ld a,(ix+001h)		;c2e1
	add a,004h		;c2e4
	ld b,a			;c2e6
	call alta_enemigo		;c2e7
L_C2EA:
	call disparo_derriba_bandada		;c2ea
	ld a,(0c188h)		;c2ed
	cp 004h		;c2f0
	jr nc,L_C311		;c2f2
	ld l,(ix+000h)		;c2f4
	ld h,(ix+001h)		;c2f7
	call choca_con_nave2		;c2fa
	jr c,L_C311		;c2fd
	ld (ix+002h),0ffh		;c2ff
	ld (ix+003h),01dh		;c303
	xor a			;c307
	ld de,0ea52h		;c308
	call arranca_guion_libre		;c30b
	call mata_nave		;c30e
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
	dec (hl)			;c31f
	pop bc			;c320
	push bc			;c321
	ld a,b			;c322
	cp 001h		;c323
	jr z,L_C316		;c325
	push ix		;c327
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
	ex de,hl			;c338
	pop de			;c339
	ldir		;c33a
	jp L_C316		;c33c
mueve_estrellas:		; Las 48 estrellas de 0xCB09: baja una fila cada cuadro con vuelta en 0xA0 (la altura del buffer) y, si la celda esta ocupada, busca hasta 8 posiciones arriba o abajo -a saltos de 24, o sea en la misma columna- antes de rendirse. Por eso no se pintan encima del decorado
	ld de,0cb09h		;c33f
	ld c,030h		;c342
L_C344:
	ld a,(de)			;c344
	inc a			;c345
	cp 0a0h		;c346
	jr c,L_C34C		;c348
	sub 0a0h		;c34a
L_C34C:
	ld (de),a			;c34c
	ld h,a			;c34d
	ld l,c			;c34e
	call buffer_dir		;c34f
	ld (0d3cdh),hl		;c352
	ld b,008h		;c355
L_C357:
	ld a,(hl)			;c357
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
	ld a,(hl)			;c36d
	and a			;c36e
	jr nz,L_C385		;c36f
	ld a,l			;c371
	sub 018h		;c372
	ld l,a			;c374
	jp nc,L_C37E		;c375
	dec h			;c378
	ld a,h			;c379
	cp 040h		;c37a
	jr c,L_C385		;c37c
L_C37E:
	djnz L_C36D		;c37e
L_C380:
	ld hl,(0d3cdh)		;c380
	ld (hl),018h		;c383   ; Pinta una estrella: el patron fijo 0x18 (dos pixeles) donde dicta la tabla de las 48 estrellas de 0xCB09
L_C385:
	inc de			;c385
	dec c			;c386
	jr nz,L_C344		;c387
	ret			;c389
repinta_fondo:		; Redibuja las 160 filas del buffer leyendo la fila del mapa de 0x5C32 -seis tiles de 32x32 desde 0x6DE0, 128 B cada uno- y avanza el scroll dos pixeles; al completar los 32 de un tile baja una fila del mapa y da de alta los tiles especiales de la fila nueva. Es la rutina mas cara del bloque: 217.893 muestras en dump/pcs.txt
	ld iy,0cb03h		;c38a
	ld (iy+003h),000h		;c38e
	call entrada_tabla_5c32		;c392
	ld de,04000h		;c395
L_C398:
	ld a,(iy+002h)		;c398
	cp 020h		;c39b
	jr z,L_C3C3		;c39d
	ld a,(iy+003h)		;c39f
	and a			;c3a2
	jr z,L_C3B0		;c3a3
	cp 005h		;c3a5
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
	ld (iy+005h),000h		;c3c6
L_C3CA:
	ld a,006h		;c3ca
L_C3CC:
	ex af,af'			;c3cc
	ld (0d3cdh),de		;c3cd
	ld d,(ix+000h)		;c3d1
	xor a			;c3d4
	ld e,a			;c3d5
	rr d		;c3d6
	rr e		;c3d8
	ld hl,06de0h		;c3da
	add hl,de			;c3dd
	ld b,(iy+004h)		;c3de
	ld e,(iy+005h)		;c3e1
	ld d,a			;c3e4
	add hl,de			;c3e5
	inc ix		;c3e6
	ld de,(0d3cdh)		;c3e8
	ld a,d			;c3ec
	cp 050h		;c3ed
	jr nc,L_C409		;c3ef
	ld c,0ffh		;c3f1
L_C3F3:
	ldi		;c3f3   ; El blitter de fondo: cuatro ldi por tira de 4 columnas, paso 24, leyendo del pozo de graficos 0x6DE0-0x9ADF; redibuja las tres bandas enteras
	ldi		;c3f5
	ldi		;c3f7
	ldi		;c3f9
	dec b			;c3fb
	jr z,L_C409		;c3fc
	ld a,e			;c3fe
	add a,014h		;c3ff
	ld e,a			;c401
	jp nc,L_C3F3		;c402
	inc d			;c405
	jp L_C3F3		;c406
L_C409:
	ex af,af'			;c409
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
	cp 020h		;c41e
	ld a,005h		;c420
	adc a,000h		;c422
	cp (iy+003h)		;c424
	jp nz,L_C398		;c427
	ld a,(iy+001h)		;c42a
	and a			;c42d
	ret z			;c42e
	ld a,(iy+002h)		;c42f
	cp 020h		;c432
	jr z,L_C43C		;c434
	add a,002h		;c436
	ld (iy+002h),a		;c438
	ret			;c43b
L_C43C:
	ld a,(iy+000h)		;c43c
	or a			;c43f
	jp z,L_C476		;c440
	ld (iy+002h),002h		;c443
	dec (iy+000h)		;c447
	call entrada_tabla_5c32		;c44a
	push ix		;c44d
	pop hl			;c44f
	ld b,006h		;c450
L_C452:
	ld a,(hl)			;c452
	cp 05dh		;c453
	jr z,L_C45D		;c455
	cp 047h		;c457
	jr nc,L_C460		;c459
	cp 030h		;c45b
L_C45D:
	call nc,alta_tile_especial		;c45d
L_C460:
	inc hl			;c460
	djnz L_C452		;c461
	ret			;c463
entrada_tabla_5c32:		; IX = 0x5C32 + (iy+000)*6: la entrada de la tabla de 85 huecos de 6 bytes que el arranque limpia con el ldir de 0xBDC2
	ld ix,05c32h		;c464
	ld l,(iy+000h)		;c468
	ld h,000h		;c46b
	ld d,h			;c46d
	ld e,l			;c46e
	add hl,hl			;c46f
	add hl,de			;c470
	add hl,hl			;c471
	ex de,hl			;c472
	add ix,de		;c473
	ret			;c475
L_C476:
	xor a			;c476
	ld (0cb39h),a		;c477
	ret			;c47a
pinta_sprite:		; Estampa el sprite A (64 B en 0xA560 + A*64: 16 filas de mascara+dibujo) en la posicion HL (H = fila + 0x20, L = columna en pixeles), con el desplazamiento fino resuelto parcheando los `jr` de 0xC4C3 y 0xC4FA
	push hl			;c47b
	ld h,000h		;c47c
	ld l,a			;c47e
	add hl,hl			;c47f
	add hl,hl			;c480
	add hl,hl			;c481
	add hl,hl			;c482
	add hl,hl			;c483
	add hl,hl			;c484
	ld de,0a560h		;c485
	add hl,de			;c488
	ex de,hl			;c489
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
	srl l		;c4a5
	srl l		;c4a7
	srl l		;c4a9
	call buffer_dir		;c4ab
L_C4AE:
	ld a,h			;c4ae
	cp 050h		;c4af
	jr c,L_C4B9		;c4b1
	inc de			;c4b3
	inc de			;c4b4
	inc hl			;c4b5
	inc hl			;c4b6
	jr L_C525		;c4b7
L_C4B9:
	ld a,0ffh		;c4b9
	push de			;c4bb
	push hl			;c4bc
	ex de,hl			;c4bd
	ld d,(hl)			;c4be
	inc hl			;c4bf
	ld e,(hl)			;c4c0
	scf			;c4c1
	ex de,hl			;c4c2
L_C4C3:
	jr L_C4C3		;c4c3
atajo_mascara24:		; Desplazamiento de ocho de la mascara: A = H, H = L, L = 0xFF. Es el camino cuando la columna cae justa en un byte, y es el unico que no recorre la tira
	ld a,h			;c4c5
	ld h,l			;c4c6
	ld l,0ffh		;c4c7
	jp L_C4E1		;c4c9
tira_mascara24:		; La tira de la mascara: siete `adc hl,hl / adc a,a` seguidos, en la que pinta_sprite entra por el peldano n-1 para dar 8-n pasos. Entra con A=0xFF y acarreo, o sea rellenando de unos
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
	ex de,hl			;c4e1
	pop hl			;c4e2
	and (hl)			;c4e3   ; Los sprites, con mascara: el and abre el hueco...
	ld (hl),a			;c4e4
	inc hl			;c4e5
	ld a,d			;c4e6
	and (hl)			;c4e7
	ld (hl),a			;c4e8
	inc hl			;c4e9
	ld a,e			;c4ea
	and (hl)			;c4eb
	ld (hl),a			;c4ec
	pop de			;c4ed
	inc de			;c4ee
	inc de			;c4ef
	dec hl			;c4f0
	dec hl			;c4f1
	xor a			;c4f2
	push de			;c4f3
	push hl			;c4f4
	ex de,hl			;c4f5
	ld d,(hl)			;c4f6
	inc hl			;c4f7
	ld e,(hl)			;c4f8
	ex de,hl			;c4f9
L_C4FA:
	jr L_C4FA		;c4fa
atajo_dibujo24:		; Lo mismo que atajo_mascara24 para el dibujo: A = H, H = L, L = 0x00, rellenando de ceros
	ld a,h			;c4fc
	ld h,l			;c4fd
	ld l,000h		;c4fe
	jp L_C518		;c500
tira_dibujo24:		; La tira del dibujo: la misma de siete peldanos, byte a byte igual que la de la mascara. Se entra con `xor a`, que pone A a cero Y limpia el acarreo, asi que rellena de ceros
	adc hl,hl		;c503
	adc a,a			;c505
	adc hl,hl		;c506
	adc a,a			;c508
	adc hl,hl		;c509
	adc a,a			;c50b
	adc hl,hl		;c50c
	adc a,a			;c50e
	adc hl,hl		;c50f
	adc a,a			;c511
	adc hl,hl		;c512
	adc a,a			;c514
	adc hl,hl		;c515
	adc a,a			;c517
L_C518:
	ex de,hl			;c518
	pop hl			;c519
	or (hl)			;c51a
	ld (hl),a			;c51b   ; ...y el or pinta el sprite encima; el desplazamiento se precalcula con las cadenas de adc
	inc hl			;c51c
	ld a,d			;c51d
	or (hl)			;c51e
	ld (hl),a			;c51f
	inc hl			;c520
	ld a,e			;c521
	or (hl)			;c522
	ld (hl),a			;c523
	pop de			;c524
L_C525:
	inc de			;c525
	inc de			;c526
	ld bc,00016h		;c527
	add hl,bc			;c52a
	ld a,h			;c52b
	add a,00fh		;c52c
	cp 067h		;c52e
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
buffer_dir:		; La direccion en el buffer de pantalla: HL = 0x4000 + fila*24 + columna, con el *24 hecho a mano (x3 y tres veces x2)
	push de			;c541
	ld a,l			;c542
	ld l,h			;c543
	ld h,000h		;c544
	ld d,h			;c546
	ld e,l			;c547
	add hl,hl			;c548
	add hl,de			;c549
	add hl,hl			;c54a
	add hl,hl			;c54b
	add hl,hl			;c54c
	ld e,a			;c54d
	ld d,040h		;c54e
	add hl,de			;c550
	pop de			;c551
	ret			;c552
pinta_glifo:		; Estampa en el buffer el glifo A de la fuente de 0xCA93 (16 B por glifo, 8 filas de mascara y dibujo) en la posicion HL, con el desplazamiento fino parcheando los `jr` de 0xC58E y 0xC5B3
	push hl			;c553
	ld h,000h		;c554
	ld l,a			;c556
	add hl,hl			;c557
	add hl,hl			;c558
	add hl,hl			;c559
	add hl,hl			;c55a
	ld de,0ca93h		;c55b
	add hl,de			;c55e
	ex de,hl			;c55f
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
	srl l		;c575
	srl l		;c577
	srl l		;c579
	call buffer_dir		;c57b
L_C57E:
	ld a,h			;c57e
	cp 050h		;c57f
	jr c,L_C587		;c581
	inc de			;c583
	inc de			;c584
	jr L_C5D2		;c585
L_C587:
	push hl			;c587
	ld a,(de)			;c588
	ld h,0ffh		;c589
	ld l,a			;c58b
	inc de			;c58c
	scf			;c58d
L_C58E:
	jr L_C58E		;c58e
atajo_mascara16:		; Desplazamiento de ocho de la mascara de 16 bits: H = L, L = 0xFF. El gemelo de atajo_mascara24 sin la parte de A
	ld h,l			;c590
	ld l,0ffh		;c591
	jp L_C5A4		;c593
tira_mascara16:		; La tira de la mascara de 16 bits: siete `adc hl,hl`, sin A porque el relleno de unos ya viene en H
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
	and (hl)			;c5a7
	ld (hl),a			;c5a8
	inc hl			;c5a9
	ld a,c			;c5aa
	and (hl)			;c5ab
	ld (hl),a			;c5ac
	push hl			;c5ad
	xor a			;c5ae
	ld h,a			;c5af
	ld a,(de)			;c5b0
	inc de			;c5b1
	ld l,a			;c5b2
L_C5B3:
	jr L_C5B3		;c5b3
atajo_dibujo16:		; Desplazamiento de ocho del dibujo de 16 bits: H = L, L = 0x00
	ld h,l			;c5b5
	ld l,000h		;c5b6
	jp L_C5C9		;c5b8
tira_dibujo16:		; La tira del dibujo de 16 bits, los siete peldanos: tres de ellos figuraban como relleno porque el punto medido (0xC5C1) caia en el cuarto
	adc hl,hl		;c5bb
	adc hl,hl		;c5bd
	adc hl,hl		;c5bf
	adc hl,hl		;c5c1
	adc hl,hl		;c5c3
	adc hl,hl		;c5c5
	adc hl,hl		;c5c7
L_C5C9:
	ld a,l			;c5c9
	ld c,h			;c5ca
	pop hl			;c5cb
	or (hl)			;c5cc
	ld (hl),a			;c5cd
	dec hl			;c5ce
	ld a,c			;c5cf
	or (hl)			;c5d0
	ld (hl),a			;c5d1
L_C5D2:
	ld a,l			;c5d2
	add a,018h		;c5d3
	ld l,a			;c5d5
	jr nc,L_C5E0		;c5d6
	inc h			;c5d8
	ld a,h			;c5d9
	cp 058h		;c5da
	jr nz,L_C5E0		;c5dc
	ld h,040h		;c5de
L_C5E0:
	djnz L_C57E		;c5e0
	ret			;c5e2
siembra_particulas:		; Siembra las 64 particulas de la muerte de la nave, centradas en su posicion (0xC184); tablas 0x5B32/0x5BB2
	ld de,05bb2h		;c5e3
	ld b,040h		;c5e6
	ex de,hl			;c5e8
L_C5E9:
	ld (hl),e			;c5e9
	inc hl			;c5ea
	ld (hl),d			;c5eb
	inc hl			;c5ec
	djnz L_C5E9		;c5ed
	call sonido_reset		;c5ef
	ld a,080h		;c5f2
	ld de,0eb00h		;c5f4
	call arranca_guion		;c5f7
	inc a			;c5fa
	ld de,0eb12h		;c5fb
	call arranca_guion		;c5fe
	ld a,002h		;c601
	ld de,0eb21h		;c603
	call arranca_guion		;c606
	jp sonido_off		;c609
mueve_particulas:		; Mueve y pinta las 64 particulas CON GRAVEDAD (inc d cada cuadro): pixeles sueltos con or (hl) sobre el buffer; las que salen se aparcan en 0xFF00
	ld hl,05bb2h		;c60c
	ld iy,003e8h		;c60f
	ld ix,05b32h		;c613
	ld b,040h		;c617
L_C619:
	push bc			;c619
	push hl			;c61a
	ld e,(hl)			;c61b
	inc hl			;c61c
	ld d,(hl)			;c61d
	ld a,d			;c61e
	inc a			;c61f
	or e			;c620
	jr z,L_C66D		;c621
	dec d			;c623
	ex de,hl			;c624
	ld e,(ix+000h)		;c625
	ld d,(ix+001h)		;c628
	inc d			;c62b
	ld (ix+001h),d		;c62c
	add hl,de			;c62f
	ld a,h			;c630
	cp 0a0h		;c631
	jr nc,L_C63A		;c633
	ld a,l			;c635
	cp 0c0h		;c636
	jr c,L_C63D		;c638
L_C63A:
	ld hl,0ff00h		;c63a
L_C63D:
	ex de,hl			;c63d
	pop hl			;c63e
	ld (hl),e			;c63f
	inc hl			;c640
	ld (hl),d			;c641
	dec hl			;c642
	push hl			;c643
	ex de,hl			;c644
	ld a,l			;c645
	srl l		;c646
	srl l		;c648
	srl l		;c64a
	and 007h		;c64c
	ld b,a			;c64e
	inc b			;c64f
	call buffer_dir		;c650
	xor a			;c653
	scf			;c654
L_C655:
	rra			;c655
	djnz L_C655		;c656
	ld b,004h		;c658
L_C65A:
	ld a,(iy+000h)		;c65a
	inc iy		;c65d
	and 03ch		;c65f
	or (hl)			;c661
	ld (hl),a			;c662
	and 018h		;c663
	out (0feh),a		;c665   ; FOSIL DEL SPECTRUM: 0xFE es el puerto del borde del Spectrum; alli cada particula hacia parpadear el borde, en MSX este out no hace nada
	ld de,00018h		;c667
	add hl,de			;c66a
	djnz L_C65A		;c66b
L_C66D:
	pop hl			;c66d
	inc hl			;c66e
	inc hl			;c66f
	inc ix		;c670
	inc ix		;c672
	pop bc			;c674
	djnz L_C619		;c675
	ret			;c677
baja_tile_especial:		; Da de baja una entrada de la tabla de tiles especiales: resta uno al contador, compacta con un `ldir` de (B-1)*8 bytes y retrocede IX ocho para que el recorrido no se salte la entrada que ocupa el hueco. El `dec b / ret z` de 0xC67F es lo que evita el `ldir` de 65536 bytes cuando la que se va es la ultima
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
	push ix		;c688
	pop hl			;c68a
	push hl			;c68b
	ld de,00008h		;c68c
	add hl,de			;c68f
	pop de			;c690
	cpl			;c691
	push de			;c692
	ldir		;c693
	pop hl			;c695
	ld de,00008h		;c696
	sbc hl,de		;c699
	push hl			;c69b
	pop ix		;c69c
	ret			;c69e
pinta_rejilla:		; Estampa en el buffer las 25 celdas de la rejilla de 0xC920, tres bytes por 24 filas cada una, con tres dibujos segun el valor: el 1 alterna dos bytes, el 2 saca ocho filas de la fuente de 0xCA84 y del 3 en adelante lee 0x69A8 + (celda-3)*72, que es la tabla de los centinelas. No la llama nadie: se entra por el `jp` de 0xD8A0
	ld a,h			;c69f
	sub 020h		;c6a0
	ld h,a			;c6a2
	ld a,000h		;c6a3
	adc a,d			;c6a5
	ld d,a			;c6a6
	call buffer_dir		;c6a7
	ld a,d			;c6aa
	and a			;c6ab
	jr z,L_C6B2		;c6ac
	ld a,h			;c6ae
	add a,018h		;c6af
	ld h,a			;c6b1
L_C6B2:
	exx			;c6b2
	ld a,06fh		;c6b3
	ex af,af'			;c6b5
	ld c,005h		;c6b6
L_C6B8:
	ld b,005h		;c6b8
L_C6BA:
	ld a,(ix+000h)		;c6ba
	inc ix		;c6bd
	and a			;c6bf
	exx			;c6c0
	jp z,L_C705		;c6c1
	cp 003h		;c6c4
	jp nc,L_C754		;c6c6
	dec a			;c6c9
	jp z,L_C724		;c6ca
	push hl			;c6cd
	ld de,000c0h		;c6ce
	add hl,de			;c6d1
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
	ld a,(de)			;c6e8
	ld (hl),a			;c6e9
	inc hl			;c6ea
	ld (hl),a			;c6eb
	inc hl			;c6ec
	ld (hl),a			;c6ed
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
	add hl,de			;c70f
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
	add hl,de			;c733
	ld a,050h		;c734
	cp h			;c736
	jr nc,L_C740		;c737
	ld a,06fh		;c739
	cp h			;c73b
	jr nc,L_C741		;c73c
	ld h,040h		;c73e
L_C740:
	ld (hl),c			;c740
L_C741:
	add hl,de			;c741
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
	add hl,hl			;c75d
	add hl,de			;c75e
	ld d,h			;c75f
	ld e,l			;c760
	add hl,hl			;c761
	add hl,de			;c762
	add hl,hl			;c763
	add hl,hl			;c764
	add hl,hl			;c765
	ld de,069a8h		;c766
	add hl,de			;c769
	pop de			;c76a
	ld bc,018ffh		;c76b
L_C76E:
	ld a,d			;c76e
	cp 04fh		;c76f
	jr c,L_C77A		;c771
	inc hl			;c773
	inc hl			;c774
	inc hl			;c775
	ld a,018h		;c776
	jr L_C782		;c778
L_C77A:
	ldi		;c77a   ; El decorado que se pinta DESPUES de los sprites (los pilares del pozo 0x69F0-0x6BE7): por esto la nave pasa por detras de los pilares
	ldi		;c77c
	ldi		;c77e
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
gira_rumbo:		; Acerca el rumbo actual (bits 0-2) al pedido (bits 5-7) un octavo por vez y por el lado corto, con los bits 3-4 haciendo de espera para que el giro no sea instantaneo
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
	or 008h		;c7a4
	ret			;c7a6
L_C7A7:
	cp 005h		;c7a7
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
	cp 010h		;c7bb
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
rumbo_a_mascara:		; Traduce el rumbo A a su mascara de movimiento por la tabla de 0xC9A4
	ld de,0c9a4h		;c7cd
	jp L_C7D6		;c7d0
rumbo_a_mascara2:		; Lo mismo por la tabla de 0xC9AC, la otra de las dos que hay
	ld de,0c9ach		;c7d3
L_C7D6:
	ld l,a			;c7d6
	ld h,000h		;c7d7
	add hl,de			;c7d9
	ld a,(hl)			;c7da
	ret			;c7db
aplica_rumbo:		; Mueve la posicion HL segun la mascara de rumbo que saca de la tabla 0xC9A4: bit 0 suma B a la fila y bit 1 la resta, bits 2 y 3 hacen lo mismo con la columna y C. Es el mismo esquema que el aplica_rumbo de la fase de a pie
	push hl			;c7dc
	call rumbo_a_mascara		;c7dd
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
	neg		;c7ed
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
	neg		;c7f9
	ld e,a			;c7fb
L_C7FC:
	ld a,h			;c7fc
	add a,d			;c7fd
	ld h,a			;c7fe
	ld a,l			;c7ff
	add a,e			;c800
	ld l,a			;c801
	ret			;c802
rumbo_hacia:		; La mascara de rumbo de (B,C) hacia (D,E): bit 1 arriba y bit 2 abajo, bit 3 izquierda y bit 4 derecha, y cada componente solo cuenta si dos veces y media ella misma llega a la otra
	ld a,b			;c803
	sub d			;c804
	jr c,L_C80C		;c805
	ld h,002h		;c807
	jp L_C810		;c809
L_C80C:
	ld h,001h		;c80c
	neg		;c80e
L_C810:
	ld d,a			;c810
	ld a,c			;c811
	sub e			;c812
	jr c,L_C81A		;c813
	ld l,008h		;c815
	jp L_C81E		;c817
L_C81A:
	ld l,004h		;c81a
	neg		;c81c
L_C81E:
	ld e,a			;c81e
	ld b,a			;c81f
	srl b		;c820
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
	srl b		;c830
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
azar:		; El generador de azar: identico al de la segunda parte (lee la ROM del BIOS como tabla de entropia), semilla en 0xCA8F sembrada con ld a,r en el arranque
	push hl			;c83f
	ld hl,(0ca8fh)		;c840
	ld a,h			;c843
	and 01fh		;c844
	or 020h		;c846
	ld h,a			;c848
	ld a,000h		;c849
	xor (hl)			;c84b
	inc hl			;c84c
	xor (hl)			;c84d
	inc hl			;c84e
	xor (hl)			;c84f
	inc hl			;c850
	add a,h			;c851
	sub l			;c852
	ld (0ca8fh),hl		;c853
	pop hl			;c856
	ret			;c857
borra_buffer:		; Borra los 3840 bytes del buffer con la PILA: SP al final (0x4F00) y 80 vueltas de 24 `push de` con DE=0, que son 3840 bytes justos. Salva SP en HL y va con las interrupciones cortadas, porque mientras tanto no hay pila
	di			;c858
	ld hl,00000h		;c859
	add hl,sp			;c85c
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
	ld sp,hl			;c87f
	ei			;c880
	ret			;c881
alta_bandada:		; Mete un objeto en la tabla de 0xC97B (contador 0xC97A, tope 4, entradas de 5 B) con rumbo inicial 0x14 y el A' de entrada como RETARDO en (ix+004): si es cero suena 0xEB42 al nacer y, si no, el sonido lo dispara mueve_bandada cuando la cuenta se agota. Vuelve con carry si ha entrado
	ld hl,0c97ah		;c882
	ld a,(hl)			;c885
	cp 004h		;c886
	ret nc			;c888
	inc (hl)			;c889
	ld h,000h		;c88a
	ld l,a			;c88c
	ld d,h			;c88d
	ld e,l			;c88e
	add hl,hl			;c88f
	add hl,hl			;c890
	add hl,de			;c891
	ld de,0c97bh		;c892
	add hl,de			;c895
	ld (hl),c			;c896
	inc hl			;c897
	ld (hl),b			;c898
	inc hl			;c899
	ld (hl),014h		;c89a
	inc hl			;c89c
	ld (hl),000h		;c89d
	inc hl			;c89f
	ex af,af'			;c8a0
	ld (hl),a			;c8a1
	and a			;c8a2
	scf			;c8a3
	ret nz			;c8a4
	ld de,0eb42h		;c8a5
	call arranca_guion_libre		;c8a8
	scf			;c8ab
	ret			;c8ac
alta_disparo:		; Mete un disparo en la tabla de 0xC999 (contador en 0xC998, entradas de 5 B) si no hay ya dos en el aire, y arranca el sonido 0xEA81 en el canal 1. Vuelve con carry si ha salido
	ld hl,0c998h		;c8ad
	ld a,(hl)			;c8b0
	cp 002h		;c8b1
	ret nc			;c8b3
	inc (hl)			;c8b4
	ld h,000h		;c8b5
	ld l,a			;c8b7
	ld d,h			;c8b8
	ld e,l			;c8b9
	add hl,hl			;c8ba
	add hl,hl			;c8bb
	add hl,de			;c8bc
	ld de,0c999h		;c8bd
	add hl,de			;c8c0
	ld (hl),000h		;c8c1
	inc hl			;c8c3
	ex af,af'			;c8c4
	ld (hl),a			;c8c5
	inc hl			;c8c6
	ld (hl),c			;c8c7
	inc hl			;c8c8
	ld (hl),b			;c8c9
	inc hl			;c8ca
	ld (hl),000h		;c8cb
	ld a,001h		;c8cd
	ld de,0ea81h		;c8cf
	call arranca_guion_libre		;c8d2
	scf			;c8d5
	ret			;c8d6

; ----------------------------------------------------------------------
; DATOS instalaciones_de_la_zona: Instalaciones de la zona (73 B): el contador
;   en 0xC8D7 y NUEVE entradas de 8 bytes desde 0xC8D8, las que crea el
;   constructor del nivel y gobierna recorre_instalaciones
;   0xc8d7..0xc920  (73 bytes)
DATA_instalaciones_de_la_zona:
	defb 000h	; c8d7
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c8d8  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c8e0  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c8e8  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c8f0  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c8f8  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c900  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c908  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c910  ........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; c918  ........

; ----------------------------------------------------------------------
; DATOS rejilla_de_la_zona: La rejilla 5x5 de la zona (25 B): un byte por
;   celda, que es a la vez el dibujo y el estado de lo que hay en ella
;   0xc920..0xc939  (25 bytes)
DATA_rejilla_de_la_zona:
	defb 0ffh,0ffh,0ffh,0ffh,0ffh	; c920
	defb 0ffh,0ffh,0ffh,0ffh,0ffh	; c925
	defb 0ffh,0ffh,0ffh,0ffh,0ffh	; c92a
	defb 0ffh,0ffh,0ffh,0ffh,0ffh	; c92f
	defb 0ffh,0ffh,0ffh,0ffh,0ffh	; c934

; ----------------------------------------------------------------------
; DATOS tiros_enemigos: Los tiros enemigos (25 B): contador en 0xC939 y seis
;   entradas de 4 bytes, el tope que comprueba alta_enemigo
;   0xc939..0xc952  (25 bytes)
DATA_tiros_enemigos:
	defb 000h	; c939
	defb 0ffh,0ffh,0ffh,0ffh	; c93a
	defb 0ffh,0ffh,0ffh,0ffh	; c93e
	defb 0ffh,0ffh,0ffh,0ffh	; c942
	defb 0ffh,0ffh,0ffh,0ffh	; c946
	defb 0ffh,0ffh,0ffh,0ffh	; c94a
	defb 0ffh,0ffh,0ffh,0ffh	; c94e

; ----------------------------------------------------------------------
; DATOS disparos_del_jugador: Los disparos del jugador (37 B): contador en
;   0xC952 y nueve entradas de 4 bytes, el tope que comprueba alta_objeto_c952
;   0xc952..0xc977  (37 bytes)
DATA_disparos_del_jugador:
	defb 000h	; c952
	defb 0ffh,0ffh,0ffh,0ffh	; c953
	defb 0ffh,0ffh,0ffh,0ffh	; c957
	defb 0ffh,0ffh,0ffh,0ffh	; c95b
	defb 0ffh,0ffh,0ffh,0ffh	; c95f
	defb 0ffh,0ffh,0ffh,0ffh	; c963
	defb 0ffh,0ffh,0ffh,0ffh	; c967
	defb 0ffh,0ffh,0ffh,0ffh	; c96b
	defb 0ffh,0ffh,0ffh,0ffh	; c96f
	defb 0ffh,0ffh,0ffh,0ffh	; c973

; ----------------------------------------------------------------------
; DATOS variables_de_mueve_tabla: Las dos variables de mueve_tabla (3 B): en
;   0xC977 la direccion en la que acaba la tabla que esta recorriendo y en
;   0xC979 cual es (4 la del jugador, 5 la enemiga)
;   0xc977..0xc97a  (3 bytes)
DATA_variables_de_mueve_tabla:
	defb 000h,000h,000h	; c977

; ----------------------------------------------------------------------
; DATOS tabla_del_alta_C882: La tabla del alta de 0xC882 (21 B): contador y
;   cuatro entradas de 5 bytes
;   0xc97a..0xc98f  (21 bytes)
DATA_tabla_del_alta_C882:
	defb 000h	; c97a
	defb 0ffh,0ffh,0ffh,0ffh,0ffh	; c97b
	defb 0ffh,0ffh,0ffh,0ffh,0ffh	; c980
	defb 0ffh,0ffh,0ffh,0ffh,0ffh	; c985
	defb 0ffh,0ffh,0ffh,0ffh,0ffh	; c98a

; ----------------------------------------------------------------------
; DATOS tabla_de_alta_objeto_C990: La tabla de alta_objeto_c990 (9 B):
;   contador y dos entradas de 4 bytes
;   0xc98f..0xc998  (9 bytes)
DATA_tabla_de_alta_objeto_C990:
	defb 000h	; c98f
	defb 0ffh,0ffh,0ffh,0ffh	; c990
	defb 0ffh,0ffh,0ffh,0ffh	; c994

; ----------------------------------------------------------------------
; DATOS tabla_que_compacta_DFB1: La tabla que compacta 0xDFB1 (11 B): contador
;   y dos entradas de 5 bytes
;   0xc998..0xc9a3  (11 bytes)
DATA_tabla_que_compacta_DFB1:
	defb 000h	; c998
	defb 0ffh,0ffh,0ffh,0ffh,0ffh	; c999
	defb 0ffh,0ffh,0ffh,0ffh,0ffh	; c99e

; ----------------------------------------------------------------------
; DATOS variables_y_area_de_trabajo: Variables y area de trabajo (188 B); en
;   0xC9A3 el fotograma de la nave en los cinco bits bajos y su rumbo en los
;   tres altos
;   0xc9a3..0xca5f  (188 bytes)
DATA_variables_y_area_de_trabajo:
	defb 000h,002h,006h,004h,005h,001h,009h,008h,00ah,0ffh,004h,000h,0ffh,002h,003h,001h	; c9a3  ................
	defb 002h,006h,005h,007h,006h,0ffh,004h,000h,0ffh,000h,000h,00ah,000h,000h,000h,000h	; c9b3  ................
	defb 001h,000h,000h,003h,002h,005h,002h,006h,000h,000h,001h,000h,000h,000h,000h,006h	; c9c3  ................
	defb 000h,000h,006h,002h,005h,002h,006h,000h,000h,001h,000h,000h,000h,000h,004h,000h	; c9d3  ................
	defb 000h,000h,000h,001h,000h,000h,000h,000h,006h,000h,000h,000h,005h,002h,002h,00ah	; c9e3  ................
	defb 000h,001h,000h,000h,001h,000h,001h,000h,000h,001h,000h,006h,002h,002h,006h,000h	; c9f3  ................
	defb 000h,000h,000h,000h,004h,000h,000h,000h,005h,001h,000h,000h,000h,001h,00ah,000h	; ca03  ................
	defb 000h,000h,00ah,001h,000h,000h,000h,001h,006h,002h,006h,002h,006h,000h,000h,00ah	; ca13  ................
	defb 000h,000h,000h,000h,001h,000h,000h,003h,000h,005h,000h,00ah,001h,000h,001h,000h	; ca23  ................
	defb 001h,006h,002h,006h,002h,006h,006h,002h,00ah,002h,006h,000h,000h,001h,000h,000h	; ca33  ................
	defb 000h,000h,005h,000h,000h,000h,000h,001h,000h,000h,006h,002h,006h,002h,006h,00ah	; ca43  ................
	defb 000h,00ah,000h,00ah,001h,000h,001h,000h,001h,005h,002h,006h	; ca53  ............

; ----------------------------------------------------------------------
; DATOS datos_muertos_CA5F: Datos muertos: residuo de la grabacion (37 B).
;   Tienen estructura -valores pequenos, 0 a 10, con pinta de variables- pero
;   NADIE los toca: sin referencias directas ni punteros en el binario, y
;   medido con watchpoints de lectura Y escritura sobre la partida COMPLETA de
;   38 minutos (las siete zonas y la multicarga) mas 350 s de otra partida:
;   cero disparos (tools/omsx_f972.tcl con STARDUST_INI/FIN_R, dump/ca5f y
;   dump/ca5f_araubi). Que fueron antes de morir no se sabe
;   0xca5f..0xca84  (37 bytes)
DATA_datos_muertos_CA5F:
	defb 002h,004h,001h,000h,000h,000h,001h,006h,000h,000h,000h,006h,00ah,002h,006h,002h	; ca5f  ................
	defb 00ah,001h,000h,000h,000h,001h,00ah,000h,005h,000h,00ah,001h,000h,001h,000h,001h	; ca6f  ................
	defb 006h,002h,003h,002h,006h	; ca7f

; ----------------------------------------------------------------------
; DATOS variables_del_juego: Variables del juego (18 B), con nombre:
;   0xCA84-0xCA8B la fuente de 8 bytes del escritor de pantalla 0xC6E9
;   (patrones 00/FF/55/AA, cargada en 0xC6DC); 0xCA8C/8D variables del
;   subsistema de 0xD6xx (los tiles especiales); 0xCA8E variable del arranque
;   (0xBE2C); 0xCA8F/90 el PUNTERO-SEMILLA del generador de azar (ld
;   hl,(0ca8fh) en 0xC840, dentro del RNG L_C83F, el gemelo del 0xAD28 de a
;   pie); 0xCA91/92 variables de estado (0xCA92 la incrementa el alta de
;   objetos en 0xC0F5); 0xCA93-0xCA95 el arranque de la fuente del rotulador
;   0xC5A8 (cargada en 0xC55B)
;   0xca84..0xca96  (18 bytes)
DATA_variables_del_juego:
	defb 000h,0ffh,000h,055h,0aah,0ffh,0ffh,000h,000h,000h,000h,000h,000h,003h,000h,0c3h	; ca84  ...U............
	defb 03ch,081h	; ca94

; ----------------------------------------------------------------------
; DATOS tabla_CA96: Tabla (228 B; racha 14.03, entropia 1.41, 17 valores:
;   pocos valores para ser un dibujo)
;   0xca96..0xcb7a  (228 bytes)
DATA_tabla_CA96:
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
	defb 0ffh,0ffh,0ffh,0ffh	; cb76

; ======================================================================
; CODIGO 0xcb7a..0xd3ad  (2099 bytes)
; ======================================================================


recorre_tiles_especiales:		; Recorre las entradas de 0xCB3A, sube (ix+000) una por cuadro y salta a la rutina de (ix+003/004) con el `jp (hl)` de 0xCB99; al llegar (ix+000) a 0x60 la da de baja en vez de gobernarla
	ld a,(0ca92h)		;cb7a
	and a			;cb7d
	ret z			;cb7e
	ld ix,0cb3ah		;cb7f
	ld b,a			;cb83
L_CB84:
	push bc			;cb84
	inc (ix+000h)		;cb85
	ld a,(ix+000h)		;cb88
	cp 060h		;cb8b
	jr z,L_CB9A		;cb8d
	ld hl,lcb9dh		;cb8f
	push hl			;cb92
	ld l,(ix+003h)		;cb93
	ld h,(ix+004h)		;cb96
	jp (hl)			;cb99
L_CB9A:
	call baja_tile_especial		;cb9a
L_CB9D:
	ld de,00008h		;cb9d
	add ix,de		;cba0
	pop bc			;cba2
	djnz L_CB84		;cba3
	ret			;cba5
persigue_con_velocidad:		; Corrige la velocidad de BC hacia el objetivo DE un punto por eje, la mitad de las veces y saturada a mas menos cinco, aplica el movimiento y, si la columna se pasa de 0xB8, la repone e invierte el sentido. La usa mueve_disparos
	ld (0d3cdh),hl		;cba6
	call azar		;cba9
	and 001h		;cbac
	jr z,L_CBDC		;cbae
	ld a,h			;cbb0
	cp d			;cbb1
	ld a,b			;cbb2
	jr nc,L_CBBD		;cbb3
	add a,005h		;cbb5
	cp 00ah		;cbb7
	adc a,000h		;cbb9
	jr L_CBC3		;cbbb
L_CBBD:
	add a,005h		;cbbd
	cp 001h		;cbbf
	adc a,0ffh		;cbc1
L_CBC3:
	sub 005h		;cbc3
	ld b,a			;cbc5
	ld a,l			;cbc6
	cp e			;cbc7
	ld a,c			;cbc8
	jr nc,L_CBD3		;cbc9
	add a,005h		;cbcb
	cp 00ah		;cbcd
	adc a,000h		;cbcf
	jr L_CBD9		;cbd1
L_CBD3:
	add a,005h		;cbd3
	cp 001h		;cbd5
	adc a,0ffh		;cbd7
L_CBD9:
	sub 005h		;cbd9
	ld c,a			;cbdb
L_CBDC:
	add hl,bc			;cbdc
	ld a,l			;cbdd
	cp 0b8h		;cbde
	jr c,L_CBEA		;cbe0
	ld a,(0d3cdh)		;cbe2
	ld l,a			;cbe5
	ld a,c			;cbe6
	neg		;cbe7
	ld c,a			;cbe9
L_CBEA:
	ret			;cbea
recorre_las_dos_tablas:		; Mueve las dos tablas seguidas, parcheando antes la velocidad de cada una: 6 para la de 0xC93A (seis huecos) y 9 para la de 0xC953 (nueve)
	ld ix,lcc32h		;cbeb
	ld (ix+001h),006h		;cbef
	ld (ix+002h),006h		;cbf3
	ld ix,0c93ah		;cbf7
	ld hl,0c952h		;cbfb
	ld a,005h		;cbfe
	call mueve_tabla		;cc00
	ld ix,lcc32h		;cc03
	ld (ix+001h),009h		;cc07
	ld (ix+002h),009h		;cc0b
	ld ix,0c953h		;cc0f
	ld hl,0c977h		;cc13
	ld a,004h		;cc16
mueve_tabla:		; Recorre una tabla de objetos cualquiera -IX en la primera entrada, contador en (ix-001), entradas de 4 B-, les aplica el rumbo con el paso que le hayan parcheado en 0xCC32, los pinta con pinta_glifo y retira los que pasan de la fila 0xC0 o de la columna 0xBC
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
	cp 080h		;cc2e
	jr z,L_CC56		;cc30
L_CC32:
	ld bc,00707h		;cc32
	call aplica_rumbo		;cc35
	ld a,h			;cc38
	cp 0c0h		;cc39
	jr nc,L_CC56		;cc3b
	ld a,l			;cc3d
	cp 0bch		;cc3e
	jr nc,L_CC56		;cc40
	ld (ix+000h),l		;cc42
	ld (ix+001h),h		;cc45
	ld a,002h		;cc48
	call pinta_glifo		;cc4a
	ld de,00004h		;cc4d
	add ix,de		;cc50
L_CC52:
	pop bc			;cc52
	djnz L_CC24		;cc53
	ret			;cc55
L_CC56:
	ld a,(0c979h)		;cc56
	cp 005h		;cc59
	ld hl,0c939h		;cc5b
	jr z,L_CC63		;cc5e
	ld hl,0c952h		;cc60
L_CC63:
	dec (hl)			;cc63
	pop bc			;cc64
	push bc			;cc65
	ld a,b			;cc66
	cp 001h		;cc67
	jp z,L_CC52		;cc69
	push ix		;cc6c
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
	ex de,hl			;cc7c
	pop de			;cc7d
	ldir		;cc7e
	jp L_CC52		;cc80
alta_enemigo:		; Intenta meter un objeto en la tabla de 0xC939 (tope 6): solo lo hace si el azar supera (7 - zona)*16, que es como sube la dificultad, y suena 0xEA44 al nacer
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
	call azar		;cc92
	cp e			;cc95
	ccf			;cc96
	ret nc			;cc97
	ld e,006h		;cc98
	exx			;cc9a
	ld h,001h		;cc9b
	ld de,0ea44h		;cc9d
	jp alta_en_tabla		;cca0
alta_objeto_c952:		; Mete un objeto en la tabla de 0xC952 (tope 9) con el sonido 0xEA38, sin tirada de azar previa
	ld hl,0c952h		;cca3
	ld e,009h		;cca6
	exx			;cca8
	ld h,002h		;cca9
	ld de,0ea38h		;ccab
alta_en_tabla:		; El alta comun a las tres tablas: si el contador no ha llegado al tope, lo incrementa, arranca el sonido DE en el canal H y escribe C, B y A' en la entrada indice*4. Vuelve con carry si ha entrado
	exx			;ccae
	ld a,(hl)			;ccaf
	cp e			;ccb0
	ret nc			;ccb1
	exx			;ccb2
	push af			;ccb3
	ld a,h			;ccb4
	call arranca_guion_libre		;ccb5
	pop af			;ccb8
	exx			;ccb9
	inc (hl)			;ccba
	ld e,l			;ccbb
	ld d,h			;ccbc
	inc de			;ccbd
	ld h,000h		;ccbe
	ld l,a			;ccc0
	add hl,hl			;ccc1
	add hl,hl			;ccc2
	add hl,de			;ccc3
	ld (hl),c			;ccc4
	inc hl			;ccc5
	ld (hl),b			;ccc6
	inc hl			;ccc7
	ex af,af'			;ccc8
	ld (hl),a			;ccc9
	scf			;ccca
	ret			;cccb
persigue_a_cuadros:		; Lo mismo con reja de cuadros y saturacion a mas menos cuatro: corrige siempre en el cuadro 0 de cada 4 y la mitad de las veces en el 2. Al rebotar en 0xB0 rehace el movimiento entero desde la posicion guardada, no solo la columna
	ld (0d3cdh),hl		;cccc
	ld a,(0ca8eh)		;cccf
	and 003h		;ccd2
	jr z,L_CCE5		;ccd4
	cp 002h		;ccd6
	jr nz,L_CCE1		;ccd8
	call azar		;ccda
	and 001h		;ccdd
	jr z,L_CCE5		;ccdf
L_CCE1:
	add hl,bc			;cce1
	jp L_CD12		;cce2
L_CCE5:
	ld a,h			;cce5
	cp d			;cce6
	ld a,b			;cce7
	jr nc,L_CCF2		;cce8
	add a,004h		;ccea
	cp 008h		;ccec
	adc a,000h		;ccee
	jr L_CCF8		;ccf0
L_CCF2:
	add a,004h		;ccf2
	cp 001h		;ccf4
	adc a,0ffh		;ccf6
L_CCF8:
	sub 004h		;ccf8
	ld b,a			;ccfa
	ld a,l			;ccfb
	cp e			;ccfc
	ld a,c			;ccfd
	jr nc,L_CD08		;ccfe
	add a,004h		;cd00
	cp 008h		;cd02
	adc a,000h		;cd04
	jr L_CD0E		;cd06
L_CD08:
	add a,004h		;cd08
	cp 001h		;cd0a
	adc a,0ffh		;cd0c
L_CD0E:
	sub 004h		;cd0e
	ld c,a			;cd10
	add hl,bc			;cd11
L_CD12:
	ld a,l			;cd12
	cp 0b0h		;cd13
	jr c,L_CD1F		;cd15
	ld a,c			;cd17
	neg		;cd18
	ld c,a			;cd1a
	ld hl,(0d3cdh)		;cd1b
	add hl,bc			;cd1e
L_CD1F:
	ret			;cd1f
alta_objeto_c990:		; Mete un objeto en la tabla de 0xC990 (contador 0xC98F, tope 2, entradas de 4 B) con el rumbo sacado del azar, y solo suena 0xEB42 si el A' de entrada era cero
	ld hl,0c98fh		;cd20
	ld a,(hl)			;cd23
	cp 002h		;cd24
	ret nc			;cd26
	inc (hl)			;cd27
	ld h,000h		;cd28
	ld l,a			;cd2a
	add hl,hl			;cd2b
	add hl,hl			;cd2c
	ld de,0c990h		;cd2d
	add hl,de			;cd30
	ld (hl),000h		;cd31
	inc hl			;cd33
	ex af,af'			;cd34
	ld d,a			;cd35
	add a,004h		;cd36
	ld e,a			;cd38
	call azar		;cd39
	and 0c0h		;cd3c
	or e			;cd3e
	sub 004h		;cd3f
	ld (hl),a			;cd41
	inc hl			;cd42
	ld (hl),c			;cd43
	inc hl			;cd44
	ld (hl),b			;cd45
	ld a,d			;cd46
	and a			;cd47
	scf			;cd48
	ret nz			;cd49
	ld de,0eb42h		;cd4a
	call arranca_guion_libre		;cd4d
	scf			;cd50
	ret			;cd51
pinta_figura32:		; Pinta una figura de 32x32 con cuatro sprites consecutivos: A en HL, A+1 a 16 pixeles a la derecha, A+2 dieciseis filas abajo y A+3 en la esquina
	push hl			;cd52
	push af			;cd53
	call pinta_sprite		;cd54
	ld bc,00010h		;cd57
	pop af			;cd5a
	inc a			;cd5b
	pop hl			;cd5c
	push hl			;cd5d
	add hl,bc			;cd5e
	push af			;cd5f
	call pinta_sprite		;cd60
	ld bc,01000h		;cd63
	pop af			;cd66
	inc a			;cd67
	pop hl			;cd68
	push hl			;cd69
	add hl,bc			;cd6a
	push af			;cd6b
	call pinta_sprite		;cd6c
	ld bc,01010h		;cd6f
	pop af			;cd72
	inc a			;cd73
	pop hl			;cd74
	add hl,bc			;cd75
	call pinta_sprite		;cd76
	ret			;cd79
solapa_eje:		; Solapamiento en UN eje: BC corrige las dos coordenadas (H y L), D y E son los dos tamanos, y vuelve con carry si NO se tocan. Se llama dos veces, una por eje
	add hl,bc			;cd7a
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
mueve_objetos:		; Recorre la tabla de 0xC990 (contador en 0xC98F, entradas de 4 B): mueve cada objeto hacia la nave, lo pinta, y al chocar lo pasa al estado 0x80 -la explosion, sprites 0x1D a 0x20- tras el cual lo borra compactando la tabla con un ldir
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
	cp 080h		;cd9e
	jr nz,L_CDB6		;cda0
	ld a,(ix+001h)		;cda2
	call pinta_sprite		;cda5
	inc (ix+001h)		;cda8
	ld a,(ix+001h)		;cdab
	cp 021h		;cdae
	jp c,L_CE46		;cdb0
	jp L_CE51		;cdb3
L_CDB6:
	ld de,(0c184h)		;cdb6
	ld a,b			;cdba
	add a,004h		;cdbb
	and 03fh		;cdbd
	cp 014h		;cdbf
	jr c,L_CDD2		;cdc1
	jr nz,L_CDCC		;cdc3
	xor a			;cdc5
	ld de,0eb42h		;cdc6
	call arranca_guion_libre		;cdc9
L_CDCC:
	dec (ix+001h)		;cdcc
	jp L_CE46		;cdcf
L_CDD2:
	cp 008h		;cdd2
	jr c,L_CDD8		;cdd4
	sub 002h		;cdd6
L_CDD8:
	sub 004h		;cdd8
	ld b,a			;cdda
	call persigue_a_cuadros		;cddb
	ld a,h			;cdde
	cp 0e0h		;cddf
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
	call azar		;cdfd
	and 01fh		;ce00
	jr nz,L_CE18		;ce02
	push hl			;ce04
	ld bc,00404h		;ce05
	add hl,bc			;ce08
	ld b,h			;ce09
	ld c,l			;ce0a
	push bc			;ce0b
	call rumbo_hacia		;ce0c
	call rumbo_a_mascara2		;ce0f
	ex af,af'			;ce12
	pop bc			;ce13
	call alta_enemigo		;ce14
	pop hl			;ce17
L_CE18:
	ld a,(ix+001h)		;ce18
	add a,004h		;ce1b
	and 0c0h		;ce1d
	rlca			;ce1f
	rlca			;ce20
	add a,04fh		;ce21
	call pinta_sprite		;ce23
	call disparo_derriba_objeto		;ce26
	ld a,(0c188h)		;ce29
	cp 004h		;ce2c
	jr nc,L_CE46		;ce2e
	ld l,(ix+002h)		;ce30
	ld h,(ix+003h)		;ce33
	call choca_con_nave2		;ce36
	jr c,L_CE46		;ce39
	ld (ix+000h),080h		;ce3b
	ld (ix+001h),01dh		;ce3f
	call mata_nave		;ce43
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
	dec (hl)			;ce54
	pop bc			;ce55
	push bc			;ce56
	ld a,b			;ce57
	cp 001h		;ce58
	jr z,L_CE4B		;ce5a
	push ix		;ce5c
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
	ex de,hl			;ce6c
	pop de			;ce6d
	ldir		;ce6e
	jp L_CE4B		;ce70
tile_45:		; El tile 0x45 suelta al perseguidor: cuando su fila llega a 0x2D, no hay perseguidor (0xD3C5 a cero) y la zona ya no tiene instalaciones (0xCA91 en 0x80), monta sus dos mitades en 0xD3C7, pone los 16 cuadros de aparicion en 0xD3C6 y arranca el sonido 0xED55
	call impacto_objeto		;ce73
	ld a,(ix+000h)		;ce76
	cp 02dh		;ce79
	ret c			;ce7b
	ld a,(0d3c5h)		;ce7c
	and a			;ce7f
	ret nz			;ce80
	ld a,(0ca91h)		;ce81
	cp 080h		;ce84
	ret nz			;ce86
	ld iy,0d3c7h		;ce87
	ld a,(ix+000h)		;ce8b
	add a,a			;ce8e
	add a,008h		;ce8f
	ld h,a			;ce91
	ld a,(ix+001h)		;ce92
	ld l,a			;ce95
	add a,a			;ce96
	add a,010h		;ce97
	ld (0d3c5h),a		;ce99
	ld (iy+000h),l		;ce9c
	ld (iy+001h),h		;ce9f
	ld (iy+002h),0f9h		;cea2
	ld (iy+003h),l		;cea6
	ld (iy+004h),h		;cea9
	ld (iy+005h),0f2h		;ceac
	ld a,010h		;ceb0
	ld (0d3c6h),a		;ceb2
	xor a			;ceb5
	ld de,0ed55h		;ceb6
	jp arranca_guion_libre		;ceb9
aparece_perseguidor:		; Los 16 cuadros de la aparicion: pinta dos parejas de sprites (0x19/0x1A y 0x1B/0x1C) reflejadas respecto a 0xD3C5, subiendolas 4 y 3 filas por cuadro; al agotarse el contador pone 0xD3C5 a 1 -ya vuela-, le da tres impactos de vida y suena 0xEA98
	ld a,(0d3c5h)		;cebc
	cp 00ah		;cebf
	ret c			;cec1
	ld iy,0d3c7h		;cec2
	ld l,(iy+000h)		;cec6
	ld h,(iy+001h)		;cec9
	ld bc,01901h		;cecc
	ld d,0fch		;cecf
	ld e,(iy+002h)		;ced1
	call pinta_pareja		;ced4
	ld (iy+000h),l		;ced7
	ld (iy+001h),h		;ceda
	ld (iy+002h),e		;cedd
	ld l,(iy+003h)		;cee0
	ld h,(iy+004h)		;cee3
	ld bc,01b02h		;cee6
	ld d,0fdh		;cee9
	ld e,(iy+005h)		;ceeb
	call pinta_pareja		;ceee
	ld (iy+003h),l		;cef1
	ld (iy+004h),h		;cef4
	ld (iy+005h),e		;cef7
	ld hl,0d3c6h		;cefa
	dec (hl)			;cefd
	ret nz			;cefe
	ld a,001h		;ceff
	ld (0d3c5h),a		;cf01
	xor a			;cf04
	ld (0d3c9h),a		;cf05
	ld a,003h		;cf08
	ld (0d3cah),a		;cf0a
	xor a			;cf0d
	ld de,0ea98h		;cf0e
	jp arranca_guion_libre		;cf11
pinta_pareja:		; Pinta el sprite B en HL y el B+1 en la posicion reflejada respecto a 0xD3C5, y avanza la posicion con DE y el paso con C: las dos mitades de una figura simetrica
	push de			;cf14
	push hl			;cf15
	push bc			;cf16
	ld a,b			;cf17
	call pinta_sprite		;cf18
	pop bc			;cf1b
	pop hl			;cf1c
	push hl			;cf1d
	push bc			;cf1e
	ld a,(0d3c5h)		;cf1f
	sub l			;cf22
	ld l,a			;cf23
	ld a,b			;cf24
	inc a			;cf25
	call pinta_sprite		;cf26
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
mueve_perseguidor:		; Con el estado de 0xD3C5 en 1, apunta la posicion de 0xD3C7 hacia la nave con rumbo_hacia y la mueve de dos en dos
	ld a,(0d3c5h)		;cf36
	cp 005h		;cf39
	jr nc,L_CF85		;cf3b
	cp 001h		;cf3d
	ret nz			;cf3f
	ld hl,(0d3c7h)		;cf40
	ld bc,00808h		;cf43
	add hl,bc			;cf46
	ld b,h			;cf47
	ld c,l			;cf48
	ld de,(0c184h)		;cf49
	call rumbo_hacia		;cf4d
	call rumbo_a_mascara2		;cf50
	ld hl,(0d3c7h)		;cf53
	ld bc,00202h		;cf56
	call aplica_rumbo		;cf59
	ld a,l			;cf5c
	cp 0a0h		;cf5d
	jr c,L_CF65		;cf5f
	ld a,(0d3c7h)		;cf61
	ld l,a			;cf64
L_CF65:
	ld (0d3c7h),hl		;cf65
	call azar		;cf68
	and 03fh		;cf6b
	jr nz,L_CF7D		;cf6d
	ld bc,00c0ch		;cf6f
	add hl,bc			;cf72
	ld b,h			;cf73
	ld c,l			;cf74
	xor a			;cf75
	ex af,af'			;cf76
	call alta_disparo		;cf77
	ld hl,(0d3c7h)		;cf7a
L_CF7D:
	ld a,019h		;cf7d
	call pinta_figura32		;cf7f
	jp L_D25E		;cf82
L_CF85:
	cp 00ah		;cf85
	ret nc			;cf87
	inc a			;cf88
	cp 00ah		;cf89
	jr z,L_CF9C		;cf8b
	ld (0d3c5h),a		;cf8d
	sub 006h		;cf90
	add a,a			;cf92
	add a,a			;cf93
	add a,03bh		;cf94
	ld hl,(0d3c7h)		;cf96
	jp pinta_figura32		;cf99
L_CF9C:
	xor a			;cf9c
	ld (0d3c5h),a		;cf9d
	ret			;cfa0
disparo_derriba_bandada:		; Mira si un disparo del jugador ha tocado al enemigo de IX -posicion en (ix+000/001), caja 4x0x0C-: lo pasa a explosion (0xFF/0x1D en (ix+002/003)), marca el disparo con 0x80, suena 0xEA52 y paga 130 puntos
	ld l,(ix+000h)		;cfa1
	ld h,(ix+001h)		;cfa4
	ld iy,0c953h		;cfa7
	ld de,0040ch		;cfab
	ld bc,00202h		;cfae
	call choca_con_tabla		;cfb1
	ret c			;cfb4
	xor a			;cfb5
	ld de,0ea52h		;cfb6
	call arranca_guion_libre		;cfb9
	ld (ix+002h),0ffh		;cfbc
	ld (ix+003h),01dh		;cfc0
	ld (iy+002h),080h		;cfc4
	ld hl,0dd84h		;cfc8
	ld b,00dh		;cfcb
	call premia		;cfcd
	ret			;cfd0
choca_con_tabla:		; Busca contacto entre HL y toda una tabla de objetos: IY apunta a la primera entrada y (iy-1) es el contador, entradas de 4 B, dos solapa_eje por objeto. Vuelve con carry si no choco con ninguno, y si choco deja IY en el culpable
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
	call solapa_eje		;cfde
	pop hl			;cfe1
	jr c,L_CFEE		;cfe2
	push hl			;cfe4
	ld l,h			;cfe5
	ld h,(iy+001h)		;cfe6
	call solapa_eje		;cfe9
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
choca_y_revienta:		; Contacto del objeto de IX contra la tabla de 0xC953: al chocar marca al otro con el 0x80 de la explosion, suena 0xEA52, mete al de IX en el estado 0xD933, escribe 0x0C por el puntero de (ix+005/006), se salta la vuelta con `pop hl` y premia 160 puntos
	ld a,(ix+000h)		;cff9
	add a,a			;cffc
	add a,a			;cffd
	add a,a			;cffe
	ld l,a			;cfff
	ld h,(ix+007h)		;d000
	ld de,00414h		;d003
	ld bc,00202h		;d006
	ld iy,0c953h		;d009
	call choca_con_tabla		;d00d
	ret c			;d010
	ld (iy+002h),080h		;d011
	xor a			;d015
	ld de,0ea52h		;d016
	call arranca_guion_libre		;d019
	ld hl,0d933h		;d01c
	ld (ix+003h),l		;d01f
	ld (ix+004h),h		;d022
	ld l,(ix+005h)		;d025
	ld h,(ix+006h)		;d028
	ld (hl),00ch		;d02b
	pop hl			;d02d
	ld hl,0dd84h		;d02e
	ld b,010h		;d031
	call premia		;d033
	ret			;d036
disparo_derriba_objeto:		; Lo mismo para los objetos de la tabla 0xC990, con la posicion en (ix+002/003): explosion en (ix+000/001) y 140 puntos
	ld l,(ix+002h)		;d037
	ld h,(ix+003h)		;d03a
	ld iy,0c953h		;d03d
	ld de,0040ch		;d041
	ld bc,00202h		;d044
	call choca_con_tabla		;d047
	ret c			;d04a
	xor a			;d04b
	ld de,0ea52h		;d04c
	call arranca_guion_libre		;d04f
	ld (ix+000h),080h		;d052
	ld (ix+001h),01dh		;d056
	ld (iy+002h),080h		;d05a
	ld hl,0dd84h		;d05e
	ld b,00eh		;d061
	call premia		;d063
	ret			;d066
tiro_alcanza_nave:		; El contacto al reves: la nave (0xC184) contra la tabla que llena alta_enemigo (0xC93A), caja 4x0x0A. Marca al culpable con 0x80 y se va por impacto_simple. Es la ultima instruccion de actualiza_nave
	ld hl,(0c184h)		;d067
	ld iy,0c93ah		;d06a
	ld de,0040ah		;d06e
	ld bc,00203h		;d071
	call choca_con_tabla		;d074
	ret c			;d077
	ld (iy+002h),080h		;d078
	call impacto_simple		;d07c
	ret			;d07f
disparo_derriba_tiro:		; Lo mismo contra un TIRO enemigo: le mete 0x7C en (ix+000h), marca el disparo del jugador y paga 53 puntos, que son los mismos 53 que cobra su gemela de la fase de a pie
	ld l,(ix+002h)		;d080
	ld h,(ix+003h)		;d083
	ld iy,0c953h		;d086
	ld de,00408h		;d08a
	ld bc,00200h		;d08d
	call choca_con_tabla		;d090
	ret c			;d093
	ld (ix+000h),07ch		;d094
	ld (iy+002h),080h		;d098
	ld hl,0dd85h		;d09c
	ld b,035h		;d09f
	call premia		;d0a1
	ret			;d0a4
choca_con_nave2:		; El otro contacto con la nave, con la caja pequena: solapa_eje con 2x3 contra 0x0C x 0x0A, frente al 4x5 contra 0x18x6 de choca_con_nave
	push hl			;d0a5
	ld a,(0c185h)		;d0a6
	ld l,a			;d0a9
	ld bc,00203h		;d0aa
	ld de,00c0ah		;d0ad
	call solapa_eje		;d0b0
	pop hl			;d0b3
	ret c			;d0b4
	ld h,l			;d0b5
	ld a,(0c184h)		;d0b6
	ld l,a			;d0b9
	jp solapa_eje		;d0ba
choca_con_nave3:		; La tercera caja de contacto con la nave, 5x3 contra 0x16x0A, y la unica que ademas se asegura antes de que la nave siga viva (0xC188 por debajo de 4)
	ld a,(0c188h)		;d0bd
	cp 004h		;d0c0
	ccf			;d0c2
	ret c			;d0c3
	push hl			;d0c4
	ld a,(0c185h)		;d0c5
	ld l,a			;d0c8
	ld bc,00503h		;d0c9
	ld de,0160ah		;d0cc
	call solapa_eje		;d0cf
	pop hl			;d0d2
	ret c			;d0d3
	ld h,l			;d0d4
	ld a,(0c184h)		;d0d5
	ld l,a			;d0d8
	jp solapa_eje		;d0d9
pinta_escudo:		; Repinta el indicador que va pegado a la nave eligiendo color de marca -0x11 o 0x71- y sprite -0x39 o 0x3A- segun la bandera 0xD3C2. (Aqui puso que la ALTERNABA "cuadro a cuadro con el `xor 001h`" y no es cierto: el `xor` de 0xD0F5 se queda en E y NO se vuelve a escribir. Quien pone 0xD3C2 a 1 es el bucle principal, cada cuadro, y quien lo pone a 0 son los contactos de 0xD23A y 0xD2B2; el parpadeo existe, pero no lo hace esta rutina)
	jp L_D0DF		;d0dc
L_D0DF:
	ld a,(0c188h)		;d0df
	cp 004h		;d0e2
	ret nc			;d0e4
	ld hl,(0c184h)		;d0e5
	ld a,h			;d0e8
	sub 038h		;d0e9
	cp 020h		;d0eb
	jr nc,L_D0F1		;d0ed
	ld a,020h		;d0ef
L_D0F1:
	ld h,a			;d0f1
	ld a,(0d3c2h)		;d0f2
	xor 001h		;d0f5
	ld e,a			;d0f7
	push hl			;d0f8
	ld hl,02f78h		;d0f9
	call z,pinta_marca_hud		;d0fc
	call nz,marca_hud_enciende		;d0ff
	pop hl			;d102
	ld a,e			;d103
	add a,039h		;d104
	jp pinta_sprite		;d106
poda_rumbo_nave:		; Quita del rumbo pedido -en el A alternativo- las direcciones que la nave no puede tomar por donde esta: X=0 la izquierda, X=0xB0 la derecha, Y=0x38 arriba y Y=0xB0 abajo
	ld hl,(0c184h)		;d109
	ex af,af'			;d10c
	ld a,l			;d10d
	and a			;d10e
	jr nz,L_D115		;d10f
	ex af,af'			;d111
	and 0f7h		;d112
	ex af,af'			;d114
L_D115:
	cp 0b0h		;d115
	jr nz,L_D11D		;d117
	ex af,af'			;d119
	and 0fbh		;d11a
	ex af,af'			;d11c
L_D11D:
	ld a,h			;d11d
	cp 038h		;d11e
	jr nz,L_D126		;d120
	ex af,af'			;d122
	and 0fdh		;d123
	ex af,af'			;d125
L_D126:
	cp 0b0h		;d126
	jr nz,L_D12E		;d128
	ex af,af'			;d12a
	and 0feh		;d12b
	ret			;d12d
L_D12E:
	ex af,af'			;d12e
	ret			;d12f
recorta_a_area:		; Deshace el movimiento si se sale: con L >= 0xB1 repone la X de 0xC184, y con la Y fuera de la banda 0x38..0xB1 repone la de 0xC185
	ld a,l			;d130
	cp 0b1h		;d131
	jr c,L_D139		;d133
	ld a,(0c184h)		;d135
	ld l,a			;d138
L_D139:
	ld a,h			;d139
	sub 038h		;d13a
	cp 079h		;d13c
	ret c			;d13e
	ld a,(0c185h)		;d13f
	ld h,a			;d142
	ret			;d143
borde_pantalla:		; Poda el rumbo en los bordes laterales: con X < 3 quita el bit de izquierda y con X >= 174 el de derecha, sobre el A alternativo
	ex af,af'			;d144
	ld a,(ix+000h)		;d145
	add a,010h		;d148
	cp 013h		;d14a
	jr nc,L_D152		;d14c
	ex af,af'			;d14e
	and 0f7h		;d14f
	ret			;d151
L_D152:
	cp 0beh		;d152
	jr c,L_D15A		;d154
	ex af,af'			;d156
	and 0fbh		;d157
	ret			;d159
L_D15A:
	ex af,af'			;d15a
	ret			;d15b
recorta_x_objeto:		; Deshace el paso lateral del objeto de IX si se ha salido: con L >= 0xB1 repone L desde (ix+000h). Identica byte a byte a la de la fase de a pie
	ld a,l			;d15c
	cp 0b1h		;d15d
	ret c			;d15f
	ld l,(ix+000h)		;d160
	ret			;d163
arranca_estela:		; Si queda barra (0xD3C1) y la puerta de (iy+000)|(iy+005) esta a cero, gasta un punto, repinta la barra y lanza la estela de 0xD3BD desde la posicion de la nave, con vida 3 y paso 0x03C0 o 0x003C segun la columna. La llama dispara al terminar
	ld iy,0d3bdh		;d164
	ld a,(iy+004h)		;d168
	and a			;d16b
	ret z			;d16c
	ld a,(iy+005h)		;d16d
	or (iy+000h)		;d170
	ret nz			;d173
	dec (iy+004h)		;d174
	call pinta_energia		;d177
	ld (iy+000h),003h		;d17a
	ld hl,(0c184h)		;d17e
	ld a,h			;d181
	sub 018h		;d182
	ld (iy+002h),a		;d184
	sub 008h		;d187
	cp 034h		;d189
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
traza_estela:		; Anima la estela del objeto de 0xD3BD en tres fotogramas segun la vida que le queda, y siempre en vertical sobre la misma columna: con vida 3 pinta (iy+003) puntos subiendo desde la base, con vida 2 pasa DOS veces por el nucleo y saca el trazo entero de 2*(iy+003), y con vida 1 sube primero (iy+003) filas SIN pintar -su bucle de 0xD1D3 no escribe en el buffer- y pinta solo la mitad alta. O sea que el chorro crece, llega entero y se despega por abajo. El 24 y el 25 no son "recta o diagonal": los dos valen una fila, y el 25 solo compensa el `inc hl` del segundo byte de cada punto
	ld iy,0d3bdh		;d1af
	ld a,(iy+000h)		;d1b3
	and a			;d1b6
	ret z			;d1b7
	ld l,(iy+001h)		;d1b8
	ld h,(iy+002h)		;d1bb
	call buffer_dir		;d1be
	ld de,00019h		;d1c1
	ld a,(iy+000h)		;d1c4
	dec (iy+000h)		;d1c7
	cp 002h		;d1ca
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
	call pinta_tramo_estela		;d1db
L_D1DE:
	pop af			;d1de
	cp 003h		;d1df
	ret nc			;d1e1
pinta_tramo_estela:		; El nucleo de traza_estela: pinta (iy+003) puntos de la estela subiendo por el buffer, dos bytes por punto -(iy+006) y (iy+007) con `or (hl)`- y restando DE=25 entre uno y otro. Como el `inc hl` del segundo byte suma 1 antes de la resta, el paso NETO es de 24, el ancho justo de la fila: cada punto cae en la misma columna una fila mas arriba, y la estela sale vertical. traza_estela entra aqui una vez con vida 3, DOS con vida 2 (la llama en 0xD1DB y ademas cae dentro tras el `cp 003h / ret nc` de 0xD1DF), y con vida 1 una sola vez pero despues de subir (iy+003) filas de 24 sin pintar nada
	ld b,(iy+003h)		;d1e2
L_D1E5:
	ld a,(iy+006h)		;d1e5
	or (hl)			;d1e8
	ld (hl),a			;d1e9
	inc hl			;d1ea
	ld a,(iy+007h)		;d1eb
	or (hl)			;d1ee
	ld (hl),a			;d1ef
	sbc hl,de		;d1f0
	djnz L_D1E5		;d1f2
	ret			;d1f4
impacto_objeto:		; Si el objeto de IX esta marcado y 0xD3BD lo permite, lo pasa al estado 0xC190, le pone 0x28 en (ix+002), suena 0xEA52, descarta la vuelta con `pop hl` y premia 200 puntos. Si no, comprueba el contacto con la nave -y solo si la nave esta viva, 0xC188 por debajo de 4-
	bit 2,(ix+007h)		;d1f5
	jr z,L_D21F		;d1f9
	ld a,(0d3bdh)		;d1fb
	dec a			;d1fe
	jr nz,L_D21F		;d1ff
	ld hl,0c190h		;d201
	ld (ix+003h),l		;d204
	ld (ix+004h),h		;d207
	ld (ix+002h),028h		;d20a
	xor a			;d20e
	ld de,0ea52h		;d20f
	call arranca_guion_libre		;d212
	pop hl			;d215
	ld hl,0dd83h		;d216
	ld b,002h		;d219
	call premia		;d21b
	ret			;d21e
L_D21F:
	ld a,(0c188h)		;d21f
	sla (ix+007h)		;d222
	cp 004h		;d226
	ret nc			;d228
	ld l,(ix+001h)		;d229
	ld h,(ix+000h)		;d22c
	sla h		;d22f
	call choca_con_nave		;d231
	ret c			;d234
	set 0,(ix+007h)		;d235
	xor a			;d239
	ld (0d3c2h),a		;d23a
	ret			;d23d
choca_con_nave:		; Contacto entre la nave y lo que venga en HL: solapa_eje con la Y de la nave (0xC185, saturada por arriba a 0x20) y luego con su X (0xC184), cajas 4x5 contra 0x18x6. Carry = no hay contacto
	push hl			;d23e
	ld a,(0c185h)		;d23f
	sub 038h		;d242
	cp 020h		;d244
	jr nc,L_D24A		;d246
	ld a,020h		;d248
L_D24A:
	ld l,a			;d24a
	ld bc,00405h		;d24b
	ld de,01806h		;d24e
	call solapa_eje		;d251
	pop hl			;d254
	ret c			;d255
	ld h,l			;d256
	ld a,(0c184h)		;d257
	ld l,a			;d25a
	jp solapa_eje		;d25b
L_D25E:
	ld hl,(0d3c7h)		;d25e
	call choca_con_nave3		;d261
	jr c,L_D275		;d264
	ld a,005h		;d266
	ld (0d3c5h),a		;d268
	xor a			;d26b
	ld de,0ea52h		;d26c
	call arranca_guion_libre		;d26f
	jp mata_nave		;d272
L_D275:
	ld a,(0d3c9h)		;d275
	bit 2,a		;d278
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
	call arranca_guion_libre		;d294
	ld hl,0dd84h		;d297
	ld b,00fh		;d29a
	call premia		;d29c
	ret			;d29f
L_D2A0:
	ld hl,(0d3c7h)		;d2a0
	call choca_con_nave		;d2a3
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
impacto_simple:		; Gasta un punto de escudo, y si ya estaba a cero manda a mata_nave
	ld a,(0c188h)		;d2b6
	and a			;d2b9
	jr z,mata_nave		;d2ba
	dec a			;d2bc
	ld (0c188h),a		;d2bd
	jr L_D2CF		;d2c0
impacto_doble:		; Gasta dos puntos de escudo, comprobando entre uno y otro si el primero ya bastaba para matar
	ld a,(0c188h)		;d2c2
	and a			;d2c5
	jr z,mata_nave		;d2c6
	dec a			;d2c8
	jr z,mata_nave		;d2c9
	dec a			;d2cb
	ld (0c188h),a		;d2cc
L_D2CF:
	ld hl,06f50h		;d2cf
	xor 003h		;d2d2
	call borra_celda		;d2d4
	dec a			;d2d7
	ret z			;d2d8
	ld hl,06f48h		;d2d9
	call borra_celda		;d2dc
	dec a			;d2df
	ret z			;d2e0
	ld hl,06f40h		;d2e1
borra_celda:		; Escribe el valor 0x11 ocho veces en dos celdas de VRAM separadas 0x40, con el puerto en C para poder usar `out (c),b`
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
	add hl,bc			;d2fe
	dec e			;d2ff
	jr nz,L_D2E6		;d300
	ret			;d302
mata_nave:		; La unica puerta de la muerte: apaga las dos marcas del HUD y mete un 4 en 0xC188, que es lo que arranca la explosion. Diez sitios del listado acaban aqui
	ld hl,02778h		;d303
	call pinta_marca_hud		;d306
	ld hl,02f48h		;d309
	ld a,004h		;d30c
	ld (0c188h),a		;d30e
	jp pinta_marca_hud		;d311
tile_46:		; El comportamiento del tile 0x46 (`ld de,0d314h` en 0xC16B), que es una onda expansiva horizontal. El primer cuadro convierte (ix+002) -que traia el indice de tile, 0x46- en un contador que sube de 0 a 8 y ahi se queda, y con el pinta por pinta_banda_ruido una banda de 8 px de alto y (contador*2+4) bytes de ancho que arranca en la columna (ix+001) - contador*8: crece 16 px por cuadro, ocho por cada lado, de 32 px hasta 160. Suena 0xEAA1 en el canal 1 cada cuadro y, si la nave sigue viva (0xC188 por debajo de 4), la mata al tocarla con una caja que crece a la par: contador*16 + 0x1E contra 0x0C en el eje de columnas, y 6 contra 0x0C en el de filas. Antes de todo eso llama a impacto_objeto, o sea que se puede reventar como cualquier otro tile especial
	call impacto_objeto		;d314
	ld a,(ix+002h)		;d317
	cp 046h		;d31a
	jr nz,L_D320		;d31c
	ld a,0ffh		;d31e
L_D320:
	cp 008h		;d320
	jr z,L_D328		;d322
	inc a			;d324
	ld (ix+002h),a		;d325
L_D328:
	add a,a			;d328
	add a,a			;d329
	add a,a			;d32a
	ld e,a			;d32b
	ld a,(ix+001h)		;d32c
	sub e			;d32f
	ld l,a			;d330
	ld h,(ix+000h)		;d331
	sla h		;d334
	push hl			;d336
	srl l		;d337
	srl l		;d339
	srl l		;d33b
	call buffer_dir		;d33d
	ld a,(ix+002h)		;d340
	add a,a			;d343
	add a,004h		;d344
	ld b,a			;d346
	call pinta_banda_ruido		;d347
	ld a,001h		;d34a
	ld de,0eaa1h		;d34c
	call arranca_guion_libre		;d34f
	pop hl			;d352
	ld a,(0c188h)		;d353
	cp 004h		;d356
	ret nc			;d358
	ld a,h			;d359
	add a,020h		;d35a
	ld h,a			;d35c
	push hl			;d35d
	ld a,(0c185h)		;d35e
	ld l,a			;d361
	ld de,0060ch		;d362
	ld bc,00102h		;d365
	call solapa_eje		;d368
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
	call solapa_eje		;d37c
	ret c			;d37f
	jp mata_nave		;d380
pinta_banda_ruido:		; La brocha de tile_46, y solo suya: pinta B columnas de un byte por 8 filas del buffer, y para CADA columna echa a suertes (`call azar / and 001h`) entre los dos patrones de 8 bytes de 0xD3AD y 0xD3B5, que son los dieciseis primeros de los 34 que figuraban en 0xD3AD como tabla sin dueno. Cada byte lo borra primero con el patron rotado y complementado (`ld a,(de) / rrca / cpl / and (hl)`) y lo pinta despues con `or (hl)`; entre fila y fila suma 24, el ancho del buffer, y entre columna y columna un `inc hl`
	push bc			;d383
	call azar		;d384
	and 001h		;d387
	ld de,0d3adh		;d389
	jr z,L_D391		;d38c
	ld de,0d3b5h		;d38e
L_D391:
	ld b,008h		;d391
	push hl			;d393
L_D394:
	ld a,(de)			;d394
	rrca			;d395
	cpl			;d396
	and (hl)			;d397
	ld (hl),a			;d398
	ld a,(de)			;d399
	or (hl)			;d39a
	ld (hl),a			;d39b
	ld a,l			;d39c
	add a,018h		;d39d
	ld l,a			;d39f
	ld a,h			;d3a0
	adc a,000h		;d3a1
	ld h,a			;d3a3
	inc de			;d3a4
	djnz L_D394		;d3a5
	pop hl			;d3a7
	inc hl			;d3a8
	pop bc			;d3a9
	djnz pinta_banda_ruido		;d3aa
	ret			;d3ac

; ----------------------------------------------------------------------
; DATOS tabla_D3AD: Tabla (34 B; racha 3.63, entropia 3.17, 16 valores: pocos
;   valores para ser un dibujo)
;   0xd3ad..0xd3cf  (34 bytes)
DATA_tabla_D3AD:
	defb 044h,055h,07bh,0dfh,0f6h,0aah,029h,008h,008h,029h,0adh,0fbh,0afh,0dah,052h,042h	; d3ad  DU{...)..)....RB
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; d3bd  ................
	defb 000h,000h	; d3cd

; ======================================================================
; CODIGO 0xd3cf..0xdac5  (1782 bytes)
; ======================================================================


suma_puntos:		; Suma al marcador de 0xDD80 en ASCII con acarreo decimal a mano (inc a / cp 03ah / sub 00ah) de derecha a izquierda, y repinta con hud_imprime
	ld a,(0dd81h)		;d3cf
	push af			;d3d2
L_D3D3:
	push hl			;d3d3
L_D3D4:
	ld a,(hl)			;d3d4
	inc a			;d3d5
	cp 03ah		;d3d6
	jr c,L_D3E1		;d3d8
	sub 00ah		;d3da
	ld (hl),a			;d3dc
	dec hl			;d3dd
	jp L_D3D4		;d3de
L_D3E1:
	ld (hl),a			;d3e1
	pop hl			;d3e2
	djnz L_D3D3		;d3e3
	call hud_imprime		;d3e5
	pop de			;d3e8
	ld a,(0dd81h)		;d3e9
	cp d			;d3ec
	ret z			;d3ed
	ld a,080h		;d3ee
	ld de,0eaaah		;d3f0
	call arranca_guion		;d3f3
	inc a			;d3f6
	ld de,0eac9h		;d3f7
	call arranca_guion		;d3fa
	inc a			;d3fd
	ld de,0eae5h		;d3fe
	call arranca_guion		;d401
	call sonido_off		;d404
	ld a,(0c188h)		;d407
	cp 002h		;d40a
	jp c,repone_escudo		;d40c
	ld hl,0e156h		;d40f
	ld a,(hl)			;d412
	cp 009h		;d413
	ret nc			;d415
	inc (hl)			;d416
	jp hud_vidas_zona		;d417
alta_enemigo_cuadro:		; El alta de enemigos cuadro a cuadro, la penultima llamada del bucle de partida (0xBF97). Tres filtros antes de nada: una tirada de cada 32 (`and 01fh`), la bandera 0xDAC5 a cero -o sea antes de que salga el tile de fin de zona- y una segunda tirada cuya dificultad sale de la zona y de cuantos enemigos hay ya volando: b = ((7 - zona) pasado por `rrca`) + 0xC97A + 0xC98F, y hay que sacar cero en `azar and (2^b - 1)`; si esa suma es cero entra sin tirar. Luego saca una columna al azar por debajo de 0xB0 y suelta el enemigo en la fila 0, en la tabla de 0xC990 si el bit 1 de esa columna esta puesto -con la de 0xC97B de reserva si estaba llena- y en la de 0xC97B si no. Es la hermana de la alta_enemigo_cuadro de la fase de a pie: mismo esquema con otros numeros, y solo 7 de sus 68 bytes coinciden
	call azar		;d41a
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
	call azar		;d440
	and e			;d443
	ret nz			;d444
L_D445:
	call azar		;d445
	cp 0b0h		;d448
	jr nc,L_D445		;d44a
	ld c,a			;d44c
	ld b,000h		;d44d
	and 002h		;d44f
	jr z,L_D459		;d451
	xor a			;d453
	ex af,af'			;d454
	call alta_objeto_c990		;d455
	ret c			;d458
L_D459:
	xor a			;d459
	ex af,af'			;d45a
	jp alta_bandada		;d45b
repone_escudo:		; La otra cara del premio de los 10.000: si la nave llega con el escudo por debajo de 2, en vez de una vida le reponen el ESCUDO, a 3
	ld a,003h		;d45e
	ld (0c188h),a		;d460
	ld hl,02778h		;d463
	ld c,0f9h		;d466
	call pinta_celda_color		;d468
	ld hl,02f40h		;d46b
	ld c,0f5h		;d46e
	call pinta_celda_color		;d470
	ld hl,02f48h		;d473
	ld c,0f5h		;d476
	call pinta_celda_color		;d478
	ld hl,02f50h		;d47b
	ld c,0f1h		;d47e
pinta_celda_color:		; Rellena dos celdas de color consecutivas de la VRAM (8 bytes cada una, separadas 0x40) con el valor C
	call vram_pon_dir		;d480
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
	add hl,de			;d492
	call vram_pon_dir		;d493
	dec c			;d496
	jr nz,L_D486		;d497
	ei			;d499
	ret			;d49a
rotula_glifo:		; Estampa el glifo 0x5F00 + A*8 en el buffer a doble altura y con tramado en damero -borra con rlca/cpl/and y pinta con and 0x55/0xAA-, recortando al llegar a 0x4F00
	ld e,a			;d49b
	ld a,h			;d49c
	cp 04fh		;d49d
	ld a,e			;d49f
	ret nc			;d4a0
	cp 020h		;d4a1
	push hl			;d4a3
	ld h,000h		;d4a4
	ld l,a			;d4a6
	add hl,hl			;d4a7
	add hl,hl			;d4a8
	add hl,hl			;d4a9
	ld de,05f00h		;d4aa
	add hl,de			;d4ad
	ex de,hl			;d4ae
	pop hl			;d4af
	push hl			;d4b0
	push de			;d4b1
	ld bc,00018h		;d4b2
	ld a,008h		;d4b5
L_D4B7:
	ex af,af'			;d4b7
	ld a,(de)			;d4b8
	rlca			;d4b9
	cpl			;d4ba
	and (hl)			;d4bb
	ld (hl),a			;d4bc
	add hl,bc			;d4bd
	ld a,(de)			;d4be
	rlca			;d4bf
	cpl			;d4c0
	and (hl)			;d4c1
	ld (hl),a			;d4c2
	add hl,bc			;d4c3
	inc de			;d4c4
	ex af,af'			;d4c5
	dec a			;d4c6
	jp nz,L_D4B7		;d4c7
	pop de			;d4ca
	pop hl			;d4cb
	push hl			;d4cc
	add hl,bc			;d4cd
	ld a,008h		;d4ce
L_D4D0:
	ex af,af'			;d4d0
	ld a,(de)			;d4d1
	and 055h		;d4d2
	or (hl)			;d4d4
	ld (hl),a			;d4d5
	add hl,bc			;d4d6
	ld a,(de)			;d4d7
	and 0aah		;d4d8
	or (hl)			;d4da
	ld (hl),a			;d4db
	add hl,bc			;d4dc
	inc de			;d4dd
	ex af,af'			;d4de
	dec a			;d4df
	jp nz,L_D4D0		;d4e0
	pop hl			;d4e3
	ret			;d4e4
rotula_cadena:		; Recorre la cadena de (IX) hasta el 0 estampando cada caracter con 0xD49B y avanzando el destino HL
	ld a,(ix+000h)		;d4e5
	inc ix		;d4e8
	and a			;d4ea
	ret z			;d4eb
	call rotula_glifo		;d4ec
	inc hl			;d4ef
	jp rotula_cadena		;d4f0
pinta_menu:		; Estampa las cinco lineas del menu -STARDUST, JOYSTICK, TECLADO, REDEFINIR TECLAS, JUGAR, en 0xDCC6- sobre el buffer en 0x40C8, 0x43C2, 0x46C2, 0x49C2 y 0x4CCA, y con 0xDCC3 puesto anade el selector "<>>>>>>>" de 0xDCF7 en la opcion elegida
	ld ix,0dcc6h		;d4f3
	ld hl,040c8h		;d4f7
	call rotula_cadena		;d4fa
	ld hl,043c2h		;d4fd
	call rotula_cadena		;d500
	ld hl,046c2h		;d503
	call rotula_cadena		;d506
	ld hl,049c2h		;d509
	call rotula_cadena		;d50c
	ld hl,04ccah		;d50f
	call rotula_cadena		;d512
	ld a,(0dcc3h)		;d515
	and a			;d518
	jr z,L_D525		;d519
	ld ix,0dcf7h		;d51b
	ld hl,043c2h		;d51f
	jp rotula_cadena		;d522
L_D525:
	ld ix,0dd00h		;d525
	ld hl,046c2h		;d529
	jp rotula_cadena		;d52c
scroll_records:		; Un cuadro de la pantalla de records: baja el puntero de 0xDCC4 una fila del buffer (24 bytes) y vuelve a rotular el titulo "STARDUST" de 0xDCC6 y las ocho fichas de 0xDD08, cada una 384 bytes por debajo de la anterior, que a 24 por fila son las 16 filas justas que ocupa un glifo a doble altura. Cuando el puntero se sale por arriba del buffer (`ld a,h / cp 040h`) se va a 0xD591, que desapila la vuelta, arranca la musica, espera a que acabe y entra en la demo sembrando el azar con 0xA710 y parcheando 0xC090 con lee_mando_demo. El llamador es el bucle de 0xD566, que arranca poniendo 0xDCC4 en 0x4F08. Gemela de la scroll_records de la fase de a pie: 35 de sus 49 bytes son identicos
	ld hl,(0dcc4h)		;d52f
	ld de,00018h		;d532
	and a			;d535
	sbc hl,de		;d536
	ld a,h			;d538
	cp 040h		;d539
	jp c,L_D591		;d53b
	ld (0dcc4h),hl		;d53e
	ld ix,0dcc6h		;d541
	call rotula_cadena		;d545
	ld de,00235h		;d548
	add hl,de			;d54b
	ld ix,0dd08h		;d54c
	ld de,00172h		;d550
	ld b,008h		;d553
L_D555:
	push bc			;d555
	push de			;d556
	call rotula_cadena		;d557
	pop de			;d55a
	add hl,de			;d55b
	pop bc			;d55c
	djnz L_D555		;d55d
	ret			;d55f
L_D560:
	ld hl,04f08h		;d560
	ld (0dcc4h),hl		;d563
L_D566:
	call borra_buffer		;d566
	call mueve_estrellas		;d569
	call scroll_records		;d56c
	call vuelca_pantalla		;d56f
	call hay_tecla		;d572
	jp nz,L_BDE5		;d575
	jp L_D566		;d578
espera_fin_musica:		; Da vueltas hasta que el canal 1 se queda sin guion (0xEDA3 a cero) o hasta que se pulsa una tecla, con una espera de 1000 entre vuelta y vuelta
	xor a			;d57b
	ld (0ee1ah),a		;d57c
L_D57F:
	call hay_tecla		;d57f
	ret nz			;d582
	ld bc,003e8h		;d583
	call espera_bc		;d586
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
	call arranca_musica		;d595
	call espera_fin_musica		;d598
	ld hl,0a710h		;d59b
	ld (0ca8fh),hl		;d59e
	ld hl,0c1afh		;d5a1
	ld (0c090h),hl		;d5a4
	jp hud_reset		;d5a7
L_D5AA:
	ld a,(0e157h)		;d5aa
	dec a			;d5ad
	jr z,L_D5BE		;d5ae
	dec a			;d5b0
	jr z,L_D5C6		;d5b1
	dec a			;d5b3
	jr z,L_D5CE		;d5b4
	call azar		;d5b6
	and 007h		;d5b9
	jp L_D5D7		;d5bb
L_D5BE:
	call azar		;d5be
	and 001h		;d5c1
	jp L_D5D7		;d5c3
L_D5C6:
	call azar		;d5c6
	and 003h		;d5c9
	jp L_D5D7		;d5cb
L_D5CE:
	call azar		;d5ce
	and 007h		;d5d1
	cp 006h		;d5d3
	jr nc,L_D5CE		;d5d5
L_D5D7:
	push af			;d5d7
	add a,096h		;d5d8
	call dibuja_sprite_vram		;d5da
	pop af			;d5dd
	ld h,000h		;d5de
	ld l,a			;d5e0
	ld d,h			;d5e1
	ld e,l			;d5e2
	add hl,hl			;d5e3
	add hl,hl			;d5e4
	add hl,hl			;d5e5
	ld b,h			;d5e6
	ld c,l			;d5e7
	add hl,hl			;d5e8
	add hl,bc			;d5e9
	add hl,de			;d5ea
	ld de,0c9bch		;d5eb
	add hl,de			;d5ee
	ex de,hl			;d5ef
	ld a,0a8h		;d5f0
	ld (0ca8dh),a		;d5f2
	ld a,003h		;d5f5
	ld (0ca91h),a		;d5f7
	ld h,000h		;d5fa
	call azar		;d5fc
	and 007h		;d5ff
	or 080h		;d601
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
	ld a,(de)			;d61a
	cp 006h		;d61b
	jr nz,L_D626		;d61d
	call azar		;d61f
	and 004h		;d622
	add a,006h		;d624
L_D626:
	ld (ix+000h),a		;d626
	cp 003h		;d629
	jr c,L_D665		;d62b
	ld (iy+002h),a		;d62d
	ld (iy+001h),h		;d630
	ld (iy+000h),l		;d633
	cp 006h		;d636
	jr nz,L_D640		;d638
	ld bc,inst_torreta		;d63a
	jp L_D64A		;d63d
L_D640:
	cp 00ah		;d640
	ld bc,inst_quieta		;d642
	jr nz,L_D64A		;d645
	ld bc,inst_nido		;d647
L_D64A:
	ld (iy+003h),c		;d64a
	ld (iy+004h),b		;d64d
	push ix		;d650
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
	inc ix		;d668
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
	jp arranca_guion_libre		;d679
recorre_instalaciones:		; Recorre las instalaciones de la zona (contador 0xC8D7, tabla 0xC8D8, entradas de 8 B): a cada una le suma el scroll de 0xCA8D en (ix+007), y si no se ha salido por abajo (0xC0) le llama a su rutina de gobierno con `jp (hl)`, empujando antes la vuelta
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
	bit 7,a		;d6a3
	jr nz,L_D6BC		;d6a5
	ld a,(ix+007h)		;d6a7
	cp 0c0h		;d6aa
	jr nc,L_D6B9		;d6ac
	ld hl,L_D6BC		;d6ae
	push hl			;d6b1
	ld h,(ix+004h)		;d6b2
	ld l,(ix+003h)		;d6b5
	jp (hl)			;d6b8
L_D6B9:
	call retira_instalacion		;d6b9
L_D6BC:
	ld de,00008h		;d6bc
	add ix,de		;d6bf
	pop bc			;d6c1
	djnz L_D686		;d6c2
	ret			;d6c4
tile_43:		; El comportamiento del tile 0x43 (`ld de,0d6c5h` en 0xC158): entra por contacto_instalacion, o sea que mata a la nave al tocarla, y anima el aparato alternando su celda del mapa entre los tiles 0x43 y 0x44 con un `ld a,007h / xor (hl)` cada ocho cuadros. La fase la echa a suertes: en su primer cuadro -(ix+000) valiendo 1- mete en (ix+007) un `azar and 007h`, de modo que dos tiles 0x43 en pantalla no parpadeen a la vez. Dibujados desde el pozo de tiles, el 0x43 y el 0x44 son el mismo aparato con el interior cambiado
	call contacto_instalacion		;d6c5
	ld a,(ix+000h)		;d6c8
	dec a			;d6cb
	jr nz,L_D6D6		;d6cc
	call azar		;d6ce
	and 007h		;d6d1
	ld (ix+007h),a		;d6d3
L_D6D6:
	ld a,(ix+007h)		;d6d6
	inc (ix+007h)		;d6d9
	and 007h		;d6dc
	ret nz			;d6de
	ld l,(ix+005h)		;d6df
	ld h,(ix+006h)		;d6e2
	ld a,007h		;d6e5
	xor (hl)			;d6e7
	ld (hl),a			;d6e8
	ret			;d6e9
contacto_instalacion:		; La caja de la instalacion de IX contra la nave: HL sale de (ix+000/001) con la fila doblada, y de ahi a choca_con_nave3
	ld h,(ix+000h)		;d6ea
	ld l,(ix+001h)		;d6ed
	sla h		;d6f0
	call choca_con_nave3		;d6f2
	ret c			;d6f5
	jp mata_nave		;d6f6
entra_en_records:		; Mira si el marcador entra en la tabla de records, y es por donde pasa TODO game over: la llama 0xBDE2, adonde llegan tanto quedarse sin vidas (0xC000) como la tecla ABANDONAR (0xBFE8). Compara los seis digitos de 0xDD80 contra los ocho campos de puntuacion de 0xDD10 + n*15 y, al ganar uno, hace hueco con un `lddr` de (7-n)*15 bytes que empuja las fichas de abajo y tira la ultima, copia ahi la puntuacion con un `ldir` de 6 y salta a 0xF671 -la entrada del nombre- con la direccion del nombre nuevo en la pila. La tabla son ocho fichas de 15 bytes desde 0xDD08 -8 de nombre, 6 de puntuacion y el cero-, y cierra al byte: 0xDD08 + 120 = 0xDD80, que es el marcador. Gemela de la entra_en_records de la fase de a pie: 57 de sus 71 bytes son identicos
	ld hl,0dd10h		;d6f9
	ld c,008h		;d6fc
L_D6FE:
	ld de,0dd80h		;d6fe
	push hl			;d701
	ld b,006h		;d702
L_D704:
	ld a,(de)			;d704
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
	add hl,hl			;d715
	add hl,hl			;d716
	add hl,hl			;d717
	add hl,hl			;d718
	sbc hl,de		;d719
	ld b,h			;d71b
	ld c,l			;d71c
	ld hl,0dd70h		;d71d
	ld de,0dd7fh		;d720
	lddr		;d723
	inc hl			;d725
L_D726:
	pop de			;d726
	push hl			;d727
	ld hl,0dd80h		;d728
	ld bc,00006h		;d72b
	ldir		;d72e
	jp L_F671		;d730
L_D733:
	inc hl			;d733
	inc de			;d734
	djnz L_D704		;d735
L_D737:
	pop hl			;d737
	ld de,0000fh		;d738
	add hl,de			;d73b
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
	call hud_vidas_zona		;d758
L_D75B:
	ld a,(0ca8eh)		;d75b
	inc a			;d75e
	ld (0ca8eh),a		;d75f
	call borra_buffer		;d762
	ld bc,005dch		;d765
	call espera_bc		;d768
	call pinta_escudo		;d76b
	ld a,001h		;d76e
	ld (0d3c2h),a		;d770
	call mueve_estrellas		;d773
	call mueve_perseguidor		;d776
	call recorre_las_dos_tablas		;d779
	call mueve_disparos		;d77c
	call mueve_bandada		;d77f
	call traza_estela		;d782
	call mueve_objetos		;d785
	call pausa		;d788
	ld a,(0c188h)		;d78b
	cp 02dh		;d78e
	call c,va_a_nave_estado		;d790
	ld a,(0ca91h)		;d793
	cp 080h		;d796
	call nz,avanza_instalaciones		;d798
	call bonus_zona		;d79b
	call vuelca_pantalla		;d79e
	jp L_D75B		;d7a1
bonus_zona:		; El remate de la zona, dentro del bucle de 0xD75B: mientras zona_despejada diga que queda algo en pantalla no hace mas que esperar 1000 vueltas, y en cuanto la zona esta limpia el contador de 0xDDF7 lleva el guion -19 cuadros de espera, 20 rotulando "BONUS xx00" (0xDDF8) en 0x40C7, y en el paso 0x28 se queda dando vueltas cobrando-. Cada vuelta del cobro paga 100 puntos, suena 0xEB2C y baja una unidad los dos digitos de 0xDDFE/0xDDFF, que L_D740 dejo en (zona + 0x32) y '0': la zona 1 cobra "30" y paga 3000, y la 7 cobra "90" y paga 9000. Cuando el contador llega a 0x50 desapila la vuelta y se va a carga_zona, o a 0xF71C -la multicarga- si la zona ya es la 8
	call zona_despejada		;d7a4
	jp nz,espera_1000		;d7a7
	ld a,(0ddf7h)		;d7aa
	inc a			;d7ad
	ld (0ddf7h),a		;d7ae
	cp 014h		;d7b1
	jr c,espera_1000		;d7b3
	cp 028h		;d7b5
	jr c,L_D7F9		;d7b7
	jr nz,L_D803		;d7b9
	dec a			;d7bb
	ld (0ddf7h),a		;d7bc
	ld hl,0dd83h		;d7bf
	ld b,001h		;d7c2
	call premia		;d7c4
	ld a,(0ddffh)		;d7c7
	dec a			;d7ca
	ld (0ddffh),a		;d7cb
	cp 030h		;d7ce
	ld a,(0ddfeh)		;d7d0
	jr nc,L_D7E1		;d7d3
	ld a,039h		;d7d5
	ld (0ddffh),a		;d7d7
	ld a,(0ddfeh)		;d7da
	dec a			;d7dd
	ld (0ddfeh),a		;d7de
L_D7E1:
	cp 030h		;d7e1
	jr nz,L_D7F1		;d7e3
	ld a,(0ddffh)		;d7e5
	cp 030h		;d7e8
	jr nz,L_D7F1		;d7ea
	ld a,028h		;d7ec
	ld (0ddf7h),a		;d7ee
L_D7F1:
	ld a,000h		;d7f1
	ld de,0eb2ch		;d7f3
	call arranca_guion		;d7f6
L_D7F9:
	ld ix,0ddf8h		;d7f9
	ld hl,040c7h		;d7fd
	jp rotula_cadena		;d800
L_D803:
	cp 03ch		;d803
	jr c,L_D7F9		;d805
	cp 050h		;d807
	jr c,espera_1000		;d809
	pop hl			;d80b
	ld a,(0e157h)		;d80c
	cp 008h		;d80f
	jp z,L_F71C		;d811
	jp L_BEED		;d814
espera_1000:		; espera_bc con BC = 1000
	ld bc,003e8h		;d817
espera_bc:		; Espera activa: decrementa BC hasta cero y vuelve
	dec bc			;d81a
	ld a,b			;d81b
	or c			;d81c
	jr nz,espera_bc		;d81d
	ret			;d81f
gobierna_instalaciones:		; La ultima llamada del bucle de partida (0xBF9D), y el arbitro de la tanda de instalaciones: si 0xCA91 vale 0x80 no hay ninguna montada, y entonces -sin perseguidor (0xD3C5) y sin que haya salido el tile de fin de zona (0xDAC5)- una tirada de cada 128 salta al constructor de 0xD5AA. Si la hay, pasa el mando a avanza_instalaciones, que es la que la mueve
	ld a,(0ca91h)		;d820
	cp 080h		;d823
	jr nz,avanza_instalaciones		;d825
	ld a,(0d3c5h)		;d827
	and a			;d82a
	ret nz			;d82b
	ld a,(0dac5h)		;d82c
	and a			;d82f
	ret nz			;d830
	call azar		;d831
	and 07fh		;d834
	ret nz			;d836
	jp L_D5AA		;d837
avanza_instalaciones:		; El cuadro de la tanda de instalaciones: llama a recorre_instalaciones y mueve el scroll de la tanda, que es un contador de NUEVE bits -los ocho bajos en 0xCA8D y el noveno en el bit 7 de 0xCA8C-, al que suma 1, 2 o 3 segun la velocidad de 0xCA91. Una vez de cada ocho (`ld a,(0ca8eh) / and 007h`) ajusta esa velocidad: a saco mientras la tanda va por la pagina de entrada, y despues la acerca a la fila de la nave (0xC185) menos 0x34, subiendo o bajando de uno en uno con topes 1 y 3. Cuando el contador pasa de 0xC0 con el noveno bit ya apagado, la tanda se fue: pone 0xCA91 = 0x80 -la marca que mira zona_despejada- y repone el dibujo 0x73 del HUD. Remata con el `jp pinta_rejilla` de 0xD8A0, que es la unica entrada de esa rutina, pasandole la fila en H, la columna sin el bit 7 en L y ese noveno bit en D. La llama tambien el bucle de fin de zona, en 0xD798
	call recorre_instalaciones		;d83a
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
	cp 003h		;d862
	jr z,L_D872		;d864
	inc a			;d866
	jp L_D86F		;d867
L_D86A:
	cp 001h		;d86a
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
	ex af,af'			;d87e
	ld a,h			;d87f
	cp 0c0h		;d880
	jr c,L_D894		;d882
	bit 7,l		;d884
	jr nz,L_D894		;d886
	ld a,080h		;d888
	ld (0ca91h),a		;d88a
	push hl			;d88d
	ld a,073h		;d88e
	call dibuja_sprite_vram		;d890
	pop hl			;d893
L_D894:
	ex af,af'			;d894
	rla			;d895
	sbc a,a			;d896
	ld d,a			;d897
	ld a,l			;d898
	and 07fh		;d899
	ld l,a			;d89b
	ld ix,0c920h		;d89c
	jp pinta_rejilla		;d8a0
inst_torreta:		; La torreta: mira el contacto y, una vez de cada 32, dispara desde su propia posicion mas 0x1808. Si el disparo entra, se cambia a si misma la rutina por inst_recarga
	call choca_y_revienta		;d8a3
	call azar		;d8a6
	and 01fh		;d8a9
	ret nz			;d8ab
	ld a,(ix+000h)		;d8ac
	add a,a			;d8af
	add a,a			;d8b0
	add a,a			;d8b1
	ld l,a			;d8b2
	ld h,(ix+007h)		;d8b3
	ld bc,01808h		;d8b6
	add hl,bc			;d8b9
	ld b,h			;d8ba
	ld c,l			;d8bb
	ld a,008h		;d8bc
	ex af,af'			;d8be
	call alta_disparo		;d8bf
	ret nc			;d8c2
	ld hl,inst_recarga		;d8c3
	ld (ix+003h),l		;d8c6
	ld (ix+004h),h		;d8c9
	ret			;d8cc
inst_recarga:		; La torreta recargando: cada dos cuadros (bit 0 de 0xCA8E) sube su celda de la rejilla, y al llegar a 10 la devuelve a 6 y vuelve a ser inst_torreta. Ese 6..9 es la animacion del canon
	call choca_y_revienta		;d8cd
	ld a,(0ca8eh)		;d8d0
	and 001h		;d8d3
	ret z			;d8d5
	inc (ix+002h)		;d8d6
	ld l,(ix+005h)		;d8d9
	ld h,(ix+006h)		;d8dc
	inc (hl)			;d8df
	ld a,(hl)			;d8e0
	cp 00ah		;d8e1
	ret c			;d8e3
	ld a,006h		;d8e4
	ld (hl),a			;d8e6
	ld (ix+002h),a		;d8e7
	ld hl,inst_torreta		;d8ea
	ld (ix+003h),l		;d8ed
	ld (ix+004h),h		;d8f0
	ret			;d8f3
inst_quieta:		; La instalacion que no hace nada: solo mira si la han tocado. Dos instrucciones
	call choca_y_revienta		;d8f4
	ret			;d8f7
inst_nido:		; El nido: pone su celda a 10 y, una vez de cada 64, suelta un enemigo apuntado a la nave (rumbo_hacia sobre 0xC184) y se marca con un 11
	call choca_y_revienta		;d8f8
	ld l,(ix+005h)		;d8fb
	ld h,(ix+006h)		;d8fe
	ld (hl),00ah		;d901
	call azar		;d903
	and 03fh		;d906
	ret nz			;d908
	ld a,(ix+000h)		;d909
	add a,a			;d90c
	add a,a			;d90d
	add a,a			;d90e
	ld l,a			;d90f
	ld h,(ix+007h)		;d910
	ld bc,00808h		;d913
	add hl,bc			;d916
	ld b,h			;d917
	ld c,l			;d918
	push bc			;d919
	ld de,(0c184h)		;d91a
	call rumbo_hacia		;d91e
	call rumbo_a_mascara2		;d921
	pop bc			;d924
	ex af,af'			;d925
	call alta_enemigo		;d926
	ret nc			;d929
	ld l,(ix+005h)		;d92a
	ld h,(ix+006h)		;d92d
	ld (hl),00bh		;d930
	ret			;d932
inst_estalla:		; La instalacion reventando: sube su celda cada cuadro y, al llegar a 0x10, se retira; si su tipo era 5, en vez de retirarse se convierte en el bonus
	ld l,(ix+005h)		;d933
	ld h,(ix+006h)		;d936
	inc (hl)			;d939
	ld a,(hl)			;d93a
	cp 010h		;d93b
	ret c			;d93d
	ld a,(ix+002h)		;d93e
	cp 005h		;d941
	jp nz,retira_instalacion		;d943
	ld hl,inst_bonus		;d946
	ld (ix+003h),l		;d949
	ld (ix+004h),h		;d94c
	ret			;d94f
retira_instalacion:		; Retira la instalacion instalandole como rutina la direccion de un `ret` que ya existe en el codigo (0xD959): asi el bucle puede seguir llamando a todas sin preguntar
	ld hl,ld959h		;d950
	ld (ix+003h),l		;d953
	ld (ix+004h),h		;d956
L_D959:
	ret			;d959
inst_bonus:		; El bonus que deja una instalacion de tipo 5 al morir: espera a que la nave lo toque (cajas 0x0C x 0x10 y 2x4), marca su celda con 0x10 y paga 27 puntos. Si la barra de energia llega a 10, el disparo cuadruple esta apagado y el azar da 0 -una de cada cuatro-, ENCIENDE EL DISPARO CUADRUPLE (0xE14E) con el sonido 0xEA8C; si no, suma 10 de energia y repinta la barra
	ld a,(0c188h)		;d95a
	cp 004h		;d95d
	jp nc,L_D9CA		;d95f
	ld hl,(0c184h)		;d962
	push hl			;d965
	ld l,(ix+007h)		;d966
	ld de,00c10h		;d969
	ld bc,00204h		;d96c
	call solapa_eje		;d96f
	pop hl			;d972
	jr c,L_D9CA		;d973
	ld h,l			;d975
	ld a,(ix+000h)		;d976
	add a,a			;d979
	add a,a			;d97a
	add a,a			;d97b
	ld l,a			;d97c
	call solapa_eje		;d97d
	jr c,L_D9CA		;d980
	ld l,(ix+005h)		;d982
	ld h,(ix+006h)		;d985
	ld (hl),010h		;d988
	ld a,(0d3c1h)		;d98a
	cp 00ah		;d98d
	jr c,L_D9AC		;d98f
	ld a,(0e14eh)		;d991
	and a			;d994
	jr nz,L_D9AC		;d995
	call azar		;d997
	and 003h		;d99a
	jr nz,L_D9AC		;d99c
	inc a			;d99e
	ld (0e14eh),a		;d99f
	ld a,001h		;d9a2
	ld de,0ea8ch		;d9a4
	call arranca_guion_libre		;d9a7
	jr L_D9BF		;d9aa
L_D9AC:
	ld a,(0d3c1h)		;d9ac
	add a,00ah		;d9af
	ld (0d3c1h),a		;d9b1
	call pinta_energia		;d9b4
	ld a,001h		;d9b7
	ld de,0eaa1h		;d9b9
	call arranca_guion_libre		;d9bc
L_D9BF:
	ld hl,0dd85h		;d9bf
	ld b,01bh		;d9c2
	call premia		;d9c4
	jp retira_instalacion		;d9c7
L_D9CA:
	ld a,(0ca8eh)		;d9ca
	and 003h		;d9cd
	ret nz			;d9cf
	ld l,(ix+005h)		;d9d0
	ld h,(ix+006h)		;d9d3
	ld a,(hl)			;d9d6
	xor 001h		;d9d7
	ld (hl),a			;d9d9
	ret			;d9da
choca_con_nave4:		; La cuarta caja de contacto con la nave, y la unica alargada: 4x2 contra 0x38 x 0x0C en el primer eje y 7 contra 0x12 en el segundo
	ld a,(0c188h)		;d9db
	cp 004h		;d9de
	ret nc			;d9e0
	ld h,(ix+000h)		;d9e1
	sla h		;d9e4
	ld a,(0c185h)		;d9e6
	ld l,a			;d9e9
	ld de,0380ch		;d9ea
	ld bc,00402h		;d9ed
	call solapa_eje		;d9f0
	ret c			;d9f3
	ld h,(ix+001h)		;d9f4
	ld a,(0c184h)		;d9f7
	ld l,a			;d9fa
	ld d,012h		;d9fb
	ld b,007h		;d9fd
	call solapa_eje		;d9ff
	ret c			;da02
	jp mata_nave		;da03
descomprime_token:		; Expande un token del mapa comprimido: si el bit 7 esta a cero es un literal, que escribe en (ix+000) y avanza IX; si esta a uno, sus siete bits bajos son el numero de frase del diccionario de 0xDE18, adonde llega saltando de frase en frase por el tamano que cada una lleva en su primer byte, y la expande LLAMANDOSE A SI MISMA una vez por cada token que contenga, de modo que una frase puede contener otras. El 0xFF cierra el flujo y se come la vuelta con el `pop hl` de 0xDA31
	ld a,(hl)			;da06
	cp 0ffh		;da07
	jr z,L_DA31		;da09
	jp p,L_DA2A		;da0b
	push hl			;da0e
	ld hl,0de18h		;da0f
	ld d,000h		;da12
	and 07fh		;da14
	jr z,L_DA1D		;da16
	ld b,a			;da18
L_DA19:
	ld e,(hl)			;da19
	add hl,de			;da1a
	djnz L_DA19		;da1b
L_DA1D:
	ld b,(hl)			;da1d
	dec b			;da1e
	inc hl			;da1f
L_DA20:
	push bc			;da20
	call descomprime_token		;da21
	pop bc			;da24
	djnz L_DA20		;da25
	pop hl			;da27
	inc hl			;da28
	ret			;da29
L_DA2A:
	ld (ix+000h),a		;da2a
	inc ix		;da2d
	inc hl			;da2f
	ret			;da30
L_DA31:
	pop hl			;da31
	ret			;da32
descomprime_nivel:		; El bucle del descompresor de mapas: pone IX = 0x5C50 -el destino, la entrada 5 de la tabla de 6 en 6 que empieza en 0x5C32- y llama sin parar a descomprime_token sobre el flujo que carga_zona le deja en HL desde la tabla de zonas de 0xDE03 (`call L_DA33` en 0xBF03). No tiene salida propia: el 0xFF que cierra el flujo hace que descomprime_token se coma la vuelta con el `pop hl` de 0xDA31, asi que el `jp` de 0xDA3A no llega a repetirse y el control vuelve directo a 0xBF06. Las siete zonas expanden a 450 bytes justos, 75 filas de a seis
	ld ix,05c50h		;da33
L_DA37:
	call descomprime_token		;da37
	jp L_DA37		;da3a
tile_5D:		; La rutina de gobierno que el despachador de 0xC170 le da al tile 0x5D (`cp 05dh / ld de,0da3dh`), el que cierra la zona 7. Al decimo cuadro de vida -(ix+000), que recorre_tiles_especiales sube uno por cuadro, contra el `cp 00ah / ret c` de 0xDA40- CONGELA EL SCROLL poniendo 0xCB04 a cero, que es la puerta que mira repinta_fondo en 0xC42A antes de bajar una fila del mapa, levanta la bandera 0xDAC5 -que corta la aparicion de enemigos sueltos en 0xD420 y la creacion de tandas nuevas en 0xD82C- y se cambia a si misma la rutina de gobierno por la de 0xDA72
	ld a,(ix+000h)		;da3d
	cp 00ah		;da40
	ret c			;da42
	xor a			;da43
	ld (0cb04h),a		;da44
	inc a			;da47
	ld (0dac5h),a		;da48
	ld hl,tile_5D_espera		;da4b
	ld (ix+003h),l		;da4e
	ld (ix+004h),h		;da51
	ret			;da54
zona_despejada:		; Vuelve con Z solo si no queda nada en pantalla: 0xCA91 en 0x80 y los cinco contadores de objetos -0xC98F, 0xC97A, 0xC939, 0xC998 y 0xD3C5- todos a cero, juntados con OR
	ld a,(0ca91h)		;da55
	cp 080h		;da58
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
tile_5D_espera:		; El 0x5D esperando: cada cuadro repone (ix+000) a cero para no caducar nunca en el `cp 060h` de recorre_tiles_especiales, y no hace nada hasta que se dan tres condiciones a la vez -que zona_despejada diga que no queda nada, que la nave este en la columna 0x58 (la misma en la que la deja el arranque de zona con `ld hl,0a058h`) y que 0xC9A3 valga exactamente 8-. Cuando se cumplen, parchea el operando del `jp` de va_a_nave_estado (0xC064) para que el bucle principal llame a arrastra_nave en vez de a la nave, parchea el de pinta_escudo (0xD0DD) con el `ret` de 0xD959 para apagar el indicador -los dos mismos trampolines que hud_reset repone en 0xBE9F y 0xBEA8-, devuelve el scroll poniendo 0xCB04 = 8, siembra 0xC9A3 con 0x1F y se da de baja
	call zona_despejada		;da72
	ld (ix+000h),000h		;da75
	ret nz			;da79
	ld a,(0c184h)		;da7a
	cp 058h		;da7d
	ret nz			;da7f
	ld a,(0c9a3h)		;da80
	cp 008h		;da83
	ret nz			;da85
	ld hl,arrastra_nave		;da86
	ld (0c064h),hl		;da89
	ld hl,ld959h		;da8c
	ld (0d0ddh),hl		;da8f
	ld (0cb04h),a		;da92
	ld a,01fh		;da95
	ld (0c9a3h),a		;da97
	jp baja_tile_especial		;da9a
arrastra_nave:		; Lo que sustituye al gobierno de la nave en el cierre de la zona 7: pinta el sprite 8 en la posicion de la nave (0xC184/85) y el sprite 0x18 en esa misma columna a la altura que marca 0xC9A3 -reutilizado como coordenada desde que tile_5D_espera lo puso a 0x1F-, y baja esa altura de dos en dos cuadro a cuadro hasta el tope de 0xC8. En cuanto alcanza a la nave (`cp h` contra la Y de 0xC185) le impone su propia fila, o sea que la arrastra hacia abajo y la saca de la banda de juego, que acaba en 0xB1. Los dos sprites NO son la misma clase de cosa, aunque caigan en el mismo tramo: el 8 es la nave del jugador quieta y mirando hacia arriba -gira_rumbo remata con `or 008h`, o sea que los reposos de los ocho rumbos son 0x08 a 0x0F, y el rumbo 0 es arriba-, y por eso el relevo es continuo, con tile_5D_espera exigiendo justamente 0xC9A3 == 8 antes de disparar la escena; el 0x18, en cambio, no es ningun fotograma de vuelo -la aritmetica de gira_rumbo no lo alcanza nunca- sino CUATRO BARRAS HORIZONTALES blancas con trama de ajedrez entre ellas, un haz rayado del ancho de la nave, y el unico sitio de todo el bloque que lo pinta es esta rutina. O sea que lo que baja es el HAZ y lo que se arrastra es la NAVE
	ld hl,(0c184h)		;da9d
	push hl			;daa0
	ld a,008h		;daa1
	call pinta_sprite		;daa3
	pop hl			;daa6
	ld a,(0c9a3h)		;daa7
	push hl			;daaa
	push af			;daab
	ld h,a			;daac
	ld a,018h		;daad
	call pinta_sprite		;daaf
	pop af			;dab2
	pop hl			;dab3
	cp 0c8h		;dab4
	ret nc			;dab6
	inc a			;dab7
	inc a			;dab8
	cp h			;dab9
	jr c,L_DABD		;daba
	ld h,a			;dabc
L_DABD:
	ld (0c9a3h),a		;dabd
	ld a,h			;dac0
	ld (0c185h),a		;dac1
	ret			;dac4

; ----------------------------------------------------------------------
; DATOS textos_del_juego: Textos del juego: menu, redefinir teclas, records y
;   mensajes
;   0xdac5..0xdf0f  (1098 bytes)
DATA_textos_del_juego:
	defb 000h,00dh,001h,00ah,046h,045h,04ch,049h,043h,049h,044h,041h,044h,045h,053h,00dh	; dac5  ....FELICIDADES.
	defb 00dh,00dh,048h,041h,053h,020h,043h,04fh,04eh,053h,045h,047h,055h,049h,044h,04fh	; dad5  ..HAS CONSEGUIDO
	defb 020h,050h,045h,04eh,045h,054h,052h,041h,052h,00dh,00dh,04ch,041h,053h,020h,044h	; dae5   PENETRAR..LAS D
	defb 045h,046h,045h,04eh,053h,041h,053h,020h,044h,045h,020h,04ch,041h,020h,04eh,041h	; daf5  EFENSAS DE LA NA
	defb 056h,045h,00dh,00dh,001h,00ch,049h,04eh,053h,049h,047h,04eh,049h,041h,00dh,00dh	; db05  VE....INSIGNIA..
	defb 00dh,050h,045h,052h,04fh,020h,04ch,04fh,020h,050h,045h,04fh,052h,020h,041h,055h	; db15  .PERO LO PEOR AU
	defb 04eh,020h,04eh,04fh,020h,048h,041h,00dh,00dh,001h,00ch,04ch,04ch,045h,047h,041h	; db25  N NO HA....LLEGA
	defb 044h,04fh,00dh,00dh,00dh,001h,007h,050h,055h,04ch,053h,041h,020h,041h,04ch,047h	; db35  DO.....PULSA ALG
	defb 055h,04eh,041h,020h,054h,045h,043h,04ch,041h,00dh,00dh,053h,049h,020h,051h,055h	; db45  UNA TECLA..SI QU
	defb 049h,045h,052h,045h,053h,020h,044h,045h,053h,043h,055h,042h,052h,049h,052h,04ch	; db55  IERES DESCUBRIRL
	defb 04fh,00dh,000h,020h,020h,020h,020h,041h,042h,041h,04ah,04fh,020h,020h,020h,020h	; db65  O..    ABAJO    
	defb 020h,000h,000h,000h,000h,000h,000h,000h,00dh,00dh,020h,020h,020h,020h,041h,052h	; db75   .........    AR
	defb 052h,049h,042h,041h,020h,020h,020h,020h,000h,000h,000h,000h,000h,000h,000h,00dh	; db85  RIBA    ........
	defb 00dh,020h,020h,020h,020h,044h,045h,052h,045h,043h,048h,041h,020h,020h,020h,000h	; db95  .    DERECHA   .
	defb 000h,000h,000h,000h,000h,000h,00dh,00dh,020h,020h,020h,020h,049h,05ah,051h,055h	; dba5  ........    IZQU
	defb 049h,045h,052h,044h,041h,020h,000h,000h,000h,000h,000h,000h,000h,00dh,00dh,020h	; dbb5  IERDA ......... 
	defb 020h,020h,020h,044h,049h,053h,050h,041h,052h,04fh,020h,020h,020h,000h,000h,000h	; dbc5     DISPARO   ...
	defb 000h,000h,000h,000h,00dh,00dh,020h,020h,020h,020h,050h,041h,052h,041h,052h,020h	; dbd5  ......    PARAR 
	defb 020h,020h,020h,020h,000h,000h,000h,000h,000h,000h,000h,00dh,00dh,020h,020h,020h	; dbe5      .........   
	defb 020h,041h,042h,041h,04eh,044h,04fh,04eh,041h,052h,020h,000h,000h,000h,000h,000h	; dbf5   ABANDONAR .....
	defb 000h,000h,00dh,000h,030h,031h,032h,033h,034h,035h,036h,037h,038h,039h,02dh,03dh	; dc05  ....0123456789-=
	defb 023h,022h,024h,026h,027h,03bh,02ch,02eh,02fh,025h,041h,042h,043h,044h,045h,046h	; dc15  #"$&';,./%ABCDEF
	defb 047h,048h,049h,04ah,04bh,04ch,04dh,04eh,04fh,050h,051h,052h,053h,054h,055h,056h	; dc25  GHIJKLMNOPQRSTUV
	defb 057h,058h,059h,05ah,001h,002h,003h,004h,005h,006h,007h,008h,009h,00ah,00bh,00ch	; dc35  WXYZ............
	defb 00dh,00eh,00fh,010h,011h,012h,013h,014h,020h,020h,020h,020h,020h,053h,048h,049h	; dc45  ........     SHI
	defb 046h,054h,000h,043h,054h,052h,04ch,000h,047h,052h,041h,050h,048h,000h,043h,041h	; dc55  FT.CTRL.GRAPH.CA
	defb 050h,053h,000h,043h,04fh,044h,045h,000h,046h,020h,031h,000h,046h,020h,032h,000h	; dc65  PS.CODE.F 1.F 2.
	defb 046h,020h,033h,000h,046h,020h,034h,000h,046h,020h,035h,000h,045h,053h,043h,000h	; dc75  F 3.F 4.F 5.ESC.
	defb 054h,041h,042h,000h,053h,054h,04fh,050h,000h,042h,053h,000h,053h,045h,04ch,045h	; dc85  TAB.STOP.BS.SELE
	defb 043h,054h,000h,045h,04eh,054h,045h,052h,000h,053h,050h,041h,043h,045h,000h,048h	; dc95  CT.ENTER.SPACE.H
	defb 04fh,04dh,045h,000h,049h,04eh,053h,000h,044h,045h,04ch,000h,040h,0f2h,040h,0f4h	; dca5  OME.INS.DEL.@.@.
	defb 020h,0f4h,010h,0f4h,001h,0f8h,020h,0f3h,010h,0f3h,000h,000h,000h,000h,000h,000h	; dcb5   ..... .........
	defb 000h,053h,054h,041h,052h,044h,055h,053h,054h,000h,04ah,04fh,059h,053h,054h,049h	; dcc5  .STARDUST.JOYSTI
	defb 043h,04bh,000h,054h,045h,043h,04ch,041h,044h,04fh,000h,052h,045h,044h,045h,046h	; dcd5  CK.TECLADO.REDEF
	defb 049h,04eh,049h,052h,020h,054h,045h,043h,04ch,041h,053h,000h,04ah,055h,047h,041h	; dce5  INIR TECLAS.JUGA
	defb 052h,000h,03ch,03eh,03eh,03eh,03eh,03eh,03eh,03eh,000h,03ch,03eh,03eh,03eh,03eh	; dcf5  R.<>>>>>>>.<>>>>
	defb 03eh,03eh,000h,04ah,041h,056h,049h,045h,052h,020h,020h,031h,030h,030h,030h,030h	; dd05  >>.JAVIER  10000
	defb 030h,000h,04ah,055h,041h,04eh,020h,043h,020h,020h,030h,038h,030h,030h,030h,030h	; dd15  0.JUAN C  080000
	defb 000h,04dh,041h,052h,054h,041h,020h,020h,020h,030h,036h,030h,030h,030h,030h,000h	; dd25  .MARTA   060000.
	defb 04dh,041h,052h,049h,041h,020h,020h,020h,030h,035h,030h,030h,030h,030h,000h,020h	; dd35  MARIA   050000. 
	defb 020h,020h,020h,020h,020h,020h,020h,030h,034h,030h,030h,030h,030h,000h,020h,054h	; dd45         040000. T
	defb 04fh,050h,04fh,020h,020h,020h,030h,033h,030h,030h,030h,030h,000h,020h,053h,04fh	; dd55  OPO   030000. SO
	defb 046h,054h,020h,020h,020h,030h,032h,030h,030h,030h,030h,000h,020h,020h,020h,020h	; dd65  FT   020000.    
	defb 020h,020h,020h,020h,030h,031h,030h,030h,030h,030h,000h,030h,030h,030h,030h,030h	; dd75      010000.00000
	defb 030h,000h,001h,00bh,042h,020h,052h,020h,041h,020h,056h,020h,04fh,00dh,00dh,00dh	; dd85  0...B R A V O...
	defb 00dh,001h,007h,048h,041h,053h,020h,043h,04fh,04eh,053h,045h,047h,055h,049h,044h	; dd95  ...HAS CONSEGUID
	defb 04fh,020h,055h,04eh,041h,00dh,00dh,001h,009h,044h,045h,020h,04ch,041h,053h,020h	; dda5  O UNA....DE LAS 
	defb 04dh,045h,04ah,04fh,052h,045h,053h,00dh,00dh,001h,006h,050h,055h,04eh,054h,055h	; ddb5  MEJORES....PUNTU
	defb 041h,043h,049h,04fh,04eh,045h,053h,020h,020h,044h,045h,020h,048h,04fh,059h,00dh	; ddc5  ACIONES  DE HOY.
	defb 00dh,00dh,001h,007h,045h,053h,043h,052h,049h,042h,045h,020h,020h,054h,055h,020h	; ddd5  ....ESCRIBE  TU 
	defb 04eh,04fh,04dh,042h,052h,045h,00dh,00dh,00dh,00dh,001h,00dh,000h,044h,045h,04dh	; dde5  NOMBRE.......DEM
	defb 04fh,000h,000h,042h,04fh,04eh,055h,053h,020h,035h,030h,030h,030h,000h,0d8h,061h	; ddf5  O..BONUS 5000..a
	defb 0a1h,0d7h,062h,0f1h,0d4h,063h,071h,0d4h,064h,0a1h,0dbh,065h,0f1h,0eah,066h,071h	; de05  ..b..cq.d..e..fq
	defb 0e4h,067h,0a1h,003h,000h,000h,003h,000h,080h,003h,080h,080h,003h,098h,000h,003h	; de15  .g..............
	defb 083h,083h,003h,015h,015h,003h,014h,014h,003h,006h,005h,003h,0ach,009h,003h,001h	; de25  ................
	defb 002h,003h,01eh,021h,003h,01dh,01eh,003h,004h,004h,003h,003h,003h,003h,010h,011h	; de35  ...!............
	defb 003h,0aeh,005h,003h,0aeh,0afh,003h,002h,000h,003h,000h,001h,003h,006h,026h,003h	; de45  ..............&.
	defb 025h,005h,003h,008h,027h,003h,024h,009h,004h,013h,019h,013h,003h,000h,015h,003h	; de55  %...'.$.........
	defb 015h,000h,003h,026h,025h,003h,027h,024h,003h,002h,017h,003h,017h,001h,003h,022h	; de65  ...&%.'$......."
	defb 001h,003h,005h,006h,003h,025h,026h,003h,00eh,00fh,004h,091h,089h,092h,004h,080h	; de75  .....%&.........
	defb 086h,080h,004h,098h,089h,099h,003h,03bh,03bh,003h,024h,027h,003h,025h,004h,003h	; de85  .......;;.$'.%..
	defb 004h,026h,003h,024h,003h,003h,003h,027h,003h,091h,092h,003h,008h,003h,003h,003h	; de95  .&.$...'........
	defb 009h,003h,006h,004h,003h,004h,005h,003h,0ach,0adh,004h,0ach,08dh,0adh,004h,000h	; dea5  ................
	defb 093h,094h,003h,095h,096h,004h,0ach,09bh,0adh,004h,081h,089h,080h,004h,091h,080h	; deb5  ................
	defb 092h,004h,096h,080h,095h,003h,00dh,001h,003h,00ch,001h,003h,032h,032h,003h,036h	; dec5  ............22.6
	defb 036h,003h,04ah,04bh,003h,052h,053h,003h,00eh,003h,003h,003h,00fh,003h,010h,004h	; ded5  6.JK.RS.........
	defb 003h,004h,011h,003h,01ah,01ah,003h,04ch,04dh,003h,048h,049h,003h,050h,051h,003h	; dee5  .......LM.HI.PQ.
	defb 04eh,058h,003h,058h,04fh,003h,05ah,058h,003h,058h,05bh,003h,059h,059h,004h,02eh	; def5  NX.XO.ZX.X[.YY..
	defb 018h,02fh,004h,060h,061h,062h,004h,068h,069h,06ah	; df05  ./.`ab.hij

; ======================================================================
; CODIGO 0xdf0f..0xe14e  (575 bytes)
; ======================================================================


mueve_disparos:		; Recorre los disparos de 0xC999 (contador en 0xC998, dos como maximo): los mueve, y al cruzar el borde del piso -Y+10 contra 0x7C- los pinta ya como impacto, con el sprite base 0x69
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
	cp 07ch		;df2c
	jr c,L_DF48		;df2e
	ex de,hl			;df30
	ld bc,00404h		;df31
	sbc hl,bc		;df34
	sub 069h		;df36
	call pinta_sprite		;df38
	inc (ix+000h)		;df3b
	ld a,(ix+000h)		;df3e
	cp 080h		;df41
	jr c,L_DFA6		;df43
	jp L_DFB1		;df45
L_DF48:
	ld a,(ix+004h)		;df48
	cp 0b4h		;df4b
	jr nc,L_DF52		;df4d
	ld hl,0ff60h		;df4f
L_DF52:
	ex de,hl			;df52
	call persigue_con_velocidad		;df53
	ex de,hl			;df56
	ld a,d			;df57
	cp 0e0h		;df58
	jr nc,L_DFB1		;df5a
	ld (ix+000h),c		;df5c
	ld (ix+001h),b		;df5f
	ld (ix+002h),e		;df62
	ld (ix+003h),d		;df65
	ld a,(ix+004h)		;df68
	and 001h		;df6b
	dec (ix+004h)		;df6d
	ex de,hl			;df70
	call pinta_glifo		;df71
	call disparo_derriba_tiro		;df74
	ld a,(0c188h)		;df77
	cp 004h		;df7a
	jr nc,L_DFA6		;df7c
	ld l,(ix+002h)		;df7e
	ld h,(ix+003h)		;df81
	push hl			;df84
	ld a,(0c185h)		;df85
	ld l,a			;df88
	ld de,0040ah		;df89
	ld bc,00203h		;df8c
	call solapa_eje		;df8f
	pop hl			;df92
	jr c,L_DFA6		;df93
	ld h,l			;df95
	ld a,(0c184h)		;df96
	ld l,a			;df99
	call solapa_eje		;df9a
	jr c,L_DFA6		;df9d
	call impacto_doble		;df9f
	ld (ix+000h),07ch		;dfa2
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
	dec (hl)			;dfb4
	pop bc			;dfb5
	push bc			;dfb6
	ld a,b			;dfb7
	cp 001h		;dfb8
	jr z,L_DFAB		;dfba
	push ix		;dfbc
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
	ex de,hl			;dfcd
	pop de			;dfce
	ldir		;dfcf
	jp L_DFAB		;dfd1
tile_37:		; El tile 0x37: mira si le han dado y, una vez de cada 32, pasa al estado siguiente
	call impacto_objeto		;dfd4
	call azar		;dfd7
	and 01fh		;dfda
	ret nz			;dfdc
	ld hl,tile_37b		;dfdd
	ld (ix+003h),l		;dfe0
	ld (ix+004h),h		;dfe3
	ret			;dfe6
tile_37b:		; El 0x37 creciendo: sube su tile en el mapa un punto por cuadro hasta llegar a 0x3B, y entonces se convierte en el comportamiento del 0x3B
	inc (ix+002h)		;dfe7
	call impacto_objeto		;dfea
	ld l,(ix+005h)		;dfed
	ld h,(ix+006h)		;dff0
	inc (hl)			;dff3
	ld a,(hl)			;dff4
	cp 03bh		;dff5
	ret c			;dff7
	ld hl,tile_3B		;dff8
	ld (ix+003h),l		;dffb
	ld (ix+004h),h		;dffe
	ret			;e001
tile_3B:		; El tile 0x3B: una vez de cada 32 suelta un enemigo desde su posicion mas 0x0C0C, con el rumbo apuntado a la nave (rumbo_hacia sobre 0xC184)
	call impacto_objeto		;e002
	call azar		;e005
	and 01fh		;e008
	ret nz			;e00a
	ld l,(ix+001h)		;e00b
	ld h,(ix+000h)		;e00e
	sla h		;e011
	ld bc,00c0ch		;e013
	add hl,bc			;e016
	ld b,h			;e017
	ld c,l			;e018
	push bc			;e019
	ld de,(0c184h)		;e01a
	call rumbo_hacia		;e01e
	call rumbo_a_mascara2		;e021
	ex af,af'			;e024
	pop bc			;e025
	call alta_enemigo		;e026
	ret			;e029
tile_3C:		; El tile 0x3C: cuando su columna llega a 0x10 pasa al estado comun de 0xE03D
	call impacto_objeto		;e02a
	ld a,(ix+000h)		;e02d
	cp 010h		;e030
	ret c			;e032
	ld hl,tile_est5		;e033
	ld (ix+003h),l		;e036
	ld (ix+004h),h		;e039
	ret			;e03c
tile_est5:		; El estado comun que instalan tanto el tile 0x3C (0xE033) como el 0x32 (0xE086): mira el contacto y, en los cuadros impares de 0xCA8E, sigue en 0xE045
	call impacto_objeto		;e03d
	ld a,(0ca8eh)		;e040
	and 001h		;e043
	ret nz			;e045
	inc (ix+002h)		;e046
	ld l,(ix+005h)		;e049
	ld h,(ix+006h)		;e04c
	inc (hl)			;e04f
	ld a,(hl)			;e050
	cp 042h		;e051
	ret c			;e053
	ld hl,tile_est4		;e054
	ld (ix+003h),l		;e057
	ld (ix+004h),h		;e05a
	ret			;e05d
tile_est4:		; Una vez de cada 32 dispara desde su posicion mas 0x0C0C; si el disparo entra, se pone el tile 0x3F y pasa al estado comun de 0xE03D
	call impacto_objeto		;e05e
	call azar		;e061
	and 01fh		;e064
	ret nz			;e066
	ld l,(ix+001h)		;e067
	ld h,(ix+000h)		;e06a
	sla h		;e06d
	ld bc,00c0ch		;e06f
	add hl,bc			;e072
	ld b,h			;e073
	ld c,l			;e074
	xor a			;e075
	ex af,af'			;e076
	call alta_disparo		;e077
	ret nc			;e07a
	ld a,03fh		;e07b
	ld (ix+002h),a		;e07d
	ld l,(ix+005h)		;e080
	ld h,(ix+006h)		;e083
	ld (hl),a			;e086
	ld hl,tile_est5		;e087
	ld (ix+003h),l		;e08a
	ld (ix+004h),h		;e08d
	ret			;e090
tile_32:		; El tile 0x32: hasta la columna 0x28 y una vez de cada 16, suelta al azar un objeto en la tabla de 0xC990 (con A'=0x1E) o en la de 0xC97B (con A'=0x1B), y pasa a tile_est6
	call choca_con_nave4		;e091
	ld a,(ix+000h)		;e094
	cp 028h		;e097
	ret nc			;e099
	call azar		;e09a
	and 00fh		;e09d
	ret nz			;e09f
	ld l,(ix+001h)		;e0a0
	ld h,(ix+000h)		;e0a3
	sla h		;e0a6
	ld bc,05008h		;e0a8
	add hl,bc			;e0ab
	ld b,h			;e0ac
	ld c,l			;e0ad
	call azar		;e0ae
	and 004h		;e0b1
	jr z,L_E0BE		;e0b3
	ld a,01eh		;e0b5
	ex af,af'			;e0b7
	call alta_objeto_c990		;e0b8
	jp L_E0C4		;e0bb
L_E0BE:
	ld a,01bh		;e0be
	ex af,af'			;e0c0
	call alta_bandada		;e0c1
L_E0C4:
	ret nc			;e0c4
	ld hl,tile_est6		;e0c5
	ld (ix+003h),l		;e0c8
	ld (ix+004h),h		;e0cb
	ret			;e0ce
tile_est6:		; El 0x32 animandose: suena 0xEA98 y sube su tile de 0x32 a 0x35; al llegar a 0x36 lo devuelve a 0x32 y vuelve a ser tile_32
	call choca_con_nave4		;e0cf
	inc (ix+002h)		;e0d2
	ld a,001h		;e0d5
	ld de,0ea98h		;e0d7
	call arranca_guion_libre		;e0da
	ld l,(ix+005h)		;e0dd
	ld h,(ix+006h)		;e0e0
	inc (hl)			;e0e3
	ld a,(hl)			;e0e4
	cp 036h		;e0e5
	ret c			;e0e7
	ld a,032h		;e0e8
	ld (hl),a			;e0ea
	ld (ix+002h),a		;e0eb
	ld hl,tile_32		;e0ee
	ld (ix+003h),l		;e0f1
	ld (ix+004h),h		;e0f4
	ret			;e0f7
dispara:		; Mete disparos en la tabla del jugador (0xC953) en la posicion de la nave mas 0x0404, y solo en el FLANCO de subida del gatillo: guarda el estado en 0xE14F y se va si no esta pulsado o si ya lo estaba. Con la mejora de 0xE14E encendida suelta CUATRO, en los rumbos base, +4, +6 y +2
	bit 4,a		;e0f8
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
	add hl,bc			;e118
	ld b,h			;e119
	ld c,l			;e11a
	ex af,af'			;e11b
	call alta_objeto_c952		;e11c
	add a,004h		;e11f
	and 007h		;e121
	ex af,af'			;e123
	ld a,(0e14eh)		;e124
	and a			;e127
	jr z,L_E148		;e128
	ld a,0c9h		;e12a
	ld (0e190h),a		;e12c
	call alta_objeto_c952		;e12f
	add a,002h		;e132
	and 007h		;e134
	ex af,af'			;e136
	call alta_objeto_c952		;e137
	add a,004h		;e13a
	and 007h		;e13c
	ex af,af'			;e13e
	call alta_objeto_c952		;e13f
	ld a,(0e1bdh)		;e142
	ld (0e190h),a		;e145
L_E148:
	call arranca_estela		;e148
	pop hl			;e14b
	pop af			;e14c
	ret			;e14d

; ----------------------------------------------------------------------
; DATOS relleno_E14E: Relleno (12 B; 12 de 12 bytes son 0x00)
;   0xe14e..0xe15a  (12 bytes)
DATA_relleno_E14E:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; e14e  ............

; ======================================================================
; CODIGO 0xe15a..0xe5e2  (1160 bytes)
; ======================================================================


interrupcion:		; El epilogo de la interrupcion, lo que el arranque engancha en H.TIMI (0xBD9D mete 0xC3 en 0xFD9F y 0xBDA3 la direccion en 0xFDA0, con H.KEYI ya tapado con un `ret`): corta con `di`, tira con `pop hl` la vuelta a la ROM, llama a tic_sonido y desapila los DIEZ pares que el manejador de la BIOS habia guardado -IX, IY, AF, BC, DE, HL y, tras `ex af,af` y `exx`, los cuatro alternos-, de modo que el `ei / ret` de 0xE16D vuelve de la interrupcion sin pasar por el resto del manejador. Gemela de la interrupcion de la fase de a pie (0xC46E): 21 bytes, y las dos unicas diferencias son el operando del `call`
	di			;e15a
	pop hl			;e15b
	call tic_sonido		;e15c
	pop ix		;e15f
	pop iy		;e161
	pop af			;e163
	pop bc			;e164
	pop de			;e165
	pop hl			;e166
	ex af,af'			;e167
	exx			;e168
	pop af			;e169
	pop bc			;e16a
	pop de			;e16b
	pop hl			;e16c
	ei			;e16d
	ret			;e16e
arranca_musica:		; Instala la musica de la partida de golpe: canal 0 <- 0xEB52, canal 1 <- 0xEC4A, canal 2 <- 0xECCB. Medido en el emulador, es exactamente lo que se ve arrancar (ver el bloque de la partitura)
	ld a,080h		;e16f
	ld de,0eb52h		;e171
	call arranca_guion		;e174
	inc a			;e177
	ld de,0ec4ah		;e178
	call arranca_guion		;e17b
	ld a,002h		;e17e
	ld de,0eccbh		;e180
	call arranca_guion		;e183
sonido_off:		; Cierra el sonido metiendo un `ret` (0xC9) en la cabecera de arranca_guion y arranca_guion_libre: no se puede arrancar nada mas
	ld a,0c9h		;e186
	ld (arranca_guion),a		;e188
	ld (arranca_guion_libre),a		;e18b
	ret			;e18e
arranca_guion_libre:		; arranca_guion, pero respetando lo que suena: si el canal pedido esta ocupado -sus dos primeros bytes no son cero- recorre los TRES buscando uno libre, y solo pisa el pedido si no queda ninguno
	di			;e18f
	push af			;e190
	push de			;e191
	and 07fh		;e192
	ld de,0002eh		;e194
	call mul_a_de		;e197
	ld de,0ed75h		;e19a
	add hl,de			;e19d
	push hl			;e19e
	ld a,(hl)			;e19f
	inc hl			;e1a0
	or (hl)			;e1a1
	jr z,L_E1B6		;e1a2
	ld d,003h		;e1a4
	ld hl,0ed75h		;e1a6
	ld bc,0002eh		;e1a9
L_E1AC:
	inc hl			;e1ac
	ld a,(hl)			;e1ad
	dec hl			;e1ae
	or (hl)			;e1af
	jr z,L_E1B9		;e1b0
	add hl,bc			;e1b2
	dec d			;e1b3
	jr nz,L_E1AC		;e1b4
L_E1B6:
	pop hl			;e1b6
	jr L_E1CB		;e1b7
L_E1B9:
	pop de			;e1b9
	jr L_E1CB		;e1ba
arranca_guion:		; Pone el guion DE a sonar en el canal A (bit 7 = volver sin `ei`): borra los 46 bytes de su estado en 0xED75+canal*46 y siembra el puntero de ejecucion y el de inicio
	di			;e1bc
	push af			;e1bd
	push de			;e1be
	and 07fh		;e1bf
	ld de,0002eh		;e1c1
	call mul_a_de		;e1c4
	ld de,0ed75h		;e1c7
	add hl,de			;e1ca
L_E1CB:
	push hl			;e1cb
	xor a			;e1cc
	ld b,02eh		;e1cd
L_E1CF:
	ld (hl),a			;e1cf
	inc hl			;e1d0
	djnz L_E1CF		;e1d1
	pop hl			;e1d3
	pop de			;e1d4
	ld (hl),e			;e1d5
	inc hl			;e1d6
	ld (hl),d			;e1d7
	inc hl			;e1d8
	ld (hl),e			;e1d9
	inc hl			;e1da
	ld (hl),d			;e1db
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
tic_sonido:		; El motor del sonido, que la interrupcion llama cincuenta veces por segundo: recorre los tres canales desde 0xED75, gasta la duracion de (ix+004/005) y, al agotarse, apaga el mezclador y va a por el siguiente comando del guion
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
	call mezclador_canal		;e214
	ld c,(ix+002h)		;e217
	ld b,(ix+003h)		;e21a
	ld a,b			;e21d
	or c			;e21e
	jp z,L_E327		;e21f
L_E222:
	ld a,(bc)			;e222
	cp 080h		;e223
	jp c,lee_nota		;e225
	sub 080h		;e228
	ld hl,0e7a3h		;e22a
	call lee_puntero		;e22d
	jp (hl)			;e230
lee_nota:		; Un byte por debajo de 0x80 es una nota: le suma la transposicion de 0xEE21+canal, busca el periodo en la tabla de 0xE6E3 y lo deja en (ix+00A/00B)
	push af			;e231
	call entrada_transporte		;e232
	pop af			;e235
	add a,(hl)			;e236
	ld hl,0e6e3h		;e237
	call lee_puntero		;e23a
	ld (ix+00ah),l		;e23d
	ld (ix+00bh),h		;e240
	inc bc			;e243
ataca_nota:		; El ataque: abre tono y ruido en el mezclador, monta la envolvente del instrumento y la pone a cero. Es justo lo que se salta el comando 0x84
	ld a,(ix+008h)		;e244
	call mezclador_canal		;e247
	call carga_envolvente_1		;e24a
	ld (ix+02ah),000h		;e24d
	call carga_envolvente_2		;e251
	ld (ix+02bh),000h		;e254
	ld (ix+02ch),000h		;e258
arranca_duracion:		; Guarda el puntero del guion en (ix+002/003) y recarga la cuenta atras de la duracion (ix+004/005) desde (ix+006/007)
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
	push ix		;e27b
	pop iy		;e27d
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
	inc iy		;e2ac
	dec d			;e2ae
	jr nz,L_E283		;e2af
L_E2B1:
	ld a,c			;e2b1
	or a			;e2b2
	jr nz,L_E2BC		;e2b3
	bit 0,(ix+02dh)		;e2b5
	call nz,carga_envolvente_1		;e2b9
L_E2BC:
	push ix		;e2bc
	pop iy		;e2be
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
	inc iy		;e317
	dec d			;e319
	jr nz,L_E2C4		;e31a
L_E31C:
	ld a,c			;e31c
	or a			;e31d
	jr nz,L_E327		;e31e
	bit 1,(ix+02dh)		;e320
	call nz,carga_envolvente_2		;e324
L_E327:
	pop bc			;e327
	pop de			;e328
	pop hl			;e329
	ld a,(ix+009h)		;e32a
	add a,(ix+02ah)		;e32d
	and 00fh		;e330
	ld (hl),a			;e332
	ld a,(ix+00ah)		;e333
	add a,(ix+02bh)		;e336
	ld (de),a			;e339
	inc de			;e33a
	ld a,(ix+00bh)		;e33b
	adc a,(ix+02ch)		;e33e
	ld (de),a			;e341
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
	inc iy		;e382
	dec d			;e384
	jr nz,L_E359		;e385
L_E387:
	ld a,c			;e387
	or a			;e388
	jr nz,L_E393		;e389
	ld a,(0ee09h)		;e38b
	bit 2,a		;e38e
	call nz,refresca_globales_sonido		;e390
L_E393:
	ld a,(0ee0ah)		;e393
	ld e,a			;e396
	ld a,(0ee0bh)		;e397
	add a,e			;e39a
	ld (0ee13h),a		;e39b
	call vuelca_psg		;e39e
	pop af			;e3a1
	ret			;e3a2
carga_envolvente_1:		; Copia dos parejas de la plantilla del instrumento a las variables vivas: (ix+020) a (ix+00C) y (ix+016) a (ix+00E)
	push ix		;e3a3
	ld d,002h		;e3a5
L_E3A7:
	ld a,(ix+020h)		;e3a7
	ld (ix+00ch),a		;e3aa
	ld a,(ix+016h)		;e3ad
	ld (ix+00eh),a		;e3b0
	inc ix		;e3b3
	dec d			;e3b5
	jr nz,L_E3A7		;e3b6
	pop ix		;e3b8
	ret			;e3ba
carga_envolvente_2:		; Lo mismo con tres: (ix+022) a (ix+010) y (ix+018) a (ix+013)
	ld d,003h		;e3bb
	push ix		;e3bd
L_E3BF:
	ld a,(ix+022h)		;e3bf
	ld (ix+010h),a		;e3c2
	ld a,(ix+018h)		;e3c5
	ld (ix+013h),a		;e3c8
	inc ix		;e3cb
	dec d			;e3cd
	jr nz,L_E3BF		;e3ce
	pop ix		;e3d0
	ret			;e3d2
refresca_globales_sonido:		; Copia (iy+008) a (iy+000) y (iy+004) a (iy+002) dos veces desde 0xEDFF: las variables globales del sonido que el fin de voz limpia
	ld d,002h		;e3d3
	push iy		;e3d5
	ld iy,0edffh		;e3d7
L_E3DB:
	ld a,(iy+008h)		;e3db
	ld (iy+000h),a		;e3de
	ld a,(iy+004h)		;e3e1
	ld (iy+002h),a		;e3e4
	inc iy		;e3e7
	dec d			;e3e9
	jr nz,L_E3DB		;e3ea
	pop iy		;e3ec
	ret			;e3ee
op_volumen:		; 0x80 n: mete el argumento en (ix+009), el byte que la lectura de la partitura toma por volumen
	inc bc			;e3ef
	ld a,(bc)			;e3f0
	ld (ix+009h),a		;e3f1
	inc bc			;e3f4
	jp L_E222		;e3f5
op_duracion:		; 0x83 n: (ix+006/007) = argumento por el tempo de 0xEE18. La duracion no esta en cuadros, esta en unidades de tempo
	inc bc			;e3f8
	ld a,(bc)			;e3f9
	ld de,(0ee18h)		;e3fa
	ld d,000h		;e3fe
	call mul_a_de		;e400
	ld (ix+006h),l		;e403
	ld (ix+007h),h		;e406
	inc bc			;e409
	jp L_E222		;e40a
op_tono_ruido:		; 0x81 n: (ix+008) = argumento and 0x09, que es justo la pareja de bits -tono y ruido- que el mezclador desplaza por canal
	inc bc			;e40d
	ld a,(bc)			;e40e
	and 009h		;e40f
	ld (ix+008h),a		;e411
	inc bc			;e414
	jp L_E222		;e415
op_fin:		; 0x8B: cierra la voz borrando los 46 bytes de su estado y reponiendo el `di` en arranca_guion y arranca_guion_libre; si era la ultima que sonaba, limpia tambien las variables de 0xEDFF
	push ix		;e418
	pop hl			;e41a
	xor a			;e41b
	ld b,02eh		;e41c
L_E41E:
	ld (hl),a			;e41e
	inc hl			;e41f
	djnz L_E41E		;e420
	ld a,0f3h		;e422
	ld (arranca_guion_libre),a		;e424
	ld (arranca_guion),a		;e427
	ld a,(0ee19h)		;e42a
	ld hl,0ee0ch		;e42d
	xor (hl)			;e430
	jp nz,L_E327		;e431
	ld hl,0edffh		;e434
	ld de,0ee00h		;e437
	ld bc,0000ah		;e43a
	ld (hl),a			;e43d
	ldir		;e43e
	inc de			;e440
	ld (de),a			;e441
	jp L_E327		;e442
op_tempo:		; 0x85 n: 0xEE18 = 6000 / (argumento * 8), con la division de div_bc_de
	inc bc			;e445
	ld a,(bc)			;e446
	push bc			;e447
	ld de,00008h		;e448
	call mul_a_de		;e44b
	ld bc,01770h		;e44e
	push hl			;e451
	pop de			;e452
	call div_bc_de		;e453
	ld a,c			;e456
	ld (0ee18h),a		;e457
	pop bc			;e45a
	inc bc			;e45b
	jp L_E222		;e45c
op_ruido:		; 0x88 n: 0xEE0A = argumento and 0x1F, los cinco bits del registro de ruido del PSG. El bit 7 del argumento decide por donde sigue el interprete
	inc bc			;e45f
	ld a,(bc)			;e460
	push af			;e461
	and 01fh		;e462
	ld (0ee0ah),a		;e464
	call refresca_globales_sonido		;e467
	pop af			;e46a
	inc bc			;e46b
	or a			;e46c
	jp m,L_E222		;e46d
	jp ataca_nota		;e470
op_liga:		; 0x84: sin argumento. Cuenta una duracion mas SIN reatacar, porque vuelve por 0xE25C y se salta el tramo del ataque: ni mezclador, ni instrumento, ni envolvente a cero. Lo que estuviera sonando sigue igual
	inc bc			;e473
	jp arranca_duracion		;e474
op_bucle:		; 0x82: vuelve al principio del guion recargando (ix+002/003) con (ix+000/001). NO es un terminador: solo acaba si va por el canal 1 y ademas 0xEE1A esta a cero
	ld a,(0ee19h)		;e477
	dec a			;e47a
	jr nz,L_E483		;e47b
	ld a,(0ee1ah)		;e47d
	and a			;e480
	jr z,op_fin		;e481
L_E483:
	ld c,(ix+000h)		;e483
	ld b,(ix+001h)		;e486
	ld (ix+002h),c		;e489
	ld (ix+003h),b		;e48c
	jp L_E222		;e48f
op_banderas:		; 0x8A n: enciende bits, con OR y sin apagar nada, en las banderas del canal (ix+02D) y en las globales de 0xEE09
	inc bc			;e492
	ld a,(bc)			;e493
	ld e,a			;e494
	or (ix+02dh)		;e495
	ld (ix+02dh),a		;e498
	ld a,(0ee09h)		;e49b
	or e			;e49e
	ld (0ee09h),a		;e49f
	inc bc			;e4a2
	jp L_E222		;e4a3
op_instrumento:		; 0x87 n: copia los QUINCE bytes del instrumento n -que vive en 0xE5E2 + n*15- a (ix+016) y siguientes, y de paso limpia los bits 0 y 1 de las banderas
	inc bc			;e4a6
	res 0,(ix+02dh)		;e4a7
	res 1,(ix+02dh)		;e4ab
	ld a,(bc)			;e4af
	ld de,0000fh		;e4b0
	call mul_a_de		;e4b3
	ld de,0e5e2h		;e4b6
	add hl,de			;e4b9
	push ix		;e4ba
	ld d,00fh		;e4bc
L_E4BE:
	ld a,(hl)			;e4be
	ld (ix+016h),a		;e4bf
	inc hl			;e4c2
	inc ix		;e4c3
	dec d			;e4c5
	jp nz,L_E4BE		;e4c6
	pop ix		;e4c9
	inc bc			;e4cb
	ld (ix+00ch),000h		;e4cc
	ld (ix+00dh),000h		;e4d0
	ld (ix+010h),000h		;e4d4
	ld (ix+011h),000h		;e4d8
	ld (ix+012h),000h		;e4dc
	ld (ix+02ah),000h		;e4e0
	ld (ix+02bh),000h		;e4e4
	ld (ix+02ch),000h		;e4e8
	jp L_E222		;e4ec
op_efecto:		; 0x89 n: arranca el barrido de ruido. Copia los seis bytes de la entrada 0xE6D2 + n*6 a 0xEE03-0xEE08 -por parejas, porque son dos etapas entrelazadas: las dos recargas del contador de pasos, los dos pasos y las dos recargas de la espera-, pone a cero los dos contadores vivos de 0xEDFF/0xEE00 y el acumulador 0xEE0B -el que se suma a 0xEE0A para dar el periodo de ruido en 0xEE13-, y apunta en 0xEE0C el canal de 0xEE19, que queda de dueno: es el que op_fin compara para saber si al cerrarse debe limpiar el bloque. Ademas APAGA el bit 2 de 0xEE09, que es el que hace que el barrido se recargue solo al agotarse (`bit 2,a / call nz,refresca_globales_sonido` en 0xE38E), asi que de serie suena una vez; quien lo vuelve a encender es op_banderas
	inc bc			;e4ef
	ld a,(0ee09h)		;e4f0
	res 2,a		;e4f3
	ld (0ee09h),a		;e4f5
	ld a,(bc)			;e4f8
	ld de,00006h		;e4f9
	call mul_a_de		;e4fc
	ld de,0e6d2h		;e4ff
	add hl,de			;e502
	ld iy,0edffh		;e503
	ld (iy+000h),000h		;e507
	ld (iy+001h),000h		;e50b
	ld d,006h		;e50f
L_E511:
	ld a,(hl)			;e511
	ld (iy+004h),a		;e512
	inc hl			;e515
	inc iy		;e516
	dec d			;e518
	jr nz,L_E511		;e519
	xor a			;e51b
	ld (0ee0bh),a		;e51c
	inc bc			;e51f
	ld a,(0ee19h)		;e520
	ld (0ee0ch),a		;e523
	jp L_E222		;e526
mezclador_canal:		; Enciende o apaga el tono y el ruido del canal 0xEE19 en la copia del registro 7 del PSG (0xEE14), desplazando la pareja de bits 0x09 tantas posiciones como el numero de canal
	push de			;e529
	cpl			;e52a
	ld e,a			;e52b
	ld d,009h		;e52c
	ld a,(0ee19h)		;e52e
L_E531:
	dec a			;e531
	jp m,L_E53C		;e532
	scf			;e535
	rl e		;e536
	sla d		;e538
	jr L_E531		;e53a
L_E53C:
	ld a,(0ee14h)		;e53c
	or d			;e53f
	and e			;e540
	ld (0ee14h),a		;e541
	pop de			;e544
	ret			;e545
op_tempo1:		; 0x86: el tempo a 1, sin argumento
	ld a,001h		;e546
	ld (0ee18h),a		;e548
	inc bc			;e54b
	jp L_E222		;e54c
op_llama_frase:		; 0x8C n: el CALL del interprete. Guarda el BC que ya apunta detras del argumento en la pila por canal de 0xEE1B + canal*2 -tres parejas, 0xEE1B a 0xEE20, que cierran al byte contra la tabla de transposiciones de 0xEE21- y sigue interpretando desde la palabra que hay en 0xE7C1 + n*2, que es la tabla de las VEINTE frases y no la de los quince opcodes. Es el comando mas frecuente de la partitura, con 208 apariciones, e identico a su gemelo 0xC864 salvo los cinco operandos de direccion
	ld a,(0ee19h)		;e54f
	inc bc			;e552
	add a,a			;e553
	ld l,a			;e554
	ld h,000h		;e555
	ld a,(bc)			;e557
	inc bc			;e558
	ld de,0ee1bh		;e559
	add hl,de			;e55c
	ld (hl),c			;e55d
	inc hl			;e55e
	ld (hl),b			;e55f
	ld hl,0e7c1h		;e560
	call lee_puntero		;e563
	ld b,h			;e566
	ld c,l			;e567
	jp L_E222		;e568
op_vuelve:		; 0x8D: el RETURN. Recupera BC de la misma pila por canal (0xEE1B + canal*2, con el canal en 0xEE19) y vuelve al bucle del interprete en 0xE222 sin consumir ningun byte, que es por lo que TODAS las frases acaban en 0x8D mientras que las canciones acaban en 0x8B. Diecisiete bytes, los mismos que su gemelo 0xC880 salvo los tres operandos de direccion
	ld a,(0ee19h)		;e56b
	add a,a			;e56e
	ld l,a			;e56f
	ld h,000h		;e570
	ld de,0ee1bh		;e572
	add hl,de			;e575
	ld c,(hl)			;e576
	inc hl			;e577
	ld b,(hl)			;e578
	jp L_E222		;e579
op_transporte:		; 0x8E n: escribe el argumento en 0xEE21 + canal, y eso es la TRANSPOSICION de la voz: el lector de notas lo suma al numero de nota antes de buscar el periodo (`call L_E586 / add a,(hl)` en 0xE232)
	inc bc			;e57c
	call entrada_transporte		;e57d
	ld a,(bc)			;e580
	inc bc			;e581
	ld (hl),a			;e582
	jp L_E222		;e583
entrada_transporte:		; HL = 0xEE21 + el canal que hay en 0xEE19: la entrada de la tabla de transposiciones, la que el lector de notas suma y el comando 0x8E escribe
	ld a,(0ee19h)		;e586
	ld l,a			;e589
	ld h,000h		;e58a
	ld de,0ee21h		;e58c
	add hl,de			;e58f
	ret			;e590
mul_a_de:		; HL = A * DE por desplazamiento y suma, ocho vueltas; con A=0 devuelve 0 sin entrar al bucle
	ld hl,00000h		;e591
	and a			;e594
	ret z			;e595
	push bc			;e596
	ld b,008h		;e597
L_E599:
	srl a		;e599
	jr nc,L_E59E		;e59b
	add hl,de			;e59d
L_E59E:
	sla e		;e59e
	rl d		;e5a0
	djnz L_E599		;e5a2
	pop bc			;e5a4
	ret			;e5a5
div_bc_de:		; BC = BC / DE por restas y desplazamientos, dieciseis vueltas de `adc hl,hl / sbc hl,de`
	push af			;e5a6
	ld hl,00000h		;e5a7
	ld a,b			;e5aa
	ld b,010h		;e5ab
L_E5AD:
	rl c		;e5ad
	rla			;e5af
	adc hl,hl		;e5b0
	sbc hl,de		;e5b2
	jr nc,L_E5B7		;e5b4
	add hl,de			;e5b6
L_E5B7:
	ccf			;e5b7
	djnz L_E5AD		;e5b8
	rl c		;e5ba
	rla			;e5bc
	ld b,a			;e5bd
	pop af			;e5be
	ret			;e5bf
lee_puntero:		; HL = la palabra que hay en HL + A*2: el acceso a las tablas de punteros del interprete de guiones
	push af			;e5c0
	add a,a			;e5c1
	add a,l			;e5c2
	ld l,a			;e5c3
	jr nc,L_E5C7		;e5c4
	inc h			;e5c6
L_E5C7:
	ld a,(hl)			;e5c7
	inc hl			;e5c8
	ld h,(hl)			;e5c9
	ld l,a			;e5ca
	pop af			;e5cb
	ret			;e5cc
vuelca_psg:		; El volcado al chip, y el unico `out (0a1h),a` de sonido del bloque -el otro, 0xC1D1, es la lectura del joystick-: escribe los ONCE bytes del bloque sombra de 0xEE0D-0xEE17 en los registros 0 a 10 del PSG, con `ld a,000h` de primer registro y `ld d,00bh` de cuenta, sacando el numero por 0xA0 y el dato por 0xA1. Lo llama tic_sonido como ultima cosa de cada tic (`call L_E5CD` en 0xE39E), justo despues de componer el ruido en 0xEE13 sumando la base de 0xEE0A y el barrido de 0xEE0B. La sombra cierra al byte: 0xEE0D-0xEE12 los tres periodos de tono, 0xEE13 el ruido, 0xEE14 el mezclador y 0xEE15-0xEE17 los tres volumenes; los 21 bytes son los de su gemela 0xC8E2 salvo el operando del `ld hl`
	ld hl,0ee0dh		;e5cd
	ld a,000h		;e5d0
	ld d,00bh		;e5d2
L_E5D4:
	push af			;e5d4
	ld c,(hl)			;e5d5
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
; DATOS tabla_de_instrumentos: Tabla de instrumentos del interprete de sonido:
;   16 entradas de 15 bytes. El comando L_E4A6 lee el numero de instrumento
;   del guion y copia la entrada (HL = 0xE5E2 + n*15) al estado del canal
;   (ix+0x16 en adelante). Cierra al byte por los dos lados: el codigo de al
;   lado acaba en el ret de 0xE5E1, y 0xE5E2 + 16*15 = 0xE6D2, donde empieza
;   la tabla siguiente
;   0xe5e2..0xe6d2  (240 bytes)
DATA_tabla_de_instrumentos:
	defb 001h,00bh,032h,000h,000h,004h,0ffh,008h,000h,000h,000h,003h,000h,000h,000h	; e5e2  ..2............
	defb 002h,00bh,001h,001h,000h,002h,0ffh,004h,0feh,000h,002h,007h,000h,000h,000h	; e5f1  ...............
	defb 00ah,000h,000h,000h,000h,0ffh,000h,000h,000h,000h,003h,000h,000h,000h,000h	; e600  ...............
	defb 001h,00ah,003h,003h,000h,00ah,0ffh,001h,0ffh,000h,000h,000h,000h,000h,000h	; e60f  ...............
	defb 00bh,00bh,001h,001h,000h,001h,0ffh,02ah,0d6h,000h,003h,004h,000h,000h,000h	; e61e  .......*.......
	defb 005h,000h,01eh,000h,000h,0feh,000h,088h,000h,000h,000h,000h,000h,000h,000h	; e62d  ...............
	defb 006h,00ch,01eh,000h,000h,002h,0ffh,000h,000h,000h,001h,004h,003h,000h,000h	; e63c  ...............
	defb 00ch,00fh,028h,001h,032h,001h,0ffh,0e9h,000h,017h,003h,003h,000h,000h,000h	; e64b  ..(.2..........
	defb 00ah,000h,000h,000h,000h,0ffh,000h,000h,000h,000h,002h,000h,000h,000h,000h	; e65a  ...............
	defb 001h,001h,000h,000h,000h,000h,0f9h,000h,000h,000h,003h,000h,000h,000h,000h	; e669  ...............
	defb 006h,000h,000h,000h,000h,0ffh,000h,000h,000h,000h,00ah,000h,000h,000h,000h	; e678  ...............
	defb 003h,00ch,000h,000h,000h,001h,0ffh,000h,000h,000h,00ah,00ah,000h,000h,000h	; e687  ...............
	defb 001h,006h,00fh,000h,000h,004h,0ffh,014h,000h,000h,000h,003h,001h,000h,000h	; e696  ...............
	defb 00fh,000h,000h,000h,000h,0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h	; e6a5  ...............
	defb 00fh,000h,000h,000h,000h,0ffh,000h,000h,000h,000h,004h,000h,000h,000h,000h	; e6b4  ...............
	defb 002h,001h,000h,000h,000h,0feh,002h,000h,000h,000h,001h,002h,000h,000h,000h	; e6c3  ...............

; ----------------------------------------------------------------------
; DATOS tabla_del_comando_E4EF: Tabla del comando L_E4EF del interprete:
;   entradas de 6 bytes (HL = 0xE6D2 + n*6) que se copian al bloque de
;   0xEDFF+4, el canal de efectos. Hasta la tabla de notas caben dos entradas
;   enteras y cinco bytes de una tercera; cuantas usa el juego no esta medido
;   0xe6d2..0xe6e3  (17 bytes)
DATA_tabla_del_comando_E4EF:
	defb 020h,000h,001h,000h,002h,000h	; e6d2
	defb 001h,008h,010h,0feh,000h,000h	; e6d8
	defb 020h,000h,0ffh,000h,014h	; e6de

; ----------------------------------------------------------------------
; DATOS tabla_de_periodos: Tabla de periodos del PSG: 96 notas cromaticas =
;   OCHO OCTAVAS justas (192 B). Aqui se publico 81 y se quedaba corta: 0xE6E3
;   + 96*2 = 0xE7A3 cierra al byte contra la tabla de opcodes, y los 30 bytes
;   que sobraban son los 15 periodos mas agudos, decrecientes (0x20, 0x1e,
;   0x1c...). Lo confirma la musica, que usa la nota 84
;   0xe6e3..0xe7a3  (192 bytes)
DATA_tabla_de_periodos:
	defw 00d5dh,00c9dh,00be7h,00b3ch,00a9bh,00a03h,00973h,008ebh	; e6e3
	defw 0086bh,007f2h,00780h,00714h,006aeh,0064eh,005f4h,0059eh	; e6f3
	defw 0054dh,00501h,004b9h,00475h,00435h,003f9h,003c0h,0038ah	; e703
	defw 00357h,00327h,002fah,002cfh,002a7h,00281h,0025dh,0023bh	; e713
	defw 0021bh,001fch,001e0h,001c5h,001ach,00194h,0017dh,00168h	; e723
	defw 00153h,00140h,0012eh,0011dh,0010dh,000feh,000f0h,000e2h	; e733
	defw 000d6h,000cah,000beh,000b4h,000aah,000a0h,00097h,0008fh	; e743
	defw 00087h,0007fh,00078h,00071h,0006bh,00065h,0005fh,0005ah	; e753
	defw 00055h,00050h,0004ch,00047h,00043h,00040h,0003ch,00039h	; e763
	defw 00035h,00032h,00030h,0002dh,0002ah,00028h,00026h,00024h	; e773
	defw 00022h,00020h,0001eh,0001ch,0001bh,00019h,00018h,00016h	; e783
	defw 00015h,00014h,00013h,00012h,00011h,00010h,0000fh,0000eh	; e793

; ----------------------------------------------------------------------
; DATOS tabla_de_opcodes: Tabla de saltos de los QUINCE opcodes del interprete
;   (0x80-0x8E): 15 punteros de 2 B, indexada por el despachador de 0xE230 con
;   `sub 080h`. Aqui puso 35 y estaba mal; el limite lo fija el CALL del
;   propio interprete (ver el bloque de la musica mas abajo)
;   0xe7a3..0xe7c1  (30 bytes)
DATA_tabla_de_opcodes:
	defw 0e3efh	; e7a3  -> op_volumen
	defw 0e40dh	; e7a5  -> op_tono_ruido
	defw 0e477h	; e7a7  -> op_bucle
	defw 0e3f8h	; e7a9  -> op_duracion
	defw 0e473h	; e7ab  -> op_liga
	defw 0e445h	; e7ad  -> op_tempo
	defw 0e546h	; e7af  -> op_tempo1
	defw 0e4a6h	; e7b1  -> op_instrumento
	defw 0e45fh	; e7b3  -> op_ruido
	defw 0e4efh	; e7b5  -> op_efecto
	defw 0e492h	; e7b7  -> op_banderas
	defw 0e418h	; e7b9  -> op_fin
	defw 0e54fh	; e7bb  -> op_llama_frase
	defw 0e56bh	; e7bd  -> op_vuelve
	defw 0e57ch	; e7bf  -> op_transporte

; ----------------------------------------------------------------------
; DATOS punteros_de_frases: Tabla de las VEINTE frases de musica: 20 punteros
;   de 2 B que lee el comando 0x8C (0xE560: `ld hl,0e7c1h`), no el despachador
;   de opcodes
;   0xe7c1..0xe7e9  (40 bytes)
DATA_punteros_de_frases:
	defw 0e846h,0e7e9h,0e7f6h,0e810h,0e81fh,0e82ch,0e839h,0e88fh,0e8a2h,0e8b5h	; e7c1
	defw 0e8c8h,0e8dbh,0e92ah,0e971h,0e987h,0e99dh,0e9dch,0e9fah,0ea14h,0ea38h	; e7d5

; ----------------------------------------------------------------------
; DATOS canciones_y_frases: Las CANCIONES y las FRASES, escritas en el
;   lenguaje del propio interprete (1420 B): ver el bloque de abajo. NO es
;   codigo
;   0xe7e9..0xed75  (1420 bytes)
DATA_canciones_y_frases:
	defb 087h,008h,080h,00fh,083h,010h,018h,080h,00ch,018h,018h,018h,08dh,081h,008h,087h	; e7e9  ................
	defb 00ah,089h,000h,080h,008h,083h,020h,084h,088h,018h,083h,010h,084h,083h,008h,088h	; e7f9  ...... .........
	defb 018h,084h,083h,020h,088h,018h,08dh,087h,009h,080h,007h,083h,008h,030h,03ch,048h	; e809  ... .........0<H
	defb 054h,037h,043h,04ah,048h,08dh,087h,008h,080h,00fh,083h,010h,021h,080h,00ch,021h	; e819  T7CJH.......!..!
	defb 021h,021h,08dh,087h,008h,080h,00fh,083h,010h,01dh,080h,00ch,01dh,01dh,01dh,08dh	; e829  !!..............
	defb 087h,008h,080h,00fh,083h,010h,01fh,080h,00ch,01fh,01fh,01fh,08dh,087h,00bh,083h	; e839  ................
	defb 010h,087h,00ah,030h,02bh,030h,083h,020h,032h,083h,010h,032h,034h,032h,030h,02dh	; e849  ...0+0. 2..2420-
	defb 02bh,083h,050h,02dh,083h,010h,030h,02bh,030h,083h,020h,032h,083h,010h,032h,034h	; e859  +.P-..0+0. 2..24
	defb 032h,030h,02dh,02bh,083h,050h,02dh,083h,010h,035h,034h,030h,083h,030h,029h,083h	; e869  20-+.P-..540.0).
	defb 010h,035h,083h,020h,034h,030h,083h,040h,037h,083h,010h,037h,035h,034h,030h,02bh	; e879  .5. 40.@7..7540+
	defb 029h,028h,083h,0a0h,024h,08dh,083h,008h,021h,021h,02dh,021h,02bh,02dh,084h,01fh	; e889  )(..$...!!-!+-..
	defb 021h,021h,02dh,021h,02dh,02dh,026h,028h,08dh,083h,008h,01dh,01dh,029h,01dh,027h	; e899  !!-!--&(.....).'
	defb 029h,084h,01bh,01dh,01dh,029h,01dh,027h,018h,022h,024h,08dh,083h,008h,01ah,01ah	; e8a9  )....).'."$.....
	defb 026h,01ah,024h,026h,084h,018h,01ah,01ah,026h,01ah,024h,026h,01fh,021h,08dh,083h	; e8b9  &.$&....&.$&.!..
	defb 008h,01ch,01ch,028h,01ch,026h,028h,084h,01ah,01ch,01ch,028h,023h,026h,028h,01ch	; e8c9  ...(.&(....(#&(.
	defb 01fh,08dh,087h,00ah,083h,008h,039h,02dh,039h,02dh,037h,034h,037h,039h,084h,087h	; e8d9  ......9-9-7479..
	defb 00ch,021h,083h,010h,02bh,083h,020h,021h,087h,00ah,083h,008h,039h,032h,039h,032h	; e8e9  .!..+. !....9292
	defb 037h,034h,037h,083h,028h,039h,083h,020h,087h,00ch,01fh,087h,00ah,083h,008h,03eh	; e8f9  747.(9. .......>
	defb 032h,040h,032h,03eh,03ch,039h,03ch,03eh,032h,040h,032h,03eh,03ch,039h,03ch,040h	; e909  2@2><9<>2@2><9<@
	defb 034h,040h,034h,03eh,03bh,03eh,083h,018h,083h,028h,040h,083h,020h,087h,00ch,030h	; e919  4@4>;>...(@. ..0
	defb 08dh,087h,00bh,08ah,001h,083h,060h,039h,087h,008h,080h,00dh,083h,008h,03ch,03bh	; e929  ......`9......<;
	defb 039h,037h,087h,00bh,080h,00ah,083h,060h,039h,087h,008h,080h,00dh,083h,008h,03ch	; e939  97.....`9......<
	defb 03bh,039h,037h,080h,00ah,087h,00bh,083h,060h,035h,080h,00dh,087h,008h,083h,008h	; e949  ;97.....`5......
	defb 035h,039h,03ch,039h,080h,00ah,087h,00bh,083h,060h,03bh,087h,008h,083h,008h,080h	; e959  59<9.....`;.....
	defb 00dh,040h,034h,03eh,040h,080h,00ah,08dh,087h,008h,080h,00fh,083h,010h,018h,080h	; e969  .@4>@...........
	defb 00ch,083h,008h,018h,018h,080h,00fh,083h,010h,018h,080h,00ch,013h,08dh,087h,008h	; e979  ................
	defb 080h,00fh,083h,010h,01ah,080h,00ch,083h,008h,01ah,01ah,080h,00fh,083h,010h,01ah	; e989  ................
	defb 080h,00ch,015h,08dh,081h,001h,087h,009h,083h,008h,080h,009h,030h,037h,03ch,037h	; e999  ............07<7
	defb 03eh,03ch,036h,03eh,030h,03ch,036h,037h,083h,020h,087h,00ah,081h,008h,088h,00ch	; e9a9  ><6>0<67. ......
	defb 081h,001h,087h,009h,087h,009h,083h,008h,080h,009h,030h,037h,03ch,037h,03eh,03ch	; e9b9  ..........07<7><
	defb 036h,03eh,030h,03ch,036h,037h,083h,020h,087h,00ah,081h,008h,088h,012h,081h,001h	; e9c9  6>0<67. ........
	defb 087h,009h,08dh,087h,00ah,083h,030h,030h,083h,008h,02bh,030h,083h,030h,032h,083h	; e9d9  ......00..+0.02.
	defb 008h,030h,032h,083h,030h,037h,083h,008h,035h,034h,083h,010h,035h,034h,030h,02bh	; e9e9  .02.07..54..540+
	defb 08dh,080h,00ch,087h,00ah,083h,030h,030h,083h,008h,087h,008h,037h,037h,080h,00fh	; e9f9  ......00....77..
	defb 036h,083h,028h,084h,083h,008h,080h,00dh,02bh,02bh,08dh,087h,00fh,08ah,001h,083h	; ea09  6.(.....++......
	defb 020h,030h,037h,036h,032h,034h,030h,083h,010h,030h,03bh,03ah,039h,083h,020h,032h	; ea19   076240..0;:9. 2
	defb 037h,036h,039h,038h,083h,008h,032h,037h,036h,039h,083h,020h,038h,039h,08dh,085h	; ea29  7698..2769. 89..
	defb 0a0h,083h,00ch,081h,001h,080h,007h,087h,000h,050h,08bh,085h,0a0h,083h,019h,081h	; ea39  .........P......
	defb 001h,080h,007h,087h,001h,08ah,002h,046h,08bh,085h,0a0h,083h,001h,081h,008h,080h	; ea49  .......F........
	defb 00fh,088h,019h,083h,00ah,080h,00ah,087h,002h,088h,01fh,08bh,085h,0a0h,083h,003h	; ea59  ................
	defb 081h,001h,080h,005h,087h,003h,08ah,002h,05ah,08bh,085h,01eh,083h,005h,081h,001h	; ea69  ........Z.......
	defb 080h,000h,087h,004h,08ah,002h,050h,08bh,085h,0ffh,083h,002h,081h,008h,080h,00fh	; ea79  ......P.........
	defb 088h,00fh,08bh,085h,0ffh,083h,002h,081h,001h,080h,00fh,087h,005h,02dh,08bh,086h	; ea89  .............-..
	defb 083h,001h,081h,001h,080h,00ah,05ah,08bh,086h,083h,001h,081h,001h,080h,00ah,032h	; ea99  ......Z........2
	defb 08bh,086h,080h,00ch,087h,008h,08ah,000h,081h,001h,083h,004h,08eh,005h,018h,024h	; eaa9  ...............$
	defb 018h,024h,018h,024h,018h,024h,01dh,029h,01fh,02bh,018h,024h,018h,018h,018h,08bh	; eab9  .$.$.$.).+.$....
	defb 080h,00ch,087h,008h,08ah,000h,081h,001h,083h,004h,08eh,005h,028h,02bh,030h,02bh	; eac9  ............(+0+
	defb 028h,02bh,030h,02bh,02dh,030h,02fh,032h,02bh,02bh,02bh,08bh,080h,00fh,087h,00fh	; ead9  (+0+-0/2+++.....
	defb 08ah,001h,081h,001h,083h,004h,08eh,005h,043h,040h,043h,040h,083h,00ch,043h,083h	; eae9  ........C@C@..C.
	defb 004h,040h,083h,010h,03eh,03ch,08bh,086h,083h,01eh,081h,008h,080h,00fh,089h,002h	; eaf9  .@..><..........
	defb 088h,01eh,083h,050h,087h,00eh,088h,01fh,08bh,083h,00fh,081h,008h,080h,00fh,088h	; eb09  ...P............
	defb 01eh,083h,00fh,087h,00dh,088h,01fh,08bh,081h,008h,080h,00fh,083h,00fh,087h,00dh	; eb19  ................
	defb 088h,01fh,08bh,086h,083h,001h,081h,001h,080h,00ah,03ah,084h,084h,084h,08bh,086h	; eb29  ..........:.....
	defb 083h,001h,081h,001h,080h,00ah,04ch,084h,082h,085h,0a0h,083h,014h,081h,009h,080h	; eb39  ......L.........
	defb 000h,087h,006h,089h,000h,088h,080h,028h,08bh,08eh,002h,086h,081h,001h,08ch,001h	; eb49  .......(........
	defb 08ch,001h,08ch,004h,08ch,004h,08ch,001h,08ch,001h,08ch,004h,08ch,004h,08ch,005h	; eb59  ................
	defb 08ch,005h,08ch,006h,08ch,006h,08ch,001h,08ch,001h,08ch,001h,08ch,001h,086h,081h	; eb69  ................
	defb 001h,08ch,001h,08ch,001h,08ch,004h,08ch,004h,08ch,001h,08ch,001h,08ch,004h,08ch	; eb79  ................
	defb 004h,08ch,005h,08ch,005h,08ch,006h,08ch,006h,08ch,001h,08ch,001h,08ch,001h,08ch	; eb89  ................
	defb 001h,086h,081h,001h,08ch,001h,08ch,001h,08ch,004h,08ch,004h,08ch,001h,08ch,001h	; eb99  ................
	defb 08ch,004h,08ch,004h,08ch,005h,08ch,005h,08ch,006h,08ch,006h,08ch,001h,08ch,001h	; eba9  ................
	defb 08ch,001h,08ch,001h,080h,00dh,08ch,007h,08ch,008h,08ch,009h,08ch,00ah,08ch,007h	; ebb9  ................
	defb 08ch,008h,08ch,009h,08ch,00ah,08ch,007h,08ch,008h,08ch,009h,08ch,00ah,08ch,007h	; ebc9  ................
	defb 08ch,008h,08ch,009h,08ch,00ah,08ch,007h,08ch,008h,08ch,009h,08ch,00ah,08eh,009h	; ebd9  ................
	defb 08ch,00dh,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00eh,08ch,00eh,08ch,00eh,08ch,00eh	; ebe9  ................
	defb 08ch,00dh,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00eh,08ch,00eh,08ch,00eh,08ch,00eh	; ebf9  ................
	defb 08ch,00dh,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00eh,08ch,00eh,08ch,00eh,08ch,00eh	; ec09  ................
	defb 08ch,00dh,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00eh,08ch,00eh,08ch,00eh,08ch,00eh	; ec19  ................
	defb 08ch,00dh,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00eh,08ch,00eh,08ch,00eh,08ch,00eh	; ec29  ................
	defb 08ch,00dh,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00eh,08ch,00eh,08ch,00eh,08ch,00eh	; ec39  ................
	defb 082h,08eh,002h,081h,001h,08ch,003h,08ch,003h,08ch,003h,08ch,003h,08ch,003h,08ch	; ec49  ................
	defb 003h,08ch,003h,08ch,003h,08ch,003h,08ch,003h,08ch,003h,08ch,003h,08ch,003h,08ch	; ec59  ................
	defb 003h,08ch,003h,08ch,003h,080h,00bh,08ch,000h,080h,00ah,08eh,00eh,08ch,000h,08eh	; ec69  ................
	defb 002h,080h,00ah,083h,080h,084h,084h,084h,084h,08ch,00bh,08eh,00eh,08ch,00bh,08eh	; ec79  ................
	defb 002h,08ch,00ch,08eh,0f6h,08ch,00ch,08eh,002h,08eh,009h,080h,00ch,087h,00ah,08ch	; ec89  ................
	defb 010h,08eh,00bh,08ch,010h,08eh,0fdh,080h,00dh,08ch,010h,08eh,0ffh,08ch,010h,08eh	; ec99  ................
	defb 009h,08ch,011h,08ch,011h,08eh,00bh,08ch,011h,08ch,011h,08eh,0fdh,08ch,011h,08ch	; eca9  ................
	defb 011h,08eh,0ffh,08ch,011h,08ch,011h,080h,00fh,08eh,009h,08ch,012h,08eh,0fdh,08ch	; ecb9  ................
	defb 012h,082h,08bh,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch	; ecc9  ................
	defb 002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch	; ecd9  ................
	defb 002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch	; ece9  ................
	defb 002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch	; ecf9  ................
	defb 002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch	; ed09  ................
	defb 002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08eh,009h,08ch,00fh,08eh	; ed19  ................
	defb 00bh,08ch,00fh,08eh,009h,08ch,00fh,08eh,00bh,08ch,00fh,08eh,009h,08ch,00fh,08eh	; ed29  ................
	defb 00bh,08ch,00fh,08eh,009h,08ch,00fh,08eh,00bh,08ch,00fh,08eh,009h,08ch,00fh,08eh	; ed39  ................
	defb 00bh,08ch,00fh,08eh,009h,08ch,00fh,08eh,00bh,08ch,00fh,082h,085h,0a0h,083h,01eh	; ed49  ................
	defb 081h,001h,080h,003h,087h,007h,014h,08bh,086h,083h,001h,081h,001h,080h,00ah,040h	; ed59  ...............@
	defb 084h,082h,086h,083h,001h,081h,001h,080h,00ah,034h,084h,082h	; ed69  .........4..

; ----------------------------------------------------------------------
; DATOS variables_del_interprete: Variables a cero del interprete de guiones
;   (175 B): las lee y
;   0xed75..0xee24  (175 bytes)
DATA_variables_del_interprete:
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; ed75  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; ed85  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; ed95  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; eda5  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; edb5  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; edc5  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; edd5  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; ede5  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; edf5  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; ee05  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; ee15  ...............

; ======================================================================
; CODIGO 0xee24..0xf120  (764 bytes)
; ======================================================================


vram_pon_dir:		; Fija la direccion de ESCRITURA del VDP por el puerto 0x99, con el bit 0x40 puesto
	di			;ee24
	push af			;ee25
	in a,(099h)		;ee26
	ld a,l			;ee28
	out (099h),a		;ee29
	ld a,h			;ee2b
	and 07fh		;ee2c
	or 040h		;ee2e
	out (099h),a		;ee30
	pop af			;ee32
	ret			;ee33
presentacion:		; La presentacion, lo primero que hace el juego (call en 0xBDA6): borra los 6144 B de patrones, pone los de color a 0x71, enciende la pantalla y recorre los 96 pares de 0xF126 llamando a anima_logo, hasta el 0xFF de 0xF1E6; luego caen los creditos
	ld b,032h		;ee34
	call retardo		;ee36
	ld hl,00000h		;ee39
	ld bc,01800h		;ee3c
	xor a			;ee3f
	call vram_rellena		;ee40
	ld hl,02000h		;ee43
	ld bc,01800h		;ee46
	ld a,071h		;ee49
	call vram_rellena		;ee4b
	ld a,0e2h		;ee4e
	out (099h),a		;ee50
	and a			;ee52
	ld a,081h		;ee53
	out (099h),a		;ee55
	ld ix,0f120h		;ee57
	ld hl,0f126h		;ee5b
	ld a,(hl)			;ee5e
	ld (ix+001h),a		;ee5f
L_EE62:
	ld a,(hl)			;ee62
	cp 0ffh		;ee63
	jr z,creditos		;ee65
	ld (ix+000h),a		;ee67
	inc hl			;ee6a
	ld a,(hl)			;ee6b
	ld (ix+002h),a		;ee6c
	inc hl			;ee6f
	push hl			;ee70
	ld b,001h		;ee71
	call retardo		;ee73
	call anima_logo		;ee76
	pop hl			;ee79
	jr L_EE62		;ee7a
creditos:		; La secuencia de creditos: cinco carteles en el tercio central (bucle de 0xEE92 sobre la tabla de 0xF1E7, dentro del bloque de textos 0xF124-0xF2D0), cada uno con su pausa y su transicion
	ld hl,02800h		;ee7c
	ld bc,00800h		;ee7f
	ld a,0a1h		;ee82
	call vram_rellena		;ee84
	ld b,032h		;ee87
	call retardo		;ee89
	ld ix,0f1e7h		;ee8c
	ld b,005h		;ee90
L_EE92:
	push bc			;ee92
	ld hl,00900h		;ee93
	call rotula_secuencia		;ee96
	ld b,0c8h		;ee99
	call retardo		;ee9b
	ld b,0c8h		;ee9e
	call retardo		;eea0
	call creditos_transicion		;eea3
	pop bc			;eea6
	djnz L_EE92		;eea7
	ld hl,00a98h		;eea9
	call rotula_secuencia		;eeac
	ld h,d			;eeaf
	ld l,e			;eeb0
	ld bc,00000h		;eeb1
	nop			;eeb4
	nop			;eeb5
	call arranca_musica		;eeb6
	call espera_fin_musica		;eeb9
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
	call vram_rellena		;eed4
	ld bc,00600h		;eed7
	add hl,bc			;eeda
	pop bc			;eedb
	djnz L_EECE		;eedc
	ld de,00100h		;eede
	add hl,de			;eee1
	dec c			;eee2
	jr nz,L_EECC		;eee3
	ld hl,02100h		;eee5
	ld e,018h		;eee8
L_EEEA:
	ld a,011h		;eeea
	ld bc,00008h		;eeec
	call vram_rellena		;eeef
	ld bc,00040h		;eef2
	add hl,bc			;eef5
	dec e			;eef6
	jr nz,L_EEEA		;eef7
	ld hl,03128h		;eef9
	ld e,018h		;eefc
L_EEFE:
	ld a,011h		;eefe
L_EF00:
	ld bc,00018h		;ef00
	call vram_rellena		;ef03
	ld bc,00040h		;ef06
	add hl,bc			;ef09
	dec e			;ef0a
	jr nz,L_EEFE		;ef0b
	ld hl,00000h		;ef0d
	ld de,048a0h		;ef10
	call copia_marco		;ef13
	ld hl,02000h		;ef16
	call copia_marco		;ef19
	di			;ef1c
	ld a,0e2h		;ef1d
	out (099h),a		;ef1f
	ld a,081h		;ef21
	and a			;ef23
	and a			;ef24
	out (099h),a		;ef25
	ret			;ef27
copia_marco:		; Vuelca el marco de la pantalla de juego a la VRAM: dos filas de caracter por tercio (0x100 B x3, saltando 0x800) mas 24 tiras de 8 B y otras 24 de 0x18. Se llama dos veces, con los patrones de 0x48A0 y con los colores de 0x51A0
	push hl			;ef28
	ld c,002h		;ef29
L_EF2B:
	ld b,003h		;ef2b
L_EF2D:
	push bc			;ef2d
	ld bc,00100h		;ef2e
	call vram_escribe		;ef31
	ld bc,00800h		;ef34
	add hl,bc			;ef37
	pop bc			;ef38
	djnz L_EF2D		;ef39
	push de			;ef3b
	ld de,lef00h		;ef3c
	add hl,de			;ef3f
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
	call vram_escribe		;ef4d
	ld bc,00040h		;ef50
	add hl,bc			;ef53
	pop bc			;ef54
	djnz L_EF49		;ef55
	pop hl			;ef57
	ld bc,01028h		;ef58
	add hl,bc			;ef5b
	ld b,018h		;ef5c
L_EF5E:
	push bc			;ef5e
	ld bc,00018h		;ef5f
	call vram_escribe		;ef62
	ld bc,00040h		;ef65
	add hl,bc			;ef68
	pop bc			;ef69
	djnz L_EF5E		;ef6a
	ret			;ef6c
creditos_transicion:		; Despide el cartel deslizandolo hacia arriba, y lo hace moviendo la tabla de NOMBRES (256 bytes) en vez de los patrones (2048): ocho pasos de 0x20 = una fila. Al final borra los dibujos del tercio y reconstruye la tabla con el intercalado de a 8 de la pantalla de carga
	ld hl,04100h		;ef6d
	ld de,04101h		;ef70
	ld bc,0001fh		;ef73
	ldir		;ef76
	ld de,04000h		;ef78
	ld hl,01900h		;ef7b
	ld bc,00100h		;ef7e
	call vram_lee		;ef81
	ld a,008h		;ef84
L_EF86:
	ex af,af'			;ef86
	ld de,04000h		;ef87
	ld hl,04020h		;ef8a
	ld bc,00100h		;ef8d
	ldir		;ef90
	ld hl,01900h		;ef92
	ld de,04000h		;ef95
	ld bc,00100h		;ef98
	call vram_escribe		;ef9b
	ld b,00ah		;ef9e
	call retardo		;efa0
	ex af,af'			;efa3
	dec a			;efa4
	jr nz,L_EF86		;efa5
	ld hl,00800h		;efa7
	ld bc,00800h		;efaa
	xor a			;efad
	call vram_rellena		;efae
	ld hl,01900h		;efb1
	call vram_pon_dir		;efb4
	ld c,098h		;efb7
	xor a			;efb9
L_EFBA:
	out (c),a		;efba
	add a,008h		;efbc
	jr nc,L_EFBA		;efbe
	inc a			;efc0
	cp 008h		;efc1
	jr nz,L_EFBA		;efc3
	ret			;efc5
retardo:		; Espera activa: B vueltas de un bucle de 0x1F4
	push bc			;efc6
	ld bc,001f4h		;efc7
L_EFCA:
	dec bc			;efca
	ld a,b			;efcb
	or c			;efcc
	jr nz,L_EFCA		;efcd
	pop bc			;efcf
	djnz retardo		;efd0
	ret			;efd2
anima_logo:		; Un fotograma del logo sobre el estado de 0xF120: compara fila y altura con las del fotograma anterior, calcula en (ix+004) cuantas filas hay que borrar y SE PARCHEA los operandos de los dos `call` de 0xF015/0xF018 para dibujar antes de borrar si el logo sube, o al reves si baja
	ld a,(ix+000h)		;efd3
	sub (ix+001h)		;efd6
	ld de,logo_estira		;efd9
	ld hl,logo_borra		;efdc
	ld c,(ix+001h)		;efdf
	jr c,L_EFF0		;efe2
	jr nz,L_EFFD		;efe4
	ld a,(ix+002h)		;efe6
	cp (ix+003h)		;efe9
	ld a,000h		;efec
	jr nc,L_EFFD		;efee
L_EFF0:
	ld c,(ix+000h)		;eff0
	neg		;eff3
	sub (ix+002h)		;eff5
	add a,(ix+003h)		;eff8
	ex de,hl			;effb
	inc a			;effc
L_EFFD:
	ld (ix+004h),a		;effd
	ld (0f016h),hl		;f000
	ld (0f019h),de		;f003
	ld d,c			;f007
	ld e,008h		;f008
	call dir_vram_de_fila_columna		;f00a
	xor a			;f00d
	ld (0f125h),a		;f00e
	push hl			;f011
	ld de,04000h		;f012
	call 00000h		;f015   ; BIOS CHKRAM - Tests RAM and sets RAM slot for the system  [alias: STARTUP, RESET, BOOT]
	call 00000h		;f018   ; BIOS CHKRAM - Tests RAM and sets RAM slot for the system  [alias: STARTUP, RESET, BOOT]
	pop hl			;f01b
	call logo_vuelca		;f01c
	ld a,(ix+000h)		;f01f
	ld (ix+001h),a		;f022
	ld a,(ix+002h)		;f025
	ld (ix+003h),a		;f028
	ret			;f02b
logo_estira:		; Estira el logo de 0x47A0 -16 filas de 16 B- sobre el montaje que apunta DE, repartiendolo en (ix+002) filas con un acumulador que arranca en 8: con altura 16 sale copia fila a fila, y con altura 1, dos filas
	ld a,020h		;f02c
	ld b,010h		;f02e
	sub (ix+002h)		;f030
	ld c,a			;f033
	ex af,af'			;f034
	ld a,008h		;f035
	ld hl,047a0h		;f037
L_F03A:
	push de			;f03a
	ldi		;f03b
	ldi		;f03d
	ldi		;f03f
	ldi		;f041
	ldi		;f043
	ldi		;f045
	ldi		;f047
	ldi		;f049
	ldi		;f04b
	ldi		;f04d
	ldi		;f04f
	ldi		;f051
	ldi		;f053
	ldi		;f055
	ldi		;f057
	ldi		;f059
	pop de			;f05b
	add a,c			;f05c
	cp 010h		;f05d
	jr nc,L_F069		;f05f
	ex af,af'			;f061
	call logo_avanza		;f062
	ex af,af'			;f065
	add a,010h		;f066
	scf			;f068
L_F069:
	dec b			;f069
	jr z,L_F077		;f06a
	and a			;f06c
	sbc a,010h		;f06d
	ex af,af'			;f06f
	ld a,c			;f070
	add a,010h		;f071
	ld c,a			;f073
	ex af,af'			;f074
	jr L_F03A		;f075
L_F077:
	ret c			;f077
	jp logo_avanza		;f078
logo_borra:		; Pone a cero (ix+004) filas de 16 B desde DE, con `ld (hl),000h` y quince `ldi` desenrollados que arrastran el cero. Con (ix+004) a cero vuelve sin tocar nada
	ld a,(ix+004h)		;f07b
	and a			;f07e
	ret z			;f07f
L_F080:
	push de			;f080
	pop hl			;f081
	push de			;f082
	inc de			;f083
	ld (hl),000h		;f084
	ldi		;f086
	ldi		;f088
	ldi		;f08a
	ldi		;f08c
	ldi		;f08e
	ldi		;f090
	ldi		;f092
	ldi		;f094
	ldi		;f096
	ldi		;f098
	ldi		;f09a
	ldi		;f09c
	ldi		;f09e
	ldi		;f0a0
	ldi		;f0a2
	pop de			;f0a4
	call logo_avanza		;f0a5
	dec (ix+004h)		;f0a8
	ret z			;f0ab
	jr L_F080		;f0ac
logo_avanza:		; Cierra una fila del montaje: suma 16 a DE y sube el contador de filas de (ix+005), que es lo que luego mira logo_vuelca
	push hl			;f0ae
	ld hl,00010h		;f0af
	add hl,de			;f0b2
	ex de,hl			;f0b3
	pop hl			;f0b4
	ld a,(0f125h)		;f0b5
	inc a			;f0b8
	ld (0f125h),a		;f0b9
	ret			;f0bc
logo_vuelca:		; Suelta el montaje de 0x4000 a la VRAM transponiendolo: 16 columnas y, en cada una, las filas que diga (ix+005), leyendo a saltos de 16 en la RAM y bajando por la VRAM
	ld c,010h		;f0bd
	ld de,04000h		;f0bf
L_F0C2:
	call vram_pon_dir		;f0c2
	push de			;f0c5
	ld a,(0f125h)		;f0c6
	ld b,a			;f0c9
	push hl			;f0ca
L_F0CB:
	ld a,(de)			;f0cb
	out (098h),a		;f0cc
	ld a,e			;f0ce
	add a,010h		;f0cf
	ld e,a			;f0d1
	ld a,d			;f0d2
	adc a,000h		;f0d3
	ld d,a			;f0d5
	call vram_avanza_fila		;f0d6
	djnz L_F0CB		;f0d9
	pop hl			;f0db
	ld de,00040h		;f0dc
	add hl,de			;f0df
	pop de			;f0e0
	inc de			;f0e1
	dec c			;f0e2
	jr nz,L_F0C2		;f0e3
	ei			;f0e5
	ret			;f0e6
vram_rellena:		; Escribe BC veces el valor de A en VRAM desde HL
	ex af,af'			;f0e7
	call vram_pon_dir		;f0e8
L_F0EB:
	ex af,af'			;f0eb
	out (098h),a		;f0ec
	ex af,af'			;f0ee
	dec bc			;f0ef
	ld a,b			;f0f0
	or c			;f0f1
	jr nz,L_F0EB		;f0f2
	ex af,af'			;f0f4
	ei			;f0f5
	ret			;f0f6
vram_escribe:		; Copia BC bytes de RAM (DE) a VRAM (HL) por el puerto 0x98
	call vram_pon_dir		;f0f7
L_F0FA:
	ld a,(de)			;f0fa
	out (098h),a		;f0fb
	inc de			;f0fd
	dec bc			;f0fe
	ld a,b			;f0ff
	or c			;f100
	jr nz,L_F0FA		;f101
	ei			;f103
	ret			;f104
vram_lee:		; Copia BC bytes de VRAM (HL) a RAM (DE) leyendo del puerto 0x98
	call vram_pon_dir_lee		;f105
	and a			;f108
L_F109:
	in a,(098h)		;f109
	ld (de),a			;f10b
	inc de			;f10c
	dec bc			;f10d
	ld a,b			;f10e
	or c			;f10f
	jr nz,L_F109		;f110
	ei			;f112
	ret			;f113
vram_pon_dir_lee:		; Fija la direccion de LECTURA del VDP por el puerto 0x99, sin el bit 0x40: es la gemela de vram_pon_dir
	di			;f114
	in a,(099h)		;f115
	ld a,l			;f117
	out (099h),a		;f118
	ld a,h			;f11a
	and 03fh		;f11b
	out (099h),a		;f11d
	ret			;f11f

; ----------------------------------------------------------------------
; DATOS estado_del_animador_del_logo: El estado del animador del logo (6 B):
;   (ix+000/001) la fila de la cima de este fotograma y la del anterior,
;   (ix+002/003) la altura de los dos, (ix+004) cuantas filas hay que borrar y
;   (ix+005) -que el codigo nombra ademas como 0xF125- el contador de filas
;   montadas. Los seis llegan a cero de la cinta y los fija anima_logo, con
;   `ld ix,0f120h` en 0xEE57
;   0xf120..0xf126  (6 bytes)
DATA_estado_del_animador_del_logo:
	defb 000h,000h,000h,000h,000h,000h	; f120

; ----------------------------------------------------------------------
; DATOS fotogramas_del_logo: La tabla de fotogramas del logo del arranque (193
;   B): 96 pares (fila de la cima, altura) y el 0xFF de 0xF1E6 que cierra el
;   recorrido. La apunta `ld hl,0f126h` en 0xEE5B y la recorre de dos en dos
;   el bucle de presentacion. Describe el rebote: la altura crece de 1 a 16,
;   el logo baja hasta la fila 186 aplastandose, y vuelve
;   0xf126..0xf1e7  (193 bytes)
DATA_fotogramas_del_logo:
	defb 000h,001h	; f126
	defb 000h,001h	; f128
	defb 000h,001h	; f12a
	defb 000h,002h	; f12c
	defb 000h,002h	; f12e
	defb 000h,003h	; f130
	defb 000h,003h	; f132
	defb 000h,004h	; f134
	defb 000h,005h	; f136
	defb 000h,006h	; f138
	defb 000h,008h	; f13a
	defb 000h,00ah	; f13c
	defb 000h,00dh	; f13e
	defb 000h,010h	; f140
	defb 001h,010h	; f142
	defb 002h,010h	; f144
	defb 003h,010h	; f146
	defb 005h,010h	; f148
	defb 007h,010h	; f14a
	defb 009h,010h	; f14c
	defb 00ch,010h	; f14e
	defb 00fh,010h	; f150
	defb 012h,010h	; f152
	defb 018h,010h	; f154
	defb 01ch,010h	; f156
	defb 020h,010h	; f158
	defb 025h,010h	; f15a
	defb 02ah,010h	; f15c
	defb 02fh,010h	; f15e
	defb 035h,010h	; f160
	defb 03bh,010h	; f162
	defb 041h,010h	; f164
	defb 048h,010h	; f166
	defb 04fh,010h	; f168
	defb 056h,010h	; f16a
	defb 05eh,010h	; f16c
	defb 066h,010h	; f16e
	defb 06eh,010h	; f170
	defb 077h,010h	; f172
	defb 080h,010h	; f174
	defb 089h,010h	; f176
	defb 093h,010h	; f178
	defb 09dh,010h	; f17a
	defb 0a7h,010h	; f17c
	defb 0ach,00fh	; f17e
	defb 0b3h,008h	; f180
	defb 0b7h,004h	; f182
	defb 0b9h,002h	; f184
	defb 0bah,001h	; f186
	defb 0bah,001h	; f188
	defb 0bah,001h	; f18a
	defb 0b9h,002h	; f18c
	defb 0b7h,004h	; f18e
	defb 0b3h,008h	; f190
	defb 0abh,010h	; f192
	defb 0a1h,010h	; f194
	defb 097h,010h	; f196
	defb 08dh,010h	; f198
	defb 083h,010h	; f19a
	defb 07ah,010h	; f19c
	defb 071h,010h	; f19e
	defb 068h,010h	; f1a0
	defb 05fh,010h	; f1a2
	defb 057h,010h	; f1a4
	defb 04fh,010h	; f1a6
	defb 047h,010h	; f1a8
	defb 03fh,010h	; f1aa
	defb 038h,010h	; f1ac
	defb 031h,010h	; f1ae
	defb 02ah,010h	; f1b0
	defb 023h,010h	; f1b2
	defb 01dh,010h	; f1b4
	defb 017h,010h	; f1b6
	defb 011h,010h	; f1b8
	defb 00bh,010h	; f1ba
	defb 006h,010h	; f1bc
	defb 001h,010h	; f1be
	defb 001h,00bh	; f1c0
	defb 001h,008h	; f1c2
	defb 001h,005h	; f1c4
	defb 001h,003h	; f1c6
	defb 001h,002h	; f1c8
	defb 001h,002h	; f1ca
	defb 001h,001h	; f1cc
	defb 001h,001h	; f1ce
	defb 001h,001h	; f1d0
	defb 001h,001h	; f1d2
	defb 002h,002h	; f1d4
	defb 003h,003h	; f1d6
	defb 004h,004h	; f1d8
	defb 005h,005h	; f1da
	defb 006h,006h	; f1dc
	defb 007h,008h	; f1de
	defb 008h,00ah	; f1e0
	defb 009h,00dh	; f1e2
	defb 00ah,010h	; f1e4
	defb 0ffh	; f1e6

; ----------------------------------------------------------------------
; DATOS textos_de_los_creditos: Textos de la pantalla de creditos (234 B;
;   leidos del binario:
;   0xf1e7..0xf2d1  (234 bytes)
DATA_textos_de_los_creditos:
	defb 00dh,001h,009h,043h,04fh,04eh,056h,045h,052h,053h,049h,04fh,04eh,020h,050h,04fh	; f1e7  ...CONVERSION PO
	defb 052h,00dh,00dh,001h,009h,020h,043h,041h,052h,04ch,04fh,053h,020h,041h,052h,049h	; f1f7  R.... CARLOS ARI
	defb 041h,053h,00dh,000h,001h,00ch,047h,052h,041h,046h,049h,043h,04fh,053h,00dh,00dh	; f207  AS....GRAFICOS..
	defb 001h,006h,04ah,055h,041h,04eh,020h,043h,041h,052h,04ch,04fh,053h,020h,059h,020h	; f217  ..JUAN CARLOS Y 
	defb 04ah,041h,056h,049h,045h,052h,00dh,00dh,001h,00ch,041h,052h,045h,056h,041h,04ch	; f227  JAVIER....AREVAL
	defb 04fh,00dh,014h,00dh,001h,008h,02eh,02eh,02eh,041h,044h,045h,04dh,041h,053h,020h	; f237  O........ADEMAS 
	defb 044h,045h,02eh,02eh,02eh,00dh,000h,00dh,00dh,00dh,001h,00ah,04ah,055h,04ch,049h	; f247  DE..........JULI
	defb 04fh,020h,04dh,041h,052h,054h,049h,04eh,00dh,000h,001h,006h,04dh,055h,053h,049h	; f257  O MARTIN....MUSI
	defb 043h,041h,020h,043h,04fh,04dh,050h,055h,045h,053h,054h,041h,020h,050h,04fh,052h	; f267  CA COMPUESTA POR
	defb 00dh,00dh,001h,00bh,047h,04fh,04dh,049h,04eh,04fh,04ch,041h,053h,00dh,000h,001h	; f277  ....GOMINOLAS...
	defb 00bh,042h,041h,053h,041h,044h,04fh,020h,020h,045h,04eh,00dh,00dh,001h,007h,055h	; f287  .BASADO  EN....U
	defb 04eh,041h,020h,049h,044h,045h,041h,020h,020h,04fh,052h,049h,047h,049h,04eh,041h	; f297  NA IDEA  ORIGINA
	defb 04ch,00dh,00dh,001h,00fh,044h,045h,00dh,00dh,001h,007h,04ah,04fh,053h,045h,020h	; f2a7  L....DE....JOSE 
	defb 04dh,041h,04eh,055h,045h,04ch,020h,020h,04dh,055h,026h,04fh,05ah,00dh,000h,054h	; f2b7  MANUEL  MU&OZ..T
	defb 04fh,050h,04fh,020h,053h,04fh,046h,054h,00dh,000h	; f2c7  OPO SOFT..

; ======================================================================
; CODIGO 0xf2d1..0xf393  (194 bytes)
; ======================================================================


pinta_energia:		; Pinta la barra de 0x6050 con el valor de 0xD3C1 recortado a 20, y con el resto hasta 20 apagado. Por debajo de 4 lee lo que ya hay en la VRAM y le da la vuelta al nibble, que es como parpadea cuando queda poco
	ld a,(0d3c1h)		;f2d1
	ld hl,06050h		;f2d4
	cp 014h		;f2d7
	jr c,L_F2DD		;f2d9
	ld a,014h		;f2db
L_F2DD:
	ld b,a			;f2dd
	ld a,014h		;f2de
	sub b			;f2e0
	push af			;f2e1
	ld a,b			;f2e2
	and a			;f2e3
	jr z,L_F33A		;f2e4
	cp 004h		;f2e6
	jr nc,L_F301		;f2e8
	call vram_pon_dir_lee		;f2ea
	in a,(098h)		;f2ed
	ei			;f2ef
	ld c,a			;f2f0
	ld a,(0f393h)		;f2f1
	and a			;f2f4
	jr nz,L_F303		;f2f5
	rrc c		;f2f7
	rrc c		;f2f9
	rrc c		;f2fb
	rrc c		;f2fd
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
	or 040h		;f30a
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
	cp 002h		;f31c
	jr c,L_F328		;f31e
	ld c,0f5h		;f320
	cp 009h		;f322
	jr c,L_F328		;f324
	ld c,0f1h		;f326
L_F328:
	inc a			;f328
	ld d,a			;f329
	ld a,l			;f32a
	add a,008h		;f32b
	cp 080h		;f32d
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
	or 040h		;f344
	out (099h),a		;f346
	ld c,008h		;f348
L_F34A:
	ld a,011h		;f34a
	out (098h),a		;f34c
	ei			;f34e
	dec c			;f34f
	jr nz,L_F34A		;f350
	ld a,l			;f352
	add a,008h		;f353
	cp 080h		;f355
	jr nz,L_F35F		;f357
	ld a,h			;f359
	add a,008h		;f35a
	ld h,a			;f35c
	ld a,040h		;f35d
L_F35F:
	ld l,a			;f35f
	djnz L_F33E		;f360
	ret			;f362
parpadeo_energia:		; El parpadeo de la barra de energia cuando queda poca: solo actua si 0xD3C1 vale 1, 2 o 3, y una vez de cada ocho; lee el color de la barra en la VRAM, le da la vuelta al nibble con cuatro `rrca` y lo reescribe
	ld a,(0d3c1h)		;f363
	cp 004h		;f366
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
	call vram_pon_dir_lee		;f37c
	in a,(098h)		;f37f
	ei			;f381
	rrca			;f382
	rrca			;f383
	rrca			;f384
	rrca			;f385
	ex af,af'			;f386
	call vram_pon_dir		;f387
	ex af,af'			;f38a
L_F38B:
	out (098h),a		;f38b
	and a			;f38d
	dec b			;f38e
	jr nz,L_F38B		;f38f
	ei			;f391
	ret			;f392

; ----------------------------------------------------------------------
; DATOS relleno_F393: Relleno o resto (1 B; 1 bytes)
;   0xf393..0xf394  (1 bytes)
DATA_relleno_F393:
	defb 000h	; f393

; ======================================================================
; CODIGO 0xf394..0xf77d  (1001 bytes)
; ======================================================================


premia:		; Suma B al marcador por el digito que apunte HL (dentro de los seis de 0xDD80) y lo repinta en 0x12B0: es suma_puntos con IX y DE ya puestos, y salvando IX
	push ix		;f394
	ld ix,0dd80h		;f396
	ld de,012b0h		;f39a
	call suma_puntos		;f39d
	pop ix		;f3a0
	ret			;f3a2
pinta_marca_hud:		; Pinta la marca del HUD en HL con el color 0x11; la entrada de 0xF3A7 hace lo mismo con el 0x71, que es como se enciende y se apaga
	ld a,011h		;f3a3
	jr L_F3A9		;f3a5
marca_hud_enciende:		; La entrada de ENCENDER de pinta_marca_hud: el mismo cuadro de 2x2 celdas, pero con 0x71 en vez del 0x11 con que lo apaga la entrada de 0xF3A3
	ld a,071h		;f3a7
L_F3A9:
	ld b,002h		;f3a9
L_F3AB:
	push bc			;f3ab
	push hl			;f3ac
	ld c,002h		;f3ad
	call vram_pon_dir		;f3af
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
	cp 038h		;f3bf
	jr nz,L_F3CE		;f3c1
	ld a,l			;f3c3
	and 0c0h		;f3c4
	ld l,a			;f3c6
	ld a,h			;f3c7
	add a,008h		;f3c8
	ld h,a			;f3ca
	call vram_pon_dir		;f3cb
L_F3CE:
	pop af			;f3ce
	dec c			;f3cf
	jr nz,L_F3B2		;f3d0
	pop hl			;f3d2
	ld bc,00040h		;f3d3
	add hl,bc			;f3d6
	pop bc			;f3d7
	djnz L_F3AB		;f3d8
	ei			;f3da
	ret			;f3db
vuelca_pantalla:		; El volcado del buffer a la VRAM en las tres bandas de siempre: 0x4000 -> 0x0108 (56 filas), 0x4540 -> 0x0900 (64) y 0x4B40 -> 0x1100 (40)
	ld de,04000h		;f3dc
	ld hl,00108h		;f3df
	ld b,038h		;f3e2
	call vuelca_columnas		;f3e4
	ld de,04540h		;f3e7
	ld hl,00900h		;f3ea
	ld b,040h		;f3ed
	call vuelca_columnas		;f3ef
	ld de,04b40h		;f3f2
	ld hl,01100h		;f3f5
	ld b,028h		;f3f8
	call vuelca_columnas		;f3fa
	ei			;f3fd
	ret			;f3fe
vuelca_columnas:		; El nucleo del volcado: 24 vueltas por banda, cada una recogiendo B bytes del buffer A SALTOS DE 24 -o sea una columna- y soltandolos por el puerto 0x98, avanzando 0x40 en la VRAM entre columna y columna
	ld c,018h		;f3ff
L_F401:
	push bc			;f401
	call vram_pon_dir		;f402
	push de			;f405
	push hl			;f406
	ex de,hl			;f407
	ld de,00018h		;f408
L_F40B:
	ld a,(hl)			;f40b
	out (098h),a		;f40c
	add hl,de			;f40e
	djnz L_F40B		;f40f
	pop hl			;f411
	ld de,00040h		;f412
	add hl,de			;f415
	pop de			;f416
	inc de			;f417
	pop bc			;f418
	dec c			;f419
	jr nz,L_F401		;f41a
	ret			;f41c
hud_imprime:		; El rotulador del HUD: IX = cadena de indices de glifo terminada en 0, DE = tabla de PATRONES; 8 bytes por glifo desde la fuente de 0x5F00 y +0x40 por glifo, que con la tabla de nombres intercalada de a 8 es la celda contigua
	ld a,(ix+000h)		;f41d
	and a			;f420
	ret z			;f421
	ld l,a			;f422
	ld h,000h		;f423
	add hl,hl			;f425
	add hl,hl			;f426
	add hl,hl			;f427
	ld bc,05f00h		;f428
	add hl,bc			;f42b
	ex de,hl			;f42c
	call vram_pon_dir		;f42d
	ld b,008h		;f430
L_F432:
	ld a,(de)			;f432
	out (098h),a		;f433
	inc de			;f435
	and a			;f436
	and a			;f437
	djnz L_F432		;f438
	ei			;f43a
	ld de,00040h		;f43b
	add hl,de			;f43e
	ex de,hl			;f43f
	inc ix		;f440
	jp hud_imprime		;f442
redefine_teclas:		; La pantalla de REDEFINIR TECLAS: limpia el buffer, marca como libres los nombres de tecla quitandoles el bit 7, fuerza teclado en 0xDCC3 y da ocho vueltas rotulando desde 0xDB68, con siete llamadas intercaladas que rellenan las siete entradas de la tabla de 0xDCB1
	call borra_buffer		;f445
	call vuelca_pantalla		;f448
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
	call rotula_secuencia		;f467
	pop bc			;f46a
	dec c			;f46b
	jr nz,redefine_tecla		;f46c
	ld b,c			;f46e
L_F46F:
	dec bc			;f46f
	ld a,b			;f470
	or c			;f471
	jr nz,L_F46F		;f472
	ret			;f474
lee_tecla_pulsada:		; Barre las nueve filas de la matriz y devuelve en E el indice fila*8 + bit de la primera tecla pulsada, que es justo el indice de la tabla de nombres de 0xDC09
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
	jr z,lee_tecla_pulsada		;f488
	jr L_F478		;f48a
redefine_tecla:		; Espera una tecla y guarda su entrada en la tabla: la mascara del bit en (iy+000) y el valor del puerto en (iy+001), y saca su nombre de 0xDC09
	call lee_tecla_pulsada		;f48c
	xor a			;f48f
	scf			;f490
L_F491:
	rra			;f491
	djnz L_F491		;f492
	ld (iy+000h),a		;f494
	inc iy		;f497
	ld (iy+000h),d		;f499
	inc iy		;f49c
	ld d,b			;f49e
	push hl			;f49f
	ld hl,0dc09h		;f4a0
	add hl,de			;f4a3
	ld a,(hl)			;f4a4
	bit 7,a		;f4a5
	jr z,L_F4B0		;f4a7
	dec iy		;f4a9
	dec iy		;f4ab
	pop hl			;f4ad
	jr redefine_tecla		;f4ae
L_F4B0:
	set 7,(hl)		;f4b0
	push ix		;f4b2
	pop hl			;f4b4
	ld b,006h		;f4b5
L_F4B7:
	ld (hl),020h		;f4b7
	inc hl			;f4b9
	djnz L_F4B7		;f4ba
	cp 015h		;f4bc
	jr c,L_F4C6		;f4be
	ld (ix+000h),a		;f4c0
	pop hl			;f4c3
	jr L_F466		;f4c4
L_F4C6:
	ld b,a			;f4c6
	ld hl,0dc52h		;f4c7
	jr L_F4D2		;f4ca
L_F4CC:
	ld a,(hl)			;f4cc
	cp 000h		;f4cd
	inc hl			;f4cf
	jr nz,L_F4CC		;f4d0
L_F4D2:
	djnz L_F4CC		;f4d2
	push ix		;f4d4
	pop de			;f4d6
L_F4D7:
	ld a,(hl)			;f4d7
	cp 000h		;f4d8
	jr z,L_F4E1		;f4da
	ld (de),a			;f4dc
	inc hl			;f4dd
	inc de			;f4de
	jr L_F4D7		;f4df
L_F4E1:
	pop hl			;f4e1
	jr L_F466		;f4e2
rotula_secuencia:		; Recorre la cadena de (IX) hasta el 0 pasandole cada byte a rotulador_cmd, tras dejar el sonido en su sitio
	call sonido_reset		;f4e4
L_F4E7:
	ld a,(ix+000h)		;f4e7
	inc ix		;f4ea
	and a			;f4ec
	jr z,sonido_reset		;f4ed
	call rotulador_cmd		;f4ef
	jr L_F4E7		;f4f2
arranca_musica_carteles:		; Instala de golpe los tres guiones de la musica de los carteles -0xEB38, 0xED61 y 0xED6B- en los tres canales, los dos primeros sin `ei`
	ld a,080h		;f4f4
	ld de,0eb38h		;f4f6
	push hl			;f4f9
	call arranca_guion		;f4fa
	inc a			;f4fd
	ld de,0ed61h		;f4fe
	call arranca_guion		;f501
	ld a,002h		;f504
	ld de,0ed6bh		;f506
	call arranca_guion		;f509
	pop hl			;f50c
	ret			;f50d
sonido_reset:		; Reabre el sonido reponiendo el `di` (0xF3) que sonido_off machaco, y deja los tres canales a cero con un guion nulo
	ld a,0f3h		;f50e
	ld (0e1bch),a		;f510
	ld (0e18fh),a		;f513
	xor a			;f516
	ld de,00000h		;f517
	push hl			;f51a
	call arranca_guion		;f51b
	inc a			;f51e
	call arranca_guion		;f51f
	inc a			;f522
	call arranca_guion		;f523
	pop hl			;f526
	ret			;f527
rotulador_cmd:		; Estampa un caracter en la VRAM, o lo ejecuta como orden si es menor de 0x20: 0x01 recoloca el cursor con el byte siguiente de (IX) y 0x14 llama a sonido_reset y espera
	ld bc,00bb8h		;f528
	push af			;f52b
	call espera_bc2		;f52c
	pop af			;f52f
	cp 020h		;f530
	jr nc,L_F5A9		;f532
	call vram_pon_dir		;f534
	ld b,008h		;f537
	push af			;f539
L_F53A:
	xor a			;f53a
	out (098h),a		;f53b
	and a			;f53d
	and a			;f53e
	djnz L_F53A		;f53f
	ei			;f541
	pop af			;f542
	cp 001h		;f543
	jr nz,L_F561		;f545
	ld a,h			;f547
	and 018h		;f548
	ld h,a			;f54a
	ld a,l			;f54b
	and 038h		;f54c
	ld l,a			;f54e
	ld a,(ix+000h)		;f54f
	inc ix		;f552
	push hl			;f554
	ld l,a			;f555
	ld h,000h		;f556
	ld b,006h		;f558
L_F55A:
	add hl,hl			;f55a
	djnz L_F55A		;f55b
	pop bc			;f55d
	add hl,bc			;f55e
	jr L_F5C8		;f55f
L_F561:
	cp 014h		;f561
	jr nz,L_F574		;f563
	call sonido_reset		;f565
	ld bc,00000h		;f568
	call espera_bc2		;f56b
	call espera_bc2		;f56e
	jp arranca_musica_carteles		;f571
L_F574:
	ld a,h			;f574
	and 018h		;f575
	ld h,a			;f577
	ld a,l			;f578
	and 038h		;f579
	ld l,a			;f57b
	cp 038h		;f57c
	jr nz,L_F588		;f57e
	ld a,h			;f580
	add a,009h		;f581
	ld h,a			;f583
	ld l,000h		;f584
	jr L_F58C		;f586
L_F588:
	ld bc,00108h		;f588
	add hl,bc			;f58b
L_F58C:
	ld b,007h		;f58c
	call vram_pon_dir		;f58e
L_F591:
	ld a,07fh		;f591
	out (098h),a		;f593
	and a			;f595
	and a			;f596
	djnz L_F591		;f597
	ei			;f599
	push hl			;f59a
	call sonido_reset		;f59b
	ld bc,00fa0h		;f59e
	call espera_bc2		;f5a1
	call arranca_musica_carteles		;f5a4
	pop hl			;f5a7
	ret			;f5a8
L_F5A9:
	push hl			;f5a9
	ld l,a			;f5aa
	ld h,000h		;f5ab
	add hl,hl			;f5ad
	add hl,hl			;f5ae
	add hl,hl			;f5af
	ld de,05f00h		;f5b0
	add hl,de			;f5b3
	ex de,hl			;f5b4
	pop hl			;f5b5
	call vram_pon_dir		;f5b6
	ld b,008h		;f5b9
L_F5BB:
	ld a,(de)			;f5bb
	out (098h),a		;f5bc
	inc de			;f5be
	and a			;f5bf
	and a			;f5c0
	djnz L_F5BB		;f5c1
	ei			;f5c3
	ld bc,00040h		;f5c4
	add hl,bc			;f5c7
L_F5C8:
	call vram_pon_dir		;f5c8
	ld b,007h		;f5cb
L_F5CD:
	ld a,07fh		;f5cd
	out (098h),a		;f5cf
	and a			;f5d1
	and a			;f5d2
	djnz L_F5CD		;f5d3
	ei			;f5d5
	ld b,000h		;f5d6
L_F5D8:
	djnz L_F5D8		;f5d8
	ret			;f5da
espera_bc2:		; Espera activa de BC vueltas; es la gemela de espera_bc, en la otra punta del bloque
	dec bc			;f5db
	ld a,b			;f5dc
	or c			;f5dd
	jr nz,espera_bc2		;f5de
	ret			;f5e0
vram_avanza_fila:		; Avanza la direccion de VRAM una fila de pixel y, al agotar el bloque de 0x40, salta al tercio siguiente (l and 0xC0, h + 8) reprogramando el puerto 0x99
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
dibuja_sprite_vram:		; Estampa un sprite de 0xA560 derecho en la VRAM (0x1758), 16 filas por 2 columnas leyendo un byte de cada cuatro. El bit 0 de A elige que mitad de la entrada se pinta -par la mascara, impar el dibujo- y el resto es el numero de sprite
	and a			;f5f4
	rra			;f5f5
	push af			;f5f6
	ld l,a			;f5f7
	ld h,000h		;f5f8
	add hl,hl			;f5fa
	add hl,hl			;f5fb
	add hl,hl			;f5fc
	add hl,hl			;f5fd
	add hl,hl			;f5fe
	add hl,hl			;f5ff
	ld de,0a560h		;f600
	add hl,de			;f603
	pop af			;f604
	jr nc,L_F609		;f605
	inc hl			;f607
	inc hl			;f608
L_F609:
	ld c,002h		;f609
	ld de,01758h		;f60b
	ex de,hl			;f60e
L_F60F:
	push hl			;f60f
	call vram_pon_dir		;f610
	ld b,010h		;f613
L_F615:
	ld a,(de)			;f615
	out (098h),a		;f616
	inc de			;f618
	inc de			;f619
	inc de			;f61a
	inc de			;f61b
	call vram_avanza_fila		;f61c
	djnz L_F615		;f61f
	ei			;f621
	ld hl,0ffc1h		;f622
	add hl,de			;f625
	ex de,hl			;f626
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
rellena_colores:		; Pone el color A en la tabla de colores de la pantalla, tercio a tercio: 0x2108 x 56 filas, 0x2900 x 64 y 0x3100 x 40, las tres bandas de siempre, 24 caracteres de ancho
	ld hl,02108h		;f634
	ld c,038h		;f637
	call rellena_colores_banda		;f639
	ld hl,02900h		;f63c
	ld c,040h		;f63f
	call rellena_colores_banda		;f641
	ld hl,03100h		;f644
	ld c,028h		;f647
rellena_colores_banda:		; El nucleo de rellena_colores: 24 columnas y, en cada una, C bytes del color de A, avanzando 0x40 en la VRAM entre columna y columna
	ld b,018h		;f649
L_F64B:
	call vram_pon_dir		;f64b
	push bc			;f64e
	push hl			;f64f
L_F650:
	out (098h),a		;f650
	and a			;f652
	dec c			;f653
	jr nz,L_F650		;f654
	pop hl			;f656
	ld bc,00040h		;f657
	add hl,bc			;f65a
	pop bc			;f65b
	djnz L_F64B		;f65c
	ei			;f65e
	ret			;f65f
hay_tecla:		; Vuelve con NZ si hay alguna tecla pulsada, barriendo las nueve filas de la matriz (0xF0 a 0xF8) por los puertos 0xAA y 0xA9
	ld d,0f0h		;f660
L_F662:
	ld a,d			;f662
	out (0aah),a		;f663
	in a,(0a9h)		;f665
	cp 0ffh		;f667
	ret nz			;f669
	inc d			;f66a
	ld a,0f9h		;f66b
	cp d			;f66d
	ret z			;f66e
	jr L_F662		;f66f
L_F671:
	call borra_buffer		;f671
	call vuelca_pantalla		;f674
	ld ix,0dd87h		;f677
	ld hl,00118h		;f67b
	call rotula_secuencia		;f67e
	pop de			;f681
	push hl			;f682
	ld h,d			;f683
	ld l,e			;f684
	inc de			;f685
	ld bc,00005h		;f686
	ld (hl),020h		;f689
	ldir		;f68b
	ld bc,00005h		;f68d
	and a			;f690
	sbc hl,bc		;f691
	ex de,hl			;f693
	ld b,006h		;f694
	pop hl			;f696
L_F697:
	push bc			;f697
	push de			;f698
L_F699:
	call hay_tecla		;f699
	jr nz,L_F699		;f69c
	ld bc,007d0h		;f69e
	call espera_bc		;f6a1
	call lee_tecla_pulsada		;f6a4
	ld d,000h		;f6a7
	push hl			;f6a9
	ld hl,0dc09h		;f6aa
	add hl,de			;f6ad
	ld a,(hl)			;f6ae
	pop hl			;f6af
	and 07fh		;f6b0
	cp 030h		;f6b2
	jr nc,L_F6C8		;f6b4
	cp 014h		;f6b6
	jr z,L_F6E6		;f6b8
	cp 011h		;f6ba
	jr z,L_F6C6		;f6bc
	cp 010h		;f6be
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
	ld (de),a			;f6cb
	push de			;f6cc
	call rotulador_cmd		;f6cd
	pop de			;f6d0
	inc de			;f6d1
	pop bc			;f6d2
	djnz L_F697		;f6d3
L_F6D5:
	ld a,00dh		;f6d5
	call rotulador_cmd		;f6d7
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
	cp 006h		;f6eb
	jp z,L_F699		;f6ed
	call vram_pon_dir		;f6f0
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
	call vram_pon_dir		;f703
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
	ld (de),a			;f716
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
	call borra_buffer		;f726
	call vuelca_pantalla		;f729
	ld ix,0dac6h		;f72c
	ld hl,00108h		;f730
	call rotula_secuencia		;f733
L_F736:
	call hay_tecla		;f736
	jr z,L_F736		;f739
L_F73B:
	call vuelca_pantalla		;f73b
	ld ix,0f7d6h		;f73e
	ld hl,001f0h		;f742
	call rotula_secuencia		;f745
	ld hl,0dd08h		;f748
	ld de,0d6d8h		;f74b
	ld bc,0007fh		;f74e
	ldir		;f751
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
	call carga_cinta		;f765
	jr nc,L_F756		;f768
	ld a,(0f77dh)		;f76a
	cp 002h		;f76d
	jr nz,L_F756		;f76f
	ld ix,0f7e6h		;f771
	ld hl,009d0h		;f775
	call rotula_secuencia		;f778
	jr $+3		;f77b

; ----------------------------------------------------------------------
; DATOS relleno_F77D: Relleno o resto (1 B; 1 bytes)
;   0xf77d..0xf77e  (1 bytes)
DATA_relleno_F77D:
	defb 000h	; f77d

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
	call carga_cinta		;f78c
	jr nc,L_F79D		;f78f
	dec ix		;f791
	ld b,(ix+000h)		;f793
	ld a,(0f76eh)		;f796
	cp b			;f799
	jp z,L_F7B0		;f79a
L_F79D:
	call vuelca_pantalla		;f79d
	ld ix,0f7c7h		;f7a0
	ld hl,001f8h		;f7a4
	call rotula_secuencia		;f7a7
	call pausa_larga		;f7aa
	jp L_F73B		;f7ad
L_F7B0:
	ld a,001h		;f7b0
	ld (0a529h),a		;f7b2
	jp 0a279h		;f7b5
pausa_larga:		; Ocho vueltas de un bucle de 65536, para que de tiempo a leer el ERROR DE CARGA antes de reintentar. Es lo unico que la llama (0xF7AA)
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
; DATOS tabla_F7C7: Tabla (47 B; racha 1.95, entropia 3.71, 15 valores: pocos
;   valores para ser un dibujo)
;   0xf7c7..0xf7f6  (47 bytes)
DATA_tabla_F7C7:
	defb 045h,052h,052h,04fh,052h,020h,044h,045h,020h,043h,041h,052h,047h,041h,000h,042h	; f7c7  ERROR DE CARGA.B
	defb 055h,053h,043h,041h,04eh,044h,04fh,020h,046h,041h,053h,045h,020h,032h,000h,043h	; f7d7  USCANDO FASE 2.C
	defb 041h,052h,047h,041h,04eh,044h,04fh,020h,046h,041h,053h,045h,020h,032h,000h	; f7e7  ARGANDO FASE 2.

; ======================================================================
; CODIGO 0xf7f6..0xf8c8  (210 bytes)
; ======================================================================


carga_cinta:		; La carga de la segunda parte: empuja a mano la vuelta a 0xF89F, arranca el motor (0xAB) y el registro 14 del PSG, y engancha el tono guia midiendo pulsos contra 0x9C y 0xC6. Es LD-BYTES de la ROM del Spectrum, con la lectura del bit adaptada al PSG del MSX
	ld hl,carga_vuelta		;f7f6
	push hl			;f7f9
	push af			;f7fa
	ld a,008h		;f7fb
	out (0abh),a		;f7fd
	ld a,00eh		;f7ff
	out (0a0h),a		;f801
	pop af			;f803
	inc d			;f804
	ex af,af'			;f805
	dec d			;f806
	di			;f807
	ld a,005h		;f808
	ld c,a			;f80a
	cp a			;f80b
L_F80C:
	call lee_bit_cinta		;f80c
	jr nc,L_F80C		;f80f
	ld hl,00415h		;f811
L_F814:
	djnz L_F814		;f814
	dec hl			;f816
	ld a,h			;f817
	or l			;f818
	jr nz,L_F814		;f819
	call lee_bit_cinta2		;f81b
	jr nc,L_F80C		;f81e
L_F820:
	ld b,09ch		;f820
	call lee_bit_cinta2		;f822
	jr nc,L_F80C		;f825
	ld a,0c6h		;f827
	cp b			;f829
	jr nc,L_F80C		;f82a
	inc h			;f82c
	jr nz,L_F820		;f82d
L_F82F:
	ld b,0c9h		;f82f
	call lee_bit_cinta		;f831
	jr nc,L_F80C		;f834
	ld a,b			;f836
	cp 0d4h		;f837
	jr nc,L_F82F		;f839
	call lee_bit_cinta		;f83b
	ret nc			;f83e
	ld h,000h		;f83f
	ld b,0b0h		;f841
	jr L_F85D		;f843
L_F845:
	ex af,af'			;f845
	jr nz,L_F84D		;f846
	ld (ix+000h),l		;f848
	jr L_F857		;f84b
L_F84D:
	rr c		;f84d
	xor l			;f84f
	ret nz			;f850
	ld a,c			;f851
	rla			;f852
	ld c,a			;f853
	inc de			;f854
	jr L_F859		;f855
L_F857:
	inc ix		;f857
L_F859:
	dec de			;f859
	ex af,af'			;f85a
	ld b,0b2h		;f85b
L_F85D:
	ld l,001h		;f85d
L_F85F:
	call lee_bit_cinta2		;f85f
	ret nc			;f862
	ld a,0cbh		;f863
	cp b			;f865
	rl l		;f866
	ld b,0b0h		;f868
	jp nc,L_F85F		;f86a
	ld a,h			;f86d
	xor l			;f86e
	ld h,a			;f86f
	ld a,d			;f870
	or e			;f871
	jr nz,L_F845		;f872
	ld a,h			;f874
	cp 001h		;f875
	ret			;f877
lee_bit_cinta2:		; Dos flancos seguidos con lee_bit_cinta, y vuelve en cuanto el primero falla
	call lee_bit_cinta		;f878
	ret nc			;f87b
lee_bit_cinta:		; Espera el siguiente flanco en el bit 7 del puerto 0xA2 contando vueltas en B, y de paso remueve el color del borde (registro 7 del VDP) con `ld a,r`, que es como el Spectrum hace rayas mientras carga
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
	ld a,r		;f893
	and 00fh		;f895
	out (099h),a		;f897
	ld a,087h		;f899
	out (099h),a		;f89b
	scf			;f89d
	ret			;f89e
carga_vuelta:		; El final de la carga, y la direccion que carga_cinta se empuja a si misma en 0xF7F7: para el motor de la cinta y devuelve el borde a negro por el registro 7 del VDP, deshaciendo el `ld a,r` con que 0xF893 lo hace parpadear. No toca ni una bandera, para que el acarreo de exito llegue intacto
	ld e,013h		;f89f
	ld a,009h		;f8a1
	out (0abh),a		;f8a3
	ld a,001h		;f8a5
	out (099h),a		;f8a7
	ld a,087h		;f8a9
	out (099h),a		;f8ab
	ret			;f8ad
dir_vram_de_fila_columna:		; De la fila de pixel D y la columna de caracter E a la direccion de VRAM: tercio*0x800 + columna*0x40 + fila dentro del tercio, el orden por columnas que impone la tabla de nombres heredada de la pantalla de carga. Identica byte a byte a la de la fase de a pie
	ld l,000h		;f8ae
	ld a,e			;f8b0
	rra			;f8b1
	rr l		;f8b2
	rra			;f8b4
	rr l		;f8b5
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
; DATOS relleno_del_master: Relleno de la grabacion del master (1311 B): RAM
;   sin inicializar volcada tal cual. Son 00/FF alternados de dos en dos, con
;   una marca y un volteo de fase cada 128 bytes EXACTOS (0xF9A8, 0xFA28,
;   0xFAA8... el aspecto de una DRAM recien encendida) y una decena de bytes
;   sueltos que la maquina del master ya habia tocado. Remata el bloque justo
;   debajo del buzon de POKEs de 0xFDE8. Medido DOS veces
;   (tools/omsx_f972.tcl): 350 s de partida de naves, y la partida COMPLETA de
;   Araubi (2275 s, multicarga y fase a pie incluidas). En los 38 minutos, las
;   unicas escrituras al tramo son las CUATRO del arranque que instalan los
;   ganchos H.KEYI/H.TIMI (PCs 0xBD98/0xBD9D/0xBDA3, todas en t=449, el final
;   de la carga), y las unicas lecturas los fetches de esos ganchos
;   (0xFD9A/0xFD9F). Nadie usa el resto ni una vez
;   0xf8c8..0xfde7  (1311 bytes)
DATA_relleno_del_master:
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
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; f968  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; f978  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; f988  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; f998  ................
	defb 043h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; f9a8  C...............
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; f9b8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; f9c8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; f9d8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; f9e8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; f9f8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; fa08  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; fa18  ................
	defb 083h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fa28  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fa38  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fa48  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fa58  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fa68  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fa78  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fa88  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fa98  ................
	defb 094h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; faa8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; fab8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; fac8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; fad8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; fae8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; faf8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; fb08  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; fb18  ................
	defb 09dh,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fb28  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fb38  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fb48  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fb58  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fb68  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fb78  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fb88  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fb98  ................
	defb 024h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; fba8  $...............
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; fbb8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; fbc8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; fbd8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; fbe8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; fbf8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; fc08  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; fc18  ................
	defb 01ch,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fc28  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fc38  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fc48  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fc58  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fc68  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fc78  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fc88  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fc98  ................
	defb 0c1h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; fca8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; fcb8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; fcc8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; fcd8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; fce8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; fcf8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; fd08  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; fd18  ................
	defb 0fah,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fd28  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fd38  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fd48  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fd58  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fd68  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fd78  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fd88  ................
	defb 000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fd98  ................
	defb 0e8h,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; fda8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; fdb8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h	; fdc8  ................
	defb 0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh,000h,0ffh	; fdd8  ...............
