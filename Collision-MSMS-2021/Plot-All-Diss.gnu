#set terminal postscript eps
set terminal postscript eps color
#set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
set key inside right bottom vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
#set title "Dissociation of precursor"
#set ylabel "Dissociation, %" font "Helvetica-Bold,28"
#set xlabel "E collision, eV" font "Helvetica-Bold,28"
set bars small
set xrange [-2.5:]
set yrange [-5:105]

set terminal svg size 1200,750 font "Helvetica,24"
#set terminal png size 2400,1800 font "Helvetica,32"
#set term postscript landscape color solid size 1200,900 font "Helvetica,28"
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

#unset key
#set key outside
#set nokey
set key inside

#f1(x) = 
#    k <- exp(B + (E0 + Ec[i]) / dG)
#    Af <- k / (k + 1)
k(Ec,dG,B) = exp(B + Ec/dG)
f(Ec,dG,B) = 100.0*k(Ec,dG,B)/(k(Ec,dG,B) + 1)


#set output 'Compare-Diss-DC-DS.ps'
set output 'Compare-Diss-DC-DS.svg'
#set output 'Compare-Diss-DC-DS.png'
set ylabel "Dissociation, %" font "Helvetica-Bold,24"
set xlabel "E collision, eV" font "Helvetica-Bold,24"
#set ylabel "Dissociation, %" font "Helvetica-Bold,56"
#set xlabel "E collision, eV" font "Helvetica-Bold,56"
#set title "Dissociation of some derivatives phenil diazonium cations"
set yrange [-5:105]
set xrange [-10:45]
plot \
 'Eval-Diss.dat'     every ::1 using 1:2 with points lc 1  ps 0.5 pt 1 ti '',        f(x,1.3621,1.4993) lw 2 lc 1  ti '4-NO_2C_6H_4N_2^+', \
 'BF4/Eval-Diss.dat' every ::1 using 1:2 with points lc 2  ps 0.5 pt 2 ti '', f(x,4.9609,-1.0160) lw 2 lc 2  ti '4-NO_2C_6H_4N_2^+ BF_4^-', \
 'TsO/Eval-Diss.dat' every ::1 using 1:2 with points lc 3  ps 0.5 pt 3 ti '',  f(x,7.2365,-0.9391) lw 2 lc 3  ti '4-NO_2C_6H_4N_2^+ TsO^-', \
 'TfO/Eval-Diss.dat' every ::1 using 1:2 with points lc 4  ps 0.5 pt 4 ti '',  f(x,6.3355,-0.9360) lw 2 lc 4  ti '4-NO_2C_6H_4N_2^+ TfO^-'


quit

# 'Eval-Diss.dat'     every ::1 using 1:2 with points lc 1  ps 0.5 pt 1 ti '',        f(x,1.36,1.50) lw 2 lc 1  ti '4-NO_2C_6H_4N_2^+', \
