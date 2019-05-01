<h1>Fight</h1>
<div class="enemy">
	<div class="tariner"><?= $enemy_trainer['name'] ?></div>
	<div class="avatar"><?= img($enemy_trainer['avatar'].'_trainer.gif', 'enemy_avatar') ?></div>
	<div class="tariner"><?= $enemy_team[$enemy_in_fight]['name'] ?></div>
	<div class="pokemon"><?= img($enemy_team[$enemy_in_fight]['id_pokedex'].'_front.gif', $team[$enemy_in_fight]['name']) ?></div>
	<div class="tariner">hp : <?= $enemy_team[$enemy_in_fight]['%_hp']/100*$enemy_team[$enemy_in_fight]['hp']*(1+$enemy_team[$enemy_in_fight]['level']/100).'/'.$enemy_team[$enemy_in_fight]['hp']*(1+$enemy_team[$enemy_in_fight]['level']/100) ?></div>
	<div class="tariner">lvl : <?= $enemy_team[0]['level'] ?></div>
</div>
<div class="ally">
	<p><?php echo img($team[$in_fight]['id_pokedex'].'_back.gif', $team[$in_fight]['name']); ?></p>
	<p>hp : <?php echo $team[$in_fight]['%_hp']/100*$team[$in_fight]['hp']*(1+$team[$in_fight]['level']/100).'/'.$team[$in_fight]['hp']*(1+$team[$in_fight]['level']/100); ?></p>
	<p>lvl : <?php echo $team[$in_fight]['level']; ?></p>
	<p>xp : <?php echo $team[$in_fight]['xp']; ?></p>
	<div>
		<input class="capacity" type="button" name="capacity_1" value="<?php if (isset($team[$in_fight]['capacity']) && isset($team[$in_fight]['capacity'][0])) echo $team[$in_fight]['capacity'][0]['name'].' '.$team[$in_fight]['capacity'][0]['nb_pp'].'/'.$team[$in_fight]['capacity'][0]['pp']; ?>">
		<input class="capacity" type="button" name="capacity_2" value="<?php if (isset($team[$in_fight]['capacity']) && isset($team[$in_fight]['capacity'][1])) echo $team[$in_fight]['capacity'][1]['name'].' '.$team[$in_fight]['capacity'][1]['nb_pp'].'/'.$team[$in_fight]['capacity'][1]['pp']; ?>">
		<input class="capacity" type="button" name="capacity_3" value="<?php if (isset($team[$in_fight]['capacity']) && isset($team[$in_fight]['capacity'][2])) echo $team[$in_fight]['capacity'][2]['name'].' '.$team[$in_fight]['capacity'][2]['nb_pp'].'/'.$team[$in_fight]['capacity'][2]['pp']; ?>">
		<input class="capacity" type="button" name="capacity_4" value="<?php if (isset($team[$in_fight]['capacity']) && isset($team[$in_fight]['capacity'][3])) echo $team[$in_fight]['capacity'][3]['name'].' '.$team[$in_fight]['capacity'][3]['nb_pp'].'/'.$team[$in_fight]['capacity'][3]['pp']; ?>">
	</div>
</div>
<div class="controls">
	<div class="Pokeball">
		<?php echo img('pokeball.png', 'pokeball') ?>
	</div>
	<div class="Pokedex">
		<?php echo img('pokedex.png', 'pokedex') ?>
	</div>
	<div class="Potion">
		<?php echo img('potion.png', 'potion') ?>
	</div>
</div>
</div>
