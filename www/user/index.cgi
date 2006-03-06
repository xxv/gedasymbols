#!/usr/bin/perl
# -*- perl -*-

print "Content-type: text/html\n\n";

chdir $ENV{'DOCUMENT_ROOT'} . "/user/";

opendir(D, ".");
for $d (sort readdir D) {
    next if $d =~ /^\./;
    next unless -f "$d/index.html" || -f "$d/index.htm";
    open(I, "$d/index.html") || open(I, "$d/index.htm");
    $line = <I>;
    $line =~ s/[\r\n\s\t]+/ /g;
    next unless $line =~ /set var="title" value="([^\"]+)"/;
    $name = $1;
    $name =~ s/gedasymbols.org: //;
    next if $name =~ /Meaningful Title/;
    $key = $name;
    $key =~ tr/A-Z/a-z/;
    push(@lines, "$key\0<a href=\"/user/$d/\">$name</a>");
    close I;
}
closedir D;

if ($ENV{'REQUEST_URI'} ne "/user/") {
    for $l (sort @lines) {
	($key, $link) = split(/\0/, $l);
	print "$link<br>\n";
    }
    exit 0;
}


open(H, "../header.html");
while (<H>) {
    s/<!--#echo var="title" -->/Contributors/g;
    print;
}
close H;

print "<ul>\n";

for $l (sort @lines) {
    ($key, $link) = split(/\0/, $l);
    print "<li> $link\n";
}
print "</ul>\n";

$year = (localtime)[5] + 1900;

open(T, "../trailer.html");
while (<T>) {
    s/<!--#echo var="LAST_MODIFIED" -->/$year/g;
    print;
}
close T;
