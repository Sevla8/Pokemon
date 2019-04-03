<h1>Shop</h1>
<h2>Welcome <?php echo $pseudo; ?> ! Make your choice</h2>
<form method="POST" action="<?php echo site_url('shop/basket') ?>">
	<div id="potion_div">
		<label for="potion">Potion</label>
		<input type="number" name="potion" id="potion" value="0">
		<span>10 poke$</span>
	</div>
	<div id="pokeball_div">
		<label for="pokeball">Pokeball</label>
		<input type="number" name="pokeball" id="pokeball" value="0">
		<span>25 poke$</span>
	</div>
	<div id="submit_div">
		<input type="submit" name="submit" value="buy">
		<input type="reset" name="reset" value="reset">
	</div>
	<div id="total">Total : 0 poke$</div>
</form>
<a href="<?php echo site_url('user/home/') ?>">Home</a>
<script src="<?php echo js_url('shop') ?>"></script>