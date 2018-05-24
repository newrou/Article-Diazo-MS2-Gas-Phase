set terminal canvas enhanced mousing rounded size 1200,800 jsdir "js" fsize 10 lw 1.6 fontscale 1 
set size ratio 1.1 1,1
set key right top vertical Right noreverse enhanced autotitle nobox
set bars small
unset arrow 1
set key autotitle columnhead
set datafile separator ";"

set style line 1 lt 1 pt 5 ps 1.0 lc rgb "#CC6600"
set style line 2 lt 2 pt 5 ps 1.0 lc rgb "#FF0033"
set style line 3 lt 3 pt 5 ps 1.0 lc rgb "#0033FF"
set style line 4 lt 4 pt 5 ps 1.0 lc rgb "#3399CC"
set style line 5 lt 5 pt 5 ps 1.0 lc rgb "#33CC66"
set style line 6 lt 6 pt 5 ps 1.0 lc rgb "#3333CC"
set style line 7 lt 7 pt 5 ps 1.0 lc rgb "#333333"

set style arrow 1 nohead ls 2 lw 1.5 lc black

unset label
set xlabel "dG, kJ/mol" font "Helvetica-Bold,14"
set ylabel "Ratio" font "Helvetica-Bold,14"
set output "Quant-MS2-correlation.html"
plot "Quant-MS2.csv" using 5:4:1 with labels hypertext point linestyle 2 ti "v1", \
 "Quant-MS2.csv" using 6:4:1 with labels hypertext point linestyle 3 ti "v2", \
 "Quant-MS2.csv" using (($5+$6)/2):4:1 with labels hypertext point linestyle 4 ti "(v1+v2)/2"

unset label
set xlabel "dG, kJ/mol" font "Helvetica-Bold,14"
set ylabel "log(Ratio)" font "Helvetica-Bold,14"
set output "Quant-MS2-correlation-log.html"
plot "Quant-MS2.csv" using 5:(log($4)):1 with labels hypertext point linestyle 2 ti "v1", \
 "Quant-MS2.csv" using 6:(log($4)):1 with labels hypertext point linestyle 3 ti "v2", \
 "Quant-MS2.csv" using (($5+$6)/2):(log($4)):1 with labels hypertext point linestyle 4 ti "(v1+v2)/2"

unset label
set xlabel "dG/RT" font "Helvetica-Bold,14"
set ylabel "-log(Ratio)" font "Helvetica-Bold,14"
set output "Quant-MS2-correlation-log2.html"
plot "Quant-MS2.csv" using (-$5/4762.88):(log($4)):1 with labels hypertext point linestyle 2 ti "v1", \
 "Quant-MS2.csv" using (-$6/4762.88):(log($4)):1 with labels hypertext point linestyle 3 ti "v2", \
 "Quant-MS2.csv" using (-(($5+$6)/2)/4762.88):(log($4)):1 with labels hypertext point linestyle 4 ti "(v1+v2)/2"

quit
