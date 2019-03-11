<?php
    include 'validation.php';
    error_reporting(0);
    $xml = simplexml_load_file('../promotions.xml');
    $out = $object = (object) [
        'message' => '',
        'type' => 'error'
    ];

    insertIntoXML($xml);

    #first store xml into temp xml
    persistXML('../promotions_new.xml', $xml);

    #validate the temp xml
    $xml_new_valid = validation('../promotions_new.xml', '../schemas/promotions.xsd');

    #store xml into original xml if validation is ok
    if($xml_new_valid){
        persistXML('../promotions.xml', $xml);
        $object->message = "promotion wurde erfolgreich erstellt";
        $object->type = "success";
    }
    else{
        $object->message = "validation failed";
    }

    function insertIntoXML($xml) {
        $promotion = $xml->addChild('promotion', '');
        $promotion->addAttribute('added', date('Y-m-d'));
        $promotion->addChild('name', $_POST['name']);
        $promotion->addChild('description', $_POST['description']);
        $promotion->addChild('discount', $_POST['discount']);
        $promotion->addChild('provider', $_POST['provider']);
        $promotion->addChild('amount', $_POST['amount']);
    }

    function persistXML($path, $xml) {
        file_put_contents($path, $xml->asXML());
    }

    echo json_encode($out);
?>
