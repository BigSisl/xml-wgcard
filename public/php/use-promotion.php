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
        $mngXml->xml->content->addChild('error', 'Promotion Token nicht gefunden');
    }
    if($wg == null) {
        $mngXml->xml->content->addChild('error', 'WG Barcode nicht gefunden');
    }

    $mngXml->xml->content->addAttribute('token', $token);
    $mngXml->xml->content->addAttribute('barcode', $barcode);

    if(!isset($mngXml->xml->content->error)) {

        $promotion = updatePromotion($mngXml->xml, $promotion, $token);

        $mngXml->xml->content->addChild('token', $token);
        $mngXml->xml->content->addChild('barcode', $barcode);

        sxml_append($mngXml->xml->content, $promotion);
        sxml_append($mngXml->xml->content, $wg);
    }
}

$mngXml->print();

function updatePromotion($outxml, $promotion, $token) {
    $promo_file = __DIR__ . '/../promotions.xml';

    $xml = simplexml_load_file($promo_file);
    $xml->registerXPathNamespace('p', 'http://wgcard.xml.hslu.ch/promotions');
    $promo = $xml->xpath('p:promotion[@id=' . $promotion['id'] . ']')[0];
    $promo->amount -= 1;

    if($promo->amount > 0) {
        insertIntoLogs($xml, $wg, $promotion, 'promotion has been entered.');
        $outxml->content->addChild('message', 'Nutzung der Promotion wurde eingetragen.');
    } else {
        $dom = dom_import_simplexml($xml);
        $dom->removeChild(dom_import_simplexml($promo));

        removeToken($token);

        insertIntoLogs($xml, $wg, $promotion, 'promotion has been removed since fully used.');
        $outxml->content->addChild('message', 'Die Promotion wurde entfernt da maximale Nutzanzahl erreicht wurde.');
    }

    persistXML($promo_file, $xml);
    return $promo;
}

function insertIntoLogs($xml, $wg, $promotion, $content) {
    $logs_file = __DIR__ . '/../../database/logs.xml';
    $xml = simplexml_load_file($logs_file);
    $log = $xml->addChild('log');
    $log->addChild('message', $content);
    sxml_append($log, $promotion);
    $log->addAttribute('wg', $wg['id']);
    $log->addAttribute('promotion', $promotion['id']);
    $log->addAttribute('date', date('Y-m-d h:i:sa'));
    $log->addAttribute('type', 'promotion');

    // TODO validate

    persistXML($logs_file, $xml);
}
