
cat src/Diazo+N2.csv > src/TD-All.dat
tail -n +2 src/Diazo-ST.csv >> src/TD-All.dat

php ./Plot-TD-Prop.php < Diazo.list | grep -v "0.00000;\ 0.00000;\ 0.00000;\ 0.00000;\ 0.00000;\ 0.00000;"> TD-Prop.csv

# Make Table
mkdir -p Table
#grep "N2\+" < Table-TD-ST.dat > Table-TD-ST-+N2.csv
#grep -v "N2\+" < Table-TD-ST.dat > Table-TD-ST-+.csv
php ./Table-TD-Prop.php < Diazo.list
php ./csv-2-html.php -t "Ar+ + N2 = Ar-N2+" < Table/Table-TD-Nitriding.csv > Table/Table-TD-Nitriding.html
php ./csv-2-html.php -t "Ar+(S) = Ar+(T)" < Table/Table-TD-ST-Ar+.csv  > Table/Table-TD-ST-Ar+.html
php ./csv-2-html.php -t "Ar-N2+(S) = Ar-N2+(T)" < Table/Table-TD-ST-Ar-N2+.csv > Table/Table-TD-ST-Ar-N2+.html

#firefox *.html
