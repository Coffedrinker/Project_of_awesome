<?php

function get_pdo(){

	$attributes = array(PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC);
	$host = 'localhost';
	$dbname = 'schoolhelp';
	$dbuser = 'schoolhelp';
	$dbpass = 'foo';
	$dsn ="mysql:host=$host;dbname=$dbname";

	try {
		$pdo = new PDO($dsn,$dbuser,$dbpass, $attributes);	
		if (empty($pdo)) {
			throw new Exception("PDO kunde inte initieras, uppkoppling avbröts.");
		}
	}
	catch(Exception $ex){
		var_dump($ex);
	}
	return $pdo;
}


?>