#!/usr/bin/perl
use warnings;
use strict;
my$usage="distrub.pl blast.xml ouput";
die $usage if @ARGV!=2;
my ($input,$output)=@ARGV;


open IN,'<',$input;
open OUT,'>',$output;

while (<>) {
   chomp;
          print OUT "Query:$1\n" if (/<Iteration_query-def>(.*)path/);
          print OUT "Hit_id:$1\n" if(/<Hit_id>(\S+?)<\/Hit_id>/);
          print OUT "Hit_def:$1\n" if(/<Hit_def>(.*?)<\/Hit_def>/);
          print OUT "Evalue:$1\n" if(/<Hsp_evalue>(.*)<\/Hsp_evalue>/);  
           
}

close IN;
close OUT;
