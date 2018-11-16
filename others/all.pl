#!/usr/bin/perl
#@ARGV=(name1_name2_final.txt,name1_name3_final.txt)
if($ARGV[0]=~/(.*)_(.*)_/){$name1=$1;$name2=$2;}
if($ARGV[1]=~/(.*)_(.*)_/){
    if($name1 ne $1){print "Input error!";}
    else{$name3=$2}
}
open DATA1,"<$ARGV[0]" or die "Cann't open file $ARGV[0]!";
open DATA2,"<$ARGV[1]" or die "Cann't open file $ARGV[1]!";
$outfile=$name1."_".$name2."_".$name3.".txt";
open OUT,">$outfile" or die "Cann't open file $outfile!";
@data1=<DATA1>;
@data2=<DATA2>;
chomp(@data1,@data2);
for($i=0;$i<=$#data1;$i++){
    if($data1[$i]=~/^>.*#/ and $data2[$i]=~/^>.*#/){
        print OUT "$data1[$i]\t$data2[$i]\n";
    }
}