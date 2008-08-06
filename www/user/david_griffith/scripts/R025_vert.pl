#!/usr/bin/perl

# Copyright (C) 2008 David Griffith

# Creates a 1/4 Watt resistor mounted vertically


use strict;
use warnings;

use Pcb_9;

my $Pcb = Pcb_9 -> new(debug => 1);

$Pcb -> element_begin(description => 'resistor',
	output_file => '/tmp/R025_vert',
	pin_one_square => 1,
	dim   => 'mils');

# the resistor centroid is at (0,0) and the pins are placed 100 mils
# apart

my $Body_width =  100;          # y direction
my $Body_length = 100;        # x direction
my @Pins = (0, 0, 100, 0); # x,y pin centers
my $Pin_num = 1;

while (@Pins) {
    my ($x, $y) = splice @Pins, 0, 2;
    $Pcb -> element_add_pin(x => $x, y => $y,
			    thickness  => 55,
			    drill_hole => 35,
			    mask => 10,
			    clearance => 10,
			    pin_number => $Pin_num++);
}

$Pcb -> element_add_arc(x => 100,
			y => 0,
			width => $Body_width/2,
			height => $Body_width/2,
			start_angle => 0,
			delta_angle => 360,
			thickness => 15);

$Pcb -> element_add_line(x1 => 0,
			y1 => 0,
			x2 => 50,
			y2 => 0,
			thickness => 15);

$Pcb -> element_set_text_xy(x => -$Body_length,
			    y => $Body_width/4);


$Pcb -> element_output();
