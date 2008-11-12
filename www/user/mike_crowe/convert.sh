#!/bin/sh

TEMP_FILE=pid_$$_temp
T1=/tmp/${TEMP_FILE}.svg
xsltproc svg2svg_lines.xsl $1 > ${T1}

xsltproc svg_lines2pcb.xsl ${T1}
rm ${T1}