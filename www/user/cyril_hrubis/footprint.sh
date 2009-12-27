#!/bin/bash
#
# footprint www page generator
#

echo '<!--#set var="title" value="Cyril Hrubis" -->'
echo '<!--#include virtual="/header.html" -->'

echo "<h1>Footprints</h1>"

echo "This page contains links to footprints generated by pcb_utils.<br>"

cd footprints

for i in *; do
	
	if [ -d "$i" ] && [ "$i" != "CVS" ]; then
		echo "<h2>$i</h2>"
		echo "<table>"
		cd "$i"
		for j in *.fp; do
			DESC=`cat $j |grep description | sed s/\	Attribute\(\"description\"\ \"// | sed s/\"\)//`
			echo "<tr><td><a href=\"footprints/$i/$j\">$j</a></td><td>$DESC</td><tr>"
		done
		echo "</table>"
		cd ..
	fi
	
done

echo '<!--#include virtual="/trailer.html" -->'
