<?php
	$query = $db->prepare('INSERT INTO membre(pseudo, email, password, email_validation_key) VALUES (?, ?, ?, ?)');
	$emailValidationKey = sha1(time());
	$query->execute(array($_POST['pseudo'], $_POST['email'], $_POST['password'], $emailValidationKey));
?>