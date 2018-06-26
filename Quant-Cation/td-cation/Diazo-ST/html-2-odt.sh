
list=`ls *.html`
for i in $list
do
  echo "Convert $i to odt"
  libreoffice --headless --writer --convert-to odt $i
done

#libreoffice --headless --writer --convert-to odt $1
#unoconv -f ods $1
