<?php
	$xml = simplexml_load_file('../wgs.xml');
	insertIntoXML($xml);
	persistXML('../wgs.xml', $xml);
	
	function insertIntoXML($xml) {
		$wg = $xml->addChild('wg', '');
		
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
	
	function persistXML($path, $xml) {
		file_put_contents($path, $xml->asXML());
	}
?>

<a href="../get-wgcard.xml">return</a>