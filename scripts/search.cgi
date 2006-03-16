#!/usr/bin/perl
# -*- perl -*-

print "Content-type: text/html\n\n";

require "/home/apache/bin/cgi-lib.pl";
&ReadParse();

$docroot = $ENV{'DOCUMENT_ROOT'};
$year = (localtime)[5] + 1900;

$key = $in{'key'};
$title = "Search $key";

open(H, "$docroot/header.html");
while (<H>) {
    s/<!--#echo var="title" -->/$title/g;
    print;
}
close(H);

print "<form action=\"search.cgi\">\n";
print "Search for: <input name=key size=40 value=\"$key\">\n";
print "<input type=submit value=\"go\">\n";
print "</form>\n";

if ($in{'key'}) {
    &show_results();
}

open(H, "$docroot/trailer.html");
while (<H>) {
    s/<!--#echo var="LAST_MODIFIED" -->/$year/g;
    print;
}
close(H);


sub show_results {
    $key =~ tr/A-Z/a-z/;
    @words = split(' ', $key);
    $maxcount = @words;
    $keyre = '(' . join('|', @words) . ')';

    open(C, "cache/search.idx");
    $found = 0;
    while (<C>) {
	next unless /$keyre/;
	$line = $_;
	$count = 0;
	for ($i=0; $i<@words; $i++) {
	    $count ++ if $line =~ /$words[$i]/;
	}
	if ($count == $maxcount) {
	    push(@allmatch, $line);
	} elsif ($count) {
	    push(@anymatch, $line);
	}
	$found = 1;
    }
    close C;

    open(C, "$docroot/footprints/pcblib.contents");
    while (<C>) {
	if (/^TYPE=(.*)/) {
	    $type = $1;
	}
	next unless /$keyre/;
	$line = $_;
	$count = 0;
	for ($i=0; $i<@words; $i++) {
	    $count ++ if $line =~ /$words[$i]/;
	}
	($fp) = $line =~ m@\[(.*)\]$@;
	if ($count == $maxcount) {
	    push(@allmatch, "\@$fp\0$type\0$line");
	} elsif ($count) {
	    push(@anymatch, "\@$fp\0$type\0$line");
	}
	$found = 1;
    }
    close C;

    if (!$found) {
	print "<p>Nothing matches any of your terms</p>\n";
	return;
    }

    if (@allmatch) {
	if ($maxcount == 1) {
	    print "<p>Results matching your term:<br>\n";
	} else {
	    print "<p>Results matching all your terms:<br>\n";
	}
	&dump(@allmatch);
    }
    if (@anymatch) {
	print "<p>Results matching some your terms:<br>\n";
	&dump(@anymatch);
    }

}
sub dump {
    my(@match) = @_;
    $where = '';
    for $line (sort @match) {
	($fp, $type, $wline) = $line =~ /^@(.*)\0(.*)\0(.*)/;
	if ($wline) {
	    &where('m4lib');
	    print "<a href=\"/footprints/m4query.cgi?$1\">$wline</a><br>\n";
	} else {
	    ($url, $keys) = split(' ', $line);
	    $newwhere = $url;
	    $newwhere =~ s@/.*@@;
	    &where($newwhere);
	    print "<a href=\"/$url\">/$url</a><br>\n";
	}
    }
}

sub where {
    my($nw) = @_;
    return if $nw eq $where;
    $where = $nw;
    print "</p><p>";
}
