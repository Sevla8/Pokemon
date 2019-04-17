<h1>A wild Pokemon appears !</h1>
<p>A wild <?php echo $wild['name'].' appears !' ?></p>
<div id="enemy">
	<p><?php echo img($wild['id'].'_front.gif', $wild['name']) ?></p>
</div>
<div id="team">
	<?php 
	$i = 0;
	while (!isset($team[$i]))
		$i += 1;
	echo img($team[$i]['id_pokedex'].'_back.gif', $team[$i]['name']);
	?>
</div>
<div id="controls">
	<div id="Attack"><a href="<?php echo site_url('fight/') ?>">Fight</a></div>
	<div id="capacity" hidden>
		<div id="capacity_1">
			<?php
			if (isset($team[$i]['capacity']) && isset($team[$i]['capacity'][$i])) echo $team[$i]['capacity'][$i]['name'];
			?>
		</div>
		<div id="capacity_2">
			<?php

			?>
		</div>
		<div id="capacity_3">
			<?php

			?>
		</div>
		<div id="capacity_4">
			<?php

			?>
		</div>
	</div>
	<div id="Pokeball"><a href="<?php echo site_url('hunt/pokeball') ?>"><?php echo img('pokeball.png', 'pokeball') ?></a></div>
	<div id="Pokedex"><a href="<?php echo site_url('hunt/pokedex/') ?>"><?php echo img('pokedex.png', 'pokedex') ?></a></div>
	<div id="Run"><a href="<?php echo site_url('hunt/') ?>">Run</a></div>
</div>
