Element(0x00 "LED, size in mm (pin 1 is +, 2 is -)" "" "LED5" 100 70 0 100 0x00)
(
# typical LED is 0.5 mm or 0.020" square pin.  See for example
# http://www.lumex.com and part number SSL-LX3054LGD.
# 0.020" square is 0.0288" diagonal.  A number 57 drill is 
# 0.043" which should be enough.  a 65 mil pad gives 11 mils
# of annular ring.
	Pin(-75 0 45 30 "1" 0x101)
	Pin(-25 0 45 30 "2" 0x01)
	Pin(25 0 45 30 "3" 0x01)
	Pin(75 0 45 30 "4" 0x01)
   ElementArc(0 0 118 118     0 360 10)
   ElementArc(0 0 138 138     0 360 10)
	Mark(0 0)
)
