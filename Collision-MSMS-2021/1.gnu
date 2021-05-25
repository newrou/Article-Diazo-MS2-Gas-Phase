set terminal svg size 600,400 dynamic enhanced font 'arial,11' mousing butt dashlength 1.0 
set output 'lines_arrows.2.svg'
set style increment default
set style line 1  linecolor rgb "red"  linewidth 3.000 dashtype 2 pointtype 2 pointsize default pointinterval 0 pointnumber 0
set style line 2  linecolor rgb "orange"  linewidth 2.000 dashtype 2 pointtype 2 pointsize default pointinterval 0 pointnumber 0
set style line 3  linecolor rgb "yellow"  linewidth 3.000 dashtype 2 pointtype 2 pointsize default pointinterval 0 pointnumber 0
set style line 4  linecolor rgb "green"  linewidth 2.000 dashtype 2 pointtype 2 pointsize default pointinterval 0 pointnumber 0
set offsets 0.05, 0.05, 0, 0
set style function points
unset xtics
unset ytics
set title "The pointinterval property is another way to create interrupted lines" 
set xlabel "This technique works best for equally spaced data points" 
set xrange [ -0.500000 : 3.30000 ] noreverse nowriteback
set x2range [ * : * ] noreverse writeback
set yrange [ -1.00000 : 1.40000 ] noreverse nowriteback
set y2range [ * : * ] noreverse writeback
set zrange [ * : * ] noreverse writeback
set cbrange [ * : * ] noreverse writeback
set rrange [ * : * ] noreverse writeback
set bmargin  6
unset colorbox
plot cos(x)     lt -1 pi -4 pt 6 title 'pi -4',        cos(x-.8)  lt -1 pi -3 pt 7 ps 0.2 title 'pi -3 pt 7 ps 0.2',       cos(x-.2)  lt -1 pi -6 pt 7 title 'pi -6',     cos(x-.4)  lt -1 pi -3 pt 4 title 'pi -3',     cos(x-.6)  lt -1 pi -5 pt 5 title 'pi -5',      cos(x-1.)  with line lt -1 notitle,       cos(x+.2)  with line lt -1 lw 2 title 'lw 2'
