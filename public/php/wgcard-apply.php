<?php
	$xml = simplexml_load_file('../wgs.xml');
	
	insertIntoXML($xml);
	
	persistXML('../wgs.xml', $xml);
	
	function insertIntoXML($xml) {
		$wg = $xml->addChild('wg', '');
		$wg_members = $wg->addChild('wg-members', '');
		$wg_member = $wg_members->addChild('wg-member', '');
		$person = $wg_member->addChild('person', '');
		
		$person->addChild('gender', $_POST['gender']);
		$person->addChild('firstName', $_POST['firstname']);
		$person->addChild('lastName', $_POST['lastname']);
		$person->addChild('email', $_POST['mail']);
		$person->addChild('tel', $_POST['tel']);
		
		if ($_POST['contact-person'] == 'on') {
			$wg_member->addChild('contact-person', 'true');
		}
		else{
			$wg_member->addChild('contact-person', 'false');
		}
		
		$wg->addChild('alias', $_POST['alias']);
		
		$address = $wg->addChild('address', '');
		$address->addChild('street', $_POST['street']);
		$address->addChild('zip', $_POST['zip']);
		$address->addChild('city', $_POST['city']);
	}
	
	function persistXML($path, $xml) {
		file_put_contents($path, $xml->asXML());
	}
?>