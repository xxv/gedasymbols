# $Id$
Element[0x0 "RFT/Robotron EFS6f Socket" "X?" "EFS6f" 26575 15000 5500 -16000 0 100 ""]
(
	# signal pins
	Pin[19685 4921 6600 3000 6600 2756 "A1" "A1" 0x101]
	Pin[19685 -4921 6600 3000 6600 2756 "A2" "A2" 0x01]
	Pin[29528 4921 6600 3000 6600 2756 "B1" "B1" 0x01]
	Pin[29528 -4921 6600 3000 6600 2756 "B2" "B2" 0x01]
	Pin[39370 4921 6600 3000 6600 2756 "C1" "C1" 0x01]
	Pin[39370 -4921 6600 3000 6600 2756 "C2" "C2" 0x01]
	# shield/mount connectors
	Pin[19685 19488 14960 4000 16000 7875 "" "M1" 0x01]
	Pin[19685 -19488 14960 4000 16000 7875 "" "M2" 0x01]
	# the element box
	ElementLine [-40944 -7027 -40944 7027 2000]
	ElementLine [-37007 10965 -40944 7027 2000]
	ElementLine [-37007 -10965 -40944 -7027 2000]
	ElementLine [-9843 10965 -37007 10965 2000]
	ElementLine [-9843 -10965 -37007 -10965 2000]
	ElementLine [-9843 10965 -9843 25925 2000]
	ElementLine [-9843 -10965 -9843 -25925 2000]
	ElementLine [-9843 25925 9843 25925 2000]
	ElementLine [-9843 -25925 9843 -25925 2000]
	ElementLine [9843 25925 9843 29232 2000]
	ElementLine [9843 -25925 9843 -29232 2000]
	ElementLine [9843 29232 29094 29232 2000]
	ElementLine [9843 -29232 29094 -29232 2000]
	ElementLine [29094 10965 29094 28996 2000]
	ElementLine [29094 -10965 29094 -28996 2000]
	ElementLine [29094 10965 9843 10965 2000]
	ElementLine [29094 -10965 9843 -10965 2000]
	ElementLine [9843 10965 9843 -10965 2000]
	# helper lines: mount elements
	ElementLine [-9843 13150 9843 13150 1000]
	ElementLine [-9843 -13150 9843 -13150 1000]
	ElementLine [9843 13150 9843 10965 1000]
	ElementLine [9843 -13150 9843 -10965 1000]
	#
	Attribute("author" "Alexander Kurz")
	Attribute("copyright" "2008 Alexander Kurz")
	Attribute("use-license" "Unlimited")
	Attribute("dist-license" "CC-BY-SA-3.0")
	Attribute("height" "10.95mm")
)
