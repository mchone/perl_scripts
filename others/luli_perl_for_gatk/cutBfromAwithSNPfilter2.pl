#!usr/bin/perl -w
use strict;
my($in1,$in2,$out)=@ARGV;
open HSE,"<$in1" or die ($!);
open HS,"<$in2" or die ($!);
open OU,">$out" or die ($!);

my %hash;
my %hse;
my %adda;
my %addt;
while(<HSE>){
        chomp;
        next if /^#/;
        next if /^Chr\D/;
        my @arr=(split/\t/);
        if(($arr[3] eq "G" && $arr[4] eq "A")or ($arr[3] eq "C" && $arr[4] eq "T")){
                $hse{$arr[0]}{$arr[1]}{$arr[4]}=$_;
        }elsif($arr[4] eq "A" ){
                $adda{$arr[0]}{$arr[1]}=$_;
        }elsif($arr[4]eq "T"){
                $addt{$arr[0]}{$arr[1]}=$_;
        }
}

while(<HS>){
        chomp;
        next if /^#/;
        my @arr=split/\t/;
        if (exists $hse{$arr[0]}{$arr[1]}{$arr[4]}){
                delete $hse{$arr[0]}{$arr[1]}{$arr[4]};
        }elsif(exists $adda{$arr[0]}{$arr[1]} && ($arr[4] eq "G")){
                $hse{$arr[0]}{$arr[1]}{$arr[4]}= $adda{$arr[0]}{$arr[1]};
        }elsif(exists $addt{$arr[0]}{$arr[1]} && ($arr[4] eq "C")){
                $hse{$arr[0]}{$arr[1]}{$arr[4]}=$addt{$arr[0]}{$arr[1]};
        }
}


for my $chr(sort keys %hse){
        for my $pos(sort{$a<=>$b} keys %{$hse{$chr}}){
                for my $var(keys %{$hse{$chr}{$pos}}){
                        print OU "$hse{$chr}{$pos}{$var}\n";
                }
        }
}



close HS;
close HSE;
close OU;
