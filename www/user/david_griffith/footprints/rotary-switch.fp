#Copyright 2008 David Griffith

#    This symbol is covered under the GNU GPL, with the following exception.
#    See the file gpl.txt for the full license.
#
#  As a special exception, if you create a design which uses this 
#  footprint, and embed this footprint or unaltered portions of this 
#  footprint into the design, this footprint does not by itself cause 
#  the resulting design to be covered by the GNU General Public License. 
#  This exception does not however invalidate any other reasons why the 
#  design itself might be covered by the GNU General Public License. If 
#  you modify this footprint, you may extend this exception to your 
#  version of the footprint, but you are not obligated to do so. If you 
#  do not wish to do so, delete this exception statement from your 
#  version.

Element["" "Rotary Switch" "" "" 90000 180000 0 0 0 100 ""]
(
	Pin[-10000 -10000 6000 2000 6600 3500 "" "B" ""]
	Pin[-10000 10000 6000 2000 6600 3500 "" "A" "thermal(9X)"]
	Pin[10000 10000 6000 2000 6600 3500 "" "D" ""]
	Pin[10000 -10000 6000 2000 6600 3500 "" "C" ""]
	Pin[-10000 40000 6000 2000 6600 3500 "" "1" ""]
	Pin[10000 40000 6000 2000 6600 3500 "" "12" ""]
	Pin[-10000 -40000 6000 2000 6600 3500 "" "6" ""]
	Pin[10000 -40000 6000 2000 6600 3500 "" "7" ""]
	Pin[40000 -10000 6000 2000 6600 3500 "" "9" ""]
	Pin[40000 10000 6000 2000 6600 3500 "" "10" ""]
	Pin[-40000 10000 6000 2000 6600 3500 "" "3" ""]
	Pin[-40000 -10000 6000 2000 6600 3500 "" "4" ""]
	Pin[-30000 -30000 6000 2000 6600 3500 "" "5" ""]
	Pin[30000 -30000 6000 2000 6600 3500 "" "8" ""]
	Pin[-30000 30000 6000 2000 6600 3500 "" "2" ""]
	Pin[30000 30000 6000 2000 6600 3500 "" "11" ""]
	Pin[0 30000 6000 2000 6600 3500 "" "1" ""]
	ElementLine [-10000 0 10000 0 1000]
	ElementLine [0 -10000 0 10000 1000]
	ElementArc [0 0 50000 50000 270 90 2500]
	ElementArc [-1 1 50001 50001 180 90 2500]
	ElementArc [0 0 50000 50000 90 90 2500]
	ElementArc [-1 1 49999 49999 0 90 2500]
	ElementArc [0 0 20000 20000 270 90 2500]
	ElementArc [0 0 20000 20000 0 90 2500]
	ElementArc [-1 -1 20001 20001 90 90 2500]
	ElementArc [1 -1 19999 19999 180 90 2500]
	ElementArc [0 30000 5000 5000 270 90 2000]
	ElementArc [0 30000 5000 5000 0 90 2000]
	ElementArc [-1 29999 5001 5001 90 90 2000]
	ElementArc [0 30000 5000 5000 180 90 2000]
	ElementArc [0 0 5000 5000 90 90 1000]
	ElementArc [0 0 5000 5000 180 90 1000]
	ElementArc [0 0 5000 5000 270 90 1000]
	ElementArc [0 0 5000 5000 0 90 1000]

	)
