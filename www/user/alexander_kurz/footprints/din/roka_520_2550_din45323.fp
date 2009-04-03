# $Id$
Element[0x0 "ROKA DIN 45323 520 2550" "X" "ROKA-DIN45323" 26575 15000 -9843 -9500 0 100 ""]
(
	# pins
	Pin[0 19685 10000 2000 12000 5500 "1" "1" 0x0]
	Pin[0 -19685 10000 2000 12000 5500 "2" "2" 0x0]
	Pin[24606 0 10000 2000 12000 5500 "3" "3" 0x0]
	Pin[39370 0 10000 2000 12000 5500 "4" "4" 0x0]
	# element box
	ElementLine [-19685 23622 -19685 -23622 2000]
	ElementLine [47244 23622 47244 -23622 2000]
	ElementLine [-19685 23622 47244 23622 2000]
	ElementLine [-19685 -23622 47244 -23622 2000]
	# helper lines
	ElementLine [-19685 12992 24606 12992 500]
	ElementLine [-19685 -12992 24606 -12992 500]
	ElementLine [24606 12992 24606 -12992 500]
	ElementLine [0 3740 24606 3740 500]
	ElementLine [0 -3740 24606 -3740 500]
	ElementArc[0 0 3740 3740 270 180 500]
	#
	Attribute("author" "Alexander Kurz")
	Attribute("copyright" "2008 Alexander Kurz")
	Attribute("use-license" "Unlimited")
	Attribute("dist-license" "CC-BY-SA-3.0")
	Attribute("height" "14mm")
	Attribute("ref" "http://roka-fakra-connector.com/strom-bux-5202550-gesamt.htm")
)
