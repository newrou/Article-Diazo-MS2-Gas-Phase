#!/bin/bash

#find . -name \*.mzdata.xml -exec cp '{}' . \;
for i in `find ./ -name "*.mzdata.xml"`
do
  p=`dirname $i`
  name=`basename $i .mzdata.xml`
  echo "rename "$i" to "$p/$name.mzData
  mv -f $i $p/$name.mzData
done
