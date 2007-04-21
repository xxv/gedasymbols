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

Element["" "MVA smt electrolytic cap, E55 case" "" "" 0 0 -15511 14433 0 100 ""]
(
	Pad[-11677 0 -6692 0 7874 1200 9074 "Positive" "1" "square"]
	Pad[11677 0 6692 0 7874 1200 9074 "Negative" "2" "square"]
	ElementLine [-12433 9389 -12433 3937 1000]
	ElementLine [-12433 -9389 -12433 -3937 1000]
	ElementLine [-12433 9389 -9389 12433 1000]
	ElementLine [-12433 -9389 -9389 -12433 1000]
	ElementLine [-9389 12433 12433 12433 1000]
	ElementLine [-9389 -12433 12433 -12433 1000]
	ElementLine [12433 12433 12433 3937 1000]
	ElementLine [12433 -12433 12433 -3937 1000]
	ElementLine [18614 6216 18614 -6216 2000]
)
