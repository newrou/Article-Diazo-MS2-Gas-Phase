#!/bin/bash

mkdir -p td
mkdir -p mol
mkdir -p prop

rm -f td/*.td
rm -f mol/*.mol
rm -f prop/*.prop
rm -f prop/*.mo

cd out
list=`ls *.log`
for i in $list
do
 Neg=`grep " Frequencies --" < $i | awk '{printf "%f\n%f\n%f\n", $3, $4, $5}' | grep "\-" | wc -l`
 if [[ $Neg == "0" ]] ; then 

    echo "Extract Gaussian file: "`basename $i .log`
    Name=../td/`basename $i .log`.td
    Prop=../prop/`basename $i .log`.prop
    MO=../prop/`basename $i .log`.mo

    echo -n "E0; "  > $Name
    grep "SCF Done:  E(RB3LYP) =" <$i | tail -n 1 | awk '{print $5}' >> $Name
    grep "SCF Done:  E(UB3LYP) =" <$i | tail -n 1 | awk '{print $5}' >> $Name

# echo -n "Zero-point correction; " >> $Name
# grep "Zero-point correction=" <$i | awk '{print $3}' >> $Name

# echo -n "Thermal correction to Energy; " >> $Name
# grep "Thermal correction to Energy=" <$i | awk '{print $5}' >> $Name

# echo -n "Thermal correction to Enthalpy; " >> $Name
# grep "Thermal correction to Enthalpy=" <$i | awk '{print $5}' >> $Name

# echo -n "Thermal correction to Gibbs Free Energy; " >> $Name
# grep "Thermal correction to Gibbs Free Energy=" <$i | awk '{print $7}' >> $Name

# echo -n "ZPE; " >> $Name
# grep "Sum of electronic and zero-point Energies=" <$i | awk '{print $7}' >> $Name

# echo -n "Sum of electronic and thermal Energies; " >> $Name
# grep "Sum of electronic and thermal Energies=" <$i | awk '{print $7}' >> $Name

 echo -n "T; " >> $Name
 grep " Temperature " <$i | awk '{print $2}' >> $Name

 echo -n "H; " >> $Name
 grep "Sum of electronic and thermal Enthalpies=" <$i | awk '{print $7}' >> $Name

# echo -n "Total CV; " <$i >> $Name
# grep " Total" <$i | head -n 1 | awk '{print $3}' >> $Name

 echo -n "S; " <$i >> $Name
 grep " Total" <$i | head -n 1| awk '{print 4.1868*$4}' >> $Name

 echo -n "G; " <$i >> $Name
 grep "Sum of electronic and thermal Free Energies=" <$i | awk '{print $8}' >> $Name

# mkdir -p ../mol
 babel -ig09 $i -omol ../mol/`basename $i .log`.mol
 babel -ig09 $i -oxyz 2> /dev/null | php ../Find-C-N-N.php > $Prop
 php ../Extract-Gaussian-LUMO-HOMO.php <$i >> $Prop
 php ../Extract-Gaussian-MO.php <$i >> $MO

# sed -e "s/\./\,/" <$Name >$Name.csv
# mv $Name td
 else
    echo Not optimized [$Name]
    mkdir -p ../cont
    cp $i ../cont
 fi
done

cd ..
rename 's/B3LYP-aug-cc-pVDZ-//' td/*.td
rename 's/B3LYP-aug-cc-pVDZ-//' mol/*.mol
rename 's/B3LYP-aug-cc-pVDZ-//' prop/*.prop
rename 's/B3LYP-aug-cc-pVDZ-//' prop/*.mo
