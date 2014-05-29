# author: Evgeny Ivanov
# dist-license: GPL
# use-license: unlimited

#SMT power inductor
Element["" "" "B82477G4" "" 0 0 -3500um -4500um 0 100 ""]
(
    Pad[-4750um -3250um -4750um 3250um 5700um 1000um 7700um "1" "1" "square"]
    Pad[4750um -3250um 4750um 3250um 5700um 1000um 7700um "2" "2" "square"]
    ElementLine [-6600um -6600um -6600um 6600um 200um]
    ElementLine [-6600um 6600um 6600um 6600um 200um]
    ElementLine [6600um 6600um 6600um -6600um 200um]
    ElementLine [6600um -6600um -6600um -6600um 200um]
)

