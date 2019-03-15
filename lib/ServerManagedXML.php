<?php

include_once(__DIR__ . "/./xmlutils.php");

/**
 * Simple class which has the goal to load
 * an XML file, enables server side changes
 * and outputs it as the file (adding header information
 * that will make the browser see the file as xml)
 */
class ServerManagedXML {

    public $xml;

    /**
     * @param file Xml file which will change
     */
    function __construct($file) {
        $this->xml = simplexml_load_file($file);
    }

    /**
     * print the update xml with type xml
     */
    function print() {
        header('Content-Type: application/xml');
        print_r($this->xml->asXML());
    }

}

?>