<?php
    include __DIR__ . '/../../lib/xmlutils.php';
    //error_reporting(0);
    $xml = simplexml_load_file('../wgs.xml');

    insertIntoXML($xml);

    $xml_new_valid = validateXML($xml, '../schemas/wgs.xsd');

    #store xml into original xml if validation is ok
    if($xml_new_valid){
        persistXML('../wgs.xml', $xml);
        echo "wg was successfully added";
    }
    else{
        echo "validation failed";
    }

    function insertIntoXML($xml) {
        $xml->registerXPathNamespace('w', 'http://wgcard.xml.hslu.ch/wgs');
        $ids = array_map(function($e) {
            return (int)$e->id;
        }, $xml->xpath("//w:wg/@id"));
        $new_id = $ids ? max($ids) + 1 : 1;

        $wg = $xml->addChild('wg', '');
        $wg->addAttribute('id', $new_id);

        $wg_members = $wg->addChild('wg-members', '');

        for ($i = 1; $i <= $_POST['membercount']; $i++){
            $wg_member = $wg_members->addChild('wg-member', '');
            insertWgMember($wg_member, $i);
        }

        $wg->addChild('alias', $_POST['alias']);

        $address = $wg->addChild('address', '');

        insertWgAddress($address);
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
