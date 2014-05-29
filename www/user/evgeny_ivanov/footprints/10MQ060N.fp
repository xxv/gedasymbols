# author: Evgeny Ivanov
# dist-license: GPL
# use-license: unlimited

# VS-10MQ060N Schottky Rectifier
Element["" "" "10MQ060N" "" 0 0 -3000um -3000um 0 100 ""]
(
    Pad[-2130um -100um -2130um 100um 1270um 1000um 2270um "1" "1" "square"]
    Pad[2130um -100um 2130um 100um 1270um 1000um 2270um "2" "2" "square"]
    ElementLine [-2640um -1450um -2640um 1450um 200um]
    ElementLine [-2640um 1450um 2640um 1450um 200um]
    ElementLine [2640um 1450um 2640um -1450um 200um]
    ElementLine [2640um -1450um -2640um -1450um 200um]
)
