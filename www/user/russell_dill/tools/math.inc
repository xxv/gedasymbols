#!/bin/bash
#
# math.inc: letf (floating point let) and unitize (SPICE units)
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

function letf()
{
	local arg="$*"
	local var_end=$(expr index "$arg" "<>-+*/^%~&|!= ")
	let "var_end -= 1"
	local var="${arg:0:$var_end}"
	local expr="${arg:$var_end}"
	[ -n "${!var}" ] || eval ${var}=0
	local result=$(calc -p "xxxvar=${!var}; xxxvar $expr; xxxvar" </dev/null)
	if [ -z "$result" ]; then
		echo "letf error:  xxxvar=${!var}; xxxvar $expr; xxxvar" 1>&2
		echo "$@" 1>&2
		exit 1
	fi
	# Ignore approximate indicator
	[ ${result:0:1} = '~' ] && result=${result:1}
	if ! eval ${var}=$result; then
		echo "letf error: "$@" ${var}=$result" 1>&2
		exit 1
	fi
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
