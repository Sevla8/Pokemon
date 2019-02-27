<!doctype html>
<html lang="fr">
	<head>
		<meta charset="utf-8">
		<title>Activation</title>
	</head>
	<body>
		<?php
			include('controlActivation.php');
			if (controlActivation()['status']) {
				echo 'Your account has been activated';
				// header(Location: .php);
			}
			else {
				?> <p class="error"> <?php
				echo controlActivation()['error'];
				?> </p> <?php
			}
		?>
	</body>
</html>