#!/bin/bash

in=`basename $1 .mzData`
FileConverter -in $in.mzData -out tmp-ms2.mzML

FileFilter -in tmp-ms2.mzML -out tmp-ms2-pk1.mzML -pc_mz 50:200 -spectra:select_activation 'Collision-induced dissociation' -int 100: -rt :200 -mz :700
FileConverter -in tmp-ms2-pk1.mzML -out tmp-ms2.dta2d
php Integrate-MS2.php tmp-ms2.dta2d > tmp-ms2.dat
gnuplot Plot-Integrated-MS2.gnu
mv tmp-ms2.dat $in-pk1.dat
mv tmp-ms2.svg $in-pk1.svg

FileFilter -in tmp-ms2.mzML -out tmp-ms2-pk2.mzML -pc_mz 350:530 -spectra:select_activation 'Collision-induced dissociation' -int 100: -rt :200 -mz :700
FileConverter -in tmp-ms2-pk2.mzML -out tmp-ms2.dta2d
php Integrate-MS2.php tmp-ms2.dta2d > tmp-ms2.dat
gnuplot Plot-Integrated-MS2.gnu
mv tmp-ms2.dat $in-pk2.dat
mv tmp-ms2.svg $in-pk2.svg

rm tmp-ms2.mzML tmp-ms2-pk1.mzML tmp-ms2-pk2.mzML tmp-ms2.dta2d
