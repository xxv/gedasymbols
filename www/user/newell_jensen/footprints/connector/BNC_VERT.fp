# author: Newell Jensen
# email: pillar2012@gmail.com
# dist-license: GPL 3
# use-license: unlimited

Element["" "" "BNC" "" 0 0 0 0 0 100 ""]
(
	ElementLine[-21653 -21653 -21653 21653 1000]
	ElementLine[21653 21653 21653 -21653 1000]
	ElementLine[-21653 -21653 21653 -21653 1000]
	ElementLine[21653 21653 -21653 21653 1000]
	
	# rX rY Thickness Clearance Mask Drill "Name" "Number" SFlags
	Pin[0 0 9133 3937 0 5196 "1" "1" ""]
	Pin[-13504 -13504 13543 3937 0 9606 "2" "2" ""]	
	Pin[13504 13504 13543 3937 0 9606 "3" "3" ""]	
	Pin[-13504 13504 13543 3937 0 9606 "4" "4" ""]	
	Pin[13504 -13504 13543 3937 0 9606 "4" "4" ""]	
)
