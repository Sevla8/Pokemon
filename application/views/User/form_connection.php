<h1>Connection</h1>
<form method="post">
	<div id="emailDiv">
		<label for="email">Email</label>
		<input type="text" name="email" id="email" placeholder="Your email" value="<?php echo get_cookie('email') ?>">
	</div>
	<div id="passwordDiv">
		<label for="password">Password</label>
		<input type="password" name="password" id="password" placeholder="Your password">
	</div>
	<div id="connectionDiv">
		<input type="submit" name="connection" value="connection">
		<input type="reset" name="reset" value="reset">
	</div>
<?php echo validation_errors(); ?>
</form>
<a href="<?= site_url('user/inscription/') ?>">Inscription</a>
