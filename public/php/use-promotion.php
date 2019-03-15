<?php

include __DIR__ . '/../../lib/xmlutils.php';
include __DIR__ . '/../../lib/ServerManagedXML.php';

// maybe add this to an xml later
$business_api_keys = ['business1'];

$mngXml = new ServerManagedXML(__DIR__ . '/../use-promotion.xml');
if(isset($_GET['token'])) {
    $mngXml->xml->addChild('token', $_GET['token']);
}
$mngXml->print();
die();

// the key should probably also be put into the xml document
if(in_array($_GET['key'], $business_api_keys)) {
    $xml = load_xml_from_request();
} else {
    header('403 Access Denied');
    exit;
}
