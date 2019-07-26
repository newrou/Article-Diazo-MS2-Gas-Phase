#set terminal postscript eps
set terminal postscript eps color
set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
set title "MS Spectr"
set ylabel "Ambulanse, %" font "Helvetica-Bold,24"
#set ylabel "Ambulanse, abs." font "Helvetica-Bold,28"
#set y2label "Ambulanse, %" font "Helvetica-Bold,28"
set xlabel "M/Z, a.e.m." font "Helvetica-Bold,24"
set bars small
#set xrange [`echo $MZRANGE`]
set yrange [0:110]
set xtics nomirror
#set yrange [0:]
#set y2range [0:100]
#set y2tics 10
#set size 0.5,0.5
#set terminal postscript enhanced "Courier" 20

set terminal svg size 1600,900 font "Helvetica,24"
#set key autotitle columnhead
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
set output 'GR-N10-neg.svg'
set label "A" at 148.95,102.00 center tc rgb "red" font ",17"
set arrow from 148.95,0 to 148.95,110 as 2
set arrow from 492.98,0 to 492.98,110 as 2
set arrow from 148.95,40.00 to 492.98,40.00 as 3
set arrow from 148.95,40.00 to 492.98,40.00 as 3
set label "+[M]" at 320.97,43.00 center tc rgb "black" font ",17"
set arrow from 837.01,0 to 837.01,110 as 2
set arrow from 492.98,40.00 to 837.01,40.00 as 3
set arrow from 492.98,40.00 to 837.01,40.00 as 3
set label "+[M]" at 665.00,43.00 center tc rgb "black" font ",17"
plot 'GR-N10-neg.dat' using 2:4 with impulses lw 5 lc -1
quit
