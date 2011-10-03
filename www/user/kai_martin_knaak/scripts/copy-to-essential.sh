#!/bin/sh
# A very simple script to copy symbols and components to the essential lib

PRE=essential/symbols

cp symbols/analog/opamp.sym $PRE/analog
cp symbols/analog/opamp_pwr.sym $PRE/analog
cp symbols/analog/opamp_dual.sym $PRE/analog
cp symbols/analog/opamp_dual_pwr.sym $PRE/analog
cp symbols/analog/opamp_offset.sym $PRE/analog

cp symbols/analog/diode/diode.sym $PRE/discrete
cp symbols/analog/diode/zener.sym $PRE/discrete
cp symbols/analog/diode/photodiode_BPW34.sym $PRE/discrete
cp symbols/analog/diode/led.sym $PRE/discrete
cp symbols/analog/igbt.sym $PRE/discrete
cp symbols/analog/cap_vert.sym $PRE/discrete
cp symbols/analog/nmosfet.sym $PRE/discrete
cp symbols/analog/nmosfet_power.sym $PRE/discrete
cp symbols/analog/pmosfet.sym $PRE/discrete
cp symbols/analog/pmosfet_power.sym $PRE/discrete

# cp symbols/analog/res.sym $PRE/discrete
# cp symbols/analog/res2.sym $PRE/discrete
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

cp symbols/titleblock/title-block.sym $PRE/titleblock/titleblock.sym
cp symbols/titleblock/in.sym $PRE/titleblock
cp symbols/titleblock/out.sym $PRE/titleblock

cp symbols/digital/7400_4xNAND.sym $PRE/digital
cp symbols/digital/7404_4xNOT.sym $PRE/digital
cp symbols/digital/7432_4xOR.sym $PRE/digital
cp symbols/digital/74112_2xJK_flipflop.sym $PRE/digital
cp symbols/digital/74161_4bit_counter.sym $PRE/digital
cp symbols/digital/74_pwr.sym $PRE/digital
cp symbols/digital/74_pwr16.sym $PRE/digital

#######################################################################
############# footprints ##############################################
#######################################################################

PRE=essential/footprints
cp footprints/discrete/res_RM10.fp $PRE/discrete
cp footprints/discrete/res_RM15.fp $PRE/discrete
cp footprints/discrete/res_RM20.fp $PRE/discrete
cp footprints/discrete/res_vert.fp $PRE/discrete

cp footprints/discrete/cap_100mil.fp $PRE/discrete
cp footprints/discrete/cap_200mil.fp $PRE/discrete
cp footprints/discrete/cap_200mil_a.fp $PRE/discrete

cp footprints/discrete/dio_1206.fp $PRE/discrete
cp footprints/discrete/dio_1812.fp $PRE/discrete
cp footprints/discrete/dio_RM10.fp $PRE/discrete

cp footprints/discrete/LED_3mm.fp $PRE/discrete
cp footprints/discrete/LED_5mm.fp $PRE/discrete

cp footprints/generic/SOT23_BEC.fp $PRE/discrete
cp footprints/generic/TO92_ECB.fp $PRE/discrete
cp footprints/generic/TO220_ECB.fp $PRE/discrete
cp footprints/generic/TO220_ECB_LAY.fp $PRE/discrete
cp footprints/generic/TO126_ECB.fp $PRE/discrete

cp footprints/generic/SOT23_GSD.fp $PRE/discrete
cp footprints/generic/TO92_GDS.fp $PRE/discrete
cp footprints/generic/TO92_DGS.fp $PRE/discrete
cp footprints/generic/TO220_GDS.fp $PRE/discrete
cp footprints/generic/TO247_GDS_LAY.fp $PRE/discrete

cp footprints/generic/TO220_GCE.fp $PRE/discrete
cp footprints/generic/TO247_GCE_LAY.fp $PRE/discrete

### generic SMD ###
cp footprints/generic/SOT23.fp $PRE/generic
cp footprints/generic/0805.fp $PRE/generic
cp footprints/generic/0603.fp $PRE/generic
cp footprints/generic/SO8.fp $PRE/generic
cp footprints/generic/SO14.fp $PRE/generic
cp footprints/generic/SO16.fp $PRE/generic
cp footprints/generic/SO16W.fp $PRE/generic
cp footprints/generic/SO20W.fp $PRE/generic
cp footprints/generic/SO24W.fp $PRE/generic
cp footprints/generic/SO28W.fp $PRE/generic


### generic thru hole ###
cp footprints/generic/TO92_123.fp $PRE/generic
cp footprints/generic/TO220.fp $PRE/generic
cp footprints/generic/TO247.fp $PRE/generic
cp footprints/generic/TO247_LAY.fp $PRE/generic

cp footprints/specific/BPW34.fp $PRE/specific
cp footprints/specific/BPW34S.fp $PRE/specific
cp footprints/specific/BPW34_upsidedown.fp $PRE/specific
cp footprints/specific/BPW34S_upsidedown.fp $PRE/specific
