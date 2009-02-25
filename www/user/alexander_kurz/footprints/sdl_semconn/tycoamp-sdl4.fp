# $Id$
Element[0x0 "Tyco Amp SDL 4 connector" "X" "SDL4" 26575 15000 5500 -16000 0 100 ""]
(
	# signal pins
	Pin[49700 7000 7500 3000 8000 3700 "1" "1" 0x01]
	Pin[39700 2000 7500 3000 8000 3700 "2" "2" 0x01]
	Pin[49700 -2000 7500 3000 8000 3700 "3" "3" 0x01]
	Pin[39700 -7000 7500 3000 8000 3700 "4" "4" 0x01]

	# mount pins
	Pin[27200 42500 22000 3000 22500 13600 "C1" "5" 0x01]
	Pin[27200 -42500 22000 3000 22500 13600 "C2" "6" 0x01]
	Pin[27200 22500 15000 3000 15000 13600 "C3" "7" 0x01]
	Pin[27200 -22500 15000 3000 15000 13600 "C4" "8" 0x01]
	Pin[15200 53650 11000 3000 11500 6000 "C5" "9" 0x01] 
	Pin[15200 -53650 11000 3000 11500 6000 "C6" "10" 0x01] 

	# helper lines
	ElementLine [-12500 -31500 -12500 31500 2000]
	ElementLine [-12500 -31500 0 -31500 2000]
	ElementLine [-12500 31500 0 31500 2000]
	# the element box
	ElementLine [0 -55000 0 55000 2000]
	ElementLine [0 55000 10500 55000 2000]
	ElementLine [0 -55000 10500 -55000 2000]
	ElementLine [10500 55000 10500 52500 2000]
	ElementLine [10500 -55000 10500 -52500 2000]
	ElementLine [10500 52500 40000 52500 2000]
	ElementLine [10500 -52500 40000 -52500 2000]
	ElementLine [40000 52500 40000 31500 2000]
	ElementLine [40000 -52500 40000 -31500 2000]
	ElementLine [40000 31500 53000 31500 2000]
	ElementLine [40000 -31500 53000 -31500 2000]
	ElementLine [53000 31500 53000 -31500 2000]
	# helper lines
	ElementLine [10500 52500 10500 31500 500]
	ElementLine [10500 -52500 10500 -31500 500]
	ElementLine [10500 31500 40000 31500 500]
	ElementLine [10500 -31500 40000 -31500 500]
	#
	Attribute("author" "Alexander Kurz")
	Attribute("copyright" "2008 Alexander Kurz")
	Attribute("use-license" "Unlimited")
	Attribute("dist-license" "CC-BY-SA-2.5")
	Attribute("height" "13.6mm")
	Attribute("ref" "tyco drawing ENG_CD_1761199_A2.pdf")
)
