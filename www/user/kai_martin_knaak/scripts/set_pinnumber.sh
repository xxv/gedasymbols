#!/bin/bash
# A convenience script that uses awk to set the name of all pin and pad names 
# in a layout to the value of their number. -
######################################################-<)kmk(>-(2011-2012)

# This program is copyright (C) 2012, Kai-Martin Knaak
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 3 as
# published by the Free Software Foundation. 
# For details see http://www.gnu.org/licenses/gpl.txt

help () {
    echo "Usage: "$0" foobar.pcb"
    echo "This script uses awk to set names and numbers of pins and pads in foobar.pcb."
    echo "If either name or number is not an empty string, the script sets it to the"
    echo "value of the other. A warning is issued if both attributes are empty."
    exit 1;
}

[ $# -lt 1 ] && help
if [ $1 = "-h" ]; then help; fi
if [ $1 = "--help" ]; then help; fi

if [ -f $1 ] 
  then 
    INFILE=$1 
  else 
    echo "file not found: "$1
    exit 1
  fi
OUTFILE=/tmp/`basename $INFILE`"_tmp"

##############################################################

gawk -v outfile="$OUTFILE" '
BEGIN {
  FS = "[ \\[\\]]+"   # field separator is space or tab or square bracket
  IGNORECASE = 1      # do not be case sensitive
}

{ 
 switch ( $1 ) {

   case /^\t?+Pin/ : {                            # if the current line is a pin
     if ( $8 == "\"\"" ) { $8=$9 }
     if ( $9 == "\"\"" ) { $9=$8 }
     if ( $9 == "\"\"" ) { print "pin with empty name and empty number found in line "NR }
     printf("%s[%s %s %s %s %s %s %s %s %s]\n",
             $1, $2, $3, $4, $5, $6, $7, $8, $9, $10) > outfile;
     ++numpins                 # increment numpins
     break
     }

   case /^\t?+Pad/ : {                            # if the current line is a pad
     if ( $9 == "\"\"" ) { $9=$10 }
     if ( $10 == "\"\"" ) { $10=$9 }
     if ( $10 == "\"\"" ) { print "pad with empty name and empty number found in line "NR }
     printf("%s[%s %s %s %s %s %s %s %s %s %s]\n",
             $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) > outfile;
     ++numpads               # increment numpads
     break
     }

   default : {
      print $0  > outfile      # print the current line to tmp file
      ++neither
      }

    } # switch

} # main

END {
  printf("number of pads found in layout: %s\n", numpads)
  printf("number of pins found in layout: %s\n", numpins)
  printf("number of other lines in layout: %s\n", neither)
  }
' $INFILE

BACKUP_NR=0
BACKUP_BASE=/tmp/`basename $INFILE`_backup
while [ -f $BACKUP_BASE$BACKUP_NR ]; do let BACKUP_NR=$BACKUP_NR+1 ; done
mv $INFILE $BACKUP_BASE$BACKUP_NR
mv $OUTFILE $INFILE
echo "moved the original "$INFILE" to "$BACKUP_BASE$BACKUP_NR

