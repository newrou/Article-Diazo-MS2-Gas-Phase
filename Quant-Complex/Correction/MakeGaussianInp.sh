#!/bin/bash

basis=$1

mkdir -p inp-gaussian
list=`ls *.mol`
for i in $list
do
   Name=`basename $i .mol`
   InName=`basename $i .mol`-$1-$2.gjf
   echo "New file2: "$InName
   echo "%chk=$Name-$1-$2.chk" > $InName
   cat head-gaussian | sed -e "s/METHOD/$1/" | sed -e "s/BASIS/$3/" >> $InName
   echo "$Name-$1-$2" >> $InName
   echo "" >> $InName
   Charge="1 1"
   if [[ $i =~ "-.mol" ]] ; then 
      Charge="-1 1"
   fi
   if [[ $i =~ "+.mol" ]] ; then 
      Charge="1 1"
   fi
   echo "Charge: [$Charge]"
   echo "$Charge" >> $InName
   babel -imol $i -ogjf - | tail -n +6 >> $InName
   cat tail-gaussian >> $InName
   mv $InName inp-gaussian
done
