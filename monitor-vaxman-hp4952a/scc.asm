; A8
scc_bit_ab:     equ     0   ; bit 0 in upper byte
; A9
scc_bit_dc:     equ     1   ; bit 1 in upper byte
; A14
scc_bit_a14:    equ     6   ; bit 6 in upper byte
; A15
scc_bit_a15:    equ     7   ; bit 7 in upper byte

; sets a14+a15
scc_enable:
    set     scc_bit_a14,b
    set     scc_bit_a15,b
    ret

; sets a8
scc_porta:
    set     scc_bit_ab,b    ; hi = a
    ret

; clears a8
scc_portb:
    res     scc_bit_ab,b    ; lo = b
    ret

; sets a9
scc_data:
    set     scc_bit_dc,b    ; hi = data
    ret

; clears a9
scc_control:
    res     scc_bit_dc,b    ; lo = control
    ret

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
    ; read sequence : write a byte to WR0 (includes register to read) with "out" and read a byte with "in"
    ld      bc,000h         ; clear bc
    call    scc_porta       ; select port a
    call    scc_control     ; select control for writing the first byte of read sequence
    ; prepare command in a: read from register
    ; xxxx.rRRR - reg rRRR 0..f
    ; xx00.xxxx - point high command
    ; 00xx.xxxx - null code
    ;and     007h
    call    scc_enable      ; enable SCC
    ; write out command
    out     (c),a
    ;
    ; maybe we need a small time loop here
    call    wait_some_time
    ;
    ; read in answer
    ;call scc_data
    ; I assume we still have scc_control D/~C low, i.e. the read is seen as a command - not sure
    in      a,(c)

    ; now print out the read result
    ;call print_hex

    pop     bc
    ret

