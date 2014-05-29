# author: Evgeny Ivanov
# dist-license: GPL
# use-license: unlimited

# B2P-VH connector
Element["" "" "B2P" "" 0 0 1000um -4000um 0 100 ""]
(
	Pin[0 0 3000um 1000um 4000um 1650um "" "1" "square"]
	Pin[3960um 0 3000um 1000um 4000um 1650um "" "2" ""]
	ElementLine [-1950um -4000um -1950um 4500um 200um]
	ElementLine [-1950um 4500um 5910um 4500um 200um]
	ElementLine [5910um 4500um 5910um -4000um 200um]
	ElementLine [5910um -4000um -1950um -4000um 200um]
	ElementLine [-1950um -2500um 5910um -2500um 200um]

	)
