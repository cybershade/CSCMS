<?php
/*======================================================================*\
||                 Cybershade CMS - Your CMS, Your Way                  ||
\*======================================================================*/
define('INDEX_CHECK', true);
define('cmsDEBUG', true);
include_once('core/core.php');

// $objPage->setTheme();
// $objPage->setTitle('Test');
// $objPage->buildPage();
// $objPage->showHeader(); // lol i am editing that o.O

$var = $objSession->createSession();

echo dump( $var );

?>