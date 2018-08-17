<?php

function sqr($x) {
 return $x*$x;
}

function AtomDist($a, $b) {
 return sqrt(sqr($a['x']-$b['x'])+sqr($a['y']-$b['y'])+sqr($a['z']-$b['z']));
}

function AtomAngle($a, $b, $c) {
 $x1 = $a['x']-$b['x']; $y1 = $a['y']-$b['y']; $z1 = $a['z']-$b['z']; 
 $x2 = $c['x']-$b['x']; $y2 = $c['y']-$b['y']; $z2 = $c['z']-$b['z']; 
 return 57.295779513*acos(($x1*$x2 + $y1*$y2 + $z1*$z2)/(sqrt( $x1*$x1 + $y1*$y1 + $z1*$z1 )*sqrt( $x2*$x2 + $y2*$y2 + $z2*$z2 )));
}

function AtomSurface($a, $b, $c) {
 $x0 = $a['x']; $y0 = $a['y']; $z0 = $a['z'];
 $x1 = $b['x']; $y1 = $b['y']; $z1 = $b['z'];
 $x2 = $c['x']; $y2 = $c['y']; $z2 = $c['z'];
 $A = ($y1-$y0)*($z2-$z0) - ($z1-$z0)*($y2-$y0);
 $B = -($x1-$x0)*($z2-$z0) + ($z1-$z0)*($x2-$x0);
 $C = ($x1-$x0)*($y2-$y0) - ($y1-$y0)*($x2-$x0);
 $D = -($x0*$A + $y0*$B + $z0*$C);
// printf("Surface A=%f B=%f C=%f D=%f ", $A, $B, $C, $D );
 $r = array( 'A'=>$A, 'B'=>$B, 'C'=>$C, 'D'=>$D );
// printf("(r1=%f r2=%f r3=%f)", AtomSurfaceDist($r,$a), AtomSurfaceDist($r,$b), AtomSurfaceDist($r,$c) );
// printf("\n");
 return $r;
}

function AtomSurfaceDist($Surf, $a) {
 $x0 = $a['x']; $y0 = $a['y']; $z0 = $a['z'];
 $A = $Surf['A']; $B = $Surf['B']; $C = $Surf['C']; $D = $Surf['D']; 
 if( ($A*$A + $B*$B + $C*$C)>0 ) return abs($A*$x0 + $B*$y0 + $C*$z0 + $D)/sqrt($A*$A + $B*$B + $C*$C);
 else return -1;
}

function ReadMol($fname) {
 $mAtom = array();
 $row = 0;
 if (($handle = fopen($fname, "r")) !== FALSE) {
    fgets($handle);
    fgets($handle);
    while (($str = fgets($handle)) !== FALSE) {
 	$data = preg_split("/[\s]+/", $str);
        $num = count($data);
 	if($num>2) {
 		$mAtom[$row] = array('name'=>$data[0], 'x'=>$data[1], 'y'=>$data[2], 'z'=>$data[3], 'index'=>$row, 'bonds'=>array());
 		$row++;
 	}
    }
    fclose($handle);
 }
 return $mAtom;
}

function RebondMol(&$mol) {
 for($i=0; $i<count($mol); $i++) {
//    printf("Atom %s%ld:\n", $mol[$i]['name'], $i);
    for($j=$i+1; $j<count($mol); $j++) {
	$d = AtomDist($mol[$i],$mol[$j]);
	if($d > 1.8) continue;
//	printf("Bond %s%ld-%s%ld %.3f\n", $mol[$i]['name'], $i, $mol[$j]['name'], $j, $d);
	$mol[$i]['bonds'][]=$j;
	$mol[$j]['bonds'][]=$i;
    }
 }
}

function PrintMol(&$mol) {
 for($i=0; $i<count($mol); $i++) {
    printf("Atom %s%ld:\n", $mol[$i]['name'], $i);
    for($b=0; $b<count($mol[$i]['bonds']); $b++) {
	$j = $mol[$i]['bonds'][$b];
	$d = AtomDist($mol[$i],$mol[$j]);
	printf(" Bond %s%ld-%s%ld %.3f\n", $mol[$i]['name'], $i, $mol[$j]['name'], $j, $d);
    }
 }
}

function FindCNN($mol) {
 $N1=-1;$N2=-1;$C3=-1;
 for($i=0; $i<count($mol); $i++) {
    if(count($mol[$i]['bonds'])>1) continue;
    if(strcmp($mol[$i]['name'],"N")!=0) continue;
    $N1=$i;
    $N2=$mol[$N1]['bonds'][0];
    if(count($mol[$N2]['bonds'])!=2) continue;
    $L1=$mol[$N2]['bonds'][0];
    $L2=$mol[$N2]['bonds'][1];
    if($L1!=$N1 && strcmp($mol[$L1]['name'],"C")==0) $C3=$L1;
    if($L2!=$N1 && strcmp($mol[$L2]['name'],"C")==0) $C3=$L2;

    printf("Group %s%ld-%s%ld-%s%ld", $mol[$N1]['name'], $N1, $mol[$N2]['name'], $N2, $mol[$C3]['name'], $C3);
    printf(" Distance C-N=%.4f", AtomDist( $mol[$C3], $mol[$N2] ));
    printf(" Distance N-N=%.4f", AtomDist( $mol[$N1], $mol[$N2] ));
    printf(" Angle=%.2f\n", AtomAngle( $mol[$N1], $mol[$N2], $mol[$C3] ));

    $r=array();
    if(FindRingEnd($mol, $C3, array(), $r)==true) {
	$n = count($r);
	printf("Ring %s%ld", $mol[$r[0]]['name'], $r[0]); for($j=1; $j<$n; $j++) printf("-%s%ld", $mol[$r[$j]]['name'], $r[$j]);
	$sa = SumAngleRing($mol, $r);
	$sf = SumSurfaceRing($mol, $r);
	printf(" SumAnges=%.2f(%.2f%%) SumDistance=%.4f\n", $sa, 100*$sa/(180.0*($n-2)), $sf );
    }
 }
}

function FindC($mol) {
 $C3=-1;
 for($i=0; $i<count($mol); $i++) {
    if(strcmp($mol[$i]['name'],"C")!=0) continue;
    if(count($mol[$i]['bonds'])!=2) continue;
    $C3=$i;
    $r=array();
    if(FindRingEnd($mol, $C3, array(), $r)==true) {
	$n = count($r);
	printf("Ring %s%ld", $mol[$r[0]]['name'], $r[0]); for($j=1; $j<$n; $j++) printf("-%s%ld", $mol[$r[$j]]['name'], $r[$j]);
	$sa = SumAngleRing($mol, $r);
	$sf = SumSurfaceRing($mol, $r);
	printf(" SumAnges=%.2f(%.2f%%) SumDistance=%.4f\n", $sa, 100*$sa/(180.0*($n-2)), $sf );
    }
 }
}

function SumAngleRing($mol, $m) {
 $a=0;
 $n=count($m);
 if($n<3) return 0;
 $a1=$mol[$m[$n-1]]; $a2=$mol[$m[0]]; $a3=$mol[$m[1]]; $a+=AtomAngle($a1, $a2, $a3);
 $a1=$mol[$m[$n-2]]; $a2=$mol[$m[$n-1]]; $a3=$mol[$m[0]]; $a+=AtomAngle($a1, $a2, $a3);
 for($i=1; $i<$n-1; $i++) {
    $a1=$mol[$m[$i-1]]; $a2=$mol[$m[$i]]; $a3=$mol[$m[$i+1]];
    $a+=AtomAngle($a1, $a2, $a3);
 }
 return $a;
}

function SumSurfaceRing($mol, $m) {
// $Surf=array();
 $SA=0; $SB=0; $SC=0; $SD=0;
 $n=count($m);
 if($n<3) return 0;
 $a1=$mol[$m[$n-1]]; $a2=$mol[$m[0]]; $a3=$mol[$m[1]];
 $r = AtomSurface($a1, $a2, $a3); 
 $SA+=$r['A']; $SB+=$r['B']; $SC+=$r['C']; $SD+=$r['D'];

 $a1=$mol[$m[$n-2]]; $a2=$mol[$m[$n-1]]; $a3=$mol[$m[0]];
 $r = AtomSurface($a1, $a2, $a3);
 $SA+=$r['A']; $SB+=$r['B']; $SC+=$r['C']; $SD+=$r['D'];

 for($i=1; $i<$n-1; $i++) {
    $a1=$mol[$m[$i-1]]; $a2=$mol[$m[$i]]; $a3=$mol[$m[$i+1]];
    $r = AtomSurface($a1, $a2, $a3);
    $SA+=$r['A']; $SB+=$r['B']; $SC+=$r['C']; $SD+=$r['D'];
 }
 $Surf = array( 'A'=>$SA/$n, 'B'=>$SB/$n, 'C'=>$SC/$n, 'D'=>$SD/$n );
// printf("Avg Surface A=%f B=%f C=%f D=%f\n", $Surf['A'], $Surf['B'], $Surf['C'], $Surf['D'] );
 
 $Sum=0;
 for($i=0; $i<$n; $i++) {
    $a=$mol[$m[$i]];
    $Sum += AtomSurfaceDist($Surf,$a);
 }
// printf(" Sum d=%f\n", $Sum);
 return $Sum;
}

function FindRingEnd($mol, $i, $m, &$r) {
 if(count($mol[$i]['bonds'])<2) return false;
 if(count($m)>2 && $m[0]==$i) { $r=$m; return true; }
 if(in_array($i, $m)==true) return false;
 $m[]=$i;
 foreach ($mol[$i]['bonds'] as $j => $x) { if(FindRingEnd($mol, $x, $m, $r)==true) return true; }
 return false;
}

function FindRing($mol) {
 $r=array();
# printf("Find RING\n");
 for($i=0; $i<count($mol); $i++) {
    if(count($mol[$i]['bonds'])<2) continue;
    if(FindRingEnd($mol, $i, array(), $r)==true) {
#	printf("OK ");
#	print_r($r);
	$n = count($r);
	printf("Ring %s%ld", $mol[$r[0]]['name'], $r[0]); for($j=1; $j<$n; $j++) printf("-%s%ld", $mol[$r[$j]]['name'], $r[$j]);
	$sa = SumAngleRing($mol, $r);
	$sf = SumSurfaceRing($mol, $r);
	printf(" SumAnges=%.2f(%.2f%%) SumDistance=%.4f\n", $sa, 100*$sa/(180.0*($n-2)), $sf );
	return;
    }
 }
}

?>
