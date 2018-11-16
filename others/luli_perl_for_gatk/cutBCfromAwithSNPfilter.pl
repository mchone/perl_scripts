#!usr/bin/perl -w
##example $ perl cutBCfromAwithSNPfilter.pl A.vcf B.vcf C.vcf resultsname
use strict;
my($in1,$in2,$in3,$out)=@ARGV;
open HSE,"<$in1" or die ($!);
open HS,"<$in2" or die ($!);
open HSP,"<$in3" or die ($!);
open OU,">$out" or die ($!);

my %hash;
my %hse;
while(<HSE>){
        chomp;
        next if /^#/;
        next if /^Chr\D/;
        my @arr=(split/\t/);
        if(($arr[3] eq"G" && $arr[4] eq "A")or ($arr[3] eq "C" && $arr[4] eq "T")){
                $hse{$arr[0]}{$arr[1]}{$arr[4]}=$_;
        }
}

while(<HS>){
        chomp;
        next if /^#/;
        my @arr=split/\t/;
        if (exists $hse{$arr[0]}{$arr[1]}{$arr[4]}){
                delete $hse{$arr[0]}{$arr[1]}{$arr[4]};
        }
}

while(<HSP>){
        chomp;
        next if /^#/;
        my @arr=split/\t/;
        if (exists $hse{$arr[0]}{$arr[1]}{$arr[4]}){
                delete $hse{$arr[0]}{$arr[1]}{$arr[4]};
        }
}

for my $chr(sort keys %hse){
        for my $pos(sort{$a<=>$b} keys %{$hse{$chr}}){
                for my $var(keys %{$hse{$chr}{$pos}}){
                        print OU "$hse{$chr}{$pos}{$var}\n"
                }
        }
}

close HS;
close HSE;
close HSP;
close OU;
