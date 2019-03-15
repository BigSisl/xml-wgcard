<?php
    include __DIR__ . '/../../lib/xmlutils.php';
    //error_reporting(0);
    $xml = simplexml_load_file('../wgs.xml');
    $barcodes_xml = simplexml_load_file('../../database/barcodes.xml');

    $wg = insertIntoXML($xml);
    insertIntoTokenXML($barcodes_xml, $wg->attributes()->id);

    $xml_new_valid = validateXML($xml, '../schemas/wgs.xsd');
    $barcodes_xml_new_valid = validateXML($barcodes_xml, '../schemas/barcodes.xsd');

    #store xml into original xml if validation is ok
    if($xml_new_valid && $barcodes_xml_new_valid){
        persistXML('../wgs.xml', $xml);
        persistXML('../../database/barcodes.xml', $barcodes_xml);
        echo "wg was successfully added";
    }
    else{
        echo "validation failed";
    }

    function insertIntoTokenXML($xml, $wg_id) {
        // secure random number generation, 64 bit.
        // this is not feasibly brute-forcable, not even by
        // this application itself and won't collide
        $barcode = $xml->addChild('barcode', bin2hex(random_bytes(8)));
        $barcode ->addAttribute('wg-id', $wg_id);
        return $barcode;
    }

    function generateNewId($xml) {
        $xml->registerXPathNamespace('w', 'http://wgcard.xml.hslu.ch/wgs');
        $ids = array_map(function($e) {
            return (int)$e->id;
        }, $xml->xpath("//w:wg/@id"));
        return $ids ? max($ids) + 1 : 1;
    }

    function insertIntoXML($xml) {
        $wg = $xml->addChild('wg', '');
        $wg->addAttribute('id', generateNewId($xml));

        $wg_members = $wg->addChild('wg-members', '');

        for ($i = 1; $i <= $_POST['membercount']; $i++){
            $wg_member = $wg_members->addChild('wg-member', '');
            insertWgMember($wg_member, $i);
        }

        $wg->addChild('alias', $_POST['alias']);

        $address = $wg->addChild('address', '');

        insertWgAddress($address);
        return $wg;
    }
    function insertWgMember($wg_member, $i){
        $person = $wg_member->addChild('person', '');
        insertPerson($person, $i);

        if ($_POST['contactPerson'.$i] == 'on') {
            $wg_member->addChild('contactPerson', 'true');
        }
        else{
            $wg_member->addChild('contactPerson', 'false');
        }
    }

    function insertWgAddress($address){
        $address->addChild('street', $_POST['street']);
        $address->addChild('zip', $_POST['zip']);
        $address->addChild('city', $_POST['city']);
    }

    function insertPerson($person, $i){
        $person->addChild('firstName', $_POST['firstname'.$i]);
        $person->addChild('lastName', $_POST['lastname'.$i]);
        $person->addChild('email', $_POST['mail'.$i]);
        $person->addChild('tel', $_POST['tel'.$i]);
    }

?>
<a href="../get-wgcard.xml">return</a>
