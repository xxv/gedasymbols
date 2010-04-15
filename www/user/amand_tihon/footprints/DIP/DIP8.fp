# author: Amand Tihon
# email: amand.tihon@alrj.org
# dist-license: GPL3, http://www.gnu.org/licenses/gpl-3.0.txt
# use-license: unlimited

Element[ "" "8-pins Dual in-line package, narrow (300 mil)" "U000" "" 20000 150000 -5000 -30000 0 100 ""]
(
	Pin[-15000 -15000 8000 2000 8800 1500 "1" "1" "square"]
	Pin[-15000 -5000 8000 2000 8800 1500 "2" "2" ""]
	Pin[-15000 5000 8000 2000 8800 1500 "3" "3" ""]
	Pin[-15000 15000 8000 2000 8800 1500 "4" "4" ""]
	Pin[15000 15000 8000 2000 8800 1500 "5" "5" ""]
	Pin[15000 5000 8000 2000 8800 1500 "6" "6" ""]
	Pin[15000 -5000 8000 2000 8800 1500 "7" "7" ""]
	Pin[15000 -15000 8000 2000 8800 1500 "8" "8" ""]
	ElementLine[-12500 -22500 -5000 -22500 1500]
	ElementLine[5000 -22500 12500 -22500 1500]
	ElementLine[-12500 -22500 -12500 22500 1500]
	ElementLine[-12500 22500 12500 22500 1500]
	ElementLine[12500 -22500 12500 22500 1500]
	ElementArc[0 -22500 5000 5000 0 180 1500]
)
