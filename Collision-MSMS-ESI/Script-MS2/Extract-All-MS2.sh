#!/bin/bash

for i in `find ./ -name "*.mz[dD]ata"`
do
  p=`dirname $i`
  name=`basename $i .mzData`
  echo "Extract MS2 for "$name" in "$p
  ln $p/$name.mzData $name.mzData
  ./Extract-MS2.sh $name.mzData
  mv $name-pk1.* $p
  mv $name-pk2.* $p
  rm $name.mzData
done

#find . -type f -empty -exec rm {} \;
