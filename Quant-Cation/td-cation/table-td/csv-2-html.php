<?php

// $eh=4.35974418e-18;
$eh=2625.499748; // кДж/моль

function html_mol_name($s) {
    $r = str_replace("BF4-", "BF<sub>4</sub><sup>-</sup>", $s);
    $r = str_replace("BF3", "BF<sub>3</sub>", $r);
    $r = str_replace("BF4", "BF<sub>4</sub>", $r);

    $r = str_replace("+(", "<sup>+</sup>(", $r);

    $r = str_replace(")2", ")<sub>2</sub>", $r);
    $r = str_replace(")3", ")<sub>3</sub>", $r);
    $r = str_replace(")4", ")<sub>4</sub>", $r);
    $r = str_replace(")5", ")<sub>5</sub>", $r);

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

function read_table($fname) {
    $row = 0;
    if (($f = fopen($fname, "r")) !== FALSE) {
	printf("<table border=1>\n");
	while (($data = fgetcsv($f, 10000, ";")) !== FALSE) {
	    $num = count($data); if($num<1) continue;
	    if(($row % 2) !== 0) printf(" <tr bgcolor=\"#eeeeee\">"); else printf(" <tr>");
	    if($row<1) printf(" <td>N</td>"); else printf(" <td>%ld</td>",$row);
	    printf(" <td valign=\"center\" align=\"center\">%s</td>", html_mol_name($data[0]));
	    for($i=1; $i<$num-1; $i++) printf(" <td valign=\"center\" align=\"right\">%s</td>", html_mol_name($data[$i]));
	    printf(" </tr>\n");
	    $row++;
	}
	fclose($f);
	printf("<table>\n");
    }
}

for($i=0; $i<count($argv); $i++) {
    if($argv[$i]=='-t') { $title=$argv[$i+1]; $i++; continue; }
}

printf("<h3>%s</h3>\n",html_mol_name($title));
read_table('php://stdin');

?>
