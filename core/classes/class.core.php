<?php
/*======================================================================*\
||                 Cybershade CMS - Your CMS, Your Way                  ||
\*======================================================================*/
defined('INDEX_CHECK') or die('Error: Cannot access directly.');

/**
 *
 *
 * @version     1.0
 * @since       1.0.0
 * @author      xLink
 */
class coreObj {

    public static  $classDirs   = array(), 
                    $_classes    = array(), 
                    $_instances  = array();


    /**    
     * Adds a directory to be scanned for classes to be loaded
     *
     * @version 1.0
     * @since   1.0.0
     * @author  xLink
     *
     * @param   string  $dir
     *
     * @return  array
     */
    public static function addClassDirs($dir){
        if(empty($dir) || !is_string($dir)){ 
            return false; 
        }

        self::$classDirs[$dir] = glob($dir);

        return self::$classDirs;
    }

    /**    
     * Function for Autoloading Classes
     *
     * @version 1.0
     * @since   1.0.0
     * @author  xLink
     *
     * @param   string  $class      Class to load
     *
     * @return  bool
     */
    public static function loadClass($class) {
        //echo dump($class, 'LOADING', 'pink');
        if(empty(self::$classDirs)){ 
            trigger_error('Error: No Directories to scan for class.', E_USER_ERROR); 
        }

        //only use the last part of the class name if it has an underscore
        if(strpos($class, '_') !== false){
            $class = explode('_', $class);
            $class = end($class);
        }
        $class = strtolower($class);

        //loop thru the dirs, trying to match the class with the file
        $dirs = self::$classDirs;
        foreach($dirs as $dir => $files){
            if(!count($files)){ continue; }
            foreach($files as $file){
                if(strpos($file, $class)!==false){ 
                    include_once($file);
                    // echo dump($file, 'LOADED FILE', 'pink');
                    return true;
                }
            }
        }

        trigger_error('Error: No File found for this Class.'.dump($dirs, $class), E_USER_ERROR);
        return false;
    }

    /**    
     * Sets a variable with a value
     *
     * @version 1.0
     * @since   1.0.0
     * @author  xLink
     *
     * @param   string  $var
     * @param   mixed   $value
     */
    public function setVar($var, $value){        
        $this->$var = $value;
    }

    /**
     * Sets multiple variables with values
     *
     * @version 1.0
     * @since   1.0.0
     * @author  xLink
     *
     * @param   array $array
     */
    public function setVars($array){

        if(!is_array($array)){ return false; }

        foreach($array as $k => $v){
            $this->$k = $v;
        }
        return true;
    }

    /**
     * Returns a var's value
     *
     * @version 1.0
     * @since   1.0.0
     * @author  xLink
     *
     * @param   string  $var
     *
     * @return  mixed
     */
    public function getVar($var){
        if(isset($this->$var) && !empty($this->$var)){
            return $this->$var;
        }

        return false;
    }

    /**
     * Returns a normalized array of arguments from the function
     *
     * @version 1.0
     * @since   1.0.0
     * @author  xLink
     *
     * @param   array  This should be func_get_args();
     *
     * @return  array
     */
    public function _getArgs($args){
        $argsCnt = count($args);
        if(!$argsCnt){ return array(); }

        if($argsCnt == 1){
            if(!is_array($args[0])){ return array($args[0]); }

            return $args[0];
        }else{
            $return = array();
            foreach($args as $arg){ $return[] = $arg; }

            return $return;
        }

        return array();
    }

    /**
     * Returns a config variable
     *
     * @version 1.2
     * @since   1.0.0
     * @author  xLink
     *
     * @param   string  $array
     * @param   string  $setting
     * @param   mixed   $default
     *
     * @return  mixed
     */
    public static function config($array=null, $setting=null, $default=null){
        global $config;

        //if no arguments were passed, throw it all out
        if(!func_num_args()){ 
            return $config; 
        }

        //if just an array key was passed and it exists, throw that out
        if(func_num_args()==1 && in_array($array, array_keys($config))){
            return $config[$array];
        }

        //make sure we have something before trying to throw it out
        if(!in_array($array, array_keys($config))){
            return false;
        }

        return doArgs($setting, $default, $config[$array]);
    }

    /**
     * Returns or spawns a new instance of this class.
     * 
     * @version 1.0
     * @since   1.0
     * @author  xLink
     *
     * @param   string      $prefix  Prefix used to distinguish objects.
     *
     * @return  new object
     */
    private static function getInstance($name, $options=array()){

        if (!isset(coreObj::$_classes[$name]) || empty(coreObj::$_classes[$name])){
            $class = self::getStaticClassName();
            coreObj::$_classes[$name] = new $class($name, $options);
        }

        return coreObj::$_classes[$name];
    }

    /**
     * Returns the name of the class this var an instance of
     *
     * @version 1.0
     * @since   1.0.0
     * @author  xLink
     *
     * @return  string
     */
    public function getClassName(){
        return get_called_class();
    }

    /**
     * Returns the name of the class for static calling
     *
     * @version 1.0
     * @since   1.0.0
     * @author  xLink
     *
     * @return  string
     */
    public static function getStaticClassName() {
        return get_called_class();
    }


//
//--SQL
//
    public static function getDBO($driver=null){
        global $errorTPL;

        if(!isset(coreObj::$_classes['database'][$driver])){
            $options = self::config('db');
                if(!$options){ trigger_error('Error: Could not obtain values from teh configuration file. Please ensure it is present.', E_USER_ERROR); }

            $name = $options['driver'];

            //see if we have an override
            $driver = strtolower($driver);
            if(in_array($driver, array('mysql', 'mysqli'))){
                $name = $driver;
            } $name = 'driver_'.$name;

            $options['persistant'] = true;
            $options['debug']      = (cmsDEBUG ? true : false);
            $options['logging']    = is_file(cmsROOT.'cache/ALLOW_LOGGING');

            $objSQL = new $name($options);
                if($objSQL === false){
                    if(!headers_sent()){
                        header('HTTP/1.1 500 Internal Server Error');
                    }
                    hmsgDie('FAIL', 'Error: No DB Avaliable');
                }

            if(!$objSQL->connect()){
                msgDie('FAIL', 
                    sprintf($errorTPL, 'Fatal Error', 
                        'Connecting to SQL failed. '.
                            $objSQL->getVar('errorMsg').
                            (cmsDEBUG ? '<br />'.$objSQL->getError() : NULL)
                    )
                );
            }
            coreObj::$_classes['database'][$name] = $objSQL;
        }

        return coreObj::$_classes['database'][$name];
    }

    public static function getTPL(){
        global $errorTPL;

        if(!isset(coreObj::$_classes['tpl'])){
            $cachePath = cmsROOT.'cache/template/';
            if(is_dir($cachePath) && !is_writable($cachePath)){ 
                @chmod($cachePath, 0775); 
            }

            if(!is_writable($cachePath)){
                trigger_error('Could not set CHMOD permissions on "<i>'.$cachePath.'</i>" set to 775 to continue.', E_USER_ERROR);
            }

            $cacheWritable = (is_writable($cachePath) ? true : false);

            template::getInstance('tpl', array(
                'useCache' => $cacheWritable,
                'cacheDir' => $cachePath,
                'root'     => '.',
            ));
        }

        return coreObj::$_classes['tpl'];
    }

    public static function getPlugins(){
        if(!isset(coreObj::$_classes['plugins'])){
            plugins::getInstance('plugins');
        }

        return coreObj::$_classes['plugins'];
    }

    public static function getPage(){
        if(!isset(coreObj::$_classes['page'])){
            page::getInstance('page');
        }

        return coreObj::$_classes['page'];
    }


}

?>