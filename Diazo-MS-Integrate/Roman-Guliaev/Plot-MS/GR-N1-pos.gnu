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
set output 'GR-N1-pos.svg'
set label "DC" at 150.03,3.00 left tc rgb "red" font ",17"
set label "AC" at 122.03,4.80 right tc rgb "red" font ",17"
set arrow from 150.03,0 to 150.03,110 as 2
set arrow from 122.03,0 to 122.03,110 as 2
set arrow from 150.03,40.00 to 122.03,40.00 as 3
set label "-[N_2]" at 136.03,44.00 center tc rgb "black" font ",17"
set arrow from 483.05,0 to 483.05,110 as 2
set arrow from 150.03,50.00 to 483.05,50.00 as 3
set arrow from 150.03,50.00 to 483.05,50.00 as 3
set label "+[M]" at 316.54,53.00 center tc rgb "black" font ",17"
set arrow from 816.07,0 to 816.07,110 as 2
set arrow from 483.05,50.00 to 816.07,50.00 as 3
set arrow from 483.05,50.00 to 816.07,50.00 as 3
set label "+[M]" at 649.56,53.00 center tc rgb "black" font ",17"
set arrow from 1149.09,0 to 1149.09,110 as 2
set arrow from 816.07,50.00 to 1149.09,50.00 as 3
set arrow from 816.07,50.00 to 1149.09,50.00 as 3
set label "+[M]" at 982.58,53.00 center tc rgb "black" font ",17"
set arrow from 1482.10,0 to 1482.10,110 as 2
set arrow from 1149.09,50.00 to 1482.10,50.00 as 3
set arrow from 1149.09,50.00 to 1482.10,50.00 as 3
set label "+[M]" at 1315.59,53.00 center tc rgb "black" font ",17"
set label "271.1" at 271.13,102.00 left tc rgb "red" font ",17"
set label "243.1" at 243.13,102.00 right tc rgb "red" font ",17"
set arrow from 271.13,0 to 271.13,110 as 2
set arrow from 243.13,0 to 243.13,110 as 2
set arrow from 271.13,80.00 to 243.13,80.00 as 3
set label "-[N_2]" at 257.13,84.00 center tc rgb "black" font ",17"
set arrow from 604.14,0 to 604.14,110 as 2
set arrow from 271.13,90.00 to 604.14,90.00 as 3
set arrow from 271.13,90.00 to 604.14,90.00 as 3
set label "+[M]" at 437.64,93.00 center tc rgb "black" font ",17"
set arrow from 937.16,0 to 937.16,110 as 2
set arrow from 604.14,90.00 to 937.16,90.00 as 3
set arrow from 604.14,90.00 to 937.16,90.00 as 3
set label "+[M]" at 770.65,93.00 center tc rgb "black" font ",17"
set arrow from 1270.18,0 to 1270.18,110 as 2
set arrow from 937.16,90.00 to 1270.18,90.00 as 3
set arrow from 937.16,90.00 to 1270.18,90.00 as 3
set label "+[M]" at 1103.67,93.00 center tc rgb "black" font ",17"
set arrow from 1603.20,0 to 1603.20,110 as 2
set arrow from 1270.18,90.00 to 1603.20,90.00 as 3
set arrow from 1270.18,90.00 to 1603.20,90.00 as 3
set label "+[M]" at 1436.69,93.00 center tc rgb "black" font ",17"
set arrow from 150.03,65.00 to 271.13,65.00 as 3
set label "+121.1" at 210.58,68.00 center tc rgb "black" font ",17"
plot 'GR-N1-pos.dat' using 2:4 with impulses lw 5 lc -1
quit
