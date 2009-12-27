#!/bin/bash
echo '<!--#set var="title" value="Cyril Hrubis" -->'
echo '<!--#include virtual="/header.html" -->'

for i in footprints/*/*; do
	
	if [ -f "$i" ]; then
		DESC=`cat $i |grep description | sed s/\	Attribute\(\"description\"\ \"// | sed s/\"\)//`
		echo "<a href=\"$i\">$DESC</a>"
	fi
done

echo '<!--#include virtual="/trailer.html" -->'
