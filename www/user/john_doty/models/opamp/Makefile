#   Copyright (C) 2010 John P. Doty jpd@noqsi.com            		 #
#                                                                        #
#   This program is free software; you can redistribute it and/or modify #
#   it under the terms of the GNU General Public License as published by #
#   the Free Software Foundation; either version 2 of the License, or    #
#   (at your option) any later version.                                  #
#                                                                        #
#   This program is distributed in the hope that it will be useful,      #
#   but WITHOUT ANY WARRANTY; without even the implied warranty of       #
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the        #
#   GNU General Public License for more details.                         #
#                                                                        #
#   You should have received a copy of the GNU General Public License    #
#   along with this program; if not, write to the                        #
#   Free Software Foundation, Inc.,                                      #
#   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.            #

MODELS= ca3080.mod opbw.mod opgain.mod opmediocre.mod


%.mod	: %.sch
	gnetlist -g spice-sdb --nomunge -o $@ $<

jpdoplib.inc	: $(MODELS)
	cat $(MODELS) >jpdoplib.inc

optest.cir	: optest.sch jpdoplib.inc
	gnetlist -g spice-sdb --nomunge -I -o optest.cir optest.sch

test	: optest.cir
	ngspice optest.cir

clean	:
	rm -f opbw.mod opgain.mod opmediocre.mod jpdoplib.inc optest.cir
