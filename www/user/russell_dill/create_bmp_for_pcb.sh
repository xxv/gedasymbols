#!/bin/bash
#
# create_bmp_for_pcb - Create BMPs for common PCB trace configurations.
#
#  Copyright (C) 2011 Russ Dill <Russ.Dill@asu.edu>
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
# Requires inkscape, calc (aka atcalc), pdftoppm, ppmtobmp, getopt

set -e

air_color='#ffcaca'
pos_color='#ff0000'
ref_color='#00ff00'
neg_color='#0000ff'
mask_color='#00af1f'
core_top_color='#c8c864'
core_mid_color='#d3d369'
core_bottom_color='#c8c865'

function letf()
{
	local arg="$*"
	local var_end=$(expr index "$arg" "<>-+*/^%~&|!= ")
	let "var_end -= 1"
	local var="${arg:0:$var_end}"
	local expr="${arg:$var_end}"
	[ -n "${!var}" ] || eval ${var}=0
	local result=$(calc -p "xxxvar=${!var}; xxxvar $expr; xxxvar")
	if [ -z "$result" ]; then
		echo "letf error:  xxxvar=${!var}; xxxvar $expr; xxxvar" 1>&2
		exit 1
	fi
	# Ignore approximate indicator
	[ ${result:0:1} = '~' ] && result=${result:1}
	eval ${var}=$result
}

copper_density="8.94e6"
grams_per_oz="28.3495231"
letf "m2_per_ft2 = 12^2 * 0.0254^2"
letf "m_per_oz = $grams_per_oz / $copper_density / $m2_per_ft2"

# SPICE units (trailing garbage ignored)
# Sffx	Name	Factor
# T	Tera	1e12
# G	Giga	1e9
# Meg	Mega	1e6
# K	Kilo	1e3
# mil	Mil	25.4e-6
# m	milli	1e-3
# u	micro	1e-6
# n	nano	1e-9
# p	pico	1e-12
# f	femto	1e-15

function unitize()
{
	local val="$@"
	local tail=$(echo $val | sed 's/^[\^0-9e+\.-]*//g')
	local num=$(echo $val | sed 's/\(^[\^0-9e+\.-]*\).*/\1/')
	local n
	if [ "${tail:0:2}" = oz ]; then		n="$m_per_oz"
	elif [ "${tail:0:1}" = T ]; then	n='1e12'
	elif [ "${tail:0:1}" = G ]; then	n='e9'
	elif [ "${tail:0:3}" = Meg ]; then	n='1e6'
	elif [ "${tail:0:1}" = K ]; then	n='1e3'
	elif [ "${tail:0:3}" = mil ]; then	n='25.4e-6'
	elif [ "${tail:0:1}" = m ]; then	n='1e-3'
	elif [ "${tail:0:1}" = u ]; then	n='1e-6'
	elif [ "${tail:0:1}" = n ]; then	n='1e-9'
	elif [ "${tail:0:1}" = p ]; then	n='1e-12'
	elif [ "${tail:0:1}" = f ]; then	n='1e-15'
	else					n='1'
	fi
	letf "num *= $n"
	echo $num
}

function print_usage()
{
cat << __USAGE__
Usage: $prog [OPTION]... <outfile.bmp>
Note: Input uses SPICE suffixes {T, G, Meg, K, mil, m, u, n, p, f},
      garbage after suffix is ignored. Base unit is meter.
      The unit 'oz' can also be used and indicates the thickness of one ounce
      of copper poured over one square foot.

Basic options:
  -w	Trace width						(Default: 5mil)
  -t	Trace thickness						(Default: 1oz)
  -e	Trace etchback						(Default: 0.4mil)
  -cb	Core thickness below trace				(Default: 5mil)
  -T	Copper temperature in celsius				(Default: 27)
  -svg  Write SVG instead of BMP

Coplanar traces:
  -clw	Width of coplanar trace to left				(Default: 0)
  -cls  Distance to coplanar trace on left			(Default: 8mil)
  -crw 	Width of coplanar trace to right			(Default: 0)
  -crs	Distance to coplanar trace on right			(Default: 8mil)

Differential:
  -s	Trace seperation, implies differential			(Default: 0 -- none)
  -cmw	Width of coplanar trace between signal traces		(Default: 0)

Microstrip:
  -m	Thickness of soldermask					(Default: 0.5mil)
  -mt	Thickness of soldermask above trace			(Default: 0.3mil)

Stripline:
  -ct	Core thickness above trace, implies stripline		(Default: 0)

Accuracy:
  -p	Desired pixel area of signal trace			(Default: 2000)
  -wf	Width factor = width / width of single or diff config	(Default: 12)
  -af	Air factor = Air height / width				(Default: 1/3)

__USAGE__
	exit 1
}

unset trace_w trace_h trace_sep etchback core_bottom_h temp svg
unset mask_h mask_trace_h
unset cpw1_w cpw2_w cpw3_w cpw1_sep cpw2_sep
unset core_top_h
unset desired_pixels width_factor air_factor

prog="$(basename "$0")"
_TEMP=$(getopt -a -n "$prog" -o p:w:t:s:e:T:m: \
	--long svg,wf:,af:,cb:,clw:,cmw:,crw:,cls:,crs:,mt:,ct: \
	-- "$@") || print_usage
eval set -- "$_TEMP"

while true; do
	case "$1" in
	-p)	desired_pixels="$2";	shift 2;;
	--wf)	width_factor="$2";	shift 2;;
	--af)	air_factor="$2";	shift 2;;
	-w)	trace_w="$2";		shift 2;;
	-t)	trace_h="$2";		shift 2;;
	-s)	trace_sep="$2";		shift 2;;
	-e)	etchback="$2";		shift 2;;
	--cb)	core_bottom_h="$2";	shift 2;;
	-T)	temp="$2";		shift 2;;
	--svg)	svg=1;			shift;;
	--clw)	cpw1_w="$2";		shift 2;;
	--crw)	cpw2_w="$2";		shift 2;;
	--cls)	cpw1_sep="$2";		shift 2;;
	--crs)	cpw2_sep="$2";		shift 2;;
	--cmw)	cpw3_w="$2";		shift 2;;
	-m)	mask_h="$2";		shift 2;;
	--mt)	mask_trace_h="$2";	shift 2;;
	--ct)	core_top_h="$2";	shift 2;;
	--)	shift; break;;
	esac
done

outfile="$1"
[ -n "$outfile" ] || print_usage

desired_pixels="${desired_pixels=2000}"
width_factor="${width_factor=16}"
[ -z "$air_factor" ] && letf "air_factor = 1 / 3"

trace_w="$(unitize ${trace_w=5mil})"
trace_h="$(unitize ${trace_h=1oz})"
etchback="$(unitize ${etchback=.4mil})"
cpw1_w="$(unitize ${cpw1_w=0})"
cpw2_w="$(unitize ${cpw2_w=0})"
cpw3_w="$(unitize ${cpw3_w=0})"
trace_sep="$(unitize ${trace_sep=0})"
cpw1_sep="$(unitize ${cpw1_sep=8mil})"
cpw2_sep="$(unitize ${cpw2_sep=8mil})"
mask_h="$(unitize ${mask_h=.5mil})"
mask_trace_h="$(unitize ${mask_trace_h=.3mil})"
core_top_h="$(unitize ${core_top_h=0})"
core_bottom_h="$(unitize ${core_bottom_h=5mil})"

letf "area = $trace_h * ($trace_w - $etchback)"
letf "factor = sqrt($desired_pixels / $area)"

letf "trace_sep *=	$factor"
letf "cpw1_sep *=	$factor"
letf "cpw2_sep *=	$factor"
letf "mask_h *=		$factor"
letf "mask_trace_h *=	$factor"
letf "core_top_h *=	$factor"
letf "core_bottom_h *=	$factor"
letf "trace_w *=	$factor"
letf "trace_h *=	$factor"
letf "etchback *=	$factor"
letf "cpw1_w *=		$factor"
letf "cpw2_w *=		$factor"
letf "cpw3_w *=		$factor"

letf "cpw1_present = $cpw1_w != 0"
letf "cpw2_present = $cpw2_w != 0"
letf "cpw3_present = $cpw3_w != 0"

letf "differential = $trace_sep != 0"
if [ "$differential" = 1 ]; then
	letf "width = ($trace_w * 2 + $trace_sep) * $width_factor"
	letf "a_x = ($width - $trace_sep) / 2 - $trace_w"
	letf "b_x = ($width + $trace_sep) / 2"
	letf "cpw3_x = ($width - $cpw3_w) / 2"
else
	letf "width = $trace_w * $width_factor"
	letf "a_x = ($width - $trace_w) / 2"
	letf "b_x = $a_x"
	letf "cpw3_x = 0"
	cpw3_present=0
fi

letf "stripline = $core_top_h != 0"
if [ "$stripline" = 1 ]; then
	air_top_h=0
	mask_h=0
	mask_trace_h=0
	core_mid_h="$trace_h"
else
	core_top_h=0
	core_mid_h=0
	letf "air_top_h = $width * $air_factor"
fi

letf "trace_top_w =	$trace_w - $etchback * 2"
letf "cpw1_top_w =	$cpw1_w - $etchback * 2"
letf "cpw2_top_w =	$cpw2_w - $etchback * 2"
letf "cpw3_top_w =	$cpw3_w - $etchback * 2"
letf "mask_trace_h2 =	$mask_trace_h * 2"

letf "cpw1_x =		$a_x - $cpw1_sep - $cpw1_w"
letf "cpw2_x =		$b_x + $trace_w + $cpw2_sep"

letf "mask_y =		$air_top_h +		1"
letf "core_top_y =	$mask_y +		$mask_h"
letf "core_mid_y =	$core_top_y +		$core_top_h"
letf "core_bottom_y =	$core_mid_y +		$core_mid_h"
letf "height =		$core_bottom_y +	$core_bottom_h + 1"

letf "border_width =	$width - 1"
letf "border_height =	$height - 1"

letf "px =		round($width)"
letf "py =		round($height)"

(
cat << __SVG__
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<!-- Created with Inkscape (http://www.inkscape.org/) -->

<svg
   xmlns:dc="http://purl.org/dc/elements/1.1/"
   xmlns:cc="http://creativecommons.org/ns#"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
   xmlns:svg="http://www.w3.org/2000/svg"
   xmlns="http://www.w3.org/2000/svg"
   version="1.1"
   width="$width"
   height="$height"
   id="svg2">
  <defs
     id="defs4">
    <clipPath
       clipPathUnits="userSpaceOnUse"
       id="clip">
      <rect
         id="clip_rect"
         width="$width"
         height="$height"
         x="0"
         y="0" />
    </clipPath>
  </defs>
  <metadata
     id="metadata7">
      <rdf:RDF>
        <cc:Work
           rdf:about="">
        <dc:format>image/svg+xml</dc:format>
        <dc:type
           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
        <dc:title></dc:title>
      </cc:Work>
    </rdf:RDF>
  </metadata>

  <rect
     width="$width"
     height="$mask_y"
     x="0"
     y="1"
     id="air"
     clip-path="url(#clip)"
     style="fill:$air_color;fill-opacity:1;stroke:none" />
  <rect
     width="$width"
     height="$mask_h"
     x="0"
     y="$mask_y"
     id="mask"
     style="fill:$mask_color;fill-opacity:1;stroke:none" />
  <path
     d="m $cpw1_x,$core_bottom_y $etchback,-$trace_h $cpw1_top_w,0 $etchback,$trace_h"
     id="cpw1-mask"
     clip-path="url(#clip)"
     style="opacity:1;fill:none;stroke:$mask_color;stroke-width:$mask_trace_h2;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-opacity:$cpw1_present;stroke-dasharray:none;marker-start:none" />
  <path
     d="m $a_x,$core_bottom_y $etchback,-$trace_h $trace_top_w,0 $etchback,$trace_h"
     id="a-mask"
     clip-path="url(#clip)"
     style="opacity:1;fill:none;stroke:$mask_color;stroke-width:$mask_trace_h2;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none;marker-start:none" />
  <path
     d="m $cpw2_x,$core_bottom_y $etchback,-$trace_h $cpw2_top_w,0 $etchback,$trace_h"
     id="cpw2-mask"
     clip-path="url(#clip)"
     style="opacity:1;fill:none;stroke:$mask_color;stroke-width:$mask_trace_h2;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-opacity:$cpw2_present;stroke-dasharray:none;marker-start:none" />
  <path
     d="m $b_x,$core_bottom_y $etchback,-$trace_h $trace_top_w,0 $etchback,$trace_h"
     id="b-mask"
     clip-path="url(#clip)"
     style="opacity:1;fill:none;stroke:$mask_color;stroke-width:$mask_trace_h2;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-opacity:$differential;stroke-dasharray:none;marker-start:none" />
  <path
     d="m $cpw3_x,$core_bottom_y $etchback,-$trace_h $cpw3_top_w,0 $etchback,$trace_h"
     id="cpw3-mask"
     clip-path="url(#clip)"
     style="opacity:1;fill:none;stroke:$mask_color;stroke-width:$mask_trace_h2;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-opacity:$cpw3_present;stroke-dasharray:none;marker-start:none" />
  <rect
     width="$width"
     height="$core_top_h"
     x="0"
     y="$core_top_y"
     id="core-top"
     style="fill:$core_top_color;fill-opacity:1;stroke:none" />
  <rect
     width="$width"
     height="$core_mid_h"
     x="0"
     y="$core_mid_y"
     id="core-mid"
     style="fill:$core_mid_color;fill-opacity:1;stroke:none" />
  <path
     d="m $cpw1_x,$core_bottom_y $cpw1_w,0 -$etchback,-$trace_h -$cpw1_top_w,0 z"
     id="cpw1"
     clip-path="url(#clip)"
     style="fill:$ref_color;fill-opacity:$cpw1_present;stroke:none" />
  <path
     d="m $a_x,$core_bottom_y $trace_w,0 -$etchback,-$trace_h -$trace_top_w,0 z"
     id="a"
     clip-path="url(#clip)"
     style="fill:$pos_color;fill-opacity:1;stroke:none" />
  <path
     d="m $cpw3_x,$core_bottom_y $cpw3_w,0 -$etchback,-$trace_h -$cpw3_top_w,0 z"
     id="cpw3"
     clip-path="url(#clip)"
     style="fill:$ref_color;fill-opacity:$cpw3_present;stroke:none" />
  <path
     d="m $b_x,$core_bottom_y $trace_w,0 -$etchback,-$trace_h -$trace_top_w,0 z"
     id="b"
     clip-path="url(#clip)"
     style="fill:$neg_color;fill-opacity:$differential;stroke:none" />
  <path
     d="m $cpw2_x,$core_bottom_y $cpw2_w,0 -$etchback,-$trace_h -$cpw2_top_w,0 z"
     id="cpw2"
     clip-path="url(#clip)"
     style="fill:$ref_color;fill-opacity:$cpw2_present;stroke:none" />
  <rect
     width="$width"
     height="$core_bottom_h"
     x="0"
     y="$core_bottom_y"
     id="core-bottom"
     style="fill:$core_bottom_color;fill-opacity:1;stroke:none" />
  <rect
     style="opacity:1;fill:none;fill-opacity:1;stroke:$ref_color;stroke-opacity:1;stroke-width:1"
     id="border"
     width="$border_width"
     height="$border_height"
     x=".5"
     y=".5" />
</svg>
__SVG__
) \
| if [ "$svg" = 1 ]; then cat > "$outfile"; else \
	inkscape -D -A /dev/stdout /dev/stdin 2>/dev/null | \
	# Inkscape does not allow aa to be disabled
	pdftoppm -scale-to-x $px -scale-to-y $py -aaVector no | \
	ppmtobmp -bpp=24 > "$outfile" 2>/dev/null; fi

letf "area_mm = $area * 1e6"
echo "Signal cross-section = ${area_mm} mm^2"

rho="1.723898e-8"
delta_rho="0.0039"
temp="${temp=27}"
letf "rs = $rho * (1 + ($temp - 20) * $delta_rho) / $area"
echo "Rs = ${rs} Ohm/m"

