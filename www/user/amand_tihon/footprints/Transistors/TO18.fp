# author: Amand Tihon
# email: amand.tihon@alrj.org
# dist-license: GPL3, http://www.gnu.org/licenses/gpl-3.0.txt
# use-license: unlimited


Element["" "" "Q000" "" 40000 55000 -15000 -15000 0 100 ""]
(
	Pin[0 -5000 6000 2000 6600 1500 "1" "1" ""]
	Pin[0 5000 6000 2000 6600 1500 "3" "3" ""]
	Pin[-5000 0 6000 2000 6600 1500 "2" "2" ""]
	ElementLine [7500 -7500 10000 -10000 1500]
	ElementLine [9000 -11000 6500 -8500 1500]
	ElementLine [11000 -9000 8500 -6500 1500]
	ElementLine [9000 -11000 11000 -9000 1500]
	ElementArc [0 0 10000 10000 0 360 1500]

	)
