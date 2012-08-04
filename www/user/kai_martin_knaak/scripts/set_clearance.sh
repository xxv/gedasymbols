#!/bin/sh
# A convenience script that uses awk to set the mask clearance of pads
# and pins to sensible values.
# Note: This script is resilient with regards to additional leading tabs.
# It chokes on leading spaces, though.
######################################################-<)kmk(>-(2011-2012)

# This program is copyright (C) 2012, Kai-Martin Knaak
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 3 as
# published by the Free Software Foundation. 
# For details see http://www.gnu.org/licenses/gpl.txt


help () {
    echo "Usage: "$0" <--help> foobar.pcb"
    echo "This script uses awk to set polygon clearance and mask clearance of pads and pins."
    echo "Clearance values are hard set in the preamble of this script." 
    echo "Output replaces the file given by foobar.pcb"
    echo "   --help : this help message"
    exit 1;
}

[ $# -lt 1 ] && help



echo "set mask clearance of pads"

MASK_DISTANCE="0.1"               # solder stop distance mask to pin/pad in mm
CLEAR_DISTANCE="1.0"              # polygon clearance to pin/pad in mm

INFILE=$1
OUTFILE=/tmp/`basename $INFILE`"_tmp"

gawk -v filename="$OUTFILE" \
     -v mask_dist_mm="$MASK_DISTANCE" \
     -v clear_dist_mm="$CLEAR_DISTANCE" '
BEGIN { FS = "[ \\[\\]]+"   # field separator is space or tab or square bracket
        IGNORECASE = 1      # do not be case sensitive
      }
{ 
  mask_dist_mil = mask_dist_mm / 0.0254
  clear_dist_mil = clear_dist_mm / 0.0254

  switch ( $1 )
   {

   ###################### pins ####################################
   case /^\t?+Pin/ : {                              # if the current line is a pin
    ++numpins                                     # increment numpins

    ## parse the fourth argument
    split($4, pinwidth, "[[:alpha:]]")
    unitpos = match($4, "[[:alpha:]]")
    unit = substr($4, unitpos, 5)

    if ( unit == "mil" ) {
       mask_dist = mask_dist_mil
       clear_dist = clear_dist_mil
       }
    if ( unit == "mm" ){
       mask_dist = mask_dist_mm
       clear_dist = clear_dist_mm
       }
    if ( unit == "" ){
       printf("pin width with no unit encountered: %s --> stop.\n", $4);
       print $0
       exit;
       }

    mask = pinwidth[1] + mask_dist ;
    clear = clear_dist ;
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
       mask_dist = mask_dist_mil
       clear_dist = clear_dist_mil
       }
    if ( unit == "mm" ){
       mask_dist = mask_dist_mm
       clear_dist = clear_dist_mm
       }
    if ( unit == "" ){
       printf("pad width with no unit encountered: %s --> stop.\n", $4);
       exit;
       }

    mask = padwidth[1] + mask_dist ;
    clear = clear_dist ;
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

mv $INFILE /tmp/`basename $INFILE`_backup
mv $OUTFILE $INFILE
echo "moved the original "$INFILE" to /tmp/"$INFILE".backup"
echo "polygon clearance was set to "$CLEAR_DISTANCE" mm."
echo "mask clearance was set to "$MASK_DISTANCE" mm."

