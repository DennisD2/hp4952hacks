
# hello in sdcc SDASZ80 code style
hello:
	sdasz80 -losgff -o lib/header.s
	sdasz80 -losgff -o lib/strap.s
	sdasz80 -losgff -o app1.s
	sdasz80 -losgff -o app2.s
	# next step is: link

link:
	sdld -u -m -w -z -i hello.ihx lib/header.rel lib/strap.rel app1.rel app2.rel
	#sdld -z -i -b STRAP=0x2000 hello.ihx lib/header.rel lib/strap.rel app1.rel app2.rel

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
			# Finally, convert ihx to binary
			#sdobjcopy -I ihex -O binary hello.ihx hello.app
			hex2bin  hello.ihx
			#hex2bin  lib/header.ihx
			#hex2bin  lib/strap.ihx
			#hex2bin  app1.ihx
			#hex2bin  app2.ihx

			#cat header.bin strap.bin app1.bin app2.bin >hello.bin

			z80dasm -t -a -g 0x0 hello.bin -o hello.dasm
			#z80dasm -t -a -g 0xa000 hello.bin -o hello.dasm
			#z80dasm -t -a -g 0x0  header.bin -o header.dasm
			#z80dasm -t -a -g 0x800  strap.bin -o strap.dasm
			#z80dasm -t -a -g 0x871  app1.bin -o app1.dasm
			#z80dasm -t -a -g 0xa00  app2.bin -o app2.dasm
			#z80dasm -t -a -g 0xa000  hello.bin -o hellocat.dasm
			#cmp header.bin header.bin.0
			#cmp header.bin hello-orig.app


# hello in original z80 assembler style understood by z80asm
# created files: app binary for HP4952A and the app disassembled back
hello-orig:
	z80asm -o hello-orig.app hello-orig.asm
	cp hello-orig.app $(HOME)/dosbox/util_1/HELLO0.APP
	z80dasm -t -a -g 0xa000 hello-orig.app -o hello-orig.dasm

clean:
	rm -f *.lst *.sym *.app hello *.lk  *.map *.noi *.rel *.ihx *.bin *.cdb




