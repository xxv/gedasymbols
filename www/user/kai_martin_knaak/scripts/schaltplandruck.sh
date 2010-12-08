#!/bin/bash
# A script to print all sheets of a hierarchical gschem schematic to PDF
#################################################-<(kmk)>- 2010 ########

if [ $# -eq 0 ]    # If Script invoked with no command-line args
then
  echo "Collects all sub sheets of a hierarchical design and prints them to"
  echo "multi page PDF. Uses awk, psmerge, ps2pdf and evince"
  echo "Usage: `basename $0` [-p][-V] foobar.sch"
  echo "-V     launch viewer on produced output"
  exit
fi  

STARTVIEWER=0
while getopts ":V" Option
do
  case $Option in
    V     ) echo "will start PDF viewer "; STARTVIEWER=1 ;;
    *     ) echo "Unknown option: "$Option ;;   # Default.
  esac
done
shift $(($OPTIND - 1))   # go to next argument

###########################################################################

SCHFILE=`basename $1`
OUTPDF=`basename $SCHFILE .sch`"_schematic.pdf"
SCHEMDIR=`dirname $1`
WORKINGDIR=$PWD
PRINTSCM="/usr/local/share/gEDA/scheme/print.scm"
PREFIX="/tmp/out_schaltplandruck"

function subsheet {
  # Check for source attributes sort and drop duplicates
  SUBSCH=`awk 'BEGIN { FS = "=" } ; $1 == "source" { print $2 }' $1 | sort -u`
  for i in $SUBSCH
    do
      echo "found sub sheet: "$i
      # print schematic using the scheme script provided by gnetlist
      gschem -p -o $PREFIX_$i".ps" -s $PRINTSCM $i
      subsheet $i
    done
}


cd $SCHEMDIR

# print the top schematic
gschem -p -o $PREFIX.ps -s $PRINTSCM $SCHFILE

# recursively descend into subsheets
subsheet $SCHFILE

## Combine to a single document
psmerge -o$PREFIX_merged.ps $PREFIX.ps $PREFIX_*.ps

## Convert to PDF
ps2pdf $PREFIX_merged.ps $WORKINGDIR/$OUTPDF

## optionally start viewer
if [ "$STARTVIEWER" = "1" ]
then
  evince $WORKINGDIR/$OUTPDF
fi

# remove temporary files
rm $PREFIX*.ps

