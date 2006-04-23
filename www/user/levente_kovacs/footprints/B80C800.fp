# author: Levente Kovacs
# email: lekovacs@interware.hu
# dist-license: GPL 2
# use-license: unlimited

Element["" "" "BR1" "" 317500 242500 -2500 -12500 0 100 ""]
(
	Pin[0 -20000 7000 6000 7600 3500 "~" "2" ""]
	Pin[20000 -20000 7000 6000 7600 3500 "-" "4" ""]
	Pin[20000 0 7000 6000 7600 3500 "~" "3" ""]
	Pin[0 0 7000 6000 7600 3500 "+" "1" "square"]
	ElementArc [10000 -10000 20000 20000 270 90 1200]
	ElementArc [9999 -9999 20001 20001 180 90 1200]
	ElementArc [10000 -10000 20000 20000 90 90 1200]
	ElementArc [9999 -9999 19999 19999 0 90 1200]

	)
