
	    org &8000

        PrintChar 	equ	#bb5a
mymain:
        ld      hl,&8000
        ld      bc,&9
        ld      a,0
        call    StrInitialise

disloop:
        ; call with address to disassemble
        call    DisWrInstruction
        ; a = length of instruction
        ; hl = address of next instruction
        ; kStrBuffer contains disassembled opcode string

        call    print_string
        dec     bc
        ld      a,b
        or      c
        jr      nz,disloop
        ret

print_string:
        push    hl

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
done:
        call    NewLine
        ld      a,0
        call    StrInitialise

        pop hl
        ret

NewLine:
        ld      a,13
        call    PrintChar
        ld      a,10
        call    PrintChar
        ret

message:
        defb 'Hello, world.',0

	    read "disassembler.asm"