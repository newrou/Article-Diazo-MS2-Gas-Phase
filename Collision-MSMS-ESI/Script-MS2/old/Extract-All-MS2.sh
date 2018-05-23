#!/bin/bash

for i in `find ./ -name "*.mz[dD]ata"`
do
  p=`dirname $i`
  name=`basename $i .mzdata.xml`
  echo "Extract MS2 for "$name" in "$p
#  mv -f $i $p/$name.mzData
done
