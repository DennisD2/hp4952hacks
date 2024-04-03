; ---------------------------------
; disassemble some piece of memory
; ---------------------------------
	    org &8000

        PrintChar 	equ	    #bb5a

mymain:
        ld      hl,&8000    ; start address for disassembing
        ld      bc,&10      ; number of op codes to disassemble, "lines"

; disassemble code
; hi is start of code, bc number of opcodes to disassemble
disloop:
        ; DisWrInstruction, call with address to disassemble in hl
        call    DisWrInstruction
        ; a = length of instruction
        ; hl = address of next instruction
        ; kStrBuffer contains disassembled opcode string

        call    print_string
        dec     bc              ; lines--
        ld      a,b             ; line loop finished?
        or      c
        jr      nz,disloop      ; no, continue
        ret                     ; yes, we're done

; print a string located at kStrBuffer
print_string:
        push    hl              ; save hl

        ld      hl,kStrBuffer
        ld      b,(hl)          ; length of string
        inc     b
        inc     hl
lp:     ld      a,(hl)          ; next char to print
        inc     hl
        dec     b               ; i--
        jr      z,done          ; i==0?, yes jump to done
	    call    PrintChar
        jp      lp
done:
        call    NewLine

        pop hl                  ; restore hl
        ret

; print a newline char
NewLine:
        ld      a,13
        call    PrintChar
        ld      a,10
        call    PrintChar
        ret

        ; include disassembler source
	    read "disassembler.asm"