# author: Stefan Salewski
# email: mail@ssalewski.de
# dist-license: GPL
# use-license: unlimited

# Schottky Diode MBRM120E
Element[0x00000000 "Schottky Diode MBRM120E" "" "" 0 0 -6000 -16006 0 100 0x00000000]
(
	Pad[-1000 6506 1000 6506 3000 2000 5000 "a" "a" 0x00000100]
	Pad[0 -3006 0 -2494 10000 2000 12000 "c" "c" 0x00000100]
	ElementLine [6000 9006 -6000 9006 1000]
	ElementLine [-6000 9006 -6000 -9006 1000]
	ElementLine [-6000 -9006 6000 -9006 1000]
	ElementLine [6000 -9006 6000 9006 1000]
)
