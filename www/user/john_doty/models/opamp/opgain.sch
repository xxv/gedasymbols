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
title=Idealized Gain-limited Opamp
}
C 40400 49800 1 0 0 spice-subcircuit-LL-1.sym
{
T 40500 50100 5 10 0 1 0 0 1
device=spice-subcircuit-LL
T 40500 50200 5 10 1 1 0 0 1
refdes=A1
T 40500 49900 5 10 1 1 0 0 1
model-name=opgain
}
C 53800 44900 1 0 0 spice-subcircuit-IO-1.sym
{
T 54700 45300 5 10 0 1 0 0 1
device=spice-IO
T 54650 45150 5 10 1 1 0 0 1
refdes=P5
}
N 51100 44600 52500 44600 4
N 52500 45200 51100 45200 4
C 53900 44300 1 0 0 gnd-1.sym
C 51300 44900 1 0 1 spice-subcircuit-IO-1.sym
{
T 50400 45300 5 10 0 1 0 6 1
device=spice-IO
T 50450 45150 5 10 1 1 0 6 1
refdes=P1
}
C 51300 44300 1 0 1 spice-subcircuit-IO-1.sym
{
T 50400 44700 5 10 0 1 0 6 1
device=spice-IO
T 50450 44550 5 10 1 1 0 6 1
refdes=P2
}
C 51300 46500 1 0 1 spice-subcircuit-IO-1.sym
{
T 50400 46900 5 10 0 1 0 6 1
device=spice-IO
T 50450 46750 5 10 1 1 0 6 1
refdes=P3
}
C 51300 45900 1 0 1 spice-subcircuit-IO-1.sym
{
T 50400 46300 5 10 0 1 0 6 1
device=spice-IO
T 50450 46150 5 10 1 1 0 6 1
refdes=P4
}
C 51100 46600 1 0 0 capacitor-1.sym
{
T 51300 47300 5 10 0 0 0 0 1
device=CAPACITOR
T 51300 47100 5 10 1 1 0 0 1
refdes=Cp
T 51300 47500 5 10 0 0 0 0 1
symversion=0.1
T 51600 46500 5 10 1 1 0 0 1
value=1p
}
N 52000 46800 52000 46200 4
N 52000 46200 51100 46200 4
C 52500 44500 1 0 0 vcvs-1.sym
{
T 52700 45550 5 10 0 0 0 0 1
device=SPICE-vcvs
T 53100 45350 5 10 1 1 0 0 1
refdes=E1
T 52700 45750 5 10 0 0 0 0 1
symversion=0.1
T 53200 44450 5 10 1 0 0 5 1
value=1000
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

T 50300 40200 9 10 1 0 0 0 1
1
T 52000 40200 9 10 1 0 0 0 1
1
C 42700 47500 1 0 0 opamp-1.sym
{
T 43400 48300 5 10 0 0 0 0 1
device=OPAMP
T 43400 48100 5 10 1 1 0 0 1
refdes=X?
T 43400 48900 5 10 0 0 0 0 1
symversion=0.1
T 43200 48000 5 10 0 0 0 0 1
graphical=1
T 42700 47100 5 10 1 0 0 0 1
model-name=opgain
}
T 42700 48700 9 10 1 0 0 0 1
Usage:
T 42200 45500 9 10 1 0 0 0 7
One way to incorporate this model into
your simulation is to copy/paste the above
symbol into your simulation schematic,
remove the (invisible) graphical=1 attribute,
and fix the refdes attribute. Also include
the jpdoplib.inc library in your spice file.
See optest.sch for an example.
