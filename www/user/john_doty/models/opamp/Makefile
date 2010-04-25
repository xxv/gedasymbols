# $Id$
#
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
SOURCES= Makefile ca3080.mod opbw.sch opgain.sch opmediocre.sch optest.sch

# implicit rule to turn a schematic into a subcircuit

%.mod	: %.sch
	gnetlist -g spice-sdb --nomunge -o $@ $<

# rule to assemble the library

jpdoplib.inc	: $(MODELS)
	cat $(MODELS) >jpdoplib.inc

# rule to make the test SPICE file from the test schematic

optest.cir	: optest.sch jpdoplib.inc
	gnetlist -g spice-sdb --nomunge -I -o optest.cir optest.sch

# rule to run the test: puts the user into an interactive SPICE command loop

test	: optest.cir
	ngspice optest.cir

# Usual boilerplate to remove unnecessary files.

clean	:
	rm -f opbw.mod opgain.mod opmediocre.mod jpdoplib.inc optest.cir
	rm -rf opamp

# Make a tarball of this stuff

opamp.tar.gz	: $(SOURCES)
	mkdir opamp
	cp $(SOURCES) opamp
	tar czf opamp.tar.gz opamp
	rm -rf opamp 

# $Log$
