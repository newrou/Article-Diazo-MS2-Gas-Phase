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
set output 'GR-N3-pos.svg'
set label "DC" at 135.06,70.10 left tc rgb "red" font ",17"
set label "AC" at 107.06,102.00 right tc rgb "red" font ",17"
set arrow from 135.06,0 to 135.06,110 as 2
set arrow from 107.06,0 to 107.06,110 as 2
set arrow from 135.06,60.00 to 107.06,60.00 as 3
set label "-[N_2]" at 121.06,64.00 center tc rgb "black" font ",17"
set arrow from 332.10,0 to 332.10,110 as 2
set arrow from 135.06,70.00 to 332.10,70.00 as 3
set arrow from 135.06,70.00 to 332.10,70.00 as 3
set label "+[M]" at 233.58,73.00 center tc rgb "black" font ",17"
set arrow from 529.15,0 to 529.15,110 as 2
set arrow from 332.10,70.00 to 529.15,70.00 as 3
set arrow from 332.10,70.00 to 529.15,70.00 as 3
set label "+[M]" at 430.62,73.00 center tc rgb "black" font ",17"
set arrow from 726.19,0 to 726.19,110 as 2
set arrow from 529.15,70.00 to 726.19,70.00 as 3
set arrow from 529.15,70.00 to 726.19,70.00 as 3
set label "+[M]" at 627.67,73.00 center tc rgb "black" font ",17"
set arrow from 923.24,0 to 923.24,110 as 2
set arrow from 726.19,70.00 to 923.24,70.00 as 3
set arrow from 726.19,70.00 to 923.24,70.00 as 3
set label "+[M]" at 824.71,73.00 center tc rgb "black" font ",17"
set arrow from 1120.28,0 to 1120.28,110 as 2
set arrow from 923.24,70.00 to 1120.28,70.00 as 3
set arrow from 923.24,70.00 to 1120.28,70.00 as 3
set label "+[M]" at 1021.76,73.00 center tc rgb "black" font ",17"
set arrow from 1317.33,0 to 1317.33,110 as 2
set arrow from 1120.28,70.00 to 1317.33,70.00 as 3
set arrow from 1120.28,70.00 to 1317.33,70.00 as 3
set label "+[M]" at 1218.80,73.00 center tc rgb "black" font ",17"
set arrow from 1514.37,0 to 1514.37,110 as 2
set arrow from 1317.33,70.00 to 1514.37,70.00 as 3
set arrow from 1317.33,70.00 to 1514.37,70.00 as 3
set label "+[M]" at 1415.85,73.00 center tc rgb "black" font ",17"
set arrow from 1711.42,0 to 1711.42,110 as 2
set arrow from 1514.37,70.00 to 1711.42,70.00 as 3
set arrow from 1514.37,70.00 to 1711.42,70.00 as 3
set label "+[M]" at 1612.89,73.00 center tc rgb "black" font ",17"
set arrow from 1908.46,0 to 1908.46,110 as 2
set arrow from 1711.42,70.00 to 1908.46,70.00 as 3
set arrow from 1711.42,70.00 to 1908.46,70.00 as 3
set label "+[M]" at 1809.94,73.00 center tc rgb "black" font ",17"
set arrow from 2105.51,0 to 2105.51,110 as 2
set arrow from 1908.46,70.00 to 2105.51,70.00 as 3
set arrow from 1908.46,70.00 to 2105.51,70.00 as 3
set label "+[M]" at 2006.98,73.00 center tc rgb "black" font ",17"
set arrow from 2302.55,0 to 2302.55,110 as 2
set arrow from 2105.51,70.00 to 2302.55,70.00 as 3
set arrow from 2105.51,70.00 to 2302.55,70.00 as 3
set label "+[M]" at 2204.03,73.00 center tc rgb "black" font ",17"
set arrow from 2499.60,0 to 2499.60,110 as 2
set arrow from 2302.55,70.00 to 2499.60,70.00 as 3
set arrow from 2302.55,70.00 to 2499.60,70.00 as 3
set label "+[M]" at 2401.07,73.00 center tc rgb "black" font ",17"
set arrow from 2696.64,0 to 2696.64,110 as 2
set arrow from 2499.60,70.00 to 2696.64,70.00 as 3
set arrow from 2499.60,70.00 to 2696.64,70.00 as 3
set label "+[M]" at 2598.12,73.00 center tc rgb "black" font ",17"
plot 'GR-N3-pos.dat' using 2:4 with impulses lw 5 lc -1
quit
