# author: Stefan Salewski
# email: mail@ssalewski.de
# dist-license: GPL
# use-license: unlimited

# Pcb element (footprint/land pattern) for trimmer with 3 pins, 7.5mm diameter
# S. Salewski, 09-NOV-2007
# Distance pin1 to pin2 is 200mil, distance pin1 to pin 3 is sqrt(80000)=283mil
#
# 1o      o3
#
#     2o
Element[0x0 "" "" "" 0 0 -10000 -12000 0 100 0x0]
(
   Pin[-14100 0 8000 2000 10000 5000 "" "1" 0x0001]
   Pin[ 0  14100 8000 2000 10000 5000 "" "2" 0x0001]
   Pin[ 14100 0 8000 2000 10000 5000 "" "1" 0x0001]
   ElementArc[0 0 17500 17500 15 60 1000]
   ElementArc[0 0 17500 17500 105 60 1000]
   ElementArc[0 0 17500 17500 195 150 1000]
)
