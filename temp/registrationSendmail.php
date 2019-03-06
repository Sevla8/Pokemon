<?php
	$recipient = $_POST['email'];
	$topic = 'Account activation';
	$header = array('From' => 'inscription@pokemon-wim.com');
	$message = 'Welcome to Pokemon-WIM,
 
To activate your account, please click on the link below
or copy / paste it in your internet browser.
 
http://localhost/Pokemon/activation.php?pseudo='.urlencode($_POST['pseudo']).'&key='.urlencode($emailValidationKey).'
 
 
---------------
This is an automatic email, Thank you to do not answer.';

	mail($recipient, $topic, $message, $header);
?>
