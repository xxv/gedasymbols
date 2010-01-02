# author:  Vanessa Ezekowitz
# email: vanessaezekowitz@gmail.com
# dist-license: GPL
# use-license: unlimited

Element["" "MXD1000_DIL" "Maxim MXD1000" "" 106000 378000 -6000 36500 0 100 ""]
(
	Pin[0 0 6049 1998 6649 2799 "Signal In" "1" "square"]
	Pin[0 10000 6049 1998 6649 2799 "Tap 2" "2" ""]
	Pin[0 20000 6049 1998 6649 2799 "Tap 4" "3" ""]
	Pin[0 30000 6049 1998 6649 2799 "GND" "4" ""]
	Pin[30000 0 6049 1998 6649 2799 "Vcc" "8" ""]
	Pin[30000 10000 6049 1998 6649 2799 "Tap 1" "7" ""]
	Pin[30000 20000 6049 1998 6649 2799 "Tap 3" "6" ""]
	Pin[30000 30000 6049 1998 6649 2799 "Tap 5" "5" ""]
	ElementLine [-5000 -5000 -5000 35000 1000]
	ElementLine [-5000 35000 35000 35000 1000]
	ElementLine [35000 35000 35000 -5000 1000]
	ElementLine [-5000 -5000 10000 -5000 1000]
	ElementLine [20000 -5000 35000 -5000 1000]
	ElementArc [15000 -5000 5000 5000 0 180 1000]

	)
