<h1>online</h1>
<?php
foreach ($online as $member) {
	if ($this->session->userdata('id') != $member['id'])
		echo $member['name'].' <a href="'.site_url('fight/send_challenge/'.$member['id']).'">Challenge '.$member['name'].'</a> <br>';
}
?>
