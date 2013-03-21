<?php
/*======================================================================*\
||                 Cybershade CMS - Your CMS, Your Way                  ||
\*======================================================================*/
defined('INDEX_CHECK') or die('Error: Cannot access directly.');

class Details_core extends Core_Classes_Module implements Core_Classes_baseDetails{

    public function details(){
        return array(
            'version'              => '',
            'since'                => '',
            'min_version_required' => '1.0.0',

            'author'               => 'xLink',
            'homepage_url'         => 'http://cybershade.org',
            'repo_url'             => 'http://github.com/cybershade/cscms/',
        );
    }

    public function getBlocks(){
        return array(
            'login' => 'login_block'
        );
    }

    public function install(){


    }

    public function uninstall(){

    }

}
?>