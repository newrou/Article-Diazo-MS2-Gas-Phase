#set terminal postscript eps
set terminal postscript eps color
set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
#set title "MS Spectr" 
set ylabel "Ambulanse, %" font "Helvetica-Bold,28"
set xlabel "Collision, Ev" font "Helvetica-Bold,28"
set bars small
set xrange [0:40]
set yrange [-5:110]
#set size 0.5,0.5
#set terminal postscript enhanced "Courier" 20

set terminal svg size 1200,900 font "Helvetica,28"
set key autotitle columnhead
set datafile separator ";"

set termoption dash

set linestyle 1 lt 1 lw 3 lc -1 dashtype 1
set linestyle 2 lt 2 lw 3 lc -1 dashtype 2
set linestyle 3 lt 3 lw 3 lc -1 dashtype 3
set linestyle 4 lt 4 lw 2 lc -1 dashtype 4
set linestyle 5 lt 5 lw 2 lc -1 dashtype 5
set linestyle 6 lt 6 lw 2 lc -1 dashtype 6
set linestyle 7 lt 7 lw 2 lc -1 dashtype 7
set linestyle 8 lt 8 lw 2 lc -1 dashtype 8
set linestyle 9 lt 9 lw 2 lc -1 dashtype 9

unset key
set key outside
#set logscale x 2
#show logscale

set output "pk1.svg"
plot "pk1.dat" using 1:2 with lines linestyle 1 ti "150", \
 "pk1.dat" using 1:3 with lines linestyle 2 ti "122", \
 "pk1.dat" using 1:4 with lines linestyle 3 ti "92", \
 "pk1.dat" using 1:5 with lines linestyle 4 ti "75"

set output "pk2.svg"
plot "pk2.dat" using 1:2 with lines linestyle 1 ti "449", \
 "pk2.dat" using 1:3 with lines linestyle 2 ti "150", \
 "pk2.dat" using 1:4 with lines linestyle 3 ti "122", \
 "pk2.dat" using 1:5 with lines linestyle 4 ti "92", \
 "pk2.dat" using 1:6 with lines linestyle 5 ti "75"


#set logscale x 10
#show logscale

set yrange [:]
set output "pk1n.svg"
plot "pk1.dat" using 1:(100*$2/$3) with lines linestyle 1 ti "150/122", \
 "pk1.dat" using 1:(100*$3/$4) with lines linestyle 2 ti "122/92", \
 "pk1.dat" using 1:(100*$4/$5) with lines linestyle 3 ti "92/75"

set yrange [:]
set output "pk2n.svg"
plot "pk2.dat" using 1:(100*$2/$3) with lines linestyle 1 ti "449/150", \
 "pk2.dat" using 1:(100*$3/$4) with lines linestyle 2 ti "150/122", \
 "pk2.dat" using 1:(100*$4/$5) with lines linestyle 3 ti "122/92"

quit
