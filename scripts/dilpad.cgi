#!/usr/bin/perl
# -*- perl -*-

require "./math.pl";

push(@INC, split(':', $ENV{'PATH'}));
require "./cgi-lib.pl";
&ReadParse();

$do = $in{'do'};
$quiet = 1 if $do eq "png";
if ($do eq "png") {
    $quiet = 1;
} elsif ($do eq "dl") {
    print "Content-type: application/pcb\n\n";
    $quiet = 1;
} else {
    print "Content-type: text/html\n\n";
    print "<title>Footprint Generator - DIL Pads</title>\n";
    print '<link rel="stylesheet" href="/gedasymbols.css" type="text/css">';
    print "<body>\n";
    print "<h1>Footprint Generator - DIL Pads</h1>\n";

    print "<table width=100%><tr><td>\n";
}
print "<tt>\n" unless $quiet;

$mm = 1000/25.4 * 100;
$mil = 100;

$comments = "";

if ($in{'units'} eq "mm") {
    $defunits = $mm;
    $comments .= "# units: MM\n";
} else {
    $defunits = $mil;
    $comments .= "# units: MIL\n";
}

for $v ('bl', 'bw', 'c', 'cw', 'e', 'g', 'll', 'lw', 'm',
	'pg', 'pl', 'plc', 'ple', 'pw', 'pwe', 'pxl',
	'so', 'soc', 'sw') {
    ($upv = $v) =~ tr/a-z/A-Z/;
    if ($in{$v}) {
	$comments .= "# $upv = $in{$v}\n";
    }
    $in{$v} =~ s/\s+//;
    $in{$v} =~ tr/A-Z/a-z/;
    if ($in{$v} =~ /^([\d\.]+)(mil|mm|%)?/) {
	$num = $1;
	$unit = $defunits;
	$unit = $mil if $2 eq 'mil';
	$unit = $mm if $2 eq 'mm';
	$unit = 1 if $2 eq '%';
	$v{$v} = $num * $unit;
	$v{$v} = $v{$v} if $2 ne '%';
	$d{$v} = 1;
	$units{$v} = $2;
	print "$v is $v{$v}<br>\n" unless $quiet;
    } else {
	$d{$v} = 0;
	eval "\$_$v = 0;";
    }
}

# the variables we want are pw, plc, pt, soc, and sw.

$again = 1;

while ($again) {
    $again = 0;

    &perc('g', 'bw');
    &perc('pwe', 'lw');
    &perc('ple', 'll');

    &e("cw = bw + 2 * ll");
    &e("cw = pxl - 2 * ll");
    &e("g = pxl - 2 * pl");
    &e("g = plc - pl");
    &e("pxl = plc + pl");
    &e("pxl = g + 2 * pl");
    &e("pxl = plc + pl");
    &e("pxl = cw + 2 * ple");
    &e("ple = (pxl - cw)/2");

    &e("lw = pw - 2 * pwe");
    &e("pwe = (pw - lw)/2");
    &e("pw = lw + 2 * pwe");
    &e("pw = e - pg");
    &e("pg = e - pw");
    &e("e = pw + pg");

    &e("plc = pxl - pl");
    &e("plc = g + pl");
    &e("plc = cw + 2 * ple - pl");
    &e("pl = (pxl - g)/2");
    &e("pl = plc - g");
    &e("pl = (cl + ple*2 - g)/2");

    &e("so = soc - sw/2");
    &e("soc = so + sw/2");
    &e("sw = (soc - so)*2");
}

&perc('c', 'pg');
&perc('m', 'pg');

$px = $v{'plc'} / 2;
$dx = $dy = 0;

if ($v{'pl'} > $v{'pw'}) {
    $dx = ($v{'pl'} - $v{'pw'}) / 2;
    $pt = $v{'pw'};
} else {
    $dy = ($v{'pw'} - $v{'pl'}) / 2;
    $pt = $v{'pl'};
}

$np = $in{'np'};
$np2 = $np/2;

$fpfile = "/tmp/fpgen$$.fp";
push(@unlinks, $fpfile);
open(FP, ">$fpfile");
select FP;

if ($do eq "png") {
    open(FPIN, "footprint.pcb") || die("fp.pcb: $?");
    while (<FPIN>) {
	last if /ELEMENT/;
	print;
    }
}

print $comments;

print "Element[\"\" \"dil-$in{'np'}-$in{'e'}\" \"U?\" \"val\" 0 0 0 0 0 100 \"\"]\n";
print "(\n";

# $ix and $iy are 0 for the upper left pad.

$pad1y = - ($np2-1) * $v{'e'} / 2;

for $pad (1..$np) {
    if ($in{'seq'} =~ /A/i) {
	$ix = ($pad <= $np2) ? 0 : 1;
	$iy = ($pad <= $np2) ? $pad-1 : $np-$pad;
    } elsif ($in{'seq'} =~ /B/i) {
	$ix = ($pad <= $np2) ? 0 : 1;
	$iy = ($pad <= $np2) ? $pad-1 : $pad-$np2-1;
    } elsif ($in{'seq'} =~ /C/i) {
	$ix = ($pad-1) % 2;
	$iy = int(($pad-1) / 2);
    } elsif ($in{'seq'} =~ /D/i) {
	$ix = ($pad <= $np2) ? 1 : 0;
	$iy = ($pad <= $np2) ? $pad-1 : $np-$pad;
    } elsif ($in{'seq'} =~ /E/i) {
	$ix = ($pad <= $np2) ? 1 : 0;
	$iy = ($pad <= $np2) ? $pad-1 : $pad-$np2-1;
    } elsif ($in{'seq'} =~ /F/i) {
	$ix = 1 - ($pad-1) % 2;
	$iy = int(($pad-1) / 2);
    }

    $x = $ix ? 1 : -1;
    $y = $pad1y + $v{'e'} * $iy;

    printf("\tPad[%d %d %d %d %d %d %d \"%s\" \"%s\" \"square\"]\n",
	   $x*($px+$dx), $y+$dy, $x*($px-$dx), $y-$dy, $pt,
	   $v{'c'}*2, $v{'m'}*2 + $pt,
	   $pad, $pad);
}

if ($in{'pol'}) {
    if ($d{'bw'} && $d{'bl'}) {
	&box($v{'bw'}, $v{'bl'}, 1);
    }
    if ($d{'cw'} && $d{'lw'} && $d{'bw'}) {
	$e = $v{'e'};
	for ($p=0; $p<$np2; $p++) {
	    &box(-$v{'cw'}/2, $pad1y-$v{'lw'}/2+$p*$e, -$v{'bw'}/2, $pad1y+$v{'lw'}/2+$p*$e, 100);
	    &box($v{'cw'}/2, $pad1y-$v{'lw'}/2+$p*$e, $v{'bw'}/2, $pad1y+$v{'lw'}/2+$p*$e, 100);
	}
    }
}

$s = $v{'soc'} * 2;
$t = $v{'sw'};

$l = &max($v{'bl'}, $v{'e'}*($np2-1)+$v{'pw'}+$s)/2;

if ($v{'g'} < 3 * $v{'so'} + 2 * $v{'sw'}
    || $v{'bw'} == 0 || $v{'bl'} == 0) {
    # Not enough space for silk in the middle, put it around the whole
    # footprint.

    $w = &max($v{'bw'}, $v{'cw'}+$s, $v{'pxl'}+$s)/2;
    $r = &max($v{'soc'}, ($v{'bl'} - ($v{'e'}*($np2-1)+$v{'pw'}))/2);

    &line(-$w+$r, -$l,  $w, -$l, $t);
    &line(-$w,  $l,  $w,  $l, $t);
    &line( $w, -$l,  $w,  $l, $t);
    &line(-$w,  $l, -$w, -$l+$r, $t);
    &arc (-$w+$r, -$l+$r, $r, 270, 90, $t);

} else {
    # Enough space to put the silk between the pads.

    $w1 = &first($v{'bw'}, $v{'cw'}+$s, $v{'pxl'}+$s)/2;
    $w2 = &min($v{'bw'}/2, $v{'g'}/2-$v{'soc'});

    $r = $v{'g'}/6;
    $r = &min($r, $l-$s);
    $r = &min($r, $w2);
    $r = &max($r, $v{'sw'}/2 + $w{'so'}/2);

    &arc (0, -$l, $r, 0, 180, $t);

    &line(-$w1, -$l,  -$r, -$l, $t);
    &line($r, -$l,  $w1, -$l, $t);
    &line(-$w1,  $l,  $w1,  $l, $t);

    &line( $w2, -$l,  $w2,  $l, $t);
    &line(-$w2,  $l, -$w2, -$l, $t);
}

print ")\n";

if ($do eq "png") {
    while (<FPIN>) {
	next if /LAYER/;
	print;
    }
    close FPIN;
}

select STDOUT;
close FP;

if ($do eq "png") {
    $png = "/tmp/fpgen$$.png";
    $eps = "/tmp/fpgen$$.eps";
    $h = "Content-type: text/plain\n\n";
    push(@unlinks, $eps);
    &run_with_check("./pcb -x eps --eps-file $eps --only-visible $fpfile");
    open(EPS, $eps);
    $scale = 100;
    while (<EPS>) {
	if (/BoundingBox: \d+ \d+ (\d+) (\d+)/) {
	    $scale = int(200 * 100 / &max($1,$2));
	    last;
	}
    }
    close EPS;
    push(@unlinks, $png);
    &run_with_check("./eps2png -o $png -resolution $scale $eps");
    print "Content-type: image/png\n\n";
    open(PNG, "$png");
    print while <PNG>;
    close PNG;
    &myexit();
}

if ($do eq "dl") {
    open(FP, $fpfile);
    print while <FP>;
    close FP;
    &myexit();
}

print "</td><td align=right>\n";

$me = $ENV{'REQUEST_URI'};
$me =~ s@.*/@@;
print "<img src=\"$me&do=png\">\n";
print "</td></tr><tr><td colspan=2 align=center><br>\n";
print "<p><table border=0 cellspacing=0 cellpadding=7><tr><td>\n";

$me = $ENV{'REQUEST_URI'};
$me =~ s@.*/@@;
$me =~ s@\?@/footprint.fp\?@;
print "<p align=center><a href=\"$me&do=dl\">Download</a></p>\n";

print "<pre>";
open(FP, $fpfile);
print while <FP>;
close FP;

print "</pre></td></tr></table>\n";

print "</tr></table>\n";

&myexit();
