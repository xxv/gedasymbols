#!/bin/sh
# Searches all *.sch in $PWD and sub dirs for missing symbols.

for i in `find -name "*.sch"`; do 
  echo $i ": "
  gnetlist -g geda $i 2>/dev/null | grep "WARNING: Found a"
done
