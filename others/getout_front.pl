#!/usr/bin/perl
#@ARGV=(list file,fa file);
open SN,"<$ARGV[0]" or die "can't open file input.txt!";
$data=$ARGV[1];
open DATA,"<$data" or die "can't open file input.txt!";
@sn=<SN>;
@data=<DATA>;
chomp(@data,@sn);
$outfile=$ARGV[0]."_pick";
open OUT,">$outfile" or die "can't open file $outfile!";
for $sn(@sn){
	$check=0;	
for $line(@data){
	if ($check==1 and $line=~/^>/){
		$check=0;
	}
	if ($line=~/^$sn/){$check=1;}
	if ($check==1){print OUT $line."\n";}
}
}
close OUT,
