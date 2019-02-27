<?php
	$query = $db->prepare('UPDATE members SET active = 1 WHERE pseudo = ?');
	$query->execute(array($_GET['pseudo']));
	$query->execute();
?>
