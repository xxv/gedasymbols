#!/bin/sh
# A very simple script to copy symbols and components to the essential lib

PRE=essential/symbols

PRE=essential/footprints
cp footprints/discrete/res_RM10.fp $PRE/discrete
cp footprints/discrete/res_RM15.fp $PRE/discrete
cp footprints/discrete/res_RM20.fp $PRE/discrete
cp footprints/discrete/res_vert.fp $PRE/discrete

cp footprints/generic/0805.fp $PRE/generic
cp footprints/generic/0603.fp $PRE/generic

