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

set arrow from 107,0 to 107,120 as 2
set label "(B)" at 83,42 center font "Helvetica,20"
set arrow from 135,0 to 135,120 as 2
set label "(A)" at 157,82 center font "Helvetica,20"
set arrow from 419,0 to 419,120 as 2
set label "(C1)" at 450,117 center font "Helvetica,20"
set arrow from 703,0 to 703,120 as 2
set label "(C2)" at 732,25 center font "Helvetica,20"
set arrow from 987,0 to 987,120 as 2
set label "(C3)" at 1017,96 center font "Helvetica,20"
set arrow from 1271,0 to 1271,120 as 2
set label "(C4)" at 1300,58 center font "Helvetica,20"
set arrow from 1555,0 to 1555,120 as 2
set label "(C5)" at 1585,39 center font "Helvetica,20"
set arrow from 1839,0 to 1839,120 as 2
set label "(C6)" at 1869,7 center font "Helvetica,20"

set arrow from 135,60 to 107,60 as 3
set label "-28 [N2]" at 50,60 center font "Helvetica,20"

set arrow from 135,75 to 419,75 as 3
set label "+284 [M]" at 277,80 center font "Helvetica,20"

set arrow from 419,75 to 703,75 as 3
set label "+284 [M]" at 561,80 center font "Helvetica,20"

set arrow from 703,75 to 987,75 as 3
set label "+284 [M]" at 845,80 center font "Helvetica,20"

set arrow from 987,75 to 1271,75 as 3
set label "+284 [M]" at 1129,80 center font "Helvetica,20"

set arrow from 1271,75 to 1555,75 as 3
set label "+284 [M]" at 1413,80 center font "Helvetica,20"

set arrow from 1555,75 to 1839,75 as 3
set label "+284 [M]" at 1697,80 center font "Helvetica,20"


plot 'tmp-ms.dat' using 2:($3/1000) with impulses lw 5 lc -1

quit
