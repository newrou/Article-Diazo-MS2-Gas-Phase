<?php

# Alpha  occ. eigenvalues --   -0.70651  -0.61360  -0.57832  -0.55626  -0.53592
# Alpha virt. eigenvalues --   -0.36502  -0.32753  -0.24872  -0.20487  -0.16528
# Population analysis using the SCF density.

$MO=array();
$OC=array();

$prev="";
if (($handle = fopen('php://stdin', "r")) !== FALSE) {
    while (($str = fgets($handle)) !== FALSE) {
	if( strpos($str,'Population analysis using the SCF density')>0) {
	    $MO=array();
	    $OC=array();
#	    printf("\n\n\n",$str);
	    continue;
	}

	if( strpos($str,'occ. eigenvalues')>0 ) {
#	    printf("HOMO[%s]\n",$str);
	    $data = preg_split("/[\s]+/", $str);
	    for($i=5; $i<count($data)-1; $i++) { $MO[]=$data[$i]; $OC[]=1; }
	}
	if( strpos($str,'virt. eigenvalues')>0 ) {
#	    printf("HOMO[%s]\n",$str);
	    $data = preg_split("/[\s]+/", $str);
	    for($i=5; $i<count($data)-1; $i++) { $MO[]=$data[$i]; $OC[]=0; }
	}

	$prev=$str;
    }
    fclose($handle);

array_multisort($MO, $OC);

# print_r($LUMO);
# print_r($HOMO);

for( $i=0; $i<count($MO); $i++ ) printf("%f; %1d\n", $MO[$i], $OC[$i] );
}

?>
