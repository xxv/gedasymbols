#!/usr/bin/perl

# Copyright (C) 2005 John C. Luciani Jr.

# This program may be distributed or modified under the terms of
# version 0.1 of the No-Fee Software License published by
# John C. Luciani Jr.

# Creates the PCB elements specified in the DATA section.  

#use strict;
use warnings;

use Pcb_8;

  $Pcb = Pcb_8 -> new(debug => 0);

  @Fields = qw(pin_count
		D_dimension
                E_dimension
                pin_spacing
                pin_width
                pin_length);

while (<DATA>) {
    s/\#.*//; # Remove comments
    s/^\s*//; # Remove leading spaces
    s/\s*$//; # Revove trailing spaces
    next unless length; # Skip empty lines
      ($type, @values) = split /\s*\|\s*/;

    # hash for each footprint

      %f = map { $_ => shift(@values) } @Fields;

    $Pcb -> element_begin(description => "$type",
			  output_file => "tmp/$type",
			  dim   => 'mm');


      #$edge_pin_offset = ($f{E_dimension} - ($f{pin_count}/2 * $f{pin_spacing} ) + $f{pin_width})/2;
    $edge_pin_offset = 0;


    foreach   $pin_num (1..$f{pin_count}) {
    
    if($pin_num <= $f{pin_count}/2)
    {
    	  $row_num = $pin_num;
          $x =  - 0.25 ;
    }
    else
    {
    	  $row_num = $pin_num - $f{pin_count}/2;
          $x = $f{D_dimension} - $f{pin_length} + 0.25;
    }
      $y = ((  $row_num - 1) *   $f{pin_spacing} ) +   $edge_pin_offset;
	$Pcb -> element_add_pad_rectangle(width => $f{pin_width} + 0.1778,
					  length=> $f{pin_length} + 0.5,
					  x => $x,
					  y => $y ,
					  name => 'input',
					  mask => 0.254,
					  clearance => 0.254,
					  pin_number => $pin_num);
    }

    # Draw a silkscreen rectangle around the component.  A silkscreen
    # specification that all PCB vendors should be able to meet is
    # 10mil line width and 10mil spacing. The silkscreen line width
    # defaults to 10mils. To achieve the proper spacing we add 
    # 30mils (0.762mm) to the maximum extents of the copper pads 
    # (10mils on either side of the copper and 2*5 mils for the 
    # silkscreen line).

      $width = $f{E_dimension} + 0.768;
      $length = $f{D_dimension} +   2;

    $Pcb -> element_add_rectangle(width => $width,
				  length=> $length,
				  x => ($f{D_dimension}   - $f{pin_length}/2 - 0.25/2)/2,
				  y =>  ($f{E_dimension}  - 0.768/2)/2 - ($f{pin_width} + 0.1778)/2);

    # Place the refdes slightly (0.5mm) above the upper left corner of
    # the outline rectangle.

    $Pcb -> element_set_text_xy(x =>  -2,
				y => -2);

    $Pcb -> element_output();

}


__DATA__

# footprint type |number of pins | D dimension | E dimension 	| pin spacing (e) | pin_width | pin length
TSOP48 | 48 | 20.20 | 12.10 | 0.5 | 0.21 | 0.70
TSOP54 | 54 | 11.96 | 22.30 | 0.8 | 0.374 | 0.60
