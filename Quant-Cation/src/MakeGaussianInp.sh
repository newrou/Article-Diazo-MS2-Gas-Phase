#!/bin/bash

basis=$1

# singlet RHF
mkdir -p inp-gaussian
cd src
list=`ls *.mol`
cd ..
for i in $list
do
   Name=`basename $i .mol`-R$1-$2-Singlet
   InName=$Name.gjf
   echo "New file: "$Name
#   echo "%chk=$Name.chk" > $InName
   cat head-gaussian | sed -e "s/METHOD/R$1/" | sed -e "s/BASIS/$3/" >> $InName
   echo "$Name" >> $InName
   echo "" >> $InName
   Charge="0 1"
   if [[ $i =~ "-.mol" ]] ; then 
      Charge="-1 1"
   fi
   if [[ $i =~ "+.mol" ]] ; then 
      Charge="1 1"
   fi
   if [[ $i =~ "++.mol" ]] ; then 
      Charge="2 1"
   fi
   echo "Charge: [$Charge]"
   echo "$Charge" >> $InName
   babel -imol src/$i -ogjf - | tail -n +6 >> $InName
   cat tail-gaussian >> $InName
   mv $InName inp-gaussian
done

# triplet UHF
for i in $list
do
   Name=`basename $i .mol`-U$1-$2-Triplet
   InName=$Name.gjf
   echo "New file: "$Name
#   echo "%chk=$Name.chk" > $InName
   cat head-gaussian | sed -e "s/METHOD/U$1/" | sed -e "s/BASIS/$3/" >> $InName
   echo "$Name" >> $InName
   echo "" >> $InName
   Charge="0 1"
   if [[ $i =~ "-.mol" ]] ; then 
      Charge="-1 3"
   fi
   if [[ $i =~ "+.mol" ]] ; then 
      Charge="1 3"
   fi
   if [[ $i =~ "++.mol" ]] ; then 
      Charge="2 3"
   fi
   echo "Charge: [$Charge]"
   echo "$Charge" >> $InName
   babel -imol src/$i -ogjf - | tail -n +6 >> $InName
   cat tail-gaussian >> $InName
   mv $InName inp-gaussian
done


# singlet UHF
mkdir -p inp-gaussian
cd src
list=`ls *.mol`
cd ..
for i in $list
do
   Name=`basename $i .mol`-U$1-$2-Singlet
   InName=$Name.gjf
   echo "New file: "$Name
#   echo "%chk=$Name.chk" > $InName
   cat head-gaussian | sed -e "s/METHOD/U$1/" | sed -e "s/BASIS/$3/" >> $InName
   echo "$Name" >> $InName
   echo "" >> $InName
   Charge="0 1"
   if [[ $i =~ "-.mol" ]] ; then 
      Charge="-1 1"
   fi
   if [[ $i =~ "+.mol" ]] ; then 
      Charge="1 1"
   fi
   if [[ $i =~ "++.mol" ]] ; then 
      Charge="2 1"
   fi
   echo "Charge: [$Charge]"
   echo "$Charge" >> $InName
   babel -imol src/$i -ogjf - | tail -n +6 >> $InName
   cat tail-gaussian >> $InName
   mv $InName inp-gaussian
done

