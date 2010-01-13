Element[0x0 "SW__ITTCanon_F_Series_2PDT.fp" "SW?" "" 0 0 -19000 -91000 0 100 0x0]
(
	Pin[-11800 -24200 8200 2000 9400 4200 "" "2" 0x0101]
	Pin[-11800 -39948 8200 2000 9400 4200 "" "1" 0x0001]
	Pin[-11800 -55696 8200 2000 9400 4200 "" "3" 0x0001]

	Pin[11800 -24200 8200 2000 9400 4200 "" "5" 0x0001]
	Pin[11800 -39948 8200 2000 9400 4200 "" "4" 0x0001]
	Pin[11800 -55696 8200 2000 9400 4200 "" "6" 0x0001]

# note:  push switch.  center pin is center.  push switches in direction of push.
# front pins are NC, back pins are NO

	ElementLine[-19300 0 19300 0 1000]
	ElementLine[19300 0 19300 -82700 1000] 
	ElementLine[19300 -82700 -19300 -82700 1000] 
	ElementLine[-19300 -82700 -19300 0 1000]
)
