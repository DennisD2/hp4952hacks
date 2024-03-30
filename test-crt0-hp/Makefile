
# crt in sdcc SDASZ80 code style
crt:
	sdasz80 -losgff -o crt0_hp.s
	#sdasz80 -o putchar_hp.s
	# next step is: link

fun:
	sdcc -mz80 -c fun.c

link:
	# first link step
	sdcc -o sdcc01.ihx -mz80 --code-loc 0x0cc0 --data-loc 0x0 --no-std-crt0 --nostdinc --nostdlib crt0_hp.rel fun.rel
	# link helper phase 1
	# second link with correct .org/code-loc for c code
	# 2200 + cc0 = 2ec0
	sdcc -o sdcc01-l2.ihx -mz80 --code-loc 0x2ec0 --data-loc 0x0 --no-std-crt0 crt0_hp.rel fun.rel


#			-mz80 -Wl -y --code-loc 0xa000  \ ;--data-loc 0xb000
#link-sdcc:
#	sdcc -o hello.ihx \
#			-mz80 -Wl -y --code-loc 0xa000 \
#			--std-c11 -mz80 --debug \
#			--no-std-crt0 --nostdinc --nostdlib \
#			crt0.rel hello.rel
#
# next step is:  binary

binary:
	hex2bin sdcc01.ihx
	cp sdcc01.bin $(HOME)/dosbox/util_1/SDC.APP
	z80dasm -t -a -g 0x0 sdcc01.bin -o sdcc01.dasm
	hex2bin sdcc01-l2.ihx
	z80dasm -t -a -g 0x0 sdcc01-l2.bin -o sdcc01-l2.dasm

clean:
	rm -f *.lst *.sym *.app hello *.lk  *.map *.noi *.rel *.ihx *.bin *.cdb *.dasm




