#!/usr/bin/perl
# -*- perl -*-

require "./math.pl";

push(@INC, split(':', $ENV{'PATH'}));
require "cgi-lib.pl";
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

if ($in{'units'} eq "mm") {
    $defunits = $mm;
} else {
    $defunits = $mil;
}

for $v ('c', 'cl', 'cw', 'g', 'm', 'pl', 'plc', 'ple', 'pt', 'pw', 'pwe',
	  'so', 'soc', 'sw') {
    $in{$v} =~ s/\s+//;
    $in{$v} =~ tr/A-Z/a-z/;
    if ($in{$v} =~ /^([\d\.]+)(mil|mm|%)?/) {
	$num = $1;
	$unit = $defunits;
	$unit = $mil if $2 eq 'mil';
	$unit = $mm if $2 eq 'mm';
	$unit = 1 if $2 eq '%';
	$v{$v} = $num * $unit;
	$v{$v} = int($v{$v}) if $2 ne '%';
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

    &perc('g', 'cl');
    &perc('pwe', 'cw');
    &perc('ple', 'cl');
    &e("cl = pl - 2 * ple");
    &e("g = pl - 2 * pt");
    &e("g = plc - pt");
    &e("pl = plc + pt");
    &e("pl = g + 2 * pt");
    &e("pl = plc + pt");
    &e("pl = cl + 2 * ple");
    &e("ple = (pl - plc)/2");
    &e("so = soc - sw/2");

    &e("cw = pw - 2 * pwe");
    &e("pwe = (pw - cw)/2");
    &e("pw = cw + 2 * pwe");

    &e("plc = pl - pt");
    &e("plc = g + pt");
    &e("plc = cl + 2 * pe - pt");
    &e("pt = (pl - g)/2");
    &e("pt = plc - g");
    &e("pt = (cl + ple*2 - g)/2");

    &e("soc = so + sw/2");
    &e("sw = (soc - so)*2");
}

&perc('c', 'g');
&perc('m', 'g');

$px = $v{'plc'} / 2;
$dx = $dy = 0;

if ($v{'pt'} > $v{'pw'}) {
    $dx = ($v{'pt'} - $v{'pw'}) / 2;
    $pt = $v{'pw'};
} else {
    $dy = ($v{'pw'} - $v{'pt'}) / 2;
    $pt = $v{'pt'};
}

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

print "Element[\"\" \"\" \"\" \"\" 0 0 0 0 0 100 \"\"]\n";
print "(\n";
printf("\tPad[%d %d %d %d %d %d %d \"1\" \"1\" \"square\"]\n",
       -$px + $dx, $dy, -$px-$dx, -$dy, $pt,
       $v{'c'}*2, $v{'m'}*2 + $pt);
printf("\tPad[%d %d %d %d %d %d %d \"2\" \"2\" \"square\"]\n",
       $px + $dx, $dy, $px-$dx, -$dy, $pt,
       $v{'c'}*2, $v{'m'}*2 + $pt);

if ($in{'pol'}) {
    &box($v{'cl'}, $v{'cw'}, 1);
}

$l = $v{'pl'}/2;
$w = $v{'pw'}/2;
$s = $v{'soc'};
$t = $v{'sw'};
&line(-$l, -$w-$s, $l+$s, -$w-$s, $t);
&line(-$l,  $w+$s, $l+$s,  $w+$s, $t);
&line($l+$s, -$w-$s, $l+$s,  $w+$s, $t);
&line(-$l-$s, -$w, -$l-$s,  $w, $t);
printf("\tElementArc[%d %d %d %d %d %d %d]\n",
       -$l, -$w, $s, $s, 0, -90, $t);
printf("\tElementArc[%d %d %d %d %d %d %d]\n",
       -$l,  $w, $s, $s, 0,  90, $t);

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
