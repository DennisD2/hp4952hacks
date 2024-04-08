s/include "/read "/
s/HP_4952_Target:([[:blank:]]*)equ([[:blank:]]*)001h/HP_4952_Target:\1equ\2000h/
s/CPC_Target:([[:blank:]]*)equ([[:blank:]]*)000h/CPC_Target:\1equ\2001h/
s/([A-Za-z0-9_-]+):([[:blank:]]*)equ/\1\2equ/
s/0([A-Fa-f0-9_-]+)h/\&\1/g
s/;(.*):(.*)/;\1;\2/g