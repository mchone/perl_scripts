#!/usr/bin/perl
#@ARGV=(input_file_headname)
$outputfile=$ARGV[0].".txt";
open OUT, ">$outputfile";

for($num=1;$num<=10;$num++){
    $inputfile=$ARGV[0].$num;
    print "begin $inputfile\n";
    $linenum=1;
    $title="";
    open IN, "<$inputfile" or die"can't open input\n";

    while($in=<IN>)
    { chomp($in);
    if($in=~/^Query=/)
        {
         $title=$in;
         print OUT $in;
         $lineout=0
        }
    elsif($in=~/No hits found/)
    {

     print OUT "\n";
    }
    elsif($in=~/^>/)
       {
        if($lineout<$linenum){
        if($lineout>0)
        {print OUT $title;}
        print OUT "#".$in." ";
        for($i=0;$i<20;$i++)
        {
         $zin=readline(IN);
         chomp($zin);
         if($zin=~/^ Identities/)
         {
          @temp=split /\s+/,$zin;
          $evalue=$temp[3];
    
          print OUT "#Identities = ".$evalue."\n";
          $lineout++;
          last;
    
         }
         else
         {
          if($zin=~/(Length.*)/)
          {
          print OUT $1;
          }
         }
        }}
       }
    else
    {
    
    }
    }
    close IN;
    print"over\n";
}
