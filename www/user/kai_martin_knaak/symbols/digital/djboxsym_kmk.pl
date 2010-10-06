#!/usr/bin/perl
# -*- perl -*-

# Copyright (C) 2006 DJ Delorie dj@delorie.com
# Released under the terms of the GNU General Public License, version 2
# slightly modified to the preferences of -<)kmk(>-

# Usage: djboxsym sample.symdef > sample.sym

$y{left} = 400;
$y{right} = 400;
$y{labels} = 600;
$labelpin = 0;

$busspace = 200;
$groupspace = 300;
$skipspace = 200;
$yinvert = 300;

# If set, top and bottom labels are vertical.
$vmode = 1;

# Read in the file, storing information about each pin.

while (<>) {
    next if /^#/;
    s/^\s+//;
    s/\s+$//;
    s/[\s\t]+/ /g;
    s/[\r\n]+$//;

    # options
    if (/^--(.*)/) {
	$opt = $1;
	($opt, $value) = split(' ', $opt, 2);
	if ($opt eq "vmode") {
	    $vmode = 1;
	}
	if ($opt eq "compact") {
	    $groupspace = 200;
	    $skipspace = 400;
	    $yinvert = 400;
	    $compactmode = 1;
	}
	next;
    }

    # Note change of section.
    if (/^\[(.*)\]/) {
	$side = $1;
	$space = 0;
	next;
    }

    # Start a bus
    if (/^\.bus/) {
	$busmode = 1;
	next;
    }

    # blank lines - cancel bus, add gap.
    if (! /\S/) {
	if ($busmode) {
	    $y{$side} += $busspace;
	}
	$busmode = 0;
	if ($space) {
	    if ($side =~ /left|right/) {
		$y{$side} += $skipspace;
	    }
	    if ($side =~ /top|bottom/) {
		$x{$side} += 400;
	    }
	    $space = 0;
	}
	next;
    }

    if (/^\.skip (\d+)/) {
	$skip = $1;
	$space = 0;
	if ($side =~ /left|right/) {
	    $y{$side} += $skip;
	}
    }

    # Hidden labels are stored separately, because we don't care how
    # big they are.
    if (/! (\S.*)/ && $side eq "labels") {
	push(@attrs, $1);
	next;
    }

    # Visible labels are stored as pins because their size affects the
    # size of the symbols' box.
    if (/\S/ && $side eq "labels") {
	$labelpin --;
	$pinside{$labelpin} = $side;
	$piny{$labelpin} = $y{labels};
	$pinlabel{$labelpin} = $_;
	$y{labels} += $groupspace;
	$rlen{$labelpin} = &textlen($_);
	next;
    }

    # Regular pins are handled here.
    if (/^(\d+[A-Za-z]?)\s*(.*)/) {
	$space = 1;
	($pin, $rest) = ($1,$2);

	if ($saw_pin{$pin}) {
	    print STDERR "DUPLICATE PIN $pin (was $pinlabel{$pin}, now $rest)\n";
	    $errors ++;
	}
	$saw_pin{$pin} = 1;
	$maxpin = $pin if $maxpin < $pin;

	$pinside{$pin} = $side;
	next if $side eq "nc";
	if ($rest =~ /^([!>]+) (.*)/) {
	    $flags = $1;
	    $pinlabel{$pin} = $2;
	    $bubble{$pin} = 1 if $flags =~ /!/;
	    $edge{$pin} = 1 if $flags =~ />/;
	} else {
	    $pinlabel{$pin} = $rest;
	}
	$rlen{$pin} = &textlen($pinlabel{$pin});

	if ($side =~ /left|right/) {
	    $y = $piny{$pin} = $y{$side};
	    $y{$side} += ($busmode ? $busspace : $groupspace);
	}
	if ($side =~ /top|bottom/) {
	    $tw = &alignpin((200 + $rlen{$pin}) / 2);
	    if ($vmode) {
		$pinx{$pin} = $w{$side};
		$w{$side} += ($busmode ? 200 : 400);
	    } else {
		$pinx{$pin} = $w{$side} + $tw;
		$w{$side} += $tw + $tw;
	    }
	}

    }

}

$minpin = $labelpin;
$boxwidth = 0;
%bw = ();

# for each horizontal slice of the symbol, keep track of how much
# width is used up by the left, middle, and right labels.
for $lp (keys %pinside) {
    next unless $pinside{$lp} =~ /left|right|label/;
    $yb = &alignpin($piny{$lp});
    for ($y=$yb-300; $y<=$yb+300; $y+=100) {
	if ($bw{$y}{$pinside{$lp}} < $rlen{$lp}) {
	    $bw{$y}{$pinside{$lp}} = $rlen{$lp};
	}
    }
}

# Compute the height of the box. 
for $p (keys %pinside) {
    next unless $pinside{$p} =~ /left|right/;
    if ($maxy < $piny{$p}) {
	$maxy = $piny{$p};
    }
}
$maxy += $groupspace;

# Now, use the slice widths to compute the minimum width of the box.
for ($i=0; $i<$maxy; $i+=100) {
    $w = $bw{$i}{left} + $bw{$i}{labels} + $bw{$i}{right};
    if ($bw{$i}{labels}) {
	$wl = ($bw{$i}{left} + $bw{$i}{labels}/2) * 2;
	$w = $wl if $w < $wl;
	$wl = ($bw{$i}{right} + $bw{$i}{labels}/2) * 2;
	$w = $wl if $w < $wl;
    }
    if ($bw{$i}{left} && $bw{$i}{labels}) {
	$w += 100;
    } elsif ($bw{$i}{left} && $bw{$i}{right}) {
	$w += 200;
    }
    if ($bw{$i}{right} && $bw{$i}{labels}) {
	$w += 100;
    }
    if ($boxwidth < $w) {
	$boxwidth = $w;
    }
}

$boxwidth = $w{top} if $boxwidth < $w{top};
$boxwidth = $w{bottom} if $boxwidth < $w{bottom};

# Flip Y coordinates (we count from the top, but symbols coordinates
# are from the bottom).
for $p (keys %pinside) {
    next unless $pinside{$p} =~ /left|right|labels/;
    $piny{$p} = $maxy - $piny{$p} + $yinvert;
}

$boxwidth = &alignpin($boxwidth);
$boxwidth += 200;

# Adjust the position of the top/bottom pins so that, as a group,
# they're centered.
%maxh = ();
for $p (keys %pinside) {
    next unless $pinside{$p} =~ /top|bottom/;
    $pinx{$p} += &alignpin(($boxwidth - $w{$pinside{$p}})/2) + 300;
    if ($vmode) {
	$pinx{$p} += 200;
	$h = &textlen($pinlabel{$p});
	$maxh{$pinside{$p}} = $h if $maxh{$pinside{$p}} < $h;
    }
}

if ($vmode) {
    $dy = &alignpin($maxh{bottom});
    for $lp ($minpin..-1) {
	$piny{$lp} += $dy;
    }
    for $p (keys %pinside) {
	if ($pinside{$p} =~ /left|right|bottom/) {
	    $piny{$p} += $dy;
	}
    }
    $maxy += $dy + &alignpin ($maxh{top});
}

# Labels are centered in the box.
for $lp ($minpin..-1) {
    $pinx{$lp} = &alignpin($boxwidth/2) + 300;
}

# Version.
print "v 20060123 1\n";

# Symbol box.
printf("B %d %d %d %d 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1\n",
       300, 300, $boxwidth, $maxy);

# These are the hidden labels.
$ax = 300 + $boxwidth;
$ay = 400 + $maxy;
for $a (reverse @attrs) {
    printf("T %d %d 9 10 0 0 0 0 1\n%s\n",
	   $ax, $ay, $a);
    $ay += 200;
}

# Now print all the pins.
for $p (sort {$a<=>$b} keys %pinside) {
    next unless $pinside{$p};
    if ($pinside{$p} eq "left") {
	$pinx{$p} = 300;
    }
    if ($pinside{$p} eq "right") {
	$pinx{$p} = 300 + $boxwidth;
    }
    if ($p > 0 && !$saw_pin{$p}) {
	print STDERR "MISSING PIN $p\n";
	$errors++;
    } else {
	printf STDERR ("%3d  %-6s  %4d %4d  %s\n",
		       $p, $pinside{$p}, $pinx{$p}, $piny{$p}, $pinlabel{$p});
    }

    eval "&drawpin_$pinside{\"$p\"} (\"$p\")";
}

# what remains are helper functions; for drawing each type of pin,
# each type of label, etc.

sub drawpin_nc {
}

sub drawpin_top {
    my($pin) = @_;
    $y = $maxy + 300;
    printf("P %d %d %d %d 1 0 0\n",
	   $pinx{$pin}, $y+100, $pinx{$pin}, $y);
    print "{\n";
    if ($vmode) {
	&pvltext($pinx{$pin}, $y-50, 7, $pinlabel{$pin});
    } else {
	&pltext($pinx{$pin}, $y-50, 5, $pinlabel{$pin});
    }
    &ntext($pinx{$pin}+50, $y+50, 0, $pin);
    print "}\n";
}

sub drawpin_bottom {
    my($pin) = @_;
    printf("P %d %d %d %d 1 0 0\n",
	   $pinx{$pin}, 200, $pinx{$pin}, 300);
    print "{\n";
    if ($vmode) {
	&pvltext($pinx{$pin}, 350, 1, $pinlabel{$pin});
    } else {
	&pltext($pinx{$pin}, 350, 3, $pinlabel{$pin});
    }
    &ntext($pinx{$pin}+50, 250, 2, $pin);
    print "}\n";
}

sub drawpin_labels {
    my($pin) = @_;
    &ltext($pinx{$pin}, $piny{$pin}, 3, $pinlabel{$pin});
}

sub circle {
    my ($x, $y) = @_;
    print "V $x $y 50 3 0 0 0 -1 -1 0 -1 -1 -1 -1 -1\n";
}

sub drawpin_left {
    my($pin) = @_;
    $x = $pinx{$pin};
    $px = 50;
    if ($bubble{$pin}) {
	$x -= 100;
	&circle($x+50, $piny{$pin});
    }
    if ($edge{$pin}) {
	$px += 100;
	printf("L %d %d %d %d 3 0 0 0 0 0\n",
	       $pinx{$pin}, $piny{$pin}-50,
	       $pinx{$pin}+100, $piny{$pin});
	printf("L %d %d %d %d 3 0 0 0 0 0\n",
	       $pinx{$pin}+100, $piny{$pin},
	       $pinx{$pin}, $piny{$pin}+50);

    }
    printf("P %d %d %d %d 1 0 0\n",
	   $pinx{$pin} - 100, $piny{$pin}, $x, $piny{$pin});
    print "{\n";
    &pltext($pinx{$pin} + $px, $piny{$pin}, 1, $pinlabel{$pin});
    &ntext($pinx{$pin} -100, $piny{$pin} + 50, 6, $pin);
    print "}\n";
}

sub drawpin_right {
    my($pin) = @_;
    $x = $pinx{$pin};
    $px = 50;
    if ($bubble{$pin}) {
	$x += 100;
	&circle($x-50, $piny{$pin});
    }
    if ($edge{$pin}) {
	$px += 100;
	printf("L %d %d %d %d 3 0 0 0 0 0\n",
	       $pinx{$pin}, $piny{$pin}-50,
	       $pinx{$pin}-100, $piny{$pin});
	printf("L %d %d %d %d 3 0 0 0 0 0\n",
	       $pinx{$pin}-100, $piny{$pin},
	       $pinx{$pin}, $piny{$pin}+50);

    }
    printf("P %d %d %d %d 1 0 0\n",
	   $pinx{$pin} + 100, $piny{$pin}, $x, $piny{$pin});
    print "{\n";
    &pltext($pinx{$pin} - $px, $piny{$pin}, 7, $pinlabel{$pin});
    &ntext($pinx{$pin} +100, $piny{$pin} + 50, 0, $pin);
    print "}\n";
}

sub ntext {
    my ($x, $y, $a, $s) = @_;
    printf("T %d %d 5 8 1 1 0 %s 1\npinnumber=%s\n", $x, $y, $a, $s);
    printf("T %d %d 5 8 0 1 0 %s 1\npinseq=%s\n", $x, $y, $a, $s);
}

sub pltext {
    my ($x, $y, $a, $s) = @_;
    $s = "pinlabel=$s" unless $s =~ /=/;
    printf("T %d %d 9 10 1 1 0 %s 1\n%s\n", $x, $y, $a, $s);
}

sub pvltext {
    my ($x, $y, $a, $s) = @_;
    $s = "pinlabel=$s" unless $s =~ /=/;
    printf("T %d %d 9 10 1 1 90 %s 1\n%s\n", $x, $y, $a, $s);
}

sub ltext {
    my ($x, $y, $a, $s) = @_;
    printf("T %d %d 9 10 1 1 0 %s 1\n%s\n", $x, $y, $a, $s);
}

sub textlen {
    my($t) = @_;
    $t =~ s/^[^=]*=//;
    $t =~ s@\\_@@g;
    return length($t) * 110;
}

sub alignpin {
    my($v) = @_;
    return int(($v + 99) / 100) * 100;
}

exit $errors;
