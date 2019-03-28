#!/bin/bash

basis=$1

mkdir -p inp-orca
list=`ls *.mol`
for i in $list
do
   InName=`basename $i .mol`-$1-$2.orc
   Name=`basename $i .mol`
   echo "New file: "$Name
   cat head-orc | sed -e "s/METHOD/$1/" | sed -e "s/BASIS/$3/" > $InName
   Charge="* xyz 1 1"
   if [[ $i =~ "-.mol" ]] ; then 
      Charge="* xyz -1 1"
   fi
   if [[ $i =~ "+.mol" ]] ; then 
      Charge="* xyz 1 1"
   fi
   echo "Charge: [$Charge]"
   echo "$Charge" >> $InName
   babel -imol $i -ogjf - | tail -n +6 >> $InName
   cat tail-orc >> $InName
   mv $InName inp-orca
done
