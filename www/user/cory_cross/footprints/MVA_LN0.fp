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

Element["" "MVA smt electrolytic cap, LN0 case" "" "" 0 0 -35590 37464 0 100 ""]
(
	Pad[-32347 0 -19881 0 14173 1200 15373 "Positive" "1" "square"]
	Pad[32347 0 19881 0 14173 1200 15373 "Negative" "2" "square"]
	ElementLine [-41433 30118 -41433 -30118 1000]
	ElementLine [-41433 30118 -39433 35464 1000]
	ElementLine [-41433 -30118 -39433 -35464 1000]
	ElementLine [-39433 35464 41433 35464 1000]
	ElementLine [-39433 -35464 41433 -35464 1000]
	ElementLine [41433 35464 41433 -35464 1000]
	ElementLine [42433 17732 42433 -17732 2000]
)
