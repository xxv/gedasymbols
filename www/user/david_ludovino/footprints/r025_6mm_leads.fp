# author: David Ludovino
# email: david.ludovino@gmail.com
# description: 0.25 W resistor with 6 mm long leads
# dist-license: GPL 3
# use-license: unlimited
Element["" "" "" "" 376872 123984 0 0 0 100 ""]
(
	Pin[-35424 0 6800 3000 7400 3800 "" "1" 0x00000101]
	Pin[31488 0 6800 3000 7400 3800 "" "2" "edge2"]
	ElementLine [-9580 -4958 10420 -4958 2000]
	ElementLine [10420 -4958 10420 5042 2000]
	ElementLine [10420 5042 -9580 5042 2000]
	ElementLine [-9580 5042 -9580 -4958 2000]
	ElementLine [-9580 0 -35424 0 2500]
	ElementLine [10420 0 31488 0 2500]
)
