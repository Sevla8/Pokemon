<?php
	function controlActivation() {
		$control = array('status' => false, 'error' => '');

		if (isset($_GET['pseudo']) && isset($_GET['key'])) {
			include('dbPDO_members.php');
			include('dbActivation_memberActive.php');
			if(!$active) {
				if($key == $_GET['key']) {
					include('dbActivation.php');
					$control['status'] = true;
				}
				else 
					$control['error'] = 'Error, your account can not be activated';
			}
			else 
				$control['error'] = 'Your account is already active';
		}
		else 
			$control['error'] = 'Error, your account can not be activated';

		return $control;
	}
?>
