#! usr/bin/perl -w
#calculate the percentage of variant genotype in the 10th column (between first and second ":" )
#of vcf files. For example, one 10th column: 0/1:173,141:282:99:255,0,255, answer is 
#141/(173+141)= 0.45,print as "0.XX" 2 floats.
#example $ perl percentage.pl input.vcf  output.vcfp
use strict;
my ($in,$out)= @ARGV;
open IN,"<$in" or die ($!);
open OU,">$out" or die ($!);

my %hash;
while (<IN>){
    chomp;
    next if /^#/;
    my $tmp=(split/:/)[5];
    my ($ref,$alt)=split(",",$tmp);
    my $per = $alt/($ref+$alt);
    printf OU "%.2f\t$_\n",$per;
}
