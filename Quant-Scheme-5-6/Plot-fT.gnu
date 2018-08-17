#set terminal postscript eps
set terminal postscript eps color
set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
#set title "TD spectr" 
set ylabel "E, kJ/mol" font "Helvetica-Bold,18"
#set xlabel "T, K" font "Helvetica-Bold,18"
set bars small
#set xrange [0:100]
#set yrange [-100:0]
#set size 0.5,0.5
#set terminal postscript enhanced "Courier" 20

set terminal gif giant size 1200,900 transparent linewidth 2 font "Helvetica,18"
set key autotitle columnhead
set datafile separator ","

set style line 1 lt 1 pt 6
set style line 2 lt 2 pt 7
set style line 3 lt 3 pt 8
set style line 4 lt 4 pt 9

set output "fT.gif"
plot "fT.dat" using 1:2 with linespoints linestyle 1, \
 "fT.dat" using 1:3 with linespoints linestyle 2, \
 "fT.dat" using 1:4 with linespoints linestyle 3

quit
