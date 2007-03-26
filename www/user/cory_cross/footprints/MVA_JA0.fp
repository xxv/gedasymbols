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

Element["" "MVA smt electrolytic cap, JA0 case" "" "" 0 0 -27716 24275 0 100 ""]
(
	Pad[-20142 0 -14369 0 11023 1200 12223 "Positive" "1" "square"]
	Pad[20142 0 14369 0 11023 1200 12223 "Negative" "2" "square"]
	ElementLine [-27653 18247 -27653 -18247 1000]
	ElementLine [-27653 18247 -25653 22275 1000]
	ElementLine [-27653 -18247 -25653 -22275 1000]
	ElementLine [-25653 22275 27653 22275 1000]
	ElementLine [-25653 -22275 27653 -22275 1000]
	ElementLine [27653 22275 27653 -22275 1000]
	ElementLine [28653 11137 28653 -11137 2000]
)
