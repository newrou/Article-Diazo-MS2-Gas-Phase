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

set arrow from 77,0 to 77,180 as 2
set label "(B)" at 55,172 center font "Helvetica,20"
set arrow from 105,0 to 105,180 as 2
set label "(A)" at 128,67 center font "Helvetica,20"
set arrow from 359,0 to 359,180 as 2
set label "(C1)" at 387,22 center font "Helvetica,20"
set arrow from 613,0 to 613,180 as 2
set label "(C2)" at 640,7 center font "Helvetica,20"
set arrow from 867,0 to 867,180 as 2
set label "(C3)" at 895,10 center font "Helvetica,20"
set arrow from 1121,0 to 1121,180 as 2
set label "(C4)" at 1150,8 center font "Helvetica,20"
set arrow from 1375,0 to 1375,180 as 2
set label "(C5)" at 1405,10 center font "Helvetica,20"
set arrow from 1629,0 to 1629,180 as 2
set label "(C6)" at 1660,20 center font "Helvetica,20"
set arrow from 1883,0 to 1883,180 as 2
set label "(C7)" at 1911,6 center font "Helvetica,20"

set arrow from 105,100 to 77,100 as 3
set label "-28 [N2]" at 160,100 center font "Helvetica,20"

set arrow from 105,75 to 359,75 as 3
#set label "+254 [M]" at 232,80 center font "Helvetica,20"
set label "+[C_6H_5N_2^+ TfO^-]" at 232,80 center font "Helvetica,20"

set arrow from 359,75 to 613,75 as 3
set label "+[C_6H_5N_2^+ TfO^-]" at 486,80 center font "Helvetica,20"

set arrow from 613,75 to 867,75 as 3
set label "+[C_6H_5N_2^+ TfO^-]" at 740,80 center font "Helvetica,20"

set arrow from 867,75 to 1121,75 as 3
set label "+[C_6H_5N_2^+ TfO^-]" at 994,80 center font "Helvetica,20"

set arrow from 1121,75 to 1375,75 as 3
set label "+[C_6H_5N_2^+ TfO^-]" at 1248,80 center font "Helvetica,20"

set arrow from 1375,75 to 1629,75 as 3
set label "+[C_6H_5N_2^+ TfO^-]" at 1502,80 center font "Helvetica,20"

set arrow from 1629,75 to 1883,75 as 3
set label "+[C_6H_5N_2^+ TfO^-]" at 1756,80 center font "Helvetica,20"

plot 'tmp-ms.dat' using 2:($3/1000) with impulses lw 5 lc -1

quit
