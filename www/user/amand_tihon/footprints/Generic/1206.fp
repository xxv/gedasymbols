# author: Amand Tihon
# email: amand.tihon@alrj.org
# dist-license: GPL3, http://www.gnu.org/licenses/gpl-3.0.txt
# use-license: unlimited

Element["" "" "R000" "" 12000 7500 0 0 0 100 ""]
(
	Pad[6000 -500 6000 500 6000 3000 9000 "2" "2" "square"]
	Pad[-6000 -500 -6000 500 6000 3000 9000 "1" "1" "square"]
	ElementLine [-10500 -5000 -10500 5000 800]
	ElementLine [-10500 5000 10500 5000 800]
	ElementLine [10500 5000 10500 -5000 800]
	ElementLine [10500 -5000 -10500 -5000 800]

	)
