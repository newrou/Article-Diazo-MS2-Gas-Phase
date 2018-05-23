
name=`basename "$1" .fT`
cp "$1" fT.dat
gnuplot Plot-fT.gnu
mv fT.gif "$name-fT.gif"
rm fT.dat

#libreoffice $name.csv
