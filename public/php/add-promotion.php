<?php
    include __DIR__ . '/../../lib/xmlutils.php';
    //error_reporting(0);
    $xml = simplexml_load_file('../promotions.xml');
    $tokens_xml = simplexml_load_file('../../database/promoTokens.xml');
    $out = $object = (object) [
        'message' => '',
        'type' => 'error'
    ];

    $promotion = insertIntoXML($xml);
    $token = insertIntoTokenXML($tokens_xml, $promotion->attributes()->id);

    $xml_new_valid = validateXML($xml, '../schemas/promotions.xsd');
    $tokens_xml_new_valid = validateXML($tokens_xml, '../schemas/promoTokens.xsd');

    #store xml into original xml if validation is ok
    if($xml_new_valid && $tokens_xml_new_valid){
        persistXML('../promotions.xml', $xml);
        persistXML('../../database/promoTokens.xml', $tokens_xml);
        $object->message = <<<EOT
Promotion wurde erfolgreich erstellt.

Ihr Zugriffstoken für diese Promotion (bitte speichern):

EOT;
        $object->message .= (string)$token;
        $object->type = "success";
    }
    else{
        $object->message = "validation failed";
    }

    function insertIntoTokenXML($xml, $promo_id) {
        // secure random number generation, 64 bit.
        // this is not feasibly brute-forcable, not even by
        // this application itself and won't collide
        $token = $xml->addChild('token', bin2hex(random_bytes(16)));
        $token->addAttribute('promotion-id', $promo_id);
        return $token;
    }

    function generateNewId($xml) {
        $xml->registerXPathNamespace('p', 'http://wgcard.xml.hslu.ch/promotions');
        $ids = array_map(function($e) {
            return (int)$e->id;
        }, $xml->xpath("//p:promotion/@id"));
        return $ids ? max($ids) + 1 : 1;
    }

    function insertIntoXML($xml) {
        $promotion = $xml->addChild('promotion', '');
        $provider = $promotion->addChild('provider', '');
        $provider->addChild('name', $_POST['provider']);
        $address = $provider->addChild('address', '');
        $address->addChild('street', $_POST['street']);
        $address->addChild('zip', $_POST['zip']);
        $address->addChild('city', $_POST['city']);

        $promotion->addAttribute('id', generateNewId($xml));
        $promotion->addAttribute('added', date('Y-m-d'));
        $promotion->addChild('name', $_POST['name']);
        $promotion->addChild('description', $_POST['description']);
        $promotion->addChild('discount', $_POST['discount']);
        $promotion->addChild('amount', $_POST['amount']);
        return $promotion;
    }

    header('Content-Type: application/json');
    echo json_encode($out);
?>
