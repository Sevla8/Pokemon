<?php

	function controlRegistration(&$array) {
		$control = array('status' => false, 'error' => '');

		if (isset($_POST['register'])) {
			if (!empty($_POST['pseudo']) &&
				!empty($_POST['email']) &&
				!empty($_POST['emailConfirmation']) &&
				!empty($_POST['password']) &&
				!empty($_POST['passwordConfirmation'])) {

				$pseudolength = strlen($_POST['pseudo']);
				if ($pseudolength <= 255) {
					include('dbPDO_members.php');
					include('dbRegistration_pseudoExists.php');
					if (!$pseudoExists) {
						if ($_POST['email'] == $_POST['emailConfirmation']) {
							if (filter_var($_POST['email'], FILTER_VALIDATE_EMAIL)) {
								include('dbRegistration_emailExists.php');
								if (!$emailExists) {
									if ($_POST['password'] == $_POST['passwordConfirmation']) {
										$_POST['pseudo'] = htmlspecialchars($_POST['pseudo']);
										$_POST['email'] = htmlspecialchars($_POST['email']);
										$_POST['password'] = sha1($_POST['password']);

										$control['status'] = true;
									}
									else 
										$control['error'] = 'Your passwords do not match';
								}
								else 
									$control['error'] = 'This email is already used';
							}
							else
								$control['error'] = 'Your email is invalid';
						}
						else 
							$control['error'] = 'Your emails do not match';
					}
					else
						$control['error'] = 'This pseudonym is already used';	
				}
				else {
					$control['error'] = 'Your pseudo must not exceed 255 characters';
				}
			}
			else 
				$control['error'] = 'All fields must be completed';
		}
		return $control;
	}

?>