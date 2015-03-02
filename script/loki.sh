TAR_FOLDER=$1

BIN_NAME=NAME.bin
OUT_PATH=BIN_PATH/

cp -rf $OUT_PATH/$BIN_NAME .

echo "add $TAR_FOLDER.tar to $BIN_NAME";

tar -jcv -f "$TAR_FOLDER.tar" $TAR_FOLDER;

SIZE_BIN=`stat -c '%s' $BIN_NAME`

cat "$TAR_FOLDER.tar" >> $BIN_NAME

TEMP_BIN=temp.bin

perl ./Loki/perl/genbin.pl $TEMP_BIN $SIZE_BIN

cat $TEMP_BIN >> $BIN_NAME

rm -f $TEMP_BIN

cp -f $BIN_NAME $OUT_PATH
