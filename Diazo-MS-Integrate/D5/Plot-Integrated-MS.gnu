#set terminal postscript eps
set terminal postscript eps color
set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
#set title "Integrate MS Spectr"
set ylabel "Ambulanse, abs." font "Helvetica-Bold,22"
#set y2label "Ambulanse, %" font "Helvetica-Bold,22"
set xlabel "M/Z, a.e.m." font "Helvetica-Bold,22"
set bars small
#set xrange [`echo $MZRANGE`]
set xrange [0:2000]
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

set arrow from 122,0 to 122,600 as 2
set label "(B)" at 98,150 center font "Helvetica,20"
set arrow from 150,0 to 150,600 as 2
set label "(A)" at 174,305 center font "Helvetica,20"
set arrow from 471,0 to 471,600 as 2
set label "(C1)" at 501,212 center font "Helvetica,20"
set arrow from 792,0 to 792,600 as 2
set label "(C2)" at 820,430 center font "Helvetica,20"
set arrow from 1113,0 to 1113,600 as 2
set label "(C3)" at 1143,568 center font "Helvetica,20"
set arrow from 1434,0 to 1434,600 as 2
set label "(C4)" at 1464,258 center font "Helvetica,20"
set arrow from 1755,0 to 1755,600 as 2
set label "(C5)" at 1785,118 center font "Helvetica,20"

set arrow from 150,240 to 122,240 as 3
set label "-28 [N2]" at 60,240 center font "Helvetica,20"

set arrow from 150,160 to 471,160 as 3
#set label "+321 [M]" at 300,170 center font "Helvetica,20"
set label "+[NO_2C_6H_4N_2^+ TsO^-]" at 310,180 center font "Helvetica,20"

set arrow from 471,160 to 792,160 as 3
set label "+[NO_2C_6H_4N_2^+ TsO^-]" at 632,180 center font "Helvetica,20"

set arrow from 792,160 to 1113,160 as 3
set label "+[NO_2C_6H_4N_2^+ TsO^-]" at 953,180 center font "Helvetica,20"

set arrow from 1113,160 to 1434,160 as 3
set label "+[NO_2C_6H_4N_2^+ TsO^-]" at 1274,180 center font "Helvetica,20"

set arrow from 1434,160 to 1755,160 as 3
set label "+[NO_2C_6H_4N_2^+ TsO^-]" at 1595,180 center font "Helvetica,20"

plot 'tmp-ms.dat' using 2:($3/1000) with impulses lw 5 lc -1

quit
