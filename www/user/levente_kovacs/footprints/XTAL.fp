# author: Levente Kovacs
# email: lekovacs@interware.hu
# dist-license: GPL 2
# use-license: unlimited

Element[0x00000000 "XTAL" "X1" "crystal" 68000 20000 6000 -3000 0 100 0x00000000]
(
	Pin[0 0 6000 4000 6000 2800 "1" "1" 0x00004101]
	Pin[20000 0 6000 4000 6000 2800 "2" "2" 0x00004001]
	ElementLine [0 -5000 20000 -5000 1000]
	ElementLine [0 5000 20000 5000 1000]
	ElementArc [0 0 5000 5000 270 180 1000]
	ElementArc [20000 0 5000 5000 90 180 1000]

	)
