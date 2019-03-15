<?php

include_once __DIR__ . '/../../lib/xmlutils.php';
include_once __DIR__ . '/../../lib/ServerManagedXML.php';
include_once __DIR__ . '/../../lib/HelperFunction.php';

$mngXml = new ServerManagedXML(__DIR__ . '/../use-promotion.xml');

$token = validateHexBinary($_GET['token']);
$barcode = validateHexBinary($_GET['barcode']);

if(isset($token) && !empty($token)) {
    $promotion = getPromotionByToken($token);
    $wg = getWgByBarcode($barcode);

    if($promotion == null) {
        $mngXml->xml->addChild('error', 'Promotion Token nicht gefunden');
    }
    if($wg == null) {
        $mngXml->xml->addChild('error', 'WG Barcode nicht gefunden');
    }

    $mngXml->xml->addAttribute('token', $token);
    $mngXml->xml->addAttribute('barcode', $barcode);



    if(!isset($mngXml->xml->error)) {
        sxml_append($mngXml->xml, $promotion);
        sxml_append($mngXml->xml, $wg);
        $mngXml->xml->addChild('token', $token);
        $mngXml->xml->addChild('barcode', $barcode);
    }
}

$mngXml->print();

function insertIntoLogs($content, $info) {
    $xml = simplexml_load_file(__DIR__ . '/../../database/logs.xml');
    persistXML('../promotions.xml', $xml);
}
