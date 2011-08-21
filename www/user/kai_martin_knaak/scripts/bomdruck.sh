#!/bin/bash
# print the bill of materials from a geda schematic

if [ $# -eq 0 ]    # Script invoked with no command-line args?
then
  echo -e "\n print the bill of materials from a schematic\n"
  echo "Usage: `basename $0` foobar.sch"
  exit
fi  


SCHEMATIC=$1
OUTFILEKOLL=`basename $SCHEMATIC .sch`"_koll.bom"
OUTFILE_SINGLE=`basename $SCHEMATIC .sch`".bom"

gnetlist -g bom2 -o $OUTFILE_KOLL $SCHEMATIC
gnetlist -g partslist2 -o $OUTFILE_SINGLE $SCHEMATIC

