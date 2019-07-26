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
set output 'GR-N11-pos.svg'
set label "DC" at 149.04,20.00 left tc rgb "red" font ",17"
set label "AC" at 121.04,102.00 right tc rgb "red" font ",17"
set arrow from 149.04,0 to 149.04,110 as 2
set arrow from 121.04,0 to 121.04,110 as 2
set arrow from 149.04,80.00 to 121.04,80.00 as 3
set label "-[N_2]" at 135.04,84.00 center tc rgb "black" font ",17"
set arrow from 297.06,0 to 297.06,110 as 2
set arrow from 149.04,90.00 to 297.06,90.00 as 3
set arrow from 149.04,90.00 to 297.06,90.00 as 3
set label "+[M]" at 223.05,93.00 center tc rgb "black" font ",17"
set arrow from 445.09,0 to 445.09,110 as 2
set arrow from 297.06,90.00 to 445.09,90.00 as 3
set arrow from 297.06,90.00 to 445.09,90.00 as 3
set label "+[M]" at 371.08,93.00 center tc rgb "black" font ",17"
set arrow from 593.12,0 to 593.12,110 as 2
set arrow from 445.09,90.00 to 593.12,90.00 as 3
set arrow from 445.09,90.00 to 593.12,90.00 as 3
set label "+[M]" at 519.10,93.00 center tc rgb "black" font ",17"
set arrow from 741.14,0 to 741.14,110 as 2
set arrow from 593.12,90.00 to 741.14,90.00 as 3
set arrow from 593.12,90.00 to 741.14,90.00 as 3
set label "+[M]" at 667.13,93.00 center tc rgb "black" font ",17"
set arrow from 889.17,0 to 889.17,110 as 2
set arrow from 741.14,90.00 to 889.17,90.00 as 3
set arrow from 741.14,90.00 to 889.17,90.00 as 3
set label "+[M]" at 815.16,93.00 center tc rgb "black" font ",17"
plot 'GR-N11-pos.dat' using 2:4 with impulses lw 5 lc -1
quit
