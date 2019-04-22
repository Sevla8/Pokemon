<h1>A wild Pokemon appears !</h1>
<p>A wild <?php echo $wild['name'].' appears !' ?></p>
<div class="enemy">
	<p><?php echo $wild['name']; ?></p>
	<p><?php echo img($wild['id'].'_front.gif', $wild['name']) ?></p>
	<p>hp : <?php echo $wild['%_hp']; ?></p>
	<p>lvl : <?php echo $wild['level']; ?></p>
</div>
<div class="team">
	<?php echo img($team[$in_fight]['id_pokedex'].'_back.gif', $team[$in_fight]['name']); ?>
</div>
<div class="controls">
	<div>
		<a href="<?php echo site_url('hunt/attack/0') ?>"><input class="capacity" type="button" name="capacity_1" value="<?php if (isset($team[$in_fight]['capacity']) && isset($team[$in_fight]['capacity'][0])) echo $team[$in_fight]['capacity'][0]['name'].' '.$team[$in_fight]['capacity'][0]['nb_pp'].'/'.$team[$in_fight]['capacity'][0]['pp']; ?>"></a>
		<a href="<?php echo site_url('hunt/attack/1') ?>"><input class="capacity" type="button" name="capacity_2" value="<?php if (isset($team[$in_fight]['capacity']) && isset($team[$in_fight]['capacity'][1])) echo $team[$in_fight]['capacity'][1]['name'].' '.$team[$in_fight]['capacity'][1]['nb_pp'].'/'.$team[$in_fight]['capacity'][1]['pp']; ?>"></a>
		<a href="<?php echo site_url('hunt/attack/2') ?>"><input class="capacity" type="button" name="capacity_3" value="<?php if (isset($team[$in_fight]['capacity']) && isset($team[$in_fight]['capacity'][2])) echo $team[$in_fight]['capacity'][2]['name'].' '.$team[$in_fight]['capacity'][2]['nb_pp'].'/'.$team[$in_fight]['capacity'][2]['pp']; ?>"></a>
		<a href="<?php echo site_url('hunt/attack/3') ?>"><input class="capacity" type="button" name="capacity_4" value="<?php if (isset($team[$in_fight]['capacity']) && isset($team[$in_fight]['capacity'][3])) echo $team[$in_fight]['capacity'][3]['name'].' '.$team[$in_fight]['capacity'][3]['nb_pp'].'/'.$team[$in_fight]['capacity'][3]['pp']; ?>"></a>
	</div>
	<div class="Pokeball">
		<a href="<?php echo site_url('hunt/pokeball') ?>"><?php echo img('pokeball.png', 'pokeball') ?></a>
	</div>
	<div class="Pokedex">
		<a href="<?php echo site_url('hunt/pokedex') ?>"><?php echo img('pokedex.png', 'pokedex') ?></a>
	</div>
	<div class="Potion">
		<a href="<?php echo site_url('hunt/potion') ?>"><?php echo img('potion.png', 'potion') ?></a>
	</div>
	<div class="Run"><a href="<?php echo site_url('hunt/') ?>">Run</a></div>
</div>
