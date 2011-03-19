# Airwave AWM661TX video transmitter module
# LGPL dist, use unlimited

Element[0x00000000 "AWM661TX module" "" "AWM661TX" 0 0 0 0 0 100 ""]
(
    # Note: Coordinates in y are inverted. All dimensions in 1/100th mil.
    
    # Pad [rX1 rY1 rX2 rY2 Thickness Clearance Mask "Name" "Number" SFlags]
    # Mounting pads
    Pad [9688 -3600 13625 -3600 3000 6000 1181 "MNT1" "MNT1" ""]
    Pad [9688 -79000 13625 -79000 3000 6000 1181 "MNT2" "MNT2" ""]
    Pad [96037 -3600 99974 -3600 3000 6000 1181 "MNT3" "MNT3" ""]
    Pad [96037 -79000 99974 -79000 3000 6000 1181 "MNT4" "MNT4" ""]
    
    # Pin [rX rY Thickness Clearance Mask Drill "Name" "Number" SFlags]
    # Has one pin (#10) for antenna at (0, -38929)
    Pin [0 -38929 6000 3000 5000 3800 "ANT" "10" "square"]
    
    # Pins 1-9.
    Pin [105905 -6003 6000 3000 5000 3800 "CH3" "9" "square"]
    Pin [105905 -13877 6000 3000 5000 3800 "CH2" "8" "square"]
    Pin [105905 -21751 6000 3000 5000 3800 "CH1" "7" "square"]
    Pin [105905 -29625 6000 3000 5000 3800 "AR" "6" "square"]
    Pin [105905 -37500 6000 3000 5000 3800 "AL" "5" "square"]
    Pin [105905 -45374 6000 3000 5000 3800 "VID" "4" "square"]
    Pin [105905 -53248 6000 3000 5000 3800 "VCC" "3" "square"]
    Pin [105905 -61122 6000 3000 5000 3800 "BYP" "2" "square"]
    Pin [105905 -68996 6000 3000 5000 3800 "GND" "1" "square"]
    
    # These pins are also grounded next to the antenna.
    Pin [0 -31055 6000 3000 5000 3800 "GND" "11" "square"]
    Pin [0 -46803 6000 3000 5000 3800 "GND" "11" "square"]
    
    # Mounting pins.
    Pin [39370 0 6000 3000 5000 3800 "MNT5" "MNT5" ""]
    Pin [86614 0 6000 3000 5000 3800 "MNT6" "MNT6" ""]
    Pin [39370 -82677 6000 3000 5000 3800 "MNT7" "MNT7" ""]
    Pin [86614 -82677 6000 3000 5000 3800 "MNT8" "MNT8" ""]
    
    # Silkscreen
    # ElementLine [rX1 rY1 rX2 rY2 Thickness]
    # Draw a rectangle around the footprint
    ElementLine [0 0 110236 0 393]
    ElementLine [110236 0 110236 -82677 393]
    ElementLine [0 -82677 110236 -82677 393]
    ElementLine [0 -82677 0 0 393]
)
