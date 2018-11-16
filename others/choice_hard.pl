#!/usr/bin/perl

$outputfile=$ARGV[0].'.txt';
open OUT, ">$outputfile";
for($num=1;$num<=10;$num++){
print "begin\n";
$inputfile=@ARGV[0].$num.".txt";
open IN, "<$inputfile" or die"can't open input\n";

while($line=<IN>){
	chomp($line);
	(@temp,@i,@j)=(undef,undef,undef);
	if($line =~ /^Query=.*\#/){
		@temp=split /\#/,$line;
		@i=split /\s/,$temp[1];
		@j=split /\//,$temp[2];
		if(@j[1]>@i[3]*0.70){print OUT $line."\n";}
	}
	}
}