<?php

// $eh=4.35974418e-18;
$eh=2625.499748; // кДж/моль
$BASIS="RB3LYP-aug-cc-pVDZ";

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

function get_component_orig($str,$k) {
	$r = array();
    $lst = explode("+",$str);
    foreach ($lst as $s) {
	$comp=ltrim(rtrim($s));
//	$ml=preg_split('/^\d+$/',$comp);
	$ml = sscanf($comp,"%f%s");
	if($ml[0]==NULL) $ml=array(1.0,$comp);
	$ml[0]*=$k;
//	echo '<'.implode(',',$ml).'> ';
	array_push($r, $ml);
    }
    return $r;
}

function get_reaction($str) {
    list($src, $dst) = explode("=", $str);
//    echo "  ";
    $msrc = get_component($src,-1.0);
//    echo " = ";
    $mdst = get_component($dst,1.0);
//    echo "\n";
    return(array_merge($msrc,$mdst));
}

$mt=array();

function read_td($name) {
    global $mt,$mmt,$eh,$BASIS;
    $td=array();
//    $f = fopen("td/$name-RB3LYP-aug-cc-pVDZ.td","r");
//    printf("read td [%s]\n",$name);
    foreach ($mmt as $T) {
//      printf("T=%s\n",$T);
//      $fname=sprintf("td/$name-%s-T%.0f.td",$BASIS,$T);
      $fname=sprintf("td/$name.td");
//      printf("fname=%s\n",$fname);
      $f = fopen($fname,"r");
      if(!$f) return array();
      $nT=0;$mtd[$name]=array();
      while (!feof ($f)) {
        $s = fgets($f); if(strlen($s)<1) continue; $hE0 = floatval(substr($s,4,18)); $E0 = $eh*$hE0;
        $s = fgets($f); if(strlen($s)<1) continue; $Tr = floatval(substr($s,3,18));
        $s = fgets($f); if(strlen($s)<1) continue; $hH = floatval(substr($s,3,18)); $H = $eh*$hH;
        $s = fgets($f); if(strlen($s)<1) continue; $S = floatval(substr($s,3,18)); $ST = $Tr*$S/1000.0;
        $s = fgets($f); if(strlen($s)<1) continue; $hG = floatval(substr($s,3,18)); $G = $eh*$hG;
#      $s = fgets($f); if(strlen($s)<1) continue; $hGE = floatval(substr($s,3,18)); $GE = $eh*$hGE;
//////      echo "$name \t$Tr \t$H \t$ST \t$G \t$E0\n";
        $td[$T]=array('H'=>$H,'ST'=>$ST,'G'=>$G,'GE'=>$E0);
        $mt[$T]=$T;
        $nT++;
      }
      fclose($f);
    }
//var_dump($td);
//var_dump($mt);
    return $td;
}

function reaction_td2($reac) {
    global $mt;
    $H=array(); $ST=array(); $G=array(); $GE=array();
    $mtd=array();
    foreach ($reac as $v) {$mtd[$v[1]]=read_td($v[1]);}
//    print_r($mt);
    foreach ($mt as $T) {
	$H[$T]=0; $ST[$T]=0; $G[$T]=0; $GE[$T]=0;
	foreach ($reac as $v) {
	    $k=$v[0];
	    $name=$v[1];
	    $td=$mtd[$name][$T];
//	    print_r($td);
	    $H[$T] += $k*$td['H'];
	    $ST[$T] += $k*$td['ST'];
	    $G[$T] += $k*$td['G'];
	    $GE[$T] += $k*$td['GE'];
	}
	printf("%.2f \t %.2f \t %.2f \t %.2f \t %.2f\n",$T,$H[$T],$ST[$T],$G[$T],$GE[$T]);
    }
}

function html_mol_name_old($s) {
    $r = str_replace("BF4-", "BF<sub>4</sub><sup>-</sup>", $s);
    $r = str_replace("BF3", "BF<sub>3</sub>", $r);
    $r = str_replace("BF4", "BF<sub>4</sub>", $r);
    $r = str_replace("C6", "C<sub>6</sub>", $r);
    $r = str_replace("H5", "H<sub>5</sub>", $r);
    $r = str_replace("H4", "H<sub>4</sub>", $r);
    $r = str_replace("N2", "N<sub>2</sub>", $r);
    $r = str_replace("+", "<sup>+</sup>", $r);
    $r = str_replace("O2", "O<sub>2</sub>", $r);
    $r = str_replace("Cl-", "Cl<sup>-</sup>", $r);
    return $r;
}

function html_mol_name($s) {
    $r = str_replace("BF4-", "BF<sub>4</sub><sup>-</sup>", $s);
    $r = str_replace("BF3", "BF<sub>3</sub>", $r);
    $r = str_replace("BF4", "BF<sub>4</sub>", $r);

    $r = str_replace("+(", "<sup>+</sup>(", $r);

    $r = str_replace(")2", ")<sub>2</sub>", $r);
    $r = str_replace(")3", ")<sub>3</sub>", $r);
    $r = str_replace(")4", ")<sub>4</sub>", $r);
    $r = str_replace(")5", ")<sub>5</sub>", $r);

    $r = str_replace("C13", "C<sub>13</sub>", $r);
    $r = str_replace("H18", "H<sub>18</sub>", $r);
    $r = str_replace("C2", "C<sub>2</sub>", $r);
    $r = str_replace("C3", "C<sub>3</sub>", $r);
    $r = str_replace("C4", "C<sub>4</sub>", $r);
    $r = str_replace("C5", "C<sub>5</sub>", $r);
    $r = str_replace("C6", "C<sub>6</sub>", $r);
    $r = str_replace("C7", "C<sub>7</sub>", $r);
    $r = str_replace("H2", "H<sub>2</sub>", $r);
    $r = str_replace("H3", "H<sub>3</sub>", $r);
    $r = str_replace("H4", "H<sub>4</sub>", $r);
    $r = str_replace("H5", "H<sub>5</sub>", $r);
    $r = str_replace("N2", "N<sub>2</sub>", $r);
    $r = str_replace("N4", "N<sub>4</sub>", $r);
    $r = str_replace("N6", "N<sub>6</sub>", $r);
    $r = str_replace("N8", "N<sub>8</sub>", $r);
//    $r = str_replace("+", "<sup>+</sup>", $r);
    $r = str_replace("O2", "O<sub>2</sub>", $r);
    $r = str_replace("Cl-", "Cl<sup>-</sup>", $r);
    $r = str_replace("(D)","&bull;(D)", $r);
    return $r;
}

function reaction_td($s, $reac, $htm ,$htmft, $n) {
    global $mt,$BASIS;
    $H=array(); $ST=array(); $G=array(); $GE=array();
    $mtd=array();
    foreach ($reac as $v) {$mtd[$v[1]]=read_td($v[1]);}
//    echo "\"Reaction \ Thermodinamic at\", ";foreach ($mt as $T) {echo "G $T, H $T, -S*$T";}
//    echo "\"$s\", ";
    printf("\"%s\"; ",$s);
//    fprintf($htm," <tr><td>%s</td>",$s);

    if (!($fp = fopen("$s.fT", 'w'))) {return;}
    fprintf($fp, "T, dG, dH, S*T\n", $s);
    fprintf($htmft, "<h3 id=\"r%ld\">Reaction: ",$n);
    $flag=true;$count=0;$rs="";
    foreach ($reac as $v) {
	    $k=$v[0];
	    $name=$v[1];
//	    $ref=sprintf("href=\"mol/%s-6-311Gdp.mol\"",$name);
//	    $ref=sprintf("href=\"mol/%s-%s.mol\"",$name,$BASIS);
	    $ref=sprintf("href=\"mol/%s.mol\"",$name);
	    $count++;
	    if(abs($k)>1) $vs=sprintf("%f <a %s>%s</a>",abs($k),$ref,html_mol_name($name)); 
		else $vs=sprintf("<a %s>%s</a>",$ref,html_mol_name($name));
	    if($k>0 && $flag==true) {$rs=sprintf("%s = %s",$rs,$vs);$flag=false;continue;}
	    if($count==1) $rs=sprintf("%s%s",$rs,$vs); else $rs=sprintf("%s + %s",$rs,$vs);
    }
    fprintf($htm," <tr><td><a href=\"#r%ld\">%ld</a></td><td>%s</td>",$n,$n,$rs);
    fprintf($htmft,"%s",$rs);

    fprintf($htmft,"</h3>\n<table border=1> \n<tr><td>Name</td> <td>k</td> <td>T</td> <td>E0</td> <td>G</td> <td>H</td> <td>S*T</td> <td>Properties</td> </tr>\n");
    foreach ($mt as $T) {
	$H[$T]=0; $ST[$T]=0; $G[$T]=0; $GE[$T]=0;
	foreach ($reac as $v) {
	    $k=$v[0];
	    $name=$v[1];
	    $td=$mtd[$name][$T];
	    $H[$T] += $k*$td['H'];
	    $ST[$T] += $k*$td['ST'];
	    $G[$T] += $k*$td['G'];
	    $GE[$T] += $k*$td['GE'];
	    $fs=str_replace("\n","<br>\n",file_get_contents("prop/$name.prop"));
	    fprintf($htmft," <tr><td>%s</td> <td>%.1f</td> <td>%.2f</td> <td>%.2f</td> <td>%.2f</td> <td>%.2f</td> <td>%.2f</td> <td>%s</td> </tr>\n",$name,$k,$T,$td['GE'],$td['G'],$td['H'],$td['ST'],$fs);
	}
    fprintf($htmft,"</table><br>\n");

    fprintf($htmft,"</h3>\n<table border=1> \n<tr><td>T</td> <td>dE</td> <td>dG</td> <td>dH</td> <td>dS*T</td></tr>\n");
//	printf("%f, %f, %f ",$G[$T],$H[$T],$ST[$T]);
	printf("%.2f; ",$GE[$T]);
	printf("%.2f; ",$G[$T]);
	printf("%.2f; ",$H[$T]);
	printf("%.2f; ",$ST[$T]);
	fprintf($fp,"%.2f, %.2f, %.2f, %.2f\n",$T,$G[$T],$H[$T],$ST[$T]);
	fprintf($htmft," <tr><td>%.2f</td> <td>%.2f</td> <td>%.2f</td> <td>%.2f</td> <td>%.2f</td></tr>\n",$T,$GE[$T],$G[$T],$H[$T],$ST[$T]);
	fprintf($htm,"<td>%.2f</td> <td>%.2f</td> <td>%.2f</td> <td>%.2f</td> ",$GE[$T],$G[$T],$H[$T],$ST[$T]);
    }
    fprintf($htmft,"</table><br>\n");
    fclose($fp);
    $last_line = system("./make-fT.sh \"$s.fT\"", $retval);
//    fprintf($htmft,"<img src=\"img/%s-fT.gif\" width=\"37%%\"><br><br>\n\n",$s);
    echo "\n";
    fprintf($htm,"</tr>\n");
}

function read_reactions($fname,$xmt) {
//    echo "\"Reaction \ Thermodinamic at\", ";foreach ($xmt as $T) {echo "G $T, H $T, S*T $T, ";} echo "\n";
    echo "\"Reaction \"; dE; ";foreach ($xmt as $T) {echo "dG $T; dH $T; dS*$T; ";} echo "\n";
    $fr = fopen("$fname.r","r");
    $htm = fopen("$fname/$fname.html","w");
    $htmft = fopen("$fname/$fname-ft.html","w");

    fprintf($htm,"<h1>%s</h1>\n",$fname);
    fprintf($htm,"<h2><a href=\"mol\">Optimized geometry files</a></h2>\n");
    fprintf($htm,"<h2><a href=\"out\">Out files</a></h2>\n");
//    fprintf($htm,"<table border=1>\n <tr> <td>\"name \ thermodinamic at\"</td> ");
    fprintf($htm,"<table border=1>\n <tr> <td>&#8470;</td> <td>Reaction</td> <td>dE0</td> ");
    foreach ($xmt as $T) {fprintf($htm,"<td>dG %.2f</td> <td>dH %.2f</td> <td>dS*T %.2f</td> ",$T,$T,$T);}
    fprintf($htm," </tr>\n");
    $count=0;
    while (!feof ($fr)) {
	$s = rtrim(ltrim(fgets($fr))); if(strlen($s)<3) continue; 
//	echo "\"$s\", ";
	$count++;
	$reac = get_reaction($s);
	reaction_td($s,$reac,$htm,$htmft,$count);
//	print_r($reac);
    }
    fclose($fr);
    fclose($htmft);
    fprintf($htm,"</table>\n");
//    foreach ($xmt as $T) {fprintf($htm," <h3>Thermodinamics at %.2f</h3> <img src=\"img/%s-%.0f.gif\" width=\"67%%\"><br>\n",$T,$fname,$T);}
    fclose($htm);
}

$options = getopt("r:T:b:");
//var_dump($options);
//printf("\"Reaction \ dG at \", %s\n",$options["T"]);
$mmt = explode(",", $options["T"]);
//$BASIS = $options["b"];
read_reactions($options["r"],$mmt);

/*
//for ($i=0; $i<count($ns); $i++) {
//    $name=$ns[$i];
    $mt=array();$td=array();
    $name='Vanilin';
    $f = fopen("$name-6-31G.td","r");
    $nT=0;$mtd[$name]=array();
    while (!feof ($f)) {
      $s = fgets($f); if(strlen($s)<1) continue; $T = floatval(substr($s,18,8));
      $s = fgets($f); if(strlen($s)<1) continue; $hH = floatval(substr($s,37,16)); $H = $eh*$hH;
      $s = fgets($f); if(strlen($s)<1) continue; $hST = floatval(substr($s,37,16)); $ST = $eh*$hST;
      $s = fgets($f); if(strlen($s)<1) continue; $hG = floatval(substr($s,37,16)); $G = $eh*$hG;
      $s = fgets($f); if(strlen($s)<1) continue; $hGE = floatval(substr($s,37,16)); $GE = $eh*$hGE;
//      echo "$name \t$T \t$hH \t$hST \t$hG \t$hGE\n";
      $td[$name][$T]=array('H'=>$H,'ST'=>$ST,'G'=>$G,'GE'=>$GE);
      $mt[$T]=$T;
      $nT++;
    }
    fclose($f);

//    for ($i=0; $i<count($mt); $i++) {
    foreach ($mt as $T) {
	$m=$td[$name][$T];
	$H=$m['H'];
	$ST=$m['ST'];
	$G=$m['G'];
	$GE=$m['GE'];
	echo "$name \t$T \t$hH \t$hST \t$hG \t$hGE\n";
    }
//    echo implode(',',$mt);
    echo "\n";
//}
*/

?>
