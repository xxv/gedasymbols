#!/usr/bin/perl
# -*- perl -*-
#
# $Id$
#

$root = $ENV{'DOCUMENT_ROOT'};
$dir = "$root/footprints";

sub cachefile {
    my ($name) = @_;
    $name =~ s@$docroot/@@;
    $name =~ s@/@_@g;
    $name = "m4lib/$name.fp";
    return $name;
}


sub urlesc {
    my ($str) = @_;
    $str =~ s/\\ /\%20/g;
    $str =~ s/ /\%20/g;
    return $str;
}

sub unesc {
    my ($str) = @_;
    $str =~ s/\%20/ /g;
    return $str;
}

$query = $ENV{'QUERY_STRING'};
$q2 = &unesc( $query );
exit 0 if $q2 =~ m/([^a-zA-Z0-9_\-. ])/;
$q2 =~ m/([a-zA-Z0-9_\-. ]*)/;
$footprint = "$1";

$fp = &cachefile($footprint);
$fpesc = $fp;
$fpesc =~ s/ /\\ /g;
$url = &urlesc( $fp );

if (! -f $fp 
    || -M $fp > -M "./pcblib"
    || -M $fp > -M "./pcblib.contents" ) {
    open(C, "./pcblib.contents");
    while ($lib = <C>) {
	$lib =~ s/[\r\n]//g;
	next if( $lib =~ /^TYPE=/);
	
	my @words   = split ':', $lib;
	my $template = shift @words;
	my $package  = shift @words;
	my $value    = shift @words;
	my $comment = shift @words;
	$comment =~ m/(.*)(\[)([^\[]*)\]$/;
	$fp2 = "$3";

	if( "$fp2" eq "$footprint" ) {
	    
	    $ENV{"PATH"} = "";
	    open(M4, "| /usr/bin/m4 -R $dir/pcblib - > $fpesc");
	    print M4 "CreateObject(`$template', `$value', `$package')\n";
	    close(M4);
	    
	    print "Content-type: text/html\n\n";
	    print "<meta http-equiv=refresh content=\"0; URL=$url\">\n";
	    
	    exit 0;
	}
	
    }
} else {
    print "Content-type: text/html\n\n";
    print "<meta http-equiv=refresh content=\"0; URL=$url\">\n";
    
    exit 0;
}


print "Content-type: text/html\n\n";
print "<p>We're sorry, that footprint is not found\n</p>\n\n";

