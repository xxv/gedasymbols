# author: Amand Tihon
# email: amand.tihon@alrj.org
# dist-license: GPL3, http://www.gnu.org/licenses/gpl-3.0.txt
# use-license: unlimited


Element["" "" "Q000" "" 30000 30000 -20000 -20000 0 100 ""]
(
	Pin[0 -10000 8000 2000 8600 1500 "1" "1" ""]
	Pin[0 10000 8000 2000 8600 1500 "3" "3" ""]
	Pin[-10000 0 8000 2000 8600 1500 "2" "2" ""]
	ElementLine [13000 -13000 16000 -16000 1500]
	ElementLine [12000 -14000 15000 -17000 1500]
	ElementLine [14000 -12000 17000 -15000 1500]
	ElementLine [15000 -17000 17000 -15000 1500]
	ElementArc [0 0 18300 18300 0 360 1500]

	)
