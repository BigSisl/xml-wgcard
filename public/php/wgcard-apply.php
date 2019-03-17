<?php
    include __DIR__ . '/../../lib/xmlutils.php';
    //error_reporting(0);
    $xml = simplexml_load_file(__DIR__ . '/../../database/wgs.xml');
    $barcodes_xml = simplexml_load_file('../../database/barcodes.xml');
    $host = apache_request_headers()['Host'];

    $out = $object = (object) [
        'message' => 'something failed',
        'open_blank' => '',
        'type' => 'error'
    ];

    $wg = insertIntoXML($xml);
    $barcode = insertIntoBarcodesXML($barcodes_xml, $wg->attributes()->id);

    $xml_new_valid = validateXML($xml, __DIR__ . '/../schemas/wgs.xsd');
    $barcodes_xml_new_valid = @validateXML($barcodes_xml, __DIR__ . '/../schemas/barcodes.xsd');

    #store xml into original xml if validation is ok
    if($xml_new_valid && $barcodes_xml_new_valid){
        persistXML(__DIR__ . '/../../database/wgs.xml', $xml);
        persistXML(__DIR__ . '/../../database/barcodes.xml', $barcodes_xml);

        if(generateWGBarcodePDF($wg, (string)$barcode)) {
            $pdfUrl = 'http://' . $host . '/pdfs/' . (string)$barcode . '.pdf';

            $object->message = $object->message = <<<EOT
WGCard erfolgreich erstellt.

Die WGCard sollte sich automatisch öffnen.
Folgend ist der Link zur WGCard:

EOT;
            $object->open_blank = $pdfUrl;
            $object->message .= $pdfUrl;
            $object->type = 'success';
        } else {
            $object->message = "Fehler beim generiern der WG Karte";
        }
    }
    else{
        $object->message = "validation failed";
    }

    function insertIntoBarcodesXML($xml, $wg_id) {
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

        if ($_POST['contactPerson'] == 'contactPerson'.$i) {
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

    function generateWGBarcodePDF($wg_xml, $barcode) {
        // add schema reference and namespaces else the XSLT won't generate page content
        $wg_xml->addAttribute('xmlns:xsi', "http://www.w3.org/2001/XMLSchema-instance");
        $wg_xml->addAttribute('xmlns', "http://wgcard.xml.hslu.ch/wgs");
        $wg_xml->addAttribute('xsi:schemaLocation', "http://wgcard.xml.hslu.ch/wgs schemas/wg.xsd");

        $pdffile = __DIR__ . '/../pdfs/' . $barcode . '.pdf';
        $pipes= [];
        //pass PATH environment variable else fop cannot be found
        $env = ['PATH' => getenv("PATH")];
        // use the public directory as CWD so the logo in the header can be found
        $cwd =  __DIR__ . '/..';
        $proc = proc_open("fop -xml - -xsl fo/wgcard.xsl -pdf -", [
            0 => ['pipe', 'r'],
            // set stdout directly to pdffile, fop will write there
            1 => ['file', $pdffile, 'wb'],
            2 => ['pipe', 'w'],
        ], $pipes, $cwd, $env);

        if(!is_resource($proc)) {
            return false;
        }

        // write xml file to transform to PDF to stdin
        fwrite($pipes[0], '<?xml version="1.0"?>' . PHP_EOL);
        fwrite($pipes[0], $wg_xml->asXML());
        fclose($pipes[0]);

        $stderr_errors = stream_get_contents($pipes[2]);
        fclose($pipes[2]);
        $exit_code = proc_close($proc);

        if($exit_code != 0) {
            // output stderr errors to the browsers
            echo $stderr_errors;
            return false;
        }

        return true;

    }

    header('Content-Type: application/json');
?>
<?= json_encode($out); ?>
