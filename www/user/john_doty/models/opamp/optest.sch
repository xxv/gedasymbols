v 20100214 2
C 40000 40000 0 0 0 EMBEDDEDNoqsi-title-B.sym
[
T 51300 49800 9 10 1 0 0 0 1
+1-303-816-2756    jpd@noqsi.com
T 50600 50100 9 10 1 0 0 0 1
2822 South Nova Road, Pine, Colorado, USA 80470
T 50200 50400 9 30 1 0 0 0 1
Noqsi Aerospace, Ltd.
B 49400 49600 7600 1400 15 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
T 49500 40500 15 8 1 0 0 0 1
DATE
T 49500 41200 15 8 1 0 0 0 1
TITLE
T 51200 40200 15 8 1 0 0 0 1
OF
T 49500 40200 15 8 1 0 0 0 1
PAGE
T 53000 40200 15 8 1 0 0 0 1
DRAWN BY: 
T 53000 40500 15 8 1 0 0 0 1
REVISION:
T 49500 40800 15 8 1 0 0 0 1
FILE:
T 53200 41200 9 14 0 1 0 4 1
title=TITLE
T 50200 40800 9 8 0 1 0 0 1
fname=$Source$
T 55400 40200 9 10 0 1 0 0 1
auth=$Author$
T 53900 40500 9 10 0 1 0 0 1
rev=$Revision$
T 50000 40500 9 10 0 1 0 0 1
date=$Date$
L 49400 40700 57000 40700 15 0 0 0 -1 -1
B 49400 40000 7600 1400 15 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
L 52900 40600 52900 40000 15 0 0 0 -1 -1
T 54400 41500 5 10 0 0 0 0 1
graphical=1
B 40000 40000 17000 11000 15 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
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
title=Testing Opamp Models
}
C 48800 47900 1 0 0 opamp-1.sym
{
T 49500 48700 5 10 0 0 0 0 1
device=OPAMP
T 49500 48500 5 10 1 1 0 0 1
refdes=X1
T 49500 49300 5 10 0 0 0 0 1
symversion=0.1
T 48400 49200 5 10 1 0 0 0 1
model-name=opmediocre
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
C 41000 49000 1 0 0 vdc-1.sym
{
T 41700 49650 5 10 1 1 0 0 1
refdes=Vcc
T 41700 49850 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 41700 50050 5 10 0 0 0 0 1
footprint=none
T 41700 49450 5 10 1 1 0 0 1
value=DC 15V
}
C 41000 47800 1 0 0 vdc-1.sym
{
T 41700 48450 5 10 1 1 0 0 1
refdes=Vee
T 41700 48650 5 10 0 0 0 0 1
device=VOLTAGE_SOURCE
T 41700 48850 5 10 0 0 0 0 1
footprint=none
T 41700 48250 5 10 1 1 0 0 1
value=DC 15V
}
C 41100 50200 1 0 0 vcc-1.sym
C 41500 47800 1 180 0 vee-1.sym
C 40800 48700 1 0 0 gnd-1.sym
N 41300 49000 40900 49000 4
C 49100 48700 1 0 0 vcc-1.sym
C 49500 47900 1 180 0 vee-1.sym
N 49800 48300 49800 47300 4
N 48800 47300 49800 47300 4
N 48800 47300 48800 48100 4
N 49800 48300 50500 48300 4
{
T 50600 48300 5 10 1 1 0 0 1
netname=m
}
N 48800 48500 48100 48500 4
C 48800 45500 1 0 0 opamp-1.sym
{
T 49500 46300 5 10 0 0 0 0 1
device=OPAMP
T 49500 46100 5 10 1 1 0 0 1
refdes=X2
T 49500 46900 5 10 0 0 0 0 1
symversion=0.1
T 48400 46800 5 10 1 0 0 0 1
model-name=opbw
}
C 49100 46300 1 0 0 vcc-1.sym
C 49500 45500 1 180 0 vee-1.sym
N 49800 45900 49800 44900 4
N 48800 44900 49800 44900 4
N 48800 44900 48800 45700 4
N 49800 45900 50500 45900 4
{
T 50600 45800 5 10 1 1 0 0 1
netname=b
}
N 48800 46100 48100 46100 4
C 48800 42900 1 0 0 opamp-1.sym
{
T 49500 43700 5 10 0 0 0 0 1
device=OPAMP
T 49500 43500 5 10 1 1 0 0 1
refdes=X3
T 49500 44300 5 10 0 0 0 0 1
symversion=0.1
T 48400 44200 5 10 1 0 0 0 1
model-name=opgain
}
C 49100 43700 1 0 0 vcc-1.sym
C 49500 42900 1 180 0 vee-1.sym
N 49800 43300 49800 42300 4
N 48800 42300 49800 42300 4
N 48800 42300 48800 43100 4
N 49800 43300 50500 43300 4
{
T 50700 43300 5 10 1 1 0 0 1
netname=g
}
N 48800 43500 48100 43500 4
C 41000 45800 1 0 0 vpulse-1.sym
{
T 41700 46450 5 10 1 1 0 0 1
refdes=Vin
T 41700 46650 5 10 0 0 0 0 1
device=vpulse
T 41700 46850 5 10 0 0 0 0 1
footprint=none
T 41700 46250 5 10 1 1 0 0 1
value=ac 1 pulse( -1 1 1u 100n 100n 50u 100u)
}
C 41200 45500 1 0 0 gnd-1.sym
N 48100 48500 48100 43500 4
N 43100 47000 48100 47000 4
C 43900 48800 1 0 0 spice-directive-1.sym
{
T 44000 49100 5 10 0 1 0 0 1
device=directive
T 44000 49200 5 10 1 1 0 0 1
refdes=A2
T 44000 48900 5 10 1 1 0 0 1
value=.ac dec 100 1k 10meg
}
C 43900 49700 1 0 0 spice-directive-1.sym
{
T 44000 50000 5 10 0 1 0 0 1
device=directive
T 44000 50100 5 10 1 1 0 0 1
refdes=A1
T 44000 49800 5 10 1 1 0 0 1
value=.include jpdoplib.inc
}
C 42200 46900 1 0 0 resistor-1.sym
{
T 42500 47300 5 10 0 0 0 0 1
device=RESISTOR
T 42400 47200 5 10 1 1 0 0 1
refdes=Rg
T 42600 46700 5 10 1 1 0 0 1
value=50
}
N 42200 47000 41300 47000 4
