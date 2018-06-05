<?php

// $eh=4.35974418e-18;
$eh=2625.499748; // кДж/моль
$BASIS="RB3LYP-aug-cc-pVDZ";
$mprop=array();

function get_component($str,$k) {
    $r = array();
    $lst = explode(" ",$str);
    foreach ($lst as $s) {
	$comp=ltrim(rtrim($s));
	if(strlen($comp)<1) continue;
	if(strcasecmp($comp, "+") == 0) continue;
//	$ml=preg_split('/^\d+$/',$comp);
////	$ml = sscanf($comp,"%f%s");
////	if($ml[0]==NULL) $ml=array(1.0,$comp);
////	$ml[0]*=$k;
//	echo '<'.implode(',',$ml).'> ';
	$ml=array($k,$comp);
	array_push($r, $ml);
    }
    return $r;
}


function get_reaction($str) {
    list($src, $dst) = explode("=", $str);
    $msrc = get_component($src,-1.0);
    $mdst = get_component($dst,1.0);
    return(array_merge($msrc,$mdst));
}

function read_prop($name) {
/*
Group N4-N3-C0 Distance C-N=1.4319 Distance N-N=1.1073 Angle=175.61
Ring C0-C1-C2-N9-N8-N7 SumAnges=720.00(100.00%) SumDistance=0.0005
LUMO=-0.35447
HOMO=-0.47157
*/
    global $mprop,$mmt,$eh,$BASIS;

    $prop = array( 'HOMO'=>0.0, 'LUMO'=>0.0, 'C-N'=>0.0, 'N-N'=>0.0, 'AngCNN'=>0.0, 'RSD'=>0.0 );
    $fname = sprintf("prop/$name.prop");
//    echo "fname=$fname\n";
    $f = fopen($fname,"r");
    if(!$f) return $prop;
    while (!feof ($f)) {
        $s = rtrim(ltrim(fgets($f))); if(strlen($s)<1) continue; 
//	echo "s=[$s]\n";
        if( ($p=strpos($s,'HOMO='))!==false ) $prop['HOMO'] = floatval( substr($s,$p+5,$p+14) );
        if( ($p=strpos($s,'LUMO='))!==false ) $prop['LUMO'] = floatval( substr($s,$p+5,$p+14) );
        if( ($p=strpos($s,'C-N='))!==false ) $prop['C-N'] = floatval( substr($s,$p+4,$p+10) );
        if( ($p=strpos($s,'N-N='))!==false ) $prop['N-N'] = floatval( substr($s,$p+4,$p+10) );
        if( ($p=strpos($s,'Angle='))!==false ) $prop['AngCNN'] = floatval( substr($s,$p+6,$p+12) );
        if( ($p=strpos($s,'SumDistance='))!==false ) $prop['RSD'] = floatval( substr($s,$p+12,$p+18) );
//	printf("*** [%s] %p \n", $s, strpos($s,'C-N=') );
      }
    fclose($f);
    $mprop[$name] = $prop;
//    var_dump($prop);
    return $prop;
}

function read_reactions($fname) {
    $m = array();
    $row = 1;
    if (($f = fopen($fname, "r")) !== FALSE) {
	fgets($f);
	while (($data = fgetcsv($f, 1000, ";")) !== FALSE) {
	    $num = count($data);
	    $row++;
	    $rs = $data[0];
	    $dE = $data[1];
	    $dG = $data[2];
	    $dH = $data[3];
	    $dST = $data[4];
//	    printf("\"%s\"; %.5f; %.5f; %.5f; %.5f;\n", $rs, $dE, $dG, $dH, $dST );
	    $m[$rs] = array( 'reaction'=>$rs, 'dE'=>$dE, 'dG'=>$dG, 'dH'=>$dH, 'dST'=>$dST );
	}
	fclose($f);
    }
    return($m);
}

function get_N2($m, $Name, $P) {
    $E1 = $m["$Name+-USinglet + N2-USinglet = $Name-N2+-USinglet"][$P];
    $E2 = $m["$Name+-UTriplet + N2-USinglet = $Name-N2+-USinglet"][$P];
    $dE = max( $E1, $E2 );
    return $dE;
}

function get_N2_S($m, $Name, $P) {
    $E1 = $m["$Name+-USinglet + N2-USinglet = $Name-N2+-USinglet"][$P];
    return $E1;
}

function get_N2_T($m, $Name, $P) {
    $E1 = $m["$Name+-UTriplet + N2-USinglet = $Name-N2+-USinglet"][$P];
    return $E1;
}

function get_N2_D($m, $Name, $P) {
    $E1 = $m["$Name-UDoublet + N2-USinglet = $Name-N2-UDoublet"][$P];
    return $E1;
}

function get_SE($m, $Name, $P) {
    $E1 = $m["$Name+-USinglet = $Name-UDoublet"][$P];
    $E2 = $m["$Name+-UTriplet = $Name-UDoublet"][$P];
    $dE = max( $E1, $E2 );
    return $dE;
}

function get_SE_S($m, $Name, $P) {
    $E1 = $m["$Name+-USinglet = $Name-UDoublet"][$P];
    return $E1;
}

function get_SE_T($m, $Name, $P) {
    $E2 = $m["$Name+-UTriplet = $Name-UDoublet"][$P];
    return $E2;
}

function get_SE_all($m, $Name, $P) {
    $E1 = $m["$Name+-USinglet = $Name-UDoublet"][$P];
    $E2 = $m["$Name+-UTriplet = $Name-UDoublet"][$P];
    $E3 = $m["$Name-N2+-USinglet = $Name-N2-UDoublet"][$P];
    $E4 = $m["$Name-N2+-UTriplet = $Name-N2-UDoublet"][$P];
    return array( 'US'=>$E1, 'UT'=>$E2, 'N2US'=>$E3, 'N2UT'=>$E4 );
}

function get_ST($m, $Name, $P) {
    $dE = $m["$Name+-USinglet = $Name+-UTriplet"][$P];
    return $dE;
}

function get_N2_ST($m, $Name, $P) {
    $dE = $m["$Name-N2+-USinglet = $Name-N2+-UTriplet"][$P];
    return $dE;
}

function make_reactions( $fname, $m ) {
    if (($f = fopen($fname, "r")) !== FALSE) {
//	fgets($f);
	printf("Name #1; dE(+N2) #2; dE(AE) #3; dE(ST) #4; dG(+N2) #5; dG(AE) #6; dG(ST) #7; LUMO(min) #8; LUMO(S) #9; HOMO(S) #10; LUMO(T) #11; HOMO(T) #12; LUMO(D) #13; HOMO(D) #14; State #15;");
	printf(" C-N(S) #16; N-N(S) #17; C-N(T) #18; N-N(T) #19; C-N(D) #20; N-N(D) #21; C-N(min) #22; N-N(min) #23;");
	printf(" AE(S) #24; AE(T) #25; AE(S) N2 #26; AE(T) N2 #27;");
	printf(" C-N-N(S) #28; C-N-N(T) #29; RSD(S) #30; RSD(T) #31;");
	printf(" LUMO_N2(S) #32; HOMO_N2(S) #33; LUMO_N2(T) #34; HOMO_N2(T) #35; LUMO_N2(D) #36; HOMO_N2(D) #37;  dE(+N2) (D) #38;\n");
	while ( ($Str = fgets($f)) !== FALSE) {
	    $Name = ltrim(rtrim($Str));
	    if(strlen($Name)<2) continue;

/*
	    $dE_N2 = get_N2($m, $Name, 'dE'); // if($dE_N2<-2000.0 || $dE_N2>2000.0) continue;
	    $dG_N2 = get_N2($m, $Name, 'dG');
	    $dE_SE = get_SE($m, $Name, 'dE'); // if($dE_SE<-2000.0 || $dE_SE>2000.0) continue;
	    $dG_SE = get_SE($m, $Name, 'dG');
	    $SE = get_SE_all($m, $Name, 'dE');
	    $dE_ST = get_ST($m, $Name, 'dE'); // if($dE_ST<-2000.0 || $dE_ST>2000.0) continue;
	    $dG_ST = get_ST($m, $Name, 'dG');
	    $pS = read_prop("$Name+-USinglet");
	    $pT = read_prop("$Name+-UTriplet");
	    $pD = read_prop("$Name-UDoublet");
	    $RSD_S = $pS['RSD'];
	    $RSD_T = $pT['RSD'];
	    $LUMO_S = $pS['LUMO'];
	    $LUMO_T = $pT['LUMO'];
	    $LUMO_D = $pD['LUMO'];
	    $HOMO_S = $pS['HOMO'];
	    $HOMO_T = $pT['HOMO'];
	    $HOMO_D = $pD['HOMO'];
	    $LUMO_min = min($LUMO_S,$LUMO_T);
	    if($LUMO_S > $LUMO_T) $State = 1; else $State=0;

	    $pS = read_prop("$Name-N2+-USinglet");
	    $pT = read_prop("$Name-N2+-UTriplet");
	    $pD = read_prop("$Name-N2-UDoublet");
	    $AngCNN_S = $pS['AngCNN'];
	    $AngCNN_T = $pT['AngCNN'];
	    $CN_S = $pS['C-N'];
	    $CN_T = $pT['C-N'];
	    $CN_D = $pD['C-N'];
	    $NN_S = $pS['N-N'];
	    $NN_T = $pT['N-N'];
	    $NN_D = $pD['N-N'];
	    if($State==1) { $CN_min=$CN_T; $NN_min=$NN_T; } else { $CN_min=$CN_S; $NN_min=$NN_S; }
*/

	    $dE_N2_S = get_N2_S($m, $Name, 'dE'); // if($dE_N2_S<-2000.0 || $dE_N2_S>2000.0) continue;
	    $dG_N2_S = get_N2_S($m, $Name, 'dG');
	    $dE_N2_T = get_N2_T($m, $Name, 'dE'); // if($dE_N2_T<-2000.0 || $dE_N2_T>2000.0) continue;
	    $dG_N2_T = get_N2_T($m, $Name, 'dG');
	    $dE_N2_D = get_N2_D($m, $Name, 'dE'); // if($dE_N2_T<-2000.0 || $dE_N2_T>2000.0) continue;
	    $dG_N2_D = get_N2_D($m, $Name, 'dG');

	    $dE_N2 = get_N2($m, $Name, 'dE'); // if($dE_N2<-2000.0 || $dE_N2>2000.0) continue;
	    $dG_N2 = get_N2($m, $Name, 'dG');
	    $dE_SE = get_SE($m, $Name, 'dE'); // if($dE_SE<-2000.0 || $dE_SE>2000.0) continue;
	    $dG_SE = get_SE($m, $Name, 'dG');

	    $SE = get_SE_all($m, $Name, 'dE');
	    $dE_SE_S = $SE['US'];
	    $dE_SE_T = $SE['UT'];
	    $dE_SE_N2_S = $SE['N2US'];
	    $dE_SE_N2_T = $SE['N2UT'];

	    $SE = get_SE_all($m, $Name, 'dG');
	    $dG_SE_S = $SE['US'];
	    $dG_SE_T = $SE['UT'];
	    $dG_SE_N2_S = $SE['N2US'];
	    $dG_SE_N2_T = $SE['N2UT'];

	    $dE_ST = get_ST($m, $Name, 'dE'); // if($dE_ST<-2000.0 || $dE_ST>2000.0) continue;
	    $dG_ST = get_ST($m, $Name, 'dG');
	    $pS = read_prop("$Name+-USinglet");
	    $pT = read_prop("$Name+-UTriplet");
	    $pD = read_prop("$Name-UDoublet");
	    $RSD_S = $pS['RSD'];
	    $RSD_T = $pT['RSD'];
	    $RSD_D = $pT['RSD'];
	    $LUMO_S = $pS['LUMO'];
	    $LUMO_T = $pT['LUMO'];
	    $LUMO_D = $pD['LUMO'];
	    $HOMO_S = $pS['HOMO'];
	    $HOMO_T = $pT['HOMO'];
	    $HOMO_D = $pD['HOMO'];
	    $LUMO_min = min($LUMO_S,$LUMO_T);
	    if($LUMO_S > $LUMO_T) $State = 1; else $State=0;

	    $dE_N2_ST = get_N2_ST($m, $Name, 'dE'); // if($dE_ST<-2000.0 || $dE_ST>2000.0) continue;
	    $dG_N2_ST = get_N2_ST($m, $Name, 'dG');
	    $pS_N2 = read_prop("$Name-N2+-USinglet");
	    $pT_N2 = read_prop("$Name-N2+-UTriplet");
	    $pD_N2 = read_prop("$Name-N2-UDoublet");
	    $RSD_S_N2 = $pS_N2['RSD'];
	    $RSD_T_N2 = $pT_N2['RSD'];
	    $RSD_D_N2 = $pD_N2['RSD'];
	    $AngCNN_S_N2 = $pS_N2['AngCNN'];
	    $AngCNN_T_N2 = $pT_N2['AngCNN'];
	    $AngCNN_D_N2 = $pD_N2['AngCNN'];
	    $LUMO_N2_S = $pS_N2['LUMO'];
	    $LUMO_N2_T = $pT_N2['LUMO'];
	    $LUMO_N2_D = $pD_N2['LUMO'];

	    $HOMO_N2_S = $pS_N2['HOMO'];
	    $HOMO_N2_T = $pT_N2['HOMO'];
	    $HOMO_N2_D = $pD_N2['HOMO'];

	    $CN_S_N2 = $pS_N2['C-N'];
	    $CN_T_N2 = $pT_N2['C-N'];
	    $CN_D_N2 = $pD_N2['C-N'];
	    $NN_S_N2 = $pS_N2['N-N'];
	    $NN_T_N2 = $pT_N2['N-N'];
	    $NN_D_N2 = $pD_N2['N-N'];
	    if($State==1) { $CN_min=$CN_T_N2; $NN_min=$NN_T_N2; } else { $CN_min=$CN_S_N2; $NN_min=$NN_S_N2; }

	    printf("\"%s\"; %.5f; %.5f; %.5f; %.5f; %.5f; %.5f;", $Name, $dE_N2, $dE_SE, $dE_ST, $dG_N2, $dG_SE, $dG_ST );
	    printf(" %.5f; %.5f; %.5f; %.5f; %.5f; %.5f; %.5f; %d;", $LUMO_min, $LUMO_S, $HOMO_S, $LUMO_T, $HOMO_T, $LUMO_D, $HOMO_D, $State );
	    printf(" %.5f; %.5f; %.5f; %.5f; %.5f; %.5f; %.5f; %.5f;", $CN_S_N2, $NN_S_N2, $CN_T_N2, $NN_T_N2, $CN_D_N2, $NN_D_N2, $CN_min, $NN_min );
	    printf(" %.5f; %.5f; %.5f; %.5f;", $SE['US'], $SE['UT'], $SE['N2US'], $SE['N2UT'] );
	    printf(" %.2f; %.2f; %.4f; %.4f;", $AngCNN_S_N2, $AngCNN_T_N2, $RSD_S, $RSD_T );
	    printf(" %.5f; %.5f; %.5f; %.5f; %.5f; %.5f; %.5f;\n", $LUMO_N2_S, $HOMO_N2_S, $LUMO_N2_T, $HOMO_N2_T, $LUMO_N2_D, $HOMO_N2_D, $dE_N2_D );
	}
	fclose($f);
    }
}

$mtd = read_reactions('src/TD-All.dat');
make_reactions('php://stdin', $mtd);

?>
