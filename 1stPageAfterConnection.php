<?php
	session_start();
	if (isset($_SESSION['pseudo'])) {
		setcookie('pseudo', $_SESSION['pseudo'], time() + 60*60*24*7, null, null, false, true);
	}
?>