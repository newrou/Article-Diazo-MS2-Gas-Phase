#!/bin/bash

#for i in `find ./ -name "*.mzML"`
for i in *.mzML
do
  name=`basename $i .mzML`
  FileConverter -in $i -out tmp.dta2d
  php ./Integrate-MS.php tmp.dta2d > Plot-MS/$name.dat
  rm tmp.dta2d
  cp Plot-MS-Template.gnu Plot-MS/$name.gnu
  ./Make-MS-gnuplot.py $name >> Plot-MS/$name.gnu
#  gnuplot Plot-MS.gnu
done
