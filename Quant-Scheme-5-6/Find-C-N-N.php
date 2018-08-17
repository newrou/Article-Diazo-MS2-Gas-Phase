<?php

include 'Mol-Lib.php';

$mol = ReadMol('php://stdin');
RebondMol($mol);
#PrintMol($mol);
FindCNN($mol);
FindC($mol);
#FindRing($mol);

?>
