#!usr/bin/perl -w
#pick up G->A or C->T mutant. 
##input=final_vcf files; output=flited SNPs caused by EMS(G-A C-T); 
#
use strict;
my($in,$out)=@ARGV;
open IN,"<$in" or die ($!);
open OU,">$out" or die($!);

while(<IN>){
	chomp;
	next if /^#/;
	next if /^Chr\D/;
	my @arr=split/\t/;
	if(($arr[3] eq "G" && $arr[4] eq "A")or ($arr[3] eq "C" && $arr[4] eq "T")){
		print OU "$_\n";
	}
}

close IN;
close OU;
