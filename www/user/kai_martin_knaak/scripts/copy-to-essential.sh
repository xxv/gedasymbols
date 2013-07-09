#!/bin/sh
# A very simple script to copy symbols and components to the essential lib

#######################################################################
############# symbols #################################################
#######################################################################

cd $HOME/geda/gedasymbols/kai_martin_knaak
PRE=essential/symbols

### analog ###
cp symbols/analog/comparators/comparator.sym $PRE/analog
cp symbols/analog/comparators/comparator_pwr.sym $PRE/analog
cp symbols/analog/amplifiers/instr_amp_8pin.sym $PRE/analog
cp symbols/analog/amplifiers/opamp_with_pwr_pins.sym $PRE/analog
cp symbols/analog/amplifiers/opamp_single.sym $PRE/analog
cp symbols/analog/amplifiers/opamp_single_pwr.sym $PRE/analog
cp symbols/analog/amplifiers/opamp_dual.sym $PRE/analog
cp symbols/analog/amplifiers/opamp_dual_pwr.sym $PRE/analog
cp symbols/analog/amplifiers/opamp_offset.sym $PRE/analog

cp symbols/analog/regulators/regulator_positive_fixed.sym $PRE/analog
cp symbols/analog/regulators/regulator_positive_variable.sym $PRE/analog
cp symbols/analog/regulators/regulator_negative_fixed.sym $PRE/analog
cp symbols/analog/regulators/regulator_negative_variable.sym $PRE/analog

### discretes ###
cp symbols/discrete/diodes/diode.sym $PRE/discrete
cp symbols/discrete/diodes/zener.sym $PRE/discrete
cp symbols/discrete/diodes/photodiode_BPW34.sym $PRE/discrete
cp symbols/discrete/diodes/led.sym $PRE/discrete
cp symbols/discrete/transistors/nmosfet.sym $PRE/discrete
cp symbols/discrete/transistors/nmosfet_power.sym $PRE/discrete
cp symbols/discrete/transistors/pmosfet.sym $PRE/discrete
cp symbols/discrete/transistors/pmosfet_power.sym $PRE/discrete
cp symbols/discrete/transistors/npn_transistor.sym $PRE/discrete
cp symbols/discrete/transistors/pnp_transistor.sym $PRE/discrete
cp symbols/discrete/transistors/igbt.sym $PRE/discrete

cp symbols/discrete/cap_horiz.sym $PRE/discrete
cp symbols/discrete/cap_vert.sym $PRE/discrete
cp symbols/discrete/elko.sym $PRE/discrete
cp symbols/discrete/potentiometer.sym $PRE/discrete
cp symbols/discrete/potentiometer_vert.sym $PRE/discrete
cp symbols/discrete/varistor.sym $PRE/discrete

cp symbols/discrete/inductor.sym $PRE/discrete

# slightly different in essential-lib compared to kaimartin-lib
# cp symbols/analog/res.sym $PRE/discrete
# cp symbols/analog/res2.sym $PRE/discrete
# cp symbols/discrete/res_vert.sym $PRE/discrete


### digital ###
cp symbols/digital/74xxx/7400_4xNAND.sym $PRE/digital
cp symbols/digital/74xxx/7404_6xNOT.sym $PRE/digital
cp symbols/digital/74xxx/7432_4xOR.sym $PRE/digital
cp symbols/digital/74xxx/7486_4xXOR.sym $PRE/digital
cp symbols/digital/74xxx/74112_2xJK_flipflop.sym $PRE/digital
cp symbols/digital/74xxx/74161_4bit_counter.sym $PRE/digital
cp symbols/digital/74xxx/74_pwr.sym $PRE/digital
cp symbols/digital/74xxx/74_pwr16.sym $PRE/digital


### titleblock ###
cp symbols/titleblock/title-block.sym $PRE/titleblock/titleblock.sym
cp symbols/titleblock/in.sym $PRE/titleblock
cp symbols/titleblock/out.sym $PRE/titleblock


### power ###
cp symbols/power/gnd.sym $PRE/power
cp symbols/power/vcc.sym $PRE/power
cp symbols/power/vee.sym $PRE/power
cp symbols/power/Ub+.sym $PRE/power
cp symbols/power/Ub-.sym $PRE/power
cp symbols/power/5V+.sym $PRE/power
cp symbols/power/nc.sym $PRE/power

### connectors ###
###### FIXME #####

### misc ###
cp symbols/misc/jumper.sym $PRE/misc
cp symbols/misc/jumper_3pin.sym $PRE/misc
cp symbols/misc/jumper-default.sym $PRE/misc
cp symbols/switches/switch_SPDT.sym $PRE/misc
cp symbols/switches/switch_DPDT.sym $PRE/misc


#######################################################################
############# footprints ##############################################
#######################################################################

PRE=essential/footprints

### discrete thru hole ###
cp footprints/discretes/res_300mil.fp $PRE/discrete
cp footprints/discretes/res_400mil.fp $PRE/discrete
cp footprints/discretes/res_800mil.fp $PRE/discrete
cp footprints/discretes/res_vert.fp $PRE/discrete

cp footprints/discretes/cap_100mil.fp $PRE/discrete
cp footprints/discretes/cap_200mil.fp $PRE/discrete
cp footprints/discretes/cap_200mil_a.fp $PRE/discrete
cp footprints/discretes/cap_200mil_b.fp $PRE/discrete
cp footprints/discretes/cap_200mil_c.fp $PRE/discrete
cp footprints/discretes/cap_1100mil.fp $PRE/discrete

cp footprints/discretes/elko_RM25_D6.fp $PRE/discrete
cp footprints/discretes/elko_RM35_D8.fp $PRE/discrete
cp footprints/discretes/elko_RM5_D6.fp $PRE/discrete
cp footprints/discretes/elko_RM5_D10.fp $PRE/discrete
cp footprints/discretes/elko_RM5_D13.fp $PRE/discrete
cp footprints/discretes/elko_RM75_D16.fp $PRE/discrete
cp footprints/discretes/elko_RM75_D18.fp $PRE/discrete
cp footprints/discretes/elko_RM10_D22.fp $PRE/discrete
cp footprints/discretes/elko_BC_D35.fp $PRE/discrete

cp footprints/discretes/dio_minimelf.fp $PRE/discrete
cp footprints/discretes/dio_1812.fp $PRE/discrete
cp footprints/discretes/dio_400mil.fp $PRE/discrete

cp footprints/discretes/LED_1206.fp $PRE/discrete
cp footprints/discretes/LED_3mm.fp $PRE/discrete
cp footprints/discretes/LED_5mm.fp $PRE/discrete

cp footprints/discretes/ind_300mil.fp $PRE/discrete
cp footprints/discretes/ind_400mil.fp $PRE/discrete

cp footprints/discretes/var_8mm.fp $PRE/discrete
cp footprints/discretes/var_8mm_lay.fp $PRE/discrete
cp footprints/discretes/var_10mm.fp $PRE/discrete
cp footprints/discretes/var_10mm_lay.fp $PRE/discrete

########### generic footprints for discretes #######
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

cp footprints/generic/DIP6.fp $PRE/generic
cp footprints/generic/DIP8.fp $PRE/generic
cp footprints/generic/DIP12.fp $PRE/generic
cp footprints/generic/DIP14.fp $PRE/generic
cp footprints/generic/DIP16.fp $PRE/generic
cp footprints/generic/DIP18.fp $PRE/generic
cp footprints/generic/DIP20.fp $PRE/generic
cp footprints/generic/DIP24.fp $PRE/generic
cp footprints/generic/DIP24_wide.fp $PRE/generic
cp footprints/generic/DIP28.fp $PRE/generic
cp footprints/generic/DIP28_wide.fp $PRE/generic
cp footprints/generic/DIP40_wide.fp $PRE/generic


### specific thru hole ###
cp footprints/specific/BPW34.fp $PRE/specific
cp footprints/specific/BPW34S.fp $PRE/specific
cp footprints/specific/BPW34_upsidedown.fp $PRE/specific
cp footprints/specific/BPW34S_upsidedown.fp $PRE/specific
cp footprints/potentiometers/VISHAY_T93YA.fp $PRE/specific
cp footprints/potentiometers/VISHAY_T93YB.fp $PRE/specific
cp footprints/potentiometers/VISHAY_T18.fp $PRE/specific
cp footprints/potentiometers/ALPS_RK11K112.fp $PRE/specific


### specific SMD ###
cp footprints/generic/SO8_78Lxx.fp $PRE/specific
cp footprints/generic/SO8_79Lxx.fp $PRE/specific
cp footprints/generic/SOT89_78LxxA.fp $PRE/specific
cp footprints/generic/SO8_LM317.fp $PRE/specific
cp footprints/generic/SO8_LM337.fp $PRE/specific
cp footprints/generic/SOT89_79Lxx.fp $PRE/specific

### connectors ###
cp footprints/connectors/AKL_2PIN.fp $PRE/connector
cp footprints/connectors/AKL_3PIN.fp $PRE/connector

### switches ###
cp footprints/switches/APEM_5646.fp $PRE/switches
cp footprints/switches/APEM_TL36WW.fp $PRE/switches
cp footprints/switches/APEM_TL39WW.fp $PRE/switches
cp footprints/switches/APEM_TL46.fp $PRE/switches
cp footprints/switches/APEM_TL46WW.fp $PRE/switches
cp footprints/switches/MIYAMA_MS500A.fp $PRE/switches
cp footprints/switches/MIYAMA_MS500A.fp $PRE/switches
cp footprints/switches/MIYAMA_MS500FPC.fp $PRE/switches
cp footprints/switches/MIYAMA_MS500FVT.fp $PRE/switches

### misc ###
cp footprints/misc/JMP_2PIN.fp $PRE/misc
cp footprints/misc/JMP_3PIN.fp $PRE/misc
cp footprints/misc/JMP_SMD.fp $PRE/misc
cp footprints/misc/JMP_default.fp $PRE/misc
