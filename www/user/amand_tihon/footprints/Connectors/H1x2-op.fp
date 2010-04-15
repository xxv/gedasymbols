# author: Amand Tihon
# email: amand.tihon@alrj.org
# dist-license: GPL3, http://www.gnu.org/licenses/gpl-3.0.txt
# use-license: unlimited

Element[ "" "1x2 pins header connector, DIP pin numbering, oval pads" "H000" "" 20000 10000 -7500 -2500 3 100 ""]
(
	Pin[0 -5000 6000 2000 6600 1500 "1" "1" "square"]
	Pad[-2500 -5000 2500 -5000 6000 2000 6600 "1" "1" "onsolder,square"]
	Pad[-2500 -5000 2500 -5000 6000 2000 6600 "1" "1" "square"]
	Pin[0 5000 6000 2000 6600 1500 "2" "2" ""]
	Pad[-2500 5000 2500 5000 6000 2000 6600 "2" "2" "onsolder"]
	Pad[-2500 5000 2500 5000 6000 2000 6600 "2" "2" ""]
	ElementLine[-2500 -10000 2500 -10000 1500]
	ElementLine[-5000 -7500 -5000 -2500 1500]
	ElementLine[-5000 -7500 -2500 -10000 1500]
	ElementLine[-5000 -2500 -2500 0 1500]
	ElementLine[-5000 2500 -5000 7500 1500]
	ElementLine[-5000 2500 -2500 0 1500]
	ElementLine[-5000 7500 -2500 10000 1500]
	ElementLine[5000 -7500 5000 -2500 1500]
	ElementLine[5000 -7500 2500 -10000 1500]
	ElementLine[5000 -2500 2500 0 1500]
	ElementLine[5000 2500 5000 7500 1500]
	ElementLine[5000 2500 2500 0 1500]
	ElementLine[5000 7500 2500 10000 1500]
	ElementLine[-2500 10000 2500 10000 1500]
)
