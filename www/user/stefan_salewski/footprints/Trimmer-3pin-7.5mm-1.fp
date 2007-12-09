# author: Stefan Salewski
# email: mail@ssalewski.de
# dist-license: GPL
# use-license: unlimited

# Pcb element (footprint/land pattern) for trimmer with 3 pins, 7.5mm diameter
# S. Salewski, 09-NOV-2007
# Distance pin1 to pin2 is 200mil, distance pin1 to pin 3 is sqrt(80000)=283mil
#
# 1o
#
# 2o  o3
Element[0x0 "Trimmer" "" "" 0 0 -17500 -24500 0 100 0x0]
(
   Pin[-10000 -10000 8000 2000 10000 5000 "" "1" 0x0001]
   Pin[-10000  10000 8000 2000 10000 5000 "" "2" 0x0001]
   Pin[ 10000  10000 8000 2000 10000 5000 "" "1" 0x0001]
   ElementArc[0 0 17500 17500 60 60 1000]
   ElementArc[0 0 17500 17500 150 150 1000]
   ElementArc[0 0 17500 17500 330 60 1000]
)
