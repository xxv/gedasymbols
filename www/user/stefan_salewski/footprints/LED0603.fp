# author: Stefan Salewski
# email: mail@ssalewski.de
# dist-license: GPL
# use-license: unlimited

# LED SMD 0603
Element[0x00000000 "LED0603" "" "" 0 0 -5823 -9575 0 100 0x00000000]
(
	Pad[-3248 0 -3248 0 3150 2000 5150 "1" "1" 0x00000100]
	Pad[3248 0 3248 0 3150 2000 5150 "2" "2" 0x00000100]
	ElementLine [5823 2575 -5823 2575 1000]
	ElementLine [-5823 2575 -5823 -2575 1000]
	ElementLine [-5823 -2575 5823 -2575 1000]
	ElementLine [5823 -2575 5823 2575 1000]
	ElementLine [-673 -2575 -673 2575 1000]
)
