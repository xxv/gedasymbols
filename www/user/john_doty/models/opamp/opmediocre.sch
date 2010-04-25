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
title=Model of a Mediocre Opamp
}
C 40400 49800 1 0 0 spice-subcircuit-LL-1.sym
{
T 40500 50100 5 10 0 1 0 0 1
device=spice-subcircuit-LL
T 40500 50200 5 10 1 1 0 0 1
refdes=A1
T 40500 49900 5 10 1 1 0 0 1
model-name=opmediocre
}
C 54800 44900 1 0 0 spice-subcircuit-IO-1.sym
{
T 55700 45300 5 10 0 1 0 0 1
device=spice-IO
T 55650 45150 5 10 1 1 0 0 1
refdes=P5
}
N 49400 45000 50800 45000 4
N 50800 45400 49400 45400 4
C 49600 45100 1 0 1 spice-subcircuit-IO-1.sym
{
T 48700 45500 5 10 0 1 0 6 1
device=spice-IO
T 48750 45350 5 10 1 1 0 6 1
refdes=P1
}
C 49600 44700 1 0 1 spice-subcircuit-IO-1.sym
{
T 48700 45100 5 10 0 1 0 6 1
device=spice-IO
T 48750 44950 5 10 1 1 0 6 1
refdes=P2
}
C 50200 46000 1 0 1 spice-subcircuit-IO-1.sym
{
T 49300 46400 5 10 0 1 0 6 1
device=spice-IO
T 49350 46250 5 10 1 1 0 6 1
refdes=P3
}
C 50900 42800 1 0 1 spice-subcircuit-IO-1.sym
{
T 50000 43200 5 10 0 1 0 6 1
device=spice-IO
T 50050 43050 5 10 1 1 0 6 1
refdes=P4
}
N 51600 44900 51600 43100 4
N 50700 43100 53800 43100 4
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
C 50700 44700 1 0 0 EMBEDDEDota.sym
[
L 51000 45600 51000 44800 3 0 0 0 -1 -1
L 51000 45600 51800 45200 3 0 0 0 -1 -1
T 51500 45600 5 10 0 0 0 0 1
device=OTA
L 51800 45200 51000 44800 3 0 0 0 -1 -1
L 51100 45450 51100 45350 3 0 0 0 -1 -1
L 51050 45400 51150 45400 3 0 0 0 -1 -1
L 51050 45000 51150 45000 3 0 0 0 -1 -1
P 50800 45400 51000 45400 1 0 0
{
T 50950 45450 5 8 1 1 0 6 1
pinnumber=3
T 50950 45350 5 8 0 1 0 8 1
pinseq=1
T 51050 45400 9 8 0 1 0 0 1
pinlabel=in+
T 51050 45400 5 8 0 1 0 2 1
pintype=in
}
P 50800 45000 51000 45000 1 0 0
{
T 50950 45050 5 8 1 1 0 6 1
pinnumber=2
T 50950 44950 5 8 0 1 0 8 1
pinseq=2
T 51050 45000 9 8 0 1 0 0 1
pinlabel=in-
T 51050 45000 5 8 0 1 0 2 1
pintype=in
}
P 51800 45200 52000 45200 1 0 1
{
T 51800 45250 5 8 1 1 0 0 1
pinnumber=6
T 51800 45150 5 8 0 1 0 2 1
pinseq=5
T 51750 45200 9 8 0 1 0 6 1
pinlabel=out
T 51750 45200 5 8 0 1 0 8 1
pintype=out
}
P 51600 45300 51600 45500 1 0 1
{
T 51650 45300 5 8 1 1 0 0 1
pinnumber=7
T 51650 45300 5 8 0 1 0 2 1
pinseq=3
T 51600 45300 9 8 0 1 0 5 1
pinlabel=V+
T 51600 45250 5 8 0 1 0 5 1
pintype=pwr
}
P 51600 45100 51600 44900 1 0 1
{
T 51650 45000 5 8 1 1 0 0 1
pinnumber=4
T 51650 45000 5 8 0 1 0 2 1
pinseq=4
T 51600 45100 9 8 0 1 0 3 1
pinlabel=V-
T 51600 45200 5 8 0 1 0 3 1
pintype=pwr
}
T 51100 45600 8 10 0 1 0 0 1
refdes=U?
T 51500 46000 5 10 0 0 0 0 1
description=operational transconductance amplifier
T 51500 45800 5 10 0 0 0 0 1
numslots=0
T 51500 46200 5 10 0 0 0 0 1
symversion=0.1
P 51400 45000 51400 44800 1 0 1
{
T 51450 44900 5 8 1 1 0 0 1
pinnumber=5
T 51450 44900 5 8 0 1 0 2 1
pinseq=6
T 51400 45100 9 8 1 1 0 3 1
pinlabel=Iabc
T 51400 45100 5 8 0 1 0 3 1
pintype=pas
}
T 52800 45700 8 10 0 0 0 0 1
model-name=CA3080
]
{
T 51500 45600 5 10 0 0 0 0 1
device=OTA
T 51100 45600 5 10 1 1 0 0 1
refdes=X1
T 51500 46200 5 10 0 0 0 0 1
symversion=0.1
T 52800 45700 5 10 0 0 0 0 1
model-name=CA3080
}
C 50500 44800 1 180 0 idc-1.sym
{
T 49800 44150 5 10 1 1 180 0 1
refdes=I1
T 49800 43950 5 10 0 0 180 0 1
device=CURRENT_SOURCE
T 49800 43750 5 10 0 0 180 0 1
footprint=none
T 49800 44350 5 10 1 1 180 0 1
value=DC 0.05mA
}
N 50200 43600 51400 43600 4
N 51400 43600 51400 44800 4
N 50200 44800 50200 46300 4
N 50000 46300 53200 46300 4
N 51600 46300 51600 45500 4
N 52700 45800 52700 44300 4
N 53200 44800 53200 45300 4
N 54000 45200 53200 45200 4
N 53200 43800 53200 43100 4
C 52700 44800 1 180 1 EMBEDDEDasic-pnp.sym
[
L 52900 44000 52900 44600 3 0 0 0 -1 -1
T 53300 44400 5 10 0 0 180 6 1
device=PNP_TRANSISTOR
P 52700 44300 52900 44300 1 0 0
{
T 52800 44250 5 6 1 1 180 6 1
pinnumber=B
T 52800 44250 5 6 0 0 180 6 1
pinseq=2
T 52800 44250 5 6 0 1 180 6 1
pinlabel=B
T 52800 44250 5 6 0 1 180 6 1
pintype=pas
}
P 53200 43800 53200 44000 1 0 0
{
T 53100 43950 5 6 1 1 180 6 1
pinnumber=C
T 53100 43950 5 6 0 0 180 6 1
pinseq=1
T 53100 43950 5 6 0 1 180 6 1
pinlabel=C
T 53100 43950 5 6 0 1 180 6 1
pintype=pas
}
P 53200 44600 53200 44800 1 0 1
{
T 53100 44750 5 6 1 1 180 6 1
pinnumber=E
T 53100 44750 5 6 0 0 180 6 1
pinseq=3
T 53100 44750 5 6 0 1 180 6 1
pinlabel=E
T 53100 44750 5 6 0 1 180 6 1
pintype=pas
}
L 52900 44450 53200 44600 3 0 0 0 -1 -1
L 52900 44150 53200 44000 3 0 0 0 -1 -1
H 3 0 0 0 -1 -1 1 -1 -1 -1 -1 -1 5
M 52997,44459
L 52900,44450
L 52969,44523
L 52977,44489
z
T 53200 44200 8 10 0 1 180 6 1
refdes=Q?
P 53200 44300 52900 44300 1 0 0
{
T 53095 44255 5 6 1 1 180 6 1
pinnumber=S
T 53100 44250 5 6 0 0 180 0 1
pinseq=4
T 52945 44305 5 6 0 1 180 0 1
pinlabel=S
T 53100 44250 5 6 0 1 180 0 1
pintype=pas
}
]
{
T 53300 44400 5 10 0 0 180 6 1
device=PNP_TRANSISTOR
T 53200 44200 5 10 1 1 180 6 1
refdes=Q2
T 52400 42800 5 10 1 0 0 0 1
model-name=latpnp
}
C 52700 45300 1 0 0 EMBEDDEDasic-npn.sym
[
L 52900 46100 52900 45500 3 0 0 0 -1 -1
T 53300 45800 5 10 0 0 0 0 1
device=NPN_TRANSISTOR
P 52700 45800 52900 45800 1 0 0
{
T 52800 45850 5 6 1 1 0 0 1
pinnumber=B
T 52800 45850 5 6 0 0 0 0 1
pinseq=2
T 52800 45850 5 6 0 1 0 0 1
pinlabel=B
T 52800 45850 5 6 0 1 0 0 1
pintype=pas
}
P 53200 46300 53200 46100 1 0 0
{
T 53100 46150 5 6 1 1 0 0 1
pinnumber=C
T 53100 46150 5 6 0 0 0 0 1
pinseq=1
T 53100 46150 5 6 0 1 0 0 1
pinlabel=C
T 53100 46150 5 6 0 1 0 0 1
pintype=pas
}
P 53200 45500 53200 45300 1 0 1
{
T 53100 45350 5 6 1 1 0 0 1
pinnumber=E
T 53100 45350 5 6 0 0 0 0 1
pinseq=3
T 53100 45350 5 6 0 1 0 0 1
pinlabel=E
T 53100 45350 5 6 0 1 0 0 1
pintype=pas
}
L 52900 45950 53200 46100 3 0 0 0 -1 -1
L 52900 45650 53200 45500 3 0 0 0 -1 -1
T 53200 45900 8 10 0 1 0 0 1
refdes=Q?
H 3 0 0 0 -1 -1 1 -1 -1 -1 -1 -1 5
M 53103,45509
L 53201,45500
L 53131,45573
L 53125,45540
z
P 53200 45800 52900 45800 1 0 0
{
T 53095 45845 5 6 1 1 0 0 1
pinnumber=S
T 53100 45850 5 6 0 0 0 6 1
pinseq=4
T 52945 45795 5 6 0 1 0 6 1
pinlabel=S
T 53100 45850 5 6 0 1 0 6 1
pintype=pas
}
]
{
T 53300 45800 5 10 0 0 0 0 1
device=NPN_TRANSISTOR
T 53200 45900 5 10 1 1 0 0 1
refdes=Q1
T 52500 46500 5 10 1 0 0 0 1
model-name=vertnpn
}
N 53200 44300 53800 44300 4
N 53800 43100 53800 45800 4
N 53200 45800 53800 45800 4
C 52000 43400 1 0 0 capacitor-1.sym
{
T 52200 44100 5 10 0 0 0 0 1
device=CAPACITOR
T 52200 43900 5 10 1 1 0 0 1
refdes=C1
T 52200 44300 5 10 0 0 0 0 1
symversion=0.1
T 52600 43400 5 10 1 1 0 0 1
value=50p
}
C 53800 43000 1 0 0 resistor-1.sym
{
T 54100 43400 5 10 0 0 0 0 1
device=RESISTOR
T 54000 43300 5 10 1 1 0 0 1
refdes=R2
T 54100 42800 5 10 1 1 0 0 1
value=10k
}
C 54000 45100 1 0 0 resistor-1.sym
{
T 54300 45500 5 10 0 0 0 0 1
device=RESISTOR
T 54200 45400 5 10 1 1 0 0 1
refdes=R1
T 54200 44900 5 10 1 1 0 0 1
value=100
}
N 54900 45200 55000 45200 4
N 54900 45200 54900 43100 4
N 54900 43100 54700 43100 4
N 52900 43600 53200 43600 4
N 52000 43600 52000 45200 4
N 52000 45200 52700 45200 4
C 42500 46900 1 0 0 opamp-1.sym
{
T 43200 47700 5 10 0 0 0 0 1
device=OPAMP
T 43200 47500 5 10 1 1 0 0 1
refdes=X?
T 43200 48300 5 10 0 0 0 0 1
symversion=0.1
T 43000 47400 5 10 0 0 0 0 1
graphical=1
T 42500 46500 5 10 1 0 0 0 1
model-name=opmediocre
}
T 42500 48100 9 10 1 0 0 0 1
Usage:
T 42000 44900 9 10 1 0 0 0 7
One way to incorporate this model into
your simulation is to copy/paste the above
symbol into your simulation schematic,
remove the (invisible) graphical=1 attribute,
and fix the refdes attribute. Also include
the jpdoplib.inc library in your spice file.
See optest.sch for an example.
