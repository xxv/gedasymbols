#!/usr/bin/perl

# Copyright (C) 2008 David Griffith

# Creates a footprint for an Electroswitch C5/C6 3P4P rotary switch

# TODO: add command line options to create 1, 2, and 4 pole versions as 
# well as 3-pole.


use strict;
use warnings;
use Math::Trig;

use Pcb_9 qw(:DEFAULT PIN_MOUNTING_HOLE);

use constant LINE_THICKNESS => 0.254; # 10 mils
use constant MASK_CLEARANCE => 0.254;
use constant COPPER_CLEARANCE => 0.254;

my $Pcb = Pcb_9 -> new(debug => 0);

my @Fields; # field names(defined in the data section)
my @Def;    # definitions that are common to all components

while (<DATA>) {
    s/\#.*//; # Remove comments
    s/^\s*//; # Remove leading spaces
    s/\s*$//; # Revove trailing spaces
    next unless length;    # Skip empty lines
    if (s/\\\s*$//) {      # Remove the continuation backslash and 
	$_ .= <DATA>;      # append the next line to $_ then 
	redo unless eof;   # restart the loop block after the conditional
    }

    # Lines that contain an '=' are global definitions.

    @Fields = split(/\s+/, $1), next if /^\s*fields\s*=\s*(\S.*)/;
    push(@Def, $1, $2), next if /(\S+)\s*=\s*(\S.*)/;

    my @values = split /\s*\|\s*/;

    # hash for each footprint

    my %f = ( @Def, 
	      map { $_ => shift(@values) } @Fields);

    $Pcb -> element_begin(description => 'TH',
			  output_file => "/tmp/" . &package_name(%f),
			  dim   => 'mm',
			  pin_one_square => 1);

    my $pin_num;
    my $angle;

    # Outer circle of pins
    #
    $angle = $f{start_angle_outer};
    foreach (1..$f{pins_outer}) {
	$pin_num = $_;
	&place_pin(radius => $f{pins_diameter_outer},
		angle => $angle,
		pad_thickness => $f{pad_thickness},
		drill_hole => $f{drill_hole},
		pin_number => $pin_num);
	$angle += $f{delta_outer};
    }

   # Inner circle of pins
   #
   $angle = $f{start_angle_inner};
   foreach ($f{pins_outer}+1..$f{pins_outer}+$f{pins_inner}) {
	$pin_num = $_;
	&place_pin(radius => $f{pins_diameter_inner},
		angle => $angle,
		pad_thickness => $f{pad_thickness},
		drill_hole => $f{drill_hole},
		pin_number => $pin_num);
	$angle += $f{delta_inner};
    }

    # Body circle
    #
    $Pcb -> element_add_arc(x => 0,
		y => 0,
		width => $f{body_diameter},
		height=> $f{body_diameter},
		start_angle => 0,
		delta_angle => 360,
		thickness => LINE_THICKNESS * 2);

    # Inner circle
    #
    $Pcb -> element_add_arc(x => 0,
		y => 0,
		width => $f{body_diameter}/2,
		height=> $f{body_diameter}/2,
		start_angle => 0,
		delta_angle => 360,
		thickness => LINE_THICKNESS * 2);

    # Central dot
    #
    $Pcb -> element_add_arc(x => 0,
		y => 0,
		width => 1,
		height=> 1,
		start_angle => 0,
		delta_angle => 360,
		thickness => LINE_THICKNESS * 10);

    # Locking lug dot
    #
    $Pcb -> element_add_arc(x => $f{body_diameter}/1.5,
		y => 0,
		width => 1,
		height => 1,
		start_angle => 0,
		delta_angle => 360,
		thickness => LINE_THICKNESS * 10);

    $Pcb -> element_output();
}


sub xy_pos  {
    my %v = @_;
    my $angle = deg2rad($v{angle});
    return(  $v{radius} * cos($angle),
	    -$v{radius} * sin($angle));
}


sub place_pin  { 
    my %v = @_;
    my ($x, $y) = &xy_pos(%v);
    $Pcb -> element_add_pin(x => $x, y => $y,
			    thickness  => $v{pad_thickness},
			    drill_hole => $v{drill_hole},
			    mask       => MASK_CLEARANCE, 
			    clearance  => COPPER_CLEARANCE, 
			    pin_number => $v{pin_number});
}


sub package_name (%) { 
    my %f = @_;
    sprintf("SWITCH_ROT__%s", 
	    $f{mfg_pn});
}

__DATA__

drill_hole = 1.5
pad_thickness = 2.54

# mfg_pn  
# pins_outer .............. number of pins in the outer circle
# pins_inner .............. number of pins in the inner circle
# pins_diameter_outer ..... diameter that the outer pins are centered on
# pins_diameter_inner ..... diameter that the inner pins are centered on
# start_angle_outer ....... for pin one on the outer circle
#                           (0deg = positive X-axis, angle increases ccw)
# start_angle_inner ....... for pin one on the inner circle
#                           (0deg = positive X-axis, angle increases ccw)
# delta_outer ............. angle between pins in the outer circle
# delta_inner ............. angle between pins in the inner circle
# body_diameter ........... diameter of the circular body

fields = mfg_pn pins_outer pins_inner pins_diameter_outer pins_diameter_inner\
 start_angle_outer start_angle_inner delta_outer delta_inner\
 body_diameter

Electroswitch_C5_3P4P | 12 | 3 | 22.1 | 8.89 |\
 345 | 300 | -30 | -120 | 27

