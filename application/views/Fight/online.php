<h1>online</h1>
<?php
foreach ($online as $member) {
	if ($this->session->userdata('id') != $member['id'])
		echo $member['pseudo'].' <a href="'.site_url('fight/send_challenge/'.$member['id']).'">Challenge '.$member['pseudo'].'</a> <br>';
}
?>
