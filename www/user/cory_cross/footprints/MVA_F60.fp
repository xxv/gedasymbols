#Copyright 2007 Cory Cross

#    This symbol is covered under the GNU GPL, with the following exception.
#    See the file gpl.txt for the full license.
#As a special exception, if you create a design which uses this footprint,
#  and embed this footprint or unaltered portions of this footprint into the
#  design, this footprint does not by itself cause the resulting design to
#  be covered by the GNU General Public License. This exception does not
#  however invalidate any other reasons why the design itself might be
#  covered by the GNU General Public License. If you modify this
#  footprint, you may extend this exception to your version of the
#  footprint, but you are not obligated to do so. If you do not
#  wish to do so, delete this exception statement from your version.

Element["" "MVA smt electrolytic cap, F60 case" "" "" 0 0 -17480 16992 0 100 ""]
(
	Pad[-14236 0 -7677 0 7874 1200 9074 "Positive" "1" "square"]
	Pad[14236 0 7677 0 7874 1200 9074 "Negative" "2" "square"]
	ElementLine [-14992 11692 -14992 3937 1000]
	ElementLine [-14992 -11692 -14992 -3937 1000]
	ElementLine [-14992 11692 -11692 14992 1000]
	ElementLine [-14992 -11692 -11692 -14992 1000]
	ElementLine [-11692 14992 14992 14992 1000]
	ElementLine [-11692 -14992 14992 -14992 1000]
	ElementLine [14992 14992 14992 3937 1000]
	ElementLine [14992 -14992 14992 -3937 1000]
	ElementLine [21173 7496 21173 -7496 2000]
)
