#!usr/bin/perl
my($in1,$out)=@ARGV;
open DATA,"<$in1" or die ($!);
open OUT,">$out" or die ($!);
$ck=0;
@line=<DATA>;
chomp(@line);
for $line(@line){
if ($line=~/Query:(.*)/){
$para=$1;
$ck=1;
}
if ($line=~/Hit_id:(.*)/ and $ck==1){
$parb=$1;
$ck=2;
}
if ($line=~/Hit_def:(.*)/ and $ck==2){
$parc=$1;
$ck=3;
}
if ($line=~/Evalue:(.*)/ and $ck==3){
$pard=$1;
$ck=4;
}
if ($ck==4){
print OUT $para."\t".$parb."\t".$parc."\t".$pard."\n";
$ck=0;
}
}
close DATA;
close OUT;
