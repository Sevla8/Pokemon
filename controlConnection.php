<?php
	function controlConnection() {
		$control = array('status' => false, 'error' => '');

		if (isset($_POST['connection'])) {
			if (!empty($_POST['pseudoC']) && !empty($_POST['passwordC'])) {

				$_POST['pseudoC'] = htmlspecialchars($_POST['pseudoC']);
				$_POST['passwordC'] = sha1($_POST['passwordC']);

				include('dbPDO_members.php');
				include('dbConnection_memberExists.php');
				if ($memberExists) {
					include('dbConnection_memberActive.php');
					if ($memberActive) {
						include('dbConnection_session.php');
						$_SESSION['id'] = $memberSession['id'];
						$_SESSION['pseudo'] = $memberSession['pseudo'];
						$_SESSION['email'] = $memberSession['email'];
						$_SESSION['password'] = $memberSession['password'];
						$control['status'] = true;
					}
					else
						$control['error'] = 'Your account have not been activated. Please activate your account first';	
				}
				else
					$control['error'] = 'Member does not exists';
			}
			else
				$control['error'] = 'All fields must be completed';
		}
		return $control;
	}
?>
