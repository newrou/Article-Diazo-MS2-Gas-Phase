#!/bin/bash

basis=$1

mkdir -p inp-orca
list=`ls *.mol`
for i in $list
do
   InName=`basename $i .mol`-$1-$2-scan-d09-49-n400.orc
   Name=`basename $i .mol`
   echo "New file: "$Name
   cat head-orc | sed -e "s/METHOD/$1/" | sed -e "s/BASIS/$3/" > $InName
   babel -imol $i -oxyz 2> /dev/null | php Make-Scan-Atom-Number.php >> $InName
   Charge="* xyz 0 1"
   if [[ $i =~ "--." ]] ; then 
      Charge="* xyz -2 1"
   fi
   if [[ $i =~ "-." ]] ; then 
      Charge="* xyz -1 1"
   fi
   if [[ $i =~ "++." ]] ; then 
      Charge="* xyz 2 1"
   fi
   if [[ $i =~ "+." ]] ; then 
      Charge="* xyz 1 1"
   fi
   echo "Charge: [$Charge]"
   echo "$Charge" >> $InName
   babel -imol $i -ogjf - | tail -n +6 >> $InName
   cat tail-orc >> $InName
   mv $InName inp-orca
done
