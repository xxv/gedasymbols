#!/bin/bash
# layout-print for PCB -<(kmk)>- 2010-2012
# needs poster, ps2pdf, convert, psmerge and optionally
# viewers for PNG and PDF (gthumb and okular)
########################################################

if [ $# -eq 0 ]    # Script invoked with no command line args
then
  echo "A script to provide PDF and PNG prints of a PCB layout. The PDF output"
  echo "contains pages with the refdes of components and additionaly pages that"
  echo "show the values of components. Optionally, an additional bottom view"
  echo "is produced that shows mirrored top silk. This is useful for debugging" 
  echo "thru hole designs."
  echo "Photorealistic PNG output is rendered with a drop shadow for a slightly" 
  echo "three dimensional impression."
  echo ""
  echo "Usage: `basename $0` [-s][-p][-V] foobar.pcb"
  echo "-s     add a page with mirrored top silk on bottom layer"
  echo "-p     produce photo realistic output"
  echo "-V     launch viewers on produced output"
  echo "Note: There is a bug in the run of the mill version of PCB, that prevents"
  echo "execution of the DISPLAY action on the command line. The application"
  echo "exits preemptively on the assumption, that this command is only valid"
  echo "if PCB runs in GUI mode. Because of this, this print script won't work"
  echo "properly unless a patch has been applied to the source."
  echo "A patch to make PCB issue a rather than exit right away, can be"
  echo "downloaded as 'hidnogui-actionscript.patch' from http://gedasymbols.org ."
  exit
fi  
BOTTOMTHRU=0
PHOTOOUTPUT=0
STARTVIEWER=0
EPS=0
while getopts ":spV" Option
do
  case $Option in
    s     ) echo "add a page with mirrored top silk on bottom layer"; BOTTOMTHRU=1 ;;
    p     ) echo "produce photorealistic image "; PHOTOOUTPUT=1 ;;
    e     ) echo "produce EPS files for inclusion in LyX documentation" EPS=1 ;;
    V     ) echo "automatically start viewers "; STARTVIEWER=1 ;;
    *     ) echo "unknown option: \""$Option"\"" ; exit;   # Default.
  esac
done
shift $(($OPTIND - 1))   # go to next argument

#######################################################


PCBFILE=$1
NAME=`basename $PCBFILE .pcb`
OUTPDF=$NAME"_layout_"`date +%F`".pdf"
OUTPNG=$NAME"_layout_"`date +%F`".png"
OUTPNG_BOTTOM=$NAME"_layout_bottom_"`date +%F`".png"
PCB=/usr/local/bin/pcb
PDFVIEWER=/usr/bin/okular
PNGVIEWER=/usr/bin/okular
SIZE="20x30cm"
PAPERSIZE="A4"
TMPDIR=/tmp/layoutdruck

## echo pcb version
$PCB -V

mkdir $TMPDIR

## top-refdes
echo "Bestückungsdruck Nummern, Oberseite von "$OUTPUT

$PCB -x eps \
  --action-string 'DISPLAY(NameOnPCB)' \
  --element-color '#000000' \
  --pin-color '#cccccc' \
  --layer-color-1 '#cccccc' \
  --layer-color-2 '#dddddd' \
  --layer-color-3 '#eeeeee' \
  --layer-color-4 '#cccccc' \
  --layer-color-5 '#dddddd' \
  --layer-color-6 '#eeeeee' \
  --layer-color-7 '#555555' \
  --layer-color-8 '#666666' \
 --as-shown  \
  --only-visible \
  --layer-stack "outline,comment,elements,top" \
  --eps-file $TMPDIR/toprefdes.eps \
  $PCBFILE

poster -m$PAPERSIZE -p$SIZE -c12x12mm -o $TMPDIR/toprefdes.ps $TMPDIR/toprefdes.eps

## top-values
echo "Bestückungsdruck Werte, Oberseite von "$OUTPUT

$PCB -x eps \
  --action-string 'DISPLAY(Value)' \
  --element-color '#000000' \
  --pin-color '#cccccc' \
  --layer-color-1 '#cccccc' \
  --layer-color-2 '#dddddd' \
  --layer-color-3 '#eeeeee' \
  --layer-color-4 '#cccccc' \
  --layer-color-5 '#dddddd' \
  --layer-color-6 '#eeeeee' \
  --layer-color-7 '#555555' \
  --layer-color-8 '#666666' \
  --as-shown  \
  --only-visible \
  --layer-stack "outline,comment,elements,top" \
  --eps-file $TMPDIR"/topvalue.eps" \
  $PCBFILE

poster -m$PAPERSIZE -p$SIZE -c12x12mm -o $TMPDIR/topvalue.ps $TMPDIR/topvalue.eps


## bottom-refdes
echo "Bestückungsdruck Unterseite, Nummern von "$OUTPUT

$PCB -x eps \
  --action-string 'DISPLAY(NameOnPCB)' \
  --element-color '#000000' \
  --pin-color '#cccccc' \
  --layer-color-1 '#cccccc' \
  --layer-color-2 '#dddddd' \
  --layer-color-3 '#eeeeee' \
  --layer-color-4 '#cccccc' \
  --layer-color-5 '#dddddd' \
  --layer-color-6 '#eeeeee' \
  --layer-color-7 '#555555' \
  --layer-color-8 '#666666' \
  --as-shown \
  --layer-stack "outline,comment,elements,bottom,solderside" \
  --eps-file $TMPDIR"/bottomrefdes_tmp.eps" \
  $PCBFILE

## rectify broken eps syntax: make bounding box parameters integers ##
#awk -F [\ \.] '
#  {
#  if ( $1 == "%%BoundingBox:" )
#     { print $1" "$2" "$3" "$4" "$6 }
#     else { print $0 }
#  }
#' $TMPDIR"/bottomrefdes_tmp.eps" > $TMPDIR"/bottomrefdes_tmp2.eps"

## crop eps ##
epstool --bbox --copy  $TMPDIR"/bottomrefdes_tmp.eps" $TMPDIR"/bottomrefdes.eps"

## make a decently sized postscript page
poster -m$PAPERSIZE -p$SIZE -c12x12mm -o $TMPDIR"/bottomrefdes.ps" $TMPDIR"/bottomrefdes.eps"


## bottom-value
echo "Bestückungsdruck Unterseite, Werte von "$OUTPUT

$PCB -x eps \
  --action-string 'DISPLAY(Value)' \
  --element-color '#000000' \
  --pin-color '#cccccc' \
  --layer-color-1 '#cccccc' \
  --layer-color-2 '#dddddd' \
  --layer-color-3 '#eeeeee' \
  --layer-color-4 '#cccccc' \
  --layer-color-5 '#dddddd' \
  --layer-color-6 '#eeeeee' \
  --layer-color-7 '#555555' \
  --layer-color-8 '#666666' \
  --as-shown  \
  --layer-stack "outline,comment,elements,bottom,solderside" \
  --eps-file $TMPDIR"/bottomvalue_tmp.eps" \
  $PCBFILE


## rectify broken eps syntax: make bounding box parameters integers ##
#awk -F [\ \.] '
#  {
#  if ( $1 == "%%BoundingBox:" )
#     { print $1" "$2" "$3" "$4" "$6 }
#     else { print $0 }
#  }
#' $TMPDIR"/bottomvalue_tmp.eps" > $TMPDIR"/bottomvalue_tmp2.eps"

## crop eps ##
epstool --bbox --copy  $TMPDIR"/bottomvalue_tmp.eps" $TMPDIR"/bottomvalue.eps"

## make a decently sized postscript page
poster -m$PAPERSIZE -p$SIZE -c12x12mm -o $TMPDIR"/bottomvalue.ps" $TMPDIR"/bottomvalue.eps"

$PCB -x eps \
  --action-string 'DISPLAY(NameOnPCB)' \
  --element-color '#000000' \
  --pin-color '#cccccc' \
  --layer-color-1 '#cccccc' \
  --layer-color-2 '#dddddd' \
  --layer-color-3 '#eeeeee' \
  --layer-color-4 '#cccccc' \
  --layer-color-5 '#dddddd' \
  --layer-color-6 '#eeeeee' \
  --layer-color-7 '#555555' \
  --layer-color-8 '#666666' \
  --as-shown  \
  --mirror \
  --layer-stack "elements" \
  --eps-file $TMPDIR"/elements.eps" \
  $PCBFILE


###### Optionally derive a see-thru of bottom with awk and tail 
######(very dirty hack that depends on specific layer names and layer groups)
if [ $BOTTOMTHRU == "1" ]
then 
echo "Do bottomthru"
awk '$0 == "% Layer bottom group 1 drill 0 mask 0" { exit } \
	{ print }' $TMPDIR/bottomrefdes.eps > $TMPDIR/bottomthru.eps
awk 'NR <= 22 { next } $1 == "showpage" { exit } { print }' $TMPDIR/bottomrefdes.eps >> $TMPDIR/bottomthru.eps
awk 'NR <= 21 { next } $1 == "showpage" { exit } { print }' $TMPDIR/elements.eps >> $TMPDIR/bottomthru.eps
tail -n 5 $TMPDIR"/elements.eps" >> $TMPDIR"/bottomthru.eps"
poster -mA4 -p$SIZE -c12x12mm -o $TMPDIR"/bottomthru.ps" $TMPDIR"/bottomthru.eps"

fi
###########################################################################

if [ $BOTTOMTHRU == "1" ] 
then 
  PAGES=" \
   $TMPDIR/toprefdes.ps \
   $TMPDIR/bottomrefdes.ps \
   $TMPDIR/topvalue.ps \
   $TMPDIR/bottomvalue.ps\
   $TMPDIR/bottomthru.ps"
else
  PAGES=" \
   $TMPDIR/toprefdes.ps \
   $TMPDIR/bottomrefdes.ps \
   $TMPDIR/topvalue.ps \
   $TMPDIR/bottomvalue.ps"
fi

## combine to a single PDF document
psmerge -o$TMPDIR/out.ps $PAGES
 
ps2pdf $TMPDIR/out.ps $OUTPDF

## save the eps files for use in lyx documentation
if [ $EPS == "1" ]
then
  echo "Save EPS files in current working directory"
  for i in $PAGES; do 
       cp $TMPDIR/`basename $i .ps`.eps  $PWD/$NAME"_"`basename $i .ps`.eps
  done
fi

### optionally start viewer.###
if [ $STARTVIEWER == "1" ]
then
  $PDFVIEWER $OUTPDF
fi


### photorealistic output ####
if [ $PHOTOOUTPUT == "1" ]
then

echo  "Do a photo realistic view of the top side of the pcb"
pcb -x png --photo-mode \
  --dpi 600  \
  --use-alpha \
  --as-shown  \
  --only-visible \
  --outfile $TMPDIR/out.png \
  $PCBFILE

convert $TMPDIR/out.png \
  \( +clone -background black -shadow 75x20+20+20 \)  +swap \
  -background white \
  -layers merge \
  -resize 50% \
  $OUTPNG

echo "Do a photo realistic view of the bottom side of the pcb"
pcb -x png --photo-mode \
  --dpi 600  \
  --use-alpha \
  --as-shown  \
  --only-visible \
  --photo-flip-x \
  --outfile $TMPDIR/out.png \
  $PCBFILE

convert $TMPDIR/out.png \
  \( +clone -background black -shadow 75x20+20+20 \)  +swap \
  -background white \
  -layers merge \
  -resize 50% \
  $OUTPNG_BOTTOM

### optionally start viewer.###
if [ $STARTVIEWER == "1" ]
then
  $PNGVIEWER $OUTPNG $OUTPNG_BOTTOM
fi

fi # photo realistic output

exit # end of script
