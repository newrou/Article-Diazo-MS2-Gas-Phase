
echo "<html>" > index-auto.html
echo "<head><meta charset=\"utf-8\"/></head>" >> index-auto.html
echo "<body>" >> index-auto.html
echo "<h3>Спектры:</h3>" >> index-auto.html
echo "<ul>" >> index-auto.html

cd img
list=`ls *.png`
for i in $list
do
  name=`basename $i .png`
  ref="img/$name.png"
  echo " <li> <a href=\"$ref\"> $name </a> </li>" >> ../index-auto.html
done
cd ..
echo "</ul>" >> index-auto.html
echo "</body>" >> index-auto.html
echo "</html>" >> index-auto.html
