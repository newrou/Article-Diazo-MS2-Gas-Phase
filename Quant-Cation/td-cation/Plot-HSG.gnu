#set terminal postscript eps
set terminal postscript eps color
set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
#set title "TD spectr" 
set ylabel "E, kJ/mol" font "Helvetica-Bold,18"
set xlabel "n" font "Helvetica-Bold,18"
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

set output "r-298.gif"
plot "r.dat" using 2 with linespoints linestyle 1, \
 "r.dat" using 3 with linespoints linestyle 2, \
 "r.dat" using 4 with linespoints linestyle 3

set output "r-323.gif"
plot "r.dat" using 5 with linespoints linestyle 1, \
 "r.dat" using 6 with linespoints linestyle 2, \
 "r.dat" using 7 with linespoints linestyle 3

set output "r-348.gif"
plot "r.dat" using 8 with linespoints linestyle 1, \
 "r.dat" using 9 with linespoints linestyle 2, \
 "r.dat" using 10 with linespoints linestyle 3

set output "r-373.gif"
plot "r.dat" using 11 with linespoints linestyle 1, \
 "r.dat" using 12 with linespoints linestyle 2, \
 "r.dat" using 13 with linespoints linestyle 3

set output "r-398.gif"
plot "r.dat" using 14 with linespoints linestyle 1, \
 "r.dat" using 15 with linespoints linestyle 2, \
 "r.dat" using 16 with linespoints linestyle 3

#set output "r.gif"
#splot 'r.dat' matrix with lines

#plot "r.dat" using 2 with linespoints linestyle 2, \
# "r.dat" using 6 smooth bezier

#plot "r.dat" using 2 title "298" with linespoints linestyle 1, \
# "r.dat" using 6 title "398" with linespoints linestyle 1

quit
