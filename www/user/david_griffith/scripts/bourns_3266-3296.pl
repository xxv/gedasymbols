#!/usr/bin/perl

# Copyright (C) 2008 David Griffith

# Footprint for Bourns 3266 and 3296 series trimming potentiometers
# Dimensions based on data sheets available at
# http://www.bourns.com/pdfs/3266.pdf
# http://www.bourns.com/pdfs/3296.pdf
 

# Centroid is at pin 1

use strict;
use warnings;
use Pcb_9 qw(:DEFAULT PIN_MOUNTING_HOLE);

# use Switch;
# For some kooky reason, this causes failure with the following message:
# (new) Creating a new Pcb object
# readline() on unopened filehandle DATA at ./bourns.pl line 17.

my $Pcb = Pcb_9 -> new(debug => 1);

my @Fields; # field names(defined in the data section)
my @Def;    # definitions that are common to all components

while (<DATA>) {
	s/\#.*//;		# Remove comments
	s/^\s*//;		# Remove leading spaces
	s/\s*$//; 		# Remove trailing spaces
	next unless length;	# Skip empty lines
	if (s/\\\s*$//) {	# Remove the continuation backslash and 
		$_ .= <DATA>;	# append the next line to $_ then 
		redo unless eof;# restart the loop block after the conditional
	}
	# Lines that contain an '=' are global definitions.
	@Fields = split(/\s+/, $1), next if /^\s*fields\s*=\s*(\S.*)/;
	push(@Def, $1, $2), next if /(\S+)\s*=\s*(\S.*)/;
	my @values = split /\s*\|\s*/;
	# hash for each footprint
	my %f = ( @Def, map { $_ => shift(@values) } @Fields);

	$Pcb -> element_begin(description => 'TH',
		output_file => "/tmp/" . &package_name(%f),
		dim   => 'mils',
		 pin_one_square => 1);

	my $pin_num;
	my $x;
	my $y;

	# Draw pins
	#
	foreach (1..$f{pin_count}) {
		$pin_num = $_;
		if ($pin_num == 1) {$x = $f{p1x}; $y = $f{p1y};}
		if ($pin_num == 2) {$x = $f{p2x}; $y = $f{p2y};}
		if ($pin_num == 3) {$x = $f{p3x}; $y = $f{p3y};}
		$Pcb -> element_add_pin(x => $x, y => $y,
			thickness  => $f{pad_thickness},
			drill_hole => $f{drill_hole},
			mask       => $f{mask_clearance}, 
			clearance  => $f{pin_clearance}, 
			pin_number => $pin_num);
		}

	# Draw box
	#
	# Top
	$Pcb -> element_add_line(
		x1 => $f{p1x} - $f{left_clearance},
		y1 => $f{p1y} - $f{top_clearance},
		x2 => $f{p3x} + $f{left_clearance},
		y2 => $f{p1y} - $f{top_clearance},
		thickness => $f{line_thickness});

	# Bottom
	if ($f{model} eq "3266p" || $f{model} eq "3296p") {
		$Pcb -> element_add_line(
			x1 => $f{p1x} - $f{left_clearance},
			y1 => $f{p2y} + $f{bottom_clearance},
			x2 => $f{p3x} + $f{left_clearance},
			y2 => $f{p2y} + $f{bottom_clearance},
			thickness => $f{line_thickness});
	} else {
		$Pcb -> element_add_line(
			x1 => $f{p1x} - $f{left_clearance},
			y1 => $f{p1y} + $f{p2y} + $f{bottom_clearance},
			x2 => $f{p3x} + $f{right_clearance},
			y2 => $f{p3y} + $f{p2y} + $f{bottom_clearance},
			thickness => $f{line_thickness});
	}

	# Left
	$Pcb -> element_add_line(
		x1 => $f{p1x} - $f{left_clearance},
		y1 => $f{p1y} - $f{top_clearance},
		x2 => $f{p1x} - $f{left_clearance},
		y2 => $f{p2y} + $f{bottom_clearance},
		thickness => $f{line_thickness});

	# Right
	$Pcb -> element_add_line(
		x1 => $f{p3x} + $f{right_clearance},
		y1 => $f{p3y} - $f{top_clearance},
		x2 => $f{p3x} + $f{right_clearance},
		y2 => $f{p2y} + $f{bottom_clearance},
		thickness => $f{line_thickness});

	# Draw actuator mark
	#
	if ($f{model} eq "3266w") {
		$Pcb -> element_add_arc(
			x => $f{p1x},
			y => $f{p1y},
			width => $f{pad_thickness} * .85,
			height => $f{pad_thickness} * .85,
			start_angle => 0,
			delta_angle => 360,
			thickness => $f{line_thickness});
	}

	if ($f{model} eq "3266y") {
		$Pcb -> element_add_arc(
			x => $f{p1x} - $f{left_clearance} * .4, 
			y => $f{p1y} - $f{top_clearance} * .65, 
			width => $f{pad_thickness} * .35,
			height => $f{pad_thickness} * .35,
			start_angle => 0,
			delta_angle => 360,
			thickness => $f{line_thickness});
	}


	if ($f{model} eq "3296w") {
		$Pcb -> element_add_arc(
			x => $f{p1x} - $f{left_clearance} * .65, 
			y => $f{p1y} - $f{top_clearance} * .65, 
			width => $f{pad_thickness} * .5,
			height => $f{pad_thickness} * .5,
			start_angle => 0,
			delta_angle => 360,
			thickness => $f{line_thickness});
	}

	if ($f{model} eq "3296y") {
		$Pcb -> element_add_arc(
			x => $f{p1x} - $f{left_clearance} * .70, 
			y => $f{p1y} - $f{top_clearance} * .40, 
			width => $f{pad_thickness} * .5,
			height => $f{pad_thickness} * .5,
			start_angle => 0,
			delta_angle => 360,
			thickness => $f{line_thickness});
	}




	# Side actuators
	if ($f{model} eq "3266z" || $f{model} eq "3296x") {
		$Pcb -> element_add_line(
			x1 => $f{p3x} + $f{right_clearance},
			y1 => $f{p2y} + $f{bottom_clearance},
			x2 => $f{p3x} + $f{right_clearance} + $f{sidescrew},
			y2 => $f{p2y} + $f{bottom_clearance},
			thickness => $f{line_thickness});

		$Pcb -> element_add_line(
			x1 => $f{p3x} + $f{right_clearance} + $f{sidescrew},
			y1 => $f{p2y} + $f{bottom_clearance},
			x2 => $f{p3x} + $f{right_clearance} + $f{sidescrew},
			y2 => $f{p2y},
			thickness => $f{line_thickness});

		$Pcb -> element_add_line(
			x1 => $f{p3x} + $f{right_clearance} + $f{sidescrew},
			y1 => $f{p2y},
			x2 => $f{p3x} + $f{right_clearance},
			y2 => $f{p2y},
			thickness => $f{line_thickness});
	}

	if ($f{model} eq "3266x" || $f{model} eq "3296z") {
		$Pcb -> element_add_line(
			x1 => $f{p3x} + $f{right_clearance},
			y1 => $f{p2y} + $f{bottom_clearance},
			x2 => $f{p3x} + $f{right_clearance} + $f{sidescrew},
			y2 => $f{p2y} + $f{bottom_clearance},
			thickness => $f{line_thickness});

		$Pcb -> element_add_line(
			x1 => $f{p3x} + $f{right_clearance} + $f{sidescrew},
			y1 => $f{p2y} + $f{bottom_clearance},
			x2 => $f{p3x} + $f{right_clearance} + $f{sidescrew},
			y2 => $f{p2y} - $f{bottom_clearance},
			thickness => $f{line_thickness});

		$Pcb -> element_add_line(
			x1 => $f{p3x} + $f{right_clearance} + $f{sidescrew},
			y1 => $f{p2y} - $f{bottom_clearance},
			x2 => $f{p3x} + $f{right_clearance},
			y2 => $f{p2y} - $f{bottom_clearance},
			thickness => $f{line_thickness});
	}

	if ($f{model} eq "3266p") {
		$Pcb -> element_add_line(
			x1 => $f{p1x} - $f{left_clearance},
			y1 => $f{p1y} - $f{top_clearance},
			x2 => $f{p1x} - $f{left_clearance}, 
			y2 => $f{p1y} - $f{top_clearance} - $f{sidescrew},
			thickness => $f{line_thickness});

		$Pcb -> element_add_line(
			x1 => $f{p1x} - $f{left_clearance},
			y1 => $f{p1y} - $f{top_clearance} - $f{sidescrew},
			x2 => $f{p1x} + $f{left_clearance},
			y2 => $f{p1y} - $f{top_clearance} - $f{sidescrew},
			thickness => $f{line_thickness});

		$Pcb -> element_add_line(
			x1 => $f{p1x} + $f{left_clearance},
			y1 => $f{p1y} - $f{top_clearance},
			x2 => $f{p1x} + $f{left_clearance},
			y2 => $f{p1y} - $f{top_clearance} - $f{sidescrew},
			thickness => $f{line_thickness});
	}

	if ($f{model} eq "3296p") {
		$Pcb -> element_add_line(
			x1 => $f{p1x} - $f{left_clearance},
			y1 => $f{p1y} - $f{top_clearance},
			x2 => $f{p1x} - $f{left_clearance}, 
			y2 => $f{p1y} - $f{top_clearance} - $f{sidescrew},
			thickness => $f{line_thickness});

		$Pcb -> element_add_line(
			x1 => $f{p1x} - $f{left_clearance},
			y1 => $f{p1y} - $f{top_clearance} - $f{sidescrew},
			x2 => $f{p1x},
			y2 => $f{p1y} - $f{top_clearance} - $f{sidescrew},
			thickness => $f{line_thickness});

		$Pcb -> element_add_line(
			x1 => $f{p1x},
			y1 => $f{p1y} - $f{top_clearance},
			x2 => $f{p1x},
			y2 => $f{p1y} - $f{top_clearance} - $f{sidescrew},
			thickness => $f{line_thickness});
	}

	$Pcb -> element_output();
}


sub package_name (%) { 
    my %f = @_;
    sprintf("BOURNS_%s", 
	    $f{model});
}

__DATA__

pin_count = 3
drill_hole = 35
pad_thickness = 55
pin_clearance = 10
mask_clearance = 10
line_thickness = 10
fields = model width length p1x p1y p2x p2y p3x p3y \
  bottom_clearance top_clearance left_clearance right_clearance sidescrew
# 3266 series 1/4" 1/4 watt
3266w | 264 | 177 | 0 | 0 | 100 | 100 | 200 | 0 | 50 | 50 | 50 | 50 | 0
3266x | 264 | 177 | 0 | 0 | 100 | 100 | 200 | 0 | 50 | 50 | 50 | 50 | 40
3266y | 264 | 177 | 0 | 0 | 100 | 0 | 200 | 0 | 85 | 85 | 50 | 50 | 0
3266z | 264 | 177 | 0 | 0 | 100 | 0 | 200 | 0 | 85 | 85 | 50 | 50 | 40
3266p | 264 | 177 | 0 | 100 | 100 | 200 | 200 | 100 | 130 | 50 | 50 | 50 | 40
3296w | 375 | 190 | 0 | 0 | 100 | 0 | 200 | 0 | 100 | 100 | 100 | 100 | 0
3296x | 375 | 190 | 0 | 0 | 100 | 0 | 200 | 0 | 100 | 100 | 100 | 100 | 40
3296y | 375 | 190 | 0 | 0 | 100 | 100 | 200 | 0 | 50 | 50 | 100 | 100 | 0
3296z | 375 | 190 | 0 | 0 | 100 | 100 | 200 | 0 | 50 | 50 | 100 | 100 | 40
3296p | 375 | 190 | 0 | 100 | 100 | 200 | 200 | 100 | 206 | 100 | 100 | 100 | 40
