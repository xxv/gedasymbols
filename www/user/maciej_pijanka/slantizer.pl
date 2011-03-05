#!/usr/bin/perl
# GPL v2 
# Coding by Maciej Pijanka <maciej.pijanka@gmail.com>
# Idea by Phil Taylor
# big thank to DJ Delorie for providing storage at gedasymbols.org
use strict;
use Getopt::Long;

Getopt::Long::Configure(qw/bundling/);


my ($in_file, $out_file);
my ($slant, $dir) = (4,0);

my $result = GetOptions (
	"slant|s=i"	=> \$slant,
        "infile|i=s"	=> \$in_file,
	"outfile|o=s"	=> \$out_file,
	"reversed|r!"	=> \$dir,
);

if (!$result or !defined $in_file) {
	printf "Usage: %s [-s <slant>] -i <infile> [-o <outfile>] [-r]\n", $0;
	exit;
}

if (!defined $out_file) {
	my $p = $in_file;
	$p =~ s/\.pcb//i;
	$out_file = $p . '-new.pcb';
} elsif ($out_file eq $in_file) {
	printf "Sorry, %s can't work using same file as both input and output one\n", $0;
	exit;
}

printf STDERR "%s\n", $dir;

$slant *= -1 if ($dir == 1);

if ($slant == 0) {
	printf "Sorry, slant is used as divisor, it can't be zero..";
	exit;
}

open (IN, '<', $in_file) or die "Can't open input file (".$in_file."): $!";
open (OUT, '>', $out_file) or die "Can't open output file (".$out_file."): $!";

my $state = 0;

while (not eof IN) {
	my $line = <IN>;
	my $printed = 0;

	chomp $line;

	if ($line =~ /^Symbol/) {
		$state = 1;
	} 

	if ($state == 1 && $line =~ /^\($/) {
		$state ++;
	}

	if ($state == 2) {
		if ($line =~ /(^[ 	]*SymbolLine)\((\d+) (\d+) (\d+) (\d+) (\d+)\)(.*)$/) {
			my ($prefix, $x1, $y1, $x2, $y2, $thickness, $suffix) = ($1, $2, $3, $4, $5, $6, $7);
			$x1 += $y1/$slant;
			$x2 += $y2/$slant;
			printf OUT "%s[%d %d %d %d %d]%s\n", $prefix, $x1 * 100, $y1 * 100, $x2 * 100, $y2 * 100, $thickness * 100, $suffix;
			$printed = 1;
		} elsif ($line =~ /(^[ 	]*SymbolLine)\[(\d+) (\d+) (\d+) (\d+) (\d+)\](.*)$/) {
			my ($prefix, $x1, $y1, $x2, $y2, $thickness, $suffix) = ($1, $2, $3, $4, $5, $6, $7);
			$x1 += $y1/$slant;
			$x2 += $y2/$slant;
			printf OUT "%s[%d %d %d %d %d]%s\n", $prefix, $x1, $y1, $x2, $y2, $thickness, $suffix;
			$printed = 1;
		}
	}

	if ($printed == 0) {
		printf OUT "%s\n", $line;
	}
}

close OUT;
close IN;

