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
Element[""        ""     ""     ""       10      10     11500   11000  0     100   "showname"]
(
  # Pad
  #   x1       y1       x2         y2         thickness clearance mask name pad_number flags]
  # Pad[-21000  -32500    -15000     -32500     2000      1000      3000 "1"  "1"        "onsolder"]

  # ===================================================================================================
  # Pin[...]
  #     rX       rY       Thickness  Clearance   Mask      Drill     "Name"          "Number" SFlags]
    Pin[6000          0   4000       2000        3000      2000      ""              "1"       ""]
    Pin[8500       5000   4000       2000        3000      2000      ""              "2"       "sqare"]
    Pin[6000      10000   4000       2000        3000      2000      ""              "3"       ""]
  # ===================================================================================================
  # ElementArc[...]
  # to make it look nicer - draw some arcs around the pins
  # notice: the values are directly copy&pasted from the pins (values are the same for X and Y)
  #
  #            rX       rY            Width       Height    StartAngle       DeltaAngle       Thickness
    ElementArc[6000          0        2500        2500      0                360             800]
    ElementArc[8500       5000        2500        2500      0                360             800]
    ElementArc[6000      10000        2500        2500      0                360             800]
    ElementArc[3000       5000        10000       10000     90               180             1020]

  # ===================================================================================================
  # ElementLine[...]
  #             rX1         rY1        rX2         rY2       Thickness
    ElementLine[3000        -5000      3000        15000     1000]
  # ===================================================================================================
)
# =====================================================================================================
