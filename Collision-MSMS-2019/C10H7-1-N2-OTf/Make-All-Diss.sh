#!/bin/bash

#./start-R.sh Eval-Diss.R Diss

echo "Collision; Diss;" > Eval-Diss.dat
cat Diss.dat >> Eval-Diss.dat
Rscript --vanilla Eval-Diss.R Eval-Diss 1.2 -1.2 $5 $6 $7 $8 $9 $10 | tee Eval-Diss.log
