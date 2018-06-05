#!/bin/bash

start=`pwd`
for i in `find . -type d`
do
  echo "[$i]"
  cd $i
  pwd
#  rename -v "s/CH3-C2H5/CH3-C2H4/" *
#  rename -v "s/1\,2-\(CH3\)2-C2H5/1\,2-\(CH3\)2-C2H3/" *
  rename -v "s/1\,2-\(CH3\)2-C2H3/1\,1-\(CH3\)2-C2H3/" *
  cd $start
done
