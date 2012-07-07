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
Element[""        ""     ""     ""       10      10     10000   70000  1     100   "showname"]
(
  # ===================================================================================================
  # Pin[...]
  #     rX       rY       Thickness  Clearance   Mask      Drill     "Name"          "Number" SFlags]
    Pin[5000     5000     5000       4000        1000      2000      "SELECT"        "1"       "square"]
    Pin[5000     15000    5000       4000        1000      2000      "SCK"           "2"       ""]
    Pin[5000     25000    5000       4000        1000      2000      "MISO"          "3"       ""]
    Pin[5000     35000    5000       4000        1000      2000      "MOSI"          "4"       ""]
    Pin[5000     65000    5000       4000        1000      2000      "VCC"           "5"       ""]
    Pin[15000    65000    5000       4000        1000      2000      "GND"           "6"       ""]
    Pin[35000    65000    5000       4000        1000      2000      "PWM"           "7"       ""]
    Pin[45000    65000    5000       4000        1000      2000      "CMD/DI"        "8"       ""]
  # ===================================================================================================
  # ElementLine[...]
  #             rX1         rY1        rX2         rY2       Thickness
    ElementLine[0           0          10000       0          1020]
    ElementLine[10000       0          10000       40000      1020]
    ElementLine[10000       40000      0           40000      1020]
    ElementLine[0           40000      0           0          1020]

    ElementLine[0           60000      20000       60000      1020]
    ElementLine[20000       60000      20000       70000      1020]
    ElementLine[20000       70000      0           70000      1020]
    ElementLine[0           70000      0           60000      1020]

    ElementLine[30000       60000      50000       60000      1020]
    ElementLine[50000       60000      50000       70000      1020]
    ElementLine[50000       70000      30000       70000      1020]
    ElementLine[30000       70000      30000       60000      1020]


    # 'first pin'-rect...
    ElementLine[1850        1850       8150        1850       1020]
    ElementLine[8150        1850       8150        8150       1020]
    ElementLine[8150        8150       1850        8150       1020]
    ElementLine[1850        8150       1850        1850       1020]
  # ===================================================================================================
  # ElementArc[...]
  # to make it look nicer - draw some arcs around the pins
  # notice: the values are directly copy&pasted from the pins (values are the same for X and Y)
  #
  #            rX       rY            Width       Height    StartAngle       DeltaAngle       Thickness
    #ElementArc[5000       5000        3000        3000      0                360             540]
    ElementArc[5000      15000        3000        3000      0                360             540]
    ElementArc[5000      25000        3000        3000      0                360             540]
    ElementArc[5000      35000        3000        3000      0                360             540]
  # ===================================================================================================
)
# =====================================================================================================
