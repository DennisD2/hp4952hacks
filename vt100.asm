; z80dasm 1.1.6
; command line: z80dasm -t -a -g 0xa000 -o x.asm VT100.no_header

	org	0a000h

	defb "4952 Protocol Analyzer"
	
	org 0a016h
	seek 00016h
	defw 003c4h
	defw 00800h
	defb 000h

	org 0a01ah
	seek 0001ah
	defb "VT100 ASYNC TERMINAL EMULATOR   ", 000h
	
	org 0a102h
	seek 00102h
 
	defb "X"
	defb 000h
	defb "        TERMINAL  4952  ", 000h
	
	ex af,af'			;a11d	08 	. 
	nop			;a11e	00 	. 
	   
	defb 001h
	defb "Async Terminal Emulator - DUMB  ", 000h
	 
	nop			;a141	00 	. 
	nop			;a142	00 	. 
	nop			;a143	00 	. 
	nop			;a144	00 	. 
	nop			;a145	00 	. 
	nop			;a146	00 	.

;; POI-000; we have here a jump to a497.
;; Check that location=POI-001, this starts with a "di" which looks
;; like being entry for this app
	jp 0a497h		;a147	c3 97 a4 	. . . 
	nop			;a14a	00 	. 
	nop			;a14b	00 	. 
	nop			;a14c	00 	. 
	nop			;a14d	00 	. 
	nop			;a14e	00 	. 
	nop			;a14f	00 	. 
	nop			;a150	00 	. 
	nop			;a151	00 	. 
	nop			;a152	00 	. 
	nop			;a153	00 	. 
	nop			;a154	00 	. 
	nop			;a155	00 	. 
	nop			;a156	00 	. 
	nop			;a157	00 	. 
	nop			;a158	00 	. 
	nop			;a159	00 	. 
	nop			;a15a	00 	. 
	nop			;a15b	00 	. 
	nop			;a15c	00 	. 
	nop			;a15d	00 	. 
	nop			;a15e	00 	. 
	nop			;a15f	00 	. 
	nop			;a160	00 	. 
	nop			;a161	00 	. 
	nop			;a162	00 	. 
	nop			;a163	00 	. 
	nop			;a164	00 	. 
	nop			;a165	00 	. 
	nop			;a166	00 	. 
	nop			;a167	00 	. 
	nop			;a168	00 	. 
	nop			;a169	00 	. 
	nop			;a16a	00 	. 
	nop			;a16b	00 	. 
	nop			;a16c	00 	. 
	nop			;a16d	00 	. 
	nop			;a16e	00 	. 
	nop			;a16f	00 	. 
	nop			;a170	00 	. 
	nop			;a171	00 	. 
	nop			;a172	00 	. 
	nop			;a173	00 	. 
	nop			;a174	00 	. 
	nop			;a175	00 	. 
	nop			;a176	00 	. 
	nop			;a177	00 	. 
	nop			;a178	00 	. 
	nop			;a179	00 	. 
	nop			;a17a	00 	. 
	nop			;a17b	00 	. 
	nop			;a17c	00 	. 
	ld (bc),a			;a17d	02 	. 
	cp d			;a17e	ba 	. 
	rst 30h			;a17f	f7 	. 
	ld h,c			;a180	61 	a 
	nop			;a181	00 	. 
	nop			;a182	00 	. 
	nop			;a183	00 	. 
	nop			;a184	00 	. 
	nop			;a185	00 	. 
	nop			;a186	00 	. 
	nop			;a187	00 	. 
	nop			;a188	00 	. 
	nop			;a189	00 	. 
	nop			;a18a	00 	. 
	nop			;a18b	00 	. 
	nop			;a18c	00 	. 
	nop			;a18d	00 	. 
	nop			;a18e	00 	. 
	nop			;a18f	00 	. 
	ld (bc),a			;a190	02 	. 
	dec l			;a191	2d 	- 
	nop			;a192	00 	. 
	nop			;a193	00 	. 
	ld (hl),0c1h		;a194	36 c1 	6 . 
	ld (bc),a			;a196	02 	. 
	dec l			;a197	2d 	- 
	nop			;a198	00 	. 
	nop			;a199	00 	. 
	ld (hl),b			;a19a	70 	p 
	pop bc			;a19b	c1 	. 
	ld (bc),a			;a19c	02 	. 
	dec l			;a19d	2d 	- 
	nop			;a19e	00 	. 
	nop			;a19f	00 	. 
	sub (hl)			;a1a0	96 	. 
	pop bc			;a1a1	c1 	. 
	ld d,b			;a1a2	50 	P 
	dec l			;a1a3	2d 	- 
	nop			;a1a4	00 	. 
	nop			;a1a5	00 	. 
	sbc a,l			;a1a6	9d 	. 
	pop bc			;a1a7	c1 	. 
	ld (bc),a			;a1a8	02 	. 
	dec l			;a1a9	2d 	- 
	nop			;a1aa	00 	. 
	nop			;a1ab	00 	. 
	rlca			;a1ac	07 	. 
	jp 02d02h		;a1ad	c3 02 2d 	. . - 
	nop			;a1b0	00 	. 
	nop			;a1b1	00 	. 
	dec c			;a1b2	0d 	. 
	jp 02e54h		;a1b3	c3 54 2e 	. T . 
	nop			;a1b6	00 	. 
	nop			;a1b7	00 	. 
	inc d			;a1b8	14 	. 
	jp 02d02h		;a1b9	c3 02 2d 	. . - 
	nop			;a1bc	00 	. 
	nop			;a1bd	00 	. 
	ld a,(de)			;a1be	1a 	. 
	jp 02d02h		;a1bf	c3 02 2d 	. . - 
	nop			;a1c2	00 	. 
	nop			;a1c3	00 	. 
	add hl,sp			;a1c4	39 	9 
	jp 02d02h		;a1c5	c3 02 2d 	. . - 
	nop			;a1c8	00 	. 
	nop			;a1c9	00 	. 
	ld b,a			;a1ca	47 	G 
	jp 02d02h		;a1cb	c3 02 2d 	. . - 
	nop			;a1ce	00 	. 
	nop			;a1cf	00 	. 
	ld d,b			;a1d0	50 	P 
	jp 02d02h		;a1d1	c3 02 2d 	. . - 
	nop			;a1d4	00 	. 
	nop			;a1d5	00 	. 
	ld e,(hl)			;a1d6	5e 	^ 
	jp 02e3ch		;a1d7	c3 3c 2e 	. < . 
	nop			;a1da	00 	. 
	nop			;a1db	00 	. 
	dec de			;a1dc	1b 	. 
	call nz,02e3ch		;a1dd	c4 3c 2e 	. < . 
	nop			;a1e0	00 	. 
	nop			;a1e1	00 	. 
	dec e			;a1e2	1d 	. 
	call nz,02e3ch		;a1e3	c4 3c 2e 	. < . 
	nop			;a1e6	00 	. 
	nop			;a1e7	00 	. 
	rra			;a1e8	1f 	. 
	call nz,02e3ch		;a1e9	c4 3c 2e 	. < . 
	nop			;a1ec	00 	. 
	nop			;a1ed	00 	. 
	ld hl,03cc4h		;a1ee	21 c4 3c 	! . < 
	ld l,000h		;a1f1	2e 00 	. . 
	nop			;a1f3	00 	. 
	inc hl			;a1f4	23 	# 
	call nz,02e3ch		;a1f5	c4 3c 2e 	. < . 
	nop			;a1f8	00 	. 
	nop			;a1f9	00 	. 
	dec h			;a1fa	25 	% 
	call nz,02e3ch		;a1fb	c4 3c 2e 	. < . 
	nop			;a1fe	00 	. 
	nop			;a1ff	00 	. 
	daa			;a200	27 	' 
	call nz,02e3ch		;a201	c4 3c 2e 	. < . 
	nop			;a204	00 	. 
	nop			;a205	00 	. 
	add hl,hl			;a206	29 	) 
	call nz,02e3ch		;a207	c4 3c 2e 	. < . 
	nop			;a20a	00 	. 
	nop			;a20b	00 	. 
	dec hl			;a20c	2b 	+ 
	call nz,02e42h		;a20d	c4 42 2e 	. B . 
	nop			;a210	00 	. 
	nop			;a211	00 	. 
	dec l			;a212	2d 	- 
	call nz,02e42h		;a213	c4 42 2e 	. B . 
	nop			;a216	00 	. 
	nop			;a217	00 	. 
	cpl			;a218	2f 	/ 
	call nz,02e42h		;a219	c4 42 2e 	. B . 
	nop			;a21c	00 	. 
	nop			;a21d	00 	. 
	ld sp,042c4h		;a21e	31 c4 42 	1 . B 
	ld l,000h		;a221	2e 00 	. . 
	nop			;a223	00 	. 
	inc sp			;a224	33 	3 
	call nz,02e42h		;a225	c4 42 2e 	. B . 
	nop			;a228	00 	. 
	nop			;a229	00 	. 
	dec (hl)			;a22a	35 	5 
	call nz,02e42h		;a22b	c4 42 2e 	. B . 
	nop			;a22e	00 	. 
	nop			;a22f	00 	. 
	scf			;a230	37 	7 
	call nz,02e42h		;a231	c4 42 2e 	. B . 
	nop			;a234	00 	. 
	nop			;a235	00 	. 
	add hl,sp			;a236	39 	9 
	call nz,02e42h		;a237	c4 42 2e 	. B . 
	nop			;a23a	00 	. 
	nop			;a23b	00 	. 
	dec sp			;a23c	3b 	; 
	call nz,02e42h		;a23d	c4 42 2e 	. B . 
	nop			;a240	00 	. 
	nop			;a241	00 	. 
	dec a			;a242	3d 	= 
	call nz,02d02h		;a243	c4 02 2d 	. . - 
	nop			;a246	00 	. 
	nop			;a247	00 	. 
	rst 10h			;a248	d7 	. 
	ret z			;a249	c8 	. 

	ld a,(0002eh)		;a24a	3a 2e 00 	: . . 
	nop			;a24d	00 	. 
	call p,002c8h		;a24e	f4 c8 02 	. . . 
	dec l			;a251	2d 	- 
	nop			;a252	00 	. 
	nop			;a253	00 	. 
	ld (002c9h),a		;a254	32 c9 02 	2 . . 
	dec l			;a257	2d 	- 
	nop			;a258	00 	. 
	nop			;a259	00 	. 
	dec sp			;a25a	3b 	; 
	ret			;a25b	c9 	. 
	jr c,$+47		;a25c	38 2d 	8 - 
	nop			;a25e	00 	. 
	nop			;a25f	00 	. 
	ld a,0c9h		;a260	3e c9 	> . 
	ld (bc),a			;a262	02 	. 
	dec l			;a263	2d 	- 
	nop			;a264	00 	. 
	nop			;a265	00 	. 
	ld c,b			;a266	48 	H 
	ret			;a267	c9 	. 
	ld d,b			;a268	50 	P 
	dec l			;a269	2d 	- 
	nop			;a26a	00 	. 
	nop			;a26b	00 	. 
	ld d,h			;a26c	54 	T 
	ret			;a26d	c9 	. 
	ld h,b			;a26e	60 	` 
	ld l,000h		;a26f	2e 00 	. . 
	nop			;a271	00 	. 
	defb 0fdh,0c9h,060h	;illegal sequence		;a272	fd c9 60 	. . ` 
	ld l,000h		;a275	2e 00 	. . 
	nop			;a277	00 	. 
	add hl,bc			;a278	09 	. 
	jp z,02e60h		;a279	ca 60 2e 	. ` . 
	nop			;a27c	00 	. 
	nop			;a27d	00 	. 
	dec d			;a27e	15 	. 
	jp z,02e60h		;a27f	ca 60 2e 	. ` . 
	nop			;a282	00 	. 
	nop			;a283	00 	. 
	ld hl,060cah		;a284	21 ca 60 	! . ` 
	ld l,000h		;a287	2e 00 	. . 
	nop			;a289	00 	. 
	dec l			;a28a	2d 	- 
	jp z,02e60h		;a28b	ca 60 2e 	. ` . 
	nop			;a28e	00 	. 
	nop			;a28f	00 	. 
	add hl,sp			;a290	39 	9 
	jp z,02e60h		;a291	ca 60 2e 	. ` . 
	nop			;a294	00 	. 
	nop			;a295	00 	. 
	ld b,l			;a296	45 	E 
	jp z,02e60h		;a297	ca 60 2e 	. ` . 
	nop			;a29a	00 	. 
	nop			;a29b	00 	. 
	ld d,c			;a29c	51 	Q 
	jp z,02e60h		;a29d	ca 60 2e 	. ` . 
	nop			;a2a0	00 	. 
	nop			;a2a1	00 	. 
	ld e,l			;a2a2	5d 	] 
	jp z,02df8h		;a2a3	ca f8 2d 	. . - 
	nop			;a2a6	00 	. 
	nop			;a2a7	00 	. 
	rst 30h			;a2a8	f7 	. 
	jp z,02deah		;a2a9	ca ea 2d 	. . - 
	nop			;a2ac	00 	. 
	nop			;a2ad	00 	. 
	jp m,002cah		;a2ae	fa ca 02 	. . . 
	ld l,000h		;a2b1	2e 00 	. . 
	nop			;a2b3	00 	. 
	dec e			;a2b4	1d 	. 
	set 2,b		;a2b5	cb d0 	. . 
	dec l			;a2b7	2d 	- 
	nop			;a2b8	00 	. 
	nop			;a2b9	00 	. 
	jr nz,$-51		;a2ba	20 cb 	  . 
	ld (0002dh),a		;a2bc	32 2d 00 	2 - . 
	nop			;a2bf	00 	. 
	sbc a,h			;a2c0	9c 	. 
	and h			;a2c1	a4 	. 
	ld l,(hl)			;a2c2	6e 	n 
	ld l,000h		;a2c3	2e 00 	. . 
	nop			;a2c5	00 	. 
	sbc a,a			;a2c6	9f 	. 
	and h			;a2c7	a4 	. 
	ld h,(hl)			;a2c8	66 	f 
	ld l,003h		;a2c9	2e 03 	. . 
	nop			;a2cb	00 	. 
	and d			;a2cc	a2 	. 
	and h			;a2cd	a4 	. 
	ld h,(hl)			;a2ce	66 	f 
	ld l,003h		;a2cf	2e 03 	. . 
	nop			;a2d1	00 	. 
	xor h			;a2d2	ac 	. 
	and h			;a2d3	a4 	. 
	ld h,(hl)			;a2d4	66 	f 
	ld l,004h		;a2d5	2e 04 	. . 
	nop			;a2d7	00 	. 
	or d			;a2d8	b2 	. 
	and h			;a2d9	a4 	. 
	ld (0002eh),a		;a2da	32 2e 00 	2 . . 
	nop			;a2dd	00 	. 
	ret			;a2de	c9 	. 
	and h			;a2df	a4 	. 
	or d			;a2e0	b2 	. 
	ld l,000h		;a2e1	2e 00 	. . 
	nop			;a2e3	00 	. 
	exx			;a2e4	d9 	. 
	and h			;a2e5	a4 	. 
	jp c,0002eh		;a2e6	da 2e 00 	. . . 
	nop			;a2e9	00 	. 
	call c,098a4h		;a2ea	dc a4 98 	. . . 
	ld l,000h		;a2ed	2e 00 	. . 
	nop			;a2ef	00 	. 
	rst 18h			;a2f0	df 	. 
	and h			;a2f1	a4 	. 
	call c,0002eh		;a2f2	dc 2e 00 	. . . 
	nop			;a2f5	00 	. 
	jp po,06ca4h		;a2f6	e2 a4 6c 	. . l 
	dec l			;a2f9	2d 	- 
	nop			;a2fa	00 	. 
	nop			;a2fb	00 	. 
	ld b,0a5h		;a2fc	06 a5 	. . 
	adc a,02eh		;a2fe	ce 2e 	. . 
	inc bc			;a300	03 	. 
	nop			;a301	00 	. 
	inc c			;a302	0c 	. 
	and l			;a303	a5 	. 
	ld d,h			;a304	54 	T 
	ld l,000h		;a305	2e 00 	. . 
	nop			;a307	00 	. 
	rrca			;a308	0f 	. 
	and l			;a309	a5 	. 
	adc a,02eh		;a30a	ce 2e 	. . 
	inc b			;a30c	04 	. 
	nop			;a30d	00 	. 
	ld (de),a			;a30e	12 	. 
	and l			;a30f	a5 	. 
	adc a,02eh		;a310	ce 2e 	. . 
	nop			;a312	00 	. 
	nop			;a313	00 	. 
	add hl,de			;a314	19 	. 
	and l			;a315	a5 	. 
	or d			;a316	b2 	. 
	ld l,000h		;a317	2e 00 	. . 
	nop			;a319	00 	. 
	ld hl,0daa6h		;a31a	21 a6 da 	! . . 
	ld l,000h		;a31d	2e 00 	. . 
	nop			;a31f	00 	. 
	inc h			;a320	24 	$ 
	and (hl)			;a321	a6 	. 
	sbc a,b			;a322	98 	. 
	ld l,000h		;a323	2e 00 	. . 
	nop			;a325	00 	. 
	daa			;a326	27 	' 
	and (hl)			;a327	a6 	. 
	call c,0002eh		;a328	dc 2e 00 	. . . 
	nop			;a32b	00 	. 
	ld hl,(092a6h)		;a32c	2a a6 92 	* . . 
	ld l,003h		;a32f	2e 03 	. . 
	nop			;a331	00 	. 
	dec l			;a332	2d 	- 
	and (hl)			;a333	a6 	. 
	sub d			;a334	92 	. 
	ld l,004h		;a335	2e 04 	. . 
	nop			;a337	00 	. 
	inc sp			;a338	33 	3 
	and (hl)			;a339	a6 	. 
	sub d			;a33a	92 	. 
	ld l,003h		;a33b	2e 03 	. . 
	nop			;a33d	00 	. 
	dec sp			;a33e	3b 	; 
	and (hl)			;a33f	a6 	. 
	sub d			;a340	92 	. 
	ld l,004h		;a341	2e 04 	. . 
	nop			;a343	00 	. 
	ld b,c			;a344	41 	A 
	and (hl)			;a345	a6 	. 
	inc l			;a346	2c 	, 
	ld l,000h		;a347	2e 00 	. . 
	nop			;a349	00 	. 
	ld b,h			;a34a	44 	D 
	and (hl)			;a34b	a6 	. 
	sub d			;a34c	92 	. 
	ld l,003h		;a34d	2e 03 	. . 
	nop			;a34f	00 	. 
	ld c,h			;a350	4c 	L 
	and (hl)			;a351	a6 	. 
	sub d			;a352	92 	. 
	ld l,004h		;a353	2e 04 	. . 
	nop			;a355	00 	. 
	ld d,d			;a356	52 	R 
	and (hl)			;a357	a6 	. 
	inc e			;a358	1c 	. 
	ld l,000h		;a359	2e 00 	. . 
	nop			;a35b	00 	. 
	ld d,l			;a35c	55 	U 
	and (hl)			;a35d	a6 	. 
	inc e			;a35e	1c 	. 
	ld l,001h		;a35f	2e 01 	. . 
	nop			;a361	00 	. 
	ld e,e			;a362	5b 	[ 
	and (hl)			;a363	a6 	. 
	inc e			;a364	1c 	. 
	ld l,000h		;a365	2e 00 	. . 
	nop			;a367	00 	. 
	ld h,h			;a368	64 	d 
	and (hl)			;a369	a6 	. 
	call z,0002eh		;a36a	cc 2e 00 	. . . 
	nop			;a36d	00 	. 
	ld h,a			;a36e	67 	g 
	and (hl)			;a36f	a6 	. 
	inc e			;a370	1c 	. 
	ld l,001h		;a371	2e 01 	. . 
	nop			;a373	00 	. 
	ld l,d			;a374	6a 	j 
	and (hl)			;a375	a6 	. 
	call z,0032eh		;a376	cc 2e 03 	. . . 
	nop			;a379	00 	. 
	ld l,a			;a37a	6f 	o 
	and (hl)			;a37b	a6 	. 
	call z,0042eh		;a37c	cc 2e 04 	. . . 
	nop			;a37f	00 	. 
	ld (hl),l			;a380	75 	u 
	and (hl)			;a381	a6 	. 
	sub d			;a382	92 	. 
	ld l,000h		;a383	2e 00 	. . 
	nop			;a385	00 	. 
	ld a,d			;a386	7a 	z 
	and (hl)			;a387	a6 	. 
	inc e			;a388	1c 	. 
	ld l,000h		;a389	2e 00 	. . 
	nop			;a38b	00 	. 
	add a,h			;a38c	84 	. 
	and (hl)			;a38d	a6 	. 
	inc e			;a38e	1c 	. 
	ld l,001h		;a38f	2e 01 	. . 
	nop			;a391	00 	. 
	adc a,d			;a392	8a 	. 
	and (hl)			;a393	a6 	. 
	inc e			;a394	1c 	. 
	ld l,000h		;a395	2e 00 	. . 
	nop			;a397	00 	. 
	adc a,l			;a398	8d 	. 
	and (hl)			;a399	a6 	. 
	call z,0032eh		;a39a	cc 2e 03 	. . . 
	nop			;a39d	00 	. 
	sub e			;a39e	93 	. 
	and (hl)			;a39f	a6 	. 
	inc e			;a3a0	1c 	. 
	ld l,000h		;a3a1	2e 00 	. . 
	nop			;a3a3	00 	. 
	sub (hl)			;a3a4	96 	. 
	and (hl)			;a3a5	a6 	. 
	call z,0042eh		;a3a6	cc 2e 04 	. . . 
	nop			;a3a9	00 	. 
	sbc a,c			;a3aa	99 	. 
	and (hl)			;a3ab	a6 	. 
	call z,0002eh		;a3ac	cc 2e 00 	. . . 
	nop			;a3af	00 	. 
	ret nc			;a3b0	d0 	. 
	and (hl)			;a3b1	a6 	. 
	sbc a,h			;a3b2	9c 	. 
	dec l			;a3b3	2d 	- 
	nop			;a3b4	00 	. 
	nop			;a3b5	00 	. 
	push de			;a3b6	d5 	. 
	and (hl)			;a3b7	a6 	. 
	ld b,02dh		;a3b8	06 2d 	. - 
	nop			;a3ba	00 	. 
	nop			;a3bb	00 	. 
	ret c			;a3bc	d8 	. 
	and (hl)			;a3bd	a6 	. 
	jp c,0002eh		;a3be	da 2e 00 	. . . 
	nop			;a3c1	00 	. 
	add a,a			;a3c2	87 	. 
	xor b			;a3c3	a8 	. 
	sbc a,b			;a3c4	98 	. 
	ld l,000h		;a3c5	2e 00 	. . 
	nop			;a3c7	00 	. 
	and l			;a3c8	a5 	. 
	xor b			;a3c9	a8 	. 
	inc e			;a3ca	1c 	. 
	ld l,000h		;a3cb	2e 00 	. . 
	nop			;a3cd	00 	. 
	xor b			;a3ce	a8 	. 
	xor b			;a3cf	a8 	. 
	inc e			;a3d0	1c 	. 
	ld l,000h		;a3d1	2e 00 	. . 
	nop			;a3d3	00 	. 
	ret			;a3d4	c9 	. 
	xor b			;a3d5	a8 	. 
	
	nop			;a3d6	00 	. 
	nop			;a3d7	00 	. 
	nop			;a3d8	00 	. 
	nop			;a3d9	00 	. 
	nop			;a3da	00 	. 
	nop			;a3db	00 	. 
	nop			;a3dc	00 	. 
	nop			;a3dd	00 	. 
	nop			;a3de	00 	. 
	nop			;a3df	00 	. 
	nop			;a3e0	00 	. 
	nop			;a3e1	00 	. 
	nop			;a3e2	00 	. 
	nop			;a3e3	00 	. 
	nop			;a3e4	00 	. 
	nop			;a3e5	00 	. 
	nop			;a3e6	00 	. 
	nop			;a3e7	00 	. 
	nop			;a3e8	00 	. 
	nop			;a3e9	00 	. 
	nop			;a3ea	00 	. 
	nop			;a3eb	00 	. 
	nop			;a3ec	00 	. 
	nop			;a3ed	00 	. 
	nop			;a3ee	00 	. 
	nop			;a3ef	00 	. 
	nop			;a3f0	00 	. 
	nop			;a3f1	00 	. 
	nop			;a3f2	00 	. 
	nop			;a3f3	00 	. 
	nop			;a3f4	00 	. 
	nop			;a3f5	00 	. 
	nop			;a3f6	00 	. 
	nop			;a3f7	00 	. 
	nop			;a3f8	00 	. 
	nop			;a3f9	00 	. 
	nop			;a3fa	00 	. 
	nop			;a3fb	00 	. 
	nop			;a3fc	00 	. 
	nop			;a3fd	00 	. 
	nop			;a3fe	00 	. 
	nop			;a3ff	00 	. 
	nop			;a400	00 	. 
	nop			;a401	00 	. 
	nop			;a402	00 	. 
	nop			;a403	00 	. 
	nop			;a404	00 	. 
	nop			;a405	00 	. 
	nop			;a406	00 	. 
	nop			;a407	00 	. 
	nop			;a408	00 	. 
	nop			;a409	00 	. 
	nop			;a40a	00 	. 
	nop			;a40b	00 	. 
	nop			;a40c	00 	. 
	nop			;a40d	00 	. 
	nop			;a40e	00 	. 
	nop			;a40f	00 	. 

;; PO-002	
;; see tetris.asm, line 52ff
;; this is __init entry point
;;
;; __init
	ld hl,0a44ch		;a410	21 4c a4 	! L . 
	ld de,02a00h		;a413	11 00 2a 	. . * 
	ld bc,00036h		;a416	01 36 00 	. 6 . 
	ldir		;a419	ed b0 	. . 
	call 02a00h		;a41b	cd 00 2a 	. . * 

;; unknown part follows
	ld ix,0a190h		;a41e	dd 21 90 a1 	. ! . . 
	ld bc,(0a180h)		;a422	ed 4b 80 a1 	. K . . 
	ld l,(ix+000h)		;a426	dd 6e 00 	. n . 
	ld h,(ix+001h)		;a429	dd 66 01 	. f . 
	ld e,(hl)			;a42c	5e 	^ 
	inc hl			;a42d	23 	# 
	ld d,(hl)			;a42e	56 	V 
	ld l,(ix+002h)		;a42f	dd 6e 02 	. n . 
	ld h,(ix+003h)		;a432	dd 66 03 	. f . 
	add hl,de			;a435	19 	. 
	ex de,hl			;a436	eb 	. 
	ld l,(ix+004h)		;a437	dd 6e 04 	. n . 
	ld h,(ix+005h)		;a43a	dd 66 05 	. f . 
	ld (hl),e			;a43d	73 	s 
	inc hl			;a43e	23 	# 
	ld (hl),d			;a43f	72 	r 
	ld de,00006h		;a440	11 06 00 	. . . 
	add ix,de		;a443	dd 19 	. . 
	dec bc			;a445	0b 	. 
	ld a,b			;a446	78 	x 
	or c			;a447	b1 	. 
	jr nz,$-34		;a448	20 dc 	  . 
	ret			;a44a	c9 	. 

	nop			;a44b	00 	. 

;; see line 138ff
;; this is: _dll_stub 
;;
;; _dll_stub
	ld a,004h		;a44c	3e 04 	> . 
	out (020h),a		;a44e	d3 20 	.   
	ld hl,08000h		;a450	21 00 80 	! . . 
	ld de,02d00h		;a453	11 00 2d 	. . - 
	ld bc,00134h		;a456	01 34 01 	. 4 . 
	ldir		;a459	ed b0 	. . 
	ld a,002h		;a45b	3e 02 	> . 
	out (020h),a		;a45d	d3 20 	.   
	ld hl,(02d0ch)		;a45f	2a 0c 2d 	* . - 
	ld bc,00003h		;a462	01 03 00 	. . . 
	ld a,011h		;a465	3e 11 	> . 
	call 0a482h		;a467	cd 82 a4 	. . . 
	ld hl,(02e16h)		;a46a	2a 16 2e 	* . . 
	ld a,(hl)			;a46d	7e 	~ 
	inc hl			;a46e	23 	# 
	ld h,(hl)			;a46f	66 	f 
	ld l,a			;a470	6f 	o 
	ld bc,00006h		;a471	01 06 00 	. . . 
	ld a,044h		;a474	3e 44 	> D 
	call 0a482h		;a476	cd 82 a4 	. . . 

	ld bc,00002h		;a479	01 02 00 	. . . 
	ld a,01dh		;a47c	3e 1d 	> . 
	call 0a482h		;a47e	cd 82 a4 	. . . 
	ret			;a481	c9 	. 

;; la246h: label
	ld ix,0a44bh		;a482	dd 21 4b a4 	. ! K . 
	ld (ix+000h),a		;a486	dd 77 00 	. w . 
	ld a,l			;a489	7d 	} 
	ld (de),a			;a48a	12 	. 
	inc de			;a48b	13 	. 
	ld a,h			;a48c	7c 	| 
	ld (de),a			;a48d	12 	. 
	inc de			;a48e	13 	. 
	add hl,bc			;a48f	09 	. 
	dec (ix+000h)		;a490	dd 35 00 	. 5 . 
	jr nz,$-10		;a493	20 f4 	  . 
	ret			;a495	c9 	. 

	ld (bc),a			;a496	02 	. 

;; POI-001 We have "di" here, looks like main entry point... 
;; Check that POI-000, at a147, does a jump to "here"
	di			;a497	f3 	. 
;; call to __init see POI-002	
	call 0a410h		;a498	cd 10 a4 	. . . 
;; next call is to location 1543 in PAGE ROM
	call 01543h		;a49b	cd 43 15 	. C .
;; next call is to location fe9 in PAGE ROM		
	call 00fe9h		;a49e	cd e9 0f 	
;; a:=(fd4)	. . . 
	ld a,(00fd4h)		;a4a1	3a d4 0f 	: . . 
;; isolate highest bit
	and 07fh		;a4a4	e6 7f 	.  
;; (496) is 2h, so this line 496 looks like a defb 02h	
;; so we save highest bit in (496), i.e. in 2
;; (a496):=a
	ld (0a496h),a		;a4a6	32 96 a4 	2 . .
;; a:=6
	ld a,006h		;a4a9	3e 06 	> . 
;; (fd4):=a	
	ld (00fd4h),a		;a4ab	32 d4 0f 	2 . .
;; hl:=a4cd
;; POI-010 a4cd seems to be some data or table section see POI-010
	ld hl,0a4cdh		;a4ae	21 cd a4 	! . . 
;; (fd5):=hl
;; so (fd5) now points to the data just mentioned
	ld (00fd5h),hl		;a4b1	22 d5 0f 	" . . 
;; call to a9c7h, see POI-003
	call 0a9c7h		;a4b4	cd c7 a9 	. . . 
;; hl:=c000, which is start of mass store ROM	
	ld hl,0c000h		;a4b7	21 00 c0 	! . .
;; de:=2a00, points to Applic.RAM	
	ld de,02a00h		;a4ba	11 00 2a 	. . *
;; bc:=1400, which is in page ROM	
	ld bc,01400h		;a4bd	01 00 14 	. . . 
	ldir		;a4c0	ed b0 	. .
;; unknown call to Applic.RAM	
	call 02b23h		;a4c2	cd 23 2b 	. # + 
;; unknown call to Applic.RAM	
	call 02b8fh		;a4c5	cd 8f 2b 	. . + 

;; POI-999 return to main menu, means we leave this app
;; see 14d5 in gfxdemo.asm	
	jp 014d5h		;a4c8	c3 d5 14 	. . . 
	
	
;; POI-011, somes to be table or data, used by POI-10 line	
	ld hl,0f376h		;a4cb	21 76 f3 	! v . 
	ld hl,07621h		;a4ce	21 21 76 	! ! v 
	ld (0a4cbh),hl		;a4d1	22 cb a4 	" . . 
	di			;a4d4	f3 	. 
	ld a,(0a530h)		;a4d5	3a 30 a5 	: 0 . 
	ld (010b5h),a		;a4d8	32 b5 10 	2 . . 
	ld (0112dh),a		;a4db	32 2d 11 	2 - . 
	ld (01067h),a		;a4de	32 67 10 	2 g . 
	ld (01133h),a		;a4e1	32 33 11 	2 3 . 
	ld hl,0c000h		;a4e4	21 00 c0 	! . . 
	ld de,02a00h		;a4e7	11 00 2a 	. . * 
	ld bc,01400h		;a4ea	01 00 14 	. . . 
	ldir		;a4ed	ed b0 	. . 
	call 0a533h		;a4ef	cd 33 a5 	. 3 . 
	ld a,021h		;a4f2	3e 21 	> ! 
	ld (07501h),a		;a4f4	32 01 75 	2 . u 
	ei			;a4f7	fb 	. 
	
	ld a,(03f12h)		;a4f8	3a 12 3f 	: . ? 
	cp 003h		;a4fb	fe 03 	. . 
	jr z,$+33		;a4fd	28 1f 	( . 
	call 0a53fh		;a4ff	cd 3f a5 	. ? . 
	call 02b23h		;a502	cd 23 2b 	. # + 
	call 0007eh		;a505	cd 7e 00 	. ~ . 
;; a:=(496)	
	ld a,(0a496h)		;a508	3a 96 a4 	: . . 
;; (110c) := a	
	ld (0110ch),a		;a50b	32 0c 11 	2 . . 
;; hl:=da20
	ld hl,0da20h		;a50e	21 20 da 	!   . 
;; (0110f):=h1	
	ld (0110dh),hl		;a511	22 0d 11 	" . . 
;; h1:= (a4cb)
	ld hl,(0a4cbh)		;a514	2a cb a4 	* . . 
;; save hl
	push hl			;a517	e5 	. 
;; call main menu handler	
	call 01109h		;a518	cd 09 11 	. . . 
;; restore hl
	pop hl			;a51b	e1 	. 
	jr $+11		;a51c	18 09 	. . 
	call 0a8ech		;a51e	cd ec a8 	. . . 
	call 0a53fh		;a521	cd 3f a5 	. ? . 
	call 02cfch		;a524	cd fc 2c 	. . , 
	ld hl,0761ch		;a527	21 1c 76 	! . v 
	ld (0a4cbh),hl		;a52a	22 cb a4 	" . . 

	jp 0a4d4h		;a52d	c3 d4 a4 	. . . 
	call 00000h		;a530	cd 00 00 	. . . 
	ld hl,0dbe0h		;a533	21 e0 db 	! . . 
	ld de,03f00h		;a536	11 00 3f 	. . ? 
	ld bc,00020h		;a539	01 20 00 	.   . 
	ldir		;a53c	ed b0 	. . 
	ret			;a53e	c9 	. 

	ld hl,03f00h		;a53f	21 00 3f 	! . ? 
	ld de,0dbe0h		;a542	11 e0 db 	. . . 
	ld bc,00020h		;a545	01 20 00 	.   . 
	ldir		;a548	ed b0 	. . 
	ret			;a54a	c9 	. 

	ld hl,01234h		;a54b	21 34 12 	! 4 . 
	dec hl			;a54e	2b 	+ 
	ld a,l			;a54f	7d 	} 
	or h			;a550	b4 	. 
	jr nz,$-3		;a551	20 fb 	  . 
	call 0a533h		;a553	cd 33 a5 	. 3 . 
	call 0a5f9h		;a556	cd f9 a5 	. . . 
	call 0a6e7h		;a559	cd e7 a6 	. . . 
	call 0a6e7h		;a55c	cd e7 a6 	. . . 
	call 0a702h		;a55f	cd 02 a7 	. . . 
	call 0a702h		;a562	cd 02 a7 	. . . 
	call 0a56fh		;a565	cd 6f a5 	. o . 
	call 0a606h		;a568	cd 06 a6 	. . . 
	call 0a53fh		;a56b	cd 3f a5 	. ? . 
	ret			;a56e	c9 	. 

	call 0af71h		;a56f	cd 71 af 	. q . 
	jr z,$+69		;a572	28 43 	( C 
	ld a,(03f01h)		;a574	3a 01 3f 	: . ? 
	and c			;a577	a1 	. 
	ld c,a			;a578	4f 	O 
	jp p,0a580h		;a579	f2 80 a5 	. . . 
	res 7,b		;a57c	cb b8 	. . 
	res 6,b		;a57e	cb b0 	. . 
	ld a,c			;a580	79 	y 
	cp 020h		;a581	fe 20 	.   
	jr nc,$+28		;a583	30 1a 	0 . 
	cp 01bh		;a585	fe 1b 	. . 
	jr z,$+24		;a587	28 16 	( . 
	cp 00ah		;a589	fe 0a 	. . 
	jr z,$+20		;a58b	28 12 	( . 
	cp 00dh		;a58d	fe 0d 	. . 
	jr z,$+16		;a58f	28 0e 	( . 
	cp 008h		;a591	fe 08 	. . 
	jr z,$+12		;a593	28 0a 	( . 
	cp 007h		;a595	fe 07 	. . 
	jr z,$+8		;a597	28 06 	( . 
	ld a,(03f0eh)		;a599	3a 0e 3f 	: . ? 
	or a			;a59c	b7 	. 
	jr z,$+7		;a59d	28 05 	( . 
	push bc			;a59f	c5 	. 
	call 0aa21h		;a5a0	cd 21 aa 	. ! . 
	pop bc			;a5a3	c1 	. 
	ld a,005h		;a5a4	3e 05 	> . 
	cp c			;a5a6	b9 	. 
	jr nz,$+14		;a5a7	20 0c 	  . 
	ld a,(03f06h)		;a5a9	3a 06 3f 	: . ? 
	cp 001h		;a5ac	fe 01 	. . 
	jr nz,$+7		;a5ae	20 05 	  . 
	ld a,006h		;a5b0	3e 06 	> . 
	call 0a912h		;a5b2	cd 12 a9 	. . . 
	jr $-70		;a5b5	18 b8 	. . 
	ei			;a5b7	fb 	. 
	call 0a71dh		;a5b8	cd 1d a7 	. . . 
	jr z,$+59		;a5bb	28 39 	( 9 
	jp nc,0a5d5h		;a5bd	d2 d5 a5 	. . . 
	call 0a912h		;a5c0	cd 12 a9 	. . . 
	cp 00dh		;a5c3	fe 0d 	. . 
	jr nz,$+49		;a5c5	20 2f 	  / 
	ld a,(03f10h)		;a5c7	3a 10 3f 	: . ? 
	cp 001h		;a5ca	fe 01 	. . 
	jr nz,$+42		;a5cc	20 28 	  ( 
	ld a,00ah		;a5ce	3e 0a 	> . 
	call 0a912h		;a5d0	cd 12 a9 	. . . 
	jr $+35		;a5d3	18 21 	. ! 
	cp 0f8h		;a5d5	fe f8 	. . 
	ret z			;a5d7	c8 	. 

	cp 0fah		;a5d8	fe fa 	. . 
	jr nz,$+7		;a5da	20 05 	  . 
	call 0a922h		;a5dc	cd 22 a9 	. " . 
	jr $+23		;a5df	18 15 	. . 
	cp 0fbh		;a5e1	fe fb 	. . 
	jr nz,$+7		;a5e3	20 05 	  . 
	call 0a702h		;a5e5	cd 02 a7 	. . . 
	jr $+14		;a5e8	18 0c 	. . 
	cp 0ffh		;a5ea	fe ff 	. . 
	jr nz,$+7		;a5ec	20 05 	  . 
	call 0a6e7h		;a5ee	cd e7 a6 	. . . 
	jr $+5		;a5f1	18 03 	. . 
	call 0a9e0h		;a5f3	cd e0 a9 	. . . 
	jp 0a56fh		;a5f6	c3 6f a5 	. o . 
	call 0a9d7h		;a5f9	cd d7 a9 	. . . 
	call 0a6d4h		;a5fc	cd d4 a6 	. . . 
	call 0aee5h		;a5ff	cd e5 ae 	. . . 
	call 0a87bh		;a602	cd 7b a8 	. { . 
	ret			;a605	c9 	. 

	call 0a8e3h		;a606	cd e3 a8 	. . . 
	ret			;a609	c9 	. 
	nop			;a60a	00 	. 
	nop			;a60b	00 	. 
	nop			;a60c	00 	. 
	nop			;a60d	00 	. 
	call 0a533h		;a60e	cd 33 a5 	. 3 . 
	call 0a87bh		;a611	cd 7b a8 	. { . 
	call 0a8e3h		;a614	cd e3 a8 	. . . 
	call 0a92bh		;a617	cd 2b a9 	. + . 
	call 0a53fh		;a61a	cd 3f a5 	. ? . 
	ld a,(0a609h)		;a61d	3a 09 a6 	: . . 
	ld (010b5h),a		;a620	32 b5 10 	2 . . 
	ld (0112dh),a		;a623	32 2d 11 	2 - . 
	ld (01067h),a		;a626	32 67 10 	2 g . 
	ld (01133h),a		;a629	32 33 11 	2 3 . 
	ld a,(01058h)		;a62c	3a 58 10 	: X . 
	ld (0a60ah),a		;a62f	32 0a a6 	2 . . 
	ld hl,(01059h)		;a632	2a 59 10 	* Y . 
	ld (0a60ch),hl		;a635	22 0c a6 	" . . 
	ld a,006h		;a638	3e 06 	> . 
	ld (01058h),a		;a63a	32 58 10 	2 X . 
	ld hl,0a646h		;a63d	21 46 a6 	! F . 
	ld (01059h),hl		;a640	22 59 10 	" Y . 
	jp 01381h		;a643	c3 81 13 	. . . 
	push af			;a646	f5 	. 
	push hl			;a647	e5 	. 
	ld a,(0a60ah)		;a648	3a 0a a6 	: . . 
	ld (01058h),a		;a64b	32 58 10 	2 X . 
	ld hl,(0a60ch)		;a64e	2a 0c a6 	* . . 
	ld (01059h),hl		;a651	22 59 10 	" Y . 
	ld a,(016e2h)		;a654	3a e2 16 	: . . 
	ld (0a60bh),a		;a657	32 0b a6 	2 . . 
	ld hl,(016e3h)		;a65a	2a e3 16 	* . . 
	ld (0a60ch),hl		;a65d	22 0c a6 	" . . 
	ld a,(0a679h)		;a660	3a 79 a6 	: y . 
	ld (016e2h),a		;a663	32 e2 16 	2 . . 
	ld hl,01103h		;a666	21 03 11 	! . . 
	ld (016e3h),hl		;a669	22 e3 16 	" . . 
	ld a,006h		;a66c	3e 06 	> . 
	ld (01106h),a		;a66e	32 06 11 	2 . . 
	ld hl,0a67ch		;a671	21 7c a6 	! | . 
	ld (01107h),hl		;a674	22 07 11 	" . . 
	pop hl			;a677	e1 	. 
	pop af			;a678	f1 	. 
	jp 01055h		;a679	c3 55 10 	. U . 
	push ix		;a67c	dd e5 	. . 
	push af			;a67e	f5 	. 
	push hl			;a67f	e5 	. 
	ld a,(0a60bh)		;a680	3a 0b a6 	: . . 
	ld (016e2h),a		;a683	32 e2 16 	2 . . 
	ld hl,(0a60ch)		;a686	2a 0c a6 	* . . 
	ld (016e3h),hl		;a689	22 e3 16 	" . . 
	call 016e2h		;a68c	cd e2 16 	. . . 
	ld a,(0a60ah)		;a68f	3a 0a a6 	: . . 
	ld (01106h),a		;a692	32 06 11 	2 . . 
	ld hl,016e2h		;a695	21 e2 16 	! . . 
	ld (01107h),hl		;a698	22 07 11 	" . . 
	ld ix,02808h		;a69b	dd 21 08 28 	. ! . ( 
	ld a,(ix+008h)		;a69f	dd 7e 08 	. ~ . 
	ld (ix+002h),a		;a6a2	dd 77 02 	. w . 
	ld (ix+004h),a		;a6a5	dd 77 04 	. w . 
	ld (ix+006h),a		;a6a8	dd 77 06 	. w . 
	ld a,(ix+009h)		;a6ab	dd 7e 09 	. ~ . 
	ld (ix+003h),a		;a6ae	dd 77 03 	. w . 
	ld (ix+005h),a		;a6b1	dd 77 05 	. w . 
	ld (ix+007h),a		;a6b4	dd 77 07 	. w . 
	set 1,(ix+013h)		;a6b7	dd cb 13 ce 	. . . . 
	set 7,(ix+013h)		;a6bb	dd cb 13 fe 	. . . . 
	set 7,(ix+037h)		;a6bf	dd cb 37 fe 	. . 7 . 
	ld hl,00000h		;a6c3	21 00 00 	! . . 
	ld (01df8h),hl		;a6c6	22 f8 1d 	" . . 
	out (080h),a		;a6c9	d3 80 	. . 
	pop hl			;a6cb	e1 	. 
	pop af			;a6cc	f1 	. 
	pop ix		;a6cd	dd e1 	. . 
	jp 01103h		;a6cf	c3 03 11 	. . . 
	jr nz,$+34		;a6d2	20 20 	    
	call 01961h		;a6d4	cd 61 19 	. a . 
	call 01982h		;a6d7	cd 82 19 	. . . 
	xor a			;a6da	af 	. 
	ld (07e00h),a		;a6db	32 00 7e 	2 . ~ 
	ld a,020h		;a6de	3e 20 	>   
	ld (0a6d2h),a		;a6e0	32 d2 a6 	2 . . 
	ld (0a6d3h),a		;a6e3	32 d3 a6 	2 . . 
	ret			;a6e6	c9 	. 

	ld a,(0a6d2h)		;a6e7	3a d2 a6 	: . . 
	cp 020h		;a6ea	fe 20 	.   
	jr nz,$+6		;a6ec	20 04 	  . 
	ld a,02ah		;a6ee	3e 2a 	> * 
	jr $+4		;a6f0	18 02 	. . 
	ld a,020h		;a6f2	3e 20 	>   
	ld (0a6d2h),a		;a6f4	32 d2 a6 	2 . . 
	call 0abb2h		;a6f7	cd b2 ab 	. . . 
	ld a,(0a6d2h)		;a6fa	3a d2 a6 	: . . 
	ret			;a6fd	c9 	. 

	ld a,(0a6d2h)		;a6fe	3a d2 a6 	: . . 
	ret			;a701	c9 	. 

	ld a,(0a6d3h)		;a702	3a d3 a6 	: . . 
	cp 020h		;a705	fe 20 	.   
	jr nz,$+6		;a707	20 04 	  . 
	ld a,02ah		;a709	3e 2a 	> * 
	jr $+4		;a70b	18 02 	. . 
	ld a,020h		;a70d	3e 20 	>   
	ld (0a6d3h),a		;a70f	32 d3 a6 	2 . . 
	call 0abb6h		;a712	cd b6 ab 	. . . 
	ld a,(0a6d3h)		;a715	3a d3 a6 	: . . 
	ret			;a718	c9 	. 

	ld a,(0a6d3h)		;a719	3a d3 a6 	: . . 
	ret			;a71c	c9 	. 

	call 0a852h		;a71d	cd 52 a8 	. R . 
	ret z			;a720	c8 	. 

	ld l,a			;a721	6f 	o 
	or l			;a722	b5 	. 
	ret m			;a723	f8 	. 

	ld a,(0a6d2h)		;a724	3a d2 a6 	: . . 
	cp 02ah		;a727	fe 2a 	. * 
	jr nz,$+14		;a729	20 0c 	  . 
	ld a,l			;a72b	7d 	} 
	cp 061h		;a72c	fe 61 	. a 
	jr c,$+9		;a72e	38 07 	8 . 
	cp 07bh		;a730	fe 7b 	. { 
	jr nc,$+5		;a732	30 03 	0 . 
	sub 020h		;a734	d6 20 	.   
	ld l,a			;a736	6f 	o 
	or a			;a737	b7 	. 
	ret m			;a738	f8 	. 

	ld a,(0a6d3h)		;a739	3a d3 a6 	: . . 
	ld h,a			;a73c	67 	g 
	cp 020h		;a73d	fe 20 	.   
	jr nz,$+7		;a73f	20 05 	  . 
	or 0ffh		;a741	f6 ff 	. . 
	scf			;a743	37 	7 
	ld a,l			;a744	7d 	} 
	ret			;a745	c9 	. 

	ld a,l			;a746	7d 	} 
	cp 030h		;a747	fe 30 	. 0 
	jr c,$+58		;a749	38 38 	8 8 
	cp 03ah		;a74b	fe 3a 	. : 
	jr c,$+18		;a74d	38 10 	8 . 
	cp 041h		;a74f	fe 41 	. A 
	jr c,$+50		;a751	38 30 	8 0 
	cp 047h		;a753	fe 47 	. G 
	jr c,$+10		;a755	38 08 	8 . 
	cp 061h		;a757	fe 61 	. a 
	jr c,$+42		;a759	38 28 	8 ( 
	cp 067h		;a75b	fe 67 	. g 
	jr nc,$+38		;a75d	30 24 	0 $ 
	ld a,h			;a75f	7c 	| 
	cp 02ah		;a760	fe 2a 	. * 
	ld a,l			;a762	7d 	} 
	jr z,$+26		;a763	28 18 	( . 
	call 0a785h		;a765	cd 85 a7 	. . . 
	ld l,a			;a768	6f 	o 
	ld a,h			;a769	7c 	| 
	call 0a785h		;a76a	cd 85 a7 	. . . 
	add a,a			;a76d	87 	. 
	add a,a			;a76e	87 	. 
	add a,a			;a76f	87 	. 
	add a,a			;a770	87 	. 
	add a,l			;a771	85 	. 
	ld l,a			;a772	6f 	o 
	ld a,02ah		;a773	3e 2a 	> * 
	ld (0a6d3h),a		;a775	32 d3 a6 	2 . . 
	call 0abb6h		;a778	cd b6 ab 	. . . 
	jr $-58		;a77b	18 c4 	. . 
	ld (0a6d3h),a		;a77d	32 d3 a6 	2 . . 
	call 0abb6h		;a780	cd b6 ab 	. . . 
	xor a			;a783	af 	. 
	ret			;a784	c9 	. 

	cp 03ah		;a785	fe 3a 	. : 
	jr nc,$+5		;a787	30 03 	0 . 
	sub 030h		;a789	d6 30 	. 0 
	ret			;a78b	c9 	. 

	sub 057h		;a78c	d6 57 	. W 
	ret p			;a78e	f0 	. 

	add a,020h		;a78f	c6 20 	.   
	ret			;a791	c9 	. 
	ret m			;a792	f8 	. 
	rst 38h			;a793	ff 	. 
	cp 0fdh		;a794	fe fd 	. . 
	call m,0fafbh		;a796	fc fb fa 	. . . 
	ld sp,hl			;a799	f9 	. 
	rst 18h			;a79a	df 	. 
	dec c			;a79b	0d 	. 
	ex af,af'			;a79c	08 	. 
	rst 18h			;a79d	df 	. 
	dec c			;a79e	0d 	. 
	dec c			;a79f	0d 	. 
	dec c			;a7a0	0d 	. 
	
;; character array follows, containing 0-9,a-z, A-Z,
	defb " 0123456789:;,-./`"
	defb "abcdefghijklmnopqrstuvwxyz"
	defb "[\\]^_"
	ret m			;a7d2	f8 	. 

	rst 38h			;a7d3	ff 	. 
	cp 0fdh		;a7d4	fe fd 	. . 
	call m,0fafbh		;a7d6	fc fb fa 	. . . 
	ld sp,hl			;a7d9	f9 	. 
	rst 30h			;a7da	f7 	. 
	or 0f5h		;a7db	f6 f5 	. . 
	call p,00d0dh		;a7dd	f4 0d 0d 	. . . 
	dec c			;a7e0	0d 	. 
	jr nz,$+97		;a7e1	20 5f 	  _ 
	
	defb "!\"#$%&'()*+<=>?"
	defb "@ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	defb "{|}~"

	ld a,a			;a811	7f 	 
	ret m			;a812	f8 	. 
;; line above seems to be end of character array

	rst 38h			;a813	ff 	. 
	cp 0fdh		;a814	fe fd 	. . 
	call m,0fafbh		;a816	fc fb fa 	. . . 
	ld sp,hl			;a819	f9 	. 
	rst 30h			;a81a	f7 	. 
	or 0f5h		;a81b	f6 f5 	. . 
	call p,00d0dh		;a81d	f4 0d 0d 	. . . 
	dec c			;a820	0d 	. 
	jr nz,$+129		;a821	20 7f 	   
	ld sp,03332h		;a823	31 32 33 	1 2 3 
	inc (hl)			;a826	34 	4 
	dec (hl)			;a827	35 	5 
	ld (hl),037h		;a828	36 37 	6 7 
	jr c,$+59		;a82a	38 39 	8 9 
	ld a,(de)			;a82c	1a 	. 
	dec de			;a82d	1b 	. 
	inc e			;a82e	1c 	. 
	dec e			;a82f	1d 	. 
	ld e,01fh		;a830	1e 1f 	. . 
	nop			;a832	00 	. 
	ld bc,00302h		;a833	01 02 03 	. . . 
	inc b			;a836	04 	. 
	dec b			;a837	05 	. 
	ld b,007h		;a838	06 07 	. . 
	ex af,af'			;a83a	08 	. 
	add hl,bc			;a83b	09 	. 
	ld a,(bc)			;a83c	0a 	. 
	dec bc			;a83d	0b 	. 
	inc c			;a83e	0c 	. 
	dec c			;a83f	0d 	. 
	ld c,00fh		;a840	0e 0f 	. . 
	djnz $+19		;a842	10 11 	. . 
	ld (de),a			;a844	12 	. 
	inc de			;a845	13 	. 
	inc d			;a846	14 	. 
	dec d			;a847	15 	. 
	ld d,017h		;a848	16 17 	. . 
	jr $+27		;a84a	18 19 	. . 
	ld a,(de)			;a84c	1a 	. 
	dec de			;a84d	1b 	. 
	inc e			;a84e	1c 	. 
	dec e			;a84f	1d 	. 
	ld e,01fh		;a850	1e 1f 	. . 
	ld a,(07e00h)		;a852	3a 00 7e 	: . ~ 
	or a			;a855	b7 	. 
	ret z			;a856	c8 	. 

	ld bc,(07e01h)		;a857	ed 4b 01 7e 	. K . ~ 
	xor a			;a85b	af 	. 
	ld (07e00h),a		;a85c	32 00 7e 	2 . ~ 
	bit 3,b		;a85f	cb 58 	. X 
	jr nz,$+11		;a861	20 09 	  . 
	bit 2,b		;a863	cb 50 	. P 
	jr nz,$+12		;a865	20 0a 	  . 
	ld hl,0a792h		;a867	21 92 a7 	! . . 
	jr $+10		;a86a	18 08 	. . 
	ld hl,0a7d2h		;a86c	21 d2 a7 	! . . 
	jr $+5		;a86f	18 03 	. . 
	ld hl,0a812h		;a871	21 12 a8 	! . . 
	ld b,000h		;a874	06 00 	. . 
	add hl,bc			;a876	09 	. 
	ld a,(hl)			;a877	7e 	~ 
	cp 0dfh		;a878	fe df 	. . 
	ret			;a87a	c9 	. 

	ld a,(03f12h)		;a87b	3a 12 3f 	: . ? 
	or a			;a87e	b7 	. 
	jr nz,$+115		;a87f	20 71 	  q 
	ld a,0aah		;a881	3e aa 	> . 
	ld (01df8h),a		;a883	32 f8 1d 	2 . . 
	call 0112dh		;a886	cd 2d 11 	. - . 
	call 0a89fh		;a889	cd 9f a8 	. . . 
	ld a,001h		;a88c	3e 01 	> . 
	ld (0dff0h),a		;a88e	32 f0 df 	2 . . 
	ld a,002h		;a891	3e 02 	> . 
	ld (03f12h),a		;a893	32 12 3f 	2 . ? 
	ret			;a896	c9 	. 

	ld a,(0dff0h)		;a897	3a f0 df 	: . . 
	cp 000h		;a89a	fe 00 	. . 
	jr nz,$-5		;a89c	20 f9 	  . 
	ret			;a89e	c9 	. 

	ld a,0ffh		;a89f	3e ff 	> . 
	ld (01df8h),a		;a8a1	32 f8 1d 	2 . . 
	call 01067h		;a8a4	cd 67 10 	. g . 
	call 016e2h		;a8a7	cd e2 16 	. . . 
	ld hl,0d400h		;a8aa	21 00 d4 	! . . 
	ld (01dfah),hl		;a8ad	22 fa 1d 	" . . 
	ld hl,07800h		;a8b0	21 00 78 	! . x 
	ld (01dfch),hl		;a8b3	22 fc 1d 	" . . 
	ld hl,00800h		;a8b6	21 00 08 	! . . 
	ld (01dfeh),hl		;a8b9	22 fe 1d 	" . . 
	ld a,000h		;a8bc	3e 00 	> . 
	ld (01df9h),a		;a8be	32 f9 1d 	2 . . 
	ld a,000h		;a8c1	3e 00 	> . 
	ld (01df8h),a		;a8c3	32 f8 1d 	2 . . 
	out (080h),a		;a8c6	d3 80 	. . 
	call 016e2h		;a8c8	cd e2 16 	. . . 
	ld a,000h		;a8cb	3e 00 	> . 
	ld (0dff0h),a		;a8cd	32 f0 df 	2 . . 
	ld hl,07800h		;a8d0	21 00 78 	! . x 
	ld (01dfah),hl		;a8d3	22 fa 1d 	" . . 
	ld a,004h		;a8d6	3e 04 	> . 
	ld (01df9h),a		;a8d8	32 f9 1d 	2 . . 
	ld a,000h		;a8db	3e 00 	> . 
	ld (01df8h),a		;a8dd	32 f8 1d 	2 . . 
	out (080h),a		;a8e0	d3 80 	. . 
	ret			;a8e2	c9 	. 

	call 0a897h		;a8e3	cd 97 a8 	. . . 
	ld a,005h		;a8e6	3e 05 	> . 
	ld (0dff0h),a		;a8e8	32 f0 df 	2 . . 
	ret			;a8eb	c9 	. 

	ld a,002h		;a8ec	3e 02 	> . 
	ld (03f12h),a		;a8ee	32 12 3f 	2 . ? 
	ret			;a8f1	c9 	. 

	call 0a89fh		;a8f2	cd 9f a8 	. . . 
	ld a,008h		;a8f5	3e 08 	> . 
	ld (0dff0h),a		;a8f7	32 f0 df 	2 . . 
	ld a,002h		;a8fa	3e 02 	> . 
	ld (03f12h),a		;a8fc	32 12 3f 	2 . ? 
	ret			;a8ff	c9 	. 

	ld a,(03f12h)		;a900	3a 12 3f 	: . ? 
	or a			;a903	b7 	. 
	ret z			;a904	c8 	. 

	call 0a89fh		;a905	cd 9f a8 	. . . 
	ld a,007h		;a908	3e 07 	> . 
	ld (0dff0h),a		;a90a	32 f0 df 	2 . . 
	xor a			;a90d	af 	. 
	ld (03f12h),a		;a90e	32 12 3f 	2 . ? 
	ret			;a911	c9 	. 

	push af			;a912	f5 	. 
	call 0a897h		;a913	cd 97 a8 	. . . 
	pop af			;a916	f1 	. 
	ld c,a			;a917	4f 	O 
	ld (0dff1h),a		;a918	32 f1 df 	2 . . 
	ld a,003h		;a91b	3e 03 	> . 
	ld (0dff0h),a		;a91d	32 f0 df 	2 . . 
	ld a,c			;a920	79 	y 
	ret			;a921	c9 	. 

	call 0a897h		;a922	cd 97 a8 	. . . 
	ld a,004h		;a925	3e 04 	> . 
	ld (0dff0h),a		;a927	32 f0 df 	2 . . 
	ret			;a92a	c9 	. 

	ld b,0ffh		;a92b	06 ff 	. . 
	djnz $+0		;a92d	10 fe 	. . 
	call 0a89fh		;a92f	cd 9f a8 	. . . 
	ld a,006h		;a932	3e 06 	> . 
	ld (0dff0h),a		;a934	32 f0 df 	2 . . 
	call 0a897h		;a937	cd 97 a8 	. . . 
	ld a,003h		;a93a	3e 03 	> . 
	ld (03f12h),a		;a93c	32 12 3f 	2 . ? 
	ret			;a93f	c9 	. 

	nop			;a940	00 	. 
	ld b,b			;a941	40 	@ 
	nop			;a942	00 	. 
	nop			;a943	00 	. 
	ld bc,00026h		;a944	01 26 00 	. & . 
	add hl,hl			;a947	29 	) 
	add hl,hl			;a948	29 	) 
	add hl,hl			;a949	29 	) 
	add hl,hl			;a94a	29 	) 
	add hl,hl			;a94b	29 	) 
	add hl,hl			;a94c	29 	) 
	ld bc,04000h		;a94d	01 00 40 	. . @ 
	add hl,bc			;a950	09 	. 
	ex de,hl			;a951	eb 	. 
	ld bc,00040h		;a952	01 40 00 	. @ . 
	ldir		;a955	ed b0 	. . 
	ld hl,(0a940h)		;a957	2a 40 a9 	* @ . 
	call 0a991h		;a95a	cd 91 a9 	. . . 
	ret			;a95d	c9 	. 

	ld hl,(0a940h)		;a95e	2a 40 a9 	* @ . 
	ld (hl),c			;a961	71 	q 
	inc l			;a962	2c 	, 
	ld (hl),b			;a963	70 	p 
	ret			;a964	c9 	. 

	ld (0a943h),a		;a965	32 43 a9 	2 C . 
	jr $+5		;a968	18 03 	. . 
	ld (0a942h),a		;a96a	32 42 a9 	2 B . 
	ld hl,(0a940h)		;a96d	2a 40 a9 	* @ . 
	call 0a99fh		;a970	cd 9f a9 	. . . 
	ld hl,(0a942h)		;a973	2a 42 a9 	* B . 
	ld h,000h		;a976	26 00 	& . 
	add hl,hl			;a978	29 	) 
	add hl,hl			;a979	29 	) 
	add hl,hl			;a97a	29 	) 
	add hl,hl			;a97b	29 	) 
	add hl,hl			;a97c	29 	) 
	add hl,hl			;a97d	29 	) 
	ld de,04000h		;a97e	11 00 40 	. . @ 
	add hl,de			;a981	19 	. 
	ld de,(0a943h)		;a982	ed 5b 43 a9 	. [ C . 
	ld d,000h		;a986	16 00 	. . 
	add hl,de			;a988	19 	. 
	add hl,de			;a989	19 	. 
	ld (0a940h),hl		;a98a	22 40 a9 	" @ . 
	call 0a991h		;a98d	cd 91 a9 	. . . 
	ret			;a990	c9 	. 

	push af			;a991	f5 	. 
	ld a,(0a944h)		;a992	3a 44 a9 	: D . 
	or a			;a995	b7 	. 
	jr nz,$+4		;a996	20 02 	  . 
	pop af			;a998	f1 	. 
	ret			;a999	c9 	. 

	pop af			;a99a	f1 	. 
	inc l			;a99b	2c 	, 
	set 4,(hl)		;a99c	cb e6 	. . 
	ret			;a99e	c9 	. 

	inc l			;a99f	2c 	, 
	res 4,(hl)		;a9a0	cb a6 	. . 
	dec l			;a9a2	2d 	- 
	ret			;a9a3	c9 	. 

	ld a,001h		;a9a4	3e 01 	> . 
	ld (0a944h),a		;a9a6	32 44 a9 	2 D . 
	ld hl,(0a940h)		;a9a9	2a 40 a9 	* @ . 
	call 0a991h		;a9ac	cd 91 a9 	. . . 
	ret			;a9af	c9 	. 

	xor a			;a9b0	af 	. 
	ld (0a944h),a		;a9b1	32 44 a9 	2 D . 
	ld hl,(0a940h)		;a9b4	2a 40 a9 	* @ . 
	call 0a99fh		;a9b7	cd 9f a9 	. . . 
	ret			;a9ba	c9 	. 

	nop			;a9bb	00 	. 
	ret po			;a9bc	e0 	. 

	nop			;a9bd	00 	. 
	ret pe			;a9be	e8 	. 

	ex af,af'			;a9bf	08 	. 
	nop			;a9c0	00 	. 
	nop			;a9c1	00 	. 
	nop			;a9c2	00 	. 
	ret pe			;a9c3	e8 	. 

	ex af,af'			;a9c4	08 	.
	
;; 0a9c7h POI-003
;; bc:=cd83
	ld bc,0cd83h		;a9c5	01 83 cd 	. . . 
;; ? - adh
	sub 0adh		;a9c8	d6 ad 	. . 

	call 0adf7h		;a9ca	cd f7 ad 	. . .
;; a:=83h	
	ld a,083h		;a9cd	3e 83 	> . 
	call 0a9d3h		;a9cf	cd d3 a9 	. . . 
	ret			;a9d2	c9 	. 

	ld (0a9c6h),a		;a9d3	32 c6 a9 	2 . . 
	ret			;a9d6	c9 	. 

	ld a,001h		;a9d7	3e 01 	> . 
	ld (0a9c5h),a		;a9d9	32 c5 a9 	2 . . 
	call 0aa9ah		;a9dc	cd 9a aa 	. . . 
	ret			;a9df	c9 	. 

	cp 0f7h		;a9e0	fe f7 	. . 
	jr nz,$+7		;a9e2	20 05 	  . 
	call 0ad19h		;a9e4	cd 19 ad 	. . . 
	jr $+54		;a9e7	18 34 	. 4 
	cp 0f6h		;a9e9	fe f6 	. . 
	jr nz,$+7		;a9eb	20 05 	  . 
	call 0ad53h		;a9ed	cd 53 ad 	. S . 
	jr $+45		;a9f0	18 2b 	. + 
	cp 0f5h		;a9f2	fe f5 	. . 
	jr nz,$+7		;a9f4	20 05 	  . 
	call 0ad5dh		;a9f6	cd 5d ad 	. ] . 
	jr $+36		;a9f9	18 22 	. " 
	cp 0f4h		;a9fb	fe f4 	. . 
	jr nz,$+7		;a9fd	20 05 	  . 
	call 0ad70h		;a9ff	cd 70 ad 	. p . 
	jr $+27		;aa02	18 19 	. . 
	cp 0fdh		;aa04	fe fd 	. . 
	jr nz,$+7		;aa06	20 05 	  . 
	call 0ae3ch		;aa08	cd 3c ae 	. < . 
	jr $+18		;aa0b	18 10 	. . 
	cp 0fch		;aa0d	fe fc 	. . 
	jr nz,$+7		;aa0f	20 05 	  . 
	call 0ae18h		;aa11	cd 18 ae 	. . . 
	jr $+9		;aa14	18 07 	. . 
	cp 0feh		;aa16	fe fe 	. . 
	jr nz,$+8		;aa18	20 06 	  . 
	call 0adf7h		;aa1a	cd f7 ad 	. . . 
	call 0aa9ah		;aa1d	cd 9a aa 	. . . 
	ret			;aa20	c9 	. 

	ld a,(0af9dh)		;aa21	3a 9d af 	: . . 
	or a			;aa24	b7 	. 
	jp nz,0afech		;aa25	c2 ec af 	. . . 
	ld a,c			;aa28	79 	y 
	cp 01bh		;aa29	fe 1b 	. . 
	jp z,0afech		;aa2b	ca ec af 	. . . 
	cp 008h		;aa2e	fe 08 	. . 
	jr nz,$+13		;aa30	20 0b 	  . 
	ld a,(0a9c0h)		;aa32	3a c0 a9 	: . . 
	or a			;aa35	b7 	. 
	jr z,$+49		;aa36	28 2f 	( / 
	call 0ad5dh		;aa38	cd 5d ad 	. ] . 
	jr $+44		;aa3b	18 2a 	. * 
	cp 007h		;aa3d	fe 07 	. . 
	jr nz,$+13		;aa3f	20 0b 	  . 
	ld a,(03f0ch)		;aa41	3a 0c 3f 	: . ? 
	or a			;aa44	b7 	. 
	jr z,$+34		;aa45	28 20 	(   
	call 0acafh		;aa47	cd af ac 	. . . 
	jr $+29		;aa4a	18 1b 	. . 
	cp 00ah		;aa4c	fe 0a 	. . 
	jr nz,$+7		;aa4e	20 05 	  . 
	call 0ad97h		;aa50	cd 97 ad 	. . . 
	jr $+20		;aa53	18 12 	. . 
	cp 00dh		;aa55	fe 0d 	. . 
	jr nz,$+7		;aa57	20 05 	  . 
	call 0ad88h		;aa59	cd 88 ad 	. . . 
	jr $+11		;aa5c	18 09 	. . 
	cp 009h		;aa5e	fe 09 	. . 
	jr nz,$+4		;aa60	20 02 	  . 
	ld c,020h		;aa62	0e 20 	.   
	call 0acfch		;aa64	cd fc ac 	. . . 
	call 0aa9ah		;aa67	cd 9a aa 	. . . 
	ret			;aa6a	c9 	. 

	ld a,e			;aa6b	7b 	{ 
	dec a			;aa6c	3d 	= 
	cp 080h		;aa6d	fe 80 	. . 
	jr c,$+4		;aa6f	38 02 	8 . 
	ld a,000h		;aa71	3e 00 	> . 
	ld (0a9c0h),a		;aa73	32 c0 a9 	2 . . 
	ld a,l			;aa76	7d 	} 
	dec a			;aa77	3d 	= 
	cp 018h		;aa78	fe 18 	. . 
	jr c,$+4		;aa7a	38 02 	8 . 
	ld a,000h		;aa7c	3e 00 	> . 
	add a,008h		;aa7e	c6 08 	. . 
	ld (0a9bfh),a		;aa80	32 bf a9 	2 . . 
	call 0aa9ah		;aa83	cd 9a aa 	. . . 
	ret			;aa86	c9 	. 

	ld de,(0a9c0h)		;aa87	ed 5b c0 a9 	. [ . . 
	ld d,000h		;aa8b	16 00 	. . 
	ld a,(0a9bfh)		;aa8d	3a bf a9 	: . . 
	sub 008h		;aa90	d6 08 	. . 
	inc a			;aa92	3c 	< 
	ld l,a			;aa93	6f 	o 
	ld h,d			;aa94	62 	b 
	ret			;aa95	c9 	. 

	nop			;aa96	00 	. 
	nop			;aa97	00 	. 
	nop			;aa98	00 	. 
	nop			;aa99	00 	. 
	ld hl,(0a9bfh)		;aa9a	2a bf a9 	* . . 
	call 0ace8h		;aa9d	cd e8 ac 	. . . 
	ld a,(0a9c0h)		;aaa0	3a c0 a9 	: . . 
	ld l,a			;aaa3	6f 	o 
	ld h,000h		;aaa4	26 00 	& . 
	add hl,hl			;aaa6	29 	) 
	add hl,de			;aaa7	19 	. 
	ld (0a9bdh),hl		;aaa8	22 bd a9 	" . . 
	ld l,000h		;aaab	2e 00 	. . 
	cp 020h		;aaad	fe 20 	.   
	jr c,$+7		;aaaf	38 05 	8 . 
	sub 010h		;aab1	d6 10 	. . 
	inc l			;aab3	2c 	, 
	jr $-7		;aab4	18 f7 	. . 
	ld (0aa96h),a		;aab6	32 96 aa 	2 . . 
	ld a,l			;aab9	7d 	} 
	rlca			;aaba	07 	. 
	rlca			;aabb	07 	. 
	rlca			;aabc	07 	. 
	rlca			;aabd	07 	. 
	ld (0aa99h),a		;aabe	32 99 aa 	2 . . 
	ld a,(0a9bfh)		;aac1	3a bf a9 	: . . 
	ld l,013h		;aac4	2e 13 	. . 
	cp 015h		;aac6	fe 15 	. . 
	jr nc,$+11		;aac8	30 09 	0 . 
	ld l,008h		;aaca	2e 08 	. . 
	cp 013h		;aacc	fe 13 	. . 
	jr c,$+5		;aace	38 03 	8 . 
	ld hl,(0a9c4h)		;aad0	2a c4 a9 	* . . 
	sub l			;aad3	95 	. 
	ld (0aa97h),a		;aad4	32 97 aa 	2 . . 
	ld a,l			;aad7	7d 	} 
	ld (0aa98h),a		;aad8	32 98 aa 	2 . . 
	ld a,(0a9c5h)		;aadb	3a c5 a9 	: . . 
	or a			;aade	b7 	. 
	jr nz,$+17		;aadf	20 0f 	  . 
	ld a,(0a9c4h)		;aae1	3a c4 a9 	: . . 
	cp l			;aae4	bd 	. 
	jr nz,$+11		;aae5	20 09 	  . 
	ld hl,(0aa99h)		;aae7	2a 99 aa 	* . . 
	ld a,(0a9c1h)		;aaea	3a c1 a9 	: . . 
	cp l			;aaed	bd 	. 
	jr z,$+31		;aaee	28 1d 	( . 
	ld a,(0aa99h)		;aaf0	3a 99 aa 	: . . 
	ld (0a9c1h),a		;aaf3	32 c1 a9 	2 . . 
	ld a,(0aa98h)		;aaf6	3a 98 aa 	: . . 
	ld (0a9c4h),a		;aaf9	32 c4 a9 	2 . . 
	ld l,a			;aafc	6f 	o 
	call 0ace8h		;aafd	cd e8 ac 	. . . 
	ld (0a9c2h),de		;ab00	ed 53 c2 a9 	. S . . 
	call 0abbah		;ab04	cd ba ab 	. . . 
	call 0abcdh		;ab07	cd cd ab 	. . . 
	call 0ab59h		;ab0a	cd 59 ab 	. Y . 
	xor a			;ab0d	af 	. 
	ld (0a9c5h),a		;ab0e	32 c5 a9 	2 . . 
	ld a,(0aa97h)		;ab11	3a 97 aa 	: . . 
	call 0a96ah		;ab14	cd 6a a9 	. j . 
	ld a,(0aa96h)		;ab17	3a 96 aa 	: . . 
	call 0a965h		;ab1a	cd 65 a9 	. e . 
	ld a,(0a9bfh)		;ab1d	3a bf a9 	: . . 
	sub 007h		;ab20	d6 07 	. . 
	ld ix,043d8h		;ab22	dd 21 d8 43 	. ! . C 
	call 0ab35h		;ab26	cd 35 ab 	. 5 . 
	ld a,(0a9c0h)		;ab29	3a c0 a9 	: . . 
	inc a			;ab2c	3c 	< 
	ld ix,043e8h		;ab2d	dd 21 e8 43 	. ! . C 
	call 0ab35h		;ab31	cd 35 ab 	. 5 . 
	ret			;ab34	c9 	. 

	ld (ix-004h),030h		;ab35	dd 36 fc 30 	. 6 . 0 
	sub 064h		;ab39	d6 64 	. d 
	jr c,$+7		;ab3b	38 05 	8 . 
	inc (ix-004h)		;ab3d	dd 34 fc 	. 4 . 
	jr $-7		;ab40	18 f7 	. . 
	add a,064h		;ab42	c6 64 	. d 
	ld (ix-002h),030h		;ab44	dd 36 fe 30 	. 6 . 0 
	sub 00ah		;ab48	d6 0a 	. . 
	jr c,$+7		;ab4a	38 05 	8 . 
	inc (ix-002h)		;ab4c	dd 34 fe 	. 4 . 
	jr $-7		;ab4f	18 f7 	. . 
	add a,00ah		;ab51	c6 0a 	. . 
	add a,030h		;ab53	c6 30 	. 0 
	ld (ix+000h),a		;ab55	dd 77 00 	. w . 
	ret			;ab58	c9 	. 

	ld a,(0a9c1h)		;ab59	3a c1 a9 	: . . 
	rrca			;ab5c	0f 	. 
	rrca			;ab5d	0f 	. 
	rrca			;ab5e	0f 	. 
	res 0,a		;ab5f	cb 87 	. . 
	ld e,a			;ab61	5f 	_ 
	ld d,000h		;ab62	16 00 	. . 
	ld hl,0ab82h		;ab64	21 82 ab 	! . . 
	add hl,de			;ab67	19 	. 
	ld a,(0a9c4h)		;ab68	3a c4 a9 	: . . 
	cp 008h		;ab6b	fe 08 	. . 
	jr z,$+6		;ab6d	28 04 	( . 
	ld de,0000eh		;ab6f	11 0e 00 	. . . 
	add hl,de			;ab72	19 	. 
	ld e,(hl)			;ab73	5e 	^ 
	inc hl			;ab74	23 	# 
	ld d,(hl)			;ab75	56 	V 
	ld hl,043c2h		;ab76	21 c2 43 	! . C 
	ld a,(de)			;ab79	1a 	. 
	or a			;ab7a	b7 	. 
	ret z			;ab7b	c8 	. 

	ld (hl),a			;ab7c	77 	w 
	inc de			;ab7d	13 	. 
	inc hl			;ab7e	23 	# 
	inc hl			;ab7f	23 	# 
	jr $-7		;ab80	18 f7 	. . 
	and c			;ab82	a1 	. 
	xor e			;ab83	ab 	. 
	and l			;ab84	a5 	. 
	xor e			;ab85	ab 	. 
	and b			;ab86	a0 	. 
	xor e			;ab87	ab 	. 
	and h			;ab88	a4 	. 
	xor e			;ab89	ab 	. 
	sbc a,a			;ab8a	9f 	. 
	xor e			;ab8b	ab 	. 
	and e			;ab8c	a3 	. 
	xor e			;ab8d	ab 	. 
	sbc a,(hl)			;ab8e	9e 	. 
	xor e			;ab8f	ab 	. 
	xor e			;ab90	ab 	. 
	xor e			;ab91	ab 	. 
	xor a			;ab92	af 	. 
	xor e			;ab93	ab 	. 
	xor d			;ab94	aa 	. 
	xor e			;ab95	ab 	. 
	xor (hl)			;ab96	ae 	. 
	xor e			;ab97	ab 	. 
	xor c			;ab98	a9 	. 
	xor e			;ab99	ab 	. 
	xor l			;ab9a	ad 	. 
	xor e			;ab9b	ab 	. 
	xor b			;ab9c	a8 	. 
	xor e			;ab9d	ab 	. 
	sbc a,d			;ab9e	9a 	. 
	sbc a,d			;ab9f	9a 	. 
	sbc a,d			;aba0	9a 	. 
	or e			;aba1	b3 	. 
	nop			;aba2	00 	. 
	sbc a,d			;aba3	9a 	. 
	sbc a,d			;aba4	9a 	. 
	or d			;aba5	b2 	. 
	or c			;aba6	b1 	. 
	nop			;aba7	00 	. 
	sbc a,d			;aba8	9a 	. 
	sbc a,d			;aba9	9a 	. 
	sbc a,d			;abaa	9a 	. 
	cp h			;abab	bc 	. 
	nop			;abac	00 	. 
	sbc a,d			;abad	9a 	. 
	sbc a,d			;abae	9a 	. 
	cp b			;abaf	b8 	. 
	or h			;abb0	b4 	. 
	nop			;abb1	00 	. 
	ld (04346h),a		;abb2	32 46 43 	2 F C 
	ret			;abb5	c9 	. 

	ld (04372h),a		;abb6	32 72 43 	2 r C 
	ret			;abb9	c9 	. 

	ld hl,0000dh		;abba	21 0d 00 	! . . 
	dec l			;abbd	2d 	- 
	push hl			;abbe	e5 	. 
	call 0acd0h		;abbf	cd d0 ac 	. . . 
	pop hl			;abc2	e1 	. 
	push hl			;abc3	e5 	. 
	call 0a945h		;abc4	cd 45 a9 	. E . 
	pop hl			;abc7	e1 	. 
	ld a,h			;abc8	7c 	| 
	or l			;abc9	b5 	. 
	jr nz,$-13		;abca	20 f1 	  . 
	ret			;abcc	c9 	. 

	ld hl,0000dh		;abcd	21 0d 00 	! . . 
	ld de,0abefh		;abd0	11 ef ab 	. . . 
	call 0a945h		;abd3	cd 45 a9 	. E . 
	ld hl,0000eh		;abd6	21 0e 00 	! . . 
	ld de,0ac2fh		;abd9	11 2f ac 	. / . 
	call 0a945h		;abdc	cd 45 a9 	. E . 
	ld hl,0000fh		;abdf	21 0f 00 	! . . 
	ld de,0ac6fh		;abe2	11 6f ac 	. o . 
	call 0a945h		;abe5	cd 45 a9 	. E . 
	call 0a6feh		;abe8	cd fe a6 	. . . 
	call 0abb2h		;abeb	cd b2 ab 	. . . 
	ret			;abee	c9 	. 

	ld b,e			;abef	43 	C 
	xor e			;abf0	ab 	. 
	ld h,c			;abf1	61 	a 
	xor e			;abf2	ab 	. 
	ld (hl),b			;abf3	70 	p 
	xor e			;abf4	ab 	. 
	jr nz,$-83		;abf5	20 ab 	  . 
	jr nz,$-123		;abf7	20 83 	  . 
	ld b,e			;abf9	43 	C 
	xor e			;abfa	ab 	. 
	ld l,h			;abfb	6c 	l 
	xor e			;abfc	ab 	. 
	ld (hl),d			;abfd	72 	r 
	xor e			;abfe	ab 	. 
	jr nz,$-83		;abff	20 ab 	  . 
	jr nz,$-123		;ac01	20 83 	  . 
	jr nz,$-83		;ac03	20 ab 	  . 
	ld b,h			;ac05	44 	D 
	xor e			;ac06	ab 	. 
	ld l,c			;ac07	69 	i 
	xor e			;ac08	ab 	. 
	ld (hl),e			;ac09	73 	s 
	xor e			;ac0a	ab 	. 
	ld (hl),b			;ac0b	70 	p 
	xor e			;ac0c	ab 	. 
	ld l,h			;ac0d	6c 	l 
	xor e			;ac0e	ab 	. 
	ld h,c			;ac0f	61 	a 
	xor e			;ac10	ab 	. 
	ld a,c			;ac11	79 	y 
	xor e			;ac12	ab 	. 
	jr nz,$-83		;ac13	20 ab 	  . 
	jr nz,$-83		;ac15	20 ab 	  . 
	jr nz,$-123		;ac17	20 83 	  . 
	ld c,b			;ac19	48 	H 
	xor e			;ac1a	ab 	. 
	ld h,l			;ac1b	65 	e 
	xor e			;ac1c	ab 	. 
	ld a,b			;ac1d	78 	x 
	xor e			;ac1e	ab 	. 
	jr nz,$-83		;ac1f	20 ab 	  . 
	jr nz,$-83		;ac21	20 ab 	  . 
	jr nz,$-123		;ac23	20 83 	  . 
	ld b,d			;ac25	42 	B 
	xor e			;ac26	ab 	. 
	ld (hl),d			;ac27	72 	r 
	xor e			;ac28	ab 	. 
	ld h,l			;ac29	65 	e 
	xor e			;ac2a	ab 	. 
	ld h,c			;ac2b	61 	a 
	xor e			;ac2c	ab 	. 
	ld l,e			;ac2d	6b 	k 
	xor e			;ac2e	ab 	. 
	ld c,h			;ac2f	4c 	L 
	xor e			;ac30	ab 	. 
	ld l,a			;ac31	6f 	o 
	xor e			;ac32	ab 	. 
	ld h,e			;ac33	63 	c 
	xor e			;ac34	ab 	. 
	ld l,e			;ac35	6b 	k 
	xor e			;ac36	ab 	. 
	jr nz,$-123		;ac37	20 83 	  . 
	ld d,e			;ac39	53 	S 
	xor e			;ac3a	ab 	. 
	ld h,e			;ac3b	63 	c 
	xor e			;ac3c	ab 	. 
	ld (hl),d			;ac3d	72 	r 
	xor e			;ac3e	ab 	. 
	ld l,(hl)			;ac3f	6e 	n 
	xor e			;ac40	ab 	. 
	jr nz,$-123		;ac41	20 83 	  . 
	ld d,h			;ac43	54 	T 
	xor e			;ac44	ab 	. 
	ld l,a			;ac45	6f 	o 
	xor e			;ac46	ab 	. 
	ld (hl),b			;ac47	70 	p 
	xor e			;ac48	ab 	. 
	jr nz,$-123		;ac49	20 83 	  . 
	ld b,d			;ac4b	42 	B 
	xor e			;ac4c	ab 	. 
	ld l,a			;ac4d	6f 	o 
	xor e			;ac4e	ab 	. 
	ld (hl),h			;ac4f	74 	t 
	xor e			;ac50	ab 	. 
	ld (hl),h			;ac51	74 	t 
	xor e			;ac52	ab 	. 
	ld l,a			;ac53	6f 	o 
	xor e			;ac54	ab 	. 
	ld l,l			;ac55	6d 	m 
	xor e			;ac56	ab 	. 
	jr nz,$-123		;ac57	20 83 	  . 
	ld b,l			;ac59	45 	E 
	xor e			;ac5a	ab 	. 
	ld l,(hl)			;ac5b	6e 	n 
	xor e			;ac5c	ab 	. 
	ld (hl),h			;ac5d	74 	t 
	xor e			;ac5e	ab 	. 
	ld (hl),d			;ac5f	72 	r 
	xor e			;ac60	ab 	. 
	ld a,c			;ac61	79 	y 
	xor e			;ac62	ab 	. 
	jr nz,$-123		;ac63	20 83 	  . 
	jr nz,$-83		;ac65	20 ab 	  . 
	jr nz,$-83		;ac67	20 ab 	  . 
	jr nz,$-83		;ac69	20 ab 	  . 
	jr nz,$-83		;ac6b	20 ab 	  . 
	jr nz,$-83		;ac6d	20 ab 	  . 
	sbc a,h			;ac6f	9c 	. 
	add a,d			;ac70	82 	. 
	sbc a,d			;ac71	9a 	. 
	add a,d			;ac72	82 	. 
	sbc a,d			;ac73	9a 	. 
	add a,d			;ac74	82 	. 
	sbc a,d			;ac75	9a 	. 
	add a,d			;ac76	82 	. 
	sbc a,d			;ac77	9a 	. 
	add a,d			;ac78	82 	. 
	sub l			;ac79	95 	. 
	add a,d			;ac7a	82 	. 
	ld d,d			;ac7b	52 	R 
	add a,e			;ac7c	83 	. 
	ld l,a			;ac7d	6f 	o 
	add a,e			;ac7e	83 	. 
	ld (hl),a			;ac7f	77 	w 
	add a,e			;ac80	83 	. 
	ld a,(07883h)		;ac81	3a 83 78 	: . x 
	add a,e			;ac84	83 	. 
	ld a,b			;ac85	78 	x 
	add a,e			;ac86	83 	. 
	ld a,b			;ac87	78 	x 
	add a,e			;ac88	83 	. 
	jr nz,$-123		;ac89	20 83 	  . 
	ld b,e			;ac8b	43 	C 
	add a,e			;ac8c	83 	. 
	ld l,a			;ac8d	6f 	o 
	add a,e			;ac8e	83 	. 
	ld l,h			;ac8f	6c 	l 
	add a,e			;ac90	83 	. 
	ld a,(07883h)		;ac91	3a 83 78 	: . x 
	add a,e			;ac94	83 	. 
	ld a,b			;ac95	78 	x 
	add a,e			;ac96	83 	. 
	ld a,b			;ac97	78 	x 
	add a,e			;ac98	83 	. 
	jr nz,$-123		;ac99	20 83 	  . 
	jr nz,$-123		;ac9b	20 83 	  . 
	jr nz,$-123		;ac9d	20 83 	  . 
	jr nz,$-123		;ac9f	20 83 	  . 
	jr nz,$-123		;aca1	20 83 	  . 
	jr nz,$-123		;aca3	20 83 	  . 
	jr nz,$-123		;aca5	20 83 	  . 
	jr nz,$-123		;aca7	20 83 	  . 
	jr nz,$-123		;aca9	20 83 	  . 
	jr nz,$-123		;acab	20 83 	  . 
	jr nz,$-123		;acad	20 83 	  . 
	di			;acaf	f3 	. 
	ld a,(00037h)		;acb0	3a 37 00 	: 7 . 
	res 2,a		;acb3	cb 97 	. . 
	ld (00037h),a		;acb5	32 37 00 	2 7 . 
	out (090h),a		;acb8	d3 90 	. . 
	ei			;acba	fb 	. 
	ld hl,02000h		;acbb	21 00 20 	! .   
	dec hl			;acbe	2b 	+ 
	ld a,h			;acbf	7c 	| 
	or l			;acc0	b5 	. 
	jr nz,$-3		;acc1	20 fb 	  . 
	di			;acc3	f3 	. 
	ld a,(00037h)		;acc4	3a 37 00 	: 7 . 
	set 2,a		;acc7	cb d7 	. . 
	ld (00037h),a		;acc9	32 37 00 	2 7 . 
	out (090h),a		;accc	d3 90 	. . 
	ei			;acce	fb 	. 
	ret			;accf	c9 	. 

	call 0acf8h		;acd0	cd f8 ac 	. . . 
	ld a,(0a9c1h)		;acd3	3a c1 a9 	: . . 
	ld e,a			;acd6	5f 	_ 
	ld d,000h		;acd7	16 00 	. . 
	add hl,de			;acd9	19 	. 
	add hl,de			;acda	19 	. 
	ld de,(0a9c2h)		;acdb	ed 5b c2 a9 	. [ . . 
	add hl,de			;acdf	19 	. 
	set 7,h		;ace0	cb fc 	. . 
	set 6,h		;ace2	cb f4 	. . 
	set 5,h		;ace4	cb ec 	. . 
	ex de,hl			;ace6	eb 	. 
	ret			;ace7	c9 	. 

;; ace8 POI-13
;; call, acf8 = POI-14
	call 0acf8h		;ace8	cd f8 ac 	. . . 
;; de:= (a9bb)
	ld de,(0a9bbh)		;aceb	ed 5b bb a9 	. [ . . 
;; hl += de	
	add hl,de			;acef	19 	. 
;; set bits 7,6,5 in h	
	set 7,h		;acf0	cb fc 	. . 
	set 6,h		;acf2	cb f4 	. . 
	set 5,h		;acf4	cb ec 	. . 
;; exchange dl with hl	
	ex de,hl			;acf6	eb 	. 
	ret			;acf7	c9 	. 

;; acf8 POI-14
;; moves l to h and sets l to 0
;; like shift to right by 8
;; h:=l
	ld h,l			;acf8	65 	e 
	;; l:=0
	ld l,000h		;acf9	2e 00 	. . 
	ret			;acfb	c9 	. 

	ld a,(0a9c6h)		;acfc	3a c6 a9 	: . . 
	ld b,a			;acff	47 	G 
	push bc			;ad00	c5 	. 
	call 0a95eh		;ad01	cd 5e a9 	. ^ . 
	pop bc			;ad04	c1 	. 
	ld hl,(0a9bdh)		;ad05	2a bd a9 	* . . 
	ld (hl),c			;ad08	71 	q 
	inc l			;ad09	2c 	, 
	ld a,(0a9c6h)		;ad0a	3a c6 a9 	: . . 
	ld (hl),b			;ad0d	70 	p 
	call 0ad70h		;ad0e	cd 70 ad 	. p . 
	ret nz			;ad11	c0 	. 

	call 0ad88h		;ad12	cd 88 ad 	. . . 
	call 0ad97h		;ad15	cd 97 ad 	. . . 
	ret			;ad18	c9 	. 

	ld a,(0a9bfh)		;ad19	3a bf a9 	: . . 
	cp 008h		;ad1c	fe 08 	. . 
	ret z			;ad1e	c8 	. 

	dec a			;ad1f	3d 	= 
	ld (0a9bfh),a		;ad20	32 bf a9 	2 . . 
	ld hl,(0a9bdh)		;ad23	2a bd a9 	* . . 
	ld de,0ff00h		;ad26	11 00 ff 	. . . 
	add hl,de			;ad29	19 	. 
	set 7,h		;ad2a	cb fc 	. . 
	set 6,h		;ad2c	cb f4 	. . 
	set 5,h		;ad2e	cb ec 	. . 
	ld (0a9bdh),hl		;ad30	22 bd a9 	" . . 
	or 0ffh		;ad33	f6 ff 	. . 
	ret			;ad35	c9 	. 

	call 0ad19h		;ad36	cd 19 ad 	. . . 
	ret nz			;ad39	c0 	. 

	call 0ad23h		;ad3a	cd 23 ad 	. # . 
	ld hl,(0a9bbh)		;ad3d	2a bb a9 	* . . 
	add hl,de			;ad40	19 	. 
	set 7,h		;ad41	cb fc 	. . 
	set 6,h		;ad43	cb f4 	. . 
	set 5,h		;ad45	cb ec 	. . 
	ld (0a9bbh),hl		;ad47	22 bb a9 	" . . 
	call 0ae9ah		;ad4a	cd 9a ae 	. . . 
	ld a,001h		;ad4d	3e 01 	> . 
	ld (0a9c5h),a		;ad4f	32 c5 a9 	2 . . 
	ret			;ad52	c9 	. 

	ld a,(0a9bfh)		;ad53	3a bf a9 	: . . 
	cp 01fh		;ad56	fe 1f 	. . 
	ret z			;ad58	c8 	. 

	call 0ad97h		;ad59	cd 97 ad 	. . . 
	ret			;ad5c	c9 	. 

	ld hl,(0a9bdh)		;ad5d	2a bd a9 	* . . 
	ld a,(0a9c0h)		;ad60	3a c0 a9 	: . . 
	scf			;ad63	37 	7 
	sbc a,000h		;ad64	de 00 	. . 
	ret c			;ad66	d8 	. 

	ld (0a9c0h),a		;ad67	32 c0 a9 	2 . . 
	dec l			;ad6a	2d 	- 
	dec l			;ad6b	2d 	- 
	ld (0a9bdh),hl		;ad6c	22 bd a9 	" . . 
	ret			;ad6f	c9 	. 

	ld a,(0a9c0h)		;ad70	3a c0 a9 	: . . 
	inc a			;ad73	3c 	< 
	cp 080h		;ad74	fe 80 	. . 
	jr nc,$+16		;ad76	30 0e 	0 . 
	ld (0a9c0h),a		;ad78	32 c0 a9 	2 . . 
	ld hl,(0a9bdh)		;ad7b	2a bd a9 	* . . 
	inc l			;ad7e	2c 	, 
	inc l			;ad7f	2c 	, 
	ld (0a9bdh),hl		;ad80	22 bd a9 	" . . 
	or 0ffh		;ad83	f6 ff 	. . 
	ret			;ad85	c9 	. 

	xor a			;ad86	af 	. 
	ret			;ad87	c9 	. 

	xor a			;ad88	af 	. 
	ld (0a9c0h),a		;ad89	32 c0 a9 	2 . . 
	ld hl,(0a9bdh)		;ad8c	2a bd a9 	* . . 
	ld a,l			;ad8f	7d 	} 
	and 000h		;ad90	e6 00 	. . 
	ld l,a			;ad92	6f 	o 
	ld (0a9bdh),hl		;ad93	22 bd a9 	" . . 
	ret			;ad96	c9 	. 

	ld hl,(0a9bdh)		;ad97	2a bd a9 	* . . 
	ld de,00100h		;ad9a	11 00 01 	. . . 
	add hl,de			;ad9d	19 	. 
	set 7,h		;ad9e	cb fc 	. . 
	set 6,h		;ada0	cb f4 	. . 
	set 5,h		;ada2	cb ec 	. . 
	ld (0a9bdh),hl		;ada4	22 bd a9 	" . . 
	ld a,(0a9bfh)		;ada7	3a bf a9 	: . . 
	inc a			;adaa	3c 	< 
	cp 020h		;adab	fe 20 	.   
	jr nz,$+36		;adad	20 22 	  " 
	ld hl,(0a9bbh)		;adaf	2a bb a9 	* . . 
	ld (hl),020h		;adb2	36 20 	6   
	inc l			;adb4	2c 	, 
	ld (hl),083h		;adb5	36 83 	6 . 
	ld e,l			;adb7	5d 	] 
	ld d,h			;adb8	54 	T 
	inc e			;adb9	1c 	. 
	dec l			;adba	2d 	- 
	ld bc,000feh		;adbb	01 fe 00 	. . . 
	ldir		;adbe	ed b0 	. . 
	ld a,001h		;adc0	3e 01 	> . 
	ld (0a9c5h),a		;adc2	32 c5 a9 	2 . . 
	ex de,hl			;adc5	eb 	. 
	set 7,h		;adc6	cb fc 	. . 
	set 6,h		;adc8	cb f4 	. . 
	set 5,h		;adca	cb ec 	. . 
	ld (0a9bbh),hl		;adcc	22 bb a9 	" . . 
	ld a,01fh		;adcf	3e 1f 	> . 
	ld (0a9bfh),a		;add1	32 bf a9 	2 . . 
	xor a			;add4	af 	. 
	ret			;add5	c9 	. 

	ld a,008h		;add6	3e 08 	> . 
	ld (0a9bfh),a		;add8	32 bf a9 	2 . . 
	ld (0a9c4h),a		;addb	32 c4 a9 	2 . . 
	ld l,a			;adde	6f 	o 
	call 0ace8h		;addf	cd e8 ac 	. . . 
	ld (0a9bdh),de		;ade2	ed 53 bd a9 	. S . . 
	ld (0a9c2h),de		;ade6	ed 53 c2 a9 	. S . . 
	xor a			;adea	af 	. 
	ld (0a9c0h),a		;adeb	32 c0 a9 	2 . . 
	ld (0a9c1h),a		;adee	32 c1 a9 	2 . . 
	ld a,001h		;adf1	3e 01 	> . 
	ld (0a9c5h),a		;adf3	32 c5 a9 	2 . . 
	ret			;adf6	c9 	. 

;; POI-12 adf7h	
;; loads 0x20 (SPACE) and then 0x83 (ASCII Normal attribute) to (h1)
;; this looks like a "clear screen" routine
;; 
	ld hl,(0a9bdh)		;adf7	2a bd a9 	* . . 
	  ld de,(0a9bbh)		;adfa	ed 5b bb a9 	. [ . . 
	  ld (hl),020h		;adfe	36 20 	6   
	  inc l			;ae00	2c 	, 
	  ld (hl),083h		;ae01	36 83 	6 . 
	  inc hl			;ae03	23 	# 
	  set 7,h		;ae04	cb fc 	. . 
	  set 6,h		;ae06	cb f4 	. . 
	  set 5,h		;ae08	cb ec 	. . 
	  ld a,l			;ae0a	7d 	} 
	  cp e			;ae0b	bb 	. 
	  jr nz,$-14		;ae0c	20 f0 	  . 
	 ld a,h			;ae0e	7c 	| 
	 cp d			;ae0f	ba 	. 
	 jr nz,$-18		;ae10	20 ec 	  . 
	ld a,001h		;ae12	3e 01 	> . 
	ld (0a9c5h),a		;ae14	32 c5 a9 	2 . . 
	ret			;ae17	c9 	. 

;; lines below looks like character key checks for 0x13, 0x15
;; and many more; part of key input handling???
;;
;; until ret, it looks like <CR) = 0x13 handling
;;
;; a:=(a9c4)
	ld a,(0a9c4h)		;ae18	3a c4 a9 	: . .
;; a==13 ?
	cp 013h		;ae1b	fe 13 	. . 
;; return if not equal	
	ret z			;ae1d	c8 	. 
;; a:=13
	ld a,013h		;ae1e	3e 13 	> . 
;; (a9c4):=a	
	ld (0a9c4h),a		;ae20	32 c4 a9 	2 . . 
;; a:=15	
	ld a,015h		;ae23	3e 15 	> . 
;; (a9bf):=a	
	ld (0a9bfh),a		;ae25	32 bf a9 	2 . . 
;; l:=a	
	ld l,a			;ae28	6f 	o 
;; call ace8 = POI-13	
	call 0ace8h		;ae29	cd e8 ac 	. . . 
;; (a9bd):=de	
	ld (0a9bdh),de		;ae2c	ed 53 bd a9 	. S . .
	
	xor a			;ae30	af 	. 
;; a9c0:=a	
	ld (0a9c0h),a		;ae31	32 c0 a9 	2 . . 
;; a9c1:=a
	ld (0a9c1h),a		;ae34	32 c1 a9 	2 . . 
;; a++	
	inc a			;ae37	3c 	< 
;; (a9c5):=a	
	ld (0a9c5h),a		;ae38	32 c5 a9 	2 . . 
	ret			;ae3b	c9 	. 

;; 0x08 = Backspace handling (?)	
	ld a,(0a9c4h)		;ae3c	3a c4 a9 	: . . 
	cp 008h		;ae3f	fe 08 	. . 
	ret z			;ae41	c8 	. 

	ld a,008h		;ae42	3e 08 	> . 
	ld (0a9c4h),a		;ae44	32 c4 a9 	2 . . 
	ld (0a9bfh),a		;ae47	32 bf a9 	2 . . 
	ld l,a			;ae4a	6f 	o 
	call 0ace8h		;ae4b	cd e8 ac 	. . . 
	ld (0a9bdh),de		;ae4e	ed 53 bd a9 	. S . . 
	xor a			;ae52	af 	. 
	ld (0a9c0h),a		;ae53	32 c0 a9 	2 . . 
	ld (0a9c1h),a		;ae56	32 c1 a9 	2 . . 
	inc a			;ae59	3c 	< 
	ld (0a9c5h),a		;ae5a	32 c5 a9 	2 . . 
	ret			;ae5d	c9 	. 

;; '0' handling 0x30	
	cp 000h		;ae5e	fe 00 	. . 
	jr z,$+6		;ae60	28 04 	( . 
	cp 030h		;ae62	fe 30 	. 0 
	jr nz,$+26		;ae64	20 18 	  . 
	ld hl,(0a9bdh)		;ae66	2a bd a9 	* . . 
	ld de,(0a9bdh)		;ae69	ed 5b bd a9 	. [ . . 
	ld bc,00100h		;ae6d	01 00 01 	. . . 
	add hl,bc			;ae70	09 	. 
	ld l,000h		;ae71	2e 00 	. . 
	set 7,h		;ae73	cb fc 	. . 
	set 6,h		;ae75	cb f4 	. . 
	set 5,h		;ae77	cb ec 	. . 
	ex de,hl			;ae79	eb 	. 
	call 0adfeh		;ae7a	cd fe ad 	. . . 
	ret			;ae7d	c9 	. 

;; '1' handling
	cp 031h		;ae7e	fe 31 	. 1 
	jr nz,$+23		;ae80	20 15 	  . 
	ld hl,(0a9bdh)		;ae82	2a bd a9 	* . . 
	inc hl			;ae85	23 	# 
	inc hl			;ae86	23 	# 
	set 7,h		;ae87	cb fc 	. . 
	set 6,h		;ae89	cb f4 	. . 
	set 5,h		;ae8b	cb ec 	. . 
	ex de,hl			;ae8d	eb 	. 
	ld hl,(0a9bdh)		;ae8e	2a bd a9 	* . . 
	ld l,000h		;ae91	2e 00 	. . 
	call 0adfeh		;ae93	cd fe ad 	. . . 
	ret			;ae96	c9 	. 

;; '2' handling	
	cp 032h		;ae97	fe 32 	. 2 
	ret nz			;ae99	c0 	. 

	ld hl,(0a9bdh)		;ae9a	2a bd a9 	* . . 
	ld de,(0a9bdh)		;ae9d	ed 5b bd a9 	. [ . . 
	ld bc,00100h		;aea1	01 00 01 	. . . 
	add hl,bc			;aea4	09 	. 
	ld l,000h		;aea5	2e 00 	. . 
	set 7,h		;aea7	cb fc 	. . 
	set 6,h		;aea9	cb f4 	. . 
	set 5,h		;aeab	cb ec 	. . 
	ex de,hl			;aead	eb 	. 
	ld l,000h		;aeae	2e 00 	. . 
	call 0adfeh		;aeb0	cd fe ad 	. . . 
	ret			;aeb3	c9 	. 

;; again, '0' handling???	
	cp 000h		;aeb4	fe 00 	. . 
	jr z,$+6		;aeb6	28 04 	( . 
	cp 030h		;aeb8	fe 30 	. 0 
	jr nz,$+6		;aeba	20 04 	  . 
	call 0adf7h		;aebc	cd f7 ad 	. . . 
	ret			;aebf	c9 	. 

;; again, '1' handling???	
	cp 031h		;aec0	fe 31 	. 1 
	jr nz,$+21		;aec2	20 13 	  . 
	ld hl,(0a9bdh)		;aec4	2a bd a9 	* . . 
	inc hl			;aec7	23 	# 
	inc hl			;aec8	23 	# 
	set 7,h		;aec9	cb fc 	. . 
	set 6,h		;aecb	cb f4 	. . 
	set 5,h		;aecd	cb ec 	. . 
	ex de,hl			;aecf	eb 	. 
	ld hl,(0a9bbh)		;aed0	2a bb a9 	* . . 
	call 0adfeh		;aed3	cd fe ad 	. . . 
	ret			;aed6	c9 	. 

;; again, '2' handling???	
	cp 032h		;aed7	fe 32 	. 2 
	ret nz			;aed9	c0 	. 

	ld hl,(0a9bdh)		;aeda	2a bd a9 	* . . 
	ld de,(0a9bdh)		;aedd	ed 5b bd a9 	. [ . . 
	call 0adfeh		;aee1	cd fe ad 	. . . 
	ret			;aee4	c9 	. 

	ld hl,0dc00h		;aee5	21 00 dc 	! . . 
	ld (0de02h),hl		;aee8	22 02 de 	" . . 
	ld (0de00h),hl		;aeeb	22 00 de 	" . . 
	xor a			;aeee	af 	. 
	ld (0de06h),a		;aeef	32 06 de 	2 . . 
	ld (0de07h),a		;aef2	32 07 de 	2 . . 
	ld l,a			;aef5	6f 	o 
	ld h,a			;aef6	67 	g 
	ld (0de04h),hl		;aef7	22 04 de 	" . . 
	ret			;aefa	c9 	. 

	ld a,001h		;aefb	3e 01 	> . 
	ld (0de07h),a		;aefd	32 07 de 	2 . . 
	ld a,(0de06h)		;af00	3a 06 de 	: . . 
	or a			;af03	b7 	. 
	jr z,$+19		;af04	28 11 	( . 
	xor a			;af06	af 	. 
	ld (0de07h),a		;af07	32 07 de 	2 . . 
	push bc			;af0a	c5 	. 
	ld b,020h		;af0b	06 20 	.   
	djnz $+0		;af0d	10 fe 	. . 
	pop bc			;af0f	c1 	. 
	ld a,001h		;af10	3e 01 	> . 
	ld (0de07h),a		;af12	32 07 de 	2 . . 
	jr $-21		;af15	18 e9 	. . 
	ld de,(0de04h)		;af17	ed 5b 04 de 	. [ . . 
	ld hl,00100h		;af1b	21 00 01 	! . . 
	or a			;af1e	b7 	. 
	sbc hl,de		;af1f	ed 52 	. R 
	jr z,$+37		;af21	28 23 	( # 
	inc de			;af23	13 	. 
	ld (0de04h),de		;af24	ed 53 04 de 	. S . . 
	ex de,hl			;af28	eb 	. 
	ld hl,(0de00h)		;af29	2a 00 de 	* . . 
	ld (hl),c			;af2c	71 	q 
	inc l			;af2d	2c 	, 
	ld (hl),b			;af2e	70 	p 
	inc hl			;af2f	23 	# 
	set 2,h		;af30	cb d4 	. . 
	res 1,h		;af32	cb 8c 	. . 
	ld (0de00h),hl		;af34	22 00 de 	" . . 
	xor a			;af37	af 	. 
	ld (0de07h),a		;af38	32 07 de 	2 . . 
	ld a,d			;af3b	7a 	z 
	or a			;af3c	b7 	. 
	ret nz			;af3d	c0 	. 

	ld a,e			;af3e	7b 	{ 
	cp 020h		;af3f	fe 20 	.   
	jr c,$+5		;af41	38 03 	8 . 
	or 0ffh		;af43	f6 ff 	. . 
	ret			;af45	c9 	. 

	xor a			;af46	af 	. 
	ld (0de07h),a		;af47	32 07 de 	2 . . 
	ret			;af4a	c9 	. 

	ld a,001h		;af4b	3e 01 	> . 
	ld (0de07h),a		;af4d	32 07 de 	2 . . 
	ld a,(0de06h)		;af50	3a 06 de 	: . . 
	or a			;af53	b7 	. 
	jr z,$+19		;af54	28 11 	( . 
	xor a			;af56	af 	. 
	ld (0de07h),a		;af57	32 07 de 	2 . . 
	push bc			;af5a	c5 	. 
	ld b,020h		;af5b	06 20 	.   
	djnz $+0		;af5d	10 fe 	. . 
	pop bc			;af5f	c1 	. 
	ld a,001h		;af60	3e 01 	> . 
	ld (0de07h),a		;af62	32 07 de 	2 . . 
	jr $-21		;af65	18 e9 	. . 
	ld hl,(0de04h)		;af67	2a 04 de 	* . . 
	xor a			;af6a	af 	. 
	ld (0de07h),a		;af6b	32 07 de 	2 . . 
	ld a,h			;af6e	7c 	| 
	or l			;af6f	b5 	. 
	ret			;af70	c9 	. 

	ld a,001h		;af71	3e 01 	> . 
	ld (0de06h),a		;af73	32 06 de 	2 . . 
	ld a,(0de07h)		;af76	3a 07 de 	: . . 
	or a			;af79	b7 	. 
	jr nz,$-4		;af7a	20 fa 	  . 
	ld hl,(0de04h)		;af7c	2a 04 de 	* . . 
	ld a,h			;af7f	7c 	| 
	or l			;af80	b5 	. 
	jr z,$+22		;af81	28 14 	( . 
	dec hl			;af83	2b 	+ 
	ld (0de04h),hl		;af84	22 04 de 	" . . 
	ld hl,(0de02h)		;af87	2a 02 de 	* . . 
	ld c,(hl)			;af8a	4e 	N 
	inc l			;af8b	2c 	, 
	ld b,(hl)			;af8c	46 	F 
	inc hl			;af8d	23 	# 
	set 2,h		;af8e	cb d4 	. . 
	res 1,h		;af90	cb 8c 	. . 
	ld (0de02h),hl		;af92	22 02 de 	" . . 
	or 0ffh		;af95	f6 ff 	. . 
	ld a,000h		;af97	3e 00 	> . 
	ld (0de06h),a		;af99	32 06 de 	2 . . 
	ret			;af9c	c9 	. 

	nop			;af9d	00 	. 
	nop			;af9e	00 	. 
	rst 38h			;af9f	ff 	. 
	xor a			;afa0	af 	. 
	nop			;afa1	00 	. 
	nop			;afa2	00 	. 
	nop			;afa3	00 	. 
	nop			;afa4	00 	. 
	nop			;afa5	00 	. 
	nop			;afa6	00 	. 
	nop			;afa7	00 	. 
	nop			;afa8	00 	. 
	nop			;afa9	00 	. 
	nop			;afaa	00 	. 
	nop			;afab	00 	. 
	nop			;afac	00 	. 
	nop			;afad	00 	. 
	nop			;afae	00 	. 
	nop			;afaf	00 	. 
	nop			;afb0	00 	. 
	nop			;afb1	00 	. 
	nop			;afb2	00 	. 
	nop			;afb3	00 	. 
	nop			;afb4	00 	. 
	nop			;afb5	00 	. 
	nop			;afb6	00 	. 
	nop			;afb7	00 	. 
	nop			;afb8	00 	. 
	nop			;afb9	00 	. 
	nop			;afba	00 	. 
	nop			;afbb	00 	. 
	nop			;afbc	00 	. 
	nop			;afbd	00 	. 
	nop			;afbe	00 	. 
	nop			;afbf	00 	. 
	nop			;afc0	00 	. 
	nop			;afc1	00 	. 
	nop			;afc2	00 	. 
	nop			;afc3	00 	. 
	nop			;afc4	00 	. 
	nop			;afc5	00 	. 
	nop			;afc6	00 	. 
	nop			;afc7	00 	. 
	nop			;afc8	00 	. 
	nop			;afc9	00 	. 
	nop			;afca	00 	. 
	nop			;afcb	00 	. 
	nop			;afcc	00 	. 
	nop			;afcd	00 	. 
	nop			;afce	00 	. 
	nop			;afcf	00 	. 
	nop			;afd0	00 	. 
	nop			;afd1	00 	. 
	nop			;afd2	00 	. 
	nop			;afd3	00 	. 
	nop			;afd4	00 	. 
	nop			;afd5	00 	. 
	nop			;afd6	00 	. 
	nop			;afd7	00 	. 
	nop			;afd8	00 	. 
	nop			;afd9	00 	. 
	nop			;afda	00 	. 
	nop			;afdb	00 	. 
	nop			;afdc	00 	. 
	nop			;afdd	00 	. 
	nop			;afde	00 	. 
	nop			;afdf	00 	. 
	nop			;afe0	00 	. 
	nop			;afe1	00 	. 
	nop			;afe2	00 	. 
	nop			;afe3	00 	. 
	nop			;afe4	00 	. 
	nop			;afe5	00 	. 
	nop			;afe6	00 	. 
	add a,e			;afe7	83 	. 
	add a,e			;afe8	83 	. 
	ld bc,06401h		;afe9	01 01 64 	. . d 
	ld a,c			;afec	79 	y 
	cp 01bh		;afed	fe 1b 	. . 
	jp z,0b07dh		;afef	ca 7d b0 	. } . 
	ld a,(0af9dh)		;aff2	3a 9d af 	: . . 
	or a			;aff5	b7 	. 
	ret z			;aff6	c8 	. 

	inc a			;aff7	3c 	< 
	ld (0af9dh),a		;aff8	32 9d af 	2 . . 
	ld hl,(0af9fh)		;affb	2a 9f af 	* . . 
	jp (hl)			;affe	e9 	. 
	ld a,(0afebh)		;afff	3a eb af 	: . .
;; 'd' char	
	cp 064h		;b002	fe 64 	. d 
	jp nz,0b260h		;b004	c2 60 b2 	. ` . 
	ld a,c			;b007	79 	y 
;; [ char	
	cp 05bh		;b008	fe 5b 	. [ 
	jp z,0b0aeh		;b00a	ca ae b0 	. . . 
	ld a,(0af9eh)		;b00d	3a 9e af 	: . . 
	or a			;b010	b7 	. 
	jr nz,$+39		;b011	20 25 	  % 
	push bc			;b013	c5 	. 
	call 0b08dh		;b014	cd 8d b0 	. . . 
	pop bc			;b017	c1 	. 
	ld a,c			;b018	79 	y 
;; '7'	
	cp 037h		;b019	fe 37 	. 7 
	jp z,0b139h		;b01b	ca 39 b1 	. 9 . 
;; '8'	
	cp 038h		;b01e	fe 38 	. 8 
	jp z,0b15bh		;b020	ca 5b b1 	. [ . 
;; 'D'	
	cp 044h		;b023	fe 44 	. D 
	jp z,0b259h		;b025	ca 59 b2 	. Y . 
;; 'E'	
	cp 045h		;b028	fe 45 	. E 
	jp z,0b256h		;b02a	ca 56 b2 	. V . 
;; 'M'	
	cp 04dh		;b02d	fe 4d 	. M 
	jp z,0b229h		;b02f	ca 29 b2 	. ) .
;; 'c'	
	cp 063h		;b032	fe 63 	. c 
	jp z,0b14bh		;b034	ca 4b b1 	. K . 
	ret			;b037	c9 	. 

	ld a,c			;b038	79 	y 
;; ETX	
	cp 03bh		;b039	fe 3b 	. ; 
	jp z,0b0d5h		;b03b	ca d5 b0 	. . .
;; '0'	
	cp 030h		;b03e	fe 30 	. 0 
	jr c,$+7		;b040	38 05 	8 . 
;; :	
	cp 03ah		;b042	fe 3a 	. : 
	jp c,0b0e7h		;b044	da e7 b0 	. . . 
;; H	
	cp 048h		;b047	fe 48 	. H 
	jp z,0b10eh		;b049	ca 0e b1 	. . . 
;; f	
	cp 066h		;b04c	fe 66 	. f 
	jp z,0b10eh		;b04e	ca 0e b1 	. . . 
;; ACK	
	cp 06dh		;b051	fe 6d 	. m 
	jp z,0b172h		;b053	ca 72 b1 	. r . 
;; EOT	
	cp 04bh		;b056	fe 4b 	. K 
	jp z,0b1ceh		;b058	ca ce b1 	. . . 
;; J	
	cp 04ah		;b05b	fe 4a 	. J 
	jp z,0b1c1h		;b05d	ca c1 b1 	. . . 
;; A	
	cp 041h		;b060	fe 41 	. A 
	jp z,0b1dbh		;b062	ca db b1 	. . . 
	cp 042h		;b065	fe 42 	. B 
	jp z,0b205h		;b067	ca 05 b2 	. . . 
	cp 043h		;b06a	fe 43 	. C 
	jp z,0b211h		;b06c	ca 11 b2 	. . . 
	cp 044h		;b06f	fe 44 	. D 
	jp z,0b21dh		;b071	ca 1d b2 	. . . 
;; z	
	cp 07ah		;b074	fe 7a 	. z 
	jp z,0b230h		;b076	ca 30 b2 	. 0 . 
	call 0b08dh		;b079	cd 8d b0 	. . . 
	ret			;b07c	c9 	. 

	ld a,001h		;b07d	3e 01 	> . 
	ld (0af9dh),a		;b07f	32 9d af 	2 . . 
	ld hl,0afffh		;b082	21 ff af 	! . . 
	ld (0af9fh),hl		;b085	22 9f af 	" . . 
	xor a			;b088	af 	. 
	ld (0af9eh),a		;b089	32 9e af 	2 . . 
	ret			;b08c	c9 	. 

	xor a			;b08d	af 	. 
	ld (0af9dh),a		;b08e	32 9d af 	2 . . 
	ld (0af9eh),a		;b091	32 9e af 	2 . . 
	ret			;b094	c9 	. 

	ld de,00000h		;b095	11 00 00 	. . . 
	ld b,000h		;b098	06 00 	. . 
	ld a,(hl)			;b09a	7e 	~ 
	or a			;b09b	b7 	. 
	ret z			;b09c	c8 	. 

	sub 030h		;b09d	d6 30 	. 0 
	ld c,a			;b09f	4f 	O 
	push hl			;b0a0	e5 	. 
	ex de,hl			;b0a1	eb 	. 
	add hl,hl			;b0a2	29 	) 
	push hl			;b0a3	e5 	. 
	add hl,hl			;b0a4	29 	) 
	add hl,hl			;b0a5	29 	) 
	pop de			;b0a6	d1 	. 
	add hl,de			;b0a7	19 	. 
	add hl,bc			;b0a8	09 	. 
	ex de,hl			;b0a9	eb 	. 
	pop hl			;b0aa	e1 	. 
	inc hl			;b0ab	23 	# 
	jr $-18		;b0ac	18 ec 	. . 
	ld a,(0af9dh)		;b0ae	3a 9d af 	: . . 
	cp 002h		;b0b1	fe 02 	. . 
	jr nz,$-38		;b0b3	20 d8 	  . 
	ld a,001h		;b0b5	3e 01 	> . 
	ld (0af9eh),a		;b0b7	32 9e af 	2 . . 
	ld hl,0afa7h		;b0ba	21 a7 af 	! . . 
	ld (0afa1h),hl		;b0bd	22 a1 af 	" . . 
	ld (0afa3h),hl		;b0c0	22 a3 af 	" . . 
	push hl			;b0c3	e5 	. 
	pop de			;b0c4	d1 	. 
	ld (hl),000h		;b0c5	36 00 	6 . 
	inc de			;b0c7	13 	. 
	ld bc,0003fh		;b0c8	01 3f 00 	. ? . 
	ldir		;b0cb	ed b0 	. . 
	xor a			;b0cd	af 	. 
	ld (0afa5h),a		;b0ce	32 a5 af 	2 . . 
	ld (0afa6h),a		;b0d1	32 a6 af 	2 . . 
	ret			;b0d4	c9 	. 

	ld hl,(0afa3h)		;b0d5	2a a3 af 	* . . 
	ld de,00008h		;b0d8	11 08 00 	. . . 
	add hl,de			;b0db	19 	. 
	ld (0afa1h),hl		;b0dc	22 a1 af 	" . . 
	ld (0afa3h),hl		;b0df	22 a3 af 	" . . 
	xor a			;b0e2	af 	. 
	ld (0afa5h),a		;b0e3	32 a5 af 	2 . . 
	ret			;b0e6	c9 	. 

	ld a,(0afa5h)		;b0e7	3a a5 af 	: . . 
	or a			;b0ea	b7 	. 
	jr nz,$+14		;b0eb	20 0c 	  . 
	ld a,(0afa6h)		;b0ed	3a a6 af 	: . . 
	inc a			;b0f0	3c 	< 
	cp 009h		;b0f1	fe 09 	. . 
	jp nc,0b08dh		;b0f3	d2 8d b0 	. . . 
	ld (0afa6h),a		;b0f6	32 a6 af 	2 . . 
	ld a,(0afa5h)		;b0f9	3a a5 af 	: . . 
	inc a			;b0fc	3c 	< 
	cp 008h		;b0fd	fe 08 	. . 
	jp nc,0b08dh		;b0ff	d2 8d b0 	. . . 
	ld (0afa5h),a		;b102	32 a5 af 	2 . . 
	ld hl,(0afa1h)		;b105	2a a1 af 	* . . 
	ld (hl),c			;b108	71 	q 
	inc hl			;b109	23 	# 
	ld (0afa1h),hl		;b10a	22 a1 af 	" . . 
	ret			;b10d	c9 	. 

	call 0b08dh		;b10e	cd 8d b0 	. . . 
	ld hl,00001h		;b111	21 01 00 	! . . 
	ld de,00001h		;b114	11 01 00 	. . . 
	ld a,(0afa6h)		;b117	3a a6 af 	: . . 
	or a			;b11a	b7 	. 
	jr nz,$+4		;b11b	20 02 	  . 
	jr $+24		;b11d	18 16 	. . 
	ld hl,0afa7h		;b11f	21 a7 af 	! . . 
	call 0b095h		;b122	cd 95 b0 	. . . 
	push de			;b125	d5 	. 
	ld de,00001h		;b126	11 01 00 	. . . 
	ld hl,0afafh		;b129	21 af af 	! . . 
	ld a,(0afa6h)		;b12c	3a a6 af 	: . . 
	cp 002h		;b12f	fe 02 	. . 
	call z,0b095h		;b131	cc 95 b0 	. . . 
	pop hl			;b134	e1 	. 
	call 0aa6bh		;b135	cd 6b aa 	. k . 
	ret			;b138	c9 	. 

	call 0aa87h		;b139	cd 87 aa 	. . . 
	ld a,l			;b13c	7d 	} 
	ld (0afe9h),a		;b13d	32 e9 af 	2 . . 
	ld a,e			;b140	7b 	{ 
	ld (0afeah),a		;b141	32 ea af 	2 . . 
	ld a,(0afe7h)		;b144	3a e7 af 	: . . 
	ld (0afe8h),a		;b147	32 e8 af 	2 . . 
	ret			;b14a	c9 	. 

	ld a,001h		;b14b	3e 01 	> . 
	ld (0afe9h),a		;b14d	32 e9 af 	2 . . 
	ld (0afeah),a		;b150	32 ea af 	2 . . 
	ld a,083h		;b153	3e 83 	> . 
	ld (0afe8h),a		;b155	32 e8 af 	2 . . 
	ld (0afe7h),a		;b158	32 e7 af 	2 . . 
	ld a,(0afe8h)		;b15b	3a e8 af 	: . . 
	ld (0afe7h),a		;b15e	32 e7 af 	2 . . 
	call 0a9d3h		;b161	cd d3 a9 	. . . 
	ld de,(0afeah)		;b164	ed 5b ea af 	. [ . . 
	ld hl,(0afe9h)		;b168	2a e9 af 	* . . 
	call 0aa6bh		;b16b	cd 6b aa 	. k . 
	call 0aa9ah		;b16e	cd 9a aa 	. . . 
	ret			;b171	c9 	. 

	call 0b08dh		;b172	cd 8d b0 	. . . 
	ld a,(0afa6h)		;b175	3a a6 af 	: . . 
	or a			;b178	b7 	. 
	jr nz,$+6		;b179	20 04 	  . 
	ld c,083h		;b17b	0e 83 	. . 
	jr $+40		;b17d	18 26 	. & 
	ld b,a			;b17f	47 	G 
	ld a,(0afe7h)		;b180	3a e7 af 	: . . 
	ld c,a			;b183	4f 	O 
	ld de,00008h		;b184	11 08 00 	. . . 
	ld hl,0afa7h		;b187	21 a7 af 	! . . 
	ld a,(hl)			;b18a	7e 	~ 
	or a			;b18b	b7 	. 
	jr z,$+33		;b18c	28 1f 	( . 
	cp 030h		;b18e	fe 30 	. 0 
	jr z,$+29		;b190	28 1b 	( . 
	cp 032h		;b192	fe 32 	. 2 
	jr z,$+29		;b194	28 1b 	( . 
	cp 034h		;b196	fe 34 	. 4 
	jr z,$+29		;b198	28 1b 	( . 
	cp 035h		;b19a	fe 35 	. 5 
	jr z,$+29		;b19c	28 1b 	( . 
	cp 037h		;b19e	fe 37 	. 7 
	jr z,$+29		;b1a0	28 1b 	( . 
	add hl,de			;b1a2	19 	. 
	djnz $-25		;b1a3	10 e5 	. . 
	ld a,c			;b1a5	79 	y 
	ld (0afe7h),a		;b1a6	32 e7 af 	2 . . 
	call 0a9d3h		;b1a9	cd d3 a9 	. . . 
	ret			;b1ac	c9 	. 

	ld c,083h		;b1ad	0e 83 	. . 
	jr $-13		;b1af	18 f1 	. . 
	set 5,c		;b1b1	cb e9 	. . 
	jr $-17		;b1b3	18 ed 	. . 
	res 1,c		;b1b5	cb 89 	. . 
	jr $-21		;b1b7	18 e9 	. . 
	set 2,c		;b1b9	cb d1 	. . 
	jr $-25		;b1bb	18 e5 	. . 
	set 3,c		;b1bd	cb d9 	. . 
	jr $-29		;b1bf	18 e1 	. . 
	call 0b08dh		;b1c1	cd 8d b0 	. . . 
	ld a,(0afa7h)		;b1c4	3a a7 af 	: . . 
	call 0aeb4h		;b1c7	cd b4 ae 	. . . 
	call 0aa9ah		;b1ca	cd 9a aa 	. . . 
	ret			;b1cd	c9 	. 

	call 0b08dh		;b1ce	cd 8d b0 	. . . 
	ld a,(0afa7h)		;b1d1	3a a7 af 	: . . 
	call 0ae5eh		;b1d4	cd 5e ae 	. ^ . 
	call 0aa9ah		;b1d7	cd 9a aa 	. . . 
	ret			;b1da	c9 	. 

	call 0b08dh		;b1db	cd 8d b0 	. . . 
	call 0b1e6h		;b1de	cd e6 b1 	. . . 
	ld hl,0ad19h		;b1e1	21 19 ad 	! . . 
	jr $+17		;b1e4	18 0f 	. . 
	ld de,00001h		;b1e6	11 01 00 	. . . 
	ld hl,0afa7h		;b1e9	21 a7 af 	! . . 
	ld a,(0afa6h)		;b1ec	3a a6 af 	: . . 
	or a			;b1ef	b7 	. 
	call nz,0b095h		;b1f0	c4 95 b0 	. . . 
	ld b,e			;b1f3	43 	C 
	ret			;b1f4	c9 	. 

	push bc			;b1f5	c5 	. 
	push de			;b1f6	d5 	. 
	push hl			;b1f7	e5 	. 
	call 0b204h		;b1f8	cd 04 b2 	. . . 
	pop hl			;b1fb	e1 	. 
	pop de			;b1fc	d1 	. 
	pop bc			;b1fd	c1 	. 
	djnz $-9		;b1fe	10 f5 	. . 
	call 0aa9ah		;b200	cd 9a aa 	. . . 
	ret			;b203	c9 	. 

	jp (hl)			;b204	e9 	. 
	call 0b08dh		;b205	cd 8d b0 	. . . 
	call 0b1e6h		;b208	cd e6 b1 	. . . 
	ld hl,0ad53h		;b20b	21 53 ad 	! S . 
	jr $-25		;b20e	18 e5 	. . 
	ret			;b210	c9 	. 

	call 0b08dh		;b211	cd 8d b0 	. . . 
	call 0b1e6h		;b214	cd e6 b1 	. . . 
	ld hl,0ad70h		;b217	21 70 ad 	! p . 
	jr $-37		;b21a	18 d9 	. . 
	ret			;b21c	c9 	. 

	call 0b08dh		;b21d	cd 8d b0 	. . . 
	call 0b1e6h		;b220	cd e6 b1 	. . . 
	ld hl,0ad5dh		;b223	21 5d ad 	! ] . 
	jr $-49		;b226	18 cd 	. . 
	ret			;b228	c9 	. 

	call 0ad36h		;b229	cd 36 ad 	. 6 . 
	call 0aa9ah		;b22c	cd 9a aa 	. . . 
	ret			;b22f	c9 	. 

	call 0b08dh		;b230	cd 8d b0 	. . . 
	ld a,(0afa6h)		;b233	3a a6 af 	: . . 
	cp 002h		;b236	fe 02 	. . 
	jr nz,$+22		;b238	20 14 	  . 
	ld a,(0afa7h)		;b23a	3a a7 af 	: . . 
	cp 033h		;b23d	fe 33 	. 3 
	jr nz,$+15		;b23f	20 0d 	  . 
	ld a,(0afafh)		;b241	3a af af 	: . . 
	cp 031h		;b244	fe 31 	. 1 
	jr z,$+8		;b246	28 06 	( . 
	cp 034h		;b248	fe 34 	. 4 
	jr z,$+8		;b24a	28 06 	( . 
	jr $+2		;b24c	18 00 	. . 
	call 0a9a4h		;b24e	cd a4 a9 	. . . 
	ret			;b251	c9 	. 

	call 0a9b0h		;b252	cd b0 a9 	. . . 
	ret			;b255	c9 	. 

	call 0ad88h		;b256	cd 88 ad 	. . . 
	call 0ad97h		;b259	cd 97 ad 	. . . 
	call 0aa9ah		;b25c	cd 9a aa 	. . . 
	ret			;b25f	c9 	. 

	ld a,c			;b260	79 	y 
	call 0b08dh		;b261	cd 8d b0 	. . . 
	ret			;b264	c9 	. 

	nop			;b265	00 	. 
	nop			;b266	00 	. 
	nop			;b267	00 	. 
	nop			;b268	00 	. 
	nop			;b269	00 	. 
	nop			;b26a	00 	. 
	nop			;b26b	00 	. 
	nop			;b26c	00 	. 
	nop			;b26d	00 	. 
	nop			;b26e	00 	. 
	nop			;b26f	00 	. 
	nop			;b270	00 	. 
	nop			;b271	00 	. 
	nop			;b272	00 	. 
	nop			;b273	00 	. 
	nop			;b274	00 	. 
	nop			;b275	00 	. 
	nop			;b276	00 	. 
	nop			;b277	00 	. 
	nop			;b278	00 	. 
	nop			;b279	00 	. 
	nop			;b27a	00 	. 
	nop			;b27b	00 	. 
	nop			;b27c	00 	. 
	nop			;b27d	00 	. 
	nop			;b27e	00 	. 
	nop			;b27f	00 	. 
	nop			;b280	00 	. 
	nop			;b281	00 	. 
	nop			;b282	00 	. 
	nop			;b283	00 	. 
	nop			;b284	00 	. 
	nop			;b285	00 	. 
	nop			;b286	00 	. 
	nop			;b287	00 	. 
	nop			;b288	00 	. 
	nop			;b289	00 	. 
	nop			;b28a	00 	. 
	nop			;b28b	00 	. 
	nop			;b28c	00 	. 
	nop			;b28d	00 	. 
	nop			;b28e	00 	. 
	nop			;b28f	00 	. 
	nop			;b290	00 	. 
	nop			;b291	00 	. 
	nop			;b292	00 	. 
	nop			;b293	00 	. 
	nop			;b294	00 	. 
	nop			;b295	00 	. 
	nop			;b296	00 	. 
	nop			;b297	00 	. 
	nop			;b298	00 	. 
	nop			;b299	00 	. 
	nop			;b29a	00 	. 
	nop			;b29b	00 	. 
	nop			;b29c	00 	. 
	nop			;b29d	00 	. 
	nop			;b29e	00 	. 
	nop			;b29f	00 	. 
	nop			;b2a0	00 	. 
	nop			;b2a1	00 	. 
	nop			;b2a2	00 	. 
	nop			;b2a3	00 	. 
	nop			;b2a4	00 	. 
	nop			;b2a5	00 	. 
	nop			;b2a6	00 	. 
	nop			;b2a7	00 	. 
	nop			;b2a8	00 	. 
	nop			;b2a9	00 	. 
	nop			;b2aa	00 	. 
	nop			;b2ab	00 	. 
	nop			;b2ac	00 	. 
	nop			;b2ad	00 	. 
	nop			;b2ae	00 	. 
	nop			;b2af	00 	. 
	nop			;b2b0	00 	. 
	nop			;b2b1	00 	. 
	nop			;b2b2	00 	. 
	nop			;b2b3	00 	. 
	nop			;b2b4	00 	. 
	nop			;b2b5	00 	. 
	nop			;b2b6	00 	. 
	nop			;b2b7	00 	. 
	nop			;b2b8	00 	. 
	nop			;b2b9	00 	. 
	nop			;b2ba	00 	. 
	nop			;b2bb	00 	. 
	nop			;b2bc	00 	. 
	nop			;b2bd	00 	. 
	nop			;b2be	00 	. 
	nop			;b2bf	00 	. 
	nop			;b2c0	00 	. 
	nop			;b2c1	00 	. 
	nop			;b2c2	00 	. 
	nop			;b2c3	00 	. 
	nop			;b2c4	00 	. 
	nop			;b2c5	00 	. 
	nop			;b2c6	00 	. 
	nop			;b2c7	00 	. 
	nop			;b2c8	00 	. 
	nop			;b2c9	00 	. 
	nop			;b2ca	00 	. 
	nop			;b2cb	00 	. 
	nop			;b2cc	00 	. 
	nop			;b2cd	00 	. 
	nop			;b2ce	00 	. 
	nop			;b2cf	00 	. 
	nop			;b2d0	00 	. 
	nop			;b2d1	00 	. 
	nop			;b2d2	00 	. 
	nop			;b2d3	00 	. 
	nop			;b2d4	00 	. 
	nop			;b2d5	00 	. 
	nop			;b2d6	00 	. 
	nop			;b2d7	00 	. 
	nop			;b2d8	00 	. 
	nop			;b2d9	00 	. 
	nop			;b2da	00 	. 
	nop			;b2db	00 	. 
	nop			;b2dc	00 	. 
	nop			;b2dd	00 	. 
	nop			;b2de	00 	. 
	nop			;b2df	00 	. 
	nop			;b2e0	00 	. 
	nop			;b2e1	00 	. 
	nop			;b2e2	00 	. 
	nop			;b2e3	00 	. 
	nop			;b2e4	00 	. 
	nop			;b2e5	00 	. 
	nop			;b2e6	00 	. 
	nop			;b2e7	00 	. 
	nop			;b2e8	00 	. 
	nop			;b2e9	00 	. 
	nop			;b2ea	00 	. 
	nop			;b2eb	00 	. 
	nop			;b2ec	00 	. 
	nop			;b2ed	00 	. 
	nop			;b2ee	00 	. 
	nop			;b2ef	00 	. 
	nop			;b2f0	00 	. 
	nop			;b2f1	00 	. 
	nop			;b2f2	00 	. 
	nop			;b2f3	00 	. 
	nop			;b2f4	00 	. 
	nop			;b2f5	00 	. 
	nop			;b2f6	00 	. 
	nop			;b2f7	00 	. 
	nop			;b2f8	00 	. 
	nop			;b2f9	00 	. 
	nop			;b2fa	00 	. 
	nop			;b2fb	00 	. 
	nop			;b2fc	00 	. 
	nop			;b2fd	00 	. 
	nop			;b2fe	00 	. 
	nop			;b2ff	00 	. 
	nop			;b300	00 	. 
	nop			;b301	00 	. 
	nop			;b302	00 	. 
	nop			;b303	00 	. 
	nop			;b304	00 	. 
	nop			;b305	00 	. 
	nop			;b306	00 	. 
	nop			;b307	00 	. 
	nop			;b308	00 	. 
	nop			;b309	00 	. 
	nop			;b30a	00 	. 
	nop			;b30b	00 	. 
	nop			;b30c	00 	. 
	nop			;b30d	00 	. 
	nop			;b30e	00 	. 
	nop			;b30f	00 	. 
	nop			;b310	00 	. 
	nop			;b311	00 	. 
	nop			;b312	00 	. 
	nop			;b313	00 	. 
	nop			;b314	00 	. 
	nop			;b315	00 	. 
	nop			;b316	00 	. 
	nop			;b317	00 	. 
	nop			;b318	00 	. 
	nop			;b319	00 	. 
	nop			;b31a	00 	. 
	nop			;b31b	00 	. 
	nop			;b31c	00 	. 
	nop			;b31d	00 	. 
	nop			;b31e	00 	. 
	nop			;b31f	00 	. 
	nop			;b320	00 	. 
	nop			;b321	00 	. 
	nop			;b322	00 	. 
	nop			;b323	00 	. 
	nop			;b324	00 	. 
	nop			;b325	00 	. 
	nop			;b326	00 	. 
	nop			;b327	00 	. 
	nop			;b328	00 	. 
	nop			;b329	00 	. 
	nop			;b32a	00 	. 
	nop			;b32b	00 	. 
	nop			;b32c	00 	. 
	nop			;b32d	00 	. 
	nop			;b32e	00 	. 
	nop			;b32f	00 	. 
	nop			;b330	00 	. 
	nop			;b331	00 	. 
	nop			;b332	00 	. 
	nop			;b333	00 	. 
	nop			;b334	00 	. 
	nop			;b335	00 	. 
	nop			;b336	00 	. 
	nop			;b337	00 	. 
	nop			;b338	00 	. 
	nop			;b339	00 	. 
	nop			;b33a	00 	. 
	nop			;b33b	00 	. 
	nop			;b33c	00 	. 
	nop			;b33d	00 	. 
	nop			;b33e	00 	. 
	nop			;b33f	00 	. 
	nop			;b340	00 	. 
	nop			;b341	00 	. 
	nop			;b342	00 	. 
	nop			;b343	00 	. 
	nop			;b344	00 	. 
	nop			;b345	00 	. 
	nop			;b346	00 	. 
	nop			;b347	00 	. 
	nop			;b348	00 	. 
	nop			;b349	00 	. 
	nop			;b34a	00 	. 
	nop			;b34b	00 	. 
	nop			;b34c	00 	. 
	nop			;b34d	00 	. 
	nop			;b34e	00 	. 
	nop			;b34f	00 	. 
	nop			;b350	00 	. 
	nop			;b351	00 	. 
	nop			;b352	00 	. 
	nop			;b353	00 	. 
	nop			;b354	00 	. 
	nop			;b355	00 	. 
	nop			;b356	00 	. 
	nop			;b357	00 	. 
	nop			;b358	00 	. 
	nop			;b359	00 	. 
	nop			;b35a	00 	. 
	nop			;b35b	00 	. 
	nop			;b35c	00 	. 
	nop			;b35d	00 	. 
	nop			;b35e	00 	. 
	nop			;b35f	00 	. 
	nop			;b360	00 	. 
	nop			;b361	00 	. 
	nop			;b362	00 	. 
	nop			;b363	00 	. 
	nop			;b364	00 	. 
	nop			;b365	00 	. 
	nop			;b366	00 	. 
	nop			;b367	00 	. 
	nop			;b368	00 	. 
	nop			;b369	00 	. 
	nop			;b36a	00 	. 
	nop			;b36b	00 	. 
	nop			;b36c	00 	. 
	nop			;b36d	00 	. 
	nop			;b36e	00 	. 
	nop			;b36f	00 	. 
	nop			;b370	00 	. 
	nop			;b371	00 	. 
	nop			;b372	00 	. 
	nop			;b373	00 	. 
	nop			;b374	00 	. 
	nop			;b375	00 	. 
	nop			;b376	00 	. 
	nop			;b377	00 	. 
	nop			;b378	00 	. 
	nop			;b379	00 	. 
	nop			;b37a	00 	. 
	nop			;b37b	00 	. 
	nop			;b37c	00 	. 
	nop			;b37d	00 	. 
	nop			;b37e	00 	. 
	nop			;b37f	00 	. 
	nop			;b380	00 	. 
	nop			;b381	00 	. 
	nop			;b382	00 	. 
	nop			;b383	00 	. 
	nop			;b384	00 	. 
	nop			;b385	00 	. 
	nop			;b386	00 	. 
	nop			;b387	00 	. 
	nop			;b388	00 	. 
	nop			;b389	00 	. 
	nop			;b38a	00 	. 
	nop			;b38b	00 	. 
	nop			;b38c	00 	. 
	nop			;b38d	00 	. 
	nop			;b38e	00 	. 
	nop			;b38f	00 	. 
	nop			;b390	00 	. 
	nop			;b391	00 	. 
	nop			;b392	00 	. 
	nop			;b393	00 	. 
	nop			;b394	00 	. 
	nop			;b395	00 	. 
	nop			;b396	00 	. 
	nop			;b397	00 	. 
	nop			;b398	00 	. 
	nop			;b399	00 	. 
	nop			;b39a	00 	. 
	nop			;b39b	00 	. 
	nop			;b39c	00 	. 
	nop			;b39d	00 	. 
	nop			;b39e	00 	. 
	nop			;b39f	00 	. 
	nop			;b3a0	00 	. 
	nop			;b3a1	00 	. 
	nop			;b3a2	00 	. 
	nop			;b3a3	00 	. 
	nop			;b3a4	00 	. 
	nop			;b3a5	00 	. 
	nop			;b3a6	00 	. 
	nop			;b3a7	00 	. 
	nop			;b3a8	00 	. 
	nop			;b3a9	00 	. 
	nop			;b3aa	00 	. 
	nop			;b3ab	00 	. 
	nop			;b3ac	00 	. 
	nop			;b3ad	00 	. 
	nop			;b3ae	00 	. 
	nop			;b3af	00 	. 
	nop			;b3b0	00 	. 
	nop			;b3b1	00 	. 
	nop			;b3b2	00 	. 
	nop			;b3b3	00 	. 
	nop			;b3b4	00 	. 
	nop			;b3b5	00 	. 
	nop			;b3b6	00 	. 
	nop			;b3b7	00 	. 
	nop			;b3b8	00 	. 
	nop			;b3b9	00 	. 
	nop			;b3ba	00 	. 
	nop			;b3bb	00 	. 
	nop			;b3bc	00 	. 
	nop			;b3bd	00 	. 
	nop			;b3be	00 	. 
	nop			;b3bf	00 	. 
	nop			;b3c0	00 	. 
	nop			;b3c1	00 	. 
	nop			;b3c2	00 	. 
	nop			;b3c3	00 	. 
	nop			;b3c4	00 	. 
	nop			;b3c5	00 	. 
	nop			;b3c6	00 	. 
	nop			;b3c7	00 	. 
	nop			;b3c8	00 	. 
	nop			;b3c9	00 	. 
	nop			;b3ca	00 	. 
	nop			;b3cb	00 	. 
	nop			;b3cc	00 	. 
	nop			;b3cd	00 	. 
	nop			;b3ce	00 	. 
	nop			;b3cf	00 	. 
	nop			;b3d0	00 	. 
	nop			;b3d1	00 	. 
	nop			;b3d2	00 	. 
	nop			;b3d3	00 	. 
	nop			;b3d4	00 	. 
	nop			;b3d5	00 	. 
	nop			;b3d6	00 	. 
	nop			;b3d7	00 	. 
	nop			;b3d8	00 	. 
	nop			;b3d9	00 	. 
	nop			;b3da	00 	. 
	nop			;b3db	00 	. 
	nop			;b3dc	00 	. 
	nop			;b3dd	00 	. 
	nop			;b3de	00 	. 
	nop			;b3df	00 	. 
	nop			;b3e0	00 	. 
	nop			;b3e1	00 	. 
	nop			;b3e2	00 	. 
	nop			;b3e3	00 	. 
	nop			;b3e4	00 	. 
	nop			;b3e5	00 	. 
	nop			;b3e6	00 	. 
	nop			;b3e7	00 	. 
	nop			;b3e8	00 	. 
	nop			;b3e9	00 	. 
	nop			;b3ea	00 	. 
	nop			;b3eb	00 	. 
	nop			;b3ec	00 	. 
	nop			;b3ed	00 	. 
	nop			;b3ee	00 	. 
	nop			;b3ef	00 	. 
	nop			;b3f0	00 	. 
	nop			;b3f1	00 	. 
	nop			;b3f2	00 	. 
	nop			;b3f3	00 	. 
	nop			;b3f4	00 	. 
	nop			;b3f5	00 	. 
	nop			;b3f6	00 	. 
	nop			;b3f7	00 	. 
	nop			;b3f8	00 	. 
	nop			;b3f9	00 	. 
	nop			;b3fa	00 	. 
	nop			;b3fb	00 	. 
	nop			;b3fc	00 	. 
	nop			;b3fd	00 	. 
	nop			;b3fe	00 	. 
	nop			;b3ff	00 	. 
	nop			;b400	00 	. 
	nop			;b401	00 	. 
	nop			;b402	00 	. 
	nop			;b403	00 	. 
	nop			;b404	00 	. 
	nop			;b405	00 	. 
	nop			;b406	00 	. 
	nop			;b407	00 	. 
	nop			;b408	00 	. 
	nop			;b409	00 	. 
	nop			;b40a	00 	. 
	nop			;b40b	00 	. 
	nop			;b40c	00 	. 
	nop			;b40d	00 	. 
	nop			;b40e	00 	. 
	nop			;b40f	00 	. 
	nop			;b410	00 	. 
	nop			;b411	00 	. 
	nop			;b412	00 	. 
	nop			;b413	00 	. 
	nop			;b414	00 	. 
	nop			;b415	00 	. 
	nop			;b416	00 	. 
	nop			;b417	00 	. 
	nop			;b418	00 	. 
	nop			;b419	00 	. 
	nop			;b41a	00 	. 
	nop			;b41b	00 	. 
	nop			;b41c	00 	. 
	nop			;b41d	00 	. 
	nop			;b41e	00 	. 
	nop			;b41f	00 	. 
	nop			;b420	00 	. 
	nop			;b421	00 	. 
	nop			;b422	00 	. 
	nop			;b423	00 	. 
	nop			;b424	00 	. 
	nop			;b425	00 	. 
	nop			;b426	00 	. 
	nop			;b427	00 	. 
	nop			;b428	00 	. 
	nop			;b429	00 	. 
	nop			;b42a	00 	. 
	nop			;b42b	00 	. 
	nop			;b42c	00 	. 
	nop			;b42d	00 	. 
	nop			;b42e	00 	. 
	nop			;b42f	00 	. 
	nop			;b430	00 	. 
	nop			;b431	00 	. 
	nop			;b432	00 	. 
	nop			;b433	00 	. 
	nop			;b434	00 	. 
	nop			;b435	00 	. 
	nop			;b436	00 	. 
	nop			;b437	00 	. 
	nop			;b438	00 	. 
	nop			;b439	00 	. 
	nop			;b43a	00 	. 
	nop			;b43b	00 	. 
	nop			;b43c	00 	. 
	nop			;b43d	00 	. 
	nop			;b43e	00 	. 
	nop			;b43f	00 	. 
	nop			;b440	00 	. 
	nop			;b441	00 	. 
	nop			;b442	00 	. 
	nop			;b443	00 	. 
	nop			;b444	00 	. 
	nop			;b445	00 	. 
	nop			;b446	00 	. 
	nop			;b447	00 	. 
	nop			;b448	00 	. 
	nop			;b449	00 	. 
	nop			;b44a	00 	. 
	nop			;b44b	00 	. 
	nop			;b44c	00 	. 
	nop			;b44d	00 	. 
	nop			;b44e	00 	. 
	nop			;b44f	00 	. 
	nop			;b450	00 	. 
	nop			;b451	00 	. 
	nop			;b452	00 	. 
	nop			;b453	00 	. 
	nop			;b454	00 	. 
	nop			;b455	00 	. 
	nop			;b456	00 	. 
	nop			;b457	00 	. 
	nop			;b458	00 	. 
	nop			;b459	00 	. 
	nop			;b45a	00 	. 
	nop			;b45b	00 	. 
	nop			;b45c	00 	. 
	nop			;b45d	00 	. 
	nop			;b45e	00 	. 
	nop			;b45f	00 	. 
	nop			;b460	00 	. 
	nop			;b461	00 	. 
	nop			;b462	00 	. 
	nop			;b463	00 	. 
	nop			;b464	00 	. 
	nop			;b465	00 	. 
	nop			;b466	00 	. 
	nop			;b467	00 	. 
	nop			;b468	00 	. 
	nop			;b469	00 	. 
	nop			;b46a	00 	. 
	nop			;b46b	00 	. 
	nop			;b46c	00 	. 
	nop			;b46d	00 	. 
	nop			;b46e	00 	. 
	nop			;b46f	00 	. 
	nop			;b470	00 	. 
	nop			;b471	00 	. 
	nop			;b472	00 	. 
	nop			;b473	00 	. 
	nop			;b474	00 	. 
	nop			;b475	00 	. 
	nop			;b476	00 	. 
	nop			;b477	00 	. 
	nop			;b478	00 	. 
	nop			;b479	00 	. 
	nop			;b47a	00 	. 
	nop			;b47b	00 	. 
	nop			;b47c	00 	. 
	nop			;b47d	00 	. 
	nop			;b47e	00 	. 
	nop			;b47f	00 	. 
	nop			;b480	00 	. 
	nop			;b481	00 	. 
	nop			;b482	00 	. 
	nop			;b483	00 	. 
	nop			;b484	00 	. 
	nop			;b485	00 	. 
	nop			;b486	00 	. 
	nop			;b487	00 	. 
	nop			;b488	00 	. 
	nop			;b489	00 	. 
	nop			;b48a	00 	. 
	nop			;b48b	00 	. 
	nop			;b48c	00 	. 
	nop			;b48d	00 	. 
	nop			;b48e	00 	. 
	nop			;b48f	00 	. 
	nop			;b490	00 	. 
	nop			;b491	00 	. 
	nop			;b492	00 	. 
	nop			;b493	00 	. 
	nop			;b494	00 	. 
	nop			;b495	00 	. 
	nop			;b496	00 	. 
	nop			;b497	00 	. 
	nop			;b498	00 	. 
	nop			;b499	00 	. 
	nop			;b49a	00 	. 
	nop			;b49b	00 	. 
	nop			;b49c	00 	. 
	nop			;b49d	00 	. 
	nop			;b49e	00 	. 
	nop			;b49f	00 	. 
	nop			;b4a0	00 	. 
	nop			;b4a1	00 	. 
	nop			;b4a2	00 	. 
	nop			;b4a3	00 	. 
	nop			;b4a4	00 	. 
	nop			;b4a5	00 	. 
	nop			;b4a6	00 	. 
	nop			;b4a7	00 	. 
	nop			;b4a8	00 	. 
	nop			;b4a9	00 	. 
	nop			;b4aa	00 	. 
	nop			;b4ab	00 	. 
	nop			;b4ac	00 	. 
	nop			;b4ad	00 	. 
	nop			;b4ae	00 	. 
	nop			;b4af	00 	. 
	nop			;b4b0	00 	. 
	nop			;b4b1	00 	. 
	nop			;b4b2	00 	. 
	nop			;b4b3	00 	. 
	nop			;b4b4	00 	. 
	nop			;b4b5	00 	. 
	nop			;b4b6	00 	. 
	nop			;b4b7	00 	. 
	nop			;b4b8	00 	. 
	nop			;b4b9	00 	. 
	nop			;b4ba	00 	. 
	nop			;b4bb	00 	. 
	nop			;b4bc	00 	. 
	nop			;b4bd	00 	. 
	nop			;b4be	00 	. 
	nop			;b4bf	00 	. 
	nop			;b4c0	00 	. 
	nop			;b4c1	00 	. 
	nop			;b4c2	00 	. 
	nop			;b4c3	00 	. 
	nop			;b4c4	00 	. 
	nop			;b4c5	00 	. 
	nop			;b4c6	00 	. 
	nop			;b4c7	00 	. 
	nop			;b4c8	00 	. 
	nop			;b4c9	00 	. 
	nop			;b4ca	00 	. 
	nop			;b4cb	00 	. 
	nop			;b4cc	00 	. 
	nop			;b4cd	00 	. 
	nop			;b4ce	00 	. 
	nop			;b4cf	00 	. 
	nop			;b4d0	00 	. 
	nop			;b4d1	00 	. 
	nop			;b4d2	00 	. 
	nop			;b4d3	00 	. 
	nop			;b4d4	00 	. 
	nop			;b4d5	00 	. 
	nop			;b4d6	00 	. 
	nop			;b4d7	00 	. 
	nop			;b4d8	00 	. 
	nop			;b4d9	00 	. 
	nop			;b4da	00 	. 
	nop			;b4db	00 	. 
	nop			;b4dc	00 	. 
	nop			;b4dd	00 	. 
	nop			;b4de	00 	. 
	nop			;b4df	00 	. 
	nop			;b4e0	00 	. 
	nop			;b4e1	00 	. 
	nop			;b4e2	00 	. 
	nop			;b4e3	00 	. 
	nop			;b4e4	00 	. 
	nop			;b4e5	00 	. 
	nop			;b4e6	00 	. 
	nop			;b4e7	00 	. 
	nop			;b4e8	00 	. 
	nop			;b4e9	00 	. 
	nop			;b4ea	00 	. 
	nop			;b4eb	00 	. 
	nop			;b4ec	00 	. 
	nop			;b4ed	00 	. 
	nop			;b4ee	00 	. 
	nop			;b4ef	00 	. 
	nop			;b4f0	00 	. 
	nop			;b4f1	00 	. 
	nop			;b4f2	00 	. 
	nop			;b4f3	00 	. 
	nop			;b4f4	00 	. 
	nop			;b4f5	00 	. 
	nop			;b4f6	00 	. 
	nop			;b4f7	00 	. 
	nop			;b4f8	00 	. 
	nop			;b4f9	00 	. 
	nop			;b4fa	00 	. 
	nop			;b4fb	00 	. 
	nop			;b4fc	00 	. 
	nop			;b4fd	00 	. 
	nop			;b4fe	00 	. 
	nop			;b4ff	00 	. 
	nop			;b500	00 	. 
	nop			;b501	00 	. 
	nop			;b502	00 	. 
	nop			;b503	00 	. 
	nop			;b504	00 	. 
	nop			;b505	00 	. 
	nop			;b506	00 	. 
	nop			;b507	00 	. 
	nop			;b508	00 	. 
	nop			;b509	00 	. 
	nop			;b50a	00 	. 
	nop			;b50b	00 	. 
	nop			;b50c	00 	. 
	nop			;b50d	00 	. 
	nop			;b50e	00 	. 
	nop			;b50f	00 	. 
	nop			;b510	00 	. 
	nop			;b511	00 	. 
	nop			;b512	00 	. 
	nop			;b513	00 	. 
	nop			;b514	00 	. 
	nop			;b515	00 	. 
	nop			;b516	00 	. 
	nop			;b517	00 	. 
	nop			;b518	00 	. 
	nop			;b519	00 	. 
	nop			;b51a	00 	. 
	nop			;b51b	00 	. 
	nop			;b51c	00 	. 
	nop			;b51d	00 	. 
	nop			;b51e	00 	. 
	nop			;b51f	00 	. 
	nop			;b520	00 	. 
	nop			;b521	00 	. 
	nop			;b522	00 	. 
	nop			;b523	00 	. 
	nop			;b524	00 	. 
	nop			;b525	00 	. 
	nop			;b526	00 	. 
	nop			;b527	00 	. 
	nop			;b528	00 	. 
	nop			;b529	00 	. 
	nop			;b52a	00 	. 
	nop			;b52b	00 	. 
	nop			;b52c	00 	. 
	nop			;b52d	00 	. 
	nop			;b52e	00 	. 
	nop			;b52f	00 	. 
	nop			;b530	00 	. 
	nop			;b531	00 	. 
	nop			;b532	00 	. 
	nop			;b533	00 	. 
	nop			;b534	00 	. 
	nop			;b535	00 	. 
	nop			;b536	00 	. 
	nop			;b537	00 	. 
	nop			;b538	00 	. 
	nop			;b539	00 	. 
	nop			;b53a	00 	. 
	nop			;b53b	00 	. 
	nop			;b53c	00 	. 
	nop			;b53d	00 	. 
	nop			;b53e	00 	. 
	nop			;b53f	00 	. 
	nop			;b540	00 	. 
	nop			;b541	00 	. 
	nop			;b542	00 	. 
	nop			;b543	00 	. 
	nop			;b544	00 	. 
	nop			;b545	00 	. 
	nop			;b546	00 	. 
	nop			;b547	00 	. 
	nop			;b548	00 	. 
	nop			;b549	00 	. 
	nop			;b54a	00 	. 
	nop			;b54b	00 	. 
	nop			;b54c	00 	. 
	nop			;b54d	00 	. 
	nop			;b54e	00 	. 
	nop			;b54f	00 	. 
	nop			;b550	00 	. 
	nop			;b551	00 	. 
	nop			;b552	00 	. 
	nop			;b553	00 	. 
	nop			;b554	00 	. 
	nop			;b555	00 	. 
	nop			;b556	00 	. 
	nop			;b557	00 	. 
	nop			;b558	00 	. 
	nop			;b559	00 	. 
	nop			;b55a	00 	. 
	nop			;b55b	00 	. 
	nop			;b55c	00 	. 
	nop			;b55d	00 	. 
	nop			;b55e	00 	. 
	nop			;b55f	00 	. 
	nop			;b560	00 	. 
	nop			;b561	00 	. 
	nop			;b562	00 	. 
	nop			;b563	00 	. 
	nop			;b564	00 	. 
	nop			;b565	00 	. 
	nop			;b566	00 	. 
	nop			;b567	00 	. 
	nop			;b568	00 	. 
	nop			;b569	00 	. 
	nop			;b56a	00 	. 
	nop			;b56b	00 	. 
	nop			;b56c	00 	. 
	nop			;b56d	00 	. 
	nop			;b56e	00 	. 
	nop			;b56f	00 	. 
	nop			;b570	00 	. 
	nop			;b571	00 	. 
	nop			;b572	00 	. 
	nop			;b573	00 	. 
	nop			;b574	00 	. 
	nop			;b575	00 	. 
	nop			;b576	00 	. 
	nop			;b577	00 	. 
	nop			;b578	00 	. 
	nop			;b579	00 	. 
	nop			;b57a	00 	. 
	nop			;b57b	00 	. 
	nop			;b57c	00 	. 
	nop			;b57d	00 	. 
	nop			;b57e	00 	. 
	nop			;b57f	00 	. 
	nop			;b580	00 	. 
	nop			;b581	00 	. 
	nop			;b582	00 	. 
	nop			;b583	00 	. 
	nop			;b584	00 	. 
	nop			;b585	00 	. 
	nop			;b586	00 	. 
	nop			;b587	00 	. 
	nop			;b588	00 	. 
	nop			;b589	00 	. 
	nop			;b58a	00 	. 
	nop			;b58b	00 	. 
	nop			;b58c	00 	. 
	nop			;b58d	00 	. 
	nop			;b58e	00 	. 
	nop			;b58f	00 	. 
	nop			;b590	00 	. 
	nop			;b591	00 	. 
	nop			;b592	00 	. 
	nop			;b593	00 	. 
	nop			;b594	00 	. 
	nop			;b595	00 	. 
	nop			;b596	00 	. 
	nop			;b597	00 	. 
	nop			;b598	00 	. 
	nop			;b599	00 	. 
	nop			;b59a	00 	. 
	nop			;b59b	00 	. 
	nop			;b59c	00 	. 
	nop			;b59d	00 	. 
	nop			;b59e	00 	. 
	nop			;b59f	00 	. 
	nop			;b5a0	00 	. 
	nop			;b5a1	00 	. 
	nop			;b5a2	00 	. 
	nop			;b5a3	00 	. 
	nop			;b5a4	00 	. 
	nop			;b5a5	00 	. 
	nop			;b5a6	00 	. 
	nop			;b5a7	00 	. 
	nop			;b5a8	00 	. 
	nop			;b5a9	00 	. 
	nop			;b5aa	00 	. 
	nop			;b5ab	00 	. 
	nop			;b5ac	00 	. 
	nop			;b5ad	00 	. 
	nop			;b5ae	00 	. 
	nop			;b5af	00 	. 
	nop			;b5b0	00 	. 
	nop			;b5b1	00 	. 
	nop			;b5b2	00 	. 
	nop			;b5b3	00 	. 
	nop			;b5b4	00 	. 
	nop			;b5b5	00 	. 
	nop			;b5b6	00 	. 
	nop			;b5b7	00 	. 
	nop			;b5b8	00 	. 
	nop			;b5b9	00 	. 
	nop			;b5ba	00 	. 
	nop			;b5bb	00 	. 
	nop			;b5bc	00 	. 
	nop			;b5bd	00 	. 
	nop			;b5be	00 	. 
	nop			;b5bf	00 	. 
	nop			;b5c0	00 	. 
	nop			;b5c1	00 	. 
	nop			;b5c2	00 	. 
	nop			;b5c3	00 	. 
	nop			;b5c4	00 	. 
	nop			;b5c5	00 	. 
	nop			;b5c6	00 	. 
	nop			;b5c7	00 	. 
	nop			;b5c8	00 	. 
	nop			;b5c9	00 	. 
	nop			;b5ca	00 	. 
	nop			;b5cb	00 	. 
	nop			;b5cc	00 	. 
	nop			;b5cd	00 	. 
	nop			;b5ce	00 	. 
	nop			;b5cf	00 	. 
	nop			;b5d0	00 	. 
	nop			;b5d1	00 	. 
	nop			;b5d2	00 	. 
	nop			;b5d3	00 	. 
	nop			;b5d4	00 	. 
	nop			;b5d5	00 	. 
	nop			;b5d6	00 	. 
	nop			;b5d7	00 	. 
	nop			;b5d8	00 	. 
	nop			;b5d9	00 	. 
	nop			;b5da	00 	. 
	nop			;b5db	00 	. 
	nop			;b5dc	00 	. 
	nop			;b5dd	00 	. 
	nop			;b5de	00 	. 
	nop			;b5df	00 	. 
	nop			;b5e0	00 	. 
	nop			;b5e1	00 	. 
	nop			;b5e2	00 	. 
	nop			;b5e3	00 	. 
	nop			;b5e4	00 	. 
	nop			;b5e5	00 	. 
	nop			;b5e6	00 	. 
	nop			;b5e7	00 	. 
	nop			;b5e8	00 	. 
	nop			;b5e9	00 	. 
	nop			;b5ea	00 	. 
	nop			;b5eb	00 	. 
	nop			;b5ec	00 	. 
	nop			;b5ed	00 	. 
	nop			;b5ee	00 	. 
	nop			;b5ef	00 	. 
	nop			;b5f0	00 	. 
	nop			;b5f1	00 	. 
	nop			;b5f2	00 	. 
	nop			;b5f3	00 	. 
	nop			;b5f4	00 	. 
	nop			;b5f5	00 	. 
	nop			;b5f6	00 	. 
	nop			;b5f7	00 	. 
	nop			;b5f8	00 	. 
	nop			;b5f9	00 	. 
	nop			;b5fa	00 	. 
	nop			;b5fb	00 	. 
	nop			;b5fc	00 	. 
	nop			;b5fd	00 	. 
	nop			;b5fe	00 	. 
	nop			;b5ff	00 	. 
	nop			;b600	00 	. 
	nop			;b601	00 	. 
	nop			;b602	00 	. 
	nop			;b603	00 	. 
	nop			;b604	00 	. 
	nop			;b605	00 	. 
	nop			;b606	00 	. 
	nop			;b607	00 	. 
	nop			;b608	00 	. 
	nop			;b609	00 	. 
	nop			;b60a	00 	. 
	nop			;b60b	00 	. 
	nop			;b60c	00 	. 
	nop			;b60d	00 	. 
	nop			;b60e	00 	. 
	nop			;b60f	00 	. 
	nop			;b610	00 	. 
	nop			;b611	00 	. 
	nop			;b612	00 	. 
	nop			;b613	00 	. 
	nop			;b614	00 	. 
	nop			;b615	00 	. 
	nop			;b616	00 	. 
	nop			;b617	00 	. 
	nop			;b618	00 	. 
	nop			;b619	00 	. 
	nop			;b61a	00 	. 
	nop			;b61b	00 	. 
	nop			;b61c	00 	. 
	nop			;b61d	00 	. 
	nop			;b61e	00 	. 
	nop			;b61f	00 	. 
	nop			;b620	00 	. 
	nop			;b621	00 	. 
	nop			;b622	00 	. 
	nop			;b623	00 	. 
	nop			;b624	00 	. 
	nop			;b625	00 	. 
	nop			;b626	00 	. 
	nop			;b627	00 	. 
	nop			;b628	00 	. 
	nop			;b629	00 	. 
	nop			;b62a	00 	. 
	nop			;b62b	00 	. 
	nop			;b62c	00 	. 
	nop			;b62d	00 	. 
	nop			;b62e	00 	. 
	nop			;b62f	00 	. 
	nop			;b630	00 	. 
	nop			;b631	00 	. 
	nop			;b632	00 	. 
	nop			;b633	00 	. 
	nop			;b634	00 	. 
	nop			;b635	00 	. 
	nop			;b636	00 	. 
	nop			;b637	00 	. 
	nop			;b638	00 	. 
	nop			;b639	00 	. 
	nop			;b63a	00 	. 
	nop			;b63b	00 	. 
	nop			;b63c	00 	. 
	nop			;b63d	00 	. 
	nop			;b63e	00 	. 
	nop			;b63f	00 	. 
	nop			;b640	00 	. 
	nop			;b641	00 	. 
	nop			;b642	00 	. 
	nop			;b643	00 	. 
	nop			;b644	00 	. 
	nop			;b645	00 	. 
	nop			;b646	00 	. 
	nop			;b647	00 	. 
	nop			;b648	00 	. 
	nop			;b649	00 	. 
	nop			;b64a	00 	. 
	nop			;b64b	00 	. 
	nop			;b64c	00 	. 
	nop			;b64d	00 	. 
	nop			;b64e	00 	. 
	nop			;b64f	00 	. 
	nop			;b650	00 	. 
	nop			;b651	00 	. 
	nop			;b652	00 	. 
	nop			;b653	00 	. 
	nop			;b654	00 	. 
	nop			;b655	00 	. 
	nop			;b656	00 	. 
	nop			;b657	00 	. 
	nop			;b658	00 	. 
	nop			;b659	00 	. 
	nop			;b65a	00 	. 
	nop			;b65b	00 	. 
	nop			;b65c	00 	. 
	nop			;b65d	00 	. 
	nop			;b65e	00 	. 
	nop			;b65f	00 	. 
	nop			;b660	00 	. 
	nop			;b661	00 	. 
	nop			;b662	00 	. 
	nop			;b663	00 	. 
	nop			;b664	00 	. 
	nop			;b665	00 	. 
	nop			;b666	00 	. 
	nop			;b667	00 	. 
	nop			;b668	00 	. 
	nop			;b669	00 	. 
	nop			;b66a	00 	. 
	nop			;b66b	00 	. 
	nop			;b66c	00 	. 
	nop			;b66d	00 	. 
	nop			;b66e	00 	. 
	nop			;b66f	00 	. 
	nop			;b670	00 	. 
	nop			;b671	00 	. 
	nop			;b672	00 	. 
	nop			;b673	00 	. 
	nop			;b674	00 	. 
	nop			;b675	00 	. 
	nop			;b676	00 	. 
	nop			;b677	00 	. 
	nop			;b678	00 	. 
	nop			;b679	00 	. 
	nop			;b67a	00 	. 
	nop			;b67b	00 	. 
	nop			;b67c	00 	. 
	nop			;b67d	00 	. 
	nop			;b67e	00 	. 
	nop			;b67f	00 	. 
	nop			;b680	00 	. 
	nop			;b681	00 	. 
	nop			;b682	00 	. 
	nop			;b683	00 	. 
	nop			;b684	00 	. 
	nop			;b685	00 	. 
	nop			;b686	00 	. 
	nop			;b687	00 	. 
	nop			;b688	00 	. 
	nop			;b689	00 	. 
	nop			;b68a	00 	. 
	nop			;b68b	00 	. 
	nop			;b68c	00 	. 
	nop			;b68d	00 	. 
	nop			;b68e	00 	. 
	nop			;b68f	00 	. 
	nop			;b690	00 	. 
	nop			;b691	00 	. 
	nop			;b692	00 	. 
	nop			;b693	00 	. 
	nop			;b694	00 	. 
	nop			;b695	00 	. 
	nop			;b696	00 	. 
	nop			;b697	00 	. 
	nop			;b698	00 	. 
	nop			;b699	00 	. 
	nop			;b69a	00 	. 
	nop			;b69b	00 	. 
	nop			;b69c	00 	. 
	nop			;b69d	00 	. 
	nop			;b69e	00 	. 
	nop			;b69f	00 	. 
	nop			;b6a0	00 	. 
	nop			;b6a1	00 	. 
	nop			;b6a2	00 	. 
	nop			;b6a3	00 	. 
	nop			;b6a4	00 	. 
	nop			;b6a5	00 	. 
	nop			;b6a6	00 	. 
	nop			;b6a7	00 	. 
	nop			;b6a8	00 	. 
	nop			;b6a9	00 	. 
	nop			;b6aa	00 	. 
	nop			;b6ab	00 	. 
	nop			;b6ac	00 	. 
	nop			;b6ad	00 	. 
	nop			;b6ae	00 	. 
	nop			;b6af	00 	. 
	nop			;b6b0	00 	. 
	nop			;b6b1	00 	. 
	nop			;b6b2	00 	. 
	nop			;b6b3	00 	. 
	nop			;b6b4	00 	. 
	nop			;b6b5	00 	. 
	nop			;b6b6	00 	. 
	nop			;b6b7	00 	. 
	nop			;b6b8	00 	. 
	nop			;b6b9	00 	. 
	nop			;b6ba	00 	. 
	nop			;b6bb	00 	. 
	nop			;b6bc	00 	. 
	nop			;b6bd	00 	. 
	nop			;b6be	00 	. 
	nop			;b6bf	00 	. 
	nop			;b6c0	00 	. 
	nop			;b6c1	00 	. 
	nop			;b6c2	00 	. 
	nop			;b6c3	00 	. 
	nop			;b6c4	00 	. 
	nop			;b6c5	00 	. 
	nop			;b6c6	00 	. 
	nop			;b6c7	00 	. 
	nop			;b6c8	00 	. 
	nop			;b6c9	00 	. 
	nop			;b6ca	00 	. 
	nop			;b6cb	00 	. 
	nop			;b6cc	00 	. 
	nop			;b6cd	00 	. 
	nop			;b6ce	00 	. 
	nop			;b6cf	00 	. 
	nop			;b6d0	00 	. 
	nop			;b6d1	00 	. 
	nop			;b6d2	00 	. 
	nop			;b6d3	00 	. 
	nop			;b6d4	00 	. 
	nop			;b6d5	00 	. 
	nop			;b6d6	00 	. 
	nop			;b6d7	00 	. 
	nop			;b6d8	00 	. 
	nop			;b6d9	00 	. 
	nop			;b6da	00 	. 
	nop			;b6db	00 	. 
	nop			;b6dc	00 	. 
	nop			;b6dd	00 	. 
	nop			;b6de	00 	. 
	nop			;b6df	00 	. 
	nop			;b6e0	00 	. 
	nop			;b6e1	00 	. 
	nop			;b6e2	00 	. 
	nop			;b6e3	00 	. 
	nop			;b6e4	00 	. 
	nop			;b6e5	00 	. 
	nop			;b6e6	00 	. 
	nop			;b6e7	00 	. 
	nop			;b6e8	00 	. 
	nop			;b6e9	00 	. 
	nop			;b6ea	00 	. 
	nop			;b6eb	00 	. 
	nop			;b6ec	00 	. 
	nop			;b6ed	00 	. 
	nop			;b6ee	00 	. 
	nop			;b6ef	00 	. 
	nop			;b6f0	00 	. 
	nop			;b6f1	00 	. 
	nop			;b6f2	00 	. 
	nop			;b6f3	00 	. 
	nop			;b6f4	00 	. 
	nop			;b6f5	00 	. 
	nop			;b6f6	00 	. 
	nop			;b6f7	00 	. 
	nop			;b6f8	00 	. 
	nop			;b6f9	00 	. 
	nop			;b6fa	00 	. 
	nop			;b6fb	00 	. 
	nop			;b6fc	00 	. 
	nop			;b6fd	00 	. 
	nop			;b6fe	00 	. 
	nop			;b6ff	00 	. 
	nop			;b700	00 	. 
	nop			;b701	00 	. 
	nop			;b702	00 	. 
	nop			;b703	00 	. 
	nop			;b704	00 	. 
	nop			;b705	00 	. 
	nop			;b706	00 	. 
	nop			;b707	00 	. 
	nop			;b708	00 	. 
	nop			;b709	00 	. 
	nop			;b70a	00 	. 
	nop			;b70b	00 	. 
	nop			;b70c	00 	. 
	nop			;b70d	00 	. 
	nop			;b70e	00 	. 
	nop			;b70f	00 	. 
	nop			;b710	00 	. 
	nop			;b711	00 	. 
	nop			;b712	00 	. 
	nop			;b713	00 	. 
	nop			;b714	00 	. 
	nop			;b715	00 	. 
	nop			;b716	00 	. 
	nop			;b717	00 	. 
	nop			;b718	00 	. 
	nop			;b719	00 	. 
	nop			;b71a	00 	. 
	nop			;b71b	00 	. 
	nop			;b71c	00 	. 
	nop			;b71d	00 	. 
	nop			;b71e	00 	. 
	nop			;b71f	00 	. 
	nop			;b720	00 	. 
	nop			;b721	00 	. 
	nop			;b722	00 	. 
	nop			;b723	00 	. 
	nop			;b724	00 	. 
	nop			;b725	00 	. 
	nop			;b726	00 	. 
	nop			;b727	00 	. 
	nop			;b728	00 	. 
	nop			;b729	00 	. 
	nop			;b72a	00 	. 
	nop			;b72b	00 	. 
	nop			;b72c	00 	. 
	nop			;b72d	00 	. 
	nop			;b72e	00 	. 
	nop			;b72f	00 	. 
	nop			;b730	00 	. 
	nop			;b731	00 	. 
	nop			;b732	00 	. 
	nop			;b733	00 	. 
	nop			;b734	00 	. 
	nop			;b735	00 	. 
	nop			;b736	00 	. 
	nop			;b737	00 	. 
	nop			;b738	00 	. 
	nop			;b739	00 	. 
	nop			;b73a	00 	. 
	nop			;b73b	00 	. 
	nop			;b73c	00 	. 
	nop			;b73d	00 	. 
	nop			;b73e	00 	. 
	nop			;b73f	00 	. 
	nop			;b740	00 	. 
	nop			;b741	00 	. 
	nop			;b742	00 	. 
	nop			;b743	00 	. 
	nop			;b744	00 	. 
	nop			;b745	00 	. 
	nop			;b746	00 	. 
	nop			;b747	00 	. 
	nop			;b748	00 	. 
	nop			;b749	00 	. 
	nop			;b74a	00 	. 
	nop			;b74b	00 	. 
	nop			;b74c	00 	. 
	nop			;b74d	00 	. 
	nop			;b74e	00 	. 
	nop			;b74f	00 	. 
	nop			;b750	00 	. 
	nop			;b751	00 	. 
	nop			;b752	00 	. 
	nop			;b753	00 	. 
	nop			;b754	00 	. 
	nop			;b755	00 	. 
	nop			;b756	00 	. 
	nop			;b757	00 	. 
	nop			;b758	00 	. 
	nop			;b759	00 	. 
	nop			;b75a	00 	. 
	nop			;b75b	00 	. 
	nop			;b75c	00 	. 
	nop			;b75d	00 	. 
	nop			;b75e	00 	. 
	nop			;b75f	00 	. 
	nop			;b760	00 	. 
	nop			;b761	00 	. 
	nop			;b762	00 	. 
	nop			;b763	00 	. 
	nop			;b764	00 	. 
	nop			;b765	00 	. 
	nop			;b766	00 	. 
	nop			;b767	00 	. 
	nop			;b768	00 	. 
	nop			;b769	00 	. 
	nop			;b76a	00 	. 
	nop			;b76b	00 	. 
	nop			;b76c	00 	. 
	nop			;b76d	00 	. 
	nop			;b76e	00 	. 
	nop			;b76f	00 	. 
	nop			;b770	00 	. 
	nop			;b771	00 	. 
	nop			;b772	00 	. 
	nop			;b773	00 	. 
	nop			;b774	00 	. 
	nop			;b775	00 	. 
	nop			;b776	00 	. 
	nop			;b777	00 	. 
	nop			;b778	00 	. 
	nop			;b779	00 	. 
	nop			;b77a	00 	. 
	nop			;b77b	00 	. 
	nop			;b77c	00 	. 
	nop			;b77d	00 	. 
	nop			;b77e	00 	. 
	nop			;b77f	00 	. 
	nop			;b780	00 	. 
	nop			;b781	00 	. 
	nop			;b782	00 	. 
	nop			;b783	00 	. 
	nop			;b784	00 	. 
	nop			;b785	00 	. 
	nop			;b786	00 	. 
	nop			;b787	00 	. 
	nop			;b788	00 	. 
	nop			;b789	00 	. 
	nop			;b78a	00 	. 
	nop			;b78b	00 	. 
	nop			;b78c	00 	. 
	nop			;b78d	00 	. 
	nop			;b78e	00 	. 
	nop			;b78f	00 	. 
	nop			;b790	00 	. 
	nop			;b791	00 	. 
	nop			;b792	00 	. 
	nop			;b793	00 	. 
	nop			;b794	00 	. 
	nop			;b795	00 	. 
	nop			;b796	00 	. 
	nop			;b797	00 	. 
	nop			;b798	00 	. 
	nop			;b799	00 	. 
	nop			;b79a	00 	. 
	nop			;b79b	00 	. 
	nop			;b79c	00 	. 
	nop			;b79d	00 	. 
	nop			;b79e	00 	. 
	nop			;b79f	00 	. 
	nop			;b7a0	00 	. 
	nop			;b7a1	00 	. 
	nop			;b7a2	00 	. 
	nop			;b7a3	00 	. 
	nop			;b7a4	00 	. 
	nop			;b7a5	00 	. 
	nop			;b7a6	00 	. 
	nop			;b7a7	00 	. 
	nop			;b7a8	00 	. 
	nop			;b7a9	00 	. 
	nop			;b7aa	00 	. 
	nop			;b7ab	00 	. 
	nop			;b7ac	00 	. 
	nop			;b7ad	00 	. 
	nop			;b7ae	00 	. 
	nop			;b7af	00 	. 
	nop			;b7b0	00 	. 
	nop			;b7b1	00 	. 
	nop			;b7b2	00 	. 
	nop			;b7b3	00 	. 
	nop			;b7b4	00 	. 
	nop			;b7b5	00 	. 
	nop			;b7b6	00 	. 
	nop			;b7b7	00 	. 
	nop			;b7b8	00 	. 
	nop			;b7b9	00 	. 
	nop			;b7ba	00 	. 
	nop			;b7bb	00 	. 
	nop			;b7bc	00 	. 
	nop			;b7bd	00 	. 
	nop			;b7be	00 	. 
	nop			;b7bf	00 	. 
	nop			;b7c0	00 	. 
	nop			;b7c1	00 	. 
	nop			;b7c2	00 	. 
	nop			;b7c3	00 	. 
	nop			;b7c4	00 	. 
	nop			;b7c5	00 	. 
	nop			;b7c6	00 	. 
	nop			;b7c7	00 	. 
	nop			;b7c8	00 	. 
	nop			;b7c9	00 	. 
	nop			;b7ca	00 	. 
	nop			;b7cb	00 	. 
	nop			;b7cc	00 	. 
	nop			;b7cd	00 	. 
	nop			;b7ce	00 	. 
	nop			;b7cf	00 	. 
	nop			;b7d0	00 	. 
	nop			;b7d1	00 	. 
	nop			;b7d2	00 	. 
	nop			;b7d3	00 	. 
	nop			;b7d4	00 	. 
	nop			;b7d5	00 	. 
	nop			;b7d6	00 	. 
	nop			;b7d7	00 	. 
	nop			;b7d8	00 	. 
	nop			;b7d9	00 	. 
	nop			;b7da	00 	. 
	nop			;b7db	00 	. 
	nop			;b7dc	00 	. 
	nop			;b7dd	00 	. 
	nop			;b7de	00 	. 
	nop			;b7df	00 	. 
	nop			;b7e0	00 	. 
	nop			;b7e1	00 	. 
	nop			;b7e2	00 	. 
	nop			;b7e3	00 	. 
	nop			;b7e4	00 	. 
	nop			;b7e5	00 	. 
	nop			;b7e6	00 	. 
	nop			;b7e7	00 	. 
	nop			;b7e8	00 	. 
	nop			;b7e9	00 	. 
	nop			;b7ea	00 	. 
	nop			;b7eb	00 	. 
	nop			;b7ec	00 	. 
	nop			;b7ed	00 	. 
	nop			;b7ee	00 	. 
	nop			;b7ef	00 	. 
	nop			;b7f0	00 	. 
	nop			;b7f1	00 	. 
	nop			;b7f2	00 	. 
	nop			;b7f3	00 	. 
	nop			;b7f4	00 	. 
	nop			;b7f5	00 	. 
	nop			;b7f6	00 	. 
	nop			;b7f7	00 	. 
	nop			;b7f8	00 	. 
	nop			;b7f9	00 	. 
	nop			;b7fa	00 	. 
	nop			;b7fb	00 	. 
	nop			;b7fc	00 	. 
	nop			;b7fd	00 	. 
	nop			;b7fe	00 	. 
	nop			;b7ff	00 	. 
	nop			;b800	00 	. 
	nop			;b801	00 	. 
	nop			;b802	00 	. 
	nop			;b803	00 	. 
	nop			;b804	00 	. 
	nop			;b805	00 	. 
	nop			;b806	00 	. 
	nop			;b807	00 	. 
	nop			;b808	00 	. 
	nop			;b809	00 	. 
	nop			;b80a	00 	. 
	nop			;b80b	00 	. 
	nop			;b80c	00 	. 
	nop			;b80d	00 	. 
	nop			;b80e	00 	. 
	nop			;b80f	00 	. 
	nop			;b810	00 	. 
	nop			;b811	00 	. 
	nop			;b812	00 	. 
	nop			;b813	00 	. 
	nop			;b814	00 	. 
	nop			;b815	00 	. 
	nop			;b816	00 	. 
	nop			;b817	00 	. 
	nop			;b818	00 	. 
	nop			;b819	00 	. 
	nop			;b81a	00 	. 
	nop			;b81b	00 	. 
	nop			;b81c	00 	. 
	nop			;b81d	00 	. 
	nop			;b81e	00 	. 
	nop			;b81f	00 	. 
	nop			;b820	00 	. 
	nop			;b821	00 	. 
	nop			;b822	00 	. 
	nop			;b823	00 	. 
	nop			;b824	00 	. 
	nop			;b825	00 	. 
	nop			;b826	00 	. 
	nop			;b827	00 	. 
	nop			;b828	00 	. 
	nop			;b829	00 	. 
	nop			;b82a	00 	. 
	nop			;b82b	00 	. 
	nop			;b82c	00 	. 
	nop			;b82d	00 	. 
	nop			;b82e	00 	. 
	nop			;b82f	00 	. 
	nop			;b830	00 	. 
	nop			;b831	00 	. 
	nop			;b832	00 	. 
	nop			;b833	00 	. 
	nop			;b834	00 	. 
	nop			;b835	00 	. 
	nop			;b836	00 	. 
	nop			;b837	00 	. 
	nop			;b838	00 	. 
	nop			;b839	00 	. 
	nop			;b83a	00 	. 
	nop			;b83b	00 	. 
	nop			;b83c	00 	. 
	nop			;b83d	00 	. 
	nop			;b83e	00 	. 
	nop			;b83f	00 	. 
	nop			;b840	00 	. 
	nop			;b841	00 	. 
	nop			;b842	00 	. 
	nop			;b843	00 	. 
	nop			;b844	00 	. 
	nop			;b845	00 	. 
	nop			;b846	00 	. 
	nop			;b847	00 	. 
	nop			;b848	00 	. 
	nop			;b849	00 	. 
	nop			;b84a	00 	. 
	nop			;b84b	00 	. 
	nop			;b84c	00 	. 
	nop			;b84d	00 	. 
	nop			;b84e	00 	. 
	nop			;b84f	00 	. 
	nop			;b850	00 	. 
	nop			;b851	00 	. 
	nop			;b852	00 	. 
	nop			;b853	00 	. 
	nop			;b854	00 	. 
	nop			;b855	00 	. 
	nop			;b856	00 	. 
	nop			;b857	00 	. 
	nop			;b858	00 	. 
	nop			;b859	00 	. 
	nop			;b85a	00 	. 
	nop			;b85b	00 	. 
	nop			;b85c	00 	. 
	nop			;b85d	00 	. 
	nop			;b85e	00 	. 
	nop			;b85f	00 	. 
	nop			;b860	00 	. 
	nop			;b861	00 	. 
	nop			;b862	00 	. 
	nop			;b863	00 	. 
	nop			;b864	00 	. 
	nop			;b865	00 	. 
	nop			;b866	00 	. 
	nop			;b867	00 	. 
	nop			;b868	00 	. 
	nop			;b869	00 	. 
	nop			;b86a	00 	. 
	nop			;b86b	00 	. 
	nop			;b86c	00 	. 
	nop			;b86d	00 	. 
	nop			;b86e	00 	. 
	nop			;b86f	00 	. 
	nop			;b870	00 	. 
	nop			;b871	00 	. 
	nop			;b872	00 	. 
	nop			;b873	00 	. 
	nop			;b874	00 	. 
	nop			;b875	00 	. 
	nop			;b876	00 	. 
	nop			;b877	00 	. 
	nop			;b878	00 	. 
	nop			;b879	00 	. 
	nop			;b87a	00 	. 
	nop			;b87b	00 	. 
	nop			;b87c	00 	. 
	nop			;b87d	00 	. 
	nop			;b87e	00 	. 
	nop			;b87f	00 	. 
	nop			;b880	00 	. 
	nop			;b881	00 	. 
	nop			;b882	00 	. 
	nop			;b883	00 	. 
	nop			;b884	00 	. 
	nop			;b885	00 	. 
	nop			;b886	00 	. 
	nop			;b887	00 	. 
	nop			;b888	00 	. 
	nop			;b889	00 	. 
	nop			;b88a	00 	. 
	nop			;b88b	00 	. 
	nop			;b88c	00 	. 
	nop			;b88d	00 	. 
	nop			;b88e	00 	. 
	nop			;b88f	00 	. 
	nop			;b890	00 	. 
	nop			;b891	00 	. 
	nop			;b892	00 	. 
	nop			;b893	00 	. 
	nop			;b894	00 	. 
	nop			;b895	00 	. 
	nop			;b896	00 	. 
	nop			;b897	00 	. 
	nop			;b898	00 	. 
	nop			;b899	00 	. 
	nop			;b89a	00 	. 
	nop			;b89b	00 	. 
	nop			;b89c	00 	. 
	nop			;b89d	00 	. 
	nop			;b89e	00 	. 
	nop			;b89f	00 	. 
	nop			;b8a0	00 	. 
	nop			;b8a1	00 	. 
	nop			;b8a2	00 	. 
	nop			;b8a3	00 	. 
	nop			;b8a4	00 	. 
	nop			;b8a5	00 	. 
	nop			;b8a6	00 	. 
	nop			;b8a7	00 	. 
	nop			;b8a8	00 	. 
	nop			;b8a9	00 	. 
	nop			;b8aa	00 	. 
	nop			;b8ab	00 	. 
	nop			;b8ac	00 	. 
	nop			;b8ad	00 	. 
	nop			;b8ae	00 	. 
	nop			;b8af	00 	. 
	nop			;b8b0	00 	. 
	nop			;b8b1	00 	. 
	nop			;b8b2	00 	. 
	nop			;b8b3	00 	. 
	nop			;b8b4	00 	. 
	nop			;b8b5	00 	. 
	nop			;b8b6	00 	. 
	nop			;b8b7	00 	. 
	nop			;b8b8	00 	. 
	nop			;b8b9	00 	. 
	nop			;b8ba	00 	. 
	nop			;b8bb	00 	. 
	nop			;b8bc	00 	. 
	nop			;b8bd	00 	. 
	nop			;b8be	00 	. 
	nop			;b8bf	00 	. 
	nop			;b8c0	00 	. 
	nop			;b8c1	00 	. 
	nop			;b8c2	00 	. 
	nop			;b8c3	00 	. 
	nop			;b8c4	00 	. 
	nop			;b8c5	00 	. 
	nop			;b8c6	00 	. 
	nop			;b8c7	00 	. 
	nop			;b8c8	00 	. 
	nop			;b8c9	00 	. 
	nop			;b8ca	00 	. 
	nop			;b8cb	00 	. 
	nop			;b8cc	00 	. 
	nop			;b8cd	00 	. 
	nop			;b8ce	00 	. 
	nop			;b8cf	00 	. 
	nop			;b8d0	00 	. 
	nop			;b8d1	00 	. 
	nop			;b8d2	00 	. 
	nop			;b8d3	00 	. 
	nop			;b8d4	00 	. 
	nop			;b8d5	00 	. 
	nop			;b8d6	00 	. 
	nop			;b8d7	00 	. 
	nop			;b8d8	00 	. 
	nop			;b8d9	00 	. 
	nop			;b8da	00 	. 
	nop			;b8db	00 	. 
	nop			;b8dc	00 	. 
	nop			;b8dd	00 	. 
	nop			;b8de	00 	. 
	nop			;b8df	00 	. 
	nop			;b8e0	00 	. 
	nop			;b8e1	00 	. 
	nop			;b8e2	00 	. 
	nop			;b8e3	00 	. 
	nop			;b8e4	00 	. 
	nop			;b8e5	00 	. 
	nop			;b8e6	00 	. 
	nop			;b8e7	00 	. 
	nop			;b8e8	00 	. 
	nop			;b8e9	00 	. 
	nop			;b8ea	00 	. 
	nop			;b8eb	00 	. 
	nop			;b8ec	00 	. 
	nop			;b8ed	00 	. 
	nop			;b8ee	00 	. 
	nop			;b8ef	00 	. 
	nop			;b8f0	00 	. 
	nop			;b8f1	00 	. 
	nop			;b8f2	00 	. 
	nop			;b8f3	00 	. 
	nop			;b8f4	00 	. 
	nop			;b8f5	00 	. 
	nop			;b8f6	00 	. 
	nop			;b8f7	00 	. 
	nop			;b8f8	00 	. 
	nop			;b8f9	00 	. 
	nop			;b8fa	00 	. 
	nop			;b8fb	00 	. 
	nop			;b8fc	00 	. 
	nop			;b8fd	00 	. 
	nop			;b8fe	00 	. 
	nop			;b8ff	00 	. 
	nop			;b900	00 	. 
	nop			;b901	00 	. 
	nop			;b902	00 	. 
	nop			;b903	00 	. 
	nop			;b904	00 	. 
	nop			;b905	00 	. 
	nop			;b906	00 	. 
	nop			;b907	00 	. 
	nop			;b908	00 	. 
	nop			;b909	00 	. 
	nop			;b90a	00 	. 
	nop			;b90b	00 	. 
	nop			;b90c	00 	. 
	nop			;b90d	00 	. 
	nop			;b90e	00 	. 
	nop			;b90f	00 	. 
	nop			;b910	00 	. 
	nop			;b911	00 	. 
	nop			;b912	00 	. 
	nop			;b913	00 	. 
	nop			;b914	00 	. 
	nop			;b915	00 	. 
	nop			;b916	00 	. 
	nop			;b917	00 	. 
	nop			;b918	00 	. 
	nop			;b919	00 	. 
	nop			;b91a	00 	. 
	nop			;b91b	00 	. 
	nop			;b91c	00 	. 
	nop			;b91d	00 	. 
	nop			;b91e	00 	. 
	nop			;b91f	00 	. 
	nop			;b920	00 	. 
	nop			;b921	00 	. 
	nop			;b922	00 	. 
	nop			;b923	00 	. 
	nop			;b924	00 	. 
	nop			;b925	00 	. 
	nop			;b926	00 	. 
	nop			;b927	00 	. 
	nop			;b928	00 	. 
	nop			;b929	00 	. 
	nop			;b92a	00 	. 
	nop			;b92b	00 	. 
	nop			;b92c	00 	. 
	nop			;b92d	00 	. 
	nop			;b92e	00 	. 
	nop			;b92f	00 	. 
	nop			;b930	00 	. 
	nop			;b931	00 	. 
	nop			;b932	00 	. 
	nop			;b933	00 	. 
	nop			;b934	00 	. 
	nop			;b935	00 	. 
	nop			;b936	00 	. 
	nop			;b937	00 	. 
	nop			;b938	00 	. 
	nop			;b939	00 	. 
	nop			;b93a	00 	. 
	nop			;b93b	00 	. 
	nop			;b93c	00 	. 
	nop			;b93d	00 	. 
	nop			;b93e	00 	. 
	nop			;b93f	00 	. 
	nop			;b940	00 	. 
	nop			;b941	00 	. 
	nop			;b942	00 	. 
	nop			;b943	00 	. 
	nop			;b944	00 	. 
	nop			;b945	00 	. 
	nop			;b946	00 	. 
	nop			;b947	00 	. 
	nop			;b948	00 	. 
	nop			;b949	00 	. 
	nop			;b94a	00 	. 
	nop			;b94b	00 	. 
	nop			;b94c	00 	. 
	nop			;b94d	00 	. 
	nop			;b94e	00 	. 
	nop			;b94f	00 	. 
	nop			;b950	00 	. 
	nop			;b951	00 	. 
	nop			;b952	00 	. 
	nop			;b953	00 	. 
	nop			;b954	00 	. 
	nop			;b955	00 	. 
	nop			;b956	00 	. 
	nop			;b957	00 	. 
	nop			;b958	00 	. 
	nop			;b959	00 	. 
	nop			;b95a	00 	. 
	nop			;b95b	00 	. 
	nop			;b95c	00 	. 
	nop			;b95d	00 	. 
	nop			;b95e	00 	. 
	nop			;b95f	00 	. 
	nop			;b960	00 	. 
	nop			;b961	00 	. 
	nop			;b962	00 	. 
	nop			;b963	00 	. 
	nop			;b964	00 	. 
	nop			;b965	00 	. 
	nop			;b966	00 	. 
	nop			;b967	00 	. 
	nop			;b968	00 	. 
	nop			;b969	00 	. 
	nop			;b96a	00 	. 
	nop			;b96b	00 	. 
	nop			;b96c	00 	. 
	nop			;b96d	00 	. 
	nop			;b96e	00 	. 
	nop			;b96f	00 	. 
	nop			;b970	00 	. 
	nop			;b971	00 	. 
	nop			;b972	00 	. 
	nop			;b973	00 	. 
	nop			;b974	00 	. 
	nop			;b975	00 	. 
	nop			;b976	00 	. 
	nop			;b977	00 	. 
	nop			;b978	00 	. 
	nop			;b979	00 	. 
	nop			;b97a	00 	. 
	nop			;b97b	00 	. 
	nop			;b97c	00 	. 
	nop			;b97d	00 	. 
	nop			;b97e	00 	. 
	nop			;b97f	00 	. 
	nop			;b980	00 	. 
	nop			;b981	00 	. 
	nop			;b982	00 	. 
	nop			;b983	00 	. 
	nop			;b984	00 	. 
	nop			;b985	00 	. 
	nop			;b986	00 	. 
	nop			;b987	00 	. 
	nop			;b988	00 	. 
	nop			;b989	00 	. 
	nop			;b98a	00 	. 
	nop			;b98b	00 	. 
	nop			;b98c	00 	. 
	nop			;b98d	00 	. 
	nop			;b98e	00 	. 
	nop			;b98f	00 	. 
	nop			;b990	00 	. 
	nop			;b991	00 	. 
	nop			;b992	00 	. 
	nop			;b993	00 	. 
	nop			;b994	00 	. 
	nop			;b995	00 	. 
	nop			;b996	00 	. 
	nop			;b997	00 	. 
	nop			;b998	00 	. 
	nop			;b999	00 	. 
	nop			;b99a	00 	. 
	nop			;b99b	00 	. 
	nop			;b99c	00 	. 
	nop			;b99d	00 	. 
	nop			;b99e	00 	. 
	nop			;b99f	00 	. 
	nop			;b9a0	00 	. 
	nop			;b9a1	00 	. 
	nop			;b9a2	00 	. 
	nop			;b9a3	00 	. 
	nop			;b9a4	00 	. 
	nop			;b9a5	00 	. 
	nop			;b9a6	00 	. 
	nop			;b9a7	00 	. 
	nop			;b9a8	00 	. 
	nop			;b9a9	00 	. 
	nop			;b9aa	00 	. 
	nop			;b9ab	00 	. 
	nop			;b9ac	00 	. 
	nop			;b9ad	00 	. 
	nop			;b9ae	00 	. 
	nop			;b9af	00 	. 
	nop			;b9b0	00 	. 
	nop			;b9b1	00 	. 
	nop			;b9b2	00 	. 
	nop			;b9b3	00 	. 
	nop			;b9b4	00 	. 
	nop			;b9b5	00 	. 
	nop			;b9b6	00 	. 
	nop			;b9b7	00 	. 
	nop			;b9b8	00 	. 
	nop			;b9b9	00 	. 
	nop			;b9ba	00 	. 
	nop			;b9bb	00 	. 
	nop			;b9bc	00 	. 
	nop			;b9bd	00 	. 
	nop			;b9be	00 	. 
	nop			;b9bf	00 	. 
	nop			;b9c0	00 	. 
	nop			;b9c1	00 	. 
	nop			;b9c2	00 	. 
	nop			;b9c3	00 	. 
	nop			;b9c4	00 	. 
	nop			;b9c5	00 	. 
	nop			;b9c6	00 	. 
	nop			;b9c7	00 	. 
	nop			;b9c8	00 	. 
	nop			;b9c9	00 	. 
	nop			;b9ca	00 	. 
	nop			;b9cb	00 	. 
	nop			;b9cc	00 	. 
	nop			;b9cd	00 	. 
	nop			;b9ce	00 	. 
	nop			;b9cf	00 	. 
	nop			;b9d0	00 	. 
	nop			;b9d1	00 	. 
	nop			;b9d2	00 	. 
	nop			;b9d3	00 	. 
	nop			;b9d4	00 	. 
	nop			;b9d5	00 	. 
	nop			;b9d6	00 	. 
	nop			;b9d7	00 	. 
	nop			;b9d8	00 	. 
	nop			;b9d9	00 	. 
	nop			;b9da	00 	. 
	nop			;b9db	00 	. 
	nop			;b9dc	00 	. 
	nop			;b9dd	00 	. 
	nop			;b9de	00 	. 
	nop			;b9df	00 	. 
	nop			;b9e0	00 	. 
	nop			;b9e1	00 	. 
	nop			;b9e2	00 	. 
	nop			;b9e3	00 	. 
	nop			;b9e4	00 	. 
	nop			;b9e5	00 	. 
	nop			;b9e6	00 	. 
	nop			;b9e7	00 	. 
	nop			;b9e8	00 	. 
	nop			;b9e9	00 	. 
	nop			;b9ea	00 	. 
	nop			;b9eb	00 	. 
	nop			;b9ec	00 	. 
	nop			;b9ed	00 	. 
	nop			;b9ee	00 	. 
	nop			;b9ef	00 	. 
	nop			;b9f0	00 	. 
	nop			;b9f1	00 	. 
	nop			;b9f2	00 	. 
	nop			;b9f3	00 	. 
	nop			;b9f4	00 	. 
	nop			;b9f5	00 	. 
	nop			;b9f6	00 	. 
	nop			;b9f7	00 	. 
	nop			;b9f8	00 	. 
	nop			;b9f9	00 	. 
	nop			;b9fa	00 	. 
	nop			;b9fb	00 	. 
	nop			;b9fc	00 	. 
	nop			;b9fd	00 	. 
	nop			;b9fe	00 	. 
	nop			;b9ff	00 	. 
	nop			;ba00	00 	. 
	nop			;ba01	00 	. 
	nop			;ba02	00 	. 
	nop			;ba03	00 	. 
	nop			;ba04	00 	. 
	nop			;ba05	00 	. 
	nop			;ba06	00 	. 
	nop			;ba07	00 	. 
	nop			;ba08	00 	. 
	nop			;ba09	00 	. 
	nop			;ba0a	00 	. 
	nop			;ba0b	00 	. 
	nop			;ba0c	00 	. 
	nop			;ba0d	00 	. 
	nop			;ba0e	00 	. 
	nop			;ba0f	00 	. 
	nop			;ba10	00 	. 
	nop			;ba11	00 	. 
	nop			;ba12	00 	. 
	nop			;ba13	00 	. 
	nop			;ba14	00 	. 
	nop			;ba15	00 	. 
	nop			;ba16	00 	. 
	nop			;ba17	00 	. 
	nop			;ba18	00 	. 
	nop			;ba19	00 	. 
	nop			;ba1a	00 	. 
	nop			;ba1b	00 	. 
	nop			;ba1c	00 	. 
	nop			;ba1d	00 	. 
	nop			;ba1e	00 	. 
	nop			;ba1f	00 	. 
	nop			;ba20	00 	. 
	nop			;ba21	00 	. 
	nop			;ba22	00 	. 
	nop			;ba23	00 	. 
	nop			;ba24	00 	. 
	nop			;ba25	00 	. 
	nop			;ba26	00 	. 
	nop			;ba27	00 	. 
	nop			;ba28	00 	. 
	nop			;ba29	00 	. 
	nop			;ba2a	00 	. 
	nop			;ba2b	00 	. 
	nop			;ba2c	00 	. 
	nop			;ba2d	00 	. 
	nop			;ba2e	00 	. 
	nop			;ba2f	00 	. 
	nop			;ba30	00 	. 
	nop			;ba31	00 	. 
	nop			;ba32	00 	. 
	nop			;ba33	00 	. 
	nop			;ba34	00 	. 
	nop			;ba35	00 	. 
	nop			;ba36	00 	. 
	nop			;ba37	00 	. 
	nop			;ba38	00 	. 
	nop			;ba39	00 	. 
	nop			;ba3a	00 	. 
	nop			;ba3b	00 	. 
	nop			;ba3c	00 	. 
	nop			;ba3d	00 	. 
	nop			;ba3e	00 	. 
	nop			;ba3f	00 	. 
	nop			;ba40	00 	. 
	nop			;ba41	00 	. 
	nop			;ba42	00 	. 
	nop			;ba43	00 	. 
	nop			;ba44	00 	. 
	nop			;ba45	00 	. 
	nop			;ba46	00 	. 
	nop			;ba47	00 	. 
	nop			;ba48	00 	. 
	nop			;ba49	00 	. 
	nop			;ba4a	00 	. 
	nop			;ba4b	00 	. 
	nop			;ba4c	00 	. 
	nop			;ba4d	00 	. 
	nop			;ba4e	00 	. 
	nop			;ba4f	00 	. 
	nop			;ba50	00 	. 
	nop			;ba51	00 	. 
	nop			;ba52	00 	. 
	nop			;ba53	00 	. 
	nop			;ba54	00 	. 
	nop			;ba55	00 	. 
	nop			;ba56	00 	. 
	nop			;ba57	00 	. 
	nop			;ba58	00 	. 
	nop			;ba59	00 	. 
	nop			;ba5a	00 	. 
	nop			;ba5b	00 	. 
	nop			;ba5c	00 	. 
	nop			;ba5d	00 	. 
	nop			;ba5e	00 	. 
	nop			;ba5f	00 	. 
	nop			;ba60	00 	. 
	nop			;ba61	00 	. 
	nop			;ba62	00 	. 
	nop			;ba63	00 	. 
	nop			;ba64	00 	. 
	nop			;ba65	00 	. 
	nop			;ba66	00 	. 
	nop			;ba67	00 	. 
	nop			;ba68	00 	. 
	nop			;ba69	00 	. 
	nop			;ba6a	00 	. 
	nop			;ba6b	00 	. 
	nop			;ba6c	00 	. 
	nop			;ba6d	00 	. 
	nop			;ba6e	00 	. 
	nop			;ba6f	00 	. 
	nop			;ba70	00 	. 
	nop			;ba71	00 	. 
	nop			;ba72	00 	. 
	nop			;ba73	00 	. 
	nop			;ba74	00 	. 
	nop			;ba75	00 	. 
	nop			;ba76	00 	. 
	nop			;ba77	00 	. 
	nop			;ba78	00 	. 
	nop			;ba79	00 	. 
	nop			;ba7a	00 	. 
	nop			;ba7b	00 	. 
	nop			;ba7c	00 	. 
	nop			;ba7d	00 	. 
	nop			;ba7e	00 	. 
	nop			;ba7f	00 	. 
	nop			;ba80	00 	. 
	nop			;ba81	00 	. 
	nop			;ba82	00 	. 
	nop			;ba83	00 	. 
	nop			;ba84	00 	. 
	nop			;ba85	00 	. 
	nop			;ba86	00 	. 
	nop			;ba87	00 	. 
	nop			;ba88	00 	. 
	nop			;ba89	00 	. 
	nop			;ba8a	00 	. 
	nop			;ba8b	00 	. 
	nop			;ba8c	00 	. 
	nop			;ba8d	00 	. 
	nop			;ba8e	00 	. 
	nop			;ba8f	00 	. 
	nop			;ba90	00 	. 
	nop			;ba91	00 	. 
	nop			;ba92	00 	. 
	nop			;ba93	00 	. 
	nop			;ba94	00 	. 
	nop			;ba95	00 	. 
	nop			;ba96	00 	. 
	nop			;ba97	00 	. 
	nop			;ba98	00 	. 
	nop			;ba99	00 	. 
	nop			;ba9a	00 	. 
	nop			;ba9b	00 	. 
	nop			;ba9c	00 	. 
	nop			;ba9d	00 	. 
	nop			;ba9e	00 	. 
	nop			;ba9f	00 	. 
	nop			;baa0	00 	. 
	nop			;baa1	00 	. 
	nop			;baa2	00 	. 
	nop			;baa3	00 	. 
	nop			;baa4	00 	. 
	nop			;baa5	00 	. 
	nop			;baa6	00 	. 
	nop			;baa7	00 	. 
	nop			;baa8	00 	. 
	nop			;baa9	00 	. 
	nop			;baaa	00 	. 
	nop			;baab	00 	. 
	nop			;baac	00 	. 
	nop			;baad	00 	. 
	nop			;baae	00 	. 
	nop			;baaf	00 	. 
	nop			;bab0	00 	. 
	nop			;bab1	00 	. 
	nop			;bab2	00 	. 
	nop			;bab3	00 	. 
	nop			;bab4	00 	. 
	nop			;bab5	00 	. 
	nop			;bab6	00 	. 
	nop			;bab7	00 	. 
	nop			;bab8	00 	. 
	nop			;bab9	00 	. 
	nop			;baba	00 	. 
	nop			;babb	00 	. 
	nop			;babc	00 	. 
	nop			;babd	00 	. 
	nop			;babe	00 	. 
	nop			;babf	00 	. 
	nop			;bac0	00 	. 
	nop			;bac1	00 	. 
	nop			;bac2	00 	. 
	nop			;bac3	00 	. 
	nop			;bac4	00 	. 
	nop			;bac5	00 	. 
	nop			;bac6	00 	. 
	nop			;bac7	00 	. 
	nop			;bac8	00 	. 
	nop			;bac9	00 	. 
	nop			;baca	00 	. 
	nop			;bacb	00 	. 
	nop			;bacc	00 	. 
	nop			;bacd	00 	. 
	nop			;bace	00 	. 
	nop			;bacf	00 	. 
	nop			;bad0	00 	. 
	nop			;bad1	00 	. 
	nop			;bad2	00 	. 
	nop			;bad3	00 	. 
	nop			;bad4	00 	. 
	nop			;bad5	00 	. 
	nop			;bad6	00 	. 
	nop			;bad7	00 	. 
	nop			;bad8	00 	. 
	nop			;bad9	00 	. 
	nop			;bada	00 	. 
	nop			;badb	00 	. 
	nop			;badc	00 	. 
	nop			;badd	00 	. 
	nop			;bade	00 	. 
	nop			;badf	00 	. 
	nop			;bae0	00 	. 
	nop			;bae1	00 	. 
	nop			;bae2	00 	. 
	nop			;bae3	00 	. 
	nop			;bae4	00 	. 
	nop			;bae5	00 	. 
	nop			;bae6	00 	. 
	nop			;bae7	00 	. 
	nop			;bae8	00 	. 
	nop			;bae9	00 	. 
	nop			;baea	00 	. 
	nop			;baeb	00 	. 
	nop			;baec	00 	. 
	nop			;baed	00 	. 
	nop			;baee	00 	. 
	nop			;baef	00 	. 
	nop			;baf0	00 	. 
	nop			;baf1	00 	. 
	nop			;baf2	00 	. 
	nop			;baf3	00 	. 
	nop			;baf4	00 	. 
	nop			;baf5	00 	. 
	nop			;baf6	00 	. 
	nop			;baf7	00 	. 
	nop			;baf8	00 	. 
	nop			;baf9	00 	. 
	nop			;bafa	00 	. 
	nop			;bafb	00 	. 
	nop			;bafc	00 	. 
	nop			;bafd	00 	. 
	nop			;bafe	00 	. 
	nop			;baff	00 	. 
	nop			;bb00	00 	. 
	nop			;bb01	00 	. 
	nop			;bb02	00 	. 
	nop			;bb03	00 	. 
	nop			;bb04	00 	. 
	nop			;bb05	00 	. 
	nop			;bb06	00 	. 
	nop			;bb07	00 	. 
	nop			;bb08	00 	. 
	nop			;bb09	00 	. 
	nop			;bb0a	00 	. 
	nop			;bb0b	00 	. 
	nop			;bb0c	00 	. 
	nop			;bb0d	00 	. 
	nop			;bb0e	00 	. 
	nop			;bb0f	00 	. 
	nop			;bb10	00 	. 
	nop			;bb11	00 	. 
	nop			;bb12	00 	. 
	nop			;bb13	00 	. 
	nop			;bb14	00 	. 
	nop			;bb15	00 	. 
	nop			;bb16	00 	. 
	nop			;bb17	00 	. 
	nop			;bb18	00 	. 
	nop			;bb19	00 	. 
	nop			;bb1a	00 	. 
	nop			;bb1b	00 	. 
	nop			;bb1c	00 	. 
	nop			;bb1d	00 	. 
	nop			;bb1e	00 	. 
	nop			;bb1f	00 	. 
	nop			;bb20	00 	. 
	nop			;bb21	00 	. 
	nop			;bb22	00 	. 
	nop			;bb23	00 	. 
	nop			;bb24	00 	. 
	nop			;bb25	00 	. 
	nop			;bb26	00 	. 
	nop			;bb27	00 	. 
	nop			;bb28	00 	. 
	nop			;bb29	00 	. 
	nop			;bb2a	00 	. 
	nop			;bb2b	00 	. 
	nop			;bb2c	00 	. 
	nop			;bb2d	00 	. 
	nop			;bb2e	00 	. 
	nop			;bb2f	00 	. 
	nop			;bb30	00 	. 
	nop			;bb31	00 	. 
	nop			;bb32	00 	. 
	nop			;bb33	00 	. 
	nop			;bb34	00 	. 
	nop			;bb35	00 	. 
	nop			;bb36	00 	. 
	nop			;bb37	00 	. 
	nop			;bb38	00 	. 
	nop			;bb39	00 	. 
	nop			;bb3a	00 	. 
	nop			;bb3b	00 	. 
	nop			;bb3c	00 	. 
	nop			;bb3d	00 	. 
	nop			;bb3e	00 	. 
	nop			;bb3f	00 	. 
	nop			;bb40	00 	. 
	nop			;bb41	00 	. 
	nop			;bb42	00 	. 
	nop			;bb43	00 	. 
	nop			;bb44	00 	. 
	nop			;bb45	00 	. 
	nop			;bb46	00 	. 
	nop			;bb47	00 	. 
	nop			;bb48	00 	. 
	nop			;bb49	00 	. 
	nop			;bb4a	00 	. 
	nop			;bb4b	00 	. 
	nop			;bb4c	00 	. 
	nop			;bb4d	00 	. 
	nop			;bb4e	00 	. 
	nop			;bb4f	00 	. 
	nop			;bb50	00 	. 
	nop			;bb51	00 	. 
	nop			;bb52	00 	. 
	nop			;bb53	00 	. 
	nop			;bb54	00 	. 
	nop			;bb55	00 	. 
	nop			;bb56	00 	. 
	nop			;bb57	00 	. 
	nop			;bb58	00 	. 
	nop			;bb59	00 	. 
	nop			;bb5a	00 	. 
	nop			;bb5b	00 	. 
	nop			;bb5c	00 	. 
	nop			;bb5d	00 	. 
	nop			;bb5e	00 	. 
	nop			;bb5f	00 	. 
	nop			;bb60	00 	. 
	nop			;bb61	00 	. 
	nop			;bb62	00 	. 
	nop			;bb63	00 	. 
	nop			;bb64	00 	. 
	nop			;bb65	00 	. 
	nop			;bb66	00 	. 
	nop			;bb67	00 	. 
	nop			;bb68	00 	. 
	nop			;bb69	00 	. 
	nop			;bb6a	00 	. 
	nop			;bb6b	00 	. 
	nop			;bb6c	00 	. 
	nop			;bb6d	00 	. 
	nop			;bb6e	00 	. 
	nop			;bb6f	00 	. 
	nop			;bb70	00 	. 
	nop			;bb71	00 	. 
	nop			;bb72	00 	. 
	nop			;bb73	00 	. 
	nop			;bb74	00 	. 
	nop			;bb75	00 	. 
	nop			;bb76	00 	. 
	nop			;bb77	00 	. 
	nop			;bb78	00 	. 
	nop			;bb79	00 	. 
	nop			;bb7a	00 	. 
	nop			;bb7b	00 	. 
	nop			;bb7c	00 	. 
	nop			;bb7d	00 	. 
	nop			;bb7e	00 	. 
	nop			;bb7f	00 	. 
	nop			;bb80	00 	. 
	nop			;bb81	00 	. 
	nop			;bb82	00 	. 
	nop			;bb83	00 	. 
	nop			;bb84	00 	. 
	nop			;bb85	00 	. 
	nop			;bb86	00 	. 
	nop			;bb87	00 	. 
	nop			;bb88	00 	. 
	nop			;bb89	00 	. 
	nop			;bb8a	00 	. 
	nop			;bb8b	00 	. 
	nop			;bb8c	00 	. 
	nop			;bb8d	00 	. 
	nop			;bb8e	00 	. 
	nop			;bb8f	00 	. 
	nop			;bb90	00 	. 
	nop			;bb91	00 	. 
	nop			;bb92	00 	. 
	nop			;bb93	00 	. 
	nop			;bb94	00 	. 
	nop			;bb95	00 	. 
	nop			;bb96	00 	. 
	nop			;bb97	00 	. 
	nop			;bb98	00 	. 
	nop			;bb99	00 	. 
	nop			;bb9a	00 	. 
	nop			;bb9b	00 	. 
	nop			;bb9c	00 	. 
	nop			;bb9d	00 	. 
	nop			;bb9e	00 	. 
	nop			;bb9f	00 	. 
	nop			;bba0	00 	. 
	nop			;bba1	00 	. 
	nop			;bba2	00 	. 
	nop			;bba3	00 	. 
	nop			;bba4	00 	. 
	nop			;bba5	00 	. 
	nop			;bba6	00 	. 
	nop			;bba7	00 	. 
	nop			;bba8	00 	. 
	nop			;bba9	00 	. 
	nop			;bbaa	00 	. 
	nop			;bbab	00 	. 
	nop			;bbac	00 	. 
	nop			;bbad	00 	. 
	nop			;bbae	00 	. 
	nop			;bbaf	00 	. 
	nop			;bbb0	00 	. 
	nop			;bbb1	00 	. 
	nop			;bbb2	00 	. 
	nop			;bbb3	00 	. 
	nop			;bbb4	00 	. 
	nop			;bbb5	00 	. 
	nop			;bbb6	00 	. 
	nop			;bbb7	00 	. 
	nop			;bbb8	00 	. 
	nop			;bbb9	00 	. 
	nop			;bbba	00 	. 
	nop			;bbbb	00 	. 
	nop			;bbbc	00 	. 
	nop			;bbbd	00 	. 
	nop			;bbbe	00 	. 
	nop			;bbbf	00 	. 
	nop			;bbc0	00 	. 
	nop			;bbc1	00 	. 
	nop			;bbc2	00 	. 
	nop			;bbc3	00 	. 
	nop			;bbc4	00 	. 
	nop			;bbc5	00 	. 
	nop			;bbc6	00 	. 
	nop			;bbc7	00 	. 
	nop			;bbc8	00 	. 
	nop			;bbc9	00 	. 
	nop			;bbca	00 	. 
	nop			;bbcb	00 	. 
	nop			;bbcc	00 	. 
	nop			;bbcd	00 	. 
	nop			;bbce	00 	. 
	nop			;bbcf	00 	. 
	nop			;bbd0	00 	. 
	nop			;bbd1	00 	. 
	nop			;bbd2	00 	. 
	nop			;bbd3	00 	. 
	nop			;bbd4	00 	. 
	nop			;bbd5	00 	. 
	nop			;bbd6	00 	. 
	nop			;bbd7	00 	. 
	nop			;bbd8	00 	. 
	nop			;bbd9	00 	. 
	nop			;bbda	00 	. 
	nop			;bbdb	00 	. 
	nop			;bbdc	00 	. 
	nop			;bbdd	00 	. 
	nop			;bbde	00 	. 
	nop			;bbdf	00 	. 
	nop			;bbe0	00 	. 
	nop			;bbe1	00 	. 
	nop			;bbe2	00 	. 
	nop			;bbe3	00 	. 
	nop			;bbe4	00 	. 
	nop			;bbe5	00 	. 
	nop			;bbe6	00 	. 
	nop			;bbe7	00 	. 
	nop			;bbe8	00 	. 
	nop			;bbe9	00 	. 
	nop			;bbea	00 	. 
	nop			;bbeb	00 	. 
	nop			;bbec	00 	. 
	nop			;bbed	00 	. 
	nop			;bbee	00 	. 
	nop			;bbef	00 	. 
	nop			;bbf0	00 	. 
	nop			;bbf1	00 	. 
	nop			;bbf2	00 	. 
	nop			;bbf3	00 	. 
	nop			;bbf4	00 	. 
	nop			;bbf5	00 	. 
	nop			;bbf6	00 	. 
	nop			;bbf7	00 	. 
	nop			;bbf8	00 	. 
	nop			;bbf9	00 	. 
	nop			;bbfa	00 	. 
	nop			;bbfb	00 	. 
	nop			;bbfc	00 	. 
	nop			;bbfd	00 	. 
	nop			;bbfe	00 	. 
	nop			;bbff	00 	. 
	nop			;bc00	00 	. 
	nop			;bc01	00 	. 
	nop			;bc02	00 	. 
	nop			;bc03	00 	. 
	nop			;bc04	00 	. 
	nop			;bc05	00 	. 
	nop			;bc06	00 	. 
	nop			;bc07	00 	. 
	nop			;bc08	00 	. 
	nop			;bc09	00 	. 
	nop			;bc0a	00 	. 
	nop			;bc0b	00 	. 
	nop			;bc0c	00 	. 
	nop			;bc0d	00 	. 
	nop			;bc0e	00 	. 
	nop			;bc0f	00 	. 
	nop			;bc10	00 	. 
	nop			;bc11	00 	. 
	nop			;bc12	00 	. 
	nop			;bc13	00 	. 
	nop			;bc14	00 	. 
	nop			;bc15	00 	. 
	nop			;bc16	00 	. 
	nop			;bc17	00 	. 
	nop			;bc18	00 	. 
	nop			;bc19	00 	. 
	nop			;bc1a	00 	. 
	nop			;bc1b	00 	. 
	nop			;bc1c	00 	. 
	nop			;bc1d	00 	. 
	nop			;bc1e	00 	. 
	nop			;bc1f	00 	. 
	nop			;bc20	00 	. 
	nop			;bc21	00 	. 
	nop			;bc22	00 	. 
	nop			;bc23	00 	. 
	nop			;bc24	00 	. 
	nop			;bc25	00 	. 
	nop			;bc26	00 	. 
	nop			;bc27	00 	. 
	nop			;bc28	00 	. 
	nop			;bc29	00 	. 
	nop			;bc2a	00 	. 
	nop			;bc2b	00 	. 
	nop			;bc2c	00 	. 
	nop			;bc2d	00 	. 
	nop			;bc2e	00 	. 
	nop			;bc2f	00 	. 
	nop			;bc30	00 	. 
	nop			;bc31	00 	. 
	nop			;bc32	00 	. 
	nop			;bc33	00 	. 
	nop			;bc34	00 	. 
	nop			;bc35	00 	. 
	nop			;bc36	00 	. 
	nop			;bc37	00 	. 
	nop			;bc38	00 	. 
	nop			;bc39	00 	. 
	nop			;bc3a	00 	. 
	nop			;bc3b	00 	. 
	nop			;bc3c	00 	. 
	nop			;bc3d	00 	. 
	nop			;bc3e	00 	. 
	nop			;bc3f	00 	. 
	nop			;bc40	00 	. 
	nop			;bc41	00 	. 
	nop			;bc42	00 	. 
	nop			;bc43	00 	. 
	nop			;bc44	00 	. 
	nop			;bc45	00 	. 
	nop			;bc46	00 	. 
	nop			;bc47	00 	. 
	nop			;bc48	00 	. 
	nop			;bc49	00 	. 
	nop			;bc4a	00 	. 
	nop			;bc4b	00 	. 
	nop			;bc4c	00 	. 
	nop			;bc4d	00 	. 
	nop			;bc4e	00 	. 
	nop			;bc4f	00 	. 
	nop			;bc50	00 	. 
	nop			;bc51	00 	. 
	nop			;bc52	00 	. 
	nop			;bc53	00 	. 
	nop			;bc54	00 	. 
	nop			;bc55	00 	. 
	nop			;bc56	00 	. 
	nop			;bc57	00 	. 
	nop			;bc58	00 	. 
	nop			;bc59	00 	. 
	nop			;bc5a	00 	. 
	nop			;bc5b	00 	. 
	nop			;bc5c	00 	. 
	nop			;bc5d	00 	. 
	nop			;bc5e	00 	. 
	nop			;bc5f	00 	. 
	nop			;bc60	00 	. 
	nop			;bc61	00 	. 
	nop			;bc62	00 	. 
	nop			;bc63	00 	. 
	nop			;bc64	00 	. 
	nop			;bc65	00 	. 
	nop			;bc66	00 	. 
	nop			;bc67	00 	. 
	nop			;bc68	00 	. 
	nop			;bc69	00 	. 
	nop			;bc6a	00 	. 
	nop			;bc6b	00 	. 
	nop			;bc6c	00 	. 
	nop			;bc6d	00 	. 
	nop			;bc6e	00 	. 
	nop			;bc6f	00 	. 
	nop			;bc70	00 	. 
	nop			;bc71	00 	. 
	nop			;bc72	00 	. 
	nop			;bc73	00 	. 
	nop			;bc74	00 	. 
	nop			;bc75	00 	. 
	nop			;bc76	00 	. 
	nop			;bc77	00 	. 
	nop			;bc78	00 	. 
	nop			;bc79	00 	. 
	nop			;bc7a	00 	. 
	nop			;bc7b	00 	. 
	nop			;bc7c	00 	. 
	nop			;bc7d	00 	. 
	nop			;bc7e	00 	. 
	nop			;bc7f	00 	. 
	nop			;bc80	00 	. 
	nop			;bc81	00 	. 
	nop			;bc82	00 	. 
	nop			;bc83	00 	. 
	nop			;bc84	00 	. 
	nop			;bc85	00 	. 
	nop			;bc86	00 	. 
	nop			;bc87	00 	. 
	nop			;bc88	00 	. 
	nop			;bc89	00 	. 
	nop			;bc8a	00 	. 
	nop			;bc8b	00 	. 
	nop			;bc8c	00 	. 
	nop			;bc8d	00 	. 
	nop			;bc8e	00 	. 
	nop			;bc8f	00 	. 
	nop			;bc90	00 	. 
	nop			;bc91	00 	. 
	nop			;bc92	00 	. 
	nop			;bc93	00 	. 
	nop			;bc94	00 	. 
	nop			;bc95	00 	. 
	nop			;bc96	00 	. 
	nop			;bc97	00 	. 
	nop			;bc98	00 	. 
	nop			;bc99	00 	. 
	nop			;bc9a	00 	. 
	nop			;bc9b	00 	. 
	nop			;bc9c	00 	. 
	nop			;bc9d	00 	. 
	nop			;bc9e	00 	. 
	nop			;bc9f	00 	. 
	nop			;bca0	00 	. 
	nop			;bca1	00 	. 
	nop			;bca2	00 	. 
	nop			;bca3	00 	. 
	nop			;bca4	00 	. 
	nop			;bca5	00 	. 
	nop			;bca6	00 	. 
	nop			;bca7	00 	. 
	nop			;bca8	00 	. 
	nop			;bca9	00 	. 
	nop			;bcaa	00 	. 
	nop			;bcab	00 	. 
	nop			;bcac	00 	. 
	nop			;bcad	00 	. 
	nop			;bcae	00 	. 
	nop			;bcaf	00 	. 
	nop			;bcb0	00 	. 
	nop			;bcb1	00 	. 
	nop			;bcb2	00 	. 
	nop			;bcb3	00 	. 
	nop			;bcb4	00 	. 
	nop			;bcb5	00 	. 
	nop			;bcb6	00 	. 
	nop			;bcb7	00 	. 
	nop			;bcb8	00 	. 
	nop			;bcb9	00 	. 
	nop			;bcba	00 	. 
	nop			;bcbb	00 	. 
	nop			;bcbc	00 	. 
	nop			;bcbd	00 	. 
	nop			;bcbe	00 	. 
	nop			;bcbf	00 	. 
	nop			;bcc0	00 	. 
	nop			;bcc1	00 	. 
	nop			;bcc2	00 	. 
	nop			;bcc3	00 	. 
	nop			;bcc4	00 	. 
	nop			;bcc5	00 	. 
	nop			;bcc6	00 	. 
	nop			;bcc7	00 	. 
	nop			;bcc8	00 	. 
	nop			;bcc9	00 	. 
	nop			;bcca	00 	. 
	nop			;bccb	00 	. 
	nop			;bccc	00 	. 
	nop			;bccd	00 	. 
	nop			;bcce	00 	. 
	nop			;bccf	00 	. 
	nop			;bcd0	00 	. 
	nop			;bcd1	00 	. 
	nop			;bcd2	00 	. 
	nop			;bcd3	00 	. 
	nop			;bcd4	00 	. 
	nop			;bcd5	00 	. 
	nop			;bcd6	00 	. 
	nop			;bcd7	00 	. 
	nop			;bcd8	00 	. 
	nop			;bcd9	00 	. 
	nop			;bcda	00 	. 
	nop			;bcdb	00 	. 
	nop			;bcdc	00 	. 
	nop			;bcdd	00 	. 
	nop			;bcde	00 	. 
	nop			;bcdf	00 	. 
	nop			;bce0	00 	. 
	nop			;bce1	00 	. 
	nop			;bce2	00 	. 
	nop			;bce3	00 	. 
	nop			;bce4	00 	. 
	nop			;bce5	00 	. 
	nop			;bce6	00 	. 
	nop			;bce7	00 	. 
	nop			;bce8	00 	. 
	nop			;bce9	00 	. 
	nop			;bcea	00 	. 
	nop			;bceb	00 	. 
	nop			;bcec	00 	. 
	nop			;bced	00 	. 
	nop			;bcee	00 	. 
	nop			;bcef	00 	. 
	nop			;bcf0	00 	. 
	nop			;bcf1	00 	. 
	nop			;bcf2	00 	. 
	nop			;bcf3	00 	. 
	nop			;bcf4	00 	. 
	nop			;bcf5	00 	. 
	nop			;bcf6	00 	. 
	nop			;bcf7	00 	. 
	nop			;bcf8	00 	. 
	nop			;bcf9	00 	. 
	nop			;bcfa	00 	. 
	nop			;bcfb	00 	. 
	nop			;bcfc	00 	. 
	nop			;bcfd	00 	. 
	nop			;bcfe	00 	. 
	nop			;bcff	00 	. 
	nop			;bd00	00 	. 
	nop			;bd01	00 	. 
	nop			;bd02	00 	. 
	nop			;bd03	00 	. 
	nop			;bd04	00 	. 
	nop			;bd05	00 	. 
	nop			;bd06	00 	. 
	nop			;bd07	00 	. 
	nop			;bd08	00 	. 
	nop			;bd09	00 	. 
	nop			;bd0a	00 	. 
	nop			;bd0b	00 	. 
	nop			;bd0c	00 	. 
	nop			;bd0d	00 	. 
	nop			;bd0e	00 	. 
	nop			;bd0f	00 	. 
	nop			;bd10	00 	. 
	nop			;bd11	00 	. 
	nop			;bd12	00 	. 
	nop			;bd13	00 	. 
	nop			;bd14	00 	. 
	nop			;bd15	00 	. 
	nop			;bd16	00 	. 
	nop			;bd17	00 	. 
	nop			;bd18	00 	. 
	nop			;bd19	00 	. 
	nop			;bd1a	00 	. 
	nop			;bd1b	00 	. 
	nop			;bd1c	00 	. 
	nop			;bd1d	00 	. 
	nop			;bd1e	00 	. 
	nop			;bd1f	00 	. 
	nop			;bd20	00 	. 
	nop			;bd21	00 	. 
	nop			;bd22	00 	. 
	nop			;bd23	00 	. 
	nop			;bd24	00 	. 
	nop			;bd25	00 	. 
	nop			;bd26	00 	. 
	nop			;bd27	00 	. 
	nop			;bd28	00 	. 
	nop			;bd29	00 	. 
	nop			;bd2a	00 	. 
	nop			;bd2b	00 	. 
	nop			;bd2c	00 	. 
	nop			;bd2d	00 	. 
	nop			;bd2e	00 	. 
	nop			;bd2f	00 	. 
	nop			;bd30	00 	. 
	nop			;bd31	00 	. 
	nop			;bd32	00 	. 
	nop			;bd33	00 	. 
	nop			;bd34	00 	. 
	nop			;bd35	00 	. 
	nop			;bd36	00 	. 
	nop			;bd37	00 	. 
	nop			;bd38	00 	. 
	nop			;bd39	00 	. 
	nop			;bd3a	00 	. 
	nop			;bd3b	00 	. 
	nop			;bd3c	00 	. 
	nop			;bd3d	00 	. 
	nop			;bd3e	00 	. 
	nop			;bd3f	00 	. 
	nop			;bd40	00 	. 
	nop			;bd41	00 	. 
	nop			;bd42	00 	. 
	nop			;bd43	00 	. 
	nop			;bd44	00 	. 
	nop			;bd45	00 	. 
	nop			;bd46	00 	. 
	nop			;bd47	00 	. 
	nop			;bd48	00 	. 
	nop			;bd49	00 	. 
	nop			;bd4a	00 	. 
	nop			;bd4b	00 	. 
	nop			;bd4c	00 	. 
	nop			;bd4d	00 	. 
	nop			;bd4e	00 	. 
	nop			;bd4f	00 	. 
	nop			;bd50	00 	. 
	nop			;bd51	00 	. 
	nop			;bd52	00 	. 
	nop			;bd53	00 	. 
	nop			;bd54	00 	. 
	nop			;bd55	00 	. 
	nop			;bd56	00 	. 
	nop			;bd57	00 	. 
	nop			;bd58	00 	. 
	nop			;bd59	00 	. 
	nop			;bd5a	00 	. 
	nop			;bd5b	00 	. 
	nop			;bd5c	00 	. 
	nop			;bd5d	00 	. 
	nop			;bd5e	00 	. 
	nop			;bd5f	00 	. 
	nop			;bd60	00 	. 
	nop			;bd61	00 	. 
	nop			;bd62	00 	. 
	nop			;bd63	00 	. 
	nop			;bd64	00 	. 
	nop			;bd65	00 	. 
	nop			;bd66	00 	. 
	nop			;bd67	00 	. 
	nop			;bd68	00 	. 
	nop			;bd69	00 	. 
	nop			;bd6a	00 	. 
	nop			;bd6b	00 	. 
	nop			;bd6c	00 	. 
	nop			;bd6d	00 	. 
	nop			;bd6e	00 	. 
	nop			;bd6f	00 	. 
	nop			;bd70	00 	. 
	nop			;bd71	00 	. 
	nop			;bd72	00 	. 
	nop			;bd73	00 	. 
	nop			;bd74	00 	. 
	nop			;bd75	00 	. 
	nop			;bd76	00 	. 
	nop			;bd77	00 	. 
	nop			;bd78	00 	. 
	nop			;bd79	00 	. 
	nop			;bd7a	00 	. 
	nop			;bd7b	00 	. 
	nop			;bd7c	00 	. 
	nop			;bd7d	00 	. 
	nop			;bd7e	00 	. 
	nop			;bd7f	00 	. 
	nop			;bd80	00 	. 
	nop			;bd81	00 	. 
	nop			;bd82	00 	. 
	nop			;bd83	00 	. 
	nop			;bd84	00 	. 
	nop			;bd85	00 	. 
	nop			;bd86	00 	. 
	nop			;bd87	00 	. 
	nop			;bd88	00 	. 
	nop			;bd89	00 	. 
	nop			;bd8a	00 	. 
	nop			;bd8b	00 	. 
	nop			;bd8c	00 	. 
	nop			;bd8d	00 	. 
	nop			;bd8e	00 	. 
	nop			;bd8f	00 	. 
	nop			;bd90	00 	. 
	nop			;bd91	00 	. 
	nop			;bd92	00 	. 
	nop			;bd93	00 	. 
	nop			;bd94	00 	. 
	nop			;bd95	00 	. 
	nop			;bd96	00 	. 
	nop			;bd97	00 	. 
	nop			;bd98	00 	. 
	nop			;bd99	00 	. 
	nop			;bd9a	00 	. 
	nop			;bd9b	00 	. 
	nop			;bd9c	00 	. 
	nop			;bd9d	00 	. 
	nop			;bd9e	00 	. 
	nop			;bd9f	00 	. 
	nop			;bda0	00 	. 
	nop			;bda1	00 	. 
	nop			;bda2	00 	. 
	nop			;bda3	00 	. 
	nop			;bda4	00 	. 
	nop			;bda5	00 	. 
	nop			;bda6	00 	. 
	nop			;bda7	00 	. 
	nop			;bda8	00 	. 
	nop			;bda9	00 	. 
	nop			;bdaa	00 	. 
	nop			;bdab	00 	. 
	nop			;bdac	00 	. 
	nop			;bdad	00 	. 
	nop			;bdae	00 	. 
	nop			;bdaf	00 	. 
	nop			;bdb0	00 	. 
	nop			;bdb1	00 	. 
	nop			;bdb2	00 	. 
	nop			;bdb3	00 	. 
	nop			;bdb4	00 	. 
	nop			;bdb5	00 	. 
	nop			;bdb6	00 	. 
	nop			;bdb7	00 	. 
	nop			;bdb8	00 	. 
	nop			;bdb9	00 	. 
	nop			;bdba	00 	. 
	nop			;bdbb	00 	. 
	nop			;bdbc	00 	. 
	nop			;bdbd	00 	. 
	nop			;bdbe	00 	. 
	nop			;bdbf	00 	. 
	nop			;bdc0	00 	. 
	nop			;bdc1	00 	. 
	nop			;bdc2	00 	. 
	nop			;bdc3	00 	. 
	nop			;bdc4	00 	. 
	nop			;bdc5	00 	. 
	nop			;bdc6	00 	. 
	nop			;bdc7	00 	. 
	nop			;bdc8	00 	. 
	nop			;bdc9	00 	. 
	nop			;bdca	00 	. 
	nop			;bdcb	00 	. 
	nop			;bdcc	00 	. 
	nop			;bdcd	00 	. 
	nop			;bdce	00 	. 
	nop			;bdcf	00 	. 
	nop			;bdd0	00 	. 
	nop			;bdd1	00 	. 
	nop			;bdd2	00 	. 
	nop			;bdd3	00 	. 
	nop			;bdd4	00 	. 
	nop			;bdd5	00 	. 
	nop			;bdd6	00 	. 
	nop			;bdd7	00 	. 
	nop			;bdd8	00 	. 
	nop			;bdd9	00 	. 
	nop			;bdda	00 	. 
	nop			;bddb	00 	. 
	nop			;bddc	00 	. 
	nop			;bddd	00 	. 
	nop			;bdde	00 	. 
	nop			;bddf	00 	. 
	nop			;bde0	00 	. 
	nop			;bde1	00 	. 
	nop			;bde2	00 	. 
	nop			;bde3	00 	. 
	nop			;bde4	00 	. 
	nop			;bde5	00 	. 
	nop			;bde6	00 	. 
	nop			;bde7	00 	. 
	nop			;bde8	00 	. 
	nop			;bde9	00 	. 
	nop			;bdea	00 	. 
	nop			;bdeb	00 	. 
	nop			;bdec	00 	. 
	nop			;bded	00 	. 
	nop			;bdee	00 	. 
	nop			;bdef	00 	. 
	nop			;bdf0	00 	. 
	nop			;bdf1	00 	. 
	nop			;bdf2	00 	. 
	nop			;bdf3	00 	. 
	nop			;bdf4	00 	. 
	nop			;bdf5	00 	. 
	nop			;bdf6	00 	. 
	nop			;bdf7	00 	. 
	nop			;bdf8	00 	. 
	nop			;bdf9	00 	. 
	nop			;bdfa	00 	. 
	nop			;bdfb	00 	. 
	nop			;bdfc	00 	. 
	nop			;bdfd	00 	. 
	nop			;bdfe	00 	. 
	nop			;bdff	00 	. 
	nop			;be00	00 	. 
	nop			;be01	00 	. 
	nop			;be02	00 	. 
	nop			;be03	00 	. 
	nop			;be04	00 	. 
	nop			;be05	00 	. 
	nop			;be06	00 	. 
	nop			;be07	00 	. 
	nop			;be08	00 	. 
	nop			;be09	00 	. 
	nop			;be0a	00 	. 
	nop			;be0b	00 	. 
	nop			;be0c	00 	. 
	nop			;be0d	00 	. 
	nop			;be0e	00 	. 
	nop			;be0f	00 	. 
	nop			;be10	00 	. 
	nop			;be11	00 	. 
	nop			;be12	00 	. 
	nop			;be13	00 	. 
	nop			;be14	00 	. 
	nop			;be15	00 	. 
	nop			;be16	00 	. 
	nop			;be17	00 	. 
	nop			;be18	00 	. 
	nop			;be19	00 	. 
	nop			;be1a	00 	. 
	nop			;be1b	00 	. 
	nop			;be1c	00 	. 
	nop			;be1d	00 	. 
	nop			;be1e	00 	. 
	nop			;be1f	00 	. 
	nop			;be20	00 	. 
	nop			;be21	00 	. 
	nop			;be22	00 	. 
	nop			;be23	00 	. 
	nop			;be24	00 	. 
	nop			;be25	00 	. 
	nop			;be26	00 	. 
	nop			;be27	00 	. 
	nop			;be28	00 	. 
	nop			;be29	00 	. 
	nop			;be2a	00 	. 
	nop			;be2b	00 	. 
	nop			;be2c	00 	. 
	nop			;be2d	00 	. 
	nop			;be2e	00 	. 
	nop			;be2f	00 	. 
	nop			;be30	00 	. 
	nop			;be31	00 	. 
	nop			;be32	00 	. 
	nop			;be33	00 	. 
	nop			;be34	00 	. 
	nop			;be35	00 	. 
	nop			;be36	00 	. 
	nop			;be37	00 	. 
	nop			;be38	00 	. 
	nop			;be39	00 	. 
	nop			;be3a	00 	. 
	nop			;be3b	00 	. 
	nop			;be3c	00 	. 
	nop			;be3d	00 	. 
	nop			;be3e	00 	. 
	nop			;be3f	00 	. 
	nop			;be40	00 	. 
	nop			;be41	00 	. 
	nop			;be42	00 	. 
	nop			;be43	00 	. 
	nop			;be44	00 	. 
	nop			;be45	00 	. 
	nop			;be46	00 	. 
	nop			;be47	00 	. 
	nop			;be48	00 	. 
	nop			;be49	00 	. 
	nop			;be4a	00 	. 
	nop			;be4b	00 	. 
	nop			;be4c	00 	. 
	nop			;be4d	00 	. 
	nop			;be4e	00 	. 
	nop			;be4f	00 	. 
	nop			;be50	00 	. 
	nop			;be51	00 	. 
	nop			;be52	00 	. 
	nop			;be53	00 	. 
	nop			;be54	00 	. 
	nop			;be55	00 	. 
	nop			;be56	00 	. 
	nop			;be57	00 	. 
	nop			;be58	00 	. 
	nop			;be59	00 	. 
	nop			;be5a	00 	. 
	nop			;be5b	00 	. 
	nop			;be5c	00 	. 
	nop			;be5d	00 	. 
	nop			;be5e	00 	. 
	nop			;be5f	00 	. 
	nop			;be60	00 	. 
	nop			;be61	00 	. 
	nop			;be62	00 	. 
	nop			;be63	00 	. 
	nop			;be64	00 	. 
	nop			;be65	00 	. 
	nop			;be66	00 	. 
	nop			;be67	00 	. 
	nop			;be68	00 	. 
	nop			;be69	00 	. 
	nop			;be6a	00 	. 
	nop			;be6b	00 	. 
	nop			;be6c	00 	. 
	nop			;be6d	00 	. 
	nop			;be6e	00 	. 
	nop			;be6f	00 	. 
	nop			;be70	00 	. 
	nop			;be71	00 	. 
	nop			;be72	00 	. 
	nop			;be73	00 	. 
	nop			;be74	00 	. 
	nop			;be75	00 	. 
	nop			;be76	00 	. 
	nop			;be77	00 	. 
	nop			;be78	00 	. 
	nop			;be79	00 	. 
	nop			;be7a	00 	. 
	nop			;be7b	00 	. 
	nop			;be7c	00 	. 
	nop			;be7d	00 	. 
	nop			;be7e	00 	. 
	nop			;be7f	00 	. 
	nop			;be80	00 	. 
	nop			;be81	00 	. 
	nop			;be82	00 	. 
	nop			;be83	00 	. 
	nop			;be84	00 	. 
	nop			;be85	00 	. 
	nop			;be86	00 	. 
	nop			;be87	00 	. 
	nop			;be88	00 	. 
	nop			;be89	00 	. 
	nop			;be8a	00 	. 
	nop			;be8b	00 	. 
	nop			;be8c	00 	. 
	nop			;be8d	00 	. 
	nop			;be8e	00 	. 
	nop			;be8f	00 	. 
	nop			;be90	00 	. 
	nop			;be91	00 	. 
	nop			;be92	00 	. 
	nop			;be93	00 	. 
	nop			;be94	00 	. 
	nop			;be95	00 	. 
	nop			;be96	00 	. 
	nop			;be97	00 	. 
	nop			;be98	00 	. 
	nop			;be99	00 	. 
	nop			;be9a	00 	. 
	nop			;be9b	00 	. 
	nop			;be9c	00 	. 
	nop			;be9d	00 	. 
	nop			;be9e	00 	. 
	nop			;be9f	00 	. 
	nop			;bea0	00 	. 
	nop			;bea1	00 	. 
	nop			;bea2	00 	. 
	nop			;bea3	00 	. 
	nop			;bea4	00 	. 
	nop			;bea5	00 	. 
	nop			;bea6	00 	. 
	nop			;bea7	00 	. 
	nop			;bea8	00 	. 
	nop			;bea9	00 	. 
	nop			;beaa	00 	. 
	nop			;beab	00 	. 
	nop			;beac	00 	. 
	nop			;bead	00 	. 
	nop			;beae	00 	. 
	nop			;beaf	00 	. 
	nop			;beb0	00 	. 
	nop			;beb1	00 	. 
	nop			;beb2	00 	. 
	nop			;beb3	00 	. 
	nop			;beb4	00 	. 
	nop			;beb5	00 	. 
	nop			;beb6	00 	. 
	nop			;beb7	00 	. 
	nop			;beb8	00 	. 
	nop			;beb9	00 	. 
	nop			;beba	00 	. 
	nop			;bebb	00 	. 
	nop			;bebc	00 	. 
	nop			;bebd	00 	. 
	nop			;bebe	00 	. 
	nop			;bebf	00 	. 
	nop			;bec0	00 	. 
	nop			;bec1	00 	. 
	nop			;bec2	00 	. 
	nop			;bec3	00 	. 
	nop			;bec4	00 	. 
	nop			;bec5	00 	. 
	nop			;bec6	00 	. 
	nop			;bec7	00 	. 
	nop			;bec8	00 	. 
	nop			;bec9	00 	. 
	nop			;beca	00 	. 
	nop			;becb	00 	. 
	nop			;becc	00 	. 
	nop			;becd	00 	. 
	nop			;bece	00 	. 
	nop			;becf	00 	. 
	nop			;bed0	00 	. 
	nop			;bed1	00 	. 
	nop			;bed2	00 	. 
	nop			;bed3	00 	. 
	nop			;bed4	00 	. 
	nop			;bed5	00 	. 
	nop			;bed6	00 	. 
	nop			;bed7	00 	. 
	nop			;bed8	00 	. 
	nop			;bed9	00 	. 
	nop			;beda	00 	. 
	nop			;bedb	00 	. 
	nop			;bedc	00 	. 
	nop			;bedd	00 	. 
	nop			;bede	00 	. 
	nop			;bedf	00 	. 
	nop			;bee0	00 	. 
	nop			;bee1	00 	. 
	nop			;bee2	00 	. 
	nop			;bee3	00 	. 
	nop			;bee4	00 	. 
	nop			;bee5	00 	. 
	nop			;bee6	00 	. 
	nop			;bee7	00 	. 
	nop			;bee8	00 	. 
	nop			;bee9	00 	. 
	nop			;beea	00 	. 
	nop			;beeb	00 	. 
	nop			;beec	00 	. 
	nop			;beed	00 	. 
	nop			;beee	00 	. 
	nop			;beef	00 	. 
	nop			;bef0	00 	. 
	nop			;bef1	00 	. 
	nop			;bef2	00 	. 
	nop			;bef3	00 	. 
	nop			;bef4	00 	. 
	nop			;bef5	00 	. 
	nop			;bef6	00 	. 
	nop			;bef7	00 	. 
	nop			;bef8	00 	. 
	nop			;bef9	00 	. 
	nop			;befa	00 	. 
	nop			;befb	00 	. 
	nop			;befc	00 	. 
	nop			;befd	00 	. 
	nop			;befe	00 	. 
	nop			;beff	00 	. 
	nop			;bf00	00 	. 
	nop			;bf01	00 	. 
	nop			;bf02	00 	. 
	nop			;bf03	00 	. 
	nop			;bf04	00 	. 
	nop			;bf05	00 	. 
	nop			;bf06	00 	. 
	nop			;bf07	00 	. 
	nop			;bf08	00 	. 
	nop			;bf09	00 	. 
	nop			;bf0a	00 	. 
	nop			;bf0b	00 	. 
	nop			;bf0c	00 	. 
	nop			;bf0d	00 	. 
	nop			;bf0e	00 	. 
	nop			;bf0f	00 	. 
	nop			;bf10	00 	. 
	nop			;bf11	00 	. 
	nop			;bf12	00 	. 
	nop			;bf13	00 	. 
	nop			;bf14	00 	. 
	nop			;bf15	00 	. 
	nop			;bf16	00 	. 
	nop			;bf17	00 	. 
	nop			;bf18	00 	. 
	nop			;bf19	00 	. 
	nop			;bf1a	00 	. 
	nop			;bf1b	00 	. 
	nop			;bf1c	00 	. 
	nop			;bf1d	00 	. 
	nop			;bf1e	00 	. 
	nop			;bf1f	00 	. 
	nop			;bf20	00 	. 
	nop			;bf21	00 	. 
	nop			;bf22	00 	. 
	nop			;bf23	00 	. 
	nop			;bf24	00 	. 
	nop			;bf25	00 	. 
	nop			;bf26	00 	. 
	nop			;bf27	00 	. 
	nop			;bf28	00 	. 
	nop			;bf29	00 	. 
	nop			;bf2a	00 	. 
	nop			;bf2b	00 	. 
	nop			;bf2c	00 	. 
	nop			;bf2d	00 	. 
	nop			;bf2e	00 	. 
	nop			;bf2f	00 	. 
	nop			;bf30	00 	. 
	nop			;bf31	00 	. 
	nop			;bf32	00 	. 
	nop			;bf33	00 	. 
	nop			;bf34	00 	. 
	nop			;bf35	00 	. 
	nop			;bf36	00 	. 
	nop			;bf37	00 	. 
	nop			;bf38	00 	. 
	nop			;bf39	00 	. 
	nop			;bf3a	00 	. 
	nop			;bf3b	00 	. 
	nop			;bf3c	00 	. 
	nop			;bf3d	00 	. 
	nop			;bf3e	00 	. 
	nop			;bf3f	00 	. 
	nop			;bf40	00 	. 
	nop			;bf41	00 	. 
	nop			;bf42	00 	. 
	nop			;bf43	00 	. 
	nop			;bf44	00 	. 
	nop			;bf45	00 	. 
	nop			;bf46	00 	. 
	nop			;bf47	00 	. 
	nop			;bf48	00 	. 
	nop			;bf49	00 	. 
	nop			;bf4a	00 	. 
	nop			;bf4b	00 	. 
	nop			;bf4c	00 	. 
	nop			;bf4d	00 	. 
	nop			;bf4e	00 	. 
	nop			;bf4f	00 	. 
	nop			;bf50	00 	. 
	nop			;bf51	00 	. 
	nop			;bf52	00 	. 
	nop			;bf53	00 	. 
	nop			;bf54	00 	. 
	nop			;bf55	00 	. 
	nop			;bf56	00 	. 
	nop			;bf57	00 	. 
	nop			;bf58	00 	. 
	nop			;bf59	00 	. 
	nop			;bf5a	00 	. 
	nop			;bf5b	00 	. 
	nop			;bf5c	00 	. 
	nop			;bf5d	00 	. 
	nop			;bf5e	00 	. 
	nop			;bf5f	00 	. 
	nop			;bf60	00 	. 
	nop			;bf61	00 	. 
	nop			;bf62	00 	. 
	nop			;bf63	00 	. 
	nop			;bf64	00 	. 
	nop			;bf65	00 	. 
	nop			;bf66	00 	. 
	nop			;bf67	00 	. 
	nop			;bf68	00 	. 
	nop			;bf69	00 	. 
	nop			;bf6a	00 	. 
	nop			;bf6b	00 	. 
	nop			;bf6c	00 	. 
	nop			;bf6d	00 	. 
	nop			;bf6e	00 	. 
	nop			;bf6f	00 	. 
	nop			;bf70	00 	. 
	nop			;bf71	00 	. 
	nop			;bf72	00 	. 
	nop			;bf73	00 	. 
	nop			;bf74	00 	. 
	nop			;bf75	00 	. 
	nop			;bf76	00 	. 
	nop			;bf77	00 	. 
	nop			;bf78	00 	. 
	nop			;bf79	00 	. 
	nop			;bf7a	00 	. 
	nop			;bf7b	00 	. 
	nop			;bf7c	00 	. 
	nop			;bf7d	00 	. 
	nop			;bf7e	00 	. 
	nop			;bf7f	00 	. 
	nop			;bf80	00 	. 
	nop			;bf81	00 	. 
	nop			;bf82	00 	. 
	nop			;bf83	00 	. 
	nop			;bf84	00 	. 
	nop			;bf85	00 	. 
	nop			;bf86	00 	. 
	nop			;bf87	00 	. 
	nop			;bf88	00 	. 
	nop			;bf89	00 	. 
	nop			;bf8a	00 	. 
	nop			;bf8b	00 	. 
	nop			;bf8c	00 	. 
	nop			;bf8d	00 	. 
	nop			;bf8e	00 	. 
	nop			;bf8f	00 	. 
	nop			;bf90	00 	. 
	nop			;bf91	00 	. 
	nop			;bf92	00 	. 
	nop			;bf93	00 	. 
	nop			;bf94	00 	. 
	nop			;bf95	00 	. 
	nop			;bf96	00 	. 
	nop			;bf97	00 	. 
	nop			;bf98	00 	. 
	nop			;bf99	00 	. 
	nop			;bf9a	00 	. 
	nop			;bf9b	00 	. 
	nop			;bf9c	00 	. 
	nop			;bf9d	00 	. 
	nop			;bf9e	00 	. 
	nop			;bf9f	00 	. 
	nop			;bfa0	00 	. 
	nop			;bfa1	00 	. 
	nop			;bfa2	00 	. 
	nop			;bfa3	00 	. 
	nop			;bfa4	00 	. 
	nop			;bfa5	00 	. 
	nop			;bfa6	00 	. 
	nop			;bfa7	00 	. 
	nop			;bfa8	00 	. 
	nop			;bfa9	00 	. 
	nop			;bfaa	00 	. 
	nop			;bfab	00 	. 
	nop			;bfac	00 	. 
	nop			;bfad	00 	. 
	nop			;bfae	00 	. 
	nop			;bfaf	00 	. 
	nop			;bfb0	00 	. 
	nop			;bfb1	00 	. 
	nop			;bfb2	00 	. 
	nop			;bfb3	00 	. 
	nop			;bfb4	00 	. 
	nop			;bfb5	00 	. 
	nop			;bfb6	00 	. 
	nop			;bfb7	00 	. 
	nop			;bfb8	00 	. 
	nop			;bfb9	00 	. 
	nop			;bfba	00 	. 
	nop			;bfbb	00 	. 
	nop			;bfbc	00 	. 
	nop			;bfbd	00 	. 
	nop			;bfbe	00 	. 
	nop			;bfbf	00 	. 
	nop			;bfc0	00 	. 
	nop			;bfc1	00 	. 
	nop			;bfc2	00 	. 
	nop			;bfc3	00 	. 
	nop			;bfc4	00 	. 
	nop			;bfc5	00 	. 
	nop			;bfc6	00 	. 
	nop			;bfc7	00 	. 
	nop			;bfc8	00 	. 
	nop			;bfc9	00 	. 
	nop			;bfca	00 	. 
	nop			;bfcb	00 	. 
	nop			;bfcc	00 	. 
	nop			;bfcd	00 	. 
	nop			;bfce	00 	. 
	nop			;bfcf	00 	. 
	nop			;bfd0	00 	. 
	nop			;bfd1	00 	. 
	nop			;bfd2	00 	. 
	nop			;bfd3	00 	. 
	nop			;bfd4	00 	. 
	nop			;bfd5	00 	. 
	nop			;bfd6	00 	. 
	nop			;bfd7	00 	. 
	nop			;bfd8	00 	. 
	nop			;bfd9	00 	. 
	nop			;bfda	00 	. 
	nop			;bfdb	00 	. 
	nop			;bfdc	00 	. 
	nop			;bfdd	00 	. 
	nop			;bfde	00 	. 
	nop			;bfdf	00 	. 
	nop			;bfe0	00 	. 
	nop			;bfe1	00 	. 
	nop			;bfe2	00 	. 
	nop			;bfe3	00 	. 
	nop			;bfe4	00 	. 
	nop			;bfe5	00 	. 
	nop			;bfe6	00 	. 
	nop			;bfe7	00 	. 
	nop			;bfe8	00 	. 
	nop			;bfe9	00 	. 
	nop			;bfea	00 	. 
	nop			;bfeb	00 	. 
	nop			;bfec	00 	. 
	nop			;bfed	00 	. 
	nop			;bfee	00 	. 
	nop			;bfef	00 	. 
	nop			;bff0	00 	. 
	nop			;bff1	00 	. 
	nop			;bff2	00 	. 
	nop			;bff3	00 	. 
	nop			;bff4	00 	. 
	nop			;bff5	00 	. 
	nop			;bff6	00 	. 
	nop			;bff7	00 	. 
	nop			;bff8	00 	. 
	nop			;bff9	00 	. 
	nop			;bffa	00 	. 
	nop			;bffb	00 	. 
	nop			;bffc	00 	. 
	nop			;bffd	00 	. 
	nop			;bffe	00 	. 
	nop			;bfff	00 	. 

	;; "VT 100 Emulator"
	rst 38h			;c000	ff 	. 
	inc b			;c001	04 	. 
	add hl,bc			;c002	09 	. 
	xor e			;c003	ab 	. 
	
	defb "VT100  Emulator"

	nop			;c013	00 	. 
	dec b			;c014	05 	. 
	dec bc			;c015	0b 	. 
	add a,e			;c016	83 	. 
	
	defb "Rev A.00.03"
	
;; "Copyright 1989 Hewlett-Packard Company for the HP4952"
	nop			;c022	00 	. 
	rlca			;c023	07 	. 
	add hl,bc			;c024	09 	. 
	add a,e			;c025	83 	. 
	xor e			;c026	ab 	. 
	
	defb " Copyright 1989", 000h

	ex af,af'			;c037	08 	. 
	dec b			;c038	05 	. 
	add a,e			;c039	83 	. 
	
	defb "Hewlett-Packard Company", 000h
 
	dec bc			;c052	0b 	. 
	add hl,bc			;c053	09 	. 
	add a,e			;c054	83 	. 
	
	defb "for the HP 495"

	ld (00c00h),a		;c063	32 00 0c 	2 . . 
	ex af,af'			;c066	08 	. 
	add a,e			;c067	83 	. 
	
	defb "Protocol Analyzer", 000h

	nop			;c07a	00 	. 
	adc a,e			;c07b	8b 	. 
	ld hl,(00000h)		;c07c	2a 00 00 	* . . 
	nop			;c07f	00 	. 
	nop			;c080	00 	. 
	nop			;c081	00 	. 
	nop			;c082	00 	. 
	nop			;c083	00 	. 
	nop			;c084	00 	. 
	nop			;c085	00 	. 
	nop			;c086	00 	. 
	nop			;c087	00 	. 
	nop			;c088	00 	. 
	sra d		;c089	cb 2a 	. * 
	jr nz,$+34		;c08b	20 20 	    
	jr nz,$+34		;c08d	20 20 	    
	jr nz,$+34		;c08f	20 20 	    
	jr nz,$+34		;c091	20 20 	    
	jr nz,$+34		;c093	20 20 	    
	jr nz,$+34		;c095	20 20 	    
	jr nz,$+34		;c097	20 20 	    
	jr nz,$+34		;c099	20 20 	    
	jr nz,$+34		;c09b	20 20 	    
	jr nz,$+34		;c09d	20 20 	    
	jr nz,$+34		;c09f	20 20 	    
	jr nz,$+34		;c0a1	20 20 	    
	jr nz,$+34		;c0a3	20 20 	    
	jr nz,$+34		;c0a5	20 20 	    
	jr nz,$+34		;c0a7	20 20 	    
	jr nz,$+34		;c0a9	20 20 	    
	jr nz,$+34		;c0ab	20 20 	    
	jr nz,$+34		;c0ad	20 20 	    
	jr nz,$+34		;c0af	20 20 	    
	jr nz,$+34		;c0b1	20 20 	    
	jr nz,$+34		;c0b3	20 20 	    
	jr nz,$+34		;c0b5	20 20 	    
	jr nz,$+34		;c0b7	20 20 	    
	jr nz,$+34		;c0b9	20 20 	    
	jr nz,$+34		;c0bb	20 20 	    
	jr nz,$+34		;c0bd	20 20 	    
	jr nz,$+34		;c0bf	20 20 	    
	jr nz,$+34		;c0c1	20 20 	    
	jr nz,$+34		;c0c3	20 20 	    
	jr nz,$+34		;c0c5	20 20 	    
	jr nz,$+34		;c0c7	20 20 	    
	jr nz,$+34		;c0c9	20 20 	    
	in a,(02ah)		;c0cb	db 2a 	. * 
	nop			;c0cd	00 	. 
	nop			;c0ce	00 	. 
	nop			;c0cf	00 	. 
	nop			;c0d0	00 	. 
	nop			;c0d1	00 	. 
	nop			;c0d2	00 	. 
	nop			;c0d3	00 	. 
	nop			;c0d4	00 	. 
	nop			;c0d5	00 	. 
	nop			;c0d6	00 	. 
	nop			;c0d7	00 	. 
	nop			;c0d8	00 	. 
	ld a,e			;c0d9	7b 	{ 
	ld hl,(02020h)		;c0da	2a 20 20 	*     
	jr nz,$+34		;c0dd	20 20 	    
	jr nz,$+34		;c0df	20 20 	    
	jr nz,$+34		;c0e1	20 20 	    
	jr nz,$+34		;c0e3	20 20 	    
	jr nz,$+34		;c0e5	20 20 	    
	jr nz,$+34		;c0e7	20 20 	    
	jr nz,$+34		;c0e9	20 20 	    
	jr nz,$+34		;c0eb	20 20 	    
	jr nz,$+34		;c0ed	20 20 	    
	jr nz,$+34		;c0ef	20 20 	    
	jr nz,$+34		;c0f1	20 20 	    
	jr nz,$+34		;c0f3	20 20 	    
	jr nz,$+34		;c0f5	20 20 	    
	jr nz,$+34		;c0f7	20 20 	    
	jr nz,$+34		;c0f9	20 20 	    
	jr nz,$+34		;c0fb	20 20 	    
	jr nz,$+34		;c0fd	20 20 	    
	jr nz,$+34		;c0ff	20 20 	    
	jr nz,$+34		;c101	20 20 	    
	jr nz,$+34		;c103	20 20 	    
	jr nz,$+34		;c105	20 20 	    
	jr nz,$+34		;c107	20 20 	    
	jr nz,$+34		;c109	20 20 	    
	jr nz,$+34		;c10b	20 20 	    
	jr nz,$+34		;c10d	20 20 	    
	jr nz,$+34		;c10f	20 20 	    
	jr nz,$+34		;c111	20 20 	    
	jr nz,$+34		;c113	20 20 	    
	jr nz,$+34		;c115	20 20 	    
	jr nz,$+34		;c117	20 20 	    
	jr nz,$+34		;c119	20 20 
	
;; "VT-100"
	;;ld d,(hl)			;c11b	56 	V 
	;;ld d,h			;c11c	54 	T 
	;;dec l			;c11d	2d 	- 
	;;jr nz,$+34		;c11e	20 20 	    
	;;ld sp,03030h		;c120	31 30 30 	1 0 0 
	defb "VT-  100"
	
	ld hl,02a00h		;c123	21 00 2a 	! . * 
	ld (0761dh),hl		;c126	22 1d 76 	" . v 
	ld hl,02a7bh		;c129	21 7b 2a 	! { * 
	ld (0761fh),hl		;c12c	22 1f 76 	" . v 
	ld (07624h),hl		;c12f	22 24 76 	" $ v 
	ld a,(0a496h)		;c132	3a 96 a4 	: . . 
	call 00e60h		;c135	cd 60 0e 	. ` . 
	ld hl,08326h		;c138	21 26 83 	! & . 
	ld e,(hl)			;c13b	5e 	^ 
	inc hl			;c13c	23 	# 
	ld d,(hl)			;c13d	56 	V 
	inc hl			;c13e	23 	# 
	push hl			;c13f	e5 	. 
	ex de,hl			;c140	eb 	. 
	ld de,02a8bh		;c141	11 8b 2a 	. . * 
	ld bc,00040h		;c144	01 40 00 	. @ . 
	ldir		;c147	ed b0 	. . 
	pop hl			;c149	e1 	. 
	ld de,02a7dh		;c14a	11 7d 2a 	. } * 
	ld bc,0000ch		;c14d	01 0c 00 	. . . 
	ldir		;c150	ed b0 	. . 
	ld e,(hl)			;c152	5e 	^ 
	inc hl			;c153	23 	# 
	ld d,(hl)			;c154	56 	V 
	ex de,hl			;c155	eb 	. 
	ld e,(hl)			;c156	5e 	^ 
	inc hl			;c157	23 	# 
	ld d,(hl)			;c158	56 	V 
	inc hl			;c159	23 	# 
	push hl			;c15a	e5 	. 
	ex de,hl			;c15b	eb 	. 
	ld de,02adbh		;c15c	11 db 2a 	. . * 
	ld bc,00040h		;c15f	01 40 00 	. @ . 
	ldir		;c162	ed b0 	. . 
	pop hl			;c164	e1 	. 
	ld de,02acdh		;c165	11 cd 2a 	. . * 
	ld bc,0000ch		;c168	01 0c 00 	. . . 
	ldir		;c16b	ed b0 	. . 
	ld a,006h		;c16d	3e 06 	> . 
	call 00e60h		;c16f	cd 60 0e 	. ` . 
	ld hl,02cfch		;c172	21 fc 2c 	! . , 
	ld (02ad5h),hl		;c175	22 d5 2a 	" . * 
	ld hl,02b1bh		;c178	21 1b 2b 	! . + 
	ld de,02af1h		;c17b	11 f1 2a 	. . * 
	ld bc,00004h		;c17e	01 04 00 	. . . 
	ldir		;c181	ed b0 	. . 
	ld hl,02b1fh		;c183	21 1f 2b 	! . + 
	ld de,02b11h		;c186	11 11 2b 	. . + 
	ld bc,00004h		;c189	01 04 00 	. . . 
	ldir		;c18c	ed b0 	. . 
	ret			;c18e	c9 	. 

;; POI-27, in+out	
	in a,(020h)		;c18f	db 20 	.   
	push af			;c191	f5 	. 
	ld a,(0a496h)		;c192	3a 96 a4 	: . . 
	call 00e60h		;c195	cd 60 0e 	. ` . 
	ld hl,02a00h		;c198	21 00 2a 	! . * 
	push hl			;c19b	e5 	. 
	call 01cf8h		;c19c	cd f8 1c 	. . . 
	pop hl			;c19f	e1 	. 
	pop af			;c1a0	f1 	. 
	out (020h),a		;c1a1	d3 20 	.   
	ret			;c1a3	c9 	. 

	ld bc,02ba9h		;c1a4	01 a9 2b 	. . + 
	xor h			;c1a7	ac 	. 
	inc l			;c1a8	2c 	, 
	rst 38h			;c1a9	ff 	. 
	ld bc,08306h		;c1aa	01 06 83 	. . . 
	
	defb "Terminal Emulator Menu", 000h

	inc bc			;c1c4	03 	. 

	defb 001h, 0abh
	defb "Setup Menu", 000h

	inc bc			;c1d2	03 	. 
	dec c			;c1d3	0d 	. 
	add a,e			;c1d4	83 	. 
	
	defb "Set communication", 000h 
	
	inc b			;c1e7	04 	. 
	inc b			;c1e8	04 	. 
	add a,e			;c1e9	83 	. 
	
	defb "parameters for terminal.", 000h

	dec b			;c203	05 	. 

	defb 001h, 0abh
	defb "Setup=Sim.", 000h

	dec b			;c211	05 	. 
	dec c			;c212	0d 	. 

	add a,e			;c213	83 	. 
	
	;; fixme paramaters -> parameters
	defb "Copy paramaters from", 000h
	
	ld b,004h		;c229	06 04 	. . 
	add a,e			;c22b	83 	. 
	
	defb "simulate setup to terminal.", 000h
 
	rlca			;c248	07 	. 

	defb 001h, 0abh
	defb "Simulate", 000h

	rlca			;c254	07 	. 
	dec c			;c255	0d 	. 
	add a,e			;c256	83 	. 
	
	defb "Run simulate menu &", 000h

	ex af,af'			;c26b	08 	. 
	inc b			;c26c	04 	. 
	add a,e			;c26d	83 	. 
	
	defb "return, keeping leads up.", 000h

	add hl,bc			;c288	09 	. 
	
	defb 001h, 0abh
	defb "Execute", 000h

	add hl,bc			;c293	09 	. 
	dec c			;c294	0d 	. 
	add a,e			;c295	83 	. 
	
	defb "Enter terminal mode.", 000h

	nop			;c2ab	00 	. 
	cp h			;c2ac	bc 	. 
	inc l			;c2ad	2c 	, 
	call nc,00032h		;c2ae	d4 32 00 	. 2 . 
	nop			;c2b1	00 	. 
	ld h,d			;c2b2	62 	b 
	inc (hl)			;c2b3	34 	4 
	ld c,l			;c2b4	4d 	M 
	dec l			;c2b5	2d 	- 
	nop			;c2b6	00 	. 
	nop			;c2b7	00 	. 
	ld sp,0ac2dh		;c2b8	31 2d ac 	1 - . 
	inc l			;c2bb	2c 	, 
	
	defb "Setup!   !Setup!!Simu-!    !Exe- Menu!   !=Sim.!"
	defb                 "! late!    !cute"
	    
	
;; POI-14, something is read in	
	in a,(020h)		;c2fc	db 20 	.   
	push af			;c2fe	f5 	. 
	ld a,022h		;c2ff	3e 22 	> " 
	ld (07501h),a		;c301	32 01 75 	2 . u 
	ld a,006h		;c304	3e 06 	> . 
	call 00e60h		;c306	cd 60 0e 	. ` . 
	ld a,(0a496h)		;c309	3a 96 a4 	: . . 
	call 00e60h		;c30c	cd 60 0e 	. ` . 
	ld hl,02ba4h		;c30f	21 a4 2b 	! . + 
	push hl			;c312	e5 	. 
	call 0da20h		;c313	cd 20 da 	.   . 
	pop hl			;c316	e1 	. 
	ld a,006h		;c317	3e 06 	> . 
	call 00e60h		;c319	cd 60 0e 	. ` . 
	call 0a533h		;c31c	cd 33 a5 	. 3 . 
	call 0a900h		;c31f	cd 00 a9 	. . . 
	call 0a53fh		;c322	cd 3f a5 	. ? . 
	ld a,021h		;c325	3e 21 	> ! 
	ld (07501h),a		;c327	32 01 75 	2 . u 
	pop af			;c32a	f1 	. 
	out (020h),a		;c32b	d3 20 	.   
	ld hl,00000h		;c32d	21 00 00 	! . . 
	ret			;c330	c9 	. 

	ld a,062h		;c331	3e 62 	> b 
	ld (07501h),a		;c333	32 01 75 	2 . u 
	ld a,006h		;c336	3e 06 	> . 
	call 00e60h		;c338	cd 60 0e 	. ` . 
	call 0a54bh		;c33b	cd 4b a5 	. K . 
	ld a,022h		;c33e	3e 22 	> " 
	ld (07501h),a		;c340	32 01 75 	2 . u 
	ld a,(0a496h)		;c343	3a 96 a4 	: . . 
	call 00e60h		;c346	cd 60 0e 	. ` . 
	ld hl,00001h		;c349	21 01 00 	! . . 
	ret			;c34c	c9 	. 

	ld a,006h		;c34d	3e 06 	> . 
	call 00e60h		;c34f	cd 60 0e 	. ` . 
	call 0a60eh		;c352	cd 0e a6 	. . . 
	ld a,022h		;c355	3e 22 	> " 
	ld (07501h),a		;c357	32 01 75 	2 . u 
	ld a,(0a496h)		;c35a	3a 96 a4 	: . . 
	call 00e60h		;c35d	cd 60 0e 	. ` . 
	ld hl,00001h		;c360	21 01 00 	! . . 
	ret			;c363	c9 	. 

	rst 38h			;c364	ff 	. 
	ld bc,08306h		;c365	01 06 83 	. . . 
	
	defb "Terminal Setup Menu", 000h

	inc bc			;c37c	03 	. 
	
	defb 001h, 083h
	defb "Data Code", 000h	

	inc b			;c389	04 	. 
		
	defb 001h, 083h
	defb "Parity", 000h

	dec b			;c393	05 	. 
	
	defb 001h, 083h	
	defb "Bits/sec", 000h

	ex af,af'			;c39f	08 	. 
	
	defb 001h, 083h	
	defb "Handshake", 000h
	
	defb 006h
	defb 001h, 083h	
	defb "Mode", 000h

	ld a,(bc)			;c3b4	0a 	. 

	defb 001h, 083h	
	defb "Echo", 000h

	dec bc			;c3bc	0b 	. 
	
	defb 001h, 083h	
	defb "Bell", 000h
; 
	inc c			;c3c4	0c 	. 
	
	defb 001h, 083h	
	defb "Display Functions", 000h	

	dec c			;c3d9	0d 	. 
	
	defb 001h, 083h	
	defb "Auto LF after CR", 000h

	nop			;c3ed	00 	. 
	inc bc			;c3ee	03 	. 
	inc b			;c3ef	04 	. 
	dec b			;c3f0	05 	. 
	ex af,af'			;c3f1	08 	. 
	ld b,00ah		;c3f2	06 0a 	. . 
	dec bc			;c3f4	0b 	. 
	inc c			;c3f5	0c 	. 
	dec c			;c3f6	0d 	. 
	dec bc			;c3f7	0b 	. 
	dec bc			;c3f8	0b 	. 
	dec bc			;c3f9	0b 	. 
	dec bc			;c3fa	0b 	. 
	dec bc			;c3fb	0b 	. 
	dec bc			;c3fc	0b 	. 
	dec bc			;c3fd	0b 	. 
	inc de			;c3fe	13 	. 
	inc de			;c3ff	13 	. 
	ld bc,00101h		;c400	01 01 01 	. . . 
	ld bc,00101h		;c403	01 01 01 	. . . 
	ld bc,00101h		;c406	01 01 01 	. . . 
	nop			;c409	00 	. 
	ccf			;c40a	3f 	? 
	ld (bc),a			;c40b	02 	. 
	ccf			;c40c	3f 	? 
	inc b			;c40d	04 	. 
	ccf			;c40e	3f 	? 
	ld b,03fh		;c40f	06 3f 	. ? 
	ex af,af'			;c411	08 	. 
	ccf			;c412	3f 	? 
	ld a,(bc)			;c413	0a 	. 
	ccf			;c414	3f 	? 
	inc c			;c415	0c 	. 
	ccf			;c416	3f 	? 
	ld c,03fh		;c417	0e 3f 	. ? 
	djnz $+65		;c419	10 3f 	. ? 
	call m,0fcd9h		;c41b	fc d9 fc 	. . . 
	exx			;c41e	d9 	. 
	call m,0fcd9h		;c41f	fc d9 fc 	. . . 
	exx			;c422	d9 	. 
	call m,0fcd9h		;c423	fc d9 fc 	. . . 
	exx			;c426	d9 	. 
	call m,0fcd9h		;c427	fc d9 fc 	. . . 
	exx			;c42a	d9 	. 
	call m,005d9h		;c42b	fc d9 05 	. . . 
	jp c,0da05h		;c42e	da 05 da 	. . . 
	dec b			;c431	05 	. 
	jp c,0da05h		;c432	da 05 da 	. . . 
	dec b			;c435	05 	. 
	jp c,0da05h		;c436	da 05 da 	. . . 
	dec b			;c439	05 	. 
	jp c,0da05h		;c43a	da 05 da 	. . . 
	dec b			;c43d	05 	. 
	jp c,02e6ch		;c43e	da 6c 2e 	. l . 
	ld l,h			;c441	6c 	l 
	ld l,06ch		;c442	2e 6c 	. l 
	ld l,06ch		;c444	2e 6c 	. l 
	ld l,06ch		;c446	2e 6c 	. l 
	ld l,06ch		;c448	2e 6c 	. l 
	ld l,06ch		;c44a	2e 6c 	. l 
	ld l,06ch		;c44c	2e 6c 	. l 
	ld l,06ch		;c44e	2e 6c 	. l 
	ld l,000h		;c450	2e 00 	. . 
	nop			;c452	00 	. 
	nop			;c453	00 	. 
	nop			;c454	00 	. 
	nop			;c455	00 	. 
	nop			;c456	00 	. 
	nop			;c457	00 	. 
	nop			;c458	00 	. 
	nop			;c459	00 	. 
	ld l,(hl)			;c45a	6e 	n 
	ld l,0deh		;c45b	2e de 	. . 
	ld l,088h		;c45d	2e 88 	. . 
	cpl			;c45f	2f 	/ 
	ld (hl),h			;c460	74 	t 
	ld sp,031e4h		;c461	31 e4 31 	1 . 1 
	ld c,h			;c464	4c 	L 
	ld (0326ch),a		;c465	32 6c 32 	2 l 2 
	ld l,h			;c468	6c 	l 
	ld (0326ch),a		;c469	32 6c 32 	2 l 2 
	nop			;c46c	00 	. 
	nop			;c46d	00 	. 
	ld a,(hl)			;c46e	7e 	~ 
	ld l,0beh		;c46f	2e be 	. . 
	ld l,0ceh		;c471	2e ce 	. . 
	ld l,000h		;c473	2e 00 	. . 
	nop			;c475	00 	. 
	nop			;c476	00 	. 
	nop			;c477	00 	. 
	nop			;c478	00 	. 
	nop			;c479	00 	. 
	nop			;c47a	00 	. 
	nop			;c47b	00 	. 
	
	ld l,(hl)			;c47c	6e 	n 
	
	defb 02eh
	defb "ASCII"	

	defb "!ASCII!    !!    !    !      8  !"    
	defb "  7  !    !!    !    !    "  
	        
	ld h,b			;c4be	60 	` 
	rst 38h			;c4bf	ff 	. 
	add a,02eh		;c4c0	c6 2e 	. . 
	nop			;c4c2	00 	. 
	nop			;c4c3	00 	. 
	nop			;c4c4	00 	. 
	nop			;c4c5	00 	. 
	
	defb "ASCII 8", 000h

	jr nz,$+129		;c4ce	20 7f 	   
	sub 02eh		;c4d0	d6 2e 	. . 
	nop			;c4d2	00 	. 
	nop			;c4d3	00 	. 
	nop			;c4d4	00 	. 
	nop			;c4d5	00 	. 
	
	defb "ASCII 7", 000h	

	xor 02eh		;c4de	ee 2e 	. . 
	ld l,02fh		;c4e0	2e 2f 	. / 
	dec a			;c4e2	3d 	= 
	cpl			;c4e3	2f 	/ `
	ld c,h			;c4e4	4c 	L 
	cpl			;c4e5	2f 	/ 
	ld e,e			;c4e6	5b 	[ 
	cpl			;c4e7	2f 	/ 
	ld l,d			;c4e8	6a 	j 
	cpl			;c4e9	2f 	/ 
	ld a,c			;c4ea	79 	y 0001h),a	
	cpl			;c4eb	2f 	/ 
	sbc a,02eh		;c4ec	de 2e 	. .
	
	defb "None!Odd!Even"
	defb "!!Space!Mark!Ignore    !   !    !! "	
	defb "(ASCII7) !      "	
 	    
	nop			;c52e	00 	. 
	nop			;c52f	00 	. 
	ld (hl),02fh		;c530	36 2f 	6 / 
	nop			;c532	00 	. 
	nop			;c533	00 	. 
	nop			;c534	00 	. 
	nop			;c535	00 	. 
	
	
	defb "None  ", 000h	

	ld bc,04500h		;c53d	01 00 45 	. . E 
	cpl			;c540	2f 	/ 
	nop			;c541	00 	. 
	nop			;c542	00 	. 
	nop			;c543	00 	. 
	nop			;c544	00 	. 

	defb "Odd   ", 000h	
 
	inc bc			;c54c	03 	. 
	nop			;c54d	00 	. 
	ld d,h			;c54e	54 	T 
	cpl			;c54f	2f 	/ 
	nop			;c550	00 	. 
	nop			;c551	00 	. 
	nop			;c552	00 	. 
	nop			;c553	00 	. 
	
	defb "Even  ", 000h

	inc b			;c55b	04 	. 
	nop			;c55c	00 	. 
	ld h,e			;c55d	63 	c 
	cpl			;c55e	2f 	/ 
	nop			;c55f	00 	. 
	nop			;c560	00 	. 
	nop			;c561	00 	. 
	nop			;c562	00 	. 

	defb "Space ", 000h	

	inc c			;c56a	0c 	. 
	nop			;c56b	00 	. 
	ld (hl),d			;c56c	72 	r 
	cpl			;c56d	2f 	/ 
	nop			;c56e	00 	. 
	nop			;c56f	00 	. 
	nop			;c570	00 	. 
	nop			;c571	00 	. 

	defb "Mark  ", 000h	

	ld b,e			;c579	43 	C 
	nop			;c57a	00 	. 
	add a,c			;c57b	81 	. 
	cpl			;c57c	2f 	/ 
	nop			;c57d	00 	. 
	nop			;c57e	00 	. 
	nop			;c57f	00 	. 
	nop			;c580	00 	. 

	defb "Ignore", 000h

	sbc a,b			;c588	98 	. 
	cpl			;c589	2f 	/ 
	ret c			;c58a	d8 	. 

	cpl			;c58b	2f 	/ 
	and 02fh		;c58c	e6 2f 	. / 
	call p,0022fh		;c58e	f4 2f 02 	. / . 
	jr nc,$+18		;c591	30 10 	0 . 
	jr nc,$+32		;c593	30 1e 	0 . 
	jr nc,$+46		;c595	30 2c 	0 , 
    
	defb "0300 !1200!2400!!4800!9600!19200"	

	ld a,(hl)			;c5b7	7e 	~ 
	
	defb "    !    !    !!    !    !    "

	jr nz,$+126		;c5d6	20 7c 	  | 
	rst 38h			;c5d8	ff 	. 
	rla			;c5d9	17 	. 
	ret po			;c5da	e0 	. 

	cpl			;c5db	2f 	/ 
	nop			;c5dc	00 	. 
	nop			;c5dd	00 	. 
	nop			;c5de	00 	. 
	nop			;c5df	00 	. 

	defb "300  ", 000h

	rst 38h			;c5e6	ff 	. 
	dec b			;c5e7	05 	. 
	xor 02fh		;c5e8	ee 2f 	. / 
	nop			;c5ea	00 	. 
	nop			;c5eb	00 	. 
	nop			;c5ec	00 	. 
	nop			;c5ed	00 	. 
	
	defb "1200 ", 000h
	
	rst 38h			;c5f4	ff 	. 
	ld (bc),a			;c5f5	02 	. 
	call m,0002fh		;c5f6	fc 2f 00 	. / . 
	nop			;c5f9	00 	. 
	nop			;c5fa	00 	. 
	nop			;c5fb	00 	. 
	
	defb "2400 ", 000h
  
	ld a,a			;c602	7f 	 
	ld bc,0300ah		;c603	01 0a 30 	. . 0 
	nop			;c606	00 	. 
	nop			;c607	00 	. 
	nop			;c608	00 	. 
	nop			;c609	00 	. 
	
	defb "4800 ", 000h

	cp a			;c610	bf 	. 
	nop			;c611	00 	. 
	jr $+50		;c612	18 30 	. 0 
	nop			;c614	00 	. 
	nop			;c615	00 	. 
	nop			;c616	00 	. 
	nop			;c617	00 	. 
	
	defb "9600 ", 000h

	ld e,a			;c61e	5f 	_ 
	nop			;c61f	00 	. 
	ld h,030h		;c620	26 30 	& 0 
	nop			;c622	00 	. 
	nop			;c623	00 	. 
	nop			;c624	00 	. 
	nop			;c625	00 	. 

	defb "19200", 000h

	inc a			;c62c	3c 	< 
	jr nc,$+126		;c62d	30 7c 	0 | 
	jr nc,$-102		;c62f	30 98 	0 . 
	jr nc,$-88		;c631	30 a6 	0 . 
	jr nc,$-74		;c633	30 b4 	0 . 
	jr nc,$-60		;c635	30 c2 	0 . 
	jr nc,$-46		;c637	30 d0 	0 . 
	jr nc,$-32		;c639	30 de 	0 . 
	jr nc,$+53		;c63b	30 33 	0 3 
	jr c,$+54		;c63d	38 34 	8 4 
	jr nc,$+50		;c63f	30 30 	0 0 

	defb "!200!600!!!1800!!3200!3600"

	ld a,(hl)			;c65b	7e 	~ 
	
	defb "     !   !   !!!    !!    !    "
   
	ld a,h			;c67b	7c 	| 
	cpl			;c67c	2f 	/ 
	nop			;c67d	00 	. 
	add a,h			;c67e	84 	. 
	jr nc,$+2		;c67f	30 00 	0 . 
	nop			;c681	00 	. 
	nop			;c682	00 	. 
	nop			;c683	00 	. 
	
	defb "38400", 000h

	ld (hl),e			;c68a	73 	s 
	ld b,c			;c68b	41 	A 
	sub d			;c68c	92 	. 
	jr nc,$+2		;c68d	30 00 	0 . 
	nop			;c68f	00 	. 
	nop			;c690	00 	. 
	nop			;c691	00 	. 
	
	defb "110  ", 000h

	rst 38h			;c698	ff 	. 
	inc hl			;c699	23 	# 
	and b			;c69a	a0 	. 
	jr nc,$+2		;c69b	30 00 	0 . 
	nop			;c69d	00 	. 
	nop			;c69e	00 	. 
	nop			;c69f	00 	. 
	
	defb "200  ", 000h

	rst 38h			;c6a6	ff 	. 
	dec bc			;c6a7	0b 	. 
	xor (hl)			;c6a8	ae 	. 
	jr nc,$+2		;c6a9	30 00 	0 . 
	nop			;c6ab	00 	. 
	nop			;c6ac	00 	. 
	nop			;c6ad	00 	. 
	
	defb "600  ", 000h

	rst 38h			;c6b4	ff 	. 
	inc bc			;c6b5	03 	. 
	cp h			;c6b6	bc 	. 
	jr nc,$+2		;c6b7	30 00 	0 . 
	nop			;c6b9	00 	. 
	nop			;c6ba	00 	. 
	nop			;c6bb	00 	. 

	defb "1800 ", 000h

	ccf			;c6c2	3f 	? 
	ld (bc),a			;c6c3	02 	. 
	jp z,00030h		;c6c4	ca 30 00 	. 0 . 
	nop			;c6c7	00 	. 
	nop			;c6c8	00 	. 
	nop			;c6c9	00 	. 
	inc sp			;c6ca	33 	3 
	
	defb "200 ", 000h

	rst 38h			;c6d0	ff 	. 
	ld bc,030d8h		;c6d1	01 d8 30 	. . 0 
	nop			;c6d4	00 	. 
	nop			;c6d5	00 	. 
	nop			;c6d6	00 	. 
	nop			;c6d7	00 	. 
	inc sp			;c6d8	33 	3 

	defb "600 ", 000h

	xor 030h		;c6de	ee 30 	. 0 
	adc a,d			;c6e0	8a 	. 
	jr nc,$+48		;c6e1	30 2e 	0 . 
	ld sp,0313ch		;c6e3	31 3c 31 	1 < 1 
	ld c,d			;c6e6	4a 	J 
	ld sp,03158h		;c6e7	31 58 31 	1 X 1 
	ld h,(hl)			;c6ea	66 	f 
	ld sp,02f88h		;c6eb	31 88 2f 	1 . / 
	
	defb "110 ! 75 ! 2000!!134.5!150!7200" 

	ld a,(hl)			;c70d	7e 	~ 
	
	defb "    !    !     !!     !   !    "
   	    
	ld a,h			;c72d	7c 	| 
	rst 38h			;c72e	ff 	. 
	ld e,a			;c72f	5f 	_ 
	ld (hl),031h		;c730	36 31 	6 1 
	nop			;c732	00 	. 
	nop			;c733	00 	. 
	nop			;c734	00 	. 
	nop			;c735	00 	. 
	scf			;c736	37 	7 
	dec (hl)			;c737	35 	5 
	jr nz,$+34		;c738	20 20 	    
	jr nz,$+2		;c73a	20 00 	  . 
	sbc a,c			;c73c	99 	. 
	inc bc			;c73d	03 	. 
	ld b,h			;c73e	44 	D 
	ld sp,00000h		;c73f	31 00 00 	1 . . 
	nop			;c742	00 	. 
	nop			;c743	00 	. 
	
	defb "2000 ", 000h
  
	add a,a			;c74a	87 	. 
	dec (hl)			;c74b	35 	5 
	ld d,d			;c74c	52 	R 
	ld sp,00000h		;c74d	31 00 00 	1 . . 
	nop			;c750	00 	. 
	nop			;c751	00 	. 
	
	defb "134.5", 000h

	rst 38h			;c758	ff 	. 
	cpl			;c759	2f 	/ 
	ld h,b			;c75a	60 	` 
	ld sp,00000h		;c75b	31 00 00 	1 . . 
	nop			;c75e	00 	. 
	nop			;c75f	00 	. 
	
	
	defb "150  ", 000h

	rst 38h			;c766	ff 	. 
	nop			;c767	00 	. 
	ld l,(hl)			;c768	6e 	n 
	ld sp,00000h		;c769	31 00 00 	1 . . 
	nop			;c76c	00 	. 
	nop			;c76d	00 	. 
	scf			;c76e	37 	7 
	
		
	defb "200 ", 000h

	add a,h			;c774	84 	. 
	ld sp,031c4h		;c775	31 c4 31 	1 . 1 
	call nc,00031h		;c778	d4 31 00 	. 1 . 
	nop			;c77b	00 	. 
	nop			;c77c	00 	. 
	nop			;c77d	00 	. 
	nop			;c77e	00 	. 
	nop			;c77f	00 	. 
	nop			;c780	00 	. 
	nop			;c781	00 	. 
	ld (hl),h			;c782	74 	t 
	
	defb 031h
	defb "None!Enq/!     !!    !     !        "
	defb "! Ack!     !!    !     !    "
	        
	nop			;c7c4	00 	. 
	nop			;c7c5	00 	. 
	call z,00031h		;c7c6	cc 31 00 	. 1 . 
	nop			;c7c9	00 	. 
	nop			;c7ca	00 	. 
	nop			;c7cb	00 	. 

	defb "None   ", 000h	

	ld bc,0dc00h		;c7d4	01 00 dc 	. . . 
	ld sp,00000h		;c7d7	31 00 00 	1 . . 
	nop			;c7da	00 	. 
	nop			;c7db	00 	. 
	
	
	defb "Enq/Ack", 000h

	call p,03431h		;c7e4	f4 31 34 	. 1 4 
	ld (03240h),a		;c7e7	32 40 32 	2 @ 2 
	nop			;c7ea	00 	. 
	nop			;c7eb	00 	. 
	nop			;c7ec	00 	. 
	nop			;c7ed	00 	. 
	nop			;c7ee	00 	. 
	nop			;c7ef	00 	. 
	nop			;c7f0	00 	. 
	nop			;c7f1	00 	. 
	call po,02031h		;c7f2	e4 31 20 	. 1   
	
	defb "DTE ! DCE !    !!    !    !        "
	defb " !     !    !!    !    !    "
    
	add a,c			;c834	81 	. 
	nop			;c835	00 	. 
	inc a			;c836	3c 	< 
	ld (00000h),a		;c837	32 00 00 	2 . . 
	nop			;c83a	00 	. 
	nop			;c83b	00 	. 
	
	defb "DTE", 000h

	add a,d			;c840	82 	. 
	nop			;c841	00 	. 
	ld c,b			;c842	48 	H 
	ld (00000h),a		;c843	32 00 00 	2 . . 
	nop			;c846	00 	. 
	nop			;c847	00 	. 
	
	defb "DCE", 000h

	ld a,h			;c84c	7c 	| 
	ld (0325ch),a		;c84d	32 5c 32 	2 \ 2 
	ld h,h			;c850	64 	d 
	ld (00000h),a		;c851	32 00 00 	2 . . 
	nop			;c854	00 	. 
	nop			;c855	00 	. 
	nop			;c856	00 	. 
	nop			;c857	00 	. 
	nop			;c858	00 	. 
	nop			;c859	00 	. 
	ld c,h			;c85a	4c 	L 
	ld (00001h),a		;c85b	32 01 00 	2 . . 
	call nz,00032h		;c85e	c4 32 00 	. 2 . 
	nop			;c861	00 	. 
	nop			;c862	00 	. 
	nop			;c863	00 	. 
	nop			;c864	00 	. 
	nop			;c865	00 	. 
	ret nc			;c866	d0 	. 

	ld (00000h),a		;c867	32 00 00 	2 . . 
	nop			;c86a	00 	. 
	nop			;c86b	00 	. 
	ld a,h			;c86c	7c 	| 
	ld (032bch),a		;c86d	32 bc 32 	2 . 2 
	ret z			;c870	c8 	. 

	ld (00000h),a		;c871	32 00 00 	2 . . 
	nop			;c874	00 	. 
	nop			;c875	00 	. 
	nop			;c876	00 	. 
	nop			;c877	00 	. 
	nop			;c878	00 	. 
	nop			;c879	00 	. 
	ld l,h			;c87a	6c 	l 
	
;; "On"	
	ld (04f20h),a		;c87b	32 20 4f 	2   O 
	ld l,(hl)			;c87e	6e 	n 
	jr nz,$+35		;c87f	20 21 	  ! 
	
;; "Off"	
	defb " Off !    !!    !     !        !     !"
	defb "    !!    !     !    "
   
	ld bc,0c400h		;c8bc	01 00 c4 	. . . 
	ld (00000h),a		;c8bf	32 00 00 	2 . . 
	nop			;c8c2	00 	. 
	nop			;c8c3	00 	. 
	
	defb "On ", 000h

	nop			;c8c8	00 	. 
	nop			;c8c9	00 	. 
	ret nc			;c8ca	d0 	. 

	ld (00000h),a		;c8cb	32 00 00 	2 . . 
	nop			;c8ce	00 	. 
	nop			;c8cf	00 	. 

	;; "Off"	
	defb "Off", 000h

	ld a,006h		;c8d4	3e 06 	> . 
	call 00e60h		;c8d6	cd 60 0e 	. ` . 
	call 0a533h		;c8d9	cd 33 a5 	. 3 . 
	ld hl,(03f00h)		;c8dc	2a 00 3f 	* . ? 
	push hl			;c8df	e5 	. 
	ld hl,(03f02h)		;c8e0	2a 02 3f 	* . ? 
	push hl			;c8e3	e5 	. 
	ld hl,(03f04h)		;c8e4	2a 04 3f 	* . ? 
	push hl			;c8e7	e5 	. 
	ld hl,(03f08h)		;c8e8	2a 08 3f 	* . ? 
	push hl			;c8eb	e5 	. 
	call 03344h		;c8ec	cd 44 33 	. D 3 
	ld hl,00032h		;c8ef	21 32 00 	! 2 . 
	push hl			;c8f2	e5 	. 
	call 0d9f9h		;c8f3	cd f9 d9 	. . . 
	pop hl			;c8f6	e1 	. 
	ld a,(03f12h)		;c8f7	3a 12 3f 	: . ? 
	ld c,a			;c8fa	4f 	O 
	ld hl,(03f08h)		;c8fb	2a 08 3f 	* . ? 
	pop de			;c8fe	d1 	. 
	or a			;c8ff	b7 	. 
	sbc hl,de		;c900	ed 52 	. R 
	jr nz,$+31		;c902	20 1d 	  . 
	ld hl,(03f04h)		;c904	2a 04 3f 	* . ? 
	pop de			;c907	d1 	. 
	or a			;c908	b7 	. 
	sbc hl,de		;c909	ed 52 	. R 
	jr nz,$+24		;c90b	20 16 	  . 
	ld hl,(03f02h)		;c90d	2a 02 3f 	* . ? 
	pop de			;c910	d1 	. 
	or a			;c911	b7 	. 
	sbc hl,de		;c912	ed 52 	. R 
	jr nz,$+16		;c914	20 0e 	  . 
	ld hl,(03f00h)		;c916	2a 00 3f 	* . ? 
	pop de			;c919	d1 	. 
	or a			;c91a	b7 	. 
	sbc hl,de		;c91b	ed 52 	. R 
	jr nz,$+8		;c91d	20 06 	  . 
	jr $+16		;c91f	18 0e 	. . 
	dec c			;c921	0d 	. 
	pop de			;c922	d1 	. 
	pop de			;c923	d1 	. 
	pop de			;c924	d1 	. 
	dec c			;c925	0d 	. 
	xor a			;c926	af 	. 
	bit 7,c		;c927	cb 79 	. y 
	jr nz,$+3		;c929	20 01 	  . 
	ld a,c			;c92b	79 	y 
	ld (03f12h),a		;c92c	32 12 3f 	2 . ? 
	ld a,006h		;c92f	3e 06 	> . 
	call 00e60h		;c931	cd 60 0e 	. ` . 
	call 0a53fh		;c934	cd 3f a5 	. ? . 
	ld a,(0a496h)		;c937	3a 96 a4 	: . . 
	call 00e60h		;c93a	cd 60 0e 	. ` . 
	call 01c47h		;c93d	cd 47 1c 	. G . 
	ld hl,00001h		;c940	21 01 00 	! . . 
	ret			;c943	c9 	. 

;; POI-010 below could be config steps for serial parameters	
	ld a,(0a496h)		;c944	3a 96 a4 	: . . 
	call 00e60h		;c947	cd 60 0e 	. ` . 
	
	ld a,022h		;c94a	3e 22 	> " 
	ld (07501h),a		;c94c	32 01 75 	2 . u 
	ld hl,02d64h		;c94f	21 64 2d 	! d - 
	push hl			;c952	e5 	. 
	call 01cf8h		;c953	cd f8 1c 	. . . 
	
	pop hl			;c956	e1 	. 
	ld hl,07000h		;c957	21 00 70 	! . p 
	ld (hl),000h		;c95a	36 00 	6 . 
	ld d,h			;c95c	54 	T 
	ld e,l			;c95d	5d 	] 
	inc de			;c95e	13 	. 
	ld bc,002ffh		;c95f	01 ff 02 	. . . 
	ldir		;c962	ed b0 	. . 
	ld hl,02deeh		;c964	21 ee 2d 	! . - 
	ld de,07658h		;c967	11 58 76 	. X v 
	ld bc,00009h		;c96a	01 09 00 	. . . 
	ldir		;c96d	ed b0 	. . 
	ld hl,02df7h		;c96f	21 f7 2d 	! . - 
	ld de,07696h		;c972	11 96 76 	. . v 
	ld bc,00009h		;c975	01 09 00 	. . . 
	ldir		;c978	ed b0 	. . 
	ld hl,02e00h		;c97a	21 00 2e 	! . . 
	ld de,076d4h		;c97d	11 d4 76 	. . v 
	ld bc,00009h		;c980	01 09 00 	. . . 
	ldir		;c983	ed b0 	. . 
	ld hl,02e09h		;c985	21 09 2e 	! . . 
	ld de,07744h		;c988	11 44 77 	. D w 
	ld bc,00012h		;c98b	01 12 00 	. . . 
	ldir		;c98e	ed b0 	. . 
	ld hl,02e1bh		;c990	21 1b 2e 	! . . 
	ld de,077c0h		;c993	11 c0 77 	. . w 
	ld bc,00012h		;c996	01 12 00 	. . . 
	ldir		;c999	ed b0 	. . 
	ld hl,02e2dh		;c99b	21 2d 2e 	! - . 
	ld de,0783ch		;c99e	11 3c 78 	. < x 
	ld bc,00012h		;c9a1	01 12 00 	. . . 
	ldir		;c9a4	ed b0 	. . 
	ld hl,02e3fh		;c9a6	21 3f 2e 	! ? . 
	ld de,078b8h		;c9a9	11 b8 78 	. . x 
	ld bc,00012h		;c9ac	01 12 00 	. . . 
	ldir		;c9af	ed b0 	. . 
	ld hl,02e51h		;c9b1	21 51 2e 	! Q . 
	ld de,068aeh		;c9b4	11 ae 68 	. . h 
	ld bc,00009h		;c9b7	01 09 00 	. . . 
	ldir		;c9ba	ed b0 	. . 
	ld hl,02e5ah		;c9bc	21 5a 2e 	! Z . 
	ld de,06864h		;c9bf	11 64 68 	. d h 
	ld bc,00012h		;c9c2	01 12 00 	. . . 
	ldir		;c9c5	ed b0 	. . 
	ld a,033h		;c9c7	3e 33 	> 3 
	ld (07014h),a		;c9c9	32 14 70 	2 . p 
	ld a,034h		;c9cc	3e 34 	> 4 
	ld (07054h),a		;c9ce	32 54 70 	2 T p 
	ld a,035h		;c9d1	3e 35 	> 5 
	ld (07094h),a		;c9d3	32 94 70 	2 . p 
	ld a,036h		;c9d6	3e 36 	> 6 
	ld (07154h),a		;c9d8	32 54 71 	2 T q 
	ld a,037h		;c9db	3e 37 	> 7 
	ld (070d4h),a		;c9dd	32 d4 70 	2 . p 
	ld a,038h		;c9e0	3e 38 	> 8 
	ld (071d4h),a		;c9e2	32 d4 71 	2 . q 
	ld a,039h		;c9e5	3e 39 	> 9 
	ld (07214h),a		;c9e7	32 14 72 	2 . r 
	ld a,03ah		;c9ea	3e 3a 	> : 
	ld (07264h),a		;c9ec	32 64 72 	2 d r 
	ld a,03bh		;c9ef	3e 3b 	> ; 
	ld (072a4h),a		;c9f1	32 a4 72 	2 . r 
	ld hl,00032h		;c9f4	21 32 00 	! 2 . 
	push hl			;c9f7	e5 	. 
	ld hl,02e6eh		;c9f8	21 6e 2e 	! n . 
	push hl			;c9fb	e5 	. 
	call 00fbfh		;c9fc	cd bf 0f 	. . . 
	
	pop hl			;c9ff	e1 	. 
	ld hl,00033h		;ca00	21 33 00 	! 3 . 
	ex (sp),hl			;ca03	e3 	. 
	ld hl,02edeh		;ca04	21 de 2e 	! . . 
	push hl			;ca07	e5 	. 
	call 00fbfh		;ca08	cd bf 0f 	. . . 
	pop hl			;ca0b	e1 	. 
	ld hl,00034h		;ca0c	21 34 00 	! 4 . 
	ex (sp),hl			;ca0f	e3 	. 
	ld hl,02f88h		;ca10	21 88 2f 	! . / 
	push hl			;ca13	e5 	. 
	call 00fbfh		;ca14	cd bf 0f 	. . . 
	pop hl			;ca17	e1 	. 
	ld hl,00035h		;ca18	21 35 00 	! 5 . 
	ex (sp),hl			;ca1b	e3 	. 
	ld hl,03174h		;ca1c	21 74 31 	! t 1 
	push hl			;ca1f	e5 	. 
	call 00fbfh		;ca20	cd bf 0f 	. . . 
	pop hl			;ca23	e1 	. 
	ld hl,00036h		;ca24	21 36 00 	! 6 . 
	ex (sp),hl			;ca27	e3 	. 
	ld hl,031e4h		;ca28	21 e4 31 	! . 1 
	push hl			;ca2b	e5 	. 
	call 00fbfh		;ca2c	cd bf 0f 	. . . 
	pop hl			;ca2f	e1 	. 
	ld hl,00037h		;ca30	21 37 00 	! 7 . 
	ex (sp),hl			;ca33	e3 	. 
	ld hl,0324ch		;ca34	21 4c 32 	! L 2 
	push hl			;ca37	e5 	. 
	call 00fbfh		;ca38	cd bf 0f 	. . . 
	pop hl			;ca3b	e1 	. 
	ld hl,00038h		;ca3c	21 38 00 	! 8 . 
	ex (sp),hl			;ca3f	e3 	. 
	ld hl,0326ch		;ca40	21 6c 32 	! l 2 
	push hl			;ca43	e5 	. 
	call 00fbfh		;ca44	cd bf 0f 	. . . 
	pop hl			;ca47	e1 	. 
	ld hl,00039h		;ca48	21 39 00 	! 9 . 
	ex (sp),hl			;ca4b	e3 	. 
	ld hl,0326ch		;ca4c	21 6c 32 	! l 2 
	push hl			;ca4f	e5 	. 
	call 00fbfh		;ca50	cd bf 0f 	. . . 
	pop hl			;ca53	e1 	. 
	ld hl,0003ah		;ca54	21 3a 00 	! : . 
	ex (sp),hl			;ca57	e3 	. 
	ld hl,0326ch		;ca58	21 6c 32 	! l 2 
	push hl			;ca5b	e5 	. 
	call 00fbfh		;ca5c	cd bf 0f 	. . . 
	pop hl			;ca5f	e1 	. 
	pop hl			;ca60	e1 	. 
	ret			;ca61	c9 	. 

	ld hl,(03f00h)		;ca62	2a 00 3f 	* . ? 
	push hl			;ca65	e5 	. 
	ld hl,(03f02h)		;ca66	2a 02 3f 	* . ? 
	push hl			;ca69	e5 	. 
	ld hl,(03f04h)		;ca6a	2a 04 3f 	* . ? 
	push hl			;ca6d	e5 	. 
	ld hl,(03f08h)		;ca6e	2a 08 3f 	* . ? 
	push hl			;ca71	e5 	. 
	ld a,(04806h)		;ca72	3a 06 48 	: . H 
	cp 001h		;ca75	fe 01 	. . 
	jr z,$+14		;ca77	28 0c 	( . 
	cp 002h		;ca79	fe 02 	. . 
	jr nz,$+16		;ca7b	20 0e 	  . 
	ld hl,07f20h		;ca7d	21 20 7f 	!    
	ld (03f00h),hl		;ca80	22 00 3f 	" . ? 
	jr $+8		;ca83	18 06 	. . 
	ld hl,0ff60h		;ca85	21 60 ff 	! ` . 
	ld (03f00h),hl		;ca88	22 00 3f 	" . ? 
	ld a,(0481ah)		;ca8b	3a 1a 48 	: . H 
	cp 003h		;ca8e	fe 03 	. . 
	jr z,$+19		;ca90	28 11 	( . 
	cp 002h		;ca92	fe 02 	. . 
	jr z,$+20		;ca94	28 12 	( . 
	cp 001h		;ca96	fe 01 	. . 
	jr z,$+21		;ca98	28 13 	( . 
	cp 004h		;ca9a	fe 04 	. . 
	jr nz,$+23		;ca9c	20 15 	  . 
	ld hl,00043h		;ca9e	21 43 00 	! C . 
	jr $+15		;caa1	18 0d 	. . 
	ld hl,00000h		;caa3	21 00 00 	! . . 
	jr $+10		;caa6	18 08 	. . 
	ld hl,00003h		;caa8	21 03 00 	! . . 
	jr $+5		;caab	18 03 	. . 
	ld hl,00001h		;caad	21 01 00 	! . . 
	ld (03f02h),hl		;cab0	22 02 3f 	" . ? 
	ld ix,03525h		;cab3	dd 21 25 35 	. ! % 5 
	ld de,00004h		;cab7	11 04 00 	. . . 
	ld b,012h		;caba	06 12 	. . 
	ld hl,(04816h)		;cabc	2a 16 48 	* . H 
	ld a,(04814h)		;cabf	3a 14 48 	: . H 
	ld h,a			;cac2	67 	g 
	ld a,(ix+000h)		;cac3	dd 7e 00 	. ~ . 
	cp l			;cac6	bd 	. 
	jr nz,$+8		;cac7	20 06 	  . 
	ld a,(ix+001h)		;cac9	dd 7e 01 	. ~ . 
	cp h			;cacc	bc 	. 
	jr z,$+8		;cacd	28 06 	( . 
	add ix,de		;cacf	dd 19 	. . 
	djnz $-14		;cad1	10 f0 	. . 
	jr $+28		;cad3	18 1a 	. . 
	ld l,(ix+002h)		;cad5	dd 6e 02 	. n . 
	ld h,(ix+003h)		;cad8	dd 66 03 	. f . 
	ld a,l			;cadb	7d 	} 
	or h			;cadc	b4 	. 
	jr nz,$+15		;cadd	20 0d 	  . 
	ld a,(04812h)		;cadf	3a 12 48 	: . H 
	cp 003h		;cae2	fe 03 	. . 
	ld hl,023ffh		;cae4	21 ff 23 	! . # 
	jr z,$+5		;cae7	28 03 	( . 
	ld hl,00399h		;cae9	21 99 03 	! . . 
	ld (03f04h),hl		;caec	22 04 3f 	" . ? 
	ld a,(07532h)		;caef	3a 32 75 	: 2 u 
	dec a			;caf2	3d 	= 
	push af			;caf3	f5 	. 
	jr nz,$+8		;caf4	20 06 	  . 
	call 00ebbh		;caf6	cd bb 0e 	. . . 
	call 00e94h		;caf9	cd 94 0e 	. . . 
	ld ix,(0498ah)		;cafc	dd 2a 8a 49 	. * . I 
	ld a,(ix+00ah)		;cb00	dd 7e 0a 	. ~ . 
	cp 002h		;cb03	fe 02 	. . 
	jr z,$+14		;cb05	28 0c 	( . 
	cp 001h		;cb07	fe 01 	. . 
	jr nz,$+16		;cb09	20 0e 	  . 
	ld hl,00082h		;cb0b	21 82 00 	! . . 
	ld (03f08h),hl		;cb0e	22 08 3f 	" . ? 
	jr $+8		;cb11	18 06 	. . 
	ld hl,00081h		;cb13	21 81 00 	! . . 
	ld (03f08h),hl		;cb16	22 08 3f 	" . ? 
	pop af			;cb19	f1 	. 
	jr nz,$+8		;cb1a	20 06 	  . 
	call 00eaah		;cb1c	cd aa 0e 	. . . 
	call 00eafh		;cb1f	cd af 0e 	. . . 
	jp 032f7h		;cb22	c3 f7 32 	. . 2 
	add a,b			;cb25	80 	. 
	ld bc,0002fh		;cb26	01 2f 00 	. / . 
	ret nz			;cb29	c0 	. 

	nop			;cb2a	00 	. 
	ld e,a			;cb2b	5f 	_ 
	nop			;cb2c	00 	. 
	ret nz			;cb2d	c0 	. 

	inc bc			;cb2e	03 	. 
	cp a			;cb2f	bf 	. 
	nop			;cb30	00 	. 
	ret nc			;cb31	d0 	. 

	ld (bc),a			;cb32	02 	. 
	rst 38h			;cb33	ff 	. 
	nop			;cb34	00 	. 
	ret po			;cb35	e0 	. 

	ld bc,0017fh		;cb36	01 7f 01 	.  . 
	ld l,b			;cb39	68 	h 
	ld bc,001ffh		;cb3a	01 ff 01 	. . . 
	ld b,b			;cb3d	40 	@ 
	ld bc,0023fh		;cb3e	01 3f 02 	. ? . 
	ret p			;cb41	f0 	. 

	nop			;cb42	00 	. 
	rst 38h			;cb43	ff 	. 
	ld (bc),a			;cb44	02 	. 
	or h			;cb45	b4 	. 
	nop			;cb46	00 	. 
	rst 38h			;cb47	ff 	. 
	inc bc			;cb48	03 	. 
	ld a,b			;cb49	78 	x 
	nop			;cb4a	00 	. 
	rst 38h			;cb4b	ff 	. 
	dec b			;cb4c	05 	. 
	ld e,b			;cb4d	58 	X 
	ld (bc),a			;cb4e	02 	. 
	rst 38h			;cb4f	ff 	. 
	dec bc			;cb50	0b 	. 
	inc l			;cb51	2c 	, 
	ld bc,017ffh		;cb52	01 ff 17 	. . . 
	ret z			;cb55	c8 	. 

	nop			;cb56	00 	. 
	nop			;cb57	00 	. 
	nop			;cb58	00 	. 
	sub (hl)			;cb59	96 	. 
	nop			;cb5a	00 	. 
	rst 38h			;cb5b	ff 	. 
	cpl			;cb5c	2f 	/ 
	add a,(hl)			;cb5d	86 	. 
	nop			;cb5e	00 	. 
	add a,a			;cb5f	87 	. 
	dec (hl)			;cb60	35 	5 
	ld l,(hl)			;cb61	6e 	n 
	nop			;cb62	00 	. 
	ld (hl),e			;cb63	73 	s 
	ld b,c			;cb64	41 	A 
	xor 002h		;cb65	ee 02 	. . 
	rst 38h			;cb67	ff 	. 
	ld e,a			;cb68	5f 	_ 
	call p,0ff01h		;cb69	f4 01 ff 	. . . 
	adc a,a			;cb6c	8f 	. 
	nop			;cb6d	00 	. 
	nop			;cb6e	00 	. 
	nop			;cb6f	00 	. 
	nop			;cb70	00 	. 
	nop			;cb71	00 	. 
	nop			;cb72	00 	. 
	nop			;cb73	00 	. 
	nop			;cb74	00 	. 
	nop			;cb75	00 	. 
	nop			;cb76	00 	. 
	nop			;cb77	00 	. 
	nop			;cb78	00 	. 
	nop			;cb79	00 	. 
	nop			;cb7a	00 	. 
	nop			;cb7b	00 	. 
	nop			;cb7c	00 	. 
	nop			;cb7d	00 	. 
	nop			;cb7e	00 	. 
	nop			;cb7f	00 	. 
	nop			;cb80	00 	. 
	nop			;cb81	00 	. 
	nop			;cb82	00 	. 
	nop			;cb83	00 	. 
	nop			;cb84	00 	. 
	nop			;cb85	00 	. 
	nop			;cb86	00 	. 
	nop			;cb87	00 	. 
	nop			;cb88	00 	. 
	nop			;cb89	00 	. 
	nop			;cb8a	00 	. 
	nop			;cb8b	00 	. 
	nop			;cb8c	00 	. 
	nop			;cb8d	00 	. 
	nop			;cb8e	00 	. 
	nop			;cb8f	00 	. 
	nop			;cb90	00 	. 
	nop			;cb91	00 	. 
	nop			;cb92	00 	. 
	nop			;cb93	00 	. 
	nop			;cb94	00 	. 
	nop			;cb95	00 	. 
	nop			;cb96	00 	. 
	nop			;cb97	00 	. 
	nop			;cb98	00 	. 
	nop			;cb99	00 	. 
	nop			;cb9a	00 	. 
	nop			;cb9b	00 	. 
	nop			;cb9c	00 	. 
	nop			;cb9d	00 	. 
	nop			;cb9e	00 	. 
	nop			;cb9f	00 	. 
	nop			;cba0	00 	. 
	nop			;cba1	00 	. 
	nop			;cba2	00 	. 
	nop			;cba3	00 	. 
	nop			;cba4	00 	. 
	nop			;cba5	00 	. 
	nop			;cba6	00 	. 
	nop			;cba7	00 	. 
	nop			;cba8	00 	. 
	nop			;cba9	00 	. 
	nop			;cbaa	00 	. 
	nop			;cbab	00 	. 
	nop			;cbac	00 	. 
	nop			;cbad	00 	. 
	nop			;cbae	00 	. 
	nop			;cbaf	00 	. 
	nop			;cbb0	00 	. 
	nop			;cbb1	00 	. 
	nop			;cbb2	00 	. 
	nop			;cbb3	00 	. 
	nop			;cbb4	00 	. 
	nop			;cbb5	00 	. 
	nop			;cbb6	00 	. 
	nop			;cbb7	00 	. 
	nop			;cbb8	00 	. 
	nop			;cbb9	00 	. 
	nop			;cbba	00 	. 
	nop			;cbbb	00 	. 
	nop			;cbbc	00 	. 
	nop			;cbbd	00 	. 
	nop			;cbbe	00 	. 
	nop			;cbbf	00 	. 
	nop			;cbc0	00 	. 
	nop			;cbc1	00 	. 
	nop			;cbc2	00 	. 
	nop			;cbc3	00 	. 
	nop			;cbc4	00 	. 
	nop			;cbc5	00 	. 
	nop			;cbc6	00 	. 
	nop			;cbc7	00 	. 
	nop			;cbc8	00 	. 
	nop			;cbc9	00 	. 
	nop			;cbca	00 	. 
	nop			;cbcb	00 	. 
	nop			;cbcc	00 	. 
	nop			;cbcd	00 	. 
	nop			;cbce	00 	. 
	nop			;cbcf	00 	. 
	nop			;cbd0	00 	. 
	nop			;cbd1	00 	. 
	nop			;cbd2	00 	. 
	nop			;cbd3	00 	. 
	nop			;cbd4	00 	. 
	nop			;cbd5	00 	. 
	nop			;cbd6	00 	. 
	nop			;cbd7	00 	. 
	nop			;cbd8	00 	. 
	nop			;cbd9	00 	. 
	nop			;cbda	00 	. 
	nop			;cbdb	00 	. 
	nop			;cbdc	00 	. 
	nop			;cbdd	00 	. 
	nop			;cbde	00 	. 
	nop			;cbdf	00 	. 
	nop			;cbe0	00 	. 
	nop			;cbe1	00 	. 
	nop			;cbe2	00 	. 
	nop			;cbe3	00 	. 
	nop			;cbe4	00 	. 
	nop			;cbe5	00 	. 
	nop			;cbe6	00 	. 
	nop			;cbe7	00 	. 
	nop			;cbe8	00 	. 
	nop			;cbe9	00 	. 
	nop			;cbea	00 	. 
	nop			;cbeb	00 	. 
	nop			;cbec	00 	. 
	nop			;cbed	00 	. 
	nop			;cbee	00 	. 
	nop			;cbef	00 	. 
	nop			;cbf0	00 	. 
	nop			;cbf1	00 	. 
	nop			;cbf2	00 	. 
	nop			;cbf3	00 	. 
	nop			;cbf4	00 	. 
	nop			;cbf5	00 	. 
	nop			;cbf6	00 	. 
	nop			;cbf7	00 	. 
	nop			;cbf8	00 	. 
	nop			;cbf9	00 	. 
	nop			;cbfa	00 	. 
	nop			;cbfb	00 	. 
	nop			;cbfc	00 	. 
	nop			;cbfd	00 	. 
	nop			;cbfe	00 	. 
	nop			;cbff	00 	. 
	nop			;cc00	00 	. 
	nop			;cc01	00 	. 
	nop			;cc02	00 	. 
	nop			;cc03	00 	. 
	nop			;cc04	00 	. 
	nop			;cc05	00 	. 
	nop			;cc06	00 	. 
	nop			;cc07	00 	. 
	nop			;cc08	00 	. 
	nop			;cc09	00 	. 
	nop			;cc0a	00 	. 
	nop			;cc0b	00 	. 
	nop			;cc0c	00 	. 
	nop			;cc0d	00 	. 
	nop			;cc0e	00 	. 
	nop			;cc0f	00 	. 
	nop			;cc10	00 	. 
	nop			;cc11	00 	. 
	nop			;cc12	00 	. 
	nop			;cc13	00 	. 
	nop			;cc14	00 	. 
	nop			;cc15	00 	. 
	nop			;cc16	00 	. 
	nop			;cc17	00 	. 
	nop			;cc18	00 	. 
	nop			;cc19	00 	. 
	nop			;cc1a	00 	. 
	nop			;cc1b	00 	. 
	nop			;cc1c	00 	. 
	nop			;cc1d	00 	. 
	nop			;cc1e	00 	. 
	nop			;cc1f	00 	. 
	nop			;cc20	00 	. 
	nop			;cc21	00 	. 
	nop			;cc22	00 	. 
	nop			;cc23	00 	. 
	nop			;cc24	00 	. 
	nop			;cc25	00 	. 
	nop			;cc26	00 	. 
	nop			;cc27	00 	. 
	nop			;cc28	00 	. 
	nop			;cc29	00 	. 
	nop			;cc2a	00 	. 
	nop			;cc2b	00 	. 
	nop			;cc2c	00 	. 
	nop			;cc2d	00 	. 
	nop			;cc2e	00 	. 
	nop			;cc2f	00 	. 
	nop			;cc30	00 	. 
	nop			;cc31	00 	. 
	nop			;cc32	00 	. 
	nop			;cc33	00 	. 
	nop			;cc34	00 	. 
	nop			;cc35	00 	. 
	nop			;cc36	00 	. 
	nop			;cc37	00 	. 
	nop			;cc38	00 	. 
	nop			;cc39	00 	. 
	nop			;cc3a	00 	. 
	nop			;cc3b	00 	. 
	nop			;cc3c	00 	. 
	nop			;cc3d	00 	. 
	nop			;cc3e	00 	. 
	nop			;cc3f	00 	. 
	nop			;cc40	00 	. 
	nop			;cc41	00 	. 
	nop			;cc42	00 	. 
	nop			;cc43	00 	. 
	nop			;cc44	00 	. 
	nop			;cc45	00 	. 
	nop			;cc46	00 	. 
	nop			;cc47	00 	. 
	nop			;cc48	00 	. 
	nop			;cc49	00 	. 
	nop			;cc4a	00 	. 
	nop			;cc4b	00 	. 
	nop			;cc4c	00 	. 
	nop			;cc4d	00 	. 
	nop			;cc4e	00 	. 
	nop			;cc4f	00 	. 
	nop			;cc50	00 	. 
	nop			;cc51	00 	. 
	nop			;cc52	00 	. 
	nop			;cc53	00 	. 
	nop			;cc54	00 	. 
	nop			;cc55	00 	. 
	nop			;cc56	00 	. 
	nop			;cc57	00 	. 
	nop			;cc58	00 	. 
	nop			;cc59	00 	. 
	nop			;cc5a	00 	. 
	nop			;cc5b	00 	. 
	nop			;cc5c	00 	. 
	nop			;cc5d	00 	. 
	nop			;cc5e	00 	. 
	nop			;cc5f	00 	. 
	nop			;cc60	00 	. 
	nop			;cc61	00 	. 
	nop			;cc62	00 	. 
	nop			;cc63	00 	. 
	nop			;cc64	00 	. 
	nop			;cc65	00 	. 
	nop			;cc66	00 	. 
	nop			;cc67	00 	. 
	nop			;cc68	00 	. 
	nop			;cc69	00 	. 
	nop			;cc6a	00 	. 
	nop			;cc6b	00 	. 
	nop			;cc6c	00 	. 
	nop			;cc6d	00 	. 
	nop			;cc6e	00 	. 
	nop			;cc6f	00 	. 
	nop			;cc70	00 	. 
	nop			;cc71	00 	. 
	nop			;cc72	00 	. 
	nop			;cc73	00 	. 
	nop			;cc74	00 	. 
	nop			;cc75	00 	. 
	nop			;cc76	00 	. 
	nop			;cc77	00 	. 
	nop			;cc78	00 	. 
	nop			;cc79	00 	. 
	nop			;cc7a	00 	. 
	nop			;cc7b	00 	. 
	nop			;cc7c	00 	. 
	nop			;cc7d	00 	. 
	nop			;cc7e	00 	. 
	nop			;cc7f	00 	. 
	nop			;cc80	00 	. 
	nop			;cc81	00 	. 
	nop			;cc82	00 	. 
	nop			;cc83	00 	. 
	nop			;cc84	00 	. 
	nop			;cc85	00 	. 
	nop			;cc86	00 	. 
	nop			;cc87	00 	. 
	nop			;cc88	00 	. 
	nop			;cc89	00 	. 
	nop			;cc8a	00 	. 
	nop			;cc8b	00 	. 
	nop			;cc8c	00 	. 
	nop			;cc8d	00 	. 
	nop			;cc8e	00 	. 
	nop			;cc8f	00 	. 
	nop			;cc90	00 	. 
	nop			;cc91	00 	. 
	nop			;cc92	00 	. 
	nop			;cc93	00 	. 
	nop			;cc94	00 	. 
	nop			;cc95	00 	. 
	nop			;cc96	00 	. 
	nop			;cc97	00 	. 
	nop			;cc98	00 	. 
	nop			;cc99	00 	. 
	nop			;cc9a	00 	. 
	nop			;cc9b	00 	. 
	nop			;cc9c	00 	. 
	nop			;cc9d	00 	. 
	nop			;cc9e	00 	. 
	nop			;cc9f	00 	. 
	nop			;cca0	00 	. 
	nop			;cca1	00 	. 
	nop			;cca2	00 	. 
	nop			;cca3	00 	. 
	nop			;cca4	00 	. 
	nop			;cca5	00 	. 
	nop			;cca6	00 	. 
	nop			;cca7	00 	. 
	nop			;cca8	00 	. 
	nop			;cca9	00 	. 
	nop			;ccaa	00 	. 
	nop			;ccab	00 	. 
	nop			;ccac	00 	. 
	nop			;ccad	00 	. 
	nop			;ccae	00 	. 
	nop			;ccaf	00 	. 
	nop			;ccb0	00 	. 
	nop			;ccb1	00 	. 
	nop			;ccb2	00 	. 
	nop			;ccb3	00 	. 
	nop			;ccb4	00 	. 
	nop			;ccb5	00 	. 
	nop			;ccb6	00 	. 
	nop			;ccb7	00 	. 
	nop			;ccb8	00 	. 
	nop			;ccb9	00 	. 
	nop			;ccba	00 	. 
	nop			;ccbb	00 	. 
	nop			;ccbc	00 	. 
	nop			;ccbd	00 	. 
	nop			;ccbe	00 	. 
	nop			;ccbf	00 	. 
	nop			;ccc0	00 	. 
	nop			;ccc1	00 	. 
	nop			;ccc2	00 	. 
	nop			;ccc3	00 	. 
	nop			;ccc4	00 	. 
	nop			;ccc5	00 	. 
	nop			;ccc6	00 	. 
	nop			;ccc7	00 	. 
	nop			;ccc8	00 	. 
	nop			;ccc9	00 	. 
	nop			;ccca	00 	. 
	nop			;cccb	00 	. 
	nop			;cccc	00 	. 
	nop			;cccd	00 	. 
	nop			;ccce	00 	. 
	nop			;cccf	00 	. 
	nop			;ccd0	00 	. 
	nop			;ccd1	00 	. 
	nop			;ccd2	00 	. 
	nop			;ccd3	00 	. 
	nop			;ccd4	00 	. 
	nop			;ccd5	00 	. 
	nop			;ccd6	00 	. 
	nop			;ccd7	00 	. 
	nop			;ccd8	00 	. 
	nop			;ccd9	00 	. 
	nop			;ccda	00 	. 
	nop			;ccdb	00 	. 
	nop			;ccdc	00 	. 
	nop			;ccdd	00 	. 
	nop			;ccde	00 	. 
	nop			;ccdf	00 	. 
	nop			;cce0	00 	. 
	nop			;cce1	00 	. 
	nop			;cce2	00 	. 
	nop			;cce3	00 	. 
	nop			;cce4	00 	. 
	nop			;cce5	00 	. 
	nop			;cce6	00 	. 
	nop			;cce7	00 	. 
	nop			;cce8	00 	. 
	nop			;cce9	00 	. 
	nop			;ccea	00 	. 
	nop			;cceb	00 	. 
	nop			;ccec	00 	. 
	nop			;cced	00 	. 
	nop			;ccee	00 	. 
	nop			;ccef	00 	. 
	nop			;ccf0	00 	. 
	nop			;ccf1	00 	. 
	nop			;ccf2	00 	. 
	nop			;ccf3	00 	. 
	nop			;ccf4	00 	. 
	nop			;ccf5	00 	. 
	nop			;ccf6	00 	. 
	nop			;ccf7	00 	. 
	nop			;ccf8	00 	. 
	nop			;ccf9	00 	. 
	nop			;ccfa	00 	. 
	nop			;ccfb	00 	. 
	nop			;ccfc	00 	. 
	nop			;ccfd	00 	. 
	nop			;ccfe	00 	. 
	nop			;ccff	00 	. 
	nop			;cd00	00 	. 
	nop			;cd01	00 	. 
	nop			;cd02	00 	. 
	nop			;cd03	00 	. 
	nop			;cd04	00 	. 
	nop			;cd05	00 	. 
	nop			;cd06	00 	. 
	nop			;cd07	00 	. 
	nop			;cd08	00 	. 
	nop			;cd09	00 	. 
	nop			;cd0a	00 	. 
	nop			;cd0b	00 	. 
	nop			;cd0c	00 	. 
	nop			;cd0d	00 	. 
	nop			;cd0e	00 	. 
	nop			;cd0f	00 	. 
	nop			;cd10	00 	. 
	nop			;cd11	00 	. 
	nop			;cd12	00 	. 
	nop			;cd13	00 	. 
	nop			;cd14	00 	. 
	nop			;cd15	00 	. 
	nop			;cd16	00 	. 
	nop			;cd17	00 	. 
	nop			;cd18	00 	. 
	nop			;cd19	00 	. 
	nop			;cd1a	00 	. 
	nop			;cd1b	00 	. 
	nop			;cd1c	00 	. 
	nop			;cd1d	00 	. 
	nop			;cd1e	00 	. 
	nop			;cd1f	00 	. 
	nop			;cd20	00 	. 
	nop			;cd21	00 	. 
	nop			;cd22	00 	. 
	nop			;cd23	00 	. 
	nop			;cd24	00 	. 
	nop			;cd25	00 	. 
	nop			;cd26	00 	. 
	nop			;cd27	00 	. 
	nop			;cd28	00 	. 
	nop			;cd29	00 	. 
	nop			;cd2a	00 	. 
	nop			;cd2b	00 	. 
	nop			;cd2c	00 	. 
	nop			;cd2d	00 	. 
	nop			;cd2e	00 	. 
	nop			;cd2f	00 	. 
	nop			;cd30	00 	. 
	nop			;cd31	00 	. 
	nop			;cd32	00 	. 
	nop			;cd33	00 	. 
	nop			;cd34	00 	. 
	nop			;cd35	00 	. 
	nop			;cd36	00 	. 
	nop			;cd37	00 	. 
	nop			;cd38	00 	. 
	nop			;cd39	00 	. 
	nop			;cd3a	00 	. 
	nop			;cd3b	00 	. 
	nop			;cd3c	00 	. 
	nop			;cd3d	00 	. 
	nop			;cd3e	00 	. 
	nop			;cd3f	00 	. 
	nop			;cd40	00 	. 
	nop			;cd41	00 	. 
	nop			;cd42	00 	. 
	nop			;cd43	00 	. 
	nop			;cd44	00 	. 
	nop			;cd45	00 	. 
	nop			;cd46	00 	. 
	nop			;cd47	00 	. 
	nop			;cd48	00 	. 
	nop			;cd49	00 	. 
	nop			;cd4a	00 	. 
	nop			;cd4b	00 	. 
	nop			;cd4c	00 	. 
	nop			;cd4d	00 	. 
	nop			;cd4e	00 	. 
	nop			;cd4f	00 	. 
	nop			;cd50	00 	. 
	nop			;cd51	00 	. 
	nop			;cd52	00 	. 
	nop			;cd53	00 	. 
	nop			;cd54	00 	. 
	nop			;cd55	00 	. 
	nop			;cd56	00 	. 
	nop			;cd57	00 	. 
	nop			;cd58	00 	. 
	nop			;cd59	00 	. 
	nop			;cd5a	00 	. 
	nop			;cd5b	00 	. 
	nop			;cd5c	00 	. 
	nop			;cd5d	00 	. 
	nop			;cd5e	00 	. 
	nop			;cd5f	00 	. 
	nop			;cd60	00 	. 
	nop			;cd61	00 	. 
	nop			;cd62	00 	. 
	nop			;cd63	00 	. 
	nop			;cd64	00 	. 
	nop			;cd65	00 	. 
	nop			;cd66	00 	. 
	nop			;cd67	00 	. 
	nop			;cd68	00 	. 
	nop			;cd69	00 	. 
	nop			;cd6a	00 	. 
	nop			;cd6b	00 	. 
	nop			;cd6c	00 	. 
	nop			;cd6d	00 	. 
	nop			;cd6e	00 	. 
	nop			;cd6f	00 	. 
	nop			;cd70	00 	. 
	nop			;cd71	00 	. 
	nop			;cd72	00 	. 
	nop			;cd73	00 	. 
	nop			;cd74	00 	. 
	nop			;cd75	00 	. 
	nop			;cd76	00 	. 
	nop			;cd77	00 	. 
	nop			;cd78	00 	. 
	nop			;cd79	00 	. 
	nop			;cd7a	00 	. 
	nop			;cd7b	00 	. 
	nop			;cd7c	00 	. 
	nop			;cd7d	00 	. 
	nop			;cd7e	00 	. 
	nop			;cd7f	00 	. 
	nop			;cd80	00 	. 
	nop			;cd81	00 	. 
	nop			;cd82	00 	. 
	nop			;cd83	00 	. 
	nop			;cd84	00 	. 
	nop			;cd85	00 	. 
	nop			;cd86	00 	. 
	nop			;cd87	00 	. 
	nop			;cd88	00 	. 
	nop			;cd89	00 	. 
	nop			;cd8a	00 	. 
	nop			;cd8b	00 	. 
	nop			;cd8c	00 	. 
	nop			;cd8d	00 	. 
	nop			;cd8e	00 	. 
	nop			;cd8f	00 	. 
	nop			;cd90	00 	. 
	nop			;cd91	00 	. 
	nop			;cd92	00 	. 
	nop			;cd93	00 	. 
	nop			;cd94	00 	. 
	nop			;cd95	00 	. 
	nop			;cd96	00 	. 
	nop			;cd97	00 	. 
	nop			;cd98	00 	. 
	nop			;cd99	00 	. 
	nop			;cd9a	00 	. 
	nop			;cd9b	00 	. 
	nop			;cd9c	00 	. 
	nop			;cd9d	00 	. 
	nop			;cd9e	00 	. 
	nop			;cd9f	00 	. 
	nop			;cda0	00 	. 
	nop			;cda1	00 	. 
	nop			;cda2	00 	. 
	nop			;cda3	00 	. 
	nop			;cda4	00 	. 
	nop			;cda5	00 	. 
	nop			;cda6	00 	. 
	nop			;cda7	00 	. 
	nop			;cda8	00 	. 
	nop			;cda9	00 	. 
	nop			;cdaa	00 	. 
	nop			;cdab	00 	. 
	nop			;cdac	00 	. 
	nop			;cdad	00 	. 
	nop			;cdae	00 	. 
	nop			;cdaf	00 	. 
	nop			;cdb0	00 	. 
	nop			;cdb1	00 	. 
	nop			;cdb2	00 	. 
	nop			;cdb3	00 	. 
	nop			;cdb4	00 	. 
	nop			;cdb5	00 	. 
	nop			;cdb6	00 	. 
	nop			;cdb7	00 	. 
	nop			;cdb8	00 	. 
	nop			;cdb9	00 	. 
	nop			;cdba	00 	. 
	nop			;cdbb	00 	. 
	nop			;cdbc	00 	. 
	nop			;cdbd	00 	. 
	nop			;cdbe	00 	. 
	nop			;cdbf	00 	. 
	nop			;cdc0	00 	. 
	nop			;cdc1	00 	. 
	nop			;cdc2	00 	. 
	nop			;cdc3	00 	. 
	nop			;cdc4	00 	. 
	nop			;cdc5	00 	. 
	nop			;cdc6	00 	. 
	nop			;cdc7	00 	. 
	nop			;cdc8	00 	. 
	nop			;cdc9	00 	. 
	nop			;cdca	00 	. 
	nop			;cdcb	00 	. 
	nop			;cdcc	00 	. 
	nop			;cdcd	00 	. 
	nop			;cdce	00 	. 
	nop			;cdcf	00 	. 
	nop			;cdd0	00 	. 
	nop			;cdd1	00 	. 
	nop			;cdd2	00 	. 
	nop			;cdd3	00 	. 
	nop			;cdd4	00 	. 
	nop			;cdd5	00 	. 
	nop			;cdd6	00 	. 
	nop			;cdd7	00 	. 
	nop			;cdd8	00 	. 
	nop			;cdd9	00 	. 
	nop			;cdda	00 	. 
	nop			;cddb	00 	. 
	nop			;cddc	00 	. 
	nop			;cddd	00 	. 
	nop			;cdde	00 	. 
	nop			;cddf	00 	. 
	nop			;cde0	00 	. 
	nop			;cde1	00 	. 
	nop			;cde2	00 	. 
	nop			;cde3	00 	. 
	nop			;cde4	00 	. 
	nop			;cde5	00 	. 
	nop			;cde6	00 	. 
	nop			;cde7	00 	. 
	nop			;cde8	00 	. 
	nop			;cde9	00 	. 
	nop			;cdea	00 	. 
	nop			;cdeb	00 	. 
	nop			;cdec	00 	. 
	nop			;cded	00 	. 
	nop			;cdee	00 	. 
	nop			;cdef	00 	. 
	nop			;cdf0	00 	. 
	nop			;cdf1	00 	. 
	nop			;cdf2	00 	. 
	nop			;cdf3	00 	. 
	nop			;cdf4	00 	. 
	nop			;cdf5	00 	. 
	nop			;cdf6	00 	. 
	nop			;cdf7	00 	. 
	nop			;cdf8	00 	. 
	nop			;cdf9	00 	. 
	nop			;cdfa	00 	. 
	nop			;cdfb	00 	. 
	nop			;cdfc	00 	. 
	nop			;cdfd	00 	. 
	nop			;cdfe	00 	. 
	nop			;cdff	00 	. 
	nop			;ce00	00 	. 
	nop			;ce01	00 	. 
	nop			;ce02	00 	. 
	nop			;ce03	00 	. 
	nop			;ce04	00 	. 
	nop			;ce05	00 	. 
	nop			;ce06	00 	. 
	nop			;ce07	00 	. 
	nop			;ce08	00 	. 
	nop			;ce09	00 	. 
	nop			;ce0a	00 	. 
	nop			;ce0b	00 	. 
	nop			;ce0c	00 	. 
	nop			;ce0d	00 	. 
	nop			;ce0e	00 	. 
	nop			;ce0f	00 	. 
	nop			;ce10	00 	. 
	nop			;ce11	00 	. 
	nop			;ce12	00 	. 
	nop			;ce13	00 	. 
	nop			;ce14	00 	. 
	nop			;ce15	00 	. 
	nop			;ce16	00 	. 
	nop			;ce17	00 	. 
	nop			;ce18	00 	. 
	nop			;ce19	00 	. 
	nop			;ce1a	00 	. 
	nop			;ce1b	00 	. 
	nop			;ce1c	00 	. 
	nop			;ce1d	00 	. 
	nop			;ce1e	00 	. 
	nop			;ce1f	00 	. 
	nop			;ce20	00 	. 
	nop			;ce21	00 	. 
	nop			;ce22	00 	. 
	nop			;ce23	00 	. 
	nop			;ce24	00 	. 
	nop			;ce25	00 	. 
	nop			;ce26	00 	. 
	nop			;ce27	00 	. 
	nop			;ce28	00 	. 
	nop			;ce29	00 	. 
	nop			;ce2a	00 	. 
	nop			;ce2b	00 	. 
	nop			;ce2c	00 	. 
	nop			;ce2d	00 	. 
	nop			;ce2e	00 	. 
	nop			;ce2f	00 	. 
	nop			;ce30	00 	. 
	nop			;ce31	00 	. 
	nop			;ce32	00 	. 
	nop			;ce33	00 	. 
	nop			;ce34	00 	. 
	nop			;ce35	00 	. 
	nop			;ce36	00 	. 
	nop			;ce37	00 	. 
	nop			;ce38	00 	. 
	nop			;ce39	00 	. 
	nop			;ce3a	00 	. 
	nop			;ce3b	00 	. 
	nop			;ce3c	00 	. 
	nop			;ce3d	00 	. 
	nop			;ce3e	00 	. 
	nop			;ce3f	00 	. 
	nop			;ce40	00 	. 
	nop			;ce41	00 	. 
	nop			;ce42	00 	. 
	nop			;ce43	00 	. 
	nop			;ce44	00 	. 
	nop			;ce45	00 	. 
	nop			;ce46	00 	. 
	nop			;ce47	00 	. 
	nop			;ce48	00 	. 
	nop			;ce49	00 	. 
	nop			;ce4a	00 	. 
	nop			;ce4b	00 	. 
	nop			;ce4c	00 	. 
	nop			;ce4d	00 	. 
	nop			;ce4e	00 	. 
	nop			;ce4f	00 	. 
	nop			;ce50	00 	. 
	nop			;ce51	00 	. 
	nop			;ce52	00 	. 
	nop			;ce53	00 	. 
	nop			;ce54	00 	. 
	nop			;ce55	00 	. 
	nop			;ce56	00 	. 
	nop			;ce57	00 	. 
	nop			;ce58	00 	. 
	nop			;ce59	00 	. 
	nop			;ce5a	00 	. 
	nop			;ce5b	00 	. 
	nop			;ce5c	00 	. 
	nop			;ce5d	00 	. 
	nop			;ce5e	00 	. 
	nop			;ce5f	00 	. 
	nop			;ce60	00 	. 
	nop			;ce61	00 	. 
	nop			;ce62	00 	. 
	nop			;ce63	00 	. 
	nop			;ce64	00 	. 
	nop			;ce65	00 	. 
	nop			;ce66	00 	. 
	nop			;ce67	00 	. 
	nop			;ce68	00 	. 
	nop			;ce69	00 	. 
	nop			;ce6a	00 	. 
	nop			;ce6b	00 	. 
	nop			;ce6c	00 	. 
	nop			;ce6d	00 	. 
	nop			;ce6e	00 	. 
	nop			;ce6f	00 	. 
	nop			;ce70	00 	. 
	nop			;ce71	00 	. 
	nop			;ce72	00 	. 
	nop			;ce73	00 	. 
	nop			;ce74	00 	. 
	nop			;ce75	00 	. 
	nop			;ce76	00 	. 
	nop			;ce77	00 	. 
	nop			;ce78	00 	. 
	nop			;ce79	00 	. 
	nop			;ce7a	00 	. 
	nop			;ce7b	00 	. 
	nop			;ce7c	00 	. 
	nop			;ce7d	00 	. 
	nop			;ce7e	00 	. 
	nop			;ce7f	00 	. 
	nop			;ce80	00 	. 
	nop			;ce81	00 	. 
	nop			;ce82	00 	. 
	nop			;ce83	00 	. 
	nop			;ce84	00 	. 
	nop			;ce85	00 	. 
	nop			;ce86	00 	. 
	nop			;ce87	00 	. 
	nop			;ce88	00 	. 
	nop			;ce89	00 	. 
	nop			;ce8a	00 	. 
	nop			;ce8b	00 	. 
	nop			;ce8c	00 	. 
	nop			;ce8d	00 	. 
	nop			;ce8e	00 	. 
	nop			;ce8f	00 	. 
	nop			;ce90	00 	. 
	nop			;ce91	00 	. 
	nop			;ce92	00 	. 
	nop			;ce93	00 	. 
	nop			;ce94	00 	. 
	nop			;ce95	00 	. 
	nop			;ce96	00 	. 
	nop			;ce97	00 	. 
	nop			;ce98	00 	. 
	nop			;ce99	00 	. 
	nop			;ce9a	00 	. 
	nop			;ce9b	00 	. 
	nop			;ce9c	00 	. 
	nop			;ce9d	00 	. 
	nop			;ce9e	00 	. 
	nop			;ce9f	00 	. 
	nop			;cea0	00 	. 
	nop			;cea1	00 	. 
	nop			;cea2	00 	. 
	nop			;cea3	00 	. 
	nop			;cea4	00 	. 
	nop			;cea5	00 	. 
	nop			;cea6	00 	. 
	nop			;cea7	00 	. 
	nop			;cea8	00 	. 
	nop			;cea9	00 	. 
	nop			;ceaa	00 	. 
	nop			;ceab	00 	. 
	nop			;ceac	00 	. 
	nop			;cead	00 	. 
	nop			;ceae	00 	. 
	nop			;ceaf	00 	. 
	nop			;ceb0	00 	. 
	nop			;ceb1	00 	. 
	nop			;ceb2	00 	. 
	nop			;ceb3	00 	. 
	nop			;ceb4	00 	. 
	nop			;ceb5	00 	. 
	nop			;ceb6	00 	. 
	nop			;ceb7	00 	. 
	nop			;ceb8	00 	. 
	nop			;ceb9	00 	. 
	nop			;ceba	00 	. 
	nop			;cebb	00 	. 
	nop			;cebc	00 	. 
	nop			;cebd	00 	. 
	nop			;cebe	00 	. 
	nop			;cebf	00 	. 
	nop			;cec0	00 	. 
	nop			;cec1	00 	. 
	nop			;cec2	00 	. 
	nop			;cec3	00 	. 
	nop			;cec4	00 	. 
	nop			;cec5	00 	. 
	nop			;cec6	00 	. 
	nop			;cec7	00 	. 
	nop			;cec8	00 	. 
	nop			;cec9	00 	. 
	nop			;ceca	00 	. 
	nop			;cecb	00 	. 
	nop			;cecc	00 	. 
	nop			;cecd	00 	. 
	nop			;cece	00 	. 
	nop			;cecf	00 	. 
	nop			;ced0	00 	. 
	nop			;ced1	00 	. 
	nop			;ced2	00 	. 
	nop			;ced3	00 	. 
	nop			;ced4	00 	. 
	nop			;ced5	00 	. 
	nop			;ced6	00 	. 
	nop			;ced7	00 	. 
	nop			;ced8	00 	. 
	nop			;ced9	00 	. 
	nop			;ceda	00 	. 
	nop			;cedb	00 	. 
	nop			;cedc	00 	. 
	nop			;cedd	00 	. 
	nop			;cede	00 	. 
	nop			;cedf	00 	. 
	nop			;cee0	00 	. 
	nop			;cee1	00 	. 
	nop			;cee2	00 	. 
	nop			;cee3	00 	. 
	nop			;cee4	00 	. 
	nop			;cee5	00 	. 
	nop			;cee6	00 	. 
	nop			;cee7	00 	. 
	nop			;cee8	00 	. 
	nop			;cee9	00 	. 
	nop			;ceea	00 	. 
	nop			;ceeb	00 	. 
	nop			;ceec	00 	. 
	nop			;ceed	00 	. 
	nop			;ceee	00 	. 
	nop			;ceef	00 	. 
	nop			;cef0	00 	. 
	nop			;cef1	00 	. 
	nop			;cef2	00 	. 
	nop			;cef3	00 	. 
	nop			;cef4	00 	. 
	nop			;cef5	00 	. 
	nop			;cef6	00 	. 
	nop			;cef7	00 	. 
	nop			;cef8	00 	. 
	nop			;cef9	00 	. 
	nop			;cefa	00 	. 
	nop			;cefb	00 	. 
	nop			;cefc	00 	. 
	nop			;cefd	00 	. 
	nop			;cefe	00 	. 
	nop			;ceff	00 	. 
	nop			;cf00	00 	. 
	nop			;cf01	00 	. 
	nop			;cf02	00 	. 
	nop			;cf03	00 	. 
	nop			;cf04	00 	. 
	nop			;cf05	00 	. 
	nop			;cf06	00 	. 
	nop			;cf07	00 	. 
	nop			;cf08	00 	. 
	nop			;cf09	00 	. 
	nop			;cf0a	00 	. 
	nop			;cf0b	00 	. 
	nop			;cf0c	00 	. 
	nop			;cf0d	00 	. 
	nop			;cf0e	00 	. 
	nop			;cf0f	00 	. 
	nop			;cf10	00 	. 
	nop			;cf11	00 	. 
	nop			;cf12	00 	. 
	nop			;cf13	00 	. 
	nop			;cf14	00 	. 
	nop			;cf15	00 	. 
	nop			;cf16	00 	. 
	nop			;cf17	00 	. 
	nop			;cf18	00 	. 
	nop			;cf19	00 	. 
	nop			;cf1a	00 	. 
	nop			;cf1b	00 	. 
	nop			;cf1c	00 	. 
	nop			;cf1d	00 	. 
	nop			;cf1e	00 	. 
	nop			;cf1f	00 	. 
	nop			;cf20	00 	. 
	nop			;cf21	00 	. 
	nop			;cf22	00 	. 
	nop			;cf23	00 	. 
	nop			;cf24	00 	. 
	nop			;cf25	00 	. 
	nop			;cf26	00 	. 
	nop			;cf27	00 	. 
	nop			;cf28	00 	. 
	nop			;cf29	00 	. 
	nop			;cf2a	00 	. 
	nop			;cf2b	00 	. 
	nop			;cf2c	00 	. 
	nop			;cf2d	00 	. 
	nop			;cf2e	00 	. 
	nop			;cf2f	00 	. 
	nop			;cf30	00 	. 
	nop			;cf31	00 	. 
	nop			;cf32	00 	. 
	nop			;cf33	00 	. 
	nop			;cf34	00 	. 
	nop			;cf35	00 	. 
	nop			;cf36	00 	. 
	nop			;cf37	00 	. 
	nop			;cf38	00 	. 
	nop			;cf39	00 	. 
	nop			;cf3a	00 	. 
	nop			;cf3b	00 	. 
	nop			;cf3c	00 	. 
	nop			;cf3d	00 	. 
	nop			;cf3e	00 	. 
	nop			;cf3f	00 	. 
	nop			;cf40	00 	. 
	nop			;cf41	00 	. 
	nop			;cf42	00 	. 
	nop			;cf43	00 	. 
	nop			;cf44	00 	. 
	nop			;cf45	00 	. 
	nop			;cf46	00 	. 
	nop			;cf47	00 	. 
	nop			;cf48	00 	. 
	nop			;cf49	00 	. 
	nop			;cf4a	00 	. 
	nop			;cf4b	00 	. 
	nop			;cf4c	00 	. 
	nop			;cf4d	00 	. 
	nop			;cf4e	00 	. 
	nop			;cf4f	00 	. 
	nop			;cf50	00 	. 
	nop			;cf51	00 	. 
	nop			;cf52	00 	. 
	nop			;cf53	00 	. 
	nop			;cf54	00 	. 
	nop			;cf55	00 	. 
	nop			;cf56	00 	. 
	nop			;cf57	00 	. 
	nop			;cf58	00 	. 
	nop			;cf59	00 	. 
	nop			;cf5a	00 	. 
	nop			;cf5b	00 	. 
	nop			;cf5c	00 	. 
	nop			;cf5d	00 	. 
	nop			;cf5e	00 	. 
	nop			;cf5f	00 	. 
	nop			;cf60	00 	. 
	nop			;cf61	00 	. 
	nop			;cf62	00 	. 
	nop			;cf63	00 	. 
	nop			;cf64	00 	. 
	nop			;cf65	00 	. 
	nop			;cf66	00 	. 
	nop			;cf67	00 	. 
	nop			;cf68	00 	. 
	nop			;cf69	00 	. 
	nop			;cf6a	00 	. 
	nop			;cf6b	00 	. 
	nop			;cf6c	00 	. 
	nop			;cf6d	00 	. 
	nop			;cf6e	00 	. 
	nop			;cf6f	00 	. 
	nop			;cf70	00 	. 
	nop			;cf71	00 	. 
	nop			;cf72	00 	. 
	nop			;cf73	00 	. 
	nop			;cf74	00 	. 
	nop			;cf75	00 	. 
	nop			;cf76	00 	. 
	nop			;cf77	00 	. 
	nop			;cf78	00 	. 
	nop			;cf79	00 	. 
	nop			;cf7a	00 	. 
	nop			;cf7b	00 	. 
	nop			;cf7c	00 	. 
	nop			;cf7d	00 	. 
	nop			;cf7e	00 	. 
	nop			;cf7f	00 	. 
	nop			;cf80	00 	. 
	nop			;cf81	00 	. 
	nop			;cf82	00 	. 
	nop			;cf83	00 	. 
	nop			;cf84	00 	. 
	nop			;cf85	00 	. 
	nop			;cf86	00 	. 
	nop			;cf87	00 	. 
	nop			;cf88	00 	. 
	nop			;cf89	00 	. 
	nop			;cf8a	00 	. 
	nop			;cf8b	00 	. 
	nop			;cf8c	00 	. 
	nop			;cf8d	00 	. 
	nop			;cf8e	00 	. 
	nop			;cf8f	00 	. 
	nop			;cf90	00 	. 
	nop			;cf91	00 	. 
	nop			;cf92	00 	. 
	nop			;cf93	00 	. 
	nop			;cf94	00 	. 
	nop			;cf95	00 	. 
	nop			;cf96	00 	. 
	nop			;cf97	00 	. 
	nop			;cf98	00 	. 
	nop			;cf99	00 	. 
	nop			;cf9a	00 	. 
	nop			;cf9b	00 	. 
	nop			;cf9c	00 	. 
	nop			;cf9d	00 	. 
	nop			;cf9e	00 	. 
	nop			;cf9f	00 	. 
	nop			;cfa0	00 	. 
	nop			;cfa1	00 	. 
	nop			;cfa2	00 	. 
	nop			;cfa3	00 	. 
	nop			;cfa4	00 	. 
	nop			;cfa5	00 	. 
	nop			;cfa6	00 	. 
	nop			;cfa7	00 	. 
	nop			;cfa8	00 	. 
	nop			;cfa9	00 	. 
	nop			;cfaa	00 	. 
	nop			;cfab	00 	. 
	nop			;cfac	00 	. 
	nop			;cfad	00 	. 
	nop			;cfae	00 	. 
	nop			;cfaf	00 	. 
	nop			;cfb0	00 	. 
	nop			;cfb1	00 	. 
	nop			;cfb2	00 	. 
	nop			;cfb3	00 	. 
	nop			;cfb4	00 	. 
	nop			;cfb5	00 	. 
	nop			;cfb6	00 	. 
	nop			;cfb7	00 	. 
	nop			;cfb8	00 	. 
	nop			;cfb9	00 	. 
	nop			;cfba	00 	. 
	nop			;cfbb	00 	. 
	nop			;cfbc	00 	. 
	nop			;cfbd	00 	. 
	nop			;cfbe	00 	. 
	nop			;cfbf	00 	. 
	nop			;cfc0	00 	. 
	nop			;cfc1	00 	. 
	nop			;cfc2	00 	. 
	nop			;cfc3	00 	. 
	nop			;cfc4	00 	. 
	nop			;cfc5	00 	. 
	nop			;cfc6	00 	. 
	nop			;cfc7	00 	. 
	nop			;cfc8	00 	. 
	nop			;cfc9	00 	. 
	nop			;cfca	00 	. 
	nop			;cfcb	00 	. 
	nop			;cfcc	00 	. 
	nop			;cfcd	00 	. 
	nop			;cfce	00 	. 
	nop			;cfcf	00 	. 
	nop			;cfd0	00 	. 
	nop			;cfd1	00 	. 
	nop			;cfd2	00 	. 
	nop			;cfd3	00 	. 
	nop			;cfd4	00 	. 
	nop			;cfd5	00 	. 
	nop			;cfd6	00 	. 
	nop			;cfd7	00 	. 
	nop			;cfd8	00 	. 
	nop			;cfd9	00 	. 
	nop			;cfda	00 	. 
	nop			;cfdb	00 	. 
	nop			;cfdc	00 	. 
	nop			;cfdd	00 	. 
	nop			;cfde	00 	. 
	nop			;cfdf	00 	. 
	nop			;cfe0	00 	. 
	nop			;cfe1	00 	. 
	nop			;cfe2	00 	. 
	nop			;cfe3	00 	. 
	nop			;cfe4	00 	. 
	nop			;cfe5	00 	. 
	nop			;cfe6	00 	. 
	nop			;cfe7	00 	. 
	nop			;cfe8	00 	. 
	nop			;cfe9	00 	. 
	nop			;cfea	00 	. 
	nop			;cfeb	00 	. 
	nop			;cfec	00 	. 
	nop			;cfed	00 	. 
	nop			;cfee	00 	. 
	nop			;cfef	00 	. 
	nop			;cff0	00 	. 
	nop			;cff1	00 	. 
	nop			;cff2	00 	. 
	nop			;cff3	00 	. 
	nop			;cff4	00 	. 
	nop			;cff5	00 	. 
	nop			;cff6	00 	. 
	nop			;cff7	00 	. 
	nop			;cff8	00 	. 
	nop			;cff9	00 	. 
	nop			;cffa	00 	. 
	nop			;cffb	00 	. 
	nop			;cffc	00 	. 
	nop			;cffd	00 	. 
	nop			;cffe	00 	. 
	nop			;cfff	00 	. 
	nop			;d000	00 	. 
	nop			;d001	00 	. 
	nop			;d002	00 	. 
	nop			;d003	00 	. 
	nop			;d004	00 	. 
	nop			;d005	00 	. 
	nop			;d006	00 	. 
	nop			;d007	00 	. 
	nop			;d008	00 	. 
	nop			;d009	00 	. 
	nop			;d00a	00 	. 
	nop			;d00b	00 	. 
	nop			;d00c	00 	. 
	nop			;d00d	00 	. 
	nop			;d00e	00 	. 
	nop			;d00f	00 	. 
	nop			;d010	00 	. 
	nop			;d011	00 	. 
	nop			;d012	00 	. 
	nop			;d013	00 	. 
	nop			;d014	00 	. 
	nop			;d015	00 	. 
	nop			;d016	00 	. 
	nop			;d017	00 	. 
	nop			;d018	00 	. 
	nop			;d019	00 	. 
	nop			;d01a	00 	. 
	nop			;d01b	00 	. 
	nop			;d01c	00 	. 
	nop			;d01d	00 	. 
	nop			;d01e	00 	. 
	nop			;d01f	00 	. 
	nop			;d020	00 	. 
	nop			;d021	00 	. 
	nop			;d022	00 	. 
	nop			;d023	00 	. 
	nop			;d024	00 	. 
	nop			;d025	00 	. 
	nop			;d026	00 	. 
	nop			;d027	00 	. 
	nop			;d028	00 	. 
	nop			;d029	00 	. 
	nop			;d02a	00 	. 
	nop			;d02b	00 	. 
	nop			;d02c	00 	. 
	nop			;d02d	00 	. 
	nop			;d02e	00 	. 
	nop			;d02f	00 	. 
	nop			;d030	00 	. 
	nop			;d031	00 	. 
	nop			;d032	00 	. 
	nop			;d033	00 	. 
	nop			;d034	00 	. 
	nop			;d035	00 	. 
	nop			;d036	00 	. 
	nop			;d037	00 	. 
	nop			;d038	00 	. 
	nop			;d039	00 	. 
	nop			;d03a	00 	. 
	nop			;d03b	00 	. 
	nop			;d03c	00 	. 
	nop			;d03d	00 	. 
	nop			;d03e	00 	. 
	nop			;d03f	00 	. 
	nop			;d040	00 	. 
	nop			;d041	00 	. 
	nop			;d042	00 	. 
	nop			;d043	00 	. 
	nop			;d044	00 	. 
	nop			;d045	00 	. 
	nop			;d046	00 	. 
	nop			;d047	00 	. 
	nop			;d048	00 	. 
	nop			;d049	00 	. 
	nop			;d04a	00 	. 
	nop			;d04b	00 	. 
	nop			;d04c	00 	. 
	nop			;d04d	00 	. 
	nop			;d04e	00 	. 
	nop			;d04f	00 	. 
	nop			;d050	00 	. 
	nop			;d051	00 	. 
	nop			;d052	00 	. 
	nop			;d053	00 	. 
	nop			;d054	00 	. 
	nop			;d055	00 	. 
	nop			;d056	00 	. 
	nop			;d057	00 	. 
	nop			;d058	00 	. 
	nop			;d059	00 	. 
	nop			;d05a	00 	. 
	nop			;d05b	00 	. 
	nop			;d05c	00 	. 
	nop			;d05d	00 	. 
	nop			;d05e	00 	. 
	nop			;d05f	00 	. 
	nop			;d060	00 	. 
	nop			;d061	00 	. 
	nop			;d062	00 	. 
	nop			;d063	00 	. 
	nop			;d064	00 	. 
	nop			;d065	00 	. 
	nop			;d066	00 	. 
	nop			;d067	00 	. 
	nop			;d068	00 	. 
	nop			;d069	00 	. 
	nop			;d06a	00 	. 
	nop			;d06b	00 	. 
	nop			;d06c	00 	. 
	nop			;d06d	00 	. 
	nop			;d06e	00 	. 
	nop			;d06f	00 	. 
	nop			;d070	00 	. 
	nop			;d071	00 	. 
	nop			;d072	00 	. 
	nop			;d073	00 	. 
	nop			;d074	00 	. 
	nop			;d075	00 	. 
	nop			;d076	00 	. 
	nop			;d077	00 	. 
	nop			;d078	00 	. 
	nop			;d079	00 	. 
	nop			;d07a	00 	. 
	nop			;d07b	00 	. 
	nop			;d07c	00 	. 
	nop			;d07d	00 	. 
	nop			;d07e	00 	. 
	nop			;d07f	00 	. 
	nop			;d080	00 	. 
	nop			;d081	00 	. 
	nop			;d082	00 	. 
	nop			;d083	00 	. 
	nop			;d084	00 	. 
	nop			;d085	00 	. 
	nop			;d086	00 	. 
	nop			;d087	00 	. 
	nop			;d088	00 	. 
	nop			;d089	00 	. 
	nop			;d08a	00 	. 
	nop			;d08b	00 	. 
	nop			;d08c	00 	. 
	nop			;d08d	00 	. 
	nop			;d08e	00 	. 
	nop			;d08f	00 	. 
	nop			;d090	00 	. 
	nop			;d091	00 	. 
	nop			;d092	00 	. 
	nop			;d093	00 	. 
	nop			;d094	00 	. 
	nop			;d095	00 	. 
	nop			;d096	00 	. 
	nop			;d097	00 	. 
	nop			;d098	00 	. 
	nop			;d099	00 	. 
	nop			;d09a	00 	. 
	nop			;d09b	00 	. 
	nop			;d09c	00 	. 
	nop			;d09d	00 	. 
	nop			;d09e	00 	. 
	nop			;d09f	00 	. 
	nop			;d0a0	00 	. 
	nop			;d0a1	00 	. 
	nop			;d0a2	00 	. 
	nop			;d0a3	00 	. 
	nop			;d0a4	00 	. 
	nop			;d0a5	00 	. 
	nop			;d0a6	00 	. 
	nop			;d0a7	00 	. 
	nop			;d0a8	00 	. 
	nop			;d0a9	00 	. 
	nop			;d0aa	00 	. 
	nop			;d0ab	00 	. 
	nop			;d0ac	00 	. 
	nop			;d0ad	00 	. 
	nop			;d0ae	00 	. 
	nop			;d0af	00 	. 
	nop			;d0b0	00 	. 
	nop			;d0b1	00 	. 
	nop			;d0b2	00 	. 
	nop			;d0b3	00 	. 
	nop			;d0b4	00 	. 
	nop			;d0b5	00 	. 
	nop			;d0b6	00 	. 
	nop			;d0b7	00 	. 
	nop			;d0b8	00 	. 
	nop			;d0b9	00 	. 
	nop			;d0ba	00 	. 
	nop			;d0bb	00 	. 
	nop			;d0bc	00 	. 
	nop			;d0bd	00 	. 
	nop			;d0be	00 	. 
	nop			;d0bf	00 	. 
	nop			;d0c0	00 	. 
	nop			;d0c1	00 	. 
	nop			;d0c2	00 	. 
	nop			;d0c3	00 	. 
	nop			;d0c4	00 	. 
	nop			;d0c5	00 	. 
	nop			;d0c6	00 	. 
	nop			;d0c7	00 	. 
	nop			;d0c8	00 	. 
	nop			;d0c9	00 	. 
	nop			;d0ca	00 	. 
	nop			;d0cb	00 	. 
	nop			;d0cc	00 	. 
	nop			;d0cd	00 	. 
	nop			;d0ce	00 	. 
	nop			;d0cf	00 	. 
	nop			;d0d0	00 	. 
	nop			;d0d1	00 	. 
	nop			;d0d2	00 	. 
	nop			;d0d3	00 	. 
	nop			;d0d4	00 	. 
	nop			;d0d5	00 	. 
	nop			;d0d6	00 	. 
	nop			;d0d7	00 	. 
	nop			;d0d8	00 	. 
	nop			;d0d9	00 	. 
	nop			;d0da	00 	. 
	nop			;d0db	00 	. 
	nop			;d0dc	00 	. 
	nop			;d0dd	00 	. 
	nop			;d0de	00 	. 
	nop			;d0df	00 	. 
	nop			;d0e0	00 	. 
	nop			;d0e1	00 	. 
	nop			;d0e2	00 	. 
	nop			;d0e3	00 	. 
	nop			;d0e4	00 	. 
	nop			;d0e5	00 	. 
	nop			;d0e6	00 	. 
	nop			;d0e7	00 	. 
	nop			;d0e8	00 	. 
	nop			;d0e9	00 	. 
	nop			;d0ea	00 	. 
	nop			;d0eb	00 	. 
	nop			;d0ec	00 	. 
	nop			;d0ed	00 	. 
	nop			;d0ee	00 	. 
	nop			;d0ef	00 	. 
	nop			;d0f0	00 	. 
	nop			;d0f1	00 	. 
	nop			;d0f2	00 	. 
	nop			;d0f3	00 	. 
	nop			;d0f4	00 	. 
	nop			;d0f5	00 	. 
	nop			;d0f6	00 	. 
	nop			;d0f7	00 	. 
	nop			;d0f8	00 	. 
	nop			;d0f9	00 	. 
	nop			;d0fa	00 	. 
	nop			;d0fb	00 	. 
	nop			;d0fc	00 	. 
	nop			;d0fd	00 	. 
	nop			;d0fe	00 	. 
	nop			;d0ff	00 	. 
	nop			;d100	00 	. 
	nop			;d101	00 	. 
	nop			;d102	00 	. 
	nop			;d103	00 	. 
	nop			;d104	00 	. 
	nop			;d105	00 	. 
	nop			;d106	00 	. 
	nop			;d107	00 	. 
	nop			;d108	00 	. 
	nop			;d109	00 	. 
	nop			;d10a	00 	. 
	nop			;d10b	00 	. 
	nop			;d10c	00 	. 
	nop			;d10d	00 	. 
	nop			;d10e	00 	. 
	nop			;d10f	00 	. 
	nop			;d110	00 	. 
	nop			;d111	00 	. 
	nop			;d112	00 	. 
	nop			;d113	00 	. 
	nop			;d114	00 	. 
	nop			;d115	00 	. 
	nop			;d116	00 	. 
	nop			;d117	00 	. 
	nop			;d118	00 	. 
	nop			;d119	00 	. 
	nop			;d11a	00 	. 
	nop			;d11b	00 	. 
	nop			;d11c	00 	. 
	nop			;d11d	00 	. 
	nop			;d11e	00 	. 
	nop			;d11f	00 	. 
	nop			;d120	00 	. 
	nop			;d121	00 	. 
	nop			;d122	00 	. 
	nop			;d123	00 	. 
	nop			;d124	00 	. 
	nop			;d125	00 	. 
	nop			;d126	00 	. 
	nop			;d127	00 	. 
	nop			;d128	00 	. 
	nop			;d129	00 	. 
	nop			;d12a	00 	. 
	nop			;d12b	00 	. 
	nop			;d12c	00 	. 
	nop			;d12d	00 	. 
	nop			;d12e	00 	. 
	nop			;d12f	00 	. 
	nop			;d130	00 	. 
	nop			;d131	00 	. 
	nop			;d132	00 	. 
	nop			;d133	00 	. 
	nop			;d134	00 	. 
	nop			;d135	00 	. 
	nop			;d136	00 	. 
	nop			;d137	00 	. 
	nop			;d138	00 	. 
	nop			;d139	00 	. 
	nop			;d13a	00 	. 
	nop			;d13b	00 	. 
	nop			;d13c	00 	. 
	nop			;d13d	00 	. 
	nop			;d13e	00 	. 
	nop			;d13f	00 	. 
	nop			;d140	00 	. 
	nop			;d141	00 	. 
	nop			;d142	00 	. 
	nop			;d143	00 	. 
	nop			;d144	00 	. 
	nop			;d145	00 	. 
	nop			;d146	00 	. 
	nop			;d147	00 	. 
	nop			;d148	00 	. 
	nop			;d149	00 	. 
	nop			;d14a	00 	. 
	nop			;d14b	00 	. 
	nop			;d14c	00 	. 
	nop			;d14d	00 	. 
	nop			;d14e	00 	. 
	nop			;d14f	00 	. 
	nop			;d150	00 	. 
	nop			;d151	00 	. 
	nop			;d152	00 	. 
	nop			;d153	00 	. 
	nop			;d154	00 	. 
	nop			;d155	00 	. 
	nop			;d156	00 	. 
	nop			;d157	00 	. 
	nop			;d158	00 	. 
	nop			;d159	00 	. 
	nop			;d15a	00 	. 
	nop			;d15b	00 	. 
	nop			;d15c	00 	. 
	nop			;d15d	00 	. 
	nop			;d15e	00 	. 
	nop			;d15f	00 	. 
	nop			;d160	00 	. 
	nop			;d161	00 	. 
	nop			;d162	00 	. 
	nop			;d163	00 	. 
	nop			;d164	00 	. 
	nop			;d165	00 	. 
	nop			;d166	00 	. 
	nop			;d167	00 	. 
	nop			;d168	00 	. 
	nop			;d169	00 	. 
	nop			;d16a	00 	. 
	nop			;d16b	00 	. 
	nop			;d16c	00 	. 
	nop			;d16d	00 	. 
	nop			;d16e	00 	. 
	nop			;d16f	00 	. 
	nop			;d170	00 	. 
	nop			;d171	00 	. 
	nop			;d172	00 	. 
	nop			;d173	00 	. 
	nop			;d174	00 	. 
	nop			;d175	00 	. 
	nop			;d176	00 	. 
	nop			;d177	00 	. 
	nop			;d178	00 	. 
	nop			;d179	00 	. 
	nop			;d17a	00 	. 
	nop			;d17b	00 	. 
	nop			;d17c	00 	. 
	nop			;d17d	00 	. 
	nop			;d17e	00 	. 
	nop			;d17f	00 	. 
	nop			;d180	00 	. 
	nop			;d181	00 	. 
	nop			;d182	00 	. 
	nop			;d183	00 	. 
	nop			;d184	00 	. 
	nop			;d185	00 	. 
	nop			;d186	00 	. 
	nop			;d187	00 	. 
	nop			;d188	00 	. 
	nop			;d189	00 	. 
	nop			;d18a	00 	. 
	nop			;d18b	00 	. 
	nop			;d18c	00 	. 
	nop			;d18d	00 	. 
	nop			;d18e	00 	. 
	nop			;d18f	00 	. 
	nop			;d190	00 	. 
	nop			;d191	00 	. 
	nop			;d192	00 	. 
	nop			;d193	00 	. 
	nop			;d194	00 	. 
	nop			;d195	00 	. 
	nop			;d196	00 	. 
	nop			;d197	00 	. 
	nop			;d198	00 	. 
	nop			;d199	00 	. 
	nop			;d19a	00 	. 
	nop			;d19b	00 	. 
	nop			;d19c	00 	. 
	nop			;d19d	00 	. 
	nop			;d19e	00 	. 
	nop			;d19f	00 	. 
	nop			;d1a0	00 	. 
	nop			;d1a1	00 	. 
	nop			;d1a2	00 	. 
	nop			;d1a3	00 	. 
	nop			;d1a4	00 	. 
	nop			;d1a5	00 	. 
	nop			;d1a6	00 	. 
	nop			;d1a7	00 	. 
	nop			;d1a8	00 	. 
	nop			;d1a9	00 	. 
	nop			;d1aa	00 	. 
	nop			;d1ab	00 	. 
	nop			;d1ac	00 	. 
	nop			;d1ad	00 	. 
	nop			;d1ae	00 	. 
	nop			;d1af	00 	. 
	nop			;d1b0	00 	. 
	nop			;d1b1	00 	. 
	nop			;d1b2	00 	. 
	nop			;d1b3	00 	. 
	nop			;d1b4	00 	. 
	nop			;d1b5	00 	. 
	nop			;d1b6	00 	. 
	nop			;d1b7	00 	. 
	nop			;d1b8	00 	. 
	nop			;d1b9	00 	. 
	nop			;d1ba	00 	. 
	nop			;d1bb	00 	. 
	nop			;d1bc	00 	. 
	nop			;d1bd	00 	. 
	nop			;d1be	00 	. 
	nop			;d1bf	00 	. 
	nop			;d1c0	00 	. 
	nop			;d1c1	00 	. 
	nop			;d1c2	00 	. 
	nop			;d1c3	00 	. 
	nop			;d1c4	00 	. 
	nop			;d1c5	00 	. 
	nop			;d1c6	00 	. 
	nop			;d1c7	00 	. 
	nop			;d1c8	00 	. 
	nop			;d1c9	00 	. 
	nop			;d1ca	00 	. 
	nop			;d1cb	00 	. 
	nop			;d1cc	00 	. 
	nop			;d1cd	00 	. 
	nop			;d1ce	00 	. 
	nop			;d1cf	00 	. 
	nop			;d1d0	00 	. 
	nop			;d1d1	00 	. 
	nop			;d1d2	00 	. 
	nop			;d1d3	00 	. 
	nop			;d1d4	00 	. 
	nop			;d1d5	00 	. 
	nop			;d1d6	00 	. 
	nop			;d1d7	00 	. 
	nop			;d1d8	00 	. 
	nop			;d1d9	00 	. 
	nop			;d1da	00 	. 
	nop			;d1db	00 	. 
	nop			;d1dc	00 	. 
	nop			;d1dd	00 	. 
	nop			;d1de	00 	. 
	nop			;d1df	00 	. 
	nop			;d1e0	00 	. 
	nop			;d1e1	00 	. 
	nop			;d1e2	00 	. 
	nop			;d1e3	00 	. 
	nop			;d1e4	00 	. 
	nop			;d1e5	00 	. 
	nop			;d1e6	00 	. 
	nop			;d1e7	00 	. 
	nop			;d1e8	00 	. 
	nop			;d1e9	00 	. 
	nop			;d1ea	00 	. 
	nop			;d1eb	00 	. 
	nop			;d1ec	00 	. 
	nop			;d1ed	00 	. 
	nop			;d1ee	00 	. 
	nop			;d1ef	00 	. 
	nop			;d1f0	00 	. 
	nop			;d1f1	00 	. 
	nop			;d1f2	00 	. 
	nop			;d1f3	00 	. 
	nop			;d1f4	00 	. 
	nop			;d1f5	00 	. 
	nop			;d1f6	00 	. 
	nop			;d1f7	00 	. 
	nop			;d1f8	00 	. 
	nop			;d1f9	00 	. 
	nop			;d1fa	00 	. 
	nop			;d1fb	00 	. 
	nop			;d1fc	00 	. 
	nop			;d1fd	00 	. 
	nop			;d1fe	00 	. 
	nop			;d1ff	00 	. 
	nop			;d200	00 	. 
	nop			;d201	00 	. 
	nop			;d202	00 	. 
	nop			;d203	00 	. 
	nop			;d204	00 	. 
	nop			;d205	00 	. 
	nop			;d206	00 	. 
	nop			;d207	00 	. 
	nop			;d208	00 	. 
	nop			;d209	00 	. 
	nop			;d20a	00 	. 
	nop			;d20b	00 	. 
	nop			;d20c	00 	. 
	nop			;d20d	00 	. 
	nop			;d20e	00 	. 
	nop			;d20f	00 	. 
	nop			;d210	00 	. 
	nop			;d211	00 	. 
	nop			;d212	00 	. 
	nop			;d213	00 	. 
	nop			;d214	00 	. 
	nop			;d215	00 	. 
	nop			;d216	00 	. 
	nop			;d217	00 	. 
	nop			;d218	00 	. 
	nop			;d219	00 	. 
	nop			;d21a	00 	. 
	nop			;d21b	00 	. 
	nop			;d21c	00 	. 
	nop			;d21d	00 	. 
	nop			;d21e	00 	. 
	nop			;d21f	00 	. 
	nop			;d220	00 	. 
	nop			;d221	00 	. 
	nop			;d222	00 	. 
	nop			;d223	00 	. 
	nop			;d224	00 	. 
	nop			;d225	00 	. 
	nop			;d226	00 	. 
	nop			;d227	00 	. 
	nop			;d228	00 	. 
	nop			;d229	00 	. 
	nop			;d22a	00 	. 
	nop			;d22b	00 	. 
	nop			;d22c	00 	. 
	nop			;d22d	00 	. 
	nop			;d22e	00 	. 
	nop			;d22f	00 	. 
	nop			;d230	00 	. 
	nop			;d231	00 	. 
	nop			;d232	00 	. 
	nop			;d233	00 	. 
	nop			;d234	00 	. 
	nop			;d235	00 	. 
	nop			;d236	00 	. 
	nop			;d237	00 	. 
	nop			;d238	00 	. 
	nop			;d239	00 	. 
	nop			;d23a	00 	. 
	nop			;d23b	00 	. 
	nop			;d23c	00 	. 
	nop			;d23d	00 	. 
	nop			;d23e	00 	. 
	nop			;d23f	00 	. 
	nop			;d240	00 	. 
	nop			;d241	00 	. 
	nop			;d242	00 	. 
	nop			;d243	00 	. 
	nop			;d244	00 	. 
	nop			;d245	00 	. 
	nop			;d246	00 	. 
	nop			;d247	00 	. 
	nop			;d248	00 	. 
	nop			;d249	00 	. 
	nop			;d24a	00 	. 
	nop			;d24b	00 	. 
	nop			;d24c	00 	. 
	nop			;d24d	00 	. 
	nop			;d24e	00 	. 
	nop			;d24f	00 	. 
	nop			;d250	00 	. 
	nop			;d251	00 	. 
	nop			;d252	00 	. 
	nop			;d253	00 	. 
	nop			;d254	00 	. 
	nop			;d255	00 	. 
	nop			;d256	00 	. 
	nop			;d257	00 	. 
	nop			;d258	00 	. 
	nop			;d259	00 	. 
	nop			;d25a	00 	. 
	nop			;d25b	00 	. 
	nop			;d25c	00 	. 
	nop			;d25d	00 	. 
	nop			;d25e	00 	. 
	nop			;d25f	00 	. 
	nop			;d260	00 	. 
	nop			;d261	00 	. 
	nop			;d262	00 	. 
	nop			;d263	00 	. 
	nop			;d264	00 	. 
	nop			;d265	00 	. 
	nop			;d266	00 	. 
	nop			;d267	00 	. 
	nop			;d268	00 	. 
	nop			;d269	00 	. 
	nop			;d26a	00 	. 
	nop			;d26b	00 	. 
	nop			;d26c	00 	. 
	nop			;d26d	00 	. 
	nop			;d26e	00 	. 
	nop			;d26f	00 	. 
	nop			;d270	00 	. 
	nop			;d271	00 	. 
	nop			;d272	00 	. 
	nop			;d273	00 	. 
	nop			;d274	00 	. 
	nop			;d275	00 	. 
	nop			;d276	00 	. 
	nop			;d277	00 	. 
	nop			;d278	00 	. 
	nop			;d279	00 	. 
	nop			;d27a	00 	. 
	nop			;d27b	00 	. 
	nop			;d27c	00 	. 
	nop			;d27d	00 	. 
	nop			;d27e	00 	. 
	nop			;d27f	00 	. 
	nop			;d280	00 	. 
	nop			;d281	00 	. 
	nop			;d282	00 	. 
	nop			;d283	00 	. 
	nop			;d284	00 	. 
	nop			;d285	00 	. 
	nop			;d286	00 	. 
	nop			;d287	00 	. 
	nop			;d288	00 	. 
	nop			;d289	00 	. 
	nop			;d28a	00 	. 
	nop			;d28b	00 	. 
	nop			;d28c	00 	. 
	nop			;d28d	00 	. 
	nop			;d28e	00 	. 
	nop			;d28f	00 	. 
	nop			;d290	00 	. 
	nop			;d291	00 	. 
	nop			;d292	00 	. 
	nop			;d293	00 	. 
	nop			;d294	00 	. 
	nop			;d295	00 	. 
	nop			;d296	00 	. 
	nop			;d297	00 	. 
	nop			;d298	00 	. 
	nop			;d299	00 	. 
	nop			;d29a	00 	. 
	nop			;d29b	00 	. 
	nop			;d29c	00 	. 
	nop			;d29d	00 	. 
	nop			;d29e	00 	. 
	nop			;d29f	00 	. 
	nop			;d2a0	00 	. 
	nop			;d2a1	00 	. 
	nop			;d2a2	00 	. 
	nop			;d2a3	00 	. 
	nop			;d2a4	00 	. 
	nop			;d2a5	00 	. 
	nop			;d2a6	00 	. 
	nop			;d2a7	00 	. 
	nop			;d2a8	00 	. 
	nop			;d2a9	00 	. 
	nop			;d2aa	00 	. 
	nop			;d2ab	00 	. 
	nop			;d2ac	00 	. 
	nop			;d2ad	00 	. 
	nop			;d2ae	00 	. 
	nop			;d2af	00 	. 
	nop			;d2b0	00 	. 
	nop			;d2b1	00 	. 
	nop			;d2b2	00 	. 
	nop			;d2b3	00 	. 
	nop			;d2b4	00 	. 
	nop			;d2b5	00 	. 
	nop			;d2b6	00 	. 
	nop			;d2b7	00 	. 
	nop			;d2b8	00 	. 
	nop			;d2b9	00 	. 
	nop			;d2ba	00 	. 
	nop			;d2bb	00 	. 
	nop			;d2bc	00 	. 
	nop			;d2bd	00 	. 
	nop			;d2be	00 	. 
	nop			;d2bf	00 	. 
	nop			;d2c0	00 	. 
	nop			;d2c1	00 	. 
	nop			;d2c2	00 	. 
	nop			;d2c3	00 	. 
	nop			;d2c4	00 	. 
	nop			;d2c5	00 	. 
	nop			;d2c6	00 	. 
	nop			;d2c7	00 	. 
	nop			;d2c8	00 	. 
	nop			;d2c9	00 	. 
	nop			;d2ca	00 	. 
	nop			;d2cb	00 	. 
	nop			;d2cc	00 	. 
	nop			;d2cd	00 	. 
	nop			;d2ce	00 	. 
	nop			;d2cf	00 	. 
	nop			;d2d0	00 	. 
	nop			;d2d1	00 	. 
	nop			;d2d2	00 	. 
	nop			;d2d3	00 	. 
	nop			;d2d4	00 	. 
	nop			;d2d5	00 	. 
	nop			;d2d6	00 	. 
	nop			;d2d7	00 	. 
	nop			;d2d8	00 	. 
	nop			;d2d9	00 	. 
	nop			;d2da	00 	. 
	nop			;d2db	00 	. 
	nop			;d2dc	00 	. 
	nop			;d2dd	00 	. 
	nop			;d2de	00 	. 
	nop			;d2df	00 	. 
	nop			;d2e0	00 	. 
	nop			;d2e1	00 	. 
	nop			;d2e2	00 	. 
	nop			;d2e3	00 	. 
	nop			;d2e4	00 	. 
	nop			;d2e5	00 	. 
	nop			;d2e6	00 	. 
	nop			;d2e7	00 	. 
	nop			;d2e8	00 	. 
	nop			;d2e9	00 	. 
	nop			;d2ea	00 	. 
	nop			;d2eb	00 	. 
	nop			;d2ec	00 	. 
	nop			;d2ed	00 	. 
	nop			;d2ee	00 	. 
	nop			;d2ef	00 	. 
	nop			;d2f0	00 	. 
	nop			;d2f1	00 	. 
	nop			;d2f2	00 	. 
	nop			;d2f3	00 	. 
	nop			;d2f4	00 	. 
	nop			;d2f5	00 	. 
	nop			;d2f6	00 	. 
	nop			;d2f7	00 	. 
	nop			;d2f8	00 	. 
	nop			;d2f9	00 	. 
	nop			;d2fa	00 	. 
	nop			;d2fb	00 	. 
	nop			;d2fc	00 	. 
	nop			;d2fd	00 	. 
	nop			;d2fe	00 	. 
	nop			;d2ff	00 	. 
	nop			;d300	00 	. 
	nop			;d301	00 	. 
	nop			;d302	00 	. 
	nop			;d303	00 	. 
	nop			;d304	00 	. 
	nop			;d305	00 	. 
	nop			;d306	00 	. 
	nop			;d307	00 	. 
	nop			;d308	00 	. 
	nop			;d309	00 	. 
	nop			;d30a	00 	. 
	nop			;d30b	00 	. 
	nop			;d30c	00 	. 
	nop			;d30d	00 	. 
	nop			;d30e	00 	. 
	nop			;d30f	00 	. 
	nop			;d310	00 	. 
	nop			;d311	00 	. 
	nop			;d312	00 	. 
	nop			;d313	00 	. 
	nop			;d314	00 	. 
	nop			;d315	00 	. 
	nop			;d316	00 	. 
	nop			;d317	00 	. 
	nop			;d318	00 	. 
	nop			;d319	00 	. 
	nop			;d31a	00 	. 
	nop			;d31b	00 	. 
	nop			;d31c	00 	. 
	nop			;d31d	00 	. 
	nop			;d31e	00 	. 
	nop			;d31f	00 	. 
	nop			;d320	00 	. 
	nop			;d321	00 	. 
	nop			;d322	00 	. 
	nop			;d323	00 	. 
	nop			;d324	00 	. 
	nop			;d325	00 	. 
	nop			;d326	00 	. 
	nop			;d327	00 	. 
	nop			;d328	00 	. 
	nop			;d329	00 	. 
	nop			;d32a	00 	. 
	nop			;d32b	00 	. 
	nop			;d32c	00 	. 
	nop			;d32d	00 	. 
	nop			;d32e	00 	. 
	nop			;d32f	00 	. 
	nop			;d330	00 	. 
	nop			;d331	00 	. 
	nop			;d332	00 	. 
	nop			;d333	00 	. 
	nop			;d334	00 	. 
	nop			;d335	00 	. 
	nop			;d336	00 	. 
	nop			;d337	00 	. 
	nop			;d338	00 	. 
	nop			;d339	00 	. 
	nop			;d33a	00 	. 
	nop			;d33b	00 	. 
	nop			;d33c	00 	. 
	nop			;d33d	00 	. 
	nop			;d33e	00 	. 
	nop			;d33f	00 	. 
	nop			;d340	00 	. 
	nop			;d341	00 	. 
	nop			;d342	00 	. 
	nop			;d343	00 	. 
	nop			;d344	00 	. 
	nop			;d345	00 	. 
	nop			;d346	00 	. 
	nop			;d347	00 	. 
	nop			;d348	00 	. 
	nop			;d349	00 	. 
	nop			;d34a	00 	. 
	nop			;d34b	00 	. 
	nop			;d34c	00 	. 
	nop			;d34d	00 	. 
	nop			;d34e	00 	. 
	nop			;d34f	00 	. 
	nop			;d350	00 	. 
	nop			;d351	00 	. 
	nop			;d352	00 	. 
	nop			;d353	00 	. 
	nop			;d354	00 	. 
	nop			;d355	00 	. 
	nop			;d356	00 	. 
	nop			;d357	00 	. 
	nop			;d358	00 	. 
	nop			;d359	00 	. 
	nop			;d35a	00 	. 
	nop			;d35b	00 	. 
	nop			;d35c	00 	. 
	nop			;d35d	00 	. 
	nop			;d35e	00 	. 
	nop			;d35f	00 	. 
	nop			;d360	00 	. 
	nop			;d361	00 	. 
	nop			;d362	00 	. 
	nop			;d363	00 	. 
	nop			;d364	00 	. 
	nop			;d365	00 	. 
	nop			;d366	00 	. 
	nop			;d367	00 	. 
	nop			;d368	00 	. 
	nop			;d369	00 	. 
	nop			;d36a	00 	. 
	nop			;d36b	00 	. 
	nop			;d36c	00 	. 
	nop			;d36d	00 	. 
	nop			;d36e	00 	. 
	nop			;d36f	00 	. 
	nop			;d370	00 	. 
	nop			;d371	00 	. 
	nop			;d372	00 	. 
	nop			;d373	00 	. 
	nop			;d374	00 	. 
	nop			;d375	00 	. 
	nop			;d376	00 	. 
	nop			;d377	00 	. 
	nop			;d378	00 	. 
	nop			;d379	00 	. 
	nop			;d37a	00 	. 
	nop			;d37b	00 	. 
	nop			;d37c	00 	. 
	nop			;d37d	00 	. 
	nop			;d37e	00 	. 
	nop			;d37f	00 	. 
	nop			;d380	00 	. 
	nop			;d381	00 	. 
	nop			;d382	00 	. 
	nop			;d383	00 	. 
	nop			;d384	00 	. 
	nop			;d385	00 	. 
	nop			;d386	00 	. 
	nop			;d387	00 	. 
	nop			;d388	00 	. 
	nop			;d389	00 	. 
	nop			;d38a	00 	. 
	nop			;d38b	00 	. 
	nop			;d38c	00 	. 
	nop			;d38d	00 	. 
	nop			;d38e	00 	. 
	nop			;d38f	00 	. 
	nop			;d390	00 	. 
	nop			;d391	00 	. 
	nop			;d392	00 	. 
	nop			;d393	00 	. 
	nop			;d394	00 	. 
	nop			;d395	00 	. 
	nop			;d396	00 	. 
	nop			;d397	00 	. 
	nop			;d398	00 	. 
	nop			;d399	00 	. 
	nop			;d39a	00 	. 
	nop			;d39b	00 	. 
	nop			;d39c	00 	. 
	nop			;d39d	00 	. 
	nop			;d39e	00 	. 
	nop			;d39f	00 	. 
	nop			;d3a0	00 	. 
	nop			;d3a1	00 	. 
	nop			;d3a2	00 	. 
	nop			;d3a3	00 	. 
	nop			;d3a4	00 	. 
	nop			;d3a5	00 	. 
	nop			;d3a6	00 	. 
	nop			;d3a7	00 	. 
	nop			;d3a8	00 	. 
	nop			;d3a9	00 	. 
	nop			;d3aa	00 	. 
	nop			;d3ab	00 	. 
	nop			;d3ac	00 	. 
	nop			;d3ad	00 	. 
	nop			;d3ae	00 	. 
	nop			;d3af	00 	. 
	nop			;d3b0	00 	. 
	nop			;d3b1	00 	. 
	nop			;d3b2	00 	. 
	nop			;d3b3	00 	. 
	nop			;d3b4	00 	. 
	nop			;d3b5	00 	. 
	nop			;d3b6	00 	. 
	nop			;d3b7	00 	. 
	nop			;d3b8	00 	. 
	nop			;d3b9	00 	. 
	nop			;d3ba	00 	. 
	nop			;d3bb	00 	. 
	nop			;d3bc	00 	. 
	nop			;d3bd	00 	. 
	nop			;d3be	00 	. 
	nop			;d3bf	00 	. 
	nop			;d3c0	00 	. 
	nop			;d3c1	00 	. 
	nop			;d3c2	00 	. 
	nop			;d3c3	00 	. 
	nop			;d3c4	00 	. 
	nop			;d3c5	00 	. 
	nop			;d3c6	00 	. 
	nop			;d3c7	00 	. 
	nop			;d3c8	00 	. 
	nop			;d3c9	00 	. 
	nop			;d3ca	00 	. 
	nop			;d3cb	00 	. 
	nop			;d3cc	00 	. 
	nop			;d3cd	00 	. 
	nop			;d3ce	00 	. 
	nop			;d3cf	00 	. 
	nop			;d3d0	00 	. 
	nop			;d3d1	00 	. 
	nop			;d3d2	00 	. 
	nop			;d3d3	00 	. 
	nop			;d3d4	00 	. 
	nop			;d3d5	00 	. 
	nop			;d3d6	00 	. 
	nop			;d3d7	00 	. 
	nop			;d3d8	00 	. 
	nop			;d3d9	00 	. 
	nop			;d3da	00 	. 
	nop			;d3db	00 	. 
	nop			;d3dc	00 	. 
	nop			;d3dd	00 	. 
	nop			;d3de	00 	. 
	nop			;d3df	00 	. 
	nop			;d3e0	00 	. 
	nop			;d3e1	00 	. 
	nop			;d3e2	00 	. 
	nop			;d3e3	00 	. 
	nop			;d3e4	00 	. 
	nop			;d3e5	00 	. 
	nop			;d3e6	00 	. 
	nop			;d3e7	00 	. 
	nop			;d3e8	00 	. 
	nop			;d3e9	00 	. 
	nop			;d3ea	00 	. 
	nop			;d3eb	00 	. 
	nop			;d3ec	00 	. 
	nop			;d3ed	00 	. 
	nop			;d3ee	00 	. 
	nop			;d3ef	00 	. 
	nop			;d3f0	00 	. 
	nop			;d3f1	00 	. 
	nop			;d3f2	00 	. 
	nop			;d3f3	00 	. 
	nop			;d3f4	00 	. 
	nop			;d3f5	00 	. 
	nop			;d3f6	00 	. 
	nop			;d3f7	00 	. 
	nop			;d3f8	00 	. 
	nop			;d3f9	00 	. 
	nop			;d3fa	00 	. 
	nop			;d3fb	00 	. 
	nop			;d3fc	00 	. 
	nop			;d3fd	00 	. 
	nop			;d3fe	00 	. 
	nop			;d3ff	00 	. 
	jp 07804h		;d400	c3 04 78 	. . x 
	nop			;d403	00 	. 
;; sp:=8000	
	ld sp,08000h		;d404	31 00 80 	1 . . 
;; a:= ff	
	ld a,0ffh		;d407	3e ff 	> . 
;; (9df8) := a
	ld (09df8h),a		;d409	32 f8 9d 	2 . . 
;; a:= 78	
	ld a,078h		;d40c	3e 78 	> x 
;;	
	out (000h),a		;d40e	d3 00 	. . 
	xor a			;d410	af 	. 
;; (7803):=a	
	ld (07803h),a		;d411	32 03 78 	2 . x 
	jp 07828h		;d414	c3 28 78 	. ( x 
	call 0793dh		;d417	cd 3d 79 	. = y 
	jr z,$+14		;d41a	28 0c 	( . 
	ld c,l			;d41c	4d 	M 
	ld b,h			;d41d	44 	D 
	call 07bf5h		;d41e	cd f5 7b 	. . { 
	jr nz,$-10		;d421	20 f4 	  . 
	call 078c7h		;d423	cd c7 78 	. . x 
	jr $-15		;d426	18 ef 	. . 
	ld a,(07803h)		;d428	3a 03 78 	: . x 
	or a			;d42b	b7 	. 
	jr z,$+8		;d42c	28 06 	( . 
	call 07c45h		;d42e	cd 45 7c 	. E | 
	call z,078bdh		;d431	cc bd 78 	. . x 
;; a:= (dff0)
	ld a,(0dff0h)		;d434	3a f0 df 	: . . 
;; == 0 ?
	cp 000h		;d437	fe 00 	. . 
;; 	
	jp z,07817h		;d439	ca 17 78 	. . x 
;; hl:=7869	
	ld hl,07869h		;d43c	21 69 78 	! i x 
	push hl			;d43f	e5 	. 
;; == 1 ?	
	cp 001h		;d440	fe 01 	. . 
	jp z,07871h		;d442	ca 71 78 	. q x 
	cp 002h		;d445	fe 02 	. . 
	jp z,0787bh		;d447	ca 7b 78 	. { x 
	cp 003h		;d44a	fe 03 	. . 
	jp z,0787fh		;d44c	ca 7f 78 	.  x 
	cp 004h		;d44f	fe 04 	. . 
	jp z,07891h		;d451	ca 91 78 	. . x 
	cp 005h		;d454	fe 05 	. . 
	jp z,078b2h		;d456	ca b2 78 	. . x 
	cp 006h		;d459	fe 06 	. . 
	jp z,078d3h		;d45b	ca d3 78 	. . x 
	cp 007h		;d45e	fe 07 	. . 
	jp z,0791dh		;d460	ca 1d 79 	. . y 
	cp 008h		;d463	fe 08 	. . 
;; == 8 ?	
	jp z,0792ah		;d465	ca 2a 79 	. * y 
	pop hl			;d468	e1 	. 
	ld a,000h		;d469	3e 00 	> . 
	ld (0dff0h),a		;d46b	32 f0 df 	2 . . 
	jp 07817h		;d46e	c3 17 78 	. . x 
	call 079cch		;d471	cd cc 79 	. . y 
	call 079d2h		;d474	cd d2 79 	. . y 
	call 07ad9h		;d477	cd d9 7a 	. . z 
	ret			;d47a	c9 	. 

	call 07ad9h		;d47b	cd d9 7a 	. . z 
	ret			;d47e	c9 	. 

	ld a,(0dff1h)		;d47f	3a f1 df 	: . . 
	ld c,a			;d482	4f 	O 
	call 0798dh		;d483	cd 8d 79 	. . y 
	ld a,(0dbeah)		;d486	3a ea db 	: . . 
	or a			;d489	b7 	. 
	ret z			;d48a	c8 	. 

	ld b,083h		;d48b	06 83 	. . 
	call 07bf5h		;d48d	cd f5 7b 	. . { 
	ret			;d490	c9 	. 

	call 07ac7h		;d491	cd c7 7a 	. . z 
	ld b,07fh		;d494	06 7f 	.  
	ld hl,000c6h		;d496	21 c6 00 	! . . 
	push bc			;d499	c5 	. 
	push hl			;d49a	e5 	. 
	call 0793dh		;d49b	cd 3d 79 	. = y 
	jr z,$+7		;d49e	28 05 	( . 
	ld c,l			;d4a0	4d 	M 
	ld b,h			;d4a1	44 	D 
	call 07bf5h		;d4a2	cd f5 7b 	. . { 
	pop hl			;d4a5	e1 	. 
	pop bc			;d4a6	c1 	. 
	dec hl			;d4a7	2b 	+ 
	ld a,h			;d4a8	7c 	| 
	or l			;d4a9	b5 	. 
	jr nz,$-17		;d4aa	20 ed 	  . 
	djnz $-22		;d4ac	10 e8 	. . 
	call 07ad4h		;d4ae	cd d4 7a 	. . z 
	ret			;d4b1	c9 	. 

	call 07b03h		;d4b2	cd 03 7b 	. . { 
	ld a,000h		;d4b5	3e 00 	> . 
	ld (0dff0h),a		;d4b7	32 f0 df 	2 . . 
	jp 07931h		;d4ba	c3 31 79 	. 1 y 
	xor a			;d4bd	af 	. 
	ld (07803h),a		;d4be	32 03 78 	2 . x 
	ld c,011h		;d4c1	0e 11 	. . 
	call 0798dh		;d4c3	cd 8d 79 	. . y 
	ret			;d4c6	c9 	. 

	ld a,001h		;d4c7	3e 01 	> . 
	ld (07803h),a		;d4c9	32 03 78 	2 . x 
	ld c,013h		;d4cc	0e 13 	. . 
	call 0798dh		;d4ce	cd 8d 79 	. . y 
	ret			;d4d1	c9 	. 

	ret			;d4d2	c9 	. 

	call 07b9bh		;d4d3	cd 9b 7b 	. . { 
	ld a,000h		;d4d6	3e 00 	> . 
	ld (0dff0h),a		;d4d8	32 f0 df 	2 . . 
	ld a,(078d2h)		;d4db	3a d2 78 	: . x 
	ld (01994h),a		;d4de	32 94 19 	2 . . 
	ld hl,0790eh		;d4e1	21 0e 79 	! . y 
	ld (02a84h),hl		;d4e4	22 84 2a 	" . * 
	ld hl,02a86h		;d4e7	21 86 2a 	! . * 
	ld de,02a87h		;d4ea	11 87 2a 	. . * 
	ld bc,00007h		;d4ed	01 07 00 	. . . 
	ld (hl),000h		;d4f0	36 00 	6 . 
	ldir		;d4f2	ed b0 	. . 
	ld hl,00000h		;d4f4	21 00 00 	! . . 
	ld (02a95h),hl		;d4f7	22 95 2a 	" . * 
	ld hl,07000h		;d4fa	21 00 70 	! . p 
	ld (07121h),hl		;d4fd	22 21 71 	" ! q 
	ld (07123h),hl		;d500	22 23 71 	" # q 
	ld a,070h		;d503	3e 70 	> p 
;;; POI-020, out command	
	out (000h),a		;d505	d3 00 	. . 
	ld a,000h		;d507	3e 00 	> . 
	ld (09dffh),a		;d509	32 ff 9d 	2 . . 
	jr $+37		;d50c	18 23 	. # 
	ld hl,(07915h)		;d50e	2a 15 79 	* . y 
	ld (00066h),hl		;d511	22 66 00 	" f . 
	ret			;d514	c9 	. 

	jr $+8		;d515	18 06 	. . 
	ld (00000h),a		;d517	32 00 00 	2 . . 
	pop af			;d51a	f1 	. 
	retn		;d51b	ed 45 	. E 

	call 07b03h		;d51d	cd 03 7b 	. . { 
	call 07b7ch		;d520	cd 7c 7b 	. | { 
	ld a,000h		;d523	3e 00 	> . 
	ld (0dff0h),a		;d525	32 f0 df 	2 . . 
	jr $+9		;d528	18 07 	. . 
	call 079d2h		;d52a	cd d2 79 	. . y 
	call 07ad9h		;d52d	cd d9 7a 	. . z 
	ret			;d530	c9 	. 

	ld sp,08000h		;d531	31 00 80 	1 . . 
	ld a,070h		;d534	3e 70 	> p 
;;; POI-021, out command		
	out (000h),a		;d536	d3 00 	. . 
	jp 00063h		;d538	c3 63 00 	. c . 
	ld bc,00e00h		;d53b	01 00 0e 	. . . 
	jr nz,$+8		;d53e	20 06 	  . 
	ld (0e83ah),hl		;d540	22 3a e8 	" : . 
	in a,(0cbh)		;d543	db cb 	. . 
	ld b,a			;d545	47 	G 
	jr nz,$+6		;d546	20 04 	  . 
	ld c,021h		;d548	0e 21 	. ! 
	ld b,023h		;d54a	06 23 	. # 
	ld a,000h		;d54c	3e 00 	> . 
;;; POI-022, out + in command		
	out (c),a		;d54e	ed 79 	. y 
	in l,(c)		;d550	ed 68 	. h 
	bit 0,l		;d552	cb 45 	. E 
	ret z			;d554	c8 	. 

	ld a,001h		;d555	3e 01 	> . 
;;; POI-023, out command		
	out (c),a		;d557	ed 79 	. y 
	in h,(c)		;d559	ed 60 	. ` 
	ld c,b			;d55b	48 	H 
	in a,(c)		;d55c	ed 78 	. x 
	ld c,a			;d55e	4f 	O 
	ld a,(0dbe2h)		;d55f	3a e2 db 	: . . 
	bit 2,a		;d562	cb 57 	. W 
	jr nz,$+14		;d564	20 0c 	  . 
	bit 6,a		;d566	cb 77 	. w 
	jr nz,$+24		;d568	20 16 	  . 
	bit 4,h		;d56a	cb 64 	. d 
	jr z,$+20		;d56c	28 12 	( . 
	ld b,08fh		;d56e	06 8f 	. . 
	jr $+18		;d570	18 10 	. . 
	bit 3,a		;d572	cb 5f 	. _ 
	jr nz,$+8		;d574	20 06 	  . 
	bit 7,c		;d576	cb 79 	. y 
	jr nz,$-10		;d578	20 f4 	  . 
	jr $+6		;d57a	18 04 	. . 
	bit 7,c		;d57c	cb 79 	. y 
	jr z,$-16		;d57e	28 ee 	( . 
	ld b,083h		;d580	06 83 	. . 
	ld l,c			;d582	69 	i 
	ld h,b			;d583	60 	` 
	ld a,030h		;d584	3e 30 	> 0 
;;; POI-024, 2 times out command		
	out (021h),a		;d586	d3 21 	. ! 
	out (020h),a		;d588	d3 20 	.   
	or 0ffh		;d58a	f6 ff 	. . 
	ret			;d58c	c9 	. 

;; POI-025, many out, 1xin	
	ld a,(0dbe2h)		;d58d	3a e2 db 	: . . 
	bit 3,a		;d590	cb 5f 	. _ 
	jr z,$+4		;d592	28 02 	( . 
	set 7,c		;d594	cb f9 	. . 
	ld a,000h		;d596	3e 00 	> . 
	out (021h),a		;d598	d3 21 	. ! 
	in a,(021h)		;d59a	db 21 	. ! 
	bit 2,a		;d59c	cb 57 	. W 
	jr z,$-17		;d59e	28 ed 	( . 
	ld a,005h		;d5a0	3e 05 	> . 
	out (021h),a		;d5a2	d3 21 	. ! 
	ld a,(07a92h)		;d5a4	3a 92 7a 	: . z 
	or 008h		;d5a7	f6 08 	. . 
	out (021h),a		;d5a9	d3 21 	. ! 
	ld a,c			;d5ab	79 	y 
	out (023h),a		;d5ac	d3 23 	. # 
	ret			;d5ae	c9 	. 

;; POI-025, many out
	ld a,009h		;d5af	3e 09 	> . 
	out (021h),a		;d5b1	d3 21 	. ! 
	ld a,0c0h		;d5b3	3e c0 	> . 
	out (021h),a		;d5b5	d3 21 	. ! 
	ld a,009h		;d5b7	3e 09 	> . 
	out (021h),a		;d5b9	d3 21 	. ! 
	ld a,082h		;d5bb	3e 82 	> . 
	out (021h),a		;d5bd	d3 21 	. ! 
	ld a,009h		;d5bf	3e 09 	> . 
	out (020h),a		;d5c1	d3 20 	.   
	ld a,042h		;d5c3	3e 42 	> B 
	out (020h),a		;d5c5	d3 20 	.   
	ld a,000h		;d5c7	3e 00 	> . 
	out (040h),a		;d5c9	d3 40 	. @ 
	ret			;d5cb	c9 	. 

	call 07b19h		;d5cc	cd 19 7b 	. . { 
	call 079afh		;d5cf	cd af 79 	. . y 
	ld a,(0dbe2h)		;d5d2	3a e2 db 	: . . 
	bit 2,a		;d5d5	cb 57 	. W 
	ld a,060h		;d5d7	3e 60 	> ` 
	jr nz,$+5		;d5d9	20 03 	  . 
	ld a,(0dbe0h)		;d5db	3a e0 db 	: . . 
	or 080h		;d5de	f6 80 	. . 
	ld (07aadh),a		;d5e0	32 ad 7a 	2 . z 
	or 002h		;d5e3	f6 02 	. . 
	ld (07a92h),a		;d5e5	32 92 7a 	2 . z 
	ld a,(0dbe2h)		;d5e8	3a e2 db 	: . . 
	bit 2,a		;d5eb	cb 57 	. W 
	ld a,060h		;d5ed	3e 60 	> ` 
	jr nz,$+5		;d5ef	20 03 	  . 
	ld a,(0dbe0h)		;d5f1	3a e0 db 	: . . 
	rlca			;d5f4	07 	. 
	or 010h		;d5f5	f6 10 	. . 
	ld (07a90h),a		;d5f7	32 90 7a 	2 . z 
	ld (07aabh),a		;d5fa	32 ab 7a 	2 . z 
	ld a,(0dbe2h)		;d5fd	3a e2 db 	: . . 
	or 05ch		;d600	f6 5c 	. \ 
	ld (07a88h),a		;d602	32 88 7a 	2 . z 
	ld (07aa3h),a		;d605	32 a3 7a 	2 . z 
	ld hl,(0dbe4h)		;d608	2a e4 db 	* . . 
	srl h		;d60b	cb 3c 	. < 
	rr l		;d60d	cb 1d 	. . 
	srl h		;d60f	cb 3c 	. < 
	rr l		;d611	cb 1d 	. . 
	srl h		;d613	cb 3c 	. < 
	rr l		;d615	cb 1d 	. . 
	dec hl			;d617	2b 	+ 
	ld a,l			;d618	7d 	} 
	ld (07a9ah),a		;d619	32 9a 7a 	2 . z 
	ld (07ab3h),a		;d61c	32 b3 7a 	2 . z 
	ld a,h			;d61f	7c 	| 
	ld (07a9ch),a		;d620	32 9c 7a 	2 . z 
	ld (07ab5h),a		;d623	32 b5 7a 	2 . z 
	ld c,021h		;d626	0e 21 	. ! 
	ld hl,07a87h		;d628	21 87 7a 	! . z 
	call 07abbh		;d62b	cd bb 7a 	. . z 
	ld c,020h		;d62e	0e 20 	.   
	ld hl,07aa2h		;d630	21 a2 7a 	! . z 
	call 07abbh		;d633	cd bb 7a 	. . z 
	ld a,003h		;d636	3e 03 	> . 
;; POI-026, many out 0x03 and 0x33	
	out (021h),a		;d638	d3 21 	. ! 
	ld a,(07a90h)		;d63a	3a 90 7a 	: . z 
	or 001h		;d63d	f6 01 	. . 
	out (021h),a		;d63f	d3 21 	. ! 
	ld a,033h		;d641	3e 33 	> 3 
	out (021h),a		;d643	d3 21 	. ! 
	ld a,(07a90h)		;d645	3a 90 7a 	: . z 
	or 001h		;d648	f6 01 	. . 
	out (021h),a		;d64a	d3 21 	. ! 
	in a,(023h)		;d64c	db 23 	. # 
	ld a,003h		;d64e	3e 03 	> . 
	out (021h),a		;d650	d3 21 	. ! 
	ld a,(07a90h)		;d652	3a 90 7a 	: . z 
	out (021h),a		;d655	d3 21 	. ! 
	ld a,003h		;d657	3e 03 	> . 
	out (020h),a		;d659	d3 20 	.   
	ld a,(07aabh)		;d65b	3a ab 7a 	: . z 
	or 001h		;d65e	f6 01 	. . 
	out (020h),a		;d660	d3 20 	.   
	ld a,033h		;d662	3e 33 	> 3 
	out (020h),a		;d664	d3 20 	.   
	ld a,(07aabh)		;d666	3a ab 7a 	: . z 
	or 001h		;d669	f6 01 	. . 
	out (020h),a		;d66b	d3 20 	.   
	in a,(022h)		;d66d	db 22 	. " 
	ld a,003h		;d66f	3e 03 	> . 
	out (020h),a		;d671	d3 20 	.   
	ld a,(07aabh)		;d673	3a ab 7a 	: . z 
	out (020h),a		;d676	d3 20 	.   
	ld a,010h		;d678	3e 10 	> . 
	out (021h),a		;d67a	d3 21 	. ! 
	out (020h),a		;d67c	d3 20 	.   
	ld a,0d2h		;d67e	3e d2 	> . 
	out (040h),a		;d680	d3 40 	. @ 
	ld hl,000ffh		;d682	21 ff 00 	! . . 
	or l			;d685	b5 	. 
	ret			;d686	c9 	. 

	inc b			;d687	04 	. 
	nop			;d688	00 	. 
	ld a,(bc)			;d689	0a 	. 
	nop			;d68a	00 	. 
	ld b,0ffh		;d68b	06 ff 	. . 
	rlca			;d68d	07 	. 
	rst 38h			;d68e	ff 	. 
	inc bc			;d68f	03 	. 
	nop			;d690	00 	. 
	dec b			;d691	05 	. 
	nop			;d692	00 	. 
	ld bc,00200h		;d693	01 00 02 	. . . 
	ld b,b			;d696	40 	@ 
	dec bc			;d697	0b 	. 
	ld d,b			;d698	50 	P 
	inc c			;d699	0c 	. 
	nop			;d69a	00 	. 
	dec c			;d69b	0d 	. 
	nop			;d69c	00 	. 
	ld c,003h		;d69d	0e 03 	. . 
	rrca			;d69f	0f 	. 
	nop			;d6a0	00 	. 
	nop			;d6a1	00 	. 
	inc b			;d6a2	04 	. 
	nop			;d6a3	00 	. 
	ld a,(bc)			;d6a4	0a 	. 
	nop			;d6a5	00 	. 
	ld b,016h		;d6a6	06 16 	. . 
	rlca			;d6a8	07 	. 
	ld d,003h		;d6a9	16 03 	. . 
	nop			;d6ab	00 	. 
	dec b			;d6ac	05 	. 
	nop			;d6ad	00 	. 
	ld bc,00b00h		;d6ae	01 00 0b 	. . . 
	ld d,b			;d6b1	50 	P 
	inc c			;d6b2	0c 	. 
	nop			;d6b3	00 	. 
	dec c			;d6b4	0d 	. 
	nop			;d6b5	00 	. 
	ld c,003h		;d6b6	0e 03 	. . 
	rrca			;d6b8	0f 	. 
	nop			;d6b9	00 	. 
	nop			;d6ba	00 	. 
	ld a,(hl)			;d6bb	7e 	~ 
	or a			;d6bc	b7 	. 
	ret z			;d6bd	c8 	. 

	out (c),a		;d6be	ed 79 	. y 
	inc hl			;d6c0	23 	# 
	ld a,(hl)			;d6c1	7e 	~ 
	out (c),a		;d6c2	ed 79 	. y 
	inc hl			;d6c4	23 	# 
	jr $-10		;d6c5	18 f4 	. . 
	ld l,010h		;d6c7	2e 10 	. . 
	ld a,005h		;d6c9	3e 05 	> . 
	out (021h),a		;d6cb	d3 21 	. ! 
	ld a,(07a92h)		;d6cd	3a 92 7a 	: . z 
	or l			;d6d0	b5 	. 
	out (021h),a		;d6d1	d3 21 	. ! 
	ret			;d6d3	c9 	. 

	ld l,000h		;d6d4	2e 00 	. . 
	jp 07ac9h		;d6d6	c3 c9 7a 	. . z 
	ld l,001h		;d6d9	2e 01 	. . 
	ld h,008h		;d6db	26 08 	& . 
	ld a,(0dbe8h)		;d6dd	3a e8 db 	: . . 
	bit 0,a		;d6e0	cb 47 	. G 
	ld a,003h		;d6e2	3e 03 	> . 
	jr nz,$+12		;d6e4	20 0a 	  . 
	out (021h),a		;d6e6	d3 21 	. ! 
	ld a,(07a90h)		;d6e8	3a 90 7a 	: . z 
	or l			;d6eb	b5 	. 
	out (021h),a		;d6ec	d3 21 	. ! 
	jr $+10		;d6ee	18 08 	. . 
	out (020h),a		;d6f0	d3 20 	.   
	ld a,(07aabh)		;d6f2	3a ab 7a 	: . z 
	or l			;d6f5	b5 	. 
	out (020h),a		;d6f6	d3 20 	.   
	ld a,005h		;d6f8	3e 05 	> . 
	out (021h),a		;d6fa	d3 21 	. ! 
	ld a,(07a92h)		;d6fc	3a 92 7a 	: . z 
	or h			;d6ff	b4 	. 
	out (021h),a		;d700	d3 21 	. ! 
	ret			;d702	c9 	. 

	ld l,000h		;d703	2e 00 	. . 
	ld h,000h		;d705	26 00 	& . 
	jp 07addh		;d707	c3 dd 7a 	. . z 
	ld bc,0010bh		;d70a	01 0b 01 	. . . 
	dec bc			;d70d	0b 	. 
	ld a,b			;d70e	78 	x 
	or c			;d70f	b1 	. 
	jr nz,$-3		;d710	20 fb 	  . 
	dec hl			;d712	2b 	+ 
	ld a,l			;d713	7d 	} 
	or h			;d714	b4 	. 
	ret z			;d715	c8 	. 

	ret z			;d716	c8 	. 

	jr $-13		;d717	18 f1 	. . 
	call 07b98h		;d719	cd 98 7b 	. . { 
	ld a,(0dbe8h)		;d71c	3a e8 db 	: . . 
	ld e,a			;d71f	5f 	_ 
	ld a,090h		;d720	3e 90 	> . 
	out (000h),a		;d722	d3 00 	. . 
	xor a			;d724	af 	. 
	out (002h),a		;d725	d3 02 	. . 
	ld a,(0793ch)		;d727	3a 3c 79 	: < y 
	ld c,a			;d72a	4f 	O 
	ld b,000h		;d72b	06 00 	. . 
	ld hl,07b74h		;d72d	21 74 7b 	! t { 
	add hl,bc			;d730	09 	. 
	ld a,(hl)			;d731	7e 	~ 
	or a			;d732	b7 	. 
	jr z,$+46		;d733	28 2c 	( , 
	call 07bd6h		;d735	cd d6 7b 	. . { 
	ld a,080h		;d738	3e 80 	> . 
	out (002h),a		;d73a	d3 02 	. . 
	call 07bd6h		;d73c	cd d6 7b 	. . { 
	xor a			;d73f	af 	. 
	out (002h),a		;d740	d3 02 	. . 
	call 07bd6h		;d742	cd d6 7b 	. . { 
	bit 1,e		;d745	cb 4b 	. K 
	ld a,0d2h		;d747	3e d2 	> . 
	jr nz,$+10		;d749	20 08 	  . 
	bit 0,e		;d74b	cb 43 	. C 
	ld a,0b4h		;d74d	3e b4 	> . 
	jr nz,$+4		;d74f	20 02 	  . 
	jr $+34		;d751	18 20 	.   
	out (000h),a		;d753	d3 00 	. . 
	call 07bd6h		;d755	cd d6 7b 	. . { 
	ld a,090h		;d758	3e 90 	> . 
	out (000h),a		;d75a	d3 00 	. . 
	call 07bd6h		;d75c	cd d6 7b 	. . { 
	jr $+20		;d75f	18 12 	. . 
	bit 1,e		;d761	cb 4b 	. K 
	jr z,$+8		;d763	28 06 	( . 
	ld a,0d2h		;d765	3e d2 	> . 
	out (000h),a		;d767	d3 00 	. . 
	jr $+10		;d769	18 08 	. . 
	bit 0,e		;d76b	cb 43 	. C 
	jr z,$+6		;d76d	28 04 	( . 
	ld a,0b4h		;d76f	3e b4 	> . 
	out (000h),a		;d771	d3 00 	. . 
	ret			;d773	c9 	. 

	ld bc,00001h		;d774	01 01 00 	. . . 
	nop			;d777	00 	. 
	nop			;d778	00 	. 
	nop			;d779	00 	. 
	nop			;d77a	00 	. 
	nop			;d77b	00 	. 
	push de			;d77c	d5 	. 
	push bc			;d77d	c5 	. 
	call 079afh		;d77e	cd af 79 	. . y 
	ld a,090h		;d781	3e 90 	> . 
	out (000h),a		;d783	d3 00 	. . 
	call 07bd6h		;d785	cd d6 7b 	. . { 
	ld a,080h		;d788	3e 80 	> . 
	out (002h),a		;d78a	d3 02 	. . 
	call 07bd6h		;d78c	cd d6 7b 	. . { 
	xor a			;d78f	af 	. 
	out (002h),a		;d790	d3 02 	. . 
	call 07bd6h		;d792	cd d6 7b 	. . { 
	pop bc			;d795	c1 	. 
	pop de			;d796	d1 	. 
	ret			;d797	c9 	. 

	call 07bc3h		;d798	cd c3 7b 	. . { 
	xor a			;d79b	af 	. 
	out (001h),a		;d79c	d3 01 	. . 
	in a,(001h)		;d79e	db 01 	. . 
	ld (0793bh),a		;d7a0	32 3b 79 	2 ; y 
	and 0d0h		;d7a3	e6 d0 	. . 
	ld b,a			;d7a5	47 	G 
	rrc b		;d7a6	cb 08 	. . 
	rrc b		;d7a8	cb 08 	. . 
	rlca			;d7aa	07 	. 
	rlca			;d7ab	07 	. 
	or b			;d7ac	b0 	. 
	and 007h		;d7ad	e6 07 	. . 
	ld hl,07bbbh		;d7af	21 bb 7b 	! . { 
	ld b,000h		;d7b2	06 00 	. . 
	ld c,a			;d7b4	4f 	O 
	add hl,bc			;d7b5	09 	. 
	ld a,(hl)			;d7b6	7e 	~ 
	ld (0793ch),a		;d7b7	32 3c 79 	2 < y 
	ret			;d7ba	c9 	. 

	ld bc,00203h		;d7bb	01 03 02 	. . . 
	inc b			;d7be	04 	. 
	ld bc,00101h		;d7bf	01 01 01 	. . . 
	ex af,af'			;d7c2	08 	. 
	call 07bd6h		;d7c3	cd d6 7b 	. . { 
	ld a,080h		;d7c6	3e 80 	> . 
	out (002h),a		;d7c8	d3 02 	. . 
	call 07bd6h		;d7ca	cd d6 7b 	. . { 
	xor a			;d7cd	af 	. 
	out (002h),a		;d7ce	d3 02 	. . 
	ret			;d7d0	c9 	. 

	ld hl,0012ch		;d7d1	21 2c 01 	! , . 
	jr $+5		;d7d4	18 03 	. . 
	ld hl,02710h		;d7d6	21 10 27 	! . ' 
	dec hl			;d7d9	2b 	+ 
	ld a,h			;d7da	7c 	| 
	or l			;d7db	b5 	. 
	jr nz,$-3		;d7dc	20 fb 	  . 
	ret			;d7de	c9 	. 

	ld hl,0dc00h		;d7df	21 00 dc 	! . . 
	ld (0de02h),hl		;d7e2	22 02 de 	" . . 
	ld (0de00h),hl		;d7e5	22 00 de 	" . . 
	xor a			;d7e8	af 	. 
	ld (0de06h),a		;d7e9	32 06 de 	2 . . 
	ld (0de07h),a		;d7ec	32 07 de 	2 . . 
	ld l,a			;d7ef	6f 	o 
	ld h,a			;d7f0	67 	g 
	ld (0de04h),hl		;d7f1	22 04 de 	" . . 
	ret			;d7f4	c9 	. 

	ld a,001h		;d7f5	3e 01 	> . 
	ld (0de07h),a		;d7f7	32 07 de 	2 . . 
	ld a,(0de06h)		;d7fa	3a 06 de 	: . . 
	or a			;d7fd	b7 	. 
	jr z,$+19		;d7fe	28 11 	( . 
	xor a			;d800	af 	. 
	ld (0de07h),a		;d801	32 07 de 	2 . . 
	push bc			;d804	c5 	. 
	ld b,020h		;d805	06 20 	.   
	djnz $+0		;d807	10 fe 	. . 
	pop bc			;d809	c1 	. 
	ld a,001h		;d80a	3e 01 	> . 
	ld (0de07h),a		;d80c	32 07 de 	2 . . 
	jr $-21		;d80f	18 e9 	. . 
	ld de,(0de04h)		;d811	ed 5b 04 de 	. [ . . 
	ld hl,00100h		;d815	21 00 01 	! . . 
	or a			;d818	b7 	. 
	sbc hl,de		;d819	ed 52 	. R 
	jr z,$+37		;d81b	28 23 	( # 
	inc de			;d81d	13 	. 
	ld (0de04h),de		;d81e	ed 53 04 de 	. S . . 
	ex de,hl			;d822	eb 	. 
	ld hl,(0de00h)		;d823	2a 00 de 	* . . 
	ld (hl),c			;d826	71 	q 
	inc l			;d827	2c 	, 
	ld (hl),b			;d828	70 	p 
	inc hl			;d829	23 	# 
	set 2,h		;d82a	cb d4 	. . 
	res 1,h		;d82c	cb 8c 	. . 
	ld (0de00h),hl		;d82e	22 00 de 	" . . 
	xor a			;d831	af 	. 
	ld (0de07h),a		;d832	32 07 de 	2 . . 
	ld a,d			;d835	7a 	z 
	or a			;d836	b7 	. 
	ret nz			;d837	c0 	. 

	ld a,e			;d838	7b 	{ 
	cp 020h		;d839	fe 20 	.   
	jr c,$+5		;d83b	38 03 	8 . 
	or 0ffh		;d83d	f6 ff 	. . 
	ret			;d83f	c9 	. 

	xor a			;d840	af 	. 
	ld (0de07h),a		;d841	32 07 de 	2 . . 
	ret			;d844	c9 	. 

	ld a,001h		;d845	3e 01 	> . 
	ld (0de07h),a		;d847	32 07 de 	2 . . 
	ld a,(0de06h)		;d84a	3a 06 de 	: . . 
	or a			;d84d	b7 	. 
	jr z,$+19		;d84e	28 11 	( . 
	xor a			;d850	af 	. 
	ld (0de07h),a		;d851	32 07 de 	2 . . 
	push bc			;d854	c5 	. 
	ld b,020h		;d855	06 20 	.   
	djnz $+0		;d857	10 fe 	. . 
	pop bc			;d859	c1 	. 
	ld a,001h		;d85a	3e 01 	> . 
	ld (0de07h),a		;d85c	32 07 de 	2 . . 
	jr $-21		;d85f	18 e9 	. . 
	ld hl,(0de04h)		;d861	2a 04 de 	* . . 
	xor a			;d864	af 	. 
	ld (0de07h),a		;d865	32 07 de 	2 . . 
	ld a,h			;d868	7c 	| 
	or l			;d869	b5 	. 
	ret			;d86a	c9 	. 

	ld a,001h		;d86b	3e 01 	> . 
	ld (0de06h),a		;d86d	32 06 de 	2 . . 
	ld a,(0de07h)		;d870	3a 07 de 	: . . 
	or a			;d873	b7 	. 
	jr nz,$-4		;d874	20 fa 	  . 
	ld hl,(0de04h)		;d876	2a 04 de 	* . . 
	ld a,h			;d879	7c 	| 
	or l			;d87a	b5 	. 
	jr z,$+22		;d87b	28 14 	( . 
	dec hl			;d87d	2b 	+ 
	ld (0de04h),hl		;d87e	22 04 de 	" . . 
	ld hl,(0de02h)		;d881	2a 02 de 	* . . 
	ld c,(hl)			;d884	4e 	N 
	inc l			;d885	2c 	, 
	ld b,(hl)			;d886	46 	F 
	inc hl			;d887	23 	# 
	set 2,h		;d888	cb d4 	. . 
	res 1,h		;d88a	cb 8c 	. . 
	ld (0de02h),hl		;d88c	22 02 de 	" . . 
	or 0ffh		;d88f	f6 ff 	. . 
	ld a,000h		;d891	3e 00 	> . 
	ld (0de06h),a		;d893	32 06 de 	2 . . 
	ret			;d896	c9 	. 

	nop			;d897	00 	. 
	nop			;d898	00 	. 
	nop			;d899	00 	. 
	nop			;d89a	00 	. 
	nop			;d89b	00 	. 
	nop			;d89c	00 	. 
	nop			;d89d	00 	. 
	nop			;d89e	00 	. 
	nop			;d89f	00 	. 
	nop			;d8a0	00 	. 
	nop			;d8a1	00 	. 
	nop			;d8a2	00 	. 
	nop			;d8a3	00 	. 
	nop			;d8a4	00 	. 
	nop			;d8a5	00 	. 
	nop			;d8a6	00 	. 
	nop			;d8a7	00 	. 
	nop			;d8a8	00 	. 
	nop			;d8a9	00 	. 
	nop			;d8aa	00 	. 
	nop			;d8ab	00 	. 
	nop			;d8ac	00 	. 
	nop			;d8ad	00 	. 
	nop			;d8ae	00 	. 
	nop			;d8af	00 	. 
	nop			;d8b0	00 	. 
	nop			;d8b1	00 	. 
	nop			;d8b2	00 	. 
	nop			;d8b3	00 	. 
	nop			;d8b4	00 	. 
	nop			;d8b5	00 	. 
	nop			;d8b6	00 	. 
	nop			;d8b7	00 	. 
	nop			;d8b8	00 	. 
	nop			;d8b9	00 	. 
	nop			;d8ba	00 	. 
	nop			;d8bb	00 	. 
	nop			;d8bc	00 	. 
	nop			;d8bd	00 	. 
	nop			;d8be	00 	. 
	nop			;d8bf	00 	. 
	nop			;d8c0	00 	. 
	nop			;d8c1	00 	. 
	nop			;d8c2	00 	. 
	nop			;d8c3	00 	. 
	nop			;d8c4	00 	. 
	nop			;d8c5	00 	. 
	nop			;d8c6	00 	. 
	nop			;d8c7	00 	. 
	nop			;d8c8	00 	. 
	nop			;d8c9	00 	. 
	nop			;d8ca	00 	. 
	nop			;d8cb	00 	. 
	nop			;d8cc	00 	. 
	nop			;d8cd	00 	. 
	nop			;d8ce	00 	. 
	nop			;d8cf	00 	. 
	nop			;d8d0	00 	. 
	nop			;d8d1	00 	. 
	nop			;d8d2	00 	. 
	nop			;d8d3	00 	. 
	nop			;d8d4	00 	. 
	nop			;d8d5	00 	. 
	nop			;d8d6	00 	. 
	nop			;d8d7	00 	. 
	nop			;d8d8	00 	. 
	nop			;d8d9	00 	. 
	nop			;d8da	00 	. 
	nop			;d8db	00 	. 
	nop			;d8dc	00 	. 
	nop			;d8dd	00 	. 
	nop			;d8de	00 	. 
	nop			;d8df	00 	. 
	nop			;d8e0	00 	. 
	nop			;d8e1	00 	. 
	nop			;d8e2	00 	. 
	nop			;d8e3	00 	. 
	nop			;d8e4	00 	. 
	nop			;d8e5	00 	. 
	nop			;d8e6	00 	. 
	nop			;d8e7	00 	. 
	nop			;d8e8	00 	. 
	nop			;d8e9	00 	. 
	nop			;d8ea	00 	. 
	nop			;d8eb	00 	. 
	nop			;d8ec	00 	. 
	nop			;d8ed	00 	. 
	nop			;d8ee	00 	. 
	nop			;d8ef	00 	. 
	nop			;d8f0	00 	. 
	nop			;d8f1	00 	. 
	nop			;d8f2	00 	. 
	nop			;d8f3	00 	. 
	nop			;d8f4	00 	. 
	nop			;d8f5	00 	. 
	nop			;d8f6	00 	. 
	nop			;d8f7	00 	. 
	nop			;d8f8	00 	. 
	nop			;d8f9	00 	. 
	nop			;d8fa	00 	. 
	nop			;d8fb	00 	. 
	nop			;d8fc	00 	. 
	nop			;d8fd	00 	. 
	nop			;d8fe	00 	. 
	nop			;d8ff	00 	. 
	nop			;d900	00 	. 
	nop			;d901	00 	. 
	nop			;d902	00 	. 
	nop			;d903	00 	. 
	nop			;d904	00 	. 
	nop			;d905	00 	. 
	nop			;d906	00 	. 
	nop			;d907	00 	. 
	nop			;d908	00 	. 
	nop			;d909	00 	. 
	nop			;d90a	00 	. 
	nop			;d90b	00 	. 
	nop			;d90c	00 	. 
	nop			;d90d	00 	. 
	nop			;d90e	00 	. 
	nop			;d90f	00 	. 
	nop			;d910	00 	. 
	nop			;d911	00 	. 
	nop			;d912	00 	. 
	nop			;d913	00 	. 
	nop			;d914	00 	. 
	nop			;d915	00 	. 
	nop			;d916	00 	. 
	nop			;d917	00 	. 
	nop			;d918	00 	. 
	nop			;d919	00 	. 
	nop			;d91a	00 	. 
	nop			;d91b	00 	. 
	nop			;d91c	00 	. 
	nop			;d91d	00 	. 
	nop			;d91e	00 	. 
	nop			;d91f	00 	. 
	nop			;d920	00 	. 
	nop			;d921	00 	. 
	nop			;d922	00 	. 
	nop			;d923	00 	. 
	nop			;d924	00 	. 
	nop			;d925	00 	. 
	nop			;d926	00 	. 
	nop			;d927	00 	. 
	nop			;d928	00 	. 
	nop			;d929	00 	. 
	nop			;d92a	00 	. 
	nop			;d92b	00 	. 
	nop			;d92c	00 	. 
	nop			;d92d	00 	. 
	nop			;d92e	00 	. 
	nop			;d92f	00 	. 
	nop			;d930	00 	. 
	nop			;d931	00 	. 
	nop			;d932	00 	. 
	nop			;d933	00 	. 
	nop			;d934	00 	. 
	nop			;d935	00 	. 
	nop			;d936	00 	. 
	nop			;d937	00 	. 
	nop			;d938	00 	. 
	nop			;d939	00 	. 
	nop			;d93a	00 	. 
	nop			;d93b	00 	. 
	nop			;d93c	00 	. 
	nop			;d93d	00 	. 
	nop			;d93e	00 	. 
	nop			;d93f	00 	. 
	nop			;d940	00 	. 
	nop			;d941	00 	. 
	nop			;d942	00 	. 
	nop			;d943	00 	. 
	nop			;d944	00 	. 
	nop			;d945	00 	. 
	nop			;d946	00 	. 
	nop			;d947	00 	. 
	nop			;d948	00 	. 
	nop			;d949	00 	. 
	nop			;d94a	00 	. 
	nop			;d94b	00 	. 
	nop			;d94c	00 	. 
	nop			;d94d	00 	. 
	nop			;d94e	00 	. 
	nop			;d94f	00 	. 
	nop			;d950	00 	. 
	nop			;d951	00 	. 
	nop			;d952	00 	. 
	nop			;d953	00 	. 
	nop			;d954	00 	. 
	nop			;d955	00 	. 
	nop			;d956	00 	. 
	nop			;d957	00 	. 
	nop			;d958	00 	. 
	nop			;d959	00 	. 
	nop			;d95a	00 	. 
	nop			;d95b	00 	. 
	nop			;d95c	00 	. 
	nop			;d95d	00 	. 
	nop			;d95e	00 	. 
	nop			;d95f	00 	. 
	nop			;d960	00 	. 
	nop			;d961	00 	. 
	nop			;d962	00 	. 
	nop			;d963	00 	. 
	nop			;d964	00 	. 
	nop			;d965	00 	. 
	nop			;d966	00 	. 
	nop			;d967	00 	. 
	nop			;d968	00 	. 
	nop			;d969	00 	. 
	nop			;d96a	00 	. 
	nop			;d96b	00 	. 
	nop			;d96c	00 	. 
	nop			;d96d	00 	. 
	nop			;d96e	00 	. 
	nop			;d96f	00 	. 
	nop			;d970	00 	. 
	nop			;d971	00 	. 
	nop			;d972	00 	. 
	nop			;d973	00 	. 
	nop			;d974	00 	. 
	nop			;d975	00 	. 
	nop			;d976	00 	. 
	nop			;d977	00 	. 
	nop			;d978	00 	. 
	nop			;d979	00 	. 
	nop			;d97a	00 	. 
	nop			;d97b	00 	. 
	nop			;d97c	00 	. 
	nop			;d97d	00 	. 
	nop			;d97e	00 	. 
	nop			;d97f	00 	. 
	nop			;d980	00 	. 
	nop			;d981	00 	. 
	nop			;d982	00 	. 
	nop			;d983	00 	. 
	nop			;d984	00 	. 
	nop			;d985	00 	. 
	nop			;d986	00 	. 
	nop			;d987	00 	. 
	nop			;d988	00 	. 
	nop			;d989	00 	. 
	nop			;d98a	00 	. 
	nop			;d98b	00 	. 
	nop			;d98c	00 	. 
	nop			;d98d	00 	. 
	nop			;d98e	00 	. 
	nop			;d98f	00 	. 
	nop			;d990	00 	. 
	nop			;d991	00 	. 
	nop			;d992	00 	. 
	nop			;d993	00 	. 
	nop			;d994	00 	. 
	nop			;d995	00 	. 
	nop			;d996	00 	. 
	nop			;d997	00 	. 
	nop			;d998	00 	. 
	nop			;d999	00 	. 
	nop			;d99a	00 	. 
	nop			;d99b	00 	. 
	nop			;d99c	00 	. 
	nop			;d99d	00 	. 
	nop			;d99e	00 	. 
	nop			;d99f	00 	. 
	nop			;d9a0	00 	. 
	nop			;d9a1	00 	. 
	nop			;d9a2	00 	. 
	nop			;d9a3	00 	. 
	nop			;d9a4	00 	. 
	nop			;d9a5	00 	. 
	nop			;d9a6	00 	. 
	nop			;d9a7	00 	. 
	nop			;d9a8	00 	. 
	nop			;d9a9	00 	. 
	nop			;d9aa	00 	. 
	nop			;d9ab	00 	. 
	nop			;d9ac	00 	. 
	nop			;d9ad	00 	. 
	nop			;d9ae	00 	. 
	nop			;d9af	00 	. 
	nop			;d9b0	00 	. 
	nop			;d9b1	00 	. 
	nop			;d9b2	00 	. 
	nop			;d9b3	00 	. 
	nop			;d9b4	00 	. 
	nop			;d9b5	00 	. 
	nop			;d9b6	00 	. 
	nop			;d9b7	00 	. 
	nop			;d9b8	00 	. 
	nop			;d9b9	00 	. 
	nop			;d9ba	00 	. 
	nop			;d9bb	00 	. 
	nop			;d9bc	00 	. 
	nop			;d9bd	00 	. 
	nop			;d9be	00 	. 
	nop			;d9bf	00 	. 
	nop			;d9c0	00 	. 
	nop			;d9c1	00 	. 
	nop			;d9c2	00 	. 
	nop			;d9c3	00 	. 
	nop			;d9c4	00 	. 
	nop			;d9c5	00 	. 
	nop			;d9c6	00 	. 
	nop			;d9c7	00 	. 
	nop			;d9c8	00 	. 
	nop			;d9c9	00 	. 
	nop			;d9ca	00 	. 
	nop			;d9cb	00 	. 
	nop			;d9cc	00 	. 
	nop			;d9cd	00 	. 
	nop			;d9ce	00 	. 
	nop			;d9cf	00 	. 
	nop			;d9d0	00 	. 
	nop			;d9d1	00 	. 
	nop			;d9d2	00 	. 
	nop			;d9d3	00 	. 
	nop			;d9d4	00 	. 
	nop			;d9d5	00 	. 
	nop			;d9d6	00 	. 
	nop			;d9d7	00 	. 
	nop			;d9d8	00 	. 
	nop			;d9d9	00 	. 
	nop			;d9da	00 	. 
	nop			;d9db	00 	. 
	nop			;d9dc	00 	. 
	nop			;d9dd	00 	. 
	nop			;d9de	00 	. 
	nop			;d9df	00 	. 
	nop			;d9e0	00 	. 
	nop			;d9e1	00 	. 
	nop			;d9e2	00 	. 
	nop			;d9e3	00 	. 
	nop			;d9e4	00 	. 
	nop			;d9e5	00 	. 
	nop			;d9e6	00 	. 
	nop			;d9e7	00 	. 
	nop			;d9e8	00 	. 
	nop			;d9e9	00 	. 
	nop			;d9ea	00 	. 
	nop			;d9eb	00 	. 
	nop			;d9ec	00 	. 
	nop			;d9ed	00 	. 
	nop			;d9ee	00 	. 
	nop			;d9ef	00 	. 
	nop			;d9f0	00 	. 
	nop			;d9f1	00 	. 
	nop			;d9f2	00 	. 
	nop			;d9f3	00 	. 
	nop			;d9f4	00 	. 
	nop			;d9f5	00 	. 
	nop			;d9f6	00 	. 
	nop			;d9f7	00 	. 
	nop			;d9f8	00 	. 
	nop			;d9f9	00 	. 
	nop			;d9fa	00 	. 
	nop			;d9fb	00 	. 
	nop			;d9fc	00 	. 
	nop			;d9fd	00 	. 
	nop			;d9fe	00 	. 
	nop			;d9ff	00 	. 
	nop			;da00	00 	. 
	nop			;da01	00 	. 
	nop			;da02	00 	. 
	nop			;da03	00 	. 
	nop			;da04	00 	. 
	nop			;da05	00 	. 
	nop			;da06	00 	. 
	nop			;da07	00 	. 
	nop			;da08	00 	. 
	nop			;da09	00 	. 
	nop			;da0a	00 	. 
	nop			;da0b	00 	. 
	nop			;da0c	00 	. 
	nop			;da0d	00 	. 
	nop			;da0e	00 	. 
	nop			;da0f	00 	. 
	nop			;da10	00 	. 
	nop			;da11	00 	. 
	nop			;da12	00 	. 
	nop			;da13	00 	. 
	nop			;da14	00 	. 
	nop			;da15	00 	. 
	nop			;da16	00 	. 
	nop			;da17	00 	. 
	nop			;da18	00 	. 
	nop			;da19	00 	. 
	nop			;da1a	00 	. 
	nop			;da1b	00 	. 
	nop			;da1c	00 	. 
	nop			;da1d	00 	. 
	nop			;da1e	00 	. 
	nop			;da1f	00 	. 
	nop			;da20	00 	. 
	nop			;da21	00 	. 
	nop			;da22	00 	. 
	nop			;da23	00 	. 
	nop			;da24	00 	. 
	nop			;da25	00 	. 
	nop			;da26	00 	. 
	nop			;da27	00 	. 
	nop			;da28	00 	. 
	nop			;da29	00 	. 
	nop			;da2a	00 	. 
	nop			;da2b	00 	. 
	nop			;da2c	00 	. 
	nop			;da2d	00 	. 
	nop			;da2e	00 	. 
	nop			;da2f	00 	. 
	nop			;da30	00 	. 
	nop			;da31	00 	. 
	nop			;da32	00 	. 
	nop			;da33	00 	. 
	nop			;da34	00 	. 
	nop			;da35	00 	. 
	nop			;da36	00 	. 
	nop			;da37	00 	. 
	nop			;da38	00 	. 
	nop			;da39	00 	. 
	nop			;da3a	00 	. 
	nop			;da3b	00 	. 
	nop			;da3c	00 	. 
	nop			;da3d	00 	. 
	nop			;da3e	00 	. 
	nop			;da3f	00 	. 
	nop			;da40	00 	. 
	nop			;da41	00 	. 
	nop			;da42	00 	. 
	nop			;da43	00 	. 
	nop			;da44	00 	. 
	nop			;da45	00 	. 
	nop			;da46	00 	. 
	nop			;da47	00 	. 
	nop			;da48	00 	. 
	nop			;da49	00 	. 
	nop			;da4a	00 	. 
	nop			;da4b	00 	. 
	nop			;da4c	00 	. 
	nop			;da4d	00 	. 
	nop			;da4e	00 	. 
	nop			;da4f	00 	. 
	nop			;da50	00 	. 
	nop			;da51	00 	. 
	nop			;da52	00 	. 
	nop			;da53	00 	. 
	nop			;da54	00 	. 
	nop			;da55	00 	. 
	nop			;da56	00 	. 
	nop			;da57	00 	. 
	nop			;da58	00 	. 
	nop			;da59	00 	. 
	nop			;da5a	00 	. 
	nop			;da5b	00 	. 
	nop			;da5c	00 	. 
	nop			;da5d	00 	. 
	nop			;da5e	00 	. 
	nop			;da5f	00 	. 
	nop			;da60	00 	. 
	nop			;da61	00 	. 
	nop			;da62	00 	. 
	nop			;da63	00 	. 
	nop			;da64	00 	. 
	nop			;da65	00 	. 
	nop			;da66	00 	. 
	nop			;da67	00 	. 
	nop			;da68	00 	. 
	nop			;da69	00 	. 
	nop			;da6a	00 	. 
	nop			;da6b	00 	. 
	nop			;da6c	00 	. 
	nop			;da6d	00 	. 
	nop			;da6e	00 	. 
	nop			;da6f	00 	. 
	nop			;da70	00 	. 
	nop			;da71	00 	. 
	nop			;da72	00 	. 
	nop			;da73	00 	. 
	nop			;da74	00 	. 
	nop			;da75	00 	. 
	nop			;da76	00 	. 
	nop			;da77	00 	. 
	nop			;da78	00 	. 
	nop			;da79	00 	. 
	nop			;da7a	00 	. 
	nop			;da7b	00 	. 
	nop			;da7c	00 	. 
	nop			;da7d	00 	. 
	nop			;da7e	00 	. 
	nop			;da7f	00 	. 
	nop			;da80	00 	. 
	nop			;da81	00 	. 
	nop			;da82	00 	. 
	nop			;da83	00 	. 
	nop			;da84	00 	. 
	nop			;da85	00 	. 
	nop			;da86	00 	. 
	nop			;da87	00 	. 
	nop			;da88	00 	. 
	nop			;da89	00 	. 
	nop			;da8a	00 	. 
	nop			;da8b	00 	. 
	nop			;da8c	00 	. 
	nop			;da8d	00 	. 
	nop			;da8e	00 	. 
	nop			;da8f	00 	. 
	nop			;da90	00 	. 
	nop			;da91	00 	. 
	nop			;da92	00 	. 
	nop			;da93	00 	. 
	nop			;da94	00 	. 
	nop			;da95	00 	. 
	nop			;da96	00 	. 
	nop			;da97	00 	. 
	nop			;da98	00 	. 
	nop			;da99	00 	. 
	nop			;da9a	00 	. 
	nop			;da9b	00 	. 
	nop			;da9c	00 	. 
	nop			;da9d	00 	. 
	nop			;da9e	00 	. 
	nop			;da9f	00 	. 
	nop			;daa0	00 	. 
	nop			;daa1	00 	. 
	nop			;daa2	00 	. 
	nop			;daa3	00 	. 
	nop			;daa4	00 	. 
	nop			;daa5	00 	. 
	nop			;daa6	00 	. 
	nop			;daa7	00 	. 
	nop			;daa8	00 	. 
	nop			;daa9	00 	. 
	nop			;daaa	00 	. 
	nop			;daab	00 	. 
	nop			;daac	00 	. 
	nop			;daad	00 	. 
	nop			;daae	00 	. 
	nop			;daaf	00 	. 
	nop			;dab0	00 	. 
	nop			;dab1	00 	. 
	nop			;dab2	00 	. 
	nop			;dab3	00 	. 
	nop			;dab4	00 	. 
	nop			;dab5	00 	. 
	nop			;dab6	00 	. 
	nop			;dab7	00 	. 
	nop			;dab8	00 	. 
	nop			;dab9	00 	. 
	nop			;daba	00 	. 
	nop			;dabb	00 	. 
	nop			;dabc	00 	. 
	nop			;dabd	00 	. 
	nop			;dabe	00 	. 
	nop			;dabf	00 	. 
	nop			;dac0	00 	. 
	nop			;dac1	00 	. 
	nop			;dac2	00 	. 
	nop			;dac3	00 	. 
	nop			;dac4	00 	. 
	nop			;dac5	00 	. 
	nop			;dac6	00 	. 
	nop			;dac7	00 	. 
	nop			;dac8	00 	. 
	nop			;dac9	00 	. 
	nop			;daca	00 	. 
	nop			;dacb	00 	. 
	nop			;dacc	00 	. 
	nop			;dacd	00 	. 
	nop			;dace	00 	. 
	nop			;dacf	00 	. 
	nop			;dad0	00 	. 
	nop			;dad1	00 	. 
	nop			;dad2	00 	. 
	nop			;dad3	00 	. 
	nop			;dad4	00 	. 
	nop			;dad5	00 	. 
	nop			;dad6	00 	. 
	nop			;dad7	00 	. 
	nop			;dad8	00 	. 
	nop			;dad9	00 	. 
	nop			;dada	00 	. 
	nop			;dadb	00 	. 
	nop			;dadc	00 	. 
	nop			;dadd	00 	. 
	nop			;dade	00 	. 
	nop			;dadf	00 	. 
	nop			;dae0	00 	. 
	nop			;dae1	00 	. 
	nop			;dae2	00 	. 
	nop			;dae3	00 	. 
	nop			;dae4	00 	. 
	nop			;dae5	00 	. 
	nop			;dae6	00 	. 
	nop			;dae7	00 	. 
	nop			;dae8	00 	. 
	nop			;dae9	00 	. 
	nop			;daea	00 	. 
	nop			;daeb	00 	. 
	nop			;daec	00 	. 
	nop			;daed	00 	. 
	nop			;daee	00 	. 
	nop			;daef	00 	. 
	nop			;daf0	00 	. 
	nop			;daf1	00 	. 
	nop			;daf2	00 	. 
	nop			;daf3	00 	. 
	nop			;daf4	00 	. 
	nop			;daf5	00 	. 
	nop			;daf6	00 	. 
	nop			;daf7	00 	. 
	nop			;daf8	00 	. 
	nop			;daf9	00 	. 
	nop			;dafa	00 	. 
	nop			;dafb	00 	. 
	nop			;dafc	00 	. 
	nop			;dafd	00 	. 
	nop			;dafe	00 	. 
	nop			;daff	00 	. 
	nop			;db00	00 	. 
	nop			;db01	00 	. 
	nop			;db02	00 	. 
	nop			;db03	00 	. 
	nop			;db04	00 	. 
	nop			;db05	00 	. 
	nop			;db06	00 	. 
	nop			;db07	00 	. 
	nop			;db08	00 	. 
	nop			;db09	00 	. 
	nop			;db0a	00 	. 
	nop			;db0b	00 	. 
	nop			;db0c	00 	. 
	nop			;db0d	00 	. 
	nop			;db0e	00 	. 
	nop			;db0f	00 	. 
	nop			;db10	00 	. 
	nop			;db11	00 	. 
	nop			;db12	00 	. 
	nop			;db13	00 	. 
	nop			;db14	00 	. 
	nop			;db15	00 	. 
	nop			;db16	00 	. 
	nop			;db17	00 	. 
	nop			;db18	00 	. 
	nop			;db19	00 	. 
	nop			;db1a	00 	. 
	nop			;db1b	00 	. 
	nop			;db1c	00 	. 
	nop			;db1d	00 	. 
	nop			;db1e	00 	. 
	nop			;db1f	00 	. 
	nop			;db20	00 	. 
	nop			;db21	00 	. 
	nop			;db22	00 	. 
	nop			;db23	00 	. 
	nop			;db24	00 	. 
	nop			;db25	00 	. 
	nop			;db26	00 	. 
	nop			;db27	00 	. 
	nop			;db28	00 	. 
	nop			;db29	00 	. 
	nop			;db2a	00 	. 
	nop			;db2b	00 	. 
	nop			;db2c	00 	. 
	nop			;db2d	00 	. 
	nop			;db2e	00 	. 
	nop			;db2f	00 	. 
	nop			;db30	00 	. 
	nop			;db31	00 	. 
	nop			;db32	00 	. 
	nop			;db33	00 	. 
	nop			;db34	00 	. 
	nop			;db35	00 	. 
	nop			;db36	00 	. 
	nop			;db37	00 	. 
	nop			;db38	00 	. 
	nop			;db39	00 	. 
	nop			;db3a	00 	. 
	nop			;db3b	00 	. 
	nop			;db3c	00 	. 
	nop			;db3d	00 	. 
	nop			;db3e	00 	. 
	nop			;db3f	00 	. 
	nop			;db40	00 	. 
	nop			;db41	00 	. 
	nop			;db42	00 	. 
	nop			;db43	00 	. 
	nop			;db44	00 	. 
	nop			;db45	00 	. 
	nop			;db46	00 	. 
	nop			;db47	00 	. 
	nop			;db48	00 	. 
	nop			;db49	00 	. 
	nop			;db4a	00 	. 
	nop			;db4b	00 	. 
	nop			;db4c	00 	. 
	nop			;db4d	00 	. 
	nop			;db4e	00 	. 
	nop			;db4f	00 	. 
	nop			;db50	00 	. 
	nop			;db51	00 	. 
	nop			;db52	00 	. 
	nop			;db53	00 	. 
	nop			;db54	00 	. 
	nop			;db55	00 	. 
	nop			;db56	00 	. 
	nop			;db57	00 	. 
	nop			;db58	00 	. 
	nop			;db59	00 	. 
	nop			;db5a	00 	. 
	nop			;db5b	00 	. 
	nop			;db5c	00 	. 
	nop			;db5d	00 	. 
	nop			;db5e	00 	. 
	nop			;db5f	00 	. 
	nop			;db60	00 	. 
	nop			;db61	00 	. 
	nop			;db62	00 	. 
	nop			;db63	00 	. 
	nop			;db64	00 	. 
	nop			;db65	00 	. 
	nop			;db66	00 	. 
	nop			;db67	00 	. 
	nop			;db68	00 	. 
	nop			;db69	00 	. 
	nop			;db6a	00 	. 
	nop			;db6b	00 	. 
	nop			;db6c	00 	. 
	nop			;db6d	00 	. 
	nop			;db6e	00 	. 
	nop			;db6f	00 	. 
	nop			;db70	00 	. 
	nop			;db71	00 	. 
	nop			;db72	00 	. 
	nop			;db73	00 	. 
	nop			;db74	00 	. 
	nop			;db75	00 	. 
	nop			;db76	00 	. 
	nop			;db77	00 	. 
	nop			;db78	00 	. 
	nop			;db79	00 	. 
	nop			;db7a	00 	. 
	nop			;db7b	00 	. 
	nop			;db7c	00 	. 
	nop			;db7d	00 	. 
	nop			;db7e	00 	. 
	nop			;db7f	00 	. 
	nop			;db80	00 	. 
	nop			;db81	00 	. 
	nop			;db82	00 	. 
	nop			;db83	00 	. 
	nop			;db84	00 	. 
	nop			;db85	00 	. 
	nop			;db86	00 	. 
	nop			;db87	00 	. 
	nop			;db88	00 	. 
	nop			;db89	00 	. 
	nop			;db8a	00 	. 
	nop			;db8b	00 	. 
	nop			;db8c	00 	. 
	nop			;db8d	00 	. 
	nop			;db8e	00 	. 
	nop			;db8f	00 	. 
	nop			;db90	00 	. 
	nop			;db91	00 	. 
	nop			;db92	00 	. 
	nop			;db93	00 	. 
	nop			;db94	00 	. 
	nop			;db95	00 	. 
	nop			;db96	00 	. 
	nop			;db97	00 	. 
	nop			;db98	00 	. 
	nop			;db99	00 	. 
	nop			;db9a	00 	. 
	nop			;db9b	00 	. 
	nop			;db9c	00 	. 
	nop			;db9d	00 	. 
	nop			;db9e	00 	. 
	nop			;db9f	00 	. 
	nop			;dba0	00 	. 
	nop			;dba1	00 	. 
	nop			;dba2	00 	. 
	nop			;dba3	00 	. 
	nop			;dba4	00 	. 
	nop			;dba5	00 	. 
	nop			;dba6	00 	. 
	nop			;dba7	00 	. 
	nop			;dba8	00 	. 
	nop			;dba9	00 	. 
	nop			;dbaa	00 	. 
	nop			;dbab	00 	. 
	nop			;dbac	00 	. 
	nop			;dbad	00 	. 
	nop			;dbae	00 	. 
	nop			;dbaf	00 	. 
	nop			;dbb0	00 	. 
	nop			;dbb1	00 	. 
	nop			;dbb2	00 	. 
	nop			;dbb3	00 	. 
	nop			;dbb4	00 	. 
	nop			;dbb5	00 	. 
	nop			;dbb6	00 	. 
	nop			;dbb7	00 	. 
	nop			;dbb8	00 	. 
	nop			;dbb9	00 	. 
	nop			;dbba	00 	. 
	nop			;dbbb	00 	. 
	nop			;dbbc	00 	. 
	nop			;dbbd	00 	. 
	nop			;dbbe	00 	. 
	nop			;dbbf	00 	. 
	nop			;dbc0	00 	. 
	nop			;dbc1	00 	. 
	nop			;dbc2	00 	. 
	nop			;dbc3	00 	. 
	nop			;dbc4	00 	. 
	nop			;dbc5	00 	. 
	nop			;dbc6	00 	. 
	nop			;dbc7	00 	. 
	nop			;dbc8	00 	. 
	nop			;dbc9	00 	. 
	nop			;dbca	00 	. 
	nop			;dbcb	00 	. 
	nop			;dbcc	00 	. 
	nop			;dbcd	00 	. 
	nop			;dbce	00 	. 
	nop			;dbcf	00 	. 
	nop			;dbd0	00 	. 
	nop			;dbd1	00 	. 
	nop			;dbd2	00 	. 
	nop			;dbd3	00 	. 
	nop			;dbd4	00 	. 
	nop			;dbd5	00 	. 
	nop			;dbd6	00 	. 
	nop			;dbd7	00 	. 
	nop			;dbd8	00 	. 
	nop			;dbd9	00 	. 
	nop			;dbda	00 	. 
	nop			;dbdb	00 	. 
	nop			;dbdc	00 	. 
	nop			;dbdd	00 	. 
	nop			;dbde	00 	. 
	nop			;dbdf	00 	. 
	ld h,b			;dbe0	60 	` 
	rst 38h			;dbe1	ff 	. 
	nop			;dbe2	00 	. 
	nop			;dbe3	00 	. 
	rst 38h			;dbe4	ff 	. 
	dec b			;dbe5	05 	. 
	nop			;dbe6	00 	. 
	nop			;dbe7	00 	. 
	add a,c			;dbe8	81 	. 
	nop			;dbe9	00 	. 
	ld bc,00100h		;dbea	01 00 01 	. . . 
	nop			;dbed	00 	. 
	nop			;dbee	00 	. 
	nop			;dbef	00 	. 
	ld bc,00000h		;dbf0	01 00 00 	. . . 
	ret po			;dbf3	e0 	. 

	nop			;dbf4	00 	. 
	nop			;dbf5	00 	. 
	nop			;dbf6	00 	. 
	nop			;dbf7	00 	. 
	nop			;dbf8	00 	. 
	nop			;dbf9	00 	. 
	nop			;dbfa	00 	. 
	nop			;dbfb	00 	. 
	nop			;dbfc	00 	. 
	nop			;dbfd	00 	. 
	nop			;dbfe	00 	. 
	nop			;dbff	00 	. 
	nop			;dc00	00 	. 
	nop			;dc01	00 	. 
	nop			;dc02	00 	. 
	nop			;dc03	00 	. 
	nop			;dc04	00 	. 
	nop			;dc05	00 	. 
	nop			;dc06	00 	. 
	nop			;dc07	00 	. 
	nop			;dc08	00 	. 
	nop			;dc09	00 	. 
	nop			;dc0a	00 	. 
	nop			;dc0b	00 	. 
	nop			;dc0c	00 	. 
	nop			;dc0d	00 	. 
	nop			;dc0e	00 	. 
	nop			;dc0f	00 	. 
	nop			;dc10	00 	. 
	nop			;dc11	00 	. 
	nop			;dc12	00 	. 
	nop			;dc13	00 	. 
	nop			;dc14	00 	. 
	nop			;dc15	00 	. 
	nop			;dc16	00 	. 
	nop			;dc17	00 	. 
	nop			;dc18	00 	. 
	nop			;dc19	00 	. 
	nop			;dc1a	00 	. 
	nop			;dc1b	00 	. 
	nop			;dc1c	00 	. 
	nop			;dc1d	00 	. 
	nop			;dc1e	00 	. 
	nop			;dc1f	00 	. 
	nop			;dc20	00 	. 
	nop			;dc21	00 	. 
	nop			;dc22	00 	. 
	nop			;dc23	00 	. 
	nop			;dc24	00 	. 
	nop			;dc25	00 	. 
	nop			;dc26	00 	. 
	nop			;dc27	00 	. 
	nop			;dc28	00 	. 
	nop			;dc29	00 	. 
	nop			;dc2a	00 	. 
	nop			;dc2b	00 	. 
	nop			;dc2c	00 	. 
	nop			;dc2d	00 	. 
	nop			;dc2e	00 	. 
	nop			;dc2f	00 	. 
	nop			;dc30	00 	. 
	nop			;dc31	00 	. 
	nop			;dc32	00 	. 
	nop			;dc33	00 	. 
	nop			;dc34	00 	. 
	nop			;dc35	00 	. 
	nop			;dc36	00 	. 
	nop			;dc37	00 	. 
	nop			;dc38	00 	. 
	nop			;dc39	00 	. 
	nop			;dc3a	00 	. 
	nop			;dc3b	00 	. 
	nop			;dc3c	00 	. 
	nop			;dc3d	00 	. 
	nop			;dc3e	00 	. 
	nop			;dc3f	00 	. 
	nop			;dc40	00 	. 
	nop			;dc41	00 	. 
	nop			;dc42	00 	. 
	nop			;dc43	00 	. 
	nop			;dc44	00 	. 
	nop			;dc45	00 	. 
	nop			;dc46	00 	. 
	nop			;dc47	00 	. 
	nop			;dc48	00 	. 
	nop			;dc49	00 	. 
	nop			;dc4a	00 	. 
	nop			;dc4b	00 	. 
	nop			;dc4c	00 	. 
	nop			;dc4d	00 	. 
	nop			;dc4e	00 	. 
	nop			;dc4f	00 	. 
	nop			;dc50	00 	. 
	nop			;dc51	00 	. 
	nop			;dc52	00 	. 
	nop			;dc53	00 	. 
	nop			;dc54	00 	. 
	nop			;dc55	00 	. 
	nop			;dc56	00 	. 
	nop			;dc57	00 	. 
	nop			;dc58	00 	. 
	nop			;dc59	00 	. 
	nop			;dc5a	00 	. 
	nop			;dc5b	00 	. 
	nop			;dc5c	00 	. 
	nop			;dc5d	00 	. 
	nop			;dc5e	00 	. 
	nop			;dc5f	00 	. 
	nop			;dc60	00 	. 
	nop			;dc61	00 	. 
	nop			;dc62	00 	. 
	nop			;dc63	00 	. 
	nop			;dc64	00 	. 
	nop			;dc65	00 	. 
	nop			;dc66	00 	. 
	nop			;dc67	00 	. 
	nop			;dc68	00 	. 
	nop			;dc69	00 	. 
	nop			;dc6a	00 	. 
	nop			;dc6b	00 	. 
	nop			;dc6c	00 	. 
	nop			;dc6d	00 	. 
	nop			;dc6e	00 	. 
	nop			;dc6f	00 	. 
	nop			;dc70	00 	. 
	nop			;dc71	00 	. 
	nop			;dc72	00 	. 
	nop			;dc73	00 	. 
	nop			;dc74	00 	. 
	nop			;dc75	00 	. 
	nop			;dc76	00 	. 
	nop			;dc77	00 	. 
	nop			;dc78	00 	. 
	nop			;dc79	00 	. 
	nop			;dc7a	00 	. 
	nop			;dc7b	00 	. 
	nop			;dc7c	00 	. 
	nop			;dc7d	00 	. 
	nop			;dc7e	00 	. 
	nop			;dc7f	00 	. 
	nop			;dc80	00 	. 
	nop			;dc81	00 	. 
	nop			;dc82	00 	. 
	nop			;dc83	00 	. 
	nop			;dc84	00 	. 
	nop			;dc85	00 	. 
	nop			;dc86	00 	. 
	nop			;dc87	00 	. 
	nop			;dc88	00 	. 
	nop			;dc89	00 	. 
	nop			;dc8a	00 	. 
	nop			;dc8b	00 	. 
	nop			;dc8c	00 	. 
	nop			;dc8d	00 	. 
	nop			;dc8e	00 	. 
	nop			;dc8f	00 	. 
	nop			;dc90	00 	. 
	nop			;dc91	00 	. 
	nop			;dc92	00 	. 
	nop			;dc93	00 	. 
	nop			;dc94	00 	. 
	nop			;dc95	00 	. 
	nop			;dc96	00 	. 
	nop			;dc97	00 	. 
	nop			;dc98	00 	. 
	nop			;dc99	00 	. 
	nop			;dc9a	00 	. 
	nop			;dc9b	00 	. 
	nop			;dc9c	00 	. 
	nop			;dc9d	00 	. 
	nop			;dc9e	00 	. 
	nop			;dc9f	00 	. 
	nop			;dca0	00 	. 
	nop			;dca1	00 	. 
	nop			;dca2	00 	. 
	nop			;dca3	00 	. 
	nop			;dca4	00 	. 
	nop			;dca5	00 	. 
	nop			;dca6	00 	. 
	nop			;dca7	00 	. 
	nop			;dca8	00 	. 
	nop			;dca9	00 	. 
	nop			;dcaa	00 	. 
	nop			;dcab	00 	. 
	nop			;dcac	00 	. 
	nop			;dcad	00 	. 
	nop			;dcae	00 	. 
	nop			;dcaf	00 	. 
	nop			;dcb0	00 	. 
	nop			;dcb1	00 	. 
	nop			;dcb2	00 	. 
	nop			;dcb3	00 	. 
	nop			;dcb4	00 	. 
	nop			;dcb5	00 	. 
	nop			;dcb6	00 	. 
	nop			;dcb7	00 	. 
	nop			;dcb8	00 	. 
	nop			;dcb9	00 	. 
	nop			;dcba	00 	. 
	nop			;dcbb	00 	. 
	nop			;dcbc	00 	. 
	nop			;dcbd	00 	. 
	nop			;dcbe	00 	. 
	nop			;dcbf	00 	. 
	nop			;dcc0	00 	. 
	nop			;dcc1	00 	. 
	nop			;dcc2	00 	. 
	nop			;dcc3	00 	. 
	nop			;dcc4	00 	. 
	nop			;dcc5	00 	. 
	nop			;dcc6	00 	. 
	nop			;dcc7	00 	. 
	nop			;dcc8	00 	. 
	nop			;dcc9	00 	. 
	nop			;dcca	00 	. 
	nop			;dccb	00 	. 
	nop			;dccc	00 	. 
	nop			;dccd	00 	. 
	nop			;dcce	00 	. 
	nop			;dccf	00 	. 
	nop			;dcd0	00 	. 
	nop			;dcd1	00 	. 
	nop			;dcd2	00 	. 
	nop			;dcd3	00 	. 
	nop			;dcd4	00 	. 
	nop			;dcd5	00 	. 
	nop			;dcd6	00 	. 
	nop			;dcd7	00 	. 
	nop			;dcd8	00 	. 
	nop			;dcd9	00 	. 
	nop			;dcda	00 	. 
	nop			;dcdb	00 	. 
	nop			;dcdc	00 	. 
	nop			;dcdd	00 	. 
	nop			;dcde	00 	. 
	nop			;dcdf	00 	. 
	nop			;dce0	00 	. 
	nop			;dce1	00 	. 
	nop			;dce2	00 	. 
	nop			;dce3	00 	. 
	nop			;dce4	00 	. 
	nop			;dce5	00 	. 
	nop			;dce6	00 	. 
	nop			;dce7	00 	. 
	nop			;dce8	00 	. 
	nop			;dce9	00 	. 
	nop			;dcea	00 	. 
	nop			;dceb	00 	. 
	nop			;dcec	00 	. 
	nop			;dced	00 	. 
	nop			;dcee	00 	. 
	nop			;dcef	00 	. 
	nop			;dcf0	00 	. 
	nop			;dcf1	00 	. 
	nop			;dcf2	00 	. 
	nop			;dcf3	00 	. 
	nop			;dcf4	00 	. 
	nop			;dcf5	00 	. 
	nop			;dcf6	00 	. 
	nop			;dcf7	00 	. 
	nop			;dcf8	00 	. 
	nop			;dcf9	00 	. 
	nop			;dcfa	00 	. 
	nop			;dcfb	00 	. 
	nop			;dcfc	00 	. 
	nop			;dcfd	00 	. 
	nop			;dcfe	00 	. 
	nop			;dcff	00 	. 
	nop			;dd00	00 	. 
	nop			;dd01	00 	. 
	nop			;dd02	00 	. 
	nop			;dd03	00 	. 
	nop			;dd04	00 	. 
	nop			;dd05	00 	. 
	nop			;dd06	00 	. 
	nop			;dd07	00 	. 
	nop			;dd08	00 	. 
	nop			;dd09	00 	. 
	nop			;dd0a	00 	. 
	nop			;dd0b	00 	. 
	nop			;dd0c	00 	. 
	nop			;dd0d	00 	. 
	nop			;dd0e	00 	. 
	nop			;dd0f	00 	. 
	nop			;dd10	00 	. 
	nop			;dd11	00 	. 
	nop			;dd12	00 	. 
	nop			;dd13	00 	. 
	nop			;dd14	00 	. 
	nop			;dd15	00 	. 
	nop			;dd16	00 	. 
	nop			;dd17	00 	. 
	nop			;dd18	00 	. 
	nop			;dd19	00 	. 
	nop			;dd1a	00 	. 
	nop			;dd1b	00 	. 
	nop			;dd1c	00 	. 
	nop			;dd1d	00 	. 
	nop			;dd1e	00 	. 
	nop			;dd1f	00 	. 
	nop			;dd20	00 	. 
	nop			;dd21	00 	. 
	nop			;dd22	00 	. 
	nop			;dd23	00 	. 
	nop			;dd24	00 	. 
	nop			;dd25	00 	. 
	nop			;dd26	00 	. 
	nop			;dd27	00 	. 
	nop			;dd28	00 	. 
	nop			;dd29	00 	. 
	nop			;dd2a	00 	. 
	nop			;dd2b	00 	. 
	nop			;dd2c	00 	. 
	nop			;dd2d	00 	. 
	nop			;dd2e	00 	. 
	nop			;dd2f	00 	. 
	nop			;dd30	00 	. 
	nop			;dd31	00 	. 
	nop			;dd32	00 	. 
	nop			;dd33	00 	. 
	nop			;dd34	00 	. 
	nop			;dd35	00 	. 
	nop			;dd36	00 	. 
	nop			;dd37	00 	. 
	nop			;dd38	00 	. 
	nop			;dd39	00 	. 
	nop			;dd3a	00 	. 
	nop			;dd3b	00 	. 
	nop			;dd3c	00 	. 
	nop			;dd3d	00 	. 
	nop			;dd3e	00 	. 
	nop			;dd3f	00 	. 
	nop			;dd40	00 	. 
	nop			;dd41	00 	. 
	nop			;dd42	00 	. 
	nop			;dd43	00 	. 
	nop			;dd44	00 	. 
	nop			;dd45	00 	. 
	nop			;dd46	00 	. 
	nop			;dd47	00 	. 
	nop			;dd48	00 	. 
	nop			;dd49	00 	. 
	nop			;dd4a	00 	. 
	nop			;dd4b	00 	. 
	nop			;dd4c	00 	. 
	nop			;dd4d	00 	. 
	nop			;dd4e	00 	. 
	nop			;dd4f	00 	. 
	nop			;dd50	00 	. 
	nop			;dd51	00 	. 
	nop			;dd52	00 	. 
	nop			;dd53	00 	. 
	nop			;dd54	00 	. 
	nop			;dd55	00 	. 
	nop			;dd56	00 	. 
	nop			;dd57	00 	. 
	nop			;dd58	00 	. 
	nop			;dd59	00 	. 
	nop			;dd5a	00 	. 
	nop			;dd5b	00 	. 
	nop			;dd5c	00 	. 
	nop			;dd5d	00 	. 
	nop			;dd5e	00 	. 
	nop			;dd5f	00 	. 
	nop			;dd60	00 	. 
	nop			;dd61	00 	. 
	nop			;dd62	00 	. 
	nop			;dd63	00 	. 
	nop			;dd64	00 	. 
	nop			;dd65	00 	. 
	nop			;dd66	00 	. 
	nop			;dd67	00 	. 
	nop			;dd68	00 	. 
	nop			;dd69	00 	. 
	nop			;dd6a	00 	. 
	nop			;dd6b	00 	. 
	nop			;dd6c	00 	. 
	nop			;dd6d	00 	. 
	nop			;dd6e	00 	. 
	nop			;dd6f	00 	. 
	nop			;dd70	00 	. 
	nop			;dd71	00 	. 
	nop			;dd72	00 	. 
	nop			;dd73	00 	. 
	nop			;dd74	00 	. 
	nop			;dd75	00 	. 
	nop			;dd76	00 	. 
	nop			;dd77	00 	. 
	nop			;dd78	00 	. 
	nop			;dd79	00 	. 
	nop			;dd7a	00 	. 
	nop			;dd7b	00 	. 
	nop			;dd7c	00 	. 
	nop			;dd7d	00 	. 
	nop			;dd7e	00 	. 
	nop			;dd7f	00 	. 
	nop			;dd80	00 	. 
	nop			;dd81	00 	. 
	nop			;dd82	00 	. 
	nop			;dd83	00 	. 
	nop			;dd84	00 	. 
	nop			;dd85	00 	. 
	nop			;dd86	00 	. 
	nop			;dd87	00 	. 
	nop			;dd88	00 	. 
	nop			;dd89	00 	. 
	nop			;dd8a	00 	. 
	nop			;dd8b	00 	. 
	nop			;dd8c	00 	. 
	nop			;dd8d	00 	. 
	nop			;dd8e	00 	. 
	nop			;dd8f	00 	. 
	nop			;dd90	00 	. 
	nop			;dd91	00 	. 
	nop			;dd92	00 	. 
	nop			;dd93	00 	. 
	nop			;dd94	00 	. 
	nop			;dd95	00 	. 
	nop			;dd96	00 	. 
	nop			;dd97	00 	. 
	nop			;dd98	00 	. 
	nop			;dd99	00 	. 
	nop			;dd9a	00 	. 
	nop			;dd9b	00 	. 
	nop			;dd9c	00 	. 
	nop			;dd9d	00 	. 
	nop			;dd9e	00 	. 
	nop			;dd9f	00 	. 
	nop			;dda0	00 	. 
	nop			;dda1	00 	. 
	nop			;dda2	00 	. 
	nop			;dda3	00 	. 
	nop			;dda4	00 	. 
	nop			;dda5	00 	. 
	nop			;dda6	00 	. 
	nop			;dda7	00 	. 
	nop			;dda8	00 	. 
	nop			;dda9	00 	. 
	nop			;ddaa	00 	. 
	nop			;ddab	00 	. 
	nop			;ddac	00 	. 
	nop			;ddad	00 	. 
	nop			;ddae	00 	. 
	nop			;ddaf	00 	. 
	nop			;ddb0	00 	. 
	nop			;ddb1	00 	. 
	nop			;ddb2	00 	. 
	nop			;ddb3	00 	. 
	nop			;ddb4	00 	. 
	nop			;ddb5	00 	. 
	nop			;ddb6	00 	. 
	nop			;ddb7	00 	. 
	nop			;ddb8	00 	. 
	nop			;ddb9	00 	. 
	nop			;ddba	00 	. 
	nop			;ddbb	00 	. 
	nop			;ddbc	00 	. 
	nop			;ddbd	00 	. 
	nop			;ddbe	00 	. 
	nop			;ddbf	00 	. 
	nop			;ddc0	00 	. 
	nop			;ddc1	00 	. 
	nop			;ddc2	00 	. 
	nop			;ddc3	00 	. 
	nop			;ddc4	00 	. 
	nop			;ddc5	00 	. 
	nop			;ddc6	00 	. 
	nop			;ddc7	00 	. 
	nop			;ddc8	00 	. 
	nop			;ddc9	00 	. 
	nop			;ddca	00 	. 
	nop			;ddcb	00 	. 
	nop			;ddcc	00 	. 
	nop			;ddcd	00 	. 
	nop			;ddce	00 	. 
	nop			;ddcf	00 	. 
	nop			;ddd0	00 	. 
	nop			;ddd1	00 	. 
	nop			;ddd2	00 	. 
	nop			;ddd3	00 	. 
	nop			;ddd4	00 	. 
	nop			;ddd5	00 	. 
	nop			;ddd6	00 	. 
	nop			;ddd7	00 	. 
	nop			;ddd8	00 	. 
	nop			;ddd9	00 	. 
	nop			;ddda	00 	. 
	nop			;dddb	00 	. 
	nop			;dddc	00 	. 
	nop			;dddd	00 	. 
	nop			;ddde	00 	. 
	nop			;dddf	00 	. 
	nop			;dde0	00 	. 
	nop			;dde1	00 	. 
	nop			;dde2	00 	. 
	nop			;dde3	00 	. 
	nop			;dde4	00 	. 
	nop			;dde5	00 	. 
	nop			;dde6	00 	. 
	nop			;dde7	00 	. 
	nop			;dde8	00 	. 
	nop			;dde9	00 	. 
	nop			;ddea	00 	. 
	nop			;ddeb	00 	. 
	nop			;ddec	00 	. 
	nop			;dded	00 	. 
	nop			;ddee	00 	. 
	nop			;ddef	00 	. 
	nop			;ddf0	00 	. 
	nop			;ddf1	00 	. 
	nop			;ddf2	00 	. 
	nop			;ddf3	00 	. 
	nop			;ddf4	00 	. 
	nop			;ddf5	00 	. 
	nop			;ddf6	00 	. 
	nop			;ddf7	00 	. 
	nop			;ddf8	00 	. 
	nop			;ddf9	00 	. 
	nop			;ddfa	00 	. 
	nop			;ddfb	00 	. 
	nop			;ddfc	00 	. 
	nop			;ddfd	00 	. 
	nop			;ddfe	00 	. 
	nop			;ddff	00 	. 
	nop			;de00	00 	. 
	nop			;de01	00 	. 
	nop			;de02	00 	. 
	nop			;de03	00 	. 
	nop			;de04	00 	. 
	nop			;de05	00 	. 
	nop			;de06	00 	. 
	nop			;de07	00 	. 
	nop			;de08	00 	. 
	nop			;de09	00 	. 
	nop			;de0a	00 	. 
	nop			;de0b	00 	. 
	nop			;de0c	00 	. 
	nop			;de0d	00 	. 
	nop			;de0e	00 	. 
	nop			;de0f	00 	. 
	nop			;de10	00 	. 
	nop			;de11	00 	. 
	nop			;de12	00 	. 
	nop			;de13	00 	. 
	nop			;de14	00 	. 
	nop			;de15	00 	. 
	nop			;de16	00 	. 
	nop			;de17	00 	. 
	nop			;de18	00 	. 
	nop			;de19	00 	. 
	nop			;de1a	00 	. 
	nop			;de1b	00 	. 
	nop			;de1c	00 	. 
	nop			;de1d	00 	. 
	nop			;de1e	00 	. 
	nop			;de1f	00 	. 
	nop			;de20	00 	. 
	nop			;de21	00 	. 
	nop			;de22	00 	. 
	nop			;de23	00 	. 
	nop			;de24	00 	. 
	nop			;de25	00 	. 
	nop			;de26	00 	. 
	nop			;de27	00 	. 
	nop			;de28	00 	. 
	nop			;de29	00 	. 
	nop			;de2a	00 	. 
	nop			;de2b	00 	. 
	nop			;de2c	00 	. 
	nop			;de2d	00 	. 
	nop			;de2e	00 	. 
	nop			;de2f	00 	. 
	nop			;de30	00 	. 
	nop			;de31	00 	. 
	nop			;de32	00 	. 
	nop			;de33	00 	. 
	nop			;de34	00 	. 
	nop			;de35	00 	. 
	nop			;de36	00 	. 
	nop			;de37	00 	. 
	nop			;de38	00 	. 
	nop			;de39	00 	. 
	nop			;de3a	00 	. 
	nop			;de3b	00 	. 
	nop			;de3c	00 	. 
	nop			;de3d	00 	. 
	nop			;de3e	00 	. 
	nop			;de3f	00 	. 
	nop			;de40	00 	. 
	nop			;de41	00 	. 
	nop			;de42	00 	. 
	nop			;de43	00 	. 
	nop			;de44	00 	. 
	nop			;de45	00 	. 
	nop			;de46	00 	. 
	nop			;de47	00 	. 
	nop			;de48	00 	. 
	nop			;de49	00 	. 
	nop			;de4a	00 	. 
	nop			;de4b	00 	. 
	nop			;de4c	00 	. 
	nop			;de4d	00 	. 
	nop			;de4e	00 	. 
	nop			;de4f	00 	. 
	nop			;de50	00 	. 
	nop			;de51	00 	. 
	nop			;de52	00 	. 
	nop			;de53	00 	. 
	nop			;de54	00 	. 
	nop			;de55	00 	. 
	nop			;de56	00 	. 
	nop			;de57	00 	. 
	nop			;de58	00 	. 
	nop			;de59	00 	. 
	nop			;de5a	00 	. 
	nop			;de5b	00 	. 
	nop			;de5c	00 	. 
	nop			;de5d	00 	. 
	nop			;de5e	00 	. 
	nop			;de5f	00 	. 
	nop			;de60	00 	. 
	nop			;de61	00 	. 
	nop			;de62	00 	. 
	nop			;de63	00 	. 
	nop			;de64	00 	. 
	nop			;de65	00 	. 
	nop			;de66	00 	. 
	nop			;de67	00 	. 
	nop			;de68	00 	. 
	nop			;de69	00 	. 
	nop			;de6a	00 	. 
	nop			;de6b	00 	. 
	nop			;de6c	00 	. 
	nop			;de6d	00 	. 
	nop			;de6e	00 	. 
	nop			;de6f	00 	. 
	nop			;de70	00 	. 
	nop			;de71	00 	. 
	nop			;de72	00 	. 
	nop			;de73	00 	. 
	nop			;de74	00 	. 
	nop			;de75	00 	. 
	nop			;de76	00 	. 
	nop			;de77	00 	. 
	nop			;de78	00 	. 
	nop			;de79	00 	. 
	nop			;de7a	00 	. 
	nop			;de7b	00 	. 
	nop			;de7c	00 	. 
	nop			;de7d	00 	. 
	nop			;de7e	00 	. 
	nop			;de7f	00 	. 
	nop			;de80	00 	. 
	nop			;de81	00 	. 
	nop			;de82	00 	. 
	nop			;de83	00 	. 
	nop			;de84	00 	. 
	nop			;de85	00 	. 
	nop			;de86	00 	. 
	nop			;de87	00 	. 
	nop			;de88	00 	. 
	nop			;de89	00 	. 
	nop			;de8a	00 	. 
	nop			;de8b	00 	. 
	nop			;de8c	00 	. 
	nop			;de8d	00 	. 
	nop			;de8e	00 	. 
	nop			;de8f	00 	. 
	nop			;de90	00 	. 
	nop			;de91	00 	. 
	nop			;de92	00 	. 
	nop			;de93	00 	. 
	nop			;de94	00 	. 
	nop			;de95	00 	. 
	nop			;de96	00 	. 
	nop			;de97	00 	. 
	nop			;de98	00 	. 
	nop			;de99	00 	. 
	nop			;de9a	00 	. 
	nop			;de9b	00 	. 
	nop			;de9c	00 	. 
	nop			;de9d	00 	. 
	nop			;de9e	00 	. 
	nop			;de9f	00 	. 
	nop			;dea0	00 	. 
	nop			;dea1	00 	. 
	nop			;dea2	00 	. 
	nop			;dea3	00 	. 
	nop			;dea4	00 	. 
	nop			;dea5	00 	. 
	nop			;dea6	00 	. 
	nop			;dea7	00 	. 
	nop			;dea8	00 	. 
	nop			;dea9	00 	. 
	nop			;deaa	00 	. 
	nop			;deab	00 	. 
	nop			;deac	00 	. 
	nop			;dead	00 	. 
	nop			;deae	00 	. 
	nop			;deaf	00 	. 
	nop			;deb0	00 	. 
	nop			;deb1	00 	. 
	nop			;deb2	00 	. 
	nop			;deb3	00 	. 
	nop			;deb4	00 	. 
	nop			;deb5	00 	. 
	nop			;deb6	00 	. 
	nop			;deb7	00 	. 
	nop			;deb8	00 	. 
	nop			;deb9	00 	. 
	nop			;deba	00 	. 
	nop			;debb	00 	. 
	nop			;debc	00 	. 
	nop			;debd	00 	. 
	nop			;debe	00 	. 
	nop			;debf	00 	. 
	nop			;dec0	00 	. 
	nop			;dec1	00 	. 
	nop			;dec2	00 	. 
	nop			;dec3	00 	. 
	nop			;dec4	00 	. 
	nop			;dec5	00 	. 
	nop			;dec6	00 	. 
	nop			;dec7	00 	. 
	nop			;dec8	00 	. 
	nop			;dec9	00 	. 
	nop			;deca	00 	. 
	nop			;decb	00 	. 
	nop			;decc	00 	. 
	nop			;decd	00 	. 
	nop			;dece	00 	. 
	nop			;decf	00 	. 
	nop			;ded0	00 	. 
	nop			;ded1	00 	. 
	nop			;ded2	00 	. 
	nop			;ded3	00 	. 
	nop			;ded4	00 	. 
	nop			;ded5	00 	. 
	nop			;ded6	00 	. 
	nop			;ded7	00 	. 
	nop			;ded8	00 	. 
	nop			;ded9	00 	. 
	nop			;deda	00 	. 
	nop			;dedb	00 	. 
	nop			;dedc	00 	. 
	nop			;dedd	00 	. 
	nop			;dede	00 	. 
	nop			;dedf	00 	. 
	nop			;dee0	00 	. 
	nop			;dee1	00 	. 
	nop			;dee2	00 	. 
	nop			;dee3	00 	. 
	nop			;dee4	00 	. 
	nop			;dee5	00 	. 
	nop			;dee6	00 	. 
	nop			;dee7	00 	. 
	nop			;dee8	00 	. 
	nop			;dee9	00 	. 
	nop			;deea	00 	. 
	nop			;deeb	00 	. 
	nop			;deec	00 	. 
	nop			;deed	00 	. 
	nop			;deee	00 	. 
	nop			;deef	00 	. 
	nop			;def0	00 	. 
	nop			;def1	00 	. 
	nop			;def2	00 	. 
	nop			;def3	00 	. 
	nop			;def4	00 	. 
	nop			;def5	00 	. 
	nop			;def6	00 	. 
	nop			;def7	00 	. 
	nop			;def8	00 	. 
	nop			;def9	00 	. 
	nop			;defa	00 	. 
	nop			;defb	00 	. 
	nop			;defc	00 	. 
	nop			;defd	00 	. 
	nop			;defe	00 	. 
	nop			;deff	00 	. 
	nop			;df00	00 	. 
	nop			;df01	00 	. 
	nop			;df02	00 	. 
	nop			;df03	00 	. 
	nop			;df04	00 	. 
	nop			;df05	00 	. 
	nop			;df06	00 	. 
	nop			;df07	00 	. 
	nop			;df08	00 	. 
	nop			;df09	00 	. 
	nop			;df0a	00 	. 
	nop			;df0b	00 	. 
	nop			;df0c	00 	. 
	nop			;df0d	00 	. 
	nop			;df0e	00 	. 
	nop			;df0f	00 	. 
	nop			;df10	00 	. 
	nop			;df11	00 	. 
	nop			;df12	00 	. 
	nop			;df13	00 	. 
	nop			;df14	00 	. 
	nop			;df15	00 	. 
	nop			;df16	00 	. 
	nop			;df17	00 	. 
	nop			;df18	00 	. 
	nop			;df19	00 	. 
	nop			;df1a	00 	. 
	nop			;df1b	00 	. 
	nop			;df1c	00 	. 
	nop			;df1d	00 	. 
	nop			;df1e	00 	. 
	nop			;df1f	00 	. 
	nop			;df20	00 	. 
	nop			;df21	00 	. 
	nop			;df22	00 	. 
	nop			;df23	00 	. 
	nop			;df24	00 	. 
	nop			;df25	00 	. 
	nop			;df26	00 	. 
	nop			;df27	00 	. 
	nop			;df28	00 	. 
	nop			;df29	00 	. 
	nop			;df2a	00 	. 
	nop			;df2b	00 	. 
	nop			;df2c	00 	. 
	nop			;df2d	00 	. 
	nop			;df2e	00 	. 
	nop			;df2f	00 	. 
	nop			;df30	00 	. 
	nop			;df31	00 	. 
	nop			;df32	00 	. 
	nop			;df33	00 	. 
	nop			;df34	00 	. 
	nop			;df35	00 	. 
	nop			;df36	00 	. 
	nop			;df37	00 	. 
	nop			;df38	00 	. 
	nop			;df39	00 	. 
	nop			;df3a	00 	. 
	nop			;df3b	00 	. 
	nop			;df3c	00 	. 
	nop			;df3d	00 	. 
	nop			;df3e	00 	. 
	nop			;df3f	00 	. 
	nop			;df40	00 	. 
	nop			;df41	00 	. 
	nop			;df42	00 	. 
	nop			;df43	00 	. 
	nop			;df44	00 	. 
	nop			;df45	00 	. 
	nop			;df46	00 	. 
	nop			;df47	00 	. 
	nop			;df48	00 	. 
	nop			;df49	00 	. 
	nop			;df4a	00 	. 
	nop			;df4b	00 	. 
	nop			;df4c	00 	. 
	nop			;df4d	00 	. 
	nop			;df4e	00 	. 
	nop			;df4f	00 	. 
	nop			;df50	00 	. 
	nop			;df51	00 	. 
	nop			;df52	00 	. 
	nop			;df53	00 	. 
	nop			;df54	00 	. 
	nop			;df55	00 	. 
	nop			;df56	00 	. 
	nop			;df57	00 	. 
	nop			;df58	00 	. 
	nop			;df59	00 	. 
	nop			;df5a	00 	. 
	nop			;df5b	00 	. 
	nop			;df5c	00 	. 
	nop			;df5d	00 	. 
	nop			;df5e	00 	. 
	nop			;df5f	00 	. 
	nop			;df60	00 	. 
	nop			;df61	00 	. 
	nop			;df62	00 	. 
	nop			;df63	00 	. 
	nop			;df64	00 	. 
	nop			;df65	00 	. 
	nop			;df66	00 	. 
	nop			;df67	00 	. 
	nop			;df68	00 	. 
	nop			;df69	00 	. 
	nop			;df6a	00 	. 
	nop			;df6b	00 	. 
	nop			;df6c	00 	. 
	nop			;df6d	00 	. 
	nop			;df6e	00 	. 
	nop			;df6f	00 	. 
	nop			;df70	00 	. 
	nop			;df71	00 	. 
	nop			;df72	00 	. 
	nop			;df73	00 	. 
	nop			;df74	00 	. 
	nop			;df75	00 	. 
	nop			;df76	00 	. 
	nop			;df77	00 	. 
	nop			;df78	00 	. 
	nop			;df79	00 	. 
	nop			;df7a	00 	. 
	nop			;df7b	00 	. 
	nop			;df7c	00 	. 
	nop			;df7d	00 	. 
	nop			;df7e	00 	. 
	nop			;df7f	00 	. 
	nop			;df80	00 	. 
	nop			;df81	00 	. 
	nop			;df82	00 	. 
	nop			;df83	00 	. 
	nop			;df84	00 	. 
	nop			;df85	00 	. 
	nop			;df86	00 	. 
	nop			;df87	00 	. 
	nop			;df88	00 	. 
	nop			;df89	00 	. 
	nop			;df8a	00 	. 
	nop			;df8b	00 	. 
	nop			;df8c	00 	. 
	nop			;df8d	00 	. 
	nop			;df8e	00 	. 
	nop			;df8f	00 	. 
	nop			;df90	00 	. 
	nop			;df91	00 	. 
	nop			;df92	00 	. 
	nop			;df93	00 	. 
	nop			;df94	00 	. 
	nop			;df95	00 	. 
	nop			;df96	00 	. 
	nop			;df97	00 	. 
	nop			;df98	00 	. 
	nop			;df99	00 	. 
	nop			;df9a	00 	. 
	nop			;df9b	00 	. 
	nop			;df9c	00 	. 
	nop			;df9d	00 	. 
	nop			;df9e	00 	. 
	nop			;df9f	00 	. 
	nop			;dfa0	00 	. 
	nop			;dfa1	00 	. 
	nop			;dfa2	00 	. 
	nop			;dfa3	00 	. 
	nop			;dfa4	00 	. 
	nop			;dfa5	00 	. 
	nop			;dfa6	00 	. 
	nop			;dfa7	00 	. 
	nop			;dfa8	00 	. 
	nop			;dfa9	00 	. 
	nop			;dfaa	00 	. 
	nop			;dfab	00 	. 
	nop			;dfac	00 	. 
	nop			;dfad	00 	. 
	nop			;dfae	00 	. 
	nop			;dfaf	00 	. 
	nop			;dfb0	00 	. 
	nop			;dfb1	00 	. 
	nop			;dfb2	00 	. 
	nop			;dfb3	00 	. 
	nop			;dfb4	00 	. 
	nop			;dfb5	00 	. 
	nop			;dfb6	00 	. 
	nop			;dfb7	00 	. 
	nop			;dfb8	00 	. 
	nop			;dfb9	00 	. 
	nop			;dfba	00 	. 
	nop			;dfbb	00 	. 
	nop			;dfbc	00 	. 
	nop			;dfbd	00 	. 
	nop			;dfbe	00 	. 
	nop			;dfbf	00 	. 
	nop			;dfc0	00 	. 
	nop			;dfc1	00 	. 
	nop			;dfc2	00 	. 
	nop			;dfc3	00 	. 
	nop			;dfc4	00 	. 
	nop			;dfc5	00 	. 
	nop			;dfc6	00 	. 
	nop			;dfc7	00 	. 
	nop			;dfc8	00 	. 
	nop			;dfc9	00 	. 
	nop			;dfca	00 	. 
	nop			;dfcb	00 	. 
	nop			;dfcc	00 	. 
	nop			;dfcd	00 	. 
	nop			;dfce	00 	. 
	nop			;dfcf	00 	. 
	nop			;dfd0	00 	. 
	nop			;dfd1	00 	. 
	nop			;dfd2	00 	. 
	nop			;dfd3	00 	. 
	nop			;dfd4	00 	. 
	nop			;dfd5	00 	. 
	nop			;dfd6	00 	. 
	nop			;dfd7	00 	. 
	nop			;dfd8	00 	. 
	nop			;dfd9	00 	. 
	nop			;dfda	00 	. 
	nop			;dfdb	00 	. 
	nop			;dfdc	00 	. 
	nop			;dfdd	00 	. 
	nop			;dfde	00 	. 
	nop			;dfdf	00 	. 
	nop			;dfe0	00 	. 
	nop			;dfe1	00 	. 
	nop			;dfe2	00 	. 
	nop			;dfe3	00 	. 
	nop			;dfe4	00 	. 
	nop			;dfe5	00 	. 
	nop			;dfe6	00 	. 
	nop			;dfe7	00 	. 
	nop			;dfe8	00 	. 
	nop			;dfe9	00 	. 
	nop			;dfea	00 	. 
	nop			;dfeb	00 	. 
	nop			;dfec	00 	. 
	nop			;dfed	00 	. 
	nop			;dfee	00 	. 
	nop			;dfef	00 	. 
	nop			;dff0	00 	. 
	nop			;dff1	00 	. 
	nop			;dff2	00 	. 
	nop			;dff3	00 	. 
	nop			;dff4	00 	. 
	nop			;dff5	00 	. 
	nop			;dff6	00 	. 
	nop			;dff7	00 	. 
	nop			;dff8	00 	. 
	nop			;dff9	00 	. 
	nop			;dffa	00 	. 
	nop			;dffb	00 	. 
	nop			;dffc	00 	. 
	nop			;dffd	00 	. 
	nop			;dffe	00 	. 
	nop			;dfff	00 	. 
	nop			;e000	00 	. 
	nop			;e001	00 	. 
	nop			;e002	00 	. 
	nop			;e003	00 	. 
	nop			;e004	00 	. 
	nop			;e005	00 	. 
	nop			;e006	00 	. 
	nop			;e007	00 	. 
	nop			;e008	00 	. 
	nop			;e009	00 	. 
	nop			;e00a	00 	. 
	nop			;e00b	00 	. 
	nop			;e00c	00 	. 
	nop			;e00d	00 	. 
	nop			;e00e	00 	. 
	nop			;e00f	00 	. 
	nop			;e010	00 	. 
	nop			;e011	00 	. 
	nop			;e012	00 	. 
	nop			;e013	00 	. 
	nop			;e014	00 	. 
	nop			;e015	00 	. 
	nop			;e016	00 	. 
	nop			;e017	00 	. 
	nop			;e018	00 	. 
	nop			;e019	00 	. 
	nop			;e01a	00 	. 
	nop			;e01b	00 	. 
	nop			;e01c	00 	. 
	nop			;e01d	00 	. 
	nop			;e01e	00 	. 
	nop			;e01f	00 	. 
	nop			;e020	00 	. 
	nop			;e021	00 	. 
	nop			;e022	00 	. 
	nop			;e023	00 	. 
	nop			;e024	00 	. 
	nop			;e025	00 	. 
	nop			;e026	00 	. 
	nop			;e027	00 	. 
	nop			;e028	00 	. 
	nop			;e029	00 	. 
	nop			;e02a	00 	. 
	nop			;e02b	00 	. 
	nop			;e02c	00 	. 
	nop			;e02d	00 	. 
	nop			;e02e	00 	. 
	nop			;e02f	00 	. 
	nop			;e030	00 	. 
	nop			;e031	00 	. 
	nop			;e032	00 	. 
	nop			;e033	00 	. 
	nop			;e034	00 	. 
	nop			;e035	00 	. 
	nop			;e036	00 	. 
	nop			;e037	00 	. 
	nop			;e038	00 	. 
	nop			;e039	00 	. 
	nop			;e03a	00 	. 
	nop			;e03b	00 	. 
	nop			;e03c	00 	. 
	nop			;e03d	00 	. 
	nop			;e03e	00 	. 
	nop			;e03f	00 	. 
	nop			;e040	00 	. 
	nop			;e041	00 	. 
	nop			;e042	00 	. 
	nop			;e043	00 	. 
	nop			;e044	00 	. 
	nop			;e045	00 	. 
	nop			;e046	00 	. 
	nop			;e047	00 	. 
	nop			;e048	00 	. 
	nop			;e049	00 	. 
	nop			;e04a	00 	. 
	nop			;e04b	00 	. 
	nop			;e04c	00 	. 
	nop			;e04d	00 	. 
	nop			;e04e	00 	. 
	nop			;e04f	00 	. 
	nop			;e050	00 	. 
	nop			;e051	00 	. 
	nop			;e052	00 	. 
	nop			;e053	00 	. 
	nop			;e054	00 	. 
	nop			;e055	00 	. 
	nop			;e056	00 	. 
	nop			;e057	00 	. 
	nop			;e058	00 	. 
	nop			;e059	00 	. 
	nop			;e05a	00 	. 
	nop			;e05b	00 	. 
	nop			;e05c	00 	. 
	nop			;e05d	00 	. 
	nop			;e05e	00 	. 
	nop			;e05f	00 	. 
	nop			;e060	00 	. 
	nop			;e061	00 	. 
	nop			;e062	00 	. 
	nop			;e063	00 	. 
	nop			;e064	00 	. 
	nop			;e065	00 	. 
	nop			;e066	00 	. 
	nop			;e067	00 	. 
	nop			;e068	00 	. 
	nop			;e069	00 	. 
	nop			;e06a	00 	. 
	nop			;e06b	00 	. 
	nop			;e06c	00 	. 
	nop			;e06d	00 	. 
	nop			;e06e	00 	. 
	nop			;e06f	00 	. 
	nop			;e070	00 	. 
	nop			;e071	00 	. 
	nop			;e072	00 	. 
	nop			;e073	00 	. 
	nop			;e074	00 	. 
	nop			;e075	00 	. 
	nop			;e076	00 	. 
	nop			;e077	00 	. 
	nop			;e078	00 	. 
	nop			;e079	00 	. 
	nop			;e07a	00 	. 
	nop			;e07b	00 	. 
	nop			;e07c	00 	. 
	nop			;e07d	00 	. 
	nop			;e07e	00 	. 
	nop			;e07f	00 	. 
	nop			;e080	00 	. 
	nop			;e081	00 	. 
	nop			;e082	00 	. 
	nop			;e083	00 	. 
	nop			;e084	00 	. 
	nop			;e085	00 	. 
	nop			;e086	00 	. 
	nop			;e087	00 	. 
	nop			;e088	00 	. 
	nop			;e089	00 	. 
	nop			;e08a	00 	. 
	nop			;e08b	00 	. 
	nop			;e08c	00 	. 
	nop			;e08d	00 	. 
	nop			;e08e	00 	. 
	nop			;e08f	00 	. 
	nop			;e090	00 	. 
	nop			;e091	00 	. 
	nop			;e092	00 	. 
	nop			;e093	00 	. 
	nop			;e094	00 	. 
	nop			;e095	00 	. 
	nop			;e096	00 	. 
	nop			;e097	00 	. 
	nop			;e098	00 	. 
	nop			;e099	00 	. 
	nop			;e09a	00 	. 
	nop			;e09b	00 	. 
	nop			;e09c	00 	. 
	nop			;e09d	00 	. 
	nop			;e09e	00 	. 
	nop			;e09f	00 	. 
	nop			;e0a0	00 	. 
	nop			;e0a1	00 	. 
	nop			;e0a2	00 	. 
	nop			;e0a3	00 	. 
	nop			;e0a4	00 	. 
	nop			;e0a5	00 	. 
	nop			;e0a6	00 	. 
	nop			;e0a7	00 	. 
	nop			;e0a8	00 	. 
	nop			;e0a9	00 	. 
	nop			;e0aa	00 	. 
	nop			;e0ab	00 	. 
	nop			;e0ac	00 	. 
	nop			;e0ad	00 	. 
	nop			;e0ae	00 	. 
	nop			;e0af	00 	. 
	nop			;e0b0	00 	. 
	nop			;e0b1	00 	. 
	nop			;e0b2	00 	. 
	nop			;e0b3	00 	. 
	nop			;e0b4	00 	. 
	nop			;e0b5	00 	. 
	nop			;e0b6	00 	. 
	nop			;e0b7	00 	. 
	nop			;e0b8	00 	. 
	nop			;e0b9	00 	. 
	nop			;e0ba	00 	. 
	nop			;e0bb	00 	. 
	nop			;e0bc	00 	. 
	nop			;e0bd	00 	. 
	nop			;e0be	00 	. 
	nop			;e0bf	00 	. 
	nop			;e0c0	00 	. 
	nop			;e0c1	00 	. 
	nop			;e0c2	00 	. 
	nop			;e0c3	00 	. 
	nop			;e0c4	00 	. 
	nop			;e0c5	00 	. 
	nop			;e0c6	00 	. 
	nop			;e0c7	00 	. 
	nop			;e0c8	00 	. 
	nop			;e0c9	00 	. 
	nop			;e0ca	00 	. 
	nop			;e0cb	00 	. 
	nop			;e0cc	00 	. 
	nop			;e0cd	00 	. 
	nop			;e0ce	00 	. 
	nop			;e0cf	00 	. 
	nop			;e0d0	00 	. 
	nop			;e0d1	00 	. 
	nop			;e0d2	00 	. 
	nop			;e0d3	00 	. 
	nop			;e0d4	00 	. 
	nop			;e0d5	00 	. 
	nop			;e0d6	00 	. 
	nop			;e0d7	00 	. 
	nop			;e0d8	00 	. 
	nop			;e0d9	00 	. 
	nop			;e0da	00 	. 
	nop			;e0db	00 	. 
	nop			;e0dc	00 	. 
	nop			;e0dd	00 	. 
	nop			;e0de	00 	. 
	nop			;e0df	00 	. 
	nop			;e0e0	00 	. 
	nop			;e0e1	00 	. 
	nop			;e0e2	00 	. 
	nop			;e0e3	00 	. 
	nop			;e0e4	00 	. 
	nop			;e0e5	00 	. 
	nop			;e0e6	00 	. 
	nop			;e0e7	00 	. 
	nop			;e0e8	00 	. 
	nop			;e0e9	00 	. 
	nop			;e0ea	00 	. 
	nop			;e0eb	00 	. 
	nop			;e0ec	00 	. 
	nop			;e0ed	00 	. 
	nop			;e0ee	00 	. 
	nop			;e0ef	00 	. 
	nop			;e0f0	00 	. 
	nop			;e0f1	00 	. 
	nop			;e0f2	00 	. 
	nop			;e0f3	00 	. 
	nop			;e0f4	00 	. 
	nop			;e0f5	00 	. 
	nop			;e0f6	00 	. 
	nop			;e0f7	00 	. 
	nop			;e0f8	00 	. 
	nop			;e0f9	00 	. 
	nop			;e0fa	00 	. 
	nop			;e0fb	00 	. 
	nop			;e0fc	00 	. 
	nop			;e0fd	00 	. 
	nop			;e0fe	00 	. 
	nop			;e0ff	00 	. 
	nop			;e100	00 	. 
	nop			;e101	00 	. 
	nop			;e102	00 	. 
	nop			;e103	00 	. 
	nop			;e104	00 	. 
	nop			;e105	00 	. 
	nop			;e106	00 	. 
	nop			;e107	00 	. 
	nop			;e108	00 	. 
	nop			;e109	00 	. 
	nop			;e10a	00 	. 
	nop			;e10b	00 	. 
	nop			;e10c	00 	. 
	nop			;e10d	00 	. 
	nop			;e10e	00 	. 
	nop			;e10f	00 	. 
	nop			;e110	00 	. 
	nop			;e111	00 	. 
	nop			;e112	00 	. 
	nop			;e113	00 	. 
	nop			;e114	00 	. 
	nop			;e115	00 	. 
	nop			;e116	00 	. 
	nop			;e117	00 	. 
	nop			;e118	00 	. 
	nop			;e119	00 	. 
	nop			;e11a	00 	. 
	nop			;e11b	00 	. 
	nop			;e11c	00 	. 
	nop			;e11d	00 	. 
	nop			;e11e	00 	. 
	nop			;e11f	00 	. 
	nop			;e120	00 	. 
	nop			;e121	00 	. 
	nop			;e122	00 	. 
	nop			;e123	00 	. 
	nop			;e124	00 	. 
	nop			;e125	00 	. 
	nop			;e126	00 	. 
	nop			;e127	00 	. 
	nop			;e128	00 	. 
	nop			;e129	00 	. 
	nop			;e12a	00 	. 
	nop			;e12b	00 	. 
	nop			;e12c	00 	. 
	nop			;e12d	00 	. 
	nop			;e12e	00 	. 
	nop			;e12f	00 	. 
	nop			;e130	00 	. 
	nop			;e131	00 	. 
	nop			;e132	00 	. 
	nop			;e133	00 	. 
	nop			;e134	00 	. 
	nop			;e135	00 	. 
	nop			;e136	00 	. 
	nop			;e137	00 	. 
	nop			;e138	00 	. 
	nop			;e139	00 	. 
	nop			;e13a	00 	. 
	nop			;e13b	00 	. 
	nop			;e13c	00 	. 
	nop			;e13d	00 	. 
	nop			;e13e	00 	. 
	nop			;e13f	00 	. 
	nop			;e140	00 	. 
	nop			;e141	00 	. 
	nop			;e142	00 	. 
	nop			;e143	00 	. 
	nop			;e144	00 	. 
	nop			;e145	00 	. 
	nop			;e146	00 	. 
	nop			;e147	00 	. 
	nop			;e148	00 	. 
	nop			;e149	00 	. 
	nop			;e14a	00 	. 
	nop			;e14b	00 	. 
	nop			;e14c	00 	. 
	nop			;e14d	00 	. 
	nop			;e14e	00 	. 
	nop			;e14f	00 	. 
	nop			;e150	00 	. 
	nop			;e151	00 	. 
	nop			;e152	00 	. 
	nop			;e153	00 	. 
	nop			;e154	00 	. 
	nop			;e155	00 	. 
	nop			;e156	00 	. 
	nop			;e157	00 	. 
	nop			;e158	00 	. 
	nop			;e159	00 	. 
	nop			;e15a	00 	. 
	nop			;e15b	00 	. 
	nop			;e15c	00 	. 
	nop			;e15d	00 	. 
	nop			;e15e	00 	. 
	nop			;e15f	00 	. 
	nop			;e160	00 	. 
	nop			;e161	00 	. 
	nop			;e162	00 	. 
	nop			;e163	00 	. 
	nop			;e164	00 	. 
	nop			;e165	00 	. 
	nop			;e166	00 	. 
	nop			;e167	00 	. 
	nop			;e168	00 	. 
	nop			;e169	00 	. 
	nop			;e16a	00 	. 
	nop			;e16b	00 	. 
	nop			;e16c	00 	. 
	nop			;e16d	00 	. 
	nop			;e16e	00 	. 
	nop			;e16f	00 	. 
	nop			;e170	00 	. 
	nop			;e171	00 	. 
	nop			;e172	00 	. 
	nop			;e173	00 	. 
	nop			;e174	00 	. 
	nop			;e175	00 	. 
	nop			;e176	00 	. 
	nop			;e177	00 	. 
	nop			;e178	00 	. 
	nop			;e179	00 	. 
	nop			;e17a	00 	. 
	nop			;e17b	00 	. 
	nop			;e17c	00 	. 
	nop			;e17d	00 	. 
	nop			;e17e	00 	. 
	nop			;e17f	00 	. 
	nop			;e180	00 	. 
	nop			;e181	00 	. 
	nop			;e182	00 	. 
	nop			;e183	00 	. 
	nop			;e184	00 	. 
	nop			;e185	00 	. 
	nop			;e186	00 	. 
	nop			;e187	00 	. 
	nop			;e188	00 	. 
	nop			;e189	00 	. 
	nop			;e18a	00 	. 
	nop			;e18b	00 	. 
	nop			;e18c	00 	. 
	nop			;e18d	00 	. 
	nop			;e18e	00 	. 
	nop			;e18f	00 	. 
	nop			;e190	00 	. 
	nop			;e191	00 	. 
	nop			;e192	00 	. 
	nop			;e193	00 	. 
	nop			;e194	00 	. 
	nop			;e195	00 	. 
	nop			;e196	00 	. 
	nop			;e197	00 	. 
	nop			;e198	00 	. 
	nop			;e199	00 	. 
	nop			;e19a	00 	. 
	nop			;e19b	00 	. 
	nop			;e19c	00 	. 
	nop			;e19d	00 	. 
	nop			;e19e	00 	. 
	nop			;e19f	00 	. 
	nop			;e1a0	00 	. 
	nop			;e1a1	00 	. 
	nop			;e1a2	00 	. 
	nop			;e1a3	00 	. 
	nop			;e1a4	00 	. 
	nop			;e1a5	00 	. 
	nop			;e1a6	00 	. 
	nop			;e1a7	00 	. 
	nop			;e1a8	00 	. 
	nop			;e1a9	00 	. 
	nop			;e1aa	00 	. 
	nop			;e1ab	00 	. 
	nop			;e1ac	00 	. 
	nop			;e1ad	00 	. 
	nop			;e1ae	00 	. 
	nop			;e1af	00 	. 
	nop			;e1b0	00 	. 
	nop			;e1b1	00 	. 
	nop			;e1b2	00 	. 
	nop			;e1b3	00 	. 
	nop			;e1b4	00 	. 
	nop			;e1b5	00 	. 
	nop			;e1b6	00 	. 
	nop			;e1b7	00 	. 
	nop			;e1b8	00 	. 
	nop			;e1b9	00 	. 
	nop			;e1ba	00 	. 
	nop			;e1bb	00 	. 
	nop			;e1bc	00 	. 
	nop			;e1bd	00 	. 
	nop			;e1be	00 	. 
	nop			;e1bf	00 	. 
	nop			;e1c0	00 	. 
	nop			;e1c1	00 	. 
	nop			;e1c2	00 	. 
	nop			;e1c3	00 	. 
	nop			;e1c4	00 	. 
	nop			;e1c5	00 	. 
	nop			;e1c6	00 	. 
	nop			;e1c7	00 	. 
	nop			;e1c8	00 	. 
	nop			;e1c9	00 	. 
	nop			;e1ca	00 	. 
	nop			;e1cb	00 	. 
	nop			;e1cc	00 	. 
	nop			;e1cd	00 	. 
	nop			;e1ce	00 	. 
	nop			;e1cf	00 	. 
	nop			;e1d0	00 	. 
	nop			;e1d1	00 	. 
	nop			;e1d2	00 	. 
	nop			;e1d3	00 	. 
	nop			;e1d4	00 	. 
	nop			;e1d5	00 	. 
	nop			;e1d6	00 	. 
	nop			;e1d7	00 	. 
	nop			;e1d8	00 	. 
	nop			;e1d9	00 	. 
	nop			;e1da	00 	. 
	nop			;e1db	00 	. 
	nop			;e1dc	00 	. 
	nop			;e1dd	00 	. 
	nop			;e1de	00 	. 
	nop			;e1df	00 	. 
	nop			;e1e0	00 	. 
	nop			;e1e1	00 	. 
	nop			;e1e2	00 	. 
	nop			;e1e3	00 	. 
	nop			;e1e4	00 	. 
	nop			;e1e5	00 	. 
	nop			;e1e6	00 	. 
	nop			;e1e7	00 	. 
	nop			;e1e8	00 	. 
	nop			;e1e9	00 	. 
	nop			;e1ea	00 	. 
	nop			;e1eb	00 	. 
	nop			;e1ec	00 	. 
	nop			;e1ed	00 	. 
	nop			;e1ee	00 	. 
	nop			;e1ef	00 	. 
	nop			;e1f0	00 	. 
	nop			;e1f1	00 	. 
	nop			;e1f2	00 	. 
	nop			;e1f3	00 	. 
	nop			;e1f4	00 	. 
	nop			;e1f5	00 	. 
	nop			;e1f6	00 	. 
	nop			;e1f7	00 	. 
	nop			;e1f8	00 	. 
	nop			;e1f9	00 	. 
	nop			;e1fa	00 	. 
	nop			;e1fb	00 	. 
	nop			;e1fc	00 	. 
	nop			;e1fd	00 	. 
	nop			;e1fe	00 	. 
	nop			;e1ff	00 	. 
	nop			;e200	00 	. 
	nop			;e201	00 	. 
	nop			;e202	00 	. 
	nop			;e203	00 	. 
	nop			;e204	00 	. 
	nop			;e205	00 	. 
	nop			;e206	00 	. 
	nop			;e207	00 	. 
	nop			;e208	00 	. 
	nop			;e209	00 	. 
	nop			;e20a	00 	. 
	nop			;e20b	00 	. 
	nop			;e20c	00 	. 
	nop			;e20d	00 	. 
	nop			;e20e	00 	. 
	nop			;e20f	00 	. 
	nop			;e210	00 	. 
	nop			;e211	00 	. 
	nop			;e212	00 	. 
	nop			;e213	00 	. 
	nop			;e214	00 	. 
	nop			;e215	00 	. 
	nop			;e216	00 	. 
	nop			;e217	00 	. 
	nop			;e218	00 	. 
	nop			;e219	00 	. 
	nop			;e21a	00 	. 
	nop			;e21b	00 	. 
	nop			;e21c	00 	. 
	nop			;e21d	00 	. 
	nop			;e21e	00 	. 
	nop			;e21f	00 	. 
	nop			;e220	00 	. 
	nop			;e221	00 	. 
	nop			;e222	00 	. 
	nop			;e223	00 	. 
	nop			;e224	00 	. 
	nop			;e225	00 	. 
	nop			;e226	00 	. 
	nop			;e227	00 	. 
	nop			;e228	00 	. 
	nop			;e229	00 	. 
	nop			;e22a	00 	. 
	nop			;e22b	00 	. 
	nop			;e22c	00 	. 
	nop			;e22d	00 	. 
	nop			;e22e	00 	. 
	nop			;e22f	00 	. 
	nop			;e230	00 	. 
	nop			;e231	00 	. 
	nop			;e232	00 	. 
	nop			;e233	00 	. 
	nop			;e234	00 	. 
	nop			;e235	00 	. 
	nop			;e236	00 	. 
	nop			;e237	00 	. 
	nop			;e238	00 	. 
	nop			;e239	00 	. 
	nop			;e23a	00 	. 
	nop			;e23b	00 	. 
	nop			;e23c	00 	. 
	nop			;e23d	00 	. 
	nop			;e23e	00 	. 
	nop			;e23f	00 	. 
	nop			;e240	00 	. 
	nop			;e241	00 	. 
	nop			;e242	00 	. 
	nop			;e243	00 	. 
	nop			;e244	00 	. 
	nop			;e245	00 	. 
	nop			;e246	00 	. 
	nop			;e247	00 	. 
	nop			;e248	00 	. 
	nop			;e249	00 	. 
	nop			;e24a	00 	. 
	nop			;e24b	00 	. 
	nop			;e24c	00 	. 
	nop			;e24d	00 	. 
	nop			;e24e	00 	. 
	nop			;e24f	00 	. 
	nop			;e250	00 	. 
	nop			;e251	00 	. 
	nop			;e252	00 	. 
	nop			;e253	00 	. 
	nop			;e254	00 	. 
	nop			;e255	00 	. 
	nop			;e256	00 	. 
	nop			;e257	00 	. 
	nop			;e258	00 	. 
	nop			;e259	00 	. 
	nop			;e25a	00 	. 
	nop			;e25b	00 	. 
	nop			;e25c	00 	. 
	nop			;e25d	00 	. 
	nop			;e25e	00 	. 
	nop			;e25f	00 	. 
	nop			;e260	00 	. 
	nop			;e261	00 	. 
	nop			;e262	00 	. 
	nop			;e263	00 	. 
	nop			;e264	00 	. 
	nop			;e265	00 	. 
	nop			;e266	00 	. 
	nop			;e267	00 	. 
	nop			;e268	00 	. 
	nop			;e269	00 	. 
	nop			;e26a	00 	. 
	nop			;e26b	00 	. 
	nop			;e26c	00 	. 
	nop			;e26d	00 	. 
	nop			;e26e	00 	. 
	nop			;e26f	00 	. 
	nop			;e270	00 	. 
	nop			;e271	00 	. 
	nop			;e272	00 	. 
	nop			;e273	00 	. 
	nop			;e274	00 	. 
	nop			;e275	00 	. 
	nop			;e276	00 	. 
	nop			;e277	00 	. 
	nop			;e278	00 	. 
	nop			;e279	00 	. 
	nop			;e27a	00 	. 
	nop			;e27b	00 	. 
	nop			;e27c	00 	. 
	nop			;e27d	00 	. 
	nop			;e27e	00 	. 
	nop			;e27f	00 	. 
	nop			;e280	00 	. 
	nop			;e281	00 	. 
	nop			;e282	00 	. 
	nop			;e283	00 	. 
	nop			;e284	00 	. 
	nop			;e285	00 	. 
	nop			;e286	00 	. 
	nop			;e287	00 	. 
	nop			;e288	00 	. 
	nop			;e289	00 	. 
	nop			;e28a	00 	. 
	nop			;e28b	00 	. 
	nop			;e28c	00 	. 
	nop			;e28d	00 	. 
	nop			;e28e	00 	. 
	nop			;e28f	00 	. 
	nop			;e290	00 	. 
	nop			;e291	00 	. 
	nop			;e292	00 	. 
	nop			;e293	00 	. 
	nop			;e294	00 	. 
	nop			;e295	00 	. 
	nop			;e296	00 	. 
	nop			;e297	00 	. 
	nop			;e298	00 	. 
	nop			;e299	00 	. 
	nop			;e29a	00 	. 
	nop			;e29b	00 	. 
	nop			;e29c	00 	. 
	nop			;e29d	00 	. 
	nop			;e29e	00 	. 
	nop			;e29f	00 	. 
	nop			;e2a0	00 	. 
	nop			;e2a1	00 	. 
	nop			;e2a2	00 	. 
	nop			;e2a3	00 	. 
	nop			;e2a4	00 	. 
	nop			;e2a5	00 	. 
	nop			;e2a6	00 	. 
	nop			;e2a7	00 	. 
	nop			;e2a8	00 	. 
	nop			;e2a9	00 	. 
	nop			;e2aa	00 	. 
	nop			;e2ab	00 	. 
	nop			;e2ac	00 	. 
	nop			;e2ad	00 	. 
	nop			;e2ae	00 	. 
	nop			;e2af	00 	. 
	nop			;e2b0	00 	. 
	nop			;e2b1	00 	. 
	nop			;e2b2	00 	. 
	nop			;e2b3	00 	. 
	nop			;e2b4	00 	. 
	nop			;e2b5	00 	. 
	nop			;e2b6	00 	. 
	nop			;e2b7	00 	. 
	nop			;e2b8	00 	. 
	nop			;e2b9	00 	. 
	nop			;e2ba	00 	. 
	nop			;e2bb	00 	. 
	nop			;e2bc	00 	. 
	nop			;e2bd	00 	. 
	nop			;e2be	00 	. 
	nop			;e2bf	00 	. 
	nop			;e2c0	00 	. 
	nop			;e2c1	00 	. 
	nop			;e2c2	00 	. 
	nop			;e2c3	00 	. 
	nop			;e2c4	00 	. 
	nop			;e2c5	00 	. 
	nop			;e2c6	00 	. 
	nop			;e2c7	00 	. 
	nop			;e2c8	00 	. 
	nop			;e2c9	00 	. 
	nop			;e2ca	00 	. 
	nop			;e2cb	00 	. 
	nop			;e2cc	00 	. 
	nop			;e2cd	00 	. 
	nop			;e2ce	00 	. 
	nop			;e2cf	00 	. 
	nop			;e2d0	00 	. 
	nop			;e2d1	00 	. 
	nop			;e2d2	00 	. 
	nop			;e2d3	00 	. 
	nop			;e2d4	00 	. 
	nop			;e2d5	00 	. 
	nop			;e2d6	00 	. 
	nop			;e2d7	00 	. 
	nop			;e2d8	00 	. 
	nop			;e2d9	00 	. 
	nop			;e2da	00 	. 
	nop			;e2db	00 	. 
	nop			;e2dc	00 	. 
	nop			;e2dd	00 	. 
	nop			;e2de	00 	. 
	nop			;e2df	00 	. 
	nop			;e2e0	00 	. 
	nop			;e2e1	00 	. 
	nop			;e2e2	00 	. 
	nop			;e2e3	00 	. 
	nop			;e2e4	00 	. 
	nop			;e2e5	00 	. 
	nop			;e2e6	00 	. 
	nop			;e2e7	00 	. 
	nop			;e2e8	00 	. 
	nop			;e2e9	00 	. 
	nop			;e2ea	00 	. 
	nop			;e2eb	00 	. 
	nop			;e2ec	00 	. 
	nop			;e2ed	00 	. 
	nop			;e2ee	00 	. 
	nop			;e2ef	00 	. 
	nop			;e2f0	00 	. 
	nop			;e2f1	00 	. 
	nop			;e2f2	00 	. 
	nop			;e2f3	00 	. 
	nop			;e2f4	00 	. 
	nop			;e2f5	00 	. 
	nop			;e2f6	00 	. 
	nop			;e2f7	00 	. 
	nop			;e2f8	00 	. 
	nop			;e2f9	00 	. 
	nop			;e2fa	00 	. 
	nop			;e2fb	00 	. 
	nop			;e2fc	00 	. 
	nop			;e2fd	00 	. 
	nop			;e2fe	00 	. 
	nop			;e2ff	00 	. 
	nop			;e300	00 	. 
	nop			;e301	00 	. 
	nop			;e302	00 	. 
	nop			;e303	00 	. 
	nop			;e304	00 	. 
	nop			;e305	00 	. 
	nop			;e306	00 	. 
	nop			;e307	00 	. 
	nop			;e308	00 	. 
	nop			;e309	00 	. 
	nop			;e30a	00 	. 
	nop			;e30b	00 	. 
	nop			;e30c	00 	. 
	nop			;e30d	00 	. 
	nop			;e30e	00 	. 
	nop			;e30f	00 	. 
	nop			;e310	00 	. 
	nop			;e311	00 	. 
	nop			;e312	00 	. 
	nop			;e313	00 	. 
	nop			;e314	00 	. 
	nop			;e315	00 	. 
	nop			;e316	00 	. 
	nop			;e317	00 	. 
	nop			;e318	00 	. 
	nop			;e319	00 	. 
	nop			;e31a	00 	. 
	nop			;e31b	00 	. 
	nop			;e31c	00 	. 
	nop			;e31d	00 	. 
	nop			;e31e	00 	. 
	nop			;e31f	00 	. 
	nop			;e320	00 	. 
	nop			;e321	00 	. 
	nop			;e322	00 	. 
	nop			;e323	00 	. 
	nop			;e324	00 	. 
	nop			;e325	00 	. 
	nop			;e326	00 	. 
	nop			;e327	00 	. 
	nop			;e328	00 	. 
	nop			;e329	00 	. 
	nop			;e32a	00 	. 
	nop			;e32b	00 	. 
	nop			;e32c	00 	. 
	nop			;e32d	00 	. 
	nop			;e32e	00 	. 
	nop			;e32f	00 	. 
	nop			;e330	00 	. 
	nop			;e331	00 	. 
	nop			;e332	00 	. 
	nop			;e333	00 	. 
	nop			;e334	00 	. 
	nop			;e335	00 	. 
	nop			;e336	00 	. 
	nop			;e337	00 	. 
	nop			;e338	00 	. 
	nop			;e339	00 	. 
	nop			;e33a	00 	. 
	nop			;e33b	00 	. 
	nop			;e33c	00 	. 
	nop			;e33d	00 	. 
	nop			;e33e	00 	. 
	nop			;e33f	00 	. 
	nop			;e340	00 	. 
	nop			;e341	00 	. 
	nop			;e342	00 	. 
	nop			;e343	00 	. 
	nop			;e344	00 	. 
	nop			;e345	00 	. 
	nop			;e346	00 	. 
	nop			;e347	00 	. 
	nop			;e348	00 	. 
	nop			;e349	00 	. 
	nop			;e34a	00 	. 
	nop			;e34b	00 	. 
	nop			;e34c	00 	. 
	nop			;e34d	00 	. 
	nop			;e34e	00 	. 
	nop			;e34f	00 	. 
	nop			;e350	00 	. 
	nop			;e351	00 	. 
	nop			;e352	00 	. 
	nop			;e353	00 	. 
	nop			;e354	00 	. 
	nop			;e355	00 	. 
	nop			;e356	00 	. 
	nop			;e357	00 	. 
	nop			;e358	00 	. 
	nop			;e359	00 	. 
	nop			;e35a	00 	. 
	nop			;e35b	00 	. 
	nop			;e35c	00 	. 
	nop			;e35d	00 	. 
	nop			;e35e	00 	. 
	nop			;e35f	00 	. 
	nop			;e360	00 	. 
	nop			;e361	00 	. 
	nop			;e362	00 	. 
	nop			;e363	00 	. 
	nop			;e364	00 	. 
	nop			;e365	00 	. 
	nop			;e366	00 	. 
	nop			;e367	00 	. 
	nop			;e368	00 	. 
	nop			;e369	00 	. 
	nop			;e36a	00 	. 
	nop			;e36b	00 	. 
	nop			;e36c	00 	. 
	nop			;e36d	00 	. 
	nop			;e36e	00 	. 
	nop			;e36f	00 	. 
	nop			;e370	00 	. 
	nop			;e371	00 	. 
	nop			;e372	00 	. 
	nop			;e373	00 	. 
	nop			;e374	00 	. 
	nop			;e375	00 	. 
	nop			;e376	00 	. 
	nop			;e377	00 	. 
	nop			;e378	00 	. 
	nop			;e379	00 	. 
	nop			;e37a	00 	. 
	nop			;e37b	00 	. 
	nop			;e37c	00 	. 
	nop			;e37d	00 	. 
	nop			;e37e	00 	. 
	nop			;e37f	00 	. 
	nop			;e380	00 	. 
	nop			;e381	00 	. 
	nop			;e382	00 	. 
	nop			;e383	00 	. 
	nop			;e384	00 	. 
	nop			;e385	00 	. 
	nop			;e386	00 	. 
	nop			;e387	00 	. 
	nop			;e388	00 	. 
	nop			;e389	00 	. 
	nop			;e38a	00 	. 
	nop			;e38b	00 	. 
	nop			;e38c	00 	. 
	nop			;e38d	00 	. 
	nop			;e38e	00 	. 
	nop			;e38f	00 	. 
	nop			;e390	00 	. 
	nop			;e391	00 	. 
	nop			;e392	00 	. 
	nop			;e393	00 	. 
	nop			;e394	00 	. 
	nop			;e395	00 	. 
	nop			;e396	00 	. 
	nop			;e397	00 	. 
	nop			;e398	00 	. 
	nop			;e399	00 	. 
	nop			;e39a	00 	. 
	nop			;e39b	00 	. 
	nop			;e39c	00 	. 
	nop			;e39d	00 	. 
	nop			;e39e	00 	. 
	nop			;e39f	00 	. 
	nop			;e3a0	00 	. 
	nop			;e3a1	00 	. 
	nop			;e3a2	00 	. 
	nop			;e3a3	00 	. 
	nop			;e3a4	00 	. 
	nop			;e3a5	00 	. 
	nop			;e3a6	00 	. 
	nop			;e3a7	00 	. 
	nop			;e3a8	00 	. 
	nop			;e3a9	00 	. 
	nop			;e3aa	00 	. 
	nop			;e3ab	00 	. 
	nop			;e3ac	00 	. 
	nop			;e3ad	00 	. 
	nop			;e3ae	00 	. 
	nop			;e3af	00 	. 
	nop			;e3b0	00 	. 
	nop			;e3b1	00 	. 
	nop			;e3b2	00 	. 
	nop			;e3b3	00 	. 
	nop			;e3b4	00 	. 
	nop			;e3b5	00 	. 
	nop			;e3b6	00 	. 
	nop			;e3b7	00 	. 
	nop			;e3b8	00 	. 
	nop			;e3b9	00 	. 
	nop			;e3ba	00 	. 
	nop			;e3bb	00 	. 
	nop			;e3bc	00 	. 
	nop			;e3bd	00 	. 
	nop			;e3be	00 	. 
	nop			;e3bf	00 	. 
	nop			;e3c0	00 	. 
	nop			;e3c1	00 	. 
	nop			;e3c2	00 	. 
	nop			;e3c3	00 	. 
	nop			;e3c4	00 	. 
	nop			;e3c5	00 	. 
	nop			;e3c6	00 	. 
	nop			;e3c7	00 	. 
	nop			;e3c8	00 	. 
	nop			;e3c9	00 	. 
	nop			;e3ca	00 	. 
	nop			;e3cb	00 	. 
	nop			;e3cc	00 	. 
	nop			;e3cd	00 	. 
	nop			;e3ce	00 	. 
	nop			;e3cf	00 	. 
	nop			;e3d0	00 	. 
	nop			;e3d1	00 	. 
	nop			;e3d2	00 	. 
	nop			;e3d3	00 	. 
	nop			;e3d4	00 	. 
	nop			;e3d5	00 	. 
	nop			;e3d6	00 	. 
	nop			;e3d7	00 	. 
	nop			;e3d8	00 	. 
	nop			;e3d9	00 	. 
	nop			;e3da	00 	. 
	nop			;e3db	00 	. 
	nop			;e3dc	00 	. 
	nop			;e3dd	00 	. 
	nop			;e3de	00 	. 
	nop			;e3df	00 	. 
	nop			;e3e0	00 	. 
	nop			;e3e1	00 	. 
	nop			;e3e2	00 	. 
	nop			;e3e3	00 	. 
	nop			;e3e4	00 	. 
	nop			;e3e5	00 	. 
	nop			;e3e6	00 	. 
	nop			;e3e7	00 	. 
	nop			;e3e8	00 	. 
	nop			;e3e9	00 	. 
	nop			;e3ea	00 	. 
	nop			;e3eb	00 	. 
	nop			;e3ec	00 	. 
	nop			;e3ed	00 	. 
	nop			;e3ee	00 	. 
	nop			;e3ef	00 	. 
	nop			;e3f0	00 	. 
	nop			;e3f1	00 	. 
	nop			;e3f2	00 	. 
	nop			;e3f3	00 	. 
	nop			;e3f4	00 	. 
	nop			;e3f5	00 	. 
	nop			;e3f6	00 	. 
	nop			;e3f7	00 	. 
	nop			;e3f8	00 	. 
	nop			;e3f9	00 	. 
	nop			;e3fa	00 	. 
	nop			;e3fb	00 	. 
	nop			;e3fc	00 	. 
	nop			;e3fd	00 	. 
	nop			;e3fe	00 	. 
	nop			;e3ff	00 	. 
	nop			;e400	00 	. 
	nop			;e401	00 	. 
	nop			;e402	00 	. 
	nop			;e403	00 	. 
	nop			;e404	00 	. 
	nop			;e405	00 	. 
	nop			;e406	00 	. 
	nop			;e407	00 	. 
	nop			;e408	00 	. 
	nop			;e409	00 	. 
	nop			;e40a	00 	. 
	nop			;e40b	00 	. 
	nop			;e40c	00 	. 
	nop			;e40d	00 	. 
	nop			;e40e	00 	. 
	nop			;e40f	00 	. 
	nop			;e410	00 	. 
	nop			;e411	00 	. 
	nop			;e412	00 	. 
	nop			;e413	00 	. 
	nop			;e414	00 	. 
	nop			;e415	00 	. 
	nop			;e416	00 	. 
	nop			;e417	00 	. 
	nop			;e418	00 	. 
	nop			;e419	00 	. 
	nop			;e41a	00 	. 
	nop			;e41b	00 	. 
	nop			;e41c	00 	. 
	nop			;e41d	00 	. 
	nop			;e41e	00 	. 
	nop			;e41f	00 	. 
	nop			;e420	00 	. 
	nop			;e421	00 	. 
	nop			;e422	00 	. 
	nop			;e423	00 	. 
	nop			;e424	00 	. 
	nop			;e425	00 	. 
	nop			;e426	00 	. 
	nop			;e427	00 	. 
	nop			;e428	00 	. 
	nop			;e429	00 	. 
	nop			;e42a	00 	. 
	nop			;e42b	00 	. 
	nop			;e42c	00 	. 
	nop			;e42d	00 	. 
	nop			;e42e	00 	. 
	nop			;e42f	00 	. 
	nop			;e430	00 	. 
	nop			;e431	00 	. 
	nop			;e432	00 	. 
	nop			;e433	00 	. 
	nop			;e434	00 	. 
	nop			;e435	00 	. 
	nop			;e436	00 	. 
	nop			;e437	00 	. 
	nop			;e438	00 	. 
	nop			;e439	00 	. 
	nop			;e43a	00 	. 
	nop			;e43b	00 	. 
	nop			;e43c	00 	. 
	nop			;e43d	00 	. 
	nop			;e43e	00 	. 
	nop			;e43f	00 	. 
	nop			;e440	00 	. 
	nop			;e441	00 	. 
	nop			;e442	00 	. 
	nop			;e443	00 	. 
	nop			;e444	00 	. 
	nop			;e445	00 	. 
	nop			;e446	00 	. 
	nop			;e447	00 	. 
	nop			;e448	00 	. 
	nop			;e449	00 	. 
	nop			;e44a	00 	. 
	nop			;e44b	00 	. 
	nop			;e44c	00 	. 
	nop			;e44d	00 	. 
	nop			;e44e	00 	. 
	nop			;e44f	00 	. 
	nop			;e450	00 	. 
	nop			;e451	00 	. 
	nop			;e452	00 	. 
	nop			;e453	00 	. 
	nop			;e454	00 	. 
	nop			;e455	00 	. 
	nop			;e456	00 	. 
	nop			;e457	00 	. 
	nop			;e458	00 	. 
	nop			;e459	00 	. 
	nop			;e45a	00 	. 
	nop			;e45b	00 	. 
	nop			;e45c	00 	. 
	nop			;e45d	00 	. 
	nop			;e45e	00 	. 
	nop			;e45f	00 	. 
	nop			;e460	00 	. 
	nop			;e461	00 	. 
	nop			;e462	00 	. 
	nop			;e463	00 	. 
	nop			;e464	00 	. 
	nop			;e465	00 	. 
	nop			;e466	00 	. 
	nop			;e467	00 	. 
	nop			;e468	00 	. 
	nop			;e469	00 	. 
	nop			;e46a	00 	. 
	nop			;e46b	00 	. 
	nop			;e46c	00 	. 
	nop			;e46d	00 	. 
	nop			;e46e	00 	. 
	nop			;e46f	00 	. 
	nop			;e470	00 	. 
	nop			;e471	00 	. 
	nop			;e472	00 	. 
	nop			;e473	00 	. 
	nop			;e474	00 	. 
	nop			;e475	00 	. 
	nop			;e476	00 	. 
	nop			;e477	00 	. 
	nop			;e478	00 	. 
	nop			;e479	00 	. 
	nop			;e47a	00 	. 
	nop			;e47b	00 	. 
	nop			;e47c	00 	. 
	nop			;e47d	00 	. 
	nop			;e47e	00 	. 
	nop			;e47f	00 	. 
	nop			;e480	00 	. 
	nop			;e481	00 	. 
	nop			;e482	00 	. 
	nop			;e483	00 	. 
	nop			;e484	00 	. 
	nop			;e485	00 	. 
	nop			;e486	00 	. 
	nop			;e487	00 	. 
	nop			;e488	00 	. 
	nop			;e489	00 	. 
	nop			;e48a	00 	. 
	nop			;e48b	00 	. 
	nop			;e48c	00 	. 
	nop			;e48d	00 	. 
	nop			;e48e	00 	. 
	nop			;e48f	00 	. 
	nop			;e490	00 	. 
	nop			;e491	00 	. 
	nop			;e492	00 	. 
	nop			;e493	00 	. 
	nop			;e494	00 	. 
	nop			;e495	00 	. 
	nop			;e496	00 	. 
	nop			;e497	00 	. 
	nop			;e498	00 	. 
	nop			;e499	00 	. 
	nop			;e49a	00 	. 
	nop			;e49b	00 	. 
	nop			;e49c	00 	. 
	nop			;e49d	00 	. 
	nop			;e49e	00 	. 
	nop			;e49f	00 	. 
	nop			;e4a0	00 	. 
	nop			;e4a1	00 	. 
	nop			;e4a2	00 	. 
	nop			;e4a3	00 	. 
	nop			;e4a4	00 	. 
	nop			;e4a5	00 	. 
	nop			;e4a6	00 	. 
	nop			;e4a7	00 	. 
	nop			;e4a8	00 	. 
	nop			;e4a9	00 	. 
	nop			;e4aa	00 	. 
	nop			;e4ab	00 	. 
	nop			;e4ac	00 	. 
	nop			;e4ad	00 	. 
	nop			;e4ae	00 	. 
	nop			;e4af	00 	. 
	nop			;e4b0	00 	. 
	nop			;e4b1	00 	. 
	nop			;e4b2	00 	. 
	nop			;e4b3	00 	. 
	nop			;e4b4	00 	. 
	nop			;e4b5	00 	. 
	nop			;e4b6	00 	. 
	nop			;e4b7	00 	. 
	nop			;e4b8	00 	. 
	nop			;e4b9	00 	. 
	nop			;e4ba	00 	. 
	nop			;e4bb	00 	. 
	nop			;e4bc	00 	. 
	nop			;e4bd	00 	. 
	nop			;e4be	00 	. 
	nop			;e4bf	00 	. 
	nop			;e4c0	00 	. 
	nop			;e4c1	00 	. 
	nop			;e4c2	00 	. 
	nop			;e4c3	00 	. 
	nop			;e4c4	00 	. 
	nop			;e4c5	00 	. 
	nop			;e4c6	00 	. 
	nop			;e4c7	00 	. 
	nop			;e4c8	00 	. 
	nop			;e4c9	00 	. 
	nop			;e4ca	00 	. 
	nop			;e4cb	00 	. 
	nop			;e4cc	00 	. 
	nop			;e4cd	00 	. 
	nop			;e4ce	00 	. 
	nop			;e4cf	00 	. 
	nop			;e4d0	00 	. 
	nop			;e4d1	00 	. 
	nop			;e4d2	00 	. 
	nop			;e4d3	00 	. 
	nop			;e4d4	00 	. 
	nop			;e4d5	00 	. 
	nop			;e4d6	00 	. 
	nop			;e4d7	00 	. 
	nop			;e4d8	00 	. 
	nop			;e4d9	00 	. 
	nop			;e4da	00 	. 
	nop			;e4db	00 	. 
	nop			;e4dc	00 	. 
	nop			;e4dd	00 	. 
	nop			;e4de	00 	. 
	nop			;e4df	00 	. 
	nop			;e4e0	00 	. 
	nop			;e4e1	00 	. 
	nop			;e4e2	00 	. 
	nop			;e4e3	00 	. 
	nop			;e4e4	00 	. 
	nop			;e4e5	00 	. 
	nop			;e4e6	00 	. 
	nop			;e4e7	00 	. 
	nop			;e4e8	00 	. 
	nop			;e4e9	00 	. 
	nop			;e4ea	00 	. 
	nop			;e4eb	00 	. 
	nop			;e4ec	00 	. 
	nop			;e4ed	00 	. 
	nop			;e4ee	00 	. 
	nop			;e4ef	00 	. 
	nop			;e4f0	00 	. 
	nop			;e4f1	00 	. 
	nop			;e4f2	00 	. 
	nop			;e4f3	00 	. 
	nop			;e4f4	00 	. 
	nop			;e4f5	00 	. 
	nop			;e4f6	00 	. 
	nop			;e4f7	00 	. 
	nop			;e4f8	00 	. 
	nop			;e4f9	00 	. 
	nop			;e4fa	00 	. 
	nop			;e4fb	00 	. 
	nop			;e4fc	00 	. 
	nop			;e4fd	00 	. 
	nop			;e4fe	00 	. 
	nop			;e4ff	00 	. 
	nop			;e500	00 	. 
	nop			;e501	00 	. 
	nop			;e502	00 	. 
	nop			;e503	00 	. 
	nop			;e504	00 	. 
	nop			;e505	00 	. 
	nop			;e506	00 	. 
	nop			;e507	00 	. 
	nop			;e508	00 	. 
	nop			;e509	00 	. 
	nop			;e50a	00 	. 
	nop			;e50b	00 	. 
	nop			;e50c	00 	. 
	nop			;e50d	00 	. 
	nop			;e50e	00 	. 
	nop			;e50f	00 	. 
	nop			;e510	00 	. 
	nop			;e511	00 	. 
	nop			;e512	00 	. 
	nop			;e513	00 	. 
	nop			;e514	00 	. 
	nop			;e515	00 	. 
	nop			;e516	00 	. 
	nop			;e517	00 	. 
	nop			;e518	00 	. 
	nop			;e519	00 	. 
	nop			;e51a	00 	. 
	nop			;e51b	00 	. 
	nop			;e51c	00 	. 
	nop			;e51d	00 	. 
	nop			;e51e	00 	. 
	nop			;e51f	00 	. 
	nop			;e520	00 	. 
	nop			;e521	00 	. 
	nop			;e522	00 	. 
	nop			;e523	00 	. 
	nop			;e524	00 	. 
	nop			;e525	00 	. 
	nop			;e526	00 	. 
	nop			;e527	00 	. 
	nop			;e528	00 	. 
	nop			;e529	00 	. 
	nop			;e52a	00 	. 
	nop			;e52b	00 	. 
	nop			;e52c	00 	. 
	nop			;e52d	00 	. 
	nop			;e52e	00 	. 
	nop			;e52f	00 	. 
	nop			;e530	00 	. 
	nop			;e531	00 	. 
	nop			;e532	00 	. 
	nop			;e533	00 	. 
	nop			;e534	00 	. 
	nop			;e535	00 	. 
	nop			;e536	00 	. 
	nop			;e537	00 	. 
	nop			;e538	00 	. 
	nop			;e539	00 	. 
	nop			;e53a	00 	. 
	nop			;e53b	00 	. 
	nop			;e53c	00 	. 
	nop			;e53d	00 	. 
	nop			;e53e	00 	. 
	nop			;e53f	00 	. 
	nop			;e540	00 	. 
	nop			;e541	00 	. 
	nop			;e542	00 	. 
	nop			;e543	00 	. 
	nop			;e544	00 	. 
	nop			;e545	00 	. 
	nop			;e546	00 	. 
	nop			;e547	00 	. 
	nop			;e548	00 	. 
	nop			;e549	00 	. 
	nop			;e54a	00 	. 
	nop			;e54b	00 	. 
	nop			;e54c	00 	. 
	nop			;e54d	00 	. 
	nop			;e54e	00 	. 
	nop			;e54f	00 	. 
	nop			;e550	00 	. 
	nop			;e551	00 	. 
	nop			;e552	00 	. 
	nop			;e553	00 	. 
	nop			;e554	00 	. 
	nop			;e555	00 	. 
	nop			;e556	00 	. 
	nop			;e557	00 	. 
	nop			;e558	00 	. 
	nop			;e559	00 	. 
	nop			;e55a	00 	. 
	nop			;e55b	00 	. 
	nop			;e55c	00 	. 
	nop			;e55d	00 	. 
	nop			;e55e	00 	. 
	nop			;e55f	00 	. 
	nop			;e560	00 	. 
	nop			;e561	00 	. 
	nop			;e562	00 	. 
	nop			;e563	00 	. 
	nop			;e564	00 	. 
	nop			;e565	00 	. 
	nop			;e566	00 	. 
	nop			;e567	00 	. 
	nop			;e568	00 	. 
	nop			;e569	00 	. 
	nop			;e56a	00 	. 
	nop			;e56b	00 	. 
	nop			;e56c	00 	. 
	nop			;e56d	00 	. 
	nop			;e56e	00 	. 
	nop			;e56f	00 	. 
	nop			;e570	00 	. 
	nop			;e571	00 	. 
	nop			;e572	00 	. 
	nop			;e573	00 	. 
	nop			;e574	00 	. 
	nop			;e575	00 	. 
	nop			;e576	00 	. 
	nop			;e577	00 	. 
	nop			;e578	00 	. 
	nop			;e579	00 	. 
	nop			;e57a	00 	. 
	nop			;e57b	00 	. 
	nop			;e57c	00 	. 
	nop			;e57d	00 	. 
	nop			;e57e	00 	. 
	nop			;e57f	00 	. 
	nop			;e580	00 	. 
	nop			;e581	00 	. 
	nop			;e582	00 	. 
	nop			;e583	00 	. 
	nop			;e584	00 	. 
	nop			;e585	00 	. 
	nop			;e586	00 	. 
	nop			;e587	00 	. 
	nop			;e588	00 	. 
	nop			;e589	00 	. 
	nop			;e58a	00 	. 
	nop			;e58b	00 	. 
	nop			;e58c	00 	. 
	nop			;e58d	00 	. 
	nop			;e58e	00 	. 
	nop			;e58f	00 	. 
	nop			;e590	00 	. 
	nop			;e591	00 	. 
	nop			;e592	00 	. 
	nop			;e593	00 	. 
	nop			;e594	00 	. 
	nop			;e595	00 	. 
	nop			;e596	00 	. 
	nop			;e597	00 	. 
	nop			;e598	00 	. 
	nop			;e599	00 	. 
	nop			;e59a	00 	. 
	nop			;e59b	00 	. 
	nop			;e59c	00 	. 
	nop			;e59d	00 	. 
	nop			;e59e	00 	. 
	nop			;e59f	00 	. 
	nop			;e5a0	00 	. 
	nop			;e5a1	00 	. 
	nop			;e5a2	00 	. 
	nop			;e5a3	00 	. 
	nop			;e5a4	00 	. 
	nop			;e5a5	00 	. 
	nop			;e5a6	00 	. 
	nop			;e5a7	00 	. 
	nop			;e5a8	00 	. 
	nop			;e5a9	00 	. 
	nop			;e5aa	00 	. 
	nop			;e5ab	00 	. 
	nop			;e5ac	00 	. 
	nop			;e5ad	00 	. 
	nop			;e5ae	00 	. 
	nop			;e5af	00 	. 
	nop			;e5b0	00 	. 
	nop			;e5b1	00 	. 
	nop			;e5b2	00 	. 
	nop			;e5b3	00 	. 
	nop			;e5b4	00 	. 
	nop			;e5b5	00 	. 
	nop			;e5b6	00 	. 
	nop			;e5b7	00 	. 
	nop			;e5b8	00 	. 
	nop			;e5b9	00 	. 
	nop			;e5ba	00 	. 
	nop			;e5bb	00 	. 
	nop			;e5bc	00 	. 
	nop			;e5bd	00 	. 
	nop			;e5be	00 	. 
	nop			;e5bf	00 	. 
	nop			;e5c0	00 	. 
	nop			;e5c1	00 	. 
	nop			;e5c2	00 	. 
	nop			;e5c3	00 	. 
	nop			;e5c4	00 	. 
	nop			;e5c5	00 	. 
	nop			;e5c6	00 	. 
	nop			;e5c7	00 	. 
	nop			;e5c8	00 	. 
	nop			;e5c9	00 	. 
	nop			;e5ca	00 	. 
	nop			;e5cb	00 	. 
	nop			;e5cc	00 	. 
	nop			;e5cd	00 	. 
	nop			;e5ce	00 	. 
	nop			;e5cf	00 	. 
	nop			;e5d0	00 	. 
	nop			;e5d1	00 	. 
	nop			;e5d2	00 	. 
	nop			;e5d3	00 	. 
	nop			;e5d4	00 	. 
	nop			;e5d5	00 	. 
	nop			;e5d6	00 	. 
	nop			;e5d7	00 	. 
	nop			;e5d8	00 	. 
	nop			;e5d9	00 	. 
	nop			;e5da	00 	. 
	nop			;e5db	00 	. 
	nop			;e5dc	00 	. 
	nop			;e5dd	00 	. 
	nop			;e5de	00 	. 
	nop			;e5df	00 	. 
	nop			;e5e0	00 	. 
	nop			;e5e1	00 	. 
	nop			;e5e2	00 	. 
	nop			;e5e3	00 	. 
	nop			;e5e4	00 	. 
	nop			;e5e5	00 	. 
	nop			;e5e6	00 	. 
	nop			;e5e7	00 	. 
	nop			;e5e8	00 	. 
	nop			;e5e9	00 	. 
	nop			;e5ea	00 	. 
	nop			;e5eb	00 	. 
	nop			;e5ec	00 	. 
	nop			;e5ed	00 	. 
	nop			;e5ee	00 	. 
	nop			;e5ef	00 	. 
	nop			;e5f0	00 	. 
	nop			;e5f1	00 	. 
	nop			;e5f2	00 	. 
	nop			;e5f3	00 	. 
	nop			;e5f4	00 	. 
	nop			;e5f5	00 	. 
	nop			;e5f6	00 	. 
	nop			;e5f7	00 	. 
	nop			;e5f8	00 	. 
	nop			;e5f9	00 	. 
	nop			;e5fa	00 	. 
	nop			;e5fb	00 	. 
	nop			;e5fc	00 	. 
	nop			;e5fd	00 	. 
	nop			;e5fe	00 	. 
	nop			;e5ff	00 	. 
	nop			;e600	00 	. 
	nop			;e601	00 	. 
	nop			;e602	00 	. 
	nop			;e603	00 	. 
	nop			;e604	00 	. 
	nop			;e605	00 	. 
	nop			;e606	00 	. 
	nop			;e607	00 	. 
	nop			;e608	00 	. 
	nop			;e609	00 	. 
	nop			;e60a	00 	. 
	nop			;e60b	00 	. 
	nop			;e60c	00 	. 
	nop			;e60d	00 	. 
	nop			;e60e	00 	. 
	nop			;e60f	00 	. 
	nop			;e610	00 	. 
	nop			;e611	00 	. 
	nop			;e612	00 	. 
	nop			;e613	00 	. 
	nop			;e614	00 	. 
	nop			;e615	00 	. 
	nop			;e616	00 	. 
	nop			;e617	00 	. 
	nop			;e618	00 	. 
	nop			;e619	00 	. 
	nop			;e61a	00 	. 
	nop			;e61b	00 	. 
	nop			;e61c	00 	. 
	nop			;e61d	00 	. 
	nop			;e61e	00 	. 
	nop			;e61f	00 	. 
	nop			;e620	00 	. 
	nop			;e621	00 	. 
	nop			;e622	00 	. 
	nop			;e623	00 	. 
	nop			;e624	00 	. 
	nop			;e625	00 	. 
	nop			;e626	00 	. 
	nop			;e627	00 	. 
	nop			;e628	00 	. 
	nop			;e629	00 	. 
	nop			;e62a	00 	. 
	nop			;e62b	00 	. 
	nop			;e62c	00 	. 
	nop			;e62d	00 	. 
	nop			;e62e	00 	. 
	nop			;e62f	00 	. 
	nop			;e630	00 	. 
	nop			;e631	00 	. 
	nop			;e632	00 	. 
	nop			;e633	00 	. 
	nop			;e634	00 	. 
	nop			;e635	00 	. 
	nop			;e636	00 	. 
	nop			;e637	00 	. 
	nop			;e638	00 	. 
	nop			;e639	00 	. 
	nop			;e63a	00 	. 
	nop			;e63b	00 	. 
	nop			;e63c	00 	. 
	nop			;e63d	00 	. 
	nop			;e63e	00 	. 
	nop			;e63f	00 	. 
	nop			;e640	00 	. 
	nop			;e641	00 	. 
	nop			;e642	00 	. 
	nop			;e643	00 	. 
	nop			;e644	00 	. 
	nop			;e645	00 	. 
	nop			;e646	00 	. 
	nop			;e647	00 	. 
	nop			;e648	00 	. 
	nop			;e649	00 	. 
	nop			;e64a	00 	. 
	nop			;e64b	00 	. 
	nop			;e64c	00 	. 
	nop			;e64d	00 	. 
	nop			;e64e	00 	. 
	nop			;e64f	00 	. 
	nop			;e650	00 	. 
	nop			;e651	00 	. 
	nop			;e652	00 	. 
	nop			;e653	00 	. 
	nop			;e654	00 	. 
	nop			;e655	00 	. 
	nop			;e656	00 	. 
	nop			;e657	00 	. 
	nop			;e658	00 	. 
	nop			;e659	00 	. 
	nop			;e65a	00 	. 
	nop			;e65b	00 	. 
	nop			;e65c	00 	. 
	nop			;e65d	00 	. 
	nop			;e65e	00 	. 
	nop			;e65f	00 	. 
	nop			;e660	00 	. 
	nop			;e661	00 	. 
	nop			;e662	00 	. 
	nop			;e663	00 	. 
	nop			;e664	00 	. 
	nop			;e665	00 	. 
	nop			;e666	00 	. 
	nop			;e667	00 	. 
	nop			;e668	00 	. 
	nop			;e669	00 	. 
	nop			;e66a	00 	. 
	nop			;e66b	00 	. 
	nop			;e66c	00 	. 
	nop			;e66d	00 	. 
	nop			;e66e	00 	. 
	nop			;e66f	00 	. 
	nop			;e670	00 	. 
	nop			;e671	00 	. 
	nop			;e672	00 	. 
	nop			;e673	00 	. 
	nop			;e674	00 	. 
	nop			;e675	00 	. 
	nop			;e676	00 	. 
	nop			;e677	00 	. 
	nop			;e678	00 	. 
	nop			;e679	00 	. 
	nop			;e67a	00 	. 
	nop			;e67b	00 	. 
	nop			;e67c	00 	. 
	nop			;e67d	00 	. 
	nop			;e67e	00 	. 
	nop			;e67f	00 	. 
	nop			;e680	00 	. 
	nop			;e681	00 	. 
	nop			;e682	00 	. 
	nop			;e683	00 	. 
	nop			;e684	00 	. 
	nop			;e685	00 	. 
	nop			;e686	00 	. 
	nop			;e687	00 	. 
	nop			;e688	00 	. 
	nop			;e689	00 	. 
	nop			;e68a	00 	. 
	nop			;e68b	00 	. 
	nop			;e68c	00 	. 
	nop			;e68d	00 	. 
	nop			;e68e	00 	. 
	nop			;e68f	00 	. 
	nop			;e690	00 	. 
	nop			;e691	00 	. 
	nop			;e692	00 	. 
	nop			;e693	00 	. 
	nop			;e694	00 	. 
	nop			;e695	00 	. 
	nop			;e696	00 	. 
	nop			;e697	00 	. 
	nop			;e698	00 	. 
	nop			;e699	00 	. 
	nop			;e69a	00 	. 
	nop			;e69b	00 	. 
	nop			;e69c	00 	. 
	nop			;e69d	00 	. 
	nop			;e69e	00 	. 
	nop			;e69f	00 	. 
	nop			;e6a0	00 	. 
	nop			;e6a1	00 	. 
	nop			;e6a2	00 	. 
	nop			;e6a3	00 	. 
	nop			;e6a4	00 	. 
	nop			;e6a5	00 	. 
	nop			;e6a6	00 	. 
	nop			;e6a7	00 	. 
	nop			;e6a8	00 	. 
	nop			;e6a9	00 	. 
	nop			;e6aa	00 	. 
	nop			;e6ab	00 	. 
	nop			;e6ac	00 	. 
	nop			;e6ad	00 	. 
	nop			;e6ae	00 	. 
	nop			;e6af	00 	. 
	nop			;e6b0	00 	. 
	nop			;e6b1	00 	. 
	nop			;e6b2	00 	. 
	nop			;e6b3	00 	. 
	nop			;e6b4	00 	. 
	nop			;e6b5	00 	. 
	nop			;e6b6	00 	. 
	nop			;e6b7	00 	. 
	nop			;e6b8	00 	. 
	nop			;e6b9	00 	. 
	nop			;e6ba	00 	. 
	nop			;e6bb	00 	. 
	nop			;e6bc	00 	. 
	nop			;e6bd	00 	. 
	nop			;e6be	00 	. 
	nop			;e6bf	00 	. 
	nop			;e6c0	00 	. 
	nop			;e6c1	00 	. 
	nop			;e6c2	00 	. 
	nop			;e6c3	00 	. 
	nop			;e6c4	00 	. 
	nop			;e6c5	00 	. 
	nop			;e6c6	00 	. 
	nop			;e6c7	00 	. 
	nop			;e6c8	00 	. 
	nop			;e6c9	00 	. 
	nop			;e6ca	00 	. 
	nop			;e6cb	00 	. 
	nop			;e6cc	00 	. 
	nop			;e6cd	00 	. 
	nop			;e6ce	00 	. 
	nop			;e6cf	00 	. 
	nop			;e6d0	00 	. 
	nop			;e6d1	00 	. 
	nop			;e6d2	00 	. 
	nop			;e6d3	00 	. 
	nop			;e6d4	00 	. 
	nop			;e6d5	00 	. 
	nop			;e6d6	00 	. 
	nop			;e6d7	00 	. 
	nop			;e6d8	00 	. 
	nop			;e6d9	00 	. 
	nop			;e6da	00 	. 
	nop			;e6db	00 	. 
	nop			;e6dc	00 	. 
	nop			;e6dd	00 	. 
	nop			;e6de	00 	. 
	nop			;e6df	00 	. 
	nop			;e6e0	00 	. 
	nop			;e6e1	00 	. 
	nop			;e6e2	00 	. 
	nop			;e6e3	00 	. 
	nop			;e6e4	00 	. 
	nop			;e6e5	00 	. 
	nop			;e6e6	00 	. 
	nop			;e6e7	00 	. 
	nop			;e6e8	00 	. 
	nop			;e6e9	00 	. 
	nop			;e6ea	00 	. 
	nop			;e6eb	00 	. 
	nop			;e6ec	00 	. 
	nop			;e6ed	00 	. 
	nop			;e6ee	00 	. 
	nop			;e6ef	00 	. 
	nop			;e6f0	00 	. 
	nop			;e6f1	00 	. 
	nop			;e6f2	00 	. 
	nop			;e6f3	00 	. 
	nop			;e6f4	00 	. 
	nop			;e6f5	00 	. 
	nop			;e6f6	00 	. 
	nop			;e6f7	00 	. 
	nop			;e6f8	00 	. 
	nop			;e6f9	00 	. 
	nop			;e6fa	00 	. 
	nop			;e6fb	00 	. 
	nop			;e6fc	00 	. 
	nop			;e6fd	00 	. 
	nop			;e6fe	00 	. 
	nop			;e6ff	00 	. 
	nop			;e700	00 	. 
	nop			;e701	00 	. 
	nop			;e702	00 	. 
	nop			;e703	00 	. 
	nop			;e704	00 	. 
	nop			;e705	00 	. 
	nop			;e706	00 	. 
	nop			;e707	00 	. 
	nop			;e708	00 	. 
	nop			;e709	00 	. 
	nop			;e70a	00 	. 
	nop			;e70b	00 	. 
	nop			;e70c	00 	. 
	nop			;e70d	00 	. 
	nop			;e70e	00 	. 
	nop			;e70f	00 	. 
	nop			;e710	00 	. 
	nop			;e711	00 	. 
	nop			;e712	00 	. 
	nop			;e713	00 	. 
	nop			;e714	00 	. 
	nop			;e715	00 	. 
	nop			;e716	00 	. 
	nop			;e717	00 	. 
	nop			;e718	00 	. 
	nop			;e719	00 	. 
	nop			;e71a	00 	. 
	nop			;e71b	00 	. 
	nop			;e71c	00 	. 
	nop			;e71d	00 	. 
	nop			;e71e	00 	. 
	nop			;e71f	00 	. 
	nop			;e720	00 	. 
	nop			;e721	00 	. 
	nop			;e722	00 	. 
	nop			;e723	00 	. 
	nop			;e724	00 	. 
	nop			;e725	00 	. 
	nop			;e726	00 	. 
	nop			;e727	00 	. 
	nop			;e728	00 	. 
	nop			;e729	00 	. 
	nop			;e72a	00 	. 
	nop			;e72b	00 	. 
	nop			;e72c	00 	. 
	nop			;e72d	00 	. 
	nop			;e72e	00 	. 
	nop			;e72f	00 	. 
	nop			;e730	00 	. 
	nop			;e731	00 	. 
	nop			;e732	00 	. 
	nop			;e733	00 	. 
	nop			;e734	00 	. 
	nop			;e735	00 	. 
	nop			;e736	00 	. 
	nop			;e737	00 	. 
	nop			;e738	00 	. 
	nop			;e739	00 	. 
	nop			;e73a	00 	. 
	nop			;e73b	00 	. 
	nop			;e73c	00 	. 
	nop			;e73d	00 	. 
	nop			;e73e	00 	. 
	nop			;e73f	00 	. 
	nop			;e740	00 	. 
	nop			;e741	00 	. 
	nop			;e742	00 	. 
	nop			;e743	00 	. 
	nop			;e744	00 	. 
	nop			;e745	00 	. 
	nop			;e746	00 	. 
	nop			;e747	00 	. 
	nop			;e748	00 	. 
	nop			;e749	00 	. 
	nop			;e74a	00 	. 
	nop			;e74b	00 	. 
	nop			;e74c	00 	. 
	nop			;e74d	00 	. 
	nop			;e74e	00 	. 
	nop			;e74f	00 	. 
	nop			;e750	00 	. 
	nop			;e751	00 	. 
	nop			;e752	00 	. 
	nop			;e753	00 	. 
	nop			;e754	00 	. 
	nop			;e755	00 	. 
	nop			;e756	00 	. 
	nop			;e757	00 	. 
	nop			;e758	00 	. 
	nop			;e759	00 	. 
	nop			;e75a	00 	. 
	nop			;e75b	00 	. 
	nop			;e75c	00 	. 
	nop			;e75d	00 	. 
	nop			;e75e	00 	. 
	nop			;e75f	00 	. 
	nop			;e760	00 	. 
	nop			;e761	00 	. 
	nop			;e762	00 	. 
	nop			;e763	00 	. 
	nop			;e764	00 	. 
	nop			;e765	00 	. 
	nop			;e766	00 	. 
	nop			;e767	00 	. 
	nop			;e768	00 	. 
	nop			;e769	00 	. 
	nop			;e76a	00 	. 
	nop			;e76b	00 	. 
	nop			;e76c	00 	. 
	nop			;e76d	00 	. 
	nop			;e76e	00 	. 
	nop			;e76f	00 	. 
	nop			;e770	00 	. 
	nop			;e771	00 	. 
	nop			;e772	00 	. 
	nop			;e773	00 	. 
	nop			;e774	00 	. 
	nop			;e775	00 	. 
	nop			;e776	00 	. 
	nop			;e777	00 	. 
	nop			;e778	00 	. 
	nop			;e779	00 	. 
	nop			;e77a	00 	. 
	nop			;e77b	00 	. 
	nop			;e77c	00 	. 
	nop			;e77d	00 	. 
	nop			;e77e	00 	. 
	nop			;e77f	00 	. 
	nop			;e780	00 	. 
	nop			;e781	00 	. 
	nop			;e782	00 	. 
	nop			;e783	00 	. 
	nop			;e784	00 	. 
	nop			;e785	00 	. 
	nop			;e786	00 	. 
	nop			;e787	00 	. 
	nop			;e788	00 	. 
	nop			;e789	00 	. 
	nop			;e78a	00 	. 
	nop			;e78b	00 	. 
	nop			;e78c	00 	. 
	nop			;e78d	00 	. 
	nop			;e78e	00 	. 
	nop			;e78f	00 	. 
	nop			;e790	00 	. 
	nop			;e791	00 	. 
	nop			;e792	00 	. 
	nop			;e793	00 	. 
	nop			;e794	00 	. 
	nop			;e795	00 	. 
	nop			;e796	00 	. 
	nop			;e797	00 	. 
	nop			;e798	00 	. 
	nop			;e799	00 	. 
	nop			;e79a	00 	. 
	nop			;e79b	00 	. 
	nop			;e79c	00 	. 
	nop			;e79d	00 	. 
	nop			;e79e	00 	. 
	nop			;e79f	00 	. 
	nop			;e7a0	00 	. 
	nop			;e7a1	00 	. 
	nop			;e7a2	00 	. 
	nop			;e7a3	00 	. 
	nop			;e7a4	00 	. 
	nop			;e7a5	00 	. 
	nop			;e7a6	00 	. 
	nop			;e7a7	00 	. 
	nop			;e7a8	00 	. 
	nop			;e7a9	00 	. 
	nop			;e7aa	00 	. 
	nop			;e7ab	00 	. 
	nop			;e7ac	00 	. 
	nop			;e7ad	00 	. 
	nop			;e7ae	00 	. 
	nop			;e7af	00 	. 
	nop			;e7b0	00 	. 
	nop			;e7b1	00 	. 
	nop			;e7b2	00 	. 
	nop			;e7b3	00 	. 
	nop			;e7b4	00 	. 
	nop			;e7b5	00 	. 
	nop			;e7b6	00 	. 
	nop			;e7b7	00 	. 
	nop			;e7b8	00 	. 
	nop			;e7b9	00 	. 
	nop			;e7ba	00 	. 
	nop			;e7bb	00 	. 
	nop			;e7bc	00 	. 
	nop			;e7bd	00 	. 
	nop			;e7be	00 	. 
	nop			;e7bf	00 	. 
	nop			;e7c0	00 	. 
	nop			;e7c1	00 	. 
	nop			;e7c2	00 	. 
	nop			;e7c3	00 	. 
	nop			;e7c4	00 	. 
	nop			;e7c5	00 	. 
	nop			;e7c6	00 	. 
	nop			;e7c7	00 	. 
	nop			;e7c8	00 	. 
	nop			;e7c9	00 	. 
	nop			;e7ca	00 	. 
	nop			;e7cb	00 	. 
	nop			;e7cc	00 	. 
	nop			;e7cd	00 	. 
	nop			;e7ce	00 	. 
	nop			;e7cf	00 	. 
	nop			;e7d0	00 	. 
	nop			;e7d1	00 	. 
	nop			;e7d2	00 	. 
	nop			;e7d3	00 	. 
	nop			;e7d4	00 	. 
	nop			;e7d5	00 	. 
	nop			;e7d6	00 	. 
	nop			;e7d7	00 	. 
	nop			;e7d8	00 	. 
	nop			;e7d9	00 	. 
	nop			;e7da	00 	. 
	nop			;e7db	00 	. 
	nop			;e7dc	00 	. 
	nop			;e7dd	00 	. 
	nop			;e7de	00 	. 
	nop			;e7df	00 	. 
	nop			;e7e0	00 	. 
	nop			;e7e1	00 	. 
	nop			;e7e2	00 	. 
	nop			;e7e3	00 	. 
	nop			;e7e4	00 	. 
	nop			;e7e5	00 	. 
	nop			;e7e6	00 	. 
	nop			;e7e7	00 	. 
	nop			;e7e8	00 	. 
	nop			;e7e9	00 	. 
	nop			;e7ea	00 	. 
	nop			;e7eb	00 	. 
	nop			;e7ec	00 	. 
	nop			;e7ed	00 	. 
	nop			;e7ee	00 	. 
	nop			;e7ef	00 	. 
	nop			;e7f0	00 	. 
	nop			;e7f1	00 	. 
	nop			;e7f2	00 	. 
	nop			;e7f3	00 	. 
	nop			;e7f4	00 	. 
	nop			;e7f5	00 	. 
	nop			;e7f6	00 	. 
	nop			;e7f7	00 	. 
	nop			;e7f8	00 	. 
	nop			;e7f9	00 	. 
	nop			;e7fa	00 	. 
	nop			;e7fb	00 	. 
	nop			;e7fc	00 	. 
	nop			;e7fd	00 	. 
	nop			;e7fe	00 	. 
	nop			;e7ff	00 	. 
	jr nz,$-123		;e800	20 83 	  . 
	jr nz,$-123		;e802	20 83 	  . 
	jr nz,$-123		;e804	20 83 	  . 
	jr nz,$-123		;e806	20 83 	  . 
	jr nz,$-123		;e808	20 83 	  . 
	jr nz,$-123		;e80a	20 83 	  . 
	jr nz,$-123		;e80c	20 83 	  . 
	jr nz,$-123		;e80e	20 83 	  . 
	jr nz,$-123		;e810	20 83 	  . 
	jr nz,$-123		;e812	20 83 	  . 
	jr nz,$-123		;e814	20 83 	  . 
	jr nz,$-123		;e816	20 83 	  . 
	jr nz,$-123		;e818	20 83 	  . 
	jr nz,$-123		;e81a	20 83 	  . 
	jr nz,$-123		;e81c	20 83 	  . 
	jr nz,$-123		;e81e	20 83 	  . 
	jr nz,$-123		;e820	20 83 	  . 
	jr nz,$-123		;e822	20 83 	  . 
	jr nz,$-123		;e824	20 83 	  . 
	jr nz,$-123		;e826	20 83 	  . 
	jr nz,$-123		;e828	20 83 	  . 
	jr nz,$-123		;e82a	20 83 	  . 
	jr nz,$-123		;e82c	20 83 	  . 
	jr nz,$-123		;e82e	20 83 	  . 
	jr nz,$-123		;e830	20 83 	  . 
	jr nz,$-123		;e832	20 83 	  . 
	jr nz,$-123		;e834	20 83 	  . 
	jr nz,$-123		;e836	20 83 	  . 
	jr nz,$-123		;e838	20 83 	  . 
	jr nz,$-123		;e83a	20 83 	  . 
	jr nz,$-123		;e83c	20 83 	  . 
	jr nz,$-123		;e83e	20 83 	  . 
	jr nz,$-123		;e840	20 83 	  . 
	jr nz,$-123		;e842	20 83 	  . 
	jr nz,$-123		;e844	20 83 	  . 
	jr nz,$-123		;e846	20 83 	  . 
	jr nz,$-123		;e848	20 83 	  . 
	jr nz,$-123		;e84a	20 83 	  . 
	jr nz,$-123		;e84c	20 83 	  . 
	jr nz,$-123		;e84e	20 83 	  . 
	jr nz,$-123		;e850	20 83 	  . 
	jr nz,$-123		;e852	20 83 	  . 
	jr nz,$-123		;e854	20 83 	  . 
	jr nz,$-123		;e856	20 83 	  . 
	jr nz,$-123		;e858	20 83 	  . 
	jr nz,$-123		;e85a	20 83 	  . 
	jr nz,$-123		;e85c	20 83 	  . 
	jr nz,$-123		;e85e	20 83 	  . 
	jr nz,$-123		;e860	20 83 	  . 
	jr nz,$-123		;e862	20 83 	  . 
	jr nz,$-123		;e864	20 83 	  . 
	jr nz,$-123		;e866	20 83 	  . 
	jr nz,$-123		;e868	20 83 	  . 
	jr nz,$-123		;e86a	20 83 	  . 
	jr nz,$-123		;e86c	20 83 	  . 
	jr nz,$-123		;e86e	20 83 	  . 
	jr nz,$-123		;e870	20 83 	  . 
	jr nz,$-123		;e872	20 83 	  . 
	jr nz,$-123		;e874	20 83 	  . 
	jr nz,$-123		;e876	20 83 	  . 
	jr nz,$-123		;e878	20 83 	  . 
	jr nz,$-123		;e87a	20 83 	  . 
	jr nz,$-123		;e87c	20 83 	  . 
	jr nz,$-123		;e87e	20 83 	  . 
	jr nz,$-123		;e880	20 83 	  . 
	jr nz,$-123		;e882	20 83 	  . 
	jr nz,$-123		;e884	20 83 	  . 
	jr nz,$-123		;e886	20 83 	  . 
	jr nz,$-123		;e888	20 83 	  . 
	jr nz,$-123		;e88a	20 83 	  . 
	jr nz,$-123		;e88c	20 83 	  . 
	jr nz,$-123		;e88e	20 83 	  . 
	jr nz,$-123		;e890	20 83 	  . 
	jr nz,$-123		;e892	20 83 	  . 
	jr nz,$-123		;e894	20 83 	  . 
	jr nz,$-123		;e896	20 83 	  . 
	jr nz,$-123		;e898	20 83 	  . 
	jr nz,$-123		;e89a	20 83 	  . 
	jr nz,$-123		;e89c	20 83 	  . 
	jr nz,$-123		;e89e	20 83 	  . 
	jr nz,$-123		;e8a0	20 83 	  . 
	jr nz,$-123		;e8a2	20 83 	  . 
	jr nz,$-123		;e8a4	20 83 	  . 
	jr nz,$-123		;e8a6	20 83 	  . 
	jr nz,$-123		;e8a8	20 83 	  . 
	jr nz,$-123		;e8aa	20 83 	  . 
	jr nz,$-123		;e8ac	20 83 	  . 
	jr nz,$-123		;e8ae	20 83 	  . 
	jr nz,$-123		;e8b0	20 83 	  . 
	jr nz,$-123		;e8b2	20 83 	  . 
	jr nz,$-123		;e8b4	20 83 	  . 
	jr nz,$-123		;e8b6	20 83 	  . 
	jr nz,$-123		;e8b8	20 83 	  . 
	jr nz,$-123		;e8ba	20 83 	  . 
	jr nz,$-123		;e8bc	20 83 	  . 
	jr nz,$-123		;e8be	20 83 	  . 
	jr nz,$-123		;e8c0	20 83 	  . 
	jr nz,$-123		;e8c2	20 83 	  . 
	jr nz,$-123		;e8c4	20 83 	  . 
	jr nz,$-123		;e8c6	20 83 	  . 
	jr nz,$-123		;e8c8	20 83 	  . 
	jr nz,$-123		;e8ca	20 83 	  . 
	jr nz,$-123		;e8cc	20 83 	  . 
	jr nz,$-123		;e8ce	20 83 	  . 
	jr nz,$-123		;e8d0	20 83 	  . 
	jr nz,$-123		;e8d2	20 83 	  . 
	jr nz,$-123		;e8d4	20 83 	  . 
	jr nz,$-123		;e8d6	20 83 	  . 
	jr nz,$-123		;e8d8	20 83 	  . 
	jr nz,$-123		;e8da	20 83 	  . 
	jr nz,$-123		;e8dc	20 83 	  . 
	jr nz,$-123		;e8de	20 83 	  . 
	jr nz,$-123		;e8e0	20 83 	  . 
	jr nz,$-123		;e8e2	20 83 	  . 
	jr nz,$-123		;e8e4	20 83 	  . 
	jr nz,$-123		;e8e6	20 83 	  . 
	jr nz,$-123		;e8e8	20 83 	  . 
	jr nz,$-123		;e8ea	20 83 	  . 
	jr nz,$-123		;e8ec	20 83 	  . 
	jr nz,$-123		;e8ee	20 83 	  . 
	jr nz,$-123		;e8f0	20 83 	  . 
	jr nz,$-123		;e8f2	20 83 	  . 
	jr nz,$-123		;e8f4	20 83 	  . 
	jr nz,$-123		;e8f6	20 83 	  . 
	jr nz,$-123		;e8f8	20 83 	  . 
	jr nz,$-123		;e8fa	20 83 	  . 
	jr nz,$-123		;e8fc	20 83 	  . 
	jr nz,$-123		;e8fe	20 83 	  . 
	jr nz,$-123		;e900	20 83 	  . 
	jr nz,$-123		;e902	20 83 	  . 
	jr nz,$-123		;e904	20 83 	  . 
	jr nz,$-123		;e906	20 83 	  . 
	jr nz,$-123		;e908	20 83 	  . 
	jr nz,$-123		;e90a	20 83 	  . 
	jr nz,$-123		;e90c	20 83 	  . 
	jr nz,$-123		;e90e	20 83 	  . 
	jr nz,$-123		;e910	20 83 	  . 
	jr nz,$-123		;e912	20 83 	  . 
	jr nz,$-123		;e914	20 83 	  . 
	jr nz,$-123		;e916	20 83 	  . 
	jr nz,$-123		;e918	20 83 	  . 
	jr nz,$-123		;e91a	20 83 	  . 
	jr nz,$-123		;e91c	20 83 	  . 
	jr nz,$-123		;e91e	20 83 	  . 
	jr nz,$-123		;e920	20 83 	  . 
	jr nz,$-123		;e922	20 83 	  . 
	jr nz,$-123		;e924	20 83 	  . 
	jr nz,$-123		;e926	20 83 	  . 
	jr nz,$-123		;e928	20 83 	  . 
	jr nz,$-123		;e92a	20 83 	  . 
	jr nz,$-123		;e92c	20 83 	  . 
	jr nz,$-123		;e92e	20 83 	  . 
	jr nz,$-123		;e930	20 83 	  . 
	jr nz,$-123		;e932	20 83 	  . 
	jr nz,$-123		;e934	20 83 	  . 
	jr nz,$-123		;e936	20 83 	  . 
	jr nz,$-123		;e938	20 83 	  . 
	jr nz,$-123		;e93a	20 83 	  . 
	jr nz,$-123		;e93c	20 83 	  . 
	jr nz,$-123		;e93e	20 83 	  . 
	jr nz,$-123		;e940	20 83 	  . 
	jr nz,$-123		;e942	20 83 	  . 
	jr nz,$-123		;e944	20 83 	  . 
	jr nz,$-123		;e946	20 83 	  . 
	jr nz,$-123		;e948	20 83 	  . 
	jr nz,$-123		;e94a	20 83 	  . 
	jr nz,$-123		;e94c	20 83 	  . 
	jr nz,$-123		;e94e	20 83 	  . 
	jr nz,$-123		;e950	20 83 	  . 
	jr nz,$-123		;e952	20 83 	  . 
	jr nz,$-123		;e954	20 83 	  . 
	jr nz,$-123		;e956	20 83 	  . 
	jr nz,$-123		;e958	20 83 	  . 
	jr nz,$-123		;e95a	20 83 	  . 
	jr nz,$-123		;e95c	20 83 	  . 
	jr nz,$-123		;e95e	20 83 	  . 
	jr nz,$-123		;e960	20 83 	  . 
	jr nz,$-123		;e962	20 83 	  . 
	jr nz,$-123		;e964	20 83 	  . 
	jr nz,$-123		;e966	20 83 	  . 
	jr nz,$-123		;e968	20 83 	  . 
	jr nz,$-123		;e96a	20 83 	  . 
	jr nz,$-123		;e96c	20 83 	  . 
	jr nz,$-123		;e96e	20 83 	  . 
	jr nz,$-123		;e970	20 83 	  . 
	jr nz,$-123		;e972	20 83 	  . 
	jr nz,$-123		;e974	20 83 	  . 
	jr nz,$-123		;e976	20 83 	  . 
	jr nz,$-123		;e978	20 83 	  . 
	jr nz,$-123		;e97a	20 83 	  . 
	jr nz,$-123		;e97c	20 83 	  . 
	jr nz,$-123		;e97e	20 83 	  . 
	jr nz,$-123		;e980	20 83 	  . 
	jr nz,$-123		;e982	20 83 	  . 
	jr nz,$-123		;e984	20 83 	  . 
	jr nz,$-123		;e986	20 83 	  . 
	jr nz,$-123		;e988	20 83 	  . 
	jr nz,$-123		;e98a	20 83 	  . 
	jr nz,$-123		;e98c	20 83 	  . 
	jr nz,$-123		;e98e	20 83 	  . 
	jr nz,$-123		;e990	20 83 	  . 
	jr nz,$-123		;e992	20 83 	  . 
	jr nz,$-123		;e994	20 83 	  . 
	jr nz,$-123		;e996	20 83 	  . 
	jr nz,$-123		;e998	20 83 	  . 
	jr nz,$-123		;e99a	20 83 	  . 
	jr nz,$-123		;e99c	20 83 	  . 
	jr nz,$-123		;e99e	20 83 	  . 
	jr nz,$-123		;e9a0	20 83 	  . 
	jr nz,$-123		;e9a2	20 83 	  . 
	jr nz,$-123		;e9a4	20 83 	  . 
	jr nz,$-123		;e9a6	20 83 	  . 
	jr nz,$-123		;e9a8	20 83 	  . 
	jr nz,$-123		;e9aa	20 83 	  . 
	jr nz,$-123		;e9ac	20 83 	  . 
	jr nz,$-123		;e9ae	20 83 	  . 
	jr nz,$-123		;e9b0	20 83 	  . 
	jr nz,$-123		;e9b2	20 83 	  . 
	jr nz,$-123		;e9b4	20 83 	  . 
	jr nz,$-123		;e9b6	20 83 	  . 
	jr nz,$-123		;e9b8	20 83 	  . 
	jr nz,$-123		;e9ba	20 83 	  . 
	jr nz,$-123		;e9bc	20 83 	  . 
	jr nz,$-123		;e9be	20 83 	  . 
	jr nz,$-123		;e9c0	20 83 	  . 
	jr nz,$-123		;e9c2	20 83 	  . 
	jr nz,$-123		;e9c4	20 83 	  . 
	jr nz,$-123		;e9c6	20 83 	  . 
	jr nz,$-123		;e9c8	20 83 	  . 
	jr nz,$-123		;e9ca	20 83 	  . 
	jr nz,$-123		;e9cc	20 83 	  . 
	jr nz,$-123		;e9ce	20 83 	  . 
	jr nz,$-123		;e9d0	20 83 	  . 
	jr nz,$-123		;e9d2	20 83 	  . 
	jr nz,$-123		;e9d4	20 83 	  . 
	jr nz,$-123		;e9d6	20 83 	  . 
	jr nz,$-123		;e9d8	20 83 	  . 
	jr nz,$-123		;e9da	20 83 	  . 
	jr nz,$-123		;e9dc	20 83 	  . 
	jr nz,$-123		;e9de	20 83 	  . 
	jr nz,$-123		;e9e0	20 83 	  . 
	jr nz,$-123		;e9e2	20 83 	  . 
	jr nz,$-123		;e9e4	20 83 	  . 
	jr nz,$-123		;e9e6	20 83 	  . 
	jr nz,$-123		;e9e8	20 83 	  . 
	jr nz,$-123		;e9ea	20 83 	  . 
	jr nz,$-123		;e9ec	20 83 	  . 
	jr nz,$-123		;e9ee	20 83 	  . 
	jr nz,$-123		;e9f0	20 83 	  . 
	jr nz,$-123		;e9f2	20 83 	  . 
	jr nz,$-123		;e9f4	20 83 	  . 
	jr nz,$-123		;e9f6	20 83 	  . 
	jr nz,$-123		;e9f8	20 83 	  . 
	jr nz,$-123		;e9fa	20 83 	  . 
	jr nz,$-123		;e9fc	20 83 	  . 
	jr nz,$-123		;e9fe	20 83 	  . 
	jr nz,$-123		;ea00	20 83 	  . 
	jr nz,$-123		;ea02	20 83 	  . 
	jr nz,$-123		;ea04	20 83 	  . 
	jr nz,$-123		;ea06	20 83 	  . 
	jr nz,$-123		;ea08	20 83 	  . 
	jr nz,$-123		;ea0a	20 83 	  . 
	jr nz,$-123		;ea0c	20 83 	  . 
	jr nz,$-123		;ea0e	20 83 	  . 
	jr nz,$-123		;ea10	20 83 	  . 
	jr nz,$-123		;ea12	20 83 	  . 
	jr nz,$-123		;ea14	20 83 	  . 
	jr nz,$-123		;ea16	20 83 	  . 
	jr nz,$-123		;ea18	20 83 	  . 
	jr nz,$-123		;ea1a	20 83 	  . 
	jr nz,$-123		;ea1c	20 83 	  . 
	jr nz,$-123		;ea1e	20 83 	  . 
	jr nz,$-123		;ea20	20 83 	  . 
	jr nz,$-123		;ea22	20 83 	  . 
	jr nz,$-123		;ea24	20 83 	  . 
	jr nz,$-123		;ea26	20 83 	  . 
	jr nz,$-123		;ea28	20 83 	  . 
	jr nz,$-123		;ea2a	20 83 	  . 
	jr nz,$-123		;ea2c	20 83 	  . 
	jr nz,$-123		;ea2e	20 83 	  . 
	jr nz,$-123		;ea30	20 83 	  . 
	jr nz,$-123		;ea32	20 83 	  . 
	jr nz,$-123		;ea34	20 83 	  . 
	jr nz,$-123		;ea36	20 83 	  . 
	jr nz,$-123		;ea38	20 83 	  . 
	jr nz,$-123		;ea3a	20 83 	  . 
	jr nz,$-123		;ea3c	20 83 	  . 
	jr nz,$-123		;ea3e	20 83 	  . 
	jr nz,$-123		;ea40	20 83 	  . 
	jr nz,$-123		;ea42	20 83 	  . 
	jr nz,$-123		;ea44	20 83 	  . 
	jr nz,$-123		;ea46	20 83 	  . 
	jr nz,$-123		;ea48	20 83 	  . 
	jr nz,$-123		;ea4a	20 83 	  . 
	jr nz,$-123		;ea4c	20 83 	  . 
	jr nz,$-123		;ea4e	20 83 	  . 
	jr nz,$-123		;ea50	20 83 	  . 
	jr nz,$-123		;ea52	20 83 	  . 
	jr nz,$-123		;ea54	20 83 	  . 
	jr nz,$-123		;ea56	20 83 	  . 
	jr nz,$-123		;ea58	20 83 	  . 
	jr nz,$-123		;ea5a	20 83 	  . 
	jr nz,$-123		;ea5c	20 83 	  . 
	jr nz,$-123		;ea5e	20 83 	  . 
	jr nz,$-123		;ea60	20 83 	  . 
	jr nz,$-123		;ea62	20 83 	  . 
	jr nz,$-123		;ea64	20 83 	  . 
	jr nz,$-123		;ea66	20 83 	  . 
	jr nz,$-123		;ea68	20 83 	  . 
	jr nz,$-123		;ea6a	20 83 	  . 
	jr nz,$-123		;ea6c	20 83 	  . 
	jr nz,$-123		;ea6e	20 83 	  . 
	jr nz,$-123		;ea70	20 83 	  . 
	jr nz,$-123		;ea72	20 83 	  . 
	jr nz,$-123		;ea74	20 83 	  . 
	jr nz,$-123		;ea76	20 83 	  . 
	jr nz,$-123		;ea78	20 83 	  . 
	jr nz,$-123		;ea7a	20 83 	  . 
	jr nz,$-123		;ea7c	20 83 	  . 
	jr nz,$-123		;ea7e	20 83 	  . 
	jr nz,$-123		;ea80	20 83 	  . 
	jr nz,$-123		;ea82	20 83 	  . 
	jr nz,$-123		;ea84	20 83 	  . 
	jr nz,$-123		;ea86	20 83 	  . 
	jr nz,$-123		;ea88	20 83 	  . 
	jr nz,$-123		;ea8a	20 83 	  . 
	jr nz,$-123		;ea8c	20 83 	  . 
	jr nz,$-123		;ea8e	20 83 	  . 
	jr nz,$-123		;ea90	20 83 	  . 
	jr nz,$-123		;ea92	20 83 	  . 
	jr nz,$-123		;ea94	20 83 	  . 
	jr nz,$-123		;ea96	20 83 	  . 
	jr nz,$-123		;ea98	20 83 	  . 
	jr nz,$-123		;ea9a	20 83 	  . 
	jr nz,$-123		;ea9c	20 83 	  . 
	jr nz,$-123		;ea9e	20 83 	  . 
	jr nz,$-123		;eaa0	20 83 	  . 
	jr nz,$-123		;eaa2	20 83 	  . 
	jr nz,$-123		;eaa4	20 83 	  . 
	jr nz,$-123		;eaa6	20 83 	  . 
	jr nz,$-123		;eaa8	20 83 	  . 
	jr nz,$-123		;eaaa	20 83 	  . 
	jr nz,$-123		;eaac	20 83 	  . 
	jr nz,$-123		;eaae	20 83 	  . 
	jr nz,$-123		;eab0	20 83 	  . 
	jr nz,$-123		;eab2	20 83 	  . 
	jr nz,$-123		;eab4	20 83 	  . 
	jr nz,$-123		;eab6	20 83 	  . 
	jr nz,$-123		;eab8	20 83 	  . 
	jr nz,$-123		;eaba	20 83 	  . 
	jr nz,$-123		;eabc	20 83 	  . 
	jr nz,$-123		;eabe	20 83 	  . 
	jr nz,$-123		;eac0	20 83 	  . 
	jr nz,$-123		;eac2	20 83 	  . 
	jr nz,$-123		;eac4	20 83 	  . 
	jr nz,$-123		;eac6	20 83 	  . 
	jr nz,$-123		;eac8	20 83 	  . 
	jr nz,$-123		;eaca	20 83 	  . 
	jr nz,$-123		;eacc	20 83 	  . 
	jr nz,$-123		;eace	20 83 	  . 
	jr nz,$-123		;ead0	20 83 	  . 
	jr nz,$-123		;ead2	20 83 	  . 
	jr nz,$-123		;ead4	20 83 	  . 
	jr nz,$-123		;ead6	20 83 	  . 
	jr nz,$-123		;ead8	20 83 	  . 
	jr nz,$-123		;eada	20 83 	  . 
	jr nz,$-123		;eadc	20 83 	  . 
	jr nz,$-123		;eade	20 83 	  . 
	jr nz,$-123		;eae0	20 83 	  . 
	jr nz,$-123		;eae2	20 83 	  . 
	jr nz,$-123		;eae4	20 83 	  . 
	jr nz,$-123		;eae6	20 83 	  . 
	jr nz,$-123		;eae8	20 83 	  . 
	jr nz,$-123		;eaea	20 83 	  . 
	jr nz,$-123		;eaec	20 83 	  . 
	jr nz,$-123		;eaee	20 83 	  . 
	jr nz,$-123		;eaf0	20 83 	  . 
	jr nz,$-123		;eaf2	20 83 	  . 
	jr nz,$-123		;eaf4	20 83 	  . 
	jr nz,$-123		;eaf6	20 83 	  . 
	jr nz,$-123		;eaf8	20 83 	  . 
	jr nz,$-123		;eafa	20 83 	  . 
	jr nz,$-123		;eafc	20 83 	  . 
	jr nz,$-123		;eafe	20 83 	  . 
	jr nz,$-123		;eb00	20 83 	  . 
	jr nz,$-123		;eb02	20 83 	  . 
	jr nz,$-123		;eb04	20 83 	  . 
	jr nz,$-123		;eb06	20 83 	  . 
	jr nz,$-123		;eb08	20 83 	  . 
	jr nz,$-123		;eb0a	20 83 	  . 
	jr nz,$-123		;eb0c	20 83 	  . 
	jr nz,$-123		;eb0e	20 83 	  . 
	jr nz,$-123		;eb10	20 83 	  . 
	jr nz,$-123		;eb12	20 83 	  . 
	jr nz,$-123		;eb14	20 83 	  . 
	jr nz,$-123		;eb16	20 83 	  . 
	jr nz,$-123		;eb18	20 83 	  . 
	jr nz,$-123		;eb1a	20 83 	  . 
	jr nz,$-123		;eb1c	20 83 	  . 
	jr nz,$-123		;eb1e	20 83 	  . 
	jr nz,$-123		;eb20	20 83 	  . 
	jr nz,$-123		;eb22	20 83 	  . 
	jr nz,$-123		;eb24	20 83 	  . 
	jr nz,$-123		;eb26	20 83 	  . 
	jr nz,$-123		;eb28	20 83 	  . 
	jr nz,$-123		;eb2a	20 83 	  . 
	jr nz,$-123		;eb2c	20 83 	  . 
	jr nz,$-123		;eb2e	20 83 	  . 
	jr nz,$-123		;eb30	20 83 	  . 
	jr nz,$-123		;eb32	20 83 	  . 
	jr nz,$-123		;eb34	20 83 	  . 
	jr nz,$-123		;eb36	20 83 	  . 
	jr nz,$-123		;eb38	20 83 	  . 
	jr nz,$-123		;eb3a	20 83 	  . 
	jr nz,$-123		;eb3c	20 83 	  . 
	jr nz,$-123		;eb3e	20 83 	  . 
	jr nz,$-123		;eb40	20 83 	  . 
	jr nz,$-123		;eb42	20 83 	  . 
	jr nz,$-123		;eb44	20 83 	  . 
	jr nz,$-123		;eb46	20 83 	  . 
	jr nz,$-123		;eb48	20 83 	  . 
	jr nz,$-123		;eb4a	20 83 	  . 
	jr nz,$-123		;eb4c	20 83 	  . 
	jr nz,$-123		;eb4e	20 83 	  . 
	jr nz,$-123		;eb50	20 83 	  . 
	jr nz,$-123		;eb52	20 83 	  . 
	jr nz,$-123		;eb54	20 83 	  . 
	jr nz,$-123		;eb56	20 83 	  . 
	jr nz,$-123		;eb58	20 83 	  . 
	jr nz,$-123		;eb5a	20 83 	  . 
	jr nz,$-123		;eb5c	20 83 	  . 
	jr nz,$-123		;eb5e	20 83 	  . 
	jr nz,$-123		;eb60	20 83 	  . 
	jr nz,$-123		;eb62	20 83 	  . 
	jr nz,$-123		;eb64	20 83 	  . 
	jr nz,$-123		;eb66	20 83 	  . 
	jr nz,$-123		;eb68	20 83 	  . 
	jr nz,$-123		;eb6a	20 83 	  . 
	jr nz,$-123		;eb6c	20 83 	  . 
	jr nz,$-123		;eb6e	20 83 	  . 
	jr nz,$-123		;eb70	20 83 	  . 
	jr nz,$-123		;eb72	20 83 	  . 
	jr nz,$-123		;eb74	20 83 	  . 
	jr nz,$-123		;eb76	20 83 	  . 
	jr nz,$-123		;eb78	20 83 	  . 
	jr nz,$-123		;eb7a	20 83 	  . 
	jr nz,$-123		;eb7c	20 83 	  . 
	jr nz,$-123		;eb7e	20 83 	  . 
	jr nz,$-123		;eb80	20 83 	  . 
	jr nz,$-123		;eb82	20 83 	  . 
	jr nz,$-123		;eb84	20 83 	  . 
	jr nz,$-123		;eb86	20 83 	  . 
	jr nz,$-123		;eb88	20 83 	  . 
	jr nz,$-123		;eb8a	20 83 	  . 
	jr nz,$-123		;eb8c	20 83 	  . 
	jr nz,$-123		;eb8e	20 83 	  . 
	jr nz,$-123		;eb90	20 83 	  . 
	jr nz,$-123		;eb92	20 83 	  . 
	jr nz,$-123		;eb94	20 83 	  . 
	jr nz,$-123		;eb96	20 83 	  . 
	jr nz,$-123		;eb98	20 83 	  . 
	jr nz,$-123		;eb9a	20 83 	  . 
	jr nz,$-123		;eb9c	20 83 	  . 
	jr nz,$-123		;eb9e	20 83 	  . 
	jr nz,$-123		;eba0	20 83 	  . 
	jr nz,$-123		;eba2	20 83 	  . 
	jr nz,$-123		;eba4	20 83 	  . 
	jr nz,$-123		;eba6	20 83 	  . 
	jr nz,$-123		;eba8	20 83 	  . 
	jr nz,$-123		;ebaa	20 83 	  . 
	jr nz,$-123		;ebac	20 83 	  . 
	jr nz,$-123		;ebae	20 83 	  . 
	jr nz,$-123		;ebb0	20 83 	  . 
	jr nz,$-123		;ebb2	20 83 	  . 
	jr nz,$-123		;ebb4	20 83 	  . 
	jr nz,$-123		;ebb6	20 83 	  . 
	jr nz,$-123		;ebb8	20 83 	  . 
	jr nz,$-123		;ebba	20 83 	  . 
	jr nz,$-123		;ebbc	20 83 	  . 
	jr nz,$-123		;ebbe	20 83 	  . 
	jr nz,$-123		;ebc0	20 83 	  . 
	jr nz,$-123		;ebc2	20 83 	  . 
	jr nz,$-123		;ebc4	20 83 	  . 
	jr nz,$-123		;ebc6	20 83 	  . 
	jr nz,$-123		;ebc8	20 83 	  . 
	jr nz,$-123		;ebca	20 83 	  . 
	jr nz,$-123		;ebcc	20 83 	  . 
	jr nz,$-123		;ebce	20 83 	  . 
	jr nz,$-123		;ebd0	20 83 	  . 
	jr nz,$-123		;ebd2	20 83 	  . 
	jr nz,$-123		;ebd4	20 83 	  . 
	jr nz,$-123		;ebd6	20 83 	  . 
	jr nz,$-123		;ebd8	20 83 	  . 
	jr nz,$-123		;ebda	20 83 	  . 
	jr nz,$-123		;ebdc	20 83 	  . 
	jr nz,$-123		;ebde	20 83 	  . 
	jr nz,$-123		;ebe0	20 83 	  . 
	jr nz,$-123		;ebe2	20 83 	  . 
	jr nz,$-123		;ebe4	20 83 	  . 
	jr nz,$-123		;ebe6	20 83 	  . 
	jr nz,$-123		;ebe8	20 83 	  . 
	jr nz,$-123		;ebea	20 83 	  . 
	jr nz,$-123		;ebec	20 83 	  . 
	jr nz,$-123		;ebee	20 83 	  . 
	jr nz,$-123		;ebf0	20 83 	  . 
	jr nz,$-123		;ebf2	20 83 	  . 
	jr nz,$-123		;ebf4	20 83 	  . 
	jr nz,$-123		;ebf6	20 83 	  . 
	jr nz,$-123		;ebf8	20 83 	  . 
	jr nz,$-123		;ebfa	20 83 	  . 
	jr nz,$-123		;ebfc	20 83 	  . 
	jr nz,$-123		;ebfe	20 83 	  . 
	jr nz,$-123		;ec00	20 83 	  . 
	jr nz,$-123		;ec02	20 83 	  . 
	jr nz,$-123		;ec04	20 83 	  . 
	jr nz,$-123		;ec06	20 83 	  . 
	jr nz,$-123		;ec08	20 83 	  . 
	jr nz,$-123		;ec0a	20 83 	  . 
	jr nz,$-123		;ec0c	20 83 	  . 
	jr nz,$-123		;ec0e	20 83 	  . 
	jr nz,$-123		;ec10	20 83 	  . 
	jr nz,$-123		;ec12	20 83 	  . 
	jr nz,$-123		;ec14	20 83 	  . 
	jr nz,$-123		;ec16	20 83 	  . 
	jr nz,$-123		;ec18	20 83 	  . 
	jr nz,$-123		;ec1a	20 83 	  . 
	jr nz,$-123		;ec1c	20 83 	  . 
	jr nz,$-123		;ec1e	20 83 	  . 
	jr nz,$-123		;ec20	20 83 	  . 
	jr nz,$-123		;ec22	20 83 	  . 
	jr nz,$-123		;ec24	20 83 	  . 
	jr nz,$-123		;ec26	20 83 	  . 
	jr nz,$-123		;ec28	20 83 	  . 
	jr nz,$-123		;ec2a	20 83 	  . 
	jr nz,$-123		;ec2c	20 83 	  . 
	jr nz,$-123		;ec2e	20 83 	  . 
	jr nz,$-123		;ec30	20 83 	  . 
	jr nz,$-123		;ec32	20 83 	  . 
	jr nz,$-123		;ec34	20 83 	  . 
	jr nz,$-123		;ec36	20 83 	  . 
	jr nz,$-123		;ec38	20 83 	  . 
	jr nz,$-123		;ec3a	20 83 	  . 
	jr nz,$-123		;ec3c	20 83 	  . 
	jr nz,$-123		;ec3e	20 83 	  . 
	jr nz,$-123		;ec40	20 83 	  . 
	jr nz,$-123		;ec42	20 83 	  . 
	jr nz,$-123		;ec44	20 83 	  . 
	jr nz,$-123		;ec46	20 83 	  . 
	jr nz,$-123		;ec48	20 83 	  . 
	jr nz,$-123		;ec4a	20 83 	  . 
	jr nz,$-123		;ec4c	20 83 	  . 
	jr nz,$-123		;ec4e	20 83 	  . 
	jr nz,$-123		;ec50	20 83 	  . 
	jr nz,$-123		;ec52	20 83 	  . 
	jr nz,$-123		;ec54	20 83 	  . 
	jr nz,$-123		;ec56	20 83 	  . 
	jr nz,$-123		;ec58	20 83 	  . 
	jr nz,$-123		;ec5a	20 83 	  . 
	jr nz,$-123		;ec5c	20 83 	  . 
	jr nz,$-123		;ec5e	20 83 	  . 
	jr nz,$-123		;ec60	20 83 	  . 
	jr nz,$-123		;ec62	20 83 	  . 
	jr nz,$-123		;ec64	20 83 	  . 
	jr nz,$-123		;ec66	20 83 	  . 
	jr nz,$-123		;ec68	20 83 	  . 
	jr nz,$-123		;ec6a	20 83 	  . 
	jr nz,$-123		;ec6c	20 83 	  . 
	jr nz,$-123		;ec6e	20 83 	  . 
	jr nz,$-123		;ec70	20 83 	  . 
	jr nz,$-123		;ec72	20 83 	  . 
	jr nz,$-123		;ec74	20 83 	  . 
	jr nz,$-123		;ec76	20 83 	  . 
	jr nz,$-123		;ec78	20 83 	  . 
	jr nz,$-123		;ec7a	20 83 	  . 
	jr nz,$-123		;ec7c	20 83 	  . 
	jr nz,$-123		;ec7e	20 83 	  . 
	jr nz,$-123		;ec80	20 83 	  . 
	jr nz,$-123		;ec82	20 83 	  . 
	jr nz,$-123		;ec84	20 83 	  . 
	jr nz,$-123		;ec86	20 83 	  . 
	jr nz,$-123		;ec88	20 83 	  . 
	jr nz,$-123		;ec8a	20 83 	  . 
	jr nz,$-123		;ec8c	20 83 	  . 
	jr nz,$-123		;ec8e	20 83 	  . 
	jr nz,$-123		;ec90	20 83 	  . 
	jr nz,$-123		;ec92	20 83 	  . 
	jr nz,$-123		;ec94	20 83 	  . 
	jr nz,$-123		;ec96	20 83 	  . 
	jr nz,$-123		;ec98	20 83 	  . 
	jr nz,$-123		;ec9a	20 83 	  . 
	jr nz,$-123		;ec9c	20 83 	  . 
	jr nz,$-123		;ec9e	20 83 	  . 
	jr nz,$-123		;eca0	20 83 	  . 
	jr nz,$-123		;eca2	20 83 	  . 
	jr nz,$-123		;eca4	20 83 	  . 
	jr nz,$-123		;eca6	20 83 	  . 
	jr nz,$-123		;eca8	20 83 	  . 
	jr nz,$-123		;ecaa	20 83 	  . 
	jr nz,$-123		;ecac	20 83 	  . 
	jr nz,$-123		;ecae	20 83 	  . 
	jr nz,$-123		;ecb0	20 83 	  . 
	jr nz,$-123		;ecb2	20 83 	  . 
	jr nz,$-123		;ecb4	20 83 	  . 
	jr nz,$-123		;ecb6	20 83 	  . 
	jr nz,$-123		;ecb8	20 83 	  . 
	jr nz,$-123		;ecba	20 83 	  . 
	jr nz,$-123		;ecbc	20 83 	  . 
	jr nz,$-123		;ecbe	20 83 	  . 
	jr nz,$-123		;ecc0	20 83 	  . 
	jr nz,$-123		;ecc2	20 83 	  . 
	jr nz,$-123		;ecc4	20 83 	  . 
	jr nz,$-123		;ecc6	20 83 	  . 
	jr nz,$-123		;ecc8	20 83 	  . 
	jr nz,$-123		;ecca	20 83 	  . 
	jr nz,$-123		;eccc	20 83 	  . 
	jr nz,$-123		;ecce	20 83 	  . 
	jr nz,$-123		;ecd0	20 83 	  . 
	jr nz,$-123		;ecd2	20 83 	  . 
	jr nz,$-123		;ecd4	20 83 	  . 
	jr nz,$-123		;ecd6	20 83 	  . 
	jr nz,$-123		;ecd8	20 83 	  . 
	jr nz,$-123		;ecda	20 83 	  . 
	jr nz,$-123		;ecdc	20 83 	  . 
	jr nz,$-123		;ecde	20 83 	  . 
	jr nz,$-123		;ece0	20 83 	  . 
	jr nz,$-123		;ece2	20 83 	  . 
	jr nz,$-123		;ece4	20 83 	  . 
	jr nz,$-123		;ece6	20 83 	  . 
	jr nz,$-123		;ece8	20 83 	  . 
	jr nz,$-123		;ecea	20 83 	  . 
	jr nz,$-123		;ecec	20 83 	  . 
	jr nz,$-123		;ecee	20 83 	  . 
	jr nz,$-123		;ecf0	20 83 	  . 
	jr nz,$-123		;ecf2	20 83 	  . 
	jr nz,$-123		;ecf4	20 83 	  . 
	jr nz,$-123		;ecf6	20 83 	  . 
	jr nz,$-123		;ecf8	20 83 	  . 
	jr nz,$-123		;ecfa	20 83 	  . 
	jr nz,$-123		;ecfc	20 83 	  . 
	jr nz,$-123		;ecfe	20 83 	  . 
	jr nz,$-123		;ed00	20 83 	  . 
	jr nz,$-123		;ed02	20 83 	  . 
	jr nz,$-123		;ed04	20 83 	  . 
	jr nz,$-123		;ed06	20 83 	  . 
	jr nz,$-123		;ed08	20 83 	  . 
	jr nz,$-123		;ed0a	20 83 	  . 
	jr nz,$-123		;ed0c	20 83 	  . 
	jr nz,$-123		;ed0e	20 83 	  . 
	jr nz,$-123		;ed10	20 83 	  . 
	jr nz,$-123		;ed12	20 83 	  . 
	jr nz,$-123		;ed14	20 83 	  . 
	jr nz,$-123		;ed16	20 83 	  . 
	jr nz,$-123		;ed18	20 83 	  . 
	jr nz,$-123		;ed1a	20 83 	  . 
	jr nz,$-123		;ed1c	20 83 	  . 
	jr nz,$-123		;ed1e	20 83 	  . 
	jr nz,$-123		;ed20	20 83 	  . 
	jr nz,$-123		;ed22	20 83 	  . 
	jr nz,$-123		;ed24	20 83 	  . 
	jr nz,$-123		;ed26	20 83 	  . 
	jr nz,$-123		;ed28	20 83 	  . 
	jr nz,$-123		;ed2a	20 83 	  . 
	jr nz,$-123		;ed2c	20 83 	  . 
	jr nz,$-123		;ed2e	20 83 	  . 
	jr nz,$-123		;ed30	20 83 	  . 
	jr nz,$-123		;ed32	20 83 	  . 
	jr nz,$-123		;ed34	20 83 	  . 
	jr nz,$-123		;ed36	20 83 	  . 
	jr nz,$-123		;ed38	20 83 	  . 
	jr nz,$-123		;ed3a	20 83 	  . 
	jr nz,$-123		;ed3c	20 83 	  . 
	jr nz,$-123		;ed3e	20 83 	  . 
	jr nz,$-123		;ed40	20 83 	  . 
	jr nz,$-123		;ed42	20 83 	  . 
	jr nz,$-123		;ed44	20 83 	  . 
	jr nz,$-123		;ed46	20 83 	  . 
	jr nz,$-123		;ed48	20 83 	  . 
	jr nz,$-123		;ed4a	20 83 	  . 
	jr nz,$-123		;ed4c	20 83 	  . 
	jr nz,$-123		;ed4e	20 83 	  . 
	jr nz,$-123		;ed50	20 83 	  . 
	jr nz,$-123		;ed52	20 83 	  . 
	jr nz,$-123		;ed54	20 83 	  . 
	jr nz,$-123		;ed56	20 83 	  . 
	jr nz,$-123		;ed58	20 83 	  . 
	jr nz,$-123		;ed5a	20 83 	  . 
	jr nz,$-123		;ed5c	20 83 	  . 
	jr nz,$-123		;ed5e	20 83 	  . 
	jr nz,$-123		;ed60	20 83 	  . 
	jr nz,$-123		;ed62	20 83 	  . 
	jr nz,$-123		;ed64	20 83 	  . 
	jr nz,$-123		;ed66	20 83 	  . 
	jr nz,$-123		;ed68	20 83 	  . 
	jr nz,$-123		;ed6a	20 83 	  . 
	jr nz,$-123		;ed6c	20 83 	  . 
	jr nz,$-123		;ed6e	20 83 	  . 
	jr nz,$-123		;ed70	20 83 	  . 
	jr nz,$-123		;ed72	20 83 	  . 
	jr nz,$-123		;ed74	20 83 	  . 
	jr nz,$-123		;ed76	20 83 	  . 
	jr nz,$-123		;ed78	20 83 	  . 
	jr nz,$-123		;ed7a	20 83 	  . 
	jr nz,$-123		;ed7c	20 83 	  . 
	jr nz,$-123		;ed7e	20 83 	  . 
	jr nz,$-123		;ed80	20 83 	  . 
	jr nz,$-123		;ed82	20 83 	  . 
	jr nz,$-123		;ed84	20 83 	  . 
	jr nz,$-123		;ed86	20 83 	  . 
	jr nz,$-123		;ed88	20 83 	  . 
	jr nz,$-123		;ed8a	20 83 	  . 
	jr nz,$-123		;ed8c	20 83 	  . 
	jr nz,$-123		;ed8e	20 83 	  . 
	jr nz,$-123		;ed90	20 83 	  . 
	jr nz,$-123		;ed92	20 83 	  . 
	jr nz,$-123		;ed94	20 83 	  . 
	jr nz,$-123		;ed96	20 83 	  . 
	jr nz,$-123		;ed98	20 83 	  . 
	jr nz,$-123		;ed9a	20 83 	  . 
	jr nz,$-123		;ed9c	20 83 	  . 
	jr nz,$-123		;ed9e	20 83 	  . 
	jr nz,$-123		;eda0	20 83 	  . 
	jr nz,$-123		;eda2	20 83 	  . 
	jr nz,$-123		;eda4	20 83 	  . 
	jr nz,$-123		;eda6	20 83 	  . 
	jr nz,$-123		;eda8	20 83 	  . 
	jr nz,$-123		;edaa	20 83 	  . 
	jr nz,$-123		;edac	20 83 	  . 
	jr nz,$-123		;edae	20 83 	  . 
	jr nz,$-123		;edb0	20 83 	  . 
	jr nz,$-123		;edb2	20 83 	  . 
	jr nz,$-123		;edb4	20 83 	  . 
	jr nz,$-123		;edb6	20 83 	  . 
	jr nz,$-123		;edb8	20 83 	  . 
	jr nz,$-123		;edba	20 83 	  . 
	jr nz,$-123		;edbc	20 83 	  . 
	jr nz,$-123		;edbe	20 83 	  . 
	jr nz,$-123		;edc0	20 83 	  . 
	jr nz,$-123		;edc2	20 83 	  . 
	jr nz,$-123		;edc4	20 83 	  . 
	jr nz,$-123		;edc6	20 83 	  . 
	jr nz,$-123		;edc8	20 83 	  . 
	jr nz,$-123		;edca	20 83 	  . 
	jr nz,$-123		;edcc	20 83 	  . 
	jr nz,$-123		;edce	20 83 	  . 
	jr nz,$-123		;edd0	20 83 	  . 
	jr nz,$-123		;edd2	20 83 	  . 
	jr nz,$-123		;edd4	20 83 	  . 
	jr nz,$-123		;edd6	20 83 	  . 
	jr nz,$-123		;edd8	20 83 	  . 
	jr nz,$-123		;edda	20 83 	  . 
	jr nz,$-123		;eddc	20 83 	  . 
	jr nz,$-123		;edde	20 83 	  . 
	jr nz,$-123		;ede0	20 83 	  . 
	jr nz,$-123		;ede2	20 83 	  . 
	jr nz,$-123		;ede4	20 83 	  . 
	jr nz,$-123		;ede6	20 83 	  . 
	jr nz,$-123		;ede8	20 83 	  . 
	jr nz,$-123		;edea	20 83 	  . 
	jr nz,$-123		;edec	20 83 	  . 
	jr nz,$-123		;edee	20 83 	  . 
	jr nz,$-123		;edf0	20 83 	  . 
	jr nz,$-123		;edf2	20 83 	  . 
	jr nz,$-123		;edf4	20 83 	  . 
	jr nz,$-123		;edf6	20 83 	  . 
	jr nz,$-123		;edf8	20 83 	  . 
	jr nz,$-123		;edfa	20 83 	  . 
	jr nz,$-123		;edfc	20 83 	  . 
	jr nz,$-123		;edfe	20 83 	  . 
	jr nz,$-123		;ee00	20 83 	  . 
	jr nz,$-123		;ee02	20 83 	  . 
	jr nz,$-123		;ee04	20 83 	  . 
	jr nz,$-123		;ee06	20 83 	  . 
	jr nz,$-123		;ee08	20 83 	  . 
	jr nz,$-123		;ee0a	20 83 	  . 
	jr nz,$-123		;ee0c	20 83 	  . 
	jr nz,$-123		;ee0e	20 83 	  . 
	jr nz,$-123		;ee10	20 83 	  . 
	jr nz,$-123		;ee12	20 83 	  . 
	jr nz,$-123		;ee14	20 83 	  . 
	jr nz,$-123		;ee16	20 83 	  . 
	jr nz,$-123		;ee18	20 83 	  . 
	jr nz,$-123		;ee1a	20 83 	  . 
	jr nz,$-123		;ee1c	20 83 	  . 
	jr nz,$-123		;ee1e	20 83 	  . 
	jr nz,$-123		;ee20	20 83 	  . 
	jr nz,$-123		;ee22	20 83 	  . 
	jr nz,$-123		;ee24	20 83 	  . 
	jr nz,$-123		;ee26	20 83 	  . 
	jr nz,$-123		;ee28	20 83 	  . 
	jr nz,$-123		;ee2a	20 83 	  . 
	jr nz,$-123		;ee2c	20 83 	  . 
	jr nz,$-123		;ee2e	20 83 	  . 
	jr nz,$-123		;ee30	20 83 	  . 
	jr nz,$-123		;ee32	20 83 	  . 
	jr nz,$-123		;ee34	20 83 	  . 
	jr nz,$-123		;ee36	20 83 	  . 
	jr nz,$-123		;ee38	20 83 	  . 
	jr nz,$-123		;ee3a	20 83 	  . 
	jr nz,$-123		;ee3c	20 83 	  . 
	jr nz,$-123		;ee3e	20 83 	  . 
	jr nz,$-123		;ee40	20 83 	  . 
	jr nz,$-123		;ee42	20 83 	  . 
	jr nz,$-123		;ee44	20 83 	  . 
	jr nz,$-123		;ee46	20 83 	  . 
	jr nz,$-123		;ee48	20 83 	  . 
	jr nz,$-123		;ee4a	20 83 	  . 
	jr nz,$-123		;ee4c	20 83 	  . 
	jr nz,$-123		;ee4e	20 83 	  . 
	jr nz,$-123		;ee50	20 83 	  . 
	jr nz,$-123		;ee52	20 83 	  . 
	jr nz,$-123		;ee54	20 83 	  . 
	jr nz,$-123		;ee56	20 83 	  . 
	jr nz,$-123		;ee58	20 83 	  . 
	jr nz,$-123		;ee5a	20 83 	  . 
	jr nz,$-123		;ee5c	20 83 	  . 
	jr nz,$-123		;ee5e	20 83 	  . 
	jr nz,$-123		;ee60	20 83 	  . 
	jr nz,$-123		;ee62	20 83 	  . 
	jr nz,$-123		;ee64	20 83 	  . 
	jr nz,$-123		;ee66	20 83 	  . 
	jr nz,$-123		;ee68	20 83 	  . 
	jr nz,$-123		;ee6a	20 83 	  . 
	jr nz,$-123		;ee6c	20 83 	  . 
	jr nz,$-123		;ee6e	20 83 	  . 
	jr nz,$-123		;ee70	20 83 	  . 
	jr nz,$-123		;ee72	20 83 	  . 
	jr nz,$-123		;ee74	20 83 	  . 
	jr nz,$-123		;ee76	20 83 	  . 
	jr nz,$-123		;ee78	20 83 	  . 
	jr nz,$-123		;ee7a	20 83 	  . 
	jr nz,$-123		;ee7c	20 83 	  . 
	jr nz,$-123		;ee7e	20 83 	  . 
	jr nz,$-123		;ee80	20 83 	  . 
	jr nz,$-123		;ee82	20 83 	  . 
	jr nz,$-123		;ee84	20 83 	  . 
	jr nz,$-123		;ee86	20 83 	  . 
	jr nz,$-123		;ee88	20 83 	  . 
	jr nz,$-123		;ee8a	20 83 	  . 
	jr nz,$-123		;ee8c	20 83 	  . 
	jr nz,$-123		;ee8e	20 83 	  . 
	jr nz,$-123		;ee90	20 83 	  . 
	jr nz,$-123		;ee92	20 83 	  . 
	jr nz,$-123		;ee94	20 83 	  . 
	jr nz,$-123		;ee96	20 83 	  . 
	jr nz,$-123		;ee98	20 83 	  . 
	jr nz,$-123		;ee9a	20 83 	  . 
	jr nz,$-123		;ee9c	20 83 	  . 
	jr nz,$-123		;ee9e	20 83 	  . 
	jr nz,$-123		;eea0	20 83 	  . 
	jr nz,$-123		;eea2	20 83 	  . 
	jr nz,$-123		;eea4	20 83 	  . 
	jr nz,$-123		;eea6	20 83 	  . 
	jr nz,$-123		;eea8	20 83 	  . 
	jr nz,$-123		;eeaa	20 83 	  . 
	jr nz,$-123		;eeac	20 83 	  . 
	jr nz,$-123		;eeae	20 83 	  . 
	jr nz,$-123		;eeb0	20 83 	  . 
	jr nz,$-123		;eeb2	20 83 	  . 
	jr nz,$-123		;eeb4	20 83 	  . 
	jr nz,$-123		;eeb6	20 83 	  . 
	jr nz,$-123		;eeb8	20 83 	  . 
	jr nz,$-123		;eeba	20 83 	  . 
	jr nz,$-123		;eebc	20 83 	  . 
	jr nz,$-123		;eebe	20 83 	  . 
	jr nz,$-123		;eec0	20 83 	  . 
	jr nz,$-123		;eec2	20 83 	  . 
	jr nz,$-123		;eec4	20 83 	  . 
	jr nz,$-123		;eec6	20 83 	  . 
	jr nz,$-123		;eec8	20 83 	  . 
	jr nz,$-123		;eeca	20 83 	  . 
	jr nz,$-123		;eecc	20 83 	  . 
	jr nz,$-123		;eece	20 83 	  . 
	jr nz,$-123		;eed0	20 83 	  . 
	jr nz,$-123		;eed2	20 83 	  . 
	jr nz,$-123		;eed4	20 83 	  . 
	jr nz,$-123		;eed6	20 83 	  . 
	jr nz,$-123		;eed8	20 83 	  . 
	jr nz,$-123		;eeda	20 83 	  . 
	jr nz,$-123		;eedc	20 83 	  . 
	jr nz,$-123		;eede	20 83 	  . 
	jr nz,$-123		;eee0	20 83 	  . 
	jr nz,$-123		;eee2	20 83 	  . 
	jr nz,$-123		;eee4	20 83 	  . 
	jr nz,$-123		;eee6	20 83 	  . 
	jr nz,$-123		;eee8	20 83 	  . 
	jr nz,$-123		;eeea	20 83 	  . 
	jr nz,$-123		;eeec	20 83 	  . 
	jr nz,$-123		;eeee	20 83 	  . 
	jr nz,$-123		;eef0	20 83 	  . 
	jr nz,$-123		;eef2	20 83 	  . 
	jr nz,$-123		;eef4	20 83 	  . 
	jr nz,$-123		;eef6	20 83 	  . 
	jr nz,$-123		;eef8	20 83 	  . 
	jr nz,$-123		;eefa	20 83 	  . 
	jr nz,$-123		;eefc	20 83 	  . 
	jr nz,$-123		;eefe	20 83 	  . 
	jr nz,$-123		;ef00	20 83 	  . 
	jr nz,$-123		;ef02	20 83 	  . 
	jr nz,$-123		;ef04	20 83 	  . 
	jr nz,$-123		;ef06	20 83 	  . 
	jr nz,$-123		;ef08	20 83 	  . 
	jr nz,$-123		;ef0a	20 83 	  . 
	jr nz,$-123		;ef0c	20 83 	  . 
	jr nz,$-123		;ef0e	20 83 	  . 
	jr nz,$-123		;ef10	20 83 	  . 
	jr nz,$-123		;ef12	20 83 	  . 
	jr nz,$-123		;ef14	20 83 	  . 
	jr nz,$-123		;ef16	20 83 	  . 
	jr nz,$-123		;ef18	20 83 	  . 
	jr nz,$-123		;ef1a	20 83 	  . 
	jr nz,$-123		;ef1c	20 83 	  . 
	jr nz,$-123		;ef1e	20 83 	  . 
	jr nz,$-123		;ef20	20 83 	  . 
	jr nz,$-123		;ef22	20 83 	  . 
	jr nz,$-123		;ef24	20 83 	  . 
	jr nz,$-123		;ef26	20 83 	  . 
	jr nz,$-123		;ef28	20 83 	  . 
	jr nz,$-123		;ef2a	20 83 	  . 
	jr nz,$-123		;ef2c	20 83 	  . 
	jr nz,$-123		;ef2e	20 83 	  . 
	jr nz,$-123		;ef30	20 83 	  . 
	jr nz,$-123		;ef32	20 83 	  . 
	jr nz,$-123		;ef34	20 83 	  . 
	jr nz,$-123		;ef36	20 83 	  . 
	jr nz,$-123		;ef38	20 83 	  . 
	jr nz,$-123		;ef3a	20 83 	  . 
	jr nz,$-123		;ef3c	20 83 	  . 
	jr nz,$-123		;ef3e	20 83 	  . 
	jr nz,$-123		;ef40	20 83 	  . 
	jr nz,$-123		;ef42	20 83 	  . 
	jr nz,$-123		;ef44	20 83 	  . 
	jr nz,$-123		;ef46	20 83 	  . 
	jr nz,$-123		;ef48	20 83 	  . 
	jr nz,$-123		;ef4a	20 83 	  . 
	jr nz,$-123		;ef4c	20 83 	  . 
	jr nz,$-123		;ef4e	20 83 	  . 
	jr nz,$-123		;ef50	20 83 	  . 
	jr nz,$-123		;ef52	20 83 	  . 
	jr nz,$-123		;ef54	20 83 	  . 
	jr nz,$-123		;ef56	20 83 	  . 
	jr nz,$-123		;ef58	20 83 	  . 
	jr nz,$-123		;ef5a	20 83 	  . 
	jr nz,$-123		;ef5c	20 83 	  . 
	jr nz,$-123		;ef5e	20 83 	  . 
	jr nz,$-123		;ef60	20 83 	  . 
	jr nz,$-123		;ef62	20 83 	  . 
	jr nz,$-123		;ef64	20 83 	  . 
	jr nz,$-123		;ef66	20 83 	  . 
	jr nz,$-123		;ef68	20 83 	  . 
	jr nz,$-123		;ef6a	20 83 	  . 
	jr nz,$-123		;ef6c	20 83 	  . 
	jr nz,$-123		;ef6e	20 83 	  . 
	jr nz,$-123		;ef70	20 83 	  . 
	jr nz,$-123		;ef72	20 83 	  . 
	jr nz,$-123		;ef74	20 83 	  . 
	jr nz,$-123		;ef76	20 83 	  . 
	jr nz,$-123		;ef78	20 83 	  . 
	jr nz,$-123		;ef7a	20 83 	  . 
	jr nz,$-123		;ef7c	20 83 	  . 
	jr nz,$-123		;ef7e	20 83 	  . 
	jr nz,$-123		;ef80	20 83 	  . 
	jr nz,$-123		;ef82	20 83 	  . 
	jr nz,$-123		;ef84	20 83 	  . 
	jr nz,$-123		;ef86	20 83 	  . 
	jr nz,$-123		;ef88	20 83 	  . 
	jr nz,$-123		;ef8a	20 83 	  . 
	jr nz,$-123		;ef8c	20 83 	  . 
	jr nz,$-123		;ef8e	20 83 	  . 
	jr nz,$-123		;ef90	20 83 	  . 
	jr nz,$-123		;ef92	20 83 	  . 
	jr nz,$-123		;ef94	20 83 	  . 
	jr nz,$-123		;ef96	20 83 	  . 
	jr nz,$-123		;ef98	20 83 	  . 
	jr nz,$-123		;ef9a	20 83 	  . 
	jr nz,$-123		;ef9c	20 83 	  . 
	jr nz,$-123		;ef9e	20 83 	  . 
	jr nz,$-123		;efa0	20 83 	  . 
	jr nz,$-123		;efa2	20 83 	  . 
	jr nz,$-123		;efa4	20 83 	  . 
	jr nz,$-123		;efa6	20 83 	  . 
	jr nz,$-123		;efa8	20 83 	  . 
	jr nz,$-123		;efaa	20 83 	  . 
	jr nz,$-123		;efac	20 83 	  . 
	jr nz,$-123		;efae	20 83 	  . 
	jr nz,$-123		;efb0	20 83 	  . 
	jr nz,$-123		;efb2	20 83 	  . 
	jr nz,$-123		;efb4	20 83 	  . 
	jr nz,$-123		;efb6	20 83 	  . 
	jr nz,$-123		;efb8	20 83 	  . 
	jr nz,$-123		;efba	20 83 	  . 
	jr nz,$-123		;efbc	20 83 	  . 
	jr nz,$-123		;efbe	20 83 	  . 
	jr nz,$-123		;efc0	20 83 	  . 
	jr nz,$-123		;efc2	20 83 	  . 
	jr nz,$-123		;efc4	20 83 	  . 
	jr nz,$-123		;efc6	20 83 	  . 
	jr nz,$-123		;efc8	20 83 	  . 
	jr nz,$-123		;efca	20 83 	  . 
	jr nz,$-123		;efcc	20 83 	  . 
	jr nz,$-123		;efce	20 83 	  . 
	jr nz,$-123		;efd0	20 83 	  . 
	jr nz,$-123		;efd2	20 83 	  . 
	jr nz,$-123		;efd4	20 83 	  . 
	jr nz,$-123		;efd6	20 83 	  . 
	jr nz,$-123		;efd8	20 83 	  . 
	jr nz,$-123		;efda	20 83 	  . 
	jr nz,$-123		;efdc	20 83 	  . 
	jr nz,$-123		;efde	20 83 	  . 
	jr nz,$-123		;efe0	20 83 	  . 
	jr nz,$-123		;efe2	20 83 	  . 
	jr nz,$-123		;efe4	20 83 	  . 
	jr nz,$-123		;efe6	20 83 	  . 
	jr nz,$-123		;efe8	20 83 	  . 
	jr nz,$-123		;efea	20 83 	  . 
	jr nz,$-123		;efec	20 83 	  . 
	jr nz,$-123		;efee	20 83 	  . 
	jr nz,$-123		;eff0	20 83 	  . 
	jr nz,$-123		;eff2	20 83 	  . 
	jr nz,$-123		;eff4	20 83 	  . 
	jr nz,$-123		;eff6	20 83 	  . 
	jr nz,$-123		;eff8	20 83 	  . 
	jr nz,$-123		;effa	20 83 	  . 
	jr nz,$-123		;effc	20 83 	  . 
	jr nz,$-123		;effe	20 83 	  . 
	jr nz,$-123		;f000	20 83 	  . 
	jr nz,$-123		;f002	20 83 	  . 
	jr nz,$-123		;f004	20 83 	  . 
	jr nz,$-123		;f006	20 83 	  . 
	jr nz,$-123		;f008	20 83 	  . 
	jr nz,$-123		;f00a	20 83 	  . 
	jr nz,$-123		;f00c	20 83 	  . 
	jr nz,$-123		;f00e	20 83 	  . 
	jr nz,$-123		;f010	20 83 	  . 
	jr nz,$-123		;f012	20 83 	  . 
	jr nz,$-123		;f014	20 83 	  . 
	jr nz,$-123		;f016	20 83 	  . 
	jr nz,$-123		;f018	20 83 	  . 
	jr nz,$-123		;f01a	20 83 	  . 
	jr nz,$-123		;f01c	20 83 	  . 
	jr nz,$-123		;f01e	20 83 	  . 
	jr nz,$-123		;f020	20 83 	  . 
	jr nz,$-123		;f022	20 83 	  . 
	jr nz,$-123		;f024	20 83 	  . 
	jr nz,$-123		;f026	20 83 	  . 
	jr nz,$-123		;f028	20 83 	  . 
	jr nz,$-123		;f02a	20 83 	  . 
	jr nz,$-123		;f02c	20 83 	  . 
	jr nz,$-123		;f02e	20 83 	  . 
	jr nz,$-123		;f030	20 83 	  . 
	jr nz,$-123		;f032	20 83 	  . 
	jr nz,$-123		;f034	20 83 	  . 
	jr nz,$-123		;f036	20 83 	  . 
	jr nz,$-123		;f038	20 83 	  . 
	jr nz,$-123		;f03a	20 83 	  . 
	jr nz,$-123		;f03c	20 83 	  . 
	jr nz,$-123		;f03e	20 83 	  . 
	jr nz,$-123		;f040	20 83 	  . 
	jr nz,$-123		;f042	20 83 	  . 
	jr nz,$-123		;f044	20 83 	  . 
	jr nz,$-123		;f046	20 83 	  . 
	jr nz,$-123		;f048	20 83 	  . 
	jr nz,$-123		;f04a	20 83 	  . 
	jr nz,$-123		;f04c	20 83 	  . 
	jr nz,$-123		;f04e	20 83 	  . 
	jr nz,$-123		;f050	20 83 	  . 
	jr nz,$-123		;f052	20 83 	  . 
	jr nz,$-123		;f054	20 83 	  . 
	jr nz,$-123		;f056	20 83 	  . 
	jr nz,$-123		;f058	20 83 	  . 
	jr nz,$-123		;f05a	20 83 	  . 
	jr nz,$-123		;f05c	20 83 	  . 
	jr nz,$-123		;f05e	20 83 	  . 
	jr nz,$-123		;f060	20 83 	  . 
	jr nz,$-123		;f062	20 83 	  . 
	jr nz,$-123		;f064	20 83 	  . 
	jr nz,$-123		;f066	20 83 	  . 
	jr nz,$-123		;f068	20 83 	  . 
	jr nz,$-123		;f06a	20 83 	  . 
	jr nz,$-123		;f06c	20 83 	  . 
	jr nz,$-123		;f06e	20 83 	  . 
	jr nz,$-123		;f070	20 83 	  . 
	jr nz,$-123		;f072	20 83 	  . 
	jr nz,$-123		;f074	20 83 	  . 
	jr nz,$-123		;f076	20 83 	  . 
	jr nz,$-123		;f078	20 83 	  . 
	jr nz,$-123		;f07a	20 83 	  . 
	jr nz,$-123		;f07c	20 83 	  . 
	jr nz,$-123		;f07e	20 83 	  . 
	jr nz,$-123		;f080	20 83 	  . 
	jr nz,$-123		;f082	20 83 	  . 
	jr nz,$-123		;f084	20 83 	  . 
	jr nz,$-123		;f086	20 83 	  . 
	jr nz,$-123		;f088	20 83 	  . 
	jr nz,$-123		;f08a	20 83 	  . 
	jr nz,$-123		;f08c	20 83 	  . 
	jr nz,$-123		;f08e	20 83 	  . 
	jr nz,$-123		;f090	20 83 	  . 
	jr nz,$-123		;f092	20 83 	  . 
	jr nz,$-123		;f094	20 83 	  . 
	jr nz,$-123		;f096	20 83 	  . 
	jr nz,$-123		;f098	20 83 	  . 
	jr nz,$-123		;f09a	20 83 	  . 
	jr nz,$-123		;f09c	20 83 	  . 
	jr nz,$-123		;f09e	20 83 	  . 
	jr nz,$-123		;f0a0	20 83 	  . 
	jr nz,$-123		;f0a2	20 83 	  . 
	jr nz,$-123		;f0a4	20 83 	  . 
	jr nz,$-123		;f0a6	20 83 	  . 
	jr nz,$-123		;f0a8	20 83 	  . 
	jr nz,$-123		;f0aa	20 83 	  . 
	jr nz,$-123		;f0ac	20 83 	  . 
	jr nz,$-123		;f0ae	20 83 	  . 
	jr nz,$-123		;f0b0	20 83 	  . 
	jr nz,$-123		;f0b2	20 83 	  . 
	jr nz,$-123		;f0b4	20 83 	  . 
	jr nz,$-123		;f0b6	20 83 	  . 
	jr nz,$-123		;f0b8	20 83 	  . 
	jr nz,$-123		;f0ba	20 83 	  . 
	jr nz,$-123		;f0bc	20 83 	  . 
	jr nz,$-123		;f0be	20 83 	  . 
	jr nz,$-123		;f0c0	20 83 	  . 
	jr nz,$-123		;f0c2	20 83 	  . 
	jr nz,$-123		;f0c4	20 83 	  . 
	jr nz,$-123		;f0c6	20 83 	  . 
	jr nz,$-123		;f0c8	20 83 	  . 
	jr nz,$-123		;f0ca	20 83 	  . 
	jr nz,$-123		;f0cc	20 83 	  . 
	jr nz,$-123		;f0ce	20 83 	  . 
	jr nz,$-123		;f0d0	20 83 	  . 
	jr nz,$-123		;f0d2	20 83 	  . 
	jr nz,$-123		;f0d4	20 83 	  . 
	jr nz,$-123		;f0d6	20 83 	  . 
	jr nz,$-123		;f0d8	20 83 	  . 
	jr nz,$-123		;f0da	20 83 	  . 
	jr nz,$-123		;f0dc	20 83 	  . 
	jr nz,$-123		;f0de	20 83 	  . 
	jr nz,$-123		;f0e0	20 83 	  . 
	jr nz,$-123		;f0e2	20 83 	  . 
	jr nz,$-123		;f0e4	20 83 	  . 
	jr nz,$-123		;f0e6	20 83 	  . 
	jr nz,$-123		;f0e8	20 83 	  . 
	jr nz,$-123		;f0ea	20 83 	  . 
	jr nz,$-123		;f0ec	20 83 	  . 
	jr nz,$-123		;f0ee	20 83 	  . 
	jr nz,$-123		;f0f0	20 83 	  . 
	jr nz,$-123		;f0f2	20 83 	  . 
	jr nz,$-123		;f0f4	20 83 	  . 
	jr nz,$-123		;f0f6	20 83 	  . 
	jr nz,$-123		;f0f8	20 83 	  . 
	jr nz,$-123		;f0fa	20 83 	  . 
	jr nz,$-123		;f0fc	20 83 	  . 
	jr nz,$-123		;f0fe	20 83 	  . 
	jr nz,$-123		;f100	20 83 	  . 
	jr nz,$-123		;f102	20 83 	  . 
	jr nz,$-123		;f104	20 83 	  . 
	jr nz,$-123		;f106	20 83 	  . 
	jr nz,$-123		;f108	20 83 	  . 
	jr nz,$-123		;f10a	20 83 	  . 
	jr nz,$-123		;f10c	20 83 	  . 
	jr nz,$-123		;f10e	20 83 	  . 
	jr nz,$-123		;f110	20 83 	  . 
	jr nz,$-123		;f112	20 83 	  . 
	jr nz,$-123		;f114	20 83 	  . 
	jr nz,$-123		;f116	20 83 	  . 
	jr nz,$-123		;f118	20 83 	  . 
	jr nz,$-123		;f11a	20 83 	  . 
	jr nz,$-123		;f11c	20 83 	  . 
	jr nz,$-123		;f11e	20 83 	  . 
	jr nz,$-123		;f120	20 83 	  . 
	jr nz,$-123		;f122	20 83 	  . 
	jr nz,$-123		;f124	20 83 	  . 
	jr nz,$-123		;f126	20 83 	  . 
	jr nz,$-123		;f128	20 83 	  . 
	jr nz,$-123		;f12a	20 83 	  . 
	jr nz,$-123		;f12c	20 83 	  . 
	jr nz,$-123		;f12e	20 83 	  . 
	jr nz,$-123		;f130	20 83 	  . 
	jr nz,$-123		;f132	20 83 	  . 
	jr nz,$-123		;f134	20 83 	  . 
	jr nz,$-123		;f136	20 83 	  . 
	jr nz,$-123		;f138	20 83 	  . 
	jr nz,$-123		;f13a	20 83 	  . 
	jr nz,$-123		;f13c	20 83 	  . 
	jr nz,$-123		;f13e	20 83 	  . 
	jr nz,$-123		;f140	20 83 	  . 
	jr nz,$-123		;f142	20 83 	  . 
	jr nz,$-123		;f144	20 83 	  . 
	jr nz,$-123		;f146	20 83 	  . 
	jr nz,$-123		;f148	20 83 	  . 
	jr nz,$-123		;f14a	20 83 	  . 
	jr nz,$-123		;f14c	20 83 	  . 
	jr nz,$-123		;f14e	20 83 	  . 
	jr nz,$-123		;f150	20 83 	  . 
	jr nz,$-123		;f152	20 83 	  . 
	jr nz,$-123		;f154	20 83 	  . 
	jr nz,$-123		;f156	20 83 	  . 
	jr nz,$-123		;f158	20 83 	  . 
	jr nz,$-123		;f15a	20 83 	  . 
	jr nz,$-123		;f15c	20 83 	  . 
	jr nz,$-123		;f15e	20 83 	  . 
	jr nz,$-123		;f160	20 83 	  . 
	jr nz,$-123		;f162	20 83 	  . 
	jr nz,$-123		;f164	20 83 	  . 
	jr nz,$-123		;f166	20 83 	  . 
	jr nz,$-123		;f168	20 83 	  . 
	jr nz,$-123		;f16a	20 83 	  . 
	jr nz,$-123		;f16c	20 83 	  . 
	jr nz,$-123		;f16e	20 83 	  . 
	jr nz,$-123		;f170	20 83 	  . 
	jr nz,$-123		;f172	20 83 	  . 
	jr nz,$-123		;f174	20 83 	  . 
	jr nz,$-123		;f176	20 83 	  . 
	jr nz,$-123		;f178	20 83 	  . 
	jr nz,$-123		;f17a	20 83 	  . 
	jr nz,$-123		;f17c	20 83 	  . 
	jr nz,$-123		;f17e	20 83 	  . 
	jr nz,$-123		;f180	20 83 	  . 
	jr nz,$-123		;f182	20 83 	  . 
	jr nz,$-123		;f184	20 83 	  . 
	jr nz,$-123		;f186	20 83 	  . 
	jr nz,$-123		;f188	20 83 	  . 
	jr nz,$-123		;f18a	20 83 	  . 
	jr nz,$-123		;f18c	20 83 	  . 
	jr nz,$-123		;f18e	20 83 	  . 
	jr nz,$-123		;f190	20 83 	  . 
	jr nz,$-123		;f192	20 83 	  . 
	jr nz,$-123		;f194	20 83 	  . 
	jr nz,$-123		;f196	20 83 	  . 
	jr nz,$-123		;f198	20 83 	  . 
	jr nz,$-123		;f19a	20 83 	  . 
	jr nz,$-123		;f19c	20 83 	  . 
	jr nz,$-123		;f19e	20 83 	  . 
	jr nz,$-123		;f1a0	20 83 	  . 
	jr nz,$-123		;f1a2	20 83 	  . 
	jr nz,$-123		;f1a4	20 83 	  . 
	jr nz,$-123		;f1a6	20 83 	  . 
	jr nz,$-123		;f1a8	20 83 	  . 
	jr nz,$-123		;f1aa	20 83 	  . 
	jr nz,$-123		;f1ac	20 83 	  . 
	jr nz,$-123		;f1ae	20 83 	  . 
	jr nz,$-123		;f1b0	20 83 	  . 
	jr nz,$-123		;f1b2	20 83 	  . 
	jr nz,$-123		;f1b4	20 83 	  . 
	jr nz,$-123		;f1b6	20 83 	  . 
	jr nz,$-123		;f1b8	20 83 	  . 
	jr nz,$-123		;f1ba	20 83 	  . 
	jr nz,$-123		;f1bc	20 83 	  . 
	jr nz,$-123		;f1be	20 83 	  . 
	jr nz,$-123		;f1c0	20 83 	  . 
	jr nz,$-123		;f1c2	20 83 	  . 
	jr nz,$-123		;f1c4	20 83 	  . 
	jr nz,$-123		;f1c6	20 83 	  . 
	jr nz,$-123		;f1c8	20 83 	  . 
	jr nz,$-123		;f1ca	20 83 	  . 
	jr nz,$-123		;f1cc	20 83 	  . 
	jr nz,$-123		;f1ce	20 83 	  . 
	jr nz,$-123		;f1d0	20 83 	  . 
	jr nz,$-123		;f1d2	20 83 	  . 
	jr nz,$-123		;f1d4	20 83 	  . 
	jr nz,$-123		;f1d6	20 83 	  . 
	jr nz,$-123		;f1d8	20 83 	  . 
	jr nz,$-123		;f1da	20 83 	  . 
	jr nz,$-123		;f1dc	20 83 	  . 
	jr nz,$-123		;f1de	20 83 	  . 
	jr nz,$-123		;f1e0	20 83 	  . 
	jr nz,$-123		;f1e2	20 83 	  . 
	jr nz,$-123		;f1e4	20 83 	  . 
	jr nz,$-123		;f1e6	20 83 	  . 
	jr nz,$-123		;f1e8	20 83 	  . 
	jr nz,$-123		;f1ea	20 83 	  . 
	jr nz,$-123		;f1ec	20 83 	  . 
	jr nz,$-123		;f1ee	20 83 	  . 
	jr nz,$-123		;f1f0	20 83 	  . 
	jr nz,$-123		;f1f2	20 83 	  . 
	jr nz,$-123		;f1f4	20 83 	  . 
	jr nz,$-123		;f1f6	20 83 	  . 
	jr nz,$-123		;f1f8	20 83 	  . 
	jr nz,$-123		;f1fa	20 83 	  . 
	jr nz,$-123		;f1fc	20 83 	  . 
	jr nz,$-123		;f1fe	20 83 	  . 
	jr nz,$-123		;f200	20 83 	  . 
	jr nz,$-123		;f202	20 83 	  . 
	jr nz,$-123		;f204	20 83 	  . 
	jr nz,$-123		;f206	20 83 	  . 
	jr nz,$-123		;f208	20 83 	  . 
	jr nz,$-123		;f20a	20 83 	  . 
	jr nz,$-123		;f20c	20 83 	  . 
	jr nz,$-123		;f20e	20 83 	  . 
	jr nz,$-123		;f210	20 83 	  . 
	jr nz,$-123		;f212	20 83 	  . 
	jr nz,$-123		;f214	20 83 	  . 
	jr nz,$-123		;f216	20 83 	  . 
	jr nz,$-123		;f218	20 83 	  . 
	jr nz,$-123		;f21a	20 83 	  . 
	jr nz,$-123		;f21c	20 83 	  . 
	jr nz,$-123		;f21e	20 83 	  . 
	jr nz,$-123		;f220	20 83 	  . 
	jr nz,$-123		;f222	20 83 	  . 
	jr nz,$-123		;f224	20 83 	  . 
	jr nz,$-123		;f226	20 83 	  . 
	jr nz,$-123		;f228	20 83 	  . 
	jr nz,$-123		;f22a	20 83 	  . 
	jr nz,$-123		;f22c	20 83 	  . 
	jr nz,$-123		;f22e	20 83 	  . 
	jr nz,$-123		;f230	20 83 	  . 
	jr nz,$-123		;f232	20 83 	  . 
	jr nz,$-123		;f234	20 83 	  . 
	jr nz,$-123		;f236	20 83 	  . 
	jr nz,$-123		;f238	20 83 	  . 
	jr nz,$-123		;f23a	20 83 	  . 
	jr nz,$-123		;f23c	20 83 	  . 
	jr nz,$-123		;f23e	20 83 	  . 
	jr nz,$-123		;f240	20 83 	  . 
	jr nz,$-123		;f242	20 83 	  . 
	jr nz,$-123		;f244	20 83 	  . 
	jr nz,$-123		;f246	20 83 	  . 
	jr nz,$-123		;f248	20 83 	  . 
	jr nz,$-123		;f24a	20 83 	  . 
	jr nz,$-123		;f24c	20 83 	  . 
	jr nz,$-123		;f24e	20 83 	  . 
	jr nz,$-123		;f250	20 83 	  . 
	jr nz,$-123		;f252	20 83 	  . 
	jr nz,$-123		;f254	20 83 	  . 
	jr nz,$-123		;f256	20 83 	  . 
	jr nz,$-123		;f258	20 83 	  . 
	jr nz,$-123		;f25a	20 83 	  . 
	jr nz,$-123		;f25c	20 83 	  . 
	jr nz,$-123		;f25e	20 83 	  . 
	jr nz,$-123		;f260	20 83 	  . 
	jr nz,$-123		;f262	20 83 	  . 
	jr nz,$-123		;f264	20 83 	  . 
	jr nz,$-123		;f266	20 83 	  . 
	jr nz,$-123		;f268	20 83 	  . 
	jr nz,$-123		;f26a	20 83 	  . 
	jr nz,$-123		;f26c	20 83 	  . 
	jr nz,$-123		;f26e	20 83 	  . 
	jr nz,$-123		;f270	20 83 	  . 
	jr nz,$-123		;f272	20 83 	  . 
	jr nz,$-123		;f274	20 83 	  . 
	jr nz,$-123		;f276	20 83 	  . 
	jr nz,$-123		;f278	20 83 	  . 
	jr nz,$-123		;f27a	20 83 	  . 
	jr nz,$-123		;f27c	20 83 	  . 
	jr nz,$-123		;f27e	20 83 	  . 
	jr nz,$-123		;f280	20 83 	  . 
	jr nz,$-123		;f282	20 83 	  . 
	jr nz,$-123		;f284	20 83 	  . 
	jr nz,$-123		;f286	20 83 	  . 
	jr nz,$-123		;f288	20 83 	  . 
	jr nz,$-123		;f28a	20 83 	  . 
	jr nz,$-123		;f28c	20 83 	  . 
	jr nz,$-123		;f28e	20 83 	  . 
	jr nz,$-123		;f290	20 83 	  . 
	jr nz,$-123		;f292	20 83 	  . 
	jr nz,$-123		;f294	20 83 	  . 
	jr nz,$-123		;f296	20 83 	  . 
	jr nz,$-123		;f298	20 83 	  . 
	jr nz,$-123		;f29a	20 83 	  . 
	jr nz,$-123		;f29c	20 83 	  . 
	jr nz,$-123		;f29e	20 83 	  . 
	jr nz,$-123		;f2a0	20 83 	  . 
	jr nz,$-123		;f2a2	20 83 	  . 
	jr nz,$-123		;f2a4	20 83 	  . 
	jr nz,$-123		;f2a6	20 83 	  . 
	jr nz,$-123		;f2a8	20 83 	  . 
	jr nz,$-123		;f2aa	20 83 	  . 
	jr nz,$-123		;f2ac	20 83 	  . 
	jr nz,$-123		;f2ae	20 83 	  . 
	jr nz,$-123		;f2b0	20 83 	  . 
	jr nz,$-123		;f2b2	20 83 	  . 
	jr nz,$-123		;f2b4	20 83 	  . 
	jr nz,$-123		;f2b6	20 83 	  . 
	jr nz,$-123		;f2b8	20 83 	  . 
	jr nz,$-123		;f2ba	20 83 	  . 
	jr nz,$-123		;f2bc	20 83 	  . 
	jr nz,$-123		;f2be	20 83 	  . 
	jr nz,$-123		;f2c0	20 83 	  . 
	jr nz,$-123		;f2c2	20 83 	  . 
	jr nz,$-123		;f2c4	20 83 	  . 
	jr nz,$-123		;f2c6	20 83 	  . 
	jr nz,$-123		;f2c8	20 83 	  . 
	jr nz,$-123		;f2ca	20 83 	  . 
	jr nz,$-123		;f2cc	20 83 	  . 
	jr nz,$-123		;f2ce	20 83 	  . 
	jr nz,$-123		;f2d0	20 83 	  . 
	jr nz,$-123		;f2d2	20 83 	  . 
	jr nz,$-123		;f2d4	20 83 	  . 
	jr nz,$-123		;f2d6	20 83 	  . 
	jr nz,$-123		;f2d8	20 83 	  . 
	jr nz,$-123		;f2da	20 83 	  . 
	jr nz,$-123		;f2dc	20 83 	  . 
	jr nz,$-123		;f2de	20 83 	  . 
	jr nz,$-123		;f2e0	20 83 	  . 
	jr nz,$-123		;f2e2	20 83 	  . 
	jr nz,$-123		;f2e4	20 83 	  . 
	jr nz,$-123		;f2e6	20 83 	  . 
	jr nz,$-123		;f2e8	20 83 	  . 
	jr nz,$-123		;f2ea	20 83 	  . 
	jr nz,$-123		;f2ec	20 83 	  . 
	jr nz,$-123		;f2ee	20 83 	  . 
	jr nz,$-123		;f2f0	20 83 	  . 
	jr nz,$-123		;f2f2	20 83 	  . 
	jr nz,$-123		;f2f4	20 83 	  . 
	jr nz,$-123		;f2f6	20 83 	  . 
	jr nz,$-123		;f2f8	20 83 	  . 
	jr nz,$-123		;f2fa	20 83 	  . 
	jr nz,$-123		;f2fc	20 83 	  . 
	jr nz,$-123		;f2fe	20 83 	  . 
	jr nz,$-123		;f300	20 83 	  . 
	jr nz,$-123		;f302	20 83 	  . 
	jr nz,$-123		;f304	20 83 	  . 
	jr nz,$-123		;f306	20 83 	  . 
	jr nz,$-123		;f308	20 83 	  . 
	jr nz,$-123		;f30a	20 83 	  . 
	jr nz,$-123		;f30c	20 83 	  . 
	jr nz,$-123		;f30e	20 83 	  . 
	jr nz,$-123		;f310	20 83 	  . 
	jr nz,$-123		;f312	20 83 	  . 
	jr nz,$-123		;f314	20 83 	  . 
	jr nz,$-123		;f316	20 83 	  . 
	jr nz,$-123		;f318	20 83 	  . 
	jr nz,$-123		;f31a	20 83 	  . 
	jr nz,$-123		;f31c	20 83 	  . 
	jr nz,$-123		;f31e	20 83 	  . 
	jr nz,$-123		;f320	20 83 	  . 
	jr nz,$-123		;f322	20 83 	  . 
	jr nz,$-123		;f324	20 83 	  . 
	jr nz,$-123		;f326	20 83 	  . 
	jr nz,$-123		;f328	20 83 	  . 
	jr nz,$-123		;f32a	20 83 	  . 
	jr nz,$-123		;f32c	20 83 	  . 
	jr nz,$-123		;f32e	20 83 	  . 
	jr nz,$-123		;f330	20 83 	  . 
	jr nz,$-123		;f332	20 83 	  . 
	jr nz,$-123		;f334	20 83 	  . 
	jr nz,$-123		;f336	20 83 	  . 
	jr nz,$-123		;f338	20 83 	  . 
	jr nz,$-123		;f33a	20 83 	  . 
	jr nz,$-123		;f33c	20 83 	  . 
	jr nz,$-123		;f33e	20 83 	  . 
	jr nz,$-123		;f340	20 83 	  . 
	jr nz,$-123		;f342	20 83 	  . 
	jr nz,$-123		;f344	20 83 	  . 
	jr nz,$-123		;f346	20 83 	  . 
	jr nz,$-123		;f348	20 83 	  . 
	jr nz,$-123		;f34a	20 83 	  . 
	jr nz,$-123		;f34c	20 83 	  . 
	jr nz,$-123		;f34e	20 83 	  . 
	jr nz,$-123		;f350	20 83 	  . 
	jr nz,$-123		;f352	20 83 	  . 
	jr nz,$-123		;f354	20 83 	  . 
	jr nz,$-123		;f356	20 83 	  . 
	jr nz,$-123		;f358	20 83 	  . 
	jr nz,$-123		;f35a	20 83 	  . 
	jr nz,$-123		;f35c	20 83 	  . 
	jr nz,$-123		;f35e	20 83 	  . 
	jr nz,$-123		;f360	20 83 	  . 
	jr nz,$-123		;f362	20 83 	  . 
	jr nz,$-123		;f364	20 83 	  . 
	jr nz,$-123		;f366	20 83 	  . 
	jr nz,$-123		;f368	20 83 	  . 
	jr nz,$-123		;f36a	20 83 	  . 
	jr nz,$-123		;f36c	20 83 	  . 
	jr nz,$-123		;f36e	20 83 	  . 
	jr nz,$-123		;f370	20 83 	  . 
	jr nz,$-123		;f372	20 83 	  . 
	jr nz,$-123		;f374	20 83 	  . 
	jr nz,$-123		;f376	20 83 	  . 
	jr nz,$-123		;f378	20 83 	  . 
	jr nz,$-123		;f37a	20 83 	  . 
	jr nz,$-123		;f37c	20 83 	  . 
	jr nz,$-123		;f37e	20 83 	  . 
	jr nz,$-123		;f380	20 83 	  . 
	jr nz,$-123		;f382	20 83 	  . 
	jr nz,$-123		;f384	20 83 	  . 
	jr nz,$-123		;f386	20 83 	  . 
	jr nz,$-123		;f388	20 83 	  . 
	jr nz,$-123		;f38a	20 83 	  . 
	jr nz,$-123		;f38c	20 83 	  . 
	jr nz,$-123		;f38e	20 83 	  . 
	jr nz,$-123		;f390	20 83 	  . 
	jr nz,$-123		;f392	20 83 	  . 
	jr nz,$-123		;f394	20 83 	  . 
	jr nz,$-123		;f396	20 83 	  . 
	jr nz,$-123		;f398	20 83 	  . 
	jr nz,$-123		;f39a	20 83 	  . 
	jr nz,$-123		;f39c	20 83 	  . 
	jr nz,$-123		;f39e	20 83 	  . 
	jr nz,$-123		;f3a0	20 83 	  . 
	jr nz,$-123		;f3a2	20 83 	  . 
	jr nz,$-123		;f3a4	20 83 	  . 
	jr nz,$-123		;f3a6	20 83 	  . 
	jr nz,$-123		;f3a8	20 83 	  . 
	jr nz,$-123		;f3aa	20 83 	  . 
	jr nz,$-123		;f3ac	20 83 	  . 
	jr nz,$-123		;f3ae	20 83 	  . 
	jr nz,$-123		;f3b0	20 83 	  . 
	jr nz,$-123		;f3b2	20 83 	  . 
	jr nz,$-123		;f3b4	20 83 	  . 
	jr nz,$-123		;f3b6	20 83 	  . 
	jr nz,$-123		;f3b8	20 83 	  . 
	jr nz,$-123		;f3ba	20 83 	  . 
	jr nz,$-123		;f3bc	20 83 	  . 
	jr nz,$-123		;f3be	20 83 	  . 
	jr nz,$-123		;f3c0	20 83 	  . 
	jr nz,$-123		;f3c2	20 83 	  . 
	jr nz,$-123		;f3c4	20 83 	  . 
	jr nz,$-123		;f3c6	20 83 	  . 
	jr nz,$-123		;f3c8	20 83 	  . 
	jr nz,$-123		;f3ca	20 83 	  . 
	jr nz,$-123		;f3cc	20 83 	  . 
	jr nz,$-123		;f3ce	20 83 	  . 
	jr nz,$-123		;f3d0	20 83 	  . 
	jr nz,$-123		;f3d2	20 83 	  . 
	jr nz,$-123		;f3d4	20 83 	  . 
	jr nz,$-123		;f3d6	20 83 	  . 
	jr nz,$-123		;f3d8	20 83 	  . 
	jr nz,$-123		;f3da	20 83 	  . 
	jr nz,$-123		;f3dc	20 83 	  . 
	jr nz,$-123		;f3de	20 83 	  . 
	jr nz,$-123		;f3e0	20 83 	  . 
	jr nz,$-123		;f3e2	20 83 	  . 
	jr nz,$-123		;f3e4	20 83 	  . 
	jr nz,$-123		;f3e6	20 83 	  . 
	jr nz,$-123		;f3e8	20 83 	  . 
	jr nz,$-123		;f3ea	20 83 	  . 
	jr nz,$-123		;f3ec	20 83 	  . 
	jr nz,$-123		;f3ee	20 83 	  . 
	jr nz,$-123		;f3f0	20 83 	  . 
	jr nz,$-123		;f3f2	20 83 	  . 
	jr nz,$-123		;f3f4	20 83 	  . 
	jr nz,$-123		;f3f6	20 83 	  . 
	jr nz,$-123		;f3f8	20 83 	  . 
	jr nz,$-123		;f3fa	20 83 	  . 
	jr nz,$-123		;f3fc	20 83 	  . 
	jr nz,$-123		;f3fe	20 83 	  . 
	jr nz,$-123		;f400	20 83 	  . 
	jr nz,$-123		;f402	20 83 	  . 
	jr nz,$-123		;f404	20 83 	  . 
	jr nz,$-123		;f406	20 83 	  . 
	jr nz,$-123		;f408	20 83 	  . 
	jr nz,$-123		;f40a	20 83 	  . 
	jr nz,$-123		;f40c	20 83 	  . 
	jr nz,$-123		;f40e	20 83 	  . 
	jr nz,$-123		;f410	20 83 	  . 
	jr nz,$-123		;f412	20 83 	  . 
	jr nz,$-123		;f414	20 83 	  . 
	jr nz,$-123		;f416	20 83 	  . 
	jr nz,$-123		;f418	20 83 	  . 
	jr nz,$-123		;f41a	20 83 	  . 
	jr nz,$-123		;f41c	20 83 	  . 
	jr nz,$-123		;f41e	20 83 	  . 
	jr nz,$-123		;f420	20 83 	  . 
	jr nz,$-123		;f422	20 83 	  . 
	jr nz,$-123		;f424	20 83 	  . 
	jr nz,$-123		;f426	20 83 	  . 
	jr nz,$-123		;f428	20 83 	  . 
	jr nz,$-123		;f42a	20 83 	  . 
	jr nz,$-123		;f42c	20 83 	  . 
	jr nz,$-123		;f42e	20 83 	  . 
	jr nz,$-123		;f430	20 83 	  . 
	jr nz,$-123		;f432	20 83 	  . 
	jr nz,$-123		;f434	20 83 	  . 
	jr nz,$-123		;f436	20 83 	  . 
	jr nz,$-123		;f438	20 83 	  . 
	jr nz,$-123		;f43a	20 83 	  . 
	jr nz,$-123		;f43c	20 83 	  . 
	jr nz,$-123		;f43e	20 83 	  . 
	jr nz,$-123		;f440	20 83 	  . 
	jr nz,$-123		;f442	20 83 	  . 
	jr nz,$-123		;f444	20 83 	  . 
	jr nz,$-123		;f446	20 83 	  . 
	jr nz,$-123		;f448	20 83 	  . 
	jr nz,$-123		;f44a	20 83 	  . 
	jr nz,$-123		;f44c	20 83 	  . 
	jr nz,$-123		;f44e	20 83 	  . 
	jr nz,$-123		;f450	20 83 	  . 
	jr nz,$-123		;f452	20 83 	  . 
	jr nz,$-123		;f454	20 83 	  . 
	jr nz,$-123		;f456	20 83 	  . 
	jr nz,$-123		;f458	20 83 	  . 
	jr nz,$-123		;f45a	20 83 	  . 
	jr nz,$-123		;f45c	20 83 	  . 
	jr nz,$-123		;f45e	20 83 	  . 
	jr nz,$-123		;f460	20 83 	  . 
	jr nz,$-123		;f462	20 83 	  . 
	jr nz,$-123		;f464	20 83 	  . 
	jr nz,$-123		;f466	20 83 	  . 
	jr nz,$-123		;f468	20 83 	  . 
	jr nz,$-123		;f46a	20 83 	  . 
	jr nz,$-123		;f46c	20 83 	  . 
	jr nz,$-123		;f46e	20 83 	  . 
	jr nz,$-123		;f470	20 83 	  . 
	jr nz,$-123		;f472	20 83 	  . 
	jr nz,$-123		;f474	20 83 	  . 
	jr nz,$-123		;f476	20 83 	  . 
	jr nz,$-123		;f478	20 83 	  . 
	jr nz,$-123		;f47a	20 83 	  . 
	jr nz,$-123		;f47c	20 83 	  . 
	jr nz,$-123		;f47e	20 83 	  . 
	jr nz,$-123		;f480	20 83 	  . 
	jr nz,$-123		;f482	20 83 	  . 
	jr nz,$-123		;f484	20 83 	  . 
	jr nz,$-123		;f486	20 83 	  . 
	jr nz,$-123		;f488	20 83 	  . 
	jr nz,$-123		;f48a	20 83 	  . 
	jr nz,$-123		;f48c	20 83 	  . 
	jr nz,$-123		;f48e	20 83 	  . 
	jr nz,$-123		;f490	20 83 	  . 
	jr nz,$-123		;f492	20 83 	  . 
	jr nz,$-123		;f494	20 83 	  . 
	jr nz,$-123		;f496	20 83 	  . 
	jr nz,$-123		;f498	20 83 	  . 
	jr nz,$-123		;f49a	20 83 	  . 
	jr nz,$-123		;f49c	20 83 	  . 
	jr nz,$-123		;f49e	20 83 	  . 
	jr nz,$-123		;f4a0	20 83 	  . 
	jr nz,$-123		;f4a2	20 83 	  . 
	jr nz,$-123		;f4a4	20 83 	  . 
	jr nz,$-123		;f4a6	20 83 	  . 
	jr nz,$-123		;f4a8	20 83 	  . 
	jr nz,$-123		;f4aa	20 83 	  . 
	jr nz,$-123		;f4ac	20 83 	  . 
	jr nz,$-123		;f4ae	20 83 	  . 
	jr nz,$-123		;f4b0	20 83 	  . 
	jr nz,$-123		;f4b2	20 83 	  . 
	jr nz,$-123		;f4b4	20 83 	  . 
	jr nz,$-123		;f4b6	20 83 	  . 
	jr nz,$-123		;f4b8	20 83 	  . 
	jr nz,$-123		;f4ba	20 83 	  . 
	jr nz,$-123		;f4bc	20 83 	  . 
	jr nz,$-123		;f4be	20 83 	  . 
	jr nz,$-123		;f4c0	20 83 	  . 
	jr nz,$-123		;f4c2	20 83 	  . 
	jr nz,$-123		;f4c4	20 83 	  . 
	jr nz,$-123		;f4c6	20 83 	  . 
	jr nz,$-123		;f4c8	20 83 	  . 
	jr nz,$-123		;f4ca	20 83 	  . 
	jr nz,$-123		;f4cc	20 83 	  . 
	jr nz,$-123		;f4ce	20 83 	  . 
	jr nz,$-123		;f4d0	20 83 	  . 
	jr nz,$-123		;f4d2	20 83 	  . 
	jr nz,$-123		;f4d4	20 83 	  . 
	jr nz,$-123		;f4d6	20 83 	  . 
	jr nz,$-123		;f4d8	20 83 	  . 
	jr nz,$-123		;f4da	20 83 	  . 
	jr nz,$-123		;f4dc	20 83 	  . 
	jr nz,$-123		;f4de	20 83 	  . 
	jr nz,$-123		;f4e0	20 83 	  . 
	jr nz,$-123		;f4e2	20 83 	  . 
	jr nz,$-123		;f4e4	20 83 	  . 
	jr nz,$-123		;f4e6	20 83 	  . 
	jr nz,$-123		;f4e8	20 83 	  . 
	jr nz,$-123		;f4ea	20 83 	  . 
	jr nz,$-123		;f4ec	20 83 	  . 
	jr nz,$-123		;f4ee	20 83 	  . 
	jr nz,$-123		;f4f0	20 83 	  . 
	jr nz,$-123		;f4f2	20 83 	  . 
	jr nz,$-123		;f4f4	20 83 	  . 
	jr nz,$-123		;f4f6	20 83 	  . 
	jr nz,$-123		;f4f8	20 83 	  . 
	jr nz,$-123		;f4fa	20 83 	  . 
	jr nz,$-123		;f4fc	20 83 	  . 
	jr nz,$-123		;f4fe	20 83 	  . 
	jr nz,$-123		;f500	20 83 	  . 
	jr nz,$-123		;f502	20 83 	  . 
	jr nz,$-123		;f504	20 83 	  . 
	jr nz,$-123		;f506	20 83 	  . 
	jr nz,$-123		;f508	20 83 	  . 
	jr nz,$-123		;f50a	20 83 	  . 
	jr nz,$-123		;f50c	20 83 	  . 
	jr nz,$-123		;f50e	20 83 	  . 
	jr nz,$-123		;f510	20 83 	  . 
	jr nz,$-123		;f512	20 83 	  . 
	jr nz,$-123		;f514	20 83 	  . 
	jr nz,$-123		;f516	20 83 	  . 
	jr nz,$-123		;f518	20 83 	  . 
	jr nz,$-123		;f51a	20 83 	  . 
	jr nz,$-123		;f51c	20 83 	  . 
	jr nz,$-123		;f51e	20 83 	  . 
	jr nz,$-123		;f520	20 83 	  . 
	jr nz,$-123		;f522	20 83 	  . 
	jr nz,$-123		;f524	20 83 	  . 
	jr nz,$-123		;f526	20 83 	  . 
	jr nz,$-123		;f528	20 83 	  . 
	jr nz,$-123		;f52a	20 83 	  . 
	jr nz,$-123		;f52c	20 83 	  . 
	jr nz,$-123		;f52e	20 83 	  . 
	jr nz,$-123		;f530	20 83 	  . 
	jr nz,$-123		;f532	20 83 	  . 
	jr nz,$-123		;f534	20 83 	  . 
	jr nz,$-123		;f536	20 83 	  . 
	jr nz,$-123		;f538	20 83 	  . 
	jr nz,$-123		;f53a	20 83 	  . 
	jr nz,$-123		;f53c	20 83 	  . 
	jr nz,$-123		;f53e	20 83 	  . 
	jr nz,$-123		;f540	20 83 	  . 
	jr nz,$-123		;f542	20 83 	  . 
	jr nz,$-123		;f544	20 83 	  . 
	jr nz,$-123		;f546	20 83 	  . 
	jr nz,$-123		;f548	20 83 	  . 
	jr nz,$-123		;f54a	20 83 	  . 
	jr nz,$-123		;f54c	20 83 	  . 
	jr nz,$-123		;f54e	20 83 	  . 
	jr nz,$-123		;f550	20 83 	  . 
	jr nz,$-123		;f552	20 83 	  . 
	jr nz,$-123		;f554	20 83 	  . 
	jr nz,$-123		;f556	20 83 	  . 
	jr nz,$-123		;f558	20 83 	  . 
	jr nz,$-123		;f55a	20 83 	  . 
	jr nz,$-123		;f55c	20 83 	  . 
	jr nz,$-123		;f55e	20 83 	  . 
	jr nz,$-123		;f560	20 83 	  . 
	jr nz,$-123		;f562	20 83 	  . 
	jr nz,$-123		;f564	20 83 	  . 
	jr nz,$-123		;f566	20 83 	  . 
	jr nz,$-123		;f568	20 83 	  . 
	jr nz,$-123		;f56a	20 83 	  . 
	jr nz,$-123		;f56c	20 83 	  . 
	jr nz,$-123		;f56e	20 83 	  . 
	jr nz,$-123		;f570	20 83 	  . 
	jr nz,$-123		;f572	20 83 	  . 
	jr nz,$-123		;f574	20 83 	  . 
	jr nz,$-123		;f576	20 83 	  . 
	jr nz,$-123		;f578	20 83 	  . 
	jr nz,$-123		;f57a	20 83 	  . 
	jr nz,$-123		;f57c	20 83 	  . 
	jr nz,$-123		;f57e	20 83 	  . 
	jr nz,$-123		;f580	20 83 	  . 
	jr nz,$-123		;f582	20 83 	  . 
	jr nz,$-123		;f584	20 83 	  . 
	jr nz,$-123		;f586	20 83 	  . 
	jr nz,$-123		;f588	20 83 	  . 
	jr nz,$-123		;f58a	20 83 	  . 
	jr nz,$-123		;f58c	20 83 	  . 
	jr nz,$-123		;f58e	20 83 	  . 
	jr nz,$-123		;f590	20 83 	  . 
	jr nz,$-123		;f592	20 83 	  . 
	jr nz,$-123		;f594	20 83 	  . 
	jr nz,$-123		;f596	20 83 	  . 
	jr nz,$-123		;f598	20 83 	  . 
	jr nz,$-123		;f59a	20 83 	  . 
	jr nz,$-123		;f59c	20 83 	  . 
	jr nz,$-123		;f59e	20 83 	  . 
	jr nz,$-123		;f5a0	20 83 	  . 
	jr nz,$-123		;f5a2	20 83 	  . 
	jr nz,$-123		;f5a4	20 83 	  . 
	jr nz,$-123		;f5a6	20 83 	  . 
	jr nz,$-123		;f5a8	20 83 	  . 
	jr nz,$-123		;f5aa	20 83 	  . 
	jr nz,$-123		;f5ac	20 83 	  . 
	jr nz,$-123		;f5ae	20 83 	  . 
	jr nz,$-123		;f5b0	20 83 	  . 
	jr nz,$-123		;f5b2	20 83 	  . 
	jr nz,$-123		;f5b4	20 83 	  . 
	jr nz,$-123		;f5b6	20 83 	  . 
	jr nz,$-123		;f5b8	20 83 	  . 
	jr nz,$-123		;f5ba	20 83 	  . 
	jr nz,$-123		;f5bc	20 83 	  . 
	jr nz,$-123		;f5be	20 83 	  . 
	jr nz,$-123		;f5c0	20 83 	  . 
	jr nz,$-123		;f5c2	20 83 	  . 
	jr nz,$-123		;f5c4	20 83 	  . 
	jr nz,$-123		;f5c6	20 83 	  . 
	jr nz,$-123		;f5c8	20 83 	  . 
	jr nz,$-123		;f5ca	20 83 	  . 
	jr nz,$-123		;f5cc	20 83 	  . 
	jr nz,$-123		;f5ce	20 83 	  . 
	jr nz,$-123		;f5d0	20 83 	  . 
	jr nz,$-123		;f5d2	20 83 	  . 
	jr nz,$-123		;f5d4	20 83 	  . 
	jr nz,$-123		;f5d6	20 83 	  . 
	jr nz,$-123		;f5d8	20 83 	  . 
	jr nz,$-123		;f5da	20 83 	  . 
	jr nz,$-123		;f5dc	20 83 	  . 
	jr nz,$-123		;f5de	20 83 	  . 
	jr nz,$-123		;f5e0	20 83 	  . 
	jr nz,$-123		;f5e2	20 83 	  . 
	jr nz,$-123		;f5e4	20 83 	  . 
	jr nz,$-123		;f5e6	20 83 	  . 
	jr nz,$-123		;f5e8	20 83 	  . 
	jr nz,$-123		;f5ea	20 83 	  . 
	jr nz,$-123		;f5ec	20 83 	  . 
	jr nz,$-123		;f5ee	20 83 	  . 
	jr nz,$-123		;f5f0	20 83 	  . 
	jr nz,$-123		;f5f2	20 83 	  . 
	jr nz,$-123		;f5f4	20 83 	  . 
	jr nz,$-123		;f5f6	20 83 	  . 
	jr nz,$-123		;f5f8	20 83 	  . 
	jr nz,$-123		;f5fa	20 83 	  . 
	jr nz,$-123		;f5fc	20 83 	  . 
	jr nz,$-123		;f5fe	20 83 	  . 
	jr nz,$-123		;f600	20 83 	  . 
	jr nz,$-123		;f602	20 83 	  . 
	jr nz,$-123		;f604	20 83 	  . 
	jr nz,$-123		;f606	20 83 	  . 
	jr nz,$-123		;f608	20 83 	  . 
	jr nz,$-123		;f60a	20 83 	  . 
	jr nz,$-123		;f60c	20 83 	  . 
	jr nz,$-123		;f60e	20 83 	  . 
	jr nz,$-123		;f610	20 83 	  . 
	jr nz,$-123		;f612	20 83 	  . 
	jr nz,$-123		;f614	20 83 	  . 
	jr nz,$-123		;f616	20 83 	  . 
	jr nz,$-123		;f618	20 83 	  . 
	jr nz,$-123		;f61a	20 83 	  . 
	jr nz,$-123		;f61c	20 83 	  . 
	jr nz,$-123		;f61e	20 83 	  . 
	jr nz,$-123		;f620	20 83 	  . 
	jr nz,$-123		;f622	20 83 	  . 
	jr nz,$-123		;f624	20 83 	  . 
	jr nz,$-123		;f626	20 83 	  . 
	jr nz,$-123		;f628	20 83 	  . 
	jr nz,$-123		;f62a	20 83 	  . 
	jr nz,$-123		;f62c	20 83 	  . 
	jr nz,$-123		;f62e	20 83 	  . 
	jr nz,$-123		;f630	20 83 	  . 
	jr nz,$-123		;f632	20 83 	  . 
	jr nz,$-123		;f634	20 83 	  . 
	jr nz,$-123		;f636	20 83 	  . 
	jr nz,$-123		;f638	20 83 	  . 
	jr nz,$-123		;f63a	20 83 	  . 
	jr nz,$-123		;f63c	20 83 	  . 
	jr nz,$-123		;f63e	20 83 	  . 
	jr nz,$-123		;f640	20 83 	  . 
	jr nz,$-123		;f642	20 83 	  . 
	jr nz,$-123		;f644	20 83 	  . 
	jr nz,$-123		;f646	20 83 	  . 
	jr nz,$-123		;f648	20 83 	  . 
	jr nz,$-123		;f64a	20 83 	  . 
	jr nz,$-123		;f64c	20 83 	  . 
	jr nz,$-123		;f64e	20 83 	  . 
	jr nz,$-123		;f650	20 83 	  . 
	jr nz,$-123		;f652	20 83 	  . 
	jr nz,$-123		;f654	20 83 	  . 
	jr nz,$-123		;f656	20 83 	  . 
	jr nz,$-123		;f658	20 83 	  . 
	jr nz,$-123		;f65a	20 83 	  . 
	jr nz,$-123		;f65c	20 83 	  . 
	jr nz,$-123		;f65e	20 83 	  . 
	jr nz,$-123		;f660	20 83 	  . 
	jr nz,$-123		;f662	20 83 	  . 
	jr nz,$-123		;f664	20 83 	  . 
	jr nz,$-123		;f666	20 83 	  . 
	jr nz,$-123		;f668	20 83 	  . 
	jr nz,$-123		;f66a	20 83 	  . 
	jr nz,$-123		;f66c	20 83 	  . 
	jr nz,$-123		;f66e	20 83 	  . 
	jr nz,$-123		;f670	20 83 	  . 
	jr nz,$-123		;f672	20 83 	  . 
	jr nz,$-123		;f674	20 83 	  . 
	jr nz,$-123		;f676	20 83 	  . 
	jr nz,$-123		;f678	20 83 	  . 
	jr nz,$-123		;f67a	20 83 	  . 
	jr nz,$-123		;f67c	20 83 	  . 
	jr nz,$-123		;f67e	20 83 	  . 
	jr nz,$-123		;f680	20 83 	  . 
	jr nz,$-123		;f682	20 83 	  . 
	jr nz,$-123		;f684	20 83 	  . 
	jr nz,$-123		;f686	20 83 	  . 
	jr nz,$-123		;f688	20 83 	  . 
	jr nz,$-123		;f68a	20 83 	  . 
	jr nz,$-123		;f68c	20 83 	  . 
	jr nz,$-123		;f68e	20 83 	  . 
	jr nz,$-123		;f690	20 83 	  . 
	jr nz,$-123		;f692	20 83 	  . 
	jr nz,$-123		;f694	20 83 	  . 
	jr nz,$-123		;f696	20 83 	  . 
	jr nz,$-123		;f698	20 83 	  . 
	jr nz,$-123		;f69a	20 83 	  . 
	jr nz,$-123		;f69c	20 83 	  . 
	jr nz,$-123		;f69e	20 83 	  . 
	jr nz,$-123		;f6a0	20 83 	  . 
	jr nz,$-123		;f6a2	20 83 	  . 
	jr nz,$-123		;f6a4	20 83 	  . 
	jr nz,$-123		;f6a6	20 83 	  . 
	jr nz,$-123		;f6a8	20 83 	  . 
	jr nz,$-123		;f6aa	20 83 	  . 
	jr nz,$-123		;f6ac	20 83 	  . 
	jr nz,$-123		;f6ae	20 83 	  . 
	jr nz,$-123		;f6b0	20 83 	  . 
	jr nz,$-123		;f6b2	20 83 	  . 
	jr nz,$-123		;f6b4	20 83 	  . 
	jr nz,$-123		;f6b6	20 83 	  . 
	jr nz,$-123		;f6b8	20 83 	  . 
	jr nz,$-123		;f6ba	20 83 	  . 
	jr nz,$-123		;f6bc	20 83 	  . 
	jr nz,$-123		;f6be	20 83 	  . 
	jr nz,$-123		;f6c0	20 83 	  . 
	jr nz,$-123		;f6c2	20 83 	  . 
	jr nz,$-123		;f6c4	20 83 	  . 
	jr nz,$-123		;f6c6	20 83 	  . 
	jr nz,$-123		;f6c8	20 83 	  . 
	jr nz,$-123		;f6ca	20 83 	  . 
	jr nz,$-123		;f6cc	20 83 	  . 
	jr nz,$-123		;f6ce	20 83 	  . 
	jr nz,$-123		;f6d0	20 83 	  . 
	jr nz,$-123		;f6d2	20 83 	  . 
	jr nz,$-123		;f6d4	20 83 	  . 
	jr nz,$-123		;f6d6	20 83 	  . 
	jr nz,$-123		;f6d8	20 83 	  . 
	jr nz,$-123		;f6da	20 83 	  . 
	jr nz,$-123		;f6dc	20 83 	  . 
	jr nz,$-123		;f6de	20 83 	  . 
	jr nz,$-123		;f6e0	20 83 	  . 
	jr nz,$-123		;f6e2	20 83 	  . 
	jr nz,$-123		;f6e4	20 83 	  . 
	jr nz,$-123		;f6e6	20 83 	  . 
	jr nz,$-123		;f6e8	20 83 	  . 
	jr nz,$-123		;f6ea	20 83 	  . 
	jr nz,$-123		;f6ec	20 83 	  . 
	jr nz,$-123		;f6ee	20 83 	  . 
	jr nz,$-123		;f6f0	20 83 	  . 
	jr nz,$-123		;f6f2	20 83 	  . 
	jr nz,$-123		;f6f4	20 83 	  . 
	jr nz,$-123		;f6f6	20 83 	  . 
	jr nz,$-123		;f6f8	20 83 	  . 
	jr nz,$-123		;f6fa	20 83 	  . 
	jr nz,$-123		;f6fc	20 83 	  . 
	jr nz,$-123		;f6fe	20 83 	  . 
	jr nz,$-123		;f700	20 83 	  . 
	jr nz,$-123		;f702	20 83 	  . 
	jr nz,$-123		;f704	20 83 	  . 
	jr nz,$-123		;f706	20 83 	  . 
	jr nz,$-123		;f708	20 83 	  . 
	jr nz,$-123		;f70a	20 83 	  . 
	jr nz,$-123		;f70c	20 83 	  . 
	jr nz,$-123		;f70e	20 83 	  . 
	jr nz,$-123		;f710	20 83 	  . 
	jr nz,$-123		;f712	20 83 	  . 
	jr nz,$-123		;f714	20 83 	  . 
	jr nz,$-123		;f716	20 83 	  . 
	jr nz,$-123		;f718	20 83 	  . 
	jr nz,$-123		;f71a	20 83 	  . 
	jr nz,$-123		;f71c	20 83 	  . 
	jr nz,$-123		;f71e	20 83 	  . 
	jr nz,$-123		;f720	20 83 	  . 
	jr nz,$-123		;f722	20 83 	  . 
	jr nz,$-123		;f724	20 83 	  . 
	jr nz,$-123		;f726	20 83 	  . 
	jr nz,$-123		;f728	20 83 	  . 
	jr nz,$-123		;f72a	20 83 	  . 
	jr nz,$-123		;f72c	20 83 	  . 
	jr nz,$-123		;f72e	20 83 	  . 
	jr nz,$-123		;f730	20 83 	  . 
	jr nz,$-123		;f732	20 83 	  . 
	jr nz,$-123		;f734	20 83 	  . 
	jr nz,$-123		;f736	20 83 	  . 
	jr nz,$-123		;f738	20 83 	  . 
	jr nz,$-123		;f73a	20 83 	  . 
	jr nz,$-123		;f73c	20 83 	  . 
	jr nz,$-123		;f73e	20 83 	  . 
	jr nz,$-123		;f740	20 83 	  . 
	jr nz,$-123		;f742	20 83 	  . 
	jr nz,$-123		;f744	20 83 	  . 
	jr nz,$-123		;f746	20 83 	  . 
	jr nz,$-123		;f748	20 83 	  . 
	jr nz,$-123		;f74a	20 83 	  . 
	jr nz,$-123		;f74c	20 83 	  . 
	jr nz,$-123		;f74e	20 83 	  . 
	jr nz,$-123		;f750	20 83 	  . 
	jr nz,$-123		;f752	20 83 	  . 
	jr nz,$-123		;f754	20 83 	  . 
	jr nz,$-123		;f756	20 83 	  . 
	jr nz,$-123		;f758	20 83 	  . 
	jr nz,$-123		;f75a	20 83 	  . 
	jr nz,$-123		;f75c	20 83 	  . 
	jr nz,$-123		;f75e	20 83 	  . 
	jr nz,$-123		;f760	20 83 	  . 
	jr nz,$-123		;f762	20 83 	  . 
	jr nz,$-123		;f764	20 83 	  . 
	jr nz,$-123		;f766	20 83 	  . 
	jr nz,$-123		;f768	20 83 	  . 
	jr nz,$-123		;f76a	20 83 	  . 
	jr nz,$-123		;f76c	20 83 	  . 
	jr nz,$-123		;f76e	20 83 	  . 
	jr nz,$-123		;f770	20 83 	  . 
	jr nz,$-123		;f772	20 83 	  . 
	jr nz,$-123		;f774	20 83 	  . 
	jr nz,$-123		;f776	20 83 	  . 
	jr nz,$-123		;f778	20 83 	  . 
	jr nz,$-123		;f77a	20 83 	  . 
	jr nz,$-123		;f77c	20 83 	  . 
	jr nz,$-123		;f77e	20 83 	  . 
	jr nz,$-123		;f780	20 83 	  . 
	jr nz,$-123		;f782	20 83 	  . 
	jr nz,$-123		;f784	20 83 	  . 
	jr nz,$-123		;f786	20 83 	  . 
	jr nz,$-123		;f788	20 83 	  . 
	jr nz,$-123		;f78a	20 83 	  . 
	jr nz,$-123		;f78c	20 83 	  . 
	jr nz,$-123		;f78e	20 83 	  . 
	jr nz,$-123		;f790	20 83 	  . 
	jr nz,$-123		;f792	20 83 	  . 
	jr nz,$-123		;f794	20 83 	  . 
	jr nz,$-123		;f796	20 83 	  . 
	jr nz,$-123		;f798	20 83 	  . 
	jr nz,$-123		;f79a	20 83 	  . 
	jr nz,$-123		;f79c	20 83 	  . 
	jr nz,$-123		;f79e	20 83 	  . 
	jr nz,$-123		;f7a0	20 83 	  . 
	jr nz,$-123		;f7a2	20 83 	  . 
	jr nz,$-123		;f7a4	20 83 	  . 
	jr nz,$-123		;f7a6	20 83 	  . 
	jr nz,$-123		;f7a8	20 83 	  . 
	jr nz,$-123		;f7aa	20 83 	  . 
	jr nz,$-123		;f7ac	20 83 	  . 
	jr nz,$-123		;f7ae	20 83 	  . 
	jr nz,$-123		;f7b0	20 83 	  . 
	jr nz,$-123		;f7b2	20 83 	  . 
	jr nz,$-123		;f7b4	20 83 	  . 
	jr nz,$-123		;f7b6	20 83 	  . 
	jr nz,$-123		;f7b8	20 83 	  . 
	jr nz,$-123		;f7ba	20 83 	  . 
	jr nz,$-123		;f7bc	20 83 	  . 
	jr nz,$-123		;f7be	20 83 	  . 
	jr nz,$-123		;f7c0	20 83 	  . 
	jr nz,$-123		;f7c2	20 83 	  . 
	jr nz,$-123		;f7c4	20 83 	  . 
	jr nz,$-123		;f7c6	20 83 	  . 
	jr nz,$-123		;f7c8	20 83 	  . 
	jr nz,$-123		;f7ca	20 83 	  . 
	jr nz,$-123		;f7cc	20 83 	  . 
	jr nz,$-123		;f7ce	20 83 	  . 
	jr nz,$-123		;f7d0	20 83 	  . 
	jr nz,$-123		;f7d2	20 83 	  . 
	jr nz,$-123		;f7d4	20 83 	  . 
	jr nz,$-123		;f7d6	20 83 	  . 
	jr nz,$-123		;f7d8	20 83 	  . 
	jr nz,$-123		;f7da	20 83 	  . 
	jr nz,$-123		;f7dc	20 83 	  . 
	jr nz,$-123		;f7de	20 83 	  . 
	jr nz,$-123		;f7e0	20 83 	  . 
	jr nz,$-123		;f7e2	20 83 	  . 
	jr nz,$-123		;f7e4	20 83 	  . 
	jr nz,$-123		;f7e6	20 83 	  . 
	jr nz,$-123		;f7e8	20 83 	  . 
	jr nz,$-123		;f7ea	20 83 	  . 
	jr nz,$-123		;f7ec	20 83 	  . 
	jr nz,$-123		;f7ee	20 83 	  . 
	jr nz,$-123		;f7f0	20 83 	  . 
	jr nz,$-123		;f7f2	20 83 	  . 
	jr nz,$-123		;f7f4	20 83 	  . 
	jr nz,$-123		;f7f6	20 83 	  . 
	jr nz,$-123		;f7f8	20 83 	  . 
	jr nz,$-123		;f7fa	20 83 	  . 
	jr nz,$-123		;f7fc	20 83 	  . 
	jr nz,$-123		;f7fe	20 83 	  . 
	jr nz,$-123		;f800	20 83 	  . 
	jr nz,$-123		;f802	20 83 	  . 
	jr nz,$-123		;f804	20 83 	  . 
	jr nz,$-123		;f806	20 83 	  . 
	jr nz,$-123		;f808	20 83 	  . 
	jr nz,$-123		;f80a	20 83 	  . 
	jr nz,$-123		;f80c	20 83 	  . 
	jr nz,$-123		;f80e	20 83 	  . 
	jr nz,$-123		;f810	20 83 	  . 
	jr nz,$-123		;f812	20 83 	  . 
	jr nz,$-123		;f814	20 83 	  . 
	jr nz,$-123		;f816	20 83 	  . 
	jr nz,$-123		;f818	20 83 	  . 
	jr nz,$-123		;f81a	20 83 	  . 
	jr nz,$-123		;f81c	20 83 	  . 
	jr nz,$-123		;f81e	20 83 	  . 
	jr nz,$-123		;f820	20 83 	  . 
	jr nz,$-123		;f822	20 83 	  . 
	jr nz,$-123		;f824	20 83 	  . 
	jr nz,$-123		;f826	20 83 	  . 
	jr nz,$-123		;f828	20 83 	  . 
	jr nz,$-123		;f82a	20 83 	  . 
	jr nz,$-123		;f82c	20 83 	  . 
	jr nz,$-123		;f82e	20 83 	  . 
	jr nz,$-123		;f830	20 83 	  . 
	jr nz,$-123		;f832	20 83 	  . 
	jr nz,$-123		;f834	20 83 	  . 
	jr nz,$-123		;f836	20 83 	  . 
	jr nz,$-123		;f838	20 83 	  . 
	jr nz,$-123		;f83a	20 83 	  . 
	jr nz,$-123		;f83c	20 83 	  . 
	jr nz,$-123		;f83e	20 83 	  . 
	jr nz,$-123		;f840	20 83 	  . 
	jr nz,$-123		;f842	20 83 	  . 
	jr nz,$-123		;f844	20 83 	  . 
	jr nz,$-123		;f846	20 83 	  . 
	jr nz,$-123		;f848	20 83 	  . 
	jr nz,$-123		;f84a	20 83 	  . 
	jr nz,$-123		;f84c	20 83 	  . 
	jr nz,$-123		;f84e	20 83 	  . 
	jr nz,$-123		;f850	20 83 	  . 
	jr nz,$-123		;f852	20 83 	  . 
	jr nz,$-123		;f854	20 83 	  . 
	jr nz,$-123		;f856	20 83 	  . 
	jr nz,$-123		;f858	20 83 	  . 
	jr nz,$-123		;f85a	20 83 	  . 
	jr nz,$-123		;f85c	20 83 	  . 
	jr nz,$-123		;f85e	20 83 	  . 
	jr nz,$-123		;f860	20 83 	  . 
	jr nz,$-123		;f862	20 83 	  . 
	jr nz,$-123		;f864	20 83 	  . 
	jr nz,$-123		;f866	20 83 	  . 
	jr nz,$-123		;f868	20 83 	  . 
	jr nz,$-123		;f86a	20 83 	  . 
	jr nz,$-123		;f86c	20 83 	  . 
	jr nz,$-123		;f86e	20 83 	  . 
	jr nz,$-123		;f870	20 83 	  . 
	jr nz,$-123		;f872	20 83 	  . 
	jr nz,$-123		;f874	20 83 	  . 
	jr nz,$-123		;f876	20 83 	  . 
	jr nz,$-123		;f878	20 83 	  . 
	jr nz,$-123		;f87a	20 83 	  . 
	jr nz,$-123		;f87c	20 83 	  . 
	jr nz,$-123		;f87e	20 83 	  . 
	jr nz,$-123		;f880	20 83 	  . 
	jr nz,$-123		;f882	20 83 	  . 
	jr nz,$-123		;f884	20 83 	  . 
	jr nz,$-123		;f886	20 83 	  . 
	jr nz,$-123		;f888	20 83 	  . 
	jr nz,$-123		;f88a	20 83 	  . 
	jr nz,$-123		;f88c	20 83 	  . 
	jr nz,$-123		;f88e	20 83 	  . 
	jr nz,$-123		;f890	20 83 	  . 
	jr nz,$-123		;f892	20 83 	  . 
	jr nz,$-123		;f894	20 83 	  . 
	jr nz,$-123		;f896	20 83 	  . 
	jr nz,$-123		;f898	20 83 	  . 
	jr nz,$-123		;f89a	20 83 	  . 
	jr nz,$-123		;f89c	20 83 	  . 
	jr nz,$-123		;f89e	20 83 	  . 
	jr nz,$-123		;f8a0	20 83 	  . 
	jr nz,$-123		;f8a2	20 83 	  . 
	jr nz,$-123		;f8a4	20 83 	  . 
	jr nz,$-123		;f8a6	20 83 	  . 
	jr nz,$-123		;f8a8	20 83 	  . 
	jr nz,$-123		;f8aa	20 83 	  . 
	jr nz,$-123		;f8ac	20 83 	  . 
	jr nz,$-123		;f8ae	20 83 	  . 
	jr nz,$-123		;f8b0	20 83 	  . 
	jr nz,$-123		;f8b2	20 83 	  . 
	jr nz,$-123		;f8b4	20 83 	  . 
	jr nz,$-123		;f8b6	20 83 	  . 
	jr nz,$-123		;f8b8	20 83 	  . 
	jr nz,$-123		;f8ba	20 83 	  . 
	jr nz,$-123		;f8bc	20 83 	  . 
	jr nz,$-123		;f8be	20 83 	  . 
	jr nz,$-123		;f8c0	20 83 	  . 
	jr nz,$-123		;f8c2	20 83 	  . 
	jr nz,$-123		;f8c4	20 83 	  . 
	jr nz,$-123		;f8c6	20 83 	  . 
	jr nz,$-123		;f8c8	20 83 	  . 
	jr nz,$-123		;f8ca	20 83 	  . 
	jr nz,$-123		;f8cc	20 83 	  . 
	jr nz,$-123		;f8ce	20 83 	  . 
	jr nz,$-123		;f8d0	20 83 	  . 
	jr nz,$-123		;f8d2	20 83 	  . 
	jr nz,$-123		;f8d4	20 83 	  . 
	jr nz,$-123		;f8d6	20 83 	  . 
	jr nz,$-123		;f8d8	20 83 	  . 
	jr nz,$-123		;f8da	20 83 	  . 
	jr nz,$-123		;f8dc	20 83 	  . 
	jr nz,$-123		;f8de	20 83 	  . 
	jr nz,$-123		;f8e0	20 83 	  . 
	jr nz,$-123		;f8e2	20 83 	  . 
	jr nz,$-123		;f8e4	20 83 	  . 
	jr nz,$-123		;f8e6	20 83 	  . 
	jr nz,$-123		;f8e8	20 83 	  . 
	jr nz,$-123		;f8ea	20 83 	  . 
	jr nz,$-123		;f8ec	20 83 	  . 
	jr nz,$-123		;f8ee	20 83 	  . 
	jr nz,$-123		;f8f0	20 83 	  . 
	jr nz,$-123		;f8f2	20 83 	  . 
	jr nz,$-123		;f8f4	20 83 	  . 
	jr nz,$-123		;f8f6	20 83 	  . 
	jr nz,$-123		;f8f8	20 83 	  . 
	jr nz,$-123		;f8fa	20 83 	  . 
	jr nz,$-123		;f8fc	20 83 	  . 
	jr nz,$-123		;f8fe	20 83 	  . 
