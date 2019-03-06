<?php
	$query = $db->prepare('SELECT * FROM membre WHERE pseudo = ? AND password = ? AND active = 1');
	$query->execute(array($_POST['pseudoC'], $_POST['passwordC']));
	$memberSession = $query->fetch();
	$query->closeCursor();
?>