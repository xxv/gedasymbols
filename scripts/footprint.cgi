#!/usr/bin/perl
# -*- perl -*-

#open(STDERR, ">&STDOUT");
$| = 1;

if (0) {
    print "Content-type: text/plain\n\n";
    for $k (sort keys %ENV) {
	print "$k = $ENV{$k}\n";
    }
    print "PWD: ", `pwd`;
    exit 0;
}
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

$query = $ENV{'QUERY_STRING'};

if ($query eq "png") {
    &make_png();
} elsif ($query eq "dl") {
    &download(1);
} elsif ($query eq "view") {
    &download(0);
} elsif ($query eq "dlattr") {
    &download_attr();
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
		if (/license: (\S*)/) {
		    $license = $1;
		    if ( -f "$docroot/licenses/$license.html") {
			s@license: (\S*)@license: <a href="/licenses/$license.html">$1</a>@;
		    }
		}
		push (@notes, "$_<br>\n");
	    }
	    while (<F>) {
		if (/Attribute\("(.*)" "(.*)"\)/) {
		    ($name, $value) = ($1,$2);
		    if ($name =~ /license/) {
			$license = $value;
			if ( -f "$docroot/licenses/$license.html") {
			    push(@notes, "$name: <a href=\"/licenses/$license.html\">$value</a><br>\n");
			} else {
			    push(@notes, "$name: $value<br>\n");
			}
		    } else {
			push(@notes, "$name: $value<br>\n");
		    }
		}
	    }
	    close F;
	    print sort @notes;
	} else {
	    print;
	}
    }
    $year = (localtime($filetime))[5] + 1900;
    open(TR, "../www/trailer.html");
    while (<TR>) {
	s@<!--#config timefmt="[^>]*" -->@@;
	s@<!--#echo var="LAST_MODIFIED" -->@$year@;
	print;
    }
    exit 0;
}

sub download {
    my ($savetofile) = @_;
    print "Content-type: text/plain\n";
    ($filesize,$filetime) = (stat($file))[7,9];
    print "Content-size: $filesize\n";
    print "Content-Disposition: attachment; filename=$symbol\n" if $savetofile;
    print "\n";
    open(F, $file);
    print while <F>;
    close F;
    exit 0;
}

sub download_attr {
    print "Content-type: text/plain\n";
    ($filesize,$filetime) = (stat($file))[7,9];
    $outline = qq!\tAttribute("gedasymbols::url", "http://$ENV{'HTTP_HOST'}$ENV{'PATH_INFO'}")\n!;
    $filesize += length($outline);
    print "Content-size: $filesize\n";
    print "\n";
    open(F, $file);
    while (<F>) {
        print;
        if (/^\s*\(\s*$/) { print $outline; }
    }
    close F;
    exit 0;
}

sub cachefile {
    my ($name) = @_;
    $name =~ s@$docroot/@@;
    $name =~ s@[^a-zA-Z0-9-_\.]@_@g;
    $name = "cache/$name";
    return $name;
}

sub make_png {

    $tmp = "/tmp/footprint$$.pcb";
    $eps = "/tmp/footprint$$.eps";
    $png = &cachefile($file);

    if (! -f $png
	|| -M $png > -M $0
	|| -M $png > -M $file) {

	open(TMP, ">$tmp");

	open(TEMPLATE, "footprint.pcb");
	while (<TEMPLATE>) {
	    last if /ELEMENT/;
	    print TMP;
	}

	open(E, $file);
	while (<E>) {
	    if (/Layer\((\d+) .*\)/) {
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
	    if (/LAYER(\d+)$/) {
		print TMP $layer{$1};
	    } else {
		print TMP;
	    }
	}

	close TEMPLATE;
	close TMP;

	$cmd = "./pcb -x eps --eps-file $eps --only-visible $tmp";
	open (PCB, "$cmd 2>&1 |");
	while (<PCB>) {
	    $msg .= $_;
	    next if /unknown action/;
	}
	close PCB;
	if ($?) {
	    print "Content-type: text/plain\n\n";
	    print "pcb conversion failed, command:\n$cmd\n\n";
	    print $msg;
	    print "\n";
	    &dump_pcb();
	    exit 0;
	}
	if (system "./eps2png -o $png -resolution 100 -minarea 2000 $eps") {
	    print "Content-type: text/plain\n\n";
	    print "EPS conversion failed\n";
	    print $msg;
	    open(EPS, $eps);
	    print while <EPS>;
	    close EPS;
	    print "<hr>\n";
	    &dump_pcb();
	}

	unlink $tmp;
	unlink $eps;
    }

    $size = (stat($png))[7];

    print "Content-type: image/png\n";
    print "Content-length: $size\n";
    print "\n";
    open (PNG, $png);
    print $v while read(PNG, $v, 4096) > 0;
    close PNG;


    exit 0;
}

sub dump_pcb {
    open(PCB, $tmp);
    $line = 0;
    while (<PCB>) {
	$line ++;
	$skip = 1 if /^Symbol/;
	if ($skip) {
	    $skipped = 1;
	} else {
	    print "\n" if $skipped;
	    $skipped = 0;
	    printf("%4d: $_", $line);
	}
	$skip = 0 if /^\)/;
    }
    close PCB;
}
