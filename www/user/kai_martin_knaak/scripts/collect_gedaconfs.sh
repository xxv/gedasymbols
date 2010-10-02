#!/bin/sh
# Collect geda and pcb config files and export as zip
# -<)kaimartin(>-
tar -czf geda-conf.tgz  --directory=$HOME \
	.gEDA/gafrc \
	.gEDA/gnetlistrc \
	.gEDA/gschemrc \
	.pcb/settings \
	.pcb/preferences \
	.pcb/colors/footprint \
	.pcb/colors/layout \
	.pcb/colors/layout_4layer \
	.pcb/plugins/teardrops.so

