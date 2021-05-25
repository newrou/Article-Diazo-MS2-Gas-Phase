#set terminal postscript eps
set terminal postscript eps color
#set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
set key inside right bottom vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
set title "Dissociation of precursor"
set ylabel "Dissociation, %" font "Helvetica-Bold,28"
set xlabel "E collision, eV" font "Helvetica-Bold,28"
set bars small
set xrange [-2.5:]
set yrange [-5:105]

set terminal svg size 1200,900 font "Helvetica,28"
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

unset key
#set key outside
#set nokey
set key inside

#f1(x) = 
#    k <- exp(B + (E0 + Ec[i]) / dG)
#    Af <- k / (k + 1)
k(Ec,dG,B) = exp(B + Ec/dG)
f(Ec,dG,B) = 100.0*k(Ec,dG,B)/(k(Ec,dG,B) + 1)


set output 'Diss-Article.svg'
set title "Dissociation of some derivatives phenil diazonium cations"
set yrange [-5:105]
set xrange [-10:30]
plot \
 'C6H5N2-OTf/Diss.dat'            using 1:2 with points lc 0  ps 0.5 pt 7 ti 'C_6H_5N_2^+',             f(x,1.33,1.56) lw 2 lc 0  ti '', \
 '2-NO2C6H4N2-OTf/Diss.dat'       using 1:2 with points lc 1  ps 0.5 pt 7 ti '2-NO_2C_6H_4N_2^+',       f(x,1.71,-0.84) lw 2 lc 1  ti '', \
 '3-NO2C6H4N2-OTf/Diss.dat'       using 1:2 with points lc 2  ps 0.5 pt 7 ti '3-NO_2C_6H_4N_2^+',       f(x,1.60,1.83) lw 2 lc 2  ti '', \
 '4-NO2C6H4N2-OTf/Diss.dat'       using 1:2 with points lc 3  ps 0.5 pt 7 ti '4-NO_2C_6H_4N_2^+',       f(x,1.36,1.50) lw 2 lc 3  ti '', \
 '4-CH3OC6H4N2-OTf/Diss.dat'      using 1:2 with points lc 4  ps 0.5 pt 7 ti '4-CH_3OC_6H_4N_2^+',      f(x,2.33,1.77) lw 2 lc 4  ti '', \
 '4-BrC6H4N2-OTf/Diss.dat'        using 1:2 with points lc 5  ps 0.5 pt 7 ti '4-BrC_6H_4N_2^+',         f(x,1.87,0.80) lw 2 lc 5  ti '', \
 '4-HCO2C6H4N2-OTf/Diss.dat'      using 1:2 with points lc 6  ps 0.5 pt 7 ti '4-HCO_2C_6H_4N_2^+',      f(x,1.16,2.63) lw 2 lc 6  ti '', \
 '4-Br-2-HCO2C6H3N2-OTf/Diss.dat' using 1:2 with points lc 8  ps 0.5 pt 7 ti '4-Br-2-HCO_2C_6H_3N_2^+', f(x,2.12,-0.07) lw 2 lc 8  ti ''

set output 'Diss-NO-Pyridine.svg'
set title "Dissociation of phenil and NO-pyridines diazonium cations"
set yrange [-5:105]
set xrange [-10:30]
plot \
 'C6H5N2-OTf/Diss.dat'            using 1:2 with points lc 0  ps 0.5 pt 7 ti 'C_6H_5N_2^+',             f(x,1.33,1.56) lw 2 lc 0  ti '', \
 '4-NO2C6H4N2-OTf/Diss.dat'       using 1:2 with points lc 1  ps 0.5 pt 7 ti '4-NO_2C_6H_4N_2^+',       f(x,1.36,1.50) lw 2 lc 1  ti '', \
 '4-CH3OC6H4N2-OTf/Diss.dat'      using 1:2 with points lc 2  ps 0.5 pt 7 ti '4-CH_3OC_6H_4N_2^+',      f(x,2.33,1.77) lw 2 lc 2  ti '', \
 'C5H4NO-4-N2-OTf/Diss.dat'       using 1:2 with points lc 3  ps 0.5 pt 7 ti 'C_5H_4NO-4-N2^+',         f(x,1.76,0.58) lw 2 lc 3  ti '', \
 '6-CH3C5H3NO-2-N2-OTf/Diss.dat'  using 1:2 with points lc 4  ps 0.5 pt 7 ti '6-CH_3C_5H_3NO-2-N_2^+',  f(x,1.80,0.49) lw 2 lc 4  ti ''
# '4-BrC6H4N2-OTf/Diss.dat'        using 1:2 smooth acsplines lw 3 lc 5  ti '', '' using 1:2 with points lc 5  ps 0.5 pt 7 ti '4-BrC_6H_4N_2^+ TfO^-', \
# '5-BrC5H3NON2-OTf/Diss.dat'      using 1:2 smooth acsplines lw 3 lc 6  ti '', '' using 1:2 with points lc 6  ps 0.5 pt 7 ti '5-BrC_5H_3NON_2^+ TfO^-'

set output 'Diss-All.svg'
set title "Dissociation of all diazonium cations"
set yrange [-5:105]
plot \
 'C6H5N2-OTf/Diss.dat'            using 1:2 smooth acsplines lw 3 lc 0  ti '', '' using 1:2 with points lc 0  ps 0.5 pt 7 ti 'C_6H_5N_2^+ TfO^-', \
 '2-NO2C6H4N2-OTf/Diss.dat'       using 1:2 smooth acsplines lw 3 lc 1  ti '', '' using 1:2 with points lc 1  ps 0.5 pt 7 ti '2-NO_2C_6H_4N_2^+ TfO^-', \
 '3-NO2C6H4N2-OTf/Diss.dat'       using 1:2 smooth acsplines lw 3 lc 2  ti '', '' using 1:2 with points lc 2  ps 0.5 pt 7 ti '3-NO_2C_6H_4N_2^+ TfO^-', \
 '4-NO2C6H4N2-OTf/Diss.dat'       using 1:2 smooth acsplines lw 3 lc 3  ti '', '' using 1:2 with points lc 3  ps 0.5 pt 7 ti '4-NO_2C_6H_4N_2^+ TfO^-', \
 '4-NO2C6H4N2-OTs/Diss.dat'       using 1:2 smooth acsplines lw 3 lc 4  ti '', '' using 1:2 with points lc 4  ps 0.5 pt 7 ti '4-NO_2C_6H_4N_2^+ TsO^-', \
 '4-NO2C6H4N2-BF4/Diss.dat'       using 1:2 smooth acsplines lw 3 lc 5  ti '', '' using 1:2 with points lc 5  ps 0.5 pt 7 ti '4-NO_2C_6H_4N_2^+ BF_4^-', \
 '4-CH3OC6H4N2-OTf/Diss.dat'      using 1:2 smooth acsplines lw 3 lc 6  ti '', '' using 1:2 with points lc 6  ps 0.5 pt 7 ti '4-CH_3OC_6H_4N_2^+ TfO^-', \
 '4-BrC6H4N2-OTf/Diss.dat'        using 1:2 smooth acsplines lw 3 lc 7  ti '', '' using 1:2 with points lc 7  ps 0.5 pt 7 ti '4-BrC_6H_4N_2^+ TfO^-', \
 '4-HCO2C6H4N2-OTf/Diss.dat'      using 1:2 smooth acsplines lw 3 lc 8  ti '', '' using 1:2 with points lc 8  ps 0.5 pt 7 ti '4-HCO_2C_6H_4N_2^+ TfO^-', \
 '4-Br-2-NO2C6H3N2-OTf/Diss.dat'  using 1:2 smooth acsplines lw 3 lc 9  ti '', '' using 1:2 with points lc 9  ps 0.5 pt 7 ti '4-Br-2-NO_2-C_6H_3N_2^+ TfO^-', \
 '4-Br-2-HCO2C6H3N2-OTf/Diss.dat' using 1:2 smooth acsplines lw 3 lc 10 ti '', '' using 1:2 with points lc 10 ps 0.5 pt 7 ti '4-Br-2-HCO_2C_6H_3N_2^+ TfO^-', \
 'C10H7-2-N2-OTf/Diss.dat'        using 1:2 smooth acsplines lw 3 lc 11 ti '', '' using 1:2 with points lc 11 ps 0.5 pt 7 ti 'C_1_0H_7-2-N_2^+ TfO^-', \
 'C5H4NO-4-N2-OTf/Diss.dat'       using 1:2 smooth acsplines lw 3 lc 12 ti '', '' using 1:2 with points lc 12 ps 0.5 pt 7 ti 'C_5H_4NO-4-N2^+ TfO^-', \
 '6-CH3C5H3NO-2-N2-OTf/Diss.dat'  using 1:2 smooth acsplines lw 3 lc 13 ti '', '' using 1:2 with points lc 13 ps 0.5 pt 7 ti '6-CH_3C_5H_3NO-2-N_2^+ TfO^-', \
 '5-BrC5H3NO-2-N2-OTf/Diss.dat'      using 1:2 smooth acsplines lw 3 lc 14 ti '', '' using 1:2 with points lc 14 ps 0.5 pt 7 ti '5-BrC_5H_3NO-2-N_2^+ TfO^-'

quit
