v 20111231 2
C 40000 40000 0 0 0 EMBEDDEDtitle-block.sym
[
T 52300 41800 5 10 0 0 0 0 1
graphical=1
L 49000 40700 55200 40700 15 0 0 0 -1 -1
L 55200 41800 55200 40700 15 0 0 0 -1 -1
L 56150 40350 56050 40100 15 0 0 0 -1 -1
L 55200 40450 56500 40450 15 0 0 0 -1 -1
L 55200 41100 56500 41100 15 0 0 0 -1 -1
B 49000 40000 7500 1800 15 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
T 49100 40800 15 8 1 0 0 0 1
TITLE
T 52100 41300 5 30 0 1 0 4 1
Title=Title
T 49100 40100 15 8 1 0 0 0 1
FILE:
T 51400 40300 5 16 0 1 0 4 1
filename=filename.sch
T 55300 41200 15 8 1 0 0 0 1
REV.:
T 55850 41500 5 16 0 1 0 4 1
revision=revision
T 55300 40100 15 8 1 0 0 0 1
PAGE:
T 56050 40100 5 16 0 1 0 6 1
page=n
T 56200 40100 5 16 0 1 0 0 1
number_of_pages=m
T 55300 40550 15 8 1 0 0 0 1
DATE:
T 55850 40850 5 12 0 1 0 4 1
date=DD.MM.YY
T 53600 40100 15 8 1 0 0 0 1
DRAWN BY: 
T 54350 40450 5 16 0 1 0 4 1
author=author
L 55200 40700 55200 40000 15 0 0 0 -1 -1
L 53500 40700 53500 40000 15 0 0 0 -1 -1
]
{
T 52100 41300 5 30 1 1 0 4 1
Title=Sub-a
T 51400 40300 5 16 1 1 0 4 1
filename=sub-a.sch
T 55850 41500 5 16 1 1 0 4 1
revision=revision
T 56050 40100 5 16 1 1 0 6 1
page=2
T 56200 40100 5 16 1 1 0 0 1
number_of_pages=3
T 55850 40850 5 12 1 1 0 4 1
date=04.08.12
T 54350 40450 5 16 1 1 0 4 1
author=-<)kmk(>-
}
C 51600 42500 1 0 0 EMBEDDEDopamp.sym
[
T 51800 45400 5 8 0 0 0 0 1
description=operational amplifier
T 51800 45200 5 8 0 0 0 0 1
comment=Use symbol opamp_pwr.sym to connect power pins.
T 51800 45000 5 8 0 0 0 0 1
documentation=http://www.ti.com/lit/gpn/tl081
T 51800 44800 5 8 0 0 0 0 1
footprints=SO8, DIP8
T 51800 44600 5 8 0 0 0 0 1
symversion=1.0
T 51800 44400 5 8 0 0 0 0 1
author=Kai-Martin Knaak kmk@lilalaser.de
T 51800 44200 5 8 0 0 0 0 1
dist-license=GPL 3, http://www.gnu.org/licenses/gpl-3.0.txt
T 52300 43500 8 10 0 1 0 0 1
refdes=U?
T 52300 43300 8 10 0 1 0 0 1
value=TL081
T 52300 43100 8 8 0 1 0 0 1
footprint=SO8
P 51700 42700 51800 42700 1 0 0
{
T 51750 42750 5 8 1 1 0 6 1
pinnumber=2
T 51750 42750 5 8 0 1 0 6 1
pinseq=2
T 51850 42600 9 16 0 1 0 0 1
pinlabel=-
T 51750 42650 5 8 0 1 0 8 1
pintype=in
}
P 51700 43100 51800 43100 1 0 0
{
T 51750 43150 5 8 1 1 0 6 1
pinnumber=3
T 51750 43150 5 8 0 1 0 6 1
pinseq=3
T 51850 43000 9 16 0 1 0 0 1
pinlabel=+
T 51750 43050 5 8 0 1 0 8 1
pintype=in
}
P 52600 42900 52700 42900 1 0 1
{
T 52600 42950 5 8 1 1 0 0 1
pinnumber=6
T 52600 42950 5 8 0 1 0 0 1
pinseq=6
T 52600 42750 5 8 0 1 0 0 1
pintype=out
T 52400 42900 9 8 0 1 0 7 1
pinlabel=out
}
T 51800 44000 5 8 0 0 0 0 1
use-license=free, no restrictions
L 51800 43300 52600 42900 3 10 0 0 -1 -1
L 51800 42500 52600 42900 3 10 0 0 -1 -1
L 51850 43100 51950 43100 3 10 0 0 -1 -1
L 51900 43150 51900 43050 3 10 0 0 -1 -1
L 51850 42700 51950 42700 3 10 0 0 -1 -1
L 51800 43300 51800 42500 3 10 2 0 -1 -1
]
{
T 51800 44600 5 8 0 0 0 0 1
symversion=1.0
T 52300 43500 5 10 1 1 0 0 1
refdes=U1
T 52300 43300 5 10 1 1 0 0 1
value=TL081
T 52300 43100 5 8 1 1 0 0 1
footprint=SO8
}
C 50600 43000 1 0 0 EMBEDDEDin.sym
[
T 51300 44800 5 8 0 0 0 0 1
device=INPORT
T 51300 44600 5 8 0 0 0 0 1
description=signal that enters a sub sheet
T 51300 44000 5 8 0 0 0 0 1
author=K-M. Knaak, kmk@lilalaser.de
T 51300 43800 5 8 0 0 0 0 1
dist-license=GPL 3, for details see http://www.gnu.org/licenses/gpl-3.0.txt
T 51300 43600 5 8 0 0 0 0 1
use-license=free, no restrictions
T 51300 43400 5 8 0 0 0 0 1
footprint=none
T 51250 43100 8 10 0 1 0 7 1
refdes=in-net
P 51600 43100 51700 43100 1 0 1
{
T 51650 43150 5 6 0 1 0 0 1
pinnumber=1
T 51650 43150 5 6 0 1 0 0 1
pinseq=1
}
L 51600 43100 51300 43200 3 10 2 0 -1 -1
L 51600 43100 51300 43000 3 10 2 0 -1 -1
L 51300 43000 51300 43200 3 10 2 0 -1 -1
T 51300 44200 5 8 0 0 0 0 1
symversion=1.0
T 51300 44400 5 8 0 0 0 0 1
comment=The value of the refdes should correspond to a pin label in a subsheet symbol.
]
{
T 51300 44800 5 8 0 0 0 0 1
device=INPORT
T 51300 43400 5 8 0 0 0 0 1
footprint=none
T 51250 43100 5 10 1 1 0 7 1
refdes=in1
T 51300 44200 5 8 0 0 0 0 1
symversion=1.0
}
C 50600 42600 1 0 0 EMBEDDEDin.sym
[
T 51300 44400 5 8 0 0 0 0 1
device=INPORT
T 51300 44200 5 8 0 0 0 0 1
description=signal that enters a sub sheet
T 51300 43600 5 8 0 0 0 0 1
author=K-M. Knaak, kmk@lilalaser.de
T 51300 43400 5 8 0 0 0 0 1
dist-license=GPL 3, for details see http://www.gnu.org/licenses/gpl-3.0.txt
T 51300 43200 5 8 0 0 0 0 1
use-license=free, no restrictions
T 51300 43000 5 8 0 0 0 0 1
footprint=none
T 51250 42700 8 10 0 1 0 7 1
refdes=in-net
P 51600 42700 51700 42700 1 0 1
{
T 51650 42750 5 6 0 1 0 0 1
pinnumber=1
T 51650 42750 5 6 0 1 0 0 1
pinseq=1
}
L 51600 42700 51300 42800 3 10 2 0 -1 -1
L 51600 42700 51300 42600 3 10 2 0 -1 -1
L 51300 42600 51300 42800 3 10 2 0 -1 -1
T 51300 43800 5 8 0 0 0 0 1
symversion=1.0
T 51300 44000 5 8 0 0 0 0 1
comment=The value of the refdes should correspond to a pin label in a subsheet symbol.
]
{
T 51300 44400 5 8 0 0 0 0 1
device=INPORT
T 51300 43000 5 8 0 0 0 0 1
footprint=none
T 51250 42700 5 10 1 1 0 7 1
refdes=in2
T 51300 43800 5 8 0 0 0 0 1
symversion=1.0
}
C 52700 42800 1 0 0 EMBEDDEDout.sym
[
T 53150 42925 8 10 0 1 0 1 1
refdes=out-net
P 52700 42900 52800 42900 1 0 0
{
T 52750 42950 5 6 0 1 0 6 1
pinnumber=1
T 52750 42950 5 6 0 1 0 6 1
pinseq=1
}
L 53100 42900 52800 43000 3 10 2 0 -1 -1
L 53100 42900 52800 42800 3 10 2 0 -1 -1
L 52800 43000 52800 42800 3 10 2 0 -1 -1
T 52800 44600 5 8 0 0 0 0 1
device=OUTPORT
T 52800 44400 5 8 0 0 0 0 1
description=signal that leaves a sub sheet
T 52800 44200 5 8 0 0 0 0 1
comment=The value of the refdes should correspond to a pin label in a subsheet symbol.
T 52800 44000 5 8 0 0 0 0 1
symversion=1.0
T 52800 43800 5 8 0 0 0 0 1
author=K-M. Knaak, kmk@lilalaser.de
T 52800 43600 5 8 0 0 0 0 1
dist-license=GPL 3, for details see http://www.gnu.org/licenses/gpl-3.0.txt
T 52800 43400 5 8 0 0 0 0 1
use-license=free, no restrictions
T 52800 43200 5 8 0 0 0 0 1
footprint=none
]
{
T 53150 42925 5 10 1 1 0 1 1
refdes=out11
T 52800 44600 5 8 0 0 0 0 1
device=OUTPORT
T 52800 44000 5 8 0 0 0 0 1
symversion=1.0
T 52800 43200 5 8 0 0 0 0 1
footprint=none
}
B 49000 40000 7500 4900 3 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
