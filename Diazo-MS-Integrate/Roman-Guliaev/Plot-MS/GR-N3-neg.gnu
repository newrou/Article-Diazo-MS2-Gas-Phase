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
set output 'GR-N3-neg.svg'
set label "62.0" at 61.99,102.00 center tc rgb "red" font ",17"
set arrow from 61.99,0 to 61.99,110 as 2
set arrow from 259.04,0 to 259.04,110 as 2
set arrow from 61.99,60.00 to 259.04,60.00 as 3
set arrow from 61.99,60.00 to 259.04,60.00 as 3
set label "+[M]" at 160.51,63.00 center tc rgb "black" font ",17"
set arrow from 456.08,0 to 456.08,110 as 2
set arrow from 259.04,60.00 to 456.08,60.00 as 3
set arrow from 259.04,60.00 to 456.08,60.00 as 3
set label "+[M]" at 357.56,63.00 center tc rgb "black" font ",17"
set arrow from 653.13,0 to 653.13,110 as 2
set arrow from 456.08,60.00 to 653.13,60.00 as 3
set arrow from 456.08,60.00 to 653.13,60.00 as 3
set label "+[M]" at 554.60,63.00 center tc rgb "black" font ",17"
set arrow from 850.17,0 to 850.17,110 as 2
set arrow from 653.13,60.00 to 850.17,60.00 as 3
set arrow from 653.13,60.00 to 850.17,60.00 as 3
set label "+[M]" at 751.65,63.00 center tc rgb "black" font ",17"
set arrow from 1047.22,0 to 1047.22,110 as 2
set arrow from 850.17,60.00 to 1047.22,60.00 as 3
set arrow from 850.17,60.00 to 1047.22,60.00 as 3
set label "+[M]" at 948.69,63.00 center tc rgb "black" font ",17"
set arrow from 1244.26,0 to 1244.26,110 as 2
set arrow from 1047.22,60.00 to 1244.26,60.00 as 3
set arrow from 1047.22,60.00 to 1244.26,60.00 as 3
set label "+[M]" at 1145.74,63.00 center tc rgb "black" font ",17"
set arrow from 1441.31,0 to 1441.31,110 as 2
set arrow from 1244.26,60.00 to 1441.31,60.00 as 3
set arrow from 1244.26,60.00 to 1441.31,60.00 as 3
set label "+[M]" at 1342.78,63.00 center tc rgb "black" font ",17"
set arrow from 1638.35,0 to 1638.35,110 as 2
set arrow from 1441.31,60.00 to 1638.35,60.00 as 3
set arrow from 1441.31,60.00 to 1638.35,60.00 as 3
set label "+[M]" at 1539.83,63.00 center tc rgb "black" font ",17"
set arrow from 1835.40,0 to 1835.40,110 as 2
set arrow from 1638.35,60.00 to 1835.40,60.00 as 3
set arrow from 1638.35,60.00 to 1835.40,60.00 as 3
set label "+[M]" at 1736.87,63.00 center tc rgb "black" font ",17"
set arrow from 2032.44,0 to 2032.44,110 as 2
set arrow from 1835.40,60.00 to 2032.44,60.00 as 3
set arrow from 1835.40,60.00 to 2032.44,60.00 as 3
set label "+[M]" at 1933.92,63.00 center tc rgb "black" font ",17"
set arrow from 2229.49,0 to 2229.49,110 as 2
set arrow from 2032.44,60.00 to 2229.49,60.00 as 3
set arrow from 2032.44,60.00 to 2229.49,60.00 as 3
set label "+[M]" at 2130.96,63.00 center tc rgb "black" font ",17"
set arrow from 2426.53,0 to 2426.53,110 as 2
set arrow from 2229.49,60.00 to 2426.53,60.00 as 3
set arrow from 2229.49,60.00 to 2426.53,60.00 as 3
set label "+[M]" at 2328.01,63.00 center tc rgb "black" font ",17"
set arrow from 2623.58,0 to 2623.58,110 as 2
set arrow from 2426.53,60.00 to 2623.58,60.00 as 3
set arrow from 2426.53,60.00 to 2623.58,60.00 as 3
set label "+[M]" at 2525.05,63.00 center tc rgb "black" font ",17"
set arrow from 2820.62,0 to 2820.62,110 as 2
set arrow from 2623.58,60.00 to 2820.62,60.00 as 3
set arrow from 2623.58,60.00 to 2820.62,60.00 as 3
set label "+[M]" at 2722.10,63.00 center tc rgb "black" font ",17"
set arrow from 3017.67,0 to 3017.67,110 as 2
set arrow from 2820.62,60.00 to 3017.67,60.00 as 3
set arrow from 2820.62,60.00 to 3017.67,60.00 as 3
set label "+[M]" at 2919.14,63.00 center tc rgb "black" font ",17"
set label "125.0" at 124.99,21.10 center tc rgb "red" font ",17"
set arrow from 124.99,0 to 124.99,110 as 2
set arrow from 322.04,0 to 322.04,110 as 2
set arrow from 124.99,80.00 to 322.04,80.00 as 3
set arrow from 124.99,80.00 to 322.04,80.00 as 3
set label "+[M]" at 223.51,83.00 center tc rgb "black" font ",17"
set arrow from 519.08,0 to 519.08,110 as 2
set arrow from 322.04,80.00 to 519.08,80.00 as 3
set arrow from 322.04,80.00 to 519.08,80.00 as 3
set label "+[M]" at 420.56,83.00 center tc rgb "black" font ",17"
plot 'GR-N3-neg.dat' using 2:4 with impulses lw 5 lc -1
quit
