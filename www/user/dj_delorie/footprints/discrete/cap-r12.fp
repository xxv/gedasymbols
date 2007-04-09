Element["" "12.5mm radial cap" "" "" 226378 17716 -20000 7500 0 150 ""]
(
	Pin[0 0 10000 3500 10000 4000 "1+" "1" ""]
	Pin[0 20000 10000 3500 10000 4000 "2-" "2" ""]
	ElementLine [-12000 -4000 -12000 4000 1500]
	ElementLine [-16000 0 -8000 0 1500]
	ElementLine [12000 16000 12000 24000 1500]
	ElementArc [0 10000 25000 25000 270 360 1500]

	Attribute("description" "Radial capacitor, 12.5mm dia body")
	Attribute("author" "DJ Delorie")
	Attribute("copyright" "2006 DJ Delorie")
	Attribute("use-license" "Unlimited")
	Attribute("dist-license" "GPL")
)
