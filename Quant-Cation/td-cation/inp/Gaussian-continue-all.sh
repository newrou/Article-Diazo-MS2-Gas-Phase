#!/bin/bash

Method=UB3LYP
Basis=aug-cc-pVDZ
Mult=Triplet

list=`ls *.log`
for i in $list
do
  Name=`basename $i .log`
  Neg=`grep " Frequencies --" < $i | awk '{printf "%f\n%f\n%f\n", $3, $4, $5}' | grep "\-" | wc -l`
  grep " Frequencies --" < $i > /dev/null
  if [[ $Neg == "0" && $? == 0 ]] ; then 
    echo Skip [$Name]
  else
    mkdir -p Continue
    echo Continue [$Name]
    InName=Continue/$Name.gjf
#    echo "%chk=$Name.chk" > $InName
    cat head-gaussian | sed -e "s/METHOD/$Method/" | sed -e "s/BASIS/$Basis/" > $InName
    echo "$Name" >> $InName
    echo "" >> $InName
    babel -ig09 $i -ogjf - | tail -n +5 >> $InName
#    babel -ig09 $i -ogjf - | ./ShakeMol | tail -n +5 >> $InName
    cat tail-gaussian >> $InName
  fi
done

#grep " Frequencies --\| IR Inten    --" < $1 | awk '{key=$0; getline; print key "; " $0;}' | awk '{printf " %f; %f\n %f; %f\n %f; %f\n", $3, $9, $4, $10, $5, $11}'
#grep " Frequencies --" < $1 | awk '{printf "%f\n%f\n%f\n", $3, $4, $5}' | grep "\-" | wc -l 
#    grep "^ \%\|^ \#p" <$i > $Name.gjf
