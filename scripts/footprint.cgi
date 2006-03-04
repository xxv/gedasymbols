#!/usr/bin/perl
# -*- perl -*-

open(STDERR, ">&STDOUT");
$| = 1;

if (0) {
    print "Content-type: text/plain\n\n";
    for $k (sort keys %ENV) {
	print "$k = $ENV{$k}\n";
    }
    print "PWD: ", `pwd`;
    exit 0;
}

open(STDERR, ">&STDOUT");

$| = 1;

$file = $ENV{'PATH_TRANSLATED'};
$footprint = $ENV{'PATH_INFO'};
$footprint =~ s@.*/@@;

if ( ! -f $file ) {
    print "Content-type: text/html\n\n";
    print "File <tt>$file</tt> not found.\n";
    exit 0;
}

$query = $ENV{'QUERY_STRING'};

if ($query eq "png") {
    &make_png();
} elsif ($query eq "dl") {
    &download();
} else {
    &make_html();
}

sub make_html {
    print "Content-type: text/html\n\n";
    ($filesize,$filetime) = (stat($file))[7,9];
    if ($filesize > 100000) {
	$filesize = sprintf("%.1f Mb", $filesize/1000000.0);
    } elsif ($filesize > 900) {
	$filesize = sprintf("%.1f Kb", $filesize/1000.0);
    } else {
	$filesize = "$filesize bytes";
    }
    $footdate = scalar localtime $filetime;
    open(HTML, "footprint.html");
    while (<HTML>) {
	s/FOOTPRINT/$footprint/g;
	s/<fsize>/$filesize/g;
	s/<footsize>/$filesize/g;
	s/<footdate>/$footdate/g;
	if (/NOTES_HERE/) {
	    open(F, $file);
	    while (<F>) {
		last unless /^\#/;
		s/^\#\s*//;
		s/&/&amp;/;
		s/</&lt;/;
		s/>/&gt;/;
		s@email: (.*)@email: <a href="mailto:$1">$1</a>@;
		s@(http://\S+)@<a href="$1">$1</a>@;
		if (/license: (.*)/) {
		    $license = $1;
		    if ( -f "/home/gedasymbols/www/licenses/$license.html") {
			s@license: (.*)@license: <a href="/licenses/$license.html">$1</a>@;
		    }
		}
		print;
	    }
	    close F;
	} else {
	    print;
	}
    }
    exit 0;
}

sub download {
    print "Content-type: text/plain\n";
    ($filesize,$filetime) = (stat($file))[7,9];
    print "Content-size: $filesize\n";
    print "\n";
    open(F, $file);
    print while <F>;
    close F;
    exit 0;
}

sub make_png {

    $eps = "/tmp/footprint123.eps";
    $png = "/tmp/footprint123.png";
    $tmp = "/tmp/footprint123.pcb";
    open(TMP, ">$tmp");

    open(TEMPLATE, "footprint.pcb");
    while (<TEMPLATE>) {
	last if /ELEMENT/;
	print TMP;
    }

    open(E, $file);
    while (<E>) {
	if (/Layer\(([12]) .*\)/) {
	    $lno = $1;
	    $paren = <E>;
	    while (<E>) {
		last if /^\s*\)/;
		$layer{$lno} .= $_;
	    }
	} else {
	    print TMP;
	}
    }
    close E;

    while (<TEMPLATE>) {
	if (/LAYER(\d)/) {
	    print TMP $layer{$1};
	} else {
	    print TMP;
	}
    }

    close TEMPLATE;
    close TMP;

    open (PCB, "/home/gedasymbols/scripts/pcb -x eps --eps-file $eps --only-visible $tmp 2>&1 |");
    while (<PCB>) {
	next if /unknown action/;
    }
    close PCB;
    system "/home/gedasymbols/scripts/eps2png -o $png -resolution 100 $eps";

    $size = (stat($png))[7];

    print "Content-type: image/png\n";
    print "Content-length: $size\n";
    print "\n";
    open (PNG, $png);
    print $v while read(PNG, $v, 4096) > 0;
    close PNG;


    exit 0;
}
