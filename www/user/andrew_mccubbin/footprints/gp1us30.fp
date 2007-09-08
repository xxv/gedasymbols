# author: andrew mccubbin
# email: andrewm@thehacktory.com
# dist-license: GPL 2
# use-license: unlimited

# Dimensions from Sharp Datasheet

# element_flags, description, pcb-name, value, mark_x, mark_y,
# text_x, text_y, text_direction, text_scale, text_flags
Element[0x00000000 "Sharp-GP1US30X-IR-Module" "" "" 1000 1000 -8000 -16000 0 100 0x00000000]
(

# Silk screen around package
	ElementLine[ 8665  8370  8665 -8370 1000]
	ElementLine[-6500 -8370 -7665 -8370 1000]
	ElementLine[ -850 -8370   850 -8370 1000]
	ElementLine[ 6500 -8370  8665 -8370 1000]
	ElementLine[-8665 -7370 -8665  7370 1000]
	ElementLine[-7665  8370 -6500  8370 1000]
	ElementLine[ -850  8370   850  8370 1000]
	ElementLine[ 6500  8370  8665  8370 1000]
# Pin 1 end notches
	ElementLine[-8665 -7370 -7665 -8370 1000]
	ElementLine[-8665  7370 -7665  8370 1000]


# Pad[X1, Y1, X2, Y3, width, clearance,
#     soldermask, "pin name", "pin number", flags]

# Pin 1
	Pad[-3839  7579 -3839  7776 3543 1600 3843  "1"  "1"   0x00000100]
# Pin 2
	Pad[-3839 -7579 -3839 -7776 3543 1600 3843  "2"  "2"   0x00000100]
# Pin 3
	Pad[ 3839 -7578  3839 -8562 3543 1600 4631  "3"  "3"   0x00000100]
# Pin 4
	Pad[ 3839  7578  3839  8562 3543 1600 4631  "4"  "4"   0x00000100]
# Pin GND plane
	Pad[-3051     0  3051     0 7677 1600    0  "4"  "4"  0x00000100]
# Pin GND trace 1
	Pad[ 3937  3838  3937  5807 1574 1600    0  "4"  "4"   0x00000100]
# Pin GND trace 2
	Pad[ 3937 -3838  3937 -5807 1574 1600    0  "4"  "4"   0x00000100]

# Exposed paddle (if this is an exposed paddle part)
)
