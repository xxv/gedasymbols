# author: Amand Tihon
# email: amand.tihon@alrj.org
# dist-license: GPL3, http://www.gnu.org/licenses/gpl-3.0.txt
# use-license: unlimited


Element["" "Diode, 400 mil spacing" "D000" "" 30000 20000 -12500 -12500 0 100 ""]
(
	Pin[20000 0 8000 2000 8600 1500 "2" "2" "edge2"]
	Pin[-20000 0 8000 2000 8600 1500 "1" "1" "edge2"]
	ElementLine [-10000 -5000 -10000 5000 1500]
	ElementLine [-10000 5000 10000 5000 1500]
	ElementLine [10000 5000 10000 -5000 1500]
	ElementLine [-10000 -5000 10000 -5000 1500]
	ElementLine [7500 -2500 7500 2500 5000]
	ElementLine [5000 -5000 5000 5000 1500]
	ElementLine [-20000 0 -10000 0 1500]
	ElementLine [10000 0 20000 0 1500]

	)
