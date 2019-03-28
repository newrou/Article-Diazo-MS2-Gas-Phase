#!/bin/bash

M1=$1
M2=$2
T1=$3
T2=$4

echo -n "" > Diss.dat

../Extract-MS2-eV.sh *Pos*-0eV-*.mzData    00.00 $M1 $M2 $T1 $T2 $5
../Extract-MS2-eV.sh *Pos*-0_1eV-*.mzData  00.10 $M1 $M2 $T1 $T2 $5
../Extract-MS2-eV.sh *Pos*-0_25eV-*.mzData 00.25 $M1 $M2 $T1 $T2 $5
../Extract-MS2-eV.sh *Pos*-0_5eV-*.mzData  00.50 $M1 $M2 $T1 $T2 $5
../Extract-MS2-eV.sh *Pos*-0_75eV-*.mzData 00.75 $M1 $M2 $T1 $T2 $5
../Extract-MS2-eV.sh *Pos*-1eV-*.mzData    01.00 $M1 $M2 $T1 $T2 $5
../Extract-MS2-eV.sh *Pos*-1_5eV-*.mzData  01.50 $M1 $M2 $T1 $T2 $5
../Extract-MS2-eV.sh *Pos*-2eV-*.mzData    02.00 $M1 $M2 $T1 $T2 $5
../Extract-MS2-eV.sh *Pos*-3eV-*.mzData    03.00 $M1 $M2 $T1 $T2 $5
../Extract-MS2-eV.sh *Pos*-4eV-*.mzData    04.00 $M1 $M2 $T1 $T2 $5
../Extract-MS2-eV.sh *Pos*-10eV-*.mzData   10.00 $M1 $M2 $T1 $T2 $5
../Extract-MS2-eV.sh *Pos*-20eV-*.mzData   20.00 $M1 $M2 $T1 $T2 $5
../Extract-MS2-eV.sh *Pos*-40eV-*.mzData   40.00 $M1 $M2 $T1 $T2 $5

gnuplot Plot-Diss.gnu
