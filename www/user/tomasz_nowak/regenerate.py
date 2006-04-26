import os
filenames = os.listdir('symbols')

symbol_section = []
for file in filenames:
	if file[-1] == 'm':
		symbol_section.append('<li><a href="symbols/'+file+'">'+file+'</a></li>')
		#print file
print symbol_section

file = open("symlist.html", "w")
for entry in symbol_section:
	file.write(entry)
file.close()
