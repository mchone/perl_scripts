#!/usr/bin/perl
#@ARGV=(list file,fa file)
open SN,"<$ARGV[0]" or die "Cann't open file input.txt!";
$data=$ARGV[1];
open DATA,"<$data" or die "Cann't open file $data!";
@sn=<SN>;
@data=<DATA>;
chomp(@data,@sn);
$filename=0;
for $sn(@sn){
$check=0;
$filename++;
$outfile="lg_cs_".$filename;
open OUT,">>$outfile" or die "Cann't open file $outfile!";
for $line(@data){
if($check==1 and $line=~/^>/){
            	$check=0;
    }
            if($sn=~/^$line>|$line$/){$check=1;}
            if($check==1){print OUT $line."\n";}
    }
close OUT,
}
