# author: andrew mccubbin
# email: andrewm@thehacktory.com
# dist-license: GPL 2
# use-license: unlimited

# Dimensions from Fairchild Datasheet

# Element[element_flags, description, pcb-name, value, mark_x,
# mark_y, text_x, text_y, text_direction, text_scale, text_flags
Element[0x00000000 "SMT-transistor-SC75-6-package-6-pins-plus-exposed-pad" "" "" 1000 1000 -11000 5100 1 100 0x00000000]
(

# Silk screen around package
	ElementLine[ 4000  5950  4000 -5950 1000]
	ElementLine[ 4000 -5950 -4000 -5950 1000]
	ElementLine[-4000 -5950 -4000  5950 1000]
	ElementLine[-4000  5950  4000  5950 1000]
# Silk screen Pin 1 indicator
	ElementLine[-4600  6550 -4000  5950 1000]


# Pad[X1, Y1, X2, Y3, width, clearance,
#     soldermask, "pin name", "pin number", flags]

# bottom row
	Pad[-1969  4035 -1969  3248 1181 1600 1381 "1" "1"  0x00000100]
	Pad[    0  4035     0  3248 1181 1600 1381 "2" "2"  0x00000100]
	Pad[ 1969  4035  1969  3248 1181 1600 1381 "3" "3"  0x00000100]

# top
	Pad[ 1969 -4035  1969 -3248 1181 1600 1381 "4" "4"  0x00000100]
	Pad[    0 -4035     0 -3248 1181 1600 1381 "5" "5"  0x00000100]
	Pad[-1969 -4035 -1969 -3248 1181 1600 1381 "6" "6"  0x00000100]

# Exposed paddle
	Pad[ -787     0   787     0 3543 1600 3743 "7" "7"  0x00000100]

)
