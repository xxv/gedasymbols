# author: andrew mccubbin
# email: andrewm@thehacktory.com
# dist-license: GPL 2
# use-license: unlimited

# Dimensions from Fairchild Datasheet

# Element[element_flags, description, pcb-name, value, mark_x,
# mark_y, text_x, text_y, text_direction, text_scale, text_flags
Element[0x00000000 "SMT-transistor-SuperSOT-6-package" "" "" 1000 1000 -11000 5100 1 100 0x00000000]
(

# Silk screen around package
	ElementLine[ 6500  8450  6500 -8450 1000]
	ElementLine[ 6500 -8450 -6500 -8450 1000]
	ElementLine[-6500 -8450 -6500  8450 1000]
	ElementLine[-6500  8450  6500  8450 1000]
# Silk screen Pin 1 indicator
	ElementLine[-7100  9050 -6500  8450 1000]


# Pad[X1, Y1, X2, Y3, width, clearance,
#     soldermask, "pin name", "pin number", flags]

# bottom row
	Pad[-3740  4528 -3740  5708 2756 1600 3056 "1" "1"  0x00000100]
	Pad[    0  4528     0  5708 2756 1600 3056 "2" "2"  0x00000100]
	Pad[ 3740  4528  3740  5708 2756 1600 3056 "3" "3"  0x00000100]

# top
	Pad[ 3740 -4528  3740 -5708 2756 1600 3056 "4" "4"  0x00000100]
	Pad[    0 -4528     0 -5708 2756 1600 3056 "5" "5"  0x00000100]
	Pad[-3740 -4528 -3740 -5708 2756 1600 3056 "6" "6"  0x00000100]

)
