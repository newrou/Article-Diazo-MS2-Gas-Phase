#!/bin/bash

list=`ls *.out`
for i in $list
do
 Name=`basename $i .out`
 echo "Sort files: "$Name
 mkdir -p $Name
 mv $Name.* $Name
done
