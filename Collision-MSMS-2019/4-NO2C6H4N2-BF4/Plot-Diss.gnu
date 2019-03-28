#set terminal postscript eps
set terminal postscript eps color
set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
set title "Dissociation of 4-NO2C6H4N2-BF4"
set ylabel "Dissociation, %" font "Helvetica-Bold,28"
set xlabel "E collision, eV" font "Helvetica-Bold,28"
set bars small
set xrange [0:]
set yrange [0:]

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
#set key outside
set nokey

set output 'Diss.svg'
plot 'Diss.dat' using 1:2 smooth acsplines lw 3 lc -1, '' using 1:2 with points ps 0.5 pt 7

quit
