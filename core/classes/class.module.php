<?php
/*======================================================================*\
||                 Cybershade CMS - Your CMS, Your Way                  ||
\*======================================================================*/
defined('INDEX_CHECK') or die('Error: Cannot access directly.');

/**
 * This class handles everything modules!
 *
 * @version 2.0
 * @since   1.0.0
 * @author  Dan Aldridge
 */
class Core_Classes_Module extends Core_Classes_coreObj{

    public $tplSet  = false;
    public $_module = false;
    public $_method = false;

    /**
     * Set the view for the method.
     *
     * @version 1.0
     * @since   1.0.0
     * @author  Dan Aldridge
     *
     * @param   string $view
     *
     * @return  bool
     */
    public function setView($view='default'){
        $objTPL  = Core_Classes_coreObj::getTPL();
        $objUser = Core_Classes_coreObj::getUser();

        $classPrefix = array('Module_', 'Admin_');
        $module = str_replace($classPrefix, '', $this->getVar('_module') );
        $method = $this->getVar('_method');
        $view   = str_replace('.tpl', '', $view);

        if( is_empty($view) ){
            trigger_error('You did not set a view for this method.');
            return false;
        }

        // Allow Developers to test custom views
        /*if( !empty( $_GET['view'] ) ) { // @TODO Add && IS_ADMIN
            $tempPath = sprintf('modules/%s/views/%s.tpl', $module, $_GET['view']);
            if( is_readable( $tempPath ) ) {
                $view = $_GET['view'];
            } else {
                trigger_error('The view overide you attempted to use dow work');
                return false;
            }
        }*/

        // define a path for the views, & check for an override within there too
        $path = sprintf('modules/%s/views/%s.tpl', $module, $view);
        if( strpos($module, 'Override_') !== false ){
            echo dump($module);
            $override = str_replace('Override_', '', $module);
            $module = str_replace($classPrefix, '', get_parent_class($this));
            $file = sprintf('themes/%1$s/override/%2$s/%3$s.tpl', $objUser->grab('theme'), $module, $view);

            if( is_file($file) ){
                $path = $file;
            }
        }

        if( !is_file($path) ){
            trigger_error($path.' is not a valid path');
            return false;
        }

        $objTPL->set_filenames(array(
            'body' => $path,
        ));

        $this->setVar('viewSet', true);
        return true;
    }

    /**
     * If the view has been set we will parse the body and go from there.
     *
     * @version 1.0
     * @since   1.0.0
     * @author  Dan Aldridge
     *
     * @return  bool
     */
    public function __destruct(){
        // if view hasnt been set, then we dont want to continue
        if( $this->getVar('viewSet') !== true ){
            return false;
        }
        $objTPL = Core_Classes_coreObj::getTPL();

        // if the handle isnt valid, then return
        if( !$objTPL->isHandle('body') ){
            return false;
        }

        //parse the body and store it for later use
        $objTPL->parse('body', false);
    }

    /**
     * Tests to see if we have a body handle in the template system, if so output it
     *
     * @version 1.0
     * @since   1.0.0
     * @author  Dan Aldridge
     */
    public function output(){
        $objTPL = Core_Classes_coreObj::getTPL();

        $page = Core_Classes_coreObj::getPage()->getVar('contents');

        if( !$objTPL->isHandle('body') ){

            if( $page === null ){
                msgDie('FAIL', 'No output received from module.');
            } else {
                echo $page;
            }

        }else{
            if( !is_empty($page) ){
                echo $page;
            }
            echo $objTPL->get_html('body');
        }
    }

    /**
     * Executes if a method has been called to & it dosen't exist
     *
     * @version 1.0
     * @since   1.0.0
     * @author  Dan Aldridge
     *
     * @param   string $method
     * @param   array  $args
     */
    public function __call($method, $args){
        $debug = array(
            'Class Name'    => $this->getClassName(),
            'Method Called' => $method,
            'Method Args'   => $args,
        );
        trigger_error('Error: Method dosen\'t exist.'.dump($debug));
    }


    /**
     * Executes if a static method has been called to & it dosen't exist
     *
     * @version 1.0
     * @since   1.0.0
     * @author  Dan Aldridge
     *
     * @param   string $method
     * @param   array  $args
     */
    public static function __callStatic($method, $args){

        // check to see if we have called a get*() method
        if( substr($method, 0, 3) === 'get' ){

            $className = str_replace('get', '', $method);
            $className = strtolower($className);

            if( self::moduleExists($className) && self::moduleInstalled($className) ){

                $className = 'Module_'.$className;
                if( class_exists($className) && !in_array($className, self::$coreMethods) ){

                    if( !isset(coreObj::$_classes[$className]) ){
                        $className::getInstance($className, $args);
                    }

                    return Core_Classes_coreObj::$_classes[$className];
                }

            }

        }
        $debug = array(
            'Class Name'    => self::getClassName(),
            'Method Called' => $method,
            'Method Args'   => $args,
        );
        trigger_error('Error: Static Method dosen\'t exist.'.dump($debug));
    }


    /**
     * Check if a module exists in the file structure
     *
     * @version 1.1
     * @since   1.0.0
     * @author  Daniel Noel-Davies
     *
     * @param   string     $moduleName
     *
     * @return  bool
     */
    public function moduleExists( $moduleName ) {
        if( is_empty( $moduleName ) || !is_dir( sprintf( '%smodules/%s', cmsROOT, $moduleName ) ) ) {
            return false;
        }

        $file = file_exists( sprintf( '%1$smodules/%2$s/class.%2$s.php', cmsROOT, $moduleName ) );

        return $file;
    }


    /**
     * Check if a module is installed in the database and enabled
     *
     * @version 1.0.0
     * @since   1.0.0
     * @author  Richard Clifford
     *
     * @param   string     $moduleName
     *
     * @return  bool
     */
    public function moduleInstalled( $moduleName ){
        if( is_empty( $moduleName ) ){
            return false;
        }

        // return true here, apparently the module table isnt complete
        return true;

        $objSQL = Core_Classes_coreObj::getDBO();

        $query = $objSQL->queryBuilder()
            ->select('enabled')
            ->from('#__modules')
            ->where('name', '=', $moduleName)
            ->build();

        $result = $objSQL->fetchLine( $query );

        if( $result && isset( $result['enabled'] ) && $result['enabled'] === 1 ){
            return true;
        }

        return false;
    }
}

interface baseDetails{
    public function details();
    public function getBlocks();
    public function install();
    public function uninstall();
}
?>