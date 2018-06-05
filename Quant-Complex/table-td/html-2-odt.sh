
cd src
list=`ls *.csv`
for i in $list
do
  echo "Convert $i to odt"
  name=`basename $i .csv`
  php ../csv-2-html.php < $i > $name.html
  libreoffice --headless --writer --convert-to odt $name.html
  mv $name.html ..
  mv $name.odt ..
done


