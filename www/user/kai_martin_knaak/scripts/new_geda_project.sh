#!/bin/sh
# Ein kleines Script, das ein geda-Projekt nach dem Geschmack von
# ---<(kaimartin)>--- anlegt.

NAME=$1

mkdir $NAME
cd $NAME
mkdir gerber
mkdir halde
mkdir gehaeuse
mkdir print
mkdir bom
cp $HOME/geda/layoutdruck.sh print/layoutdruck_$NAME.sh
cp $HOME/geda/doku-template.lyx $NAME.lyx
touch meckerliste

echo > attribs \
"footprint
value
description"

echo \
"; Kai-Martins configuration of gEDA and friends
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(reset-component-library)   ; don't use system symbols
(reset-source-library)     ; don't use system schematics

; Allow to source symbols from the current working directory
(define current-working-directory (getenv \"PWD\"))
(component-library current-working-directory)
(source-library  current-working-directory)

; Footprints in sync with local copy of gedasymbols
; (source-library \"/home/kmk/geda/gedasymbols/www/user/kai_martin_knaak/footprints\")

; Allow to source symbols from the local copy of geda-symbols
(define gedasymbols \"/home/kmk/geda/gedasymbols/www/user/kai_martin_knaak/symbols\")
(component-library (build-path gedasymbols \"titleblock\"))
(component-library (build-path gedasymbols \"power\"))
(component-library (build-path gedasymbols \"misc\"))
(component-library (build-path gedasymbols \"digital\"))
(component-library (build-path gedasymbols \"connector\"))
(component-library (build-path gedasymbols \"block\"))
(component-library (build-path gedasymbols \"analog/diode\"))
(component-library (build-path gedasymbols \"analog\"))
" > gafrc

echo "Ende des geda-anlege-Scripts"
