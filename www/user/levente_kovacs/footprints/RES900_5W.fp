# author: Levente Kovacs
# email: lekovacs@interware.hu
# dist-license: GPL 2
# use-license: unlimited

Element[0x00000000 "" "R1" "" 200000 200000 2500 15000 0 100 0x00000000]
(
	Pin[0 0 12000 6000 12000 5200 "1" "1" 0x00004101]
	Pin[90000 0 12000 6000 12000 5200 "2" "2" 0x00004001]
	ElementLine [90000 7500 90000 20000 500]
	ElementLine [90000 -7500 90000 -20000 500]
	ElementLine [0 7500 0 20000 500]
	ElementLine [0 -7500 0 -20000 500]
	ElementLine [0 20000 90000 20000 500]
	ElementLine [0 -20000 90000 -20000 500]

	)
