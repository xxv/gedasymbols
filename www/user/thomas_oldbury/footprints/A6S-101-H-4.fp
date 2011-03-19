# element_flags, description, pcb-name, value, mark_x, mark_y,
# text_x, text_y, text_direction, text_scale, text_flags

# All dimensions in mils!
Element[0x00000000 "AGS-101-H-4" "" "AGS-101-H-4" 0 0 0 0 0 100 ""]
(
    # Note: Coordinates in y are inverted. All dimensions in 1/100th mil.
    
    # Pad [rX1 rY1 rX2 rY2 Thickness Clearance Mask "Name" "Number" SFlags]
    Pad [0 0 0 -7874 4330 4724 5314 "1" "1" ""]
    Pad [10000 0 10000 -7874 4330 4724 5314 "2" "2" ""]
    Pad [20000 0 20000 -7874 4330 4724 5314 "3" "3" ""]
    Pad [30000 0 30000 -7874 4330 4724 5314 "4" "4" ""]
    
    Pad [0 40944 0 33100 4330 4724 5314 "8" "8" ""]
    Pad [10000 40944 10000 33100 4330 4724 5314 "7" "7" ""]
    Pad [20000 40944 20000 33100 4330 4724 5314 "6" "6" ""]
    Pad [30000 40944 30000 33100 4330 4724 5314 "5" "5" ""]
    
    # Silkscreen
    # ElementLine [rX1 rY1 rX2 rY2 Thickness]
    # Draw a rectangle around the footprint
    ElementLine [0 5000 0 28100 2000]
    ElementLine [0 5000 30000 5000 2000]
    ElementLine [30000 5000 30000 28100 2000]
    ElementLine [0 28100 30000 28100 2000]
)
