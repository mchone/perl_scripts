#!usr/bin/perl
my($in,$sq,$st,$ed,$out)=@ARGV;
open FAS,"<$in" or die ($!);
open OUT,">$out" or die ($!);

@data=<FAS>;
chomp(@data);
$check=0;	
for $line(@data){
  if ($check==1 and $line=~/^>/){$check=0;} 
  if ($line=~/^>$sq$/){$check=1;next;}
  if ($check==1){$seq.=$line;}
}
$seq =~ s/\s//g;

$len = abs($st-$ed)+1;

if (($st-$ed)>0){
$pick = substr ($seq,($ed-1),$len);
my @ele = split(//,$pick);
@ele = reverse @ele;
$pick = join "", @ele;
$pick =~ tr/AGCTagct/TCGAtcga/;
print OUT ">".$sq."\n".$pick."\n";
}
else{
$pick = substr ($seq,($st-1),$len);
print OUT ">".$sq."\n".$pick."\n";
}

close FAS;
close OUT;
