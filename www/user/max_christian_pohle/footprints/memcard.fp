# genreal: 1mm = 39.3700787402mil
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
Element[""        ""     ""     ""       10      10     55905   45000  0     100   "showname"]
(
  # ===================================================================================================
  # Pad[...]
  #     x1,     y1,     x2,    y2,     thickness,    clearance,    mask,    name,    pad number, flags
    Pad[0       5000   12000  5000     5000          3000          3000     ""       "9"       ""]
    Pad[0      15000   12000  15000    5000          3000          3000     ""       "1"       ""]
    Pad[0      25000   12000  25000    5000          3000          3000     ""       "2"       ""]
    Pad[0      35000   12000  35000    5000          3000          3000     ""       "3"       ""]
    Pad[0      45000   12000  45000    5000          3000          3000     ""       "4"       ""]
    Pad[0      55000   12000  55000    5000          3000          3000     ""       "5"       ""]
    Pad[0      65000   12000  65000    5000          3000          3000     ""       "6"       ""]
    Pad[0      75000   12000  75000    5000          3000          3000     ""       "7"       ""]
    Pad[0      85000   12000  85000    5000          3000          3000     ""       "8"       ""]
  # ===================================================================================================
  # ElementLine[...]
  #             rX1         rY1        rX2         rY2       Thickness
    ElementLine[0           0          111811      0          1020]
    ElementLine[111811      0          111811      90000      1020]
    ElementLine[111811      90000      0           90000      1020]
  # ===================================================================================================
)
# =====================================================================================================
