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
L_EFBB:	equ 0x0efbb
L_F3F1:	equ 0x0f3f1
L_F849:	equ 0x0f849

; ----------------------------------------------------------------------
; Destinos de salto que z80dasm referencia pero que el trazador no
; marco como codigo. Cada uno es un sitio a revisar: probablemente
; hay codigo ahi que falta por trazar.
; ----------------------------------------------------------------------
lcb9dh:	equ 0x0cb9d
lcc32h:	equ 0x0cc32
ld959h:	equ 0x0d959
lef00h:	equ 0x0ef00

; ----------------------------------------------------------------------
; DATOS el: logo STARDUST del menu/atraccion: bitmap de 128x16 px, 16 B por fila; lo copia el animador del arranque (ld hl,047a0h en 0xF037, 16 ldi por fila)
;   0x47a0..0x48a0  (256 bytes)
; DATOS patrones: del MARCO de la pantalla de juego -el cuadro decorado con el HUD que rodea el area de juego- (0x900 B): L_EF28 los copia a la VRAM 0x0000 (fuente ld de,048a0h en 0xEF10) en dos filas de caracter por tercio mas 24 tiras de 8 B y 24 de 0x18 B. Quien recoloca esos 288 caracteres en el borde es la tabla de NOMBRES del SCREEN 2, y el juego NO la monta: LA HEREDA de la pantalla de carga (la rutina 0x9BDB del bloque [09] la rellena sumando ocho; la carga del bloque [10] machaca esa rutina en RAM pero la VRAM sobrevive). Contrastado contra la VRAM real en marcha: 768/768 nombres identicos al patron del 9BDB, 97,4% de los 4608 bytes de patrones/colores identicos (el resto es lo que el juego pinta encima), y dibujado desde la cinta con ese mapeo sale el marco entero (tools/render_marco.py -> docs/imagenes/marco.png). Doble papel: en marcha 0x47A0-0x4B3F es el final de la banda B del buffer y 0x4B40-0x4EFF la banda C entera
;   0x48a0..0x51a0  (2304 bytes)
; DATOS colores: del MARCO de la pantalla de juego (los mismos 0x900 B, segunda llamada a L_EF28 con destino VRAM 0x2000). Aqui vivian los rangos "colores de tiles" medidos por su firma de nibble: la firma era verdad, pero son los colores del marco, no de los tiles del juego
;   0x51a0..0x5aa0  (2304 bytes)
; DATOS tabla: (401 B; racha 7.98, entropia 1.05, 4 valores: pocos valores para ser un dibujo)
;   0x5aa0..0x5c31  (401 bytes)
; DATOS relleno:: 972 bytes
;   0x5c31..0x5ffd  (972 bytes)
; DATOS graficos: (339 B; racha 4.22, entropia 4.33, 50 valores: rachas mas largas que el azar)
;   0x5ffd..0x6150  (339 bytes)
; DATOS charset:: 59 caracteres de 8x8
;   0x6000..0x61d8  (472 bytes)
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
; DATOS sprites:: 83 de 16x16 con mascara, 64 bytes cada uno
;   0xa560..0xba20  (5312 bytes)
; DATOS la: DEMO: los mandos grabados, un byte por fotograma (869 B = 17,4 s)
;   0xba20..0xbd85  (869 bytes)
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
	defb 017h,000h,06fh,000h,017h,000h,06fh,000h,017h,000h,06fh,000h,017h,000h,06fh,000h	; 4950  ..o...o...o...o.
	defb 0ffh,0fdh,0ffh,0ffh,0ffh,003h,0afh,0ffh,0ffh,0bfh,05fh,043h,04fh,0bfh,0ffh,0ffh	; 4960  .........._CO...
	defb 0ffh,003h,0afh,0ffh,0ffh,0ffh,0ffh,003h,0afh,0ffh,0ffh,0efh,0d7h,013h,097h,0efh	; 4970  ................
	defb 0ffh,0ffh,0ffh,003h,0afh,0ffh,0fdh,0ffh,000h,000h,0feh,000h,0f8h,000h,0feh,000h	; 4980  ................
	defb 0f8h,000h,0feh,000h,0f8h,000h,0feh,000h,0f8h,000h,0feh,000h,0f8h,000h,0feh,000h	; 4990  ................
	defb 0bah,0feh,000h,07ch,000h,0feh,0eeh,0d6h,0d6h,0d6h,054h,038h,038h,000h,0feh,0deh	; 49a0  ...|......T88...
	defb 0aah,000h,010h,000h,038h,018h,038h,000h,010h,010h,010h,010h,010h,010h,010h,000h	; 49b0  ....8.8.........
	defb 038h,038h,000h,05ch,000h,0beh,07eh,0beh,07eh,000h,05ch,000h,038h,000h,05ch,000h	; 49c0  88.\..~.~.\.8.\.
	defb 038h,000h,05ch,000h,038h,000h,05ch,000h,016h,016h,016h,006h,03ah,01ah,03ah,01ah	; 49d0  8.\.8.\.....:.:.
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h,000h,018h,024h,05ah,05ah,024h,018h,000h	; 49e0  ..$ZZ$....$ZZ$..
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h,000h,018h,024h,05ah,05ah,024h,018h,000h	; 49f0  ..$ZZ$....$ZZ$..
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h,000h,018h,024h,05ah,05ah,024h,018h,000h	; 4a00  ..$ZZ$....$ZZ$..
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h,000h,018h,024h,05ah,05ah,024h,018h,000h	; 4a10  ..$ZZ$....$ZZ$..
	defb 017h,000h,06fh,000h,017h,000h,06fh,000h,0abh,055h,000h,030h,079h,03ah,07ah,039h	; 4a20  ..o...o..U.0y:z9
	defb 078h,039h,0dah,0d9h,0dah,0d9h,0dah,0d9h,038h,037h,057h,038h,039h,0dah,0e9h,0aah	; 4a30  x9......87W89...
	defb 068h,06ah,019h,05ah,039h,07ah,079h,032h,001h,078h,003h,031h,033h,031h,034h,032h	; 4a40  hj.Z9zy2.x.13142
	defb 035h,032h,035h,032h,005h,07ah,0cdh,084h,095h,0cch,079h,004h,03eh,055h,06bh,03fh	; 4a50  5252.z....y.>Uk?
	defb 0f8h,000h,0feh,000h,0f8h,000h,0feh,000h,0ffh,055h,000h,070h,0fch,002h,0feh,0feh	; 4a60  .........U.p....
	defb 02eh,0feh,0feh,0feh,0feh,0c6h,0bah,0aah,07ah,0eah,0fah,06ah,0bah,0bah,0c6h,0feh	; 4a70  ........z..j....
	defb 052h,0feh,0feh,0feh,0feh,0feh,0feh,002h,0fch,070h,000h,000h,080h,0e0h,0b0h,050h	; 4a80  R........p.....P
	defb 038h,098h,048h,09ch,04ch,0a4h,04ch,0a4h,04ch,0a4h,04ch,0a4h,04ch,000h,09eh,09eh	; 4a90  8.H.L.L.L.L.L...
	defb 03ah,01ah,03ah,006h,016h,006h,03ah,01ah,03ah,01ah,02ah,01ah,03ah,01ah,03ah,03ah	; 4aa0  :.:...:.:.*.:.::
	defb 006h,016h,016h,016h,016h,016h,016h,016h,016h,000h,03fh,02bh,035h,03fh,000h,016h	; 4ab0  ..........?+5?..
	defb 016h,016h,000h,03fh,02bh,035h,03fh,000h,016h,016h,016h,016h,016h,016h,017h,000h	; 4ac0  ...?+5?.........
	defb 0ffh,0bch,0f3h,0eeh,0d9h,0d2h,0b5h,0aah,0a5h,0b2h,0d5h,0d8h,0eeh,0f3h,0bch,0ffh	; 4ad0  ................
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h,000h,018h,024h,05ah,05ah,024h,018h,000h	; 4ae0  ..$ZZ$....$ZZ$..
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h,000h,018h,024h,05ah,05ah,024h,018h,000h	; 4af0  ..$ZZ$....$ZZ$..
	defb 000h,018h,024h,05ah,05ah,024h,018h,000h,000h,018h,024h,05ah,05ah,024h,018h,000h	; 4b00  ..$ZZ$....$ZZ$..
	defb 0ffh,03dh,0cfh,077h,01bh,0abh,04dh,0a5h,055h,0adh,04bh,09bh,077h,0cfh,03dh,0ffh	; 4b10  .=.w..M.U.K.w.=.
	defb 001h,03ch,07eh,006h,066h,03eh,046h,01ah,05ah,064h,03ah,001h,001h,01ah,064h,05ah	; 4b20  .<~.f>F.Zd:...dZ
	defb 01ah,044h,03ch,07ch,000h,07dh,001h,07dh,001h,07ch,000h,078h,007h,02fh,027h,02bh	; 4b30  .D<|.}.}.|.x./'+
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
	defb 03fh,078h,057h,055h,078h,03fh,000h,0ffh,03fh,023h,075h,079h,071h,071h,07fh,000h	; 5050  ?xWUx?..?#uyqq..
	defb 0ffh,024h,020h,000h,000h,0ffh,000h,000h,0ffh,001h,0beh,054h,001h,0ffh,000h,0ffh	; 5060  .$ ........T....
	defb 03fh,023h,075h,079h,071h,071h,07fh,000h,0ffh,082h,0bah,07dh,0f9h,060h,000h,000h	; 5070  ?#uyqq.....}.`..
	defb 0ffh,0c0h,0beh,0a9h,086h,0f8h,001h,047h,0bfh,080h,0bdh,0c0h,0bfh,0aah,0a0h,080h	; 5080  .......G........
	defb 01fh,030h,0e5h,04ah,095h,0cah,065h,03fh,0fch,0b8h,0e3h,087h,01eh,06dh,08bh,016h	; 5090  .0.J..e?.....m..
	defb 0edh,01dh,0d5h,003h,0f7h,0aah,005h,003h,0f9h,00ch,057h,0aah,051h,0abh,056h,0fch	; 50a0  ..........W.Q.V.
	defb 000h,000h,0ffh,080h,07fh,0bbh,000h,0ffh,07fh,042h,00ch,01ch,038h,071h,07fh,000h	; 50b0  .........B..8q..
	defb 0c0h,0f0h,02ch,097h,08ah,001h,000h,000h,000h,000h,0feh,001h,0feh,0abh,000h,0ffh	; 50c0  ..,.............
	defb 03fh,021h,071h,071h,071h,071h,07fh,000h,000h,000h,000h,0feh,0eeh,056h,000h,000h	; 50d0  ?!qqqq.......V..
	defb 000h,001h,003h,08fh,0beh,068h,000h,0ffh,03dh,025h,075h,075h,075h,075h,077h,000h	; 50e0  .....h..=%uuuuw.
	defb 000h,000h,0ffh,0ffh,0fbh,055h,0aah,000h,07ch,0c7h,0f7h,09fh,00dh,002h,000h,0ffh	; 50f0  .....U..|.......
	defb 01eh,012h,03fh,071h,071h,071h,071h,000h,000h,000h,000h,07eh,000h,07eh,000h,000h	; 5100  ..?qqqq....~.~..
	defb 003h,00fh,0deh,0e6h,079h,0aah,000h,0ffh,000h,018h,018h,000h,018h,018h,000h,000h	; 5110  ....y...........
	defb 000h,000h,0ffh,0ffh,0efh,055h,0aah,000h,080h,07fh,000h,0aah,0f7h,0ffh,000h,0ffh	; 5120  .....U..........
	defb 03fh,023h,075h,079h,071h,071h,07fh,000h,000h,000h,000h,07fh,07eh,054h,000h,000h	; 5130  ?#uyqq......~T..
	defb 007h,0fbh,005h,0b8h,0f0h,0cfh,030h,0ffh,018h,008h,01ch,01ch,01ch,01ch,01ch,000h	; 5140  ......0.........
	defb 01fh,030h,0e7h,0c0h,080h,000h,000h,000h,0ffh,0fbh,055h,000h,000h,0c0h,0f0h,078h	; 5150  .0........U....x
	defb 0bch,09ch,062h,07eh,054h,042h,080h,09ch,038h,070h,0c0h,000h,000h,000h,000h,000h	; 5160  ..b~TB..8p......
	defb 0f8h,0ebh,050h,000h,000h,000h,00bh,01bh,02ah,05bh,0fbh,0fbh,073h,0bbh,051h,02bh	; 5170  ..P.....*[..s.Q+
	defb 011h,00ah,000h,000h,000h,000h,000h,000h,001h,0ffh,000h,000h,000h,000h,0e4h,075h	; 5180  ...............u
	defb 0b5h,075h,0f5h,0e5h,0f5h,0e5h,0f5h,0e4h,055h,0a0h,000h,000h,000h,000h,000h,000h	; 5190  .u......U.......
	defb 0b1h,0b1h,0b1h,0b1h,0b1h,0b1h,0b1h,0b1h,051h,0a1h,0a1h,0f1h,0a1h,0a1h,0a1h,0a1h	; 51a0  ........Q.......
	defb 0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,031h	; 51b0  ...............1
	defb 031h,031h,031h,031h,031h,031h,031h,031h,031h,051h,051h,051h,051h,051h,051h,0f1h	; 51c0  111111111QQQQQQ.
	defb 021h,021h,021h,021h,0f1h,081h,081h,081h,051h,051h,0f1h,071h,071h,071h,071h,071h	; 51d0  !!!!....QQ.qqqqq
	defb 051h,051h,051h,051h,051h,051h,051h,051h,051h,0a1h,0b1h,0b1h,0b1h,0b1h,0b1h,0f1h	; 51e0  QQQQQQQQQ.......
	defb 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h	; 51f0  ................
	defb 0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f9h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h	; 5200  ................
	defb 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h	; 5210  ................
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5220  ................
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5230  ................
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0a1h,0e1h,0e1h,0e1h,051h,051h,0e1h,0e1h	; 5240  ............QQ..
	defb 051h,051h,0e1h,0e1h,051h,0e1h,0e1h,051h,051h,0e1h,0e1h,0e1h,051h,0e1h,0e1h,0e1h	; 5250  QQ..Q..QQ...Q...
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5260  ................
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5270  ................
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0a1h,071h,0f1h,071h,071h,0f1h,0f1h,071h	; 5280  .........q.qq..q
	defb 071h,071h,0f1h,0f1h,071h,071h,0f1h,0f1h,071h,071h,0f1h,071h,071h,071h,0f1h,071h	; 5290  qq..qq..qq.qqq.q
	defb 071h,071h,051h,051h,0f1h,021h,021h,021h,021h,021h,021h,021h,021h,0f1h,051h,051h	; 52a0  qqQQ.!!!!!!!!.QQ
	defb 051h,071h,071h,0f1h,051h,051h,051h,051h,071h,071h,071h,071h,071h,071h,071h,071h	; 52b0  Qqq.QQQQqqqqqqqq
	defb 0b1h,0b1h,0b1h,0b1h,0b1h,0a1h,0a1h,0a1h,0a1h,0a1h,0c1h,031h,031h,0c1h,0c1h,031h	; 52c0  ...........11..1
	defb 031h,031h,0c1h,031h,031h,031h,0c1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h	; 52d0  11.111..........
	defb 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h	; 52e0  ................
	defb 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h	; 52f0  ................
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
	defb 051h,051h,051h,051h,051h,051h,051h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h	; 54e0  QQQQQQQ.........
	defb 0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,051h,051h,051h,051h,051h,051h,051h	; 54f0  .........QQQQQQQ
	defb 071h,071h,071h,071h,071h,071h,071h,051h,051h,051h,051h,091h,091h,091h,091h,061h	; 5500  qqqqqqqQQQQ....a
	defb 061h,061h,0c1h,0c1h,0c1h,0c1h,0b1h,0b1h,0b9h,0b9h,0b9h,0b9h,0b9h,0b9h,0b9h,0b9h	; 5510  aa..............
	defb 041h,041h,041h,051h,051h,051h,051h,051h,051h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h	; 5520  AAAQQQQQQ.......
	defb 0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,0f1h,051h,051h,051h,051h,051h,051h,051h	; 5530  .........QQQQQQQ
	defb 071h,071h,071h,071h,071h,071h,071h,051h,051h,051h,051h,091h,091h,091h,091h,061h	; 5540  qqqqqqqQQQQ....a
	defb 061h,061h,0f1h,0c1h,0c1h,0c1h,0b1h,0b1h,0b9h,0b9h,0b9h,0b9h,0b9h,0b9h,0b9h,0b9h	; 5550  aa..............
	defb 051h,0f1h,071h,071h,071h,071h,071h,071h,051h,051h,051h,051h,051h,051h,051h,051h	; 5560  Q.qqqqqqQQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h	; 5570  QQQQQQQQQQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h,051h,0f1h,0f1h,091h,091h,091h,091h,061h	; 5580  QQQQQQQQQ......a
	defb 061h,061h,0f1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5590  aa..............
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 55a0  ................
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,021h,021h,021h,021h,021h,021h,021h,021h,021h	; 55b0  .......!!!!!!!!!
	defb 021h,021h,021h,0f1h,091h,091h,091h,091h,091h,091h,091h,081h,081h,081h,081h,081h	; 55c0  !!!.............
	defb 081h,081h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h	; 55d0  ..QQQQQQQQQQQQQQ
	defb 0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h	; 55e0  ................
	defb 0b1h,0b1h,0b1h,0b1h,0b1h,0b1h,0b1h,021h,021h,021h,021h,021h,021h,021h,021h,021h	; 55f0  .......!!!!!!!!!
	defb 021h,021h,021h,021h,021h,021h,021h,021h,0a1h,061h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h	; 5600  !!!!!!!!.a......
	defb 0a1h,081h,051h,051h,051h,051h,051h,051h,071h,071h,071h,071h,071h,071h,071h,071h	; 5610  ..QQQQQQqqqqqqqq
	defb 0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h,0b5h	; 5620  ................
	defb 0b1h,0b1h,0b1h,0b1h,0b1h,0b1h,0b1h,0f1h,051h,051h,051h,051h,021h,021h,021h,021h	; 5630  ........QQQQ!!!!
	defb 021h,021h,021h,021h,021h,021h,021h,021h,0f1h,061h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h	; 5640  !!!!!!!!.a......
	defb 0a1h,0a1h,051h,051h,051h,0f1h,0f1h,0f1h,071h,071h,071h,071h,071h,071h,071h,071h	; 5650  ..QQQ...qqqqqqqq
	defb 0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,051h,051h,051h,051h,051h,051h,051h,051h,051h	; 5660  .......QQQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,021h,021h	; 5670  QQQQQQQQQQQQQQ!!
	defb 021h,021h,021h,021h,021h,021h,021h,0f1h,0f1h,0f1h,0a1h,0a1h,0a1h,0a1h,0a1h,0a1h	; 5680  !!!!!!!.........
	defb 0a1h,0a1h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h	; 5690  ..QQQQQQQQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h	; 56a0  QQQQQQQQQQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h	; 56b0  QQQQQQQQQQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,031h,031h,031h,031h	; 56c0  QQQQQQQQQQQQ1111
	defb 031h,031h,031h,031h,021h,021h,021h,0c1h,0c1h,0c1h,0c1h,0c1h,071h,071h,071h,071h	; 56d0  1111!!!.....qqqq
	defb 071h,071h,071h,071h,071h,071h,071h,071h,0f1h,0f1h,0f1h,0f1h,051h,0f1h,051h,051h	; 56e0  qqqqqqqq....Q.QQ
	defb 0f1h,081h,081h,081h,051h,051h,051h,0f1h,071h,071h,071h,071h,071h,071h,071h,071h	; 56f0  ....QQQ.qqqqqqqq
	defb 071h,071h,071h,071h,071h,071h,071h,071h,071h,051h,051h,051h,0f1h,031h,031h,031h	; 5700  qqqqqqqqqQQQ.111
	defb 031h,031h,031h,021h,021h,021h,021h,0c1h,0c1h,0c1h,0c1h,0c1h,071h,071h,071h,071h	; 5710  111!!!!.....qqqq
	defb 071h,071h,071h,071h,071h,071h,071h,071h,0f1h,0f1h,0f1h,0f1h,051h,0f1h,051h,051h	; 5720  qqqqqqqq....Q.QQ
	defb 081h,081h,081h,081h,051h,051h,051h,051h,071h,071h,071h,071h,071h,071h,071h,071h	; 5730  ....QQQQqqqqqqqq
	defb 071h,071h,071h,071h,071h,071h,071h,071h,051h,051h,051h,031h,031h,031h,031h,031h	; 5740  qqqqqqqqQQQ11111
	defb 031h,031h,031h,021h,021h,021h,021h,021h,021h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5750  111!!!!!!.......
	defb 051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h	; 5760  QQQQQQQQQQQQQQQQ
	defb 0f1h,0f1h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h,051h	; 5770  ..QQQQQQQQQQQQQQ
	defb 051h,051h,051h,051h,051h,051h,051h,051h,051h,031h,031h,031h,031h,031h,031h,031h	; 5780  QQQQQQQQQ1111111
	defb 031h,031h,031h,021h,021h,021h,021h,021h,021h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 5790  111!!!!!!.......
	defb 091h,091h,091h,091h,091h,061h,061h,061h,091h,091h,091h,091h,091h,061h,091h,061h	; 57a0  .....aaa.....a.a
	defb 0f1h,091h,091h,091h,091h,061h,091h,061h,091h,091h,091h,091h,091h,061h,0f1h,061h	; 57b0  .....a.a.....a.a
	defb 091h,091h,091h,091h,091h,061h,0f1h,061h,091h,091h,091h,091h,091h,061h,061h,061h	; 57c0  .....a.a.....aaa
	defb 051h,051h,051h,051h,051h,041h,041h,041h,051h,051h,051h,051h,051h,041h,041h,041h	; 57d0  QQQQQAAAQQQQQAAA
	defb 051h,051h,051h,051h,051h,041h,041h,041h,0f1h,061h,061h,061h,061h,061h,0f1h,0f1h	; 57e0  QQQQQAAA.aaaaa..
	defb 0f1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0f1h,0f1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h,0c1h	; 57f0  ................
	defb 0f1h,051h,051h,051h,041h,041h,041h,0f1h,0f1h,051h,051h,051h,041h,041h,041h,0f1h	; 5800  .QQQAAA..QQQAAA.
	defb 0f1h,041h,041h,041h,041h,041h,0f1h,0f1h,0f1h,041h,041h,041h,041h,041h,0f1h,0f1h	; 5810  .AAAAA...AAAAA..
	defb 0f1h,0f1h,051h,051h,051h,051h,051h,0f1h,0f1h,0f1h,0f1h,041h,041h,0f1h,0f1h,0f1h	; 5820  ..QQQQQ....AA...
	defb 0f1h,0f1h,0f1h,041h,041h,041h,041h,041h,061h,061h,061h,061h,061h,061h,061h,061h	; 5830  ...AAAAAaaaaaaaa
	defb 061h,061h,061h,061h,061h,061h,061h,061h,061h,061h,061h,061h,061h,061h,061h,061h	; 5840  aaaaaaaaaaaaaaaa
	defb 041h,041h,041h,041h,041h,041h,041h,041h,041h,041h,041h,041h,041h,051h,051h,051h	; 5850  AAAAAAAAAAAAAQQQ
	defb 0f1h,0b1h,051h,041h,041h,041h,0a1h,051h,071h,071h,071h,071h,071h,071h,071h,051h	; 5860  ..QAAA.QqqqqqqqQ
	defb 051h,051h,051h,051h,051h,051h,051h,0f1h,0f1h,0b1h,051h,041h,0f1h,0b1h,0f1h,051h	; 5870  QQQQQQQ...QA...Q
	defb 071h,071h,071h,071h,071h,071h,071h,071h,051h,051h,051h,051h,051h,051h,051h,0f1h	; 5880  qqqqqqqqQQQQQQQ.
	defb 0f1h,0b1h,051h,041h,0f1h,0b1h,0f1h,051h,071h,071h,071h,071h,071h,071h,071h,071h	; 5890  ..QA...Qqqqqqqqq
	defb 051h,051h,051h,051h,051h,051h,051h,0f1h,051h,051h,051h,041h,0f1h,0b1h,0f1h,051h	; 58a0  QQQQQQQ.QQQA...Q
	defb 071h,071h,071h,071h,071h,071h,071h,0f1h,051h,051h,051h,051h,051h,051h,051h,0f1h	; 58b0  qqqqqqq.QQQQQQQ.
	defb 0f1h,031h,031h,0c1h,0c1h,031h,0f1h,051h,071h,071h,071h,071h,071h,071h,071h,0f1h	; 58c0  .11..1.Qqqqqqqq.
	defb 051h,051h,051h,051h,051h,051h,051h,051h,0f1h,031h,031h,0c1h,0c1h,031h,0f1h,051h	; 58d0  QQQQQQQQ.11..1.Q
	defb 071h,071h,071h,071h,071h,071h,071h,051h,051h,051h,051h,051h,051h,051h,051h,051h	; 58e0  qqqqqqqQQQQQQQQQ
	defb 031h,031h,031h,0c1h,0c1h,031h,031h,051h,071h,071h,071h,071h,071h,071h,071h,0f1h	; 58f0  111..11Qqqqqqqq.
	defb 051h,051h,051h,051h,051h,051h,051h,051h,031h,031h,031h,0c1h,0c1h,031h,031h,051h	; 5900  QQQQQQQQ111..11Q
	defb 071h,071h,071h,071h,071h,071h,071h,0f1h,051h,051h,051h,051h,051h,051h,051h,051h	; 5910  qqqqqqq.QQQQQQQQ
	defb 051h,051h,051h,041h,0a1h,0f1h,031h,051h,071h,071h,071h,071h,071h,071h,071h,0f1h	; 5920  QQQA..1Qqqqqqqq.
	defb 051h,051h,051h,051h,0f1h,051h,0f1h,0f1h,0f1h,051h,051h,041h,0a1h,0f1h,0f1h,051h	; 5930  QQQQ.Q...QQA...Q
	defb 071h,071h,071h,071h,071h,071h,071h,071h,051h,051h,051h,051h,051h,051h,0f1h,0f1h	; 5940  qqqqqqqqQQQQQQ..
	defb 081h,081h,081h,081h,081h,081h,0f1h,051h,071h,071h,071h,071h,071h,071h,071h,071h	; 5950  .......Qqqqqqqqq
	defb 051h,051h,051h,051h,051h,051h,0f1h,0f1h,081h,081h,091h,091h,081h,081h,0f1h,051h	; 5960  QQQQQQ.........Q
	defb 071h,071h,071h,071h,071h,071h,071h,081h,051h,051h,051h,051h,051h,051h,0f1h,0f1h	; 5970  qqqqqqq.QQQQQQ..
	defb 081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h	; 5980  ................
	defb 081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h	; 5990  ................
	defb 081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h	; 59a0  ................
	defb 0f1h,0f1h,081h,081h,081h,081h,081h,081h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h	; 59b0  ................
	defb 081h,081h,081h,081h,081h,081h,081h,0f1h,0f1h,0f1h,081h,081h,081h,081h,0f1h,081h	; 59c0  ................
	defb 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f1h,0f1h,081h,081h,081h,081h,081h,0f1h	; 59d0  ................
	defb 0f1h,081h,081h,081h,081h,081h,081h,081h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h	; 59e0  ................
	defb 0f1h,071h,071h,071h,071h,071h,071h,0f1h,081h,081h,081h,081h,081h,081h,081h,081h	; 59f0  .qqqqqq.........
	defb 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f1h,071h,091h,091h,071h,091h,0f1h,0f1h	; 5a00  .........q..q...
	defb 061h,061h,061h,061h,061h,061h,051h,081h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h	; 5a10  aaaaaaQ.........
	defb 0f1h,071h,071h,071h,071h,071h,071h,0c1h,051h,051h,051h,051h,051h,051h,051h,081h	; 5a20  .qqqqqq.QQQQQQQ.
	defb 0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f1h,0f1h,0f1h,081h,081h,081h,0f1h,031h	; 5a30  ...............1
	defb 051h,051h,051h,051h,051h,051h,081h,081h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h,0f5h	; 5a40  QQQQQQ..........
	defb 081h,081h,081h,081h,081h,081h,031h,031h,051h,051h,051h,051h,081h,081h,081h,081h	; 5a50  ......11QQQQ....
	defb 081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,081h,031h,031h,031h	; 5a60  .............111
	defb 051h,051h,051h,051h,071h,031h,031h,031h,031h,031h,031h,031h,021h,021h,021h,0c1h	; 5a70  QQQQq1111111!!!.
	defb 0c1h,0c1h,0c1h,0c1h,081h,071h,071h,071h,051h,051h,051h,051h,031h,031h,031h,031h	; 5a80  .....qqqQQQQ1111
	defb 031h,031h,031h,031h,021h,021h,021h,0c1h,0c1h,0c1h,0c1h,0c1h,071h,071h,071h,071h	; 5a90  1111!!!.....qqqq
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
	defb 0ffh,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5c30  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5c40  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5c50  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5c60  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5c70  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5c80  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5c90  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5ca0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5cb0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5cc0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5cd0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5ce0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5cf0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d00  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d10  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d20  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d30  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d40  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d50  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d60  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d70  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d80  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5d90  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5da0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5db0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5dc0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5dd0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5de0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5df0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e00  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e10  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e20  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e30  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e40  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e50  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e60  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e70  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e80  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5e90  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5ea0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5eb0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5ec0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5ed0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5ee0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5ef0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f00  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f10  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f20  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f30  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f40  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f50  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f60  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f70  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f80  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5f90  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5fa0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5fb0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5fc0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5fd0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 5fe0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,0ffh,000h,0ffh	; 5ff0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,018h,018h,018h,018h,018h,000h,018h,000h	; 6000  ................
	defb 000h,03ch,030h,030h,030h,030h,030h,03ch,000h,040h,060h,030h,018h,00ch,006h,000h	; 6010  .<00000<.@`0....
	defb 000h,03ch,00ch,00ch,00ch,00ch,00ch,03ch,000h,010h,038h,06ch,0c6h,000h,000h,000h	; 6020  .<.....<..8l....
	defb 006h,039h,02dh,075h,075h,075h,073h,000h,018h,000h,008h,038h,070h,071h,07fh,000h	; 6030  .9-uuus....8pq..
	defb 00ch,018h,018h,018h,018h,018h,00ch,000h,030h,018h,018h,018h,018h,018h,030h,000h	; 6040  ........0.....0.
	defb 000h,066h,018h,07eh,07eh,018h,066h,000h,000h,018h,018h,07eh,07eh,018h,018h,000h	; 6050  .f.~~.f....~~...
	defb 000h,000h,000h,000h,00ch,00ch,018h,000h,000h,000h,000h,07eh,07eh,000h,000h,000h	; 6060  ...........~~...
	defb 000h,000h,000h,000h,000h,018h,018h,000h,001h,003h,006h,00ch,018h,030h,060h,000h	; 6070  .............0`.
	defb 03fh,023h,075h,079h,071h,071h,07fh,000h,018h,008h,01ch,01ch,01ch,01ch,01ch,000h	; 6080  ?#uyqq..........
	defb 03eh,002h,03eh,070h,070h,071h,07fh,000h,03eh,022h,00eh,007h,007h,047h,07fh,000h	; 6090  >.>ppq..>"...G..
	defb 044h,044h,07ch,00eh,00eh,00eh,00eh,000h,03fh,020h,03eh,007h,047h,047h,07fh,000h	; 60a0  DD|.....? >.GG..
	defb 01fh,030h,07fh,071h,071h,071h,07fh,000h,07ch,044h,01eh,007h,007h,007h,007h,000h	; 60b0  .0.qqq..|D......
	defb 01eh,012h,03fh,071h,071h,071h,07fh,000h,03eh,022h,03eh,007h,007h,007h,007h,000h	; 60c0  ..?qqq..>">.....
	defb 000h,018h,018h,000h,018h,018h,000h,000h,000h,018h,018h,000h,018h,018h,030h,000h	; 60d0  ..............0.
	defb 000h,000h,000h,000h,000h,000h,000h,07fh,000h,07eh,07eh,000h,07eh,07eh,000h,000h	; 60e0  .........~~.~~..
	defb 000h,000h,000h,000h,000h,000h,000h,0ffh,07fh,047h,007h,00eh,008h,000h,00ch,000h	; 60f0  .........G......
	defb 03ch,042h,0bdh,0a1h,0b1h,0bdh,042h,03ch,01eh,012h,03fh,071h,071h,071h,071h,000h	; 6100  <B....B<..?qqqq.
	defb 03ch,024h,03eh,072h,072h,072h,07eh,000h,03fh,021h,070h,070h,070h,071h,07fh,000h	; 6110  <$>rrr~.?!pppq..
	defb 03fh,021h,021h,071h,071h,071h,07fh,000h,03fh,021h,03ch,070h,070h,071h,07fh,000h	; 6120  ?!!qqq..?!<ppq..
	defb 01fh,011h,03ch,070h,070h,070h,070h,000h,03fh,021h,020h,077h,071h,071h,07fh,000h	; 6130  ..<pppp.?! wqq..
	defb 012h,012h,03fh,071h,071h,071h,071h,000h,008h,008h,008h,01ch,01ch,01ch,01ch,000h	; 6140  ..?qqqq.........
	defb 002h,002h,002h,007h,047h,047h,07fh,000h,026h,02ch,038h,078h,07ch,076h,073h,000h	; 6150  ....GG..&,8x|vs.
	defb 020h,020h,020h,070h,070h,071h,07fh,000h,03fh,025h,025h,071h,071h,071h,071h,000h	; 6160     ppq..?%%qqqq.
	defb 03dh,025h,075h,075h,075h,075h,077h,000h,03fh,021h,071h,071h,071h,071h,07fh,000h	; 6170  =%uuuuw.?!qqqq..
	defb 01fh,011h,03fh,070h,070h,070h,070h,000h,03fh,021h,021h,071h,075h,073h,07fh,000h	; 6180  ..?pppp.?!!qus..
	defb 01fh,011h,03fh,072h,071h,071h,071h,000h,03eh,020h,03eh,007h,007h,047h,07fh,000h	; 6190  ..?rqqq.> >..G..
	defb 07fh,008h,01ch,01ch,01ch,01ch,01ch,000h,021h,021h,071h,071h,071h,071h,07fh,000h	; 61a0  ........!!qqqq..
	defb 041h,041h,062h,072h,074h,034h,03ch,000h,021h,021h,021h,071h,075h,075h,03ah,000h	; 61b0  AAbrt4<.!!!quu:.
	defb 043h,066h,03ch,018h,03ch,076h,063h,000h,022h,022h,03eh,008h,01ch,01ch,01ch,000h	; 61c0  Cf<.<vc."">.....
	defb 07fh,042h,00ch,01ch,038h,071h,07fh,000h,088h,088h,027h,03bh,0a6h,03bh,024h,03ch	; 61d0  .B..8q....';.;$<
	defb 0beh,0bfh,03ch,01ah,010h,09ah,011h,01ah,03bh,032h,089h,030h,0c2h,036h,08eh,030h	; 61e0  ..<.....;2.0.6.0
	defb 01ah,097h,097h,0a8h,0c2h,0a7h,092h,037h,01ah,0abh,037h,01ah,091h,0aah,037h,01ah	; 61f0  .......7..7...7.
	defb 0a9h,0a7h,09ah,0a8h,0a2h,0a2h,0a2h,0a9h,09bh,0aah,026h,030h,030h,01ah,030h,025h	; 6200  ..........&00.0%
	defb 093h,03bh,01ah,094h,092h,019h,012h,091h,000h,090h,000h,0a3h,0a3h,000h,0b0h,000h	; 6210  .;..............
	defb 092h,03ch,03ch,091h,000h,010h,09ah,011h,080h,015h,087h,099h,083h,088h,0ach,0aah	; 6220  .<<.............
	defb 03bh,002h,001h,032h,037h,030h,094h,001h,036h,025h,004h,011h,092h,01ah,002h,023h	; 6230  ;..270..6%.....#
	defb 099h,08fh,083h,084h,084h,084h,0b1h,027h,012h,019h,030h,030h,024h,0c2h,030h,097h	; 6240  .......'..00$.0.
	defb 01ah,007h,030h,01ah,007h,01ah,08ch,026h,097h,015h,092h,043h,043h,019h,08dh,027h	; 6250  ..0....&...CC..'
	defb 025h,08ch,03ch,031h,03ch,002h,080h,0a8h,013h,002h,081h,093h,024h,08dh,080h,093h	; 6260  %.<1<.......$...
	defb 019h,019h,080h,092h,0a5h,01eh,01eh,08ah,0beh,098h,09eh,001h,032h,083h,001h,001h	; 6270  ............2...
	defb 036h,098h,095h,010h,026h,08dh,027h,043h,01ah,001h,00fh,03ch,037h,043h,01ah,001h	; 6280  6...&.'C...<7C..
	defb 08bh,01eh,01eh,08ah,011h,0a0h,0a0h,010h,094h,089h,093h,0a2h,091h,087h,092h,0b7h	; 6290  ................
	defb 012h,0a9h,0aah,01bh,012h,0a7h,0a8h,03bh,030h,0abh,01ah,030h,0abh,01ah,030h,0abh	; 62a0  .......;0..0..0.
	defb 01ah,026h,0a9h,0aah,025h,093h,030h,03bh,094h,092h,0a0h,091h,000h,010h,09fh,011h	; 62b0  .&..%.0;........
	defb 000h,084h,084h,098h,008h,009h,099h,000h,00eh,09bh,00fh,000h,092h,012h,012h,0abh	; 62c0  ................
	defb 030h,030h,091h,000h,090h,000h,0ffh,088h,088h,027h,03ch,0a6h,03ch,024h,097h,097h	; 62d0  00.......'<.<$..
	defb 01ah,032h,0c2h,032h,0c2h,036h,0c2h,036h,01ah,097h,097h,047h,037h,031h,0bch,047h	; 62e0  .2.2.6.6...G71.G
	defb 026h,037h,031h,0bdh,025h,093h,031h,012h,094h,092h,0a5h,091h,0b2h,0b5h,0b4h,027h	; 62f0  &71.%.1........'
	defb 03ch,037h,01bh,03ch,024h,0bfh,045h,01bh,0beh,012h,08bh,08ah,012h,0c1h,031h,032h	; 6300  <7.<$.E.......12
	defb 0c0h,0a8h,031h,036h,0a7h,0b2h,0b5h,017h,09dh,09ch,017h,009h,092h,091h,008h,09ch	; 6310  ..16............
	defb 08eh,09dh,091h,023h,000h,092h,0b7h,026h,096h,095h,025h,093h,0a6h,094h,092h,043h	; 6320  ...#...&..%....C
	defb 043h,091h,09eh,03ch,03ch,08bh,092h,019h,019h,091h,000h,090h,081h,085h,080h,0bfh	; 6330  C..<<...........
	defb 085h,0beh,037h,002h,085h,001h,030h,03bh,002h,085h,001h,030h,01ah,0a9h,0aah,030h	; 6340  ..7...0;...0...0
	defb 01ah,03ch,013h,0bch,013h,026h,03ch,045h,0bdh,025h,093h,0a0h,094h,000h,010h,09fh	; 6350  .<...&<E.%......
	defb 011h,000h,084h,084h,098h,0a1h,099h,0a4h,0b4h,027h,0beh,0bfh,024h,047h,001h,030h	; 6360  .........'..$G.0
	defb 030h,002h,0bah,0c0h,0c1h,0bbh,0a7h,0a8h,012h,0afh,086h,0aeh,0a3h,0a3h,0b1h,027h	; 6370  0..............'
	defb 007h,01ah,012h,043h,024h,00fh,037h,01ah,012h,047h,047h,011h,007h,01ah,037h,047h	; 6380  ...C$.7..GG...7G
	defb 047h,0a8h,01ah,0a7h,004h,092h,037h,091h,000h,09dh,045h,09ch,017h,092h,01ah,091h	; 6390  G.....7...E.....
	defb 000h,092h,01ah,096h,000h,09eh,03ch,03ch,0a9h,092h,045h,0a7h,004h,009h,001h,012h	; 63a0  ......<<..E.....
	defb 091h,015h,0a6h,012h,0a9h,003h,019h,019h,0bah,019h,019h,0a8h,0bbh,0a7h,0b2h,0b5h	; 63b0  ................
	defb 000h,0b3h,000h,095h,0a5h,096h,001h,0a7h,0a8h,002h,089h,080h,089h,089h,080h,089h	; 63c0  ................
	defb 087h,080h,087h,0ffh,088h,088h,027h,037h,0a6h,037h,024h,03ch,0bch,01ah,0bah,026h	; 63d0  ......'7.7$<...&
	defb 0bdh,01ah,0bbh,093h,03bh,012h,03ch,025h,092h,03bh,046h,094h,092h,046h,094h,000h	; 63e0  ....;.<%.;F..F..
	defb 092h,01ah,091h,000h,095h,045h,08bh,01eh,027h,03ch,01ah,091h,000h,097h,096h,000h	; 63f0  .....E..'<......
	defb 0a5h,01ah,012h,0a9h,0a8h,01ah,046h,047h,047h,092h,0a1h,037h,025h,092h,08eh,094h	; 6400  ......FGG..7%...
	defb 092h,0c2h,0abh,0c2h,091h,095h,045h,01ah,096h,027h,032h,0bch,032h,024h,03ch,036h	; 6410  ......E..'2.2$<6
	defb 0bdh,036h,03ch,0a0h,046h,046h,0a0h,002h,090h,001h,091h,023h,000h,092h,0b7h,01bh	; 6420  .6<.FF.....#....
	defb 0abh,031h,01ch,002h,008h,009h,001h,03ch,01ch,0a6h,0a6h,03ch,0bfh,0a5h,0beh,0c1h	; 6430  .1.....<...<....
	defb 0a0h,0c0h,0a7h,09fh,0a8h,0b6h,09ch,0a1h,09dh,0a2h,091h,087h,0b9h,002h,081h,0b8h	; 6440  ................
	defb 0b7h,01ch,0a9h,0aah,0bah,0beh,0bfh,0bbh,001h,046h,018h,002h,0c2h,0c0h,0c1h,0c2h	; 6450  .........F......
	defb 01bh,046h,01bh,043h,01ah,0a7h,08ch,0a8h,0b7h,030h,091h,095h,03bh,030h,08bh,021h	; 6460  .F.C.....0..;0.!
	defb 0bch,012h,091h,001h,0bdh,012h,091h,0aeh,004h,032h,091h,083h,036h,091h,083h,01ah	; 6470  .........2..6...
	defb 091h,083h,01ah,096h,083h,01ah,030h,0a9h,00fh,000h,026h,030h,046h,037h,091h,093h	; 6480  ......0...&0F7..
	defb 01ah,037h,091h,09eh,03ch,037h,0abh,03ch,01ah,091h,095h,045h,01ah,096h,027h,0a0h	; 6490  .7..<7.<...E..'.
	defb 0a0h,024h,094h,08eh,093h,0b6h,0b6h,096h,0a1h,095h,00fh,0a6h,0a6h,00eh,011h,031h	; 64a0  .$.............1
	defb 0a5h,031h,010h,0a7h,08ch,0a8h,0b6h,0b6h,0a9h,08dh,0aah,04bh,0bah,012h,012h,04ah	; 64b0  .1.........K...J
	defb 053h,0bbh,019h,019h,052h,0a7h,09ah,0a8h,091h,087h,092h,0b6h,09ch,020h,01fh,09dh	; 64c0  S...R........ ..
	defb 005h,082h,006h,0ffh,088h,088h,027h,032h,0a6h,032h,024h,037h,036h,0a1h,036h,037h	; 64d0  ......'2.2$76.67
	defb 012h,00eh,09bh,00fh,012h,03ch,0c0h,0c1h,03ch,0c6h,0c4h,0c7h,059h,037h,0c5h,037h	; 64e0  .....<..<...Y7.7
	defb 059h,097h,097h,01ah,012h,0cah,012h,0c2h,030h,0cah,030h,01ah,026h,030h,0cah,030h	; 64f0  Y.......0.0.&0.0
	defb 025h,093h,0cah,094h,0b2h,000h,009h,092h,091h,008h,0a2h,005h,0b3h,006h,092h,030h	; 6500  %..............0
	defb 030h,091h,095h,0c2h,096h,027h,059h,012h,03ch,059h,024h,0c9h,01ah,045h,0c8h,037h	; 6510  0....'Y.<Y$..E.7
	defb 037h,0c2h,012h,012h,0a7h,026h,01ah,0a0h,091h,010h,0afh,001h,091h,086h,092h,091h	; 6520  7....&..........
	defb 086h,09eh,002h,0ach,00fh,092h,0a6h,01ah,024h,0aah,031h,037h,01ah,045h,0c6h,0bch	; 6530  ........$.17.E..
	defb 0c2h,059h,025h,0bdh,046h,01ah,094h,026h,047h,0a0h,091h,08fh,006h,011h,000h,084h	; 6540  .Y%.F..&G.......
	defb 083h,088h,083h,001h,032h,002h,020h,01eh,08ah,036h,002h,083h,001h,03ch,002h,083h	; 6550  ....2. ..6...<..
	defb 08fh,084h,088h,083h,001h,032h,002h,083h,001h,036h,08bh,01eh,01fh,001h,037h,002h	; 6560  .....2...6....7.
	defb 023h,099h,08fh,083h,084h,098h,0ach,00fh,080h,00eh,027h,032h,091h,000h,010h,026h	; 6570  #.........'2...&
	defb 036h,091h,098h,0aeh,011h,000h,084h,084h,098h,008h,009h,099h,0b4h,027h,04eh,045h	; 6580  6............'NE
	defb 04fh,03bh,024h,03bh,059h,046h,059h,0a0h,0a7h,08ch,005h,001h,005h,081h,0b9h,082h	; 6590  O;$;YFY.........
	defb 0b8h,080h,0a1h,092h,000h,095h,0a9h,027h,0aah,0c6h,058h,037h,043h,043h,059h,0c4h	; 65a0  .......'..X7CCY.
	defb 037h,026h,03ch,059h,0c5h,025h,0aeh,09ah,0afh,0a4h,098h,087h,099h,084h,084h,000h	; 65b0  7&<Y.%..........
	defb 0beh,0bfh,000h,095h,045h,032h,096h,027h,030h,012h,036h,030h,024h,037h,0a0h,0a0h	; 65c0  ....E2.'0.60$7..
	defb 0c2h,002h,087h,001h,0c2h,0abh,03ch,0afh,080h,0aeh,0ffh,088h,088h,027h,037h,0a6h	; 65d0  ......<......'7.
	defb 037h,024h,03ch,059h,045h,047h,059h,03ch,0c9h,046h,032h,0c8h,003h,0bfh,036h,0beh	; 65e0  7$<YEGY<.F2...6.
	defb 004h,0c1h,059h,0c0h,08ch,09ah,08ch,0a4h,08dh,09bh,08dh,0cbh,012h,059h,0bah,047h	; 65f0  ..Y..........Y.G
	defb 01ah,045h,059h,0bbh,047h,01ah,046h,0c8h,026h,03ch,01ah,030h,030h,025h,093h,0bch	; 6600  .EY.G.F.&<.00%..
	defb 094h,092h,0bdh,0abh,045h,045h,091h,0b2h,0b5h,000h,0b3h,000h,092h,0cah,091h,009h	; 6610  ....EE..........
	defb 001h,046h,03ch,002h,008h,0a6h,0cah,0a6h,058h,0c9h,0c8h,058h,03ch,0cbh,047h,03ch	; 6620  .F<.....X..X<.G<
	defb 012h,012h,0c2h,047h,030h,026h,047h,01ah,0a5h,025h,093h,0c2h,094h,0b2h,0b5h,016h	; 6630  ...G0&G..%......
	defb 09dh,09ch,016h,099h,089h,098h,016h,017h,08eh,017h,016h,099h,086h,098h,099h,086h	; 6640  ................
	defb 098h,015h,0b0h,015h,0aah,045h,043h,0a9h,03ch,0a7h,0a8h,03ch,094h,080h,093h,091h	; 6650  .....EC.<..<....
	defb 008h,009h,092h,09ch,089h,09dh,09ch,089h,09dh,005h,092h,091h,006h,000h,0b3h,000h	; 6660  ................
	defb 0aah,0a5h,0a9h,032h,012h,0c4h,012h,032h,036h,032h,0c5h,032h,036h,026h,036h,0bah	; 6670  ...2...262.26&6.
	defb 036h,025h,093h,0bbh,094h,092h,0c2h,091h,0b9h,0c2h,002h,00ah,0b8h,031h,037h,002h	; 6680  6%...........17.
	defb 00bh,092h,01ah,037h,091h,0aah,0c2h,096h,026h,0c3h,0c2h,024h,093h,0c7h,01ah,03bh	; 6690  ...7....&..$...;
	defb 000h,093h,059h,01ah,025h,000h,092h,059h,094h,000h,092h,045h,091h,009h,008h,027h	; 66a0  ..Y.%..Y...E...'
	defb 059h,096h,0a6h,012h,059h,012h,024h,03bh,01ah,045h,0c8h,058h,026h,0cbh,03bh,025h	; 66b0  Y...Y.$;.E.X&.;%
	defb 093h,045h,046h,094h,0b2h,080h,0b3h,000h,092h,0bah,0abh,0bbh,091h,0aah,0bch,0a9h	; 66c0  .EF.............
	defb 0a5h,0bdh,0c6h,019h,0c3h,01ch,059h,03ch,026h,097h,0a7h,093h,037h,094h,015h,092h	; 66d0  ......Y<&...7...
	defb 01ah,091h,016h,092h,01ah,091h,080h,08fh,080h,0ffh,088h,088h,093h,0a6h,03ch,024h	; 66e0  ..............<$
	defb 092h,0beh,08dh,092h,001h,032h,0a5h,0b9h,001h,036h,0a7h,0b8h,0c0h,011h,025h,092h	; 66f0  .....2...6....%.
	defb 037h,037h,094h,092h,0cah,091h,095h,037h,037h,096h,027h,007h,097h,024h,0cch,059h	; 6700  77.....77.'..$.Y
	defb 0beh,0cdh,059h,0c0h,026h,03ch,03ch,0c8h,025h,0aeh,09ah,0afh,098h,087h,099h,084h	; 6710  ..Y.&<<.%.......
	defb 098h,0a1h,099h,0a4h,0ach,09bh,08dh,027h,01ch,047h,0bch,018h,057h,01bh,047h,0bdh	; 6720  .......'.G..W.G.
	defb 032h,05fh,0a7h,0a8h,036h,007h,0abh,0cah,091h,0b9h,0cah,091h,0b8h,030h,031h,096h	; 6730  2_..6........01.
	defb 095h,030h,043h,032h,0a6h,043h,012h,013h,036h,046h,0cch,004h,0a8h,0cdh,080h,093h	; 6740  .0C2.C..6F......
	defb 0a7h,020h,01fh,09dh,091h,080h,0b3h,000h,095h,032h,03ch,002h,092h,037h,036h,094h	; 6750  . .......2<..76.
	defb 08ah,0c3h,0abh,012h,047h,002h,00ah,09eh,012h,046h,002h,00bh,000h,0c0h,0afh,000h	; 6760  ....G....F......
	defb 098h,083h,000h,098h,00eh,0adh,000h,098h,001h,045h,091h,098h,010h,0afh,000h,098h	; 6770  .........E......
	defb 086h,080h,098h,086h,080h,0b1h,001h,032h,0c3h,032h,002h,001h,036h,0a0h,036h,002h	; 6780  .......2.2..6.6.
	defb 08fh,08fh,084h,084h,0b1h,027h,0beh,0bfh,024h,08ah,0a5h,08bh,026h,0c0h,0c1h,025h	; 6790  .....'..$...&..%
	defb 093h,037h,059h,094h,092h,0cah,0abh,059h,03ch,0abh,0cah,091h,0aah,046h,059h,0a9h	; 67a0  .7Y....Y<....FY.
	defb 059h,0cch,057h,0cah,0cdh,05fh,059h,0c8h,058h,046h,0c9h,03ch,0a7h,0a8h,03ch,094h	; 67b0  Y.W.._Y.XF.<..<.
	defb 023h,000h,093h,0b6h,09ch,0a1h,09dh,09ch,08eh,09dh,091h,085h,092h,005h,098h,099h	; 67c0  #...............
	defb 006h,080h,085h,081h,0b0h,000h,092h,031h,032h,0abh,031h,036h,0abh,0a0h,091h,000h	; 67d0  .......12.16....
	defb 087h,087h,000h,0ffh,088h,088h,027h,01bh,0a6h,01bh,024h,059h,054h,055h,056h,054h	; 67e0  ......'...$YTUVT
	defb 0cah,05ch,05dh,05eh,05ch,059h,0c8h,04fh,04eh,0c9h,0bch,0cah,012h,057h,0bdh,0cch	; 67f0  .\]^\Y.ON....W..
	defb 05fh,026h,047h,0cdh,025h,093h,0c3h,094h,092h,046h,046h,002h,00ah,000h,0c0h,0c1h	; 6800  _&G.%....FF.....
	defb 00bh,084h,000h,016h,017h,017h,016h,000h,084h,088h,083h,027h,03ch,002h,083h,0a5h	; 6810  ...........'<...
	defb 096h,099h,037h,057h,045h,024h,08dh,026h,05fh,0cbh,025h,093h,0bah,094h,09dh,0bbh	; 6820  ..7WE$.&_.%.....
	defb 09ch,000h,010h,09ah,011h,000h,017h,09dh,09ch,017h,009h,092h,091h,008h,09ch,08eh	; 6830  ................
	defb 09dh,096h,023h,000h,095h,032h,0abh,032h,036h,0abh,036h,01ah,0abh,0c2h,0abh,01ah	; 6840  ..#..2.26.6.....
	defb 037h,096h,095h,03ch,0bfh,0a6h,0beh,03bh,08bh,08ah,03bh,0c1h,046h,030h,0c0h,08ch	; 6850  7..<...;..;.F0..
	defb 026h,046h,0a7h,080h,001h,094h,000h,016h,09dh,09ch,016h,080h,001h,002h,00ah,000h	; 6860  &F..............
	defb 08dh,027h,002h,00bh,000h,026h,043h,045h,096h,000h,093h,03bh,046h,096h,000h,093h	; 6870  .'...&CE...;F...
	defb 03ch,03ch,024h,000h,09eh,063h,064h,065h,000h,092h,06bh,06ch,06dh,000h,092h,066h	; 6880  <<$..cde..klm..f
	defb 067h,06eh,08dh,027h,03bh,0bch,08ch,0a8h,0bdh,083h,093h,03ch,083h,095h,025h,08dh	; 6890  gn.';......<..%.
	defb 0aah,094h,026h,0a5h,094h,000h,090h,000h,0a3h,0a3h,080h,0beh,00fh,080h,0b9h,031h	; 68a0  ..&............1
	defb 091h,008h,0b8h,043h,002h,095h,092h,03bh,0a6h,03ch,095h,01ah,063h,064h,065h,027h	; 68b0  ...C...;.<..cde'
	defb 0c3h,06bh,06ch,06dh,037h,057h,045h,066h,067h,06eh,01ah,05fh,046h,032h,007h,025h	; 68c0  .klm7WEfgn._F2.%
	defb 037h,0c4h,036h,094h,026h,0c5h,025h,011h,000h,0aeh,026h,002h,099h,0a4h,0a4h,0ach	; 68d0  7.6.&.%...&.....
	defb 09bh,08dh,027h,0beh,08dh,003h,032h,001h,0c6h,030h,037h,036h,001h,059h,03ch,0a7h	; 68e0  ..'...2..076.Y<.
	defb 026h,0c0h,0c1h,025h,093h,0cah,094h,092h,045h,045h,091h,000h,090h,000h,0ffh,000h	; 68f0  &..%....EE......
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6900  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6910  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6920  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6930  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6940  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6950  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6960  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6970  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6980  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6990  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,02ah,0aah,0aah,040h,000h	; 69a0  ...........*..@.
	defb 006h,000h,000h,00eh,045h,055h,05eh,00fh,0ffh,0ceh,044h,000h,05eh,00ch,0aah,0ceh	; 69b0  ....EU^...D.^...
	defb 045h,0ffh,05eh,00ch,0feh,0ceh,045h,0c0h,05eh,00ch,0c8h,0ceh,045h,0d8h,05eh,00ch	; 69c0  E.^...E.^...E.^.
	defb 0c0h,0ceh,045h,0c0h,05eh,00ch,080h,0ceh,045h,055h,05eh,00fh,0ffh,0ceh,044h,000h	; 69d0  ..E.^...EU^...D.
	defb 01eh,00ah,0aah,0aeh,05fh,0ffh,0feh,03fh,0ffh,0feh,07fh,0ffh,0feh,000h,000h,000h	; 69e0  ...._..?........
	defb 000h,000h,000h,02ah,0aah,0aah,040h,000h,006h,000h,000h,00eh,045h,055h,05eh,008h	; 69f0  ...*..@.....EU^.
	defb 000h,02eh,040h,000h,07eh,008h,0aah,0eeh,041h,001h,07eh,008h,07dh,0eeh,041h,069h	; 6a00  ..@.~...A.~.}.Ai
	defb 07eh,008h,055h,0eeh,041h,069h,07eh,008h,055h,0eeh,041h,001h,07eh,008h,0ffh,0eeh	; 6a10  ~.U.Ai~.U.A.~...
	defb 041h,055h,07eh,00bh,0ffh,0eeh,047h,0ffh,0feh,00ah,0aah,0aeh,05fh,0ffh,0feh,03fh	; 6a20  AU~...G....._..?
	defb 0ffh,0feh,07fh,0ffh,0feh,000h,000h,000h,000h,000h,000h,02ah,0aah,0aah,040h,000h	; 6a30  ...........*..@.
	defb 006h,000h,000h,00eh,045h,055h,05eh,008h,000h,02eh,044h,000h,05eh,008h,0aah,0eeh	; 6a40  ....EU^...D.^...
	defb 044h,001h,0deh,008h,082h,0eeh,044h,017h,0deh,008h,0beh,0eeh,044h,07fh,0deh,008h	; 6a50  D.....D.....D...
	defb 0aah,0eeh,044h,055h,0deh,00ah,02bh,0aeh,045h,07fh,05eh,00ah,0c2h,0aeh,045h,07fh	; 6a60  ..DU..+.E.^...E.
	defb 05eh,00ah,0aah,0aeh,05fh,0ffh,0feh,039h,024h,09eh,07fh,0ffh,0feh,000h,000h,000h	; 6a70  ^..._..9$.......
	defb 000h,000h,000h,029h,0ffh,0eah,041h,089h,046h,001h,08dh,04eh,045h,0afh,05eh,009h	; 6a80  ...)..A.F..NE.^.
	defb 08dh,06eh,045h,06ah,05eh,009h,02ch,06eh,045h,02ch,05eh,009h,04ah,06eh,045h,089h	; 6a90  .nEj^.,nE,^.JnE.
	defb 05eh,009h,08dh,06eh,045h,0afh,05eh,009h,08dh,06eh,045h,06ah,05eh,009h,02ch,06eh	; 6aa0  ^..nE.^..nEj^.,n
	defb 045h,02ch,05eh,009h,04ah,06eh,045h,089h,05eh,009h,08dh,06eh,05dh,0afh,07eh,03dh	; 6ab0  E,^.JnE.^..n].~=
	defb 08dh,07eh,07dh,06ah,07eh,001h,02ch,040h,000h,000h,000h,029h,0ffh,0eah,041h,02ch	; 6ac0  .~}j~.,@...)..A,
	defb 046h,001h,04ah,04eh,045h,089h,05eh,009h,08dh,06eh,045h,0afh,05eh,009h,08dh,06eh	; 6ad0  F.JNE.^..nE.^..n
	defb 045h,06ah,05eh,009h,02ch,06eh,045h,02ch,05eh,009h,04ah,06eh,045h,089h,05eh,009h	; 6ae0  Ej^.,nE,^.JnE.^.
	defb 08dh,06eh,045h,0afh,05eh,009h,08dh,06eh,045h,06ah,05eh,009h,02ch,06eh,045h,009h	; 6af0  .nE.^..nEj^.,nE.
	defb 05eh,009h,0aah,06eh,05dh,04dh,07eh,03dh,0aah,07eh,07dh,04dh,07eh,001h,008h,040h	; 6b00  ^..n]M~=.~}M~..@
	defb 000h,000h,000h,029h,0ffh,0eah,041h,009h,046h,001h,0ach,04eh,045h,02ch,05eh,009h	; 6b10  ...)..A.F..NE,^.
	defb 04ah,06eh,045h,089h,05eh,009h,08dh,06eh,045h,0afh,05eh,009h,08dh,06eh,045h,06ah	; 6b20  JnE.^..nE.^..nEj
	defb 05eh,009h,02ch,06eh,045h,02ch,05eh,009h,04ah,06eh,045h,089h,05eh,009h,08dh,06eh	; 6b30  ^.,nE,^.JnE.^..n
	defb 045h,0afh,05eh,009h,08dh,06eh,045h,06ah,05eh,009h,02ch,06eh,05dh,009h,07eh,03dh	; 6b40  E.^..nEj^.,n].~=
	defb 0aah,07eh,07dh,04dh,07eh,001h,008h,040h,000h,000h,000h,029h,0ffh,0eah,041h,009h	; 6b50  .~}M~..@...)..A.
	defb 046h,001h,0ach,04eh,045h,02dh,05eh,009h,088h,06eh,045h,02ch,05eh,009h,04ah,06eh	; 6b60  F..NE-^..nE,^.Jn
	defb 045h,089h,05eh,009h,08dh,06eh,045h,0afh,05eh,009h,08dh,06eh,045h,06ah,05eh,009h	; 6b70  E.^..nE.^..nEj^.
	defb 02ch,06eh,045h,02ch,05eh,009h,04ah,06eh,045h,089h,05eh,009h,08dh,06eh,045h,0afh	; 6b80  ,nE,^.JnE.^..nE.
	defb 05eh,009h,08dh,06eh,05dh,06ah,07eh,03dh,02ch,07eh,07dh,009h,07eh,001h,008h,040h	; 6b90  ^..n]j~=,~}.~..@
	defb 000h,000h,000h,02ah,0aah,0aah,040h,000h,006h,000h,000h,00eh,04ah,0a5h,05eh,005h	; 6ba0  ...*..@.....J.^.
	defb 042h,0aeh,04ah,008h,05eh,004h,055h,02eh,048h,0ffh,09eh,005h,0feh,02eh,048h,0c0h	; 6bb0  B.J.^.U.H.....H.
	defb 09eh,001h,0d8h,04eh,042h,0d8h,08eh,009h,0c0h,01eh,044h,0c0h,0aeh,009h,080h,01eh	; 6bc0  ...NB.....D.....
	defb 044h,0aah,02eh,00ah,010h,05eh,045h,042h,0aeh,00ah,0a5h,05eh,05fh,0ffh,0feh,03fh	; 6bd0  D....^EB...^_..?
	defb 0ffh,0feh,07fh,0ffh,0feh,000h,000h,000h,000h,000h,000h,02ah,0aah,0aah,040h,000h	; 6be0  ...........*..@.
	defb 006h,000h,000h,00eh,04ah,0a5h,05eh,005h,042h,0aeh,04ah,008h,05eh,004h,055h,02eh	; 6bf0  ....J.^.B.J.^.U.
	defb 048h,000h,09eh,005h,001h,02eh,048h,03fh,09eh,001h,027h,04eh,042h,027h,08eh,009h	; 6c00  H.....H?..'NB'..
	defb 03fh,01eh,044h,03fh,0aeh,009h,07fh,01eh,044h,0aah,02eh,00ah,010h,05eh,045h,042h	; 6c10  ?.D?....D....^EB
	defb 0aeh,00ah,0a5h,05eh,05fh,0ffh,0feh,03fh,0ffh,0feh,07fh,0ffh,0feh,000h,000h,000h	; 6c20  ...^_..?........
	defb 000h,000h,000h,02ah,0aah,0aah,040h,000h,006h,000h,000h,00eh,045h,015h,05eh,00eh	; 6c30  ...*..@.....E.^.
	defb 0ebh,0eeh,049h,054h,07eh,00bh,0fah,0aeh,045h,0cfh,05eh,00bh,0bfh,0aeh,047h,0bdh	; 6c40  ..IT~...E.^...G.
	defb 01eh,00bh,0f5h,0eeh,04bh,0b5h,05eh,008h,0cbh,0aeh,04fh,0bah,05eh,00bh,0feh,0aeh	; 6c50  ....K.^...O.^...
	defb 045h,0ddh,03eh,00ah,0aah,0aeh,047h,0f5h,0feh,008h,02ah,0aeh,05fh,0ffh,0feh,03fh	; 6c60  E.>...G...*._..?
	defb 0ffh,0feh,07fh,0ffh,0feh,000h,000h,000h,000h,000h,000h,02ah,0aah,0aah,070h,041h	; 6c70  ...........*..pA
	defb 086h,018h,041h,00ah,05dh,077h,076h,00eh,0deh,0eeh,06bh,0d7h,06eh,03bh,0b7h,04eh	; 6c80  ..A.]wv...k.n;.N
	defb 04dh,03ah,09eh,00eh,0ddh,0e2h,047h,062h,07ch,00fh,05dh,0aeh,07fh,07eh,0feh,019h	; 6c90  M:....Gb|.]..~..
	defb 096h,0eeh,04eh,077h,0d6h,00dh,0c9h,02ah,05dh,0feh,0feh,07fh,08eh,0eeh,097h,0f5h	; 6ca0  ..Nw...*].......
	defb 076h,00ah,0bbh,0b6h,057h,07eh,0fah,03eh,0feh,0feh,07fh,0ffh,0feh,000h,000h,000h	; 6cb0  v...W~.>........
	defb 000h,000h,000h,02ah,0aah,0aah,040h,000h,006h,000h,000h,00eh,04dh,05dh,056h,00eh	; 6cc0  ...*..@.....M]V.
	defb 0a2h,0eeh,047h,0d5h,02eh,00bh,05eh,0feh,046h,0dbh,0deh,00fh,03bh,0aeh,046h,0c6h	; 6cd0  ..G...^.F...;.F.
	defb 05eh,00ah,0fbh,0eeh,047h,039h,0c6h,00eh,0fah,0feh,047h,036h,0deh,00fh,0fdh,0beh	; 6ce0  ^...G9....G6....
	defb 04dh,073h,0eeh,01ah,0aeh,0ceh,049h,0e5h,05eh,00ah,0beh,0aeh,05fh,0ffh,0feh,03fh	; 6cf0  Ms....I.^..._..?
	defb 0ffh,0feh,07fh,0ffh,0feh,000h,000h,000h,000h,000h,000h,02ah,0aah,0aah,040h,000h	; 6d00  ...........*..@.
	defb 006h,000h,000h,00eh,045h,055h,05eh,00ah,0eah,02eh,047h,045h,07eh,00ah,0aah,0aeh	; 6d10  ....EU^...GE~...
	defb 046h,053h,05eh,00ah,0beh,0aeh,045h,0ebh,03eh,00ah,0ebh,0eeh,043h,065h,09eh,00eh	; 6d20  FS^...E.>...Ce..
	defb 0dfh,02eh,045h,065h,01eh,00ah,0fah,06eh,045h,054h,0deh,00ah,019h,0aeh,045h,0f5h	; 6d30  ..Ee...nET....E.
	defb 05eh,00ah,0aah,0aeh,05fh,0ffh,0feh,03fh,0ffh,0feh,07fh,0ffh,0feh,000h,000h,000h	; 6d40  ^..._..?........
	defb 000h,000h,000h,02ah,0aah,0aah,040h,000h,006h,000h,000h,00eh,045h,055h,05eh,00ah	; 6d50  ...*..@.....EU^.
	defb 0eah,02eh,047h,045h,07eh,00ah,091h,0aeh,046h,018h,0deh,00ah,018h,06eh,045h,0d8h	; 6d60  ..GE~...F....nE.
	defb 03eh,00ah,0dbh,0aeh,043h,058h,01eh,00dh,0dbh,0aeh,044h,018h,01eh,00ah,010h,06eh	; 6d70  >...CX....D....n
	defb 047h,000h,0deh,00bh,01bh,0aeh,045h,0f5h,03eh,00ah,0aah,0aeh,05fh,0ffh,0beh,03fh	; 6d80  G.....E.>..._..?
	defb 0ffh,0feh,07fh,0ffh,0feh,000h,000h,000h,000h,000h,000h,02ah,0aah,0aah,040h,000h	; 6d90  ...........*..@.
	defb 006h,000h,000h,00eh,045h,055h,05eh,00ah,0eah,02eh,047h,045h,07eh,00ah,091h,0aeh	; 6da0  ....EU^...GE~...
	defb 046h,000h,0deh,00ah,018h,06eh,045h,024h,03eh,00ah,04ah,0aeh,043h,05eh,01eh,00dh	; 6db0  F....nE$>.J.C^..
	defb 02ch,0aeh,044h,018h,01eh,00ah,000h,06eh,047h,000h,0deh,00bh,01bh,0aeh,045h,0f5h	; 6dc0  ,.D....nG.....E.
	defb 03eh,00ah,0aah,0aeh,05fh,0ffh,0beh,03fh,0ffh,0feh,07fh,0ffh,0feh,000h,000h,000h	; 6dd0  >..._..?........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6de0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6df0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6e00  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6e10  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6e20  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6e30  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6e40  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6e50  ................
	defb 001h,045h,055h,0d5h,082h,08ah,0aah,0eah,001h,044h,005h,0d5h,082h,088h,00eh,0eah	; 6e60  .EU......D......
	defb 001h,044h,05dh,0d5h,082h,088h,0aeh,0eah,001h,044h,05dh,0d5h,082h,088h,0aeh,0eah	; 6e70  .D]......D].....
	defb 001h,044h,05dh,0d5h,082h,088h,0aeh,0e2h,001h,044h,05dh,0c7h,082h,088h,0aeh,0eah	; 6e80  .D]......D].....
	defb 001h,044h,05dh,0c7h,082h,088h,0aeh,0eah,001h,044h,05dh,0c7h,082h,088h,0aeh,0eah	; 6e90  .D]......D].....
	defb 001h,044h,05dh,0c7h,082h,088h,0aeh,0eah,001h,044h,05dh,0c7h,082h,088h,0aeh,0eah	; 6ea0  .D]......D].....
	defb 001h,044h,05dh,0c7h,082h,088h,0aeh,0eah,001h,044h,05dh,0c7h,082h,088h,0aeh,0feh	; 6eb0  .D]......D].....
	defb 001h,044h,05dh,0d5h,082h,088h,0aeh,0eah,001h,044h,05dh,0d5h,082h,088h,0feh,0eah	; 6ec0  .D]......D].....
	defb 001h,045h,0fdh,0d5h,082h,08ah,0aah,0eah,001h,045h,055h,0d5h,082h,08ah,0aah,0eah	; 6ed0  .E.......EU.....
	defb 055h,075h,0f5h,07fh,0aah,0a2h,0eah,0beh,055h,075h,0f5h,07fh,0aah,0a2h,0eah,0beh	; 6ee0  Uu......Uu......
	defb 055h,075h,0f5h,07fh,0aah,0a2h,0eah,0beh,055h,075h,0f5h,07fh,0aah,080h,00ah,0beh	; 6ef0  Uu......Uu......
	defb 057h,0ffh,0ffh,07fh,0aeh,00ah,0bfh,0beh,055h,041h,05fh,07fh,0aeh,00ah,0bfh,0beh	; 6f00  W.......UA_.....
	defb 055h,041h,05fh,07fh,0aeh,00ah,0bfh,0beh,055h,041h,05fh,07fh,0aeh,00ah,0bfh,0beh	; 6f10  UA_.....UA_.....
	defb 057h,0ffh,0ffh,07fh,0aah,080h,00ah,0beh,055h,075h,0f5h,07fh,0aah,0a2h,0eah,0beh	; 6f20  W.......Uu......
	defb 055h,075h,0f5h,07fh,0aah,0a2h,0eah,0beh,055h,075h,0f5h,07fh,0aah,0a2h,0eah,0beh	; 6f30  Uu......Uu......
	defb 055h,075h,0f5h,07fh,0aah,0a2h,0eah,0beh,055h,075h,0f5h,07fh,0aah,0a2h,0eah,0beh	; 6f40  Uu......Uu......
	defb 055h,075h,0f5h,07fh,0aah,0a2h,0eah,0beh,055h,075h,0f5h,07fh,0aah,0a2h,0eah,0beh	; 6f50  Uu......Uu......
	defb 055h,055h,055h,055h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 6f60  UUUU............
	defb 000h,000h,000h,000h,000h,000h,000h,000h,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 6f70  ........UUUU....
	defb 0fdh,055h,055h,07fh,023h,0aah,0aah,0c8h,075h,0d0h,015h,01dh,0abh,0a0h,02ah,02ah	; 6f80  .UU.#...u.....**
	defb 0f1h,0d1h,076h,05fh,0fah,0e2h,0ech,0bfh,05fh,0d1h,077h,0f5h,0aah,0e2h,0ech,0eah	; 6f90  ..v_...._.w.....
	defb 059h,0d1h,075h,075h,0aah,0e2h,0ech,0eah,059h,0d7h,0f5h,075h,0aah,0efh,0ech,0eah	; 6fa0  Y.uu....Y..u....
	defb 05fh,0d5h,057h,0f5h,0aah,0eah,0ach,0eah,059h,07fh,0f9h,0f5h,0aah,090h,012h,0eah	; 6fb0  _.W.....Y.......
	defb 055h,055h,055h,0d5h,0afh,0bah,0bfh,0eah,057h,0ffh,0ffh,0d5h,0aah,0ffh,0feh,0aah	; 6fc0  UUU.....W.......
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 6fd0  UUUU....UUUU....
	defb 055h,055h,055h,055h,0aah,000h,001h,0aah,054h,000h,003h,055h,0aah,02ah,0abh,0aah	; 6fe0  UUUU....T..U.*..
	defb 054h,055h,057h,055h,0aah,02ah,0abh,0aah,055h,015h,057h,055h,006h,08ah,0aeh,080h	; 6ff0  TUWU.*..U.WU....
	defb 007h,045h,05dh,000h,0abh,0a2h,0bah,02ah,055h,0d1h,074h,055h,0aah,0e9h,0e8h,0aah	; 7000  .E]....*U.tU....
	defb 033h,075h,051h,033h,0aah,0bah,0a2h,0aah,033h,05dh,045h,033h,0aah,0a8h,00ah,0aah	; 7010  3uQ3....3]E3....
	defb 033h,030h,013h,033h,0aah,0aah,0aah,0aah,033h,035h,053h,033h,0aah,0aah,0aah,0aah	; 7020  30.3....35S3....
	defb 055h,055h,055h,055h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0aah,0aah,0aah,0aah	; 7030  UUUU............
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 7040  UUUU............
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0aah,0aah,0aah,0aah	; 7050  ................
	defb 055h,075h,0f5h,07fh,0aah,0a2h,0eah,0feh,055h,05fh,0d5h,0fch,0aah,0afh,0abh,0f8h	; 7060  Uu......U_......
	defb 055h,055h,057h,0f0h,0aah,0aah,0afh,0e0h,055h,055h,05fh,0c0h,000h,0aah,0bfh,080h	; 7070  UUW.....UU_.....
	defb 001h,0d5h,07fh,000h,0abh,0aah,0feh,000h,055h,0d5h,0fch,000h,0abh,0abh,0f8h,000h	; 7080  ........U.......
	defb 035h,0d7h,0f0h,000h,0abh,0afh,0e0h,000h,037h,05fh,0c0h,000h,0aeh,0bfh,080h,000h	; 7090  5.......7_......
	defb 05dh,07fh,000h,000h,0bah,0feh,000h,000h,075h,0fch,000h,000h,0ebh,0f8h,000h,000h	; 70a0  ].......u.......
	defb 0d7h,0f0h,000h,000h,0afh,0e0h,000h,000h,05fh,0c0h,000h,000h,0bfh,080h,000h,000h	; 70b0  ........_.......
	defb 07fh,000h,000h,000h,0feh,000h,000h,000h,0fch,000h,000h,000h,0f8h,000h,000h,000h	; 70c0  ................
	defb 0f0h,000h,000h,000h,0e0h,000h,000h,000h,0c0h,000h,000h,000h,080h,000h,000h,000h	; 70d0  ................
	defb 041h,045h,055h,0d5h,020h,08fh,0ffh,0eah,010h,05fh,0ffh,0d5h,008h,02ah,0aah,0aah	; 70e0  AEU. ...._...*..
	defb 004h,015h,055h,055h,002h,00ah,0aah,0aah,001h,005h,055h,055h,000h,082h,0a8h,000h	; 70f0  ..UU......UU....
	defb 000h,041h,054h,000h,000h,020h,0a8h,0aah,000h,010h,054h,055h,000h,008h,028h,0aah	; 7100  .AT.. ....TU..(.
	defb 000h,004h,014h,053h,000h,002h,00ah,02ah,000h,001h,005h,013h,000h,000h,082h,08ah	; 7110  ...S...*........
	defb 000h,000h,041h,045h,000h,000h,020h,0a2h,000h,000h,010h,051h,000h,000h,008h,028h	; 7120  ..AE.. ....Q...(
	defb 000h,000h,004h,014h,000h,000h,002h,00ah,000h,000h,001h,005h,000h,000h,000h,082h	; 7130  ................
	defb 000h,000h,000h,041h,000h,000h,000h,020h,000h,000h,000h,010h,000h,000h,000h,008h	; 7140  ...A... ........
	defb 000h,000h,000h,004h,000h,000h,000h,002h,000h,000h,000h,001h,000h,000h,000h,000h	; 7150  ................
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0bfh,0ffh,0ffh,0fah	; 7160  UUUU....UUUU....
	defb 05fh,0ffh,0ffh,0f5h,0bfh,0ffh,0ffh,0e2h,05ch,000h,000h,005h,0bch,0aah,0aah,082h	; 7170  _.......\.......
	defb 05dh,000h,000h,005h,0bch,000h,000h,082h,05dh,000h,000h,005h,0bch,000h,000h,082h	; 7180  ].......].......
	defb 05dh,000h,000h,005h,0bch,000h,000h,082h,05dh,000h,000h,005h,0bch,000h,000h,082h	; 7190  ].......].......
	defb 05dh,000h,000h,005h,0bch,000h,000h,082h,05dh,000h,000h,005h,0bch,000h,000h,082h	; 71a0  ].......].......
	defb 05dh,000h,000h,005h,0bch,000h,000h,082h,05dh,000h,000h,005h,0bch,000h,000h,082h	; 71b0  ].......].......
	defb 05dh,055h,055h,005h,0bch,000h,000h,002h,05ch,000h,000h,005h,0b8h,000h,000h,002h	; 71c0  ]UU.....\.......
	defb 050h,000h,000h,005h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 71d0  P.......UUUU....
	defb 000h,000h,000h,001h,000h,000h,000h,002h,000h,000h,000h,004h,000h,000h,000h,008h	; 71e0  ................
	defb 000h,000h,000h,010h,000h,000h,000h,020h,000h,000h,000h,040h,000h,000h,000h,080h	; 71f0  ....... ...@....
	defb 000h,000h,001h,001h,000h,000h,002h,003h,000h,000h,004h,007h,000h,000h,008h,00ah	; 7200  ................
	defb 000h,000h,010h,017h,000h,000h,020h,02bh,000h,000h,040h,055h,000h,000h,080h,06ah	; 7210  ...... +..@U...j
	defb 000h,001h,000h,0d5h,000h,002h,000h,0eah,000h,004h,001h,0d5h,000h,008h,002h,0eah	; 7220  ................
	defb 000h,010h,005h,0d5h,000h,020h,00ah,0eah,000h,040h,013h,0d5h,000h,080h,026h,0eah	; 7230  ..... ...@....&.
	defb 001h,000h,047h,0d5h,002h,000h,08eh,0eah,004h,001h,017h,0d5h,008h,002h,02eh,0eah	; 7240  ..G.............
	defb 010h,004h,057h,0d5h,020h,008h,0feh,0eah,040h,045h,0ffh,0d5h,080h,08ah,0aah,0eah	; 7250  ..W. ...@E......
	defb 000h,000h,000h,000h,080h,000h,000h,000h,0c0h,000h,000h,000h,0e0h,000h,000h,000h	; 7260  ................
	defb 0f0h,000h,000h,000h,0f8h,000h,000h,000h,0fch,000h,000h,000h,0feh,000h,000h,000h	; 7270  ................
	defb 0ffh,000h,000h,000h,0ffh,080h,000h,000h,05fh,0c0h,000h,000h,0efh,0e0h,000h,000h	; 7280  ........_.......
	defb 0d7h,0f0h,000h,000h,0abh,0f8h,000h,000h,055h,0fch,000h,000h,0aah,0feh,000h,000h	; 7290  ........U.......
	defb 043h,07fh,000h,000h,08bh,0bfh,080h,000h,015h,0dfh,0c0h,000h,0aah,0afh,0e0h,000h	; 72a0  C...............
	defb 015h,0d7h,0f0h,000h,0aah,0abh,0f8h,000h,015h,0d5h,0fch,000h,08bh,0aah,0feh,000h	; 72b0  ................
	defb 04fh,055h,07fh,000h,0aah,0aah,0bfh,080h,055h,055h,05fh,0c0h,0aah,0afh,0afh,0e0h	; 72c0  OU......UU_.....
	defb 055h,051h,0d7h,0f0h,0aah,0a2h,0ebh,0f8h,055h,075h,0f5h,0fch,0aah,0a2h,0eah,0feh	; 72d0  UQ......Uu......
	defb 080h,000h,000h,000h,040h,000h,000h,000h,0a8h,000h,000h,000h,057h,000h,000h,000h	; 72e0  ....@.......W...
	defb 0fch,0deh,01ch,000h,040h,02fh,0eeh,000h,0e0h,0d0h,032h,000h,023h,080h,020h,000h	; 72f0  ....@/....2.#. .
	defb 0deh,000h,018h,000h,058h,000h,000h,000h,0d0h,000h,000h,000h,0d0h,000h,000h,000h	; 7300  ....X...........
	defb 050h,000h,000h,000h,0d0h,000h,002h,000h,050h,010h,003h,000h,0d0h,0e8h,019h,000h	; 7310  P.......P.......
	defb 053h,0cch,031h,080h,0d7h,02eh,061h,080h,058h,0e6h,061h,080h,0d3h,0e9h,060h,000h	; 7320  S.1...a.X.a...`.
	defb 04bh,0edh,063h,0c0h,0d4h,0edh,036h,080h,049h,06bh,039h,080h,0d5h,06bh,02bh,000h	; 7330  K.c...6.Ik9..k+.
	defb 049h,0abh,02ch,000h,0d6h,0a6h,048h,000h,04bh,066h,058h,000h,0d5h,06ch,0f0h,000h	; 7340  I.,...H.KfX..l..
	defb 049h,09bh,060h,000h,0d5h,09bh,000h,000h,049h,034h,000h,000h,0d4h,0ebh,000h,000h	; 7350  I.`.....I4......
	defb 049h,0d7h,000h,000h,0c7h,0b7h,000h,000h,04fh,057h,000h,000h,0dfh,057h,000h,000h	; 7360  I.......OW...W..
	defb 04eh,0aeh,000h,000h,0ddh,02eh,000h,000h,04dh,06eh,000h,000h,0ddh,05eh,000h,000h	; 7370  N.......Mn...^..
	defb 04ah,05ch,000h,000h,0dah,0dch,000h,000h,04ah,03ch,000h,000h,0d0h,0b8h,000h,000h	; 7380  J\......J<......
	defb 04fh,0d8h,000h,000h,0d7h,0d0h,000h,000h,04fh,0d0h,000h,000h,0d0h,000h,000h,000h	; 7390  O.......O.......
	defb 047h,0c0h,000h,000h,0d7h,000h,000h,000h,048h,080h,000h,000h,0d1h,0c0h,000h,000h	; 73a0  G.......H.......
	defb 04ah,0e0h,000h,000h,0d1h,070h,000h,000h,042h,098h,000h,000h,0d1h,02ch,000h,000h	; 73b0  J....p..B....,..
	defb 021h,054h,000h,000h,0e1h,074h,000h,000h,001h,074h,000h,000h,001h,0b4h,000h,000h	; 73c0  !T...t...t......
	defb 000h,0c8h,000h,000h,000h,078h,000h,000h,000h,020h,000h,000h,000h,000h,000h,000h	; 73d0  .....x... ......
	defb 000h,000h,000h,001h,000h,000h,000h,003h,000h,000h,000h,007h,000h,000h,000h,00bh	; 73e0  ................
	defb 000h,000h,000h,03fh,000h,000h,000h,050h,000h,000h,000h,067h,000h,000h,000h,084h	; 73f0  ...?...P...g....
	defb 000h,000h,000h,089h,000h,000h,001h,08ah,000h,000h,001h,091h,000h,000h,000h,012h	; 7400  ................
	defb 000h,000h,000h,029h,000h,000h,000h,02ah,000h,000h,000h,059h,000h,000h,000h,05ah	; 7410  ...)...*...Y...Z
	defb 000h,000h,000h,0a9h,000h,000h,000h,0abh,000h,000h,001h,071h,000h,000h,001h,07bh	; 7420  ...........q...{
	defb 000h,000h,002h,0f9h,000h,000h,002h,0f3h,000h,000h,005h,0e9h,000h,000h,009h,0d2h	; 7430  ................
	defb 000h,000h,012h,0a9h,000h,000h,032h,05bh,000h,000h,02ah,0bbh,000h,000h,029h,07bh	; 7440  ......2[..*...){
	defb 000h,000h,05ah,0e3h,000h,000h,0a9h,05bh,000h,000h,0cbh,031h,000h,000h,0abh,02bh	; 7450  ..Z....[...1...+
	defb 000h,000h,0abh,02bh,000h,000h,0cbh,033h,000h,000h,0a9h,05bh,000h,000h,05ah,0e3h	; 7460  ...+...3...[..Z.
	defb 000h,000h,029h,07bh,000h,000h,02ah,0b9h,000h,000h,032h,05bh,000h,000h,012h,0abh	; 7470  ..){..*...2[....
	defb 000h,000h,009h,093h,000h,000h,005h,0abh,000h,000h,002h,0d3h,000h,000h,002h,0ebh	; 7480  ................
	defb 000h,000h,001h,073h,000h,000h,001h,07bh,000h,000h,000h,0b3h,000h,000h,000h,08bh	; 7490  ...s...{........
	defb 000h,000h,000h,05bh,000h,000h,000h,05bh,000h,000h,000h,02bh,000h,000h,000h,02bh	; 74a0  ...[...[...+...+
	defb 000h,000h,000h,013h,000h,000h,000h,013h,000h,000h,000h,00bh,000h,000h,000h,00bh	; 74b0  ................
	defb 000h,000h,004h,044h,000h,000h,002h,0c7h,000h,000h,001h,0c0h,000h,000h,003h,081h	; 74c0  ...D............
	defb 000h,000h,007h,073h,000h,000h,000h,02fh,000h,000h,000h,013h,000h,000h,000h,001h	; 74d0  ...s.../........
	defb 055h,055h,055h,055h,080h,000h,000h,000h,000h,000h,000h,000h,080h,000h,000h,000h	; 74e0  UUUU............
	defb 000h,000h,000h,000h,080h,000h,000h,000h,001h,055h,055h,055h,082h,0aah,0aah,0aah	; 74f0  .........UUU....
	defb 001h,055h,055h,05fh,082h,080h,02ah,0b8h,001h,040h,075h,071h,082h,08ah,0eah,0e2h	; 7500  .UU_..*..@uq....
	defb 001h,045h,075h,07fh,082h,08ah,0eah,0cfh,001h,045h,075h,057h,082h,08ah,0cah,08eh	; 7510  .Eu......EuW....
	defb 001h,045h,09fh,017h,082h,08ah,02ah,02eh,001h,045h,057h,05dh,082h,08ah,06ah,0bah	; 7520  .E....*..EW]..j.
	defb 001h,045h,03fh,0f5h,082h,08ah,09fh,0eah,001h,045h,055h,055h,082h,08ah,0eah,0aah	; 7530  .E?......EUU....
	defb 001h,045h,075h,055h,082h,08ah,0eah,0aah,001h,045h,075h,055h,082h,08ah,0eah,0aah	; 7540  .EuU.....EuU....
	defb 001h,045h,040h,055h,082h,08ah,080h,0eah,001h,045h,055h,0d5h,082h,08ah,0aah,0eah	; 7550  .E@U.....EU.....
	defb 055h,055h,055h,055h,000h,000h,000h,002h,000h,000h,000h,007h,000h,000h,000h,00eh	; 7560  UUUU............
	defb 000h,000h,000h,01fh,000h,000h,000h,03eh,055h,055h,055h,07fh,0aah,0aah,0aah,0beh	; 7570  .......>UUU.....
	defb 0ffh,0f5h,055h,07fh,020h,08eh,0aah,0beh,075h,0c7h,055h,07fh,0aah,0abh,0aah,0beh	; 7580  ..U. ...u.U.....
	defb 0ffh,0c7h,0d5h,07fh,0ffh,0ebh,0aah,0beh,055h,047h,0d5h,07fh,0aah,0b3h,0eah,0beh	; 7590  ........UG......
	defb 055h,05fh,0d5h,07fh,0aah,0b3h,0eah,0beh,055h,059h,0d5h,07fh,0aah,0b3h,0eah,0beh	; 75a0  U_......UY......
	defb 055h,07fh,0d5h,07fh,0aah,0a3h,0eah,0beh,055h,075h,0f5h,07fh,0aah,0a2h,0eah,0beh	; 75b0  U.......Uu......
	defb 055h,075h,0f5h,07fh,0aah,0a2h,0eah,0beh,055h,075h,0f5h,07fh,0aah,0a2h,0eah,0beh	; 75c0  Uu......Uu......
	defb 055h,075h,0f5h,07fh,0aah,0a2h,0eah,0beh,055h,075h,0f5h,07fh,0aah,0a2h,0eah,0beh	; 75d0  Uu......Uu......
	defb 001h,045h,055h,0d5h,082h,08ah,0aah,0eah,001h,045h,055h,0d5h,082h,08eh,0bfh,0aah	; 75e0  .EU......EU.....
	defb 001h,05dh,07fh,055h,082h,0a8h,0eah,0aah,001h,051h,0d5h,055h,082h,0a8h,0e8h,000h	; 75f0  .].U.....Q.U....
	defb 001h,051h,0d0h,000h,082h,0a8h,0e2h,0aah,001h,051h,0c5h,055h,082h,0a8h,0e2h,0aah	; 7600  .Q.......Q.U....
	defb 001h,051h,0c5h,033h,082h,0a8h,08ah,0aah,001h,051h,055h,033h,082h,0a8h,0aah,0aah	; 7610  .Q.3.....QU3....
	defb 001h,051h,0f5h,033h,082h,0abh,0e2h,0aah,001h,055h,045h,033h,082h,0aah,0a2h,0aah	; 7620  .Q.3.....UE3....
	defb 001h,055h,045h,055h,082h,0aah,0afh,0ffh,001h,055h,05fh,0ffh,082h,0aah,0aah,0aah	; 7630  .UEU.....U_.....
	defb 001h,055h,055h,055h,082h,0aah,0aah,0aah,003h,0ffh,0ffh,0ffh,087h,0ffh,0ffh,0ffh	; 7640  .UUU............
	defb 00fh,0ffh,0ffh,0ffh,09fh,0ffh,0ffh,0ffh,03fh,0ffh,0ffh,0ffh,0aah,0aah,0aah,0aah	; 7650  ........?.......
	defb 055h,075h,0f5h,07fh,0aah,0a2h,0eah,0beh,055h,055h,0d5h,07fh,0a8h,00fh,082h,0beh	; 7660  Uu......UU......
	defb 050h,000h,007h,07fh,0a2h,0aah,0aeh,0beh,045h,055h,057h,07fh,00ah,0aah,0aeh,0beh	; 7670  P.......EUW.....
	defb 013h,033h,037h,07fh,0aah,0aah,0aeh,0beh,053h,033h,037h,07fh,0aah,0aah,0aeh,0beh	; 7680  .37.....S37.....
	defb 033h,033h,037h,07fh,0aah,0aah,0aeh,0beh,033h,033h,037h,07fh,0aah,0aah,0aeh,0beh	; 7690  337.....337.....
	defb 033h,033h,037h,07fh,0aah,0aah,0aeh,0beh,033h,033h,037h,07fh,0aah,0aah,0aeh,0beh	; 76a0  337.....337.....
	defb 055h,055h,05dh,07fh,0ffh,0ffh,0fah,0beh,0ffh,0ffh,0f5h,07fh,0aah,0aah,0aah,0beh	; 76b0  UU].............
	defb 055h,055h,055h,07fh,0aah,0aah,0aah,0beh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh	; 76c0  UUU.............
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0ffh,0ffh,0ffh,0ffh,0aah,0aah,0aah,0aah	; 76d0  ................
	defb 055h,055h,055h,055h,080h,000h,000h,002h,000h,000h,000h,005h,08ah,0aah,0aah,0aeh	; 76e0  UUUU............
	defb 010h,000h,000h,01dh,087h,0ffh,0ffh,0ceh,014h,000h,000h,05dh,084h,000h,0a0h,04eh	; 76f0  ...........]...N
	defb 014h,00ah,000h,05dh,084h,0a0h,000h,04eh,014h,000h,0a0h,05dh,084h,00ah,000h,04eh	; 7700  ...]...N...]...N
	defb 014h,0a0h,000h,05dh,084h,000h,000h,04eh,014h,000h,000h,05dh,084h,000h,005h,04eh	; 7710  ...]...N...]...N
	defb 014h,000h,050h,05dh,084h,005h,000h,04eh,014h,050h,005h,05dh,084h,000h,050h,04eh	; 7720  ..P]...N.P.]..PN
	defb 014h,005h,000h,05dh,084h,050h,000h,04eh,014h,000h,000h,05dh,084h,000h,000h,04eh	; 7730  ...].P.N...]...N
	defb 014h,000h,000h,05dh,084h,000h,000h,04eh,017h,0ffh,0ffh,0ddh,080h,000h,000h,00eh	; 7740  ...]...N........
	defb 015h,055h,055h,05dh,0bfh,0ffh,0ffh,0feh,07fh,0ffh,0ffh,0fdh,0aah,0aah,0aah,0aah	; 7750  .UU]............
	defb 055h,055h,055h,055h,080h,000h,000h,002h,000h,000h,000h,005h,080h,000h,000h,00eh	; 7760  UUUU............
	defb 005h,055h,055h,05dh,08fh,0fah,0ffh,0beh,007h,0f1h,07fh,01dh,08eh,0a2h,0eah,03eh	; 7770  .UU]...........>
	defb 007h,051h,075h,01dh,08eh,0a2h,0eah,03eh,007h,051h,075h,01dh,08eh,0a2h,0eah,03eh	; 7780  .Qu....>.Qu....>
	defb 004h,001h,040h,01dh,088h,002h,080h,03eh,005h,055h,055h,05dh,08ah,0aah,0aah,0beh	; 7790  ..@....>.UU]....
	defb 005h,055h,055h,05dh,08fh,0fah,0ffh,0beh,007h,0f1h,07fh,01dh,08eh,0a2h,0eah,03eh	; 77a0  .UU]...........>
	defb 007h,051h,075h,01dh,08eh,0a2h,0eah,03eh,007h,051h,075h,01dh,08eh,0a2h,0eah,03eh	; 77b0  .Qu....>.Qu....>
	defb 004h,001h,040h,01dh,088h,002h,080h,03eh,005h,055h,055h,05dh,08ah,0aah,0aah,0beh	; 77c0  ..@....>.UU]....
	defb 01fh,0ffh,0ffh,0fdh,0bfh,0ffh,0ffh,0feh,07fh,0ffh,0ffh,0fdh,0aah,0aah,0aah,0aah	; 77d0  ................
	defb 000h,0c0h,05dh,000h,000h,0a2h,0bfh,000h,000h,0c0h,05dh,000h,000h,0a2h,0bfh,000h	; 77e0  ..].......].....
	defb 000h,0c0h,05dh,000h,000h,0a2h,0bfh,000h,000h,0c0h,05dh,000h,000h,0a2h,0bfh,000h	; 77f0  ..].......].....
	defb 000h,0c0h,05dh,000h,000h,0a2h,0bfh,000h,000h,0c0h,05dh,000h,000h,0a2h,0bfh,000h	; 7800  ..].......].....
	defb 000h,0c0h,05dh,000h,000h,0a2h,0bfh,000h,000h,0c0h,05dh,000h,000h,0a2h,0bfh,000h	; 7810  ..].......].....
	defb 000h,0c0h,05dh,000h,000h,0a2h,0bfh,000h,000h,0c0h,05dh,000h,000h,0a2h,0bfh,000h	; 7820  ..].......].....
	defb 000h,0c0h,05dh,000h,000h,0a2h,0bfh,000h,000h,0c0h,05dh,000h,000h,0a2h,0bfh,000h	; 7830  ..].......].....
	defb 000h,0c0h,05dh,000h,000h,0a2h,0bfh,000h,000h,0c0h,05dh,000h,000h,0a2h,0bfh,000h	; 7840  ..].......].....
	defb 000h,0c0h,05dh,000h,000h,0a2h,0bfh,000h,000h,0c0h,05dh,000h,000h,0a2h,0bfh,000h	; 7850  ..].......].....
	defb 000h,0ffh,0ffh,000h,000h,0c0h,007h,000h,000h,0c4h,00fh,000h,000h,0c8h,01bh,000h	; 7860  ................
	defb 000h,0d0h,033h,000h,000h,0e0h,063h,000h,000h,0c0h,0c3h,000h,000h,0d5h,0abh,000h	; 7870  ..3...c.........
	defb 000h,0ebh,057h,000h,000h,0c6h,003h,000h,000h,0cch,007h,000h,000h,0d8h,00bh,000h	; 7880  ..W.............
	defb 000h,0f0h,013h,000h,000h,0e0h,003h,000h,000h,0ffh,0ffh,000h,000h,0eah,0abh,000h	; 7890  ................
	defb 000h,0ffh,0ffh,000h,000h,0c0h,007h,000h,000h,0c4h,00fh,000h,000h,0c8h,01bh,000h	; 78a0  ................
	defb 000h,0d0h,033h,000h,000h,0e0h,063h,000h,000h,0c0h,0c3h,000h,000h,0d5h,0abh,000h	; 78b0  ..3...c.........
	defb 000h,0ebh,057h,000h,000h,0c6h,003h,000h,000h,0cch,007h,000h,000h,0d8h,00bh,000h	; 78c0  ..W.............
	defb 000h,0f0h,013h,000h,000h,0e0h,003h,000h,000h,0ffh,0ffh,000h,000h,0eah,0abh,000h	; 78d0  ................
	defb 000h,055h,055h,000h,001h,000h,000h,080h,000h,000h,000h,0c0h,004h,000h,001h,0e0h	; 78e0  .UU.............
	defb 000h,03fh,0ffh,0f0h,010h,07fh,0fch,0f8h,000h,0d5h,054h,07ch,041h,0a6h,09ah,03eh	; 78f0  .?........T|A..>
	defb 003h,055h,055h,01fh,086h,080h,002h,08fh,007h,000h,007h,04fh,086h,080h,006h,08fh	; 7900  .UU........O....
	defb 007h,00fh,0f7h,04fh,086h,088h,016h,08fh,007h,00ah,0d7h,04fh,086h,08ah,016h,08fh	; 7910  ...O.......O....
	defb 007h,008h,057h,04fh,086h,08bh,056h,08fh,007h,008h,017h,04fh,086h,08fh,0f6h,08fh	; 7920  ..WO..V....O....
	defb 007h,000h,007h,04fh,086h,0bfh,0feh,08fh,007h,07fh,0fdh,01fh,083h,0aah,0aah,03fh	; 7930  ...O...........?
	defb 001h,0d9h,064h,07eh,020h,0eah,0a8h,0fch,000h,040h,001h,0f8h,008h,000h,003h,0f0h	; 7940  ..d~ ....@......
	defb 000h,03fh,0ffh,0e0h,002h,07fh,0ffh,0c0h,000h,07fh,0ffh,080h,000h,0ffh,0ffh,000h	; 7950  .?..............
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 7960  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 7970  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0f1h,021h,0f1h,021h,058h,091h,058h,091h	; 7980  .........!.!X.X.
	defb 0cdh,009h,0cdh,009h,046h,085h,046h,085h,0c3h,001h,0c3h,001h,041h,081h,041h,081h	; 7990  ....F.F.....A.A.
	defb 0c0h,0c1h,0c0h,0c1h,041h,061h,041h,061h,0c0h,0b1h,0c0h,0b1h,051h,019h,051h,019h	; 79a0  ....AaAa....Q.Q.
	defb 0c8h,08dh,0c8h,08dh,045h,007h,045h,007h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 79b0  ....E.E.........
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 79c0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 79d0  ................
	defb 000h,000h,000h,000h,000h,000h,000h,001h,000h,000h,000h,003h,00ah,0aah,0aah,0afh	; 79e0  ................
	defb 01fh,0ffh,0ffh,0f7h,00fh,0f7h,0dfh,0efh,01dh,055h,055h,047h,08eh,0a6h,09ah,08eh	; 79f0  .........UUG....
	defb 01dh,055h,055h,047h,008h,004h,010h,00fh,01fh,0c0h,007h,0e7h,00eh,08ah,0aeh,08fh	; 7a00  .UUG............
	defb 01dh,010h,007h,047h,00eh,087h,0eeh,08fh,01dh,014h,027h,047h,008h,005h,0ach,00fh	; 7a10  ...G......'G....
	defb 01fh,0d5h,0a7h,0e7h,00eh,085h,0aeh,08fh,01dh,015h,0a7h,047h,00eh,084h,02eh,08fh	; 7a20  ...........G....
	defb 01dh,014h,027h,047h,008h,005h,0ach,00fh,01fh,0d5h,0a7h,0e7h,08eh,085h,0aeh,08eh	; 7a30  ..'G............
	defb 01dh,015h,0a7h,047h,00eh,084h,02eh,08fh,01ch,017h,0e4h,007h,008h,000h,008h,00fh	; 7a40  ...G............
	defb 015h,055h,055h,057h,01fh,0ffh,0ffh,0ffh,03fh,0ffh,0ffh,0ffh,07fh,0ffh,0ffh,0ffh	; 7a50  .UUW....?.......
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 7a60  UUUU....UUUU....
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,000h,000h,000h,000h,000h,000h,000h,000h	; 7a70  UUUU............
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,000h,001h,000h,001h,080h,002h,080h,002h	; 7a80  UUUU............
	defb 015h,057h,015h,057h,08fh,0feh,08fh,0feh,01dh,047h,01dh,047h,08ah,0aeh,08ah,0aeh	; 7a90  .W.W.....G.G....
	defb 01dh,047h,01dh,047h,08ah,0aeh,08ah,0aeh,010h,007h,010h,007h,08ah,0aeh,08ah,0aeh	; 7aa0  .G.G............
	defb 01fh,0ffh,01fh,0ffh,0bfh,0feh,0bfh,0feh,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 7ab0  ........UUUU....
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 7ac0  ........UUUU....
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 7ad0  UUUU....UUUU....
	defb 054h,055h,055h,0d5h,0a8h,0aah,0aah,0eah,054h,055h,055h,0d5h,0a8h,0a0h,00ah,0eah	; 7ae0  TUU.....TUU.....
	defb 054h,045h,05dh,0d5h,0a8h,0afh,0eah,0eah,054h,045h,05dh,0d5h,0a8h,0aeh,08ah,0eah	; 7af0  TE].....TE].....
	defb 054h,045h,05dh,0d5h,0a8h,0aeh,08ah,0eah,054h,045h,05dh,0d5h,0a8h,0aeh,08ah,0eah	; 7b00  TE].....TE].....
	defb 054h,045h,05dh,0d5h,0a8h,0aeh,08ah,0eah,054h,045h,05dh,0d5h,0a8h,0aeh,08ah,0eah	; 7b10  TE].....TE].....
	defb 054h,045h,05dh,0d5h,0a8h,0aeh,08ah,0eah,054h,045h,05dh,0d5h,0a8h,0aeh,08ah,0eah	; 7b20  TE].....TE].....
	defb 054h,045h,05dh,0d5h,0a8h,0aeh,08ah,0eah,054h,045h,05dh,0d5h,0a8h,0aeh,08ah,0eah	; 7b30  TE].....TE].....
	defb 054h,045h,05dh,0d5h,0a8h,0aeh,08ah,0eah,054h,044h,01dh,0d5h,0a8h,0aah,0aah,0eah	; 7b40  TE].....TD......
	defb 054h,05fh,0fdh,0d5h,0a8h,0aah,0aah,0eah,054h,055h,055h,0d5h,0a8h,0aah,0aah,0eah	; 7b50  T_......TUU.....
	defb 055h,055h,055h,055h,0aah,0aah,02ah,0aah,055h,054h,015h,055h,0aah,0aah,02ah,0aah	; 7b60  UUUU..*.UT.U..*.
	defb 055h,055h,055h,055h,0aah,0a0h,002h,0aah,055h,045h,051h,055h,0aah,08ah,02bh,0aah	; 7b70  UUUU....UEQU..+.
	defb 055h,015h,055h,0d5h,0aah,028h,00ah,0eah,054h,051h,05dh,055h,0a8h,022h,02eh,0eah	; 7b80  U.U..(..TQ]U."..
	defb 054h,045h,05fh,075h,0a8h,08ah,02eh,0eah,050h,045h,057h,075h,0a8h,08ah,02eh,0fah	; 7b90  TE_u....PEWu....
	defb 051h,014h,017h,075h,0a8h,08ah,02bh,0fah,051h,014h,017h,075h,0a0h,08ah,02bh,0bah	; 7ba0  Q..u..+.Q..u..+.
	defb 051h,014h,017h,07dh,0a0h,08ah,0abh,0bah,051h,01fh,0ffh,07dh,0a0h,0bfh,0ffh,0bah	; 7bb0  Q..}....Q..}....
	defb 051h,055h,055h,07dh,0a3h,0ffh,0ffh,0fah,057h,084h,010h,0fdh,0afh,0ffh,0ffh,0fah	; 7bc0  QUU}....W.......
	defb 05fh,0f1h,0c7h,0fdh,0afh,0ffh,0ffh,0fah,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 7bd0  _.......UUUU....
	defb 055h,055h,055h,055h,0beh,0aah,0aah,0beh,049h,05dh,03dh,013h,0dch,0b2h,08eh,03ah	; 7be0  UUUU....I]=....:
	defb 076h,071h,04ch,06fh,0dbh,03ch,03ch,0dah,04dh,0c7h,0e3h,0b1h,0a6h,0f8h,01fh,062h	; 7bf0  vqLo.<<.M......b
	defb 053h,0d5h,055h,0c5h,0abh,080h,002h,0cah,05dh,015h,057h,0bdh,0bdh,0aah,0aah,0beh	; 7c00  S.U.....].W.....
	defb 065h,01fh,0f7h,0a5h,0a6h,0a8h,01ah,066h,052h,01ah,0d7h,051h,0aah,0abh,09ah,04ah	; 7c10  e......fR..Q...J
	defb 052h,019h,0d7h,055h,08ah,0abh,05ah,04ah,066h,018h,017h,065h,0a5h,0afh,0fah,0a6h	; 7c20  R..U..ZJf..e....
	defb 07dh,015h,057h,0bdh,0bdh,0aah,0aah,0bah,053h,07fh,0ffh,0d5h,0a3h,0aah,0abh,0cah	; 7c30  }.W.....S.......
	defb 046h,0f8h,01fh,065h,08dh,0c7h,0e3h,0b2h,05bh,03ch,03ch,0dbh,0f6h,032h,08eh,06eh	; 7c40  F..e....[<<..2.n
	defb 05ch,071h,04dh,03bh,0c8h,0bch,0bah,092h,07dh,055h,055h,07dh,0aah,0aah,0aah,0aah	; 7c50  \qM;....}UU}....
	defb 055h,075h,0f5h,07fh,0aah,0a2h,0eah,0bfh,055h,075h,0f5h,05fh,0aah,0a2h,0eah,0afh	; 7c60  Uu......Uu._....
	defb 055h,075h,0f5h,057h,0aah,0a2h,0eah,0abh,055h,075h,0f5h,055h,0aah,0a2h,0eah,0aah	; 7c70  Uu.W....Uu.U....
	defb 055h,075h,0f5h,055h,0aah,0a2h,0e8h,002h,055h,075h,0f0h,007h,0aah,0a2h,0e8h,0aeh	; 7c80  Uu.U....Uu......
	defb 055h,075h,0f1h,057h,0aah,0a2h,0e8h,0aeh,055h,075h,0f1h,057h,0aah,0a2h,0e8h,0aeh	; 7c90  Uu.W....Uu.W....
	defb 055h,075h,0f1h,057h,0aah,0a2h,0e8h,0aeh,055h,075h,0f1h,057h,0aah,0a2h,0e8h,0aeh	; 7ca0  Uu.W....Uu.W....
	defb 055h,075h,0f1h,057h,0aah,0a2h,0ebh,0feh,055h,075h,0f7h,0ffh,0aah,0a2h,0eah,0aah	; 7cb0  Uu.W....Uu......
	defb 055h,075h,0f5h,055h,0aah,0a2h,0eah,0aah,055h,075h,0f5h,055h,0aah,0a2h,0eah,0abh	; 7cc0  Uu.U....Uu.U....
	defb 055h,075h,0f5h,057h,0aah,0a2h,0eah,0afh,055h,075h,0f5h,05fh,0aah,0a2h,0eah,0bfh	; 7cd0  Uu.W....Uu._....
	defb 055h,055h,055h,055h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 7ce0  UUUU............
	defb 000h,000h,000h,000h,000h,000h,000h,000h,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 7cf0  ........UUUU....
	defb 055h,055h,055h,055h,0a0h,00ah,0a0h,00ah,047h,0c5h,047h,0c5h,098h,032h,098h,032h	; 7d00  UUUU....G.G..2.2
	defb 020h,019h,020h,019h,022h,0b8h,022h,0b8h,045h,05dh,045h,05dh,04ah,0ach,04ah,0ach	; 7d10   . .".".E]E]J.J.
	defb 045h,05dh,045h,05dh,04ah,0ach,04ah,0ach,045h,05dh,045h,05dh,02ah,0b8h,02ah,0b8h	; 7d20  E]E]J.J.E]E]*.*.
	defb 03dh,079h,03dh,079h,09fh,0f2h,09fh,0f2h,047h,0c5h,047h,0c5h,0a0h,00ah,0a0h,00ah	; 7d30  =y=y....G.G.....
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 7d40  UUUU............
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0aah,0aah,0aah,0aah	; 7d50  ................
	defb 055h,055h,040h,000h,000h,000h,028h,000h,000h,000h,004h,000h,000h,000h,002h,080h	; 7d60  UU@...(.........
	defb 000h,000h,000h,040h,000h,000h,000h,028h,055h,055h,040h,004h,0aah,0aah,0a0h,002h	; 7d70  ...@...(UU@.....
	defb 055h,055h,054h,001h,0a0h,00ah,0aah,002h,047h,0c5h,055h,047h,098h,032h,0aah,0aeh	; 7d80  UUT.....G.UG.2..
	defb 020h,019h,055h,05fh,022h,0b8h,0aah,0beh,045h,05dh,000h,05fh,04ah,0ach,0aah,0feh	; 7d90   .U_"...E]._J...
	defb 045h,05dh,015h,05fh,04ah,0ach,0aah,0feh,045h,05dh,07fh,0dfh,02ah,0b8h,0aah,0beh	; 7da0  E]._J...E]..*...
	defb 03dh,079h,055h,05fh,09fh,0f2h,0aah,0beh,047h,0c5h,055h,0ffh,0a0h,00ah,0abh,0feh	; 7db0  =yU_....G.U.....
	defb 055h,055h,05fh,0fch,0aah,0aah,0bfh,0f0h,0ffh,0ffh,0ffh,0c0h,0ffh,0ffh,0ffh,000h	; 7dc0  UU_.............
	defb 0ffh,0ffh,0fch,000h,0ffh,0ffh,0f0h,000h,0ffh,0ffh,0c0h,000h,0aah,0aah,080h,000h	; 7dd0  ................
	defb 000h,005h,055h,055h,000h,008h,000h,000h,000h,050h,000h,000h,000h,080h,000h,000h	; 7de0  ..UU.....P......
	defb 005h,000h,000h,000h,008h,000h,000h,000h,050h,001h,055h,055h,080h,00ah,0aah,0aah	; 7df0  ........P.UU....
	defb 000h,015h,055h,055h,080h,0aah,0a0h,00ah,001h,055h,047h,0c5h,082h,0aah,098h,032h	; 7e00  ..UU.....UG....2
	defb 001h,055h,020h,019h,082h,0aah,022h,0b8h,000h,001h,045h,05dh,082h,0aah,04ah,0ach	; 7e10  .U ..."...E]..J.
	defb 000h,057h,045h,05dh,082h,0aah,04ah,0ach,001h,0ffh,045h,05dh,082h,0aah,02ah,0b8h	; 7e20  .WE]..J...E]..*.
	defb 001h,055h,03dh,079h,08eh,0aah,09fh,0f2h,03fh,055h,047h,0c5h,0ffh,0eah,0a0h,00ah	; 7e30  .U=y....?UG.....
	defb 03fh,0f5h,055h,055h,00fh,0feh,0aah,0aah,003h,0ffh,0ffh,0ffh,000h,0ffh,0ffh,0ffh	; 7e40  ?.UU............
	defb 000h,03fh,0ffh,0ffh,000h,00fh,0ffh,0ffh,000h,003h,0ffh,0ffh,000h,000h,0aah,0aah	; 7e50  .?..............
	defb 001h,045h,055h,0d5h,002h,08ah,0aah,0eah,005h,044h,005h,0d5h,00ah,088h,00eh,0eah	; 7e60  .EU......D......
	defb 015h,044h,05dh,0d5h,02ah,088h,0aeh,0eah,055h,044h,05dh,0d5h,0aah,088h,0aeh,0eah	; 7e70  .D].*...UD].....
	defb 055h,044h,05dh,0d5h,0aah,088h,0aeh,0eah,040h,004h,05dh,0d5h,080h,008h,0feh,0eah	; 7e80  UD].....@.].....
	defb 045h,055h,0fdh,0d5h,08ah,0aah,0aah,0eah,045h,055h,055h,0d5h,08ah,0aah,0aah,0eah	; 7e90  EU......EUU.....
	defb 045h,055h,055h,0d5h,08ah,0aah,0aah,0eah,045h,054h,005h,0d5h,08ah,0a8h,00eh,0eah	; 7ea0  EUU.....ET......
	defb 05fh,0f4h,05dh,0d5h,0bfh,0e8h,0aeh,0eah,055h,044h,05dh,0d5h,0aah,088h,0aeh,0eah	; 7eb0  _.].....UD].....
	defb 055h,044h,05dh,0d5h,0aah,088h,0aeh,0eah,055h,044h,05dh,0d5h,02ah,088h,0feh,0eah	; 7ec0  UD].....UD].*...
	defb 015h,045h,0fdh,0d5h,00ah,08ah,0aah,0eah,005h,045h,055h,0d5h,082h,08ah,0aah,0eah	; 7ed0  .E.......EU.....
	defb 000h,000h,000h,007h,000h,000h,000h,03fh,000h,000h,000h,078h,000h,000h,000h,0c0h	; 7ee0  .......?...x....
	defb 000h,000h,001h,08fh,000h,000h,001h,0b9h,000h,01fh,080h,0e7h,000h,023h,071h,09dh	; 7ef0  .............#q.
	defb 000h,03dh,08dh,0f5h,000h,03eh,0c2h,0c5h,000h,03fh,061h,075h,000h,03fh,0b0h,0b5h	; 7f00  .=...>...?au.?..
	defb 000h,01dh,058h,051h,000h,01ah,0a9h,06dh,000h,01fh,056h,0b5h,000h,00ah,0a3h,057h	; 7f10  ..XQ...m..V....W
	defb 000h,00dh,009h,0bbh,000h,006h,094h,0dbh,000h,004h,02eh,0bbh,000h,002h,058h,07bh	; 7f20  ..............X{
	defb 000h,002h,0b2h,07dh,000h,001h,0e0h,03dh,000h,001h,0cah,03dh,000h,003h,040h,03dh	; 7f30  ...}...=...=..@=
	defb 000h,006h,020h,01dh,000h,00ch,010h,01dh,000h,010h,008h,01dh,000h,020h,004h,00ch	; 7f40  .. .......... ..
	defb 000h,000h,002h,018h,000h,000h,001h,0a8h,000h,000h,000h,070h,000h,000h,000h,000h	; 7f50  ...........p....
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,054h,00dh,070h,000h,06ch,008h,0f0h,000h	; 7f60  ........T.p.l...
	defb 054h,00dh,070h,000h,06ch,008h,0f0h,000h,054h,07fh,0feh,000h,028h,07fh,0feh,042h	; 7f70  T.p.l...T...(..B
	defb 038h,00dh,070h,06ch,010h,03fh,0ffh,078h,010h,06fh,0f5h,0f8h,038h,0d8h,01ah,0fch	; 7f80  8.pl.?.x.o..8...
	defb 011h,0b2h,0adh,06eh,003h,061h,056h,0b0h,006h,0cah,09bh,050h,005h,095h,039h,0b0h	; 7f90  ...n.aV....P..9.
	defb 006h,0a2h,0a5h,050h,005h,090h,01dh,0b0h,006h,0aah,07dh,050h,005h,090h,01dh,0b0h	; 7fa0  ...P......}P....
	defb 006h,0a2h,0a5h,060h,005h,0d5h,0bbh,0e0h,006h,0e9h,0d7h,040h,007h,073h,0ceh,0c0h	; 7fb0  ...`.......@.s..
	defb 002h,0b8h,01dh,040h,003h,0ffh,0ffh,0c0h,000h,081h,055h,000h,000h,06ah,0beh,000h	; 7fc0  ...@......U..j..
	defb 000h,01fh,0f8h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 7fd0  ................
	defb 055h,075h,0f5h,07fh,0aah,0a2h,0eah,0bfh,055h,075h,0f5h,05fh,0aah,0a2h,0eah,0afh	; 7fe0  Uu......Uu._....
	defb 055h,075h,0f5h,057h,0aah,0a2h,0eah,0abh,055h,075h,0f5h,055h,0aah,0a2h,0eah,0aah	; 7ff0  Uu.W....Uu.U....
	defb 057h,0ffh,0ffh,07fh,0aeh,00ah,0bfh,0c8h,055h,041h,05fh,01dh,0aeh,00ah,0bfh,02ah	; 8000  W.......UA_....*
	defb 055h,041h,05fh,05fh,0aeh,00ah,0bfh,0bfh,055h,041h,05fh,0f5h,0aeh,00ah,0bfh,0eah	; 8010  UA__....UA_.....
	defb 057h,0ffh,0ffh,055h,0aah,0aah,0aah,0aah,040h,015h,050h,005h,080h,02ah,0a8h,00eh	; 8020  W..U....@.P..*..
	defb 045h,075h,051h,05dh,08ah,0eah,0a8h,0aeh,045h,075h,051h,05dh,08ah,0eah,0a8h,0aeh	; 8030  EuQ]....EuQ]....
	defb 045h,040h,001h,05dh,08ah,080h,002h,0aeh,045h,055h,055h,05dh,08ah,0aah,0aah,0aeh	; 8040  E@.]....EUU]....
	defb 045h,055h,055h,05dh,08fh,0ffh,0ffh,0feh,05fh,0ffh,0ffh,0fdh,0aah,0aah,0aah,0aah	; 8050  EUU]...._.......
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 8060  UUUU....UUUU....
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,080h	; 8070  UUUU....UUUU....
	defb 057h,0ffh,0ffh,040h,0aeh,00ah,0bfh,08ah,055h,041h,05fh,045h,0aeh,00ah,0bfh,08ah	; 8080  W..@....UA_E....
	defb 055h,041h,05fh,043h,0aeh,00ah,0bfh,08ah,055h,041h,05fh,043h,0aeh,00ah,0bfh,08ah	; 8090  UA_C....UA_C....
	defb 057h,0ffh,0ffh,043h,0aah,0a2h,0eah,08ah,055h,075h,0f5h,043h,0aah,0a2h,0eah,08ah	; 80a0  W..C....Uu.C....
	defb 055h,075h,0f5h,045h,0aah,0a2h,0eah,08fh,055h,075h,0f5h,05fh,0aah,0a2h,0eah,0aah	; 80b0  Uu.E....Uu._....
	defb 055h,075h,0f5h,055h,0aah,0a2h,0eah,0aah,055h,075h,0f5h,055h,0aah,0a2h,0eah,0abh	; 80c0  Uu.U....Uu.U....
	defb 055h,075h,0f5h,057h,0aah,0a2h,0eah,0afh,055h,075h,0f5h,05fh,0aah,0a2h,0eah,0bfh	; 80d0  Uu.W....Uu._....
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 80e0  UUUU....UUUU....
	defb 055h,055h,055h,035h,0aah,0aah,0aah,03ah,055h,055h,054h,05dh,000h,000h,0a8h,0aeh	; 80f0  UUU5...:UUT]....
	defb 000h,001h,0d1h,057h,0aah,0aah,0e8h,0aeh,055h,055h,074h,05dh,0aah,0beh,0bah,03ah	; 8100  ...W....UUt]...:
	defb 033h,07ch,05dh,035h,0aah,0eah,02eh,0aah,033h,075h,017h,055h,0aah,0eah,08bh,0aah	; 8110  3|]5....3u.U....
	defb 033h,075h,045h,0d5h,0aah,0eah,0a2h,0eah,033h,075h,051h,0d5h,0aah,0bah,0a2h,0eah	; 8120  3uE.....3uQ.....
	defb 055h,05dh,051h,0d5h,0ffh,0aeh,0a2h,0eah,0ffh,017h,051h,0d5h,0aah,08bh,0a2h,0eah	; 8130  U]Q.......Q.....
	defb 055h,047h,051h,0d5h,0aah,08bh,0a2h,0eah,055h,047h,051h,0d5h,02ah,08bh,0a2h,0eah	; 8140  UGQ.....UGQ.*...
	defb 015h,047h,001h,0d5h,00ah,08ah,002h,0eah,005h,045h,055h,0d5h,082h,08ah,0aah,0eah	; 8150  .G.......EU.....
	defb 001h,045h,055h,0d5h,002h,08ah,0aah,0eah,005h,045h,055h,0d5h,00ah,08fh,0ffh,0eah	; 8160  .EU......EU.....
	defb 015h,05fh,0ffh,0d5h,02ah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 8170  ._..*...UUUU....
	defb 0ffh,0ffh,0f5h,055h,020h,020h,08eh,0aah,075h,075h,0c7h,055h,0aah,0aah,0abh,0aah	; 8180  ...U  ..uu.U....
	defb 0ffh,0ffh,0c7h,0d5h,0ffh,0ffh,0ebh,0aah,055h,055h,065h,0d5h,0aah,0aah,0b3h,0aah	; 8190  ........UUe.....
	defb 055h,055h,055h,0d5h,0aah,0aah,0a3h,0aah,057h,0ffh,0c5h,0d5h,0ach,020h,08bh,0aah	; 81a0  UUU.....W.... ..
	defb 05dh,075h,0d7h,055h,0aeh,0aah,0aeh,0aah,057h,0ffh,0fdh,055h,0abh,0ffh,0fah,0aah	; 81b0  ]u.U....W..U....
	defb 055h,055h,055h,055h,0a0h,0a8h,02ah,00ah,041h,0d0h,074h,01dh,0a3h,0a8h,0eah,03ah	; 81c0  UUUU..*.A.t....:
	defb 045h,0d1h,074h,05dh,0afh,0abh,0eah,0fah,05fh,0d7h,0f5h,0fdh,0aah,0aah,0aah,0aah	; 81d0  E.t]...._.......
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,051h,055h,0aah,000h,026h,0aah	; 81e0  UUUU....UUQU..&.
	defb 055h,0bfh,08fh,055h,0abh,0a7h,0d9h,02ah,053h,0dbh,057h,055h,0abh,0bbh,0beh,0aah	; 81f0  U..U...*S.WU....
	defb 053h,0b6h,006h,0d5h,0abh,0bdh,0f9h,0cah,052h,010h,0feh,0d5h,0a5h,0f7h,07eh,0cah	; 8200  S.......R.....~.
	defb 04bh,0b7h,0c8h,0d5h,0abh,06eh,0b7h,02ah,04ah,0f5h,0fah,0e5h,0a2h,0dbh,0fah,0eah	; 8210  K....n.*J.......
	defb 053h,0bbh,0dah,0e5h,0abh,0bdh,087h,0cah,055h,0beh,05dh,095h,0a6h,03dh,0dbh,04ah	; 8220  S.......U.]..=.J
	defb 057h,0c3h,0dch,0d5h,0a7h,0dfh,0bfh,0cah,057h,0e0h,05fh,095h,0a7h,0fbh,0efh,02ah	; 8230  W.......W._....*
	defb 053h,0f7h,0eeh,055h,0a8h,00fh,0e0h,0aah,055h,043h,0c5h,055h,0aah,0a8h,00ah,0aah	; 8240  S..U....UC.U....
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 8250  UUUU....UUUU....
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0a8h,000h,00ah,0aah	; 8260  UUUU....UUUU....
	defb 053h,0bbh,0e5h,055h,0a3h,0bdh,0f2h,02ah,057h,0b8h,0f8h,075h,0a4h,0f7h,027h,06ah	; 8270  S..U...*W..u..'j
	defb 053h,06fh,0dfh,055h,0a7h,0ech,0b6h,0aah,04eh,077h,07ah,055h,09dh,0bfh,0bah,0aah	; 8280  So.U....NwzU....
	defb 05bh,0b3h,0d6h,055h,0a7h,0efh,0deh,08eh,04fh,0deh,036h,095h,0afh,0bfh,0d9h,0aah	; 8290  [..U....O.6.....
	defb 050h,0bdh,0dfh,015h,0abh,0deh,0beh,0aah,056h,0e6h,0edh,085h,0adh,0fdh,0f3h,0aah	; 82a0  P.......V.......
	defb 04dh,0dbh,03bh,095h,0adh,0e6h,0fdh,00ah,04eh,0eeh,0dch,015h,0afh,01eh,0eeh,0aah	; 82b0  M.;.....N.......
	defb 057h,0f7h,066h,015h,0a8h,0efh,0e8h,0aah,055h,0f0h,005h,055h,0a8h,002h,0aah,08ah	; 82c0  W.f.....U..U....
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 82d0  UUUU....UUUU....
	defb 055h,055h,055h,055h,0aah,08ah,0aah,0aah,050h,065h,055h,055h,0aeh,0f0h,0aah,09ah	; 82e0  UUUU....PeUU....
	defb 05dh,0cfh,001h,035h,09dh,0ffh,0beh,02ah,051h,0f3h,0feh,075h,0adh,0efh,0feh,06ah	; 82f0  ]..5...*Q..u...j
	defb 05dh,0deh,0f6h,095h,09dh,0dfh,00dh,0cah,05eh,0cfh,0bbh,0e5h,0bfh,0c7h,0bfh,0eah	; 8300  ].......^.......
	defb 03dh,0c0h,033h,0d5h,083h,080h,02fh,046h,047h,040h,02fh,08dh,0a4h,0eeh,0afh,09ah	; 8310  =.3.../FG@/.....
	defb 04fh,0e0h,0efh,0b5h,0afh,0edh,0ffh,06ah,04fh,081h,09eh,0c5h,0a7h,0feh,071h,03eh	; 8320  O......jO.....q>
	defb 058h,06eh,0ffh,015h,09dh,0deh,0efh,00ah,05dh,0b6h,06eh,015h,09dh,0b7h,0c0h,0fah	; 8330  Xn......].n.....
	defb 04ch,0fbh,0deh,015h,0b3h,03bh,03eh,0fah,05bh,0c0h,079h,0f5h,0bbh,0e2h,082h,0dah	; 8340  L....;>.[.y.....
	defb 053h,093h,055h,075h,0a8h,026h,09ah,0aah,055h,055h,075h,055h,0aah,0aeh,0aah,0aah	; 8350  S.Uu.&..UUuU....
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,015h,054h,055h,0a2h,068h,0a9h,09ah	; 8360  UUUU....U.TU.h..
	defb 04dh,0a2h,051h,0b5h,09bh,0e8h,067h,04ah,05eh,02dh,057h,0d5h,095h,0e6h,060h,0aah	; 8370  M.Q...gJ^-W...`.
	defb 047h,0c4h,057h,0d5h,0aeh,0a0h,0a7h,04ah,04dh,0e0h,090h,055h,0adh,0e0h,0b6h,0aah	; 8380  G.W....JM..U....
	defb 040h,000h,0bdh,055h,0a0h,000h,0b0h,006h,040h,020h,0a0h,00dh,0a7h,0bah,09fh,05ah	; 8390  @..U....@ .....Z
	defb 050h,000h,05fh,035h,0aeh,0feh,0dch,0cah,04eh,03eh,0dbh,0c5h,084h,0c0h,0f5h,0deh	; 83a0  P._5....N>......
	defb 03fh,040h,0aeh,0a5h,0b3h,080h,03eh,0eah,07fh,080h,06eh,065h,06dh,07ch,0f5h,0aah	; 83b0  ?@....>...nem|..
	defb 02ch,061h,0b7h,015h,08dh,0eeh,030h,0fah,043h,04bh,035h,0f5h,0beh,0a2h,08ah,0dah	; 83c0  ,a....0.CK5.....
	defb 055h,053h,055h,075h,0aah,0a6h,09ah,0aah,055h,055h,075h,055h,0aah,0aeh,0aah,0aah	; 83d0  USUu....UUuU....
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,035h,055h,055h,0a6h,0aah,0aah,09ah	; 83e0  UUUU....U5UU....
	defb 055h,015h,055h,035h,0a6h,08ah,06ah,02ah,053h,00dh,054h,075h,0a2h,086h,068h,0eah	; 83f0  U.U5..j*S.Tu..h.
	defb 053h,004h,050h,0d5h,0a9h,080h,0a1h,0aah,050h,080h,093h,055h,0a8h,000h,0b6h,0aah	; 8400  S.P.....P..U....
	defb 044h,000h,0bdh,055h,0a8h,000h,0b0h,006h,040h,000h,0b0h,00dh,0a7h,0feh,0b7h,0dah	; 8410  D..U....@.......
	defb 050h,000h,0b0h,035h,0a7h,0feh,0b7h,0aah,053h,0feh,0b7h,0c5h,0a8h,000h,0b0h,03eh	; 8420  P..5....S......>
	defb 054h,000h,0b0h,015h,0aah,000h,0b0h,00ah,054h,000h,0b0h,015h,0afh,0fdh,0b7h,0fah	; 8430  T.......T.......
	defb 050h,061h,02ch,015h,0bdh,0efh,02bh,0fah,05fh,04bh,02dh,0f5h,0beh,0a2h,09ah,0dah	; 8440  Pa,...+._K-.....
	defb 055h,053h,055h,075h,0aah,0a6h,09ah,0aah,055h,055h,075h,055h,0aah,0aeh,0aah,0aah	; 8450  USUu....UUuU....
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,075h,059h,055h,055h,09eh,0a8h,0a9h,0aah	; 8460  UUUU....uYUU....
	defb 043h,059h,051h,055h,0a1h,0a8h,069h,0aah,054h,0d9h,051h,0d5h,0aah,000h,069h,0aah	; 8470  CYQU..i.T.Q...i.
	defb 054h,054h,050h,0d5h,0a8h,0b4h,0a9h,0b2h,051h,054h,0c3h,065h,0a8h,0b4h,0fah,0cah	; 8480  TTP.....QT.e....
	defb 05dh,054h,0f9h,09fh,0a8h,0b4h,001h,060h,05bh,0f4h,000h,005h,0b0h,004h,00eh,02ah	; 8490  ]T.....`[......*
	defb 050h,02ch,00eh,055h,0b0h,02ch,000h,02ah,050h,02dh,0ffh,085h,0a8h,02ch,000h,03eh	; 84a0  P,.U.,.*P-...,.>
	defb 058h,02ch,0ffh,095h,0b2h,08eh,07fh,0cah,064h,04eh,000h,015h,0cch,0ach,0bch,01ah	; 84b0  X,......dN......
	defb 094h,04dh,020h,00dh,0ach,0ach,06ah,006h,055h,049h,025h,007h,0aah,0a2h,08ah,0a3h	; 84c0  .M ...j.UI%.....
	defb 055h,051h,055h,051h,0aah,0a2h,08ah,0a8h,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 84d0  UQUQ....UUUU....
	defb 055h,055h,055h,055h,0aah,0a0h,082h,00ah,055h,055h,055h,055h,0aah,0a4h,092h,04ah	; 84e0  UUUU....UUUU...J
	defb 051h,0d5h,055h,055h,0a0h,0e4h,092h,04ah,040h,000h,000h,000h,0a2h,0aah,0aah,0aah	; 84f0  Q.UU...J@.......
	defb 047h,0ffh,0ffh,0ffh,0a0h,0e0h,082h,00ah,051h,0d5h,055h,055h,0afh,0a4h,092h,04ah	; 8500  G.......Q.UU...J
	defb 055h,055h,055h,055h,0aah,0a4h,092h,04ah,000h,015h,055h,055h,0aah,084h,092h,04ah	; 8510  UUUU...J..UU...J
	defb 03fh,0d5h,055h,055h,0aah,084h,092h,04ah,000h,015h,055h,055h,0aah,0a4h,092h,04ah	; 8520  ?.UU...J..UU...J
	defb 051h,0d5h,055h,055h,0a0h,0e4h,092h,04ah,040h,000h,000h,000h,0a2h,0aah,0aah,0aah	; 8530  Q.UU...J@.......
	defb 047h,0ffh,0ffh,0ffh,0a0h,0e0h,082h,00ah,051h,0d1h,045h,015h,0afh,0a4h,092h,04ah	; 8540  G.......Q.E....J
	defb 055h,055h,055h,055h,0aah,0a4h,092h,04ah,055h,051h,045h,015h,0aah,0aah,0aah,0aah	; 8550  UUUU...JUQE.....
	defb 055h,055h,055h,055h,0a8h,0a2h,08ah,0aah,052h,049h,025h,055h,0aah,0aah,0aah,0aah	; 8560  UUUU....RI%U....
	defb 052h,049h,025h,015h,0aah,0aah,0aah,01ah,000h,000h,000h,00dh,055h,055h,055h,04eh	; 8570  RI%.........UUUN
	defb 0ffh,0ffh,0ffh,0e5h,0a8h,0a2h,080h,00eh,052h,049h,024h,05dh,0aah,0aah,0aah,0fah	; 8580  ........RI$]....
	defb 052h,049h,025h,055h,0aah,0aah,0aah,0aah,052h,049h,020h,001h,0aah,0aah,0aah,0a8h	; 8590  RI%U....RI .....
	defb 052h,049h,023h,0fdh,0aah,0aah,0aah,0a8h,052h,049h,020h,001h,0aah,0aah,0aah,0aah	; 85a0  RI#.....RI .....
	defb 052h,049h,025h,015h,0aah,0aah,0aah,01ah,000h,000h,000h,00dh,055h,055h,055h,04eh	; 85b0  RI%.........UUUN
	defb 0ffh,0ffh,0ffh,0e5h,0a8h,0a2h,080h,00eh,052h,049h,024h,05dh,0aah,0aah,0aah,0fah	; 85c0  ........RI$]....
	defb 052h,049h,025h,055h,0aah,0aah,0aah,0aah,050h,041h,005h,055h,0aah,0aah,0aah,0aah	; 85d0  RI%U....PA.U....
	defb 055h,040h,005h,055h,0aah,08fh,0f0h,0aah,054h,030h,00ch,055h,0a8h,0c0h,003h,02ah	; 85e0  U@.U....T0.U...*
	defb 051h,000h,000h,095h,0a2h,000h,094h,04ah,044h,000h,000h,025h,088h,000h,08ah,092h	; 85f0  Q......JD..%....
	defb 050h,011h,010h,049h,090h,002h,082h,0a8h,020h,080h,034h,015h,020h,028h,0aah,0a4h	; 8600  P..I.... .4. (..
	defb 040h,045h,007h,056h,042h,002h,028h,09ah,040h,014h,0ddh,056h,040h,0a2h,0bah,0eah	; 8610  @E.VB.(.@..V@...
	defb 042h,007h,057h,056h,040h,0bah,0eah,0bah,045h,011h,05fh,056h,040h,0abh,0bfh,0eah	; 8620  B.WV@...E._V@...
	defb 021h,055h,07fh,0dch,0a4h,033h,0ffh,0ech,011h,055h,05fh,0d9h,090h,08bh,0bfh,0bah	; 8630  !U...3...U_.....
	defb 048h,077h,05fh,0d1h,0a4h,0aah,0eah,0a2h,052h,05dh,05fh,045h,0a9h,02ah,03ah,08ah	; 8640  Hw_.....R]_E.*:.
	defb 054h,0c7h,057h,015h,0aah,03ah,0ach,02ah,055h,00fh,0f1h,055h,0aah,0a0h,002h,0aah	; 8650  T.W..:.*U..U....
	defb 055h,050h,005h,055h,0aah,08fh,0f0h,0aah,055h,070h,00eh,055h,0a8h,080h,005h,02ah	; 8660  UP.U....Up.U...*
	defb 053h,00ch,0e2h,0d5h,0a4h,010h,00dh,0aah,048h,080h,00bh,055h,0a9h,000h,002h,0b2h	; 8670  S.......H..U....
	defb 052h,000h,015h,069h,0a0h,020h,008h,0dch,020h,070h,013h,0b5h,0a4h,03bh,0e6h,0dch	; 8680  R..i. .. p...;..
	defb 048h,014h,037h,0deh,048h,009h,09bh,0feh,040h,012h,04fh,0feh,040h,015h,0afh,0feh	; 8690  H.7.H...@.O.@...
	defb 048h,015h,0afh,0eeh,048h,012h,04fh,0eeh,048h,059h,09fh,0eeh,051h,02ch,037h,0feh	; 86a0  H...H.O.HY..Q,7.
	defb 024h,077h,0e3h,0feh,0b4h,0efh,0f1h,0dch,02bh,057h,0fbh,0bdh,096h,0bfh,0ffh,07ah	; 86b0  $w......+W.....z
	defb 04dh,06fh,0ffh,0f5h,0aah,0bfh,0fdh,0f2h,055h,08fh,0f3h,0e5h,0abh,07ch,07fh,0cah	; 86c0  Mo......U....|..
	defb 054h,0bfh,0ffh,015h,0aah,07fh,0feh,0aah,055h,00fh,0f1h,055h,0aah,0a0h,00ah,0aah	; 86d0  T.......U..U....
	defb 055h,07fh,0ffh,055h,0abh,0a2h,0bfh,0aah,057h,045h,07fh,055h,0aah,082h,0beh,0eah	; 86e0  U..U....WE.U....
	defb 054h,000h,000h,055h,0bfh,03fh,0fch,0feh,045h,031h,074h,0dfh,0cbh,022h,0bch,0aeh	; 86f0  T..U.?..E1t.."..
	defb 046h,031h,074h,05fh,0cah,022h,0bdh,06eh,046h,031h,075h,05fh,0cah,012h,0b9h,06eh	; 8700  F1t_.".nF1u_...n
	defb 054h,011h,07bh,037h,0cch,012h,0bbh,0aeh,054h,011h,07bh,0b7h,088h,018h,0fbh,09fh	; 8710  T.{7....T.{.....
	defb 098h,009h,073h,0d7h,0a8h,008h,0f7h,0dbh,090h,00dh,077h,0cfh,0b0h,008h,0f7h,0ebh	; 8720  ..s.......w.....
	defb 094h,005h,067h,0cfh,0a0h,004h,0efh,0e7h,0a0h,015h,067h,0f7h,0c8h,002h,0cfh,0e3h	; 8730  ..g.......g.....
	defb 0d0h,012h,0d7h,0f3h,088h,009h,08fh,0e9h,090h,015h,097h,0f5h,020h,008h,02fh,0f8h	; 8740  ............ ./.
	defb 0d0h,015h,057h,0f5h,0a0h,00ah,0afh,0fbh,0d0h,015h,057h,0f5h,0ffh,0ffh,0ffh,0ffh	; 8750  ..W.......W.....
	defb 055h,07fh,0ffh,055h,0abh,0c1h,07fh,0aah,056h,082h,0beh,0d5h,0abh,005h,05fh,06ah	; 8760  U..U....V....._j
	defb 050h,000h,010h,015h,0bbh,0ffh,0d7h,0feh,072h,02bh,0d4h,0bdh,0b3h,017h,0d5h,076h	; 8770  P.......r+.....v
	defb 072h,02bh,0d2h,0bdh,0b3h,017h,09bh,076h,06ah,02bh,0bah,0bdh,0a9h,017h,099h,076h	; 8780  r+.....vj+.....v
	defb 069h,02bh,02dh,0bdh,0adh,017h,05dh,056h,059h,02bh,02ch,0bdh,0b5h,016h,05eh,0d6h	; 8790  i+-...]VY+,...^.
	defb 059h,00ah,0aeh,0bdh,0b4h,096h,05eh,056h,068h,08ch,0afh,07dh,0b4h,095h,05fh,05eh	; 87a0  Y.....^Vh..}.._^
	defb 068h,08ch,0afh,03dh,0b0h,099h,05fh,0beh,068h,04ah,0afh,09dh,0d0h,049h,057h,0deh	; 87b0  h..=.._.hJ...IW.
	defb 068h,052h,0afh,0cdh,0d0h,035h,057h,0ech,0a0h,022h,0afh,0e5h,0d0h,005h,057h,0f1h	; 87c0  hR...5W.."....W.
	defb 0a0h,00ah,0afh,0fbh,0d0h,015h,057h,0f5h,0a0h,00ah,0afh,0fbh,0ffh,0ffh,0ffh,0ffh	; 87d0  ......W.........
	defb 055h,07fh,0ffh,055h,0abh,0a2h,0bfh,0aah,057h,045h,07fh,055h,0aah,082h,0beh,0eah	; 87e0  U..U....WE.U....
	defb 054h,001h,000h,055h,0afh,0fch,0bfh,0fah,051h,05dh,025h,07dh,0b2h,0bch,0a2h,0bah	; 87f0  T..U....Q]%}....
	defb 051h,05dh,025h,07dh,0b2h,0b8h,092h,0bah,051h,059h,055h,07dh,0b0h,0bah,092h,0fah	; 8800  Q]%}....QYU}....
	defb 051h,051h,04dh,07dh,0b0h,0b2h,0aah,0fah,051h,065h,045h,07dh,0b0h,0aah,0a6h,0fah	; 8810  QQM}....QeE}....
	defb 051h,045h,053h,07dh,0a8h,0cah,0aah,0f2h,069h,085h,059h,075h,0a8h,08ah,0adh,0f6h	; 8820  QES}....i.Yu....
	defb 069h,005h,05ch,0f5h,0a9h,00ah,0aeh,0f6h,04ah,015h,056h,077h,0eah,00ah,0afh,072h	; 8830  i.\.....J.Vw...r
	defb 04ch,015h,057h,037h,0ech,00ah,0afh,0b2h,0c8h,015h,057h,095h,0a0h,00ah,0afh,0c3h	; 8840  L.W7......W.....
	defb 0d0h,015h,057h,0f5h,0a0h,00ah,0afh,0fbh,0d0h,015h,057h,0f5h,0ffh,0ffh,0ffh,0ffh	; 8850  ..W.......W.....
	defb 055h,07fh,0ffh,055h,0abh,0c1h,07fh,0aah,056h,082h,0beh,0d5h,0abh,005h,05fh,06ah	; 8860  U..U....V....._j
	defb 054h,000h,000h,015h,0bfh,0e3h,0ffh,0dah,062h,0e2h,02bh,0cdh,0b1h,062h,017h,04eh	; 8870  T.......b.+..b.N
	defb 062h,0c2h,02bh,0cdh,0b1h,041h,017h,04eh,062h,0c1h,02bh,0cdh,0b1h,085h,017h,096h	; 8880  b.+..A.Nb.+.....
	defb 062h,088h,0abh,0b5h,0b1h,084h,097h,096h,063h,00ah,0abh,0bdh,0b5h,004h,057h,09ah	; 8890  b.......c.....W.
	defb 063h,00ah,06fh,0adh,0b6h,005h,057h,01ah,062h,00ah,02fh,06dh,0a6h,005h,037h,056h	; 88a0  c.o...W.b./m..7V
	defb 064h,00ah,0afh,06dh,0a4h,005h,017h,076h,068h,00ah,09eh,06bh,0a8h,015h,056h,0f6h	; 88b0  d..m...vh..k..V.
	defb 070h,00ah,08eh,0ebh,0b0h,015h,04ch,0f6h,0e0h,00ah,0a5h,0fbh,080h,015h,051h,0f5h	; 88c0  p.....L.......Q.
	defb 0a0h,00ah,0afh,0fbh,0d0h,015h,057h,0f5h,0a0h,00ah,0afh,0fbh,0ffh,0ffh,0ffh,0ffh	; 88d0  ......W.........
	defb 0d0h,015h,057h,0f5h,0a0h,00ah,0afh,0fbh,0d0h,015h,057h,0f5h,0a2h,00ah,0afh,0fbh	; 88e0  ..W.......W.....
	defb 0d3h,015h,057h,075h,0e2h,00ah,0afh,0fah,053h,015h,057h,077h,0e2h,00ah,0afh,0fah	; 88f0  ..Wu....S.Ww....
	defb 053h,015h,057h,077h,0eah,00ah,0afh,0eah,073h,015h,057h,075h,0aah,00ah,0afh,0eeh	; 8900  S.Ww....s.Wu....
	defb 073h,005h,05fh,075h,0aah,00ah,0afh,0eeh,053h,005h,05fh,07dh,0bah,00ah,0afh,0eah	; 8910  s._u....S._}....
	defb 053h,005h,05fh,07dh,0aah,00ah,0afh,0fah,05bh,005h,05fh,075h,0aeh,00ah,0afh,0eah	; 8920  S._}....[._u....
	defb 057h,005h,05fh,055h,0aah,00ah,0afh,0eah,057h,005h,05fh,055h,0aah,00ah,0afh,0eah	; 8930  W._U....W._U....
	defb 057h,005h,05fh,055h,0aah,00ah,0afh,0eah,057h,005h,05fh,055h,0aah,00ah,0afh,0eah	; 8940  W._U....W._U....
	defb 057h,0ffh,0ffh,0d5h,0abh,000h,000h,0eah,056h,000h,000h,055h,0abh,000h,000h,0aah	; 8950  W.......V..U....
	defb 000h,000h,000h,001h,000h,000h,000h,003h,015h,055h,055h,057h,02ah,0abh,02ah,0abh	; 8960  .........UUW*.*.
	defb 015h,055h,055h,057h,02ah,0abh,02ah,0abh,015h,055h,055h,057h,02ah,0abh,02ah,0abh	; 8970  .UUW*.*..UUW*.*.
	defb 015h,055h,055h,057h,02ah,0abh,02ah,0abh,015h,055h,055h,057h,02ah,0abh,02ah,0abh	; 8980  .UUW*.*..UUW*.*.
	defb 015h,055h,055h,057h,02ah,0abh,02ah,0abh,015h,055h,055h,057h,03fh,0ffh,0ffh,0ffh	; 8990  .UUW*.*..UUW?...
	defb 000h,001h,000h,003h,02ah,0abh,02ah,0abh,015h,055h,055h,057h,02ah,0abh,02ah,0abh	; 89a0  ....*.*..UUW*.*.
	defb 015h,055h,055h,057h,02ah,0abh,02ah,0abh,015h,055h,055h,057h,02ah,0abh,02ah,0abh	; 89b0  .UUW*.*..UUW*.*.
	defb 015h,055h,055h,057h,02ah,0abh,02ah,0abh,015h,055h,055h,057h,02ah,0abh,02ah,0abh	; 89c0  .UUW*.*..UUW*.*.
	defb 015h,055h,055h,057h,02ah,0abh,02ah,0abh,07fh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; 89d0  .UUW*.*.........
	defb 000h,005h,040h,001h,000h,006h,080h,003h,015h,055h,055h,057h,02ah,0aeh,08ah,0abh	; 89e0  ..@......UUW*...
	defb 015h,055h,055h,057h,02ah,0afh,0cah,0abh,015h,054h,015h,057h,02ah,0ach,00ah,0abh	; 89f0  .UUW*....T.W*...
	defb 015h,057h,0d5h,057h,02ah,0aeh,08ah,0abh,015h,055h,055h,057h,02ah,0afh,0cah,0abh	; 8a00  .W.W*....UUW*...
	defb 015h,054h,015h,057h,0ffh,0fch,03fh,0ffh,054h,0d0h,00dh,0f5h,0ach,0b1h,08bh,0eah	; 8a10  .T.W..?.T.......
	defb 054h,0d1h,08dh,0f5h,0ach,0b0h,00bh,0eah,000h,004h,000h,000h,02ah,0ach,00ah,0abh	; 8a20  T...........*...
	defb 015h,057h,0d5h,057h,02ah,0aeh,08ah,0abh,015h,055h,055h,057h,02ah,0afh,0cah,0abh	; 8a30  .W.W*....UUW*...
	defb 015h,057h,0d5h,057h,02ah,0afh,0cah,0abh,015h,057h,0d5h,057h,02ah,0aeh,08ah,0abh	; 8a40  .W.W*....W.W*...
	defb 015h,055h,055h,057h,02ah,0aeh,08ah,0abh,07fh,0fdh,05fh,0ffh,0ffh,0feh,09fh,0ffh	; 8a50  .UUW*....._.....
	defb 000h,035h,050h,001h,000h,02ah,0a8h,003h,015h,075h,051h,057h,02ah,0aah,0aah,0abh	; 8a60  .5P..*...uQW*...
	defb 015h,075h,051h,057h,02ah,0afh,0fah,0abh,015h,070h,009h,057h,02ah,0a0h,002h,0abh	; 8a70  .uQW*....p.W*...
	defb 015h,067h,0e1h,057h,02ah,0bah,0bah,0abh,0ffh,0f5h,057h,0ffh,0aah,06bh,0ebh,0eah	; 8a80  .g.W*.....W..k..
	defb 054h,054h,037h,0f5h,0ach,0a8h,01bh,0eah,054h,0d0h,00dh,0f5h,0ach,0b1h,08bh,0eah	; 8a90  TT7.....T.......
	defb 054h,0d1h,08dh,0f5h,0ach,0b0h,00bh,0eah,054h,0d8h,015h,0f5h,0ach,06ch,02bh,0eah	; 8aa0  T.......T....l+.
	defb 056h,057h,0d7h,0d5h,000h,02ah,0a8h,000h,015h,07dh,059h,057h,02ah,0bfh,0fah,0abh	; 8ab0  VW...*...}YW*...
	defb 015h,07fh,0f9h,057h,02ah,0bfh,0fah,0abh,015h,07fh,0f1h,057h,02ah,0aah,0aah,0abh	; 8ac0  ...W*......W*...
	defb 015h,075h,051h,057h,02ah,0aah,0aah,0abh,07fh,0f5h,053h,0ffh,0ffh,0eah,0abh,0ffh	; 8ad0  .uQW*.....S.....
	defb 000h,0d5h,054h,001h,000h,0aah,0aah,003h,015h,0d5h,054h,057h,02ah,0aah,0aah,0abh	; 8ae0  ..T.......TW*...
	defb 015h,0d5h,054h,057h,02ah,0afh,0fah,0abh,015h,0f0h,00ch,057h,02ah,0c0h,002h,0abh	; 8af0  ..TW*......W*...
	defb 0ffh,087h,0e5h,0ffh,0abh,01ah,0bah,0aah,056h,035h,057h,0d5h,0aah,06bh,0eah,0eah	; 8b00  ........V5W..k..
	defb 054h,054h,037h,0f5h,0ach,0a8h,01bh,0eah,054h,0d0h,00dh,0f5h,0ach,0b1h,08bh,0eah	; 8b10  TT7.....T.......
	defb 054h,0d1h,08dh,0f5h,0ach,0b0h,00bh,0eah,054h,0d8h,015h,0f5h,0adh,06ch,02bh,0eah	; 8b20  T.......T....l+.
	defb 056h,057h,0d7h,0d5h,0aah,0aah,0afh,0eah,055h,07dh,05fh,0d5h,000h,0dfh,0feh,000h	; 8b30  VW......U}_.....
	defb 015h,0ffh,0feh,057h,02ah,0bfh,0feh,0abh,015h,0dfh,0f4h,057h,02ah,0aah,0aah,0abh	; 8b40  ...W*......W*...
	defb 015h,0d5h,054h,057h,02ah,0aah,0aah,0abh,07fh,0d5h,054h,07fh,0ffh,0aah,0aah,0ffh	; 8b50  ..TW*.....T.....
	defb 001h,055h,055h,001h,003h,0aah,0aah,003h,017h,055h,055h,017h,02bh,0aah,0aah,02bh	; 8b60  .UU......UU.+..+
	defb 017h,055h,055h,017h,02bh,0afh,0fah,02bh,07fh,070h,00dh,07fh,0ffh,0c0h,002h,0ffh	; 8b70  .UU.+..+.p......
	defb 055h,087h,0e5h,055h,0abh,01ah,0bah,0aah,056h,035h,057h,0d5h,0aah,06bh,0eah,0eah	; 8b80  U..U....V5W..k..
	defb 054h,054h,037h,0f5h,0ach,0a8h,01bh,0eah,054h,0d0h,00dh,0f5h,0ach,0b1h,08bh,0eah	; 8b90  TT7.....T.......
	defb 054h,0d1h,08dh,0f5h,0ach,0b0h,00bh,0eah,054h,0d8h,015h,0f5h,0adh,06ch,02bh,0eah	; 8ba0  T.......T....l+.
	defb 056h,057h,0d7h,0d5h,0aah,0aah,0afh,0eah,055h,07dh,05fh,0d5h,0aah,0dfh,0ffh,0aah	; 8bb0  VW......U}_.....
	defb 001h,07fh,0ffh,001h,003h,0bfh,0feh,003h,017h,05fh,0f5h,017h,02bh,0aah,0aah,02bh	; 8bc0  ........._..+..+
	defb 017h,055h,055h,017h,02bh,0aah,0aah,02bh,07fh,055h,055h,07fh,0ffh,0aah,0aah,0ffh	; 8bd0  .UU.+..+.UU.....
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 8be0  UUUU....UUUU....
	defb 050h,000h,000h,015h,0a0h,000h,000h,03ah,050h,000h,000h,075h,0a0h,0aah,0aah,0fah	; 8bf0  P......:P..u....
	defb 051h,055h,055h,075h,0a0h,0aah,0aah,0fah,051h,055h,055h,075h,0a0h,0aah,0aah,0fah	; 8c00  QUUu....QUUu....
	defb 051h,055h,055h,075h,0a0h,0aah,0aah,0fah,051h,055h,055h,075h,0a0h,0aah,0aah,0fah	; 8c10  QUUu....QUUu....
	defb 051h,055h,055h,075h,0a0h,0aah,0aah,0fah,051h,055h,055h,075h,0a0h,0aah,0aah,0fah	; 8c20  QUUu....QUUu....
	defb 051h,055h,055h,075h,0a0h,0aah,0aah,0fah,051h,055h,055h,075h,0a0h,0aah,0aah,0fah	; 8c30  QUUu....QUUu....
	defb 051h,055h,055h,075h,0a3h,0ffh,0ffh,0fah,057h,0ffh,0ffh,0f5h,0afh,0ffh,0ffh,0fah	; 8c40  QUUu....W.......
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 8c50  UUUU....UUUU....
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 8c60  UUUU....UUUU....
	defb 050h,000h,000h,015h,0a0h,000h,000h,03ah,050h,000h,000h,075h,0a0h,0aah,0aah,0fah	; 8c70  P......:P..u....
	defb 051h,055h,055h,075h,0a0h,0aah,0aah,0fah,051h,055h,055h,075h,0a0h,0aah,0aah,0fah	; 8c80  QUUu....QUUu....
	defb 051h,055h,055h,075h,0a0h,0aah,0aah,0fah,051h,054h,055h,075h,0a0h,0a9h,0aah,0fah	; 8c90  QUUu....QTUu....
	defb 051h,055h,095h,075h,0a0h,0aah,02ah,0fah,051h,055h,055h,075h,0a0h,0aah,0aah,0fah	; 8ca0  QU.u..*.QUUu....
	defb 051h,055h,055h,075h,0a0h,0aah,0aah,0fah,051h,055h,055h,075h,0a0h,0aah,0aah,0fah	; 8cb0  QUUu....QUUu....
	defb 051h,055h,055h,075h,0a3h,0ffh,0ffh,0fah,057h,0ffh,0ffh,0f5h,0afh,0ffh,0ffh,0fah	; 8cc0  QUUu....W.......
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 8cd0  UUUU....UUUU....
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 8ce0  UUUU....UUUU....
	defb 050h,000h,000h,015h,0a0h,000h,000h,03ah,050h,000h,000h,075h,0a0h,0aah,0aah,0fah	; 8cf0  P......:P..u....
	defb 051h,055h,055h,075h,0a0h,0aah,0aah,0fah,051h,055h,055h,075h,0a0h,0aah,02ah,0fah	; 8d00  QUUu....QUUu..*.
	defb 051h,054h,015h,075h,0a0h,0a8h,00ah,0fah,051h,050h,005h,075h,0a0h,0afh,0f2h,0fah	; 8d10  QT.u....QP.u....
	defb 051h,04fh,0f5h,075h,0a0h,0a0h,00ah,0fah,051h,050h,015h,075h,0a0h,0a8h,02ah,0fah	; 8d20  QO.u....QP.u..*.
	defb 051h,054h,055h,075h,0a0h,0aah,0aah,0fah,051h,055h,055h,075h,0a0h,0aah,0aah,0fah	; 8d30  QTUu....QUUu....
	defb 051h,055h,055h,075h,0a3h,0ffh,0ffh,0fah,057h,0ffh,0ffh,0f5h,0afh,0ffh,0ffh,0fah	; 8d40  QUUu....W.......
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 8d50  UUUU....UUUU....
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 8d60  UUUU....UUUU....
	defb 050h,000h,000h,015h,0a0h,000h,000h,03ah,050h,000h,000h,075h,0a0h,0aah,055h,07ah	; 8d70  P......:P..u..Uz
	defb 051h,054h,02ah,0f5h,0a0h,0a8h,015h,07ah,051h,050h,00ah,0f5h,0a0h,0a0h,005h,07ah	; 8d80  QT*....zQP.....z
	defb 051h,040h,002h,0f5h,0a0h,080h,001h,07ah,051h,000h,000h,0f5h,0a0h,0ffh,0ffh,07ah	; 8d90  Q@.....zQ......z
	defb 050h,0ffh,0ffh,075h,0a1h,000h,000h,0fah,050h,080h,001h,075h,0a1h,040h,002h,0fah	; 8da0  P..u....P..u.@..
	defb 050h,0a0h,005h,075h,0a1h,050h,00ah,0fah,050h,0a8h,015h,075h,0a1h,054h,02ah,0fah	; 8db0  P..u.P..P..u.T*.
	defb 050h,0aah,055h,075h,0a3h,0ffh,0ffh,0fah,057h,0ffh,0ffh,0f5h,0afh,0ffh,0ffh,0fah	; 8dc0  P.Uu....W.......
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 8dd0  UUUU....UUUU....
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 8de0  UUUU....UUUU....
	defb 050h,000h,000h,015h,0a0h,000h,000h,03ah,050h,000h,000h,075h,0a0h,0aah,055h,07ah	; 8df0  P......:P..u..Uz
	defb 051h,054h,02ah,0f5h,0a0h,0a8h,015h,07ah,051h,050h,00ah,0f5h,0a0h,0a0h,005h,07ah	; 8e00  QT*....zQP.....z
	defb 051h,040h,002h,0f5h,0a0h,080h,009h,07ah,051h,000h,010h,0f5h,0a0h,0ffh,0d2h,07ah	; 8e10  Q@.....zQ......z
	defb 050h,0ffh,0d5h,075h,0a1h,000h,012h,0fah,050h,080h,009h,075h,0a1h,040h,002h,0fah	; 8e20  P..u....P..u.@..
	defb 050h,0a0h,005h,075h,0a1h,050h,00ah,0fah,050h,0a8h,015h,075h,0a1h,054h,02ah,0fah	; 8e30  P..u.P..P..u.T*.
	defb 050h,0aah,055h,075h,0a3h,0ffh,0ffh,0fah,057h,0ffh,0ffh,0f5h,0afh,0ffh,0ffh,0fah	; 8e40  P.Uu....W.......
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 8e50  UUUU....UUUU....
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 8e60  UUUU....UUUU....
	defb 050h,000h,000h,015h,0a0h,000h,000h,03ah,050h,000h,000h,075h,0a0h,0aah,055h,07ah	; 8e70  P......:P..u..Uz
	defb 051h,054h,02ah,0f5h,0a0h,0a8h,015h,07ah,051h,050h,01ah,0f5h,0a0h,0a0h,005h,07ah	; 8e80  QT*....zQP.....z
	defb 051h,040h,03ah,0f5h,0a0h,080h,041h,07ah,051h,000h,08ah,0f5h,0a0h,0feh,095h,07ah	; 8e90  Q@:...AzQ......z
	defb 050h,0feh,0afh,075h,0a1h,000h,09ch,0fah,050h,080h,069h,075h,0a1h,040h,03ah,0fah	; 8ea0  P..u....P.iu.@:.
	defb 050h,0a0h,005h,075h,0a1h,050h,01ah,0fah,050h,0a8h,015h,075h,0a1h,054h,02ah,0fah	; 8eb0  P..u.P..P..u.T*.
	defb 050h,0aah,055h,075h,0a3h,0ffh,0ffh,0fah,057h,0ffh,0ffh,0f5h,0afh,0ffh,0ffh,0fah	; 8ec0  P.Uu....W.......
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 8ed0  UUUU....UUUU....
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 8ee0  UUUU....UUUU....
	defb 050h,000h,000h,015h,0a0h,000h,000h,03ah,050h,000h,000h,075h,0a0h,0aah,055h,07ah	; 8ef0  P......:P..u..Uz
	defb 051h,055h,0aah,0f5h,0a0h,0a9h,095h,07ah,051h,051h,08ah,0f5h,0a0h,0a0h,005h,07ah	; 8f00  QU.....zQQ.....z
	defb 051h,043h,0c2h,0f5h,0a0h,084h,021h,07ah,051h,008h,0b0h,0f5h,0a0h,0e9h,057h,07ah	; 8f10  QC....!zQ.....Wz
	defb 050h,0eah,0f7h,075h,0a1h,009h,0d0h,0fah,050h,086h,0a1h,075h,0a1h,043h,0c2h,0fah	; 8f20  P..u....P..u.C..
	defb 050h,0a0h,005h,075h,0a1h,051h,08ah,0fah,050h,0a9h,095h,075h,0a1h,055h,0aah,0fah	; 8f30  P..u.Q..P..u.U..
	defb 050h,0aah,055h,075h,0a3h,0ffh,0ffh,0fah,057h,0ffh,0ffh,0f5h,0afh,0ffh,0ffh,0fah	; 8f40  P.Uu....W.......
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 8f50  UUUU....UUUU....
	defb 000h,001h,000h,000h,07fh,0fch,0bfh,0feh,040h,004h,020h,006h,043h,072h,04eh,0ceh	; 8f60  ........@. .CrN.
	defb 040h,002h,040h,01eh,057h,0ffh,0ffh,0fah,054h,000h,000h,05ah,044h,000h,000h,0deh	; 8f70  @.@.W...T..ZD...
	defb 044h,0ffh,0fdh,0deh,054h,0aah,0a9h,0dah,054h,0d5h,055h,0dah,054h,0a0h,039h,0dah	; 8f80  D...T...T.U.T.9.
	defb 044h,0c0h,075h,0deh,064h,0a7h,0b9h,0deh,01ch,0c5h,035h,0d8h,084h,0a6h,0b9h,0c2h	; 8f90  D.u.d.....5.....
	defb 044h,0c5h,035h,0c1h,01ch,0a0h,039h,0d8h,064h,0c7h,0f5h,0deh,044h,0afh,0f9h,0deh	; 8fa0  D.5...9.d...D...
	defb 054h,0d5h,055h,0dah,054h,0aah,0a9h,0dah,044h,000h,001h,0deh,054h,0ffh,0ffh,0dah	; 8fb0  T.U.T...D...T...
	defb 055h,0ffh,0ffh,0dah,057h,0ffh,0ffh,0dah,044h,000h,000h,01eh,04fh,0feh,07fh,0feh	; 8fc0  U...W...D...O...
	defb 05fh,0feh,07fh,0feh,072h,04ch,032h,04eh,07fh,0fdh,03fh,0feh,000h,000h,080h,000h	; 8fd0  _...rL2N..?.....
	defb 000h,001h,000h,000h,07fh,0fch,0bfh,0feh,040h,004h,020h,006h,043h,072h,04eh,0ceh	; 8fe0  ........@. .CrN.
	defb 040h,002h,040h,01eh,057h,0ffh,0ffh,0feh,054h,000h,000h,05eh,044h,000h,000h,0deh	; 8ff0  @.@.W...T..^D...
	defb 044h,0ffh,0fdh,0deh,044h,0aah,0a9h,0dah,044h,0d5h,055h,0dah,044h,0bfh,0e9h,0dah	; 9000  D...D...D.U.D...
	defb 044h,0dfh,0c5h,0deh,064h,0b8h,049h,0deh,01ch,0d9h,045h,0d8h,084h,0bah,0c9h,0c2h	; 9010  D...d.I...E.....
	defb 044h,0d9h,045h,0c1h,01ch,0bbh,0c9h,0d8h,064h,0d8h,005h,0deh,044h,0b0h,009h,0deh	; 9020  D.E.....d...D...
	defb 054h,0d5h,055h,0dah,054h,0aah,0a9h,0dah,044h,000h,001h,0deh,054h,0ffh,0ffh,0dah	; 9030  T.U.T...D...T...
	defb 055h,0ffh,0ffh,0dah,057h,0ffh,0ffh,0dah,044h,000h,000h,01eh,04fh,0feh,07fh,0feh	; 9040  U...W...D...O...
	defb 05fh,0feh,07fh,0feh,072h,04ch,033h,0ceh,07fh,0fdh,03fh,0feh,000h,000h,080h,000h	; 9050  _...rL3...?.....
	defb 055h,05fh,0f5h,055h,080h,0bfh,0e2h,002h,001h,0ddh,044h,007h,08bh,0bah,0a2h,02eh	; 9060  U_.U......D.....
	defb 015h,0ddh,044h,057h,0bfh,0bah,0a2h,0feh,07fh,0ddh,045h,0ffh,0aah,0bah,0a2h,0aah	; 9070  ..DW......E.....
	defb 0ffh,0fdh,047h,0ffh,0ffh,0fah,0afh,0feh,0ffh,0ffh,0ffh,0fch,0eah,0aah,0aah,0a8h	; 9080  ..G.............
	defb 0f0h,000h,000h,000h,0e3h,0ffh,0ffh,0c8h,0f2h,000h,000h,040h,0e2h,0eeh,077h,048h	; 9090  ...........@..wH
	defb 0f2h,0eeh,077h,040h,0e2h,000h,000h,048h,0f3h,0ffh,0ffh,0c0h,0e0h,000h,000h,008h	; 90a0  ..w@...H........
	defb 0f5h,055h,055h,050h,0e0h,000h,000h,000h,0c0h,005h,040h,000h,080h,00ah,0a0h,000h	; 90b0  .UUP......@.....
	defb 055h,05dh,045h,055h,080h,0bah,0a2h,002h,001h,0ddh,044h,007h,08bh,0bah,0a2h,02eh	; 90c0  U]EU......D.....
	defb 015h,0ddh,044h,057h,0bfh,0bah,0a2h,0feh,07fh,0d0h,005h,0ffh,0aah,0a0h,002h,0aah	; 90d0  ..DW............
	defb 055h,055h,055h,055h,0abh,0ffh,0ffh,0eah,054h,000h,000h,015h,0a9h,0ffh,0ffh,0cah	; 90e0  UUUU....T.......
	defb 053h,0ffh,0ffh,025h,0a6h,0aah,0aah,092h,067h,07fh,0ffh,04fh,0a6h,0c0h,001h,08eh	; 90f0  S..%....g..O....
	defb 067h,055h,055h,04fh,0a6h,0cfh,0f9h,08eh,067h,050h,005h,04fh,0a6h,0cfh,0f9h,08eh	; 9100  gUUO....gP.O....
	defb 067h,055h,055h,04fh,0a6h,0c0h,001h,08eh,053h,07fh,0ffh,05dh,0aah,0aah,0aah,09ah	; 9110  gUUO....S..]....
	defb 05fh,000h,000h,03dh,0afh,080h,000h,0fah,057h,0ffh,0ffh,0f5h,0abh,0feh,0ffh,0eah	; 9120  _..=....W.......
	defb 055h,0fdh,07fh,0d5h,0b2h,0a8h,0fah,0b2h,055h,05dh,075h,055h,0b3h,028h,0fbh,032h	; 9130  U.......U]uU.(.2
	defb 055h,05dh,075h,055h,0b3h,028h,0fbh,032h,055h,05dh,075h,055h,0aah,0bfh,0fah,0aah	; 9140  U]uU.(.2U]uU....
	defb 057h,0e2h,0bfh,0f5h,0bch,005h,057h,0feh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h	; 9150  W.....W.........
	defb 055h,040h,005h,055h,0aah,08fh,0f0h,0aah,054h,030h,00ch,055h,0a8h,0c0h,003h,02ah	; 9160  U@.U....T0.U...*
	defb 051h,000h,000h,095h,0a2h,002h,0a4h,0cah,044h,015h,051h,065h,088h,02fh,0eah,0b2h	; 9170  Q.......D.Qe./..
	defb 050h,05ch,0b5h,0d9h,090h,0b1h,02eh,0f8h,021h,062h,047h,07dh,022h,0c4h,08bh,0bch	; 9180  P\......!bG}"...
	defb 041h,089h,013h,07eh,042h,092h,025h,0beh,045h,0a4h,049h,0deh,043h,048h,091h,0beh	; 9190  A..~B.%.E.I.CH..
	defb 045h,091h,022h,0deh,043h,022h,044h,0beh,045h,0c4h,089h,0deh,042h,089h,013h,0beh	; 91a0  E.".C"D.E...B...
	defb 021h,092h,025h,07ch,0a4h,0e4h,04bh,0bch,011h,068h,09fh,079h,092h,0b9h,03ah,0fah	; 91b0  !.%|..K..h.y..:.
	defb 049h,05fh,0f5h,0f1h,0a6h,0eah,0abh,0e2h,053h,0b5h,05fh,0c5h,0a9h,0ffh,0ffh,08ah	; 91c0  I_......S._.....
	defb 054h,0ffh,0ffh,015h,0aah,03fh,0fch,02ah,055h,00fh,0f1h,055h,0aah,0a0h,002h,0aah	; 91d0  T....?.*U..U....
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,055h,0ffh,0ffh,0ffh,0abh,0ffh,0ffh,0ffh	; 91e0  UUUU....U.......
	defb 057h,055h,055h,055h,0aeh,0aah,0aah,0aah,05dh,055h,055h,055h,0bah,0a8h,000h,02ah	; 91f0  WUUU....]UUU...*
	defb 075h,050h,000h,075h,0bah,0a2h,0aah,0bah,075h,045h,055h,05dh,0bah,08ah,0feh,0aeh	; 9200  uP.u....uEU]....
	defb 075h,017h,0d7h,0d7h,0bah,02eh,0aah,0ebh,074h,05dh,055h,075h,0b8h,0bah,0aah,0bah	; 9210  u.......t]Uu....
	defb 071h,075h,055h,0edh,0b8h,0eah,0aah,0beh,071h,055h,07fh,0f5h,0b8h,0eah,0c6h,0beh	; 9220  quU.....qU......
	defb 071h,0d5h,0bbh,0ffh,0b8h,0abh,07dh,0feh,071h,0d5h,07dh,0ffh,0b8h,0abh,07dh,0feh	; 9230  q.....}.q.}...}.
	defb 071h,0d7h,0bbh,0ffh,0b8h,0eah,0c7h,0feh,071h,057h,0bfh,0fdh,0b8h,0fah,0ffh,0feh	; 9240  q.......qW......
	defb 071h,077h,0ffh,0fdh,0b8h,0bbh,0ffh,0fah,074h,05eh,0ffh,0f5h,0bah,02fh,0ffh,0ebh	; 9250  qw......t^.../..
	defb 055h,055h,055h,055h,0aah,0aah,0aah,0aah,0ffh,0ffh,0ffh,055h,0ffh,0ffh,0feh,02ah	; 9260  UUUU.......U...*
	defb 055h,055h,055h,015h,0aah,0aah,0aah,08ah,055h,055h,055h,045h,0a8h,0aah,0aah,0e2h	; 9270  UUU.....UUUE....
	defb 057h,000h,000h,011h,0aah,030h,00ch,0a2h,055h,034h,02ch,051h,0aah,034h,02ch,0a2h	; 9280  W....0..U4,Q.4,.
	defb 055h,034h,02ch,051h,0a8h,034h,02ch,0e2h,0d7h,034h,02ch,011h,0eah,004h,020h,0a2h	; 9290  U4,Q.4,..4,... .
	defb 075h,004h,020h,051h,0eah,004h,020h,0a2h,075h,034h,02ch,051h,0e8h,034h,02ch,0e2h	; 92a0  u. Q.. .u4,Q.4,.
	defb 077h,034h,02ch,011h,0eah,034h,02ch,0a2h,075h,034h,02ch,051h,0eah,034h,02ch,0a2h	; 92b0  w4,..4,.u4,Q.4,.
	defb 075h,034h,02ch,051h,0e8h,004h,020h,0e2h,077h,004h,020h,011h,0eah,004h,020h,0a2h	; 92c0  u4,Q.. .w. ... .
	defb 075h,034h,02ch,051h,0eah,034h,02ch,0a2h,0d5h,034h,02ch,051h,0a8h,034h,02ch,0e2h	; 92d0  u4,Q.4,..4,Q.4,.
	defb 055h,055h,000h,000h,0a0h,02ah,01fh,0ffh,040h,074h,07fh,0ffh,08ah,0e8h,0ffh,0ffh	; 92e0  UU...*..@t......
	defb 017h,0d1h,0c8h,000h,08fh,0a3h,098h,011h,01fh,047h,004h,011h,08eh,08eh,00ch,01fh	; 92f0  .........G......
	defb 01dh,01ch,002h,00ch,09ah,038h,036h,07fh,014h,070h,031h,07fh,0a8h,0e0h,033h,000h	; 9300  .....86..p1...3.
	defb 051h,0c7h,0e0h,080h,0a3h,087h,0d1h,080h,047h,006h,020h,040h,08eh,006h,010h,0c0h	; 9310  Q.......G. @....
	defb 01ch,01eh,020h,020h,038h,016h,010h,060h,030h,016h,0b0h,010h,074h,017h,070h,030h	; 9320  ..  8..`0...t.p0
	defb 07dh,010h,030h,015h,073h,040h,030h,03fh,070h,0d0h,030h,060h,070h,034h,030h,041h	; 9330  }.0.s@0?p.0`p40A
	defb 070h,00dh,011h,080h,070h,003h,041h,03dh,076h,010h,0d6h,07ch,072h,010h,03ch,085h	; 9340  p...p.A=v..|r.<.
	defb 072h,07fh,08ch,084h,072h,040h,024h,081h,072h,040h,02ch,002h,072h,046h,025h,055h	; 9350  r...r@$.r@,.rF%U
	defb 000h,000h,055h,055h,0ffh,0fch,020h,00ah,0ffh,0ffh,010h,01dh,0ffh,0ffh,088h,0aeh	; 9360  ..UU.. .........
	defb 000h,01fh,0c4h,017h,000h,009h,0e2h,00eh,000h,030h,0f1h,007h,000h,010h,078h,08eh	; 9370  .........0....x.
	defb 000h,060h,03ch,047h,0f0h,020h,01eh,026h,0feh,0cfh,08fh,017h,030h,040h,087h,08ah	; 9380  .`<G. .&....0@..
	defb 03dh,09eh,083h,0c5h,038h,0beh,081h,0e2h,033h,006h,080h,0f1h,031h,03eh,0feh,078h	; 9390  =...8...3...1>.x
	defb 036h,03eh,001h,03ch,022h,037h,0fdh,09ch,02ch,037h,0fdh,00eh,004h,030h,00ch,02eh	; 93a0  6>.<"7..,7...0..
	defb 05ch,030h,008h,0beh,0fch,030h,002h,0ceh,082h,030h,00bh,00eh,0b3h,030h,02ch,00eh	; 93b0  \0...0...0...0,.
	defb 0b0h,090h,0b1h,00eh,0b0h,0c2h,0c5h,00eh,0b0h,02bh,00dh,00eh,081h,03ch,00dh,00eh	; 93c0  .........+...<..
	defb 003h,091h,00dh,00eh,046h,031h,08dh,00eh,0a0h,010h,0cdh,00eh,0eah,0b0h,0cdh,00eh	; 93d0  ....F1..........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0f8h,00fh,000h,0f0h,0fch,007h,080h,070h	; 93e0  ...............p
	defb 0dfh,0ffh,0ffh,0ffh,0c8h,000h,000h,000h,0cbh,0ffh,0ffh,0ffh,0cbh,03ch,03ch,03ch	; 93f0  .............<<<
	defb 0cah,0ffh,0ffh,0ffh,0cah,080h,000h,000h,0eah,0bfh,0ffh,0ffh,0fbh,0a6h,066h,066h	; 9400  ..............ff
	defb 0fbh,0b9h,099h,099h,0cbh,0a6h,066h,066h,0cah,0b9h,099h,099h,0cah,0a6h,000h,060h	; 9410  ......ff.......`
	defb 0cah,0b9h,081h,098h,0cah,0a6h,000h,060h,0cbh,0b9h,099h,099h,0fbh,0a6h,066h,066h	; 9420  .......`......ff
	defb 0fbh,0b9h,099h,099h,0eah,0a0h,000h,000h,0cah,080h,000h,000h,0cah,0ffh,0ffh,0ffh	; 9430  ................
	defb 0cbh,03ch,03ch,03ch,0cbh,0ffh,0ffh,0ffh,0c8h,000h,000h,000h,0d8h,000h,000h,000h	; 9440  .<<<............
	defb 0f3h,0fch,07fh,08fh,0e7h,0f8h,0ffh,00fh,0c0h,000h,000h,000h,080h,000h,000h,000h	; 9450  ................
	defb 0ffh,0ffh,0ffh,0feh,0ffh,0ffh,0ffh,0fch,00fh,000h,0f0h,018h,00eh,001h,0e0h,030h	; 9460  ...............0
	defb 0ffh,0ffh,0ffh,0e4h,000h,000h,000h,00ch,0ffh,0ffh,0ffh,0cch,03ch,03ch,03ch,0cch	; 9470  ............<<<.
	defb 0ffh,0ffh,0ffh,04ch,000h,000h,001h,04ch,0ffh,0ffh,0fdh,048h,066h,066h,061h,0c0h	; 9480  ...L...L...Hffa.
	defb 099h,099h,099h,0c0h,066h,066h,061h,0cch,099h,099h,099h,04ch,006h,000h,061h,04ch	; 9490  ....ffa....L..aL
	defb 019h,081h,099h,04ch,006h,000h,061h,04ch,099h,099h,099h,0cch,066h,066h,061h,0c0h	; 94a0  ...L..aL....ffa.
	defb 099h,099h,099h,0c0h,000h,000h,001h,048h,000h,000h,001h,04ch,0ffh,0ffh,0ffh,04ch	; 94b0  .......H...L...L
	defb 03ch,03ch,03ch,0cch,0ffh,0ffh,0ffh,0cch,000h,000h,000h,00ch,000h,000h,000h,004h	; 94c0  <<<.............
	defb 0f1h,0feh,03fh,0c0h,0f0h,0ffh,01fh,0e0h,000h,000h,000h,000h,000h,000h,000h,000h	; 94d0  ..?.............
	defb 055h,055h,055h,055h,0b2h,0cbh,02ch,0a0h,055h,055h,055h,040h,0a0h,000h,0aah,08ah	; 94e0  UUUU..,.UUU@....
	defb 040h,001h,055h,015h,0e2h,0abh,0aah,02fh,005h,055h,0d4h,05fh,0a3h,0fah,0e8h,0bah	; 94f0  @.U..../.U._....
	defb 045h,0f1h,071h,074h,0a3h,0a8h,0b2h,0e9h,045h,0d4h,055h,0d3h,0e3h,0aah,02bh,0a7h	; 9500  E.qt....E.U...+.
	defb 005h,0d5h,017h,04fh,0a3h,0aah,02eh,09fh,045h,0d4h,05dh,03fh,0a2h,0e8h,0bah,07fh	; 9510  ...O....E.]?....
	defb 051h,071h,074h,0ffh,0e8h,0b2h,0e9h,0fbh,014h,055h,0d3h,0f3h,0aah,02bh,0a9h,0e3h	; 9520  Qqt......U...+..
	defb 055h,017h,054h,0c7h,0aah,02eh,08ah,06fh,054h,05dh,025h,03eh,0e8h,0bah,072h,09ch	; 9530  U.T....oT]%>..r.
	defb 011h,074h,0f9h,049h,0a2h,0e9h,0fch,0a2h,045h,0d3h,0f6h,054h,08bh,0a7h,0e3h,028h	; 9540  .t.I....E..T...(
	defb 017h,04fh,0c7h,091h,08eh,09fh,08fh,022h,017h,03fh,0feh,045h,08eh,03fh,0fch,08bh	; 9550  .O.....".?.E.?..
	defb 055h,055h,055h,055h,002h,0cbh,02ch,0b2h,005h,055h,055h,055h,0aeh,0aah,080h,00ah	; 9560  UUUU..,..UUU....
	defb 057h,055h,000h,01fh,0fbh,0aah,02ah,0b8h,0f5h,0d4h,055h,05dh,0a2h,0e8h,0bfh,0bah	; 9570  WU....*...U]....
	defb 051h,071h,07fh,05dh,028h,0b2h,0eah,03ah,094h,055h,0d4h,05fh,0cah,02bh,0aah,038h	; 9580  Qq.](..:.U._.+.8
	defb 0e5h,017h,054h,05dh,0f2h,08bh,0aah,03ah,0f9h,045h,0d4h,05dh,0fch,0a2h,0e8h,0bah	; 9590  ..T]...:.E.]....
	defb 0feh,051h,071h,077h,0dfh,028h,0b2h,0e8h,0cfh,094h,055h,0d5h,0c7h,02ah,02bh,0aah	; 95a0  .Qqw.(....U..*+.
	defb 0e2h,055h,017h,055h,0f4h,0a2h,08bh,0aah,0f9h,049h,045h,0d7h,072h,09ch,0a2h,0e8h	; 95b0  .U.U.....IE.r...
	defb 025h,03eh,051h,075h,08ah,07fh,028h,0bah,0d4h,0efh,094h,05dh,0e9h,0c7h,0cah,02eh	; 95c0  %>Qu..(....]....
	defb 073h,0e3h,0e5h,017h,0b9h,0f1h,0f2h,08eh,05ch,0ffh,0f9h,017h,02eh,07fh,0fch,08eh	; 95d0  s.......\.......
	defb 075h,015h,0ffh,057h,0bah,08ah,0aah,0aeh,075h,045h,055h,05dh,0bah,0a3h,0ffh,0fah	; 95e0  u..W....uEU]....
	defb 075h,057h,0ffh,0f5h,0bah,0aah,0aah,0aah,075h,055h,055h,055h,0bah,0aah,0aah,0aah	; 95f0  uW......uUUU....
	defb 075h,057h,0ffh,0ffh,0bah,0a8h,000h,003h,075h,050h,000h,00fh,0bah,0a7h,039h,0dfh	; 9600  uW......uP....9.
	defb 075h,040h,000h,01fh,0bah,0ffh,0ffh,0ffh,075h,0aah,0aah,0beh,0bah,0d5h,055h,07ch	; 9610  u@......u.....U|
	defb 075h,080h,000h,03ch,0bah,0d5h,055h,07ch,075h,0aah,0aah,0bch,0bah,0ffh,0ffh,0fch	; 9620  u..<..U|u.......
	defb 075h,07fh,0ffh,0deh,0bah,0b1h,08ch,06fh,075h,05fh,0ffh,0f3h,0bah,0afh,0ffh,0ffh	; 9630  u......ou_......
	defb 075h,055h,055h,055h,0bah,0aah,0aah,0aah,05dh,055h,055h,055h,0aeh,0aah,0aah,0aah	; 9640  uUUU....]UUU....
	defb 057h,000h,000h,000h,0aah,000h,000h,000h,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 9650  W.......UUUU....
	defb 057h,034h,02ch,011h,0aah,034h,02ch,0a2h,055h,034h,02ch,051h,0aah,004h,020h,0a2h	; 9660  W4,..4,.U4,Q.. .
	defb 055h,004h,020h,051h,0a8h,004h,020h,0e2h,057h,034h,02ch,011h,0aah,034h,02ch,0a2h	; 9670  U. Q.. .W4,..4,.
	defb 055h,034h,02ch,051h,0aah,034h,02ch,0a2h,055h,034h,02ch,051h,0a8h,034h,02ch,0e2h	; 9680  U4,Q.4,.U4,Q.4,.
	defb 057h,034h,02ch,011h,0aah,004h,020h,0a2h,055h,004h,020h,051h,000h,004h,020h,0a2h	; 9690  W4,... .U. Q.. .
	defb 000h,034h,02ch,051h,0e7h,034h,02ch,0e2h,000h,034h,02ch,011h,000h,034h,02ch,0a2h	; 96a0  .4,Q.4,..4,..4,.
	defb 055h,034h,02ch,051h,0aah,034h,02ch,0a2h,055h,030h,00ch,051h,0a8h,000h,000h,0e2h	; 96b0  U4,Q.4,.U0.Q....
	defb 057h,055h,055h,011h,0aah,0aah,0aah,0a2h,055h,055h,055h,045h,0aah,0aah,0aah,08ah	; 96c0  WUU.....UUUE....
	defb 000h,000h,000h,015h,000h,000h,000h,02ah,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 96d0  .......*UUUU....
	defb 072h,04fh,02fh,0f3h,072h,04fh,024h,005h,072h,0c6h,02ch,083h,072h,040h,004h,080h	; 96e0  rO/.rO$.r.,.r@..
	defb 076h,046h,02ch,085h,070h,048h,0beh,004h,070h,042h,0c3h,005h,070h,00bh,000h,084h	; 96f0  vF,.pH..pB..p...
	defb 070h,02ch,020h,0c5h,070h,0b0h,020h,020h,072h,0c7h,020h,035h,07bh,00fh,020h,09fh	; 9700  p, .p.  r. 5{. .
	defb 07ch,046h,020h,0b0h,070h,040h,020h,014h,070h,046h,020h,067h,038h,04fh,020h,026h	; 9710  |F .p@ .pF g8O &
	defb 01ch,04fh,020h,0c6h,08eh,046h,020h,044h,047h,000h,021h,082h,0a3h,086h,020h,084h	; 9720  .O ..F DG.!... .
	defb 051h,0cfh,023h,02ah,0a8h,0e7h,021h,004h,014h,072h,026h,02ah,09ah,038h,022h,057h	; 9730  Q.#*..!..r&*.8"W
	defb 01dh,01ch,02ch,027h,08eh,08eh,004h,000h,01fh,047h,018h,000h,08fh,0a3h,088h,000h	; 9740  ..,'.....G......
	defb 015h,0d1h,0ffh,0ffh,08fh,0e8h,0ffh,0ffh,05fh,0f4h,03fh,0ffh,0aah,0aah,080h,000h	; 9750  ........_.?.....
	defb 0efh,0f0h,06dh,00eh,0e0h,030h,060h,00eh,0c0h,010h,07fh,0eeh,018h,030h,060h,00eh	; 9760  ..m..0`......0`.
	defb 08ch,014h,04dh,00eh,08ch,03dh,00dh,00eh,086h,0c3h,045h,00eh,080h,080h,0d1h,00eh	; 9770  ..M..=....E.....
	defb 083h,03eh,034h,00eh,082h,078h,00dh,00eh,0d4h,000h,003h,04eh,0fch,000h,000h,0deh	; 9780  .>4..x.....N....
	defb 004h,000h,00ch,03eh,00ch,000h,00dh,00ch,0e2h,000h,00dh,01ch,066h,000h,01ah,038h	; 9790  ...>........f..8
	defb 071h,07eh,034h,071h,003h,003h,0e8h,0e2h,000h,080h,011h,0c5h,001h,080h,023h,08ah	; 97a0  q~4q..........#.
	defb 000h,043h,0c7h,011h,07eh,0ceh,00eh,022h,060h,020h,01ch,047h,0e0h,060h,038h,08eh	; 97b0  .C..~.."` .G.`8.
	defb 0e0h,010h,071h,007h,000h,030h,0e2h,00eh,000h,009h,0c4h,017h,000h,01bh,088h,02eh	; 97c0  ..q..0..........
	defb 0ffh,0ffh,011h,057h,0ffh,0feh,023h,0feh,0ffh,0f8h,047h,0fdh,000h,000h,0aah,0aah	; 97d0  ...W..#...G.....
	defb 055h,054h,015h,055h,002h,0a0h,00ah,080h,007h,047h,0e5h,001h,02eh,09bh,0dah,08bh	; 97e0  UT.U.....G......
	defb 017h,01bh,0d9h,017h,03eh,023h,0c4h,0bfh,07fh,01dh,0bdh,07fh,0aah,02eh,07dh,0aah	; 97f0  ....>#........}.
	defb 055h,01eh,07dh,055h,0aah,02dh,0bdh,0aah,055h,023h,0c5h,055h,0aah,01bh,0dbh,0aah	; 9800  U.}U.-..U#.U....
	defb 01ch,01bh,0d9h,0c7h,09ah,047h,0e2h,0a6h,01ch,050h,00eh,0c7h,098h,0bfh,0feh,066h	; 9810  .....G...P.....f
	defb 01ch,07fh,0ffh,047h,098h,0bfh,0ffh,066h,054h,050h,00fh,055h,0a8h,029h,0b6h,0aah	; 9820  ...G...fTP.U.)..
	defb 054h,01dh,0b9h,055h,0aah,019h,0bah,0aah,01dh,01dh,0bbh,047h,09ah,099h,0bah,0a6h	; 9830  T..U.......G....
	defb 01dh,010h,00bh,047h,09ah,096h,06ah,0a6h,01dh,016h,063h,047h,09ah,086h,062h,0a6h	; 9840  ...G..j...cG..b.
	defb 055h,01ah,059h,055h,0aah,0bdh,0bch,0aah,055h,02dh,0b4h,055h,0aah,055h,0aah,0aah	; 9850  U.YU....U-.U.U..
	defb 057h,0ffh,0ffh,0ffh,0ach,000h,000h,000h,058h,000h,000h,000h,0b2h,0aah,0aah,0aah	; 9860  W.......X.......
	defb 065h,055h,055h,055h,0cah,000h,000h,000h,094h,000h,000h,003h,088h,0aah,0aah,088h	; 9870  eUUU............
	defb 091h,055h,055h,015h,088h,0afh,0fah,02ah,091h,05fh,0f0h,055h,088h,0bah,0a0h,0a8h	; 9880  .UU....*._.U....
	defb 091h,070h,011h,047h,088h,0e0h,022h,09fh,091h,071h,071h,05eh,088h,0e2h,0e2h,0b9h	; 9890  .p.G.."..qq^....
	defb 091h,071h,071h,03bh,088h,0e3h,0e2h,0b7h,091h,077h,0f1h,037h,088h,0eah,0a2h,0bbh	; 98a0  .qq;.....w.7....
	defb 091h,070h,011h,039h,088h,0efh,0e0h,09eh,091h,075h,043h,0dfh,088h,0eah,0a6h,087h	; 98b0  .p.9.....uC.....
	defb 091h,070h,005h,010h,088h,0efh,0c2h,02ah,091h,075h,045h,057h,088h,0bah,08ah,02fh	; 98c0  .p.....*.uEW.../
	defb 091h,05ch,005h,05fh,088h,0a8h,00ah,02fh,091h,055h,015h,05fh,088h,0feh,08ah,0afh	; 98d0  .\._.../.U._....
	defb 0ffh,0ffh,0ffh,0c5h,000h,000h,000h,022h,000h,000h,000h,071h,0aah,0aah,0aah,0b8h	; 98e0  ......."...q....
	defb 055h,055h,055h,05ch,000h,000h,000h,0aeh,0c0h,000h,001h,0d6h,032h,0aah,0aah,0eeh	; 98f0  UUU\........2...
	defb 079h,057h,0fdh,076h,0beh,0eah,0aah,0eeh,05fh,045h,001h,076h,01fh,0a2h,038h,0eeh	; 9900  yW.v...._E.v..8.
	defb 0e7h,091h,039h,076h,0fbh,0d8h,038h,0eeh,07bh,0d1h,039h,076h,09dh,0d8h,038h,0eeh	; 9910  ..9v..8.{.9v..8.
	defb 0ddh,0d1h,039h,076h,0edh,0d8h,000h,0eeh,0edh,0d1h,001h,076h,0ddh,0d8h,038h,0eeh	; 9920  ..9v.......v..8.
	defb 09ch,0d1h,039h,076h,07bh,018h,038h,0eeh,0fbh,0d1h,039h,076h,0e3h,0eah,038h,0eeh	; 9930  ..9v{.8...9v..8.
	defb 01dh,0edh,039h,076h,0feh,0eah,000h,0eeh,0feh,0f5h,001h,076h,0feh,0f6h,038h,0eeh	; 9940  ..9v.......v..8.
	defb 0feh,0f5h,039h,076h,0feh,0f2h,038h,0eeh,0feh,0fbh,039h,076h,0ffh,07ah,038h,0eeh	; 9950  ..9v..8...9v.z8.
	defb 055h,040h,005h,055h,0a0h,00fh,0f0h,002h,05fh,070h,00eh,07dh,0b8h,080h,007h,03eh	; 9960  U@.U...._p.}...>
	defb 033h,000h,05dh,0ddh,0a4h,002h,0afh,06eh,028h,000h,05fh,0b5h,0a8h,002h,03fh,0d2h	; 9970  3.]....n(._...?.
	defb 010h,005h,057h,0f9h,0a0h,010h,0efh,0ech,020h,005h,05fh,0f5h,020h,00ah,0bfh,0dch	; 9980  ..W..... ._. ...
	defb 040h,015h,057h,0f5h,040h,008h,0efh,0fch,040h,025h,057h,0f5h,040h,00ah,0bbh,0fch	; 9990  @.W.@...@%W.@...
	defb 040h,024h,077h,0f6h,040h,00ah,0afh,0fah,000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh	; 99a0  @$w.@...........
	defb 0d0h,045h,0dfh,0ffh,080h,00ah,0bbh,0fdh,0c0h,051h,07fh,0ffh,080h,00ah,0abh,0fdh	; 99b0  .E.......Q......
	defb 0d0h,015h,0dfh,0ffh,080h,002h,0bbh,0fdh,0d0h,055h,05fh,0ffh,080h,00ah,0ebh,0fdh	; 99c0  .........U_.....
	defb 0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,040h,001h,057h,0feh,040h,02ah,0bfh,0fah	; 99d0  ........@.W.@*..
	defb 055h,055h,055h,055h,000h,000h,000h,000h,000h,000h,000h,000h,0aah,0aah,0aah,0aah	; 99e0  UUUU............
	defb 055h,055h,055h,055h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0aah,0aah,0aah,0aah	; 99f0  UUUU............
	defb 000h,001h,040h,000h,000h,002h,080h,000h,0ffh,0f1h,04fh,0ffh,0ffh,0f2h,08fh,0ffh	; 9a00  ..@.......O.....
	defb 0ffh,0f1h,04fh,0ffh,0ffh,0f2h,08fh,0ffh,0ffh,0f1h,04fh,0ffh,0e0h,072h,08eh,007h	; 9a10  ..O.......O..r..
	defb 0e0h,071h,04eh,007h,0e0h,072h,08eh,007h,0ffh,0f1h,04fh,0ffh,0ffh,0f2h,08fh,0ffh	; 9a20  .qN..r....O.....
	defb 0ffh,0f1h,04fh,0ffh,0ffh,0f2h,08fh,0ffh,000h,001h,040h,000h,000h,002h,080h,000h	; 9a30  ..O.......@.....
	defb 055h,055h,055h,055h,000h,000h,000h,000h,000h,000h,000h,000h,0aah,0aah,0aah,0aah	; 9a40  UUUU............
	defb 055h,055h,055h,055h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0aah,0aah,0aah,0aah	; 9a50  UUUU............
	defb 017h,03fh,0fch,017h,08eh,03fh,0fch,08eh,017h,03fh,0fch,017h,08eh,03eh,03ch,08eh	; 9a60  .?...?...?...><.
	defb 017h,03eh,03ch,017h,08eh,03eh,03ch,08eh,017h,03eh,03ch,017h,08eh,03eh,03ch,08eh	; 9a70  .><..><..><..><.
	defb 017h,03eh,03ch,017h,08eh,03fh,0fch,08eh,017h,03fh,0fch,017h,08eh,03fh,0fch,08eh	; 9a80  .><..?...?...?..
	defb 017h,000h,000h,017h,08eh,000h,000h,08eh,017h,055h,055h,017h,08eh,0aah,0aah,08eh	; 9a90  .........UU.....
	defb 017h,055h,055h,017h,08eh,0aah,0aah,08eh,017h,000h,000h,017h,08eh,000h,000h,08eh	; 9aa0  .UU.............
	defb 017h,03fh,0fch,017h,08eh,03fh,0fch,08eh,017h,03fh,0fch,017h,08eh,03eh,03ch,08eh	; 9ab0  .?...?...?...><.
	defb 017h,03eh,03ch,017h,08eh,03eh,03ch,08eh,017h,03eh,03ch,017h,08eh,03eh,03ch,08eh	; 9ac0  .><..><..><..><.
	defb 017h,03eh,03ch,017h,08eh,03fh,0fch,08eh,017h,03fh,0fch,017h,08eh,03fh,0fch,08eh	; 9ad0  .><..?...?...?..
	defb 017h,03fh,0feh,047h,08eh,09fh,0ffh,023h,017h,04fh,01fh,091h,08bh,0a7h,08fh,028h	; 9ae0  .?.G...#.O.....(
	defb 045h,0d3h,0c6h,054h,0a2h,0e9h,0ech,0a2h,051h,074h,0f9h,049h,0e8h,0bah,072h,09ch	; 9af0  E..T....Qt.I..r.
	defb 014h,05dh,025h,03eh,0aah,02eh,08ah,07fh,055h,017h,054h,0ffh,0aah,08bh,0a9h,0efh	; 9b00  .]%>....U.T.....
	defb 055h,015h,0d3h,0c7h,0eah,02ah,0e9h,0e3h,014h,05dh,074h,0f3h,0a8h,0b8h,0bah,07bh	; 9b10  U....*...]t....{
	defb 051h,074h,05dh,03fh,0a2h,0eah,02eh,09fh,045h,0d5h,017h,04fh,0e3h,0aah,08bh,0a7h	; 9b20  Qt]?....E..O....
	defb 005h,0d5h,015h,0d3h,0a3h,0aah,02ah,0e9h,045h,0d4h,059h,074h,0a3h,080h,0b8h,0bah	; 9b30  ......*.E.Yt....
	defb 045h,001h,074h,05dh,0e2h,0aah,0eah,02eh,005h,055h,0d5h,014h,0afh,0ffh,0aah,08ah	; 9b40  E.t].....U......
	defb 05fh,0ffh,055h,045h,0aah,0aah,0aah,0afh,059h,065h,096h,05fh,0aah,0aah,0aah,0aah	; 9b50  _.UE....Ye._....
	defb 017h,03fh,0fch,017h,02eh,07fh,0fch,08eh,05ch,0f8h,0f9h,017h,0b9h,0f1h,0f2h,02eh	; 9b60  .?......\.......
	defb 074h,0e3h,0e4h,05dh,0eah,077h,0c8h,0bah,0c5h,03fh,091h,075h,092h,09fh,022h,0eah	; 9b70  t..].w...?.u..".
	defb 039h,04eh,045h,0d7h,07ch,0a4h,08bh,0a8h,0feh,051h,017h,055h,0f7h,02ah,02eh,0aah	; 9b80  9NE.|....Q.U.*..
	defb 0e3h,094h,057h,055h,0c7h,0c8h,0abh,0aah,0cfh,091h,065h,0d7h,0dfh,022h,0e2h,0e8h	; 9b90  ..WU......e.."..
	defb 0feh,045h,0d1h,075h,0fch,08bh,0a8h,0bah,0f9h,017h,054h,05dh,0f2h,02eh,0aah,03ah	; 9ba0  .E.u......T]...:
	defb 0e4h,057h,054h,05fh,0c8h,0abh,0aah,038h,091h,065h,0d4h,05dh,022h,0e2h,0e0h,03ah	; 9bb0  .WT_...8.e.]"..:
	defb 045h,0d1h,040h,05dh,00bh,0a8h,0aah,0bah,017h,054h,055h,05fh,0aeh,0aah,03fh,0f8h	; 9bc0  E.@].....TU_..?.
	defb 05dh,055h,03fh,0fdh,0fah,0aah,0aah,0aah,0f4h,0d3h,04dh,035h,0aah,0aah,0aah,0aah	; 9bd0  ]U?.......M5....
	defb 01dh,055h,0aah,047h,09ah,04eh,072h,0a6h,01dh,07ch,03eh,047h,09ah,01ch,038h,0a6h	; 9be0  .U.G.Nr..|>G..8.
	defb 01dh,004h,0a1h,047h,09ah,082h,04ah,0a6h,055h,019h,09bh,055h,0aah,098h,03ah,0aah	; 9bf0  ...G..J.U..U..:.
	defb 055h,01dh,0bbh,055h,0aah,099h,0bah,0aah,01dh,01dh,0bbh,047h,09ah,099h,0bah,0a6h	; 9c00  U..U.......G....
	defb 01dh,01dh,0bbh,047h,09ah,089h,0b2h,0a6h,01dh,045h,0a7h,047h,09ah,0a1h,08eh,0a6h	; 9c10  ...G.....E.G....
	defb 01dh,051h,09dh,047h,09ah,0a9h,0bah,0a6h,055h,054h,015h,055h,0aah,0aah,0aah,0aah	; 9c20  .Q.G....UT.U....
	defb 003h,055h,055h,001h,006h,0abh,0eah,083h,03fh,055h,0d5h,01fh,02eh,0abh,0eah,09bh	; 9c30  .UU.....?U......
	defb 037h,055h,0d5h,013h,026h,0abh,0eah,09bh,037h,055h,0d5h,013h,026h,0afh,0fah,09bh	; 9c40  7U..&...7U..&...
	defb 037h,057h,0f5h,013h,026h,0abh,0eah,093h,07fh,055h,0d5h,01fh,0feh,0aah,0aah,0bfh	; 9c50  7W..&....U......
	defb 091h,001h,014h,05fh,088h,0aah,02ah,0afh,091h,001h,014h,05fh,088h,0feh,02ah,0bfh	; 9c60  ..._..*...._..*.
	defb 091h,055h,014h,05fh,088h,0aah,02ah,0afh,094h,07fh,014h,05fh,08ah,0ffh,08ah,0afh	; 9c70  .U._..*...._....
	defb 095h,055h,044h,057h,0cah,0aah,0a2h,02bh,067h,0ffh,0f1h,095h,0bfh,0ffh,0f8h,000h	; 9c80  .UDW...+g.......
	defb 040h,000h,015h,055h,0aah,0aah,0b2h,080h,000h,000h,055h,07fh,080h,000h,0f2h,0aah	; 9c90  @..U......U.....
	defb 015h,055h,0d5h,055h,080h,000h,0f2h,080h,010h,001h,0d1h,07fh,082h,080h,0f2h,0aah	; 9ca0  .U.U............
	defb 010h,029h,0d1h,055h,080h,000h,0f2h,080h,012h,081h,0d1h,07fh,080h,028h,0f0h,0aah	; 9cb0  .).U.........(..
	defb 010h,001h,0d1h,055h,080h,000h,0f0h,080h,010h,001h,0d1h,07fh,080h,000h,0f0h,0aah	; 9cc0  ...U............
	defb 015h,055h,0d1h,055h,0bfh,0ffh,0f2h,000h,07fh,0ffh,0d4h,000h,0aah,0aah,0b8h,000h	; 9cd0  .U.U............
	defb 0ffh,079h,039h,076h,0ffh,07dh,000h,0eeh,0ffh,07dh,055h,076h,0ffh,07dh,080h,0eeh	; 9ce0  .y9v.}...}Uv.}..
	defb 0ffh,07dh,07fh,076h,0ffh,07dh,0aah,0eeh,0ffh,07dh,0ffh,0d6h,0ffh,07bh,0ffh,0aeh	; 9cf0  .}.v.}...}...{..
	defb 0ffh,075h,055h,05ch,0feh,06ah,0aah,0b8h,07dh,09fh,0ffh,0f1h,000h,03fh,0ffh,0e2h	; 9d00  .uU\.j..}....?..
	defb 055h,050h,000h,005h,000h,0b2h,0aah,0aah,0ffh,057h,0ffh,0fdh,0aah,0b3h,086h,018h	; 9d10  UP.......W......
	defb 055h,057h,0ffh,0f1h,000h,0b2h,0ffh,0e4h,0ffh,076h,0f3h,025h,0aah,0b2h,0cch,0c4h	; 9d20  UW.......v.%....
	defb 055h,076h,0f3h,025h,000h,0b2h,0cch,0c0h,0ffh,077h,0f3h,021h,0aah,0f3h,0cch,0c0h	; 9d30  Uv.%.....w.!....
	defb 055h,076h,0f3h,025h,000h,0f2h,0cch,0c4h,0ffh,076h,0f3h,025h,0aah,0f2h,0cch,0c4h	; 9d40  Uv.%.....v.%....
	defb 055h,076h,0c0h,005h,000h,033h,080h,000h,000h,017h,03ch,079h,000h,002h,000h,000h	; 9d50  Uv...3....<y....
	defb 040h,005h,0dbh,0feh,040h,008h,0afh,0fah,000h,000h,000h,000h,0ffh,0ffh,0ffh,0ffh	; 9d60  @...@...........
	defb 0d0h,045h,0dfh,0ffh,080h,00ah,0bbh,0fdh,0d0h,051h,07fh,0ffh,080h,00ah,0abh,0fdh	; 9d70  .E.......Q......
	defb 0d0h,055h,0dfh,0ffh,080h,002h,0bbh,0fdh,0d0h,055h,05fh,0ffh,080h,00ah,0ebh,0fdh	; 9d80  .U.......U_.....
	defb 0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,040h,007h,05fh,0fah,060h,00ah,0bfh,0feh	; 9d90  ........@._.`...
	defb 040h,001h,0ffh,0fah,060h,00ah,0afh,0feh,040h,007h,07fh,0fah,060h,02ah,0afh,0feh	; 9da0  @...`...@...`*..
	defb 030h,001h,0ffh,0f6h,020h,02ah,0bfh,0fch,034h,057h,05fh,0edh,018h,002h,0ffh,0fah	; 9db0  0... *..4W_.....
	defb 04dh,055h,07fh,0d5h,06ah,0fbh,0ffh,0f6h,04dh,07fh,0ffh,065h,067h,0bfh,0fdh,0ceh	; 9dc0  MU..j...M..eg...
	defb 070h,0d7h,0f7h,01dh,03eh,07dh,05eh,0fah,015h,00fh,0f1h,055h,0aah,0a0h,00ah,0aah	; 9dd0  p...>}^....U....
	defb 055h,055h,055h,055h,0afh,0ffh,0aah,0bfh,05fh,0feh,055h,0e0h,0bah,0a8h,0afh,000h	; 9de0  UUUU...._.U.....
	defb 075h,051h,078h,000h,0eah,082h,0c0h,000h,075h,007h,080h,03fh,0eah,02ch,001h,0e0h	; 9df0  uQx.....u..?.,..
	defb 074h,058h,00fh,015h,0e8h,0b0h,018h,0aah,071h,060h,075h,055h,0e8h,0c0h,0cah,0bfh	; 9e00  tX......q`uU....
	defb 071h,081h,095h,0e0h,0e3h,003h,02fh,00ah,066h,006h,058h,055h,0eah,00ch,0b2h,0aah	; 9e10  q...../.f.XU....
	defb 056h,019h,065h,050h,0ach,032h,0cah,08fh,058h,025h,095h,070h,0a8h,06bh,02bh,080h	; 9e20  V.eP.2..X%.p.k+.
	defb 058h,056h,056h,00fh,0b0h,0cch,0ach,070h,060h,095h,058h,085h,0a1h,0aah,0b1h,02ah	; 9e30  XVV....p`.X....*
	defb 061h,059h,062h,057h,0a1h,032h,0a4h,0afh,063h,055h,045h,0ffh,0c2h,0b2h,0c4h,086h	; 9e40  aYbW.2..cUE.....
	defb 042h,065h,049h,094h,0c2h,0aah,04ah,0a8h,042h,065h,049h,095h,0c2h,0aah,04ah,0aah	; 9e50  BeI...J.BeI...J.
	defb 055h,055h,055h,055h,0feh,0aah,0afh,0bfh,003h,0d5h,05fh,05fh,000h,07ah,0aeh,03ch	; 9e60  UUUU......__.z.<
	defb 000h,00fh,05ch,05dh,000h,001h,0a8h,03dh,0feh,000h,0f5h,05dh,003h,0c0h,01ah,0bch	; 9e70  ..\]...=...]....
	defb 054h,070h,00dh,05fh,0aah,09ch,006h,0bfh,055h,047h,003h,055h,0fah,0a9h,081h,0aah	; 9e80  Tp._....UG.U....
	defb 007h,0d4h,0cah,0c0h,0a8h,07ah,061h,01fh,055h,01dh,034h,0f0h,0aah,0aeh,093h,080h	; 9e90  .....za.U.4.....
	defb 000h,000h,00eh,007h,0ffh,0ffh,0f8h,00fh,000h,000h,000h,000h,000h,000h,000h,000h	; 9ea0  ................
	defb 0ffh,0ffh,0ffh,0ffh,000h,000h,000h,000h,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 9eb0  ........UUUU....
	defb 0ffh,0ffh,0ffh,0d0h,0ffh,0ffh,0ffh,0afh,055h,055h,055h,015h,0aah,0aah,000h,026h	; 9ec0  ........UUU....&
	defb 000h,005h,000h,015h,000h,00eh,000h,000h,055h,05dh,000h,000h,0aah,0aeh,00ch,0cch	; 9ed0  ........U]......
	defb 055h,055h,055h,055h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,000h,003h	; 9ee0  UUUU............
	defb 0ffh,0ffh,0ffh,0fbh,018h,0c6h,031h,08bh,0ffh,0ffh,0ffh,0fbh,000h,000h,000h,003h	; 9ef0  ......1.........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; 9f00  ........UUUU....
	defb 000h,000h,000h,005h,0ffh,0ffh,0ffh,0fah,000h,000h,000h,00dh,000h,000h,000h,01eh	; 9f10  ................
	defb 03ch,0f3h,0cfh,03fh,03ch,0f3h,0cfh,01fh,000h,000h,000h,04fh,000h,000h,000h,0e7h	; 9f20  <..?<......O....
	defb 0ffh,0ffh,0ffh,0ffh,000h,000h,003h,0e7h,055h,055h,055h,0e7h,0aah,0aah,0aah,0e7h	; 9f30  ........UUU.....
	defb 000h,000h,014h,0e7h,0ffh,0ffh,0aah,0ffh,055h,055h,094h,0ffh,066h,0aah,0aah,0e7h	; 9f40  ........UU..f...
	defb 055h,011h,090h,0e7h,002h,0aah,0aah,0e7h,005h,05fh,0fch,0e7h,0ceh,0bfh,0fah,0ffh	; 9f50  U........_......
	defb 055h,055h,055h,055h,080h,000h,000h,000h,040h,000h,000h,000h,080h,000h,000h,000h	; 9f60  UUUU....@.......
	defb 040h,000h,000h,000h,082h,0aah,0aah,0aah,041h,0fdh,05fh,0fdh,083h,0a8h,0bah,0a8h	; 9f70  @.......A._.....
	defb 041h,001h,050h,001h,082h,0aah,0aah,0aah,047h,0ffh,0ffh,0ffh,08fh,0ffh,0ffh,0ffh	; 9f80  A.P.....G.......
	defb 05fh,000h,0ffh,0ffh,0bch,00ah,03fh,0fch,058h,015h,095h,058h,0aah,00bh,0dah,0aah	; 9f90  _.....?.X..X....
	defb 058h,017h,0d4h,018h,0aah,00bh,0d9h,0aah,058h,017h,0d5h,098h,0aah,07fh,0d9h,0aah	; 9fa0  X.......X.......
	defb 059h,080h,075h,099h,0aah,00bh,019h,0aah,058h,017h,0d5h,098h,0aah,00bh,0d9h,0aah	; 9fb0  Y.u.....X.......
	defb 058h,017h,0d5h,098h,0aah,00bh,0d9h,0aah,058h,017h,0d5h,098h,0aah,07fh,0d9h,0aah	; 9fc0  X.......X.......
	defb 059h,080h,075h,099h,0aah,00bh,019h,0aah,058h,017h,0d5h,098h,0aah,00bh,0d9h,0aah	; 9fd0  Y.u.....X.......
	defb 055h,055h,055h,055h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; 9fe0  UUUU............
	defb 000h,000h,000h,000h,0aah,0aah,0aah,0aah,057h,0ffh,0ffh,055h,0aeh,0aah,0aah,02bh	; 9ff0  ........W..U...+
	defb 054h,000h,000h,055h,0aah,0aah,0aah,0aah,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; a000  T..U............
	defb 000h,0ffh,0ffh,000h,00ah,03fh,0fch,00ah,015h,095h,058h,015h,00bh,0dah,0aah,00bh	; a010  .....?....X.....
	defb 017h,0d4h,018h,017h,00bh,0d9h,0aah,00bh,017h,0d5h,098h,017h,07fh,0d9h,0aah,07fh	; a020  ................
	defb 080h,075h,099h,080h,00bh,019h,0aah,00bh,017h,0d5h,098h,017h,00bh,0d9h,0aah,00bh	; a030  .u..............
	defb 017h,0d5h,098h,017h,00bh,0d9h,0aah,00bh,017h,0d5h,098h,017h,07fh,0d9h,0aah,07fh	; a040  ................
	defb 080h,075h,099h,080h,00bh,019h,0aah,00bh,017h,0d5h,098h,017h,00bh,0d9h,0aah,00bh	; a050  .u..............
	defb 055h,055h,055h,055h,000h,000h,000h,002h,000h,000h,000h,005h,000h,000h,000h,00eh	; a060  UUUU............
	defb 000h,000h,000h,01dh,0aah,0aah,0aah,0beh,0ffh,0f5h,07fh,07dh,0aah,0a2h,0eah,03eh	; a070  ...........}...>
	defb 000h,005h,040h,07dh,0aah,0aah,0aah,0beh,0ffh,0ffh,0ffh,0fdh,0ffh,0ffh,0ffh,0feh	; a080  ..@}............
	defb 0ffh,0ffh,000h,0fdh,03fh,0fch,00ah,03eh,095h,058h,015h,095h,0dah,0aah,00bh,0dah	; a090  ....?..>.X......
	defb 0d4h,018h,017h,0d5h,0d9h,0aah,00bh,0dah,0d5h,098h,017h,0d5h,0d9h,0aah,07fh,0dah	; a0a0  ................
	defb 075h,099h,080h,075h,019h,0aah,00bh,01ah,0d5h,098h,017h,0d5h,0d9h,0aah,00bh,0dah	; a0b0  u..u............
	defb 0d5h,098h,017h,0d5h,0d9h,0aah,00bh,0dah,0d5h,098h,017h,0d5h,0d9h,0aah,07fh,0dah	; a0c0  ................
	defb 075h,099h,080h,075h,019h,0aah,00bh,01ah,0d5h,098h,017h,0d5h,0d9h,0aah,00bh,0dah	; a0d0  u..u............
	defb 005h,055h,055h,0c6h,08ch,0bfh,0feh,081h,005h,055h,055h,055h,08ah,0e8h,0bah,022h	; a0e0  .UU......UUU..."
	defb 005h,017h,045h,0ddh,08ah,0aah,0aah,0aah,000h,000h,000h,000h,080h,000h,000h,000h	; a0f0  ..E.............
	defb 000h,000h,000h,000h,080h,0aah,0aah,0aah,001h,0d5h,055h,055h,080h,02fh,0ffh,0ffh	; a100  ..........UU./..
	defb 001h,05fh,0ffh,0ffh,080h,0bah,0aah,0aah,001h,075h,055h,055h,080h,0ebh,0ffh,0ffh	; a110  ._.......uUU....
	defb 001h,077h,011h,011h,080h,0ebh,0ffh,0ffh,001h,075h,055h,055h,080h,0bah,0aah,0aah	; a120  .w.......uUU....
	defb 001h,05ch,000h,000h,080h,028h,000h,000h,001h,0d5h,055h,055h,080h,0aah,0aah,0aah	; a130  .\...(....UU....
	defb 001h,0ffh,0ffh,0ffh,083h,0ffh,0ffh,0ffh,007h,0ffh,0ffh,0ffh,08fh,0ffh,0ffh,0ffh	; a140  ................
	defb 01fh,0ffh,0ffh,0ffh,0bfh,0ffh,0ffh,0ffh,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; a150  ........UUUU....
	defb 000h,060h,006h,000h,0ffh,080h,001h,0ffh,055h,055h,055h,055h,022h,022h,022h,000h	; a160  .`......UUUU""".
	defb 0ddh,0ddh,0ddh,0ffh,0aah,0aah,0aah,0aah,000h,007h,000h,000h,000h,00fh,000h,000h	; a170  ................
	defb 000h,01fh,000h,000h,0aah,0bfh,002h,0aah,055h,01fh,005h,07fh,0feh,0ffh,002h,0eah	; a180  ........U.......
	defb 0fdh,05fh,005h,04eh,0a8h,0bfh,002h,0eah,054h,05fh,004h,000h,0fah,03fh,000h,000h	; a190  ._.N....T_...?..
	defb 01ch,05fh,004h,0fch,0fah,03fh,000h,0fch,054h,05fh,004h,000h,0a8h,0bfh,000h,000h	; a1a0  ._...?..T_......
	defb 001h,05fh,005h,015h,002h,0ffh,002h,080h,055h,01fh,005h,055h,0aah,0bfh,002h,0aah	; a1b0  ._......U..U....
	defb 0ffh,0ffh,007h,0ffh,0ffh,0ffh,00fh,0ffh,0ffh,0ffh,01fh,0ffh,0ffh,0ffh,0ffh,0ffh	; a1c0  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; a1d0  ........UUUU....
	defb 042h,065h,049h,095h,0c2h,0aah,04ah,0afh,042h,065h,049h,097h,0c2h,0aah,04ah,086h	; a1e0  BeI...J.BeI...J.
	defb 042h,065h,049h,0fch,0c2h,0b2h,0cah,0a8h,063h,055h,069h,055h,0a1h,032h,0a4h,0aah	; a1f0  BeI.....cUiU.2..
	defb 061h,059h,06ch,057h,0b1h,0aah,0b6h,028h,050h,095h,05bh,085h,0b0h,0ach,0aeh,0e0h	; a200  aYlW...(P.[.....
	defb 018h,0d6h,057h,0ffh,0e8h,06bh,02ah,0ffh,058h,025h,095h,03fh,0adh,032h,0cah,08fh	; a210  ..W..k*.X%.?.2..
	defb 016h,059h,065h,050h,0ebh,02ch,0b2h,0aah,057h,056h,05ch,055h,0abh,0abh,02bh,08ah	; a220  .YeP.,..WV\U..+.
	defb 015h,0d5h,095h,070h,0eah,0ebh,0cah,0afh,05dh,07dh,071h,055h,0aeh,0bbh,0fch,0aah	; a230  ...p....]}qU....
	defb 01bh,05eh,0ffh,015h,0e9h,0afh,0ffh,0e0h,05ch,0d7h,0ffh,0ffh,0afh,0eah,0ffh,0ffh	; a240  .^......\.......
	defb 015h,055h,07fh,0ffh,0e2h,022h,02fh,0ffh,05dh,0ddh,0d7h,0ffh,0aah,0aah,0aah,0bfh	; a250  .U..."/.].......
	defb 055h,05dh,003h,033h,0ffh,0feh,00ch,0ffh,0ffh,0fdh,003h,0ffh,0aah,0aah,00ch,0c3h	; a260  U].3............
	defb 000h,000h,003h,0ffh,000h,000h,00ch,0ffh,055h,055h,043h,033h,0aah,0aah,08fh,0ffh	; a270  ........UUC3....
	defb 077h,077h,05fh,0ffh,088h,088h,0aah,0aah,055h,055h,055h,055h,000h,000h,000h,000h	; a280  ww_.....UUUU....
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0f0h	; a290  ................
	defb 000h,000h,00fh,0f8h,0aah,0aeh,093h,0ffh,055h,01dh,03ch,0ffh,0a8h,0eah,07fh,01fh	; a2a0  ........U.<.....
	defb 007h,054h,0ffh,0c0h,0fah,0a9h,0ffh,0aah,055h,057h,0ffh,055h,0aah,08fh,0feh,0afh	; a2b0  .T......UW.U....
	defb 054h,07fh,0fdh,058h,003h,0ffh,0fah,0b7h,0ffh,0ffh,0f5h,06dh,0ffh,0ffh,0aah,0d8h	; a2c0  T..X.......m....
	defb 0ffh,0ffh,050h,03fh,0ffh,0fah,0bfh,0ffh,0ffh,0d5h,055h,055h,0feh,0aah,0aah,0aah	; a2d0  ..P?......UU....
	defb 03dh,01dh,05ch,0ffh,0ceh,0bah,0bah,0e7h,03dh,05dh,05ch,0e7h,0ceh,0bah,0bah,0e7h	; a2e0  =.\.....=]\.....
	defb 03dh,01dh,05ch,0e7h,0ceh,0bfh,0fah,0ffh,03dh,05fh,0fch,0ffh,0feh,0aah,0aah,0e7h	; a2f0  =.\.....=_......
	defb 0fdh,011h,010h,0e7h,0aah,0aah,0aah,0e7h,055h,055h,055h,0e7h,000h,000h,003h,0ffh	; a300  ........UUU.....
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0e7h,0ffh,0ffh,0ffh,0cfh,0c3h,00ch,030h,0dfh	; a310  ..............0.
	defb 0c3h,00ch,030h,0ffh,0ffh,0ffh,0ffh,0feh,0ffh,0ffh,0ffh,0fdh,0ffh,0ffh,0ffh,0fah	; a320  ..0.............
	defb 000h,000h,000h,005h,0aah,0aah,0aah,0aah,055h,0ffh,0ffh,0fdh,0fah,0ffh,0ffh,0f8h	; a330  ........U.......
	defb 00dh,0d5h,055h,051h,0fah,0e0h,000h,008h,05dh,0dfh,0ffh,0f1h,01ah,0e0h,000h,008h	; a340  ..UQ....].......
	defb 0fdh,0d5h,055h,051h,0fah,080h,000h,000h,055h,000h,000h,001h,0aah,0aah,0aah,0aah	; a350  ..UQ....U.......
	defb 058h,017h,0d5h,098h,0aah,00bh,0d9h,0aah,058h,017h,0d5h,098h,0aah,07fh,0d9h,0aah	; a360  X.......X.......
	defb 059h,080h,075h,099h,0aah,00bh,019h,0aah,058h,017h,0d5h,098h,0aah,00bh,0d9h,0aah	; a370  Y.u.....X.......
	defb 058h,017h,0d5h,098h,0aah,00bh,0d9h,0aah,058h,017h,0d5h,098h,0aah,07fh,0d9h,0aah	; a380  X.......X.......
	defb 059h,080h,075h,099h,0aah,00bh,019h,0aah,058h,017h,0d4h,018h,0aah,00bh,0dah,0aah	; a390  Y.u.....X.......
	defb 058h,017h,0d5h,058h,08ah,00bh,010h,02ah,006h,000h,060h,078h,081h,0ffh,080h,0eah	; a3a0  X..X...*..`x....
	defb 005h,055h,055h,0f9h,08ah,0aah,0aah,0eah,005h,07fh,0fdh,0f8h,08ch,0eah,0aah,0eah	; a3b0  .UU.............
	defb 005h,040h,001h,0f8h,08ah,0e0h,00ah,0eah,005h,04eh,0e1h,0f8h,08ah,0eeh,0eah,0eah	; a3c0  .@.......N......
	defb 003h,040h,001h,0f9h,08ah,0e0h,00ah,0eah,005h,055h,051h,0f8h,08ah,080h,002h,0eah	; a3d0  .@.......UQ.....
	defb 017h,0d5h,098h,017h,00bh,0d9h,0aah,00bh,017h,0d5h,098h,017h,07fh,0d9h,0aah,07fh	; a3e0  ................
	defb 080h,075h,099h,080h,00bh,019h,0aah,00bh,017h,0d5h,098h,017h,00bh,0d9h,0aah,00bh	; a3f0  .u..............
	defb 017h,0d5h,098h,017h,00bh,0d9h,0aah,00bh,017h,0d5h,098h,017h,07fh,0d9h,0aah,07fh	; a400  ................
	defb 080h,075h,099h,080h,00bh,019h,0aah,00bh,017h,0d5h,098h,017h,00bh,0d9h,0aah,00bh	; a410  .u..............
	defb 017h,0d5h,098h,017h,00bh,0d9h,0aah,00bh,017h,0d5h,098h,017h,07fh,0d9h,0aah,07fh	; a420  ................
	defb 080h,075h,099h,080h,00bh,019h,0aah,00bh,017h,0d5h,098h,017h,00bh,0d9h,0aah,00bh	; a430  .u..............
	defb 017h,0d5h,098h,017h,00bh,0d9h,0aah,00bh,017h,0d5h,098h,017h,07fh,0d9h,0aah,07fh	; a440  ................
	defb 080h,074h,019h,080h,00bh,01ah,0aah,00bh,017h,0d5h,058h,017h,00bh,010h,00ah,00bh	; a450  .t........X.....
	defb 0d5h,098h,017h,0d5h,0d9h,0aah,00bh,0dah,0d5h,098h,017h,0d5h,0d9h,0aah,07fh,0dah	; a460  ................
	defb 075h,099h,080h,075h,019h,0aah,00bh,01ah,0d5h,098h,017h,0d5h,0d9h,0aah,00bh,0dah	; a470  u..u............
	defb 0d5h,098h,017h,0d5h,0d9h,0aah,00bh,0dah,0d5h,098h,017h,0d5h,0d9h,0aah,07fh,0dah	; a480  ................
	defb 075h,099h,080h,075h,019h,0aah,00bh,01ah,0d4h,018h,017h,0d5h,0dah,0aah,00bh,0dah	; a490  u..u............
	defb 0d5h,058h,017h,0d5h,0d8h,008h,00bh,012h,0d0h,006h,000h,067h,0d8h,001h,0ffh,08eh	; a4a0  .X.........g....
	defb 070h,055h,055h,05fh,018h,0aah,0aah,0aeh,0d0h,050h,000h,05fh,0d8h,0f0h,000h,0eeh	; a4b0  pUU_.....P._....
	defb 0d0h,041h,055h,0dfh,0d8h,0c2h,038h,0eeh,0d0h,051h,0c7h,0dfh,0d8h,0c2h,0aah,0eeh	; a4c0  .AU...8..Q......
	defb 070h,057h,0ffh,0dfh,018h,0cfh,0ffh,0eeh,0d0h,055h,053h,05fh,010h,0ceh,08ah,00eh	; a4d0  pW.......US_....
	defb 060h,051h,073h,05fh,080h,0cah,0aah,04eh,055h,040h,003h,05fh,000h,01fh,0feh,04eh	; a4e0  `Qs_...NU@._...N
	defb 0ffh,0f5h,055h,01fh,0aah,0aah,0aah,0aeh,000h,000h,000h,01fh,000h,000h,000h,03eh	; a4f0  ..U............>
	defb 000h,000h,000h,07fh,0aah,0aah,0aah,0feh,0ffh,0ffh,0d5h,07fh,0aah,0aah,0eah,0feh	; a500  ................
	defb 055h,000h,001h,07fh,09ch,080h,003h,0feh,055h,015h,057h,07fh,0aah,088h,08bh,0feh	; a510  U.......U.W.....
	defb 000h,017h,077h,07fh,0ffh,0c5h,0d3h,0feh,055h,017h,077h,07fh,09ch,088h,08bh,0feh	; a520  ..w.....U.w.....
	defb 055h,015h,057h,07fh,000h,03fh,0ffh,0feh,055h,07fh,0ffh,07fh,0aah,0aah,0aah,0feh	; a530  U.W..?..U.......
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh	; a540  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0feh,055h,055h,055h,055h,0aah,0aah,0aah,0aah	; a550  ........UUUU....
	defb 019h,07fh,000h,000h,0f3h,03fh,003h,000h,0e5h,09fh,005h,080h,0cah,0cfh,00ah,0c0h	; a560  .....?..........
	defb 0d2h,0e7h,012h,0e0h,0d0h,0b7h,010h,0b0h,090h,0f3h,010h,0f0h,0a8h,0dbh,028h,0d8h	; a570  ..............(.
	defb 0b5h,0dbh,035h,0d8h,0bah,0cbh,03ah,0c8h,0b6h,0fbh,036h,0f8h,0a9h,07bh,029h,078h	; a580  ..5...:...6..{)x
	defb 08dh,073h,00dh,070h,0dbh,087h,01bh,080h,0dbh,0bfh,01bh,080h,0c0h,03fh,000h,000h	; a590  .s.p.........?..
	defb 0ffh,0ffh,000h,000h,0feh,001h,000h,000h,0f8h,0fdh,000h,0fch,0e3h,085h,003h,084h	; a5a0  ................
	defb 0cfh,015h,00fh,014h,0d4h,02dh,014h,02ch,083h,01dh,003h,01ch,03ah,0edh,03ah,0ech	; a5b0  .....-.,....:.:.
	defb 072h,0f9h,072h,0f8h,06dh,0ebh,06dh,0e8h,01dh,0dbh,01dh,0d8h,0bbh,093h,03bh,090h	; a5c0  r.r.m.m.......;.
	defb 095h,0e7h,015h,0e0h,0c0h,0cfh,000h,0c0h,0feh,01fh,000h,000h,0ffh,0ffh,000h,000h	; a5d0  ................
	defb 0ffh,0ffh,000h,000h,0e0h,03fh,000h,000h,00fh,087h,00fh,080h,067h,073h,067h,070h	; a5e0  .....?......gsgp
	defb 07ah,089h,07ah,088h,015h,004h,015h,004h,066h,01ah,066h,01ah,079h,006h,079h,006h	; a5f0  z.z.....f.f.y.y.
	defb 067h,0fch,067h,0fch,01fh,0d9h,01fh,0d8h,0dch,073h,01ch,070h,0ddh,0e7h,01dh,0e0h	; a600  g.g......s.p....
	defb 0cfh,08fh,00fh,080h,0e0h,03fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h	; a610  .....?..........
	defb 0f8h,07fh,000h,000h,0e3h,03fh,003h,000h,0cbh,08fh,00bh,080h,0ddh,0a7h,01dh,0a0h	; a620  .....?..........
	defb 0ceh,097h,00eh,090h,0d6h,033h,016h,030h,0c9h,0dbh,009h,0d8h,09eh,059h,01eh,058h	; a630  .....3.0.....Y.X
	defb 0bfh,08dh,03fh,08ch,0b7h,085h,037h,084h,093h,0a5h,013h,0a4h,0cdh,055h,00dh,054h	; a640  ..?...7......U.T
	defb 0e7h,0e5h,007h,0e4h,0f0h,0fdh,000h,0fch,0feh,001h,000h,000h,0ffh,0ffh,000h,000h	; a650  ................
	defb 0fch,003h,000h,000h,0fdh,0dbh,001h,0d8h,0e1h,0dbh,001h,0d8h,0ceh,0b1h,00eh,0b0h	; a660  ................
	defb 0deh,095h,01eh,094h,0dfh,06dh,01fh,06ch,0d3h,05dh,013h,05ch,0dbh,0adh,01bh,0ach	; a670  .....m.l.].\....
	defb 0dbh,015h,01bh,014h,0cfh,009h,00fh,008h,0edh,00bh,00dh,008h,0e7h,04bh,007h,048h	; a680  .............K.H
	defb 0f3h,053h,003h,050h,0f9h,0a7h,001h,0a0h,0fch,0cfh,000h,0c0h,0feh,01fh,000h,000h	; a690  .S.P............
	defb 0ffh,0ffh,000h,000h,0f8h,07fh,000h,000h,0f3h,003h,003h,000h,0e7h,0a9h,007h,0a8h	; a6a0  ................
	defb 0c9h,0ddh,009h,0dch,0dbh,0b8h,01bh,0b8h,0d7h,0b6h,017h,0b6h,09fh,04eh,01fh,04eh	; a6b0  .............N.N
	defb 0b7h,05ch,037h,05ch,0b8h,0c1h,038h,0c0h,0b4h,02bh,034h,028h,0a8h,0f3h,028h,0f0h	; a6c0  .\7\..8..+4(..(.
	defb 0a1h,0c7h,021h,0c0h,0bfh,01fh,03fh,000h,080h,07fh,000h,000h,0ffh,0ffh,000h,000h	; a6d0  ..!...?.........
	defb 0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0fch,007h,000h,000h,0f1h,0f3h,001h,0f0h	; a6e0  ................
	defb 0e7h,0bbh,007h,0b8h,0ceh,03bh,00eh,038h,09bh,0f8h,01bh,0f8h,03fh,0e6h,03fh,0e6h	; a6f0  .....;.8....?.?.
	defb 060h,09eh,060h,09eh,058h,066h,058h,066h,020h,0a8h,020h,0a8h,091h,05eh,011h,05eh	; a700  `.`.XfXf . ..^.^
	defb 0ceh,0e6h,00eh,0e6h,0e1h,0f0h,001h,0f0h,0fch,007h,000h,000h,0ffh,0ffh,000h,000h	; a710  ................
	defb 0ffh,0ffh,000h,000h,080h,07fh,000h,000h,0bfh,00fh,03fh,000h,0a7h,0e7h,027h,0e0h	; a720  ..........?...'.
	defb 0aah,0b3h,02ah,0b0h,0a5h,0c9h,025h,0c8h,0a1h,0edh,021h,0ech,0b1h,0fdh,031h,0fch	; a730  ..*...%...!...1.
	defb 09ah,079h,01ah,078h,0dbh,093h,01bh,090h,0cch,06bh,00ch,068h,0e9h,073h,009h,070h	; a740  .y.x.....k.h.s.p
	defb 0e5h,0bbh,005h,0b8h,0f1h,0d3h,001h,0d0h,0fch,0c7h,000h,0c0h,0feh,01fh,000h,000h	; a750  ................
	defb 0fch,03fh,000h,000h,0f1h,08fh,001h,080h,0e6h,067h,006h,060h,0cch,0b3h,00ch,0b0h	; a760  .?.......g.`....
	defb 09dh,039h,01dh,038h,0b5h,02dh,035h,02ch,03ch,03ch,03ch,03ch,06ch,036h,06ch,036h	; a770  .9.8.-5,<<<<l6l6
	defb 06eh,076h,06eh,076h,04dh,0b2h,04dh,0b2h,07dh,0beh,07dh,0beh,07bh,0deh,07bh,0deh	; a780  nvnvM.M.}.}.{.{.
	defb 015h,0a8h,015h,0a8h,0ceh,073h,00eh,070h,0eeh,077h,00eh,070h,0e0h,007h,000h,000h	; a790  .....s.p.w.p....
	defb 0fch,007h,000h,000h,0e1h,0f1h,001h,0f0h,0cfh,07dh,00fh,07ch,09dh,0c4h,01dh,0c4h	; a7a0  .........}.|....
	defb 0b3h,096h,033h,096h,0b7h,026h,037h,026h,0bfh,00eh,03fh,00eh,088h,09ah,008h,09ah	; a7b0  ..3..&7&..?.....
	defb 097h,07eh,017h,07eh,0bbh,074h,03bh,074h,0b5h,06dh,035h,06ch,082h,0cdh,002h,0cch	; a7c0  .~.~.t;t.m5l....
	defb 0f7h,079h,007h,078h,0f6h,073h,006h,070h,0f0h,007h,000h,000h,0ffh,0ffh,000h,000h	; a7d0  .y.x.s.p........
	defb 0e0h,03fh,000h,000h,0efh,08fh,00fh,080h,0cdh,0e7h,00dh,0e0h,01ch,073h,01ch,070h	; a7e0  .?...........s.p
	defb 06fh,0d9h,06fh,0d8h,077h,0fdh,077h,0fch,069h,004h,069h,004h,01eh,032h,01eh,032h	; a7f0  o.o.w.w.i.i..2.2
	defb 01eh,00ah,01eh,00ah,069h,004h,069h,004h,077h,0fdh,077h,0fch,06fh,0d9h,06fh,0d8h	; a800  ....i.i.w.w.o.o.
	defb 01ch,073h,01ch,070h,0cdh,0e7h,00dh,0e0h,0efh,08fh,00fh,080h,0e0h,03fh,000h,000h	; a810  .s.p.........?..
	defb 0ffh,0ffh,000h,000h,0f0h,007h,000h,000h,0f6h,073h,006h,070h,0f7h,079h,007h,078h	; a820  .........s.p.y.x
	defb 082h,0cdh,002h,0cch,0b5h,06dh,035h,06ch,0bbh,074h,03bh,074h,097h,07eh,017h,07eh	; a830  .....m5l.t;t.~.~
	defb 088h,09ah,008h,09ah,0bfh,00eh,03fh,00eh,0b7h,026h,037h,026h,0b3h,096h,033h,096h	; a840  ......?..&7&..3.
	defb 09dh,0c4h,01dh,0c4h,0cfh,07dh,00fh,07ch,0e1h,0f1h,001h,0f0h,0fch,007h,000h,000h	; a850  .....}.|........
	defb 0e0h,007h,000h,000h,0eeh,077h,00eh,070h,0ceh,073h,00eh,070h,015h,0a8h,015h,0a8h	; a860  .....w.p.s.p....
	defb 07bh,0deh,07bh,0deh,07dh,0beh,07dh,0beh,04dh,0b2h,04dh,0b2h,06eh,076h,06eh,076h	; a870  {.{.}.}.M.M.nvnv
	defb 06ch,036h,06ch,036h,03ch,03ch,03ch,03ch,0b4h,0adh,034h,0ach,09ch,0b9h,01ch,0b8h	; a880  l6l6<<<<..4.....
	defb 0cdh,033h,00dh,030h,0e6h,067h,006h,060h,0f1h,08fh,001h,080h,0fch,03fh,000h,000h	; a890  .3.0.g.`.....?..
	defb 0ffh,0ffh,000h,000h,0e0h,00fh,000h,000h,0ceh,06fh,00eh,060h,09eh,0efh,01eh,0e0h	; a8a0  .........o.`....
	defb 0b3h,041h,033h,040h,0b6h,0adh,036h,0ach,02eh,0ddh,02eh,0dch,07eh,0e9h,07eh,0e8h	; a8b0  .A3@..6.....~.~.
	defb 059h,011h,059h,010h,070h,0fdh,070h,0fch,064h,0edh,064h,0ech,069h,0cdh,069h,0cch	; a8c0  Y.Y.p.p.d.d.i.i.
	defb 023h,0b9h,023h,0b8h,0beh,0f3h,03eh,0f0h,08fh,087h,00fh,080h,0e0h,03fh,000h,000h	; a8d0  #.#...>......?..
	defb 0fch,007h,000h,000h,0f1h,0f7h,001h,0f0h,0e7h,0b3h,007h,0b0h,0ceh,038h,00eh,038h	; a8e0  .............8.8
	defb 09bh,0f6h,01bh,0f6h,0bfh,0eeh,03fh,0eeh,020h,096h,020h,096h,050h,078h,050h,078h	; a8f0  ......?. . .PxPx
	defb 04ch,078h,04ch,078h,020h,096h,020h,096h,0bfh,0eeh,03fh,0eeh,09bh,0f6h,01bh,0f6h	; a900  LxLx . ...?.....
	defb 0ceh,038h,00eh,038h,0e7h,0b3h,007h,0b0h,0f1h,0f7h,001h,0f0h,0fch,007h,000h,000h	; a910  .8.8............
	defb 0e0h,03fh,000h,000h,08fh,087h,00fh,080h,0beh,0f3h,03eh,0f0h,023h,0b9h,023h,0b8h	; a920  .?........>.#.#.
	defb 069h,0cdh,069h,0cch,064h,0edh,064h,0ech,070h,0fdh,070h,0fch,059h,011h,059h,010h	; a930  i.i.d.d.p.p.Y.Y.
	defb 07eh,0e9h,07eh,0e8h,02eh,0ddh,02eh,0dch,0b6h,0adh,036h,0ach,0b3h,041h,033h,040h	; a940  ~.~.......6..A3@
	defb 09eh,0efh,01eh,0e0h,0ceh,06fh,00eh,060h,0e0h,00fh,000h,000h,0ffh,0ffh,000h,000h	; a950  .....o.`........
	defb 0feh,01fh,000h,000h,0fch,0cfh,000h,0c0h,0f9h,0a7h,001h,0a0h,0f3h,053h,003h,050h	; a960  .............S.P
	defb 0e7h,04bh,007h,048h,0edh,00bh,00dh,008h,0cfh,009h,00fh,008h,0dbh,015h,01bh,014h	; a970  .K.H............
	defb 0dbh,0adh,01bh,0ach,0d3h,05dh,013h,05ch,0dfh,06dh,01fh,06ch,0deh,095h,01eh,094h	; a980  .....].\.m.l....
	defb 0ceh,0b1h,00eh,0b0h,0e1h,0dbh,001h,0d8h,0fdh,0dbh,001h,0d8h,0fch,003h,000h,000h	; a990  ................
	defb 0ffh,0ffh,000h,000h,0feh,001h,000h,000h,0f0h,0fdh,000h,0fch,0e7h,0e5h,007h,0e4h	; a9a0  ................
	defb 0cdh,055h,00dh,054h,093h,0a5h,013h,0a4h,0b7h,085h,037h,084h,0bfh,08dh,03fh,08ch	; a9b0  .U.T......7...?.
	defb 09eh,059h,01eh,058h,0c9h,0dbh,009h,0d8h,0d6h,033h,016h,030h,0ceh,097h,00eh,090h	; a9c0  .Y.X.....3.0....
	defb 0ddh,0a7h,01dh,0a0h,0cbh,08fh,00bh,080h,0e3h,03fh,003h,000h,0f8h,07fh,000h,000h	; a9d0  .........?......
	defb 0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0e0h,03fh,000h,000h,0cfh,08fh,00fh,080h	; a9e0  .........?......
	defb 0ddh,0e7h,01dh,0e0h,0dch,073h,01ch,070h,01fh,0d9h,01fh,0d8h,067h,0fch,067h,0fch	; a9f0  .....s.p....g.g.
	defb 079h,006h,079h,006h,066h,01ah,066h,01ah,015h,004h,015h,004h,07ah,089h,07ah,088h	; aa00  y.y.f.f.....z.z.
	defb 067h,073h,067h,070h,00fh,087h,00fh,080h,0e0h,03fh,000h,000h,0ffh,0ffh,000h,000h	; aa10  gsgp.....?......
	defb 0ffh,0ffh,000h,000h,0feh,01fh,000h,000h,0c0h,0cfh,000h,0c0h,095h,0e7h,015h,0e0h	; aa20  ................
	defb 0bbh,09bh,03bh,090h,01dh,0dbh,01dh,0d8h,06dh,0ebh,06dh,0e8h,072h,0f9h,072h,0f8h	; aa30  ..;.....m.m.r.r.
	defb 03ah,0edh,03ah,0ech,083h,01dh,003h,01ch,0d4h,02dh,014h,02ch,0cfh,015h,00fh,014h	; aa40  :.:......-.,....
	defb 0e3h,085h,003h,084h,0f8h,0fdh,000h,0fch,0feh,001h,000h,000h,0ffh,0ffh,000h,000h	; aa50  ................
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
	defb 07fh,0feh,080h,000h,07fh,0feh,07fh,0ffh,000h,000h,0aah,0aah,000h,000h,055h,055h	; ab80  ..............UU
	defb 07fh,0feh,080h,000h,07fh,0feh,07fh,0ffh,000h,000h,0aah,0aah,000h,000h,055h,055h	; ab90  ..............UU
	defb 0ffh,0c0h,000h,000h,0ffh,01ah,000h,01ah,0fch,055h,000h,055h,0f9h,07fh,001h,07fh	; aba0  .........U.U....
	defb 0f2h,0f0h,002h,0f0h,0e5h,085h,005h,081h,0cbh,03ch,00bh,000h,0d6h,07dh,016h,001h	; abb0  .........<...}..
	defb 08ch,0f8h,00ch,000h,0b9h,0e2h,038h,002h,09bh,0c9h,018h,009h,03bh,090h,038h,010h	; abc0  ......8.....;.8.
	defb 053h,0a7h,050h,027h,037h,00ch,030h,00ch,050h,048h,050h,048h,035h,028h,035h,028h	; abd0  S.P'7.0.PHPH5(5(
	defb 007h,0ffh,000h,000h,0b0h,0ffh,0b0h,000h,05ah,03fh,05ah,000h,0fdh,09fh,0fdh,080h	; abe0  ........Z?Z.....
	defb 08fh,04fh,08fh,040h,0a1h,0e7h,081h,0e0h,0bch,0f3h,080h,0f0h,0beh,06bh,080h,068h	; abf0  .O.@.........k.h
	defb 01fh,039h,000h,038h,087h,09dh,080h,01ch,053h,0cdh,050h,00ch,009h,0d4h,008h,014h	; ac00  .9.8....S.P.....
	defb 0e5h,0ceh,0e4h,00eh,030h,0eah,030h,00ah,016h,006h,016h,006h,056h,0aah,056h,0aah	; ac10  ....0.0.....V.V.
	defb 05fh,048h,05fh,048h,030h,029h,030h,029h,057h,00ch,050h,00ch,073h,0b7h,070h,037h	; ac20  _H_H0)0)W.P.s.p7
	defb 03bh,098h,038h,018h,09bh,0cbh,018h,00bh,0a9h,0e3h,028h,003h,09ch,0f8h,01ch,000h	; ac30  ;.8.......(.....
	defb 0d6h,07ch,016h,000h,0cfh,03dh,00fh,001h,0e6h,084h,006h,080h,0f3h,051h,003h,051h	; ac40  .|...=.......Q.Q
	defb 0f9h,0eah,001h,0eah,0fch,07dh,000h,07dh,0ffh,00fh,000h,00fh,0ffh,0e0h,000h,000h	; ac50  .....}.}........
	defb 056h,0f6h,056h,0f6h,096h,00ah,096h,00ah,030h,0e6h,030h,006h,0edh,0ceh,0ech,00eh	; ac60  V.V.....0.0.....
	defb 019h,0d4h,018h,014h,0d3h,0cdh,0d0h,00ch,0c7h,09dh,0c0h,01ch,01fh,029h,000h,028h	; ac70  .............).(
	defb 0beh,05bh,080h,058h,0bch,0b3h,080h,0b0h,0a1h,067h,081h,060h,08ah,0cfh,08ah,0c0h	; ac80  .[.X.....g.`....
	defb 0b7h,09fh,0b7h,080h,05eh,03fh,05eh,000h,0f0h,0ffh,0f0h,000h,007h,0ffh,000h,000h	; ac90  ....^?^.........
	defb 0f0h,0ffh,000h,000h,0c6h,007h,006h,000h,097h,0b1h,017h,0b0h,033h,0bch,033h,0bch	; aca0  ............3.3.
	defb 06eh,036h,06eh,036h,05fh,0d8h,05fh,0d8h,016h,06ch,016h,06ch,0b5h,0eah,035h,0eah	; acb0  n6n6_._..l.l..5.
	defb 0bbh,0deh,03bh,0deh,095h,0fah,015h,0fah,097h,044h,017h,044h,0b8h,0f9h,038h,0f8h	; acc0  ..;......D.D..8.
	defb 0bdh,06bh,03dh,068h,09bh,033h,01bh,030h,0c6h,007h,006h,000h,0f0h,0ffh,000h,000h	; acd0  .k=h.3.0........
	defb 0f0h,01fh,000h,000h,0e7h,043h,007h,040h,08ch,0fbh,00ch,0f8h,02bh,068h,02bh,068h	; ace0  .....C.@....+h+h
	defb 07bh,076h,07bh,076h,07fh,0b6h,07fh,0b6h,04fh,0f6h,04fh,0f6h,03dh,0eeh,03dh,0eeh	; acf0  {v{v....O.O.=.=.
	defb 09bh,0fch,01bh,0fch,0b6h,0eeh,036h,0eeh,097h,01ch,017h,01ch,0dbh,0edh,01bh,0ech	; ad00  ......6.........
	defb 0d5h,0f1h,015h,0f0h,0cfh,077h,00fh,070h,0e7h,007h,007h,000h,0f0h,07fh,000h,000h	; ad10  .....w.p........
	defb 0feh,03fh,000h,000h,086h,0bfh,000h,080h,0b6h,03fh,030h,000h,086h,018h,000h,000h	; ad20  .?.......?0.....
	defb 0f0h,0c2h,000h,0c2h,0f7h,0d0h,007h,0d0h,0e2h,0b9h,002h,0b8h,0edh,0ddh,00dh,0dch	; ad30  ................
	defb 0edh,0d5h,00dh,0d4h,0e7h,0f9h,007h,0f8h,0f7h,063h,007h,060h,081h,077h,001h,070h	; ad40  .........c.`.w.p
	defb 0abh,0a7h,023h,0a0h,089h,087h,001h,080h,0fch,017h,000h,010h,0ffh,0c7h,000h,000h	; ad50  ..#.............
	defb 0dfh,0ffh,000h,000h,0afh,0e3h,020h,000h,0dch,06bh,000h,008h,0c5h,063h,001h,000h	; ad60  ...... ..k...c..
	defb 0d4h,03fh,010h,000h,0c1h,09bh,001h,080h,0fah,0d5h,002h,0c4h,0bbh,095h,003h,084h	; ad70  .?..............
	defb 059h,0dbh,041h,0c0h,040h,018h,040h,000h,0abh,08ah,008h,002h,0e3h,0a8h,000h,020h	; ad80  Y.A.@.@........ 
	defb 0ffh,08fh,000h,000h,0f9h,0ffh,000h,000h,0f6h,0ffh,006h,000h,0f9h,0ffh,000h,000h	; ad90  ................
	defb 0f0h,07fh,000h,000h,0e7h,03fh,007h,000h,0c9h,09fh,009h,080h,0d2h,0cfh,012h,0c0h	; ada0  .....?..........
	defb 090h,0e3h,010h,0e0h,0b0h,0fbh,030h,0f8h,099h,0cbh,019h,0c8h,0aah,0abh,02ah,0a8h	; adb0  ......0.......*.
	defb 0aah,0abh,02ah,0a8h,09ah,0d3h,01ah,0d0h,0cah,0f7h,00ah,0f0h,0e5h,067h,005h,060h	; adc0  ..*..........g.`
	defb 0f5h,08fh,005h,080h,0f5h,0bfh,005h,080h,0f5h,0bfh,005h,080h,0f0h,03fh,000h,000h	; add0  .............?..
	defb 0feh,003h,000h,000h,0fch,0fbh,000h,0f8h,0f1h,00bh,001h,008h,0e5h,02bh,005h,028h	; ade0  .............+.(
	defb 0ebh,00bh,00bh,008h,0ech,01bh,00ch,018h,0e3h,079h,003h,078h,0cbh,04dh,00bh,04ch	; adf0  .........y.x.M.L
	defb 094h,0d5h,014h,0d4h,0b1h,085h,031h,084h,0adh,0f9h,02dh,0f8h,09dh,0f3h,01dh,0f0h	; ae00  ......1...-.....
	defb 0d8h,007h,018h,000h,0c3h,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h	; ae10  ................
	defb 0ffh,0ffh,000h,000h,0fch,00fh,000h,000h,0f9h,0a3h,001h,0a0h,0f2h,079h,002h,078h	; ae20  .............y.x
	defb 007h,0c4h,007h,0c4h,078h,002h,078h,002h,007h,08ah,007h,08ah,078h,046h,078h,046h	; ae30  ....x.x.....xFxF
	defb 077h,0fch,077h,0fch,00eh,079h,00eh,078h,0edh,0b3h,00dh,0b0h,0e6h,027h,006h,020h	; ae40  w.w..y.x.....'. 
	defb 0f1h,0efh,001h,0e0h,0fch,00fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h	; ae50  ................
	defb 0ffh,0ffh,000h,000h,0f0h,0ffh,000h,000h,0c6h,07fh,006h,000h,0dbh,007h,01bh,000h	; ae60  ................
	defb 0dch,0b3h,01ch,0b0h,0cdh,02bh,00dh,028h,0e0h,0d1h,000h,0d0h,0eeh,0dch,00eh,0dch	; ae70  .....+.(........
	defb 0efh,002h,00fh,002h,0edh,0c2h,00dh,0c2h,0ech,04ah,00ch,04ah,0edh,062h,00dh,062h	; ae80  .........J.J.b.b
	defb 0e4h,0feh,004h,0feh,0f3h,080h,003h,080h,0f8h,03fh,000h,000h,0ffh,0ffh,000h,000h	; ae90  .........?......
	defb 0fch,00fh,000h,000h,0fdh,0afh,001h,0a0h,0fdh,0afh,001h,0a0h,0f1h,0afh,001h,0a0h	; aea0  ................
	defb 0e6h,0a7h,006h,0a0h,0efh,053h,00fh,050h,0cbh,059h,00bh,058h,0d5h,055h,015h,054h	; aeb0  .....S.P.Y.X.U.T
	defb 0d5h,055h,015h,054h,0d3h,099h,013h,098h,0dfh,00dh,01fh,00ch,0c7h,009h,007h,008h	; aec0  .U.T............
	defb 0f3h,04bh,003h,048h,0f9h,093h,001h,090h,0fch,0e7h,000h,0e0h,0feh,00fh,000h,000h	; aed0  .K.H............
	defb 0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0c3h,000h,000h,0e0h,01bh,000h,018h	; aee0  ................
	defb 0cfh,0b9h,00fh,0b8h,09fh,0b5h,01fh,0b4h,0a1h,08dh,021h,08ch,0abh,029h,02bh,028h	; aef0  ..........!..)+(
	defb 0b2h,0d3h,032h,0d0h,09eh,0c7h,01eh,0c0h,0d8h,037h,018h,030h,0d0h,0d7h,010h,0d0h	; af00  ..2......7.0....
	defb 0d4h,0a7h,014h,0a0h,0d0h,08fh,010h,080h,0dfh,03fh,01fh,000h,0c0h,07fh,000h,000h	; af10  .........?......
	defb 0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0f0h,03fh,000h,000h,0f7h,08fh,007h,080h	; af20  .........?......
	defb 0e4h,067h,004h,060h,0cdh,0b7h,00dh,0b0h,09eh,070h,01eh,070h,03fh,0eeh,03fh,0eeh	; af30  .g.`.....p.p?.?.
	defb 062h,01eh,062h,01eh,051h,0e0h,051h,0e0h,040h,01eh,040h,01eh,023h,0e0h,023h,0e0h	; af40  b.b.Q.Q.@.@.#.#.
	defb 09eh,04fh,01eh,040h,0c5h,09fh,005h,080h,0f0h,03fh,000h,000h,0ffh,0ffh,000h,000h	; af50  .O.@.....?......
	defb 0ffh,0ffh,000h,000h,0fch,01fh,000h,000h,001h,0cfh,001h,0c0h,07fh,027h,07fh,020h	; af60  .............'. 
	defb 046h,0b7h,046h,0b0h,052h,037h,052h,030h,043h,0b7h,043h,0b0h,040h,0f7h,040h,0f0h	; af70  F.F.R7R0C.C.@.@.
	defb 03bh,077h,03bh,070h,08bh,007h,00bh,000h,0d4h,0b3h,014h,0b0h,0cdh,03bh,00dh,038h	; af80  ;w;p.........;.8
	defb 0e0h,0dbh,000h,0d8h,0feh,063h,000h,060h,0ffh,00fh,000h,000h,0ffh,0ffh,000h,000h	; af90  .....c.`........
	defb 0fch,03fh,000h,000h,0f9h,09fh,001h,080h,0f2h,04fh,002h,040h,0c5h,023h,005h,020h	; afa0  .?.......O.@.#. 
	defb 01ch,038h,01ch,038h,07ch,03eh,07ch,03eh,04eh,072h,04eh,072h,055h,0aah,055h,0aah	; afb0  .8.8|>|>NrNrU.U.
	defb 055h,0aah,055h,0aah,02dh,0b4h,02dh,0b4h,0bdh,0bdh,03dh,0bch,09ah,059h,01ah,058h	; afc0  U.U.-.-...=..Y.X
	defb 0c6h,063h,006h,060h,0f6h,06fh,006h,060h,0f6h,06fh,006h,060h,0f0h,00fh,000h,000h	; afd0  .c.`.o.`.o.`....
	defb 0e3h,0ffh,000h,000h,0c8h,0ffh,008h,000h,09eh,003h,01eh,000h,0a7h,0fbh,027h,0f8h	; afe0  ..............'.
	defb 0abh,0abh,02bh,0a8h,0a3h,00bh,023h,008h,0afh,00bh,02fh,008h,0bch,01bh,03ch,018h	; aff0  ..+...#.../...<.
	defb 0bbh,079h,03bh,078h,087h,07dh,007h,07ch,036h,0cch,036h,0cch,061h,0d6h,061h,0d6h	; b000  .y;x.}.|6.6.a.a.
	defb 045h,084h,045h,084h,00dh,0f9h,00dh,0f8h,0d8h,003h,018h,000h,0c3h,0ffh,000h,000h	; b010  E.E.............
	defb 0fch,00fh,000h,000h,0f1h,0efh,001h,0e0h,0e6h,027h,006h,020h,0edh,0b7h,00dh,0b0h	; b020  .........'. ....
	defb 00eh,073h,00eh,070h,077h,0f9h,077h,0f8h,078h,044h,078h,044h,007h,08ah,007h,08ah	; b030  .s.pw.w.xDxD....
	defb 007h,082h,007h,082h,078h,044h,078h,044h,077h,0f9h,077h,0f8h,00eh,073h,00eh,070h	; b040  ....xDxDw.w..s.p
	defb 0edh,0b7h,00dh,0b0h,0e6h,027h,006h,020h,0f1h,0efh,001h,0e0h,0fch,00fh,000h,000h	; b050  .....'. ........
	defb 0c3h,0ffh,000h,000h,098h,003h,018h,000h,00dh,0f9h,00dh,0f8h,045h,084h,045h,084h	; b060  ............E.E.
	defb 061h,0d6h,061h,0d6h,036h,0cch,036h,0cch,087h,07dh,007h,07ch,0bbh,079h,03bh,078h	; b070  a.a.6.6..}.|.y;x
	defb 0bch,01bh,03ch,018h,0afh,00bh,02fh,008h,0a3h,01bh,023h,018h,0abh,08bh,02bh,088h	; b080  ..<.../...#...+.
	defb 0a7h,0fbh,027h,0f8h,09eh,003h,01eh,000h,0c8h,0ffh,008h,000h,0e3h,0ffh,000h,000h	; b090  ..'.............
	defb 0f0h,00fh,000h,000h,0f6h,06fh,006h,060h,0f6h,06fh,006h,060h,0c6h,063h,006h,060h	; b0a0  .....o.`.o.`.c.`
	defb 09ah,059h,01ah,058h,0bdh,0bdh,03dh,0bch,02dh,0b4h,02dh,0b4h,055h,0aah,055h,0aah	; b0b0  .Y.X..=.-.-.U.U.
	defb 055h,0aah,055h,0aah,04eh,072h,04eh,072h,07ch,03eh,07ch,03eh,01ch,038h,01ch,038h	; b0c0  U.U.NrNr|>|>.8.8
	defb 0c4h,0a3h,004h,0a0h,0f2h,04fh,002h,040h,0f9h,09fh,001h,080h,0fch,03fh,000h,000h	; b0d0  .....O.@.....?..
	defb 0ffh,0c3h,000h,000h,0c0h,01bh,000h,018h,09fh,0b0h,01fh,0b0h,021h,0a2h,021h,0a2h	; b0e0  ............!.!.
	defb 06bh,086h,06bh,086h,033h,06ch,033h,06ch,0beh,0e1h,03eh,0e0h,09eh,0ddh,01eh,0dch	; b0f0  k.k.3l3l..>.....
	defb 0d8h,03dh,018h,03ch,0d0h,0f5h,010h,0f4h,0d0h,0c5h,010h,0c4h,0d5h,0d5h,015h,0d4h	; b100  .=.<............
	defb 0dfh,0e5h,01fh,0e4h,0c0h,079h,000h,078h,0ffh,013h,000h,010h,0ffh,0c7h,000h,000h	; b110  .....y.x........
	defb 0f0h,03fh,000h,000h,0f7h,08fh,007h,080h,0e4h,067h,004h,060h,0edh,0b7h,00dh,0b0h	; b120  .?.......g.`....
	defb 0ceh,070h,00eh,070h,09fh,0eeh,01fh,0eeh,022h,01eh,022h,01eh,041h,0e0h,041h,0e0h	; b130  .p.p....".".A.A.
	defb 051h,0e0h,051h,0e0h,022h,01eh,022h,01eh,09fh,0eeh,01fh,0eeh,0ceh,070h,00eh,070h	; b140  Q.Q."."......p.p
	defb 0edh,0b7h,00dh,0b0h,0e4h,067h,004h,060h,0f7h,08fh,007h,080h,0f0h,03fh,000h,000h	; b150  .....g.`.....?..
	defb 0ffh,0c7h,000h,000h,0ffh,013h,000h,010h,0c0h,079h,000h,078h,0dfh,0e5h,01fh,0e4h	; b160  .........y.x....
	defb 0d1h,0d5h,011h,0d4h,0d8h,0c5h,018h,0c4h,0d0h,0f5h,010h,0f4h,0d8h,03dh,018h,03ch	; b170  .............=.<
	defb 09eh,0ddh,01eh,0dch,0beh,0e1h,03eh,0e0h,033h,06ch,033h,06ch,06bh,086h,06bh,086h	; b180  ......>.3l3lk.k.
	defb 021h,0a2h,021h,0a2h,09fh,0b0h,01fh,0b0h,0c0h,01bh,000h,018h,0ffh,0c3h,000h,000h	; b190  !.!.............
	defb 0feh,00fh,000h,000h,0fch,0e7h,000h,0e0h,0f9h,093h,001h,090h,0f3h,04bh,003h,048h	; b1a0  .............K.H
	defb 0c7h,009h,007h,008h,0dfh,00dh,01fh,00ch,0d3h,099h,013h,098h,0d5h,055h,015h,054h	; b1b0  .............U.T
	defb 0d5h,055h,015h,054h,0cbh,059h,00bh,058h,0efh,053h,00fh,050h,0e6h,0a7h,006h,0a0h	; b1c0  .U.T.Y.X.S.P....
	defb 0f1h,0afh,001h,0a0h,0fdh,0afh,001h,0a0h,0fdh,0afh,001h,0a0h,0fch,00fh,000h,000h	; b1d0  ................
	defb 0ffh,0ffh,000h,000h,0f8h,03fh,000h,000h,0f3h,080h,003h,080h,0e4h,0feh,004h,0feh	; b1e0  .....?..........
	defb 0edh,062h,00dh,062h,0ech,04ah,00ch,04ah,0edh,0c2h,00dh,0c2h,0efh,002h,00fh,002h	; b1f0  .b.b.J.J........
	defb 0eeh,0dch,00eh,0dch,0e0h,0d1h,000h,0d0h,0cdh,02bh,00dh,028h,0dch,0b3h,01ch,0b0h	; b200  .........+.(....
	defb 0dbh,007h,01bh,000h,0c6h,07fh,006h,000h,0f0h,0ffh,000h,000h,0ffh,0ffh,000h,000h	; b210  ................
	defb 0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0fch,00fh,000h,000h,0f1h,0efh,001h,0e0h	; b220  ................
	defb 0e6h,027h,006h,020h,0edh,0b3h,00dh,0b0h,00eh,079h,00eh,078h,077h,0fch,077h,0fch	; b230  .'. .....y.xw.w.
	defb 078h,046h,078h,046h,007h,08ah,007h,08ah,078h,002h,078h,002h,007h,0c4h,007h,0c4h	; b240  xFxF....x.x.....
	defb 0f2h,079h,002h,078h,0f9h,0a3h,001h,0a0h,0fch,00fh,000h,000h,0ffh,0ffh,000h,000h	; b250  .y.x............
	defb 0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h,0c3h,0ffh,000h,000h,0d8h,007h,018h,000h	; b260  ................
	defb 09dh,0f3h,01dh,0f0h,0adh,0f9h,02dh,0f8h,0b1h,085h,031h,084h,094h,0d5h,014h,0d4h	; b270  ......-...1.....
	defb 0cbh,04dh,00bh,04ch,0e3h,079h,003h,078h,0ech,01bh,00ch,018h,0ebh,00bh,00bh,008h	; b280  .M.L.y.x........
	defb 0e5h,02bh,005h,028h,0f1h,00bh,001h,008h,0fch,0fbh,000h,0f8h,0feh,003h,000h,000h	; b290  .+.(............
	defb 0f0h,03fh,000h,000h,0f5h,0bfh,005h,080h,0f5h,0bfh,005h,080h,0f5h,08fh,005h,080h	; b2a0  .?..............
	defb 0e5h,067h,005h,060h,0cah,0f7h,00ah,0f0h,09ah,0d3h,01ah,0d0h,0aah,0abh,02ah,0a8h	; b2b0  .g.`..........*.
	defb 0aah,0abh,02ah,0a8h,099h,0cbh,019h,0c8h,0b0h,0fbh,030h,0f8h,090h,0e3h,010h,0e0h	; b2c0  ..*.......0.....
	defb 0d2h,0cfh,012h,0c0h,0c9h,09fh,009h,080h,0e7h,03fh,007h,000h,0f0h,07fh,000h,000h	; b2d0  .........?......
	defb 0ffh,0ffh,000h,000h,0ffh,00fh,000h,000h,0feh,063h,000h,060h,0e0h,0dbh,000h,0d8h	; b2e0  .........c.`....
	defb 0cdh,03bh,00dh,038h,0d4h,0b3h,014h,0b0h,08bh,007h,00bh,000h,03bh,077h,03bh,070h	; b2f0  .;.8........;w;p
	defb 040h,0f7h,040h,0f0h,043h,0b7h,043h,0b0h,052h,037h,052h,030h,046h,0b7h,046h,0b0h	; b300  @.@.C.C.R7R0F.F.
	defb 07fh,027h,07fh,020h,001h,0cfh,001h,0c0h,0fch,01fh,000h,000h,0ffh,0ffh,000h,000h	; b310  .'. ............
	defb 0ffh,0ffh,000h,000h,0f0h,03fh,000h,000h,0c5h,09fh,005h,080h,09eh,04fh,01eh,040h	; b320  .....?.......O.@
	defb 023h,0e0h,023h,0e0h,040h,01eh,040h,01eh,051h,0e0h,051h,0e0h,062h,01eh,062h,01eh	; b330  #.#.@.@.Q.Q.b.b.
	defb 03fh,0eeh,03fh,0eeh,09eh,070h,01eh,070h,0cdh,0b7h,00dh,0b0h,0e4h,067h,004h,060h	; b340  ?.?..p.p.....g.`
	defb 0f7h,08fh,007h,080h,0f0h,03fh,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h	; b350  .....?..........
	defb 0c0h,07fh,000h,000h,0dfh,03fh,01fh,000h,0d0h,08fh,010h,080h,0d4h,0a7h,014h,0a0h	; b360  .....?..........
	defb 0d0h,0d7h,010h,0d0h,0d8h,037h,018h,030h,09eh,0c7h,01eh,0c0h,0b2h,0d3h,032h,0d0h	; b370  .....7.0......2.
	defb 0abh,029h,02bh,028h,0a1h,08dh,021h,08ch,09fh,0b5h,01fh,0b4h,0cfh,0b9h,00fh,0b8h	; b380  .)+(..!.........
	defb 0e0h,01bh,000h,018h,0ffh,0c3h,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h	; b390  ................
	defb 0feh,07fh,000h,000h,0fch,03fh,000h,000h,0f4h,02fh,000h,000h,0e6h,067h,000h,000h	; b3a0  .....?.../...g..
	defb 0ceh,073h,000h,000h,0ffh,0ffh,000h,000h,09fh,0f9h,000h,000h,006h,060h,000h,000h	; b3b0  .s...........`..
	defb 006h,060h,000h,000h,09fh,0f9h,000h,000h,0ffh,0ffh,000h,000h,0ceh,073h,000h,000h	; b3c0  .`...........s..
	defb 0e6h,067h,000h,000h,0f4h,02fh,000h,000h,0fch,03fh,000h,000h,0feh,07fh,000h,000h	; b3d0  .g.../...?......
	defb 000h,000h,000h,000h,000h,000h,000h,000h,03eh,07ch,000h,000h,03eh,07ch,000h,000h	; b3e0  ........>|..>|..
	defb 03fh,0fch,000h,000h,03eh,07ch,000h,000h,03ch,03ch,000h,000h,0e1h,087h,000h,000h	; b3f0  ?...>|..<<......
	defb 0e1h,087h,000h,000h,03ch,03ch,000h,000h,03eh,07ch,000h,000h,03fh,0fch,000h,000h	; b400  ....<<..>|..?...
	defb 03eh,07ch,000h,000h,03eh,07ch,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; b410  >|..>|..........
	defb 0ffh,0c0h,000h,000h,0ffh,01ah,000h,01ah,0fch,055h,000h,055h,0f9h,07fh,001h,07fh	; b420  .........U.U....
	defb 0f2h,0f0h,002h,0f0h,0e5h,085h,005h,081h,0cbh,03ch,00bh,000h,0d6h,07dh,016h,001h	; b430  .........<...}..
	defb 0cch,0f8h,00ch,000h,099h,0e2h,018h,002h,0abh,0c9h,028h,009h,083h,090h,000h,010h	; b440  ..........(.....
	defb 093h,0a4h,010h,024h,031h,00dh,030h,00dh,054h,049h,054h,049h,03ah,023h,03ah,023h	; b450  ...$1.0.TITI:#:#
	defb 007h,0ffh,000h,000h,0b0h,0ffh,0b0h,000h,05ah,03fh,05ah,000h,0fdh,09fh,0fdh,080h	; b460  ........Z?Z.....
	defb 08fh,04fh,08fh,040h,0a1h,0e7h,081h,0e0h,0bch,0f3h,080h,0f0h,0beh,06bh,080h,068h	; b470  .O.@.........k.h
	defb 03fh,039h,000h,038h,087h,09dh,080h,01ch,057h,0cdh,050h,00ch,007h,0d4h,000h,014h	; b480  ?9.8....W.P.....
	defb 033h,0ceh,030h,00eh,078h,06ah,078h,00ah,0b9h,066h,0b9h,006h,08bh,04ah,08bh,00ah	; b490  3.0.xjx..f...J..
	defb 05dh,043h,05dh,043h,036h,021h,036h,021h,053h,00eh,053h,00eh,071h,05bh,071h,01bh	; b4a0  ]C]C6!6!S.S.q[q.
	defb 038h,05ah,038h,01ah,09bh,0dbh,018h,01bh,0a9h,0c5h,028h,005h,09ch,0f7h,01ch,007h	; b4b0  8Z8.......(.....
	defb 0d6h,070h,016h,000h,0cfh,03eh,00fh,000h,0e6h,087h,006h,080h,0f3h,053h,003h,050h	; b4c0  .p...>.......S.P
	defb 0f9h,0e9h,001h,0e8h,0fch,07ch,000h,07ch,0ffh,00fh,000h,00fh,0ffh,0e0h,000h,000h	; b4d0  .....|.|........
	defb 077h,056h,077h,016h,03bh,04ah,03bh,00ah,0eeh,066h,0eeh,006h,068h,0ceh,068h,00eh	; b4e0  wVw.;J;..f..h.h.
	defb 0deh,0d4h,0deh,014h,03eh,0cdh,03eh,00ch,0d8h,09dh,0d8h,01ch,0e3h,029h,0e0h,028h	; b4f0  ....>.>......).(
	defb 0eeh,05bh,0e0h,058h,00ch,0b3h,000h,0b0h,0e1h,067h,001h,060h,08ah,0cfh,00ah,0c0h	; b500  .[.X.....g.`....
	defb 037h,09fh,037h,080h,05eh,03fh,05eh,000h,0f0h,0ffh,0f0h,000h,007h,0ffh,000h,000h	; b510  7.7.^?^.........
	defb 0ffh,0c0h,000h,000h,0ffh,01ah,000h,01ah,080h,055h,000h,055h,02dh,07fh,02dh,07fh	; b520  .........U.U-.-.
	defb 07ah,0f0h,07ah,0f0h,015h,085h,015h,081h,0cbh,05ch,00bh,040h,0d6h,0c1h,016h,0c1h	; b530  z.z......\.@....
	defb 08dh,0e9h,00dh,0e9h,0b8h,0bbh,038h,0bbh,09ah,07bh,018h,07bh,0abh,070h,028h,070h	; b540  ......8..{.{.p(p
	defb 083h,01fh,000h,01fh,026h,07eh,020h,07eh,052h,0b1h,050h,0b1h,06ah,0edh,068h,0edh	; b550  ....&~ ~R.P.j.h.
	defb 024h,007h,004h,000h,08ah,0b7h,08ah,0b0h,01dh,067h,01dh,060h,086h,08fh,086h,080h	; b560  $........g.`....
	defb 08bh,05fh,08bh,040h,093h,087h,093h,080h,01dh,053h,01dh,050h,0bdh,08bh,0bdh,088h	; b570  ._.@.....S.P....
	defb 0d4h,038h,0d4h,038h,098h,017h,098h,017h,0ech,0beh,0ech,0beh,0efh,0d8h,0efh,0d8h	; b580  .8.8............
	defb 03ch,0feh,03ch,0feh,0dbh,06ah,0dbh,06ah,0ffh,006h,0ffh,006h,0b7h,06ah,0b7h,06ah	; b590  <.<..j.j.....j.j
	defb 032h,01fh,030h,01fh,0b8h,0dbh,038h,0dbh,094h,07bh,014h,07bh,0dah,05ch,01ah,05ch	; b5a0  2.0...8..{.{.\.\
	defb 0cch,0deh,00ch,0deh,0e1h,0e3h,001h,0e3h,0f2h,0f7h,002h,0f7h,0f7h,0a5h,007h,0a5h	; b5b0  ................
	defb 0e3h,085h,003h,085h,0ceh,030h,00eh,000h,09ah,005h,01ah,001h,0bch,051h,03ch,051h	; b5c0  .....0.......Q<Q
	defb 0a9h,0e8h,029h,0e8h,0a0h,07ch,020h,07ch,08fh,00fh,000h,00fh,0ffh,0e0h,000h,000h	; b5d0  ..)..| |........
	defb 075h,0f6h,075h,0f6h,075h,08ah,075h,08ah,0cdh,0c6h,0cdh,0c6h,07bh,06eh,07bh,06eh	; b5e0  u.u.u.u.....{n{n
	defb 0f7h,074h,0f7h,074h,00eh,0adh,00eh,0ach,0b6h,0c5h,0b6h,0c4h,079h,0f1h,079h,0f0h	; b5f0  .t.t........y.y.
	defb 05fh,077h,05fh,070h,06fh,0a3h,06fh,0a0h,06fh,0c9h,06fh,0c8h,0b6h,0ddh,0b6h,0dch	; b600  _w_po.o.o.o.....
	defb 0f8h,0ddh,0f8h,0dch,01dh,0b9h,01dh,0b8h,081h,0f3h,081h,0f0h,03ch,007h,000h,000h	; b610  ............<...
	defb 0ffh,0c0h,000h,000h,0e0h,01bh,000h,01bh,0cah,05bh,00ah,05bh,0ddh,047h,01dh,047h	; b620  .........[.[.G.G
	defb 018h,01fh,018h,01fh,071h,0cch,071h,0cch,06bh,0ebh,06bh,0ebh,053h,033h,053h,033h	; b630  ....q.q.k.k.S3S3
	defb 00eh,0edh,00eh,0edh,0e5h,08fh,005h,08fh,0f3h,06fh,003h,06fh,010h,0ffh,000h,0ffh	; b640  .........o.o....
	defb 046h,0f0h,046h,0f0h,026h,0fdh,026h,0fdh,087h,01dh,007h,01dh,0f1h,0fbh,001h,0fbh	; b650  F.F.&.&.........
	defb 004h,007h,000h,000h,0b1h,071h,0b1h,070h,0cbh,0adh,0cbh,0ach,0dbh,059h,0dbh,058h	; b660  .....q.p.....Y.X
	defb 09ah,0bdh,09ah,0bch,0ebh,06dh,0ebh,06ch,077h,0d9h,077h,0d8h,0b3h,081h,0b3h,080h	; b670  .....m.lw.w.....
	defb 0b5h,0fdh,0b5h,0fch,0b6h,091h,0b6h,090h,0aeh,0cdh,0aeh,0cch,07dh,0ddh,07dh,0dch	; b680  ............}.}.
	defb 0b3h,0a9h,0b3h,0a8h,09bh,061h,09bh,060h,0c3h,0c5h,0c3h,0c4h,098h,0c9h,080h,0c8h	; b690  .....a.`........
	defb 0e3h,087h,003h,087h,0cfh,0e8h,00fh,0e8h,0dah,0eeh,01ah,0eeh,0d6h,0c6h,016h,0c6h	; b6a0  ................
	defb 086h,097h,006h,097h,030h,01eh,030h,01eh,07fh,00eh,07fh,00eh,066h,03ch,066h,03ch	; b6b0  ....0.0.....f<f<
	defb 01eh,0b6h,01eh,036h,056h,026h,056h,026h,074h,08eh,074h,08eh,070h,054h,070h,054h	; b6c0  ...6V&V&t.t.pTpT
	defb 017h,066h,010h,066h,0a7h,006h,020h,006h,08fh,0f4h,000h,004h,0ffh,0f1h,000h,000h	; b6d0  .f.f.. .........
	defb 086h,005h,080h,004h,011h,0e9h,010h,008h,0ddh,0e5h,01ch,004h,044h,031h,004h,000h	; b6e0  ............D1..
	defb 06eh,087h,00eh,080h,066h,0b3h,006h,0b0h,0f3h,03bh,003h,038h,0f6h,0a9h,006h,0a8h	; b6f0  n...f....;.8....
	defb 083h,0f5h,003h,0f4h,0aah,0edh,022h,0ech,02bh,01dh,023h,01ch,048h,0d9h,040h,0d8h	; b700  ......".+.#.H.@.
	defb 01dh,0d3h,001h,0d0h,0fch,007h,000h,000h,0ffh,0ffh,000h,000h,0ffh,0ffh,000h,000h	; b710  ................
	defb 0ffh,0ffh,000h,000h,0f0h,0ffh,000h,000h,086h,03fh,006h,000h,0b6h,09fh,036h,080h	; b720  .........?....6.
	defb 0a7h,0d1h,027h,0c0h,0bdh,095h,03dh,084h,09dh,0b1h,01dh,080h,0bah,03fh,03ah,000h	; b730  ..'...=......?:.
	defb 08eh,0ffh,00eh,000h,0e6h,0e1h,006h,000h,0f0h,0cch,000h,00ch,0ffh,0ddh,000h,01dh	; b740  ................
	defb 0ffh,09fh,000h,01fh,0ffh,0b8h,000h,038h,0ffh,087h,000h,007h,0ffh,0b7h,000h,037h	; b750  .......8.......7
	defb 0ffh,0ffh,000h,000h,0ffh,0c3h,000h,000h,0e3h,019h,000h,018h,0eah,05dh,008h,05ch	; b760  .............].\
	defb 0e2h,0cdh,000h,0cch,0feh,0a9h,000h,0a8h,0feh,07dh,000h,07ch,0c6h,0f5h,000h,0f4h	; b770  .........}.|....
	defb 0d6h,0c9h,010h,0c8h,0c6h,063h,000h,060h,03fh,02fh,000h,020h,0bfh,08fh,080h,000h	; b780  .....c.`?/. ....
	defb 08fh,0ffh,080h,000h,0afh,0ffh,0a0h,000h,06fh,0ffh,060h,000h,04fh,0ffh,040h,000h	; b790  ........o.`.O.@.
	defb 0c7h,0b9h,000h,039h,0d7h,097h,010h,017h,0c4h,00eh,000h,00eh,0fdh,0a8h,001h,088h	; b7a0  ...9............
	defb 0fch,023h,000h,000h,0ffh,0ffh,000h,000h,0c3h,0ffh,000h,000h,098h,0ffh,018h,000h	; b7b0  .#..............
	defb 0bah,063h,03ah,000h,0afh,06bh,02fh,008h,095h,069h,015h,008h,0b6h,04ch,036h,00ch	; b7c0  .c:..k/..i...L6.
	defb 093h,056h,013h,016h,0c6h,052h,006h,012h,0f0h,0cch,000h,00ch,0ffh,0e1h,000h,000h	; b7d0  .V...R..........
	defb 01fh,0ffh,000h,000h,0bfh,0ffh,080h,000h,030h,0f1h,000h,000h,0f6h,0f5h,006h,004h	; b7e0  ........0.......
	defb 0f4h,0f1h,004h,000h,0f1h,0ffh,000h,000h,0ffh,0ffh,000h,000h,0ffh,00fh,000h,000h	; b7f0  ................
	defb 0feh,063h,000h,060h,0feh,0ebh,000h,0e8h,08ch,0dbh,000h,0d8h,0adh,03bh,021h,038h	; b800  .c.`.........;!8
	defb 08ch,0c3h,000h,0c0h,0fdh,0efh,001h,0e0h,0fch,00fh,000h,000h,0ffh,0ffh,000h,000h	; b810  ................
	defb 000h,000h,000h,000h,003h,080h,0e3h,08eh,002h,080h,0bfh,0fah,003h,080h,0e3h,08eh	; b820  ................
	defb 001h,000h,001h,000h,001h,000h,001h,000h,001h,000h,001h,000h,0e3h,08eh,003h,080h	; b830  ................
	defb 0ffh,0fah,003h,080h,0e3h,08eh,003h,080h,001h,000h,001h,000h,001h,000h,001h,000h	; b840  ................
	defb 001h,000h,001h,000h,003h,080h,003h,080h,002h,080h,002h,080h,003h,080h,003h,080h	; b850  ................
	defb 000h,000h,000h,000h,000h,000h,0e0h,00eh,038h,01ch,0a0h,00ah,03fh,0f4h,0e0h,00eh	; b860  ........8...?...
	defb 038h,01ch,040h,004h,010h,008h,040h,004h,010h,008h,040h,004h,010h,008h,0e0h,00eh	; b870  8.@...@...@.....
	defb 010h,008h,0e0h,00eh,010h,008h,0e0h,00eh,010h,008h,040h,004h,038h,01ch,040h,004h	; b880  ..........@.8.@.
	defb 02fh,0f4h,040h,004h,038h,01ch,0e3h,08eh,000h,000h,0beh,0fah,000h,000h,0e3h,08eh	; b890  /.@.8...........
	defb 000h,000h,000h,000h,003h,080h,0e3h,08eh,002h,080h,0beh,0fah,003h,080h,0e3h,08eh	; b8a0  ................
	defb 001h,000h,001h,000h,001h,000h,001h,000h,001h,000h,001h,000h,0e3h,08eh,003h,080h	; b8b0  ................
	defb 0e3h,08ah,003h,080h,0e3h,08eh,003h,080h,041h,004h,001h,000h,041h,004h,001h,000h	; b8c0  ........A...A...
	defb 041h,004h,001h,000h,0e3h,08eh,0e3h,08eh,0beh,0fah,0beh,0fah,0e3h,08eh,0e3h,08eh	; b8d0  A...............
	defb 000h,000h,000h,000h,0e3h,08eh,0e3h,08eh,0a2h,08ah,0beh,0fah,0e3h,08eh,0e3h,08eh	; b8e0  ................
	defb 041h,004h,040h,004h,041h,004h,040h,004h,041h,004h,040h,004h,0e3h,08eh,0e3h,08eh	; b8f0  A.@.A.@.A.@.....
	defb 0feh,0feh,0a3h,08ah,0e3h,08eh,0e3h,08eh,040h,004h,041h,004h,040h,004h,041h,004h	; b900  ........@.A.@.A.
	defb 040h,004h,041h,004h,0e0h,00eh,0e3h,08eh,0a0h,00ah,0bfh,0fah,0e0h,00eh,0e3h,08eh	; b910  @.A.............
	defb 0fch,03fh,000h,000h,0e1h,087h,001h,080h,0cah,0d3h,00ah,0d0h,09ah,0d9h,01ah,0d8h	; b920  .?..............
	defb 0b2h,0cdh,032h,0cch,084h,0e1h,004h,0e0h,039h,07ch,039h,07ch,042h,086h,042h,086h	; b930  ..2.....9|9|B.B.
	defb 05dh,07eh,05dh,07eh,038h,0fch,038h,0fch,084h,0e1h,004h,0e0h,0b2h,0cdh,032h,0cch	; b940  ]~]~8.8.......2.
	defb 09ah,0d9h,01ah,0d8h,0cah,0d3h,00ah,0d0h,0e1h,087h,001h,080h,0fch,03fh,000h,000h	; b950  .............?..
	defb 0f8h,01fh,000h,000h,0e2h,047h,002h,040h,0edh,0b7h,00dh,0b0h,08dh,0b1h,00dh,0b0h	; b960  .....G.@........
	defb 0b5h,0adh,035h,0ach,03bh,0dch,03bh,0dch,046h,062h,046h,062h,03dh,0bch,03dh,0bch	; b970  ..5.;.;.FbFb=.=.
	defb 03dh,0bch,03dh,0bch,046h,062h,046h,062h,03bh,0dch,03bh,0dch,0b5h,0adh,035h,0ach	; b980  =.=.FbFb;.;...5.
	defb 08dh,0b1h,00dh,0b0h,0edh,0b7h,00dh,0b0h,0e2h,047h,002h,040h,0f8h,01fh,000h,000h	; b990  .........G.@....
	defb 0f8h,01fh,000h,000h,0e3h,0c7h,003h,0c0h,0ceh,0b3h,00eh,0b0h,097h,0d9h,017h,0d8h	; b9a0  ................
	defb 0afh,0edh,02fh,0ech,03ch,034h,03ch,034h,079h,09eh,078h,01eh,05bh,0d6h,058h,016h	; b9b0  ../.<4<4y.x.[.X.
	defb 07bh,0deh,078h,01eh,059h,096h,058h,016h,02ch,02ch,02ch,02ch,0b7h,0ddh,037h,0dch	; b9c0  {.x.Y.X.,,,,..7.
	defb 09ah,0b9h,01ah,0b8h,0cfh,0f3h,00fh,0f0h,0e3h,0c7h,003h,0c0h,0f8h,01fh,000h,000h	; b9d0  ................
	defb 0f8h,01fh,000h,000h,0e3h,0c7h,003h,0c0h,0cch,033h,00ch,030h,090h,019h,010h,018h	; b9e0  .........3.0....
	defb 0a2h,0adh,022h,0ach,024h,074h,024h,074h,048h,0beh,048h,0beh,041h,0d6h,041h,0d6h	; b9f0  ..".$t$tH.H.A.A.
	defb 04bh,03eh,04bh,03eh,041h,076h,041h,076h,029h,0ech,029h,0ech,0a5h,05dh,025h,05ch	; ba00  K>K>AvAv).)..]%\
	defb 092h,0b9h,012h,0b8h,0cfh,0f3h,00fh,0f0h,0e3h,0c7h,003h,0c0h,0f8h,01fh,000h,000h	; ba10  ................
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
	defb 004h,004h,004h,000h,000h	; bd80  .....

; ======================================================================
; CODIGO 0xbd85..0xc05c  (727 bytes)
; ======================================================================


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
	ld b,030h		;bdd4   ; Rellena la tabla de las 48 estrellas (0xCB09) con alturas al azar menores de 0xA0
L_BDD6:
	call azar		;bdd6
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
	call L_F5F4		;be00
	ld a,0f1h		;be03
	call L_F634		;be05
	ld a,00ah		;be08
	ld (0d3c1h),a		;be0a
	call L_F2D1		;be0d
	call L_D45E		;be10
	ld a,003h		;be13
	ld (0e156h),a		;be15
	call hud_vidas_zona		;be18
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
	jr nc,hud_reset		;be77
	call L_F445		;be79
	jp L_BDE5		;be7c
hud_reset:		; Pone el marcador de puntos a "000000" (seis 0x30 desde 0xDD80) y lo pinta en 0x12B0, la misma posicion que usa la fase de a pie
	ld hl,0dd80h		;be7f
	ld de,0dd81h		;be82
	ld bc,00005h		;be85
	ld (hl),030h		;be88
	ldir			;be8a
	ld ix,0dd80h		;be8c
	ld de,012b0h		;be90
	call hud_imprime		;be93
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
	ld (de),a		;bede
	inc de			;bedf
	inc hl			;bee0
	call azar		;bee1
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
	ld hl,0edffh		;bf44
	ld de,0ee00h		;bf47
	ld bc,0000dh		;bf4a
	ld (hl),000h		;bf4d
	ldir			;bf4f
	call hud_vidas_zona		;bf51
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

; ----------------------------------------------------------------------
; DATOS relleno: o resto (7 B; 7 bytes)
;   0xc05c..0xc063  (7 bytes)
; ----------------------------------------------------------------------
	defb 03eh,003h,032h,088h,0c1h,018h,02ch	; c05c  >.2...,

; ======================================================================
; CODIGO 0xc063..0xc184  (289 bytes)
; ======================================================================


L_C063:
	jp nave_estado		;c063
nave_estado:		; El despachador del estado de la nave (0xC188): menos de 4 juego normal; igual a 4 arranca la explosion (siembra_particulas) y aparca la nave en 0xFF58; mas de 4 la explosion sigue. El POKE de inmortalidad de Input MSX 19 parchea su jr c de 0xC06E
	ld hl,(0c184h)		;c066
	ld a,(0c188h)		;c069
	cp 004h			;c06c
	jr c,L_C08F		;c06e
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
; CODIGO 0xc189..0xc5bb  (1074 bytes)
; ======================================================================


L_C189:
	call L_D1F5		;c189
	call L_D6EA		;c18c
	ret			;c18f
L_C190:
	ld a,(ix+002h)		;c190
	ld l,(ix+005h)		;c193
	ld h,(ix+006h)		;c196
	ld (hl),a		;c199
	inc a			;c19a
	ld (ix+002h),a		;c19b
	cp 02ch			;c19e
	ret c			;c1a0
	jp nz,L_C678		;c1a1
	ld e,a			;c1a4
	call azar		;c1a5
	and 001h		;c1a8
	add a,e			;c1aa
	ld (ix+002h),a		;c1ab
	ret			;c1ae
L_C1AF:
	ld ix,(0e158h)		;c1af
	ld a,(ix+000h)		;c1b3
	inc ix			;c1b6
	ld (0e158h),ix		;c1b8
	ret			;c1bc
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
	call azar		;c2d4
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
	ld (hl),018h		;c383   ; Pinta una estrella: el patron fijo 0x18 (dos pixeles) donde dicta la tabla de las 48 estrellas de 0xCB09
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
	ldi			;c3f3   ; El blitter de fondo: cuatro ldi por tira de 4 columnas, paso 24, leyendo del pozo de graficos 0x6DE0-0x9ADF; redibuja las tres bandas enteras
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
	jr L_C525		;c4b7
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
	and (hl)		;c4e3   ; Los sprites, con mascara: el and abre el hueco...
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
L_C4FC:
	ld a,h			;c4fc
	ld h,l			;c4fd
	ld l,000h		;c4fe
	jp L_C518		;c500
L_C503:
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
	ex de,hl		;c518
	pop hl			;c519
	or (hl)			;c51a
	ld (hl),a		;c51b   ; ...y el or pinta el sprite encima; el desplazamiento se precalcula con las cadenas de adc
	inc hl			;c51c
	ld a,d			;c51d
	or (hl)			;c51e
	ld (hl),a		;c51f
	inc hl			;c520
	ld a,e			;c521
	or (hl)			;c522
	ld (hl),a		;c523
	pop de			;c524
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
L_C5B5:
	ld h,l			;c5b5
	ld l,000h		;c5b6
	jp L_C5C9		;c5b8

; ----------------------------------------------------------------------
; DATOS relleno: o resto (6 B; 6 bytes)
;   0xc5bb..0xc5c1  (6 bytes)
; ----------------------------------------------------------------------
	defb 0edh,06ah,0edh,06ah,0edh,06ah	; c5bb  .j.j.j

; ======================================================================
; CODIGO 0xc5c1..0xc8d7  (790 bytes)
; ======================================================================


L_C5C1:
	adc hl,hl		;c5c1
	adc hl,hl		;c5c3
	adc hl,hl		;c5c5
	adc hl,hl		;c5c7
L_C5C9:
	ld a,l			;c5c9
	ld c,h			;c5ca
	pop hl			;c5cb
	or (hl)			;c5cc
	ld (hl),a		;c5cd
	dec hl			;c5ce
	ld a,c			;c5cf
	or (hl)			;c5d0
	ld (hl),a		;c5d1
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
siembra_particulas:		; Siembra las 64 particulas de la muerte de la nave, centradas en su posicion (0xC184); tablas 0x5B32/0x5BB2
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
mueve_particulas:		; Mueve y pinta las 64 particulas CON GRAVEDAD (inc d cada cuadro): pixeles sueltos con or (hl) sobre el buffer; las que salen se aparcan en 0xFF00
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
	out (0feh),a		;c665   ; FOSIL DEL SPECTRUM: 0xFE es el puerto del borde del Spectrum; alli cada particula hacia parpadear el borde, en MSX este out no hace nada
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
	ldi			;c77a   ; El decorado que se pinta DESPUES de los sprites (los pilares del pozo 0x69F0-0x6BE7): por esto la nave pasa por detras de los pilares
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
azar:		; El generador de azar: identico al de la segunda parte (lee la ROM del BIOS como tabla de entropia), semilla en 0xCA8F sembrada con ld a,r en el arranque
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
; DATOS datos: muertos: residuo de la grabacion (37 B). Tienen estructura -valores pequenos, 0 a 10, con pinta de variables- pero NADIE los toca: sin referencias directas ni punteros en el binario, y medido con watchpoints de lectura Y escritura sobre la partida COMPLETA de 38 minutos (las siete zonas y la multicarga) mas 350 s de otra partida: cero disparos (tools/omsx_f972.tcl con STARDUST_INI/FIN_R, dump/ca5f y dump/ca5f_araubi). Que fueron antes de morir no se sabe
;   0xca5f..0xca84  (37 bytes)
; DATOS variables: del juego (18 B), con nombre: 0xCA84-0xCA8B la fuente de 8 bytes del escritor de pantalla 0xC6E9 (patrones 00/FF/55/AA, cargada en 0xC6DC); 0xCA8C/8D variables del subsistema de 0xD6xx (los tiles especiales); 0xCA8E variable del arranque (0xBE2C); 0xCA8F/90 el PUNTERO-SEMILLA del generador de azar (ld hl,(0ca8fh) en 0xC840, dentro del RNG L_C83F, el gemelo del 0xAD28 de a pie); 0xCA91/92 variables de estado (0xCA92 la incrementa el alta de objetos en 0xC0F5); 0xCA93-0xCA95 el arranque de la fuente del rotulador 0xC5A8 (cargada en 0xC55B)
;   0xca84..0xca96  (18 bytes)
; DATOS tabla: (228 B; racha 14.03, entropia 1.41, 17 valores: pocos valores para ser un dibujo)
;   0xca96..0xcb7a  (228 bytes)
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
	defb 001h,000h,001h,000h,001h,005h,002h,006h,002h,004h,001h,000h,000h,000h,001h,006h	; ca57  ................
	defb 000h,000h,000h,006h,00ah,002h,006h,002h,00ah,001h,000h,000h,000h,001h,00ah,000h	; ca67  ................
	defb 005h,000h,00ah,001h,000h,001h,000h,001h,006h,002h,003h,002h,006h,000h,0ffh,000h	; ca77  ................
	defb 055h,0aah,0ffh,0ffh,000h,000h,000h,000h,000h,000h,003h,000h,0c3h,03ch,081h,042h	; ca87  U............<.B
	defb 000h,089h,000h,095h,000h,0afh,000h,09dh,081h,04ah,0c3h,03ch,0ffh,000h,0e7h,000h	; ca97  .........J.<....
	defb 0c3h,018h,081h,024h,081h,02ch,0c3h,018h,0e7h,000h,0ffh,000h,0ffh,000h,0c3h,000h	; caa7  ...$.,..........
	defb 081h,018h,081h,03ch,081h,03ch,081h,018h,0c3h,000h,0ffh,000h,0ffh,0ffh,0ffh,0ffh	; cab7  ...<.<..........
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; cac7  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; cad7  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; cae7  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,00eh,000h,020h,000h	; caf7  .............. .
	defb 000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; cb07  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; cb17  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; cb27  ................
	defb 0ffh,0ffh,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; cb37  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; cb47  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; cb57  ................
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; cb67  ................
	defb 0ffh,0ffh,0ffh	; cb77  ...

; ======================================================================
; CODIGO 0xcb7a..0xd3ad  (2099 bytes)
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
	call azar		;cba9
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
	ld ix,lcc32h		;cbeb
	ld (ix+001h),006h	;cbef
	ld (ix+002h),006h	;cbf3
	ld ix,0c93ah		;cbf7
	ld hl,0c952h		;cbfb
	ld a,005h		;cbfe
	call L_CC18		;cc00
	ld ix,lcc32h		;cc03
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
	call azar		;cc92
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
	call azar		;ccda
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
	call azar		;cd39
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
	call azar		;cdfd
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
L_CE73:
	call L_D1F5		;ce73
	ld a,(ix+000h)		;ce76
	cp 02dh			;ce79
	ret c			;ce7b
	ld a,(0d3c5h)		;ce7c
	and a			;ce7f
	ret nz			;ce80
	ld a,(0ca91h)		;ce81
	cp 080h			;ce84
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
	ld (iy+002h),0f9h	;cea2
	ld (iy+003h),l		;cea6
	ld (iy+004h),h		;cea9
	ld (iy+005h),0f2h	;ceac
	ld a,010h		;ceb0
	ld (0d3c6h),a		;ceb2
	xor a			;ceb5
	ld de,0ed55h		;ceb6
	jp L_E18F		;ceb9
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
	call azar		;cf68
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
L_D314:
	call L_D1F5		;d314
	ld a,(ix+002h)		;d317
	cp 046h			;d31a
	jr nz,L_D320		;d31c
	ld a,0ffh		;d31e
L_D320:
	cp 008h			;d320
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
	sla h			;d334
	push hl			;d336
	srl l			;d337
	srl l			;d339
	srl l			;d33b
	call L_C541		;d33d
	ld a,(ix+002h)		;d340
	add a,a			;d343
	add a,004h		;d344
	ld b,a			;d346
	call L_D383		;d347
	ld a,001h		;d34a
	ld de,0eaa1h		;d34c
	call L_E18F		;d34f
	pop hl			;d352
	ld a,(0c188h)		;d353
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
L_D383:
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
	ld a,(de)		;d394
	rrca			;d395
	cpl			;d396
	and (hl)		;d397
	ld (hl),a		;d398
	ld a,(de)		;d399
	or (hl)			;d39a
	ld (hl),a		;d39b
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
	djnz L_D383		;d3aa
	ret			;d3ac

; ----------------------------------------------------------------------
; DATOS tabla: (34 B; racha 3.63, entropia 3.17, 16 valores: pocos valores para ser un dibujo)
;   0xd3ad..0xd3cf  (34 bytes)
; ----------------------------------------------------------------------
	defb 044h,055h,07bh,0dfh,0f6h,0aah,029h,008h,008h,029h,0adh,0fbh,0afh,0dah,052h,042h	; d3ad  DU{...)..)....RB
	defb 0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh,000h,000h,0ffh,0ffh,0ffh,0ffh,0ffh,0ffh	; d3bd  ................
	defb 000h,000h	; d3cd  ..

; ======================================================================
; CODIGO 0xd3cf..0xdac5  (1782 bytes)
; ======================================================================


suma_puntos:		; Suma al marcador de 0xDD80 en ASCII con acarreo decimal a mano (inc a / cp 03ah / sub 00ah) de derecha a izquierda, y repinta con hud_imprime
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
	call hud_imprime		;d3e5
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
	jp hud_vidas_zona		;d417
L_D41A:
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
	add hl,de		;d492
	call vram_pon_dir		;d493
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
	call L_D4E5		;d557
	pop de			;d55a
	add hl,de		;d55b
	pop bc			;d55c
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
	call azar		;d5fc
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
	call azar		;d61f
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
	ld bc,L_D8A3		;d63a
	jp L_D64A		;d63d
L_D640:
	cp 00ah			;d640
	ld bc,L_D8F4		;d642
	jr nz,L_D64A		;d645
	ld bc,L_D8F8		;d647
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
L_D6C5:
	call L_D6EA		;d6c5
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
	xor (hl)		;d6e7
	ld (hl),a		;d6e8
	ret			;d6e9
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
	call hud_vidas_zona		;d758
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
	call azar		;d831
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
	ld hl,ld959h		;d950
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
	call azar		;d997
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
L_D9DB:
	ld a,(0c188h)		;d9db
	cp 004h			;d9de
	ret nc			;d9e0
	ld h,(ix+000h)		;d9e1
	sla h			;d9e4
	ld a,(0c185h)		;d9e6
	ld l,a			;d9e9
	ld de,0380ch		;d9ea
	ld bc,00402h		;d9ed
	call L_CD7A		;d9f0
	ret c			;d9f3
	ld h,(ix+001h)		;d9f4
	ld a,(0c184h)		;d9f7
	ld l,a			;d9fa
	ld d,012h		;d9fb
	ld b,007h		;d9fd
	call L_CD7A		;d9ff
	ret c			;da02
	jp L_D303		;da03
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
L_DA3D:
	ld a,(ix+000h)		;da3d
	cp 00ah			;da40
	ret c			;da42
	xor a			;da43
	ld (0cb04h),a		;da44
	inc a			;da47
	ld (0dac5h),a		;da48
	ld hl,L_DA72		;da4b
	ld (ix+003h),l		;da4e
	ld (ix+004h),h		;da51
	ret			;da54
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
L_DA72:
	call L_DA55		;da72
	ld (ix+000h),000h	;da75
	ret nz			;da79
	ld a,(0c184h)		;da7a
	cp 058h			;da7d
	ret nz			;da7f
	ld a,(0c9a3h)		;da80
	cp 008h			;da83
	ret nz			;da85
	ld hl,L_DA9D		;da86
	ld (0c064h),hl		;da89
	ld hl,ld959h		;da8c
	ld (0d0ddh),hl		;da8f
	ld (0cb04h),a		;da92
	ld a,01fh		;da95
	ld (0c9a3h),a		;da97
	jp L_C678		;da9a
L_DA9D:
	ld hl,(0c184h)		;da9d
	push hl			;daa0
	ld a,008h		;daa1
	call L_C47B		;daa3
	pop hl			;daa6
	ld a,(0c9a3h)		;daa7
	push hl			;daaa
	push af			;daab
	ld h,a			;daac
	ld a,018h		;daad
	call L_C47B		;daaf
	pop af			;dab2
	pop hl			;dab3
	cp 0c8h			;dab4
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
; DATOS textos: del juego: menu, redefinir teclas, records y mensajes
;   0xdac5..0xdf0f  (1098 bytes)
; DATOS tabla: de teclas: 7 entradas de (mascara, valor de puerto)
;   0xdcb1..0xdcbf  (14 bytes)
; DATOS tabla: de zonas: 7 entradas de (puntero, color de SCREEN 2)
;   0xde03..0xde18  (21 bytes)
; DATOS diccionario: de frases del descompresor de niveles
;   0xde18..0xde9a  (130 bytes)
; ----------------------------------------------------------------------
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
; CODIGO 0xdf0f..0xe03d  (302 bytes)
; ======================================================================


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
L_DFD4:
	call L_D1F5		;dfd4
	call azar		;dfd7
	and 01fh		;dfda
	ret nz			;dfdc
	ld hl,L_DFE7		;dfdd
	ld (ix+003h),l		;dfe0
	ld (ix+004h),h		;dfe3
	ret			;dfe6
L_DFE7:
	inc (ix+002h)		;dfe7
	call L_D1F5		;dfea
	ld l,(ix+005h)		;dfed
	ld h,(ix+006h)		;dff0
	inc (hl)		;dff3
	ld a,(hl)		;dff4
	cp 03bh			;dff5
	ret c			;dff7
	ld hl,L_E002		;dff8
	ld (ix+003h),l		;dffb
	ld (ix+004h),h		;dffe
	ret			;e001
L_E002:
	call L_D1F5		;e002
	call azar		;e005
	and 01fh		;e008
	ret nz			;e00a
	ld l,(ix+001h)		;e00b
	ld h,(ix+000h)		;e00e
	sla h			;e011
	ld bc,00c0ch		;e013
	add hl,bc		;e016
	ld b,h			;e017
	ld c,l			;e018
	push bc			;e019
	ld de,(0c184h)		;e01a
	call L_C803		;e01e
	call L_C7D3		;e021
	ex af,af'		;e024
	pop bc			;e025
	call L_CC83		;e026
	ret			;e029
L_E02A:
	call L_D1F5		;e02a
	ld a,(ix+000h)		;e02d
	cp 010h			;e030
	ret c			;e032
	ld hl,0e03dh		;e033
	ld (ix+003h),l		;e036
	ld (ix+004h),h		;e039
	ret			;e03c

; ----------------------------------------------------------------------
; DATOS tabla: (8 B; racha 1.94, entropia 3.00, 8 valores: pocos valores para ser un dibujo)
;   0xe03d..0xe045  (8 bytes)
; ----------------------------------------------------------------------
	defb 0cdh,0f5h,0d1h,03ah,08eh,0cah,0e6h,001h	; e03d  ...:....

; ======================================================================
; CODIGO 0xe045..0xe14e  (265 bytes)
; ======================================================================


L_E045:
	ret nz			;e045
	inc (ix+002h)		;e046
	ld l,(ix+005h)		;e049
	ld h,(ix+006h)		;e04c
	inc (hl)		;e04f
	ld a,(hl)		;e050
	cp 042h			;e051
	ret c			;e053
	ld hl,L_E05E		;e054
	ld (ix+003h),l		;e057
	ld (ix+004h),h		;e05a
	ret			;e05d
L_E05E:
	call L_D1F5		;e05e
	call azar		;e061
	and 01fh		;e064
	ret nz			;e066
	ld l,(ix+001h)		;e067
	ld h,(ix+000h)		;e06a
	sla h			;e06d
	ld bc,00c0ch		;e06f
	add hl,bc		;e072
	ld b,h			;e073
	ld c,l			;e074
	xor a			;e075
	ex af,af'		;e076
	call L_C8AD		;e077
	ret nc			;e07a
	ld a,03fh		;e07b
	ld (ix+002h),a		;e07d
	ld l,(ix+005h)		;e080
	ld h,(ix+006h)		;e083
	ld (hl),a		;e086
	ld hl,0e03dh		;e087
	ld (ix+003h),l		;e08a
	ld (ix+004h),h		;e08d
	ret			;e090
L_E091:
	call L_D9DB		;e091
	ld a,(ix+000h)		;e094
	cp 028h			;e097
	ret nc			;e099
	call azar		;e09a
	and 00fh		;e09d
	ret nz			;e09f
	ld l,(ix+001h)		;e0a0
	ld h,(ix+000h)		;e0a3
	sla h			;e0a6
	ld bc,05008h		;e0a8
	add hl,bc		;e0ab
	ld b,h			;e0ac
	ld c,l			;e0ad
	call azar		;e0ae
	and 004h		;e0b1
	jr z,L_E0BE		;e0b3
	ld a,01eh		;e0b5
	ex af,af'		;e0b7
	call L_CD20		;e0b8
	jp L_E0C4		;e0bb
L_E0BE:
	ld a,01bh		;e0be
	ex af,af'		;e0c0
	call L_C882		;e0c1
L_E0C4:
	ret nc			;e0c4
	ld hl,L_E0CF		;e0c5
	ld (ix+003h),l		;e0c8
	ld (ix+004h),h		;e0cb
	ret			;e0ce
L_E0CF:
	call L_D9DB		;e0cf
	inc (ix+002h)		;e0d2
	ld a,001h		;e0d5
	ld de,0ea98h		;e0d7
	call L_E18F		;e0da
	ld l,(ix+005h)		;e0dd
	ld h,(ix+006h)		;e0e0
	inc (hl)		;e0e3
	ld a,(hl)		;e0e4
	cp 036h			;e0e5
	ret c			;e0e7
	ld a,032h		;e0e8
	ld (hl),a		;e0ea
	ld (ix+002h),a		;e0eb
	ld hl,L_E091		;e0ee
	ld (ix+003h),l		;e0f1
	ld (ix+004h),h		;e0f4
	ret			;e0f7
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
; DATOS tabla: de instrumentos del interprete de sonido: 16 entradas de 15 bytes. El comando L_E4A6 lee el numero de instrumento del guion y copia la entrada (HL = 0xE5E2 + n*15) al estado del canal (ix+0x16 en adelante). Cierra al byte por los dos lados: el codigo de al lado acaba en el ret de 0xE5E1, y 0xE5E2 + 16*15 = 0xE6D2, donde empieza la tabla siguiente
;   0xe5e2..0xe6d2  (240 bytes)
; DATOS tabla: del comando L_E4EF del interprete: entradas de 6 bytes (HL = 0xE6D2 + n*6) que se copian al bloque de 0xEDFF+4, el canal de efectos. Hasta la tabla de notas caben dos entradas enteras y cinco bytes de una tercera; cuantas usa el juego no esta medido
;   0xe6d2..0xe6e3  (17 bytes)
; DATOS tabla: de periodos del PSG: 96 notas cromaticas = OCHO OCTAVAS justas (192 B). Aqui se publico 81 y se quedaba corta: 0xE6E3 + 96*2 = 0xE7A3 cierra al byte contra la tabla de opcodes, y los 30 bytes que sobraban son los 15 periodos mas agudos, decrecientes (0x20, 0x1e, 0x1c...). Lo confirma la musica, que usa la nota 84
;   0xe6e3..0xe7a3  (192 bytes)
; DATOS tabla: de saltos de los QUINCE opcodes del interprete (0x80-0x8E): 15 punteros de 2 B, indexada por el despachador de 0xE230 con `sub 080h`. Aqui puso 35 y estaba mal; el limite lo fija el CALL del propio interprete (ver el bloque de la musica mas abajo)
;   0xe7a3..0xe7c1  (30 bytes)
; DATOS tabla: de las VEINTE frases de musica: 20 punteros de 2 B que lee el comando 0x8C (0xE560: `ld hl,0e7c1h`), no el despachador de opcodes
;   0xe7c1..0xe7e9  (40 bytes)
; DATOS las: CANCIONES y las FRASES, escritas en el lenguaje del propio interprete (1420 B): ver el bloque de abajo. NO es codigo
;   0xe7e9..0xed75  (1420 bytes)
; DATOS variables: a cero del interprete de guiones (175 B): las lee y
;   0xed75..0xee24  (175 bytes)
; ----------------------------------------------------------------------
	defb 001h,00bh,032h,000h,000h,004h,0ffh,008h,000h,000h,000h,003h,000h,000h,000h,002h	; e5e2  ..2.............
	defb 00bh,001h,001h,000h,002h,0ffh,004h,0feh,000h,002h,007h,000h,000h,000h,00ah,000h	; e5f2  ................
	defb 000h,000h,000h,0ffh,000h,000h,000h,000h,003h,000h,000h,000h,000h,001h,00ah,003h	; e602  ................
	defb 003h,000h,00ah,0ffh,001h,0ffh,000h,000h,000h,000h,000h,000h,00bh,00bh,001h,001h	; e612  ................
	defb 000h,001h,0ffh,02ah,0d6h,000h,003h,004h,000h,000h,000h,005h,000h,01eh,000h,000h	; e622  ...*............
	defb 0feh,000h,088h,000h,000h,000h,000h,000h,000h,000h,006h,00ch,01eh,000h,000h,002h	; e632  ................
	defb 0ffh,000h,000h,000h,001h,004h,003h,000h,000h,00ch,00fh,028h,001h,032h,001h,0ffh	; e642  ...........(.2..
	defb 0e9h,000h,017h,003h,003h,000h,000h,000h,00ah,000h,000h,000h,000h,0ffh,000h,000h	; e652  ................
	defb 000h,000h,002h,000h,000h,000h,000h,001h,001h,000h,000h,000h,000h,0f9h,000h,000h	; e662  ................
	defb 000h,003h,000h,000h,000h,000h,006h,000h,000h,000h,000h,0ffh,000h,000h,000h,000h	; e672  ................
	defb 00ah,000h,000h,000h,000h,003h,00ch,000h,000h,000h,001h,0ffh,000h,000h,000h,00ah	; e682  ................
	defb 00ah,000h,000h,000h,001h,006h,00fh,000h,000h,004h,0ffh,014h,000h,000h,000h,003h	; e692  ................
	defb 001h,000h,000h,00fh,000h,000h,000h,000h,0ffh,000h,000h,000h,000h,000h,000h,000h	; e6a2  ................
	defb 000h,000h,00fh,000h,000h,000h,000h,0ffh,000h,000h,000h,000h,004h,000h,000h,000h	; e6b2  ................
	defb 000h,002h,001h,000h,000h,000h,0feh,002h,000h,000h,000h,001h,002h,000h,000h,000h	; e6c2  ................
	defb 020h,000h,001h,000h,002h,000h,001h,008h,010h,0feh,000h,000h,020h,000h,0ffh,000h	; e6d2   ........... ...
	defb 014h,05dh,00dh,09dh,00ch,0e7h,00bh,03ch,00bh,09bh,00ah,003h,00ah,073h,009h,0ebh	; e6e2  .].....<.....s..
	defb 008h,06bh,008h,0f2h,007h,080h,007h,014h,007h,0aeh,006h,04eh,006h,0f4h,005h,09eh	; e6f2  .k.........N....
	defb 005h,04dh,005h,001h,005h,0b9h,004h,075h,004h,035h,004h,0f9h,003h,0c0h,003h,08ah	; e702  .M.....u.5......
	defb 003h,057h,003h,027h,003h,0fah,002h,0cfh,002h,0a7h,002h,081h,002h,05dh,002h,03bh	; e712  .W.'.........].;
	defb 002h,01bh,002h,0fch,001h,0e0h,001h,0c5h,001h,0ach,001h,094h,001h,07dh,001h,068h	; e722  .............}.h
	defb 001h,053h,001h,040h,001h,02eh,001h,01dh,001h,00dh,001h,0feh,000h,0f0h,000h,0e2h	; e732  .S.@............
	defb 000h,0d6h,000h,0cah,000h,0beh,000h,0b4h,000h,0aah,000h,0a0h,000h,097h,000h,08fh	; e742  ................
	defb 000h,087h,000h,07fh,000h,078h,000h,071h,000h,06bh,000h,065h,000h,05fh,000h,05ah	; e752  .....x.q.k.e._.Z
	defb 000h,055h,000h,050h,000h,04ch,000h,047h,000h,043h,000h,040h,000h,03ch,000h,039h	; e762  .U.P.L.G.C.@.<.9
	defb 000h,035h,000h,032h,000h,030h,000h,02dh,000h,02ah,000h,028h,000h,026h,000h,024h	; e772  .5.2.0.-.*.(.&.$
	defb 000h,022h,000h,020h,000h,01eh,000h,01ch,000h,01bh,000h,019h,000h,018h,000h,016h	; e782  .". ............
	defb 000h,015h,000h,014h,000h,013h,000h,012h,000h,011h,000h,010h,000h,00fh,000h,00eh	; e792  ................
	defb 000h,0efh,0e3h,00dh,0e4h,077h,0e4h,0f8h,0e3h,073h,0e4h,045h,0e4h,046h,0e5h,0a6h	; e7a2  .....w...s.E.F..
	defb 0e4h,05fh,0e4h,0efh,0e4h,092h,0e4h,018h,0e4h,04fh,0e5h,06bh,0e5h,07ch,0e5h,046h	; e7b2  ._.......O.k.|.F
	defb 0e8h,0e9h,0e7h,0f6h,0e7h,010h,0e8h,01fh,0e8h,02ch,0e8h,039h,0e8h,08fh,0e8h,0a2h	; e7c2  .........,.9....
	defb 0e8h,0b5h,0e8h,0c8h,0e8h,0dbh,0e8h,02ah,0e9h,071h,0e9h,087h,0e9h,09dh,0e9h,0dch	; e7d2  .......*.q......
	defb 0e9h,0fah,0e9h,014h,0eah,038h,0eah,087h,008h,080h,00fh,083h,010h,018h,080h,00ch	; e7e2  .....8..........
	defb 018h,018h,018h,08dh,081h,008h,087h,00ah,089h,000h,080h,008h,083h,020h,084h,088h	; e7f2  ............. ..
	defb 018h,083h,010h,084h,083h,008h,088h,018h,084h,083h,020h,088h,018h,08dh,087h,009h	; e802  .......... .....
	defb 080h,007h,083h,008h,030h,03ch,048h,054h,037h,043h,04ah,048h,08dh,087h,008h,080h	; e812  ....0<HT7CJH....
	defb 00fh,083h,010h,021h,080h,00ch,021h,021h,021h,08dh,087h,008h,080h,00fh,083h,010h	; e822  ...!..!!!.......
	defb 01dh,080h,00ch,01dh,01dh,01dh,08dh,087h,008h,080h,00fh,083h,010h,01fh,080h,00ch	; e832  ................
	defb 01fh,01fh,01fh,08dh,087h,00bh,083h,010h,087h,00ah,030h,02bh,030h,083h,020h,032h	; e842  ..........0+0. 2
	defb 083h,010h,032h,034h,032h,030h,02dh,02bh,083h,050h,02dh,083h,010h,030h,02bh,030h	; e852  ..2420-+.P-..0+0
	defb 083h,020h,032h,083h,010h,032h,034h,032h,030h,02dh,02bh,083h,050h,02dh,083h,010h	; e862  . 2..2420-+.P-..
	defb 035h,034h,030h,083h,030h,029h,083h,010h,035h,083h,020h,034h,030h,083h,040h,037h	; e872  540.0)..5. 40.@7
	defb 083h,010h,037h,035h,034h,030h,02bh,029h,028h,083h,0a0h,024h,08dh,083h,008h,021h	; e882  ..7540+)(..$...!
	defb 021h,02dh,021h,02bh,02dh,084h,01fh,021h,021h,02dh,021h,02dh,02dh,026h,028h,08dh	; e892  !-!+-..!!-!--&(.
	defb 083h,008h,01dh,01dh,029h,01dh,027h,029h,084h,01bh,01dh,01dh,029h,01dh,027h,018h	; e8a2  ....).')....).'.
	defb 022h,024h,08dh,083h,008h,01ah,01ah,026h,01ah,024h,026h,084h,018h,01ah,01ah,026h	; e8b2  "$.....&.$&....&
	defb 01ah,024h,026h,01fh,021h,08dh,083h,008h,01ch,01ch,028h,01ch,026h,028h,084h,01ah	; e8c2  .$&.!.....(.&(..
	defb 01ch,01ch,028h,023h,026h,028h,01ch,01fh,08dh,087h,00ah,083h,008h,039h,02dh,039h	; e8d2  ..(#&(.......9-9
	defb 02dh,037h,034h,037h,039h,084h,087h,00ch,021h,083h,010h,02bh,083h,020h,021h,087h	; e8e2  -7479...!..+. !.
	defb 00ah,083h,008h,039h,032h,039h,032h,037h,034h,037h,083h,028h,039h,083h,020h,087h	; e8f2  ...9292747.(9. .
	defb 00ch,01fh,087h,00ah,083h,008h,03eh,032h,040h,032h,03eh,03ch,039h,03ch,03eh,032h	; e902  ......>2@2><9<>2
	defb 040h,032h,03eh,03ch,039h,03ch,040h,034h,040h,034h,03eh,03bh,03eh,083h,018h,083h	; e912  @2><9<@4@4>;>...
	defb 028h,040h,083h,020h,087h,00ch,030h,08dh,087h,00bh,08ah,001h,083h,060h,039h,087h	; e922  (@. ..0......`9.
	defb 008h,080h,00dh,083h,008h,03ch,03bh,039h,037h,087h,00bh,080h,00ah,083h,060h,039h	; e932  .....<;97.....`9
	defb 087h,008h,080h,00dh,083h,008h,03ch,03bh,039h,037h,080h,00ah,087h,00bh,083h,060h	; e942  ......<;97.....`
	defb 035h,080h,00dh,087h,008h,083h,008h,035h,039h,03ch,039h,080h,00ah,087h,00bh,083h	; e952  5......59<9.....
	defb 060h,03bh,087h,008h,083h,008h,080h,00dh,040h,034h,03eh,040h,080h,00ah,08dh,087h	; e962  `;......@4>@....
	defb 008h,080h,00fh,083h,010h,018h,080h,00ch,083h,008h,018h,018h,080h,00fh,083h,010h	; e972  ................
	defb 018h,080h,00ch,013h,08dh,087h,008h,080h,00fh,083h,010h,01ah,080h,00ch,083h,008h	; e982  ................
	defb 01ah,01ah,080h,00fh,083h,010h,01ah,080h,00ch,015h,08dh,081h,001h,087h,009h,083h	; e992  ................
	defb 008h,080h,009h,030h,037h,03ch,037h,03eh,03ch,036h,03eh,030h,03ch,036h,037h,083h	; e9a2  ...07<7><6>0<67.
	defb 020h,087h,00ah,081h,008h,088h,00ch,081h,001h,087h,009h,087h,009h,083h,008h,080h	; e9b2   ...............
	defb 009h,030h,037h,03ch,037h,03eh,03ch,036h,03eh,030h,03ch,036h,037h,083h,020h,087h	; e9c2  .07<7><6>0<67. .
	defb 00ah,081h,008h,088h,012h,081h,001h,087h,009h,08dh,087h,00ah,083h,030h,030h,083h	; e9d2  .............00.
	defb 008h,02bh,030h,083h,030h,032h,083h,008h,030h,032h,083h,030h,037h,083h,008h,035h	; e9e2  .+0.02..02.07..5
	defb 034h,083h,010h,035h,034h,030h,02bh,08dh,080h,00ch,087h,00ah,083h,030h,030h,083h	; e9f2  4..540+......00.
	defb 008h,087h,008h,037h,037h,080h,00fh,036h,083h,028h,084h,083h,008h,080h,00dh,02bh	; ea02  ...77..6.(.....+
	defb 02bh,08dh,087h,00fh,08ah,001h,083h,020h,030h,037h,036h,032h,034h,030h,083h,010h	; ea12  +...... 076240..
	defb 030h,03bh,03ah,039h,083h,020h,032h,037h,036h,039h,038h,083h,008h,032h,037h,036h	; ea22  0;:9. 27698..276
	defb 039h,083h,020h,038h,039h,08dh,085h,0a0h,083h,00ch,081h,001h,080h,007h,087h,000h	; ea32  9. 89...........
	defb 050h,08bh,085h,0a0h,083h,019h,081h,001h,080h,007h,087h,001h,08ah,002h,046h,08bh	; ea42  P.............F.
	defb 085h,0a0h,083h,001h,081h,008h,080h,00fh,088h,019h,083h,00ah,080h,00ah,087h,002h	; ea52  ................
	defb 088h,01fh,08bh,085h,0a0h,083h,003h,081h,001h,080h,005h,087h,003h,08ah,002h,05ah	; ea62  ...............Z
	defb 08bh,085h,01eh,083h,005h,081h,001h,080h,000h,087h,004h,08ah,002h,050h,08bh,085h	; ea72  .............P..
	defb 0ffh,083h,002h,081h,008h,080h,00fh,088h,00fh,08bh,085h,0ffh,083h,002h,081h,001h	; ea82  ................
	defb 080h,00fh,087h,005h,02dh,08bh,086h,083h,001h,081h,001h,080h,00ah,05ah,08bh,086h	; ea92  ....-........Z..
	defb 083h,001h,081h,001h,080h,00ah,032h,08bh,086h,080h,00ch,087h,008h,08ah,000h,081h	; eaa2  ......2.........
	defb 001h,083h,004h,08eh,005h,018h,024h,018h,024h,018h,024h,018h,024h,01dh,029h,01fh	; eab2  ......$.$.$.$.).
	defb 02bh,018h,024h,018h,018h,018h,08bh,080h,00ch,087h,008h,08ah,000h,081h,001h,083h	; eac2  +.$.............
	defb 004h,08eh,005h,028h,02bh,030h,02bh,028h,02bh,030h,02bh,02dh,030h,02fh,032h,02bh	; ead2  ...(+0+(+0+-0/2+
	defb 02bh,02bh,08bh,080h,00fh,087h,00fh,08ah,001h,081h,001h,083h,004h,08eh,005h,043h	; eae2  ++.............C
	defb 040h,043h,040h,083h,00ch,043h,083h,004h,040h,083h,010h,03eh,03ch,08bh,086h,083h	; eaf2  @C@..C..@..><...
	defb 01eh,081h,008h,080h,00fh,089h,002h,088h,01eh,083h,050h,087h,00eh,088h,01fh,08bh	; eb02  ..........P.....
	defb 083h,00fh,081h,008h,080h,00fh,088h,01eh,083h,00fh,087h,00dh,088h,01fh,08bh,081h	; eb12  ................
	defb 008h,080h,00fh,083h,00fh,087h,00dh,088h,01fh,08bh,086h,083h,001h,081h,001h,080h	; eb22  ................
	defb 00ah,03ah,084h,084h,084h,08bh,086h,083h,001h,081h,001h,080h,00ah,04ch,084h,082h	; eb32  .:...........L..
	defb 085h,0a0h,083h,014h,081h,009h,080h,000h,087h,006h,089h,000h,088h,080h,028h,08bh	; eb42  ..............(.
	defb 08eh,002h,086h,081h,001h,08ch,001h,08ch,001h,08ch,004h,08ch,004h,08ch,001h,08ch	; eb52  ................
	defb 001h,08ch,004h,08ch,004h,08ch,005h,08ch,005h,08ch,006h,08ch,006h,08ch,001h,08ch	; eb62  ................
	defb 001h,08ch,001h,08ch,001h,086h,081h,001h,08ch,001h,08ch,001h,08ch,004h,08ch,004h	; eb72  ................
	defb 08ch,001h,08ch,001h,08ch,004h,08ch,004h,08ch,005h,08ch,005h,08ch,006h,08ch,006h	; eb82  ................
	defb 08ch,001h,08ch,001h,08ch,001h,08ch,001h,086h,081h,001h,08ch,001h,08ch,001h,08ch	; eb92  ................
	defb 004h,08ch,004h,08ch,001h,08ch,001h,08ch,004h,08ch,004h,08ch,005h,08ch,005h,08ch	; eba2  ................
	defb 006h,08ch,006h,08ch,001h,08ch,001h,08ch,001h,08ch,001h,080h,00dh,08ch,007h,08ch	; ebb2  ................
	defb 008h,08ch,009h,08ch,00ah,08ch,007h,08ch,008h,08ch,009h,08ch,00ah,08ch,007h,08ch	; ebc2  ................
	defb 008h,08ch,009h,08ch,00ah,08ch,007h,08ch,008h,08ch,009h,08ch,00ah,08ch,007h,08ch	; ebd2  ................
	defb 008h,08ch,009h,08ch,00ah,08eh,009h,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00dh,08ch	; ebe2  ................
	defb 00eh,08ch,00eh,08ch,00eh,08ch,00eh,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00dh,08ch	; ebf2  ................
	defb 00eh,08ch,00eh,08ch,00eh,08ch,00eh,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00dh,08ch	; ec02  ................
	defb 00eh,08ch,00eh,08ch,00eh,08ch,00eh,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00dh,08ch	; ec12  ................
	defb 00eh,08ch,00eh,08ch,00eh,08ch,00eh,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00dh,08ch	; ec22  ................
	defb 00eh,08ch,00eh,08ch,00eh,08ch,00eh,08ch,00dh,08ch,00dh,08ch,00dh,08ch,00dh,08ch	; ec32  ................
	defb 00eh,08ch,00eh,08ch,00eh,08ch,00eh,082h,08eh,002h,081h,001h,08ch,003h,08ch,003h	; ec42  ................
	defb 08ch,003h,08ch,003h,08ch,003h,08ch,003h,08ch,003h,08ch,003h,08ch,003h,08ch,003h	; ec52  ................
	defb 08ch,003h,08ch,003h,08ch,003h,08ch,003h,08ch,003h,08ch,003h,080h,00bh,08ch,000h	; ec62  ................
	defb 080h,00ah,08eh,00eh,08ch,000h,08eh,002h,080h,00ah,083h,080h,084h,084h,084h,084h	; ec72  ................
	defb 08ch,00bh,08eh,00eh,08ch,00bh,08eh,002h,08ch,00ch,08eh,0f6h,08ch,00ch,08eh,002h	; ec82  ................
	defb 08eh,009h,080h,00ch,087h,00ah,08ch,010h,08eh,00bh,08ch,010h,08eh,0fdh,080h,00dh	; ec92  ................
	defb 08ch,010h,08eh,0ffh,08ch,010h,08eh,009h,08ch,011h,08ch,011h,08eh,00bh,08ch,011h	; eca2  ................
	defb 08ch,011h,08eh,0fdh,08ch,011h,08ch,011h,08eh,0ffh,08ch,011h,08ch,011h,080h,00fh	; ecb2  ................
	defb 08eh,009h,08ch,012h,08eh,0fdh,08ch,012h,082h,08bh,08ch,002h,08ch,002h,08ch,002h	; ecc2  ................
	defb 08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h	; ecd2  ................
	defb 08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h	; ece2  ................
	defb 08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h	; ecf2  ................
	defb 08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h	; ed02  ................
	defb 08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h,08ch,002h	; ed12  ................
	defb 08ch,002h,08eh,009h,08ch,00fh,08eh,00bh,08ch,00fh,08eh,009h,08ch,00fh,08eh,00bh	; ed22  ................
	defb 08ch,00fh,08eh,009h,08ch,00fh,08eh,00bh,08ch,00fh,08eh,009h,08ch,00fh,08eh,00bh	; ed32  ................
	defb 08ch,00fh,08eh,009h,08ch,00fh,08eh,00bh,08ch,00fh,08eh,009h,08ch,00fh,08eh,00bh	; ed42  ................
	defb 08ch,00fh,082h,085h,0a0h,083h,01eh,081h,001h,080h,003h,087h,007h,014h,08bh,086h	; ed52  ................
	defb 083h,001h,081h,001h,080h,00ah,040h,084h,082h,086h,083h,001h,081h,001h,080h,00ah	; ed62  ......@.........
	defb 034h,084h,082h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; ed72  4...............
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; ed82  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; ed92  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; eda2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; edb2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; edc2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; edd2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; ede2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; edf2  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; ee02  ................
	defb 000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h,000h	; ee12  ................
	defb 000h,000h	; ee22  ..

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
	or 040h			;ee2e
	out (099h),a		;ee30
	pop af			;ee32
	ret			;ee33
L_EE34:
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
	ld a,(hl)		;ee5e
	ld (ix+001h),a		;ee5f
L_EE62:
	ld a,(hl)		;ee62
	cp 0ffh			;ee63
	jr z,creditos		;ee65
	ld (ix+000h),a		;ee67
	inc hl			;ee6a
	ld a,(hl)		;ee6b
	ld (ix+002h),a		;ee6c
	inc hl			;ee6f
	push hl			;ee70
	ld b,001h		;ee71
	call retardo		;ee73
	call L_EFD3		;ee76
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
	call L_F4E4		;ee96
	ld b,0c8h		;ee99
	call retardo		;ee9b
	ld b,0c8h		;ee9e
	call retardo		;eea0
	call creditos_transicion		;eea3
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
	call vram_rellena		;eed4
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
	call vram_rellena		;eeef
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
	call vram_rellena		;ef03
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
	call vram_escribe		;ef31
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
	call vram_escribe		;ef4d
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
	call vram_escribe		;ef62
	ld bc,00040h		;ef65
	add hl,bc		;ef68
	pop bc			;ef69
	djnz L_EF5E		;ef6a
	ret			;ef6c
creditos_transicion:		; Despide el cartel deslizandolo hacia arriba, y lo hace moviendo la tabla de NOMBRES (256 bytes) en vez de los patrones (2048): ocho pasos de 0x20 = una fila. Al final borra los dibujos del tercio y reconstruye la tabla con el intercalado de a 8 de la pantalla de carga
	ld hl,04100h		;ef6d
	ld de,04101h		;ef70
	ld bc,0001fh		;ef73
	ldir			;ef76
	ld de,04000h		;ef78
	ld hl,01900h		;ef7b
	ld bc,00100h		;ef7e
	call vram_lee		;ef81
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
	call vram_escribe		;ef9b
	ld b,00ah		;ef9e
	call retardo		;efa0
	ex af,af'		;efa3
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
	cp 008h			;efc1
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
L_EFD3:
	ld a,(ix+000h)		;efd3
	sub (ix+001h)		;efd6
	ld de,L_F02C		;efd9
	ld hl,L_F07B		;efdc
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
L_F07B:
	ld a,(ix+004h)		;f07b
	and a			;f07e
	ret z			;f07f
L_F080:
	push de			;f080
	pop hl			;f081
	push de			;f082
	inc de			;f083
	ld (hl),000h		;f084
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
	call vram_pon_dir		;f0c2
	push de			;f0c5
	ld a,(0f125h)		;f0c6
	ld b,a			;f0c9
	push hl			;f0ca
L_F0CB:
	ld a,(de)		;f0cb
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
vram_rellena:		; Escribe BC veces el valor de A en VRAM desde HL
	ex af,af'		;f0e7
	call vram_pon_dir		;f0e8
L_F0EB:
	ex af,af'		;f0eb
	out (098h),a		;f0ec
	ex af,af'		;f0ee
	dec bc			;f0ef
	ld a,b			;f0f0
	or c			;f0f1
	jr nz,L_F0EB		;f0f2
	ex af,af'		;f0f4
	ei			;f0f5
	ret			;f0f6
vram_escribe:		; Copia BC bytes de RAM (DE) a VRAM (HL) por el puerto 0x98
	call vram_pon_dir		;f0f7
L_F0FA:
	ld a,(de)		;f0fa
	out (098h),a		;f0fb
	inc de			;f0fd
	dec bc			;f0fe
	ld a,b			;f0ff
	or c			;f100
	jr nz,L_F0FA		;f101
	ei			;f103
	ret			;f104
vram_lee:		; Copia BC bytes de VRAM (HL) a RAM (DE) leyendo del puerto 0x98
	call L_F114		;f105
	and a			;f108
L_F109:
	in a,(098h)		;f109
	ld (de),a		;f10b
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
	out (099h),a		;f118
	ld a,h			;f11a
	and 03fh		;f11b
	out (099h),a		;f11d
	ret			;f11f

; ----------------------------------------------------------------------
; DATOS relleno: o resto (4 B; 4 bytes)
;   0xf120..0xf124  (4 bytes)
; DATOS textos: de la pantalla de creditos (429 B; leidos del binario:
;   0xf124..0xf2d1  (429 bytes)
; ----------------------------------------------------------------------
	defb 000h,000h,000h,000h,000h,000h,000h,001h,000h,001h,000h,001h,000h,002h,000h,002h	; f120  ................
	defb 000h,003h,000h,003h,000h,004h,000h,005h,000h,006h,000h,008h,000h,00ah,000h,00dh	; f130  ................
	defb 000h,010h,001h,010h,002h,010h,003h,010h,005h,010h,007h,010h,009h,010h,00ch,010h	; f140  ................
	defb 00fh,010h,012h,010h,018h,010h,01ch,010h,020h,010h,025h,010h,02ah,010h,02fh,010h	; f150  ........ .%.*./.
	defb 035h,010h,03bh,010h,041h,010h,048h,010h,04fh,010h,056h,010h,05eh,010h,066h,010h	; f160  5.;.A.H.O.V.^.f.
	defb 06eh,010h,077h,010h,080h,010h,089h,010h,093h,010h,09dh,010h,0a7h,010h,0ach,00fh	; f170  n.w.............
	defb 0b3h,008h,0b7h,004h,0b9h,002h,0bah,001h,0bah,001h,0bah,001h,0b9h,002h,0b7h,004h	; f180  ................
	defb 0b3h,008h,0abh,010h,0a1h,010h,097h,010h,08dh,010h,083h,010h,07ah,010h,071h,010h	; f190  ............z.q.
	defb 068h,010h,05fh,010h,057h,010h,04fh,010h,047h,010h,03fh,010h,038h,010h,031h,010h	; f1a0  h._.W.O.G.?.8.1.
	defb 02ah,010h,023h,010h,01dh,010h,017h,010h,011h,010h,00bh,010h,006h,010h,001h,010h	; f1b0  *.#.............
	defb 001h,00bh,001h,008h,001h,005h,001h,003h,001h,002h,001h,002h,001h,001h,001h,001h	; f1c0  ................
	defb 001h,001h,001h,001h,002h,002h,003h,003h,004h,004h,005h,005h,006h,006h,007h,008h	; f1d0  ................
	defb 008h,00ah,009h,00dh,00ah,010h,0ffh,00dh,001h,009h,043h,04fh,04eh,056h,045h,052h	; f1e0  ..........CONVER
	defb 053h,049h,04fh,04eh,020h,050h,04fh,052h,00dh,00dh,001h,009h,020h,043h,041h,052h	; f1f0  SION POR.... CAR
	defb 04ch,04fh,053h,020h,041h,052h,049h,041h,053h,00dh,000h,001h,00ch,047h,052h,041h	; f200  LOS ARIAS....GRA
	defb 046h,049h,043h,04fh,053h,00dh,00dh,001h,006h,04ah,055h,041h,04eh,020h,043h,041h	; f210  FICOS....JUAN CA
	defb 052h,04ch,04fh,053h,020h,059h,020h,04ah,041h,056h,049h,045h,052h,00dh,00dh,001h	; f220  RLOS Y JAVIER...
	defb 00ch,041h,052h,045h,056h,041h,04ch,04fh,00dh,014h,00dh,001h,008h,02eh,02eh,02eh	; f230  .AREVALO........
	defb 041h,044h,045h,04dh,041h,053h,020h,044h,045h,02eh,02eh,02eh,00dh,000h,00dh,00dh	; f240  ADEMAS DE.......
	defb 00dh,001h,00ah,04ah,055h,04ch,049h,04fh,020h,04dh,041h,052h,054h,049h,04eh,00dh	; f250  ...JULIO MARTIN.
	defb 000h,001h,006h,04dh,055h,053h,049h,043h,041h,020h,043h,04fh,04dh,050h,055h,045h	; f260  ...MUSICA COMPUE
	defb 053h,054h,041h,020h,050h,04fh,052h,00dh,00dh,001h,00bh,047h,04fh,04dh,049h,04eh	; f270  STA POR....GOMIN
	defb 04fh,04ch,041h,053h,00dh,000h,001h,00bh,042h,041h,053h,041h,044h,04fh,020h,020h	; f280  OLAS....BASADO  
	defb 045h,04eh,00dh,00dh,001h,007h,055h,04eh,041h,020h,049h,044h,045h,041h,020h,020h	; f290  EN....UNA IDEA  
	defb 04fh,052h,049h,047h,049h,04eh,041h,04ch,00dh,00dh,001h,00fh,044h,045h,00dh,00dh	; f2a0  ORIGINAL....DE..
	defb 001h,007h,04ah,04fh,053h,045h,020h,04dh,041h,04eh,055h,045h,04ch,020h,020h,04dh	; f2b0  ..JOSE MANUEL  M
	defb 055h,026h,04fh,05ah,00dh,000h,054h,04fh,050h,04fh,020h,053h,04fh,046h,054h,00dh	; f2c0  U&OZ..TOPO SOFT.
	defb 000h	; f2d0  .

; ======================================================================
; CODIGO 0xf2d1..0xf393  (194 bytes)
; ======================================================================


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
	call vram_pon_dir		;f387
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
	call suma_puntos		;f39d
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
	cp 038h			;f3bf
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
	call vram_pon_dir		;f402
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
hud_imprime:		; El rotulador del HUD: IX = cadena de indices de glifo terminada en 0, DE = tabla de PATRONES; 8 bytes por glifo desde la fuente de 0x5F00 y +0x40 por glifo, que con la tabla de nombres intercalada de a 8 es la celda contigua
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
	call vram_pon_dir		;f42d
	ld b,008h		;f430
L_F432:
	ld a,(de)		;f432
	out (098h),a		;f433
	inc de			;f435
	and a			;f436
	and a			;f437
	djnz L_F432		;f438
	ei			;f43a
	ld de,00040h		;f43b
	add hl,de		;f43e
	ex de,hl		;f43f
	inc ix			;f440
	jp hud_imprime		;f442
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
	call vram_pon_dir		;f58e
L_F591:
	ld a,07fh		;f591
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
	call vram_pon_dir		;f5b6
	ld b,008h		;f5b9
L_F5BB:
	ld a,(de)		;f5bb
	out (098h),a		;f5bc
	inc de			;f5be
	and a			;f5bf
	and a			;f5c0
	djnz L_F5BB		;f5c1
	ei			;f5c3
	ld bc,00040h		;f5c4
	add hl,bc		;f5c7
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
	call vram_pon_dir		;f610
	ld b,010h		;f613
L_F615:
	ld a,(de)		;f615
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
; DATOS relleno: de la grabacion del master (1311 B): RAM sin inicializar volcada tal cual. Son 00/FF alternados de dos en dos, con una marca y un volteo de fase cada 128 bytes EXACTOS (0xF9A8, 0xFA28, 0xFAA8... el aspecto de una DRAM recien encendida) y una decena de bytes sueltos que la maquina del master ya habia tocado. Remata el bloque justo debajo del buzon de POKEs de 0xFDE8. Medido DOS veces (tools/omsx_f972.tcl): 350 s de partida de naves, y la partida COMPLETA de Araubi (2275 s, multicarga y fase a pie incluidas). En los 38 minutos, las unicas escrituras al tramo son las CUATRO del arranque que instalan los ganchos H.KEYI/H.TIMI (PCs 0xBD98/0xBD9D/0xBDA3, todas en t=449, el final de la carga), y las unicas lecturas los fetches de esos ganchos (0xFD9A/0xFD9F). Nadie usa el resto ni una vez
;   0xf8c8..0xfde7  (1311 bytes)
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
