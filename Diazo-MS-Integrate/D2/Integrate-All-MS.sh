#!/bin/bash

p=`pwd`
dname=`basename $p`

for i in `find ./ -name "*.mzData"`
do
  name=`basename $i .mzData`
  FileConverter -in $name.mzData -out tmp-ms.mzML
  FileFilter -in tmp-ms.mzML -out tmp-ms.mzML -int 100: -rt 33:65 -mz 40:2000
  FileConverter -in tmp-ms.mzML -out $name.dta2d
#  php Integrate-MS.php $name.dta2d > tmp-ms.dat
#  gnuplot Plot-Integrated-MS.gnu
#  mv tmp-ms.dat $name.dat
#  mv tmp-ms.svg $name.svg
  rm tmp-ms.mzML
done

echo "#SEC	MZ	INT" > All-$dname.dta
cat *.dta2d | grep -v "SEC" >> All-$dname.dta
php Integrate-MS.php All-$dname.dta > tmp-ms.dat
gnuplot Plot-Integrated-MS.gnu
mv tmp-ms.dat All-$dname.dat
mv tmp-ms.svg All-$dname.svg
rm *.dta2d
