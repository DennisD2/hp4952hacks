;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;
; This is a simple version of printf.  It works on a null-terminated
; format string, with the following parameter types:
;
; %s	null-terminated ASCII string
; %d	single-byte unsigned int
; %c    ASCII character
;
; The single-byte unsigned int is printed in decimal, with leading
; zeroes dropped.  To print single '%' characters, double them up
; (e.g. "%%").
;
; Parameters are pushed onto the stack in reverse order, format string
; last.
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_printf:
	pop bc
	pop hl
_charloop:
	ld a,(hl)
	cp #0x00
	jr z,_nullterm
	cp #'%'				; this is a parameter
	jr z,_parameter
	call _writechar + #x_org_splash			; this is just a plain ol' ASCII character
_nextchar:
	inc hl
	jr _charloop

_nullterm:
	push bc
	ret

_parameter:
	inc hl				; get the next char, which is the type
	ld a,(hl)
	cp #'%'
	jr z,_prcent		; a plain '%' character
	cp #'c'
	jr z,_prchr			; a single ASCII character
	cp #'s'
	jr z,_prstr			; a string
	cp #'d'
	jr z,_prdec			; a number (8-bit)
	cp #'x'
	jr z,_prhex			; a number (8-bit)

_prstr:
	pop de				; print a simple null-terminated string
_nextcharstring:
	ld a,(de)
	cp #0x00
	jr z,_nulltermstring
	call _writechar + #x_org_splash		
	inc de
	jr _nextcharstring
_nulltermstring:
	jr _nextchar

_prcent:
	call _writechar	+ x_org_splash		; it's a simple '%' character
	jr _nextchar

_prchr:
	pop de				; print an ASCII character
	ld a,e
	call _writechar + #x_org_splash		
	jr _nextchar

_prdec:
	pop de
	push hl				; we'll be needing this later
	ld a,e
	ld hl,#_hundreds + #x_org_splash				; reset the place counts
	ld (hl),#0x00
	ld hl,#_tens + #x_org_splash
	ld (hl),#0x00
	ld hl,#_ones + #x_org_splash
	ld (hl),#0x00

_dohundreds:			; count the hundreds in the number
	ld d,#0x64
	ld hl,#_hundreds + #x_org_splash
_nexthundred:
	sub d
	jr c,#_dotens
	inc (hl)
	jr _nexthundred

_dotens:				; count the tens in the number
	add d
	ld d,#0x0a
	ld hl,#_tens + #x_org_splash
_nextten:
	sub d
	jr c,#_doones
	inc (hl)
	jr _nextten

_doones:				; whatever is left is the ones
	add d
	ld (_ones + #x_org_splash),a

	ld d,#0x0

_printhundreds:
	ld a,(_hundreds + #x_org_splash)
	cp #0x00
	jr z,_printtens		; skip leading zeroes
	add a,#0x30 			; print the hundreds
	call _writechar + #x_org_splash		
	ld d,#0x1

_printtens:
	ld a,(_tens + #x_org_splash	)
	add d
	cp #0x00
	jr z,_printones		; skip leading zeroes
	sub d
	ld d,#0x1
	add a,#0x30 			; print the tens
	call _writechar + #x_org_splash		

_printones:
	ld a,(_ones + #x_org_splash)
	add a,#0x30 			; print the ones
	call _writechar + #x_org_splash		

	pop hl				; take hl back off the stack, oh for more registers
	jp _nextchar + #x_org_splash

_prhex:
	pop de
	push hl				; we'll be needing this later
	ld a,e
	ld hl,#_tens + #x_org_splash
	ld (hl),#0x00
	ld hl,#_ones + #x_org_splash
	ld (hl),#0x00

_dohexh:
	ld d,#0x10
	ld hl,#_tens + #x_org_splash
_nexthexh:
	sub d
	jr c,_dohexl
	inc (hl)
	jr _nexthexh

_dohexl:				; whatever is left is the ones
	add d
	ld (_ones + #x_org_splash),a

	ld d,#0x0

_prhexh:
	ld a,(_tens + #x_org_splash)
	cp #0x0a
	jp p,_prhexha + #x_org_splash			; alphas
	add a,#0x30 			; print the tens
	call _writechar + #x_org_splash		
	jr _prhexl

_prhexha:
	add a,#0x37
	call _writechar + #x_org_splash

_prhexl:
	ld a,(_ones + #x_org_splash)
	cp #0x0a
	jp p,_prhexla + #x_org_splash			; alphas
	add a,#0x30 			; print the ones
	call _writechar + #x_org_splash		
	jr _prhexdone

_prhexla:
	add a,#0x37
	call _writechar + #x_org_splash		

_prhexdone:
	pop hl				; take hl back off the stack, oh for more registers
	jp _nextchar + #x_org_splash


_hundreds:
	.db 0x00

_tens:
	.db 0x00

_ones:
	.db 0x00