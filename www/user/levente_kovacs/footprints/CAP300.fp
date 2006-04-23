# author: Levente Kovacs
# email: lekovacs@interware.hu
# dist-license: GPL 2
# use-license: unlimited

Element(0x00000000 "" "C1" "" 1050 1600 50 -25 0 100 0x00000000)
(
	Pin(0 0 60 40 60 28 "1" "1" 0x00000101)
	Pin(300 0 60 40 60 28 "2" "2" 0x00000001)
	ElementLine (0 -50 300 -50 12)
	ElementLine (0 50 300 50 12)
	ElementArc (0 0 50 50 0 90 12)
	ElementArc (300 0 50 50 180 90 12)
	ElementArc (0 0 50 50 270 90 12)
	ElementArc (300 0 50 50 90 90 12)
	)
