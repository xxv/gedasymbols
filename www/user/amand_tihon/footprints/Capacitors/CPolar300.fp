# author: Amand Tihon
# email: amand.tihon@alrj.org
# dist-license: GPL3, http://www.gnu.org/licenses/gpl-3.0.txt
# use-license: unlimited


Element["" "" "C000" "" 50000 50000 -2500 -42500 0 100 ""]
(
	Pin[-15000 0 8000 2000 8600 1500 "1" "1" ""]
	Pin[15000 0 8000 2000 8600 1500 "2" "2" ""]
	ElementLine [-25000 -10000 -15000 -10000 1500]
	ElementLine [-20000 -15000 -20000 -5000 1500]
	ElementLine [-5000 -15000 0 -15000 1500]
	ElementLine [0 -15000 0 15000 1500]
	ElementLine [0 15000 -5000 15000 1500]
	ElementLine [-5000 15000 -5000 -15000 1500]
	ElementLine [-15000 0 -5000 0 1500]
	ElementLine [5000 0 15000 0 1500]
	ElementLine [5000 -15000 5000 15000 3000]
	ElementArc [0 0 35000 35000 270 90 1500]
	ElementArc [0 0 35000 35000 0 90 1500]
	ElementArc [0 0 35000 35000 90 90 1500]
	ElementArc [0 0 35000 35000 180 90 1500]

	)
