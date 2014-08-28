# author: Evgeny Ivanov
# dist-license: GPL
# use-license: unlimited

# SSG series 32.768 KHz Surface Mount Crystal
Element["" "" "SSG" "" 0 0 0um -1000um 0 100 ""]
(
    Pad[-2750um -1300um -2750um -1950um 1300um 1000um 2300um "1" "1" "square"]
    Pad[-2750um 1300um -2750um 1950um 1300um 1000um 2300um "2" "2" "square"]
    Pad[2750um -1300um 2750um -1950um 1300um 1000um 2300um "3" "3" "square"]
    Pad[2750um 1300um 2750um 1950um 1300um 1000um 2300um "4" "4" "square"]
    ElementLine[-3400um -2550um -3400um 2550um 200um]
    ElementLine[-3400um 2550um 3400um 2550um 200um]
    ElementLine[3400um 2550um 3400um -2550um 200um]
    ElementLine[3400um -2550um -3400um -2550um 200um]
    ElementLine[-2750um -650um -2750um -400um 100um]
    ElementLine[-3000um -400um -2500um -400um 100um]
    ElementLine[-3000um -200um -2500um -200um 100um]
    ElementLine[-3000um -200um -3000um 200um 100um]
    ElementLine[-2500um -200um -2500um 200um 100um]
    ElementLine[-3000um 200um -2500um 200um 100um]
    ElementLine[-3000um 400um -2500um 400um 100um]
    ElementLine[-2750um 400um -2750um 650um 100um]
)
