# author: Evgeny Ivanov
# dist-license: GPL
# use-license: unlimited

# B3P-VH connector
Element["" "" "B3P" "" 0 0 3000um -4000um 0 100 ""]
(
	Pin[0 0 3000um 1000um 4000um 1650um "" "1" "square"]
	Pin[3960um 0 3000um 1000um 4000um 1650um "" "2" ""]
	Pin[7920um 0 3000um 1000um 4000um 1650um "" "2" ""]
	ElementLine [-1950um -4000um -1950um 4500um 200um]
	ElementLine [-1950um 4500um 9870um 4500um 200um]
	ElementLine [9870um 4500um 9870um -4000um 200um]
	ElementLine [9870um -4000um -1950um -4000um 200um]
	ElementLine [-1950um -2500um 9870um -2500um 200um]

	)
