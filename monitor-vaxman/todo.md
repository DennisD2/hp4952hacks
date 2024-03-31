
## puts
putc

# monitor_key
getc 



## Non Z80 op codes in original source
like:
* ld bc,(hl)
* ld bc,hl
and more.
See replacement code.

```
hast entweder ganz viel vergessen oder nicht aufgepaßt:
Diese "Befehle"
>LD   BC,HL
>LD   BC,(HL)
gib es beide definitiv NICHT beim Z80.
https://www.mikrocontroller.net/topic/296771
```

```
Z80 does not have a lot of indirection support. You cannot do add a,(OP1) and you cannot use something like ld bc,(hl) You can use (hl) almost anywhere you can use a register, though.
https://www.cemetech.net/forum/viewtopic.php?p=205636
```
