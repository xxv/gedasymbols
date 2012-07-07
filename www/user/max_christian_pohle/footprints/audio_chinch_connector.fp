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
Element[""        ""     ""     ""       10      10     15000   30000  1     100   "showname"]
(
  # ===================================================================================================
  # Pin[...]
  #     rX       rY       Thickness  Clearance   Mask      Drill     "Name"          "Number" SFlags]
    Pin[5000       5000   2500       10240       1000      1250      "left"          "1"       "showname"]
    Pin[5000      25000   2500       10240       1000      1250      "right"         "5"       "showname"]
    Pin[10000     15000   2500       10240       1000      1250      "gnd"           "4"       "square,showname"]
  # ===================================================================================================
  # ElementLine[...]
  #             rX1         rY1        rX2         rY2       Thickness
    ElementLine[0           0          15000       0          256]
    ElementLine[15000       0          15000        30000     256]
    ElementLine[15000       30000      0            30000     256]
  # ===================================================================================================
  # ElementArc[...]
  # to make it look nicer - draw some arcs around the pins
  # notice: the values are directly copy&pasted from the pins (values are the same for X and Y)
  #
  #            rX       rY            Width       Height    StartAngle       DeltaAngle       Thickness
    ElementArc[5000       5000        1080        1080      0                360             540]
    ElementArc[5000      25000        1080        1080      0                360             540]
    ElementArc[10000     15000        1080        1080      0                360             540]
  # ===================================================================================================
)
# =====================================================================================================
