v 20140308 2
C 6700 2000 1 0 0 EMBEDDEDquad_analog_switch_pwr.sym
[
P 6900 3100 6900 3000 1 0 0
{
T 6800 3100 5 8 0 1 0 7 1
pinseq=13
T 6800 3100 5 8 1 1 0 7 1
pinnumber=13
T 6800 3300 5 8 0 1 0 7 1
pintype=pwr
T 6850 2900 5 8 1 1 0 4 1
pinlabel=+Ub
}
P 6900 2200 6900 2300 1 0 0
{
T 6800 2200 5 8 0 1 0 7 1
pinseq=5
T 6800 2200 5 8 1 1 0 7 1
pinnumber=5
T 6900 2000 5 8 0 1 0 6 1
pintype=pwr
T 6925 2400 5 8 1 1 0 4 1
pinlabel=GND
}
B 6700 2300 800 700 3 10 0 0 -1 -1 0 -1 -1 -1 -1 -1
P 7300 2200 7300 2300 1 0 0
{
T 7200 2200 5 8 1 1 0 7 1
pinseq=4
T 7200 2200 5 8 1 1 0 7 1
pinnumber=4
T 7600 2200 5 8 0 1 0 6 1
pintype=pwr
T 7325 2400 5 8 1 1 0 4 1
pinlabel=-Ub
}
P 7300 3100 7300 3000 1 0 0
{
T 7250 3100 5 8 0 1 0 7 1
pinseq=12
T 7250 3100 5 8 1 1 0 7 1
pinnumber=12
T 7200 3300 5 8 0 1 0 7 1
pintype=pwr
T 7300 2900 5 8 1 1 0 4 1
pinlabel=VL
}
T 6890 4400 5 8 0 0 0 0 1
device=quad_analog_switch_pwr
T 6890 4200 5 8 0 0 0 0 1
description=power pins for quad analog switch, models DG201, DG211, DG212, ADG1312
T 6890 4000 5 8 0 0 0 0 1
author=Kai-Martin Knaak kmk@lilalaser.de
T 6890 3800 5 8 0 0 0 0 1
dist-license=GPL 3, see http://www.gnu.org/licenses/gpl-3.0.txt
T 6890 3600 5 8 0 0 0 0 1
use-license=free, no restrictions
T 7600 2800 8 10 0 1 0 0 1
refdes=U?
T 7100 2550 9 8 1 0 0 4 1
switch
T 7100 2650 9 8 1 0 0 3 1
4x analog
T 7600 2600 8 10 0 1 0 0 1
value=DG201
T 7600 2400 8 8 0 1 0 0 1
footprint=SO16
]
{
T 6890 4400 5 8 0 0 0 0 1
device=quad_analog_switch_pwr
T 7600 2800 5 10 1 1 0 0 1
refdes=U?
T 7600 2600 5 10 1 1 0 0 1
value=DG201
T 7600 2400 5 8 1 1 0 0 1
footprint=SO16
}
C 900 3800 1 0 0 EMBEDDEDquad_analog_switch.sym
[
L 1280 4100 1100 4000 3 0 0 0 -1 -1
P 1300 4000 1400 4000 1 0 1
{
T 1350 4050 5 8 1 1 0 0 1
pinnumber=14
T 1350 4050 5 8 0 1 0 0 1
pinseq=3
T 1350 3850 5 8 0 1 0 0 1
pintype=pas
}
P 1100 4000 1000 4000 1 0 1
{
T 1000 4050 5 8 1 1 0 0 1
pinnumber=15
T 1000 4050 5 8 0 1 0 0 1
pinseq=2
T 1000 3850 5 8 0 1 0 0 1
pintype=pas
}
V 1100 4000 20 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
V 1300 4000 20 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
P 1200 4050 1200 4200 1 0 1
{
T 1250 4200 5 8 1 1 0 0 1
pinnumber=16
T 1200 4250 5 8 0 1 0 0 1
pinseq=1
T 1250 4150 5 8 0 1 0 0 1
pintype=pas
}
T 1400 4500 8 10 0 1 0 0 1
refdes=U?
T 1200 8100 5 8 0 0 0 0 1
description=quad analog switch, 16 pin
T 1200 7100 5 8 0 0 0 0 1
author=K-M. Knaak, kmk@lilalaser.de
T 1200 6900 5 8 0 0 0 0 1
dist-license=GPL3, see http://www.gnu.org/licenses/gpl-3.0.txt
T 1200 6700 5 8 0 0 0 0 1
use-license=free, no restrictions
T 1200 6500 5 8 0 0 0 0 1
numslots=4
T 1200 7700 5 8 0 0 0 0 1
comment=Use quad_analog_switch_pwr.sym for power pins
T 1200 7500 5 8 0 0 0 0 1
footprints=ADG1312, DG201 and DG211
T 1200 6300 5 8 0 0 0 0 1
slotdef=1:1,2,3
T 1200 6100 5 8 0 0 0 0 1
slotdef=2:8,7,6
T 1200 5900 5 8 0 0 0 0 1
slotdef=3:9,10,11
T 1200 5700 5 8 0 0 0 0 1
slotdef=4:16,15,14
T 1400 4300 8 10 0 0 0 0 1
slot=1
T 1200 7900 5 8 0 0 0 0 1
documentation=http://www.vishay.com/doc?70102
T 1200 7300 5 8 0 0 0 0 1
values=ADG1312, DG201 and DG211
]
{
T 1400 4500 5 10 1 1 0 0 1
refdes=U?
T 1400 4300 5 10 1 0 0 0 1
slot=4
}
N 7300 1800 7300 2200 4
N 6900 3400 6900 3100 4
C 7100 3400 1 0 1 EMBEDDEDUb+.sym
[
V 6900 3550 50 3 10 0 0 -1 -1 0 -1 -1 -1 -1 -1
P 6900 3500 6900 3400 1 0 1
{
T 7000 3500 5 8 0 1 0 0 1
pinnumber=1
T 6900 3650 5 10 1 1 0 3 1
pinlabel=+Ub
T 6800 3500 5 8 0 1 0 6 1
pintype=pwr
}
T 7000 5500 5 8 0 0 0 6 1
description=positive supply voltage
T 7000 4300 5 8 0 0 0 6 1
net=+Ub:1
T 7000 4900 5 8 0 0 0 6 1
author= Kai-Martin Knaak, kmk@lilalaser.de
T 7000 5300 5 8 0 0 0 6 1
footprint=none
T 7000 5100 5 8 0 0 0 6 1
symversion=1.0
T 7000 4500 5 8 0 0 0 6 1
use-license=free, no restrictions
T 7000 4700 5 8 0 0 0 6 1
dist-license=GPL 3, see http://www.gnu.org/licenses/gpl-3.0.txt
]
{
T 7000 5300 5 8 0 0 0 6 1
footprint=none
T 7000 5100 5 8 0 0 0 6 1
symversion=1.0
}
C 7000 1400 1 0 0 EMBEDDEDUb-.sym
[
V 7300 1650 50 3 10 0 0 -1 -1 0 -1 -1 -1 -1 -1
P 7300 1700 7300 1800 1 0 1
{
T 7100 1600 5 8 0 1 0 0 1
pinnumber=1
T 7300 1400 5 10 1 1 0 3 1
pinlabel=-Ub
T 7400 1600 5 8 0 1 0 0 1
pintype=pwr
}
T 7200 3300 5 8 0 0 0 0 1
description=negative supply voltage
T 7200 2700 5 8 0 0 0 0 1
author= Kai-Martin Knaak, kmk@lilalaser.de
T 7200 3100 5 8 0 0 0 0 1
footprint=none
T 7200 2100 5 8 0 0 0 0 1
net=-Ub:1
T 7200 2900 5 8 0 0 0 0 1
symversion=1.0
T 7200 2300 5 8 0 0 0 0 1
use-license=free, no restrictions
T 7200 2500 5 8 0 0 0 0 1
dist-license=GPL 3, see http://www.gnu.org/licenses/gpl-3.0.txt
]
{
T 7200 3100 5 8 0 0 0 0 1
footprint=none
T 7200 2900 5 8 0 0 0 0 1
symversion=1.0
}
C 6000 2900 1 0 1 EMBEDDEDgnd.sym
[
P 5900 3100 5900 3200 1 0 1
{
T 5800 3000 5 8 0 1 0 6 1
pinnumber=1
T 5800 3000 5 8 0 1 0 6 1
pinlabel=1
T 5842 3161 5 8 0 1 0 6 1
pintype=pwr
}
L 6000 3100 5800 3100 3 10 0 0 -1 -1
L 5965 3055 5835 3055 3 10 0 0 -1 -1
L 5935 3010 5865 3010 3 10 0 0 -1 -1
T 5900 3500 5 8 0 0 0 6 1
net=GND:1
T 5900 4100 5 8 0 0 0 6 1
author=Kai-Martin Knaak, kmk@lilalaser.de
T 5900 4700 5 8 0 0 0 6 1
description=ground symbol
T 5900 3900 5 8 0 0 0 6 1
dist-license=GPL 3, see http://www.gnu.org/licenses/gpl.txt
T 5900 3700 5 8 0 0 0 6 1
use-license=free, no restrictions
T 5900 4300 5 8 0 0 0 6 1
symversion=1.0
T 5900 4500 5 8 0 0 0 6 1
footprint=none
]
{
T 5900 4300 5 8 0 0 0 6 1
symversion=1.0
T 5900 4500 5 8 0 0 0 6 1
footprint=none
}
C 8200 1600 1 0 0 EMBEDDEDgnd.sym
[
P 8300 1800 8300 1900 1 0 1
{
T 8400 1700 5 8 0 1 0 0 1
pinnumber=1
T 8400 1700 5 8 0 1 0 0 1
pinlabel=1
T 8358 1861 5 8 0 1 0 0 1
pintype=pwr
}
L 8200 1800 8400 1800 3 10 0 0 -1 -1
L 8235 1755 8365 1755 3 10 0 0 -1 -1
L 8265 1710 8335 1710 3 10 0 0 -1 -1
T 8300 2200 5 8 0 0 0 0 1
net=GND:1
T 8300 2800 5 8 0 0 0 0 1
author=Kai-Martin Knaak, kmk@lilalaser.de
T 8300 3400 5 8 0 0 0 0 1
description=ground symbol
T 8300 2600 5 8 0 0 0 0 1
dist-license=GPL 3, see http://www.gnu.org/licenses/gpl.txt
T 8300 2400 5 8 0 0 0 0 1
use-license=free, no restrictions
T 8300 3000 5 8 0 0 0 0 1
symversion=1.0
T 8300 3200 5 8 0 0 0 0 1
footprint=none
]
{
T 8300 3000 5 8 0 0 0 0 1
symversion=1.0
T 8300 3200 5 8 0 0 0 0 1
footprint=none
}
N 8300 1900 8300 2000 4
N 5900 3200 5900 3300 4
C 6700 2700 1 0 1 EMBEDDEDcap_horiz.sym
[
P 6100 3300 6300 3300 1 0 0
{
T 6305 3345 5 8 0 1 0 6 1
pinnumber=1
T 6200 3450 5 8 0 1 0 8 1
pintype=pas
}
P 6700 3300 6500 3300 1 0 0
{
T 6545 3345 5 8 0 1 0 0 1
pinnumber=2
T 6500 3250 5 8 0 1 0 2 1
pintype=pas
}
L 6350 3100 6350 3500 3 10 0 0 -1 -1
L 6450 3100 6450 3500 3 10 0 0 -1 -1
L 6450 3300 6500 3300 3 10 0 0 -1 -1
L 6350 3300 6300 3300 3 10 0 0 -1 -1
L 6300 3300 6350 3350 3 10 0 0 -1 -1
T 6300 2900 8 10 0 1 0 6 1
value=XXX
T 6400 4750 5 8 0 0 0 6 1
description=bipolar capacitor
T 6300 2700 8 8 0 1 0 6 1
footprint=0805
T 6400 4150 5 8 0 0 0 6 1
author=Kai-Martin Knaak kmk@familieknaak.de
T 6400 3750 5 8 0 0 0 6 1
dist-license=GPL , see http://www.gnu.org/licenses/gpl.txt
T 6400 3950 5 8 0 0 0 6 1
use-license=free, no restrictions
T 6400 4350 5 8 0 0 0 6 1
symversion=1.0
T 6300 3100 8 10 0 1 0 6 1
refdes=C?
T 6400 4550 5 8 0 0 0 6 1
footprints=0805, 0603, 0402, cap_100mil, cap_200mil, cap_200mil_a, cap_200mil_b, cap_200mil_c, cap_1100mil
]
{
T 6400 4350 5 8 0 0 0 6 1
symversion=1.0
T 6500 2700 5 10 1 1 0 6 1
value=100n
T 6500 2500 5 8 1 1 0 6 1
footprint=0805
T 6500 2900 5 10 1 1 0 6 1
refdes=C?
}
N 6100 3300 5900 3300 4
N 6700 3300 6900 3300 4
C 7500 1400 1 0 0 EMBEDDEDcap_horiz.sym
[
P 8100 2000 7900 2000 1 0 0
{
T 7895 2045 5 8 0 1 0 0 1
pinnumber=1
T 8000 2150 5 8 0 1 0 2 1
pintype=pas
}
P 7500 2000 7700 2000 1 0 0
{
T 7655 2045 5 8 0 1 0 6 1
pinnumber=2
T 7700 1950 5 8 0 1 0 8 1
pintype=pas
}
L 7850 1800 7850 2200 3 10 0 0 -1 -1
L 7750 1800 7750 2200 3 10 0 0 -1 -1
L 7750 2000 7700 2000 3 10 0 0 -1 -1
L 7850 2000 7900 2000 3 10 0 0 -1 -1
L 7900 2000 7850 2050 3 10 0 0 -1 -1
T 7900 1600 8 10 0 1 0 0 1
value=XXX
T 7800 3450 5 8 0 0 0 0 1
description=bipolar capacitor
T 7900 1400 8 8 0 1 0 0 1
footprint=0805
T 7800 2850 5 8 0 0 0 0 1
author=Kai-Martin Knaak kmk@familieknaak.de
T 7800 2450 5 8 0 0 0 0 1
dist-license=GPL , see http://www.gnu.org/licenses/gpl.txt
T 7800 2650 5 8 0 0 0 0 1
use-license=free, no restrictions
T 7800 3050 5 8 0 0 0 0 1
symversion=1.0
T 7900 1800 8 10 0 1 0 0 1
refdes=C?
T 7800 3250 5 8 0 0 0 0 1
footprints=0805, 0603, 0402, cap_100mil, cap_200mil, cap_200mil_a, cap_200mil_b, cap_200mil_c, cap_1100mil
]
{
T 7800 3050 5 8 0 0 0 0 1
symversion=1.0
T 7700 1400 5 10 1 1 0 0 1
value=100n
T 7700 1200 5 8 1 1 0 0 1
footprint=0805
T 7700 1600 5 10 1 1 0 0 1
refdes=C?
}
N 8100 2000 8300 2000 4
N 7500 2000 7300 2000 4
C 7100 3400 1 0 0 EMBEDDED5V+.sym
[
V 7300 3550 50 3 10 0 0 -1 -1 0 -1 -1 -1 -1 -1
P 7300 3500 7300 3400 1 0 1
{
T 7200 3450 5 8 0 1 0 6 1
pinnumber=1
T 7300 3650 5 10 1 1 0 3 1
pinlabel=+5V
T 7400 3500 5 8 0 1 0 0 1
pintype=pwr
}
T 7200 5400 5 8 0 0 0 0 1
description=5V positive supply voltage
T 7200 4800 5 8 0 0 0 0 1
author= Kai-Martin Knaak, kmk@lilalaser.de
T 7200 4200 5 8 0 0 0 0 1
net=+5V:1
T 7200 4400 5 8 0 0 0 0 1
use-license=free, no restrictions
T 7200 4600 5 8 0 0 0 0 1
license=GPL3, for details see http://gnu.org
T 7200 5000 5 8 0 0 0 0 1
symversion=1.0
T 7200 5200 5 8 0 0 0 0 1
footprint=none
]
{
T 7200 5000 5 8 0 0 0 0 1
symversion=1.0
T 7200 5200 5 8 0 0 0 0 1
footprint=none
}
N 7300 3400 7300 3100 4
C 7000 1500 1 0 1 EMBEDDEDgnd.sym
[
P 6900 1700 6900 1800 1 0 1
{
T 6800 1600 5 8 0 1 0 6 1
pinnumber=1
T 6800 1600 5 8 0 1 0 6 1
pinlabel=1
T 6842 1761 5 8 0 1 0 6 1
pintype=pwr
}
L 7000 1700 6800 1700 3 10 0 0 -1 -1
L 6965 1655 6835 1655 3 10 0 0 -1 -1
L 6935 1610 6865 1610 3 10 0 0 -1 -1
T 6900 2100 5 8 0 0 0 6 1
net=GND:1
T 6900 2700 5 8 0 0 0 6 1
author=Kai-Martin Knaak, kmk@lilalaser.de
T 6900 3300 5 8 0 0 0 6 1
description=ground symbol
T 6900 2500 5 8 0 0 0 6 1
dist-license=GPL 3, see http://www.gnu.org/licenses/gpl.txt
T 6900 2300 5 8 0 0 0 6 1
use-license=free, no restrictions
T 6900 2900 5 8 0 0 0 6 1
symversion=1.0
T 6900 3100 5 8 0 0 0 6 1
footprint=none
]
{
T 6900 2900 5 8 0 0 0 6 1
symversion=1.0
T 6900 3100 5 8 0 0 0 6 1
footprint=none
}
N 6900 1800 6900 2200 4
C 4600 3300 1 90 0 EMBEDDEDquad_analog_switch.sym
[
L 4300 3680 4400 3500 3 0 0 0 -1 -1
P 4400 3700 4400 3800 1 0 1
{
T 4350 3750 5 8 1 1 90 0 1
pinnumber=3
T 4350 3750 5 8 0 1 90 0 1
pinseq=3
T 4550 3750 5 8 0 1 90 0 1
pintype=pas
}
P 4400 3500 4400 3400 1 0 1
{
T 4350 3400 5 8 1 1 90 0 1
pinnumber=2
T 4350 3400 5 8 0 1 90 0 1
pinseq=2
T 4550 3400 5 8 0 1 90 0 1
pintype=pas
}
V 4400 3500 20 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
V 4400 3700 20 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
P 4350 3600 4200 3600 1 0 1
{
T 4200 3650 5 8 1 1 90 0 1
pinnumber=1
T 4150 3600 5 8 0 1 90 0 1
pinseq=1
T 4250 3650 5 8 0 1 90 0 1
pintype=pas
}
T 3900 3800 8 10 0 1 90 0 1
refdes=U?
T 300 3600 5 8 0 0 90 0 1
description=quad analog switch, 16 pin
T 1300 3600 5 8 0 0 90 0 1
author=K-M. Knaak, kmk@lilalaser.de
T 1500 3600 5 8 0 0 90 0 1
dist-license=GPL3, see http://www.gnu.org/licenses/gpl-3.0.txt
T 1700 3600 5 8 0 0 90 0 1
use-license=free, no restrictions
T 1900 3600 5 8 0 0 90 0 1
numslots=4
T 700 3600 5 8 0 0 90 0 1
comment=Use quad_analog_switch_pwr.sym for power pins
T 900 3600 5 8 0 0 90 0 1
footprints=ADG1312, DG201 and DG211
T 2100 3600 5 8 0 0 90 0 1
slotdef=1:1,2,3
T 2300 3600 5 8 0 0 90 0 1
slotdef=2:8,7,6
T 2500 3600 5 8 0 0 90 0 1
slotdef=3:9,10,11
T 2700 3600 5 8 0 0 90 0 1
slotdef=4:16,15,14
T 4100 3800 8 10 0 0 90 0 1
slot=1
T 500 3600 5 8 0 0 90 0 1
documentation=http://www.vishay.com/doc?70102
T 1100 3600 5 8 0 0 90 0 1
values=ADG1312, DG201 and DG211
]
{
T 4500 3700 5 10 1 1 0 0 1
refdes=U?
T 4500 3500 5 10 1 0 0 0 1
slot=1
}
C 3500 1700 1 90 0 EMBEDDEDquad_analog_switch.sym
[
L 3200 2080 3300 1900 3 0 0 0 -1 -1
P 3300 2100 3300 2200 1 0 1
{
T 3250 2150 5 8 1 1 90 0 1
pinnumber=11
T 3250 2150 5 8 0 1 90 0 1
pinseq=3
T 3450 2150 5 8 0 1 90 0 1
pintype=pas
}
P 3300 1900 3300 1800 1 0 1
{
T 3250 1800 5 8 1 1 90 0 1
pinnumber=10
T 3250 1800 5 8 0 1 90 0 1
pinseq=2
T 3450 1800 5 8 0 1 90 0 1
pintype=pas
}
V 3300 1900 20 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
V 3300 2100 20 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
P 3250 2000 3100 2000 1 0 1
{
T 3100 2050 5 8 1 1 90 0 1
pinnumber=9
T 3050 2000 5 8 0 1 90 0 1
pinseq=1
T 3150 2050 5 8 0 1 90 0 1
pintype=pas
}
T 2800 2200 8 10 0 1 90 0 1
refdes=U?
T -800 2000 5 8 0 0 90 0 1
description=quad analog switch, 16 pin
T 200 2000 5 8 0 0 90 0 1
author=K-M. Knaak, kmk@lilalaser.de
T 400 2000 5 8 0 0 90 0 1
dist-license=GPL3, see http://www.gnu.org/licenses/gpl-3.0.txt
T 600 2000 5 8 0 0 90 0 1
use-license=free, no restrictions
T 800 2000 5 8 0 0 90 0 1
numslots=4
T -400 2000 5 8 0 0 90 0 1
comment=Use quad_analog_switch_pwr.sym for power pins
T -200 2000 5 8 0 0 90 0 1
footprints=ADG1312, DG201 and DG211
T 1000 2000 5 8 0 0 90 0 1
slotdef=1:1,2,3
T 1200 2000 5 8 0 0 90 0 1
slotdef=2:8,7,6
T 1400 2000 5 8 0 0 90 0 1
slotdef=3:9,10,11
T 1600 2000 5 8 0 0 90 0 1
slotdef=4:16,15,14
T 3000 2200 8 10 0 0 90 0 1
slot=1
T -600 2000 5 8 0 0 90 0 1
documentation=http://www.vishay.com/doc?70102
T 0 2000 5 8 0 0 90 0 1
values=ADG1312, DG201 and DG211
]
{
T 3400 2100 5 10 1 1 0 0 1
refdes=U?
T 3400 1900 5 10 1 0 0 0 1
slot=3
}
C 4600 1300 1 90 0 EMBEDDEDquad_analog_switch.sym
[
L 4300 1680 4400 1500 3 0 0 0 -1 -1
P 4400 1700 4400 1800 1 0 1
{
T 4350 1750 5 8 1 1 90 0 1
pinnumber=6
T 4350 1750 5 8 0 1 90 0 1
pinseq=3
T 4550 1750 5 8 0 1 90 0 1
pintype=pas
}
P 4400 1500 4400 1400 1 0 1
{
T 4350 1400 5 8 1 1 90 0 1
pinnumber=7
T 4350 1400 5 8 0 1 90 0 1
pinseq=2
T 4550 1400 5 8 0 1 90 0 1
pintype=pas
}
V 4400 1500 20 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
V 4400 1700 20 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1
P 4350 1600 4200 1600 1 0 1
{
T 4200 1650 5 8 1 1 90 0 1
pinnumber=8
T 4150 1600 5 8 0 1 90 0 1
pinseq=1
T 4250 1650 5 8 0 1 90 0 1
pintype=pas
}
T 3900 1800 8 10 0 1 90 0 1
refdes=U?
T 300 1600 5 8 0 0 90 0 1
description=quad analog switch, 16 pin
T 1300 1600 5 8 0 0 90 0 1
author=K-M. Knaak, kmk@lilalaser.de
T 1500 1600 5 8 0 0 90 0 1
dist-license=GPL3, see http://www.gnu.org/licenses/gpl-3.0.txt
T 1700 1600 5 8 0 0 90 0 1
use-license=free, no restrictions
T 1900 1600 5 8 0 0 90 0 1
numslots=4
T 700 1600 5 8 0 0 90 0 1
comment=Use quad_analog_switch_pwr.sym for power pins
T 900 1600 5 8 0 0 90 0 1
footprints=ADG1312, DG201 and DG211
T 2100 1600 5 8 0 0 90 0 1
slotdef=1:1,2,3
T 2300 1600 5 8 0 0 90 0 1
slotdef=2:8,7,6
T 2500 1600 5 8 0 0 90 0 1
slotdef=3:9,10,11
T 2700 1600 5 8 0 0 90 0 1
slotdef=4:16,15,14
T 4100 1800 8 10 0 0 90 0 1
slot=1
T 500 1600 5 8 0 0 90 0 1
documentation=http://www.vishay.com/doc?70102
T 1100 1600 5 8 0 0 90 0 1
values=ADG1312, DG201 and DG211
]
{
T 4500 1700 5 10 1 1 0 0 1
refdes=U?
T 4500 1500 5 10 1 0 0 0 1
slot=2
}
N 4400 3400 4400 1800 4
C 3400 600 1 0 1 EMBEDDEDres_vert.sym
[
P 3300 1400 3300 1300 1 0 0
{
T 3250 1550 5 8 0 1 0 6 1
pinnumber=2
T 3250 1550 5 8 0 1 0 6 1
pinseq=2
T 3250 1400 5 8 0 1 0 6 1
pintype=pas
}
P 3300 800 3300 900 1 0 0
{
T 3275 650 5 8 0 1 0 6 1
pinnumber=1
T 3275 650 5 8 0 1 0 6 1
pinseq=1
T 3175 700 5 8 0 1 0 6 1
pintype=pas
}
B 3200 900 200 400 3 10 0 0 -1 -1 0 -1 -1 -1 -1 -1
L 3250 900 3200 950 3 10 0 0 -1 -1
T 3300 3400 5 8 0 0 0 6 1
device=resistor
T 3300 3200 5 8 0 0 0 6 1
description=resistor
T 3100 800 8 8 0 1 0 6 1
footprint=0805
T 3300 2800 5 8 0 0 0 6 1
documentation=none
T 3300 2400 5 8 0 0 0 6 1
author=Kai-Martin Knaak kmk@lilalaser.de
T 3300 2200 5 8 0 0 0 6 1
dist-license=GPL 3, see http://www.gnu.org/licenses/gpl-3.0.txt
T 3300 2000 5 8 0 0 0 6 1
use-license=free, no restrictions
T 3100 1200 8 10 0 1 0 6 1
refdes=R?
T 3100 1000 8 10 0 1 0 6 1
value=XXX
T 3300 2600 5 8 0 0 0 6 1
symversion=1.0
T 3300 3000 5 8 0 0 0 6 1
footprints=0805, 0603, res_300mil, res_400mil, res_600mil, res_800mil, res_vert.fp, res_socket.fp
]
{
T 3300 3400 5 8 0 0 0 6 1
device=resistor
T 3300 2600 5 8 0 0 0 6 1
symversion=1.0
T 3100 700 5 8 1 1 0 6 1
footprint=0805
T 3100 1100 5 10 1 1 0 6 1
refdes=R?
T 3100 900 5 10 1 1 0 6 1
value=1M
}
N 3300 1800 3300 1400 4
N 4200 1600 3300 1600 4
N 3100 2000 2600 2000 4
C 3200 400 1 0 0 EMBEDDEDgnd.sym
[
P 3300 600 3300 700 1 0 1
{
T 3400 500 5 8 0 1 0 0 1
pinnumber=1
T 3400 500 5 8 0 1 0 0 1
pinlabel=1
T 3358 661 5 8 0 1 0 0 1
pintype=pwr
}
L 3200 600 3400 600 3 10 0 0 -1 -1
L 3235 555 3365 555 3 10 0 0 -1 -1
L 3265 510 3335 510 3 10 0 0 -1 -1
T 3300 1000 5 8 0 0 0 0 1
net=GND:1
T 3300 1600 5 8 0 0 0 0 1
author=Kai-Martin Knaak, kmk@lilalaser.de
T 3300 2200 5 8 0 0 0 0 1
description=ground symbol
T 3300 1400 5 8 0 0 0 0 1
dist-license=GPL 3, see http://www.gnu.org/licenses/gpl.txt
T 3300 1200 5 8 0 0 0 0 1
use-license=free, no restrictions
T 3300 1800 5 8 0 0 0 0 1
symversion=1.0
T 3300 2000 5 8 0 0 0 0 1
footprint=none
]
{
T 3300 1800 5 8 0 0 0 0 1
symversion=1.0
T 3300 2000 5 8 0 0 0 0 1
footprint=none
}
N 3300 700 3300 800 4
C 3100 2400 1 0 0 EMBEDDED5V+.sym
[
V 3300 2550 50 3 10 0 0 -1 -1 0 -1 -1 -1 -1 -1
P 3300 2500 3300 2400 1 0 1
{
T 3200 2450 5 8 0 1 0 6 1
pinnumber=1
T 3300 2650 5 10 1 1 0 3 1
pinlabel=+5V
T 3400 2500 5 8 0 1 0 0 1
pintype=pwr
}
T 3200 4400 5 8 0 0 0 0 1
description=5V positive supply voltage
T 3200 3800 5 8 0 0 0 0 1
author= Kai-Martin Knaak, kmk@lilalaser.de
T 3200 3200 5 8 0 0 0 0 1
net=+5V:1
T 3200 3400 5 8 0 0 0 0 1
use-license=free, no restrictions
T 3200 3600 5 8 0 0 0 0 1
license=GPL3, for details see http://gnu.org
T 3200 4000 5 8 0 0 0 0 1
symversion=1.0
T 3200 4200 5 8 0 0 0 0 1
footprint=none
]
{
T 3200 4000 5 8 0 0 0 0 1
symversion=1.0
T 3200 4200 5 8 0 0 0 0 1
footprint=none
}
N 3300 2400 3300 2200 4
N 500 3600 4200 3600 4
N 2600 3600 2600 2000 4
N 4400 2600 5200 2600 4
N 4400 3800 4400 4300 4
N 4400 1400 4400 1000 4
