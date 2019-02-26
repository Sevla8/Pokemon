<?php
	$query = $db->prepare('SELECT * FROM members WHERE pseudo = ?');
	$query->execute(array($_POST['pseudo']));
	$pseudoExists = $query->rowCount() > 0 ? true : false;
?>