; -------------------------------------------------------------------
;
; Code trial to access SCC on HP4952a
;
; -------------------------------------------------------------------

; Code examples
; https://hackaday.io/project/5233-z80-computer/log/19836-serial-io
; https://github.com/torvalds/linux/blob/master/drivers/tty/serial/ip22zilog.c


; A8
;scc_bit_ab:     equ     0   ; bit 0 in upper byte
; A9
;scc_bit_dc:     equ     1   ; bit 1 in upper byte
; A14
;scc_bit_a14:    equ     6   ; bit 6 in upper byte
; A15
;scc_bit_a15:    equ     7   ; bit 7 in upper byte

; sets a14+a15
;scc_enable:
    ;set     scc_bit_a14,b
    ;set     scc_bit_a15,b
;    ret

; sets a8
;scc_porta:
;    set     scc_bit_ab,b    ; hi = a
;    ret

; clears a8
;scc_portb:
;    res     scc_bit_ab,b    ; lo = b
;    ret

; sets a9
;scc_data:
;    set     scc_bit_dc,b    ; hi = data
;    ret

; clears a9
;scc_control:
;    res     scc_bit_dc,b    ; lo = control
;    ret

wait_some_time:
    push    de
    ld      de,00200h
wait_loop:
    dec     de
    ld      a,e
    or      d
    jr      nz,wait_loop
    pop     de
    ret

print_hex:
    call print_byte
    ret

; register to read in a
scc_read_register:
    push    bc

	ld c,021h		;138a	0e 21 	. !         ; address SCC port
	in a,(c)		;138c	ed 78 	. x         ; dummy read (RR0?)
	ld a,009h		;138e	3e 09 	> .         ; send 0x09 -> SCC = select register R9
	out (c),a		;1390	ed 79 	. y         ;
	ld a,0c0h		;1392	3e c0 	> .         ; write 0xc0 to WR9: Force Hardware Reset"
	out (c),a		;1394	ed 79 	. y         ;

    pop     bc
    ret

