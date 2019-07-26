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
set output 'GR-N11-neg.svg'
set label "125.0" at 124.99,52.80 center tc rgb "red" font ",17"
set arrow from 124.99,0 to 124.99,110 as 2
set arrow from 273.02,0 to 273.02,110 as 2
set arrow from 124.99,70.00 to 273.02,70.00 as 3
set arrow from 124.99,70.00 to 273.02,70.00 as 3
set label "+[M]" at 199.00,73.00 center tc rgb "black" font ",17"
set arrow from 421.04,0 to 421.04,110 as 2
set arrow from 273.02,70.00 to 421.04,70.00 as 3
set arrow from 273.02,70.00 to 421.04,70.00 as 3
set label "+[M]" at 347.03,73.00 center tc rgb "black" font ",17"
set arrow from 569.07,0 to 569.07,110 as 2
set arrow from 421.04,70.00 to 569.07,70.00 as 3
set arrow from 421.04,70.00 to 569.07,70.00 as 3
set label "+[M]" at 495.06,73.00 center tc rgb "black" font ",17"
set arrow from 717.10,0 to 717.10,110 as 2
set arrow from 569.07,70.00 to 717.10,70.00 as 3
set arrow from 569.07,70.00 to 717.10,70.00 as 3
set label "+[M]" at 643.09,73.00 center tc rgb "black" font ",17"
set arrow from 865.13,0 to 865.13,110 as 2
set arrow from 717.10,70.00 to 865.13,70.00 as 3
set arrow from 717.10,70.00 to 865.13,70.00 as 3
set label "+[M]" at 791.11,73.00 center tc rgb "black" font ",17"
set arrow from 1013.15,0 to 1013.15,110 as 2
set arrow from 865.13,70.00 to 1013.15,70.00 as 3
set arrow from 865.13,70.00 to 1013.15,70.00 as 3
set label "+[M]" at 939.14,73.00 center tc rgb "black" font ",17"
set arrow from 1161.18,0 to 1161.18,110 as 2
set arrow from 1013.15,70.00 to 1161.18,70.00 as 3
set arrow from 1013.15,70.00 to 1161.18,70.00 as 3
set label "+[M]" at 1087.17,73.00 center tc rgb "black" font ",17"
set arrow from 1309.21,0 to 1309.21,110 as 2
set arrow from 1161.18,70.00 to 1309.21,70.00 as 3
set arrow from 1161.18,70.00 to 1309.21,70.00 as 3
set label "+[M]" at 1235.19,73.00 center tc rgb "black" font ",17"
set arrow from 1457.23,0 to 1457.23,110 as 2
set arrow from 1309.21,70.00 to 1457.23,70.00 as 3
set arrow from 1309.21,70.00 to 1457.23,70.00 as 3
set label "+[M]" at 1383.22,73.00 center tc rgb "black" font ",17"
set label "62.0" at 61.99,102.00 center tc rgb "red" font ",17"
plot 'GR-N11-neg.dat' using 2:4 with impulses lw 5 lc -1
quit
