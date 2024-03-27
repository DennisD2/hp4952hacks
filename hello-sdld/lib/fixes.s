    .area FIXES
    .module fixes
    ;.org 0xa000
    ;.org 0x0

    .globl _splash_start
    .globl _splash_end

;_splash_start_l:
;    .word   #_splash_start
;_splash_end_l:
;    .word   #_splash_end


calc_splash_size:
        push hl
        ld hl,#_splash_end
        ld bc,#_splash_start
        sbc hl,bc
        ld b,h
        ld c,l
        pop hl