<?php
	$xml = simplexml_load_file('../xml/promotions.xml');
	
	insertIntoXML($xml);
	
	persistXML('../xml/promotions.xml', $xml);
	
	function insertIntoXML($xml) {
		$promotion = $xml->addChild('promotion', '');
		
		$promotion->addChild('name', $_POST['name']);
		$promotion->addChild('description', $_POST['description']);
		$promotion->addChild('discount', $_POST['discount']);
		$promotion->addChild('provider', $_POST['provider']);
	}
	
	function persistXML($path, $xml) {
		file_put_contents($path, $xml->asXML());
	}
?>