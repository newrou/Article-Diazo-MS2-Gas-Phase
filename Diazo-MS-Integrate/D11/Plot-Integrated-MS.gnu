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

set arrow from 121,0 to 121,50 as 2
set label "(B)" at 92,48 center font "Helvetica,20"
set arrow from 149,0 to 149,50 as 2
set label "(A)" at 180,16 center font "Helvetica,20"
set arrow from 447,0 to 447,50 as 2
set label "(C1)" at 480,7 center font "Helvetica,20"
set arrow from 745,0 to 745,50 as 2
#set label "(C2)" at 780, center font "Helvetica,20"
set arrow from 1043,0 to 1043,50 as 2
set label "(C3)" at 1073,2 center font "Helvetica,20"
#set arrow from 1341,0 to 1341,50 as 2
#set arrow from 1639,0 to 1639,50 as 2
#set arrow from 1937,0 to 1937,50 as 2

set arrow from 269,0 to 269,40 as 2
set label "(D1)" at 298,3.5 center font "Helvetica,20"
set arrow from 390,0 to 390,40 as 2
set label "(D2)" at 418,4 center font "Helvetica,20"
set arrow from 510,0 to 510,40 as 2
set label "(D3)" at 538,24 center font "Helvetica,20"
set arrow from 630,0 to 630,40 as 2
set label "(D4)" at 658,31 center font "Helvetica,20"
set arrow from 750,0 to 750,40 as 2
set label "(D5)" at 778,22 center font "Helvetica,20"
set arrow from 870,0 to 870,40 as 2
set label "(D6)" at 898,13 center font "Helvetica,20"
set arrow from 990,0 to 990,40 as 2
set label "(D7)" at 1018,5 center font "Helvetica,20"
set arrow from 1110,0 to 1110,40 as 2
set label "(D8)" at 1136,3 center font "Helvetica,20"
set arrow from 1230,0 to 1230,40 as 2
set label "(D9)" at 1256,2 center font "Helvetica,20"

set arrow from 149,35 to 269,35 as 3
#set label "+120" at 209,36 center font "Helvetica,20"
set label "+[E]" at 209,37 center font "Helvetica,20"
set arrow from 269,35 to 390,35 as 3
set label "+[E]" at 329,37 center font "Helvetica,20"
set arrow from 390,35 to 510,35 as 3
set label "+[E]" at 450,37 center font "Helvetica,20"
set arrow from 510,35 to 630,35 as 3
set label "+[E]" at 570,37 center font "Helvetica,20"
set arrow from 630,35 to 750,35 as 3
set label "+[E]" at 690,37 center font "Helvetica,20"
set arrow from 750,35 to 870,35 as 3
set label "+[E]" at 810,37 center font "Helvetica,20"
set arrow from 870,35 to 990,35 as 3
set label "+[E]" at 930,37 center font "Helvetica,20"
set arrow from 990,35 to 1110,35 as 3
set label "+[E]" at 1050,37 center font "Helvetica,20"
set arrow from 1110,35 to 1230,35 as 3
set label "+[E]" at 1170,37 center font "Helvetica,20"

set arrow from 150,30 to 122,30 as 3
set label "-28 [N2]" at 60,30 center font "Helvetica,20"

set arrow from 150,44 to 447,44 as 3
#set label "+298 [M]" at 298,43 center font "Helvetica,20"
set label "+[HCO_2C_6H_4N_2^+ TfO^-]" at 298,46 center font "Helvetica,20"

set arrow from 447,44 to 745,44 as 3
set label "+[HCO_2C_6H_4N_2^+ TfO^-]" at 596,46 center font "Helvetica,20"

set arrow from 745,44 to 1043,44 as 3
set label "+[HCO_2C_6H_4N_2^+ TfO^-]" at 894,46 center font "Helvetica,20"

#set arrow from 1043,42 to 1341,42 as 3
#set label "+298 [M]" at 1192,43 center font "Helvetica,20"

#set arrow from 1341,42 to 1639,42 as 3
#set label "+298 [M]" at 1490,43 center font "Helvetica,20"

#set arrow from 1639,42 to 1937,42 as 3
#set label "+298 [M]" at 1788,43 center font "Helvetica,20"

plot 'tmp-ms.dat' using 2:($3/1000) with impulses lw 5 lc -1

quit
