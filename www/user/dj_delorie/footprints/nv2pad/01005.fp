
Element["" "01005" "C?" "" 0 0 3500 -1700 0 56 ""]
(
	Pad[1003 -20 1003 20 1377 2000 1677 "" "2" "square"]
	Pad[-1003 -20 -1003 20 1377 2000 1677 "" "1" "square"]
	ElementLine [-1700 -1400 2400 -1400 600]
	ElementLine [2400 -1400 2400 1400 600]
	ElementLine [2400 1400 -1700 1400 600]
	ElementLine [-2400 700 -2400 -700 600]
	ElementArc [-1700 700 700 700 0 90 600]
	ElementArc [-1700 -700 700 700 270 90 600]

	Attribute("author" "DJ Delorie")
	Attribute("copyright" "2006 DJ Delorie")
	Attribute("use-license" "Unlimited")
	Attribute("dist-license" "GPL")
	)
