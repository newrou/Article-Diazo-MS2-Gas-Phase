#!/bin/bash

#rm log

for i in `find ./ -mindepth 1 -maxdepth 1 -type d -printf "%f\n"`
do
  echo "Make $i"
  cd $i

#  sed -e "s/precursor/$i/" <../Plot-Diss.gnu >Plot-Diss.gnu
#  ./Make-All-MS2.sh $i >> log
#  gnuplot Plot-Diss.gnu
#  convert *.*.svg MSMS-$i.pdf

  echo "Collision; Diss;" > Eval-Diss.dat
  cat Diss.dat >> Eval-Diss.dat
  Rscript --vanilla ../Eval-Diss.R Eval-Diss 1.0 0.1 $i | tee Eval-Diss.log
#  rm $i-Diss.pdf
  mv Eval-Diss.pdf Diss-$i.pdf

  cd ..
done
