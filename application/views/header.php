<header>
	<div class="trainer">
		<div class="avatar"><?= img($trainer['avatar'].'_trainer.gif', $trainer['avatar'].'_avatar') ?></div>
	</div>
	<div class="name">
		<div class="pseudo"><?= $trainer['name'] ?></div>
	</div>
	<div class="item">
		<div class="pokedollar">Pokedollars : <?= $trainer['pokedollar'] ?></div>
		<div class="pokeball">Pokeballs : <?= $trainer['pokeball'] ?></div>
		<div class="potion">Potions : <?= $trainer['potion'] ?></div>
	</div>
</header>
