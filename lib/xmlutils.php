<?php

/**
 * Store a SimpleXMLElement in the given file path.
 * Warning: then file is OVERWRITTEN.
 * White space is not kept, and the XML is
 * reformatted and re-indented using two spaces.
 *
 * @param string path to the file were the xml should be stored
 * @param SimpleXMLElement xml xml element to be persisted
 * @return boolean, true if file could be written, false if not
 */
function persistXML($path, SimpleXMLElement $xml) {
    $dom = new DOMDocument("1.0");
    $dom->preserveWhiteSpace = false;
    $dom->formatOutput = true;
    $dom->loadXML($xml->asXML());

    return !!file_put_contents($path, $dom->saveXML());
}

/**
 * Validates a SimpleXMLElement in memory.
 *
 * @param SimpleXMLElement xml element to be validated
 * @param string xsd_path to the schema file used to validate the xml
 * @reeturn boolean whether the given xml is valid
 */
function validateXML(SimpleXMLElement $xml, $xsd_path){
    $xmlDoc = new DOMDocument();
    $xmlDoc->loadXML($xml->asXML());
    return !!$xmlDoc->schemaValidate($xsd_path);
}

