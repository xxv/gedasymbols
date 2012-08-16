#!/bin/sh
# Collect geda and pcb config files and export as zip
# -<)kaimartin(>-
tar -czf geda-conf.tgz  --directory=$HOME \
	.gEDA/gafrc \
	.gEDA/gnetlistrc \
	.gEDA/gschemrc \
	.gEDA/gschem-colors \
	.pcb/settings \
	.pcb/preferences \
	.pcb/colors/footprint \
	.pcb/colors/layout_2layer \
	.pcb/colors/layout_4layer

OUTFILE=$PWD/geda-conf.zip
mv $OUTFILE /tmp
cd $HOME
zip -o $OUTFILE \
	.gEDA/gafrc \
	.gEDA/gnetlistrc \
	.gEDA/gschemrc \
	.gEDA/gschem-colors \
	.pcb/settings \
	.pcb/preferences \
	.pcb/colors/footprint \
	.pcb/colors/layout_2layer \
	.pcb/colors/layout_4layer

