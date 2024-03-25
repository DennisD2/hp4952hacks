    .area STRAP4 (ABS)
    .module strap4_dll_stub
    ;; _dll_stub function
;; 54 Bytes - Relocated at runtime to 0x2a00 and executed
	;.org 0x2a00
	;seek 00210h
	; TODO POI020 - I do not understand whats happening in original.
	; there, _dll_stub is located at and behind 0x210, due to seek 0x210
	; with SDCC, there is no seek and so a ".org 0x2a00" would put the ocde to 0x2a00
	; Currently I just define .org to 0x210 to have the bytes at correct place.
	; it this is copied later and then has wrong addresses somehow, how to solve?
    .org 0x210

_dll_stub::
	ld a,#0x04			; Access Page 4 - 10046 ROM Lower Page
	out (0x20),a		;
	ld hl,#0x8000		; Copy system ordinals from 10046 ROM
	ld de,#0x2d00		;
	ld bc,#0x0134		;
	ldir				;
	ld a,#0x02			; Access Page 2 - Application "ROM"
	out (0x20),a		;

	ld hl,(0x2d0c)		; Generate 17 more for 02e34 = 0d9f0...0da20
	ld bc,#0x0003		;
	ld a,#0x11			; .. Source appears to be a jump table
	call la246h			;

	ld hl,(0x2e16)		; Generate 68 more for 02e56 =
	ld a,(hl)			;
	inc hl				; .. (some FM going on here...)
	ld h,(hl)			;
	ld l,a				;
	ld bc,#0x0006		;
	ld a,#0x44			;
	call 0xa246			;

	ld bc,#0x0002		; Generate 30 more for 02ede = 0eb98..
	ld a,#0x1e			;
	call la246h			;
	ret				    ;
