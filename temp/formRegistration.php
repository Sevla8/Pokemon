<h1>Registration</h1>
<form method="post">
	<div id="pseudoDiv">
		<label for="pseudo">Pseudo</label>
		<input type="text" name="pseudo" id="pseudo" placeholder="Your pseudonym" value="<?php if (isset($_POST['pseudo'])) echo $_POST['pseudo']; ?>">
	</div>
	<div id="emailDiv">
		<label for="email">Email</label>
		<input type="email" name="email" id="email" placeholder="Your email" value="<?php if (isset($_POST['email'])) echo $_POST['email']; ?>">
	</div>
	<div id="emailConfirmationDiv">
		<label for="email">Email confirmation</label>
		<input type="email" name="emailConfirmation" id="emailConfirmation" placeholder="Confirm your email" value="<?php if (isset($_POST['emailConfirmation'])) echo $_POST['emailConfirmation']; ?>">
	</div>
	<div id="passwordDiv">
		<label for="password">Password</label>
		<input type="password" name="password" id="password" placeholder="Your password">
	</div>
	<div id="passwordConfirmationDiv">
		<label for="passwordConfirmation">Password Confirmation</label>
		<input type="password" name="passwordConfirmation" id="passwordConfirmation" placeholder="Confirm your password">
	</div>
	<div id="registerDiv">
		<input type="submit" name="registration" value="registration">
		<input type="reset" name="reset" value="reset">
	</div>
</form>