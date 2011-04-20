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

source "$(dirname "$(realpath "$0")")/math.inc"

# Colors for different Er values
air_color='ffcaca'
pos_color='ff0000'
ref_color='00ff00'
neg_color='0000ff'
mask_color='00af1f'
core_top_color='c8c864'
core_mid_color='d3d369'
core_bottom_color='c8c865'
resin_color='f0f0a0'

# Defaults
trace_w="5mil"
trace_h="1oz"
etchback="0.4mil"
core_bottom_h="5mil"
temp="27"
erb="4.3"
svg="0"
cpwl_w="0"
cpwl_sep="8mil"
cpwr_w="0"
cpwr_sep="8mil"
trace_sep="0"
cpwm_w="0"
mask_h="0.5mil"
erm="3.3"
core_top_h="0"
resin_sep="0"
err="3.6"
round_to="w"
desired_pixels="2000"
width_factor="16"
air_factor="1/3"

# Variables that need to be scaled
scale_vars="trace_w \
	trace_h \
	etchback \
	core_bottom_h \
	cpwl_w \
	cpwl_sep \
	cpwr_w \
	cpwr_sep \
	trace_sep \
	cpwm_w \
	mask_h \
	mask_trace_h \
	core_top_h \
	resin_sep"

# Symbolic names for those variables
trace_w_n="w"
trace_h_n="t"
etchback_n="e"
core_bottom_h_n="cb"
cpwl_w_n="clw"
cpwl_sep_n="cls"
cpwr_w_n="crw"
cpwr_sep_n="crs"
trace_sep_n="s"
cpwm_w_n="cmw"
mask_h_n="m"
mask_trace_h_n="mt"
core_top_n="ct"
resin_sep_n="rs"

function print_usage()
{
cat << __USAGE__
Usage: $prog [OPTION]... <outfile.bmp>
Note: Input uses SPICE suffixes {T, G, Meg, K, mil, m, u, n, p, f},
      garbage after suffix is ignored. Base unit is meter.
      The unit 'oz' can also be used and indicates the thickness of one ounce
      of copper poured over one square foot.

Basic options:
  -w	Trace width						(Def: $trace_w)
  -t	Trace thickness						(Def: $trace_h)
  -e	Trace etchback						(Def: $etchback)
  -cb	Core/prepreg thickness below trace			(Def: $core_bottom_h)
  -T	Copper temperature in celsius				(Def: $temp)
  -erb	Core/prepreg Er below trace				(Def: $erb)
  -svg  Write SVG instead of BMP

Coplanar traces:
  -clw	Width of coplanar trace to left				(Def: $cpwl_w)
  -cls  Distance to coplanar trace on left			(Def: $cpwl_sep)
  -crw 	Width of coplanar trace to right			(Def: $cpwr_w)
  -crs	Distance to coplanar trace on right			(Def: $cpwr_sep)

Differential:
  -s	Trace seperation, implies differential			(Def: $trace_sep - none)
  -cmw	Width of coplanar trace between signal traces		(Def: $cpwm_w - none)

Microstrip:
  -m	Thickness of soldermask					(Def: $mask_h)
  -mt	Thickness of soldermask above trace			(Def: <m>)
  -erm	Solder mask Er						(Def: $erm)

Stripline:
  -ct	Core/prepreg thickness above trace, implies stripline	(Def: $core_top_h)
  -ert  Core/prepreg Er above trace				(Def: <erb>)
  -erp  Prepreg Er (squished between traces)			(Def: <erb>)
  -err	Resin Er						(Def: $err)
  -rs	Seperation below which only resin enters		(Def: $resin_sep)

Accuracy:
  -x    Parameter to make exact (w|t|s|cb|ct|<unit>)		(Def: $round_to)
  -p	Desired pixel area of signal trace			(Def: $desired_pixels)
  -wf	Width factor = width / width of single or diff config	(Def: $width_factor)
  -af	Air factor = Air height / width				(Def: ${air_factor})

__USAGE__
	exit 1
}

unset ert erp mask_trace_h

prog="$(basename "$0")"
_TEMP=$(getopt -a -n "$prog" -o p:w:t:s:e:T:m: \
	--long svg,wf:,af:,cb:,clw:,cmw:,crw:,cls:,crs:,mt:,ct:,ert:,erm:,erb:,erp:,err:,rs:,x: \
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
	--clw)	cpwl_w="$2";		shift 2;;
	--crw)	cpwr_w="$2";		shift 2;;
	--cls)	cpwl_sep="$2";		shift 2;;
	--crs)	cpwr_sep="$2";		shift 2;;
	--cmw)	cpwm_w="$2";		shift 2;;
	--ert)	ert="$2";		shift 2;;
	--erm)	erm="$2";		shift 2;;
	--erb)	erb="$2";		shift 2;;
	--erp)	erp="$2";		shift 2;;
	--err)	err="$2";		shift 2;;
	-m)	mask_h="$2";		shift 2;;
	--mt)	mask_trace_h="$2";	shift 2;;
	--ct)	core_top_h="$2";	shift 2;;
	--rs)	resin_sep="$2";		shift 2;;
	--x)	round_to="$2";		shift 2;;
	--)	shift; break;;
	esac
done

outfile="$1"
[ -n "$outfile" ] || print_usage

mask_trace_h="${mask_trace_h=${mask_h}}"
ert="${ert=$erb}"
erp="${erp=$erb}"

for var in $scale_vars; do
	eval "$var=$(unitize ${!var})"
done

# Find factor required to make the trace area in pixels a desired value
letf "area = $trace_h * ($trace_w - $etchback)"
letf "factor = sqrt($desired_pixels / $area)"

# Bump factor up so that one paticular parameter is exact
case "$round_to" in
"w") v="$trace_w";;
"t") v="$trace_h";;
"s") v="$trace_sep";;
"cb") v="$core_bottom_h";;
"ct") v="$core_top_h";;
*) v="$(unitize $round_to)"
esac

letf "factor = ceil($v * $factor) / $v"

for var in $scale_vars; do
	letf "$var *= $factor"
done

letf "cpwl_present = $cpwl_w != 0"
letf "cpwr_present = $cpwr_w != 0"

cpwm_x=0
cpwm_present=0

letf "differential = $trace_sep != 0"
if [ "$differential" = 1 ]; then
	letf "width = ($trace_w * 2 + $trace_sep) * $width_factor"
	letf "a_x = ($width - $trace_sep) / 2 - $trace_w"
	letf "b_x = ($width + $trace_sep) / 2"

	letf "cpwm_present = $cpwm_w != 0"
	letf "cpwm_x = ($width - $cpwm_w) / 2"
else
	letf "width = $trace_w * $width_factor"
	letf "a_x = ($width - $trace_w) / 2"
	b_x="$a_x"
fi

letf "stripline = $core_top_h != 0"
if [ "$stripline" = 1 ]; then
	core_mid_h="$trace_h"
	mask_trace_h=0
	mask_h=0
	air_top_h=0
else
	core_top_h=0
	core_mid_h=0
	letf "air_top_h = $width * $air_factor"
fi

letf "trace_top_w =	$trace_w - $etchback * 2"
letf "cpwl_top_w =	$cpwl_w - $etchback * 2"
letf "cpwr_top_w =	$cpwr_w - $etchback * 2"
letf "cpwm_top_w =	$cpwm_w - $etchback * 2"
letf "mask_trace_h2 =	$mask_trace_h * 2"

letf "cpwl_x =		$a_x - $cpwl_sep - $cpwl_w"
letf "cpwr_x =		$b_x + $trace_w + $cpwr_sep"

letf "mid_resin_x = $a_x + $trace_w / 2"
letf "mid_resin_w = $b_x - $a_x"

if [ "$cpwm_present" = 1 ]; then
	letf "sep = $cpwm_x - $a_x - $trace_w"
	letf "mid_resin_present = $sep <= $resin_sep"
else
	letf "mid_resin_present = $trace_sep <= $resin_sep"
fi

letf "left_resin_x = $cpwl_x + $cpwl_w / 2"
letf "left_resin_w = $a_x - $cpwl_x"
letf "left_resin_present = ($cpwl_sep < $resin_sep) && $cpwl_present"

letf "right_resin_x = $cpwr_x + $cpwr_w / 2"
letf "right_resin_w = $cpwr_x - $b_x"
letf "right_resin_present = ($cpwr_sep < $resin_sep) && $cpwr_present"

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
     style="fill:#$air_color;fill-opacity:1;stroke:none" />
  <rect
     width="$width"
     height="$mask_h"
     x="0"
     y="$mask_y"
     id="mask"
     style="fill:#$mask_color;fill-opacity:1;stroke:none" />
  <path
     d="m $cpwl_x,$core_bottom_y $etchback,-$trace_h $cpwl_top_w,0 $etchback,$trace_h"
     id="cpwl-mask"
     clip-path="url(#clip)"
     style="opacity:1;fill:none;stroke:#$mask_color;stroke-width:$mask_trace_h2;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-opacity:$cpwl_present;stroke-dasharray:none;marker-start:none" />
  <path
     d="m $a_x,$core_bottom_y $etchback,-$trace_h $trace_top_w,0 $etchback,$trace_h"
     id="a-mask"
     clip-path="url(#clip)"
     style="opacity:1;fill:none;stroke:#$mask_color;stroke-width:$mask_trace_h2;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-opacity:1;stroke-dasharray:none;marker-start:none" />
  <path
     d="m $cpwr_x,$core_bottom_y $etchback,-$trace_h $cpwr_top_w,0 $etchback,$trace_h"
     id="cpwr-mask"
     clip-path="url(#clip)"
     style="opacity:1;fill:none;stroke:#$mask_color;stroke-width:$mask_trace_h2;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-opacity:$cpwr_present;stroke-dasharray:none;marker-start:none" />
  <path
     d="m $b_x,$core_bottom_y $etchback,-$trace_h $trace_top_w,0 $etchback,$trace_h"
     id="b-mask"
     clip-path="url(#clip)"
     style="opacity:1;fill:none;stroke:#$mask_color;stroke-width:$mask_trace_h2;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-opacity:$differential;stroke-dasharray:none;marker-start:none" />
  <path
     d="m $cpwm_x,$core_bottom_y $etchback,-$trace_h $cpwm_top_w,0 $etchback,$trace_h"
     id="cpwm-mask"
     clip-path="url(#clip)"
     style="opacity:1;fill:none;stroke:#$mask_color;stroke-width:$mask_trace_h2;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-opacity:$cpwm_present;stroke-dasharray:none;marker-start:none" />
  <rect
     width="$width"
     height="$core_top_h"
     x="0"
     y="$core_top_y"
     id="core-top"
     style="fill:#$core_top_color;fill-opacity:1;stroke:none" />
  <rect
     width="$width"
     height="$core_mid_h"
     x="0"
     y="$core_mid_y"
     id="core-mid"
     style="fill:#$core_mid_color;fill-opacity:1;stroke:none" />
  <rect
     width="$mid_resin_w"
     height="$core_mid_h"
     x="$mid_resin_x"
     y="$core_mid_y"
     id="mid-resin"
     style="fill:#$resin_color;fill-opacity:$mid_resin_present;stroke:none" />
  <rect
     width="$left_resin_w"
     height="$core_mid_h"
     x="$left_resin_x"
     y="$core_mid_y"
     id="left-resin"
     style="fill:#$resin_color;fill-opacity:$left_resin_present;stroke:none" />
  <rect
     width="$right_resin_w"
     height="$core_mid_h"
     x="$right_resin_x"
     y="$core_mid_y"
     id="right-resin"
     style="fill:#$resin_color;fill-opacity:$right_resin_present;stroke:none" />
  <path
     d="m $cpwl_x,$core_bottom_y $cpwl_w,0 -$etchback,-$trace_h -$cpwl_top_w,0 z"
     id="cpwl"
     clip-path="url(#clip)"
     style="fill:#$ref_color;fill-opacity:$cpwl_present;stroke:none" />
  <path
     d="m $a_x,$core_bottom_y $trace_w,0 -$etchback,-$trace_h -$trace_top_w,0 z"
     id="a"
     clip-path="url(#clip)"
     style="fill:#$pos_color;fill-opacity:1;stroke:none" />
  <path
     d="m $cpwm_x,$core_bottom_y $cpwm_w,0 -$etchback,-$trace_h -$cpwm_top_w,0 z"
     id="cpwm"
     clip-path="url(#clip)"
     style="fill:#$ref_color;fill-opacity:$cpwm_present;stroke:none" />
  <path
     d="m $b_x,$core_bottom_y $trace_w,0 -$etchback,-$trace_h -$trace_top_w,0 z"
     id="b"
     clip-path="url(#clip)"
     style="fill:#$neg_color;fill-opacity:$differential;stroke:none" />
  <path
     d="m $cpwr_x,$core_bottom_y $cpwr_w,0 -$etchback,-$trace_h -$cpwr_top_w,0 z"
     id="cpwr"
     clip-path="url(#clip)"
     style="fill:#$ref_color;fill-opacity:$cpwr_present;stroke:none" />
  <rect
     width="$width"
     height="$core_bottom_h"
     x="0"
     y="$core_bottom_y"
     id="core-bottom"
     style="fill:#$core_bottom_color;fill-opacity:1;stroke:none" />
  <rect
     style="opacity:1;fill:none;fill-opacity:1;stroke:#$ref_color;stroke-opacity:1;stroke-width:1"
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

for var in $scale_vars; do
	if [ "${!var}" != 0 ]; then
		letf "err = round(100 * (round(${!var})/${!var} - 1),2)"
		n=${var}_n
		echo "${!n}_e=$err%"
	fi
done

letf "pixel_size = round(1e6 / ${factor},2)"
letf "area_mm = round($area * 1e6 * 1e6,2)"
rho="1.723898e-8"
delta_rho="0.0039"
letf "rs = round($rho * (1 + ($temp - 20) * $delta_rho) / $area,4)"

echo "pixel_size=${pixel_size}um"
echo "area=${area_mm}um^2"
echo "Rs=${rs}"
echo "atlc_args=\"-d $mask_color=$erm -d $core_top_color=$ert -d $core_mid_color=$erp -d $core_bottom_color=$erb -d $resin_color=$err\""

