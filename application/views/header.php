<header>
	<div id="trainer">
		<div id="avatar"><?= img($trainer['avatar'].'_trainer.gif', $trainer['avatar'].'_avatar') ?></div>
	</div>
	<div id="name">
		<div id="pseudo"><?= $trainer['name'] ?></div>
	</div>
	<div id="item">
		<div id="pokedollar">Pokedollars : <?= $trainer['pokedollar'] ?></div>
		<div id="pokeball">Pokeballs : <?= $trainer['pokeball'] ?></div>
		<div id="potion">Potions : <?= $trainer['potion'] ?></div>
	</div>
</header>
