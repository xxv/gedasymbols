#!/usr/bin/perl

# Copyright 2009 Sean Mathews <mathewss at nutech.com>
# Released under the terms of the GNU General Public License, version 2
# This will output via stdout a new pdb file with all lines that are out of tolerance 'selected'
if (! @ARGV) {
    print "Usage: $0 board1.pcb\n";
    exit 0;
}

my $tolerance = 20;

$pcb = shift;

open(P, $pcb);
while (<P>) {
    if (/(.*)Line\[(.*) (.*) (.*) (.*) (.*) (.*) \"(.*)\"\]/) {
	$x1 = $2;
	$y1 = $3;
	$x2 = $4;
	$y2 = $5;
	$thickness = $6;
	$clearance = $7;
        $flags="";
	$flags = $8;
	if((abs($x1-$x2) && abs($x1-$x2) < $tolerance) || (abs($y1-$y2) && abs($y1-$y2) < $tolerance)) {
    	   print "$1Line[$x1 $y1 $x2 $y2 $thickness $clearance \"" . (length($flags)>0 ? "$flags," : "") . "selected" . "\"]\n";
        } else {
	   print "$_";
	} 
    } else {
	   print "$_";
    }
}

