_keyscan:
	push hl				; HL is used to index the keystate array
	push de				; D is the Row buffer for the keyboard matrix
	push bc				; E is the current row's bits
	push af				; B is the column counter

	ld hl, #_keystates+ 0x1800

	ld a, #0x01			; Row to scan
_k_scan_row:
	ld d, a
	out (0xd0), a			; Set Row Bits

	nop
	nop
	nop
	nop
	nop

	in a, (0xd0)			; Get Col Bits

	ld b, #0x8
_k_store_key:
	ld e, a				; store the next columns bits...
	and #0x1				; extract this column
	sla (hl)			; shift the state over
	or (hl)				; OR it with the current state
	and #0x0f
	ld (hl), a			; save it back to the array
	inc hl				; move on to the next array location
	ld a, e				; restore the remaining bits
	srl a				; take one down, pass it around
	djnz _k_store_key		; repeat for this entire key row

	ld a, d				; read the next row until we are done
	add a
	jr nz, _k_scan_row

	pop af				; restore all the registers we walked on
	pop bc
	pop de
	pop hl
	ret

_getkey_wait:
	call _keyscan+ 0x1800
	call _getkey_nowait+ 0x1800
	cp #_key_none
	jr z, _getkey_wait
	ret

_getkey_nowait:
	push hl
	push de
	push bc

	ld a, (_keystates + #_scancode_shift+ 0x1800)			; C = (Ctrl << 2) | (Shift << 7)
	rr a
	rr a
	rr a
	rr a
	ld a, (_keystates + _scancode_ctrl+ 0x1800)
	rr a
	ld c, a

	ld de, #_keymatrix+ 0x1800
	ld hl, #_keystates+ 0x1800
	; from 65 (dec) to 0x40
	ld b, #0x40
_gk_next_key:
	ld a, (hl)
	cp #0x07    						; Debounce the key press
	jr c, _gk_skip_code					; Not yet pressed for 3 consecutive reads

	jr z, _gk_decode					; Key was pressed for 3 consecutive reads

	bit 0x, a						; Key is still held, do noting
	jr nz, _gk_skip_code

	and #0x0f						; Debounce the key release
	ld (hl), a						;

_gk_skip_code:
	inc hl							; Otherwise keep going until
	inc de							; we have checked all of them
	djnz _gk_next_key

	or #_key_none						; No key pressed
	jr _gk_done

_gk_decode:
	ex de, hl						; Swap to the matrix
	ld a, (hl)						; and retrieve the keycode
	ex de, hl

	cp #_key_none						; We don't report invalid
	jr z, _gk_skip_code					; or modifier keys
	cp #_key_ctrl						; most applications want
	jr z, _gk_skip_code					; just the ascii characters
	cp #_key_shift
	jr z, _gk_skip_code

	bit 7, a						; Special characters are not
	jr nz, _gk_done						; modified here

	bit 2, c						; Handle Ctrl-[key]
	jr nz, _gk_ctrl

	bit 7, c						; Handle Shift-[key]
	jr nz, _gk_shift

_gk_done:
	pop bc
	pop de
	pop hl
	ret

_gk_ctrl:
	cp #0x30							; The outlier
	jr z, _gk_ctrl_0
	bit 5, a						; Only modify valid ctrl-sequences
	jr z, _gk_done
_gk_ctrl_0:
	and #0x1f
	jr _gk_done

_gk_shift:
	cp #0x40							; Alpha & @ get bit 5 inverted
	jr nc, _gk_shift_alpha
	cp #0x30
	jr z, _gk_shift_0					; Zero becomes underscore
	cp #0x2c
	jr nc, _gk_shift_num					; 1 thru ? become ! thru /

	jr _gk_done

_gk_shift_num:
	xor #0x10
	jr _gk_done

_gk_shift_alpha:
	xor #0x20
	jr _gk_done

_gk_shift_0:
	ld a, #_key_underscore
	jr _gk_done

_key_a	.equ 'a'
_key_b	.equ 'b'
_key_c	.equ 'c'
_key_d	.equ 'd'
_key_e	.equ 'e'
_key_f	.equ 'f'
_key_g	.equ 'g'
_key_h	.equ 'h'
_key_i	.equ 'i'
_key_j	.equ 'j'
_key_k	.equ 'k'
_key_l	.equ 'l'
_key_m	.equ 'm'
_key_n	.equ 'n'
_key_o	.equ 'o'
_key_p	.equ 'p'
_key_q	.equ 'q'
_key_r	.equ 'r'
_key_s	.equ 's'
_key_t	.equ 't'
_key_u	.equ 'u'
_key_v	.equ 'v'
_key_w	.equ 'w'
_key_x	.equ 'x'
_key_y	.equ 'y'
_key_z	.equ 'z'

_key_underscore	.equ '_'

_key_f1		    .equ 0xe0
_key_f2		    .equ 0xe1
_key_f3		    .equ 0xe2
_key_f4		    .equ 0xe3
_key_f5		    .equ 0xe4
_key_f6		    .equ 0xe5
_key_f7		    .equ 0xe6
_key_f8		    .equ 0xe7
_key_f9		    .equ 0xe8
_key_f10		.equ 0xe9
_key_f11		.equ 0xea
_key_f12		.equ 0xeb

_key_more		.equ 0xef
_key_help		.equ 0xed

_key_exit		.equ 0xec
_key_halt		.equ 0xee
_key_enter		.equ 0xfa

_key_up		    .equ 0xf6
_key_dn		    .equ 0xf7
_key_lt		    .equ 0xf8
_key_rt		    .equ 0xf9

_key_pgup		.equ 0xf4
_key_pgdn		.equ 0xf5
_key_home		.equ 0xf2
_key_end		.equ 0xf3

_key_shift		.equ 0xfd
_key_ctrl		.equ 0xfe
_key_none		.equ 0xff

_scancode_null		.equ 0x00
_scancode_caret 	.equ 0x01
_scancode_rightbracket 	.equ 0x02
_scancode_backslash 	.equ 0x03
_scancode_leftbracket	.equ 0x04
_scancode_z		    .equ 0x05
_scancode_y		    .equ 0x06
_scancode_x		    .equ 0x07
_scancode_w		    .equ 0x08
_scancode_v		    .equ 0x09
_scancode_u		    .equ 0x0a
_scancode_t		    .equ 0x0b
_scancode_s		    .equ 0x0c
_scancode_r		    .equ 0x0d
_scancode_q		    .equ 0x0e
_scancode_p		    .equ 0x0f

_scancode_o		    .equ 0x10
_scancode_n		    .equ 0x11
_scancode_m		    .equ 0x12
_scancode_l		    .equ 0x13
_scancode_k		    .equ 0x14
_scancode_j		    .equ 0x15
_scancode_i		    .equ 0x16
_scancode_h		    .equ 0x17
_scancode_g		    .equ 0x18
_scancode_f		    .equ 0x19
_scancode_e		    .equ 0x1a
_scancode_d		    .equ 0x1b
_scancode_c		    .equ 0x1c
_scancode_b		    .equ 0x1d
_scancode_a		    .equ 0x1e
_scancode_at		.equ 0x1f

_scancode_slash 	.equ 0x20
_scancode_period   	.equ 0x21
_scancode_minus 	.equ 0x22
_scancode_comma 	.equ 0x23
_scancode_semicolon	.equ 0x24
_scancode_colon 	.equ 0x25
_scancode_9		    .equ 0x26
_scancode_8		    .equ 0x27
_scancode_7		    .equ 0x28
_scancode_6		    .equ 0x29
_scancode_5		    .equ 0x2a
_scancode_4		    .equ 0x2b
_scancode_3		    .equ 0x2c
_scancode_2		    .equ 0x2d
_scancode_1		    .equ 0x2e
_scancode_0 		.equ 0x2f

_scancode_space	    .equ 0x30
_scancode_ctrl		.equ 0x31
_scancode_shift 	.equ 0x32
_scancode_enter 	.equ 0x33
_scancode_rt		.equ 0x34
_scancode_lt		.equ 0x35
_scancode_dn		.equ 0x36
_scancode_up		.equ 0x37
_scancode_more		.equ 0x38
_scancode_f6		.equ 0x39
_scancode_f5		.equ 0x3a
_scancode_f4		.equ 0x3b
_scancode_f3		.equ 0x3c
_scancode_f2		.equ 0x3d
_scancode_f1		.equ 0x3e
_scancode_exit		.equ 0x3f

_keystate_up		.equ 0x00
_keystate_down		.equ 0x01
_keystate_lastup   	.equ 0x00
_keystate_lastdown	.equ 0x02
_keystate_pressed	.equ 0x07
_keystate_held		.equ 0x0f
_keystate_released	.equ 0x08

_keystates:
	.ds 64

_keymatrix:
;_keymatrix_u:
    .db 0x80,  '^',  ']', '\',  '[',  'z',  'y',  'x'	   ; 01
	;.db 0x80,  '^',  ']', '\\',  '[',  'z',  'y',  'x'		; 01
	.db  'w',  'v',  'u',  't',  's',  'r',  'q',  'p'		; 02
	.db  'o',  'n',  'm',  'l',  'k',  'j',  'i',  'h'		; 04
	.db  'g',  'f',  'e',  'd',  'c',  'b',  'a',  '@'		; 08
	.db  '/',  '.',  '-',  ',',  ';',  ':',  '9',  '8'		; 10
	.db  '7',  '6',  '5',  '4',  '3',  '2',  '1',  '0'		; 20
	.db  ' ', 0xfe, 0xfd, 0xfa, 0xf9, 0xf8, 0xf7, 0xf6		; 40
	.db 0xef, 0xe5, 0xe4, 0xe3, 0xe2, 0xe1, 0xe0, 0xec		; 80
