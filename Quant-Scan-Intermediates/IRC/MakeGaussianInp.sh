#!/bin/bash

basis=$1

mkdir -p inp-gaussian
echo "" > inp-gaussian/start-all.bat
list=`ls *-TS.log`
for i in $list
do
   Name=`basename $i -TS.log`
   InName=$Name-IRC.gjf
   echo "New file: "$Name
   echo "%chk=$Name-IRC.chk" > $InName
   cat head-gaussian | sed -e "s/METHOD/$1/" | sed -e "s/BASIS/$3/" >> $InName
   echo "$Name" >> $InName
   echo "" >> $InName
   Charge="0 1"
   if [[ $i =~ "-.log" ]] ; then 
      Charge="-1 1"
   fi
   if [[ $i =~ "+.log" ]] ; then 
      Charge="1 1"
   fi
   echo "Charge: [$Charge]"
   echo "$Charge" >> $InName
   babel -ig09 $i -ogjf - | tail -n +6 >> $InName
   cat tail-gaussian >> $InName
   mv $InName inp-gaussian
   echo "g09.exe $InName" >> inp-gaussian/start-all.bat
done
