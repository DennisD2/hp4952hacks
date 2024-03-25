    .area STRAP7 (ABS)
    .module strap7_splash
    ;; _splash_start function
    ;; Relocated at runtime from 0xa800 to 02000
	;.org 0x2000
	;seek 00800h
	; TODO POI021 - I do not understand whats happening in original.
	; there, _dll_stub is located at and behind 0x800, due to seek 0x800
	; with SDCC, there is no seek and so a ".org 0x2000" would put the ocde to 0x2000
	; Currently I just define .org to 0x800 to have the bytes at correct place.
	; it this is copied later and then has wrong addresses somehow, how to solve?
	.org 0x800

	.globl _splash_start
	.globl _splash_screen_data
	.globl _p_mm_launch_app
    .globl _p_main_menu_page_one
    .globl _launch_app

_splash_start:
	call 0x1543			; Patched to 2d32 -> 01543
	call 0x0fe9			; Patched to 2e6e -> 00fe9
	call 0x0085			; Patched to 2d4a -> 00085
	call l20x65			;
	ld hl,#_splash_screen_data	;
	push hl				;
	call 0x1cf8			; Patched to 2d50 -> 01cf8
	pop hl				;
	call l20x32			;
	call 0x007e			; Patched to 2d6c -> 0007e

	ld a,#0x06			; Load Page 6 (Application RAM)
	call 0x0e60			; Patched to 2d02 -> 00e60

	ld de,#0xa800			;
	ld hl,#0x2000			; Copy tis section back to A800
	ld bc,#0x0200			; now tat it is Patched
	ldir				;

	ld a,#0x02			; Load Page 2
	call 0x0e60			; Patched to 2d02 -> 00e60

	jp 0x14d5			; Return via call -> 02e32 -> 014d5

l20x32:
	ld a,#0x02			; Load Page 2 (10046 ROM)
	call 0x0e60			;
	ld hl,#_splash_screen_data	;
; TODO POI011
ld (0x761d),a
;	ld (0x761d),l			; Screen Paint Script Location
	ld hl,(0x761f)			; Copy main menu pointers
	ld de,#_p_main_menu_page_one	; over the first page menu
	ld (0x761f),de			; pointers in our table
	ld (0x7624),de			;
	ld bc,#0x000e			;
	ldir				;

	ld a,(hl)			;
	inc hl				;
	ld h,(hl)			;
	ld l,a				;
	inc hl				; Skip to page two...
	inc hl				;
	ld de,#_p_mm_reset		;
	ld bc,#0x000c			;
	ldir				;

	ld hl,#_launch_app		; Patch our application vector
	ld (#_p_mm_launch_app),hl	; for button five on page two
	ret				;

l20x65:
	ld a,#0x06			; Patch 00fd4 -> our menu display function
	ld (0x0fd4),a			;
	ld hl,#0xa196			;
	ld (0x0fd5),hl			;
	ret				;
