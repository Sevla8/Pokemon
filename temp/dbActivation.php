<?php
	$query = $db->prepare('UPDATE membre SET active = 1 WHERE pseudo = ?');
	$query->execute(array($_GET['pseudo']));
	$query->execute();
?>
