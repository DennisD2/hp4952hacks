_scrattr_ascii_n	.equ 0x83
_scrattr_ascii_i	.equ 0x8b
_scrattr_ebcdic_n	.equ 0x43
_scrattr_ebcdic_i	.equ 0x4b
_scrattr_hextex_n	.equ 0x03
_scrattr_hextex_i	.equ 0x0b
_scrattr_dim		.equ 0x20
_scrattr_flash		.equ 0x04
_scrattr_flash2	    .equ 0x10
_scrattr_inverse	.equ 0x08
_scrattr_graphics	.equ 0x80

_scrfont_ascii		.equ 0x8300
_scrfont_ebcdic	    .equ 0x4300
_scrfont_baudot	    .equ 0x83c0
_scrfont_ebcd		.equ 0xc300
_scrfont_transcode	.equ 0xc380
_scrfont_ipars		.equ 0xc3c0

_clear_screen:
	push de
	push hl
	push bc
	push af
	ld de, #0x4000			; Screen Buffer
	push de
	pop hl
	ld bc, #0x03fe
	ld a, #0x20			; ' '
	ld (hl), a
	inc hl
	ld a, #_scrattr_ascii_n		; Normal Attribute
	ld (hl), a
	inc hl
	ex de,hl
	ldir
	ld a, #0x1
	ld (_cur_y + 0x1800),a
	ld (_cur_x + 0x1800),a
	pop af
	pop bc
	pop hl
	pop de
	ret

_backspace:
	ld a,(_cur_x + 0x1800)
	dec a
	jr nz,_wrcurx
	ld a,#0x1
_wrcurx:
	ld (_cur_x + 0x1800),a
	ld a, #0x20
	call _putchar_raw + 0x1800
	jp _updatecursor + 0x1800

; Print char at _cur_y, _cur_x, using _text_attr
; A = Character, AF is clobbered by function
_writechar:
	push af				; Store clobbered registers
	ld a, (_cursor_enabled + 0x1800)
	or a
	jr z, _no_cursor

	push de
	push hl

	call _locxy + 0x1800
	inc hl				;
	ld a,(_text_attr + 0x1800)		;
	ld (hl),a			; Text Attribute

	pop hl				; Restore clobbered registers
	pop de				;
_no_cursor:
	pop af

	cp #0x0a				; Newline?
	jr z,_handle_nl			;
	cp #0x0d				; Carriage Return?
	jr z,_handle_cr			;
	cp #0x0c				; Clear Screen?
	jr z,_clear_screen		;
	cp #0x08				; Backspace?
	jr z,_backspace			;
_writechar_raw:
	call _putchar_raw + 0x1800
	jr _advance_cursor

_updatecursor:
	ld a, (_cursor_enabled + 0x1800)
	or a
	ret z

	push de				; Store clobbered registers
	push hl				;

	call _locxy + 0x1800
	inc hl				;

	ld a,(hl)			;
	or #_scrattr_flash2
	ld (hl),a			; Text Attribute

	pop hl				; Restore clobbered registers
	pop de				;
	ret

_advance_cursor:
	ld a,(_cur_x + 0x1800)
	inc a				; Advance cursor
	ld (_cur_x + 0x1800),a
	cp #0x21				; Should we wrap?
	jr c,_updatecursor		; nope

	jr _advance_line

_handle_cr:
	ld a,#0x01			; Wrap to same line
	ld (_cur_x + 0x1800),a
	jr _updatecursor

_advance_line:
	ld a,#0x01			; Wrap to next line
	ld (_cur_x + 0x1800),a
_handle_nl:
	ld a,(_cur_y + 0x1800)			; Advance to new line
	inc a
	ld (_cur_y + 0x1800),a
	cp #0x11
	jr c,_updatecursor

	push hl
	push de
	push bc
	; Scroll buffer
	ld hl, #0x4040
	ld de, #0x4000
	ld bc, #0x03c0
	ldir

	; Clear last line
	ld de, #0x43c0
	ld hl, #0x43c0
	ld a, #' '
	ld (hl),a
	inc hl
	ld a, #_scrattr_ascii_n
	ld (hl),a
	inc hl
	ex de, hl
	ld bc, #0x03e
	ldir
	pop bc
	pop de
	pop hl

	ld a,#0x10			; We ran out of lines!
	ld (_cur_y + 0x1800),a			; loop (for now)
	jr _updatecursor				;

_locxy:
	ld h,#0x00
	ld a,(_cur_y + 0x1800)			; Line
	ld l,a
	dec l				; --
	add hl,hl			; <<
	add hl,hl			; <<
	add hl,hl			; <<
	add hl,hl			; <<
	add hl,hl			; <<
	add hl,hl			; <<

	ex de,hl			; de = hl

	ld h,#0x00
	ld a,(_cur_x + 0x1800)			; Column
	dec a				; --
	add a,a				; <<
	ld l,a				;
	add hl,de			;

	ld de,#0x4000			; Screen Buffer
	add hl,de			;
	ret

_putchar_raw:
	push de				; Store clobbered registers
	push hl				;
	push af				;

	call _locxy + 0x1800

	pop af				;
	ld (hl),a			; Text Character
	inc hl				;

	ld a,(_text_attr + 0x1800)		;
	ld (hl),a			; Text Attribute

	pop hl				; Restore clobbered registers
	pop de				;
	ret

_cursor_enabled:
	.db 0x00
_cur_x:
	.db 0x01
_cur_y:
	.db 0x01
_text_attr:
	.db _scrattr_ascii_n


