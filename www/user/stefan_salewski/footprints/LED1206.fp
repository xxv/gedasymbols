# author: Stefan Salewski
# email: mail@ssalewski.de
# dist-license: GPL
# use-license: unlimited

# LED SMD 1206
Element[0x00000000 "LED1206" "" "" 0 0 -11827 -10953 0 100 0x00000000]
(
	Pad[-7874 0 -6890 0 5906 2000 7906 "1" "1" 0x00000100]
	Pad[6890 0 7874 0 5906 2000 7906 "2" "2" 0x00000100]
	ElementLine [11827 3953 -11827 3953 1000]
	ElementLine [-11827 3953 -11827 -3953 1000]
	ElementLine [-11827 -3953 11827 -3953 1000]
	ElementLine [11827 -3953 11827 3953 1000]
	ElementLine [-2937 -3953 -2937 3953 1000]
)
