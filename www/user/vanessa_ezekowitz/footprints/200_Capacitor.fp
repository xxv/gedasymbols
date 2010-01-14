# author:  Vanessa Ezekowitz
# email: vanessaezekowitz@gmail.com
# dist-license: GPL
# use-license: unlimited

Element["" "200_Capacitor" "" "" 260000 70000 0 0 0 100 ""]
(
	Pin[0 -20000 6000 2000 6600 2800 "" "2" ""]
	Pin[0 0 6000 2000 6600 2800 "" "1" ""]
	ElementLine [-5000 -20000 -5000 0 600]
	ElementLine [5000 -20000 5000 0 600]
	ElementArc [-1 -20000 5000 5000 270 90 600]
	ElementArc [-2 -19998 5002 5002 180 90 600]
	ElementArc [0 0 5000 5000 90 90 600]
	ElementArc [-1 1 4999 4999 0 90 600]

	)
