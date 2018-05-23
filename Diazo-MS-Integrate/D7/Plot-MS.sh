#!/bin/bash

p=`pwd`
dname=`basename $p`

cp All-$dname.dat tmp-ms.dat 
gnuplot Plot-Integrated-MS.gnu
mv tmp-ms.svg All-$dname.svg
rm tmp-ms.dat 
