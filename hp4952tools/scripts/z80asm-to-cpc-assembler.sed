s/include "/read "/
s/([A-Za-z0-9_-]+):([[:blank:]]*)equ/\1\2equ/
s/0([A-Fa-f0-9_-]+)h/\&\1/g
s/missing-z80a/missing-cpca/
s/disdata-z80a/disdata-cpca/