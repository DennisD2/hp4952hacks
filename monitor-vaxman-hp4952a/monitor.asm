
HP_4952_Target:      equ 001h
CPC_Target:          equ 000h

DISASS:              equ 001h

if HP_4952_Target
;****************************************************************************************
; HP4952 header start
;****************************************************************************************
    include "lib/header.asm"
    include "lib/strap.asm"

	org 02071h
	seek 00871h
_splash_screen_data:
	defb 0ffh

	defb 002h, 00dh, _scrattr_ascii_n
	defb "HP 4952A", 000h
	defb 003h, 007h, _scrattr_ascii_n
	defb "Open Source Software", 000h

	defb 007h, 00bh, _scrattr_ascii_n
	defb "Monitor", 000h

	defb 00ch, 008h, _scrattr_ascii_n
	defb "Hacking the 4952", 000h
	defb 00dh, 009h, _scrattr_ascii_n
	defb "A system monitor app", 000h

	defb 000h							;; End of Screen Data

_splash_menu_data:
	defb "Re-!BERT!Remote!Mass !Moni!Self~"
	defb "set!Menu!&Print!Store!tor !Test|"

_p_main_menu_page_one:
	defw 08336h			;; First Page Menu Data
_p_mm_autoconfig:
	defw 0141ch			;; Ordinal 120h Auto Config
_p_mm_setup:
	defw 0b5a8h			;; Entry Point for Setup
_p_mm_mon:
	defw 0100dh			;; Entry Point for Monitor Menu
_p_mm_sim:
	defw 01013h			;; Entry Point for Sim Menu
_p_mm_run:
	defw 0b9ffh			;; Entry Point for Run Menu
_p_mm_exam:
	defw 013cdh			;; Ordinal 12eh Examine Data
_p_mm_next1:
	defw _p_main_menu_page_two	;; Next Page

_p_main_menu_page_two:
	defw _splash_menu_data		;; Second Page Menu Data
_p_mm_reset:
	defw 0bb1ah			;; Entry Point for Re-Set
_p_mm_bert:
	defw 0b22ch			;; Entry Point for BERT Menu
_p_mm_remote:
	defw 0d963h			;; Entry Point for Remote & Print
_p_mm_masstorage:
	defw 00f0ch			;; Entry Point for Mass Storage
_p_mm_launch_app:
	defw _launch_app		;; Entry Point for Application
_p_mm_selftest:
	defw 0136fh			;; Ordinal 12ah Self Test
_p_mm_next2:
	defw _p_main_menu_page_one	;; Next Page

_launch_app:
	ld a, 006h
	call 00e60h			; Page in 6
	ld hl,0aa00h			; Copy application to Work RAM
	ld de,_code_start		;
	ld bc,_code_end-_code_start	;
	ldir				;
	jp _main_entry			; Run the application

_splash_end:
;; End of menu section

;****************************************************************************************
; HP4952 header end
;****************************************************************************************
endif

;; Main Application
	org 2200h
	seek 0a00h
_code_start:
_str_exit:
	defb "Are you sure you wish to exit?", 000h

_main_entry:
	call initialize

include "monitor-i.asm"

;****************************************************************************************
; HP4952 footer start
;****************************************************************************************
if HP_4952_Target
    include "lib/string.asm"
    include "lib/screen.asm"
    include "lib/printf.asm"
    include "lib/keyb.asm"

_code_end:
	defb 033h
;; End of Main Application


;; Fill to end of file; file size must be multiple of 0x100 = 256
    ; this is a0000 + seek value calculated below; I guess its just to define a valid org value, even if not being used
	org 0bcfeh
	; 1) check size of resulting file
	; 2) divide by 256 0x100
	; 3) add 1, multiply with 0x100 ; this is (filesize/0x100 + 1)*0x100 (so 0x100-bytes-page partally started is filled up)
	; 4) subtract 2, for the word at end
	seek 01cfeh
    ; final world with magic value
	defw 0affeh
_file_end:
;****************************************************************************************
; HP4952 footer end
;****************************************************************************************
endif

