# author: Evgeny Ivanov
# dist-license: GPL
# use-license: unlimited

# 5GSH9 SMD button
Element["" "" "5GSH9" "" 0 0 -5000um -1000um 0 100 ""]
(
    Pad[5650um -3810um 6850um -3810um 1200um 1000um 2200um "1" "1" "square"]
    Pad[-5650um -3810um -6850um -3810um 1200um 1000um 2200um "2" "2" "square"]
    Pad[-5650um 3810um -6850um 3810um 1200um 1000um 2200um "3" "3" "square"]
    Pad[5650um 3810um 6850um 3810um 1200um 1000um 2200um "4" "4" "square"]
    ElementLine[7500um -4500um -7500um -4500um 200um]
    ElementLine[-7500um -4500um -7500um 4500um 200um]
    ElementLine[-7500um 4500um 7500um 4500um 200um]
    ElementLine[7500um 4500um 7500um -4500um 200um]
    ElementLine[5000um 3810um -5000um 3810um 200um]
    ElementLine[5000um -3810um -5000um -3810um 200um]
    ElementLine[0um -3810um 0um -1500um 200um]
    ElementLine[0um 3810um 0um 1500um 200um]
    ElementLine[0um 1500um 1000um -1200um 200um]
)
