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

set arrow from 121,0 to 121,50 as 2
set arrow from 149,0 to 149,50 as 2
set arrow from 447,0 to 447,50 as 2
set arrow from 745,0 to 745,50 as 2
set arrow from 1043,0 to 1043,50 as 2
set arrow from 1341,0 to 1341,50 as 2
set arrow from 1639,0 to 1639,50 as 2
set arrow from 1937,0 to 1937,50 as 2

set arrow from 150,30 to 122,30 as 3
set label "-28 [N2]" at 60,30 center font "Helvetica,20"

set arrow from 150,15 to 447,15 as 3
set label "+298 [M]" at 298,16 center font "Helvetica,20"

set arrow from 447,15 to 745,15 as 3
set label "+298 [M]" at 596,16 center font "Helvetica,20"

set arrow from 745,15 to 1043,15 as 3
set label "+298 [M]" at 894,16 center font "Helvetica,20"

set arrow from 1043,15 to 1341,15 as 3
set label "+298 [M]" at 1192,16 center font "Helvetica,20"

set arrow from 1341,15 to 1639,15 as 3
set label "+298 [M]" at 1490,16 center font "Helvetica,20"

set arrow from 1639,15 to 1937,15 as 3
set label "+298 [M]" at 1788,16 center font "Helvetica,20"

plot 'tmp-ms.dat' using 2:($3/1000) with impulses lw 5 lc -1

quit
