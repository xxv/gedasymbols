#!/bin/bash
# print the bill of materials from a schematic
SCHEMATIC=$1
OUTFILE=`basename $SCHEMATIC .sch`"_koll.bom"
OUTFILE_SINGLE=`basename $SCHEMATIC .sch`".bom"

gnetlist -g bom2 -o $OUTFILE $SCHEMATIC
gnetlist -g partslist2 -o $OUTFILE_SINGLE $SCHEMATIC

