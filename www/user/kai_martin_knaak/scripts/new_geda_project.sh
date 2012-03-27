#!/bin/bash
# Ein einfaches Script, das ein geda-Projekt nach dem Geschmack von
# ---<(kaimartin)>--- anlegt. 

# This program is copyright (C) 2009-2012, Kai-Martin Knaak
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 3 as
# published by the Free Software Foundation. 
# For details see http://www.gnu.org/licenses/gpl.txt


help () {
    echo "Usage: "$0" <--skel |--git | --help> NAME"
    echo "A simple script to start a new geda project from scratch."
    echo "   --git  : set up a git repository in /var/cache/git. Requires sudo privilege."
    echo "   --skel : install the basic structure of a geda project in the current dir."
    echo "   --help : this help message"
    exit 1;
}

[ $# -lt 2 ] && help

action=$1
shift 1

SELF=$0
NAME=$1
# A low case only version of the name -- better for dokuwiki integration
name=`echo $NAME | tr [:upper:] [:lower:]`
USER=`whoami`
AUTHOR=`finger $USER | awk 'BEGIN {FS = ": "} ; $0 ~ /Name/ {print $3}'`
AUTHORSHORT=$USER
FOOTPRINTLIB="~/geda/gedasymbols/kai_martin_knaak/footprints:$PWD"
DATE=`date +%d.%m.%Y`

# Absolute path of the Script.
# Note, this requires GNU readlink and might not work for Mac and BSD users 
PFAD=`dirname $(readlink -f $0)`
#PFAD="/afs/iqo.uni-hannover.de/products/gedasymbols/www/user/kai_martin_knaak"

################################################################################
skel () {

mkdir $NAME
cd $NAME
mkdir doc
mkdir gerber
mkdir halde
mkdir gehaeuse
mkdir print
mkdir bom
cp $PFAD/layoutdruck.sh print/layoutdruck_$name.sh
cp $PFAD/bomdruck.sh bom/bomdruck_$name.sh

# The project file for gsch2pcb
# Use only local footprints, no m4, no global defaults.
echo \
"schematics "$name".sch
output-name "$name"
skip-m4
verbose
elements-dir "$FOOTPRINTLIB"
use-files
" > $name.g2p

# The attributes to be used for the bill of materials
echo \
"footprint
value
description
" > bom/attribs

# Add a local gafrc
echo \
"; local gafrc
; automatically installed by \"$SELF\" on \"$DATE\"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(reset-component-library)   ; don't use system symbols
(reset-source-library)     ; don't use system schematics

; Allow to source symbols from the current working directory
(define current-working-directory \".\")
(component-library current-working-directory)
(source-library current-working-directory)

; Allow to source symbols from the local copy of Kai-Martin's gedasymbols
(define gedasymbols \"\${HOME}/geda/gedasymbols/www/user/kai_martin_knaak/symbols\")
(component-library (build-path gedasymbols \"titleblock\"))
(component-library (build-path gedasymbols \"templates\"))
(component-library (build-path gedasymbols \"power\"))
(component-library (build-path gedasymbols \"misc\"))
(component-library (build-path gedasymbols \"digital\"))
(component-library (build-path gedasymbols \"connector\"))
(component-library (build-path gedasymbols \"block\"))
(component-library (build-path gedasymbols \"analog/diode\"))
(component-library (build-path gedasymbols \"analog\"))
(component-library (build-path gedasymbols \"obsolete\"))
" > gafrc


# Add a local gnetlistrc. Hierarchy is enabled by default
echo \
"
; local gnetlistrc
; automatically installed by \"$SELF\" on \"$DATE\"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(hierarchy-traversal \"enabled\")

(hierarchy-uref-mangle \"enabled\")
(hierarchy-uref-separator \"\")

(hierarchy-netname-mangle \"enabled\")
(hierarchy-netname-separator \"/\")

(hierarchy-netattrib-mangle \"enabled\")
(hierarchy-netattrib-separator \"/\")

(unnamed-netname \"noname\")
" > gnetlistrc


# Add a local gschemrc
echo \
";  This is a local 
; gschemrc automatically installed on "$DATE" for project "$name".
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load (build-path (getenv \"PWD\") \"gschem-colors\"))    ; localized colors 
 
(text-size 10)						; Default text size
(undo-levels 50)

; Autonumber components on insert.
(load-from-path \"auto-uref.scm\")
(define auto-uref-set-page-offset 100)
(add-hook! add-component-hook auto-uref)
(add-hook! copy-component-hook auto-uref)


; default titleblock for new schematics
(define default-titleblock \"title-block.sym\")
" > gschemrc


# add localized color file to be loaded by gschemrc
echo \
"
; This is a color map for project \"$name\"
; automatically installed by \"$SELF\" on \"$DATE\"

; Colors may be specified in \"#RRGGBB\" or \"#RRGGBBAA\" format. If the alpha
; value is not specified, full opacity is assumed.
; If a color is #f, then objects of that color will never be drawn.

(display-color-map
 '((background         \"#ffffff\")
   (pin                \"#000000\")
   (net-endpoint       \"#ff0000\")
   (graphic            \"#008b00\")
   (net                \"#0000ee\")
   (attribute          \"#000000\")
   (logic-bubble       \"#008b8b\")
   (dots-grid          \"#7f7f7f\")
   (mesh-grid-major    \"#d8d8d8\")
   (mesh-grid-minor    \"#eaeaea\")
   (detached-attribute \"#ff0000\")
   (text               \"#008b00\")
   (bus                \"#00ee00\")
   (select             \"#b22222\")
   (bounding-box       \"#ffa500\")
   (stroke             \"#a020f0\")
   (zoom-box           \"#008b8b\")
   (lock               \"#666666\")
   (output-background  #f)
   (junction           \"#a020f0\")
   (freestyle1         #f)
   (freestyle2         #f)
   (freestyle3         #f)
   (freestyle4         #f)
   ))

(display-outline-color-map
 '((background         #f)
   (pin                \"#4d4d4d\")
   (net-endpoint       \"#cdcdcd\")
   (graphic            \"#008b00\")
   (net                \"#0000cd\")
   (attribute          \"#4d4d4d\")
   (logic-bubble       \"#008b8b\")
   (dots-grid          #f)
   (mesh-grid-major    #f)
   (mesh-grid-minor    #f)
   (detached-attribute \"#cd0000\")
   (text               \"#008b00\")
   (bus                \"#00cd00\")
   (select             \"#b22222\")
   (bounding-box       \"#ffa500\")
   (zoom-box           \"#008b8b\")
   (stroke             \"#a020f0\")
   (lock               \"#a9a9a9\")
   (output-background  #f)
   (junction           \"#7e26cd\")
   (freestyle1         #f)
   (freestyle2         #f)
   (freestyle3         #f)
   (freestyle4         #f)
   ))
" > gschem-colors


echo "Create a schematic with a title block filled with name and current date."
echo \
"v 20090328 2
C 40000 40000 0 0 0 title-block.sym
{
T 52300 41300 5 30 1 1 0 4 1
Title="$NAME"
T 51400 40300 5 16 1 1 0 4 1
filename="$name".sch
T 55850 41500 5 16 1 1 0 4 1
revision=0.1
T 56050 40100 5 16 1 1 0 6 1
page=1
T 56200 40100 5 16 1 1 0 0 1
number_of_pages=1
T 55850 40850 5 12 1 1 0 4 1
date="`date +%d.%m.%y`"
T 54450 40450 5 16 1 1 0 4 1
author="$AUTHORSHORT"
}" > $name.sch

echo "Create an empty layout"
echo \
"ChangeName(Layout) "\
"SaveTo(LayoutAs,"$name".pcb) "\
"Quit() "\
| pcb --listen \
 --fab-author \"$AUTHOR\" \
 --groups "1,2,3,c:4,5,5,s:7:8" \
 --layer-name-1 "top" \
 --layer-name-2 "top-polyg." \
 --layer-name-3 "top-GND" \
 --layer-name-4 "bottom" \
 --layer-name-5 "bott.-poly." \
 --layer-name-6 "bott.-GND" \
 --layer-name-7 "comment" \
 --layer-name-8 "outline" \
 --bloat 600 \
 --shrink 1000 \
 --min-width 600 \
 --min-silk 600 \
 --min-drill 1500 \
 --min-ring 1000 \
 --route-styles \
"Signal,1000,3600,2000,1000\
:Power,2500,6000,3500,1000\
:Fat,4000,6000,3500,1000\
:Skinny,600,2402,1181,600" \
 --default-PCB-width 600000 \
 --default-PCB-height 600000 \
 --grid-increment-mm 1.000000 \
 --grid-increment-mil 20.000000 \
 --size-increment-mm 0.200000 \
 --size-increment-mil 10.000000 \
 --line-increment-mm 0.100000 \
 --line-increment-mil 8.000000 \
 --clear-increment-mm 0.500000 \
 --clear-increment-mil 2.000000

###############begin LyX template###################################
echo "Create documentation file in lyx format"
echo \
"
#LyX 1.6.2 created this file. For more info see http://www.lyx.org/
\lyxformat 345
\begin_document
\begin_header
\textclass scrartcl
\use_default_options true
\language ngerman
\inputencoding auto
\font_roman default
\font_sans default
\font_typewriter default
\font_default_family default
\font_sc false
\font_osf false
\font_sf_scale 100
\font_tt_scale 100

\graphics default
\paperfontsize default
\spacing single
\use_hyperref true
\pdf_title \""$NAME"\"
\pdf_author \""$AUTHOR"\"
\pdf_subject \""$NAME"\"
\pdf_keywords \"geda\"
\pdf_bookmarks true
\pdf_bookmarksnumbered false
\pdf_bookmarksopen false
\pdf_bookmarksopenlevel 1
\pdf_breaklinks false
\pdf_pdfborder false
\pdf_colorlinks true
\pdf_backref section
\pdf_pdfusetitle true
\pdf_pagemode FullScreen
\papersize a4paper
\use_geometry false
\use_amsmath 1
\use_esint 1
\cite_engine natbib_numerical
\use_bibtopic false
\paperorientation portrait
\secnumdepth -1
\tocdepth 2
\paragraph_separation skip
\defskip medskip
\quotes_language english
\papercolumns 1
\papersides 1
\paperpagestyle default
\tracking_changes false
\output_changes false
\author ""
\author ""
\end_header

\begin_body

\begin_layout Title
"$NAME"
\end_layout

\begin_layout Author
"$AUTHOR"
\end_layout

\begin_layout Abstract
Ein tolles, Projekt, das die Welt retten wird.
\end_layout

\begin_layout Section
Ziel
\end_layout

\begin_layout Standard
Zielgerichtete Zielbeschreibung
\end_layout

\begin_layout Section
Schaltungsprinzip
\end_layout

\begin_layout Standard
Wie wirds elektrisch errreicht?
\end_layout

\begin_layout Section
Bauteile
\end_layout

\begin_layout Subsection
Besondere Komponenten
\end_layout

\begin_layout Standard
Mit ganz besonderen Eigenschaften.
\end_layout

\begin_layout Section
Versorgung
\end_layout

\begin_layout Standard
Wo der Saft herkommt
\end_layout

\begin_layout Section
Anschlüsse und Bedienelemente
\end_layout

\begin_layout Section
Gehäuse
\end_layout

\begin_layout Section
Eigenschaften
\end_layout

\begin_layout Standard
Wie gut es tut, was es tut.
\end_layout

\begin_layout Section
Bedienung
\end_layout

\begin_layout Section
Bilder
\end_layout

\begin_layout Section
Schaltplan
\end_layout

\begin_layout Section
Bestückungsplan
\end_layout

\begin_layout Section
Materialpreis
\end_layout

\begin_layout Section
Meckerliste
\end_layout

\end_body
\end_document
" > doc/$name.lyx
#######################End LyX template################

} # end of skel sub routine
################################################################################


#initialize a git repository####################################################
init_git () {
if [ -d "$NAME" ]; then cd $NAME ; fi

if [ ! -d ../$NAME ]
     then echo "No project "$NAME" found! --> quitting."
     exit 1
   fi

if [ -d ".git" ]; then echo "git repo already exists! --> quitting" ; fi

echo "initialize a git repository"$NAME" in "$PWD
echo "and a bare clone in /var/cache/git/"$NAME"."

# .gitignore: the file patterns, git should ignore
echo \
"
# To be ignored by git:
*~
*-
PCB.*.save
PCB.*.backup
*.bak
*.bak?
*.new.pcb
*.cmd
\#*#
" > .gitignore

git init
git add .
git commit -m 'geda project $NAME initialized'
git config color.ui true
git 

sudo git clone --bare . /var/cache/git/$NAME.git
sudo touch /var/cache/git/$NAME.git/git-daemon-export-ok
sudo chown www-data:iqo /var/cache/git/$NAME".git" -R
sudo chmod g+w /var/cache/git/$NAME".git" -R
sudo echo "geda project "$NAME > /var/cache/git/$NAME".git"/description
sudo chmod g-w /var/cache/git/$NAME".git"/description

} #end git related stuff########################################################

#main###########################################################################
case $action in
    --skel)
	skel
	;;
    --git)
	init_git
	;;
    *)
	help
	;;
esac

echo "Done with project "$NAME
