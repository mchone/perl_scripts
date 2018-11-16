#!/usr/bin/perl
#@ARGV=(name1_name2_hard.txt,name2_name1_hard.txt)
open DATA1,"<$ARGV[0]" or die "Cann't open file $ARGV[0]";
open DATA2,"<$ARGV[1]" or die "Cann't open file $ARGV[1]";
if($ARGV[0]=~/(.*)_(.*)_/){
	($name1,$name2)=($1,$2);
	($sn1,$sn2)=($1.".sn",$2.".sn");
	open SN1,"<$sn1" or die "Cann't open file $sn1";
	open SN2,"<$sn2" or die "Cann't open file $sn2";
}
$outfile1=$name1."_".$name2."_final.txt";
$outfile2=$name2."_".$name1."_final.txt";
open OUT1,">$outfile1" or die "Cann't open file $outfile1";
open OUT2,">$outfile2" or die "Cann't open file $outfile2";
@data1=<DATA1>;
@data2=<DATA2>;
chomp(@data1,@data2);
$i=0;
while($line=<SN1>){
	chomp($line);
	$i++;
	if($line=~/(.*)\t/){$sn1[$i]=$1};
}
$i=0;
while($line=<SN2>){
	chomp($line);
	$i++;
	if($line=~/(.*)\t/){$sn2[$i]=$1};
}
for $line(@data1){
	if($line=~/Query= $name1(.*)\#>$name2(.*) L(.*)/){
		$sn1[$1].="#>".$name2.$2." L".$3;
		$sn2[$2].="#>".$name1.$1." L".$3;
	}
}
for $line(@data2){
	if($line=~/Query= $name2(.*)\#>$name1(.*) L(.*)/){
		$sn1[$2].="#>".$name2.$1." L".$3;
		$sn2[$1].="#>".$name1.$2." L".$3;
	}
}
($temp,@out1)=@sn1;
($temp,@out2)=@sn2;
for $line(@out1){print OUT1 "$line\n"};
for $line(@out2){print OUT2 "$line\n"};
