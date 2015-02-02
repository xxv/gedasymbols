#!/bin/bash
# A convenience script that uses awk to set the mask clearance of pads
# and pins to sensible values.
# Note: This script is resilient with regards to additional leading tabs.
# It chokes on leading spaces, though. It requires gawk, bash and basename.
######################################################-<)kmk(>-(2011-2012)

# This program is copyright (C) 2012, Kai-Martin Knaak
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 3 as
# published by the Free Software Foundation. 
# For details see http://www.gnu.org/licenses/gpl.txt

help () {
    echo -e \\n"Usage: set_clearance.sh [-a|-b|-c|-d] [-1|-2|-3|-4|-5|-6|-7] foobar"
    echo "This script uses awk to set polygon clearance and solder stop mask clearance for pads"
    echo "and pins. It works on files in pcb footprint format (*.fp), or layout format (*.pcb)."
    echo "The output replaces the file given by foobar. A backup copy of the original is written"
    echo "to /tmp."
    echo "The amount of clearance distance can be chosen with options:"
    echo "-a --> mask clearance 0.05 mm"
    echo "-b --> mask clearance 0.1 mm"
    echo "-c --> mask clearance 0.2 mm"
    echo "-d --> mask clearance 0.3 mm"
    echo "-1 --> polygon clearance 0.2 mm"
    echo "-2 --> polygon clearance 0.5 mm"
    echo "-3 --> polygon clearance 0.7 mm"
    echo "-4 --> polygon clearance 1.0 mm"
    echo "-5 --> polygon clearance 1.5 mm"
    echo "-6 --> polygon clearance 2.0 mm"
    echo "-7 --> polygon clearance 3.0 mm"
    echo "default is 0.1 mm for mask clearance, 0.7 mm for polygon clearance"
    exit 1;
}
[ $# -lt 1 ] && help
if [ $1 = "-h" ]; then help; fi
if [ $1 = "--help" ]; then help; fi

MASK_DIST="0.1"
POLY_DIST="0.7"

while getopts ":abcd123567" Option
do
  case $Option in
    a     ) echo "mask clearance 0.05 mm"; MASK_DIST="0.05" ;;
    b     ) echo "mask clearance 0.1 mm"; MASK_DIST="0.1" ;;
    c     ) echo "mask clearance 0.2 mm"; MASK_DIST="0.2" ;;
    d     ) echo "mask clearance 0.3 mm"; MASK_DIST="0.3" ;;
    1     ) echo "polygon clearance 0.2 mm"; POLY_DIST="0.2" ;;
    2     ) echo "polygon clearance 0.5 mm"; POLY_DIST="0.5" ;;
    3     ) echo "polygon clearance 0.7 mm"; POLY_DIST="0.7" ;;
    4     ) echo "polygon clearance 1.0 mm"; POLY_DIST="1.0" ;;
    5     ) echo "polygon clearance 1.5 mm"; POLY_DIST="1.5" ;;
    6     ) echo "polygon clearance 2.0 mm"; POLY_DIST="2.0" ;;
    7     ) echo "polygon clearance 3.0 mm"; POLY_DIST="3.0" ;;
    *     ) echo "unknown option"; help; exit;                      # Default.
  esac
done
shift $(($OPTIND - 1))   # go to next argument


if [ -f $1 ] 
  then 
    INFILE=$1 
  else 
    echo "file not found: "$1
    exit 1
  fi
OUTFILE=/tmp/`basename $INFILE`"_tmp"

#######################################################

MASK_DISTANCE=$MASK_DIST           # solder stop distance mask to pin/pad in mm
CLEAR_DISTANCE=$POLY_DIST          # polygon clearance to pin/pad in mm


gawk -v filename="$OUTFILE" \
     -v mask_dist_mm="$MASK_DISTANCE" \
     -v clear_dist_mm="$CLEAR_DISTANCE" '
BEGIN { FS = "[ \\[\\]]+"   # field separator is space or tab or square bracket
        IGNORECASE = 1      # do not be case sensitive
      }
{
  mask_inc_mm = mask_dist_mm * 2.0   # The file format gives the diameter. So
  clear_inc_mm = clear_dist_mm * 2.0 # the increment must be twice the distance
  mask_inc_mil = mask_inc_mm / 0.0254
  clear_inc_mil = clear_inc_mm / 0.0254

  switch ( $1 )
   {

   ###################### pins ####################################
   case /^\t?+Pin/ : {                            # if the current line is a pin
    ++numpins                                     # increment numpins

    ## parse the fourth argument
    split($4, pinwidth, "[[:alpha:]]")
    unitpos = match($4, "[[:alpha:]]")
    unit = substr($4, unitpos, 5)

    if ( unit == "mil" ) {
       mask_inc = mask_inc_mil
       clear_inc = clear_inc_mil
       }
    else if ( unit == "mm" ){
       mask_inc = mask_inc_mm
       clear_inc = clear_inc_mm
       }
    else if ( unit == "" ){
       printf("pin width with no unit encountered: %s --> stop.\n", $4);
       print $0
       exit 1;
       }
     else {
       printf("pin width with unknown unit encountered: %s --> stop.\n", unit);
       print $0
       exit 1;
       }

    mask = pinwidth[1] + mask_inc ;
    clear = clear_inc ;
    printf("%s [%s %s %s %.2f%s %.2f%s %s %s %s %s]\n",
             $1, $2, $3, $4, clear, unit, mask, unit, $7, $8, $9, $10) > filename;
    break
    } 

   ###################### pads ####################################
   case /^\t?+Pad/ : {                            # if the current line is a pad
    ++numpads                                     # increment number of pads

    ## parse the sixth argument of the pad statement
    split($6, padwidth, "[[:alpha:]]")
    unitpos = match($6, "[[:alpha:]]")
    unit = substr($6, unitpos, 5)

    if ( unit == "mil" ) {
       mask_inc = mask_inc_mil
       clear_inc = clear_inc_mil
       }
    else if ( unit == "mm" ){
       mask_inc = mask_inc_mm
       clear_inc = clear_inc_mm
       }
    else if ( unit == "" ){
       printf("pad width with no unit encountered: %s --> stop.\n", $6);
       exit 1;
       }
    else {
       printf("pad width with unknown unit encountered: %s --> stop.\n", unit);
       print $0
       exit 1;
       }


    mask = padwidth[1] + mask_inc ;
    clear = clear_inc ;
    printf("%s[%s %s %s %s %s %.2f%s %.2f%s %s %s %s]\n",
             $1, $2, $3, $4, $5, $6, clear, unit, mask, unit, $9, $10, $11) > filename;
    break
    } # case Pad

    default:
      {
      print $0  > filename      # print the current line to tmp file
      ++neither
      }

    } # switch

} # main

END {       
  printf("number of pads found in layout: %s\n", numpads)
  printf("number of pins found in layout: %s\n", numpins)
  }
' $INFILE
AWK_EXITSTATUS=$?


################################################ save and report errors
if [ $AWK_EXITSTATUS == "0" ] 
  then {
    BACKUP_NR=0
    BACKUP_BASE=/tmp/`basename $INFILE`_backup
    while [ -f $BACKUP_BASE$BACKUP_NR ]; do let BACKUP_NR=$BACKUP_NR+1 ; done
    mv $INFILE $BACKUP_BASE$BACKUP_NR
    mv $OUTFILE $INFILE
    echo "moved the original "$INFILE" to "$BACKUP_BASE$BACKUP_NR
    echo "polygon clearance was set to "$CLEAR_DISTANCE" mm."
    echo "mask clearance was set to "$MASK_DISTANCE" mm."
    }
  fi

if [ $AWK_EXITSTATUS == "1" ] 
  then {
    echo "The awk script could not parse the unit of an item. No file was changed."
    } 
  fi

if [ $AWK_EXITSTATUS == "2" ] 
  then {
    echo "The awk script exited with errors. No file was changed."
    } 
  fi
