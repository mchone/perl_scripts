#!perl
use strict;
my $out_num=pop @ARGV;
my $foot=0;
my $file_num=1;
print $out_num;
while(<>){
	if($_=~/>.*/){$foot++};
	if($foot==$out_num+1){
		$foot=1;
		close OUT_FILE;
		$file_num++;
	};
	if(($foot==1)and($_=~/>.*/)){
		my $out_file.="out".$file_num;
		open OUT_FILE,">$out_file";
	};
	chomp;
	print OUT_FILE $_,"\n";
}
