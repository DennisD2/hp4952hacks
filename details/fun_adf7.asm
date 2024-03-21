; analysis of fun_adf7

__main:
	call fun_adf7

	halt
	org	0a000h
	seek 00000h

var_word_a9bb:
    ; a9bb -> var_byte_var_word_a9bb
	;nop			;a9bb	00 	.
    ;ret po			;a9bc	e0 	.
    defw 0e000h

var_word_a9bd:
    ; a9bd -> var_word_a9bd
	;nop			;a9bd	00 	.
    ;ret pe			;a9be	e8 	.
    defw 0e800h


var_byte_a9c5:
    ; byte variable , initialized with 1
    ; a9c5 -> var_byte_a9c5
	; ld bc,0cd83h		;a9c5	01 83 cd 	. . .
    defb 001h

	org	0a010h
	seek 0010h
;; POI-12 adf7h
;; loads 0x20 (SPACE) and then 0x83 (ASCII Normal attribute) to (h1)
;; this looks like a "clear screen" routine
;;
fun_adf7:
    ; adf7 -> fun_adf7
    ; var_word_a9bd -> hl seems to be some start value for loop (but initially, it is e800)
	ld hl,(var_word_a9bd)		;adf7	2a bd a9 	* . .           ; hl:= ...
	; var_word_a9bb -> de seems to be some end value for loop (but initially, it is e000)
	ld de,(var_word_a9bb)		;adfa	ed 5b bb a9 	. [ . .     ; de:= ...
loop_fun_adf7:
	  ld (hl),020h		;adfe	36 20 	6                           ; (h1):=20h, a SPACE
	  inc l			;ae00	2c 	,                                   ; l++
	  ld (hl),083h		;ae01	36 83 	6 .                         ; (h1):=83, normal text attribute
	  inc hl			;ae03	23 	#                               ; hl++
	  set 7,h		;ae04	cb fc 	. .                             ; set bits 7,6,5 of h
	  set 6,h		;ae06	cb f4 	. .                             ;
	  set 5,h		;ae08	cb ec 	. .                             ;
	  ld a,l			;ae0a	7d 	}                               ; a:=l
	  cp e			;ae0b	bb 	.                                   ; a== reg e ? (calc "a-e", set z flag according to result)
	  jr nz,$-14		;ae0c	20 f0 	  .                         ; if nz (a!=e), jump back to loop_fun_adf7 (not sure)
	 ld a,h			;ae0e	7c 	|                                   ; a:=h
	 cp d			;ae0f	ba 	.                                   ; a== reg d ?
	 jr nz,$-18		;ae10	20 ec 	  .                             ; if nz (a!=d), jump back to loop_fun_adf7 (not sure)
	ld a,001h		;ae12	3e 01 	> .                             ; a:=1
	ld (var_byte_a9c5),a		;ae14	32 c5 a9 	2 . .           ; var_byte_a9c5:=a
	ret			;ae17	c9 	.
