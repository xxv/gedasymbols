# author: Evgeny Ivanov
# dist-license: GPL
# use-license: unlimited

# KX-38 quartz crystal
Element["" "" "" "" 0 0 1500um -2500um 0 60 ""]
(
    ElementLine[8000um -1500um 0um -1500um 200um]
    ElementLine[0um -1500um 0um 1500um 200um]
    ElementLine[0um 1500um 8000um 1500um 200um]
    ElementLine[1500um 0um 2500um 0um 200um]
    ElementLine[2500um 1000um 2500um -1000um 200um]
    ElementLine[3500um -1000um 3500um 1000um 200um]
    ElementLine[3500um 1000um 4500um 1000um 200um]
    ElementLine[4500um 1000um 4500um -1000um 200um]
    ElementLine[4500um -1000um 3500um -1000um 200um]
    ElementLine[5500um 1000um 5500um -1000um 200um]
    ElementLine[5500um 0um 6500um 0um 200um]
    Pad[-2000um -1000um -2000um -1000um 1500um 500um 2000um "1" "1" "square"]
    Pad[-2000um 1000um -2000um 1000um 1500um 500um 2000um "2" "2" "square"]
    Pad[9000um -500um 9000um 500um 2000um 1000um 3000um "" "" "square"]
)

