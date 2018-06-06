#!/bin/bash

p=`pwd`
dname=`basename $p`
mkdir -p img

for i in `find ./ -name "*.svg"`
do
  name=`basename $i .svg`
  d=`dirname $i`
  echo "convert $d/$name"
  convert $d/$name.svg $d/$name.png
  mv $d/$name.png $p/img
done
