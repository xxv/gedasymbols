#!/usr/bin/perl
# -*- perl -*-

use Text::CSV;

$| = 1;

$file = $ENV{'PATH_TRANSLATED'};
$footprint = $ENV{'PATH_INFO'};
$footprint =~ s@.*/@@;
$docroot = $ENV{'DOCUMENT_ROOT'};

if ( ! -f $file ) {
    print "Content-type: text/html\n\n";
    $file =~ s@$docroot@@;
    print "File <tt>$file</tt> not found.\n";
    exit 0;
}

$base = $file;
$base =~ s@/[^/]*$@@;
chdir $base;

if ($ENV{'QUERY_STRING'} eq "dl") {
    print "Content-type: text/plain\n\n";
    open(CSV, $file);
    print while <CSV>;
    exit 0;
}

$file =~ s@.*/@@;

print "Content-type: text/html\n\n";

open(CSV, $file);
@csv = <CSV>;
close CSV;

grep (@csv, s/[\r\n]+$//);

$i = 0;

$title = $file;
if ($csv[0] !~ /,/ && $csv[0] !~ /=/) {
    $title = $csv[0];
    $i ++;
}

open(H, "$docroot/header.html");
while (<H>) {
  s/<!--#echo var="title" -->/$title/g;
  print;
}
close H;

$header = "<p align=center><table class=lined>\n";
while ($i < @csv && $csv[$i] !~ /,/) {
    ($key, $value) = split('=', $csv[$i], 2);
    $key =~ s/ +//g;
    $value =~ s/^ +//;
    $value =~ s/ +$//;
    $value =~ s/\s+/ /g;
    print $header;
    $header = '';
    push(@fieldnames, $key);
    push(@vals, $value);
    $i ++;
}
if (!$header) {
    &row("th", @fieldnames);
    &row("td", @vals);
    print "</table></p>\n";
}

print "<p align=center><table class=lined>\n";

$parser = Text::CSV->new();

$parser->parse($csv[$i]);
@fieldnames = $parser->fields();
&row("th", @fieldnames);
$i ++;

while ($i < @csv) {
    $parser->parse($csv[$i]);
    @fields = $parser->fields();
    &row("td", @fields);
    $i ++;
}
print "</table>\n";

sub row {
    my ($tag, @cells) = @_;
    print "<tr>\n";
    for ($ci=0; $ci < @cells; $ci++) {
	&cell($tag, $fieldnames[$ci], $cells[$ci]);
    }
    print "</tr>\n";
}

sub cell {
    my ($tag, $field, $cell) = @_;
    if ($tag =~ "td" && $field =~ /symbol/i) {
	&link($cell, '.sym');
    } elsif ($tag =~ "td" && $field =~ /foot/i) {
	&link($cell, '.fp');
    } else {
	print "<$tag>$cell</$tag>\n";
    }
}

sub link {
    my($cell, $suff, $ct) = @_;
    $ct = $cell;
    $ct =~ s/$suff$//;
    if (-f $cell) {
	print "<td><a href=\"$cell\">$ct</a></td>\n";
	return;
    }
    if ($cell !~ m@$suff$@) {
	$cell = "$cell$suff";
    }
    if (! $did_find && $cell !~ m@/@) {
	open(F, "find * -type f -print |");
	while (<F>) {
	    chomp;
	    $fbase = $_;
	    $ffile = $fbase;
	    $ffile =~ s@.*/@@;
	    $found{$ffile} = $fbase;
	}
	$did_find = 1;
    }
    if ($found{$cell}) {
	print "<td><a href=\"$found{$cell}\">$ct</a></td>\n";
	return;
    }
    print "<td>$ct</td>\n";
}

($filesize,$filetime) = (stat($file))[7,9];

print "<p align=center><a href=\"$file?dl\">Download</a> - $filesize bytes</p>\n";

print "<p align=center><a href=\"/csv.html\">CSV Instructions</a></p>\n";

$year = (localtime($filetime))[5] + 1900;
open(TR, "$docroot/trailer.html");
while (<TR>) {
    s@<!--#config timefmt="[^>]*" -->@@;
    s@<!--#echo var="LAST_MODIFIED" -->@$year@;
    print;
}
close TR;

exit (0);
