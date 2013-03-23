<?php

//check if we got the page object
if( !isset( $objPage ) ) {
    $objPage = self::getPage();
}
$browserCSSSelectors = explode('/', $browserCSSSelectors);

$objPage->addCSSFile(array(
    'href'     => '/'.root().'assets/styles/bootstrap-min.css',
    'priority' => HIGH
));

$objPage->addCSSFile(array(
    'href'     => '/'.root().'assets/styles/font-awesome.css',
    'priority' => HIGH
));
if( in_array('ie', $browserCSSSelectors) && in_array('ie7', $browserCSSSelectors) ){
    $objPage->addCSSFile(array(
        'href'     => '/'.root().'assets/styles/font-awesome-ie7.min.css',
        'priority' => HIGH
    ));
}

// $objPage->addCSSFile(array(
//     'href'     => '/'.root().'assets/styles/default.css',
//     'type'     => 'text/css',
//     'priority' => HIGH
// ));

$objPage->addCSSFile(array(
    'href'     => '/'.root().self::$THEME_ROOT.'assets/styles/style.css',
    'type'     => 'text/css',
    'priority' => HIGH
));

$objPage->addCSSFile(array(
    'href'     => '/'.root().self::$THEME_ROOT.'assets/styles/style-responsive.css',
    'type'     => 'text/css',
    'priority' => HIGH
));

if( in_array('ie', $browserCSSSelectors) && !in_array('ie9', $browserCSSSelectors) ){
    $objPage->addCSSFile(array(
        'href'     => '/'.root().'assets/styles/style-ie.css',
        'type'     => 'text/css',
        'priority' => HIGH
    ));
}

$objPage->addJSFile(array(
    'src' => '/'.root().'assets/javascript/bootstrap.mootools.js',
    'priority' => HIGH
), 'footer');


$objPage->addJSFile(array(
    'src' => '/' . root() . self::$THEME_ROOT . 'assets/javascript/custom.js',
    'priority' => HIGH
), 'footer' ); 

?>