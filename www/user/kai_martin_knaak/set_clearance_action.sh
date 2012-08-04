#!/bin/sh
# A convenience script that uses pcb actions to set the mask clearance of pads
# in a layout to a sensible value.
######################################################-<)kmk(>-(2011-2012)

PCBFILE=$1
PCB=/usr/local/bin/pcb

$PCB \
  --action-string 'Select(All); SetFlag(Selected, square); Quit()' \
  $PCBFILE

