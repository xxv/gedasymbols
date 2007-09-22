# author: andrew mccubbin
# email: andrewm@thehacktory.com
# dist-license: GPL 2
# use-license: unlimited

# Dimensions from CTS corporation Datasheet

# Element[element_flags, description, pcb-name, value, mark_x,
# mark_y, text_x, text_y, text_direction, text_scale, text_flags
Element[0x00000000 "CTS-252-Joystick-Switched" "" "" 1000 1000 -20000 -41000 0 100 0x00000000]
(

# Silk screen around package
	ElementLine[-20000   8000  20000   8000 1000]
	ElementLine[-20000   8000 -20000 -10000 1000]
	ElementLine[-20000 -10000  20000 -10000 1000]
	ElementLine[ 20000 -10000  20000   8000 1000]
	ElementLine[-20000  -7000  20000  -7000 1000]
	ElementLine[ -8000 -10000  -8000  -7000 1000]
	ElementLine[  8000 -10000   8000  -7000 1000]


# Pad[X1, Y1, X2, Y3, width, clearance,
#     soldermask, "pin name", "pin number", flags]

# Pin[x, y, Thickness, Clearance, Mask, DrillHole,
#     Name, Number, Flags)


# Pads
# Pin 6
	Pad[-10000  -3150 -10000   3150  6299  1600 6599  "1"  "1"   0x00000800]
	Pad[-10000  -3150 -10000   3150  6299  1600 6599  "1"  "1"   0x00000880]
	Pin[-10000      0   6299   1600  6599  3937       "1"  "1"   0x00000100]

# Pin 8
	Pad[     0  -3150      0   3150  6299  1600 6599  "2"  "2"   0x00000800]
	Pad[     0  -3150      0   3150  6299  1600 6599  "2"  "2"   0x00000880]
	Pin[     0      0   6299   1600  6599  3937       "2"  "2"   0x00000100]

# Pin 10
	Pad[ 10000  -3150  10000   3150  6299  1600 6599  "3"  "3"   0x00000800]
	Pad[ 10000  -3150  10000   3150  6299  1600 6599  "3"  "3"   0x00000880]
	Pin[ 10000      0   6299   1600  6599  3937       "3"  "3"   0x00000100]



)
