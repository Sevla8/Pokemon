<h1>Registration</h1>
<form method="post">
	<div id="pseudoDiv">
		<label for="pseudo">Pseudo</label>
		<input type="text" name="pseudo" id="pseudo" placeholder="Your pseudonym" value="<?php echo set_value('pseudo') ?>">
	</div>
	<div id="emailDiv">
		<label for="email">Email</label>
		<input type="email" name="email" id="email" placeholder="Your email" value="<?php echo set_value('email') ?>">
	</div>
	<div id="emailConfirmationDiv">
		<label for="email">Email confirmation</label>
		<input type="email" name="emailConfirmation" id="emailConfirmation" placeholder="Confirm your email" value="">
	</div>
	<div id="passwordDiv">
		<label for="password">Password</label>
		<input type="password" name="password" id="password" placeholder="Your password">
	</div>
	<div id="passwordConfirmationDiv">
		<label for="passwordConfirmation">Password Confirmation</label>
		<input type="password" name="passwordConfirmation" id="passwordConfirmation" placeholder="Confirm your password">
	</div>
	<div id="startPokemon">
		Starter :
		<label for="bulbi"><?php echo img('1.png', 'Bulbizarre') ?></label>
		<input type="radio" name="pokemon" value="bulbizarre" id="bulbi">
		<label for="sala"><?php echo img('4.png', 'Salameche') ?></label>
		<input type="radio" name="pokemon" value="salameche" id="sala">
		<label for="cara"><?php echo img('7.png', 'Carapuce') ?></label>		
		<input type="radio" name="pokemon" value="carapuce" id="cara">
	</div>
	<div id="avatar">
		Avatar :
		<label for="avatar_1"><?php echo img('1_trainer.gif', 'avatar_1') ?></label>
		<input type="radio" name="avatar" value="1" id="avatar_1">
		<label for="avatar_2"><?php echo img('2_trainer.gif', 'avatar_2') ?></label>
		<input type="radio" name="avatar" value="2" id="avatar_2">
		<label for="avatar_3"><?php echo img('3_trainer.gif', 'avatar_3') ?></label>
		<input type="radio" name="avatar" value="3" id="avatar_3">
		<label for="avatar_4"><?php echo img('4_trainer.gif', 'avatar_4') ?></label>
		<input type="radio" name="avatar" value="4" id="avatar_4">
		<label for="avatar_5"><?php echo img('5_trainer.gif', 'avatar_5') ?></label>
		<input type="radio" name="avatar" value="5" id="avatar_5">
		<label for="avatar_6"><?php echo img('6_trainer.gif', 'avatar_6') ?></label>
		<input type="radio" name="avatar" value="6" id="avatar_6">
		<label for="avatar_7"><?php echo img('7_trainer.gif', 'avatar_7') ?></label>
		<input type="radio" name="avatar" value="7" id="avatar_7">
		<label for="avatar_8"><?php echo img('8_trainer.gif', 'avatar_8') ?></label>
		<input type="radio" name="avatar" value="8" id="avatar_8">
		<label for="avatar_9"><?php echo img('9_trainer.gif', 'avatar_9') ?></label>
		<input type="radio" name="avatar" value="9" id="avatar_9">
		<label for="avatar_10"><?php echo img('10_trainer.gif', 'avatar_10') ?></label>
		<input type="radio" name="avatar" value="10" id="avatar_10">
		<label for="avatar_11"><?php echo img('11_trainer.gif', 'avatar_11') ?></label>
		<input type="radio" name="avatar" value="11" id="avatar_11">
		<label for="avatar_12"><?php echo img('12_trainer.gif', 'avatar_12') ?></label>
		<input type="radio" name="avatar" value="12" id="avatar_12">
		<label for="avatar_13"><?php echo img('13_trainer.gif', 'avatar_13') ?></label>
		<input type="radio" name="avatar" value="13" id="avatar_13">
	</div>
	<div id="registerDiv">
		<input type="submit" name="registration" value="registration">
		<input type="reset" name="reset" value="reset">
	</div>
<?php echo validation_errors(); ?>
</form>
