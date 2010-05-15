# author: Amand Tihon
# email: amand.tihon@alrj.org
# dist-license: GPL3, http://www.gnu.org/licenses/gpl-3.0.txt
# use-license: unlimited

Element["" "SOT23" "Q000" "" 8600 7800 0 0 0 100 ""]
(
	Pad[0 -4400 0 -3800 3900 3000 6900 "3" "3" "square"]
	Pad[3900 3800 3900 4400 3900 3000 6900 "2" "2" "square,edge2"]
	Pad[-3900 3800 -3900 4400 3900 3000 6900 "1" "1" "square,edge2"]
	ElementLine [-6400 -2400 -6400 2400 1000]
	ElementLine [6400 -2400 2500 -2400 1000]
	ElementLine [6400 2400 6400 -2400 1000]
	ElementLine [-1400 2400 1400 2400 1000]
	ElementLine [-6400 -2400 -2500 -2400 1000]

	)
