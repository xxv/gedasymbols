# author: Amand Tihon
# email: amand.tihon@alrj.org
# dist-license: GPL3, http://www.gnu.org/licenses/gpl-3.0.txt
# use-license: unlimited


Element["" "" "Q000" "" 30000 60000 -22500 -10000 0 100 ""]
(
	Pin[9000 0 8000 3000 8600 1500 "3" "3" ""]
	Pin[0 0 8000 3000 8600 1500 "2" "2" ""]
	Pin[-9000 0 8000 3000 8600 1500 "1" "1" "square"]
	ElementLine [-9000 0 -9000 -12500 2000]
	ElementLine [0 0 0 -12000 2000]
	ElementLine [9000 0 9000 -12000 2000]
	ElementLine [15000 -12500 -15000 -12500 2000]
	ElementLine [-15000 -12500 -15000 -55500 2000]
	ElementLine [-15000 -55500 15000 -55500 2000]
	ElementLine [15000 -55500 15000 -12500 2000]
	ElementLine [0 -47500 0 -49500 2000]
	ElementLine [5000 -38000 6000 -37000 2000]
	ElementLine [-5000 -38000 -6000 -37000 2000]
	ElementArc [0 -41500 6000 6000 180 90 2000]
	ElementArc [0 -41500 6000 6000 90 90 2000]
	ElementArc [0 -41500 6000 6000 0 90 2000]
	ElementArc [0 -41500 6000 6000 270 90 2000]

	)
