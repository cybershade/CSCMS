<?php

function recache(){
    if(isset($_GET['_recache'])){
        echo dump($a, 'RECACHE BOOM!');
        $objCache = coreObj::getCache();

        $objCache->remove('stores');
    }
}

$this->addHook('CMS_START', 'recache');
?>