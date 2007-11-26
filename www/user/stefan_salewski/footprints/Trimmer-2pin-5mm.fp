# author: Stefan Salewski
# email: mail@ssalewski.de
# dist-license: GPL
# use-license: unlimited

# Pcb element (footprint/land pattern) for trimmer with 2 pins, 5mm diameter
# S. Salewski, 09-NOV-2007
# Distance pin1 to pin2 is 200mil
#     5mm
#  <------>
# 1o      o2
Element[0x0 "" "" "" 0 0 -10000 -20000 0 100 0x0]
(
   Pin[-10000 0 8000 2000 10000 5000 "" "1" 0x0001]
   Pin[ 10000  0 8000 2000 10000 5000 "" "2" 0x0001]
   ElementArc[0 0 11500 11500 25 130 1000]
   ElementArc[0 0 11500 11500 205 130 1000]
)
