
	Element(0x00 "Description_Humid" "" "Humidity" 50 100 4 100 0x00)
(
	Pin(200 550 90 36 "D" 0x101)
	Pin(300 550 90 36 "G" 0x001)

	ElementLine(  0   0   0 600 15)
	ElementLine(  0 600 450 600 15)
	ElementLine(450 600 450   0 15)
	ElementLine(450   0   0   0 15)

	Mark(200 550)
	Attribute("author" "DJ Delorie")
	Attribute("copyright" "2006 DJ Delorie")
	Attribute("use-license" "Unlimited")
	Attribute("dist-license" "GPL")
	Attribute("description" "1wire humidity sensor module")
)

