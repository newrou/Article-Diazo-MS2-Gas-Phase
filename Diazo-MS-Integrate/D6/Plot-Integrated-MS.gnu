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

set arrow from 122,0 to 122,30 as 2
set label "(B)" at 98,20 center font "Helvetica,20"
set arrow from 150,0 to 150,30 as 2
set label "(A)" at 172,28 center font "Helvetica,20"
set arrow from 387,0 to 387,30 as 2
set label "(C1)" at 417,25.5 center font "Helvetica,20"
set arrow from 624,0 to 624,30 as 2
set label "(C2)" at 654,1 center font "Helvetica,20"
set arrow from 861,0 to 861,30 as 2
set label "(C3)" at 891,1 center font "Helvetica,20"
set arrow from 1098,0 to 1098,30 as 2
set label "(C4)" at 1130,26.5 center font "Helvetica,20"
set arrow from 1334,0 to 1334,30 as 2
set label "(C5)" at 1366,5.5 center font "Helvetica,20"
set arrow from 1571,0 to 1571,30 as 2
set label "(C6)" at 1603,2.5 center font "Helvetica,20"
set arrow from 1808,0 to 1808,30 as 2
set label "(C7)" at 1840,1.8 center font "Helvetica,20"

set arrow from 150,25 to 122,25 as 3
set label "-28 [N2]" at 60,25 center font "Helvetica,20"

set arrow from 150,15 to 387,15 as 3
#set label "+237 [M]" at 269,11 center font "Helvetica,20"
set label "+[M]" at 269,16 center font "Helvetica,20"

set arrow from 387,15 to 624,15 as 3
set label "+[M]" at 506,16 center font "Helvetica,20"

set arrow from 624,15 to 861,15 as 3
set label "+[M]" at 743,16 center font "Helvetica,20"

set arrow from 861,15 to 1098,15 as 3
set label "+[M]" at 980,16 center font "Helvetica,20"

set arrow from 1098,15 to 1334,15 as 3
set label "+[M]" at 1216,16 center font "Helvetica,20"

set arrow from 1334,15 to 1571,15 as 3
set label "+[M]" at 1453,16 center font "Helvetica,20"

set arrow from 1571,15 to 1808,15 as 3
set label "+[M]" at 1690,16 center font "Helvetica,20"

plot 'tmp-ms.dat' using 2:($3/1000) with impulses lw 5 lc -1

quit
