#!/usr/bin/perl
#@ARGV=(input_file_name)
if($ARGV[0] =~ /(.*)\.fa/){
	$name=$1;
	$in=$1.".fa";
	$out=$1."_mod.fa";
	$sn=$1.".sn";
}
open IN, "<$in" or die "Cann't open file $in!";
open OUT, ">$out" or die "Cann't open file $out!";
open SN, ">$sn" or die "Cann't open file $out!";
$num=0;
while(<IN>){
	chomp;
	if($_ =~ /^>/){
		$num++;
		print SN ">$name$num\t$_\n";
		$_=">$name$num"
	}
	print OUT $_."\n";
}