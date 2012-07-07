# =====================================================================================================
# author: Max Christian Pohle, 2010
# email: gedasymbols@wireme.de
# url: http://www.entwicklerseite.de/
# dist-license: GPL3, http://www.gnu.org/licenses/gpl-3.0.txt
# use-license: unlimited
# 
# *SYNTAX*
# Element[...](...) ===================================================================================
#
# [SFlags]
# symbolic flags like ["", "edge2", "square", "octagon", "onsolder", "showname", "hole"]
#
# [Name, Value, Desc]
# leave blank (filled out automatically by gsch2pcb)
#
# [MX,MY]
# elements source-X, sourceY (source of all relative coordinates)
#
# [TX,TY]
# initial text-position for values Name,Value,Desc
#
# [TDir]
# relative text-direction ["0"->0deg. (horizontal); "1"->90deg., "2"->180deg., "3"->240deg.]
#
# [TScale]
# text-scaling (percentage of default-font), leave 100 if applicable
#
# [TSFlags]
# leave blank (don't know what )
#
# =====================================================================================================
#       SFlags    "Desc" "Name" "Value"  MX      MY     TX      TY     TDir  TScale TSFlags]
Element[""        ""     ""     ""       10      10     30000   95000  3     100   "showname"]
(
  # ===================================================================================================
  # Pin[...]
  #     rX       rY       Thickness  Clearance   Mask      Drill     "Name"          "Number" SFlags]
    Pin[0          5000   5000       10240       1000      2000      "PB0"           "1"       "square"]
    Pin[0         15000   5000       10240       1000      2000      "PB1"           "2"       ""]
    Pin[0         25000   5000       10240       1000      2000      "PB2"           "3"       ""]
    Pin[0         35000   5000       10240       1000      2000      "PB3"           "4"       ""]
    Pin[0         45000   5000       10240       1000      2000      "PB4"           "5"       ""]
    Pin[0         55000   5000       10240       1000      2000      "PB5"           "6"       ""]
    Pin[0         65000   5000       10240       1000      2000      "PB6"           "7"       ""]
    Pin[0         75000   5000       10240       1000      2000      "PB7"           "8"       ""]
    Pin[0         85000   5000       10240       1000      2000      "RESET"         "9"       "showname"]
    Pin[0         95000   5000       10240       1000      2000      "VCC"           "10"      "showname"]
    Pin[0        105000   5000       10240       1000      2000      "GND"           "11"      "showname"]
    Pin[0        115000   5000       10240       1000      2000      "XTAL2"         "12"      "showname"]
    Pin[0        125000   5000       10240       1000      2000      "XTAL1"         "13"      "showname"]
    Pin[0        135000   5000       10240       1000      2000      "PD0"           "14"      ""]
    Pin[0        145000   5000       10240       1000      2000      "PD1"           "15"      ""]
    Pin[0        155000   5000       10240       1000      2000      "PD2"           "16"      ""]
    Pin[0        165000   5000       10240       1000      2000      "PD3"           "17"      ""]
    Pin[0        175000   5000       10240       1000      2000      "PD4"           "18"      ""]
    Pin[0        185000   5000       10240       1000      2000      "PD5"           "19"      ""]
    Pin[0        195000   5000       10240       1000      2000      "PD6"           "20"      ""]
    Pin[60000      5000   5000       10240       1000      2000      "PA0"           "40"      ""]
    Pin[60000     15000   5000       10240       1000      2000      "PA1"           "39"      ""]
    Pin[60000     25000   5000       10240       1000      2000      "PA2"           "38"      ""]
    Pin[60000     35000   5000       10240       1000      2000      "PA3"           "37"      ""]
    Pin[60000     45000   5000       10240       1000      2000      "PA4"           "36"      ""]
    Pin[60000     55000   5000       10240       1000      2000      "PA5"           "35"      ""]
    Pin[60000     65000   5000       10240       1000      2000      "PA6"           "34"      ""]
    Pin[60000     75000   5000       10240       1000      2000      "PA7"           "33"      ""]
    Pin[60000     85000   5000       10240       1000      2000      "AREF"          "32"      ""]
    Pin[60000     95000   5000       10240       1000      2000      "GND"           "31"      ""]
    Pin[60000    105000   5000       10240       1000      2000      "AVCC"          "30"      ""]
    Pin[60000    115000   5000       10240       1000      2000      "PC7"           "29"      ""]
    Pin[60000    125000   5000       10240       1000      2000      "PC6"           "28"      ""]
    Pin[60000    135000   5000       10240       1000      2000      "PC5"           "27"      ""]
    Pin[60000    145000   5000       10240       1000      2000      "PC4"           "26"      ""]
    Pin[60000    155000   5000       10240       1000      2000      "PC3"           "25"      ""]
    Pin[60000    165000   5000       10240       1000      2000      "PC2"           "24"      ""]
    Pin[60000    175000   5000       10240       1000      2000      "PC1"           "23"      ""]
    Pin[60000    185000   5000       10240       1000      2000      "PC0"           "22"      ""]
    Pin[60000    195000   5000       10240       1000      2000      "PD7"           "21"      "showname"]
  # ===================================================================================================
  # ElementLine[...]
  #             rX1         rY1        rX2         rY2       Thickness
    ElementLine[4000        0          56000       0          1020]
    ElementLine[56000       0          56000       200000     1020]
    ElementLine[56000       200000     4000        200000     1020]
    ElementLine[4000        200000     4000        0          1020]


  # ===================================================================================================
  # ElementArc[...]
  # to make it look nicer - draw some arcs around the pins
  # notice: the values are directly copy&pasted from the pins (values are the same for X and Y)
  #
  #            rX       rY            Width       Height    StartAngle       DeltaAngle       Thickness
    ElementArc[30000    0             4000        4000      0                180              1024]

  # ===================================================================================================
  # [pins]
    # left side
    ElementLine[0      5000 4000 5000      1024]
    ElementLine[0     15000 4000 15000     1024]
    ElementLine[0     25000 4000 25000     1024]
    ElementLine[0     35000 4000 35000     1024]
    ElementLine[0     45000 4000 45000     1024]
    ElementLine[0     55000 4000 55000     1024]
    ElementLine[0     65000 4000 65000     1024]
    ElementLine[0     75000 4000 75000     1024]
    ElementLine[0     85000 4000 85000     1024]
    ElementLine[0     95000 4000 95000     1024]
    ElementLine[0    105000 4000 105000    1024]
    ElementLine[0    115000 4000 115000    1024]
    ElementLine[0    125000 4000 125000    1024]
    ElementLine[0    135000 4000 135000    1024]
    ElementLine[0    145000 4000 145000    1024]
    ElementLine[0    155000 4000 155000    1024]
    ElementLine[0    165000 4000 165000    1024]
    ElementLine[0    175000 4000 175000    1024]
    ElementLine[0    185000 4000 185000    1024]
    ElementLine[0    195000 4000 195000    1024]
    # right side
    ElementLine[56000      5000 60000 5000      1024]
    ElementLine[56000     15000 60000 15000     1024]
    ElementLine[56000     25000 60000 25000     1024]
    ElementLine[56000     35000 60000 35000     1024]
    ElementLine[56000     45000 60000 45000     1024]
    ElementLine[56000     55000 60000 55000     1024]
    ElementLine[56000     65000 60000 65000     1024]
    ElementLine[56000     75000 60000 75000     1024]
    ElementLine[56000     85000 60000 85000     1024]
    ElementLine[56000     95000 60000 95000     1024]
    ElementLine[56000    105000 60000 105000    1024]
    ElementLine[56000    115000 60000 115000    1024]
    ElementLine[56000    125000 60000 125000    1024]
    ElementLine[56000    135000 60000 135000    1024]
    ElementLine[56000    145000 60000 145000    1024]
    ElementLine[56000    155000 60000 155000    1024]
    ElementLine[56000    165000 60000 165000    1024]
    ElementLine[56000    175000 60000 175000    1024]
    ElementLine[56000    185000 60000 185000    1024]
    ElementLine[56000    195000 60000 195000    1024]
    # 'first pin'-rect...
    ElementLine[-3150       1850       3150        1850       1020]
    ElementLine[3150        1850       3150        8150       1020]
    ElementLine[3150        8150       -3150       8150       1020]
    ElementLine[-3150       8150       -3150       1850       1020]
  # ===================================================================================================
  # ElementArc[...]
  # to make it look nicer - draw some arcs around the pins
  # notice: the values are directly copy&pasted from the pins (values are the same for X and Y)
  #
  #            rX       rY            Width       Height    StartAngle       DeltaAngle       Thickness
  # ElementArc[0          5000        3000        3000      0                360             540]
    ElementArc[0         15000        3000        3000      0                360             540]
    ElementArc[0         25000        3000        3000      0                360             540]
    ElementArc[0         35000        3000        3000      0                360             540]
    ElementArc[0         45000        3000        3000      0                360             540]
    ElementArc[0         55000        3000        3000      0                360             540]
    ElementArc[0         65000        3000        3000      0                360             540]
    ElementArc[0         75000        3000        3000      0                360             540]
    ElementArc[0         85000        3000        3000      0                360             540]
    ElementArc[0         95000        3000        3000      0                360             540]
    ElementArc[0        105000        3000        3000      0                360             540]
    ElementArc[0        115000        3000        3000      0                360             540]
    ElementArc[0        125000        3000        3000      0                360             540]
    ElementArc[0        135000        3000        3000      0                360             540]
    ElementArc[0        145000        3000        3000      0                360             540]
    ElementArc[0        155000        3000        3000      0                360             540]
    ElementArc[0        165000        3000        3000      0                360             540]
    ElementArc[0        175000        3000        3000      0                360             540]
    ElementArc[0        185000        3000        3000      0                360             540]
    ElementArc[0        195000        3000        3000      0                360             540]
  # other side...
    ElementArc[60000      5000        3000        3000      0                360             540]
    ElementArc[60000     15000        3000        3000      0                360             540]
    ElementArc[60000     25000        3000        3000      0                360             540]
    ElementArc[60000     35000        3000        3000      0                360             540]
    ElementArc[60000     45000        3000        3000      0                360             540]
    ElementArc[60000     55000        3000        3000      0                360             540]
    ElementArc[60000     65000        3000        3000      0                360             540]
    ElementArc[60000     75000        3000        3000      0                360             540]
    ElementArc[60000     85000        3000        3000      0                360             540]
    ElementArc[60000     95000        3000        3000      0                360             540]
    ElementArc[60000    105000        3000        3000      0                360             540]
    ElementArc[60000    115000        3000        3000      0                360             540]
    ElementArc[60000    125000        3000        3000      0                360             540]
    ElementArc[60000    135000        3000        3000      0                360             540]
    ElementArc[60000    145000        3000        3000      0                360             540]
    ElementArc[60000    155000        3000        3000      0                360             540]
    ElementArc[60000    165000        3000        3000      0                360             540]
    ElementArc[60000    175000        3000        3000      0                360             540]
    ElementArc[60000    185000        3000        3000      0                360             540]
    ElementArc[60000    195000        3000        3000      0                360             540]
  # ===================================================================================================

)
# =====================================================================================================
