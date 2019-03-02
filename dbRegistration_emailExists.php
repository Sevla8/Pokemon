<?php
	$query = $db->prepare('SELECT * FROM membre WHERE email = ?');
	$query->execute(array($_POST['email']));
	$emailExists = $query->rowCount() > 0 ? true : false;
?>