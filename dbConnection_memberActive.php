<?php
	$query = $db->prepare('SELECT * FROM members WHERE pseudo = ? AND password = ? AND active = 1');
	$query->execute(array($_POST['pseudoC'], $_POST['passwordC']));
	$memberActive = $query->rowCount() > 0 ? true : false;
?>