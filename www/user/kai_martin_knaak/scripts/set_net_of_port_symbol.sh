#!/bin/sh
# A script that uses awk to set the net attribute of a port symbol to the 
# value of the refdes. The rationale is to make sure, all ports of a kind
# are actually included in th netlist.
######################################################-<)kmk(>-(2011)

if [ $# -eq 0 ]    # Script invoked with no command-line args?
then
  echo "set net attribute of port symbols" 
  echo "usage: `basename $0` foobar.sch"
  exit
fi  

awk -v filename="$1" -v eof=$(wc -l < $1) '   
{ 
  if ( $1 ~ /C/ ) {  # skip through the file to the start of a component block
    print $0   > "/tmp/"filename             # output the current line
    port=""
    net=""
    getline               # get the next line
    while ( $1 != "}" && NR != eof ) { # while line does not start with a closing curly brace
      if ( $1 ~ /device=PORT/ ) { port="true" }
      if ( $1 ~ /net/ ) { net="true" }  
      if ( $1 ~ /refdes=.*/ ) {     # if the current line defines a refdes
          xpos=xpos_tmp             # move the cached parameters to the next level
          ypos=ypos_tmp
          color=color_tmp
          size=size_tmp
          visibility=visibility_tmp
          name_value=name_value_tmp
          angle=angle_tmp
          alignment=alignment_tmp
          num_lines=num_lines_tmp
          refdes=$1
          gsub ( /refdes=/, "", refdes )   # extract the value
          }
      if ( $1 ~ /T/ ) { # look for text object line
          xpos_tmp=$2             # cache the text object parameters
          ypos_tmp=$3
          color_tmp=$4
          size_tmp=$5
          visibility_tmp=$6
          name_value_tmp=$7
          angle_tmp=$8
          alignment_tmp=$9
          num_lines_tmp=$10
          } # end of if T
        
      print $0   > "/tmp/"filename             # output the current line
      getline                                  # get the next line
      } # end of while loop

      if ( port ) {
        if ( !net ) {         # only add a net if there was not one already
          visibility="0"      # do not clutter the schematic with net attribute
          printf("T %s %s %s %s %s %s %s %s %s\n", xpos, ypos, color, 
                     size, visibility, name_value, angle, alignment, 
                     num_lines)   > "/tmp/"filename
          printf("net=%s:1\n", refdes)   > "/tmp/"filename
          ++numports
          } # end if net
        } # end if port
    } # end if component block
    print $0   > "/tmp/"filename
}
END {       
  printf("number of netless ports found in layout: %s\n", numports)
  }
' $1

mv $1 /tmp/$1.backup
mv /tmp/$1 $1
echo "moved the original "$1" to /tmp/"$1".backup"

