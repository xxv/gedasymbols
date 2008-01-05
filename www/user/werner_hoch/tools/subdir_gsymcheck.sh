#!/bin/sh

# Copyright (C) 2008 Werner Hoch <werner.ho@gmx.de>
# Released under the terms of the GNU General Public License, version 2

# description: run gsymcheck in all subdirectories of $1 that contain
# gEDA symbols

# usage is:  subdir_gsymcheck [dirname]
# or      :  subdir_gsymcheck [dirname] &2>result.txt

find "$1" -type d | while read dir ; do
    files=$(ls "$dir"/*.sym 2>/dev/null)
    if [ "$files" != "" ] ; then
	echo " "
	echo $dir "================================================"
	gsymcheck -vv "$dir"/*.sym
    fi
done
