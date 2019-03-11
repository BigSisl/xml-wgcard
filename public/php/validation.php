<?php
    function validation($xml, $xsd){
        $data = file_get_contents($xml);
        $xmlDoc = new DOMDocument();
        $xmlDoc->loadXML($data);
        return validateXML($xmlDoc, $xsd);
    }

    function validateXML($xml, $xsd){
        if(!$xml->schemaValidate($xsd)){
            return false;
        }
        else{
            return true;
        }
    }
?>