<?php
/*======================================================================*\
||                 Cybershade CMS - Your CMS, Your Way                  ||
\*======================================================================*/
defined('INDEX_CHECK') or die('Error: Cannot access directly.');

class route extends coreObj{

    public  $route  = '',
            $routes = array();

    /**
     * Constructor
     *
     * @version 1.0
     * @since   1.0
     * @author  Daniel Noel-Davies
     *
     * @return  void
     */
    public function __construct() {
        $this->route = $_GET;

    }

    private function parseURL() {

    }

    public function processRoutes( $routes = array()  ) {
        if( !is_array( $routes ) || is_empty( $routes ) ) {
            return array();
        }
    }

    /**
     * Adds a route structure into the Database
     *
     * @version 1.0
     * @since   1.0
     * @author  Daniel Noel-Davies
     *
     * @param   $module     string  
     *
     * @return  void
     */
    public function addRoute( string $module, array $route ) {

        $values = array();
        $objSQL = coreObj::getDBO();

        echo dump( $route );

        return;

        $query = $objSQL->queryBuilder()
                        ->insertInto('#__routes')
                        ->set($values)
                        ->build();

        // INSERT INTO #__routes (id, module, pattern) VALUES ()
    }

    public function addRoutes( string $module, array $routes ) {
        if( empty( $routes ) )
        {
            return false;
        }

        foreach ( $routes as $name => $route ) {
            $this->addRoute( array( $name => $route ) );
        }
    }

    public function deleteRoute( $id ) {
        $objSQL = coreObj::getDBO();

        $query  = $objSQL->queryBuilder()
                        ->deleteFrom('#__routes')
                        ->where(sprintf('id = %d', $id))
                        //      'id', '=', '%d'
                        ->build();

        return $objSQL->query($query);
    }

    public function toggleRoute( $id, $status = null ) {

        $update = array();
        $objSQL = coreObj::getDBO();
        $query  = $objSQL->queryBuilder();

        if( is_bool( $status ) !== true ) {
            $update['status'] = 'IF(status=1, 0, 1)';
        } else {
            $update['status'] = ( $status === true ? '1' : '0' );
        }

        $query = $query->update('#__routes')
                        ->set($update)
                        ->where(sprintf('id = %d', $id))
                        ->build();

        return $objSQL->query($query);
    }

    public function cacheRoutes() { return;
        //$objCache = coreObj::getCache();
        $objSQL = coreObj::getDBO();

        $query = $objSQL->queryBuilder()->select('*')->from('#__routes')->build();

        $objCache->initCache('routes_db', 'cache_routes.php', $query, $cache);

        echo dump( $cache, 'Cache', 'red' );
    }
}

?>