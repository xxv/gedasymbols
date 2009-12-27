Element["" "DIP 6" "" "" 100000 100000 1000 1000 0 100 ""]
(
	Pin[0 0 8000 8800 8000 2500 "Pin_1" "1" "square"]
	Pin[0 10000 8000 8800 8000 2500 "Pin_2" "2" ""]
	Pin[0 20000 8000 8800 8000 2500 "Pin_3" "3" ""]
	Pin[30000 20000 8000 8800 8000 2500 "Pin_4" "4" ""]
	Pin[30000 10000 8000 8800 8000 2500 "Pin_5" "5" ""]
	Pin[30000 0 8000 8800 8000 2500 "Pin_6" "6" ""]
	ElementLine[-5000 -5000 10000 -5000 1000]
	ElementLine[-5000 -5000 -5000 25000 1000]
	ElementLine[-5000 25000 35000 25000 1000]
	ElementLine[35000 25000 35000 -5000 1000]
	ElementLine[35000 -5000 20000 -5000 1000]
	ElementArc[15000 -5000 5000 5000 0 180 1000]
	Attribute("author" "Cyril Hrubis; Created by pcb utils.")
	Attribute("copyright" "Cyril Hrubis")
	Attribute("dist-license" "GPLv2")
	Attribute("use-license" "Unlimited")
	Attribute("description" "DIP 6.")
)
