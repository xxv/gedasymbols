# element_flags, description, pcb-name, value, mark_x, mark_y,
# text_x, text_y, text_direction, text_scale, text_flags

# All dimensions in mils!
Element[0x00000000 "MB-0134-2" "" "MB-0134-2" 0 0 0 0 0 100 ""]
(
    # Note: All dimensions in 1/100th mil.
    # Mark is positioned middle right of the object (y axis intersecting GND 1 & GND 2)
    # or centre line, all positions relative to this.
    
    # Pad [rX1 rY1 rX2 rY2 Thickness Clearance Mask "Name" "Number" SFlags]
    
    # Mounting pads & grounds
    Pad [0 14173 0 11811 4724 4754 4754 "GND1" "GND1" "square"]
    Pad [0 -14763 0 -17125 4724 4754 4754 "GND2" "GND2" "square"]
    # GND3 top is 2.35mm from the centre line. Account for half pad width (0.7mm) as well.
    # GND3 is 1.8mm long, so it ends at 4.75mm, take 0.7mm for pad width, so 3.45mm.
    Pad [-53346 13582 -53346 12007 5511 5561 5561 "GND3" "GND3" "square"]
    # GND4 begins at the baseline of pin #7, which is -3.45mm, and is the same length as GND3.
    Pad [-53346 -12003 -53346 -13578 5511 5561 5561 "GND4" "GND4" "square"]
    
    # Pads for the SD card connecrtions. Each pad is 1.8mm long and begins at 
    # an x of 12.05mm and goes to x of 11.05mm, accounting for pad width of 0.8mm 
    # (0.4mm (/2)). The y for the first pad is at 3.85mm from the 
    # center line, it decrements by 1.1mm (43.30 mils) for each pad.
    Pad [-47440 15157 -43503 15157 3149 5561 5561 "1" "1" "square"]
    Pad [-47440 10827 -43503 10827 3149 5561 5561 "2" "2" "square"]
    Pad [-47440 6497 -43503 6497 3149 5561 5561 "3" "3" "square"]
    Pad [-47440 2167 -43503 2167 3149 5561 5561 "4" "4" "square"]
    Pad [-47440 -2163 -43503 -2163 3149 5561 5561 "5" "5" "square"]
    Pad [-47440 -6493 -43503 -6493 3149 5561 5561 "6" "6" "square"]
    Pad [-47440 -10823 -43503 -10823 3149 5561 5561 "7" "7" "square"]
    Pad [-47440 -15153 -43503 -15153 3149 5561 5561 "8" "8" "square"]
    
    # Draw the bounding box around the card. It is 16.3mm x 13.6mm.
    # X is -0.95mm for the edge of the card.
    # X goes to +1.8mm from GND3.
    
)
