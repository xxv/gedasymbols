#!/bin/bash
# layout-print for pcb -<(kmk)>- 2010
# needs poster, ps2pdf, convert, psmerge and evince 
########################################################

PCBFILE=$1
OUTPDF=`basename $PCBFILE .pcb`"_layout.pdf"
OUTPNG=`basename $PCBFILE .pcb`"_layout.png"
OUTPNG_BOTTOM=`basename $PCBFILE .pcb`"_layout_bottom.png"
PCB=/usr/local/bin/pcb
SIZE="40x20cm"

## echo pcb version
$PCB -V

## top-refdes
echo "Bestückungsdruck Nummern, Oberseite von "$OUTPUT

$PCB -x eps \
  --action-string 'DISPLAY(NameOnPCB)' \
  --element-color '#000000' \
  --pin-color '#cccccc' \
  --layer-color-1 '#ffffff' \
  --layer-color-2 '#ffffff' \
  --layer-color-3 '#ffffff' \
  --as-shown  \
  --layer-stack "outline,comment,elements,top" \
  --eps-file "/tmp/out_ref.eps" \
  $PCBFILE

poster -mA4 -p$SIZE -c12x12mm -o "/tmp/out_toprefdes.ps" "/tmp/out_ref.eps"

## top-values
echo "Bestückungsdruck Werte, Oberseite von "$OUTPUT

$PCB -x eps \
  --action-string 'DISPLAY(Value)' \
  --element-color '#000000' \
  --pin-color '#cccccc' \
  --layer-color-1 '#ffffff' \
  --layer-color-2 '#ffffff' \
  --layer-color-3 '#ffffff' \
  --as-shown  \
  --layer-stack "outline,comment,elements,top" \
  --eps-file "/tmp/out_value.eps" \
  $PCBFILE

poster -mA4 -p$SIZE -c12x12mm -o "/tmp/out_topvalue.ps" "/tmp/out_value.eps"


## bottom-refdes
echo "Bestückungsdruck Unterseite, Nummern von "$OUTPUT

$PCB -x eps \
  --action-string 'DISPLAY(NameOnPCB)' \
  --element-color '#000000' \
  --pin-color '#cccccc' \
  --layer-color-4 '#ffffff' \
  --layer-color-5 '#ffffff' \
  --layer-color-6 '#ffffff' \
  --as-shown \
  --layer-stack "outline,elements,bottom,solderside" \
  --eps-file "/tmp/out.eps" \
  $PCBFILE

poster -mA4 -p$SIZE -c12x12mm -o "/tmp/out_bottomrefdes.ps" "/tmp/out.eps"


## bottom-value
echo "Bestückungsdruck Unterseite, Werte von "$OUTPUT

$PCB -x eps \
  --action-string 'DISPLAY(Value)' \
  --element-color '#000000' \
  --pin-color '#cccccc' \
  --layer-color-4 '#ffffff' \
  --layer-color-5 '#ffffff' \
  --layer-color-6 '#ffffff' \
  --as-shown  \
  --layer-stack "outline,elements,bottom,solderside" \
  --eps-file "/tmp/out.eps" \
. $PCBFILE

poster -mA4 -p$SIZE -c12x12mm -o "/tmp/out_bottomvalue.ps" "/tmp/out.eps"

## combine to a single PDF document
psmerge -o/tmp/out.ps \
   /tmp/out_toprefdes.ps \
   /tmp/out_topvalue.ps \
   /tmp/out_bottomrefdes.ps \
   /tmp/out_bottomvalue.ps
 
ps2pdf "/tmp/out.ps" $OUTPDF

evince $OUTPDF;

# a photo realistic view of the top side of the pcb
pcb -x png --photo-mode \
  --dpi 600  \
  --use-alpha \
  --only-visible \
  --outfile /tmp/out.png \
  $PCBFILE

convert /tmp/out.png \
  \( +clone -background black -shadow 75x20+20+20 \)  +swap \
  -background white \
  -layers merge \
  -resize 50% \
  $OUTPNG

# a photo realistic view of the bottom side of the pcb
pcb -x png --photo-mode \
  --dpi 600  \
  --use-alpha \
  --only-visible \
  --photo-flip-x \
  --outfile /tmp/out.png \
  $PCBFILE

convert /tmp/out.png \
  \( +clone -background black -shadow 75x20+20+20 \)  +swap \
  -background white \
  -layers merge \
  -resize 50% \
  $OUTPNG_BOTTOM


