#!/usr/bin/perl
#@ARGV=(input_file_name,derived_from)
$data=$ARGV[0];
open DATA,"<$data" or die "can't open file input.txt!";
@data=<DATA>;
chomp(@data);
$outfile=$ARGV[0].".gtf";
open OUT,">$outfile" or die "can't open file $outfile!";
for $line(@data){
	if ($line=~/^>/){
		$line=~/comp(\d+..\d+)_seq(\d+)\slen=(\d+)/;
		print OUT "comp".$1."_seq".$2."\t".$ARGV[1]."\t"."exon"."\t"."1"."\t".$3."\t"."\."."\t"."\."."\t"."\."."\t".'gene_id "'."comp".$1.'"'.'; '.'transcript_id "'."comp".$1."_seq".$2.'"'."\n";
		}
		}
	close OUT,