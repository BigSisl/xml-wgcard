<?php
	$xml = simplexml_load_file('../xml/promotions.xml');
	
	insertIntoXML($xml);
	persistXML('../xml/promotions_new.xml', $xml);
	
	function printXML($xml) {
		foreach ($xml->prof as $prof) {
			echo $prof, ' teaches: ', $prof['teaches'], '<br />';
		}
	}
	
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