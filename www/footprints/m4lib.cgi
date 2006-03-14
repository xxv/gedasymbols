#!/usr/bin/perl -T
# -*- perl -*-
#
# $Id$
#

print "Content-type: text/html\n\n";


$query = $ENV{'QUERY_STRING'};

if ($query eq "") {
    open(C, "./pcblib.contents");
    while ($lib = <C>) {
	if( $lib =~ /^TYPE=/ ) {
	    $lib =~ s/^TYPE=//g;
	    $lib =~ s/[\r\n]//g;
	    $esclib = $lib;
	    $esclib =~ s/^~//g;
	    $esclib =~ s/ /\%20/g;
	    push(@lines, "$lib\0<li><a href=\"./m4lib.cgi?$esclib\">$lib</a></li>\n");
	}
    }
    close C;

    for $l (sort @lines) {
	($key, $link) = split(/\0/, $l);
	print "$link\n";
    }

} else {

    $query =~ s/%20/ /g;

    open(H, "../header.html");
    while (<H>) {
	s/<!--#echo var="title" -->/PCB "~$query" library/g;
	print;
    }
    close H;
    
    print "<ul>\n";

    open(C, "./pcblib.contents");
    $state = 0;
    $cnt = 0;
    while ($lib = <C>) {
	$cnt++;
	$lib =~ s/[\r\n]//g;
	if( $lib eq "TYPE=~$query" ) {
	    $state = 1;
	} elsif( $lib =~ /^TYPE=/ ) {
	    $state = 0;
	} elsif( $state == 1 ) {
	    my @words   = split ':', $lib;
	    my $templ   = shift @words;
	    my $pkg     = shift @words;
	    my $value    = shift @words;
	    my $comment = shift @words;
	    my $footprint = $comment;
	    $footprint =~ s/^.*\[//g;
	    $footprint =~ s/\]$//g;

	    my $footurl = $footprint;
	    $footurl =~ s/ /\%20/g;

	    $comment =~ s/\[[^\[]*\]$//g;

	    #push(@lines, "$footprint\0<li><a href=\"./m4query.cgi?template=$templ;value=$value;package=$pkg;footprint=$footurl\">$footprint</a> - $comment</li>\n");
	    #push(@lines, "$footprint\0<li><a href=\"./m4query.cgi?$cnt\">$footprint</a> - $comment</li>\n");
	    push(@lines, "$footprint\0<li><a href=\"./m4query.cgi?$footurl\">$footprint</a> - $comment</li>\n");
	}
    }

    close C;

    for $l (sort @lines) {
	($key, $link) = split(/\0/, $l);
	print "$link\n";
    }

    print "</ul>\n";

    $year = (localtime)[5] + 1900;
    
    open(T, "../trailer.html");
    while (<T>) {
	s/<!--#echo var="LAST_MODIFIED" -->/$year/g;
	print;
    }
}

