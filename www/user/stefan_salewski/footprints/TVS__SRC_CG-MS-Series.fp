# author: Stefan Salewski
# email: mail@ssalewski.de
# dist-license: GPL
# use-license: unlimited

# Transient Voltage Supresssor
Element[0x00000000 "TVS" "" "" 0 0 -17102 -25145 0 100 0x00000000]
(
	Pad[-11594 -12637 -11594 12637 9016 2000 11016 "1" "1" 0x00000100]
	Pad[11595 -12637 11595 12637 9016 2000 11016 "2" "2" 0x00000100]
	ElementLine [17102 18145 -17102 18145 1000]
	ElementLine [-17102 18145 -17102 -18145 1000]
	ElementLine [-17102 -18145 17102 -18145 1000]
	ElementLine [17102 -18145 17102 18145 1000]
)
