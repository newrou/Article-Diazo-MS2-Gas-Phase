#!/bin/bash

mkdir -p Plot-MS
#for i in `find ./ -name "*.mzML"`
cd All-MS1
for i in *.mzML
do
  name=`basename $i .mzML`
#  FileConverter -in $i -out tmp.dta2d
#  php ../Integrate-MS.php tmp.dta2d > ../Plot-MS/$name.dat
#  rm tmp.dta2d
done

for i in *.label
do
  name=`basename $i .label`
  cp ../Plot-MS-Template.gnu ../Plot-MS/$name.gnu
  ../Make-MS-gnuplot.py $name >> ../Plot-MS/$name.gnu
#  gnuplot $name.gnu
#  cd ..
done

cd ..
