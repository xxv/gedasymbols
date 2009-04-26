# $Id$
Element[0x0 "RFT/Robotron EFS10m Socket" "X?" "EFS10m" 26575 15000 5500 -16000 0 100 ""]
(
	# signal pins
	Pin[19685 -19685 6600 3000 6600 2756 "A1" "A1" 0x101]
	Pin[19685 -9843 6600 3000 6600 2756 "A2" "A2" 0x01]
	Pin[19685 0 6600 3000 6600 2756 "A3" "A3" 0x01]
	Pin[19685 9843 6600 3000 6600 2756 "A4" "A4" 0x01]
	Pin[19685 19685 6600 3000 6600 2756 "A5" "A5" 0x01]
	Pin[39370 -19685 6600 3000 6600 2756 "B1" "B1" 0x01]
	Pin[39370 -9843 6600 3000 6600 2756 "B2" "B2" 0x01]
	Pin[39370 0 6600 3000 6600 2756 "B3" "B3" 0x01]
	Pin[39370 9843 6600 3000 6600 2756 "B4" "B4" 0x01]
	Pin[39370 19685 6600 3000 6600 2756 "B5" "B5" 0x01]
	# shield/mount connectors
	Pin[0 48720 19685 4000 23622 11811 "" "M1" 0x01]
	Pin[0 -48720 19685 4000 23622 11811 "" "M2" 0x01]
	# the element box
	ElementLine [-49213 33858 -49213 -33858 2000]
	ElementLine [-49213 33858 -29528 33858 2000]
	ElementLine [-49213 -33858 -29528 -33858 2000]
	ElementLine [-29528 -54134 -29528 -33858 2000]
	ElementLine [-29528 54134 -29528 33858 2000]
	ElementLine [-29528 54134 -9843 54134 2000]
	ElementLine [-29528 -54134 -9843 -54134 2000]
	ElementLine [-9843 54134 -9843 58071 2000]
	ElementLine [-9843 -54134 -9843 -58071 2000]
	ElementLine [-9843 58071 9843 58071 2000]
	ElementLine [-9843 -58071 9843 -58071 2000]
	ElementLine [9843 58071 9843 -58071 2000]
	# helper lines
	ElementLine [9843 39370 -9843 39370 2000]
	ElementLine [9843 -39370 -9843 -39370 2000]
	ElementLine [-9843 39370 -9843 54134 2000]
	ElementLine [-9843 -39370 -9843 -54134 2000]
	# more helper lines
	ElementLine [-49213 29035 -21654 29035 2000]
	ElementLine [-49213 -29035 -21654 -29035 2000]
	ElementLine [-21654 29035 -21654 -29035 2000]
	ElementLine [-49213 4921 -21654 4921 2000]
	ElementLine [-49213 14768 -21654 14768 2000]
	#
	Attribute("author" "Alexander Kurz")
	Attribute("copyright" "2008 Alexander Kurz")
	Attribute("use-license" "Unlimited")
	Attribute("dist-license" "CC-BY-SA-3.0")
	Attribute("height" "8.6mm")
)
