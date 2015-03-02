
$arc_cnt=@ARGV;
if ($arc_cnt<2) {
    print ("\n\n This program usage\n");
    print (" Useage $0 <input_file> <output_file>\n\n");
    exit -1;
}

$input_file=$ARGV[0];
$output_file=$ARGV[1];

open (IFILE, "<$input_file") ||
    die("Error: can't open file $input_file \n");
binmode(IFILE);
$length = read(IFILE,$buffer,0x1000000);
close (IFILE);

@istream = unpack("C*",$buffer);
#$length = @istream;

$tar_end = $length - 4;
$tar_start = ($istream[$length-4] << 24)+($istream[$length-3] << 16)+ ($istream[$length-2] << 8)+ ($istream[$length-1]);


open (OFILE, ">$output_file") ||
    die("Error: can't open file $output_file \n");
binmode(OFILE);
for ($i=$tar_start;$i<$tar_end;$i++)
{
	print (OFILE sprintf ("%c",$istream[$i]));
}
close (OFILE);

