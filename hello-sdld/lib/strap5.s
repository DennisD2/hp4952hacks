    .area STRAP5 (ABS)
    .module strap5_la246h
    ; la246h function
	;.org 0xa246
	.org 0x246

la246h::
	ld ix,#_dll_tmp		;
	ld 0(ix),a			;
	ld a,l				; do {
	ld (de),a			;   *DE = L
	inc de				;   DE++
	ld a,h				;
	ld (de),a			;   *DE = H
	inc de				;   DE++
	add hl,bc			;   HL+=BC
	dec 0(ix)			; } wile(TMP-- != 0)
	;jr nz,$-10			;
	jr nz,.-10			;
	ret				    ;
