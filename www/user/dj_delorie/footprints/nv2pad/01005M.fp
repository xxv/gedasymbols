Element["" "" "01005M" "" 0 0 -2000 -3500 0 23 ""]
(
	Pad[-1003 -20 -1003 20 1377 2000 1777 "" "1" "square"]
	Pad[1003 -20 1003 20 1377 2000 1777 "" "2" "square"]
	ElementLine [-2600 700 -2600 -700 600]
	ElementLine [2600 1600 -1700 1600 600]
	ElementLine [2600 -1600 2600 1600 600]
	ElementLine [-1700 -1600 2600 -1600 600]
	ElementArc [-1700 -700 900 900 270 90 600]
	ElementArc [-1700 700 900 900 0 90 600]

	Attribute("author" "DJ Delorie")
	Attribute("copyright" "2006 DJ Delorie")
	Attribute("use-license" "Unlimited")
	Attribute("dist-license" "GPL")
	)
