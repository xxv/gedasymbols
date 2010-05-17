#!/bin/bash
# Ein einfaches Script, das ein geda-Projekt nach dem Geschmack von
# ---<(kaimartin)>--- anlegt. 

if [ $# = 0 ]; then
	echo "usage: new_geda_project.sh NAME"
	echo "Creates a geda/pcb project directory from scratch"
	exit;
fi;

NAME=$1
AUTHORSHORT="-<(kmk)>-"
AUTHOR="Kai-Martin Knaak"
FOOTPRINTLIB="/home/kmk/geda/footprints"
PFAD="/afs/iqo.uni-hannover.de/products/gedasymbols/www/user/kai_martin_knaak"

mkdir $NAME
cd $NAME
mkdir gerber
mkdir halde
mkdir gehaeuse
mkdir print
mkdir bom
cp $PFAD/layoutdruck.sh print/layoutdruck_$NAME.sh
cp $PFAD/bomdruck.sh print/bomdruck_$NAME.sh

# The project file for gsch2pcb
# Use only local footprints, no m4, no global defaults.
echo \
"schematics "$NAME".sch
output-name "$NAME"
skip-m4
verbose
elements-dir "$FOOTPRINTLIB"
use-files
" > $NAME.g2p

# The attributes to be used for the bill of materials
echo \
"footprint
value
description
" > print/attribs

# Add a local gafrc
echo \
"; Kai-Martins project config for gEDA and friends
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(reset-component-library)   ; don't use system symbols
(reset-source-library)     ; don't use system schematics

; Allow to source symbols from the current working directory
(define current-working-directory (getenv \"PWD\"))
(component-library current-working-directory)
(source-library  current-working-directory)

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

# Create a schematic with a title block filled with name an date.
echo \
"v 20090328 2
C 40000 40000 0 0 0 title-block.sym
{
T 52300 41300 5 30 1 1 0 4 1
Title="$NAME"
T 51400 40300 5 16 1 1 0 4 1
filename="$NAME".sch
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
}
" > $NAME.sch

# Create an empty layout
echo \
"ChangeName(Layout) "\
"SaveTo(LayoutAs,"$NAME".pcb) "\
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

# Create documentation file in lyx format
###############begin LyX template###################################
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
" > $NAME.lyx
#######################End LyX template################


echo "Done with project "$NAME
