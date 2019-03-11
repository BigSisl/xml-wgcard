<?php

include __DIR__ . '../lib/xmlutils.php';

// maybe add this to an xml later
$business_api_keys = ['business1']; 

// the key should probably also be put into the xml document
if(in_array($_GET['key'], $business_api_keys)) {
    $xml = load_xml_from_request();
} else {
    header('403 Access Denied');
    exit;
}
