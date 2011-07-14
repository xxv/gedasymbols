#!/bin/sh
# A very simple script to copy symbols and components to the essential lib

PRE=essential/symbols

cp symbols/analog/opamp.sym $PRE/analog
cp symbols/analog/opamp_pwr.sym $PRE/analog
cp symbols/analog/opamp_dual.sym $PRE/analog
cp symbols/analog/opamp_dual_pwr.sym $PRE/analog
cp symbols/analog/opamp_offset.sym $PRE/analog


cp symbols/titleblock/title-block.sym $PRE/titleblock/titleblock.sym
cp symbols/titleblock/in.sym $PRE/titleblock
cp symbols/titleblock/out.sym $PRE/titleblock

cp symbols/power/gnd.sym $PRE/power
cp symbols/power/vcc.sym $PRE/power
cp symbols/power/vee.sym $PRE/power
cp symbols/power/Ub+.sym $PRE/power
cp symbols/power/Ub-.sym $PRE/power
cp symbols/power/5V+.sym $PRE/power
cp symbols/power/nc.sym $PRE/power


PRE=essential/footprints
cp footprints/discrete/res_RM10.fp $PRE/discrete
cp footprints/discrete/res_RM15.fp $PRE/discrete
cp footprints/discrete/res_RM20.fp $PRE/discrete
cp footprints/discrete/res_vert.fp $PRE/discrete

cp footprints/generic/0805.fp $PRE/generic
cp footprints/generic/0603.fp $PRE/generic

