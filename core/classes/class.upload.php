<?php
/*======================================================================*\
||                 Cybershade CMS - Your CMS, Your Way                  ||
\*======================================================================*/
defined('INDEX_CHECK') or die('Error: Cannot access directly.');

/**
 * Upload class to upload files to a certain location
 */
class Upload extends coreObj {

    /**
     * Directory of the uploads location
     *
     * @access protected
     */
    protected $directory;

    /**
     * The class constructor
     */
    public function __construct(){
        $this->setDirectory();
    }

    /**
     * Process uploads
     *
     * @version     1.0
     * @since       1.0.0
     * @author      Richard Clifford
     *
     * @param       array   $extensions  (optional)
     * @param       int     $size (optional)
     *
     * @return      boolean
     */
     public function doUpload( $extensions = array(), $size = 20000) {

        $destination = $this->getDirectory();
        $allowedExts = array();

        if( !is_empty( $extensions ) ){
            $allowedExts[] = $extensions;
        }

        // Get the current file extension
        $fileName   = secureMe( $_FILES['upload']['name'], 'alphanum' );
        $extension  = end( explode( '.', $fileName ) );
        $fileSize   = $_FILES['upload']['size'];

        // Check to see that the extension is an allowed extension and the filesize is <= the allowed filesize
        if( in_array( $extension, $allowedExts ) && ( $fileSize <= $size ) ){

            if( $_FILES['upload']['error'] > 0 ){

                (cmsDEBUG ? memoryUsage(sprintf(
                    'Upload: Error uploading file, error code: %s',
                    $_FILES['upload']['error']
                )) : '');

                trigger_error( sprintf( 'Upload Failed due to the following error: %s', $_FILES['upload']['error'] ) );
                return false;
            } else {
                if( file_exists( $destination . '/' . $fileName ) ) {
                    trigger_error( sprintf( 'The uploaded file already exists: %s/%s', $destination, $fileName ) );
                    return false;
                } else {
                    $moveFile = move_uploaded_file( $_FILES['upload']['tmp_name'], $destination . '/' . $fileName );

                    // Check if the file was moved correctly
                    if( $moveFile ){
                        $objSQL  = coreObj::getDBO();
                        $objUser = coreObj::getUser();

                        // Setup the data to be inserted into the db
                        $uploadData = array(
                            'uid'        => $objUser->grab('id'),
                            'filename'   => $fileName,
                            'file_type'  => $extension,
                            'timestamp'  => time(),
                            'authorized' => 0,
                            'public'     => 0,
                            'file_size'  => $fileSize,
                        );

                        $query = $objSQL->queryBuilder()
                                        ->insertInto('#__uploads')
                                        ->set( $uploadData )
                                        ->build();

                        $result = $objSQL->query( $query );

                        // If all went well, return true
                        if( $result ){

                            // Add a hook to allow developers to add extra functionality
                            $objPlugins->hook( 'CMS_UPLOADED_FILE', $uploadData );

                            (cmsDEBUG ? memoryUsage('Upload: Successfully uploaded the file') : '');
                            return true;
                        }
                    } else {
                        trigger_error( sprintf('Could not move uploaded file to %s/%s', $destination, $fileName ) );
                        return false;
                    }
                }
            }
        }

        return false;
    }

    /**
     * Sets the upload directory to a specific location, assuming it's writable
     *
     * @version     1.0
     * @since       1.0.0
     * @author      Richard Clifford
     *
     * @param       string   $directory
     *
     * @return      boolean
     */
    public function setDirectory( $directory = '' ){

        $objPlugins->hook( 'CMS_SET_UPLOAD_DIR', $directory );

        if( trim($directory) === '' ){
            (cmsDEBUG ? memoryUsage('Upload: Using default folder') : '');
            $this->directory = sprintf( '%sassets/uploads/all', cmsROOT );
        } else {
            // Checks if the given directory is writable
            if( !file_exists( $directory ) || ( file_exists( $directory ) && !is_writable( $directory ) ) ){

                (cmsDEBUG ? memoryUsage('Upload: Destination folder was not writable') : '');
                trigger_error( sprintf( 'The destination folder was not writable, please chmod it to 0775 : %s',
                    $directory
                ));

                return false;
            } else {
                (cmsDEBUG ? memoryUsage('Upload: Setting upload directory') : '');
                $this->directory = $directory;
                return true;
            }
        }

        return false;
    }

    /**
     * Gets the current upload directory
     *
     * @version     1.0
     * @since       1.0.0
     * @author      Richard Clifford
     *
     * @return      string
     */
    public function getDirectory(){
        return $this->directory;
    }

}

?>
