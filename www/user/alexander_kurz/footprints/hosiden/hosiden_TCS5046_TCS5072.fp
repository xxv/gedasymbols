# $Id$
Element[0x0 "Hosiden TCS5046/5072 13-pin Horizontal Socket" "X" "TCS5072" 0 0 0 -9500 0 100 ""]
(
	# signal pins
	Pin[62992 23425 7000 2000 7700 3543 "1" "1" 0x0]
	Pin[62992 13583 7000 2000 7700 3543 "2" "2" 0x0]
	Pin[62992 -6102 7000 2000 7700 3543 "3" "3" 0x0]
	Pin[62992 -15945 7000 2000 7700 3543 "4" "4" 0x0]
	Pin[55118 18504 7000 2000 7700 3543 "5" "5" 0x0]
	Pin[55118 8661 7000 2000 7700 3543 "6" "6" 0x0]
	Pin[55118 -1181 7000 2000 7700 3543 "7" "7" 0x0]
	Pin[55118 -11024 7000 2000 7700 3543 "8" "8" 0x0]
	Pin[47244 13583 7000 2000 7700 3543 "9" "9" 0x0]
	Pin[47244 3740 7000 2000 7700 3543 "10" "10" 0x0]
	Pin[47244 -6102 7000 2000 7700 3543 "11" "11" 0x0]
	Pin[47244 -15945 7000 2000 7700 3543 "12" "12" 0x0]
	Pin[39370 -1181 7000 2000 7700 3543 "13" "13" 0x0]

	# shield connectors for TCS5046
	Pin[0 19685 10000 2000 11000 5512 "" "M1" 0x0]
	Pin[0 -19685 10000 2000 11000 5512 "" "M2" 0x0]
	# shield connectors for TCS5077
	Pin[9843 9843 10000 2000 11000 5512 "" "M3" 0x0]
	Pin[9843 -9843 10000 2000 11000 5512 "" "M4" 0x0]

	# simple element box from data sheet
	ElementLine [-9843 38386 -9843 -38386 2000]
	ElementLine [68898 38386 68898 -38386 2000]
	ElementLine [-9843 -38386 68898 -38386 2000]
	ElementLine [-9843 38386 68898 38386 2000]
	ElementLine [0 38386 0 -38386 500]
	#
	Attribute("author" "Alexander Kurz")
	Attribute("copyright" "2008 Alexander Kurz")
	Attribute("use-license" "Unlimited")
	Attribute("dist-license" "CC-BY-SA-3.0")
	Attribute("height" "17mm")
	Attribute("ref" "www.hosiden.co.jp/web/english/web/products/pdf/e_c04_maru.pdf")
)
