<h1>Pokedex</h1>
<form method="POST">
	<label for="search">Pokemon</label>
	<input type="text" name="name" id="search" value="" autocomplete="off">
	<div id="results"></div>
	<input type="submit" name="submit" value="find">
<?php echo validation_errors(); ?>
</form>
<table>
	<caption>Pokedex</caption>
	<thead>
		<tr>
			<th>Appearance</th>
			<th>Id</th>
			<th>Name</th>
			<th>HP</th>
			<th>Attack</th>
			<th>Defense</th>
			<th>Special Attack</th>
			<th>Special Defense</th>
			<th>Speed</th>
			<th>Description</th>
			<th>Caught</th>
		</tr>
	</thead>
	<tbody>

		<?php 
		foreach ($pokemon as $poke) {	
			echo '<tr>';
			echo '<td>'.img($poke['id'].'.png', $poke['name']).'</td>';
			echo '<td>'.$poke['id'].'</td>';
			echo '<td>'.$poke['name'].'</td>';
			echo '<td>'.$poke['hp'].'</td>';
			echo '<td>'.$poke['attack'].'</td>';
			echo '<td>'.$poke['defense'].'</td>';
			echo '<td>'.$poke['sp_attack'].'</td>';
			echo '<td>'.$poke['sp_defense'].'</td>';
			echo '<td>'.$poke['speed'].'</td>';
			echo '<td>'.$poke['description'].'</td>';
			echo '<td>';
			foreach ($caught as $ball) {
				if (in_array($poke['id'], $ball))
					echo img('pokeball.png', 'pokeball').'</td>';
			}
			echo '</tr>';
		}
		?>

	</tbody>
</table>
<a href="<?php echo site_url('user/home'); ?>">Home</a>
<script src="<?php echo js_url('pokedex') ?>"></script>
