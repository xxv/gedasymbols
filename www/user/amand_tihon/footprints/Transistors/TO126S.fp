# author: Amand Tihon
# email: amand.tihon@alrj.org
# dist-license: GPL3, http://www.gnu.org/licenses/gpl-3.0.txt
# use-license: unlimited


Element["" "" "Q000" "" 30000 20000 -2500 7500 0 100 ""]
(
	Pin[9000 0 8000 3000 8600 1500 "3" "3" "edge2"]
	Pin[0 0 8000 3000 8600 1500 "2" "2" "edge2"]
	Pin[-9000 0 8000 3000 8600 1500 "1" "1" "square,edge2"]
	ElementLine [-14000 -5000 14000 -5000 3000]
	ElementLine [15000 -5000 15000 5000 2000]
	ElementLine [15000 5000 -15000 5000 2000]
	ElementLine [-15000 5000 -15000 -5000 2000]

	)
