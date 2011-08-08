#!/bin/sh
# layer_content.sh
# 
# is written to a separate file. Use paste_layer_content.sh to remerge.
################################################# -<)kmk(>---<(2011)


if [ $# -eq 0 ]    # If script invoked with no command-line args
then
  echo "This script uses awk to cut or paste content of a PCB layout layer."
  echo "Content is read or written from/to a separate file."
  echo "Usage: `basename $0` [cut|paste infile] n layout.pcb"
  echo "        n is the number of the layer the script should act on"
  echo " Room for improvement: Use layer names rather than layer numbers"
  exit
fi  

ACTION=$1

case $ACTION in
"paste"    ) if [ $# != 4 ]; then echo "wrong number of command line parameters."
             exit
           fi
           LAYNUM=$3
           INFILE=$2
           LAYOUT=$4
        ;;
"cut"      ) if [ $# != 3 ]; then echo "wrong number of command line parameters."
             exit
           fi
            LAYNUM=$2
            LAYOUT=$3
            OUTFILE=`basename $3 .pcb`"_layer"$LAYNUM".tracks"
        ;;
*       ) echo "first parameter must be \"cut\" or \"paste\""; exit ;;
esac



LAYNUMSTRING="Layer("$LAYNUM

# Cut all the tracks to a file ###############################################
if [ $ACTION = "cut" ]
then
awk -v outfile="$OUTFILE" \
    -v layout="$LAYOUT" \
    -v laynumstring="$LAYNUMSTRING" \
    -v laynum="$LAYNUM" \
'
{
   if ( $1 == laynumstring )   # if the line starts the layer to be worked on
   {   
     printf ("found layer %i\n", laynum)
     print $0 > "/tmp/"layout"_temp"      # append to temporary file
     getline
     print $0 > "/tmp/"layout"_temp"      # append to temporary file
     getline
     while ( $1 != ")" ) {                # while line does not start with ")"
       print $0 > "/tmp/"outfile          # append current line to *.tracks file
       getline                            # get the next line
     }
   }
   print $0 > "/tmp/"layout"_temp"        # append to temporary file
}
' $LAYOUT

mv $LAYOUT $LAYOUT"_backup"
mv /tmp/$LAYOUT"_temp" $LAYOUT
mv /tmp/$OUTFILE .
echo "Removed tracks in layer "$LAYNUM "from "$LAYOUT
echo "and saved the original file to "$LAYOUT"_backup."
echo "Tracks of layer "$LAYNUM" are in "$OUTFILE"."

fi
#######################################################


# Paste the contents of a *.tracks file to layer given by $LAYNUM ############
if [ $ACTION = "paste" ]
then                          # Split $LAYOUT at the start of destination layer
awk -v layout="$LAYOUT" \
    -v laynumstring="$LAYNUMSTRING" \
    -v laynum="$LAYNUM" \
    -v found=0 \
'
{
   if ( $1 == laynumstring )   # look for the begin of the destination layer
   {   
     printf ("found layer %i\n", laynum)#
     found = 1
     print $0 > "/tmp/"layout"_temp1"     # append layer line to temp1 file
     getline
     print $0 > "/tmp/"layout"_temp1"     # append "(" line to temp1 file
     getline
   }
   if ( found == 0 ) {
      print $0 > "/tmp/"layout"_temp1"   # append current line to temp1 file
   } else {
      print $0 > "/tmp/"layout"_temp2"   # append current line to temp1 file
   }
}
' $LAYOUT

# Merge the files 
cat "/tmp/"$LAYOUT"_temp1" $INFILE "/tmp/"$LAYOUT"_temp2" >/tmp/$LAYOUT"_temp3"

mv $LAYOUT $Layout"_backup"
cp /tmp/$LAYOUT"_temp3" $LAYOUT
echo "Merged "$INFILE" in "$LAYOUT". Saved original file in "$Layout"_backup."

fi
#######################################################
