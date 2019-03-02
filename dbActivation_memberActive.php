<?php
	$query = $db->prepare('SELECT email_validation_key, active FROM membre WHERE pseudo = ?');
	$query->execute(array($_GET['pseudo']));
	$row = $query->fetch();
	$key = $row['email_validation_key'];
	$active = $row['active'];
	$query->closeCursor();
?>
