#!/usr/bin/perl
# -*- perl -*-

# Copyright 2006 DJ Delorie <dj@delorie.com>
# Released under the terms of the GNU General Public License, version 2

sub baseboard {
    my ($file, $width, $height, $nbase) = @_;
    if (! $nbase) {
	$base = $file;
	$base =~ s@.*/@@;
    } else {
	$base = $nbase;
    }

    $panelcopperlayers = ".*" unless $panelcopperlayers;

    $pscript = "$base.pscript";
    open(PS, ">$pscript");
    push(@files_to_remove, "$base.pscript");

    open(S, $file) || die("$file: $!");
    $outname = "$base.panel.pcb";
    $outname =~ s/pnl\.panel\.pcb/pcb/;
    open(O, ">$outname");
    while (<S>) {
	if (/PCB\[.* (\S+) (\S+)\]/) {
	    s/ (\S+) (\S+)\]/ $width $height\]/;
	}
	s/Cursor\[.*\]/Cursor[0 0 0.0]/;
	if (/^Flags/) {
	    s/,uniquename,/,/;
	    s/,uniquename//;
	    s/uniquename,//;
	}
	next if /\b(Via|Pin|Pad|ElementLine|Line|Arc|ElementArc|Text)/;
	if (/Polygon|Element/) {
	    $hole = 0;
	    while (<S>) {
		$hole++ if /Hole \(/;
		last if /^\s*\)\s*$/ && $hole <= 0;
		$hole-- if /\)/;
	    }
	    next;
	}
	if (/Layer/) {
	    if (@panelvias) {
		print O @panelvias;
		@panelvias = ();
	    }
	}
	print O;
	if (/Layer\((\d+) \"(.*)\"\)/) {
	    $lnum = $1;
	    $lname = $2;
	    print O scalar <S>;
	    print STDERR "layer $lnum $lname vs '$panelcopperlayers'\n";
	    if ($lnum =~ /$panelcopperlayers/ || $lname =~ /$panelcopperlayers/) {
		print O @panelcopper;
	    }
	}
    }
    close O;
    close S;

    print PS "LoadFrom(Layout,$outname)\n";

    $ox = $oy = 0;
}

sub loadboard {
    my ($file) = @_;
    $seq = 1 + $seq;

    open(S, $file);
    open(O, ">temp-panel.$seq");
    while (<S>) {
	if (/PCB\[.* (\S+) (\S+)\]/) {
	    $width = &parseval($1);
	    $height = &parseval($2);
	}
	s/Cursor\[.*\]/Cursor[0 0 0.0]/;
	print O;
    }
    close O;
    close S;
    print PS "LoadFrom(LayoutToBuffer,temp-panel.$seq)\n";
    push(@files_to_remove, "temp-panel.$seq");
}

sub opaste {
    $vx = $ox;
    $vy = $oy + $height;
    print PS "PasteBuffer(ToLayout,$ox,$oy)\n";
    $ox += $width;
    $oy = 0;
}

sub vpaste {
    print PS "PasteBuffer(ToLayout,$vx,$vy)\n";
    $vy += $height;
}

sub done {
    print PS "SaveTo(LayoutAs,$outname)\n";
    print PS "Quit()\n";

    close PS;

    system "set -x; pcb --action-script $pscript";
    #system "pcb -x ps $base.panel.pcb";
    #unlink @files_to_remove;
}

sub parseval {
    my ($v) = @_;
    if ($v =~ /mil/) {
	$v *= 100;
    }
    return 0 + $v;
}

1;
