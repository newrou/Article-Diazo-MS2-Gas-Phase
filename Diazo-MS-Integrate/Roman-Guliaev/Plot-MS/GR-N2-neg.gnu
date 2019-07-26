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
set output 'GR-N2-neg.svg'
set label "62.0" at 61.99,66.30 center tc rgb "red" font ",17"
set arrow from 61.99,0 to 61.99,110 as 2
set arrow from 395.01,0 to 395.01,110 as 2
set arrow from 61.99,100.00 to 395.01,100.00 as 3
set arrow from 61.99,100.00 to 395.01,100.00 as 3
set label "+[M]" at 228.50,103.00 center tc rgb "black" font ",17"
set arrow from 728.03,0 to 728.03,110 as 2
set arrow from 395.01,100.00 to 728.03,100.00 as 3
set arrow from 395.01,100.00 to 728.03,100.00 as 3
set label "+[M]" at 561.52,103.00 center tc rgb "black" font ",17"
set arrow from 1061.05,0 to 1061.05,110 as 2
set arrow from 728.03,100.00 to 1061.05,100.00 as 3
set arrow from 728.03,100.00 to 1061.05,100.00 as 3
set label "+[M]" at 894.54,103.00 center tc rgb "black" font ",17"
set arrow from 1394.06,0 to 1394.06,110 as 2
set arrow from 1061.05,100.00 to 1394.06,100.00 as 3
set arrow from 1061.05,100.00 to 1394.06,100.00 as 3
set label "+[M]" at 1227.56,103.00 center tc rgb "black" font ",17"
set arrow from 1727.08,0 to 1727.08,110 as 2
set arrow from 1394.06,100.00 to 1727.08,100.00 as 3
set arrow from 1394.06,100.00 to 1727.08,100.00 as 3
set label "+[M]" at 1560.57,103.00 center tc rgb "black" font ",17"
set arrow from 2060.10,0 to 2060.10,110 as 2
set arrow from 1727.08,100.00 to 2060.10,100.00 as 3
set arrow from 1727.08,100.00 to 2060.10,100.00 as 3
set label "+[M]" at 1893.59,103.00 center tc rgb "black" font ",17"
set arrow from 2393.12,0 to 2393.12,110 as 2
set arrow from 2060.10,100.00 to 2393.12,100.00 as 3
set arrow from 2060.10,100.00 to 2393.12,100.00 as 3
set label "+[M]" at 2226.61,103.00 center tc rgb "black" font ",17"
set arrow from 2726.14,0 to 2726.14,110 as 2
set arrow from 2393.12,100.00 to 2726.14,100.00 as 3
set arrow from 2393.12,100.00 to 2726.14,100.00 as 3
set label "+[M]" at 2559.63,103.00 center tc rgb "black" font ",17"
set arrow from 3059.16,0 to 3059.16,110 as 2
set arrow from 2726.14,100.00 to 3059.16,100.00 as 3
set arrow from 2726.14,100.00 to 3059.16,100.00 as 3
set label "+[M]" at 2892.65,103.00 center tc rgb "black" font ",17"
set label "125.0" at 124.99,19.70 center tc rgb "red" font ",17"
set label "189.0" at 189.02,25.30 center tc rgb "red" font ",17"
set label "349.0" at 349.01,14.50 center tc rgb "red" font ",17"
plot 'GR-N2-neg.dat' using 2:4 with impulses lw 5 lc -1
quit
