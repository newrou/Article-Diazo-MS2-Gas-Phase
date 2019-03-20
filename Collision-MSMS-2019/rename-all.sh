#!/bin/bash

#find . -name \*.mzdata.xml -exec cp '{}' . \;
for i in `find ./ -name "*.mzdata.xml"`
do
  p=`dirname $i`
  name=`basename $i .mzdata.xml`
  echo "rename "$i" to "$p/$name.mzData
  mv -f $i $p/$name.mzData
done

for i in `find ./ -name "*.mzdata"`
do
  p=`dirname $i`
  name=`basename $i .mzdata`
  echo "rename "$i" to "$p/$name.mzData
  mv -f $i $p/$name.mzData
done

for i in `find ./ -name "*Ev*.mzData"`
do
  p=`dirname $i`
  name=`basename $i .mzData`
  echo "rename Ev "$i" to "$p/$name.mzData
  rename "s/Ev/eV/" $p/$name.mzData
done
