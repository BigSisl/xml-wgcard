<?php
$WG_BARCODE_FILE = __DIR__ . '/../../database/barcodes.xml';

function validateHexBinary($token) {
    return preg_replace('/[^0-9a-fA-F]/', '', $token);
}

/**
 * return null on no found and throw exception on more then
 * 2 found
 */
function xpathOnlyOne($xml, $xpath, $exception) {
    @$xpathArray = $xml->xpath($xpath);
    if($xpathArray == null) {
        return null;
    }
    if(count($xpathArray) > 1) {
        throw new Exception($exception);
    }
    if(count($xpathArray) > 0) {
        return $xpathArray[0];
    } else {
        return null;
    }
}

/**
 * Return promotion or null on error
 */
function getPromotionByToken($token) {
    $xml = simplexml_load_file(__DIR__ . '/../database/promoTokens.xml');
    $token = validateHexBinary($token);
    $promotion = null;

    $xml->registerXPathNamespace('p', 'http://wgcard.xml.hslu.ch/promoTokens');

    $xpathArray = $xml->xpath('/p:promoTokens/p:token[text()="' . $token . '"]');
    $result = xpathOnlyOne(
        $xml,
        '/p:promoTokens/p:token[text()="' . $token . '"]',
        $token . ' - found twice'
    );

    return getPromotion($result['promotion-id']);
}

function sxml_append(SimpleXMLElement $to, SimpleXMLElement $from) {
    $toDom = dom_import_simplexml($to);
    $fromDom = dom_import_simplexml($from);
    $toDom->appendChild($toDom->ownerDocument->importNode($fromDom, true));
}

function removeToken($token) {
    $promo_token_file = __DIR__ . '/../database/promoTokens.xml';
    $xml = simplexml_load_file($promo_token_file);
    $xml->registerXPathNamespace('p', 'http://wgcard.xml.hslu.ch/promoTokens');
    $res = xpathOnlyOne($xml, 'p:token[text()="' . $token . '"]', '');
    $dom = dom_import_simplexml($xml);
    $dom->removeChild(dom_import_simplexml($res));
    persistXML($promo_token_file, $xml);
}

/**
 * return null if not found
 */
function getPromotion($id) {
    $xml = simplexml_load_file(__DIR__ . '/../public/promotions.xml');

    $xml->registerXPathNamespace('p', 'http://wgcard.xml.hslu.ch/promotions');

    return xpathOnlyOne(
        $xml,
        '/p:promotions/p:promotion[@id=' . $id . ']',
        $id . ' has been found multible times in the promtions xml file'
    );
}

function getWGByBarcode($barcode) {
    $xml = simplexml_load_file(__DIR__ . '/../database/barcodes.xml');
    $xml->registerXPathNamespace('b', 'http://wgcard.xml.hslu.ch/barcodes');
    $barcode = validateHexBinary($barcode);
    $_barcode = xpathOnlyOne(
        $xml,
        'b:barcode[text()="' . $barcode . '"]',
        $barcode . ' - barcode found multible time in barcode.xml'
    );

    return getWG($_barcode['wg-id']);
}

/**
 * Return wg id or -1 on error
 */
function getWG($id) {
    $xml = simplexml_load_file(__DIR__ . '/../public/wgs.xml');

    $xml->registerXPathNamespace('w', 'http://wgcard.xml.hslu.ch/wgs');

    return xpathOnlyOne(
        $xml,
        'w:wg[@id=' . $id . ']',
        $id . ' has been found multible times in the promtions xml file'
    );
}
