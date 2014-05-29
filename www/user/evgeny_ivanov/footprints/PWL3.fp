# author: Evgeny Ivanov
# dist-license: GPL
# use-license: unlimited

# PWL-3 connector
Element["" "" "PWL3" "" 1970um 5127um 2500um -4200um 0 100 ""]
(
	Pin[0um 0um 3200um 500um 3350um 1900um "" "1" "square"]
	Pin[3960um 0um 3200um 500um 3350um 1900um "" "2" ""]
	Pin[7920um 0um 3200um 500um 3350um 1900um "" "3" ""]
	ElementLine [-1970um -4200um 9830um -4200um 200um]
	ElementLine [9830um -4200um 9830um 5100um 200um]
	ElementLine [9830um 5100um -1970um 5100um 200um]
	ElementLine [-1970um 5100um -1970um -4200um 200um]
	ElementLine [-1970um -2700um 9830um -2700um 200um]

	)
