# author: Evgeny Ivanov
# dist-license: GPL
# use-license: unlimited

# S1D Surface Mount Glass Passivated Rectifier
Element["" "" "S1D" "" 0 0 3700um -3000um 0 100 ""]
(
	Pad[-1790um 0 -1790um 0 1800um 200um 2000um "1" "1" "square,edge2"]
	Pad[1790um 0 1790um 0 1800um 200um 2000um "2" "2" "square"]
	ElementLine [-3000um 1500um 2500um 1500um 200um]
	ElementLine [2500um 1500um 3000um 1000um 200um]
	ElementLine [3000um 1000um 3000um -1000um 200um]
	ElementLine [3000um -1000um 2500um -1500um 200um]
	ElementLine [2500um -1500um -3000um -1500um 200um]
	ElementLine [-3000um -1500um -3000um 1500um 200um]

	)

