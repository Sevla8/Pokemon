<?php
	try {
		$db = new PDO('mysql:host=localhost;dbname=pokemon;charset=utf8', 'root', '');
	}
	catch (Exception $exception) {
		die('Erreur : ' . $exception->getMessage());
	}
?>