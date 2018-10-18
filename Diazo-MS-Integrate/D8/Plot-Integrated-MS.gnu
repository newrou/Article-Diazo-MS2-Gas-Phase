#set terminal postscript eps
set terminal postscript eps color
set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
#set title "Integrate MS Spectr"
set ylabel "Ambulanse, abs." font "Helvetica-Bold,22"
#set y2label "Ambulanse, %" font "Helvetica-Bold,22"
set xlabel "M/Z, a.e.m." font "Helvetica-Bold,22"
set bars small
#set xrange [`echo $MZRANGE`]
set xrange [0:1500]
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

set arrow from 155,0 to 155,70 as 2
set label "(B)" at 130,45 center font "Helvetica,20"
set arrow from 183,0 to 183,70 as 2
set label "(A)" at 197,32 center font "Helvetica,20"
set arrow from 517,0 to 517,70 as 2
set label "(C1)" at 540,15 center font "Helvetica,20"
set arrow from 849,0 to 849,70 as 2
set label "(C2)" at 870,2 center font "Helvetica,20"
#set arrow from 1183,0 to 1183,70 as 2
#set arrow from 1515,0 to 1515,70 as 2
#set arrow from 1848,0 to 1848,70 as 2

set arrow from 365,0 to 365,50 as 2
set label "(D1)" at 352,7 center font "Helvetica,20"
set arrow from 549,0 to 549,50 as 2
set label "(E2)" at 580,3 center font "Helvetica,20"
set arrow from 697,0 to 697,50 as 2
set label "(D2)" at 720,2 center font "Helvetica,20"

set arrow from 183,48 to 155,48 as 3
set label "-28 [N2]" at 80,48 center font "Helvetica,20"

set arrow from 183,55 to 517,55 as 3
#set label "+334 [M]" at 350,58 center font "Helvetica,20"
set label "+[BrC_6H_4N_2^+ TfO^-]" at 350,58 center font "Helvetica,20"

set arrow from 517,55 to 849,55 as 3
set label "+[BrC_6H_4N_2^+ TfO^-]" at 683,58 center font "Helvetica,20"

#set arrow from 849,55 to 1183,55 as 3
#set label "+334 [M]" at 1016,58 center font "Helvetica,20"

#set arrow from 1183,55 to 1515,55 as 3
#set label "+334 [M]" at 1349,58 center font "Helvetica,20"

#set arrow from 1515,55 to 1848,55 as 3
#set label "+334 [M]" at 1682,58 center font "Helvetica,20"


set arrow from 516,40 to 365,40 as 3
set label "-[HOTf]" at 410,42 center font "Helvetica,20"

set arrow from 847,40 to 698,40 as 3
set label "-[HOTf]" at 773,42 center font "Helvetica,20"

set arrow from 698,40 to 547,40 as 3
set label "-[HOTf]" at 623,42 center font "Helvetica,20"

#set arrow from 365,30 to 547,30 as 3
#set label "+[BrC_6H_3N^2]" at 540,32 center font "Helvetica,20"


plot 'tmp-ms.dat' using 2:($3/1000) with impulses lw 5 lc -1

quit
