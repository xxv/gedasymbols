# $Id$
Element[0x0 "LC/LW005 DC-DC converters" "DCDC" "DCDC" 26575 5000 -5500 -18000 0 100 ""]
(
	# Pins
	Pin[10000 -40000 8500 2500 9000 3125 "1" "1" 0x101]
	Pin[-10000 -40000 8500 2500 9000 3125 "2" "2" 0x1]
	Pin[40000 -40000 8500 2500 9000 3125 "3" "3" 0x1]
	Pin[-40000 40000 8500 2500 9000 3125 "4" "4" 0x1]
	Pin[40000 40000 8500 2500 9000 3125 "5" "5" 0x1]

	# the element box
	ElementLine [50000 63000 50000 -63000 1000]
	ElementLine [-50000 63000 -50000 -63000 1000]
	ElementLine [50000 63000 -50000 63000 1000]
	ElementLine [50000 -63000 -50000 -63000 1000]

	#
	Attribute("author" "Alexander Kurz")
	Attribute("copyright" "2009 Alexander Kurz")
	Attribute("use-license" "Unlimited")
	Attribute("dist-license" "CC-BY-SA-3.0")
	Attribute("height" "10.16mm")
	)
