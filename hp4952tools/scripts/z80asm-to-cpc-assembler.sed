s/read "/include "/
s/([A-Za-z0-9_-]+)([[:blank:]]*)equ/\1:\2equ/
s/([A-Za-z0-9_-]+)([[:blank:]]*)defb/\1:\2defb/
s/([A-Za-z0-9_-]+)([[:blank:]]*)defw/\1:\2defw/
#s/([^&A-Za-z0-9])([0-9A-Fa-f][0-9A-Fa-f])([[:blank:]]+)/\1\&\2/g
s/&([A-Za-z0-9_-]+)/0\1h/g