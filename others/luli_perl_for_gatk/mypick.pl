#!usr/bin/perl
my($in1,$in2,$out)=@ARGV;
open DATA,"<$in1" or die ($!);
open GFF,"<$in2" or die ($!);
open OUT,">$out" or die ($!);

my %data;
my %gff;
my %per;
while(<DATA>){
    chomp;
    next if /^chr/;
    my @arr=split/\t/;
    $data{$arr[0]}{$arr[1]}=$_;
}

while (<GFF>){
    chomp;
    next if /^#/;
    my @arr=split/\t/;
    my @tmp =split /;/, $arr[8];#gene loc
    for my $chr(keys %data){
        if ($chr eq $arr[0]){
            for my $pos(sort keys%{$data{$chr}}){
                if ($pos>=$arr[3] && $pos <=$arr[4]){
                 printf OUT "$data{$chr}{$pos}\t$tmp[0]\n";
               # printf OUT "$tmp[0]\t%.2f\t$vcf{$chr}{$pos}\n",$per{$chr}{$pos};
		}
	     next;
            }
        }
    }
}

close DATA;
close GFF;
close OUT;
