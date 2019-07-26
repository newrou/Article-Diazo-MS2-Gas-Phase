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
set output 'GR-N8-pos.svg'
set label "DC" at 347.15,27.20 left tc rgb "red" font ",17"
set label "AC" at 319.15,102.00 right tc rgb "red" font ",17"
set arrow from 347.15,0 to 347.15,110 as 2
set arrow from 319.15,0 to 319.15,110 as 2
set arrow from 347.15,80.00 to 319.15,80.00 as 3
set label "-[N_2]" at 333.15,84.00 center tc rgb "black" font ",17"
set arrow from 843.26,0 to 843.26,110 as 2
set arrow from 347.15,90.00 to 843.26,90.00 as 3
set arrow from 347.15,90.00 to 843.26,90.00 as 3
set label "+[M]" at 595.21,93.00 center tc rgb "black" font ",17"
set arrow from 1339.37,0 to 1339.37,110 as 2
set arrow from 843.26,90.00 to 1339.37,90.00 as 3
set arrow from 843.26,90.00 to 1339.37,90.00 as 3
set label "+[M]" at 1091.32,93.00 center tc rgb "black" font ",17"
set arrow from 1835.48,0 to 1835.48,110 as 2
set arrow from 1339.37,90.00 to 1835.48,90.00 as 3
set arrow from 1339.37,90.00 to 1835.48,90.00 as 3
set label "+[M]" at 1587.42,93.00 center tc rgb "black" font ",17"
set arrow from 2331.58,0 to 2331.58,110 as 2
set arrow from 1835.48,90.00 to 2331.58,90.00 as 3
set arrow from 1835.48,90.00 to 2331.58,90.00 as 3
set label "+[M]" at 2083.53,93.00 center tc rgb "black" font ",17"
set label "392.1" at 392.13,3.70 left tc rgb "red" font ",17"
set label "364.1" at 364.13,102.00 right tc rgb "red" font ",17"
set arrow from 392.13,0 to 392.13,110 as 2
set arrow from 364.13,0 to 364.13,110 as 2
set arrow from 392.13,40.00 to 364.13,40.00 as 3
set label "-[N_2]" at 378.13,44.00 center tc rgb "black" font ",17"
set arrow from 888.24,0 to 888.24,110 as 2
set arrow from 392.13,50.00 to 888.24,50.00 as 3
set arrow from 392.13,50.00 to 888.24,50.00 as 3
set label "+[M]" at 640.19,53.00 center tc rgb "black" font ",17"
set arrow from 1384.35,0 to 1384.35,110 as 2
set arrow from 888.24,50.00 to 1384.35,50.00 as 3
set arrow from 888.24,50.00 to 1384.35,50.00 as 3
set label "+[M]" at 1136.30,53.00 center tc rgb "black" font ",17"
set arrow from 1880.46,0 to 1880.46,110 as 2
set arrow from 1384.35,50.00 to 1880.46,50.00 as 3
set arrow from 1384.35,50.00 to 1880.46,50.00 as 3
set label "+[M]" at 1632.40,53.00 center tc rgb "black" font ",17"
set arrow from 2376.56,0 to 2376.56,110 as 2
set arrow from 1880.46,50.00 to 2376.56,50.00 as 3
set arrow from 1880.46,50.00 to 2376.56,50.00 as 3
set label "+[M]" at 2128.51,53.00 center tc rgb "black" font ",17"
plot 'GR-N8-pos.dat' using 2:4 with impulses lw 5 lc -1
quit
