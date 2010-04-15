# author: Amand Tihon
# email: amand.tihon@alrj.org
# dist-license: GPL3, http://www.gnu.org/licenses/gpl-3.0.txt
# use-license: unlimited


Element["" "Diode, 300 mil spacing, oval pads" "D000" "" 25000 15000 -7500 -10000 0 100 ""]
(
	Pin[-15000 0 6000 2000 6600 1500 "1" "1" "edge2"]
	Pin[15000 0 6000 2000 6600 1500 "2" "2" "edge2"]
	Pad[-17500 0 -12500 0 6000 2000 8000 "1" "1" "onsolder"]
	Pad[12500 0 17500 0 6000 2000 8000 "2" "2" "onsolder,edge2"]
	Pad[-17500 0 -12500 0 6000 2000 8000 "1" "1" ""]
	Pad[12500 0 17500 0 6000 2000 8000 "2" "2" "edge2"]
	ElementLine [-7500 -2500 -7500 2500 1500]
	ElementLine [-7500 2500 7500 2500 1500]
	ElementLine [7500 2500 7500 -2500 1500]
	ElementLine [7500 -2500 -7500 -2500 1500]
	ElementLine [7500 0 15000 0 1500]
	ElementLine [-15000 0 -7500 0 1500]
	ElementLine [6000 -1000 6000 1000 3000]
	ElementLine [5000 -2500 5000 2500 1500]

	)
