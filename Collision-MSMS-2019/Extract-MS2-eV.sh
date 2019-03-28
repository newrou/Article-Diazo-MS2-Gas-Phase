#!/bin/bash

in=`basename $1 .mzData`
FileConverter -in $in.mzData -out tmp-ms2.mzML

FileFilter -in tmp-ms2.mzML -out tmp-ms2-pk1.mzML -pc_mz $3:$4 -spectra:select_activation 'Collision-induced dissociation' -int 500: -rt $5:$6 -mz :700
FileConverter -in tmp-ms2-pk1.mzML -out tmp-ms2.dta2d
php ../Integrate-MS2.php tmp-ms2.dta2d $3 > tmp-ms2.dat
Diss=`tail -n 1 tmp-ms2.dat`
echo "$2; $Diss;" >> Diss.dat

sed -e "s/Spectr/[$7] $2 eV/" <../Plot-Integrated-MS2.gnu >Plot-Integrated-MS2.gnu
gnuplot Plot-Integrated-MS2.gnu

mv tmp-ms2.dat $2.dat
mv tmp-ms2.svg $2.svg
rm tmp-ms2.mzML tmp-ms2-pk1.mzML tmp-ms2.dta2d
