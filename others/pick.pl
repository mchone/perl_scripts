#!/usr/bin/perl
my @sn = glob "*.seq";
foreach my $sn (@sn) {
	open DATA, '<', $sn or die $!;
	open OUT, '>', "$sn.out" or die $!;
	while (<DATA>) {
		chomp;
		print "$_\n";
		if (/.*?(TTATGG.*)/) { print OUT "$1\n" }
	}
	close OUT;
	close DATA;
}