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
Title=Sub-b
T 51400 40300 5 16 1 1 0 4 1
filename=sub-b.sch
T 55850 41500 5 16 1 1 0 4 1
revision=revision
T 56050 40100 5 16 1 1 0 6 1
page=3
T 56200 40100 5 16 1 1 0 0 1
number_of_pages=3
T 55850 40850 5 12 1 1 0 4 1
date=04.08.12
T 54350 40450 5 16 1 1 0 4 1
author=-<)kmk(>-
}
C 50700 42700 1 0 0 EMBEDDEDopamp_pwr.sym
[
B 50700 42800 600 700 3 10 0 0 -1 -1 0 -1 -1 -1 -1 -1
T 51000 43150 9 8 1 0 0 4 1
opamp
P 51000 43600 51000 43500 1 0 0
{
T 50950 43550 5 8 1 1 0 6 1
pinseq=7
T 50950 43550 5 8 0 1 0 6 1
pinnumber=7
T 51000 43750 5 8 0 1 0 7 1
pintype=pwr
T 51000 43450 5 8 1 1 0 5 1
pinlabel=+Ub
}
P 51000 42700 51000 42800 1 0 0
{
T 50950 42750 5 8 0 1 0 8 1
pinseq=4
T 50950 42750 5 8 1 1 0 8 1
pinnumber=4
T 51050 42750 5 8 0 1 0 2 1
pintype=pwr
T 51000 42850 5 8 1 1 0 3 1
pinlabel=-Ub
}
T 51350 43200 8 10 0 1 0 0 1
refdes=U?
T 50800 45200 5 8 0 0 0 0 1
description=Power pins for generic, single opamp
T 50800 44600 5 8 0 0 0 0 1
use-license=free, no restrictions
T 50800 45000 5 8 0 0 0 0 1
author=Kai-Martin Knaak kmk@lilalaser.de
T 50800 44800 5 8 0 0 0 0 1
dist-license=GPL 3 (see http://www.gnu.org/licenses/licenses.html for the details)
T 50800 44400 5 8 0 0 0 0 1
symversion=1.0
]
{
T 51350 43200 5 10 1 1 0 0 1
refdes=U1
T 50800 44400 5 8 0 0 0 0 1
symversion=1.0
}
C 50900 42400 1 0 0 EMBEDDEDgnd.sym
[
P 51000 42600 51000 42700 1 0 1
{
T 51100 42500 5 8 0 1 0 0 1
pinnumber=1
T 51100 42500 5 8 0 1 0 0 1
pinlabel=1
T 51058 42661 5 8 0 1 0 0 1
pintype=pwr
}
L 50900 42600 51100 42600 3 10 0 0 -1 -1
L 50955 42550 51045 42550 3 10 0 0 -1 -1
L 50980 42510 51020 42510 3 10 0 0 -1 -1
T 51000 43000 5 8 0 0 0 0 1
net=GND:1
T 51000 43600 5 8 0 0 0 0 1
author=Kai-Martin Knaak, kmk@lilalaser.de
T 51000 44200 5 8 0 0 0 0 1
description=ground symbol
T 51000 43400 5 8 0 0 0 0 1
dist-license=GPL 3, see http://www.gnu.org/licenses/gpl.txt
T 51000 43200 5 8 0 0 0 0 1
use-license=free, no restrictions
T 51000 43800 5 8 0 0 0 0 1
symversion=1.0
T 51000 44000 5 8 0 0 0 0 1
footprint=none
]
{
T 51000 43800 5 8 0 0 0 0 1
symversion=1.0
T 51000 44000 5 8 0 0 0 0 1
footprint=none
}
C 50800 43600 1 0 0 EMBEDDEDUb+.sym
[
V 51000 43750 50 3 10 0 0 -1 -1 0 -1 -1 -1 -1 -1
P 51000 43700 51000 43600 1 0 1
{
T 50900 43700 5 8 0 1 0 6 1
pinnumber=1
T 51000 43850 5 10 1 1 0 3 1
pinlabel=+Ub
T 51100 43700 5 8 0 1 0 0 1
pintype=pwr
}
T 50900 45700 5 8 0 0 0 0 1
description=positive supply voltage
T 50900 44500 5 8 0 0 0 0 1
net=+Ub:1
T 50900 45100 5 8 0 0 0 0 1
author= Kai-Martin Knaak, kmk@lilalaser.de
T 50900 45500 5 8 0 0 0 0 1
footprint=none
T 50900 45300 5 8 0 0 0 0 1
symversion=1.0
T 50900 44700 5 8 0 0 0 0 1
use-license=free, no restrictions
T 50900 44900 5 8 0 0 0 0 1
dist-license=GPL 3, see http://www.gnu.org/licenses/gpl-3.0.txt
]
{
T 50900 45500 5 8 0 0 0 0 1
footprint=none
T 50900 45300 5 8 0 0 0 0 1
symversion=1.0
}
B 49000 40000 7500 4700 3 0 1 0 -1 -1 0 -1 -1 -1 -1 -1
