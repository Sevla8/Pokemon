<?php
	session_start();
?>
<!doctype html>
<html lang="fr">
	<head>
		<meta charset="utf-8">
		<title>Connection</title>
	</head>
		<body>
			<?php
				include('controlConnection.php');
				$controlConnection = controlConnection();
				if ($controlConnection['status']) {
					echo 'You are connected';
					// header('Location : .php');
				}
				else {
					include('formConnection.php');
					?> <p class="error"> <?php 
					echo $controlConnection['error'];
					?> </p> <?php
				}
			?>
		</body>
</html>
