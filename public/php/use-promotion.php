<?php

include __DIR__ . '/../../lib/xmlutils.php';
include __DIR__ . '/../../lib/ServerManagedXML.php';

$mngXml = new ServerManagedXML(__DIR__ . '/../use-promotion.xml');
if(isset($_GET['token'])) {
    $mngXml->xml->addChild('token', $_GET['token']);
}
$mngXml->print();
