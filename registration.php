<!doctype html>
<html lang="fr">
	<head>
		<meta charset="utf-8">
		<title>Registration</title>
	</head>
		<body>
			<?php
				include('controlRegistration.php');
				if (controlRegistration()['status']) {
					include('dbPDO_members.php');
					include('dbRegistration_addMember.php');
					include('registrationValidation.php');
					echo 'Your account has been created';
					// header("Location: .php");
				}
				else {
					include('formRegistration.php');
					?> <p class="error"> <?php
					echo controlRegistration()['error'];
					?> </p> <?php
				}
			?>
		</body>
</html>
