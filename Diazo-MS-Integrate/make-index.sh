
echo "<html>" > index-auto.html
echo "<head><meta charset=\"utf-8\"/></head>" >> index-auto.html
echo "<body>" >> index-auto.html
echo "<h2>Спектры:</h2>" >> index-auto.html
#echo "<ul>" >> index-auto.html

cd img
list=`ls *.png`
for i in $list
do
  name=`basename $i .png`
  ref="img/$name.png"
  echo " <div><center><img src=\"$ref\" width=\"100%\"><br/> <h3>Fig. NN. ESI/MS of the $name in the positive mode.</h3><br/> </center><div>" >> ../index-auto.html
#  echo " <li> <img src=\"$ref\"> <h3>$name</h3> </li>" >> ../index-auto.html
done
cd ..
#echo "</ul>" >> index-auto.html
echo "</body>" >> index-auto.html
echo "</html>" >> index-auto.html
