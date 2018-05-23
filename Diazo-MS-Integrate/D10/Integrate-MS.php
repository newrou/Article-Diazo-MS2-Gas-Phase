<?php

$SrcMS = array();
$IntMS = array();
$row = 0;
if (($handle = fopen($argv[1], "r")) !== FALSE) {
    while (($data = fgetcsv($handle, 1000, "\t")) !== FALSE) {
        if(count($data)<3) continue;
//	#SEC	MZ	INT
	$RT=0.0+$data[0];
	$MZ=0.0+$data[1];
	if($MZ<10.0) continue;
	if(abs($MZ-922.0099)<0.5) continue;
	if(abs($MZ-923.0099)<0.5) continue;
	if(abs($MZ-111.0917)<0.5) continue;
	$INT=0.0+$data[2];
	$SrcMS[$row] = array('RT'=>$RT, 'MZ'=>$MZ, 'INT'=>$INT);
//	printf("%2ld \t%6.1f  \t%9.4f \t%7.0f\n", $row, $RT, $MZ, $INT);
        $row++;
    }
    fclose($handle);

for($i=0; $i<count($SrcMS); $i++) {
    $MZ=$SrcMS[$i]['MZ'];
    $INT=$SrcMS[$i]['INT'];
    $CountInt=count($IntMS);
    for($j=0; $j<$CountInt; $j++) {
	if(abs($IntMS[$j]['MZ']-$MZ)/$MZ < 0.001) { $IntMS[$j]['INT']+=$INT; break; }
    }
    if($j==$CountInt) { $IntMS[$j]=array('MZ'=>$MZ,'INT'=>$INT,'I100'=>0,'TXT'=>''); }
}

$MaxINT=0.0;
$data_m=array();
for($j=0; $j<count($IntMS); $j++) { 
    $data_m[$j]=$IntMS[$j]['MZ']; 
    if( $MaxINT < $IntMS[$j]['INT'] ) $MaxINT=$IntMS[$j]['INT'];
}
for($j=0; $j<count($IntMS); $j++) {
    $IntMS[$j]['I100']=0.0+$IntMS[$j]['INT']*100/$MaxINT;
    if( $IntMS[$j]['I100']>10 ) $IntMS[$j]['TXT']=sprintf("%.2f",$IntMS[$j]['MZ']);
}

//array_multisort($data_m, SORT_NUMERIC, SORT_DESC, $MSLine);
array_multisort($data_m, SORT_NUMERIC, SORT_ASC, $IntMS);
//var_dump($data_m);
//var_dump($IntMS);

for($j=0; $j<count($IntMS); $j++) 
 if($IntMS[$j]['I100']>=0.1) printf("%2ld; \t%9.4f; \t%7.0f; \t%5.1f; \t\"%s\";\n", $j, $IntMS[$j]['MZ'], $IntMS[$j]['INT'], $IntMS[$j]['I100'], $IntMS[$j]['TXT']);

}

?>
