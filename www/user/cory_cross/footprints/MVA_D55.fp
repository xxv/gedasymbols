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

Element["" "MVA smt electrolytic cap, D55 case" "" "" 0 0 -13937 12464 0 100 ""]
(
	Pad[-10102 0 -5905 0 7874 1200 9074 "Positive" "1" "square"]
	Pad[10102 0 5905 0 7874 1200 9074 "Negative" "2" "square"]
	ElementLine [-10464 7618 -10464 3937 1000]
	ElementLine [-10464 -7618 -10464 -3937 1000]
	ElementLine [-10464 7618 -7617 10464 1000]
	ElementLine [-10464 -7618 -7617 -10464 1000]
	ElementLine [-7617 10464 10464 10464 1000]
	ElementLine [-7617 -10464 10464 -10464 1000]
	ElementLine [10464 10464 10464 3937 1000]
	ElementLine [10464 -10464 10464 -3937 1000]
	ElementLine [17039 5232 17039 -5232 2000]
)
