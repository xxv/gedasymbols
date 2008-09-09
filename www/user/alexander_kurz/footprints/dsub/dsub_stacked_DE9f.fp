# $Id$
Element[0x0 "Stacke D-Sub SD9 Socket 2xSD9f" "X" "2SD9f" 26575 15000 5500 -16000 0 100 ""]
(
	# signal pins lower connector
	Pin[27087 21811 6600 3000 7000 4100 "1l" "1l" 0x101]
	Pin[27087 10905 6600 3000 7000 4100 "2l" "2l" 0x01]
	Pin[27087 0 6600 3000 7000 4100 "3l" "3l" 0x01]
	Pin[27087 -10905 6600 3000 7000 4100 "4l" "4l" 0x01]
	Pin[27087 -21811 6600 3000 7000 4100 "5l" "5l" 0x01]
	Pin[15905 16356 6600 3000 7000 4100 "6l" "6l" 0x01]
	Pin[15905 5452 6600 3000 7000 4100 "7l" "7l" 0x01]
	Pin[15905 -5452 6600 3000 7000 4100 "8l" "8l" 0x01]
	Pin[15905 -16356 6600 3000 7000 4100 "9l" "9l" 0x01]

	# signal pins lower connector
	Pin[54291 21811 6600 3000 7000 4100 "1u" "1u" 0x01]
	Pin[54291 10905 6600 3000 7000 4100 "2u" "2u" 0x01]
	Pin[54291 0 6600 3000 7000 4100 "3u" "3u" 0x01]
	Pin[54291 -10905 6600 3000 7000 4100 "4u" "4u" 0x01]
	Pin[54291 -21811 6600 3000 7000 4100 "5u" "5u" 0x01]
	Pin[43110 16356 6600 3000 7000 4100 "6u" "6u" 0x01]
	Pin[43110 5452 6600 3000 7000 4100 "7u" "7u" 0x01]
	Pin[43110 -5452 6600 3000 7000 4100 "8u" "8u" 0x01]
	Pin[43110 -16356 6600 3000 7000 4100 "9u" "9u" 0x01]

	# shield/mount connectors
	Pin[48701 49193 25000 3000 25600 12600 "" "M1" 0x01]
	Pin[48701 -49193 25000 3000 25600 12600 "" "M2" 0x01]
	# extra mount holes maybe used in some models
	Pin[15905 49193 25000 3000 25600 12600 "" "M3" 0x01]
	Pin[15905 -49193 25000 3000 25600 12600 "" "M4" 0x01]

	# the element box
	ElementLine [61457 60925 61457 -60925 2000]
	ElementLine [-15905 -60925 61457 -60925 2000]
	ElementLine [-15905 60925 61457 60925 2000]
	ElementLine [-15905 60925 -15905 -60925 2000]
	# helper lines
	ElementLine [-4685 -37461 61457 -37461 500]
	ElementLine [-4685 37461 61457 37461 500]
	ElementLine [-4685 60925 -4685 -60925 500]
	#
	Attribute("author" "Alexander Kurz")
	Attribute("copyright" "2008 Alexander Kurz")
	Attribute("use-license" "Unlimited")
	Attribute("dist-license" "CC-BY-SA-2.5")
	Attribute("height" "31.6mm")
	Attribute("ref" "tyco drawing no. C-1734285")
)
