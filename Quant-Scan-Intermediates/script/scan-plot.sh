#!/bin/bash

for i in *.relaxscanscf.dat; do
 Name=`basename "$i" .relaxscanscf.dat`
 echo $Name

 cp $Name.relaxscanact.dat relaxscanact
 cp $Name.relaxscanscf.dat relaxscanscf
 gnuplot scan-plot-svg.gnu
 mv scan.svg img/$Name.svg
 mv scan-eh.svg img/$Name-eh.svg
 rm relaxscanact
 rm relaxscanscf
 sort-scan-dat.php
done

