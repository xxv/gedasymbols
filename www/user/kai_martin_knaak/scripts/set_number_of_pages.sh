#!/bin/sh
# Ein Mini-Script, dass auf allen Seiten des Projekts die Seitenzahl setzt
# Bisher sehr schmutzig.
VON=14
NACH=13 
for i in `ls *.sch`
 do 
   sed s/number_of_pages=$VON/number_of_pages=$NACH/ <$i >temp.sch
   mv temp.sch $i 
   echo "in "$i" die Seitenzahl von "$VON" auf "$NACH" gesetzt." 
 done
