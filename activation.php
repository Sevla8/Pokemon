<?php
	include('dbPDO_members.php');
	$query = $db->prepare('SELECT email_validation_key, active FROM members WHERE pseudo = ?');
	$query->execute(array($_GET['pseudo']));
	$row = $query->fetch();

		$key = $row['email_validation_key'];
		$active = $row['active'];

	if($active) {
	     echo 'Your account is already active';
	}
	else {
		if($key == $_GET['key']) {	
	        echo 'Your account has been activated';
			$query = $db->prepare('UPDATE members SET active = 1 WHERE pseudo = ?');
			$query->execute(array($_GET['pseudo']));
			$query->execute();
			?> <p>
					<a href="connection.php">Follow this link to go to connection page</a>
				</p>
			<?php
		}
		else
			echo 'Error, your account can not be activated';
	}
?>
