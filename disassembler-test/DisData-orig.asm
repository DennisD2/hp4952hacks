kDisSubsL:	.EQU 13	;Last operand substitution string
kDisSubNN:	.EQU 4	;Operand substitution string 'nn'
kDisSubC:	.EQU 10	;Operand substitution string 'c'
kDisSubCC:	.EQU 11	;Operand substitution string 'cc'
kDisBracHL:	.EQU 21	;Bracketed HL
kDisHL:	.EQU 24	;HL
kDisFlowF:	.EQU 27	;First flow control instructions
kDisFlowL:	.EQU 34	;Last flow control instructions
kDisJR:	.EQU 27	;Operation string 'JR'
kDisDJNZ:	.EQU 28	;Operation string 'DJNZ'
kDisRST:	.EQU 29	;Operation string 'RST'
kDisJP:	.EQU 30	;Operation string 'JP'
kDisCALL:	.EQU 31	;Operation string 'CALL'
kDisRET:	.EQU 32	;Operation string 'RET'
kDisOpMask:	.EQU &3F	;Operand 1 mask to exclude pre-code bits
kDisMskC:	.EQU &18	;Condition bit mask for Operand 1 = C
kDisMskCC:	.EQU &38	;Condition bit mask for Operand 1 = CC
kDisMskRST:	.EQU &38	;Restart address bits

DisString:
	.DB  &80                              	;String &01 =
	.DB  &80+'n'                          	;String &02 = n
	.DB  &80+'(',"n)"                     	;String &03 = (n)
	.DB  &80+'n',"n"                      	;String &04 = nn
	.DB  &80+'(',"nn)"                    	;String &05 = (nn)
	.DB  &80+'r'                          	;String &06 = r
	.DB  &80+'r',"2"                      	;String &07 = r2
	.DB  &80+'d',"d"                      	;String &08 = dd
	.DB  &80+'q',"q"                      	;String &09 = qq
	.DB  &80+'c'                          	;String &0A = c
	.DB  &80+'c',"c"                      	;String &0B = cc
	.DB  &80+'t'                          	;String &0C = t
	.DB  &80+'b'                          	;String &0D = b
	.DB  &80+'B',"CDEHL-A"                	;String &0E = BCDEHL-A
	.DB  &80+'B',"CDE**SP"                	;String &0F = BCDE**SP
	.DB  &80+'B',"CDE**AF"                	;String &10 = BCDE**AF
	.DB  &80+'N',"ZZ.NCC."                	;String &11 = NZZ.NCC.
	.DB  &80+'N',"ZZ.NCC.POPEP.M."        	;String &12 = NZZ.NCC.POPEP.M.
	.DB  &80+'0',"008101820283038"        	;String &13 = 0008101820283038
	.DB  &80+'0',"1234567"                	;String &14 = 01234567
	.DB  &80+'(',"HL)"                    	;String &15 = (HL)
	.DB  &80+'(',"IX+"                    	;String &16 = (IX+
	.DB  &80+'(',"IY+"                    	;String &17 = (IY+
	.DB  &80+'H',"L"                      	;String &18 = HL
	.DB  &80+'I',"X"                      	;String &19 = IX
	.DB  &80+'I',"Y"                      	;String &1A = IY
	.DB  &80+'J',"R"                      	;String &1B = JR
	.DB  &80+'D',"JNZ"                    	;String &1C = DJNZ
	.DB  &80+'R',"ST"                     	;String &1D = RST
	.DB  &80+'J',"P"                      	;String &1E = JP
	.DB  &80+'C',"ALL"                    	;String &1F = CALL
	.DB  &80+'R',"ET"                     	;String &20 = RET
	.DB  &80+'R',"ETI"                    	;String &21 = RETI
	.DB  &80+'R',"ETN"                    	;String &22 = RETN
	.DB  &80+'A'                          	;String &23 = A
	.DB  &80+'(',"SP)"                    	;String &24 = (SP)
	.DB  &80+'A',"F"                      	;String &25 = AF
	.DB  &80+'D',"E"                      	;String &26 = DE
	.DB  &80+'0'                          	;String &27 = 0
	.DB  &80+'1'                          	;String &28 = 1
	.DB  &80+'2'                          	;String &29 = 2
	.DB  &80+'(',"BC)"                    	;String &2A = (BC)
	.DB  &80+'(',"DE)"                    	;String &2B = (DE)
	.DB  &80+'S',"P"                      	;String &2C = SP
	.DB  &80+'I'                          	;String &2D = I
	.DB  &80+'R'                          	;String &2E = R
	.DB  &80+'(',"C)"                     	;String &2F = (C)
	.DB  &80+'A',"F'"                     	;String &30 = AF'
	.DB  &80+'A',"DC"                     	;String &31 = ADC
	.DB  &80+'A',"DD"                     	;String &32 = ADD
	.DB  &80+'A',"ND"                     	;String &33 = AND
	.DB  &80+'B',"IT"                     	;String &34 = BIT
	.DB  &80+'C',"CF"                     	;String &35 = CCF
	.DB  &80+'C',"P"                      	;String &36 = CP
	.DB  &80+'C',"PD"                     	;String &37 = CPD
	.DB  &80+'C',"PDR"                    	;String &38 = CPDR
	.DB  &80+'C',"PI"                     	;String &39 = CPI
	.DB  &80+'C',"PIR"                    	;String &3A = CPIR
	.DB  &80+'C',"PL"                     	;String &3B = CPL
	.DB  &80+'D',"AA"                     	;String &3C = DAA
	.DB  &80+'D',"EC"                     	;String &3D = DEC
	.DB  &80+'D',"I"                      	;String &3E = DI
	.DB  &80+'E',"I"                      	;String &3F = EI
	.DB  &80+'E',"X"                      	;String &40 = EX
	.DB  &80+'E',"XX"                     	;String &41 = EXX
	.DB  &80+'H',"ALT"                    	;String &42 = HALT
	.DB  &80+'I',"M"                      	;String &43 = IM
	.DB  &80+'I',"N"                      	;String &44 = IN
	.DB  &80+'I',"NC"                     	;String &45 = INC
	.DB  &80+'I',"ND"                     	;String &46 = IND
	.DB  &80+'I',"NDR"                    	;String &47 = INDR
	.DB  &80+'I',"NI"                     	;String &48 = INI
	.DB  &80+'I',"NIR"                    	;String &49 = INIR
	.DB  &80+'L',"D"                      	;String &4A = LD
	.DB  &80+'L',"DD"                     	;String &4B = LDD
	.DB  &80+'L',"DDR"                    	;String &4C = LDDR
	.DB  &80+'L',"DI"                     	;String &4D = LDI
	.DB  &80+'L',"DIR"                    	;String &4E = LDIR
	.DB  &80+'N',"EG"                     	;String &4F = NEG
	.DB  &80+'N',"OP"                     	;String &50 = NOP
	.DB  &80+'O',"R"                      	;String &51 = OR
	.DB  &80+'O',"TDR"                    	;String &52 = OTDR
	.DB  &80+'O',"TIR"                    	;String &53 = OTIR
	.DB  &80+'O',"UT"                     	;String &54 = OUT
	.DB  &80+'O',"UTD"                    	;String &55 = OUTD
	.DB  &80+'O',"UTI"                    	;String &56 = OUTI
	.DB  &80+'P',"OP"                     	;String &57 = POP
	.DB  &80+'P',"USH"                    	;String &58 = PUSH
	.DB  &80+'R',"ES"                     	;String &59 = RES
	.DB  &80+'R',"L"                      	;String &5A = RL
	.DB  &80+'R',"LA"                     	;String &5B = RLA
	.DB  &80+'R',"LC"                     	;String &5C = RLC
	.DB  &80+'R',"LCA"                    	;String &5D = RLCA
	.DB  &80+'R',"LD"                     	;String &5E = RLD
	.DB  &80+'R',"R"                      	;String &5F = RR
	.DB  &80+'R',"RA"                     	;String &60 = RRA
	.DB  &80+'R',"RC"                     	;String &61 = RRC
	.DB  &80+'R',"RCA"                    	;String &62 = RRCA
	.DB  &80+'R',"RD"                     	;String &63 = RRD
	.DB  &80+'S',"BC"                     	;String &64 = SBC
	.DB  &80+'S',"CF"                     	;String &65 = SCF
	.DB  &80+'S',"ET"                     	;String &66 = SET
	.DB  &80+'S',"LA"                     	;String &67 = SLA
	.DB  &80+'S',"LL"                     	;String &68 = SLL
	.DB  &80+'S',"RA"                     	;String &69 = SRA
	.DB  &80+'S',"RL"                     	;String &6A = SRL
	.DB  &80+'S',"UB"                     	;String &6B = SUB
	.DB  &80+'X',"OR"                     	;String &6C = XOR
	.DB  &80+'?',"???"                    	;String &6D = ????
	.DB  &80

DisInst:
	.DB  &88,&F8,&31,&23,&07 ;Opcode: &88 - ADC  A   ,r2
	.DB  &CE,&FF,&31,&23,&02 ;Opcode: &CE - ADC  A   ,n
	.DB  &4A,&CF,&31,&D8,&08 ;Opcode: &4A - ADC  HL  ,dd
	.DB  &80,&F8,&32,&23,&07 ;Opcode: &80 - ADD  A   ,r2
	.DB  &C6,&FF,&32,&23,&02 ;Opcode: &C6 - ADD  A   ,n
	.DB  &09,&CF,&32,&18,&08 ;Opcode: &09 - ADD  HL  ,dd
	.DB  &A0,&F8,&33,&07,&01 ;Opcode: &A0 - AND  r2  ,
	.DB  &E6,&FF,&33,&02,&01 ;Opcode: &E6 - AND  n   ,
	.DB  &40,&C0,&34,&8D,&07 ;Opcode: &40 - BIT  b   ,r2
	.DB  &C4,&C7,&1F,&0B,&04 ;Opcode: &C4 - CALL cc  ,nn
	.DB  &CD,&FF,&1F,&04,&01 ;Opcode: &CD - CALL nn  ,
	.DB  &3F,&FF,&35,&01,&01 ;Opcode: &3F - CCF      ,
	.DB  &B8,&F8,&36,&07,&01 ;Opcode: &B8 - CP   r2  ,
	.DB  &FE,&FF,&36,&02,&01 ;Opcode: &FE - CP   n   ,
	.DB  &A9,&FF,&37,&C1,&01 ;Opcode: &A9 - CPD      ,
	.DB  &B9,&FF,&38,&C1,&01 ;Opcode: &B9 - CPDR     ,
	.DB  &A1,&FF,&39,&C1,&01 ;Opcode: &A1 - CPI      ,
	.DB  &B1,&FF,&3A,&C1,&01 ;Opcode: &B1 - CPIR     ,
	.DB  &2F,&FF,&3B,&01,&01 ;Opcode: &2F - CPL      ,
	.DB  &27,&FF,&3C,&01,&01 ;Opcode: &27 - DAA      ,
	.DB  &0B,&CF,&3D,&08,&01 ;Opcode: &0B - DEC  dd  ,
	.DB  &05,&C7,&3D,&06,&01 ;Opcode: &05 - DEC  r   ,
	.DB  &F3,&FF,&3E,&01,&01 ;Opcode: &F3 - DI       ,
	.DB  &10,&FF,&1C,&02,&01 ;Opcode: &10 - DJNZ n   ,
	.DB  &FB,&FF,&3F,&01,&01 ;Opcode: &FB - EI       ,
	.DB  &E3,&FF,&40,&24,&18 ;Opcode: &E3 - EX   (SP),HL
	.DB  &08,&FF,&40,&25,&30 ;Opcode: &08 - EX   AF  ,AF'
	.DB  &EB,&FF,&40,&26,&18 ;Opcode: &EB - EX   DE  ,HL
	.DB  &D9,&FF,&41,&01,&01 ;Opcode: &D9 - EXX      ,
	.DB  &76,&FF,&42,&01,&01 ;Opcode: &76 - HALT     ,
	.DB  &46,&FF,&43,&E7,&01 ;Opcode: &46 - IM   0   ,
	.DB  &56,&FF,&43,&E8,&01 ;Opcode: &56 - IM   1   ,
	.DB  &5E,&FF,&43,&E9,&01 ;Opcode: &5E - IM   2   ,
	.DB  &40,&C7,&44,&C6,&2F ;Opcode: &40 - IN   r   ,(C)
	.DB  &DB,&FF,&44,&23,&03 ;Opcode: &DB - IN   A   ,(n)
	.DB  &03,&CF,&45,&08,&01 ;Opcode: &03 - INC  dd  ,
	.DB  &04,&C7,&45,&06,&01 ;Opcode: &04 - INC  r   ,
	.DB  &AA,&FF,&46,&C1,&01 ;Opcode: &AA - IND      ,
	.DB  &BA,&FF,&47,&C1,&01 ;Opcode: &BA - INDR     ,
	.DB  &A2,&FF,&48,&C1,&01 ;Opcode: &A2 - INI      ,
	.DB  &B2,&FF,&49,&C1,&01 ;Opcode: &B2 - INIR     ,
	.DB  &E9,&FF,&1E,&15,&01 ;Opcode: &E9 - JP   (HL),
	.DB  &C2,&C7,&1E,&0B,&04 ;Opcode: &C2 - JP   cc  ,nn
	.DB  &C3,&FF,&1E,&04,&01 ;Opcode: &C3 - JP   nn  ,
	.DB  &20,&E7,&1B,&0A,&02 ;Opcode: &20 - JR   c   ,n
	.DB  &18,&FF,&1B,&02,&01 ;Opcode: &18 - JR   n   ,
	.DB  &40,&C0,&4A,&06,&07 ;Opcode: &40 - LD   r   ,r2
	.DB  &02,&FF,&4A,&2A,&23 ;Opcode: &02 - LD   (BC),A
	.DB  &12,&FF,&4A,&2B,&23 ;Opcode: &12 - LD   (DE),A
	.DB  &32,&FF,&4A,&05,&23 ;Opcode: &32 - LD   (nn),A
	.DB  &22,&FF,&4A,&05,&18 ;Opcode: &22 - LD   (nn),HL
	.DB  &43,&CF,&4A,&C5,&08 ;Opcode: &43 - LD   (nn),dd
	.DB  &0A,&FF,&4A,&23,&2A ;Opcode: &0A - LD   A   ,(BC)
	.DB  &1A,&FF,&4A,&23,&2B ;Opcode: &1A - LD   A   ,(DE)
	.DB  &3A,&FF,&4A,&23,&05 ;Opcode: &3A - LD   A   ,(nn)
	.DB  &2A,&FF,&4A,&18,&05 ;Opcode: &2A - LD   HL  ,(nn)
	.DB  &F9,&FF,&4A,&2C,&18 ;Opcode: &F9 - LD   SP  ,HL
	.DB  &01,&CF,&4A,&08,&04 ;Opcode: &01 - LD   dd  ,nn
	.DB  &4B,&CF,&4A,&C8,&05 ;Opcode: &4B - LD   dd  ,(nn)
	.DB  &57,&FF,&4A,&E3,&2D ;Opcode: &57 - LD   A   ,I
	.DB  &5F,&FF,&4A,&E3,&2E ;Opcode: &5F - LD   A   ,R
	.DB  &47,&FF,&4A,&ED,&23 ;Opcode: &47 - LD   I   ,A
	.DB  &4F,&FF,&4A,&EE,&23 ;Opcode: &4F - LD   R   ,A
	.DB  &06,&C7,&4A,&06,&02 ;Opcode: &06 - LD   r   ,n
	.DB  &A8,&FF,&4B,&C1,&01 ;Opcode: &A8 - LDD      ,
	.DB  &B8,&FF,&4C,&C1,&01 ;Opcode: &B8 - LDDR     ,
	.DB  &A0,&FF,&4D,&C1,&01 ;Opcode: &A0 - LDI      ,
	.DB  &B0,&FF,&4E,&C1,&01 ;Opcode: &B0 - LDIR     ,
	.DB  &44,&FF,&4F,&C1,&01 ;Opcode: &44 - NEG      ,
	.DB  &00,&FF,&50,&01,&01 ;Opcode: &00 - NOP      ,
	.DB  &B0,&F8,&51,&07,&01 ;Opcode: &B0 - OR   r2  ,
	.DB  &F6,&FF,&51,&02,&01 ;Opcode: &F6 - OR   n   ,
	.DB  &BB,&FF,&52,&C1,&01 ;Opcode: &BB - OTDR     ,
	.DB  &B3,&FF,&53,&C1,&01 ;Opcode: &B3 - OTIR     ,
	.DB  &41,&C7,&54,&EF,&06 ;Opcode: &41 - OUT  (C) ,r
	.DB  &D3,&FF,&54,&03,&23 ;Opcode: &D3 - OUT  (n) ,A
	.DB  &AB,&FF,&55,&C1,&01 ;Opcode: &AB - OUTD     ,
	.DB  &A3,&FF,&56,&C1,&01 ;Opcode: &A3 - OUTI     ,
	.DB  &C1,&CF,&57,&09,&01 ;Opcode: &C1 - POP  qq  ,
	.DB  &C5,&CF,&58,&09,&01 ;Opcode: &C5 - PUSH qq  ,
	.DB  &80,&C0,&59,&8D,&07 ;Opcode: &80 - RES  b   ,r2
	.DB  &C9,&FF,&20,&01,&01 ;Opcode: &C9 - RET      ,
	.DB  &C0,&C7,&20,&0B,&01 ;Opcode: &C0 - RET  cc  ,
	.DB  &4D,&FF,&21,&C1,&01 ;Opcode: &4D - RETI     ,
	.DB  &45,&FF,&22,&C1,&01 ;Opcode: &45 - RETN     ,
	.DB  &10,&F8,&5A,&87,&01 ;Opcode: &10 - RL   r2  ,
	.DB  &17,&FF,&5B,&01,&01 ;Opcode: &17 - RLA      ,
	.DB  &00,&F8,&5C,&87,&01 ;Opcode: &00 - RLC  r2  ,
	.DB  &07,&FF,&5D,&01,&01 ;Opcode: &07 - RLCA     ,
	.DB  &6F,&FF,&5E,&C1,&01 ;Opcode: &6F - RLD      ,
	.DB  &18,&F8,&5F,&87,&01 ;Opcode: &18 - RR   r2  ,
	.DB  &1F,&FF,&60,&01,&01 ;Opcode: &1F - RRA      ,
	.DB  &08,&F8,&61,&87,&01 ;Opcode: &08 - RRC  r2  ,
	.DB  &0F,&FF,&62,&01,&01 ;Opcode: &0F - RRCA     ,
	.DB  &67,&FF,&63,&C1,&01 ;Opcode: &67 - RRD      ,
	.DB  &C7,&C7,&1D,&0C,&01 ;Opcode: &C7 - RST  t   ,
	.DB  &98,&F8,&64,&23,&07 ;Opcode: &98 - SBC  A   ,r2
	.DB  &DE,&FF,&64,&23,&02 ;Opcode: &DE - SBC  A   ,n
	.DB  &42,&CF,&64,&D8,&08 ;Opcode: &42 - SBC  HL  ,dd
	.DB  &37,&FF,&65,&01,&01 ;Opcode: &37 - SCF      ,
	.DB  &C0,&C0,&66,&8D,&07 ;Opcode: &C0 - SET  b   ,r2
	.DB  &20,&F8,&67,&87,&01 ;Opcode: &20 - SLA  r2  ,
	.DB  &30,&F8,&68,&87,&01 ;Opcode: &30 - SLL  r2  ,
	.DB  &28,&F8,&69,&87,&01 ;Opcode: &28 - SRA  r2  ,
	.DB  &38,&F8,&6A,&87,&01 ;Opcode: &38 - SRL  r2  ,
	.DB  &90,&F8,&6B,&07,&01 ;Opcode: &90 - SUB  r2  ,
	.DB  &D6,&FF,&6B,&02,&01 ;Opcode: &D6 - SUB  n   ,
	.DB  &A8,&F8,&6C,&07,&01 ;Opcode: &A8 - XOR  r2  ,
	.DB  &EE,&FF,&6C,&02,&01 ;Opcode: &EE - XOR  n   ,
	.DB  &00,&00,&6D,&01,&01 ;Opcode: &00 - ????     ,
	.DB  &00,&00,&6D,&C1,&01 ;Opcode: &00 - ????     ,
