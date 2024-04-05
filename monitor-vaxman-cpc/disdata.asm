kDisSubsL equ 13	;Last operand substitution string
kDisSubNN equ 4	;Operand substitution string 'nn'
kDisSubC equ 10	;Operand substitution string 'c'
kDisSubCC equ 11	;Operand substitution string 'cc'
kDisBracHL equ 21	;Bracketed HL
kDisHL equ 24	;HL
kDisFlowF equ 27	;First flow control instructions
kDisFlowL equ 34	;Last flow control instructions
kDisJR equ 27	;Operation string 'JR'
kDisDJNZ equ 28	;Operation string 'DJNZ'
kDisRST equ 29	;Operation string 'RST'
kDisJP equ 30	;Operation string 'JP'
kDisCALL equ 31	;Operation string 'CALL'
kDisRET equ 32	;Operation string 'RET'
kDisOpMask equ &3F	;Operand 1 mask to exclude pre-code bits
kDisMskC equ &18	;Condition bit mask for Operand 1 = C
kDisMskCC equ &38	;Condition bit mask for Operand 1 = CC
kDisMskRST equ &38	;Restart address bits

DisString:
	defb  &80                              	;String &01 =
	defb  &80+'n'                          	;String &02 = n
	defb  &80+'(',"n)"                     	;String &03 = (n)
	defb  &80+'n',"n"                      	;String &04 = nn
	defb  &80+'(',"nn)"                    	;String &05 = (nn)
	defb  &80+'r'                          	;String &06 = r
	defb  &80+'r',"2"                      	;String &07 = r2
	defb  &80+'d',"d"                      	;String &08 = dd
	defb  &80+'q',"q"                      	;String &09 = qq
	defb  &80+'c'                          	;String &0A = c
	defb  &80+'c',"c"                      	;String &0B = cc
	defb  &80+'t'                          	;String &0C = t
	defb  &80+'b'                          	;String &0D = b
	defb  &80+'B',"CDEHL-A"                	;String &0E = BCDEHL-A
	defb  &80+'B',"CDE**SP"                	;String &0F = BCDE**SP
	defb  &80+'B',"CDE**AF"                	;String &10 = BCDE**AF
	defb  &80+'N',"ZZ.NCC."                	;String &11 = NZZ.NCC.
	defb  &80+'N',"ZZ.NCC.POPEP.M."        	;String &12 = NZZ.NCC.POPEP.M.
	defb  &80+'0',"008101820283038"        	;String &13 = 0008101820283038
	defb  &80+'0',"1234567"                	;String &14 = 01234567
	defb  &80+'(',"HL)"                    	;String &15 = (HL)
	defb  &80+'(',"IX+"                    	;String &16 = (IX+
	defb  &80+'(',"IY+"                    	;String &17 = (IY+
	defb  &80+'H',"L"                      	;String &18 = HL
	defb  &80+'I',"X"                      	;String &19 = IX
	defb  &80+'I',"Y"                      	;String &1A = IY
	defb  &80+'J',"R"                      	;String &1B = JR
	defb  &80+'D',"JNZ"                    	;String &1C = DJNZ
	defb  &80+'R',"ST"                     	;String &1D = RST
	defb  &80+'J',"P"                      	;String &1E = JP
	defb  &80+'C',"ALL"                    	;String &1F = CALL
	defb  &80+'R',"ET"                     	;String &20 = RET
	defb  &80+'R',"ETI"                    	;String &21 = RETI
	defb  &80+'R',"ETN"                    	;String &22 = RETN
	defb  &80+'A'                          	;String &23 = A
	defb  &80+'(',"SP)"                    	;String &24 = (SP)
	defb  &80+'A',"F"                      	;String &25 = AF
	defb  &80+'D',"E"                      	;String &26 = DE
	defb  &80+'0'                          	;String &27 = 0
	defb  &80+'1'                          	;String &28 = 1
	defb  &80+'2'                          	;String &29 = 2
	defb  &80+'(',"BC)"                    	;String &2A = (BC)
	defb  &80+'(',"DE)"                    	;String &2B = (DE)
	defb  &80+'S',"P"                      	;String &2C = SP
	defb  &80+'I'                          	;String &2D = I
	defb  &80+'R'                          	;String &2E = R
	defb  &80+'(',"C)"                     	;String &2F = (C)
	defb  &80+'A',"F'"                     	;String &30 = AF'
	defb  &80+'A',"DC"                     	;String &31 = ADC
	defb  &80+'A',"DD"                     	;String &32 = ADD
	defb  &80+'A',"ND"                     	;String &33 = AND
	defb  &80+'B',"IT"                     	;String &34 = BIT
	defb  &80+'C',"CF"                     	;String &35 = CCF
	defb  &80+'C',"P"                      	;String &36 = CP
	defb  &80+'C',"PD"                     	;String &37 = CPD
	defb  &80+'C',"PDR"                    	;String &38 = CPDR
	defb  &80+'C',"PI"                     	;String &39 = CPI
	defb  &80+'C',"PIR"                    	;String &3A = CPIR
	defb  &80+'C',"PL"                     	;String &3B = CPL
	defb  &80+'D',"AA"                     	;String &3C = DAA
	defb  &80+'D',"EC"                     	;String &3D = DEC
	defb  &80+'D',"I"                      	;String &3E = DI
	defb  &80+'E',"I"                      	;String &3F = EI
	defb  &80+'E',"X"                      	;String &40 = EX
	defb  &80+'E',"XX"                     	;String &41 = EXX
	defb  &80+'H',"ALT"                    	;String &42 = HALT
	defb  &80+'I',"M"                      	;String &43 = IM
	defb  &80+'I',"N"                      	;String &44 = IN
	defb  &80+'I',"NC"                     	;String &45 = INC
	defb  &80+'I',"ND"                     	;String &46 = IND
	defb  &80+'I',"NDR"                    	;String &47 = INDR
	defb  &80+'I',"NI"                     	;String &48 = INI
	defb  &80+'I',"NIR"                    	;String &49 = INIR
	defb  &80+'L',"D"                      	;String &4A = LD
	defb  &80+'L',"DD"                     	;String &4B = LDD
	defb  &80+'L',"DDR"                    	;String &4C = LDDR
	defb  &80+'L',"DI"                     	;String &4D = LDI
	defb  &80+'L',"DIR"                    	;String &4E = LDIR
	defb  &80+'N',"EG"                     	;String &4F = NEG
	defb  &80+'N',"OP"                     	;String &50 = NOP
	defb  &80+'O',"R"                      	;String &51 = OR
	defb  &80+'O',"TDR"                    	;String &52 = OTDR
	defb  &80+'O',"TIR"                    	;String &53 = OTIR
	defb  &80+'O',"UT"                     	;String &54 = OUT
	defb  &80+'O',"UTD"                    	;String &55 = OUTD
	defb  &80+'O',"UTI"                    	;String &56 = OUTI
	defb  &80+'P',"OP"                     	;String &57 = POP
	defb  &80+'P',"USH"                    	;String &58 = PUSH
	defb  &80+'R',"ES"                     	;String &59 = RES
	defb  &80+'R',"L"                      	;String &5A = RL
	defb  &80+'R',"LA"                     	;String &5B = RLA
	defb  &80+'R',"LC"                     	;String &5C = RLC
	defb  &80+'R',"LCA"                    	;String &5D = RLCA
	defb  &80+'R',"LD"                     	;String &5E = RLD
	defb  &80+'R',"R"                      	;String &5F = RR
	defb  &80+'R',"RA"                     	;String &60 = RRA
	defb  &80+'R',"RC"                     	;String &61 = RRC
	defb  &80+'R',"RCA"                    	;String &62 = RRCA
	defb  &80+'R',"RD"                     	;String &63 = RRD
	defb  &80+'S',"BC"                     	;String &64 = SBC
	defb  &80+'S',"CF"                     	;String &65 = SCF
	defb  &80+'S',"ET"                     	;String &66 = SET
	defb  &80+'S',"LA"                     	;String &67 = SLA
	defb  &80+'S',"LL"                     	;String &68 = SLL
	defb  &80+'S',"RA"                     	;String &69 = SRA
	defb  &80+'S',"RL"                     	;String &6A = SRL
	defb  &80+'S',"UB"                     	;String &6B = SUB
	defb  &80+'X',"OR"                     	;String &6C = XOR
	defb  &80+'?',"???"                    	;String &6D = ????
	defb  &80

DisInst:
	defb  &88,&F8,&31,&23,&07 ;Opcode &88 - ADC  A   ,r2
	defb  &CE,&FF,&31,&23,&02 ;Opcode &CE - ADC  A   ,n
	defb  &4A,&CF,&31,&D8,&08 ;Opcode &4A - ADC  HL  ,dd
	defb  &80,&F8,&32,&23,&07 ;Opcode &80 - ADD  A   ,r2
	defb  &C6,&FF,&32,&23,&02 ;Opcode &C6 - ADD  A   ,n
	defb  &09,&CF,&32,&18,&08 ;Opcode &09 - ADD  HL  ,dd
	defb  &A0,&F8,&33,&07,&01 ;Opcode &A0 - AND  r2  ,
	defb  &E6,&FF,&33,&02,&01 ;Opcode &E6 - AND  n   ,
	defb  &40,&C0,&34,&8D,&07 ;Opcode &40 - BIT  b   ,r2
	defb  &C4,&C7,&1F,&0B,&04 ;Opcode &C4 - CALL cc  ,nn
	defb  &CD,&FF,&1F,&04,&01 ;Opcode &CD - CALL nn  ,
	defb  &3F,&FF,&35,&01,&01 ;Opcode &3F - CCF      ,
	defb  &B8,&F8,&36,&07,&01 ;Opcode &B8 - CP   r2  ,
	defb  &FE,&FF,&36,&02,&01 ;Opcode &FE - CP   n   ,
	defb  &A9,&FF,&37,&C1,&01 ;Opcode &A9 - CPD      ,
	defb  &B9,&FF,&38,&C1,&01 ;Opcode &B9 - CPDR     ,
	defb  &A1,&FF,&39,&C1,&01 ;Opcode &A1 - CPI      ,
	defb  &B1,&FF,&3A,&C1,&01 ;Opcode &B1 - CPIR     ,
	defb  &2F,&FF,&3B,&01,&01 ;Opcode &2F - CPL      ,
	defb  &27,&FF,&3C,&01,&01 ;Opcode &27 - DAA      ,
	defb  &0B,&CF,&3D,&08,&01 ;Opcode &0B - DEC  dd  ,
	defb  &05,&C7,&3D,&06,&01 ;Opcode &05 - DEC  r   ,
	defb  &F3,&FF,&3E,&01,&01 ;Opcode &F3 - DI       ,
	defb  &10,&FF,&1C,&02,&01 ;Opcode &10 - DJNZ n   ,
	defb  &FB,&FF,&3F,&01,&01 ;Opcode &FB - EI       ,
	defb  &E3,&FF,&40,&24,&18 ;Opcode &E3 - EX   (SP),HL
	defb  &08,&FF,&40,&25,&30 ;Opcode &08 - EX   AF  ,AF'
	defb  &EB,&FF,&40,&26,&18 ;Opcode &EB - EX   DE  ,HL
	defb  &D9,&FF,&41,&01,&01 ;Opcode &D9 - EXX      ,
	defb  &76,&FF,&42,&01,&01 ;Opcode &76 - HALT     ,
	defb  &46,&FF,&43,&E7,&01 ;Opcode &46 - IM   0   ,
	defb  &56,&FF,&43,&E8,&01 ;Opcode &56 - IM   1   ,
	defb  &5E,&FF,&43,&E9,&01 ;Opcode &5E - IM   2   ,
	defb  &40,&C7,&44,&C6,&2F ;Opcode &40 - IN   r   ,(C)
	defb  &DB,&FF,&44,&23,&03 ;Opcode &DB - IN   A   ,(n)
	defb  &03,&CF,&45,&08,&01 ;Opcode &03 - INC  dd  ,
	defb  &04,&C7,&45,&06,&01 ;Opcode &04 - INC  r   ,
	defb  &AA,&FF,&46,&C1,&01 ;Opcode &AA - IND      ,
	defb  &BA,&FF,&47,&C1,&01 ;Opcode &BA - INDR     ,
	defb  &A2,&FF,&48,&C1,&01 ;Opcode &A2 - INI      ,
	defb  &B2,&FF,&49,&C1,&01 ;Opcode &B2 - INIR     ,
	defb  &E9,&FF,&1E,&15,&01 ;Opcode &E9 - JP   (HL),
	defb  &C2,&C7,&1E,&0B,&04 ;Opcode &C2 - JP   cc  ,nn
	defb  &C3,&FF,&1E,&04,&01 ;Opcode &C3 - JP   nn  ,
	defb  &20,&E7,&1B,&0A,&02 ;Opcode &20 - JR   c   ,n
	defb  &18,&FF,&1B,&02,&01 ;Opcode &18 - JR   n   ,
	defb  &40,&C0,&4A,&06,&07 ;Opcode &40 - LD   r   ,r2
	defb  &02,&FF,&4A,&2A,&23 ;Opcode &02 - LD   (BC),A
	defb  &12,&FF,&4A,&2B,&23 ;Opcode &12 - LD   (DE),A
	defb  &32,&FF,&4A,&05,&23 ;Opcode &32 - LD   (nn),A
	defb  &22,&FF,&4A,&05,&18 ;Opcode &22 - LD   (nn),HL
	defb  &43,&CF,&4A,&C5,&08 ;Opcode &43 - LD   (nn),dd
	defb  &0A,&FF,&4A,&23,&2A ;Opcode &0A - LD   A   ,(BC)
	defb  &1A,&FF,&4A,&23,&2B ;Opcode &1A - LD   A   ,(DE)
	defb  &3A,&FF,&4A,&23,&05 ;Opcode &3A - LD   A   ,(nn)
	defb  &2A,&FF,&4A,&18,&05 ;Opcode &2A - LD   HL  ,(nn)
	defb  &F9,&FF,&4A,&2C,&18 ;Opcode &F9 - LD   SP  ,HL
	defb  &01,&CF,&4A,&08,&04 ;Opcode &01 - LD   dd  ,nn
	defb  &4B,&CF,&4A,&C8,&05 ;Opcode &4B - LD   dd  ,(nn)
	defb  &57,&FF,&4A,&E3,&2D ;Opcode &57 - LD   A   ,I
	defb  &5F,&FF,&4A,&E3,&2E ;Opcode &5F - LD   A   ,R
	defb  &47,&FF,&4A,&ED,&23 ;Opcode &47 - LD   I   ,A
	defb  &4F,&FF,&4A,&EE,&23 ;Opcode &4F - LD   R   ,A
	defb  &06,&C7,&4A,&06,&02 ;Opcode &06 - LD   r   ,n
	defb  &A8,&FF,&4B,&C1,&01 ;Opcode &A8 - LDD      ,
	defb  &B8,&FF,&4C,&C1,&01 ;Opcode &B8 - LDDR     ,
	defb  &A0,&FF,&4D,&C1,&01 ;Opcode &A0 - LDI      ,
	defb  &B0,&FF,&4E,&C1,&01 ;Opcode &B0 - LDIR     ,
	defb  &44,&FF,&4F,&C1,&01 ;Opcode &44 - NEG      ,
	defb  &00,&FF,&50,&01,&01 ;Opcode &00 - NOP      ,
	defb  &B0,&F8,&51,&07,&01 ;Opcode &B0 - OR   r2  ,
	defb  &F6,&FF,&51,&02,&01 ;Opcode &F6 - OR   n   ,
	defb  &BB,&FF,&52,&C1,&01 ;Opcode &BB - OTDR     ,
	defb  &B3,&FF,&53,&C1,&01 ;Opcode &B3 - OTIR     ,
	defb  &41,&C7,&54,&EF,&06 ;Opcode &41 - OUT  (C) ,r
	defb  &D3,&FF,&54,&03,&23 ;Opcode &D3 - OUT  (n) ,A
	defb  &AB,&FF,&55,&C1,&01 ;Opcode &AB - OUTD     ,
	defb  &A3,&FF,&56,&C1,&01 ;Opcode &A3 - OUTI     ,
	defb  &C1,&CF,&57,&09,&01 ;Opcode &C1 - POP  qq  ,
	defb  &C5,&CF,&58,&09,&01 ;Opcode &C5 - PUSH qq  ,
	defb  &80,&C0,&59,&8D,&07 ;Opcode &80 - RES  b   ,r2
	defb  &C9,&FF,&20,&01,&01 ;Opcode &C9 - RET      ,
	defb  &C0,&C7,&20,&0B,&01 ;Opcode &C0 - RET  cc  ,
	defb  &4D,&FF,&21,&C1,&01 ;Opcode &4D - RETI     ,
	defb  &45,&FF,&22,&C1,&01 ;Opcode &45 - RETN     ,
	defb  &10,&F8,&5A,&87,&01 ;Opcode &10 - RL   r2  ,
	defb  &17,&FF,&5B,&01,&01 ;Opcode &17 - RLA      ,
	defb  &00,&F8,&5C,&87,&01 ;Opcode &00 - RLC  r2  ,
	defb  &07,&FF,&5D,&01,&01 ;Opcode &07 - RLCA     ,
	defb  &6F,&FF,&5E,&C1,&01 ;Opcode &6F - RLD      ,
	defb  &18,&F8,&5F,&87,&01 ;Opcode &18 - RR   r2  ,
	defb  &1F,&FF,&60,&01,&01 ;Opcode &1F - RRA      ,
	defb  &08,&F8,&61,&87,&01 ;Opcode &08 - RRC  r2  ,
	defb  &0F,&FF,&62,&01,&01 ;Opcode &0F - RRCA     ,
	defb  &67,&FF,&63,&C1,&01 ;Opcode &67 - RRD      ,
	defb  &C7,&C7,&1D,&0C,&01 ;Opcode &C7 - RST  t   ,
	defb  &98,&F8,&64,&23,&07 ;Opcode &98 - SBC  A   ,r2
	defb  &DE,&FF,&64,&23,&02 ;Opcode &DE - SBC  A   ,n
	defb  &42,&CF,&64,&D8,&08 ;Opcode &42 - SBC  HL  ,dd
	defb  &37,&FF,&65,&01,&01 ;Opcode &37 - SCF      ,
	defb  &C0,&C0,&66,&8D,&07 ;Opcode &C0 - SET  b   ,r2
	defb  &20,&F8,&67,&87,&01 ;Opcode &20 - SLA  r2  ,
	defb  &30,&F8,&68,&87,&01 ;Opcode &30 - SLL  r2  ,
	defb  &28,&F8,&69,&87,&01 ;Opcode &28 - SRA  r2  ,
	defb  &38,&F8,&6A,&87,&01 ;Opcode &38 - SRL  r2  ,
	defb  &90,&F8,&6B,&07,&01 ;Opcode &90 - SUB  r2  ,
	defb  &D6,&FF,&6B,&02,&01 ;Opcode &D6 - SUB  n   ,
	defb  &A8,&F8,&6C,&07,&01 ;Opcode &A8 - XOR  r2  ,
	defb  &EE,&FF,&6C,&02,&01 ;Opcode &EE - XOR  n   ,
	defb  &00,&00,&6D,&01,&01 ;Opcode &00 - ????     ,
	defb  &00,&00,&6D,&C1,&01 ;Opcode &00 - ????     ,
