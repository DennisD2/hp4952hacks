Text below copied from: http://www.vaxman.de/projects/tiny_z80/ .
----

[... initial text left out, describing the hardware Z80 sytem being used]

In order to make any use at all of such a small homebrew computer one needs a small operating system,
a so called "monitor" in fact. Writing the monitor took another couple of evenings up to now. Currently
it occupies $166C bytes of memory (5740 bytes), so the 32 kB EPROM is not really well utilized at the
moment. :-) The monitor is quite simple: All commands are collected into functional groups like
CONTROL, DISK etc. The first letter typed at the command prompt selects the desired group while the
second letter selects the command to be executed. The FAT file system implementation currently only
supports reading files and displaying directory listings but this simplifies development a lot since
one can now cross assemble/compile on another system and transfer the binaries by means of a CompactFlash
card. :-)

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
//ulmann@vaxman.de
//webmaster@vaxman.de
//02-OCT-2011, 08-JAN-2012, 20-FEB-2012