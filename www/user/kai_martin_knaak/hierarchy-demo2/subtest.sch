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
Title=Subtest
T 51400 40300 5 16 1 1 0 4 1
filename=subtest.sch
T 55850 41500 5 16 1 1 0 4 1
revision=revision
T 56050 40100 5 16 1 1 0 6 1
page=1
T 56200 40100 5 16 1 1 0 0 1
number_of_pages=3
T 55850 40850 5 12 1 1 0 4 1
date=04.08.12
T 54350 40450 5 16 1 1 0 4 1
author=-<)kmk(>-
}
C 49600 43200 1 0 0 EMBEDDEDsubsheet-2.sym
[
B 49900 44100 2400 2800 3 10 2 0 -1 -1 0 -1 -1 -1 -1 -1
T 49900 47000 8 10 0 1 0 0 1
refdes=?
T 51100 44200 8 10 0 1 0 4 1
source=subsheet-foo-bar.sch
T 50000 46600 8 20 0 1 0 1 1
description=name
B 49900 43600 2400 500 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
T 49900 48500 5 8 0 0 0 0 1
dist-license=GPL 3, see http://www.gnu.org/licenses/gpl-3.0.txt for details
T 49900 48900 5 8 0 0 0 0 1
comment=template for subsheet, pin distance 400 units
T 49900 48700 5 8 0 0 0 0 1
author=Kai-Martin Knaak, kmk@lilalaser.de
T 49900 48300 5 8 0 0 0 0 1
use-license=free, no restrictions
P 49800 46200 49900 46200 1 0 0
{
T 49950 46200 9 10 1 1 0 1 1
pinlabel=in1
T 49850 46250 5 10 0 1 0 6 1
pinnumber=1
T 49950 46100 5 8 0 1 0 2 1
pintype=pas
}
P 52400 46200 52300 46200 1 0 0
{
T 52250 46200 9 10 1 1 0 7 1
pinlabel=out11
T 52350 46250 5 10 0 1 0 0 1
pinnumber=11
T 52250 46100 5 8 0 1 0 8 1
pintype=pas
}
P 50100 43500 50100 43600 1 0 0
{
T 50100 43650 9 10 1 1 270 7 1
pinlabel=GND
T 50150 43550 5 8 0 1 270 0 1
pinnumber=100
T 50000 43650 5 8 0 1 270 8 1
pintype=pwr
}
P 49800 45800 49900 45800 1 0 0
{
T 49950 45800 9 10 1 1 0 1 1
pinlabel=in2
T 49850 45850 5 10 0 1 0 6 1
pinnumber=2
T 49950 45700 5 8 0 1 0 2 1
pintype=pas
}
P 49800 45400 49900 45400 1 0 0
{
T 49950 45400 9 10 1 1 0 1 1
pinlabel=in3
T 49850 45450 5 10 0 1 0 6 1
pinnumber=3
T 49950 45300 5 8 0 1 0 2 1
pintype=pas
}
P 49800 45000 49900 45000 1 0 0
{
T 49950 45000 9 10 1 1 0 1 1
pinlabel=in4
T 49850 45050 5 10 0 1 0 6 1
pinnumber=4
T 49950 44900 5 8 0 1 0 2 1
pintype=pas
}
P 49800 44600 49900 44600 1 0 0
{
T 49950 44600 9 10 1 1 0 1 1
pinlabel=in5
T 49850 44650 5 10 0 1 0 6 1
pinnumber=5
T 49950 44500 5 8 0 1 0 2 1
pintype=pas
}
P 52400 45800 52300 45800 1 0 0
{
T 52250 45800 9 10 1 1 0 7 1
pinlabel=out12
T 52350 45850 5 10 0 1 0 0 1
pinnumber=12
T 52250 45700 5 8 0 1 0 8 1
pintype=pas
}
P 52400 45400 52300 45400 1 0 0
{
T 52250 45400 9 10 1 1 0 7 1
pinlabel=out13
T 52350 45450 5 10 0 1 0 0 1
pinnumber=13
T 52250 45300 5 8 0 1 0 8 1
pintype=pas
}
P 52400 45000 52300 45000 1 0 0
{
T 52250 45000 9 10 1 1 0 7 1
pinlabel=out14
T 52350 45050 5 10 0 1 0 0 1
pinnumber=14
T 52250 44900 5 8 0 1 0 8 1
pintype=pas
}
P 52400 44600 52300 44600 1 0 0
{
T 52250 44600 9 10 1 1 0 7 1
pinlabel=out15
T 52350 44650 5 10 0 1 0 0 1
pinnumber=15
T 52250 44500 5 8 0 1 0 8 1
pintype=pas
}
P 50500 43500 50500 43600 1 0 0
{
T 50500 43650 9 9 1 1 270 7 1
pinlabel=rGND
T 50550 43550 5 8 0 1 270 0 1
pinnumber=101
T 50400 43650 5 8 0 1 270 8 1
pintype=pwr
}
P 50900 43500 50900 43600 1 0 0
{
T 50900 43650 9 10 1 1 270 7 1
pinlabel=+Ub
T 50950 43550 5 8 0 1 270 0 1
pinnumber=102
T 50800 43650 5 8 0 1 270 8 1
pintype=pwr
}
P 51300 43500 51300 43600 1 0 0
{
T 51300 43650 9 10 1 1 270 7 1
pinlabel=-Ub
T 51350 43550 5 8 0 1 270 0 1
pinnumber=103
T 51200 43650 5 8 0 1 270 8 1
pintype=pwr
}
P 51700 43500 51700 43600 1 0 0
{
T 51700 43650 9 10 1 1 270 7 1
pinlabel=Vref
T 51750 43550 5 8 0 1 270 0 1
pinnumber=104
T 51600 43650 5 8 0 1 270 8 1
pintype=pwr
}
P 52100 43500 52100 43600 1 0 0
{
T 52100 43650 9 10 1 1 270 7 1
pinlabel=+5V
T 52150 43550 5 8 0 1 270 0 1
pinnumber=105
T 52000 43650 5 8 0 1 270 8 1
pintype=pas
}
]
{
T 49900 47000 5 10 1 1 0 0 1
refdes=1
T 51100 44200 5 10 1 1 0 4 1
source=sub-a.sch
T 50000 46600 5 20 1 1 0 1 1
description=opamp
}
C 53500 43300 1 0 0 EMBEDDEDsubsheet-2.sym
[
B 53800 44200 2400 2800 3 10 2 0 -1 -1 0 -1 -1 -1 -1 -1
T 53800 47100 8 10 0 1 0 0 1
refdes=?
T 55000 44300 8 10 0 1 0 4 1
source=subsheet-foo-bar.sch
T 53900 46700 8 20 0 1 0 1 1
description=name
B 53800 43700 2400 500 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
T 53800 48600 5 8 0 0 0 0 1
dist-license=GPL 3, see http://www.gnu.org/licenses/gpl-3.0.txt for details
T 53800 49000 5 8 0 0 0 0 1
comment=template for subsheet, pin distance 400 units
T 53800 48800 5 8 0 0 0 0 1
author=Kai-Martin Knaak, kmk@lilalaser.de
T 53800 48400 5 8 0 0 0 0 1
use-license=free, no restrictions
P 53700 46300 53800 46300 1 0 0
{
T 53850 46300 9 10 1 1 0 1 1
pinlabel=in1
T 53750 46350 5 10 0 1 0 6 1
pinnumber=1
T 53850 46200 5 8 0 1 0 2 1
pintype=pas
}
P 56300 46300 56200 46300 1 0 0
{
T 56150 46300 9 10 1 1 0 7 1
pinlabel=out11
T 56250 46350 5 10 0 1 0 0 1
pinnumber=11
T 56150 46200 5 8 0 1 0 8 1
pintype=pas
}
P 54000 43600 54000 43700 1 0 0
{
T 54000 43750 9 10 1 1 270 7 1
pinlabel=GND
T 54050 43650 5 8 0 1 270 0 1
pinnumber=100
T 53900 43750 5 8 0 1 270 8 1
pintype=pwr
}
P 53700 45900 53800 45900 1 0 0
{
T 53850 45900 9 10 1 1 0 1 1
pinlabel=in2
T 53750 45950 5 10 0 1 0 6 1
pinnumber=2
T 53850 45800 5 8 0 1 0 2 1
pintype=pas
}
P 53700 45500 53800 45500 1 0 0
{
T 53850 45500 9 10 1 1 0 1 1
pinlabel=in3
T 53750 45550 5 10 0 1 0 6 1
pinnumber=3
T 53850 45400 5 8 0 1 0 2 1
pintype=pas
}
P 53700 45100 53800 45100 1 0 0
{
T 53850 45100 9 10 1 1 0 1 1
pinlabel=in4
T 53750 45150 5 10 0 1 0 6 1
pinnumber=4
T 53850 45000 5 8 0 1 0 2 1
pintype=pas
}
P 53700 44700 53800 44700 1 0 0
{
T 53850 44700 9 10 1 1 0 1 1
pinlabel=in5
T 53750 44750 5 10 0 1 0 6 1
pinnumber=5
T 53850 44600 5 8 0 1 0 2 1
pintype=pas
}
P 56300 45900 56200 45900 1 0 0
{
T 56150 45900 9 10 1 1 0 7 1
pinlabel=out12
T 56250 45950 5 10 0 1 0 0 1
pinnumber=12
T 56150 45800 5 8 0 1 0 8 1
pintype=pas
}
P 56300 45500 56200 45500 1 0 0
{
T 56150 45500 9 10 1 1 0 7 1
pinlabel=out13
T 56250 45550 5 10 0 1 0 0 1
pinnumber=13
T 56150 45400 5 8 0 1 0 8 1
pintype=pas
}
P 56300 45100 56200 45100 1 0 0
{
T 56150 45100 9 10 1 1 0 7 1
pinlabel=out14
T 56250 45150 5 10 0 1 0 0 1
pinnumber=14
T 56150 45000 5 8 0 1 0 8 1
pintype=pas
}
P 56300 44700 56200 44700 1 0 0
{
T 56150 44700 9 10 1 1 0 7 1
pinlabel=out15
T 56250 44750 5 10 0 1 0 0 1
pinnumber=15
T 56150 44600 5 8 0 1 0 8 1
pintype=pas
}
P 54400 43600 54400 43700 1 0 0
{
T 54400 43750 9 9 1 1 270 7 1
pinlabel=rGND
T 54450 43650 5 8 0 1 270 0 1
pinnumber=101
T 54300 43750 5 8 0 1 270 8 1
pintype=pwr
}
P 54800 43600 54800 43700 1 0 0
{
T 54800 43750 9 10 1 1 270 7 1
pinlabel=+Ub
T 54850 43650 5 8 0 1 270 0 1
pinnumber=102
T 54700 43750 5 8 0 1 270 8 1
pintype=pwr
}
P 55200 43600 55200 43700 1 0 0
{
T 55200 43750 9 10 1 1 270 7 1
pinlabel=-Ub
T 55250 43650 5 8 0 1 270 0 1
pinnumber=103
T 55100 43750 5 8 0 1 270 8 1
pintype=pwr
}
P 55600 43600 55600 43700 1 0 0
{
T 55600 43750 9 10 1 1 270 7 1
pinlabel=Vref
T 55650 43650 5 8 0 1 270 0 1
pinnumber=104
T 55500 43750 5 8 0 1 270 8 1
pintype=pwr
}
P 56000 43600 56000 43700 1 0 0
{
T 56000 43750 9 10 1 1 270 7 1
pinlabel=+5V
T 56050 43650 5 8 0 1 270 0 1
pinnumber=105
T 55900 43750 5 8 0 1 270 8 1
pintype=pas
}
]
{
T 53800 47100 5 10 1 1 0 0 1
refdes=1
T 55000 44300 5 10 1 1 0 4 1
source=sub-b.sch
T 53900 46700 5 20 1 1 0 1 1
description=name
}
C 50400 47500 1 0 0 EMBEDDEDres_horiz.sym
[
T 50700 50500 5 8 0 0 0 0 1
device=resistor
T 50700 50300 5 8 0 0 0 0 1
description=generic resistor
T 50700 49700 5 8 0 0 0 0 1
documentation=none
T 50700 49300 5 8 0 0 0 0 1
author=Kai-Martin Knaak kmk@lilalaser.de
T 50700 49100 5 8 0 0 0 0 1
dist-license=GPL 3, see http://www.gnu.org/licenses/gpl-3.0.txt
T 50700 48900 5 8 0 0 0 0 1
use-license=free, no restrictions
T 50700 47700 8 10 0 1 0 0 1
refdes=R?
T 50700 47500 8 10 0 1 0 0 1
value=XXX
T 50700 47300 8 8 0 1 0 0 1
footprint=0805
P 51200 48000 51100 48000 1 0 0
{
T 51250 48050 5 8 0 1 0 0 1
pinnumber=2
T 51250 48050 5 8 0 1 0 0 1
pinseq=2
T 51250 48050 5 8 0 1 0 0 1
pinlabel=2
T 51150 47900 5 8 0 1 0 0 1
pintype=pas
}
P 50600 48000 50700 48000 1 0 0
{
T 50525 48050 5 8 0 1 0 0 1
pinnumber=1
T 50525 48050 5 8 0 1 0 0 1
pinseq=1
T 50525 48050 5 8 0 1 0 0 1
pinlabel=1
T 50425 47900 5 8 0 1 0 0 1
pintype=pas
}
B 50700 47900 400 200 3 10 2 0 -1 -1 0 -1 -1 -1 -1 -1
L 50700 47950 50750 47900 3 10 2 0 -1 -1
T 50700 49900 5 8 0 0 0 0 1
footprints=0805, 0603, res_400mil, res_600mil, res_800mil, res_300mil res_vert.fp res_socket.fp
T 50700 49500 5 8 0 0 0 0 1
symversion=1.0
T 50700 50100 5 8 0 0 0 0 1
comment=the little mark on the lower left corrsponds to the square pin in the footprint
]
{
T 50700 50500 5 8 0 0 0 0 1
device=resistor
T 50700 47700 5 10 1 1 0 0 1
refdes=R1
T 50700 47500 5 10 1 1 0 0 1
value=XXX
T 50700 47300 5 8 1 1 0 0 1
footprint=0805
T 50700 49500 5 8 0 0 0 0 1
symversion=1.0
}
N 49800 46200 49200 46200 4
N 49200 46200 49200 48000 4
N 49200 48000 50600 48000 4
N 51200 48000 52900 48000 4
N 52700 48000 52700 46200 4
N 52700 46200 52400 46200 4
C 52900 47600 1 0 0 EMBEDDEDcon_BNC.sym
[
T 53000 49300 5 8 0 0 0 0 1
description=BNC connector
T 53000 48900 5 8 0 0 0 0 1
author=Kai-Martin Knaak, kmk@lilalaser.de
T 53700 48100 8 10 0 1 0 0 1
refdes=CONN?
T 53700 47900 8 10 0 1 0 0 1
value=XXX
T 53700 47750 8 8 0 1 0 0 1
footprint=BNC_LAY
P 52900 48000 53000 48000 1 0 0
{
T 53150 48050 5 8 0 1 0 6 1
pinnumber=1
T 53150 48050 5 8 0 1 0 6 1
pinseq=1
T 53150 48050 9 8 0 1 0 6 1
pinlabel=1
T 53050 47900 5 8 0 1 0 0 1
pintype=pas
}
V 53300 48000 60 3 20 0 0 -1 -1 0 -1 -1 -1 -1 -1
P 53300 47600 53300 47690 1 0 0
{
T 53300 47750 5 8 0 1 0 6 1
pinnumber=2
T 53300 47750 5 8 0 1 0 6 1
pinseq=2
T 53300 47750 9 8 0 1 0 6 1
pinlabel=2
T 53300 47800 5 8 0 1 0 0 1
pintype=pas
}
V 53300 48000 310 3 20 0 0 -1 -1 0 -1 -1 -1 -1 -1
V 53300 47690 24 3 0 0 0 -1 -1 1 -1 -1 -1 -1 -1
L 53000 48000 53240 48000 3 10 0 0 -1 -1
V 53240 48000 24 3 0 0 0 -1 -1 1 -1 -1 -1 -1 -1
L 53490 47740 53510 47720 3 20 1 0 -1 -1
L 53510 47720 53580 47790 3 20 1 0 -1 -1
L 53580 47790 53560 47810 3 20 1 0 -1 -1
L 53110 48260 53090 48280 3 20 1 0 -1 -1
L 53090 48280 53020 48210 3 20 1 0 -1 -1
L 53020 48210 53040 48190 3 20 1 0 -1 -1
T 53000 49100 5 8 0 0 0 0 1
footprints=BNC_LAY, BNC_LAY2, BNC_LAY_BOTTOM, BNC_VERT, BNC_VERT2, BNC_VERT3, HF_multi
T 53000 48700 5 8 0 0 0 0 1
dist-license=GPL 3, see http://www.gnu.org/licenses/gpl.txt
T 53000 48500 5 8 0 0 0 0 1
use-license=free, no restrictions
]
{
T 53700 48100 5 10 1 1 0 0 1
refdes=CONN1
T 53700 47900 5 10 1 1 0 0 1
value=XXX
T 53700 47750 5 8 1 1 0 0 1
footprint=BNC_LAY
}
C 50000 43200 1 0 0 EMBEDDEDgnd.sym
[
P 50100 43400 50100 43500 1 0 1
{
T 50200 43300 5 8 0 1 0 0 1
pinnumber=1
T 50200 43300 5 8 0 1 0 0 1
pinlabel=1
T 50158 43461 5 8 0 1 0 0 1
pintype=pwr
}
L 50000 43400 50200 43400 3 10 0 0 -1 -1
L 50055 43350 50145 43350 3 10 0 0 -1 -1
L 50080 43310 50120 43310 3 10 0 0 -1 -1
T 50100 43800 5 8 0 0 0 0 1
net=GND:1
T 50100 44400 5 8 0 0 0 0 1
author=Kai-Martin Knaak, kmk@lilalaser.de
T 50100 45000 5 8 0 0 0 0 1
description=ground symbol
T 50100 44200 5 8 0 0 0 0 1
dist-license=GPL 3, see http://www.gnu.org/licenses/gpl.txt
T 50100 44000 5 8 0 0 0 0 1
use-license=free, no restrictions
T 50100 44600 5 8 0 0 0 0 1
symversion=1.0
T 50100 44800 5 8 0 0 0 0 1
footprint=none
]
{
T 50100 44600 5 8 0 0 0 0 1
symversion=1.0
T 50100 44800 5 8 0 0 0 0 1
footprint=none
}
C 53200 47300 1 0 0 EMBEDDEDgnd.sym
[
P 53300 47500 53300 47600 1 0 1
{
T 53400 47400 5 8 0 1 0 0 1
pinnumber=1
T 53400 47400 5 8 0 1 0 0 1
pinlabel=1
T 53358 47561 5 8 0 1 0 0 1
pintype=pwr
}
L 53200 47500 53400 47500 3 10 0 0 -1 -1
L 53255 47450 53345 47450 3 10 0 0 -1 -1
L 53280 47410 53320 47410 3 10 0 0 -1 -1
T 53300 47900 5 8 0 0 0 0 1
net=GND:1
T 53300 48500 5 8 0 0 0 0 1
author=Kai-Martin Knaak, kmk@lilalaser.de
T 53300 49100 5 8 0 0 0 0 1
description=ground symbol
T 53300 48300 5 8 0 0 0 0 1
dist-license=GPL 3, see http://www.gnu.org/licenses/gpl.txt
T 53300 48100 5 8 0 0 0 0 1
use-license=free, no restrictions
T 53300 48700 5 8 0 0 0 0 1
symversion=1.0
T 53300 48900 5 8 0 0 0 0 1
footprint=none
]
{
T 53300 48700 5 8 0 0 0 0 1
symversion=1.0
T 53300 48900 5 8 0 0 0 0 1
footprint=none
}
C 53900 43300 1 0 0 EMBEDDEDgnd.sym
[
P 54000 43500 54000 43600 1 0 1
{
T 54100 43400 5 8 0 1 0 0 1
pinnumber=1
T 54100 43400 5 8 0 1 0 0 1
pinlabel=1
T 54058 43561 5 8 0 1 0 0 1
pintype=pwr
}
L 53900 43500 54100 43500 3 10 0 0 -1 -1
L 53955 43450 54045 43450 3 10 0 0 -1 -1
L 53980 43410 54020 43410 3 10 0 0 -1 -1
T 54000 43900 5 8 0 0 0 0 1
net=GND:1
T 54000 44500 5 8 0 0 0 0 1
author=Kai-Martin Knaak, kmk@lilalaser.de
T 54000 45100 5 8 0 0 0 0 1
description=ground symbol
T 54000 44300 5 8 0 0 0 0 1
dist-license=GPL 3, see http://www.gnu.org/licenses/gpl.txt
T 54000 44100 5 8 0 0 0 0 1
use-license=free, no restrictions
T 54000 44700 5 8 0 0 0 0 1
symversion=1.0
T 54000 44900 5 8 0 0 0 0 1
footprint=none
]
{
T 54000 44700 5 8 0 0 0 0 1
symversion=1.0
T 54000 44900 5 8 0 0 0 0 1
footprint=none
}
C 51100 43500 1 180 0 EMBEDDEDUb+.sym
[
V 50900 43350 50 3 10 0 0 -1 -1 0 -1 -1 -1 -1 -1
P 50900 43400 50900 43500 1 0 1
{
T 51000 43400 5 8 0 1 180 6 1
pinnumber=1
T 50900 43250 5 10 1 1 180 3 1
pinlabel=+Ub
T 50800 43400 5 8 0 1 180 0 1
pintype=pwr
}
T 51000 41400 5 8 0 0 180 0 1
description=positive supply voltage
T 51000 42600 5 8 0 0 180 0 1
net=+Ub:1
T 51000 42000 5 8 0 0 180 0 1
author= Kai-Martin Knaak, kmk@lilalaser.de
T 51000 41600 5 8 0 0 180 0 1
footprint=none
T 51000 41800 5 8 0 0 180 0 1
symversion=1.0
T 51000 42400 5 8 0 0 180 0 1
use-license=free, no restrictions
T 51000 42200 5 8 0 0 180 0 1
dist-license=GPL 3, see http://www.gnu.org/licenses/gpl-3.0.txt
]
{
T 51000 41600 5 8 0 0 180 0 1
footprint=none
T 51000 41800 5 8 0 0 180 0 1
symversion=1.0
}
C 55000 43600 1 180 0 EMBEDDEDUb+.sym
[
V 54800 43450 50 3 10 0 0 -1 -1 0 -1 -1 -1 -1 -1
P 54800 43500 54800 43600 1 0 1
{
T 54900 43500 5 8 0 1 180 6 1
pinnumber=1
T 54800 43350 5 10 1 1 180 3 1
pinlabel=+Ub
T 54700 43500 5 8 0 1 180 0 1
pintype=pwr
}
T 54900 41500 5 8 0 0 180 0 1
description=positive supply voltage
T 54900 42700 5 8 0 0 180 0 1
net=+Ub:1
T 54900 42100 5 8 0 0 180 0 1
author= Kai-Martin Knaak, kmk@lilalaser.de
T 54900 41700 5 8 0 0 180 0 1
footprint=none
T 54900 41900 5 8 0 0 180 0 1
symversion=1.0
T 54900 42500 5 8 0 0 180 0 1
use-license=free, no restrictions
T 54900 42300 5 8 0 0 180 0 1
dist-license=GPL 3, see http://www.gnu.org/licenses/gpl-3.0.txt
]
{
T 54900 41700 5 8 0 0 180 0 1
footprint=none
T 54900 41900 5 8 0 0 180 0 1
symversion=1.0
}
C 49200 45300 1 0 0 EMBEDDEDgnd.sym
[
P 49300 45500 49300 45600 1 0 1
{
T 49400 45400 5 8 0 1 0 0 1
pinnumber=1
T 49400 45400 5 8 0 1 0 0 1
pinlabel=1
T 49358 45561 5 8 0 1 0 0 1
pintype=pwr
}
L 49200 45500 49400 45500 3 10 0 0 -1 -1
L 49255 45450 49345 45450 3 10 0 0 -1 -1
L 49280 45410 49320 45410 3 10 0 0 -1 -1
T 49300 45900 5 8 0 0 0 0 1
net=GND:1
T 49300 46500 5 8 0 0 0 0 1
author=Kai-Martin Knaak, kmk@lilalaser.de
T 49300 47100 5 8 0 0 0 0 1
description=ground symbol
T 49300 46300 5 8 0 0 0 0 1
dist-license=GPL 3, see http://www.gnu.org/licenses/gpl.txt
T 49300 46100 5 8 0 0 0 0 1
use-license=free, no restrictions
T 49300 46700 5 8 0 0 0 0 1
symversion=1.0
T 49300 46900 5 8 0 0 0 0 1
footprint=none
]
{
T 49300 46700 5 8 0 0 0 0 1
symversion=1.0
T 49300 46900 5 8 0 0 0 0 1
footprint=none
}
N 49300 45600 49300 45800 4
N 49300 45800 49800 45800 4
C 53300 42100 1 0 1 EMBEDDEDPS-2.sym
[
T 53200 44300 5 8 0 0 0 6 1
author=Kai-Martin Knaak, kmk@lilalaser.de
T 53200 43300 8 10 0 1 0 6 1
refdes=CONN?
T 53200 43100 8 10 0 1 0 6 1
value=XXX
T 53200 42950 8 8 0 1 0 6 1
footprint=PS_1x2PIN
P 53300 42700 53100 42700 1 0 0
{
T 53100 42750 5 8 0 1 0 0 1
pinnumber=1
T 53100 42650 5 8 0 1 0 2 1
pinseq=1
T 52950 42700 9 8 1 1 0 7 1
pinlabel=1
T 53050 42650 5 8 0 1 0 8 1
pintype=pas
}
V 53050 42700 50 6 10 2 0 -1 -1 0 -1 -1 -1 -1 -1
P 53300 42300 53100 42300 1 0 0
{
T 53100 42350 5 8 0 1 0 0 1
pinnumber=2
T 53100 42250 5 8 0 1 0 2 1
pinseq=2
T 52950 42300 9 8 1 1 0 7 1
pinlabel=2
T 53050 42250 5 8 0 1 0 8 1
pintype=pas
}
V 53050 42300 50 6 10 2 0 -1 -1 0 -1 -1 -1 -1 -1
B 52750 42100 500 800 3 10 2 0 -1 -1 0 -1 -1 -1 -1 -1
L 52800 42600 52850 42600 3 10 2 0 -1 -1
L 52800 42600 52800 42400 3 10 2 0 -1 -1
L 52850 42400 52800 42400 3 10 2 0 -1 -1
T 53200 45100 5 8 0 0 0 6 1
documentation=http://jae-connector.com/en/general_en.cfm?series_code=IL%2DG
T 53200 44100 5 8 0 0 0 6 1
dist-license=GPL 3, see http://www.gnu.org/licenses/gpl.txt
T 53200 43900 5 8 0 0 0 6 1
use-license=free, no restrictions
T 53200 45300 5 8 0 0 0 6 1
description=connector by JAE, IL-G series, 2 pins, model IL-G-2S-S3C2-SA
L 52850 42400 52850 42100 3 10 2 0 -1 -1
L 52850 42600 52850 42900 3 10 2 0 -1 -1
T 53200 44700 5 8 0 0 0 6 1
values=JAE IL-G-2S, PSK 2Pin
T 53200 44500 5 8 0 0 0 6 1
symversion=1.0
T 53200 44900 5 8 0 0 0 6 1
comment=also good for PSK connectors with same footprint
]
{
T 52700 42600 5 10 1 1 0 6 1
refdes=CONN2
T 52700 42400 5 10 1 1 0 6 1
value=XXX
T 52700 42200 5 8 1 1 0 6 1
footprint=PS_1x2PIN
T 53200 44500 5 8 0 0 0 6 1
symversion=1.0
}
C 53400 42800 1 0 0 EMBEDDEDUb+.sym
[
V 53600 42950 50 3 10 0 0 -1 -1 0 -1 -1 -1 -1 -1
P 53600 42900 53600 42800 1 0 1
{
T 53500 42900 5 8 0 1 0 6 1
pinnumber=1
T 53600 43050 5 10 1 1 0 3 1
pinlabel=+Ub
T 53700 42900 5 8 0 1 0 0 1
pintype=pwr
}
T 53500 44900 5 8 0 0 0 0 1
description=positive supply voltage
T 53500 43700 5 8 0 0 0 0 1
net=+Ub:1
T 53500 44300 5 8 0 0 0 0 1
author= Kai-Martin Knaak, kmk@lilalaser.de
T 53500 44700 5 8 0 0 0 0 1
footprint=none
T 53500 44500 5 8 0 0 0 0 1
symversion=1.0
T 53500 43900 5 8 0 0 0 0 1
use-license=free, no restrictions
T 53500 44100 5 8 0 0 0 0 1
dist-license=GPL 3, see http://www.gnu.org/licenses/gpl-3.0.txt
]
{
T 53500 44700 5 8 0 0 0 0 1
footprint=none
T 53500 44500 5 8 0 0 0 0 1
symversion=1.0
}
N 53600 42800 53600 42700 4
N 53600 42700 53300 42700 4
C 53500 41800 1 0 0 EMBEDDEDgnd.sym
[
P 53600 42000 53600 42100 1 0 1
{
T 53700 41900 5 8 0 1 0 0 1
pinnumber=1
T 53700 41900 5 8 0 1 0 0 1
pinlabel=1
T 53658 42061 5 8 0 1 0 0 1
pintype=pwr
}
L 53500 42000 53700 42000 3 10 0 0 -1 -1
L 53555 41950 53645 41950 3 10 0 0 -1 -1
L 53580 41910 53620 41910 3 10 0 0 -1 -1
T 53600 42400 5 8 0 0 0 0 1
net=GND:1
T 53600 43000 5 8 0 0 0 0 1
author=Kai-Martin Knaak, kmk@lilalaser.de
T 53600 43600 5 8 0 0 0 0 1
description=ground symbol
T 53600 42800 5 8 0 0 0 0 1
dist-license=GPL 3, see http://www.gnu.org/licenses/gpl.txt
T 53600 42600 5 8 0 0 0 0 1
use-license=free, no restrictions
T 53600 43200 5 8 0 0 0 0 1
symversion=1.0
T 53600 43400 5 8 0 0 0 0 1
footprint=none
]
{
T 53600 43200 5 8 0 0 0 0 1
symversion=1.0
T 53600 43400 5 8 0 0 0 0 1
footprint=none
}
N 53600 42100 53600 42300 4
N 53600 42300 53300 42300 4
B 49000 40000 7500 9400 3 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
