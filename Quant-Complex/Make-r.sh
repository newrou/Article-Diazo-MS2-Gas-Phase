#!/bin/bash


cd out
echo > ../Diazo-KA.r
echo -n > ../Diazo-2KA+.r
list=`ls *+.log`
for i in $list
do
  Name=`basename $i +.log`
  echo "$Name+ + TfO- = $Name-OTf" >> ../Diazo-KA.r
  echo "$Name+ + $Name-OTf = x2-$Name-OTf-v1" >> ../Diazo-2KA+.r
  echo "$Name+ + $Name-OTf = x2-$Name-OTf-v2" >> ../Diazo-2KA+.r
done
cd ..
