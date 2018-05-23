php Collect-MS2.php *-pk1.dat -t > 2-HOOC-Ph-N2-OTf-Collision-149-447-pk1.dat
php Collect-MS2.php *-pk2.dat -t > 2-HOOC-Ph-N2-OTf-Collision-149-447-pk2.dat

php Collect-MS2.php *-pk1.dat -t "149.03;122.09;92.10;75.02" > pk1.dat
php Collect-MS2.php *-pk2.dat -t "447.01;149.03;122.09;92.10;75.02" > pk2.dat
gnuplot Plot-MS2-Ev.gnu
