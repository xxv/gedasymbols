#!/usr/bin/perl
# -*- perl -*-

sub myexit {
    unlink @unlinks;
    exit 0;
}

sub e {
    my ($eq) = @_;

    $save_eq = $eq;
    $save_eq =~ s/.*=\s*//;

    ($target,$eq) = $eq =~ m@\s*([a-z]*)\s*=\s*(.*)@;
    if ($d{$target}) {
	return;
    }

    $neq = "\$v{$target} = ";

    while ($eq =~ m@([^a-z]*)([a-z]+)(.*)@) {
	$neq .= $1;
	$v = $2;
	$eq = $3;
	if (!$d{$v}) {
	    return;
	}
	if ($units{$v} eq '%') {
	    return;
	}
	$neq .= "\$v{$v}";
    }
    $neq .= $eq;
    eval $neq;
    $v{$target} = int($v{$target});
    $d{$target} = 1;
    $units{$target} = '';
    print "$target now $v{$target} ($save_eq)<br>\n" unless $quiet;
    $again = 1;
}

sub perc {
    my ($d, $s) = @_;
    return unless $units{$d} eq '%';
    if ($d{$s} && $units{$s} ne '%') {
	$peq = "$v{$d} \% of $s";
	$v{$d} = $v{$d} / 100 * $v{$s};
	$v{$d} = int($v{$d});
	print "$d now $v{$d} ($peq)<br>\n" unless $quiet;
	$units{$d} = '';
	$again = 1;
    }
}

sub line {
    my ($x1, $y1, $x2, $y2, $t) = @_;
    printf("\tElementLine[%d %d %d %d %d]\n",
	   $x1, $y1, $x2, $y2, $t);
}

sub arc {
    my ($x, $y, $r, $sa, $da, $t) = @_;
    printf("\tElementArc[%d %d %d %d %d %d %d]\n",
	   $x, $y, $r, $r, $sa, $da, $t);
}

sub boxc {
    my ($x, $y, $t) = @_;
    $x /= 2;
    $y /= 2;
    &line(-$x, -$y, -$x,  $y, $t);
    &line(-$x, -$y,  $x, -$y, $t);
    &line($x,  $y, -$x,  $y, $t);
    &line($x,  $y,  $x, -$y, $t);
}

sub box {
    my ($x1, $y1, $x2, $y2, $t) = @_;
    if (@_ == 3) {
	&boxc($x1, $y1, $x2);
	return;
    }
    &line($x1, $y1, $x1, $y2, $t);
    &line($x1, $y1, $x2, $y1, $t);
    &line($x2, $y2, $x1, $y2, $t);
    &line($x2, $y2, $x2, $y1, $t);
}

sub max {
    my ($v) = $_[0];
    my ($i);
    for ($i=1; $i<@_; $i++) {
	$v = $_[$i] if $v < $_[$i];
    }
    return $v;
}

sub min {
    my ($v) = $_[0];
    my ($i);
    for ($i=1; $i<@_; $i++) {
	$v = $_[$i] if $v > $_[$i];
    }
    return $v;
}

sub first {
    my ($i);
    for ($i=0; $i<@_; $i++) {
	return $_[$i] if $_[$i];
    }
    return 0;
}

sub run_with_check {
    my ($cmd) = @_;
    my ($rv, $msg);
    open(X, "$cmd 2>&1 |");
    $msg = join('<br>\n', <X>);
    close(X);
    if ($?) {
	print "Content-type: text/plain\n\n";
	print "Command failed: \"$cmd\"\n\n";
	print "$msg\n";
	&myexit();
    }
    
}

1;
