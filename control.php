<?php
/*======================================================================*\
||                 Cybershade CMS - Your CMS, Your Way                  ||
\*======================================================================*/
define('INDEX_CHECK', true);
define('cmsDEBUG', true);
include_once('core/core.php');

$objRoute = coreObj::getRoute();

$objRoute->processURL( $_GET['l'] );

$a = coreObj::getPlugins()->getVar('hooks');
echo dump($a, 'Hooks');

// $a = memoryUsage(' Last :) ');
// echo dump($a, 'Exec Info');

?>