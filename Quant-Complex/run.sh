
name=`basename $1 .r`
mkdir -p $name
mkdir -p $name/img
mkdir -p $name/mol
mkdir -p $name/out
mkdir -p $name/prop
mkdir -p $name/fT
php reaction-td-gaussian.php -r$name -T"298.15" -b"" > $name.csv
#php reaction-td-gaussian.php -r$name -T"298.15,348.15,353.15,358.15" -b"RB3LYP-aug-cc-pVDZ" > $name.csv
cp $name.csv r.dat
#gnuplot Plot-HSG.gnu
#mv r-298.gif $name/img/$name-298.gif
#mv r-348.gif $name/img/$name-348.gif
#mv r-353.gif $name/img/$name-353.gif
#mv r-358.gif $name/img/$name-358.gif
rm r.dat
mv $name.csv $name/$name.csv
cp $name.r $name/$name.r

cat $name/$name-ft.html >> $name/$name.html
rm $name/$name-ft.html

mv *.fT $name/fT
mv *.gif $name/img
cp mol/*.mol $name/mol
cp prop/*.prop $name/prop
#cp out/*.log $name/out

#libreoffice $name.csv
