# author: Evgeny Ivanov
# dist-license: GPL
# use-license: unlimited

#TMR3 DC/DC Converter
Element["" "TMR3" "Name" "Val" 21800um 9200um 1000um 0 0 100 ""]
(
	Pin[-7620um 0um 1700um 500um 2200um 1000um "" "1" "square"]
	Pin[-5080um 0um 1700um 500um 2200um 1000um "" "2" ""]
	Pin[-2540um 0um 1700um 500um 2200um 1000um "" "3" ""]
	Pin[2540um 0um 1700um 500um 2200um 1000um "" "5" ""]
	Pin[5080um 0um 1700um 500um 2200um 1000um "" "6" ""]
	Pin[7620um 0um 1700um 500um 2200um 1000um "" "7" ""]
	Pin[10160um 0um 1700um 500um 2200um 1000um "" "8" ""]
	ElementLine[-9620um -3325um -9620um 5875um 200um]
	ElementLine[-9620um 5875um 12180um 5875um 200um]
	ElementLine[12180um 5875um 12180um -3325um 200um]
	ElementLine[12180um -3325um -9620um -3325um 200um]
)
