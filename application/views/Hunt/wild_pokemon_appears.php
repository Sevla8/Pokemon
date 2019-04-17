<h1>A wild Pokemon appears !</h1>								<?php print_r($wild) ?>
<p>A wild <?php echo $wild['name'].' appears !' ?></p>
<div class="enemy">
	<?php echo $wild['name']; ?>
	<p><?php echo img($wild['id'].'_front.gif', $wild['name']) ?></p>
	<p>hp : <?php echo $wild['%_hp']; ?></p>
	<p>lvl : <?php echo $wild['level']; ?></p>
</div>
<div class="team">
	<?php 
	$i = 0;
	while (!isset($team[$i]))
		$i += 1;
	echo img($team[$i]['id_pokedex'].'_back.gif', $team[$i]['name']);
	?>
</div>
<div class="controls">
	<div>
		<input class="capacity" type="button" name="capacity_1" value="<?php if (isset($team[$i]['capacity']) && isset($team[$i]['capacity'][0])) echo $team[$i]['capacity'][0]['name']; ?>">
		<input class="capacity" type="button" name="capacity_2" value="<?php if (isset($team[$i]['capacity']) && isset($team[$i]['capacity'][1])) echo $team[$i]['capacity'][1]['name']; ?>">
		<input class="capacity" type="button" name="capacity_3" value="<?php if (isset($team[$i]['capacity']) && isset($team[$i]['capacity'][2])) echo $team[$i]['capacity'][2]['name']; ?>">
		<input class="capacity" type="button" name="capacity_4" value="<?php if (isset($team[$i]['capacity']) && isset($team[$i]['capacity'][3])) echo $team[$i]['capacity'][3]['name']; ?>">
	</div>
	<div class="Pokeball">
		<?php echo img('pokeball.png', 'pokeball') ?>
	</div>
	<div class="Pokedex">
		<?php echo img('pokedex.png', 'pokedex') ?>
		<p hidden="true">
			<?php echo $wild['description']; ?>
		</p>
	</div>
	<div class="Run"><a href="<?php echo site_url('hunt/') ?>">Run</a></div>
</div>
