#!/bin/perl
# -*- perl -*-

# Perl Routines to Manipulate CGI input
# S.E.Brenner@bioc.cam.ac.uk
# $Header$
#
# Copyright 1994 Steven E. Brenner  
# Unpublished work.
# Permission granted to use and modify this library so long as the
# copyright above is maintained, modifications are documented, and
# credit is given for any use of the library.
#
# Thanks are due to many people for reporting bugs and suggestions
# especially Meng Weng Wong, Maki Watanabe, Bo Frese Rasmussen,
# Andrew Dalke, Mark-Jason Dominus and Dave Dittrich.

# For more information, see:
#     http://www.bio.cam.ac.uk/web/form.html       
#     http://www.seas.upenn.edu/~mengwong/forms/   

# Minimalist http form and script (http://www.bio.cam.ac.uk/web/minimal.cgi):
#
# require "cgi-lib.pl";
# if (&ReadParse(*input)) {
#    print &PrintHeader, &PrintVariables(%input);
# } else {
#   print &PrintHeader,'<form><input type="submit">Data: <input name="myfield">';
#}

# ReadParse
# Reads in GET or POST data, converts it to unescaped text, and puts
# one key=value in each member of the list "@in"
# Also creates key/value pairs in %in, using '\0' to separate multiple
# selections

# Returns TRUE if there was input, FALSE if there was no input 
# UNDEF may be used in the future to indicate some failure.

# Now that cgi scripts can be put in the normal file space, it is useful
# to combine both the form and the script in one place.  If no parameters
# are given (i.e., ReadParse returns FALSE), then a form could be output.

# If a variable-glob parameter (e.g., *cgi_input) is passed to ReadParse,
# information is stored there, rather than in $in, @in, and %in.

sub ReadParse {
  local (*in) = @_ if @_;
  local ($i, $key, $val);

  # Read in text
  if ($ENV{'REQUEST_METHOD'} eq "POST") {
    read(STDIN,$in,$ENV{'CONTENT_LENGTH'});
  }
  if ($ENV{'QUERY_STRING'}) {
      $q = $ENV{'QUERY_STRING'};
      if ($q =~ /\+ACU-2BAAA-/) {
	  $q =~ s/\+ACU-2BAAA-//g;
	  $q =~ s/\+AD0-/=/g;
	  0 while $q =~ s/\+ACU-(..)/pack("c",hex($1))/ge;
      }
      $in .= "&" . $q;
      $in =~ s/^&//;
  }

  @in = split(/&/,$in);

  foreach $i (0 .. $#in) {
    # Convert plus's to spaces
    $in[$i] =~ s/\+/ /g;

    # Split into key and value.  
    ($key, $val) = split(/=/,$in[$i],2); # splits on the first =.

    # Convert %XX from hex numbers to alphanumeric
    $key =~ s/%(..)/pack("c",hex($1))/ge;
    $val =~ s/%(..)/pack("c",hex($1))/ge;

    # Convert to unix text format and trim
    $val =~ tr/\r//d;
    $val =~ s/[\n\r\t ]*$//;

    # Associate key and value
    $in{$key} .= "\0" if (defined($in{$key})); # \0 is the multiple separator
    $in{$key} .= $val;

    $in[$i] = $key;
  }

  return length($in); 
}

sub ParseCookies {
    local($c);
    for $c (split(/; +/, $ENV{"HTTP_COOKIE"})) {
	local ($cn,$cv) = split('=', $c,2);
	$cookie{$cn} = $cv;
    }
}

sub UrlEncode {
  local ($text) = @_;
  $text =~ s/([^a-zA-Z0-9_.-])/sprintf("%%%02x", ord($1))/ge;
  return $text;
}

sub HtmlEncode {
  local ($text) = @_;
  $text =~ s/\&/&amp;/g;
  $text =~ s/\</&lt;/g;
  $text =~ s/\>/&gt;/g;
  return $text;
}

# MyURL
# Returns a URL to the script
sub MyURL  {
  return  'http://' . $ENV{'SERVER_NAME'} .  $ENV{'SCRIPT_NAME'};
}

# PrintVariables
# Nicely formats variables in an associative array passed as a parameter
# And returns the HTML string.

sub PrintVariables {
  local (%in) = @_;
  local ($old, $out, $output);
  $old = $*;  $* =1;
  $output .=  "<DL COMPACT>";
  foreach $key (sort keys(%in)) {
    foreach (split("\0", $in{$key})) {
      ($out = $_) =~ s/\n/<BR>/g;
      $output .=  "<DT><B>$key</B><DD><tt>$out</tt><BR>";
    }
  }
  $output .=  "</DL>";
  $* = $old;

  return $output;
}

sub Flush {
  $| = 1; print ""; $| = 0;
};

@weekday_names = ("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat");
@month_names = ( "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");

sub last_modified {
    local($ts) = @_;
    local($s,$m,$h,$dd,$mm,$yy,$ww) = gmtime($ts);
    $yy += 2000 if $yy < 80;
    $yy += 1900 if $yy < 200;
    return sprintf("Last-Modified: %s, %02d %s %04d %02d:%02d:%02d GMT\n",
		   $weekday_names[$ww], $dd, $month_names[$mm], $yy,
		   $s, $m, $h);
}

1; #return true 

