#!/usr/bin/python
# This program generates the list of symbols to be included in the gEDA symbols page
import glob
import re
import os
fout=file("./symbols.html","w")
# Now we scan all the symbols files located in "symbols" directory
syms=glob.glob("symbols/*.sym")
syms.sort()
desc_match=re.compile(".*description=(.*).*")
# Now we generate the HTML file
fout.write("<table>\n")
fout.write("<tr><th>Symbol</th><th>Tragesym source</th><th>Description</th></tr>\n")
for f in syms:
   sfile=open(f,"r")
   # Now we search for the tragesym source
   # Replace the ".sym" with ".src"
   src=f[:-4]+".src"
   if not os.path.exists(src):
      src=""
   # Now we search for the description line
   desc=""
   for l in sfile.readlines():
     m=desc_match.match(l)
     if m and m.groups():
        desc=m.groups()[0]
   # Now generate the entry
   s="<tr>"
   s+="<td><a href=\""+f+"\">"+f[8:]+"</td>"
   if src:
     s+="<td><a href=\""+src+"\">"+src[8:]+"</td>"
   else:
     s+="<td></td>"
   s+="<td>"+desc+"</td>"
   s+="</tr>\n"
   fout.write(s)
   print f, desc
fout.write("</table>\n")
