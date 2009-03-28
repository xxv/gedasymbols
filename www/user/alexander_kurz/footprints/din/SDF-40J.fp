# $Id$
Element[0x0 "SDF-40J Standard circular Connectow with Shield 4-Pin-DIN 68-deg" "X" "DIN-4-68deg" 26575 15000 -9843 -9500 0 100 ""]
(
	# signal pins
	Pin[19685 19685 10000 2000 12000 5000 "1" "1" 0x0]
	Pin[19685 -19685 10000 2000 12000 5000 "4" "4" 0x0]
	Pin[29527 9843 10000 2000 12000 5000 "2" "2" 0x0]
	Pin[29527 -9843 10000 2000 12000 5000 "3" "3" 0x0]
	# shield connectors
	Pin[-19685 -9843 10000 2000 12000 5000 "" "M1" 0x0]
	Pin[-19685 9843 10000 2000 12000 5000 "" "M2" 0x0]
	# mount holes
	Pin[0 -29528 9500 2000 12000 9000 "" "" 0x0]
	Pin[0 29528 9500 2000 12000 9000 "" "" 0x0]
	# simple element box from data sheet
	ElementLine [39370 41732 39370 -41732 2000]
	ElementLine [-29528 -41732 39370 -41732 2000]
	ElementLine [-29528 41732 39370 41732 2000]
	ElementLine [-29528 41732 -29528 -41732 2000]
	ElementLine [-24528 41732 -24528 -41732 500]
	#
	Attribute("author" "Alexander Kurz")
	Attribute("copyright" "2008 Alexander Kurz")
	Attribute("use-license" "Unlimited")
	Attribute("dist-license" "CC-BY-SA-3.0")
	Attribute("height" "21.4mm")
	Attribute("ref" "CUI INC Standard circular Conn w/Shield Part No SDF-40J http://www.cui.com/pdffiles/SDF-40J.pdf")
)
