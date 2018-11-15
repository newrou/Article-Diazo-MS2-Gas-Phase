set terminal postscript eps mono
set key inside right top vertical Right noreverse enhanced autotitles box linetype -1 linewidth 0.200
#set title "TD spectr"
set xlabel "d(C-N), A" font "Helvetica-Bold,14"
set ylabel "E, kJ/mol" font "Helvetica-Bold,14"
set bars small
#set xrange [7.0:1.0]
set xrange [1.2:3.5]
#set yrange [-100:0]
#set size 0.5,0.5
#set terminal postscript enhanced "Courier" 20

set termoption dash

set linestyle 1 lt 1 lw 2 lc 0
set linestyle 2 lt 2 lw 2 lc 1
set linestyle 3 lt 3 lw 2 lc 2
set linestyle 4 lt 4 lw 2 lc 3
set linestyle 5 lt 5 lw 2 lc 4
set linestyle 6 lt 6 lw 2 lc 5
set linestyle 7 lt 7 lw 2 lc 6
set linestyle 8 lt 8 lw 2 lc 7
set linestyle 9 lt 9 lw 2 lc 8
set linestyle 10 lt 10 lw 2 lc 9

set terminal png size 1200,900 enhanced font "Helvetica,18"

set output "All-scan.png"
plot "C6H4-N2.csv" using 2:5 with lines linestyle 1 ti "C_6H_4N_2", \
    "4-CH3O-C6H3-N2.csv" using 2:5 with lines linestyle 2 ti "4-CH_3OC_6H_3N_2", \
    "4-NO2-C6H3-N2.csv" using 2:5 with lines linestyle 3 ti "4-NO_2C_6H_3N_2", \
    "3-NO2-C6H3-N2-v1.csv" using 2:5 with lines linestyle 4 ti "3-NO_2C_6H_3N_2 (v1)", \
    "3-NO2-C6H3-N2-v2.csv" using 2:5 with lines linestyle 5 ti "3-NO_2C_6H_3N_2 (v2)", \
    "2-NO2-C6H3-N2.csv" using 2:5 with lines linestyle 6 ti "2-NO_2C_6H_3N_2", \
    "4-Br-C6H3-N2.csv" using 2:5 with lines linestyle 7 ti "4-BrC_6H_3N_2", \
    "4-HOOC-C6H3-N2.csv" using 2:5 with lines linestyle 8 ti "4-HOOCC_6H_3N_2", \
    "2-HOOC-C6H3-N2.csv" using 2:5 with lines linestyle 9 ti "2-HOOCC_6H_3N_2", \
    "2-HOOC-4-Br-C6H2-N2.csv" using 2:5 with lines linestyle 10 ti "2-HOOC-4-BrC_6H_2N_2"

quit
