<h1>Challenges</h1>
<?php
foreach ($online as $member) {
	if ($this->session->userdata('id') != $member['id']) {
		echo $member['name'].'<br>';
		if((isset($challenge_from) && !isset($challenge_from[$member['id']]['id_from'])) || !isset($challenge_from))
			echo '<a href="'.site_url('fight/send_challenge/'.$member['id']).'">Challenge '.$member['name'].'</a> <br>';
		if (isset($challenge_from)) {
			foreach ($challenge_from as $value) {
				if ($member['id'] == $value['id_from'])
					echo '<a href="'.site_url('fight/accept_challenge/'.$member['id']).'">Accept Challenge</a> <br>';
			}
		}
	}
}
?>
