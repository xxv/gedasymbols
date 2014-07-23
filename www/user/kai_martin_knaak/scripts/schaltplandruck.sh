#!/bin/bash
# A script to print all sheets of a hierarchical gschem schematic to PDF
#################################################-<(kmk)>- 2013 ########


function shorthelp {
  echo ""
  echo "Collects all sub sheets of a hierarchical design and prints them to multi"
  echo "page postscript and PDF. Schematics are sorted according to page attribute."
  echo "If no file name is given on the command line, the script assumes that the"
  echo "name of the script contains the file name of the schematic prefixed with"
  echo "the string \"schaltplandruck_\"."
  echo "This script uses awk, psmerge, ps2pdf poster and optionally evince"
  echo " "
  echo "Usage: `basename $0` [-V] [-?] [foobar.sch]"
  echo "-V     launch viewer on produced output"
  echo "-?     print this help message and exit"
  echo ""
}

STARTVIEWER=0
while getopts ":V?" Option
do
  case $Option in
    V     ) echo "will start PDF viewer "; STARTVIEWER=1 ;;
    ?     ) shorthelp; exit ;;
    *     ) echo "Unknown option: "$Option ; shorthelp; exit ;;   # Default.
  esac
done
shift $(($OPTIND - 1))   # go to next argument


###########
# set some shell variables

if [ $# -eq 0 ]    # If script invoked with no command-line args
then
  SCRIPTNAME=`basename $0 ".sh"`
  SCHFILE=${SCRIPTNAME##schaltplandruck_}".sch"
  echo "No schematic file given... --> try to guess from name of the script: ../"$SCHFILE
  SCHEMDIR=..
else               # If script invoked with more than one argument
  SCHFILE=`basename $1`
  SCHEMDIR=`dirname $1`
fi

WORKINGDIR=$PWD
PREFIX="/tmp/out_schaltplandruck"

OUTPDF=`basename $SCHFILE .sch`"_schematic_"`date +%F`".pdf"
OUTPS=`basename $SCHFILE .sch`"_schematic_"`date +%F`".ps"

##########
# this function is called for every subsheet 

function subsheet {
  # Check for source attributes sort and drop duplicates
  SUBSCH=`awk 'BEGIN { FS = "=" } ; $1 == "source" { print $2 }' $1 | sort -u`
  for i in $SUBSCH
    do
      PAGE=`awk 'BEGIN { FS = "=" } ; $1 == "page" { print $2 }' $i`
      echo "found sub sheet: "$i" with page number "$PAGE
      # syntesize a name with padded pagenumber for correct sorting downstream
      OUT=$PREFIX"_"`printf "%03d" $PAGE`"_"$i
      # print schematic using gaf export
      gaf export -l auto --no-color -o $OUT".eps" $i
      poster $OUT".eps" > $OUT".ps"
      subsheet $i
    done
}


###########
# main block

cd $SCHEMDIR

# print the top schematic
gaf export -l auto -o $PREFIX"_001.eps" $SCHFILE

# use poster utility to rotate the eps to upright portrait view
poster $PREFIX"_001.eps" > $PREFIX"_001.ps"

# recursively descend into subsheets
subsheet $SCHFILE
 
## Combine to a single document
psmerge -o$PREFIX"_merged.ps" $PREFIX"_"[0-9]*".ps"

## Convert to PDF
ps2pdf $PREFIX"_merged.ps" $WORKINGDIR/$OUTPDF
echo $WORKINGDIR/$OUTPDF erstellt.

## optionally start viewer
if [ "$STARTVIEWER" = "1" ]
then
  evince $WORKINGDIR/$OUTPDF
fi

# remove temporary files
rm $PREFIX"_"*.*ps
