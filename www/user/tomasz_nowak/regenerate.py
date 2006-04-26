#!/bin/env python
import os
######
# Regenerating symbols
######
filenames = []
for filename in os.listdir('symbols'):
	if filename[-1] == 'm':
		filenames.append(filename)

file = open("symlist.html", "w")
file.write("<ul>\n")
for filename in filenames:
		file.write(' <li><a href="symbols/'+filename+'">'+filename+"</a></li>\n")
file.write("</ul>\n")
file.close()

######
# Regenerating footprints
######
filenames = []
for filename in os.listdir('footprints'):
	if filename[-1] == 'p':
		filenames.append(filename)

file = open("fplist.html", "w")
file.write("<ul>\n")
for filename in filenames:
		file.write(' <li><a href="footprints/'+filename+'">'+filename+"</a></li>\n")
file.write("</ul>\n")
file.close()
