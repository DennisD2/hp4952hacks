    .area APP2 (ABS,OVR)
    ;; Main Application
    .module app_main
	.org 0x2200
	;seek 0xa00

_code_start::

_str_hello1:
	.asciz "Hello World 1"

_str_exit:
	.asciz "Are you sure you wish to exit?"

_main_entry::
	call _clear_screen

_main_loop:
	ld a, #_scrattr_ascii_n			; Normal Text
	ld (#_text_attr), a

	call _keyscan

	ld hl, #_keystates+_scancode_exit
	ld a, (hl)
	cp #0x07
	jr z, _exit_prompt

	ld a, #_scrattr_ascii_n			; Normal Text
	ld (#_text_attr), a
	ld a, #0x08				; Line 1 (Top)
	ld (#_cur_y), a
	ld a, #0x02				; Column 1 (Left)
	ld (#_cur_x), a

	ld hl, #_str_hello1
	call _writestring

	jr _main_loop

_exit_prompt:
	call _clear_screen

	ld a, #_scrattr_ascii_n			; Normal Text
	ld (#_text_attr), a
	ld a, #0x08				; Line 1 (Top)
	ld (#_cur_y), a
	ld a, #0x02				; Column 1 (Left)
	ld (#_cur_x), a

	ld hl, #_str_exit
	call _writestring

_wait_exit:
	call _keyscan

	call _getkey_wait
	cp #'y'
	jr z, _real_exit
	cp #'Y'
	jr z, _real_exit

	cp #'n'
	jr z, _main_entry
	cp #'N'
	jr z, _main_entry

	jr _wait_exit

_real_exit:
	call _clear_screen

	jp 0x14d5				; Return to main menu.


    .include "lib/string.s"
    .include "lib/screen.s"
;.include "lib/printf.asm"
    .include "lib/keyb.s"


_code_end::

;; End of Main Application

;; Fill to end of file
	;.org 0x10ff
	;.org 0xb0ff
	;seek 0x10ff
	.ds 0x448
	.db 0x33
_file_end::