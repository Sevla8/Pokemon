<?php
	$query = $db->prepare('INSERT INTO members(pseudo, email, password) VALUES (?, ?, ?)');
	$query->execute(array($_POST['pseudo'], $_POST['email'], $_POST['password']));
?>