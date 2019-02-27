<?php
	$query = $db->prepare('SELECT * FROM members WHERE pseudo = ? AND password = ?');
	$query->execute(array($_POST['pseudoC'], $_POST['passwordC']));
	$memberExists = $query->rowCount() > 0 ? true : false;
?>