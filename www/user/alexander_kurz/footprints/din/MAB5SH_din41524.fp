# $Id$
Element[0x0 "Hirschmann MAB 5 SH DIN 41524 Horizontal Socket" "Ux" "DIN41524" 26575 15000 -9843 -9500 0 100 ""]
(
	# signal pins
	Pin[19685 29528 10000 2000 12000 5000 "1" "1" 0x0]
	Pin[19685 0 10000 2000 12000 5000 "2" "2" 0x0]
	Pin[19685 -29528 10000 2000 12000 5000 "3" "3" 0x0]
	Pin[29527 19685 10000 2000 12000 5000 "4" "4" 0x0]
	Pin[29527 -19685 10000 2000 12000 5000 "5" "5" 0x0]
	# shield connectors
	Pin[-19685 -9843 10000 2000 12000 5000 "" "M1" 0x0]
	Pin[-19685 9843 10000 2000 12000 5000 "" "M2" 0x0]
	# mount holes
	Pin[0 -29528 9500 2000 12000 9000 "" "" 0x0]
	Pin[0 29528 9500 2000 12000 9000 "" "" 0x0]
	# simple element box from data sheet
#	ElementLine [-29528 41732 -29528 -41732 2000]
#	ElementLine [34252 41732 34252 -41732 2000]
#	ElementLine [-29528 -41732 34252 -41732 2000]
#	ElementLine [-29528 41732 34252 41732 2000]
#	ElementLine [-24528 41732 -24528 -41732 500]
	# measured element box
	ElementLine [-29528 41732 -29528 -41732 2000]
	ElementLine [-29528 -41732 -21654 -41732 2000]
	ElementLine [-29528 41732 -21654 41732 2000]
	ElementLine [-21654 41732 -21654 35433 2000]
	ElementLine [-21654 -41732 -21654 -35433 2000]
	ElementLine [-21654 35433 25590 35433 2000]
	ElementLine [-21654 -35433 25590 -35433 2000]
	ElementLine [25590 35433 25590 25590 2000]
	ElementLine [25590 -35433 25590 -25590 2000]
	ElementLine [25590 25590 34252 25590 2000]
	ElementLine [25590 -25590 34252 -25590 2000]
	ElementLine [34252 25590 34252 -25590 2000]
	#
	Attribute("author" "Alexander Kurz")
	Attribute("copyright" "2008 Alexander Kurz")
	Attribute("use-license" "Unlimited")
	Attribute("dist-license" "CC-BY-SA-2.5")
	Attribute("height" "19mm")
	Attribute("ref" "http://www.hirschmann.de")
)
