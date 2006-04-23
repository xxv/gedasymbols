# author: Levente Kovacs
# email: lekovacs@interware.hu
# dist-license: GPL 2
# use-license: unlimited

Element["" "" "X1" "" 195000 57500 0 0 0 100 ""]
(
	Pin[-10000 0 6000 4000 6000 2800 "" "1" "square,edge2"]
	Pin[10000 0 6000 4000 6000 2800 "" "2" "edge2"]
	ElementLine [-10000 -10000 10000 -10000 1000]
	ElementLine [-10000 10000 10000 10000 1000]
	ElementArc [-10000 0 10000 10000 270 90 1000]
	ElementArc [-10000 0 10000 10000 0 90 1000]
	ElementArc [10000 0 10000 10000 180 90 1000]
	ElementArc [10000 -1 10000 10000 90 90 1000]

	)
