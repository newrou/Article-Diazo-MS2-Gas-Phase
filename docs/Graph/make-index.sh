
echo "<html>" > index-auto.html
echo "<head><meta charset=\"utf-8\"/></head>" >> index-auto.html
echo "<body>" >> index-auto.html
echo "<h3>Графики зависимостей:</h3>" >> index-auto.html
echo "<ul>" >> index-auto.html

list=`ls *-n400`
for i in $list
do
  name=`basename $i .html | sed -e "s/-f-/ от /" | sed -e "s/dE0/\&Delta\;E<sub>0<\/sub>/" | sed -e "s/N2/N<sub>2<\/sub>/" `
  echo " <li><a href=\"$i\"> $name </a></li>" >> index-auto.html
done

echo "</ul>" >> index-auto.html
echo "</body>" >> index-auto.html
echo "</html>" >> index-auto.html
