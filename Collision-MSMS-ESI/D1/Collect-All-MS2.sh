php Collect-MS2.php *-pk1.dat -t > 2-NO2-Ph-N2-OTf-Collision-150-449-pk1.dat
php Collect-MS2.php *-pk2.dat -t > 2-NO2-Ph-N2-OTf-Collision-150-449-pk2.dat

php Collect-MS2.php *-pk1.dat -t "150.03;122.09;92.10;75.02" > pk1.dat
php Collect-MS2.php *-pk2.dat -t "449.01;150.03;122.09;92.10;75.02" > pk2.dat
gnuplot Plot-MS2-Ev.gnu
