Element["" "" "01005N" "" 0 0 -2100 -3300 0 23 ""]
(
	Pad[-800 0 -800 38 984 2000 1384 "" "1" "square,edge2"]
	Pad[814 0 814 38 984 2000 1384 "" "2" "square,edge2"]
	ElementLine [-2200 500 -2200 -500 600]
	ElementLine [2200 1400 -1300 1400 600]
	ElementLine [2200 -1400 2200 1400 600]
	ElementLine [-1300 -1400 2200 -1400 600]
	ElementArc [-1300 500 900 900 0 90 600]
	ElementArc [-1300 -500 900 900 270 90 600]

	Attribute("author" "DJ Delorie")
	Attribute("copyright" "2006 DJ Delorie")
	Attribute("use-license" "Unlimited")
	Attribute("dist-license" "GPL")
	)
