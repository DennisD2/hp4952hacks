;; Entry Point
	.org 0xa147
	.db 0x000
_entryaddr:
	.word #__init

;; Main Application
	.org 0xa150
	.word #_launch_app

;; ???
	.org 0xa17e
	.word #0xf958

;; Dynamic link loader data pointer & size
	.org 0xa180
; TODO POI002
.word (#__dll_fixups_end - #__dll_fixups) / 6 ; Number of patches
;.word 0x0000

; TODO POI003
.word 0x0000
;.word #__dll_fixups			; Location of patches

__init:
	di				; Disable Interrupts
	call _load_dll_stub		; Call our dynamic linker

; TODO POI004
ld de,#0x0000
;ld de,#_splash_start		;

	ld hl,#0xa800			; Load menu data & stubs

; TODO POI005
ld bc,#0x0000
;ld bc,#_splash_end-#_splash_start	;

	ldir				;

;	jp _launch_app			; Use this to make an autostart
	jp _splash_start		; Run main menu stub

__0a196h:
	ld hl,#0xa800			;
; TODO POI006
ld de,#0x0000
;ld de,#_splash_start		; Load menu data & stubs again?

; TODO POI007
ld bc,#0x0000
;ld bc,#_splash_end-#_splash_start	;
	ldir				;

	ld hl,#0x7621			;
	push hl				;
	ld a,#0x02			; Patch function at 1109?
	ld (0x110c),a			;
	ld hl,#0xd966			;
; TODO POI008 Error: <a> Invalid Addressing Mode.
ld (0x110d),a
;ld (0x110d),l			;
	call 0x1109			; Main Menu andler

__0a1b3h:
	ld hl,#0xa800			;
    ld de,#_splash_start		; Load menu data & stubs again?

; TODO POI009
ld bc,#0x0000
;ld bc,#_splash_end-#_splash_start	;
	ldir				;

	ld hl,#0x761c			;
	ex (sp), hl			;
	ld a,#0x02			; Patch function at 1109?
	ld (0x110c),a			;
	ld hl,#0xd966			;
; TODO POI010 Error: <a> Invalid Addressing Mode.
ld bc,#0x0000
;ld (0x110d),l			;
	call 0x1109			; Main Menu andler

	jp __0a1b3h			; Loop Forever
	ret				; How can we ever get here?

;; This is a dynamic linker, at runtime it loads a copy of the
;; ROM vector table into RAM and fixes up all the stubbed
;; ROM references in the executable


;; Load and execute ordinal patching stub from a safe location
_load_dll_stub:
	ld hl,#0xa210			;
	ld de,#0x2a00			;
	ld bc,#0x0036			;
	ldir				;
	call _dll_stub			;

	ld ix,(#0xa182)			; Load patch table from ()
	ld bc,(#0xa180)			; Load patch count
	ld l,0(ix)			;
	ld h,1(ix)			;
	ld e,(hl)			; Read L Byte
	inc hl				;
	ld d,(hl)			; Read H Byte
	ld l,2(ix)			; Get Patch Value
	ld h,3(ix)			;
	add hl,de			; Patch the pointer
	ex de,hl			;
	ld l,4(ix)			; Dest Address
	ld h,5(ix)			;
	ld (hl),e			; Write L Byte
	inc hl				;
	ld (hl),d			; Write H Byte
	ld de,#0x0006			;
	add ix,de			; Next Entry
	dec bc				;
	ld a,b				;
	or c				;
	;jr nz,$-34			; More entries?
	jr nz,.-34			; More entries?
	ret				;

;; Local temp index variable
_dll_tmp:
	.db 0x00

;; 54 Bytes - Relocated at runtime to 0x2a00 and executed
	;.org 0x2a00
	;seek 00210h
	; TODO POI020 - I do not understand whats happening in original.
	; there, _dll_stub is located at and behind 0x210, due to seek 0x210
	; with SDCC, there is no seek and so a ".org 0x2a00" would put the ocde to 0x2a00
	; Currently I just define .org to 0x210 to have the bytes at correct place.
	; it this is copied later and then has wrong addresses somehow, how to solve?
    .org 0x0210
_dll_stub:
	ld a,#0x04			; Access Page 4 - 10046 ROM Lower Page
	out (0x20),a			;
	ld hl,#0x8000			; Copy system ordinals from 10046 ROM
	ld de,#0x2d00			;
	ld bc,#0x0134			;
	ldir				;
	ld a,#0x02			; Access Page 2 - Application "ROM"
	out (0x20),a			;

	ld hl,(0x2d0c)			; Generate 17 more for 02e34 = 0d9f0...0da20
	ld bc,#0x0003			;
	ld a,#0x11			; .. Source appears to be a jump table
	call la246h			;

	ld hl,(0x2e16)			; Generate 68 more for 02e56 =
	ld a,(hl)			;
	inc hl				; .. (some FM going on here...)
	ld h,(hl)			;
	ld l,a				;
	ld bc,#0x0006			;
	ld a,#0x44			;
	call 0xa246			;

	ld bc,#0x0002			; Generate 30 more for 02ede = 0eb98..
	ld a,#0x1e			;
	call la246h			;
	ret				;

	.org 0xa246
la246h:
	ld ix,#_dll_tmp			;
	ld 0(ix),a			;
	ld a,l				; do {
	ld (de),a			;   *DE = L
	inc de				;   DE++
	ld a,h				;
	ld (de),a			;   *DE = H
	inc de				;   DE++
	add hl,bc			;   HL+=BC
	dec 0(ix)			; } wile(TMP-- != 0)
	;jr nz,$-10			;
	jr nz,.-10			;
	ret				;

	.org 0xa25a
__dll_fixups:
	.word 0x2d32, 0x0000, 0x0a801
	.word 0x2e6e, 0x0000, 0x0a804
	.word 0x2d4a, 0x0000, 0x0a807
	.word 0x2d50, 0x0000, 0x0a811
	.word 0x2d6c, 0x0000, 0x0a818
	.word 0x2d02, 0x0000, 0x0a81d
	.word 0x2d02, 0x0000, 0x0a82d
	.word 0x2e32, 0x0000, 0x0a830
	.word 0x2d02, 0x0000, 0x0a835
	.word 0x2e66, 0x0003, 0x0a868
	.word 0x2e66, 0x0004, 0x0a86e
;	.word 0x2d02, 0x0000, 0x0a946
	.word 0x2ece, 0x0003, 0x0a1a8
	.word 0x2e54, 0x0000, 0x0a1ab
	.word 0x2ece, 0x0004, 0x0a1ae
	.word 0x2ece, 0x0000, 0x0a1b1
	.word 0x2ece, 0x0003, 0x0a1c5
	.word 0x2e54, 0x0000, 0x0a1c8
	.word 0x2ece, 0x0004, 0x0a1cb
	.word 0x2ece, 0x0000, 0x0a1ce
__dll_fixups_end:

;; Relocated at runtime from 0xa800 to 02000
	;.org 0x2000
	;seek 00800h
	; TODO POI021 - I do not understand whats happening in original.
	; there, _dll_stub is located at and behind 0x800, due to seek 0x800
	; with SDCC, there is no seek and so a ".org 0x2000" would put the ocde to 0x2000
	; Currently I just define .org to 0x800 to have the bytes at correct place.
	; it this is copied later and then has wrong addresses somehow, how to solve?
	.org 0x800
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
