set terminal postscript eps mono
set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
#set title "TD spectr" 
set ylabel "E, kJ/mol" font "Helvetica-Bold,18"
set xlabel "d, A" font "Helvetica-Bold,18"
set bars small
#set xrange [0:100]
#set yrange [-100:0]
#set size 0.5,0.5
#set terminal postscript enhanced "Courier" 20

set terminal svg size 1200,900 font "Helvetica,18"
#set key autotitle columnhead
#set datafile separator " "
set termoption dash

set linestyle 1 lt 1 lw 3 lc 0
set linestyle 2 lt 2 lw 3 lc 1
set linestyle 3 lt 3 lw 3 lc 2
set linestyle 4 lt 4 lw 3 lc 3
set linestyle 5 lt 5 lw 3 lc 4
set linestyle 6 lt 6 lw 3 lc 5
set linestyle 7 lt 7 lw 3 lc 6
set linestyle 8 lt 8 lw 3 lc 7


#set table "./pdata"
#set xrange [1.1:4.9]
set xrange [1.1:4.9]
set output "scan.svg"
set ylabel "E, kJ/mol" font "Helvetica-Bold,18"
plot  "relaxscanact" using 1:(($2)*2625.5) with lines linestyle 3 ti "act", \
 "relaxscanscf" using 1:(($2)*2625.5) with points linestyle 6 ti "scf"

#set table "./pdata-eh"
set xrange [1.1:4.9]
set output "scan-eh.svg"
set ylabel "E, eh" font "Helvetica-Bold,18"
plot  "relaxscanact" using 1:2 with lines linestyle 3 ti "act", \
 "relaxscanscf" using 1:2 with points linestyle 6 ti "scf"

#plot  "relaxscanact" using 1:2 smooth csplines with lines linestyle 1 ti "act", \
# "relaxscanscf" using 1:2 smooth csplines with lines linestyle 2 ti "scf"

quit

