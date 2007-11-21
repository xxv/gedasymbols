# release: pcb 20070912
# date:    Sun Oct  7 21:18:09 2007
# user:    kmk (Kai-Martin,,,)
# host:    kwak.localdomain

# To read pcb files, the pcb version (or the cvs source date) must be >= the file version
FileVersion[20070407]

PCB["" 160000 160000]

Grid[1000.000000 0 0 0]
Cursor[0 0 0.000000]
PolyArea[200000000.000000]
Thermal[0.500000]
DRC[600 1000 600 600 1500 1000]
Flags("nameonpcb,uniquename,clearnew,snappin")
Groups("1,c:2,s")
Styles["Signal,1000,3600,2000,1000:Power,2500,6000,3500,1000:Fat,4000,6000,3500,1000:Skinny,600,2402,1181,600"]


Element["" "" "" "" 7750 12750 0 0 0 100 ""]
(
	Pin[0 0 6000 2000 6600 4000 "1" "1" "square"]
	Pin[10000 0 6000 2000 6600 4000 "2" "2" ""]
	ElementLine [4000 -5000 4000 5000 1000]
	ElementLine [6000 -5000 6000 5000 1000]
	ElementLine [4000 0 3000 0 1000]
	ElementLine [6000 0 7000 0 1000]
	ElementLine [3000 -5000 3000 5000 1000]
	ElementLine [3000 -5000 4000 -5000 1000]
	ElementLine [3000 5000 4000 5000 1000]
	ElementLine [0 -8000 0 -4000 1000]
	ElementLine [-2000 -6000 2000 -6000 1000]
	ElementArc [5000 0 12000 12000 90 90 1500]
	ElementArc [5000 0 12000 12000 180 90 1500]
	ElementArc [5000 0 12000 12000 270 90 1500]
	ElementArc [5000 0 12000 12000 0 90 1500]

	)
Layer(1 "bottom")
(
)
Layer(2 "bott.-poly.")
(
)
Layer(3 "bott.-GND")
(
)
Layer(4 "top")
(
)
