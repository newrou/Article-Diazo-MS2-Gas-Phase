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
set label "(A)" at 128,62 center font "Helvetica,20"
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

set arrow from 105,140 to 359,140 as 3
#set label "+254 [M]" at 232,80 center font "Helvetica,20"
set label "+[C_6H_5N_2^+ TfO^-]" at 232,145 center font "Helvetica,20"
set arrow from 359,140 to 613,140 as 3
set label "+[C_6H_5N_2^+ TfO^-]" at 486,145 center font "Helvetica,20"
set arrow from 613,140 to 867,140 as 3
set label "+[C_6H_5N_2^+ TfO^-]" at 740,145 center font "Helvetica,20"
set arrow from 867,140 to 1121,140 as 3
set label "+[C_6H_5N_2^+ TfO^-]" at 994,145 center font "Helvetica,20"
set arrow from 1121,140 to 1375,140 as 3
set label "+[C_6H_5N_2^+ TfO^-]" at 1248,145 center font "Helvetica,20"
set arrow from 1375,140 to 1629,140 as 3
set label "+[C_6H_5N_2^+ TfO^-]" at 1502,145 center font "Helvetica,20"
set arrow from 1629,140 to 1883,140 as 3
set label "+[C_6H_5N_2^+ TfO^-]" at 1756,145 center font "Helvetica,20"

set arrow from 181,0 to 181,80 as 2
set label "(P1)" at 181,85 center font "Helvetica,20"
set arrow from 257,0 to 257,80 as 2
set label "(P1)" at 257,85 center font "Helvetica,20"
set arrow from 333,0 to 333,80 as 2
set label "(P1)" at 333,85 center font "Helvetica,20"
set arrow from 409,0 to 409,80 as 2
set label "(P1)" at 409,85 center font "Helvetica,20"
set arrow from 485,0 to 485,80 as 2
set label "(P1)" at 485,85 center font "Helvetica,20"
set arrow from 561,0 to 561,80 as 2
set label "(P1)" at 561,85 center font "Helvetica,20"
set arrow from 637,0 to 637,80 as 2
set label "(P1)" at 637,85 center font "Helvetica,20"

set arrow from 105,70 to 181,70 as 3
set label "+[E]" at 143,75 center font "Helvetica,20"
set arrow from 181,70 to 257,70 as 3
set label "+[E]" at 219,75 center font "Helvetica,20"
set arrow from 257,70 to 333,70 as 3
set label "+[E]" at 295,75 center font "Helvetica,20"
set arrow from 333,70 to 409,70 as 3
set label "+[E]" at 371,75 center font "Helvetica,20"
set arrow from 409,70 to 485,70 as 3
set label "+[E]" at 447,75 center font "Helvetica,20"
set arrow from 485,70 to 561,70 as 3
set label "+[E]" at 523,75 center font "Helvetica,20"
set arrow from 561,70 to 637,70 as 3
set label "+[E]" at 599,75 center font "Helvetica,20"


set arrow from 153,0 to 153,50 as 2
set label "(P2)" at 153,55 center font "Helvetica,20"
set arrow from 229,0 to 229,50 as 2
set label "(P2)" at 229,55 center font "Helvetica,20"

set arrow from 77,30 to 153,30 as 3
set label "+ [E]" at 115,35 center font "Helvetica,20"
set arrow from 153,30 to 229,30 as 3
set label "+[E]" at 191,35 center font "Helvetica,20"


plot 'tmp-ms.dat' using 2:($3/1000) with impulses lw 5 lc -1

quit
