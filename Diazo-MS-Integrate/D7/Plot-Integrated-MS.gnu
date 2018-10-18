#set terminal postscript eps
set terminal postscript eps color
set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
#set title "Integrate MS Spectr"
set ylabel "Ambulanse, abs." font "Helvetica-Bold,22"
#set y2label "Ambulanse, %" font "Helvetica-Bold,22"
set xlabel "M/Z, a.e.m." font "Helvetica-Bold,22"
set bars small
#set xrange [`echo $MZRANGE`]
set xrange [0:3000]
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

set arrow from 121,0 to 121,25 as 2
set label "(B)" at 80,20 center font "Helvetica,20"
set arrow from 149,0 to 149,25 as 2
set label "(A)" at 170,7 center font "Helvetica,20"
set arrow from 447,0 to 447,25 as 2
set arrow from 745,0 to 745,25 as 2
set arrow from 1043,0 to 1043,25 as 2
set arrow from 1341,0 to 1341,25 as 2
set arrow from 1639,0 to 1639,25 as 2
set label "(C5)" at 1682,4.5 center font "Helvetica,20"
set arrow from 1937,0 to 1937,25 as 2
set label "(C6)" at 1980,4.5 center font "Helvetica,20"
set arrow from 2235,0 to 2235,25 as 2
set label "(C7)" at 2275,2.5 center font "Helvetica,20"
set arrow from 2533,0 to 2533,25 as 2
set label "(C8)" at 2575,4.5 center font "Helvetica,20"
set arrow from 2831,0 to 2831,25 as 2

set arrow from 1489,0 to 1489,5 as 2
set label "(D5)" at 1430,1 center font "Helvetica,20"
set arrow from 1787,0 to 1787,5 as 2
set label "(D6)" at 1730,1 center font "Helvetica,20"
#set arrow from 2085,0 to 2085,5 as 2
set arrow from 2382,0 to 2382,5 as 2
set label "(D7)" at 2330,1 center font "Helvetica,20"

set arrow from 150,22 to 122,22 as 3
set label "-28 [N2]" at 60,22 center font "Helvetica,20"

set arrow from 150,10 to 447,10 as 3
#set label "+298 [M]" at 298,10.5 center font "Helvetica,20"
set label "+[M]" at 298,11 center font "Helvetica,20"

set arrow from 447,10 to 745,10 as 3
set label "+[M]" at 596,11 center font "Helvetica,20"

set arrow from 745,10 to 1043,10 as 3
set label "+[M]" at 894,11 center font "Helvetica,20"

set arrow from 1043,10 to 1341,10 as 3
set label "+[M]" at 1192,11 center font "Helvetica,20"

set arrow from 1341,10 to 1639,10 as 3
set label "+[M]" at 1490,11 center font "Helvetica,20"

set arrow from 1639,10 to 1937,10 as 3
set label "+[M]" at 1788,11 center font "Helvetica,20"

set arrow from 1937,10 to 2235,10 as 3
set label "+[M]" at 2086,11 center font "Helvetica,20"

set arrow from 2235,10 to 2533,10 as 3
set label "+[M]" at 2384,11 center font "Helvetica,20"

set arrow from 2533,10 to 2831,10 as 3
set label "+[M]" at 2682,11 center font "Helvetica,20"


set arrow from 1639,3 to 1489,3 as 3
set label "-[HOTf]" at 1562,3.7 center font "Helvetica,20"

set arrow from 1937,3 to 1786,3 as 3
set label "-[HOTf]" at 1862,3.7 center font "Helvetica,20"

#set arrow from 2235,3 to 2085,3 as 3
#set label "-[HOTf]" at 2160,3.7 center font "Helvetica,20"

set arrow from 2532,3 to 2382,3 as 3
set label "-[HOTf]" at 2457,3.7 center font "Helvetica,20"


plot 'tmp-ms.dat' using 2:($3/1000) with impulses lw 5 lc -1

quit
