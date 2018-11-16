#!usr/bin/perl
my($in1,$in2,$out)=@ARGV;
open GFF3,"<$in1" or die ($!);
open POS,"<$in2" or die ($!);
open OUT,">$out" or die ($!);
@line=<POS>;
@gff=<GFF3>;
chomp(@line,@gff);
for $line(@line){
@lin=split (":",$line);
my $ch=$lin[0];
my $start=$lin[1];
my $end=$lin[2];
for $gff3(@gff){
if ($gff3=~/^[^#]/){
	@gf=split ("\t",$gff3);
	my $chrg=$gf[0];
	my $type=$gf[2];
	my $startg=$gf[3];
	my $endg=$gf[4];
	my $strand=$gf[6];
	my $attr=$gf[8];
	}
	if ($ch==$chrg and $start>=$startg and $end<=$endg){
			print OUT $line."@".$chrg.":".$startg."-".$endg."\t"."Type:".$type."\t"."Strand:".$strand."\t"."Attributes:".$attr."\n";
		}	
}
}
}
close GFF3;
close POS;
close OUT;