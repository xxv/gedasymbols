#!/bin/bash
# Layout-Ausdruck für pcb -<(kmk)>- 2009/2010
# braucht die utilities poster, ps2pdf und evince 
########################################################

PCBFILE=$1
OUTPDF=`basename $PCBFILE .pcb`"_layout.pdf"
OUTPNG=`basename $PCBFILE .pcb`"_layout.png"

## top-refdes
echo "Bestückungsdruck "$OUTPUT

pcb -x eps \
  --action-string 'DISPLAY(NameOnPCB)' \
  --element-color '#000000' \
  --pin-color '#cccccc' \
  --layer-color-1 '#ffffff' \
  --layer-color-2 '#ffffff' \
  --layer-color-3 '#ffffff' \
  --as-shown  \
  --layer-stack "comment,elements,top,solder,component" \
  --eps-file "/tmp/out.eps" \
  $PCBFILE

poster -mA4 -p25x5cm -c12x12mm -o "/tmp/out_toprefdes.ps" "/tmp/out.eps"

## top-values
echo "Bestückungsdruck "$OUTPUT

pcb -x eps \
  --action-string 'DISPLAY(Value)' \
  --element-color '#000000' \
  --pin-color '#cccccc' \
  --as-shown  \
  --layer-stack "1" \
  --eps-file "/tmp/out1.eps" \
  $PCBFILE

## top-values
echo "Bestückungsdruck "$OUTPUT

pcb -x eps \
  --action-string 'DISPLAY(Value)' \
  --element-color '#000000' \
  --pin-color '#cccccc' \
  --as-shown  \
  --layer-stack "3" \
  --eps-file "/tmp/out2.eps" \
  $PCBFILE

## top-values
echo "Bestückungsdruck "$OUTPUT

pcb -x eps \
  --action-string 'DISPLAY(Value)' \
  --element-color '#000000' \
  --pin-color '#cccccc' \
  --as-shown  \
  --layer-stack "3" \
  --eps-file "/tmp/out3.eps" \
  $PCBFILE
## top-values
echo "Bestückungsdruck "$OUTPUT

pcb -x eps \
  --action-string 'DISPLAY(Value)' \
  --element-color '#000000' \
  --pin-color '#cccccc' \
  --as-shown  \
  --layer-stack "4" \
  --eps-file "/tmp/out4.eps" \
  $PCBFILE
## top-values
echo "Bestückungsdruck "$OUTPUT

pcb -x eps \
  --action-string 'DISPLAY(Value)' \
  --element-color '#000000' \
  --pin-color '#cccccc' \
  --as-shown  \
  --layer-stack "5" \
  --eps-file "/tmp/out5.eps" \
  $PCBFILE
## top-values
echo "Bestückungsdruck "$OUTPUT

pcb -x eps \
  --action-string 'DISPLAY(Value)' \
  --element-color '#000000' \
  --pin-color '#cccccc' \
  --as-shown  \
  --layer-stack "6" \
  --eps-file "/tmp/out6.eps" \
  $PCBFILE

pcb -x eps \
  --action-string 'DISPLAY(Value)' \
  --element-color '#000000' \
  --pin-color '#cccccc' \
  --as-shown  \
  --layer-stack "7" \
  --eps-file "/tmp/out7.eps" \
  $PCBFILE

pcb -x eps \
  --action-string 'DISPLAY(Value)' \
  --element-color '#000000' \
  --pin-color '#cccccc' \
  --as-shown  \
  --layer-stack "8" \
  --eps-file "/tmp/out8.eps" \
  $PCBFILE

pcb -x eps \
  --action-string 'DISPLAY(Value)' \
  --element-color '#000000' \
  --pin-color '#cccccc' \
  --as-shown  \
  --layer-stack "9" \
  --eps-file "/tmp/out9.eps" \
  $PCBFILE

pcb -x eps \
  --action-string 'DISPLAY(Value)' \
  --element-color '#000000' \
  --pin-color '#cccccc' \
  --as-shown  \
  --layer-stack "9" \
  --eps-file "/tmp/out9.eps" \
  $PCBFILE

pcb -x eps \
  --action-string 'DISPLAY(Value)' \
  --element-color '#000000' \
  --pin-color '#cccccc' \
  --as-shown  \
  --layer-stack "elements" \
  --eps-file "/tmp/out_elements.eps" \
  $PCBFILE

pcb -x eps \
  --action-string 'DISPLAY(Value)' \
  --element-color '#000000' \
  --pin-color '#cccccc' \
  --as-shown  \
  --layer-stack "top" \
  --eps-file "/tmp/out_top.eps" \
  $PCBFILE

pcb -x eps \
  --action-string 'DISPLAY(Value)' \
  --element-color '#000000' \
  --pin-color '#cccccc' \
  --as-shown  \
  --layer-stack "0" \
  --eps-file "/tmp/out_null.eps" \
  $PCBFILE


poster -mA4 -p25x5cm -c12x12mm -o "/tmp/out_topvalue.ps" "/tmp/out.eps"

## bottom-refdes
#echo "Bestückungsdruck "$OUTPUT
#
#pcb -x eps \
#  --action-string 'DISPLAY(NameOnPCB)' \
#  --element-color '#000000' \
#  --pin-color '#cccccc' \
#  --layer-color-4 '#ffffff' \
#  --layer-color-5 '#ffffff' \
#  --layer-color-6 '#ffffff' \
#  --as-shown  \
#  --layer-stack outline,elements \
#  --eps-file "/tmp/out.eps" \
#  $1
#
#poster -mA4 -p25x5cm -c12x12mm -o "/tmp/out_bottomrefdes.ps" "/tmp/out.eps"


## bottom-value
#echo "Bestückungsdruck "$OUTPUT

#pcb -x eps \
#  --action-string 'DISPLAY(Value)' \
#  --action-string 'SwapSides()' \
#  --element-color '#000000' \
#  --pin-color '#cccccc' \
#  --layer-color-4 '#ffffff' \
#  --layer-color-5 '#ffffff' \
# --layer-color-6 '#ffffff' \
# --as-shown  \
# --layer-stack outline,elements,bottom \
## --eps-file "/tmp/out.eps" \
# $PCBFILE

#poster -mA4 -p25x5cm -c12x12mm -o "/tmp/out_bottomvalue.ps" "/tmp/out.eps"

## Combine to a single document
psmerge -o/tmp/out.ps \
   /tmp/out_toprefdes.ps \
   /tmp/out_topvalue.ps \
#   /tmp/out_bottomrefdes.ps \
#   /tmp/out_bottomvalue.ps
 
ps2pdf "/tmp/out.ps" $OUTPDF

evince $OUTPDF;

# Ein photorealistisches Bild der Leiterplatte
pcb -x png --photo-mode --dpi 600  --use-alpha --only-visible --outfile /tmp/out.png $PCBFILE
convert /tmp/out.png \( +clone -background black -shadow 75x20+20+20 \)  +swap  -background white -layers merge -resize 50% $OUTPNG


