# A little convenience script that emits the footpint with the value of all pin 
# and pad names set to the value of their number. -<)kmk(>- 
# call like this: 
#    awk -f set_pinnumber.awk foo.fp > bar.fp; mv bar.fp foo.fp
{ 
  if ( $1 ~ /Pin\[/ ) {       # If the current line is a pin 
    $7=$8                     # set the pin name to the value of the pin number
    } 
    else {   
      if ( $1 ~ /Pad\[/ ) {   # If the current line is a pad 
      $8=$9                   # set the pin name to the value of the pin number
      }
    }
    print $0                  # print the current line
}
