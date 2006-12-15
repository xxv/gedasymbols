Element["" "" "0805N" "" 0 0 -700 1700 1 23 ""]
(
	Pad[3543 -393 3543 393 5118 2000 5918 "" "2" "square"]
	Pad[-3543 -393 -3543 393 5118 2000 5918 "" "1" "square"]
	ElementLine [-7100 3000 -7100 -3000 1000]
	ElementLine [7100 4000 -6100 4000 1000]
	ElementLine [7100 -4000 7100 4000 1000]
	ElementLine [-6100 -4000 7100 -4000 1000]
	ElementArc [-6100 3000 1000 1000 0 90 1000]
	ElementArc [-6100 -3000 1000 1000 270 90 1000]

	Attribute("author" "DJ Delorie")
	Attribute("copyright" "2006 DJ Delorie")
	Attribute("use-license" "Unlimited")
	Attribute("dist-license" "GPL")
	Attribute("description" "0805 SMD, normal size")
	)
