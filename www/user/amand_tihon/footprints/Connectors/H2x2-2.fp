# author: Amand Tihon
# email: amand.tihon@alrj.org
# dist-license: GPL3, http://www.gnu.org/licenses/gpl-3.0.txt
# use-license: unlimited

Element[ "" "2x2 pins header connector, ribbon cable numbering" "H000" "" 20000 15000 -12500 -2500 3 100 ""]
(
	Pin[-5000 -5000 8000 2000 8800 1500 "1" "1" "square"]
	Pin[-5000 5000 8000 2000 8800 1500 "3" "3" ""]
	Pin[5000 -5000 8000 2000 8800 1500 "2" "2" ""]
	Pin[5000 5000 8000 2000 8800 1500 "4" "4" ""]
	ElementLine[-7500 -10000 7500 -10000 1500]
	ElementLine[-10000 -7500 -10000 -2500 1500]
	ElementLine[-10000 -7500 -7500 -10000 1500]
	ElementLine[-10000 -2500 -7500 0 1500]
	ElementLine[-10000 2500 -10000 7500 1500]
	ElementLine[-10000 2500 -7500 0 1500]
	ElementLine[-10000 7500 -7500 10000 1500]
	ElementLine[10000 -7500 10000 -2500 1500]
	ElementLine[10000 -7500 7500 -10000 1500]
	ElementLine[10000 -2500 7500 0 1500]
	ElementLine[10000 2500 10000 7500 1500]
	ElementLine[10000 2500 7500 0 1500]
	ElementLine[10000 7500 7500 10000 1500]
	ElementLine[-7500 10000 7500 10000 1500]
)
