#!/bin/bash

#./start-R.sh Eval-Diss.R Diss

Rscript --vanilla Eval-Diss.R Diss 1.0 -1.0 $5 $6 $7 $8 $9 $10 | tee Eval-Diss.log
