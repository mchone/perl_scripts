#!/usr/bin/perl
my($in)=@ARGV;
my $out=$in."_length";
open FAS,"<$in" or die ($!);
open OUT,">$out" or die ($!);

my @data=<FAS>;
chomp(@data);

#my $count = 0;
for $line(@data){
 if ($line =~ /^>/){
 print OUT $count."\n".$line."\n";
 $count = 0;
}
 elsif ($line !~ /^>/){
 $count += length($line);
}
}
print OUT $count;

close FAS;
close OUT;
