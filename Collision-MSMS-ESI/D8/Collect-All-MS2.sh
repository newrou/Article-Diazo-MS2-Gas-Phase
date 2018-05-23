php Collect-MS2.php *-pk1.dat -t > 4-Br-Ph-N2-OTf-Collision-183-515-pk1.dat
php Collect-MS2.php *-pk2.dat -t > 4-Br-Ph-N2-OTf-Collision-183-515-pk2.dat

php Collect-MS2.php *-pk1.dat -t "185.03;183.09;157.00;155.00;75.02;" > pk1.dat
php Collect-MS2.php *-pk2.dat -t "515.01;185.03;1.09;92.10;75.02" > pk2.dat
gnuplot Plot-MS2-Ev.gnu
