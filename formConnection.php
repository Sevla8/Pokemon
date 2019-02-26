<h1>Connexion</h1>
<form method="post">
	<div id="pseudoDivC">
		<label for="pseudoC">Pseudo</label>
		<input type="text" name="pseudoC" id="pseudoC" placeholder="Your pseudonym" value="<?php if (isset($_POST['pseudoC'])) echo $_POST['pseudoC'] ?>">
	</div>
	<div id="passwordDivC">
		<label for="passwordC">Password</label>
		<input type="password" name="passwordC" id="passwordC" placeholder="Your password">
	</div>
	<div id="connectionDiv">
		<input type="submit" name="connection" value="connection">
		<input type="reset" name="reset" value="reset">
	</div>
</form>