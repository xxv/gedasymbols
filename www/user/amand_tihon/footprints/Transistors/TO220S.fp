# author: Amand Tihon
# email: amand.tihon@alrj.org
# dist-license: GPL3, http://www.gnu.org/licenses/gpl-3.0.txt
# use-license: unlimited


Element["" "" "Q000" "" 42500 37500 -2500 10000 0 100 ""]
(
	Pin[-10000 0 9000 2000 9600 1500 "1" "1" "edge2"]
	Pin[0 0 9000 2000 9600 1500 "2" "2" "edge2"]
	Pin[10000 0 9000 2000 9600 1500 "3" "3" "edge2"]
	ElementLine [-20000 -10000 20000 -10000 1500]
	ElementLine [-20000 -5000 20000 -5000 1500]
	ElementLine [-20000 -10000 -20000 7500 1500]
	ElementLine [-20000 7500 20000 7500 1500]
	ElementLine [20000 7500 20000 -10000 1500]

	)
