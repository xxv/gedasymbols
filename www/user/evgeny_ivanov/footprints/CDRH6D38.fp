# author: Evgeny Ivanov
# dist-license: GPL
# use-license: unlimited

#CDRH6D38 SMD Power Inductor
Element["" "CDRH6D38" "Name" "Val" 0 0 -1000um -3000um 0 100 ""]
(
	Pad[-2325um -1825um -2325um 1825um 2650um 350um 3000um "1" "1" "square"]
	Pad[2325um -1825um 2325um 1825um 2650um 350um 3000um "2" "2" "square"]
	ElementLine[-4000um -4000um 4000um -4000um 200um]
	ElementLine[4000um -4000um 4000um 4000um 200um]
	ElementLine[4000um 4000um -4000um 4000um 200um]
	ElementLine[-4000um 4000um -4000um -4000um 200um]
)
