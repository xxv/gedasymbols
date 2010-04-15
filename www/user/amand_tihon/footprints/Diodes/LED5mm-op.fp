# author: Amand Tihon
# email: amand.tihon@alrj.org
# dist-license: GPL3, http://www.gnu.org/licenses/gpl-3.0.txt
# use-license: unlimited


Element["" "5mm LED, oval pads" "D000" "" 25000 20000 -10000 10000 0 100 ""]
(
	Pin[5000 0 6000 2000 6600 1500 "1" "1" ""]
	Pin[-5000 0 6000 2000 6600 1500 "2" "2" ""]
	Pad[-5000 -2500 -5000 2500 6000 2000 8000 "2" "2" "onsolder"]
	Pad[5000 -2500 5000 2500 6000 2000 8000 "1" "1" "onsolder"]
	Pad[-5000 -2500 -5000 2500 6000 2000 8000 "2" "2" ""]
	Pad[5000 -2500 5000 2500 6000 2000 8000 "1" "1" ""]
	ElementLine [-8000 -6000 -8000 6000 1500]
	ElementArc [0 0 10000 10000 37 286 1500]
	ElementArc [0 0 7000 7000 0 360 1000]

	)
