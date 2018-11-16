#!usr/bin/perl -w
#example $perl SNPannotation.pl input.vcf rice.gff3 output.vcf
use strict;

my($in1,$in2,$out)=@ARGV;
open VCF,"<$in1" or die ($!);
open GFF,"<$in2" or die ($!);
open OU,">$out" or die ($!);

my %vcf;
my %gff;
my %per;
while(<VCF>){
    chomp;
    next if /^#/;
    my @arr=split/\t/;
    $vcf{$arr[0]}{$arr[1]}=$_;
    my $tmp=(split/:/)[5];
    my ($ref,$alt)=split(",",$tmp);
    my $per = $alt/($ref+$alt);
    $per{$arr[0]}{$arr[1]}=$per;
}

while (<GFF>){
    chomp;
    next if /^#/;
    my @arr=split/\t/;
    my @tmp =split /;/, $arr[8];#gene loc
    for my $chr(keys %vcf){
        if ($chr eq $arr[0]){
            for my $pos(sort keys%{$vcf{$chr}}){
                if ($pos>=$arr[3] && $pos <=$arr[4]){
                printf OU "$tmp[0]\t%.2f\t$vcf{$chr}{$pos}\n",$per{$chr}{$pos};
		}
	     next;
            }
        }
    }
}

close VCF;
close GFF;
close OU;
