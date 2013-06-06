#/bin/sh

UPDATE_PACKAGE=~/kitchen/original_update/QX_Senseless_v2.0.zip

if [ "x$UPDATE_PACKAGE" = "x" ]; then
    echo You must specify the update.zip as first argument
    exit
fi

BASE=../../../vendor/htc/evitareul/proprietary
rm -rf $BASE/*

for FILE in `egrep -v '(^#|^$)' proprietary-files.txt`; do
  DIR=`dirname $FILE`
  if [ ! -d $BASE/$DIR ]; then
    mkdir -p $BASE/$DIR
  fi
  unzip -j -o ${UPDATE_PACKAGE} system/$FILE -d $BASE/$DIR
done

./setup-makefiles.sh
