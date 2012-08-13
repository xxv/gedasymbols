#!/bin/sh
# set_linewidth.sh
# This script manipulates the width of all selected lines in a PCB format.
# It needs gawk rather than plain awk becauses it uses the handy switch statement.
# 
################################################# -<)kmk(>---<(2011)


if [ $# != 2 ]    # If script was invoked without the correct number of args
then
  echo "\nThis script sets the width of all selected lines in a PCB style file."
  echo "Usage: `basename $0` MODE layout-file"
  echo "MODE can be:"
  echo "   *10  -->  multiply line width by 10"
  echo "   /10  -->  divide line width by 10"
  exit
fi  

###############################################################################

LAYOUT=$2
OUTFILE=/tmp/$2"_set_linewidth"
MODE=$1

gawk -v outfile="$OUTFILE" \
     -v layout="$LAYOUT" \
     -v mode="$MODE" \
'
{
   if ( $7 ~ /selected/ )               # if an object is marked selected
   {
     if ( $1 ~ /Line/ )                 # if the current line is a Line line
     {
       num++
       switch ( mode ) {
         case "/10":   { $5=$5/10 ; break }          # divide width by ten
         case "*10":   { $5=$5*10 ; break }          # multiply width by ten
         default: print mode " is not a supported mode ..." >"/dev/stderr";
         }
       $1="\t"$1                        # restore tab in first column
     }
   }
   print $0 > outfile                   # append current line to temporary file
}
END {       
  printf("number of manipulated lines: %s\n", num)
  }

' $LAYOUT

mv $LAYOUT $LAYOUT"_backup"
mv $OUTFILE $LAYOUT
echo "saved the original file to "$LAYOUT"_backup."

