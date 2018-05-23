#!/bin/bash

in=`basename $1 .mzData`

FileConverter -in $in.mzData -out -$in.mzML

FileFilter -in $in.mzML -out $in-pk1.mzML -pc_mz 50:200 -spectra:select_activation 'Collision-induced dissociation' -int 100: -rt :200 -mz :700
FileConverter -in $in-pk1.mzML -out $in-pk1.dta2d
php Integrate-MS2.php $in-pk1.dta2d > $in-pk1.dat
rm $in-pk1.mzML $in-pk1.dta2d 
DATAFILE="'$in-pk1.dat'"
OUTFILE="'$in-pk1.svg'"
MZRANGE="0:200"
export DATAFILE OUTFILE MZRANGE
gnuplot Plot-Integrated-MS2.gnu

FileFilter -in $in.mzML -out $in-pk2.mzML -pc_mz 400:500 -spectra:select_activation 'Collision-induced dissociation' -int 100: -rt :200 -mz :700
FileConverter -in $in-pk2.mzML -out $in-pk2.dta2d
php Integrate-MS2.php $in-pk2.dta2d > $in-pk2.dat
rm $in-pk2.mzML $in-pk2.dta2d 
DATAFILE="'$in-pk2.dat'"
OUTFILE="'$in-pk2.svg'"
MZRANGE="0:500"
export DATAFILE OUTFILE MZRANGE
gnuplot Plot-Integrated-MS2.gnu
