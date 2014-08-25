# author: Evgeny Ivanov
# dist-license: GPL
# use-license: unlimited

# KX-26 quartz crystal
Element["" "" "KX26" "" 0 0 2000um 1000um 0 100 ""]
(
    ElementLine[6200um -1000um 0um -1000um 200um]
    ElementLine[0um -1000um 0um 1000um 200um]
    ElementLine[0um 1000um 6200um 1000um 200um]
    ElementLine[500um 0um 1500um 0um 200um]
    ElementLine[1500um 600um 1500um -600um 200um]
    ElementLine[2500um -600um 2500um 600um 200um]
    ElementLine[2500um 600um 3500um 600um 200um]
    ElementLine[3500um 600um 3500um -600um 200um]
    ElementLine[3500um -600um 2500um -600um 200um]
    ElementLine[4500um 600um 4500um -600um 200um]
    ElementLine[4500um 0um 5500um 0um 200um]
    Pad[-1500um -1000um -1500um -1000um 1000um 500um 2000um "1" "1" "square"]
    Pad[-1500um 1000um -1500um 1000um 1000um 500um 2000um "2" "2" "square"]
    Pad[6700um -500um 6700um 500um 1000um 500um 1500um "" "" "square"]
)

