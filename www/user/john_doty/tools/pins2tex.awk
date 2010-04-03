# gEDA - GPL Electronic Design Automation
# pins2tex.awk - AWK script to convert a pin list to a LaTeX table
# Copyright (C) 20010 John P. Doty
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

BEGIN{FS="\t"}

# Special case "comment" for making a horizontal line.
/^#-/{ print "\\hline" }

# ignore comment lines
/^#/{next}

{
	a = ""
	$3 = gensub( "\\\\_(.*)\\\\_","$\\\\overline{\\\\textup{\\1}}$","g",$3)
	for( i = 1; i < 4; i += 1) a = a $i " & "
	print a $4 " \\\\"
}
