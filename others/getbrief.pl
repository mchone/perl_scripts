#!/usr/bin/perl
#@ARGV=(input_file_name)
$outputfile=$ARGV[0].".hmmget";
open OUT, ">$outputfile";
open IN, "$ARGV[0]" or die"can't open input\n";
@data=<IN>;
chomp(@data);
$check=0; 
foreach $line(@data){
	if ($line=~/^Query:/ or $check==0){
		$check=0;
		print OUT $line."\n";
	}
	if ($line=~/^Domain annotation/){
		$check=1;
	}
}
close OUT