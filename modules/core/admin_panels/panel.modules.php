<?php
/*======================================================================*\
||                 Cybershade CMS - Your CMS, Your Way                  ||
\*======================================================================*/
defined('INDEX_CHECK') or die('Error: Cannot access directly.');

/**
 * Core ACP Panel
 *
 * @version 1.0
 * @since   1.0.0
 * @author  Dan Aldridge
 */
class Admin_Modules_core_modules extends Admin_Modules_core{

    /**
     * Outputs a table with the currently detected set of modules on
     *
     * @version 1.0
     * @since   1.0.0
     * @author  Dan Aldridge
     *
     * @return  void
     */
    public function modules( ) {
        $objSQL     = Core_Classes_coreObj::getDBO();
        $objTPL     = Core_Classes_coreObj::getTPL();
        $objModule  = Core_Classes_coreObj::getModule();

        $objTPL->set_filenames(array(
            'body'  => cmsROOT . Core_Classes_Page::$THEME_ROOT . 'block.tpl',
            'panel' => cmsROOT. 'modules/core/views/admin/modules/default/module_list.tpl',
        ));

        $files = glob( sprintf( '%smodules/*', cmsROOT ) );

        foreach( $files as $file ) {

            $moduleName = str_replace( 'modules/', '', $file );

            // Determine the status of the module
            if( parent::moduleExists( $moduleName ) === false ) {
                continue;
            }

            $query = $objSQL->queryBuilder()
                        ->select('*')
                        ->from('#__modules')
                        ->where( 'name', '=', $moduleName )
                        ->build();

            $row             = $objSQL->fetchLine( $query );
            $moduleInstalled = parent::moduleInstalled( $moduleName );

            if( empty( $row ) || $moduleInstalled === false ) {

                $details = $objModule->getModuleDetails( $moduleName );

                if( !empty( $details ) ) {
                    $moduleName = $details['name'];
                    $version    = $details['version'];
                    $hash       = md5($details['name']);
                }
            }

            $objTPL->assign_block_vars( 'module', array(
                'NAME'        => $moduleName,
                'VERSION'     => $version,
                'HASH'        => $hash,
                'STATUS'      => ( $moduleInstalled === false ? 'Not Installed' : 'Installed' ),
                'STATUS_ICON' => ( $moduleInstalled === false ? 'default'       : 'success' ),
            ));
        }

        $objTPL->parse('panel', false);
        Core_Classes_coreObj::getAdminCP()->setupBlock('body', array(
            'cols'  => 3,
            'vars'  => array(
                'TITLE'   => 'Module List',
                'CONTENT' => $objTPL->get_html('panel', false),
                'ICON'    => 'icon-th-list',
            ),
        ));
    }


}


?>