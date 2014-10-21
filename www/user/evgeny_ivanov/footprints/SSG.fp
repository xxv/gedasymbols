# author: Evgeny Ivanov
# dist-license: GPL
# use-license: unlimited

# SSG series 32.768 KHz Surface Mount Crystal
Element["" "" "" "" 0 0 -1000um -1000um 0 100 ""]
(
    Pad[-2750um -1300um -2750um -1950um 1300um 1000um 2300um "1" "1" "square"]
    Pad[-2750um 1300um -2750um 1950um 1300um 1000um 2300um "2" "2" "square"]
    Pad[2750um -1300um 2750um -1950um 1300um 1000um 2300um "3" "3" "square"]
    Pad[2750um 1300um 2750um 1950um 1300um 1000um 2300um "4" "4" "square"]
    ElementLine[-4000um -1600um -4000um 1600um 200um]
    ElementLine[-4000um 1600um 4000um 1600um 200um]
    ElementLine[4000um 1600um 4000um -1600um 200um]
    ElementLine[4000um -1600um -4000um -1600um 200um]
    ElementLine[-2100um -1000um -1500um -1000um 100um]
    ElementLine[-1500um -1000um -1500um -400um 100um]
    ElementLine[-2500um -400um -500um -400um 100um]
    ElementLine[-2000um -200um -1000um -200um 100um]
    ElementLine[-1000um -200um -1000um 200um 100um]
    ElementLine[-1000um 200um -2000um 200um 100um]
    ElementLine[-2000um 200um -2000um -200um 100um]
    ElementLine[-2500um 400um -500um 400um 100um]
    ElementLine[-1500um 400um -1500um 1000um 100um]
    ElementLine[-1500um 1000um -2100um 1000um 100um]
    ElementArc[2900um 0um 400um 400um 0 360 200um]
)
