<?php

$mE = array();
$row = 0;
$Name = $argv[1];
$base = $argv[2];
$dst = $argv[3];
if (($handle = fopen($Name.'.relaxscanscf.dat', "r")) !== FALSE) {
    while (($data = fgetcsv($handle, 1000, " ")) !== FALSE) {
        $num = count($data);if($num<4) continue;
//        printf("%ld полей в строке $row: \n",$num);
//	#FEATURE,rt,mz,intensity,charge,width,quality,rt_quality,mz_quality,rt_start,rt_end
	$d=$data[3];
	$Eh=$data[4];
	$E=$Eh*2625.5;
	$mE[$row] = array('d'=>$d, 'Eh'=>$Eh, 'E'=>$E, 'Ek'=>$E);
//	printf("%ld \t%.4f  \t%.4f \t%.4f \n", $row, $d, $Eh, $E);
//	printf("n=%ld\n",$num);
//	printf("%05ld \t%.4f  \t%.0f  \t(%.0f-%.0f)\n", $row, $MZ, $QUAL, $RTS, $RTE);
        $row++;
    }
    fclose($handle);

$Emax=-1e12;$Emin=1e12;
for($i=0; $i<count($mE); $i++) {
  if( $mE[$i]['E'] < $Emin ) $Emin=$mE[$i]['E'];
  if( $mE[$i]['E'] > $Emax ) $Emax=$mE[$i]['E'];
 }

//for($i=0; $i<count($mE); $i++) $mE[$i]['Ek']=$mE[$i]['E']-$Emin-($Emax-$Emin)*0.1;
for($i=0; $i<count($mE); $i++) $mE[$i]['Ek']=$mE[$i]['E']-$Emin;

$NN=count($mE);
$Extremum=array();
for($i=3; $i<$NN-3; $i++) {
//  if($mE[$i]['E']>$mE[$i-1]['E'] && $mE[$i]['E']>$mE[$i+1]['E'] && $mE[$i]['E']>$mE[$i-2]['E'] && $mE[$i]['E']>$mE[$i+2]['E'] && $mE[$i]['E']>$mE[$i-3]['E'] && $mE[$i]['E']>$mE[$i+3]['E']) 
  if($mE[$i]['E']>$mE[$i-1]['E'] && $mE[$i]['E']>$mE[$i+1]['E'] && $mE[$i]['E']>$mE[$i-2]['E'] && $mE[$i]['E']>$mE[$i+2]['E']) { 
   $Extremum[]=array('index'=>$i, 'type'=>'<font color=red>max</font>');
   printf("max[%s.%03d]=%.4f\n",$Name,$i+1,$mE[$i]['Ek']);
   $cm=sprintf("cp %s.%03d.xyz %s/%s/extremum/max-%s.%03d.xyz",$Name,$i+1,$dst,$Name,$Name,$i+1);
   system($cm);
  }
//  if($mE[$i]['E']<$mE[$i-1]['E'] && $mE[$i]['E']<$mE[$i+1]['E'] && $mE[$i]['E']<$mE[$i-2]['E'] && $mE[$i]['E']<$mE[$i+2]['E'] && $mE[$i]['E']<$mE[$i-3]['E'] && $mE[$i]['E']<$mE[$i+3]['E']) 
  if($mE[$i]['E']<$mE[$i-1]['E'] && $mE[$i]['E']<$mE[$i+1]['E'] && $mE[$i]['E']<$mE[$i-2]['E'] && $mE[$i]['E']<$mE[$i+2]['E']) { 
   $Extremum[]=array('index'=>$i, 'type'=>'<font color=blue>min</font>');
   printf("min[%s.%03d]=%.4f\n",$Name,$i+1,$mE[$i]['Ek']);
   $cm=sprintf("cp %s.%03d.xyz %s/%s/extremum/min-%s.%03d.xyz",$Name,$i+1,$dst,$Name,$Name,$i+1);
   system($cm);
  }
 }
printf("last[%s.%03d]=%.4f\n",$Name,$NN,$mE[$NN-1]['Ek']);
$cm=sprintf("cp %s.%03d.xyz %s/%s/extremum/last-%s.xyz",$Name,$NN,$dst,$Name,$Name);system($cm);

if (($out = fopen($Name.'.csv', "w")) !== FALSE) {
  for($i=0; $i<count($mE); $i++) fprintf($out,"%ld %.4f  %.4f %.4f %.4f\n", $i, $mE[$i]['d'], $mE[$i]['Eh'], $mE[$i]['E'], $mE[$i]['Ek']);
 }
fclose($out);

if (($hout = fopen($Name.'.html', "w")) !== FALSE) {

 fprintf($hout,"<html>\n<head>\n <title>%s</title>\n",$Name);
 $filetxt = file_get_contents("$base/scan-plot.css",FILE_USE_INCLUDE_PATH);
 fprintf($hout,"%s\n",$filetxt);

 $filetxt = file_get_contents("$base/scan-plot.js",FILE_USE_INCLUDE_PATH);
 $js = str_replace("fName", $Name, $filetxt);
 $js2 = str_replace("Nmax", count($mE), $js);
 fprintf($hout,"%s\n",$js2);

 fprintf($hout,"</head>\n<body>\n<article>\n <h4>%s</h4>\n",$Name);

 fprintf($hout,"  <table name=etab id=etab>\n");
 fprintf($hout,"   <tr> <td>n</td> <td>d, A</td> <td>Eh</td> <td>E, kJ/mol</td> </tr>\n");
 for($j=0; $j<count($Extremum); $j++) {
  $i=$Extremum[$j]['index']; $type=$Extremum[$j]['type'];
  fprintf($hout,"   <tr id=step%03ld onMouseOver=\"document.show1.src='img/%s.%03d.png';\"> <td>%ld %s</td> <td><a href=\"mol/%s.%03d.mol\">%.4f</a></td> <td>%.4f</td> <td>%.3f</td> </tr>\n", $i+1, $Name, $i+1, $i+1, $type, $Name, $i+1, $mE[$i]['d'], $mE[$i]['Eh'], $mE[$i]['Ek']);
 }
 fprintf($hout,"  </table>\n<br>\n");

 fprintf($hout,"  <table name=etab id=etab>\n");
 fprintf($hout,"   <tr> <td>n</td> <td>d, A</td> <td>Eh</td> <td>E, kJ/mol</td> </tr>\n");
 for($i=0; $i<count($mE); $i++) fprintf($hout,"   <tr id=step%03ld onMouseOver=\"document.show1.src='img/%s.%03d.png';\"> <td>%ld</td> <td><a href=\"mol/%s.%03d.mol\">%.4f</a></td> <td>%.4f</td> <td>%.3f</td> </tr>\n", $i+1, $Name, $i+1, $i+1, $Name, $i+1, $mE[$i]['d'], $mE[$i]['Eh'], $mE[$i]['Ek']);
// for($i=0; $i<count($mE); $i++) fprintf($hout,"   <tr onMouseOver=\"document.show1.src='img/%s.%03d.png';\"> <td>%ld</td> <td>%.4f</td> <td>%.4f</td> <td>%.4f</td> <td>%.4f</td> </tr>\n",$Name,$i+1,$i, $mE[$i]['d'], $mE[$i]['Eh'], $mE[$i]['E'], $mE[$i]['Ek']);
 fprintf($hout,"  </table>\n");

 fprintf($hout,"  </table></article>\n");

 fprintf($hout," <aside id=aside1>\n");
// fprintf($hout,"  <img width=600 name=Eh id=Eh src=\"img/%s-eh.png\"><br/>\n",$Name);
 fprintf($hout,"  <img width=600 name=Eh id=Eh src=\"img/%s.png\"><br/>\n",$Name);
 fprintf($hout,"  <img width=300 name=show1 id=show1 src=\"img/%s.001.png\">\n",$Name);
 fprintf($hout,"  <span id=\"x\"></span>\n");
 fprintf($hout," </aside>\n");

 fprintf($hout,"<script type=\"text/javascript\"> var myImg = document.getElementById(\"Eh\"); myImg.onmousemove = GetCoordinates; </script>");
 fprintf($hout,"</body></html>");
}
fclose($hout);

}

?>

