#!/bin/bash

#rm log

for i in `find ./ -type d -mindepth 1 -maxdepth 1 -printf "%f\n"`
do
  echo "Make $i"
  cd $i
  ./Make-All-MS2.sh >> log
  cd ..
done
