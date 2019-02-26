<?php
	$query = $db->prepare('SELECT * FROM members WHERE email = ?');
	$query->execute(array($_POST['email']));
	$emailExists = $query->rowCount();
?>