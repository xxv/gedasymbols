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
Element[""        ""     ""     ""       10      10     10000   30000  1     100   "showname"]
(
  # ===================================================================================================
  # Pin[...]
  #     rX       rY       Thickness  Clearance   Mask      Drill     "Name"          "Number" SFlags]
    Pin[5000       5000   5000       1500        1000      2000      ""              "1"       "square"]
    Pin[5000      25000   5000       1500        1000      2000      ""              "2"       "square"]
  # ===================================================================================================
  # ElementLine[...]
  #             rX1         rY1        rX2         rY2       Thickness
    ElementLine[0           0          10000       0          1020]
    ElementLine[10000       0          10000       30000      1020]
    ElementLine[10000       30000      0           30000      1020]
    ElementLine[0           30000      0           0          1020]

    # 'first pin'-rect...
    ElementLine[1850        1850       8150        1850       1020]
    ElementLine[8150        1850       8150        8150       1020]
    ElementLine[8150        8150       1850        8150       1020]
    ElementLine[1850        8150       1850        1850       1020]

    # 'first pin'-rect...
    ElementLine[1850        21850      8150       21850       1020]
    ElementLine[8150        21850      8150       28150       1020]
    ElementLine[8150        28150      1850       28150       1020]
    ElementLine[1850        28150      1850       21850       1020]
)
# =====================================================================================================
