

$arc_cnt=@ARGV;
if ($arc_cnt<2) {
    print ("\n\n This program usage\n");
    print (" Useage $0 <file_name> <file_data>\n\n");
    exit -1;
}

$input_file=$ARGV[0];
$file_data=$ARGV[1];

$istream[0]=(($file_data>>24)&0xFF);
$istream[1]=(($file_data>>16)&0xFF);
$istream[2]=(($file_data>>8)&0xFF);
$istream[3]=$file_data&0xff;

$ostream = pack("C*", @istream);
open (OFILE, ">$input_file") ||
    die("Error: can't open file $input_file \n");
binmode(OFILE);
print (OFILE $ostream);
close (OFILE);
