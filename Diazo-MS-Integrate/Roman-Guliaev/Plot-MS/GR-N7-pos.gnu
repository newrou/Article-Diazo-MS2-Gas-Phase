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
set output 'GR-N7-pos.svg'
set label "DC" at 181.08,26.30 left tc rgb "red" font ",17"
set label "AC" at 153.08,102.00 right tc rgb "red" font ",17"
set arrow from 181.08,0 to 181.08,110 as 2
set arrow from 153.08,0 to 153.08,110 as 2
set arrow from 181.08,40.00 to 153.08,40.00 as 3
set label "-[N_2]" at 167.08,44.00 center tc rgb "black" font ",17"
set arrow from 511.11,0 to 511.11,110 as 2
set arrow from 181.08,50.00 to 511.11,50.00 as 3
set arrow from 181.08,50.00 to 511.11,50.00 as 3
set label "+[M]" at 346.09,53.00 center tc rgb "black" font ",17"
set arrow from 841.13,0 to 841.13,110 as 2
set arrow from 511.11,50.00 to 841.13,50.00 as 3
set arrow from 511.11,50.00 to 841.13,50.00 as 3
set label "+[M]" at 676.12,53.00 center tc rgb "black" font ",17"
set arrow from 1171.16,0 to 1171.16,110 as 2
set arrow from 841.13,50.00 to 1171.16,50.00 as 3
set arrow from 841.13,50.00 to 1171.16,50.00 as 3
set label "+[M]" at 1006.15,53.00 center tc rgb "black" font ",17"
set arrow from 1501.19,0 to 1501.19,110 as 2
set arrow from 1171.16,50.00 to 1501.19,50.00 as 3
set arrow from 1171.16,50.00 to 1501.19,50.00 as 3
set label "+[M]" at 1336.18,53.00 center tc rgb "black" font ",17"
set arrow from 1831.22,0 to 1831.22,110 as 2
set arrow from 1501.19,50.00 to 1831.22,50.00 as 3
set arrow from 1501.19,50.00 to 1831.22,50.00 as 3
set label "+[M]" at 1666.21,53.00 center tc rgb "black" font ",17"
set arrow from 2161.25,0 to 2161.25,110 as 2
set arrow from 1831.22,50.00 to 2161.25,50.00 as 3
set arrow from 1831.22,50.00 to 2161.25,50.00 as 3
set label "+[M]" at 1996.23,53.00 center tc rgb "black" font ",17"
set label "226.1" at 226.06,5.00 left tc rgb "red" font ",17"
set label "198.1" at 198.06,2.20 right tc rgb "red" font ",17"
set arrow from 226.06,0 to 226.06,110 as 2
set arrow from 198.06,0 to 198.06,110 as 2
set arrow from 226.06,80.00 to 198.06,80.00 as 3
set label "-[N_2]" at 212.06,84.00 center tc rgb "black" font ",17"
set arrow from 556.09,0 to 556.09,110 as 2
set arrow from 226.06,90.00 to 556.09,90.00 as 3
set arrow from 226.06,90.00 to 556.09,90.00 as 3
set label "+[M]" at 391.07,93.00 center tc rgb "black" font ",17"
set arrow from 886.11,0 to 886.11,110 as 2
set arrow from 556.09,90.00 to 886.11,90.00 as 3
set arrow from 556.09,90.00 to 886.11,90.00 as 3
set label "+[M]" at 721.10,93.00 center tc rgb "black" font ",17"
set arrow from 1216.14,0 to 1216.14,110 as 2
set arrow from 886.11,90.00 to 1216.14,90.00 as 3
set arrow from 886.11,90.00 to 1216.14,90.00 as 3
set label "+[M]" at 1051.13,93.00 center tc rgb "black" font ",17"
set arrow from 1546.17,0 to 1546.17,110 as 2
set arrow from 1216.14,90.00 to 1546.17,90.00 as 3
set arrow from 1216.14,90.00 to 1546.17,90.00 as 3
set label "+[M]" at 1381.16,93.00 center tc rgb "black" font ",17"
set arrow from 1876.20,0 to 1876.20,110 as 2
set arrow from 1546.17,90.00 to 1876.20,90.00 as 3
set arrow from 1546.17,90.00 to 1876.20,90.00 as 3
set label "+[M]" at 1711.19,93.00 center tc rgb "black" font ",17"
set arrow from 2206.23,0 to 2206.23,110 as 2
set arrow from 1876.20,90.00 to 2206.23,90.00 as 3
set arrow from 1876.20,90.00 to 2206.23,90.00 as 3
set label "+[M]" at 2041.21,93.00 center tc rgb "black" font ",17"
plot 'GR-N7-pos.dat' using 2:4 with impulses lw 5 lc -1
quit
