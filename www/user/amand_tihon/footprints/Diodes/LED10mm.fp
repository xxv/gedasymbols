# author: Amand Tihon
# email: amand.tihon@alrj.org
# dist-license: GPL3, http://www.gnu.org/licenses/gpl-3.0.txt
# use-license: unlimited


Element["" "10mm LED" "D000" "" 25000 25000 -20000 15000 0 100 ""]
(
	Pin[5000 0 8000 2000 8600 1500 "1" "1" ""]
	Pin[-5000 0 8000 2000 8600 1500 "2" "2" ""]
	ElementLine [-16000 -12000 -16000 12000 1500]
	ElementArc [0 0 20000 20000 37 286 1500]
	ElementArc [0 0 15500 15500 0 360 1000]

	)
