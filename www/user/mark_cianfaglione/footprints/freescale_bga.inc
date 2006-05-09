#  Hey emacs: -*- m4 -*-
#                             COPYRIGHT
#
#   PCB, interactive printed circuit board design
#   Copyright (C) 1994,1995,1996 Thomas Nau
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#
#   Contact addresses for paper mail and Email:
#   Thomas Nau, Schlehenweg 15, 88471 Baustetten, Germany
#   Thomas.Nau@rz.uni-ulm.de
#
#   RCS: $Id$
#
# BGA packages
# (C) 2002 Mike Jarabek
#
# Numbers from: http://www.pcdmag.com/resources/smt/
#
#
# Some BGA packages from Xilinx
# $1: canonical name
# $2: name on PCB
# $3: value
# $4: pkg code (eg. FG900, FG1152.. etc)
define(`PIN_LETTERS',`A B C D E F G H J K L M N P R T U V W Y AAABACADAEAFAGAHAJAKALAMANAPARATAUAVAWAYBABB')
define(`PIN_LETTER',`translit(substr(PIN_LETTERS,eval(($1-1)*2),2),` ')')
define(`PKG_FREESCALE',`
ifelse($4,`MAPBGA256',`define(`BGA_L',1575) define(`BGA_M',1969)
	define(`BGA_E',3937) define(`ROWS',16) define(`COLS',16)
	define(`ROW_A', `oooooooooooooooo')
	define(`ROW_B', `oooooooooooooooo')
	define(`ROW_C', `oooooooooooooooo')
	define(`ROW_D', `oooooooooooooooo')
	define(`ROW_E', `oooooooooooooooo')
	define(`ROW_F', `oooooooooooooooo')
	define(`ROW_G', `oooooooooooooooo')
	define(`ROW_H', `oooooooooooooooo')
	define(`ROW_J', `oooooooooooooooo')
	define(`ROW_K', `oooooooooooooooo')
	define(`ROW_L', `oooooooooooooooo')
	define(`ROW_M', `oooooooooooooooo')
	define(`ROW_N', `oooooooooooooooo')
	define(`ROW_P', `oooooooooooooooo')
	define(`ROW_R', `oooooooooooooooo')
	define(`ROW_T', `oooooooooooooooo')',
`define(`BGA_L',`1575') define(`BGA_M',`1969')
	define(`BGA_E',`3937') define(`ROWS',16) define(`COLS',16)
	define(`ROW_A', `oooooooooooooooo')
	define(`ROW_B', `oooooooooooooooo')
	define(`ROW_C', `oooooooooooooooo')
	define(`ROW_D', `oooooooooooooooo')
	define(`ROW_E', `oooooooooooooooo')
	define(`ROW_F', `oooooooooooooooo')
	define(`ROW_G', `oooooooooooooooo')
	define(`ROW_H', `oooooooooooooooo')
	define(`ROW_J', `oooooooooooooooo')
	define(`ROW_K', `oooooooooooooooo')
	define(`ROW_L', `oooooooooooooooo')
	define(`ROW_M', `oooooooooooooooo')
	define(`ROW_N', `oooooooooooooooo')
	define(`ROW_P', `oooooooooooooooo')
	define(`ROW_R', `oooooooooooooooo')
	define(`ROW_T', `oooooooooooooooo')')

define(`SCALE',1)
define(`PAD_CLR',50)
define(`PKG_CLR',5000)
define(`LINEW',5)
define(`BGA_M',eval(BGA_M/SCALE))
define(`BGA_L',eval(BGA_L/SCALE))
define(`MAXX',eval((BGA_E * (COLS-1))/SCALE + PKG_CLR))
define(`MAXY',eval((BGA_E * (ROWS-1))/SCALE + PKG_CLR))
Element[0x00 "$1" "$2" "$3" 0 0 0 eval(-PKG_CLR-5000) 0 100 0x00]
(
	forloop(`i', 1, ROWS,
		`define(`CY', eval(((i-1) * BGA_E)/SCALE))
		 define(`THE_ROW',ROW_`'PIN_LETTER(i))
		 forloop(`j', 1, COLS,
`define(`CX', eval(((j-1) * BGA_E)/SCALE))dnl
	ifelse(substr(THE_ROW,eval(j-1),1),`o',`
	Pad[ CX CY CX CY BGA_L PAD_CLR BGA_M "PIN_LETTER(i)`'j" "PIN_LETTER(i)`'j" 0x00]')')')
	# Draw the element lines around the dodad
	ElementLine[   0     -PKG_CLR MAXX     -PKG_CLR LINEW]
	ElementLine[MAXX     -PKG_CLR MAXX     MAXY     LINEW]
	ElementLine[MAXX     MAXY     -PKG_CLR MAXY     LINEW]
	ElementLine[-PKG_CLR MAXY     -PKG_CLR 0        LINEW]
	ElementLine[-PKG_CLR 0        0        -PKG_CLR LINEW]
)
undefine(`BGA_L') undefine(`BGA_M') undefine(`ROWS') undefine(`COLS')
undefine(`CY') undefine(`CX')
undefine(`PKG_CLR') undefine(`PAD_CLR') undefine(`MAXX') undefine(`MAXY')
')

