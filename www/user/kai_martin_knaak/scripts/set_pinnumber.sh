#!/bin/sh
# A convenience script that uses awk to set the name of all pin and pad names 
# in a layout to the value of their number. -
######################################################-<)kmk(>-(2011)

echo "set all pin names and pad names to the value of the corresponding pinnnumber" 

awk -v filename="$1" '
{ 
  if ( $1 ~ /Pin\[/ ) {       # If the current line is a pin 
    $7=$8                     # set the pin name to the value of the pin number
    ++numpins                 # increment numpins
    } 
    else {   
      if ( $1 ~ /Pad\[/ ) {   # If the current line is a pad 
      $8=$9                   # set the pin name to the value of the pin number
      ++numpads               # increment numpads
      }
    }
    print $0  > "/tmp/"filename      # print the current line to tmp file
}
END {       
  printf("number of pads found in layout: %s\n", numpads)
  printf("number of pins found in layout: %s\n", numpins)
  }
' $1

mv $1 /tmp/$1.backup
mv /tmp/$1 $1
echo "moved the original "$1" to /tmp/"$1".backup"

