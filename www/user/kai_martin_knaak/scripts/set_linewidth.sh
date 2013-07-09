#!/bin/bash
# A convenience script that uses gawk to set the width of lines in the silk.
# Note: This script is resilient with regards to additional leading tabs.
# It chokes on leading spaces, though. It requires gawk, bash and basename.
###########################################################-<)kmk(>-(2011-2012)

# This program is copyright (C) 2012, Kai-Martin Knaak
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 3 as
# published by the Free Software Foundation. 
# For details see http://www.gnu.org/licenses/gpl.txt

help () {
    echo -e \\n"Usage: set_linewidth.sh [-a|-b|-c] [-1|-2|-3] foobar"
    echo "This script uses gawk to set the width of lines in silk."
    echo "Output replaces the file given by foobar."
    echo "A backup copy of the original is written to /tmp."
    echo "Line width can be chosen with options:"
    echo "-0 --> silk width 0.1 mm"
    echo "-1 --> silk width 0.15 mm"
    echo "-2 --> silk width 0.2 mm"
    echo "-3 --> silk width 0.3 mm"
    echo "-4 --> silk width 0.4 mm"
    echo "-5 --> silk width 0.5 mm"
    echo "default is 0.2 mm, which is approximately 8 mil."
    exit 1;
}
[ $# -lt 1 ] && help
if [ $1 = "-h" ]; then help; fi
if [ $1 = "--help" ]; then help; fi


WIDTH="0.2"

while getopts ":012345" Option
do
  case $Option in
    0     ) echo "silk width 0.1 mm"; WIDTH="0.1" ;;
    1     ) echo "silk width 0.15 mm"; WIDTH="0.15" ;;
    2     ) echo "silk width 0.2 mm"; WIDTH="0.2" ;;
    3     ) echo "silk width 0.3 mm"; WIDTH="0.3" ;;
    4     ) echo "silk width 0.4 mm"; WIDTH="0.4" ;;
    5     ) echo "silk width 0.5 mm"; WIDTH="0.5" ;;
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


####################################################### let gawk do its job ###

gawk -v filename="$OUTFILE" \
     -v width_mm="$WIDTH" \
'
BEGIN { FS = "[ \\[\\]]+"   # field separator is space or tab or square bracket
        IGNORECASE = 1      # do not be case sensitive
      }
{ 
  width_mil = width_mm / 0.0254

  switch ( $1 )
   {

   ###################### lines ###############################################
   ## assumed syntax: 
   ##   Line [X1 Y1 X2 Y2 Thickness Clearance SFlags]

   case /^\t?+Line/ : {                        # if the current line is a line
    ++numlines                                 # increment line count

    ## parse the sixth column
    split($6, orig_width, "[[:alpha:]]")
    unitpos = match($6, "[[:alpha:]]")
    unit = substr($6, unitpos, 5)

    if ( unit == "mil" ) {
       width = width_mil
       }
    else if ( unit == "mm" ){
       width = width_mm
       }
    else if ( unit == "" ){
       printf("linewidth with no unit encountered: %s --> stop.\n", $6);
       print $0
       exit 1;
       }
    else {
       printf("linewidth with unknown unit encountered: %s --> stop.\n", unit);
       print $0
       exit 1;
       }

    #### do not change the width if it is more than four times larger or smaller
    if ( orig_width[1] / width > 4 ) {
       printf("linewidth larger than 4 * %s %s found in line %s --> not changed.\n",
               width, unit, NR );
       width = orig_width[1];
       }
    else if ( width / orig_width[1] > 4 ) {
       printf("linewidth smaller than 0.5 * %s %s found in line %s --> not changed.\n",
               width, unit, NR );
       width = orig_width[1];
       }

    printf("%s [%s %s %s %s %.2f%s %s %s]\n",
             $1, $2, $3, $4, $5, width, unit, $7, $8, $9) > filename;
    break
    } 


   ###################### element lines #######################################
   ## assumed syntax: 
   ##    ElementLine [X1 Y1 X2 Y2 Thickness]

   case /^\t?+ElementLine/ : {         # if the current line is an element line
    ++numelementlines                  # increment line count

    ## parse the sixth column
    split($6, orig_width, "[[:alpha:]]")
    unitpos = match($6, "[[:alpha:]]")
    unit = substr($6, unitpos, 5)

    if ( unit == "mil" ) {
       width = width_mil
       }
    else if ( unit == "mm" ){
       width = width_mm
       }
    else if ( unit == "" ){
       printf("elementline width with no unit encountered: %s --> stop.\n", $6);
       print $0
       exit 1;
       }
    else {
       printf("elementline width with unknown unit encountered: %s --> stop.\n", unit);
       print $0
       exit 1;
       }

    #### do not change the width if it is more than four times larger or smaller
    if ( orig_width[1] / width > 4 ) {
       printf("elementline width larger than 4 * %s %s found in line %s --> not changed.\n",
               width, unit, NR );
       width = orig_width[1];
       }
    else if ( width / orig_width[1] > 2 ) {
       printf("elementline width smaller than 0.5 * %s %s found in line %s --> not changed.\n",
               width, unit, NR );
       width = orig_width[1];
       }

    printf("%s [%s %s %s %s %.2f%s]\n",
             $1, $2, $3, $4, $5, width, unit) > filename;
    break
    }

   ###################### arcs ########################################
   ## assumed syntax: 
   ##   Arc [X Y Width Height Thickness Clearance StartAngle DeltaAngle SFlags]

   case /^\t?+Arc/ : {                # if the current line is an arc
    ++numarcs                         # increment arc count

    ## parse the sixth column
    split($6, orig_width, "[[:alpha:]]")
    unitpos = match($6, "[[:alpha:]]")
    unit = substr($6, unitpos, 5)

    if ( unit == "mil" ) {
       width = width_mil
       }
    else if ( unit == "mm" ){
       width = width_mm
       }
    else if ( unit == "" ){
       printf("element-arc width with no unit encountered: %s --> stop.\n", $6);
       print $0
       exit 1;
       }
    else {
       printf("element-arc width with unknown unit encountered: %s --> stop.\n", unit);
       print $0
       exit 1;
       }

    #### do not change the width if it is more than four times larger or smaller
    if ( orig_width[1] / width > 4 ) {
       printf("arc linewidth larger than 4 * %s %s found in line %s --> not changed.\n",
               width, unit, NR );
       width = orig_width[1];
       }
    else if ( width / orig_width[1] > 2 ) {
       printf("arc linewidth smaller than 0.5 * %s %s found in line %s --> not changed.\n",
               width, unit, NR );
       width = orig_width[1];
       }

    printf("%s [%s %s %s %s %.2f%s %s %s %s %s]\n",
             $1, $2, $3, $4, $5, width, unit, $7, $8, $9, $10) > filename;
    break
    } 


   ###################### element arcs ########################################
   ## assumed syntax: 
   ##   ElementArc [X Y Width Height StartAngle DeltaAngle Thickness]

   case /^\t?+ElementArc/ : {         # if the current line is an element arc
    ++numelementarcs                         # increment arc count

    ## parse the eigth column
    ## syntax: ElementArc [-0.01mil 0.0000 688.97mil 688.97mil 270 90 7.87mil]
    split($8, orig_width, "[[:alpha:]]")
    unitpos = match($8, "[[:alpha:]]")
    unit = substr($8, unitpos, 5)

    if ( unit == "mil" ) {
       width = width_mil
       }
    else if ( unit == "mm" ){
       width = width_mm
       }
    else if ( unit == "" ){
       printf("element-arc width with no unit encountered: %s --> stop.\n", $6);
       print $0
       exit 1;
       }
    else {
       printf("element-arc width with unknown unit encountered: %s --> stop.\n", unit);
       print $0
       exit 1;
       }

    #### do not change the width if it is more than four times larger or smaller
    if ( orig_width[1] / width > 4 ) {
       printf("arc linewidth larger than 4 * %s %s found in line %s --> not changed.\n",
               width, unit, NR );
       width = orig_width[1];
       }
    else if ( width / orig_width[1] > 2 ) {
       printf("arc linewidth smaller than 0.5 * %s %s found in line %s --> not changed.\n",
               width, unit, NR );
       width = orig_width[1];
       }

    printf("%s [%s %s %s %s %s %s %.2f%s]\n",
             $1, $2, $3, $4, $5, $6, $7, width, unit) > filename;
    break
    } 


    default:
      {
      print $0  > filename      # print the current line to tmp file
      ++neither
      }


    } # switch

} # main

END {
  printf("number of lines found: %s\n", numlines)
  printf("number of element lines found: %s\n", numelementlines)
  printf("number of arcs found: %s\n", numarcs)
  printf("number of element arcs found: %s\n", numelementarcs)
  }
' $INFILE
AWK_EXITSTATUS=$?

################################################ save and report errors #######
if [ $AWK_EXITSTATUS == "0" ] 
  then {
    BACKUP_NR=0
    BACKUP_BASE=/tmp/`basename $INFILE`_backup
    while [ -f $BACKUP_BASE$BACKUP_NR ]; do let BACKUP_NR=$BACKUP_NR+1 ; done
    mv $INFILE $BACKUP_BASE$BACKUP_NR
    mv $OUTFILE $INFILE
    echo "moved the original "$INFILE" to "$BACKUP_BASE$BACKUP_NR
    echo "silk line thickness was set to "$WIDTH" mm."
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
