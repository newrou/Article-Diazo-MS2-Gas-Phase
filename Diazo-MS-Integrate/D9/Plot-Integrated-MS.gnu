#set terminal postscript eps
set terminal postscript eps color
set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
set title "Integrate MS Spectr"
set ylabel "Ambulanse, abs." font "Helvetica-Bold,22"
#set y2label "Ambulanse, %" font "Helvetica-Bold,22"
set xlabel "M/Z, a.e.m." font "Helvetica-Bold,22"
set bars small
#set xrange [`echo $MZRANGE`]
set xrange [0:2000]
set yrange [0:]
#set y2range [0:100]
#set y2tics 10
#set size 0.5,0.5
#set terminal postscript enhanced "Courier" 20
set xtics axis nomirror out scale 0.5
set ytics axis nomirror out scale 0.5

set terminal svg size 1800,900 font "Helvetica,28"
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

set style arrow 1 heads filled size screen 0.008,20,30 ls 1 lw 0.5
set style arrow 2 nohead ls 2 lw 0.8
set style arrow 3 head filled size screen 0.008,20,30 ls 1 lw 0.5

unset key
#set key outside
set nokey

set output 'tmp-ms.svg'

set arrow from 200,0 to 200,50 as 2
set arrow from 228,0 to 228,50 as 2
set arrow from 605,0 to 605,50 as 2
set arrow from 981,0 to 981,50 as 2
set arrow from 1359,0 to 1359,50 as 2
set arrow from 1735,0 to 1735,50 as 2

set arrow from 453,0 to 453,40 as 2
set arrow from 829,0 to 829,40 as 2
set arrow from 1205,0 to 1205,40 as 2
set arrow from 1581,0 to 1581,40 as 2

#set label "[2-HOOC-4-Br-C6H3-N2]+" at 380,23 center font "Helvetica,20"

set arrow from 228,47 to 200,47 as 3
set label "-28 [N2]" at 228,48 center font "Helvetica,20"

set arrow from 228,45 to 605,45 as 3
set label "+376 [M]" at 416,46 center font "Helvetica,20"

set arrow from 605,45 to 981,45 as 3
set label "+376 [M]" at 793,46 center font "Helvetica,20"

set arrow from 981,45 to 1359,45 as 3
set label "+376 [M]" at 1170,46 center font "Helvetica,20"

set arrow from 1359,45 to 1735,45 as 3
set label "+376 [M]" at 1546,46 center font "Helvetica,20"


set label "(1) [C14H7N4O4Br2]+" at 453,14 center font "Helvetica,20"

set arrow from 453,30 to 829,30 as 3
set label "+376 [M]" at 641,31 center font "Helvetica,20"

set arrow from 829,30 to 1205,30 as 3
set label "+376 [M]" at 1017,31 center font "Helvetica,20"

set arrow from 1205,30 to 1581,30 as 3
set label "+376 [M]" at 1393,31 center font "Helvetica,20"


plot 'tmp-ms.dat' using 2:($3/1000) with impulses lw 5 lc -1

quit
