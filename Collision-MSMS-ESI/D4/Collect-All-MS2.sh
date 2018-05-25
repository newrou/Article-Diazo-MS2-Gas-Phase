php Collect-MS2.php *-pk1.dat -t > 4-CH3O-Ph-N2-OTf-Collision-135-419-pk1.dat
php Collect-MS2.php *-pk2.dat -t > 4-CH3O-Ph-N2-OTf-Collision-135-419-pk2.dat

php Collect-MS2.php *-pk1.dat -t "135.06;107.05;92.03;77.04" > pk1.dat
php Collect-MS2.php *-pk2.dat -t "419.18;135.06;107.05;92.03;77.04" > pk2.dat
gnuplot Plot-MS2-Ev.gnu
