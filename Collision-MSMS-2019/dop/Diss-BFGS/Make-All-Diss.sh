#!/bin/bash

#./start-R.sh Eval-Diss.R Diss

echo "Collision; Diss;" > Eval-Diss.dat
cat Diss.dat >> Eval-Diss.dat
Rscript --vanilla Eval-Diss.R Eval-Diss 1.0 0.1 | tee Eval-Diss.log
