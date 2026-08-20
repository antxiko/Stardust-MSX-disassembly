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


arranque:		; Lo que llama el BASIC con DEFUSR=54000: mapea RAM en las paginas 1 y 2, se copia a la pagina 1 y salta alli
	di			;d2f0   ; Y ya no se vuelven a permitir en toda la carga
	call mapea_la_ram		;d2f1   ; Primero, RAM debajo de las paginas 1 y 2
	ld hl,0d33ah		;d2f4   ; El resto de este mismo bloque
	ld de,04000h		;d2f7   ; A la pagina 1, que acaba de quedar en RAM
	ld bc,0012ch		;d2fa   ; 300 bytes, pero de 0xD33A al final del bloque solo hay 277: los 23 ultimos son lo que hubiera en RAM detras
	ldir		;d2fd
	jp 04000h		;d2ff   ; Y a correr desde alli. Esa copia sobrevive a todo: el bloque del juego se carga en 0x47A0, por encima de estos 300 bytes, y no los toca
mapea_la_ram:		; Deja RAM en las paginas 1 y 2, para tener 48 KB planos de 0x4000 a 0xFFFF
	ld hl,04000h		;d302   ; La pagina 1
	call busca_ram_en_la_pagina		;d305
	ld hl,08000h		;d308   ; La pagina 2
	call busca_ram_en_la_pagina		;d30b
	ret			;d30e   ; La pagina 0 se queda con la ROM, que es de donde sale el ENASLT que usa la busqueda
busca_ram_en_la_pagina:		; Prueba los 16 slots uno por uno y se queda con el primero que aguante una escritura en (HL)
	ld a,080h		;d30f   ; 0x80: slot primario 0, subslot 0, y el bit 7 puesto, que le dice a ENASLT que mire tambien el subslot
	ld c,004h		;d311   ; Cuatro slots primarios que recorrer
prueba_slot_primario:
	and 083h		;d313   ; Deja el bit 7 y el numero de slot primario, y pone a cero los dos bits de subslot
	ld b,004h		;d315   ; Cuatro subslots dentro de cada primario
prueba_este_slot:
	push af			;d317
	push bc			;d318
	push hl			;d319
	call 00024h		;d31a   ; BIOS ENASLT - Switches to specified slot and page definitively | Mapea el slot que dice A en la pagina donde cae HL
	pop hl			;d31d
	ld (hl),020h		;d31e   ; Escribe un valor en el primer byte de la pagina...
	ld a,(hl)			;d320   ; ...y lo lee de vuelta
	cp 020h		;d321
	jr nz,no_hay_ram_aqui		;d323   ; Si no vuelve igual, ahi no hay RAM
	ld (hl),0fah		;d325   ; Y un segundo valor, distinto: con uno solo colaria una ROM que ya lo tuviera puesto
	ld a,(hl)			;d327
	cp 0fah		;d328
	jr z,ram_encontrada		;d32a   ; Los dos han vuelto: es RAM, y se sale dejandola mapeada
no_hay_ram_aqui:
	pop bc			;d32c
	pop af			;d32d
	add a,004h		;d32e   ; Siguiente subslot: son los bits 2 y 3 del identificador
	djnz prueba_este_slot		;d330   ; Los cuatro subslots
	inc a			;d332   ; Agotados, al siguiente slot primario
	dec c			;d333   ; Y los cuatro primarios
	jr nz,prueba_slot_primario		;d334
	ret			;d336   ; Si no encuentra RAM vuelve igual, con el ultimo slot que probo mapeado
ram_encontrada:
	pop bc			;d337   ; Deshace la pila de la vuelta en curso y sale sin tocar el mapeo
	pop af			;d338
	ret			;d339

; ----------------------------------------------------------------------
; DATOS codigo_recolocado: Codigo que se ejecuta recolocado en la pagina 1
;   (0x4000)
;   0xd33a..0xd44f  (277 bytes)

; ----------------------------------------------------------------------
; Lo que sigue son los 277 bytes desensamblados con `org 0x4000`, que es
; donde se ejecutan. Las direcciones de los comentarios son las de
; EJECUCION: a cada una hay que restarle 0x933A para dar con el byte del
; bloque que tiene debajo.
;
; ---- 0x4000: salva el buzon de POKEs y pone la pila ----
; 4000  ld hl,0dac0h    ; 0xDAC0 = 56000, donde escribe el cargador BASIC
; 4003  ld de,0fde8h    ; a memoria alta, por encima de donde acaba el juego
; 4006  ld bc,0005eh    ; 94 bytes
; 4009  ldir            ; el bloque del juego llega hasta 0xFDE6: el buzon sobrevive
; 400b  ld sp,04650h    ; la pila, dentro de la pagina 1 que acaba de mapear
; ----------------------------------------------------------------------
DATA_codigo_recolocado:
	defb 021h,0c0h,0dah,011h,0e8h,0fdh,001h,05eh,000h,0edh,0b0h,031h,050h,046h	; d33a  !......^...1PF

; ----------------------------------------------------------------------
; ---- 0x400E: carga la pantalla de carga y la ejecuta ----
; 400e  ld ix,09b8ch    ; donde va el bloque
; 4012  ld de,030b4h    ; 12468 bytes, el tamano exacto del bloque de la pantalla
; 4015  ld a,000h       ; la bandera que tiene que traer el bloque
; 4017  scf             ; acarreo puesto = cargar
; 4018  call 405ch      ; y a la cinta
; 401b  ld a,082h       ; registro 1 = 0x82: pantalla APAGADA
; 401d  out (099h),a
; 401f  and a / and a   ; dos `and a` de puro relleno entre los dos bytes del par
; 4021  ld a,081h       ; 0x80+1: el registro 1
; 4023  out (099h),a
; 4025  call 09b8ch     ; ejecuta el bloque recien cargado: monta la ilustracion
; 4028  ld a,0c2h       ; registro 1 = 0xC2: pantalla encendida, pero sin la
; 402a  out (099h),a    ;   interrupcion del VDP que 0x9BF4 habia dejado permitida
; 402c  and a / and a
; 402e  ld a,081h
; 4030  out (099h),a
; ----------------------------------------------------------------------
	defb 0ddh,021h,08ch,09bh,011h,0b4h,030h,03eh,000h,037h,0cdh,05ch,040h,03eh,082h,0d3h	; d348  .!....0>.7.\@>..
	defb 099h,0a7h,0a7h,03eh,081h,0d3h,099h,0cdh,08ch,09bh,03eh,0c2h,0d3h,099h,0a7h,0a7h	; d358  ...>......>.....
	defb 03eh,081h,0d3h,099h	; d368

; ----------------------------------------------------------------------
; ---- 0x4032: carga el bloque del juego encima de todo ----
; 4032  di
; 4033  ld ix,047a0h    ; donde va el juego de naves
; 4037  ld de,0b647h    ; 46663 bytes: 0x47A0 + 0xB647 = 0xFDE7, o sea que el
; 403a  ld a,000h       ;   ultimo byte cae en 0xFDE6, justo debajo del buzon
; 403c  scf
; 403d  call 405ch      ; esta carga se lleva por delante la pantalla de carga entera
; ----------------------------------------------------------------------
	defb 0f3h,0ddh,021h,0a0h,047h,011h,047h,0b6h,03eh,000h,037h,0cdh,05ch,040h	; d36c  ..!.G.G.>.7.\@

; ----------------------------------------------------------------------
; ---- 0x4040: el buzon de POKEs ----
; 4040  ld hl,0fde8h    ; los 94 bytes que salvo al principio
; 4043  ld b,003h
; 4045  ld a,(hl)       ; la firma: tres bytes 0xC9
; 4046  cp 0c9h
; 4048  jp nz,0bd85h    ; sin firma, al juego directamente
; 404b  inc hl
; 404c  djnz 4045h
; 404e  ld b,(hl)       ; el cuarto byte dice cuantos parches vienen
; 404f  inc hl
; 4050  ld e,(hl) / inc hl / ld d,(hl) / inc hl   ; direccion del parche
; 4054  ld a,(hl) / inc hl                        ; y el byte que va ahi
; 4056  ld (de),a       ; aplicado
; 4057  djnz 4050h      ; tantos como diga el contador
; 4059  jp 0bd85h       ; y ahora si, al juego
; El contador no se compara con nada: manda entero quien llene el buzon. Los
; 94 bytes que se copian dan para la firma, el contador y treinta parches.
; ----------------------------------------------------------------------
	defb 021h,0e8h,0fdh,006h,003h,07eh,0feh,0c9h,0c2h,085h,0bdh,023h,010h,0f7h,046h,023h	; d37a  !....~.....#..F#
	defb 05eh,023h,056h,023h,07eh,023h,012h,010h,0f7h,0c3h,085h,0bdh	; d38a  ^#V#~#......

; ----------------------------------------------------------------------
; ---- 0x405C: la rutina de carga. Preambulo ----
; Las dos cargas entran por aqui, con IX = destino, DE = cuantos bytes y
; A = la bandera que tiene que traer el bloque.
; 405c  ld hl,04105h    ; se mete la salida en la pila: cualquier `ret` de
; 405f  push hl         ;   aqui abajo cae en 0x4105, no en el llamante
; 4060  push af
; 4061  ld a,008h
; 4063  out (0abh),a    ; PPI: baja el bit 4 del puerto C = MOTOR de la cinta en marcha
; 4065  ld a,00eh
; 4067  out (0a0h),a    ; PSG: deja seleccionado el registro 14, el del puerto A,
; 4069  pop af          ;   cuyo bit 7 es la entrada de la cinta
; 406a  inc d           ; toca D solo para dejar el Z quitado...
; 406b  ex af,af'       ; ...y guarda A (la bandera) y las banderas en el juego alterno
; 406c  dec d           ; D vuelve a lo que era
; 406d  di
; 406e  ld a,005h       ; C lleva el nivel que se espera leer: su bit 7 se va
; 4070  ld c,a          ;   invirtiendo en cada flanco
; 4071  cp a            ; Z puesto, acarreo quitado
; ----------------------------------------------------------------------
	defb 021h,005h,041h,0e5h,0f5h,03eh,008h,0d3h,0abh,03eh,00eh,0d3h,0a0h,0f1h,014h,008h	; d396  !.A..>...>......
	defb 015h,0f3h,03eh,005h,04fh,0bfh	; d3a6

; ----------------------------------------------------------------------
; ---- 0x4072: el piloto y el sincronismo ----
; 4072  call 40e2h      ; espera a un flanco cualquiera
; 4075  jr nc,4072h     ; si se agoto la cuenta, a esperar otra vez
; 4077  ld hl,00415h    ; 1045 pasadas del djnz de abajo: una espera larga que
; 407a  djnz 407ah      ;   deja pasar un buen trozo de piloto antes de medir nada
; 407c  dec hl
; 407d  ld a,h / or l
; 407f  jr nz,407ah
; 4081  call 40deh      ; un ciclo entero (dos flancos)
; 4084  jr nc,4072h
; 4086  ld b,09ch       ; y ahora 256 ciclos de piloto seguidos, midiendolos:
; 4088  call 40deh      ;   la cuenta arranca en 0x9C y tiene que pasar de 0xC6,
; 408b  jr nc,4072h     ;   o sea que el ciclo tiene que durar lo que dura el piloto
; 408d  ld a,0c6h
; 408f  cp b
; 4090  jr nc,4072h     ; demasiado corto: no era piloto, a empezar de cero
; 4092  inc h           ; H cuenta los ciclos buenos
; 4093  jr nz,4086h     ; hacen falta 256 para dar el piloto por bueno
; 4095  ld b,0c9h       ; a partir de aqui se busca el primer medio ciclo CORTO,
; 4097  call 40e2h      ;   que es el sincronismo: la cuenta no debe llegar a 0xD4
; 409a  jr nc,4072h
; 409c  ld a,b
; 409d  cp 0d4h
; 409f  jr nc,4095h     ; todavia es piloto: sigue mirando
; 40a1  call 40e2h      ; el segundo medio ciclo del sincronismo
; 40a4  ret nc
; 40a5  ld h,000h       ; H = el XOR de comprobacion, que empieza a cero
; 40a7  ld b,0b0h
; 40a9  jr 40c3h        ; y de cabeza a leer el primer byte, que es la bandera
; ----------------------------------------------------------------------
	defb 0cdh,0e2h,040h,030h,0fbh,021h,015h,004h,010h,0feh,02bh,07ch,0b5h,020h,0f9h,0cdh	; d3ac  ..@0.!....+|. ..
	defb 0deh,040h,030h,0ech,006h,09ch,0cdh,0deh,040h,030h,0e5h,03eh,0c6h,0b8h,030h,0e0h	; d3bc  .@0.....@0.>..0.
	defb 024h,020h,0f1h,006h,0c9h,0cdh,0e2h,040h,030h,0d6h,078h,0feh,0d4h,030h,0f4h,0cdh	; d3cc  $ .....@0.x..0..
	defb 0e2h,040h,0d0h,026h,000h,006h,0b0h,018h,018h	; d3dc  .@.&.....

; ----------------------------------------------------------------------
; ---- 0x40AB: el bucle de bytes ----
; 40ab  ex af,af'       ; recupera las banderas de la entrada
; 40ac  jr nz,40b3h     ; la PRIMERA vuelta va por 0x40B3: el byte leido es la bandera
; 40ae  ld (ix+000h),l  ; las demas guardan el byte en su sitio
; 40b1  jr 40bdh
; 40b3  rr c            ; guarda el acarreo dentro de C
; 40b5  xor l           ; y compara la bandera leida con la que pidio el llamante
; 40b6  ret nz          ; no es el bloque que se buscaba: fuera
; 40b7  ld a,c / rla / ld c,a   ; devuelve el acarreo a su sitio
; 40ba  inc de          ; la bandera no cuenta como byte del bloque
; 40bb  jr 40bfh        ;   (el `dec de` de abajo lo compensa)
; 40bd  inc ix          ; siguiente byte del destino
; 40bf  dec de          ; y uno menos por leer
; 40c0  ex af,af'       ; guarda las banderas otra vez; el `xor l` de la bandera
; 40c1  ld b,0b2h       ;   dejo el Z puesto, asi que ya no se vuelve a 0x40B3
; 40c3  ld l,001h       ; el 1 es el testigo: cuando se sale por arriba, hay byte
; 40c5  call 40deh      ; un ciclo entero por cada bit
; 40c8  ret nc          ; se acabo la cinta
; 40c9  ld a,0cbh       ; ciclo largo o corto: ese es el bit
; 40cb  cp b
; 40cc  rl l            ; que entra por abajo
; 40ce  ld b,0b0h
; 40d0  jp nc,40c5h     ; hasta que el testigo se sale: ocho bits
; 40d3  ld a,h / xor l / ld h,a   ; el byte entra en el XOR de comprobacion
; 40d6  ld a,d / or e
; 40d8  jr nz,40abh     ; y a por el siguiente
; 40da  ld a,h          ; con DE agotado, el ultimo byte leido era el XOR del bloque:
; 40db  cp 001h         ;   si todo cuadra H vale 0 y esto vuelve con acarreo
; 40dd  ret
; Ese acarreo no lo mira NADIE: ni la carga de 0x4018 ni la de 0x403D lo
; comprueban. Este cargador no tiene reintento ni aviso de error; si la
; cinta falla, sigue adelante con lo que haya quedado en memoria.
; ----------------------------------------------------------------------
	defb 008h,020h,005h,0ddh,075h,000h,018h,00ah,0cbh,019h,0adh,0c0h,079h,017h,04fh,013h	; d3e5  . ..u.......y.O.
	defb 018h,002h,0ddh,023h,01bh,008h,006h,0b2h,02eh,001h,0cdh,0deh,040h,0d0h,03eh,0cbh	; d3f5  ...#........@.>.
	defb 0b8h,0cbh,015h,006h,0b0h,0d2h,0c5h,040h,07ch,0adh,067h,07ah,0b3h,020h,0d1h,07ch	; d405  .......@|.gz. .|
	defb 0feh,001h,0c9h	; d415

; ----------------------------------------------------------------------
; ---- 0x40DE: medir un flanco ----
; 40de  call 40e2h      ; dos flancos seguidos, o sea un ciclo entero
; 40e1  ret nc
; 40e2  ld a,016h       ; 22 vueltas de espera antes de ponerse a mirar
; 40e4  dec a
; 40e5  jr nz,40e4h
; 40e7  and a           ; quita el acarreo: sin flanco se vuelve con el quitado
; 40e8  inc b           ; B cuenta lo que tarda en llegar el flanco
; 40e9  nop
; 40ea  ret z           ; si B da la vuelta, se acabo el tiempo
; 40eb  ld a,000h       ; este ld a,000h no sirve de nada: el `in` de la linea
; 40ed  in a,(0a2h)     ;   siguiente pisa A. Lee el puerto A del PSG...
; 40ef  cpl
; 40f0  xor c           ; ...y compara su bit 7 con el nivel que se espera
; 40f1  and 080h
; 40f3  jp z,40e8h      ; sigue igual: a contar otra vuelta
; 40f6  ld a,c / cpl / ld c,a   ; ha cambiado: el nivel que toca ahora es el contrario
; 40f9  ld a,r          ; y de paso el borde cambia de color con el registro de
; 40fb  and 00fh        ;   refresco, que es lo mas parecido a un numero al azar
; 40fd  out (099h),a    ;   que hay a mano
; 40ff  ld a,087h       ; 0x80+7: el registro 7 del VDP, el color del borde
; 4101  out (099h),a
; 4103  scf             ; acarreo puesto = flanco encontrado
; 4104  ret
; Aqui esta la unica diferencia de fondo con la maquina de origen: donde
; el ZX Spectrum saca el color por el puerto 0xFE, esto lo saca por el
; registro 7 del VDP, que es el unico borde que tiene el MSX.
; ----------------------------------------------------------------------
	defb 0cdh,0e2h,040h,0d0h,03eh,016h,03dh,020h,0fdh,0a7h,004h,000h,0c8h,03eh,000h,0dbh	; d418  ..@.>.= .....>..
	defb 0a2h,02fh,0a9h,0e6h,080h,0cah,0e8h,040h,079h,02fh,04fh,0edh,05fh,0e6h,00fh,0d3h	; d428  ./.....@y/O._...
	defb 099h,03eh,087h,0d3h,099h,037h,0c9h	; d438

; ----------------------------------------------------------------------
; ---- 0x4105: la salida ----
; Cae aqui cualquier `ret` de la rutina de carga, que se lo dejo puesto en
; la pila. El `ret` del final es el que devuelve el control al llamante.
; 4105  ld e,013h       ; E no lo lee nadie despues
; 4107  ld a,009h
; 4109  out (0abh),a    ; sube el bit 4 del puerto C: MOTOR parado
; 410b  ld a,001h       ; y el borde a negro, que deja de parpadear
; 410d  out (099h),a
; 410f  ld a,087h       ; 0x80+7: el registro 7 del VDP
; 4111  out (099h),a
; 4113  ret
; ----------------------------------------------------------------------
	defb 01eh,013h,03eh,009h,0d3h,0abh,03eh,001h,0d3h,099h,03eh,087h,0d3h,099h,0c9h	; d43f  ..>...>...>....

; ----------------------------------------------------------------------
; ---- 0x4114: el ultimo byte ----
; Un byte suelto detras del `ret`. Los 23 que le siguen hasta completar los
; 300 del LDIR no estan en la cinta: salen de lo que hubiera en RAM.
; ----------------------------------------------------------------------
	defb 068h	; d44e
