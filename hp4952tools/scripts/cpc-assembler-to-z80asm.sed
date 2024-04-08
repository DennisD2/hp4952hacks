s/read "/include "/
s/HP_4952_Target([[:blank:]]+)equ([[:blank:]]+)&00/HP_4952_Target\1equ\2\&01/
s/CPC_Target([[:blank:]]+)equ([[:blank:]]+)&01/CPC_Target\1equ\2\&00/
s/([A-Za-z0-9_-]+)([[:blank:]]*)equ/\1:\2equ/
s/([A-Za-z0-9_-]+)([[:blank:]]*)defb/\1:\2defb/
s/([A-Za-z0-9_-]+)([[:blank:]]*)defw/\1:\2defw/
#s/([^&A-Za-z0-9])([0-9A-Fa-f][0-9A-Fa-f])([[:blank:]]+)/\1\&\2/g
s/&([A-Fa-f0-9_-]+)/0\1h/g
