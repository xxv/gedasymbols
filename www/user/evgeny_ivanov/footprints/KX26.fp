# author: Evgeny Ivanov
# dist-license: GPL
# use-license: unlimited

# KX-26 quartz crystal
Element["" "" "" "" 0 0 1000um -1000um 0 60 ""]
(
    ElementArc[0 0 1000um 1000um 0 360 200um]
	Pin[300um 0 400um 400um 600um 200um "" "1" ""]
	Pin[-300um 0 400um 400um 600um 200um "" "2" ""]
)

