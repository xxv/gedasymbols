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
Element[""        ""     "vs1053"     "" 10      10     70000   40000  3     400    "showname"]
(
  # ===================================================================================================
  # Pin[...]
  #     rX       rY       Thickness  Clearance   Mask      Drill     "Name"       "Number" SFlags]
    Pin[0         35000   5000       10240       1000      2000      ""           "10"     ""]
    Pin[0         45000   5000       10240       1000      2000      ""           "9"      ""]
    Pin[0         55000   5000       10240       1000      2000      ""           "8"      ""]
    Pin[0         65000   5000       10240       1000      2000      ""           "7"      ""]
    Pin[0         75000   5000       10240       1000      2000      ""           "6"      ""]
    Pin[0         85000   5000       10240       1000      2000      ""           "5"      "showname"]
    Pin[0         95000   5000       10240       1000      2000      ""           "4"      "showname"]
    Pin[0        105000   5000       10240       1000      2000      ""           "3"      "showname"]
    Pin[0        115000   5000       10240       1000      2000      ""           "2"      "showname"]
    Pin[0        125000   5000       10240       1000      2000      ""           "1"      "showname"]

    Pin[30000      5000   5000       10240       1000      2000      ""           "11"      ""]
    Pin[40000      5000   5000       10240       1000      2000      ""           "12"      ""]
    Pin[50000      5000   5000       10240       1000      2000      ""           "13"      ""]
    Pin[60000      5000   5000       10240       1000      2000      ""           "14"      ""]
    Pin[70000      5000   5000       10240       1000      2000      ""           "15"      ""]
    Pin[80000      5000   5000       10240       1000      2000      ""           "16"      ""]

    Pin[110000    35000   5000       10240       1000      2000      ""           "17"      ""]
    Pin[110000    45000   5000       10240       1000      2000      ""           "18"      ""]
    Pin[110000    55000   5000       10240       1000      2000      ""           "19"      ""]
    Pin[110000    65000   5000       10240       1000      2000      ""           "20"      ""]
    Pin[110000    75000   5000       10240       1000      2000      ""           "21"      ""]
    Pin[110000    85000   5000       10240       1000      2000      ""           "22"      ""]
    Pin[110000    95000   5000       10240       1000      2000      ""           "23"      ""]
    Pin[110000   105000   5000       10240       1000      2000      ""           "24"      ""]
    Pin[110000   115000   5000       10240       1000      2000      ""           "25"      ""]
    Pin[110000   125000   5000       10240       1000      2000      ""           "26"      ""]
  # ===================================================================================================
  # ElementLine[...]
  #             rX1         rY1        rX2         rY2       Thickness

    ElementLine[-4000       2000       113000      2000       2000]
    ElementLine[113000      2000       113000      155000     2000]
    ElementLine[113000      155000     -4000       155000     2000]
    ElementLine[-4000       155000     -4000       2000       2000]
  # ===================================================================================================
  # [pins]
    # left side
    ElementLine[0     35000 -4000 35000     1024]
    ElementLine[0     45000 -4000 45000     1024]
    ElementLine[0     55000 -4000 55000     1024]
    ElementLine[0     65000 -4000 65000     1024]
    ElementLine[0     75000 -4000 75000     1024]
    ElementLine[0     85000 -4000 85000     1024]
    ElementLine[0     95000 -4000 95000     1024]
    ElementLine[0    105000 -4000 105000    1024]
    ElementLine[0    115000 -4000 115000    1024]
    ElementLine[0    125000 -4000 125000    1024]
    # top side
    ElementLine[30000 2000 30000 5000     1024]
    ElementLine[40000 2000 40000 5000     1024]
    ElementLine[50000 2000 50000 5000     1024]
    ElementLine[60000 2000 60000 5000     1024]
    ElementLine[70000 2000 70000 5000     1024]
    ElementLine[80000 2000 80000 5000     1024]
    # right side
    ElementLine[110000    35000 112000 35000     1024]
    ElementLine[110000    45000 112000 45000     1024]
    ElementLine[110000    55000 112000 55000     1024]
    ElementLine[110000    65000 112000 65000     1024]
    ElementLine[110000    75000 112000 75000     1024]
    ElementLine[110000    85000 112000 85000     1024]
    ElementLine[110000    95000 112000 95000     1024]
    ElementLine[110000   105000 112000 105000    1024]
    ElementLine[110000   115000 112000 115000    1024]
    ElementLine[110000   125000 112000 125000    1024]
  # ===================================================================================================
  # ElementArc[...]
  # to make it look nicer - draw some arcs around the pins
  # notice: the values are directly copy&pasted from the pins (values are the same for X and Y)
  #
  #            rX       rY            Width       Height    StartAngle       DeltaAngle       Thickness

    ElementArc[4000     10000         8000        8000      0                360             2000]
    ElementArc[105000   10000         8000        8000      0                360             2000]
    ElementArc[4000     145000        8000        8000      0                360             2000]
    ElementArc[105000   145000        8000        8000      0                360             2000]

  # left side..
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
  # top side...
    ElementArc[30000      5000        3000        3000      0                360             540]
    ElementArc[40000      5000        3000        3000      0                360             540]
    ElementArc[50000      5000        3000        3000      0                360             540]
    ElementArc[60000      5000        3000        3000      0                360             540]
    ElementArc[70000      5000        3000        3000      0                360             540]
    ElementArc[80000      5000        3000        3000      0                360             540]
  # right side...
    ElementArc[110000    35000        3000        3000      0                360             540]
    ElementArc[110000    45000        3000        3000      0                360             540]
    ElementArc[110000    55000        3000        3000      0                360             540]
    ElementArc[110000    65000        3000        3000      0                360             540]
    ElementArc[110000    75000        3000        3000      0                360             540]
    ElementArc[110000    85000        3000        3000      0                360             540]
    ElementArc[110000    95000        3000        3000      0                360             540]
    ElementArc[110000   105000        3000        3000      0                360             540]
    ElementArc[110000   115000        3000        3000      0                360             540]
    ElementArc[110000   125000        3000        3000      0                360             540]
  # ===================================================================================================

)
# =====================================================================================================
