# author: David Ludovino
# email: david.ludovino@gmail.com
# description: 0.25 W resistor with 10 mm long leads
# dist-license: GPL 3
# use-license: unlimited
Element["" "" "" "" 391632 140712 0 0 0 100 ""]
(
	Pin[-50184 0 6800 3000 7400 3800 "" "1" 0x00000101]
	Pin[50929 33 6800 3000 7400 3800 "" "2" "edge2"]
	ElementLine [-10160 -5000 9840 -5000 2000]
	ElementLine [9840 -5000 9840 5000 2000]
	ElementLine [-10160 5000 9840 5000 2000]
	ElementLine [-10160 -5000 -10160 5000 2000]
	ElementLine [-50184 0 -10160 0 2500]
	ElementLine [9840 0 50896 0 2500]
)
