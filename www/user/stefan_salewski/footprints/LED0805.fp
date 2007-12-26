# author: Stefan Salewski
# email: mail@ssalewski.de
# dist-license: GPL
# use-license: unlimited

# LED SMD 0805

Element[0x00000000 "LED0805" "" "" 0 0 -8086 -10165 0 100 0x00000000]
(
	Pad[-4921 0 -4331 0 4331 2000 6331 "1" "1" 0x00000100]
	Pad[4331 0 4921 0 4331 2000 6331 "2" "2" 0x00000100]
	ElementLine [8086 3165 -8086 3165 1000]
	ElementLine [-8086 3165 -8086 -3165 1000]
	ElementLine [-8086 -3165 8086 -3165 1000]
	ElementLine [8086 -3165 8086 3165 1000]
	ElementLine [-1165 -3165 -1165 3165 1000]
)
