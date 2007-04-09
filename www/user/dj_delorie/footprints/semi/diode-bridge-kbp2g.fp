Element["" "" "" "" 80000 115000 0 -17500 0 100 ""]
(
	Pin[0 0 11500 2000 12100 4500 "+" "1" "edge2"]
	Pin[15000 0 11500 2000 12100 4500 "~" "2" "edge2"]
	Pin[30000 0 11500 2000 12100 4500 "~" "3" "edge2"]
	Pin[45000 0 11500 2000 12100 4500 "-" "4" "edge2"]
	ElementLine [-7500 7500 52500 7500 1000]
	ElementLine [-7500 -10000 -7500 7500 1000]
	ElementLine [-7500 -10000 52500 -10000 1000]
	ElementLine [52500 -10000 52500 7500 1000]
	ElementLine [-7500 -2500 0 -10000 1000]

	Attribute("description" "Bridge Rectifier, +~~-")
	Attribute("author" "DJ Delorie")
	Attribute("copyright" "2006 DJ Delorie")
	Attribute("use-license" "Unlimited")
	Attribute("dist-license" "GPL")
)
