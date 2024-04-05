Text below copied from: http://www.vaxman.de/projects/tiny_z80/ .
----

A tiny Z80 based computer


A rather small Z80 based computer with the following features:

Z80 single board computer
IDE controller
FAT file system (currently read only) in Z80 assembler

In September 2011 I somehow got the feeling that I just HAD to build a small Z80 based computer again. My last homebrew Z80 was built when I was still in school (more than 20 years ago) and somehow I felt a bit nostalgic and missed the (truly) good old times when computers were small, rather simple, easy to understand and program. Times when writing software meant writing assembler code and not installing several GB of a development package which creates files no smaller than several MB. So I searched for useable parts in my hardware repository and found everything necessary to build a small (tiny, in fact) Z80 based computer.

Since I love wire wrapping, I decided to build the computer on a single Euro card using wire wrap sockets where ever possible (if you happen to have wire wrap sockets or wire etc. and would like to give it to a good home I would love to take care of it - I am running low on wire wrap parts and it is next to impossible to find new sockets etc.). Designing and building the card took two evenings of about 5 hours each, and debugging took another, third evening (there were only four wiring errors but I made a software error in configuring the UART which was a bit hard to find).

The left row of the board shown above contains the TTL clock oscillators for the Z80 CPU (4 MHz) and the 16C550 UART (1.8432 MHz), a MAX232 for the serial line, a 74LS14 for the (simple) reset circuit and the reset push button. The next row contains the Z80 CPU, the 16C550 UART, a 62256 32kB RAM and a 27(C)512 32kB EPROM in a ZIF socket. The remainder of the board contains a simple voltage regulator with a 7805, several bus drivers (74LS245) and some address select logic.

The following pictures give an impression of the process of building this simple computer:





The schematic of the computer is quite simple and straight forward. Since I wanted to build a really simple computer, there is no provision for DMA transfers and the interrupt logic has not been tested by now.

Please note that there is a tiny error in the schematic drawing: The TTL oscillator driving the UART is a 1.8432 MHz type and not an 8 MHz oscillator as noted in the drawing! (Sorry - I forgot to correct this.)


Here is the parts list for the computer (excluding sockets - I recommend to use precision sockets):

TTL clock oscillator 4 MHz (for Z80 CPU - depending on your model, higher clock rates are possible)
TTL clock oscillator 1.8432 MHz (for UART)
MAX232 level converter for the serial line
74LS14 (for reset-circuitry)
Push button for reset
Z80 CPU (at least "A" variant which is capable of running at 4 MHz)
16C550 UART
62256 static RAM, 32 kB
27(C)256 EPROM (you might want to use a ZIF socket for the EPROM to facilitate insertion and removal of EPROMs during software development)
74LS08 (quad AND gate)
74LS139 (double 1-out-4 selector)
74LS32 two times (quad OR gate)
74LS245 four times (buffers for the bus - these are optional and only necessary if you plan to use external devices on the bus)
74LS07 (LED driver)
100 nF capacitors (16 times - one for each IC)
1N4148 diode (reset circuit)
10 uF capacitor (reset circuit)
10 Ohm resistor (reset circuit)
10 kOhm resistor (reset circuit)
1 uF capacitor (5 times - needed by the MAX232)
4.7 kOhm resistors (four times - needed to pull up some control lines - alternatively you can use a resistor array as I did)
10 pin socket or something equivalent for the serial line
100 uF capacitor (voltage regulator)
100 nF capacitor (voltage regulator)
7805 linear voltage regulator, 5 V
3mm LEDs, 1 green, 2 yellow, 2 red)
220 Ohm resistor, 5 times (LEDs)
Connector for power supply
Experimental Euro-card (160 mm times 100 mm)
VG connector, 64 or 96 pins
As stylish as a paper tape reader/puncher or at least a cassette drive would be, I decided to implement a simple IDE interface to use cheap and ruggedized Compact Flash cards for mass storage. After reading quite a bit about the IDE interface and having a look at other people's interfaces, I decided not to reinvent the wheel and implement the controlled developed by Phil from Retroleum since his design is clean and simple and features a really nice flipflop logic to generate the various control signals instead of RC delay circuits etc. as found in other designs.

The picture on the right shows the schematic of the IDE controller. Please note that there is an error that I forgot to correct on the schematic: The two eight bit latches on the lower right are of type 74LS374 and NOT (!) 74LS574 as written. (74LS574 would work, too, but have a completely different pinout!)

The circuit is described in detail on Phil's page at Retroleum. My implementation only differs with respect to an additional address decoder build around a 74LS85 4 bit comparator and a four place DIP switch. Currently my IDE controller is located at address $10 in the IO address space of the Z80 processor.



The picture on the left shows the completed IDE controller (which drove me nuts during debugging since I managed to handle the two select signals for the IDE devices incorrectly... *sigh*).

Since the tiny Z80 computer consists of two boards by now, an enclosure was needed. I decided to use a 10 inch standard enclosure (had I known before how much fiddling would be required to build the enclosure out of the many parts delivered by my supplier, I might have settled for something else :-) ). The picture on the right shows the first picture of the CPU card in its new housing. The iPad is used as terminal (a very useful feature :-) ).



The picture on the left shows both cards, the CPU board on the far left and the IDE controller right next to it, in operation. By the way - at first I thought about building a simple power supply with a linear regulator - then I wondered if I should use an old PC power supply and then I realized that new switching power supplies, capable of delivering 5V with 8A, cost only about 18 EUR... That is the reason for the small and modern power supply on the right hand side of the enclosure.

While the processor card worked quite right out of the box, the IDE controller was bit of a challenge since there were two independent bugs buried in its logic. The first problem was that the 74LS32 quad OR gate chip was defective (this is all the more puzzling since it was a new device). But more difficult to find was a mistake I did concerning the two select lines of the IDE device. I "thought" that I had understood the IDE logic and wired one of the /CS-lines to ground as I would have done with any TTL chip requiring two chip select lines. I did not realize that the two /CS lines act in fact as yet another address line and allow access to the upper registers of the IDE device. Fixing this bug was extremely simple, but finding it was hard since I was so sure that grounding the second /CS line was the right thing to do. :-)


In order to make any use at all of such a small homebrew computer one needs a small operating system, a so called "monitor" in fact. Writing the monitor took another couple of evenings up to now. Currently it occupies $166C bytes of memory (5740 bytes), so the 32 kB EPROM is not really well utilized at the moment. :-) The monitor is quite simple: All commands are collected into functional groups like CONTROL, DISK etc. The first letter typed at the command prompt selects the desired group while the second letter selects the command to be executed. The FAT file system implementation currently only supports reading files and displaying directory listings but this simplifies development a lot since one can now cross assemble/compile on another system and transfer the binaries by means of a CompactFlash card. :-)

Currently the monitor supports the following commands:

Control group:
Cold start: Restart the computer, clearing memory.
Info: Print monitor version.
Start: Start a machine program.
Warm start: Restart the computer without clearing memory.
Disk group:
Info: Print disk information.
Mount: Mount the disk.
Transfer: Initiate a transfer from or to disk:
Read: Read sectors from disk into memory.
Write: Write sectors from memory to disk.
Unmount: Unmount the disk.
File group:
Cat: Print a file's contents to STDOUT.
Directory: Print the disk directory.
Load: Load a file's contents into memory.
Help: Print help.
Memory group:
Dump: Dump a memory region - the user is asked to enter a start and end address.
Examine: Examine individual memory locations. After entering an address, the user can press the space bar to read the next memory cell or press any other key which will terminate the command.
Fill: Fill a memory area with a constant value.
Intel hex load: Load the contents of an Intel Hex file into memory. This is really useful for testing newly developed software.
Load: Load memory locations manually - after entering a start address, bytes in hexadecimal notation are read and stored in successive memory cells until a non-hexadecimal character will be entered.
Register dump: Dump the current contents of both register banks.
Working with this simple monitor looks like this:

Simple Z80-monitor - V 0.8 (B. Ulmann, Sep. 2011 - Jan. 2012)
Cold start, clearing memory.

Z> DISK/MOUNT

        FATNAME:        MSDOS5.0
        CLUSIZ: 40
        RESSEC: 0008
        FATSEC: 00F0
        ROOTLEN:        0200
        PSIZ:           003C0030
        PSTART: 00001F80
        FAT1START:      00001F88
        ROOTSTART:      00002168
        DATASTART:      00002188

Z> FILE/DIRECTORY
Directory contents:
-------------------------------------------
FILENAME.EXT  DIR?   SIZE (BYTES)  1ST SECT
-------------------------------------------
_~1     .TRA            00001000        000021C8
TRASHE~1.       DIR     00000000        00002188
SPOTLI~1.       DIR     00000000        00002208
FSEVEN~1.       DIR     00000000        00002408
TEST    .TXT            00000013        00002688
FAT_1   .ASM            0000552C        000026C8
MEMO    .TXT            00000098        00002748
TEST210 .TXT            00000210        00002788
TEST1F0 .TXT            000001F0        00002DC8
TEST200 .TXT            00000200        00002E08
GROSS   .TXT            0000CB5A        00003488

Z> FILE/CAT: FILENAME=TEST.TXT
123 ich bin so frei
Z> FILE/LOAD FILE: ADDR=C000 FILENAME=TEST.TXT

0013 bytes loaded.

Z> MEMORY/DUMP: START=C000 END=C01F
C000: 31 32 33 20 69 63 68 20 62 69 6E 20 73 6F 20 66   123 ich bin so f
C010: 72 65 69 00 00 00 00 00 00 00 00 00 00 00 00 00   rei.............

Z>

The source of the monitor can be found here:
// see file: monitor.asm

//ulmann@vaxman.de
//webmaster@vaxman.de
//02-OCT-2011, 08-JAN-2012, 20-FEB-2012