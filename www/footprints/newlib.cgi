#!/usr/bin/perl -T
# -*- perl -*-
#
# $Id$
#

print "Content-type: text/html\n\n";

$query = $ENV{'QUERY_STRING'};
$root = $ENV{'DOCUMENT_ROOT'} ;
$dir =  "$root/footprints/newlib/";

if ($query eq "") {

    opendir(D, "$dir");
    for $d (sort readdir D) {
	next if $d =~ /^\./;
	next if $d =~ /^CVS/;
	$d =~ s/[\r\n\s\t]+/ /g;
	$esclib = $d;
	$esclib =~ s/ /\%20/g;
	push(@lines, "$d\0<li><a href=\"./newlib.cgi?$esclib\">$d</a></li>\n");
    }

    closedir D;
    
    for $l (sort @lines) {
	($key, $link) = split(/\0/, $l);
	print "$link\n";
    }
    exit 0;
} else {

    open(H, "../header.html");
    while (<H>) {
	s/<!--#echo var="title" -->/PCB "$query" library/g;
	print;
    }
    close H;

    opendir(D, "$dir$query/");
    for $d (sort readdir D) {
	next if $d =~ /^\./;
	next if $d =~ /^CVS/;
	$d =~ s/[\r\n\s\t]+/ /g;
	$esclib = $d;
	$esclib =~ s/ /\%20/g;
	push(@lines, "$d\0<li><a href=\"./newlib/$query/$d\">$d</a></li>\n");
    }

    closedir D;
    
    print "<ul>\n";
    for $l (sort @lines) {
	($key, $link) = split(/\0/, $l);
	print "$link\n";
    }
    print "</ul>\n";

    $year = (localtime)[5] + 1900;
    
    open(T, "$../trailer.html");
    while (<T>) {
	s/<!--#echo var="LAST_MODIFIED" -->/$year/g;
	print;
    }
}
