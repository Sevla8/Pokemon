<!doctype html>
<html lang="fr">
	<head>
		<meta charset="utf-8">
		<title>Registration</title>
	</head>
		<body>
			<?php
				include('controlRegistration.php');
				if (controlRegistration($_POST)['status']) {
					include('dbPDO_members.php');
					include('dbRegistration_addMember.php');
					echo 'Your account has been created';
				}
				else {
					include('formRegistration.php');
					echo controlRegistration($_POST)['error'];
				}
			?>
		</body>
</html>
