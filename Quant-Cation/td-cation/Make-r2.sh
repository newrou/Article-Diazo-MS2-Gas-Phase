#!/bin/bash

echo -n > Diazo-ST.r
list=`cat Diazo.list`
for Name in $list
do
  echo "ST $Name"
  echo "$Name+-USinglet = $Name+-UTriplet" >> Diazo-ST.r
  echo "$Name-N2+-USinglet = $Name-N2+-UTriplet" >> Diazo-ST.r
done

echo -n > Diazo-SE.r
list=`cat Diazo.list`
for Name in $list
do
  echo "SE $Name"
  echo "$Name+-USinglet = $Name-UDoublet" >> Diazo-SE.r
  echo "$Name+-UTriplet = $Name-UDoublet" >> Diazo-SE.r
  echo "$Name-N2+-USinglet = $Name-N2-UDoublet" >> Diazo-SE.r
  echo "$Name-N2+-UTriplet = $Name-N2-UDoublet" >> Diazo-SE.r
done

echo -n > Diazo+N2.r
list=`cat Diazo.list`
for Name in $list
do
  echo "$Name + N2"
  echo "$Name+-USinglet + N2-USinglet = $Name-N2+-USinglet" >> Diazo+N2.r
  echo "$Name+-UTriplet + N2-USinglet = $Name-N2+-USinglet" >> Diazo+N2.r
  echo "$Name-UDoublet + N2-USinglet = $Name-N2-UDoublet" >> Diazo+N2.r
done
