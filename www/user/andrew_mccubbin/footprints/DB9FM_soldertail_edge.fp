# author: andrew mccubbin
# email: andrewm@thehacktory.com
# dist-license: GPL 2
# use-license: unlimited



# Element[element_flags, description, pcb-name, value, mark_x,
# mark_y, text_x, text_y, text_direction, text_scale, text_flags
Element[0x00000000 "DB25FM_soldertail_edge" "" "" 0 0 -13796 -7480 0 100 0x00000000]
(


# Pad[X1, Y1, X2, Y3, width, clearance,
#     soldermask, "pin name", "pin number", flags]

# Pin[x, y, Thickness, Clearance, Mask, DrillHole,
#     Name, Number, Flags)


# 5 Pads for top row
	Pad[ -21800      0 -21800      0  6470  1600   6770        "5"  "5"   0x00000800]
	Pad[ -21800   3235 -21800   9705  6470  1600   6770        "5"  "5"   0x00000100]

	Pad[ -10900      0 -10900      0  6470  1600   6770        "4"  "4"   0x00000800]
	Pad[ -10900   3235 -10900   9705  6470  1600   6770        "4"  "4"   0x00000100]

	Pad[      0      0      0      0  6470  1600   6770        "3"  "3"   0x00000800]
	Pad[      0   3235      0   9705  6470  1600   6770        "3"  "3"   0x00000100]

	Pad[  10900      0  10900      0  6470  1600   6770        "2"  "2"   0x00000800]
	Pad[  10900   3235  10900   9705  6470  1600   6770        "2"  "2"   0x00000100]

	Pad[  21800      0  21800      0  6470  1600   6770        "1"  "1"   0x00000800]
	Pad[  21800   3235  21800   9705  6470  1600   6770        "1"  "1"   0x00000100]

# 4 Pads for bottom row
	Pad[ -16350      0 -16350      0  6470  1600   6770        "9"  "9"   0x00000880]
	Pad[ -16350   3235 -16350   9705  6470  1600   6770        "9"  "9"   0x00000180]

	Pad[  -5450      0  -5450      0  6470  1600   6770        "8"  "8"   0x00000880]
	Pad[  -5450   3235  -5450   9705  6470  1600   6770        "8"  "8"   0x00000180]

	Pad[   5450      0   5450      0  6470  1600   6770        "7"  "7"   0x00000880]
	Pad[   5450   3235   5450   9705  6470  1600   6770        "7"  "7"   0x00000180]

	Pad[  16350      0  16350      0  6470  1600   6770        "6"  "6"   0x00000880]
	Pad[  16350   3235  16350   9705  6470  1600   6770        "6"  "6"   0x00000180]

)
