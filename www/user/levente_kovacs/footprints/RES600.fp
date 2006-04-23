# author: Levente Kovacs
# email: lekovacs@interware.hu
# dist-license: GPL 2
# use-license: unlimited

Element["" "resistor_axial" "R1" "600" 255000 265000 -2500 -10000 1 100 ""]
(
	Pin[0 15000 8000 3000 8000 4200 "1" "1" "square"]
	Pin[0 -45000 8000 3000 8000 4200 "2" "2" ""]
	ElementLine [-5000 0 5000 0 1000]
	ElementLine [5000 -30000 5000 0 1000]
	ElementLine [-5000 -30000 5000 -30000 1000]
	ElementLine [-5000 -30000 -5000 0 1000]
	ElementLine [0 -45000 0 -30000 1000]
	ElementLine [0 0 0 15000 1000]

	)
