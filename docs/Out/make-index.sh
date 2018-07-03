
#rename 's/B3LYP-aug-cc-pVDZ-//' *.log

echo "<html>" > index-auto.html
echo "<head><meta charset=\"utf-8\"/></head>" >> index-auto.html
echo "<body>" >> index-auto.html
echo "<h3>Оптимизированная геометрия и выходные файлы Gaussian 09:</h3>" >> index-auto.html
echo "<ul>" >> index-auto.html

list=`ls *.log`
for i in $list
do
  name=`basename $i .log`
  mol=`basename $i .log | sed -e "s/B3LYP-aug-cc-pVDZ-//"`.mol
  echo " <li><a href=\"$mol\">$name</a> <a href=\"$i\">(out)</a></li> " >> index-auto.html
done

echo "</ul>" >> index-auto.html
echo "</body>" >> index-auto.html
echo "</html>" >> index-auto.html
