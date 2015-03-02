
BIN_NAME=$1
TAR_NAME=temp.tar

perl ./Loki/perl/gentar.pl $BIN_NAME $TAR_NAME

tar -jxv -f $TAR_NAME

rm $TAR_NAME
