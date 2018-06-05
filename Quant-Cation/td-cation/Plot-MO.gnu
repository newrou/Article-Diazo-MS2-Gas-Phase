#set terminal postscript eps
set terminal postscript eps color
set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
#set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
#set title "TD spectr" 
set ylabel "E, Hartree" font "Helvetica-Bold,22"
set y2label "E, kJ/Mol" font "Helvetica-Bold,22"
set bars small
set xrange [0:5]
set ytics axis nomirror out scale 0.5

#set terminal svg size 900,900 font "Helvetica,22"
#set key autotitle columnhead

set terminal gif giant size 900,1200 transparent linewidth 2 font "Helvetica,18"
#set key autotitle columnhead

set datafile separator ";"

set style line 1 lt 1 pt 1 ps 0 lw 1
set style line 2 lt 2 pt 2 ps 0 lw 0 lc -1
set style line 3 lt 3 pt 3 ps 0 lw 1
set style line 4 lt 4 pt 4 ps 0 lw 1

unset colorbox
set palette gray
set cbrange [ 0 : 128 ] noreverse nowriteback

set yrange [-16:6]
set y2range [-16*2625.5:6*2625.5]
set ytics 2
set y2tics 5000
set output "MO.gif"
set label "Ph^+" at 1,5 center
set label "N_2" at 2,5 center
set label "Ph-N_2^+" at 4,5 center
plot "s1.mo" using (1):1:(0.2):(64-64*$2) with xerr linestyle 1 lc palette ti "", \
     "s2.mo" using (2):1:(0.2):(64-64*$2) with xerr linestyle 1 lc palette ti "", \
     "p1.mo" using (4):1:(0.2):(64-64*$2) with xerr linestyle 1 lc palette ti ""

set yrange [-0.6:-0.2]
set y2range [-0.6*2625.5:-0.2*2625.5]
set ytics 0.1
set y2tics 100
set output "MO-zoom.gif"
set label "Ph^+" at 1,-0.21 center
set label "N_2" at 2,-0.21 center
set label "Ph-N_2^+" at 4,-0.21 center
plot "s1.mo" using (1):1:(0.2):(64-64*$2) with xerr linestyle 1 lc palette ti "", \
     "s2.mo" using (2):1:(0.2):(64-64*$2) with xerr linestyle 1 lc palette ti "", \
     "p1.mo" using (4):1:(0.2):(64-64*$2) with xerr linestyle 1 lc palette ti ""

quit
