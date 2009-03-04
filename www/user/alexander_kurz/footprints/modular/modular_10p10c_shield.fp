# $Id$
Element[0x0 "Low Profile Shielded Modular 10p10c Connector AKA RJ50" "X" "RJ50" 26575 15000 -9843 -9500 0 100 ""]
(
	# signal pins
	Pin[35000 -22500 7000 2000 7500 3000 "1" "1" 0x0]
	Pin[25000 -17500 7000 2000 7500 3000 "2" "2" 0x0]
	Pin[35000 -12500 7000 2000 7500 3000 "3" "3" 0x0]
	Pin[25000 -7500 7000 2000 7500 3000 "4" "4" 0x0]
	Pin[35000 -2500 7000 2000 7500 3000 "5" "5" 0x0]
	Pin[25000 2500 7000 2000 7500 3000 "6" "6" 0x0]
	Pin[35000 7500 7000 2000 7500 3000 "7" "7" 0x0]
	Pin[25000 12500 7000 2000 7500 3000 "8" "8" 0x0]
	Pin[35000 17500 7000 2000 7500 3000 "9" "9" 0x0]
	Pin[25000 22500 7000 2000 7500 3000 "10" "10" 0x0]
        # shield pins
        Pin[12000 -30500 11000 3000 11500 6200 "M1" "11" 0x0]
        Pin[12000 30500 11000 3000 11500 6200 "M2" "12" 0x0]
        Pin[-12000 -30500 11000 3000 11500 6200 "M3" "13" 0x0]
        Pin[-12000 30500 11000 3000 11500 6200 "M4" "14" 0x0]
	# mount holes
	Pin[0 -22500 12800 2000 13000 12800 "" "" 0x0]
	Pin[0 22500 12800 2000 13000 12800 "" "" 0x0]
	# the element box
	ElementLine [-31000 30000 40300 30000 2000]
	ElementLine [-31000 -30000 40300 -30000 2000]
	ElementLine [40300 -30000 40300 30000 2000]
	ElementLine [-31000 -30000 -31020 30000 2000]
	#
	Attribute("author" "Alexander Kurz")
	Attribute("copyright" "2009 Alexander Kurz")
	Attribute("use-license" "Unlimited")
	Attribute("dist-license" "CC-BY-SA-3.0")
	Attribute("height" "11.5mm")
	Attribute("ref" "Tyco Electronics Drawing No C-5406299")
	)
