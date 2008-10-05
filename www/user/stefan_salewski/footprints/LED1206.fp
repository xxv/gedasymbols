# author: Stefan Salewski
# email: mail@ssalewski.de
# dist-license: GPL
# use-license: unlimited

# LED SMD 1206
Element[0x00000000 "LED1206" "" "" 0 0 -12327 -11453 0 100 0x00000000]
(
	Pad[-7874 0 -6890 0 5906 2000 7906 "1" "1" 0x00000100]
	Pad[6890 0 7874 0 5906 2000 7906 "2" "2" 0x00000100]
	ElementLine [12327 4453 -12327 4453 1000]
	ElementLine [-12327 4453 -12327 -4453 1000]
	ElementLine [-12327 -4453 12327 -4453 1000]
	ElementLine [12327 -4453 12327 4453 1000]
	ElementLine [-2437 -4453 -2437 4453 1000]
)
