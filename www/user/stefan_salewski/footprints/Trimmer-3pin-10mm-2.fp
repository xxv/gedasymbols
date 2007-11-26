# author: Stefan Salewski
# email: mail@ssalewski.de
# dist-license: GPL
# use-license: unlimited
# Pcb element (footprint/land pattern) for trimmer with 3 pins, 10mm diameter
# S. Salewski, 09-NOV-2007
# Distance pin1 to pin3 is 200mil, vertical distance pin1 to pin2 is 300mil
#   5mm
#  <---->
# 1o    o3 -
#          | 7.5mm
#    2o    -
Element[0x0 "" "" "" 0 0 -10000 0 0 100 0x0]
(
   Pin[-10000 -10000 8000 2000 10000 5000 "" "1" 0x0001]
   Pin[ 0  20000 8000 2000 10000 5000 "" "2" 0x0001]
   Pin[ 10000 -10000 8000 2000 10000 5000 "" "1" 0x0001]
   ElementArc[0 0 23000 23000 105 330 1000]
)

