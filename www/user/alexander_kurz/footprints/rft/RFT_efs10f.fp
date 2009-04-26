# $Id$
Element[0x0 "RFT/Robotron EFS10f Socket" "X?" "EFS10f" 26575 15000 5500 -16000 0 100 ""]
(
	# signal pins
	Pin[19685 19685 6600 3000 6600 2756 "A1" "A1" 0x101]
	Pin[19685 9843 6600 3000 6600 2756 "A2" "A2" 0x01]
	Pin[19685 0 6600 3000 6600 2756 "A3" "A3" 0x01]
	Pin[19685 -9843 6600 3000 6600 2756 "A4" "A4" 0x01]
	Pin[19685 -19685 6600 3000 6600 2756 "A5" "A5" 0x01]
	Pin[39370 19685 6600 3000 6600 2756 "B1" "B1" 0x01]
	Pin[39370 9843 6600 3000 6600 2756 "B2" "B2" 0x01]
	Pin[39370 0 6600 3000 6600 2756 "B3" "B3" 0x01]
	Pin[39370 -9843 6600 3000 6600 2756 "B4" "B4" 0x01]
	Pin[39370 -19685 6600 3000 6600 2756 "B5" "B5" 0x01]
	# shield/mount connectors
	Pin[0 49213 19685 4000 23622 11811 "" "M1" 0x01]
	Pin[0 -49213 19685 4000 23622 11811 "" "M2" 0x01]
	# the element box
	ElementLine [-35433 -23622 -35433 23622 2000]
	ElementLine [-30925 27953 -35433 23622 2000]
	ElementLine [-30925 -27953 -35433 -23622 2000]
	ElementLine [-21653 27953 -30925 27953 2000]
	ElementLine [-21653 -27953 -30925 -27953 2000]
	ElementLine [-21653 30925 -21653 27953 2000]
	ElementLine [-21653 -30925 -21653 -27953 2000]
	ElementLine [-25590 35433 -21653 30925 2000]
	ElementLine [-25590 -35433 -21653 -30925 2000]
	ElementLine [-25590 51181 -25590 35433 2000]
	ElementLine [-25590 -51181 -25590 -35433 2000]
	ElementLine [-9843 51181 -25590 51181 2000]
	ElementLine [-9843 -51181 -25590 -51181 2000]
	ElementLine [-9843 59055 9843 59055 2000]
	ElementLine [-9843 -59055 9843 -59055 2000]
	ElementLine [9843 59055 9843 -59055 2000]
	# helper lines: mount elements
	ElementLine [9843 39370 -9843 39370 2000]
	ElementLine [9843 -39370 -9843 -39370 2000]
	ElementLine [-9843 39370 -9843 59055 2000]
	ElementLine [-9843 -39370 -9843 -59055 2000]
	# helper lines
	ElementLine [-9843 27953 -21653 27953 1000]
	ElementLine [-9843 -27953 -21653 -27953 1000]
	ElementLine [-9843 -30925 -9843 30925 1000]
	ElementLine [-9843 -30925 -21653 -30925 1000]
	ElementLine [-9843 30925 -21653 30925 1000]
	# more helper lines
	ElementLine [-9843 -4921 -35433 -4921 1000]
	ElementLine [-9843 -14768 -35433 -14768 1000]
	#
	Attribute("author" "Alexander Kurz")
	Attribute("copyright" "2009 Alexander Kurz")
	Attribute("use-license" "Unlimited")
	Attribute("dist-license" "CC-BY-SA-3.0")
	Attribute("height" "8.5mm")
)
