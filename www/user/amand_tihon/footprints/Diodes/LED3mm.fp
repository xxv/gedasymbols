# author: Amand Tihon
# email: amand.tihon@alrj.org
# dist-license: GPL3, http://www.gnu.org/licenses/gpl-3.0.txt
# use-license: unlimited


Element["" "3mm LED" "D000" "" 15000 10000 -10000 7500 0 100 ""]
(
	Pin[5000 0 8000 2000 8600 1500 "1" "1" "edge2"]
	Pin[-5000 0 8000 2000 8600 1500 "2" "2" "edge2"]
	ElementLine [-6000 -4500 -6000 4500 1500]
	ElementArc [0 0 7500 7500 37 286 1500]
	ElementArc [0 0 5500 5500 0 360 1000]

	)
