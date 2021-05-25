#!/bin/bash

for i in `find ./ -name "*.dta2d"`
do
  p=`dirname $i`
  name=`basename $i -pk2-ms2.dta2d`
  echo "Stat MS2 for $name"
  ./Eval-Stat-MS2.py $i > $name.stat
done

#find . -type f -empty -exec rm {} \;


