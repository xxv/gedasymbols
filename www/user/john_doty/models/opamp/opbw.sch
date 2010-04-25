v 20100214 2
C 40000 40000 0 0 0 EMBEDDEDNoqsi-title-B.sym
[
B 40000 40000 17000 11000 15 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
T 54400 41500 5 10 0 0 0 0 1
graphical=1
L 52900 40600 52900 40000 15 0 0 0 -1 -1
B 49400 40000 7600 1400 15 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
L 49400 40700 57000 40700 15 0 0 0 -1 -1
T 50000 40500 9 10 0 1 0 0 1
date=$Date$
T 53900 40500 9 10 0 1 0 0 1
rev=$Revision$
T 55400 40200 9 10 0 1 0 0 1
auth=$Author$
T 50200 40800 9 8 0 1 0 0 1
fname=$Source$
T 53200 41200 9 14 0 1 0 4 1
title=TITLE
T 49500 40800 15 8 1 0 0 0 1
FILE:
T 53000 40500 15 8 1 0 0 0 1
REVISION:
T 53000 40200 15 8 1 0 0 0 1
DRAWN BY: 
T 49500 40200 15 8 1 0 0 0 1
PAGE
T 51200 40200 15 8 1 0 0 0 1
OF
T 49500 41200 15 8 1 0 0 0 1
TITLE
T 49500 40500 15 8 1 0 0 0 1
DATE
B 49400 49600 7600 1400 15 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
T 50200 50400 9 30 1 0 0 0 1
Noqsi Aerospace, Ltd.
T 50600 50100 9 10 1 0 0 0 1
2822 South Nova Road, Pine, Colorado, USA 80470
T 51300 49800 9 10 1 0 0 0 1
+1-303-816-2756    jpd@noqsi.com
]
{
T 50000 40500 15 10 1 1 0 0 1
date=$Date$
T 53900 40500 15 10 1 1 0 0 1
rev=$Revision$
T 55400 40200 15 10 1 1 0 0 1
auth=$Author$
T 50200 40800 15 8 1 1 0 0 1
fname=$Source$
T 53200 41200 15 14 1 1 0 4 1
title=Idealized Bandwidth-limited Opamp
}
C 49800 44300 1 0 0 vccs-1.sym
{
T 50000 45350 5 10 0 0 0 0 1
device=SPICE-vccs
T 50400 45150 5 10 1 1 0 0 1
refdes=G1
T 50000 45550 5 10 0 0 0 0 1
symversion=0.1
T 50500 44250 5 10 1 0 0 5 1
value=-1
}
C 51900 44100 1 0 0 gnd-1.sym
C 40400 49800 1 0 0 spice-subcircuit-LL-1.sym
{
T 40500 50100 5 10 0 1 0 0 1
device=spice-subcircuit-LL
T 40500 50200 5 10 1 1 0 0 1
refdes=A1
T 40500 49900 5 10 1 1 0 0 1
model-name=opbw
}
C 54000 44700 1 0 0 spice-subcircuit-IO-1.sym
{
T 54900 45100 5 10 0 1 0 0 1
device=spice-IO
T 54850 44950 5 10 1 1 0 0 1
refdes=P5
}
C 52000 46100 1 0 0 capacitor-1.sym
{
T 52200 46800 5 10 0 0 0 0 1
device=CAPACITOR
T 52200 46600 5 10 1 1 0 0 1
refdes=Cbw
T 52200 47000 5 10 0 0 0 0 1
symversion=0.1
T 52200 45900 5 10 1 1 0 0 1
value=1u
}
N 51300 44400 52700 44400 4
N 52700 45000 51300 45000 4
N 51300 45000 51300 46300 4
N 51300 46300 52000 46300 4
C 52800 46000 1 0 0 gnd-1.sym
C 54100 44100 1 0 0 gnd-1.sym
C 50000 44700 1 0 1 spice-subcircuit-IO-1.sym
{
T 49100 45100 5 10 0 1 0 6 1
device=spice-IO
T 49150 44950 5 10 1 1 0 6 1
refdes=P1
}
C 50000 44100 1 0 1 spice-subcircuit-IO-1.sym
{
T 49100 44500 5 10 0 1 0 6 1
device=spice-IO
T 49150 44350 5 10 1 1 0 6 1
refdes=P2
}
C 50000 46300 1 0 1 spice-subcircuit-IO-1.sym
{
T 49100 46700 5 10 0 1 0 6 1
device=spice-IO
T 49150 46550 5 10 1 1 0 6 1
refdes=P3
}
C 50000 45700 1 0 1 spice-subcircuit-IO-1.sym
{
T 49100 46100 5 10 0 1 0 6 1
device=spice-IO
T 49150 45950 5 10 1 1 0 6 1
refdes=P4
}
C 49800 46400 1 0 0 capacitor-1.sym
{
T 50000 47100 5 10 0 0 0 0 1
device=CAPACITOR
T 50000 46900 5 10 1 1 0 0 1
refdes=Cp
T 50000 47300 5 10 0 0 0 0 1
symversion=0.1
T 50300 46300 5 10 1 1 0 0 1
value=1p
}
N 50700 46600 50700 46000 4
N 50700 46000 49800 46000 4
C 52700 44300 1 0 0 vcvs-1.sym
{
T 52900 45350 5 10 0 0 0 0 1
device=SPICE-vcvs
T 53300 45150 5 10 1 1 0 0 1
refdes=E1
T 52900 45550 5 10 0 0 0 0 1
symversion=0.1
T 53400 44250 5 10 1 0 0 5 1
value=1
}
C 40800 47400 1 0 0 opamp-1.sym
{
T 41500 48200 5 10 0 0 0 0 1
device=OPAMP
T 41500 48000 5 10 1 1 0 0 1
refdes=X?
T 41500 48800 5 10 0 0 0 0 1
symversion=0.1
T 41300 47900 5 10 0 0 0 0 1
graphical=1
T 40800 47000 5 10 1 0 0 0 1
model-name=opbw
}
T 40300 40200 9 10 1 0 0 0 17
 *   Copyright (C) 2010 John P. Doty jpd@noqsi.com             *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.             *

T 50400 40200 9 10 1 0 0 0 1
1
T 52100 40200 9 10 1 0 0 0 1
1
T 40800 48600 9 10 1 0 0 0 1
Usage:
T 40300 45400 9 10 1 0 0 0 7
One way to incorporate this model into
your simulation is to copy/paste the above
symbol into your simulation schematic,
remove the (invisible) graphical=1 attribute,
and fix the refdes attribute. Also include
the jpdoplib.inc library in your spice file.
See optest.sch for an example.
