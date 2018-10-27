set terminal postscript eps mono
set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
#set title "TD spectr" 
set xlabel "d(C-NO), A" font "Helvetica-Bold,18"
set bars small
set xrange [1.0:4.9]
#set yrange [-100:0]
#set size 0.5,0.5
#set terminal postscript enhanced "Courier" 20

set termoption dash

set linestyle 1 lt 1 lw 3 lc 0
set linestyle 2 lt 2 lw 3 lc 1
set linestyle 3 lt 3 lw 3 lc 2
set linestyle 4 lt 4 lw 3 lc 3
set linestyle 5 lt 5 lw 3 lc 4
set linestyle 6 lt 6 lw 3 lc 5
set linestyle 7 lt 7 lw 3 lc 6
set linestyle 8 lt 8 lw 3 lc 7

set terminal png size 1200,900 enhanced font "Helvetica,18"

set nokey
set output "scan.png"
set ylabel "E, kJ/mol" font "Helvetica-Bold,18"
plot "o-NO2-Ph+-B3LYPG-aug-cc-pVDZ-scan-d09-49-n400.csv" using 2:5 with lines linestyle 3 ti ""

set output "scan-eh.png"
set ylabel "E, eh" font "Helvetica-Bold,18"
plot "o-NO2-Ph+-B3LYPG-aug-cc-pVDZ-scan-d09-49-n400.csv" using 2:3 with lines linestyle 3 ti ""
quit

