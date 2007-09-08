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
	ElementLine[ 31600  26500  31600  13000 1000]
	ElementLine[ 31600   7050  31600   3000 1000]
	ElementLine[ 31600  -7050  31600  -3000 1000]
	ElementLine[ 31600 -26500  31600 -13000 1000]

	ElementLine[ 20000 -31600 -20000 -31600 1000]
	ElementLine[-31600 -26500 -31600  26500 1000]

	ElementLine[-20000  31600 -13000  31600 1000]
	ElementLine[ -7050  31600  -3000  31600 1000]
	ElementLine[  7050  31600   3000  31600 1000]
	ElementLine[ 20000  31600  13000  31600 1000]
# Pot protrusion bottom
	ElementLine[-18900  31600 -18900  43950 1000]
	ElementLine[ 18900  31600  18900  43950 1000]

	ElementLine[ 18900  43950  13000  43950 1000]
	ElementLine[  7050  43950   3000  43950 1000]
	ElementLine[ -7050  43950  -3000  43950 1000]
	ElementLine[-18900  43950 -13000  43950 1000]
# Pot protrusion side
	ElementLine[ 31600 -18900  43950 -18900 1000]
	ElementLine[ 31600  18900  43950  18900 1000]

	ElementLine[ 43950  18900  43950  13000 1000]
	ElementLine[ 43950   7050  43950   3000 1000]
	ElementLine[ 43950  -7050  43950  -3000 1000]
	ElementLine[ 43950 -18900  43950 -13000 1000]


# Pad[X1, Y1, X2, Y3, width, clearance,
#     soldermask, "pin name", "pin number", flags]

# Pin[x, y, Thickness, Clearance, Mask, DrillHole,
#     Name, Number, Flags)


# Bottom Pot
# Pin 1
	Pad[ -9842  34842 -9842  41141  6299  1600 6599  "1"  "1"   0x00000800]
	Pad[ -9842  34842 -9842  41141  6299  1600 6599  "1"  "1"   0x00000880]
	Pin[ -9842  37992  6299  1600   6599  3937       "1"  "1"   0x00000100]
# Pin 2
	Pad[     0  34842     0  41141  6299  1600 6599  "2"  "2"   0x00000800]
	Pad[     0  34842     0  41141  6299  1600 6599  "2"  "2"   0x00000880]
	Pin[     0  37992  6299  1600   6599  3937       "2"  "2"   0x00000100]
# Pin 3
	Pad[  9842  34842  9842  41141  6299  1600 6599  "3"  "3"   0x00000800]
	Pad[  9842  34842  9842  41141  6299  1600 6599  "3"  "3"   0x00000880]
	Pin[  9842  37992  6299  1600   6599  3937       "3"  "3"   0x00000100]



# Side Pot
# Pin 4
	Pad[  34842 -9842 41141 -9842   6299  1600 6599  "4"  "4"   0x00000800]
	Pad[  34842 -9842 41141 -9842   6299  1600 6599  "4"  "4"   0x00000880]
	Pin[  37992 -9842  6299  1600   6599  3937       "4"  "4"   0x00000100]
# Pin 5
	Pad[  34842     0 41141     0   6299  1600 6599  "5"  "5"   0x00000800]
	Pad[  34842     0 41141     0   6299  1600 6599  "5"  "5"   0x00000880]
	Pin[  37992     0  6299  1600   6599  3937       "5"  "5"   0x00000100]
# Pin 6
	Pad[  34842  9842 41141  9842   6299  1600 6599  "6"  "6"   0x00000800]
	Pad[  34842  9842 41141  9842   6299  1600 6599  "6"  "6"   0x00000880]
	Pin[  37992  9842  6299  1600   6599  3937       "6"  "6"   0x00000100]

# Momentary Switch
# Pin 1a
	Pin[  -8858 -12795  7086  1600 7386 3937 "7"  "7"   0x00000001]
# Pin 1b
	Pin[  -8858  12795  7086  1600 7386 3937 "7"  "7"   0x00000001]
# Pin 2a
	Pin[   8858 -12795  7086  1600 7386 3937 "8"  "8"   0x00000001]
# Pin 2b
	Pin[   8858  12795  7086  1600 7386 3937 "8"  "8"   0x00000001]

# Mounting Lugs
	Pin[ -26181 -30511 10236  1600 10536 5118 "L1"  "L1"   0x00000001]
	Pin[  26181  30511 10236  1600 10536 5118 "L2"  "L2"   0x00000001]
	Pin[  26181 -30511 10236  1600 10536 5118 "L3"  "L3"   0x00000001]
	Pin[ -26181  30511 10236  1600 10536 5118 "L4"  "L4"   0x00000001]


)
