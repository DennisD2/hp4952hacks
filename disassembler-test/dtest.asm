
	    org &8000

        PrintChar 	equ	#bb5a

mymain:
        ld hl,&8000
        call DisWrInstruction
        call print_string
        ret

print_string:
        ld      hl,kStrBuffer
lp:     ld      a,(hl)
        inc     hl
        or      a
        jr      z,done
	    push 	hl		; save hl
	    push 	de		; move de to hl
	    pop     hl
	    call    PrintChar
	    inc 	de
	    pop	    hl		; restore hl
        jp      lp
done:   ret
message:
        defb 'Hello, world.',0

	    read "disassembler.asm"