#set terminal postscript eps
set terminal postscript eps color
set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
#set title "Integrate MS Spectr"
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

set arrow from 122,0 to 122,1800 as 2
set label "(B)" at 100,1750 center font "Helvetica,20"
set arrow from 150,0 to 150,1800 as 2
set label "(A)" at 172,740 center font "Helvetica,20"
set arrow from 449,0 to 449,1800 as 2
set label "(C1)" at 477,370 center font "Helvetica,20"
set arrow from 748,0 to 748,1800 as 2
set label "(C2)" at 777,155 center font "Helvetica,20"
set arrow from 1047,0 to 1047,1800 as 2
set label "(C3)" at 1077,250 center font "Helvetica,20"
set arrow from 1346,0 to 1346,1800 as 2
set label "(C4)" at 1375,197 center font "Helvetica,20"

set arrow from 150,850 to 122,850 as 3
set label "-28 [N2]" at 60,850 center font "Helvetica,20"

set arrow from 150,600 to 449,600 as 3
#set label "+299 [M]" at 300,630 center font "Helvetica,20"
set label "+[NO_2C_6H_4N_2^+ TfO^-]" at 300,650 center font "Helvetica,20"

set arrow from 449,600 to 748,600 as 3
set label "+[NO_2C_6H_4N_2^+ TfO^-]" at 599,650 center font "Helvetica,20"

set arrow from 748,600 to 1047,600 as 3
set label "+[NO_2C_6H_4N_2^+ TfO^-]" at 898,650 center font "Helvetica,20"

set arrow from 1047,600 to 1346,600 as 3
set label "+[NO_2C_6H_4N_2^+ TfO^-]" at 1197,650 center font "Helvetica,20"

plot 'tmp-ms.dat' using 2:($3/1000) with impulses lw 5 lc -1

quit
