#!/bin/sh
# This little script uses awk to extract footprints from a pcb layout
# to the current working directory.
################################################# -<)kmk(>---<(2011)

awk '
   BEGIN { FS = "\"" }        # use " as field separator
   $1 ~ /Element\[/ {         # if the line is an Element statement
      fp_name = ""
      if ($8 != "" ) fp_name = $8".fp"       # extract footprint value or 
      if ($6 != "" ) fp_name = $6".fp"       # name or
      if ($4 != "" ) fp_name = $4".fp"       # description from Element statement
      if ( fp_name == "" ) {
                 print "Footprint without a name: "$0
                 next
                 }
      print $0 > fp_name      # print line with Element statement to file
      getline                 # get the next line 
      while ( $1 != "\t)" ) { # while line does not start with tab followed by )
        print $0 > fp_name    # append the line to file 
        getline               # get the next line
      }                       # end of while loop
      print $0 > fp_name      # append the last line
      printf ("extracted %s\n", fp_name) 
   }
' $1
