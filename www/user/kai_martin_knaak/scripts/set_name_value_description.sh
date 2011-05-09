#!/bin/sh
# This little script uses awk to set name, value and description of all 
# footprints in a layout to the same string. This is useful for footprints
# that will go into the library.
################################################# -<)kmk(>---<(2011)

awk -v filename="$1" '
   BEGIN { FS = " " }        # use space as field separator
{   
   if ( $1 ~ /Element\[/ ) {         # if the line is an Element statement
      fp_name = ""
      if ($4 != "\"\"" ) fp_name = $4    # extract footprint value or 
      if ($3 != "\"\"" ) fp_name = $3    # name or
      if ($2 != "\"\"" ) fp_name = $2    # description from Element statement
      if ( fp_name == "" ) {
                 print "Footprint without a name: "$0
                 next                     # immediately look for next Element
                 }
      $4 = fp_name                        # set description,
      $3 = fp_name                        # set name
      $2 = fp_name                        # set value
      printf ("normalized name/value/description of %s\n", fp_name) 
   }
   print $0 > "/tmp/"filename      # print to tmp file
}
' $1

mv $1 /tmp/$1.backup
mv /tmp/$1 $1
echo "moved the original "$1" to /tmp/"$1".backup"

